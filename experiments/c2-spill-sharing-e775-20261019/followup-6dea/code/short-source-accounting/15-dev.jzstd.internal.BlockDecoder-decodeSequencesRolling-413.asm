00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85561c0000                   jne        0x7fefc7e701f4
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
00050 0f83ff170000                   jae        0x7fefc7e6fdd5
00056 0fb64c1607                     movzx      ecx, byte ptr [rsi + rdx + 7]
0005b 85c9                           test       ecx, ecx
0005d 0f8411180000                   je         0x7fefc7e6fdf4
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
0009a 0f8c38160000                   jl         0x7fefc7e6fc58
000a0 85ff                           test       edi, edi
000a2 0f8c78190000                   jl         0x7fefc7e6ffa0
000a8 8b2c24                         mov        ebp, dword ptr [rsp]
000ab 83c5f9                         add        ebp, -7
000ae 443bed                         cmp        r13d, ebp
000b1 0f836d180000                   jae        0x7fefc7e6fea4
000b7 458bd5                         mov        r10d, r13d
000ba 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
000c2 4b8b441108                     mov        rax, qword ptr [r9 + r10 + 8]
000c7 4183c0f8                       add        r8d, -8
000cb 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000d3 4183c2f0                       add        r10d, -0x10
000d7 4183f808                       cmp        r8d, 8
000db 0f8cac160000                   jl         0x7fefc7e6fd0d
000e1 85ff                           test       edi, edi
000e3 0f8c83190000                   jl         0x7fefc7e6ffec
000e9 8b2c24                         mov        ebp, dword ptr [rsp]
000ec 83c5f9                         add        ebp, -7
000ef 443bd5                         cmp        r10d, ebp
000f2 0f836c180000                   jae        0x7fefc7e6fee4
000f8 458bc2                         mov        r8d, r10d
000fb 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00103 4f8b740308                     mov        r14, qword ptr [r11 + r8 + 8]
00108 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
0010d 448b4518                       mov        r8d, dword ptr [rbp + 0x18]
00111 4585c0                         test       r8d, r8d
00114 0f846e170000                   je         0x7fefc7e6fe08
0011a 448b5d1c                       mov        r11d, dword ptr [rbp + 0x1c]
0011e 418b4b04                       mov        ecx, dword ptr [r11 + 4]
00122 448b4d20                       mov        r9d, dword ptr [rbp + 0x20]
00126 4585c9                         test       r9d, r9d
00129 0f846d170000                   je         0x7fefc7e6fe1c
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
0018c 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00191 4d8bd3                         mov        r10, r11
00194 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00199 85c9                           test       ecx, ecx
0019b 0f84dc080000                   je         0x7fefc7e6effd
001a1 be40000000                     mov        esi, 0x40
001a6 2bf3                           sub        esi, ebx
001a8 3bce                           cmp        ecx, esi
001aa 0f8f13020000                   jg         0x7fefc7e6e943
001b0 2bf1                           sub        esi, ecx
001b2 c4e2cbf7e8                     shrx       rbp, rax, rsi
001b7 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001bc 83f940                         cmp        ecx, 0x40
001bf 0f8d93190000                   jge        0x7fefc7e700d8
001c5 41bb01000000                   mov        r11d, 1
001cb c442f1f7d3                     shlx       r10, r11, rcx
001d0 49ffca                         dec        r10
001d3 4c23d5                         and        r10, rbp
001d6 4c89542460                     mov        qword ptr [rsp + 0x60], r10
001db 448bd1                         mov        r10d, ecx
001de 458bca                         mov        r9d, r10d
001e1 442b4c240c                     sub        r9d, dword ptr [rsp + 0xc]
001e6 458d5908                       lea        r11d, [r9 + 8]
001ea 4183fb40                       cmp        r11d, 0x40
001ee 7c33                           jl         0x7fefc7e6e7a3
001f0 4489542428                     mov        dword ptr [rsp + 0x28], r10d
001f5 4183c1c8                       add        r9d, -0x38
001f9 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001fe 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00206 8b542408                       mov        edx, dword ptr [rsp + 8]
0020a 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
0020e 90                             nop        
0020f e8ccd0a8ff                     call       0x7fefc78fb860
00214 0f1f84000c030000               nop        dword ptr [rax + rax + 0x30c]
0021c 4889442420                     mov        qword ptr [rsp + 0x20], rax
00221 eb31                           jmp        0x7fefc7e6e7d4
00223 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00228 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00230 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
00235 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
0023a 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00242 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0024a 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
0024f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00254 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00259 418b6a04                       mov        ebp, dword ptr [r10 + 4]
0025d 83fd20                         cmp        ebp, 0x20
00260 0f8d56180000                   jge        0x7fefc7e7003c
00266 c462d3f7542460                 shrx       r10, qword ptr [rsp + 0x60], rbp
0026d 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00272 41bb01000000                   mov        r11d, 1
00278 c44251f7db                     shlx       r11d, r11d, ebp
0027d 41ffcb                         dec        r11d
00280 4d63d3                         movsxd     r10, r11d
00283 4c23542460                     and        r10, qword ptr [rsp + 0x60]
00288 458bda                         mov        r11d, r10d
0028b 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00290 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00295 458b5204                       mov        r10d, dword ptr [r10 + 4]
00299 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0029e 4183fa20                       cmp        r10d, 0x20
002a2 0f8d3c180000                   jge        0x7fefc7e70064
002a8 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
002b0 458b5a04                       mov        r11d, dword ptr [r10 + 4]
002b4 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
002bc 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
002c1 458b5a14                       mov        r11d, dword ptr [r10 + 0x14]
002c5 458b4b04                       mov        r9d, dword ptr [r11 + 4]
002c9 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
002ce 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
002d2 458b4204                       mov        r8d, dword ptr [r10 + 4]
002d6 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
002db 458b5a14                       mov        r11d, dword ptr [r10 + 0x14]
002df 458b5b04                       mov        r11d, dword ptr [r11 + 4]
002e3 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
002e8 4585d2                         test       r10d, r10d
002eb 0f8e5c150000                   jle        0x7fefc7e6fdcd
002f1 41ffc9                         dec        r9d
002f4 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
002f9 41ffc8                         dec        r8d
002fc 4489442470                     mov        dword ptr [rsp + 0x70], r8d
00301 41ffcb                         dec        r11d
00304 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
00309 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0030e c462bbf7542468                 shrx       r10, qword ptr [rsp + 0x68], r8
00315 41bb01000000                   mov        r11d, 1
0031b c44239f7db                     shlx       r11d, r11d, r8d
00320 458bd2                         mov        r10d, r10d
00323 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00328 41ffcb                         dec        r11d
0032b 4d63d3                         movsxd     r10, r11d
0032e 4c23542468                     and        r10, qword ptr [rsp + 0x68]
00333 458bda                         mov        r11d, r10d
00336 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
0033b 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00343 458b92f4000000                 mov        r10d, dword ptr [r10 + 0xf4]
0034a 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00352 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0035a 458b9af0000000                 mov        r11d, dword ptr [r10 + 0xf0]
00361 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00369 458b5b04                       mov        r11d, dword ptr [r11 + 4]
0036d 4585db                         test       r11d, r11d
00370 0f863a150000                   jbe        0x7fefc7e6fe30
00376 4d63d3                         movsxd     r10, r11d
00379 4c635c244c                     movsxd     r11, dword ptr [rsp + 0x4c]
0037e 49ffcb                         dec        r11
00381 4d3bda                         cmp        r11, r10
00384 0f8326150000                   jae        0x7fefc7e6fe30
0038a 448b542404                     mov        r10d, dword ptr [rsp + 4]
0038f 4585d2                         test       r10d, r10d
00392 0f8c14160000                   jl         0x7fefc7e6ff2c
00398 448b1c24                       mov        r11d, dword ptr [rsp]
0039c 4183c3f9                       add        r11d, -7
003a0 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
003a8 4533db                         xor        r11d, r11d
003ab 4533d2                         xor        r10d, r10d
003ae 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
003b6 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
003be e98d020000                     jmp        0x7fefc7e6ebd0
003c3 8be9                           mov        ebp, ecx
003c5 2bee                           sub        ebp, esi
003c7 e814cfa8ff                     call       0x7fefc78fb860
003cc 0f1f8400c4040001               nop        dword ptr [rax + rax + 0x10004c4]
003d4 4823442428                     and        rax, qword ptr [rsp + 0x28]
003d9 41ba40000000                   mov        r10d, 0x40
003df 442bd5                         sub        r10d, ebp
003e2 c462d1f7d8                     shlx       r11, rax, rbp
003e7 c462abf7942498000000           shrx       r10, qword ptr [rsp + 0x98], r10
003f1 4d0bda                         or         r11, r10
003f4 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
003f9 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
003fe e9dbfdffff                     jmp        0x7fefc7e6e75e
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
0043a 0f8d0c090000                   jge        0x7fefc7e6f2cc
00440 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0044a 41ba01000000                   mov        r10d, 1
00450 c442d1f7d2                     shlx       r10, r10, rbp
00455 49ffca                         dec        r10
00458 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00460 458bda                         mov        r11d, r10d
00463 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0046a 83fd40                         cmp        ebp, 0x40
0046d 0f8db9090000                   jge        0x7fefc7e6f3ac
00473 c4c2d3f7f9                     shrx       rdi, r9, rbp
00478 41ba01000000                   mov        r10d, 1
0047e c442d1f7d2                     shlx       r10, r10, rbp
00483 49ffca                         dec        r10
00486 4d23d1                         and        r10, r9
00489 418bda                         mov        ebx, r10d
0048c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00493 83fd40                         cmp        ebp, 0x40
00496 0f8d900a0000                   jge        0x7fefc7e6f4ac
0049c c4e2d3f7cf                     shrx       rcx, rdi, rbp
004a1 41ba01000000                   mov        r10d, 1
004a7 c442d1f7d2                     shlx       r10, r10, rbp
004ac 49ffca                         dec        r10
004af 4c23d7                         and        r10, rdi
004b2 458bd2                         mov        r10d, r10d
004b5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004bc 83fd40                         cmp        ebp, 0x40
004bf 0f8d6b0b0000                   jge        0x7fefc7e6f5b0
004c5 41b801000000                   mov        r8d, 1
004cb c442d1f7c0                     shlx       r8, r8, rbp
004d0 49ffc8                         dec        r8
004d3 4c23c1                         and        r8, rcx
004d6 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
004de 418bc9                         mov        ecx, r9d
004e1 4103ca                         add        ecx, r10d
004e4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
004e9 458bd2                         mov        r10d, r10d
004ec 4403d3                         add        r10d, ebx
004ef 4863d9                         movsxd     rbx, ecx
004f2 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
004fa 458bc9                         mov        r9d, r9d
004fd 4d03c1                         add        r8, r9
00500 4c8b8c24e8000000               mov        r9, qword ptr [rsp + 0xe8]
00508 4c03cb                         add        r9, rbx
0050b 4c898c24e8000000               mov        qword ptr [rsp + 0xe8], r9
00513 4d85c0                         test       r8, r8
00516 0f8e3c070000                   jle        0x7fefc7e6f1d8
0051c 4981f8ffffff7f                 cmp        r8, 0x7fffffff
00523 0f8ff70b0000                   jg         0x7fefc7e6f6a0
00529 4181faffff0100                 cmp        r10d, 0x1ffff
00530 0f8fe20c0000                   jg         0x7fefc7e6f798
00536 81f9ffff0300                   cmp        ecx, 0x3ffff
0053c 0f8faa0d0000                   jg         0x7fefc7e6f86c
00542 458bc8                         mov        r9d, r8d
00545 4181f900000010                 cmp        r9d, 0x10000000
0054c 0f836e0e0000                   jae        0x7fefc7e6f940
00552 4d63d2                         movsxd     r10, r10d
00555 4d63c1                         movsxd     r8, r9d
00558 48c1e312                       shl        rbx, 0x12
0055c 49c1e024                       shl        r8, 0x24
00560 4c0bc3                         or         r8, rbx
00563 4d0bc2                         or         r8, r10
00566 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
0056d 448b9424f0000000               mov        r10d, dword ptr [rsp + 0xf0]
00575 4e8944d108                     mov        qword ptr [rcx + r10*8 + 8], r8
0057a 8b2c24                         mov        ebp, dword ptr [rsp]
0057d 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00581 0f8db8000000                   jge        0x7fefc7e6ebbf
00587 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0058f 49c1ea30                       shr        r10, 0x30
00593 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
00598 49c1e830                       shr        r8, 0x30
0059c 418bca                         mov        ecx, r10d
0059f 418bd8                         mov        ebx, r8d
005a2 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
005aa c4423bf7cb                     shrx       r9d, r11d, r8d
005af 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
005b7 44039424c8000000               add        r10d, dword ptr [rsp + 0xc8]
005bf c4422bf7c3                     shrx       r8d, r11d, r10d
005c4 4103d8                         add        ebx, r8d
005c7 895c2460                       mov        dword ptr [rsp + 0x60], ebx
005cb 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
005d3 4183fa20                       cmp        r10d, 0x20
005d7 0f8df70e0000                   jge        0x7fefc7e6fa54
005dd 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005e5 49c1ea30                       shr        r10, 0x30
005e9 458bd2                         mov        r10d, r10d
005ec 41b801000000                   mov        r8d, 1
005f2 8bbc24c8000000                 mov        edi, dword ptr [rsp + 0xc8]
005f9 c44241f7c0                     shlx       r8d, r8d, edi
005fe 41ffc8                         dec        r8d
00601 4523c1                         and        r8d, r9d
00604 4403c1                         add        r8d, ecx
00607 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0060c 448b8c24cc000000               mov        r9d, dword ptr [rsp + 0xcc]
00614 4183f920                       cmp        r9d, 0x20
00618 0f8d460f0000                   jge        0x7fefc7e6fae4
0061e 41b901000000                   mov        r9d, 1
00624 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
0062c c44239f7c1                     shlx       r8d, r9d, r8d
00631 41ffc8                         dec        r8d
00634 4523c3                         and        r8d, r11d
00637 4503c2                         add        r8d, r10d
0063a 4489442468                     mov        dword ptr [rsp + 0x68], r8d
0063f 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00643 0f8d79030000                   jge        0x7fefc7e6ef42
00649 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00650 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00655 4423542460                     and        r10d, dword ptr [rsp + 0x60]
0065a 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
0065f 458b5814                       mov        r11d, dword ptr [r8 + 0x14]
00663 458b4304                       mov        r8d, dword ptr [r11 + 4]
00667 453bd0                         cmp        r10d, r8d
0066a 0f831d040000                   jae        0x7fefc7e6f00d
00670 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
00674 234c2468                       and        ecx, dword ptr [rsp + 0x68]
00678 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0067d 458b4114                       mov        r8d, dword ptr [r9 + 0x14]
00681 458b4804                       mov        r9d, dword ptr [r8 + 4]
00685 4f8b54d308                     mov        r10, qword ptr [r11 + r10*8 + 8]
0068a 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0068f 413bc9                         cmp        ecx, r9d
00692 0f837c040000                   jae        0x7fefc7e6f094
00698 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0069d 44235c2448                     and        r11d, dword ptr [rsp + 0x48]
006a2 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
006a7 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
006ab 418b5a04                       mov        ebx, dword ptr [r10 + 4]
006af 4d8b44c808                     mov        r8, qword ptr [r8 + rcx*8 + 8]
006b4 4c89842480000000               mov        qword ptr [rsp + 0x80], r8
006bc 443bdb                         cmp        r11d, ebx
006bf 0f83eb040000                   jae        0x7fefc7e6f130
006c5 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
006ca 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006d2 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006d9 ffc5                           inc        ebp
006db 892c24                         mov        dword ptr [rsp], ebp
006de 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006e2 0f8d56030000                   jge        0x7fefc7e6efbe
006e8 49c1ea28                       shr        r10, 0x28
006ec 458bda                         mov        r11d, r10d
006ef 450fb6db                       movzx      r11d, r11b
006f3 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
006fb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00700 49c1ea28                       shr        r10, 0x28
00704 458bd2                         mov        r10d, r10d
00707 410fb6ea                       movzx      ebp, r10b
0070b 4103eb                         add        ebp, r11d
0070e 4d8bd0                         mov        r10, r8
00711 49c1ea28                       shr        r10, 0x28
00715 458bda                         mov        r11d, r10d
00718 450fb6db                       movzx      r11d, r11b
0071c 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00724 4103eb                         add        ebp, r11d
00727 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
0072e 41ba01000000                   mov        r10d, 1
00734 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
0073c 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00744 49c1ea20                       shr        r10, 0x20
00748 458bda                         mov        r11d, r10d
0074b 410fb6eb                       movzx      ebp, r11b
0074f 89ac24d4000000                 mov        dword ptr [rsp + 0xd4], ebp
00756 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0075b 49c1ea20                       shr        r10, 0x20
0075f 458bd2                         mov        r10d, r10d
00762 410fb6ea                       movzx      ebp, r10b
00766 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
0076d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00775 49c1ea20                       shr        r10, 0x20
00779 458bda                         mov        r11d, r10d
0077c 410fb6eb                       movzx      ebp, r11b
00780 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
00787 448bc5                         mov        r8d, ebp
0078a 44038424d4000000               add        r8d, dword ptr [rsp + 0xd4]
00792 44038424d8000000               add        r8d, dword ptr [rsp + 0xd8]
0079a 44038424d0000000               add        r8d, dword ptr [rsp + 0xd0]
007a2 4585c0                         test       r8d, r8d
007a5 0f84c2020000                   je         0x7fefc7e6efed
007ab 4183f83f                       cmp        r8d, 0x3f
007af 0f8ff70c0000                   jg         0x7fefc7e6fa2c
007b5 41b940000000                   mov        r9d, 0x40
007bb 442b4c243c                     sub        r9d, dword ptr [rsp + 0x3c]
007c0 453bc1                         cmp        r8d, r9d
007c3 7e48                           jle        0x7fefc7e6ed8d
007c5 418bc8                         mov        ecx, r8d
007c8 412bc9                         sub        ecx, r9d
007cb 4183f940                       cmp        r9d, 0x40
007cf 0f8d170e0000                   jge        0x7fefc7e6fb6c
007d5 41ba01000000                   mov        r10d, 1
007db c442b1f7d2                     shlx       r10, r10, r9
007e0 49ffca                         dec        r10
007e3 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007eb c4c2f1f7ea                     shlx       rbp, r10, rcx
007f0 41ba40000000                   mov        r10d, 0x40
007f6 442bd1                         sub        r10d, ecx
007f9 c462abf7542420                 shrx       r10, qword ptr [rsp + 0x20], r10
00800 490bea                         or         rbp, r10
00803 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
0080b eb26                           jmp        0x7fefc7e6edb3
0080d 41ba01000000                   mov        r10d, 1
00813 c442b9f7d2                     shlx       r10, r10, r8
00818 452bc8                         sub        r9d, r8d
0081b c4e2b3f7ac2498000000           shrx       rbp, qword ptr [rsp + 0x98], r9
00825 49ffca                         dec        r10
00828 4923ea                         and        rbp, r10
0082b 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
00833 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00838 4503d0                         add        r10d, r8d
0083b 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00840 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00845 4503d8                         add        r11d, r8d
00848 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0084d 4183fb40                       cmp        r11d, 0x40
00851 0f8cd9fbffff                   jl         0x7fefc7e6e9b0
00857 4183c3c0                       add        r11d, -0x40
0085b 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00860 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00864 83c5f8                         add        ebp, -8
00867 896c240c                       mov        dword ptr [rsp + 0xc], ebp
0086b 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0086f 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
00873 83c1f0                         add        ecx, -0x10
00876 83f908                         cmp        ecx, 8
00879 0f8cf5000000                   jl         0x7fefc7e6eef4
0087f 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00884 4183c0e8                       add        r8d, -0x18
00888 443b8424c4000000               cmp        r8d, dword ptr [rsp + 0xc4]
00890 0f826dfbffff                   jb         0x7fefc7e6e983
00896 bee4ffffff                     mov        esi, 0xffffffe4
0089b 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
008a3 448b542408                     mov        r10d, dword ptr [rsp + 8]
008a8 44891424                       mov        dword ptr [rsp], r10d
008ac 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
008b1 4489542404                     mov        dword ptr [rsp + 4], r10d
008b6 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
008bb 44895c2408                     mov        dword ptr [rsp + 8], r11d
008c0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
008c5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
008ca 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
008cf 448954240c                     mov        dword ptr [rsp + 0xc], r10d
008d4 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
008d9 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
008de 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
008e3 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
008e8 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
008ed 4489542420                     mov        dword ptr [rsp + 0x20], r10d
008f2 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
008f7 4489542424                     mov        dword ptr [rsp + 0x24], r10d
008fc 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00901 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00906 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0090b 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00910 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00915 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0091a 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0091f 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00924 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00929 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0092e 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00933 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00938 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0093d 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00942 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0094a 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0094f 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00957 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0095c 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00964 666690                         nop        
00967 e87450b5ff                     call       0x7fefc79c3f60
0096c 0f1f8400640a0002               nop        dword ptr [rax + rax + 0x2000a64]
00974 85c9                           test       ecx, ecx
00976 7f08                           jg         0x7fefc7e6ef00
00978 4533d2                         xor        r10d, r10d
0097b e990faffff                     jmp        0x7fefc7e6e990
00980 8be9                           mov        ebp, ecx
00982 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
0098a 8b542408                       mov        edx, dword ptr [rsp + 8]
0098e 90                             nop        
0098f e84cc9a8ff                     call       0x7fefc78fb860
00994 0f1f84008c0a0003               nop        dword ptr [rax + rax + 0x3000a8c]
0099c 448b542408                     mov        r10d, dword ptr [rsp + 8]
009a1 41c1e203                       shl        r10d, 3
009a5 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
009aa 41c1e003                       shl        r8d, 3
009ae 452bd0                         sub        r10d, r8d
009b1 4181c2c0000000                 add        r10d, 0xc0
009b8 c462a9f7d0                     shlx       r10, rax, r10
009bd e94efaffff                     jmp        0x7fefc7e6e990
009c2 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009ca 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009d2 4d03c2                         add        r8, r10
009d5 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
009dd 4d3bc2                         cmp        r8, r10
009e0 7e33                           jle        0x7fefc7e6ef95
009e2 48be085529e300000000           movabs     rsi, 0xe3295508
009ec 666690                         nop        
009ef e8ecc8a8ff                     call       0x7fefc78fb860
009f4 0f1f8400ec0a0004               nop        dword ptr [rax + rax + 0x4000aec]
009fc 4885c0                         test       rax, rax
009ff 0f842b110000                   je         0x7fefc7e700b0
00a05 488bf0                         mov        rsi, rax
00a08 4881c410010000                 add        rsp, 0x110
00a0f 5d                             pop        rbp
00a10 e94bc1b5ff                     jmp        0x7fefc79cb0e0
00a15 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a1a 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a22 0f851c110000                   jne        0x7fefc7e700c4
00a28 418bc0                         mov        eax, r8d
00a2b 4881c410010000                 add        rsp, 0x110
00a32 5d                             pop        rbp
00a33 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a37 0f8721120000                   ja         0x7fefc7e701de
00a3d c3                             ret        
00a3e 4533d2                         xor        r10d, r10d
00a41 4533c0                         xor        r8d, r8d
00a44 4533db                         xor        r11d, r11d
00a47 33c9                           xor        ecx, ecx
00a49 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00a51 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
00a59 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00a61 898c24f4000000                 mov        dword ptr [rsp + 0xf4], ecx
00a68 e9cffcffff                     jmp        0x7fefc7e6ecbc
00a6d 4533d2                         xor        r10d, r10d
00a70 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
00a78 e9b3f9ffff                     jmp        0x7fefc7e6e9b0
00a7d 4533d2                         xor        r10d, r10d
00a80 4533db                         xor        r11d, r11d
00a83 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00a88 e951f7ffff                     jmp        0x7fefc7e6e75e
00a8d bee4ffffff                     mov        esi, 0xffffffe4
00a92 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a9a 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00a9f 44890c24                       mov        dword ptr [rsp], r9d
00aa3 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00aa8 4489442404                     mov        dword ptr [rsp + 4], r8d
00aad 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00ab2 44894c2408                     mov        dword ptr [rsp + 8], r9d
00ab7 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
00abc 4c89442418                     mov        qword ptr [rsp + 0x18], r8
00ac1 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00ac6 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00acb 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00ad0 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00ad5 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00ada 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00adf 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00ae4 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00ae9 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00aee 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00af3 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00af8 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00afd 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00b02 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
00b07 e8d44eb5ff                     call       0x7fefc79c3f60
00b0c 0f1f8400040c0005               nop        dword ptr [rax + rax + 0x5000c04]
00b14 bee4ffffff                     mov        esi, 0xffffffe4
00b19 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b21 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b26 44891c24                       mov        dword ptr [rsp], r11d
00b2a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00b2f 4489542404                     mov        dword ptr [rsp + 4], r10d
00b34 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b39 44895c2408                     mov        dword ptr [rsp + 8], r11d
00b3e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b43 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b48 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00b4d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00b52 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00b57 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00b5c 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00b61 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00b66 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00b6b 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00b70 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00b75 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00b7a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00b7f 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00b84 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00b89 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00b8e 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b93 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00b98 4489442460                     mov        dword ptr [rsp + 0x60], r8d
00b9d 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00ba1 6690                           nop        
00ba3 e8384eb5ff                     call       0x7fefc79c3f60
00ba8 0f1f8400a00c0006               nop        dword ptr [rax + rax + 0x6000ca0]
00bb0 bee4ffffff                     mov        esi, 0xffffffe4
00bb5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00bbd 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00bc2 44890c24                       mov        dword ptr [rsp], r9d
00bc6 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00bcb 4489442404                     mov        dword ptr [rsp + 4], r8d
00bd0 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00bd5 44894c2408                     mov        dword ptr [rsp + 8], r9d
00bda 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
00bdf 4c89442418                     mov        qword ptr [rsp + 0x18], r8
00be4 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00be9 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00bee 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00bf3 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00bf8 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00bfd 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00c02 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00c07 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00c0c 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00c11 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00c16 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00c1b 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00c20 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00c25 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00c2a 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00c2f 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
00c34 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
00c39 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00c3e 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00c43 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00c48 666690                         nop        
00c4b e8904db5ff                     call       0x7fefc79c3f60
00c50 0f1f8400480d0007               nop        dword ptr [rax + rax + 0x7000d48]
00c58 4533c9                         xor        r9d, r9d
00c5b 4d3bc1                         cmp        r8, r9
00c5e bdffffffff                     mov        ebp, 0xffffffff
00c63 7c08                           jl         0x7fefc7e6f1ed
00c65 400f95c5                       setne      bpl
00c69 400fb6ed                       movzx      ebp, bpl
00c6d be45ffffff                     mov        esi, 0xffffff45
00c72 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
00c7a 4c890c24                       mov        qword ptr [rsp], r9
00c7e 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00c83 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00c88 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00c90 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00c95 8b5c243c                       mov        ebx, dword ptr [rsp + 0x3c]
00c99 895c2414                       mov        dword ptr [rsp + 0x14], ebx
00c9d 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00ca2 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00ca7 8b5c2434                       mov        ebx, dword ptr [rsp + 0x34]
00cab 895c2430                       mov        dword ptr [rsp + 0x30], ebx
00caf 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00cb4 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00cb9 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
00cbd 895c2438                       mov        dword ptr [rsp + 0x38], ebx
00cc1 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00cc6 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
00ccb 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
00ccf 895c2440                       mov        dword ptr [rsp + 0x40], ebx
00cd3 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00cdb 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
00ce0 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00ce4 895c2450                       mov        dword ptr [rsp + 0x50], ebx
00ce8 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
00ced 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
00cf2 8b5c2474                       mov        ebx, dword ptr [rsp + 0x74]
00cf6 895c2458                       mov        dword ptr [rsp + 0x58], ebx
00cfa 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
00cff 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
00d04 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
00d0c 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
00d11 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
00d19 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00d1e 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00d26 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
00d2d 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d35 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
00d3d 6690                           nop        
00d3f e89c4cb5ff                     call       0x7fefc79c3f60
00d44 0f1f84003c0e0008               nop        dword ptr [rax + rax + 0x8000e3c]
00d4c be45ffffff                     mov        esi, 0xffffff45
00d51 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00d59 448b542408                     mov        r10d, dword ptr [rsp + 8]
00d5e 44891424                       mov        dword ptr [rsp], r10d
00d62 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00d67 44895c2404                     mov        dword ptr [rsp + 4], r11d
00d6c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00d71 4489542408                     mov        dword ptr [rsp + 8], r10d
00d76 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00d7e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00d83 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00d88 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d8d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00d92 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00d97 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00d9c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00da1 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00da6 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00dab 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00db0 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00db5 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00dba 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00dbf 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00dc4 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00dc9 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00dce 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00dd3 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00dd8 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00ddd 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00de2 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00de7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00dec 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00df1 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00df6 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00dfb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00e00 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00e05 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00e0d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00e12 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00e1a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00e1f e8bc4bb5ff                     call       0x7fefc79c3f60
00e24 0f1f84001c0f0009               nop        dword ptr [rax + rax + 0x9000f1c]
00e2c be45ffffff                     mov        esi, 0xffffff45
00e31 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e39 448b442408                     mov        r8d, dword ptr [rsp + 8]
00e3e 44890424                       mov        dword ptr [rsp], r8d
00e42 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00e47 4489542404                     mov        dword ptr [rsp + 4], r10d
00e4c 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00e51 4489442408                     mov        dword ptr [rsp + 8], r8d
00e56 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00e5e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00e63 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e68 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e6d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00e72 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00e77 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00e7c 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00e81 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00e86 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00e8b 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00e90 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00e95 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00e9a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00e9f 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00ea4 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00ea9 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00eae 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00eb3 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00eb8 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00ebd 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00ec2 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00ec7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00ecc 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00ed1 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
00ed6 4489442450                     mov        dword ptr [rsp + 0x50], r8d
00edb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00ee0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00ee5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00eed 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00ef2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00efa 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00eff 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
00f07 4489442478                     mov        dword ptr [rsp + 0x78], r8d
00f0c 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00f14 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00f1c 666690                         nop        
00f1f e8bc4ab5ff                     call       0x7fefc79c3f60
00f24 0f1f84001c10000a               nop        dword ptr [rax + rax + 0xa00101c]
00f2c be45ffffff                     mov        esi, 0xffffff45
00f31 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00f39 448b542408                     mov        r10d, dword ptr [rsp + 8]
00f3e 44891424                       mov        dword ptr [rsp], r10d
00f42 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00f47 4489442404                     mov        dword ptr [rsp + 4], r8d
00f4c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00f51 4489542408                     mov        dword ptr [rsp + 8], r10d
00f56 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00f5e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f63 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f68 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f6d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00f72 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00f77 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00f7c 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00f81 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00f86 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00f8b 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00f90 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00f95 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00f9a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00f9f 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00fa4 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00fa9 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00fae 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00fb3 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00fb8 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00fbd 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00fc2 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00fc7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00fcc 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00fd1 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
00fd6 4489442450                     mov        dword ptr [rsp + 0x50], r8d
00fdb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00fe0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00fe5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00fed 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00ff2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00ffa 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00fff 448b9424d4000000               mov        r10d, dword ptr [rsp + 0xd4]
01007 4489542474                     mov        dword ptr [rsp + 0x74], r10d
0100c 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
01014 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
0101b 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
01023 e8b849b5ff                     call       0x7fefc79c3f60
01028 0f1f84002011000b               nop        dword ptr [rax + rax + 0xb001120]
01030 be45ffffff                     mov        esi, 0xffffff45
01035 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0103d 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01042 44890c24                       mov        dword ptr [rsp], r9d
01046 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
0104b 4489442404                     mov        dword ptr [rsp + 4], r8d
01050 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01055 44894c2408                     mov        dword ptr [rsp + 8], r9d
0105a 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
0105f 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01064 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01069 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0106e 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01073 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01078 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
0107d 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01082 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01087 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
0108c 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01091 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01096 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0109b 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
010a0 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
010a5 4489442434                     mov        dword ptr [rsp + 0x34], r8d
010aa 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
010af 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
010b4 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
010b9 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
010be 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
010c3 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
010c8 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
010cd 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
010d2 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
010d7 4c89442458                     mov        qword ptr [rsp + 0x58], r8
010dc 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
010e4 4c89442460                     mov        qword ptr [rsp + 0x60], r8
010e9 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
010f1 4c89442468                     mov        qword ptr [rsp + 0x68], r8
010f6 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
010fb 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
01102 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
0110a 48898c2488000000               mov        qword ptr [rsp + 0x88], rcx
01112 90                             nop        
01113 e8c848b5ff                     call       0x7fefc79c3f60
01118 0f1f84001012000c               nop        dword ptr [rax + rax + 0xc001210]
01120 41b9ffffff7f                   mov        r9d, 0x7fffffff
01126 4d3bc1                         cmp        r8, r9
01129 bdffffffff                     mov        ebp, 0xffffffff
0112e 7c08                           jl         0x7fefc7e6f6b8
01130 400f95c5                       setne      bpl
01134 400fb6ed                       movzx      ebp, bpl
01138 be45ffffff                     mov        esi, 0xffffff45
0113d 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
01145 4c890c24                       mov        qword ptr [rsp], r9
01149 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0114e 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01153 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
0115b 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
01160 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01165 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
0116a 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
0116e 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
01172 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01177 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0117c 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
01180 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01184 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01189 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0118e 8b5c2468                       mov        ebx, dword ptr [rsp + 0x68]
01192 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01196 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0119b 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
011a0 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
011a7 895c2444                       mov        dword ptr [rsp + 0x44], ebx
011ab 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
011b0 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
011b5 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
011b9 895c2454                       mov        dword ptr [rsp + 0x54], ebx
011bd 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
011c2 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
011c7 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
011cc 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
011d1 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
011d9 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
011de 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
011e6 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
011eb 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
011f3 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
011fa 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01202 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
0120a 90                             nop        
0120b e8d047b5ff                     call       0x7fefc79c3f60
01210 0f1f84000813000d               nop        dword ptr [rax + rax + 0xd001308]
01218 be45ffffff                     mov        esi, 0xffffff45
0121d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01225 448b442408                     mov        r8d, dword ptr [rsp + 8]
0122a 44890424                       mov        dword ptr [rsp], r8d
0122e 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01233 4489442404                     mov        dword ptr [rsp + 4], r8d
01238 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
0123d 44894c2408                     mov        dword ptr [rsp + 8], r9d
01242 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01247 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0124c 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01251 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01256 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0125b 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01260 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01265 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0126a 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0126f 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01274 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01279 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0127e 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01283 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01288 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
0128d 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01292 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01297 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0129c 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
012a1 4489442448                     mov        dword ptr [rsp + 0x48], r8d
012a6 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
012ab 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
012b0 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
012b5 4489442450                     mov        dword ptr [rsp + 0x50], r8d
012ba 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
012bf 4c89442458                     mov        qword ptr [rsp + 0x58], r8
012c4 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
012cc 4c89442460                     mov        qword ptr [rsp + 0x60], r8
012d1 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
012d6 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
012de 90                             nop        
012df e8fc46b5ff                     call       0x7fefc79c3f60
012e4 0f1f8400dc13000e               nop        dword ptr [rax + rax + 0xe0013dc]
012ec be45ffffff                     mov        esi, 0xffffff45
012f1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
012f9 448b442408                     mov        r8d, dword ptr [rsp + 8]
012fe 44890424                       mov        dword ptr [rsp], r8d
01302 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01307 4489442404                     mov        dword ptr [rsp + 4], r8d
0130c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01311 4489542408                     mov        dword ptr [rsp + 8], r10d
01316 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0131b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01320 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01325 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0132a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0132f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01334 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01339 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0133e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01343 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01348 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0134d 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01352 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01357 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0135c 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01361 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01366 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0136b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01370 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01375 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0137a 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0137f 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01384 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01389 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0138e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01393 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01398 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
013a0 4c89542460                     mov        qword ptr [rsp + 0x60], r10
013a5 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
013aa 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
013b1 6690                           nop        
013b3 e82846b5ff                     call       0x7fefc79c3f60
013b8 0f1f8400b014000f               nop        dword ptr [rax + rax + 0xf0014b0]
013c0 be3dffffff                     mov        esi, 0xffffff3d
013c5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013cd 8b5c2408                       mov        ebx, dword ptr [rsp + 8]
013d1 891c24                         mov        dword ptr [rsp], ebx
013d4 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
013d9 4489442404                     mov        dword ptr [rsp + 4], r8d
013de 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
013e2 895c2408                       mov        dword ptr [rsp + 8], ebx
013e6 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
013eb 4c89442418                     mov        qword ptr [rsp + 0x18], r8
013f0 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
013f5 448944240c                     mov        dword ptr [rsp + 0xc], r8d
013fa 8b5c2428                       mov        ebx, dword ptr [rsp + 0x28]
013fe 895c2420                       mov        dword ptr [rsp + 0x20], ebx
01402 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01407 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0140c 8b5c2434                       mov        ebx, dword ptr [rsp + 0x34]
01410 895c2428                       mov        dword ptr [rsp + 0x28], ebx
01414 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01419 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0141e 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
01422 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01426 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
0142b 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01430 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
01434 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01438 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
01440 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01445 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
01449 895c2448                       mov        dword ptr [rsp + 0x48], ebx
0144d 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01452 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01457 8b5c2474                       mov        ebx, dword ptr [rsp + 0x74]
0145b 895c2450                       mov        dword ptr [rsp + 0x50], ebx
0145f 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
01464 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01469 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
01471 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01476 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
0147e 4c89442468                     mov        qword ptr [rsp + 0x68], r8
01483 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01488 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01490 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
01497 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
0149f e83c45b5ff                     call       0x7fefc79c3f60
014a4 0f1f84009c150010               nop        dword ptr [rax + rax + 0x1000159c]
014ac be45ffffff                     mov        esi, 0xffffff45
014b1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014b9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
014be 44891c24                       mov        dword ptr [rsp], r11d
014c2 4489442408                     mov        dword ptr [rsp + 8], r8d
014c7 e81445b5ff                     call       0x7fefc79c3f60
014cc 0f1f8400c4150011               nop        dword ptr [rax + rax + 0x110015c4]
014d4 be45ffffff                     mov        esi, 0xffffff45
014d9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014e1 448b542408                     mov        r10d, dword ptr [rsp + 8]
014e6 44891424                       mov        dword ptr [rsp], r10d
014ea 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
014ef 4489542404                     mov        dword ptr [rsp + 4], r10d
014f4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
014f9 4489542408                     mov        dword ptr [rsp + 8], r10d
014fe 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01503 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01508 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0150d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01512 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01517 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0151c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01521 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01526 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0152b 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01530 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01535 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0153a 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0153e 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01543 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01548 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0154d 894c2460                       mov        dword ptr [rsp + 0x60], ecx
01551 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01556 90                             nop        
01557 e88444b5ff                     call       0x7fefc79c3f60
0155c 0f1f840054160012               nop        dword ptr [rax + rax + 0x12001654]
01564 be45ffffff                     mov        esi, 0xffffff45
01569 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01571 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01576 44890c24                       mov        dword ptr [rsp], r9d
0157a 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0157f 44894c2404                     mov        dword ptr [rsp + 4], r9d
01584 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01589 44894c2408                     mov        dword ptr [rsp + 8], r9d
0158e 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01593 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01598 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0159d 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
015a2 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
015a7 4489442420                     mov        dword ptr [rsp + 0x20], r8d
015ac 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
015b1 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
015b6 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
015bb 4489442428                     mov        dword ptr [rsp + 0x28], r8d
015c0 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
015c5 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
015ca 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
015cf 4489442430                     mov        dword ptr [rsp + 0x30], r8d
015d4 4489542454                     mov        dword ptr [rsp + 0x54], r10d
015d9 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
015de 90                             nop        
015df e8fc43b5ff                     call       0x7fefc79c3f60
015e4 0f1f8400dc160013               nop        dword ptr [rax + rax + 0x130016dc]
015ec be45ffffff                     mov        esi, 0xffffff45
015f1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015f9 448b542408                     mov        r10d, dword ptr [rsp + 8]
015fe 44891424                       mov        dword ptr [rsp], r10d
01602 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01607 4489542404                     mov        dword ptr [rsp + 4], r10d
0160c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01611 44895c2408                     mov        dword ptr [rsp + 8], r11d
01616 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0161b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01620 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01625 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0162a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0162f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01634 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01639 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0163e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01643 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01648 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0164d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01652 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01657 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0165c 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01661 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01666 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0166b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01670 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01675 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0167a 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0167f 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01684 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01689 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0168e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01693 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01698 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
016a0 4c89542460                     mov        qword ptr [rsp + 0x60], r10
016a5 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
016ad 4c89542468                     mov        qword ptr [rsp + 0x68], r10
016b2 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
016ba 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
016c1 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
016c9 6690                           nop        
016cb e81043b5ff                     call       0x7fefc79c3f60
016d0 0f1f8400c8170014               nop        dword ptr [rax + rax + 0x140017c8]
016d8 4585c0                         test       r8d, r8d
016db 7f07                           jg         0x7fefc7e6fc64
016dd 33c0                           xor        eax, eax
016df e9e3e9ffff                     jmp        0x7fefc7e6e647
016e4 8954242c                       mov        dword ptr [rsp + 0x2c], edx
016e8 89742428                       mov        dword ptr [rsp + 0x28], esi
016ec 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
016f0 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
016f5 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
016fa 897c2410                       mov        dword ptr [rsp + 0x10], edi
016fe 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01703 48894424f8                     mov        qword ptr [rsp - 8], rax
01708 8b0424                         mov        eax, dword ptr [rsp]
0170b 89442404                       mov        dword ptr [rsp + 4], eax
0170f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01714 48894424f8                     mov        qword ptr [rsp - 8], rax
01719 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01720 890424                         mov        dword ptr [rsp], eax
01723 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01728 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01730 488bf5                         mov        rsi, rbp
01733 8b542408                       mov        edx, dword ptr [rsp + 8]
01737 418bc8                         mov        ecx, r8d
0173a 90                             nop        
0173b e8a0bba8ff                     call       0x7fefc78fb860
01740 0f1f840038180015               nop        dword ptr [rax + rax + 0x15001838]
01748 41ba40000000                   mov        r10d, 0x40
0174e 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
01753 c4e2a9f7c0                     shlx       rax, rax, r10
01758 48894424f8                     mov        qword ptr [rsp - 8], rax
0175d 8b442404                       mov        eax, dword ptr [rsp + 4]
01761 890424                         mov        dword ptr [rsp], eax
01764 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01769 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
0176e 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
01772 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
01777 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0177c 8b5c241c                       mov        ebx, dword ptr [rsp + 0x1c]
01780 8b742428                       mov        esi, dword ptr [rsp + 0x28]
01784 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01788 e93ae9ffff                     jmp        0x7fefc7e6e647
0178d 4585c0                         test       r8d, r8d
01790 7f08                           jg         0x7fefc7e6fd1a
01792 4533f6                         xor        r14d, r14d
01795 e96ee9ffff                     jmp        0x7fefc7e6e688
0179a 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0179f 4889442430                     mov        qword ptr [rsp + 0x30], rax
017a4 8954242c                       mov        dword ptr [rsp + 0x2c], edx
017a8 89742428                       mov        dword ptr [rsp + 0x28], esi
017ac 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
017b0 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
017b5 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
017ba 897c2410                       mov        dword ptr [rsp + 0x10], edi
017be 448944240c                     mov        dword ptr [rsp + 0xc], r8d
017c3 48894424f8                     mov        qword ptr [rsp - 8], rax
017c8 8b0424                         mov        eax, dword ptr [rsp]
017cb 89442404                       mov        dword ptr [rsp + 4], eax
017cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d4 48894424f8                     mov        qword ptr [rsp - 8], rax
017d9 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
017e0 890424                         mov        dword ptr [rsp], eax
017e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017e8 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
017f0 488bf5                         mov        rsi, rbp
017f3 8b542408                       mov        edx, dword ptr [rsp + 8]
017f7 418bc8                         mov        ecx, r8d
017fa 90                             nop        
017fb e8e0baa8ff                     call       0x7fefc78fb860
01800 0f1f8400f8180016               nop        dword ptr [rax + rax + 0x160018f8]
01808 41ba80000000                   mov        r10d, 0x80
0180e 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
01813 c462a9f7f0                     shlx       r14, rax, r10
01818 48894424f8                     mov        qword ptr [rsp - 8], rax
0181d 8b442404                       mov        eax, dword ptr [rsp + 4]
01821 890424                         mov        dword ptr [rsp], eax
01824 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01829 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
0182d 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
01832 8b5c241c                       mov        ebx, dword ptr [rsp + 0x1c]
01836 8b742428                       mov        esi, dword ptr [rsp + 0x28]
0183a 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
0183e 488b442430                     mov        rax, qword ptr [rsp + 0x30]
01843 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01848 e9bbe8ffff                     jmp        0x7fefc7e6e688
0184d 4533c0                         xor        r8d, r8d
01850 e975f1ffff                     jmp        0x7fefc7e6ef4a
01855 bee4ffffff                     mov        esi, 0xffffffe4
0185a 48ffb42490000000               push       qword ptr [rsp + 0x90]
01862 488f0424                       pop        qword ptr [rsp]
01866 90                             nop        
01867 e87441b5ff                     call       0x7fefc79c3f60
0186c 0f1f840064190017               nop        dword ptr [rax + rax + 0x17001964]
01874 be5d000000                     mov        esi, 0x5d
01879 6690                           nop        
0187b e86041b5ff                     call       0x7fefc79c3f60
01880 0f1f840078190018               nop        dword ptr [rax + rax + 0x18001978]
01888 bef6ffffff                     mov        esi, 0xfffffff6
0188d 6690                           nop        
0188f e84c41b5ff                     call       0x7fefc79c3f60
01894 0f1f84008c190019               nop        dword ptr [rax + rax + 0x1900198c]
0189c bef6ffffff                     mov        esi, 0xfffffff6
018a1 6690                           nop        
018a3 e83841b5ff                     call       0x7fefc79c3f60
018a8 0f1f8400a019001a               nop        dword ptr [rax + rax + 0x1a0019a0]
018b0 be6effffff                     mov        esi, 0xffffff6e
018b5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
018bd 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
018c2 44891c24                       mov        dword ptr [rsp], r11d
018c6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
018cb 44895c2408                     mov        dword ptr [rsp + 8], r11d
018d0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018d5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018da 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
018df 448954240c                     mov        dword ptr [rsp + 0xc], r10d
018e4 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
018e9 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
018ee 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
018f3 4489542424                     mov        dword ptr [rsp + 0x24], r10d
018f8 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
018fd 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01902 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01907 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0190c 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01911 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01916 90                             nop        
01917 e8c440b5ff                     call       0x7fefc79c3f60
0191c 0f1f8400141a001b               nop        dword ptr [rax + rax + 0x1b001a14]
01924 bee4ffffff                     mov        esi, 0xffffffe4
01929 48ffb42490000000               push       qword ptr [rsp + 0x90]
01931 488f0424                       pop        qword ptr [rsp]
01935 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
0193a 48894424f8                     mov        qword ptr [rsp - 8], rax
0193f 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01946 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0194a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0194f 895c2428                       mov        dword ptr [rsp + 0x28], ebx
01953 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01957 e88440b5ff                     call       0x7fefc79c3f60
0195c 0f1f8400541a001c               nop        dword ptr [rax + rax + 0x1c001a54]
01964 bee4ffffff                     mov        esi, 0xffffffe4
01969 48ffb42490000000               push       qword ptr [rsp + 0x90]
01971 488f0424                       pop        qword ptr [rsp]
01975 48894424f8                     mov        qword ptr [rsp - 8], rax
0197a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01981 89442418                       mov        dword ptr [rsp + 0x18], eax
01985 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0198a 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
0198e 89542428                       mov        dword ptr [rsp + 0x28], edx
01992 4889442430                     mov        qword ptr [rsp + 0x30], rax
01997 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0199c 666690                         nop        
0199f e83c40b5ff                     call       0x7fefc79c3f60
019a4 0f1f84009c1a001d               nop        dword ptr [rax + rax + 0x1d001a9c]
019ac bebeffffff                     mov        esi, 0xffffffbe
019b1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
019b9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
019be 44891c24                       mov        dword ptr [rsp], r11d
019c2 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
019c7 44895c2408                     mov        dword ptr [rsp + 8], r11d
019cc 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019d1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
019d6 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
019db 448954240c                     mov        dword ptr [rsp + 0xc], r10d
019e0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
019e5 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
019ea 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
019ef 4489542424                     mov        dword ptr [rsp + 0x24], r10d
019f4 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
019f9 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
019fe 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01a03 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01a08 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01a0d 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01a12 90                             nop        
01a13 e8c83fb5ff                     call       0x7fefc79c3f60
01a18 0f1f8400101b001e               nop        dword ptr [rax + rax + 0x1e001b10]
01a20 beccffffff                     mov        esi, 0xffffffcc
01a25 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a2d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01a32 44891c24                       mov        dword ptr [rsp], r11d
01a36 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01a3b 48894424f8                     mov        qword ptr [rsp - 8], rax
01a40 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a47 89442414                       mov        dword ptr [rsp + 0x14], eax
01a4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a50 895c2418                       mov        dword ptr [rsp + 0x18], ebx
01a54 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01a58 897c242c                       mov        dword ptr [rsp + 0x2c], edi
01a5c 666690                         nop        
01a5f e87c3fb5ff                     call       0x7fefc79c3f60
01a64 0f1f84005c1b001f               nop        dword ptr [rax + rax + 0x1f001b5c]
01a6c beccffffff                     mov        esi, 0xffffffcc
01a71 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a79 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01a7e 44891c24                       mov        dword ptr [rsp], r11d
01a82 48894424f8                     mov        qword ptr [rsp - 8], rax
01a87 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a8e 89442410                       mov        dword ptr [rsp + 0x10], eax
01a92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a97 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01a9b 89542418                       mov        dword ptr [rsp + 0x18], edx
01a9f 4889442428                     mov        qword ptr [rsp + 0x28], rax
01aa4 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01aa9 897c2434                       mov        dword ptr [rsp + 0x34], edi
01aad 6690                           nop        
01aaf e82c3fb5ff                     call       0x7fefc79c3f60
01ab4 0f1f8400ac1b0020               nop        dword ptr [rax + rax + 0x20001bac]
01abc be45ffffff                     mov        esi, 0xffffff45
01ac1 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01ac6 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01acb 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01ad0 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01ad5 6690                           nop        
01ad7 e8043fb5ff                     call       0x7fefc79c3f60
01adc 0f1f8400d41b0021               nop        dword ptr [rax + rax + 0x21001bd4]
01ae4 be45ffffff                     mov        esi, 0xffffff45
01ae9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01af1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01af6 44891c24                       mov        dword ptr [rsp], r11d
01afa 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01aff 44895c2408                     mov        dword ptr [rsp + 8], r11d
01b04 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b09 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b0e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b13 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01b18 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01b1d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01b22 90                             nop        
01b23 e8b83eb5ff                     call       0x7fefc79c3f60
01b28 0f1f8400201c0022               nop        dword ptr [rax + rax + 0x22001c20]
01b30 bef6ffffff                     mov        esi, 0xfffffff6
01b35 6690                           nop        
01b37 e8a43eb5ff                     call       0x7fefc79c3f60
01b3c 0f1f8400341c0023               nop        dword ptr [rax + rax + 0x23001c34]
01b44 be5d000000                     mov        esi, 0x5d
01b49 6690                           nop        
01b4b e8903eb5ff                     call       0x7fefc79c3f60
01b50 0f1f8400481c0024               nop        dword ptr [rax + rax + 0x24001c48]
01b58 be45ffffff                     mov        esi, 0xffffff45
01b5d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b65 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01b6a 44891c24                       mov        dword ptr [rsp], r11d
01b6e 90                             nop        
01b6f e86c3eb5ff                     call       0x7fefc79c3f60
01b74 0f1f84006c1c0025               nop        dword ptr [rax + rax + 0x25001c6c]
01b7c bef6ffffff                     mov        esi, 0xfffffff6
01b81 418bea                         mov        ebp, r10d
01b84 666690                         nop        
01b87 e8543eb5ff                     call       0x7fefc79c3f60
01b8c 0f1f8400841c0026               nop        dword ptr [rax + rax + 0x26001c84]
01b94 bef6ffffff                     mov        esi, 0xfffffff6
01b99 8be9                           mov        ebp, ecx
01b9b e8403eb5ff                     call       0x7fefc79c3f60
01ba0 0f1f8400981c0027               nop        dword ptr [rax + rax + 0x27001c98]
01ba8 bef6ffffff                     mov        esi, 0xfffffff6
01bad 418beb                         mov        ebp, r11d
01bb0 666690                         nop        
01bb3 e8283eb5ff                     call       0x7fefc79c3f60
01bb8 0f1f8400b01c0028               nop        dword ptr [rax + rax + 0x28001cb0]
01bc0 bef6ffffff                     mov        esi, 0xfffffff6
01bc5 6690                           nop        
01bc7 e8143eb5ff                     call       0x7fefc79c3f60
01bcc 0f1f8400c41c0029               nop        dword ptr [rax + rax + 0x29001cc4]
01bd4 bef6ffffff                     mov        esi, 0xfffffff6
01bd9 6690                           nop        
01bdb e8003eb5ff                     call       0x7fefc79c3f60
01be0 0f1f8400d81c002a               nop        dword ptr [rax + rax + 0x2a001cd8]
01be8 bef6ffffff                     mov        esi, 0xfffffff6
01bed 6690                           nop        
01bef e8ec3db5ff                     call       0x7fefc79c3f60
01bf4 0f1f8400ec1c002b               nop        dword ptr [rax + rax + 0x2b001cec]
01bfc bef6ffffff                     mov        esi, 0xfffffff6
01c01 6690                           nop        
01c03 e8d83db5ff                     call       0x7fefc79c3f60
01c08 0f1f8400001d002c               nop        dword ptr [rax + rax + 0x2c001d00]
01c10 bef6ffffff                     mov        esi, 0xfffffff6
01c15 6690                           nop        
01c17 e8c43db5ff                     call       0x7fefc79c3f60
01c1c 0f1f8400141d002d               nop        dword ptr [rax + rax + 0x2d001d14]
01c24 bef6ffffff                     mov        esi, 0xfffffff6
01c29 6690                           nop        
01c2b e8b03db5ff                     call       0x7fefc79c3f60
01c30 0f1f8400281d002e               nop        dword ptr [rax + rax + 0x2e001d28]
01c38 bef6ffffff                     mov        esi, 0xfffffff6
01c3d 6690                           nop        
01c3f e89c3db5ff                     call       0x7fefc79c3f60
01c44 0f1f84003c1d002f               nop        dword ptr [rax + rax + 0x2f001d3c]
01c4c eb08                           jmp        0x7fefc7e701d6
01c4e eb06                           jmp        0x7fefc7e701d6
01c50 eb04                           jmp        0x7fefc7e701d6
01c52 eb02                           jmp        0x7fefc7e701d6
01c54 eb00                           jmp        0x7fefc7e701d6
01c56 488bf0                         mov        rsi, rax
01c59 e9aaedffff                     jmp        0x7fefc7e6ef88
01c5e 49bab3efe6c7ef7f0000           movabs     r10, 0x7fefc7e6efb3
01c68 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01c6f e9ecdca8ff                     jmp        0x7fefc78fdee0
01c74 e8a7a8a7ff                     call       0x7fefc78eaaa0
01c79 e9a0e3ffff                     jmp        0x7fefc7e6e59e
01c7e f4                             hlt        
01c7f f4                             hlt        
