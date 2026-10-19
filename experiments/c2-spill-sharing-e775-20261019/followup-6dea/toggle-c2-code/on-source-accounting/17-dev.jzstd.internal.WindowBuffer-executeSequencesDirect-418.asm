00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85406ba8ff                   jne        0x7f179f8fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecd0000000                 sub        rsp, 0xd0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f853c270000                   jne        0x7f179fe7657a
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
00067 0f8f6f200000                   jg         0x7f179fe75edc
0006d 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00071 4c8b4e20                       mov        r9, qword ptr [rsi + 0x20]
00075 4c639424e0000000               movsxd     r10, dword ptr [rsp + 0xe0]
0007d 4c63d8                         movsxd     r11, eax
00080 4d03d8                         add        r11, r8
00083 4d2bcb                         sub        r9, r11
00086 4d3bd1                         cmp        r10, r9
00089 0f8f4d200000                   jg         0x7f179fe75edc
0008f 488b7e10                       mov        rdi, qword ptr [rsi + 0x10]
00093 4c8b4e28                       mov        r9, qword ptr [rsi + 0x28]
00097 4d85c9                         test       r9, r9
0009a 0f84930f0000                   je         0x7f179fe74e33
000a0 4533ed                         xor        r13d, r13d
000a3 4c8bda                         mov        r11, rdx
000a6 8b7204                         mov        esi, dword ptr [rdx + 4]
000a9 448b7340                       mov        r14d, dword ptr [rbx + 0x40]
000ad 448bd1                         mov        r10d, ecx
000b0 4585d2                         test       r10d, r10d
000b3 0f8edf1a0000                   jle        0x7f179fe75998
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
000e5 0f8609200000                   jbe        0x7f179fe75ef4
000eb 4d63d2                         movsxd     r10, r10d
000ee 4863c9                         movsxd     rcx, ecx
000f1 48ffc9                         dec        rcx
000f4 493bca                         cmp        rcx, r10
000f7 0f83f71f0000                   jae        0x7f179fe75ef4
000fd 4c8b9424e8000000               mov        r10, qword ptr [rsp + 0xe8]
00105 418b5a04                       mov        ebx, dword ptr [r10 + 4]
00109 85db                           test       ebx, ebx
0010b 0f861b200000                   jbe        0x7f179fe75f2c
00111 83fb01                         cmp        ebx, 1
00114 0f8612200000                   jbe        0x7f179fe75f2c
0011a 83fb02                         cmp        ebx, 2
0011d 0f8609200000                   jbe        0x7f179fe75f2c
00123 448d56f1                       lea        r10d, [rsi - 0xf]
00127 4585d2                         test       r10d, r10d
0012a 0f8cfc1f0000                   jl         0x7f179fe75f2c
00130 418b4e04                       mov        ecx, dword ptr [r14 + 4]
00134 448d51f1                       lea        r10d, [rcx - 0xf]
00138 4585d2                         test       r10d, r10d
0013b 0f8ceb1f0000                   jl         0x7f179fe75f2c
00141 448d51fd                       lea        r10d, [rcx - 3]
00145 4585d2                         test       r10d, r10d
00148 0f8cde1f0000                   jl         0x7f179fe75f2c
0014e 448d51f9                       lea        r10d, [rcx - 7]
00152 4585d2                         test       r10d, r10d
00155 0f8cd11f0000                   jl         0x7f179fe75f2c
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
001fb e93d040000                     jmp        0x7f179fe7443d
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
00232 0f8ddc030000                   jge        0x7f179fe74414
00238 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
0023d 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00242 452bd5                         sub        r10d, r13d
00245 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0024a 8b6c2448                       mov        ebp, dword ptr [rsp + 0x48]
0024e 412bed                         sub        ebp, r13d
00251 413bed                         cmp        ebp, r13d
00254 410f4fed                       cmovg      ebp, r13d
00258 458bc2                         mov        r8d, r10d
0025b 4585d2                         test       r10d, r10d
0025e 0f8cc41b0000                   jl         0x7f179fe75c28
00264 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00269 4585d2                         test       r10d, r10d
0026c 0f8cb61b0000                   jl         0x7f179fe75c28
00272 458d1428                       lea        r10d, [r8 + rbp]
00276 448b742404                     mov        r14d, dword ptr [rsp + 4]
0027b 453bf2                         cmp        r14d, r10d
0027e 0f82a41b0000                   jb         0x7f179fe75c28
00284 448b74245c                     mov        r14d, dword ptr [rsp + 0x5c]
00289 4403f5                         add        r14d, ebp
0028c 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00291 453bde                         cmp        r11d, r14d
00294 0f828e1b0000                   jb         0x7f179fe75c28
0029a 85ed                           test       ebp, ebp
0029c 0f8c861b0000                   jl         0x7f179fe75c28
002a2 85ed                           test       ebp, ebp
002a4 0f8479ffffff                   je         0x7f179fe74023
002aa 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
002af 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
002b7 4b8d741908                     lea        rsi, [r9 + r11 + 8]
002bc 4b8d7c0108                     lea        rdi, [r9 + r8 + 8]
002c1 4863d5                         movsxd     rdx, ebp
002c4 4883fa20                       cmp        rdx, 0x20
002c8 0f8632ffffff                   jbe        0x7f179fe74000
002ce c5f877                         vzeroupper 
002d1 49ba204f8e9f177f0000           movabs     r10, 0x7f179f8e4f20
002db 41ffd2                         call       r10
002de 0f1f840000000000               nop        dword ptr [rax + rax]
002e6 e938ffffff                     jmp        0x7f179fe74023
002eb 48894424f8                     mov        qword ptr [rsp - 8], rax
002f0 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
002f4 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
002fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00300 4585ed                         test       r13d, r13d
00303 0f8ea3110000                   jle        0x7f179fe752ac
00309 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0030e 44034c244c                     add        r9d, dword ptr [rsp + 0x4c]
00313 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
0031b 0f8f9b120000                   jg         0x7f179fe753bc
00321 458d041a                       lea        r8d, [r10 + rbx]
00325 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
0032d 443b842488000000               cmp        r8d, dword ptr [rsp + 0x88]
00335 0f8f05130000                   jg         0x7f179fe75440
0033b 83fb10                         cmp        ebx, 0x10
0033e 0f8f8c060000                   jg         0x7f179fe747d0
00344 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
00349 0f83860f0000                   jae        0x7f179fe750d5
0034f 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00354 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
0035b 3b842490000000                 cmp        eax, dword ptr [rsp + 0x90]
00362 0f83ec0f0000                   jae        0x7f179fe75154
00368 468d3413                       lea        r14d, [rbx + r10]
0036c 4489b42494000000               mov        dword ptr [rsp + 0x94], r14d
00374 448bb42484000000               mov        r14d, dword ptr [rsp + 0x84]
0037c c4c17a7f440608                 vmovdqu    xmmword ptr [r14 + rax + 8], xmm0
00383 03d8                           add        ebx, eax
00385 448bf3                         mov        r14d, ebx
00388 452bf5                         sub        r14d, r13d
0038b 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00390 4183f910                       cmp        r9d, 0x10
00394 7f47                           jg         0x7f179fe741dd
00396 4183fd10                       cmp        r13d, 0x10
0039a 7c41                           jl         0x7f179fe741dd
0039c 443bb42490000000               cmp        r14d, dword ptr [rsp + 0x90]
003a4 0f832e100000                   jae        0x7f179fe751d8
003aa 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
003b2 c4817a6f443508                 vmovdqu    xmm0, xmmword ptr [r13 + r14 + 8]
003b9 3b9c2490000000                 cmp        ebx, dword ptr [rsp + 0x90]
003c0 0f837a100000                   jae        0x7f179fe75240
003c6 c4c17a7f441d08                 vmovdqu    xmmword ptr [r13 + rbx + 8], xmm0
003cd 4403cb                         add        r9d, ebx
003d0 44898c24a8000000               mov        dword ptr [rsp + 0xa8], r9d
003d8 e937020000                     jmp        0x7f179fe74414
003dd 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
003e5 4b8d7c3208                     lea        rdi, [r10 + r14 + 8]
003ea 498d741a08                     lea        rsi, [r10 + rbx + 8]
003ef 458d1c19                       lea        r11d, [r9 + rbx]
003f3 44899c24a8000000               mov        dword ptr [rsp + 0xa8], r11d
003fb 4963cb                         movsxd     rcx, r11d
003fe 453be9                         cmp        r13d, r9d
00401 0f8cd7030000                   jl         0x7f179fe745de
00407 4183f930                       cmp        r9d, 0x30
0040b 0f8e89000000                   jle        0x7f179fe7429a
00411 4585f6                         test       r14d, r14d
00414 0f8c66150000                   jl         0x7f179fe75780
0041a 85db                           test       ebx, ebx
0041c 0f8c5e150000                   jl         0x7f179fe75780
00422 478d1431                       lea        r10d, [r9 + r14]
00426 448b6c2404                     mov        r13d, dword ptr [rsp + 4]
0042b 453bea                         cmp        r13d, r10d
0042e 0f824c150000                   jb         0x7f179fe75780
00434 453beb                         cmp        r13d, r11d
00437 0f8243150000                   jb         0x7f179fe75780
0043d 4585c9                         test       r9d, r9d
00440 0f8432150000                   je         0x7f179fe75778
00446 4963d1                         movsxd     rdx, r9d
00449 4883fa20                       cmp        rdx, 0x20
0044d 772b                           ja         0x7f179fe7427a
0044f 458bd9                         mov        r11d, r9d
00452 4d63d3                         movsxd     r10, r11d
00455 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0045c c442a8f5db                     bzhi       r11, r11, r10
00461 c4c1fb92fb                     kmovq      k7, r11
00466 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0046c 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00472 418be9                         mov        ebp, r9d
00475 e991010000                     jmp        0x7f179fe7440b
0047a 418be9                         mov        ebp, r9d
0047d c5f877                         vzeroupper 
00480 49ba204f8e9f177f0000           movabs     r10, 0x7f179f8e4f20
0048a 41ffd2                         call       r10
0048d 0f1f840000000000               nop        dword ptr [rax + rax]
00495 e971010000                     jmp        0x7f179fe7440b
0049a 443b742468                     cmp        r14d, dword ptr [rsp + 0x68]
0049f 0f83f3120000                   jae        0x7f179fe75598
004a5 4963fe                         movsxd     rdi, r14d
004a8 4d8b443a08                     mov        r8, qword ptr [r10 + rdi + 8]
004ad 3b5c2468                       cmp        ebx, dword ptr [rsp + 0x68]
004b1 0f834d130000                   jae        0x7f179fe75604
004b7 448bd3                         mov        r10d, ebx
004ba 458d5a08                       lea        r11d, [r10 + 8]
004be 4963d2                         movsxd     rdx, r10d
004c1 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
004c9 4d89441508                     mov        qword ptr [r13 + rdx + 8], r8
004ce 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
004d6 7c08                           jl         0x7f179fe742e0
004d8 418be9                         mov        ebp, r9d
004db e92b010000                     jmp        0x7f179fe7440b
004e0 482bfa                         sub        rdi, rdx
004e3 4963d3                         movsxd     rdx, r11d
004e6 4c8d043a                       lea        r8, [rdx + rdi]
004ea 4c3b842498000000               cmp        r8, qword ptr [rsp + 0x98]
004f2 0f8380130000                   jae        0x7f179fe75678
004f8 4c8bc1                         mov        r8, rcx
004fb 4c2bc2                         sub        r8, rdx
004fe 4983c007                       add        r8, 7
00502 4983e0f8                       and        r8, 0xfffffffffffffff8
00506 418bd0                         mov        edx, r8d
00509 468d441208                     lea        r8d, [rdx + r10 + 8]
0050e 4d63c0                         movsxd     r8, r8d
00511 498d7c38f8                     lea        rdi, [r8 + rdi - 8]
00516 483bbc2498000000               cmp        rdi, qword ptr [rsp + 0x98]
0051e 0f8354130000                   jae        0x7f179fe75678
00524 443b5c2468                     cmp        r11d, dword ptr [rsp + 0x68]
00529 0f8349130000                   jae        0x7f179fe75678
0052f 4983c0f8                       add        r8, -8
00533 4c3b842498000000               cmp        r8, qword ptr [rsp + 0x98]
0053b 0f8337130000                   jae        0x7f179fe75678
00541 448bac24a8000000               mov        r13d, dword ptr [rsp + 0xa8]
00549 4181fdf8ffff7f                 cmp        r13d, 0x7ffffff8
00550 0f8faa130000                   jg         0x7f179fe75700
00556 452bf2                         sub        r14d, r10d
00559 4183c210                       add        r10d, 0x10
0055d 418be9                         mov        ebp, r9d
00560 478d0c1e                       lea        r9d, [r14 + r11]
00564 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
0056c 4f8b4c0d08                     mov        r9, qword ptr [r13 + r9 + 8]
00571 458bc3                         mov        r8d, r11d
00574 4f894c0508                     mov        qword ptr [r13 + r8 + 8], r9
00579 4183c308                       add        r11d, 8
0057d 453bda                         cmp        r11d, r10d
00580 7cde                           jl         0x7f179fe74360
00582 4883c1f8                       add        rcx, -8
00586 4881f900000080                 cmp        rcx, -0x80000000
0058d 49c7c200000080                 mov        r10, 0xffffffff80000000
00594 490f4cca                       cmovl      rcx, r10
00598 8bc9                           mov        ecx, ecx
0059a 443bd9                         cmp        r11d, ecx
0059d 7d39                           jge        0x7f179fe743d8
0059f 90                             nop        
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
005ce 7cd0                           jl         0x7f179fe743a0
005d0 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
005d8 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
005e0 7d29                           jge        0x7f179fe7440b
005e2 6690                           nop        
005e4 478d141e                       lea        r10d, [r14 + r11]
005e8 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
005f0 4f8b541508                     mov        r10, qword ptr [r13 + r10 + 8]
005f5 458bc3                         mov        r8d, r11d
005f8 4f89540508                     mov        qword ptr [r13 + r8 + 8], r10
005fd 4183c308                       add        r11d, 8
00601 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
00609 7cd9                           jl         0x7f179fe743e4
0060b 03dd                           add        ebx, ebp
0060d 899c24a8000000                 mov        dword ptr [rsp + 0xa8], ebx
00614 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
0061b ffc3                           inc        ebx
0061d 3b5c2438                       cmp        ebx, dword ptr [rsp + 0x38]
00621 0f8d90050000                   jge        0x7f179fe749b7
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
00677 0f8c570e0000                   jl         0x7f179fe752d4
0067d 85db                           test       ebx, ebx
0067f 0f8599000000                   jne        0x7f179fe7451e
00685 33db                           xor        ebx, ebx
00687 4183fd03                       cmp        r13d, 3
0068b 0f8ebf000000                   jle        0x7f179fe74550
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
006d5 0f8f790e0000                   jg         0x7f179fe75354
006db 448d3418                       lea        r14d, [rax + rbx]
006df 448974244c                     mov        dword ptr [rsp + 0x4c], r14d
006e4 452bf5                         sub        r14d, r13d
006e7 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
006ec 4585c9                         test       r9d, r9d
006ef 0f85f6fbffff                   jne        0x7f179fe740eb
006f5 4d63c6                         movsxd     r8, r14d
006f8 4c3b442428                     cmp        r8, qword ptr [rsp + 0x28]
006fd 0f8cbd0f0000                   jl         0x7f179fe754c0
00703 483b6c2430                     cmp        rbp, qword ptr [rsp + 0x30]
00708 0f8f1e100000                   jg         0x7f179fe7552c
0070e 4533c0                         xor        r8d, r8d
00711 44898424ac000000               mov        dword ptr [rsp + 0xac], r8d
00719 e9e2fbffff                     jmp        0x7f179fe74100
0071e 448b0424                       mov        r8d, dword ptr [rsp]
00722 452bc2                         sub        r8d, r10d
00725 413bd8                         cmp        ebx, r8d
00728 0f8e59ffffff                   jle        0x7f179fe74487
0072e be45ffffff                     mov        esi, 0xffffff45
00733 8beb                           mov        ebp, ebx
00735 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
0073d 666690                         nop        
00740 c5f877                         vzeroupper 
00743 e818f1b4ff                     call       0x7f179f9c3660
00748 0f1f840040080001               nop        dword ptr [rax + rax + 0x1000840]
00750 85db                           test       ebx, ebx
00752 7403                           je         0x7f179fe74557
00754 41ffcd                         dec        r13d
00757 4585ed                         test       r13d, r13d
0075a 750e                           jne        0x7f179fe7456a
0075c 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00764 458b4308                       mov        r8d, dword ptr [r11 + 8]
00768 eb6c                           jmp        0x7f179fe745d6
0076a 4183fd03                       cmp        r13d, 3
0076e 0f847c170000                   je         0x7f179fe75cf0
00774 4183fd02                       cmp        r13d, 2
00778 0f87f6170000                   ja         0x7f179fe75d74
0077e 443bac24e4000000               cmp        r13d, dword ptr [rsp + 0xe4]
00786 0f8387130000                   jae        0x7f179fe75913
0078c 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00794 478b44ab08                     mov        r8d, dword ptr [r11 + r13*4 + 8]
00799 4585ed                         test       r13d, r13d
0079c 7e2c                           jle        0x7f179fe745ca
0079e 458d5dff                       lea        r11d, [r13 - 1]
007a2 443b9c24e4000000               cmp        r11d, dword ptr [rsp + 0xe4]
007aa 0f83b8160000                   jae        0x7f179fe75c68
007b0 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
007b8 478b4cab04                     mov        r9d, dword ptr [r11 + r13*4 + 4]
007bd 47894cab08                     mov        dword ptr [r11 + r13*4 + 8], r9d
007c2 41ffcd                         dec        r13d
007c5 4585ed                         test       r13d, r13d
007c8 7fe6                           jg         0x7f179fe745b0
007ca 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
007d2 45894308                       mov        dword ptr [r11 + 8], r8d
007d6 458be8                         mov        r13d, r8d
007d9 e9e3feffff                     jmp        0x7f179fe744c1
007de 4183fd10                       cmp        r13d, 0x10
007e2 0f8d69080000                   jge        0x7f179fe74e51
007e8 4183fd08                       cmp        r13d, 8
007ec 0f8dd0040000                   jge        0x7f179fe74ac2
007f2 4183f910                       cmp        r9d, 0x10
007f6 0f8f41010000                   jg         0x7f179fe7473d
007fc 443b742404                     cmp        r14d, dword ptr [rsp + 4]
00801 0f83ac130000                   jae        0x7f179fe759b3
00807 430fbe6c3208                   movsx      ebp, byte ptr [r10 + r14 + 8]
0080d 3b5c2404                       cmp        ebx, dword ptr [rsp + 4]
00811 0f8305140000                   jae        0x7f179fe75a1c
00817 41886c1a08                     mov        byte ptr [r10 + rbx + 8], bpl
0081c 448d5b01                       lea        r11d, [rbx + 1]
00820 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00825 458d5603                       lea        r10d, [r14 + 3]
00829 443b542404                     cmp        r10d, dword ptr [rsp + 4]
0082e 0f8334140000                   jae        0x7f179fe75a68
00834 4d63c6                         movsxd     r8, r14d
00837 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0083f 430fbe6c0209                   movsx      ebp, byte ptr [r10 + r8 + 9]
00845 448d5b03                       lea        r11d, [rbx + 3]
00849 443b5c2404                     cmp        r11d, dword ptr [rsp + 4]
0084e 0f8364140000                   jae        0x7f179fe75ab8
00854 4863cb                         movsxd     rcx, ebx
00857 41886c0a09                     mov        byte ptr [r10 + rcx + 9], bpl
0085c 470fbe5c020a                   movsx      r11d, byte ptr [r10 + r8 + 0xa]
00862 45885c0a0a                     mov        byte ptr [r10 + rcx + 0xa], r11b
00867 470fbe54020b                   movsx      r10d, byte ptr [r10 + r8 + 0xb]
0086d 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00875 4588540b0b                     mov        byte ptr [r11 + rcx + 0xb], r10b
0087a 4183fd08                       cmp        r13d, 8
0087e 0f8380140000                   jae        0x7f179fe75b04
00884 49ba283827e300000000           movabs     r10, 0xe3273828
0088e 470374aa08                     add        r14d, dword ptr [r10 + r13*4 + 8]
00893 4183f904                       cmp        r9d, 4
00897 7e44                           jle        0x7f179fe746dd
00899 448d5304                       lea        r10d, [rbx + 4]
0089d 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
008a2 443b742458                     cmp        r14d, dword ptr [rsp + 0x58]
008a7 0f83c7140000                   jae        0x7f179fe75b74
008ad 458bde                         mov        r11d, r14d
008b0 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
008b5 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
008bd 438b6c1808                     mov        ebp, dword ptr [r8 + r11 + 8]
008c2 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
008c7 443b542458                     cmp        r10d, dword ptr [rsp + 0x58]
008cc 0f8312150000                   jae        0x7f179fe75be4
008d2 448bd3                         mov        r10d, ebx
008d5 4d63da                         movsxd     r11, r10d
008d8 43896c180c                     mov        dword ptr [r8 + r11 + 0xc], ebp
008dd 4183f908                       cmp        r9d, 8
008e1 0f8e2dfdffff                   jle        0x7f179fe74414
008e7 448d5308                       lea        r10d, [rbx + 8]
008eb 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
008f0 49ba503827e300000000           movabs     r10, 0xe3273850
008fa 478b5caa08                     mov        r11d, dword ptr [r10 + r13*4 + 8]
008ff 452bf3                         sub        r14d, r11d
00902 418d6e08                       lea        ebp, [r14 + 8]
00906 3b6c2468                       cmp        ebp, dword ptr [rsp + 0x68]
0090a 0f83e8160000                   jae        0x7f179fe75df8
00910 4d63d6                         movsxd     r10, r14d
00913 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
0091b 4b8b6c1510                     mov        rbp, qword ptr [r13 + r10 + 0x10]
00920 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00925 443b5c2468                     cmp        r11d, dword ptr [rsp + 0x68]
0092a 0f8308170000                   jae        0x7f179fe75e38
00930 4c63d3                         movsxd     r10, ebx
00933 4b896c1510                     mov        qword ptr [r13 + r10 + 0x10], rbp
00938 e9d7fcffff                     jmp        0x7f179fe74414
0093d 4585f6                         test       r14d, r14d
00940 0f8c26170000                   jl         0x7f179fe75e6c
00946 85db                           test       ebx, ebx
00948 0f8c1e170000                   jl         0x7f179fe75e6c
0094e 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00953 443bdb                         cmp        r11d, ebx
00956 0f8210170000                   jb         0x7f179fe75e6c
0095c 468d142b                       lea        r10d, [rbx + r13]
00960 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
00965 443b5c245c                     cmp        r11d, dword ptr [rsp + 0x5c]
0096a 0f82fc160000                   jb         0x7f179fe75e6c
00970 4585ed                         test       r13d, r13d
00973 0f8cf3160000                   jl         0x7f179fe75e6c
00979 4585ed                         test       r13d, r13d
0097c 0f84bbf8ffff                   je         0x7f179fe7403d
00982 4883fd20                       cmp        rbp, 0x20
00986 7728                           ja         0x7f179fe747b0
00988 458bdd                         mov        r11d, r13d
0098b 4d63d3                         movsxd     r10, r11d
0098e 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00995 c442a8f5db                     bzhi       r11, r11, r10
0099a c4c1fb92fb                     kmovq      k7, r11
0099f 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
009a5 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
009ab e98df8ffff                     jmp        0x7f179fe7403d
009b0 488bd5                         mov        rdx, rbp
009b3 c5f877                         vzeroupper 
009b6 49ba204f8e9f177f0000           movabs     r10, 0x7f179f8e4f20
009c0 41ffd2                         call       r10
009c3 0f1f840000000000               nop        dword ptr [rax + rax]
009cb e96df8ffff                     jmp        0x7f179fe7403d
009d0 83fb30                         cmp        ebx, 0x30
009d3 0f8e9b000000                   jle        0x7f179fe74874
009d9 4585d2                         test       r10d, r10d
009dc 0f8cfe180000                   jl         0x7f179fe760e0
009e2 85c0                           test       eax, eax
009e4 0f8cf6180000                   jl         0x7f179fe760e0
009ea 448b8424e0000000               mov        r8d, dword ptr [rsp + 0xe0]
009f2 443b842494000000               cmp        r8d, dword ptr [rsp + 0x94]
009fa 0f82e0180000                   jb         0x7f179fe760e0
00a00 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00a05 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
00a0a 0f82d0180000                   jb         0x7f179fe760e0
00a10 85db                           test       ebx, ebx
00a12 743d                           je         0x7f179fe74851
00a14 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00a19 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00a1e 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00a26 498d740308                     lea        rsi, [r11 + rax + 8]
00a2b 4883fa20                       cmp        rdx, 0x20
00a2f 7729                           ja         0x7f179fe7485a
00a31 4c63d3                         movsxd     r10, ebx
00a34 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00a3b c442a8f5db                     bzhi       r11, r11, r10
00a40 c4c1fb92fb                     kmovq      k7, r11
00a45 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00a4b 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00a51 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
00a55 e931f9ffff                     jmp        0x7f179fe7418b
00a5a c5f877                         vzeroupper 
00a5d 49ba204f8e9f177f0000           movabs     r10, 0x7f179f8e4f20
00a67 41ffd2                         call       r10
00a6a 0f1f840000000000               nop        dword ptr [rax + rax]
00a72 ebdd                           jmp        0x7f179fe74851
00a74 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
00a79 0f8335170000                   jae        0x7f179fe75fb4
00a7f 4d63ca                         movsxd     r9, r10d
00a82 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00a87 c4817a6f440b08                 vmovdqu    xmm0, xmmword ptr [r11 + r9 + 8]
00a8e 3b842490000000                 cmp        eax, dword ptr [rsp + 0x90]
00a95 0f83b1170000                   jae        0x7f179fe7604c
00a9b 448d5810                       lea        r11d, [rax + 0x10]
00a9f 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00aa4 4c63c0                         movsxd     r8, eax
00aa7 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00aaf c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
00ab6 8b4c245c                       mov        ecx, dword ptr [rsp + 0x5c]
00aba 3b4c244c                       cmp        ecx, dword ptr [rsp + 0x4c]
00abe 0f8db9000000                   jge        0x7f179fe7497d
00ac4 4d2bc8                         sub        r9, r8
00ac7 4c63c1                         movsxd     r8, ecx
00aca 48637c2418                     movsxd     rdi, dword ptr [rsp + 0x18]
00acf 4883c7f1                       add        rdi, -0xf
00ad3 4f8d1c08                       lea        r11, [r8 + r9]
00ad7 4c3bdf                         cmp        r11, rdi
00ada 0f8380180000                   jae        0x7f179fe76160
00ae0 4c635c244c                     movsxd     r11, dword ptr [rsp + 0x4c]
00ae5 4d2bd8                         sub        r11, r8
00ae8 4983c30f                       add        r11, 0xf
00aec 4983e3f0                       and        r11, 0xfffffffffffffff0
00af0 458bdb                         mov        r11d, r11d
00af3 458d440310                     lea        r8d, [r11 + rax + 0x10]
00af8 4d63d8                         movsxd     r11, r8d
00afb 4f8d440bf0                     lea        r8, [r11 + r9 - 0x10]
00b00 4c3bc7                         cmp        r8, rdi
00b03 0f8357180000                   jae        0x7f179fe76160
00b09 3b8c2490000000                 cmp        ecx, dword ptr [rsp + 0x90]
00b10 0f834a180000                   jae        0x7f179fe76160
00b16 4983c3f0                       add        r11, -0x10
00b1a 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
00b22 0f8338180000                   jae        0x7f179fe76160
00b28 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00b2d 4181fbf0ffff7f                 cmp        r11d, 0x7ffffff0
00b34 0f8f82180000                   jg         0x7f179fe761bc
00b3a 458bc2                         mov        r8d, r10d
00b3d 442bc0                         sub        r8d, eax
00b40 458bd8                         mov        r11d, r8d
00b43 44035c245c                     add        r11d, dword ptr [rsp + 0x5c]
00b48 4c8b4c2450                     mov        r9, qword ptr [rsp + 0x50]
00b4d c4817a6f441908                 vmovdqu    xmm0, xmmword ptr [r9 + r11 + 8]
00b54 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00b59 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
00b61 c4817a7f441908                 vmovdqu    xmmword ptr [r9 + r11 + 8], xmm0
00b68 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00b6d 4183c310                       add        r11d, 0x10
00b71 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00b76 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
00b7b 7cc3                           jl         0x7f179fe74940
00b7d 468d0413                       lea        r8d, [rbx + r10]
00b81 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
00b85 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
00b8d e9f9f7ffff                     jmp        0x7f179fe7418b
00b92 4c63d5                         movsxd     r10, ebp
00b95 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b9c c442a8f5db                     bzhi       r11, r11, r10
00ba1 c4c1fb92fb                     kmovq      k7, r11
00ba6 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00bac 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00bb2 e9a4000000                     jmp        0x7f179fe74a5b
00bb7 8b2c24                         mov        ebp, dword ptr [rsp]
00bba 2bac2494000000                 sub        ebp, dword ptr [rsp + 0x94]
00bc1 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
00bc9 4585c0                         test       r8d, r8d
00bcc 0f8c92150000                   jl         0x7f179fe75f64
00bd2 488b5c2478                     mov        rbx, qword ptr [rsp + 0x78]
00bd7 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00bdc 8bb424e0000000                 mov        esi, dword ptr [rsp + 0xe0]
00be3 448bb42484000000               mov        r14d, dword ptr [rsp + 0x84]
00beb 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00bf3 4585d2                         test       r10d, r10d
00bf6 0f8c82150000                   jl         0x7f179fe75f7e
00bfc 3b3424                         cmp        esi, dword ptr [rsp]
00bff 0f8279150000                   jb         0x7f179fe75f7e
00c05 418b4e04                       mov        ecx, dword ptr [r14 + 4]
00c09 448bac24a8000000               mov        r13d, dword ptr [rsp + 0xa8]
00c11 4403ed                         add        r13d, ebp
00c14 413bcd                         cmp        ecx, r13d
00c17 0f8261150000                   jb         0x7f179fe75f7e
00c1d 85ed                           test       ebp, ebp
00c1f 0f8c59150000                   jl         0x7f179fe75f7e
00c25 85ed                           test       ebp, ebp
00c27 7432                           je         0x7f179fe74a5b
00c29 4b8d7c0308                     lea        rdi, [r11 + r8 + 8]
00c2e 4d8bde                         mov        r11, r14
00c31 4b8d741608                     lea        rsi, [r14 + r10 + 8]
00c36 4863d5                         movsxd     rdx, ebp
00c39 4883fa20                       cmp        rdx, 0x20
00c3d 0f864fffffff                   jbe        0x7f179fe74992
00c43 c5f877                         vzeroupper 
00c46 49ba204f8e9f177f0000           movabs     r10, 0x7f179f8e4f20
00c50 41ffd2                         call       r10
00c53 0f1f840000000000               nop        dword ptr [rax + rax]
00c5b 44896b38                       mov        dword ptr [rbx + 0x38], r13d
00c5f c5f877                         vzeroupper 
00c62 4881c4d0000000                 add        rsp, 0xd0
00c69 5d                             pop        rbp
00c6a 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00c6e 0f87f01a0000                   ja         0x7f179fe76564
00c74 c3                             ret        
00c75 418beb                         mov        ebp, r11d
00c78 896c2440                       mov        dword ptr [rsp + 0x40], ebp
00c7c 8bd9                           mov        ebx, ecx
00c7e 6690                           nop        
00c80 448bd0                         mov        r10d, eax
00c83 4403542440                     add        r10d, dword ptr [rsp + 0x40]
00c88 62b17e486f841308000000         vmovdqu32  zmm0, zmmword ptr [rbx + r10 + 8]
00c93 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00c98 62b17e487f841b08000000         vmovdqu32  zmmword ptr [rbx + r11 + 8], zmm0
00ca3 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00ca8 4183c240                       add        r10d, 0x40
00cac 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00cb1 443bd7                         cmp        r10d, edi
00cb4 7cca                           jl         0x7f179fe74a80
00cb6 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
00cbd e930030000                     jmp        0x7f179fe74df2
00cc2 443b742468                     cmp        r14d, dword ptr [rsp + 0x68]
00cc7 0f834b170000                   jae        0x7f179fe76218
00ccd 458bde                         mov        r11d, r14d
00cd0 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00cd5 4d63cb                         movsxd     r9, r11d
00cd8 4f8b540a08                     mov        r10, qword ptr [r10 + r9 + 8]
00cdd 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00ce2 3b5c2468                       cmp        ebx, dword ptr [rsp + 0x68]
00ce6 0f8390170000                   jae        0x7f179fe7627c
00cec 448bd3                         mov        r10d, ebx
00cef 418d6a08                       lea        ebp, [r10 + 8]
00cf3 896c2440                       mov        dword ptr [rsp + 0x40], ebp
00cf7 4d63da                         movsxd     r11, r10d
00cfa 4c8b442460                     mov        r8, qword ptr [rsp + 0x60]
00cff 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
00d07 4f89441d08                     mov        qword ptr [r13 + r11 + 8], r8
00d0c 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
00d13 0f8dfbf8ffff                   jge        0x7f179fe74414
00d19 4d2bcb                         sub        r9, r11
00d1c 4863d5                         movsxd     rdx, ebp
00d1f 4e8d1c0a                       lea        r11, [rdx + r9]
00d23 4c3b9c2498000000               cmp        r11, qword ptr [rsp + 0x98]
00d2b 0f83ab170000                   jae        0x7f179fe762dc
00d31 4c8bd9                         mov        r11, rcx
00d34 4c2bda                         sub        r11, rdx
00d37 4983c307                       add        r11, 7
00d3b 4983e3f8                       and        r11, 0xfffffffffffffff8
00d3f 458bc3                         mov        r8d, r11d
00d42 478d5c1008                     lea        r11d, [r8 + r10 + 8]
00d47 4d63db                         movsxd     r11, r11d
00d4a 4f8d440bf8                     lea        r8, [r11 + r9 - 8]
00d4f 4c3b842498000000               cmp        r8, qword ptr [rsp + 0x98]
00d57 0f837f170000                   jae        0x7f179fe762dc
00d5d 3b6c2468                       cmp        ebp, dword ptr [rsp + 0x68]
00d61 0f8375170000                   jae        0x7f179fe762dc
00d67 4983c3f8                       add        r11, -8
00d6b 4c3b9c2498000000               cmp        r11, qword ptr [rsp + 0x98]
00d73 0f8363170000                   jae        0x7f179fe762dc
00d79 448bac24a8000000               mov        r13d, dword ptr [rsp + 0xa8]
00d81 4181fdf8ffff7f                 cmp        r13d, 0x7ffffff8
00d88 0f8fce170000                   jg         0x7f179fe7635c
00d8e 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
00d92 412bea                         sub        ebp, r10d
00d95 8bc5                           mov        eax, ebp
00d97 41b8f8ffffff                   mov        r8d, 0xfffffff8
00d9d 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
00da5 458bdd                         mov        r11d, r13d
00da8 452bc3                         sub        r8d, r11d
00dab 452bc2                         sub        r8d, r10d
00dae 4183c210                       add        r10d, 0x10
00db2 4183c0f0                       add        r8d, -0x10
00db6 4c8d59c8                       lea        r11, [rcx - 0x38]
00dba 4981fb00000080                 cmp        r11, -0x80000000
00dc1 49c7c100000080                 mov        r9, 0xffffffff80000000
00dc8 4d0f4cd9                       cmovl      r11, r9
00dcc 418bfb                         mov        edi, r11d
00dcf 442bf3                         sub        r14d, ebx
00dd2 4d63da                         movsxd     r11, r10d
00dd5 488b5c2410                     mov        rbx, qword ptr [rsp + 0x10]
00dda 41b906000000                   mov        r9d, 6
00de0 c442b0f5c0                     bzhi       r8, r8, r9
00de5 4d03d8                         add        r11, r8
00de8 4c3bd9                         cmp        r11, rcx
00deb 4c8bc1                         mov        r8, rcx
00dee 4d0f4cc3                       cmovl      r8, r11
00df2 4d8bd8                         mov        r11, r8
00df5 4c2bda                         sub        r11, rdx
00df8 4d8d4bff                       lea        r9, [r11 - 1]
00dfc 49c1f93f                       sar        r9, 0x3f
00e00 49c1e93d                       shr        r9, 0x3d
00e04 4f8d5c19ff                     lea        r11, [r9 + r11 - 1]
00e09 4983e3f8                       and        r11, 0xfffffffffffffff8
00e0d 4c03da                         add        r11, rdx
00e10 493bd3                         cmp        rdx, r11
00e13 490f4cd3                       cmovl      rdx, r11
00e17 448bda                         mov        r11d, edx
00e1a 478d4c1e08                     lea        r9d, [r14 + r11 + 8]
00e1f 4183c308                       add        r11d, 8
00e23 4d63c9                         movsxd     r9, r9d
00e26 4c03cb                         add        r9, rbx
00e29 4963d3                         movsxd     rdx, r11d
00e2c 4803d3                         add        rdx, rbx
00e2f 498d5908                       lea        rbx, [r9 + 8]
00e33 4983c148                       add        r9, 0x48
00e37 488d7248                       lea        rsi, [rdx + 0x48]
00e3b 4533db                         xor        r11d, r11d
00e3e 483bf3                         cmp        rsi, rbx
00e41 410f96c3                       setbe      r11b
00e45 4883c208                       add        rdx, 8
00e49 33db                           xor        ebx, ebx
00e4b 4c3bca                         cmp        r9, rdx
00e4e 0f96c3                         setbe      bl
00e51 440bdb                         or         r11d, ebx
00e54 0f848e0b0000                   je         0x7f179fe757e8
00e5a 458bd0                         mov        r10d, r8d
00e5d 666690                         nop        
00e60 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
00e65 448bd8                         mov        r11d, eax
00e68 44035c2440                     add        r11d, dword ptr [rsp + 0x40]
00e6d 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
00e74 4e8b5c1b08                     mov        r11, qword ptr [rbx + r11 + 8]
00e79 4e895c0308                     mov        qword ptr [rbx + r8 + 8], r11
00e7e 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00e83 4183c308                       add        r11d, 8
00e87 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00e8c 453bda                         cmp        r11d, r10d
00e8f 7ccf                           jl         0x7f179fe74c60
00e91 4881c108feffff                 add        rcx, -0x1f8
00e98 4881f900000080                 cmp        rcx, -0x80000000
00e9f 49c7c200000080                 mov        r10, 0xffffffff80000000
00ea6 490f4cca                       cmovl      rcx, r10
00eaa 448bc9                         mov        r9d, ecx
00ead 453bd9                         cmp        r11d, r9d
00eb0 0f8d3c010000                   jge        0x7f179fe74df2
00eb6 458bd3                         mov        r10d, r11d
00eb9 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00ebe 8b8c2484000000                 mov        ecx, dword ptr [rsp + 0x84]
00ec5 6666660f1f840000000000         nop        word ptr [rax + rax]
00ed0 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00ed5 4963d3                         movsxd     rdx, r11d
00ed8 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00edd 448bc0                         mov        r8d, eax
00ee0 4403442440                     add        r8d, dword ptr [rsp + 0x40]
00ee5 8b5c2440                       mov        ebx, dword ptr [rsp + 0x40]
00ee9 83c340                         add        ebx, 0x40
00eec 03d8                           add        ebx, eax
00eee 458bd8                         mov        r11d, r8d
00ef1 62b17e486f841908000000         vmovdqu32  zmm0, zmmword ptr [rcx + r11 + 8]
00efc 62b17e487f841108000000         vmovdqu32  zmmword ptr [rcx + r10 + 8], zmm0
00f07 62f17e486f841908000000         vmovdqu32  zmm0, zmmword ptr [rcx + rbx + 8]
00f12 62f17e487f841148000000         vmovdqu32  zmmword ptr [rcx + rdx + 0x48], zmm0
00f1d 4d63d0                         movsxd     r10, r8d
00f20 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00f25 4181c380000000                 add        r11d, 0x80
00f2c 4403d8                         add        r11d, eax
00f2f 62b17e486f841908000000         vmovdqu32  zmm0, zmmword ptr [rcx + r11 + 8]
00f3a 62f17e487f841188000000         vmovdqu32  zmmword ptr [rcx + rdx + 0x88], zmm0
00f45 62b17e486f8411c8000000         vmovdqu32  zmm0, zmmword ptr [rcx + r10 + 0xc8]
00f50 62f17e487f8411c8000000         vmovdqu32  zmmword ptr [rcx + rdx + 0xc8], zmm0
00f5b 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00f60 4181c300010000                 add        r11d, 0x100
00f67 4403d8                         add        r11d, eax
00f6a 458bc3                         mov        r8d, r11d
00f6d 62b17e486f841908000000         vmovdqu32  zmm0, zmmword ptr [rcx + r11 + 8]
00f78 62f17e487f841108010000         vmovdqu32  zmmword ptr [rcx + rdx + 0x108], zmm0
00f83 62b17e486f841148010000         vmovdqu32  zmm0, zmmword ptr [rcx + r10 + 0x148]
00f8e 62f17e487f841148010000         vmovdqu32  zmmword ptr [rcx + rdx + 0x148], zmm0
00f99 62b17e486f841188010000         vmovdqu32  zmm0, zmmword ptr [rcx + r10 + 0x188]
00fa4 62f17e487f841188010000         vmovdqu32  zmmword ptr [rcx + rdx + 0x188], zmm0
00faf 4d63d0                         movsxd     r10, r8d
00fb2 62b17e486f8411c8000000         vmovdqu32  zmm0, zmmword ptr [rcx + r10 + 0xc8]
00fbd 62f17e487f8411c8010000         vmovdqu32  zmmword ptr [rcx + rdx + 0x1c8], zmm0
00fc8 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00fcd 4181c300020000                 add        r11d, 0x200
00fd4 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00fd9 453bd9                         cmp        r11d, r9d
00fdc 0f8ceefeffff                   jl         0x7f179fe74cd0
00fe2 443bdf                         cmp        r11d, edi
00fe5 0f8c8afcffff                   jl         0x7f179fe74a75
00feb 898c2484000000                 mov        dword ptr [rsp + 0x84], ecx
00ff2 8b6c2440                       mov        ebp, dword ptr [rsp + 0x40]
00ff6 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
00ffd 0f8d11f6ffff                   jge        0x7f179fe74414
01003 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
01008 468d1408                       lea        r10d, [rax + r9]
0100c 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
01013 4e8b541308                     mov        r10, qword ptr [rbx + r10 + 8]
01018 458bd9                         mov        r11d, r9d
0101b 4e89541b08                     mov        qword ptr [rbx + r11 + 8], r10
01020 4183c108                       add        r9d, 8
01024 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
0102c 7cda                           jl         0x7f179fe74e08
0102e e9e1f5ffff                     jmp        0x7f179fe74414
01033 4d03da                         add        r11, r10
01036 4c3bdf                         cmp        r11, rdi
01039 7e08                           jle        0x7f179fe74e43
0103b 4533c9                         xor        r9d, r9d
0103e e95df0ffff                     jmp        0x7f179fe73ea0
01043 4533c9                         xor        r9d, r9d
01046 41bd01000000                   mov        r13d, 1
0104c e952f0ffff                     jmp        0x7f179fe73ea3
01051 443bb42490000000               cmp        r14d, dword ptr [rsp + 0x90]
01059 0f836d150000                   jae        0x7f179fe763cc
0105f 4d63c6                         movsxd     r8, r14d
01062 c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
01069 3b9c2490000000                 cmp        ebx, dword ptr [rsp + 0x90]
01070 0f83ba150000                   jae        0x7f179fe76430
01076 8d6b10                         lea        ebp, [rbx + 0x10]
01079 4c63d3                         movsxd     r10, ebx
0107c 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01084 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
0108b 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
01092 0f8d7cf5ffff                   jge        0x7f179fe74414
01098 4d2bc2                         sub        r8, r10
0109b 4c63dd                         movsxd     r11, ebp
0109e 4f8d1403                       lea        r10, [r11 + r8]
010a2 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
010aa 0f83ec150000                   jae        0x7f179fe7649c
010b0 4c8bd1                         mov        r10, rcx
010b3 4d2bd3                         sub        r10, r11
010b6 4983c20f                       add        r10, 0xf
010ba 4983e2f0                       and        r10, 0xfffffffffffffff0
010be 458bd2                         mov        r10d, r10d
010c1 458d5c1a10                     lea        r11d, [r10 + rbx + 0x10]
010c6 4d63d3                         movsxd     r10, r11d
010c9 4f8d5c02f0                     lea        r11, [r10 + r8 - 0x10]
010ce 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
010d6 0f83c0150000                   jae        0x7f179fe7649c
010dc 3bac2490000000                 cmp        ebp, dword ptr [rsp + 0x90]
010e3 0f83b3150000                   jae        0x7f179fe7649c
010e9 4983c2f0                       add        r10, -0x10
010ed 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
010f5 0f83a1150000                   jae        0x7f179fe7649c
010fb 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
01103 4181faf0ffff7f                 cmp        r10d, 0x7ffffff0
0110a 0f8fd4150000                   jg         0x7f179fe764e4
01110 442bf3                         sub        r14d, ebx
01113 83c320                         add        ebx, 0x20
01116 6690                           nop        
01118 458d1c2e                       lea        r11d, [r14 + rbp]
0111c 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
01124 c4817a6f441d08                 vmovdqu    xmm0, xmmword ptr [r13 + r11 + 8]
0112b 448bd5                         mov        r10d, ebp
0112e c4817a7f441508                 vmovdqu    xmmword ptr [r13 + r10 + 8], xmm0
01135 83c510                         add        ebp, 0x10
01138 3beb                           cmp        ebp, ebx
0113a 7cdc                           jl         0x7f179fe74f18
0113c 4881c110ffffff                 add        rcx, -0xf0
01143 4881f900000080                 cmp        rcx, -0x80000000
0114a 49c7c200000080                 mov        r10, 0xffffffff80000000
01151 490f4cca                       cmovl      rcx, r10
01155 448bc9                         mov        r9d, ecx
01158 413be9                         cmp        ebp, r9d
0115b 0f8d39010000                   jge        0x7f179fe7509a
01161 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
01168 0f1f840000000000               nop        dword ptr [rax + rax]
01170 458d042e                       lea        r8d, [r14 + rbp]
01174 448bd5                         mov        r10d, ebp
01177 4963ca                         movsxd     rcx, r10d
0117a 458bd8                         mov        r11d, r8d
0117d c4a17a6f441b08                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 8]
01184 4d63d8                         movsxd     r11, r8d
01187 448bd5                         mov        r10d, ebp
0118a c4a17a7f441308                 vmovdqu    xmmword ptr [rbx + r10 + 8], xmm0
01191 c4a17a6f441b18                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x18]
01198 c5fa7f440b18                   vmovdqu    xmmword ptr [rbx + rcx + 0x18], xmm0
0119e c4a17a6f441b28                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x28]
011a5 c5fa7f440b28                   vmovdqu    xmmword ptr [rbx + rcx + 0x28], xmm0
011ab c4a17a6f441b38                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x38]
011b2 c5fa7f440b38                   vmovdqu    xmmword ptr [rbx + rcx + 0x38], xmm0
011b8 c4a17a6f441b48                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x48]
011bf c5fa7f440b48                   vmovdqu    xmmword ptr [rbx + rcx + 0x48], xmm0
011c5 c4a17a6f441b58                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x58]
011cc c5fa7f440b58                   vmovdqu    xmmword ptr [rbx + rcx + 0x58], xmm0
011d2 c4a17a6f441b68                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x68]
011d9 c5fa7f440b68                   vmovdqu    xmmword ptr [rbx + rcx + 0x68], xmm0
011df c4a17a6f441b78                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x78]
011e6 c5fa7f440b78                   vmovdqu    xmmword ptr [rbx + rcx + 0x78], xmm0
011ec c4a17a6f841b88000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x88]
011f6 c5fa7f840b88000000             vmovdqu    xmmword ptr [rbx + rcx + 0x88], xmm0
011ff c4a17a6f841b98000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x98]
01209 c5fa7f840b98000000             vmovdqu    xmmword ptr [rbx + rcx + 0x98], xmm0
01212 c4a17a6f841ba8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xa8]
0121c c5fa7f840ba8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xa8], xmm0
01225 c4a17a6f841bb8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xb8]
0122f c5fa7f840bb8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xb8], xmm0
01238 c4a17a6f841bc8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xc8]
01242 c5fa7f840bc8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xc8], xmm0
0124b c4a17a6f841bd8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xd8]
01255 c5fa7f840bd8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xd8], xmm0
0125e c4a17a6f841be8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xe8]
01268 c5fa7f840be8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xe8], xmm0
01271 c4a17a6f841bf8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xf8]
0127b c5fa7f840bf8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xf8], xmm0
01284 81c500010000                   add        ebp, 0x100
0128a 413be9                         cmp        ebp, r9d
0128d 0f8cddfeffff                   jl         0x7f179fe74f70
01293 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
0129a 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
012a1 0f8d6df3ffff                   jge        0x7f179fe74414
012a7 90                             nop        
012a8 458d142e                       lea        r10d, [r14 + rbp]
012ac 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
012b3 c4a17a6f441308                 vmovdqu    xmm0, xmmword ptr [rbx + r10 + 8]
012ba 448bdd                         mov        r11d, ebp
012bd c4a17a7f441b08                 vmovdqu    xmmword ptr [rbx + r11 + 8], xmm0
012c4 83c510                         add        ebp, 0x10
012c7 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
012ce 7cd8                           jl         0x7f179fe750a8
012d0 e93ff3ffff                     jmp        0x7f179fe74414
012d5 bee4ffffff                     mov        esi, 0xffffffe4
012da 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
012df 448b1c24                       mov        r11d, dword ptr [rsp]
012e3 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
012eb 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
012f0 4c891c24                       mov        qword ptr [rsp], r11
012f4 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
012f9 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01301 8944240c                       mov        dword ptr [rsp + 0xc], eax
01305 48ff742420                     push       qword ptr [rsp + 0x20]
0130a 488f442418                     pop        qword ptr [rsp + 0x18]
0130f 48ff742428                     push       qword ptr [rsp + 0x28]
01314 488f442420                     pop        qword ptr [rsp + 0x20]
01319 48ff742430                     push       qword ptr [rsp + 0x30]
0131e 488f442428                     pop        qword ptr [rsp + 0x28]
01323 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01327 48894424f8                     mov        qword ptr [rsp - 8], rax
0132c 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01330 89442440                       mov        dword ptr [rsp + 0x40], eax
01334 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01339 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
0133e 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01343 90                             nop        
01344 c5f877                         vzeroupper 
01347 e814e5b4ff                     call       0x7f179f9c3660
0134c 0f1f840044140002               nop        dword ptr [rax + rax + 0x2001444]
01354 bee4ffffff                     mov        esi, 0xffffffe4
01359 498beb                         mov        rbp, r11
0135c 448b0424                       mov        r8d, dword ptr [rsp]
01360 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
01368 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0136d 4c891c24                       mov        qword ptr [rsp], r11
01371 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01376 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
0137e 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01383 48ff742420                     push       qword ptr [rsp + 0x20]
01388 488f442418                     pop        qword ptr [rsp + 0x18]
0138d 48ff742428                     push       qword ptr [rsp + 0x28]
01392 488f442420                     pop        qword ptr [rsp + 0x20]
01397 48ff742430                     push       qword ptr [rsp + 0x30]
0139c 488f442428                     pop        qword ptr [rsp + 0x28]
013a1 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
013a5 48894424f8                     mov        qword ptr [rsp - 8], rax
013aa 8b442448                       mov        eax, dword ptr [rsp + 0x48]
013ae 89442440                       mov        dword ptr [rsp + 0x40], eax
013b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013b7 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
013bc 8944244c                       mov        dword ptr [rsp + 0x4c], eax
013c0 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
013c6 6690                           nop        
013c8 c5f877                         vzeroupper 
013cb e890e4b4ff                     call       0x7f179f9c3660
013d0 0f1f8400c8140003               nop        dword ptr [rax + rax + 0x30014c8]
013d8 bee4ffffff                     mov        esi, 0xffffffe4
013dd 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
013e2 448b1424                       mov        r10d, dword ptr [rsp]
013e6 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
013ee 4c8b542408                     mov        r10, qword ptr [rsp + 8]
013f3 4c891424                       mov        qword ptr [rsp], r10
013f7 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
013fc 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01404 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01408 48ff742420                     push       qword ptr [rsp + 0x20]
0140d 488f442418                     pop        qword ptr [rsp + 0x18]
01412 48ff742428                     push       qword ptr [rsp + 0x28]
01417 488f442420                     pop        qword ptr [rsp + 0x20]
0141c 48ff742430                     push       qword ptr [rsp + 0x30]
01421 488f442428                     pop        qword ptr [rsp + 0x28]
01426 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
0142b 4489742444                     mov        dword ptr [rsp + 0x44], r14d
01430 c5f877                         vzeroupper 
01433 e828e4b4ff                     call       0x7f179f9c3660
01438 0f1f840030150004               nop        dword ptr [rax + rax + 0x4001530]
01440 bee4ffffff                     mov        esi, 0xffffffe4
01445 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0144a 448b1c24                       mov        r11d, dword ptr [rsp]
0144e 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01456 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0145b 4c891424                       mov        qword ptr [rsp], r10
0145f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01464 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
0146c 48ff742420                     push       qword ptr [rsp + 0x20]
01471 488f442418                     pop        qword ptr [rsp + 0x18]
01476 48ff742428                     push       qword ptr [rsp + 0x28]
0147b 488f442420                     pop        qword ptr [rsp + 0x20]
01480 48ff742430                     push       qword ptr [rsp + 0x30]
01485 488f442428                     pop        qword ptr [rsp + 0x28]
0148a 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
0148f 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01493 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
01499 666690                         nop        
0149c c5f877                         vzeroupper 
0149f e8bce3b4ff                     call       0x7f179f9c3660
014a4 0f1f84009c150005               nop        dword ptr [rax + rax + 0x500159c]
014ac be45ffffff                     mov        esi, 0xffffff45
014b1 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
014b9 4489ac24e8000000               mov        dword ptr [rsp + 0xe8], r13d
014c1 666690                         nop        
014c4 c5f877                         vzeroupper 
014c7 e894e3b4ff                     call       0x7f179f9c3660
014cc 0f1f8400c4150006               nop        dword ptr [rax + rax + 0x60015c4]
014d4 be45ffffff                     mov        esi, 0xffffff45
014d9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
014de 448b1c24                       mov        r11d, dword ptr [rsp]
014e2 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
014ea 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
014ef 4c891c24                       mov        qword ptr [rsp], r11
014f3 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
014f8 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
01500 8944240c                       mov        dword ptr [rsp + 0xc], eax
01504 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01509 48ff742420                     push       qword ptr [rsp + 0x20]
0150e 488f442418                     pop        qword ptr [rsp + 0x18]
01513 48894424f8                     mov        qword ptr [rsp - 8], rax
01518 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0151c 89442414                       mov        dword ptr [rsp + 0x14], eax
01520 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01525 48ff742428                     push       qword ptr [rsp + 0x28]
0152a 488f442420                     pop        qword ptr [rsp + 0x20]
0152f 48ff742430                     push       qword ptr [rsp + 0x30]
01534 488f442428                     pop        qword ptr [rsp + 0x28]
01539 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0153d 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
01542 6690                           nop        
01544 c5f877                         vzeroupper 
01547 e814e3b4ff                     call       0x7f179f9c3660
0154c 0f1f840044160007               nop        dword ptr [rax + rax + 0x7001644]
01554 493beb                         cmp        rbp, r11
01557 bdffffffff                     mov        ebp, 0xffffffff
0155c 7c08                           jl         0x7f179fe75366
0155e 400f95c5                       setne      bpl
01562 400fb6ed                       movzx      ebp, bpl
01566 be45ffffff                     mov        esi, 0xffffff45
0156b 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01570 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
01578 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0157d 44894c2404                     mov        dword ptr [rsp + 4], r9d
01582 89442414                       mov        dword ptr [rsp + 0x14], eax
01586 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0158b 48894424f8                     mov        qword ptr [rsp - 8], rax
01590 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01594 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01598 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0159d 895c2444                       mov        dword ptr [rsp + 0x44], ebx
015a1 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
015a6 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
015ab 90                             nop        
015ac c5f877                         vzeroupper 
015af e8ace2b4ff                     call       0x7f179f9c3660
015b4 0f1f8400ac160008               nop        dword ptr [rax + rax + 0x80016ac]
015bc be45ffffff                     mov        esi, 0xffffff45
015c1 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
015c6 448b1c24                       mov        r11d, dword ptr [rsp]
015ca 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
015d2 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
015d7 4c891c24                       mov        qword ptr [rsp], r11
015db 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
015e0 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
015e8 8944240c                       mov        dword ptr [rsp + 0xc], eax
015ec 4489542410                     mov        dword ptr [rsp + 0x10], r10d
015f1 48ff742420                     push       qword ptr [rsp + 0x20]
015f6 488f442418                     pop        qword ptr [rsp + 0x18]
015fb 48ff742428                     push       qword ptr [rsp + 0x28]
01600 488f442420                     pop        qword ptr [rsp + 0x20]
01605 48ff742430                     push       qword ptr [rsp + 0x30]
0160a 488f442428                     pop        qword ptr [rsp + 0x28]
0160f 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01613 48894424f8                     mov        qword ptr [rsp - 8], rax
01618 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0161c 89442440                       mov        dword ptr [rsp + 0x40], eax
01620 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01625 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
0162a 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0162f 90                             nop        
01630 c5f877                         vzeroupper 
01633 e828e2b4ff                     call       0x7f179f9c3660
01638 0f1f840030170009               nop        dword ptr [rax + rax + 0x9001730]
01640 be45ffffff                     mov        esi, 0xffffff45
01645 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0164a 448b1c24                       mov        r11d, dword ptr [rsp]
0164e 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01656 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0165b 4c891c24                       mov        qword ptr [rsp], r11
0165f 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01664 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
0166c 8944240c                       mov        dword ptr [rsp + 0xc], eax
01670 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01675 48ff742420                     push       qword ptr [rsp + 0x20]
0167a 488f442418                     pop        qword ptr [rsp + 0x18]
0167f 48ff742428                     push       qword ptr [rsp + 0x28]
01684 488f442420                     pop        qword ptr [rsp + 0x20]
01689 48ff742430                     push       qword ptr [rsp + 0x30]
0168e 488f442428                     pop        qword ptr [rsp + 0x28]
01693 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01697 48894424f8                     mov        qword ptr [rsp - 8], rax
0169c 8b442448                       mov        eax, dword ptr [rsp + 0x48]
016a0 89442440                       mov        dword ptr [rsp + 0x40], eax
016a4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016a9 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
016ae 6690                           nop        
016b0 c5f877                         vzeroupper 
016b3 e8a8e1b4ff                     call       0x7f179f9c3660
016b8 0f1f8400b017000a               nop        dword ptr [rax + rax + 0xa0017b0]
016c0 4c8b4c2428                     mov        r9, qword ptr [rsp + 0x28]
016c5 4d3bc1                         cmp        r8, r9
016c8 bdffffffff                     mov        ebp, 0xffffffff
016cd 7c08                           jl         0x7f179fe754d7
016cf 400f95c5                       setne      bpl
016d3 400fb6ed                       movzx      ebp, bpl
016d7 be45ffffff                     mov        esi, 0xffffff45
016dc 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
016e1 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
016e9 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
016ee 44894c2404                     mov        dword ptr [rsp + 4], r9d
016f3 89442414                       mov        dword ptr [rsp + 0x14], eax
016f7 4489542418                     mov        dword ptr [rsp + 0x18], r10d
016fc 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01700 48894424f8                     mov        qword ptr [rsp - 8], rax
01705 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01709 89442444                       mov        dword ptr [rsp + 0x44], eax
0170d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01712 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
01717 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
0171c c5f877                         vzeroupper 
0171f e83ce1b4ff                     call       0x7f179f9c3660
01724 0f1f84001c18000b               nop        dword ptr [rax + rax + 0xb00181c]
0172c 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
01731 493be8                         cmp        rbp, r8
01734 bdffffffff                     mov        ebp, 0xffffffff
01739 7c08                           jl         0x7f179fe75543
0173b 400f95c5                       setne      bpl
0173f 400fb6ed                       movzx      ebp, bpl
01743 be45ffffff                     mov        esi, 0xffffff45
01748 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
0174d 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
01755 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0175a 44894c2404                     mov        dword ptr [rsp + 4], r9d
0175f 89442414                       mov        dword ptr [rsp + 0x14], eax
01763 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01768 895c2440                       mov        dword ptr [rsp + 0x40], ebx
0176c 48894424f8                     mov        qword ptr [rsp - 8], rax
01771 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01775 89442444                       mov        dword ptr [rsp + 0x44], eax
01779 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0177e 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
01783 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
01788 c5f877                         vzeroupper 
0178b e8d0e0b4ff                     call       0x7f179f9c3660
01790 0f1f84008818000c               nop        dword ptr [rax + rax + 0xc001888]
01798 bee4ffffff                     mov        esi, 0xffffffe4
0179d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
017a2 448b1424                       mov        r10d, dword ptr [rsp]
017a6 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
017ae 4c8b542408                     mov        r10, qword ptr [rsp + 8]
017b3 4c891424                       mov        qword ptr [rsp], r10
017b7 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
017bc 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
017c4 48ff742420                     push       qword ptr [rsp + 0x20]
017c9 488f442418                     pop        qword ptr [rsp + 0x18]
017ce 48ff742428                     push       qword ptr [rsp + 0x28]
017d3 488f442420                     pop        qword ptr [rsp + 0x20]
017d8 48ff742430                     push       qword ptr [rsp + 0x30]
017dd 488f442428                     pop        qword ptr [rsp + 0x28]
017e2 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
017e7 895c2444                       mov        dword ptr [rsp + 0x44], ebx
017eb 895c2450                       mov        dword ptr [rsp + 0x50], ebx
017ef 4489742458                     mov        dword ptr [rsp + 0x58], r14d
017f4 c5f877                         vzeroupper 
017f7 e864e0b4ff                     call       0x7f179f9c3660
017fc 0f1f8400f418000d               nop        dword ptr [rax + rax + 0xd0018f4]
01804 bee4ffffff                     mov        esi, 0xffffffe4
01809 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0180e 448b1c24                       mov        r11d, dword ptr [rsp]
01812 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0181a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0181f 4c891424                       mov        qword ptr [rsp], r10
01823 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01828 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01830 48ff742420                     push       qword ptr [rsp + 0x20]
01835 488f442418                     pop        qword ptr [rsp + 0x18]
0183a 48ff742428                     push       qword ptr [rsp + 0x28]
0183f 488f442420                     pop        qword ptr [rsp + 0x20]
01844 48ff742430                     push       qword ptr [rsp + 0x30]
01849 488f442428                     pop        qword ptr [rsp + 0x28]
0184e 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01853 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01857 4489742448                     mov        dword ptr [rsp + 0x48], r14d
0185c 4c89442450                     mov        qword ptr [rsp + 0x50], r8
01861 895c2458                       mov        dword ptr [rsp + 0x58], ebx
01865 666690                         nop        
01868 c5f877                         vzeroupper 
0186b e8f0dfb4ff                     call       0x7f179f9c3660
01870 0f1f84006819000e               nop        dword ptr [rax + rax + 0xe001968]
01878 4183c608                       add        r14d, 8
0187c be6effffff                     mov        esi, 0xffffff6e
01881 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01886 8b0c24                         mov        ecx, dword ptr [rsp]
01889 898c24e0000000                 mov        dword ptr [rsp + 0xe0], ecx
01890 4c8b442408                     mov        r8, qword ptr [rsp + 8]
01895 4c890424                       mov        qword ptr [rsp], r8
01899 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0189e 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
018a6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
018ab 48ff742420                     push       qword ptr [rsp + 0x20]
018b0 488f442418                     pop        qword ptr [rsp + 0x18]
018b5 48ff742428                     push       qword ptr [rsp + 0x28]
018ba 488f442420                     pop        qword ptr [rsp + 0x20]
018bf 48ff742430                     push       qword ptr [rsp + 0x30]
018c4 488f442428                     pop        qword ptr [rsp + 0x28]
018c9 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
018ce 48894424f8                     mov        qword ptr [rsp - 8], rax
018d3 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
018da 89442440                       mov        dword ptr [rsp + 0x40], eax
018de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e3 4489742448                     mov        dword ptr [rsp + 0x48], r14d
018e8 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
018ed 666690                         nop        
018f0 c5f877                         vzeroupper 
018f3 e868dfb4ff                     call       0x7f179f9c3660
018f8 0f1f8400f019000f               nop        dword ptr [rax + rax + 0xf0019f0]
01900 4183c608                       add        r14d, 8
01904 be66ffffff                     mov        esi, 0xffffff66
01909 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0190e 8b0c24                         mov        ecx, dword ptr [rsp]
01911 898c24e0000000                 mov        dword ptr [rsp + 0xe0], ecx
01918 4c8b442408                     mov        r8, qword ptr [rsp + 8]
0191d 4c890424                       mov        qword ptr [rsp], r8
01921 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01926 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
0192e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01933 48ff742420                     push       qword ptr [rsp + 0x20]
01938 488f442418                     pop        qword ptr [rsp + 0x18]
0193d 48ff742428                     push       qword ptr [rsp + 0x28]
01942 488f442420                     pop        qword ptr [rsp + 0x20]
01947 48ff742430                     push       qword ptr [rsp + 0x30]
0194c 488f442428                     pop        qword ptr [rsp + 0x28]
01951 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01956 4489742448                     mov        dword ptr [rsp + 0x48], r14d
0195b 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01960 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
01965 666690                         nop        
01968 c5f877                         vzeroupper 
0196b e8f0deb4ff                     call       0x7f179f9c3660
01970 0f1f8400681a0010               nop        dword ptr [rax + rax + 0x10001a68]
01978 418be9                         mov        ebp, r9d
0197b e98becffff                     jmp        0x7f179fe7440b
01980 beccffffff                     mov        esi, 0xffffffcc
01985 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0198a 448b1c24                       mov        r11d, dword ptr [rsp]
0198e 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01996 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0199b 4c891424                       mov        qword ptr [rsp], r10
0199f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
019a4 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
019ac 48ff742420                     push       qword ptr [rsp + 0x20]
019b1 488f442418                     pop        qword ptr [rsp + 0x18]
019b6 48ff742428                     push       qword ptr [rsp + 0x28]
019bb 488f442420                     pop        qword ptr [rsp + 0x20]
019c0 48ff742430                     push       qword ptr [rsp + 0x30]
019c5 488f442428                     pop        qword ptr [rsp + 0x28]
019ca 4489742444                     mov        dword ptr [rsp + 0x44], r14d
019cf 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
019d3 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
019d8 c5f877                         vzeroupper 
019db e880deb4ff                     call       0x7f179f9c3660
019e0 0f1f8400d81a0011               nop        dword ptr [rax + rax + 0x11001ad8]
019e8 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
019ed 448bc0                         mov        r8d, eax
019f0 4403442440                     add        r8d, dword ptr [rsp + 0x40]
019f5 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
019fd 4f8b440108                     mov        r8, qword ptr [r9 + r8 + 8]
01a02 4f89441908                     mov        qword ptr [r9 + r11 + 8], r8
01a07 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01a0c 4183c308                       add        r11d, 8
01a10 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01a15 453bda                         cmp        r11d, r10d
01a18 7cce                           jl         0x7f179fe757e8
01a1a 443bdf                         cmp        r11d, edi
01a1d 0f8da6000000                   jge        0x7f179fe758c9
01a23 458bd3                         mov        r10d, r11d
01a26 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01a2b 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
01a32 0f1f8000000000                 nop        dword ptr [rax]
01a39 0f1f8000000000                 nop        dword ptr [rax]
01a40 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01a45 4963ca                         movsxd     rcx, r10d
01a48 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01a4d 448bc8                         mov        r9d, eax
01a50 44034c2440                     add        r9d, dword ptr [rsp + 0x40]
01a55 458bd1                         mov        r10d, r9d
01a58 4e8b4c0b08                     mov        r9, qword ptr [rbx + r9 + 8]
01a5d 4e894c1b08                     mov        qword ptr [rbx + r11 + 8], r9
01a62 4d63da                         movsxd     r11, r10d
01a65 4e8b541b10                     mov        r10, qword ptr [rbx + r11 + 0x10]
01a6a 4c89540b10                     mov        qword ptr [rbx + rcx + 0x10], r10
01a6f 4e8b541b18                     mov        r10, qword ptr [rbx + r11 + 0x18]
01a74 4c89540b18                     mov        qword ptr [rbx + rcx + 0x18], r10
01a79 4e8b541b20                     mov        r10, qword ptr [rbx + r11 + 0x20]
01a7e 4c89540b20                     mov        qword ptr [rbx + rcx + 0x20], r10
01a83 4e8b541b28                     mov        r10, qword ptr [rbx + r11 + 0x28]
01a88 4c89540b28                     mov        qword ptr [rbx + rcx + 0x28], r10
01a8d 4e8b541b30                     mov        r10, qword ptr [rbx + r11 + 0x30]
01a92 4c89540b30                     mov        qword ptr [rbx + rcx + 0x30], r10
01a97 4e8b541b38                     mov        r10, qword ptr [rbx + r11 + 0x38]
01a9c 4c89540b38                     mov        qword ptr [rbx + rcx + 0x38], r10
01aa1 4e8b541b40                     mov        r10, qword ptr [rbx + r11 + 0x40]
01aa6 4c89540b40                     mov        qword ptr [rbx + rcx + 0x40], r10
01aab 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01ab0 4183c240                       add        r10d, 0x40
01ab4 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01ab9 443bd7                         cmp        r10d, edi
01abc 0f8c7effffff                   jl         0x7f179fe75840
01ac2 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
01ac9 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01ace 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
01ad6 0f8d38ebffff                   jge        0x7f179fe74414
01adc 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01ae1 458bc3                         mov        r8d, r11d
01ae4 468d1c00                       lea        r11d, [rax + r8]
01ae8 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
01af0 4f8b5c1908                     mov        r11, qword ptr [r9 + r11 + 8]
01af5 458bd0                         mov        r10d, r8d
01af8 4f895c1108                     mov        qword ptr [r9 + r10 + 8], r11
01afd 458d5808                       lea        r11d, [r8 + 8]
01b01 458bc3                         mov        r8d, r11d
01b04 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
01b0c 7cd6                           jl         0x7f179fe758e4
01b0e e901ebffff                     jmp        0x7f179fe74414
01b13 bee4ffffff                     mov        esi, 0xffffffe4
01b18 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01b1d 448b0424                       mov        r8d, dword ptr [rsp]
01b21 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
01b29 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01b2e 4c891c24                       mov        qword ptr [rsp], r11
01b32 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01b37 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
01b3f 8944240c                       mov        dword ptr [rsp + 0xc], eax
01b43 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01b48 48ff742420                     push       qword ptr [rsp + 0x20]
01b4d 488f442418                     pop        qword ptr [rsp + 0x18]
01b52 48894424f8                     mov        qword ptr [rsp - 8], rax
01b57 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01b5b 89442414                       mov        dword ptr [rsp + 0x14], eax
01b5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b64 48ff742428                     push       qword ptr [rsp + 0x28]
01b69 488f442420                     pop        qword ptr [rsp + 0x20]
01b6e 48ff742430                     push       qword ptr [rsp + 0x30]
01b73 488f442428                     pop        qword ptr [rsp + 0x28]
01b78 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01b7c 4489742440                     mov        dword ptr [rsp + 0x40], r14d
01b81 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
01b86 6690                           nop        
01b88 c5f877                         vzeroupper 
01b8b e8d0dcb4ff                     call       0x7f179f9c3660
01b90 0f1f8400881c0012               nop        dword ptr [rax + rax + 0x12001c88]
01b98 4585f6                         test       r14d, r14d
01b9b 0f848b0b0000                   je         0x7f179fe7652c
01ba1 8b2c24                         mov        ebp, dword ptr [rsp]
01ba4 898424a8000000                 mov        dword ptr [rsp + 0xa8], eax
01bab 4533c0                         xor        r8d, r8d
01bae e938f0ffff                     jmp        0x7f179fe749eb
01bb3 bee4ffffff                     mov        esi, 0xffffffe4
01bb8 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01bbd 448b1c24                       mov        r11d, dword ptr [rsp]
01bc1 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01bc9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01bce 4c891424                       mov        qword ptr [rsp], r10
01bd2 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01bd7 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01bdf 48ff742420                     push       qword ptr [rsp + 0x20]
01be4 488f442410                     pop        qword ptr [rsp + 0x10]
01be9 48ff742428                     push       qword ptr [rsp + 0x28]
01bee 488f442420                     pop        qword ptr [rsp + 0x20]
01bf3 48ff742430                     push       qword ptr [rsp + 0x30]
01bf8 488f442428                     pop        qword ptr [rsp + 0x28]
01bfd 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
01c02 895c2450                       mov        dword ptr [rsp + 0x50], ebx
01c06 4489742458                     mov        dword ptr [rsp + 0x58], r14d
01c0b 90                             nop        
01c0c c5f877                         vzeroupper 
01c0f e84cdcb4ff                     call       0x7f179f9c3660
01c14 0f1f84000c1d0013               nop        dword ptr [rax + rax + 0x13001d0c]
01c1c bee4ffffff                     mov        esi, 0xffffffe4
01c21 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01c26 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01c2e 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01c33 44895c2404                     mov        dword ptr [rsp + 4], r11d
01c38 48ff742420                     push       qword ptr [rsp + 0x20]
01c3d 488f442418                     pop        qword ptr [rsp + 0x18]
01c42 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01c47 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01c4c 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01c51 895c2458                       mov        dword ptr [rsp + 0x58], ebx
01c55 666690                         nop        
01c58 c5f877                         vzeroupper 
01c5b e800dcb4ff                     call       0x7f179f9c3660
01c60 0f1f8400581d0014               nop        dword ptr [rax + rax + 0x14001d58]
01c68 418d6e01                       lea        ebp, [r14 + 1]
01c6c bee4ffffff                     mov        esi, 0xffffffe4
01c71 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01c76 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01c7e 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01c83 44895c2404                     mov        dword ptr [rsp + 4], r11d
01c88 48ff742420                     push       qword ptr [rsp + 0x20]
01c8d 488f442418                     pop        qword ptr [rsp + 0x18]
01c92 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01c96 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01c9b 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01ca0 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01ca5 666690                         nop        
01ca8 c5f877                         vzeroupper 
01cab e8b0dbb4ff                     call       0x7f179f9c3660
01cb0 0f1f8400a81d0015               nop        dword ptr [rax + rax + 0x15001da8]
01cb8 bee4ffffff                     mov        esi, 0xffffffe4
01cbd 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01cc2 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01cca 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01ccf 44895c2404                     mov        dword ptr [rsp + 4], r11d
01cd4 48ff742420                     push       qword ptr [rsp + 0x20]
01cd9 488f442418                     pop        qword ptr [rsp + 0x18]
01cde 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01ce2 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01ce7 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01cec 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01cf1 666690                         nop        
01cf4 c5f877                         vzeroupper 
01cf7 e864dbb4ff                     call       0x7f179f9c3660
01cfc 0f1f8400f41d0016               nop        dword ptr [rax + rax + 0x16001df4]
01d04 bee4ffffff                     mov        esi, 0xffffffe4
01d09 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01d0e 448b1c24                       mov        r11d, dword ptr [rsp]
01d12 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01d1a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01d1f 4c891424                       mov        qword ptr [rsp], r10
01d23 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01d28 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01d30 48ff742420                     push       qword ptr [rsp + 0x20]
01d35 488f442410                     pop        qword ptr [rsp + 0x10]
01d3a 48ff742428                     push       qword ptr [rsp + 0x28]
01d3f 488f442420                     pop        qword ptr [rsp + 0x20]
01d44 48ff742430                     push       qword ptr [rsp + 0x30]
01d49 488f442428                     pop        qword ptr [rsp + 0x28]
01d4e 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01d52 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
01d57 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01d5c 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01d61 666690                         nop        
01d64 c5f877                         vzeroupper 
01d67 e8f4dab4ff                     call       0x7f179f9c3660
01d6c 0f1f8400641e0017               nop        dword ptr [rax + rax + 0x17001e64]
01d74 bee4ffffff                     mov        esi, 0xffffffe4
01d79 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01d7e 448b1424                       mov        r10d, dword ptr [rsp]
01d82 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01d8a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01d8f 4c891424                       mov        qword ptr [rsp], r10
01d93 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01d98 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01da0 48ff742420                     push       qword ptr [rsp + 0x20]
01da5 488f442410                     pop        qword ptr [rsp + 0x10]
01daa 48ff742428                     push       qword ptr [rsp + 0x28]
01daf 488f442420                     pop        qword ptr [rsp + 0x20]
01db4 48ff742430                     push       qword ptr [rsp + 0x30]
01db9 488f442428                     pop        qword ptr [rsp + 0x28]
01dbe 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01dc2 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
01dc7 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
01dcc 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01dd1 666690                         nop        
01dd4 c5f877                         vzeroupper 
01dd7 e884dab4ff                     call       0x7f179f9c3660
01ddc 0f1f8400d41e0018               nop        dword ptr [rax + rax + 0x18001ed4]
01de4 bee4ffffff                     mov        esi, 0xffffffe4
01de9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01dee 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01df6 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01dfb 4489542404                     mov        dword ptr [rsp + 4], r10d
01e00 48ff742420                     push       qword ptr [rsp + 0x20]
01e05 488f442418                     pop        qword ptr [rsp + 0x18]
01e0a 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01e0e 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
01e13 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01e18 c5f877                         vzeroupper 
01e1b e840dab4ff                     call       0x7f179f9c3660
01e20 0f1f8400181f0019               nop        dword ptr [rax + rax + 0x19001f18]
01e28 beccffffff                     mov        esi, 0xffffffcc
01e2d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01e32 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01e3a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01e3f 44895c2404                     mov        dword ptr [rsp + 4], r11d
01e44 48ff742420                     push       qword ptr [rsp + 0x20]
01e49 488f442418                     pop        qword ptr [rsp + 0x18]
01e4e 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01e52 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01e57 90                             nop        
01e58 c5f877                         vzeroupper 
01e5b e800dab4ff                     call       0x7f179f9c3660
01e60 0f1f8400581f001a               nop        dword ptr [rax + rax + 0x1a001f58]
01e68 be6effffff                     mov        esi, 0xffffff6e
01e6d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01e72 448b1c24                       mov        r11d, dword ptr [rsp]
01e76 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01e7e 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01e83 4c891c24                       mov        qword ptr [rsp], r11
01e87 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01e8c 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01e94 8944240c                       mov        dword ptr [rsp + 0xc], eax
01e98 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01e9d 48ff742420                     push       qword ptr [rsp + 0x20]
01ea2 488f442418                     pop        qword ptr [rsp + 0x18]
01ea7 48894424f8                     mov        qword ptr [rsp - 8], rax
01eac 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01eb0 89442414                       mov        dword ptr [rsp + 0x14], eax
01eb4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eb9 48ff742428                     push       qword ptr [rsp + 0x28]
01ebe 488f442420                     pop        qword ptr [rsp + 0x20]
01ec3 48ff742430                     push       qword ptr [rsp + 0x30]
01ec8 488f442428                     pop        qword ptr [rsp + 0x28]
01ecd 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01ed1 4489742440                     mov        dword ptr [rsp + 0x40], r14d
01ed6 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01edb 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
01ee0 c5f877                         vzeroupper 
01ee3 e878d9b4ff                     call       0x7f179f9c3660
01ee8 0f1f8400e01f001b               nop        dword ptr [rax + rax + 0x1b001fe0]
01ef0 be45ffffff                     mov        esi, 0xffffff45
01ef5 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01efa 448b0424                       mov        r8d, dword ptr [rsp]
01efe 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
01f06 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01f0b 4c891c24                       mov        qword ptr [rsp], r11
01f0f 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01f14 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
01f1c 8944240c                       mov        dword ptr [rsp + 0xc], eax
01f20 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01f25 48ff742420                     push       qword ptr [rsp + 0x20]
01f2a 488f442418                     pop        qword ptr [rsp + 0x18]
01f2f 48894424f8                     mov        qword ptr [rsp - 8], rax
01f34 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01f38 89442414                       mov        dword ptr [rsp + 0x14], eax
01f3c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f41 48ff742428                     push       qword ptr [rsp + 0x28]
01f46 488f442420                     pop        qword ptr [rsp + 0x20]
01f4b 48ff742430                     push       qword ptr [rsp + 0x30]
01f50 488f442428                     pop        qword ptr [rsp + 0x28]
01f55 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01f59 4489742440                     mov        dword ptr [rsp + 0x40], r14d
01f5e 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
01f63 90                             nop        
01f64 c5f877                         vzeroupper 
01f67 e8f4d8b4ff                     call       0x7f179f9c3660
01f6c 0f1f84006420001c               nop        dword ptr [rax + rax + 0x1c002064]
01f74 be3dffffff                     mov        esi, 0xffffff3d
01f79 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01f7e 448b1c24                       mov        r11d, dword ptr [rsp]
01f82 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01f8a 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01f8f 4c891c24                       mov        qword ptr [rsp], r11
01f93 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01f98 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01fa0 8944240c                       mov        dword ptr [rsp + 0xc], eax
01fa4 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01fa9 48ff742420                     push       qword ptr [rsp + 0x20]
01fae 488f442418                     pop        qword ptr [rsp + 0x18]
01fb3 48894424f8                     mov        qword ptr [rsp - 8], rax
01fb8 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01fbc 89442414                       mov        dword ptr [rsp + 0x14], eax
01fc0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fc5 48ff742428                     push       qword ptr [rsp + 0x28]
01fca 488f442420                     pop        qword ptr [rsp + 0x20]
01fcf 48ff742430                     push       qword ptr [rsp + 0x30]
01fd4 488f442428                     pop        qword ptr [rsp + 0x28]
01fd9 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01fdd 4489742440                     mov        dword ptr [rsp + 0x40], r14d
01fe2 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
01fe7 90                             nop        
01fe8 c5f877                         vzeroupper 
01feb e870d8b4ff                     call       0x7f179f9c3660
01ff0 0f1f8400e820001d               nop        dword ptr [rax + rax + 0x1d0020e8]
01ff8 bee4ffffff                     mov        esi, 0xffffffe4
01ffd 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02002 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0200a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0200f 44895c2404                     mov        dword ptr [rsp + 4], r11d
02014 48ff742420                     push       qword ptr [rsp + 0x20]
02019 488f442418                     pop        qword ptr [rsp + 0x18]
0201e 895c2440                       mov        dword ptr [rsp + 0x40], ebx
02022 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
02027 90                             nop        
02028 c5f877                         vzeroupper 
0202b e830d8b4ff                     call       0x7f179f9c3660
02030 0f1f84002821001e               nop        dword ptr [rax + rax + 0x1e002128]
02038 bee4ffffff                     mov        esi, 0xffffffe4
0203d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02042 44895c2404                     mov        dword ptr [rsp + 4], r11d
02047 48ff742420                     push       qword ptr [rsp + 0x20]
0204c 488f442418                     pop        qword ptr [rsp + 0x18]
02051 895c2440                       mov        dword ptr [rsp + 0x40], ebx
02055 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
0205a 6690                           nop        
0205c c5f877                         vzeroupper 
0205f e8fcd7b4ff                     call       0x7f179f9c3660
02064 0f1f84005c21001f               nop        dword ptr [rax + rax + 0x1f00215c]
0206c beccffffff                     mov        esi, 0xffffffcc
02071 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02076 448b1c24                       mov        r11d, dword ptr [rsp]
0207a 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02082 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02087 4c891424                       mov        qword ptr [rsp], r10
0208b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02090 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02098 48ff742420                     push       qword ptr [rsp + 0x20]
0209d 488f442410                     pop        qword ptr [rsp + 0x10]
020a2 48ff742428                     push       qword ptr [rsp + 0x28]
020a7 488f442420                     pop        qword ptr [rsp + 0x20]
020ac 48ff742430                     push       qword ptr [rsp + 0x30]
020b1 488f442428                     pop        qword ptr [rsp + 0x28]
020b6 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
020bb 448974244c                     mov        dword ptr [rsp + 0x4c], r14d
020c0 895c2454                       mov        dword ptr [rsp + 0x54], ebx
020c4 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
020c9 666690                         nop        
020cc c5f877                         vzeroupper 
020cf e88cd7b4ff                     call       0x7f179f9c3660
020d4 0f1f8400cc210020               nop        dword ptr [rax + rax + 0x200021cc]
020dc be17000000                     mov        esi, 0x17
020e1 666690                         nop        
020e4 c5f877                         vzeroupper 
020e7 e874d7b4ff                     call       0x7f179f9c3660
020ec 0f1f8400e4210021               nop        dword ptr [rax + rax + 0x210021e4]
020f4 be6effffff                     mov        esi, 0xffffff6e
020f9 4489742410                     mov        dword ptr [rsp + 0x10], r14d
020fe 89442414                       mov        dword ptr [rsp + 0x14], eax
02102 4c89442418                     mov        qword ptr [rsp + 0x18], r8
02107 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
0210c 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
02111 48897c2430                     mov        qword ptr [rsp + 0x30], rdi
02116 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0211b 90                             nop        
0211c c5f877                         vzeroupper 
0211f e83cd7b4ff                     call       0x7f179f9c3660
02124 0f1f84001c220022               nop        dword ptr [rax + rax + 0x2200221c]
0212c bebeffffff                     mov        esi, 0xffffffbe
02131 4489742410                     mov        dword ptr [rsp + 0x10], r14d
02136 89442414                       mov        dword ptr [rsp + 0x14], eax
0213a 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0213f 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
02144 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
02149 48897c2430                     mov        qword ptr [rsp + 0x30], rdi
0214e 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02153 90                             nop        
02154 c5f877                         vzeroupper 
02157 e804d7b4ff                     call       0x7f179f9c3660
0215c 0f1f840054220023               nop        dword ptr [rax + rax + 0x23002254]
02164 488b5c2478                     mov        rbx, qword ptr [rsp + 0x78]
02169 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
0216e 448bb42484000000               mov        r14d, dword ptr [rsp + 0x84]
02176 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
0217e beccffffff                     mov        esi, 0xffffffcc
02183 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
0218b 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
02193 44893424                       mov        dword ptr [rsp], r14d
02197 4489542404                     mov        dword ptr [rsp + 4], r10d
0219c 48895c2408                     mov        qword ptr [rsp + 8], rbx
021a1 666690                         nop        
021a4 c5f877                         vzeroupper 
021a7 e8b4d6b4ff                     call       0x7f179f9c3660
021ac 0f1f8400a4220024               nop        dword ptr [rax + rax + 0x240022a4]
021b4 bee4ffffff                     mov        esi, 0xffffffe4
021b9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
021be 448b0424                       mov        r8d, dword ptr [rsp]
021c2 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
021ca 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
021cf 4c891c24                       mov        qword ptr [rsp], r11
021d3 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
021d8 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
021e0 48ff742420                     push       qword ptr [rsp + 0x20]
021e5 488f442410                     pop        qword ptr [rsp + 0x10]
021ea 48ff742428                     push       qword ptr [rsp + 0x28]
021ef 488f442420                     pop        qword ptr [rsp + 0x20]
021f4 48ff742430                     push       qword ptr [rsp + 0x30]
021f9 488f442428                     pop        qword ptr [rsp + 0x28]
021fe 895c2438                       mov        dword ptr [rsp + 0x38], ebx
02202 48894424f8                     mov        qword ptr [rsp - 8], rax
02207 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0220b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0220f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02214 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
02219 48894424f8                     mov        qword ptr [rsp - 8], rax
0221e 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02222 89442444                       mov        dword ptr [rsp + 0x44], eax
02226 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0222b 89442448                       mov        dword ptr [rsp + 0x48], eax
0222f 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02234 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02239 666690                         nop        
0223c c5f877                         vzeroupper 
0223f e81cd6b4ff                     call       0x7f179f9c3660
02244 0f1f84003c230025               nop        dword ptr [rax + rax + 0x2500233c]
0224c c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
02252 bee4ffffff                     mov        esi, 0xffffffe4
02257 498beb                         mov        rbp, r11
0225a 448b1c24                       mov        r11d, dword ptr [rsp]
0225e 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02266 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0226b 4c891c24                       mov        qword ptr [rsp], r11
0226f 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02274 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
0227c 48ff742420                     push       qword ptr [rsp + 0x20]
02281 488f442410                     pop        qword ptr [rsp + 0x10]
02286 48ff742428                     push       qword ptr [rsp + 0x28]
0228b 488f442420                     pop        qword ptr [rsp + 0x20]
02290 48ff742430                     push       qword ptr [rsp + 0x30]
02295 488f442428                     pop        qword ptr [rsp + 0x28]
0229a 895c2438                       mov        dword ptr [rsp + 0x38], ebx
0229e 48894424f8                     mov        qword ptr [rsp - 8], rax
022a3 8b442448                       mov        eax, dword ptr [rsp + 0x48]
022a7 8944243c                       mov        dword ptr [rsp + 0x3c], eax
022ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022b0 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
022b5 48894424f8                     mov        qword ptr [rsp - 8], rax
022ba 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
022be 89442444                       mov        dword ptr [rsp + 0x44], eax
022c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022c7 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
022cc 89442454                       mov        dword ptr [rsp + 0x54], eax
022d0 c5f877                         vzeroupper 
022d3 e888d5b4ff                     call       0x7f179f9c3660
022d8 0f1f8400d0230026               nop        dword ptr [rax + rax + 0x260023d0]
022e0 beccffffff                     mov        esi, 0xffffffcc
022e5 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
022ea 448b1c24                       mov        r11d, dword ptr [rsp]
022ee 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
022f6 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
022fb 4c891c24                       mov        qword ptr [rsp], r11
022ff 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02304 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
0230c 48ff742420                     push       qword ptr [rsp + 0x20]
02311 488f442418                     pop        qword ptr [rsp + 0x18]
02316 48ff742428                     push       qword ptr [rsp + 0x28]
0231b 488f442420                     pop        qword ptr [rsp + 0x20]
02320 48ff742430                     push       qword ptr [rsp + 0x30]
02325 488f442428                     pop        qword ptr [rsp + 0x28]
0232a 48894424f8                     mov        qword ptr [rsp - 8], rax
0232f 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02333 89442440                       mov        dword ptr [rsp + 0x40], eax
02337 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0233c 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
02341 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02346 89442458                       mov        dword ptr [rsp + 0x58], eax
0234a 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
0234e 6690                           nop        
02350 c5f877                         vzeroupper 
02353 e808d5b4ff                     call       0x7f179f9c3660
02358 0f1f840050240027               nop        dword ptr [rax + rax + 0x27002450]
02360 418bea                         mov        ebp, r10d
02363 83c510                         add        ebp, 0x10
02366 be6effffff                     mov        esi, 0xffffff6e
0236b 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
02370 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
02378 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0237d 44895c2404                     mov        dword ptr [rsp + 4], r11d
02382 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02387 48ff742420                     push       qword ptr [rsp + 0x20]
0238c 488f442418                     pop        qword ptr [rsp + 0x18]
02391 895c2440                       mov        dword ptr [rsp + 0x40], ebx
02395 48894424f8                     mov        qword ptr [rsp - 8], rax
0239a 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0239e 89442444                       mov        dword ptr [rsp + 0x44], eax
023a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023a7 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
023ac c5f877                         vzeroupper 
023af e8acd4b4ff                     call       0x7f179f9c3660
023b4 0f1f8400ac240028               nop        dword ptr [rax + rax + 0x280024ac]
023bc 418bea                         mov        ebp, r10d
023bf 83c510                         add        ebp, 0x10
023c2 be66ffffff                     mov        esi, 0xffffff66
023c7 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
023cc 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
023d4 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
023d9 4489442404                     mov        dword ptr [rsp + 4], r8d
023de 4489542414                     mov        dword ptr [rsp + 0x14], r10d
023e3 48ff742420                     push       qword ptr [rsp + 0x20]
023e8 488f442418                     pop        qword ptr [rsp + 0x18]
023ed 895c2440                       mov        dword ptr [rsp + 0x40], ebx
023f1 48894424f8                     mov        qword ptr [rsp - 8], rax
023f6 8b442448                       mov        eax, dword ptr [rsp + 0x48]
023fa 89442444                       mov        dword ptr [rsp + 0x44], eax
023fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02403 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02408 c5f877                         vzeroupper 
0240b e850d4b4ff                     call       0x7f179f9c3660
02410 0f1f840008250029               nop        dword ptr [rax + rax + 0x29002508]
02418 bee4ffffff                     mov        esi, 0xffffffe4
0241d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02422 448b1c24                       mov        r11d, dword ptr [rsp]
02426 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0242e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02433 4c891424                       mov        qword ptr [rsp], r10
02437 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0243c 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02444 48ff742420                     push       qword ptr [rsp + 0x20]
02449 488f442410                     pop        qword ptr [rsp + 0x10]
0244e 48ff742428                     push       qword ptr [rsp + 0x28]
02453 488f442420                     pop        qword ptr [rsp + 0x20]
02458 48ff742430                     push       qword ptr [rsp + 0x30]
0245d 488f442428                     pop        qword ptr [rsp + 0x28]
02462 895c2448                       mov        dword ptr [rsp + 0x48], ebx
02466 4489742450                     mov        dword ptr [rsp + 0x50], r14d
0246b 90                             nop        
0246c c5f877                         vzeroupper 
0246f e8ecd3b4ff                     call       0x7f179f9c3660
02474 0f1f84006c25002a               nop        dword ptr [rax + rax + 0x2a00256c]
0247c bee4ffffff                     mov        esi, 0xffffffe4
02481 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02486 448b1424                       mov        r10d, dword ptr [rsp]
0248a 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02492 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02497 4c891424                       mov        qword ptr [rsp], r10
0249b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
024a0 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
024a8 48ff742420                     push       qword ptr [rsp + 0x20]
024ad 488f442410                     pop        qword ptr [rsp + 0x10]
024b2 48ff742428                     push       qword ptr [rsp + 0x28]
024b7 488f442420                     pop        qword ptr [rsp + 0x20]
024bc 48ff742430                     push       qword ptr [rsp + 0x30]
024c1 488f442428                     pop        qword ptr [rsp + 0x28]
024c6 895c2444                       mov        dword ptr [rsp + 0x44], ebx
024ca 6690                           nop        
024cc c5f877                         vzeroupper 
024cf e88cd3b4ff                     call       0x7f179f9c3660
024d4 0f1f8400cc25002b               nop        dword ptr [rax + rax + 0x2b0025cc]
024dc 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
024e1 458d5a08                       lea        r11d, [r10 + 8]
024e5 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
024ea be6effffff                     mov        esi, 0xffffff6e
024ef 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
024f4 448b1424                       mov        r10d, dword ptr [rsp]
024f8 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02500 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02505 4c891424                       mov        qword ptr [rsp], r10
02509 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0250e 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02516 48ff742420                     push       qword ptr [rsp + 0x20]
0251b 488f442410                     pop        qword ptr [rsp + 0x10]
02520 48ff742428                     push       qword ptr [rsp + 0x28]
02525 488f442420                     pop        qword ptr [rsp + 0x20]
0252a 48ff742430                     push       qword ptr [rsp + 0x30]
0252f 488f442428                     pop        qword ptr [rsp + 0x28]
02534 48894424f8                     mov        qword ptr [rsp - 8], rax
02539 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
02540 89442438                       mov        dword ptr [rsp + 0x38], eax
02544 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02549 666690                         nop        
0254c c5f877                         vzeroupper 
0254f e80cd3b4ff                     call       0x7f179f9c3660
02554 0f1f84004c26002c               nop        dword ptr [rax + rax + 0x2c00264c]
0255c 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
02561 458d5a08                       lea        r11d, [r10 + 8]
02565 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0256a be66ffffff                     mov        esi, 0xffffff66
0256f 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02574 448b1c24                       mov        r11d, dword ptr [rsp]
02578 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02580 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02585 4c891424                       mov        qword ptr [rsp], r10
02589 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0258e 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02596 48ff742420                     push       qword ptr [rsp + 0x20]
0259b 488f442410                     pop        qword ptr [rsp + 0x10]
025a0 48ff742428                     push       qword ptr [rsp + 0x28]
025a5 488f442420                     pop        qword ptr [rsp + 0x20]
025aa 48ff742430                     push       qword ptr [rsp + 0x30]
025af 488f442428                     pop        qword ptr [rsp + 0x28]
025b4 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
025b9 666690                         nop        
025bc c5f877                         vzeroupper 
025bf e89cd2b4ff                     call       0x7f179f9c3660
025c4 0f1f8400bc26002d               nop        dword ptr [rax + rax + 0x2d0026bc]
025cc bee4ffffff                     mov        esi, 0xffffffe4
025d1 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
025d6 448b1c24                       mov        r11d, dword ptr [rsp]
025da 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
025e2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
025e7 4c891424                       mov        qword ptr [rsp], r10
025eb 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
025f0 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
025f8 48ff742420                     push       qword ptr [rsp + 0x20]
025fd 488f442410                     pop        qword ptr [rsp + 0x10]
02602 48ff742428                     push       qword ptr [rsp + 0x28]
02607 488f442420                     pop        qword ptr [rsp + 0x20]
0260c 48ff742430                     push       qword ptr [rsp + 0x30]
02611 488f442428                     pop        qword ptr [rsp + 0x28]
02616 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0261a 4489742448                     mov        dword ptr [rsp + 0x48], r14d
0261f 90                             nop        
02620 c5f877                         vzeroupper 
02623 e838d2b4ff                     call       0x7f179f9c3660
02628 0f1f84002027002e               nop        dword ptr [rax + rax + 0x2e002720]
02630 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
02636 bee4ffffff                     mov        esi, 0xffffffe4
0263b 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02640 448b1424                       mov        r10d, dword ptr [rsp]
02644 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
0264c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02651 4c891424                       mov        qword ptr [rsp], r10
02655 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0265a 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02662 48ff742420                     push       qword ptr [rsp + 0x20]
02667 488f442410                     pop        qword ptr [rsp + 0x10]
0266c 48ff742428                     push       qword ptr [rsp + 0x28]
02671 488f442420                     pop        qword ptr [rsp + 0x20]
02676 48ff742430                     push       qword ptr [rsp + 0x30]
0267b 488f442428                     pop        qword ptr [rsp + 0x28]
02680 4489742440                     mov        dword ptr [rsp + 0x40], r14d
02685 895c2448                       mov        dword ptr [rsp + 0x48], ebx
02689 666690                         nop        
0268c c5f877                         vzeroupper 
0268f e8ccd1b4ff                     call       0x7f179f9c3660
02694 0f1f84008c27002f               nop        dword ptr [rax + rax + 0x2f00278c]
0269c 4183c610                       add        r14d, 0x10
026a0 be6effffff                     mov        esi, 0xffffff6e
026a5 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
026aa 4489542404                     mov        dword ptr [rsp + 4], r10d
026af 48ff742420                     push       qword ptr [rsp + 0x20]
026b4 488f442418                     pop        qword ptr [rsp + 0x18]
026b9 48894424f8                     mov        qword ptr [rsp - 8], rax
026be 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
026c5 89442440                       mov        dword ptr [rsp + 0x40], eax
026c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026ce 4489742444                     mov        dword ptr [rsp + 0x44], r14d
026d3 90                             nop        
026d4 c5f877                         vzeroupper 
026d7 e884d1b4ff                     call       0x7f179f9c3660
026dc 0f1f8400d4270030               nop        dword ptr [rax + rax + 0x300027d4]
026e4 4183c610                       add        r14d, 0x10
026e8 be66ffffff                     mov        esi, 0xffffff66
026ed 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
026f2 4489542404                     mov        dword ptr [rsp + 4], r10d
026f7 48ff742420                     push       qword ptr [rsp + 0x20]
026fc 488f442418                     pop        qword ptr [rsp + 0x18]
02701 48894424f8                     mov        qword ptr [rsp - 8], rax
02706 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
0270d 89442440                       mov        dword ptr [rsp + 0x40], eax
02711 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02716 4489742444                     mov        dword ptr [rsp + 0x44], r14d
0271b 90                             nop        
0271c c5f877                         vzeroupper 
0271f e83cd1b4ff                     call       0x7f179f9c3660
02724 0f1f84001c280031               nop        dword ptr [rax + rax + 0x3100281c]
0272c bef6ffffff                     mov        esi, 0xfffffff6
02731 488bea                         mov        rbp, rdx
02734 898424e0000000                 mov        dword ptr [rsp + 0xe0], eax
0273b 90                             nop        
0273c c5f877                         vzeroupper 
0273f e81cd1b4ff                     call       0x7f179f9c3660
02744 0f1f84003c280032               nop        dword ptr [rax + rax + 0x3200283c]
0274c bef6ffffff                     mov        esi, 0xfffffff6
02751 666690                         nop        
02754 c5f877                         vzeroupper 
02757 e804d1b4ff                     call       0x7f179f9c3660
0275c 0f1f840054280033               nop        dword ptr [rax + rax + 0x33002854]
02764 49ba6a4ae79f177f0000           movabs     r10, 0x7f179fe74a6a
0276e 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02775 e96679a8ff                     jmp        0x7f179f8fdee0
0277a e82145a7ff                     call       0x7f179f8eaaa0
0277f e9bad8ffff                     jmp        0x7f179fe73e3e
02784 f4                             hlt        
02785 f4                             hlt        
02786 f4                             hlt        
02787 f4                             hlt        
