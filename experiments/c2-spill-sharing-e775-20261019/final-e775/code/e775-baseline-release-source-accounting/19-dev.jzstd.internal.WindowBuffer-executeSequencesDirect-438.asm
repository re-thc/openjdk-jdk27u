00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f854024a8ff                   jne        0x7fc00b8fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ece0000000                 sub        rsp, 0xe0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f8523300000                   jne        0x7fc00be7b561
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
0006f 0f8f43290000                   jg         0x7fc00be7aeb8
00075 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00079 4c89442428                     mov        qword ptr [rsp + 0x28], r8
0007e 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
00082 48638c24f0000000               movsxd     rcx, dword ptr [rsp + 0xf0]
0008a 48635c2464                     movsxd     rbx, dword ptr [rsp + 0x64]
0008f 48035c2428                     add        rbx, qword ptr [rsp + 0x28]
00094 4c2bc3                         sub        r8, rbx
00097 493bc8                         cmp        rcx, r8
0009a 0f8f18290000                   jg         0x7fc00be7aeb8
000a0 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
000a4 4c89442440                     mov        qword ptr [rsp + 0x40], r8
000a9 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000ad 4d85c0                         test       r8, r8
000b0 0f8477130000                   je         0x7fc00be7992d
000b6 33ff                           xor        edi, edi
000b8 4c8bea                         mov        r13, rdx
000bb 8b7204                         mov        esi, dword ptr [rdx + 4]
000be 418b5e40                       mov        ebx, dword ptr [r14 + 0x40]
000c2 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
000c9 418be9                         mov        ebp, r9d
000cc 4585c9                         test       r9d, r9d
000cf 0f8edf220000                   jle        0x7fc00be7a8b4
000d5 4c2b442428                     sub        r8, qword ptr [rsp + 0x28]
000da 448d4ee0                       lea        r9d, [rsi - 0x20]
000de 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
000e6 418d4ae0                       lea        ecx, [r10 - 0x20]
000ea 458b5304                       mov        r10d, dword ptr [r11 + 4]
000ee 4585d2                         test       r10d, r10d
000f1 0f86d9280000                   jbe        0x7fc00be7aed0
000f7 4d63d2                         movsxd     r10, r10d
000fa 4863dd                         movsxd     rbx, ebp
000fd 48ffcb                         dec        rbx
00100 493bda                         cmp        rbx, r10
00103 0f83c7280000                   jae        0x7fc00be7aed0
00109 488b9424f8000000               mov        rdx, qword ptr [rsp + 0xf8]
00111 8b5a04                         mov        ebx, dword ptr [rdx + 4]
00114 85db                           test       ebx, ebx
00116 0f8604290000                   jbe        0x7fc00be7af20
0011c 83fb01                         cmp        ebx, 1
0011f 0f86fb280000                   jbe        0x7fc00be7af20
00125 83fb02                         cmp        ebx, 2
00128 0f86f2280000                   jbe        0x7fc00be7af20
0012e 448d56f1                       lea        r10d, [rsi - 0xf]
00132 4585d2                         test       r10d, r10d
00135 0f8ce5280000                   jl         0x7fc00be7af20
0013b 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00143 418b4204                       mov        eax, dword ptr [r10 + 4]
00147 448d50f1                       lea        r10d, [rax - 0xf]
0014b 4585d2                         test       r10d, r10d
0014e 0f8ccc280000                   jl         0x7fc00be7af20
00154 448d50fd                       lea        r10d, [rax - 3]
00158 4585d2                         test       r10d, r10d
0015b 0f8cbf280000                   jl         0x7fc00be7af20
00161 448d50f9                       lea        r10d, [rax - 7]
00165 4585d2                         test       r10d, r10d
00168 0f8cb2280000                   jl         0x7fc00be7af20
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
001bd 448bc6                         mov        r8d, esi
001c0 458d5afd                       lea        r11d, [r10 - 3]
001c4 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
001cc 4d63d8                         movsxd     r11, r8d
001cf 4183c0f1                       add        r8d, -0xf
001d3 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
001db 4983c3f1                       add        r11, -0xf
001df 4c899c2490000000               mov        qword ptr [rsp + 0x90], r11
001e7 4d63c2                         movsxd     r8, r10d
001ea 458d5af9                       lea        r11d, [r10 - 7]
001ee 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
001f6 4183c2f1                       add        r10d, -0xf
001fa 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00202 4d8d50f1                       lea        r10, [r8 - 0xf]
00206 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0020e 4983c0f9                       add        r8, -7
00212 4c898424a8000000               mov        qword ptr [rsp + 0xa8], r8
0021a 4533c9                         xor        r9d, r9d
0021d 4533c0                         xor        r8d, r8d
00220 e9a6040000                     jmp        0x7fc00be78bcb
00225 448bd5                         mov        r10d, ebp
00228 4d63d2                         movsxd     r10, r10d
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
00262 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
0026a 443b54245c                     cmp        r10d, dword ptr [rsp + 0x5c]
0026f 0f8d08080000                   jge        0x7fc00be78f7d
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
002b6 0f8c681c0000                   jl         0x7fc00be7a424
002bc 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
002c4 4585d2                         test       r10d, r10d
002c7 0f8c571c0000                   jl         0x7fc00be7a424
002cd 448bdd                         mov        r11d, ebp
002d0 44039c24b8000000               add        r11d, dword ptr [rsp + 0xb8]
002d8 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
002dd 453bd3                         cmp        r10d, r11d
002e0 0f823e1c0000                   jb         0x7fc00be7a424
002e6 448bb424b4000000               mov        r14d, dword ptr [rsp + 0xb4]
002ee 4403f5                         add        r14d, ebp
002f1 453bd6                         cmp        r10d, r14d
002f4 0f822a1c0000                   jb         0x7fc00be7a424
002fa 85ed                           test       ebp, ebp
002fc 0f8c221c0000                   jl         0x7fc00be7a424
00302 85ed                           test       ebp, ebp
00304 0f843effffff                   je         0x7fc00be78748
0030a 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00312 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
0031a 4b8d741308                     lea        rsi, [r11 + r10 + 8]
0031f 448b8424b8000000               mov        r8d, dword ptr [rsp + 0xb8]
00327 4b8d7c0308                     lea        rdi, [r11 + r8 + 8]
0032c 4863d5                         movsxd     rdx, ebp
0032f 4883fa20                       cmp        rdx, 0x20
00333 0f86ecfeffff                   jbe        0x7fc00be78725
00339 c5f877                         vzeroupper 
0033c 49ba204f8e0bc07f0000           movabs     r10, 0x7fc00b8e4f20
00346 41ffd2                         call       r10
00349 0f1f840000000000               nop        dword ptr [rax + rax]
00351 e9f2feffff                     jmp        0x7fc00be78748
00356 458bea                         mov        r13d, r10d
00359 448b8424b0000000               mov        r8d, dword ptr [rsp + 0xb0]
00361 4585c0                         test       r8d, r8d
00364 0f8ec2130000                   jle        0x7fc00be79c2c
0036a 458d1401                       lea        r10d, [r9 + rax]
0036e 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00373 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00378 4403d3                         add        r10d, ebx
0037b 443b542448                     cmp        r10d, dword ptr [rsp + 0x48]
00380 0f8fc6100000                   jg         0x7fc00be7994c
00386 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0038b 443b5c2458                     cmp        r11d, dword ptr [rsp + 0x58]
00390 0f8fc6140000                   jg         0x7fc00be79d5c
00396 83f810                         cmp        eax, 0x10
00399 0f8f96070000                   jg         0x7fc00be79035
0039f 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
003a7 0f8308110000                   jae        0x7fc00be799b5
003ad 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
003b2 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
003b9 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
003be 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
003c6 0f8380110000                   jae        0x7fc00be79a4c
003cc 468d1c08                       lea        r11d, [rax + r9]
003d0 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
003d5 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
003da 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
003e2 c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
003e9 468d1400                       lea        r10d, [rax + r8]
003ed 4489542464                     mov        dword ptr [rsp + 0x64], r10d
003f2 458bf2                         mov        r14d, r10d
003f5 442bb424b0000000               sub        r14d, dword ptr [rsp + 0xb0]
003fd 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
00401 83fb10                         cmp        ebx, 0x10
00404 7f53                           jg         0x7fc00be78959
00406 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
0040d 83fb10                         cmp        ebx, 0x10
00410 7c47                           jl         0x7fc00be78959
00412 443bb4249c000000               cmp        r14d, dword ptr [rsp + 0x9c]
0041a 0f83e4110000                   jae        0x7fc00be79b04
00420 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00428 c4817a6f443208                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 8]
0042f 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00433 3b9c249c000000                 cmp        ebx, dword ptr [rsp + 0x9c]
0043a 0f8350120000                   jae        0x7fc00be79b90
00440 c4c17a7f441a08                 vmovdqu    xmmword ptr [r10 + rbx + 8], xmm0
00447 448b6c245c                     mov        r13d, dword ptr [rsp + 0x5c]
0044c 4403eb                         add        r13d, ebx
0044f 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
00454 e957020000                     jmp        0x7fc00be78bb0
00459 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00461 4b8d7c3308                     lea        rdi, [r11 + r14 + 8]
00466 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
0046a 498d741b08                     lea        rsi, [r11 + rbx + 8]
0046f 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
00473 035c2464                       add        ebx, dword ptr [rsp + 0x64]
00477 4c63cb                         movsxd     r9, ebx
0047a 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00482 443b5c245c                     cmp        r11d, dword ptr [rsp + 0x5c]
00487 0f8c20040000                   jl         0x7fc00be78dad
0048d 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00492 4183fa30                       cmp        r10d, 0x30
00496 0f8e8c000000                   jle        0x7fc00be78a28
0049c 4585f6                         test       r14d, r14d
0049f 0f8c07180000                   jl         0x7fc00be7a1ac
004a5 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
004aa 4585db                         test       r11d, r11d
004ad 0f8cf9170000                   jl         0x7fc00be7a1ac
004b3 478d1c32                       lea        r11d, [r10 + r14]
004b7 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
004bc 453bd3                         cmp        r10d, r11d
004bf 0f82e7170000                   jb         0x7fc00be7a1ac
004c5 443bd3                         cmp        r10d, ebx
004c8 0f82de170000                   jb         0x7fc00be7a1ac
004ce 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
004d2 85db                           test       ebx, ebx
004d4 0f84ca010000                   je         0x7fc00be78ba4
004da 4863d3                         movsxd     rdx, ebx
004dd 4883fa20                       cmp        rdx, 0x20
004e1 7728                           ja         0x7fc00be78a0b
004e3 448bdb                         mov        r11d, ebx
004e6 4d63d3                         movsxd     r10, r11d
004e9 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
004f0 c442a8f5db                     bzhi       r11, r11, r10
004f5 c4c1fb92fb                     kmovq      k7, r11
004fa 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00500 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00506 e999010000                     jmp        0x7fc00be78ba4
0050b c5f877                         vzeroupper 
0050e 49ba204f8e0bc07f0000           movabs     r10, 0x7fc00b8e4f20
00518 41ffd2                         call       r10
0051b 0f1f840000000000               nop        dword ptr [rax + rax]
00523 e97c010000                     jmp        0x7fc00be78ba4
00528 443bb42498000000               cmp        r14d, dword ptr [rsp + 0x98]
00530 0f83aa130000                   jae        0x7fc00be79de0
00536 4963d6                         movsxd     rdx, r14d
00539 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00541 4d8b441208                     mov        r8, qword ptr [r10 + rdx + 8]
00546 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0054b 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00553 0f8343140000                   jae        0x7fc00be79e9c
00559 8b7c2464                       mov        edi, dword ptr [rsp + 0x64]
0055d 8d4f08                         lea        ecx, [rdi + 8]
00560 4c63d7                         movsxd     r10, edi
00563 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0056b 4f89441308                     mov        qword ptr [r11 + r10 + 8], r8
00570 3bcb                           cmp        ecx, ebx
00572 0f8d2c010000                   jge        0x7fc00be78ba4
00578 492bd2                         sub        rdx, r10
0057b 4c63d9                         movsxd     r11, ecx
0057e 4d8d1413                       lea        r10, [r11 + rdx]
00582 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
0058a 0f83d4150000                   jae        0x7fc00be7a064
00590 4d8bd1                         mov        r10, r9
00593 4d2bd3                         sub        r10, r11
00596 4983c207                       add        r10, 7
0059a 4983e2f8                       and        r10, 0xfffffffffffffff8
0059e 458bd2                         mov        r10d, r10d
005a1 458d5c3a08                     lea        r11d, [r10 + rdi + 8]
005a6 4d63d3                         movsxd     r10, r11d
005a9 4d8d5c12f8                     lea        r11, [r10 + rdx - 8]
005ae 4c3b9c24a8000000               cmp        r11, qword ptr [rsp + 0xa8]
005b6 0f83a8150000                   jae        0x7fc00be7a064
005bc 3b8c2498000000                 cmp        ecx, dword ptr [rsp + 0x98]
005c3 0f839b150000                   jae        0x7fc00be7a064
005c9 4983c2f8                       add        r10, -8
005cd 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
005d5 0f8389150000                   jae        0x7fc00be7a064
005db 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
005e1 0f8f21160000                   jg         0x7fc00be7a108
005e7 442bf7                         sub        r14d, edi
005ea 83c710                         add        edi, 0x10
005ed 458d140e                       lea        r10d, [r14 + rcx]
005f1 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
005f9 4f8b5c1008                     mov        r11, qword ptr [r8 + r10 + 8]
005fe 448bd1                         mov        r10d, ecx
00601 4f895c1008                     mov        qword ptr [r8 + r10 + 8], r11
00606 83c108                         add        ecx, 8
00609 3bcf                           cmp        ecx, edi
0060b 7ce0                           jl         0x7fc00be78aed
0060d 4983c1f8                       add        r9, -8
00611 4981f900000080                 cmp        r9, -0x80000000
00618 49c7c200000080                 mov        r10, 0xffffffff80000000
0061f 4d0f4cca                       cmovl      r9, r10
00623 458bd1                         mov        r10d, r9d
00626 413bca                         cmp        ecx, r10d
00629 7d4c                           jge        0x7fc00be78b77
0062b 0f1f440000                     nop        dword ptr [rax + rax]
00630 458d1c0e                       lea        r11d, [r14 + rcx]
00634 448bc9                         mov        r9d, ecx
00637 4963f9                         movsxd     rdi, r9d
0063a 458bc3                         mov        r8d, r11d
0063d 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
00645 4f8b4c0108                     mov        r9, qword ptr [r9 + r8 + 8]
0064a 4963d3                         movsxd     rdx, r11d
0064d 448bd9                         mov        r11d, ecx
00650 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00658 4f894c1808                     mov        qword ptr [r8 + r11 + 8], r9
0065d 4d8b441010                     mov        r8, qword ptr [r8 + rdx + 0x10]
00662 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0066a 4d89443b10                     mov        qword ptr [r11 + rdi + 0x10], r8
0066f 83c110                         add        ecx, 0x10
00672 413bca                         cmp        ecx, r10d
00675 7cb9                           jl         0x7fc00be78b30
00677 3bcb                           cmp        ecx, ebx
00679 7d29                           jge        0x7fc00be78ba4
0067b 90                             nop        
0067c 458d140e                       lea        r10d, [r14 + rcx]
00680 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00688 4f8b441308                     mov        r8, qword ptr [r11 + r10 + 8]
0068d 448bd9                         mov        r11d, ecx
00690 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00698 4f89441a08                     mov        qword ptr [r10 + r11 + 8], r8
0069d 83c108                         add        ecx, 8
006a0 3bcb                           cmp        ecx, ebx
006a2 7cd8                           jl         0x7fc00be78b7c
006a4 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
006a8 035c245c                       add        ebx, dword ptr [rsp + 0x5c]
006ac 895c2464                       mov        dword ptr [rsp + 0x64], ebx
006b0 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
006b8 41ffc0                         inc        r8d
006bb 443b442418                     cmp        r8d, dword ptr [rsp + 0x18]
006c0 0f8dcb050000                   jge        0x7fc00be79191
006c6 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
006cb 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
006d0 4f8b54c208                     mov        r10, qword ptr [r10 + r8*8 + 8]
006d5 4d8bda                         mov        r11, r10
006d8 49c1eb12                       shr        r11, 0x12
006dc 418bdb                         mov        ebx, r11d
006df 81e3ffff0300                   and        ebx, 0x3ffff
006e5 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
006e9 4d8bda                         mov        r11, r10
006ec 49c1fb24                       sar        r11, 0x24
006f0 458bd2                         mov        r10d, r10d
006f3 458bdb                         mov        r11d, r11d
006f6 418bcb                         mov        ecx, r11d
006f9 4181e2ffff0100                 and        r10d, 0x1ffff
00700 418bc2                         mov        eax, r10d
00703 4585db                         test       r11d, r11d
00706 0f8c40100000                   jl         0x7fc00be79c4c
0070c 448bd0                         mov        r10d, eax
0070f 4585d2                         test       r10d, r10d
00712 0f85b6000000                   jne        0x7fc00be78cce
00718 4533d2                         xor        r10d, r10d
0071b 418bc2                         mov        eax, r10d
0071e 83f903                         cmp        ecx, 3
00721 0f8ed9000000                   jle        0x7fc00be78d00
00727 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0072c 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
00730 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00735 45895310                       mov        dword ptr [r11 + 0x10], r10d
00739 458b5b08                       mov        r11d, dword ptr [r11 + 8]
0073d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00742 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
00746 448d51fd                       lea        r10d, [rcx - 3]
0074a 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
00752 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00757 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
0075e 41895a08                       mov        dword ptr [r10 + 8], ebx
00762 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
0076a 48639c24b0000000               movsxd     rbx, dword ptr [rsp + 0xb0]
00772 488beb                         mov        rbp, rbx
00775 4c635c2464                     movsxd     r11, dword ptr [rsp + 0x64]
0077a 4c035c2428                     add        r11, qword ptr [rsp + 0x28]
0077f 4863d0                         movsxd     rdx, eax
00782 4c03da                         add        r11, rdx
00785 493bdb                         cmp        rbx, r11
00788 0f8f4e100000                   jg         0x7fc00be79cdc
0078e 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00792 03d8                           add        ebx, eax
00794 448bf3                         mov        r14d, ebx
00797 442bb424b0000000               sub        r14d, dword ptr [rsp + 0xb0]
0079f 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
007a4 4585d2                         test       r10d, r10d
007a7 0f85a9fbffff                   jne        0x7fc00be78856
007ad 4d63c6                         movsxd     r8, r14d
007b0 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
007b5 0f8c95120000                   jl         0x7fc00be79f50
007bb 483b6c2440                     cmp        rbp, qword ptr [rsp + 0x40]
007c0 0f8f12130000                   jg         0x7fc00be79fd8
007c6 4533ed                         xor        r13d, r13d
007c9 e98bfbffff                     jmp        0x7fc00be78859
007ce 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
007d3 452bd9                         sub        r11d, r9d
007d6 453bd3                         cmp        r10d, r11d
007d9 0f8e3fffffff                   jle        0x7fc00be78c1e
007df be45ffffff                     mov        esi, 0xffffff45
007e4 418bea                         mov        ebp, r10d
007e7 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
007ef 90                             nop        
007f0 c5f877                         vzeroupper 
007f3 e868a9b4ff                     call       0x7fc00b9c3660
007f8 0f1f8400f0080001               nop        dword ptr [rax + rax + 0x10008f0]
00800 85c0                           test       eax, eax
00802 7407                           je         0x7fc00be78d0b
00804 448d51ff                       lea        r10d, [rcx - 1]
00808 418bca                         mov        ecx, r10d
0080b 85c9                           test       ecx, ecx
0080d 7516                           jne        0x7fc00be78d25
0080f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00814 418b5a08                       mov        ebx, dword ptr [r10 + 8]
00818 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
00820 e97c000000                     jmp        0x7fc00be78da1
00825 83f903                         cmp        ecx, 3
00828 0f843e1c0000                   je         0x7fc00be7a96c
0082e 83f902                         cmp        ecx, 2
00831 0f87c91c0000                   ja         0x7fc00be7aa00
00837 3b8c24fc000000                 cmp        ecx, dword ptr [rsp + 0xfc]
0083e 0f832e160000                   jae        0x7fc00be7a372
00844 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00849 418b5c8b08                     mov        ebx, dword ptr [r11 + rcx*4 + 8]
0084e 85c9                           test       ecx, ecx
00850 7e3e                           jle        0x7fc00be78d90
00852 448d59ff                       lea        r11d, [rcx - 1]
00856 443b9c24fc000000               cmp        r11d, dword ptr [rsp + 0xfc]
0085e 0f83681b0000                   jae        0x7fc00be7a8cc
00864 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
0086c 0f1f4000                       nop        dword ptr [rax]
00870 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00875 458b548b04                     mov        r10d, dword ptr [r11 + rcx*4 + 4]
0087a 4d8bc3                         mov        r8, r11
0087d 4589548808                     mov        dword ptr [r8 + rcx*4 + 8], r10d
00882 448d51ff                       lea        r10d, [rcx - 1]
00886 418bca                         mov        ecx, r10d
00889 4585d2                         test       r10d, r10d
0088c 7fe2                           jg         0x7fc00be78d70
0088e eb08                           jmp        0x7fc00be78d98
00890 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
00898 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0089d 41895a08                       mov        dword ptr [r10 + 8], ebx
008a1 899c24b0000000                 mov        dword ptr [rsp + 0xb0], ebx
008a8 e9bdfeffff                     jmp        0x7fc00be78c6a
008ad 4183fb10                       cmp        r11d, 0x10
008b1 0f8df8080000                   jge        0x7fc00be796af
008b7 4183fb08                       cmp        r11d, 8
008bb 0f8d8a040000                   jge        0x7fc00be7924b
008c1 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
008c6 4183fb10                       cmp        r11d, 0x10
008ca 0f8fb6010000                   jg         0x7fc00be78f86
008d0 443b74241c                     cmp        r14d, dword ptr [rsp + 0x1c]
008d5 0f83d1160000                   jae        0x7fc00be7a4ac
008db 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
008e3 430fbe6c3208                   movsx      ebp, byte ptr [r10 + r14 + 8]
008e9 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
008ee 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
008f3 0f8367170000                   jae        0x7fc00be7a560
008f9 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
008fe 41ffc3                         inc        r11d
00901 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
00909 458d5e03                       lea        r11d, [r14 + 3]
0090d 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
00912 0f83cc170000                   jae        0x7fc00be7a5e4
00918 4d63c6                         movsxd     r8, r14d
0091b 430fbe6c0209                   movsx      ebp, byte ptr [r10 + r8 + 9]
00921 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00926 4183c203                       add        r10d, 3
0092a 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
0092f 0f833f180000                   jae        0x7fc00be7a674
00935 4c634c2464                     movsxd     r9, dword ptr [rsp + 0x64]
0093a 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00942 43886c0a09                     mov        byte ptr [r10 + r9 + 9], bpl
00947 470fbe5c020a                   movsx      r11d, byte ptr [r10 + r8 + 0xa]
0094d 47885c0a0a                     mov        byte ptr [r10 + r9 + 0xa], r11b
00952 470fbe5c020b                   movsx      r11d, byte ptr [r10 + r8 + 0xb]
00958 47885c0a0b                     mov        byte ptr [r10 + r9 + 0xb], r11b
0095d 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00965 4183fa08                       cmp        r10d, 8
00969 0f8389180000                   jae        0x7fc00be7a6f8
0096f 49baf83727e300000000           movabs     r10, 0xe32737f8
00979 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00981 4703749a08                     add        r14d, dword ptr [r10 + r11*4 + 8]
00986 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0098b 4183fa04                       cmp        r10d, 4
0098f 7e6a                           jle        0x7fc00be78efb
00991 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00996 4183c304                       add        r11d, 4
0099a 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
009a2 443bb42488000000               cmp        r14d, dword ptr [rsp + 0x88]
009aa 0f83dc180000                   jae        0x7fc00be7a78c
009b0 458bd6                         mov        r10d, r14d
009b3 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
009bb 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
009c3 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
009cb 438b6c1a08                     mov        ebp, dword ptr [r10 + r11 + 8]
009d0 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
009d8 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
009e0 0f834e190000                   jae        0x7fc00be7a834
009e6 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
009eb 4d63da                         movsxd     r11, r10d
009ee 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
009f6 43896c1a0c                     mov        dword ptr [r10 + r11 + 0xc], ebp
009fb 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00a00 4183fb08                       cmp        r11d, 8
00a04 7e77                           jle        0x7fc00be78f7d
00a06 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00a0b 4183c208                       add        r10d, 8
00a0f 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00a17 49ba203827e300000000           movabs     r10, 0xe3273820
00a21 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00a29 478b549a08                     mov        r10d, dword ptr [r10 + r11*4 + 8]
00a2e 452bf2                         sub        r14d, r10d
00a31 418d6e08                       lea        ebp, [r14 + 8]
00a35 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
00a3c 0f83521b0000                   jae        0x7fc00be7aa94
00a42 4d63d6                         movsxd     r10, r14d
00a45 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00a4d 4b8b6c1310                     mov        rbp, qword ptr [r11 + r10 + 0x10]
00a52 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00a5a 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00a62 0f83ac1b0000                   jae        0x7fc00be7ab14
00a68 448b6c2464                     mov        r13d, dword ptr [rsp + 0x64]
00a6d 4d63dd                         movsxd     r11, r13d
00a70 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00a78 4b896c1a10                     mov        qword ptr [r10 + r11 + 0x10], rbp
00a7d 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00a81 e92afcffff                     jmp        0x7fc00be78bb0
00a86 4585f6                         test       r14d, r14d
00a89 0f8cf91b0000                   jl         0x7fc00be7ab88
00a8f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00a94 4585d2                         test       r10d, r10d
00a97 0f8ceb1b0000                   jl         0x7fc00be7ab88
00a9d 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
00aa2 443b5c2464                     cmp        r11d, dword ptr [rsp + 0x64]
00aa7 0f82db1b0000                   jb         0x7fc00be7ab88
00aad 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00ab5 44035c2464                     add        r11d, dword ptr [rsp + 0x64]
00aba 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
00ac2 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
00ac7 453bd3                         cmp        r10d, r11d
00aca 0f82b81b0000                   jb         0x7fc00be7ab88
00ad0 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00ad8 4585d2                         test       r10d, r10d
00adb 0f8ca71b0000                   jl         0x7fc00be7ab88
00ae1 4585d2                         test       r10d, r10d
00ae4 0f8493f7ffff                   je         0x7fc00be7877d
00aea 4883fd20                       cmp        rbp, 0x20
00aee 7725                           ja         0x7fc00be79015
00af0 4d63d2                         movsxd     r10, r10d
00af3 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00afa c442a8f5db                     bzhi       r11, r11, r10
00aff c4c1fb92fb                     kmovq      k7, r11
00b04 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b0a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b10 e968f7ffff                     jmp        0x7fc00be7877d
00b15 488bd5                         mov        rdx, rbp
00b18 c5f877                         vzeroupper 
00b1b 49ba204f8e0bc07f0000           movabs     r10, 0x7fc00b8e4f20
00b25 41ffd2                         call       r10
00b28 0f1f840000000000               nop        dword ptr [rax + rax]
00b30 e948f7ffff                     jmp        0x7fc00be7877d
00b35 83f830                         cmp        eax, 0x30
00b38 0f8fee050000                   jg         0x7fc00be7962c
00b3e 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
00b46 0f83f01b0000                   jae        0x7fc00be7ac3c
00b4c 4d63c1                         movsxd     r8, r9d
00b4f 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00b54 c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
00b5b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b60 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
00b68 0f837e1c0000                   jae        0x7fc00be7acec
00b6e 418bfa                         mov        edi, r10d
00b71 4183c210                       add        r10d, 0x10
00b75 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00b7a 4863cf                         movsxd     rcx, edi
00b7d 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00b85 c4c17a7f440b08                 vmovdqu    xmmword ptr [r11 + rcx + 8], xmm0
00b8c 443bd3                         cmp        r10d, ebx
00b8f 0f8dc5000000                   jge        0x7fc00be7915a
00b95 4c2bc1                         sub        r8, rcx
00b98 4d63da                         movsxd     r11, r10d
00b9b 4f8d1403                       lea        r10, [r11 + r8]
00b9f 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
00ba7 0f83031d0000                   jae        0x7fc00be7adb0
00bad 4c63d3                         movsxd     r10, ebx
00bb0 4d2bd3                         sub        r10, r11
00bb3 4983c20f                       add        r10, 0xf
00bb7 4983e2f0                       and        r10, 0xfffffffffffffff0
00bbb 458bda                         mov        r11d, r10d
00bbe 448bd7                         mov        r10d, edi
00bc1 478d541310                     lea        r10d, [r11 + r10 + 0x10]
00bc6 4d63d2                         movsxd     r10, r10d
00bc9 4f8d5c02f0                     lea        r11, [r10 + r8 - 0x10]
00bce 4c3b9c2490000000               cmp        r11, qword ptr [rsp + 0x90]
00bd6 0f83d41c0000                   jae        0x7fc00be7adb0
00bdc 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00be1 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
00be9 0f83c11c0000                   jae        0x7fc00be7adb0
00bef 4983c2f0                       add        r10, -0x10
00bf3 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
00bfb 0f83af1c0000                   jae        0x7fc00be7adb0
00c01 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00c07 0f8f271d0000                   jg         0x7fc00be7ae34
00c0d 458bd1                         mov        r10d, r9d
00c10 442bd7                         sub        r10d, edi
00c13 0f1f8000000000                 nop        dword ptr [rax]
00c1a 660f1f440000                   nop        word ptr [rax + rax]
00c20 458bda                         mov        r11d, r10d
00c23 44035c2460                     add        r11d, dword ptr [rsp + 0x60]
00c28 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
00c2d c4817a6f441808                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 8]
00c34 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00c39 8b8c2484000000                 mov        ecx, dword ptr [rsp + 0x84]
00c40 c4a17a7f440108                 vmovdqu    xmmword ptr [rcx + r8 + 8], xmm0
00c47 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00c4c 4183c010                       add        r8d, 0x10
00c50 4489442460                     mov        dword ptr [rsp + 0x60], r8d
00c55 443bc3                         cmp        r8d, ebx
00c58 7cc6                           jl         0x7fc00be79120
00c5a 468d1408                       lea        r10d, [rax + r9]
00c5e 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00c63 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00c67 e991f7ffff                     jmp        0x7fc00be788fd
00c6c 4d63d2                         movsxd     r10, r10d
00c6f 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c76 c442a8f5db                     bzhi       r11, r11, r10
00c7b c4c1fb92fb                     kmovq      k7, r11
00c80 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c86 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c8c e9a0000000                     jmp        0x7fc00be79231
00c91 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00c96 442b542460                     sub        r10d, dword ptr [rsp + 0x60]
00c9b 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00ca3 4585db                         test       r11d, r11d
00ca6 0f84d41d0000                   je         0x7fc00be7af80
00cac 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00cb1 4585c0                         test       r8d, r8d
00cb4 0f8c461e0000                   jl         0x7fc00be7b000
00cba 4c8b742478                     mov        r14, qword ptr [rsp + 0x78]
00cbf 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
00cc4 8bb424f8000000                 mov        esi, dword ptr [rsp + 0xf8]
00ccb 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00ccf 85db                           test       ebx, ebx
00cd1 0f8cdd1d0000                   jl         0x7fc00be7afb4
00cd7 3b74240c                       cmp        esi, dword ptr [rsp + 0xc]
00cdb 0f82d91d0000                   jb         0x7fc00be7afba
00ce1 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
00ce5 4103ea                         add        ebp, r10d
00ce8 418b4b04                       mov        ecx, dword ptr [r11 + 4]
00cec 3bcd                           cmp        ecx, ebp
00cee 0f82cc1d0000                   jb         0x7fc00be7afc0
00cf4 4585d2                         test       r10d, r10d
00cf7 0f8cc91d0000                   jl         0x7fc00be7afc6
00cfd 4585d2                         test       r10d, r10d
00d00 742f                           je         0x7fc00be79231
00d02 498d741b08                     lea        rsi, [r11 + rbx + 8]
00d07 4b8d7c0508                     lea        rdi, [r13 + r8 + 8]
00d0c 4963d2                         movsxd     rdx, r10d
00d0f 4883fa20                       cmp        rdx, 0x20
00d13 0f8653ffffff                   jbe        0x7fc00be7916c
00d19 c5f877                         vzeroupper 
00d1c 49ba204f8e0bc07f0000           movabs     r10, 0x7fc00b8e4f20
00d26 41ffd2                         call       r10
00d29 0f1f840000000000               nop        dword ptr [rax + rax]
00d31 41896e38                       mov        dword ptr [r14 + 0x38], ebp
00d35 c5f877                         vzeroupper 
00d38 4881c4e0000000                 add        rsp, 0xe0
00d3f 5d                             pop        rbp
00d40 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00d44 0f8701230000                   ja         0x7fc00be7b54b
00d4a c3                             ret        
00d4b 443bb42498000000               cmp        r14d, dword ptr [rsp + 0x98]
00d53 0f83b71d0000                   jae        0x7fc00be7b010
00d59 418bee                         mov        ebp, r14d
00d5c 896c245c                       mov        dword ptr [rsp + 0x5c], ebp
00d60 4c63c5                         movsxd     r8, ebp
00d63 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00d6b 4b8b6c0308                     mov        rbp, qword ptr [r11 + r8 + 8]
00d70 4889ac24b0000000               mov        qword ptr [rsp + 0xb0], rbp
00d78 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00d7d 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00d85 0f83291e0000                   jae        0x7fc00be7b0b4
00d8b 8b742464                       mov        esi, dword ptr [rsp + 0x64]
00d8f 8d6e08                         lea        ebp, [rsi + 8]
00d92 896c244c                       mov        dword ptr [rsp + 0x4c], ebp
00d96 4c63de                         movsxd     r11, esi
00d99 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00da1 488bac24b0000000               mov        rbp, qword ptr [rsp + 0xb0]
00da9 4b896c1a08                     mov        qword ptr [r10 + r11 + 8], rbp
00dae 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
00db2 3beb                           cmp        ebp, ebx
00db4 0f8d44030000                   jge        0x7fc00be795fe
00dba 4d2bc3                         sub        r8, r11
00dbd 4863cd                         movsxd     rcx, ebp
00dc0 4e8d1401                       lea        r10, [rcx + r8]
00dc4 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00dcc 0f836e1e0000                   jae        0x7fc00be7b140
00dd2 4d8bd1                         mov        r10, r9
00dd5 4c2bd1                         sub        r10, rcx
00dd8 4983c207                       add        r10, 7
00ddc 4983e2f8                       and        r10, 0xfffffffffffffff8
00de0 458bd2                         mov        r10d, r10d
00de3 458d5c3208                     lea        r11d, [r10 + rsi + 8]
00de8 4d63d3                         movsxd     r10, r11d
00deb 4f8d5c02f8                     lea        r11, [r10 + r8 - 8]
00df0 4c3b9c24a8000000               cmp        r11, qword ptr [rsp + 0xa8]
00df8 0f83421e0000                   jae        0x7fc00be7b140
00dfe 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
00e05 0f83351e0000                   jae        0x7fc00be7b140
00e0b 4983c2f8                       add        r10, -8
00e0f 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00e17 0f83231e0000                   jae        0x7fc00be7b140
00e1d 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
00e23 0f8fa31e0000                   jg         0x7fc00be7b1cc
00e29 8b6c245c                       mov        ebp, dword ptr [rsp + 0x5c]
00e2d 2bee                           sub        ebp, esi
00e2f 448bed                         mov        r13d, ebp
00e32 41baf8ffffff                   mov        r10d, 0xfffffff8
00e38 4d8d59c8                       lea        r11, [r9 - 0x38]
00e3c 4981fb00000080                 cmp        r11, -0x80000000
00e43 49c7c000000080                 mov        r8, 0xffffffff80000000
00e4a 4d0f4cd8                       cmovl      r11, r8
00e4e 418bfb                         mov        edi, r11d
00e51 442b742464                     sub        r14d, dword ptr [rsp + 0x64]
00e56 8d5610                         lea        edx, [rsi + 0x10]
00e59 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00e5e 4863c2                         movsxd     rax, edx
00e61 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00e69 458bc0                         mov        r8d, r8d
00e6c 452bd0                         sub        r10d, r8d
00e6f 442bd6                         sub        r10d, esi
00e72 4183c2f0                       add        r10d, -0x10
00e76 41b806000000                   mov        r8d, 6
00e7c c442b8f5d2                     bzhi       r10, r10, r8
00e81 4903c2                         add        rax, r10
00e84 493bc1                         cmp        rax, r9
00e87 4d8bc1                         mov        r8, r9
00e8a 4c0f4cc0                       cmovl      r8, rax
00e8e 4d8bd0                         mov        r10, r8
00e91 4c2bd1                         sub        r10, rcx
00e94 498d72ff                       lea        rsi, [r10 - 1]
00e98 48c1fe3f                       sar        rsi, 0x3f
00e9c 48c1ee3d                       shr        rsi, 0x3d
00ea0 4e8d5416ff                     lea        r10, [rsi + r10 - 1]
00ea5 4983e2f8                       and        r10, 0xfffffffffffffff8
00ea9 4c03d1                         add        r10, rcx
00eac 493bca                         cmp        rcx, r10
00eaf 490f4cca                       cmovl      rcx, r10
00eb3 448bd1                         mov        r10d, ecx
00eb6 438d741608                     lea        esi, [r14 + r10 + 8]
00ebb 4183c208                       add        r10d, 8
00ebf 4863ce                         movsxd     rcx, esi
00ec2 4903cb                         add        rcx, r11
00ec5 4963f2                         movsxd     rsi, r10d
00ec8 4903f3                         add        rsi, r11
00ecb 4c8d5908                       lea        r11, [rcx + 8]
00ecf 4883c148                       add        rcx, 0x48
00ed3 488d4648                       lea        rax, [rsi + 0x48]
00ed7 4533d2                         xor        r10d, r10d
00eda 493bc3                         cmp        rax, r11
00edd 410f96c2                       setbe      r10b
00ee1 4883c608                       add        rsi, 8
00ee5 4533db                         xor        r11d, r11d
00ee8 483bce                         cmp        rcx, rsi
00eeb 410f96c3                       setbe      r11b
00eef 450bd3                         or         r10d, r11d
00ef2 0f84480e0000                   je         0x7fc00be7a240
00ef8 458bd0                         mov        r10d, r8d
00efb 90                             nop        
00efc 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00f01 458bdd                         mov        r11d, r13d
00f04 44035c244c                     add        r11d, dword ptr [rsp + 0x4c]
00f09 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
00f10 4e8b5c1a08                     mov        r11, qword ptr [rdx + r11 + 8]
00f15 4e895c0208                     mov        qword ptr [rdx + r8 + 8], r11
00f1a 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
00f1e 83c508                         add        ebp, 8
00f21 896c244c                       mov        dword ptr [rsp + 0x4c], ebp
00f25 413bea                         cmp        ebp, r10d
00f28 7cd2                           jl         0x7fc00be793fc
00f2a 4981c108feffff                 add        r9, -0x1f8
00f31 4981f900000080                 cmp        r9, -0x80000000
00f38 49c7c200000080                 mov        r10, 0xffffffff80000000
00f3f 4d0f4cca                       cmovl      r9, r10
00f43 458bd1                         mov        r10d, r9d
00f46 413bea                         cmp        ebp, r10d
00f49 0f8d7b010000                   jge        0x7fc00be795ca
00f4f 896c244c                       mov        dword ptr [rsp + 0x4c], ebp
00f53 0f1f8000000000                 nop        dword ptr [rax]
00f5a 660f1f440000                   nop        word ptr [rax + rax]
00f60 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00f65 4963c8                         movsxd     rcx, r8d
00f68 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00f6d 458bc5                         mov        r8d, r13d
00f70 440344244c                     add        r8d, dword ptr [rsp + 0x4c]
00f75 8b74244c                       mov        esi, dword ptr [rsp + 0x4c]
00f79 83c640                         add        esi, 0x40
00f7c 4103f5                         add        esi, r13d
00f7f 458bc8                         mov        r9d, r8d
00f82 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
00f89 62b17e486f840a08000000         vmovdqu32  zmm0, zmmword ptr [rdx + r9 + 8]
00f94 62b17e487f841a08000000         vmovdqu32  zmmword ptr [rdx + r11 + 8], zmm0
00f9f 62f17e486f843208000000         vmovdqu32  zmm0, zmmword ptr [rdx + rsi + 8]
00faa 62f17e487f840a48000000         vmovdqu32  zmmword ptr [rdx + rcx + 0x48], zmm0
00fb5 4963d0                         movsxd     rdx, r8d
00fb8 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00fbd 4181c080000000                 add        r8d, 0x80
00fc4 4503c5                         add        r8d, r13d
00fc7 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00fcf 62917e486f840308000000         vmovdqu32  zmm0, zmmword ptr [r11 + r8 + 8]
00fda 62d17e487f840b88000000         vmovdqu32  zmmword ptr [r11 + rcx + 0x88], zmm0
00fe5 62d17e486f8413c8000000         vmovdqu32  zmm0, zmmword ptr [r11 + rdx + 0xc8]
00ff0 62d17e487f840bc8000000         vmovdqu32  zmmword ptr [r11 + rcx + 0xc8], zmm0
00ffb 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01000 4181c300010000                 add        r11d, 0x100
01007 4503dd                         add        r11d, r13d
0100a 458bcb                         mov        r9d, r11d
0100d 8bb42484000000                 mov        esi, dword ptr [rsp + 0x84]
01014 62b17e486f841e08000000         vmovdqu32  zmm0, zmmword ptr [rsi + r11 + 8]
0101f 62f17e487f840e08010000         vmovdqu32  zmmword ptr [rsi + rcx + 0x108], zmm0
0102a 62f17e486f841648010000         vmovdqu32  zmm0, zmmword ptr [rsi + rdx + 0x148]
01035 62f17e487f840e48010000         vmovdqu32  zmmword ptr [rsi + rcx + 0x148], zmm0
01040 62f17e486f841688010000         vmovdqu32  zmm0, zmmword ptr [rsi + rdx + 0x188]
0104b 62f17e487f840e88010000         vmovdqu32  zmmword ptr [rsi + rcx + 0x188], zmm0
01056 4d63d9                         movsxd     r11, r9d
01059 62b17e486f841ec8000000         vmovdqu32  zmm0, zmmword ptr [rsi + r11 + 0xc8]
01064 62f17e487f840ec8010000         vmovdqu32  zmmword ptr [rsi + rcx + 0x1c8], zmm0
0106f 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
01073 81c500020000                   add        ebp, 0x200
01079 896c244c                       mov        dword ptr [rsp + 0x4c], ebp
0107d 413bea                         cmp        ebp, r10d
01080 0f8cdafeffff                   jl         0x7fc00be79460
01086 3bef                           cmp        ebp, edi
01088 7d40                           jge        0x7fc00be795ca
0108a 896c244c                       mov        dword ptr [rsp + 0x4c], ebp
0108e 6690                           nop        
01090 458bd5                         mov        r10d, r13d
01093 440354244c                     add        r10d, dword ptr [rsp + 0x4c]
01098 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
010a0 62917e486f841008000000         vmovdqu32  zmm0, zmmword ptr [r8 + r10 + 8]
010ab 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
010b0 62917e487f841808000000         vmovdqu32  zmmword ptr [r8 + r11 + 8], zmm0
010bb 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
010bf 83c540                         add        ebp, 0x40
010c2 896c244c                       mov        dword ptr [rsp + 0x4c], ebp
010c6 3bef                           cmp        ebp, edi
010c8 7cc6                           jl         0x7fc00be79590
010ca 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
010ce 3beb                           cmp        ebp, ebx
010d0 7d2c                           jge        0x7fc00be795fe
010d2 6690                           nop        
010d4 458bd5                         mov        r10d, r13d
010d7 4403d5                         add        r10d, ebp
010da 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
010e2 4f8b441008                     mov        r8, qword ptr [r8 + r10 + 8]
010e7 448bdd                         mov        r11d, ebp
010ea 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
010f2 4f89441a08                     mov        qword ptr [r10 + r11 + 8], r8
010f7 83c508                         add        ebp, 8
010fa 3beb                           cmp        ebp, ebx
010fc 7cd6                           jl         0x7fc00be795d4
010fe 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01102 e9a9f5ffff                     jmp        0x7fc00be78bb0
01107 448bd0                         mov        r10d, eax
0110a 4d63d2                         movsxd     r10, r10d
0110d 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01114 c442a8f5db                     bzhi       r11, r11, r10
01119 c4c1fb92fb                     kmovq      k7, r11
0111e 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01124 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0112a eb7a                           jmp        0x7fc00be796a6
0112c 4585c9                         test       r9d, r9d
0112f 0f8c231c0000                   jl         0x7fc00be7b258
01135 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0113a 4585db                         test       r11d, r11d
0113d 0f8c151c0000                   jl         0x7fc00be7b258
01143 448b9424f8000000               mov        r10d, dword ptr [rsp + 0xf8]
0114b 443b542460                     cmp        r10d, dword ptr [rsp + 0x60]
01150 0f82021c0000                   jb         0x7fc00be7b258
01156 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
0115b 443bdb                         cmp        r11d, ebx
0115e 0f82f41b0000                   jb         0x7fc00be7b258
01164 85c0                           test       eax, eax
01166 743e                           je         0x7fc00be796a6
01168 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0116d 4b8d7c0a08                     lea        rdi, [r10 + r9 + 8]
01172 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0117a 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0117f 4b8d741308                     lea        rsi, [r11 + r10 + 8]
01184 4883fa20                       cmp        rdx, 0x20
01188 0f8679ffffff                   jbe        0x7fc00be79607
0118e c5f877                         vzeroupper 
01191 49ba204f8e0bc07f0000           movabs     r10, 0x7fc00b8e4f20
0119b 41ffd2                         call       r10
0119e 0f1f840000000000               nop        dword ptr [rax + rax]
011a6 895c2464                       mov        dword ptr [rsp + 0x64], ebx
011aa e94ef2ffff                     jmp        0x7fc00be788fd
011af 443bb4249c000000               cmp        r14d, dword ptr [rsp + 0x9c]
011b7 0f833f1c0000                   jae        0x7fc00be7b2fc
011bd 4d63c6                         movsxd     r8, r14d
011c0 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
011c8 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
011cf 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
011d4 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
011dc 0f83b21c0000                   jae        0x7fc00be7b394
011e2 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
011e7 418bfb                         mov        edi, r11d
011ea 418d6b10                       lea        ebp, [r11 + 0x10]
011ee 4d63d3                         movsxd     r10, r11d
011f1 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
011f9 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
01200 3beb                           cmp        ebp, ebx
01202 0f8d1c020000                   jge        0x7fc00be79924
01208 4d2bc2                         sub        r8, r10
0120b 4c63dd                         movsxd     r11, ebp
0120e 4f8d1403                       lea        r10, [r11 + r8]
01212 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
0121a 0f83181d0000                   jae        0x7fc00be7b438
01220 4d8bd1                         mov        r10, r9
01223 4d2bd3                         sub        r10, r11
01226 4983c20f                       add        r10, 0xf
0122a 4983e2f0                       and        r10, 0xfffffffffffffff0
0122e 458bd2                         mov        r10d, r10d
01231 448bdf                         mov        r11d, edi
01234 478d541a10                     lea        r10d, [r10 + r11 + 0x10]
01239 4d63d2                         movsxd     r10, r10d
0123c 4f8d5c02f0                     lea        r11, [r10 + r8 - 0x10]
01241 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
01249 0f83e91c0000                   jae        0x7fc00be7b438
0124f 3bac249c000000                 cmp        ebp, dword ptr [rsp + 0x9c]
01256 0f83dc1c0000                   jae        0x7fc00be7b438
0125c 4983c2f0                       add        r10, -0x10
01260 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
01268 0f83ca1c0000                   jae        0x7fc00be7b438
0126e 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
01274 0f8f2a1d0000                   jg         0x7fc00be7b4a4
0127a 442bf7                         sub        r14d, edi
0127d 8d4f20                         lea        ecx, [rdi + 0x20]
01280 458d142e                       lea        r10d, [r14 + rbp]
01284 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0128c c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
01293 448bd5                         mov        r10d, ebp
01296 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
0129d 83c510                         add        ebp, 0x10
012a0 3be9                           cmp        ebp, ecx
012a2 7cdc                           jl         0x7fc00be79780
012a4 4981c110ffffff                 add        r9, -0xf0
012ab 4981f900000080                 cmp        r9, -0x80000000
012b2 49c7c200000080                 mov        r10, 0xffffffff80000000
012b9 4d0f4cca                       cmovl      r9, r10
012bd 458bc1                         mov        r8d, r9d
012c0 413be8                         cmp        ebp, r8d
012c3 0f8d31010000                   jge        0x7fc00be798fa
012c9 0f1f8000000000                 nop        dword ptr [rax]
012d0 458d1c2e                       lea        r11d, [r14 + rbp]
012d4 448bcd                         mov        r9d, ebp
012d7 4d63c9                         movsxd     r9, r9d
012da 458bd3                         mov        r10d, r11d
012dd 8bbc2484000000                 mov        edi, dword ptr [rsp + 0x84]
012e4 c4a17a6f441708                 vmovdqu    xmm0, xmmword ptr [rdi + r10 + 8]
012eb 4963cb                         movsxd     rcx, r11d
012ee 448bd5                         mov        r10d, ebp
012f1 c4a17a7f441708                 vmovdqu    xmmword ptr [rdi + r10 + 8], xmm0
012f8 c5fa6f440f18                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x18]
012fe c4a17a7f440f18                 vmovdqu    xmmword ptr [rdi + r9 + 0x18], xmm0
01305 c5fa6f440f28                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x28]
0130b c4a17a7f440f28                 vmovdqu    xmmword ptr [rdi + r9 + 0x28], xmm0
01312 c5fa6f440f38                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x38]
01318 c4a17a7f440f38                 vmovdqu    xmmword ptr [rdi + r9 + 0x38], xmm0
0131f c5fa6f440f48                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x48]
01325 c4a17a7f440f48                 vmovdqu    xmmword ptr [rdi + r9 + 0x48], xmm0
0132c c5fa6f440f58                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x58]
01332 c4a17a7f440f58                 vmovdqu    xmmword ptr [rdi + r9 + 0x58], xmm0
01339 c5fa6f440f68                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x68]
0133f c4a17a7f440f68                 vmovdqu    xmmword ptr [rdi + r9 + 0x68], xmm0
01346 c5fa6f440f78                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x78]
0134c c4a17a7f440f78                 vmovdqu    xmmword ptr [rdi + r9 + 0x78], xmm0
01353 c5fa6f840f88000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x88]
0135c c4a17a7f840f88000000           vmovdqu    xmmword ptr [rdi + r9 + 0x88], xmm0
01366 c5fa6f840f98000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x98]
0136f c4a17a7f840f98000000           vmovdqu    xmmword ptr [rdi + r9 + 0x98], xmm0
01379 c5fa6f840fa8000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xa8]
01382 c4a17a7f840fa8000000           vmovdqu    xmmword ptr [rdi + r9 + 0xa8], xmm0
0138c c5fa6f840fb8000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xb8]
01395 c4a17a7f840fb8000000           vmovdqu    xmmword ptr [rdi + r9 + 0xb8], xmm0
0139f c5fa6f840fc8000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xc8]
013a8 c4a17a7f840fc8000000           vmovdqu    xmmword ptr [rdi + r9 + 0xc8], xmm0
013b2 c5fa6f840fd8000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xd8]
013bb c4a17a7f840fd8000000           vmovdqu    xmmword ptr [rdi + r9 + 0xd8], xmm0
013c5 c5fa6f840fe8000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xe8]
013ce c4a17a7f840fe8000000           vmovdqu    xmmword ptr [rdi + r9 + 0xe8], xmm0
013d8 c5fa6f840ff8000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xf8]
013e1 c4a17a7f840ff8000000           vmovdqu    xmmword ptr [rdi + r9 + 0xf8], xmm0
013eb 81c500010000                   add        ebp, 0x100
013f1 413be8                         cmp        ebp, r8d
013f4 0f8cd6feffff                   jl         0x7fc00be797d0
013fa 3beb                           cmp        ebp, ebx
013fc 7d26                           jge        0x7fc00be79924
013fe 6690                           nop        
01400 458d142e                       lea        r10d, [r14 + rbp]
01404 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
0140c c4817a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 8]
01413 448bd5                         mov        r10d, ebp
01416 c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
0141d 83c510                         add        ebp, 0x10
01420 3beb                           cmp        ebp, ebx
01422 7cdc                           jl         0x7fc00be79900
01424 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01428 e983f2ffff                     jmp        0x7fc00be78bb0
0142d 4803d9                         add        rbx, rcx
01430 483b5c2440                     cmp        rbx, qword ptr [rsp + 0x40]
01435 7e08                           jle        0x7fc00be7993f
01437 4533c0                         xor        r8d, r8d
0143a e977ecffff                     jmp        0x7fc00be785b6
0143f 4533c0                         xor        r8d, r8d
01442 bf01000000                     mov        edi, 1
01447 e96cecffff                     jmp        0x7fc00be785b8
0144c 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01454 4d8bd3                         mov        r10, r11
01457 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
0145f 418be9                         mov        ebp, r9d
01462 4489ac24f0000000               mov        dword ptr [rsp + 0xf0], r13d
0146a 898424f4000000                 mov        dword ptr [rsp + 0xf4], eax
01471 498bf2                         mov        rsi, r10
01474 8b542464                       mov        edx, dword ptr [rsp + 0x64]
01478 8b8c2480000000                 mov        ecx, dword ptr [rsp + 0x80]
0147f 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
01484 8bf8                           mov        edi, eax
01486 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
0148e 44891424                       mov        dword ptr [rsp], r10d
01492 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01497 44895c2408                     mov        dword ptr [rsp + 8], r11d
0149c c5f877                         vzeroupper 
0149f e8bc1ea8ff                     call       0x7fc00b8fb860
014a4 0f1f84009c150002               nop        dword ptr [rax + rax + 0x200159c]
014ac 89442464                       mov        dword ptr [rsp + 0x64], eax
014b0 e9fbf1ffff                     jmp        0x7fc00be78bb0
014b5 bee4ffffff                     mov        esi, 0xffffffe4
014ba 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
014bf 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
014c4 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
014cc 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
014d1 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
014d9 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
014de 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
014e6 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
014eb 4c89542410                     mov        qword ptr [rsp + 0x10], r10
014f0 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
014f5 4c89542420                     mov        qword ptr [rsp + 0x20], r10
014fa 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
014ff 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01504 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01509 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0150e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01513 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01518 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0151d 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01522 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01527 89442448                       mov        dword ptr [rsp + 0x48], eax
0152b 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01530 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01535 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
0153a 6690                           nop        
0153c c5f877                         vzeroupper 
0153f e81c9cb4ff                     call       0x7fc00b9c3660
01544 0f1f84003c160003               nop        dword ptr [rax + rax + 0x300163c]
0154c bee4ffffff                     mov        esi, 0xffffffe4
01551 498bea                         mov        rbp, r10
01554 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01559 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01561 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01566 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0156e 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01573 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
0157b 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01580 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01585 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0158d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01592 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01597 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0159c 4c89542420                     mov        qword ptr [rsp + 0x20], r10
015a1 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
015a6 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
015ab 4c89542430                     mov        qword ptr [rsp + 0x30], r10
015b0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
015b5 4c89542438                     mov        qword ptr [rsp + 0x38], r10
015ba 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
015bf 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
015c4 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
015c9 4489542440                     mov        dword ptr [rsp + 0x40], r10d
015ce 89442448                       mov        dword ptr [rsp + 0x48], eax
015d2 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
015d7 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
015dc 48894424f8                     mov        qword ptr [rsp - 8], rax
015e1 8b442464                       mov        eax, dword ptr [rsp + 0x64]
015e5 89442458                       mov        dword ptr [rsp + 0x58], eax
015e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015ee c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
015f4 c5f877                         vzeroupper 
015f7 e8649bb4ff                     call       0x7fc00b9c3660
015fc 0f1f8400f4160004               nop        dword ptr [rax + rax + 0x40016f4]
01604 bee4ffffff                     mov        esi, 0xffffffe4
01609 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0160e 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01613 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
0161b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01620 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01628 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0162d 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01635 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0163a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0163f 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01647 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0164c 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01651 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01656 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
0165b 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01660 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01665 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0166a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0166f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01674 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01679 4489742450                     mov        dword ptr [rsp + 0x50], r14d
0167e 6690                           nop        
01680 c5f877                         vzeroupper 
01683 e8d89ab4ff                     call       0x7fc00b9c3660
01688 0f1f840080170005               nop        dword ptr [rax + rax + 0x5001780]
01690 bee4ffffff                     mov        esi, 0xffffffe4
01695 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0169a 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0169f 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
016a7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
016ac 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
016b4 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
016b9 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
016c1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
016c6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
016cb 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
016d3 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
016d8 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
016dd 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
016e2 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
016e7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
016ec 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
016f1 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
016f6 4c89542430                     mov        qword ptr [rsp + 0x30], r10
016fb 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01700 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01705 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0170a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0170f 895c2450                       mov        dword ptr [rsp + 0x50], ebx
01713 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
01719 666690                         nop        
0171c c5f877                         vzeroupper 
0171f e83c9ab4ff                     call       0x7fc00b9c3660
01724 0f1f84001c180006               nop        dword ptr [rax + rax + 0x600181c]
0172c be45ffffff                     mov        esi, 0xffffff45
01731 4c899c24f0000000               mov        qword ptr [rsp + 0xf0], r11
01739 666690                         nop        
0173c c5f877                         vzeroupper 
0173f e81c9ab4ff                     call       0x7fc00b9c3660
01744 0f1f84003c180007               nop        dword ptr [rax + rax + 0x700183c]
0174c be45ffffff                     mov        esi, 0xffffff45
01751 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01756 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0175b 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01763 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01768 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01770 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01775 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
0177d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01782 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01787 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
0178c 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01791 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01796 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0179b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
017a0 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
017a5 4c89542430                     mov        qword ptr [rsp + 0x30], r10
017aa 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
017af 4c89542438                     mov        qword ptr [rsp + 0x38], r10
017b4 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
017b9 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
017be 4489442444                     mov        dword ptr [rsp + 0x44], r8d
017c3 89442448                       mov        dword ptr [rsp + 0x48], eax
017c7 894c2450                       mov        dword ptr [rsp + 0x50], ecx
017cb 90                             nop        
017cc c5f877                         vzeroupper 
017cf e88c99b4ff                     call       0x7fc00b9c3660
017d4 0f1f8400cc180008               nop        dword ptr [rax + rax + 0x80018cc]
017dc 493bdb                         cmp        rbx, r11
017df bdffffffff                     mov        ebp, 0xffffffff
017e4 7c08                           jl         0x7fc00be79cee
017e6 400f95c5                       setne      bpl
017ea 400fb6ed                       movzx      ebp, bpl
017ee be45ffffff                     mov        esi, 0xffffff45
017f3 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
017f8 44898424f8000000               mov        dword ptr [rsp + 0xf8], r8d
01800 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01805 44898424fc000000               mov        dword ptr [rsp + 0xfc], r8d
0180d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01812 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01817 48894424f8                     mov        qword ptr [rsp - 8], rax
0181c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01820 89442420                       mov        dword ptr [rsp + 0x20], eax
01824 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01829 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0182e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01833 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01838 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
0183d 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01842 89442450                       mov        dword ptr [rsp + 0x50], eax
01846 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0184b 90                             nop        
0184c c5f877                         vzeroupper 
0184f e80c99b4ff                     call       0x7fc00b9c3660
01854 0f1f84004c190009               nop        dword ptr [rax + rax + 0x900194c]
0185c be45ffffff                     mov        esi, 0xffffff45
01861 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01866 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0186b 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01873 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01878 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01880 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01885 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
0188d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01892 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01897 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
0189c 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
018a1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
018a6 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
018ab 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
018b0 4c89542430                     mov        qword ptr [rsp + 0x30], r10
018b5 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
018ba 4c89542438                     mov        qword ptr [rsp + 0x38], r10
018bf 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
018c4 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
018c9 89442448                       mov        dword ptr [rsp + 0x48], eax
018cd 666690                         nop        
018d0 c5f877                         vzeroupper 
018d3 e88898b4ff                     call       0x7fc00b9c3660
018d8 0f1f8400d019000a               nop        dword ptr [rax + rax + 0xa0019d0]
018e0 bee4ffffff                     mov        esi, 0xffffffe4
018e5 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
018ea 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
018ef 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
018f7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
018fc 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01904 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01909 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01911 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01916 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0191b 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01923 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01928 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0192d 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01932 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01937 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0193c 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01941 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01946 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0194b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01950 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01955 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0195a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0195f 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01964 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01969 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0196e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01973 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01977 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0197c 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01981 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01986 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0198b 90                             nop        
0198c c5f877                         vzeroupper 
0198f e8cc97b4ff                     call       0x7fc00b9c3660
01994 0f1f84008c1a000b               nop        dword ptr [rax + rax + 0xb001a8c]
0199c bee4ffffff                     mov        esi, 0xffffffe4
019a1 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
019a6 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
019ab 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
019b3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
019b8 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
019c0 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
019c5 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
019cd 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
019d2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
019d7 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
019df 448954240c                     mov        dword ptr [rsp + 0xc], r10d
019e4 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
019e9 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
019ee 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
019f3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
019f8 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
019fd 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01a02 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01a07 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01a0c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01a11 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01a16 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01a1b 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01a20 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01a25 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01a2a 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01a2f 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01a33 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01a38 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01a3d 666690                         nop        
01a40 c5f877                         vzeroupper 
01a43 e81897b4ff                     call       0x7fc00b9c3660
01a48 0f1f8400401b000c               nop        dword ptr [rax + rax + 0xc001b40]
01a50 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01a55 4d3bc2                         cmp        r8, r10
01a58 bdffffffff                     mov        ebp, 0xffffffff
01a5d 7c08                           jl         0x7fc00be79f67
01a5f 400f95c5                       setne      bpl
01a63 400fb6ed                       movzx      ebp, bpl
01a67 be45ffffff                     mov        esi, 0xffffff45
01a6c 8b4c240c                       mov        ecx, dword ptr [rsp + 0xc]
01a70 898c24f8000000                 mov        dword ptr [rsp + 0xf8], ecx
01a77 8b4c2418                       mov        ecx, dword ptr [rsp + 0x18]
01a7b 898c24fc000000                 mov        dword ptr [rsp + 0xfc], ecx
01a82 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01a87 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01a8c 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01a91 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01a96 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01a9b 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01aa0 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01aa5 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01aaa 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
01aaf 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01ab4 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01ab8 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
01abd 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01ac2 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01ac7 90                             nop        
01ac8 c5f877                         vzeroupper 
01acb e89096b4ff                     call       0x7fc00b9c3660
01ad0 0f1f8400c81b000d               nop        dword ptr [rax + rax + 0xd001bc8]
01ad8 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01add 493bea                         cmp        rbp, r10
01ae0 bdffffffff                     mov        ebp, 0xffffffff
01ae5 7c08                           jl         0x7fc00be79fef
01ae7 400f95c5                       setne      bpl
01aeb 400fb6ed                       movzx      ebp, bpl
01aef be45ffffff                     mov        esi, 0xffffff45
01af4 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
01af9 44898424f8000000               mov        dword ptr [rsp + 0xf8], r8d
01b01 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01b06 44898424fc000000               mov        dword ptr [rsp + 0xfc], r8d
01b0e 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01b13 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01b18 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01b1d 4c8b442438                     mov        r8, qword ptr [rsp + 0x38]
01b22 4c89442430                     mov        qword ptr [rsp + 0x30], r8
01b27 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01b2c 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01b31 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01b36 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
01b3b 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01b40 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01b44 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
01b49 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01b4e 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01b53 90                             nop        
01b54 c5f877                         vzeroupper 
01b57 e80496b4ff                     call       0x7fc00b9c3660
01b5c 0f1f8400541c000e               nop        dword ptr [rax + rax + 0xe001c54]
01b64 4183c608                       add        r14d, 8
01b68 be6effffff                     mov        esi, 0xffffff6e
01b6d 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01b72 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01b77 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01b7f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01b84 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01b8c 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01b91 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01b99 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01b9e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01ba3 897c2418                       mov        dword ptr [rsp + 0x18], edi
01ba7 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01bac 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01bb1 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01bb6 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01bbb 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01bc0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01bc5 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01bca 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01bcf 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01bd4 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01bd9 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01bde 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01be3 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01be8 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01bed 894c2458                       mov        dword ptr [rsp + 0x58], ecx
01bf1 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
01bf5 666690                         nop        
01bf8 c5f877                         vzeroupper 
01bfb e86095b4ff                     call       0x7fc00b9c3660
01c00 0f1f8400f81c000f               nop        dword ptr [rax + rax + 0xf001cf8]
01c08 4183c608                       add        r14d, 8
01c0c be66ffffff                     mov        esi, 0xffffff66
01c11 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01c16 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01c1b 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01c23 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01c28 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01c30 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01c35 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01c3d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01c42 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01c47 897c2418                       mov        dword ptr [rsp + 0x18], edi
01c4b 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01c50 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01c55 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01c5a 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01c5f 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01c64 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01c69 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01c6e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01c73 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01c78 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01c7d 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01c82 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01c87 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01c8c 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01c91 894c2458                       mov        dword ptr [rsp + 0x58], ecx
01c95 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
01c99 666690                         nop        
01c9c c5f877                         vzeroupper 
01c9f e8bc94b4ff                     call       0x7fc00b9c3660
01ca4 0f1f84009c1d0010               nop        dword ptr [rax + rax + 0x10001d9c]
01cac beccffffff                     mov        esi, 0xffffffcc
01cb1 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01cb6 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01cbb 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01cc3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01cc8 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01cd0 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01cd5 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01cdd 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01ce2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01ce7 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01cef 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01cf4 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01cf9 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01cfe 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01d03 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01d08 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01d0d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01d12 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01d17 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01d1c 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01d21 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01d26 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01d2b 4489742450                     mov        dword ptr [rsp + 0x50], r14d
01d30 c5f877                         vzeroupper 
01d33 e82894b4ff                     call       0x7fc00b9c3660
01d38 0f1f8400301e0011               nop        dword ptr [rax + rax + 0x11001e30]
01d40 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01d45 458bd5                         mov        r10d, r13d
01d48 440354244c                     add        r10d, dword ptr [rsp + 0x4c]
01d4d 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01d55 4f8b5c1308                     mov        r11, qword ptr [r11 + r10 + 8]
01d5a 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01d62 4f895c0208                     mov        qword ptr [r10 + r8 + 8], r11
01d67 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01d6c 4183c308                       add        r11d, 8
01d70 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01d75 443bda                         cmp        r11d, edx
01d78 7cc6                           jl         0x7fc00be7a240
01d7a 443bdf                         cmp        r11d, edi
01d7d 0f8da6000000                   jge        0x7fc00be7a329
01d83 458bd3                         mov        r10d, r11d
01d86 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01d8b 0f1f440000                     nop        dword ptr [rax + rax]
01d90 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01d95 4d63c3                         movsxd     r8, r11d
01d98 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01d9d 458bdd                         mov        r11d, r13d
01da0 44035c244c                     add        r11d, dword ptr [rsp + 0x4c]
01da5 458bcb                         mov        r9d, r11d
01da8 8b8c2484000000                 mov        ecx, dword ptr [rsp + 0x84]
01daf 4a8b4c1908                     mov        rcx, qword ptr [rcx + r11 + 8]
01db4 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01dbc 4b894c1308                     mov        qword ptr [r11 + r10 + 8], rcx
01dc1 4d63c9                         movsxd     r9, r9d
01dc4 4f8b5c0b10                     mov        r11, qword ptr [r11 + r9 + 0x10]
01dc9 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01dd1 4f895c0210                     mov        qword ptr [r10 + r8 + 0x10], r11
01dd6 4f8b5c0a18                     mov        r11, qword ptr [r10 + r9 + 0x18]
01ddb 4f895c0218                     mov        qword ptr [r10 + r8 + 0x18], r11
01de0 4f8b5c0a20                     mov        r11, qword ptr [r10 + r9 + 0x20]
01de5 4f895c0220                     mov        qword ptr [r10 + r8 + 0x20], r11
01dea 4f8b5c0a28                     mov        r11, qword ptr [r10 + r9 + 0x28]
01def 4f895c0228                     mov        qword ptr [r10 + r8 + 0x28], r11
01df4 4f8b5c0a30                     mov        r11, qword ptr [r10 + r9 + 0x30]
01df9 4f895c0230                     mov        qword ptr [r10 + r8 + 0x30], r11
01dfe 4f8b5c0a38                     mov        r11, qword ptr [r10 + r9 + 0x38]
01e03 4f895c0238                     mov        qword ptr [r10 + r8 + 0x38], r11
01e08 4f8b5c0a40                     mov        r11, qword ptr [r10 + r9 + 0x40]
01e0d 4f895c0240                     mov        qword ptr [r10 + r8 + 0x40], r11
01e12 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01e17 4183c340                       add        r11d, 0x40
01e1b 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01e20 443bdf                         cmp        r11d, edi
01e23 0f8c67ffffff                   jl         0x7fc00be7a290
01e29 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01e2e 443bd3                         cmp        r10d, ebx
01e31 0f8dc7f2ffff                   jge        0x7fc00be795fe
01e37 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01e3c 458bcb                         mov        r9d, r11d
01e3f 90                             nop        
01e40 478d1429                       lea        r10d, [r9 + r13]
01e44 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
01e4c 4f8b441008                     mov        r8, qword ptr [r8 + r10 + 8]
01e51 458bd9                         mov        r11d, r9d
01e54 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01e5c 4f89441a08                     mov        qword ptr [r10 + r11 + 8], r8
01e61 458d5108                       lea        r10d, [r9 + 8]
01e65 458bca                         mov        r9d, r10d
01e68 443bd3                         cmp        r10d, ebx
01e6b 7cd3                           jl         0x7fc00be7a340
01e6d e98cf2ffff                     jmp        0x7fc00be795fe
01e72 bee4ffffff                     mov        esi, 0xffffffe4
01e77 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01e7c 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01e81 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01e89 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01e8e 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01e96 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01e9b 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01ea3 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01ea8 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01ead 48894424f8                     mov        qword ptr [rsp - 8], rax
01eb2 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01eb6 89442418                       mov        dword ptr [rsp + 0x18], eax
01eba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ebf 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01ec4 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01ec9 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01ece 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01ed3 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01ed8 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01edd 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01ee2 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01ee7 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01eec 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01ef1 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01ef6 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01efb 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01f00 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01f05 89442448                       mov        dword ptr [rsp + 0x48], eax
01f09 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01f0d 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
01f11 666690                         nop        
01f14 c5f877                         vzeroupper 
01f17 e84492b4ff                     call       0x7fc00b9c3660
01f1c 0f1f840014200012               nop        dword ptr [rax + rax + 0x12002014]
01f24 beccffffff                     mov        esi, 0xffffffcc
01f29 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01f2e 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
01f36 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01f3b 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
01f43 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01f48 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f4d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01f55 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f5a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01f5f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01f64 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
01f69 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01f6e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01f73 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01f78 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01f7d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01f82 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01f87 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01f8c 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01f91 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01f96 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
01f9b 90                             nop        
01f9c c5f877                         vzeroupper 
01f9f e8bc91b4ff                     call       0x7fc00b9c3660
01fa4 0f1f84009c200013               nop        dword ptr [rax + rax + 0x1300209c]
01fac bee4ffffff                     mov        esi, 0xffffffe4
01fb1 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01fb6 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01fbb 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01fc3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01fc8 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01fd0 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01fd5 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01fdd 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01fe2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01fe7 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01fef 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01ff4 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01ff9 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01ffe 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02003 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02008 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
0200d 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02012 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02017 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0201c 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02021 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02026 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0202b 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02030 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02035 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0203a 4489542454                     mov        dword ptr [rsp + 0x54], r10d
0203f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02044 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02049 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0204e 6690                           nop        
02050 c5f877                         vzeroupper 
02053 e80891b4ff                     call       0x7fc00b9c3660
02058 0f1f840050210014               nop        dword ptr [rax + rax + 0x14002150]
02060 bee4ffffff                     mov        esi, 0xffffffe4
02065 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0206a 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02072 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02077 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
0207f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02084 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02089 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02091 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02096 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0209b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
020a0 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
020a5 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
020aa 4c89542430                     mov        qword ptr [rsp + 0x30], r10
020af 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
020b4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
020b9 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
020be 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
020c3 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
020c8 4489542444                     mov        dword ptr [rsp + 0x44], r10d
020cd 4489742454                     mov        dword ptr [rsp + 0x54], r14d
020d2 6690                           nop        
020d4 c5f877                         vzeroupper 
020d7 e88490b4ff                     call       0x7fc00b9c3660
020dc 0f1f8400d4210015               nop        dword ptr [rax + rax + 0x150021d4]
020e4 418d6e01                       lea        ebp, [r14 + 1]
020e8 bee4ffffff                     mov        esi, 0xffffffe4
020ed 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
020f2 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
020fa 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
020ff 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02107 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0210c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02111 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02119 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0211e 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02123 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02128 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
0212d 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02132 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02137 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0213c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02141 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02146 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0214b 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02150 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02155 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0215a 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0215f 4489742454                     mov        dword ptr [rsp + 0x54], r14d
02164 c5f877                         vzeroupper 
02167 e8f48fb4ff                     call       0x7fc00b9c3660
0216c 0f1f840064220016               nop        dword ptr [rax + rax + 0x16002264]
02174 bee4ffffff                     mov        esi, 0xffffffe4
02179 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0217e 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02186 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0218b 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02193 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02198 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0219d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
021a5 448954240c                     mov        dword ptr [rsp + 0xc], r10d
021aa 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
021af 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
021b4 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
021b9 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
021be 4c89542430                     mov        qword ptr [rsp + 0x30], r10
021c3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
021c8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
021cd 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
021d2 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
021d7 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
021dc 4489542444                     mov        dword ptr [rsp + 0x44], r10d
021e1 4489742454                     mov        dword ptr [rsp + 0x54], r14d
021e6 6690                           nop        
021e8 c5f877                         vzeroupper 
021eb e8708fb4ff                     call       0x7fc00b9c3660
021f0 0f1f8400e8220017               nop        dword ptr [rax + rax + 0x170022e8]
021f8 bee4ffffff                     mov        esi, 0xffffffe4
021fd 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02202 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02207 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
0220f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02214 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0221c 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02221 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02229 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0222e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02233 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0223b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02240 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02245 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0224a 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
0224f 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02254 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02259 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0225e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02263 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02268 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0226d 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02272 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02277 4489742454                     mov        dword ptr [rsp + 0x54], r14d
0227c c5f877                         vzeroupper 
0227f e8dc8eb4ff                     call       0x7fc00b9c3660
02284 0f1f84007c230018               nop        dword ptr [rax + rax + 0x1800237c]
0228c bee4ffffff                     mov        esi, 0xffffffe4
02291 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02296 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0229b 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
022a3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
022a8 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
022b0 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
022b5 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
022bd 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
022c2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
022c7 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
022cf 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
022d4 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
022d9 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
022de 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
022e3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
022e8 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
022ed 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
022f2 4c89542428                     mov        qword ptr [rsp + 0x28], r10
022f7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
022fc 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02301 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02306 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0230b 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02310 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02315 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0231a 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0231f 4489742460                     mov        dword ptr [rsp + 0x60], r14d
02324 c5f877                         vzeroupper 
02327 e8348eb4ff                     call       0x7fc00b9c3660
0232c 0f1f840024240019               nop        dword ptr [rax + rax + 0x19002424]
02334 bee4ffffff                     mov        esi, 0xffffffe4
02339 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0233e 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02346 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0234b 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02353 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02358 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0235d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02365 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0236a 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
0236f 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02374 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02379 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0237e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02383 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02388 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0238d 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02392 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02397 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0239c 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
023a1 666690                         nop        
023a4 c5f877                         vzeroupper 
023a7 e8b48db4ff                     call       0x7fc00b9c3660
023ac 0f1f8400a424001a               nop        dword ptr [rax + rax + 0x1a0024a4]
023b4 85db                           test       ebx, ebx
023b6 0f84540c0000                   je         0x7fc00be7b510
023bc 4c8bdb                         mov        r11, rbx
023bf 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
023c4 4533c0                         xor        r8d, r8d
023c7 e9ffe8ffff                     jmp        0x7fc00be791cb
023cc be6effffff                     mov        esi, 0xffffff6e
023d1 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
023d6 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
023db 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
023e3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
023e8 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
023f0 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
023f5 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
023fd 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
02402 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02407 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0240c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
02411 4489542428                     mov        dword ptr [rsp + 0x28], r10d
02416 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0241b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02420 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02425 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0242a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0242f 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
02434 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02439 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0243e 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02443 89442448                       mov        dword ptr [rsp + 0x48], eax
02447 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0244c 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02451 895c2458                       mov        dword ptr [rsp + 0x58], ebx
02455 894c2460                       mov        dword ptr [rsp + 0x60], ecx
02459 666690                         nop        
0245c c5f877                         vzeroupper 
0245f e8fc8cb4ff                     call       0x7fc00b9c3660
02464 0f1f84005c25001b               nop        dword ptr [rax + rax + 0x1b00255c]
0246c be45ffffff                     mov        esi, 0xffffff45
02471 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02476 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0247b 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02483 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02488 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02490 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02495 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
0249d 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
024a2 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
024a7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
024ac 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
024b1 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
024b6 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
024bb 4c89542430                     mov        qword ptr [rsp + 0x30], r10
024c0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
024c5 4c89542438                     mov        qword ptr [rsp + 0x38], r10
024ca 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
024cf 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
024d4 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
024d9 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
024de 4489442444                     mov        dword ptr [rsp + 0x44], r8d
024e3 89442448                       mov        dword ptr [rsp + 0x48], eax
024e7 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
024eb 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
024ef 90                             nop        
024f0 c5f877                         vzeroupper 
024f3 e8688cb4ff                     call       0x7fc00b9c3660
024f8 0f1f8400f025001c               nop        dword ptr [rax + rax + 0x1c0025f0]
02500 be3dffffff                     mov        esi, 0xffffff3d
02505 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0250a 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0250f 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02517 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0251c 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02524 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02529 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02531 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
02536 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0253b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02540 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
02545 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0254a 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0254f 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02554 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02559 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0255e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02563 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
02568 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0256d 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02572 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02577 89442448                       mov        dword ptr [rsp + 0x48], eax
0257b 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
0257f 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
02583 90                             nop        
02584 c5f877                         vzeroupper 
02587 e8d48bb4ff                     call       0x7fc00b9c3660
0258c 0f1f84008426001d               nop        dword ptr [rax + rax + 0x1d002684]
02594 bee4ffffff                     mov        esi, 0xffffffe4
02599 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0259e 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
025a6 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
025ab 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
025b3 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
025b8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
025bd 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
025c5 448954240c                     mov        dword ptr [rsp + 0xc], r10d
025ca 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
025cf 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
025d4 4c89542430                     mov        qword ptr [rsp + 0x30], r10
025d9 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
025de 4c89542438                     mov        qword ptr [rsp + 0x38], r10
025e3 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
025e8 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
025ed 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
025f2 4489542444                     mov        dword ptr [rsp + 0x44], r10d
025f7 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
025fc 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02601 666690                         nop        
02604 c5f877                         vzeroupper 
02607 e8548bb4ff                     call       0x7fc00b9c3660
0260c 0f1f84000427001e               nop        dword ptr [rax + rax + 0x1e002704]
02614 bee4ffffff                     mov        esi, 0xffffffe4
02619 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0261e 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02626 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0262b 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02633 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02638 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0263d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02645 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0264a 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
0264f 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02654 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02659 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0265e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02663 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02668 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0266d 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02672 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02677 90                             nop        
02678 c5f877                         vzeroupper 
0267b e8e08ab4ff                     call       0x7fc00b9c3660
02680 0f1f84007827001f               nop        dword ptr [rax + rax + 0x1f002778]
02688 beccffffff                     mov        esi, 0xffffffcc
0268d 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02692 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02697 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
0269f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
026a4 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
026ac 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
026b1 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
026b9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
026be 4c89542410                     mov        qword ptr [rsp + 0x10], r10
026c3 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
026cb 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
026d0 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
026d5 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
026da 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
026df 4c89542420                     mov        qword ptr [rsp + 0x20], r10
026e4 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
026e9 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
026ee 4c89542428                     mov        qword ptr [rsp + 0x28], r10
026f3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
026f8 4c89542430                     mov        qword ptr [rsp + 0x30], r10
026fd 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02702 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02707 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0270c 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02711 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02716 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0271b 4489742458                     mov        dword ptr [rsp + 0x58], r14d
02720 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02725 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0272a 6690                           nop        
0272c c5f877                         vzeroupper 
0272f e82c8ab4ff                     call       0x7fc00b9c3660
02734 0f1f84002c280020               nop        dword ptr [rax + rax + 0x2000282c]
0273c bee4ffffff                     mov        esi, 0xffffffe4
02741 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02746 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0274b 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02753 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02758 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02760 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02765 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
0276d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02772 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02777 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0277c 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02781 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02786 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0278b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02790 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02795 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0279a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0279f 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
027a4 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
027a9 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
027ae 89442444                       mov        dword ptr [rsp + 0x44], eax
027b2 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
027b7 4489542448                     mov        dword ptr [rsp + 0x48], r10d
027bc 895c2450                       mov        dword ptr [rsp + 0x50], ebx
027c0 48894424f8                     mov        qword ptr [rsp - 8], rax
027c5 8b442464                       mov        eax, dword ptr [rsp + 0x64]
027c9 89442454                       mov        dword ptr [rsp + 0x54], eax
027cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027d2 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
027d7 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
027dc c5f877                         vzeroupper 
027df e87c89b4ff                     call       0x7fc00b9c3660
027e4 0f1f8400dc280021               nop        dword ptr [rax + rax + 0x210028dc]
027ec c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
027f5 bee4ffffff                     mov        esi, 0xffffffe4
027fa 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
027ff 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02804 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
0280c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02811 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02819 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0281e 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
02826 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0282b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02830 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02838 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0283d 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02842 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02847 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
0284c 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02851 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02856 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0285b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02860 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02865 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0286a 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0286f 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02874 89442444                       mov        dword ptr [rsp + 0x44], eax
02878 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0287d 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02882 895c2450                       mov        dword ptr [rsp + 0x50], ebx
02886 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
0288b 48894424f8                     mov        qword ptr [rsp - 8], rax
02890 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02894 89442460                       mov        dword ptr [rsp + 0x60], eax
02898 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0289d 666690                         nop        
028a0 c5f877                         vzeroupper 
028a3 e8b888b4ff                     call       0x7fc00b9c3660
028a8 0f1f8400a0290022               nop        dword ptr [rax + rax + 0x220029a0]
028b0 418be9                         mov        ebp, r9d
028b3 83c510                         add        ebp, 0x10
028b6 be6effffff                     mov        esi, 0xffffff6e
028bb 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
028c0 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
028c8 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
028cd 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
028d5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
028da 4c89542418                     mov        qword ptr [rsp + 0x18], r10
028df 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
028e4 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
028e9 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
028ee 4c89542430                     mov        qword ptr [rsp + 0x30], r10
028f3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
028f8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
028fd 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02902 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02907 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0290c 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02911 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02915 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0291a 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0291f 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
02923 90                             nop        
02924 c5f877                         vzeroupper 
02927 e83488b4ff                     call       0x7fc00b9c3660
0292c 0f1f8400242a0023               nop        dword ptr [rax + rax + 0x23002a24]
02934 418be9                         mov        ebp, r9d
02937 83c510                         add        ebp, 0x10
0293a be66ffffff                     mov        esi, 0xffffff66
0293f 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02944 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
0294c 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02951 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02959 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0295e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02963 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
02968 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
0296d 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02972 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02977 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0297c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02981 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02986 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0298b 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02990 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02995 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02999 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0299e 4489542450                     mov        dword ptr [rsp + 0x50], r10d
029a3 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
029a7 90                             nop        
029a8 c5f877                         vzeroupper 
029ab e8b087b4ff                     call       0x7fc00b9c3660
029b0 0f1f8400a82a0024               nop        dword ptr [rax + rax + 0x24002aa8]
029b8 be17000000                     mov        esi, 0x17
029bd 666690                         nop        
029c0 c5f877                         vzeroupper 
029c3 e89887b4ff                     call       0x7fc00b9c3660
029c8 0f1f8400c02a0025               nop        dword ptr [rax + rax + 0x25002ac0]
029d0 be6effffff                     mov        esi, 0xffffff6e
029d5 48899424f0000000               mov        qword ptr [rsp + 0xf0], rdx
029dd 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
029e2 48ff742428                     push       qword ptr [rsp + 0x28]
029e7 488f442420                     pop        qword ptr [rsp + 0x20]
029ec 897c2428                       mov        dword ptr [rsp + 0x28], edi
029f0 4c89442430                     mov        qword ptr [rsp + 0x30], r8
029f5 48ff742440                     push       qword ptr [rsp + 0x40]
029fa 488f442438                     pop        qword ptr [rsp + 0x38]
029ff 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
02a03 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
02a08 4c89742448                     mov        qword ptr [rsp + 0x48], r14
02a0d 666690                         nop        
02a10 c5f877                         vzeroupper 
02a13 e84887b4ff                     call       0x7fc00b9c3660
02a18 0f1f8400102b0026               nop        dword ptr [rax + rax + 0x26002b10]
02a20 bebeffffff                     mov        esi, 0xffffffbe
02a25 4c89ac24f0000000               mov        qword ptr [rsp + 0xf0], r13
02a2d 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02a32 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02a3a 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02a3f 4889542418                     mov        qword ptr [rsp + 0x18], rdx
02a44 48ff742428                     push       qword ptr [rsp + 0x28]
02a49 488f442420                     pop        qword ptr [rsp + 0x20]
02a4e 897c2428                       mov        dword ptr [rsp + 0x28], edi
02a52 4c89442430                     mov        qword ptr [rsp + 0x30], r8
02a57 48ff742440                     push       qword ptr [rsp + 0x40]
02a5c 488f442438                     pop        qword ptr [rsp + 0x38]
02a61 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
02a65 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
02a6a 4c89742448                     mov        qword ptr [rsp + 0x48], r14
02a6f 90                             nop        
02a70 c5f877                         vzeroupper 
02a73 e8e886b4ff                     call       0x7fc00b9c3660
02a78 0f1f8400702b0027               nop        dword ptr [rax + rax + 0x27002b70]
02a80 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
02a85 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
02a8a bef6ffffff                     mov        esi, 0xfffffff6
02a8f 498bed                         mov        rbp, r13
02a92 44898c24f0000000               mov        dword ptr [rsp + 0xf0], r9d
02a9a 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02aa2 6690                           nop        
02aa4 c5f877                         vzeroupper 
02aa7 e8b486b4ff                     call       0x7fc00b9c3660
02aac 0f1f8400a42b0028               nop        dword ptr [rax + rax + 0x28002ba4]
02ab4 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02ab8 eb10                           jmp        0x7fc00be7afca
02aba 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02abe eb0a                           jmp        0x7fc00be7afca
02ac0 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02ac4 eb04                           jmp        0x7fc00be7afca
02ac6 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02aca beccffffff                     mov        esi, 0xffffffcc
02acf 4c89ac24f0000000               mov        qword ptr [rsp + 0xf0], r13
02ad7 44898424f8000000               mov        dword ptr [rsp + 0xf8], r8d
02adf 4c89742410                     mov        qword ptr [rsp + 0x10], r14
02ae4 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02ae9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02aee 6690                           nop        
02af0 c5f877                         vzeroupper 
02af3 e86886b4ff                     call       0x7fc00b9c3660
02af8 0f1f8400f02b0029               nop        dword ptr [rax + rax + 0x29002bf0]
02b00 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02b04 4c8b742478                     mov        r14, qword ptr [rsp + 0x78]
02b09 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
02b0e ebba                           jmp        0x7fc00be7afca
02b10 bee4ffffff                     mov        esi, 0xffffffe4
02b15 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02b1a 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02b1f 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02b27 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02b2c 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02b34 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02b39 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02b41 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02b46 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02b4b 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02b53 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02b58 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02b5d 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02b62 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02b67 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02b6c 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02b71 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02b76 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02b7b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02b80 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02b85 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02b8a 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02b8f 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02b94 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02b99 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02b9d 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
02ba2 6690                           nop        
02ba4 c5f877                         vzeroupper 
02ba7 e8b485b4ff                     call       0x7fc00b9c3660
02bac 0f1f8400a42c002a               nop        dword ptr [rax + rax + 0x2a002ca4]
02bb4 bee4ffffff                     mov        esi, 0xffffffe4
02bb9 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02bbe 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02bc3 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02bcb 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02bd0 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02bd8 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02bdd 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
02be5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02bea 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02bef 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02bf7 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02bfc 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02c01 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02c06 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02c0b 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02c10 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02c15 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02c1a 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02c1f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02c24 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02c29 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02c2d 666690                         nop        
02c30 c5f877                         vzeroupper 
02c33 e82885b4ff                     call       0x7fc00b9c3660
02c38 0f1f8400302d002b               nop        dword ptr [rax + rax + 0x2b002d30]
02c40 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02c45 4183c308                       add        r11d, 8
02c49 be6effffff                     mov        esi, 0xffffff6e
02c4e 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02c53 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02c58 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02c60 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02c65 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02c6d 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
02c72 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
02c7a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02c7f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02c84 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02c89 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02c8e 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02c93 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02c98 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02c9d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02ca2 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02ca7 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02cac 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02cb1 895c2448                       mov        dword ptr [rsp + 0x48], ebx
02cb5 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02cba 6690                           nop        
02cbc c5f877                         vzeroupper 
02cbf e89c84b4ff                     call       0x7fc00b9c3660
02cc4 0f1f8400bc2d002c               nop        dword ptr [rax + rax + 0x2c002dbc]
02ccc 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02cd1 4183c308                       add        r11d, 8
02cd5 be66ffffff                     mov        esi, 0xffffff66
02cda 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02cdf 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02ce4 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02cec 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02cf1 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02cf9 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
02cfe 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
02d06 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02d0b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02d10 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02d15 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02d1a 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02d1f 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02d24 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02d29 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02d2e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02d33 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02d38 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02d3d 895c2448                       mov        dword ptr [rsp + 0x48], ebx
02d41 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02d46 6690                           nop        
02d48 c5f877                         vzeroupper 
02d4b e81084b4ff                     call       0x7fc00b9c3660
02d50 0f1f8400482e002d               nop        dword ptr [rax + rax + 0x2d002e48]
02d58 beccffffff                     mov        esi, 0xffffffcc
02d5d 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02d62 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02d67 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02d6f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02d74 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02d7c 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02d81 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02d89 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02d8e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02d93 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02d9b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02da0 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02da5 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02daa 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
02daf 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02db4 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02db9 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02dbe 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02dc3 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02dc8 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
02dcd 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02dd2 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02dd7 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02ddc 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02de1 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
02de6 89442468                       mov        dword ptr [rsp + 0x68], eax
02dea 6690                           nop        
02dec c5f877                         vzeroupper 
02def e86c83b4ff                     call       0x7fc00b9c3660
02df4 0f1f8400ec2e002e               nop        dword ptr [rax + rax + 0x2e002eec]
02dfc bee4ffffff                     mov        esi, 0xffffffe4
02e01 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02e06 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02e0b 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02e13 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02e18 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02e20 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02e25 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02e2d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02e32 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02e37 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02e3f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02e44 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02e49 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02e4e 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02e53 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02e58 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02e5d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02e62 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02e67 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02e6c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02e71 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02e76 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02e7b 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02e7f 4489742454                     mov        dword ptr [rsp + 0x54], r14d
02e84 c5f877                         vzeroupper 
02e87 e8d482b4ff                     call       0x7fc00b9c3660
02e8c 0f1f8400842f002f               nop        dword ptr [rax + rax + 0x2f002f84]
02e94 c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
02e9d bee4ffffff                     mov        esi, 0xffffffe4
02ea2 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02ea7 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02eac 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02eb4 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02eb9 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02ec1 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02ec6 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02ece 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02ed3 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02ed8 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02ee0 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02ee5 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02eea 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02eef 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02ef4 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02ef9 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02efe 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02f03 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02f08 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02f0d 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02f12 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02f17 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02f1c 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02f20 448974244c                     mov        dword ptr [rsp + 0x4c], r14d
02f25 666690                         nop        
02f28 c5f877                         vzeroupper 
02f2b e83082b4ff                     call       0x7fc00b9c3660
02f30 0f1f840028300030               nop        dword ptr [rax + rax + 0x30003028]
02f38 4183c610                       add        r14d, 0x10
02f3c be6effffff                     mov        esi, 0xffffff6e
02f41 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02f46 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02f4e 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02f53 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02f5b 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02f60 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02f65 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02f6a 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02f6f 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02f74 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02f79 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02f7e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02f83 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02f88 4489742450                     mov        dword ptr [rsp + 0x50], r14d
02f8d 895c2454                       mov        dword ptr [rsp + 0x54], ebx
02f91 666690                         nop        
02f94 c5f877                         vzeroupper 
02f97 e8c481b4ff                     call       0x7fc00b9c3660
02f9c 0f1f840094300031               nop        dword ptr [rax + rax + 0x31003094]
02fa4 4183c610                       add        r14d, 0x10
02fa8 be66ffffff                     mov        esi, 0xffffff66
02fad 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02fb2 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02fba 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02fbf 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02fc7 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02fcc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02fd1 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02fd6 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02fdb 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02fe0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02fe5 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02fea 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02fef 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02ff4 4489742450                     mov        dword ptr [rsp + 0x50], r14d
02ff9 895c2454                       mov        dword ptr [rsp + 0x54], ebx
02ffd 666690                         nop        
03000 c5f877                         vzeroupper 
03003 e85881b4ff                     call       0x7fc00b9c3660
03008 0f1f840000310032               nop        dword ptr [rax + rax + 0x32003100]
03010 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
03015 4533c9                         xor        r9d, r9d
03018 458bd3                         mov        r10d, r11d
0301b e96afaffff                     jmp        0x7fc00be7af8a
03020 bef6ffffff                     mov        esi, 0xfffffff6
03025 666690                         nop        
03028 c5f877                         vzeroupper 
0302b e83081b4ff                     call       0x7fc00b9c3660
03030 0f1f840028310033               nop        dword ptr [rax + rax + 0x33003128]
03038 488bf0                         mov        rsi, rax
0303b c5f877                         vzeroupper 
0303e 4881c4e0000000                 add        rsp, 0xe0
03045 5d                             pop        rbp
03046 e91500b5ff                     jmp        0x7fc00b9cb560
0304b 49ba4092e70bc07f0000           movabs     r10, 0x7fc00be79240
03055 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0305c e97f29a8ff                     jmp        0x7fc00b8fdee0
03061 e83af5a6ff                     call       0x7fc00b8eaaa0
03066 e9d3cfffff                     jmp        0x7fc00be7853e
0306b f4                             hlt        
0306c f4                             hlt        
0306d f4                             hlt        
0306e f4                             hlt        
0306f f4                             hlt        
