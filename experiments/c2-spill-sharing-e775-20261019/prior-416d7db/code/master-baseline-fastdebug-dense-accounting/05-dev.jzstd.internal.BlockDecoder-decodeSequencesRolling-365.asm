00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f8596210000                   jne        0x7f3db7bd39b4
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
00050 0f83371b0000                   jae        0x7f3db7bd338d
00056 440fb6441607                   movzx      r8d, byte ptr [rsi + rdx + 7]
0005c 4585c0                         test       r8d, r8d
0005f 0f845b1b0000                   je         0x7f3db7bd33c0
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
0009b 0f8c77190000                   jl         0x7f3db7bd3218
000a1 85db                           test       ebx, ebx
000a3 0f8c4f1d0000                   jl         0x7f3db7bd35f8
000a9 8b2c24                         mov        ebp, dword ptr [rsp]
000ac 83c5f9                         add        ebp, -7
000af 3bc5                           cmp        eax, ebp
000b1 0f83091c0000                   jae        0x7f3db7bd34c0
000b7 448bc0                         mov        r8d, eax
000ba 4e8b6c0608                     mov        r13, qword ptr [rsi + r8 + 8]
000bf 4183c3f8                       add        r11d, -8
000c3 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000cb 4183c2f0                       add        r10d, -0x10
000cf 4183fb08                       cmp        r11d, 8
000d3 0f8cec190000                   jl         0x7f3db7bd32c5
000d9 85db                           test       ebx, ebx
000db 0f8c6f1d0000                   jl         0x7f3db7bd3650
000e1 8b2c24                         mov        ebp, dword ptr [rsp]
000e4 83c5f9                         add        ebp, -7
000e7 443bd5                         cmp        r10d, ebp
000ea 0f83241c0000                   jae        0x7f3db7bd3514
000f0 458bda                         mov        r11d, r10d
000f3 4c8b842490000000               mov        r8, qword ptr [rsp + 0x90]
000fb 4b8b741808                     mov        rsi, qword ptr [r8 + r11 + 8]
00100 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
00105 448b4518                       mov        r8d, dword ptr [rbp + 0x18]
00109 4585c0                         test       r8d, r8d
0010c 0f84d61a0000                   je         0x7f3db7bd33e8
00112 448b5d1c                       mov        r11d, dword ptr [rbp + 0x1c]
00116 418b4b04                       mov        ecx, dword ptr [r11 + 4]
0011a 448b4d20                       mov        r9d, dword ptr [rbp + 0x20]
0011e 4585c9                         test       r9d, r9d
00121 0f84e91a0000                   je         0x7f3db7bd3410
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
00190 0f84e7080000                   je         0x7f3db7bd227d
00196 be40000000                     mov        esi, 0x40
0019b 2bf7                           sub        esi, edi
0019d 3bce                           cmp        ecx, esi
0019f 0f8f1a020000                   jg         0x7f3db7bd1bbf
001a5 2bf1                           sub        esi, ecx
001a7 c4c2cbf7ed                     shrx       rbp, r13, rsi
001ac 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b1 83f940                         cmp        ecx, 0x40
001b4 0f8d021e0000                   jge        0x7f3db7bd37bc
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
001e5 7c34                           jl         0x7f3db7bd1a1b
001e7 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
001ec 4183c1c8                       add        r9d, -0x38
001f0 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001f5 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
001fd 8b542408                       mov        edx, dword ptr [rsp + 8]
00201 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00205 90                             nop        
00206 90                             nop        
00207 e854e2b5ff                     call       0x7f3db772fc60
0020c 0f1f840004030000               nop        dword ptr [rax + rax + 0x304]
00214 4889442420                     mov        qword ptr [rsp + 0x20], rax
00219 eb31                           jmp        0x7f3db7bd1a4c
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
0025e 0f8d501c0000                   jge        0x7f3db7bd36b4
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
002a5 0f8d611c0000                   jge        0x7f3db7bd370c
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
002ee 0f8e91180000                   jle        0x7f3db7bd3385
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
0036f 0f86c3180000                   jbe        0x7f3db7bd3438
00375 4d63d2                         movsxd     r10, r10d
00378 4c635c244c                     movsxd     r11, dword ptr [rsp + 0x4c]
0037d 49ffcb                         dec        r11
00380 4d3bda                         cmp        r11, r10
00383 0f83af180000                   jae        0x7f3db7bd3438
00389 448b542404                     mov        r10d, dword ptr [rsp + 4]
0038e 4585d2                         test       r10d, r10d
00391 0f8cd9190000                   jl         0x7f3db7bd3570
00397 8b2c24                         mov        ebp, dword ptr [rsp]
0039a 83c5f9                         add        ebp, -7
0039d 89ac24c4000000                 mov        dword ptr [rsp + 0xc4], ebp
003a4 4533d2                         xor        r10d, r10d
003a7 4533db                         xor        r11d, r11d
003aa 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
003b2 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
003ba e985020000                     jmp        0x7f3db7bd1e44
003bf 8be9                           mov        ebp, ecx
003c1 2bee                           sub        ebp, esi
003c3 e898e0b5ff                     call       0x7f3db772fc60
003c8 0f1f8400c0040001               nop        dword ptr [rax + rax + 0x10004c0]
003d0 4823442428                     and        rax, qword ptr [rsp + 0x28]
003d5 41ba40000000                   mov        r10d, 0x40
003db 442bd5                         sub        r10d, ebp
003de c462d1f7d8                     shlx       r11, rax, rbp
003e3 c462abf7942498000000           shrx       r10, qword ptr [rsp + 0x98], r10
003ed 4d0bda                         or         r11, r10
003f0 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
003f5 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
003fa e9d6fdffff                     jmp        0x7f3db7bd19d5
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
0043a 0f8d800a0000                   jge        0x7f3db7bd26c0
00440 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0044a 41ba01000000                   mov        r10d, 1
00450 c442d1f7d2                     shlx       r10, r10, rbp
00455 49ffca                         dec        r10
00458 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00460 458bc2                         mov        r8d, r10d
00463 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0046a 83fd40                         cmp        ebp, 0x40
0046d 0f8d410b0000                   jge        0x7f3db7bd27b4
00473 c4c2d3f7f9                     shrx       rdi, r9, rbp
00478 41ba01000000                   mov        r10d, 1
0047e c442d1f7d2                     shlx       r10, r10, rbp
00483 49ffca                         dec        r10
00486 4d23d1                         and        r10, r9
00489 418bda                         mov        ebx, r10d
0048c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00493 83fd40                         cmp        ebp, 0x40
00496 0f8d2c0c0000                   jge        0x7f3db7bd28c8
0049c c4e2d3f7cf                     shrx       rcx, rdi, rbp
004a1 41ba01000000                   mov        r10d, 1
004a7 c442d1f7d2                     shlx       r10, r10, rbp
004ac 49ffca                         dec        r10
004af 4c23d7                         and        r10, rdi
004b2 458bd2                         mov        r10d, r10d
004b5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004bc 83fd40                         cmp        ebp, 0x40
004bf 0f8d1b0d0000                   jge        0x7f3db7bd29e0
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
00515 0f8e79070000                   jle        0x7f3db7bd2494
0051b 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00522 0f8fbc0d0000                   jg         0x7f3db7bd2ae4
00528 4181faffff0100                 cmp        r10d, 0x1ffff
0052f 0f8fbb0e0000                   jg         0x7f3db7bd2bf0
00535 81f9ffff0300                   cmp        ecx, 0x3ffff
0053b 0f8f970f0000                   jg         0x7f3db7bd2cd8
00541 418bd9                         mov        ebx, r9d
00544 81fb00000010                   cmp        ebx, 0x10000000
0054a 0f8370100000                   jae        0x7f3db7bd2dc0
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
00580 0f8dad000000                   jge        0x7f3db7bd1e33
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
005d7 0f8df3100000                   jge        0x7f3db7bd2ed0
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
0060d 0f8d69110000                   jge        0x7f3db7bd2f7c
00613 41bb01000000                   mov        r11d, 1
00619 8b8c24cc000000                 mov        ecx, dword ptr [rsp + 0xcc]
00620 c44271f7cb                     shlx       r9d, r11d, ecx
00625 41ffc9                         dec        r9d
00628 4523c8                         and        r9d, r8d
0062b 4503ca                         add        r9d, r10d
0062e 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00633 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00637 0f8dc4030000                   jge        0x7f3db7bd2201
0063d 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00644 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00649 4423442460                     and        r8d, dword ptr [rsp + 0x60]
0064e 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00653 458b5a14                       mov        r11d, dword ptr [r10 + 0x14]
00657 458b4b04                       mov        r9d, dword ptr [r11 + 4]
0065b 453bc1                         cmp        r8d, r9d
0065e 0f8329040000                   jae        0x7f3db7bd228d
00664 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
00668 234c2468                       and        ecx, dword ptr [rsp + 0x68]
0066c 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00671 458b4a14                       mov        r9d, dword ptr [r10 + 0x14]
00675 418b5904                       mov        ebx, dword ptr [r9 + 4]
00679 4f8b54c308                     mov        r10, qword ptr [r11 + r8*8 + 8]
0067e 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00683 3bcb                           cmp        ecx, ebx
00685 0f839d040000                   jae        0x7f3db7bd2328
0068b 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
00690 4423442448                     and        r8d, dword ptr [rsp + 0x48]
00695 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0069a 458b5314                       mov        r10d, dword ptr [r11 + 0x14]
0069e 458b5a04                       mov        r11d, dword ptr [r10 + 4]
006a2 4d8b4cc908                     mov        r9, qword ptr [r9 + rcx*8 + 8]
006a7 4c898c2480000000               mov        qword ptr [rsp + 0x80], r9
006af 453bc3                         cmp        r8d, r11d
006b2 0f8320050000                   jae        0x7f3db7bd23d8
006b8 4f8b54c208                     mov        r10, qword ptr [r10 + r8*8 + 8]
006bd 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006c5 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006cc ffc5                           inc        ebp
006ce 892c24                         mov        dword ptr [rsp], ebp
006d1 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006d5 0f8df7020000                   jge        0x7f3db7bd21d2
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
00797 0f84ff050000                   je         0x7f3db7bd259c
0079d 4183f83f                       cmp        r8d, 0x3f
007a1 0f8fdd060000                   jg         0x7f3db7bd2684
007a7 41b940000000                   mov        r9d, 0x40
007ad 442b4c243c                     sub        r9d, dword ptr [rsp + 0x3c]
007b2 453bc1                         cmp        r8d, r9d
007b5 7e48                           jle        0x7f3db7bd1fff
007b7 418bd8                         mov        ebx, r8d
007ba 412bd9                         sub        ebx, r9d
007bd 4183f940                       cmp        r9d, 0x40
007c1 0f8d51110000                   jge        0x7f3db7bd3118
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
007fd eb30                           jmp        0x7f3db7bd202f
007ff 452bc8                         sub        r9d, r8d
00802 c462b3f78c2498000000           shrx       r9, qword ptr [rsp + 0x98], r9
0080c 4183f840                       cmp        r8d, 0x40
00810 0f8dfe0f0000                   jge        0x7f3db7bd3014
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
0084d 0f8cddfbffff                   jl         0x7f3db7bd1c30
00853 4183c3c0                       add        r11d, -0x40
00857 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0085c 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00860 83c5f8                         add        ebp, -8
00863 896c240c                       mov        dword ptr [rsp + 0xc], ebp
00867 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0086b 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
0086f 83c1f0                         add        ecx, -0x10
00872 83f908                         cmp        ecx, 8
00875 0f8c09010000                   jl         0x7f3db7bd2184
0087b 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00880 4183c2e8                       add        r10d, -0x18
00884 443b9424c4000000               cmp        r10d, dword ptr [rsp + 0xc4]
0088c 0f826dfbffff                   jb         0x7f3db7bd1bff
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
00960 90                             nop        
00961 90                             nop        
00962 90                             nop        
00963 e8f8b8afff                     call       0x7f3db76cda60
00968 0f1f8400600a0002               nop        dword ptr [rax + rax + 0x2000a60]
00970 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
0097a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0097e e8dd433718                     call       0x7f3dcff46560
00983 f4                             hlt        
00984 85c9                           test       ecx, ecx
00986 7f08                           jg         0x7f3db7bd2190
00988 4533d2                         xor        r10d, r10d
0098b e97cfaffff                     jmp        0x7f3db7bd1c0c
00990 8be9                           mov        ebp, ecx
00992 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
0099a 8b542408                       mov        edx, dword ptr [rsp + 8]
0099e 90                             nop        
0099f e8bcdab5ff                     call       0x7f3db772fc60
009a4 0f1f84009c0a0003               nop        dword ptr [rax + rax + 0x3000a9c]
009ac 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
009b1 41c1e303                       shl        r11d, 3
009b5 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
009ba 41c1e203                       shl        r10d, 3
009be 452bda                         sub        r11d, r10d
009c1 4181c3c0000000                 add        r11d, 0xc0
009c8 c462a1f7d0                     shlx       r10, rax, r11
009cd e93afaffff                     jmp        0x7f3db7bd1c0c
009d2 4533d2                         xor        r10d, r10d
009d5 4533c0                         xor        r8d, r8d
009d8 4533db                         xor        r11d, r11d
009db 33c9                           xor        ecx, ecx
009dd 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
009e5 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
009ed 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
009f5 898c24f4000000                 mov        dword ptr [rsp + 0xf4], ecx
009fc e932fdffff                     jmp        0x7f3db7bd1f33
00a01 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
00a09 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
00a11 4d03c2                         add        r8, r10
00a14 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
00a1c 4d3bc2                         cmp        r8, r10
00a1f 7f29                           jg         0x7f3db7bd224a
00a21 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a26 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a2e 0f8560150000                   jne        0x7f3db7bd3794
00a34 418bc0                         mov        eax, r8d
00a37 4881c410010000                 add        rsp, 0x110
00a3e 5d                             pop        rbp
00a3f 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a43 0f8755170000                   ja         0x7f3db7bd399e
00a49 c3                             ret        
00a4a 48be402474e200000000           movabs     rsi, 0xe2742440
00a54 90                             nop        
00a55 90                             nop        
00a56 90                             nop        
00a57 e804dab5ff                     call       0x7f3db772fc60
00a5c 0f1f8400540b0004               nop        dword ptr [rax + rax + 0x4000b54]
00a64 4885c0                         test       rax, rax
00a67 0f84ff140000                   je         0x7f3db7bd376c
00a6d 488bf0                         mov        rsi, rax
00a70 4881c410010000                 add        rsp, 0x110
00a77 5d                             pop        rbp
00a78 e9e370afff                     jmp        0x7f3db76c9360
00a7d 4533db                         xor        r11d, r11d
00a80 4533d2                         xor        r10d, r10d
00a83 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00a88 e948f7ffff                     jmp        0x7f3db7bd19d5
00a8d bee4ffffff                     mov        esi, 0xffffffe4
00a92 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a9a 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00a9f 44890c24                       mov        dword ptr [rsp], r9d
00aa3 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00aa8 4489542404                     mov        dword ptr [rsp + 4], r10d
00aad 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00ab2 44894c2408                     mov        dword ptr [rsp + 8], r9d
00ab7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00abc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ac1 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00ac6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00acb 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00ad0 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00ad5 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00ada 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
00adf 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00ae4 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00ae9 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00aee 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00af3 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00af8 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00afd 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00b02 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
00b07 e854b7afff                     call       0x7f3db76cda60
00b0c 0f1f8400040c0005               nop        dword ptr [rax + rax + 0x5000c04]
00b14 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
00b1e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b22 e839423718                     call       0x7f3dcff46560
00b27 f4                             hlt        
00b28 bee4ffffff                     mov        esi, 0xffffffe4
00b2d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b35 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b3a 44891c24                       mov        dword ptr [rsp], r11d
00b3e 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00b43 4489542404                     mov        dword ptr [rsp + 4], r10d
00b48 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b4d 44895c2408                     mov        dword ptr [rsp + 8], r11d
00b52 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b57 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b5c 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00b61 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00b66 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00b6b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00b70 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00b75 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00b7a 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00b7f 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00b84 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00b89 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00b8e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00b93 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00b98 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00b9d 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00ba2 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00ba7 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00bac 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
00bb1 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00bb5 90                             nop        
00bb6 90                             nop        
00bb7 e8a4b6afff                     call       0x7f3db76cda60
00bbc 0f1f8400b40c0006               nop        dword ptr [rax + rax + 0x6000cb4]
00bc4 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
00bce 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bd2 e889413718                     call       0x7f3dcff46560
00bd7 f4                             hlt        
00bd8 bee4ffffff                     mov        esi, 0xffffffe4
00bdd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00be5 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00bea 44890c24                       mov        dword ptr [rsp], r9d
00bee 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00bf3 44895c2404                     mov        dword ptr [rsp + 4], r11d
00bf8 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00bfd 44894c2408                     mov        dword ptr [rsp + 8], r9d
00c02 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00c07 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00c0c 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00c11 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00c16 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00c1b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00c20 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00c25 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
00c2a 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00c2f 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00c34 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00c39 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00c3e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00c43 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00c48 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00c4d 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00c52 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00c57 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00c5c 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00c61 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00c66 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00c6b 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
00c70 90                             nop        
00c71 90                             nop        
00c72 90                             nop        
00c73 e8e8b5afff                     call       0x7f3db76cda60
00c78 0f1f8400700d0007               nop        dword ptr [rax + rax + 0x7000d70]
00c80 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
00c8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c8e e8cd403718                     call       0x7f3dcff46560
00c93 f4                             hlt        
00c94 4533db                         xor        r11d, r11d
00c97 4d3bcb                         cmp        r9, r11
00c9a bdffffffff                     mov        ebp, 0xffffffff
00c9f 7c08                           jl         0x7f3db7bd24a9
00ca1 400f95c5                       setne      bpl
00ca5 400fb6ed                       movzx      ebp, bpl
00ca9 be45ffffff                     mov        esi, 0xffffff45
00cae 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00cb6 4c891c24                       mov        qword ptr [rsp], r11
00cba 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00cbf 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00cc4 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00ccc 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00cd1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00cd6 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00cdb 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
00cdf 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
00ce3 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00ce8 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00ced 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
00cf1 895c2434                       mov        dword ptr [rsp + 0x34], ebx
00cf5 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00cfa 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00cff 8b5c2468                       mov        ebx, dword ptr [rsp + 0x68]
00d03 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
00d07 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00d0c 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00d11 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
00d18 895c2444                       mov        dword ptr [rsp + 0x44], ebx
00d1c 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00d21 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00d26 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00d2a 895c2454                       mov        dword ptr [rsp + 0x54], ebx
00d2e 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00d33 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00d38 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00d3d 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00d42 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00d4a 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00d4f 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00d57 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
00d5c 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00d64 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
00d6b 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d73 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00d7b e8e0b4afff                     call       0x7f3db76cda60
00d80 0f1f8400780e0008               nop        dword ptr [rax + rax + 0x8000e78]
00d88 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
00d92 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d96 e8c53f3718                     call       0x7f3dcff46560
00d9b f4                             hlt        
00d9c be45ffffff                     mov        esi, 0xffffff45
00da1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00da9 448b542408                     mov        r10d, dword ptr [rsp + 8]
00dae 44891424                       mov        dword ptr [rsp], r10d
00db2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00db7 44895c2404                     mov        dword ptr [rsp + 4], r11d
00dbc 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00dc1 4489542408                     mov        dword ptr [rsp + 8], r10d
00dc6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00dcb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00dd0 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00dd5 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00dda 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00ddf 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00de4 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00de9 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00dee 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00df3 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00df8 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00dfd 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00e02 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00e07 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00e0c 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00e11 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00e16 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00e1b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00e20 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00e25 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00e2a 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00e2f 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00e34 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00e39 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00e3e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00e43 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00e48 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
00e4d 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00e55 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00e5a 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00e62 90                             nop        
00e63 e8f8b3afff                     call       0x7f3db76cda60
00e68 0f1f8400600f0009               nop        dword ptr [rax + rax + 0x9000f60]
00e70 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
00e7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e7e e8dd3e3718                     call       0x7f3dcff46560
00e83 f4                             hlt        
00e84 be45ffffff                     mov        esi, 0xffffff45
00e89 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e91 448b542408                     mov        r10d, dword ptr [rsp + 8]
00e96 44891424                       mov        dword ptr [rsp], r10d
00e9a 4489442408                     mov        dword ptr [rsp + 8], r8d
00e9f e8bcb3afff                     call       0x7f3db76cda60
00ea4 0f1f84009c0f000a               nop        dword ptr [rax + rax + 0xa000f9c]
00eac 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
00eb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00eba e8a13e3718                     call       0x7f3dcff46560
00ebf f4                             hlt        
00ec0 be45ffffff                     mov        esi, 0xffffff45
00ec5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ecd 448b542408                     mov        r10d, dword ptr [rsp + 8]
00ed2 44891424                       mov        dword ptr [rsp], r10d
00ed6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00edb 44895c2404                     mov        dword ptr [rsp + 4], r11d
00ee0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00ee5 4489542408                     mov        dword ptr [rsp + 8], r10d
00eea 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00ef2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00ef7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00efc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f01 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00f06 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00f0b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00f10 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00f15 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00f1a 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00f1f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00f24 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00f29 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00f2e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00f33 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00f38 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00f3d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00f42 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00f47 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00f4c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00f51 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00f56 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00f5b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00f60 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00f65 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00f6a 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00f6f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00f74 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00f79 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00f81 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00f86 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00f8e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00f93 e8c8b2afff                     call       0x7f3db76cda60
00f98 0f1f84009010000b               nop        dword ptr [rax + rax + 0xb001090]
00fa0 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
00faa 4883e4f0                       and        rsp, 0xfffffffffffffff0
00fae e8ad3d3718                     call       0x7f3dcff46560
00fb3 f4                             hlt        
00fb4 be45ffffff                     mov        esi, 0xffffff45
00fb9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00fc1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00fc6 44891c24                       mov        dword ptr [rsp], r11d
00fca 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00fcf 4489542404                     mov        dword ptr [rsp + 4], r10d
00fd4 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00fd9 44895c2408                     mov        dword ptr [rsp + 8], r11d
00fde 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00fe6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00feb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ff0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ff5 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00ffa 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00fff 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01004 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01009 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0100e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01013 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01018 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0101d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01022 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01027 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0102c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01031 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01036 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0103b 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01040 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01045 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0104a 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0104f 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01054 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01059 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0105e 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01063 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01068 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0106d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01075 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0107a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01082 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01087 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
0108f 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
01094 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
0109c 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
010a4 90                             nop        
010a5 90                             nop        
010a6 90                             nop        
010a7 e8b4b1afff                     call       0x7f3db76cda60
010ac 0f1f8400a411000c               nop        dword ptr [rax + rax + 0xc0011a4]
010b4 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
010be 4883e4f0                       and        rsp, 0xfffffffffffffff0
010c2 e8993c3718                     call       0x7f3dcff46560
010c7 f4                             hlt        
010c8 be45ffffff                     mov        esi, 0xffffff45
010cd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
010d5 448b542408                     mov        r10d, dword ptr [rsp + 8]
010da 44891424                       mov        dword ptr [rsp], r10d
010de 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
010e3 44895c2404                     mov        dword ptr [rsp + 4], r11d
010e8 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
010ed 4489542408                     mov        dword ptr [rsp + 8], r10d
010f2 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
010fa 4c89542410                     mov        qword ptr [rsp + 0x10], r10
010ff 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01104 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01109 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0110e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01113 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01118 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0111d 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01122 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01127 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0112c 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01131 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01136 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0113b 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01140 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01145 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0114a 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0114f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01154 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01159 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0115e 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01163 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01168 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0116d 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01172 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01177 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0117c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01181 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01189 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0118e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01196 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0119b 448b9c24d4000000               mov        r11d, dword ptr [rsp + 0xd4]
011a3 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
011a8 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
011b0 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
011b7 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
011bf e89cb0afff                     call       0x7f3db76cda60
011c4 0f1f8400bc12000d               nop        dword ptr [rax + rax + 0xd0012bc]
011cc 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
011d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
011da e8813b3718                     call       0x7f3dcff46560
011df f4                             hlt        
011e0 be45ffffff                     mov        esi, 0xffffff45
011e5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
011ed 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
011f2 44890c24                       mov        dword ptr [rsp], r9d
011f6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
011fb 44895c2404                     mov        dword ptr [rsp + 4], r11d
01200 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01205 44894c2408                     mov        dword ptr [rsp + 8], r9d
0120a 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0120f 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01214 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01219 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0121e 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01223 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01228 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0122d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01232 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01237 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
0123c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01241 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01246 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0124b 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01250 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01255 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0125a 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0125f 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01264 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01269 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0126e 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01273 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01278 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
0127d 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01282 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01287 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
0128c 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
01294 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
01299 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
012a1 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
012a6 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
012ab 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
012b2 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
012ba 48898c2488000000               mov        qword ptr [rsp + 0x88], rcx
012c2 90                             nop        
012c3 e898afafff                     call       0x7f3db76cda60
012c8 0f1f8400c013000e               nop        dword ptr [rax + rax + 0xe0013c0]
012d0 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
012da 4883e4f0                       and        rsp, 0xfffffffffffffff0
012de e87d3a3718                     call       0x7f3dcff46560
012e3 f4                             hlt        
012e4 41bbffffff7f                   mov        r11d, 0x7fffffff
012ea 4d3bcb                         cmp        r9, r11
012ed bdffffffff                     mov        ebp, 0xffffffff
012f2 7c08                           jl         0x7f3db7bd2afc
012f4 400f95c5                       setne      bpl
012f8 400fb6ed                       movzx      ebp, bpl
012fc be45ffffff                     mov        esi, 0xffffff45
01301 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
01309 4c891c24                       mov        qword ptr [rsp], r11
0130d 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01312 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01317 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0131f 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01324 8b5c243c                       mov        ebx, dword ptr [rsp + 0x3c]
01328 895c2414                       mov        dword ptr [rsp + 0x14], ebx
0132c 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01331 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01336 8b5c2434                       mov        ebx, dword ptr [rsp + 0x34]
0133a 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0133e 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01343 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01348 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
0134c 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01350 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01355 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0135a 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
0135e 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01362 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
0136a 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0136f 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
01373 895c2450                       mov        dword ptr [rsp + 0x50], ebx
01377 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0137c 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
01381 8b5c2474                       mov        ebx, dword ptr [rsp + 0x74]
01385 895c2458                       mov        dword ptr [rsp + 0x58], ebx
01389 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0138e 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
01393 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
0139b 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
013a0 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
013a8 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
013ad 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
013b5 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
013bc 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
013c4 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
013cc 90                             nop        
013cd 90                             nop        
013ce 90                             nop        
013cf e88caeafff                     call       0x7f3db76cda60
013d4 0f1f8400cc14000f               nop        dword ptr [rax + rax + 0xf0014cc]
013dc 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
013e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
013ea e871393718                     call       0x7f3dcff46560
013ef f4                             hlt        
013f0 be45ffffff                     mov        esi, 0xffffff45
013f5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013fd 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01402 44890c24                       mov        dword ptr [rsp], r9d
01406 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0140b 44894c2404                     mov        dword ptr [rsp + 4], r9d
01410 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01415 44895c2408                     mov        dword ptr [rsp + 8], r11d
0141a 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0141f 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01424 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01429 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0142e 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01433 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01438 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0143d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01442 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01447 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
0144c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01451 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01456 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0145b 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01460 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01465 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0146a 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0146f 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01474 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01479 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0147e 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01483 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01488 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
0148d 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01492 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01497 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
0149c 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
014a4 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
014a9 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
014ae 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
014b6 90                             nop        
014b7 e8a4adafff                     call       0x7f3db76cda60
014bc 0f1f8400b4150010               nop        dword ptr [rax + rax + 0x100015b4]
014c4 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
014ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
014d2 e889383718                     call       0x7f3dcff46560
014d7 f4                             hlt        
014d8 be45ffffff                     mov        esi, 0xffffff45
014dd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014e5 448b542408                     mov        r10d, dword ptr [rsp + 8]
014ea 44891424                       mov        dword ptr [rsp], r10d
014ee 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
014f3 4489542404                     mov        dword ptr [rsp + 4], r10d
014f8 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
014fd 44895c2408                     mov        dword ptr [rsp + 8], r11d
01502 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01507 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0150c 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01511 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01516 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0151b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01520 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01525 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0152a 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0152f 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01534 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01539 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0153e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01543 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01548 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0154d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01552 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01557 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0155c 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01561 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01566 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0156b 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01570 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01575 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0157a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0157f 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01584 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0158c 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01591 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01596 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
0159d 90                             nop        
0159e 90                             nop        
0159f e8bcacafff                     call       0x7f3db76cda60
015a4 0f1f84009c160011               nop        dword ptr [rax + rax + 0x1100169c]
015ac 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
015b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
015ba e8a1373718                     call       0x7f3dcff46560
015bf f4                             hlt        
015c0 be3dffffff                     mov        esi, 0xffffff3d
015c5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015cd 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
015d2 44891c24                       mov        dword ptr [rsp], r11d
015d6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
015db 44895c2404                     mov        dword ptr [rsp + 4], r11d
015e0 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
015e5 44894c2408                     mov        dword ptr [rsp + 8], r9d
015ea 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
015ef 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
015f4 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
015f9 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
015fe 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01603 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01608 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
0160d 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01612 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01617 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0161c 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01621 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01626 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0162b 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01630 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01635 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0163a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0163f 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01644 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
0164c 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01651 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01656 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0165b 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01660 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01665 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0166a 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0166f 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01674 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01679 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
01681 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
01686 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
0168e 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
01693 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01698 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
016a0 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
016a7 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
016ae 90                             nop        
016af e8acabafff                     call       0x7f3db76cda60
016b4 0f1f8400ac170012               nop        dword ptr [rax + rax + 0x120017ac]
016bc 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
016c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
016ca e891363718                     call       0x7f3dcff46560
016cf f4                             hlt        
016d0 be45ffffff                     mov        esi, 0xffffff45
016d5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
016dd 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
016e2 44891c24                       mov        dword ptr [rsp], r11d
016e6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
016eb 44895c2404                     mov        dword ptr [rsp + 4], r11d
016f0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
016f5 44895c2408                     mov        dword ptr [rsp + 8], r11d
016fa 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016ff 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01704 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01709 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0170e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01713 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01718 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0171d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01722 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01727 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0172c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01731 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01736 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0173b 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01740 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01745 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0174a 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
0174f 894c2460                       mov        dword ptr [rsp + 0x60], ecx
01753 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01758 90                             nop        
01759 90                             nop        
0175a 90                             nop        
0175b e800abafff                     call       0x7f3db76cda60
01760 0f1f840058180013               nop        dword ptr [rax + rax + 0x13001858]
01768 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
01772 4883e4f0                       and        rsp, 0xfffffffffffffff0
01776 e8e5353718                     call       0x7f3dcff46560
0177b f4                             hlt        
0177c be45ffffff                     mov        esi, 0xffffff45
01781 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01789 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0178e 44891c24                       mov        dword ptr [rsp], r11d
01792 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01797 44895c2404                     mov        dword ptr [rsp + 4], r11d
0179c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
017a1 44895c2408                     mov        dword ptr [rsp + 8], r11d
017a6 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
017ab 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
017b0 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
017b5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
017ba 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
017bf 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
017c4 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
017c9 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
017ce 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
017d3 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
017d8 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
017dd 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
017e2 895c2430                       mov        dword ptr [rsp + 0x30], ebx
017e6 4489542454                     mov        dword ptr [rsp + 0x54], r10d
017eb 4489442458                     mov        dword ptr [rsp + 0x58], r8d
017f0 90                             nop        
017f1 90                             nop        
017f2 90                             nop        
017f3 e868aaafff                     call       0x7f3db76cda60
017f8 0f1f8400f0180014               nop        dword ptr [rax + rax + 0x140018f0]
01800 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
0180a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0180e e84d353718                     call       0x7f3dcff46560
01813 f4                             hlt        
01814 be45ffffff                     mov        esi, 0xffffff45
01819 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01821 448b542408                     mov        r10d, dword ptr [rsp + 8]
01826 44891424                       mov        dword ptr [rsp], r10d
0182a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0182f 4489542404                     mov        dword ptr [rsp + 4], r10d
01834 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01839 4489542408                     mov        dword ptr [rsp + 8], r10d
0183e 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01846 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0184b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01850 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01855 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0185a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0185f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01864 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01869 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0186e 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01873 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01878 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0187d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01882 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01887 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0188c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01891 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01896 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0189b 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
018a0 4489542438                     mov        dword ptr [rsp + 0x38], r10d
018a5 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
018aa 4489542448                     mov        dword ptr [rsp + 0x48], r10d
018af 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
018b4 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
018b9 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
018be 4489542450                     mov        dword ptr [rsp + 0x50], r10d
018c3 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
018c8 4c89542458                     mov        qword ptr [rsp + 0x58], r10
018cd 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
018d5 4c89542460                     mov        qword ptr [rsp + 0x60], r10
018da 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
018e2 4c89542468                     mov        qword ptr [rsp + 0x68], r10
018e7 4c898c2490000000               mov        qword ptr [rsp + 0x90], r9
018ef 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
018f7 e864a9afff                     call       0x7f3db76cda60
018fc 0f1f8400f4190015               nop        dword ptr [rax + rax + 0x150019f4]
01904 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
0190e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01912 e849343718                     call       0x7f3dcff46560
01917 f4                             hlt        
01918 be45ffffff                     mov        esi, 0xffffff45
0191d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01925 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0192a 44891c24                       mov        dword ptr [rsp], r11d
0192e 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01933 4489542404                     mov        dword ptr [rsp + 4], r10d
01938 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0193d 44895c2408                     mov        dword ptr [rsp + 8], r11d
01942 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01947 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0194c 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01951 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01956 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0195b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01960 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01965 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0196a 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0196f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01974 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01979 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0197e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01983 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01988 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0198d 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01992 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01997 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0199c 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
019a1 4489542448                     mov        dword ptr [rsp + 0x48], r10d
019a6 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
019ab 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
019b0 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
019b5 4489542450                     mov        dword ptr [rsp + 0x50], r10d
019ba 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
019bf 4c89542458                     mov        qword ptr [rsp + 0x58], r10
019c4 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
019cc 4c89542460                     mov        qword ptr [rsp + 0x60], r10
019d1 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
019d9 4c89542468                     mov        qword ptr [rsp + 0x68], r10
019de 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
019e6 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
019ed 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
019f5 90                             nop        
019f6 90                             nop        
019f7 e864a8afff                     call       0x7f3db76cda60
019fc 0f1f8400f41a0016               nop        dword ptr [rax + rax + 0x16001af4]
01a04 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
01a0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a12 e849333718                     call       0x7f3dcff46560
01a17 f4                             hlt        
01a18 4585db                         test       r11d, r11d
01a1b 7f08                           jg         0x7f3db7bd3225
01a1d 4533ed                         xor        r13d, r13d
01a20 e99ae6ffff                     jmp        0x7f3db7bd18bf
01a25 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01a29 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01a2e 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01a32 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
01a37 89442414                       mov        dword ptr [rsp + 0x14], eax
01a3b 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01a3f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a44 48894424f8                     mov        qword ptr [rsp - 8], rax
01a49 8b0424                         mov        eax, dword ptr [rsp]
01a4c 89442404                       mov        dword ptr [rsp + 4], eax
01a50 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a55 48894424f8                     mov        qword ptr [rsp - 8], rax
01a5a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a61 890424                         mov        dword ptr [rsp], eax
01a64 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a69 488bee                         mov        rbp, rsi
01a6c 8bd1                           mov        edx, ecx
01a6e 418bcb                         mov        ecx, r11d
01a71 90                             nop        
01a72 90                             nop        
01a73 e8e8c9b5ff                     call       0x7f3db772fc60
01a78 0f1f8400701b0017               nop        dword ptr [rax + rax + 0x17001b70]
01a80 41bb40000000                   mov        r11d, 0x40
01a86 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
01a8b c462a1f7e8                     shlx       r13, rax, r11
01a90 48894424f8                     mov        qword ptr [rsp - 8], rax
01a95 8b442404                       mov        eax, dword ptr [rsp + 4]
01a99 890424                         mov        dword ptr [rsp], eax
01a9c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aa1 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01aa6 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
01aaa 8b442414                       mov        eax, dword ptr [rsp + 0x14]
01aae 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01ab3 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
01ab7 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
01abc 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01ac0 e9fae5ffff                     jmp        0x7f3db7bd18bf
01ac5 4585db                         test       r11d, r11d
01ac8 7f07                           jg         0x7f3db7bd32d1
01aca 33f6                           xor        esi, esi
01acc e92fe6ffff                     jmp        0x7f3db7bd1900
01ad1 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01ad6 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01adb 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01adf 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01ae4 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01ae8 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
01aed 89442414                       mov        dword ptr [rsp + 0x14], eax
01af1 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01af5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01afa 48894424f8                     mov        qword ptr [rsp - 8], rax
01aff 8b0424                         mov        eax, dword ptr [rsp]
01b02 89442404                       mov        dword ptr [rsp + 4], eax
01b06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b0b 48894424f8                     mov        qword ptr [rsp - 8], rax
01b10 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b17 890424                         mov        dword ptr [rsp], eax
01b1a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b1f 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b27 488bf5                         mov        rsi, rbp
01b2a 8b542408                       mov        edx, dword ptr [rsp + 8]
01b2e 418bcb                         mov        ecx, r11d
01b31 90                             nop        
01b32 90                             nop        
01b33 e828c9b5ff                     call       0x7f3db772fc60
01b38 0f1f8400301c0018               nop        dword ptr [rax + rax + 0x18001c30]
01b40 41bb80000000                   mov        r11d, 0x80
01b46 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
01b4b c4e2a1f7f0                     shlx       rsi, rax, r11
01b50 48894424f8                     mov        qword ptr [rsp - 8], rax
01b55 8b442404                       mov        eax, dword ptr [rsp + 4]
01b59 890424                         mov        dword ptr [rsp], eax
01b5c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b61 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
01b65 8b442414                       mov        eax, dword ptr [rsp + 0x14]
01b69 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
01b6d 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
01b72 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01b76 4c8b6c2430                     mov        r13, qword ptr [rsp + 0x30]
01b7b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01b80 e97be5ffff                     jmp        0x7f3db7bd1900
01b85 4533c0                         xor        r8d, r8d
01b88 e97ceeffff                     jmp        0x7f3db7bd2209
01b8d bee4ffffff                     mov        esi, 0xffffffe4
01b92 48ffb42490000000               push       qword ptr [rsp + 0x90]
01b9a 488f0424                       pop        qword ptr [rsp]
01b9e 90                             nop        
01b9f e8bca6afff                     call       0x7f3db76cda60
01ba4 0f1f84009c1c0019               nop        dword ptr [rax + rax + 0x19001c9c]
01bac 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
01bb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bba e8a1313718                     call       0x7f3dcff46560
01bbf f4                             hlt        
01bc0 be5d000000                     mov        esi, 0x5d
01bc5 90                             nop        
01bc6 90                             nop        
01bc7 e894a6afff                     call       0x7f3db76cda60
01bcc 0f1f8400c41c001a               nop        dword ptr [rax + rax + 0x1a001cc4]
01bd4 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
01bde 4883e4f0                       and        rsp, 0xfffffffffffffff0
01be2 e879313718                     call       0x7f3dcff46560
01be7 f4                             hlt        
01be8 bef6ffffff                     mov        esi, 0xfffffff6
01bed 90                             nop        
01bee 90                             nop        
01bef e86ca6afff                     call       0x7f3db76cda60
01bf4 0f1f8400ec1c001b               nop        dword ptr [rax + rax + 0x1b001cec]
01bfc 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
01c06 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c0a e851313718                     call       0x7f3dcff46560
01c0f f4                             hlt        
01c10 bef6ffffff                     mov        esi, 0xfffffff6
01c15 90                             nop        
01c16 90                             nop        
01c17 e844a6afff                     call       0x7f3db76cda60
01c1c 0f1f8400141d001c               nop        dword ptr [rax + rax + 0x1c001d14]
01c24 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
01c2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c32 e829313718                     call       0x7f3dcff46560
01c37 f4                             hlt        
01c38 be6effffff                     mov        esi, 0xffffff6e
01c3d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c45 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01c4a 44891c24                       mov        dword ptr [rsp], r11d
01c4e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01c53 44895c2408                     mov        dword ptr [rsp + 8], r11d
01c58 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c5d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c62 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01c67 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01c6c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01c71 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01c76 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01c7b 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01c80 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01c85 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01c8a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01c8f 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01c94 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01c99 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01c9e 90                             nop        
01c9f e8bca5afff                     call       0x7f3db76cda60
01ca4 0f1f84009c1d001d               nop        dword ptr [rax + rax + 0x1d001d9c]
01cac 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
01cb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cba e8a1303718                     call       0x7f3dcff46560
01cbf f4                             hlt        
01cc0 bee4ffffff                     mov        esi, 0xffffffe4
01cc5 48ffb42490000000               push       qword ptr [rsp + 0x90]
01ccd 488f0424                       pop        qword ptr [rsp]
01cd1 89442418                       mov        dword ptr [rsp + 0x18], eax
01cd5 48894424f8                     mov        qword ptr [rsp - 8], rax
01cda 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01ce1 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01ce5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cea 897c2428                       mov        dword ptr [rsp + 0x28], edi
01cee 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01cf2 90                             nop        
01cf3 e868a5afff                     call       0x7f3db76cda60
01cf8 0f1f8400f01d001e               nop        dword ptr [rax + rax + 0x1e001df0]
01d00 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
01d0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d0e e84d303718                     call       0x7f3dcff46560
01d13 f4                             hlt        
01d14 bee4ffffff                     mov        esi, 0xffffffe4
01d19 48ffb42490000000               push       qword ptr [rsp + 0x90]
01d21 488f0424                       pop        qword ptr [rsp]
01d25 48894424f8                     mov        qword ptr [rsp - 8], rax
01d2a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d31 89442418                       mov        dword ptr [rsp + 0x18], eax
01d35 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d3a 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01d3e 89542428                       mov        dword ptr [rsp + 0x28], edx
01d42 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01d47 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01d4c 90                             nop        
01d4d 90                             nop        
01d4e 90                             nop        
01d4f e80ca5afff                     call       0x7f3db76cda60
01d54 0f1f84004c1e001f               nop        dword ptr [rax + rax + 0x1f001e4c]
01d5c 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
01d66 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d6a e8f12f3718                     call       0x7f3dcff46560
01d6f f4                             hlt        
01d70 bebeffffff                     mov        esi, 0xffffffbe
01d75 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d7d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01d82 44891c24                       mov        dword ptr [rsp], r11d
01d86 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01d8b 44895c2408                     mov        dword ptr [rsp + 8], r11d
01d90 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d95 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d9a 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01d9f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01da4 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01da9 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01dae 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01db3 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01db8 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01dbd 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01dc2 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01dc7 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01dcc 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01dd1 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01dd6 90                             nop        
01dd7 e884a4afff                     call       0x7f3db76cda60
01ddc 0f1f8400d41e0020               nop        dword ptr [rax + rax + 0x20001ed4]
01de4 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
01dee 4883e4f0                       and        rsp, 0xfffffffffffffff0
01df2 e8692f3718                     call       0x7f3dcff46560
01df7 f4                             hlt        
01df8 beccffffff                     mov        esi, 0xffffffcc
01dfd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e05 890c24                         mov        dword ptr [rsp], ecx
01e08 89442410                       mov        dword ptr [rsp + 0x10], eax
01e0c 48894424f8                     mov        qword ptr [rsp - 8], rax
01e11 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e18 89442414                       mov        dword ptr [rsp + 0x14], eax
01e1c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e21 897c2418                       mov        dword ptr [rsp + 0x18], edi
01e25 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01e29 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
01e2d 90                             nop        
01e2e 90                             nop        
01e2f e82ca4afff                     call       0x7f3db76cda60
01e34 0f1f84002c1f0021               nop        dword ptr [rax + rax + 0x21001f2c]
01e3c 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
01e46 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e4a e8112f3718                     call       0x7f3dcff46560
01e4f f4                             hlt        
01e50 beccffffff                     mov        esi, 0xffffffcc
01e55 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e5d 448b442408                     mov        r8d, dword ptr [rsp + 8]
01e62 44890424                       mov        dword ptr [rsp], r8d
01e66 48894424f8                     mov        qword ptr [rsp - 8], rax
01e6b 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e72 89442410                       mov        dword ptr [rsp + 0x10], eax
01e76 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e7b 897c2414                       mov        dword ptr [rsp + 0x14], edi
01e7f 89542418                       mov        dword ptr [rsp + 0x18], edx
01e83 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
01e88 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01e8d 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01e91 90                             nop        
01e92 90                             nop        
01e93 e8c8a3afff                     call       0x7f3db76cda60
01e98 0f1f8400901f0022               nop        dword ptr [rax + rax + 0x22001f90]
01ea0 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
01eaa 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eae e8ad2e3718                     call       0x7f3dcff46560
01eb3 f4                             hlt        
01eb4 be45ffffff                     mov        esi, 0xffffff45
01eb9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ec1 448b542408                     mov        r10d, dword ptr [rsp + 8]
01ec6 44891424                       mov        dword ptr [rsp], r10d
01eca 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01ecf 4489542408                     mov        dword ptr [rsp + 8], r10d
01ed4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ed9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ede 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ee3 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01ee8 90                             nop        
01ee9 90                             nop        
01eea 90                             nop        
01eeb e870a3afff                     call       0x7f3db76cda60
01ef0 0f1f8400e81f0023               nop        dword ptr [rax + rax + 0x23001fe8]
01ef8 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
01f02 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f06 e8552e3718                     call       0x7f3dcff46560
01f0b f4                             hlt        
01f0c be45ffffff                     mov        esi, 0xffffff45
01f11 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01f19 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01f1e 44891c24                       mov        dword ptr [rsp], r11d
01f22 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01f27 44895c2408                     mov        dword ptr [rsp + 8], r11d
01f2c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f31 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f36 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f3b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01f40 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01f45 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01f4a 90                             nop        
01f4b e810a3afff                     call       0x7f3db76cda60
01f50 0f1f840048200024               nop        dword ptr [rax + rax + 0x24002048]
01f58 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
01f62 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f66 e8f52d3718                     call       0x7f3dcff46560
01f6b f4                             hlt        
01f6c bef6ffffff                     mov        esi, 0xfffffff6
01f71 90                             nop        
01f72 90                             nop        
01f73 e8e8a2afff                     call       0x7f3db76cda60
01f78 0f1f840070200025               nop        dword ptr [rax + rax + 0x25002070]
01f80 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
01f8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f8e e8cd2d3718                     call       0x7f3dcff46560
01f93 f4                             hlt        
01f94 be5d000000                     mov        esi, 0x5d
01f99 90                             nop        
01f9a 90                             nop        
01f9b e8c0a2afff                     call       0x7f3db76cda60
01fa0 0f1f840098200026               nop        dword ptr [rax + rax + 0x26002098]
01fa8 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
01fb2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fb6 e8a52d3718                     call       0x7f3dcff46560
01fbb f4                             hlt        
01fbc be45ffffff                     mov        esi, 0xffffff45
01fc1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01fc9 448b542408                     mov        r10d, dword ptr [rsp + 8]
01fce 44891424                       mov        dword ptr [rsp], r10d
01fd2 90                             nop        
01fd3 e888a2afff                     call       0x7f3db76cda60
01fd8 0f1f8400d0200027               nop        dword ptr [rax + rax + 0x270020d0]
01fe0 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
01fea 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fee e86d2d3718                     call       0x7f3dcff46560
01ff3 f4                             hlt        
01ff4 bef6ffffff                     mov        esi, 0xfffffff6
01ff9 418be8                         mov        ebp, r8d
01ffc 90                             nop        
01ffd 90                             nop        
01ffe 90                             nop        
01fff e85ca2afff                     call       0x7f3db76cda60
02004 0f1f8400fc200028               nop        dword ptr [rax + rax + 0x280020fc]
0200c 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
02016 4883e4f0                       and        rsp, 0xfffffffffffffff0
0201a e8412d3718                     call       0x7f3dcff46560
0201f f4                             hlt        
02020 bef6ffffff                     mov        esi, 0xfffffff6
02025 8be9                           mov        ebp, ecx
02027 e834a2afff                     call       0x7f3db76cda60
0202c 0f1f840024210029               nop        dword ptr [rax + rax + 0x29002124]
02034 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
0203e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02042 e8192d3718                     call       0x7f3dcff46560
02047 f4                             hlt        
02048 bef6ffffff                     mov        esi, 0xfffffff6
0204d 418be8                         mov        ebp, r8d
02050 90                             nop        
02051 90                             nop        
02052 90                             nop        
02053 e808a2afff                     call       0x7f3db76cda60
02058 0f1f84005021002a               nop        dword ptr [rax + rax + 0x2a002150]
02060 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
0206a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0206e e8ed2c3718                     call       0x7f3dcff46560
02073 f4                             hlt        
02074 bef6ffffff                     mov        esi, 0xfffffff6
02079 90                             nop        
0207a 90                             nop        
0207b e8e0a1afff                     call       0x7f3db76cda60
02080 0f1f84007821002b               nop        dword ptr [rax + rax + 0x2b002178]
02088 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
02092 4883e4f0                       and        rsp, 0xfffffffffffffff0
02096 e8c52c3718                     call       0x7f3dcff46560
0209b f4                             hlt        
0209c bef6ffffff                     mov        esi, 0xfffffff6
020a1 90                             nop        
020a2 90                             nop        
020a3 e8b8a1afff                     call       0x7f3db76cda60
020a8 0f1f8400a021002c               nop        dword ptr [rax + rax + 0x2c0021a0]
020b0 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
020ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
020be e89d2c3718                     call       0x7f3dcff46560
020c3 f4                             hlt        
020c4 bef6ffffff                     mov        esi, 0xfffffff6
020c9 90                             nop        
020ca 90                             nop        
020cb e890a1afff                     call       0x7f3db76cda60
020d0 0f1f8400c821002d               nop        dword ptr [rax + rax + 0x2d0021c8]
020d8 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
020e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
020e6 e8752c3718                     call       0x7f3dcff46560
020eb f4                             hlt        
020ec bef6ffffff                     mov        esi, 0xfffffff6
020f1 90                             nop        
020f2 90                             nop        
020f3 e868a1afff                     call       0x7f3db76cda60
020f8 0f1f8400f021002e               nop        dword ptr [rax + rax + 0x2e0021f0]
02100 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
0210a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0210e e84d2c3718                     call       0x7f3dcff46560
02113 f4                             hlt        
02114 bef6ffffff                     mov        esi, 0xfffffff6
02119 90                             nop        
0211a 90                             nop        
0211b e840a1afff                     call       0x7f3db76cda60
02120 0f1f84001822002f               nop        dword ptr [rax + rax + 0x2f002218]
02128 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
02132 4883e4f0                       and        rsp, 0xfffffffffffffff0
02136 e8252c3718                     call       0x7f3dcff46560
0213b f4                             hlt        
0213c bef6ffffff                     mov        esi, 0xfffffff6
02141 90                             nop        
02142 90                             nop        
02143 e818a1afff                     call       0x7f3db76cda60
02148 0f1f840040220030               nop        dword ptr [rax + rax + 0x30002240]
02150 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
0215a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0215e e8fd2b3718                     call       0x7f3dcff46560
02163 f4                             hlt        
02164 bef6ffffff                     mov        esi, 0xfffffff6
02169 90                             nop        
0216a 90                             nop        
0216b e8f0a0afff                     call       0x7f3db76cda60
02170 0f1f840068220031               nop        dword ptr [rax + rax + 0x31002268]
02178 48bf20b526903d7f0000           movabs     rdi, 0x7f3d9026b520
02182 4883e4f0                       and        rsp, 0xfffffffffffffff0
02186 e8d52b3718                     call       0x7f3dcff46560
0218b f4                             hlt        
0218c eb08                           jmp        0x7f3db7bd3996
0218e eb06                           jmp        0x7f3db7bd3996
02190 eb04                           jmp        0x7f3db7bd3996
02192 eb02                           jmp        0x7f3db7bd3996
02194 eb00                           jmp        0x7f3db7bd3996
02196 488bf0                         mov        rsi, rax
02199 e9d2e8ffff                     jmp        0x7f3db7bd2270
0219e 49ba3f22bdb73d7f0000           movabs     r10, 0x7f3db7bd223f
021a8 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
021af e9ace9b5ff                     jmp        0x7f3db7732360
021b4 e827b8b4ff                     call       0x7f3db771f1e0
021b9 e960deffff                     jmp        0x7f3db7bd181e
021be f4                             hlt        
021bf f4                             hlt        
