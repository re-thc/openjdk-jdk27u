00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85261e0000                   jne        0x7fd333e5e4c4
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
00050 0f83bb190000                   jae        0x7fd333e5e091
00056 440fb6441607                   movzx      r8d, byte ptr [rsi + rdx + 7]
0005c 4585c0                         test       r8d, r8d
0005f 0f84cb190000                   je         0x7fd333e5e0b0
00065 448bda                         mov        r11d, edx
00068 442bd9                         sub        r11d, ecx
0006b 8b1c24                         mov        ebx, dword ptr [rsp]
0006e 83c3f9                         add        ebx, -7
00071 8d42f8                         lea        eax, [rdx - 8]
00074 468d0cdd00000000               lea        r9d, [r11*8]
0007c f3450fbdd0                     lzcnt      r10d, r8d
00081 41be1f000000                   mov        r14d, 0x1f
00087 452bf2                         sub        r14d, r10d
0008a bf08000000                     mov        edi, 8
0008f 412bfe                         sub        edi, r14d
00092 418bd1                         mov        edx, r9d
00095 2bd7                           sub        edx, edi
00097 4183fb08                       cmp        r11d, 8
0009b 0f8cfb170000                   jl         0x7fd333e5df1c
000a1 85db                           test       ebx, ebx
000a3 0f8c331b0000                   jl         0x7fd333e5e25c
000a9 8b2c24                         mov        ebp, dword ptr [rsp]
000ac 83c5f9                         add        ebp, -7
000af 3bc5                           cmp        eax, ebp
000b1 0f83291a0000                   jae        0x7fd333e5e160
000b7 448bc0                         mov        r8d, eax
000ba 4e8b6c0608                     mov        r13, qword ptr [rsi + r8 + 8]
000bf 4183c3f8                       add        r11d, -8
000c3 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000cb 4183c2f0                       add        r10d, -0x10
000cf 4183fb08                       cmp        r11d, 8
000d3 0f8c70180000                   jl         0x7fd333e5dfc9
000d9 85db                           test       ebx, ebx
000db 0f8c3f1b0000                   jl         0x7fd333e5e2a0
000e1 8b2c24                         mov        ebp, dword ptr [rsp]
000e4 83c5f9                         add        ebp, -7
000e7 443bd5                         cmp        r10d, ebp
000ea 0f83301a0000                   jae        0x7fd333e5e1a0
000f0 458bda                         mov        r11d, r10d
000f3 4c8b842490000000               mov        r8, qword ptr [rsp + 0x90]
000fb 4b8b741808                     mov        rsi, qword ptr [r8 + r11 + 8]
00100 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
00105 448b4518                       mov        r8d, dword ptr [rbp + 0x18]
00109 4585c0                         test       r8d, r8d
0010c 0f8432190000                   je         0x7fd333e5e0c4
00112 448b5d1c                       mov        r11d, dword ptr [rbp + 0x1c]
00116 418b4b04                       mov        ecx, dword ptr [r11 + 4]
0011a 448b4d20                       mov        r9d, dword ptr [rbp + 0x20]
0011e 4585c9                         test       r9d, r9d
00121 0f8431190000                   je         0x7fd333e5e0d8
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
00190 0f84d3080000                   je         0x7fd333e5d0e9
00196 be40000000                     mov        esi, 0x40
0019b 2bf7                           sub        esi, edi
0019d 3bce                           cmp        ecx, esi
0019f 0f8f1a020000                   jg         0x7fd333e5ca3f
001a5 2bf1                           sub        esi, ecx
001a7 c4c2cbf7ed                     shrx       rbp, r13, rsi
001ac 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b1 83f940                         cmp        ecx, 0x40
001b4 0f8d6e1b0000                   jge        0x7fd333e5e3a8
001ba 41bb01000000                   mov        r11d, 1
001c0 c4c2f1f7eb                     shlx       rbp, r11, rcx
001c5 48ffcd                         dec        rbp
001c8 48236c2460                     and        rbp, qword ptr [rsp + 0x60]
001cd 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001d2 448bd9                         mov        r11d, ecx
001d5 458bcb                         mov        r9d, r11d
001d8 442b4c240c                     sub        r9d, dword ptr [rsp + 0xc]
001dd 458d5108                       lea        r10d, [r9 + 8]
001e1 4183fa40                       cmp        r10d, 0x40
001e5 7c34                           jl         0x7fd333e5c89b
001e7 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
001ec 4183c1c8                       add        r9d, -0x38
001f0 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001f5 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
001fd 8b542408                       mov        edx, dword ptr [rsp + 8]
00201 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00205 6690                           nop        
00207 e8d4efa9ff                     call       0x7fd3338fb860
0020c 0f1f840004030000               nop        dword ptr [rax + rax + 0x304]
00214 4889442420                     mov        qword ptr [rsp + 0x20], rax
00219 eb31                           jmp        0x7fd333e5c8cc
0021b 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
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
0025e 0f8d0c1a0000                   jge        0x7fd333e5e2f0
00264 c462a3f7542460                 shrx       r10, qword ptr [rsp + 0x60], r11
0026b 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00270 41bb01000000                   mov        r11d, 1
00276 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0027b c44229f7db                     shlx       r11d, r11d, r10d
00280 41ffcb                         dec        r11d
00283 4d63d3                         movsxd     r10, r11d
00286 4c23542460                     and        r10, qword ptr [rsp + 0x60]
0028b 458bd2                         mov        r10d, r10d
0028e 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00293 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00298 458b5b04                       mov        r11d, dword ptr [r11 + 4]
0029c 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
002a1 4183fb20                       cmp        r11d, 0x20
002a5 0f8d091a0000                   jge        0x7fd333e5e334
002ab 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
002b3 458b5204                       mov        r10d, dword ptr [r10 + 4]
002b7 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
002bf 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
002c4 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
002c8 458b4304                       mov        r8d, dword ptr [r11 + 4]
002cc 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
002d1 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
002d5 458b4a04                       mov        r9d, dword ptr [r10 + 4]
002d9 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
002de 458b5314                       mov        r10d, dword ptr [r11 + 0x14]
002e2 458b5204                       mov        r10d, dword ptr [r10 + 4]
002e6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
002eb 4585db                         test       r11d, r11d
002ee 0f8e15170000                   jle        0x7fd333e5e089
002f4 41ffc8                         dec        r8d
002f7 4489442464                     mov        dword ptr [rsp + 0x64], r8d
002fc 41ffc9                         dec        r9d
002ff 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
00304 41ffca                         dec        r10d
00307 4489542474                     mov        dword ptr [rsp + 0x74], r10d
0030c 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00311 c462a3f7542468                 shrx       r10, qword ptr [rsp + 0x68], r11
00318 41bb01000000                   mov        r11d, 1
0031e 8b6c2460                       mov        ebp, dword ptr [rsp + 0x60]
00322 c44251f7db                     shlx       r11d, r11d, ebp
00327 458bc2                         mov        r8d, r10d
0032a 4489442460                     mov        dword ptr [rsp + 0x60], r8d
0032f 41ffcb                         dec        r11d
00332 4d63d3                         movsxd     r10, r11d
00335 4c23542468                     and        r10, qword ptr [rsp + 0x68]
0033a 458bd2                         mov        r10d, r10d
0033d 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00342 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0034a 458b9af4000000                 mov        r11d, dword ptr [r10 + 0xf4]
00351 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00359 458b92f0000000                 mov        r10d, dword ptr [r10 + 0xf0]
00360 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00368 458b5204                       mov        r10d, dword ptr [r10 + 4]
0036c 4585d2                         test       r10d, r10d
0036f 0f86f7160000                   jbe        0x7fd333e5e0ec
00375 4d63d2                         movsxd     r10, r10d
00378 4c635c244c                     movsxd     r11, dword ptr [rsp + 0x4c]
0037d 49ffcb                         dec        r11
00380 4d3bda                         cmp        r11, r10
00383 0f83e3160000                   jae        0x7fd333e5e0ec
00389 448b542404                     mov        r10d, dword ptr [rsp + 4]
0038e 4585d2                         test       r10d, r10d
00391 0f8cd1170000                   jl         0x7fd333e5e1e8
00397 8b2c24                         mov        ebp, dword ptr [rsp]
0039a 83c5f9                         add        ebp, -7
0039d 89ac24c4000000                 mov        dword ptr [rsp + 0xc4], ebp
003a4 4533d2                         xor        r10d, r10d
003a7 4533db                         xor        r11d, r11d
003aa 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
003b2 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
003ba e985020000                     jmp        0x7fd333e5ccc4
003bf 8be9                           mov        ebp, ecx
003c1 2bee                           sub        ebp, esi
003c3 e818eea9ff                     call       0x7fd3338fb860
003c8 0f1f8400c0040001               nop        dword ptr [rax + rax + 0x10004c0]
003d0 4823442428                     and        rax, qword ptr [rsp + 0x28]
003d5 41ba40000000                   mov        r10d, 0x40
003db 442bd5                         sub        r10d, ebp
003de c462d1f7d8                     shlx       r11, rax, rbp
003e3 c462abf7942498000000           shrx       r10, qword ptr [rsp + 0x98], r10
003ed 4d0bda                         or         r11, r10
003f0 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
003f5 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
003fa e9d6fdffff                     jmp        0x7fd333e5c855
003ff 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00407 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
0040c 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00411 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00419 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0041e 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
00422 896c2410                       mov        dword ptr [rsp + 0x10], ebp
00426 66660f1f840000000000           nop        word ptr [rax + rax]
00430 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00437 83fd40                         cmp        ebp, 0x40
0043a 0f8df4090000                   jge        0x7fd333e5d4b4
00440 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0044a 41ba01000000                   mov        r10d, 1
00450 c442d1f7d2                     shlx       r10, r10, rbp
00455 49ffca                         dec        r10
00458 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00460 458bc2                         mov        r8d, r10d
00463 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0046a 83fd40                         cmp        ebp, 0x40
0046d 0f8da10a0000                   jge        0x7fd333e5d594
00473 c4c2d3f7f9                     shrx       rdi, r9, rbp
00478 41ba01000000                   mov        r10d, 1
0047e c442d1f7d2                     shlx       r10, r10, rbp
00483 49ffca                         dec        r10
00486 4d23d1                         and        r10, r9
00489 418bda                         mov        ebx, r10d
0048c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00493 83fd40                         cmp        ebp, 0x40
00496 0f8d780b0000                   jge        0x7fd333e5d694
0049c c4e2d3f7cf                     shrx       rcx, rdi, rbp
004a1 41ba01000000                   mov        r10d, 1
004a7 c442d1f7d2                     shlx       r10, r10, rbp
004ac 49ffca                         dec        r10
004af 4c23d7                         and        r10, rdi
004b2 458bd2                         mov        r10d, r10d
004b5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004bc 83fd40                         cmp        ebp, 0x40
004bf 0f8d530c0000                   jge        0x7fd333e5d798
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
004ef 4c63d9                         movsxd     r11, ecx
004f2 488b9c2480000000               mov        rbx, qword ptr [rsp + 0x80]
004fa 8bdb                           mov        ebx, ebx
004fc 4c03cb                         add        r9, rbx
004ff 488b9c24e8000000               mov        rbx, qword ptr [rsp + 0xe8]
00507 4903db                         add        rbx, r11
0050a 48899c24e8000000               mov        qword ptr [rsp + 0xe8], rbx
00512 4d85c9                         test       r9, r9
00515 0f8e29070000                   jle        0x7fd333e5d2c4
0051b 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00522 0f8fe00c0000                   jg         0x7fd333e5d888
00528 4181faffff0100                 cmp        r10d, 0x1ffff
0052f 0f8fcb0d0000                   jg         0x7fd333e5d980
00535 81f9ffff0300                   cmp        ecx, 0x3ffff
0053b 0f8f930e0000                   jg         0x7fd333e5da54
00541 418bd9                         mov        ebx, r9d
00544 81fb00000010                   cmp        ebx, 0x10000000
0054a 0f83580f0000                   jae        0x7fd333e5db28
00550 4d63d2                         movsxd     r10, r10d
00553 4c63cb                         movsxd     r9, ebx
00556 49c1e312                       shl        r11, 0x12
0055a 49c1e124                       shl        r9, 0x24
0055e 4d0bcb                         or         r9, r11
00561 4d0bca                         or         r9, r10
00564 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
0056c 448b9c24f0000000               mov        r11d, dword ptr [rsp + 0xf0]
00574 4f894cda08                     mov        qword ptr [r10 + r11*8 + 8], r9
00579 8b2c24                         mov        ebp, dword ptr [rsp]
0057c 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00580 0f8dad000000                   jge        0x7fd333e5ccb3
00586 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
0058e 49c1eb30                       shr        r11, 0x30
00592 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00597 49c1ea30                       shr        r10, 0x30
0059b 418bcb                         mov        ecx, r11d
0059e 458bd2                         mov        r10d, r10d
005a1 448b8c24cc000000               mov        r9d, dword ptr [rsp + 0xcc]
005a9 c44233f7c8                     shrx       r9d, r8d, r9d
005ae 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
005b6 44039c24c8000000               add        r11d, dword ptr [rsp + 0xc8]
005be c4c223f7d8                     shrx       ebx, r8d, r11d
005c3 4403d3                         add        r10d, ebx
005c6 4489542460                     mov        dword ptr [rsp + 0x60], r10d
005cb 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
005d3 4183fb20                       cmp        r11d, 0x20
005d7 0f8dc70f0000                   jge        0x7fd333e5dc24
005dd 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005e5 49c1ea30                       shr        r10, 0x30
005e9 458bd2                         mov        r10d, r10d
005ec bb01000000                     mov        ebx, 1
005f1 c4e221f7db                     shlx       ebx, ebx, r11d
005f6 ffcb                           dec        ebx
005f8 4123d9                         and        ebx, r9d
005fb 03d9                           add        ebx, ecx
005fd 895c2448                       mov        dword ptr [rsp + 0x48], ebx
00601 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00609 4183fb20                       cmp        r11d, 0x20
0060d 0f8d29100000                   jge        0x7fd333e5dcbc
00613 41bb01000000                   mov        r11d, 1
00619 8b8c24cc000000                 mov        ecx, dword ptr [rsp + 0xcc]
00620 c44271f7cb                     shlx       r9d, r11d, ecx
00625 41ffc9                         dec        r9d
00628 4523c8                         and        r9d, r8d
0062b 4503ca                         add        r9d, r10d
0062e 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00633 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00637 0f8db0030000                   jge        0x7fd333e5d06d
0063d 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00644 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00649 4423442460                     and        r8d, dword ptr [rsp + 0x60]
0064e 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00653 458b5a14                       mov        r11d, dword ptr [r10 + 0x14]
00657 458b4b04                       mov        r9d, dword ptr [r11 + 4]
0065b 453bc1                         cmp        r8d, r9d
0065e 0f8315040000                   jae        0x7fd333e5d0f9
00664 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
00668 234c2468                       and        ecx, dword ptr [rsp + 0x68]
0066c 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00671 458b4a14                       mov        r9d, dword ptr [r10 + 0x14]
00675 418b5904                       mov        ebx, dword ptr [r9 + 4]
00679 4f8b54c308                     mov        r10, qword ptr [r11 + r8*8 + 8]
0067e 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00683 3bcb                           cmp        ecx, ebx
00685 0f8375040000                   jae        0x7fd333e5d180
0068b 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
00690 4423442448                     and        r8d, dword ptr [rsp + 0x48]
00695 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0069a 458b5314                       mov        r10d, dword ptr [r11 + 0x14]
0069e 458b5a04                       mov        r11d, dword ptr [r10 + 4]
006a2 4d8b4cc908                     mov        r9, qword ptr [r9 + rcx*8 + 8]
006a7 4c898c2480000000               mov        qword ptr [rsp + 0x80], r9
006af 453bc3                         cmp        r8d, r11d
006b2 0f83e4040000                   jae        0x7fd333e5d21c
006b8 4f8b54c208                     mov        r10, qword ptr [r10 + r8*8 + 8]
006bd 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006c5 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006cc ffc5                           inc        ebp
006ce 892c24                         mov        dword ptr [rsp], ebp
006d1 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006d5 0f8de3020000                   jge        0x7fd333e5d03e
006db 49c1ea28                       shr        r10, 0x28
006df 458bda                         mov        r11d, r10d
006e2 450fb6d3                       movzx      r10d, r11b
006e6 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
006ee 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
006f3 49c1ea28                       shr        r10, 0x28
006f7 458bd2                         mov        r10d, r10d
006fa 410fb6ea                       movzx      ebp, r10b
006fe 03ac24c8000000                 add        ebp, dword ptr [rsp + 0xc8]
00705 4d8bd1                         mov        r10, r9
00708 49c1ea28                       shr        r10, 0x28
0070c 458bd2                         mov        r10d, r10d
0070f 450fb6d2                       movzx      r10d, r10b
00713 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
0071b 4103ea                         add        ebp, r10d
0071e 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
00725 41ba01000000                   mov        r10d, 1
0072b 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
00733 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0073b 49c1ea20                       shr        r10, 0x20
0073f 458bda                         mov        r11d, r10d
00742 410fb6eb                       movzx      ebp, r11b
00746 89ac24d4000000                 mov        dword ptr [rsp + 0xd4], ebp
0074d 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00752 49c1ea20                       shr        r10, 0x20
00756 458bd2                         mov        r10d, r10d
00759 410fb6ea                       movzx      ebp, r10b
0075d 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
00764 4d8bd1                         mov        r10, r9
00767 49c1ea20                       shr        r10, 0x20
0076b 458bda                         mov        r11d, r10d
0076e 410fb6eb                       movzx      ebp, r11b
00772 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
00779 448bc5                         mov        r8d, ebp
0077c 44038424d4000000               add        r8d, dword ptr [rsp + 0xd4]
00784 44038424d8000000               add        r8d, dword ptr [rsp + 0xd8]
0078c 44038424d0000000               add        r8d, dword ptr [rsp + 0xd0]
00794 4585c0                         test       r8d, r8d
00797 0f849b050000                   je         0x7fd333e5d3b8
0079d 4183f83f                       cmp        r8d, 0x3f
007a1 0f8f65060000                   jg         0x7fd333e5d48c
007a7 41b940000000                   mov        r9d, 0x40
007ad 442b4c243c                     sub        r9d, dword ptr [rsp + 0x3c]
007b2 453bc1                         cmp        r8d, r9d
007b5 7e48                           jle        0x7fd333e5ce7f
007b7 418bd8                         mov        ebx, r8d
007ba 412bd9                         sub        ebx, r9d
007bd 4183f940                       cmp        r9d, 0x40
007c1 0f8de90f0000                   jge        0x7fd333e5de30
007c7 41ba01000000                   mov        r10d, 1
007cd c442b1f7d2                     shlx       r10, r10, r9
007d2 49ffca                         dec        r10
007d5 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007dd c4c2e1f7ea                     shlx       rbp, r10, rbx
007e2 41ba40000000                   mov        r10d, 0x40
007e8 442bd3                         sub        r10d, ebx
007eb c462abf7542420                 shrx       r10, qword ptr [rsp + 0x20], r10
007f2 490bea                         or         rbp, r10
007f5 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
007fd eb30                           jmp        0x7fd333e5ceaf
007ff 452bc8                         sub        r9d, r8d
00802 c462b3f78c2498000000           shrx       r9, qword ptr [rsp + 0x98], r9
0080c 4183f840                       cmp        r8d, 0x40
00810 0f8daa0e0000                   jge        0x7fd333e5dd40
00816 41ba01000000                   mov        r10d, 1
0081c c4c2b9f7ea                     shlx       rbp, r10, r8
00821 48ffcd                         dec        rbp
00824 4923e9                         and        rbp, r9
00827 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
0082f 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00834 4503d8                         add        r11d, r8d
00837 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0083c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00841 4503d0                         add        r10d, r8d
00844 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00849 4183fb40                       cmp        r11d, 0x40
0084d 0f8cddfbffff                   jl         0x7fd333e5cab0
00853 4183c3c0                       add        r11d, -0x40
00857 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0085c 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00860 83c5f8                         add        ebp, -8
00863 896c240c                       mov        dword ptr [rsp + 0xc], ebp
00867 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0086b 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
0086f 83c1f0                         add        ecx, -0x10
00872 83f908                         cmp        ecx, 8
00875 0f8cf5000000                   jl         0x7fd333e5cff0
0087b 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00880 4183c2e8                       add        r10d, -0x18
00884 443b9424c4000000               cmp        r10d, dword ptr [rsp + 0xc4]
0088c 0f826dfbffff                   jb         0x7fd333e5ca7f
00892 bee4ffffff                     mov        esi, 0xffffffe4
00897 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0089f 448b442408                     mov        r8d, dword ptr [rsp + 8]
008a4 44890424                       mov        dword ptr [rsp], r8d
008a8 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
008ad 4489442404                     mov        dword ptr [rsp + 4], r8d
008b2 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
008b7 4489442408                     mov        dword ptr [rsp + 8], r8d
008bc 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
008c1 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
008c6 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
008cb 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
008d0 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
008d5 4489442418                     mov        dword ptr [rsp + 0x18], r8d
008da 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
008df 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
008e4 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
008e9 4489442420                     mov        dword ptr [rsp + 0x20], r8d
008ee 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
008f3 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
008f8 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
008fd 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00902 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00907 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0090c 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00911 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00916 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0091b 4489442440                     mov        dword ptr [rsp + 0x40], r8d
00920 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00925 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0092a 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
0092f 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00934 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00939 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
0093e 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00946 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
0094b 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00953 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00958 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00960 666690                         nop        
00963 e87866b6ff                     call       0x7fd3339c3660
00968 0f1f8400600a0002               nop        dword ptr [rax + rax + 0x2000a60]
00970 85c9                           test       ecx, ecx
00972 7f08                           jg         0x7fd333e5cffc
00974 4533d2                         xor        r10d, r10d
00977 e990faffff                     jmp        0x7fd333e5ca8c
0097c 8be9                           mov        ebp, ecx
0097e 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00986 8b542408                       mov        edx, dword ptr [rsp + 8]
0098a 90                             nop        
0098b e850e8a9ff                     call       0x7fd3338fb860
00990 0f1f8400880a0003               nop        dword ptr [rax + rax + 0x3000a88]
00998 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0099d 41c1e303                       shl        r11d, 3
009a1 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
009a6 41c1e203                       shl        r10d, 3
009aa 452bda                         sub        r11d, r10d
009ad 4181c3c0000000                 add        r11d, 0xc0
009b4 c462a1f7d0                     shlx       r10, rax, r11
009b9 e94efaffff                     jmp        0x7fd333e5ca8c
009be 4533d2                         xor        r10d, r10d
009c1 4533c0                         xor        r8d, r8d
009c4 4533db                         xor        r11d, r11d
009c7 33c9                           xor        ecx, ecx
009c9 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
009d1 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
009d9 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
009e1 898c24f4000000                 mov        dword ptr [rsp + 0xf4], ecx
009e8 e946fdffff                     jmp        0x7fd333e5cdb3
009ed 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009f5 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009fd 4d03c2                         add        r8, r10
00a00 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
00a08 4d3bc2                         cmp        r8, r10
00a0b 7f29                           jg         0x7fd333e5d0b6
00a0d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a12 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a1a 0f85f4120000                   jne        0x7fd333e5e394
00a20 418bc0                         mov        eax, r8d
00a23 4881c410010000                 add        rsp, 0x110
00a2a 5d                             pop        rbp
00a2b 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a2f 0f87f9130000                   ja         0x7fd333e5e4ae
00a35 c3                             ret        
00a36 48be702274e200000000           movabs     rsi, 0xe2742270
00a40 666690                         nop        
00a43 e898e7a9ff                     call       0x7fd3338fb860
00a48 0f1f8400400b0004               nop        dword ptr [rax + rax + 0x4000b40]
00a50 4885c0                         test       rax, rax
00a53 0f84a7120000                   je         0x7fd333e5e380
00a59 488bf0                         mov        rsi, rax
00a5c 4881c410010000                 add        rsp, 0x110
00a63 5d                             pop        rbp
00a64 e9f7c3b6ff                     jmp        0x7fd3339c94e0
00a69 4533db                         xor        r11d, r11d
00a6c 4533d2                         xor        r10d, r10d
00a6f 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00a74 e95cf7ffff                     jmp        0x7fd333e5c855
00a79 bee4ffffff                     mov        esi, 0xffffffe4
00a7e 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a86 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00a8b 44890c24                       mov        dword ptr [rsp], r9d
00a8f 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00a94 4489542404                     mov        dword ptr [rsp + 4], r10d
00a99 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00a9e 44894c2408                     mov        dword ptr [rsp + 8], r9d
00aa3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00aa8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00aad 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00ab2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00ab7 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00abc 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00ac1 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00ac6 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
00acb 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00ad0 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00ad5 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00ada 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00adf 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00ae4 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00ae9 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00aee 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
00af3 e8e864b6ff                     call       0x7fd3339c3660
00af8 0f1f8400f00b0005               nop        dword ptr [rax + rax + 0x5000bf0]
00b00 bee4ffffff                     mov        esi, 0xffffffe4
00b05 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b0d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b12 44891c24                       mov        dword ptr [rsp], r11d
00b16 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00b1b 4489542404                     mov        dword ptr [rsp + 4], r10d
00b20 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b25 44895c2408                     mov        dword ptr [rsp + 8], r11d
00b2a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b2f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b34 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00b39 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00b3e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00b43 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00b48 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00b4d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00b52 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00b57 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00b5c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00b61 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00b66 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00b6b 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00b70 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00b75 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00b7a 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00b7f 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00b84 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
00b89 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00b8d 6690                           nop        
00b8f e84c64b6ff                     call       0x7fd3339c3660
00b94 0f1f84008c0c0006               nop        dword ptr [rax + rax + 0x6000c8c]
00b9c bee4ffffff                     mov        esi, 0xffffffe4
00ba1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ba9 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00bae 44890c24                       mov        dword ptr [rsp], r9d
00bb2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00bb7 44895c2404                     mov        dword ptr [rsp + 4], r11d
00bbc 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00bc1 44894c2408                     mov        dword ptr [rsp + 8], r9d
00bc6 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00bcb 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00bd0 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00bd5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00bda 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00bdf 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00be4 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00be9 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
00bee 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00bf3 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00bf8 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00bfd 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00c02 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00c07 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00c0c 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00c11 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00c16 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00c1b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00c20 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00c25 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00c2a 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00c2f 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
00c34 666690                         nop        
00c37 e8a463b6ff                     call       0x7fd3339c3660
00c3c 0f1f8400340d0007               nop        dword ptr [rax + rax + 0x7000d34]
00c44 4533db                         xor        r11d, r11d
00c47 4d3bcb                         cmp        r9, r11
00c4a bdffffffff                     mov        ebp, 0xffffffff
00c4f 7c08                           jl         0x7fd333e5d2d9
00c51 400f95c5                       setne      bpl
00c55 400fb6ed                       movzx      ebp, bpl
00c59 be45ffffff                     mov        esi, 0xffffff45
00c5e 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00c66 4c891c24                       mov        qword ptr [rsp], r11
00c6a 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00c6f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00c74 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00c7c 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00c81 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00c86 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00c8b 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
00c8f 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
00c93 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00c98 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00c9d 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
00ca1 895c2434                       mov        dword ptr [rsp + 0x34], ebx
00ca5 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00caa 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00caf 8b5c2468                       mov        ebx, dword ptr [rsp + 0x68]
00cb3 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
00cb7 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00cbc 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00cc1 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
00cc8 895c2444                       mov        dword ptr [rsp + 0x44], ebx
00ccc 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00cd1 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00cd6 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00cda 895c2454                       mov        dword ptr [rsp + 0x54], ebx
00cde 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00ce3 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00ce8 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00ced 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00cf2 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00cfa 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00cff 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00d07 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
00d0c 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00d14 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
00d1b 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d23 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00d2b e8b062b6ff                     call       0x7fd3339c3660
00d30 0f1f8400280e0008               nop        dword ptr [rax + rax + 0x8000e28]
00d38 be45ffffff                     mov        esi, 0xffffff45
00d3d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00d45 448b542408                     mov        r10d, dword ptr [rsp + 8]
00d4a 44891424                       mov        dword ptr [rsp], r10d
00d4e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00d53 44895c2404                     mov        dword ptr [rsp + 4], r11d
00d58 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00d5d 4489542408                     mov        dword ptr [rsp + 8], r10d
00d62 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00d67 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d6c 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00d71 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00d76 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00d7b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00d80 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00d85 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00d8a 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00d8f 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00d94 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00d99 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00d9e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00da3 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00da8 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00dad 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00db2 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00db7 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00dbc 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00dc1 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00dc6 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00dcb 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00dd0 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00dd5 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00dda 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00ddf 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00de4 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
00de9 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00df1 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00df6 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00dfe 90                             nop        
00dff e8dc61b6ff                     call       0x7fd3339c3660
00e04 0f1f8400fc0e0009               nop        dword ptr [rax + rax + 0x9000efc]
00e0c be45ffffff                     mov        esi, 0xffffff45
00e11 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e19 448b542408                     mov        r10d, dword ptr [rsp + 8]
00e1e 44891424                       mov        dword ptr [rsp], r10d
00e22 4489442408                     mov        dword ptr [rsp + 8], r8d
00e27 e8b461b6ff                     call       0x7fd3339c3660
00e2c 0f1f8400240f000a               nop        dword ptr [rax + rax + 0xa000f24]
00e34 be45ffffff                     mov        esi, 0xffffff45
00e39 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e41 448b542408                     mov        r10d, dword ptr [rsp + 8]
00e46 44891424                       mov        dword ptr [rsp], r10d
00e4a 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00e4f 44895c2404                     mov        dword ptr [rsp + 4], r11d
00e54 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00e59 4489542408                     mov        dword ptr [rsp + 8], r10d
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
00f07 e8d460b6ff                     call       0x7fd3339c3660
00f0c 0f1f84000410000b               nop        dword ptr [rax + rax + 0xb001004]
00f14 be45ffffff                     mov        esi, 0xffffff45
00f19 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00f21 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00f26 44891c24                       mov        dword ptr [rsp], r11d
00f2a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00f2f 4489542404                     mov        dword ptr [rsp + 4], r10d
00f34 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00f39 44895c2408                     mov        dword ptr [rsp + 8], r11d
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
01007 e8d45fb6ff                     call       0x7fd3339c3660
0100c 0f1f84000411000c               nop        dword ptr [rax + rax + 0xc001104]
01014 be45ffffff                     mov        esi, 0xffffff45
01019 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01021 448b542408                     mov        r10d, dword ptr [rsp + 8]
01026 44891424                       mov        dword ptr [rsp], r10d
0102a 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0102f 44895c2404                     mov        dword ptr [rsp + 4], r11d
01034 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01039 4489542408                     mov        dword ptr [rsp + 8], r10d
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
0110b e8d05eb6ff                     call       0x7fd3339c3660
01110 0f1f84000812000d               nop        dword ptr [rax + rax + 0xd001208]
01118 be45ffffff                     mov        esi, 0xffffff45
0111d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01125 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
0112a 44890c24                       mov        dword ptr [rsp], r9d
0112e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01133 44895c2404                     mov        dword ptr [rsp + 4], r11d
01138 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
0113d 44894c2408                     mov        dword ptr [rsp + 8], r9d
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
011fb e8e05db6ff                     call       0x7fd3339c3660
01200 0f1f8400f812000e               nop        dword ptr [rax + rax + 0xe0012f8]
01208 41bbffffff7f                   mov        r11d, 0x7fffffff
0120e 4d3bcb                         cmp        r9, r11
01211 bdffffffff                     mov        ebp, 0xffffffff
01216 7c08                           jl         0x7fd333e5d8a0
01218 400f95c5                       setne      bpl
0121c 400fb6ed                       movzx      ebp, bpl
01220 be45ffffff                     mov        esi, 0xffffff45
01225 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
0122d 4c891c24                       mov        qword ptr [rsp], r11
01231 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01236 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0123b 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
01243 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01248 8b5c243c                       mov        ebx, dword ptr [rsp + 0x3c]
0124c 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01250 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01255 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0125a 8b5c2434                       mov        ebx, dword ptr [rsp + 0x34]
0125e 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01262 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01267 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0126c 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
01270 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01274 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01279 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0127e 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
01282 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01286 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
0128e 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01293 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
01297 895c2450                       mov        dword ptr [rsp + 0x50], ebx
0129b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
012a0 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
012a5 8b5c2474                       mov        ebx, dword ptr [rsp + 0x74]
012a9 895c2458                       mov        dword ptr [rsp + 0x58], ebx
012ad 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
012b2 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
012b7 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
012bf 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
012c4 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
012cc 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
012d1 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
012d9 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
012e0 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
012e8 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
012f0 666690                         nop        
012f3 e8e85cb6ff                     call       0x7fd3339c3660
012f8 0f1f8400f013000f               nop        dword ptr [rax + rax + 0xf0013f0]
01300 be45ffffff                     mov        esi, 0xffffff45
01305 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0130d 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01312 44890c24                       mov        dword ptr [rsp], r9d
01316 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0131b 44894c2404                     mov        dword ptr [rsp + 4], r9d
01320 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01325 44895c2408                     mov        dword ptr [rsp + 8], r11d
0132a 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0132f 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01334 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01339 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0133e 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01343 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01348 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0134d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01352 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01357 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
0135c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01361 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01366 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0136b 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01370 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01375 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0137a 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0137f 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01384 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01389 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0138e 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01393 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01398 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
0139d 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
013a2 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
013a7 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
013ac 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
013b4 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
013b9 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
013be 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
013c6 90                             nop        
013c7 e8145cb6ff                     call       0x7fd3339c3660
013cc 0f1f8400c4140010               nop        dword ptr [rax + rax + 0x100014c4]
013d4 be45ffffff                     mov        esi, 0xffffff45
013d9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013e1 448b542408                     mov        r10d, dword ptr [rsp + 8]
013e6 44891424                       mov        dword ptr [rsp], r10d
013ea 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
013ef 4489542404                     mov        dword ptr [rsp + 4], r10d
013f4 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
013f9 44895c2408                     mov        dword ptr [rsp + 8], r11d
013fe 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01403 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01408 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0140d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01412 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01417 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0141c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01421 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01426 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0142b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01430 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01435 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0143a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0143f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01444 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01449 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0144e 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01453 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01458 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0145d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01462 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01467 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0146c 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01471 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01476 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0147b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01480 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01488 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0148d 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01492 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
01499 6690                           nop        
0149b e8405bb6ff                     call       0x7fd3339c3660
014a0 0f1f840098150011               nop        dword ptr [rax + rax + 0x11001598]
014a8 be3dffffff                     mov        esi, 0xffffff3d
014ad 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014b5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
014ba 44891c24                       mov        dword ptr [rsp], r11d
014be 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
014c3 44895c2404                     mov        dword ptr [rsp + 4], r11d
014c8 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
014cd 44894c2408                     mov        dword ptr [rsp + 8], r9d
014d2 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
014d7 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
014dc 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
014e1 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
014e6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
014eb 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
014f0 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
014f5 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
014fa 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
014ff 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01504 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01509 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0150e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01513 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01518 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
0151d 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01522 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01527 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0152c 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
01534 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01539 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0153e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01543 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01548 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
0154d 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01552 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01557 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0155c 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01561 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
01569 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0156e 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
01576 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
0157b 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01580 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01588 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
0158f 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
01596 90                             nop        
01597 e8445ab6ff                     call       0x7fd3339c3660
0159c 0f1f840094160012               nop        dword ptr [rax + rax + 0x12001694]
015a4 be45ffffff                     mov        esi, 0xffffff45
015a9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015b1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
015b6 44891c24                       mov        dword ptr [rsp], r11d
015ba 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
015bf 44895c2404                     mov        dword ptr [rsp + 4], r11d
015c4 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
015c9 44895c2408                     mov        dword ptr [rsp + 8], r11d
015ce 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015d3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015d8 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
015dd 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
015e2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
015e7 4489542420                     mov        dword ptr [rsp + 0x20], r10d
015ec 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
015f1 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
015f6 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
015fb 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01600 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01605 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0160a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0160f 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01614 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01619 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0161e 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
01623 894c2460                       mov        dword ptr [rsp + 0x60], ecx
01627 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
0162c 666690                         nop        
0162f e8ac59b6ff                     call       0x7fd3339c3660
01634 0f1f84002c170013               nop        dword ptr [rax + rax + 0x1300172c]
0163c be45ffffff                     mov        esi, 0xffffff45
01641 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01649 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0164e 44891c24                       mov        dword ptr [rsp], r11d
01652 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01657 44895c2404                     mov        dword ptr [rsp + 4], r11d
0165c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01661 44895c2408                     mov        dword ptr [rsp + 8], r11d
01666 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0166b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01670 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01675 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0167a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0167f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01684 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01689 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0168e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01693 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01698 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0169d 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
016a2 895c2430                       mov        dword ptr [rsp + 0x30], ebx
016a6 4489542454                     mov        dword ptr [rsp + 0x54], r10d
016ab 4489442458                     mov        dword ptr [rsp + 0x58], r8d
016b0 666690                         nop        
016b3 e82859b6ff                     call       0x7fd3339c3660
016b8 0f1f8400b0170014               nop        dword ptr [rax + rax + 0x140017b0]
016c0 be45ffffff                     mov        esi, 0xffffff45
016c5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
016cd 448b542408                     mov        r10d, dword ptr [rsp + 8]
016d2 44891424                       mov        dword ptr [rsp], r10d
016d6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
016db 4489542404                     mov        dword ptr [rsp + 4], r10d
016e0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
016e5 4489542408                     mov        dword ptr [rsp + 8], r10d
016ea 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
016f2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
016f7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016fc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01701 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01706 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0170b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01710 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01715 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0171a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0171f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01724 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01729 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0172e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01733 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01738 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0173d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01742 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01747 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0174c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01751 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01756 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0175b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01760 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01765 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0176a 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0176f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01774 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01779 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01781 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01786 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0178e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01793 4c898c2490000000               mov        qword ptr [rsp + 0x90], r9
0179b 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
017a3 e83858b6ff                     call       0x7fd3339c3660
017a8 0f1f8400a0180015               nop        dword ptr [rax + rax + 0x150018a0]
017b0 be45ffffff                     mov        esi, 0xffffff45
017b5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
017bd 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
017c2 44891c24                       mov        dword ptr [rsp], r11d
017c6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
017cb 4489542404                     mov        dword ptr [rsp + 4], r10d
017d0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
017d5 44895c2408                     mov        dword ptr [rsp + 8], r11d
017da 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017df 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017e4 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
017e9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
017ee 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
017f3 4489542420                     mov        dword ptr [rsp + 0x20], r10d
017f8 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
017fd 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01802 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01807 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0180c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01811 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01816 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0181b 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01820 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01825 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0182a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0182f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01834 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01839 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0183e 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01843 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01848 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0184d 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01852 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01857 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0185c 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01864 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01869 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01871 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01876 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
0187e 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
01885 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
0188d 6690                           nop        
0188f e84c57b6ff                     call       0x7fd3339c3660
01894 0f1f84008c190016               nop        dword ptr [rax + rax + 0x1600198c]
0189c 4585db                         test       r11d, r11d
0189f 7f08                           jg         0x7fd333e5df29
018a1 4533ed                         xor        r13d, r13d
018a4 e916e8ffff                     jmp        0x7fd333e5c73f
018a9 8954242c                       mov        dword ptr [rsp + 0x2c], edx
018ad 4489742428                     mov        dword ptr [rsp + 0x28], r14d
018b2 897c241c                       mov        dword ptr [rsp + 0x1c], edi
018b6 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
018bb 89442414                       mov        dword ptr [rsp + 0x14], eax
018bf 895c2410                       mov        dword ptr [rsp + 0x10], ebx
018c3 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
018c8 48894424f8                     mov        qword ptr [rsp - 8], rax
018cd 8b0424                         mov        eax, dword ptr [rsp]
018d0 89442404                       mov        dword ptr [rsp + 4], eax
018d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018d9 48894424f8                     mov        qword ptr [rsp - 8], rax
018de 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
018e5 890424                         mov        dword ptr [rsp], eax
018e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ed 488bee                         mov        rbp, rsi
018f0 8bd1                           mov        edx, ecx
018f2 418bcb                         mov        ecx, r11d
018f5 6690                           nop        
018f7 e8e4d8a9ff                     call       0x7fd3338fb860
018fc 0f1f8400f4190017               nop        dword ptr [rax + rax + 0x170019f4]
01904 41bb40000000                   mov        r11d, 0x40
0190a 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
0190f c462a1f7e8                     shlx       r13, rax, r11
01914 48894424f8                     mov        qword ptr [rsp - 8], rax
01919 8b442404                       mov        eax, dword ptr [rsp + 4]
0191d 890424                         mov        dword ptr [rsp], eax
01920 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01925 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0192a 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
0192e 8b442414                       mov        eax, dword ptr [rsp + 0x14]
01932 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01937 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
0193b 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
01940 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01944 e976e7ffff                     jmp        0x7fd333e5c73f
01949 4585db                         test       r11d, r11d
0194c 7f07                           jg         0x7fd333e5dfd5
0194e 33f6                           xor        esi, esi
01950 e9abe7ffff                     jmp        0x7fd333e5c780
01955 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0195a 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
0195f 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01963 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01968 897c241c                       mov        dword ptr [rsp + 0x1c], edi
0196c 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
01971 89442414                       mov        dword ptr [rsp + 0x14], eax
01975 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01979 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0197e 48894424f8                     mov        qword ptr [rsp - 8], rax
01983 8b0424                         mov        eax, dword ptr [rsp]
01986 89442404                       mov        dword ptr [rsp + 4], eax
0198a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0198f 48894424f8                     mov        qword ptr [rsp - 8], rax
01994 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0199b 890424                         mov        dword ptr [rsp], eax
0199e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019a3 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
019ab 488bf5                         mov        rsi, rbp
019ae 8b542408                       mov        edx, dword ptr [rsp + 8]
019b2 418bcb                         mov        ecx, r11d
019b5 6690                           nop        
019b7 e824d8a9ff                     call       0x7fd3338fb860
019bc 0f1f8400b41a0018               nop        dword ptr [rax + rax + 0x18001ab4]
019c4 41bb80000000                   mov        r11d, 0x80
019ca 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
019cf c4e2a1f7f0                     shlx       rsi, rax, r11
019d4 48894424f8                     mov        qword ptr [rsp - 8], rax
019d9 8b442404                       mov        eax, dword ptr [rsp + 4]
019dd 890424                         mov        dword ptr [rsp], eax
019e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019e5 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
019e9 8b442414                       mov        eax, dword ptr [rsp + 0x14]
019ed 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
019f1 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
019f6 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
019fa 4c8b6c2430                     mov        r13, qword ptr [rsp + 0x30]
019ff 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01a04 e9f7e6ffff                     jmp        0x7fd333e5c780
01a09 4533c0                         xor        r8d, r8d
01a0c e9e4efffff                     jmp        0x7fd333e5d075
01a11 bee4ffffff                     mov        esi, 0xffffffe4
01a16 48ffb42490000000               push       qword ptr [rsp + 0x90]
01a1e 488f0424                       pop        qword ptr [rsp]
01a22 90                             nop        
01a23 e8b855b6ff                     call       0x7fd3339c3660
01a28 0f1f8400201b0019               nop        dword ptr [rax + rax + 0x19001b20]
01a30 be5d000000                     mov        esi, 0x5d
01a35 6690                           nop        
01a37 e8a455b6ff                     call       0x7fd3339c3660
01a3c 0f1f8400341b001a               nop        dword ptr [rax + rax + 0x1a001b34]
01a44 bef6ffffff                     mov        esi, 0xfffffff6
01a49 6690                           nop        
01a4b e89055b6ff                     call       0x7fd3339c3660
01a50 0f1f8400481b001b               nop        dword ptr [rax + rax + 0x1b001b48]
01a58 bef6ffffff                     mov        esi, 0xfffffff6
01a5d 6690                           nop        
01a5f e87c55b6ff                     call       0x7fd3339c3660
01a64 0f1f84005c1b001c               nop        dword ptr [rax + rax + 0x1c001b5c]
01a6c be6effffff                     mov        esi, 0xffffff6e
01a71 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a79 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01a7e 44891c24                       mov        dword ptr [rsp], r11d
01a82 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01a87 44895c2408                     mov        dword ptr [rsp + 8], r11d
01a8c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a91 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a96 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01a9b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01aa0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01aa5 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01aaa 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01aaf 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01ab4 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01ab9 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01abe 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01ac3 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01ac8 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01acd 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01ad2 90                             nop        
01ad3 e80855b6ff                     call       0x7fd3339c3660
01ad8 0f1f8400d01b001d               nop        dword ptr [rax + rax + 0x1d001bd0]
01ae0 bee4ffffff                     mov        esi, 0xffffffe4
01ae5 48ffb42490000000               push       qword ptr [rsp + 0x90]
01aed 488f0424                       pop        qword ptr [rsp]
01af1 89442418                       mov        dword ptr [rsp + 0x18], eax
01af5 48894424f8                     mov        qword ptr [rsp - 8], rax
01afa 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b01 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01b05 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b0a 897c2428                       mov        dword ptr [rsp + 0x28], edi
01b0e 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01b12 90                             nop        
01b13 e8c854b6ff                     call       0x7fd3339c3660
01b18 0f1f8400101c001e               nop        dword ptr [rax + rax + 0x1e001c10]
01b20 bee4ffffff                     mov        esi, 0xffffffe4
01b25 48ffb42490000000               push       qword ptr [rsp + 0x90]
01b2d 488f0424                       pop        qword ptr [rsp]
01b31 48894424f8                     mov        qword ptr [rsp - 8], rax
01b36 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b3d 89442418                       mov        dword ptr [rsp + 0x18], eax
01b41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b46 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01b4a 89542428                       mov        dword ptr [rsp + 0x28], edx
01b4e 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01b53 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01b58 666690                         nop        
01b5b e88054b6ff                     call       0x7fd3339c3660
01b60 0f1f8400581c001f               nop        dword ptr [rax + rax + 0x1f001c58]
01b68 bebeffffff                     mov        esi, 0xffffffbe
01b6d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b75 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01b7a 44891c24                       mov        dword ptr [rsp], r11d
01b7e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01b83 44895c2408                     mov        dword ptr [rsp + 8], r11d
01b88 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b8d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b92 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01b97 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01b9c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ba1 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01ba6 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01bab 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01bb0 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01bb5 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01bba 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01bbf 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01bc4 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01bc9 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01bce 90                             nop        
01bcf e80c54b6ff                     call       0x7fd3339c3660
01bd4 0f1f8400cc1c0020               nop        dword ptr [rax + rax + 0x20001ccc]
01bdc beccffffff                     mov        esi, 0xffffffcc
01be1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01be9 890c24                         mov        dword ptr [rsp], ecx
01bec 89442410                       mov        dword ptr [rsp + 0x10], eax
01bf0 48894424f8                     mov        qword ptr [rsp - 8], rax
01bf5 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01bfc 89442414                       mov        dword ptr [rsp + 0x14], eax
01c00 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c05 897c2418                       mov        dword ptr [rsp + 0x18], edi
01c09 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01c0d 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
01c11 6690                           nop        
01c13 e8c853b6ff                     call       0x7fd3339c3660
01c18 0f1f8400101d0021               nop        dword ptr [rax + rax + 0x21001d10]
01c20 beccffffff                     mov        esi, 0xffffffcc
01c25 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c2d 448b442408                     mov        r8d, dword ptr [rsp + 8]
01c32 44890424                       mov        dword ptr [rsp], r8d
01c36 48894424f8                     mov        qword ptr [rsp - 8], rax
01c3b 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c42 89442410                       mov        dword ptr [rsp + 0x10], eax
01c46 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c4b 897c2414                       mov        dword ptr [rsp + 0x14], edi
01c4f 89542418                       mov        dword ptr [rsp + 0x18], edx
01c53 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
01c58 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01c5d 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01c61 6690                           nop        
01c63 e87853b6ff                     call       0x7fd3339c3660
01c68 0f1f8400601d0022               nop        dword ptr [rax + rax + 0x22001d60]
01c70 be45ffffff                     mov        esi, 0xffffff45
01c75 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c7d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01c82 44891424                       mov        dword ptr [rsp], r10d
01c86 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01c8b 4489542408                     mov        dword ptr [rsp + 8], r10d
01c90 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c95 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c9a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c9f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01ca4 666690                         nop        
01ca7 e83453b6ff                     call       0x7fd3339c3660
01cac 0f1f8400a41d0023               nop        dword ptr [rax + rax + 0x23001da4]
01cb4 be45ffffff                     mov        esi, 0xffffff45
01cb9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01cc1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01cc6 44891c24                       mov        dword ptr [rsp], r11d
01cca 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01ccf 44895c2408                     mov        dword ptr [rsp + 8], r11d
01cd4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01cd9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01cde 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ce3 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01ce8 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01ced 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01cf2 90                             nop        
01cf3 e8e852b6ff                     call       0x7fd3339c3660
01cf8 0f1f8400f01d0024               nop        dword ptr [rax + rax + 0x24001df0]
01d00 bef6ffffff                     mov        esi, 0xfffffff6
01d05 6690                           nop        
01d07 e8d452b6ff                     call       0x7fd3339c3660
01d0c 0f1f8400041e0025               nop        dword ptr [rax + rax + 0x25001e04]
01d14 be5d000000                     mov        esi, 0x5d
01d19 6690                           nop        
01d1b e8c052b6ff                     call       0x7fd3339c3660
01d20 0f1f8400181e0026               nop        dword ptr [rax + rax + 0x26001e18]
01d28 be45ffffff                     mov        esi, 0xffffff45
01d2d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d35 448b542408                     mov        r10d, dword ptr [rsp + 8]
01d3a 44891424                       mov        dword ptr [rsp], r10d
01d3e 90                             nop        
01d3f e89c52b6ff                     call       0x7fd3339c3660
01d44 0f1f84003c1e0027               nop        dword ptr [rax + rax + 0x27001e3c]
01d4c bef6ffffff                     mov        esi, 0xfffffff6
01d51 418be8                         mov        ebp, r8d
01d54 666690                         nop        
01d57 e88452b6ff                     call       0x7fd3339c3660
01d5c 0f1f8400541e0028               nop        dword ptr [rax + rax + 0x28001e54]
01d64 bef6ffffff                     mov        esi, 0xfffffff6
01d69 8be9                           mov        ebp, ecx
01d6b e87052b6ff                     call       0x7fd3339c3660
01d70 0f1f8400681e0029               nop        dword ptr [rax + rax + 0x29001e68]
01d78 bef6ffffff                     mov        esi, 0xfffffff6
01d7d 418be8                         mov        ebp, r8d
01d80 666690                         nop        
01d83 e85852b6ff                     call       0x7fd3339c3660
01d88 0f1f8400801e002a               nop        dword ptr [rax + rax + 0x2a001e80]
01d90 bef6ffffff                     mov        esi, 0xfffffff6
01d95 6690                           nop        
01d97 e84452b6ff                     call       0x7fd3339c3660
01d9c 0f1f8400941e002b               nop        dword ptr [rax + rax + 0x2b001e94]
01da4 bef6ffffff                     mov        esi, 0xfffffff6
01da9 6690                           nop        
01dab e83052b6ff                     call       0x7fd3339c3660
01db0 0f1f8400a81e002c               nop        dword ptr [rax + rax + 0x2c001ea8]
01db8 bef6ffffff                     mov        esi, 0xfffffff6
01dbd 6690                           nop        
01dbf e81c52b6ff                     call       0x7fd3339c3660
01dc4 0f1f8400bc1e002d               nop        dword ptr [rax + rax + 0x2d001ebc]
01dcc bef6ffffff                     mov        esi, 0xfffffff6
01dd1 6690                           nop        
01dd3 e80852b6ff                     call       0x7fd3339c3660
01dd8 0f1f8400d01e002e               nop        dword ptr [rax + rax + 0x2e001ed0]
01de0 bef6ffffff                     mov        esi, 0xfffffff6
01de5 6690                           nop        
01de7 e8f451b6ff                     call       0x7fd3339c3660
01dec 0f1f8400e41e002f               nop        dword ptr [rax + rax + 0x2f001ee4]
01df4 bef6ffffff                     mov        esi, 0xfffffff6
01df9 6690                           nop        
01dfb e8e051b6ff                     call       0x7fd3339c3660
01e00 0f1f8400f81e0030               nop        dword ptr [rax + rax + 0x30001ef8]
01e08 bef6ffffff                     mov        esi, 0xfffffff6
01e0d 6690                           nop        
01e0f e8cc51b6ff                     call       0x7fd3339c3660
01e14 0f1f84000c1f0031               nop        dword ptr [rax + rax + 0x31001f0c]
01e1c eb08                           jmp        0x7fd333e5e4a6
01e1e eb06                           jmp        0x7fd333e5e4a6
01e20 eb04                           jmp        0x7fd333e5e4a6
01e22 eb02                           jmp        0x7fd333e5e4a6
01e24 eb00                           jmp        0x7fd333e5e4a6
01e26 488bf0                         mov        rsi, rax
01e29 e92eecffff                     jmp        0x7fd333e5d0dc
01e2e 49baabd0e533d37f0000           movabs     r10, 0x7fd333e5d0ab
01e38 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01e3f e91cfaa9ff                     jmp        0x7fd3338fdee0
01e44 e8d7c5a8ff                     call       0x7fd3338eaaa0
01e49 e9d0e1ffff                     jmp        0x7fd333e5c69e
01e4e f4                             hlt        
01e4f f4                             hlt        
