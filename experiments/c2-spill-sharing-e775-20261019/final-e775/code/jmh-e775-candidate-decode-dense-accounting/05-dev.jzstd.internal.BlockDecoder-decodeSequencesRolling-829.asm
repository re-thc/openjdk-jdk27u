00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85ea1c0000                   jne        0x7f138fe7de08
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
00050 0f83b7180000                   jae        0x7f138fe7da0d
00056 0fb64c1607                     movzx      ecx, byte ptr [rsi + rdx + 7]
0005b 85c9                           test       ecx, ecx
0005d 0f84c9180000                   je         0x7f138fe7da2c
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
0009a 0f8cf0160000                   jl         0x7f138fe7d890
000a0 85ff                           test       edi, edi
000a2 0f8c281a0000                   jl         0x7f138fe7dbd0
000a8 8b2c24                         mov        ebp, dword ptr [rsp]
000ab 83c5f9                         add        ebp, -7
000ae 443bed                         cmp        r13d, ebp
000b1 0f8321190000                   jae        0x7f138fe7dad8
000b7 458bd5                         mov        r10d, r13d
000ba 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
000c2 4b8b441108                     mov        rax, qword ptr [r9 + r10 + 8]
000c7 4183c0f8                       add        r8d, -8
000cb 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000d3 4183c2f0                       add        r10d, -0x10
000d7 4183f808                       cmp        r8d, 8
000db 0f8c64170000                   jl         0x7f138fe7d945
000e1 85ff                           test       edi, edi
000e3 0f8c331a0000                   jl         0x7f138fe7dc1c
000e9 8b2c24                         mov        ebp, dword ptr [rsp]
000ec 83c5f9                         add        ebp, -7
000ef 443bd5                         cmp        r10d, ebp
000f2 0f8320190000                   jae        0x7f138fe7db18
000f8 458bc2                         mov        r8d, r10d
000fb 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00103 4f8b740308                     mov        r14, qword ptr [r11 + r8 + 8]
00108 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
0010d 448b4518                       mov        r8d, dword ptr [rbp + 0x18]
00111 4585c0                         test       r8d, r8d
00114 0f8426180000                   je         0x7f138fe7da40
0011a 448b5d1c                       mov        r11d, dword ptr [rbp + 0x1c]
0011e 418b4b04                       mov        ecx, dword ptr [r11 + 4]
00122 448b4d20                       mov        r9d, dword ptr [rbp + 0x20]
00126 4585c9                         test       r9d, r9d
00129 0f8425180000                   je         0x7f138fe7da54
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
00196 0f84ba080000                   je         0x7f138fe7cb56
0019c be40000000                     mov        esi, 0x40
001a1 2bf3                           sub        esi, ebx
001a3 3bce                           cmp        ecx, esi
001a5 0f8ffd010000                   jg         0x7f138fe7c4a8
001ab 2bf1                           sub        esi, ecx
001ad c4e2cbf7e8                     shrx       rbp, rax, rsi
001b2 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b7 83f940                         cmp        ecx, 0x40
001ba 0f8d2c1a0000                   jge        0x7f138fe7dcec
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
001e9 7c34                           jl         0x7f138fe7c31f
001eb 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
001f0 4183c1c8                       add        r9d, -0x38
001f4 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001f9 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00201 8b542408                       mov        edx, dword ptr [rsp + 8]
00205 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00209 6690                           nop        
0020b e850e5a7ff                     call       0x7f138f8fa860
00210 0f1f840008030000               nop        dword ptr [rax + rax + 0x308]
00218 4889442420                     mov        qword ptr [rsp + 0x20], rax
0021d eb31                           jmp        0x7f138fe7c350
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
0025c 0f8d0a190000                   jge        0x7f138fe7dc6c
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
00298 0f8df6180000                   jge        0x7f138fe7dc94
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
002df 0f8e20160000                   jle        0x7f138fe7da05
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
00357 0f860b160000                   jbe        0x7f138fe7da68
0035d 4d63d3                         movsxd     r10, r11d
00360 4c63d9                         movsxd     r11, ecx
00363 49ffcb                         dec        r11
00366 4d3bda                         cmp        r11, r10
00369 0f83f9150000                   jae        0x7f138fe7da68
0036f 448b542404                     mov        r10d, dword ptr [rsp + 4]
00374 4585d2                         test       r10d, r10d
00377 0f8ce3160000                   jl         0x7f138fe7db60
0037d 448b1c24                       mov        r11d, dword ptr [rsp]
00381 4183c3f9                       add        r11d, -7
00385 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0038d 4533db                         xor        r11d, r11d
00390 4533d2                         xor        r10d, r10d
00393 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
0039b 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
003a3 e990020000                     jmp        0x7f138fe7c738
003a8 8be9                           mov        ebp, ecx
003aa 2bee                           sub        ebp, esi
003ac 666690                         nop        
003af e8ace3a7ff                     call       0x7f138f8fa860
003b4 0f1f8400ac040001               nop        dword ptr [rax + rax + 0x10004ac]
003bc 4823442428                     and        rax, qword ptr [rsp + 0x28]
003c1 41ba40000000                   mov        r10d, 0x40
003c7 442bd5                         sub        r10d, ebp
003ca c462d1f7d8                     shlx       r11, rax, rbp
003cf c462abf7942498000000           shrx       r10, qword ptr [rsp + 0x98], r10
003d9 4d0bda                         or         r11, r10
003dc 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
003e1 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
003e6 e9eefdffff                     jmp        0x7f138fe7c2d9
003eb 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
003f3 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
003f8 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
003fd 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00405 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0040a 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
0040e 896c2410                       mov        dword ptr [rsp + 0x10], ebp
00412 0f1f8000000000                 nop        dword ptr [rax]
00419 0f1f8000000000                 nop        dword ptr [rax]
00420 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00427 83fd40                         cmp        ebp, 0x40
0042a 0f8df4090000                   jge        0x7f138fe7cf24
00430 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0043a 41ba01000000                   mov        r10d, 1
00440 c442d1f7d2                     shlx       r10, r10, rbp
00445 49ffca                         dec        r10
00448 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00450 458bda                         mov        r11d, r10d
00453 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0045a 83fd40                         cmp        ebp, 0x40
0045d 0f8da10a0000                   jge        0x7f138fe7d004
00463 c4c2d3f7f9                     shrx       rdi, r9, rbp
00468 41ba01000000                   mov        r10d, 1
0046e c442d1f7d2                     shlx       r10, r10, rbp
00473 49ffca                         dec        r10
00476 4d23d1                         and        r10, r9
00479 418bca                         mov        ecx, r10d
0047c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00483 83fd40                         cmp        ebp, 0x40
00486 0f8d780b0000                   jge        0x7f138fe7d104
0048c c4e2d3f7df                     shrx       rbx, rdi, rbp
00491 41ba01000000                   mov        r10d, 1
00497 c442d1f7d2                     shlx       r10, r10, rbp
0049c 49ffca                         dec        r10
0049f 4c23d7                         and        r10, rdi
004a2 458bd2                         mov        r10d, r10d
004a5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004ac 83fd40                         cmp        ebp, 0x40
004af 0f8d530c0000                   jge        0x7f138fe7d208
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
00506 0f8e24070000                   jle        0x7f138fe7cd30
0050c 4981f8ffffff7f                 cmp        r8, 0x7fffffff
00513 0f8fdf0c0000                   jg         0x7f138fe7d2f8
00519 4181faffff0100                 cmp        r10d, 0x1ffff
00520 0f8fca0d0000                   jg         0x7f138fe7d3f0
00526 81ffffff0300                   cmp        edi, 0x3ffff
0052c 0f8f920e0000                   jg         0x7f138fe7d4c4
00532 458bc8                         mov        r9d, r8d
00535 4181f900000010                 cmp        r9d, 0x10000000
0053c 0f83560f0000                   jae        0x7f138fe7d598
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
00571 0f8db0000000                   jge        0x7f138fe7c727
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
005c7 0f8db70f0000                   jge        0x7f138fe7d684
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
00608 0f8d0e100000                   jge        0x7f138fe7d71c
0060e 41b801000000                   mov        r8d, 1
00614 c44231f7c0                     shlx       r8d, r8d, r9d
00619 41ffc8                         dec        r8d
0061c 4523c3                         and        r8d, r11d
0061f 4503c2                         add        r8d, r10d
00622 4489442468                     mov        dword ptr [rsp + 0x68], r8d
00627 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0062b 0f8dac030000                   jge        0x7f138fe7cadd
00631 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00638 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0063d 4423442474                     and        r8d, dword ptr [rsp + 0x74]
00642 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00647 458b5a14                       mov        r11d, dword ptr [r10 + 0x14]
0064b 458b5304                       mov        r10d, dword ptr [r11 + 4]
0064f 453bc2                         cmp        r8d, r10d
00652 0f830e040000                   jae        0x7f138fe7cb66
00658 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
0065c 234c2468                       and        ecx, dword ptr [rsp + 0x68]
00660 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00665 458b5114                       mov        r10d, dword ptr [r9 + 0x14]
00669 418b5a04                       mov        ebx, dword ptr [r10 + 4]
0066d 4f8b5cc308                     mov        r11, qword ptr [r11 + r8*8 + 8]
00672 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
00677 3bcb                           cmp        ecx, ebx
00679 0f8371040000                   jae        0x7f138fe7cbf0
0067f 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00684 4423442448                     and        r8d, dword ptr [rsp + 0x48]
00689 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0068e 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
00692 458b4b04                       mov        r9d, dword ptr [r11 + 4]
00696 4d8b54ca08                     mov        r10, qword ptr [r10 + rcx*8 + 8]
0069b 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
006a3 453bc1                         cmp        r8d, r9d
006a6 0f83dc040000                   jae        0x7f138fe7cc88
006ac 4f8b54c308                     mov        r10, qword ptr [r11 + r8*8 + 8]
006b1 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006b9 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006c0 ffc5                           inc        ebp
006c2 892c24                         mov        dword ptr [rsp], ebp
006c5 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006c9 0f8ddf020000                   jge        0x7f138fe7caae
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
00791 0f8489050000                   je         0x7f138fe7ce20
00797 4183f93f                       cmp        r9d, 0x3f
0079b 0f8f5b060000                   jg         0x7f138fe7cefc
007a1 41b840000000                   mov        r8d, 0x40
007a7 442b44243c                     sub        r8d, dword ptr [rsp + 0x3c]
007ac 453bc8                         cmp        r9d, r8d
007af 7e48                           jle        0x7f138fe7c8f9
007b1 418bc9                         mov        ecx, r9d
007b4 412bc8                         sub        ecx, r8d
007b7 4183f840                       cmp        r8d, 0x40
007bb 0f8de30e0000                   jge        0x7f138fe7d7a4
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
007f7 eb26                           jmp        0x7f138fe7c91f
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
0083d 0f8cddfbffff                   jl         0x7f138fe7c520
00843 4183c3c0                       add        r11d, -0x40
00847 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0084c 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00850 83c5f8                         add        ebp, -8
00853 896c240c                       mov        dword ptr [rsp + 0xc], ebp
00857 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0085b 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
0085f 83c1f0                         add        ecx, -0x10
00862 83f908                         cmp        ecx, 8
00865 0f8cf5000000                   jl         0x7f138fe7ca60
0086b 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00870 4183c2e8                       add        r10d, -0x18
00874 443b9424c4000000               cmp        r10d, dword ptr [rsp + 0xc4]
0087c 0f8269fbffff                   jb         0x7f138fe7c4eb
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
00950 666690                         nop        
00953 e8887ab4ff                     call       0x7f138f9c44e0
00958 0f1f8400500a0002               nop        dword ptr [rax + rax + 0x2000a50]
00960 85c9                           test       ecx, ecx
00962 7f08                           jg         0x7f138fe7ca6c
00964 4533d2                         xor        r10d, r10d
00967 e98cfaffff                     jmp        0x7f138fe7c4f8
0096c 8be9                           mov        ebp, ecx
0096e 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00976 8b542408                       mov        edx, dword ptr [rsp + 8]
0097a 90                             nop        
0097b e8e0dda7ff                     call       0x7f138f8fa860
00980 0f1f8400780a0003               nop        dword ptr [rax + rax + 0x3000a78]
00988 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0098d 41c1e303                       shl        r11d, 3
00991 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00996 41c1e003                       shl        r8d, 3
0099a 452bd8                         sub        r11d, r8d
0099d 4181c3c0000000                 add        r11d, 0xc0
009a4 c462a1f7d0                     shlx       r10, rax, r11
009a9 e94afaffff                     jmp        0x7f138fe7c4f8
009ae 4533d2                         xor        r10d, r10d
009b1 4533c0                         xor        r8d, r8d
009b4 4533db                         xor        r11d, r11d
009b7 33c9                           xor        ecx, ecx
009b9 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
009c1 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
009c9 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
009d1 898c24f4000000                 mov        dword ptr [rsp + 0xf4], ecx
009d8 e94bfdffff                     jmp        0x7f138fe7c828
009dd 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009e5 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009ed 4d03c2                         add        r8, r10
009f0 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
009f8 4d3bc2                         cmp        r8, r10
009fb 7e30                           jle        0x7f138fe7cb2d
009fd 48be180fbce200000000           movabs     rsi, 0xe2bc0f18
00a07 e854dda7ff                     call       0x7f138f8fa860
00a0c 0f1f8400040b0004               nop        dword ptr [rax + rax + 0x4000b04]
00a14 4885c0                         test       rax, rax
00a17 0f84a7110000                   je         0x7f138fe7dcc4
00a1d 488bf0                         mov        rsi, rax
00a20 4881c410010000                 add        rsp, 0x110
00a27 5d                             pop        rbp
00a28 e9b3c1b4ff                     jmp        0x7f138f9c8ce0
00a2d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a32 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a3a 0f8598110000                   jne        0x7f138fe7dcd8
00a40 418bc0                         mov        eax, r8d
00a43 4881c410010000                 add        rsp, 0x110
00a4a 5d                             pop        rbp
00a4b 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a4f 0f879d120000                   ja         0x7f138fe7ddf2
00a55 c3                             ret        
00a56 4533db                         xor        r11d, r11d
00a59 4533d2                         xor        r10d, r10d
00a5c 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00a61 e973f7ffff                     jmp        0x7f138fe7c2d9
00a66 bee4ffffff                     mov        esi, 0xffffffe4
00a6b 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a73 448b542408                     mov        r10d, dword ptr [rsp + 8]
00a78 44891424                       mov        dword ptr [rsp], r10d
00a7c 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00a81 44894c2404                     mov        dword ptr [rsp + 4], r9d
00a86 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00a8b 4489542408                     mov        dword ptr [rsp + 8], r10d
00a90 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00a95 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00a9a 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00a9f 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00aa4 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00aa9 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00aae 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00ab3 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00ab8 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00abd 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00ac2 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00ac7 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00acc 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00ad1 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00ad6 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00adb 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
00ae0 666690                         nop        
00ae3 e8f878b4ff                     call       0x7f138f9c44e0
00ae8 0f1f8400e00b0005               nop        dword ptr [rax + rax + 0x5000be0]
00af0 bee4ffffff                     mov        esi, 0xffffffe4
00af5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00afd 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b02 44891c24                       mov        dword ptr [rsp], r11d
00b06 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00b0b 4489442404                     mov        dword ptr [rsp + 4], r8d
00b10 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b15 44895c2408                     mov        dword ptr [rsp + 8], r11d
00b1a 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00b1f 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00b24 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00b29 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00b2e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00b33 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00b38 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00b3d 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00b42 458bd9                         mov        r11d, r9d
00b45 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00b4a 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00b4f 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00b54 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00b59 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00b5e 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00b63 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00b68 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00b6d 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00b72 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00b77 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00b7b e86078b4ff                     call       0x7f138f9c44e0
00b80 0f1f8400780c0006               nop        dword ptr [rax + rax + 0x6000c78]
00b88 bee4ffffff                     mov        esi, 0xffffffe4
00b8d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b95 448b542408                     mov        r10d, dword ptr [rsp + 8]
00b9a 44891424                       mov        dword ptr [rsp], r10d
00b9e 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00ba3 44894c2404                     mov        dword ptr [rsp + 4], r9d
00ba8 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00bad 4489542408                     mov        dword ptr [rsp + 8], r10d
00bb2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00bb7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00bbc 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00bc1 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00bc6 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00bcb 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00bd0 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00bd5 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00bda 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00bdf 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00be4 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00be9 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00bee 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00bf3 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00bf8 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00bfd 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00c02 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00c07 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00c0c 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00c11 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00c16 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00c1b 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
00c20 666690                         nop        
00c23 e8b877b4ff                     call       0x7f138f9c44e0
00c28 0f1f8400200d0007               nop        dword ptr [rax + rax + 0x7000d20]
00c30 4533c9                         xor        r9d, r9d
00c33 4d3bc1                         cmp        r8, r9
00c36 bdffffffff                     mov        ebp, 0xffffffff
00c3b 7c08                           jl         0x7f138fe7cd45
00c3d 400f95c5                       setne      bpl
00c41 400fb6ed                       movzx      ebp, bpl
00c45 be45ffffff                     mov        esi, 0xffffff45
00c4a 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
00c52 4c890c24                       mov        qword ptr [rsp], r9
00c56 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
00c5a 894c240c                       mov        dword ptr [rsp + 0xc], ecx
00c5e 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00c66 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00c6b 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
00c6f 894c2414                       mov        dword ptr [rsp + 0x14], ecx
00c73 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00c78 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00c7d 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
00c81 894c2430                       mov        dword ptr [rsp + 0x30], ecx
00c85 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00c8a 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00c8f 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00c93 894c2438                       mov        dword ptr [rsp + 0x38], ecx
00c97 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00c9c 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
00ca1 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
00ca5 894c2440                       mov        dword ptr [rsp + 0x40], ecx
00ca9 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00cb1 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
00cb6 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00cba 894c2450                       mov        dword ptr [rsp + 0x50], ecx
00cbe 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
00cc3 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
00cc8 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
00ccc 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00cd0 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
00cd5 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
00cda 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
00ce2 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
00ce7 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
00cef 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00cf4 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00cfc 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
00d03 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d0b 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
00d13 e8c876b4ff                     call       0x7f138f9c44e0
00d18 0f1f8400100e0008               nop        dword ptr [rax + rax + 0x8000e10]
00d20 be45ffffff                     mov        esi, 0xffffff45
00d25 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00d2d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00d32 44891c24                       mov        dword ptr [rsp], r11d
00d36 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00d3b 4489542404                     mov        dword ptr [rsp + 4], r10d
00d40 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00d45 44895c2408                     mov        dword ptr [rsp + 8], r11d
00d4a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00d4f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d54 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00d59 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00d5e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00d63 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00d68 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00d6d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00d72 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00d77 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00d7c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00d81 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00d86 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00d8b 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00d90 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00d95 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00d9a 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00d9f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00da4 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00da9 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00dae 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00db3 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00db8 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00dbd 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00dc2 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00dc7 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00dcc 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00dd4 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00dd9 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00de1 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00de6 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
00dee 90                             nop        
00def e8ec75b4ff                     call       0x7f138f9c44e0
00df4 0f1f8400ec0e0009               nop        dword ptr [rax + rax + 0x9000eec]
00dfc be45ffffff                     mov        esi, 0xffffff45
00e01 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e09 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00e0e 44891c24                       mov        dword ptr [rsp], r11d
00e12 44894c2408                     mov        dword ptr [rsp + 8], r9d
00e17 e8c475b4ff                     call       0x7f138f9c44e0
00e1c 0f1f8400140f000a               nop        dword ptr [rax + rax + 0xa000f14]
00e24 be45ffffff                     mov        esi, 0xffffff45
00e29 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e31 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00e36 44891c24                       mov        dword ptr [rsp], r11d
00e3a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00e3f 4489542404                     mov        dword ptr [rsp + 4], r10d
00e44 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00e49 44895c2408                     mov        dword ptr [rsp + 8], r11d
00e4e 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00e56 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00e5b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e60 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e65 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00e6a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00e6f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00e74 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00e79 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00e7e 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00e83 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00e88 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00e8d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00e92 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00e97 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00e9c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00ea1 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00ea6 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00eab 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00eb0 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00eb5 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00eba 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00ebf 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00ec4 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00ec9 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00ece 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00ed3 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00ed8 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00edd 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00ee5 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00eea 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00ef2 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00ef7 e8e474b4ff                     call       0x7f138f9c44e0
00efc 0f1f8400f40f000b               nop        dword ptr [rax + rax + 0xb000ff4]
00f04 be45ffffff                     mov        esi, 0xffffff45
00f09 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00f11 448b542408                     mov        r10d, dword ptr [rsp + 8]
00f16 44891424                       mov        dword ptr [rsp], r10d
00f1a 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00f1f 4489442404                     mov        dword ptr [rsp + 4], r8d
00f24 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00f29 4489542408                     mov        dword ptr [rsp + 8], r10d
00f2e 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00f36 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f3b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f40 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f45 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00f4a 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00f4f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00f54 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00f59 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00f5e 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00f63 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00f68 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00f6d 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00f72 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00f77 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00f7c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00f81 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00f86 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00f8b 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00f90 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00f95 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00f9a 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00f9f 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00fa4 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00fa9 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00fae 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00fb3 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00fb8 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00fbd 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00fc5 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00fca 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00fd2 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00fd7 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
00fdf 4489542478                     mov        dword ptr [rsp + 0x78], r10d
00fe4 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00fec 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00ff4 666690                         nop        
00ff7 e8e473b4ff                     call       0x7f138f9c44e0
00ffc 0f1f8400f410000c               nop        dword ptr [rax + rax + 0xc0010f4]
01004 be45ffffff                     mov        esi, 0xffffff45
01009 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01011 448b442408                     mov        r8d, dword ptr [rsp + 8]
01016 44890424                       mov        dword ptr [rsp], r8d
0101a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0101f 4489542404                     mov        dword ptr [rsp + 4], r10d
01024 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01029 4489442408                     mov        dword ptr [rsp + 8], r8d
0102e 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01036 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0103b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01040 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01045 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0104a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0104f 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01054 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01059 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0105e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01063 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01068 4489442428                     mov        dword ptr [rsp + 0x28], r8d
0106d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01072 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01077 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0107c 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01081 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01086 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0108b 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
01090 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01095 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0109a 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0109f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
010a4 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
010a9 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
010ae 4489442450                     mov        dword ptr [rsp + 0x50], r8d
010b3 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
010b8 4c89542458                     mov        qword ptr [rsp + 0x58], r10
010bd 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
010c5 4c89542460                     mov        qword ptr [rsp + 0x60], r10
010ca 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
010d2 4c89542468                     mov        qword ptr [rsp + 0x68], r10
010d7 448b9424d4000000               mov        r10d, dword ptr [rsp + 0xd4]
010df 4489542474                     mov        dword ptr [rsp + 0x74], r10d
010e4 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
010ec 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
010f3 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
010fb e8e072b4ff                     call       0x7f138f9c44e0
01100 0f1f8400f811000d               nop        dword ptr [rax + rax + 0xd0011f8]
01108 be45ffffff                     mov        esi, 0xffffff45
0110d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01115 448b442408                     mov        r8d, dword ptr [rsp + 8]
0111a 44890424                       mov        dword ptr [rsp], r8d
0111e 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
01123 44894c2404                     mov        dword ptr [rsp + 4], r9d
01128 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0112d 4489442408                     mov        dword ptr [rsp + 8], r8d
01132 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01137 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0113c 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01141 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01146 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0114b 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01150 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01155 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0115a 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0115f 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01164 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01169 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0116e 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01173 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01178 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
0117d 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01182 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
01187 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0118c 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01191 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01196 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
0119b 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
011a0 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
011a5 4489442450                     mov        dword ptr [rsp + 0x50], r8d
011aa 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
011af 4c89442458                     mov        qword ptr [rsp + 0x58], r8
011b4 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
011bc 4c89442460                     mov        qword ptr [rsp + 0x60], r8
011c1 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
011c9 4c89442468                     mov        qword ptr [rsp + 0x68], r8
011ce 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
011d3 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
011da 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
011e2 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
011ea 90                             nop        
011eb e8f071b4ff                     call       0x7f138f9c44e0
011f0 0f1f8400e812000e               nop        dword ptr [rax + rax + 0xe0012e8]
011f8 41b9ffffff7f                   mov        r9d, 0x7fffffff
011fe 4d3bc1                         cmp        r8, r9
01201 bdffffffff                     mov        ebp, 0xffffffff
01206 7c08                           jl         0x7f138fe7d310
01208 400f95c5                       setne      bpl
0120c 400fb6ed                       movzx      ebp, bpl
01210 be45ffffff                     mov        esi, 0xffffff45
01215 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
0121d 4c890c24                       mov        qword ptr [rsp], r9
01221 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
01225 894c240c                       mov        dword ptr [rsp + 0xc], ecx
01229 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
01231 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
01236 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0123b 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
01240 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
01244 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01248 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0124d 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01252 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
01256 894c2434                       mov        dword ptr [rsp + 0x34], ecx
0125a 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0125f 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01264 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
01268 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
0126c 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01271 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01276 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
0127d 894c2444                       mov        dword ptr [rsp + 0x44], ecx
01281 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01286 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0128b 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
0128f 894c2454                       mov        dword ptr [rsp + 0x54], ecx
01293 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01298 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
0129d 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
012a2 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
012a7 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
012af 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
012b4 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
012bc 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
012c1 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
012c9 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
012d0 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
012d8 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
012e0 666690                         nop        
012e3 e8f870b4ff                     call       0x7f138f9c44e0
012e8 0f1f8400e013000f               nop        dword ptr [rax + rax + 0xf0013e0]
012f0 be45ffffff                     mov        esi, 0xffffff45
012f5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
012fd 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01302 44890c24                       mov        dword ptr [rsp], r9d
01306 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0130b 44894c2404                     mov        dword ptr [rsp + 4], r9d
01310 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01315 44894c2408                     mov        dword ptr [rsp + 8], r9d
0131a 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
0131f 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01324 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01329 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0132e 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01333 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01338 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
0133d 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01342 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01347 4489442428                     mov        dword ptr [rsp + 0x28], r8d
0134c 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01351 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01356 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0135b 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01360 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01365 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0136a 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
0136f 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01374 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01379 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0137e 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01383 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01388 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0138d 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01392 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
01397 4c89442458                     mov        qword ptr [rsp + 0x58], r8
0139c 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
013a4 4c89442460                     mov        qword ptr [rsp + 0x60], r8
013a9 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
013ae 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
013b6 90                             nop        
013b7 e82470b4ff                     call       0x7f138f9c44e0
013bc 0f1f8400b4140010               nop        dword ptr [rax + rax + 0x100014b4]
013c4 be45ffffff                     mov        esi, 0xffffff45
013c9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013d1 448b542408                     mov        r10d, dword ptr [rsp + 8]
013d6 44891424                       mov        dword ptr [rsp], r10d
013da 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
013df 4489542404                     mov        dword ptr [rsp + 4], r10d
013e4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
013e9 4489542408                     mov        dword ptr [rsp + 8], r10d
013ee 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
013f3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
013f8 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
013fd 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01402 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01407 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0140c 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01411 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01416 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0141b 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01420 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01425 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0142a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0142f 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01434 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01439 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0143e 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01443 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01448 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0144d 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01452 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01457 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
0145c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01461 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01466 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0146b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01470 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01478 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0147d 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01482 89bc2480000000                 mov        dword ptr [rsp + 0x80], edi
01489 6690                           nop        
0148b e8506fb4ff                     call       0x7f138f9c44e0
01490 0f1f840088150011               nop        dword ptr [rax + rax + 0x11001588]
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
01577 e8646eb4ff                     call       0x7f138f9c44e0
0157c 0f1f840074160012               nop        dword ptr [rax + rax + 0x12001674]
01584 be45ffffff                     mov        esi, 0xffffff45
01589 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01591 448b442408                     mov        r8d, dword ptr [rsp + 8]
01596 44890424                       mov        dword ptr [rsp], r8d
0159a 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
0159f 4489442404                     mov        dword ptr [rsp + 4], r8d
015a4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
015a9 4489542408                     mov        dword ptr [rsp + 8], r10d
015ae 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015b3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015b8 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
015bd 448944240c                     mov        dword ptr [rsp + 0xc], r8d
015c2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
015c7 4489542420                     mov        dword ptr [rsp + 0x20], r10d
015cc 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
015d1 4489442424                     mov        dword ptr [rsp + 0x24], r8d
015d6 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
015db 4489542428                     mov        dword ptr [rsp + 0x28], r10d
015e0 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
015e5 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
015ea 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
015ef 4489542440                     mov        dword ptr [rsp + 0x40], r10d
015f4 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
015f9 4489442444                     mov        dword ptr [rsp + 0x44], r8d
015fe 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01603 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01608 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0160c 666690                         nop        
0160f e8cc6db4ff                     call       0x7f138f9c44e0
01614 0f1f84000c170013               nop        dword ptr [rax + rax + 0x1300170c]
0161c be45ffffff                     mov        esi, 0xffffff45
01621 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01629 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
0162e 44890c24                       mov        dword ptr [rsp], r9d
01632 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01637 4489442404                     mov        dword ptr [rsp + 4], r8d
0163c 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01641 4489442408                     mov        dword ptr [rsp + 8], r8d
01646 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
0164b 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01650 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01655 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0165a 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0165f 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01664 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01669 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0166e 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01673 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01678 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0167d 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01682 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01687 4489442430                     mov        dword ptr [rsp + 0x30], r8d
0168c 4489542454                     mov        dword ptr [rsp + 0x54], r10d
01691 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01696 90                             nop        
01697 e8446db4ff                     call       0x7f138f9c44e0
0169c 0f1f840094170014               nop        dword ptr [rax + rax + 0x14001794]
016a4 be45ffffff                     mov        esi, 0xffffff45
016a9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
016b1 448b542408                     mov        r10d, dword ptr [rsp + 8]
016b6 44891424                       mov        dword ptr [rsp], r10d
016ba 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
016bf 44895c2404                     mov        dword ptr [rsp + 4], r11d
016c4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
016c9 4489542408                     mov        dword ptr [rsp + 8], r10d
016ce 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016d3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016d8 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
016dd 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
016e2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
016e7 4489542420                     mov        dword ptr [rsp + 0x20], r10d
016ec 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
016f1 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
016f6 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
016fb 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01700 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01705 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0170a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0170f 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01714 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01719 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0171e 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01723 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01728 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0172d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01732 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01737 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0173c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01741 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01746 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0174b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01750 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01758 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0175d 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01765 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0176a 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
01772 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
01779 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
01781 6690                           nop        
01783 e8586cb4ff                     call       0x7f138f9c44e0
01788 0f1f840080180015               nop        dword ptr [rax + rax + 0x15001880]
01790 4585c0                         test       r8d, r8d
01793 7f07                           jg         0x7f138fe7d89c
01795 33c0                           xor        eax, eax
01797 e92be9ffff                     jmp        0x7f138fe7c1c7
0179c 8954242c                       mov        dword ptr [rsp + 0x2c], edx
017a0 89742428                       mov        dword ptr [rsp + 0x28], esi
017a4 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
017a8 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
017ad 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
017b2 897c2410                       mov        dword ptr [rsp + 0x10], edi
017b6 448944240c                     mov        dword ptr [rsp + 0xc], r8d
017bb 48894424f8                     mov        qword ptr [rsp - 8], rax
017c0 8b0424                         mov        eax, dword ptr [rsp]
017c3 89442404                       mov        dword ptr [rsp + 4], eax
017c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017cc 48894424f8                     mov        qword ptr [rsp - 8], rax
017d1 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
017d8 890424                         mov        dword ptr [rsp], eax
017db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017e0 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
017e8 488bf5                         mov        rsi, rbp
017eb 8b542408                       mov        edx, dword ptr [rsp + 8]
017ef 418bc8                         mov        ecx, r8d
017f2 90                             nop        
017f3 e868cfa7ff                     call       0x7f138f8fa860
017f8 0f1f8400f0180016               nop        dword ptr [rax + rax + 0x160018f0]
01800 41ba40000000                   mov        r10d, 0x40
01806 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
0180b c4e2a9f7c0                     shlx       rax, rax, r10
01810 48894424f8                     mov        qword ptr [rsp - 8], rax
01815 8b442404                       mov        eax, dword ptr [rsp + 4]
01819 890424                         mov        dword ptr [rsp], eax
0181c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01821 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
01826 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
0182a 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
0182f 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01834 8b5c241c                       mov        ebx, dword ptr [rsp + 0x1c]
01838 8b742428                       mov        esi, dword ptr [rsp + 0x28]
0183c 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01840 e982e8ffff                     jmp        0x7f138fe7c1c7
01845 4585c0                         test       r8d, r8d
01848 7f08                           jg         0x7f138fe7d952
0184a 4533f6                         xor        r14d, r14d
0184d e9b6e8ffff                     jmp        0x7f138fe7c208
01852 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01857 4889442430                     mov        qword ptr [rsp + 0x30], rax
0185c 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01860 89742428                       mov        dword ptr [rsp + 0x28], esi
01864 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01868 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0186d 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
01872 897c2410                       mov        dword ptr [rsp + 0x10], edi
01876 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0187b 48894424f8                     mov        qword ptr [rsp - 8], rax
01880 8b0424                         mov        eax, dword ptr [rsp]
01883 89442404                       mov        dword ptr [rsp + 4], eax
01887 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0188c 48894424f8                     mov        qword ptr [rsp - 8], rax
01891 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01898 890424                         mov        dword ptr [rsp], eax
0189b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a0 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
018a8 488bf5                         mov        rsi, rbp
018ab 8b542408                       mov        edx, dword ptr [rsp + 8]
018af 418bc8                         mov        ecx, r8d
018b2 90                             nop        
018b3 e8a8cea7ff                     call       0x7f138f8fa860
018b8 0f1f8400b0190017               nop        dword ptr [rax + rax + 0x170019b0]
018c0 41ba80000000                   mov        r10d, 0x80
018c6 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
018cb c462a9f7f0                     shlx       r14, rax, r10
018d0 48894424f8                     mov        qword ptr [rsp - 8], rax
018d5 8b442404                       mov        eax, dword ptr [rsp + 4]
018d9 890424                         mov        dword ptr [rsp], eax
018dc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e1 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
018e5 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
018ea 8b5c241c                       mov        ebx, dword ptr [rsp + 0x1c]
018ee 8b742428                       mov        esi, dword ptr [rsp + 0x28]
018f2 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
018f6 488b442430                     mov        rax, qword ptr [rsp + 0x30]
018fb 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01900 e903e8ffff                     jmp        0x7f138fe7c208
01905 4533c0                         xor        r8d, r8d
01908 e9d8f0ffff                     jmp        0x7f138fe7cae5
0190d bee4ffffff                     mov        esi, 0xffffffe4
01912 48ffb42490000000               push       qword ptr [rsp + 0x90]
0191a 488f0424                       pop        qword ptr [rsp]
0191e 90                             nop        
0191f e8bc6ab4ff                     call       0x7f138f9c44e0
01924 0f1f84001c1a0018               nop        dword ptr [rax + rax + 0x18001a1c]
0192c be5d000000                     mov        esi, 0x5d
01931 6690                           nop        
01933 e8a86ab4ff                     call       0x7f138f9c44e0
01938 0f1f8400301a0019               nop        dword ptr [rax + rax + 0x19001a30]
01940 bef6ffffff                     mov        esi, 0xfffffff6
01945 6690                           nop        
01947 e8946ab4ff                     call       0x7f138f9c44e0
0194c 0f1f8400441a001a               nop        dword ptr [rax + rax + 0x1a001a44]
01954 bef6ffffff                     mov        esi, 0xfffffff6
01959 6690                           nop        
0195b e8806ab4ff                     call       0x7f138f9c44e0
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
019b0 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
019b5 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
019ba 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
019bf 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
019c4 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
019c9 6690                           nop        
019cb e8106ab4ff                     call       0x7f138f9c44e0
019d0 0f1f8400c81a001c               nop        dword ptr [rax + rax + 0x1c001ac8]
019d8 bee4ffffff                     mov        esi, 0xffffffe4
019dd 48ffb42490000000               push       qword ptr [rsp + 0x90]
019e5 488f0424                       pop        qword ptr [rsp]
019e9 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
019ee 48894424f8                     mov        qword ptr [rsp - 8], rax
019f3 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
019fa 8944241c                       mov        dword ptr [rsp + 0x1c], eax
019fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a03 895c2428                       mov        dword ptr [rsp + 0x28], ebx
01a07 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01a0b e8d069b4ff                     call       0x7f138f9c44e0
01a10 0f1f8400081b001d               nop        dword ptr [rax + rax + 0x1d001b08]
01a18 bee4ffffff                     mov        esi, 0xffffffe4
01a1d 48ffb42490000000               push       qword ptr [rsp + 0x90]
01a25 488f0424                       pop        qword ptr [rsp]
01a29 48894424f8                     mov        qword ptr [rsp - 8], rax
01a2e 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a35 89442418                       mov        dword ptr [rsp + 0x18], eax
01a39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a3e 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01a42 89542428                       mov        dword ptr [rsp + 0x28], edx
01a46 4889442430                     mov        qword ptr [rsp + 0x30], rax
01a4b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01a50 666690                         nop        
01a53 e88869b4ff                     call       0x7f138f9c44e0
01a58 0f1f8400501b001e               nop        dword ptr [rax + rax + 0x1e001b50]
01a60 bebeffffff                     mov        esi, 0xffffffbe
01a65 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a6d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01a72 44891424                       mov        dword ptr [rsp], r10d
01a76 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a7b 4489542408                     mov        dword ptr [rsp + 8], r10d
01a80 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a85 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a8a 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01a8f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a94 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a99 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01a9e 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01aa3 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01aa8 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01aad 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01ab2 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01ab7 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01abc 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01ac1 6690                           nop        
01ac3 e81869b4ff                     call       0x7f138f9c44e0
01ac8 0f1f8400c01b001f               nop        dword ptr [rax + rax + 0x1f001bc0]
01ad0 beccffffff                     mov        esi, 0xffffffcc
01ad5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01add 448b542408                     mov        r10d, dword ptr [rsp + 8]
01ae2 44891424                       mov        dword ptr [rsp], r10d
01ae6 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01aeb 48894424f8                     mov        qword ptr [rsp - 8], rax
01af0 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01af7 89442414                       mov        dword ptr [rsp + 0x14], eax
01afb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b00 895c2418                       mov        dword ptr [rsp + 0x18], ebx
01b04 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01b08 897c242c                       mov        dword ptr [rsp + 0x2c], edi
01b0c 666690                         nop        
01b0f e8cc68b4ff                     call       0x7f138f9c44e0
01b14 0f1f84000c1c0020               nop        dword ptr [rax + rax + 0x20001c0c]
01b1c beccffffff                     mov        esi, 0xffffffcc
01b21 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b29 448b442408                     mov        r8d, dword ptr [rsp + 8]
01b2e 44890424                       mov        dword ptr [rsp], r8d
01b32 48894424f8                     mov        qword ptr [rsp - 8], rax
01b37 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b3e 89442410                       mov        dword ptr [rsp + 0x10], eax
01b42 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b47 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01b4b 89542418                       mov        dword ptr [rsp + 0x18], edx
01b4f 4889442428                     mov        qword ptr [rsp + 0x28], rax
01b54 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01b59 897c2434                       mov        dword ptr [rsp + 0x34], edi
01b5d 6690                           nop        
01b5f e87c68b4ff                     call       0x7f138f9c44e0
01b64 0f1f84005c1c0021               nop        dword ptr [rax + rax + 0x21001c5c]
01b6c be45ffffff                     mov        esi, 0xffffff45
01b71 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01b76 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01b7b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01b80 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01b85 6690                           nop        
01b87 e85468b4ff                     call       0x7f138f9c44e0
01b8c 0f1f8400841c0022               nop        dword ptr [rax + rax + 0x22001c84]
01b94 be45ffffff                     mov        esi, 0xffffff45
01b99 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01b9e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01ba3 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01ba8 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01bad 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01bb2 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01bb7 e82468b4ff                     call       0x7f138f9c44e0
01bbc 0f1f8400b41c0023               nop        dword ptr [rax + rax + 0x23001cb4]
01bc4 bef6ffffff                     mov        esi, 0xfffffff6
01bc9 6690                           nop        
01bcb e81068b4ff                     call       0x7f138f9c44e0
01bd0 0f1f8400c81c0024               nop        dword ptr [rax + rax + 0x24001cc8]
01bd8 be5d000000                     mov        esi, 0x5d
01bdd 6690                           nop        
01bdf e8fc67b4ff                     call       0x7f138f9c44e0
01be4 0f1f8400dc1c0025               nop        dword ptr [rax + rax + 0x25001cdc]
01bec be45ffffff                     mov        esi, 0xffffff45
01bf1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01bf9 448b542408                     mov        r10d, dword ptr [rsp + 8]
01bfe 44891424                       mov        dword ptr [rsp], r10d
01c02 90                             nop        
01c03 e8d867b4ff                     call       0x7f138f9c44e0
01c08 0f1f8400001d0026               nop        dword ptr [rax + rax + 0x26001d00]
01c10 bef6ffffff                     mov        esi, 0xfffffff6
01c15 418be8                         mov        ebp, r8d
01c18 666690                         nop        
01c1b e8c067b4ff                     call       0x7f138f9c44e0
01c20 0f1f8400181d0027               nop        dword ptr [rax + rax + 0x27001d18]
01c28 bef6ffffff                     mov        esi, 0xfffffff6
01c2d 8be9                           mov        ebp, ecx
01c2f e8ac67b4ff                     call       0x7f138f9c44e0
01c34 0f1f84002c1d0028               nop        dword ptr [rax + rax + 0x28001d2c]
01c3c bef6ffffff                     mov        esi, 0xfffffff6
01c41 418be8                         mov        ebp, r8d
01c44 666690                         nop        
01c47 e89467b4ff                     call       0x7f138f9c44e0
01c4c 0f1f8400441d0029               nop        dword ptr [rax + rax + 0x29001d44]
01c54 bef6ffffff                     mov        esi, 0xfffffff6
01c59 6690                           nop        
01c5b e88067b4ff                     call       0x7f138f9c44e0
01c60 0f1f8400581d002a               nop        dword ptr [rax + rax + 0x2a001d58]
01c68 bef6ffffff                     mov        esi, 0xfffffff6
01c6d 6690                           nop        
01c6f e86c67b4ff                     call       0x7f138f9c44e0
01c74 0f1f84006c1d002b               nop        dword ptr [rax + rax + 0x2b001d6c]
01c7c bef6ffffff                     mov        esi, 0xfffffff6
01c81 6690                           nop        
01c83 e85867b4ff                     call       0x7f138f9c44e0
01c88 0f1f8400801d002c               nop        dword ptr [rax + rax + 0x2c001d80]
01c90 bef6ffffff                     mov        esi, 0xfffffff6
01c95 6690                           nop        
01c97 e84467b4ff                     call       0x7f138f9c44e0
01c9c 0f1f8400941d002d               nop        dword ptr [rax + rax + 0x2d001d94]
01ca4 bef6ffffff                     mov        esi, 0xfffffff6
01ca9 6690                           nop        
01cab e83067b4ff                     call       0x7f138f9c44e0
01cb0 0f1f8400a81d002e               nop        dword ptr [rax + rax + 0x2e001da8]
01cb8 bef6ffffff                     mov        esi, 0xfffffff6
01cbd 6690                           nop        
01cbf e81c67b4ff                     call       0x7f138f9c44e0
01cc4 0f1f8400bc1d002f               nop        dword ptr [rax + rax + 0x2f001dbc]
01ccc bef6ffffff                     mov        esi, 0xfffffff6
01cd1 6690                           nop        
01cd3 e80867b4ff                     call       0x7f138f9c44e0
01cd8 0f1f8400d01d0030               nop        dword ptr [rax + rax + 0x30001dd0]
01ce0 eb08                           jmp        0x7f138fe7ddea
01ce2 eb06                           jmp        0x7f138fe7ddea
01ce4 eb04                           jmp        0x7f138fe7ddea
01ce6 eb02                           jmp        0x7f138fe7ddea
01ce8 eb00                           jmp        0x7f138fe7ddea
01cea 488bf0                         mov        rsi, rax
01ced e92eedffff                     jmp        0x7f138fe7cb20
01cf2 49ba4bcbe78f137f0000           movabs     r10, 0x7f138fe7cb4b
01cfc 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01d03 e9d8f0a7ff                     jmp        0x7f138f8fcee0
01d08 e893bca6ff                     call       0x7f138f8e9aa0
01d0d e90ce3ffff                     jmp        0x7f138fe7c11e
01d12 f4                             hlt        
01d13 f4                             hlt        
01d14 f4                             hlt        
01d15 f4                             hlt        
01d16 f4                             hlt        
01d17 f4                             hlt        
