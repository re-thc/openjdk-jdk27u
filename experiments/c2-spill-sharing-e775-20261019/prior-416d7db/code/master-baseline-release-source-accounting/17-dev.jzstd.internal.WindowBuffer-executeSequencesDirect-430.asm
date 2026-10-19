00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c059a8ff                   jne        0x7ffaeb8fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecd0000000                 sub        rsp, 0xd0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f856c270000                   jne        0x7ffaebe7772a
0003e 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4c89442408                     mov        qword ptr [rsp + 8], r8
0004b 8bcf                           mov        ecx, edi
0004d 488bde                         mov        rbx, rsi
00050 8b4638                         mov        eax, dword ptr [rsi + 0x38]
00053 8b6e04                         mov        ebp, dword ptr [rsi + 4]
00056 448bdd                         mov        r11d, ebp
00059 442bd8                         sub        r11d, eax
0005c 448b9424e0000000               mov        r10d, dword ptr [rsp + 0xe0]
00064 453bd3                         cmp        r10d, r11d
00067 0f8f9f200000                   jg         0x7ffaebe7708c
0006d 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00071 4c8b4e20                       mov        r9, qword ptr [rsi + 0x20]
00075 4c639424e0000000               movsxd     r10, dword ptr [rsp + 0xe0]
0007d 4c63d8                         movsxd     r11, eax
00080 4d03d8                         add        r11, r8
00083 4d2bcb                         sub        r9, r11
00086 4d3bd1                         cmp        r10, r9
00089 0f8f7d200000                   jg         0x7ffaebe7708c
0008f 488b7e10                       mov        rdi, qword ptr [rsi + 0x10]
00093 4c8b4e28                       mov        r9, qword ptr [rsi + 0x28]
00097 4d85c9                         test       r9, r9
0009a 0f84b70f0000                   je         0x7ffaebe75fd7
000a0 4533ed                         xor        r13d, r13d
000a3 4c8bda                         mov        r11, rdx
000a6 8b7204                         mov        esi, dword ptr [rdx + 4]
000a9 448b7340                       mov        r14d, dword ptr [rbx + 0x40]
000ad 448bd1                         mov        r10d, ecx
000b0 4585d2                         test       r10d, r10d
000b3 0f8e0f1b0000                   jle        0x7ffaebe76b48
000b9 89ac2480000000                 mov        dword ptr [rsp + 0x80], ebp
000c0 4489542438                     mov        dword ptr [rsp + 0x38], r10d
000c5 4889542450                     mov        qword ptr [rsp + 0x50], rdx
000ca 48895c2478                     mov        qword ptr [rsp + 0x78], rbx
000cf 4d2bc8                         sub        r9, r8
000d2 448d5ee0                       lea        r11d, [rsi - 0x20]
000d6 83c5e0                         add        ebp, -0x20
000d9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
000de 458b5204                       mov        r10d, dword ptr [r10 + 4]
000e2 4585d2                         test       r10d, r10d
000e5 0f8639200000                   jbe        0x7ffaebe770a4
000eb 4d63d2                         movsxd     r10, r10d
000ee 4863c9                         movsxd     rcx, ecx
000f1 48ffc9                         dec        rcx
000f4 493bca                         cmp        rcx, r10
000f7 0f8327200000                   jae        0x7ffaebe770a4
000fd 4c8b9424e8000000               mov        r10, qword ptr [rsp + 0xe8]
00105 418b5a04                       mov        ebx, dword ptr [r10 + 4]
00109 85db                           test       ebx, ebx
0010b 0f864b200000                   jbe        0x7ffaebe770dc
00111 83fb01                         cmp        ebx, 1
00114 0f8642200000                   jbe        0x7ffaebe770dc
0011a 83fb02                         cmp        ebx, 2
0011d 0f8639200000                   jbe        0x7ffaebe770dc
00123 448d56f1                       lea        r10d, [rsi - 0xf]
00127 4585d2                         test       r10d, r10d
0012a 0f8c2c200000                   jl         0x7ffaebe770dc
00130 418b4e04                       mov        ecx, dword ptr [r14 + 4]
00134 448d51f1                       lea        r10d, [rcx - 0xf]
00138 4585d2                         test       r10d, r10d
0013b 0f8c1b200000                   jl         0x7ffaebe770dc
00141 448d51fd                       lea        r10d, [rcx - 3]
00145 4585d2                         test       r10d, r10d
00148 0f8c0e200000                   jl         0x7ffaebe770dc
0014e 448d51f9                       lea        r10d, [rcx - 7]
00152 4585d2                         test       r10d, r10d
00155 0f8c01200000                   jl         0x7ffaebe770dc
0015b 894c2404                       mov        dword ptr [rsp + 4], ecx
0015f 899c24e4000000                 mov        dword ptr [rsp + 0xe4], ebx
00166 89ac248c000000                 mov        dword ptr [rsp + 0x8c], ebp
0016d 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
00175 89b424e0000000                 mov        dword ptr [rsp + 0xe0], esi
0017c 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
00181 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
00186 48897c2430                     mov        qword ptr [rsp + 0x30], rdi
0018b 4c89442420                     mov        qword ptr [rsp + 0x20], r8
00190 498bde                         mov        rbx, r14
00193 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
00198 4489b42484000000               mov        dword ptr [rsp + 0x84], r14d
001a0 8bd9                           mov        ebx, ecx
001a2 448bee                         mov        r13d, esi
001a5 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
001aa 448d6bf9                       lea        r13d, [rbx - 7]
001ae 44896c2468                     mov        dword ptr [rsp + 0x68], r13d
001b3 448b6c2418                     mov        r13d, dword ptr [rsp + 0x18]
001b8 4183c5f1                       add        r13d, -0xf
001bc 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
001c1 448d5bfd                       lea        r11d, [rbx - 3]
001c5 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
001ca 4c63eb                         movsxd     r13, ebx
001cd 83c3f1                         add        ebx, -0xf
001d0 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
001d7 498d5df9                       lea        rbx, [r13 - 7]
001db 48899c2498000000               mov        qword ptr [rsp + 0x98], rbx
001e3 4983c5f1                       add        r13, -0xf
001e7 4c89ac24a0000000               mov        qword ptr [rsp + 0xa0], r13
001ef 4533d2                         xor        r10d, r10d
001f2 33db                           xor        ebx, ebx
001f4 899c24b0000000                 mov        dword ptr [rsp + 0xb0], ebx
001fb e94d040000                     jmp        0x7ffaebe755cd
00200 448bd5                         mov        r10d, ebp
00203 4d63d2                         movsxd     r10, r10d
00206 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0020d c442a8f5db                     bzhi       r11, r11, r10
00212 c4c1fb92fb                     kmovq      k7, r11
00217 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0021d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00223 4403ed                         add        r13d, ebp
00226 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0022a 418502                         test       dword ptr [r10], eax
0022d 443b6c2448                     cmp        r13d, dword ptr [rsp + 0x48]
00232 0f8dec030000                   jge        0x7ffaebe755a4
00238 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
0023d 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00242 452bd5                         sub        r10d, r13d
00245 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0024a 8b6c2448                       mov        ebp, dword ptr [rsp + 0x48]
0024e 412bed                         sub        ebp, r13d
00251 413bed                         cmp        ebp, r13d
00254 410f4fed                       cmovg      ebp, r13d
00258 4585d2                         test       r10d, r10d
0025b 0f8cf71b0000                   jl         0x7ffaebe76dd8
00261 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00266 4585d2                         test       r10d, r10d
00269 0f8ce91b0000                   jl         0x7ffaebe76dd8
0026f 448bd5                         mov        r10d, ebp
00272 4403542460                     add        r10d, dword ptr [rsp + 0x60]
00277 448b742404                     mov        r14d, dword ptr [rsp + 4]
0027c 453bf2                         cmp        r14d, r10d
0027f 0f82d31b0000                   jb         0x7ffaebe76dd8
00285 448b74245c                     mov        r14d, dword ptr [rsp + 0x5c]
0028a 4403f5                         add        r14d, ebp
0028d 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00292 453bde                         cmp        r11d, r14d
00295 0f82bd1b0000                   jb         0x7ffaebe76dd8
0029b 85ed                           test       ebp, ebp
0029d 0f8cb51b0000                   jl         0x7ffaebe76dd8
002a3 85ed                           test       ebp, ebp
002a5 0f8478ffffff                   je         0x7ffaebe751a3
002ab 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
002b0 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
002b8 4b8d741008                     lea        rsi, [r8 + r10 + 8]
002bd 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
002c2 4b8d7c1808                     lea        rdi, [r8 + r11 + 8]
002c7 4863d5                         movsxd     rdx, ebp
002ca 4883fa20                       cmp        rdx, 0x20
002ce 0f862cffffff                   jbe        0x7ffaebe75180
002d4 c5f877                         vzeroupper 
002d7 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
002e1 41ffd2                         call       r10
002e4 0f1f840000000000               nop        dword ptr [rax + rax]
002ec e932ffffff                     jmp        0x7ffaebe751a3
002f1 48894424f8                     mov        qword ptr [rsp - 8], rax
002f6 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
002fa 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
00301 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00306 4585ed                         test       r13d, r13d
00309 0f8ecd110000                   jle        0x7ffaebe7645c
0030f 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00314 44034c244c                     add        r9d, dword ptr [rsp + 0x4c]
00319 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
00321 0f8fc5120000                   jg         0x7ffaebe7656c
00327 458d1c1a                       lea        r11d, [r10 + rbx]
0032b 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00333 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
0033b 0f8f2f130000                   jg         0x7ffaebe765f0
00341 83fb10                         cmp        ebx, 0x10
00344 0f8f99060000                   jg         0x7ffaebe75963
0034a 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
0034f 0f83b00f0000                   jae        0x7ffaebe76285
00355 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
0035a c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
00361 3b842490000000                 cmp        eax, dword ptr [rsp + 0x90]
00368 0f8316100000                   jae        0x7ffaebe76304
0036e 468d3413                       lea        r14d, [rbx + r10]
00372 4489b42494000000               mov        dword ptr [rsp + 0x94], r14d
0037a 448bb42484000000               mov        r14d, dword ptr [rsp + 0x84]
00382 c4c17a7f440608                 vmovdqu    xmmword ptr [r14 + rax + 8], xmm0
00389 03d8                           add        ebx, eax
0038b 448bf3                         mov        r14d, ebx
0038e 452bf5                         sub        r14d, r13d
00391 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00396 4183f910                       cmp        r9d, 0x10
0039a 7f47                           jg         0x7ffaebe75363
0039c 4183fd10                       cmp        r13d, 0x10
003a0 7c41                           jl         0x7ffaebe75363
003a2 443bb42490000000               cmp        r14d, dword ptr [rsp + 0x90]
003aa 0f8358100000                   jae        0x7ffaebe76388
003b0 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
003b8 c4817a6f443508                 vmovdqu    xmm0, xmmword ptr [r13 + r14 + 8]
003bf 3b9c2490000000                 cmp        ebx, dword ptr [rsp + 0x90]
003c6 0f83a4100000                   jae        0x7ffaebe763f0
003cc c4c17a7f441d08                 vmovdqu    xmmword ptr [r13 + rbx + 8], xmm0
003d3 4403cb                         add        r9d, ebx
003d6 44898c24a8000000               mov        dword ptr [rsp + 0xa8], r9d
003de e941020000                     jmp        0x7ffaebe755a4
003e3 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
003eb 4b8d7c3208                     lea        rdi, [r10 + r14 + 8]
003f0 498d741a08                     lea        rsi, [r10 + rbx + 8]
003f5 458d1c19                       lea        r11d, [r9 + rbx]
003f9 44899c24a8000000               mov        dword ptr [rsp + 0xa8], r11d
00401 4d63c3                         movsxd     r8, r11d
00404 453be9                         cmp        r13d, r9d
00407 0f8ce1030000                   jl         0x7ffaebe7576e
0040d 4183f930                       cmp        r9d, 0x30
00411 0f8e89000000                   jle        0x7ffaebe75420
00417 4585f6                         test       r14d, r14d
0041a 0f8c90150000                   jl         0x7ffaebe76930
00420 85db                           test       ebx, ebx
00422 0f8c88150000                   jl         0x7ffaebe76930
00428 478d1431                       lea        r10d, [r9 + r14]
0042c 448b6c2404                     mov        r13d, dword ptr [rsp + 4]
00431 453bea                         cmp        r13d, r10d
00434 0f8276150000                   jb         0x7ffaebe76930
0043a 453beb                         cmp        r13d, r11d
0043d 0f826d150000                   jb         0x7ffaebe76930
00443 4585c9                         test       r9d, r9d
00446 0f845c150000                   je         0x7ffaebe76928
0044c 4963d1                         movsxd     rdx, r9d
0044f 4883fa20                       cmp        rdx, 0x20
00453 772b                           ja         0x7ffaebe75400
00455 458bd1                         mov        r10d, r9d
00458 4d63d2                         movsxd     r10, r10d
0045b 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00462 c442a8f5db                     bzhi       r11, r11, r10
00467 c4c1fb92fb                     kmovq      k7, r11
0046c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00472 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00478 418be9                         mov        ebp, r9d
0047b e99b010000                     jmp        0x7ffaebe7559b
00480 418be9                         mov        ebp, r9d
00483 c5f877                         vzeroupper 
00486 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
00490 41ffd2                         call       r10
00493 0f1f840000000000               nop        dword ptr [rax + rax]
0049b e97b010000                     jmp        0x7ffaebe7559b
004a0 443b742468                     cmp        r14d, dword ptr [rsp + 0x68]
004a5 0f831d130000                   jae        0x7ffaebe76748
004ab 4963fe                         movsxd     rdi, r14d
004ae 498b4c3a08                     mov        rcx, qword ptr [r10 + rdi + 8]
004b3 3b5c2468                       cmp        ebx, dword ptr [rsp + 0x68]
004b7 0f8377130000                   jae        0x7ffaebe767b4
004bd 448bd3                         mov        r10d, ebx
004c0 458d5a08                       lea        r11d, [r10 + 8]
004c4 4963d2                         movsxd     rdx, r10d
004c7 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
004cf 49894c1508                     mov        qword ptr [r13 + rdx + 8], rcx
004d4 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
004dc 7c08                           jl         0x7ffaebe75466
004de 418be9                         mov        ebp, r9d
004e1 e935010000                     jmp        0x7ffaebe7559b
004e6 482bfa                         sub        rdi, rdx
004e9 4963d3                         movsxd     rdx, r11d
004ec 488d0c3a                       lea        rcx, [rdx + rdi]
004f0 483b8c2498000000               cmp        rcx, qword ptr [rsp + 0x98]
004f8 0f83aa130000                   jae        0x7ffaebe76828
004fe 498bc8                         mov        rcx, r8
00501 482bca                         sub        rcx, rdx
00504 4883c107                       add        rcx, 7
00508 4883e1f8                       and        rcx, 0xfffffffffffffff8
0050c 8bc9                           mov        ecx, ecx
0050e 428d541108                     lea        edx, [rcx + r10 + 8]
00513 4863ca                         movsxd     rcx, edx
00516 488d7c39f8                     lea        rdi, [rcx + rdi - 8]
0051b 483bbc2498000000               cmp        rdi, qword ptr [rsp + 0x98]
00523 0f837f130000                   jae        0x7ffaebe76828
00529 443b5c2468                     cmp        r11d, dword ptr [rsp + 0x68]
0052e 0f8374130000                   jae        0x7ffaebe76828
00534 4883c1f8                       add        rcx, -8
00538 483b8c2498000000               cmp        rcx, qword ptr [rsp + 0x98]
00540 0f8362130000                   jae        0x7ffaebe76828
00546 448bac24a8000000               mov        r13d, dword ptr [rsp + 0xa8]
0054e 4181fdf8ffff7f                 cmp        r13d, 0x7ffffff8
00555 0f8fd5130000                   jg         0x7ffaebe768b0
0055b 452bf2                         sub        r14d, r10d
0055e 4183c210                       add        r10d, 0x10
00562 418be9                         mov        ebp, r9d
00565 438d0c1e                       lea        ecx, [r14 + r11]
00569 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
00571 498b4c0d08                     mov        rcx, qword ptr [r13 + rcx + 8]
00576 458bcb                         mov        r9d, r11d
00579 4b894c0d08                     mov        qword ptr [r13 + r9 + 8], rcx
0057e 4183c308                       add        r11d, 8
00582 453bda                         cmp        r11d, r10d
00585 7cde                           jl         0x7ffaebe754e5
00587 4983c0f8                       add        r8, -8
0058b 4981f800000080                 cmp        r8, -0x80000000
00592 49c7c200000080                 mov        r10, 0xffffffff80000000
00599 4d0f4cc2                       cmovl      r8, r10
0059d 458bd0                         mov        r10d, r8d
005a0 453bda                         cmp        r11d, r10d
005a3 7d43                           jge        0x7ffaebe75568
005a5 6666660f1f840000000000         nop        word ptr [rax + rax]
005b0 478d041e                       lea        r8d, [r14 + r11]
005b4 418bcb                         mov        ecx, r11d
005b7 4863c9                         movsxd     rcx, ecx
005ba 418bf8                         mov        edi, r8d
005bd 498b7c3d08                     mov        rdi, qword ptr [r13 + rdi + 8]
005c2 4963d0                         movsxd     rdx, r8d
005c5 458bc3                         mov        r8d, r11d
005c8 4b897c0508                     mov        qword ptr [r13 + r8 + 8], rdi
005cd 4d8b441510                     mov        r8, qword ptr [r13 + rdx + 0x10]
005d2 4d89440d10                     mov        qword ptr [r13 + rcx + 0x10], r8
005d7 4183c310                       add        r11d, 0x10
005db 453bda                         cmp        r11d, r10d
005de 7cd0                           jl         0x7ffaebe75530
005e0 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
005e8 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
005f0 7d29                           jge        0x7ffaebe7559b
005f2 6690                           nop        
005f4 478d141e                       lea        r10d, [r14 + r11]
005f8 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
00600 4f8b541508                     mov        r10, qword ptr [r13 + r10 + 8]
00605 458bc3                         mov        r8d, r11d
00608 4f89540508                     mov        qword ptr [r13 + r8 + 8], r10
0060d 4183c308                       add        r11d, 8
00611 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
00619 7cd9                           jl         0x7ffaebe75574
0061b 03dd                           add        ebx, ebp
0061d 899c24a8000000                 mov        dword ptr [rsp + 0xa8], ebx
00624 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
0062b ffc3                           inc        ebx
0062d 3b5c2438                       cmp        ebx, dword ptr [rsp + 0x38]
00631 0f8da0050000                   jge        0x7ffaebe75b57
00637 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0063f 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
00646 899c24b0000000                 mov        dword ptr [rsp + 0xb0], ebx
0064d 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00652 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
00659 4d8b5cdb08                     mov        r11, qword ptr [r11 + rbx*8 + 8]
0065e 418bdb                         mov        ebx, r11d
00661 81e3ffff0100                   and        ebx, 0x1ffff
00667 4d8bc3                         mov        r8, r11
0066a 49c1e812                       shr        r8, 0x12
0066e 49c1fb24                       sar        r11, 0x24
00672 458bf0                         mov        r14d, r8d
00675 458beb                         mov        r13d, r11d
00678 4181e6ffff0300                 and        r14d, 0x3ffff
0067f 4489742448                     mov        dword ptr [rsp + 0x48], r14d
00684 4585ed                         test       r13d, r13d
00687 0f8c770e0000                   jl         0x7ffaebe76484
0068d 85db                           test       ebx, ebx
0068f 0f8599000000                   jne        0x7ffaebe756ae
00695 33db                           xor        ebx, ebx
00697 4183fd03                       cmp        r13d, 3
0069b 0f8ebf000000                   jle        0x7ffaebe756e0
006a1 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
006a9 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
006ad 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
006b5 45895810                       mov        dword ptr [r8 + 0x10], r11d
006b9 458b4008                       mov        r8d, dword ptr [r8 + 8]
006bd 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
006c5 4589430c                       mov        dword ptr [r11 + 0xc], r8d
006c9 4183c5fd                       add        r13d, -3
006cd 45896b08                       mov        dword ptr [r11 + 8], r13d
006d1 4963ed                         movsxd     rbp, r13d
006d4 4c63d8                         movsxd     r11, eax
006d7 4c035c2420                     add        r11, qword ptr [rsp + 0x20]
006dc 4863d3                         movsxd     rdx, ebx
006df 4c03da                         add        r11, rdx
006e2 493beb                         cmp        rbp, r11
006e5 0f8f990e0000                   jg         0x7ffaebe76504
006eb 448d3418                       lea        r14d, [rax + rbx]
006ef 448974244c                     mov        dword ptr [rsp + 0x4c], r14d
006f4 452bf5                         sub        r14d, r13d
006f7 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
006fc 4585c9                         test       r9d, r9d
006ff 0f85ecfbffff                   jne        0x7ffaebe75271
00705 4d63c6                         movsxd     r8, r14d
00708 4c3b442428                     cmp        r8, qword ptr [rsp + 0x28]
0070d 0f8cdd0f0000                   jl         0x7ffaebe76670
00713 483b6c2430                     cmp        rbp, qword ptr [rsp + 0x30]
00718 0f8f3e100000                   jg         0x7ffaebe766dc
0071e 4533c0                         xor        r8d, r8d
00721 44898424ac000000               mov        dword ptr [rsp + 0xac], r8d
00729 e9d8fbffff                     jmp        0x7ffaebe75286
0072e 448b0424                       mov        r8d, dword ptr [rsp]
00732 452bc2                         sub        r8d, r10d
00735 413bd8                         cmp        ebx, r8d
00738 0f8e59ffffff                   jle        0x7ffaebe75617
0073e be45ffffff                     mov        esi, 0xffffff45
00743 8beb                           mov        ebp, ebx
00745 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
0074d 666690                         nop        
00750 c5f877                         vzeroupper 
00753 e888dfb4ff                     call       0x7ffaeb9c3660
00758 0f1f840050080001               nop        dword ptr [rax + rax + 0x1000850]
00760 85db                           test       ebx, ebx
00762 7403                           je         0x7ffaebe756e7
00764 41ffcd                         dec        r13d
00767 4585ed                         test       r13d, r13d
0076a 750e                           jne        0x7ffaebe756fa
0076c 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00774 458b4308                       mov        r8d, dword ptr [r11 + 8]
00778 eb6c                           jmp        0x7ffaebe75766
0077a 4183fd03                       cmp        r13d, 3
0077e 0f849c170000                   je         0x7ffaebe76ea0
00784 4183fd02                       cmp        r13d, 2
00788 0f8716180000                   ja         0x7ffaebe76f24
0078e 443bac24e4000000               cmp        r13d, dword ptr [rsp + 0xe4]
00796 0f83a7130000                   jae        0x7ffaebe76ac3
0079c 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
007a4 478b44ab08                     mov        r8d, dword ptr [r11 + r13*4 + 8]
007a9 4585ed                         test       r13d, r13d
007ac 7e2c                           jle        0x7ffaebe7575a
007ae 458d5dff                       lea        r11d, [r13 - 1]
007b2 443b9c24e4000000               cmp        r11d, dword ptr [rsp + 0xe4]
007ba 0f83d8160000                   jae        0x7ffaebe76e18
007c0 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
007c8 478b4cab04                     mov        r9d, dword ptr [r11 + r13*4 + 4]
007cd 47894cab08                     mov        dword ptr [r11 + r13*4 + 8], r9d
007d2 41ffcd                         dec        r13d
007d5 4585ed                         test       r13d, r13d
007d8 7fe6                           jg         0x7ffaebe75740
007da 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
007e2 45894308                       mov        dword ptr [r11 + 8], r8d
007e6 458be8                         mov        r13d, r8d
007e9 e9e3feffff                     jmp        0x7ffaebe75651
007ee 4183fd10                       cmp        r13d, 0x10
007f2 0f8d7d080000                   jge        0x7ffaebe75ff5
007f8 4183fd08                       cmp        r13d, 8
007fc 0f8de0040000                   jge        0x7ffaebe75c62
00802 4183f910                       cmp        r9d, 0x10
00806 0f8f41010000                   jg         0x7ffaebe758cd
0080c 443b742404                     cmp        r14d, dword ptr [rsp + 4]
00811 0f83cc130000                   jae        0x7ffaebe76b63
00817 430fbe6c3208                   movsx      ebp, byte ptr [r10 + r14 + 8]
0081d 3b5c2404                       cmp        ebx, dword ptr [rsp + 4]
00821 0f8325140000                   jae        0x7ffaebe76bcc
00827 41886c1a08                     mov        byte ptr [r10 + rbx + 8], bpl
0082c 448d5b01                       lea        r11d, [rbx + 1]
00830 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00835 458d5603                       lea        r10d, [r14 + 3]
00839 443b542404                     cmp        r10d, dword ptr [rsp + 4]
0083e 0f8354140000                   jae        0x7ffaebe76c18
00844 4d63c6                         movsxd     r8, r14d
00847 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0084f 430fbe6c0209                   movsx      ebp, byte ptr [r10 + r8 + 9]
00855 448d5b03                       lea        r11d, [rbx + 3]
00859 443b5c2404                     cmp        r11d, dword ptr [rsp + 4]
0085e 0f8384140000                   jae        0x7ffaebe76c68
00864 4863cb                         movsxd     rcx, ebx
00867 41886c0a09                     mov        byte ptr [r10 + rcx + 9], bpl
0086c 470fbe54020a                   movsx      r10d, byte ptr [r10 + r8 + 0xa]
00872 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0087a 4588540b0a                     mov        byte ptr [r11 + rcx + 0xa], r10b
0087f 470fbe54030b                   movsx      r10d, byte ptr [r11 + r8 + 0xb]
00885 4588540b0b                     mov        byte ptr [r11 + rcx + 0xb], r10b
0088a 4183fd08                       cmp        r13d, 8
0088e 0f83a0140000                   jae        0x7ffaebe76cb4
00894 49ba60ac28e300000000           movabs     r10, 0xe328ac60
0089e 470374aa08                     add        r14d, dword ptr [r10 + r13*4 + 8]
008a3 4183f904                       cmp        r9d, 4
008a7 7e44                           jle        0x7ffaebe7586d
008a9 448d5304                       lea        r10d, [rbx + 4]
008ad 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
008b2 443b742458                     cmp        r14d, dword ptr [rsp + 0x58]
008b7 0f83e7140000                   jae        0x7ffaebe76d24
008bd 458bde                         mov        r11d, r14d
008c0 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
008c5 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
008cd 438b6c1808                     mov        ebp, dword ptr [r8 + r11 + 8]
008d2 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
008d7 443b542458                     cmp        r10d, dword ptr [rsp + 0x58]
008dc 0f8332150000                   jae        0x7ffaebe76d94
008e2 448bd3                         mov        r10d, ebx
008e5 4d63da                         movsxd     r11, r10d
008e8 43896c180c                     mov        dword ptr [r8 + r11 + 0xc], ebp
008ed 4183f908                       cmp        r9d, 8
008f1 0f8e2dfdffff                   jle        0x7ffaebe755a4
008f7 448d5308                       lea        r10d, [rbx + 8]
008fb 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
00900 49ba88ac28e300000000           movabs     r10, 0xe328ac88
0090a 478b5caa08                     mov        r11d, dword ptr [r10 + r13*4 + 8]
0090f 452bf3                         sub        r14d, r11d
00912 418d6e08                       lea        ebp, [r14 + 8]
00916 3b6c2468                       cmp        ebp, dword ptr [rsp + 0x68]
0091a 0f8308170000                   jae        0x7ffaebe76fa8
00920 4d63d6                         movsxd     r10, r14d
00923 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
0092b 4b8b6c1510                     mov        rbp, qword ptr [r13 + r10 + 0x10]
00930 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00935 443b5c2468                     cmp        r11d, dword ptr [rsp + 0x68]
0093a 0f8328170000                   jae        0x7ffaebe76fe8
00940 4c63d3                         movsxd     r10, ebx
00943 4b896c1510                     mov        qword ptr [r13 + r10 + 0x10], rbp
00948 e9d7fcffff                     jmp        0x7ffaebe755a4
0094d 4585f6                         test       r14d, r14d
00950 0f8c46170000                   jl         0x7ffaebe7701c
00956 85db                           test       ebx, ebx
00958 0f8c3e170000                   jl         0x7ffaebe7701c
0095e 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00963 443bdb                         cmp        r11d, ebx
00966 0f8230170000                   jb         0x7ffaebe7701c
0096c 468d1c2b                       lea        r11d, [rbx + r13]
00970 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00975 448b542404                     mov        r10d, dword ptr [rsp + 4]
0097a 453bd3                         cmp        r10d, r11d
0097d 0f8219170000                   jb         0x7ffaebe7701c
00983 4585ed                         test       r13d, r13d
00986 0f8c10170000                   jl         0x7ffaebe7701c
0098c 4585ed                         test       r13d, r13d
0098f 0f84a8f8ffff                   je         0x7ffaebe751bd
00995 4883fd20                       cmp        rbp, 0x20
00999 7728                           ja         0x7ffaebe75943
0099b 458bdd                         mov        r11d, r13d
0099e 4d63d3                         movsxd     r10, r11d
009a1 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
009a8 c442a8f5db                     bzhi       r11, r11, r10
009ad c4c1fb92fb                     kmovq      k7, r11
009b2 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
009b8 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
009be e97af8ffff                     jmp        0x7ffaebe751bd
009c3 488bd5                         mov        rdx, rbp
009c6 c5f877                         vzeroupper 
009c9 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
009d3 41ffd2                         call       r10
009d6 0f1f840000000000               nop        dword ptr [rax + rax]
009de e95af8ffff                     jmp        0x7ffaebe751bd
009e3 83fb30                         cmp        ebx, 0x30
009e6 0f8e96000000                   jle        0x7ffaebe75a02
009ec 4585d2                         test       r10d, r10d
009ef 0f8c1b190000                   jl         0x7ffaebe77290
009f5 85c0                           test       eax, eax
009f7 0f8c13190000                   jl         0x7ffaebe77290
009fd 448b8424e0000000               mov        r8d, dword ptr [rsp + 0xe0]
00a05 453bc3                         cmp        r8d, r11d
00a08 0f8202190000                   jb         0x7ffaebe77290
00a0e 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00a13 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
00a18 0f82f2180000                   jb         0x7ffaebe77290
00a1e 85db                           test       ebx, ebx
00a20 743d                           je         0x7ffaebe759df
00a22 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00a27 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00a2c 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00a34 498d740308                     lea        rsi, [r11 + rax + 8]
00a39 4883fa20                       cmp        rdx, 0x20
00a3d 7729                           ja         0x7ffaebe759e8
00a3f 4c63d3                         movsxd     r10, ebx
00a42 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00a49 c442a8f5db                     bzhi       r11, r11, r10
00a4e c4c1fb92fb                     kmovq      k7, r11
00a53 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00a59 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00a5f 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
00a63 e929f9ffff                     jmp        0x7ffaebe75311
00a68 c5f877                         vzeroupper 
00a6b 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
00a75 41ffd2                         call       r10
00a78 0f1f840000000000               nop        dword ptr [rax + rax]
00a80 ebdd                           jmp        0x7ffaebe759df
00a82 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
00a87 0f8357170000                   jae        0x7ffaebe77164
00a8d 4d63da                         movsxd     r11, r10d
00a90 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
00a95 c4817a6f441808                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 8]
00a9c 3b842490000000                 cmp        eax, dword ptr [rsp + 0x90]
00aa3 0f83d3170000                   jae        0x7ffaebe771fc
00aa9 448d4010                       lea        r8d, [rax + 0x10]
00aad 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
00ab2 4863c8                         movsxd     rcx, eax
00ab5 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00abd c4c17a7f440808                 vmovdqu    xmmword ptr [r8 + rcx + 8], xmm0
00ac4 448b4c245c                     mov        r9d, dword ptr [rsp + 0x5c]
00ac9 443b4c244c                     cmp        r9d, dword ptr [rsp + 0x4c]
00ace 0f8dc9000000                   jge        0x7ffaebe75b1d
00ad4 4c2bd9                         sub        r11, rcx
00ad7 4d63c9                         movsxd     r9, r9d
00ada 48634c2418                     movsxd     rcx, dword ptr [rsp + 0x18]
00adf 4883c1f1                       add        rcx, -0xf
00ae3 4f8d0419                       lea        r8, [r9 + r11]
00ae7 4c3bc1                         cmp        r8, rcx
00aea 0f83a0180000                   jae        0x7ffaebe77310
00af0 4c6344244c                     movsxd     r8, dword ptr [rsp + 0x4c]
00af5 4d2bc1                         sub        r8, r9
00af8 4983c00f                       add        r8, 0xf
00afc 4983e0f0                       and        r8, 0xfffffffffffffff0
00b00 458bc8                         mov        r9d, r8d
00b03 458d440110                     lea        r8d, [r9 + rax + 0x10]
00b08 4d63c0                         movsxd     r8, r8d
00b0b 4f8d5c18f0                     lea        r11, [r8 + r11 - 0x10]
00b10 4c3bd9                         cmp        r11, rcx
00b13 0f8377180000                   jae        0x7ffaebe77310
00b19 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00b1e 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
00b26 0f8364180000                   jae        0x7ffaebe77310
00b2c 4983c0f0                       add        r8, -0x10
00b30 4c3b8424a0000000               cmp        r8, qword ptr [rsp + 0xa0]
00b38 0f8352180000                   jae        0x7ffaebe77310
00b3e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00b43 4181fbf0ffff7f                 cmp        r11d, 0x7ffffff0
00b4a 0f8f9c180000                   jg         0x7ffaebe7736c
00b50 458bc2                         mov        r8d, r10d
00b53 442bc0                         sub        r8d, eax
00b56 66660f1f840000000000           nop        word ptr [rax + rax]
00b60 458bc8                         mov        r9d, r8d
00b63 44034c245c                     add        r9d, dword ptr [rsp + 0x5c]
00b68 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00b6d c4817a6f440b08                 vmovdqu    xmm0, xmmword ptr [r11 + r9 + 8]
00b74 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00b79 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
00b81 c4817a7f441908                 vmovdqu    xmmword ptr [r9 + r11 + 8], xmm0
00b88 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00b8d 4183c310                       add        r11d, 0x10
00b91 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00b96 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
00b9b 7cc3                           jl         0x7ffaebe75ae0
00b9d 468d0413                       lea        r8d, [rbx + r10]
00ba1 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
00ba5 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
00bad e9dff7ffff                     jmp        0x7ffaebe75311
00bb2 4c63d5                         movsxd     r10, ebp
00bb5 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00bbc c442a8f5db                     bzhi       r11, r11, r10
00bc1 c4c1fb92fb                     kmovq      k7, r11
00bc6 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00bcc 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00bd2 e9a4000000                     jmp        0x7ffaebe75bfb
00bd7 8b2c24                         mov        ebp, dword ptr [rsp]
00bda 2bac2494000000                 sub        ebp, dword ptr [rsp + 0x94]
00be1 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
00be9 4585c0                         test       r8d, r8d
00bec 0f8ca2150000                   jl         0x7ffaebe77114
00bf2 488b5c2478                     mov        rbx, qword ptr [rsp + 0x78]
00bf7 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00bfc 8bb424e0000000                 mov        esi, dword ptr [rsp + 0xe0]
00c03 448bb42484000000               mov        r14d, dword ptr [rsp + 0x84]
00c0b 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00c13 4585d2                         test       r10d, r10d
00c16 0f8c92150000                   jl         0x7ffaebe7712e
00c1c 3b3424                         cmp        esi, dword ptr [rsp]
00c1f 0f8289150000                   jb         0x7ffaebe7712e
00c25 418b4e04                       mov        ecx, dword ptr [r14 + 4]
00c29 448bac24a8000000               mov        r13d, dword ptr [rsp + 0xa8]
00c31 4403ed                         add        r13d, ebp
00c34 413bcd                         cmp        ecx, r13d
00c37 0f8271150000                   jb         0x7ffaebe7712e
00c3d 85ed                           test       ebp, ebp
00c3f 0f8c69150000                   jl         0x7ffaebe7712e
00c45 85ed                           test       ebp, ebp
00c47 7432                           je         0x7ffaebe75bfb
00c49 4b8d7c0308                     lea        rdi, [r11 + r8 + 8]
00c4e 4d8bde                         mov        r11, r14
00c51 4b8d741608                     lea        rsi, [r14 + r10 + 8]
00c56 4863d5                         movsxd     rdx, ebp
00c59 4883fa20                       cmp        rdx, 0x20
00c5d 0f864fffffff                   jbe        0x7ffaebe75b32
00c63 c5f877                         vzeroupper 
00c66 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
00c70 41ffd2                         call       r10
00c73 0f1f840000000000               nop        dword ptr [rax + rax]
00c7b 44896b38                       mov        dword ptr [rbx + 0x38], r13d
00c7f c5f877                         vzeroupper 
00c82 4881c4d0000000                 add        rsp, 0xd0
00c89 5d                             pop        rbp
00c8a 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00c8e 0f87001b0000                   ja         0x7ffaebe77714
00c94 c3                             ret        
00c95 418bea                         mov        ebp, r10d
00c98 896c2440                       mov        dword ptr [rsp + 0x40], ebp
00c9c 418bd8                         mov        ebx, r8d
00c9f 90                             nop        
00ca0 448bd0                         mov        r10d, eax
00ca3 4403542440                     add        r10d, dword ptr [rsp + 0x40]
00ca8 62b17e486f841308000000         vmovdqu32  zmm0, zmmword ptr [rbx + r10 + 8]
00cb3 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00cb8 62b17e487f841b08000000         vmovdqu32  zmmword ptr [rbx + r11 + 8], zmm0
00cc3 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00cc8 4183c240                       add        r10d, 0x40
00ccc 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00cd1 443bd1                         cmp        r10d, ecx
00cd4 7cca                           jl         0x7ffaebe75c20
00cd6 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
00cdd e934030000                     jmp        0x7ffaebe75f96
00ce2 443b742468                     cmp        r14d, dword ptr [rsp + 0x68]
00ce7 0f835b170000                   jae        0x7ffaebe773c8
00ced 458bde                         mov        r11d, r14d
00cf0 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00cf5 4963cb                         movsxd     rcx, r11d
00cf8 4d8b540a08                     mov        r10, qword ptr [r10 + rcx + 8]
00cfd 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00d02 3b5c2468                       cmp        ebx, dword ptr [rsp + 0x68]
00d06 0f83a0170000                   jae        0x7ffaebe7742c
00d0c 448bcb                         mov        r9d, ebx
00d0f 418d6908                       lea        ebp, [r9 + 8]
00d13 896c2440                       mov        dword ptr [rsp + 0x40], ebp
00d17 4d63d1                         movsxd     r10, r9d
00d1a 4c8b5c2460                     mov        r11, qword ptr [rsp + 0x60]
00d1f 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
00d27 4f895c1508                     mov        qword ptr [r13 + r10 + 8], r11
00d2c 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
00d33 0f8debf8ffff                   jge        0x7ffaebe755a4
00d39 492bca                         sub        rcx, r10
00d3c 4863fd                         movsxd     rdi, ebp
00d3f 4c8d140f                       lea        r10, [rdi + rcx]
00d43 4c3b942498000000               cmp        r10, qword ptr [rsp + 0x98]
00d4b 0f83bb170000                   jae        0x7ffaebe7748c
00d51 4d8bd0                         mov        r10, r8
00d54 4c2bd7                         sub        r10, rdi
00d57 4983c207                       add        r10, 7
00d5b 4983e2f8                       and        r10, 0xfffffffffffffff8
00d5f 458bda                         mov        r11d, r10d
00d62 478d540b08                     lea        r10d, [r11 + r9 + 8]
00d67 4d63d2                         movsxd     r10, r10d
00d6a 4d8d5c0af8                     lea        r11, [r10 + rcx - 8]
00d6f 4c3b9c2498000000               cmp        r11, qword ptr [rsp + 0x98]
00d77 0f838f170000                   jae        0x7ffaebe7748c
00d7d 3b6c2468                       cmp        ebp, dword ptr [rsp + 0x68]
00d81 0f8385170000                   jae        0x7ffaebe7748c
00d87 4983c2f8                       add        r10, -8
00d8b 4c3b942498000000               cmp        r10, qword ptr [rsp + 0x98]
00d93 0f8373170000                   jae        0x7ffaebe7748c
00d99 448bac24a8000000               mov        r13d, dword ptr [rsp + 0xa8]
00da1 4181fdf8ffff7f                 cmp        r13d, 0x7ffffff8
00da8 0f8fde170000                   jg         0x7ffaebe7750c
00dae 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
00db2 412be9                         sub        ebp, r9d
00db5 8bc5                           mov        eax, ebp
00db7 baf8ffffff                     mov        edx, 0xfffffff8
00dbc 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
00dc4 458bdd                         mov        r11d, r13d
00dc7 412bd3                         sub        edx, r11d
00dca 412bd1                         sub        edx, r9d
00dcd 4183c110                       add        r9d, 0x10
00dd1 83c2f0                         add        edx, -0x10
00dd4 4d8d50c8                       lea        r10, [r8 - 0x38]
00dd8 4981fa00000080                 cmp        r10, -0x80000000
00ddf 49c7c300000080                 mov        r11, 0xffffffff80000000
00de6 4d0f4cd3                       cmovl      r10, r11
00dea 418bca                         mov        ecx, r10d
00ded 442bf3                         sub        r14d, ebx
00df0 4d63d9                         movsxd     r11, r9d
00df3 488b5c2410                     mov        rbx, qword ptr [rsp + 0x10]
00df8 41ba06000000                   mov        r10d, 6
00dfe c462a8f5d2                     bzhi       r10, rdx, r10
00e03 4d03da                         add        r11, r10
00e06 4d3bd8                         cmp        r11, r8
00e09 498bd0                         mov        rdx, r8
00e0c 490f4cd3                       cmovl      rdx, r11
00e10 4c8bd2                         mov        r10, rdx
00e13 4c2bd7                         sub        r10, rdi
00e16 4d8d5aff                       lea        r11, [r10 - 1]
00e1a 49c1fb3f                       sar        r11, 0x3f
00e1e 49c1eb3d                       shr        r11, 0x3d
00e22 4f8d5413ff                     lea        r10, [r11 + r10 - 1]
00e27 4983e2f8                       and        r10, 0xfffffffffffffff8
00e2b 4c03d7                         add        r10, rdi
00e2e 493bfa                         cmp        rdi, r10
00e31 490f4cfa                       cmovl      rdi, r10
00e35 448bd7                         mov        r10d, edi
00e38 438d7c1608                     lea        edi, [r14 + r10 + 8]
00e3d 4183c208                       add        r10d, 8
00e41 4c63df                         movsxd     r11, edi
00e44 4c03db                         add        r11, rbx
00e47 4963fa                         movsxd     rdi, r10d
00e4a 4803fb                         add        rdi, rbx
00e4d 498d5b08                       lea        rbx, [r11 + 8]
00e51 4983c348                       add        r11, 0x48
00e55 488d7748                       lea        rsi, [rdi + 0x48]
00e59 4533d2                         xor        r10d, r10d
00e5c 483bf3                         cmp        rsi, rbx
00e5f 410f96c2                       setbe      r10b
00e63 4883c708                       add        rdi, 8
00e67 33db                           xor        ebx, ebx
00e69 4c3bdf                         cmp        r11, rdi
00e6c 0f96c3                         setbe      bl
00e6f 440bd3                         or         r10d, ebx
00e72 0f84a00b0000                   je         0x7ffaebe76998
00e78 448bda                         mov        r11d, edx
00e7b 90                             nop        
00e7c 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00e81 8bd8                           mov        ebx, eax
00e83 035c2440                       add        ebx, dword ptr [rsp + 0x40]
00e87 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
00e8f 4d8b4c1d08                     mov        r9, qword ptr [r13 + rbx + 8]
00e94 4f894c1508                     mov        qword ptr [r13 + r10 + 8], r9
00e99 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
00e9e 4183c108                       add        r9d, 8
00ea2 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
00ea7 453bcb                         cmp        r9d, r11d
00eaa 7cd0                           jl         0x7ffaebe75dfc
00eac 4981c008feffff                 add        r8, -0x1f8
00eb3 4981f800000080                 cmp        r8, -0x80000000
00eba 49c7c200000080                 mov        r10, 0xffffffff80000000
00ec1 4d0f4cc2                       cmovl      r8, r10
00ec5 418bd8                         mov        ebx, r8d
00ec8 443bcb                         cmp        r9d, ebx
00ecb 0f8d45010000                   jge        0x7ffaebe75f96
00ed1 458bd9                         mov        r11d, r9d
00ed4 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00ed9 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00ee1 0f1f840000000000               nop        dword ptr [rax + rax]
00ee9 0f1f8000000000                 nop        dword ptr [rax]
00ef0 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00ef5 4963fb                         movsxd     rdi, r11d
00ef8 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00efd 448bd0                         mov        r10d, eax
00f00 4403542440                     add        r10d, dword ptr [rsp + 0x40]
00f05 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
00f0a 4183c140                       add        r9d, 0x40
00f0e 4403c8                         add        r9d, eax
00f11 418bd2                         mov        edx, r10d
00f14 62d17e486f841008000000         vmovdqu32  zmm0, zmmword ptr [r8 + rdx + 8]
00f1f 62917e487f841808000000         vmovdqu32  zmmword ptr [r8 + r11 + 8], zmm0
00f2a 62917e486f840808000000         vmovdqu32  zmm0, zmmword ptr [r8 + r9 + 8]
00f35 62d17e487f843848000000         vmovdqu32  zmmword ptr [r8 + rdi + 0x48], zmm0
00f40 4d63ca                         movsxd     r9, r10d
00f43 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00f48 4181c280000000                 add        r10d, 0x80
00f4f 4403d0                         add        r10d, eax
00f52 62917e486f841008000000         vmovdqu32  zmm0, zmmword ptr [r8 + r10 + 8]
00f5d 62d17e487f843888000000         vmovdqu32  zmmword ptr [r8 + rdi + 0x88], zmm0
00f68 62917e486f8408c8000000         vmovdqu32  zmm0, zmmword ptr [r8 + r9 + 0xc8]
00f73 62d17e487f8438c8000000         vmovdqu32  zmmword ptr [r8 + rdi + 0xc8], zmm0
00f7e 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00f83 4181c200010000                 add        r10d, 0x100
00f8a 4403d0                         add        r10d, eax
00f8d 458bda                         mov        r11d, r10d
00f90 62917e486f841008000000         vmovdqu32  zmm0, zmmword ptr [r8 + r10 + 8]
00f9b 62d17e487f843808010000         vmovdqu32  zmmword ptr [r8 + rdi + 0x108], zmm0
00fa6 62917e486f840848010000         vmovdqu32  zmm0, zmmword ptr [r8 + r9 + 0x148]
00fb1 62d17e487f843848010000         vmovdqu32  zmmword ptr [r8 + rdi + 0x148], zmm0
00fbc 62917e486f840888010000         vmovdqu32  zmm0, zmmword ptr [r8 + r9 + 0x188]
00fc7 62d17e487f843888010000         vmovdqu32  zmmword ptr [r8 + rdi + 0x188], zmm0
00fd2 4d63d3                         movsxd     r10, r11d
00fd5 62917e486f8410c8000000         vmovdqu32  zmm0, zmmword ptr [r8 + r10 + 0xc8]
00fe0 62d17e487f8438c8010000         vmovdqu32  zmmword ptr [r8 + rdi + 0x1c8], zmm0
00feb 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00ff0 4181c200020000                 add        r10d, 0x200
00ff7 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00ffc 443bd3                         cmp        r10d, ebx
00fff 0f8cebfeffff                   jl         0x7ffaebe75e70
01005 443bd1                         cmp        r10d, ecx
01008 0f8c87fcffff                   jl         0x7ffaebe75c15
0100e 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
01016 8b6c2440                       mov        ebp, dword ptr [rsp + 0x40]
0101a 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
01021 0f8dfdf5ffff                   jge        0x7ffaebe755a4
01027 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
0102c 468d1c00                       lea        r11d, [rax + r8]
01030 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
01037 4e8b5c1b08                     mov        r11, qword ptr [rbx + r11 + 8]
0103c 458bd0                         mov        r10d, r8d
0103f 4e895c1308                     mov        qword ptr [rbx + r10 + 8], r11
01044 4183c008                       add        r8d, 8
01048 443b8424a8000000               cmp        r8d, dword ptr [rsp + 0xa8]
01050 7cda                           jl         0x7ffaebe75fac
01052 e9cdf5ffff                     jmp        0x7ffaebe755a4
01057 4d03da                         add        r11, r10
0105a 4c3bdf                         cmp        r11, rdi
0105d 7e08                           jle        0x7ffaebe75fe7
0105f 4533c9                         xor        r9d, r9d
01062 e939f0ffff                     jmp        0x7ffaebe75020
01067 4533c9                         xor        r9d, r9d
0106a 41bd01000000                   mov        r13d, 1
01070 e92ef0ffff                     jmp        0x7ffaebe75023
01075 443bb42490000000               cmp        r14d, dword ptr [rsp + 0x90]
0107d 0f8379150000                   jae        0x7ffaebe7757c
01083 4d63ce                         movsxd     r9, r14d
01086 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
0108d 3b9c2490000000                 cmp        ebx, dword ptr [rsp + 0x90]
01094 0f83c6150000                   jae        0x7ffaebe775e0
0109a 8d6b10                         lea        ebp, [rbx + 0x10]
0109d 4c63d3                         movsxd     r10, ebx
010a0 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
010a8 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
010af 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
010b6 0f8d68f5ffff                   jge        0x7ffaebe755a4
010bc 4d2bca                         sub        r9, r10
010bf 4c63dd                         movsxd     r11, ebp
010c2 4f8d140b                       lea        r10, [r11 + r9]
010c6 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
010ce 0f83f8150000                   jae        0x7ffaebe7764c
010d4 4d8bd0                         mov        r10, r8
010d7 4d2bd3                         sub        r10, r11
010da 4983c20f                       add        r10, 0xf
010de 4983e2f0                       and        r10, 0xfffffffffffffff0
010e2 458bda                         mov        r11d, r10d
010e5 458d541b10                     lea        r10d, [r11 + rbx + 0x10]
010ea 4d63d2                         movsxd     r10, r10d
010ed 4f8d5c0af0                     lea        r11, [r10 + r9 - 0x10]
010f2 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
010fa 0f83cc150000                   jae        0x7ffaebe7764c
01100 3bac2490000000                 cmp        ebp, dword ptr [rsp + 0x90]
01107 0f83bf150000                   jae        0x7ffaebe7764c
0110d 4983c2f0                       add        r10, -0x10
01111 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
01119 0f83ad150000                   jae        0x7ffaebe7764c
0111f 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
01127 4181faf0ffff7f                 cmp        r10d, 0x7ffffff0
0112e 0f8fe0150000                   jg         0x7ffaebe77694
01134 442bf3                         sub        r14d, ebx
01137 83c320                         add        ebx, 0x20
0113a 6690                           nop        
0113c 458d1c2e                       lea        r11d, [r14 + rbp]
01140 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
01148 c4817a6f441d08                 vmovdqu    xmm0, xmmword ptr [r13 + r11 + 8]
0114f 448bd5                         mov        r10d, ebp
01152 c4817a7f441508                 vmovdqu    xmmword ptr [r13 + r10 + 8], xmm0
01159 83c510                         add        ebp, 0x10
0115c 3beb                           cmp        ebp, ebx
0115e 7cdc                           jl         0x7ffaebe760bc
01160 4981c010ffffff                 add        r8, -0xf0
01167 4981f800000080                 cmp        r8, -0x80000000
0116e 49c7c200000080                 mov        r10, 0xffffffff80000000
01175 4d0f4cc2                       cmovl      r8, r10
01179 458bc8                         mov        r9d, r8d
0117c 413be9                         cmp        ebp, r9d
0117f 0f8d44010000                   jge        0x7ffaebe76249
01185 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
0118c 0f1f4000                       nop        dword ptr [rax]
01190 458d042e                       lea        r8d, [r14 + rbp]
01194 448bdd                         mov        r11d, ebp
01197 4d63db                         movsxd     r11, r11d
0119a 458bd0                         mov        r10d, r8d
0119d c4a17a6f441308                 vmovdqu    xmm0, xmmword ptr [rbx + r10 + 8]
011a4 4d63c0                         movsxd     r8, r8d
011a7 448bd5                         mov        r10d, ebp
011aa c4a17a7f441308                 vmovdqu    xmmword ptr [rbx + r10 + 8], xmm0
011b1 c4a17a6f440318                 vmovdqu    xmm0, xmmword ptr [rbx + r8 + 0x18]
011b8 c4a17a7f441b18                 vmovdqu    xmmword ptr [rbx + r11 + 0x18], xmm0
011bf c4a17a6f440328                 vmovdqu    xmm0, xmmword ptr [rbx + r8 + 0x28]
011c6 c4a17a7f441b28                 vmovdqu    xmmword ptr [rbx + r11 + 0x28], xmm0
011cd c4a17a6f440338                 vmovdqu    xmm0, xmmword ptr [rbx + r8 + 0x38]
011d4 c4a17a7f441b38                 vmovdqu    xmmword ptr [rbx + r11 + 0x38], xmm0
011db c4a17a6f440348                 vmovdqu    xmm0, xmmword ptr [rbx + r8 + 0x48]
011e2 c4a17a7f441b48                 vmovdqu    xmmword ptr [rbx + r11 + 0x48], xmm0
011e9 c4a17a6f440358                 vmovdqu    xmm0, xmmword ptr [rbx + r8 + 0x58]
011f0 c4a17a7f441b58                 vmovdqu    xmmword ptr [rbx + r11 + 0x58], xmm0
011f7 c4a17a6f440368                 vmovdqu    xmm0, xmmword ptr [rbx + r8 + 0x68]
011fe c4a17a7f441b68                 vmovdqu    xmmword ptr [rbx + r11 + 0x68], xmm0
01205 c4a17a6f440378                 vmovdqu    xmm0, xmmword ptr [rbx + r8 + 0x78]
0120c c4a17a7f441b78                 vmovdqu    xmmword ptr [rbx + r11 + 0x78], xmm0
01213 c4a17a6f840388000000           vmovdqu    xmm0, xmmword ptr [rbx + r8 + 0x88]
0121d c4a17a7f841b88000000           vmovdqu    xmmword ptr [rbx + r11 + 0x88], xmm0
01227 c4a17a6f840398000000           vmovdqu    xmm0, xmmword ptr [rbx + r8 + 0x98]
01231 c4a17a7f841b98000000           vmovdqu    xmmword ptr [rbx + r11 + 0x98], xmm0
0123b c4a17a6f8403a8000000           vmovdqu    xmm0, xmmword ptr [rbx + r8 + 0xa8]
01245 c4a17a7f841ba8000000           vmovdqu    xmmword ptr [rbx + r11 + 0xa8], xmm0
0124f c4a17a6f8403b8000000           vmovdqu    xmm0, xmmword ptr [rbx + r8 + 0xb8]
01259 c4a17a7f841bb8000000           vmovdqu    xmmword ptr [rbx + r11 + 0xb8], xmm0
01263 c4a17a6f8403c8000000           vmovdqu    xmm0, xmmword ptr [rbx + r8 + 0xc8]
0126d c4a17a7f841bc8000000           vmovdqu    xmmword ptr [rbx + r11 + 0xc8], xmm0
01277 c4a17a6f8403d8000000           vmovdqu    xmm0, xmmword ptr [rbx + r8 + 0xd8]
01281 c4a17a7f841bd8000000           vmovdqu    xmmword ptr [rbx + r11 + 0xd8], xmm0
0128b c4a17a6f8403e8000000           vmovdqu    xmm0, xmmword ptr [rbx + r8 + 0xe8]
01295 c4a17a7f841be8000000           vmovdqu    xmmword ptr [rbx + r11 + 0xe8], xmm0
0129f c4a17a6f8403f8000000           vmovdqu    xmm0, xmmword ptr [rbx + r8 + 0xf8]
012a9 c4a17a7f841bf8000000           vmovdqu    xmmword ptr [rbx + r11 + 0xf8], xmm0
012b3 81c500010000                   add        ebp, 0x100
012b9 413be9                         cmp        ebp, r9d
012bc 0f8ccefeffff                   jl         0x7ffaebe76110
012c2 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
012c9 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
012d0 0f8d4ef3ffff                   jge        0x7ffaebe755a4
012d6 6690                           nop        
012d8 458d1c2e                       lea        r11d, [r14 + rbp]
012dc 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
012e3 c4a17a6f441b08                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 8]
012ea 448bd5                         mov        r10d, ebp
012ed c4a17a7f441308                 vmovdqu    xmmword ptr [rbx + r10 + 8], xmm0
012f4 83c510                         add        ebp, 0x10
012f7 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
012fe 7cd8                           jl         0x7ffaebe76258
01300 e91ff3ffff                     jmp        0x7ffaebe755a4
01305 bee4ffffff                     mov        esi, 0xffffffe4
0130a 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0130f 448b1c24                       mov        r11d, dword ptr [rsp]
01313 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0131b 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01320 4c891c24                       mov        qword ptr [rsp], r11
01324 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01329 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01331 8944240c                       mov        dword ptr [rsp + 0xc], eax
01335 48ff742420                     push       qword ptr [rsp + 0x20]
0133a 488f442418                     pop        qword ptr [rsp + 0x18]
0133f 48ff742428                     push       qword ptr [rsp + 0x28]
01344 488f442420                     pop        qword ptr [rsp + 0x20]
01349 48ff742430                     push       qword ptr [rsp + 0x30]
0134e 488f442428                     pop        qword ptr [rsp + 0x28]
01353 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01357 48894424f8                     mov        qword ptr [rsp - 8], rax
0135c 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01360 89442440                       mov        dword ptr [rsp + 0x40], eax
01364 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01369 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
0136e 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01373 90                             nop        
01374 c5f877                         vzeroupper 
01377 e864d3b4ff                     call       0x7ffaeb9c3660
0137c 0f1f840074140002               nop        dword ptr [rax + rax + 0x2001474]
01384 bee4ffffff                     mov        esi, 0xffffffe4
01389 498beb                         mov        rbp, r11
0138c 448b0424                       mov        r8d, dword ptr [rsp]
01390 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
01398 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0139d 4c891c24                       mov        qword ptr [rsp], r11
013a1 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
013a6 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
013ae 4489542410                     mov        dword ptr [rsp + 0x10], r10d
013b3 48ff742420                     push       qword ptr [rsp + 0x20]
013b8 488f442418                     pop        qword ptr [rsp + 0x18]
013bd 48ff742428                     push       qword ptr [rsp + 0x28]
013c2 488f442420                     pop        qword ptr [rsp + 0x20]
013c7 48ff742430                     push       qword ptr [rsp + 0x30]
013cc 488f442428                     pop        qword ptr [rsp + 0x28]
013d1 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
013d5 48894424f8                     mov        qword ptr [rsp - 8], rax
013da 8b442448                       mov        eax, dword ptr [rsp + 0x48]
013de 89442440                       mov        dword ptr [rsp + 0x40], eax
013e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013e7 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
013ec 8944244c                       mov        dword ptr [rsp + 0x4c], eax
013f0 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
013f6 6690                           nop        
013f8 c5f877                         vzeroupper 
013fb e8e0d2b4ff                     call       0x7ffaeb9c3660
01400 0f1f8400f8140003               nop        dword ptr [rax + rax + 0x30014f8]
01408 bee4ffffff                     mov        esi, 0xffffffe4
0140d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01412 448b1424                       mov        r10d, dword ptr [rsp]
01416 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
0141e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01423 4c891424                       mov        qword ptr [rsp], r10
01427 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0142c 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01434 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01438 48ff742420                     push       qword ptr [rsp + 0x20]
0143d 488f442418                     pop        qword ptr [rsp + 0x18]
01442 48ff742428                     push       qword ptr [rsp + 0x28]
01447 488f442420                     pop        qword ptr [rsp + 0x20]
0144c 48ff742430                     push       qword ptr [rsp + 0x30]
01451 488f442428                     pop        qword ptr [rsp + 0x28]
01456 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
0145b 4489742444                     mov        dword ptr [rsp + 0x44], r14d
01460 c5f877                         vzeroupper 
01463 e878d2b4ff                     call       0x7ffaeb9c3660
01468 0f1f840060150004               nop        dword ptr [rax + rax + 0x4001560]
01470 bee4ffffff                     mov        esi, 0xffffffe4
01475 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0147a 448b1c24                       mov        r11d, dword ptr [rsp]
0147e 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01486 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0148b 4c891424                       mov        qword ptr [rsp], r10
0148f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01494 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
0149c 48ff742420                     push       qword ptr [rsp + 0x20]
014a1 488f442418                     pop        qword ptr [rsp + 0x18]
014a6 48ff742428                     push       qword ptr [rsp + 0x28]
014ab 488f442420                     pop        qword ptr [rsp + 0x20]
014b0 48ff742430                     push       qword ptr [rsp + 0x30]
014b5 488f442428                     pop        qword ptr [rsp + 0x28]
014ba 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
014bf 895c2444                       mov        dword ptr [rsp + 0x44], ebx
014c3 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
014c9 666690                         nop        
014cc c5f877                         vzeroupper 
014cf e80cd2b4ff                     call       0x7ffaeb9c3660
014d4 0f1f8400cc150005               nop        dword ptr [rax + rax + 0x50015cc]
014dc be45ffffff                     mov        esi, 0xffffff45
014e1 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
014e9 4489ac24e8000000               mov        dword ptr [rsp + 0xe8], r13d
014f1 666690                         nop        
014f4 c5f877                         vzeroupper 
014f7 e8e4d1b4ff                     call       0x7ffaeb9c3660
014fc 0f1f8400f4150006               nop        dword ptr [rax + rax + 0x60015f4]
01504 be45ffffff                     mov        esi, 0xffffff45
01509 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0150e 448b1c24                       mov        r11d, dword ptr [rsp]
01512 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0151a 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0151f 4c891c24                       mov        qword ptr [rsp], r11
01523 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01528 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
01530 8944240c                       mov        dword ptr [rsp + 0xc], eax
01534 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01539 48ff742420                     push       qword ptr [rsp + 0x20]
0153e 488f442418                     pop        qword ptr [rsp + 0x18]
01543 48894424f8                     mov        qword ptr [rsp - 8], rax
01548 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0154c 89442414                       mov        dword ptr [rsp + 0x14], eax
01550 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01555 48ff742428                     push       qword ptr [rsp + 0x28]
0155a 488f442420                     pop        qword ptr [rsp + 0x20]
0155f 48ff742430                     push       qword ptr [rsp + 0x30]
01564 488f442428                     pop        qword ptr [rsp + 0x28]
01569 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0156d 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
01572 6690                           nop        
01574 c5f877                         vzeroupper 
01577 e864d1b4ff                     call       0x7ffaeb9c3660
0157c 0f1f840074160007               nop        dword ptr [rax + rax + 0x7001674]
01584 493beb                         cmp        rbp, r11
01587 bdffffffff                     mov        ebp, 0xffffffff
0158c 7c08                           jl         0x7ffaebe76516
0158e 400f95c5                       setne      bpl
01592 400fb6ed                       movzx      ebp, bpl
01596 be45ffffff                     mov        esi, 0xffffff45
0159b 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
015a0 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
015a8 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
015ad 44894c2404                     mov        dword ptr [rsp + 4], r9d
015b2 89442414                       mov        dword ptr [rsp + 0x14], eax
015b6 4489542418                     mov        dword ptr [rsp + 0x18], r10d
015bb 48894424f8                     mov        qword ptr [rsp - 8], rax
015c0 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
015c4 8944241c                       mov        dword ptr [rsp + 0x1c], eax
015c8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015cd 895c2444                       mov        dword ptr [rsp + 0x44], ebx
015d1 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
015d6 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
015db 90                             nop        
015dc c5f877                         vzeroupper 
015df e8fcd0b4ff                     call       0x7ffaeb9c3660
015e4 0f1f8400dc160008               nop        dword ptr [rax + rax + 0x80016dc]
015ec be45ffffff                     mov        esi, 0xffffff45
015f1 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
015f6 448b1c24                       mov        r11d, dword ptr [rsp]
015fa 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01602 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01607 4c891c24                       mov        qword ptr [rsp], r11
0160b 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01610 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
01618 8944240c                       mov        dword ptr [rsp + 0xc], eax
0161c 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01621 48ff742420                     push       qword ptr [rsp + 0x20]
01626 488f442418                     pop        qword ptr [rsp + 0x18]
0162b 48ff742428                     push       qword ptr [rsp + 0x28]
01630 488f442420                     pop        qword ptr [rsp + 0x20]
01635 48ff742430                     push       qword ptr [rsp + 0x30]
0163a 488f442428                     pop        qword ptr [rsp + 0x28]
0163f 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01643 48894424f8                     mov        qword ptr [rsp - 8], rax
01648 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0164c 89442440                       mov        dword ptr [rsp + 0x40], eax
01650 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01655 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
0165a 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0165f 90                             nop        
01660 c5f877                         vzeroupper 
01663 e878d0b4ff                     call       0x7ffaeb9c3660
01668 0f1f840060170009               nop        dword ptr [rax + rax + 0x9001760]
01670 be45ffffff                     mov        esi, 0xffffff45
01675 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0167a 448b1c24                       mov        r11d, dword ptr [rsp]
0167e 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01686 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0168b 4c891c24                       mov        qword ptr [rsp], r11
0168f 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01694 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
0169c 8944240c                       mov        dword ptr [rsp + 0xc], eax
016a0 4489542410                     mov        dword ptr [rsp + 0x10], r10d
016a5 48ff742420                     push       qword ptr [rsp + 0x20]
016aa 488f442418                     pop        qword ptr [rsp + 0x18]
016af 48ff742428                     push       qword ptr [rsp + 0x28]
016b4 488f442420                     pop        qword ptr [rsp + 0x20]
016b9 48ff742430                     push       qword ptr [rsp + 0x30]
016be 488f442428                     pop        qword ptr [rsp + 0x28]
016c3 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
016c7 48894424f8                     mov        qword ptr [rsp - 8], rax
016cc 8b442448                       mov        eax, dword ptr [rsp + 0x48]
016d0 89442440                       mov        dword ptr [rsp + 0x40], eax
016d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016d9 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
016de 6690                           nop        
016e0 c5f877                         vzeroupper 
016e3 e8f8cfb4ff                     call       0x7ffaeb9c3660
016e8 0f1f8400e017000a               nop        dword ptr [rax + rax + 0xa0017e0]
016f0 4c8b4c2428                     mov        r9, qword ptr [rsp + 0x28]
016f5 4d3bc1                         cmp        r8, r9
016f8 bdffffffff                     mov        ebp, 0xffffffff
016fd 7c08                           jl         0x7ffaebe76687
016ff 400f95c5                       setne      bpl
01703 400fb6ed                       movzx      ebp, bpl
01707 be45ffffff                     mov        esi, 0xffffff45
0170c 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01711 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
01719 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0171e 44894c2404                     mov        dword ptr [rsp + 4], r9d
01723 89442414                       mov        dword ptr [rsp + 0x14], eax
01727 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0172c 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01730 48894424f8                     mov        qword ptr [rsp - 8], rax
01735 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01739 89442444                       mov        dword ptr [rsp + 0x44], eax
0173d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01742 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
01747 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
0174c c5f877                         vzeroupper 
0174f e88ccfb4ff                     call       0x7ffaeb9c3660
01754 0f1f84004c18000b               nop        dword ptr [rax + rax + 0xb00184c]
0175c 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
01761 493be9                         cmp        rbp, r9
01764 bdffffffff                     mov        ebp, 0xffffffff
01769 7c08                           jl         0x7ffaebe766f3
0176b 400f95c5                       setne      bpl
0176f 400fb6ed                       movzx      ebp, bpl
01773 be45ffffff                     mov        esi, 0xffffff45
01778 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
0177d 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
01785 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0178a 44894c2404                     mov        dword ptr [rsp + 4], r9d
0178f 89442414                       mov        dword ptr [rsp + 0x14], eax
01793 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01798 895c2440                       mov        dword ptr [rsp + 0x40], ebx
0179c 48894424f8                     mov        qword ptr [rsp - 8], rax
017a1 8b442448                       mov        eax, dword ptr [rsp + 0x48]
017a5 89442444                       mov        dword ptr [rsp + 0x44], eax
017a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ae 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
017b3 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
017b8 c5f877                         vzeroupper 
017bb e820cfb4ff                     call       0x7ffaeb9c3660
017c0 0f1f8400b818000c               nop        dword ptr [rax + rax + 0xc0018b8]
017c8 bee4ffffff                     mov        esi, 0xffffffe4
017cd 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
017d2 448b1424                       mov        r10d, dword ptr [rsp]
017d6 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
017de 4c8b542408                     mov        r10, qword ptr [rsp + 8]
017e3 4c891424                       mov        qword ptr [rsp], r10
017e7 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
017ec 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
017f4 48ff742420                     push       qword ptr [rsp + 0x20]
017f9 488f442418                     pop        qword ptr [rsp + 0x18]
017fe 48ff742428                     push       qword ptr [rsp + 0x28]
01803 488f442420                     pop        qword ptr [rsp + 0x20]
01808 48ff742430                     push       qword ptr [rsp + 0x30]
0180d 488f442428                     pop        qword ptr [rsp + 0x28]
01812 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01817 895c2444                       mov        dword ptr [rsp + 0x44], ebx
0181b 895c2450                       mov        dword ptr [rsp + 0x50], ebx
0181f 4489742458                     mov        dword ptr [rsp + 0x58], r14d
01824 c5f877                         vzeroupper 
01827 e8b4ceb4ff                     call       0x7ffaeb9c3660
0182c 0f1f84002419000d               nop        dword ptr [rax + rax + 0xd001924]
01834 bee4ffffff                     mov        esi, 0xffffffe4
01839 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0183e 448b1c24                       mov        r11d, dword ptr [rsp]
01842 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0184a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0184f 4c891424                       mov        qword ptr [rsp], r10
01853 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01858 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01860 48ff742420                     push       qword ptr [rsp + 0x20]
01865 488f442418                     pop        qword ptr [rsp + 0x18]
0186a 48ff742428                     push       qword ptr [rsp + 0x28]
0186f 488f442420                     pop        qword ptr [rsp + 0x20]
01874 48ff742430                     push       qword ptr [rsp + 0x30]
01879 488f442428                     pop        qword ptr [rsp + 0x28]
0187e 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01883 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01887 4489742448                     mov        dword ptr [rsp + 0x48], r14d
0188c 48894c2450                     mov        qword ptr [rsp + 0x50], rcx
01891 895c2458                       mov        dword ptr [rsp + 0x58], ebx
01895 666690                         nop        
01898 c5f877                         vzeroupper 
0189b e840ceb4ff                     call       0x7ffaeb9c3660
018a0 0f1f84009819000e               nop        dword ptr [rax + rax + 0xe001998]
018a8 4183c608                       add        r14d, 8
018ac be6effffff                     mov        esi, 0xffffff6e
018b1 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
018b6 448b0424                       mov        r8d, dword ptr [rsp]
018ba 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
018c2 4c8b442408                     mov        r8, qword ptr [rsp + 8]
018c7 4c890424                       mov        qword ptr [rsp], r8
018cb 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
018cf 898c24e4000000                 mov        dword ptr [rsp + 0xe4], ecx
018d6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
018db 48ff742420                     push       qword ptr [rsp + 0x20]
018e0 488f442418                     pop        qword ptr [rsp + 0x18]
018e5 48ff742428                     push       qword ptr [rsp + 0x28]
018ea 488f442420                     pop        qword ptr [rsp + 0x20]
018ef 48ff742430                     push       qword ptr [rsp + 0x30]
018f4 488f442428                     pop        qword ptr [rsp + 0x28]
018f9 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
018fe 48894424f8                     mov        qword ptr [rsp - 8], rax
01903 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
0190a 89442440                       mov        dword ptr [rsp + 0x40], eax
0190e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01913 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01918 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0191d 666690                         nop        
01920 c5f877                         vzeroupper 
01923 e8b8cdb4ff                     call       0x7ffaeb9c3660
01928 0f1f8400201a000f               nop        dword ptr [rax + rax + 0xf001a20]
01930 4183c608                       add        r14d, 8
01934 be66ffffff                     mov        esi, 0xffffff66
01939 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0193e 448b0424                       mov        r8d, dword ptr [rsp]
01942 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
0194a 4c8b442408                     mov        r8, qword ptr [rsp + 8]
0194f 4c890424                       mov        qword ptr [rsp], r8
01953 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
01957 898c24e4000000                 mov        dword ptr [rsp + 0xe4], ecx
0195e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01963 48ff742420                     push       qword ptr [rsp + 0x20]
01968 488f442418                     pop        qword ptr [rsp + 0x18]
0196d 48ff742428                     push       qword ptr [rsp + 0x28]
01972 488f442420                     pop        qword ptr [rsp + 0x20]
01977 48ff742430                     push       qword ptr [rsp + 0x30]
0197c 488f442428                     pop        qword ptr [rsp + 0x28]
01981 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01986 4489742448                     mov        dword ptr [rsp + 0x48], r14d
0198b 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01990 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
01995 666690                         nop        
01998 c5f877                         vzeroupper 
0199b e840cdb4ff                     call       0x7ffaeb9c3660
019a0 0f1f8400981a0010               nop        dword ptr [rax + rax + 0x10001a98]
019a8 418be9                         mov        ebp, r9d
019ab e96becffff                     jmp        0x7ffaebe7559b
019b0 beccffffff                     mov        esi, 0xffffffcc
019b5 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
019ba 448b1c24                       mov        r11d, dword ptr [rsp]
019be 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
019c6 4c8b542408                     mov        r10, qword ptr [rsp + 8]
019cb 4c891424                       mov        qword ptr [rsp], r10
019cf 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
019d4 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
019dc 48ff742420                     push       qword ptr [rsp + 0x20]
019e1 488f442418                     pop        qword ptr [rsp + 0x18]
019e6 48ff742428                     push       qword ptr [rsp + 0x28]
019eb 488f442420                     pop        qword ptr [rsp + 0x20]
019f0 48ff742430                     push       qword ptr [rsp + 0x30]
019f5 488f442428                     pop        qword ptr [rsp + 0x28]
019fa 4489742444                     mov        dword ptr [rsp + 0x44], r14d
019ff 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01a03 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01a08 c5f877                         vzeroupper 
01a0b e8d0ccb4ff                     call       0x7ffaeb9c3660
01a10 0f1f8400081b0011               nop        dword ptr [rax + rax + 0x11001b08]
01a18 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01a1d 448bd0                         mov        r10d, eax
01a20 4403542440                     add        r10d, dword ptr [rsp + 0x40]
01a25 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
01a2d 4f8b541008                     mov        r10, qword ptr [r8 + r10 + 8]
01a32 4f89541808                     mov        qword ptr [r8 + r11 + 8], r10
01a37 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01a3c 4183c308                       add        r11d, 8
01a40 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01a45 453bd9                         cmp        r11d, r9d
01a48 7cce                           jl         0x7ffaebe76998
01a4a 443bd9                         cmp        r11d, ecx
01a4d 0f8da6000000                   jge        0x7ffaebe76a79
01a53 458bd3                         mov        r10d, r11d
01a56 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01a5b 8bbc2484000000                 mov        edi, dword ptr [rsp + 0x84]
01a62 0f1f8000000000                 nop        dword ptr [rax]
01a69 0f1f8000000000                 nop        dword ptr [rax]
01a70 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01a75 4963db                         movsxd     rbx, r11d
01a78 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01a7d 448bc8                         mov        r9d, eax
01a80 44034c2440                     add        r9d, dword ptr [rsp + 0x40]
01a85 458bd1                         mov        r10d, r9d
01a88 4e8b4c0f08                     mov        r9, qword ptr [rdi + r9 + 8]
01a8d 4e894c1f08                     mov        qword ptr [rdi + r11 + 8], r9
01a92 4d63da                         movsxd     r11, r10d
01a95 4e8b541f10                     mov        r10, qword ptr [rdi + r11 + 0x10]
01a9a 4c89541f10                     mov        qword ptr [rdi + rbx + 0x10], r10
01a9f 4e8b541f18                     mov        r10, qword ptr [rdi + r11 + 0x18]
01aa4 4c89541f18                     mov        qword ptr [rdi + rbx + 0x18], r10
01aa9 4e8b541f20                     mov        r10, qword ptr [rdi + r11 + 0x20]
01aae 4c89541f20                     mov        qword ptr [rdi + rbx + 0x20], r10
01ab3 4e8b541f28                     mov        r10, qword ptr [rdi + r11 + 0x28]
01ab8 4c89541f28                     mov        qword ptr [rdi + rbx + 0x28], r10
01abd 4e8b541f30                     mov        r10, qword ptr [rdi + r11 + 0x30]
01ac2 4c89541f30                     mov        qword ptr [rdi + rbx + 0x30], r10
01ac7 4e8b541f38                     mov        r10, qword ptr [rdi + r11 + 0x38]
01acc 4c89541f38                     mov        qword ptr [rdi + rbx + 0x38], r10
01ad1 4e8b541f40                     mov        r10, qword ptr [rdi + r11 + 0x40]
01ad6 4c89541f40                     mov        qword ptr [rdi + rbx + 0x40], r10
01adb 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01ae0 4183c240                       add        r10d, 0x40
01ae4 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01ae9 443bd1                         cmp        r10d, ecx
01aec 0f8c7effffff                   jl         0x7ffaebe769f0
01af2 89bc2484000000                 mov        dword ptr [rsp + 0x84], edi
01af9 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01afe 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
01b06 0f8d18ebffff                   jge        0x7ffaebe755a4
01b0c 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01b11 458bc3                         mov        r8d, r11d
01b14 468d1400                       lea        r10d, [rax + r8]
01b18 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
01b20 4f8b541108                     mov        r10, qword ptr [r9 + r10 + 8]
01b25 458bd8                         mov        r11d, r8d
01b28 4f89541908                     mov        qword ptr [r9 + r11 + 8], r10
01b2d 458d5808                       lea        r11d, [r8 + 8]
01b31 458bc3                         mov        r8d, r11d
01b34 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
01b3c 7cd6                           jl         0x7ffaebe76a94
01b3e e9e1eaffff                     jmp        0x7ffaebe755a4
01b43 bee4ffffff                     mov        esi, 0xffffffe4
01b48 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01b4d 448b0424                       mov        r8d, dword ptr [rsp]
01b51 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
01b59 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01b5e 4c891c24                       mov        qword ptr [rsp], r11
01b62 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01b67 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
01b6f 8944240c                       mov        dword ptr [rsp + 0xc], eax
01b73 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01b78 48ff742420                     push       qword ptr [rsp + 0x20]
01b7d 488f442418                     pop        qword ptr [rsp + 0x18]
01b82 48894424f8                     mov        qword ptr [rsp - 8], rax
01b87 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01b8b 89442414                       mov        dword ptr [rsp + 0x14], eax
01b8f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b94 48ff742428                     push       qword ptr [rsp + 0x28]
01b99 488f442420                     pop        qword ptr [rsp + 0x20]
01b9e 48ff742430                     push       qword ptr [rsp + 0x30]
01ba3 488f442428                     pop        qword ptr [rsp + 0x28]
01ba8 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01bac 4489742440                     mov        dword ptr [rsp + 0x40], r14d
01bb1 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
01bb6 6690                           nop        
01bb8 c5f877                         vzeroupper 
01bbb e820cbb4ff                     call       0x7ffaeb9c3660
01bc0 0f1f8400b81c0012               nop        dword ptr [rax + rax + 0x12001cb8]
01bc8 4585f6                         test       r14d, r14d
01bcb 0f848b0b0000                   je         0x7ffaebe776dc
01bd1 8b2c24                         mov        ebp, dword ptr [rsp]
01bd4 898424a8000000                 mov        dword ptr [rsp + 0xa8], eax
01bdb 4533c0                         xor        r8d, r8d
01bde e928f0ffff                     jmp        0x7ffaebe75b8b
01be3 bee4ffffff                     mov        esi, 0xffffffe4
01be8 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01bed 448b1c24                       mov        r11d, dword ptr [rsp]
01bf1 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01bf9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01bfe 4c891424                       mov        qword ptr [rsp], r10
01c02 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01c07 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01c0f 48ff742420                     push       qword ptr [rsp + 0x20]
01c14 488f442410                     pop        qword ptr [rsp + 0x10]
01c19 48ff742428                     push       qword ptr [rsp + 0x28]
01c1e 488f442420                     pop        qword ptr [rsp + 0x20]
01c23 48ff742430                     push       qword ptr [rsp + 0x30]
01c28 488f442428                     pop        qword ptr [rsp + 0x28]
01c2d 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
01c32 895c2450                       mov        dword ptr [rsp + 0x50], ebx
01c36 4489742458                     mov        dword ptr [rsp + 0x58], r14d
01c3b 90                             nop        
01c3c c5f877                         vzeroupper 
01c3f e89ccab4ff                     call       0x7ffaeb9c3660
01c44 0f1f84003c1d0013               nop        dword ptr [rax + rax + 0x13001d3c]
01c4c bee4ffffff                     mov        esi, 0xffffffe4
01c51 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01c56 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01c5e 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01c63 44895c2404                     mov        dword ptr [rsp + 4], r11d
01c68 48ff742420                     push       qword ptr [rsp + 0x20]
01c6d 488f442418                     pop        qword ptr [rsp + 0x18]
01c72 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01c77 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01c7c 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01c81 895c2458                       mov        dword ptr [rsp + 0x58], ebx
01c85 666690                         nop        
01c88 c5f877                         vzeroupper 
01c8b e850cab4ff                     call       0x7ffaeb9c3660
01c90 0f1f8400881d0014               nop        dword ptr [rax + rax + 0x14001d88]
01c98 418d6e01                       lea        ebp, [r14 + 1]
01c9c bee4ffffff                     mov        esi, 0xffffffe4
01ca1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01ca6 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01cae 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01cb3 4489542404                     mov        dword ptr [rsp + 4], r10d
01cb8 48ff742420                     push       qword ptr [rsp + 0x20]
01cbd 488f442418                     pop        qword ptr [rsp + 0x18]
01cc2 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01cc6 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01ccb 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01cd0 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01cd5 666690                         nop        
01cd8 c5f877                         vzeroupper 
01cdb e800cab4ff                     call       0x7ffaeb9c3660
01ce0 0f1f8400d81d0015               nop        dword ptr [rax + rax + 0x15001dd8]
01ce8 bee4ffffff                     mov        esi, 0xffffffe4
01ced 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01cf2 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01cfa 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01cff 44895c2404                     mov        dword ptr [rsp + 4], r11d
01d04 48ff742420                     push       qword ptr [rsp + 0x20]
01d09 488f442418                     pop        qword ptr [rsp + 0x18]
01d0e 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01d12 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01d17 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01d1c 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01d21 666690                         nop        
01d24 c5f877                         vzeroupper 
01d27 e8b4c9b4ff                     call       0x7ffaeb9c3660
01d2c 0f1f8400241e0016               nop        dword ptr [rax + rax + 0x16001e24]
01d34 bee4ffffff                     mov        esi, 0xffffffe4
01d39 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01d3e 448b1c24                       mov        r11d, dword ptr [rsp]
01d42 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01d4a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01d4f 4c891424                       mov        qword ptr [rsp], r10
01d53 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01d58 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01d60 48ff742420                     push       qword ptr [rsp + 0x20]
01d65 488f442410                     pop        qword ptr [rsp + 0x10]
01d6a 48ff742428                     push       qword ptr [rsp + 0x28]
01d6f 488f442420                     pop        qword ptr [rsp + 0x20]
01d74 48ff742430                     push       qword ptr [rsp + 0x30]
01d79 488f442428                     pop        qword ptr [rsp + 0x28]
01d7e 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01d82 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
01d87 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01d8c 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01d91 666690                         nop        
01d94 c5f877                         vzeroupper 
01d97 e844c9b4ff                     call       0x7ffaeb9c3660
01d9c 0f1f8400941e0017               nop        dword ptr [rax + rax + 0x17001e94]
01da4 bee4ffffff                     mov        esi, 0xffffffe4
01da9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01dae 448b1424                       mov        r10d, dword ptr [rsp]
01db2 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01dba 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01dbf 4c891424                       mov        qword ptr [rsp], r10
01dc3 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01dc8 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01dd0 48ff742420                     push       qword ptr [rsp + 0x20]
01dd5 488f442410                     pop        qword ptr [rsp + 0x10]
01dda 48ff742428                     push       qword ptr [rsp + 0x28]
01ddf 488f442420                     pop        qword ptr [rsp + 0x20]
01de4 48ff742430                     push       qword ptr [rsp + 0x30]
01de9 488f442428                     pop        qword ptr [rsp + 0x28]
01dee 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01df2 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
01df7 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
01dfc 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01e01 666690                         nop        
01e04 c5f877                         vzeroupper 
01e07 e8d4c8b4ff                     call       0x7ffaeb9c3660
01e0c 0f1f8400041f0018               nop        dword ptr [rax + rax + 0x18001f04]
01e14 bee4ffffff                     mov        esi, 0xffffffe4
01e19 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01e1e 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01e26 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01e2b 4489542404                     mov        dword ptr [rsp + 4], r10d
01e30 48ff742420                     push       qword ptr [rsp + 0x20]
01e35 488f442418                     pop        qword ptr [rsp + 0x18]
01e3a 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01e3e 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
01e43 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01e48 c5f877                         vzeroupper 
01e4b e890c8b4ff                     call       0x7ffaeb9c3660
01e50 0f1f8400481f0019               nop        dword ptr [rax + rax + 0x19001f48]
01e58 beccffffff                     mov        esi, 0xffffffcc
01e5d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01e62 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01e6a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01e6f 44895c2404                     mov        dword ptr [rsp + 4], r11d
01e74 48ff742420                     push       qword ptr [rsp + 0x20]
01e79 488f442418                     pop        qword ptr [rsp + 0x18]
01e7e 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01e82 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01e87 90                             nop        
01e88 c5f877                         vzeroupper 
01e8b e850c8b4ff                     call       0x7ffaeb9c3660
01e90 0f1f8400881f001a               nop        dword ptr [rax + rax + 0x1a001f88]
01e98 be6effffff                     mov        esi, 0xffffff6e
01e9d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01ea2 448b1c24                       mov        r11d, dword ptr [rsp]
01ea6 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01eae 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01eb3 4c891c24                       mov        qword ptr [rsp], r11
01eb7 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01ebc 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01ec4 8944240c                       mov        dword ptr [rsp + 0xc], eax
01ec8 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01ecd 48ff742420                     push       qword ptr [rsp + 0x20]
01ed2 488f442418                     pop        qword ptr [rsp + 0x18]
01ed7 48894424f8                     mov        qword ptr [rsp - 8], rax
01edc 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01ee0 89442414                       mov        dword ptr [rsp + 0x14], eax
01ee4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ee9 48ff742428                     push       qword ptr [rsp + 0x28]
01eee 488f442420                     pop        qword ptr [rsp + 0x20]
01ef3 48ff742430                     push       qword ptr [rsp + 0x30]
01ef8 488f442428                     pop        qword ptr [rsp + 0x28]
01efd 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01f01 4489742440                     mov        dword ptr [rsp + 0x40], r14d
01f06 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01f0b 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
01f10 c5f877                         vzeroupper 
01f13 e8c8c7b4ff                     call       0x7ffaeb9c3660
01f18 0f1f84001020001b               nop        dword ptr [rax + rax + 0x1b002010]
01f20 be45ffffff                     mov        esi, 0xffffff45
01f25 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01f2a 448b0424                       mov        r8d, dword ptr [rsp]
01f2e 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
01f36 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01f3b 4c891c24                       mov        qword ptr [rsp], r11
01f3f 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01f44 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
01f4c 8944240c                       mov        dword ptr [rsp + 0xc], eax
01f50 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01f55 48ff742420                     push       qword ptr [rsp + 0x20]
01f5a 488f442418                     pop        qword ptr [rsp + 0x18]
01f5f 48894424f8                     mov        qword ptr [rsp - 8], rax
01f64 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01f68 89442414                       mov        dword ptr [rsp + 0x14], eax
01f6c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f71 48ff742428                     push       qword ptr [rsp + 0x28]
01f76 488f442420                     pop        qword ptr [rsp + 0x20]
01f7b 48ff742430                     push       qword ptr [rsp + 0x30]
01f80 488f442428                     pop        qword ptr [rsp + 0x28]
01f85 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01f89 4489742440                     mov        dword ptr [rsp + 0x40], r14d
01f8e 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
01f93 90                             nop        
01f94 c5f877                         vzeroupper 
01f97 e844c7b4ff                     call       0x7ffaeb9c3660
01f9c 0f1f84009420001c               nop        dword ptr [rax + rax + 0x1c002094]
01fa4 be3dffffff                     mov        esi, 0xffffff3d
01fa9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01fae 448b1c24                       mov        r11d, dword ptr [rsp]
01fb2 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01fba 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01fbf 4c891c24                       mov        qword ptr [rsp], r11
01fc3 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01fc8 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01fd0 8944240c                       mov        dword ptr [rsp + 0xc], eax
01fd4 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01fd9 48ff742420                     push       qword ptr [rsp + 0x20]
01fde 488f442418                     pop        qword ptr [rsp + 0x18]
01fe3 48894424f8                     mov        qword ptr [rsp - 8], rax
01fe8 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01fec 89442414                       mov        dword ptr [rsp + 0x14], eax
01ff0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ff5 48ff742428                     push       qword ptr [rsp + 0x28]
01ffa 488f442420                     pop        qword ptr [rsp + 0x20]
01fff 48ff742430                     push       qword ptr [rsp + 0x30]
02004 488f442428                     pop        qword ptr [rsp + 0x28]
02009 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0200d 4489742440                     mov        dword ptr [rsp + 0x40], r14d
02012 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
02017 90                             nop        
02018 c5f877                         vzeroupper 
0201b e8c0c6b4ff                     call       0x7ffaeb9c3660
02020 0f1f84001821001d               nop        dword ptr [rax + rax + 0x1d002118]
02028 bee4ffffff                     mov        esi, 0xffffffe4
0202d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02032 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0203a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0203f 44895c2404                     mov        dword ptr [rsp + 4], r11d
02044 48ff742420                     push       qword ptr [rsp + 0x20]
02049 488f442418                     pop        qword ptr [rsp + 0x18]
0204e 895c2440                       mov        dword ptr [rsp + 0x40], ebx
02052 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
02057 90                             nop        
02058 c5f877                         vzeroupper 
0205b e880c6b4ff                     call       0x7ffaeb9c3660
02060 0f1f84005821001e               nop        dword ptr [rax + rax + 0x1e002158]
02068 bee4ffffff                     mov        esi, 0xffffffe4
0206d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02072 44895c2404                     mov        dword ptr [rsp + 4], r11d
02077 48ff742420                     push       qword ptr [rsp + 0x20]
0207c 488f442418                     pop        qword ptr [rsp + 0x18]
02081 895c2440                       mov        dword ptr [rsp + 0x40], ebx
02085 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
0208a 6690                           nop        
0208c c5f877                         vzeroupper 
0208f e84cc6b4ff                     call       0x7ffaeb9c3660
02094 0f1f84008c21001f               nop        dword ptr [rax + rax + 0x1f00218c]
0209c beccffffff                     mov        esi, 0xffffffcc
020a1 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
020a6 448b1c24                       mov        r11d, dword ptr [rsp]
020aa 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
020b2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
020b7 4c891424                       mov        qword ptr [rsp], r10
020bb 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
020c0 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
020c8 48ff742420                     push       qword ptr [rsp + 0x20]
020cd 488f442410                     pop        qword ptr [rsp + 0x10]
020d2 48ff742428                     push       qword ptr [rsp + 0x28]
020d7 488f442420                     pop        qword ptr [rsp + 0x20]
020dc 48ff742430                     push       qword ptr [rsp + 0x30]
020e1 488f442428                     pop        qword ptr [rsp + 0x28]
020e6 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
020eb 448974244c                     mov        dword ptr [rsp + 0x4c], r14d
020f0 895c2454                       mov        dword ptr [rsp + 0x54], ebx
020f4 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
020f9 666690                         nop        
020fc c5f877                         vzeroupper 
020ff e8dcc5b4ff                     call       0x7ffaeb9c3660
02104 0f1f8400fc210020               nop        dword ptr [rax + rax + 0x200021fc]
0210c be17000000                     mov        esi, 0x17
02111 666690                         nop        
02114 c5f877                         vzeroupper 
02117 e8c4c5b4ff                     call       0x7ffaeb9c3660
0211c 0f1f840014220021               nop        dword ptr [rax + rax + 0x21002214]
02124 be6effffff                     mov        esi, 0xffffff6e
02129 4489742410                     mov        dword ptr [rsp + 0x10], r14d
0212e 89442414                       mov        dword ptr [rsp + 0x14], eax
02132 4c89442418                     mov        qword ptr [rsp + 0x18], r8
02137 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
0213c 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
02141 48897c2430                     mov        qword ptr [rsp + 0x30], rdi
02146 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0214b 90                             nop        
0214c c5f877                         vzeroupper 
0214f e88cc5b4ff                     call       0x7ffaeb9c3660
02154 0f1f84004c220022               nop        dword ptr [rax + rax + 0x2200224c]
0215c bebeffffff                     mov        esi, 0xffffffbe
02161 4489742410                     mov        dword ptr [rsp + 0x10], r14d
02166 89442414                       mov        dword ptr [rsp + 0x14], eax
0216a 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0216f 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
02174 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
02179 48897c2430                     mov        qword ptr [rsp + 0x30], rdi
0217e 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02183 90                             nop        
02184 c5f877                         vzeroupper 
02187 e854c5b4ff                     call       0x7ffaeb9c3660
0218c 0f1f840084220023               nop        dword ptr [rax + rax + 0x23002284]
02194 488b5c2478                     mov        rbx, qword ptr [rsp + 0x78]
02199 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
0219e 448bb42484000000               mov        r14d, dword ptr [rsp + 0x84]
021a6 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
021ae beccffffff                     mov        esi, 0xffffffcc
021b3 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
021bb 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
021c3 44893424                       mov        dword ptr [rsp], r14d
021c7 4489542404                     mov        dword ptr [rsp + 4], r10d
021cc 48895c2408                     mov        qword ptr [rsp + 8], rbx
021d1 666690                         nop        
021d4 c5f877                         vzeroupper 
021d7 e804c5b4ff                     call       0x7ffaeb9c3660
021dc 0f1f8400d4220024               nop        dword ptr [rax + rax + 0x240022d4]
021e4 bee4ffffff                     mov        esi, 0xffffffe4
021e9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
021ee 448b1c24                       mov        r11d, dword ptr [rsp]
021f2 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
021fa 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
021ff 4c891c24                       mov        qword ptr [rsp], r11
02203 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02208 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
02210 48ff742420                     push       qword ptr [rsp + 0x20]
02215 488f442410                     pop        qword ptr [rsp + 0x10]
0221a 48ff742428                     push       qword ptr [rsp + 0x28]
0221f 488f442420                     pop        qword ptr [rsp + 0x20]
02224 48ff742430                     push       qword ptr [rsp + 0x30]
02229 488f442428                     pop        qword ptr [rsp + 0x28]
0222e 895c2438                       mov        dword ptr [rsp + 0x38], ebx
02232 48894424f8                     mov        qword ptr [rsp - 8], rax
02237 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0223b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0223f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02244 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
02249 48894424f8                     mov        qword ptr [rsp - 8], rax
0224e 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02252 89442444                       mov        dword ptr [rsp + 0x44], eax
02256 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0225b 89442448                       mov        dword ptr [rsp + 0x48], eax
0225f 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02264 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02269 666690                         nop        
0226c c5f877                         vzeroupper 
0226f e86cc4b4ff                     call       0x7ffaeb9c3660
02274 0f1f84006c230025               nop        dword ptr [rax + rax + 0x2500236c]
0227c c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
02282 bee4ffffff                     mov        esi, 0xffffffe4
02287 498be8                         mov        rbp, r8
0228a 448b1c24                       mov        r11d, dword ptr [rsp]
0228e 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02296 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0229b 4c891c24                       mov        qword ptr [rsp], r11
0229f 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
022a4 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
022ac 48ff742420                     push       qword ptr [rsp + 0x20]
022b1 488f442410                     pop        qword ptr [rsp + 0x10]
022b6 48ff742428                     push       qword ptr [rsp + 0x28]
022bb 488f442420                     pop        qword ptr [rsp + 0x20]
022c0 48ff742430                     push       qword ptr [rsp + 0x30]
022c5 488f442428                     pop        qword ptr [rsp + 0x28]
022ca 895c2438                       mov        dword ptr [rsp + 0x38], ebx
022ce 48894424f8                     mov        qword ptr [rsp - 8], rax
022d3 8b442448                       mov        eax, dword ptr [rsp + 0x48]
022d7 8944243c                       mov        dword ptr [rsp + 0x3c], eax
022db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022e0 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
022e5 48894424f8                     mov        qword ptr [rsp - 8], rax
022ea 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
022ee 89442444                       mov        dword ptr [rsp + 0x44], eax
022f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022f7 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
022fc 89442454                       mov        dword ptr [rsp + 0x54], eax
02300 c5f877                         vzeroupper 
02303 e8d8c3b4ff                     call       0x7ffaeb9c3660
02308 0f1f840000240026               nop        dword ptr [rax + rax + 0x26002400]
02310 beccffffff                     mov        esi, 0xffffffcc
02315 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0231a 448b1c24                       mov        r11d, dword ptr [rsp]
0231e 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02326 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0232b 4c891c24                       mov        qword ptr [rsp], r11
0232f 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02334 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
0233c 48ff742420                     push       qword ptr [rsp + 0x20]
02341 488f442418                     pop        qword ptr [rsp + 0x18]
02346 48ff742428                     push       qword ptr [rsp + 0x28]
0234b 488f442420                     pop        qword ptr [rsp + 0x20]
02350 48ff742430                     push       qword ptr [rsp + 0x30]
02355 488f442428                     pop        qword ptr [rsp + 0x28]
0235a 48894424f8                     mov        qword ptr [rsp - 8], rax
0235f 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02363 89442440                       mov        dword ptr [rsp + 0x40], eax
02367 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0236c 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
02371 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02376 89442458                       mov        dword ptr [rsp + 0x58], eax
0237a 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
0237e 6690                           nop        
02380 c5f877                         vzeroupper 
02383 e858c3b4ff                     call       0x7ffaeb9c3660
02388 0f1f840080240027               nop        dword ptr [rax + rax + 0x27002480]
02390 418bea                         mov        ebp, r10d
02393 83c510                         add        ebp, 0x10
02396 be6effffff                     mov        esi, 0xffffff6e
0239b 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
023a0 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
023a8 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
023ad 4489442404                     mov        dword ptr [rsp + 4], r8d
023b2 4489542414                     mov        dword ptr [rsp + 0x14], r10d
023b7 48ff742420                     push       qword ptr [rsp + 0x20]
023bc 488f442418                     pop        qword ptr [rsp + 0x18]
023c1 895c2440                       mov        dword ptr [rsp + 0x40], ebx
023c5 48894424f8                     mov        qword ptr [rsp - 8], rax
023ca 8b442448                       mov        eax, dword ptr [rsp + 0x48]
023ce 89442444                       mov        dword ptr [rsp + 0x44], eax
023d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d7 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
023dc c5f877                         vzeroupper 
023df e8fcc2b4ff                     call       0x7ffaeb9c3660
023e4 0f1f8400dc240028               nop        dword ptr [rax + rax + 0x280024dc]
023ec 418bea                         mov        ebp, r10d
023ef 83c510                         add        ebp, 0x10
023f2 be66ffffff                     mov        esi, 0xffffff66
023f7 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
023fc 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
02404 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02409 4489442404                     mov        dword ptr [rsp + 4], r8d
0240e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02413 48ff742420                     push       qword ptr [rsp + 0x20]
02418 488f442418                     pop        qword ptr [rsp + 0x18]
0241d 895c2440                       mov        dword ptr [rsp + 0x40], ebx
02421 48894424f8                     mov        qword ptr [rsp - 8], rax
02426 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0242a 89442444                       mov        dword ptr [rsp + 0x44], eax
0242e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02433 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02438 c5f877                         vzeroupper 
0243b e8a0c2b4ff                     call       0x7ffaeb9c3660
02440 0f1f840038250029               nop        dword ptr [rax + rax + 0x29002538]
02448 bee4ffffff                     mov        esi, 0xffffffe4
0244d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02452 448b1c24                       mov        r11d, dword ptr [rsp]
02456 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0245e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02463 4c891424                       mov        qword ptr [rsp], r10
02467 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0246c 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02474 48ff742420                     push       qword ptr [rsp + 0x20]
02479 488f442410                     pop        qword ptr [rsp + 0x10]
0247e 48ff742428                     push       qword ptr [rsp + 0x28]
02483 488f442420                     pop        qword ptr [rsp + 0x20]
02488 48ff742430                     push       qword ptr [rsp + 0x30]
0248d 488f442428                     pop        qword ptr [rsp + 0x28]
02492 895c2448                       mov        dword ptr [rsp + 0x48], ebx
02496 4489742450                     mov        dword ptr [rsp + 0x50], r14d
0249b 90                             nop        
0249c c5f877                         vzeroupper 
0249f e83cc2b4ff                     call       0x7ffaeb9c3660
024a4 0f1f84009c25002a               nop        dword ptr [rax + rax + 0x2a00259c]
024ac bee4ffffff                     mov        esi, 0xffffffe4
024b1 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
024b6 448b1424                       mov        r10d, dword ptr [rsp]
024ba 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
024c2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
024c7 4c891424                       mov        qword ptr [rsp], r10
024cb 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
024d0 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
024d8 48ff742420                     push       qword ptr [rsp + 0x20]
024dd 488f442410                     pop        qword ptr [rsp + 0x10]
024e2 48ff742428                     push       qword ptr [rsp + 0x28]
024e7 488f442420                     pop        qword ptr [rsp + 0x20]
024ec 48ff742430                     push       qword ptr [rsp + 0x30]
024f1 488f442428                     pop        qword ptr [rsp + 0x28]
024f6 895c2444                       mov        dword ptr [rsp + 0x44], ebx
024fa 6690                           nop        
024fc c5f877                         vzeroupper 
024ff e8dcc1b4ff                     call       0x7ffaeb9c3660
02504 0f1f8400fc25002b               nop        dword ptr [rax + rax + 0x2b0025fc]
0250c 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
02511 458d5a08                       lea        r11d, [r10 + 8]
02515 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0251a be6effffff                     mov        esi, 0xffffff6e
0251f 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02524 448b1424                       mov        r10d, dword ptr [rsp]
02528 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02530 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02535 4c891424                       mov        qword ptr [rsp], r10
02539 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0253e 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02546 48ff742420                     push       qword ptr [rsp + 0x20]
0254b 488f442410                     pop        qword ptr [rsp + 0x10]
02550 48ff742428                     push       qword ptr [rsp + 0x28]
02555 488f442420                     pop        qword ptr [rsp + 0x20]
0255a 48ff742430                     push       qword ptr [rsp + 0x30]
0255f 488f442428                     pop        qword ptr [rsp + 0x28]
02564 48894424f8                     mov        qword ptr [rsp - 8], rax
02569 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
02570 89442438                       mov        dword ptr [rsp + 0x38], eax
02574 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02579 666690                         nop        
0257c c5f877                         vzeroupper 
0257f e85cc1b4ff                     call       0x7ffaeb9c3660
02584 0f1f84007c26002c               nop        dword ptr [rax + rax + 0x2c00267c]
0258c 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
02591 458d5a08                       lea        r11d, [r10 + 8]
02595 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0259a be66ffffff                     mov        esi, 0xffffff66
0259f 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
025a4 448b1c24                       mov        r11d, dword ptr [rsp]
025a8 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
025b0 4c8b542408                     mov        r10, qword ptr [rsp + 8]
025b5 4c891424                       mov        qword ptr [rsp], r10
025b9 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
025be 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
025c6 48ff742420                     push       qword ptr [rsp + 0x20]
025cb 488f442410                     pop        qword ptr [rsp + 0x10]
025d0 48ff742428                     push       qword ptr [rsp + 0x28]
025d5 488f442420                     pop        qword ptr [rsp + 0x20]
025da 48ff742430                     push       qword ptr [rsp + 0x30]
025df 488f442428                     pop        qword ptr [rsp + 0x28]
025e4 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
025e9 666690                         nop        
025ec c5f877                         vzeroupper 
025ef e8ecc0b4ff                     call       0x7ffaeb9c3660
025f4 0f1f8400ec26002d               nop        dword ptr [rax + rax + 0x2d0026ec]
025fc bee4ffffff                     mov        esi, 0xffffffe4
02601 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02606 448b1c24                       mov        r11d, dword ptr [rsp]
0260a 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02612 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02617 4c891424                       mov        qword ptr [rsp], r10
0261b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02620 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02628 48ff742420                     push       qword ptr [rsp + 0x20]
0262d 488f442410                     pop        qword ptr [rsp + 0x10]
02632 48ff742428                     push       qword ptr [rsp + 0x28]
02637 488f442420                     pop        qword ptr [rsp + 0x20]
0263c 48ff742430                     push       qword ptr [rsp + 0x30]
02641 488f442428                     pop        qword ptr [rsp + 0x28]
02646 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0264a 4489742448                     mov        dword ptr [rsp + 0x48], r14d
0264f 90                             nop        
02650 c5f877                         vzeroupper 
02653 e888c0b4ff                     call       0x7ffaeb9c3660
02658 0f1f84005027002e               nop        dword ptr [rax + rax + 0x2e002750]
02660 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
02666 bee4ffffff                     mov        esi, 0xffffffe4
0266b 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02670 448b1424                       mov        r10d, dword ptr [rsp]
02674 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
0267c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02681 4c891424                       mov        qword ptr [rsp], r10
02685 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0268a 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02692 48ff742420                     push       qword ptr [rsp + 0x20]
02697 488f442410                     pop        qword ptr [rsp + 0x10]
0269c 48ff742428                     push       qword ptr [rsp + 0x28]
026a1 488f442420                     pop        qword ptr [rsp + 0x20]
026a6 48ff742430                     push       qword ptr [rsp + 0x30]
026ab 488f442428                     pop        qword ptr [rsp + 0x28]
026b0 4489742440                     mov        dword ptr [rsp + 0x40], r14d
026b5 895c2448                       mov        dword ptr [rsp + 0x48], ebx
026b9 666690                         nop        
026bc c5f877                         vzeroupper 
026bf e81cc0b4ff                     call       0x7ffaeb9c3660
026c4 0f1f8400bc27002f               nop        dword ptr [rax + rax + 0x2f0027bc]
026cc 4183c610                       add        r14d, 0x10
026d0 be6effffff                     mov        esi, 0xffffff6e
026d5 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
026da 4489542404                     mov        dword ptr [rsp + 4], r10d
026df 48ff742420                     push       qword ptr [rsp + 0x20]
026e4 488f442418                     pop        qword ptr [rsp + 0x18]
026e9 48894424f8                     mov        qword ptr [rsp - 8], rax
026ee 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
026f5 89442440                       mov        dword ptr [rsp + 0x40], eax
026f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026fe 4489742444                     mov        dword ptr [rsp + 0x44], r14d
02703 90                             nop        
02704 c5f877                         vzeroupper 
02707 e8d4bfb4ff                     call       0x7ffaeb9c3660
0270c 0f1f840004280030               nop        dword ptr [rax + rax + 0x30002804]
02714 4183c610                       add        r14d, 0x10
02718 be66ffffff                     mov        esi, 0xffffff66
0271d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02722 4489542404                     mov        dword ptr [rsp + 4], r10d
02727 48ff742420                     push       qword ptr [rsp + 0x20]
0272c 488f442418                     pop        qword ptr [rsp + 0x18]
02731 48894424f8                     mov        qword ptr [rsp - 8], rax
02736 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
0273d 89442440                       mov        dword ptr [rsp + 0x40], eax
02741 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02746 4489742444                     mov        dword ptr [rsp + 0x44], r14d
0274b 90                             nop        
0274c c5f877                         vzeroupper 
0274f e88cbfb4ff                     call       0x7ffaeb9c3660
02754 0f1f84004c280031               nop        dword ptr [rax + rax + 0x3100284c]
0275c bef6ffffff                     mov        esi, 0xfffffff6
02761 488bea                         mov        rbp, rdx
02764 898424e0000000                 mov        dword ptr [rsp + 0xe0], eax
0276b 90                             nop        
0276c c5f877                         vzeroupper 
0276f e86cbfb4ff                     call       0x7ffaeb9c3660
02774 0f1f84006c280032               nop        dword ptr [rax + rax + 0x3200286c]
0277c bef6ffffff                     mov        esi, 0xfffffff6
02781 666690                         nop        
02784 c5f877                         vzeroupper 
02787 e854bfb4ff                     call       0x7ffaeb9c3660
0278c 0f1f840084280033               nop        dword ptr [rax + rax + 0x33002884]
02794 49ba0a5ce7ebfa7f0000           movabs     r10, 0x7ffaebe75c0a
0279e 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
027a5 e9b667a8ff                     jmp        0x7ffaeb8fdee0
027aa e87133a7ff                     call       0x7ffaeb8eaaa0
027af e98ad8ffff                     jmp        0x7ffaebe74fbe
027b4 f4                             hlt        
027b5 f4                             hlt        
027b6 f4                             hlt        
027b7 f4                             hlt        
