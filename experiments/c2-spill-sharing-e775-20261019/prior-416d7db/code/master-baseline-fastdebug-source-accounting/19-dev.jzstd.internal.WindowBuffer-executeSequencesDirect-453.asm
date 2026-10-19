00000 90                             nop        
00001 90                             nop        
00002 90                             nop        
00003 90                             nop        
00004 90                             nop        
00005 90                             nop        
00006 90                             nop        
00007 90                             nop        
00008 90                             nop        
00009 90                             nop        
0000a 90                             nop        
0000b 90                             nop        
0000c 90                             nop        
0000d 90                             nop        
0000e 90                             nop        
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f8540e4b3ff                   jne        0x7f6a9772ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ece0000000                 sub        rsp, 0xe0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f853b380000                   jne        0x7f6a97bf4179
0003e 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00043 894c240c                       mov        dword ptr [rsp + 0xc], ecx
00047 4d8bd8                         mov        r11, r8
0004a 448bcf                         mov        r9d, edi
0004d 4c8bf6                         mov        r14, rsi
00050 448b5638                       mov        r10d, dword ptr [rsi + 0x38]
00054 4489542464                     mov        dword ptr [rsp + 0x64], r10d
00059 448b5604                       mov        r10d, dword ptr [rsi + 4]
0005d 458bc2                         mov        r8d, r10d
00060 442b442464                     sub        r8d, dword ptr [rsp + 0x64]
00065 8b9c24f0000000                 mov        ebx, dword ptr [rsp + 0xf0]
0006c 413bd8                         cmp        ebx, r8d
0006f 0f8f972e0000                   jg         0x7f6a97bf380c
00075 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00079 4c89442428                     mov        qword ptr [rsp + 0x28], r8
0007e 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
00082 48638c24f0000000               movsxd     rcx, dword ptr [rsp + 0xf0]
0008a 48635c2464                     movsxd     rbx, dword ptr [rsp + 0x64]
0008f 48035c2428                     add        rbx, qword ptr [rsp + 0x28]
00094 4c2bc3                         sub        r8, rbx
00097 493bc8                         cmp        rcx, r8
0009a 0f8f6c2e0000                   jg         0x7f6a97bf380c
000a0 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
000a4 4c89442440                     mov        qword ptr [rsp + 0x40], r8
000a9 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000ad 4d85c0                         test       r8, r8
000b0 0f8435150000                   je         0x7f6a97bf1eeb
000b6 33ff                           xor        edi, edi
000b8 4c8bea                         mov        r13, rdx
000bb 8b7204                         mov        esi, dword ptr [rdx + 4]
000be 418b5e40                       mov        ebx, dword ptr [r14 + 0x40]
000c2 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
000c9 418be9                         mov        ebp, r9d
000cc 4585c9                         test       r9d, r9d
000cf 0f8e6b270000                   jle        0x7f6a97bf3140
000d5 4c2b442428                     sub        r8, qword ptr [rsp + 0x28]
000da 448d4ee0                       lea        r9d, [rsi - 0x20]
000de 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
000e6 418d4ae0                       lea        ecx, [r10 - 0x20]
000ea 458b5304                       mov        r10d, dword ptr [r11 + 4]
000ee 4585d2                         test       r10d, r10d
000f1 0f86412e0000                   jbe        0x7f6a97bf3838
000f7 4d63d2                         movsxd     r10, r10d
000fa 4863dd                         movsxd     rbx, ebp
000fd 48ffcb                         dec        rbx
00100 493bda                         cmp        rbx, r10
00103 0f832f2e0000                   jae        0x7f6a97bf3838
00109 488b9424f8000000               mov        rdx, qword ptr [rsp + 0xf8]
00111 8b5a04                         mov        ebx, dword ptr [rdx + 4]
00114 85db                           test       ebx, ebx
00116 0f86802e0000                   jbe        0x7f6a97bf389c
0011c 83fb01                         cmp        ebx, 1
0011f 0f86772e0000                   jbe        0x7f6a97bf389c
00125 83fb02                         cmp        ebx, 2
00128 0f866e2e0000                   jbe        0x7f6a97bf389c
0012e 448d56f1                       lea        r10d, [rsi - 0xf]
00132 4585d2                         test       r10d, r10d
00135 0f8c612e0000                   jl         0x7f6a97bf389c
0013b 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00143 418b4204                       mov        eax, dword ptr [r10 + 4]
00147 448d50f1                       lea        r10d, [rax - 0xf]
0014b 4585d2                         test       r10d, r10d
0014e 0f8c482e0000                   jl         0x7f6a97bf389c
00154 448d50fd                       lea        r10d, [rax - 3]
00158 4585d2                         test       r10d, r10d
0015b 0f8c3b2e0000                   jl         0x7f6a97bf389c
00161 448d50f9                       lea        r10d, [rax - 7]
00165 4585d2                         test       r10d, r10d
00168 0f8c2e2e0000                   jl         0x7f6a97bf389c
0016e 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00172 899c24fc000000                 mov        dword ptr [rsp + 0xfc], ebx
00179 894c2448                       mov        dword ptr [rsp + 0x48], ecx
0017d 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
00182 89b424f8000000                 mov        dword ptr [rsp + 0xf8], esi
00189 897c2430                       mov        dword ptr [rsp + 0x30], edi
0018d 4c89442438                     mov        qword ptr [rsp + 0x38], r8
00192 4889542450                     mov        qword ptr [rsp + 0x50], rdx
00197 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0019c 896c2418                       mov        dword ptr [rsp + 0x18], ebp
001a0 4c896c2468                     mov        qword ptr [rsp + 0x68], r13
001a5 4c89742478                     mov        qword ptr [rsp + 0x78], r14
001aa 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
001b2 4d8bd3                         mov        r10, r11
001b5 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001ba 448bd0                         mov        r10d, eax
001bd 448bde                         mov        r11d, esi
001c0 458d4afd                       lea        r9d, [r10 - 3]
001c4 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
001cc 4d63c3                         movsxd     r8, r11d
001cf 4183c3f1                       add        r11d, -0xf
001d3 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
001db 4983c0f1                       add        r8, -0xf
001df 4c89842490000000               mov        qword ptr [rsp + 0x90], r8
001e7 458d5af9                       lea        r11d, [r10 - 7]
001eb 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
001f3 4d63da                         movsxd     r11, r10d
001f6 4183c2f1                       add        r10d, -0xf
001fa 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00202 4d8d53f1                       lea        r10, [r11 - 0xf]
00206 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0020e 4983c3f9                       add        r11, -7
00212 4c899c24a8000000               mov        qword ptr [rsp + 0xa8], r11
0021a 4533c9                         xor        r9d, r9d
0021d 4533c0                         xor        r8d, r8d
00220 e926050000                     jmp        0x7f6a97bf104b
00225 448bdd                         mov        r11d, ebp
00228 4d63d3                         movsxd     r10, r11d
0022b 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00232 c442a8f5db                     bzhi       r11, r11, r10
00237 c4c1fb92fb                     kmovq      k7, r11
0023c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00242 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00248 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00250 4403d5                         add        r10d, ebp
00253 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
0025b 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0025f 418502                         test       dword ptr [r10], eax
00262 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
0026a 443b5c245c                     cmp        r11d, dword ptr [rsp + 0x5c]
0026f 0f8dad080000                   jge        0x7f6a97bf1422
00275 4489b424b4000000               mov        dword ptr [rsp + 0xb4], r14d
0027d 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00285 442b9424b0000000               sub        r10d, dword ptr [rsp + 0xb0]
0028d 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
00295 8b6c245c                       mov        ebp, dword ptr [rsp + 0x5c]
00299 2bac24b0000000                 sub        ebp, dword ptr [rsp + 0xb0]
002a0 3bac24b0000000                 cmp        ebp, dword ptr [rsp + 0xb0]
002a7 448bb424b0000000               mov        r14d, dword ptr [rsp + 0xb0]
002af 410f4fee                       cmovg      ebp, r14d
002b3 4585d2                         test       r10d, r10d
002b6 0f8c54200000                   jl         0x7f6a97bf2c10
002bc 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
002c4 4585db                         test       r11d, r11d
002c7 0f8c43200000                   jl         0x7f6a97bf2c10
002cd 448bd5                         mov        r10d, ebp
002d0 44039424b8000000               add        r10d, dword ptr [rsp + 0xb8]
002d8 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
002dd 453bc2                         cmp        r8d, r10d
002e0 0f822a200000                   jb         0x7f6a97bf2c10
002e6 448bb424b4000000               mov        r14d, dword ptr [rsp + 0xb4]
002ee 4403f5                         add        r14d, ebp
002f1 453bc6                         cmp        r8d, r14d
002f4 0f8216200000                   jb         0x7f6a97bf2c10
002fa 85ed                           test       ebp, ebp
002fc 0f8c0e200000                   jl         0x7f6a97bf2c10
00302 85ed                           test       ebp, ebp
00304 0f843effffff                   je         0x7f6a97bf0b48
0030a 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00312 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
0031a 4b8d741308                     lea        rsi, [r11 + r10 + 8]
0031f 448b8424b8000000               mov        r8d, dword ptr [rsp + 0xb8]
00327 4b8d7c0308                     lea        rdi, [r11 + r8 + 8]
0032c 4863d5                         movsxd     rdx, ebp
0032f 4883fa20                       cmp        rdx, 0x20
00333 0f86ecfeffff                   jbe        0x7f6a97bf0b25
00339 c5f877                         vzeroupper 
0033c 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00346 41ffd2                         call       r10
00349 0f1f840000000000               nop        dword ptr [rax + rax]
00351 e9f2feffff                     jmp        0x7f6a97bf0b48
00356 458beb                         mov        r13d, r11d
00359 448b8424b0000000               mov        r8d, dword ptr [rsp + 0xb0]
00361 4585c0                         test       r8d, r8d
00364 0f8ef2150000                   jle        0x7f6a97bf225c
0036a 458d1401                       lea        r10d, [r9 + rax]
0036e 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00373 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00378 4403d3                         add        r10d, ebx
0037b 443b542448                     cmp        r10d, dword ptr [rsp + 0x48]
00380 0f8f84120000                   jg         0x7f6a97bf1f0a
00386 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0038b 443b5c2458                     cmp        r11d, dword ptr [rsp + 0x58]
00390 0f8f32170000                   jg         0x7f6a97bf23c8
00396 83f810                         cmp        eax, 0x10
00399 0f8f43080000                   jg         0x7f6a97bf14e2
0039f 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
003a7 0f83e8120000                   jae        0x7f6a97bf1f95
003ad 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
003b2 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
003b9 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
003be 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
003c6 0f8374130000                   jae        0x7f6a97bf2040
003cc 468d1408                       lea        r10d, [rax + r9]
003d0 4489542460                     mov        dword ptr [rsp + 0x60], r10d
003d5 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
003da 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
003e2 c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
003e9 468d1400                       lea        r10d, [rax + r8]
003ed 4489542464                     mov        dword ptr [rsp + 0x64], r10d
003f2 458bf2                         mov        r14d, r10d
003f5 442bb424b0000000               sub        r14d, dword ptr [rsp + 0xb0]
003fd 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
00401 83fb10                         cmp        ebx, 0x10
00404 7f53                           jg         0x7f6a97bf0d59
00406 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
0040d 83fb10                         cmp        ebx, 0x10
00410 7c47                           jl         0x7f6a97bf0d59
00412 443bb4249c000000               cmp        r14d, dword ptr [rsp + 0x9c]
0041a 0f83ec130000                   jae        0x7f6a97bf210c
00420 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00428 c4817a6f443308                 vmovdqu    xmm0, xmmword ptr [r11 + r14 + 8]
0042f 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00433 3b9c249c000000                 cmp        ebx, dword ptr [rsp + 0x9c]
0043a 0f836c140000                   jae        0x7f6a97bf21ac
00440 c4c17a7f441b08                 vmovdqu    xmmword ptr [r11 + rbx + 8], xmm0
00447 448b6c245c                     mov        r13d, dword ptr [rsp + 0x5c]
0044c 4403eb                         add        r13d, ebx
0044f 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
00454 e9d7020000                     jmp        0x7f6a97bf1030
00459 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00461 4b8d7c3208                     lea        rdi, [r10 + r14 + 8]
00466 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
0046a 498d741a08                     lea        rsi, [r10 + rbx + 8]
0046f 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
00473 035c2464                       add        ebx, dword ptr [rsp + 0x64]
00477 4c63cb                         movsxd     r9, ebx
0047a 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00482 443b5c245c                     cmp        r11d, dword ptr [rsp + 0x5c]
00487 0f8cc0040000                   jl         0x7f6a97bf124d
0048d 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00492 4183fa30                       cmp        r10d, 0x30
00496 0f8e8c000000                   jle        0x7f6a97bf0e28
0049c 4585f6                         test       r14d, r14d
0049f 0f8c771b0000                   jl         0x7f6a97bf291c
004a5 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
004aa 4585db                         test       r11d, r11d
004ad 0f8c691b0000                   jl         0x7f6a97bf291c
004b3 478d0432                       lea        r8d, [r10 + r14]
004b7 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
004bc 453bd0                         cmp        r10d, r8d
004bf 0f82571b0000                   jb         0x7f6a97bf291c
004c5 443bd3                         cmp        r10d, ebx
004c8 0f824e1b0000                   jb         0x7f6a97bf291c
004ce 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
004d2 85db                           test       ebx, ebx
004d4 0f844a020000                   je         0x7f6a97bf1024
004da 4863d3                         movsxd     rdx, ebx
004dd 4883fa20                       cmp        rdx, 0x20
004e1 7728                           ja         0x7f6a97bf0e0b
004e3 448bdb                         mov        r11d, ebx
004e6 4d63d3                         movsxd     r10, r11d
004e9 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
004f0 c442a8f5db                     bzhi       r11, r11, r10
004f5 c4c1fb92fb                     kmovq      k7, r11
004fa 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00500 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00506 e919020000                     jmp        0x7f6a97bf1024
0050b c5f877                         vzeroupper 
0050e 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00518 41ffd2                         call       r10
0051b 0f1f840000000000               nop        dword ptr [rax + rax]
00523 e9fc010000                     jmp        0x7f6a97bf1024
00528 443bb42498000000               cmp        r14d, dword ptr [rsp + 0x98]
00530 0f832a160000                   jae        0x7f6a97bf2460
00536 4963fe                         movsxd     rdi, r14d
00539 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00541 4d8b443b08                     mov        r8, qword ptr [r11 + rdi + 8]
00546 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0054b 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00553 0f83d7160000                   jae        0x7f6a97bf2530
00559 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0055e 418d4a08                       lea        ecx, [r10 + 8]
00562 4963d2                         movsxd     rdx, r10d
00565 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0056d 4d89441308                     mov        qword ptr [r11 + rdx + 8], r8
00572 3bcb                           cmp        ecx, ebx
00574 0f8daa010000                   jge        0x7f6a97bf1024
0057a 482bfa                         sub        rdi, rdx
0057d 4c63c1                         movsxd     r8, ecx
00580 4d8d1c38                       lea        r11, [r8 + rdi]
00584 4c3b9c24a8000000               cmp        r11, qword ptr [rsp + 0xa8]
0058c 0f83a2180000                   jae        0x7f6a97bf2734
00592 4d8bd9                         mov        r11, r9
00595 4d2bd8                         sub        r11, r8
00598 4983c307                       add        r11, 7
0059c 4983e3f8                       and        r11, 0xfffffffffffffff8
005a0 458bdb                         mov        r11d, r11d
005a3 478d441308                     lea        r8d, [r11 + r10 + 8]
005a8 4d63d8                         movsxd     r11, r8d
005ab 4d8d443bf8                     lea        r8, [r11 + rdi - 8]
005b0 4c3b8424a8000000               cmp        r8, qword ptr [rsp + 0xa8]
005b8 0f8376180000                   jae        0x7f6a97bf2734
005be 3b8c2498000000                 cmp        ecx, dword ptr [rsp + 0x98]
005c5 0f8369180000                   jae        0x7f6a97bf2734
005cb 4983c3f8                       add        r11, -8
005cf 4c3b9c24a8000000               cmp        r11, qword ptr [rsp + 0xa8]
005d7 0f8357180000                   jae        0x7f6a97bf2734
005dd 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
005e3 0f8f03190000                   jg         0x7f6a97bf27ec
005e9 452bf2                         sub        r14d, r10d
005ec 4183c210                       add        r10d, 0x10
005f0 458d1c0e                       lea        r11d, [r14 + rcx]
005f4 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
005fc 4f8b5c1808                     mov        r11, qword ptr [r8 + r11 + 8]
00601 448bc1                         mov        r8d, ecx
00604 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
0060b 4e895c0208                     mov        qword ptr [rdx + r8 + 8], r11
00610 8d5108                         lea        edx, [rcx + 8]
00613 413bd2                         cmp        edx, r10d
00616 7d04                           jge        0x7f6a97bf0f1c
00618 8bca                           mov        ecx, edx
0061a ebd4                           jmp        0x7f6a97bf0ef0
0061c 4983c1f8                       add        r9, -8
00620 4981f900000080                 cmp        r9, -0x80000000
00627 49c7c200000080                 mov        r10, 0xffffffff80000000
0062e 4d0f4cca                       cmovl      r9, r10
00632 458bc9                         mov        r9d, r9d
00635 413bd1                         cmp        edx, r9d
00638 0f8d99000000                   jge        0x7f6a97bf0fd7
0063e 4c63d2                         movsxd     r10, edx
00641 4c03d7                         add        r10, rdi
00644 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
0064c 0f8352190000                   jae        0x7f6a97bf28a4
00652 83c110                         add        ecx, 0x10
00655 4c63d1                         movsxd     r10, ecx
00658 4c03d7                         add        r10, rdi
0065b 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00663 0f834f190000                   jae        0x7f6a97bf28b8
00669 3b942498000000                 cmp        edx, dword ptr [rsp + 0x98]
00670 0f8356190000                   jae        0x7f6a97bf28cc
00676 3b8c2498000000                 cmp        ecx, dword ptr [rsp + 0x98]
0067d 0f835d190000                   jae        0x7f6a97bf28e0
00683 90                             nop        
00684 90                             nop        
00685 90                             nop        
00686 90                             nop        
00687 90                             nop        
00688 90                             nop        
00689 90                             nop        
0068a 90                             nop        
0068b 90                             nop        
0068c 90                             nop        
0068d 90                             nop        
0068e 90                             nop        
0068f 90                             nop        
00690 418d0c16                       lea        ecx, [r14 + rdx]
00694 448bda                         mov        r11d, edx
00697 4963f3                         movsxd     rsi, r11d
0069a 448bd1                         mov        r10d, ecx
0069d 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
006a5 4f8b441008                     mov        r8, qword ptr [r8 + r10 + 8]
006aa 4863c9                         movsxd     rcx, ecx
006ad 448bd2                         mov        r10d, edx
006b0 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
006b8 4f89441308                     mov        qword ptr [r11 + r10 + 8], r8
006bd 4d8b5c0b10                     mov        r11, qword ptr [r11 + rcx + 0x10]
006c2 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
006ca 4d895c3210                     mov        qword ptr [r10 + rsi + 0x10], r11
006cf 83c210                         add        edx, 0x10
006d2 413bd1                         cmp        edx, r9d
006d5 7cb9                           jl         0x7f6a97bf0f90
006d7 3bd3                           cmp        edx, ebx
006d9 7d49                           jge        0x7f6a97bf1024
006db 4c63d2                         movsxd     r10, edx
006de 4c03d7                         add        r10, rdi
006e1 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
006e9 0f8305190000                   jae        0x7f6a97bf28f4
006ef 3b942498000000                 cmp        edx, dword ptr [rsp + 0x98]
006f6 0f830c190000                   jae        0x7f6a97bf2908
006fc 458d1416                       lea        r10d, [r14 + rdx]
00700 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00708 4f8b441308                     mov        r8, qword ptr [r11 + r10 + 8]
0070d 448bda                         mov        r11d, edx
00710 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00718 4f89441a08                     mov        qword ptr [r10 + r11 + 8], r8
0071d 83c208                         add        edx, 8
00720 3bd3                           cmp        edx, ebx
00722 7cd8                           jl         0x7f6a97bf0ffc
00724 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00728 035c245c                       add        ebx, dword ptr [rsp + 0x5c]
0072c 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00730 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
00738 41ffc0                         inc        r8d
0073b 443b442418                     cmp        r8d, dword ptr [rsp + 0x18]
00740 0f8dec050000                   jge        0x7f6a97bf1632
00746 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0074b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00750 4f8b5cc208                     mov        r11, qword ptr [r10 + r8*8 + 8]
00755 4d8bd3                         mov        r10, r11
00758 49c1fa24                       sar        r10, 0x24
0075c 458bd2                         mov        r10d, r10d
0075f 418bfa                         mov        edi, r10d
00762 458bd3                         mov        r10d, r11d
00765 49c1eb12                       shr        r11, 0x12
00769 4181e2ffff0100                 and        r10d, 0x1ffff
00770 418bc2                         mov        eax, r10d
00773 418bdb                         mov        ebx, r11d
00776 81e3ffff0300                   and        ebx, 0x3ffff
0077c 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
00780 448bd7                         mov        r10d, edi
00783 4585d2                         test       r10d, r10d
00786 0f8c04120000                   jl         0x7f6a97bf2290
0078c 448bd0                         mov        r10d, eax
0078f 4585d2                         test       r10d, r10d
00792 0f85ba000000                   jne        0x7f6a97bf1152
00798 4533d2                         xor        r10d, r10d
0079b 418bc2                         mov        eax, r10d
0079e 448bd7                         mov        r10d, edi
007a1 4183fa03                       cmp        r10d, 3
007a5 0f8eed000000                   jle        0x7f6a97bf1198
007ab 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
007b0 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
007b4 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
007b9 45895310                       mov        dword ptr [r11 + 0x10], r10d
007bd 458b5b08                       mov        r11d, dword ptr [r11 + 8]
007c1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
007c6 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
007ca 448d57fd                       lea        r10d, [rdi - 3]
007ce 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
007d6 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
007db 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
007e2 41895a08                       mov        dword ptr [r10 + 8], ebx
007e6 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
007ee 48639c24b0000000               movsxd     rbx, dword ptr [rsp + 0xb0]
007f6 488beb                         mov        rbp, rbx
007f9 4c63542464                     movsxd     r10, dword ptr [rsp + 0x64]
007fe 4c03542428                     add        r10, qword ptr [rsp + 0x28]
00803 4863d0                         movsxd     rdx, eax
00806 4c03d2                         add        r10, rdx
00809 493bda                         cmp        rbx, r10
0080c 0f8f22120000                   jg         0x7f6a97bf2334
00812 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00816 03d8                           add        ebx, eax
00818 448bf3                         mov        r14d, ebx
0081b 442bb424b0000000               sub        r14d, dword ptr [rsp + 0xb0]
00823 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00828 4585db                         test       r11d, r11d
0082b 0f8525fbffff                   jne        0x7f6a97bf0c56
00831 4d63c6                         movsxd     r8, r14d
00834 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
00839 0f8cb9140000                   jl         0x7f6a97bf25f8
0083f 483b6c2440                     cmp        rbp, qword ptr [rsp + 0x40]
00844 0f8f4a150000                   jg         0x7f6a97bf2694
0084a 4533ed                         xor        r13d, r13d
0084d e907fbffff                     jmp        0x7f6a97bf0c59
00852 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00857 452bd9                         sub        r11d, r9d
0085a 453bd3                         cmp        r10d, r11d
0085d 0f8e3bffffff                   jle        0x7f6a97bf109e
00863 be45ffffff                     mov        esi, 0xffffff45
00868 418bea                         mov        ebp, r10d
0086b 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
00873 90                             nop        
00874 c5f877                         vzeroupper 
00877 e8e4c8adff                     call       0x7f6a976cda60
0087c 0f1f840074090001               nop        dword ptr [rax + rax + 0x1000974]
00884 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
0088e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00892 e8c9d31218                     call       0x7f6aafd1e560
00897 f4                             hlt        
00898 85c0                           test       eax, eax
0089a 7407                           je         0x7f6a97bf11a3
0089c 448d57ff                       lea        r10d, [rdi - 1]
008a0 418bfa                         mov        edi, r10d
008a3 85ff                           test       edi, edi
008a5 7516                           jne        0x7f6a97bf11bd
008a7 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
008ac 418b5a08                       mov        ebx, dword ptr [r10 + 8]
008b0 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
008b8 e984000000                     jmp        0x7f6a97bf1241
008bd 83ff03                         cmp        edi, 3
008c0 0f8446200000                   je         0x7f6a97bf320c
008c6 83ff02                         cmp        edi, 2
008c9 0f87e5200000                   ja         0x7f6a97bf32b4
008cf 3bbc24fc000000                 cmp        edi, dword ptr [rsp + 0xfc]
008d6 0f836e190000                   jae        0x7f6a97bf2b4a
008dc 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
008e1 418b5cbb08                     mov        ebx, dword ptr [r11 + rdi*4 + 8]
008e6 85ff                           test       edi, edi
008e8 7e46                           jle        0x7f6a97bf1230
008ea 448d5fff                       lea        r11d, [rdi - 1]
008ee 443b9c24fc000000               cmp        r11d, dword ptr [rsp + 0xfc]
008f6 0f835c1f0000                   jae        0x7f6a97bf3158
008fc 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
00904 90                             nop        
00905 90                             nop        
00906 90                             nop        
00907 90                             nop        
00908 90                             nop        
00909 90                             nop        
0090a 90                             nop        
0090b 90                             nop        
0090c 90                             nop        
0090d 90                             nop        
0090e 90                             nop        
0090f 90                             nop        
00910 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00915 458b54bb04                     mov        r10d, dword ptr [r11 + rdi*4 + 4]
0091a 4d8bc3                         mov        r8, r11
0091d 458954b808                     mov        dword ptr [r8 + rdi*4 + 8], r10d
00922 448d57ff                       lea        r10d, [rdi - 1]
00926 418bfa                         mov        edi, r10d
00929 4585d2                         test       r10d, r10d
0092c 7fe2                           jg         0x7f6a97bf1210
0092e eb08                           jmp        0x7f6a97bf1238
00930 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
00938 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0093d 41895a08                       mov        dword ptr [r10 + 8], ebx
00941 899c24b0000000                 mov        dword ptr [rsp + 0xb0], ebx
00948 e9a1feffff                     jmp        0x7f6a97bf10ee
0094d 4183fb10                       cmp        r11d, 0x10
00951 0f8d7b090000                   jge        0x7f6a97bf1bd2
00957 4183fb08                       cmp        r11d, 8
0095b 0f8d8b040000                   jge        0x7f6a97bf16ec
00961 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00966 4183fb10                       cmp        r11d, 0x10
0096a 0f8fbb010000                   jg         0x7f6a97bf142b
00970 443b74241c                     cmp        r14d, dword ptr [rsp + 0x1c]
00975 0f83311a0000                   jae        0x7f6a97bf2cac
0097b 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00983 430fbe6c3308                   movsx      ebp, byte ptr [r11 + r14 + 8]
00989 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0098e 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
00993 0f83db1a0000                   jae        0x7f6a97bf2d74
00999 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
009a1 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
009a6 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
009ab 41ffc2                         inc        r10d
009ae 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
009b6 458d5e03                       lea        r11d, [r14 + 3]
009ba 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
009bf 0f83471b0000                   jae        0x7f6a97bf2e0c
009c5 4d63c6                         movsxd     r8, r14d
009c8 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
009d0 430fbe6c0209                   movsx      ebp, byte ptr [r10 + r8 + 9]
009d6 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
009db 4183c303                       add        r11d, 3
009df 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
009e4 0f83c61b0000                   jae        0x7f6a97bf2eb0
009ea 4c634c2464                     movsxd     r9, dword ptr [rsp + 0x64]
009ef 43886c0a09                     mov        byte ptr [r10 + r9 + 9], bpl
009f4 470fbe54020a                   movsx      r10d, byte ptr [r10 + r8 + 0xa]
009fa 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00a02 4788540b0a                     mov        byte ptr [r11 + r9 + 0xa], r10b
00a07 470fbe54030b                   movsx      r10d, byte ptr [r11 + r8 + 0xb]
00a0d 4788540b0b                     mov        byte ptr [r11 + r9 + 0xb], r10b
00a12 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00a1a 4183fb08                       cmp        r11d, 8
00a1e 0f83241c0000                   jae        0x7f6a97bf2f48
00a24 49bb20ae28e300000000           movabs     r11, 0xe328ae20
00a2e 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00a36 4703749308                     add        r14d, dword ptr [r11 + r10*4 + 8]
00a3b 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00a40 4183fb04                       cmp        r11d, 4
00a44 7e5a                           jle        0x7f6a97bf13a0
00a46 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00a4b 4183c204                       add        r10d, 4
00a4f 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00a57 443bb42488000000               cmp        r14d, dword ptr [rsp + 0x88]
00a5f 0f838b1c0000                   jae        0x7f6a97bf2ff0
00a65 458bde                         mov        r11d, r14d
00a68 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
00a70 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00a78 438b6c1a08                     mov        ebp, dword ptr [r10 + r11 + 8]
00a7d 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00a85 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
00a8d 0f83191d0000                   jae        0x7f6a97bf30ac
00a93 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00a98 4d63db                         movsxd     r11, r11d
00a9b 43896c1a0c                     mov        dword ptr [r10 + r11 + 0xc], ebp
00aa0 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00aa5 4183fa08                       cmp        r10d, 8
00aa9 7e77                           jle        0x7f6a97bf1422
00aab 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00ab0 4183c308                       add        r11d, 8
00ab4 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
00abc 49bb48ae28e300000000           movabs     r11, 0xe328ae48
00ac6 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00ace 478b549308                     mov        r10d, dword ptr [r11 + r10*4 + 8]
00ad3 452bf2                         sub        r14d, r10d
00ad6 418d6e08                       lea        ebp, [r14 + 8]
00ada 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
00ae1 0f83751f0000                   jae        0x7f6a97bf335c
00ae7 4d63d6                         movsxd     r10, r14d
00aea 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00af2 4b8b6c1310                     mov        rbp, qword ptr [r11 + r10 + 0x10]
00af7 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00aff 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00b07 0f83e31f0000                   jae        0x7f6a97bf33f0
00b0d 448b6c2464                     mov        r13d, dword ptr [rsp + 0x64]
00b12 4d63d5                         movsxd     r10, r13d
00b15 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00b1d 4b896c1310                     mov        qword ptr [r11 + r10 + 0x10], rbp
00b22 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00b26 e905fcffff                     jmp        0x7f6a97bf1030
00b2b 4585f6                         test       r14d, r14d
00b2e 0f8c44200000                   jl         0x7f6a97bf3478
00b34 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b39 4585d2                         test       r10d, r10d
00b3c 0f8c36200000                   jl         0x7f6a97bf3478
00b42 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
00b47 443b542464                     cmp        r10d, dword ptr [rsp + 0x64]
00b4c 0f8226200000                   jb         0x7f6a97bf3478
00b52 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00b5a 44035c2464                     add        r11d, dword ptr [rsp + 0x64]
00b5f 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
00b67 443b9424b4000000               cmp        r10d, dword ptr [rsp + 0xb4]
00b6f 0f8203200000                   jb         0x7f6a97bf3478
00b75 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00b7d 4585d2                         test       r10d, r10d
00b80 0f8cf21f0000                   jl         0x7f6a97bf3478
00b86 4585d2                         test       r10d, r10d
00b89 0f84eef6ffff                   je         0x7f6a97bf0b7d
00b8f 4883fd20                       cmp        rbp, 0x20
00b93 772d                           ja         0x7f6a97bf14c2
00b95 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00b9d 4d63d3                         movsxd     r10, r11d
00ba0 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ba7 c442a8f5db                     bzhi       r11, r11, r10
00bac c4c1fb92fb                     kmovq      k7, r11
00bb1 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00bb7 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00bbd e9bbf6ffff                     jmp        0x7f6a97bf0b7d
00bc2 488bd5                         mov        rdx, rbp
00bc5 c5f877                         vzeroupper 
00bc8 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00bd2 41ffd2                         call       r10
00bd5 0f1f840000000000               nop        dword ptr [rax + rax]
00bdd e99bf6ffff                     jmp        0x7f6a97bf0b7d
00be2 83f830                         cmp        eax, 0x30
00be5 0f8f64060000                   jg         0x7f6a97bf1b4f
00beb 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
00bf3 0f8347200000                   jae        0x7f6a97bf3540
00bf9 4d63c1                         movsxd     r8, r9d
00bfc 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00c01 c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
00c08 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00c0d 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
00c15 0f83e9200000                   jae        0x7f6a97bf3604
00c1b 418bfa                         mov        edi, r10d
00c1e 458d5a10                       lea        r11d, [r10 + 0x10]
00c22 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00c27 4963ca                         movsxd     rcx, r10d
00c2a 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00c32 c4c17a7f440a08                 vmovdqu    xmmword ptr [r10 + rcx + 8], xmm0
00c39 443bdb                         cmp        r11d, ebx
00c3c 0f8db9000000                   jge        0x7f6a97bf15fb
00c42 4c2bc1                         sub        r8, rcx
00c45 4d63db                         movsxd     r11, r11d
00c48 4f8d1403                       lea        r10, [r11 + r8]
00c4c 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
00c54 0f8382210000                   jae        0x7f6a97bf36dc
00c5a 4c63d3                         movsxd     r10, ebx
00c5d 4d2bd3                         sub        r10, r11
00c60 4983c20f                       add        r10, 0xf
00c64 4983e2f0                       and        r10, 0xfffffffffffffff0
00c68 458bda                         mov        r11d, r10d
00c6b 448bd7                         mov        r10d, edi
00c6e 478d541310                     lea        r10d, [r11 + r10 + 0x10]
00c73 4d63d2                         movsxd     r10, r10d
00c76 4f8d5c02f0                     lea        r11, [r10 + r8 - 0x10]
00c7b 4c3b9c2490000000               cmp        r11, qword ptr [rsp + 0x90]
00c83 0f8353210000                   jae        0x7f6a97bf36dc
00c89 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00c8e 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
00c96 0f8340210000                   jae        0x7f6a97bf36dc
00c9c 4983c2f0                       add        r10, -0x10
00ca0 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
00ca8 0f832e210000                   jae        0x7f6a97bf36dc
00cae 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00cb4 0f8fba210000                   jg         0x7f6a97bf3774
00cba 458bd1                         mov        r10d, r9d
00cbd 442bd7                         sub        r10d, edi
00cc0 458bda                         mov        r11d, r10d
00cc3 44035c2460                     add        r11d, dword ptr [rsp + 0x60]
00cc8 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
00ccd c4817a6f441808                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 8]
00cd4 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00cd9 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00ce1 c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
00ce8 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00ced 4183c010                       add        r8d, 0x10
00cf1 4489442460                     mov        dword ptr [rsp + 0x60], r8d
00cf6 443bc3                         cmp        r8d, ebx
00cf9 7cc5                           jl         0x7f6a97bf15c0
00cfb 468d1408                       lea        r10d, [rax + r9]
00cff 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00d04 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00d08 e9f0f6ffff                     jmp        0x7f6a97bf0cfd
00d0d 4d63d2                         movsxd     r10, r10d
00d10 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d17 c442a8f5db                     bzhi       r11, r11, r10
00d1c c4c1fb92fb                     kmovq      k7, r11
00d21 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d27 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d2d e9a0000000                     jmp        0x7f6a97bf16d2
00d32 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00d37 442b542460                     sub        r10d, dword ptr [rsp + 0x60]
00d3c 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00d44 4585db                         test       r11d, r11d
00d47 0f84c3220000                   je         0x7f6a97bf3910
00d4d 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00d52 4585c0                         test       r8d, r8d
00d55 0f8c5d230000                   jl         0x7f6a97bf39b8
00d5b 4c8b742478                     mov        r14, qword ptr [rsp + 0x78]
00d60 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
00d65 8bb424f8000000                 mov        esi, dword ptr [rsp + 0xf8]
00d6c 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00d70 85db                           test       ebx, ebx
00d72 0f8ce0220000                   jl         0x7f6a97bf3958
00d78 3b74240c                       cmp        esi, dword ptr [rsp + 0xc]
00d7c 0f82dc220000                   jb         0x7f6a97bf395e
00d82 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
00d86 4103ea                         add        ebp, r10d
00d89 418b4b04                       mov        ecx, dword ptr [r11 + 4]
00d8d 3bcd                           cmp        ecx, ebp
00d8f 0f82cf220000                   jb         0x7f6a97bf3964
00d95 4585d2                         test       r10d, r10d
00d98 0f8ccc220000                   jl         0x7f6a97bf396a
00d9e 4585d2                         test       r10d, r10d
00da1 742f                           je         0x7f6a97bf16d2
00da3 498d741b08                     lea        rsi, [r11 + rbx + 8]
00da8 4b8d7c0508                     lea        rdi, [r13 + r8 + 8]
00dad 4963d2                         movsxd     rdx, r10d
00db0 4883fa20                       cmp        rdx, 0x20
00db4 0f8653ffffff                   jbe        0x7f6a97bf160d
00dba c5f877                         vzeroupper 
00dbd 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00dc7 41ffd2                         call       r10
00dca 0f1f840000000000               nop        dword ptr [rax + rax]
00dd2 41896e38                       mov        dword ptr [r14 + 0x38], ebp
00dd6 c5f877                         vzeroupper 
00dd9 4881c4e0000000                 add        rsp, 0xe0
00de0 5d                             pop        rbp
00de1 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00de5 0f87782a0000                   ja         0x7f6a97bf4163
00deb c3                             ret        
00dec 443bb42498000000               cmp        r14d, dword ptr [rsp + 0x98]
00df4 0f83ce220000                   jae        0x7f6a97bf39c8
00dfa 418bee                         mov        ebp, r14d
00dfd 896c245c                       mov        dword ptr [rsp + 0x5c], ebp
00e01 4863cd                         movsxd     rcx, ebp
00e04 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00e0c 498b6c0b08                     mov        rbp, qword ptr [r11 + rcx + 8]
00e11 4889ac24b0000000               mov        qword ptr [rsp + 0xb0], rbp
00e19 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00e1e 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00e26 0f8354230000                   jae        0x7f6a97bf3a80
00e2c 418d6a08                       lea        ebp, [r10 + 8]
00e30 896c244c                       mov        dword ptr [rsp + 0x4c], ebp
00e34 4d63da                         movsxd     r11, r10d
00e37 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00e3f 488bac24b0000000               mov        rbp, qword ptr [rsp + 0xb0]
00e47 4b896c1808                     mov        qword ptr [r8 + r11 + 8], rbp
00e4c 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
00e50 3beb                           cmp        ebp, ebx
00e52 0f8dc9030000                   jge        0x7f6a97bf1b21
00e58 492bcb                         sub        rcx, r11
00e5b 4c63dd                         movsxd     r11, ebp
00e5e 4d8d040b                       lea        r8, [r11 + rcx]
00e62 4c3b8424a8000000               cmp        r8, qword ptr [rsp + 0xa8]
00e6a 0f83b0230000                   jae        0x7f6a97bf3b20
00e70 4d8bc1                         mov        r8, r9
00e73 4d2bc3                         sub        r8, r11
00e76 4983c007                       add        r8, 7
00e7a 4983e0f8                       and        r8, 0xfffffffffffffff8
00e7e 418bf8                         mov        edi, r8d
00e81 468d441708                     lea        r8d, [rdi + r10 + 8]
00e86 4d63c0                         movsxd     r8, r8d
00e89 498d7c08f8                     lea        rdi, [r8 + rcx - 8]
00e8e 483bbc24a8000000               cmp        rdi, qword ptr [rsp + 0xa8]
00e96 0f8384230000                   jae        0x7f6a97bf3b20
00e9c 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
00ea3 0f8377230000                   jae        0x7f6a97bf3b20
00ea9 4983c0f8                       add        r8, -8
00ead 4c3b8424a8000000               cmp        r8, qword ptr [rsp + 0xa8]
00eb5 0f8365230000                   jae        0x7f6a97bf3b20
00ebb 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
00ec1 0f8ff9230000                   jg         0x7f6a97bf3bc0
00ec7 8b6c245c                       mov        ebp, dword ptr [rsp + 0x5c]
00ecb 412bea                         sub        ebp, r10d
00ece 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00ed5 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00edd 418bd0                         mov        edx, r8d
00ee0 41b8f8ffffff                   mov        r8d, 0xfffffff8
00ee6 442bc2                         sub        r8d, edx
00ee9 452bc2                         sub        r8d, r10d
00eec 4183c210                       add        r10d, 0x10
00ef0 4183c0f0                       add        r8d, -0x10
00ef4 488b7c2420                     mov        rdi, qword ptr [rsp + 0x20]
00ef9 498d51c8                       lea        rdx, [r9 - 0x38]
00efd 4881fa00000080                 cmp        rdx, -0x80000000
00f04 48c7c600000080                 mov        rsi, 0xffffffff80000000
00f0b 480f4cd6                       cmovl      rdx, rsi
00f0f 8bd2                           mov        edx, edx
00f11 442b742464                     sub        r14d, dword ptr [rsp + 0x64]
00f16 4963c2                         movsxd     rax, r10d
00f19 be06000000                     mov        esi, 6
00f1e c442c8f5c0                     bzhi       r8, r8, rsi
00f23 4903c0                         add        rax, r8
00f26 493bc1                         cmp        rax, r9
00f29 498bf1                         mov        rsi, r9
00f2c 480f4cf0                       cmovl      rsi, rax
00f30 4c8bc6                         mov        r8, rsi
00f33 4d2bc3                         sub        r8, r11
00f36 498d40ff                       lea        rax, [r8 - 1]
00f3a 48c1f83f                       sar        rax, 0x3f
00f3e 48c1e83d                       shr        rax, 0x3d
00f42 4e8d4400ff                     lea        r8, [rax + r8 - 1]
00f47 4983e0f8                       and        r8, 0xfffffffffffffff8
00f4b 4d03c3                         add        r8, r11
00f4e 4d3bd8                         cmp        r11, r8
00f51 4d0f4cd8                       cmovl      r11, r8
00f55 458bc3                         mov        r8d, r11d
00f58 478d5c0608                     lea        r11d, [r14 + r8 + 8]
00f5d 4183c008                       add        r8d, 8
00f61 4963c3                         movsxd     rax, r11d
00f64 4803c7                         add        rax, rdi
00f67 4963e8                         movsxd     rbp, r8d
00f6a 4803ef                         add        rbp, rdi
00f6d 4c8d5808                       lea        r11, [rax + 8]
00f71 4883c048                       add        rax, 0x48
00f75 488d7d48                       lea        rdi, [rbp + 0x48]
00f79 4533c0                         xor        r8d, r8d
00f7c 493bfb                         cmp        rdi, r11
00f7f 410f96c0                       setbe      r8b
00f83 4883c508                       add        rbp, 8
00f87 4533db                         xor        r11d, r11d
00f8a 483bc5                         cmp        rax, rbp
00f8d 410f96c3                       setbe      r11b
00f91 450bc3                         or         r8d, r11d
00f94 0f842f110000                   je         0x7f6a97bf29c9
00f9a 448bc6                         mov        r8d, esi
00f9d eb05                           jmp        0x7f6a97bf18a4
00f9f 90                             nop        
00fa0 8974244c                       mov        dword ptr [rsp + 0x4c], esi
00fa4 448b9424f0000000               mov        r10d, dword ptr [rsp + 0xf0]
00fac 440354244c                     add        r10d, dword ptr [rsp + 0x4c]
00fb1 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00fb9 4f8b5c1308                     mov        r11, qword ptr [r11 + r10 + 8]
00fbe 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00fc3 8bbc2484000000                 mov        edi, dword ptr [rsp + 0x84]
00fca 4e895c1708                     mov        qword ptr [rdi + r10 + 8], r11
00fcf 8b74244c                       mov        esi, dword ptr [rsp + 0x4c]
00fd3 83c608                         add        esi, 8
00fd6 413bf0                         cmp        esi, r8d
00fd9 7cc5                           jl         0x7f6a97bf18a0
00fdb 4981c108feffff                 add        r9, -0x1f8
00fe2 4981f900000080                 cmp        r9, -0x80000000
00fe9 49c7c200000080                 mov        r10, 0xffffffff80000000
00ff0 4d0f4cca                       cmovl      r9, r10
00ff4 418be9                         mov        ebp, r9d
00ff7 3bf5                           cmp        esi, ebp
00ff9 0f8d61230000                   jge        0x7f6a97bf3c60
00fff 4c63d6                         movsxd     r10, esi
01002 4c03d1                         add        r10, rcx
01005 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
0100d 0f8355230000                   jae        0x7f6a97bf3c68
01013 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01018 4181c200020000                 add        r10d, 0x200
0101f 4d63da                         movsxd     r11, r10d
01022 4c03d9                         add        r11, rcx
01025 4c3b9c24a8000000               cmp        r11, qword ptr [rsp + 0xa8]
0102d 0f8349230000                   jae        0x7f6a97bf3c7c
01033 3bb42498000000                 cmp        esi, dword ptr [rsp + 0x98]
0103a 0f8350230000                   jae        0x7f6a97bf3c90
01040 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
01048 0f8356230000                   jae        0x7f6a97bf3ca4
0104e eb03                           jmp        0x7f6a97bf1953
01050 418bf2                         mov        esi, r10d
01053 8bbc24f0000000                 mov        edi, dword ptr [rsp + 0xf0]
0105a 03fe                           add        edi, esi
0105c 448bd6                         mov        r10d, esi
0105f 4d63da                         movsxd     r11, r10d
01062 448bc7                         mov        r8d, edi
01065 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0106d 62917e486f840208000000         vmovdqu32  zmm0, zmmword ptr [r10 + r8 + 8]
01078 4c63f7                         movsxd     r14, edi
0107b 448d4e40                       lea        r9d, [rsi + 0x40]
0107f 44038c24f0000000               add        r9d, dword ptr [rsp + 0xf0]
01087 8dbe80000000                   lea        edi, [rsi + 0x80]
0108d 03bc24f0000000                 add        edi, dword ptr [rsp + 0xf0]
01094 8d8600010000                   lea        eax, [rsi + 0x100]
0109a 038424f0000000                 add        eax, dword ptr [rsp + 0xf0]
010a1 448bc6                         mov        r8d, esi
010a4 62917e487f840208000000         vmovdqu32  zmmword ptr [r10 + r8 + 8], zmm0
010af 62917e486f840a08000000         vmovdqu32  zmm0, zmmword ptr [r10 + r9 + 8]
010ba 62917e487f841a48000000         vmovdqu32  zmmword ptr [r10 + r11 + 0x48], zmm0
010c5 62d17e486f843a08000000         vmovdqu32  zmm0, zmmword ptr [r10 + rdi + 8]
010d0 62917e487f841a88000000         vmovdqu32  zmmword ptr [r10 + r11 + 0x88], zmm0
010db 62917e486f8432c8000000         vmovdqu32  zmm0, zmmword ptr [r10 + r14 + 0xc8]
010e6 62917e487f841ac8000000         vmovdqu32  zmmword ptr [r10 + r11 + 0xc8], zmm0
010f1 448bd0                         mov        r10d, eax
010f4 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
010fc 62917e486f841108000000         vmovdqu32  zmm0, zmmword ptr [r9 + r10 + 8]
01107 62917e487f841908010000         vmovdqu32  zmmword ptr [r9 + r11 + 0x108], zmm0
01112 62917e486f843148010000         vmovdqu32  zmm0, zmmword ptr [r9 + r14 + 0x148]
0111d 62917e487f841948010000         vmovdqu32  zmmword ptr [r9 + r11 + 0x148], zmm0
01128 62917e486f843188010000         vmovdqu32  zmm0, zmmword ptr [r9 + r14 + 0x188]
01133 62917e487f841988010000         vmovdqu32  zmmword ptr [r9 + r11 + 0x188], zmm0
0113e 4c63c0                         movsxd     r8, eax
01141 62917e486f8401c8000000         vmovdqu32  zmm0, zmmword ptr [r9 + r8 + 0xc8]
0114c 62917e487f8419c8010000         vmovdqu32  zmmword ptr [r9 + r11 + 0x1c8], zmm0
01157 448d9600020000                 lea        r10d, [rsi + 0x200]
0115e 443bd5                         cmp        r10d, ebp
01161 0f8ce9feffff                   jl         0x7f6a97bf1950
01167 443bd2                         cmp        r10d, edx
0116a 7d5d                           jge        0x7f6a97bf1ac9
0116c 81c638020000                   add        esi, 0x238
01172 4c63de                         movsxd     r11, esi
01175 4c03d9                         add        r11, rcx
01178 4c3b9c24a8000000               cmp        r11, qword ptr [rsp + 0xa8]
01180 0f839e250000                   jae        0x7f6a97bf4024
01186 3bb42498000000                 cmp        esi, dword ptr [rsp + 0x98]
0118d 0f83b9250000                   jae        0x7f6a97bf404c
01193 90                             nop        
01194 448b8424f0000000               mov        r8d, dword ptr [rsp + 0xf0]
0119c 4503c2                         add        r8d, r10d
0119f 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
011a7 62917e486f840108000000         vmovdqu32  zmm0, zmmword ptr [r9 + r8 + 8]
011b2 458bda                         mov        r11d, r10d
011b5 62917e487f841908000000         vmovdqu32  zmmword ptr [r9 + r11 + 8], zmm0
011c0 4183c240                       add        r10d, 0x40
011c4 443bd2                         cmp        r10d, edx
011c7 7ccb                           jl         0x7f6a97bf1a94
011c9 443bd3                         cmp        r10d, ebx
011cc 7d53                           jge        0x7f6a97bf1b21
011ce 4d63da                         movsxd     r11, r10d
011d1 4c03d9                         add        r11, rcx
011d4 4c3b9c24a8000000               cmp        r11, qword ptr [rsp + 0xa8]
011dc 0f8356250000                   jae        0x7f6a97bf4038
011e2 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
011ea 0f8370250000                   jae        0x7f6a97bf4060
011f0 448b8424f0000000               mov        r8d, dword ptr [rsp + 0xf0]
011f8 4503c2                         add        r8d, r10d
011fb 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01203 4f8b440308                     mov        r8, qword ptr [r11 + r8 + 8]
01208 458bda                         mov        r11d, r10d
0120b 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
01213 4f89441908                     mov        qword ptr [r9 + r11 + 8], r8
01218 4183c208                       add        r10d, 8
0121c 443bd3                         cmp        r10d, ebx
0121f 7ccf                           jl         0x7f6a97bf1af0
01221 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01225 e906f5ffff                     jmp        0x7f6a97bf1030
0122a 448bd0                         mov        r10d, eax
0122d 4d63d2                         movsxd     r10, r10d
01230 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01237 c442a8f5db                     bzhi       r11, r11, r10
0123c c4c1fb92fb                     kmovq      k7, r11
01241 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01247 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0124d eb7a                           jmp        0x7f6a97bf1bc9
0124f 4585c9                         test       r9d, r9d
01252 0f8c60210000                   jl         0x7f6a97bf3cb8
01258 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0125d 4585d2                         test       r10d, r10d
01260 0f8c52210000                   jl         0x7f6a97bf3cb8
01266 448b9c24f8000000               mov        r11d, dword ptr [rsp + 0xf8]
0126e 443b5c2460                     cmp        r11d, dword ptr [rsp + 0x60]
01273 0f823f210000                   jb         0x7f6a97bf3cb8
01279 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
0127e 443bd3                         cmp        r10d, ebx
01281 0f8231210000                   jb         0x7f6a97bf3cb8
01287 85c0                           test       eax, eax
01289 743e                           je         0x7f6a97bf1bc9
0128b 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01290 4b8d7c0a08                     lea        rdi, [r10 + r9 + 8]
01295 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0129d 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
012a2 4b8d740208                     lea        rsi, [r10 + r8 + 8]
012a7 4883fa20                       cmp        rdx, 0x20
012ab 0f8679ffffff                   jbe        0x7f6a97bf1b2a
012b1 c5f877                         vzeroupper 
012b4 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
012be 41ffd2                         call       r10
012c1 0f1f840000000000               nop        dword ptr [rax + rax]
012c9 895c2464                       mov        dword ptr [rsp + 0x64], ebx
012cd e92bf1ffff                     jmp        0x7f6a97bf0cfd
012d2 443bb4249c000000               cmp        r14d, dword ptr [rsp + 0x9c]
012da 0f8390210000                   jae        0x7f6a97bf3d70
012e0 4963ce                         movsxd     rcx, r14d
012e3 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
012eb c4c17a6f440b08                 vmovdqu    xmm0, xmmword ptr [r11 + rcx + 8]
012f2 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
012f7 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
012ff 0f8317220000                   jae        0x7f6a97bf3e1c
01305 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0130a 418bfb                         mov        edi, r11d
0130d 418d6b10                       lea        ebp, [r11 + 0x10]
01311 4d63db                         movsxd     r11, r11d
01314 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0131c c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
01323 3beb                           cmp        ebp, ebx
01325 0f8db7020000                   jge        0x7f6a97bf1ee2
0132b 492bcb                         sub        rcx, r11
0132e 4c63dd                         movsxd     r11, ebp
01331 4d8d140b                       lea        r10, [r11 + rcx]
01335 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
0133d 0f8391220000                   jae        0x7f6a97bf3ed4
01343 4d8bd1                         mov        r10, r9
01346 4d2bd3                         sub        r10, r11
01349 4983c20f                       add        r10, 0xf
0134d 4983e2f0                       and        r10, 0xfffffffffffffff0
01351 458bd2                         mov        r10d, r10d
01354 448bdf                         mov        r11d, edi
01357 478d5c1a10                     lea        r11d, [r10 + r11 + 0x10]
0135c 4d63d3                         movsxd     r10, r11d
0135f 4d8d5c0af0                     lea        r11, [r10 + rcx - 0x10]
01364 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
0136c 0f8362220000                   jae        0x7f6a97bf3ed4
01372 3bac249c000000                 cmp        ebp, dword ptr [rsp + 0x9c]
01379 0f8355220000                   jae        0x7f6a97bf3ed4
0137f 4983c2f0                       add        r10, -0x10
01383 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
0138b 0f8343220000                   jae        0x7f6a97bf3ed4
01391 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
01397 0f8fb7220000                   jg         0x7f6a97bf3f54
0139d 442bf7                         sub        r14d, edi
013a0 448d5f20                       lea        r11d, [rdi + 0x20]
013a4 eb05                           jmp        0x7f6a97bf1cab
013a6 90                             nop        
013a7 90                             nop        
013a8 418bea                         mov        ebp, r10d
013ab 458d042e                       lea        r8d, [r14 + rbp]
013af 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
013b7 c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
013be 448bd5                         mov        r10d, ebp
013c1 8bbc2484000000                 mov        edi, dword ptr [rsp + 0x84]
013c8 c4a17a7f441708                 vmovdqu    xmmword ptr [rdi + r10 + 8], xmm0
013cf 448d5510                       lea        r10d, [rbp + 0x10]
013d3 453bd3                         cmp        r10d, r11d
013d6 7cd0                           jl         0x7f6a97bf1ca8
013d8 4981c110ffffff                 add        r9, -0xf0
013df 4981f900000080                 cmp        r9, -0x80000000
013e6 49c7c300000080                 mov        r11, 0xffffffff80000000
013ed 4d0f4ccb                       cmovl      r9, r11
013f1 418bf9                         mov        edi, r9d
013f4 443bd7                         cmp        r10d, edi
013f7 0f8d95010000                   jge        0x7f6a97bf1e92
013fd 4d63da                         movsxd     r11, r10d
01400 4c03d9                         add        r11, rcx
01403 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
0140b 0f83c3220000                   jae        0x7f6a97bf3fd4
01411 81c500010000                   add        ebp, 0x100
01417 4c63dd                         movsxd     r11, ebp
0141a 4c03d9                         add        r11, rcx
0141d 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
01425 0f83bd220000                   jae        0x7f6a97bf3fe8
0142b 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
01433 0f83c3220000                   jae        0x7f6a97bf3ffc
01439 3bac249c000000                 cmp        ebp, dword ptr [rsp + 0x9c]
01440 0f83ca220000                   jae        0x7f6a97bf4010
01446 90                             nop        
01447 90                             nop        
01448 90                             nop        
01449 90                             nop        
0144a 90                             nop        
0144b 90                             nop        
0144c 90                             nop        
0144d 90                             nop        
0144e 90                             nop        
0144f 90                             nop        
01450 478d0416                       lea        r8d, [r14 + r10]
01454 458bda                         mov        r11d, r10d
01457 4d63cb                         movsxd     r9, r11d
0145a 458bd8                         mov        r11d, r8d
0145d 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
01464 c4a17a6f441a08                 vmovdqu    xmm0, xmmword ptr [rdx + r11 + 8]
0146b 4963d0                         movsxd     rdx, r8d
0146e 458bc2                         mov        r8d, r10d
01471 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01479 c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
01480 c4c17a6f441318                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x18]
01487 c4817a7f440b18                 vmovdqu    xmmword ptr [r11 + r9 + 0x18], xmm0
0148e c4c17a6f441328                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x28]
01495 c4817a7f440b28                 vmovdqu    xmmword ptr [r11 + r9 + 0x28], xmm0
0149c c4c17a6f441338                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x38]
014a3 c4817a7f440b38                 vmovdqu    xmmword ptr [r11 + r9 + 0x38], xmm0
014aa c4c17a6f441348                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x48]
014b1 c4817a7f440b48                 vmovdqu    xmmword ptr [r11 + r9 + 0x48], xmm0
014b8 c4c17a6f441358                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x58]
014bf c4817a7f440b58                 vmovdqu    xmmword ptr [r11 + r9 + 0x58], xmm0
014c6 c4c17a6f441368                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x68]
014cd c4817a7f440b68                 vmovdqu    xmmword ptr [r11 + r9 + 0x68], xmm0
014d4 c4c17a6f441378                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x78]
014db c4817a7f440b78                 vmovdqu    xmmword ptr [r11 + r9 + 0x78], xmm0
014e2 c4c17a6f841388000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x88]
014ec c4817a7f840b88000000           vmovdqu    xmmword ptr [r11 + r9 + 0x88], xmm0
014f6 c4c17a6f841398000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x98]
01500 c4817a7f840b98000000           vmovdqu    xmmword ptr [r11 + r9 + 0x98], xmm0
0150a c4c17a6f8413a8000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xa8]
01514 c4817a7f840ba8000000           vmovdqu    xmmword ptr [r11 + r9 + 0xa8], xmm0
0151e c4c17a6f8413b8000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xb8]
01528 c4817a7f840bb8000000           vmovdqu    xmmword ptr [r11 + r9 + 0xb8], xmm0
01532 c4c17a6f8413c8000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xc8]
0153c c4817a7f840bc8000000           vmovdqu    xmmword ptr [r11 + r9 + 0xc8], xmm0
01546 c4c17a6f8413d8000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xd8]
01550 c4817a7f840bd8000000           vmovdqu    xmmword ptr [r11 + r9 + 0xd8], xmm0
0155a c4c17a6f8413e8000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xe8]
01564 c4817a7f840be8000000           vmovdqu    xmmword ptr [r11 + r9 + 0xe8], xmm0
0156e c4c17a6f8413f8000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xf8]
01578 c4817a7f840bf8000000           vmovdqu    xmmword ptr [r11 + r9 + 0xf8], xmm0
01582 4181c200010000                 add        r10d, 0x100
01589 443bd7                         cmp        r10d, edi
0158c 0f8cbefeffff                   jl         0x7f6a97bf1d50
01592 443bd3                         cmp        r10d, ebx
01595 7d4b                           jge        0x7f6a97bf1ee2
01597 4d63da                         movsxd     r11, r10d
0159a 4c03d9                         add        r11, rcx
0159d 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
015a5 0f83c9210000                   jae        0x7f6a97bf4074
015ab 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
015b3 0f83cf210000                   jae        0x7f6a97bf4088
015b9 90                             nop        
015ba 90                             nop        
015bb 90                             nop        
015bc 478d1c16                       lea        r11d, [r14 + r10]
015c0 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
015c8 c4817a6f441908                 vmovdqu    xmm0, xmmword ptr [r9 + r11 + 8]
015cf 458bc2                         mov        r8d, r10d
015d2 c4817a7f440108                 vmovdqu    xmmword ptr [r9 + r8 + 8], xmm0
015d9 4183c210                       add        r10d, 0x10
015dd 443bd3                         cmp        r10d, ebx
015e0 7cda                           jl         0x7f6a97bf1ebc
015e2 895c2464                       mov        dword ptr [rsp + 0x64], ebx
015e6 e945f1ffff                     jmp        0x7f6a97bf1030
015eb 4803d9                         add        rbx, rcx
015ee 483b5c2440                     cmp        rbx, qword ptr [rsp + 0x40]
015f3 7e08                           jle        0x7f6a97bf1efd
015f5 4533c0                         xor        r8d, r8d
015f8 e9b9eaffff                     jmp        0x7f6a97bf09b6
015fd 4533c0                         xor        r8d, r8d
01600 bf01000000                     mov        edi, 1
01605 e9aeeaffff                     jmp        0x7f6a97bf09b8
0160a 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01612 4d8bd3                         mov        r10, r11
01615 4c3b257cded518                 cmp        r12, qword ptr [rip + 0x18d5de7c]
0161c 0f8414000000                   je         0x7f6a97bf1f36
01622 48bf2832a2ae6a7f0000           movabs     rdi, 0x7f6aaea23228
0162c 4883e4f0                       and        rsp, 0xfffffffffffffff0
01630 e82bc61218                     call       0x7f6aafd1e560
01635 f4                             hlt        
01636 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
0163e 418be9                         mov        ebp, r9d
01641 4489ac24f0000000               mov        dword ptr [rsp + 0xf0], r13d
01649 898424f4000000                 mov        dword ptr [rsp + 0xf4], eax
01650 498bf2                         mov        rsi, r10
01653 8b542464                       mov        edx, dword ptr [rsp + 0x64]
01657 8b8c2480000000                 mov        ecx, dword ptr [rsp + 0x80]
0165e 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
01663 8bf8                           mov        edi, eax
01665 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
0166d 44891424                       mov        dword ptr [rsp], r10d
01671 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01676 44895c2408                     mov        dword ptr [rsp + 8], r11d
0167b 90                             nop        
0167c c5f877                         vzeroupper 
0167f e8dcdcb3ff                     call       0x7f6a9772fc60
01684 0f1f84007c170002               nop        dword ptr [rax + rax + 0x200177c]
0168c 89442464                       mov        dword ptr [rsp + 0x64], eax
01690 e99bf0ffff                     jmp        0x7f6a97bf1030
01695 bee4ffffff                     mov        esi, 0xffffffe4
0169a 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0169f 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
016a4 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
016ac 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
016b1 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
016b9 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
016be 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
016c6 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
016cb 4c89542410                     mov        qword ptr [rsp + 0x10], r10
016d0 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
016d5 4c89542420                     mov        qword ptr [rsp + 0x20], r10
016da 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
016df 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
016e4 4c89542430                     mov        qword ptr [rsp + 0x30], r10
016e9 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
016ee 4c89542438                     mov        qword ptr [rsp + 0x38], r10
016f3 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
016f8 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
016fd 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01702 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01707 89442448                       mov        dword ptr [rsp + 0x48], eax
0170b 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01710 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01715 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
0171a 90                             nop        
0171b 90                             nop        
0171c c5f877                         vzeroupper 
0171f e83cbaadff                     call       0x7f6a976cda60
01724 0f1f84001c180003               nop        dword ptr [rax + rax + 0x300181c]
0172c 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
01736 4883e4f0                       and        rsp, 0xfffffffffffffff0
0173a e821c51218                     call       0x7f6aafd1e560
0173f f4                             hlt        
01740 bee4ffffff                     mov        esi, 0xffffffe4
01745 498bea                         mov        rbp, r10
01748 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0174d 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01755 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0175a 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01762 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01767 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
0176f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01774 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01779 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01781 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01786 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
0178b 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01790 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01795 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
0179a 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0179f 4c89542430                     mov        qword ptr [rsp + 0x30], r10
017a4 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
017a9 4c89542438                     mov        qword ptr [rsp + 0x38], r10
017ae 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
017b3 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
017b8 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
017bd 4489542440                     mov        dword ptr [rsp + 0x40], r10d
017c2 89442448                       mov        dword ptr [rsp + 0x48], eax
017c6 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
017cb 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
017d0 48894424f8                     mov        qword ptr [rsp - 8], rax
017d5 8b442464                       mov        eax, dword ptr [rsp + 0x64]
017d9 89442458                       mov        dword ptr [rsp + 0x58], eax
017dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017e2 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
017e8 c5f877                         vzeroupper 
017eb e870b9adff                     call       0x7f6a976cda60
017f0 0f1f8400e8180004               nop        dword ptr [rax + rax + 0x40018e8]
017f8 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
01802 4883e4f0                       and        rsp, 0xfffffffffffffff0
01806 e855c41218                     call       0x7f6aafd1e560
0180b f4                             hlt        
0180c bee4ffffff                     mov        esi, 0xffffffe4
01811 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01816 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0181b 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01823 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01828 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01830 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01835 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
0183d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01842 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01847 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0184f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01854 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01859 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0185e 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01863 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01868 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0186d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01872 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01877 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0187c 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01881 4489742450                     mov        dword ptr [rsp + 0x50], r14d
01886 90                             nop        
01887 90                             nop        
01888 c5f877                         vzeroupper 
0188b e8d0b8adff                     call       0x7f6a976cda60
01890 0f1f840088190005               nop        dword ptr [rax + rax + 0x5001988]
01898 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
018a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
018a6 e8b5c31218                     call       0x7f6aafd1e560
018ab f4                             hlt        
018ac bee4ffffff                     mov        esi, 0xffffffe4
018b1 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
018b6 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
018bb 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
018c3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
018c8 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
018d0 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
018d5 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
018dd 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
018e2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
018e7 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
018ef 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
018f4 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
018f9 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
018fe 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01903 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01908 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
0190d 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01912 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01917 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0191c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01921 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01926 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0192b 895c2450                       mov        dword ptr [rsp + 0x50], ebx
0192f c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
01935 90                             nop        
01936 90                             nop        
01937 90                             nop        
01938 c5f877                         vzeroupper 
0193b e820b8adff                     call       0x7f6a976cda60
01940 0f1f8400381a0006               nop        dword ptr [rax + rax + 0x6001a38]
01948 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
01952 4883e4f0                       and        rsp, 0xfffffffffffffff0
01956 e805c31218                     call       0x7f6aafd1e560
0195b f4                             hlt        
0195c be45ffffff                     mov        esi, 0xffffff45
01961 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
01969 90                             nop        
0196a 90                             nop        
0196b 90                             nop        
0196c c5f877                         vzeroupper 
0196f e8ecb7adff                     call       0x7f6a976cda60
01974 0f1f84006c1a0007               nop        dword ptr [rax + rax + 0x7001a6c]
0197c 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
01986 4883e4f0                       and        rsp, 0xfffffffffffffff0
0198a e8d1c21218                     call       0x7f6aafd1e560
0198f f4                             hlt        
01990 be45ffffff                     mov        esi, 0xffffff45
01995 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0199a 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0199f 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
019a7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
019ac 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
019b4 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
019b9 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
019c1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
019c6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
019cb 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
019d0 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
019d5 4c89542420                     mov        qword ptr [rsp + 0x20], r10
019da 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
019df 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
019e4 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
019e9 4c89542430                     mov        qword ptr [rsp + 0x30], r10
019ee 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
019f3 4c89542438                     mov        qword ptr [rsp + 0x38], r10
019f8 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
019fd 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01a02 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01a07 89442448                       mov        dword ptr [rsp + 0x48], eax
01a0b 897c2450                       mov        dword ptr [rsp + 0x50], edi
01a0f 90                             nop        
01a10 c5f877                         vzeroupper 
01a13 e848b7adff                     call       0x7f6a976cda60
01a18 0f1f8400101b0008               nop        dword ptr [rax + rax + 0x8001b10]
01a20 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
01a2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a2e e82dc21218                     call       0x7f6aafd1e560
01a33 f4                             hlt        
01a34 493bda                         cmp        rbx, r10
01a37 bdffffffff                     mov        ebp, 0xffffffff
01a3c 7c08                           jl         0x7f6a97bf2346
01a3e 400f95c5                       setne      bpl
01a42 400fb6ed                       movzx      ebp, bpl
01a46 be45ffffff                     mov        esi, 0xffffff45
01a4b 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
01a50 44898424f8000000               mov        dword ptr [rsp + 0xf8], r8d
01a58 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01a5d 44898424fc000000               mov        dword ptr [rsp + 0xfc], r8d
01a65 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
01a6a 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01a6f 48894424f8                     mov        qword ptr [rsp - 8], rax
01a74 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01a78 89442420                       mov        dword ptr [rsp + 0x20], eax
01a7c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a81 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01a86 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01a8b 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01a90 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
01a95 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01a9a 89442450                       mov        dword ptr [rsp + 0x50], eax
01a9e 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01aa3 90                             nop        
01aa4 c5f877                         vzeroupper 
01aa7 e8b4b6adff                     call       0x7f6a976cda60
01aac 0f1f8400a41b0009               nop        dword ptr [rax + rax + 0x9001ba4]
01ab4 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
01abe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ac2 e899c11218                     call       0x7f6aafd1e560
01ac7 f4                             hlt        
01ac8 be45ffffff                     mov        esi, 0xffffff45
01acd 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01ad2 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01ad7 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01adf 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01ae4 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01aec 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01af1 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01af9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01afe 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01b03 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01b08 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01b0d 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01b12 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01b17 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01b1c 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01b21 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01b26 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01b2b 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01b30 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01b35 89442448                       mov        dword ptr [rsp + 0x48], eax
01b39 90                             nop        
01b3a 90                             nop        
01b3b 90                             nop        
01b3c c5f877                         vzeroupper 
01b3f e81cb6adff                     call       0x7f6a976cda60
01b44 0f1f84003c1c000a               nop        dword ptr [rax + rax + 0xa001c3c]
01b4c 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
01b56 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b5a e801c11218                     call       0x7f6aafd1e560
01b5f f4                             hlt        
01b60 bee4ffffff                     mov        esi, 0xffffffe4
01b65 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01b6a 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01b6f 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01b77 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01b7c 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01b84 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01b89 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01b91 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01b96 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01b9b 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01ba3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01ba8 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01bad 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01bb2 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01bb7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01bbc 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01bc1 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01bc6 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01bcb 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01bd0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01bd5 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01bda 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01bdf 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01be4 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01be9 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01bee 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01bf3 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01bf7 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01bfc 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01c01 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01c06 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01c0b 90                             nop        
01c0c c5f877                         vzeroupper 
01c0f e84cb5adff                     call       0x7f6a976cda60
01c14 0f1f84000c1d000b               nop        dword ptr [rax + rax + 0xb001d0c]
01c1c 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
01c26 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c2a e831c01218                     call       0x7f6aafd1e560
01c2f f4                             hlt        
01c30 bee4ffffff                     mov        esi, 0xffffffe4
01c35 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01c3a 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01c3f 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01c47 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01c4c 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01c54 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01c59 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01c61 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01c66 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01c6b 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01c73 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01c78 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01c7d 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01c82 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01c87 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01c8c 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01c91 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01c96 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01c9b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01ca0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01ca5 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01caa 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01caf 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01cb4 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01cb9 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01cbe 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01cc3 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01cc7 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01ccc 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01cd1 90                             nop        
01cd2 90                             nop        
01cd3 90                             nop        
01cd4 c5f877                         vzeroupper 
01cd7 e884b4adff                     call       0x7f6a976cda60
01cdc 0f1f8400d41d000c               nop        dword ptr [rax + rax + 0xc001dd4]
01ce4 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
01cee 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cf2 e869bf1218                     call       0x7f6aafd1e560
01cf7 f4                             hlt        
01cf8 4c8b5c2438                     mov        r11, qword ptr [rsp + 0x38]
01cfd 4d3bc3                         cmp        r8, r11
01d00 bdffffffff                     mov        ebp, 0xffffffff
01d05 7c08                           jl         0x7f6a97bf260f
01d07 400f95c5                       setne      bpl
01d0b 400fb6ed                       movzx      ebp, bpl
01d0f be45ffffff                     mov        esi, 0xffffff45
01d14 8b4c240c                       mov        ecx, dword ptr [rsp + 0xc]
01d18 898c24f8000000                 mov        dword ptr [rsp + 0xf8], ecx
01d1f 8b4c2418                       mov        ecx, dword ptr [rsp + 0x18]
01d23 898c24fc000000                 mov        dword ptr [rsp + 0xfc], ecx
01d2a 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01d2f 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01d34 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01d39 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
01d3e 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01d43 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
01d48 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01d4d 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01d52 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
01d57 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01d5c 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01d60 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
01d65 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01d6a 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01d6f 90                             nop        
01d70 c5f877                         vzeroupper 
01d73 e8e8b3adff                     call       0x7f6a976cda60
01d78 0f1f8400701e000d               nop        dword ptr [rax + rax + 0xd001e70]
01d80 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
01d8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d8e e8cdbe1218                     call       0x7f6aafd1e560
01d93 f4                             hlt        
01d94 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01d99 493beb                         cmp        rbp, r11
01d9c bdffffffff                     mov        ebp, 0xffffffff
01da1 7c08                           jl         0x7f6a97bf26ab
01da3 400f95c5                       setne      bpl
01da7 400fb6ed                       movzx      ebp, bpl
01dab be45ffffff                     mov        esi, 0xffffff45
01db0 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
01db5 44898424f8000000               mov        dword ptr [rsp + 0xf8], r8d
01dbd 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01dc2 44898424fc000000               mov        dword ptr [rsp + 0xfc], r8d
01dca 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01dcf 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01dd4 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01dd9 4c8b442438                     mov        r8, qword ptr [rsp + 0x38]
01dde 4c89442430                     mov        qword ptr [rsp + 0x30], r8
01de3 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
01de8 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01ded 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01df2 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
01df7 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01dfc 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01e00 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
01e05 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01e0a 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01e0f 90                             nop        
01e10 c5f877                         vzeroupper 
01e13 e848b3adff                     call       0x7f6a976cda60
01e18 0f1f8400101f000e               nop        dword ptr [rax + rax + 0xe001f10]
01e20 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
01e2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e2e e82dbe1218                     call       0x7f6aafd1e560
01e33 f4                             hlt        
01e34 4183c608                       add        r14d, 8
01e38 be6effffff                     mov        esi, 0xffffff6e
01e3d 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01e42 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
01e47 44898424f0000000               mov        dword ptr [rsp + 0xf0], r8d
01e4f 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01e54 4c899c24f8000000               mov        qword ptr [rsp + 0xf8], r11
01e5c 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01e61 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
01e69 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
01e6e 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01e73 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01e78 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01e7d 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01e82 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01e87 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01e8c 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01e91 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01e96 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01e9b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01ea0 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01ea5 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01eaa 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01eaf 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01eb4 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01eb9 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01ebe 894c2458                       mov        dword ptr [rsp + 0x58], ecx
01ec2 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
01ec6 90                             nop        
01ec7 90                             nop        
01ec8 c5f877                         vzeroupper 
01ecb e890b2adff                     call       0x7f6a976cda60
01ed0 0f1f8400c81f000f               nop        dword ptr [rax + rax + 0xf001fc8]
01ed8 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
01ee2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ee6 e875bd1218                     call       0x7f6aafd1e560
01eeb f4                             hlt        
01eec 4183c608                       add        r14d, 8
01ef0 be66ffffff                     mov        esi, 0xffffff66
01ef5 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01efa 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01eff 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01f07 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01f0c 4c899c24f8000000               mov        qword ptr [rsp + 0xf8], r11
01f14 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01f19 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01f21 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
01f26 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01f2b 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01f30 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01f35 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01f3a 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01f3f 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01f44 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01f49 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01f4e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01f53 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01f58 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01f5d 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01f62 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01f67 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01f6c 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01f71 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01f76 894c2458                       mov        dword ptr [rsp + 0x58], ecx
01f7a 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
01f7e 90                             nop        
01f7f 90                             nop        
01f80 c5f877                         vzeroupper 
01f83 e8d8b1adff                     call       0x7f6a976cda60
01f88 0f1f840080200010               nop        dword ptr [rax + rax + 0x10002080]
01f90 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
01f9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f9e e8bdbc1218                     call       0x7f6aafd1e560
01fa3 f4                             hlt        
01fa4 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
01fae 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fb2 e8a9bc1218                     call       0x7f6aafd1e560
01fb7 f4                             hlt        
01fb8 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
01fc2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fc6 e895bc1218                     call       0x7f6aafd1e560
01fcb f4                             hlt        
01fcc 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
01fd6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fda e881bc1218                     call       0x7f6aafd1e560
01fdf f4                             hlt        
01fe0 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
01fea 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fee e86dbc1218                     call       0x7f6aafd1e560
01ff3 f4                             hlt        
01ff4 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
01ffe 4883e4f0                       and        rsp, 0xfffffffffffffff0
02002 e859bc1218                     call       0x7f6aafd1e560
02007 f4                             hlt        
02008 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
02012 4883e4f0                       and        rsp, 0xfffffffffffffff0
02016 e845bc1218                     call       0x7f6aafd1e560
0201b f4                             hlt        
0201c beccffffff                     mov        esi, 0xffffffcc
02021 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02026 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0202b 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02033 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02038 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02040 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02045 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
0204d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02052 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02057 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0205f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02064 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02069 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0206e 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
02073 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02078 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0207d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02082 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02087 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0208c 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
02091 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02096 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0209b 4489742450                     mov        dword ptr [rsp + 0x50], r14d
020a0 c5f877                         vzeroupper 
020a3 e8b8b0adff                     call       0x7f6a976cda60
020a8 0f1f8400a0210011               nop        dword ptr [rax + rax + 0x110021a0]
020b0 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
020ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
020be e89dbb1218                     call       0x7f6aafd1e560
020c3 f4                             hlt        
020c4 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
020c9 448b8424f0000000               mov        r8d, dword ptr [rsp + 0xf0]
020d1 440344244c                     add        r8d, dword ptr [rsp + 0x4c]
020d6 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
020de 4f8b4c0108                     mov        r9, qword ptr [r9 + r8 + 8]
020e3 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
020e8 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
020f0 4f894c1808                     mov        qword ptr [r8 + r11 + 8], r9
020f5 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
020fa 4183c108                       add        r9d, 8
020fe 453bca                         cmp        r9d, r10d
02101 7cc1                           jl         0x7f6a97bf29c4
02103 443bca                         cmp        r9d, edx
02106 0f8ddb000000                   jge        0x7f6a97bf2ae7
0210c 4d63d1                         movsxd     r10, r9d
0210f 4c03d1                         add        r10, rcx
02112 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
0211a 0f837c160000                   jae        0x7f6a97bf409c
02120 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
02125 4183c340                       add        r11d, 0x40
02129 4d63d3                         movsxd     r10, r11d
0212c 4c03d1                         add        r10, rcx
0212f 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
02137 0f8373160000                   jae        0x7f6a97bf40b0
0213d 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
02145 0f8379160000                   jae        0x7f6a97bf40c4
0214b 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
02153 0f837f160000                   jae        0x7f6a97bf40d8
02159 90                             nop        
0215a 90                             nop        
0215b 90                             nop        
0215c 90                             nop        
0215d 90                             nop        
0215e 90                             nop        
0215f 90                             nop        
02160 448b9c24f0000000               mov        r11d, dword ptr [rsp + 0xf0]
02168 4503d9                         add        r11d, r9d
0216b 458bc1                         mov        r8d, r9d
0216e 4963f8                         movsxd     rdi, r8d
02171 458bc3                         mov        r8d, r11d
02174 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0217c 4b8b740208                     mov        rsi, qword ptr [r10 + r8 + 8]
02181 4963c3                         movsxd     rax, r11d
02184 458bd1                         mov        r10d, r9d
02187 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
0218f 4b89741008                     mov        qword ptr [r8 + r10 + 8], rsi
02194 4d8b5c0010                     mov        r11, qword ptr [r8 + rax + 0x10]
02199 4d895c3810                     mov        qword ptr [r8 + rdi + 0x10], r11
0219e 4d8b5c0018                     mov        r11, qword ptr [r8 + rax + 0x18]
021a3 4d895c3818                     mov        qword ptr [r8 + rdi + 0x18], r11
021a8 4d8b5c0020                     mov        r11, qword ptr [r8 + rax + 0x20]
021ad 4d895c3820                     mov        qword ptr [r8 + rdi + 0x20], r11
021b2 4d8b5c0028                     mov        r11, qword ptr [r8 + rax + 0x28]
021b7 4d895c3828                     mov        qword ptr [r8 + rdi + 0x28], r11
021bc 4d8b5c0030                     mov        r11, qword ptr [r8 + rax + 0x30]
021c1 4d895c3830                     mov        qword ptr [r8 + rdi + 0x30], r11
021c6 4d8b5c0038                     mov        r11, qword ptr [r8 + rax + 0x38]
021cb 4d895c3838                     mov        qword ptr [r8 + rdi + 0x38], r11
021d0 4d8b5c0040                     mov        r11, qword ptr [r8 + rax + 0x40]
021d5 4d895c3840                     mov        qword ptr [r8 + rdi + 0x40], r11
021da 4183c140                       add        r9d, 0x40
021de 443bca                         cmp        r9d, edx
021e1 0f8c79ffffff                   jl         0x7f6a97bf2a60
021e7 443bcb                         cmp        r9d, ebx
021ea 0f8d31f0ffff                   jge        0x7f6a97bf1b21
021f0 4d63d1                         movsxd     r10, r9d
021f3 4c03d1                         add        r10, rcx
021f6 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
021fe 0f83e8150000                   jae        0x7f6a97bf40ec
02204 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
0220c 0f83ee150000                   jae        0x7f6a97bf4100
02212 90                             nop        
02213 90                             nop        
02214 448b9c24f0000000               mov        r11d, dword ptr [rsp + 0xf0]
0221c 4503d9                         add        r11d, r9d
0221f 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02227 4f8b5c1a08                     mov        r11, qword ptr [r10 + r11 + 8]
0222c 458bd1                         mov        r10d, r9d
0222f 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
02237 4f895c1008                     mov        qword ptr [r8 + r10 + 8], r11
0223c 4183c108                       add        r9d, 8
02240 443bcb                         cmp        r9d, ebx
02243 7ccf                           jl         0x7f6a97bf2b14
02245 e9d7efffff                     jmp        0x7f6a97bf1b21
0224a bee4ffffff                     mov        esi, 0xffffffe4
0224f 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02254 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02259 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02261 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02266 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0226e 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02273 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
0227b 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02280 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02285 48894424f8                     mov        qword ptr [rsp - 8], rax
0228a 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0228e 89442418                       mov        dword ptr [rsp + 0x18], eax
02292 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02297 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
0229c 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
022a1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
022a6 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
022ab 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
022b0 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
022b5 4c89542430                     mov        qword ptr [rsp + 0x30], r10
022ba 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
022bf 4c89542438                     mov        qword ptr [rsp + 0x38], r10
022c4 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
022c9 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
022ce 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
022d3 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
022d8 4489442444                     mov        dword ptr [rsp + 0x44], r8d
022dd 89442448                       mov        dword ptr [rsp + 0x48], eax
022e1 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
022e5 897c245c                       mov        dword ptr [rsp + 0x5c], edi
022e9 90                             nop        
022ea 90                             nop        
022eb 90                             nop        
022ec c5f877                         vzeroupper 
022ef e86caeadff                     call       0x7f6a976cda60
022f4 0f1f8400ec230012               nop        dword ptr [rax + rax + 0x120023ec]
022fc 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
02306 4883e4f0                       and        rsp, 0xfffffffffffffff0
0230a e851b91218                     call       0x7f6aafd1e560
0230f f4                             hlt        
02310 beccffffff                     mov        esi, 0xffffffcc
02315 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0231a 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02322 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02327 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
0232f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02334 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02339 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02341 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02346 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0234b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02350 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02355 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0235a 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0235f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02364 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02369 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0236e 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02373 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02378 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0237d 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02382 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
02387 90                             nop        
02388 c5f877                         vzeroupper 
0238b e8d0adadff                     call       0x7f6a976cda60
02390 0f1f840088240013               nop        dword ptr [rax + rax + 0x13002488]
02398 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
023a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
023a6 e8b5b81218                     call       0x7f6aafd1e560
023ab f4                             hlt        
023ac bee4ffffff                     mov        esi, 0xffffffe4
023b1 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
023b6 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
023bb 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
023c3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
023c8 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
023d0 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
023d5 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
023dd 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
023e2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
023e7 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
023ef 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
023f4 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
023f9 4489542418                     mov        dword ptr [rsp + 0x18], r10d
023fe 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02403 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02408 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
0240d 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02412 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02417 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0241c 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02421 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02426 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0242b 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02430 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02435 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0243a 4489542454                     mov        dword ptr [rsp + 0x54], r10d
0243f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02444 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02449 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0244e 90                             nop        
0244f 90                             nop        
02450 c5f877                         vzeroupper 
02453 e808adadff                     call       0x7f6a976cda60
02458 0f1f840050250014               nop        dword ptr [rax + rax + 0x14002550]
02460 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
0246a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0246e e8edb71218                     call       0x7f6aafd1e560
02473 f4                             hlt        
02474 bee4ffffff                     mov        esi, 0xffffffe4
02479 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0247e 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02486 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0248b 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02493 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02498 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0249d 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
024a5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
024aa 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
024af 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
024b4 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
024b9 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
024be 4c89542430                     mov        qword ptr [rsp + 0x30], r10
024c3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
024c8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
024cd 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
024d2 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
024d7 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
024dc 4489542444                     mov        dword ptr [rsp + 0x44], r10d
024e1 4489742454                     mov        dword ptr [rsp + 0x54], r14d
024e6 90                             nop        
024e7 90                             nop        
024e8 c5f877                         vzeroupper 
024eb e870acadff                     call       0x7f6a976cda60
024f0 0f1f8400e8250015               nop        dword ptr [rax + rax + 0x150025e8]
024f8 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
02502 4883e4f0                       and        rsp, 0xfffffffffffffff0
02506 e855b71218                     call       0x7f6aafd1e560
0250b f4                             hlt        
0250c 418d6e01                       lea        ebp, [r14 + 1]
02510 bee4ffffff                     mov        esi, 0xffffffe4
02515 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0251a 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02522 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02527 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
0252f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02534 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02539 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02541 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02546 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0254b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02550 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02555 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0255a 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0255f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02564 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02569 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0256e 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02573 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02578 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0257d 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02582 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02587 4489742454                     mov        dword ptr [rsp + 0x54], r14d
0258c c5f877                         vzeroupper 
0258f e8ccabadff                     call       0x7f6a976cda60
02594 0f1f84008c260016               nop        dword ptr [rax + rax + 0x1600268c]
0259c 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
025a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
025aa e8b1b61218                     call       0x7f6aafd1e560
025af f4                             hlt        
025b0 bee4ffffff                     mov        esi, 0xffffffe4
025b5 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
025ba 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
025c2 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
025c7 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
025cf 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
025d4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
025d9 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
025e1 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
025e6 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
025eb 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
025f0 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
025f5 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
025fa 4c89542430                     mov        qword ptr [rsp + 0x30], r10
025ff 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02604 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02609 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0260e 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02613 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02618 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0261d 4489742454                     mov        dword ptr [rsp + 0x54], r14d
02622 90                             nop        
02623 90                             nop        
02624 c5f877                         vzeroupper 
02627 e834abadff                     call       0x7f6a976cda60
0262c 0f1f840024270017               nop        dword ptr [rax + rax + 0x17002724]
02634 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
0263e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02642 e819b61218                     call       0x7f6aafd1e560
02647 f4                             hlt        
02648 bee4ffffff                     mov        esi, 0xffffffe4
0264d 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02652 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02657 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
0265f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02664 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0266c 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02671 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02679 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0267e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02683 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0268b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02690 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02695 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0269a 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
0269f 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
026a4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
026a9 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
026ae 4c89542430                     mov        qword ptr [rsp + 0x30], r10
026b3 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
026b8 4489542438                     mov        dword ptr [rsp + 0x38], r10d
026bd 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
026c2 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
026c7 4489742454                     mov        dword ptr [rsp + 0x54], r14d
026cc c5f877                         vzeroupper 
026cf e88caaadff                     call       0x7f6a976cda60
026d4 0f1f8400cc270018               nop        dword ptr [rax + rax + 0x180027cc]
026dc 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
026e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
026ea e871b51218                     call       0x7f6aafd1e560
026ef f4                             hlt        
026f0 bee4ffffff                     mov        esi, 0xffffffe4
026f5 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
026fa 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
026ff 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02707 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0270c 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02714 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02719 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
02721 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02726 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0272b 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02733 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02738 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0273d 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02742 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02747 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0274c 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02751 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02756 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0275b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02760 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02765 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0276a 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0276f 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02774 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02779 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0277e 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02783 4489742460                     mov        dword ptr [rsp + 0x60], r14d
02788 c5f877                         vzeroupper 
0278b e8d0a9adff                     call       0x7f6a976cda60
02790 0f1f840088280019               nop        dword ptr [rax + rax + 0x19002888]
02798 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
027a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
027a6 e8b5b41218                     call       0x7f6aafd1e560
027ab f4                             hlt        
027ac bee4ffffff                     mov        esi, 0xffffffe4
027b1 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
027b6 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
027be 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
027c3 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
027cb 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
027d0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
027d5 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
027dd 448954240c                     mov        dword ptr [rsp + 0xc], r10d
027e2 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
027e7 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
027ec 4c89542430                     mov        qword ptr [rsp + 0x30], r10
027f1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
027f6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
027fb 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02800 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02805 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0280a 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0280f 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02814 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02819 90                             nop        
0281a 90                             nop        
0281b 90                             nop        
0281c c5f877                         vzeroupper 
0281f e83ca9adff                     call       0x7f6a976cda60
02824 0f1f84001c29001a               nop        dword ptr [rax + rax + 0x1a00291c]
0282c 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
02836 4883e4f0                       and        rsp, 0xfffffffffffffff0
0283a e821b41218                     call       0x7f6aafd1e560
0283f f4                             hlt        
02840 85db                           test       ebx, ebx
02842 0f84cc0f0000                   je         0x7f6a97bf4114
02848 4c8bdb                         mov        r11, rbx
0284b 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02850 4533c0                         xor        r8d, r8d
02853 e914e5ffff                     jmp        0x7f6a97bf166c
02858 be6effffff                     mov        esi, 0xffffff6e
0285d 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02862 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02867 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
0286f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02874 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0287c 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02881 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02889 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
0288e 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02893 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02898 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0289d 4489542428                     mov        dword ptr [rsp + 0x28], r10d
028a2 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
028a7 4c89542430                     mov        qword ptr [rsp + 0x30], r10
028ac 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
028b1 4c89542438                     mov        qword ptr [rsp + 0x38], r10
028b6 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
028bb 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
028c0 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
028c5 4489542440                     mov        dword ptr [rsp + 0x40], r10d
028ca 4489442444                     mov        dword ptr [rsp + 0x44], r8d
028cf 89442448                       mov        dword ptr [rsp + 0x48], eax
028d3 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
028d8 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
028dd 895c2458                       mov        dword ptr [rsp + 0x58], ebx
028e1 897c2460                       mov        dword ptr [rsp + 0x60], edi
028e5 90                             nop        
028e6 90                             nop        
028e7 90                             nop        
028e8 c5f877                         vzeroupper 
028eb e870a8adff                     call       0x7f6a976cda60
028f0 0f1f8400e829001b               nop        dword ptr [rax + rax + 0x1b0029e8]
028f8 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
02902 4883e4f0                       and        rsp, 0xfffffffffffffff0
02906 e855b31218                     call       0x7f6aafd1e560
0290b f4                             hlt        
0290c be45ffffff                     mov        esi, 0xffffff45
02911 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02916 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0291b 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02923 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02928 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02930 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02935 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
0293d 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
02942 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02947 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0294c 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
02951 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
02956 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0295b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02960 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02965 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0296a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0296f 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
02974 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02979 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0297e 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02983 89442448                       mov        dword ptr [rsp + 0x48], eax
02987 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
0298b 897c245c                       mov        dword ptr [rsp + 0x5c], edi
0298f 90                             nop        
02990 c5f877                         vzeroupper 
02993 e8c8a7adff                     call       0x7f6a976cda60
02998 0f1f8400902a001c               nop        dword ptr [rax + rax + 0x1c002a90]
029a0 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
029aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
029ae e8adb21218                     call       0x7f6aafd1e560
029b3 f4                             hlt        
029b4 be3dffffff                     mov        esi, 0xffffff3d
029b9 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
029be 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
029c3 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
029cb 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
029d0 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
029d8 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
029dd 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
029e5 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
029ea 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
029ef 4c89542420                     mov        qword ptr [rsp + 0x20], r10
029f4 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
029f9 4489542428                     mov        dword ptr [rsp + 0x28], r10d
029fe 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02a03 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02a08 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02a0d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02a12 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02a17 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
02a1c 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02a21 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02a26 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02a2b 89442448                       mov        dword ptr [rsp + 0x48], eax
02a2f 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
02a33 897c245c                       mov        dword ptr [rsp + 0x5c], edi
02a37 90                             nop        
02a38 c5f877                         vzeroupper 
02a3b e820a7adff                     call       0x7f6a976cda60
02a40 0f1f8400382b001d               nop        dword ptr [rax + rax + 0x1d002b38]
02a48 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
02a52 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a56 e805b21218                     call       0x7f6aafd1e560
02a5b f4                             hlt        
02a5c bee4ffffff                     mov        esi, 0xffffffe4
02a61 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02a66 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02a6e 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02a73 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02a7b 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02a80 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02a85 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02a8d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02a92 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02a97 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02a9c 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02aa1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02aa6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02aab 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02ab0 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02ab5 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02aba 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02abf 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02ac4 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02ac9 90                             nop        
02aca 90                             nop        
02acb 90                             nop        
02acc c5f877                         vzeroupper 
02acf e88ca6adff                     call       0x7f6a976cda60
02ad4 0f1f8400cc2b001e               nop        dword ptr [rax + rax + 0x1e002bcc]
02adc 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
02ae6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02aea e871b11218                     call       0x7f6aafd1e560
02aef f4                             hlt        
02af0 bee4ffffff                     mov        esi, 0xffffffe4
02af5 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02afa 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02b02 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02b07 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02b0f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02b14 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02b19 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02b21 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02b26 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02b2b 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02b30 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02b35 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02b3a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02b3f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02b44 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02b49 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02b4e 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02b53 90                             nop        
02b54 c5f877                         vzeroupper 
02b57 e804a6adff                     call       0x7f6a976cda60
02b5c 0f1f8400542c001f               nop        dword ptr [rax + rax + 0x1f002c54]
02b64 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
02b6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b72 e8e9b01218                     call       0x7f6aafd1e560
02b77 f4                             hlt        
02b78 beccffffff                     mov        esi, 0xffffffcc
02b7d 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02b82 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02b87 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02b8f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02b94 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02b9c 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02ba1 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
02ba9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02bae 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02bb3 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02bbb 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02bc0 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02bc5 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02bca 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02bcf 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02bd4 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02bd9 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02bde 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02be3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02be8 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02bed 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02bf2 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02bf7 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02bfc 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02c01 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02c06 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02c0b 4489742458                     mov        dword ptr [rsp + 0x58], r14d
02c10 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02c15 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02c1a 90                             nop        
02c1b 90                             nop        
02c1c c5f877                         vzeroupper 
02c1f e83ca5adff                     call       0x7f6a976cda60
02c24 0f1f84001c2d0020               nop        dword ptr [rax + rax + 0x20002d1c]
02c2c 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
02c36 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c3a e821b01218                     call       0x7f6aafd1e560
02c3f f4                             hlt        
02c40 bee4ffffff                     mov        esi, 0xffffffe4
02c45 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02c4a 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02c4f 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02c57 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02c5c 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02c64 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02c69 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02c71 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02c76 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02c7b 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02c80 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02c85 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02c8a 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02c8f 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02c94 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02c99 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02c9e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02ca3 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02ca8 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02cad 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02cb2 89442444                       mov        dword ptr [rsp + 0x44], eax
02cb6 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02cbb 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02cc0 895c2450                       mov        dword ptr [rsp + 0x50], ebx
02cc4 48894424f8                     mov        qword ptr [rsp - 8], rax
02cc9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02ccd 89442454                       mov        dword ptr [rsp + 0x54], eax
02cd1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cd6 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
02cdb 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
02ce0 c5f877                         vzeroupper 
02ce3 e878a4adff                     call       0x7f6a976cda60
02ce8 0f1f8400e02d0021               nop        dword ptr [rax + rax + 0x21002de0]
02cf0 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
02cfa 4883e4f0                       and        rsp, 0xfffffffffffffff0
02cfe e85daf1218                     call       0x7f6aafd1e560
02d03 f4                             hlt        
02d04 c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
02d0d bee4ffffff                     mov        esi, 0xffffffe4
02d12 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02d17 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02d1c 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02d24 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02d29 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02d31 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02d36 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
02d3e 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02d43 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02d48 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02d50 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02d55 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02d5a 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02d5f 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02d64 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02d69 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02d6e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02d73 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02d78 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02d7d 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02d82 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02d87 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02d8c 89442444                       mov        dword ptr [rsp + 0x44], eax
02d90 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02d95 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02d9a 895c2450                       mov        dword ptr [rsp + 0x50], ebx
02d9e 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
02da3 48894424f8                     mov        qword ptr [rsp - 8], rax
02da8 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02dac 89442460                       mov        dword ptr [rsp + 0x60], eax
02db0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02db5 90                             nop        
02db6 90                             nop        
02db7 90                             nop        
02db8 c5f877                         vzeroupper 
02dbb e8a0a3adff                     call       0x7f6a976cda60
02dc0 0f1f8400b82e0022               nop        dword ptr [rax + rax + 0x22002eb8]
02dc8 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
02dd2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02dd6 e885ae1218                     call       0x7f6aafd1e560
02ddb f4                             hlt        
02ddc 418be9                         mov        ebp, r9d
02ddf 83c510                         add        ebp, 0x10
02de2 be6effffff                     mov        esi, 0xffffff6e
02de7 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02dec 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02df4 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02df9 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02e01 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02e06 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02e0b 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
02e10 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02e15 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02e1a 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02e1f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02e24 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02e29 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02e2e 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02e33 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02e38 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02e3d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02e41 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02e46 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02e4b 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
02e4f 90                             nop        
02e50 c5f877                         vzeroupper 
02e53 e808a3adff                     call       0x7f6a976cda60
02e58 0f1f8400502f0023               nop        dword ptr [rax + rax + 0x23002f50]
02e60 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
02e6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e6e e8edad1218                     call       0x7f6aafd1e560
02e73 f4                             hlt        
02e74 418be9                         mov        ebp, r9d
02e77 83c510                         add        ebp, 0x10
02e7a be66ffffff                     mov        esi, 0xffffff66
02e7f 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02e84 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02e8c 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02e91 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02e99 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02e9e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02ea3 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
02ea8 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02ead 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02eb2 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02eb7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02ebc 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02ec1 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02ec6 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02ecb 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02ed0 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02ed5 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02ed9 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02ede 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02ee3 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
02ee7 90                             nop        
02ee8 c5f877                         vzeroupper 
02eeb e870a2adff                     call       0x7f6a976cda60
02ef0 0f1f8400e82f0024               nop        dword ptr [rax + rax + 0x24002fe8]
02ef8 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
02f02 4883e4f0                       and        rsp, 0xfffffffffffffff0
02f06 e855ad1218                     call       0x7f6aafd1e560
02f0b f4                             hlt        
02f0c be17000000                     mov        esi, 0x17
02f11 90                             nop        
02f12 90                             nop        
02f13 90                             nop        
02f14 c5f877                         vzeroupper 
02f17 e844a2adff                     call       0x7f6a976cda60
02f1c 0f1f840014300025               nop        dword ptr [rax + rax + 0x25003014]
02f24 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
02f2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02f32 e829ad1218                     call       0x7f6aafd1e560
02f37 f4                             hlt        
02f38 be6effffff                     mov        esi, 0xffffff6e
02f3d 48899424f0000000               mov        qword ptr [rsp + 0xf0], rdx
02f45 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02f4a 48ff742428                     push       qword ptr [rsp + 0x28]
02f4f 488f442420                     pop        qword ptr [rsp + 0x20]
02f54 897c2428                       mov        dword ptr [rsp + 0x28], edi
02f58 4c89442430                     mov        qword ptr [rsp + 0x30], r8
02f5d 48ff742440                     push       qword ptr [rsp + 0x40]
02f62 488f442438                     pop        qword ptr [rsp + 0x38]
02f67 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
02f6b 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
02f70 4c89742448                     mov        qword ptr [rsp + 0x48], r14
02f75 90                             nop        
02f76 90                             nop        
02f77 90                             nop        
02f78 c5f877                         vzeroupper 
02f7b e8e0a1adff                     call       0x7f6a976cda60
02f80 0f1f840078300026               nop        dword ptr [rax + rax + 0x26003078]
02f88 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
02f92 4883e4f0                       and        rsp, 0xfffffffffffffff0
02f96 e8c5ac1218                     call       0x7f6aafd1e560
02f9b f4                             hlt        
02f9c bebeffffff                     mov        esi, 0xffffffbe
02fa1 4c89ac24f0000000               mov        qword ptr [rsp + 0xf0], r13
02fa9 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02fae 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02fb6 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02fbb 4889542418                     mov        qword ptr [rsp + 0x18], rdx
02fc0 48ff742428                     push       qword ptr [rsp + 0x28]
02fc5 488f442420                     pop        qword ptr [rsp + 0x20]
02fca 897c2428                       mov        dword ptr [rsp + 0x28], edi
02fce 4c89442430                     mov        qword ptr [rsp + 0x30], r8
02fd3 48ff742440                     push       qword ptr [rsp + 0x40]
02fd8 488f442438                     pop        qword ptr [rsp + 0x38]
02fdd 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
02fe1 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
02fe6 4c89742448                     mov        qword ptr [rsp + 0x48], r14
02feb 90                             nop        
02fec c5f877                         vzeroupper 
02fef e86ca1adff                     call       0x7f6a976cda60
02ff4 0f1f8400ec300027               nop        dword ptr [rax + rax + 0x270030ec]
02ffc 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
03006 4883e4f0                       and        rsp, 0xfffffffffffffff0
0300a e851ac1218                     call       0x7f6aafd1e560
0300f f4                             hlt        
03010 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
03015 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0301a bef6ffffff                     mov        esi, 0xfffffff6
0301f 498bed                         mov        rbp, r13
03022 44898c24f0000000               mov        dword ptr [rsp + 0xf0], r9d
0302a 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
03032 90                             nop        
03033 90                             nop        
03034 c5f877                         vzeroupper 
03037 e824a1adff                     call       0x7f6a976cda60
0303c 0f1f840034310028               nop        dword ptr [rax + rax + 0x28003134]
03044 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
0304e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03052 e809ac1218                     call       0x7f6aafd1e560
03057 f4                             hlt        
03058 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
0305c eb10                           jmp        0x7f6a97bf396e
0305e 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
03062 eb0a                           jmp        0x7f6a97bf396e
03064 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
03068 eb04                           jmp        0x7f6a97bf396e
0306a 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
0306e beccffffff                     mov        esi, 0xffffffcc
03073 4c89ac24f0000000               mov        qword ptr [rsp + 0xf0], r13
0307b 44898424f8000000               mov        dword ptr [rsp + 0xf8], r8d
03083 4c89742410                     mov        qword ptr [rsp + 0x10], r14
03088 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0308d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
03092 90                             nop        
03093 90                             nop        
03094 c5f877                         vzeroupper 
03097 e8c4a0adff                     call       0x7f6a976cda60
0309c 0f1f840094310029               nop        dword ptr [rax + rax + 0x29003194]
030a4 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
030ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
030b2 e8a9ab1218                     call       0x7f6aafd1e560
030b7 f4                             hlt        
030b8 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
030bc 4c8b742478                     mov        r14, qword ptr [rsp + 0x78]
030c1 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
030c6 eba6                           jmp        0x7f6a97bf396e
030c8 bee4ffffff                     mov        esi, 0xffffffe4
030cd 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
030d2 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
030d7 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
030df 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
030e4 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
030ec 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
030f1 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
030f9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
030fe 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03103 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0310b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
03110 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
03115 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0311a 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0311f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
03124 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
03129 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0312e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
03133 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
03138 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0313d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
03142 4489542438                     mov        dword ptr [rsp + 0x38], r10d
03147 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0314c 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
03151 895c2444                       mov        dword ptr [rsp + 0x44], ebx
03155 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
0315a 90                             nop        
0315b 90                             nop        
0315c c5f877                         vzeroupper 
0315f e8fc9fadff                     call       0x7f6a976cda60
03164 0f1f84005c32002a               nop        dword ptr [rax + rax + 0x2a00325c]
0316c 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
03176 4883e4f0                       and        rsp, 0xfffffffffffffff0
0317a e8e1aa1218                     call       0x7f6aafd1e560
0317f f4                             hlt        
03180 bee4ffffff                     mov        esi, 0xffffffe4
03185 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0318a 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0318f 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
03197 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0319c 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
031a4 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
031a9 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
031b1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
031b6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
031bb 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
031c3 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
031c8 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
031cd 4c89542420                     mov        qword ptr [rsp + 0x20], r10
031d2 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
031d7 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
031dc 4c89542428                     mov        qword ptr [rsp + 0x28], r10
031e1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
031e6 4c89542430                     mov        qword ptr [rsp + 0x30], r10
031eb 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
031f0 4489542438                     mov        dword ptr [rsp + 0x38], r10d
031f5 895c2444                       mov        dword ptr [rsp + 0x44], ebx
031f9 90                             nop        
031fa 90                             nop        
031fb 90                             nop        
031fc c5f877                         vzeroupper 
031ff e85c9fadff                     call       0x7f6a976cda60
03204 0f1f8400fc32002b               nop        dword ptr [rax + rax + 0x2b0032fc]
0320c 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
03216 4883e4f0                       and        rsp, 0xfffffffffffffff0
0321a e841aa1218                     call       0x7f6aafd1e560
0321f f4                             hlt        
03220 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
03225 4183c308                       add        r11d, 8
03229 be6effffff                     mov        esi, 0xffffff6e
0322e 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
03233 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
03238 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
03240 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
03245 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0324d 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
03252 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
0325a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0325f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03264 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
03269 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0326e 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
03273 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
03278 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0327d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
03282 4c89542430                     mov        qword ptr [rsp + 0x30], r10
03287 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0328c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
03291 895c2448                       mov        dword ptr [rsp + 0x48], ebx
03295 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0329a 90                             nop        
0329b 90                             nop        
0329c c5f877                         vzeroupper 
0329f e8bc9eadff                     call       0x7f6a976cda60
032a4 0f1f84009c33002c               nop        dword ptr [rax + rax + 0x2c00339c]
032ac 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
032b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
032ba e8a1a91218                     call       0x7f6aafd1e560
032bf f4                             hlt        
032c0 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
032c5 4183c308                       add        r11d, 8
032c9 be66ffffff                     mov        esi, 0xffffff66
032ce 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
032d3 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
032d8 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
032e0 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
032e5 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
032ed 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
032f2 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
032fa 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
032ff 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03304 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
03309 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0330e 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
03313 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
03318 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0331d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
03322 4c89542430                     mov        qword ptr [rsp + 0x30], r10
03327 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0332c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
03331 895c2448                       mov        dword ptr [rsp + 0x48], ebx
03335 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0333a 90                             nop        
0333b 90                             nop        
0333c c5f877                         vzeroupper 
0333f e81c9eadff                     call       0x7f6a976cda60
03344 0f1f84003c34002d               nop        dword ptr [rax + rax + 0x2d00343c]
0334c 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
03356 4883e4f0                       and        rsp, 0xfffffffffffffff0
0335a e801a91218                     call       0x7f6aafd1e560
0335f f4                             hlt        
03360 448bd6                         mov        r10d, esi
03363 e961deffff                     jmp        0x7f6a97bf1ac9
03368 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
03372 4883e4f0                       and        rsp, 0xfffffffffffffff0
03376 e8e5a81218                     call       0x7f6aafd1e560
0337b f4                             hlt        
0337c 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
03386 4883e4f0                       and        rsp, 0xfffffffffffffff0
0338a e8d1a81218                     call       0x7f6aafd1e560
0338f f4                             hlt        
03390 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
0339a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0339e e8bda81218                     call       0x7f6aafd1e560
033a3 f4                             hlt        
033a4 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
033ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
033b2 e8a9a81218                     call       0x7f6aafd1e560
033b7 f4                             hlt        
033b8 beccffffff                     mov        esi, 0xffffffcc
033bd 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
033c2 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
033c7 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
033cf 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
033d4 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
033dc 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
033e1 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
033e9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
033ee 4c89542410                     mov        qword ptr [rsp + 0x10], r10
033f3 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
033fb 448954240c                     mov        dword ptr [rsp + 0xc], r10d
03400 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
03405 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0340a 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
0340f 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
03414 4c89542430                     mov        qword ptr [rsp + 0x30], r10
03419 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0341e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
03423 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
03428 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0342d 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
03432 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
03437 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0343c 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
03441 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
03446 89442468                       mov        dword ptr [rsp + 0x68], eax
0344a 90                             nop        
0344b 90                             nop        
0344c c5f877                         vzeroupper 
0344f e80c9dadff                     call       0x7f6a976cda60
03454 0f1f84004c35002e               nop        dword ptr [rax + rax + 0x2e00354c]
0345c 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
03466 4883e4f0                       and        rsp, 0xfffffffffffffff0
0346a e8f1a71218                     call       0x7f6aafd1e560
0346f f4                             hlt        
03470 bee4ffffff                     mov        esi, 0xffffffe4
03475 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0347a 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0347f 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
03487 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0348c 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
03494 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
03499 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
034a1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
034a6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
034ab 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
034b3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
034b8 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
034bd 4c89542420                     mov        qword ptr [rsp + 0x20], r10
034c2 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
034c7 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
034cc 4c89542428                     mov        qword ptr [rsp + 0x28], r10
034d1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
034d6 4c89542430                     mov        qword ptr [rsp + 0x30], r10
034db 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
034e0 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
034e5 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
034ea 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
034ef 895c2444                       mov        dword ptr [rsp + 0x44], ebx
034f3 4489742454                     mov        dword ptr [rsp + 0x54], r14d
034f8 c5f877                         vzeroupper 
034fb e8609cadff                     call       0x7f6a976cda60
03500 0f1f8400f835002f               nop        dword ptr [rax + rax + 0x2f0035f8]
03508 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
03512 4883e4f0                       and        rsp, 0xfffffffffffffff0
03516 e845a71218                     call       0x7f6aafd1e560
0351b f4                             hlt        
0351c c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
03525 bee4ffffff                     mov        esi, 0xffffffe4
0352a 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0352f 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
03534 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
0353c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
03541 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
03549 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0354e 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
03556 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0355b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03560 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
03568 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0356d 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
03572 4c89542420                     mov        qword ptr [rsp + 0x20], r10
03577 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
0357c 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
03581 4c89542428                     mov        qword ptr [rsp + 0x28], r10
03586 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0358b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
03590 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
03595 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0359a 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0359f 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
035a4 895c2444                       mov        dword ptr [rsp + 0x44], ebx
035a8 448974244c                     mov        dword ptr [rsp + 0x4c], r14d
035ad 90                             nop        
035ae 90                             nop        
035af 90                             nop        
035b0 c5f877                         vzeroupper 
035b3 e8a89badff                     call       0x7f6a976cda60
035b8 0f1f8400b0360030               nop        dword ptr [rax + rax + 0x300036b0]
035c0 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
035ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
035ce e88da61218                     call       0x7f6aafd1e560
035d3 f4                             hlt        
035d4 4183c610                       add        r14d, 0x10
035d8 be6effffff                     mov        esi, 0xffffff6e
035dd 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
035e2 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
035ea 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
035ef 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
035f7 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
035fc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03601 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
03606 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0360b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
03610 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
03615 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0361a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0361f 4489542440                     mov        dword ptr [rsp + 0x40], r10d
03624 4489742450                     mov        dword ptr [rsp + 0x50], r14d
03629 895c2454                       mov        dword ptr [rsp + 0x54], ebx
0362d 90                             nop        
0362e 90                             nop        
0362f 90                             nop        
03630 c5f877                         vzeroupper 
03633 e8289badff                     call       0x7f6a976cda60
03638 0f1f840030370031               nop        dword ptr [rax + rax + 0x31003730]
03640 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
0364a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0364e e80da61218                     call       0x7f6aafd1e560
03653 f4                             hlt        
03654 4183c610                       add        r14d, 0x10
03658 be66ffffff                     mov        esi, 0xffffff66
0365d 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
03662 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
0366a 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0366f 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
03677 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0367c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03681 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
03686 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0368b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
03690 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
03695 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0369a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0369f 4489542440                     mov        dword ptr [rsp + 0x40], r10d
036a4 4489742450                     mov        dword ptr [rsp + 0x50], r14d
036a9 895c2454                       mov        dword ptr [rsp + 0x54], ebx
036ad 90                             nop        
036ae 90                             nop        
036af 90                             nop        
036b0 c5f877                         vzeroupper 
036b3 e8a89aadff                     call       0x7f6a976cda60
036b8 0f1f8400b0370032               nop        dword ptr [rax + rax + 0x320037b0]
036c0 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
036ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
036ce e88da51218                     call       0x7f6aafd1e560
036d3 f4                             hlt        
036d4 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
036de 4883e4f0                       and        rsp, 0xfffffffffffffff0
036e2 e879a51218                     call       0x7f6aafd1e560
036e7 f4                             hlt        
036e8 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
036f2 4883e4f0                       and        rsp, 0xfffffffffffffff0
036f6 e865a51218                     call       0x7f6aafd1e560
036fb f4                             hlt        
036fc 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
03706 4883e4f0                       and        rsp, 0xfffffffffffffff0
0370a e851a51218                     call       0x7f6aafd1e560
0370f f4                             hlt        
03710 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
0371a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0371e e83da51218                     call       0x7f6aafd1e560
03723 f4                             hlt        
03724 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
0372e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03732 e829a51218                     call       0x7f6aafd1e560
03737 f4                             hlt        
03738 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
03742 4883e4f0                       and        rsp, 0xfffffffffffffff0
03746 e815a51218                     call       0x7f6aafd1e560
0374b f4                             hlt        
0374c 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
03756 4883e4f0                       and        rsp, 0xfffffffffffffff0
0375a e801a51218                     call       0x7f6aafd1e560
0375f f4                             hlt        
03760 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
0376a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0376e e8eda41218                     call       0x7f6aafd1e560
03773 f4                             hlt        
03774 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
0377e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03782 e8d9a41218                     call       0x7f6aafd1e560
03787 f4                             hlt        
03788 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
03792 4883e4f0                       and        rsp, 0xfffffffffffffff0
03796 e8c5a41218                     call       0x7f6aafd1e560
0379b f4                             hlt        
0379c 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
037a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
037aa e8b1a41218                     call       0x7f6aafd1e560
037af f4                             hlt        
037b0 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
037ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
037be e89da41218                     call       0x7f6aafd1e560
037c3 f4                             hlt        
037c4 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
037ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
037d2 e889a41218                     call       0x7f6aafd1e560
037d7 f4                             hlt        
037d8 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
037e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
037e6 e875a41218                     call       0x7f6aafd1e560
037eb f4                             hlt        
037ec 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
037f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
037fa e861a41218                     call       0x7f6aafd1e560
037ff f4                             hlt        
03800 48bf900676706a7f0000           movabs     rdi, 0x7f6a70760690
0380a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0380e e84da41218                     call       0x7f6aafd1e560
03813 f4                             hlt        
03814 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
03819 4533c9                         xor        r9d, r9d
0381c 458bd3                         mov        r10d, r11d
0381f e9f6f7ffff                     jmp        0x7f6a97bf391a
03824 bef6ffffff                     mov        esi, 0xfffffff6
03829 90                             nop        
0382a 90                             nop        
0382b 90                             nop        
0382c c5f877                         vzeroupper 
0382f e82c99adff                     call       0x7f6a976cda60
03834 0f1f84002c390033               nop        dword ptr [rax + rax + 0x3300392c]
0383c 48bf80728b706a7f0000           movabs     rdi, 0x7f6a708b7280
03846 4883e4f0                       and        rsp, 0xfffffffffffffff0
0384a e811a41218                     call       0x7f6aafd1e560
0384f f4                             hlt        
03850 488bf0                         mov        rsi, rax
03853 c5f877                         vzeroupper 
03856 4881c4e0000000                 add        rsp, 0xe0
0385d 5d                             pop        rbp
0385e e97d22adff                     jmp        0x7f6a976c63e0
03863 49bae116bf976a7f0000           movabs     r10, 0x7f6a97bf16e1
0386d 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
03874 e9e7e1b3ff                     jmp        0x7f6a97732360
03879 e862b0b2ff                     call       0x7f6a9771f1e0
0387e e9bbc7ffff                     jmp        0x7f6a97bf093e
03883 f4                             hlt        
03884 f4                             hlt        
03885 f4                             hlt        
03886 f4                             hlt        
03887 f4                             hlt        
