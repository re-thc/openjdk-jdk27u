00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85da1d0000                   jne        0x7f2213e5e3f8
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
00050 0f83af190000                   jae        0x7f2213e5e005
00056 440fb6441607                   movzx      r8d, byte ptr [rsi + rdx + 7]
0005c 4585c0                         test       r8d, r8d
0005f 0f84bf190000                   je         0x7f2213e5e024
00065 448bda                         mov        r11d, edx
00068 442bd9                         sub        r11d, ecx
0006b 8b3c24                         mov        edi, dword ptr [rsp]
0006e 83c7f9                         add        edi, -7
00071 448d6af8                       lea        r13d, [rdx - 8]
00075 468d0cdd00000000               lea        r9d, [r11*8]
0007d f3450fbdd0                     lzcnt      r10d, r8d
00082 be1f000000                     mov        esi, 0x1f
00087 412bf2                         sub        esi, r10d
0008a bb08000000                     mov        ebx, 8
0008f 2bde                           sub        ebx, esi
00091 418bd1                         mov        edx, r9d
00094 2bd3                           sub        edx, ebx
00096 4183fb08                       cmp        r11d, 8
0009a 0f8ce8170000                   jl         0x7f2213e5de88
000a0 85ff                           test       edi, edi
000a2 0f8c201b0000                   jl         0x7f2213e5e1c8
000a8 8b2c24                         mov        ebp, dword ptr [rsp]
000ab 83c5f9                         add        ebp, -7
000ae 443bed                         cmp        r13d, ebp
000b1 0f83191a0000                   jae        0x7f2213e5e0d0
000b7 458bc5                         mov        r8d, r13d
000ba 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
000c2 4b8b440208                     mov        rax, qword ptr [r10 + r8 + 8]
000c7 4183c3f8                       add        r11d, -8
000cb 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000d3 4183c2f0                       add        r10d, -0x10
000d7 4183fb08                       cmp        r11d, 8
000db 0f8c5c180000                   jl         0x7f2213e5df3d
000e1 85ff                           test       edi, edi
000e3 0f8c231b0000                   jl         0x7f2213e5e20c
000e9 8b2c24                         mov        ebp, dword ptr [rsp]
000ec 83c5f9                         add        ebp, -7
000ef 443bd5                         cmp        r10d, ebp
000f2 0f83181a0000                   jae        0x7f2213e5e110
000f8 458bda                         mov        r11d, r10d
000fb 4c8b842490000000               mov        r8, qword ptr [rsp + 0x90]
00103 4f8b741808                     mov        r14, qword ptr [r8 + r11 + 8]
00108 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
0010d 448b4518                       mov        r8d, dword ptr [rbp + 0x18]
00111 4585c0                         test       r8d, r8d
00114 0f841e190000                   je         0x7f2213e5e038
0011a 448b5d1c                       mov        r11d, dword ptr [rbp + 0x1c]
0011e 418b4b04                       mov        ecx, dword ptr [r11 + 4]
00122 448b4d20                       mov        r9d, dword ptr [rbp + 0x20]
00126 4585c9                         test       r9d, r9d
00129 0f841d190000                   je         0x7f2213e5e04c
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
00196 0f84c1080000                   je         0x7f2213e5d05d
0019c be40000000                     mov        esi, 0x40
001a1 2bf3                           sub        esi, ebx
001a3 3bce                           cmp        ecx, esi
001a5 0f8ffd010000                   jg         0x7f2213e5c9a8
001ab 2bf1                           sub        esi, ecx
001ad c4e2cbf7e8                     shrx       rbp, rax, rsi
001b2 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b7 83f940                         cmp        ecx, 0x40
001ba 0f8d1c1b0000                   jge        0x7f2213e5e2dc
001c0 41ba01000000                   mov        r10d, 1
001c6 c442f1f7d2                     shlx       r10, r10, rcx
001cb 49ffca                         dec        r10
001ce 4c23d5                         and        r10, rbp
001d1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
001d6 448bd9                         mov        r11d, ecx
001d9 458bcb                         mov        r9d, r11d
001dc 442b4c240c                     sub        r9d, dword ptr [rsp + 0xc]
001e1 458d4108                       lea        r8d, [r9 + 8]
001e5 4183f840                       cmp        r8d, 0x40
001e9 7c34                           jl         0x7f2213e5c81f
001eb 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
001f0 4183c1c8                       add        r9d, -0x38
001f4 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001f9 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00201 8b542408                       mov        edx, dword ptr [rsp + 8]
00205 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00209 6690                           nop        
0020b e850f0a9ff                     call       0x7f22138fb860
00210 0f1f840008030000               nop        dword ptr [rax + rax + 0x308]
00218 4889442420                     mov        qword ptr [rsp + 0x20], rax
0021d eb31                           jmp        0x7f2213e5c850
0021f 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
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
0025c 0f8dfa190000                   jge        0x7f2213e5e25c
00262 c462d3f7542460                 shrx       r10, qword ptr [rsp + 0x60], rbp
00269 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0026e 41bb01000000                   mov        r11d, 1
00274 c44251f7d3                     shlx       r10d, r11d, ebp
00279 41ffca                         dec        r10d
0027c 4d63d2                         movsxd     r10, r10d
0027f 4c23542460                     and        r10, qword ptr [rsp + 0x60]
00284 458bda                         mov        r11d, r10d
00287 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0028c 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00291 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00295 83fd20                         cmp        ebp, 0x20
00298 0f8de6190000                   jge        0x7f2213e5e284
0029e 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
002a6 458b5204                       mov        r10d, dword ptr [r10 + 4]
002aa 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
002b2 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
002b7 458b5314                       mov        r10d, dword ptr [r11 + 0x14]
002bb 458b4204                       mov        r8d, dword ptr [r10 + 4]
002bf 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
002c4 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
002c8 458b5b04                       mov        r11d, dword ptr [r11 + 4]
002cc 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
002d1 458b5114                       mov        r10d, dword ptr [r9 + 0x14]
002d5 458b5204                       mov        r10d, dword ptr [r10 + 4]
002d9 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
002dd 85c9                           test       ecx, ecx
002df 0f8e18170000                   jle        0x7f2213e5dffd
002e5 41ffc8                         dec        r8d
002e8 4489442460                     mov        dword ptr [rsp + 0x60], r8d
002ed 41ffcb                         dec        r11d
002f0 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
002f5 41ffca                         dec        r10d
002f8 4489542470                     mov        dword ptr [rsp + 0x70], r10d
002fd c462d3f7542468                 shrx       r10, qword ptr [rsp + 0x68], rbp
00304 41bb01000000                   mov        r11d, 1
0030a c44251f7c3                     shlx       r8d, r11d, ebp
0030f 458bda                         mov        r11d, r10d
00312 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
00317 41ffc8                         dec        r8d
0031a 4d63d0                         movsxd     r10, r8d
0031d 4c23542468                     and        r10, qword ptr [rsp + 0x68]
00322 458bd2                         mov        r10d, r10d
00325 4489542468                     mov        dword ptr [rsp + 0x68], r10d
0032a 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00332 458b9af4000000                 mov        r11d, dword ptr [r10 + 0xf4]
00339 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00341 458b92f0000000                 mov        r10d, dword ptr [r10 + 0xf0]
00348 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00350 458b5204                       mov        r10d, dword ptr [r10 + 4]
00354 4585d2                         test       r10d, r10d
00357 0f8603170000                   jbe        0x7f2213e5e060
0035d 4d63d2                         movsxd     r10, r10d
00360 4c63d9                         movsxd     r11, ecx
00363 49ffcb                         dec        r11
00366 4d3bda                         cmp        r11, r10
00369 0f83f1160000                   jae        0x7f2213e5e060
0036f 448b542404                     mov        r10d, dword ptr [rsp + 4]
00374 4585d2                         test       r10d, r10d
00377 0f8cdb170000                   jl         0x7f2213e5e158
0037d 448b1c24                       mov        r11d, dword ptr [rsp]
00381 4183c3f9                       add        r11d, -7
00385 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0038d 4533db                         xor        r11d, r11d
00390 4533d2                         xor        r10d, r10d
00393 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
0039b 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
003a3 e98e020000                     jmp        0x7f2213e5cc36
003a8 8be9                           mov        ebp, ecx
003aa 2bee                           sub        ebp, esi
003ac 666690                         nop        
003af e8aceea9ff                     call       0x7f22138fb860
003b4 0f1f8400ac040001               nop        dword ptr [rax + rax + 0x10004ac]
003bc 4823442428                     and        rax, qword ptr [rsp + 0x28]
003c1 41bb40000000                   mov        r11d, 0x40
003c7 442bdd                         sub        r11d, ebp
003ca c462d1f7c0                     shlx       r8, rax, rbp
003cf c462a3f7942498000000           shrx       r10, qword ptr [rsp + 0x98], r11
003d9 4d0bc2                         or         r8, r10
003dc 4c89442460                     mov        qword ptr [rsp + 0x60], r8
003e1 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
003e6 e9eefdffff                     jmp        0x7f2213e5c7d9
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
0042a 0f8dfc090000                   jge        0x7f2213e5d42c
00430 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0043a 41ba01000000                   mov        r10d, 1
00440 c442d1f7d2                     shlx       r10, r10, rbp
00445 49ffca                         dec        r10
00448 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00450 458bda                         mov        r11d, r10d
00453 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0045a 83fd40                         cmp        ebp, 0x40
0045d 0f8da90a0000                   jge        0x7f2213e5d50c
00463 c4c2d3f7f9                     shrx       rdi, r9, rbp
00468 41ba01000000                   mov        r10d, 1
0046e c442d1f7d2                     shlx       r10, r10, rbp
00473 49ffca                         dec        r10
00476 4d23d1                         and        r10, r9
00479 418bda                         mov        ebx, r10d
0047c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00483 83fd40                         cmp        ebp, 0x40
00486 0f8d800b0000                   jge        0x7f2213e5d60c
0048c c4e2d3f7cf                     shrx       rcx, rdi, rbp
00491 41ba01000000                   mov        r10d, 1
00497 c442d1f7d2                     shlx       r10, r10, rbp
0049c 49ffca                         dec        r10
0049f 4c23d7                         and        r10, rdi
004a2 458bd2                         mov        r10d, r10d
004a5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004ac 83fd40                         cmp        ebp, 0x40
004af 0f8d5b0c0000                   jge        0x7f2213e5d710
004b5 41b801000000                   mov        r8d, 1
004bb c442d1f7c0                     shlx       r8, r8, rbp
004c0 49ffc8                         dec        r8
004c3 4c23c1                         and        r8, rcx
004c6 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
004ce 418bc9                         mov        ecx, r9d
004d1 4103ca                         add        ecx, r10d
004d4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
004d9 458bd2                         mov        r10d, r10d
004dc 4403d3                         add        r10d, ebx
004df 4863d9                         movsxd     rbx, ecx
004e2 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
004ea 458bc9                         mov        r9d, r9d
004ed 4d03c1                         add        r8, r9
004f0 4c8b8c24e8000000               mov        r9, qword ptr [rsp + 0xe8]
004f8 4c03cb                         add        r9, rbx
004fb 4c898c24e8000000               mov        qword ptr [rsp + 0xe8], r9
00503 4d85c0                         test       r8, r8
00506 0f8e2c070000                   jle        0x7f2213e5d238
0050c 4981f8ffffff7f                 cmp        r8, 0x7fffffff
00513 0f8fe70c0000                   jg         0x7f2213e5d800
00519 4181faffff0100                 cmp        r10d, 0x1ffff
00520 0f8fd20d0000                   jg         0x7f2213e5d8f8
00526 81f9ffff0300                   cmp        ecx, 0x3ffff
0052c 0f8f9a0e0000                   jg         0x7f2213e5d9cc
00532 458bc8                         mov        r9d, r8d
00535 4181f900000010                 cmp        r9d, 0x10000000
0053c 0f835e0f0000                   jae        0x7f2213e5daa0
00542 4d63d2                         movsxd     r10, r10d
00545 4d63c1                         movsxd     r8, r9d
00548 48c1e312                       shl        rbx, 0x12
0054c 49c1e024                       shl        r8, 0x24
00550 4c0bc3                         or         r8, rbx
00553 4d0bc2                         or         r8, r10
00556 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
0055e 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
00566 4f8944ca08                     mov        qword ptr [r10 + r9*8 + 8], r8
0056b 8b2c24                         mov        ebp, dword ptr [rsp]
0056e 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00572 0f8dad000000                   jge        0x7f2213e5cc25
00578 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00580 49c1ea30                       shr        r10, 0x30
00584 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
00589 49c1e830                       shr        r8, 0x30
0058d 418bca                         mov        ecx, r10d
00590 418bd8                         mov        ebx, r8d
00593 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
0059b c4422bf7cb                     shrx       r9d, r11d, r10d
005a0 44039424c8000000               add        r10d, dword ptr [rsp + 0xc8]
005a8 c4422bf7c3                     shrx       r8d, r11d, r10d
005ad 4103d8                         add        ebx, r8d
005b0 895c2474                       mov        dword ptr [rsp + 0x74], ebx
005b4 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
005bc 4183fa20                       cmp        r10d, 0x20
005c0 0f8dca0f0000                   jge        0x7f2213e5db90
005c6 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005ce 49c1ea30                       shr        r10, 0x30
005d2 458bd2                         mov        r10d, r10d
005d5 41b801000000                   mov        r8d, 1
005db 8bbc24c8000000                 mov        edi, dword ptr [rsp + 0xc8]
005e2 c4c241f7d8                     shlx       ebx, r8d, edi
005e7 ffcb                           dec        ebx
005e9 4123d9                         and        ebx, r9d
005ec 03d9                           add        ebx, ecx
005ee 895c2448                       mov        dword ptr [rsp + 0x48], ebx
005f2 448b8c24cc000000               mov        r9d, dword ptr [rsp + 0xcc]
005fa 4183f920                       cmp        r9d, 0x20
005fe 0f8d24100000                   jge        0x7f2213e5dc28
00604 41b901000000                   mov        r9d, 1
0060a 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
00612 c44239f7c1                     shlx       r8d, r9d, r8d
00617 41ffc8                         dec        r8d
0061a 4523c3                         and        r8d, r11d
0061d 4503c2                         add        r8d, r10d
00620 4489442468                     mov        dword ptr [rsp + 0x68], r8d
00625 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00629 0f8db4030000                   jge        0x7f2213e5cfe3
0062f 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00636 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0063b 4423442474                     and        r8d, dword ptr [rsp + 0x74]
00640 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00645 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
00649 458b5304                       mov        r10d, dword ptr [r11 + 4]
0064d 453bc2                         cmp        r8d, r10d
00650 0f8317040000                   jae        0x7f2213e5d06d
00656 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
0065a 234c2468                       and        ecx, dword ptr [rsp + 0x68]
0065e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00663 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
00667 458b4a04                       mov        r9d, dword ptr [r10 + 4]
0066b 4f8b5cc308                     mov        r11, qword ptr [r11 + r8*8 + 8]
00670 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
00675 413bc9                         cmp        ecx, r9d
00678 0f8376040000                   jae        0x7f2213e5d0f4
0067e 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00683 4423442448                     and        r8d, dword ptr [rsp + 0x48]
00688 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0068d 458b5914                       mov        r11d, dword ptr [r9 + 0x14]
00691 418b5b04                       mov        ebx, dword ptr [r11 + 4]
00695 4d8b54ca08                     mov        r10, qword ptr [r10 + rcx*8 + 8]
0069a 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
006a2 443bc3                         cmp        r8d, ebx
006a5 0f83e5040000                   jae        0x7f2213e5d190
006ab 4f8b54c308                     mov        r10, qword ptr [r11 + r8*8 + 8]
006b0 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006b8 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006bf ffc5                           inc        ebp
006c1 892c24                         mov        dword ptr [rsp], ebp
006c4 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006c8 0f8de4020000                   jge        0x7f2213e5cfb2
006ce 49c1ea28                       shr        r10, 0x28
006d2 458bda                         mov        r11d, r10d
006d5 450fb6db                       movzx      r11d, r11b
006d9 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
006e1 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
006e6 49c1ea28                       shr        r10, 0x28
006ea 458bd2                         mov        r10d, r10d
006ed 410fb6ea                       movzx      ebp, r10b
006f1 4103eb                         add        ebp, r11d
006f4 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
006fc 49c1ea28                       shr        r10, 0x28
00700 458bda                         mov        r11d, r10d
00703 450fb6db                       movzx      r11d, r11b
00707 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
0070f 4103eb                         add        ebp, r11d
00712 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
00719 41bb01000000                   mov        r11d, 1
0071f 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
00727 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0072f 49c1ea20                       shr        r10, 0x20
00733 458bda                         mov        r11d, r10d
00736 410fb6eb                       movzx      ebp, r11b
0073a 89ac24d4000000                 mov        dword ptr [rsp + 0xd4], ebp
00741 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00746 49c1ea20                       shr        r10, 0x20
0074a 458bd2                         mov        r10d, r10d
0074d 410fb6ea                       movzx      ebp, r10b
00751 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
00758 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00760 49c1ea20                       shr        r10, 0x20
00764 458bda                         mov        r11d, r10d
00767 410fb6eb                       movzx      ebp, r11b
0076b 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
00772 448bc5                         mov        r8d, ebp
00775 44038424d4000000               add        r8d, dword ptr [rsp + 0xd4]
0077d 44038424d8000000               add        r8d, dword ptr [rsp + 0xd8]
00785 44038424d0000000               add        r8d, dword ptr [rsp + 0xd0]
0078d 4585c0                         test       r8d, r8d
00790 0f8492050000                   je         0x7f2213e5d328
00796 4183f83f                       cmp        r8d, 0x3f
0079a 0f8f64060000                   jg         0x7f2213e5d404
007a0 bb40000000                     mov        ebx, 0x40
007a5 2b5c243c                       sub        ebx, dword ptr [rsp + 0x3c]
007a9 443bc3                         cmp        r8d, ebx
007ac 7e47                           jle        0x7f2213e5cdf5
007ae 458bc8                         mov        r9d, r8d
007b1 442bcb                         sub        r9d, ebx
007b4 83fb40                         cmp        ebx, 0x40
007b7 0f8ddf0f0000                   jge        0x7f2213e5dd9c
007bd 41ba01000000                   mov        r10d, 1
007c3 c442e1f7d2                     shlx       r10, r10, rbx
007c8 49ffca                         dec        r10
007cb 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007d3 c4c2b1f7ea                     shlx       rbp, r10, r9
007d8 41ba40000000                   mov        r10d, 0x40
007de 452bd1                         sub        r10d, r9d
007e1 c462abf7542420                 shrx       r10, qword ptr [rsp + 0x20], r10
007e8 490bea                         or         rbp, r10
007eb 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
007f3 eb30                           jmp        0x7f2213e5ce25
007f5 412bd8                         sub        ebx, r8d
007f8 c462e3f78c2498000000           shrx       r9, qword ptr [rsp + 0x98], rbx
00802 4183f840                       cmp        r8d, 0x40
00806 0f8da00e0000                   jge        0x7f2213e5dcac
0080c 41ba01000000                   mov        r10d, 1
00812 c4c2b9f7ea                     shlx       rbp, r10, r8
00817 48ffcd                         dec        rbp
0081a 4923e9                         and        rbp, r9
0081d 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
00825 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0082a 4503d0                         add        r10d, r8d
0082d 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00832 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00837 4503d8                         add        r11d, r8d
0083a 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0083f 4183fa40                       cmp        r10d, 0x40
00843 0f8cd7fbffff                   jl         0x7f2213e5ca20
00849 458d5ac0                       lea        r11d, [r10 - 0x40]
0084d 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00852 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00856 83c5f8                         add        ebp, -8
00859 896c240c                       mov        dword ptr [rsp + 0xc], ebp
0085d 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
00861 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
00865 83c1f0                         add        ecx, -0x10
00868 83f908                         cmp        ecx, 8
0086b 0f8cf3000000                   jl         0x7f2213e5cf64
00871 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00876 4183c2e8                       add        r10d, -0x18
0087a 443b9424c4000000               cmp        r10d, dword ptr [rsp + 0xc4]
00882 0f8263fbffff                   jb         0x7f2213e5c9eb
00888 bee4ffffff                     mov        esi, 0xffffffe4
0088d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00895 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0089a 44891c24                       mov        dword ptr [rsp], r11d
0089e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
008a3 44895c2404                     mov        dword ptr [rsp + 4], r11d
008a8 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
008ad 44895c2408                     mov        dword ptr [rsp + 8], r11d
008b2 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
008b7 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
008bc 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
008c1 448944240c                     mov        dword ptr [rsp + 0xc], r8d
008c6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
008cb 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
008d0 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
008d5 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
008da 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
008df 4489442420                     mov        dword ptr [rsp + 0x20], r8d
008e4 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
008e9 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
008ee 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
008f3 4489442428                     mov        dword ptr [rsp + 0x28], r8d
008f8 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
008fd 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00902 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
00907 4489442430                     mov        dword ptr [rsp + 0x30], r8d
0090c 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00911 4489442440                     mov        dword ptr [rsp + 0x40], r8d
00916 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0091b 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00920 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00925 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0092a 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0092f 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
00934 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
0093c 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
00941 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00949 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0094e 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00956 90                             nop        
00957 e80467b6ff                     call       0x7f22139c3660
0095c 0f1f8400540a0002               nop        dword ptr [rax + rax + 0x2000a54]
00964 85c9                           test       ecx, ecx
00966 7f08                           jg         0x7f2213e5cf70
00968 4533d2                         xor        r10d, r10d
0096b e988faffff                     jmp        0x7f2213e5c9f8
00970 8be9                           mov        ebp, ecx
00972 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
0097a 8b542408                       mov        edx, dword ptr [rsp + 8]
0097e 90                             nop        
0097f e8dce8a9ff                     call       0x7f22138fb860
00984 0f1f84007c0a0003               nop        dword ptr [rax + rax + 0x3000a7c]
0098c 448b542408                     mov        r10d, dword ptr [rsp + 8]
00991 41c1e203                       shl        r10d, 3
00995 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0099a 41c1e303                       shl        r11d, 3
0099e 452bd3                         sub        r10d, r11d
009a1 4181c2c0000000                 add        r10d, 0xc0
009a8 c462a9f7d0                     shlx       r10, rax, r10
009ad e946faffff                     jmp        0x7f2213e5c9f8
009b2 4533db                         xor        r11d, r11d
009b5 4533d2                         xor        r10d, r10d
009b8 4533c9                         xor        r9d, r9d
009bb 4533c0                         xor        r8d, r8d
009be 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
009c6 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
009ce 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
009d6 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
009de e944fdffff                     jmp        0x7f2213e5cd27
009e3 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009eb 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009f3 4d03c2                         add        r8, r10
009f6 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
009fe 4d3bc2                         cmp        r8, r10
00a01 7f29                           jg         0x7f2213e5d02c
00a03 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a08 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a10 0f85b2120000                   jne        0x7f2213e5e2c8
00a16 418bc0                         mov        eax, r8d
00a19 4881c410010000                 add        rsp, 0x110
00a20 5d                             pop        rbp
00a21 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a25 0f87b7130000                   ja         0x7f2213e5e3e2
00a2b c3                             ret        
00a2c 48be702274e200000000           movabs     rsi, 0xe2742270
00a36 90                             nop        
00a37 e824e8a9ff                     call       0x7f22138fb860
00a3c 0f1f8400340b0004               nop        dword ptr [rax + rax + 0x4000b34]
00a44 4885c0                         test       rax, rax
00a47 0f8467120000                   je         0x7f2213e5e2b4
00a4d 488bf0                         mov        rsi, rax
00a50 4881c410010000                 add        rsp, 0x110
00a57 5d                             pop        rbp
00a58 e9038cb6ff                     jmp        0x7f22139c5c60
00a5d 4533db                         xor        r11d, r11d
00a60 4533d2                         xor        r10d, r10d
00a63 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00a68 e96cf7ffff                     jmp        0x7f2213e5c7d9
00a6d bee4ffffff                     mov        esi, 0xffffffe4
00a72 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a7a 448b542408                     mov        r10d, dword ptr [rsp + 8]
00a7f 44891424                       mov        dword ptr [rsp], r10d
00a83 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00a88 44894c2404                     mov        dword ptr [rsp + 4], r9d
00a8d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00a92 4489542408                     mov        dword ptr [rsp + 8], r10d
00a97 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00a9c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00aa1 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00aa6 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00aab 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00ab0 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00ab5 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00aba 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00abf 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00ac4 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00ac9 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00ace 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00ad3 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00ad8 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00add 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00ae2 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
00ae7 e87465b6ff                     call       0x7f22139c3660
00aec 0f1f8400e40b0005               nop        dword ptr [rax + rax + 0x5000be4]
00af4 bee4ffffff                     mov        esi, 0xffffffe4
00af9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b01 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b06 44891c24                       mov        dword ptr [rsp], r11d
00b0a 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00b0f 4489442404                     mov        dword ptr [rsp + 4], r8d
00b14 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b19 44895c2408                     mov        dword ptr [rsp + 8], r11d
00b1e 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00b23 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00b28 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00b2d 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00b32 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00b37 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00b3c 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00b41 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00b46 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00b4b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00b50 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00b55 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00b5a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00b5f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00b64 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00b69 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00b6e 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00b73 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00b78 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00b7d 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00b81 6690                           nop        
00b83 e8d864b6ff                     call       0x7f22139c3660
00b88 0f1f8400800c0006               nop        dword ptr [rax + rax + 0x6000c80]
00b90 bee4ffffff                     mov        esi, 0xffffffe4
00b95 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b9d 448b542408                     mov        r10d, dword ptr [rsp + 8]
00ba2 44891424                       mov        dword ptr [rsp], r10d
00ba6 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00bab 44894c2404                     mov        dword ptr [rsp + 4], r9d
00bb0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00bb5 4489542408                     mov        dword ptr [rsp + 8], r10d
00bba 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00bbf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00bc4 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00bc9 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00bce 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00bd3 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00bd8 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00bdd 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00be2 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00be7 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00bec 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00bf1 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00bf6 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00bfb 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00c00 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00c05 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00c0a 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00c0f 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00c14 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00c19 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00c1e 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00c23 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
00c28 666690                         nop        
00c2b e83064b6ff                     call       0x7f22139c3660
00c30 0f1f8400280d0007               nop        dword ptr [rax + rax + 0x7000d28]
00c38 4533c9                         xor        r9d, r9d
00c3b 4d3bc1                         cmp        r8, r9
00c3e bdffffffff                     mov        ebp, 0xffffffff
00c43 7c08                           jl         0x7f2213e5d24d
00c45 400f95c5                       setne      bpl
00c49 400fb6ed                       movzx      ebp, bpl
00c4d be45ffffff                     mov        esi, 0xffffff45
00c52 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
00c5a 4c890c24                       mov        qword ptr [rsp], r9
00c5e 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
00c62 895c240c                       mov        dword ptr [rsp + 0xc], ebx
00c66 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00c6e 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00c73 8b5c243c                       mov        ebx, dword ptr [rsp + 0x3c]
00c77 895c2414                       mov        dword ptr [rsp + 0x14], ebx
00c7b 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00c80 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00c85 8b5c2434                       mov        ebx, dword ptr [rsp + 0x34]
00c89 895c2430                       mov        dword ptr [rsp + 0x30], ebx
00c8d 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00c92 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00c97 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
00c9b 895c2438                       mov        dword ptr [rsp + 0x38], ebx
00c9f 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00ca4 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
00ca9 8b5c2474                       mov        ebx, dword ptr [rsp + 0x74]
00cad 895c2440                       mov        dword ptr [rsp + 0x40], ebx
00cb1 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00cb9 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
00cbe 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
00cc2 895c2450                       mov        dword ptr [rsp + 0x50], ebx
00cc6 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
00ccb 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
00cd0 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00cd4 895c2458                       mov        dword ptr [rsp + 0x58], ebx
00cd8 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
00cdd 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
00ce2 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
00cea 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
00cef 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
00cf7 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00cfc 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00d04 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
00d0b 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d13 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
00d1b e84063b6ff                     call       0x7f22139c3660
00d20 0f1f8400180e0008               nop        dword ptr [rax + rax + 0x8000e18]
00d28 be45ffffff                     mov        esi, 0xffffff45
00d2d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00d35 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00d3a 44891c24                       mov        dword ptr [rsp], r11d
00d3e 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00d43 4489542404                     mov        dword ptr [rsp + 4], r10d
00d48 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00d4d 44895c2408                     mov        dword ptr [rsp + 8], r11d
00d52 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00d57 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d5c 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00d61 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00d66 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00d6b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00d70 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00d75 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00d7a 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00d7f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00d84 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00d89 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00d8e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00d93 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00d98 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00d9d 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00da2 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00da7 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00dac 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00db1 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00db6 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00dbb 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00dc0 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00dc5 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00dca 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00dcf 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00dd4 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00ddc 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00de1 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00de9 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00dee 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00df6 90                             nop        
00df7 e86462b6ff                     call       0x7f22139c3660
00dfc 0f1f8400f40e0009               nop        dword ptr [rax + rax + 0x9000ef4]
00e04 be45ffffff                     mov        esi, 0xffffff45
00e09 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e11 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00e16 44891c24                       mov        dword ptr [rsp], r11d
00e1a 4489442408                     mov        dword ptr [rsp + 8], r8d
00e1f e83c62b6ff                     call       0x7f22139c3660
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
00eb3 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00eb8 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00ebd 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00ec2 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00ec7 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00ecc 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00ed1 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00ed6 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00edb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00ee0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00ee5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00eed 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00ef2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00efa 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00eff e85c61b6ff                     call       0x7f22139c3660
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
00f4d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00f52 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00f57 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00f5c 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00f61 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00f66 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00f6b 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00f70 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00f75 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00f7a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00f7f 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00f84 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00f89 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00f8e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00f93 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
00f98 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00f9d 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00fa2 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00fa7 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00fac 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00fb1 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00fb6 4489442450                     mov        dword ptr [rsp + 0x50], r8d
00fbb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00fc0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00fc5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00fcd 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00fd2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00fda 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00fdf 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
00fe7 4489442478                     mov        dword ptr [rsp + 0x78], r8d
00fec 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00ff4 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00ffc 666690                         nop        
00fff e85c60b6ff                     call       0x7f22139c3660
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
01093 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
01098 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0109d 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
010a2 4489442448                     mov        dword ptr [rsp + 0x48], r8d
010a7 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
010ac 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
010b1 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
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
010f4 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
010fb 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
01103 e8585fb6ff                     call       0x7f22139c3660
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
01144 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01149 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0114e 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01153 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01158 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
0115d 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01162 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01167 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
0116c 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01171 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01176 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0117b 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01180 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01185 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0118a 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
0118f 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01194 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01199 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0119e 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
011a3 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
011a8 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
011ad 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
011b2 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
011b7 4c89442458                     mov        qword ptr [rsp + 0x58], r8
011bc 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
011c4 4c89442460                     mov        qword ptr [rsp + 0x60], r8
011c9 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
011d1 4c89442468                     mov        qword ptr [rsp + 0x68], r8
011d6 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
011db 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
011e2 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
011ea 48898c2488000000               mov        qword ptr [rsp + 0x88], rcx
011f2 90                             nop        
011f3 e8685eb6ff                     call       0x7f22139c3660
011f8 0f1f8400f012000e               nop        dword ptr [rax + rax + 0xe0012f0]
01200 41b9ffffff7f                   mov        r9d, 0x7fffffff
01206 4d3bc1                         cmp        r8, r9
01209 bdffffffff                     mov        ebp, 0xffffffff
0120e 7c08                           jl         0x7f2213e5d818
01210 400f95c5                       setne      bpl
01214 400fb6ed                       movzx      ebp, bpl
01218 be45ffffff                     mov        esi, 0xffffff45
0121d 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
01225 4c890c24                       mov        qword ptr [rsp], r9
01229 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
0122d 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01231 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
01239 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
0123e 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01243 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
01248 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
0124c 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
01250 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01255 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0125a 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
0125e 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01262 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01267 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0126c 8b5c2468                       mov        ebx, dword ptr [rsp + 0x68]
01270 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01274 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01279 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
0127e 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
01285 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01289 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0128e 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01293 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
01297 895c2454                       mov        dword ptr [rsp + 0x54], ebx
0129b 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
012a0 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
012a5 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
012aa 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
012af 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
012b7 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
012bc 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
012c4 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
012c9 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
012d1 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
012d8 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
012e0 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
012e8 666690                         nop        
012eb e8705db6ff                     call       0x7f22139c3660
012f0 0f1f8400e813000f               nop        dword ptr [rax + rax + 0xf0013e8]
012f8 be45ffffff                     mov        esi, 0xffffff45
012fd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01305 448b442408                     mov        r8d, dword ptr [rsp + 8]
0130a 44890424                       mov        dword ptr [rsp], r8d
0130e 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01313 4489442404                     mov        dword ptr [rsp + 4], r8d
01318 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
0131d 44894c2408                     mov        dword ptr [rsp + 8], r9d
01322 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01327 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0132c 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01331 448944240c                     mov        dword ptr [rsp + 0xc], r8d
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
01372 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
01377 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0137c 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01381 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01386 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
0138b 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01390 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01395 4489442450                     mov        dword ptr [rsp + 0x50], r8d
0139a 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
0139f 4c89442458                     mov        qword ptr [rsp + 0x58], r8
013a4 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
013ac 4c89442460                     mov        qword ptr [rsp + 0x60], r8
013b1 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
013b6 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
013be 90                             nop        
013bf e89c5cb6ff                     call       0x7f22139c3660
013c4 0f1f8400bc140010               nop        dword ptr [rax + rax + 0x100014bc]
013cc be45ffffff                     mov        esi, 0xffffff45
013d1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013d9 448b442408                     mov        r8d, dword ptr [rsp + 8]
013de 44890424                       mov        dword ptr [rsp], r8d
013e2 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
013e7 4489442404                     mov        dword ptr [rsp + 4], r8d
013ec 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
013f1 4489542408                     mov        dword ptr [rsp + 8], r10d
013f6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
013fb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01400 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01405 448944240c                     mov        dword ptr [rsp + 0xc], r8d
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
01446 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0144b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01450 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01455 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0145a 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0145f 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01464 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01469 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0146e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01473 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01478 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01480 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01485 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0148a 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
01491 6690                           nop        
01493 e8c85bb6ff                     call       0x7f22139c3660
01498 0f1f840090150011               nop        dword ptr [rax + rax + 0x11001590]
014a0 be3dffffff                     mov        esi, 0xffffff3d
014a5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014ad 8b5c2408                       mov        ebx, dword ptr [rsp + 8]
014b1 891c24                         mov        dword ptr [rsp], ebx
014b4 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
014b9 4489442404                     mov        dword ptr [rsp + 4], r8d
014be 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
014c3 4489442408                     mov        dword ptr [rsp + 8], r8d
014c8 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
014cd 4c89442418                     mov        qword ptr [rsp + 0x18], r8
014d2 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
014d7 448944240c                     mov        dword ptr [rsp + 0xc], r8d
014dc 8b5c2428                       mov        ebx, dword ptr [rsp + 0x28]
014e0 895c2420                       mov        dword ptr [rsp + 0x20], ebx
014e4 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
014e9 4489442424                     mov        dword ptr [rsp + 0x24], r8d
014ee 8b5c2434                       mov        ebx, dword ptr [rsp + 0x34]
014f2 895c2428                       mov        dword ptr [rsp + 0x28], ebx
014f6 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
014fb 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01500 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
01504 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01508 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
0150d 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01512 8b5c2474                       mov        ebx, dword ptr [rsp + 0x74]
01516 895c2438                       mov        dword ptr [rsp + 0x38], ebx
0151a 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
01522 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01527 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
0152b 895c2448                       mov        dword ptr [rsp + 0x48], ebx
0152f 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01534 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01539 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
0153d 895c2450                       mov        dword ptr [rsp + 0x50], ebx
01541 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
01546 4c89442458                     mov        qword ptr [rsp + 0x58], r8
0154b 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
01553 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01558 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
01560 4c89442468                     mov        qword ptr [rsp + 0x68], r8
01565 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0156a 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01572 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
01579 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
01581 6690                           nop        
01583 e8d85ab6ff                     call       0x7f22139c3660
01588 0f1f840080160012               nop        dword ptr [rax + rax + 0x12001680]
01590 be45ffffff                     mov        esi, 0xffffff45
01595 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0159d 448b542408                     mov        r10d, dword ptr [rsp + 8]
015a2 44891424                       mov        dword ptr [rsp], r10d
015a6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
015ab 4489542404                     mov        dword ptr [rsp + 4], r10d
015b0 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
015b5 4489442408                     mov        dword ptr [rsp + 8], r8d
015ba 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015bf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015c4 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
015c9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
015ce 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
015d3 4489442420                     mov        dword ptr [rsp + 0x20], r8d
015d8 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
015dd 4489542424                     mov        dword ptr [rsp + 0x24], r10d
015e2 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
015e7 4489442428                     mov        dword ptr [rsp + 0x28], r8d
015ec 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
015f1 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
015f6 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
015fb 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01600 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01605 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0160a 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0160f 894c2460                       mov        dword ptr [rsp + 0x60], ecx
01613 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01618 666690                         nop        
0161b e8405ab6ff                     call       0x7f22139c3660
01620 0f1f840018170013               nop        dword ptr [rax + rax + 0x13001718]
01628 be45ffffff                     mov        esi, 0xffffff45
0162d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01635 448b442408                     mov        r8d, dword ptr [rsp + 8]
0163a 44890424                       mov        dword ptr [rsp], r8d
0163e 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
01643 44894c2404                     mov        dword ptr [rsp + 4], r9d
01648 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
0164d 44894c2408                     mov        dword ptr [rsp + 8], r9d
01652 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01657 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0165c 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01661 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01666 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0166b 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01670 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01675 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0167a 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0167f 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01684 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01689 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0168e 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01692 4489542454                     mov        dword ptr [rsp + 0x54], r10d
01697 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
0169c 666690                         nop        
0169f e8bc59b6ff                     call       0x7f22139c3660
016a4 0f1f84009c170014               nop        dword ptr [rax + rax + 0x1400179c]
016ac be45ffffff                     mov        esi, 0xffffff45
016b1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
016b9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
016be 44891c24                       mov        dword ptr [rsp], r11d
016c2 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
016c7 4489542404                     mov        dword ptr [rsp + 4], r10d
016cc 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
016d1 4489542408                     mov        dword ptr [rsp + 8], r10d
016d6 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
016de 4c89542410                     mov        qword ptr [rsp + 0x10], r10
016e3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016e8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016ed 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
016f2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
016f7 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016fc 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01701 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01706 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0170b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01710 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01715 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0171a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0171f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01724 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01729 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0172e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01733 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01738 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0173d 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01742 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01747 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0174c 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01751 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01756 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0175b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01760 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01765 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0176d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01772 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0177a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0177f 4c898c2490000000               mov        qword ptr [rsp + 0x90], r9
01787 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
0178f e8cc58b6ff                     call       0x7f22139c3660
01794 0f1f84008c180015               nop        dword ptr [rax + rax + 0x1500188c]
0179c be45ffffff                     mov        esi, 0xffffff45
017a1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
017a9 448b542408                     mov        r10d, dword ptr [rsp + 8]
017ae 44891424                       mov        dword ptr [rsp], r10d
017b2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
017b7 44895c2404                     mov        dword ptr [rsp + 4], r11d
017bc 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
017c1 4489542408                     mov        dword ptr [rsp + 8], r10d
017c6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017cb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017d0 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
017d5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
017da 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
017df 4489542420                     mov        dword ptr [rsp + 0x20], r10d
017e4 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
017e9 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
017ee 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
017f3 4489542428                     mov        dword ptr [rsp + 0x28], r10d
017f8 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
017fd 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01802 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01807 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0180c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01811 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01816 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0181b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01820 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01825 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0182a 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0182f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01834 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01839 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0183e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01843 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01848 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01850 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01855 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0185d 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01862 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
0186a 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
01872 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
01879 6690                           nop        
0187b e8e057b6ff                     call       0x7f22139c3660
01880 0f1f840078190016               nop        dword ptr [rax + rax + 0x16001978]
01888 4585db                         test       r11d, r11d
0188b 7f07                           jg         0x7f2213e5de94
0188d 33c0                           xor        eax, eax
0188f e933e8ffff                     jmp        0x7f2213e5c6c7
01894 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01898 89742428                       mov        dword ptr [rsp + 0x28], esi
0189c 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
018a0 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
018a5 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
018aa 897c2410                       mov        dword ptr [rsp + 0x10], edi
018ae 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
018b3 48894424f8                     mov        qword ptr [rsp - 8], rax
018b8 8b0424                         mov        eax, dword ptr [rsp]
018bb 89442404                       mov        dword ptr [rsp + 4], eax
018bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018c4 48894424f8                     mov        qword ptr [rsp - 8], rax
018c9 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
018d0 890424                         mov        dword ptr [rsp], eax
018d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018d8 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
018e0 488bf5                         mov        rsi, rbp
018e3 8bd1                           mov        edx, ecx
018e5 418bcb                         mov        ecx, r11d
018e8 666690                         nop        
018eb e870d9a9ff                     call       0x7f22138fb860
018f0 0f1f8400e8190017               nop        dword ptr [rax + rax + 0x170019e8]
018f8 41ba40000000                   mov        r10d, 0x40
018fe 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
01903 c4e2a9f7c0                     shlx       rax, rax, r10
01908 48894424f8                     mov        qword ptr [rsp - 8], rax
0190d 8b442404                       mov        eax, dword ptr [rsp + 4]
01911 890424                         mov        dword ptr [rsp], eax
01914 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01919 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0191e 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
01922 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
01927 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
0192c 8b5c241c                       mov        ebx, dword ptr [rsp + 0x1c]
01930 8b742428                       mov        esi, dword ptr [rsp + 0x28]
01934 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01938 e98ae7ffff                     jmp        0x7f2213e5c6c7
0193d 4585db                         test       r11d, r11d
01940 7f08                           jg         0x7f2213e5df4a
01942 4533f6                         xor        r14d, r14d
01945 e9bee7ffff                     jmp        0x7f2213e5c708
0194a 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0194f 4889442430                     mov        qword ptr [rsp + 0x30], rax
01954 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01958 89742428                       mov        dword ptr [rsp + 0x28], esi
0195c 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01960 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
01965 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
0196a 897c2410                       mov        dword ptr [rsp + 0x10], edi
0196e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01973 48894424f8                     mov        qword ptr [rsp - 8], rax
01978 8b0424                         mov        eax, dword ptr [rsp]
0197b 89442404                       mov        dword ptr [rsp + 4], eax
0197f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01984 48894424f8                     mov        qword ptr [rsp - 8], rax
01989 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01990 890424                         mov        dword ptr [rsp], eax
01993 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01998 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
019a0 488bf5                         mov        rsi, rbp
019a3 8b542408                       mov        edx, dword ptr [rsp + 8]
019a7 418bcb                         mov        ecx, r11d
019aa 90                             nop        
019ab e8b0d8a9ff                     call       0x7f22138fb860
019b0 0f1f8400a81a0018               nop        dword ptr [rax + rax + 0x18001aa8]
019b8 41ba80000000                   mov        r10d, 0x80
019be 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
019c3 c462a9f7f0                     shlx       r14, rax, r10
019c8 48894424f8                     mov        qword ptr [rsp - 8], rax
019cd 8b442404                       mov        eax, dword ptr [rsp + 4]
019d1 890424                         mov        dword ptr [rsp], eax
019d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019d9 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
019dd 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
019e2 8b5c241c                       mov        ebx, dword ptr [rsp + 0x1c]
019e6 8b742428                       mov        esi, dword ptr [rsp + 0x28]
019ea 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
019ee 488b442430                     mov        rax, qword ptr [rsp + 0x30]
019f3 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
019f8 e90be7ffff                     jmp        0x7f2213e5c708
019fd 4533c0                         xor        r8d, r8d
01a00 e9e6efffff                     jmp        0x7f2213e5cfeb
01a05 bee4ffffff                     mov        esi, 0xffffffe4
01a0a 48ffb42490000000               push       qword ptr [rsp + 0x90]
01a12 488f0424                       pop        qword ptr [rsp]
01a16 90                             nop        
01a17 e84456b6ff                     call       0x7f22139c3660
01a1c 0f1f8400141b0019               nop        dword ptr [rax + rax + 0x19001b14]
01a24 be5d000000                     mov        esi, 0x5d
01a29 6690                           nop        
01a2b e83056b6ff                     call       0x7f22139c3660
01a30 0f1f8400281b001a               nop        dword ptr [rax + rax + 0x1a001b28]
01a38 bef6ffffff                     mov        esi, 0xfffffff6
01a3d 6690                           nop        
01a3f e81c56b6ff                     call       0x7f22139c3660
01a44 0f1f84003c1b001b               nop        dword ptr [rax + rax + 0x1b001b3c]
01a4c bef6ffffff                     mov        esi, 0xfffffff6
01a51 6690                           nop        
01a53 e80856b6ff                     call       0x7f22139c3660
01a58 0f1f8400501b001c               nop        dword ptr [rax + rax + 0x1c001b50]
01a60 be6effffff                     mov        esi, 0xffffff6e
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
01ac3 e89855b6ff                     call       0x7f22139c3660
01ac8 0f1f8400c01b001d               nop        dword ptr [rax + rax + 0x1d001bc0]
01ad0 bee4ffffff                     mov        esi, 0xffffffe4
01ad5 48ffb42490000000               push       qword ptr [rsp + 0x90]
01add 488f0424                       pop        qword ptr [rsp]
01ae1 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
01ae6 48894424f8                     mov        qword ptr [rsp - 8], rax
01aeb 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01af2 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01af6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01afb 895c2428                       mov        dword ptr [rsp + 0x28], ebx
01aff 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01b03 e85855b6ff                     call       0x7f22139c3660
01b08 0f1f8400001c001e               nop        dword ptr [rax + rax + 0x1e001c00]
01b10 bee4ffffff                     mov        esi, 0xffffffe4
01b15 48ffb42490000000               push       qword ptr [rsp + 0x90]
01b1d 488f0424                       pop        qword ptr [rsp]
01b21 48894424f8                     mov        qword ptr [rsp - 8], rax
01b26 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b2d 89442418                       mov        dword ptr [rsp + 0x18], eax
01b31 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b36 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01b3a 89542428                       mov        dword ptr [rsp + 0x28], edx
01b3e 4889442430                     mov        qword ptr [rsp + 0x30], rax
01b43 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01b48 666690                         nop        
01b4b e81055b6ff                     call       0x7f22139c3660
01b50 0f1f8400481c001f               nop        dword ptr [rax + rax + 0x1f001c48]
01b58 bebeffffff                     mov        esi, 0xffffffbe
01b5d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b65 448b542408                     mov        r10d, dword ptr [rsp + 8]
01b6a 44891424                       mov        dword ptr [rsp], r10d
01b6e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b73 4489542408                     mov        dword ptr [rsp + 8], r10d
01b78 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b7d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b82 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01b87 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01b8c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b91 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01b96 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01b9b 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01ba0 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01ba5 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01baa 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01baf 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01bb4 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01bb9 6690                           nop        
01bbb e8a054b6ff                     call       0x7f22139c3660
01bc0 0f1f8400b81c0020               nop        dword ptr [rax + rax + 0x20001cb8]
01bc8 beccffffff                     mov        esi, 0xffffffcc
01bcd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01bd5 890c24                         mov        dword ptr [rsp], ecx
01bd8 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01bdd 48894424f8                     mov        qword ptr [rsp - 8], rax
01be2 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01be9 89442414                       mov        dword ptr [rsp + 0x14], eax
01bed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bf2 895c2418                       mov        dword ptr [rsp + 0x18], ebx
01bf6 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01bfa 897c242c                       mov        dword ptr [rsp + 0x2c], edi
01bfe 90                             nop        
01bff e85c54b6ff                     call       0x7f22139c3660
01c04 0f1f8400fc1c0021               nop        dword ptr [rax + rax + 0x21001cfc]
01c0c beccffffff                     mov        esi, 0xffffffcc
01c11 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c19 448b442408                     mov        r8d, dword ptr [rsp + 8]
01c1e 44890424                       mov        dword ptr [rsp], r8d
01c22 48894424f8                     mov        qword ptr [rsp - 8], rax
01c27 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c2e 89442410                       mov        dword ptr [rsp + 0x10], eax
01c32 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c37 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01c3b 89542418                       mov        dword ptr [rsp + 0x18], edx
01c3f 4889442428                     mov        qword ptr [rsp + 0x28], rax
01c44 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01c49 897c2434                       mov        dword ptr [rsp + 0x34], edi
01c4d 6690                           nop        
01c4f e80c54b6ff                     call       0x7f22139c3660
01c54 0f1f84004c1d0022               nop        dword ptr [rax + rax + 0x22001d4c]
01c5c be45ffffff                     mov        esi, 0xffffff45
01c61 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01c66 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01c6b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01c70 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01c75 6690                           nop        
01c77 e8e453b6ff                     call       0x7f22139c3660
01c7c 0f1f8400741d0023               nop        dword ptr [rax + rax + 0x23001d74]
01c84 be45ffffff                     mov        esi, 0xffffff45
01c89 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01c8e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01c93 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01c98 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01c9d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01ca2 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01ca7 e8b453b6ff                     call       0x7f22139c3660
01cac 0f1f8400a41d0024               nop        dword ptr [rax + rax + 0x24001da4]
01cb4 bef6ffffff                     mov        esi, 0xfffffff6
01cb9 6690                           nop        
01cbb e8a053b6ff                     call       0x7f22139c3660
01cc0 0f1f8400b81d0025               nop        dword ptr [rax + rax + 0x25001db8]
01cc8 be5d000000                     mov        esi, 0x5d
01ccd 6690                           nop        
01ccf e88c53b6ff                     call       0x7f22139c3660
01cd4 0f1f8400cc1d0026               nop        dword ptr [rax + rax + 0x26001dcc]
01cdc be45ffffff                     mov        esi, 0xffffff45
01ce1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ce9 448b542408                     mov        r10d, dword ptr [rsp + 8]
01cee 44891424                       mov        dword ptr [rsp], r10d
01cf2 90                             nop        
01cf3 e86853b6ff                     call       0x7f22139c3660
01cf8 0f1f8400f01d0027               nop        dword ptr [rax + rax + 0x27001df0]
01d00 bef6ffffff                     mov        esi, 0xfffffff6
01d05 418be8                         mov        ebp, r8d
01d08 666690                         nop        
01d0b e85053b6ff                     call       0x7f22139c3660
01d10 0f1f8400081e0028               nop        dword ptr [rax + rax + 0x28001e08]
01d18 bef6ffffff                     mov        esi, 0xfffffff6
01d1d 8be9                           mov        ebp, ecx
01d1f e83c53b6ff                     call       0x7f22139c3660
01d24 0f1f84001c1e0029               nop        dword ptr [rax + rax + 0x29001e1c]
01d2c bef6ffffff                     mov        esi, 0xfffffff6
01d31 418be8                         mov        ebp, r8d
01d34 666690                         nop        
01d37 e82453b6ff                     call       0x7f22139c3660
01d3c 0f1f8400341e002a               nop        dword ptr [rax + rax + 0x2a001e34]
01d44 bef6ffffff                     mov        esi, 0xfffffff6
01d49 6690                           nop        
01d4b e81053b6ff                     call       0x7f22139c3660
01d50 0f1f8400481e002b               nop        dword ptr [rax + rax + 0x2b001e48]
01d58 bef6ffffff                     mov        esi, 0xfffffff6
01d5d 6690                           nop        
01d5f e8fc52b6ff                     call       0x7f22139c3660
01d64 0f1f84005c1e002c               nop        dword ptr [rax + rax + 0x2c001e5c]
01d6c bef6ffffff                     mov        esi, 0xfffffff6
01d71 6690                           nop        
01d73 e8e852b6ff                     call       0x7f22139c3660
01d78 0f1f8400701e002d               nop        dword ptr [rax + rax + 0x2d001e70]
01d80 bef6ffffff                     mov        esi, 0xfffffff6
01d85 6690                           nop        
01d87 e8d452b6ff                     call       0x7f22139c3660
01d8c 0f1f8400841e002e               nop        dword ptr [rax + rax + 0x2e001e84]
01d94 bef6ffffff                     mov        esi, 0xfffffff6
01d99 6690                           nop        
01d9b e8c052b6ff                     call       0x7f22139c3660
01da0 0f1f8400981e002f               nop        dword ptr [rax + rax + 0x2f001e98]
01da8 bef6ffffff                     mov        esi, 0xfffffff6
01dad 6690                           nop        
01daf e8ac52b6ff                     call       0x7f22139c3660
01db4 0f1f8400ac1e0030               nop        dword ptr [rax + rax + 0x30001eac]
01dbc bef6ffffff                     mov        esi, 0xfffffff6
01dc1 6690                           nop        
01dc3 e89852b6ff                     call       0x7f22139c3660
01dc8 0f1f8400c01e0031               nop        dword ptr [rax + rax + 0x31001ec0]
01dd0 eb08                           jmp        0x7f2213e5e3da
01dd2 eb06                           jmp        0x7f2213e5e3da
01dd4 eb04                           jmp        0x7f2213e5e3da
01dd6 eb02                           jmp        0x7f2213e5e3da
01dd8 eb00                           jmp        0x7f2213e5e3da
01dda 488bf0                         mov        rsi, rax
01ddd e96eecffff                     jmp        0x7f2213e5d050
01de2 49ba21d0e513227f0000           movabs     r10, 0x7f2213e5d021
01dec 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01df3 e9e8faa9ff                     jmp        0x7f22138fdee0
01df8 e8a3c6a8ff                     call       0x7f22138eaaa0
01dfd e91ce2ffff                     jmp        0x7f2213e5c61e
01e02 f4                             hlt        
01e03 f4                             hlt        
01e04 f4                             hlt        
01e05 f4                             hlt        
01e06 f4                             hlt        
01e07 f4                             hlt        
