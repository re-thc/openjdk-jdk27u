00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f8592200000                   jne        0x7f23abbd24b0
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
00050 0f832f1a0000                   jae        0x7f23abbd1e85
00056 0fb64c1607                     movzx      ecx, byte ptr [rsi + rdx + 7]
0005b 85c9                           test       ecx, ecx
0005d 0f84551a0000                   je         0x7f23abbd1eb8
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
0009b 0f8c6f180000                   jl         0x7f23abbd1d10
000a1 85db                           test       ebx, ebx
000a3 0f8c471c0000                   jl         0x7f23abbd20f0
000a9 8b2c24                         mov        ebp, dword ptr [rsp]
000ac 83c5f9                         add        ebp, -7
000af 3bc5                           cmp        eax, ebp
000b1 0f83011b0000                   jae        0x7f23abbd1fb8
000b7 448bd0                         mov        r10d, eax
000ba 4e8b6c1608                     mov        r13, qword ptr [rsi + r10 + 8]
000bf 4183c0f8                       add        r8d, -8
000c3 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000cb 4183c2f0                       add        r10d, -0x10
000cf 4183f808                       cmp        r8d, 8
000d3 0f8ce4180000                   jl         0x7f23abbd1dbd
000d9 85db                           test       ebx, ebx
000db 0f8c6b1c0000                   jl         0x7f23abbd214c
000e1 8b2c24                         mov        ebp, dword ptr [rsp]
000e4 83c5f9                         add        ebp, -7
000e7 443bd5                         cmp        r10d, ebp
000ea 0f831c1b0000                   jae        0x7f23abbd200c
000f0 458bc2                         mov        r8d, r10d
000f3 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
000fb 4b8b740308                     mov        rsi, qword ptr [r11 + r8 + 8]
00100 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
00105 448b4518                       mov        r8d, dword ptr [rbp + 0x18]
00109 4585c0                         test       r8d, r8d
0010c 0f84ce190000                   je         0x7f23abbd1ee0
00112 448b5d1c                       mov        r11d, dword ptr [rbp + 0x1c]
00116 418b4b04                       mov        ecx, dword ptr [r11 + 4]
0011a 448b4d20                       mov        r9d, dword ptr [rbp + 0x20]
0011e 4585c9                         test       r9d, r9d
00121 0f84e1190000                   je         0x7f23abbd1f08
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
00190 0f84e8080000                   je         0x7f23abbd0e7e
00196 be40000000                     mov        esi, 0x40
0019b 2bf7                           sub        esi, edi
0019d 3bce                           cmp        ecx, esi
0019f 0f8f18020000                   jg         0x7f23abbd07bd
001a5 2bf1                           sub        esi, ecx
001a7 c4c2cbf7ed                     shrx       rbp, r13, rsi
001ac 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b1 83f940                         cmp        ecx, 0x40
001b4 0f8dfe1c0000                   jge        0x7f23abbd22b8
001ba 41bb01000000                   mov        r11d, 1
001c0 c4c2f1f7eb                     shlx       rbp, r11, rcx
001c5 48ffcd                         dec        rbp
001c8 48236c2460                     and        rbp, qword ptr [rsp + 0x60]
001cd 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001d2 448bd9                         mov        r11d, ecx
001d5 458bcb                         mov        r9d, r11d
001d8 442b4c240c                     sub        r9d, dword ptr [rsp + 0xc]
001dd 458d4108                       lea        r8d, [r9 + 8]
001e1 4183f840                       cmp        r8d, 0x40
001e5 7c34                           jl         0x7f23abbd061b
001e7 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
001ec 4183c1c8                       add        r9d, -0x38
001f0 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001f5 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
001fd 8b542408                       mov        edx, dword ptr [rsp + 8]
00201 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00205 90                             nop        
00206 90                             nop        
00207 e854f6b5ff                     call       0x7f23ab72fc60
0020c 0f1f840004030000               nop        dword ptr [rax + rax + 0x304]
00214 4889442420                     mov        qword ptr [rsp + 0x20], rax
00219 eb31                           jmp        0x7f23abbd064c
0021b 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
00220 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00228 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0022d 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00232 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0023a 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
00242 4489442410                     mov        dword ptr [rsp + 0x10], r8d
00247 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0024c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00251 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00255 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0025a 4183fb20                       cmp        r11d, 0x20
0025e 0f8d4c1b0000                   jge        0x7f23abbd21b0
00264 c462a3f7542460                 shrx       r10, qword ptr [rsp + 0x60], r11
0026b 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00270 41bb01000000                   mov        r11d, 1
00276 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0027b c44229f7d3                     shlx       r10d, r11d, r10d
00280 41ffca                         dec        r10d
00283 4d63d2                         movsxd     r10, r10d
00286 4c23542460                     and        r10, qword ptr [rsp + 0x60]
0028b 458bd2                         mov        r10d, r10d
0028e 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00293 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00298 458b5b04                       mov        r11d, dword ptr [r11 + 4]
0029c 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
002a1 4183fb20                       cmp        r11d, 0x20
002a5 0f8d5d1b0000                   jge        0x7f23abbd2208
002ab 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
002b3 458b5204                       mov        r10d, dword ptr [r10 + 4]
002b7 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
002bf 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
002c4 458b5314                       mov        r10d, dword ptr [r11 + 0x14]
002c8 458b5204                       mov        r10d, dword ptr [r10 + 4]
002cc 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
002d1 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
002d5 458b5b04                       mov        r11d, dword ptr [r11 + 4]
002d9 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
002de 458b4914                       mov        r9d, dword ptr [r9 + 0x14]
002e2 458b4104                       mov        r8d, dword ptr [r9 + 4]
002e6 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
002eb 4585c9                         test       r9d, r9d
002ee 0f8e89170000                   jle        0x7f23abbd1e7d
002f4 41ffca                         dec        r10d
002f7 4489542464                     mov        dword ptr [rsp + 0x64], r10d
002fc 41ffcb                         dec        r11d
002ff 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
00304 41ffc8                         dec        r8d
00307 4489442474                     mov        dword ptr [rsp + 0x74], r8d
0030c 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00311 c462a3f75c2468                 shrx       r11, qword ptr [rsp + 0x68], r11
00318 41ba01000000                   mov        r10d, 1
0031e 8b6c2460                       mov        ebp, dword ptr [rsp + 0x60]
00322 c44251f7c2                     shlx       r8d, r10d, ebp
00327 458bdb                         mov        r11d, r11d
0032a 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0032f 41ffc8                         dec        r8d
00332 4d63d0                         movsxd     r10, r8d
00335 4c23542468                     and        r10, qword ptr [rsp + 0x68]
0033a 458bd2                         mov        r10d, r10d
0033d 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00342 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0034a 458b9af4000000                 mov        r11d, dword ptr [r10 + 0xf4]
00351 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00359 458b92f0000000                 mov        r10d, dword ptr [r10 + 0xf0]
00360 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00368 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0036c 4585db                         test       r11d, r11d
0036f 0f86bb170000                   jbe        0x7f23abbd1f30
00375 4d63d3                         movsxd     r10, r11d
00378 4d63d9                         movsxd     r11, r9d
0037b 49ffcb                         dec        r11
0037e 4d3bda                         cmp        r11, r10
00381 0f83a9170000                   jae        0x7f23abbd1f30
00387 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0038c 4585db                         test       r11d, r11d
0038f 0f8cd3180000                   jl         0x7f23abbd2068
00395 8b2c24                         mov        ebp, dword ptr [rsp]
00398 83c5f9                         add        ebp, -7
0039b 89ac24c4000000                 mov        dword ptr [rsp + 0xc4], ebp
003a2 4533db                         xor        r11d, r11d
003a5 4533d2                         xor        r10d, r10d
003a8 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
003b0 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
003b8 e98b020000                     jmp        0x7f23abbd0a48
003bd 8be9                           mov        ebp, ecx
003bf 2bee                           sub        ebp, esi
003c1 90                             nop        
003c2 90                             nop        
003c3 e898f4b5ff                     call       0x7f23ab72fc60
003c8 0f1f8400c0040001               nop        dword ptr [rax + rax + 0x10004c0]
003d0 4823442428                     and        rax, qword ptr [rsp + 0x28]
003d5 41bb40000000                   mov        r11d, 0x40
003db 442bdd                         sub        r11d, ebp
003de c462d1f7c0                     shlx       r8, rax, rbp
003e3 c462a3f7942498000000           shrx       r10, qword ptr [rsp + 0x98], r11
003ed 4d0bc2                         or         r8, r10
003f0 4c89442460                     mov        qword ptr [rsp + 0x60], r8
003f5 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
003fa e9d6fdffff                     jmp        0x7f23abbd05d5
003ff 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00407 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
0040c 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00411 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00419 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0041e 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
00422 896c2410                       mov        dword ptr [rsp + 0x10], ebp
00426 90                             nop        
00427 90                             nop        
00428 90                             nop        
00429 90                             nop        
0042a 90                             nop        
0042b 90                             nop        
0042c 90                             nop        
0042d 90                             nop        
0042e 90                             nop        
0042f 90                             nop        
00430 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00437 83fd40                         cmp        ebp, 0x40
0043a 0f8d8c0a0000                   jge        0x7f23abbd12cc
00440 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0044a 41ba01000000                   mov        r10d, 1
00450 c442d1f7d2                     shlx       r10, r10, rbp
00455 49ffca                         dec        r10
00458 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00460 458bc2                         mov        r8d, r10d
00463 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0046a 83fd40                         cmp        ebp, 0x40
0046d 0f8d4d0b0000                   jge        0x7f23abbd13c0
00473 c4c2d3f7f9                     shrx       rdi, r9, rbp
00478 41ba01000000                   mov        r10d, 1
0047e c442d1f7d2                     shlx       r10, r10, rbp
00483 49ffca                         dec        r10
00486 4d23d1                         and        r10, r9
00489 418bca                         mov        ecx, r10d
0048c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00493 83fd40                         cmp        ebp, 0x40
00496 0f8d380c0000                   jge        0x7f23abbd14d4
0049c c4e2d3f7df                     shrx       rbx, rdi, rbp
004a1 41ba01000000                   mov        r10d, 1
004a7 c442d1f7d2                     shlx       r10, r10, rbp
004ac 49ffca                         dec        r10
004af 4c23d7                         and        r10, rdi
004b2 458bd2                         mov        r10d, r10d
004b5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004bc 83fd40                         cmp        ebp, 0x40
004bf 0f8d270d0000                   jge        0x7f23abbd15ec
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
00515 0f8e7d070000                   jle        0x7f23abbd1098
0051b 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00522 0f8fc80d0000                   jg         0x7f23abbd16f0
00528 4181faffff0100                 cmp        r10d, 0x1ffff
0052f 0f8fc70e0000                   jg         0x7f23abbd17fc
00535 81fbffff0300                   cmp        ebx, 0x3ffff
0053b 0f8fa30f0000                   jg         0x7f23abbd18e4
00541 458bc9                         mov        r9d, r9d
00544 4181f900000010                 cmp        r9d, 0x10000000
0054b 0f837b100000                   jae        0x7f23abbd19cc
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
00581 0f8db0000000                   jge        0x7f23abbd0a37
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
005cf 0f8dfb100000                   jge        0x7f23abbd1ad0
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
00610 0f8d5e110000                   jge        0x7f23abbd1b74
00616 41b901000000                   mov        r9d, 1
0061c 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00624 c44221f7d9                     shlx       r11d, r9d, r11d
00629 41ffcb                         dec        r11d
0062c 4523d8                         and        r11d, r8d
0062f 4503da                         add        r11d, r10d
00632 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00637 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0063b 0f8dc2030000                   jge        0x7f23abbd0e03
00641 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00648 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0064d 4423442460                     and        r8d, dword ptr [rsp + 0x60]
00652 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00657 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
0065b 458b5304                       mov        r10d, dword ptr [r11 + 4]
0065f 453bc2                         cmp        r8d, r10d
00662 0f8326040000                   jae        0x7f23abbd0e8e
00668 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
0066c 234c2468                       and        ecx, dword ptr [rsp + 0x68]
00670 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00675 458b4914                       mov        r9d, dword ptr [r9 + 0x14]
00679 458b5104                       mov        r10d, dword ptr [r9 + 4]
0067d 4f8b5cc308                     mov        r11, qword ptr [r11 + r8*8 + 8]
00682 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
00687 413bca                         cmp        ecx, r10d
0068a 0f839c040000                   jae        0x7f23abbd0f2c
00690 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
00695 4423442448                     and        r8d, dword ptr [rsp + 0x48]
0069a 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0069f 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
006a3 418b5a04                       mov        ebx, dword ptr [r10 + 4]
006a7 4d8b5cc908                     mov        r11, qword ptr [r9 + rcx*8 + 8]
006ac 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
006b4 443bc3                         cmp        r8d, ebx
006b7 0f831f050000                   jae        0x7f23abbd0fdc
006bd 4f8b54c208                     mov        r10, qword ptr [r10 + r8*8 + 8]
006c2 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006ca 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006d1 ffc5                           inc        ebp
006d3 892c24                         mov        dword ptr [rsp], ebp
006d6 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006da 0f8df2020000                   jge        0x7f23abbd0dd2
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
007a6 0f84f4050000                   je         0x7f23abbd11a0
007ac 4183f83f                       cmp        r8d, 0x3f
007b0 0f8fda060000                   jg         0x7f23abbd1290
007b6 b940000000                     mov        ecx, 0x40
007bb 2b4c243c                       sub        ecx, dword ptr [rsp + 0x3c]
007bf 443bc1                         cmp        r8d, ecx
007c2 7e47                           jle        0x7f23abbd0c0b
007c4 458bc8                         mov        r9d, r8d
007c7 442bc9                         sub        r9d, ecx
007ca 83f940                         cmp        ecx, 0x40
007cd 0f8d3d100000                   jge        0x7f23abbd1c10
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
00809 eb26                           jmp        0x7f23abbd0c31
0080b 41ba01000000                   mov        r10d, 1
00811 c442b9f7d2                     shlx       r10, r10, r8
00816 412bc8                         sub        ecx, r8d
00819 c4e2f3f7ac2498000000           shrx       rbp, qword ptr [rsp + 0x98], rcx
00823 49ffca                         dec        r10
00826 4923ea                         and        rbp, r10
00829 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
00831 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00836 4503d0                         add        r10d, r8d
00839 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0083e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00843 4503d8                         add        r11d, r8d
00846 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0084b 4183fa40                       cmp        r10d, 0x40
0084f 0f8cdbfbffff                   jl         0x7f23abbd0830
00855 4183c2c0                       add        r10d, -0x40
00859 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0085e 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00862 83c5f8                         add        ebp, -8
00865 896c240c                       mov        dword ptr [rsp + 0xc], ebp
00869 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0086d 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
00871 83c1f0                         add        ecx, -0x10
00874 83f908                         cmp        ecx, 8
00877 0f8c07010000                   jl         0x7f23abbd0d84
0087d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00882 4183c2e8                       add        r10d, -0x18
00886 443b9424c4000000               cmp        r10d, dword ptr [rsp + 0xc4]
0088e 0f826bfbffff                   jb         0x7f23abbd07ff
00894 bee4ffffff                     mov        esi, 0xffffffe4
00899 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
008a1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
008a6 44891c24                       mov        dword ptr [rsp], r11d
008aa 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
008af 44895c2404                     mov        dword ptr [rsp + 4], r11d
008b4 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
008b9 44895c2408                     mov        dword ptr [rsp + 8], r11d
008be 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
008c3 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
008c8 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
008cd 448944240c                     mov        dword ptr [rsp + 0xc], r8d
008d2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
008d7 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
008dc 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
008e1 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
008e6 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
008eb 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
008f0 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
008f5 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
008fa 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
008ff 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00904 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00909 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0090e 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00913 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00918 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0091d 4489442440                     mov        dword ptr [rsp + 0x40], r8d
00922 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00927 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0092c 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
00931 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00936 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0093b 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
00940 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00948 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
0094d 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00955 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0095a 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00962 90                             nop        
00963 e8f8ccafff                     call       0x7f23ab6cda60
00968 0f1f8400600a0002               nop        dword ptr [rax + rax + 0x2000a60]
00970 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
0097a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0097e e89d3eb419                     call       0x7f23c5714c20
00983 f4                             hlt        
00984 85c9                           test       ecx, ecx
00986 7f08                           jg         0x7f23abbd0d90
00988 4533d2                         xor        r10d, r10d
0098b e97cfaffff                     jmp        0x7f23abbd080c
00990 8be9                           mov        ebp, ecx
00992 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
0099a 8b542408                       mov        edx, dword ptr [rsp + 8]
0099e 90                             nop        
0099f e8bceeb5ff                     call       0x7f23ab72fc60
009a4 0f1f84009c0a0003               nop        dword ptr [rax + rax + 0x3000a9c]
009ac 448b542408                     mov        r10d, dword ptr [rsp + 8]
009b1 41c1e203                       shl        r10d, 3
009b5 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
009ba 41c1e003                       shl        r8d, 3
009be 452bd0                         sub        r10d, r8d
009c1 4181c2c0000000                 add        r10d, 0xc0
009c8 c462a9f7d0                     shlx       r10, rax, r10
009cd e93afaffff                     jmp        0x7f23abbd080c
009d2 4533db                         xor        r11d, r11d
009d5 4533d2                         xor        r10d, r10d
009d8 4533c9                         xor        r9d, r9d
009db 4533c0                         xor        r8d, r8d
009de 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
009e6 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
009ee 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
009f6 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
009fe e93afdffff                     jmp        0x7f23abbd0b3d
00a03 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
00a0b 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
00a13 4d03c2                         add        r8, r10
00a16 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
00a1e 4d3bc2                         cmp        r8, r10
00a21 7e32                           jle        0x7f23abbd0e55
00a23 48be30b172e200000000           movabs     rsi, 0xe272b130
00a2d 90                             nop        
00a2e 90                             nop        
00a2f e82ceeb5ff                     call       0x7f23ab72fc60
00a34 0f1f84002c0b0004               nop        dword ptr [rax + rax + 0x4000b2c]
00a3c 4885c0                         test       rax, rax
00a3f 0f8423140000                   je         0x7f23abbd2268
00a45 488bf0                         mov        rsi, rax
00a48 4881c410010000                 add        rsp, 0x110
00a4f 5d                             pop        rbp
00a50 e90b4dafff                     jmp        0x7f23ab6c5b60
00a55 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a5a 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a62 0f8528140000                   jne        0x7f23abbd2290
00a68 418bc0                         mov        eax, r8d
00a6b 4881c410010000                 add        rsp, 0x110
00a72 5d                             pop        rbp
00a73 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a77 0f871d160000                   ja         0x7f23abbd249a
00a7d c3                             ret        
00a7e 4533db                         xor        r11d, r11d
00a81 4533d2                         xor        r10d, r10d
00a84 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00a89 e947f7ffff                     jmp        0x7f23abbd05d5
00a8e bee4ffffff                     mov        esi, 0xffffffe4
00a93 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a9b 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00aa0 44890c24                       mov        dword ptr [rsp], r9d
00aa4 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00aa9 4489542404                     mov        dword ptr [rsp + 4], r10d
00aae 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00ab3 44894c2408                     mov        dword ptr [rsp + 8], r9d
00ab8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00abd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ac2 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00ac7 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00acc 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00ad1 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00ad6 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00adb 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
00ae0 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00ae5 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00aea 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00aef 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00af4 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00af9 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00afe 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00b03 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
00b08 90                             nop        
00b09 90                             nop        
00b0a 90                             nop        
00b0b e850cbafff                     call       0x7f23ab6cda60
00b10 0f1f8400080c0005               nop        dword ptr [rax + rax + 0x5000c08]
00b18 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
00b22 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b26 e8f53cb419                     call       0x7f23c5714c20
00b2b f4                             hlt        
00b2c bee4ffffff                     mov        esi, 0xffffffe4
00b31 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b39 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b3e 44891c24                       mov        dword ptr [rsp], r11d
00b42 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00b47 4489542404                     mov        dword ptr [rsp + 4], r10d
00b4c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b51 44895c2408                     mov        dword ptr [rsp + 8], r11d
00b56 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b5b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b60 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00b65 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00b6a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00b6f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00b74 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00b79 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00b7e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00b83 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00b88 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00b8d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00b92 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00b97 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00b9c 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00ba1 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00ba6 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00bab 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00bb0 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
00bb5 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00bb9 90                             nop        
00bba 90                             nop        
00bbb e8a0caafff                     call       0x7f23ab6cda60
00bc0 0f1f8400b80c0006               nop        dword ptr [rax + rax + 0x6000cb8]
00bc8 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
00bd2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bd6 e8453cb419                     call       0x7f23c5714c20
00bdb f4                             hlt        
00bdc bee4ffffff                     mov        esi, 0xffffffe4
00be1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00be9 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00bee 44890c24                       mov        dword ptr [rsp], r9d
00bf2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00bf7 44895c2404                     mov        dword ptr [rsp + 4], r11d
00bfc 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00c01 44894c2408                     mov        dword ptr [rsp + 8], r9d
00c06 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00c0b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00c10 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00c15 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00c1a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00c1f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00c24 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00c29 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
00c2e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00c33 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00c38 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00c3d 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00c42 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00c47 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00c4c 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00c51 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00c56 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00c5b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00c60 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00c65 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00c6a 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00c6f 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
00c74 90                             nop        
00c75 90                             nop        
00c76 90                             nop        
00c77 e8e4c9afff                     call       0x7f23ab6cda60
00c7c 0f1f8400740d0007               nop        dword ptr [rax + rax + 0x7000d74]
00c84 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
00c8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c92 e8893bb419                     call       0x7f23c5714c20
00c97 f4                             hlt        
00c98 4533db                         xor        r11d, r11d
00c9b 4d3bcb                         cmp        r9, r11
00c9e bdffffffff                     mov        ebp, 0xffffffff
00ca3 7c08                           jl         0x7f23abbd10ad
00ca5 400f95c5                       setne      bpl
00ca9 400fb6ed                       movzx      ebp, bpl
00cad be45ffffff                     mov        esi, 0xffffff45
00cb2 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00cba 4c891c24                       mov        qword ptr [rsp], r11
00cbe 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00cc3 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00cc8 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00cd0 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00cd5 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00cda 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00cdf 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
00ce3 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
00ce7 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00cec 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00cf1 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
00cf5 894c2434                       mov        dword ptr [rsp + 0x34], ecx
00cf9 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00cfe 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00d03 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
00d07 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
00d0b 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00d10 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00d15 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
00d1c 894c2444                       mov        dword ptr [rsp + 0x44], ecx
00d20 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00d25 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00d2a 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
00d2e 894c2454                       mov        dword ptr [rsp + 0x54], ecx
00d32 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00d37 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00d3c 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00d41 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00d46 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00d4e 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00d53 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00d5b 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
00d60 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00d68 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
00d6f 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d77 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00d7f e8dcc8afff                     call       0x7f23ab6cda60
00d84 0f1f84007c0e0008               nop        dword ptr [rax + rax + 0x8000e7c]
00d8c 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
00d96 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d9a e8813ab419                     call       0x7f23c5714c20
00d9f f4                             hlt        
00da0 be45ffffff                     mov        esi, 0xffffff45
00da5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00dad 448b542408                     mov        r10d, dword ptr [rsp + 8]
00db2 44891424                       mov        dword ptr [rsp], r10d
00db6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00dbb 44895c2404                     mov        dword ptr [rsp + 4], r11d
00dc0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00dc5 4489542408                     mov        dword ptr [rsp + 8], r10d
00dca 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00dcf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00dd4 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00dd9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00dde 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00de3 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00de8 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00ded 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00df2 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00df7 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00dfc 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00e01 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00e06 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00e0b 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00e10 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00e15 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00e1a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00e1f 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00e24 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00e29 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00e2e 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00e33 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00e38 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00e3d 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00e42 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00e47 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00e4c 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00e54 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00e59 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00e61 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00e66 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00e6e 90                             nop        
00e6f e8ecc7afff                     call       0x7f23ab6cda60
00e74 0f1f84006c0f0009               nop        dword ptr [rax + rax + 0x9000f6c]
00e7c 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
00e86 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e8a e89139b419                     call       0x7f23c5714c20
00e8f f4                             hlt        
00e90 be45ffffff                     mov        esi, 0xffffff45
00e95 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e9d 448b542408                     mov        r10d, dword ptr [rsp + 8]
00ea2 44891424                       mov        dword ptr [rsp], r10d
00ea6 4489442408                     mov        dword ptr [rsp + 8], r8d
00eab e8b0c7afff                     call       0x7f23ab6cda60
00eb0 0f1f8400a80f000a               nop        dword ptr [rax + rax + 0xa000fa8]
00eb8 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
00ec2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00ec6 e85539b419                     call       0x7f23c5714c20
00ecb f4                             hlt        
00ecc be45ffffff                     mov        esi, 0xffffff45
00ed1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ed9 448b542408                     mov        r10d, dword ptr [rsp + 8]
00ede 44891424                       mov        dword ptr [rsp], r10d
00ee2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00ee7 44895c2404                     mov        dword ptr [rsp + 4], r11d
00eec 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00ef1 4489542408                     mov        dword ptr [rsp + 8], r10d
00ef6 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00efe 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f03 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f08 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f0d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00f12 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00f17 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00f1c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00f21 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00f26 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00f2b 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00f30 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00f35 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00f3a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00f3f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00f44 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00f49 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00f4e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00f53 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00f58 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00f5d 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00f62 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00f67 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00f6c 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00f71 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00f76 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00f7b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00f80 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00f85 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00f8d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00f92 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00f9a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00f9f e8bcc6afff                     call       0x7f23ab6cda60
00fa4 0f1f84009c10000b               nop        dword ptr [rax + rax + 0xb00109c]
00fac 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
00fb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00fba e86138b419                     call       0x7f23c5714c20
00fbf f4                             hlt        
00fc0 be45ffffff                     mov        esi, 0xffffff45
00fc5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00fcd 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00fd2 44891c24                       mov        dword ptr [rsp], r11d
00fd6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00fdb 4489542404                     mov        dword ptr [rsp + 4], r10d
00fe0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00fe5 44895c2408                     mov        dword ptr [rsp + 8], r11d
00fea 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00ff2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00ff7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ffc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01001 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01006 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0100b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01010 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01015 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0101a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0101f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01024 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01029 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0102e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01033 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01038 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0103d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01042 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01047 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0104c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01051 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01056 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0105b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01060 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01065 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0106a 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0106f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01074 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01079 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01081 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01086 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0108e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01093 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
0109b 4489542478                     mov        dword ptr [rsp + 0x78], r10d
010a0 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
010a8 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
010b0 90                             nop        
010b1 90                             nop        
010b2 90                             nop        
010b3 e8a8c5afff                     call       0x7f23ab6cda60
010b8 0f1f8400b011000c               nop        dword ptr [rax + rax + 0xc0011b0]
010c0 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
010ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
010ce e84d37b419                     call       0x7f23c5714c20
010d3 f4                             hlt        
010d4 be45ffffff                     mov        esi, 0xffffff45
010d9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
010e1 448b542408                     mov        r10d, dword ptr [rsp + 8]
010e6 44891424                       mov        dword ptr [rsp], r10d
010ea 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
010ef 44895c2404                     mov        dword ptr [rsp + 4], r11d
010f4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
010f9 4489542408                     mov        dword ptr [rsp + 8], r10d
010fe 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01106 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0110b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01110 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01115 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0111a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0111f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01124 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01129 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0112e 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01133 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01138 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0113d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01142 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01147 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0114c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01151 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01156 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0115b 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01160 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01165 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0116a 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0116f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01174 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01179 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0117e 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01183 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01188 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0118d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01195 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0119a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
011a2 4c89542468                     mov        qword ptr [rsp + 0x68], r10
011a7 448b9c24d4000000               mov        r11d, dword ptr [rsp + 0xd4]
011af 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
011b4 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
011bc 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
011c3 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
011cb e890c4afff                     call       0x7f23ab6cda60
011d0 0f1f8400c812000d               nop        dword ptr [rax + rax + 0xd0012c8]
011d8 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
011e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
011e6 e83536b419                     call       0x7f23c5714c20
011eb f4                             hlt        
011ec be45ffffff                     mov        esi, 0xffffff45
011f1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
011f9 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
011fe 44890c24                       mov        dword ptr [rsp], r9d
01202 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01207 44895c2404                     mov        dword ptr [rsp + 4], r11d
0120c 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01211 44894c2408                     mov        dword ptr [rsp + 8], r9d
01216 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0121b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01220 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01225 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0122a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0122f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01234 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01239 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0123e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01243 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01248 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0124d 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01252 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01257 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0125c 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01261 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01266 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0126b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01270 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01275 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0127a 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0127f 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01284 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01289 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0128e 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01293 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01298 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
012a0 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
012a5 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
012ad 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
012b2 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
012b7 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
012be 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
012c6 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
012ce 90                             nop        
012cf e88cc3afff                     call       0x7f23ab6cda60
012d4 0f1f8400cc13000e               nop        dword ptr [rax + rax + 0xe0013cc]
012dc 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
012e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
012ea e83135b419                     call       0x7f23c5714c20
012ef f4                             hlt        
012f0 41bbffffff7f                   mov        r11d, 0x7fffffff
012f6 4d3bcb                         cmp        r9, r11
012f9 bdffffffff                     mov        ebp, 0xffffffff
012fe 7c08                           jl         0x7f23abbd1708
01300 400f95c5                       setne      bpl
01304 400fb6ed                       movzx      ebp, bpl
01308 be45ffffff                     mov        esi, 0xffffff45
0130d 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
01315 4c891c24                       mov        qword ptr [rsp], r11
01319 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0131e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01323 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0132b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01330 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
01334 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01338 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0133d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01342 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
01346 894c2430                       mov        dword ptr [rsp + 0x30], ecx
0134a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0134f 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01354 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
01358 894c2438                       mov        dword ptr [rsp + 0x38], ecx
0135c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01361 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01366 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
0136a 894c2440                       mov        dword ptr [rsp + 0x40], ecx
0136e 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
01376 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0137b 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
0137f 894c2450                       mov        dword ptr [rsp + 0x50], ecx
01383 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01388 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
0138d 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
01391 894c2458                       mov        dword ptr [rsp + 0x58], ecx
01395 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0139a 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0139f 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
013a7 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
013ac 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
013b4 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
013b9 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
013c1 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
013c8 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
013d0 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
013d8 90                             nop        
013d9 90                             nop        
013da 90                             nop        
013db e880c2afff                     call       0x7f23ab6cda60
013e0 0f1f8400d814000f               nop        dword ptr [rax + rax + 0xf0014d8]
013e8 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
013f2 4883e4f0                       and        rsp, 0xfffffffffffffff0
013f6 e82534b419                     call       0x7f23c5714c20
013fb f4                             hlt        
013fc be45ffffff                     mov        esi, 0xffffff45
01401 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01409 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0140e 44891c24                       mov        dword ptr [rsp], r11d
01412 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01417 44895c2404                     mov        dword ptr [rsp + 4], r11d
0141c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01421 44895c2408                     mov        dword ptr [rsp + 8], r11d
01426 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0142b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01430 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01435 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0143a 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0143f 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01444 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01449 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0144e 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01453 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01458 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0145d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01462 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01467 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0146c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01471 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01476 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0147b 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01480 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01485 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0148a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0148f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01494 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01499 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0149e 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
014a3 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
014a8 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
014b0 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
014b5 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
014ba 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
014c2 90                             nop        
014c3 e898c1afff                     call       0x7f23ab6cda60
014c8 0f1f8400c0150010               nop        dword ptr [rax + rax + 0x100015c0]
014d0 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
014da 4883e4f0                       and        rsp, 0xfffffffffffffff0
014de e83d33b419                     call       0x7f23c5714c20
014e3 f4                             hlt        
014e4 be45ffffff                     mov        esi, 0xffffff45
014e9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014f1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
014f6 44891c24                       mov        dword ptr [rsp], r11d
014fa 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
014ff 44895c2404                     mov        dword ptr [rsp + 4], r11d
01504 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01509 44895c2408                     mov        dword ptr [rsp + 8], r11d
0150e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01513 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01518 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0151d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01522 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01527 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0152c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01531 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01536 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0153b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01540 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01545 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0154a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0154f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01554 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01559 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0155e 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01563 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01568 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0156d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01572 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01577 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0157c 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01581 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01586 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0158b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01590 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01598 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0159d 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
015a2 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
015a9 90                             nop        
015aa 90                             nop        
015ab e8b0c0afff                     call       0x7f23ab6cda60
015b0 0f1f8400a8160011               nop        dword ptr [rax + rax + 0x110016a8]
015b8 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
015c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
015c6 e85532b419                     call       0x7f23c5714c20
015cb f4                             hlt        
015cc be3dffffff                     mov        esi, 0xffffff3d
015d1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015d9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
015de 44891c24                       mov        dword ptr [rsp], r11d
015e2 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
015e6 894c2404                       mov        dword ptr [rsp + 4], ecx
015ea 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
015ef 44895c2408                     mov        dword ptr [rsp + 8], r11d
015f4 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
015f9 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
015fe 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
01602 894c240c                       mov        dword ptr [rsp + 0xc], ecx
01606 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0160b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01610 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
01614 894c2424                       mov        dword ptr [rsp + 0x24], ecx
01618 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0161d 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01622 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
01626 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
0162a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0162f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01634 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
01638 894c2434                       mov        dword ptr [rsp + 0x34], ecx
0163c 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01641 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01646 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
0164d 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
01651 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01656 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0165b 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
0165f 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
01663 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01668 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0166d 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01672 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01677 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
0167f 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
01684 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
0168c 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
01691 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01696 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
0169e 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
016a5 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
016ad 90                             nop        
016ae 90                             nop        
016af e8acbfafff                     call       0x7f23ab6cda60
016b4 0f1f8400ac170012               nop        dword ptr [rax + rax + 0x120017ac]
016bc 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
016c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
016ca e85131b419                     call       0x7f23c5714c20
016cf f4                             hlt        
016d0 be45ffffff                     mov        esi, 0xffffff45
016d5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
016dd 448b542408                     mov        r10d, dword ptr [rsp + 8]
016e2 44891424                       mov        dword ptr [rsp], r10d
016e6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
016eb 4489542404                     mov        dword ptr [rsp + 4], r10d
016f0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
016f5 44895c2408                     mov        dword ptr [rsp + 8], r11d
016fa 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016ff 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01704 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01709 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0170e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01713 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01718 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0171d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01722 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01727 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0172c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01731 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01736 894c2430                       mov        dword ptr [rsp + 0x30], ecx
0173a 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0173f 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01744 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
01749 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
0174e 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01752 90                             nop        
01753 e808bfafff                     call       0x7f23ab6cda60
01758 0f1f840050180013               nop        dword ptr [rax + rax + 0x13001850]
01760 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
0176a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0176e e8ad30b419                     call       0x7f23c5714c20
01773 f4                             hlt        
01774 be45ffffff                     mov        esi, 0xffffff45
01779 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01781 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01786 44890c24                       mov        dword ptr [rsp], r9d
0178a 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0178f 44894c2404                     mov        dword ptr [rsp + 4], r9d
01794 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01799 44895c2408                     mov        dword ptr [rsp + 8], r11d
0179e 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
017a3 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
017a8 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
017ad 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
017b2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
017b7 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
017bc 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
017c1 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
017c6 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
017cb 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
017d0 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
017d5 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
017da 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
017df 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
017e4 4489542454                     mov        dword ptr [rsp + 0x54], r10d
017e9 4489442458                     mov        dword ptr [rsp + 0x58], r8d
017ee 90                             nop        
017ef e86cbeafff                     call       0x7f23ab6cda60
017f4 0f1f8400ec180014               nop        dword ptr [rax + rax + 0x140018ec]
017fc 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01806 4883e4f0                       and        rsp, 0xfffffffffffffff0
0180a e81130b419                     call       0x7f23c5714c20
0180f f4                             hlt        
01810 be45ffffff                     mov        esi, 0xffffff45
01815 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0181d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01822 44891c24                       mov        dword ptr [rsp], r11d
01826 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0182b 4489542404                     mov        dword ptr [rsp + 4], r10d
01830 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01835 44895c2408                     mov        dword ptr [rsp + 8], r11d
0183a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0183f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01844 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01849 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0184e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01853 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01858 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0185d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01862 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01867 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0186c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01871 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01876 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0187b 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01880 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01885 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0188a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0188f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01894 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01899 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0189e 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
018a3 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
018a8 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
018ad 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
018b2 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
018b7 4c89542458                     mov        qword ptr [rsp + 0x58], r10
018bc 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
018c4 4c89542460                     mov        qword ptr [rsp + 0x60], r10
018c9 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
018d1 4c89542468                     mov        qword ptr [rsp + 0x68], r10
018d6 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
018de 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
018e6 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
018ed 90                             nop        
018ee 90                             nop        
018ef e86cbdafff                     call       0x7f23ab6cda60
018f4 0f1f8400ec190015               nop        dword ptr [rax + rax + 0x150019ec]
018fc 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01906 4883e4f0                       and        rsp, 0xfffffffffffffff0
0190a e8112fb419                     call       0x7f23c5714c20
0190f f4                             hlt        
01910 4585c0                         test       r8d, r8d
01913 7f08                           jg         0x7f23abbd1d1d
01915 4533ed                         xor        r13d, r13d
01918 e9a2e7ffff                     jmp        0x7f23abbd04bf
0191d 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01921 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01926 897c241c                       mov        dword ptr [rsp + 0x1c], edi
0192a 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0192f 89442414                       mov        dword ptr [rsp + 0x14], eax
01933 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01937 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0193c 48894424f8                     mov        qword ptr [rsp - 8], rax
01941 8b0424                         mov        eax, dword ptr [rsp]
01944 89442404                       mov        dword ptr [rsp + 4], eax
01948 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0194d 48894424f8                     mov        qword ptr [rsp - 8], rax
01952 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01959 890424                         mov        dword ptr [rsp], eax
0195c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01961 488bee                         mov        rbp, rsi
01964 8b542408                       mov        edx, dword ptr [rsp + 8]
01968 418bc8                         mov        ecx, r8d
0196b e8f0deb5ff                     call       0x7f23ab72fc60
01970 0f1f8400681a0016               nop        dword ptr [rax + rax + 0x16001a68]
01978 41bb40000000                   mov        r11d, 0x40
0197e 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
01983 c462a1f7e8                     shlx       r13, rax, r11
01988 48894424f8                     mov        qword ptr [rsp - 8], rax
0198d 8b442404                       mov        eax, dword ptr [rsp + 4]
01991 890424                         mov        dword ptr [rsp], eax
01994 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01999 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
0199e 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
019a2 8b442414                       mov        eax, dword ptr [rsp + 0x14]
019a6 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
019ab 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
019af 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
019b4 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
019b8 e902e7ffff                     jmp        0x7f23abbd04bf
019bd 4585c0                         test       r8d, r8d
019c0 7f07                           jg         0x7f23abbd1dc9
019c2 33f6                           xor        esi, esi
019c4 e937e7ffff                     jmp        0x7f23abbd0500
019c9 4489542438                     mov        dword ptr [rsp + 0x38], r10d
019ce 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
019d3 8954242c                       mov        dword ptr [rsp + 0x2c], edx
019d7 4489742428                     mov        dword ptr [rsp + 0x28], r14d
019dc 897c241c                       mov        dword ptr [rsp + 0x1c], edi
019e0 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
019e5 89442414                       mov        dword ptr [rsp + 0x14], eax
019e9 895c2410                       mov        dword ptr [rsp + 0x10], ebx
019ed 448944240c                     mov        dword ptr [rsp + 0xc], r8d
019f2 48894424f8                     mov        qword ptr [rsp - 8], rax
019f7 8b0424                         mov        eax, dword ptr [rsp]
019fa 89442404                       mov        dword ptr [rsp + 4], eax
019fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a03 48894424f8                     mov        qword ptr [rsp - 8], rax
01a08 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a0f 890424                         mov        dword ptr [rsp], eax
01a12 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a17 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a1f 488bf5                         mov        rsi, rbp
01a22 8b542408                       mov        edx, dword ptr [rsp + 8]
01a26 418bc8                         mov        ecx, r8d
01a29 90                             nop        
01a2a 90                             nop        
01a2b e830deb5ff                     call       0x7f23ab72fc60
01a30 0f1f8400281b0017               nop        dword ptr [rax + rax + 0x17001b28]
01a38 41bb80000000                   mov        r11d, 0x80
01a3e 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
01a43 c4e2a1f7f0                     shlx       rsi, rax, r11
01a48 48894424f8                     mov        qword ptr [rsp - 8], rax
01a4d 8b442404                       mov        eax, dword ptr [rsp + 4]
01a51 890424                         mov        dword ptr [rsp], eax
01a54 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a59 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
01a5d 8b442414                       mov        eax, dword ptr [rsp + 0x14]
01a61 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
01a65 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
01a6a 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01a6e 4c8b6c2430                     mov        r13, qword ptr [rsp + 0x30]
01a73 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01a78 e983e6ffff                     jmp        0x7f23abbd0500
01a7d 4533c0                         xor        r8d, r8d
01a80 e986efffff                     jmp        0x7f23abbd0e0b
01a85 bee4ffffff                     mov        esi, 0xffffffe4
01a8a 48ffb42490000000               push       qword ptr [rsp + 0x90]
01a92 488f0424                       pop        qword ptr [rsp]
01a96 90                             nop        
01a97 e8c4bbafff                     call       0x7f23ab6cda60
01a9c 0f1f8400941b0018               nop        dword ptr [rax + rax + 0x18001b94]
01aa4 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01aae 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ab2 e8692db419                     call       0x7f23c5714c20
01ab7 f4                             hlt        
01ab8 be5d000000                     mov        esi, 0x5d
01abd 90                             nop        
01abe 90                             nop        
01abf e89cbbafff                     call       0x7f23ab6cda60
01ac4 0f1f8400bc1b0019               nop        dword ptr [rax + rax + 0x19001bbc]
01acc 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01ad6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ada e8412db419                     call       0x7f23c5714c20
01adf f4                             hlt        
01ae0 bef6ffffff                     mov        esi, 0xfffffff6
01ae5 90                             nop        
01ae6 90                             nop        
01ae7 e874bbafff                     call       0x7f23ab6cda60
01aec 0f1f8400e41b001a               nop        dword ptr [rax + rax + 0x1a001be4]
01af4 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01afe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b02 e8192db419                     call       0x7f23c5714c20
01b07 f4                             hlt        
01b08 bef6ffffff                     mov        esi, 0xfffffff6
01b0d 90                             nop        
01b0e 90                             nop        
01b0f e84cbbafff                     call       0x7f23ab6cda60
01b14 0f1f84000c1c001b               nop        dword ptr [rax + rax + 0x1b001c0c]
01b1c 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01b26 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b2a e8f12cb419                     call       0x7f23c5714c20
01b2f f4                             hlt        
01b30 be6effffff                     mov        esi, 0xffffff6e
01b35 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b3d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01b42 44891c24                       mov        dword ptr [rsp], r11d
01b46 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01b4b 44895c2408                     mov        dword ptr [rsp + 8], r11d
01b50 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b55 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b5a 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01b5f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01b64 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b69 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01b6e 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01b73 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01b78 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01b7d 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01b82 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01b87 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01b8c 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01b91 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01b96 90                             nop        
01b97 e8c4baafff                     call       0x7f23ab6cda60
01b9c 0f1f8400941c001c               nop        dword ptr [rax + rax + 0x1c001c94]
01ba4 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01bae 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bb2 e8692cb419                     call       0x7f23c5714c20
01bb7 f4                             hlt        
01bb8 bee4ffffff                     mov        esi, 0xffffffe4
01bbd 48ffb42490000000               push       qword ptr [rsp + 0x90]
01bc5 488f0424                       pop        qword ptr [rsp]
01bc9 89442418                       mov        dword ptr [rsp + 0x18], eax
01bcd 48894424f8                     mov        qword ptr [rsp - 8], rax
01bd2 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01bd9 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01bdd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01be2 897c2428                       mov        dword ptr [rsp + 0x28], edi
01be6 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01bea 90                             nop        
01beb e870baafff                     call       0x7f23ab6cda60
01bf0 0f1f8400e81c001d               nop        dword ptr [rax + rax + 0x1d001ce8]
01bf8 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01c02 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c06 e8152cb419                     call       0x7f23c5714c20
01c0b f4                             hlt        
01c0c bee4ffffff                     mov        esi, 0xffffffe4
01c11 48ffb42490000000               push       qword ptr [rsp + 0x90]
01c19 488f0424                       pop        qword ptr [rsp]
01c1d 48894424f8                     mov        qword ptr [rsp - 8], rax
01c22 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c29 89442418                       mov        dword ptr [rsp + 0x18], eax
01c2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c32 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01c36 89542428                       mov        dword ptr [rsp + 0x28], edx
01c3a 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01c3f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01c44 90                             nop        
01c45 90                             nop        
01c46 90                             nop        
01c47 e814baafff                     call       0x7f23ab6cda60
01c4c 0f1f8400441d001e               nop        dword ptr [rax + rax + 0x1e001d44]
01c54 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01c5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c62 e8b92bb419                     call       0x7f23c5714c20
01c67 f4                             hlt        
01c68 bebeffffff                     mov        esi, 0xffffffbe
01c6d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c75 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01c7a 44891c24                       mov        dword ptr [rsp], r11d
01c7e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01c83 44895c2408                     mov        dword ptr [rsp + 8], r11d
01c88 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c8d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c92 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01c97 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01c9c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ca1 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01ca6 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01cab 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01cb0 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01cb5 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01cba 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01cbf 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01cc4 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01cc9 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01cce 90                             nop        
01ccf e88cb9afff                     call       0x7f23ab6cda60
01cd4 0f1f8400cc1d001f               nop        dword ptr [rax + rax + 0x1f001dcc]
01cdc 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01ce6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cea e8312bb419                     call       0x7f23c5714c20
01cef f4                             hlt        
01cf0 beccffffff                     mov        esi, 0xffffffcc
01cf5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01cfd 448b542408                     mov        r10d, dword ptr [rsp + 8]
01d02 44891424                       mov        dword ptr [rsp], r10d
01d06 89442410                       mov        dword ptr [rsp + 0x10], eax
01d0a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d0f 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d16 89442414                       mov        dword ptr [rsp + 0x14], eax
01d1a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d1f 897c2418                       mov        dword ptr [rsp + 0x18], edi
01d23 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01d27 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
01d2b e830b9afff                     call       0x7f23ab6cda60
01d30 0f1f8400281e0020               nop        dword ptr [rax + rax + 0x20001e28]
01d38 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01d42 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d46 e8d52ab419                     call       0x7f23c5714c20
01d4b f4                             hlt        
01d4c beccffffff                     mov        esi, 0xffffffcc
01d51 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d59 448b442408                     mov        r8d, dword ptr [rsp + 8]
01d5e 44890424                       mov        dword ptr [rsp], r8d
01d62 48894424f8                     mov        qword ptr [rsp - 8], rax
01d67 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d6e 89442410                       mov        dword ptr [rsp + 0x10], eax
01d72 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d77 897c2414                       mov        dword ptr [rsp + 0x14], edi
01d7b 89542418                       mov        dword ptr [rsp + 0x18], edx
01d7f 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
01d84 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01d89 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01d8d 90                             nop        
01d8e 90                             nop        
01d8f e8ccb8afff                     call       0x7f23ab6cda60
01d94 0f1f84008c1e0021               nop        dword ptr [rax + rax + 0x21001e8c]
01d9c 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01da6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01daa e8712ab419                     call       0x7f23c5714c20
01daf f4                             hlt        
01db0 be45ffffff                     mov        esi, 0xffffff45
01db5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01dbd 448b542408                     mov        r10d, dword ptr [rsp + 8]
01dc2 44891424                       mov        dword ptr [rsp], r10d
01dc6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01dcb 4489542408                     mov        dword ptr [rsp + 8], r10d
01dd0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01dd5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01dda 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ddf 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01de4 90                             nop        
01de5 90                             nop        
01de6 90                             nop        
01de7 e874b8afff                     call       0x7f23ab6cda60
01dec 0f1f8400e41e0022               nop        dword ptr [rax + rax + 0x22001ee4]
01df4 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01dfe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e02 e8192ab419                     call       0x7f23c5714c20
01e07 f4                             hlt        
01e08 be45ffffff                     mov        esi, 0xffffff45
01e0d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e15 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01e1a 44891c24                       mov        dword ptr [rsp], r11d
01e1e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01e23 44895c2408                     mov        dword ptr [rsp + 8], r11d
01e28 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e2d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e32 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01e37 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01e3c 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01e41 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01e46 90                             nop        
01e47 e814b8afff                     call       0x7f23ab6cda60
01e4c 0f1f8400441f0023               nop        dword ptr [rax + rax + 0x23001f44]
01e54 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01e5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e62 e8b929b419                     call       0x7f23c5714c20
01e67 f4                             hlt        
01e68 bef6ffffff                     mov        esi, 0xfffffff6
01e6d 90                             nop        
01e6e 90                             nop        
01e6f e8ecb7afff                     call       0x7f23ab6cda60
01e74 0f1f84006c1f0024               nop        dword ptr [rax + rax + 0x24001f6c]
01e7c 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01e86 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e8a e89129b419                     call       0x7f23c5714c20
01e8f f4                             hlt        
01e90 be5d000000                     mov        esi, 0x5d
01e95 90                             nop        
01e96 90                             nop        
01e97 e8c4b7afff                     call       0x7f23ab6cda60
01e9c 0f1f8400941f0025               nop        dword ptr [rax + rax + 0x25001f94]
01ea4 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01eae 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eb2 e86929b419                     call       0x7f23c5714c20
01eb7 f4                             hlt        
01eb8 be45ffffff                     mov        esi, 0xffffff45
01ebd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ec5 448b542408                     mov        r10d, dword ptr [rsp + 8]
01eca 44891424                       mov        dword ptr [rsp], r10d
01ece 90                             nop        
01ecf e88cb7afff                     call       0x7f23ab6cda60
01ed4 0f1f8400cc1f0026               nop        dword ptr [rax + rax + 0x26001fcc]
01edc 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01ee6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eea e83129b419                     call       0x7f23c5714c20
01eef f4                             hlt        
01ef0 bef6ffffff                     mov        esi, 0xfffffff6
01ef5 418be8                         mov        ebp, r8d
01ef8 90                             nop        
01ef9 90                             nop        
01efa 90                             nop        
01efb e860b7afff                     call       0x7f23ab6cda60
01f00 0f1f8400f81f0027               nop        dword ptr [rax + rax + 0x27001ff8]
01f08 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01f12 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f16 e80529b419                     call       0x7f23c5714c20
01f1b f4                             hlt        
01f1c bef6ffffff                     mov        esi, 0xfffffff6
01f21 8be9                           mov        ebp, ecx
01f23 e838b7afff                     call       0x7f23ab6cda60
01f28 0f1f840020200028               nop        dword ptr [rax + rax + 0x28002020]
01f30 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01f3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f3e e8dd28b419                     call       0x7f23c5714c20
01f43 f4                             hlt        
01f44 bef6ffffff                     mov        esi, 0xfffffff6
01f49 418be8                         mov        ebp, r8d
01f4c 90                             nop        
01f4d 90                             nop        
01f4e 90                             nop        
01f4f e80cb7afff                     call       0x7f23ab6cda60
01f54 0f1f84004c200029               nop        dword ptr [rax + rax + 0x2900204c]
01f5c 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01f66 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f6a e8b128b419                     call       0x7f23c5714c20
01f6f f4                             hlt        
01f70 bef6ffffff                     mov        esi, 0xfffffff6
01f75 90                             nop        
01f76 90                             nop        
01f77 e8e4b6afff                     call       0x7f23ab6cda60
01f7c 0f1f84007420002a               nop        dword ptr [rax + rax + 0x2a002074]
01f84 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01f8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f92 e88928b419                     call       0x7f23c5714c20
01f97 f4                             hlt        
01f98 bef6ffffff                     mov        esi, 0xfffffff6
01f9d 90                             nop        
01f9e 90                             nop        
01f9f e8bcb6afff                     call       0x7f23ab6cda60
01fa4 0f1f84009c20002b               nop        dword ptr [rax + rax + 0x2b00209c]
01fac 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01fb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fba e86128b419                     call       0x7f23c5714c20
01fbf f4                             hlt        
01fc0 bef6ffffff                     mov        esi, 0xfffffff6
01fc5 90                             nop        
01fc6 90                             nop        
01fc7 e894b6afff                     call       0x7f23ab6cda60
01fcc 0f1f8400c420002c               nop        dword ptr [rax + rax + 0x2c0020c4]
01fd4 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
01fde 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fe2 e83928b419                     call       0x7f23c5714c20
01fe7 f4                             hlt        
01fe8 bef6ffffff                     mov        esi, 0xfffffff6
01fed 90                             nop        
01fee 90                             nop        
01fef e86cb6afff                     call       0x7f23ab6cda60
01ff4 0f1f8400ec20002d               nop        dword ptr [rax + rax + 0x2d0020ec]
01ffc 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
02006 4883e4f0                       and        rsp, 0xfffffffffffffff0
0200a e81128b419                     call       0x7f23c5714c20
0200f f4                             hlt        
02010 bef6ffffff                     mov        esi, 0xfffffff6
02015 90                             nop        
02016 90                             nop        
02017 e844b6afff                     call       0x7f23ab6cda60
0201c 0f1f84001421002e               nop        dword ptr [rax + rax + 0x2e002114]
02024 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
0202e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02032 e8e927b419                     call       0x7f23c5714c20
02037 f4                             hlt        
02038 bef6ffffff                     mov        esi, 0xfffffff6
0203d 90                             nop        
0203e 90                             nop        
0203f e81cb6afff                     call       0x7f23ab6cda60
02044 0f1f84003c21002f               nop        dword ptr [rax + rax + 0x2f00213c]
0204c 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
02056 4883e4f0                       and        rsp, 0xfffffffffffffff0
0205a e8c127b419                     call       0x7f23c5714c20
0205f f4                             hlt        
02060 bef6ffffff                     mov        esi, 0xfffffff6
02065 90                             nop        
02066 90                             nop        
02067 e8f4b5afff                     call       0x7f23ab6cda60
0206c 0f1f840064210030               nop        dword ptr [rax + rax + 0x30002164]
02074 48bf80722284237f0000           movabs     rdi, 0x7f2384227280
0207e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02082 e89927b419                     call       0x7f23c5714c20
02087 f4                             hlt        
02088 eb08                           jmp        0x7f23abbd2492
0208a eb06                           jmp        0x7f23abbd2492
0208c eb04                           jmp        0x7f23abbd2492
0208e eb02                           jmp        0x7f23abbd2492
02090 eb00                           jmp        0x7f23abbd2492
02092 488bf0                         mov        rsi, rax
02095 e9aee9ffff                     jmp        0x7f23abbd0e48
0209a 49ba730ebdab237f0000           movabs     r10, 0x7f23abbd0e73
020a4 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
020ab e9b0feb5ff                     jmp        0x7f23ab732360
020b0 e82bcdb4ff                     call       0x7f23ab71f1e0
020b5 e964dfffff                     jmp        0x7f23abbd041e
020ba f4                             hlt        
020bb f4                             hlt        
020bc f4                             hlt        
020bd f4                             hlt        
020be f4                             hlt        
020bf f4                             hlt        
