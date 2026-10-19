00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f851a1d0000                   jne        0x7f4eafe71038
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
00050 0f83df180000                   jae        0x7f4eafe70c35
00056 0fb64c1607                     movzx      ecx, byte ptr [rsi + rdx + 7]
0005b 85c9                           test       ecx, ecx
0005d 0f84f1180000                   je         0x7f4eafe70c54
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
0009a 0f8c18170000                   jl         0x7f4eafe70ab8
000a0 85ff                           test       edi, edi
000a2 0f8c581a0000                   jl         0x7f4eafe70e00
000a8 8b2c24                         mov        ebp, dword ptr [rsp]
000ab 83c5f9                         add        ebp, -7
000ae 443bed                         cmp        r13d, ebp
000b1 0f834d190000                   jae        0x7f4eafe70d04
000b7 458bd5                         mov        r10d, r13d
000ba 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
000c2 4b8b441108                     mov        rax, qword ptr [r9 + r10 + 8]
000c7 4183c0f8                       add        r8d, -8
000cb 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000d3 4183c2f0                       add        r10d, -0x10
000d7 4183f808                       cmp        r8d, 8
000db 0f8c8c170000                   jl         0x7f4eafe70b6d
000e1 85ff                           test       edi, edi
000e3 0f8c631a0000                   jl         0x7f4eafe70e4c
000e9 8b2c24                         mov        ebp, dword ptr [rsp]
000ec 83c5f9                         add        ebp, -7
000ef 443bd5                         cmp        r10d, ebp
000f2 0f834c190000                   jae        0x7f4eafe70d44
000f8 458bc2                         mov        r8d, r10d
000fb 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00103 4f8b740308                     mov        r14, qword ptr [r11 + r8 + 8]
00108 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
0010d 448b4518                       mov        r8d, dword ptr [rbp + 0x18]
00111 4585c0                         test       r8d, r8d
00114 0f844e180000                   je         0x7f4eafe70c68
0011a 448b5d1c                       mov        r11d, dword ptr [rbp + 0x1c]
0011e 418b4b04                       mov        ecx, dword ptr [r11 + 4]
00122 448b4d20                       mov        r9d, dword ptr [rbp + 0x20]
00126 4585c9                         test       r9d, r9d
00129 0f844d180000                   je         0x7f4eafe70c7c
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
00196 0f84d0080000                   je         0x7f4eafe6fd6c
0019c be40000000                     mov        esi, 0x40
001a1 2bf3                           sub        esi, ebx
001a3 3bce                           cmp        ecx, esi
001a5 0f8f09020000                   jg         0x7f4eafe6f6b4
001ab 2bf1                           sub        esi, ecx
001ad c4e2cbf7e8                     shrx       rbp, rax, rsi
001b2 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b7 83f940                         cmp        ecx, 0x40
001ba 0f8d5c1a0000                   jge        0x7f4eafe70f1c
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
001e9 7c34                           jl         0x7f4eafe6f51f
001eb 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
001f0 4183c0c8                       add        r8d, -0x38
001f4 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
001f9 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00201 8b542408                       mov        edx, dword ptr [rsp + 8]
00205 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00209 6690                           nop        
0020b e850c3a8ff                     call       0x7f4eaf8fb860
00210 0f1f840008030000               nop        dword ptr [rax + rax + 0x308]
00218 4889442420                     mov        qword ptr [rsp + 0x20], rax
0021d eb31                           jmp        0x7f4eafe6f550
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
0025c 0f8d3a190000                   jge        0x7f4eafe70e9c
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
00298 0f8d26190000                   jge        0x7f4eafe70ec4
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
002e1 0f8e46160000                   jle        0x7f4eafe70c2d
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
00361 0f8629160000                   jbe        0x7f4eafe70c90
00367 4d63d3                         movsxd     r10, r11d
0036a 4c635c244c                     movsxd     r11, dword ptr [rsp + 0x4c]
0036f 49ffcb                         dec        r11
00372 4d3bda                         cmp        r11, r10
00375 0f8315160000                   jae        0x7f4eafe70c90
0037b 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00380 4585db                         test       r11d, r11d
00383 0f8c03170000                   jl         0x7f4eafe70d8c
00389 448b1424                       mov        r10d, dword ptr [rsp]
0038d 4183c2f9                       add        r10d, -7
00391 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00399 4533db                         xor        r11d, r11d
0039c 4533d2                         xor        r10d, r10d
0039f 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
003a7 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
003af e984020000                     jmp        0x7f4eafe6f938
003b4 8be9                           mov        ebp, ecx
003b6 2bee                           sub        ebp, esi
003b8 666690                         nop        
003bb e8a0c1a8ff                     call       0x7f4eaf8fb860
003c0 0f1f8400b8040001               nop        dword ptr [rax + rax + 0x10004b8]
003c8 4823442428                     and        rax, qword ptr [rsp + 0x28]
003cd 41ba40000000                   mov        r10d, 0x40
003d3 442bd5                         sub        r10d, ebp
003d6 c462d1f7d8                     shlx       r11, rax, rbp
003db c462abf7942498000000           shrx       r10, qword ptr [rsp + 0x98], r10
003e5 4d0bda                         or         r11, r10
003e8 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
003ed 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
003f2 e9e2fdffff                     jmp        0x7f4eafe6f4d9
003f7 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
003ff 4f8b540208                     mov        r10, qword ptr [r10 + r8 + 8]
00404 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00409 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00411 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00416 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
0041a 896c2410                       mov        dword ptr [rsp + 0x10], ebp
0041e 6690                           nop        
00420 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00427 83fd40                         cmp        ebp, 0x40
0042a 0f8d04090000                   jge        0x7f4eafe70034
00430 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0043a 41ba01000000                   mov        r10d, 1
00440 c442d1f7d2                     shlx       r10, r10, rbp
00445 49ffca                         dec        r10
00448 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00450 458bda                         mov        r11d, r10d
00453 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0045a 83fd40                         cmp        ebp, 0x40
0045d 0f8db1090000                   jge        0x7f4eafe70114
00463 c4c2d3f7f9                     shrx       rdi, r9, rbp
00468 41ba01000000                   mov        r10d, 1
0046e c442d1f7d2                     shlx       r10, r10, rbp
00473 49ffca                         dec        r10
00476 4d23d1                         and        r10, r9
00479 418bca                         mov        ecx, r10d
0047c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00483 83fd40                         cmp        ebp, 0x40
00486 0f8d880a0000                   jge        0x7f4eafe70214
0048c c4e2d3f7df                     shrx       rbx, rdi, rbp
00491 41ba01000000                   mov        r10d, 1
00497 c442d1f7d2                     shlx       r10, r10, rbp
0049c 49ffca                         dec        r10
0049f 4c23d7                         and        r10, rdi
004a2 458bd2                         mov        r10d, r10d
004a5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004ac 83fd40                         cmp        ebp, 0x40
004af 0f8d630b0000                   jge        0x7f4eafe70318
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
00506 0f8e38070000                   jle        0x7f4eafe6ff44
0050c 4981f8ffffff7f                 cmp        r8, 0x7fffffff
00513 0f8fef0b0000                   jg         0x7f4eafe70408
00519 4181faffff0100                 cmp        r10d, 0x1ffff
00520 0f8fda0c0000                   jg         0x7f4eafe70500
00526 81ffffff0300                   cmp        edi, 0x3ffff
0052c 0f8fa20d0000                   jg         0x7f4eafe705d4
00532 458bc8                         mov        r9d, r8d
00535 4181f900000010                 cmp        r9d, 0x10000000
0053c 0f83660e0000                   jae        0x7f4eafe706a8
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
00571 0f8db0000000                   jge        0x7f4eafe6f927
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
005c7 0f8def0e0000                   jge        0x7f4eafe707bc
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
00608 0f8d460f0000                   jge        0x7f4eafe70854
0060e 41b801000000                   mov        r8d, 1
00614 c44231f7c0                     shlx       r8d, r8d, r9d
00619 41ffc8                         dec        r8d
0061c 4523c3                         and        r8d, r11d
0061f 4503c2                         add        r8d, r10d
00622 4489442468                     mov        dword ptr [rsp + 0x68], r8d
00627 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0062b 0f8d81030000                   jge        0x7f4eafe6fcb2
00631 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00638 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0063d 4423442474                     and        r8d, dword ptr [rsp + 0x74]
00642 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00647 458b5a14                       mov        r11d, dword ptr [r10 + 0x14]
0064b 458b5304                       mov        r10d, dword ptr [r11 + 4]
0064f 453bc2                         cmp        r8d, r10d
00652 0f8324040000                   jae        0x7f4eafe6fd7c
00658 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
0065c 234c2468                       and        ecx, dword ptr [rsp + 0x68]
00660 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00665 458b5114                       mov        r10d, dword ptr [r9 + 0x14]
00669 418b5a04                       mov        ebx, dword ptr [r10 + 4]
0066d 4f8b5cc308                     mov        r11, qword ptr [r11 + r8*8 + 8]
00672 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
00677 3bcb                           cmp        ecx, ebx
00679 0f8385040000                   jae        0x7f4eafe6fe04
0067f 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00684 4423442448                     and        r8d, dword ptr [rsp + 0x48]
00689 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0068e 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
00692 458b4b04                       mov        r9d, dword ptr [r11 + 4]
00696 4d8b54ca08                     mov        r10, qword ptr [r10 + rcx*8 + 8]
0069b 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
006a3 453bc1                         cmp        r8d, r9d
006a6 0f83f0040000                   jae        0x7f4eafe6fe9c
006ac 4f8b54c308                     mov        r10, qword ptr [r11 + r8*8 + 8]
006b1 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006b9 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006c0 ffc5                           inc        ebp
006c2 892c24                         mov        dword ptr [rsp], ebp
006c5 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006c9 0f8d5e030000                   jge        0x7f4eafe6fd2d
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
00791 0f84c5020000                   je         0x7f4eafe6fd5c
00797 4183f83f                       cmp        r8d, 0x3f
0079b 0f8ff30c0000                   jg         0x7f4eafe70794
007a1 bb40000000                     mov        ebx, 0x40
007a6 2b5c243c                       sub        ebx, dword ptr [rsp + 0x3c]
007aa 443bc3                         cmp        r8d, ebx
007ad 7e47                           jle        0x7f4eafe6faf6
007af 458bc8                         mov        r9d, r8d
007b2 442bcb                         sub        r9d, ebx
007b5 83fb40                         cmp        ebx, 0x40
007b8 0f8d0e0f0000                   jge        0x7f4eafe709cc
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
007f4 eb30                           jmp        0x7f4eafe6fb26
007f6 412bd8                         sub        ebx, r8d
007f9 c462e3f78c2498000000           shrx       r9, qword ptr [rsp + 0x98], rbx
00803 4183f840                       cmp        r8d, 0x40
00807 0f8dcf0d0000                   jge        0x7f4eafe708dc
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
00844 0f8cd6fbffff                   jl         0x7f4eafe6f720
0084a 458d5ac0                       lea        r11d, [r10 - 0x40]
0084e 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00853 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00857 83c5f8                         add        ebp, -8
0085a 896c240c                       mov        dword ptr [rsp + 0xc], ebp
0085e 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
00862 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
00866 83c1f0                         add        ecx, -0x10
00869 83f908                         cmp        ecx, 8
0086c 0f8cf2000000                   jl         0x7f4eafe6fc64
00872 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00877 4183c0e8                       add        r8d, -0x18
0087b 443b8424c4000000               cmp        r8d, dword ptr [rsp + 0xc4]
00883 0f826efbffff                   jb         0x7f4eafe6f6f7
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
00957 e8043ab5ff                     call       0x7f4eaf9c3660
0095c 0f1f8400540a0002               nop        dword ptr [rax + rax + 0x2000a54]
00964 85c9                           test       ecx, ecx
00966 7f08                           jg         0x7f4eafe6fc70
00968 4533d2                         xor        r10d, r10d
0096b e994faffff                     jmp        0x7f4eafe6f704
00970 8be9                           mov        ebp, ecx
00972 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
0097a 8b542408                       mov        edx, dword ptr [rsp + 8]
0097e 90                             nop        
0097f e8dcbba8ff                     call       0x7f4eaf8fb860
00984 0f1f84007c0a0003               nop        dword ptr [rax + rax + 0x3000a7c]
0098c 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00991 41c1e303                       shl        r11d, 3
00995 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0099a 41c1e003                       shl        r8d, 3
0099e 452bd8                         sub        r11d, r8d
009a1 4181c3c0000000                 add        r11d, 0xc0
009a8 c462a1f7d0                     shlx       r10, rax, r11
009ad e952faffff                     jmp        0x7f4eafe6f704
009b2 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
009ba 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009c2 4d03da                         add        r11, r10
009c5 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
009cd 4d3bda                         cmp        r11, r10
009d0 7f29                           jg         0x7f4eafe6fcfb
009d2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
009d7 443b9424a4000000               cmp        r10d, dword ptr [rsp + 0xa4]
009df 0f8523120000                   jne        0x7f4eafe70f08
009e5 418bc3                         mov        eax, r11d
009e8 4881c410010000                 add        rsp, 0x110
009ef 5d                             pop        rbp
009f0 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
009f4 0f8728130000                   ja         0x7f4eafe71022
009fa c3                             ret        
009fb 48be40c92ae300000000           movabs     rsi, 0xe32ac940
00a05 6690                           nop        
00a07 e854bba8ff                     call       0x7f4eaf8fb860
00a0c 0f1f8400040b0004               nop        dword ptr [rax + rax + 0x4000b04]
00a14 4885c0                         test       rax, rax
00a17 0f84d7110000                   je         0x7f4eafe70ef4
00a1d 488bf0                         mov        rsi, rax
00a20 4881c410010000                 add        rsp, 0x110
00a27 5d                             pop        rbp
00a28 e93365b5ff                     jmp        0x7f4eaf9c6260
00a2d 4533d2                         xor        r10d, r10d
00a30 4533c0                         xor        r8d, r8d
00a33 4533db                         xor        r11d, r11d
00a36 33c9                           xor        ecx, ecx
00a38 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00a40 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
00a48 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00a50 898c24f4000000                 mov        dword ptr [rsp + 0xf4], ecx
00a57 e9ccfcffff                     jmp        0x7f4eafe6fa28
00a5c 4533d2                         xor        r10d, r10d
00a5f 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
00a67 e9b4f9ffff                     jmp        0x7f4eafe6f720
00a6c 4533db                         xor        r11d, r11d
00a6f 4533d2                         xor        r10d, r10d
00a72 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00a77 e95df7ffff                     jmp        0x7f4eafe6f4d9
00a7c bee4ffffff                     mov        esi, 0xffffffe4
00a81 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a89 448b542408                     mov        r10d, dword ptr [rsp + 8]
00a8e 44891424                       mov        dword ptr [rsp], r10d
00a92 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00a97 44894c2404                     mov        dword ptr [rsp + 4], r9d
00a9c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00aa1 4489542408                     mov        dword ptr [rsp + 8], r10d
00aa6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00aab 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ab0 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00ab5 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00aba 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00abf 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00ac4 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00ac9 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00ace 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00ad3 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00ad8 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00add 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00ae2 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00ae7 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00aec 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00af1 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
00af6 90                             nop        
00af7 e86438b5ff                     call       0x7f4eaf9c3660
00afc 0f1f8400f40b0005               nop        dword ptr [rax + rax + 0x5000bf4]
00b04 bee4ffffff                     mov        esi, 0xffffffe4
00b09 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b11 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b16 44891c24                       mov        dword ptr [rsp], r11d
00b1a 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00b1f 4489442404                     mov        dword ptr [rsp + 4], r8d
00b24 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b29 44895c2408                     mov        dword ptr [rsp + 8], r11d
00b2e 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00b33 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00b38 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00b3d 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00b42 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00b47 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00b4c 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00b51 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00b56 458bd9                         mov        r11d, r9d
00b59 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00b5e 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00b63 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00b68 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00b6d 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00b72 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00b77 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00b7c 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00b81 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00b86 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00b8b 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00b8f e8cc37b5ff                     call       0x7f4eaf9c3660
00b94 0f1f84008c0c0006               nop        dword ptr [rax + rax + 0x6000c8c]
00b9c bee4ffffff                     mov        esi, 0xffffffe4
00ba1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ba9 448b542408                     mov        r10d, dword ptr [rsp + 8]
00bae 44891424                       mov        dword ptr [rsp], r10d
00bb2 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00bb7 44894c2404                     mov        dword ptr [rsp + 4], r9d
00bbc 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00bc1 4489542408                     mov        dword ptr [rsp + 8], r10d
00bc6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00bcb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00bd0 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00bd5 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00bda 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00bdf 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00be4 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00be9 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00bee 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00bf3 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00bf8 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00bfd 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00c02 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00c07 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00c0c 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00c11 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00c16 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00c1b 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00c20 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00c25 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00c2a 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00c2f 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
00c34 666690                         nop        
00c37 e82437b5ff                     call       0x7f4eaf9c3660
00c3c 0f1f8400340d0007               nop        dword ptr [rax + rax + 0x7000d34]
00c44 4533c9                         xor        r9d, r9d
00c47 4d3bc1                         cmp        r8, r9
00c4a bdffffffff                     mov        ebp, 0xffffffff
00c4f 7c08                           jl         0x7f4eafe6ff59
00c51 400f95c5                       setne      bpl
00c55 400fb6ed                       movzx      ebp, bpl
00c59 be45ffffff                     mov        esi, 0xffffff45
00c5e 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
00c66 4c890c24                       mov        qword ptr [rsp], r9
00c6a 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
00c6e 894c240c                       mov        dword ptr [rsp + 0xc], ecx
00c72 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00c7a 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00c7f 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
00c83 894c2414                       mov        dword ptr [rsp + 0x14], ecx
00c87 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00c8c 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00c91 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
00c95 894c2430                       mov        dword ptr [rsp + 0x30], ecx
00c99 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00c9e 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00ca3 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00ca7 894c2438                       mov        dword ptr [rsp + 0x38], ecx
00cab 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00cb0 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
00cb5 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
00cb9 894c2440                       mov        dword ptr [rsp + 0x40], ecx
00cbd 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00cc5 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
00cca 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00cce 894c2450                       mov        dword ptr [rsp + 0x50], ecx
00cd2 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
00cd7 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
00cdc 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
00ce0 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00ce4 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
00ce9 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
00cee 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
00cf6 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
00cfb 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
00d03 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00d08 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00d10 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
00d17 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d1f 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
00d27 e83436b5ff                     call       0x7f4eaf9c3660
00d2c 0f1f8400240e0008               nop        dword ptr [rax + rax + 0x8000e24]
00d34 be45ffffff                     mov        esi, 0xffffff45
00d39 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00d41 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00d46 44891c24                       mov        dword ptr [rsp], r11d
00d4a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00d4f 4489542404                     mov        dword ptr [rsp + 4], r10d
00d54 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00d59 44895c2408                     mov        dword ptr [rsp + 8], r11d
00d5e 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00d66 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00d6b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00d70 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d75 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00d7a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00d7f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00d84 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00d89 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00d8e 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00d93 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00d98 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00d9d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00da2 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00da7 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00dac 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00db1 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00db6 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00dbb 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00dc0 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00dc5 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00dca 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00dcf 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00dd4 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00dd9 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00dde 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00de3 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00de8 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00ded 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00df5 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00dfa 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00e02 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00e07 e85435b5ff                     call       0x7f4eaf9c3660
00e0c 0f1f8400040f0009               nop        dword ptr [rax + rax + 0x9000f04]
00e14 be45ffffff                     mov        esi, 0xffffff45
00e19 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e21 448b542408                     mov        r10d, dword ptr [rsp + 8]
00e26 44891424                       mov        dword ptr [rsp], r10d
00e2a 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00e2f 4489442404                     mov        dword ptr [rsp + 4], r8d
00e34 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00e39 4489542408                     mov        dword ptr [rsp + 8], r10d
00e3e 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00e46 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00e4b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e50 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e55 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00e5a 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00e5f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00e64 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00e69 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00e6e 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00e73 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00e78 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00e7d 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00e82 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00e87 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00e8c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00e91 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00e96 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00e9b 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00ea0 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00ea5 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00eaa 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00eaf 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00eb4 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00eb9 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00ebe 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00ec3 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00ec8 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00ecd 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00ed5 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00eda 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00ee2 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00ee7 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
00eef 4489542478                     mov        dword ptr [rsp + 0x78], r10d
00ef4 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00efc 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00f04 666690                         nop        
00f07 e85434b5ff                     call       0x7f4eaf9c3660
00f0c 0f1f84000410000a               nop        dword ptr [rax + rax + 0xa001004]
00f14 be45ffffff                     mov        esi, 0xffffff45
00f19 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00f21 448b442408                     mov        r8d, dword ptr [rsp + 8]
00f26 44890424                       mov        dword ptr [rsp], r8d
00f2a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00f2f 4489542404                     mov        dword ptr [rsp + 4], r10d
00f34 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00f39 4489442408                     mov        dword ptr [rsp + 8], r8d
00f3e 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00f46 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f4b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f50 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f55 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00f5a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00f5f 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00f64 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00f69 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00f6e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00f73 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00f78 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00f7d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00f82 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00f87 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00f8c 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00f91 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00f96 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00f9b 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
00fa0 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00fa5 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00faa 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00faf 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00fb4 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00fb9 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00fbe 4489442450                     mov        dword ptr [rsp + 0x50], r8d
00fc3 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00fc8 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00fcd 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00fd5 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00fda 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00fe2 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00fe7 448b9424d4000000               mov        r10d, dword ptr [rsp + 0xd4]
00fef 4489542474                     mov        dword ptr [rsp + 0x74], r10d
00ff4 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00ffc 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
01003 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
0100b e85033b5ff                     call       0x7f4eaf9c3660
01010 0f1f84000811000b               nop        dword ptr [rax + rax + 0xb001108]
01018 be45ffffff                     mov        esi, 0xffffff45
0101d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01025 448b442408                     mov        r8d, dword ptr [rsp + 8]
0102a 44890424                       mov        dword ptr [rsp], r8d
0102e 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
01033 44894c2404                     mov        dword ptr [rsp + 4], r9d
01038 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0103d 4489442408                     mov        dword ptr [rsp + 8], r8d
01042 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01047 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0104c 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01051 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01056 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0105b 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01060 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01065 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0106a 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0106f 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01074 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01079 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0107e 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01083 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01088 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
0108d 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01092 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
01097 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0109c 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
010a1 4489442448                     mov        dword ptr [rsp + 0x48], r8d
010a6 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
010ab 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
010b0 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
010b5 4489442450                     mov        dword ptr [rsp + 0x50], r8d
010ba 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
010bf 4c89442458                     mov        qword ptr [rsp + 0x58], r8
010c4 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
010cc 4c89442460                     mov        qword ptr [rsp + 0x60], r8
010d1 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
010d9 4c89442468                     mov        qword ptr [rsp + 0x68], r8
010de 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
010e3 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
010ea 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
010f2 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
010fa 90                             nop        
010fb e86032b5ff                     call       0x7f4eaf9c3660
01100 0f1f8400f811000c               nop        dword ptr [rax + rax + 0xc0011f8]
01108 41b9ffffff7f                   mov        r9d, 0x7fffffff
0110e 4d3bc1                         cmp        r8, r9
01111 bdffffffff                     mov        ebp, 0xffffffff
01116 7c08                           jl         0x7f4eafe70420
01118 400f95c5                       setne      bpl
0111c 400fb6ed                       movzx      ebp, bpl
01120 be45ffffff                     mov        esi, 0xffffff45
01125 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
0112d 4c890c24                       mov        qword ptr [rsp], r9
01131 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
01135 894c240c                       mov        dword ptr [rsp + 0xc], ecx
01139 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
01141 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
01146 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0114b 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
01150 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
01154 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01158 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0115d 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01162 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
01166 894c2434                       mov        dword ptr [rsp + 0x34], ecx
0116a 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0116f 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01174 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
01178 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
0117c 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01181 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01186 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
0118d 894c2444                       mov        dword ptr [rsp + 0x44], ecx
01191 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01196 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0119b 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
0119f 894c2454                       mov        dword ptr [rsp + 0x54], ecx
011a3 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
011a8 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
011ad 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
011b2 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
011b7 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
011bf 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
011c4 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
011cc 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
011d1 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
011d9 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
011e0 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
011e8 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
011f0 666690                         nop        
011f3 e86831b5ff                     call       0x7f4eaf9c3660
011f8 0f1f8400f012000d               nop        dword ptr [rax + rax + 0xd0012f0]
01200 be45ffffff                     mov        esi, 0xffffff45
01205 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0120d 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01212 44890c24                       mov        dword ptr [rsp], r9d
01216 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0121b 44894c2404                     mov        dword ptr [rsp + 4], r9d
01220 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01225 44894c2408                     mov        dword ptr [rsp + 8], r9d
0122a 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
0122f 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01234 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01239 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0123e 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01243 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01248 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
0124d 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01252 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01257 4489442428                     mov        dword ptr [rsp + 0x28], r8d
0125c 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01261 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01266 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0126b 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01270 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01275 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0127a 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
0127f 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01284 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01289 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0128e 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01293 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01298 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0129d 4489442450                     mov        dword ptr [rsp + 0x50], r8d
012a2 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
012a7 4c89442458                     mov        qword ptr [rsp + 0x58], r8
012ac 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
012b4 4c89442460                     mov        qword ptr [rsp + 0x60], r8
012b9 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
012be 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
012c6 90                             nop        
012c7 e89430b5ff                     call       0x7f4eaf9c3660
012cc 0f1f8400c413000e               nop        dword ptr [rax + rax + 0xe0013c4]
012d4 be45ffffff                     mov        esi, 0xffffff45
012d9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
012e1 448b542408                     mov        r10d, dword ptr [rsp + 8]
012e6 44891424                       mov        dword ptr [rsp], r10d
012ea 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
012ef 4489542404                     mov        dword ptr [rsp + 4], r10d
012f4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
012f9 4489542408                     mov        dword ptr [rsp + 8], r10d
012fe 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01303 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01308 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
0130d 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01312 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01317 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0131c 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01321 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01326 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0132b 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01330 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01335 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0133a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0133f 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01344 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01349 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0134e 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01353 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01358 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0135d 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01362 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01367 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
0136c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01371 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01376 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0137b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01380 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01388 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0138d 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01392 89bc2480000000                 mov        dword ptr [rsp + 0x80], edi
01399 6690                           nop        
0139b e8c02fb5ff                     call       0x7f4eaf9c3660
013a0 0f1f84009814000f               nop        dword ptr [rax + rax + 0xf001498]
013a8 be3dffffff                     mov        esi, 0xffffff3d
013ad 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013b5 8b4c2408                       mov        ecx, dword ptr [rsp + 8]
013b9 890c24                         mov        dword ptr [rsp], ecx
013bc 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
013c0 894c2404                       mov        dword ptr [rsp + 4], ecx
013c4 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
013c9 4489442408                     mov        dword ptr [rsp + 8], r8d
013ce 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
013d3 4c89442418                     mov        qword ptr [rsp + 0x18], r8
013d8 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
013dd 448944240c                     mov        dword ptr [rsp + 0xc], r8d
013e2 8b4c2428                       mov        ecx, dword ptr [rsp + 0x28]
013e6 894c2420                       mov        dword ptr [rsp + 0x20], ecx
013ea 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
013ef 4489442424                     mov        dword ptr [rsp + 0x24], r8d
013f4 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
013f8 894c2428                       mov        dword ptr [rsp + 0x28], ecx
013fc 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01401 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01406 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
0140a 894c2430                       mov        dword ptr [rsp + 0x30], ecx
0140e 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01413 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01418 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
0141c 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01420 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
01428 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
0142d 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
01431 894c2448                       mov        dword ptr [rsp + 0x48], ecx
01435 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0143a 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
0143f 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
01443 894c2450                       mov        dword ptr [rsp + 0x50], ecx
01447 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
0144c 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01451 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
01459 4c89442460                     mov        qword ptr [rsp + 0x60], r8
0145e 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
01466 4c89442468                     mov        qword ptr [rsp + 0x68], r8
0146b 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01470 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01478 89bc2490000000                 mov        dword ptr [rsp + 0x90], edi
0147f 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
01487 e8d42eb5ff                     call       0x7f4eaf9c3660
0148c 0f1f840084150010               nop        dword ptr [rax + rax + 0x10001584]
01494 be45ffffff                     mov        esi, 0xffffff45
01499 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014a1 448b542408                     mov        r10d, dword ptr [rsp + 8]
014a6 44891424                       mov        dword ptr [rsp], r10d
014aa 4489442408                     mov        dword ptr [rsp + 8], r8d
014af e8ac2eb5ff                     call       0x7f4eaf9c3660
014b4 0f1f8400ac150011               nop        dword ptr [rax + rax + 0x110015ac]
014bc be45ffffff                     mov        esi, 0xffffff45
014c1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014c9 448b442408                     mov        r8d, dword ptr [rsp + 8]
014ce 44890424                       mov        dword ptr [rsp], r8d
014d2 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
014d7 4489442404                     mov        dword ptr [rsp + 4], r8d
014dc 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
014e1 4489542408                     mov        dword ptr [rsp + 8], r10d
014e6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
014eb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
014f0 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
014f5 448944240c                     mov        dword ptr [rsp + 0xc], r8d
014fa 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
014ff 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01504 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01509 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0150e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01513 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01518 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0151d 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01522 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01527 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0152c 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01531 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01536 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0153b 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01540 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01544 666690                         nop        
01547 e8142eb5ff                     call       0x7f4eaf9c3660
0154c 0f1f840044160012               nop        dword ptr [rax + rax + 0x12001644]
01554 be45ffffff                     mov        esi, 0xffffff45
01559 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01561 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01566 44890c24                       mov        dword ptr [rsp], r9d
0156a 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
0156f 4489442404                     mov        dword ptr [rsp + 4], r8d
01574 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01579 4489442408                     mov        dword ptr [rsp + 8], r8d
0157e 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01583 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01588 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
0158d 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01592 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01597 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0159c 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
015a1 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
015a6 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
015ab 4489442428                     mov        dword ptr [rsp + 0x28], r8d
015b0 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
015b5 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
015ba 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
015bf 4489442430                     mov        dword ptr [rsp + 0x30], r8d
015c4 4489542454                     mov        dword ptr [rsp + 0x54], r10d
015c9 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
015ce 90                             nop        
015cf e88c2db5ff                     call       0x7f4eaf9c3660
015d4 0f1f8400cc160013               nop        dword ptr [rax + rax + 0x130016cc]
015dc be45ffffff                     mov        esi, 0xffffff45
015e1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015e9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
015ee 44891c24                       mov        dword ptr [rsp], r11d
015f2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
015f7 44895c2404                     mov        dword ptr [rsp + 4], r11d
015fc 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01601 4489542408                     mov        dword ptr [rsp + 8], r10d
01606 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0160e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01613 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01618 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0161d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01622 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01627 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0162c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01631 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01636 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0163b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01640 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01645 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0164a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0164f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01654 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01659 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0165e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01663 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01668 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0166d 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01672 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01677 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0167c 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01681 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01686 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0168b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01690 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01695 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0169d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
016a2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
016aa 4c89542468                     mov        qword ptr [rsp + 0x68], r10
016af 4c898c2490000000               mov        qword ptr [rsp + 0x90], r9
016b7 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
016bf e89c2cb5ff                     call       0x7f4eaf9c3660
016c4 0f1f8400bc170014               nop        dword ptr [rax + rax + 0x140017bc]
016cc be45ffffff                     mov        esi, 0xffffff45
016d1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
016d9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
016de 44891c24                       mov        dword ptr [rsp], r11d
016e2 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
016e7 4489542404                     mov        dword ptr [rsp + 4], r10d
016ec 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
016f1 44895c2408                     mov        dword ptr [rsp + 8], r11d
016f6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016fb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01700 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01705 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0170a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0170f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01714 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01719 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0171e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01723 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01728 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0172d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01732 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01737 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0173c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01741 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01746 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0174b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01750 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01755 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0175a 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0175f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01764 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01769 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0176e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01773 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01778 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01780 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01785 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0178d 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01792 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
0179a 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
017a2 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
017a9 6690                           nop        
017ab e8b02bb5ff                     call       0x7f4eaf9c3660
017b0 0f1f8400a8180015               nop        dword ptr [rax + rax + 0x150018a8]
017b8 4585c0                         test       r8d, r8d
017bb 7f07                           jg         0x7f4eafe70ac4
017bd 33c0                           xor        eax, eax
017bf e903e9ffff                     jmp        0x7f4eafe6f3c7
017c4 8954242c                       mov        dword ptr [rsp + 0x2c], edx
017c8 89742428                       mov        dword ptr [rsp + 0x28], esi
017cc 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
017d0 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
017d5 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
017da 897c2410                       mov        dword ptr [rsp + 0x10], edi
017de 448944240c                     mov        dword ptr [rsp + 0xc], r8d
017e3 48894424f8                     mov        qword ptr [rsp - 8], rax
017e8 8b0424                         mov        eax, dword ptr [rsp]
017eb 89442404                       mov        dword ptr [rsp + 4], eax
017ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017f4 48894424f8                     mov        qword ptr [rsp - 8], rax
017f9 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01800 890424                         mov        dword ptr [rsp], eax
01803 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01808 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01810 488bf5                         mov        rsi, rbp
01813 8b542408                       mov        edx, dword ptr [rsp + 8]
01817 418bc8                         mov        ecx, r8d
0181a 90                             nop        
0181b e840ada8ff                     call       0x7f4eaf8fb860
01820 0f1f840018190016               nop        dword ptr [rax + rax + 0x16001918]
01828 41ba40000000                   mov        r10d, 0x40
0182e 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
01833 c4e2a9f7c0                     shlx       rax, rax, r10
01838 48894424f8                     mov        qword ptr [rsp - 8], rax
0183d 8b442404                       mov        eax, dword ptr [rsp + 4]
01841 890424                         mov        dword ptr [rsp], eax
01844 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01849 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
0184e 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
01852 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
01857 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0185c 8b5c241c                       mov        ebx, dword ptr [rsp + 0x1c]
01860 8b742428                       mov        esi, dword ptr [rsp + 0x28]
01864 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01868 e95ae8ffff                     jmp        0x7f4eafe6f3c7
0186d 4585c0                         test       r8d, r8d
01870 7f08                           jg         0x7f4eafe70b7a
01872 4533f6                         xor        r14d, r14d
01875 e98ee8ffff                     jmp        0x7f4eafe6f408
0187a 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0187f 4889442430                     mov        qword ptr [rsp + 0x30], rax
01884 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01888 89742428                       mov        dword ptr [rsp + 0x28], esi
0188c 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01890 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01895 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
0189a 897c2410                       mov        dword ptr [rsp + 0x10], edi
0189e 448944240c                     mov        dword ptr [rsp + 0xc], r8d
018a3 48894424f8                     mov        qword ptr [rsp - 8], rax
018a8 8b0424                         mov        eax, dword ptr [rsp]
018ab 89442404                       mov        dword ptr [rsp + 4], eax
018af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018b4 48894424f8                     mov        qword ptr [rsp - 8], rax
018b9 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
018c0 890424                         mov        dword ptr [rsp], eax
018c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018c8 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
018d0 488bf5                         mov        rsi, rbp
018d3 8b542408                       mov        edx, dword ptr [rsp + 8]
018d7 418bc8                         mov        ecx, r8d
018da 90                             nop        
018db e880aca8ff                     call       0x7f4eaf8fb860
018e0 0f1f8400d8190017               nop        dword ptr [rax + rax + 0x170019d8]
018e8 41ba80000000                   mov        r10d, 0x80
018ee 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
018f3 c462a9f7f0                     shlx       r14, rax, r10
018f8 48894424f8                     mov        qword ptr [rsp - 8], rax
018fd 8b442404                       mov        eax, dword ptr [rsp + 4]
01901 890424                         mov        dword ptr [rsp], eax
01904 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01909 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
0190d 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
01912 8b5c241c                       mov        ebx, dword ptr [rsp + 0x1c]
01916 8b742428                       mov        esi, dword ptr [rsp + 0x28]
0191a 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
0191e 488b442430                     mov        rax, qword ptr [rsp + 0x30]
01923 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01928 e9dbe7ffff                     jmp        0x7f4eafe6f408
0192d 4533db                         xor        r11d, r11d
01930 e985f0ffff                     jmp        0x7f4eafe6fcba
01935 bee4ffffff                     mov        esi, 0xffffffe4
0193a 48ffb42490000000               push       qword ptr [rsp + 0x90]
01942 488f0424                       pop        qword ptr [rsp]
01946 90                             nop        
01947 e8142ab5ff                     call       0x7f4eaf9c3660
0194c 0f1f8400441a0018               nop        dword ptr [rax + rax + 0x18001a44]
01954 be5d000000                     mov        esi, 0x5d
01959 6690                           nop        
0195b e8002ab5ff                     call       0x7f4eaf9c3660
01960 0f1f8400581a0019               nop        dword ptr [rax + rax + 0x19001a58]
01968 bef6ffffff                     mov        esi, 0xfffffff6
0196d 6690                           nop        
0196f e8ec29b5ff                     call       0x7f4eaf9c3660
01974 0f1f84006c1a001a               nop        dword ptr [rax + rax + 0x1a001a6c]
0197c bef6ffffff                     mov        esi, 0xfffffff6
01981 6690                           nop        
01983 e8d829b5ff                     call       0x7f4eaf9c3660
01988 0f1f8400801a001b               nop        dword ptr [rax + rax + 0x1b001a80]
01990 be6effffff                     mov        esi, 0xffffff6e
01995 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0199d 448b542408                     mov        r10d, dword ptr [rsp + 8]
019a2 44891424                       mov        dword ptr [rsp], r10d
019a6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
019ab 4489542408                     mov        dword ptr [rsp + 8], r10d
019b0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019b5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
019ba 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
019bf 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
019c4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
019c9 4489542420                     mov        dword ptr [rsp + 0x20], r10d
019ce 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
019d3 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
019d8 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
019dd 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
019e2 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
019e7 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
019ec 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
019f1 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
019f6 90                             nop        
019f7 e86429b5ff                     call       0x7f4eaf9c3660
019fc 0f1f8400f41a001c               nop        dword ptr [rax + rax + 0x1c001af4]
01a04 bee4ffffff                     mov        esi, 0xffffffe4
01a09 48ffb42490000000               push       qword ptr [rsp + 0x90]
01a11 488f0424                       pop        qword ptr [rsp]
01a15 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
01a1a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a1f 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a26 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01a2a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a2f 895c2428                       mov        dword ptr [rsp + 0x28], ebx
01a33 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01a37 e82429b5ff                     call       0x7f4eaf9c3660
01a3c 0f1f8400341b001d               nop        dword ptr [rax + rax + 0x1d001b34]
01a44 bee4ffffff                     mov        esi, 0xffffffe4
01a49 48ffb42490000000               push       qword ptr [rsp + 0x90]
01a51 488f0424                       pop        qword ptr [rsp]
01a55 48894424f8                     mov        qword ptr [rsp - 8], rax
01a5a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a61 89442418                       mov        dword ptr [rsp + 0x18], eax
01a65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a6a 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01a6e 89542428                       mov        dword ptr [rsp + 0x28], edx
01a72 4889442430                     mov        qword ptr [rsp + 0x30], rax
01a77 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01a7c 666690                         nop        
01a7f e8dc28b5ff                     call       0x7f4eaf9c3660
01a84 0f1f84007c1b001e               nop        dword ptr [rax + rax + 0x1e001b7c]
01a8c bebeffffff                     mov        esi, 0xffffffbe
01a91 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a99 448b542408                     mov        r10d, dword ptr [rsp + 8]
01a9e 44891424                       mov        dword ptr [rsp], r10d
01aa2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01aa7 4489542408                     mov        dword ptr [rsp + 8], r10d
01aac 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ab1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ab6 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01abb 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01ac0 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ac5 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01aca 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01acf 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01ad4 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01ad9 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01ade 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01ae3 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01ae8 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01aed 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01af2 90                             nop        
01af3 e86828b5ff                     call       0x7f4eaf9c3660
01af8 0f1f8400f01b001f               nop        dword ptr [rax + rax + 0x1f001bf0]
01b00 beccffffff                     mov        esi, 0xffffffcc
01b05 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b0d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01b12 44891424                       mov        dword ptr [rsp], r10d
01b16 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01b1b 48894424f8                     mov        qword ptr [rsp - 8], rax
01b20 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b27 89442414                       mov        dword ptr [rsp + 0x14], eax
01b2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b30 895c2418                       mov        dword ptr [rsp + 0x18], ebx
01b34 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01b38 897c242c                       mov        dword ptr [rsp + 0x2c], edi
01b3c 666690                         nop        
01b3f e81c28b5ff                     call       0x7f4eaf9c3660
01b44 0f1f84003c1c0020               nop        dword ptr [rax + rax + 0x20001c3c]
01b4c beccffffff                     mov        esi, 0xffffffcc
01b51 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b59 448b442408                     mov        r8d, dword ptr [rsp + 8]
01b5e 44890424                       mov        dword ptr [rsp], r8d
01b62 48894424f8                     mov        qword ptr [rsp - 8], rax
01b67 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b6e 89442410                       mov        dword ptr [rsp + 0x10], eax
01b72 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b77 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01b7b 89542418                       mov        dword ptr [rsp + 0x18], edx
01b7f 4889442428                     mov        qword ptr [rsp + 0x28], rax
01b84 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01b89 897c2434                       mov        dword ptr [rsp + 0x34], edi
01b8d 6690                           nop        
01b8f e8cc27b5ff                     call       0x7f4eaf9c3660
01b94 0f1f84008c1c0021               nop        dword ptr [rax + rax + 0x21001c8c]
01b9c be45ffffff                     mov        esi, 0xffffff45
01ba1 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01ba6 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01bab 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01bb0 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01bb5 6690                           nop        
01bb7 e8a427b5ff                     call       0x7f4eaf9c3660
01bbc 0f1f8400b41c0022               nop        dword ptr [rax + rax + 0x22001cb4]
01bc4 be45ffffff                     mov        esi, 0xffffff45
01bc9 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01bce 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01bd3 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01bd8 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01bdd 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01be2 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01be7 e87427b5ff                     call       0x7f4eaf9c3660
01bec 0f1f8400e41c0023               nop        dword ptr [rax + rax + 0x23001ce4]
01bf4 bef6ffffff                     mov        esi, 0xfffffff6
01bf9 6690                           nop        
01bfb e86027b5ff                     call       0x7f4eaf9c3660
01c00 0f1f8400f81c0024               nop        dword ptr [rax + rax + 0x24001cf8]
01c08 be5d000000                     mov        esi, 0x5d
01c0d 6690                           nop        
01c0f e84c27b5ff                     call       0x7f4eaf9c3660
01c14 0f1f84000c1d0025               nop        dword ptr [rax + rax + 0x25001d0c]
01c1c be45ffffff                     mov        esi, 0xffffff45
01c21 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c29 448b542408                     mov        r10d, dword ptr [rsp + 8]
01c2e 44891424                       mov        dword ptr [rsp], r10d
01c32 90                             nop        
01c33 e82827b5ff                     call       0x7f4eaf9c3660
01c38 0f1f8400301d0026               nop        dword ptr [rax + rax + 0x26001d30]
01c40 bef6ffffff                     mov        esi, 0xfffffff6
01c45 418be8                         mov        ebp, r8d
01c48 666690                         nop        
01c4b e81027b5ff                     call       0x7f4eaf9c3660
01c50 0f1f8400481d0027               nop        dword ptr [rax + rax + 0x27001d48]
01c58 bef6ffffff                     mov        esi, 0xfffffff6
01c5d 8be9                           mov        ebp, ecx
01c5f e8fc26b5ff                     call       0x7f4eaf9c3660
01c64 0f1f84005c1d0028               nop        dword ptr [rax + rax + 0x28001d5c]
01c6c bef6ffffff                     mov        esi, 0xfffffff6
01c71 418be8                         mov        ebp, r8d
01c74 666690                         nop        
01c77 e8e426b5ff                     call       0x7f4eaf9c3660
01c7c 0f1f8400741d0029               nop        dword ptr [rax + rax + 0x29001d74]
01c84 bef6ffffff                     mov        esi, 0xfffffff6
01c89 6690                           nop        
01c8b e8d026b5ff                     call       0x7f4eaf9c3660
01c90 0f1f8400881d002a               nop        dword ptr [rax + rax + 0x2a001d88]
01c98 bef6ffffff                     mov        esi, 0xfffffff6
01c9d 6690                           nop        
01c9f e8bc26b5ff                     call       0x7f4eaf9c3660
01ca4 0f1f84009c1d002b               nop        dword ptr [rax + rax + 0x2b001d9c]
01cac bef6ffffff                     mov        esi, 0xfffffff6
01cb1 6690                           nop        
01cb3 e8a826b5ff                     call       0x7f4eaf9c3660
01cb8 0f1f8400b01d002c               nop        dword ptr [rax + rax + 0x2c001db0]
01cc0 bef6ffffff                     mov        esi, 0xfffffff6
01cc5 6690                           nop        
01cc7 e89426b5ff                     call       0x7f4eaf9c3660
01ccc 0f1f8400c41d002d               nop        dword ptr [rax + rax + 0x2d001dc4]
01cd4 bef6ffffff                     mov        esi, 0xfffffff6
01cd9 6690                           nop        
01cdb e88026b5ff                     call       0x7f4eaf9c3660
01ce0 0f1f8400d81d002e               nop        dword ptr [rax + rax + 0x2e001dd8]
01ce8 bef6ffffff                     mov        esi, 0xfffffff6
01ced 6690                           nop        
01cef e86c26b5ff                     call       0x7f4eaf9c3660
01cf4 0f1f8400ec1d002f               nop        dword ptr [rax + rax + 0x2f001dec]
01cfc bef6ffffff                     mov        esi, 0xfffffff6
01d01 6690                           nop        
01d03 e85826b5ff                     call       0x7f4eaf9c3660
01d08 0f1f8400001e0030               nop        dword ptr [rax + rax + 0x30001e00]
01d10 eb08                           jmp        0x7f4eafe7101a
01d12 eb06                           jmp        0x7f4eafe7101a
01d14 eb04                           jmp        0x7f4eafe7101a
01d16 eb02                           jmp        0x7f4eafe7101a
01d18 eb00                           jmp        0x7f4eafe7101a
01d1a 488bf0                         mov        rsi, rax
01d1d e9feecffff                     jmp        0x7f4eafe6fd20
01d22 49baf0fce6af4e7f0000           movabs     r10, 0x7f4eafe6fcf0
01d2c 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01d33 e9a8cea8ff                     jmp        0x7f4eaf8fdee0
01d38 e8639aa7ff                     call       0x7f4eaf8eaaa0
01d3d e9dce2ffff                     jmp        0x7f4eafe6f31e
01d42 f4                             hlt        
01d43 f4                             hlt        
01d44 f4                             hlt        
01d45 f4                             hlt        
01d46 f4                             hlt        
01d47 f4                             hlt        
