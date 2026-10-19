00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c069a8ff                   jne        0x7f53eb8fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecd0000000                 sub        rsp, 0xd0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f850c270000                   jne        0x7f53ebe766ca
0003e 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4c89442408                     mov        qword ptr [rsp + 8], r8
0004b 448bd7                         mov        r10d, edi
0004e 488bde                         mov        rbx, rsi
00051 8b4638                         mov        eax, dword ptr [rsi + 0x38]
00054 8b6e04                         mov        ebp, dword ptr [rsi + 4]
00057 448bdd                         mov        r11d, ebp
0005a 442bd8                         sub        r11d, eax
0005d 8b8c24e0000000                 mov        ecx, dword ptr [rsp + 0xe0]
00064 413bcb                         cmp        ecx, r11d
00067 0f8f4f200000                   jg         0x7f53ebe7603c
0006d 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00071 4c8b4e20                       mov        r9, qword ptr [rsi + 0x20]
00075 4c639c24e0000000               movsxd     r11, dword ptr [rsp + 0xe0]
0007d 4863c8                         movsxd     rcx, eax
00080 4903c8                         add        rcx, r8
00083 4c2bc9                         sub        r9, rcx
00086 4d3bd9                         cmp        r11, r9
00089 0f8f2d200000                   jg         0x7f53ebe7603c
0008f 488b7e10                       mov        rdi, qword ptr [rsi + 0x10]
00093 4c8b4e28                       mov        r9, qword ptr [rsi + 0x28]
00097 4d85c9                         test       r9, r9
0009a 0f84930f0000                   je         0x7f53ebe74fb3
000a0 4533ed                         xor        r13d, r13d
000a3 4c8bda                         mov        r11, rdx
000a6 8b7204                         mov        esi, dword ptr [rdx + 4]
000a9 448b7340                       mov        r14d, dword ptr [rbx + 0x40]
000ad 4585d2                         test       r10d, r10d
000b0 0f8ec21a0000                   jle        0x7f53ebe75af8
000b6 89ac2480000000                 mov        dword ptr [rsp + 0x80], ebp
000bd 4489542438                     mov        dword ptr [rsp + 0x38], r10d
000c2 4889542450                     mov        qword ptr [rsp + 0x50], rdx
000c7 48895c2478                     mov        qword ptr [rsp + 0x78], rbx
000cc 4d2bc8                         sub        r9, r8
000cf 448d5ee0                       lea        r11d, [rsi - 0x20]
000d3 83c5e0                         add        ebp, -0x20
000d6 4c8b542408                     mov        r10, qword ptr [rsp + 8]
000db 418b4a04                       mov        ecx, dword ptr [r10 + 4]
000df 85c9                           test       ecx, ecx
000e1 0f86ed1f0000                   jbe        0x7f53ebe76054
000e7 4c63d1                         movsxd     r10, ecx
000ea 48634c2438                     movsxd     rcx, dword ptr [rsp + 0x38]
000ef 48ffc9                         dec        rcx
000f2 493bca                         cmp        rcx, r10
000f5 0f83d91f0000                   jae        0x7f53ebe76054
000fb 4c8b9424e8000000               mov        r10, qword ptr [rsp + 0xe8]
00103 418b5a04                       mov        ebx, dword ptr [r10 + 4]
00107 85db                           test       ebx, ebx
00109 0f86fd1f0000                   jbe        0x7f53ebe7608c
0010f 83fb01                         cmp        ebx, 1
00112 0f86f41f0000                   jbe        0x7f53ebe7608c
00118 83fb02                         cmp        ebx, 2
0011b 0f86eb1f0000                   jbe        0x7f53ebe7608c
00121 448d56f1                       lea        r10d, [rsi - 0xf]
00125 4585d2                         test       r10d, r10d
00128 0f8cde1f0000                   jl         0x7f53ebe7608c
0012e 418b4e04                       mov        ecx, dword ptr [r14 + 4]
00132 448d51f1                       lea        r10d, [rcx - 0xf]
00136 4585d2                         test       r10d, r10d
00139 0f8ccd1f0000                   jl         0x7f53ebe7608c
0013f 448d51fd                       lea        r10d, [rcx - 3]
00143 4585d2                         test       r10d, r10d
00146 0f8cc01f0000                   jl         0x7f53ebe7608c
0014c 448d51f9                       lea        r10d, [rcx - 7]
00150 4585d2                         test       r10d, r10d
00153 0f8cb31f0000                   jl         0x7f53ebe7608c
00159 894c2404                       mov        dword ptr [rsp + 4], ecx
0015d 899c24e4000000                 mov        dword ptr [rsp + 0xe4], ebx
00164 89ac248c000000                 mov        dword ptr [rsp + 0x8c], ebp
0016b 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
00173 89b424e0000000                 mov        dword ptr [rsp + 0xe0], esi
0017a 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
0017f 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
00184 48897c2430                     mov        qword ptr [rsp + 0x30], rdi
00189 4c89442420                     mov        qword ptr [rsp + 0x20], r8
0018e 498bde                         mov        rbx, r14
00191 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
00196 4489b42484000000               mov        dword ptr [rsp + 0x84], r14d
0019e 8bd9                           mov        ebx, ecx
001a0 448bee                         mov        r13d, esi
001a3 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
001a8 448d6bf9                       lea        r13d, [rbx - 7]
001ac 44896c2468                     mov        dword ptr [rsp + 0x68], r13d
001b1 448b6c2418                     mov        r13d, dword ptr [rsp + 0x18]
001b6 4183c5f1                       add        r13d, -0xf
001ba 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
001bf 448d5bfd                       lea        r11d, [rbx - 3]
001c3 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
001c8 4c63eb                         movsxd     r13, ebx
001cb 83c3f1                         add        ebx, -0xf
001ce 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
001d5 498d5df9                       lea        rbx, [r13 - 7]
001d9 48899c2498000000               mov        qword ptr [rsp + 0x98], rbx
001e1 4983c5f1                       add        r13, -0xf
001e5 4c89ac24a0000000               mov        qword ptr [rsp + 0xa0], r13
001ed 4533d2                         xor        r10d, r10d
001f0 33db                           xor        ebx, ebx
001f2 899c24b0000000                 mov        dword ptr [rsp + 0xb0], ebx
001f9 e93f040000                     jmp        0x7f53ebe745bd
001fe 448bd5                         mov        r10d, ebp
00201 4d63d2                         movsxd     r10, r10d
00204 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0020b c442a8f5db                     bzhi       r11, r11, r10
00210 c4c1fb92fb                     kmovq      k7, r11
00215 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0021b 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00221 4403ed                         add        r13d, ebp
00224 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00228 418502                         test       dword ptr [r10], eax
0022b 443b6c2448                     cmp        r13d, dword ptr [rsp + 0x48]
00230 0f8dde030000                   jge        0x7f53ebe74594
00236 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
0023b 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00240 452bd5                         sub        r10d, r13d
00243 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00248 8b6c2448                       mov        ebp, dword ptr [rsp + 0x48]
0024c 412bed                         sub        ebp, r13d
0024f 413bed                         cmp        ebp, r13d
00252 410f4fed                       cmovg      ebp, r13d
00256 4585d2                         test       r10d, r10d
00259 0f8ca91b0000                   jl         0x7f53ebe75d88
0025f 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00264 4585d2                         test       r10d, r10d
00267 0f8c9b1b0000                   jl         0x7f53ebe75d88
0026d 448bdd                         mov        r11d, ebp
00270 44035c2460                     add        r11d, dword ptr [rsp + 0x60]
00275 448b742404                     mov        r14d, dword ptr [rsp + 4]
0027a 453bf3                         cmp        r14d, r11d
0027d 0f82851b0000                   jb         0x7f53ebe75d88
00283 448b74245c                     mov        r14d, dword ptr [rsp + 0x5c]
00288 4403f5                         add        r14d, ebp
0028b 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00290 453bde                         cmp        r11d, r14d
00293 0f826f1b0000                   jb         0x7f53ebe75d88
00299 85ed                           test       ebp, ebp
0029b 0f8c671b0000                   jl         0x7f53ebe75d88
002a1 85ed                           test       ebp, ebp
002a3 0f8478ffffff                   je         0x7f53ebe741a1
002a9 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
002b1 4b8d741008                     lea        rsi, [r8 + r10 + 8]
002b6 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
002bb 4b8d7c1008                     lea        rdi, [r8 + r10 + 8]
002c0 4863d5                         movsxd     rdx, ebp
002c3 4883fa20                       cmp        rdx, 0x20
002c7 0f8631ffffff                   jbe        0x7f53ebe7417e
002cd c5f877                         vzeroupper 
002d0 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
002da 41ffd2                         call       r10
002dd 0f1f840000000000               nop        dword ptr [rax + rax]
002e5 e937ffffff                     jmp        0x7f53ebe741a1
002ea 48894424f8                     mov        qword ptr [rsp - 8], rax
002ef 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
002f3 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
002fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
002ff 4585ed                         test       r13d, r13d
00302 0f8e94110000                   jle        0x7f53ebe7541c
00308 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
0030c 034c244c                       add        ecx, dword ptr [rsp + 0x4c]
00310 3b8c248c000000                 cmp        ecx, dword ptr [rsp + 0x8c]
00317 0f8f8f120000                   jg         0x7f53ebe7552c
0031d 458d041a                       lea        r8d, [r10 + rbx]
00321 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
00329 443b842488000000               cmp        r8d, dword ptr [rsp + 0x88]
00331 0f8ff9120000                   jg         0x7f53ebe755b0
00337 83fb10                         cmp        ebx, 0x10
0033a 0f8f95060000                   jg         0x7f53ebe74955
00340 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
00345 0f837a0f0000                   jae        0x7f53ebe75245
0034b 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00350 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
00357 3b842490000000                 cmp        eax, dword ptr [rsp + 0x90]
0035e 0f83e00f0000                   jae        0x7f53ebe752c4
00364 468d3413                       lea        r14d, [rbx + r10]
00368 4489b42494000000               mov        dword ptr [rsp + 0x94], r14d
00370 448bb42484000000               mov        r14d, dword ptr [rsp + 0x84]
00378 c4c17a7f440608                 vmovdqu    xmmword ptr [r14 + rax + 8], xmm0
0037f 03d8                           add        ebx, eax
00381 448bf3                         mov        r14d, ebx
00384 452bf5                         sub        r14d, r13d
00387 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0038c 4183f910                       cmp        r9d, 0x10
00390 7f47                           jg         0x7f53ebe74359
00392 4183fd10                       cmp        r13d, 0x10
00396 7c41                           jl         0x7f53ebe74359
00398 443bb42490000000               cmp        r14d, dword ptr [rsp + 0x90]
003a0 0f8322100000                   jae        0x7f53ebe75348
003a6 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
003ae c4817a6f443508                 vmovdqu    xmm0, xmmword ptr [r13 + r14 + 8]
003b5 3b9c2490000000                 cmp        ebx, dword ptr [rsp + 0x90]
003bc 0f836e100000                   jae        0x7f53ebe753b0
003c2 c4c17a7f441d08                 vmovdqu    xmmword ptr [r13 + rbx + 8], xmm0
003c9 4403cb                         add        r9d, ebx
003cc 44898c24a8000000               mov        dword ptr [rsp + 0xa8], r9d
003d4 e93b020000                     jmp        0x7f53ebe74594
003d9 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
003e1 4b8d7c3208                     lea        rdi, [r10 + r14 + 8]
003e6 498d741a08                     lea        rsi, [r10 + rbx + 8]
003eb 458d1c19                       lea        r11d, [r9 + rbx]
003ef 44899c24a8000000               mov        dword ptr [rsp + 0xa8], r11d
003f7 4d63c3                         movsxd     r8, r11d
003fa 453be9                         cmp        r13d, r9d
003fd 0f8cf3030000                   jl         0x7f53ebe74776
00403 4183f930                       cmp        r9d, 0x30
00407 0f8e89000000                   jle        0x7f53ebe74416
0040d 4585f6                         test       r14d, r14d
00410 0f8c5a150000                   jl         0x7f53ebe758f0
00416 85db                           test       ebx, ebx
00418 0f8c52150000                   jl         0x7f53ebe758f0
0041e 478d1431                       lea        r10d, [r9 + r14]
00422 448b6c2404                     mov        r13d, dword ptr [rsp + 4]
00427 453bea                         cmp        r13d, r10d
0042a 0f8240150000                   jb         0x7f53ebe758f0
00430 453beb                         cmp        r13d, r11d
00433 0f8237150000                   jb         0x7f53ebe758f0
00439 4585c9                         test       r9d, r9d
0043c 0f8426150000                   je         0x7f53ebe758e8
00442 4963d1                         movsxd     rdx, r9d
00445 4883fa20                       cmp        rdx, 0x20
00449 772b                           ja         0x7f53ebe743f6
0044b 458bd9                         mov        r11d, r9d
0044e 4d63d3                         movsxd     r10, r11d
00451 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00458 c442a8f5db                     bzhi       r11, r11, r10
0045d c4c1fb92fb                     kmovq      k7, r11
00462 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00468 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0046e 418be9                         mov        ebp, r9d
00471 e995010000                     jmp        0x7f53ebe7458b
00476 418be9                         mov        ebp, r9d
00479 c5f877                         vzeroupper 
0047c 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
00486 41ffd2                         call       r10
00489 0f1f840000000000               nop        dword ptr [rax + rax]
00491 e975010000                     jmp        0x7f53ebe7458b
00496 443b742468                     cmp        r14d, dword ptr [rsp + 0x68]
0049b 0f83e7120000                   jae        0x7f53ebe75708
004a1 4963fe                         movsxd     rdi, r14d
004a4 498b4c3a08                     mov        rcx, qword ptr [r10 + rdi + 8]
004a9 3b5c2468                       cmp        ebx, dword ptr [rsp + 0x68]
004ad 0f8341130000                   jae        0x7f53ebe75774
004b3 448bd3                         mov        r10d, ebx
004b6 458d5a08                       lea        r11d, [r10 + 8]
004ba 4963d2                         movsxd     rdx, r10d
004bd 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
004c5 49894c1508                     mov        qword ptr [r13 + rdx + 8], rcx
004ca 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
004d2 7c08                           jl         0x7f53ebe7445c
004d4 418be9                         mov        ebp, r9d
004d7 e92f010000                     jmp        0x7f53ebe7458b
004dc 482bfa                         sub        rdi, rdx
004df 4963d3                         movsxd     rdx, r11d
004e2 488d0c3a                       lea        rcx, [rdx + rdi]
004e6 483b8c2498000000               cmp        rcx, qword ptr [rsp + 0x98]
004ee 0f8374130000                   jae        0x7f53ebe757e8
004f4 498bc8                         mov        rcx, r8
004f7 482bca                         sub        rcx, rdx
004fa 4883c107                       add        rcx, 7
004fe 4883e1f8                       and        rcx, 0xfffffffffffffff8
00502 8bd1                           mov        edx, ecx
00504 428d4c1208                     lea        ecx, [rdx + r10 + 8]
00509 4863c9                         movsxd     rcx, ecx
0050c 488d7c39f8                     lea        rdi, [rcx + rdi - 8]
00511 483bbc2498000000               cmp        rdi, qword ptr [rsp + 0x98]
00519 0f8349130000                   jae        0x7f53ebe757e8
0051f 443b5c2468                     cmp        r11d, dword ptr [rsp + 0x68]
00524 0f833e130000                   jae        0x7f53ebe757e8
0052a 4883c1f8                       add        rcx, -8
0052e 483b8c2498000000               cmp        rcx, qword ptr [rsp + 0x98]
00536 0f832c130000                   jae        0x7f53ebe757e8
0053c 448bac24a8000000               mov        r13d, dword ptr [rsp + 0xa8]
00544 4181fdf8ffff7f                 cmp        r13d, 0x7ffffff8
0054b 0f8f9f130000                   jg         0x7f53ebe75870
00551 452bf2                         sub        r14d, r10d
00554 4183c210                       add        r10d, 0x10
00558 418be9                         mov        ebp, r9d
0055b 478d0c1e                       lea        r9d, [r14 + r11]
0055f 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
00567 4f8b4c0d08                     mov        r9, qword ptr [r13 + r9 + 8]
0056c 418bcb                         mov        ecx, r11d
0056f 4d894c0d08                     mov        qword ptr [r13 + rcx + 8], r9
00574 4183c308                       add        r11d, 8
00578 453bda                         cmp        r11d, r10d
0057b 7cde                           jl         0x7f53ebe744db
0057d 4983c0f8                       add        r8, -8
00581 4981f800000080                 cmp        r8, -0x80000000
00588 49c7c200000080                 mov        r10, 0xffffffff80000000
0058f 4d0f4cc2                       cmovl      r8, r10
00593 418bc8                         mov        ecx, r8d
00596 443bd9                         cmp        r11d, ecx
00599 7d3d                           jge        0x7f53ebe74558
0059b 0f1f440000                     nop        dword ptr [rax + rax]
005a0 478d141e                       lea        r10d, [r14 + r11]
005a4 458bcb                         mov        r9d, r11d
005a7 4963f9                         movsxd     rdi, r9d
005aa 458bc2                         mov        r8d, r10d
005ad 4b8b540508                     mov        rdx, qword ptr [r13 + r8 + 8]
005b2 4d63d2                         movsxd     r10, r10d
005b5 458bc3                         mov        r8d, r11d
005b8 4b89540508                     mov        qword ptr [r13 + r8 + 8], rdx
005bd 4f8b541510                     mov        r10, qword ptr [r13 + r10 + 0x10]
005c2 4d89543d10                     mov        qword ptr [r13 + rdi + 0x10], r10
005c7 4183c310                       add        r11d, 0x10
005cb 443bd9                         cmp        r11d, ecx
005ce 7cd0                           jl         0x7f53ebe74520
005d0 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
005d8 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
005e0 7d29                           jge        0x7f53ebe7458b
005e2 6690                           nop        
005e4 478d141e                       lea        r10d, [r14 + r11]
005e8 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
005f0 4f8b541508                     mov        r10, qword ptr [r13 + r10 + 8]
005f5 458bc3                         mov        r8d, r11d
005f8 4f89540508                     mov        qword ptr [r13 + r8 + 8], r10
005fd 4183c308                       add        r11d, 8
00601 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
00609 7cd9                           jl         0x7f53ebe74564
0060b 03dd                           add        ebx, ebp
0060d 899c24a8000000                 mov        dword ptr [rsp + 0xa8], ebx
00614 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
0061b ffc3                           inc        ebx
0061d 3b5c2438                       cmp        ebx, dword ptr [rsp + 0x38]
00621 0f8da0050000                   jge        0x7f53ebe74b47
00627 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0062f 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
00636 899c24b0000000                 mov        dword ptr [rsp + 0xb0], ebx
0063d 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00642 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
00649 4d8b5cdb08                     mov        r11, qword ptr [r11 + rbx*8 + 8]
0064e 418bdb                         mov        ebx, r11d
00651 81e3ffff0100                   and        ebx, 0x1ffff
00657 4d8bc3                         mov        r8, r11
0065a 49c1e812                       shr        r8, 0x12
0065e 49c1fb24                       sar        r11, 0x24
00662 458bf0                         mov        r14d, r8d
00665 458beb                         mov        r13d, r11d
00668 4181e6ffff0300                 and        r14d, 0x3ffff
0066f 4489742448                     mov        dword ptr [rsp + 0x48], r14d
00674 4585ed                         test       r13d, r13d
00677 0f8c470e0000                   jl         0x7f53ebe75444
0067d 85db                           test       ebx, ebx
0067f 0f8599000000                   jne        0x7f53ebe7469e
00685 33db                           xor        ebx, ebx
00687 4183fd03                       cmp        r13d, 3
0068b 0f8ebf000000                   jle        0x7f53ebe746d0
00691 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00699 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
0069d 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
006a5 45895810                       mov        dword ptr [r8 + 0x10], r11d
006a9 458b4008                       mov        r8d, dword ptr [r8 + 8]
006ad 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
006b5 4589430c                       mov        dword ptr [r11 + 0xc], r8d
006b9 4183c5fd                       add        r13d, -3
006bd 45896b08                       mov        dword ptr [r11 + 8], r13d
006c1 4963ed                         movsxd     rbp, r13d
006c4 4c63d8                         movsxd     r11, eax
006c7 4c035c2420                     add        r11, qword ptr [rsp + 0x20]
006cc 4863d3                         movsxd     rdx, ebx
006cf 4c03da                         add        r11, rdx
006d2 493beb                         cmp        rbp, r11
006d5 0f8f690e0000                   jg         0x7f53ebe754c4
006db 448d3418                       lea        r14d, [rax + rbx]
006df 448974244c                     mov        dword ptr [rsp + 0x4c], r14d
006e4 452bf5                         sub        r14d, r13d
006e7 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
006ec 4585c0                         test       r8d, r8d
006ef 0f85f5fbffff                   jne        0x7f53ebe7426a
006f5 4d63c6                         movsxd     r8, r14d
006f8 4c3b442428                     cmp        r8, qword ptr [rsp + 0x28]
006fd 0f8cad0f0000                   jl         0x7f53ebe75630
00703 483b6c2430                     cmp        rbp, qword ptr [rsp + 0x30]
00708 0f8f0e100000                   jg         0x7f53ebe7569c
0070e 4533c9                         xor        r9d, r9d
00711 44898c24ac000000               mov        dword ptr [rsp + 0xac], r9d
00719 e9e1fbffff                     jmp        0x7f53ebe7427f
0071e 448b0424                       mov        r8d, dword ptr [rsp]
00722 452bc2                         sub        r8d, r10d
00725 413bd8                         cmp        ebx, r8d
00728 0f8e59ffffff                   jle        0x7f53ebe74607
0072e be45ffffff                     mov        esi, 0xffffff45
00733 8beb                           mov        ebp, ebx
00735 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
0073d 666690                         nop        
00740 c5f877                         vzeroupper 
00743 e898efb4ff                     call       0x7f53eb9c3660
00748 0f1f840040080001               nop        dword ptr [rax + rax + 0x1000840]
00750 85db                           test       ebx, ebx
00752 7403                           je         0x7f53ebe746d7
00754 41ffcd                         dec        r13d
00757 4585ed                         test       r13d, r13d
0075a 7511                           jne        0x7f53ebe746ed
0075c 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00764 458b4b08                       mov        r9d, dword ptr [r11 + 8]
00768 e981000000                     jmp        0x7f53ebe7476e
0076d 4183fd03                       cmp        r13d, 3
00771 0f8459170000                   je         0x7f53ebe75e50
00777 4183fd02                       cmp        r13d, 2
0077b 0f87d3170000                   ja         0x7f53ebe75ed4
00781 443bac24e4000000               cmp        r13d, dword ptr [rsp + 0xe4]
00789 0f8364130000                   jae        0x7f53ebe75a73
0078f 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00797 478b4cab08                     mov        r9d, dword ptr [r11 + r13*4 + 8]
0079c 4585ed                         test       r13d, r13d
0079f 7e41                           jle        0x7f53ebe74762
007a1 458d45ff                       lea        r8d, [r13 - 1]
007a5 443b8424e4000000               cmp        r8d, dword ptr [rsp + 0xe4]
007ad 0f8395160000                   jae        0x7f53ebe75dc8
007b3 0f1f8000000000                 nop        dword ptr [rax]
007ba 660f1f440000                   nop        word ptr [rax + rax]
007c0 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
007c8 478b5cab04                     mov        r11d, dword ptr [r11 + r13*4 + 4]
007cd 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
007d5 47895ca808                     mov        dword ptr [r8 + r13*4 + 8], r11d
007da 41ffcd                         dec        r13d
007dd 4585ed                         test       r13d, r13d
007e0 7fde                           jg         0x7f53ebe74740
007e2 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
007ea 45894b08                       mov        dword ptr [r11 + 8], r9d
007ee 458be9                         mov        r13d, r9d
007f1 e9cbfeffff                     jmp        0x7f53ebe74641
007f6 4183fd10                       cmp        r13d, 0x10
007fa 0f8d51080000                   jge        0x7f53ebe74fd1
00800 4183fd08                       cmp        r13d, 8
00804 0f8dc4040000                   jge        0x7f53ebe74c4e
0080a 4183f910                       cmp        r9d, 0x10
0080e 0f8f2b010000                   jg         0x7f53ebe748bf
00814 443b742404                     cmp        r14d, dword ptr [rsp + 4]
00819 0f8374130000                   jae        0x7f53ebe75b13
0081f 430fbe6c3208                   movsx      ebp, byte ptr [r10 + r14 + 8]
00825 3b5c2404                       cmp        ebx, dword ptr [rsp + 4]
00829 0f83cd130000                   jae        0x7f53ebe75b7c
0082f 41886c1a08                     mov        byte ptr [r10 + rbx + 8], bpl
00834 448d5301                       lea        r10d, [rbx + 1]
00838 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0083d 458d5603                       lea        r10d, [r14 + 3]
00841 443b542404                     cmp        r10d, dword ptr [rsp + 4]
00846 0f83fc130000                   jae        0x7f53ebe75bc8
0084c 4d63c6                         movsxd     r8, r14d
0084f 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00857 430fbe6c0309                   movsx      ebp, byte ptr [r11 + r8 + 9]
0085d 448d5303                       lea        r10d, [rbx + 3]
00861 443b542404                     cmp        r10d, dword ptr [rsp + 4]
00866 0f832c140000                   jae        0x7f53ebe75c18
0086c 4863cb                         movsxd     rcx, ebx
0086f 41886c0b09                     mov        byte ptr [r11 + rcx + 9], bpl
00874 470fbe5c030a                   movsx      r11d, byte ptr [r11 + r8 + 0xa]
0087a 8bbc2484000000                 mov        edi, dword ptr [rsp + 0x84]
00881 44885c0f0a                     mov        byte ptr [rdi + rcx + 0xa], r11b
00886 460fbe5c070b                   movsx      r11d, byte ptr [rdi + r8 + 0xb]
0088c 44885c0f0b                     mov        byte ptr [rdi + rcx + 0xb], r11b
00891 4183fd08                       cmp        r13d, 8
00895 0f8349140000                   jae        0x7f53ebe75c64
0089b 49ba283827e300000000           movabs     r10, 0xe3273828
008a5 470374aa08                     add        r14d, dword ptr [r10 + r13*4 + 8]
008aa 4183f904                       cmp        r9d, 4
008ae 7e37                           jle        0x7f53ebe74867
008b0 448d5b04                       lea        r11d, [rbx + 4]
008b4 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
008b9 443b742458                     cmp        r14d, dword ptr [rsp + 0x58]
008be 0f8390140000                   jae        0x7f53ebe75cd4
008c4 458bd6                         mov        r10d, r14d
008c7 4489542460                     mov        dword ptr [rsp + 0x60], r10d
008cc 428b6c1708                     mov        ebp, dword ptr [rdi + r10 + 8]
008d1 443b5c2458                     cmp        r11d, dword ptr [rsp + 0x58]
008d6 0f83e8140000                   jae        0x7f53ebe75d44
008dc 448bd3                         mov        r10d, ebx
008df 4d63da                         movsxd     r11, r10d
008e2 42896c1f0c                     mov        dword ptr [rdi + r11 + 0xc], ebp
008e7 4183f908                       cmp        r9d, 8
008eb 0f8e23fdffff                   jle        0x7f53ebe74594
008f1 448d5b08                       lea        r11d, [rbx + 8]
008f5 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
008fa 49ba503827e300000000           movabs     r10, 0xe3273850
00904 478b5caa08                     mov        r11d, dword ptr [r10 + r13*4 + 8]
00909 452bf3                         sub        r14d, r11d
0090c 418d6e08                       lea        ebp, [r14 + 8]
00910 3b6c2468                       cmp        ebp, dword ptr [rsp + 0x68]
00914 0f83be160000                   jae        0x7f53ebe75f58
0091a 4d63d6                         movsxd     r10, r14d
0091d 4a8b6c1710                     mov        rbp, qword ptr [rdi + r10 + 0x10]
00922 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00927 443b542468                     cmp        r10d, dword ptr [rsp + 0x68]
0092c 0f83e6160000                   jae        0x7f53ebe75f98
00932 4c63d3                         movsxd     r10, ebx
00935 4a896c1710                     mov        qword ptr [rdi + r10 + 0x10], rbp
0093a e9d5fcffff                     jmp        0x7f53ebe74594
0093f 4585f6                         test       r14d, r14d
00942 0f8c04170000                   jl         0x7f53ebe75fcc
00948 85db                           test       ebx, ebx
0094a 0f8cfc160000                   jl         0x7f53ebe75fcc
00950 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00955 443bdb                         cmp        r11d, ebx
00958 0f82ee160000                   jb         0x7f53ebe75fcc
0095e 468d1c2b                       lea        r11d, [rbx + r13]
00962 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00967 448b542404                     mov        r10d, dword ptr [rsp + 4]
0096c 453bd3                         cmp        r10d, r11d
0096f 0f82d7160000                   jb         0x7f53ebe75fcc
00975 4585ed                         test       r13d, r13d
00978 0f8cce160000                   jl         0x7f53ebe75fcc
0097e 4585ed                         test       r13d, r13d
00981 0f84b4f8ffff                   je         0x7f53ebe741bb
00987 4883fd20                       cmp        rbp, 0x20
0098b 7728                           ja         0x7f53ebe74935
0098d 458bd5                         mov        r10d, r13d
00990 4d63d2                         movsxd     r10, r10d
00993 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0099a c442a8f5db                     bzhi       r11, r11, r10
0099f c4c1fb92fb                     kmovq      k7, r11
009a4 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
009aa 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
009b0 e986f8ffff                     jmp        0x7f53ebe741bb
009b5 488bd5                         mov        rdx, rbp
009b8 c5f877                         vzeroupper 
009bb 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
009c5 41ffd2                         call       r10
009c8 0f1f840000000000               nop        dword ptr [rax + rax]
009d0 e966f8ffff                     jmp        0x7f53ebe741bb
009d5 83fb30                         cmp        ebx, 0x30
009d8 0f8e96000000                   jle        0x7f53ebe749f4
009de 4585d2                         test       r10d, r10d
009e1 0f8cd9180000                   jl         0x7f53ebe76240
009e7 85c0                           test       eax, eax
009e9 0f8cd1180000                   jl         0x7f53ebe76240
009ef 448b9c24e0000000               mov        r11d, dword ptr [rsp + 0xe0]
009f7 453bd8                         cmp        r11d, r8d
009fa 0f82c0180000                   jb         0x7f53ebe76240
00a00 448b442404                     mov        r8d, dword ptr [rsp + 4]
00a05 443b44244c                     cmp        r8d, dword ptr [rsp + 0x4c]
00a0a 0f82b0180000                   jb         0x7f53ebe76240
00a10 85db                           test       ebx, ebx
00a12 743d                           je         0x7f53ebe749d1
00a14 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00a19 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00a1e 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00a26 498d740308                     lea        rsi, [r11 + rax + 8]
00a2b 4883fa20                       cmp        rdx, 0x20
00a2f 7729                           ja         0x7f53ebe749da
00a31 4c63d3                         movsxd     r10, ebx
00a34 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00a3b c442a8f5db                     bzhi       r11, r11, r10
00a40 c4c1fb92fb                     kmovq      k7, r11
00a45 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00a4b 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00a51 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
00a55 e92df9ffff                     jmp        0x7f53ebe74307
00a5a c5f877                         vzeroupper 
00a5d 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
00a67 41ffd2                         call       r10
00a6a 0f1f840000000000               nop        dword ptr [rax + rax]
00a72 ebdd                           jmp        0x7f53ebe749d1
00a74 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
00a79 0f8315170000                   jae        0x7f53ebe76114
00a7f 4d63da                         movsxd     r11, r10d
00a82 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
00a87 c4817a6f441808                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 8]
00a8e 3b842490000000                 cmp        eax, dword ptr [rsp + 0x90]
00a95 0f8391170000                   jae        0x7f53ebe761ac
00a9b 448d4810                       lea        r9d, [rax + 0x10]
00a9f 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
00aa4 4863c8                         movsxd     rcx, eax
00aa7 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
00aaf c4c17a7f440908                 vmovdqu    xmmword ptr [r9 + rcx + 8], xmm0
00ab6 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
00abb 443b44244c                     cmp        r8d, dword ptr [rsp + 0x4c]
00ac0 0f8dc7000000                   jge        0x7f53ebe74b0d
00ac6 4c2bd9                         sub        r11, rcx
00ac9 4d63c8                         movsxd     r9, r8d
00acc 48634c2418                     movsxd     rcx, dword ptr [rsp + 0x18]
00ad1 4883c1f1                       add        rcx, -0xf
00ad5 4f8d0419                       lea        r8, [r9 + r11]
00ad9 4c3bc1                         cmp        r8, rcx
00adc 0f835e180000                   jae        0x7f53ebe762c0
00ae2 4c6344244c                     movsxd     r8, dword ptr [rsp + 0x4c]
00ae7 4d2bc1                         sub        r8, r9
00aea 4983c00f                       add        r8, 0xf
00aee 4983e0f0                       and        r8, 0xfffffffffffffff0
00af2 458bc0                         mov        r8d, r8d
00af5 458d4c0010                     lea        r9d, [r8 + rax + 0x10]
00afa 4d63c9                         movsxd     r9, r9d
00afd 4f8d5c19f0                     lea        r11, [r9 + r11 - 0x10]
00b02 4c3bd9                         cmp        r11, rcx
00b05 0f8335180000                   jae        0x7f53ebe762c0
00b0b 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
00b10 443b842490000000               cmp        r8d, dword ptr [rsp + 0x90]
00b18 0f8322180000                   jae        0x7f53ebe762c0
00b1e 4983c1f0                       add        r9, -0x10
00b22 4c3b8c24a0000000               cmp        r9, qword ptr [rsp + 0xa0]
00b2a 0f8310180000                   jae        0x7f53ebe762c0
00b30 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00b35 4181f8f0ffff7f                 cmp        r8d, 0x7ffffff0
00b3c 0f8f5a180000                   jg         0x7f53ebe7631c
00b42 418bca                         mov        ecx, r10d
00b45 2bc8                           sub        ecx, eax
00b47 660f1f840000000000             nop        word ptr [rax + rax]
00b50 448bd9                         mov        r11d, ecx
00b53 44035c245c                     add        r11d, dword ptr [rsp + 0x5c]
00b58 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
00b5d c4817a6f441808                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 8]
00b64 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00b69 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
00b71 c4817a7f441908                 vmovdqu    xmmword ptr [r9 + r11 + 8], xmm0
00b78 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00b7d 4183c310                       add        r11d, 0x10
00b81 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00b86 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
00b8b 7cc3                           jl         0x7f53ebe74ad0
00b8d 468d1c13                       lea        r11d, [rbx + r10]
00b91 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
00b95 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00b9d e9e5f7ffff                     jmp        0x7f53ebe74307
00ba2 4c63d5                         movsxd     r10, ebp
00ba5 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00bac c442a8f5db                     bzhi       r11, r11, r10
00bb1 c4c1fb92fb                     kmovq      k7, r11
00bb6 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00bbc 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00bc2 e9a4000000                     jmp        0x7f53ebe74beb
00bc7 8b2c24                         mov        ebp, dword ptr [rsp]
00bca 2bac2494000000                 sub        ebp, dword ptr [rsp + 0x94]
00bd1 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00bd9 4585d2                         test       r10d, r10d
00bdc 0f8c62150000                   jl         0x7f53ebe760c4
00be2 488b5c2478                     mov        rbx, qword ptr [rsp + 0x78]
00be7 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00bec 8bb424e0000000                 mov        esi, dword ptr [rsp + 0xe0]
00bf3 448bb42484000000               mov        r14d, dword ptr [rsp + 0x84]
00bfb 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
00c03 4585c9                         test       r9d, r9d
00c06 0f8c52150000                   jl         0x7f53ebe760de
00c0c 3b3424                         cmp        esi, dword ptr [rsp]
00c0f 0f8249150000                   jb         0x7f53ebe760de
00c15 418b4e04                       mov        ecx, dword ptr [r14 + 4]
00c19 448bac24a8000000               mov        r13d, dword ptr [rsp + 0xa8]
00c21 4403ed                         add        r13d, ebp
00c24 413bcd                         cmp        ecx, r13d
00c27 0f8231150000                   jb         0x7f53ebe760de
00c2d 85ed                           test       ebp, ebp
00c2f 0f8c29150000                   jl         0x7f53ebe760de
00c35 85ed                           test       ebp, ebp
00c37 7432                           je         0x7f53ebe74beb
00c39 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00c3e 4d8bd6                         mov        r10, r14
00c41 4b8d740e08                     lea        rsi, [r14 + r9 + 8]
00c46 4863d5                         movsxd     rdx, ebp
00c49 4883fa20                       cmp        rdx, 0x20
00c4d 0f864fffffff                   jbe        0x7f53ebe74b22
00c53 c5f877                         vzeroupper 
00c56 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
00c60 41ffd2                         call       r10
00c63 0f1f840000000000               nop        dword ptr [rax + rax]
00c6b 44896b38                       mov        dword ptr [rbx + 0x38], r13d
00c6f c5f877                         vzeroupper 
00c72 4881c4d0000000                 add        rsp, 0xd0
00c79 5d                             pop        rbp
00c7a 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00c7e 0f87b01a0000                   ja         0x7f53ebe766b4
00c84 c3                             ret        
00c85 418bea                         mov        ebp, r10d
00c88 896c2440                       mov        dword ptr [rsp + 0x40], ebp
00c8c 448bd8                         mov        r11d, eax
00c8f 44035c2440                     add        r11d, dword ptr [rsp + 0x40]
00c94 62b17e486f841b08000000         vmovdqu32  zmm0, zmmword ptr [rbx + r11 + 8]
00c9f 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00ca4 62b17e487f841308000000         vmovdqu32  zmmword ptr [rbx + r10 + 8], zmm0
00caf 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00cb4 4183c240                       add        r10d, 0x40
00cb8 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00cbd 443bd1                         cmp        r10d, ecx
00cc0 7cca                           jl         0x7f53ebe74c0c
00cc2 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
00cc9 e924030000                     jmp        0x7f53ebe74f72
00cce 443b742468                     cmp        r14d, dword ptr [rsp + 0x68]
00cd3 0f831f170000                   jae        0x7f53ebe76378
00cd9 458bd6                         mov        r10d, r14d
00cdc 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00ce1 4963ca                         movsxd     rcx, r10d
00ce4 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
00cec 4d8b540d08                     mov        r10, qword ptr [r13 + rcx + 8]
00cf1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00cf6 3b5c2468                       cmp        ebx, dword ptr [rsp + 0x68]
00cfa 0f835c170000                   jae        0x7f53ebe763dc
00d00 448bcb                         mov        r9d, ebx
00d03 418d6908                       lea        ebp, [r9 + 8]
00d07 896c2440                       mov        dword ptr [rsp + 0x40], ebp
00d0b 4d63d1                         movsxd     r10, r9d
00d0e 4c8b5c2460                     mov        r11, qword ptr [rsp + 0x60]
00d13 4f895c1508                     mov        qword ptr [r13 + r10 + 8], r11
00d18 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
00d1f 0f8deff8ffff                   jge        0x7f53ebe74594
00d25 492bca                         sub        rcx, r10
00d28 4863d5                         movsxd     rdx, ebp
00d2b 4c8d140a                       lea        r10, [rdx + rcx]
00d2f 4c3b942498000000               cmp        r10, qword ptr [rsp + 0x98]
00d37 0f837f170000                   jae        0x7f53ebe7643c
00d3d 4d8bd0                         mov        r10, r8
00d40 4c2bd2                         sub        r10, rdx
00d43 4983c207                       add        r10, 7
00d47 4983e2f8                       and        r10, 0xfffffffffffffff8
00d4b 458bd2                         mov        r10d, r10d
00d4e 478d5c0a08                     lea        r11d, [r10 + r9 + 8]
00d53 4d63d3                         movsxd     r10, r11d
00d56 4d8d5c0af8                     lea        r11, [r10 + rcx - 8]
00d5b 4c3b9c2498000000               cmp        r11, qword ptr [rsp + 0x98]
00d63 0f8353170000                   jae        0x7f53ebe7643c
00d69 3b6c2468                       cmp        ebp, dword ptr [rsp + 0x68]
00d6d 0f8349170000                   jae        0x7f53ebe7643c
00d73 4983c2f8                       add        r10, -8
00d77 4c3b942498000000               cmp        r10, qword ptr [rsp + 0x98]
00d7f 0f8337170000                   jae        0x7f53ebe7643c
00d85 448bac24a8000000               mov        r13d, dword ptr [rsp + 0xa8]
00d8d 4181fdf8ffff7f                 cmp        r13d, 0x7ffffff8
00d94 0f8fa2170000                   jg         0x7f53ebe764bc
00d9a 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
00d9e 412be9                         sub        ebp, r9d
00da1 8bc5                           mov        eax, ebp
00da3 bff8ffffff                     mov        edi, 0xfffffff8
00da8 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
00db0 458bdd                         mov        r11d, r13d
00db3 412bfb                         sub        edi, r11d
00db6 412bf9                         sub        edi, r9d
00db9 4183c110                       add        r9d, 0x10
00dbd 83c7f0                         add        edi, -0x10
00dc0 4d8d50c8                       lea        r10, [r8 - 0x38]
00dc4 4981fa00000080                 cmp        r10, -0x80000000
00dcb 49c7c300000080                 mov        r11, 0xffffffff80000000
00dd2 4d0f4cd3                       cmovl      r10, r11
00dd6 418bca                         mov        ecx, r10d
00dd9 442bf3                         sub        r14d, ebx
00ddc 4d63d9                         movsxd     r11, r9d
00ddf 488b5c2410                     mov        rbx, qword ptr [rsp + 0x10]
00de4 41ba06000000                   mov        r10d, 6
00dea c462a8f5d7                     bzhi       r10, rdi, r10
00def 4d03da                         add        r11, r10
00df2 4d3bd8                         cmp        r11, r8
00df5 498bf8                         mov        rdi, r8
00df8 490f4cfb                       cmovl      rdi, r11
00dfc 4c8bd7                         mov        r10, rdi
00dff 4c2bd2                         sub        r10, rdx
00e02 4d8d5aff                       lea        r11, [r10 - 1]
00e06 49c1fb3f                       sar        r11, 0x3f
00e0a 49c1eb3d                       shr        r11, 0x3d
00e0e 4f8d5413ff                     lea        r10, [r11 + r10 - 1]
00e13 4983e2f8                       and        r10, 0xfffffffffffffff8
00e17 4c03d2                         add        r10, rdx
00e1a 493bd2                         cmp        rdx, r10
00e1d 490f4cd2                       cmovl      rdx, r10
00e21 448bda                         mov        r11d, edx
00e24 478d541e08                     lea        r10d, [r14 + r11 + 8]
00e29 4183c308                       add        r11d, 8
00e2d 4963d2                         movsxd     rdx, r10d
00e30 4803d3                         add        rdx, rbx
00e33 4963f3                         movsxd     rsi, r11d
00e36 4803f3                         add        rsi, rbx
00e39 4c8d5208                       lea        r10, [rdx + 8]
00e3d 4883c248                       add        rdx, 0x48
00e41 488d5e48                       lea        rbx, [rsi + 0x48]
00e45 4533db                         xor        r11d, r11d
00e48 493bda                         cmp        rbx, r10
00e4b 410f96c3                       setbe      r11b
00e4f 4883c608                       add        rsi, 8
00e53 4533d2                         xor        r10d, r10d
00e56 483bd6                         cmp        rdx, rsi
00e59 410f96c2                       setbe      r10b
00e5d 450bda                         or         r11d, r10d
00e60 0f84720b0000                   je         0x7f53ebe75958
00e66 448bd7                         mov        r10d, edi
00e69 666690                         nop        
00e6c 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
00e71 448bd8                         mov        r11d, eax
00e74 44035c2440                     add        r11d, dword ptr [rsp + 0x40]
00e79 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
00e80 4e8b5c1b08                     mov        r11, qword ptr [rbx + r11 + 8]
00e85 4e895c0b08                     mov        qword ptr [rbx + r9 + 8], r11
00e8a 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
00e8f 4183c108                       add        r9d, 8
00e93 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
00e98 458bd9                         mov        r11d, r9d
00e9b 453bca                         cmp        r9d, r10d
00e9e 7ccc                           jl         0x7f53ebe74dec
00ea0 4981c008feffff                 add        r8, -0x1f8
00ea7 4981f800000080                 cmp        r8, -0x80000000
00eae 49c7c200000080                 mov        r10, 0xffffffff80000000
00eb5 4d0f4cc2                       cmovl      r8, r10
00eb9 458bc8                         mov        r9d, r8d
00ebc 453bd9                         cmp        r11d, r9d
00ebf 0f8d2d010000                   jge        0x7f53ebe74f72
00ec5 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00eca 660f1f440000                   nop        word ptr [rax + rax]
00ed0 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00ed5 4963d2                         movsxd     rdx, r10d
00ed8 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00edd 448bc0                         mov        r8d, eax
00ee0 4403442440                     add        r8d, dword ptr [rsp + 0x40]
00ee5 8b7c2440                       mov        edi, dword ptr [rsp + 0x40]
00ee9 83c740                         add        edi, 0x40
00eec 03f8                           add        edi, eax
00eee 458bd8                         mov        r11d, r8d
00ef1 62b17e486f841b08000000         vmovdqu32  zmm0, zmmword ptr [rbx + r11 + 8]
00efc 62b17e487f841308000000         vmovdqu32  zmmword ptr [rbx + r10 + 8], zmm0
00f07 62f17e486f843b08000000         vmovdqu32  zmm0, zmmword ptr [rbx + rdi + 8]
00f12 62f17e487f841348000000         vmovdqu32  zmmword ptr [rbx + rdx + 0x48], zmm0
00f1d 4d63d0                         movsxd     r10, r8d
00f20 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00f25 4181c380000000                 add        r11d, 0x80
00f2c 4403d8                         add        r11d, eax
00f2f 62b17e486f841b08000000         vmovdqu32  zmm0, zmmword ptr [rbx + r11 + 8]
00f3a 62f17e487f841388000000         vmovdqu32  zmmword ptr [rbx + rdx + 0x88], zmm0
00f45 62b17e486f8413c8000000         vmovdqu32  zmm0, zmmword ptr [rbx + r10 + 0xc8]
00f50 62f17e487f8413c8000000         vmovdqu32  zmmword ptr [rbx + rdx + 0xc8], zmm0
00f5b 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00f60 4181c300010000                 add        r11d, 0x100
00f67 4403d8                         add        r11d, eax
00f6a 458bc3                         mov        r8d, r11d
00f6d 62b17e486f841b08000000         vmovdqu32  zmm0, zmmword ptr [rbx + r11 + 8]
00f78 62f17e487f841308010000         vmovdqu32  zmmword ptr [rbx + rdx + 0x108], zmm0
00f83 62b17e486f841348010000         vmovdqu32  zmm0, zmmword ptr [rbx + r10 + 0x148]
00f8e 62f17e487f841348010000         vmovdqu32  zmmword ptr [rbx + rdx + 0x148], zmm0
00f99 62b17e486f841388010000         vmovdqu32  zmm0, zmmword ptr [rbx + r10 + 0x188]
00fa4 62f17e487f841388010000         vmovdqu32  zmmword ptr [rbx + rdx + 0x188], zmm0
00faf 4d63d0                         movsxd     r10, r8d
00fb2 62b17e486f8413c8000000         vmovdqu32  zmm0, zmmword ptr [rbx + r10 + 0xc8]
00fbd 62f17e487f8413c8010000         vmovdqu32  zmmword ptr [rbx + rdx + 0x1c8], zmm0
00fc8 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00fcd 4181c200020000                 add        r10d, 0x200
00fd4 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00fd9 453bd1                         cmp        r10d, r9d
00fdc 0f8ceefeffff                   jl         0x7f53ebe74e50
00fe2 443bd1                         cmp        r10d, ecx
00fe5 0f8c9afcffff                   jl         0x7f53ebe74c05
00feb 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
00ff2 8b6c2440                       mov        ebp, dword ptr [rsp + 0x40]
00ff6 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
00ffd 0f8d11f6ffff                   jge        0x7f53ebe74594
01003 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01008 468d1c00                       lea        r11d, [rax + r8]
0100c 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
01013 4e8b5c1b08                     mov        r11, qword ptr [rbx + r11 + 8]
01018 458bd0                         mov        r10d, r8d
0101b 4e895c1308                     mov        qword ptr [rbx + r10 + 8], r11
01020 4183c008                       add        r8d, 8
01024 443b8424a8000000               cmp        r8d, dword ptr [rsp + 0xa8]
0102c 7cda                           jl         0x7f53ebe74f88
0102e e9e1f5ffff                     jmp        0x7f53ebe74594
01033 4903cb                         add        rcx, r11
01036 483bcf                         cmp        rcx, rdi
01039 7e08                           jle        0x7f53ebe74fc3
0103b 4533c9                         xor        r9d, r9d
0103e e95df0ffff                     jmp        0x7f53ebe74020
01043 4533c9                         xor        r9d, r9d
01046 41bd01000000                   mov        r13d, 1
0104c e952f0ffff                     jmp        0x7f53ebe74023
01051 443bb42490000000               cmp        r14d, dword ptr [rsp + 0x90]
01059 0f834d150000                   jae        0x7f53ebe7652c
0105f 4d63ce                         movsxd     r9, r14d
01062 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
01069 3b9c2490000000                 cmp        ebx, dword ptr [rsp + 0x90]
01070 0f839a150000                   jae        0x7f53ebe76590
01076 8d6b10                         lea        ebp, [rbx + 0x10]
01079 4c63db                         movsxd     r11, ebx
0107c c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
01083 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
0108a 0f8d84f5ffff                   jge        0x7f53ebe74594
01090 4d2bcb                         sub        r9, r11
01093 4c63dd                         movsxd     r11, ebp
01096 4f8d140b                       lea        r10, [r11 + r9]
0109a 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
010a2 0f83d4150000                   jae        0x7f53ebe765fc
010a8 4d8bd0                         mov        r10, r8
010ab 4d2bd3                         sub        r10, r11
010ae 4983c20f                       add        r10, 0xf
010b2 4983e2f0                       and        r10, 0xfffffffffffffff0
010b6 458bda                         mov        r11d, r10d
010b9 458d541b10                     lea        r10d, [r11 + rbx + 0x10]
010be 4d63d2                         movsxd     r10, r10d
010c1 4f8d5c0af0                     lea        r11, [r10 + r9 - 0x10]
010c6 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
010ce 0f83a8150000                   jae        0x7f53ebe765fc
010d4 3bac2490000000                 cmp        ebp, dword ptr [rsp + 0x90]
010db 0f839b150000                   jae        0x7f53ebe765fc
010e1 4983c2f0                       add        r10, -0x10
010e5 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
010ed 0f8389150000                   jae        0x7f53ebe765fc
010f3 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
010fb 4181fbf0ffff7f                 cmp        r11d, 0x7ffffff0
01102 0f8fbc150000                   jg         0x7f53ebe76644
01108 442bf3                         sub        r14d, ebx
0110b 83c320                         add        ebx, 0x20
0110e 6690                           nop        
01110 458d1c2e                       lea        r11d, [r14 + rbp]
01114 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
0111c c4817a6f441d08                 vmovdqu    xmm0, xmmword ptr [r13 + r11 + 8]
01123 448bd5                         mov        r10d, ebp
01126 c4817a7f441508                 vmovdqu    xmmword ptr [r13 + r10 + 8], xmm0
0112d 83c510                         add        ebp, 0x10
01130 3beb                           cmp        ebp, ebx
01132 7cdc                           jl         0x7f53ebe75090
01134 4981c010ffffff                 add        r8, -0xf0
0113b 4981f800000080                 cmp        r8, -0x80000000
01142 49c7c200000080                 mov        r10, 0xffffffff80000000
01149 4d0f4cc2                       cmovl      r8, r10
0114d 458bc8                         mov        r9d, r8d
01150 413be9                         cmp        ebp, r9d
01153 0f8d31010000                   jge        0x7f53ebe7520a
01159 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
01160 458d042e                       lea        r8d, [r14 + rbp]
01164 448bdd                         mov        r11d, ebp
01167 4963cb                         movsxd     rcx, r11d
0116a 458bd0                         mov        r10d, r8d
0116d c4a17a6f441308                 vmovdqu    xmm0, xmmword ptr [rbx + r10 + 8]
01174 4d63d0                         movsxd     r10, r8d
01177 448bdd                         mov        r11d, ebp
0117a c4a17a7f441b08                 vmovdqu    xmmword ptr [rbx + r11 + 8], xmm0
01181 c4a17a6f441318                 vmovdqu    xmm0, xmmword ptr [rbx + r10 + 0x18]
01188 c5fa7f440b18                   vmovdqu    xmmword ptr [rbx + rcx + 0x18], xmm0
0118e c4a17a6f441328                 vmovdqu    xmm0, xmmword ptr [rbx + r10 + 0x28]
01195 c5fa7f440b28                   vmovdqu    xmmword ptr [rbx + rcx + 0x28], xmm0
0119b c4a17a6f441338                 vmovdqu    xmm0, xmmword ptr [rbx + r10 + 0x38]
011a2 c5fa7f440b38                   vmovdqu    xmmword ptr [rbx + rcx + 0x38], xmm0
011a8 c4a17a6f441348                 vmovdqu    xmm0, xmmword ptr [rbx + r10 + 0x48]
011af c5fa7f440b48                   vmovdqu    xmmword ptr [rbx + rcx + 0x48], xmm0
011b5 c4a17a6f441358                 vmovdqu    xmm0, xmmword ptr [rbx + r10 + 0x58]
011bc c5fa7f440b58                   vmovdqu    xmmword ptr [rbx + rcx + 0x58], xmm0
011c2 c4a17a6f441368                 vmovdqu    xmm0, xmmword ptr [rbx + r10 + 0x68]
011c9 c5fa7f440b68                   vmovdqu    xmmword ptr [rbx + rcx + 0x68], xmm0
011cf c4a17a6f441378                 vmovdqu    xmm0, xmmword ptr [rbx + r10 + 0x78]
011d6 c5fa7f440b78                   vmovdqu    xmmword ptr [rbx + rcx + 0x78], xmm0
011dc c4a17a6f841388000000           vmovdqu    xmm0, xmmword ptr [rbx + r10 + 0x88]
011e6 c5fa7f840b88000000             vmovdqu    xmmword ptr [rbx + rcx + 0x88], xmm0
011ef c4a17a6f841398000000           vmovdqu    xmm0, xmmword ptr [rbx + r10 + 0x98]
011f9 c5fa7f840b98000000             vmovdqu    xmmword ptr [rbx + rcx + 0x98], xmm0
01202 c4a17a6f8413a8000000           vmovdqu    xmm0, xmmword ptr [rbx + r10 + 0xa8]
0120c c5fa7f840ba8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xa8], xmm0
01215 c4a17a6f8413b8000000           vmovdqu    xmm0, xmmword ptr [rbx + r10 + 0xb8]
0121f c5fa7f840bb8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xb8], xmm0
01228 c4a17a6f8413c8000000           vmovdqu    xmm0, xmmword ptr [rbx + r10 + 0xc8]
01232 c5fa7f840bc8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xc8], xmm0
0123b c4a17a6f8413d8000000           vmovdqu    xmm0, xmmword ptr [rbx + r10 + 0xd8]
01245 c5fa7f840bd8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xd8], xmm0
0124e c4a17a6f8413e8000000           vmovdqu    xmm0, xmmword ptr [rbx + r10 + 0xe8]
01258 c5fa7f840be8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xe8], xmm0
01261 c4a17a6f8413f8000000           vmovdqu    xmm0, xmmword ptr [rbx + r10 + 0xf8]
0126b c5fa7f840bf8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xf8], xmm0
01274 81c500010000                   add        ebp, 0x100
0127a 413be9                         cmp        ebp, r9d
0127d 0f8cddfeffff                   jl         0x7f53ebe750e0
01283 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
0128a 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
01291 0f8d7df3ffff                   jge        0x7f53ebe74594
01297 90                             nop        
01298 458d1c2e                       lea        r11d, [r14 + rbp]
0129c 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
012a3 c4a17a6f441b08                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 8]
012aa 448bd5                         mov        r10d, ebp
012ad c4a17a7f441308                 vmovdqu    xmmword ptr [rbx + r10 + 8], xmm0
012b4 83c510                         add        ebp, 0x10
012b7 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
012be 7cd8                           jl         0x7f53ebe75218
012c0 e94ff3ffff                     jmp        0x7f53ebe74594
012c5 bee4ffffff                     mov        esi, 0xffffffe4
012ca 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
012cf 448b1c24                       mov        r11d, dword ptr [rsp]
012d3 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
012db 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
012e0 4c891c24                       mov        qword ptr [rsp], r11
012e4 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
012e9 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
012f1 8944240c                       mov        dword ptr [rsp + 0xc], eax
012f5 48ff742420                     push       qword ptr [rsp + 0x20]
012fa 488f442418                     pop        qword ptr [rsp + 0x18]
012ff 48ff742428                     push       qword ptr [rsp + 0x28]
01304 488f442420                     pop        qword ptr [rsp + 0x20]
01309 48ff742430                     push       qword ptr [rsp + 0x30]
0130e 488f442428                     pop        qword ptr [rsp + 0x28]
01313 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01317 48894424f8                     mov        qword ptr [rsp - 8], rax
0131c 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01320 89442440                       mov        dword ptr [rsp + 0x40], eax
01324 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01329 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
0132e 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01333 90                             nop        
01334 c5f877                         vzeroupper 
01337 e8a4e3b4ff                     call       0x7f53eb9c3660
0133c 0f1f840034140002               nop        dword ptr [rax + rax + 0x2001434]
01344 bee4ffffff                     mov        esi, 0xffffffe4
01349 498beb                         mov        rbp, r11
0134c 448b0424                       mov        r8d, dword ptr [rsp]
01350 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
01358 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0135d 4c891c24                       mov        qword ptr [rsp], r11
01361 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01366 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
0136e 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01373 48ff742420                     push       qword ptr [rsp + 0x20]
01378 488f442418                     pop        qword ptr [rsp + 0x18]
0137d 48ff742428                     push       qword ptr [rsp + 0x28]
01382 488f442420                     pop        qword ptr [rsp + 0x20]
01387 48ff742430                     push       qword ptr [rsp + 0x30]
0138c 488f442428                     pop        qword ptr [rsp + 0x28]
01391 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01395 48894424f8                     mov        qword ptr [rsp - 8], rax
0139a 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0139e 89442440                       mov        dword ptr [rsp + 0x40], eax
013a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013a7 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
013ac 8944244c                       mov        dword ptr [rsp + 0x4c], eax
013b0 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
013b6 6690                           nop        
013b8 c5f877                         vzeroupper 
013bb e820e3b4ff                     call       0x7f53eb9c3660
013c0 0f1f8400b8140003               nop        dword ptr [rax + rax + 0x30014b8]
013c8 bee4ffffff                     mov        esi, 0xffffffe4
013cd 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
013d2 448b1424                       mov        r10d, dword ptr [rsp]
013d6 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
013de 4c8b542408                     mov        r10, qword ptr [rsp + 8]
013e3 4c891424                       mov        qword ptr [rsp], r10
013e7 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
013ec 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
013f4 895c240c                       mov        dword ptr [rsp + 0xc], ebx
013f8 48ff742420                     push       qword ptr [rsp + 0x20]
013fd 488f442418                     pop        qword ptr [rsp + 0x18]
01402 48ff742428                     push       qword ptr [rsp + 0x28]
01407 488f442420                     pop        qword ptr [rsp + 0x20]
0140c 48ff742430                     push       qword ptr [rsp + 0x30]
01411 488f442428                     pop        qword ptr [rsp + 0x28]
01416 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
0141b 4489742444                     mov        dword ptr [rsp + 0x44], r14d
01420 c5f877                         vzeroupper 
01423 e8b8e2b4ff                     call       0x7f53eb9c3660
01428 0f1f840020150004               nop        dword ptr [rax + rax + 0x4001520]
01430 bee4ffffff                     mov        esi, 0xffffffe4
01435 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0143a 448b1c24                       mov        r11d, dword ptr [rsp]
0143e 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01446 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0144b 4c891424                       mov        qword ptr [rsp], r10
0144f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01454 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
0145c 48ff742420                     push       qword ptr [rsp + 0x20]
01461 488f442418                     pop        qword ptr [rsp + 0x18]
01466 48ff742428                     push       qword ptr [rsp + 0x28]
0146b 488f442420                     pop        qword ptr [rsp + 0x20]
01470 48ff742430                     push       qword ptr [rsp + 0x30]
01475 488f442428                     pop        qword ptr [rsp + 0x28]
0147a 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
0147f 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01483 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
01489 666690                         nop        
0148c c5f877                         vzeroupper 
0148f e84ce2b4ff                     call       0x7f53eb9c3660
01494 0f1f84008c150005               nop        dword ptr [rax + rax + 0x500158c]
0149c be45ffffff                     mov        esi, 0xffffff45
014a1 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
014a9 4489ac24e8000000               mov        dword ptr [rsp + 0xe8], r13d
014b1 666690                         nop        
014b4 c5f877                         vzeroupper 
014b7 e824e2b4ff                     call       0x7f53eb9c3660
014bc 0f1f8400b4150006               nop        dword ptr [rax + rax + 0x60015b4]
014c4 be45ffffff                     mov        esi, 0xffffff45
014c9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
014ce 448b1c24                       mov        r11d, dword ptr [rsp]
014d2 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
014da 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
014df 4c891c24                       mov        qword ptr [rsp], r11
014e3 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
014e8 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
014f0 8944240c                       mov        dword ptr [rsp + 0xc], eax
014f4 4489542410                     mov        dword ptr [rsp + 0x10], r10d
014f9 48ff742420                     push       qword ptr [rsp + 0x20]
014fe 488f442418                     pop        qword ptr [rsp + 0x18]
01503 48894424f8                     mov        qword ptr [rsp - 8], rax
01508 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0150c 89442414                       mov        dword ptr [rsp + 0x14], eax
01510 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01515 48ff742428                     push       qword ptr [rsp + 0x28]
0151a 488f442420                     pop        qword ptr [rsp + 0x20]
0151f 48ff742430                     push       qword ptr [rsp + 0x30]
01524 488f442428                     pop        qword ptr [rsp + 0x28]
01529 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0152d 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
01532 6690                           nop        
01534 c5f877                         vzeroupper 
01537 e8a4e1b4ff                     call       0x7f53eb9c3660
0153c 0f1f840034160007               nop        dword ptr [rax + rax + 0x7001634]
01544 493beb                         cmp        rbp, r11
01547 bdffffffff                     mov        ebp, 0xffffffff
0154c 7c08                           jl         0x7f53ebe754d6
0154e 400f95c5                       setne      bpl
01552 400fb6ed                       movzx      ebp, bpl
01556 be45ffffff                     mov        esi, 0xffffff45
0155b 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01560 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
01568 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0156d 4489442404                     mov        dword ptr [rsp + 4], r8d
01572 89442414                       mov        dword ptr [rsp + 0x14], eax
01576 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0157b 48894424f8                     mov        qword ptr [rsp - 8], rax
01580 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01584 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01588 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0158d 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01591 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01596 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
0159b 90                             nop        
0159c c5f877                         vzeroupper 
0159f e83ce1b4ff                     call       0x7f53eb9c3660
015a4 0f1f84009c160008               nop        dword ptr [rax + rax + 0x800169c]
015ac be45ffffff                     mov        esi, 0xffffff45
015b1 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
015b6 448b0424                       mov        r8d, dword ptr [rsp]
015ba 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
015c2 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
015c7 4c891c24                       mov        qword ptr [rsp], r11
015cb 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
015d0 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
015d8 8944240c                       mov        dword ptr [rsp + 0xc], eax
015dc 4489542410                     mov        dword ptr [rsp + 0x10], r10d
015e1 48ff742420                     push       qword ptr [rsp + 0x20]
015e6 488f442418                     pop        qword ptr [rsp + 0x18]
015eb 48ff742428                     push       qword ptr [rsp + 0x28]
015f0 488f442420                     pop        qword ptr [rsp + 0x20]
015f5 48ff742430                     push       qword ptr [rsp + 0x30]
015fa 488f442428                     pop        qword ptr [rsp + 0x28]
015ff 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01603 48894424f8                     mov        qword ptr [rsp - 8], rax
01608 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0160c 89442440                       mov        dword ptr [rsp + 0x40], eax
01610 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01615 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
0161a 894c2448                       mov        dword ptr [rsp + 0x48], ecx
0161e 6690                           nop        
01620 c5f877                         vzeroupper 
01623 e8b8e0b4ff                     call       0x7f53eb9c3660
01628 0f1f840020170009               nop        dword ptr [rax + rax + 0x9001720]
01630 be45ffffff                     mov        esi, 0xffffff45
01635 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0163a 448b1c24                       mov        r11d, dword ptr [rsp]
0163e 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01646 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0164b 4c891c24                       mov        qword ptr [rsp], r11
0164f 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01654 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
0165c 8944240c                       mov        dword ptr [rsp + 0xc], eax
01660 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01665 48ff742420                     push       qword ptr [rsp + 0x20]
0166a 488f442418                     pop        qword ptr [rsp + 0x18]
0166f 48ff742428                     push       qword ptr [rsp + 0x28]
01674 488f442420                     pop        qword ptr [rsp + 0x20]
01679 48ff742430                     push       qword ptr [rsp + 0x30]
0167e 488f442428                     pop        qword ptr [rsp + 0x28]
01683 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01687 48894424f8                     mov        qword ptr [rsp - 8], rax
0168c 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01690 89442440                       mov        dword ptr [rsp + 0x40], eax
01694 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01699 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
0169e 6690                           nop        
016a0 c5f877                         vzeroupper 
016a3 e838e0b4ff                     call       0x7f53eb9c3660
016a8 0f1f8400a017000a               nop        dword ptr [rax + rax + 0xa0017a0]
016b0 4c8b4c2428                     mov        r9, qword ptr [rsp + 0x28]
016b5 4d3bc1                         cmp        r8, r9
016b8 bdffffffff                     mov        ebp, 0xffffffff
016bd 7c08                           jl         0x7f53ebe75647
016bf 400f95c5                       setne      bpl
016c3 400fb6ed                       movzx      ebp, bpl
016c7 be45ffffff                     mov        esi, 0xffffff45
016cc 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
016d1 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
016d9 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
016de 4489442404                     mov        dword ptr [rsp + 4], r8d
016e3 89442414                       mov        dword ptr [rsp + 0x14], eax
016e7 4489542418                     mov        dword ptr [rsp + 0x18], r10d
016ec 895c2440                       mov        dword ptr [rsp + 0x40], ebx
016f0 48894424f8                     mov        qword ptr [rsp - 8], rax
016f5 8b442448                       mov        eax, dword ptr [rsp + 0x48]
016f9 89442444                       mov        dword ptr [rsp + 0x44], eax
016fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01702 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
01707 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
0170c c5f877                         vzeroupper 
0170f e8ccdfb4ff                     call       0x7f53eb9c3660
01714 0f1f84000c18000b               nop        dword ptr [rax + rax + 0xb00180c]
0171c 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
01721 493be8                         cmp        rbp, r8
01724 bdffffffff                     mov        ebp, 0xffffffff
01729 7c08                           jl         0x7f53ebe756b3
0172b 400f95c5                       setne      bpl
0172f 400fb6ed                       movzx      ebp, bpl
01733 be45ffffff                     mov        esi, 0xffffff45
01738 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
0173d 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
01745 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0174a 4489442404                     mov        dword ptr [rsp + 4], r8d
0174f 89442414                       mov        dword ptr [rsp + 0x14], eax
01753 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01758 895c2440                       mov        dword ptr [rsp + 0x40], ebx
0175c 48894424f8                     mov        qword ptr [rsp - 8], rax
01761 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01765 89442444                       mov        dword ptr [rsp + 0x44], eax
01769 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0176e 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
01773 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
01778 c5f877                         vzeroupper 
0177b e860dfb4ff                     call       0x7f53eb9c3660
01780 0f1f84007818000c               nop        dword ptr [rax + rax + 0xc001878]
01788 bee4ffffff                     mov        esi, 0xffffffe4
0178d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01792 448b1424                       mov        r10d, dword ptr [rsp]
01796 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
0179e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
017a3 4c891424                       mov        qword ptr [rsp], r10
017a7 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
017ac 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
017b4 48ff742420                     push       qword ptr [rsp + 0x20]
017b9 488f442418                     pop        qword ptr [rsp + 0x18]
017be 48ff742428                     push       qword ptr [rsp + 0x28]
017c3 488f442420                     pop        qword ptr [rsp + 0x20]
017c8 48ff742430                     push       qword ptr [rsp + 0x30]
017cd 488f442428                     pop        qword ptr [rsp + 0x28]
017d2 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
017d7 895c2444                       mov        dword ptr [rsp + 0x44], ebx
017db 895c2450                       mov        dword ptr [rsp + 0x50], ebx
017df 4489742458                     mov        dword ptr [rsp + 0x58], r14d
017e4 c5f877                         vzeroupper 
017e7 e8f4deb4ff                     call       0x7f53eb9c3660
017ec 0f1f8400e418000d               nop        dword ptr [rax + rax + 0xd0018e4]
017f4 bee4ffffff                     mov        esi, 0xffffffe4
017f9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
017fe 448b1c24                       mov        r11d, dword ptr [rsp]
01802 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0180a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0180f 4c891424                       mov        qword ptr [rsp], r10
01813 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01818 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01820 48ff742420                     push       qword ptr [rsp + 0x20]
01825 488f442418                     pop        qword ptr [rsp + 0x18]
0182a 48ff742428                     push       qword ptr [rsp + 0x28]
0182f 488f442420                     pop        qword ptr [rsp + 0x20]
01834 48ff742430                     push       qword ptr [rsp + 0x30]
01839 488f442428                     pop        qword ptr [rsp + 0x28]
0183e 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01843 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01847 4489742448                     mov        dword ptr [rsp + 0x48], r14d
0184c 48894c2450                     mov        qword ptr [rsp + 0x50], rcx
01851 895c2458                       mov        dword ptr [rsp + 0x58], ebx
01855 666690                         nop        
01858 c5f877                         vzeroupper 
0185b e880deb4ff                     call       0x7f53eb9c3660
01860 0f1f84005819000e               nop        dword ptr [rax + rax + 0xe001958]
01868 4183c608                       add        r14d, 8
0186c be6effffff                     mov        esi, 0xffffff6e
01871 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01876 448b0424                       mov        r8d, dword ptr [rsp]
0187a 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
01882 4c8b442408                     mov        r8, qword ptr [rsp + 8]
01887 4c890424                       mov        qword ptr [rsp], r8
0188b 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
0188f 898c24e4000000                 mov        dword ptr [rsp + 0xe4], ecx
01896 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0189b 48ff742420                     push       qword ptr [rsp + 0x20]
018a0 488f442418                     pop        qword ptr [rsp + 0x18]
018a5 48ff742428                     push       qword ptr [rsp + 0x28]
018aa 488f442420                     pop        qword ptr [rsp + 0x20]
018af 48ff742430                     push       qword ptr [rsp + 0x30]
018b4 488f442428                     pop        qword ptr [rsp + 0x28]
018b9 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
018be 48894424f8                     mov        qword ptr [rsp - 8], rax
018c3 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
018ca 89442440                       mov        dword ptr [rsp + 0x40], eax
018ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018d3 4489742448                     mov        dword ptr [rsp + 0x48], r14d
018d8 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
018dd 666690                         nop        
018e0 c5f877                         vzeroupper 
018e3 e8f8ddb4ff                     call       0x7f53eb9c3660
018e8 0f1f8400e019000f               nop        dword ptr [rax + rax + 0xf0019e0]
018f0 4183c608                       add        r14d, 8
018f4 be66ffffff                     mov        esi, 0xffffff66
018f9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
018fe 448b0424                       mov        r8d, dword ptr [rsp]
01902 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
0190a 4c8b442408                     mov        r8, qword ptr [rsp + 8]
0190f 4c890424                       mov        qword ptr [rsp], r8
01913 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
01917 898c24e4000000                 mov        dword ptr [rsp + 0xe4], ecx
0191e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01923 48ff742420                     push       qword ptr [rsp + 0x20]
01928 488f442418                     pop        qword ptr [rsp + 0x18]
0192d 48ff742428                     push       qword ptr [rsp + 0x28]
01932 488f442420                     pop        qword ptr [rsp + 0x20]
01937 48ff742430                     push       qword ptr [rsp + 0x30]
0193c 488f442428                     pop        qword ptr [rsp + 0x28]
01941 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01946 4489742448                     mov        dword ptr [rsp + 0x48], r14d
0194b 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01950 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
01955 666690                         nop        
01958 c5f877                         vzeroupper 
0195b e880ddb4ff                     call       0x7f53eb9c3660
01960 0f1f8400581a0010               nop        dword ptr [rax + rax + 0x10001a58]
01968 418be9                         mov        ebp, r9d
0196b e99becffff                     jmp        0x7f53ebe7458b
01970 beccffffff                     mov        esi, 0xffffffcc
01975 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0197a 448b1c24                       mov        r11d, dword ptr [rsp]
0197e 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01986 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0198b 4c891424                       mov        qword ptr [rsp], r10
0198f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01994 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
0199c 48ff742420                     push       qword ptr [rsp + 0x20]
019a1 488f442418                     pop        qword ptr [rsp + 0x18]
019a6 48ff742428                     push       qword ptr [rsp + 0x28]
019ab 488f442420                     pop        qword ptr [rsp + 0x20]
019b0 48ff742430                     push       qword ptr [rsp + 0x30]
019b5 488f442428                     pop        qword ptr [rsp + 0x28]
019ba 4489742444                     mov        dword ptr [rsp + 0x44], r14d
019bf 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
019c3 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
019c8 c5f877                         vzeroupper 
019cb e810ddb4ff                     call       0x7f53eb9c3660
019d0 0f1f8400c81a0011               nop        dword ptr [rax + rax + 0x11001ac8]
019d8 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
019dd 448bd8                         mov        r11d, eax
019e0 44035c2440                     add        r11d, dword ptr [rsp + 0x40]
019e5 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
019ec 4e8b5c1b08                     mov        r11, qword ptr [rbx + r11 + 8]
019f1 4e895c1308                     mov        qword ptr [rbx + r10 + 8], r11
019f6 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
019fb 4183c308                       add        r11d, 8
019ff 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01a04 453bd9                         cmp        r11d, r9d
01a07 7ccf                           jl         0x7f53ebe75958
01a09 443bd9                         cmp        r11d, ecx
01a0c 0f8d97000000                   jge        0x7f53ebe75a29
01a12 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01a17 8bbc2484000000                 mov        edi, dword ptr [rsp + 0x84]
01a1e 6690                           nop        
01a20 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01a25 4963db                         movsxd     rbx, r11d
01a28 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01a2d 448bc8                         mov        r9d, eax
01a30 44034c2440                     add        r9d, dword ptr [rsp + 0x40]
01a35 458bd1                         mov        r10d, r9d
01a38 4e8b4c0f08                     mov        r9, qword ptr [rdi + r9 + 8]
01a3d 4e894c1f08                     mov        qword ptr [rdi + r11 + 8], r9
01a42 4d63da                         movsxd     r11, r10d
01a45 4e8b541f10                     mov        r10, qword ptr [rdi + r11 + 0x10]
01a4a 4c89541f10                     mov        qword ptr [rdi + rbx + 0x10], r10
01a4f 4e8b541f18                     mov        r10, qword ptr [rdi + r11 + 0x18]
01a54 4c89541f18                     mov        qword ptr [rdi + rbx + 0x18], r10
01a59 4e8b541f20                     mov        r10, qword ptr [rdi + r11 + 0x20]
01a5e 4c89541f20                     mov        qword ptr [rdi + rbx + 0x20], r10
01a63 4e8b541f28                     mov        r10, qword ptr [rdi + r11 + 0x28]
01a68 4c89541f28                     mov        qword ptr [rdi + rbx + 0x28], r10
01a6d 4e8b541f30                     mov        r10, qword ptr [rdi + r11 + 0x30]
01a72 4c89541f30                     mov        qword ptr [rdi + rbx + 0x30], r10
01a77 4e8b541f38                     mov        r10, qword ptr [rdi + r11 + 0x38]
01a7c 4c89541f38                     mov        qword ptr [rdi + rbx + 0x38], r10
01a81 4e8b541f40                     mov        r10, qword ptr [rdi + r11 + 0x40]
01a86 4c89541f40                     mov        qword ptr [rdi + rbx + 0x40], r10
01a8b 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01a90 4183c240                       add        r10d, 0x40
01a94 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01a99 443bd1                         cmp        r10d, ecx
01a9c 0f8c7effffff                   jl         0x7f53ebe759a0
01aa2 89bc2484000000                 mov        dword ptr [rsp + 0x84], edi
01aa9 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01aae 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
01ab6 0f8d58ebffff                   jge        0x7f53ebe74594
01abc 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01ac1 458bc3                         mov        r8d, r11d
01ac4 468d1400                       lea        r10d, [rax + r8]
01ac8 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
01ad0 4f8b541108                     mov        r10, qword ptr [r9 + r10 + 8]
01ad5 458bd8                         mov        r11d, r8d
01ad8 4f89541908                     mov        qword ptr [r9 + r11 + 8], r10
01add 458d5808                       lea        r11d, [r8 + 8]
01ae1 458bc3                         mov        r8d, r11d
01ae4 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
01aec 7cd6                           jl         0x7f53ebe75a44
01aee e921ebffff                     jmp        0x7f53ebe74594
01af3 bee4ffffff                     mov        esi, 0xffffffe4
01af8 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01afd 448b0424                       mov        r8d, dword ptr [rsp]
01b01 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
01b09 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01b0e 4c891c24                       mov        qword ptr [rsp], r11
01b12 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01b17 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01b1f 8944240c                       mov        dword ptr [rsp + 0xc], eax
01b23 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01b28 48ff742420                     push       qword ptr [rsp + 0x20]
01b2d 488f442418                     pop        qword ptr [rsp + 0x18]
01b32 48894424f8                     mov        qword ptr [rsp - 8], rax
01b37 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01b3b 89442414                       mov        dword ptr [rsp + 0x14], eax
01b3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b44 48ff742428                     push       qword ptr [rsp + 0x28]
01b49 488f442420                     pop        qword ptr [rsp + 0x20]
01b4e 48ff742430                     push       qword ptr [rsp + 0x30]
01b53 488f442428                     pop        qword ptr [rsp + 0x28]
01b58 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01b5c 4489742440                     mov        dword ptr [rsp + 0x40], r14d
01b61 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
01b66 6690                           nop        
01b68 c5f877                         vzeroupper 
01b6b e870dbb4ff                     call       0x7f53eb9c3660
01b70 0f1f8400681c0012               nop        dword ptr [rax + rax + 0x12001c68]
01b78 4585f6                         test       r14d, r14d
01b7b 0f847b0b0000                   je         0x7f53ebe7667c
01b81 8b2c24                         mov        ebp, dword ptr [rsp]
01b84 898424a8000000                 mov        dword ptr [rsp + 0xa8], eax
01b8b 4533d2                         xor        r10d, r10d
01b8e e968f0ffff                     jmp        0x7f53ebe74b7b
01b93 bee4ffffff                     mov        esi, 0xffffffe4
01b98 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01b9d 448b1c24                       mov        r11d, dword ptr [rsp]
01ba1 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01ba9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01bae 4c891424                       mov        qword ptr [rsp], r10
01bb2 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01bb7 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01bbf 48ff742420                     push       qword ptr [rsp + 0x20]
01bc4 488f442410                     pop        qword ptr [rsp + 0x10]
01bc9 48ff742428                     push       qword ptr [rsp + 0x28]
01bce 488f442420                     pop        qword ptr [rsp + 0x20]
01bd3 48ff742430                     push       qword ptr [rsp + 0x30]
01bd8 488f442428                     pop        qword ptr [rsp + 0x28]
01bdd 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
01be2 895c2450                       mov        dword ptr [rsp + 0x50], ebx
01be6 4489742458                     mov        dword ptr [rsp + 0x58], r14d
01beb 90                             nop        
01bec c5f877                         vzeroupper 
01bef e8ecdab4ff                     call       0x7f53eb9c3660
01bf4 0f1f8400ec1c0013               nop        dword ptr [rax + rax + 0x13001cec]
01bfc bee4ffffff                     mov        esi, 0xffffffe4
01c01 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01c06 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01c0e 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01c13 44895c2404                     mov        dword ptr [rsp + 4], r11d
01c18 48ff742420                     push       qword ptr [rsp + 0x20]
01c1d 488f442418                     pop        qword ptr [rsp + 0x18]
01c22 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01c27 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01c2c 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01c31 895c2458                       mov        dword ptr [rsp + 0x58], ebx
01c35 666690                         nop        
01c38 c5f877                         vzeroupper 
01c3b e8a0dab4ff                     call       0x7f53eb9c3660
01c40 0f1f8400381d0014               nop        dword ptr [rax + rax + 0x14001d38]
01c48 418d6e01                       lea        ebp, [r14 + 1]
01c4c bee4ffffff                     mov        esi, 0xffffffe4
01c51 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01c56 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01c5e 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01c63 4489542404                     mov        dword ptr [rsp + 4], r10d
01c68 48ff742420                     push       qword ptr [rsp + 0x20]
01c6d 488f442418                     pop        qword ptr [rsp + 0x18]
01c72 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01c76 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01c7b 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01c80 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01c85 666690                         nop        
01c88 c5f877                         vzeroupper 
01c8b e850dab4ff                     call       0x7f53eb9c3660
01c90 0f1f8400881d0015               nop        dword ptr [rax + rax + 0x15001d88]
01c98 bee4ffffff                     mov        esi, 0xffffffe4
01c9d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01ca2 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01caa 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01caf 44895c2404                     mov        dword ptr [rsp + 4], r11d
01cb4 48ff742420                     push       qword ptr [rsp + 0x20]
01cb9 488f442418                     pop        qword ptr [rsp + 0x18]
01cbe 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01cc2 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01cc7 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01ccc 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01cd1 666690                         nop        
01cd4 c5f877                         vzeroupper 
01cd7 e804dab4ff                     call       0x7f53eb9c3660
01cdc 0f1f8400d41d0016               nop        dword ptr [rax + rax + 0x16001dd4]
01ce4 bee4ffffff                     mov        esi, 0xffffffe4
01ce9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01cee 448b1c24                       mov        r11d, dword ptr [rsp]
01cf2 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01cfa 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01cff 4c891424                       mov        qword ptr [rsp], r10
01d03 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01d08 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01d10 48ff742420                     push       qword ptr [rsp + 0x20]
01d15 488f442410                     pop        qword ptr [rsp + 0x10]
01d1a 48ff742428                     push       qword ptr [rsp + 0x28]
01d1f 488f442420                     pop        qword ptr [rsp + 0x20]
01d24 48ff742430                     push       qword ptr [rsp + 0x30]
01d29 488f442428                     pop        qword ptr [rsp + 0x28]
01d2e 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01d32 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
01d37 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01d3c 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01d41 666690                         nop        
01d44 c5f877                         vzeroupper 
01d47 e894d9b4ff                     call       0x7f53eb9c3660
01d4c 0f1f8400441e0017               nop        dword ptr [rax + rax + 0x17001e44]
01d54 bee4ffffff                     mov        esi, 0xffffffe4
01d59 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01d5e 448b1424                       mov        r10d, dword ptr [rsp]
01d62 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01d6a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01d6f 4c891424                       mov        qword ptr [rsp], r10
01d73 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01d78 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01d80 48ff742420                     push       qword ptr [rsp + 0x20]
01d85 488f442410                     pop        qword ptr [rsp + 0x10]
01d8a 48ff742428                     push       qword ptr [rsp + 0x28]
01d8f 488f442420                     pop        qword ptr [rsp + 0x20]
01d94 48ff742430                     push       qword ptr [rsp + 0x30]
01d99 488f442428                     pop        qword ptr [rsp + 0x28]
01d9e 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01da2 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
01da7 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
01dac 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01db1 666690                         nop        
01db4 c5f877                         vzeroupper 
01db7 e824d9b4ff                     call       0x7f53eb9c3660
01dbc 0f1f8400b41e0018               nop        dword ptr [rax + rax + 0x18001eb4]
01dc4 bee4ffffff                     mov        esi, 0xffffffe4
01dc9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01dce 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01dd6 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01ddb 4489542404                     mov        dword ptr [rsp + 4], r10d
01de0 48ff742420                     push       qword ptr [rsp + 0x20]
01de5 488f442418                     pop        qword ptr [rsp + 0x18]
01dea 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01dee 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
01df3 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01df8 c5f877                         vzeroupper 
01dfb e8e0d8b4ff                     call       0x7f53eb9c3660
01e00 0f1f8400f81e0019               nop        dword ptr [rax + rax + 0x19001ef8]
01e08 beccffffff                     mov        esi, 0xffffffcc
01e0d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01e12 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01e1a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01e1f 44895c2404                     mov        dword ptr [rsp + 4], r11d
01e24 48ff742420                     push       qword ptr [rsp + 0x20]
01e29 488f442418                     pop        qword ptr [rsp + 0x18]
01e2e 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01e32 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01e37 90                             nop        
01e38 c5f877                         vzeroupper 
01e3b e8a0d8b4ff                     call       0x7f53eb9c3660
01e40 0f1f8400381f001a               nop        dword ptr [rax + rax + 0x1a001f38]
01e48 be6effffff                     mov        esi, 0xffffff6e
01e4d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01e52 448b0424                       mov        r8d, dword ptr [rsp]
01e56 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
01e5e 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01e63 4c891c24                       mov        qword ptr [rsp], r11
01e67 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01e6c 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01e74 8944240c                       mov        dword ptr [rsp + 0xc], eax
01e78 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01e7d 48ff742420                     push       qword ptr [rsp + 0x20]
01e82 488f442418                     pop        qword ptr [rsp + 0x18]
01e87 48894424f8                     mov        qword ptr [rsp - 8], rax
01e8c 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01e90 89442414                       mov        dword ptr [rsp + 0x14], eax
01e94 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e99 48ff742428                     push       qword ptr [rsp + 0x28]
01e9e 488f442420                     pop        qword ptr [rsp + 0x20]
01ea3 48ff742430                     push       qword ptr [rsp + 0x30]
01ea8 488f442428                     pop        qword ptr [rsp + 0x28]
01ead 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01eb1 4489742440                     mov        dword ptr [rsp + 0x40], r14d
01eb6 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
01ebb 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
01ec0 c5f877                         vzeroupper 
01ec3 e818d8b4ff                     call       0x7f53eb9c3660
01ec8 0f1f8400c01f001b               nop        dword ptr [rax + rax + 0x1b001fc0]
01ed0 be45ffffff                     mov        esi, 0xffffff45
01ed5 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01eda 448b0424                       mov        r8d, dword ptr [rsp]
01ede 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
01ee6 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01eeb 4c891c24                       mov        qword ptr [rsp], r11
01eef 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01ef4 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01efc 8944240c                       mov        dword ptr [rsp + 0xc], eax
01f00 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01f05 48ff742420                     push       qword ptr [rsp + 0x20]
01f0a 488f442418                     pop        qword ptr [rsp + 0x18]
01f0f 48894424f8                     mov        qword ptr [rsp - 8], rax
01f14 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01f18 89442414                       mov        dword ptr [rsp + 0x14], eax
01f1c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f21 48ff742428                     push       qword ptr [rsp + 0x28]
01f26 488f442420                     pop        qword ptr [rsp + 0x20]
01f2b 48ff742430                     push       qword ptr [rsp + 0x30]
01f30 488f442428                     pop        qword ptr [rsp + 0x28]
01f35 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01f39 4489742440                     mov        dword ptr [rsp + 0x40], r14d
01f3e 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
01f43 90                             nop        
01f44 c5f877                         vzeroupper 
01f47 e894d7b4ff                     call       0x7f53eb9c3660
01f4c 0f1f84004420001c               nop        dword ptr [rax + rax + 0x1c002044]
01f54 be3dffffff                     mov        esi, 0xffffff3d
01f59 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01f5e 448b1c24                       mov        r11d, dword ptr [rsp]
01f62 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01f6a 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01f6f 4c891c24                       mov        qword ptr [rsp], r11
01f73 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01f78 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
01f80 8944240c                       mov        dword ptr [rsp + 0xc], eax
01f84 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01f89 48ff742420                     push       qword ptr [rsp + 0x20]
01f8e 488f442418                     pop        qword ptr [rsp + 0x18]
01f93 48894424f8                     mov        qword ptr [rsp - 8], rax
01f98 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01f9c 89442414                       mov        dword ptr [rsp + 0x14], eax
01fa0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fa5 48ff742428                     push       qword ptr [rsp + 0x28]
01faa 488f442420                     pop        qword ptr [rsp + 0x20]
01faf 48ff742430                     push       qword ptr [rsp + 0x30]
01fb4 488f442428                     pop        qword ptr [rsp + 0x28]
01fb9 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01fbd 4489742440                     mov        dword ptr [rsp + 0x40], r14d
01fc2 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
01fc7 90                             nop        
01fc8 c5f877                         vzeroupper 
01fcb e810d7b4ff                     call       0x7f53eb9c3660
01fd0 0f1f8400c820001d               nop        dword ptr [rax + rax + 0x1d0020c8]
01fd8 bee4ffffff                     mov        esi, 0xffffffe4
01fdd 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01fe2 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01fea 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01fef 44895c2404                     mov        dword ptr [rsp + 4], r11d
01ff4 48ff742420                     push       qword ptr [rsp + 0x20]
01ff9 488f442418                     pop        qword ptr [rsp + 0x18]
01ffe 895c2440                       mov        dword ptr [rsp + 0x40], ebx
02002 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
02007 90                             nop        
02008 c5f877                         vzeroupper 
0200b e8d0d6b4ff                     call       0x7f53eb9c3660
02010 0f1f84000821001e               nop        dword ptr [rax + rax + 0x1e002108]
02018 bee4ffffff                     mov        esi, 0xffffffe4
0201d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02022 44895c2404                     mov        dword ptr [rsp + 4], r11d
02027 48ff742420                     push       qword ptr [rsp + 0x20]
0202c 488f442418                     pop        qword ptr [rsp + 0x18]
02031 895c2440                       mov        dword ptr [rsp + 0x40], ebx
02035 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
0203a 6690                           nop        
0203c c5f877                         vzeroupper 
0203f e89cd6b4ff                     call       0x7f53eb9c3660
02044 0f1f84003c21001f               nop        dword ptr [rax + rax + 0x1f00213c]
0204c beccffffff                     mov        esi, 0xffffffcc
02051 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02056 448b1c24                       mov        r11d, dword ptr [rsp]
0205a 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02062 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02067 4c891424                       mov        qword ptr [rsp], r10
0206b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02070 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02078 48ff742420                     push       qword ptr [rsp + 0x20]
0207d 488f442410                     pop        qword ptr [rsp + 0x10]
02082 48ff742428                     push       qword ptr [rsp + 0x28]
02087 488f442420                     pop        qword ptr [rsp + 0x20]
0208c 48ff742430                     push       qword ptr [rsp + 0x30]
02091 488f442428                     pop        qword ptr [rsp + 0x28]
02096 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
0209b 448974244c                     mov        dword ptr [rsp + 0x4c], r14d
020a0 895c2454                       mov        dword ptr [rsp + 0x54], ebx
020a4 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
020a9 666690                         nop        
020ac c5f877                         vzeroupper 
020af e82cd6b4ff                     call       0x7f53eb9c3660
020b4 0f1f8400ac210020               nop        dword ptr [rax + rax + 0x200021ac]
020bc be17000000                     mov        esi, 0x17
020c1 666690                         nop        
020c4 c5f877                         vzeroupper 
020c7 e814d6b4ff                     call       0x7f53eb9c3660
020cc 0f1f8400c4210021               nop        dword ptr [rax + rax + 0x210021c4]
020d4 be6effffff                     mov        esi, 0xffffff6e
020d9 4489742410                     mov        dword ptr [rsp + 0x10], r14d
020de 89442414                       mov        dword ptr [rsp + 0x14], eax
020e2 4c89442418                     mov        qword ptr [rsp + 0x18], r8
020e7 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
020ec 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
020f1 48897c2430                     mov        qword ptr [rsp + 0x30], rdi
020f6 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
020fb 90                             nop        
020fc c5f877                         vzeroupper 
020ff e8dcd5b4ff                     call       0x7f53eb9c3660
02104 0f1f8400fc210022               nop        dword ptr [rax + rax + 0x220021fc]
0210c bebeffffff                     mov        esi, 0xffffffbe
02111 4489742410                     mov        dword ptr [rsp + 0x10], r14d
02116 89442414                       mov        dword ptr [rsp + 0x14], eax
0211a 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0211f 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
02124 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
02129 48897c2430                     mov        qword ptr [rsp + 0x30], rdi
0212e 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02133 90                             nop        
02134 c5f877                         vzeroupper 
02137 e8a4d5b4ff                     call       0x7f53eb9c3660
0213c 0f1f840034220023               nop        dword ptr [rax + rax + 0x23002234]
02144 488b5c2478                     mov        rbx, qword ptr [rsp + 0x78]
02149 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
0214e 448bb42484000000               mov        r14d, dword ptr [rsp + 0x84]
02156 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
0215e beccffffff                     mov        esi, 0xffffffcc
02163 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
0216b 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02173 44893424                       mov        dword ptr [rsp], r14d
02177 44894c2404                     mov        dword ptr [rsp + 4], r9d
0217c 48895c2408                     mov        qword ptr [rsp + 8], rbx
02181 666690                         nop        
02184 c5f877                         vzeroupper 
02187 e854d5b4ff                     call       0x7f53eb9c3660
0218c 0f1f840084220024               nop        dword ptr [rax + rax + 0x24002284]
02194 bee4ffffff                     mov        esi, 0xffffffe4
02199 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0219e 448b0424                       mov        r8d, dword ptr [rsp]
021a2 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
021aa 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
021af 4c891c24                       mov        qword ptr [rsp], r11
021b3 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
021b8 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
021c0 48ff742420                     push       qword ptr [rsp + 0x20]
021c5 488f442410                     pop        qword ptr [rsp + 0x10]
021ca 48ff742428                     push       qword ptr [rsp + 0x28]
021cf 488f442420                     pop        qword ptr [rsp + 0x20]
021d4 48ff742430                     push       qword ptr [rsp + 0x30]
021d9 488f442428                     pop        qword ptr [rsp + 0x28]
021de 895c2438                       mov        dword ptr [rsp + 0x38], ebx
021e2 48894424f8                     mov        qword ptr [rsp - 8], rax
021e7 8b442448                       mov        eax, dword ptr [rsp + 0x48]
021eb 8944243c                       mov        dword ptr [rsp + 0x3c], eax
021ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021f4 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
021f9 48894424f8                     mov        qword ptr [rsp - 8], rax
021fe 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02202 89442444                       mov        dword ptr [rsp + 0x44], eax
02206 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0220b 89442448                       mov        dword ptr [rsp + 0x48], eax
0220f 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02214 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02219 666690                         nop        
0221c c5f877                         vzeroupper 
0221f e8bcd4b4ff                     call       0x7f53eb9c3660
02224 0f1f84001c230025               nop        dword ptr [rax + rax + 0x2500231c]
0222c c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
02232 bee4ffffff                     mov        esi, 0xffffffe4
02237 498be8                         mov        rbp, r8
0223a 448b1c24                       mov        r11d, dword ptr [rsp]
0223e 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02246 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0224b 4c891c24                       mov        qword ptr [rsp], r11
0224f 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02254 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
0225c 48ff742420                     push       qword ptr [rsp + 0x20]
02261 488f442410                     pop        qword ptr [rsp + 0x10]
02266 48ff742428                     push       qword ptr [rsp + 0x28]
0226b 488f442420                     pop        qword ptr [rsp + 0x20]
02270 48ff742430                     push       qword ptr [rsp + 0x30]
02275 488f442428                     pop        qword ptr [rsp + 0x28]
0227a 895c2438                       mov        dword ptr [rsp + 0x38], ebx
0227e 48894424f8                     mov        qword ptr [rsp - 8], rax
02283 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02287 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0228b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02290 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
02295 48894424f8                     mov        qword ptr [rsp - 8], rax
0229a 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0229e 89442444                       mov        dword ptr [rsp + 0x44], eax
022a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022a7 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
022ac 89442454                       mov        dword ptr [rsp + 0x54], eax
022b0 c5f877                         vzeroupper 
022b3 e828d4b4ff                     call       0x7f53eb9c3660
022b8 0f1f8400b0230026               nop        dword ptr [rax + rax + 0x260023b0]
022c0 beccffffff                     mov        esi, 0xffffffcc
022c5 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
022ca 448b1c24                       mov        r11d, dword ptr [rsp]
022ce 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
022d6 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
022db 4c891c24                       mov        qword ptr [rsp], r11
022df 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
022e4 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
022ec 48ff742420                     push       qword ptr [rsp + 0x20]
022f1 488f442418                     pop        qword ptr [rsp + 0x18]
022f6 48ff742428                     push       qword ptr [rsp + 0x28]
022fb 488f442420                     pop        qword ptr [rsp + 0x20]
02300 48ff742430                     push       qword ptr [rsp + 0x30]
02305 488f442428                     pop        qword ptr [rsp + 0x28]
0230a 48894424f8                     mov        qword ptr [rsp - 8], rax
0230f 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02313 89442440                       mov        dword ptr [rsp + 0x40], eax
02317 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0231c 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
02321 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02326 89442458                       mov        dword ptr [rsp + 0x58], eax
0232a 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
0232e 6690                           nop        
02330 c5f877                         vzeroupper 
02333 e8a8d3b4ff                     call       0x7f53eb9c3660
02338 0f1f840030240027               nop        dword ptr [rax + rax + 0x27002430]
02340 418bea                         mov        ebp, r10d
02343 83c510                         add        ebp, 0x10
02346 be6effffff                     mov        esi, 0xffffff6e
0234b 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
02350 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
02358 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0235d 4489442404                     mov        dword ptr [rsp + 4], r8d
02362 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02367 48ff742420                     push       qword ptr [rsp + 0x20]
0236c 488f442418                     pop        qword ptr [rsp + 0x18]
02371 895c2440                       mov        dword ptr [rsp + 0x40], ebx
02375 48894424f8                     mov        qword ptr [rsp - 8], rax
0237a 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0237e 89442444                       mov        dword ptr [rsp + 0x44], eax
02382 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02387 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
0238c c5f877                         vzeroupper 
0238f e84cd3b4ff                     call       0x7f53eb9c3660
02394 0f1f84008c240028               nop        dword ptr [rax + rax + 0x2800248c]
0239c 418bea                         mov        ebp, r10d
0239f 83c510                         add        ebp, 0x10
023a2 be66ffffff                     mov        esi, 0xffffff66
023a7 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
023ac 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
023b4 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
023b9 44895c2404                     mov        dword ptr [rsp + 4], r11d
023be 4489542414                     mov        dword ptr [rsp + 0x14], r10d
023c3 48ff742420                     push       qword ptr [rsp + 0x20]
023c8 488f442418                     pop        qword ptr [rsp + 0x18]
023cd 895c2440                       mov        dword ptr [rsp + 0x40], ebx
023d1 48894424f8                     mov        qword ptr [rsp - 8], rax
023d6 8b442448                       mov        eax, dword ptr [rsp + 0x48]
023da 89442444                       mov        dword ptr [rsp + 0x44], eax
023de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023e3 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
023e8 c5f877                         vzeroupper 
023eb e8f0d2b4ff                     call       0x7f53eb9c3660
023f0 0f1f8400e8240029               nop        dword ptr [rax + rax + 0x290024e8]
023f8 bee4ffffff                     mov        esi, 0xffffffe4
023fd 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02402 448b1c24                       mov        r11d, dword ptr [rsp]
02406 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0240e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02413 4c891424                       mov        qword ptr [rsp], r10
02417 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0241c 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02424 48ff742420                     push       qword ptr [rsp + 0x20]
02429 488f442410                     pop        qword ptr [rsp + 0x10]
0242e 48ff742428                     push       qword ptr [rsp + 0x28]
02433 488f442420                     pop        qword ptr [rsp + 0x20]
02438 48ff742430                     push       qword ptr [rsp + 0x30]
0243d 488f442428                     pop        qword ptr [rsp + 0x28]
02442 895c2448                       mov        dword ptr [rsp + 0x48], ebx
02446 4489742450                     mov        dword ptr [rsp + 0x50], r14d
0244b 90                             nop        
0244c c5f877                         vzeroupper 
0244f e88cd2b4ff                     call       0x7f53eb9c3660
02454 0f1f84004c25002a               nop        dword ptr [rax + rax + 0x2a00254c]
0245c bee4ffffff                     mov        esi, 0xffffffe4
02461 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02466 448b1424                       mov        r10d, dword ptr [rsp]
0246a 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02472 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02477 4c891424                       mov        qword ptr [rsp], r10
0247b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02480 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02488 48ff742420                     push       qword ptr [rsp + 0x20]
0248d 488f442410                     pop        qword ptr [rsp + 0x10]
02492 48ff742428                     push       qword ptr [rsp + 0x28]
02497 488f442420                     pop        qword ptr [rsp + 0x20]
0249c 48ff742430                     push       qword ptr [rsp + 0x30]
024a1 488f442428                     pop        qword ptr [rsp + 0x28]
024a6 895c2444                       mov        dword ptr [rsp + 0x44], ebx
024aa 6690                           nop        
024ac c5f877                         vzeroupper 
024af e82cd2b4ff                     call       0x7f53eb9c3660
024b4 0f1f8400ac25002b               nop        dword ptr [rax + rax + 0x2b0025ac]
024bc 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
024c1 458d5a08                       lea        r11d, [r10 + 8]
024c5 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
024ca be6effffff                     mov        esi, 0xffffff6e
024cf 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
024d4 448b1424                       mov        r10d, dword ptr [rsp]
024d8 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
024e0 4c8b542408                     mov        r10, qword ptr [rsp + 8]
024e5 4c891424                       mov        qword ptr [rsp], r10
024e9 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
024ee 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
024f6 48ff742420                     push       qword ptr [rsp + 0x20]
024fb 488f442410                     pop        qword ptr [rsp + 0x10]
02500 48ff742428                     push       qword ptr [rsp + 0x28]
02505 488f442420                     pop        qword ptr [rsp + 0x20]
0250a 48ff742430                     push       qword ptr [rsp + 0x30]
0250f 488f442428                     pop        qword ptr [rsp + 0x28]
02514 48894424f8                     mov        qword ptr [rsp - 8], rax
02519 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
02520 89442438                       mov        dword ptr [rsp + 0x38], eax
02524 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02529 666690                         nop        
0252c c5f877                         vzeroupper 
0252f e8acd1b4ff                     call       0x7f53eb9c3660
02534 0f1f84002c26002c               nop        dword ptr [rax + rax + 0x2c00262c]
0253c 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
02541 458d5a08                       lea        r11d, [r10 + 8]
02545 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0254a be66ffffff                     mov        esi, 0xffffff66
0254f 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02554 448b1c24                       mov        r11d, dword ptr [rsp]
02558 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02560 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02565 4c891424                       mov        qword ptr [rsp], r10
02569 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0256e 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02576 48ff742420                     push       qword ptr [rsp + 0x20]
0257b 488f442410                     pop        qword ptr [rsp + 0x10]
02580 48ff742428                     push       qword ptr [rsp + 0x28]
02585 488f442420                     pop        qword ptr [rsp + 0x20]
0258a 48ff742430                     push       qword ptr [rsp + 0x30]
0258f 488f442428                     pop        qword ptr [rsp + 0x28]
02594 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
02599 666690                         nop        
0259c c5f877                         vzeroupper 
0259f e83cd1b4ff                     call       0x7f53eb9c3660
025a4 0f1f84009c26002d               nop        dword ptr [rax + rax + 0x2d00269c]
025ac bee4ffffff                     mov        esi, 0xffffffe4
025b1 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
025b6 448b1c24                       mov        r11d, dword ptr [rsp]
025ba 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
025c2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
025c7 4c891424                       mov        qword ptr [rsp], r10
025cb 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
025d0 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
025d8 48ff742420                     push       qword ptr [rsp + 0x20]
025dd 488f442410                     pop        qword ptr [rsp + 0x10]
025e2 48ff742428                     push       qword ptr [rsp + 0x28]
025e7 488f442420                     pop        qword ptr [rsp + 0x20]
025ec 48ff742430                     push       qword ptr [rsp + 0x30]
025f1 488f442428                     pop        qword ptr [rsp + 0x28]
025f6 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
025fa 4489742448                     mov        dword ptr [rsp + 0x48], r14d
025ff 90                             nop        
02600 c5f877                         vzeroupper 
02603 e8d8d0b4ff                     call       0x7f53eb9c3660
02608 0f1f84000027002e               nop        dword ptr [rax + rax + 0x2e002700]
02610 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
02616 bee4ffffff                     mov        esi, 0xffffffe4
0261b 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02620 448b1424                       mov        r10d, dword ptr [rsp]
02624 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
0262c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02631 4c891424                       mov        qword ptr [rsp], r10
02635 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0263a 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02642 48ff742420                     push       qword ptr [rsp + 0x20]
02647 488f442410                     pop        qword ptr [rsp + 0x10]
0264c 48ff742428                     push       qword ptr [rsp + 0x28]
02651 488f442420                     pop        qword ptr [rsp + 0x20]
02656 48ff742430                     push       qword ptr [rsp + 0x30]
0265b 488f442428                     pop        qword ptr [rsp + 0x28]
02660 4489742440                     mov        dword ptr [rsp + 0x40], r14d
02665 895c2448                       mov        dword ptr [rsp + 0x48], ebx
02669 666690                         nop        
0266c c5f877                         vzeroupper 
0266f e86cd0b4ff                     call       0x7f53eb9c3660
02674 0f1f84006c27002f               nop        dword ptr [rax + rax + 0x2f00276c]
0267c 4183c610                       add        r14d, 0x10
02680 be6effffff                     mov        esi, 0xffffff6e
02685 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0268a 4489542404                     mov        dword ptr [rsp + 4], r10d
0268f 48ff742420                     push       qword ptr [rsp + 0x20]
02694 488f442418                     pop        qword ptr [rsp + 0x18]
02699 48894424f8                     mov        qword ptr [rsp - 8], rax
0269e 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
026a5 89442440                       mov        dword ptr [rsp + 0x40], eax
026a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026ae 4489742444                     mov        dword ptr [rsp + 0x44], r14d
026b3 90                             nop        
026b4 c5f877                         vzeroupper 
026b7 e824d0b4ff                     call       0x7f53eb9c3660
026bc 0f1f8400b4270030               nop        dword ptr [rax + rax + 0x300027b4]
026c4 4183c610                       add        r14d, 0x10
026c8 be66ffffff                     mov        esi, 0xffffff66
026cd 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
026d2 4489542404                     mov        dword ptr [rsp + 4], r10d
026d7 48ff742420                     push       qword ptr [rsp + 0x20]
026dc 488f442418                     pop        qword ptr [rsp + 0x18]
026e1 4489742444                     mov        dword ptr [rsp + 0x44], r14d
026e6 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
026eb 90                             nop        
026ec c5f877                         vzeroupper 
026ef e8eccfb4ff                     call       0x7f53eb9c3660
026f4 0f1f8400ec270031               nop        dword ptr [rax + rax + 0x310027ec]
026fc bef6ffffff                     mov        esi, 0xfffffff6
02701 488bea                         mov        rbp, rdx
02704 898424e0000000                 mov        dword ptr [rsp + 0xe0], eax
0270b 90                             nop        
0270c c5f877                         vzeroupper 
0270f e8cccfb4ff                     call       0x7f53eb9c3660
02714 0f1f84000c280032               nop        dword ptr [rax + rax + 0x3200280c]
0271c bef6ffffff                     mov        esi, 0xfffffff6
02721 666690                         nop        
02724 c5f877                         vzeroupper 
02727 e8b4cfb4ff                     call       0x7f53eb9c3660
0272c 0f1f840024280033               nop        dword ptr [rax + rax + 0x33002824]
02734 49bafa4be7eb537f0000           movabs     r10, 0x7f53ebe74bfa
0273e 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02745 e91678a8ff                     jmp        0x7f53eb8fdee0
0274a e8d143a7ff                     call       0x7f53eb8eaaa0
0274f e9ead8ffff                     jmp        0x7f53ebe73fbe
02754 f4                             hlt        
02755 f4                             hlt        
02756 f4                             hlt        
02757 f4                             hlt        
