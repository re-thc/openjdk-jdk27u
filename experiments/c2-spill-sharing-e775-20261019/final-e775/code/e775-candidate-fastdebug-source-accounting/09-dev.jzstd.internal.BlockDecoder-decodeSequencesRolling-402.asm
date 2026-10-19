00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f8522200000                   jne        0x7ff77bbdde40
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
00050 0f83fb190000                   jae        0x7ff77bbdd851
00056 0fb65c1607                     movzx      ebx, byte ptr [rsi + rdx + 7]
0005b 85db                           test       ebx, ebx
0005d 0f84211a0000                   je         0x7ff77bbdd884
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
00099 0f8c3d180000                   jl         0x7ff77bbdd6dc
0009f 85c9                           test       ecx, ecx
000a1 0f8c0d1c0000                   jl         0x7ff77bbddab4
000a7 8b2c24                         mov        ebp, dword ptr [rsp]
000aa 83c5f9                         add        ebp, -7
000ad 3bc5                           cmp        eax, ebp
000af 0f83cb1a0000                   jae        0x7ff77bbdd980
000b5 448bd0                         mov        r10d, eax
000b8 4e8b6c1608                     mov        r13, qword ptr [rsi + r10 + 8]
000bd 4183c0f8                       add        r8d, -8
000c1 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000c9 4183c2f0                       add        r10d, -0x10
000cd 4183f808                       cmp        r8d, 8
000d1 0f8cb2180000                   jl         0x7ff77bbdd789
000d7 85c9                           test       ecx, ecx
000d9 0f8c311c0000                   jl         0x7ff77bbddb10
000df 8b2c24                         mov        ebp, dword ptr [rsp]
000e2 83c5f9                         add        ebp, -7
000e5 443bd5                         cmp        r10d, ebp
000e8 0f83e61a0000                   jae        0x7ff77bbdd9d4
000ee 458bc2                         mov        r8d, r10d
000f1 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
000f9 4b8b740308                     mov        rsi, qword ptr [r11 + r8 + 8]
000fe 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
00103 448b5d18                       mov        r11d, dword ptr [rbp + 0x18]
00107 4585db                         test       r11d, r11d
0010a 0f849c190000                   je         0x7ff77bbdd8ac
00110 448b4d1c                       mov        r9d, dword ptr [rbp + 0x1c]
00114 458b4104                       mov        r8d, dword ptr [r9 + 4]
00118 8b5d20                         mov        ebx, dword ptr [rbp + 0x20]
0011b 85db                           test       ebx, ebx
0011d 0f84b1190000                   je         0x7ff77bbdd8d4
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
00178 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0017d 4d8bd3                         mov        r10, r11
00180 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00185 4d8bd1                         mov        r10, r9
00188 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0018d 4585c0                         test       r8d, r8d
00190 0f84c4080000                   je         0x7ff77bbdc85a
00196 be40000000                     mov        esi, 0x40
0019b 2bf7                           sub        esi, edi
0019d 443bc6                         cmp        r8d, esi
001a0 0f8ffe010000                   jg         0x7ff77bbdc1a4
001a6 412bf0                         sub        esi, r8d
001a9 c4c2cbf7ed                     shrx       rbp, r13, rsi
001ae 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b3 4183f840                       cmp        r8d, 0x40
001b7 0f8d871c0000                   jge        0x7ff77bbddc44
001bd 41bb01000000                   mov        r11d, 1
001c3 c442b9f7d3                     shlx       r10, r11, r8
001c8 49ffca                         dec        r10
001cb 4c23d5                         and        r10, rbp
001ce 4c89542460                     mov        qword ptr [rsp + 0x60], r10
001d3 458bd0                         mov        r10d, r8d
001d6 458bca                         mov        r9d, r10d
001d9 442b4c240c                     sub        r9d, dword ptr [rsp + 0xc]
001de 458d5908                       lea        r11d, [r9 + 8]
001e2 4183fb40                       cmp        r11d, 0x40
001e6 7c33                           jl         0x7ff77bbdc01b
001e8 4489542428                     mov        dword ptr [rsp + 0x28], r10d
001ed 4183c1c8                       add        r9d, -0x38
001f1 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001f6 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
001fe 8b542408                       mov        edx, dword ptr [rsp + 8]
00202 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00206 90                             nop        
00207 e8543cb5ff                     call       0x7ff77b72fc60
0020c 0f1f840004030000               nop        dword ptr [rax + rax + 0x304]
00214 4889442420                     mov        qword ptr [rsp + 0x20], rax
00219 eb31                           jmp        0x7ff77bbdc04c
0021b 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00220 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00228 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
0022d 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
00232 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
0023a 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
00242 4489442410                     mov        dword ptr [rsp + 0x10], r8d
00247 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0024c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00251 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00255 83fd20                         cmp        ebp, 0x20
00258 0f8d161b0000                   jge        0x7ff77bbddb74
0025e c462d3f7542460                 shrx       r10, qword ptr [rsp + 0x60], rbp
00265 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0026a 41bb01000000                   mov        r11d, 1
00270 c44251f7db                     shlx       r11d, r11d, ebp
00275 41ffcb                         dec        r11d
00278 4d63d3                         movsxd     r10, r11d
0027b 4c23542460                     and        r10, qword ptr [rsp + 0x60]
00280 458bda                         mov        r11d, r10d
00283 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00288 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0028d 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00291 83fd20                         cmp        ebp, 0x20
00294 0f8d161b0000                   jge        0x7ff77bbddbb0
0029a 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
002a2 458b5204                       mov        r10d, dword ptr [r10 + 4]
002a6 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
002ae 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
002b3 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
002b7 458b4304                       mov        r8d, dword ptr [r11 + 4]
002bb 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
002c0 458b5314                       mov        r10d, dword ptr [r11 + 0x14]
002c4 458b5204                       mov        r10d, dword ptr [r10 + 4]
002c8 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
002cd 458b5914                       mov        r11d, dword ptr [r9 + 0x14]
002d1 458b5b04                       mov        r11d, dword ptr [r11 + 4]
002d5 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
002d9 85c9                           test       ecx, ecx
002db 0f8e68170000                   jle        0x7ff77bbdd849
002e1 41ffc8                         dec        r8d
002e4 4489442460                     mov        dword ptr [rsp + 0x60], r8d
002e9 41ffca                         dec        r10d
002ec 4489542464                     mov        dword ptr [rsp + 0x64], r10d
002f1 41ffcb                         dec        r11d
002f4 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
002f9 c462d3f7542468                 shrx       r10, qword ptr [rsp + 0x68], rbp
00300 41bb01000000                   mov        r11d, 1
00306 c44251f7db                     shlx       r11d, r11d, ebp
0030b 458bc2                         mov        r8d, r10d
0030e 4489442474                     mov        dword ptr [rsp + 0x74], r8d
00313 41ffcb                         dec        r11d
00316 4d63d3                         movsxd     r10, r11d
00319 4c23542468                     and        r10, qword ptr [rsp + 0x68]
0031e 458bd2                         mov        r10d, r10d
00321 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00326 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0032e 458b9af4000000                 mov        r11d, dword ptr [r10 + 0xf4]
00335 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
0033d 458b92f0000000                 mov        r10d, dword ptr [r10 + 0xf0]
00344 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
0034c 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00350 4585db                         test       r11d, r11d
00353 0f86a3170000                   jbe        0x7ff77bbdd8fc
00359 4d63d3                         movsxd     r10, r11d
0035c 4c63d9                         movsxd     r11, ecx
0035f 49ffcb                         dec        r11
00362 4d3bda                         cmp        r11, r10
00365 0f8391170000                   jae        0x7ff77bbdd8fc
0036b 448b542404                     mov        r10d, dword ptr [rsp + 4]
00370 4585d2                         test       r10d, r10d
00373 0f8cb7180000                   jl         0x7ff77bbdda30
00379 448b1c24                       mov        r11d, dword ptr [rsp]
0037d 4183c3f9                       add        r11d, -7
00381 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
00389 4533d2                         xor        r10d, r10d
0038c 4533db                         xor        r11d, r11d
0038f 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
00397 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
0039f e984020000                     jmp        0x7ff77bbdc428
003a4 418be8                         mov        ebp, r8d
003a7 2bee                           sub        ebp, esi
003a9 90                             nop        
003aa 90                             nop        
003ab e8b03ab5ff                     call       0x7ff77b72fc60
003b0 0f1f8400a8040001               nop        dword ptr [rax + rax + 0x10004a8]
003b8 4823442428                     and        rax, qword ptr [rsp + 0x28]
003bd 41ba40000000                   mov        r10d, 0x40
003c3 442bd5                         sub        r10d, ebp
003c6 c462d1f7d8                     shlx       r11, rax, rbp
003cb c462abf7942498000000           shrx       r10, qword ptr [rsp + 0x98], r10
003d5 4d0bda                         or         r11, r10
003d8 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
003dd 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
003e2 e9effdffff                     jmp        0x7ff77bbdbfd6
003e7 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
003ef 4f8b540208                     mov        r10, qword ptr [r10 + r8 + 8]
003f4 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
003f9 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00401 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00406 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
0040a 896c2410                       mov        dword ptr [rsp + 0x10], ebp
0040e 90                             nop        
0040f 90                             nop        
00410 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00417 83fd40                         cmp        ebp, 0x40
0041a 0f8d780a0000                   jge        0x7ff77bbdcc98
00420 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0042a 41ba01000000                   mov        r10d, 1
00430 c442d1f7d2                     shlx       r10, r10, rbp
00435 49ffca                         dec        r10
00438 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00440 458bc2                         mov        r8d, r10d
00443 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0044a 83fd40                         cmp        ebp, 0x40
0044d 0f8d390b0000                   jge        0x7ff77bbdcd8c
00453 c4c2d3f7f9                     shrx       rdi, r9, rbp
00458 41ba01000000                   mov        r10d, 1
0045e c442d1f7d2                     shlx       r10, r10, rbp
00463 49ffca                         dec        r10
00466 4d23d1                         and        r10, r9
00469 418bda                         mov        ebx, r10d
0046c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00473 83fd40                         cmp        ebp, 0x40
00476 0f8d240c0000                   jge        0x7ff77bbdcea0
0047c c4e2d3f7cf                     shrx       rcx, rdi, rbp
00481 41ba01000000                   mov        r10d, 1
00487 c442d1f7d2                     shlx       r10, r10, rbp
0048c 49ffca                         dec        r10
0048f 4c23d7                         and        r10, rdi
00492 458bd2                         mov        r10d, r10d
00495 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
0049c 83fd40                         cmp        ebp, 0x40
0049f 0f8d130d0000                   jge        0x7ff77bbdcfb8
004a5 41bb01000000                   mov        r11d, 1
004ab c442d1f7cb                     shlx       r9, r11, rbp
004b0 49ffc9                         dec        r9
004b3 4c23c9                         and        r9, rcx
004b6 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
004be 418bcb                         mov        ecx, r11d
004c1 4103ca                         add        ecx, r10d
004c4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
004c9 458bd2                         mov        r10d, r10d
004cc 4403d3                         add        r10d, ebx
004cf 4863d9                         movsxd     rbx, ecx
004d2 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
004da 458bdb                         mov        r11d, r11d
004dd 4d03cb                         add        r9, r11
004e0 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
004e8 4c03db                         add        r11, rbx
004eb 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
004f3 4d85c9                         test       r9, r9
004f6 0f8e6c070000                   jle        0x7ff77bbdca68
004fc 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00503 0f8fb30d0000                   jg         0x7ff77bbdd0bc
00509 4181faffff0100                 cmp        r10d, 0x1ffff
00510 0f8fb20e0000                   jg         0x7ff77bbdd1c8
00516 81f9ffff0300                   cmp        ecx, 0x3ffff
0051c 0f8f8e0f0000                   jg         0x7ff77bbdd2b0
00522 458bd9                         mov        r11d, r9d
00525 4181fb00000010                 cmp        r11d, 0x10000000
0052c 0f8366100000                   jae        0x7ff77bbdd398
00532 4d63d2                         movsxd     r10, r10d
00535 4d63db                         movsxd     r11, r11d
00538 48c1e312                       shl        rbx, 0x12
0053c 49c1e324                       shl        r11, 0x24
00540 4c0bdb                         or         r11, rbx
00543 4d0bda                         or         r11, r10
00546 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
0054e 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
00556 4f895cca08                     mov        qword ptr [r10 + r9*8 + 8], r11
0055b 8b2c24                         mov        ebp, dword ptr [rsp]
0055e 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00562 0f8daf000000                   jge        0x7ff77bbdc417
00568 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00570 49c1ea30                       shr        r10, 0x30
00574 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00579 49c1eb30                       shr        r11, 0x30
0057d 418bca                         mov        ecx, r10d
00580 418bfb                         mov        edi, r11d
00583 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
0058b c44223f7c8                     shrx       r9d, r8d, r11d
00590 44039c24c8000000               add        r11d, dword ptr [rsp + 0xc8]
00598 c44223f7d0                     shrx       r10d, r8d, r11d
0059d 4103fa                         add        edi, r10d
005a0 897c2474                       mov        dword ptr [rsp + 0x74], edi
005a4 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
005ac 4183fb20                       cmp        r11d, 0x20
005b0 0f8de6100000                   jge        0x7ff77bbdd49c
005b6 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005be 49c1ea30                       shr        r10, 0x30
005c2 458bd2                         mov        r10d, r10d
005c5 41bb01000000                   mov        r11d, 1
005cb 8bbc24c8000000                 mov        edi, dword ptr [rsp + 0xc8]
005d2 c44241f7db                     shlx       r11d, r11d, edi
005d7 41ffcb                         dec        r11d
005da 4523d9                         and        r11d, r9d
005dd 4403d9                         add        r11d, ecx
005e0 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
005e5 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
005ed 4183fb20                       cmp        r11d, 0x20
005f1 0f8d51110000                   jge        0x7ff77bbdd548
005f7 41bb01000000                   mov        r11d, 1
005fd 8b8c24cc000000                 mov        ecx, dword ptr [rsp + 0xcc]
00604 c44271f7cb                     shlx       r9d, r11d, ecx
00609 41ffc9                         dec        r9d
0060c 4523c8                         and        r9d, r8d
0060f 4503ca                         add        r9d, r10d
00612 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00617 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0061b 0f8dc0030000                   jge        0x7ff77bbdc7e1
00621 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00628 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0062d 4423542474                     and        r10d, dword ptr [rsp + 0x74]
00632 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00637 418b4b14                       mov        ecx, dword ptr [r11 + 0x14]
0063b 448b5904                       mov        r11d, dword ptr [rcx + 4]
0063f 453bd3                         cmp        r10d, r11d
00642 0f8322040000                   jae        0x7ff77bbdc86a
00648 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0064d 4423442468                     and        r8d, dword ptr [rsp + 0x68]
00652 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00657 458b5914                       mov        r11d, dword ptr [r9 + 0x14]
0065b 458b4b04                       mov        r9d, dword ptr [r11 + 4]
0065f 4e8b54d108                     mov        r10, qword ptr [rcx + r10*8 + 8]
00664 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00669 453bc1                         cmp        r8d, r9d
0066c 0f8392040000                   jae        0x7ff77bbdc904
00672 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00677 4423542448                     and        r10d, dword ptr [rsp + 0x48]
0067c 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
00680 448b4914                       mov        r9d, dword ptr [rcx + 0x14]
00684 418b5904                       mov        ebx, dword ptr [r9 + 4]
00688 4f8b5cc308                     mov        r11, qword ptr [r11 + r8*8 + 8]
0068d 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
00695 443bd3                         cmp        r10d, ebx
00698 0f8316050000                   jae        0x7ff77bbdc9b4
0069e 4f8b54d108                     mov        r10, qword ptr [r9 + r10*8 + 8]
006a3 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006ab 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006b2 ffc5                           inc        ebp
006b4 892c24                         mov        dword ptr [rsp], ebp
006b7 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006bb 0f8df1020000                   jge        0x7ff77bbdc7b2
006c1 49c1ea28                       shr        r10, 0x28
006c5 458bd2                         mov        r10d, r10d
006c8 450fb6d2                       movzx      r10d, r10b
006cc 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
006d4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
006d9 49c1ea28                       shr        r10, 0x28
006dd 458bda                         mov        r11d, r10d
006e0 410fb6eb                       movzx      ebp, r11b
006e4 03ac24c8000000                 add        ebp, dword ptr [rsp + 0xc8]
006eb 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
006f3 49c1ea28                       shr        r10, 0x28
006f7 458bd2                         mov        r10d, r10d
006fa 450fb6d2                       movzx      r10d, r10b
006fe 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00706 4103ea                         add        ebp, r10d
00709 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
00710 41ba01000000                   mov        r10d, 1
00716 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
0071e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00726 49c1ea20                       shr        r10, 0x20
0072a 458bd2                         mov        r10d, r10d
0072d 410fb6ea                       movzx      ebp, r10b
00731 89ac24d4000000                 mov        dword ptr [rsp + 0xd4], ebp
00738 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0073d 49c1ea20                       shr        r10, 0x20
00741 458bda                         mov        r11d, r10d
00744 410fb6eb                       movzx      ebp, r11b
00748 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
0074f 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00757 49c1ea20                       shr        r10, 0x20
0075b 458bd2                         mov        r10d, r10d
0075e 410fb6ea                       movzx      ebp, r10b
00762 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
00769 448bc5                         mov        r8d, ebp
0076c 44038424d4000000               add        r8d, dword ptr [rsp + 0xd4]
00774 44038424d8000000               add        r8d, dword ptr [rsp + 0xd8]
0077c 44038424d0000000               add        r8d, dword ptr [rsp + 0xd0]
00784 4585c0                         test       r8d, r8d
00787 0f84e3050000                   je         0x7ff77bbdcb70
0078d 4183f83f                       cmp        r8d, 0x3f
00791 0f8fc5060000                   jg         0x7ff77bbdcc5c
00797 bb40000000                     mov        ebx, 0x40
0079c 2b5c243c                       sub        ebx, dword ptr [rsp + 0x3c]
007a0 443bc3                         cmp        r8d, ebx
007a3 7e47                           jle        0x7ff77bbdc5ec
007a5 458bc8                         mov        r9d, r8d
007a8 442bcb                         sub        r9d, ebx
007ab 83fb40                         cmp        ebx, 0x40
007ae 0f8d30100000                   jge        0x7ff77bbdd5e4
007b4 41ba01000000                   mov        r10d, 1
007ba c442e1f7d2                     shlx       r10, r10, rbx
007bf 49ffca                         dec        r10
007c2 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007ca c4c2b1f7ea                     shlx       rbp, r10, r9
007cf 41bb40000000                   mov        r11d, 0x40
007d5 452bd9                         sub        r11d, r9d
007d8 c462a3f7542420                 shrx       r10, qword ptr [rsp + 0x20], r11
007df 490bea                         or         rbp, r10
007e2 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
007ea eb26                           jmp        0x7ff77bbdc612
007ec 41ba01000000                   mov        r10d, 1
007f2 c442b9f7d2                     shlx       r10, r10, r8
007f7 412bd8                         sub        ebx, r8d
007fa c4e2e3f7ac2498000000           shrx       rbp, qword ptr [rsp + 0x98], rbx
00804 49ffca                         dec        r10
00807 4923ea                         and        rbp, r10
0080a 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
00812 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00817 4503d8                         add        r11d, r8d
0081a 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0081f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00824 4503d0                         add        r10d, r8d
00827 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0082c 4183fb40                       cmp        r11d, 0x40
00830 0f8cdafbffff                   jl         0x7ff77bbdc210
00836 458d53c0                       lea        r10d, [r11 - 0x40]
0083a 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0083f 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00843 83c5f8                         add        ebp, -8
00846 896c240c                       mov        dword ptr [rsp + 0xc], ebp
0084a 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0084e 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
00852 83c1f0                         add        ecx, -0x10
00855 83f908                         cmp        ecx, 8
00858 0f8c06010000                   jl         0x7ff77bbdc764
0085e 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00863 4183c0e8                       add        r8d, -0x18
00867 443b8424c4000000               cmp        r8d, dword ptr [rsp + 0xc4]
0086f 0f8272fbffff                   jb         0x7ff77bbdc1e7
00875 bee4ffffff                     mov        esi, 0xffffffe4
0087a 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00882 448b542408                     mov        r10d, dword ptr [rsp + 8]
00887 44891424                       mov        dword ptr [rsp], r10d
0088b 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00890 4489542404                     mov        dword ptr [rsp + 4], r10d
00895 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0089a 4489542408                     mov        dword ptr [rsp + 8], r10d
0089f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
008a4 4c89542410                     mov        qword ptr [rsp + 0x10], r10
008a9 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
008ae 448954240c                     mov        dword ptr [rsp + 0xc], r10d
008b3 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
008b8 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
008bd 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
008c2 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
008c7 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
008cc 4489542420                     mov        dword ptr [rsp + 0x20], r10d
008d1 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
008d6 4489542424                     mov        dword ptr [rsp + 0x24], r10d
008db 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
008e0 4489542428                     mov        dword ptr [rsp + 0x28], r10d
008e5 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
008ea 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
008ef 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
008f4 4489542430                     mov        dword ptr [rsp + 0x30], r10d
008f9 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
008fe 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00903 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00908 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0090d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00912 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00917 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0091c 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00921 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00929 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0092e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00936 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0093b 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00943 e81813afff                     call       0x7ff77b6cda60
00948 0f1f8400400a0002               nop        dword ptr [rax + rax + 0x2000a40]
00950 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
0095a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0095e e87d341818                     call       0x7ff793d5fbe0
00963 f4                             hlt        
00964 85c9                           test       ecx, ecx
00966 7f08                           jg         0x7ff77bbdc770
00968 4533d2                         xor        r10d, r10d
0096b e984faffff                     jmp        0x7ff77bbdc1f4
00970 8be9                           mov        ebp, ecx
00972 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
0097a 8b542408                       mov        edx, dword ptr [rsp + 8]
0097e 90                             nop        
0097f e8dc34b5ff                     call       0x7ff77b72fc60
00984 0f1f84007c0a0003               nop        dword ptr [rax + rax + 0x3000a7c]
0098c 448b542408                     mov        r10d, dword ptr [rsp + 8]
00991 41c1e203                       shl        r10d, 3
00995 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0099a 41c1e303                       shl        r11d, 3
0099e 452bd3                         sub        r10d, r11d
009a1 4181c2c0000000                 add        r10d, 0xc0
009a8 c462a9f7d0                     shlx       r10, rax, r10
009ad e942faffff                     jmp        0x7ff77bbdc1f4
009b2 4533db                         xor        r11d, r11d
009b5 33ed                           xor        ebp, ebp
009b7 4533d2                         xor        r10d, r10d
009ba 4533c9                         xor        r9d, r9d
009bd 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
009c5 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
009cc 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
009d4 44898c24f4000000               mov        dword ptr [rsp + 0xf4], r9d
009dc e93dfdffff                     jmp        0x7ff77bbdc51e
009e1 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009e9 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009f1 4d03c2                         add        r8, r10
009f4 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
009fc 4d3bc2                         cmp        r8, r10
009ff 7e30                           jle        0x7ff77bbdc831
00a01 48bed05829e300000000           movabs     rsi, 0xe32958d0
00a0b e85034b5ff                     call       0x7ff77b72fc60
00a10 0f1f8400080b0004               nop        dword ptr [rax + rax + 0x4000b08]
00a18 4885c0                         test       rax, rax
00a1b 0f84d3130000                   je         0x7ff77bbddbf4
00a21 488bf0                         mov        rsi, rax
00a24 4881c410010000                 add        rsp, 0x110
00a2b 5d                             pop        rbp
00a2c e9afb0aeff                     jmp        0x7ff77b6c78e0
00a31 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a36 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a3e 0f85d8130000                   jne        0x7ff77bbddc1c
00a44 418bc0                         mov        eax, r8d
00a47 4881c410010000                 add        rsp, 0x110
00a4e 5d                             pop        rbp
00a4f 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a53 0f87d1150000                   ja         0x7ff77bbdde2a
00a59 c3                             ret        
00a5a 4533d2                         xor        r10d, r10d
00a5d 4533db                         xor        r11d, r11d
00a60 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00a65 e96cf7ffff                     jmp        0x7ff77bbdbfd6
00a6a bee4ffffff                     mov        esi, 0xffffffe4
00a6f 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a77 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00a7c 44891c24                       mov        dword ptr [rsp], r11d
00a80 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00a85 4489442404                     mov        dword ptr [rsp + 4], r8d
00a8a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00a8f 44895c2408                     mov        dword ptr [rsp + 8], r11d
00a94 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00a99 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00a9e 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00aa3 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00aa8 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00aad 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00ab2 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00ab7 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00abc 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00ac1 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00ac6 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00acb 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00ad0 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00ad5 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00ada 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00ade 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
00ae3 e87811afff                     call       0x7ff77b6cda60
00ae8 0f1f8400e00b0005               nop        dword ptr [rax + rax + 0x5000be0]
00af0 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
00afa 4883e4f0                       and        rsp, 0xfffffffffffffff0
00afe e8dd321818                     call       0x7ff793d5fbe0
00b03 f4                             hlt        
00b04 bee4ffffff                     mov        esi, 0xffffffe4
00b09 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b11 448b542408                     mov        r10d, dword ptr [rsp + 8]
00b16 44891424                       mov        dword ptr [rsp], r10d
00b1a 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00b1f 44894c2404                     mov        dword ptr [rsp + 4], r9d
00b24 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00b29 4489542408                     mov        dword ptr [rsp + 8], r10d
00b2e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b33 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b38 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00b3d 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00b42 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00b47 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00b4c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00b51 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00b56 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00b5b 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00b60 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00b65 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00b6a 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00b6f 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00b74 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00b79 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00b7e 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b83 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00b88 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00b8d 4489442464                     mov        dword ptr [rsp + 0x64], r8d
00b92 90                             nop        
00b93 e8c810afff                     call       0x7ff77b6cda60
00b98 0f1f8400900c0006               nop        dword ptr [rax + rax + 0x6000c90]
00ba0 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
00baa 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bae e82d321818                     call       0x7ff793d5fbe0
00bb3 f4                             hlt        
00bb4 bee4ffffff                     mov        esi, 0xffffffe4
00bb9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00bc1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00bc6 44891c24                       mov        dword ptr [rsp], r11d
00bca 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00bcf 4489442404                     mov        dword ptr [rsp + 4], r8d
00bd4 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00bd9 44895c2408                     mov        dword ptr [rsp + 8], r11d
00bde 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00be3 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00be8 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00bed 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00bf2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00bf7 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00bfc 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00c01 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00c06 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00c0b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00c10 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
00c14 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00c19 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00c1e 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00c23 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00c28 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00c2d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00c32 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00c37 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00c3c 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00c41 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
00c46 90                             nop        
00c47 e81410afff                     call       0x7ff77b6cda60
00c4c 0f1f8400440d0007               nop        dword ptr [rax + rax + 0x7000d44]
00c54 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
00c5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c62 e879311818                     call       0x7ff793d5fbe0
00c67 f4                             hlt        
00c68 4533db                         xor        r11d, r11d
00c6b 4d3bcb                         cmp        r9, r11
00c6e bdffffffff                     mov        ebp, 0xffffffff
00c73 7c08                           jl         0x7ff77bbdca7d
00c75 400f95c5                       setne      bpl
00c79 400fb6ed                       movzx      ebp, bpl
00c7d be45ffffff                     mov        esi, 0xffffff45
00c82 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00c8a 4c891c24                       mov        qword ptr [rsp], r11
00c8e 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
00c92 895c240c                       mov        dword ptr [rsp + 0xc], ebx
00c96 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00c9e 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00ca3 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00ca8 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00cad 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
00cb1 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
00cb5 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00cba 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00cbf 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
00cc3 895c2434                       mov        dword ptr [rsp + 0x34], ebx
00cc7 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00ccc 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00cd1 8b5c2468                       mov        ebx, dword ptr [rsp + 0x68]
00cd5 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
00cd9 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00cde 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00ce3 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
00cea 895c2444                       mov        dword ptr [rsp + 0x44], ebx
00cee 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00cf3 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00cf8 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00cfc 895c2454                       mov        dword ptr [rsp + 0x54], ebx
00d00 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00d05 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00d0a 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00d0f 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00d14 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00d1c 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00d21 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00d29 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
00d2e 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00d36 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
00d3d 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d45 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00d4d 90                             nop        
00d4e 90                             nop        
00d4f e80c0fafff                     call       0x7ff77b6cda60
00d54 0f1f84004c0e0008               nop        dword ptr [rax + rax + 0x8000e4c]
00d5c 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
00d66 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d6a e871301818                     call       0x7ff793d5fbe0
00d6f f4                             hlt        
00d70 be45ffffff                     mov        esi, 0xffffff45
00d75 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00d7d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00d82 44891c24                       mov        dword ptr [rsp], r11d
00d86 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00d8b 4489542404                     mov        dword ptr [rsp + 4], r10d
00d90 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00d95 44895c2408                     mov        dword ptr [rsp + 8], r11d
00d9a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00d9f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00da4 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00da9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00dae 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00db3 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00db8 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00dbd 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00dc2 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00dc7 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00dcc 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
00dd0 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00dd5 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00dda 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00ddf 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00de4 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00de9 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00dee 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00df3 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00df8 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00dfd 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00e02 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00e07 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00e0c 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00e11 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00e16 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00e1e 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00e23 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00e2b 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00e30 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00e38 90                             nop        
00e39 90                             nop        
00e3a 90                             nop        
00e3b e8200eafff                     call       0x7ff77b6cda60
00e40 0f1f8400380f0009               nop        dword ptr [rax + rax + 0x9000f38]
00e48 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
00e52 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e56 e8852f1818                     call       0x7ff793d5fbe0
00e5b f4                             hlt        
00e5c be45ffffff                     mov        esi, 0xffffff45
00e61 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e69 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00e6e 44891c24                       mov        dword ptr [rsp], r11d
00e72 4489442408                     mov        dword ptr [rsp + 8], r8d
00e77 e8e40dafff                     call       0x7ff77b6cda60
00e7c 0f1f8400740f000a               nop        dword ptr [rax + rax + 0xa000f74]
00e84 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
00e8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e92 e8492f1818                     call       0x7ff793d5fbe0
00e97 f4                             hlt        
00e98 be45ffffff                     mov        esi, 0xffffff45
00e9d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ea5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00eaa 44891c24                       mov        dword ptr [rsp], r11d
00eae 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00eb3 4489542404                     mov        dword ptr [rsp + 4], r10d
00eb8 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00ebd 44895c2408                     mov        dword ptr [rsp + 8], r11d
00ec2 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00eca 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00ecf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ed4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ed9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00ede 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00ee3 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00ee8 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00eed 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00ef2 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00ef7 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00efc 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00f01 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00f06 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00f0b 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00f10 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00f15 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00f1a 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00f1f 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00f24 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00f29 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00f2e 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00f33 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00f38 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00f3d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00f42 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00f47 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00f4c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00f51 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00f59 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00f5e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00f66 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00f6b e8f00cafff                     call       0x7ff77b6cda60
00f70 0f1f84006810000b               nop        dword ptr [rax + rax + 0xb001068]
00f78 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
00f82 4883e4f0                       and        rsp, 0xfffffffffffffff0
00f86 e8552e1818                     call       0x7ff793d5fbe0
00f8b f4                             hlt        
00f8c be45ffffff                     mov        esi, 0xffffff45
00f91 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00f99 448b542408                     mov        r10d, dword ptr [rsp + 8]
00f9e 44891424                       mov        dword ptr [rsp], r10d
00fa2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00fa7 44895c2404                     mov        dword ptr [rsp + 4], r11d
00fac 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00fb1 4489542408                     mov        dword ptr [rsp + 8], r10d
00fb6 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00fbe 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00fc3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00fc8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00fcd 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00fd2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00fd7 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00fdc 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00fe1 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00fe6 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00feb 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00ff0 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00ff5 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00ffa 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00fff 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01004 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01009 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0100e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01013 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01018 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0101d 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01022 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01027 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0102c 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01031 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01036 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0103b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01040 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01045 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0104d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01052 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0105a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0105f 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
01067 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
0106c 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
01074 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
0107c 90                             nop        
0107d 90                             nop        
0107e 90                             nop        
0107f e8dc0bafff                     call       0x7ff77b6cda60
01084 0f1f84007c11000c               nop        dword ptr [rax + rax + 0xc00117c]
0108c 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01096 4883e4f0                       and        rsp, 0xfffffffffffffff0
0109a e8412d1818                     call       0x7ff793d5fbe0
0109f f4                             hlt        
010a0 be45ffffff                     mov        esi, 0xffffff45
010a5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
010ad 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
010b2 44891c24                       mov        dword ptr [rsp], r11d
010b6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
010bb 4489542404                     mov        dword ptr [rsp + 4], r10d
010c0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
010c5 44895c2408                     mov        dword ptr [rsp + 8], r11d
010ca 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
010d2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
010d7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
010dc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
010e1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
010e6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
010eb 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
010f0 4489542420                     mov        dword ptr [rsp + 0x20], r10d
010f5 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
010fa 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
010ff 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01104 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01109 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0110e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01113 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01118 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0111d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01122 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01127 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0112c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01131 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01136 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0113b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01140 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01145 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0114a 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0114f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01154 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01159 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01161 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01166 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0116e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01173 448b9c24d4000000               mov        r11d, dword ptr [rsp + 0xd4]
0117b 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01180 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
01188 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
0118f 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
01197 e8c40aafff                     call       0x7ff77b6cda60
0119c 0f1f84009412000d               nop        dword ptr [rax + rax + 0xd001294]
011a4 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
011ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
011b2 e8292c1818                     call       0x7ff793d5fbe0
011b7 f4                             hlt        
011b8 be45ffffff                     mov        esi, 0xffffff45
011bd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
011c5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
011ca 44891c24                       mov        dword ptr [rsp], r11d
011ce 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
011d3 44894c2404                     mov        dword ptr [rsp + 4], r9d
011d8 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
011dd 44895c2408                     mov        dword ptr [rsp + 8], r11d
011e2 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
011e7 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
011ec 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
011f1 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
011f6 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
011fb 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01200 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01205 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0120a 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0120f 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01214 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01219 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0121e 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01223 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01228 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0122d 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01232 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01237 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0123c 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01241 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01246 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0124b 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01250 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01255 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0125a 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0125f 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01264 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
0126c 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
01271 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
01279 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
0127e 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01283 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
0128a 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
01292 48898c2488000000               mov        qword ptr [rsp + 0x88], rcx
0129a 90                             nop        
0129b e8c009afff                     call       0x7ff77b6cda60
012a0 0f1f84009813000e               nop        dword ptr [rax + rax + 0xe001398]
012a8 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
012b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
012b6 e8252b1818                     call       0x7ff793d5fbe0
012bb f4                             hlt        
012bc 41bbffffff7f                   mov        r11d, 0x7fffffff
012c2 4d3bcb                         cmp        r9, r11
012c5 bdffffffff                     mov        ebp, 0xffffffff
012ca 7c08                           jl         0x7ff77bbdd0d4
012cc 400f95c5                       setne      bpl
012d0 400fb6ed                       movzx      ebp, bpl
012d4 be45ffffff                     mov        esi, 0xffffff45
012d9 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
012e1 4c891c24                       mov        qword ptr [rsp], r11
012e5 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
012ea 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
012ef 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
012f7 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
012fc 8b5c243c                       mov        ebx, dword ptr [rsp + 0x3c]
01300 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01304 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01309 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0130e 8b5c2434                       mov        ebx, dword ptr [rsp + 0x34]
01312 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01316 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0131b 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01320 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
01324 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01328 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0132d 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01332 8b5c2474                       mov        ebx, dword ptr [rsp + 0x74]
01336 895c2440                       mov        dword ptr [rsp + 0x40], ebx
0133a 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
01342 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01347 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
0134b 895c2450                       mov        dword ptr [rsp + 0x50], ebx
0134f 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01354 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
01359 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
0135d 895c2458                       mov        dword ptr [rsp + 0x58], ebx
01361 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01366 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0136b 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
01373 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
01378 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
01380 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
01385 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
0138d 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
01394 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
0139c 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
013a4 90                             nop        
013a5 90                             nop        
013a6 90                             nop        
013a7 e8b408afff                     call       0x7ff77b6cda60
013ac 0f1f8400a414000f               nop        dword ptr [rax + rax + 0xf0014a4]
013b4 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
013be 4883e4f0                       and        rsp, 0xfffffffffffffff0
013c2 e8192a1818                     call       0x7ff793d5fbe0
013c7 f4                             hlt        
013c8 be45ffffff                     mov        esi, 0xffffff45
013cd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013d5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
013da 44891c24                       mov        dword ptr [rsp], r11d
013de 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
013e3 44895c2404                     mov        dword ptr [rsp + 4], r11d
013e8 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
013ed 44895c2408                     mov        dword ptr [rsp + 8], r11d
013f2 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
013f7 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
013fc 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01401 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01406 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0140b 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01410 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01415 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0141a 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0141f 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01424 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01429 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0142e 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01433 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01438 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0143d 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01442 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01447 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0144c 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01451 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01456 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0145b 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01460 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01465 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0146a 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0146f 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01474 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
0147c 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
01481 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01486 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
0148e 90                             nop        
0148f e8cc07afff                     call       0x7ff77b6cda60
01494 0f1f84008c150010               nop        dword ptr [rax + rax + 0x1000158c]
0149c 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
014a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
014aa e831291818                     call       0x7ff793d5fbe0
014af f4                             hlt        
014b0 be45ffffff                     mov        esi, 0xffffff45
014b5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014bd 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
014c2 44891c24                       mov        dword ptr [rsp], r11d
014c6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
014cb 44895c2404                     mov        dword ptr [rsp + 4], r11d
014d0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
014d5 44895c2408                     mov        dword ptr [rsp + 8], r11d
014da 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
014df 4c89542418                     mov        qword ptr [rsp + 0x18], r10
014e4 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
014e9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
014ee 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
014f3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
014f8 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
014fd 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01502 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01507 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0150c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01511 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01516 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0151b 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01520 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01525 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0152a 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0152f 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01534 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01539 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0153e 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01543 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01548 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0154d 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01552 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01557 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0155c 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01564 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01569 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
0156e 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
01575 90                             nop        
01576 90                             nop        
01577 e8e406afff                     call       0x7ff77b6cda60
0157c 0f1f840074160011               nop        dword ptr [rax + rax + 0x11001674]
01584 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
0158e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01592 e849281818                     call       0x7ff793d5fbe0
01597 f4                             hlt        
01598 be3dffffff                     mov        esi, 0xffffff3d
0159d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015a5 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
015aa 44890c24                       mov        dword ptr [rsp], r9d
015ae 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
015b3 44894c2404                     mov        dword ptr [rsp + 4], r9d
015b8 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
015bc 895c2408                       mov        dword ptr [rsp + 8], ebx
015c0 4c8b4c2420                     mov        r9, qword ptr [rsp + 0x20]
015c5 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
015ca 8b5c243c                       mov        ebx, dword ptr [rsp + 0x3c]
015ce 895c240c                       mov        dword ptr [rsp + 0xc], ebx
015d2 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
015d7 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
015dc 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
015e0 895c2424                       mov        dword ptr [rsp + 0x24], ebx
015e4 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
015e9 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
015ee 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
015f2 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
015f6 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
015fb 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01600 8b5c2468                       mov        ebx, dword ptr [rsp + 0x68]
01604 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01608 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
0160d 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01612 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
01619 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0161d 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01622 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01627 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
0162b 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
0162f 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01634 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01639 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
0163e 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
01643 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
0164b 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
01650 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
01658 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
0165d 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01662 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
0166a 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
01671 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
01679 90                             nop        
0167a 90                             nop        
0167b e8e005afff                     call       0x7ff77b6cda60
01680 0f1f840078170012               nop        dword ptr [rax + rax + 0x12001778]
01688 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01692 4883e4f0                       and        rsp, 0xfffffffffffffff0
01696 e845271818                     call       0x7ff793d5fbe0
0169b f4                             hlt        
0169c be45ffffff                     mov        esi, 0xffffff45
016a1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
016a9 448b542408                     mov        r10d, dword ptr [rsp + 8]
016ae 44891424                       mov        dword ptr [rsp], r10d
016b2 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
016b7 4489542404                     mov        dword ptr [rsp + 4], r10d
016bc 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
016c1 44895c2408                     mov        dword ptr [rsp + 8], r11d
016c6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016cb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016d0 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
016d5 448954240c                     mov        dword ptr [rsp + 0xc], r10d
016da 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016df 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
016e4 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
016e9 4489542424                     mov        dword ptr [rsp + 0x24], r10d
016ee 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
016f3 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
016f8 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
016fd 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01702 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01707 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0170c 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01711 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01716 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
0171b 894c2460                       mov        dword ptr [rsp + 0x60], ecx
0171f 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01724 90                             nop        
01725 90                             nop        
01726 90                             nop        
01727 e83405afff                     call       0x7ff77b6cda60
0172c 0f1f840024180013               nop        dword ptr [rax + rax + 0x13001824]
01734 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
0173e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01742 e899261818                     call       0x7ff793d5fbe0
01747 f4                             hlt        
01748 be45ffffff                     mov        esi, 0xffffff45
0174d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01755 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
0175a 44890c24                       mov        dword ptr [rsp], r9d
0175e 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
01763 44894c2404                     mov        dword ptr [rsp + 4], r9d
01768 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
0176d 44894c2408                     mov        dword ptr [rsp + 8], r9d
01772 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01777 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0177c 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01781 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01786 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0178b 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01790 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01795 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0179a 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0179f 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
017a4 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
017a9 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
017ae 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
017b3 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
017b8 4489542454                     mov        dword ptr [rsp + 0x54], r10d
017bd 4489442458                     mov        dword ptr [rsp + 0x58], r8d
017c2 90                             nop        
017c3 e89804afff                     call       0x7ff77b6cda60
017c8 0f1f8400c0180014               nop        dword ptr [rax + rax + 0x140018c0]
017d0 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
017da 4883e4f0                       and        rsp, 0xfffffffffffffff0
017de e8fd251818                     call       0x7ff793d5fbe0
017e3 f4                             hlt        
017e4 be45ffffff                     mov        esi, 0xffffff45
017e9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
017f1 448b542408                     mov        r10d, dword ptr [rsp + 8]
017f6 44891424                       mov        dword ptr [rsp], r10d
017fa 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
017ff 44895c2404                     mov        dword ptr [rsp + 4], r11d
01804 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01809 4489542408                     mov        dword ptr [rsp + 8], r10d
0180e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01813 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01818 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0181d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01822 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01827 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0182c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01831 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01836 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0183b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01840 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01844 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01849 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0184e 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01853 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01858 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0185d 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01862 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01867 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0186c 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01871 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01876 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0187b 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01880 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01885 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0188a 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01892 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01897 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0189f 4c89542468                     mov        qword ptr [rsp + 0x68], r10
018a4 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
018ac 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
018b4 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
018bb e8a003afff                     call       0x7ff77b6cda60
018c0 0f1f8400b8190015               nop        dword ptr [rax + rax + 0x150019b8]
018c8 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
018d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
018d6 e805251818                     call       0x7ff793d5fbe0
018db f4                             hlt        
018dc 4585c0                         test       r8d, r8d
018df 7f08                           jg         0x7ff77bbdd6e9
018e1 4533ed                         xor        r13d, r13d
018e4 e9d4e7ffff                     jmp        0x7ff77bbdbebd
018e9 8954242c                       mov        dword ptr [rsp + 0x2c], edx
018ed 4489742428                     mov        dword ptr [rsp + 0x28], r14d
018f2 897c241c                       mov        dword ptr [rsp + 0x1c], edi
018f6 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
018fb 89442414                       mov        dword ptr [rsp + 0x14], eax
018ff 894c2410                       mov        dword ptr [rsp + 0x10], ecx
01903 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01908 48894424f8                     mov        qword ptr [rsp - 8], rax
0190d 8b0424                         mov        eax, dword ptr [rsp]
01910 89442404                       mov        dword ptr [rsp + 4], eax
01914 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01919 48894424f8                     mov        qword ptr [rsp - 8], rax
0191e 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01925 890424                         mov        dword ptr [rsp], eax
01928 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0192d 488bee                         mov        rbp, rsi
01930 8b542408                       mov        edx, dword ptr [rsp + 8]
01934 418bc8                         mov        ecx, r8d
01937 e82425b5ff                     call       0x7ff77b72fc60
0193c 0f1f8400341a0016               nop        dword ptr [rax + rax + 0x16001a34]
01944 41bb40000000                   mov        r11d, 0x40
0194a 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
0194f c462a1f7e8                     shlx       r13, rax, r11
01954 48894424f8                     mov        qword ptr [rsp - 8], rax
01959 8b442404                       mov        eax, dword ptr [rsp + 4]
0195d 890424                         mov        dword ptr [rsp], eax
01960 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01965 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
0196a 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0196e 8b442414                       mov        eax, dword ptr [rsp + 0x14]
01972 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01977 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
0197b 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
01980 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01984 e934e7ffff                     jmp        0x7ff77bbdbebd
01989 4585c0                         test       r8d, r8d
0198c 7f07                           jg         0x7ff77bbdd795
0198e 33f6                           xor        esi, esi
01990 e969e7ffff                     jmp        0x7ff77bbdbefe
01995 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0199a 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
0199f 8954242c                       mov        dword ptr [rsp + 0x2c], edx
019a3 4489742428                     mov        dword ptr [rsp + 0x28], r14d
019a8 897c241c                       mov        dword ptr [rsp + 0x1c], edi
019ac 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
019b1 89442414                       mov        dword ptr [rsp + 0x14], eax
019b5 894c2410                       mov        dword ptr [rsp + 0x10], ecx
019b9 448944240c                     mov        dword ptr [rsp + 0xc], r8d
019be 48894424f8                     mov        qword ptr [rsp - 8], rax
019c3 8b0424                         mov        eax, dword ptr [rsp]
019c6 89442404                       mov        dword ptr [rsp + 4], eax
019ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019cf 48894424f8                     mov        qword ptr [rsp - 8], rax
019d4 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
019db 890424                         mov        dword ptr [rsp], eax
019de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019e3 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
019eb 488bf5                         mov        rsi, rbp
019ee 8b542408                       mov        edx, dword ptr [rsp + 8]
019f2 418bc8                         mov        ecx, r8d
019f5 90                             nop        
019f6 90                             nop        
019f7 e86424b5ff                     call       0x7ff77b72fc60
019fc 0f1f8400f41a0017               nop        dword ptr [rax + rax + 0x17001af4]
01a04 41bb80000000                   mov        r11d, 0x80
01a0a 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
01a0f c4e2a1f7f0                     shlx       rsi, rax, r11
01a14 48894424f8                     mov        qword ptr [rsp - 8], rax
01a19 8b442404                       mov        eax, dword ptr [rsp + 4]
01a1d 890424                         mov        dword ptr [rsp], eax
01a20 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a25 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
01a29 8b442414                       mov        eax, dword ptr [rsp + 0x14]
01a2d 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
01a31 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
01a36 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01a3a 4c8b6c2430                     mov        r13, qword ptr [rsp + 0x30]
01a3f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01a44 e9b5e6ffff                     jmp        0x7ff77bbdbefe
01a49 4533c0                         xor        r8d, r8d
01a4c e998efffff                     jmp        0x7ff77bbdc7e9
01a51 bee4ffffff                     mov        esi, 0xffffffe4
01a56 48ffb42490000000               push       qword ptr [rsp + 0x90]
01a5e 488f0424                       pop        qword ptr [rsp]
01a62 90                             nop        
01a63 e8f801afff                     call       0x7ff77b6cda60
01a68 0f1f8400601b0018               nop        dword ptr [rax + rax + 0x18001b60]
01a70 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01a7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a7e e85d231818                     call       0x7ff793d5fbe0
01a83 f4                             hlt        
01a84 be5d000000                     mov        esi, 0x5d
01a89 90                             nop        
01a8a 90                             nop        
01a8b e8d001afff                     call       0x7ff77b6cda60
01a90 0f1f8400881b0019               nop        dword ptr [rax + rax + 0x19001b88]
01a98 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01aa2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01aa6 e835231818                     call       0x7ff793d5fbe0
01aab f4                             hlt        
01aac bef6ffffff                     mov        esi, 0xfffffff6
01ab1 90                             nop        
01ab2 90                             nop        
01ab3 e8a801afff                     call       0x7ff77b6cda60
01ab8 0f1f8400b01b001a               nop        dword ptr [rax + rax + 0x1a001bb0]
01ac0 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01aca 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ace e80d231818                     call       0x7ff793d5fbe0
01ad3 f4                             hlt        
01ad4 bef6ffffff                     mov        esi, 0xfffffff6
01ad9 90                             nop        
01ada 90                             nop        
01adb e88001afff                     call       0x7ff77b6cda60
01ae0 0f1f8400d81b001b               nop        dword ptr [rax + rax + 0x1b001bd8]
01ae8 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01af2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01af6 e8e5221818                     call       0x7ff793d5fbe0
01afb f4                             hlt        
01afc be6effffff                     mov        esi, 0xffffff6e
01b01 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b09 448b542408                     mov        r10d, dword ptr [rsp + 8]
01b0e 44891424                       mov        dword ptr [rsp], r10d
01b12 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b17 4489542408                     mov        dword ptr [rsp + 8], r10d
01b1c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b21 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b26 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01b2b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01b30 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b35 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01b3a 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01b3f 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01b44 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01b49 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01b4e 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01b53 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01b58 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01b5d 90                             nop        
01b5e 90                             nop        
01b5f e8fc00afff                     call       0x7ff77b6cda60
01b64 0f1f84005c1c001c               nop        dword ptr [rax + rax + 0x1c001c5c]
01b6c 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01b76 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b7a e861221818                     call       0x7ff793d5fbe0
01b7f f4                             hlt        
01b80 bee4ffffff                     mov        esi, 0xffffffe4
01b85 48ffb42490000000               push       qword ptr [rsp + 0x90]
01b8d 488f0424                       pop        qword ptr [rsp]
01b91 89442418                       mov        dword ptr [rsp + 0x18], eax
01b95 48894424f8                     mov        qword ptr [rsp - 8], rax
01b9a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01ba1 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01ba5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01baa 897c2428                       mov        dword ptr [rsp + 0x28], edi
01bae 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01bb2 90                             nop        
01bb3 e8a800afff                     call       0x7ff77b6cda60
01bb8 0f1f8400b01c001d               nop        dword ptr [rax + rax + 0x1d001cb0]
01bc0 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01bca 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bce e80d221818                     call       0x7ff793d5fbe0
01bd3 f4                             hlt        
01bd4 bee4ffffff                     mov        esi, 0xffffffe4
01bd9 48ffb42490000000               push       qword ptr [rsp + 0x90]
01be1 488f0424                       pop        qword ptr [rsp]
01be5 48894424f8                     mov        qword ptr [rsp - 8], rax
01bea 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01bf1 89442418                       mov        dword ptr [rsp + 0x18], eax
01bf5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bfa 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01bfe 89542428                       mov        dword ptr [rsp + 0x28], edx
01c02 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01c07 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01c0c 90                             nop        
01c0d 90                             nop        
01c0e 90                             nop        
01c0f e84c00afff                     call       0x7ff77b6cda60
01c14 0f1f84000c1d001e               nop        dword ptr [rax + rax + 0x1e001d0c]
01c1c 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01c26 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c2a e8b1211818                     call       0x7ff793d5fbe0
01c2f f4                             hlt        
01c30 bebeffffff                     mov        esi, 0xffffffbe
01c35 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c3d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01c42 44891424                       mov        dword ptr [rsp], r10d
01c46 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01c4b 4489542408                     mov        dword ptr [rsp + 8], r10d
01c50 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c55 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c5a 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01c5f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01c64 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c69 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01c6e 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01c73 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01c78 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01c7d 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01c82 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01c87 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01c8c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01c91 90                             nop        
01c92 90                             nop        
01c93 e8c8ffaeff                     call       0x7ff77b6cda60
01c98 0f1f8400901d001f               nop        dword ptr [rax + rax + 0x1f001d90]
01ca0 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01caa 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cae e82d211818                     call       0x7ff793d5fbe0
01cb3 f4                             hlt        
01cb4 beccffffff                     mov        esi, 0xffffffcc
01cb9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01cc1 448b542408                     mov        r10d, dword ptr [rsp + 8]
01cc6 44891424                       mov        dword ptr [rsp], r10d
01cca 89442410                       mov        dword ptr [rsp + 0x10], eax
01cce 48894424f8                     mov        qword ptr [rsp - 8], rax
01cd3 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01cda 89442414                       mov        dword ptr [rsp + 0x14], eax
01cde 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ce3 897c2418                       mov        dword ptr [rsp + 0x18], edi
01ce7 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01ceb 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01cef e86cffaeff                     call       0x7ff77b6cda60
01cf4 0f1f8400ec1d0020               nop        dword ptr [rax + rax + 0x20001dec]
01cfc 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01d06 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d0a e8d1201818                     call       0x7ff793d5fbe0
01d0f f4                             hlt        
01d10 beccffffff                     mov        esi, 0xffffffcc
01d15 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d1d 448b442408                     mov        r8d, dword ptr [rsp + 8]
01d22 44890424                       mov        dword ptr [rsp], r8d
01d26 48894424f8                     mov        qword ptr [rsp - 8], rax
01d2b 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d32 89442410                       mov        dword ptr [rsp + 0x10], eax
01d36 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d3b 897c2414                       mov        dword ptr [rsp + 0x14], edi
01d3f 89542418                       mov        dword ptr [rsp + 0x18], edx
01d43 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
01d48 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01d4d 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01d51 90                             nop        
01d52 90                             nop        
01d53 e808ffaeff                     call       0x7ff77b6cda60
01d58 0f1f8400501e0021               nop        dword ptr [rax + rax + 0x21001e50]
01d60 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01d6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d6e e86d201818                     call       0x7ff793d5fbe0
01d73 f4                             hlt        
01d74 be45ffffff                     mov        esi, 0xffffff45
01d79 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01d7e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01d83 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01d88 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01d8d 90                             nop        
01d8e 90                             nop        
01d8f e8ccfeaeff                     call       0x7ff77b6cda60
01d94 0f1f84008c1e0022               nop        dword ptr [rax + rax + 0x22001e8c]
01d9c 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01da6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01daa e831201818                     call       0x7ff793d5fbe0
01daf f4                             hlt        
01db0 be45ffffff                     mov        esi, 0xffffff45
01db5 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01dba 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01dbf 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01dc4 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01dc9 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01dce 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01dd3 e888feaeff                     call       0x7ff77b6cda60
01dd8 0f1f8400d01e0023               nop        dword ptr [rax + rax + 0x23001ed0]
01de0 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01dea 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dee e8ed1f1818                     call       0x7ff793d5fbe0
01df3 f4                             hlt        
01df4 bef6ffffff                     mov        esi, 0xfffffff6
01df9 90                             nop        
01dfa 90                             nop        
01dfb e860feaeff                     call       0x7ff77b6cda60
01e00 0f1f8400f81e0024               nop        dword ptr [rax + rax + 0x24001ef8]
01e08 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01e12 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e16 e8c51f1818                     call       0x7ff793d5fbe0
01e1b f4                             hlt        
01e1c be5d000000                     mov        esi, 0x5d
01e21 90                             nop        
01e22 90                             nop        
01e23 e838feaeff                     call       0x7ff77b6cda60
01e28 0f1f8400201f0025               nop        dword ptr [rax + rax + 0x25001f20]
01e30 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01e3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e3e e89d1f1818                     call       0x7ff793d5fbe0
01e43 f4                             hlt        
01e44 be45ffffff                     mov        esi, 0xffffff45
01e49 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e51 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01e56 44891c24                       mov        dword ptr [rsp], r11d
01e5a 90                             nop        
01e5b e800feaeff                     call       0x7ff77b6cda60
01e60 0f1f8400581f0026               nop        dword ptr [rax + rax + 0x26001f58]
01e68 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01e72 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e76 e8651f1818                     call       0x7ff793d5fbe0
01e7b f4                             hlt        
01e7c bef6ffffff                     mov        esi, 0xfffffff6
01e81 418bea                         mov        ebp, r10d
01e84 90                             nop        
01e85 90                             nop        
01e86 90                             nop        
01e87 e8d4fdaeff                     call       0x7ff77b6cda60
01e8c 0f1f8400841f0027               nop        dword ptr [rax + rax + 0x27001f84]
01e94 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01e9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ea2 e8391f1818                     call       0x7ff793d5fbe0
01ea7 f4                             hlt        
01ea8 bef6ffffff                     mov        esi, 0xfffffff6
01ead 418be8                         mov        ebp, r8d
01eb0 90                             nop        
01eb1 90                             nop        
01eb2 90                             nop        
01eb3 e8a8fdaeff                     call       0x7ff77b6cda60
01eb8 0f1f8400b01f0028               nop        dword ptr [rax + rax + 0x28001fb0]
01ec0 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01eca 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ece e80d1f1818                     call       0x7ff793d5fbe0
01ed3 f4                             hlt        
01ed4 bef6ffffff                     mov        esi, 0xfffffff6
01ed9 418bea                         mov        ebp, r10d
01edc 90                             nop        
01edd 90                             nop        
01ede 90                             nop        
01edf e87cfdaeff                     call       0x7ff77b6cda60
01ee4 0f1f8400dc1f0029               nop        dword ptr [rax + rax + 0x29001fdc]
01eec 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01ef6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01efa e8e11e1818                     call       0x7ff793d5fbe0
01eff f4                             hlt        
01f00 bef6ffffff                     mov        esi, 0xfffffff6
01f05 90                             nop        
01f06 90                             nop        
01f07 e854fdaeff                     call       0x7ff77b6cda60
01f0c 0f1f84000420002a               nop        dword ptr [rax + rax + 0x2a002004]
01f14 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01f1e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f22 e8b91e1818                     call       0x7ff793d5fbe0
01f27 f4                             hlt        
01f28 bef6ffffff                     mov        esi, 0xfffffff6
01f2d 90                             nop        
01f2e 90                             nop        
01f2f e82cfdaeff                     call       0x7ff77b6cda60
01f34 0f1f84002c20002b               nop        dword ptr [rax + rax + 0x2b00202c]
01f3c 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01f46 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f4a e8911e1818                     call       0x7ff793d5fbe0
01f4f f4                             hlt        
01f50 bef6ffffff                     mov        esi, 0xfffffff6
01f55 90                             nop        
01f56 90                             nop        
01f57 e804fdaeff                     call       0x7ff77b6cda60
01f5c 0f1f84005420002c               nop        dword ptr [rax + rax + 0x2c002054]
01f64 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01f6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f72 e8691e1818                     call       0x7ff793d5fbe0
01f77 f4                             hlt        
01f78 bef6ffffff                     mov        esi, 0xfffffff6
01f7d 90                             nop        
01f7e 90                             nop        
01f7f e8dcfcaeff                     call       0x7ff77b6cda60
01f84 0f1f84007c20002d               nop        dword ptr [rax + rax + 0x2d00207c]
01f8c 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01f96 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f9a e8411e1818                     call       0x7ff793d5fbe0
01f9f f4                             hlt        
01fa0 bef6ffffff                     mov        esi, 0xfffffff6
01fa5 90                             nop        
01fa6 90                             nop        
01fa7 e8b4fcaeff                     call       0x7ff77b6cda60
01fac 0f1f8400a420002e               nop        dword ptr [rax + rax + 0x2e0020a4]
01fb4 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01fbe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fc2 e8191e1818                     call       0x7ff793d5fbe0
01fc7 f4                             hlt        
01fc8 bef6ffffff                     mov        esi, 0xfffffff6
01fcd 90                             nop        
01fce 90                             nop        
01fcf e88cfcaeff                     call       0x7ff77b6cda60
01fd4 0f1f8400cc20002f               nop        dword ptr [rax + rax + 0x2f0020cc]
01fdc 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
01fe6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fea e8f11d1818                     call       0x7ff793d5fbe0
01fef f4                             hlt        
01ff0 bef6ffffff                     mov        esi, 0xfffffff6
01ff5 90                             nop        
01ff6 90                             nop        
01ff7 e864fcaeff                     call       0x7ff77b6cda60
01ffc 0f1f8400f4200030               nop        dword ptr [rax + rax + 0x300020f4]
02004 48bf40500e54f77f0000           movabs     rdi, 0x7ff7540e5040
0200e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02012 e8c91d1818                     call       0x7ff793d5fbe0
02017 f4                             hlt        
02018 eb08                           jmp        0x7ff77bbdde22
0201a eb06                           jmp        0x7ff77bbdde22
0201c eb04                           jmp        0x7ff77bbdde22
0201e eb02                           jmp        0x7ff77bbdde22
02020 eb00                           jmp        0x7ff77bbdde22
02022 488bf0                         mov        rsi, rax
02025 e9fae9ffff                     jmp        0x7ff77bbdc824
0202a 49ba4fc8bd7bf77f0000           movabs     r10, 0x7ff77bbdc84f
02034 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
0203b e92045b5ff                     jmp        0x7ff77b732360
02040 e89b13b4ff                     call       0x7ff77b71f1e0
02045 e9d4dfffff                     jmp        0x7ff77bbdbe1e
0204a f4                             hlt        
0204b f4                             hlt        
0204c f4                             hlt        
0204d f4                             hlt        
0204e f4                             hlt        
0204f f4                             hlt        
