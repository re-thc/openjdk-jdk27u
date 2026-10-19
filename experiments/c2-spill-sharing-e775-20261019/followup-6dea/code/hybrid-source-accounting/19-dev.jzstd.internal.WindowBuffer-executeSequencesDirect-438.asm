00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c024a8ff                   jne        0x7f53eb8fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ece0000000                 sub        rsp, 0xe0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85e32f0000                   jne        0x7f53ebe7b4a1
0003e 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00043 894c240c                       mov        dword ptr [rsp + 0xc], ecx
00047 4d8bd8                         mov        r11, r8
0004a 4c8bf6                         mov        r14, rsi
0004d 448b5638                       mov        r10d, dword ptr [rsi + 0x38]
00051 4489542464                     mov        dword ptr [rsp + 0x64], r10d
00056 448b5604                       mov        r10d, dword ptr [rsi + 4]
0005a 458bca                         mov        r9d, r10d
0005d 442b4c2464                     sub        r9d, dword ptr [rsp + 0x64]
00062 448b8424f0000000               mov        r8d, dword ptr [rsp + 0xf0]
0006a 453bc1                         cmp        r8d, r9d
0006d 0f8f05290000                   jg         0x7f53ebe7adf8
00073 4c8b4e08                       mov        r9, qword ptr [rsi + 8]
00077 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
0007c 4c8b4e20                       mov        r9, qword ptr [rsi + 0x20]
00080 48638c24f0000000               movsxd     rcx, dword ptr [rsp + 0xf0]
00088 48635c2464                     movsxd     rbx, dword ptr [rsp + 0x64]
0008d 48035c2428                     add        rbx, qword ptr [rsp + 0x28]
00092 4c2bcb                         sub        r9, rbx
00095 493bc9                         cmp        rcx, r9
00098 0f8fda280000                   jg         0x7f53ebe7adf8
0009e 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
000a2 4c89442440                     mov        qword ptr [rsp + 0x40], r8
000a7 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000ab 4d85c0                         test       r8, r8
000ae 0f8453130000                   je         0x7f53ebe79887
000b4 33db                           xor        ebx, ebx
000b6 4c8bea                         mov        r13, rdx
000b9 8b7204                         mov        esi, dword ptr [rdx + 4]
000bc 458b4e40                       mov        r9d, dword ptr [r14 + 0x40]
000c0 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
000c8 8bef                           mov        ebp, edi
000ca 85ff                           test       edi, edi
000cc 0f8ea2220000                   jle        0x7f53ebe7a7f4
000d2 4c2b442428                     sub        r8, qword ptr [rsp + 0x28]
000d7 448d4ee0                       lea        r9d, [rsi - 0x20]
000db 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
000e3 418d4ae0                       lea        ecx, [r10 - 0x20]
000e7 458b5304                       mov        r10d, dword ptr [r11 + 4]
000eb 4585d2                         test       r10d, r10d
000ee 0f869c280000                   jbe        0x7f53ebe7ae10
000f4 4d63d2                         movsxd     r10, r10d
000f7 4863ff                         movsxd     rdi, edi
000fa 48ffcf                         dec        rdi
000fd 493bfa                         cmp        rdi, r10
00100 0f838a280000                   jae        0x7f53ebe7ae10
00106 488b8424f8000000               mov        rax, qword ptr [rsp + 0xf8]
0010e 8b5004                         mov        edx, dword ptr [rax + 4]
00111 85d2                           test       edx, edx
00113 0f86c7280000                   jbe        0x7f53ebe7ae60
00119 83fa01                         cmp        edx, 1
0011c 0f86be280000                   jbe        0x7f53ebe7ae60
00122 83fa02                         cmp        edx, 2
00125 0f86b5280000                   jbe        0x7f53ebe7ae60
0012b 448d56f1                       lea        r10d, [rsi - 0xf]
0012f 4585d2                         test       r10d, r10d
00132 0f8ca8280000                   jl         0x7f53ebe7ae60
00138 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00140 418b7a04                       mov        edi, dword ptr [r10 + 4]
00144 448d57f1                       lea        r10d, [rdi - 0xf]
00148 4585d2                         test       r10d, r10d
0014b 0f8c8f280000                   jl         0x7f53ebe7ae60
00151 448d57fd                       lea        r10d, [rdi - 3]
00155 4585d2                         test       r10d, r10d
00158 0f8c82280000                   jl         0x7f53ebe7ae60
0015e 448d57f9                       lea        r10d, [rdi - 7]
00162 4585d2                         test       r10d, r10d
00165 0f8c75280000                   jl         0x7f53ebe7ae60
0016b 897c241c                       mov        dword ptr [rsp + 0x1c], edi
0016f 899424fc000000                 mov        dword ptr [rsp + 0xfc], edx
00176 894c2448                       mov        dword ptr [rsp + 0x48], ecx
0017a 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
0017f 89b424f8000000                 mov        dword ptr [rsp + 0xf8], esi
00186 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0018a 4c89442438                     mov        qword ptr [rsp + 0x38], r8
0018f 4889442450                     mov        qword ptr [rsp + 0x50], rax
00194 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
00199 896c2418                       mov        dword ptr [rsp + 0x18], ebp
0019d 4c896c2468                     mov        qword ptr [rsp + 0x68], r13
001a2 4c89742478                     mov        qword ptr [rsp + 0x78], r14
001a7 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
001af 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001b4 448bd7                         mov        r10d, edi
001b7 448bde                         mov        r11d, esi
001ba 458d4afd                       lea        r9d, [r10 - 3]
001be 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
001c6 4d63c3                         movsxd     r8, r11d
001c9 4183c3f1                       add        r11d, -0xf
001cd 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
001d5 4983c0f1                       add        r8, -0xf
001d9 4c89842490000000               mov        qword ptr [rsp + 0x90], r8
001e1 4d63da                         movsxd     r11, r10d
001e4 458d42f9                       lea        r8d, [r10 - 7]
001e8 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
001f0 4183c2f1                       add        r10d, -0xf
001f4 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
001fc 4d8d53f1                       lea        r10, [r11 - 0xf]
00200 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00208 4983c3f9                       add        r11, -7
0020c 4c899c24a8000000               mov        qword ptr [rsp + 0xa8], r11
00214 4533c9                         xor        r9d, r9d
00217 4533c0                         xor        r8d, r8d
0021a e98c040000                     jmp        0x7f53ebe78b2b
0021f 448bdd                         mov        r11d, ebp
00222 4d63d3                         movsxd     r10, r11d
00225 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0022c c442a8f5db                     bzhi       r11, r11, r10
00231 c4c1fb92fb                     kmovq      k7, r11
00236 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0023c 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00242 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
0024a 4403dd                         add        r11d, ebp
0024d 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
00255 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00259 418502                         test       dword ptr [r10], eax
0025c 443b5c245c                     cmp        r11d, dword ptr [rsp + 0x5c]
00261 0f8df0070000                   jge        0x7f53ebe78ed7
00267 4489ac24b4000000               mov        dword ptr [rsp + 0xb4], r13d
0026f 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00277 442b9c24b0000000               sub        r11d, dword ptr [rsp + 0xb0]
0027f 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
00287 8b6c245c                       mov        ebp, dword ptr [rsp + 0x5c]
0028b 2bac24b0000000                 sub        ebp, dword ptr [rsp + 0xb0]
00292 3bac24b0000000                 cmp        ebp, dword ptr [rsp + 0xb0]
00299 448bac24b0000000               mov        r13d, dword ptr [rsp + 0xb0]
002a1 410f4fed                       cmovg      ebp, r13d
002a5 4585db                         test       r11d, r11d
002a8 0f8c361c0000                   jl         0x7f53ebe7a364
002ae 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
002b6 4585db                         test       r11d, r11d
002b9 0f8c251c0000                   jl         0x7f53ebe7a364
002bf 448bd5                         mov        r10d, ebp
002c2 44039424b8000000               add        r10d, dword ptr [rsp + 0xb8]
002ca 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
002cf 453bc2                         cmp        r8d, r10d
002d2 0f820c1c0000                   jb         0x7f53ebe7a364
002d8 448bac24b4000000               mov        r13d, dword ptr [rsp + 0xb4]
002e0 4403ed                         add        r13d, ebp
002e3 453bc5                         cmp        r8d, r13d
002e6 0f82f81b0000                   jb         0x7f53ebe7a364
002ec 85ed                           test       ebp, ebp
002ee 0f8cf01b0000                   jl         0x7f53ebe7a364
002f4 85ed                           test       ebp, ebp
002f6 0f8446ffffff                   je         0x7f53ebe786c2
002fc 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00304 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
00309 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00311 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
00316 4863d5                         movsxd     rdx, ebp
00319 4883fa20                       cmp        rdx, 0x20
0031d 0f86fcfeffff                   jbe        0x7f53ebe7869f
00323 c5f877                         vzeroupper 
00326 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
00330 41ffd2                         call       r10
00333 0f1f840000000000               nop        dword ptr [rax + rax]
0033b e902ffffff                     jmp        0x7f53ebe786c2
00340 458bf3                         mov        r14d, r11d
00343 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
0034b 4585db                         test       r11d, r11d
0034e 0f8eb8130000                   jle        0x7f53ebe79b8c
00354 458d1c01                       lea        r11d, [r9 + rax]
00358 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0035d 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00362 4403db                         add        r11d, ebx
00365 443b5c2448                     cmp        r11d, dword ptr [rsp + 0x48]
0036a 0f8fb6100000                   jg         0x7f53ebe798a6
00370 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00375 443b542458                     cmp        r10d, dword ptr [rsp + 0x58]
0037a 0f8fbc140000                   jg         0x7f53ebe79cbc
00380 83f810                         cmp        eax, 0x10
00383 0f8f86070000                   jg         0x7f53ebe78f8f
00389 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
00391 0f83fa100000                   jae        0x7f53ebe79911
00397 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0039c c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
003a3 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
003a8 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
003b0 0f8372110000                   jae        0x7f53ebe799a8
003b6 468d1408                       lea        r10d, [rax + r9]
003ba 4489542460                     mov        dword ptr [rsp + 0x60], r10d
003bf 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
003c4 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
003cc c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
003d3 468d1c10                       lea        r11d, [rax + r10]
003d7 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
003dc 458beb                         mov        r13d, r11d
003df 442bac24b0000000               sub        r13d, dword ptr [rsp + 0xb0]
003e7 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
003eb 83fb10                         cmp        ebx, 0x10
003ee 7f53                           jg         0x7f53ebe788c3
003f0 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
003f7 83fb10                         cmp        ebx, 0x10
003fa 7c47                           jl         0x7f53ebe788c3
003fc 443bac249c000000               cmp        r13d, dword ptr [rsp + 0x9c]
00404 0f83da110000                   jae        0x7f53ebe79a64
0040a 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00412 c4817a6f442b08                 vmovdqu    xmm0, xmmword ptr [r11 + r13 + 8]
00419 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
0041d 3b9c249c000000                 cmp        ebx, dword ptr [rsp + 0x9c]
00424 0f8346120000                   jae        0x7f53ebe79af0
0042a c4c17a7f441b08                 vmovdqu    xmmword ptr [r11 + rbx + 8], xmm0
00431 448b6c245c                     mov        r13d, dword ptr [rsp + 0x5c]
00436 4403eb                         add        r13d, ebx
00439 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
0043e e94d020000                     jmp        0x7f53ebe78b10
00443 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0044b 4b8d7c2a08                     lea        rdi, [r10 + r13 + 8]
00450 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00454 498d741a08                     lea        rsi, [r10 + rbx + 8]
00459 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
0045d 035c2464                       add        ebx, dword ptr [rsp + 0x64]
00461 4c63cb                         movsxd     r9, ebx
00464 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
0046c 443b54245c                     cmp        r10d, dword ptr [rsp + 0x5c]
00471 0f8c18040000                   jl         0x7f53ebe78d0f
00477 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0047c 4183fb30                       cmp        r11d, 0x30
00480 0f8e8c000000                   jle        0x7f53ebe78992
00486 4585ed                         test       r13d, r13d
00489 0f8cf9170000                   jl         0x7f53ebe7a108
0048f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00494 4585d2                         test       r10d, r10d
00497 0f8ceb170000                   jl         0x7f53ebe7a108
0049d 478d042b                       lea        r8d, [r11 + r13]
004a1 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
004a6 453bd8                         cmp        r11d, r8d
004a9 0f82d9170000                   jb         0x7f53ebe7a108
004af 443bdb                         cmp        r11d, ebx
004b2 0f82d0170000                   jb         0x7f53ebe7a108
004b8 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
004bc 85db                           test       ebx, ebx
004be 0f84c0010000                   je         0x7f53ebe78b04
004c4 4863d3                         movsxd     rdx, ebx
004c7 4883fa20                       cmp        rdx, 0x20
004cb 7728                           ja         0x7f53ebe78975
004cd 448bd3                         mov        r10d, ebx
004d0 4d63d2                         movsxd     r10, r10d
004d3 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
004da c442a8f5db                     bzhi       r11, r11, r10
004df c4c1fb92fb                     kmovq      k7, r11
004e4 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
004ea 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
004f0 e98f010000                     jmp        0x7f53ebe78b04
004f5 c5f877                         vzeroupper 
004f8 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
00502 41ffd2                         call       r10
00505 0f1f840000000000               nop        dword ptr [rax + rax]
0050d e972010000                     jmp        0x7f53ebe78b04
00512 443bac2498000000               cmp        r13d, dword ptr [rsp + 0x98]
0051a 0f83a0130000                   jae        0x7f53ebe79d40
00520 4963d5                         movsxd     rdx, r13d
00523 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0052b 498b4c1308                     mov        rcx, qword ptr [r11 + rdx + 8]
00530 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00535 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
0053d 0f8339140000                   jae        0x7f53ebe79dfc
00543 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00548 418d7808                       lea        edi, [r8 + 8]
0054c 4d63d8                         movsxd     r11, r8d
0054f 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00557 4b894c1a08                     mov        qword ptr [r10 + r11 + 8], rcx
0055c 3bfb                           cmp        edi, ebx
0055e 0f8d20010000                   jge        0x7f53ebe78b04
00564 492bd3                         sub        rdx, r11
00567 4c63df                         movsxd     r11, edi
0056a 4d8d1413                       lea        r10, [r11 + rdx]
0056e 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00576 0f83c4150000                   jae        0x7f53ebe79fc0
0057c 4d8bd1                         mov        r10, r9
0057f 4d2bd3                         sub        r10, r11
00582 4983c207                       add        r10, 7
00586 4983e2f8                       and        r10, 0xfffffffffffffff8
0058a 458bda                         mov        r11d, r10d
0058d 478d540308                     lea        r10d, [r11 + r8 + 8]
00592 4d63d2                         movsxd     r10, r10d
00595 4d8d5c12f8                     lea        r11, [r10 + rdx - 8]
0059a 4c3b9c24a8000000               cmp        r11, qword ptr [rsp + 0xa8]
005a2 0f8398150000                   jae        0x7f53ebe79fc0
005a8 3bbc2498000000                 cmp        edi, dword ptr [rsp + 0x98]
005af 0f838b150000                   jae        0x7f53ebe79fc0
005b5 4983c2f8                       add        r10, -8
005b9 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
005c1 0f8379150000                   jae        0x7f53ebe79fc0
005c7 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
005cd 0f8f11160000                   jg         0x7f53ebe7a064
005d3 452be8                         sub        r13d, r8d
005d6 4183c010                       add        r8d, 0x10
005da 468d142f                       lea        r10d, [rdi + r13]
005de 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
005e6 4b8b4c1308                     mov        rcx, qword ptr [r11 + r10 + 8]
005eb 448bd7                         mov        r10d, edi
005ee 4b894c1308                     mov        qword ptr [r11 + r10 + 8], rcx
005f3 83c708                         add        edi, 8
005f6 413bf8                         cmp        edi, r8d
005f9 7cdf                           jl         0x7f53ebe78a5a
005fb 4983c1f8                       add        r9, -8
005ff 4981f900000080                 cmp        r9, -0x80000000
00606 49c7c200000080                 mov        r10, 0xffffffff80000000
0060d 4d0f4cca                       cmovl      r9, r10
00611 458bd1                         mov        r10d, r9d
00614 413bfa                         cmp        edi, r10d
00617 7d46                           jge        0x7f53ebe78adf
00619 0f1f8000000000                 nop        dword ptr [rax]
00620 428d142f                       lea        edx, [rdi + r13]
00624 448bdf                         mov        r11d, edi
00627 4963cb                         movsxd     rcx, r11d
0062a 448bda                         mov        r11d, edx
0062d 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00635 4f8b5c1808                     mov        r11, qword ptr [r8 + r11 + 8]
0063a 4863d2                         movsxd     rdx, edx
0063d 448bc7                         mov        r8d, edi
00640 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
00648 4f895c0108                     mov        qword ptr [r9 + r8 + 8], r11
0064d 4d8b5c1110                     mov        r11, qword ptr [r9 + rdx + 0x10]
00652 4d895c0910                     mov        qword ptr [r9 + rcx + 0x10], r11
00657 83c710                         add        edi, 0x10
0065a 413bfa                         cmp        edi, r10d
0065d 7cc1                           jl         0x7f53ebe78aa0
0065f 3bfb                           cmp        edi, ebx
00661 7d21                           jge        0x7f53ebe78b04
00663 90                             nop        
00664 468d1c2f                       lea        r11d, [rdi + r13]
00668 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00670 4f8b5c1808                     mov        r11, qword ptr [r8 + r11 + 8]
00675 448bd7                         mov        r10d, edi
00678 4f895c1008                     mov        qword ptr [r8 + r10 + 8], r11
0067d 83c708                         add        edi, 8
00680 3bfb                           cmp        edi, ebx
00682 7ce0                           jl         0x7f53ebe78ae4
00684 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00688 035c245c                       add        ebx, dword ptr [rsp + 0x5c]
0068c 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00690 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
00698 41ffc0                         inc        r8d
0069b 443b442418                     cmp        r8d, dword ptr [rsp + 0x18]
006a0 0f8dbc050000                   jge        0x7f53ebe790e2
006a6 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
006ab 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
006b0 4f8b54c208                     mov        r10, qword ptr [r10 + r8*8 + 8]
006b5 4d8bda                         mov        r11, r10
006b8 49c1eb12                       shr        r11, 0x12
006bc 418bdb                         mov        ebx, r11d
006bf 81e3ffff0300                   and        ebx, 0x3ffff
006c5 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
006c9 4d8bda                         mov        r11, r10
006cc 49c1fb24                       sar        r11, 0x24
006d0 458bd2                         mov        r10d, r10d
006d3 458bdb                         mov        r11d, r11d
006d6 418bcb                         mov        ecx, r11d
006d9 4181e2ffff0100                 and        r10d, 0x1ffff
006e0 418bc2                         mov        eax, r10d
006e3 4585db                         test       r11d, r11d
006e6 0f8c40100000                   jl         0x7f53ebe79bac
006ec 448bd8                         mov        r11d, eax
006ef 4585db                         test       r11d, r11d
006f2 0f85ac000000                   jne        0x7f53ebe78c24
006f8 4533d2                         xor        r10d, r10d
006fb 418bc2                         mov        eax, r10d
006fe 83f903                         cmp        ecx, 3
00701 0f8ed1000000                   jle        0x7f53ebe78c58
00707 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0070c 458b5a0c                       mov        r11d, dword ptr [r10 + 0xc]
00710 45895a10                       mov        dword ptr [r10 + 0x10], r11d
00714 458b5208                       mov        r10d, dword ptr [r10 + 8]
00718 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
0071d 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00721 448d51fd                       lea        r10d, [rcx - 3]
00725 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
0072d 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
00734 41895b08                       mov        dword ptr [r11 + 8], ebx
00738 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
00740 48639c24b0000000               movsxd     rbx, dword ptr [rsp + 0xb0]
00748 488beb                         mov        rbp, rbx
0074b 4c63542464                     movsxd     r10, dword ptr [rsp + 0x64]
00750 4c03542428                     add        r10, qword ptr [rsp + 0x28]
00755 4863d0                         movsxd     rdx, eax
00758 4c03d2                         add        r10, rdx
0075b 493bda                         cmp        rbx, r10
0075e 0f8f58100000                   jg         0x7f53ebe79c3c
00764 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00768 03d8                           add        ebx, eax
0076a 448beb                         mov        r13d, ebx
0076d 442bac24b0000000               sub        r13d, dword ptr [rsp + 0xb0]
00775 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0077a 4585db                         test       r11d, r11d
0077d 0f85bdfbffff                   jne        0x7f53ebe787c0
00783 4d63dd                         movsxd     r11, r13d
00786 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
0078b 0f8c97120000                   jl         0x7f53ebe79ea8
00791 483b6c2440                     cmp        rbp, qword ptr [rsp + 0x40]
00796 0f8f18130000                   jg         0x7f53ebe79f34
0079c 4533f6                         xor        r14d, r14d
0079f e99ffbffff                     jmp        0x7f53ebe787c3
007a4 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
007a9 452bd1                         sub        r10d, r9d
007ac 453bda                         cmp        r11d, r10d
007af 0f8e49ffffff                   jle        0x7f53ebe78b7e
007b5 be45ffffff                     mov        esi, 0xffffff45
007ba 418beb                         mov        ebp, r11d
007bd 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
007c5 666690                         nop        
007c8 c5f877                         vzeroupper 
007cb e810aab4ff                     call       0x7f53eb9c3660
007d0 0f1f8400c8080001               nop        dword ptr [rax + rax + 0x10008c8]
007d8 85c0                           test       eax, eax
007da 7407                           je         0x7f53ebe78c63
007dc 448d51ff                       lea        r10d, [rcx - 1]
007e0 418bca                         mov        ecx, r10d
007e3 85c9                           test       ecx, ecx
007e5 7516                           jne        0x7f53ebe78c7d
007e7 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
007ec 418b5a08                       mov        ebx, dword ptr [r10 + 8]
007f0 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
007f8 e986000000                     jmp        0x7f53ebe78d03
007fd 83f903                         cmp        ecx, 3
00800 0f84261c0000                   je         0x7f53ebe7a8ac
00806 83f902                         cmp        ecx, 2
00809 0f87b11c0000                   ja         0x7f53ebe7a940
0080f 3b8c24fc000000                 cmp        ecx, dword ptr [rsp + 0xfc]
00816 0f8316160000                   jae        0x7f53ebe7a2b2
0081c 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00821 418b5c8b08                     mov        ebx, dword ptr [r11 + rcx*4 + 8]
00826 85c9                           test       ecx, ecx
00828 7e48                           jle        0x7f53ebe78cf2
0082a 448d51ff                       lea        r10d, [rcx - 1]
0082e 443b9424fc000000               cmp        r10d, dword ptr [rsp + 0xfc]
00836 0f83511b0000                   jae        0x7f53ebe7a80d
0083c 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
00844 660f1f440000                   nop        word ptr [rax + rax]
0084a 660f1f440000                   nop        word ptr [rax + rax]
00850 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00855 458b5c8b04                     mov        r11d, dword ptr [r11 + rcx*4 + 4]
0085a 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
0085f 45895c8808                     mov        dword ptr [r8 + rcx*4 + 8], r11d
00864 448d51ff                       lea        r10d, [rcx - 1]
00868 418bca                         mov        ecx, r10d
0086b 4585d2                         test       r10d, r10d
0086e 7fe0                           jg         0x7f53ebe78cd0
00870 eb08                           jmp        0x7f53ebe78cfa
00872 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
0087a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0087f 41895a08                       mov        dword ptr [r10 + 8], ebx
00883 899c24b0000000                 mov        dword ptr [rsp + 0xb0], ebx
0088a e9b1feffff                     jmp        0x7f53ebe78bc0
0088f 4183fa10                       cmp        r10d, 0x10
00893 0f8dcc080000                   jge        0x7f53ebe795e5
00899 4183fa08                       cmp        r10d, 8
0089d 0f8d79040000                   jge        0x7f53ebe7919c
008a3 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
008a8 4183fa10                       cmp        r10d, 0x10
008ac 0f8fae010000                   jg         0x7f53ebe78ee0
008b2 443b6c241c                     cmp        r13d, dword ptr [rsp + 0x1c]
008b7 0f83af160000                   jae        0x7f53ebe7a3ec
008bd 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
008c5 430fbe6c2b08                   movsx      ebp, byte ptr [r11 + r13 + 8]
008cb 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
008d0 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
008d5 0f8345170000                   jae        0x7f53ebe7a4a0
008db 43886c1308                     mov        byte ptr [r11 + r10 + 8], bpl
008e0 41ffc2                         inc        r10d
008e3 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
008eb 458d5503                       lea        r10d, [r13 + 3]
008ef 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
008f4 0f83aa170000                   jae        0x7f53ebe7a524
008fa 4d63c5                         movsxd     r8, r13d
008fd 430fbe6c0309                   movsx      ebp, byte ptr [r11 + r8 + 9]
00903 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00908 4183c303                       add        r11d, 3
0090c 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
00911 0f831d180000                   jae        0x7f53ebe7a5b4
00917 4c634c2464                     movsxd     r9, dword ptr [rsp + 0x64]
0091c 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00924 43886c0b09                     mov        byte ptr [r11 + r9 + 9], bpl
00929 470fbe54030a                   movsx      r10d, byte ptr [r11 + r8 + 0xa]
0092f 4788540b0a                     mov        byte ptr [r11 + r9 + 0xa], r10b
00934 470fbe54030b                   movsx      r10d, byte ptr [r11 + r8 + 0xb]
0093a 4788540b0b                     mov        byte ptr [r11 + r9 + 0xb], r10b
0093f 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00947 4183fb08                       cmp        r11d, 8
0094b 0f8367180000                   jae        0x7f53ebe7a638
00951 49bb283827e300000000           movabs     r11, 0xe3273828
0095b 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00963 47036c9308                     add        r13d, dword ptr [r11 + r10*4 + 8]
00968 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0096d 4183fb04                       cmp        r11d, 4
00971 7e62                           jle        0x7f53ebe78e55
00973 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00978 4183c204                       add        r10d, 4
0097c 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00984 443bac2488000000               cmp        r13d, dword ptr [rsp + 0x88]
0098c 0f83ba180000                   jae        0x7f53ebe7a6cc
00992 458bdd                         mov        r11d, r13d
00995 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
0099d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
009a5 438b6c1a08                     mov        ebp, dword ptr [r10 + r11 + 8]
009aa 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
009b2 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
009ba 0f8334190000                   jae        0x7f53ebe7a774
009c0 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
009c5 4d63d3                         movsxd     r10, r11d
009c8 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
009d0 43896c130c                     mov        dword ptr [r11 + r10 + 0xc], ebp
009d5 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
009da 4183fa08                       cmp        r10d, 8
009de 7e77                           jle        0x7f53ebe78ed7
009e0 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
009e5 4183c308                       add        r11d, 8
009e9 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
009f1 49bb503827e300000000           movabs     r11, 0xe3273850
009fb 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00a03 478b5c9308                     mov        r11d, dword ptr [r11 + r10*4 + 8]
00a08 452beb                         sub        r13d, r11d
00a0b 418d6d08                       lea        ebp, [r13 + 8]
00a0f 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
00a16 0f83381b0000                   jae        0x7f53ebe7a9d4
00a1c 4d63dd                         movsxd     r11, r13d
00a1f 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00a27 4b8b6c1a10                     mov        rbp, qword ptr [r10 + r11 + 0x10]
00a2c 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00a34 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00a3c 0f83921b0000                   jae        0x7f53ebe7aa54
00a42 448b6c2464                     mov        r13d, dword ptr [rsp + 0x64]
00a47 4d63d5                         movsxd     r10, r13d
00a4a 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00a52 4b896c1310                     mov        qword ptr [r11 + r10 + 0x10], rbp
00a57 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00a5b e930fcffff                     jmp        0x7f53ebe78b10
00a60 4585ed                         test       r13d, r13d
00a63 0f8cdf1b0000                   jl         0x7f53ebe7aac8
00a69 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00a6e 4585db                         test       r11d, r11d
00a71 0f8cd11b0000                   jl         0x7f53ebe7aac8
00a77 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
00a7c 443b542464                     cmp        r10d, dword ptr [rsp + 0x64]
00a81 0f82c11b0000                   jb         0x7f53ebe7aac8
00a87 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00a8f 4403542464                     add        r10d, dword ptr [rsp + 0x64]
00a94 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00a9c 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
00aa1 453bda                         cmp        r11d, r10d
00aa4 0f829e1b0000                   jb         0x7f53ebe7aac8
00aaa 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00ab2 4585db                         test       r11d, r11d
00ab5 0f8c8d1b0000                   jl         0x7f53ebe7aac8
00abb 4585db                         test       r11d, r11d
00abe 0f84abf7ffff                   je         0x7f53ebe786ef
00ac4 4883fd20                       cmp        rbp, 0x20
00ac8 7725                           ja         0x7f53ebe78f6f
00aca 4d63d3                         movsxd     r10, r11d
00acd 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ad4 c442a8f5db                     bzhi       r11, r11, r10
00ad9 c4c1fb92fb                     kmovq      k7, r11
00ade 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ae4 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00aea e980f7ffff                     jmp        0x7f53ebe786ef
00aef 488bd5                         mov        rdx, rbp
00af2 c5f877                         vzeroupper 
00af5 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
00aff 41ffd2                         call       r10
00b02 0f1f840000000000               nop        dword ptr [rax + rax]
00b0a e960f7ffff                     jmp        0x7f53ebe786ef
00b0f 83f830                         cmp        eax, 0x30
00b12 0f8fca050000                   jg         0x7f53ebe79562
00b18 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
00b20 0f83d61b0000                   jae        0x7f53ebe7ab7c
00b26 4d63c1                         movsxd     r8, r9d
00b29 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00b2e c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
00b35 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b3a 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
00b42 0f83641c0000                   jae        0x7f53ebe7ac2c
00b48 418bfa                         mov        edi, r10d
00b4b 458d5a10                       lea        r11d, [r10 + 0x10]
00b4f 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00b54 4963ca                         movsxd     rcx, r10d
00b57 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00b5f c4c17a7f440a08                 vmovdqu    xmmword ptr [r10 + rcx + 8], xmm0
00b66 443bdb                         cmp        r11d, ebx
00b69 0f8dbc000000                   jge        0x7f53ebe790ab
00b6f 4c2bc1                         sub        r8, rcx
00b72 4d63db                         movsxd     r11, r11d
00b75 4f8d1403                       lea        r10, [r11 + r8]
00b79 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
00b81 0f83e91c0000                   jae        0x7f53ebe7acf0
00b87 4c63d3                         movsxd     r10, ebx
00b8a 4d2bd3                         sub        r10, r11
00b8d 4983c20f                       add        r10, 0xf
00b91 4983e2f0                       and        r10, 0xfffffffffffffff0
00b95 458bd2                         mov        r10d, r10d
00b98 458d5c3a10                     lea        r11d, [r10 + rdi + 0x10]
00b9d 4d63db                         movsxd     r11, r11d
00ba0 4f8d5403f0                     lea        r10, [r11 + r8 - 0x10]
00ba5 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
00bad 0f83bd1c0000                   jae        0x7f53ebe7acf0
00bb3 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00bb8 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
00bc0 0f83aa1c0000                   jae        0x7f53ebe7acf0
00bc6 4983c3f0                       add        r11, -0x10
00bca 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
00bd2 0f83981c0000                   jae        0x7f53ebe7acf0
00bd8 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00bde 0f8f101d0000                   jg         0x7f53ebe7ad74
00be4 458bd1                         mov        r10d, r9d
00be7 442bd7                         sub        r10d, edi
00bea 660f1f440000                   nop        word ptr [rax + rax]
00bf0 458bc2                         mov        r8d, r10d
00bf3 4403442460                     add        r8d, dword ptr [rsp + 0x60]
00bf8 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00bfd c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
00c04 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00c09 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00c11 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
00c18 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00c1d 4183c310                       add        r11d, 0x10
00c21 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00c26 443bdb                         cmp        r11d, ebx
00c29 7cc5                           jl         0x7f53ebe79070
00c2b 468d1408                       lea        r10d, [rax + r9]
00c2f 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00c34 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00c38 e9aaf7ffff                     jmp        0x7f53ebe78867
00c3d 4d63d2                         movsxd     r10, r10d
00c40 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c47 c442a8f5db                     bzhi       r11, r11, r10
00c4c c4c1fb92fb                     kmovq      k7, r11
00c51 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c57 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c5d e9a0000000                     jmp        0x7f53ebe79182
00c62 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00c67 442b542460                     sub        r10d, dword ptr [rsp + 0x60]
00c6c 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00c74 4585db                         test       r11d, r11d
00c77 0f84c31d0000                   je         0x7f53ebe7aec0
00c7d 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00c82 4585c0                         test       r8d, r8d
00c85 0f8c351e0000                   jl         0x7f53ebe7af40
00c8b 4c8b742478                     mov        r14, qword ptr [rsp + 0x78]
00c90 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
00c95 8bb424f8000000                 mov        esi, dword ptr [rsp + 0xf8]
00c9c 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00ca0 85db                           test       ebx, ebx
00ca2 0f8ccc1d0000                   jl         0x7f53ebe7aef4
00ca8 3b74240c                       cmp        esi, dword ptr [rsp + 0xc]
00cac 0f82c81d0000                   jb         0x7f53ebe7aefa
00cb2 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
00cb6 4103ea                         add        ebp, r10d
00cb9 418b4b04                       mov        ecx, dword ptr [r11 + 4]
00cbd 3bcd                           cmp        ecx, ebp
00cbf 0f82bb1d0000                   jb         0x7f53ebe7af00
00cc5 4585d2                         test       r10d, r10d
00cc8 0f8cb81d0000                   jl         0x7f53ebe7af06
00cce 4585d2                         test       r10d, r10d
00cd1 742f                           je         0x7f53ebe79182
00cd3 498d741b08                     lea        rsi, [r11 + rbx + 8]
00cd8 4b8d7c0508                     lea        rdi, [r13 + r8 + 8]
00cdd 4963d2                         movsxd     rdx, r10d
00ce0 4883fa20                       cmp        rdx, 0x20
00ce4 0f8653ffffff                   jbe        0x7f53ebe790bd
00cea c5f877                         vzeroupper 
00ced 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
00cf7 41ffd2                         call       r10
00cfa 0f1f840000000000               nop        dword ptr [rax + rax]
00d02 41896e38                       mov        dword ptr [r14 + 0x38], ebp
00d06 c5f877                         vzeroupper 
00d09 4881c4e0000000                 add        rsp, 0xe0
00d10 5d                             pop        rbp
00d11 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00d15 0f87f0220000                   ja         0x7f53ebe7b48b
00d1b c3                             ret        
00d1c 443bac2498000000               cmp        r13d, dword ptr [rsp + 0x98]
00d24 0f83a61d0000                   jae        0x7f53ebe7af50
00d2a 418bed                         mov        ebp, r13d
00d2d 896c245c                       mov        dword ptr [rsp + 0x5c], ebp
00d31 4c63c5                         movsxd     r8, ebp
00d34 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00d3c 4b8b6c0208                     mov        rbp, qword ptr [r10 + r8 + 8]
00d41 4889ac24b0000000               mov        qword ptr [rsp + 0xb0], rbp
00d49 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00d4e 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00d56 0f83181e0000                   jae        0x7f53ebe7aff4
00d5c 418d6b08                       lea        ebp, [r11 + 8]
00d60 896c244c                       mov        dword ptr [rsp + 0x4c], ebp
00d64 4d63d3                         movsxd     r10, r11d
00d67 8b8c2484000000                 mov        ecx, dword ptr [rsp + 0x84]
00d6e 488bac24b0000000               mov        rbp, qword ptr [rsp + 0xb0]
00d76 4a896c1108                     mov        qword ptr [rcx + r10 + 8], rbp
00d7b 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
00d7f 3beb                           cmp        ebp, ebx
00d81 0f8d2d030000                   jge        0x7f53ebe79534
00d87 4d2bc2                         sub        r8, r10
00d8a 4863f5                         movsxd     rsi, ebp
00d8d 4e8d1406                       lea        r10, [rsi + r8]
00d91 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00d99 0f83611e0000                   jae        0x7f53ebe7b080
00d9f 4d8bd1                         mov        r10, r9
00da2 4c2bd6                         sub        r10, rsi
00da5 4983c207                       add        r10, 7
00da9 4983e2f8                       and        r10, 0xfffffffffffffff8
00dad 418bca                         mov        ecx, r10d
00db0 468d541908                     lea        r10d, [rcx + r11 + 8]
00db5 4d63d2                         movsxd     r10, r10d
00db8 4f8d4402f8                     lea        r8, [r10 + r8 - 8]
00dbd 4c3b8424a8000000               cmp        r8, qword ptr [rsp + 0xa8]
00dc5 0f83351e0000                   jae        0x7f53ebe7b080
00dcb 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
00dd2 0f83281e0000                   jae        0x7f53ebe7b080
00dd8 4983c2f8                       add        r10, -8
00ddc 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00de4 0f83161e0000                   jae        0x7f53ebe7b080
00dea 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
00df0 0f8f961e0000                   jg         0x7f53ebe7b10c
00df6 8b6c245c                       mov        ebp, dword ptr [rsp + 0x5c]
00dfa 412beb                         sub        ebp, r11d
00dfd 448bf5                         mov        r14d, ebp
00e00 41baf8ffffff                   mov        r10d, 0xfffffff8
00e06 4d8d41c8                       lea        r8, [r9 - 0x38]
00e0a 4981f800000080                 cmp        r8, -0x80000000
00e11 48c7c100000080                 mov        rcx, 0xffffffff80000000
00e18 4c0f4cc1                       cmovl      r8, rcx
00e1c 418bf8                         mov        edi, r8d
00e1f 442b6c2464                     sub        r13d, dword ptr [rsp + 0x64]
00e24 418d4b10                       lea        ecx, [r11 + 0x10]
00e28 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
00e2d 4863e9                         movsxd     rbp, ecx
00e30 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
00e37 8bd0                           mov        edx, eax
00e39 442bd2                         sub        r10d, edx
00e3c 452bd3                         sub        r10d, r11d
00e3f 4183c2f0                       add        r10d, -0x10
00e43 41bb06000000                   mov        r11d, 6
00e49 c442a0f5d2                     bzhi       r10, r10, r11
00e4e 4903ea                         add        rbp, r10
00e51 493be9                         cmp        rbp, r9
00e54 4d8bd9                         mov        r11, r9
00e57 4c0f4cdd                       cmovl      r11, rbp
00e5b 4d8bd3                         mov        r10, r11
00e5e 4c2bd6                         sub        r10, rsi
00e61 498d52ff                       lea        rdx, [r10 - 1]
00e65 48c1fa3f                       sar        rdx, 0x3f
00e69 48c1ea3d                       shr        rdx, 0x3d
00e6d 4e8d5412ff                     lea        r10, [rdx + r10 - 1]
00e72 4983e2f8                       and        r10, 0xfffffffffffffff8
00e76 4c03d6                         add        r10, rsi
00e79 493bf2                         cmp        rsi, r10
00e7c 490f4cf2                       cmovl      rsi, r10
00e80 8bd6                           mov        edx, esi
00e82 458d541508                     lea        r10d, [r13 + rdx + 8]
00e87 83c208                         add        edx, 8
00e8a 4963f2                         movsxd     rsi, r10d
00e8d 4903f0                         add        rsi, r8
00e90 4863d2                         movsxd     rdx, edx
00e93 4903d0                         add        rdx, r8
00e96 4c8d4608                       lea        r8, [rsi + 8]
00e9a 4883c648                       add        rsi, 0x48
00e9e 488d4248                       lea        rax, [rdx + 0x48]
00ea2 4533d2                         xor        r10d, r10d
00ea5 493bc0                         cmp        rax, r8
00ea8 410f96c2                       setbe      r10b
00eac 4883c208                       add        rdx, 8
00eb0 4533c0                         xor        r8d, r8d
00eb3 483bf2                         cmp        rsi, rdx
00eb6 410f96c0                       setbe      r8b
00eba 450bd0                         or         r10d, r8d
00ebd 0f84590e0000                   je         0x7f53ebe7a19c
00ec3 458bd3                         mov        r10d, r11d
00ec6 6690                           nop        
00ec8 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00ecd 418bce                         mov        ecx, r14d
00ed0 034c244c                       add        ecx, dword ptr [rsp + 0x4c]
00ed4 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00edc 498b4c0808                     mov        rcx, qword ptr [r8 + rcx + 8]
00ee1 4b894c1808                     mov        qword ptr [r8 + r11 + 8], rcx
00ee6 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
00eea 83c508                         add        ebp, 8
00eed 896c244c                       mov        dword ptr [rsp + 0x4c], ebp
00ef1 413bea                         cmp        ebp, r10d
00ef4 7cd2                           jl         0x7f53ebe79348
00ef6 4981c108feffff                 add        r9, -0x1f8
00efd 4981f900000080                 cmp        r9, -0x80000000
00f04 49c7c200000080                 mov        r10, 0xffffffff80000000
00f0b 4d0f4cca                       cmovl      r9, r10
00f0f 458bd1                         mov        r10d, r9d
00f12 413bea                         cmp        ebp, r10d
00f15 0f8d67010000                   jge        0x7f53ebe79502
00f1b 896c244c                       mov        dword ptr [rsp + 0x4c], ebp
00f1f 90                             nop        
00f20 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00f25 4d63cb                         movsxd     r9, r11d
00f28 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00f2d 418bd6                         mov        edx, r14d
00f30 0354244c                       add        edx, dword ptr [rsp + 0x4c]
00f34 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
00f38 83c140                         add        ecx, 0x40
00f3b 4103ce                         add        ecx, r14d
00f3e 448bda                         mov        r11d, edx
00f41 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
00f48 62b17e486f841808000000         vmovdqu32  zmm0, zmmword ptr [rax + r11 + 8]
00f53 62b17e487f840008000000         vmovdqu32  zmmword ptr [rax + r8 + 8], zmm0
00f5e 62f17e486f840808000000         vmovdqu32  zmm0, zmmword ptr [rax + rcx + 8]
00f69 62b17e487f840848000000         vmovdqu32  zmmword ptr [rax + r9 + 0x48], zmm0
00f74 4863ca                         movsxd     rcx, edx
00f77 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00f7c 4181c380000000                 add        r11d, 0x80
00f83 4503de                         add        r11d, r14d
00f86 62b17e486f841808000000         vmovdqu32  zmm0, zmmword ptr [rax + r11 + 8]
00f91 62b17e487f840888000000         vmovdqu32  zmmword ptr [rax + r9 + 0x88], zmm0
00f9c 62f17e486f8408c8000000         vmovdqu32  zmm0, zmmword ptr [rax + rcx + 0xc8]
00fa7 62b17e487f8408c8000000         vmovdqu32  zmmword ptr [rax + r9 + 0xc8], zmm0
00fb2 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00fb7 4181c000010000                 add        r8d, 0x100
00fbe 4503c6                         add        r8d, r14d
00fc1 458bd8                         mov        r11d, r8d
00fc4 62b17e486f840008000000         vmovdqu32  zmm0, zmmword ptr [rax + r8 + 8]
00fcf 62b17e487f840808010000         vmovdqu32  zmmword ptr [rax + r9 + 0x108], zmm0
00fda 62f17e486f840848010000         vmovdqu32  zmm0, zmmword ptr [rax + rcx + 0x148]
00fe5 62b17e487f840848010000         vmovdqu32  zmmword ptr [rax + r9 + 0x148], zmm0
00ff0 62f17e486f840888010000         vmovdqu32  zmm0, zmmword ptr [rax + rcx + 0x188]
00ffb 62b17e487f840888010000         vmovdqu32  zmmword ptr [rax + r9 + 0x188], zmm0
01006 4d63c3                         movsxd     r8, r11d
01009 62b17e486f8400c8000000         vmovdqu32  zmm0, zmmword ptr [rax + r8 + 0xc8]
01014 62b17e487f8408c8010000         vmovdqu32  zmmword ptr [rax + r9 + 0x1c8], zmm0
0101f 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
01023 81c500020000                   add        ebp, 0x200
01029 896c244c                       mov        dword ptr [rsp + 0x4c], ebp
0102d 413bea                         cmp        ebp, r10d
01030 0f8ceafeffff                   jl         0x7f53ebe793a0
01036 3bef                           cmp        ebp, edi
01038 7d48                           jge        0x7f53ebe79502
0103a 896c244c                       mov        dword ptr [rsp + 0x4c], ebp
0103e 6690                           nop        
01040 458bde                         mov        r11d, r14d
01043 44035c244c                     add        r11d, dword ptr [rsp + 0x4c]
01048 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01050 62917e486f841a08000000         vmovdqu32  zmm0, zmmword ptr [r10 + r11 + 8]
0105b 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01060 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
01068 62917e487f841008000000         vmovdqu32  zmmword ptr [r8 + r10 + 8], zmm0
01073 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
01077 83c540                         add        ebp, 0x40
0107a 896c244c                       mov        dword ptr [rsp + 0x4c], ebp
0107e 3bef                           cmp        ebp, edi
01080 7cbe                           jl         0x7f53ebe794c0
01082 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
01086 3beb                           cmp        ebp, ebx
01088 7d2a                           jge        0x7f53ebe79534
0108a 6690                           nop        
0108c 458d1c2e                       lea        r11d, [r14 + rbp]
01090 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01098 4f8b5c1a08                     mov        r11, qword ptr [r10 + r11 + 8]
0109d 448bd5                         mov        r10d, ebp
010a0 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
010a8 4f895c1008                     mov        qword ptr [r8 + r10 + 8], r11
010ad 83c508                         add        ebp, 8
010b0 3beb                           cmp        ebp, ebx
010b2 7cd8                           jl         0x7f53ebe7950c
010b4 895c2464                       mov        dword ptr [rsp + 0x64], ebx
010b8 e9d3f5ffff                     jmp        0x7f53ebe78b10
010bd 448bd0                         mov        r10d, eax
010c0 4d63d2                         movsxd     r10, r10d
010c3 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
010ca c442a8f5db                     bzhi       r11, r11, r10
010cf c4c1fb92fb                     kmovq      k7, r11
010d4 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
010da 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
010e0 eb7a                           jmp        0x7f53ebe795dc
010e2 4585c9                         test       r9d, r9d
010e5 0f8c2d1c0000                   jl         0x7f53ebe7b198
010eb 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
010f0 4585d2                         test       r10d, r10d
010f3 0f8c1f1c0000                   jl         0x7f53ebe7b198
010f9 448b9c24f8000000               mov        r11d, dword ptr [rsp + 0xf8]
01101 443b5c2460                     cmp        r11d, dword ptr [rsp + 0x60]
01106 0f820c1c0000                   jb         0x7f53ebe7b198
0110c 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01111 443bd3                         cmp        r10d, ebx
01114 0f82fe1b0000                   jb         0x7f53ebe7b198
0111a 85c0                           test       eax, eax
0111c 743e                           je         0x7f53ebe795dc
0111e 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01123 4b8d7c0a08                     lea        rdi, [r10 + r9 + 8]
01128 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01130 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01135 4b8d740208                     lea        rsi, [r10 + r8 + 8]
0113a 4883fa20                       cmp        rdx, 0x20
0113e 0f8679ffffff                   jbe        0x7f53ebe7953d
01144 c5f877                         vzeroupper 
01147 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
01151 41ffd2                         call       r10
01154 0f1f840000000000               nop        dword ptr [rax + rax]
0115c 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01160 e982f2ffff                     jmp        0x7f53ebe78867
01165 443bac249c000000               cmp        r13d, dword ptr [rsp + 0x9c]
0116d 0f83491c0000                   jae        0x7f53ebe7b23c
01173 4d63c5                         movsxd     r8, r13d
01176 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0117e c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
01185 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0118a 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
01192 0f83bc1c0000                   jae        0x7f53ebe7b2d4
01198 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0119d 418bfa                         mov        edi, r10d
011a0 418d6a10                       lea        ebp, [r10 + 0x10]
011a4 4d63da                         movsxd     r11, r10d
011a7 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
011af c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
011b6 3beb                           cmp        ebp, ebx
011b8 0f8d40020000                   jge        0x7f53ebe7987e
011be 4d2bc3                         sub        r8, r11
011c1 4c63dd                         movsxd     r11, ebp
011c4 4f8d1403                       lea        r10, [r11 + r8]
011c8 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
011d0 0f83221d0000                   jae        0x7f53ebe7b378
011d6 4d8bd1                         mov        r10, r9
011d9 4d2bd3                         sub        r10, r11
011dc 4983c20f                       add        r10, 0xf
011e0 4983e2f0                       and        r10, 0xfffffffffffffff0
011e4 458bda                         mov        r11d, r10d
011e7 448bd7                         mov        r10d, edi
011ea 478d5c1310                     lea        r11d, [r11 + r10 + 0x10]
011ef 4d63d3                         movsxd     r10, r11d
011f2 4f8d5c02f0                     lea        r11, [r10 + r8 - 0x10]
011f7 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
011ff 0f83f31c0000                   jae        0x7f53ebe7b378
01205 3bac249c000000                 cmp        ebp, dword ptr [rsp + 0x9c]
0120c 0f83e61c0000                   jae        0x7f53ebe7b378
01212 4983c2f0                       add        r10, -0x10
01216 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
0121e 0f83d41c0000                   jae        0x7f53ebe7b378
01224 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
0122a 0f8f341d0000                   jg         0x7f53ebe7b3e4
01230 442bef                         sub        r13d, edi
01233 8d4f20                         lea        ecx, [rdi + 0x20]
01236 6690                           nop        
01238 458bd5                         mov        r10d, r13d
0123b 4403d5                         add        r10d, ebp
0123e 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
01246 c4817a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 8]
0124d 448bd5                         mov        r10d, ebp
01250 c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
01257 83c510                         add        ebp, 0x10
0125a 3be9                           cmp        ebp, ecx
0125c 7cda                           jl         0x7f53ebe796b8
0125e 4981c110ffffff                 add        r9, -0xf0
01265 4981f900000080                 cmp        r9, -0x80000000
0126c 49c7c200000080                 mov        r10, 0xffffffff80000000
01273 4d0f4cca                       cmovl      r9, r10
01277 458bc9                         mov        r9d, r9d
0127a 413be9                         cmp        ebp, r9d
0127d 0f8d50010000                   jge        0x7f53ebe79853
01283 0f1f8000000000                 nop        dword ptr [rax]
0128a 660f1f440000                   nop        word ptr [rax + rax]
01290 458bd5                         mov        r10d, r13d
01293 4403d5                         add        r10d, ebp
01296 448bdd                         mov        r11d, ebp
01299 4d63db                         movsxd     r11, r11d
0129c 458bc2                         mov        r8d, r10d
0129f 8b8c2484000000                 mov        ecx, dword ptr [rsp + 0x84]
012a6 c4a17a6f440108                 vmovdqu    xmm0, xmmword ptr [rcx + r8 + 8]
012ad 4963ca                         movsxd     rcx, r10d
012b0 448bd5                         mov        r10d, ebp
012b3 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
012bb c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
012c2 c4c17a6f440818                 vmovdqu    xmm0, xmmword ptr [r8 + rcx + 0x18]
012c9 c4817a7f441818                 vmovdqu    xmmword ptr [r8 + r11 + 0x18], xmm0
012d0 c4c17a6f440828                 vmovdqu    xmm0, xmmword ptr [r8 + rcx + 0x28]
012d7 c4817a7f441828                 vmovdqu    xmmword ptr [r8 + r11 + 0x28], xmm0
012de c4c17a6f440838                 vmovdqu    xmm0, xmmword ptr [r8 + rcx + 0x38]
012e5 c4817a7f441838                 vmovdqu    xmmword ptr [r8 + r11 + 0x38], xmm0
012ec c4c17a6f440848                 vmovdqu    xmm0, xmmword ptr [r8 + rcx + 0x48]
012f3 c4817a7f441848                 vmovdqu    xmmword ptr [r8 + r11 + 0x48], xmm0
012fa c4c17a6f440858                 vmovdqu    xmm0, xmmword ptr [r8 + rcx + 0x58]
01301 c4817a7f441858                 vmovdqu    xmmword ptr [r8 + r11 + 0x58], xmm0
01308 c4c17a6f440868                 vmovdqu    xmm0, xmmword ptr [r8 + rcx + 0x68]
0130f c4817a7f441868                 vmovdqu    xmmword ptr [r8 + r11 + 0x68], xmm0
01316 c4c17a6f440878                 vmovdqu    xmm0, xmmword ptr [r8 + rcx + 0x78]
0131d c4817a7f441878                 vmovdqu    xmmword ptr [r8 + r11 + 0x78], xmm0
01324 c4c17a6f840888000000           vmovdqu    xmm0, xmmword ptr [r8 + rcx + 0x88]
0132e c4817a7f841888000000           vmovdqu    xmmword ptr [r8 + r11 + 0x88], xmm0
01338 c4c17a6f840898000000           vmovdqu    xmm0, xmmword ptr [r8 + rcx + 0x98]
01342 c4817a7f841898000000           vmovdqu    xmmword ptr [r8 + r11 + 0x98], xmm0
0134c c4c17a6f8408a8000000           vmovdqu    xmm0, xmmword ptr [r8 + rcx + 0xa8]
01356 c4817a7f8418a8000000           vmovdqu    xmmword ptr [r8 + r11 + 0xa8], xmm0
01360 c4c17a6f8408b8000000           vmovdqu    xmm0, xmmword ptr [r8 + rcx + 0xb8]
0136a c4817a7f8418b8000000           vmovdqu    xmmword ptr [r8 + r11 + 0xb8], xmm0
01374 c4c17a6f8408c8000000           vmovdqu    xmm0, xmmword ptr [r8 + rcx + 0xc8]
0137e c4817a7f8418c8000000           vmovdqu    xmmword ptr [r8 + r11 + 0xc8], xmm0
01388 c4c17a6f8408d8000000           vmovdqu    xmm0, xmmword ptr [r8 + rcx + 0xd8]
01392 c4817a7f8418d8000000           vmovdqu    xmmword ptr [r8 + r11 + 0xd8], xmm0
0139c c4c17a6f8408e8000000           vmovdqu    xmm0, xmmword ptr [r8 + rcx + 0xe8]
013a6 c4817a7f8418e8000000           vmovdqu    xmmword ptr [r8 + r11 + 0xe8], xmm0
013b0 c4c17a6f8408f8000000           vmovdqu    xmm0, xmmword ptr [r8 + rcx + 0xf8]
013ba c4817a7f8418f8000000           vmovdqu    xmmword ptr [r8 + r11 + 0xf8], xmm0
013c4 81c500010000                   add        ebp, 0x100
013ca 413be9                         cmp        ebp, r9d
013cd 0f8cbdfeffff                   jl         0x7f53ebe79710
013d3 3beb                           cmp        ebp, ebx
013d5 7d27                           jge        0x7f53ebe7987e
013d7 90                             nop        
013d8 458bd5                         mov        r10d, r13d
013db 4403d5                         add        r10d, ebp
013de 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
013e6 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
013ed 448bd5                         mov        r10d, ebp
013f0 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
013f7 83c510                         add        ebp, 0x10
013fa 3beb                           cmp        ebp, ebx
013fc 7cda                           jl         0x7f53ebe79858
013fe 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01402 e989f2ffff                     jmp        0x7f53ebe78b10
01407 4803d9                         add        rbx, rcx
0140a 483b5c2440                     cmp        rbx, qword ptr [rsp + 0x40]
0140f 7e08                           jle        0x7f53ebe79899
01411 4533c0                         xor        r8d, r8d
01414 e99becffff                     jmp        0x7f53ebe78534
01419 4533c0                         xor        r8d, r8d
0141c bb01000000                     mov        ebx, 1
01421 e990ecffff                     jmp        0x7f53ebe78536
01426 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0142e 4d8bd3                         mov        r10, r11
01431 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
01439 418be9                         mov        ebp, r9d
0143c 4489b424f0000000               mov        dword ptr [rsp + 0xf0], r14d
01444 898424f4000000                 mov        dword ptr [rsp + 0xf4], eax
0144b 498bf2                         mov        rsi, r10
0144e 8b542464                       mov        edx, dword ptr [rsp + 0x64]
01452 8b8c2480000000                 mov        ecx, dword ptr [rsp + 0x80]
01459 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
0145e 8bf8                           mov        edi, eax
01460 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
01468 44891424                       mov        dword ptr [rsp], r10d
0146c 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01471 4489542408                     mov        dword ptr [rsp + 8], r10d
01476 6690                           nop        
01478 c5f877                         vzeroupper 
0147b e8601fa8ff                     call       0x7f53eb8fb860
01480 0f1f840078150002               nop        dword ptr [rax + rax + 0x2001578]
01488 89442464                       mov        dword ptr [rsp + 0x64], eax
0148c e9fff1ffff                     jmp        0x7f53ebe78b10
01491 bee4ffffff                     mov        esi, 0xffffffe4
01496 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0149b 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
014a0 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
014a8 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
014ad 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
014b5 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
014ba 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
014c2 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
014c7 4c89542410                     mov        qword ptr [rsp + 0x10], r10
014cc 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
014d1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
014d6 4489742428                     mov        dword ptr [rsp + 0x28], r14d
014db 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
014e0 4c89542430                     mov        qword ptr [rsp + 0x30], r10
014e5 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
014ea 4c89542438                     mov        qword ptr [rsp + 0x38], r10
014ef 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
014f4 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
014f9 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
014fe 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01503 89442448                       mov        dword ptr [rsp + 0x48], eax
01507 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0150c 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01511 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
01516 6690                           nop        
01518 c5f877                         vzeroupper 
0151b e8c09cb4ff                     call       0x7f53eb9c3660
01520 0f1f840018160003               nop        dword ptr [rax + rax + 0x3001618]
01528 bee4ffffff                     mov        esi, 0xffffffe4
0152d 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01532 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01537 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
0153f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01544 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0154c 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01551 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01559 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0155e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01563 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0156b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01570 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01575 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0157a 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0157f 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01584 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01589 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0158e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01593 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01598 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0159d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
015a2 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
015a7 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
015ac 89442448                       mov        dword ptr [rsp + 0x48], eax
015b0 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
015b5 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
015ba 48894424f8                     mov        qword ptr [rsp - 8], rax
015bf 8b442464                       mov        eax, dword ptr [rsp + 0x64]
015c3 89442458                       mov        dword ptr [rsp + 0x58], eax
015c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015cc c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
015d2 6690                           nop        
015d4 c5f877                         vzeroupper 
015d7 e8049cb4ff                     call       0x7f53eb9c3660
015dc 0f1f8400d4160004               nop        dword ptr [rax + rax + 0x40016d4]
015e4 bee4ffffff                     mov        esi, 0xffffffe4
015e9 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
015ee 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
015f3 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
015fb 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01600 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01608 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0160d 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01615 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0161a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0161f 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01627 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0162c 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01631 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01636 4489742428                     mov        dword ptr [rsp + 0x28], r14d
0163b 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01640 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01645 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0164a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0164f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01654 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01659 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
0165e 6690                           nop        
01660 c5f877                         vzeroupper 
01663 e8789bb4ff                     call       0x7f53eb9c3660
01668 0f1f840060170005               nop        dword ptr [rax + rax + 0x5001760]
01670 bee4ffffff                     mov        esi, 0xffffffe4
01675 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0167a 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0167f 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01687 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0168c 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01694 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01699 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
016a1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
016a6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
016ab 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
016b3 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
016b8 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
016bd 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
016c2 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
016c7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
016cc 4489742428                     mov        dword ptr [rsp + 0x28], r14d
016d1 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
016d6 4c89542430                     mov        qword ptr [rsp + 0x30], r10
016db 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
016e0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
016e5 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
016ea 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
016ef 895c2450                       mov        dword ptr [rsp + 0x50], ebx
016f3 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
016f9 666690                         nop        
016fc c5f877                         vzeroupper 
016ff e8dc9ab4ff                     call       0x7f53eb9c3660
01704 0f1f8400fc170006               nop        dword ptr [rax + rax + 0x60017fc]
0170c be45ffffff                     mov        esi, 0xffffff45
01711 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
01719 666690                         nop        
0171c c5f877                         vzeroupper 
0171f e8bc9ab4ff                     call       0x7f53eb9c3660
01724 0f1f84001c180007               nop        dword ptr [rax + rax + 0x700181c]
0172c be45ffffff                     mov        esi, 0xffffff45
01731 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01736 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0173b 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01743 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01748 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01750 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01755 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
0175d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01762 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01767 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
0176c 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01771 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01776 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0177b 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01780 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01785 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0178a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0178f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01794 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01799 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0179e 4489442444                     mov        dword ptr [rsp + 0x44], r8d
017a3 89442448                       mov        dword ptr [rsp + 0x48], eax
017a7 894c2450                       mov        dword ptr [rsp + 0x50], ecx
017ab 90                             nop        
017ac c5f877                         vzeroupper 
017af e82c9ab4ff                     call       0x7f53eb9c3660
017b4 0f1f8400ac180008               nop        dword ptr [rax + rax + 0x80018ac]
017bc 493bda                         cmp        rbx, r10
017bf bdffffffff                     mov        ebp, 0xffffffff
017c4 7c08                           jl         0x7f53ebe79c4e
017c6 400f95c5                       setne      bpl
017ca 400fb6ed                       movzx      ebp, bpl
017ce be45ffffff                     mov        esi, 0xffffff45
017d3 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
017d8 44898424f8000000               mov        dword ptr [rsp + 0xf8], r8d
017e0 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
017e5 44898424fc000000               mov        dword ptr [rsp + 0xfc], r8d
017ed 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
017f2 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
017f7 48894424f8                     mov        qword ptr [rsp - 8], rax
017fc 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01800 89442420                       mov        dword ptr [rsp + 0x20], eax
01804 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01809 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0180e 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01813 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01818 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0181d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01822 89442450                       mov        dword ptr [rsp + 0x50], eax
01826 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0182b 90                             nop        
0182c c5f877                         vzeroupper 
0182f e8ac99b4ff                     call       0x7f53eb9c3660
01834 0f1f84002c190009               nop        dword ptr [rax + rax + 0x900192c]
0183c be45ffffff                     mov        esi, 0xffffff45
01841 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01846 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0184b 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01853 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01858 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01860 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01865 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
0186d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01872 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01877 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
0187c 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01881 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01886 4489742428                     mov        dword ptr [rsp + 0x28], r14d
0188b 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01890 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01895 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0189a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0189f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
018a4 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
018a9 89442448                       mov        dword ptr [rsp + 0x48], eax
018ad 666690                         nop        
018b0 c5f877                         vzeroupper 
018b3 e82899b4ff                     call       0x7f53eb9c3660
018b8 0f1f8400b019000a               nop        dword ptr [rax + rax + 0xa0019b0]
018c0 bee4ffffff                     mov        esi, 0xffffffe4
018c5 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
018ca 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
018cf 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
018d7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
018dc 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
018e4 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
018e9 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
018f1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
018f6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
018fb 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01903 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01908 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0190d 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01912 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01917 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0191c 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01921 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01926 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0192b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01930 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01935 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0193a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0193f 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01944 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01949 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0194e 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01953 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01957 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0195c 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01961 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01966 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
0196b 90                             nop        
0196c c5f877                         vzeroupper 
0196f e86c98b4ff                     call       0x7f53eb9c3660
01974 0f1f84006c1a000b               nop        dword ptr [rax + rax + 0xb001a6c]
0197c bee4ffffff                     mov        esi, 0xffffffe4
01981 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01986 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0198b 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01993 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01998 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
019a0 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
019a5 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
019ad 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
019b2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
019b7 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
019bc 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
019c1 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
019c6 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
019cb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
019d0 4489742428                     mov        dword ptr [rsp + 0x28], r14d
019d5 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
019da 4c89542430                     mov        qword ptr [rsp + 0x30], r10
019df 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
019e4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
019e9 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
019ee 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
019f3 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
019f8 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
019fd 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01a02 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01a07 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01a0b 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
01a10 48894c2458                     mov        qword ptr [rsp + 0x58], rcx
01a15 666690                         nop        
01a18 c5f877                         vzeroupper 
01a1b e8c097b4ff                     call       0x7f53eb9c3660
01a20 0f1f8400181b000c               nop        dword ptr [rax + rax + 0xc001b18]
01a28 4c8b442438                     mov        r8, qword ptr [rsp + 0x38]
01a2d 4d3bd8                         cmp        r11, r8
01a30 bdffffffff                     mov        ebp, 0xffffffff
01a35 7c08                           jl         0x7f53ebe79ebf
01a37 400f95c5                       setne      bpl
01a3b 400fb6ed                       movzx      ebp, bpl
01a3f be45ffffff                     mov        esi, 0xffffff45
01a44 8b4c240c                       mov        ecx, dword ptr [rsp + 0xc]
01a48 898c24f8000000                 mov        dword ptr [rsp + 0xf8], ecx
01a4f 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01a54 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
01a5c 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
01a61 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01a66 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01a6b 4c89442430                     mov        qword ptr [rsp + 0x30], r8
01a70 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01a75 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
01a7a 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01a7f 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01a84 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01a89 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01a8e 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01a92 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01a97 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01a9c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01aa1 666690                         nop        
01aa4 c5f877                         vzeroupper 
01aa7 e83497b4ff                     call       0x7f53eb9c3660
01aac 0f1f8400a41b000d               nop        dword ptr [rax + rax + 0xd001ba4]
01ab4 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
01ab9 493be8                         cmp        rbp, r8
01abc bdffffffff                     mov        ebp, 0xffffffff
01ac1 7c08                           jl         0x7f53ebe79f4b
01ac3 400f95c5                       setne      bpl
01ac7 400fb6ed                       movzx      ebp, bpl
01acb be45ffffff                     mov        esi, 0xffffff45
01ad0 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01ad5 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
01add 8b4c2418                       mov        ecx, dword ptr [rsp + 0x18]
01ae1 898c24fc000000                 mov        dword ptr [rsp + 0xfc], ecx
01ae8 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
01aed 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01af2 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01af7 4c8b5c2438                     mov        r11, qword ptr [rsp + 0x38]
01afc 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
01b01 4c89442438                     mov        qword ptr [rsp + 0x38], r8
01b06 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01b0b 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01b10 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01b15 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01b1a 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01b1e 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01b23 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01b28 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01b2d 666690                         nop        
01b30 c5f877                         vzeroupper 
01b33 e8a896b4ff                     call       0x7f53eb9c3660
01b38 0f1f8400301c000e               nop        dword ptr [rax + rax + 0xe001c30]
01b40 4183c508                       add        r13d, 8
01b44 be6effffff                     mov        esi, 0xffffff6e
01b49 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01b4e 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01b53 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01b5b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01b60 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01b68 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01b6d 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01b75 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01b7a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01b7f 4489442418                     mov        dword ptr [rsp + 0x18], r8d
01b84 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01b89 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01b8e 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01b93 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01b98 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01b9d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01ba2 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01ba7 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01bac 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01bb1 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01bb6 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01bbb 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01bc0 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01bc5 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
01bca 897c2458                       mov        dword ptr [rsp + 0x58], edi
01bce 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
01bd2 6690                           nop        
01bd4 c5f877                         vzeroupper 
01bd7 e80496b4ff                     call       0x7f53eb9c3660
01bdc 0f1f8400d41c000f               nop        dword ptr [rax + rax + 0xf001cd4]
01be4 4183c508                       add        r13d, 8
01be8 be66ffffff                     mov        esi, 0xffffff66
01bed 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01bf2 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01bf7 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01bff 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01c04 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01c0c 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01c11 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01c19 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01c1e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01c23 4489442418                     mov        dword ptr [rsp + 0x18], r8d
01c28 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01c2d 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01c32 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01c37 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01c3c 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01c41 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01c46 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01c4b 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01c50 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01c55 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01c5a 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01c5f 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01c64 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01c69 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
01c6e 897c2458                       mov        dword ptr [rsp + 0x58], edi
01c72 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
01c76 6690                           nop        
01c78 c5f877                         vzeroupper 
01c7b e86095b4ff                     call       0x7f53eb9c3660
01c80 0f1f8400781d0010               nop        dword ptr [rax + rax + 0x10001d78]
01c88 beccffffff                     mov        esi, 0xffffffcc
01c8d 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01c92 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01c97 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01c9f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01ca4 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01cac 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01cb1 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01cb9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01cbe 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01cc3 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01ccb 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01cd0 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01cd5 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01cda 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01cdf 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01ce4 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01ce9 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01cee 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01cf3 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01cf8 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01cfd 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01d02 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01d07 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
01d0c c5f877                         vzeroupper 
01d0f e8cc94b4ff                     call       0x7f53eb9c3660
01d14 0f1f84000c1e0011               nop        dword ptr [rax + rax + 0x11001e0c]
01d1c 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01d21 458bde                         mov        r11d, r14d
01d24 44035c244c                     add        r11d, dword ptr [rsp + 0x4c]
01d29 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
01d31 4f8b441908                     mov        r8, qword ptr [r9 + r11 + 8]
01d36 4f89441108                     mov        qword ptr [r9 + r10 + 8], r8
01d3b 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01d40 4183c208                       add        r10d, 8
01d44 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01d49 443bd1                         cmp        r10d, ecx
01d4c 7cce                           jl         0x7f53ebe7a19c
01d4e 443bd7                         cmp        r10d, edi
01d51 0f8d93000000                   jge        0x7f53ebe7a26a
01d57 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01d5c 0f1f4000                       nop        dword ptr [rax]
01d60 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01d65 4963ca                         movsxd     rcx, r10d
01d68 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01d6d 458bc6                         mov        r8d, r14d
01d70 440344244c                     add        r8d, dword ptr [rsp + 0x4c]
01d75 458bd8                         mov        r11d, r8d
01d78 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
01d80 4f8b440108                     mov        r8, qword ptr [r9 + r8 + 8]
01d85 4f89441108                     mov        qword ptr [r9 + r10 + 8], r8
01d8a 4d63c3                         movsxd     r8, r11d
01d8d 4f8b540110                     mov        r10, qword ptr [r9 + r8 + 0x10]
01d92 4d89540910                     mov        qword ptr [r9 + rcx + 0x10], r10
01d97 4f8b540118                     mov        r10, qword ptr [r9 + r8 + 0x18]
01d9c 4d89540918                     mov        qword ptr [r9 + rcx + 0x18], r10
01da1 4f8b540120                     mov        r10, qword ptr [r9 + r8 + 0x20]
01da6 4d89540920                     mov        qword ptr [r9 + rcx + 0x20], r10
01dab 4f8b540128                     mov        r10, qword ptr [r9 + r8 + 0x28]
01db0 4d89540928                     mov        qword ptr [r9 + rcx + 0x28], r10
01db5 4f8b540130                     mov        r10, qword ptr [r9 + r8 + 0x30]
01dba 4d89540930                     mov        qword ptr [r9 + rcx + 0x30], r10
01dbf 4f8b540138                     mov        r10, qword ptr [r9 + r8 + 0x38]
01dc4 4d89540938                     mov        qword ptr [r9 + rcx + 0x38], r10
01dc9 4f8b540140                     mov        r10, qword ptr [r9 + r8 + 0x40]
01dce 4d89540940                     mov        qword ptr [r9 + rcx + 0x40], r10
01dd3 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01dd8 4183c340                       add        r11d, 0x40
01ddc 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01de1 443bdf                         cmp        r11d, edi
01de4 0f8c76ffffff                   jl         0x7f53ebe7a1e0
01dea 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01def 443bd3                         cmp        r10d, ebx
01df2 0f8dbcf2ffff                   jge        0x7f53ebe79534
01df8 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01dfd 458bcb                         mov        r9d, r11d
01e00 478d1c0e                       lea        r11d, [r14 + r9]
01e04 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
01e0c 4f8b441808                     mov        r8, qword ptr [r8 + r11 + 8]
01e11 458bd1                         mov        r10d, r9d
01e14 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01e1c 4f89441308                     mov        qword ptr [r11 + r10 + 8], r8
01e21 458d5108                       lea        r10d, [r9 + 8]
01e25 458bca                         mov        r9d, r10d
01e28 443bd3                         cmp        r10d, ebx
01e2b 7cd3                           jl         0x7f53ebe7a280
01e2d e982f2ffff                     jmp        0x7f53ebe79534
01e32 bee4ffffff                     mov        esi, 0xffffffe4
01e37 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01e3c 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01e41 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01e49 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01e4e 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01e56 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01e5b 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01e63 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01e68 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01e6d 48894424f8                     mov        qword ptr [rsp - 8], rax
01e72 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01e76 89442418                       mov        dword ptr [rsp + 0x18], eax
01e7a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e7f 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01e84 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01e89 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01e8e 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01e93 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01e98 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01e9d 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01ea2 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01ea7 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01eac 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01eb1 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01eb6 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01ebb 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01ec0 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01ec5 89442448                       mov        dword ptr [rsp + 0x48], eax
01ec9 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01ecd 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
01ed1 666690                         nop        
01ed4 c5f877                         vzeroupper 
01ed7 e80493b4ff                     call       0x7f53eb9c3660
01edc 0f1f8400d41f0012               nop        dword ptr [rax + rax + 0x12001fd4]
01ee4 beccffffff                     mov        esi, 0xffffffcc
01ee9 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01eee 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
01ef6 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01efb 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
01f03 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01f08 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f0d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01f15 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f1a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01f1f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01f24 4489742424                     mov        dword ptr [rsp + 0x24], r14d
01f29 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01f2e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01f33 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01f38 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01f3d 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01f42 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01f47 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01f4c 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01f51 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01f56 4489542454                     mov        dword ptr [rsp + 0x54], r10d
01f5b 90                             nop        
01f5c c5f877                         vzeroupper 
01f5f e87c92b4ff                     call       0x7f53eb9c3660
01f64 0f1f84005c200013               nop        dword ptr [rax + rax + 0x1300205c]
01f6c bee4ffffff                     mov        esi, 0xffffffe4
01f71 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01f76 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01f7b 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01f83 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01f88 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01f90 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01f95 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01f9d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01fa2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01fa7 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01faf 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01fb4 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01fb9 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01fbe 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01fc3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01fc8 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
01fcd 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01fd2 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01fd7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01fdc 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01fe1 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01fe6 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01feb 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01ff0 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01ff5 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01ffa 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
01fff 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02004 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02009 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
0200e 6690                           nop        
02010 c5f877                         vzeroupper 
02013 e8c891b4ff                     call       0x7f53eb9c3660
02018 0f1f840010210014               nop        dword ptr [rax + rax + 0x14002110]
02020 bee4ffffff                     mov        esi, 0xffffffe4
02025 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0202a 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02032 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02037 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
0203f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02044 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02049 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02051 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02056 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0205b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02060 4489742424                     mov        dword ptr [rsp + 0x24], r14d
02065 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0206a 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0206f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02074 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02079 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0207e 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02083 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02088 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0208d 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
02092 6690                           nop        
02094 c5f877                         vzeroupper 
02097 e84491b4ff                     call       0x7f53eb9c3660
0209c 0f1f840094210015               nop        dword ptr [rax + rax + 0x15002194]
020a4 418d6d01                       lea        ebp, [r13 + 1]
020a8 bee4ffffff                     mov        esi, 0xffffffe4
020ad 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
020b2 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
020ba 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
020bf 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
020c7 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
020cc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
020d1 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
020d9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
020de 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
020e3 4489542420                     mov        dword ptr [rsp + 0x20], r10d
020e8 4489742424                     mov        dword ptr [rsp + 0x24], r14d
020ed 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
020f2 4c89542430                     mov        qword ptr [rsp + 0x30], r10
020f7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
020fc 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02101 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02106 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0210b 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02110 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02115 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0211a 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0211f 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
02124 c5f877                         vzeroupper 
02127 e8b490b4ff                     call       0x7f53eb9c3660
0212c 0f1f840024220016               nop        dword ptr [rax + rax + 0x16002224]
02134 bee4ffffff                     mov        esi, 0xffffffe4
02139 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0213e 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02146 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0214b 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02153 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02158 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0215d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02165 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0216a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0216f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02174 4489742424                     mov        dword ptr [rsp + 0x24], r14d
02179 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0217e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02183 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02188 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0218d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02192 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02197 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0219c 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
021a1 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
021a6 6690                           nop        
021a8 c5f877                         vzeroupper 
021ab e83090b4ff                     call       0x7f53eb9c3660
021b0 0f1f8400a8220017               nop        dword ptr [rax + rax + 0x170022a8]
021b8 bee4ffffff                     mov        esi, 0xffffffe4
021bd 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
021c2 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
021c7 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
021cf 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
021d4 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
021dc 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
021e1 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
021e9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
021ee 4c89542410                     mov        qword ptr [rsp + 0x10], r10
021f3 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
021fb 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02200 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02205 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0220a 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
0220f 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02214 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02219 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0221e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02223 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02228 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0222d 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02232 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02237 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
0223c c5f877                         vzeroupper 
0223f e89c8fb4ff                     call       0x7f53eb9c3660
02244 0f1f84003c230018               nop        dword ptr [rax + rax + 0x1800233c]
0224c bee4ffffff                     mov        esi, 0xffffffe4
02251 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02256 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0225b 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02263 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02268 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02270 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02275 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
0227d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02282 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02287 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0228f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02294 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02299 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0229e 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
022a3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
022a8 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
022ad 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
022b2 4c89542428                     mov        qword ptr [rsp + 0x28], r10
022b7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
022bc 4c89542430                     mov        qword ptr [rsp + 0x30], r10
022c1 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
022c6 4489542438                     mov        dword ptr [rsp + 0x38], r10d
022cb 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
022d0 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
022d5 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
022da 4489542450                     mov        dword ptr [rsp + 0x50], r10d
022df 44896c2460                     mov        dword ptr [rsp + 0x60], r13d
022e4 c5f877                         vzeroupper 
022e7 e8f48eb4ff                     call       0x7f53eb9c3660
022ec 0f1f8400e4230019               nop        dword ptr [rax + rax + 0x190023e4]
022f4 bee4ffffff                     mov        esi, 0xffffffe4
022f9 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
022fe 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02306 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0230b 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02313 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02318 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0231d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02325 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0232a 4489742424                     mov        dword ptr [rsp + 0x24], r14d
0232f 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02334 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02339 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0233e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02343 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02348 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0234d 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02352 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02357 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0235c 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02361 666690                         nop        
02364 c5f877                         vzeroupper 
02367 e8748eb4ff                     call       0x7f53eb9c3660
0236c 0f1f84006424001a               nop        dword ptr [rax + rax + 0x1a002464]
02374 4585c9                         test       r9d, r9d
02377 0f84530c0000                   je         0x7f53ebe7b450
0237d 4d8bd9                         mov        r11, r9
02380 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02385 4533c0                         xor        r8d, r8d
02388 e90fe9ffff                     jmp        0x7f53ebe7911c
0238d be6effffff                     mov        esi, 0xffffff6e
02392 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02397 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0239c 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
023a4 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
023a9 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
023b1 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
023b6 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
023be 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
023c3 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
023c8 4c89542420                     mov        qword ptr [rsp + 0x20], r10
023cd 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
023d2 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
023d7 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
023dc 4c89542430                     mov        qword ptr [rsp + 0x30], r10
023e1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
023e6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
023eb 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
023f0 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
023f5 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
023fa 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
023ff 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02404 89442448                       mov        dword ptr [rsp + 0x48], eax
02408 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0240d 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02412 895c2458                       mov        dword ptr [rsp + 0x58], ebx
02416 894c2460                       mov        dword ptr [rsp + 0x60], ecx
0241a 6690                           nop        
0241c c5f877                         vzeroupper 
0241f e8bc8db4ff                     call       0x7f53eb9c3660
02424 0f1f84001c25001b               nop        dword ptr [rax + rax + 0x1b00251c]
0242c be45ffffff                     mov        esi, 0xffffff45
02431 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02436 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0243b 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02443 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02448 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02450 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02455 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
0245d 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
02462 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02467 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0246c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
02471 4489542428                     mov        dword ptr [rsp + 0x28], r10d
02476 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0247b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02480 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02485 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0248a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0248f 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
02494 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02499 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0249e 4489442444                     mov        dword ptr [rsp + 0x44], r8d
024a3 89442448                       mov        dword ptr [rsp + 0x48], eax
024a7 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
024ab 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
024af 90                             nop        
024b0 c5f877                         vzeroupper 
024b3 e8288db4ff                     call       0x7f53eb9c3660
024b8 0f1f8400b025001c               nop        dword ptr [rax + rax + 0x1c0025b0]
024c0 be3dffffff                     mov        esi, 0xffffff3d
024c5 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
024ca 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
024cf 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
024d7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
024dc 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
024e4 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
024e9 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
024f1 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
024f6 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
024fb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02500 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
02505 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0250a 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0250f 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02514 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02519 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0251e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02523 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
02528 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0252d 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02532 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02537 89442448                       mov        dword ptr [rsp + 0x48], eax
0253b 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
0253f 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
02543 90                             nop        
02544 c5f877                         vzeroupper 
02547 e8948cb4ff                     call       0x7f53eb9c3660
0254c 0f1f84004426001d               nop        dword ptr [rax + rax + 0x1d002644]
02554 bee4ffffff                     mov        esi, 0xffffffe4
02559 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0255e 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02566 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0256b 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02573 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02578 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0257d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02585 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0258a 4489742424                     mov        dword ptr [rsp + 0x24], r14d
0258f 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02594 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02599 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0259e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
025a3 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
025a8 4489542440                     mov        dword ptr [rsp + 0x40], r10d
025ad 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
025b2 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
025b7 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
025bc 4489542450                     mov        dword ptr [rsp + 0x50], r10d
025c1 666690                         nop        
025c4 c5f877                         vzeroupper 
025c7 e8148cb4ff                     call       0x7f53eb9c3660
025cc 0f1f8400c426001e               nop        dword ptr [rax + rax + 0x1e0026c4]
025d4 bee4ffffff                     mov        esi, 0xffffffe4
025d9 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
025de 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
025e6 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
025eb 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
025f3 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
025f8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
025fd 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02605 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0260a 4489742424                     mov        dword ptr [rsp + 0x24], r14d
0260f 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02614 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02619 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0261e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02623 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02628 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0262d 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02632 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02637 90                             nop        
02638 c5f877                         vzeroupper 
0263b e8a08bb4ff                     call       0x7f53eb9c3660
02640 0f1f84003827001f               nop        dword ptr [rax + rax + 0x1f002738]
02648 beccffffff                     mov        esi, 0xffffffcc
0264d 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02652 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02657 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
0265f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02664 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0266c 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02671 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
02679 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0267e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02683 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0268b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02690 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02695 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0269a 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0269f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
026a4 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
026a9 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
026ae 4c89542428                     mov        qword ptr [rsp + 0x28], r10
026b3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
026b8 4c89542430                     mov        qword ptr [rsp + 0x30], r10
026bd 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
026c2 4489542438                     mov        dword ptr [rsp + 0x38], r10d
026c7 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
026cc 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
026d1 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
026d6 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
026db 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
026e0 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
026e5 4489542460                     mov        dword ptr [rsp + 0x60], r10d
026ea 6690                           nop        
026ec c5f877                         vzeroupper 
026ef e8ec8ab4ff                     call       0x7f53eb9c3660
026f4 0f1f8400ec270020               nop        dword ptr [rax + rax + 0x200027ec]
026fc bee4ffffff                     mov        esi, 0xffffffe4
02701 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02706 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0270b 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02713 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02718 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02720 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02725 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
0272d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02732 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02737 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0273c 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02741 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
02746 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0274b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02750 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02755 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0275a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0275f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02764 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02769 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0276e 89442444                       mov        dword ptr [rsp + 0x44], eax
02772 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02777 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0277c 895c2450                       mov        dword ptr [rsp + 0x50], ebx
02780 48894424f8                     mov        qword ptr [rsp - 8], rax
02785 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02789 89442454                       mov        dword ptr [rsp + 0x54], eax
0278d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02792 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
02797 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
0279c c5f877                         vzeroupper 
0279f e83c8ab4ff                     call       0x7f53eb9c3660
027a4 0f1f84009c280021               nop        dword ptr [rax + rax + 0x2100289c]
027ac c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
027b5 bee4ffffff                     mov        esi, 0xffffffe4
027ba 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
027bf 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
027c4 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
027cc 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
027d1 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
027d9 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
027de 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
027e6 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
027eb 4c89542410                     mov        qword ptr [rsp + 0x10], r10
027f0 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
027f8 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
027fd 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02802 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02807 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
0280c 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02811 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02816 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0281b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02820 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02825 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0282a 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0282f 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02834 89442444                       mov        dword ptr [rsp + 0x44], eax
02838 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0283d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02842 895c2450                       mov        dword ptr [rsp + 0x50], ebx
02846 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
0284b 48894424f8                     mov        qword ptr [rsp - 8], rax
02850 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02854 89442460                       mov        dword ptr [rsp + 0x60], eax
02858 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0285d 666690                         nop        
02860 c5f877                         vzeroupper 
02863 e87889b4ff                     call       0x7f53eb9c3660
02868 0f1f840060290022               nop        dword ptr [rax + rax + 0x22002960]
02870 418be9                         mov        ebp, r9d
02873 83c510                         add        ebp, 0x10
02876 be6effffff                     mov        esi, 0xffffff6e
0287b 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02880 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02888 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0288d 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02895 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0289a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0289f 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
028a4 4489742424                     mov        dword ptr [rsp + 0x24], r14d
028a9 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
028ae 4c89542430                     mov        qword ptr [rsp + 0x30], r10
028b3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
028b8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
028bd 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
028c2 4489542440                     mov        dword ptr [rsp + 0x40], r10d
028c7 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
028cc 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
028d1 8944244c                       mov        dword ptr [rsp + 0x4c], eax
028d5 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
028da 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
028df 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
028e3 90                             nop        
028e4 c5f877                         vzeroupper 
028e7 e8f488b4ff                     call       0x7f53eb9c3660
028ec 0f1f8400e4290023               nop        dword ptr [rax + rax + 0x230029e4]
028f4 418be9                         mov        ebp, r9d
028f7 83c510                         add        ebp, 0x10
028fa be66ffffff                     mov        esi, 0xffffff66
028ff 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02904 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
0290c 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02911 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02919 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0291e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02923 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
02928 4489742424                     mov        dword ptr [rsp + 0x24], r14d
0292d 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02932 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02937 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0293c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02941 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02946 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0294b 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02950 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02955 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02959 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0295e 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02963 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
02967 90                             nop        
02968 c5f877                         vzeroupper 
0296b e87088b4ff                     call       0x7f53eb9c3660
02970 0f1f8400682a0024               nop        dword ptr [rax + rax + 0x24002a68]
02978 be17000000                     mov        esi, 0x17
0297d 666690                         nop        
02980 c5f877                         vzeroupper 
02983 e85888b4ff                     call       0x7f53eb9c3660
02988 0f1f8400802a0025               nop        dword ptr [rax + rax + 0x25002a80]
02990 be6effffff                     mov        esi, 0xffffff6e
02995 48899424f0000000               mov        qword ptr [rsp + 0xf0], rdx
0299d 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
029a2 48ff742428                     push       qword ptr [rsp + 0x28]
029a7 488f442420                     pop        qword ptr [rsp + 0x20]
029ac 895c2428                       mov        dword ptr [rsp + 0x28], ebx
029b0 4c89442430                     mov        qword ptr [rsp + 0x30], r8
029b5 48ff742440                     push       qword ptr [rsp + 0x40]
029ba 488f442438                     pop        qword ptr [rsp + 0x38]
029bf 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
029c3 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
029c8 4c89742448                     mov        qword ptr [rsp + 0x48], r14
029cd 666690                         nop        
029d0 c5f877                         vzeroupper 
029d3 e80888b4ff                     call       0x7f53eb9c3660
029d8 0f1f8400d02a0026               nop        dword ptr [rax + rax + 0x26002ad0]
029e0 bebeffffff                     mov        esi, 0xffffffbe
029e5 4c89ac24f0000000               mov        qword ptr [rsp + 0xf0], r13
029ed 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
029f2 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
029fa 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
029ff 4889442418                     mov        qword ptr [rsp + 0x18], rax
02a04 48ff742428                     push       qword ptr [rsp + 0x28]
02a09 488f442420                     pop        qword ptr [rsp + 0x20]
02a0e 895c2428                       mov        dword ptr [rsp + 0x28], ebx
02a12 4c89442430                     mov        qword ptr [rsp + 0x30], r8
02a17 48ff742440                     push       qword ptr [rsp + 0x40]
02a1c 488f442438                     pop        qword ptr [rsp + 0x38]
02a21 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
02a25 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
02a2a 4c89742448                     mov        qword ptr [rsp + 0x48], r14
02a2f 90                             nop        
02a30 c5f877                         vzeroupper 
02a33 e8a887b4ff                     call       0x7f53eb9c3660
02a38 0f1f8400302b0027               nop        dword ptr [rax + rax + 0x27002b30]
02a40 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
02a45 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
02a4a bef6ffffff                     mov        esi, 0xfffffff6
02a4f 498bed                         mov        rbp, r13
02a52 44898c24f0000000               mov        dword ptr [rsp + 0xf0], r9d
02a5a 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02a62 6690                           nop        
02a64 c5f877                         vzeroupper 
02a67 e87487b4ff                     call       0x7f53eb9c3660
02a6c 0f1f8400642b0028               nop        dword ptr [rax + rax + 0x28002b64]
02a74 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02a78 eb10                           jmp        0x7f53ebe7af0a
02a7a 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02a7e eb0a                           jmp        0x7f53ebe7af0a
02a80 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02a84 eb04                           jmp        0x7f53ebe7af0a
02a86 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02a8a beccffffff                     mov        esi, 0xffffffcc
02a8f 4c89ac24f0000000               mov        qword ptr [rsp + 0xf0], r13
02a97 44898424f8000000               mov        dword ptr [rsp + 0xf8], r8d
02a9f 4c89742410                     mov        qword ptr [rsp + 0x10], r14
02aa4 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02aa9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02aae 6690                           nop        
02ab0 c5f877                         vzeroupper 
02ab3 e82887b4ff                     call       0x7f53eb9c3660
02ab8 0f1f8400b02b0029               nop        dword ptr [rax + rax + 0x29002bb0]
02ac0 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02ac4 4c8b742478                     mov        r14, qword ptr [rsp + 0x78]
02ac9 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
02ace ebba                           jmp        0x7f53ebe7af0a
02ad0 bee4ffffff                     mov        esi, 0xffffffe4
02ad5 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02ada 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02adf 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02ae7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02aec 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02af4 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02af9 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02b01 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02b06 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02b0b 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02b13 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02b18 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02b1d 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02b22 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02b27 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02b2c 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
02b31 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02b36 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02b3b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02b40 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02b45 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02b4a 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02b4f 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02b54 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02b59 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02b5d 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
02b62 6690                           nop        
02b64 c5f877                         vzeroupper 
02b67 e87486b4ff                     call       0x7f53eb9c3660
02b6c 0f1f8400642c002a               nop        dword ptr [rax + rax + 0x2a002c64]
02b74 bee4ffffff                     mov        esi, 0xffffffe4
02b79 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02b7e 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02b83 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02b8b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02b90 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02b98 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02b9d 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
02ba5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02baa 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02baf 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02bb7 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02bbc 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02bc1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02bc6 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
02bcb 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02bd0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02bd5 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02bda 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02bdf 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02be4 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02be9 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02bed 666690                         nop        
02bf0 c5f877                         vzeroupper 
02bf3 e8e885b4ff                     call       0x7f53eb9c3660
02bf8 0f1f8400f02c002b               nop        dword ptr [rax + rax + 0x2b002cf0]
02c00 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02c05 4183c208                       add        r10d, 8
02c09 be6effffff                     mov        esi, 0xffffff6e
02c0e 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02c13 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02c18 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02c20 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02c25 4c899c24f8000000               mov        qword ptr [rsp + 0xf8], r11
02c2d 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
02c32 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
02c3a 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
02c3f 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02c44 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
02c49 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
02c4e 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
02c53 4c8b5c2438                     mov        r11, qword ptr [rsp + 0x38]
02c58 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
02c5d 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
02c62 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
02c67 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
02c6c 4489442438                     mov        dword ptr [rsp + 0x38], r8d
02c71 895c2448                       mov        dword ptr [rsp + 0x48], ebx
02c75 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02c7a 6690                           nop        
02c7c c5f877                         vzeroupper 
02c7f e85c85b4ff                     call       0x7f53eb9c3660
02c84 0f1f84007c2d002c               nop        dword ptr [rax + rax + 0x2c002d7c]
02c8c 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02c91 4183c208                       add        r10d, 8
02c95 be66ffffff                     mov        esi, 0xffffff66
02c9a 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02c9f 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02ca4 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02cac 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02cb1 4c899c24f8000000               mov        qword ptr [rsp + 0xf8], r11
02cb9 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
02cbe 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
02cc6 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
02ccb 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02cd0 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
02cd5 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
02cda 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
02cdf 4c8b5c2438                     mov        r11, qword ptr [rsp + 0x38]
02ce4 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
02ce9 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
02cee 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
02cf3 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
02cf8 4489442438                     mov        dword ptr [rsp + 0x38], r8d
02cfd 895c2448                       mov        dword ptr [rsp + 0x48], ebx
02d01 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02d06 6690                           nop        
02d08 c5f877                         vzeroupper 
02d0b e8d084b4ff                     call       0x7f53eb9c3660
02d10 0f1f8400082e002d               nop        dword ptr [rax + rax + 0x2d002e08]
02d18 beccffffff                     mov        esi, 0xffffffcc
02d1d 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02d22 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02d27 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02d2f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02d34 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02d3c 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02d41 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02d49 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02d4e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02d53 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02d5b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02d60 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02d65 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02d6a 4489742428                     mov        dword ptr [rsp + 0x28], r14d
02d6f 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02d74 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02d79 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02d7e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02d83 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02d88 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
02d8d 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02d92 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02d97 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02d9c 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02da1 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
02da6 89442468                       mov        dword ptr [rsp + 0x68], eax
02daa 6690                           nop        
02dac c5f877                         vzeroupper 
02daf e82c84b4ff                     call       0x7f53eb9c3660
02db4 0f1f8400ac2e002e               nop        dword ptr [rax + rax + 0x2e002eac]
02dbc bee4ffffff                     mov        esi, 0xffffffe4
02dc1 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02dc6 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02dcb 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02dd3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02dd8 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02de0 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02de5 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02ded 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02df2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02df7 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02dff 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02e04 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02e09 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02e0e 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
02e13 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02e18 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02e1d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02e22 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02e27 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02e2c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02e31 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02e36 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02e3b 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02e3f 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
02e44 c5f877                         vzeroupper 
02e47 e89483b4ff                     call       0x7f53eb9c3660
02e4c 0f1f8400442f002f               nop        dword ptr [rax + rax + 0x2f002f44]
02e54 c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
02e5d bee4ffffff                     mov        esi, 0xffffffe4
02e62 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02e67 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02e6c 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02e74 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02e79 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02e81 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02e86 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02e8e 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02e93 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02e98 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02ea0 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02ea5 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02eaa 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02eaf 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
02eb4 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02eb9 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02ebe 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02ec3 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02ec8 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02ecd 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02ed2 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02ed7 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02edc 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02ee0 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
02ee5 666690                         nop        
02ee8 c5f877                         vzeroupper 
02eeb e8f082b4ff                     call       0x7f53eb9c3660
02ef0 0f1f8400e82f0030               nop        dword ptr [rax + rax + 0x30002fe8]
02ef8 4183c510                       add        r13d, 0x10
02efc be6effffff                     mov        esi, 0xffffff6e
02f01 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02f06 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02f0e 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02f13 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02f1b 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02f20 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02f25 4489742424                     mov        dword ptr [rsp + 0x24], r14d
02f2a 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02f2f 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02f34 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02f39 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02f3e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02f43 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02f48 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
02f4d 895c2454                       mov        dword ptr [rsp + 0x54], ebx
02f51 666690                         nop        
02f54 c5f877                         vzeroupper 
02f57 e88482b4ff                     call       0x7f53eb9c3660
02f5c 0f1f840054300031               nop        dword ptr [rax + rax + 0x31003054]
02f64 4183c510                       add        r13d, 0x10
02f68 be66ffffff                     mov        esi, 0xffffff66
02f6d 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02f72 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02f7a 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02f7f 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02f87 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02f8c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02f91 4489742424                     mov        dword ptr [rsp + 0x24], r14d
02f96 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02f9b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02fa0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02fa5 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02faa 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02faf 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02fb4 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
02fb9 895c2454                       mov        dword ptr [rsp + 0x54], ebx
02fbd 666690                         nop        
02fc0 c5f877                         vzeroupper 
02fc3 e81882b4ff                     call       0x7f53eb9c3660
02fc8 0f1f8400c0300032               nop        dword ptr [rax + rax + 0x320030c0]
02fd0 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02fd5 4533c9                         xor        r9d, r9d
02fd8 458bd3                         mov        r10d, r11d
02fdb e96afaffff                     jmp        0x7f53ebe7aeca
02fe0 bef6ffffff                     mov        esi, 0xfffffff6
02fe5 666690                         nop        
02fe8 c5f877                         vzeroupper 
02feb e8f081b4ff                     call       0x7f53eb9c3660
02ff0 0f1f8400e8300033               nop        dword ptr [rax + rax + 0x330030e8]
02ff8 488bf0                         mov        rsi, rax
02ffb c5f877                         vzeroupper 
02ffe 4881c4e0000000                 add        rsp, 0xe0
03005 5d                             pop        rbp
03006 e955fcb4ff                     jmp        0x7f53eb9cb0e0
0300b 49ba9191e7eb537f0000           movabs     r10, 0x7f53ebe79191
03015 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0301c e93f2aa8ff                     jmp        0x7f53eb8fdee0
03021 e8faf5a6ff                     call       0x7f53eb8eaaa0
03026 e913d0ffff                     jmp        0x7f53ebe784be
0302b f4                             hlt        
0302c f4                             hlt        
0302d f4                             hlt        
0302e f4                             hlt        
0302f f4                             hlt        
