00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85361d0000                   jne        0x7f4b87e5cfd4
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
00050 0f83c7180000                   jae        0x7f4b87e5cb9d
00056 0fb64c1607                     movzx      ecx, byte ptr [rsi + rdx + 7]
0005b 85c9                           test       ecx, ecx
0005d 0f84d9180000                   je         0x7f4b87e5cbbc
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
0009b 0f8c07170000                   jl         0x7f4b87e5ca28
000a1 85db                           test       ebx, ebx
000a3 0f8c3f1a0000                   jl         0x7f4b87e5cd68
000a9 8b2c24                         mov        ebp, dword ptr [rsp]
000ac 83c5f9                         add        ebp, -7
000af 3bc5                           cmp        eax, ebp
000b1 0f8335190000                   jae        0x7f4b87e5cc6c
000b7 448bd0                         mov        r10d, eax
000ba 4e8b6c1608                     mov        r13, qword ptr [rsi + r10 + 8]
000bf 4183c0f8                       add        r8d, -8
000c3 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000cb 4183c2f0                       add        r10d, -0x10
000cf 4183f808                       cmp        r8d, 8
000d3 0f8c7c170000                   jl         0x7f4b87e5cad5
000d9 85db                           test       ebx, ebx
000db 0f8c4f1a0000                   jl         0x7f4b87e5cdb0
000e1 8b2c24                         mov        ebp, dword ptr [rsp]
000e4 83c5f9                         add        ebp, -7
000e7 443bd5                         cmp        r10d, ebp
000ea 0f833c190000                   jae        0x7f4b87e5ccac
000f0 458bc2                         mov        r8d, r10d
000f3 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
000fb 4b8b740308                     mov        rsi, qword ptr [r11 + r8 + 8]
00100 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
00105 448b4518                       mov        r8d, dword ptr [rbp + 0x18]
00109 4585c0                         test       r8d, r8d
0010c 0f843e180000                   je         0x7f4b87e5cbd0
00112 448b5d1c                       mov        r11d, dword ptr [rbp + 0x1c]
00116 418b4b04                       mov        ecx, dword ptr [r11 + 4]
0011a 448b4d20                       mov        r9d, dword ptr [rbp + 0x20]
0011e 4585c9                         test       r9d, r9d
00121 0f843d180000                   je         0x7f4b87e5cbe4
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
00190 0f84d4080000                   je         0x7f4b87e5bcea
00196 be40000000                     mov        esi, 0x40
0019b 2bf7                           sub        esi, edi
0019d 3bce                           cmp        ecx, esi
0019f 0f8f18020000                   jg         0x7f4b87e5b63d
001a5 2bf1                           sub        esi, ecx
001a7 c4c2cbf7ed                     shrx       rbp, r13, rsi
001ac 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b1 83f940                         cmp        ecx, 0x40
001b4 0f8d7e1a0000                   jge        0x7f4b87e5ceb8
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
001e5 7c34                           jl         0x7f4b87e5b49b
001e7 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
001ec 4183c1c8                       add        r9d, -0x38
001f0 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001f5 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
001fd 8b542408                       mov        edx, dword ptr [rsp + 8]
00201 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00205 6690                           nop        
00207 e8d403aaff                     call       0x7f4b878fb860
0020c 0f1f840004030000               nop        dword ptr [rax + rax + 0x304]
00214 4889442420                     mov        qword ptr [rsp + 0x20], rax
00219 eb31                           jmp        0x7f4b87e5b4cc
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
0025e 0f8d1c190000                   jge        0x7f4b87e5ce00
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
002a5 0f8d19190000                   jge        0x7f4b87e5ce44
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
002ee 0f8e21160000                   jle        0x7f4b87e5cb95
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
0036f 0f8603160000                   jbe        0x7f4b87e5cbf8
00375 4d63d3                         movsxd     r10, r11d
00378 4d63d9                         movsxd     r11, r9d
0037b 49ffcb                         dec        r11
0037e 4d3bda                         cmp        r11, r10
00381 0f83f1150000                   jae        0x7f4b87e5cbf8
00387 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0038c 4585db                         test       r11d, r11d
0038f 0f8cdf160000                   jl         0x7f4b87e5ccf4
00395 8b2c24                         mov        ebp, dword ptr [rsp]
00398 83c5f9                         add        ebp, -7
0039b 89ac24c4000000                 mov        dword ptr [rsp + 0xc4], ebp
003a2 4533db                         xor        r11d, r11d
003a5 4533d2                         xor        r10d, r10d
003a8 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
003b0 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
003b8 e98b020000                     jmp        0x7f4b87e5b8c8
003bd 8be9                           mov        ebp, ecx
003bf 2bee                           sub        ebp, esi
003c1 6690                           nop        
003c3 e81802aaff                     call       0x7f4b878fb860
003c8 0f1f8400c0040001               nop        dword ptr [rax + rax + 0x10004c0]
003d0 4823442428                     and        rax, qword ptr [rsp + 0x28]
003d5 41bb40000000                   mov        r11d, 0x40
003db 442bdd                         sub        r11d, ebp
003de c462d1f7c0                     shlx       r8, rax, rbp
003e3 c462a3f7942498000000           shrx       r10, qword ptr [rsp + 0x98], r11
003ed 4d0bc2                         or         r8, r10
003f0 4c89442460                     mov        qword ptr [rsp + 0x60], r8
003f5 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
003fa e9d6fdffff                     jmp        0x7f4b87e5b455
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
0043a 0f8d000a0000                   jge        0x7f4b87e5c0c0
00440 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0044a 41ba01000000                   mov        r10d, 1
00450 c442d1f7d2                     shlx       r10, r10, rbp
00455 49ffca                         dec        r10
00458 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00460 458bc2                         mov        r8d, r10d
00463 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0046a 83fd40                         cmp        ebp, 0x40
0046d 0f8dad0a0000                   jge        0x7f4b87e5c1a0
00473 c4c2d3f7f9                     shrx       rdi, r9, rbp
00478 41ba01000000                   mov        r10d, 1
0047e c442d1f7d2                     shlx       r10, r10, rbp
00483 49ffca                         dec        r10
00486 4d23d1                         and        r10, r9
00489 418bca                         mov        ecx, r10d
0048c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00493 83fd40                         cmp        ebp, 0x40
00496 0f8d840b0000                   jge        0x7f4b87e5c2a0
0049c c4e2d3f7df                     shrx       rbx, rdi, rbp
004a1 41ba01000000                   mov        r10d, 1
004a7 c442d1f7d2                     shlx       r10, r10, rbp
004ac 49ffca                         dec        r10
004af 4c23d7                         and        r10, rdi
004b2 458bd2                         mov        r10d, r10d
004b5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004bc 83fd40                         cmp        ebp, 0x40
004bf 0f8d5f0c0000                   jge        0x7f4b87e5c3a4
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
00515 0f8e2d070000                   jle        0x7f4b87e5bec8
0051b 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00522 0f8fec0c0000                   jg         0x7f4b87e5c494
00528 4181faffff0100                 cmp        r10d, 0x1ffff
0052f 0f8fd70d0000                   jg         0x7f4b87e5c58c
00535 81fbffff0300                   cmp        ebx, 0x3ffff
0053b 0f8f9f0e0000                   jg         0x7f4b87e5c660
00541 458bc9                         mov        r9d, r9d
00544 4181f900000010                 cmp        r9d, 0x10000000
0054b 0f83630f0000                   jae        0x7f4b87e5c734
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
00581 0f8db0000000                   jge        0x7f4b87e5b8b7
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
005cf 0f8dcf0f0000                   jge        0x7f4b87e5c824
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
00610 0f8d1e100000                   jge        0x7f4b87e5c8b4
00616 41b901000000                   mov        r9d, 1
0061c 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00624 c44221f7d9                     shlx       r11d, r9d, r11d
00629 41ffcb                         dec        r11d
0062c 4523d8                         and        r11d, r8d
0062f 4503da                         add        r11d, r10d
00632 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00637 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0063b 0f8dae030000                   jge        0x7f4b87e5bc6f
00641 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00648 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0064d 4423442460                     and        r8d, dword ptr [rsp + 0x60]
00652 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00657 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
0065b 458b5304                       mov        r10d, dword ptr [r11 + 4]
0065f 453bc2                         cmp        r8d, r10d
00662 0f8312040000                   jae        0x7f4b87e5bcfa
00668 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
0066c 234c2468                       and        ecx, dword ptr [rsp + 0x68]
00670 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00675 458b4914                       mov        r9d, dword ptr [r9 + 0x14]
00679 458b5104                       mov        r10d, dword ptr [r9 + 4]
0067d 4f8b5cc308                     mov        r11, qword ptr [r11 + r8*8 + 8]
00682 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
00687 413bca                         cmp        ecx, r10d
0068a 0f8374040000                   jae        0x7f4b87e5bd84
00690 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
00695 4423442448                     and        r8d, dword ptr [rsp + 0x48]
0069a 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0069f 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
006a3 418b5a04                       mov        ebx, dword ptr [r10 + 4]
006a7 4d8b5cc908                     mov        r11, qword ptr [r9 + rcx*8 + 8]
006ac 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
006b4 443bc3                         cmp        r8d, ebx
006b7 0f83e3040000                   jae        0x7f4b87e5be20
006bd 4f8b54c208                     mov        r10, qword ptr [r10 + r8*8 + 8]
006c2 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006ca 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006d1 ffc5                           inc        ebp
006d3 892c24                         mov        dword ptr [rsp], ebp
006d6 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006da 0f8dde020000                   jge        0x7f4b87e5bc3e
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
007a6 0f8490050000                   je         0x7f4b87e5bfbc
007ac 4183f83f                       cmp        r8d, 0x3f
007b0 0f8f62060000                   jg         0x7f4b87e5c098
007b6 b940000000                     mov        ecx, 0x40
007bb 2b4c243c                       sub        ecx, dword ptr [rsp + 0x3c]
007bf 443bc1                         cmp        r8d, ecx
007c2 7e47                           jle        0x7f4b87e5ba8b
007c4 458bc8                         mov        r9d, r8d
007c7 442bc9                         sub        r9d, ecx
007ca 83f940                         cmp        ecx, 0x40
007cd 0f8de90e0000                   jge        0x7f4b87e5c93c
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
00809 eb26                           jmp        0x7f4b87e5bab1
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
0084f 0f8cdbfbffff                   jl         0x7f4b87e5b6b0
00855 4183c2c0                       add        r10d, -0x40
00859 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0085e 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00862 83c5f8                         add        ebp, -8
00865 896c240c                       mov        dword ptr [rsp + 0xc], ebp
00869 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0086d 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
00871 83c1f0                         add        ecx, -0x10
00874 83f908                         cmp        ecx, 8
00877 0f8cf3000000                   jl         0x7f4b87e5bbf0
0087d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00882 4183c2e8                       add        r10d, -0x18
00886 443b9424c4000000               cmp        r10d, dword ptr [rsp + 0xc4]
0088e 0f826bfbffff                   jb         0x7f4b87e5b67f
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
00963 e8787ab6ff                     call       0x7f4b879c3660
00968 0f1f8400600a0002               nop        dword ptr [rax + rax + 0x2000a60]
00970 85c9                           test       ecx, ecx
00972 7f08                           jg         0x7f4b87e5bbfc
00974 4533d2                         xor        r10d, r10d
00977 e990faffff                     jmp        0x7f4b87e5b68c
0097c 8be9                           mov        ebp, ecx
0097e 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00986 8b542408                       mov        edx, dword ptr [rsp + 8]
0098a 90                             nop        
0098b e850fca9ff                     call       0x7f4b878fb860
00990 0f1f8400880a0003               nop        dword ptr [rax + rax + 0x3000a88]
00998 448b542408                     mov        r10d, dword ptr [rsp + 8]
0099d 41c1e203                       shl        r10d, 3
009a1 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
009a6 41c1e003                       shl        r8d, 3
009aa 452bd0                         sub        r10d, r8d
009ad 4181c2c0000000                 add        r10d, 0xc0
009b4 c462a9f7d0                     shlx       r10, rax, r10
009b9 e94efaffff                     jmp        0x7f4b87e5b68c
009be 4533db                         xor        r11d, r11d
009c1 4533d2                         xor        r10d, r10d
009c4 4533c9                         xor        r9d, r9d
009c7 4533c0                         xor        r8d, r8d
009ca 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
009d2 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
009da 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
009e2 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
009ea e94efdffff                     jmp        0x7f4b87e5b9bd
009ef 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009f7 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009ff 4d03c2                         add        r8, r10
00a02 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
00a0a 4d3bc2                         cmp        r8, r10
00a0d 7e32                           jle        0x7f4b87e5bcc1
00a0f 48be08ae72e200000000           movabs     rsi, 0xe272ae08
00a19 6690                           nop        
00a1b e8c0fba9ff                     call       0x7f4b878fb860
00a20 0f1f8400180b0004               nop        dword ptr [rax + rax + 0x4000b18]
00a28 4885c0                         test       rax, rax
00a2b 0f84df110000                   je         0x7f4b87e5ce90
00a31 488bf0                         mov        rsi, rax
00a34 4881c410010000                 add        rsp, 0x110
00a3b 5d                             pop        rbp
00a3c e99ff8b6ff                     jmp        0x7f4b879cb560
00a41 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a46 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a4e 0f85d0110000                   jne        0x7f4b87e5cea4
00a54 418bc0                         mov        eax, r8d
00a57 4881c410010000                 add        rsp, 0x110
00a5e 5d                             pop        rbp
00a5f 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a63 0f87d5120000                   ja         0x7f4b87e5cfbe
00a69 c3                             ret        
00a6a 4533db                         xor        r11d, r11d
00a6d 4533d2                         xor        r10d, r10d
00a70 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00a75 e95bf7ffff                     jmp        0x7f4b87e5b455
00a7a bee4ffffff                     mov        esi, 0xffffffe4
00a7f 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a87 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00a8c 44890c24                       mov        dword ptr [rsp], r9d
00a90 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00a95 4489542404                     mov        dword ptr [rsp + 4], r10d
00a9a 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00a9f 44894c2408                     mov        dword ptr [rsp + 8], r9d
00aa4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00aa9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00aae 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00ab3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00ab8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00abd 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00ac2 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00ac7 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
00acc 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00ad1 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00ad6 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00adb 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00ae0 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00ae5 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00aea 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00aef 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
00af4 666690                         nop        
00af7 e8e478b6ff                     call       0x7f4b879c3660
00afc 0f1f8400f40b0005               nop        dword ptr [rax + rax + 0x5000bf4]
00b04 bee4ffffff                     mov        esi, 0xffffffe4
00b09 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b11 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b16 44891c24                       mov        dword ptr [rsp], r11d
00b1a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00b1f 4489542404                     mov        dword ptr [rsp + 4], r10d
00b24 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b29 44895c2408                     mov        dword ptr [rsp + 8], r11d
00b2e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b33 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b38 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00b3d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00b42 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00b47 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00b4c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00b51 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00b56 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00b5b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00b60 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00b65 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00b6a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00b6f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00b74 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00b79 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00b7e 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00b83 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00b88 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
00b8d 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00b91 6690                           nop        
00b93 e84878b6ff                     call       0x7f4b879c3660
00b98 0f1f8400900c0006               nop        dword ptr [rax + rax + 0x6000c90]
00ba0 bee4ffffff                     mov        esi, 0xffffffe4
00ba5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00bad 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00bb2 44890c24                       mov        dword ptr [rsp], r9d
00bb6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00bbb 44895c2404                     mov        dword ptr [rsp + 4], r11d
00bc0 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00bc5 44894c2408                     mov        dword ptr [rsp + 8], r9d
00bca 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00bcf 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00bd4 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00bd9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00bde 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00be3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00be8 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00bed 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
00bf2 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00bf7 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00bfc 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00c01 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00c06 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00c0b 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00c10 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00c15 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00c1a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00c1f 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00c24 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00c29 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00c2e 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00c33 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
00c38 666690                         nop        
00c3b e8a077b6ff                     call       0x7f4b879c3660
00c40 0f1f8400380d0007               nop        dword ptr [rax + rax + 0x7000d38]
00c48 4533db                         xor        r11d, r11d
00c4b 4d3bcb                         cmp        r9, r11
00c4e bdffffffff                     mov        ebp, 0xffffffff
00c53 7c08                           jl         0x7f4b87e5bedd
00c55 400f95c5                       setne      bpl
00c59 400fb6ed                       movzx      ebp, bpl
00c5d be45ffffff                     mov        esi, 0xffffff45
00c62 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00c6a 4c891c24                       mov        qword ptr [rsp], r11
00c6e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00c73 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00c78 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00c80 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00c85 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00c8a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00c8f 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
00c93 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
00c97 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00c9c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00ca1 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
00ca5 894c2434                       mov        dword ptr [rsp + 0x34], ecx
00ca9 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00cae 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00cb3 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
00cb7 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
00cbb 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00cc0 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00cc5 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
00ccc 894c2444                       mov        dword ptr [rsp + 0x44], ecx
00cd0 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00cd5 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00cda 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
00cde 894c2454                       mov        dword ptr [rsp + 0x54], ecx
00ce2 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00ce7 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00cec 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00cf1 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00cf6 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00cfe 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00d03 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00d0b 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
00d10 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00d18 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
00d1f 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d27 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00d2f e8ac76b6ff                     call       0x7f4b879c3660
00d34 0f1f84002c0e0008               nop        dword ptr [rax + rax + 0x8000e2c]
00d3c be45ffffff                     mov        esi, 0xffffff45
00d41 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00d49 448b542408                     mov        r10d, dword ptr [rsp + 8]
00d4e 44891424                       mov        dword ptr [rsp], r10d
00d52 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00d57 44895c2404                     mov        dword ptr [rsp + 4], r11d
00d5c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00d61 4489542408                     mov        dword ptr [rsp + 8], r10d
00d66 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00d6b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d70 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00d75 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00d7a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00d7f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00d84 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00d89 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00d8e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00d93 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00d98 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00d9d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00da2 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00da7 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00dac 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00db1 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00db6 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00dbb 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00dc0 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00dc5 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00dca 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00dcf 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00dd4 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00dd9 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00dde 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00de3 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00de8 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00df0 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00df5 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00dfd 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00e02 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00e0a 90                             nop        
00e0b e8d075b6ff                     call       0x7f4b879c3660
00e10 0f1f8400080f0009               nop        dword ptr [rax + rax + 0x9000f08]
00e18 be45ffffff                     mov        esi, 0xffffff45
00e1d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e25 448b542408                     mov        r10d, dword ptr [rsp + 8]
00e2a 44891424                       mov        dword ptr [rsp], r10d
00e2e 4489442408                     mov        dword ptr [rsp + 8], r8d
00e33 e8a875b6ff                     call       0x7f4b879c3660
00e38 0f1f8400300f000a               nop        dword ptr [rax + rax + 0xa000f30]
00e40 be45ffffff                     mov        esi, 0xffffff45
00e45 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e4d 448b542408                     mov        r10d, dword ptr [rsp + 8]
00e52 44891424                       mov        dword ptr [rsp], r10d
00e56 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00e5b 44895c2404                     mov        dword ptr [rsp + 4], r11d
00e60 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00e65 4489542408                     mov        dword ptr [rsp + 8], r10d
00e6a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00e72 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00e77 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e7c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e81 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00e86 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00e8b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00e90 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00e95 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00e9a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00e9f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00ea4 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00ea9 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00eae 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00eb3 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00eb8 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00ebd 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00ec2 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00ec7 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00ecc 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00ed1 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00ed6 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00edb 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00ee0 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00ee5 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00eea 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00eef 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00ef4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00ef9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00f01 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00f06 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00f0e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00f13 e8c874b6ff                     call       0x7f4b879c3660
00f18 0f1f84001010000b               nop        dword ptr [rax + rax + 0xb001010]
00f20 be45ffffff                     mov        esi, 0xffffff45
00f25 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00f2d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00f32 44891c24                       mov        dword ptr [rsp], r11d
00f36 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00f3b 4489542404                     mov        dword ptr [rsp + 4], r10d
00f40 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00f45 44895c2408                     mov        dword ptr [rsp + 8], r11d
00f4a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00f52 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f57 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f5c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f61 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00f66 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00f6b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00f70 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00f75 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00f7a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00f7f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00f84 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00f89 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00f8e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00f93 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00f98 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00f9d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00fa2 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00fa7 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00fac 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00fb1 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00fb6 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00fbb 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00fc0 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00fc5 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00fca 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00fcf 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00fd4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00fd9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00fe1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00fe6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00fee 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00ff3 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
00ffb 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01000 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
01008 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
01010 666690                         nop        
01013 e8c873b6ff                     call       0x7f4b879c3660
01018 0f1f84001011000c               nop        dword ptr [rax + rax + 0xc001110]
01020 be45ffffff                     mov        esi, 0xffffff45
01025 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0102d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01032 44891424                       mov        dword ptr [rsp], r10d
01036 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0103b 44895c2404                     mov        dword ptr [rsp + 4], r11d
01040 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01045 4489542408                     mov        dword ptr [rsp + 8], r10d
0104a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01052 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01057 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0105c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01061 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01066 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0106b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01070 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01075 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0107a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0107f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01084 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01089 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0108e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01093 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01098 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0109d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
010a2 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
010a7 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
010ac 4489542438                     mov        dword ptr [rsp + 0x38], r10d
010b1 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
010b6 4489542448                     mov        dword ptr [rsp + 0x48], r10d
010bb 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
010c0 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
010c5 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
010ca 4489542450                     mov        dword ptr [rsp + 0x50], r10d
010cf 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
010d4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
010d9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
010e1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
010e6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
010ee 4c89542468                     mov        qword ptr [rsp + 0x68], r10
010f3 448b9c24d4000000               mov        r11d, dword ptr [rsp + 0xd4]
010fb 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01100 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
01108 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
0110f 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
01117 e8c472b6ff                     call       0x7f4b879c3660
0111c 0f1f84001412000d               nop        dword ptr [rax + rax + 0xd001214]
01124 be45ffffff                     mov        esi, 0xffffff45
01129 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01131 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01136 44890c24                       mov        dword ptr [rsp], r9d
0113a 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0113f 44895c2404                     mov        dword ptr [rsp + 4], r11d
01144 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01149 44894c2408                     mov        dword ptr [rsp + 8], r9d
0114e 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01153 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01158 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0115d 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01162 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01167 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0116c 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01171 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01176 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0117b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01180 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01185 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0118a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0118f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01194 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01199 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0119e 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
011a3 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
011a8 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
011ad 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
011b2 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
011b7 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
011bc 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
011c1 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
011c6 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
011cb 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
011d0 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
011d8 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
011dd 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
011e5 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
011ea 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
011ef 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
011f6 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
011fe 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
01206 90                             nop        
01207 e8d471b6ff                     call       0x7f4b879c3660
0120c 0f1f84000413000e               nop        dword ptr [rax + rax + 0xe001304]
01214 41bbffffff7f                   mov        r11d, 0x7fffffff
0121a 4d3bcb                         cmp        r9, r11
0121d bdffffffff                     mov        ebp, 0xffffffff
01222 7c08                           jl         0x7f4b87e5c4ac
01224 400f95c5                       setne      bpl
01228 400fb6ed                       movzx      ebp, bpl
0122c be45ffffff                     mov        esi, 0xffffff45
01231 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
01239 4c891c24                       mov        qword ptr [rsp], r11
0123d 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01242 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01247 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0124f 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01254 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
01258 894c2414                       mov        dword ptr [rsp + 0x14], ecx
0125c 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01261 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01266 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
0126a 894c2430                       mov        dword ptr [rsp + 0x30], ecx
0126e 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01273 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01278 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
0127c 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01280 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01285 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0128a 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
0128e 894c2440                       mov        dword ptr [rsp + 0x40], ecx
01292 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
0129a 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0129f 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
012a3 894c2450                       mov        dword ptr [rsp + 0x50], ecx
012a7 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
012ac 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
012b1 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
012b5 894c2458                       mov        dword ptr [rsp + 0x58], ecx
012b9 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
012be 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
012c3 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
012cb 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
012d0 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
012d8 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
012dd 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
012e5 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
012ec 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
012f4 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
012fc 666690                         nop        
012ff e8dc70b6ff                     call       0x7f4b879c3660
01304 0f1f8400fc13000f               nop        dword ptr [rax + rax + 0xf0013fc]
0130c be45ffffff                     mov        esi, 0xffffff45
01311 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01319 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0131e 44891c24                       mov        dword ptr [rsp], r11d
01322 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01327 44895c2404                     mov        dword ptr [rsp + 4], r11d
0132c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01331 44895c2408                     mov        dword ptr [rsp + 8], r11d
01336 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0133b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01340 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01345 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0134a 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0134f 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01354 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01359 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0135e 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01363 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01368 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0136d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01372 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01377 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0137c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01381 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01386 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0138b 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01390 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01395 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0139a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0139f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
013a4 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
013a9 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
013ae 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
013b3 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
013b8 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
013c0 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
013c5 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
013ca 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
013d2 90                             nop        
013d3 e80870b6ff                     call       0x7f4b879c3660
013d8 0f1f8400d0140010               nop        dword ptr [rax + rax + 0x100014d0]
013e0 be45ffffff                     mov        esi, 0xffffff45
013e5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013ed 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
013f2 44891c24                       mov        dword ptr [rsp], r11d
013f6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
013fb 44895c2404                     mov        dword ptr [rsp + 4], r11d
01400 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01405 44895c2408                     mov        dword ptr [rsp + 8], r11d
0140a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0140f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01414 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01419 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0141e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01423 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01428 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0142d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01432 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01437 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0143c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01441 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01446 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0144b 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01450 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01455 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0145a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0145f 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01464 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01469 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0146e 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01473 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01478 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0147d 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01482 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01487 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0148c 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01494 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01499 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
0149e 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
014a5 6690                           nop        
014a7 e8346fb6ff                     call       0x7f4b879c3660
014ac 0f1f8400a4150011               nop        dword ptr [rax + rax + 0x110015a4]
014b4 be3dffffff                     mov        esi, 0xffffff3d
014b9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014c1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
014c6 44891c24                       mov        dword ptr [rsp], r11d
014ca 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
014ce 894c2404                       mov        dword ptr [rsp + 4], ecx
014d2 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
014d7 44895c2408                     mov        dword ptr [rsp + 8], r11d
014dc 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
014e1 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
014e6 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
014ea 894c240c                       mov        dword ptr [rsp + 0xc], ecx
014ee 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
014f3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
014f8 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
014fc 894c2424                       mov        dword ptr [rsp + 0x24], ecx
01500 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01505 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0150a 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
0150e 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01512 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01517 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0151c 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
01520 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01524 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01529 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0152e 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
01535 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
01539 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0153e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01543 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
01547 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
0154b 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01550 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01555 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0155a 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
0155f 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
01567 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0156c 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
01574 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
01579 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
0157e 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01586 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
0158d 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
01595 6690                           nop        
01597 e8446eb6ff                     call       0x7f4b879c3660
0159c 0f1f840094160012               nop        dword ptr [rax + rax + 0x12001694]
015a4 be45ffffff                     mov        esi, 0xffffff45
015a9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015b1 448b542408                     mov        r10d, dword ptr [rsp + 8]
015b6 44891424                       mov        dword ptr [rsp], r10d
015ba 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
015bf 4489542404                     mov        dword ptr [rsp + 4], r10d
015c4 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
015c9 44895c2408                     mov        dword ptr [rsp + 8], r11d
015ce 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015d3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015d8 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
015dd 448954240c                     mov        dword ptr [rsp + 0xc], r10d
015e2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
015e7 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
015ec 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
015f1 4489542424                     mov        dword ptr [rsp + 0x24], r10d
015f6 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
015fb 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01600 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01605 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0160a 894c2430                       mov        dword ptr [rsp + 0x30], ecx
0160e 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01613 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01618 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
0161d 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01622 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01626 90                             nop        
01627 e8b46db6ff                     call       0x7f4b879c3660
0162c 0f1f840024170013               nop        dword ptr [rax + rax + 0x13001724]
01634 be45ffffff                     mov        esi, 0xffffff45
01639 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01641 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01646 44890c24                       mov        dword ptr [rsp], r9d
0164a 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0164f 44894c2404                     mov        dword ptr [rsp + 4], r9d
01654 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01659 44895c2408                     mov        dword ptr [rsp + 8], r11d
0165e 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01663 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01668 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0166d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01672 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01677 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0167c 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01681 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01686 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0168b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01690 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01695 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0169a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0169f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
016a4 4489542454                     mov        dword ptr [rsp + 0x54], r10d
016a9 4489442458                     mov        dword ptr [rsp + 0x58], r8d
016ae 90                             nop        
016af e82c6db6ff                     call       0x7f4b879c3660
016b4 0f1f8400ac170014               nop        dword ptr [rax + rax + 0x140017ac]
016bc be45ffffff                     mov        esi, 0xffffff45
016c1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
016c9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
016ce 44891c24                       mov        dword ptr [rsp], r11d
016d2 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
016d7 4489542404                     mov        dword ptr [rsp + 4], r10d
016dc 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
016e1 44895c2408                     mov        dword ptr [rsp + 8], r11d
016e6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016eb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016f0 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
016f5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
016fa 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
016ff 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01704 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01709 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0170e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01713 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01718 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0171d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01722 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01727 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0172c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01731 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01736 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0173b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01740 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01745 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0174a 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0174f 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01754 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01759 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0175e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01763 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01768 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01770 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01775 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0177d 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01782 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
0178a 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
01792 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
01799 6690                           nop        
0179b e8406cb6ff                     call       0x7f4b879c3660
017a0 0f1f840098180015               nop        dword ptr [rax + rax + 0x15001898]
017a8 4585c0                         test       r8d, r8d
017ab 7f08                           jg         0x7f4b87e5ca35
017ad 4533ed                         xor        r13d, r13d
017b0 e90ae9ffff                     jmp        0x7f4b87e5b33f
017b5 8954242c                       mov        dword ptr [rsp + 0x2c], edx
017b9 4489742428                     mov        dword ptr [rsp + 0x28], r14d
017be 897c241c                       mov        dword ptr [rsp + 0x1c], edi
017c2 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
017c7 89442414                       mov        dword ptr [rsp + 0x14], eax
017cb 895c2410                       mov        dword ptr [rsp + 0x10], ebx
017cf 448944240c                     mov        dword ptr [rsp + 0xc], r8d
017d4 48894424f8                     mov        qword ptr [rsp - 8], rax
017d9 8b0424                         mov        eax, dword ptr [rsp]
017dc 89442404                       mov        dword ptr [rsp + 4], eax
017e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017e5 48894424f8                     mov        qword ptr [rsp - 8], rax
017ea 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
017f1 890424                         mov        dword ptr [rsp], eax
017f4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017f9 488bee                         mov        rbp, rsi
017fc 8b542408                       mov        edx, dword ptr [rsp + 8]
01800 418bc8                         mov        ecx, r8d
01803 e8d8eda9ff                     call       0x7f4b878fb860
01808 0f1f840000190016               nop        dword ptr [rax + rax + 0x16001900]
01810 41bb40000000                   mov        r11d, 0x40
01816 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
0181b c462a1f7e8                     shlx       r13, rax, r11
01820 48894424f8                     mov        qword ptr [rsp - 8], rax
01825 8b442404                       mov        eax, dword ptr [rsp + 4]
01829 890424                         mov        dword ptr [rsp], eax
0182c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01831 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
01836 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
0183a 8b442414                       mov        eax, dword ptr [rsp + 0x14]
0183e 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01843 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
01847 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
0184c 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01850 e96ae8ffff                     jmp        0x7f4b87e5b33f
01855 4585c0                         test       r8d, r8d
01858 7f07                           jg         0x7f4b87e5cae1
0185a 33f6                           xor        esi, esi
0185c e99fe8ffff                     jmp        0x7f4b87e5b380
01861 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01866 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
0186b 8954242c                       mov        dword ptr [rsp + 0x2c], edx
0186f 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01874 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01878 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0187d 89442414                       mov        dword ptr [rsp + 0x14], eax
01881 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01885 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0188a 48894424f8                     mov        qword ptr [rsp - 8], rax
0188f 8b0424                         mov        eax, dword ptr [rsp]
01892 89442404                       mov        dword ptr [rsp + 4], eax
01896 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0189b 48894424f8                     mov        qword ptr [rsp - 8], rax
018a0 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
018a7 890424                         mov        dword ptr [rsp], eax
018aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018af 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
018b7 488bf5                         mov        rsi, rbp
018ba 8b542408                       mov        edx, dword ptr [rsp + 8]
018be 418bc8                         mov        ecx, r8d
018c1 6690                           nop        
018c3 e818eda9ff                     call       0x7f4b878fb860
018c8 0f1f8400c0190017               nop        dword ptr [rax + rax + 0x170019c0]
018d0 41bb80000000                   mov        r11d, 0x80
018d6 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
018db c4e2a1f7f0                     shlx       rsi, rax, r11
018e0 48894424f8                     mov        qword ptr [rsp - 8], rax
018e5 8b442404                       mov        eax, dword ptr [rsp + 4]
018e9 890424                         mov        dword ptr [rsp], eax
018ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018f1 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
018f5 8b442414                       mov        eax, dword ptr [rsp + 0x14]
018f9 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
018fd 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
01902 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01906 4c8b6c2430                     mov        r13, qword ptr [rsp + 0x30]
0190b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01910 e9ebe7ffff                     jmp        0x7f4b87e5b380
01915 4533c0                         xor        r8d, r8d
01918 e9daf0ffff                     jmp        0x7f4b87e5bc77
0191d bee4ffffff                     mov        esi, 0xffffffe4
01922 48ffb42490000000               push       qword ptr [rsp + 0x90]
0192a 488f0424                       pop        qword ptr [rsp]
0192e 90                             nop        
0192f e8ac6ab6ff                     call       0x7f4b879c3660
01934 0f1f84002c1a0018               nop        dword ptr [rax + rax + 0x18001a2c]
0193c be5d000000                     mov        esi, 0x5d
01941 6690                           nop        
01943 e8986ab6ff                     call       0x7f4b879c3660
01948 0f1f8400401a0019               nop        dword ptr [rax + rax + 0x19001a40]
01950 bef6ffffff                     mov        esi, 0xfffffff6
01955 6690                           nop        
01957 e8846ab6ff                     call       0x7f4b879c3660
0195c 0f1f8400541a001a               nop        dword ptr [rax + rax + 0x1a001a54]
01964 bef6ffffff                     mov        esi, 0xfffffff6
01969 6690                           nop        
0196b e8706ab6ff                     call       0x7f4b879c3660
01970 0f1f8400681a001b               nop        dword ptr [rax + rax + 0x1b001a68]
01978 be6effffff                     mov        esi, 0xffffff6e
0197d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01985 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0198a 44891c24                       mov        dword ptr [rsp], r11d
0198e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01993 44895c2408                     mov        dword ptr [rsp + 8], r11d
01998 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0199d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
019a2 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
019a7 448954240c                     mov        dword ptr [rsp + 0xc], r10d
019ac 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
019b1 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
019b6 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
019bb 4489542424                     mov        dword ptr [rsp + 0x24], r10d
019c0 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
019c5 4489542428                     mov        dword ptr [rsp + 0x28], r10d
019ca 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
019cf 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
019d4 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
019d9 4489542430                     mov        dword ptr [rsp + 0x30], r10d
019de 90                             nop        
019df e8fc69b6ff                     call       0x7f4b879c3660
019e4 0f1f8400dc1a001c               nop        dword ptr [rax + rax + 0x1c001adc]
019ec bee4ffffff                     mov        esi, 0xffffffe4
019f1 48ffb42490000000               push       qword ptr [rsp + 0x90]
019f9 488f0424                       pop        qword ptr [rsp]
019fd 89442418                       mov        dword ptr [rsp + 0x18], eax
01a01 48894424f8                     mov        qword ptr [rsp - 8], rax
01a06 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a0d 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01a11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a16 897c2428                       mov        dword ptr [rsp + 0x28], edi
01a1a 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01a1e 90                             nop        
01a1f e8bc69b6ff                     call       0x7f4b879c3660
01a24 0f1f84001c1b001d               nop        dword ptr [rax + rax + 0x1d001b1c]
01a2c bee4ffffff                     mov        esi, 0xffffffe4
01a31 48ffb42490000000               push       qword ptr [rsp + 0x90]
01a39 488f0424                       pop        qword ptr [rsp]
01a3d 48894424f8                     mov        qword ptr [rsp - 8], rax
01a42 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a49 89442418                       mov        dword ptr [rsp + 0x18], eax
01a4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a52 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01a56 89542428                       mov        dword ptr [rsp + 0x28], edx
01a5a 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01a5f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01a64 666690                         nop        
01a67 e87469b6ff                     call       0x7f4b879c3660
01a6c 0f1f8400641b001e               nop        dword ptr [rax + rax + 0x1e001b64]
01a74 bebeffffff                     mov        esi, 0xffffffbe
01a79 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a81 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01a86 44891c24                       mov        dword ptr [rsp], r11d
01a8a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01a8f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01a94 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a99 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a9e 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01aa3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01aa8 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01aad 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01ab2 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01ab7 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01abc 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01ac1 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01ac6 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01acb 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01ad0 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01ad5 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01ada 90                             nop        
01adb e80069b6ff                     call       0x7f4b879c3660
01ae0 0f1f8400d81b001f               nop        dword ptr [rax + rax + 0x1f001bd8]
01ae8 beccffffff                     mov        esi, 0xffffffcc
01aed 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01af5 448b542408                     mov        r10d, dword ptr [rsp + 8]
01afa 44891424                       mov        dword ptr [rsp], r10d
01afe 89442410                       mov        dword ptr [rsp + 0x10], eax
01b02 48894424f8                     mov        qword ptr [rsp - 8], rax
01b07 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b0e 89442414                       mov        dword ptr [rsp + 0x14], eax
01b12 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b17 897c2418                       mov        dword ptr [rsp + 0x18], edi
01b1b 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01b1f 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
01b23 e8b868b6ff                     call       0x7f4b879c3660
01b28 0f1f8400201c0020               nop        dword ptr [rax + rax + 0x20001c20]
01b30 beccffffff                     mov        esi, 0xffffffcc
01b35 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b3d 448b442408                     mov        r8d, dword ptr [rsp + 8]
01b42 44890424                       mov        dword ptr [rsp], r8d
01b46 48894424f8                     mov        qword ptr [rsp - 8], rax
01b4b 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b52 89442410                       mov        dword ptr [rsp + 0x10], eax
01b56 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b5b 897c2414                       mov        dword ptr [rsp + 0x14], edi
01b5f 89542418                       mov        dword ptr [rsp + 0x18], edx
01b63 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
01b68 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01b6d 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01b71 6690                           nop        
01b73 e86868b6ff                     call       0x7f4b879c3660
01b78 0f1f8400701c0021               nop        dword ptr [rax + rax + 0x21001c70]
01b80 be45ffffff                     mov        esi, 0xffffff45
01b85 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b8d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01b92 44891424                       mov        dword ptr [rsp], r10d
01b96 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b9b 4489542408                     mov        dword ptr [rsp + 8], r10d
01ba0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ba5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01baa 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01baf 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01bb4 666690                         nop        
01bb7 e82468b6ff                     call       0x7f4b879c3660
01bbc 0f1f8400b41c0022               nop        dword ptr [rax + rax + 0x22001cb4]
01bc4 be45ffffff                     mov        esi, 0xffffff45
01bc9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01bd1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01bd6 44891c24                       mov        dword ptr [rsp], r11d
01bda 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01bdf 44895c2408                     mov        dword ptr [rsp + 8], r11d
01be4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01be9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01bee 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01bf3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01bf8 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01bfd 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01c02 90                             nop        
01c03 e8d867b6ff                     call       0x7f4b879c3660
01c08 0f1f8400001d0023               nop        dword ptr [rax + rax + 0x23001d00]
01c10 bef6ffffff                     mov        esi, 0xfffffff6
01c15 6690                           nop        
01c17 e8c467b6ff                     call       0x7f4b879c3660
01c1c 0f1f8400141d0024               nop        dword ptr [rax + rax + 0x24001d14]
01c24 be5d000000                     mov        esi, 0x5d
01c29 6690                           nop        
01c2b e8b067b6ff                     call       0x7f4b879c3660
01c30 0f1f8400281d0025               nop        dword ptr [rax + rax + 0x25001d28]
01c38 be45ffffff                     mov        esi, 0xffffff45
01c3d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c45 448b542408                     mov        r10d, dword ptr [rsp + 8]
01c4a 44891424                       mov        dword ptr [rsp], r10d
01c4e 90                             nop        
01c4f e88c67b6ff                     call       0x7f4b879c3660
01c54 0f1f84004c1d0026               nop        dword ptr [rax + rax + 0x26001d4c]
01c5c bef6ffffff                     mov        esi, 0xfffffff6
01c61 418be8                         mov        ebp, r8d
01c64 666690                         nop        
01c67 e87467b6ff                     call       0x7f4b879c3660
01c6c 0f1f8400641d0027               nop        dword ptr [rax + rax + 0x27001d64]
01c74 bef6ffffff                     mov        esi, 0xfffffff6
01c79 8be9                           mov        ebp, ecx
01c7b e86067b6ff                     call       0x7f4b879c3660
01c80 0f1f8400781d0028               nop        dword ptr [rax + rax + 0x28001d78]
01c88 bef6ffffff                     mov        esi, 0xfffffff6
01c8d 418be8                         mov        ebp, r8d
01c90 666690                         nop        
01c93 e84867b6ff                     call       0x7f4b879c3660
01c98 0f1f8400901d0029               nop        dword ptr [rax + rax + 0x29001d90]
01ca0 bef6ffffff                     mov        esi, 0xfffffff6
01ca5 6690                           nop        
01ca7 e83467b6ff                     call       0x7f4b879c3660
01cac 0f1f8400a41d002a               nop        dword ptr [rax + rax + 0x2a001da4]
01cb4 bef6ffffff                     mov        esi, 0xfffffff6
01cb9 6690                           nop        
01cbb e82067b6ff                     call       0x7f4b879c3660
01cc0 0f1f8400b81d002b               nop        dword ptr [rax + rax + 0x2b001db8]
01cc8 bef6ffffff                     mov        esi, 0xfffffff6
01ccd 6690                           nop        
01ccf e80c67b6ff                     call       0x7f4b879c3660
01cd4 0f1f8400cc1d002c               nop        dword ptr [rax + rax + 0x2c001dcc]
01cdc bef6ffffff                     mov        esi, 0xfffffff6
01ce1 6690                           nop        
01ce3 e8f866b6ff                     call       0x7f4b879c3660
01ce8 0f1f8400e01d002d               nop        dword ptr [rax + rax + 0x2d001de0]
01cf0 bef6ffffff                     mov        esi, 0xfffffff6
01cf5 6690                           nop        
01cf7 e8e466b6ff                     call       0x7f4b879c3660
01cfc 0f1f8400f41d002e               nop        dword ptr [rax + rax + 0x2e001df4]
01d04 bef6ffffff                     mov        esi, 0xfffffff6
01d09 6690                           nop        
01d0b e8d066b6ff                     call       0x7f4b879c3660
01d10 0f1f8400081e002f               nop        dword ptr [rax + rax + 0x2f001e08]
01d18 bef6ffffff                     mov        esi, 0xfffffff6
01d1d 6690                           nop        
01d1f e8bc66b6ff                     call       0x7f4b879c3660
01d24 0f1f84001c1e0030               nop        dword ptr [rax + rax + 0x30001e1c]
01d2c eb08                           jmp        0x7f4b87e5cfb6
01d2e eb06                           jmp        0x7f4b87e5cfb6
01d30 eb04                           jmp        0x7f4b87e5cfb6
01d32 eb02                           jmp        0x7f4b87e5cfb6
01d34 eb00                           jmp        0x7f4b87e5cfb6
01d36 488bf0                         mov        rsi, rax
01d39 e9f6ecffff                     jmp        0x7f4b87e5bcb4
01d3e 49badfbce5874b7f0000           movabs     r10, 0x7f4b87e5bcdf
01d48 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01d4f e90c0faaff                     jmp        0x7f4b878fdee0
01d54 e8c7daa8ff                     call       0x7f4b878eaaa0
01d59 e9c0e2ffff                     jmp        0x7f4b87e5b29e
01d5e f4                             hlt        
01d5f f4                             hlt        
