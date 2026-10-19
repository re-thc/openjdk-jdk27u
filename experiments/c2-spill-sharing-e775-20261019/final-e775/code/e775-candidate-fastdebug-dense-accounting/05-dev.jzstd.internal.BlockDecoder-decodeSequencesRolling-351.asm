00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f8546200000                   jne        0x7ff8d7bd2464
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
00050 0f831f1a0000                   jae        0x7ff8d7bd1e75
00056 0fb64c1607                     movzx      ecx, byte ptr [rsi + rdx + 7]
0005b 85c9                           test       ecx, ecx
0005d 0f84451a0000                   je         0x7ff8d7bd1ea8
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
0009a 0f8c58180000                   jl         0x7ff8d7bd1cf8
000a0 85ff                           test       edi, edi
000a2 0f8c301c0000                   jl         0x7ff8d7bd20d8
000a8 8b2c24                         mov        ebp, dword ptr [rsp]
000ab 83c5f9                         add        ebp, -7
000ae 443bed                         cmp        r13d, ebp
000b1 0f83ed1a0000                   jae        0x7ff8d7bd1fa4
000b7 458bd5                         mov        r10d, r13d
000ba 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
000c2 4b8b441108                     mov        rax, qword ptr [r9 + r10 + 8]
000c7 4183c0f8                       add        r8d, -8
000cb 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000d3 4183c2f0                       add        r10d, -0x10
000d7 4183f808                       cmp        r8d, 8
000db 0f8ccc180000                   jl         0x7ff8d7bd1dad
000e1 85ff                           test       edi, edi
000e3 0f8c4f1c0000                   jl         0x7ff8d7bd2138
000e9 8b2c24                         mov        ebp, dword ptr [rsp]
000ec 83c5f9                         add        ebp, -7
000ef 443bd5                         cmp        r10d, ebp
000f2 0f83001b0000                   jae        0x7ff8d7bd1ff8
000f8 458bc2                         mov        r8d, r10d
000fb 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00103 4f8b740308                     mov        r14, qword ptr [r11 + r8 + 8]
00108 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
0010d 448b4518                       mov        r8d, dword ptr [rbp + 0x18]
00111 4585c0                         test       r8d, r8d
00114 0f84b6190000                   je         0x7ff8d7bd1ed0
0011a 448b5d1c                       mov        r11d, dword ptr [rbp + 0x1c]
0011e 418b4b04                       mov        ecx, dword ptr [r11 + 4]
00122 448b4d20                       mov        r9d, dword ptr [rbp + 0x20]
00126 4585c9                         test       r9d, r9d
00129 0f84c9190000                   je         0x7ff8d7bd1ef8
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
00196 0f84ce080000                   je         0x7ff8d7bd0e6a
0019c be40000000                     mov        esi, 0x40
001a1 2bf3                           sub        esi, ebx
001a3 3bce                           cmp        ecx, esi
001a5 0f8ffd010000                   jg         0x7ff8d7bd07a8
001ab 2bf1                           sub        esi, ecx
001ad c4e2cbf7e8                     shrx       rbp, rax, rsi
001b2 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b7 83f940                         cmp        ecx, 0x40
001ba 0f8dac1c0000                   jge        0x7ff8d7bd226c
001c0 41ba01000000                   mov        r10d, 1
001c6 c442f1f7d2                     shlx       r10, r10, rcx
001cb 49ffca                         dec        r10
001ce 4c23d5                         and        r10, rbp
001d1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
001d6 448bd9                         mov        r11d, ecx
001d9 458bcb                         mov        r9d, r11d
001dc 442b4c240c                     sub        r9d, dword ptr [rsp + 0xc]
001e1 458d5108                       lea        r10d, [r9 + 8]
001e5 4183fa40                       cmp        r10d, 0x40
001e9 7c34                           jl         0x7ff8d7bd061f
001eb 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
001f0 4183c1c8                       add        r9d, -0x38
001f4 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001f9 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00201 8b542408                       mov        edx, dword ptr [rsp + 8]
00205 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00209 90                             nop        
0020a 90                             nop        
0020b e850f6b5ff                     call       0x7ff8d772fc60
00210 0f1f840008030000               nop        dword ptr [rax + rax + 0x308]
00218 4889442420                     mov        qword ptr [rsp + 0x20], rax
0021d eb31                           jmp        0x7ff8d7bd0650
0021f 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00224 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0022c 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00231 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00236 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0023e 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
00246 4489442410                     mov        dword ptr [rsp + 0x10], r8d
0024b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00250 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00255 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00259 83fd20                         cmp        ebp, 0x20
0025c 0f8d3a1b0000                   jge        0x7ff8d7bd219c
00262 c462d3f7542460                 shrx       r10, qword ptr [rsp + 0x60], rbp
00269 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0026e 41bb01000000                   mov        r11d, 1
00274 c44251f7db                     shlx       r11d, r11d, ebp
00279 41ffcb                         dec        r11d
0027c 4d63d3                         movsxd     r10, r11d
0027f 4c23542460                     and        r10, qword ptr [rsp + 0x60]
00284 458bda                         mov        r11d, r10d
00287 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0028c 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00291 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00295 83fd20                         cmp        ebp, 0x20
00298 0f8d3a1b0000                   jge        0x7ff8d7bd21d8
0029e 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
002a6 458b5204                       mov        r10d, dword ptr [r10 + 4]
002aa 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
002b2 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
002b7 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
002bb 458b4304                       mov        r8d, dword ptr [r11 + 4]
002bf 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
002c4 458b5314                       mov        r10d, dword ptr [r11 + 0x14]
002c8 458b5204                       mov        r10d, dword ptr [r10 + 4]
002cc 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
002d1 458b5914                       mov        r11d, dword ptr [r9 + 0x14]
002d5 458b5b04                       mov        r11d, dword ptr [r11 + 4]
002d9 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
002dd 85c9                           test       ecx, ecx
002df 0f8e88170000                   jle        0x7ff8d7bd1e6d
002e5 41ffc8                         dec        r8d
002e8 4489442460                     mov        dword ptr [rsp + 0x60], r8d
002ed 41ffca                         dec        r10d
002f0 4489542464                     mov        dword ptr [rsp + 0x64], r10d
002f5 41ffcb                         dec        r11d
002f8 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
002fd c462d3f7542468                 shrx       r10, qword ptr [rsp + 0x68], rbp
00304 41bb01000000                   mov        r11d, 1
0030a c44251f7db                     shlx       r11d, r11d, ebp
0030f 458bc2                         mov        r8d, r10d
00312 4489442474                     mov        dword ptr [rsp + 0x74], r8d
00317 41ffcb                         dec        r11d
0031a 4d63d3                         movsxd     r10, r11d
0031d 4c23542468                     and        r10, qword ptr [rsp + 0x68]
00322 458bd2                         mov        r10d, r10d
00325 4489542468                     mov        dword ptr [rsp + 0x68], r10d
0032a 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00332 458b9af4000000                 mov        r11d, dword ptr [r10 + 0xf4]
00339 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00341 458b92f0000000                 mov        r10d, dword ptr [r10 + 0xf0]
00348 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00350 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00354 4585db                         test       r11d, r11d
00357 0f86c3170000                   jbe        0x7ff8d7bd1f20
0035d 4d63d3                         movsxd     r10, r11d
00360 4c63d9                         movsxd     r11, ecx
00363 49ffcb                         dec        r11
00366 4d3bda                         cmp        r11, r10
00369 0f83b1170000                   jae        0x7ff8d7bd1f20
0036f 448b542404                     mov        r10d, dword ptr [rsp + 4]
00374 4585d2                         test       r10d, r10d
00377 0f8cd7180000                   jl         0x7ff8d7bd2054
0037d 448b1c24                       mov        r11d, dword ptr [rsp]
00381 4183c3f9                       add        r11d, -7
00385 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0038d 4533db                         xor        r11d, r11d
00390 4533d2                         xor        r10d, r10d
00393 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
0039b 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
003a3 e990020000                     jmp        0x7ff8d7bd0a38
003a8 8be9                           mov        ebp, ecx
003aa 2bee                           sub        ebp, esi
003ac 90                             nop        
003ad 90                             nop        
003ae 90                             nop        
003af e8acf4b5ff                     call       0x7ff8d772fc60
003b4 0f1f8400ac040001               nop        dword ptr [rax + rax + 0x10004ac]
003bc 4823442428                     and        rax, qword ptr [rsp + 0x28]
003c1 41ba40000000                   mov        r10d, 0x40
003c7 442bd5                         sub        r10d, ebp
003ca c462d1f7d8                     shlx       r11, rax, rbp
003cf c462abf7942498000000           shrx       r10, qword ptr [rsp + 0x98], r10
003d9 4d0bda                         or         r11, r10
003dc 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
003e1 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
003e6 e9eefdffff                     jmp        0x7ff8d7bd05d9
003eb 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
003f3 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
003f8 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
003fd 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00405 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0040a 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
0040e 896c2410                       mov        dword ptr [rsp + 0x10], ebp
00412 90                             nop        
00413 90                             nop        
00414 90                             nop        
00415 90                             nop        
00416 90                             nop        
00417 90                             nop        
00418 90                             nop        
00419 90                             nop        
0041a 90                             nop        
0041b 90                             nop        
0041c 90                             nop        
0041d 90                             nop        
0041e 90                             nop        
0041f 90                             nop        
00420 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00427 83fd40                         cmp        ebp, 0x40
0042a 0f8d800a0000                   jge        0x7ff8d7bd12b0
00430 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0043a 41ba01000000                   mov        r10d, 1
00440 c442d1f7d2                     shlx       r10, r10, rbp
00445 49ffca                         dec        r10
00448 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00450 458bda                         mov        r11d, r10d
00453 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0045a 83fd40                         cmp        ebp, 0x40
0045d 0f8d410b0000                   jge        0x7ff8d7bd13a4
00463 c4c2d3f7f9                     shrx       rdi, r9, rbp
00468 41ba01000000                   mov        r10d, 1
0046e c442d1f7d2                     shlx       r10, r10, rbp
00473 49ffca                         dec        r10
00476 4d23d1                         and        r10, r9
00479 418bca                         mov        ecx, r10d
0047c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00483 83fd40                         cmp        ebp, 0x40
00486 0f8d2c0c0000                   jge        0x7ff8d7bd14b8
0048c c4e2d3f7df                     shrx       rbx, rdi, rbp
00491 41ba01000000                   mov        r10d, 1
00497 c442d1f7d2                     shlx       r10, r10, rbp
0049c 49ffca                         dec        r10
0049f 4c23d7                         and        r10, rdi
004a2 458bd2                         mov        r10d, r10d
004a5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004ac 83fd40                         cmp        ebp, 0x40
004af 0f8d1b0d0000                   jge        0x7ff8d7bd15d0
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
00506 0f8e74070000                   jle        0x7ff8d7bd1080
0050c 4981f8ffffff7f                 cmp        r8, 0x7fffffff
00513 0f8fbb0d0000                   jg         0x7ff8d7bd16d4
00519 4181faffff0100                 cmp        r10d, 0x1ffff
00520 0f8fba0e0000                   jg         0x7ff8d7bd17e0
00526 81ffffff0300                   cmp        edi, 0x3ffff
0052c 0f8f960f0000                   jg         0x7ff8d7bd18c8
00532 458bc8                         mov        r9d, r8d
00535 4181f900000010                 cmp        r9d, 0x10000000
0053c 0f836e100000                   jae        0x7ff8d7bd19b0
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
00571 0f8db0000000                   jge        0x7ff8d7bd0a27
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
005c7 0f8de3100000                   jge        0x7ff8d7bd1ab0
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
00608 0f8d4e110000                   jge        0x7ff8d7bd1b5c
0060e 41b801000000                   mov        r8d, 1
00614 c44231f7c0                     shlx       r8d, r8d, r9d
00619 41ffc8                         dec        r8d
0061c 4523c3                         and        r8d, r11d
0061f 4503c2                         add        r8d, r10d
00622 4489442468                     mov        dword ptr [rsp + 0x68], r8d
00627 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0062b 0f8dc0030000                   jge        0x7ff8d7bd0df1
00631 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00638 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0063d 4423442474                     and        r8d, dword ptr [rsp + 0x74]
00642 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00647 458b5a14                       mov        r11d, dword ptr [r10 + 0x14]
0064b 458b5304                       mov        r10d, dword ptr [r11 + 4]
0064f 453bc2                         cmp        r8d, r10d
00652 0f8322040000                   jae        0x7ff8d7bd0e7a
00658 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
0065c 234c2468                       and        ecx, dword ptr [rsp + 0x68]
00660 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00665 458b5114                       mov        r10d, dword ptr [r9 + 0x14]
00669 418b5a04                       mov        ebx, dword ptr [r10 + 4]
0066d 4f8b5cc308                     mov        r11, qword ptr [r11 + r8*8 + 8]
00672 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
00677 3bcb                           cmp        ecx, ebx
00679 0f8399040000                   jae        0x7ff8d7bd0f18
0067f 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00684 4423442448                     and        r8d, dword ptr [rsp + 0x48]
00689 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0068e 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
00692 458b4b04                       mov        r9d, dword ptr [r11 + 4]
00696 4d8b54ca08                     mov        r10, qword ptr [r10 + rcx*8 + 8]
0069b 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
006a3 453bc1                         cmp        r8d, r9d
006a6 0f8318050000                   jae        0x7ff8d7bd0fc4
006ac 4f8b54c308                     mov        r10, qword ptr [r11 + r8*8 + 8]
006b1 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006b9 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006c0 ffc5                           inc        ebp
006c2 892c24                         mov        dword ptr [rsp], ebp
006c5 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006c9 0f8df3020000                   jge        0x7ff8d7bd0dc2
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
00773 448bcd                         mov        r9d, ebp
00776 44038c24d4000000               add        r9d, dword ptr [rsp + 0xd4]
0077e 44038c24d8000000               add        r9d, dword ptr [rsp + 0xd8]
00786 44038c24d0000000               add        r9d, dword ptr [rsp + 0xd0]
0078e 4585c9                         test       r9d, r9d
00791 0f84ed050000                   je         0x7ff8d7bd1184
00797 4183f93f                       cmp        r9d, 0x3f
0079b 0f8fd3060000                   jg         0x7ff8d7bd1274
007a1 41b840000000                   mov        r8d, 0x40
007a7 442b44243c                     sub        r8d, dword ptr [rsp + 0x3c]
007ac 453bc8                         cmp        r9d, r8d
007af 7e48                           jle        0x7ff8d7bd0bf9
007b1 418bc9                         mov        ecx, r9d
007b4 412bc8                         sub        ecx, r8d
007b7 4183f840                       cmp        r8d, 0x40
007bb 0f8d37100000                   jge        0x7ff8d7bd1bf8
007c1 41ba01000000                   mov        r10d, 1
007c7 c442b9f7d2                     shlx       r10, r10, r8
007cc 49ffca                         dec        r10
007cf 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007d7 c4c2f1f7ea                     shlx       rbp, r10, rcx
007dc 41ba40000000                   mov        r10d, 0x40
007e2 442bd1                         sub        r10d, ecx
007e5 c462abf7542420                 shrx       r10, qword ptr [rsp + 0x20], r10
007ec 490bea                         or         rbp, r10
007ef 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
007f7 eb26                           jmp        0x7ff8d7bd0c1f
007f9 41ba01000000                   mov        r10d, 1
007ff c442b1f7d2                     shlx       r10, r10, r9
00804 452bc1                         sub        r8d, r9d
00807 c4e2bbf7ac2498000000           shrx       rbp, qword ptr [rsp + 0x98], r8
00811 49ffca                         dec        r10
00814 4923ea                         and        rbp, r10
00817 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
0081f 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00824 4503d9                         add        r11d, r9d
00827 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0082c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00831 4503d1                         add        r10d, r9d
00834 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00839 4183fb40                       cmp        r11d, 0x40
0083d 0f8cddfbffff                   jl         0x7ff8d7bd0820
00843 4183c3c0                       add        r11d, -0x40
00847 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0084c 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00850 83c5f8                         add        ebp, -8
00853 896c240c                       mov        dword ptr [rsp + 0xc], ebp
00857 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0085b 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
0085f 83c1f0                         add        ecx, -0x10
00862 83f908                         cmp        ecx, 8
00865 0f8c09010000                   jl         0x7ff8d7bd0d74
0086b 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00870 4183c2e8                       add        r10d, -0x18
00874 443b9424c4000000               cmp        r10d, dword ptr [rsp + 0xc4]
0087c 0f8269fbffff                   jb         0x7ff8d7bd07eb
00882 bee4ffffff                     mov        esi, 0xffffffe4
00887 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0088f 448b442408                     mov        r8d, dword ptr [rsp + 8]
00894 44890424                       mov        dword ptr [rsp], r8d
00898 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
0089d 4489442404                     mov        dword ptr [rsp + 4], r8d
008a2 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
008a7 4489442408                     mov        dword ptr [rsp + 8], r8d
008ac 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
008b1 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
008b6 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
008bb 448944240c                     mov        dword ptr [rsp + 0xc], r8d
008c0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
008c5 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
008ca 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
008cf 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
008d4 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
008d9 4489442420                     mov        dword ptr [rsp + 0x20], r8d
008de 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
008e3 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
008e8 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
008ed 4489442428                     mov        dword ptr [rsp + 0x28], r8d
008f2 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
008f7 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
008fc 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
00901 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00906 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0090b 4489442440                     mov        dword ptr [rsp + 0x40], r8d
00910 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00915 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0091a 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0091f 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00924 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00929 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
0092e 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00936 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
0093b 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00943 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00948 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00950 90                             nop        
00951 90                             nop        
00952 90                             nop        
00953 e808cdafff                     call       0x7ff8d76cda60
00958 0f1f8400500a0002               nop        dword ptr [rax + rax + 0x2000a50]
00960 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
0096a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0096e e86dbe1917                     call       0x7ff8eed6cbe0
00973 f4                             hlt        
00974 85c9                           test       ecx, ecx
00976 7f08                           jg         0x7ff8d7bd0d80
00978 4533d2                         xor        r10d, r10d
0097b e978faffff                     jmp        0x7ff8d7bd07f8
00980 8be9                           mov        ebp, ecx
00982 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
0098a 8b542408                       mov        edx, dword ptr [rsp + 8]
0098e 90                             nop        
0098f e8cceeb5ff                     call       0x7ff8d772fc60
00994 0f1f84008c0a0003               nop        dword ptr [rax + rax + 0x3000a8c]
0099c 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
009a1 41c1e303                       shl        r11d, 3
009a5 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
009aa 41c1e003                       shl        r8d, 3
009ae 452bd8                         sub        r11d, r8d
009b1 4181c3c0000000                 add        r11d, 0xc0
009b8 c462a1f7d0                     shlx       r10, rax, r11
009bd e936faffff                     jmp        0x7ff8d7bd07f8
009c2 4533d2                         xor        r10d, r10d
009c5 4533c0                         xor        r8d, r8d
009c8 4533db                         xor        r11d, r11d
009cb 33c9                           xor        ecx, ecx
009cd 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
009d5 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
009dd 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
009e5 898c24f4000000                 mov        dword ptr [rsp + 0xf4], ecx
009ec e937fdffff                     jmp        0x7ff8d7bd0b28
009f1 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009f9 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
00a01 4d03c2                         add        r8, r10
00a04 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
00a0c 4d3bc2                         cmp        r8, r10
00a0f 7e30                           jle        0x7ff8d7bd0e41
00a11 48be68b172e200000000           movabs     rsi, 0xe272b168
00a1b e840eeb5ff                     call       0x7ff8d772fc60
00a20 0f1f8400180b0004               nop        dword ptr [rax + rax + 0x4000b18]
00a28 4885c0                         test       rax, rax
00a2b 0f84eb130000                   je         0x7ff8d7bd221c
00a31 488bf0                         mov        rsi, rax
00a34 4881c410010000                 add        rsp, 0x110
00a3b 5d                             pop        rbp
00a3c e91f4dafff                     jmp        0x7ff8d76c5b60
00a41 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a46 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a4e 0f85f0130000                   jne        0x7ff8d7bd2244
00a54 418bc0                         mov        eax, r8d
00a57 4881c410010000                 add        rsp, 0x110
00a5e 5d                             pop        rbp
00a5f 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a63 0f87e5150000                   ja         0x7ff8d7bd244e
00a69 c3                             ret        
00a6a 4533db                         xor        r11d, r11d
00a6d 4533d2                         xor        r10d, r10d
00a70 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00a75 e95ff7ffff                     jmp        0x7ff8d7bd05d9
00a7a bee4ffffff                     mov        esi, 0xffffffe4
00a7f 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a87 448b542408                     mov        r10d, dword ptr [rsp + 8]
00a8c 44891424                       mov        dword ptr [rsp], r10d
00a90 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00a95 44894c2404                     mov        dword ptr [rsp + 4], r9d
00a9a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00a9f 4489542408                     mov        dword ptr [rsp + 8], r10d
00aa4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00aa9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00aae 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00ab3 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00ab8 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00abd 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00ac2 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00ac7 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00acc 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00ad1 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00ad6 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00adb 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00ae0 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00ae5 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00aea 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00aef 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
00af4 90                             nop        
00af5 90                             nop        
00af6 90                             nop        
00af7 e864cbafff                     call       0x7ff8d76cda60
00afc 0f1f8400f40b0005               nop        dword ptr [rax + rax + 0x5000bf4]
00b04 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
00b0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b12 e8c9bc1917                     call       0x7ff8eed6cbe0
00b17 f4                             hlt        
00b18 bee4ffffff                     mov        esi, 0xffffffe4
00b1d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b25 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b2a 44891c24                       mov        dword ptr [rsp], r11d
00b2e 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00b33 4489442404                     mov        dword ptr [rsp + 4], r8d
00b38 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b3d 44895c2408                     mov        dword ptr [rsp + 8], r11d
00b42 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00b47 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00b4c 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00b51 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00b56 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00b5b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00b60 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00b65 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00b6a 458bd9                         mov        r11d, r9d
00b6d 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00b72 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00b77 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00b7c 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00b81 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00b86 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00b8b 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00b90 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00b95 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00b9a 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00b9f 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00ba3 e8b8caafff                     call       0x7ff8d76cda60
00ba8 0f1f8400a00c0006               nop        dword ptr [rax + rax + 0x6000ca0]
00bb0 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
00bba 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bbe e81dbc1917                     call       0x7ff8eed6cbe0
00bc3 f4                             hlt        
00bc4 bee4ffffff                     mov        esi, 0xffffffe4
00bc9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00bd1 448b542408                     mov        r10d, dword ptr [rsp + 8]
00bd6 44891424                       mov        dword ptr [rsp], r10d
00bda 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00bdf 44894c2404                     mov        dword ptr [rsp + 4], r9d
00be4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00be9 4489542408                     mov        dword ptr [rsp + 8], r10d
00bee 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00bf3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00bf8 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00bfd 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00c02 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00c07 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00c0c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00c11 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00c16 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00c1b 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00c20 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00c25 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00c2a 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00c2f 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00c34 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00c39 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00c3e 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00c43 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00c48 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00c4d 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00c52 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00c57 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
00c5c 90                             nop        
00c5d 90                             nop        
00c5e 90                             nop        
00c5f e8fcc9afff                     call       0x7ff8d76cda60
00c64 0f1f84005c0d0007               nop        dword ptr [rax + rax + 0x7000d5c]
00c6c 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
00c76 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c7a e861bb1917                     call       0x7ff8eed6cbe0
00c7f f4                             hlt        
00c80 4533c9                         xor        r9d, r9d
00c83 4d3bc1                         cmp        r8, r9
00c86 bdffffffff                     mov        ebp, 0xffffffff
00c8b 7c08                           jl         0x7ff8d7bd1095
00c8d 400f95c5                       setne      bpl
00c91 400fb6ed                       movzx      ebp, bpl
00c95 be45ffffff                     mov        esi, 0xffffff45
00c9a 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
00ca2 4c890c24                       mov        qword ptr [rsp], r9
00ca6 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
00caa 894c240c                       mov        dword ptr [rsp + 0xc], ecx
00cae 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00cb6 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00cbb 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
00cbf 894c2414                       mov        dword ptr [rsp + 0x14], ecx
00cc3 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00cc8 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00ccd 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
00cd1 894c2430                       mov        dword ptr [rsp + 0x30], ecx
00cd5 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00cda 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00cdf 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00ce3 894c2438                       mov        dword ptr [rsp + 0x38], ecx
00ce7 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00cec 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
00cf1 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
00cf5 894c2440                       mov        dword ptr [rsp + 0x40], ecx
00cf9 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00d01 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
00d06 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00d0a 894c2450                       mov        dword ptr [rsp + 0x50], ecx
00d0e 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
00d13 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
00d18 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
00d1c 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00d20 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
00d25 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
00d2a 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
00d32 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
00d37 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
00d3f 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00d44 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00d4c 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
00d53 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d5b 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
00d63 e8f8c8afff                     call       0x7ff8d76cda60
00d68 0f1f8400600e0008               nop        dword ptr [rax + rax + 0x8000e60]
00d70 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
00d7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d7e e85dba1917                     call       0x7ff8eed6cbe0
00d83 f4                             hlt        
00d84 be45ffffff                     mov        esi, 0xffffff45
00d89 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00d91 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00d96 44891c24                       mov        dword ptr [rsp], r11d
00d9a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00d9f 4489542404                     mov        dword ptr [rsp + 4], r10d
00da4 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00da9 44895c2408                     mov        dword ptr [rsp + 8], r11d
00dae 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00db3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00db8 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00dbd 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00dc2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00dc7 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00dcc 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00dd1 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00dd6 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00ddb 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00de0 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00de5 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00dea 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00def 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00df4 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00df9 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00dfe 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00e03 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00e08 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00e0d 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00e12 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00e17 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00e1c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00e21 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00e26 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00e2b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00e30 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00e38 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00e3d 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00e45 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00e4a 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
00e52 90                             nop        
00e53 e808c8afff                     call       0x7ff8d76cda60
00e58 0f1f8400500f0009               nop        dword ptr [rax + rax + 0x9000f50]
00e60 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
00e6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e6e e86db91917                     call       0x7ff8eed6cbe0
00e73 f4                             hlt        
00e74 be45ffffff                     mov        esi, 0xffffff45
00e79 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e81 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00e86 44891c24                       mov        dword ptr [rsp], r11d
00e8a 44894c2408                     mov        dword ptr [rsp + 8], r9d
00e8f e8ccc7afff                     call       0x7ff8d76cda60
00e94 0f1f84008c0f000a               nop        dword ptr [rax + rax + 0xa000f8c]
00e9c 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
00ea6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00eaa e831b91917                     call       0x7ff8eed6cbe0
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
00f0f 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00f14 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00f19 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00f1e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00f23 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00f28 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00f2d 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00f32 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00f37 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00f3c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00f41 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00f46 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00f4b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00f50 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00f55 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00f5a 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00f5f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00f64 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00f69 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00f71 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00f76 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00f7e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00f83 e8d8c6afff                     call       0x7ff8d76cda60
00f88 0f1f84008010000b               nop        dword ptr [rax + rax + 0xb001080]
00f90 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
00f9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00f9e e83db81917                     call       0x7ff8eed6cbe0
00fa3 f4                             hlt        
00fa4 be45ffffff                     mov        esi, 0xffffff45
00fa9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00fb1 448b542408                     mov        r10d, dword ptr [rsp + 8]
00fb6 44891424                       mov        dword ptr [rsp], r10d
00fba 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00fbf 4489442404                     mov        dword ptr [rsp + 4], r8d
00fc4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00fc9 4489542408                     mov        dword ptr [rsp + 8], r10d
00fce 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00fd6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00fdb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00fe0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00fe5 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00fea 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00fef 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00ff4 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00ff9 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00ffe 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01003 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01008 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0100d 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01012 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01017 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0101c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01021 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01026 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0102b 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01030 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01035 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0103a 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0103f 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01044 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01049 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0104e 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01053 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01058 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0105d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01065 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0106a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01072 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01077 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
0107f 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01084 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
0108c 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
01094 90                             nop        
01095 90                             nop        
01096 90                             nop        
01097 e8c4c5afff                     call       0x7ff8d76cda60
0109c 0f1f84009411000c               nop        dword ptr [rax + rax + 0xc001194]
010a4 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
010ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
010b2 e829b71917                     call       0x7ff8eed6cbe0
010b7 f4                             hlt        
010b8 be45ffffff                     mov        esi, 0xffffff45
010bd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
010c5 448b442408                     mov        r8d, dword ptr [rsp + 8]
010ca 44890424                       mov        dword ptr [rsp], r8d
010ce 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
010d3 4489542404                     mov        dword ptr [rsp + 4], r10d
010d8 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
010dd 4489442408                     mov        dword ptr [rsp + 8], r8d
010e2 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
010ea 4c89542410                     mov        qword ptr [rsp + 0x10], r10
010ef 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
010f4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
010f9 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
010fe 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01103 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01108 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0110d 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01112 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01117 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0111c 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01121 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01126 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0112b 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01130 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01135 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0113a 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0113f 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
01144 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01149 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0114e 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01153 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01158 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0115d 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01162 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01167 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0116c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01171 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01179 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0117e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01186 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0118b 448b9424d4000000               mov        r10d, dword ptr [rsp + 0xd4]
01193 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01198 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
011a0 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
011a7 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
011af e8acc4afff                     call       0x7ff8d76cda60
011b4 0f1f8400ac12000d               nop        dword ptr [rax + rax + 0xd0012ac]
011bc 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
011c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
011ca e811b61917                     call       0x7ff8eed6cbe0
011cf f4                             hlt        
011d0 be45ffffff                     mov        esi, 0xffffff45
011d5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
011dd 448b442408                     mov        r8d, dword ptr [rsp + 8]
011e2 44890424                       mov        dword ptr [rsp], r8d
011e6 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
011eb 44894c2404                     mov        dword ptr [rsp + 4], r9d
011f0 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
011f5 4489442408                     mov        dword ptr [rsp + 8], r8d
011fa 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
011ff 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01204 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01209 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0120e 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01213 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01218 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
0121d 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01222 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01227 4489442428                     mov        dword ptr [rsp + 0x28], r8d
0122c 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01231 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01236 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0123b 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01240 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01245 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0124a 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
0124f 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01254 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01259 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0125e 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01263 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01268 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0126d 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01272 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
01277 4c89442458                     mov        qword ptr [rsp + 0x58], r8
0127c 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
01284 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01289 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
01291 4c89442468                     mov        qword ptr [rsp + 0x68], r8
01296 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0129b 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
012a2 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
012aa 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
012b2 90                             nop        
012b3 e8a8c3afff                     call       0x7ff8d76cda60
012b8 0f1f8400b013000e               nop        dword ptr [rax + rax + 0xe0013b0]
012c0 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
012ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
012ce e80db51917                     call       0x7ff8eed6cbe0
012d3 f4                             hlt        
012d4 41b9ffffff7f                   mov        r9d, 0x7fffffff
012da 4d3bc1                         cmp        r8, r9
012dd bdffffffff                     mov        ebp, 0xffffffff
012e2 7c08                           jl         0x7ff8d7bd16ec
012e4 400f95c5                       setne      bpl
012e8 400fb6ed                       movzx      ebp, bpl
012ec be45ffffff                     mov        esi, 0xffffff45
012f1 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
012f9 4c890c24                       mov        qword ptr [rsp], r9
012fd 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
01301 894c240c                       mov        dword ptr [rsp + 0xc], ecx
01305 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
0130d 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
01312 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01317 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
0131c 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
01320 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01324 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01329 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0132e 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
01332 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01336 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0133b 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01340 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
01344 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
01348 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
0134d 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01352 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
01359 894c2444                       mov        dword ptr [rsp + 0x44], ecx
0135d 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01362 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01367 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
0136b 894c2454                       mov        dword ptr [rsp + 0x54], ecx
0136f 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01374 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
01379 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
0137e 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
01383 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
0138b 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
01390 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
01398 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
0139d 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
013a5 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
013ac 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
013b4 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
013bc 90                             nop        
013bd 90                             nop        
013be 90                             nop        
013bf e89cc2afff                     call       0x7ff8d76cda60
013c4 0f1f8400bc14000f               nop        dword ptr [rax + rax + 0xf0014bc]
013cc 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
013d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
013da e801b41917                     call       0x7ff8eed6cbe0
013df f4                             hlt        
013e0 be45ffffff                     mov        esi, 0xffffff45
013e5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013ed 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
013f2 44890c24                       mov        dword ptr [rsp], r9d
013f6 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
013fb 44894c2404                     mov        dword ptr [rsp + 4], r9d
01400 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01405 44894c2408                     mov        dword ptr [rsp + 8], r9d
0140a 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
0140f 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01414 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01419 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0141e 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01423 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01428 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
0142d 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01432 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01437 4489442428                     mov        dword ptr [rsp + 0x28], r8d
0143c 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01441 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01446 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0144b 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01450 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01455 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0145a 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
0145f 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01464 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01469 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0146e 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01473 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01478 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0147d 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01482 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
01487 4c89442458                     mov        qword ptr [rsp + 0x58], r8
0148c 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
01494 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01499 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0149e 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
014a6 90                             nop        
014a7 e8b4c1afff                     call       0x7ff8d76cda60
014ac 0f1f8400a4150010               nop        dword ptr [rax + rax + 0x100015a4]
014b4 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
014be 4883e4f0                       and        rsp, 0xfffffffffffffff0
014c2 e819b31917                     call       0x7ff8eed6cbe0
014c7 f4                             hlt        
014c8 be45ffffff                     mov        esi, 0xffffff45
014cd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014d5 448b542408                     mov        r10d, dword ptr [rsp + 8]
014da 44891424                       mov        dword ptr [rsp], r10d
014de 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
014e3 4489542404                     mov        dword ptr [rsp + 4], r10d
014e8 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
014ed 4489542408                     mov        dword ptr [rsp + 8], r10d
014f2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
014f7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
014fc 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01501 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01506 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0150b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01510 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01515 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0151a 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0151f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01524 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01529 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0152e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01533 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01538 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
0153d 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01542 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01547 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0154c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01551 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01556 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0155b 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01560 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01565 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0156a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0156f 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01574 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0157c 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01581 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01586 89bc2480000000                 mov        dword ptr [rsp + 0x80], edi
0158d 90                             nop        
0158e 90                             nop        
0158f e8ccc0afff                     call       0x7ff8d76cda60
01594 0f1f84008c160011               nop        dword ptr [rax + rax + 0x1100168c]
0159c 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
015a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
015aa e831b21917                     call       0x7ff8eed6cbe0
015af f4                             hlt        
015b0 be3dffffff                     mov        esi, 0xffffff3d
015b5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015bd 8b4c2408                       mov        ecx, dword ptr [rsp + 8]
015c1 890c24                         mov        dword ptr [rsp], ecx
015c4 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
015c8 894c2404                       mov        dword ptr [rsp + 4], ecx
015cc 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
015d1 4489442408                     mov        dword ptr [rsp + 8], r8d
015d6 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
015db 4c89442418                     mov        qword ptr [rsp + 0x18], r8
015e0 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
015e5 448944240c                     mov        dword ptr [rsp + 0xc], r8d
015ea 8b4c2428                       mov        ecx, dword ptr [rsp + 0x28]
015ee 894c2420                       mov        dword ptr [rsp + 0x20], ecx
015f2 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
015f7 4489442424                     mov        dword ptr [rsp + 0x24], r8d
015fc 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
01600 894c2428                       mov        dword ptr [rsp + 0x28], ecx
01604 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01609 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0160e 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
01612 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01616 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
0161b 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01620 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
01624 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01628 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
01630 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01635 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
01639 894c2448                       mov        dword ptr [rsp + 0x48], ecx
0163d 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01642 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01647 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
0164b 894c2450                       mov        dword ptr [rsp + 0x50], ecx
0164f 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
01654 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01659 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
01661 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01666 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
0166e 4c89442468                     mov        qword ptr [rsp + 0x68], r8
01673 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01678 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01680 89bc2490000000                 mov        dword ptr [rsp + 0x90], edi
01687 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
0168f e8ccbfafff                     call       0x7ff8d76cda60
01694 0f1f84008c170012               nop        dword ptr [rax + rax + 0x1200178c]
0169c 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
016a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
016aa e831b11917                     call       0x7ff8eed6cbe0
016af f4                             hlt        
016b0 be45ffffff                     mov        esi, 0xffffff45
016b5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
016bd 448b442408                     mov        r8d, dword ptr [rsp + 8]
016c2 44890424                       mov        dword ptr [rsp], r8d
016c6 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
016cb 4489442404                     mov        dword ptr [rsp + 4], r8d
016d0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
016d5 4489542408                     mov        dword ptr [rsp + 8], r10d
016da 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016df 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016e4 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
016e9 448944240c                     mov        dword ptr [rsp + 0xc], r8d
016ee 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
016f3 4489542420                     mov        dword ptr [rsp + 0x20], r10d
016f8 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
016fd 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01702 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01707 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0170c 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01711 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01716 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0171b 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01720 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01725 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0172a 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0172f 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01734 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01738 90                             nop        
01739 90                             nop        
0173a 90                             nop        
0173b e820bfafff                     call       0x7ff8d76cda60
01740 0f1f840038180013               nop        dword ptr [rax + rax + 0x13001838]
01748 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01752 4883e4f0                       and        rsp, 0xfffffffffffffff0
01756 e885b01917                     call       0x7ff8eed6cbe0
0175b f4                             hlt        
0175c be45ffffff                     mov        esi, 0xffffff45
01761 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01769 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
0176e 44890c24                       mov        dword ptr [rsp], r9d
01772 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01777 4489442404                     mov        dword ptr [rsp + 4], r8d
0177c 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01781 4489442408                     mov        dword ptr [rsp + 8], r8d
01786 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
0178b 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01790 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01795 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0179a 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0179f 4489442420                     mov        dword ptr [rsp + 0x20], r8d
017a4 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
017a9 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
017ae 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
017b3 4489442428                     mov        dword ptr [rsp + 0x28], r8d
017b8 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
017bd 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
017c2 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
017c7 4489442430                     mov        dword ptr [rsp + 0x30], r8d
017cc 4489542454                     mov        dword ptr [rsp + 0x54], r10d
017d1 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
017d6 90                             nop        
017d7 e884beafff                     call       0x7ff8d76cda60
017dc 0f1f8400d4180014               nop        dword ptr [rax + rax + 0x140018d4]
017e4 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
017ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
017f2 e8e9af1917                     call       0x7ff8eed6cbe0
017f7 f4                             hlt        
017f8 be45ffffff                     mov        esi, 0xffffff45
017fd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01805 448b542408                     mov        r10d, dword ptr [rsp + 8]
0180a 44891424                       mov        dword ptr [rsp], r10d
0180e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01813 44895c2404                     mov        dword ptr [rsp + 4], r11d
01818 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0181d 4489542408                     mov        dword ptr [rsp + 8], r10d
01822 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01827 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0182c 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01831 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01836 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0183b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01840 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01845 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0184a 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0184f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01854 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01859 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0185e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01863 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01868 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0186d 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01872 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01877 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0187c 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01881 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01886 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0188b 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01890 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01895 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0189a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0189f 4c89542458                     mov        qword ptr [rsp + 0x58], r10
018a4 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
018ac 4c89542460                     mov        qword ptr [rsp + 0x60], r10
018b1 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
018b9 4c89542468                     mov        qword ptr [rsp + 0x68], r10
018be 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
018c6 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
018cd 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
018d5 90                             nop        
018d6 90                             nop        
018d7 e884bdafff                     call       0x7ff8d76cda60
018dc 0f1f8400d4190015               nop        dword ptr [rax + rax + 0x150019d4]
018e4 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
018ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
018f2 e8e9ae1917                     call       0x7ff8eed6cbe0
018f7 f4                             hlt        
018f8 4585c0                         test       r8d, r8d
018fb 7f07                           jg         0x7ff8d7bd1d04
018fd 33c0                           xor        eax, eax
018ff e9c3e7ffff                     jmp        0x7ff8d7bd04c7
01904 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01908 89742428                       mov        dword ptr [rsp + 0x28], esi
0190c 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01910 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01915 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
0191a 897c2410                       mov        dword ptr [rsp + 0x10], edi
0191e 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01923 48894424f8                     mov        qword ptr [rsp - 8], rax
01928 8b0424                         mov        eax, dword ptr [rsp]
0192b 89442404                       mov        dword ptr [rsp + 4], eax
0192f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01934 48894424f8                     mov        qword ptr [rsp - 8], rax
01939 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01940 890424                         mov        dword ptr [rsp], eax
01943 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01948 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01950 488bf5                         mov        rsi, rbp
01953 8b542408                       mov        edx, dword ptr [rsp + 8]
01957 418bc8                         mov        ecx, r8d
0195a 90                             nop        
0195b e800dfb5ff                     call       0x7ff8d772fc60
01960 0f1f8400581a0016               nop        dword ptr [rax + rax + 0x16001a58]
01968 41ba40000000                   mov        r10d, 0x40
0196e 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
01973 c4e2a9f7c0                     shlx       rax, rax, r10
01978 48894424f8                     mov        qword ptr [rsp - 8], rax
0197d 8b442404                       mov        eax, dword ptr [rsp + 4]
01981 890424                         mov        dword ptr [rsp], eax
01984 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01989 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
0198e 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
01992 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
01997 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0199c 8b5c241c                       mov        ebx, dword ptr [rsp + 0x1c]
019a0 8b742428                       mov        esi, dword ptr [rsp + 0x28]
019a4 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
019a8 e91ae7ffff                     jmp        0x7ff8d7bd04c7
019ad 4585c0                         test       r8d, r8d
019b0 7f08                           jg         0x7ff8d7bd1dba
019b2 4533f6                         xor        r14d, r14d
019b5 e94ee7ffff                     jmp        0x7ff8d7bd0508
019ba 4489542438                     mov        dword ptr [rsp + 0x38], r10d
019bf 4889442430                     mov        qword ptr [rsp + 0x30], rax
019c4 8954242c                       mov        dword ptr [rsp + 0x2c], edx
019c8 89742428                       mov        dword ptr [rsp + 0x28], esi
019cc 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
019d0 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
019d5 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
019da 897c2410                       mov        dword ptr [rsp + 0x10], edi
019de 448944240c                     mov        dword ptr [rsp + 0xc], r8d
019e3 48894424f8                     mov        qword ptr [rsp - 8], rax
019e8 8b0424                         mov        eax, dword ptr [rsp]
019eb 89442404                       mov        dword ptr [rsp + 4], eax
019ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019f4 48894424f8                     mov        qword ptr [rsp - 8], rax
019f9 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a00 890424                         mov        dword ptr [rsp], eax
01a03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a08 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a10 488bf5                         mov        rsi, rbp
01a13 8b542408                       mov        edx, dword ptr [rsp + 8]
01a17 418bc8                         mov        ecx, r8d
01a1a 90                             nop        
01a1b e840deb5ff                     call       0x7ff8d772fc60
01a20 0f1f8400181b0017               nop        dword ptr [rax + rax + 0x17001b18]
01a28 41ba80000000                   mov        r10d, 0x80
01a2e 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
01a33 c462a9f7f0                     shlx       r14, rax, r10
01a38 48894424f8                     mov        qword ptr [rsp - 8], rax
01a3d 8b442404                       mov        eax, dword ptr [rsp + 4]
01a41 890424                         mov        dword ptr [rsp], eax
01a44 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a49 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
01a4d 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
01a52 8b5c241c                       mov        ebx, dword ptr [rsp + 0x1c]
01a56 8b742428                       mov        esi, dword ptr [rsp + 0x28]
01a5a 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01a5e 488b442430                     mov        rax, qword ptr [rsp + 0x30]
01a63 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01a68 e99be6ffff                     jmp        0x7ff8d7bd0508
01a6d 4533c0                         xor        r8d, r8d
01a70 e984efffff                     jmp        0x7ff8d7bd0df9
01a75 bee4ffffff                     mov        esi, 0xffffffe4
01a7a 48ffb42490000000               push       qword ptr [rsp + 0x90]
01a82 488f0424                       pop        qword ptr [rsp]
01a86 90                             nop        
01a87 e8d4bbafff                     call       0x7ff8d76cda60
01a8c 0f1f8400841b0018               nop        dword ptr [rax + rax + 0x18001b84]
01a94 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01a9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01aa2 e839ad1917                     call       0x7ff8eed6cbe0
01aa7 f4                             hlt        
01aa8 be5d000000                     mov        esi, 0x5d
01aad 90                             nop        
01aae 90                             nop        
01aaf e8acbbafff                     call       0x7ff8d76cda60
01ab4 0f1f8400ac1b0019               nop        dword ptr [rax + rax + 0x19001bac]
01abc 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01ac6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01aca e811ad1917                     call       0x7ff8eed6cbe0
01acf f4                             hlt        
01ad0 bef6ffffff                     mov        esi, 0xfffffff6
01ad5 90                             nop        
01ad6 90                             nop        
01ad7 e884bbafff                     call       0x7ff8d76cda60
01adc 0f1f8400d41b001a               nop        dword ptr [rax + rax + 0x1a001bd4]
01ae4 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01aee 4883e4f0                       and        rsp, 0xfffffffffffffff0
01af2 e8e9ac1917                     call       0x7ff8eed6cbe0
01af7 f4                             hlt        
01af8 bef6ffffff                     mov        esi, 0xfffffff6
01afd 90                             nop        
01afe 90                             nop        
01aff e85cbbafff                     call       0x7ff8d76cda60
01b04 0f1f8400fc1b001b               nop        dword ptr [rax + rax + 0x1b001bfc]
01b0c 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01b16 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b1a e8c1ac1917                     call       0x7ff8eed6cbe0
01b1f f4                             hlt        
01b20 be6effffff                     mov        esi, 0xffffff6e
01b25 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b2d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01b32 44891424                       mov        dword ptr [rsp], r10d
01b36 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b3b 4489542408                     mov        dword ptr [rsp + 8], r10d
01b40 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b45 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b4a 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01b4f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01b54 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b59 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01b5e 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01b63 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01b68 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01b6d 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01b72 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01b77 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01b7c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01b81 90                             nop        
01b82 90                             nop        
01b83 e8d8baafff                     call       0x7ff8d76cda60
01b88 0f1f8400801c001c               nop        dword ptr [rax + rax + 0x1c001c80]
01b90 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01b9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b9e e83dac1917                     call       0x7ff8eed6cbe0
01ba3 f4                             hlt        
01ba4 bee4ffffff                     mov        esi, 0xffffffe4
01ba9 48ffb42490000000               push       qword ptr [rsp + 0x90]
01bb1 488f0424                       pop        qword ptr [rsp]
01bb5 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
01bba 48894424f8                     mov        qword ptr [rsp - 8], rax
01bbf 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01bc6 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01bca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bcf 895c2428                       mov        dword ptr [rsp + 0x28], ebx
01bd3 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01bd7 e884baafff                     call       0x7ff8d76cda60
01bdc 0f1f8400d41c001d               nop        dword ptr [rax + rax + 0x1d001cd4]
01be4 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01bee 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bf2 e8e9ab1917                     call       0x7ff8eed6cbe0
01bf7 f4                             hlt        
01bf8 bee4ffffff                     mov        esi, 0xffffffe4
01bfd 48ffb42490000000               push       qword ptr [rsp + 0x90]
01c05 488f0424                       pop        qword ptr [rsp]
01c09 48894424f8                     mov        qword ptr [rsp - 8], rax
01c0e 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c15 89442418                       mov        dword ptr [rsp + 0x18], eax
01c19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c1e 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01c22 89542428                       mov        dword ptr [rsp + 0x28], edx
01c26 4889442430                     mov        qword ptr [rsp + 0x30], rax
01c2b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01c30 90                             nop        
01c31 90                             nop        
01c32 90                             nop        
01c33 e828baafff                     call       0x7ff8d76cda60
01c38 0f1f8400301d001e               nop        dword ptr [rax + rax + 0x1e001d30]
01c40 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01c4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c4e e88dab1917                     call       0x7ff8eed6cbe0
01c53 f4                             hlt        
01c54 bebeffffff                     mov        esi, 0xffffffbe
01c59 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c61 448b542408                     mov        r10d, dword ptr [rsp + 8]
01c66 44891424                       mov        dword ptr [rsp], r10d
01c6a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01c6f 4489542408                     mov        dword ptr [rsp + 8], r10d
01c74 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c79 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c7e 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01c83 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01c88 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c8d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01c92 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01c97 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01c9c 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01ca1 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01ca6 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01cab 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01cb0 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01cb5 90                             nop        
01cb6 90                             nop        
01cb7 e8a4b9afff                     call       0x7ff8d76cda60
01cbc 0f1f8400b41d001f               nop        dword ptr [rax + rax + 0x1f001db4]
01cc4 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01cce 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cd2 e809ab1917                     call       0x7ff8eed6cbe0
01cd7 f4                             hlt        
01cd8 beccffffff                     mov        esi, 0xffffffcc
01cdd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ce5 448b542408                     mov        r10d, dword ptr [rsp + 8]
01cea 44891424                       mov        dword ptr [rsp], r10d
01cee 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01cf3 48894424f8                     mov        qword ptr [rsp - 8], rax
01cf8 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01cff 89442414                       mov        dword ptr [rsp + 0x14], eax
01d03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d08 895c2418                       mov        dword ptr [rsp + 0x18], ebx
01d0c 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01d10 897c242c                       mov        dword ptr [rsp + 0x2c], edi
01d14 90                             nop        
01d15 90                             nop        
01d16 90                             nop        
01d17 e844b9afff                     call       0x7ff8d76cda60
01d1c 0f1f8400141e0020               nop        dword ptr [rax + rax + 0x20001e14]
01d24 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01d2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d32 e8a9aa1917                     call       0x7ff8eed6cbe0
01d37 f4                             hlt        
01d38 beccffffff                     mov        esi, 0xffffffcc
01d3d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d45 448b442408                     mov        r8d, dword ptr [rsp + 8]
01d4a 44890424                       mov        dword ptr [rsp], r8d
01d4e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d53 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d5a 89442410                       mov        dword ptr [rsp + 0x10], eax
01d5e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d63 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01d67 89542418                       mov        dword ptr [rsp + 0x18], edx
01d6b 4889442428                     mov        qword ptr [rsp + 0x28], rax
01d70 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01d75 897c2434                       mov        dword ptr [rsp + 0x34], edi
01d79 90                             nop        
01d7a 90                             nop        
01d7b e8e0b8afff                     call       0x7ff8d76cda60
01d80 0f1f8400781e0021               nop        dword ptr [rax + rax + 0x21001e78]
01d88 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01d92 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d96 e845aa1917                     call       0x7ff8eed6cbe0
01d9b f4                             hlt        
01d9c be45ffffff                     mov        esi, 0xffffff45
01da1 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01da6 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01dab 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01db0 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01db5 90                             nop        
01db6 90                             nop        
01db7 e8a4b8afff                     call       0x7ff8d76cda60
01dbc 0f1f8400b41e0022               nop        dword ptr [rax + rax + 0x22001eb4]
01dc4 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01dce 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dd2 e809aa1917                     call       0x7ff8eed6cbe0
01dd7 f4                             hlt        
01dd8 be45ffffff                     mov        esi, 0xffffff45
01ddd 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01de2 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01de7 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01dec 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01df1 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01df6 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01dfb e860b8afff                     call       0x7ff8d76cda60
01e00 0f1f8400f81e0023               nop        dword ptr [rax + rax + 0x23001ef8]
01e08 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01e12 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e16 e8c5a91917                     call       0x7ff8eed6cbe0
01e1b f4                             hlt        
01e1c bef6ffffff                     mov        esi, 0xfffffff6
01e21 90                             nop        
01e22 90                             nop        
01e23 e838b8afff                     call       0x7ff8d76cda60
01e28 0f1f8400201f0024               nop        dword ptr [rax + rax + 0x24001f20]
01e30 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01e3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e3e e89da91917                     call       0x7ff8eed6cbe0
01e43 f4                             hlt        
01e44 be5d000000                     mov        esi, 0x5d
01e49 90                             nop        
01e4a 90                             nop        
01e4b e810b8afff                     call       0x7ff8d76cda60
01e50 0f1f8400481f0025               nop        dword ptr [rax + rax + 0x25001f48]
01e58 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01e62 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e66 e875a91917                     call       0x7ff8eed6cbe0
01e6b f4                             hlt        
01e6c be45ffffff                     mov        esi, 0xffffff45
01e71 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e79 448b542408                     mov        r10d, dword ptr [rsp + 8]
01e7e 44891424                       mov        dword ptr [rsp], r10d
01e82 90                             nop        
01e83 e8d8b7afff                     call       0x7ff8d76cda60
01e88 0f1f8400801f0026               nop        dword ptr [rax + rax + 0x26001f80]
01e90 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01e9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e9e e83da91917                     call       0x7ff8eed6cbe0
01ea3 f4                             hlt        
01ea4 bef6ffffff                     mov        esi, 0xfffffff6
01ea9 418be8                         mov        ebp, r8d
01eac 90                             nop        
01ead 90                             nop        
01eae 90                             nop        
01eaf e8acb7afff                     call       0x7ff8d76cda60
01eb4 0f1f8400ac1f0027               nop        dword ptr [rax + rax + 0x27001fac]
01ebc 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01ec6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eca e811a91917                     call       0x7ff8eed6cbe0
01ecf f4                             hlt        
01ed0 bef6ffffff                     mov        esi, 0xfffffff6
01ed5 8be9                           mov        ebp, ecx
01ed7 e884b7afff                     call       0x7ff8d76cda60
01edc 0f1f8400d41f0028               nop        dword ptr [rax + rax + 0x28001fd4]
01ee4 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01eee 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ef2 e8e9a81917                     call       0x7ff8eed6cbe0
01ef7 f4                             hlt        
01ef8 bef6ffffff                     mov        esi, 0xfffffff6
01efd 418be8                         mov        ebp, r8d
01f00 90                             nop        
01f01 90                             nop        
01f02 90                             nop        
01f03 e858b7afff                     call       0x7ff8d76cda60
01f08 0f1f840000200029               nop        dword ptr [rax + rax + 0x29002000]
01f10 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01f1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f1e e8bda81917                     call       0x7ff8eed6cbe0
01f23 f4                             hlt        
01f24 bef6ffffff                     mov        esi, 0xfffffff6
01f29 90                             nop        
01f2a 90                             nop        
01f2b e830b7afff                     call       0x7ff8d76cda60
01f30 0f1f84002820002a               nop        dword ptr [rax + rax + 0x2a002028]
01f38 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01f42 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f46 e895a81917                     call       0x7ff8eed6cbe0
01f4b f4                             hlt        
01f4c bef6ffffff                     mov        esi, 0xfffffff6
01f51 90                             nop        
01f52 90                             nop        
01f53 e808b7afff                     call       0x7ff8d76cda60
01f58 0f1f84005020002b               nop        dword ptr [rax + rax + 0x2b002050]
01f60 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01f6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f6e e86da81917                     call       0x7ff8eed6cbe0
01f73 f4                             hlt        
01f74 bef6ffffff                     mov        esi, 0xfffffff6
01f79 90                             nop        
01f7a 90                             nop        
01f7b e8e0b6afff                     call       0x7ff8d76cda60
01f80 0f1f84007820002c               nop        dword ptr [rax + rax + 0x2c002078]
01f88 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01f92 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f96 e845a81917                     call       0x7ff8eed6cbe0
01f9b f4                             hlt        
01f9c bef6ffffff                     mov        esi, 0xfffffff6
01fa1 90                             nop        
01fa2 90                             nop        
01fa3 e8b8b6afff                     call       0x7ff8d76cda60
01fa8 0f1f8400a020002d               nop        dword ptr [rax + rax + 0x2d0020a0]
01fb0 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01fba 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fbe e81da81917                     call       0x7ff8eed6cbe0
01fc3 f4                             hlt        
01fc4 bef6ffffff                     mov        esi, 0xfffffff6
01fc9 90                             nop        
01fca 90                             nop        
01fcb e890b6afff                     call       0x7ff8d76cda60
01fd0 0f1f8400c820002e               nop        dword ptr [rax + rax + 0x2e0020c8]
01fd8 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
01fe2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fe6 e8f5a71917                     call       0x7ff8eed6cbe0
01feb f4                             hlt        
01fec bef6ffffff                     mov        esi, 0xfffffff6
01ff1 90                             nop        
01ff2 90                             nop        
01ff3 e868b6afff                     call       0x7ff8d76cda60
01ff8 0f1f8400f020002f               nop        dword ptr [rax + rax + 0x2f0020f0]
02000 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
0200a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0200e e8cda71917                     call       0x7ff8eed6cbe0
02013 f4                             hlt        
02014 bef6ffffff                     mov        esi, 0xfffffff6
02019 90                             nop        
0201a 90                             nop        
0201b e840b6afff                     call       0x7ff8d76cda60
02020 0f1f840018210030               nop        dword ptr [rax + rax + 0x30002118]
02028 48bf70f221b0f87f0000           movabs     rdi, 0x7ff8b021f270
02032 4883e4f0                       and        rsp, 0xfffffffffffffff0
02036 e8a5a71917                     call       0x7ff8eed6cbe0
0203b f4                             hlt        
0203c eb08                           jmp        0x7ff8d7bd2446
0203e eb06                           jmp        0x7ff8d7bd2446
02040 eb04                           jmp        0x7ff8d7bd2446
02042 eb02                           jmp        0x7ff8d7bd2446
02044 eb00                           jmp        0x7ff8d7bd2446
02046 488bf0                         mov        rsi, rax
02049 e9e6e9ffff                     jmp        0x7ff8d7bd0e34
0204e 49ba5f0ebdd7f87f0000           movabs     r10, 0x7ff8d7bd0e5f
02058 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
0205f e9fcfeb5ff                     jmp        0x7ff8d7732360
02064 e877cdb4ff                     call       0x7ff8d771f1e0
02069 e9b0dfffff                     jmp        0x7ff8d7bd041e
0206e f4                             hlt        
0206f f4                             hlt        
