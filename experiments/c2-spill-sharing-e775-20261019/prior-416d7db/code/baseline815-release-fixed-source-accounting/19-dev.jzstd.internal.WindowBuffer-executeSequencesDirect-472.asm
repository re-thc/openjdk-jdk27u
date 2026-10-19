00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c0dca7ff                   jne        0x7f1e7f90f960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecd0000000                 sub        rsp, 0xd0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f8527340000                   jne        0x7f1e7fe950e5
0003e 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00043 894c240c                       mov        dword ptr [rsp + 0xc], ecx
00047 4d8bd8                         mov        r11, r8
0004a 4c8bf6                         mov        r14, rsi
0004d 448b463c                       mov        r8d, dword ptr [rsi + 0x3c]
00051 4489442464                     mov        dword ptr [rsp + 0x64], r8d
00056 448b5638                       mov        r10d, dword ptr [rsi + 0x38]
0005a 458bc2                         mov        r8d, r10d
0005d 442b442464                     sub        r8d, dword ptr [rsp + 0x64]
00062 8b8c24e0000000                 mov        ecx, dword ptr [rsp + 0xe0]
00069 413bc8                         cmp        ecx, r8d
0006c 0f8f862c0000                   jg         0x7f1e7fe94978
00072 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00076 4c89442428                     mov        qword ptr [rsp + 0x28], r8
0007b 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
0007f 4c638c24e0000000               movsxd     r9, dword ptr [rsp + 0xe0]
00087 48634c2464                     movsxd     rcx, dword ptr [rsp + 0x64]
0008c 48034c2428                     add        rcx, qword ptr [rsp + 0x28]
00091 4c2bc1                         sub        r8, rcx
00094 4d3bc8                         cmp        r9, r8
00097 0f8f5b2c0000                   jg         0x7f1e7fe94978
0009d 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
000a1 4c89442440                     mov        qword ptr [rsp + 0x40], r8
000a6 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000aa 4d85c0                         test       r8, r8
000ad 0f844c130000                   je         0x7f1e7fe9307f
000b3 33db                           xor        ebx, ebx
000b5 4c8bea                         mov        r13, rdx
000b8 8b7208                         mov        esi, dword ptr [rdx + 8]
000bb 458b4e44                       mov        r9d, dword ptr [r14 + 0x44]
000bf 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
000c7 8bef                           mov        ebp, edi
000c9 85ff                           test       edi, edi
000cb 0f8e07250000                   jle        0x7f1e7fe94258
000d1 4c2b442428                     sub        r8, qword ptr [rsp + 0x28]
000d6 448d4ee0                       lea        r9d, [rsi - 0x20]
000da 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
000e2 418d4ae0                       lea        ecx, [r10 - 0x20]
000e6 458b5308                       mov        r10d, dword ptr [r11 + 8]
000ea 4585d2                         test       r10d, r10d
000ed 0f861d2c0000                   jbe        0x7f1e7fe94990
000f3 4d63d2                         movsxd     r10, r10d
000f6 4863ff                         movsxd     rdi, edi
000f9 48ffcf                         dec        rdi
000fc 493bfa                         cmp        rdi, r10
000ff 0f830b2c0000                   jae        0x7f1e7fe94990
00105 488b8424e8000000               mov        rax, qword ptr [rsp + 0xe8]
0010d 8b5008                         mov        edx, dword ptr [rax + 8]
00110 85d2                           test       edx, edx
00112 0f86482c0000                   jbe        0x7f1e7fe949e0
00118 83fa01                         cmp        edx, 1
0011b 0f863f2c0000                   jbe        0x7f1e7fe949e0
00121 83fa02                         cmp        edx, 2
00124 0f86362c0000                   jbe        0x7f1e7fe949e0
0012a 448d56f1                       lea        r10d, [rsi - 0xf]
0012e 4585d2                         test       r10d, r10d
00131 0f8c292c0000                   jl         0x7f1e7fe949e0
00137 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0013f 418b7a08                       mov        edi, dword ptr [r10 + 8]
00143 448d57f1                       lea        r10d, [rdi - 0xf]
00147 4585d2                         test       r10d, r10d
0014a 0f8c102c0000                   jl         0x7f1e7fe949e0
00150 448d57fd                       lea        r10d, [rdi - 3]
00154 4585d2                         test       r10d, r10d
00157 0f8c032c0000                   jl         0x7f1e7fe949e0
0015d 448d57f9                       lea        r10d, [rdi - 7]
00161 4585d2                         test       r10d, r10d
00164 0f8cf62b0000                   jl         0x7f1e7fe949e0
0016a 897c241c                       mov        dword ptr [rsp + 0x1c], edi
0016e 899424ec000000                 mov        dword ptr [rsp + 0xec], edx
00175 894c2448                       mov        dword ptr [rsp + 0x48], ecx
00179 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
0017e 89b424e8000000                 mov        dword ptr [rsp + 0xe8], esi
00185 895c2430                       mov        dword ptr [rsp + 0x30], ebx
00189 4c89442438                     mov        qword ptr [rsp + 0x38], r8
0018e 4889442450                     mov        qword ptr [rsp + 0x50], rax
00193 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
00198 896c2418                       mov        dword ptr [rsp + 0x18], ebp
0019c 4c896c2468                     mov        qword ptr [rsp + 0x68], r13
001a1 4c89742478                     mov        qword ptr [rsp + 0x78], r14
001a6 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
001ae 4d8bd3                         mov        r10, r11
001b1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001b6 448bd7                         mov        r10d, edi
001b9 448bde                         mov        r11d, esi
001bc 458d4afd                       lea        r9d, [r10 - 3]
001c0 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
001c8 4d63c3                         movsxd     r8, r11d
001cb 4183c3f1                       add        r11d, -0xf
001cf 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
001d7 4983c0f1                       add        r8, -0xf
001db 4c89842490000000               mov        qword ptr [rsp + 0x90], r8
001e3 4d63da                         movsxd     r11, r10d
001e6 458d42f9                       lea        r8d, [r10 - 7]
001ea 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
001f2 4183c2f1                       add        r10d, -0xf
001f6 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
001fe 4d8d53f1                       lea        r10, [r11 - 0xf]
00202 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0020a 4983c3f9                       add        r11, -7
0020e 4c899c24a8000000               mov        qword ptr [rsp + 0xa8], r11
00216 4533c9                         xor        r9d, r9d
00219 4533c0                         xor        r8d, r8d
0021c e98a040000                     jmp        0x7f1e7fe9232b
00221 448bdd                         mov        r11d, ebp
00224 4d63d3                         movsxd     r10, r11d
00227 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0022e c442a8f5db                     bzhi       r11, r11, r10
00233 c4c1fb92fb                     kmovq      k7, r11
00238 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0023e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00244 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
0024c 4403dd                         add        r11d, ebp
0024f 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
00257 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0025b 418502                         test       dword ptr [r10], eax
0025e 443b5c245c                     cmp        r11d, dword ptr [rsp + 0x5c]
00263 0f8dde070000                   jge        0x7f1e7fe926c7
00269 4489ac24b4000000               mov        dword ptr [rsp + 0xb4], r13d
00271 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00279 442b9424b0000000               sub        r10d, dword ptr [rsp + 0xb0]
00281 418bca                         mov        ecx, r10d
00284 8b6c245c                       mov        ebp, dword ptr [rsp + 0x5c]
00288 2bac24b0000000                 sub        ebp, dword ptr [rsp + 0xb0]
0028f 3bac24b0000000                 cmp        ebp, dword ptr [rsp + 0xb0]
00296 448bac24b0000000               mov        r13d, dword ptr [rsp + 0xb0]
0029e 410f4fed                       cmovg      ebp, r13d
002a2 4585d2                         test       r10d, r10d
002a5 0f8c991d0000                   jl         0x7f1e7fe93cc4
002ab 448bac24b4000000               mov        r13d, dword ptr [rsp + 0xb4]
002b3 4585ed                         test       r13d, r13d
002b6 0f8c881d0000                   jl         0x7f1e7fe93cc4
002bc 458d1c2a                       lea        r11d, [r10 + rbp]
002c0 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
002c5 453bc3                         cmp        r8d, r11d
002c8 0f82761d0000                   jb         0x7f1e7fe93cc4
002ce 4403ed                         add        r13d, ebp
002d1 453bc5                         cmp        r8d, r13d
002d4 0f826a1d0000                   jb         0x7f1e7fe93cc4
002da 85ed                           test       ebp, ebp
002dc 0f8c621d0000                   jl         0x7f1e7fe93cc4
002e2 85ed                           test       ebp, ebp
002e4 0f845affffff                   je         0x7f1e7fe91ec4
002ea 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
002f2 448b8424b4000000               mov        r8d, dword ptr [rsp + 0xb4]
002fa 4b8d74020c                     lea        rsi, [r10 + r8 + 0xc]
002ff 498d7c0a0c                     lea        rdi, [r10 + rcx + 0xc]
00304 4863d5                         movsxd     rdx, ebp
00307 4883fa20                       cmp        rdx, 0x20
0030b 0f8610ffffff                   jbe        0x7f1e7fe91ea1
00311 c5f877                         vzeroupper 
00314 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
0031e 41ffd2                         call       r10
00321 0f1f840000000000               nop        dword ptr [rax + rax]
00329 e916ffffff                     jmp        0x7f1e7fe91ec4
0032e 458bf3                         mov        r14d, r11d
00331 448b8424b0000000               mov        r8d, dword ptr [rsp + 0xb0]
00339 4585c0                         test       r8d, r8d
0033c 0f8e12140000                   jle        0x7f1e7fe933d4
00342 458d1401                       lea        r10d, [r9 + rax]
00346 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0034b 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00350 4403db                         add        r11d, ebx
00353 443b5c2448                     cmp        r11d, dword ptr [rsp + 0x48]
00358 0f8fc0100000                   jg         0x7f1e7fe9309e
0035e 443b542458                     cmp        r10d, dword ptr [rsp + 0x58]
00363 0f8f53150000                   jg         0x7f1e7fe9353c
00369 83f810                         cmp        eax, 0x10
0036c 0f8f90070000                   jg         0x7f1e7fe92782
00372 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
0037a 0f8305110000                   jae        0x7f1e7fe93105
00380 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00385 c4817a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 0xc]
0038c 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00391 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
00399 0f838d110000                   jae        0x7f1e7fe931ac
0039f 468d1408                       lea        r10d, [rax + r9]
003a3 4489542460                     mov        dword ptr [rsp + 0x60], r10d
003a8 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
003ad 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
003b5 c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
003bc 468d1c10                       lea        r11d, [rax + r10]
003c0 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
003c5 458beb                         mov        r13d, r11d
003c8 442bac24b0000000               sub        r13d, dword ptr [rsp + 0xb0]
003d0 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
003d4 83fb10                         cmp        ebx, 0x10
003d7 7f56                           jg         0x7f1e7fe920af
003d9 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
003e0 83fb10                         cmp        ebx, 0x10
003e3 7c4a                           jl         0x7f1e7fe920af
003e5 443bac249c000000               cmp        r13d, dword ptr [rsp + 0x9c]
003ed 0f83f5110000                   jae        0x7f1e7fe93268
003f3 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
003fb c4817a6f442b0c                 vmovdqu    xmm0, xmmword ptr [r11 + r13 + 0xc]
00402 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00406 3b9c249c000000                 cmp        ebx, dword ptr [rsp + 0x9c]
0040d 0f8389120000                   jae        0x7f1e7fe9331c
00413 448b6c2464                     mov        r13d, dword ptr [rsp + 0x64]
00418 c4817a7f442b0c                 vmovdqu    xmmword ptr [r11 + r13 + 0xc], xmm0
0041f 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
00423 4103dd                         add        ebx, r13d
00426 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0042a e961020000                     jmp        0x7f1e7fe92310
0042f 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00437 4b8d7c2a0c                     lea        rdi, [r10 + r13 + 0xc]
0043c 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00440 498d741a0c                     lea        rsi, [r10 + rbx + 0xc]
00445 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
00449 035c2464                       add        ebx, dword ptr [rsp + 0x64]
0044d 4c63c3                         movsxd     r8, ebx
00450 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00458 443b54245c                     cmp        r10d, dword ptr [rsp + 0x5c]
0045d 0f8c2c040000                   jl         0x7f1e7fe9250f
00463 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00468 4183fb30                       cmp        r11d, 0x30
0046c 0f8e8c000000                   jle        0x7f1e7fe9217e
00472 4585ed                         test       r13d, r13d
00475 0f8c31190000                   jl         0x7f1e7fe93a2c
0047b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00480 4585d2                         test       r10d, r10d
00483 0f8c23190000                   jl         0x7f1e7fe93a2c
00489 478d142b                       lea        r10d, [r11 + r13]
0048d 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
00492 453bda                         cmp        r11d, r10d
00495 0f8211190000                   jb         0x7f1e7fe93a2c
0049b 443bdb                         cmp        r11d, ebx
0049e 0f8208190000                   jb         0x7f1e7fe93a2c
004a4 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
004a8 85db                           test       ebx, ebx
004aa 0f84d4010000                   je         0x7f1e7fe92304
004b0 4863d3                         movsxd     rdx, ebx
004b3 4883fa20                       cmp        rdx, 0x20
004b7 7728                           ja         0x7f1e7fe92161
004b9 448bd3                         mov        r10d, ebx
004bc 4d63d2                         movsxd     r10, r10d
004bf 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
004c6 c442a8f5db                     bzhi       r11, r11, r10
004cb c4c1fb92fb                     kmovq      k7, r11
004d0 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
004d6 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
004dc e9a3010000                     jmp        0x7f1e7fe92304
004e1 c5f877                         vzeroupper 
004e4 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
004ee 41ffd2                         call       r10
004f1 0f1f840000000000               nop        dword ptr [rax + rax]
004f9 e986010000                     jmp        0x7f1e7fe92304
004fe 443bac2498000000               cmp        r13d, dword ptr [rsp + 0x98]
00506 0f8358140000                   jae        0x7f1e7fe935e4
0050c 4963d5                         movsxd     rdx, r13d
0050f 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00517 498b7c130c                     mov        rdi, qword ptr [r11 + rdx + 0xc]
0051c 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00521 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00529 0f83f1140000                   jae        0x7f1e7fe936a0
0052f 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
00534 418d4908                       lea        ecx, [r9 + 8]
00538 4d63d9                         movsxd     r11, r9d
0053b 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00543 4b897c1a0c                     mov        qword ptr [r10 + r11 + 0xc], rdi
00548 3bcb                           cmp        ecx, ebx
0054a 0f8d34010000                   jge        0x7f1e7fe92304
00550 492bd3                         sub        rdx, r11
00553 4c63d9                         movsxd     r11, ecx
00556 4d8d1413                       lea        r10, [r11 + rdx]
0055a 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00562 0f83d4160000                   jae        0x7f1e7fe938bc
00568 4d8bd0                         mov        r10, r8
0056b 4d2bd3                         sub        r10, r11
0056e 4983c207                       add        r10, 7
00572 4983e2f8                       and        r10, 0xfffffffffffffff8
00576 458bda                         mov        r11d, r10d
00579 478d540b08                     lea        r10d, [r11 + r9 + 8]
0057e 4d63d2                         movsxd     r10, r10d
00581 4d8d5c12f8                     lea        r11, [r10 + rdx - 8]
00586 4c3b9c24a8000000               cmp        r11, qword ptr [rsp + 0xa8]
0058e 0f83a8160000                   jae        0x7f1e7fe938bc
00594 3b8c2498000000                 cmp        ecx, dword ptr [rsp + 0x98]
0059b 0f839b160000                   jae        0x7f1e7fe938bc
005a1 4983c2f8                       add        r10, -8
005a5 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
005ad 0f8389160000                   jae        0x7f1e7fe938bc
005b3 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
005b9 0f8f35170000                   jg         0x7f1e7fe93974
005bf 452be9                         sub        r13d, r9d
005c2 4183c110                       add        r9d, 0x10
005c6 468d1c29                       lea        r11d, [rcx + r13]
005ca 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
005d2 4f8b5c1a0c                     mov        r11, qword ptr [r10 + r11 + 0xc]
005d7 448bd1                         mov        r10d, ecx
005da 8bbc2484000000                 mov        edi, dword ptr [rsp + 0x84]
005e1 4e895c170c                     mov        qword ptr [rdi + r10 + 0xc], r11
005e6 83c108                         add        ecx, 8
005e9 413bc9                         cmp        ecx, r9d
005ec 7cd8                           jl         0x7f1e7fe92246
005ee 4983c0f8                       add        r8, -8
005f2 4981f800000080                 cmp        r8, -0x80000000
005f9 49c7c200000080                 mov        r10, 0xffffffff80000000
00600 4d0f4cc2                       cmovl      r8, r10
00604 458bd0                         mov        r10d, r8d
00607 413bca                         cmp        ecx, r10d
0060a 7d4b                           jge        0x7f1e7fe922d7
0060c 0f1f4000                       nop        dword ptr [rax]
00610 468d0429                       lea        r8d, [rcx + r13]
00614 448bd9                         mov        r11d, ecx
00617 4963fb                         movsxd     rdi, r11d
0061a 458bd8                         mov        r11d, r8d
0061d 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
00625 4f8b4c190c                     mov        r9, qword ptr [r9 + r11 + 0xc]
0062a 4963d0                         movsxd     rdx, r8d
0062d 448bc1                         mov        r8d, ecx
00630 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00638 4f894c030c                     mov        qword ptr [r11 + r8 + 0xc], r9
0063d 4d8b5c1314                     mov        r11, qword ptr [r11 + rdx + 0x14]
00642 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
0064a 4d895c3814                     mov        qword ptr [r8 + rdi + 0x14], r11
0064f 83c110                         add        ecx, 0x10
00652 413bca                         cmp        ecx, r10d
00655 7cb9                           jl         0x7f1e7fe92290
00657 3bcb                           cmp        ecx, ebx
00659 7d29                           jge        0x7f1e7fe92304
0065b 90                             nop        
0065c 468d1429                       lea        r10d, [rcx + r13]
00660 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00668 4f8b44100c                     mov        r8, qword ptr [r8 + r10 + 0xc]
0066d 448bd9                         mov        r11d, ecx
00670 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00678 4f89441a0c                     mov        qword ptr [r10 + r11 + 0xc], r8
0067d 83c108                         add        ecx, 8
00680 3bcb                           cmp        ecx, ebx
00682 7cd8                           jl         0x7f1e7fe922dc
00684 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00688 035c245c                       add        ebx, dword ptr [rsp + 0x5c]
0068c 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00690 448b8424b8000000               mov        r8d, dword ptr [rsp + 0xb8]
00698 41ffc0                         inc        r8d
0069b 443b442418                     cmp        r8d, dword ptr [rsp + 0x18]
006a0 0f8d9f050000                   jge        0x7f1e7fe928c5
006a6 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
006ab 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
006b0 4f8b5cc210                     mov        r11, qword ptr [r10 + r8*8 + 0x10]
006b5 4d8bd3                         mov        r10, r11
006b8 49c1fa24                       sar        r10, 0x24
006bc 458bd2                         mov        r10d, r10d
006bf 418bfa                         mov        edi, r10d
006c2 458bd3                         mov        r10d, r11d
006c5 49c1eb12                       shr        r11, 0x12
006c9 4181e2ffff0100                 and        r10d, 0x1ffff
006d0 418bc2                         mov        eax, r10d
006d3 418bdb                         mov        ebx, r11d
006d6 81e3ffff0300                   and        ebx, 0x3ffff
006dc 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
006e0 448bd7                         mov        r10d, edi
006e3 4585d2                         test       r10d, r10d
006e6 0f8c88100000                   jl         0x7f1e7fe933f4
006ec 448bd0                         mov        r10d, eax
006ef 4585d2                         test       r10d, r10d
006f2 0f85b0000000                   jne        0x7f1e7fe92428
006f8 4533d2                         xor        r10d, r10d
006fb 418bc2                         mov        eax, r10d
006fe 448bd7                         mov        r10d, edi
00701 4183fa03                       cmp        r10d, 3
00705 0f8ecd000000                   jle        0x7f1e7fe92458
0070b 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00710 458b5a10                       mov        r11d, dword ptr [r10 + 0x10]
00714 45895a14                       mov        dword ptr [r10 + 0x14], r11d
00718 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
0071c 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00721 45895310                       mov        dword ptr [r11 + 0x10], r10d
00725 448d57fd                       lea        r10d, [rdi - 3]
00729 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
00731 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
00738 41895b0c                       mov        dword ptr [r11 + 0xc], ebx
0073c 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
00744 48639c24b0000000               movsxd     rbx, dword ptr [rsp + 0xb0]
0074c 488beb                         mov        rbp, rbx
0074f 4c63542464                     movsxd     r10, dword ptr [rsp + 0x64]
00754 4c03542428                     add        r10, qword ptr [rsp + 0x28]
00759 4863d0                         movsxd     rdx, eax
0075c 4c03d2                         add        r10, rdx
0075f 493bda                         cmp        rbx, r10
00762 0f8fbc100000                   jg         0x7f1e7fe934a4
00768 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
0076c 03d8                           add        ebx, eax
0076e 448beb                         mov        r13d, ebx
00771 442bac24b0000000               sub        r13d, dword ptr [rsp + 0xb0]
00779 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0077e 4585db                         test       r11d, r11d
00781 0f85a7fbffff                   jne        0x7f1e7fe91fae
00787 4d63dd                         movsxd     r11, r13d
0078a 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
0078f 0f8c3f130000                   jl         0x7f1e7fe93754
00795 483b6c2440                     cmp        rbp, qword ptr [rsp + 0x40]
0079a 0f8fe8130000                   jg         0x7f1e7fe93808
007a0 4533f6                         xor        r14d, r14d
007a3 e989fbffff                     jmp        0x7f1e7fe91fb1
007a8 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
007ad 452bd1                         sub        r10d, r9d
007b0 413bc2                         cmp        eax, r10d
007b3 0f8e45ffffff                   jle        0x7f1e7fe9237e
007b9 be45ffffff                     mov        esi, 0xffffff45
007be 8be8                           mov        ebp, eax
007c0 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
007c8 c5f877                         vzeroupper 
007cb e81059b4ff                     call       0x7f1e7f9d7d60
007d0 0f1f8400c8080001               nop        dword ptr [rax + rax + 0x10008c8]
007d8 85c0                           test       eax, eax
007da 7407                           je         0x7f1e7fe92463
007dc 448d57ff                       lea        r10d, [rdi - 1]
007e0 418bfa                         mov        edi, r10d
007e3 85ff                           test       edi, edi
007e5 7516                           jne        0x7f1e7fe9247d
007e7 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
007ec 418b5a0c                       mov        ebx, dword ptr [r10 + 0xc]
007f0 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
007f8 e986000000                     jmp        0x7f1e7fe92503
007fd 83ff03                         cmp        edi, 3
00800 0f849e1e0000                   je         0x7f1e7fe94324
00806 83ff02                         cmp        edi, 2
00809 0f87451f0000                   ja         0x7f1e7fe943d4
0080f 3bbc24ec000000                 cmp        edi, dword ptr [rsp + 0xec]
00816 0f836e170000                   jae        0x7f1e7fe93c0a
0081c 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00821 418b5cbb0c                     mov        ebx, dword ptr [r11 + rdi*4 + 0xc]
00826 85ff                           test       edi, edi
00828 7e48                           jle        0x7f1e7fe924f2
0082a 448d57ff                       lea        r10d, [rdi - 1]
0082e 443b9424ec000000               cmp        r10d, dword ptr [rsp + 0xec]
00836 0f83b81d0000                   jae        0x7f1e7fe94274
0083c 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
00844 660f1f440000                   nop        word ptr [rax + rax]
0084a 660f1f440000                   nop        word ptr [rax + rax]
00850 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00855 458b5cbb08                     mov        r11d, dword ptr [r11 + rdi*4 + 8]
0085a 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
0085f 45895cb80c                     mov        dword ptr [r8 + rdi*4 + 0xc], r11d
00864 448d57ff                       lea        r10d, [rdi - 1]
00868 418bfa                         mov        edi, r10d
0086b 4585d2                         test       r10d, r10d
0086e 7fe0                           jg         0x7f1e7fe924d0
00870 eb08                           jmp        0x7f1e7fe924fa
00872 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
0087a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0087f 41895a0c                       mov        dword ptr [r10 + 0xc], ebx
00883 899c24b0000000                 mov        dword ptr [rsp + 0xb0], ebx
0088a e9b5feffff                     jmp        0x7f1e7fe923c4
0088f 4183fa10                       cmp        r10d, 0x10
00893 0f8dce080000                   jge        0x7f1e7fe92de7
00899 4183fa08                       cmp        r10d, 8
0089d 0f8d60040000                   jge        0x7f1e7fe92983
008a3 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
008a8 4183fa10                       cmp        r10d, 0x10
008ac 0f8f9e010000                   jg         0x7f1e7fe926d0
008b2 443b6c241c                     cmp        r13d, dword ptr [rsp + 0x1c]
008b7 0f8343180000                   jae        0x7f1e7fe93d80
008bd 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
008c5 430fbe6c2b0c                   movsx      ebp, byte ptr [r11 + r13 + 0xc]
008cb 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
008d0 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
008d5 0f83e1180000                   jae        0x7f1e7fe93e3c
008db 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
008e3 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
008e8 43886c130c                     mov        byte ptr [r11 + r10 + 0xc], bpl
008ed 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
008f2 41ffc1                         inc        r9d
008f5 458d5d03                       lea        r11d, [r13 + 3]
008f9 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
008fe 0f8354190000                   jae        0x7f1e7fe93ed8
00904 4d63dd                         movsxd     r11, r13d
00907 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0090f 430fbe6c1a0d                   movsx      ebp, byte ptr [r10 + r11 + 0xd]
00915 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0091a 4183c003                       add        r8d, 3
0091e 443b44241c                     cmp        r8d, dword ptr [rsp + 0x1c]
00923 0f83db190000                   jae        0x7f1e7fe93f84
00929 4c634c2464                     movsxd     r9, dword ptr [rsp + 0x64]
0092e 43886c0a0d                     mov        byte ptr [r10 + r9 + 0xd], bpl
00933 470fbe541a0e                   movsx      r10d, byte ptr [r10 + r11 + 0xe]
00939 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00941 478854080e                     mov        byte ptr [r8 + r9 + 0xe], r10b
00946 470fbe54180f                   movsx      r10d, byte ptr [r8 + r11 + 0xf]
0094c 478854080f                     mov        byte ptr [r8 + r9 + 0xf], r10b
00951 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00959 4183fb08                       cmp        r11d, 8
0095d 0f83491a0000                   jae        0x7f1e7fe9402c
00963 49bbc8df2fe300000000           movabs     r11, 0xe32fdfc8
0096d 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00975 47036c930c                     add        r13d, dword ptr [r11 + r10*4 + 0xc]
0097a 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0097f 4183fb04                       cmp        r11d, 4
00983 7e4a                           jle        0x7f1e7fe9264f
00985 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0098a 4183c004                       add        r8d, 4
0098e 443bac2488000000               cmp        r13d, dword ptr [rsp + 0x88]
00996 0f83bc1a0000                   jae        0x7f1e7fe940d8
0099c 418bcd                         mov        ecx, r13d
0099f 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
009a7 418b6c0b0c                     mov        ebp, dword ptr [r11 + rcx + 0xc]
009ac 443b842488000000               cmp        r8d, dword ptr [rsp + 0x88]
009b4 0f83621b0000                   jae        0x7f1e7fe9419c
009ba 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
009bf 4d63da                         movsxd     r11, r10d
009c2 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
009ca 43896c1a10                     mov        dword ptr [r10 + r11 + 0x10], ebp
009cf 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
009d4 4183fa08                       cmp        r10d, 8
009d8 7e6d                           jle        0x7f1e7fe926c7
009da 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
009df 4183c208                       add        r10d, 8
009e3 458bc2                         mov        r8d, r10d
009e6 49baf8df2fe300000000           movabs     r10, 0xe32fdff8
009f0 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
009f8 478b5c9a0c                     mov        r11d, dword ptr [r10 + r11*4 + 0xc]
009fd 452beb                         sub        r13d, r11d
00a00 418d6d08                       lea        ebp, [r13 + 8]
00a04 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
00a0b 0f83f31d0000                   jae        0x7f1e7fe94484
00a11 4d63d5                         movsxd     r10, r13d
00a14 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00a1c 4b8b6c1314                     mov        rbp, qword ptr [r11 + r10 + 0x14]
00a21 458bd0                         mov        r10d, r8d
00a24 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00a2c 0f83821e0000                   jae        0x7f1e7fe94534
00a32 448b6c2464                     mov        r13d, dword ptr [rsp + 0x64]
00a37 4d63dd                         movsxd     r11, r13d
00a3a 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00a42 4b896c1a14                     mov        qword ptr [r10 + r11 + 0x14], rbp
00a47 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00a4b e940fcffff                     jmp        0x7f1e7fe92310
00a50 4585ed                         test       r13d, r13d
00a53 0f8c0b1f0000                   jl         0x7f1e7fe945e4
00a59 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00a5e 4585db                         test       r11d, r11d
00a61 0f8cfd1e0000                   jl         0x7f1e7fe945e4
00a67 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
00a6c 443b542464                     cmp        r10d, dword ptr [rsp + 0x64]
00a71 0f82ed1e0000                   jb         0x7f1e7fe945e4
00a77 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00a7f 44035c2464                     add        r11d, dword ptr [rsp + 0x64]
00a84 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
00a8c 453bd3                         cmp        r10d, r11d
00a8f 0f82cf1e0000                   jb         0x7f1e7fe945e4
00a95 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00a9d 4585db                         test       r11d, r11d
00aa0 0f8cbe1e0000                   jl         0x7f1e7fe945e4
00aa6 4585db                         test       r11d, r11d
00aa9 0f84c2f7ffff                   je         0x7f1e7fe91ef1
00aaf 4883fd20                       cmp        rbp, 0x20
00ab3 772d                           ja         0x7f1e7fe92762
00ab5 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00abd 4d63d2                         movsxd     r10, r10d
00ac0 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ac7 c442a8f5db                     bzhi       r11, r11, r10
00acc c4c1fb92fb                     kmovq      k7, r11
00ad1 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ad7 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00add e98ff7ffff                     jmp        0x7f1e7fe91ef1
00ae2 488bd5                         mov        rdx, rbp
00ae5 c5f877                         vzeroupper 
00ae8 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00af2 41ffd2                         call       r10
00af5 0f1f840000000000               nop        dword ptr [rax + rax]
00afd e96ff7ffff                     jmp        0x7f1e7fe91ef1
00b02 83f830                         cmp        eax, 0x30
00b05 0f8fd9050000                   jg         0x7f1e7fe92d64
00b0b 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
00b13 0f83071f0000                   jae        0x7f1e7fe946a0
00b19 4d63c1                         movsxd     r8, r9d
00b1c 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00b21 c4817a6f44020c                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0xc]
00b28 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b2d 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
00b35 0f83951f0000                   jae        0x7f1e7fe94750
00b3b 418bfa                         mov        edi, r10d
00b3e 4183c210                       add        r10d, 0x10
00b42 418bd2                         mov        edx, r10d
00b45 4863cf                         movsxd     rcx, edi
00b48 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00b50 c4c17a7f440b0c                 vmovdqu    xmmword ptr [r11 + rcx + 0xc], xmm0
00b57 443bd3                         cmp        r10d, ebx
00b5a 0f8dae000000                   jge        0x7f1e7fe9288e
00b60 4c2bc1                         sub        r8, rcx
00b63 4d63da                         movsxd     r11, r10d
00b66 4f8d1403                       lea        r10, [r11 + r8]
00b6a 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
00b72 0f8330200000                   jae        0x7f1e7fe94828
00b78 4c63d3                         movsxd     r10, ebx
00b7b 4d2bd3                         sub        r10, r11
00b7e 4983c20f                       add        r10, 0xf
00b82 4983e2f0                       and        r10, 0xfffffffffffffff0
00b86 458bd2                         mov        r10d, r10d
00b89 458d5c3a10                     lea        r11d, [r10 + rdi + 0x10]
00b8e 4d63db                         movsxd     r11, r11d
00b91 4f8d5403f0                     lea        r10, [r11 + r8 - 0x10]
00b96 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
00b9e 0f8304200000                   jae        0x7f1e7fe94828
00ba4 448bd2                         mov        r10d, edx
00ba7 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
00baf 0f83f31f0000                   jae        0x7f1e7fe94828
00bb5 4983c3f0                       add        r11, -0x10
00bb9 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
00bc1 0f83e11f0000                   jae        0x7f1e7fe94828
00bc7 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00bcd 0f8f7d200000                   jg         0x7f1e7fe948d0
00bd3 458bd1                         mov        r10d, r9d
00bd6 442bd7                         sub        r10d, edi
00bd9 0f1f8000000000                 nop        dword ptr [rax]
00be0 458d0412                       lea        r8d, [r10 + rdx]
00be4 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00be9 c4817a6f44030c                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0xc]
00bf0 448bda                         mov        r11d, edx
00bf3 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00bfb c4817a7f44180c                 vmovdqu    xmmword ptr [r8 + r11 + 0xc], xmm0
00c02 448d5a10                       lea        r11d, [rdx + 0x10]
00c06 418bd3                         mov        edx, r11d
00c09 443bdb                         cmp        r11d, ebx
00c0c 7cd2                           jl         0x7f1e7fe92860
00c0e 468d1408                       lea        r10d, [rax + r9]
00c12 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00c17 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00c1b e9b0f7ffff                     jmp        0x7f1e7fe92050
00c20 4d63d2                         movsxd     r10, r10d
00c23 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c2a c442a8f5db                     bzhi       r11, r11, r10
00c2f c4c1fb92fb                     kmovq      k7, r11
00c34 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c3a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c40 e9a4000000                     jmp        0x7f1e7fe92969
00c45 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00c4a 458bd3                         mov        r10d, r11d
00c4d 442b542460                     sub        r10d, dword ptr [rsp + 0x60]
00c52 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00c5a 4585c0                         test       r8d, r8d
00c5d 0f845d210000                   je         0x7f1e7fe94a40
00c63 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00c68 4585db                         test       r11d, r11d
00c6b 0f8ccf210000                   jl         0x7f1e7fe94ac0
00c71 4c8b742478                     mov        r14, qword ptr [rsp + 0x78]
00c76 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
00c7b 8bb424e8000000                 mov        esi, dword ptr [rsp + 0xe8]
00c82 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
00c86 85c9                           test       ecx, ecx
00c88 0f8c66210000                   jl         0x7f1e7fe94a74
00c8e 3b74240c                       cmp        esi, dword ptr [rsp + 0xc]
00c92 0f8262210000                   jb         0x7f1e7fe94a7a
00c98 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
00c9c 4103ea                         add        ebp, r10d
00c9f 458b4808                       mov        r9d, dword ptr [r8 + 8]
00ca3 443bcd                         cmp        r9d, ebp
00ca6 0f8254210000                   jb         0x7f1e7fe94a80
00cac 4585d2                         test       r10d, r10d
00caf 0f8c51210000                   jl         0x7f1e7fe94a86
00cb5 4585d2                         test       r10d, r10d
00cb8 742f                           je         0x7f1e7fe92969
00cba 498d74080c                     lea        rsi, [r8 + rcx + 0xc]
00cbf 4b8d7c1d0c                     lea        rdi, [r13 + r11 + 0xc]
00cc4 4963d2                         movsxd     rdx, r10d
00cc7 4883fa20                       cmp        rdx, 0x20
00ccb 0f864fffffff                   jbe        0x7f1e7fe928a0
00cd1 c5f877                         vzeroupper 
00cd4 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00cde 41ffd2                         call       r10
00ce1 0f1f840000000000               nop        dword ptr [rax + rax]
00ce9 41896e3c                       mov        dword ptr [r14 + 0x3c], ebp
00ced c5f877                         vzeroupper 
00cf0 4881c4d0000000                 add        rsp, 0xd0
00cf7 5d                             pop        rbp
00cf8 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00cfc 0f874d270000                   ja         0x7f1e7fe950cf
00d02 c3                             ret        
00d03 443bac2498000000               cmp        r13d, dword ptr [rsp + 0x98]
00d0b 0f833f210000                   jae        0x7f1e7fe94ad0
00d11 458bd5                         mov        r10d, r13d
00d14 418bc2                         mov        eax, r10d
00d17 4963fa                         movsxd     rdi, r10d
00d1a 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00d22 498b4c3b0c                     mov        rcx, qword ptr [r11 + rdi + 0xc]
00d27 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00d2c 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00d34 0f83c2210000                   jae        0x7f1e7fe94b7c
00d3a 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
00d3f 458d5108                       lea        r10d, [r9 + 8]
00d43 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00d48 4963d1                         movsxd     rdx, r9d
00d4b 49894c130c                     mov        qword ptr [r11 + rdx + 0xc], rcx
00d50 443bd3                         cmp        r10d, ebx
00d53 0f8d5d030000                   jge        0x7f1e7fe92d36
00d59 482bfa                         sub        rdi, rdx
00d5c 4963ca                         movsxd     rcx, r10d
00d5f 4c8d1439                       lea        r10, [rcx + rdi]
00d63 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00d6b 0f833f220000                   jae        0x7f1e7fe94c30
00d71 4d8bd0                         mov        r10, r8
00d74 4c2bd1                         sub        r10, rcx
00d77 4983c207                       add        r10, 7
00d7b 4983e2f8                       and        r10, 0xfffffffffffffff8
00d7f 458bd2                         mov        r10d, r10d
00d82 478d5c0a08                     lea        r11d, [r10 + r9 + 8]
00d87 4d63db                         movsxd     r11, r11d
00d8a 4d8d543bf8                     lea        r10, [r11 + rdi - 8]
00d8f 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00d97 0f8313220000                   jae        0x7f1e7fe94c30
00d9d 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00da2 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00daa 0f8300220000                   jae        0x7f1e7fe94c30
00db0 4983c3f8                       add        r11, -8
00db4 4c3b9c24a8000000               cmp        r11, qword ptr [rsp + 0xa8]
00dbc 0f83ee210000                   jae        0x7f1e7fe94c30
00dc2 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
00dc8 0f8f7e220000                   jg         0x7f1e7fe94ccc
00dce 448bd0                         mov        r10d, eax
00dd1 452bd1                         sub        r10d, r9d
00dd4 458bf2                         mov        r14d, r10d
00dd7 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00ddf 458bd2                         mov        r10d, r10d
00de2 41bbf4ffffff                   mov        r11d, 0xfffffff4
00de8 452bda                         sub        r11d, r10d
00deb 452bd9                         sub        r11d, r9d
00dee 4183c110                       add        r9d, 0x10
00df2 4183c3f0                       add        r11d, -0x10
00df6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00dfb 498d78c8                       lea        rdi, [r8 - 0x38]
00dff 4881ff00000080                 cmp        rdi, -0x80000000
00e06 48c7c200000080                 mov        rdx, 0xffffffff80000000
00e0d 480f4cfa                       cmovl      rdi, rdx
00e11 8bff                           mov        edi, edi
00e13 442b6c2464                     sub        r13d, dword ptr [rsp + 0x64]
00e18 4963c1                         movsxd     rax, r9d
00e1b be06000000                     mov        esi, 6
00e20 c442c8f5db                     bzhi       r11, r11, rsi
00e25 4903c3                         add        rax, r11
00e28 493bc0                         cmp        rax, r8
00e2b 498bd0                         mov        rdx, r8
00e2e 480f4cd0                       cmovl      rdx, rax
00e32 4c8bda                         mov        r11, rdx
00e35 4c2bd9                         sub        r11, rcx
00e38 498d73ff                       lea        rsi, [r11 - 1]
00e3c 48c1fe3f                       sar        rsi, 0x3f
00e40 48c1ee3d                       shr        rsi, 0x3d
00e44 4e8d5c1eff                     lea        r11, [rsi + r11 - 1]
00e49 4983e3f8                       and        r11, 0xfffffffffffffff8
00e4d 4c03d9                         add        r11, rcx
00e50 493bcb                         cmp        rcx, r11
00e53 490f4ccb                       cmovl      rcx, r11
00e57 8bc9                           mov        ecx, ecx
00e59 458d5c0d08                     lea        r11d, [r13 + rcx + 8]
00e5e 83c108                         add        ecx, 8
00e61 4963f3                         movsxd     rsi, r11d
00e64 4903f2                         add        rsi, r10
00e67 4863c9                         movsxd     rcx, ecx
00e6a 4903ca                         add        rcx, r10
00e6d 4c8d5e0c                       lea        r11, [rsi + 0xc]
00e71 4883c64c                       add        rsi, 0x4c
00e75 488d414c                       lea        rax, [rcx + 0x4c]
00e79 4533d2                         xor        r10d, r10d
00e7c 493bc3                         cmp        rax, r11
00e7f 410f96c2                       setbe      r10b
00e83 4883c10c                       add        rcx, 0xc
00e87 4533db                         xor        r11d, r11d
00e8a 483bf1                         cmp        rsi, rcx
00e8d 410f96c3                       setbe      r11b
00e91 450bd3                         or         r10d, r11d
00e94 0f84c60f0000                   je         0x7f1e7fe93ae0
00e9a 448bd2                         mov        r10d, edx
00e9d 666690                         nop        
00ea0 458bce                         mov        r9d, r14d
00ea3 44034c244c                     add        r9d, dword ptr [rsp + 0x4c]
00ea8 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00eb0 4f8b4c0b0c                     mov        r9, qword ptr [r11 + r9 + 0xc]
00eb5 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00eba 8b8c2484000000                 mov        ecx, dword ptr [rsp + 0x84]
00ec1 4e894c190c                     mov        qword ptr [rcx + r11 + 0xc], r9
00ec6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00ecb 4183c308                       add        r11d, 8
00ecf 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00ed4 453bda                         cmp        r11d, r10d
00ed7 7cc7                           jl         0x7f1e7fe92b20
00ed9 4981c008feffff                 add        r8, -0x1f8
00ee0 4981f800000080                 cmp        r8, -0x80000000
00ee7 49c7c200000080                 mov        r10, 0xffffffff80000000
00eee 4d0f4cc2                       cmovl      r8, r10
00ef2 458bd0                         mov        r10d, r8d
00ef5 453bda                         cmp        r11d, r10d
00ef8 0f8d7c010000                   jge        0x7f1e7fe92cfa
00efe 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00f03 0f1f8000000000                 nop        dword ptr [rax]
00f0a 660f1f440000                   nop        word ptr [rax + rax]
00f10 458bde                         mov        r11d, r14d
00f13 44035c244c                     add        r11d, dword ptr [rsp + 0x4c]
00f18 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00f1d 4d63c8                         movsxd     r9, r8d
00f20 418bcb                         mov        ecx, r11d
00f23 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
00f2a 62f17e486f840a0c000000         vmovdqu32  zmm0, zmmword ptr [rdx + rcx + 0xc]
00f35 4963cb                         movsxd     rcx, r11d
00f38 8b74244c                       mov        esi, dword ptr [rsp + 0x4c]
00f3c 83c640                         add        esi, 0x40
00f3f 4103f6                         add        esi, r14d
00f42 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
00f46 81c580000000                   add        ebp, 0x80
00f4c 4103ee                         add        ebp, r14d
00f4f 8b54244c                       mov        edx, dword ptr [rsp + 0x4c]
00f53 81c200010000                   add        edx, 0x100
00f59 4103d6                         add        edx, r14d
00f5c 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00f61 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00f69 62917e487f84030c000000         vmovdqu32  zmmword ptr [r11 + r8 + 0xc], zmm0
00f74 62d17e486f84330c000000         vmovdqu32  zmm0, zmmword ptr [r11 + rsi + 0xc]
00f7f 62917e487f840b4c000000         vmovdqu32  zmmword ptr [r11 + r9 + 0x4c], zmm0
00f8a 62d17e486f842b0c000000         vmovdqu32  zmm0, zmmword ptr [r11 + rbp + 0xc]
00f95 62917e487f840b8c000000         vmovdqu32  zmmword ptr [r11 + r9 + 0x8c], zmm0
00fa0 62d17e486f840bcc000000         vmovdqu32  zmm0, zmmword ptr [r11 + rcx + 0xcc]
00fab 62917e487f840bcc000000         vmovdqu32  zmmword ptr [r11 + r9 + 0xcc], zmm0
00fb6 448bc2                         mov        r8d, edx
00fb9 62917e486f84030c000000         vmovdqu32  zmm0, zmmword ptr [r11 + r8 + 0xc]
00fc4 62917e487f840b0c010000         vmovdqu32  zmmword ptr [r11 + r9 + 0x10c], zmm0
00fcf 62d17e486f840b4c010000         vmovdqu32  zmm0, zmmword ptr [r11 + rcx + 0x14c]
00fda 62917e487f840b4c010000         vmovdqu32  zmmword ptr [r11 + r9 + 0x14c], zmm0
00fe5 62d17e486f840b8c010000         vmovdqu32  zmm0, zmmword ptr [r11 + rcx + 0x18c]
00ff0 62917e487f840b8c010000         vmovdqu32  zmmword ptr [r11 + r9 + 0x18c], zmm0
00ffb 4c63c2                         movsxd     r8, edx
00ffe 62917e486f8403cc000000         vmovdqu32  zmm0, zmmword ptr [r11 + r8 + 0xcc]
01009 62917e487f840bcc010000         vmovdqu32  zmmword ptr [r11 + r9 + 0x1cc], zmm0
01014 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01019 4181c300020000                 add        r11d, 0x200
01020 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01025 453bda                         cmp        r11d, r10d
01028 0f8ce2feffff                   jl         0x7f1e7fe92b90
0102e 443bdf                         cmp        r11d, edi
01031 7d47                           jge        0x7f1e7fe92cfa
01033 458bd3                         mov        r10d, r11d
01036 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0103b 90                             nop        
0103c 458bd6                         mov        r10d, r14d
0103f 440354244c                     add        r10d, dword ptr [rsp + 0x4c]
01044 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0104c 62917e486f84130c000000         vmovdqu32  zmm0, zmmword ptr [r11 + r10 + 0xc]
01057 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0105c 62917e487f84130c000000         vmovdqu32  zmmword ptr [r11 + r10 + 0xc], zmm0
01067 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0106c 4183c240                       add        r10d, 0x40
01070 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01075 443bd7                         cmp        r10d, edi
01078 7cc2                           jl         0x7f1e7fe92cbc
0107a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0107f 443bd3                         cmp        r10d, ebx
01082 7d32                           jge        0x7f1e7fe92d36
01084 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
01089 666690                         nop        
0108c 478d140e                       lea        r10d, [r14 + r9]
01090 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01098 4f8b5c130c                     mov        r11, qword ptr [r11 + r10 + 0xc]
0109d 458bd1                         mov        r10d, r9d
010a0 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
010a8 4f895c100c                     mov        qword ptr [r8 + r10 + 0xc], r11
010ad 4183c108                       add        r9d, 8
010b1 443bcb                         cmp        r9d, ebx
010b4 7cd6                           jl         0x7f1e7fe92d0c
010b6 895c2464                       mov        dword ptr [rsp + 0x64], ebx
010ba e9d1f5ffff                     jmp        0x7f1e7fe92310
010bf 448bd0                         mov        r10d, eax
010c2 4d63d2                         movsxd     r10, r10d
010c5 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
010cc c442a8f5db                     bzhi       r11, r11, r10
010d1 c4c1fb92fb                     kmovq      k7, r11
010d6 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
010dc 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
010e2 eb7a                           jmp        0x7f1e7fe92dde
010e4 4585c9                         test       r9d, r9d
010e7 0f8cfb1f0000                   jl         0x7f1e7fe94d68
010ed 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
010f2 4585d2                         test       r10d, r10d
010f5 0f8ced1f0000                   jl         0x7f1e7fe94d68
010fb 448b9424e8000000               mov        r10d, dword ptr [rsp + 0xe8]
01103 443b542460                     cmp        r10d, dword ptr [rsp + 0x60]
01108 0f82da1f0000                   jb         0x7f1e7fe94d68
0110e 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
01113 443bdb                         cmp        r11d, ebx
01116 0f82cc1f0000                   jb         0x7f1e7fe94d68
0111c 85c0                           test       eax, eax
0111e 743e                           je         0x7f1e7fe92dde
01120 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01125 4b8d7c0a0c                     lea        rdi, [r10 + r9 + 0xc]
0112a 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01132 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01137 4b8d74130c                     lea        rsi, [r11 + r10 + 0xc]
0113c 4883fa20                       cmp        rdx, 0x20
01140 0f8679ffffff                   jbe        0x7f1e7fe92d3f
01146 c5f877                         vzeroupper 
01149 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
01153 41ffd2                         call       r10
01156 0f1f840000000000               nop        dword ptr [rax + rax]
0115e 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01162 e969f2ffff                     jmp        0x7f1e7fe92050
01167 443bac249c000000               cmp        r13d, dword ptr [rsp + 0x9c]
0116f 0f8317200000                   jae        0x7f1e7fe94e0c
01175 4d63cd                         movsxd     r9, r13d
01178 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01180 c4817a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 0xc]
01187 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0118c 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
01194 0f839e200000                   jae        0x7f1e7fe94eb8
0119a 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0119f 418bca                         mov        ecx, r10d
011a2 418d6a10                       lea        ebp, [r10 + 0x10]
011a6 4d63da                         movsxd     r11, r10d
011a9 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
011b1 c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
011b8 3beb                           cmp        ebp, ebx
011ba 0f8d36020000                   jge        0x7f1e7fe93076
011c0 4d2bcb                         sub        r9, r11
011c3 4c63dd                         movsxd     r11, ebp
011c6 4f8d140b                       lea        r10, [r11 + r9]
011ca 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
011d2 0f8328210000                   jae        0x7f1e7fe94f80
011d8 4d8bd0                         mov        r10, r8
011db 4d2bd3                         sub        r10, r11
011de 4983c20f                       add        r10, 0xf
011e2 4983e2f0                       and        r10, 0xfffffffffffffff0
011e6 458bda                         mov        r11d, r10d
011e9 448bd1                         mov        r10d, ecx
011ec 478d541310                     lea        r10d, [r11 + r10 + 0x10]
011f1 4d63d2                         movsxd     r10, r10d
011f4 4f8d5c0af0                     lea        r11, [r10 + r9 - 0x10]
011f9 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
01201 0f83f9200000                   jae        0x7f1e7fe94f80
01207 3bac249c000000                 cmp        ebp, dword ptr [rsp + 0x9c]
0120e 0f83ec200000                   jae        0x7f1e7fe94f80
01214 4983c2f0                       add        r10, -0x10
01218 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
01220 0f83da200000                   jae        0x7f1e7fe94f80
01226 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
0122c 0f8f5a210000                   jg         0x7f1e7fe9500c
01232 442be9                         sub        r13d, ecx
01235 448d5920                       lea        r11d, [rcx + 0x20]
01239 666690                         nop        
0123c 458bd5                         mov        r10d, r13d
0123f 4403d5                         add        r10d, ebp
01242 8b8c2484000000                 mov        ecx, dword ptr [rsp + 0x84]
01249 c4a17a6f44110c                 vmovdqu    xmm0, xmmword ptr [rcx + r10 + 0xc]
01250 448bcd                         mov        r9d, ebp
01253 c4a17a7f44090c                 vmovdqu    xmmword ptr [rcx + r9 + 0xc], xmm0
0125a 83c510                         add        ebp, 0x10
0125d 413beb                         cmp        ebp, r11d
01260 7cda                           jl         0x7f1e7fe92ebc
01262 4981c010ffffff                 add        r8, -0xf0
01269 4981f800000080                 cmp        r8, -0x80000000
01270 49c7c200000080                 mov        r10, 0xffffffff80000000
01277 4d0f4cc2                       cmovl      r8, r10
0127b 418bf8                         mov        edi, r8d
0127e 3bef                           cmp        ebp, edi
01280 0f8d45010000                   jge        0x7f1e7fe9304b
01286 66660f1f840000000000           nop        word ptr [rax + rax]
01290 458bd5                         mov        r10d, r13d
01293 4403d5                         add        r10d, ebp
01296 448bc5                         mov        r8d, ebp
01299 4963c8                         movsxd     rcx, r8d
0129c 458bc2                         mov        r8d, r10d
0129f 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
012a7 c4817a6f44010c                 vmovdqu    xmm0, xmmword ptr [r9 + r8 + 0xc]
012ae 4d63c2                         movsxd     r8, r10d
012b1 448bd5                         mov        r10d, ebp
012b4 c4817a7f44110c                 vmovdqu    xmmword ptr [r9 + r10 + 0xc], xmm0
012bb c4817a6f44011c                 vmovdqu    xmm0, xmmword ptr [r9 + r8 + 0x1c]
012c2 c4c17a7f44091c                 vmovdqu    xmmword ptr [r9 + rcx + 0x1c], xmm0
012c9 c4817a6f44012c                 vmovdqu    xmm0, xmmword ptr [r9 + r8 + 0x2c]
012d0 c4c17a7f44092c                 vmovdqu    xmmword ptr [r9 + rcx + 0x2c], xmm0
012d7 c4817a6f44013c                 vmovdqu    xmm0, xmmword ptr [r9 + r8 + 0x3c]
012de c4c17a7f44093c                 vmovdqu    xmmword ptr [r9 + rcx + 0x3c], xmm0
012e5 c4817a6f44014c                 vmovdqu    xmm0, xmmword ptr [r9 + r8 + 0x4c]
012ec c4c17a7f44094c                 vmovdqu    xmmword ptr [r9 + rcx + 0x4c], xmm0
012f3 c4817a6f44015c                 vmovdqu    xmm0, xmmword ptr [r9 + r8 + 0x5c]
012fa c4c17a7f44095c                 vmovdqu    xmmword ptr [r9 + rcx + 0x5c], xmm0
01301 c4817a6f44016c                 vmovdqu    xmm0, xmmword ptr [r9 + r8 + 0x6c]
01308 c4c17a7f44096c                 vmovdqu    xmmword ptr [r9 + rcx + 0x6c], xmm0
0130f c4817a6f44017c                 vmovdqu    xmm0, xmmword ptr [r9 + r8 + 0x7c]
01316 c4c17a7f44097c                 vmovdqu    xmmword ptr [r9 + rcx + 0x7c], xmm0
0131d c4817a6f84018c000000           vmovdqu    xmm0, xmmword ptr [r9 + r8 + 0x8c]
01327 c4c17a7f84098c000000           vmovdqu    xmmword ptr [r9 + rcx + 0x8c], xmm0
01331 c4817a6f84019c000000           vmovdqu    xmm0, xmmword ptr [r9 + r8 + 0x9c]
0133b c4c17a7f84099c000000           vmovdqu    xmmword ptr [r9 + rcx + 0x9c], xmm0
01345 c4817a6f8401ac000000           vmovdqu    xmm0, xmmword ptr [r9 + r8 + 0xac]
0134f c4c17a7f8409ac000000           vmovdqu    xmmword ptr [r9 + rcx + 0xac], xmm0
01359 c4817a6f8401bc000000           vmovdqu    xmm0, xmmword ptr [r9 + r8 + 0xbc]
01363 c4c17a7f8409bc000000           vmovdqu    xmmword ptr [r9 + rcx + 0xbc], xmm0
0136d c4817a6f8401cc000000           vmovdqu    xmm0, xmmword ptr [r9 + r8 + 0xcc]
01377 c4c17a7f8409cc000000           vmovdqu    xmmword ptr [r9 + rcx + 0xcc], xmm0
01381 c4817a6f8401dc000000           vmovdqu    xmm0, xmmword ptr [r9 + r8 + 0xdc]
0138b c4c17a7f8409dc000000           vmovdqu    xmmword ptr [r9 + rcx + 0xdc], xmm0
01395 c4817a6f8401ec000000           vmovdqu    xmm0, xmmword ptr [r9 + r8 + 0xec]
0139f c4c17a7f8409ec000000           vmovdqu    xmmword ptr [r9 + rcx + 0xec], xmm0
013a9 c4817a6f8401fc000000           vmovdqu    xmm0, xmmword ptr [r9 + r8 + 0xfc]
013b3 c4c17a7f8409fc000000           vmovdqu    xmmword ptr [r9 + rcx + 0xfc], xmm0
013bd 81c500010000                   add        ebp, 0x100
013c3 3bef                           cmp        ebp, edi
013c5 0f8cc5feffff                   jl         0x7f1e7fe92f10
013cb 3beb                           cmp        ebp, ebx
013cd 7d27                           jge        0x7f1e7fe93076
013cf 90                             nop        
013d0 458bdd                         mov        r11d, r13d
013d3 4403dd                         add        r11d, ebp
013d6 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
013de c4817a6f44180c                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 0xc]
013e5 448bd5                         mov        r10d, ebp
013e8 c4817a7f44100c                 vmovdqu    xmmword ptr [r8 + r10 + 0xc], xmm0
013ef 83c510                         add        ebp, 0x10
013f2 3beb                           cmp        ebp, ebx
013f4 7cda                           jl         0x7f1e7fe93050
013f6 895c2464                       mov        dword ptr [rsp + 0x64], ebx
013fa e991f2ffff                     jmp        0x7f1e7fe92310
013ff 4903c9                         add        rcx, r9
01402 483b4c2440                     cmp        rcx, qword ptr [rsp + 0x40]
01407 7e08                           jle        0x7f1e7fe93091
01409 4533c0                         xor        r8d, r8d
0140c e9a2ecffff                     jmp        0x7f1e7fe91d33
01411 4533c0                         xor        r8d, r8d
01414 bb01000000                     mov        ebx, 1
01419 e997ecffff                     jmp        0x7f1e7fe91d35
0141e 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01426 418be9                         mov        ebp, r9d
01429 4489b424e0000000               mov        dword ptr [rsp + 0xe0], r14d
01431 898424e4000000                 mov        dword ptr [rsp + 0xe4], eax
01438 498bf2                         mov        rsi, r10
0143b 8b542464                       mov        edx, dword ptr [rsp + 0x64]
0143f 8b8c2480000000                 mov        ecx, dword ptr [rsp + 0x80]
01446 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
0144b 8bf8                           mov        edi, eax
0144d 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
01455 44891c24                       mov        dword ptr [rsp], r11d
01459 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0145e 44895c2408                     mov        dword ptr [rsp + 8], r11d
01463 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
0146b 90                             nop        
0146c c5f877                         vzeroupper 
0146f e86cd7a7ff                     call       0x7f1e7f910860
01474 0f1f84006c150002               nop        dword ptr [rax + rax + 0x200156c]
0147c 89442464                       mov        dword ptr [rsp + 0x64], eax
01480 e90bf2ffff                     jmp        0x7f1e7fe92310
01485 bee4ffffff                     mov        esi, 0xffffffe4
0148a 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0148f 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01494 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
0149c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
014a1 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
014a9 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
014ae 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
014b6 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
014bb 4c89542410                     mov        qword ptr [rsp + 0x10], r10
014c0 48894424f8                     mov        qword ptr [rsp - 8], rax
014c5 8b442464                       mov        eax, dword ptr [rsp + 0x64]
014c9 89442418                       mov        dword ptr [rsp + 0x18], eax
014cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014d2 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
014d7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
014dc 4489742428                     mov        dword ptr [rsp + 0x28], r14d
014e1 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
014e6 4c89542430                     mov        qword ptr [rsp + 0x30], r10
014eb 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
014f0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
014f5 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
014fa 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
014ff 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01504 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01509 89442448                       mov        dword ptr [rsp + 0x48], eax
0150d 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01512 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01517 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
0151c c5f877                         vzeroupper 
0151f e8bc4bb4ff                     call       0x7f1e7f9d7d60
01524 0f1f84001c160003               nop        dword ptr [rax + rax + 0x300161c]
0152c bee4ffffff                     mov        esi, 0xffffffe4
01531 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01536 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0153b 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01543 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01548 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01550 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01555 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
0155d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01562 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01567 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0156f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01574 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01579 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0157e 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01583 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01588 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0158d 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01592 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01597 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0159c 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
015a1 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
015a6 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
015ab 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
015b0 89442448                       mov        dword ptr [rsp + 0x48], eax
015b4 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
015b9 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
015be 48894424f8                     mov        qword ptr [rsp - 8], rax
015c3 8b442464                       mov        eax, dword ptr [rsp + 0x64]
015c7 89442458                       mov        dword ptr [rsp + 0x58], eax
015cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015d0 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
015d6 6690                           nop        
015d8 c5f877                         vzeroupper 
015db e8004bb4ff                     call       0x7f1e7f9d7d60
015e0 0f1f8400d8160004               nop        dword ptr [rax + rax + 0x40016d8]
015e8 bee4ffffff                     mov        esi, 0xffffffe4
015ed 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
015f2 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
015f7 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
015ff 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01604 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0160c 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01611 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01619 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0161e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01623 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0162b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01630 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01635 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0163a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0163f 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01644 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01649 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0164e 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01653 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01658 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0165d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01662 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01667 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0166c 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01671 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01676 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0167b 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01680 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01685 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
0168a 6690                           nop        
0168c c5f877                         vzeroupper 
0168f e84c4ab4ff                     call       0x7f1e7f9d7d60
01694 0f1f84008c170005               nop        dword ptr [rax + rax + 0x500178c]
0169c bee4ffffff                     mov        esi, 0xffffffe4
016a1 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
016a6 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
016ab 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
016b3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
016b8 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
016c0 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
016c5 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
016cd 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
016d2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
016d7 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
016df 448954240c                     mov        dword ptr [rsp + 0xc], r10d
016e4 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
016e9 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
016ee 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
016f3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
016f8 4489742428                     mov        dword ptr [rsp + 0x28], r14d
016fd 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01702 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01707 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0170c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01711 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01716 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0171b 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01720 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01725 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0172a 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0172f 895c2450                       mov        dword ptr [rsp + 0x50], ebx
01733 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
01739 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0173e 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01743 90                             nop        
01744 c5f877                         vzeroupper 
01747 e89449b4ff                     call       0x7f1e7f9d7d60
0174c 0f1f840044180006               nop        dword ptr [rax + rax + 0x6001844]
01754 be45ffffff                     mov        esi, 0xffffff45
01759 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01761 666690                         nop        
01764 c5f877                         vzeroupper 
01767 e87449b4ff                     call       0x7f1e7f9d7d60
0176c 0f1f840064180007               nop        dword ptr [rax + rax + 0x7001864]
01774 be45ffffff                     mov        esi, 0xffffff45
01779 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0177e 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01783 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0178b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01790 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01798 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0179d 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
017a5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
017aa 4c89542410                     mov        qword ptr [rsp + 0x10], r10
017af 48894424f8                     mov        qword ptr [rsp - 8], rax
017b4 8b442464                       mov        eax, dword ptr [rsp + 0x64]
017b8 89442418                       mov        dword ptr [rsp + 0x18], eax
017bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c1 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
017c6 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
017cb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
017d0 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
017d5 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
017da 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
017df 4c89542430                     mov        qword ptr [rsp + 0x30], r10
017e4 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
017e9 4c89542438                     mov        qword ptr [rsp + 0x38], r10
017ee 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
017f3 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
017f8 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
017fd 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01802 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01807 89442448                       mov        dword ptr [rsp + 0x48], eax
0180b 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
0180f 897c2450                       mov        dword ptr [rsp + 0x50], edi
01813 90                             nop        
01814 c5f877                         vzeroupper 
01817 e8c448b4ff                     call       0x7f1e7f9d7d60
0181c 0f1f840014190008               nop        dword ptr [rax + rax + 0x8001914]
01824 493bda                         cmp        rbx, r10
01827 bdffffffff                     mov        ebp, 0xffffffff
0182c 7c08                           jl         0x7f1e7fe934b6
0182e 400f95c5                       setne      bpl
01832 400fb6ed                       movzx      ebp, bpl
01836 be45ffffff                     mov        esi, 0xffffff45
0183b 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01840 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
01848 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0184d 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01855 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0185a 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
01862 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
01867 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0186c 48894424f8                     mov        qword ptr [rsp - 8], rax
01871 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01875 89442420                       mov        dword ptr [rsp + 0x20], eax
01879 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0187e 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01883 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01888 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0188d 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01892 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01897 89442450                       mov        dword ptr [rsp + 0x50], eax
0189b 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
018a0 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
018a5 4c89542460                     mov        qword ptr [rsp + 0x60], r10
018aa 6690                           nop        
018ac c5f877                         vzeroupper 
018af e82c48b4ff                     call       0x7f1e7f9d7d60
018b4 0f1f8400ac190009               nop        dword ptr [rax + rax + 0x90019ac]
018bc be45ffffff                     mov        esi, 0xffffff45
018c1 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
018c6 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
018cb 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
018d3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
018d8 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
018e0 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
018e5 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
018ed 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
018f2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
018f7 48894424f8                     mov        qword ptr [rsp - 8], rax
018fc 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01900 89442418                       mov        dword ptr [rsp + 0x18], eax
01904 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01909 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
0190e 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01913 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01918 4489742428                     mov        dword ptr [rsp + 0x28], r14d
0191d 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01922 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01927 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0192c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01931 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01936 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0193b 89442448                       mov        dword ptr [rsp + 0x48], eax
0193f 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01944 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01949 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0194e 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
01953 90                             nop        
01954 c5f877                         vzeroupper 
01957 e88447b4ff                     call       0x7f1e7f9d7d60
0195c 0f1f8400541a000a               nop        dword ptr [rax + rax + 0xa001a54]
01964 bee4ffffff                     mov        esi, 0xffffffe4
01969 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0196e 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01973 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0197b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01980 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01988 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0198d 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01995 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0199a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0199f 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
019a7 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
019ac 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
019b1 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
019b6 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
019bb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
019c0 4489742428                     mov        dword ptr [rsp + 0x28], r14d
019c5 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
019ca 4c89542430                     mov        qword ptr [rsp + 0x30], r10
019cf 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
019d4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
019d9 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
019de 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
019e3 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
019e8 4489542440                     mov        dword ptr [rsp + 0x40], r10d
019ed 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
019f2 4489542448                     mov        dword ptr [rsp + 0x48], r10d
019f7 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
019fb 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01a00 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01a05 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01a0a 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
01a0f 90                             nop        
01a10 c5f877                         vzeroupper 
01a13 e8c846b4ff                     call       0x7f1e7f9d7d60
01a18 0f1f8400101b000b               nop        dword ptr [rax + rax + 0xb001b10]
01a20 bee4ffffff                     mov        esi, 0xffffffe4
01a25 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01a2a 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01a2f 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01a37 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01a3c 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01a44 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01a49 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01a51 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01a56 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01a5b 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01a63 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01a68 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01a6d 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01a72 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01a77 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01a7c 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01a81 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01a86 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01a8b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01a90 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01a95 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01a9a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01a9f 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01aa4 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01aa9 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01aae 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01ab3 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01ab7 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
01abc 48897c2458                     mov        qword ptr [rsp + 0x58], rdi
01ac1 666690                         nop        
01ac4 c5f877                         vzeroupper 
01ac7 e81446b4ff                     call       0x7f1e7f9d7d60
01acc 0f1f8400c41b000c               nop        dword ptr [rax + rax + 0xc001bc4]
01ad4 4c8b442438                     mov        r8, qword ptr [rsp + 0x38]
01ad9 4d3bd8                         cmp        r11, r8
01adc bdffffffff                     mov        ebp, 0xffffffff
01ae1 7c08                           jl         0x7f1e7fe9376b
01ae3 400f95c5                       setne      bpl
01ae7 400fb6ed                       movzx      ebp, bpl
01aeb be45ffffff                     mov        esi, 0xffffff45
01af0 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01af5 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
01afd 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01b02 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01b0a 8b4c2418                       mov        ecx, dword ptr [rsp + 0x18]
01b0e 898c24ec000000                 mov        dword ptr [rsp + 0xec], ecx
01b15 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
01b1a 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01b1f 48894424f8                     mov        qword ptr [rsp - 8], rax
01b24 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01b28 89442420                       mov        dword ptr [rsp + 0x20], eax
01b2c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b31 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01b36 4c89442430                     mov        qword ptr [rsp + 0x30], r8
01b3b 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01b40 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
01b45 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01b4a 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01b4f 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
01b54 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01b59 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01b5d 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
01b62 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01b67 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01b6c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01b71 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01b76 6690                           nop        
01b78 c5f877                         vzeroupper 
01b7b e86045b4ff                     call       0x7f1e7f9d7d60
01b80 0f1f8400781c000d               nop        dword ptr [rax + rax + 0xd001c78]
01b88 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
01b8d 493be8                         cmp        rbp, r8
01b90 bdffffffff                     mov        ebp, 0xffffffff
01b95 7c08                           jl         0x7f1e7fe9381f
01b97 400f95c5                       setne      bpl
01b9b 400fb6ed                       movzx      ebp, bpl
01b9f be45ffffff                     mov        esi, 0xffffff45
01ba4 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01ba9 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
01bb1 8b4c240c                       mov        ecx, dword ptr [rsp + 0xc]
01bb5 898c24e8000000                 mov        dword ptr [rsp + 0xe8], ecx
01bbc 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01bc1 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01bc9 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
01bce 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01bd3 48894424f8                     mov        qword ptr [rsp - 8], rax
01bd8 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01bdc 89442420                       mov        dword ptr [rsp + 0x20], eax
01be0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01be5 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01bea 4c8b5c2438                     mov        r11, qword ptr [rsp + 0x38]
01bef 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
01bf4 4c89442438                     mov        qword ptr [rsp + 0x38], r8
01bf9 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01bfe 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01c03 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01c08 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01c0d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01c11 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01c16 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01c1b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01c20 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01c25 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01c2a 6690                           nop        
01c2c c5f877                         vzeroupper 
01c2f e8ac44b4ff                     call       0x7f1e7f9d7d60
01c34 0f1f84002c1d000e               nop        dword ptr [rax + rax + 0xe001d2c]
01c3c 4183c508                       add        r13d, 8
01c40 be6effffff                     mov        esi, 0xffffff6e
01c45 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01c4a 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01c4f 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01c57 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01c5c 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01c64 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01c69 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01c71 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01c76 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01c7b 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
01c80 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01c85 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01c8a 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01c8f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01c94 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01c99 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01c9e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01ca3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01ca8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01cad 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01cb2 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01cb7 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01cbc 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01cc1 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01cc6 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01ccb 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
01cd0 894c2458                       mov        dword ptr [rsp + 0x58], ecx
01cd4 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
01cd8 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01cdd 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01ce2 6690                           nop        
01ce4 c5f877                         vzeroupper 
01ce7 e8f443b4ff                     call       0x7f1e7f9d7d60
01cec 0f1f8400e41d000f               nop        dword ptr [rax + rax + 0xf001de4]
01cf4 4183c508                       add        r13d, 8
01cf8 be66ffffff                     mov        esi, 0xffffff66
01cfd 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01d02 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01d07 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01d0f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01d14 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01d1c 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01d21 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01d29 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01d2e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01d33 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
01d38 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01d3d 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01d42 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01d47 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01d4c 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01d51 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01d56 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01d5b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01d60 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01d65 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01d6a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01d6f 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01d74 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01d79 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01d7e 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01d83 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
01d88 894c2458                       mov        dword ptr [rsp + 0x58], ecx
01d8c 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
01d90 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01d95 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01d9a 6690                           nop        
01d9c c5f877                         vzeroupper 
01d9f e83c43b4ff                     call       0x7f1e7f9d7d60
01da4 0f1f84009c1e0010               nop        dword ptr [rax + rax + 0x10001e9c]
01dac beccffffff                     mov        esi, 0xffffffcc
01db1 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01db6 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01dbb 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01dc3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01dc8 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01dd0 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01dd5 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01ddd 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01de2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01de7 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01def 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01df4 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01df9 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01dfe 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01e03 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01e08 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01e0d 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01e12 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01e17 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01e1c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01e21 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01e26 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01e2b 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01e30 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01e35 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
01e3a 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01e3f 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01e44 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01e49 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01e4e 6690                           nop        
01e50 c5f877                         vzeroupper 
01e53 e88842b4ff                     call       0x7f1e7f9d7d60
01e58 0f1f8400501f0011               nop        dword ptr [rax + rax + 0x11001f50]
01e60 458bde                         mov        r11d, r14d
01e63 44035c244c                     add        r11d, dword ptr [rsp + 0x4c]
01e68 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01e70 4f8b5c1a0c                     mov        r11, qword ptr [r10 + r11 + 0xc]
01e75 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01e7a 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
01e82 4f895c100c                     mov        qword ptr [r8 + r10 + 0xc], r11
01e87 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01e8c 4183c208                       add        r10d, 8
01e90 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01e95 453bd1                         cmp        r10d, r9d
01e98 7cc6                           jl         0x7f1e7fe93ae0
01e9a 443bd7                         cmp        r10d, edi
01e9d 0f8d9f000000                   jge        0x7f1e7fe93bc2
01ea3 458bda                         mov        r11d, r10d
01ea6 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01eab 0f1f440000                     nop        dword ptr [rax + rax]
01eb0 458bce                         mov        r9d, r14d
01eb3 44034c244c                     add        r9d, dword ptr [rsp + 0x4c]
01eb8 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01ebd 4d63c2                         movsxd     r8, r10d
01ec0 458bd1                         mov        r10d, r9d
01ec3 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01ecb 4b8b4c130c                     mov        rcx, qword ptr [r11 + r10 + 0xc]
01ed0 4d63c9                         movsxd     r9, r9d
01ed3 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01ed8 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01ee0 4b894c1a0c                     mov        qword ptr [r10 + r11 + 0xc], rcx
01ee5 4f8b5c0a14                     mov        r11, qword ptr [r10 + r9 + 0x14]
01eea 4f895c0214                     mov        qword ptr [r10 + r8 + 0x14], r11
01eef 4f8b5c0a1c                     mov        r11, qword ptr [r10 + r9 + 0x1c]
01ef4 4f895c021c                     mov        qword ptr [r10 + r8 + 0x1c], r11
01ef9 4f8b5c0a24                     mov        r11, qword ptr [r10 + r9 + 0x24]
01efe 4f895c0224                     mov        qword ptr [r10 + r8 + 0x24], r11
01f03 4f8b5c0a2c                     mov        r11, qword ptr [r10 + r9 + 0x2c]
01f08 4f895c022c                     mov        qword ptr [r10 + r8 + 0x2c], r11
01f0d 4f8b5c0a34                     mov        r11, qword ptr [r10 + r9 + 0x34]
01f12 4f895c0234                     mov        qword ptr [r10 + r8 + 0x34], r11
01f17 4f8b5c0a3c                     mov        r11, qword ptr [r10 + r9 + 0x3c]
01f1c 4f895c023c                     mov        qword ptr [r10 + r8 + 0x3c], r11
01f21 4f8b5c0a44                     mov        r11, qword ptr [r10 + r9 + 0x44]
01f26 4f895c0244                     mov        qword ptr [r10 + r8 + 0x44], r11
01f2b 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01f30 4183c240                       add        r10d, 0x40
01f34 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01f39 443bd7                         cmp        r10d, edi
01f3c 0f8c6effffff                   jl         0x7f1e7fe93b30
01f42 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01f47 443bd3                         cmp        r10d, ebx
01f4a 0f8d66f1ffff                   jge        0x7f1e7fe92d36
01f50 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01f55 458bcb                         mov        r9d, r11d
01f58 478d1c0e                       lea        r11d, [r14 + r9]
01f5c 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01f64 4f8b5c1a0c                     mov        r11, qword ptr [r10 + r11 + 0xc]
01f69 458bd1                         mov        r10d, r9d
01f6c 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
01f74 4f895c100c                     mov        qword ptr [r8 + r10 + 0xc], r11
01f79 458d5108                       lea        r10d, [r9 + 8]
01f7d 458bca                         mov        r9d, r10d
01f80 443bd3                         cmp        r10d, ebx
01f83 7cd3                           jl         0x7f1e7fe93bd8
01f85 e92cf1ffff                     jmp        0x7f1e7fe92d36
01f8a bee4ffffff                     mov        esi, 0xffffffe4
01f8f 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01f94 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01f99 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01fa1 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01fa6 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01fae 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01fb3 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01fbb 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01fc0 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01fc5 48894424f8                     mov        qword ptr [rsp - 8], rax
01fca 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01fce 89442418                       mov        dword ptr [rsp + 0x18], eax
01fd2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd7 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01fdc 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01fe1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01fe6 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01feb 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01ff0 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01ff5 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01ffa 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01fff 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02004 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02009 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0200e 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02013 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02018 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0201d 89442448                       mov        dword ptr [rsp + 0x48], eax
02021 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
02025 897c245c                       mov        dword ptr [rsp + 0x5c], edi
02029 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0202e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02033 90                             nop        
02034 c5f877                         vzeroupper 
02037 e8a440b4ff                     call       0x7f1e7f9d7d60
0203c 0f1f840034210012               nop        dword ptr [rax + rax + 0x12002134]
02044 beccffffff                     mov        esi, 0xffffffcc
02049 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0204e 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02056 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0205b 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02063 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02068 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02070 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02075 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0207a 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02082 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02087 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0208c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02091 4489742424                     mov        dword ptr [rsp + 0x24], r14d
02096 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0209b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
020a0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
020a5 4c89542438                     mov        qword ptr [rsp + 0x38], r10
020aa 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
020af 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
020b4 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
020b9 4489542444                     mov        dword ptr [rsp + 0x44], r10d
020be 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
020c3 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
020c8 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
020cd 4489542454                     mov        dword ptr [rsp + 0x54], r10d
020d2 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
020d7 4c89542468                     mov        qword ptr [rsp + 0x68], r10
020dc 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
020e4 4489542464                     mov        dword ptr [rsp + 0x64], r10d
020e9 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
020ed 666690                         nop        
020f0 c5f877                         vzeroupper 
020f3 e8e83fb4ff                     call       0x7f1e7f9d7d60
020f8 0f1f8400f0210013               nop        dword ptr [rax + rax + 0x130021f0]
02100 bee4ffffff                     mov        esi, 0xffffffe4
02105 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0210a 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0210f 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02117 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0211c 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02124 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02129 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02131 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02136 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0213b 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02143 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02148 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0214d 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02152 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02157 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0215c 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
02161 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02166 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0216b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02170 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02175 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0217a 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0217f 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02184 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02189 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0218e 4489542454                     mov        dword ptr [rsp + 0x54], r10d
02193 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02198 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0219d 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
021a2 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
021a7 4c89542468                     mov        qword ptr [rsp + 0x68], r10
021ac c5f877                         vzeroupper 
021af e82c3fb4ff                     call       0x7f1e7f9d7d60
021b4 0f1f8400ac220014               nop        dword ptr [rax + rax + 0x140022ac]
021bc bee4ffffff                     mov        esi, 0xffffffe4
021c1 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
021c6 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
021ce 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
021d3 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
021db 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
021e0 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
021e8 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
021ed 4c89542418                     mov        qword ptr [rsp + 0x18], r10
021f2 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
021fa 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
021ff 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02204 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02209 4489742424                     mov        dword ptr [rsp + 0x24], r14d
0220e 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02213 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02218 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0221d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02222 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02227 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0222c 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02231 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02236 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
0223b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02240 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02245 666690                         nop        
02248 c5f877                         vzeroupper 
0224b e8903eb4ff                     call       0x7f1e7f9d7d60
02250 0f1f840048230015               nop        dword ptr [rax + rax + 0x15002348]
02258 418d6d01                       lea        ebp, [r13 + 1]
0225c bee4ffffff                     mov        esi, 0xffffffe4
02261 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02266 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0226e 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02273 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
0227b 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02280 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02288 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0228d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02292 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0229a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0229f 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
022a4 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
022a9 4489742424                     mov        dword ptr [rsp + 0x24], r14d
022ae 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
022b3 4c89542430                     mov        qword ptr [rsp + 0x30], r10
022b8 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
022bd 4c89542438                     mov        qword ptr [rsp + 0x38], r10
022c2 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
022c7 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
022cc 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
022d1 4489542444                     mov        dword ptr [rsp + 0x44], r10d
022d6 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
022db 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
022e0 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
022e5 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
022ea 4c89542468                     mov        qword ptr [rsp + 0x68], r10
022ef 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
022f4 c5f877                         vzeroupper 
022f7 e8e43db4ff                     call       0x7f1e7f9d7d60
022fc 0f1f8400f4230016               nop        dword ptr [rax + rax + 0x160023f4]
02304 bee4ffffff                     mov        esi, 0xffffffe4
02309 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0230e 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02316 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0231b 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02323 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02328 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02330 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02335 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0233a 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02342 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02347 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0234c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02351 4489742424                     mov        dword ptr [rsp + 0x24], r14d
02356 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0235b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02360 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02365 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0236a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0236f 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02374 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02379 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0237e 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02383 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02388 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
0238d 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02392 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02397 44894c2478                     mov        dword ptr [rsp + 0x78], r9d
0239c c5f877                         vzeroupper 
0239f e83c3db4ff                     call       0x7f1e7f9d7d60
023a4 0f1f84009c240017               nop        dword ptr [rax + rax + 0x1700249c]
023ac bee4ffffff                     mov        esi, 0xffffffe4
023b1 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
023b6 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
023bb 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
023c3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
023c8 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
023d0 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
023d5 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
023dd 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
023e2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
023e7 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
023ec 4489542418                     mov        dword ptr [rsp + 0x18], r10d
023f1 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
023f6 4c89542420                     mov        qword ptr [rsp + 0x20], r10
023fb 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
02400 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02405 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0240a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0240f 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02414 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02419 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0241e 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02423 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02428 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0242d 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02432 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02437 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0243c 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02441 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
02446 6690                           nop        
02448 c5f877                         vzeroupper 
0244b e8903cb4ff                     call       0x7f1e7f9d7d60
02450 0f1f840048250018               nop        dword ptr [rax + rax + 0x18002548]
02458 bee4ffffff                     mov        esi, 0xffffffe4
0245d 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02462 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02467 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
0246f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02474 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0247c 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02481 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02489 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0248e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02493 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0249b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
024a0 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
024a5 4489542418                     mov        dword ptr [rsp + 0x18], r10d
024aa 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
024af 4c89542420                     mov        qword ptr [rsp + 0x20], r10
024b4 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
024b9 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
024be 4c89542428                     mov        qword ptr [rsp + 0x28], r10
024c3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
024c8 4c89542430                     mov        qword ptr [rsp + 0x30], r10
024cd 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
024d2 4489542438                     mov        dword ptr [rsp + 0x38], r10d
024d7 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
024dc 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
024e1 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
024e6 4489542448                     mov        dword ptr [rsp + 0x48], r10d
024eb 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
024f0 4489542450                     mov        dword ptr [rsp + 0x50], r10d
024f5 44896c2460                     mov        dword ptr [rsp + 0x60], r13d
024fa 48ff742478                     push       qword ptr [rsp + 0x78]
024ff 488f442468                     pop        qword ptr [rsp + 0x68]
02504 4489442478                     mov        dword ptr [rsp + 0x78], r8d
02509 666690                         nop        
0250c c5f877                         vzeroupper 
0250f e8cc3bb4ff                     call       0x7f1e7f9d7d60
02514 0f1f84000c260019               nop        dword ptr [rax + rax + 0x1900260c]
0251c bee4ffffff                     mov        esi, 0xffffffe4
02521 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02526 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0252e 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02533 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
0253b 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02540 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02548 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0254d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02552 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0255a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0255f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02564 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02569 4489742424                     mov        dword ptr [rsp + 0x24], r14d
0256e 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02573 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02578 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0257d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02582 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02587 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0258c 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02591 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02596 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0259b 4489542450                     mov        dword ptr [rsp + 0x50], r10d
025a0 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
025a5 4489542458                     mov        dword ptr [rsp + 0x58], r10d
025aa 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
025af 4c89542460                     mov        qword ptr [rsp + 0x60], r10
025b4 48ff742470                     push       qword ptr [rsp + 0x70]
025b9 488f442468                     pop        qword ptr [rsp + 0x68]
025be 894c2474                       mov        dword ptr [rsp + 0x74], ecx
025c2 4489442478                     mov        dword ptr [rsp + 0x78], r8d
025c7 90                             nop        
025c8 c5f877                         vzeroupper 
025cb e8103bb4ff                     call       0x7f1e7f9d7d60
025d0 0f1f8400c826001a               nop        dword ptr [rax + rax + 0x1a0026c8]
025d8 4585c9                         test       r9d, r9d
025db 0f84370e0000                   je         0x7f1e7fe95098
025e1 4d8bc1                         mov        r8, r9
025e4 448b4c240c                     mov        r9d, dword ptr [rsp + 0xc]
025e9 4533db                         xor        r11d, r11d
025ec 458bd1                         mov        r10d, r9d
025ef e98ee6ffff                     jmp        0x7f1e7fe92902
025f4 be6effffff                     mov        esi, 0xffffff6e
025f9 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
025fe 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02603 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0260b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02610 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02618 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0261d 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02625 48894424f8                     mov        qword ptr [rsp - 8], rax
0262a 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0262e 89442418                       mov        dword ptr [rsp + 0x18], eax
02632 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02637 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
0263c 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02641 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02646 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0264b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
02650 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02655 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0265a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0265f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02664 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02669 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0266e 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02673 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02678 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0267d 89442448                       mov        dword ptr [rsp + 0x48], eax
02681 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02686 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0268b 895c2458                       mov        dword ptr [rsp + 0x58], ebx
0268f 897c2460                       mov        dword ptr [rsp + 0x60], edi
02693 90                             nop        
02694 c5f877                         vzeroupper 
02697 e8443ab4ff                     call       0x7f1e7f9d7d60
0269c 0f1f84009427001b               nop        dword ptr [rax + rax + 0x1b002794]
026a4 be45ffffff                     mov        esi, 0xffffff45
026a9 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
026ae 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
026b3 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
026bb 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
026c0 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
026c8 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
026cd 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
026d5 48894424f8                     mov        qword ptr [rsp - 8], rax
026da 8b442464                       mov        eax, dword ptr [rsp + 0x64]
026de 89442418                       mov        dword ptr [rsp + 0x18], eax
026e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026e7 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
026ec 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
026f1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
026f6 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
026fb 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
02700 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02705 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0270a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0270f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02714 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02719 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0271e 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02723 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02728 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0272d 89442448                       mov        dword ptr [rsp + 0x48], eax
02731 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
02735 897c245c                       mov        dword ptr [rsp + 0x5c], edi
02739 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0273e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02743 90                             nop        
02744 c5f877                         vzeroupper 
02747 e89439b4ff                     call       0x7f1e7f9d7d60
0274c 0f1f84004428001c               nop        dword ptr [rax + rax + 0x1c002844]
02754 be3dffffff                     mov        esi, 0xffffff3d
02759 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0275e 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02763 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0276b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02770 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02778 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0277d 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02785 48894424f8                     mov        qword ptr [rsp - 8], rax
0278a 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0278e 89442418                       mov        dword ptr [rsp + 0x18], eax
02792 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02797 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
0279c 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
027a1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
027a6 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
027ab 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
027b0 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
027b5 4c89542430                     mov        qword ptr [rsp + 0x30], r10
027ba 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
027bf 4c89542438                     mov        qword ptr [rsp + 0x38], r10
027c4 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
027c9 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
027ce 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
027d3 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
027d8 4489442444                     mov        dword ptr [rsp + 0x44], r8d
027dd 89442448                       mov        dword ptr [rsp + 0x48], eax
027e1 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
027e5 897c245c                       mov        dword ptr [rsp + 0x5c], edi
027e9 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
027ee 4c89542468                     mov        qword ptr [rsp + 0x68], r10
027f3 90                             nop        
027f4 c5f877                         vzeroupper 
027f7 e8e438b4ff                     call       0x7f1e7f9d7d60
027fc 0f1f8400f428001d               nop        dword ptr [rax + rax + 0x1d0028f4]
02804 bee4ffffff                     mov        esi, 0xffffffe4
02809 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0280e 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02816 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0281b 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02823 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02828 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02830 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02835 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0283a 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02842 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02847 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0284c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02851 4489742424                     mov        dword ptr [rsp + 0x24], r14d
02856 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0285b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02860 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02865 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0286a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0286f 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02874 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02879 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0287e 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02883 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02888 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0288d 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02892 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02897 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0289c 4489442474                     mov        dword ptr [rsp + 0x74], r8d
028a1 666690                         nop        
028a4 c5f877                         vzeroupper 
028a7 e83438b4ff                     call       0x7f1e7f9d7d60
028ac 0f1f8400a429001e               nop        dword ptr [rax + rax + 0x1e0029a4]
028b4 bee4ffffff                     mov        esi, 0xffffffe4
028b9 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
028be 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
028c6 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
028cb 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
028d3 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
028d8 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
028e0 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
028e5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
028ea 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
028f2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
028f7 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
028fc 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02901 4489742424                     mov        dword ptr [rsp + 0x24], r14d
02906 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0290b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02910 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02915 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0291a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0291f 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02924 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02929 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0292e 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02933 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02938 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0293d 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02942 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02947 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0294c 4489442470                     mov        dword ptr [rsp + 0x70], r8d
02951 666690                         nop        
02954 c5f877                         vzeroupper 
02957 e88437b4ff                     call       0x7f1e7f9d7d60
0295c 0f1f8400542a001f               nop        dword ptr [rax + rax + 0x1f002a54]
02964 beccffffff                     mov        esi, 0xffffffcc
02969 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0296e 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02973 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
0297b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02980 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02988 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0298d 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02995 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0299a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0299f 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
029a7 448954240c                     mov        dword ptr [rsp + 0xc], r10d
029ac 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
029b1 4489542418                     mov        dword ptr [rsp + 0x18], r10d
029b6 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
029bb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
029c0 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
029c5 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
029ca 4c89542428                     mov        qword ptr [rsp + 0x28], r10
029cf 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
029d4 4c89542430                     mov        qword ptr [rsp + 0x30], r10
029d9 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
029de 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
029e3 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
029e8 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
029ed 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
029f2 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
029f7 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
029fc 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02a01 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02a06 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02a0b 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02a10 c5f877                         vzeroupper 
02a13 e8c836b4ff                     call       0x7f1e7f9d7d60
02a18 0f1f8400102b0020               nop        dword ptr [rax + rax + 0x20002b10]
02a20 bee4ffffff                     mov        esi, 0xffffffe4
02a25 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02a2a 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02a2f 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02a37 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02a3c 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02a44 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02a49 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02a51 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02a56 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02a5b 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02a60 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02a65 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
02a6a 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02a6f 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02a74 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02a79 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02a7e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02a83 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02a88 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02a8d 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02a92 89442444                       mov        dword ptr [rsp + 0x44], eax
02a96 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02a9b 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02aa0 895c2450                       mov        dword ptr [rsp + 0x50], ebx
02aa4 48894424f8                     mov        qword ptr [rsp - 8], rax
02aa9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02aad 89442454                       mov        dword ptr [rsp + 0x54], eax
02ab1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ab6 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
02abb 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
02ac0 c5f877                         vzeroupper 
02ac3 e81836b4ff                     call       0x7f1e7f9d7d60
02ac8 0f1f8400c02b0021               nop        dword ptr [rax + rax + 0x21002bc0]
02ad0 bee4ffffff                     mov        esi, 0xffffffe4
02ad5 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02ada 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02adf 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02ae7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02aec 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02af4 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02af9 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02b01 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02b06 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02b0b 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02b13 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02b18 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02b1d 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02b22 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
02b27 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02b2c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02b31 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02b36 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02b3b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02b40 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02b45 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02b4a 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02b4f 89442444                       mov        dword ptr [rsp + 0x44], eax
02b53 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02b58 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02b5d 895c2450                       mov        dword ptr [rsp + 0x50], ebx
02b61 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
02b66 48894424f8                     mov        qword ptr [rsp - 8], rax
02b6b 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02b6f 89442460                       mov        dword ptr [rsp + 0x60], eax
02b73 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b78 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02b7d 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02b82 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02b8a 4489542478                     mov        dword ptr [rsp + 0x78], r10d
02b8f c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
02b98 c5f877                         vzeroupper 
02b9b e84035b4ff                     call       0x7f1e7f9d7d60
02ba0 0f1f8400982c0022               nop        dword ptr [rax + rax + 0x22002c98]
02ba8 418be9                         mov        ebp, r9d
02bab 83c510                         add        ebp, 0x10
02bae be6effffff                     mov        esi, 0xffffff6e
02bb3 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02bb8 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02bc0 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02bc5 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02bcd 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02bd2 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02bda 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02bdf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02be4 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
02be9 4489742424                     mov        dword ptr [rsp + 0x24], r14d
02bee 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02bf3 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02bf8 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02bfd 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02c02 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02c07 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02c0c 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02c11 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02c16 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02c1a 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02c1f 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02c24 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
02c28 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02c2d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
02c32 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02c37 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02c3c 89542478                       mov        dword ptr [rsp + 0x78], edx
02c40 c5f877                         vzeroupper 
02c43 e89834b4ff                     call       0x7f1e7f9d7d60
02c48 0f1f8400402d0023               nop        dword ptr [rax + rax + 0x23002d40]
02c50 418be9                         mov        ebp, r9d
02c53 83c510                         add        ebp, 0x10
02c56 be66ffffff                     mov        esi, 0xffffff66
02c5b 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02c60 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02c68 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02c6d 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02c75 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02c7a 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02c82 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02c87 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02c8c 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
02c91 4489742424                     mov        dword ptr [rsp + 0x24], r14d
02c96 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02c9b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02ca0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02ca5 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02caa 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02caf 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02cb4 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02cb9 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02cbe 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02cc2 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02cc7 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02ccc 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
02cd0 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02cd5 4c89542460                     mov        qword ptr [rsp + 0x60], r10
02cda 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02cdf 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02ce4 89542478                       mov        dword ptr [rsp + 0x78], edx
02ce8 c5f877                         vzeroupper 
02ceb e8f033b4ff                     call       0x7f1e7f9d7d60
02cf0 0f1f8400e82d0024               nop        dword ptr [rax + rax + 0x24002de8]
02cf8 be17000000                     mov        esi, 0x17
02cfd 666690                         nop        
02d00 c5f877                         vzeroupper 
02d03 e8d833b4ff                     call       0x7f1e7f9d7d60
02d08 0f1f8400002e0025               nop        dword ptr [rax + rax + 0x25002e00]
02d10 be6effffff                     mov        esi, 0xffffff6e
02d15 48899424e0000000               mov        qword ptr [rsp + 0xe0], rdx
02d1d 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02d22 48ff742428                     push       qword ptr [rsp + 0x28]
02d27 488f442420                     pop        qword ptr [rsp + 0x20]
02d2c 895c2428                       mov        dword ptr [rsp + 0x28], ebx
02d30 4c89442430                     mov        qword ptr [rsp + 0x30], r8
02d35 48ff742440                     push       qword ptr [rsp + 0x40]
02d3a 488f442438                     pop        qword ptr [rsp + 0x38]
02d3f 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
02d43 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
02d48 4c89742448                     mov        qword ptr [rsp + 0x48], r14
02d4d 666690                         nop        
02d50 c5f877                         vzeroupper 
02d53 e88833b4ff                     call       0x7f1e7f9d7d60
02d58 0f1f8400502e0026               nop        dword ptr [rax + rax + 0x26002e50]
02d60 bebeffffff                     mov        esi, 0xffffffbe
02d65 4c89ac24e0000000               mov        qword ptr [rsp + 0xe0], r13
02d6d 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02d72 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02d7a 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02d7f 4889442418                     mov        qword ptr [rsp + 0x18], rax
02d84 48ff742428                     push       qword ptr [rsp + 0x28]
02d89 488f442420                     pop        qword ptr [rsp + 0x20]
02d8e 895c2428                       mov        dword ptr [rsp + 0x28], ebx
02d92 4c89442430                     mov        qword ptr [rsp + 0x30], r8
02d97 48ff742440                     push       qword ptr [rsp + 0x40]
02d9c 488f442438                     pop        qword ptr [rsp + 0x38]
02da1 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
02da5 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
02daa 4c89742448                     mov        qword ptr [rsp + 0x48], r14
02daf 90                             nop        
02db0 c5f877                         vzeroupper 
02db3 e82833b4ff                     call       0x7f1e7f9d7d60
02db8 0f1f8400b02e0027               nop        dword ptr [rax + rax + 0x27002eb0]
02dc0 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
02dc5 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
02dca bef6ffffff                     mov        esi, 0xfffffff6
02dcf 498bed                         mov        rbp, r13
02dd2 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
02dda 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02de2 6690                           nop        
02de4 c5f877                         vzeroupper 
02de7 e8f432b4ff                     call       0x7f1e7f9d7d60
02dec 0f1f8400e42e0028               nop        dword ptr [rax + rax + 0x28002ee4]
02df4 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02df8 eb10                           jmp        0x7f1e7fe94a8a
02dfa 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02dfe eb0a                           jmp        0x7f1e7fe94a8a
02e00 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02e04 eb04                           jmp        0x7f1e7fe94a8a
02e06 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02e0a beccffffff                     mov        esi, 0xffffffcc
02e0f 4c89ac24e0000000               mov        qword ptr [rsp + 0xe0], r13
02e17 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02e1f 4c89742410                     mov        qword ptr [rsp + 0x10], r14
02e24 4c89442418                     mov        qword ptr [rsp + 0x18], r8
02e29 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02e2e 6690                           nop        
02e30 c5f877                         vzeroupper 
02e33 e8a832b4ff                     call       0x7f1e7f9d7d60
02e38 0f1f8400302f0029               nop        dword ptr [rax + rax + 0x29002f30]
02e40 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02e44 4c8b742478                     mov        r14, qword ptr [rsp + 0x78]
02e49 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
02e4e ebba                           jmp        0x7f1e7fe94a8a
02e50 bee4ffffff                     mov        esi, 0xffffffe4
02e55 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02e5a 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02e5f 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02e67 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02e6c 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02e74 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02e79 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02e81 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02e86 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02e8b 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02e93 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02e98 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02e9d 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02ea2 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02ea7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02eac 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
02eb1 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02eb6 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02ebb 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02ec0 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02ec5 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02eca 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02ecf 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02ed4 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02ed9 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02edd 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02ee2 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
02ee7 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
02eec c5f877                         vzeroupper 
02eef e8ec31b4ff                     call       0x7f1e7f9d7d60
02ef4 0f1f8400ec2f002a               nop        dword ptr [rax + rax + 0x2a002fec]
02efc bee4ffffff                     mov        esi, 0xffffffe4
02f01 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02f06 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02f0b 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02f13 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02f18 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02f20 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02f25 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02f2d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02f32 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02f37 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02f3c 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02f41 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02f46 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02f4b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02f50 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
02f55 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02f5a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02f5f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02f64 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02f69 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02f6e 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02f73 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02f78 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02f7d 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02f81 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02f86 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02f8b 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02f90 4c89542460                     mov        qword ptr [rsp + 0x60], r10
02f95 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02f99 48894c2470                     mov        qword ptr [rsp + 0x70], rcx
02f9e 6690                           nop        
02fa0 c5f877                         vzeroupper 
02fa3 e83831b4ff                     call       0x7f1e7f9d7d60
02fa8 0f1f8400a030002b               nop        dword ptr [rax + rax + 0x2b0030a0]
02fb0 448bd0                         mov        r10d, eax
02fb3 4183c208                       add        r10d, 8
02fb7 be6effffff                     mov        esi, 0xffffff6e
02fbc 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02fc1 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02fc6 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02fce 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02fd3 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
02fdb 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
02fe0 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
02fe8 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
02fed 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02ff2 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
02ff7 4489442418                     mov        dword ptr [rsp + 0x18], r8d
02ffc 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
03001 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
03006 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
0300b 4c8b5c2438                     mov        r11, qword ptr [rsp + 0x38]
03010 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
03015 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
0301a 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
0301f 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
03024 4489442438                     mov        dword ptr [rsp + 0x38], r8d
03029 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0302e 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
03033 895c2448                       mov        dword ptr [rsp + 0x48], ebx
03037 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0303c c5f877                         vzeroupper 
0303f e89c30b4ff                     call       0x7f1e7f9d7d60
03044 0f1f84003c31002c               nop        dword ptr [rax + rax + 0x2c00313c]
0304c 448bd0                         mov        r10d, eax
0304f 4183c208                       add        r10d, 8
03053 be66ffffff                     mov        esi, 0xffffff66
03058 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0305d 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
03062 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
0306a 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0306f 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
03077 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0307c 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
03084 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
03089 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0308e 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
03093 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
03098 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
0309d 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
030a2 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
030a7 4c8b5c2438                     mov        r11, qword ptr [rsp + 0x38]
030ac 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
030b1 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
030b6 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
030bb 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
030c0 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
030c5 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
030ca 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
030cf 895c2448                       mov        dword ptr [rsp + 0x48], ebx
030d3 4489542464                     mov        dword ptr [rsp + 0x64], r10d
030d8 c5f877                         vzeroupper 
030db e80030b4ff                     call       0x7f1e7f9d7d60
030e0 0f1f8400d831002d               nop        dword ptr [rax + rax + 0x2d0031d8]
030e8 beccffffff                     mov        esi, 0xffffffcc
030ed 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
030f2 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
030f7 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
030ff 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
03104 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0310c 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
03111 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
03119 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0311e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03123 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0312b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
03130 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
03135 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0313a 4489742428                     mov        dword ptr [rsp + 0x28], r14d
0313f 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
03144 4c89542430                     mov        qword ptr [rsp + 0x30], r10
03149 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0314e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
03153 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
03158 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0315d 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
03162 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
03167 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0316c 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
03171 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
03176 89442468                       mov        dword ptr [rsp + 0x68], eax
0317a 6690                           nop        
0317c c5f877                         vzeroupper 
0317f e85c2fb4ff                     call       0x7f1e7f9d7d60
03184 0f1f84007c32002e               nop        dword ptr [rax + rax + 0x2e00327c]
0318c bee4ffffff                     mov        esi, 0xffffffe4
03191 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
03196 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0319b 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
031a3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
031a8 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
031b0 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
031b5 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
031bd 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
031c2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
031c7 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
031cf 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
031d4 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
031d9 4489542418                     mov        dword ptr [rsp + 0x18], r10d
031de 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
031e3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
031e8 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
031ed 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
031f2 4c89542428                     mov        qword ptr [rsp + 0x28], r10
031f7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
031fc 4c89542430                     mov        qword ptr [rsp + 0x30], r10
03201 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
03206 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0320b 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
03210 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
03215 895c2444                       mov        dword ptr [rsp + 0x44], ebx
03219 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0321e 4489542448                     mov        dword ptr [rsp + 0x48], r10d
03223 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
03228 c5f877                         vzeroupper 
0322b e8b02eb4ff                     call       0x7f1e7f9d7d60
03230 0f1f84002833002f               nop        dword ptr [rax + rax + 0x2f003328]
03238 bee4ffffff                     mov        esi, 0xffffffe4
0323d 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
03242 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
03247 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
0324f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
03254 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0325c 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
03261 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
03269 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0326e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03273 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0327b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
03280 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
03285 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0328a 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0328f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
03294 448974241c                     mov        dword ptr [rsp + 0x1c], r14d
03299 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0329e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
032a3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
032a8 4c89542430                     mov        qword ptr [rsp + 0x30], r10
032ad 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
032b2 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
032b7 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
032bc 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
032c1 895c2444                       mov        dword ptr [rsp + 0x44], ebx
032c5 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
032ca 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
032cf 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
032d4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
032d9 4c89542460                     mov        qword ptr [rsp + 0x60], r10
032de 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
032e3 4c89542468                     mov        qword ptr [rsp + 0x68], r10
032e8 c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
032ee 6690                           nop        
032f0 c5f877                         vzeroupper 
032f3 e8e82db4ff                     call       0x7f1e7f9d7d60
032f8 0f1f8400f0330030               nop        dword ptr [rax + rax + 0x300033f0]
03300 4183c510                       add        r13d, 0x10
03304 be6effffff                     mov        esi, 0xffffff6e
03309 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0330e 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
03316 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0331b 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
03323 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
03328 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
03330 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03335 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0333a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0333f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
03344 4489742424                     mov        dword ptr [rsp + 0x24], r14d
03349 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0334e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
03353 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
03358 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0335d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
03362 4489542440                     mov        dword ptr [rsp + 0x40], r10d
03367 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0336c 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
03371 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
03376 895c2454                       mov        dword ptr [rsp + 0x54], ebx
0337a 6690                           nop        
0337c c5f877                         vzeroupper 
0337f e85c2db4ff                     call       0x7f1e7f9d7d60
03384 0f1f84007c340031               nop        dword ptr [rax + rax + 0x3100347c]
0338c 4183c510                       add        r13d, 0x10
03390 be66ffffff                     mov        esi, 0xffffff66
03395 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0339a 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
033a2 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
033a7 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
033af 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
033b4 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
033bc 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
033c1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
033c6 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
033cb 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
033d0 4489742424                     mov        dword ptr [rsp + 0x24], r14d
033d5 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
033da 4c89542430                     mov        qword ptr [rsp + 0x30], r10
033df 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
033e4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
033e9 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
033ee 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
033f3 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
033f8 4489542444                     mov        dword ptr [rsp + 0x44], r10d
033fd 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
03402 895c2454                       mov        dword ptr [rsp + 0x54], ebx
03406 6690                           nop        
03408 c5f877                         vzeroupper 
0340b e8d02cb4ff                     call       0x7f1e7f9d7d60
03410 0f1f840008350032               nop        dword ptr [rax + rax + 0x32003508]
03418 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0341d 4533c0                         xor        r8d, r8d
03420 e9a5f9ffff                     jmp        0x7f1e7fe94a4a
03425 bef6ffffff                     mov        esi, 0xfffffff6
0342a 6690                           nop        
0342c c5f877                         vzeroupper 
0342f e8ac2cb4ff                     call       0x7f1e7f9d7d60
03434 0f1f84002c350033               nop        dword ptr [rax + rax + 0x3300352c]
0343c 488bf0                         mov        rsi, rax
0343f c5f877                         vzeroupper 
03442 4881c4d0000000                 add        rsp, 0xd0
03449 5d                             pop        rbp
0344a e99158b4ff                     jmp        0x7f1e7f9da960
0344f 49ba7829e97f1e7f0000           movabs     r10, 0x7f1e7fe92978
03459 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
03460 e9fbdda7ff                     jmp        0x7f1e7f912ee0
03465 e8b6a9a6ff                     call       0x7f1e7f8ffaa0
0346a e9cfcbffff                     jmp        0x7f1e7fe91cbe
0346f f4                             hlt        
