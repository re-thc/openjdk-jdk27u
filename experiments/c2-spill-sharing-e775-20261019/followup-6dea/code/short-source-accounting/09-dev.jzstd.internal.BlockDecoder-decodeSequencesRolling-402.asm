00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f850e1d0000                   jne        0x7fefc7e6852c
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
00050 0f83b7180000                   jae        0x7fefc7e6810d
00056 0fb64c1607                     movzx      ecx, byte ptr [rsi + rdx + 7]
0005b 85c9                           test       ecx, ecx
0005d 0f84c9180000                   je         0x7fefc7e6812c
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
0009a 0f8cf0160000                   jl         0x7fefc7e67f90
000a0 85ff                           test       edi, edi
000a2 0f8c301a0000                   jl         0x7fefc7e682d8
000a8 8b2c24                         mov        ebp, dword ptr [rsp]
000ab 83c5f9                         add        ebp, -7
000ae 443bed                         cmp        r13d, ebp
000b1 0f8325190000                   jae        0x7fefc7e681dc
000b7 458bd5                         mov        r10d, r13d
000ba 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
000c2 4b8b441108                     mov        rax, qword ptr [r9 + r10 + 8]
000c7 4183c0f8                       add        r8d, -8
000cb 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000d3 4183c2f0                       add        r10d, -0x10
000d7 4183f808                       cmp        r8d, 8
000db 0f8c64170000                   jl         0x7fefc7e68045
000e1 85ff                           test       edi, edi
000e3 0f8c3b1a0000                   jl         0x7fefc7e68324
000e9 8b2c24                         mov        ebp, dword ptr [rsp]
000ec 83c5f9                         add        ebp, -7
000ef 443bd5                         cmp        r10d, ebp
000f2 0f8324190000                   jae        0x7fefc7e6821c
000f8 458bc2                         mov        r8d, r10d
000fb 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00103 4f8b740308                     mov        r14, qword ptr [r11 + r8 + 8]
00108 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
0010d 448b4518                       mov        r8d, dword ptr [rbp + 0x18]
00111 4585c0                         test       r8d, r8d
00114 0f8426180000                   je         0x7fefc7e68140
0011a 448b5d1c                       mov        r11d, dword ptr [rbp + 0x1c]
0011e 418b4b04                       mov        ecx, dword ptr [r11 + 4]
00122 448b4d20                       mov        r9d, dword ptr [rbp + 0x20]
00126 4585c9                         test       r9d, r9d
00129 0f8425180000                   je         0x7fefc7e68154
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
0019b 0f84c1080000                   je         0x7fefc7e67262
001a1 be40000000                     mov        esi, 0x40
001a6 2bf3                           sub        esi, ebx
001a8 3bce                           cmp        ecx, esi
001aa 0f8f13020000                   jg         0x7fefc7e66bc3
001b0 2bf1                           sub        esi, ecx
001b2 c4e2cbf7e8                     shrx       rbp, rax, rsi
001b7 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001bc 83f940                         cmp        ecx, 0x40
001bf 0f8d4b1a0000                   jge        0x7fefc7e68410
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
001ee 7c33                           jl         0x7fefc7e66a23
001f0 4489542428                     mov        dword ptr [rsp + 0x28], r10d
001f5 4183c1c8                       add        r9d, -0x38
001f9 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001fe 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00206 8b542408                       mov        edx, dword ptr [rsp + 8]
0020a 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
0020e 90                             nop        
0020f e84c4ea9ff                     call       0x7fefc78fb860
00214 0f1f84000c030000               nop        dword ptr [rax + rax + 0x30c]
0021c 4889442420                     mov        qword ptr [rsp + 0x20], rax
00221 eb31                           jmp        0x7fefc7e66a54
00223 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00228 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00230 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
00235 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
0023a 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00242 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
0024a 4489442410                     mov        dword ptr [rsp + 0x10], r8d
0024f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00254 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00259 418b6a04                       mov        ebp, dword ptr [r10 + 4]
0025d 83fd20                         cmp        ebp, 0x20
00260 0f8d0e190000                   jge        0x7fefc7e68374
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
002a2 0f8df4180000                   jge        0x7fefc7e6839c
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
002eb 0f8e14160000                   jle        0x7fefc7e68105
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
00370 0f86f2150000                   jbe        0x7fefc7e68168
00376 4d63d3                         movsxd     r10, r11d
00379 4c635c244c                     movsxd     r11, dword ptr [rsp + 0x4c]
0037e 49ffcb                         dec        r11
00381 4d3bda                         cmp        r11, r10
00384 0f83de150000                   jae        0x7fefc7e68168
0038a 448b542404                     mov        r10d, dword ptr [rsp + 4]
0038f 4585d2                         test       r10d, r10d
00392 0f8ccc160000                   jl         0x7fefc7e68264
00398 448b1c24                       mov        r11d, dword ptr [rsp]
0039c 4183c3f9                       add        r11d, -7
003a0 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
003a8 4533db                         xor        r11d, r11d
003ab 4533d2                         xor        r10d, r10d
003ae 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
003b6 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
003be e98e020000                     jmp        0x7fefc7e66e51
003c3 8be9                           mov        ebp, ecx
003c5 2bee                           sub        ebp, esi
003c7 e8944ca9ff                     call       0x7fefc78fb860
003cc 0f1f8400c4040001               nop        dword ptr [rax + rax + 0x10004c4]
003d4 4823442428                     and        rax, qword ptr [rsp + 0x28]
003d9 41ba40000000                   mov        r10d, 0x40
003df 442bd5                         sub        r10d, ebp
003e2 c462d1f7d8                     shlx       r11, rax, rbp
003e7 c462abf7942498000000           shrx       r10, qword ptr [rsp + 0x98], r10
003f1 4d0bda                         or         r11, r10
003f4 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
003f9 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
003fe e9dbfdffff                     jmp        0x7fefc7e669de
00403 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
0040b 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
00410 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00415 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
0041d 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00422 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
00426 896c2410                       mov        dword ptr [rsp + 0x10], ebp
0042a 660f1f440000                   nop        word ptr [rax + rax]
00430 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00437 83fd40                         cmp        ebp, 0x40
0043a 0f8dec090000                   jge        0x7fefc7e6762c
00440 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0044a 41ba01000000                   mov        r10d, 1
00450 c442d1f7d2                     shlx       r10, r10, rbp
00455 49ffca                         dec        r10
00458 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00460 458bda                         mov        r11d, r10d
00463 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0046a 83fd40                         cmp        ebp, 0x40
0046d 0f8d990a0000                   jge        0x7fefc7e6770c
00473 c4c2d3f7f9                     shrx       rdi, r9, rbp
00478 41ba01000000                   mov        r10d, 1
0047e c442d1f7d2                     shlx       r10, r10, rbp
00483 49ffca                         dec        r10
00486 4d23d1                         and        r10, r9
00489 418bca                         mov        ecx, r10d
0048c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00493 83fd40                         cmp        ebp, 0x40
00496 0f8d700b0000                   jge        0x7fefc7e6780c
0049c c4e2d3f7df                     shrx       rbx, rdi, rbp
004a1 41ba01000000                   mov        r10d, 1
004a7 c442d1f7d2                     shlx       r10, r10, rbp
004ac 49ffca                         dec        r10
004af 4c23d7                         and        r10, rdi
004b2 458bd2                         mov        r10d, r10d
004b5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004bc 83fd40                         cmp        ebp, 0x40
004bf 0f8d4b0c0000                   jge        0x7fefc7e67910
004c5 41b801000000                   mov        r8d, 1
004cb c442d1f7c0                     shlx       r8, r8, rbp
004d0 49ffc8                         dec        r8
004d3 4c23c3                         and        r8, rbx
004d6 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
004de 418bf9                         mov        edi, r9d
004e1 4103fa                         add        edi, r10d
004e4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
004e9 458bd2                         mov        r10d, r10d
004ec 4403d1                         add        r10d, ecx
004ef 4863cf                         movsxd     rcx, edi
004f2 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
004fa 458bc9                         mov        r9d, r9d
004fd 4d03c1                         add        r8, r9
00500 4c8b8c24e8000000               mov        r9, qword ptr [rsp + 0xe8]
00508 4c03c9                         add        r9, rcx
0050b 4c898c24e8000000               mov        qword ptr [rsp + 0xe8], r9
00513 4d85c0                         test       r8, r8
00516 0f8e24070000                   jle        0x7fefc7e67440
0051c 4981f8ffffff7f                 cmp        r8, 0x7fffffff
00523 0f8fd70c0000                   jg         0x7fefc7e67a00
00529 4181faffff0100                 cmp        r10d, 0x1ffff
00530 0f8fc20d0000                   jg         0x7fefc7e67af8
00536 81ffffff0300                   cmp        edi, 0x3ffff
0053c 0f8f8a0e0000                   jg         0x7fefc7e67bcc
00542 458bc8                         mov        r9d, r8d
00545 4181f900000010                 cmp        r9d, 0x10000000
0054c 0f834e0f0000                   jae        0x7fefc7e67ca0
00552 4d63d2                         movsxd     r10, r10d
00555 4d63c1                         movsxd     r8, r9d
00558 48c1e112                       shl        rcx, 0x12
0055c 49c1e024                       shl        r8, 0x24
00560 4c0bc1                         or         r8, rcx
00563 4d0bc2                         or         r8, r10
00566 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
0056e 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
00576 4f8944ca08                     mov        qword ptr [r10 + r9*8 + 8], r8
0057b 8b2c24                         mov        ebp, dword ptr [rsp]
0057e 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00582 0f8db8000000                   jge        0x7fefc7e66e40
00588 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00590 49c1ea30                       shr        r10, 0x30
00594 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
00599 49c1e830                       shr        r8, 0x30
0059d 458bca                         mov        r9d, r10d
005a0 418bc8                         mov        ecx, r8d
005a3 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
005ab c4c23bf7db                     shrx       ebx, r11d, r8d
005b0 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
005b8 44039424c8000000               add        r10d, dword ptr [rsp + 0xc8]
005c0 c4422bf7c3                     shrx       r8d, r11d, r10d
005c5 4103c8                         add        ecx, r8d
005c8 894c2460                       mov        dword ptr [rsp + 0x60], ecx
005cc 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
005d4 4183fa20                       cmp        r10d, 0x20
005d8 0f8dae0f0000                   jge        0x7fefc7e67d8c
005de 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005e6 49c1ea30                       shr        r10, 0x30
005ea 458bd2                         mov        r10d, r10d
005ed b901000000                     mov        ecx, 1
005f2 448b8424c8000000               mov        r8d, dword ptr [rsp + 0xc8]
005fa c46239f7c1                     shlx       r8d, ecx, r8d
005ff 41ffc8                         dec        r8d
00602 4423c3                         and        r8d, ebx
00605 4503c1                         add        r8d, r9d
00608 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0060d 448b8c24cc000000               mov        r9d, dword ptr [rsp + 0xcc]
00615 4183f920                       cmp        r9d, 0x20
00619 0f8dfd0f0000                   jge        0x7fefc7e67e1c
0061f 41b901000000                   mov        r9d, 1
00625 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
0062d c44239f7c1                     shlx       r8d, r9d, r8d
00632 41ffc8                         dec        r8d
00635 4523c3                         and        r8d, r11d
00638 4503c2                         add        r8d, r10d
0063b 4489442468                     mov        dword ptr [rsp + 0x68], r8d
00640 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00644 0f8d9f030000                   jge        0x7fefc7e671e9
0064a 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00651 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00656 4423542460                     and        r10d, dword ptr [rsp + 0x60]
0065b 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00660 458b5814                       mov        r11d, dword ptr [r8 + 0x14]
00664 458b4304                       mov        r8d, dword ptr [r11 + 4]
00668 453bd0                         cmp        r10d, r8d
0066b 0f8301040000                   jae        0x7fefc7e67272
00671 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
00675 234c2468                       and        ecx, dword ptr [rsp + 0x68]
00679 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0067e 458b4014                       mov        r8d, dword ptr [r8 + 0x14]
00682 418b5804                       mov        ebx, dword ptr [r8 + 4]
00686 4f8b54d308                     mov        r10, qword ptr [r11 + r10*8 + 8]
0068b 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00690 3bcb                           cmp        ecx, ebx
00692 0f8364040000                   jae        0x7fefc7e672fc
00698 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0069d 44235c2448                     and        r11d, dword ptr [rsp + 0x48]
006a2 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
006a7 458b5114                       mov        r10d, dword ptr [r9 + 0x14]
006ab 458b4a04                       mov        r9d, dword ptr [r10 + 4]
006af 4d8b44c808                     mov        r8, qword ptr [r8 + rcx*8 + 8]
006b4 4c89842480000000               mov        qword ptr [rsp + 0x80], r8
006bc 453bd9                         cmp        r11d, r9d
006bf 0f83d3040000                   jae        0x7fefc7e67398
006c5 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
006ca 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006d2 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006d9 ffc5                           inc        ebp
006db 892c24                         mov        dword ptr [rsp], ebp
006de 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006e2 0f8dd2020000                   jge        0x7fefc7e671ba
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
0076d 4d8bd0                         mov        r10, r8
00770 49c1ea20                       shr        r10, 0x20
00774 458bda                         mov        r11d, r10d
00777 410fb6eb                       movzx      ebp, r11b
0077b 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
00782 448bcd                         mov        r9d, ebp
00785 44038c24d4000000               add        r9d, dword ptr [rsp + 0xd4]
0078d 44038c24d8000000               add        r9d, dword ptr [rsp + 0xd8]
00795 44038c24d0000000               add        r9d, dword ptr [rsp + 0xd0]
0079d 4585c9                         test       r9d, r9d
007a0 0f848a050000                   je         0x7fefc7e67530
007a6 4183f93f                       cmp        r9d, 0x3f
007aa 0f8f54060000                   jg         0x7fefc7e67604
007b0 41b840000000                   mov        r8d, 0x40
007b6 442b44243c                     sub        r8d, dword ptr [rsp + 0x3c]
007bb 453bc8                         cmp        r9d, r8d
007be 7e48                           jle        0x7fefc7e67008
007c0 418bc9                         mov        ecx, r9d
007c3 412bc8                         sub        ecx, r8d
007c6 4183f840                       cmp        r8d, 0x40
007ca 0f8dd40e0000                   jge        0x7fefc7e67ea4
007d0 41ba01000000                   mov        r10d, 1
007d6 c442b9f7d2                     shlx       r10, r10, r8
007db 49ffca                         dec        r10
007de 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007e6 c4c2f1f7ea                     shlx       rbp, r10, rcx
007eb 41ba40000000                   mov        r10d, 0x40
007f1 442bd1                         sub        r10d, ecx
007f4 c462abf7542420                 shrx       r10, qword ptr [rsp + 0x20], r10
007fb 490bea                         or         rbp, r10
007fe 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
00806 eb26                           jmp        0x7fefc7e6702e
00808 41ba01000000                   mov        r10d, 1
0080e c442b1f7d2                     shlx       r10, r10, r9
00813 452bc1                         sub        r8d, r9d
00816 c4e2bbf7ac2498000000           shrx       rbp, qword ptr [rsp + 0x98], r8
00820 49ffca                         dec        r10
00823 4923ea                         and        rbp, r10
00826 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
0082e 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00833 4503d1                         add        r10d, r9d
00836 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0083b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00840 4503d9                         add        r11d, r9d
00843 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00848 4183fa40                       cmp        r10d, 0x40
0084c 0f8cdefbffff                   jl         0x7fefc7e66c30
00852 458d5ac0                       lea        r11d, [r10 - 0x40]
00856 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0085b 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
0085f 83c5f8                         add        ebp, -8
00862 896c240c                       mov        dword ptr [rsp + 0xc], ebp
00866 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0086a 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
0086e 83c1f0                         add        ecx, -0x10
00871 83f908                         cmp        ecx, 8
00874 0f8cf2000000                   jl         0x7fefc7e6716c
0087a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0087f 4183c2e8                       add        r10d, -0x18
00883 443b9424c4000000               cmp        r10d, dword ptr [rsp + 0xc4]
0088b 0f8272fbffff                   jb         0x7fefc7e66c03
00891 bee4ffffff                     mov        esi, 0xffffffe4
00896 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0089e 448b442408                     mov        r8d, dword ptr [rsp + 8]
008a3 44890424                       mov        dword ptr [rsp], r8d
008a7 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
008ac 4489442404                     mov        dword ptr [rsp + 4], r8d
008b1 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
008b6 4489442408                     mov        dword ptr [rsp + 8], r8d
008bb 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
008c0 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
008c5 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
008ca 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
008cf 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
008d4 4489442418                     mov        dword ptr [rsp + 0x18], r8d
008d9 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
008de 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
008e3 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
008e8 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
008ed 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
008f2 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
008f7 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
008fc 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00901 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00906 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0090b 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00910 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00915 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0091a 4489442440                     mov        dword ptr [rsp + 0x40], r8d
0091f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00924 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00929 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
0092e 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00933 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00938 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
0093d 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00945 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
0094a 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00952 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00957 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
0095f e8fccdb5ff                     call       0x7fefc79c3f60
00964 0f1f84005c0a0002               nop        dword ptr [rax + rax + 0x2000a5c]
0096c 85c9                           test       ecx, ecx
0096e 7f08                           jg         0x7fefc7e67178
00970 4533d2                         xor        r10d, r10d
00973 e998faffff                     jmp        0x7fefc7e66c10
00978 8be9                           mov        ebp, ecx
0097a 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00982 8b542408                       mov        edx, dword ptr [rsp + 8]
00986 90                             nop        
00987 e8d446a9ff                     call       0x7fefc78fb860
0098c 0f1f8400840a0003               nop        dword ptr [rax + rax + 0x3000a84]
00994 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00999 41c1e303                       shl        r11d, 3
0099d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
009a2 41c1e203                       shl        r10d, 3
009a6 452bda                         sub        r11d, r10d
009a9 4181c3c0000000                 add        r11d, 0xc0
009b0 c462a1f7d0                     shlx       r10, rax, r11
009b5 e956faffff                     jmp        0x7fefc7e66c10
009ba 4533db                         xor        r11d, r11d
009bd 33ed                           xor        ebp, ebp
009bf 4533d2                         xor        r10d, r10d
009c2 4533c9                         xor        r9d, r9d
009c5 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
009cd 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
009d4 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
009dc 44898c24f4000000               mov        dword ptr [rsp + 0xf4], r9d
009e4 e953fdffff                     jmp        0x7fefc7e66f3c
009e9 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009f1 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009f9 4d03c2                         add        r8, r10
009fc 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
00a04 4d3bc2                         cmp        r8, r10
00a07 7e30                           jle        0x7fefc7e67239
00a09 48be085529e300000000           movabs     rsi, 0xe3295508
00a13 e84846a9ff                     call       0x7fefc78fb860
00a18 0f1f8400100b0004               nop        dword ptr [rax + rax + 0x4000b10]
00a20 4885c0                         test       rax, rax
00a23 0f84bf110000                   je         0x7fefc7e683e8
00a29 488bf0                         mov        rsi, rax
00a2c 4881c410010000                 add        rsp, 0x110
00a33 5d                             pop        rbp
00a34 e9a73eb6ff                     jmp        0x7fefc79cb0e0
00a39 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a3e 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a46 0f85b0110000                   jne        0x7fefc7e683fc
00a4c 418bc0                         mov        eax, r8d
00a4f 4881c410010000                 add        rsp, 0x110
00a56 5d                             pop        rbp
00a57 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a5b 0f87b5120000                   ja         0x7fefc7e68516
00a61 c3                             ret        
00a62 4533d2                         xor        r10d, r10d
00a65 4533db                         xor        r11d, r11d
00a68 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00a6d e96cf7ffff                     jmp        0x7fefc7e669de
00a72 bee4ffffff                     mov        esi, 0xffffffe4
00a77 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a7f 448b442408                     mov        r8d, dword ptr [rsp + 8]
00a84 44890424                       mov        dword ptr [rsp], r8d
00a88 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00a8d 44894c2404                     mov        dword ptr [rsp + 4], r9d
00a92 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00a97 4489442408                     mov        dword ptr [rsp + 8], r8d
00a9c 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
00aa1 4c89442418                     mov        qword ptr [rsp + 0x18], r8
00aa6 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00aab 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00ab0 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00ab5 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00aba 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00abf 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00ac4 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00ac9 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00ace 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00ad3 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00ad8 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00add 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00ae2 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00ae7 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
00aec 666690                         nop        
00aef e86cccb5ff                     call       0x7fefc79c3f60
00af4 0f1f8400ec0b0005               nop        dword ptr [rax + rax + 0x5000bec]
00afc bee4ffffff                     mov        esi, 0xffffffe4
00b01 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b09 448b542408                     mov        r10d, dword ptr [rsp + 8]
00b0e 44891424                       mov        dword ptr [rsp], r10d
00b12 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00b17 44895c2404                     mov        dword ptr [rsp + 4], r11d
00b1c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00b21 4489542408                     mov        dword ptr [rsp + 8], r10d
00b26 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b2b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b30 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00b35 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00b3a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00b3f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00b44 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00b49 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00b4e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00b53 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00b58 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00b5d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00b62 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00b67 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00b6c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00b71 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00b76 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b7b 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00b80 4489442460                     mov        dword ptr [rsp + 0x60], r8d
00b85 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00b89 6690                           nop        
00b8b e8d0cbb5ff                     call       0x7fefc79c3f60
00b90 0f1f8400880c0006               nop        dword ptr [rax + rax + 0x6000c88]
00b98 bee4ffffff                     mov        esi, 0xffffffe4
00b9d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ba5 448b442408                     mov        r8d, dword ptr [rsp + 8]
00baa 44890424                       mov        dword ptr [rsp], r8d
00bae 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00bb3 44894c2404                     mov        dword ptr [rsp + 4], r9d
00bb8 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00bbd 4489442408                     mov        dword ptr [rsp + 8], r8d
00bc2 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
00bc7 4c89442418                     mov        qword ptr [rsp + 0x18], r8
00bcc 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00bd1 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00bd6 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00bdb 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00be0 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00be5 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00bea 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00bef 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00bf4 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00bf9 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00bfe 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00c03 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00c08 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00c0d 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00c12 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00c17 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
00c1c 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
00c21 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00c26 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00c2b 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00c30 666690                         nop        
00c33 e828cbb5ff                     call       0x7fefc79c3f60
00c38 0f1f8400300d0007               nop        dword ptr [rax + rax + 0x7000d30]
00c40 4533c9                         xor        r9d, r9d
00c43 4d3bc1                         cmp        r8, r9
00c46 bdffffffff                     mov        ebp, 0xffffffff
00c4b 7c08                           jl         0x7fefc7e67455
00c4d 400f95c5                       setne      bpl
00c51 400fb6ed                       movzx      ebp, bpl
00c55 be45ffffff                     mov        esi, 0xffffff45
00c5a 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
00c62 4c890c24                       mov        qword ptr [rsp], r9
00c66 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
00c6a 894c240c                       mov        dword ptr [rsp + 0xc], ecx
00c6e 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00c76 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00c7b 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
00c7f 894c2414                       mov        dword ptr [rsp + 0x14], ecx
00c83 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00c88 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00c8d 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
00c91 894c2430                       mov        dword ptr [rsp + 0x30], ecx
00c95 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00c9a 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00c9f 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00ca3 894c2438                       mov        dword ptr [rsp + 0x38], ecx
00ca7 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00cac 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
00cb1 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00cb5 894c2440                       mov        dword ptr [rsp + 0x40], ecx
00cb9 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00cc1 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
00cc6 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
00cca 894c2450                       mov        dword ptr [rsp + 0x50], ecx
00cce 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
00cd3 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
00cd8 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
00cdc 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00ce0 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
00ce5 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
00cea 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
00cf2 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
00cf7 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
00cff 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00d04 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00d0c 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
00d13 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d1b 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
00d23 e838cab5ff                     call       0x7fefc79c3f60
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
00d78 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00d7d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00d82 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00d87 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00d8c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00d91 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00d96 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00d9b 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00da0 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00da5 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00daa 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00daf 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00db4 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00db9 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00dbe 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00dc3 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00dc8 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00dcd 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00dd2 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00dd7 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00ddc 4c89442460                     mov        qword ptr [rsp + 0x60], r8
00de1 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00de9 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00dee 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
00df6 90                             nop        
00df7 e864c9b5ff                     call       0x7fefc79c3f60
00dfc 0f1f8400f40e0009               nop        dword ptr [rax + rax + 0x9000ef4]
00e04 be45ffffff                     mov        esi, 0xffffff45
00e09 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e11 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00e16 44891c24                       mov        dword ptr [rsp], r11d
00e1a 44894c2408                     mov        dword ptr [rsp + 8], r9d
00e1f e83cc9b5ff                     call       0x7fefc79c3f60
00e24 0f1f84001c0f000a               nop        dword ptr [rax + rax + 0xa000f1c]
00e2c be45ffffff                     mov        esi, 0xffffff45
00e31 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e39 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00e3e 44891c24                       mov        dword ptr [rsp], r11d
00e42 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00e47 4489542404                     mov        dword ptr [rsp + 4], r10d
00e4c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00e51 44895c2408                     mov        dword ptr [rsp + 8], r11d
00e56 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00e5e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00e63 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e68 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e6d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00e72 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00e77 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00e7c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00e81 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00e86 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00e8b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00e90 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00e95 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00e9a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00e9f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00ea4 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00ea9 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00eae 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00eb3 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00eb8 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00ebd 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00ec2 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00ec7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00ecc 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00ed1 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00ed6 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00edb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00ee0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00ee5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00eed 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00ef2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00efa 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00eff e85cc8b5ff                     call       0x7fefc79c3f60
00f04 0f1f8400fc0f000b               nop        dword ptr [rax + rax + 0xb000ffc]
00f0c be45ffffff                     mov        esi, 0xffffff45
00f11 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00f19 448b542408                     mov        r10d, dword ptr [rsp + 8]
00f1e 44891424                       mov        dword ptr [rsp], r10d
00f22 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00f27 4489442404                     mov        dword ptr [rsp + 4], r8d
00f2c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00f31 4489542408                     mov        dword ptr [rsp + 8], r10d
00f36 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00f3e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f43 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f48 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f4d 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00f52 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00f57 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00f5c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00f61 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00f66 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00f6b 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00f70 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00f75 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00f7a 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00f7f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00f84 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00f89 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00f8e 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00f93 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00f98 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00f9d 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00fa2 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00fa7 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00fac 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00fb1 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00fb6 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00fbb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00fc0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00fc5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00fcd 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00fd2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00fda 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00fdf 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
00fe7 4489542478                     mov        dword ptr [rsp + 0x78], r10d
00fec 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00ff4 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00ffc 666690                         nop        
00fff e85cc7b5ff                     call       0x7fefc79c3f60
01004 0f1f8400fc10000c               nop        dword ptr [rax + rax + 0xc0010fc]
0100c be45ffffff                     mov        esi, 0xffffff45
01011 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01019 448b442408                     mov        r8d, dword ptr [rsp + 8]
0101e 44890424                       mov        dword ptr [rsp], r8d
01022 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01027 4489542404                     mov        dword ptr [rsp + 4], r10d
0102c 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01031 4489442408                     mov        dword ptr [rsp + 8], r8d
01036 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0103e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01043 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01048 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0104d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01052 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01057 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0105c 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01061 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01066 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0106b 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01070 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01075 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0107a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0107f 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01084 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01089 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0108e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01093 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01098 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0109d 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
010a2 4489442448                     mov        dword ptr [rsp + 0x48], r8d
010a7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
010ac 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
010b1 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
010b6 4489442450                     mov        dword ptr [rsp + 0x50], r8d
010bb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
010c0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
010c5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
010cd 4c89542460                     mov        qword ptr [rsp + 0x60], r10
010d2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
010da 4c89542468                     mov        qword ptr [rsp + 0x68], r10
010df 448b9424d4000000               mov        r10d, dword ptr [rsp + 0xd4]
010e7 4489542474                     mov        dword ptr [rsp + 0x74], r10d
010ec 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
010f4 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
010fb 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
01103 e858c6b5ff                     call       0x7fefc79c3f60
01108 0f1f84000012000d               nop        dword ptr [rax + rax + 0xd001200]
01110 be45ffffff                     mov        esi, 0xffffff45
01115 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0111d 448b442408                     mov        r8d, dword ptr [rsp + 8]
01122 44890424                       mov        dword ptr [rsp], r8d
01126 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0112b 44894c2404                     mov        dword ptr [rsp + 4], r9d
01130 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01135 4489442408                     mov        dword ptr [rsp + 8], r8d
0113a 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
0113f 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01144 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01149 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0114e 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01153 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01158 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
0115d 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01162 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01167 4489442428                     mov        dword ptr [rsp + 0x28], r8d
0116c 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01171 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01176 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0117b 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01180 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01185 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0118a 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0118f 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01194 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01199 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0119e 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
011a3 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
011a8 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
011ad 4489442450                     mov        dword ptr [rsp + 0x50], r8d
011b2 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
011b7 4c89442458                     mov        qword ptr [rsp + 0x58], r8
011bc 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
011c4 4c89442460                     mov        qword ptr [rsp + 0x60], r8
011c9 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
011d1 4c89442468                     mov        qword ptr [rsp + 0x68], r8
011d6 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
011db 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
011e2 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
011ea 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
011f2 90                             nop        
011f3 e868c5b5ff                     call       0x7fefc79c3f60
011f8 0f1f8400f012000e               nop        dword ptr [rax + rax + 0xe0012f0]
01200 41b9ffffff7f                   mov        r9d, 0x7fffffff
01206 4d3bc1                         cmp        r8, r9
01209 bdffffffff                     mov        ebp, 0xffffffff
0120e 7c08                           jl         0x7fefc7e67a18
01210 400f95c5                       setne      bpl
01214 400fb6ed                       movzx      ebp, bpl
01218 be45ffffff                     mov        esi, 0xffffff45
0121d 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
01225 4c890c24                       mov        qword ptr [rsp], r9
01229 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0122e 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01233 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
0123b 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
01240 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01245 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
0124a 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
0124e 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01252 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01257 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0125c 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
01260 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01264 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01269 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0126e 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
01272 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
01276 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0127b 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01280 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
01287 894c2444                       mov        dword ptr [rsp + 0x44], ecx
0128b 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01290 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01295 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
01299 894c2454                       mov        dword ptr [rsp + 0x54], ecx
0129d 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
012a2 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
012a7 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
012ac 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
012b1 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
012b9 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
012be 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
012c6 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
012cb 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
012d3 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
012da 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
012e2 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
012ea 90                             nop        
012eb e870c4b5ff                     call       0x7fefc79c3f60
012f0 0f1f8400e813000f               nop        dword ptr [rax + rax + 0xf0013e8]
012f8 be45ffffff                     mov        esi, 0xffffff45
012fd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01305 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
0130a 44890c24                       mov        dword ptr [rsp], r9d
0130e 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
01313 44894c2404                     mov        dword ptr [rsp + 4], r9d
01318 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
0131d 44894c2408                     mov        dword ptr [rsp + 8], r9d
01322 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01327 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0132c 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01331 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01336 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0133b 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01340 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01345 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0134a 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0134f 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01354 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01359 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0135e 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01363 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01368 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
0136d 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01372 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01377 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0137c 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01381 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01386 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0138b 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01390 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
01395 4489442450                     mov        dword ptr [rsp + 0x50], r8d
0139a 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
0139f 4c89442458                     mov        qword ptr [rsp + 0x58], r8
013a4 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
013ac 4c89442460                     mov        qword ptr [rsp + 0x60], r8
013b1 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
013b6 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
013be 90                             nop        
013bf e89cc3b5ff                     call       0x7fefc79c3f60
013c4 0f1f8400bc140010               nop        dword ptr [rax + rax + 0x100014bc]
013cc be45ffffff                     mov        esi, 0xffffff45
013d1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013d9 448b542408                     mov        r10d, dword ptr [rsp + 8]
013de 44891424                       mov        dword ptr [rsp], r10d
013e2 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
013e7 4489542404                     mov        dword ptr [rsp + 4], r10d
013ec 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
013f1 4489542408                     mov        dword ptr [rsp + 8], r10d
013f6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
013fb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01400 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01405 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0140a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0140f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01414 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01419 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0141e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01423 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01428 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0142d 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01432 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01437 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0143c 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01441 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01446 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0144b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01450 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01455 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0145a 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0145f 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01464 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01469 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0146e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01473 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01478 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01480 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01485 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0148a 89bc2480000000                 mov        dword ptr [rsp + 0x80], edi
01491 6690                           nop        
01493 e8c8c2b5ff                     call       0x7fefc79c3f60
01498 0f1f840090150011               nop        dword ptr [rax + rax + 0x11001590]
014a0 be3dffffff                     mov        esi, 0xffffff3d
014a5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014ad 8b4c2408                       mov        ecx, dword ptr [rsp + 8]
014b1 890c24                         mov        dword ptr [rsp], ecx
014b4 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
014b8 894c2404                       mov        dword ptr [rsp + 4], ecx
014bc 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
014c0 894c2408                       mov        dword ptr [rsp + 8], ecx
014c4 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
014c9 4c89442418                     mov        qword ptr [rsp + 0x18], r8
014ce 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
014d3 448944240c                     mov        dword ptr [rsp + 0xc], r8d
014d8 8b4c2428                       mov        ecx, dword ptr [rsp + 0x28]
014dc 894c2420                       mov        dword ptr [rsp + 0x20], ecx
014e0 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
014e5 4489442424                     mov        dword ptr [rsp + 0x24], r8d
014ea 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
014ee 894c2428                       mov        dword ptr [rsp + 0x28], ecx
014f2 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
014f7 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
014fc 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
01500 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01504 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01509 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0150e 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
01512 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01516 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
0151e 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01523 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
01527 894c2448                       mov        dword ptr [rsp + 0x48], ecx
0152b 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01530 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01535 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
01539 894c2450                       mov        dword ptr [rsp + 0x50], ecx
0153d 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
01542 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01547 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
0154f 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01554 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
0155c 4c89442468                     mov        qword ptr [rsp + 0x68], r8
01561 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01566 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
0156e 89bc2490000000                 mov        dword ptr [rsp + 0x90], edi
01575 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
0157d 6690                           nop        
0157f e8dcc1b5ff                     call       0x7fefc79c3f60
01584 0f1f84007c160012               nop        dword ptr [rax + rax + 0x1200167c]
0158c be45ffffff                     mov        esi, 0xffffff45
01591 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01599 448b442408                     mov        r8d, dword ptr [rsp + 8]
0159e 44890424                       mov        dword ptr [rsp], r8d
015a2 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
015a7 4489442404                     mov        dword ptr [rsp + 4], r8d
015ac 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
015b1 4489542408                     mov        dword ptr [rsp + 8], r10d
015b6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015bb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015c0 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
015c5 448944240c                     mov        dword ptr [rsp + 0xc], r8d
015ca 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
015cf 4489542420                     mov        dword ptr [rsp + 0x20], r10d
015d4 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
015d9 4489442424                     mov        dword ptr [rsp + 0x24], r8d
015de 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
015e3 4489542428                     mov        dword ptr [rsp + 0x28], r10d
015e8 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
015ed 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
015f2 894c2430                       mov        dword ptr [rsp + 0x30], ecx
015f6 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
015fb 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01600 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01605 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
0160a 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0160e 90                             nop        
0160f e84cc1b5ff                     call       0x7fefc79c3f60
01614 0f1f84000c170013               nop        dword ptr [rax + rax + 0x1300170c]
0161c be45ffffff                     mov        esi, 0xffffff45
01621 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01629 448b442408                     mov        r8d, dword ptr [rsp + 8]
0162e 44890424                       mov        dword ptr [rsp], r8d
01632 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01637 4489442404                     mov        dword ptr [rsp + 4], r8d
0163c 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01641 44894c2408                     mov        dword ptr [rsp + 8], r9d
01646 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
0164b 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01650 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01655 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
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
01697 e8c4c0b5ff                     call       0x7fefc79c3f60
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
01714 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01719 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0171e 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01723 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01728 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0172d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01732 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01737 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0173c 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
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
01783 e8d8bfb5ff                     call       0x7fefc79c3f60
01788 0f1f840080180015               nop        dword ptr [rax + rax + 0x15001880]
01790 4585c0                         test       r8d, r8d
01793 7f07                           jg         0x7fefc7e67f9c
01795 33c0                           xor        eax, eax
01797 e92be9ffff                     jmp        0x7fefc7e668c7
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
017f3 e86838a9ff                     call       0x7fefc78fb860
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
01840 e982e8ffff                     jmp        0x7fefc7e668c7
01845 4585c0                         test       r8d, r8d
01848 7f08                           jg         0x7fefc7e68052
0184a 4533f6                         xor        r14d, r14d
0184d e9b6e8ffff                     jmp        0x7fefc7e66908
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
018b3 e8a837a9ff                     call       0x7fefc78fb860
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
01900 e903e8ffff                     jmp        0x7fefc7e66908
01905 4533c0                         xor        r8d, r8d
01908 e9e4f0ffff                     jmp        0x7fefc7e671f1
0190d bee4ffffff                     mov        esi, 0xffffffe4
01912 48ffb42490000000               push       qword ptr [rsp + 0x90]
0191a 488f0424                       pop        qword ptr [rsp]
0191e 90                             nop        
0191f e83cbeb5ff                     call       0x7fefc79c3f60
01924 0f1f84001c1a0018               nop        dword ptr [rax + rax + 0x18001a1c]
0192c be5d000000                     mov        esi, 0x5d
01931 6690                           nop        
01933 e828beb5ff                     call       0x7fefc79c3f60
01938 0f1f8400301a0019               nop        dword ptr [rax + rax + 0x19001a30]
01940 bef6ffffff                     mov        esi, 0xfffffff6
01945 6690                           nop        
01947 e814beb5ff                     call       0x7fefc79c3f60
0194c 0f1f8400441a001a               nop        dword ptr [rax + rax + 0x1a001a44]
01954 bef6ffffff                     mov        esi, 0xfffffff6
01959 6690                           nop        
0195b e800beb5ff                     call       0x7fefc79c3f60
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
019ba 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
019bf 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
019c4 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
019c9 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
019ce 90                             nop        
019cf e88cbdb5ff                     call       0x7fefc79c3f60
019d4 0f1f8400cc1a001c               nop        dword ptr [rax + rax + 0x1c001acc]
019dc bee4ffffff                     mov        esi, 0xffffffe4
019e1 48ffb42490000000               push       qword ptr [rsp + 0x90]
019e9 488f0424                       pop        qword ptr [rsp]
019ed 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
019f2 48894424f8                     mov        qword ptr [rsp - 8], rax
019f7 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
019fe 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01a02 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a07 895c2428                       mov        dword ptr [rsp + 0x28], ebx
01a0b 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01a0f e84cbdb5ff                     call       0x7fefc79c3f60
01a14 0f1f84000c1b001d               nop        dword ptr [rax + rax + 0x1d001b0c]
01a1c bee4ffffff                     mov        esi, 0xffffffe4
01a21 48ffb42490000000               push       qword ptr [rsp + 0x90]
01a29 488f0424                       pop        qword ptr [rsp]
01a2d 48894424f8                     mov        qword ptr [rsp - 8], rax
01a32 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a39 89442418                       mov        dword ptr [rsp + 0x18], eax
01a3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a42 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01a46 89542428                       mov        dword ptr [rsp + 0x28], edx
01a4a 4889442430                     mov        qword ptr [rsp + 0x30], rax
01a4f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01a54 666690                         nop        
01a57 e804bdb5ff                     call       0x7fefc79c3f60
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
01aac 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01ab1 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01ab6 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01abb 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01ac0 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01ac5 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01aca 90                             nop        
01acb e890bcb5ff                     call       0x7fefc79c3f60
01ad0 0f1f8400c81b001f               nop        dword ptr [rax + rax + 0x1f001bc8]
01ad8 beccffffff                     mov        esi, 0xffffffcc
01add 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ae5 448b542408                     mov        r10d, dword ptr [rsp + 8]
01aea 44891424                       mov        dword ptr [rsp], r10d
01aee 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01af3 48894424f8                     mov        qword ptr [rsp - 8], rax
01af8 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01aff 89442414                       mov        dword ptr [rsp + 0x14], eax
01b03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b08 895c2418                       mov        dword ptr [rsp + 0x18], ebx
01b0c 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01b10 897c242c                       mov        dword ptr [rsp + 0x2c], edi
01b14 666690                         nop        
01b17 e844bcb5ff                     call       0x7fefc79c3f60
01b1c 0f1f8400141c0020               nop        dword ptr [rax + rax + 0x20001c14]
01b24 beccffffff                     mov        esi, 0xffffffcc
01b29 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b31 448b442408                     mov        r8d, dword ptr [rsp + 8]
01b36 44890424                       mov        dword ptr [rsp], r8d
01b3a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b3f 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b46 89442410                       mov        dword ptr [rsp + 0x10], eax
01b4a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b4f 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01b53 89542418                       mov        dword ptr [rsp + 0x18], edx
01b57 4889442428                     mov        qword ptr [rsp + 0x28], rax
01b5c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01b61 897c2434                       mov        dword ptr [rsp + 0x34], edi
01b65 6690                           nop        
01b67 e8f4bbb5ff                     call       0x7fefc79c3f60
01b6c 0f1f8400641c0021               nop        dword ptr [rax + rax + 0x21001c64]
01b74 be45ffffff                     mov        esi, 0xffffff45
01b79 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01b7e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01b83 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01b88 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01b8d 6690                           nop        
01b8f e8ccbbb5ff                     call       0x7fefc79c3f60
01b94 0f1f84008c1c0022               nop        dword ptr [rax + rax + 0x22001c8c]
01b9c be45ffffff                     mov        esi, 0xffffff45
01ba1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ba9 448b542408                     mov        r10d, dword ptr [rsp + 8]
01bae 44891424                       mov        dword ptr [rsp], r10d
01bb2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01bb7 4489542408                     mov        dword ptr [rsp + 8], r10d
01bbc 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01bc1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01bc6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01bcb 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01bd0 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01bd5 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01bda 90                             nop        
01bdb e880bbb5ff                     call       0x7fefc79c3f60
01be0 0f1f8400d81c0023               nop        dword ptr [rax + rax + 0x23001cd8]
01be8 bef6ffffff                     mov        esi, 0xfffffff6
01bed 6690                           nop        
01bef e86cbbb5ff                     call       0x7fefc79c3f60
01bf4 0f1f8400ec1c0024               nop        dword ptr [rax + rax + 0x24001cec]
01bfc be5d000000                     mov        esi, 0x5d
01c01 6690                           nop        
01c03 e858bbb5ff                     call       0x7fefc79c3f60
01c08 0f1f8400001d0025               nop        dword ptr [rax + rax + 0x25001d00]
01c10 be45ffffff                     mov        esi, 0xffffff45
01c15 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c1d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01c22 44891c24                       mov        dword ptr [rsp], r11d
01c26 90                             nop        
01c27 e834bbb5ff                     call       0x7fefc79c3f60
01c2c 0f1f8400241d0026               nop        dword ptr [rax + rax + 0x26001d24]
01c34 bef6ffffff                     mov        esi, 0xfffffff6
01c39 418bea                         mov        ebp, r10d
01c3c 666690                         nop        
01c3f e81cbbb5ff                     call       0x7fefc79c3f60
01c44 0f1f84003c1d0027               nop        dword ptr [rax + rax + 0x27001d3c]
01c4c bef6ffffff                     mov        esi, 0xfffffff6
01c51 8be9                           mov        ebp, ecx
01c53 e808bbb5ff                     call       0x7fefc79c3f60
01c58 0f1f8400501d0028               nop        dword ptr [rax + rax + 0x28001d50]
01c60 bef6ffffff                     mov        esi, 0xfffffff6
01c65 418beb                         mov        ebp, r11d
01c68 666690                         nop        
01c6b e8f0bab5ff                     call       0x7fefc79c3f60
01c70 0f1f8400681d0029               nop        dword ptr [rax + rax + 0x29001d68]
01c78 bef6ffffff                     mov        esi, 0xfffffff6
01c7d 6690                           nop        
01c7f e8dcbab5ff                     call       0x7fefc79c3f60
01c84 0f1f84007c1d002a               nop        dword ptr [rax + rax + 0x2a001d7c]
01c8c bef6ffffff                     mov        esi, 0xfffffff6
01c91 6690                           nop        
01c93 e8c8bab5ff                     call       0x7fefc79c3f60
01c98 0f1f8400901d002b               nop        dword ptr [rax + rax + 0x2b001d90]
01ca0 bef6ffffff                     mov        esi, 0xfffffff6
01ca5 6690                           nop        
01ca7 e8b4bab5ff                     call       0x7fefc79c3f60
01cac 0f1f8400a41d002c               nop        dword ptr [rax + rax + 0x2c001da4]
01cb4 bef6ffffff                     mov        esi, 0xfffffff6
01cb9 6690                           nop        
01cbb e8a0bab5ff                     call       0x7fefc79c3f60
01cc0 0f1f8400b81d002d               nop        dword ptr [rax + rax + 0x2d001db8]
01cc8 bef6ffffff                     mov        esi, 0xfffffff6
01ccd 6690                           nop        
01ccf e88cbab5ff                     call       0x7fefc79c3f60
01cd4 0f1f8400cc1d002e               nop        dword ptr [rax + rax + 0x2e001dcc]
01cdc bef6ffffff                     mov        esi, 0xfffffff6
01ce1 6690                           nop        
01ce3 e878bab5ff                     call       0x7fefc79c3f60
01ce8 0f1f8400e01d002f               nop        dword ptr [rax + rax + 0x2f001de0]
01cf0 bef6ffffff                     mov        esi, 0xfffffff6
01cf5 6690                           nop        
01cf7 e864bab5ff                     call       0x7fefc79c3f60
01cfc 0f1f8400f41d0030               nop        dword ptr [rax + rax + 0x30001df4]
01d04 eb08                           jmp        0x7fefc7e6850e
01d06 eb06                           jmp        0x7fefc7e6850e
01d08 eb04                           jmp        0x7fefc7e6850e
01d0a eb02                           jmp        0x7fefc7e6850e
01d0c eb00                           jmp        0x7fefc7e6850e
01d0e 488bf0                         mov        rsi, rax
01d11 e916edffff                     jmp        0x7fefc7e6722c
01d16 49ba5772e6c7ef7f0000           movabs     r10, 0x7fefc7e67257
01d20 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01d27 e9b459a9ff                     jmp        0x7fefc78fdee0
01d2c e86f25a8ff                     call       0x7fefc78eaaa0
01d31 e9e8e2ffff                     jmp        0x7fefc7e6681e
01d36 f4                             hlt        
01d37 f4                             hlt        
