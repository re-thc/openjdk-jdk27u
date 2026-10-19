00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c030a8ff                   jne        0x7f4c1b90f960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecc0000000                 sub        rsp, 0xc0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f8534330000                   jne        0x7f4c1be8fbf2
0003e 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4c89442408                     mov        qword ptr [rsp + 8], r8
0004b 4c8bee                         mov        r13, rsi
0004e 8b463c                         mov        eax, dword ptr [rsi + 0x3c]
00051 8b6e38                         mov        ebp, dword ptr [rsi + 0x38]
00054 448bd5                         mov        r10d, ebp
00057 442bd0                         sub        r10d, eax
0005a 448b8c24d0000000               mov        r9d, dword ptr [rsp + 0xd0]
00062 453bca                         cmp        r9d, r10d
00065 0f8fb9280000                   jg         0x7f4c1be8f1a4
0006b 4c8b4608                       mov        r8, qword ptr [rsi + 8]
0006f 488b4e20                       mov        rcx, qword ptr [rsi + 0x20]
00073 4c639424d0000000               movsxd     r10, dword ptr [rsp + 0xd0]
0007b 4c63d8                         movsxd     r11, eax
0007e 4d03d8                         add        r11, r8
00081 492bcb                         sub        rcx, r11
00084 4c3bd1                         cmp        r10, rcx
00087 0f8f97280000                   jg         0x7f4c1be8f1a4
0008d 488b4e10                       mov        rcx, qword ptr [rsi + 0x10]
00091 4c8b4e28                       mov        r9, qword ptr [rsi + 0x28]
00095 4d85c9                         test       r9, r9
00098 0f84160f0000                   je         0x7f4c1be8d834
0009e 33db                           xor        ebx, ebx
000a0 4c8bda                         mov        r11, rdx
000a3 8b7208                         mov        esi, dword ptr [rdx + 8]
000a6 458b7544                       mov        r14d, dword ptr [r13 + 0x44]
000aa 85ff                           test       edi, edi
000ac 0f8e7a1e0000                   jle        0x7f4c1be8e7ac
000b2 89ac2480000000                 mov        dword ptr [rsp + 0x80], ebp
000b9 897c2438                       mov        dword ptr [rsp + 0x38], edi
000bd 4889542450                     mov        qword ptr [rsp + 0x50], rdx
000c2 4c896c2478                     mov        qword ptr [rsp + 0x78], r13
000c7 4d2bc8                         sub        r9, r8
000ca 448d5ee0                       lea        r11d, [rsi - 0x20]
000ce 83c5e0                         add        ebp, -0x20
000d1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
000d6 458b5208                       mov        r10d, dword ptr [r10 + 8]
000da 4585d2                         test       r10d, r10d
000dd 0f8659280000                   jbe        0x7f4c1be8f1bc
000e3 4d63d2                         movsxd     r10, r10d
000e6 4863ff                         movsxd     rdi, edi
000e9 48ffcf                         dec        rdi
000ec 493bfa                         cmp        rdi, r10
000ef 0f8347280000                   jae        0x7f4c1be8f1bc
000f5 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
000fd 458b6a08                       mov        r13d, dword ptr [r10 + 8]
00101 4585ed                         test       r13d, r13d
00104 0f866a280000                   jbe        0x7f4c1be8f1f4
0010a 4183fd01                       cmp        r13d, 1
0010e 0f8660280000                   jbe        0x7f4c1be8f1f4
00114 4183fd02                       cmp        r13d, 2
00118 0f8656280000                   jbe        0x7f4c1be8f1f4
0011e 448d56f1                       lea        r10d, [rsi - 0xf]
00122 4585d2                         test       r10d, r10d
00125 0f8c49280000                   jl         0x7f4c1be8f1f4
0012b 418b7e08                       mov        edi, dword ptr [r14 + 8]
0012f 448d57f1                       lea        r10d, [rdi - 0xf]
00133 4585d2                         test       r10d, r10d
00136 0f8c38280000                   jl         0x7f4c1be8f1f4
0013c 448d57fd                       lea        r10d, [rdi - 3]
00140 4585d2                         test       r10d, r10d
00143 0f8c2b280000                   jl         0x7f4c1be8f1f4
00149 448d57f9                       lea        r10d, [rdi - 7]
0014d 4585d2                         test       r10d, r10d
00150 0f8c1e280000                   jl         0x7f4c1be8f1f4
00156 897c2404                       mov        dword ptr [rsp + 4], edi
0015a 4489ac24d4000000               mov        dword ptr [rsp + 0xd4], r13d
00162 896c2464                       mov        dword ptr [rsp + 0x64], ebp
00166 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0016b 89b424d0000000                 mov        dword ptr [rsp + 0xd0], esi
00172 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
00176 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
0017b 48894c2430                     mov        qword ptr [rsp + 0x30], rcx
00180 4c89442420                     mov        qword ptr [rsp + 0x20], r8
00185 498bde                         mov        rbx, r14
00188 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
0018d 4489742460                     mov        dword ptr [rsp + 0x60], r14d
00192 448bef                         mov        r13d, edi
00195 8bde                           mov        ebx, esi
00197 895c2418                       mov        dword ptr [rsp + 0x18], ebx
0019b 418d5df9                       lea        ebx, [r13 - 7]
0019f 895c2468                       mov        dword ptr [rsp + 0x68], ebx
001a3 8b5c2418                       mov        ebx, dword ptr [rsp + 0x18]
001a7 83c3f1                         add        ebx, -0xf
001aa 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
001ae 418d5dfd                       lea        ebx, [r13 - 3]
001b2 895c2458                       mov        dword ptr [rsp + 0x58], ebx
001b6 4963dd                         movsxd     rbx, r13d
001b9 4183c5f1                       add        r13d, -0xf
001bd 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
001c5 4c8d6bf9                       lea        r13, [rbx - 7]
001c9 4c89ac2488000000               mov        qword ptr [rsp + 0x88], r13
001d1 4883c3f1                       add        rbx, -0xf
001d5 48899c2490000000               mov        qword ptr [rsp + 0x90], rbx
001dd 4533d2                         xor        r10d, r10d
001e0 33db                           xor        ebx, ebx
001e2 899c24a0000000                 mov        dword ptr [rsp + 0xa0], ebx
001e9 e912040000                     jmp        0x7f4c1be8ce80
001ee 448bdd                         mov        r11d, ebp
001f1 4d63d3                         movsxd     r10, r11d
001f4 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
001fb c442a8f5db                     bzhi       r11, r11, r10
00200 c4c1fb92fb                     kmovq      k7, r11
00205 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0020b 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00211 4403ed                         add        r13d, ebp
00214 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00218 418502                         test       dword ptr [r10], eax
0021b 443b6c2448                     cmp        r13d, dword ptr [rsp + 0x48]
00220 0f8db1030000                   jge        0x7f4c1be8ce57
00226 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
0022b 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00230 452bd5                         sub        r10d, r13d
00233 418bca                         mov        ecx, r10d
00236 8b6c2448                       mov        ebp, dword ptr [rsp + 0x48]
0023a 412bed                         sub        ebp, r13d
0023d 413bed                         cmp        ebp, r13d
00240 410f4fed                       cmovg      ebp, r13d
00244 4585d2                         test       r10d, r10d
00247 0f8cf3210000                   jl         0x7f4c1be8ecc0
0024d 448b74245c                     mov        r14d, dword ptr [rsp + 0x5c]
00252 4585f6                         test       r14d, r14d
00255 0f8ce5210000                   jl         0x7f4c1be8ecc0
0025b 458d042a                       lea        r8d, [r10 + rbp]
0025f 448b742404                     mov        r14d, dword ptr [rsp + 4]
00264 453bf0                         cmp        r14d, r8d
00267 0f82d3210000                   jb         0x7f4c1be8ecc0
0026d 448b74245c                     mov        r14d, dword ptr [rsp + 0x5c]
00272 4403f5                         add        r14d, ebp
00275 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0027a 453bde                         cmp        r11d, r14d
0027d 0f82bd210000                   jb         0x7f4c1be8ecc0
00283 85ed                           test       ebp, ebp
00285 0f8cb5210000                   jl         0x7f4c1be8ecc0
0028b 85ed                           test       ebp, ebp
0028d 0f847effffff                   je         0x7f4c1be8ca91
00293 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
00298 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0029d 4b8d74030c                     lea        rsi, [r11 + r8 + 0xc]
002a2 4b8d7c130c                     lea        rdi, [r11 + r10 + 0xc]
002a7 4863d5                         movsxd     rdx, ebp
002aa 4883fa20                       cmp        rdx, 0x20
002ae 0f863affffff                   jbe        0x7f4c1be8ca6e
002b4 c5f877                         vzeroupper 
002b7 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
002c1 41ffd2                         call       r10
002c4 0f1f840000000000               nop        dword ptr [rax + rax]
002cc e940ffffff                     jmp        0x7f4c1be8ca91
002d1 48894424f8                     mov        qword ptr [rsp - 8], rax
002d6 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
002da 89442444                       mov        dword ptr [rsp + 0x44], eax
002de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
002e3 4585ed                         test       r13d, r13d
002e6 0f8e44120000                   jle        0x7f4c1be8ddb0
002ec 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
002f1 44034c245c                     add        r9d, dword ptr [rsp + 0x5c]
002f6 443b4c2464                     cmp        r9d, dword ptr [rsp + 0x64]
002fb 0f8f8f130000                   jg         0x7f4c1be8df10
00301 458d1c1a                       lea        r11d, [r10 + rbx]
00305 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
0030d 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
00312 0f8f34140000                   jg         0x7f4c1be8dfcc
00318 83fb10                         cmp        ebx, 0x10
0031b 0f8f67060000                   jg         0x7f4c1be8d208
00321 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
00326 0f83320f0000                   jae        0x7f4c1be8dade
0032c 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00331 c4817a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 0xc]
00338 3b842484000000                 cmp        eax, dword ptr [rsp + 0x84]
0033f 0f83df0f0000                   jae        0x7f4c1be8dba4
00345 468d3413                       lea        r14d, [rbx + r10]
00349 4489b42498000000               mov        dword ptr [rsp + 0x98], r14d
00351 448b742460                     mov        r14d, dword ptr [rsp + 0x60]
00356 c4c17a7f44060c                 vmovdqu    xmmword ptr [r14 + rax + 0xc], xmm0
0035d 03d8                           add        ebx, eax
0035f 448bf3                         mov        r14d, ebx
00362 452bf5                         sub        r14d, r13d
00365 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0036a 4183f810                       cmp        r8d, 0x10
0036e 7f44                           jg         0x7f4c1be8cc34
00370 4183fd10                       cmp        r13d, 0x10
00374 7c3e                           jl         0x7f4c1be8cc34
00376 443bb42484000000               cmp        r14d, dword ptr [rsp + 0x84]
0037e 0f836c100000                   jae        0x7f4c1be8dc70
00384 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
00389 c4817a6f44350c                 vmovdqu    xmm0, xmmword ptr [r13 + r14 + 0xc]
00390 3b9c2484000000                 cmp        ebx, dword ptr [rsp + 0x84]
00397 0f83df100000                   jae        0x7f4c1be8dcfc
0039d c4c17a7f441d0c                 vmovdqu    xmmword ptr [r13 + rbx + 0xc], xmm0
003a4 4403c3                         add        r8d, ebx
003a7 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
003af e923020000                     jmp        0x7f4c1be8ce57
003b4 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
003b9 4b8d7c330c                     lea        rdi, [r11 + r14 + 0xc]
003be 498d741b0c                     lea        rsi, [r11 + rbx + 0xc]
003c3 458d1c18                       lea        r11d, [r8 + rbx]
003c7 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
003cf 4d63cb                         movsxd     r9, r11d
003d2 453be8                         cmp        r13d, r8d
003d5 0f8ccb030000                   jl         0x7f4c1be8d026
003db 4183f830                       cmp        r8d, 0x30
003df 0f8e8e000000                   jle        0x7f4c1be8ccf3
003e5 4585f6                         test       r14d, r14d
003e8 0f8c9e180000                   jl         0x7f4c1be8e50c
003ee 85db                           test       ebx, ebx
003f0 0f8c96180000                   jl         0x7f4c1be8e50c
003f6 478d2c30                       lea        r13d, [r8 + r14]
003fa 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
003ff 453bdd                         cmp        r11d, r13d
00402 0f8284180000                   jb         0x7f4c1be8e50c
00408 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
00410 0f8276180000                   jb         0x7f4c1be8e50c
00416 4585c0                         test       r8d, r8d
00419 0f8465180000                   je         0x7f4c1be8e504
0041f 4963d0                         movsxd     rdx, r8d
00422 4883fa20                       cmp        rdx, 0x20
00426 772b                           ja         0x7f4c1be8ccd3
00428 458be8                         mov        r13d, r8d
0042b 4d63d5                         movsxd     r10, r13d
0042e 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00435 c442a8f5db                     bzhi       r11, r11, r10
0043a c4c1fb92fb                     kmovq      k7, r11
0043f 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00445 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0044b 418be8                         mov        ebp, r8d
0044e e97b010000                     jmp        0x7f4c1be8ce4e
00453 418be8                         mov        ebp, r8d
00456 c5f877                         vzeroupper 
00459 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00463 41ffd2                         call       r10
00466 0f1f840000000000               nop        dword ptr [rax + rax]
0046e e95b010000                     jmp        0x7f4c1be8ce4e
00473 443b742468                     cmp        r14d, dword ptr [rsp + 0x68]
00478 0f83ba140000                   jae        0x7f4c1be8e1b8
0047e 4d63d6                         movsxd     r10, r14d
00481 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
00486 4f8b5c150c                     mov        r11, qword ptr [r13 + r10 + 0xc]
0048b 3b5c2468                       cmp        ebx, dword ptr [rsp + 0x68]
0048f 0f8387150000                   jae        0x7f4c1be8e29c
00495 8bfb                           mov        edi, ebx
00497 8d4f08                         lea        ecx, [rdi + 8]
0049a 4863d7                         movsxd     rdx, edi
0049d 4d895c150c                     mov        qword ptr [r13 + rdx + 0xc], r11
004a2 3b8c249c000000                 cmp        ecx, dword ptr [rsp + 0x9c]
004a9 7c08                           jl         0x7f4c1be8cd33
004ab 418be8                         mov        ebp, r8d
004ae e91b010000                     jmp        0x7f4c1be8ce4e
004b3 4c2bd2                         sub        r10, rdx
004b6 4863d1                         movsxd     rdx, ecx
004b9 4e8d1c12                       lea        r11, [rdx + r10]
004bd 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
004c5 0f8329160000                   jae        0x7f4c1be8e374
004cb 4d8bd9                         mov        r11, r9
004ce 4c2bda                         sub        r11, rdx
004d1 4983c307                       add        r11, 7
004d5 4983e3f8                       and        r11, 0xfffffffffffffff8
004d9 458bdb                         mov        r11d, r11d
004dc 418d543b08                     lea        edx, [r11 + rdi + 8]
004e1 4c63da                         movsxd     r11, edx
004e4 4f8d5413f8                     lea        r10, [r11 + r10 - 8]
004e9 4c3b942488000000               cmp        r10, qword ptr [rsp + 0x88]
004f1 0f83fd150000                   jae        0x7f4c1be8e374
004f7 3b4c2468                       cmp        ecx, dword ptr [rsp + 0x68]
004fb 0f83f3150000                   jae        0x7f4c1be8e374
00501 4983c3f8                       add        r11, -8
00505 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
0050d 0f83e1150000                   jae        0x7f4c1be8e374
00513 448bac249c000000               mov        r13d, dword ptr [rsp + 0x9c]
0051b 4181fdf8ffff7f                 cmp        r13d, 0x7ffffff8
00522 0f8f9c160000                   jg         0x7f4c1be8e444
00528 442bf7                         sub        r14d, edi
0052b 83c710                         add        edi, 0x10
0052e 418be8                         mov        ebp, r8d
00531 458d1c0e                       lea        r11d, [r14 + rcx]
00535 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
0053a 4f8b5c1d0c                     mov        r11, qword ptr [r13 + r11 + 0xc]
0053f 448bd1                         mov        r10d, ecx
00542 4f895c150c                     mov        qword ptr [r13 + r10 + 0xc], r11
00547 83c108                         add        ecx, 8
0054a 3bcf                           cmp        ecx, edi
0054c 7ce3                           jl         0x7f4c1be8cdb1
0054e 4983c1f8                       add        r9, -8
00552 4981f900000080                 cmp        r9, -0x80000000
00559 49c7c200000080                 mov        r10, 0xffffffff80000000
00560 4d0f4cca                       cmovl      r9, r10
00564 418bf9                         mov        edi, r9d
00567 3bcf                           cmp        ecx, edi
00569 7d38                           jge        0x7f4c1be8ce23
0056b 0f1f440000                     nop        dword ptr [rax + rax]
00570 458d140e                       lea        r10d, [r14 + rcx]
00574 448bd9                         mov        r11d, ecx
00577 4d63cb                         movsxd     r9, r11d
0057a 458bda                         mov        r11d, r10d
0057d 4b8b541d0c                     mov        rdx, qword ptr [r13 + r11 + 0xc]
00582 4d63d2                         movsxd     r10, r10d
00585 448bd9                         mov        r11d, ecx
00588 4b89541d0c                     mov        qword ptr [r13 + r11 + 0xc], rdx
0058d 4f8b541514                     mov        r10, qword ptr [r13 + r10 + 0x14]
00592 4f89540d14                     mov        qword ptr [r13 + r9 + 0x14], r10
00597 83c110                         add        ecx, 0x10
0059a 3bcf                           cmp        ecx, edi
0059c 7cd2                           jl         0x7f4c1be8cdf0
0059e 44896c2460                     mov        dword ptr [rsp + 0x60], r13d
005a3 3b8c249c000000                 cmp        ecx, dword ptr [rsp + 0x9c]
005aa 7d22                           jge        0x7f4c1be8ce4e
005ac 458d1c0e                       lea        r11d, [r14 + rcx]
005b0 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
005b5 4f8b5c1d0c                     mov        r11, qword ptr [r13 + r11 + 0xc]
005ba 448bd1                         mov        r10d, ecx
005bd 4f895c150c                     mov        qword ptr [r13 + r10 + 0xc], r11
005c2 83c108                         add        ecx, 8
005c5 3b8c249c000000                 cmp        ecx, dword ptr [rsp + 0x9c]
005cc 7cde                           jl         0x7f4c1be8ce2c
005ce 03dd                           add        ebx, ebp
005d0 899c249c000000                 mov        dword ptr [rsp + 0x9c], ebx
005d7 8b9c24a0000000                 mov        ebx, dword ptr [rsp + 0xa0]
005de ffc3                           inc        ebx
005e0 3b5c2438                       cmp        ebx, dword ptr [rsp + 0x38]
005e4 0f8d6d050000                   jge        0x7f4c1be8d3d7
005ea 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
005f2 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
005f9 899c24a0000000                 mov        dword ptr [rsp + 0xa0], ebx
00600 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00605 8b9c24a0000000                 mov        ebx, dword ptr [rsp + 0xa0]
0060c 4d8b5cdb10                     mov        r11, qword ptr [r11 + rbx*8 + 0x10]
00611 418bdb                         mov        ebx, r11d
00614 81e3ffff0100                   and        ebx, 0x1ffff
0061a 4d8bc3                         mov        r8, r11
0061d 49c1e812                       shr        r8, 0x12
00621 49c1fb24                       sar        r11, 0x24
00625 458bf0                         mov        r14d, r8d
00628 458beb                         mov        r13d, r11d
0062b 4181e6ffff0300                 and        r14d, 0x3ffff
00632 4489742448                     mov        dword ptr [rsp + 0x48], r14d
00637 4585ed                         test       r13d, r13d
0063a 0f8c180f0000                   jl         0x7f4c1be8ddd8
00640 85db                           test       ebx, ebx
00642 0f858e000000                   jne        0x7f4c1be8cf56
00648 33db                           xor        ebx, ebx
0064a 4183fd03                       cmp        r13d, 3
0064e 0f8eb4000000                   jle        0x7f4c1be8cf88
00654 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0065c 458b4310                       mov        r8d, dword ptr [r11 + 0x10]
00660 45894314                       mov        dword ptr [r11 + 0x14], r8d
00664 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
00668 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
00670 45895810                       mov        dword ptr [r8 + 0x10], r11d
00674 4183c5fd                       add        r13d, -3
00678 4589680c                       mov        dword ptr [r8 + 0xc], r13d
0067c 4963ed                         movsxd     rbp, r13d
0067f 4c63d8                         movsxd     r11, eax
00682 4c035c2420                     add        r11, qword ptr [rsp + 0x20]
00687 4863d3                         movsxd     rdx, ebx
0068a 4c03da                         add        r11, rdx
0068d 493beb                         cmp        rbp, r11
00690 0f8f5a0f0000                   jg         0x7f4c1be8de70
00696 448d3418                       lea        r14d, [rax + rbx]
0069a 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
0069f 452bf5                         sub        r14d, r13d
006a2 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
006a7 4585c9                         test       r9d, r9d
006aa 0f8521fcffff                   jne        0x7f4c1be8cb51
006b0 4d63c6                         movsxd     r8, r14d
006b3 4c3b442428                     cmp        r8, qword ptr [rsp + 0x28]
006b8 0f8c32110000                   jl         0x7f4c1be8e070
006be 483b6c2430                     cmp        rbp, qword ptr [rsp + 0x30]
006c3 0f8fcb110000                   jg         0x7f4c1be8e114
006c9 4533c0                         xor        r8d, r8d
006cc 4489442444                     mov        dword ptr [rsp + 0x44], r8d
006d1 e90dfcffff                     jmp        0x7f4c1be8cb63
006d6 448b1c24                       mov        r11d, dword ptr [rsp]
006da 452bda                         sub        r11d, r10d
006dd 413bdb                         cmp        ebx, r11d
006e0 0f8e64ffffff                   jle        0x7f4c1be8ceca
006e6 be45ffffff                     mov        esi, 0xffffff45
006eb 8beb                           mov        ebp, ebx
006ed 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
006f5 666690                         nop        
006f8 c5f877                         vzeroupper 
006fb e8e0adb4ff                     call       0x7f4c1b9d7d60
00700 0f1f8400f8070001               nop        dword ptr [rax + rax + 0x10007f8]
00708 85db                           test       ebx, ebx
0070a 7403                           je         0x7f4c1be8cf8f
0070c 41ffcd                         dec        r13d
0070f 4585ed                         test       r13d, r13d
00712 7511                           jne        0x7f4c1be8cfa5
00714 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0071c 458b4b0c                       mov        r9d, dword ptr [r11 + 0xc]
00720 e979000000                     jmp        0x7f4c1be8d01e
00725 4183fd03                       cmp        r13d, 3
00729 0f84791e0000                   je         0x7f4c1be8ee28
0072f 4183fd02                       cmp        r13d, 2
00733 0f872b1f0000                   ja         0x7f4c1be8eee4
00739 443bac24d4000000               cmp        r13d, dword ptr [rsp + 0xd4]
00741 0f8329170000                   jae        0x7f4c1be8e6f0
00747 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0074f 478b4cab0c                     mov        r9d, dword ptr [r11 + r13*4 + 0xc]
00754 4585ed                         test       r13d, r13d
00757 7e39                           jle        0x7f4c1be8d012
00759 458d45ff                       lea        r8d, [r13 - 1]
0075d 443b8424d4000000               cmp        r8d, dword ptr [rsp + 0xd4]
00765 0f837d1d0000                   jae        0x7f4c1be8ed68
0076b 0f1f440000                     nop        dword ptr [rax + rax]
00770 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00778 478b5cab08                     mov        r11d, dword ptr [r11 + r13*4 + 8]
0077d 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
00785 47895ca80c                     mov        dword ptr [r8 + r13*4 + 0xc], r11d
0078a 41ffcd                         dec        r13d
0078d 4585ed                         test       r13d, r13d
00790 7fde                           jg         0x7f4c1be8cff0
00792 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0079a 45894b0c                       mov        dword ptr [r11 + 0xc], r9d
0079e 458be9                         mov        r13d, r9d
007a1 e9d6feffff                     jmp        0x7f4c1be8cefc
007a6 4183fd10                       cmp        r13d, 0x10
007aa 0f8d21080000                   jge        0x7f4c1be8d851
007b0 4183fd08                       cmp        r13d, 8
007b4 0f8d9d040000                   jge        0x7f4c1be8d4d7
007ba 4183f810                       cmp        r8d, 0x10
007be 0f8f2e010000                   jg         0x7f4c1be8d172
007c4 443b742404                     cmp        r14d, dword ptr [rsp + 4]
007c9 0f8378170000                   jae        0x7f4c1be8e7c7
007cf 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
007d4 430fbe6c320c                   movsx      ebp, byte ptr [r10 + r14 + 0xc]
007da 3b5c2404                       cmp        ebx, dword ptr [rsp + 4]
007de 0f8328180000                   jae        0x7f4c1be8e88c
007e4 41886c1a0c                     mov        byte ptr [r10 + rbx + 0xc], bpl
007e9 448d5301                       lea        r10d, [rbx + 1]
007ed 418bca                         mov        ecx, r10d
007f0 458d5603                       lea        r10d, [r14 + 3]
007f4 443b542404                     cmp        r10d, dword ptr [rsp + 4]
007f9 0f83b1180000                   jae        0x7f4c1be8e930
007ff 4d63ce                         movsxd     r9, r14d
00802 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00807 430fbe6c0b0d                   movsx      ebp, byte ptr [r11 + r9 + 0xd]
0080d 448d5303                       lea        r10d, [rbx + 3]
00811 443b542404                     cmp        r10d, dword ptr [rsp + 4]
00816 0f834c190000                   jae        0x7f4c1be8e9e8
0081c 4863cb                         movsxd     rcx, ebx
0081f 41886c0b0d                     mov        byte ptr [r11 + rcx + 0xd], bpl
00824 470fbe540b0e                   movsx      r10d, byte ptr [r11 + r9 + 0xe]
0082a 4588540b0e                     mov        byte ptr [r11 + rcx + 0xe], r10b
0082f 470fbe5c0b0f                   movsx      r11d, byte ptr [r11 + r9 + 0xf]
00835 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0083a 45885c090f                     mov        byte ptr [r9 + rcx + 0xf], r11b
0083f 4183fd08                       cmp        r13d, 8
00843 0f83c7190000                   jae        0x7f4c1be8ea90
00849 49bae0df2fe300000000           movabs     r10, 0xe32fdfe0
00853 470374aa0c                     add        r14d, dword ptr [r10 + r13*4 + 0xc]
00858 4183f804                       cmp        r8d, 4
0085c 7e3b                           jle        0x7f4c1be8d119
0085e 448d5304                       lea        r10d, [rbx + 4]
00862 418bca                         mov        ecx, r10d
00865 443b742458                     cmp        r14d, dword ptr [rsp + 0x58]
0086a 0f83441a0000                   jae        0x7f4c1be8eb34
00870 458bd6                         mov        r10d, r14d
00873 458bca                         mov        r9d, r10d
00876 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0087b 438b6c130c                     mov        ebp, dword ptr [r11 + r10 + 0xc]
00880 448bd1                         mov        r10d, ecx
00883 443b542458                     cmp        r10d, dword ptr [rsp + 0x58]
00888 0f83fe1a0000                   jae        0x7f4c1be8ec0c
0088e 448bd3                         mov        r10d, ebx
00891 4d63d2                         movsxd     r10, r10d
00894 43896c1310                     mov        dword ptr [r11 + r10 + 0x10], ebp
00899 4183f808                       cmp        r8d, 8
0089d 0f8e34fdffff                   jle        0x7f4c1be8ce57
008a3 448d5308                       lea        r10d, [rbx + 8]
008a7 458bca                         mov        r9d, r10d
008aa 49ba10e02fe300000000           movabs     r10, 0xe32fe010
008b4 478b54aa0c                     mov        r10d, dword ptr [r10 + r13*4 + 0xc]
008b9 452bf2                         sub        r14d, r10d
008bc 418d6e08                       lea        ebp, [r14 + 8]
008c0 3b6c2468                       cmp        ebp, dword ptr [rsp + 0x68]
008c4 0f83561e0000                   jae        0x7f4c1be8efa0
008ca 4d63d6                         movsxd     r10, r14d
008cd 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
008d2 4b8b6c1514                     mov        rbp, qword ptr [r13 + r10 + 0x14]
008d7 458bd1                         mov        r10d, r9d
008da 443b542468                     cmp        r10d, dword ptr [rsp + 0x68]
008df 0f83eb1e0000                   jae        0x7f4c1be8f050
008e5 4c63d3                         movsxd     r10, ebx
008e8 4b896c1514                     mov        qword ptr [r13 + r10 + 0x14], rbp
008ed e9e5fcffff                     jmp        0x7f4c1be8ce57
008f2 4585f6                         test       r14d, r14d
008f5 0f8c611f0000                   jl         0x7f4c1be8f0dc
008fb 85db                           test       ebx, ebx
008fd 0f8c591f0000                   jl         0x7f4c1be8f0dc
00903 448b542404                     mov        r10d, dword ptr [rsp + 4]
00908 443bd3                         cmp        r10d, ebx
0090b 0f824b1f0000                   jb         0x7f4c1be8f0dc
00911 468d142b                       lea        r10d, [rbx + r13]
00915 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0091a 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0091f 453bda                         cmp        r11d, r10d
00922 0f82341f0000                   jb         0x7f4c1be8f0dc
00928 4585ed                         test       r13d, r13d
0092b 0f8c2b1f0000                   jl         0x7f4c1be8f0dc
00931 4585ed                         test       r13d, r13d
00934 0f84f1f8ffff                   je         0x7f4c1be8caab
0093a 4883fd20                       cmp        rbp, 0x20
0093e 7728                           ja         0x7f4c1be8d1e8
00940 458bd5                         mov        r10d, r13d
00943 4d63d2                         movsxd     r10, r10d
00946 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0094d c442a8f5db                     bzhi       r11, r11, r10
00952 c4c1fb92fb                     kmovq      k7, r11
00957 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0095d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00963 e9c3f8ffff                     jmp        0x7f4c1be8caab
00968 488bd5                         mov        rdx, rbp
0096b c5f877                         vzeroupper 
0096e 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00978 41ffd2                         call       r10
0097b 0f1f840000000000               nop        dword ptr [rax + rax]
00983 e9a3f8ffff                     jmp        0x7f4c1be8caab
00988 83fb30                         cmp        ebx, 0x30
0098b 0f8e98000000                   jle        0x7f4c1be8d2a9
00991 4585d2                         test       r10d, r10d
00994 0f8c4a220000                   jl         0x7f4c1be8f464
0099a 85c0                           test       eax, eax
0099c 0f8c42220000                   jl         0x7f4c1be8f464
009a2 448b9c24d0000000               mov        r11d, dword ptr [rsp + 0xd0]
009aa 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
009b2 0f822c220000                   jb         0x7f4c1be8f464
009b8 448b442404                     mov        r8d, dword ptr [rsp + 4]
009bd 443b44245c                     cmp        r8d, dword ptr [rsp + 0x5c]
009c2 0f821c220000                   jb         0x7f4c1be8f464
009c8 85db                           test       ebx, ebx
009ca 743a                           je         0x7f4c1be8d286
009cc 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
009d1 4b8d7c130c                     lea        rdi, [r11 + r10 + 0xc]
009d6 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
009db 498d74030c                     lea        rsi, [r11 + rax + 0xc]
009e0 4883fa20                       cmp        rdx, 0x20
009e4 7729                           ja         0x7f4c1be8d28f
009e6 4c63d3                         movsxd     r10, ebx
009e9 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
009f0 c442a8f5db                     bzhi       r11, r11, r10
009f5 c4c1fb92fb                     kmovq      k7, r11
009fa 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00a00 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00a06 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
00a0a e956f9ffff                     jmp        0x7f4c1be8cbe5
00a0f c5f877                         vzeroupper 
00a12 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00a1c 41ffd2                         call       r10
00a1f 0f1f840000000000               nop        dword ptr [rax + rax]
00a27 ebdd                           jmp        0x7f4c1be8d286
00a29 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
00a2e 0f83c41f0000                   jae        0x7f4c1be8f278
00a34 4963ca                         movsxd     rcx, r10d
00a37 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00a3c c4c17a6f440b0c                 vmovdqu    xmm0, xmmword ptr [r11 + rcx + 0xc]
00a43 3b842484000000                 cmp        eax, dword ptr [rsp + 0x84]
00a4a 0f83a4200000                   jae        0x7f4c1be8f374
00a50 448d5810                       lea        r11d, [rax + 0x10]
00a54 418bd3                         mov        edx, r11d
00a57 4c63d8                         movsxd     r11, eax
00a5a 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00a5f c4817a7f44180c                 vmovdqu    xmmword ptr [r8 + r11 + 0xc], xmm0
00a66 448bca                         mov        r9d, edx
00a69 443b4c245c                     cmp        r9d, dword ptr [rsp + 0x5c]
00a6e 0f8da9000000                   jge        0x7f4c1be8d39d
00a74 492bcb                         sub        rcx, r11
00a77 4d63c1                         movsxd     r8, r9d
00a7a 48637c2418                     movsxd     rdi, dword ptr [rsp + 0x18]
00a7f 4883c7f1                       add        rdi, -0xf
00a83 4d8d1c08                       lea        r11, [r8 + rcx]
00a87 4c3bdf                         cmp        r11, rdi
00a8a 0f8324220000                   jae        0x7f4c1be8f534
00a90 4c635c245c                     movsxd     r11, dword ptr [rsp + 0x5c]
00a95 4d2bd8                         sub        r11, r8
00a98 4983c30f                       add        r11, 0xf
00a9c 4983e3f0                       and        r11, 0xfffffffffffffff0
00aa0 458bc3                         mov        r8d, r11d
00aa3 458d5c0010                     lea        r11d, [r8 + rax + 0x10]
00aa8 4d63db                         movsxd     r11, r11d
00aab 4d8d440bf0                     lea        r8, [r11 + rcx - 0x10]
00ab0 4c3bc7                         cmp        r8, rdi
00ab3 0f83fb210000                   jae        0x7f4c1be8f534
00ab9 443b8c2484000000               cmp        r9d, dword ptr [rsp + 0x84]
00ac1 0f83ed210000                   jae        0x7f4c1be8f534
00ac7 4983c3f0                       add        r11, -0x10
00acb 4c3b9c2490000000               cmp        r11, qword ptr [rsp + 0x90]
00ad3 0f83db210000                   jae        0x7f4c1be8f534
00ad9 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00ade 4181fbf0ffff7f                 cmp        r11d, 0x7ffffff0
00ae5 0f8f85220000                   jg         0x7f4c1be8f5f0
00aeb 418bca                         mov        ecx, r10d
00aee 2bc8                           sub        ecx, eax
00af0 448d0411                       lea        r8d, [rcx + rdx]
00af4 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00af9 c4817a6f44030c                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0xc]
00b00 448bc2                         mov        r8d, edx
00b03 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00b08 c4817a7f44010c                 vmovdqu    xmmword ptr [r9 + r8 + 0xc], xmm0
00b0f 448d4210                       lea        r8d, [rdx + 0x10]
00b13 418bd0                         mov        edx, r8d
00b16 443b44245c                     cmp        r8d, dword ptr [rsp + 0x5c]
00b1b 7cd3                           jl         0x7f4c1be8d370
00b1d 468d1c13                       lea        r11d, [rbx + r10]
00b21 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
00b25 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00b2d e933f8ffff                     jmp        0x7f4c1be8cbe5
00b32 4c63d5                         movsxd     r10, ebp
00b35 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b3c c442a8f5db                     bzhi       r11, r11, r10
00b41 c4c1fb92fb                     kmovq      k7, r11
00b46 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b4c 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b52 e99e000000                     jmp        0x7f4c1be8d475
00b57 8b2c24                         mov        ebp, dword ptr [rsp]
00b5a 2bac2498000000                 sub        ebp, dword ptr [rsp + 0x98]
00b61 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00b69 4585c0                         test       r8d, r8d
00b6c 0f8c3a1e0000                   jl         0x7f4c1be8f22c
00b72 4c8b6c2478                     mov        r13, qword ptr [rsp + 0x78]
00b77 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00b7c 8bb424d0000000                 mov        esi, dword ptr [rsp + 0xd0]
00b83 448b742460                     mov        r14d, dword ptr [rsp + 0x60]
00b88 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
00b90 4585c9                         test       r9d, r9d
00b93 0f8c2a1e0000                   jl         0x7f4c1be8f243
00b99 3b3424                         cmp        esi, dword ptr [rsp]
00b9c 0f82211e0000                   jb         0x7f4c1be8f243
00ba2 418b4e08                       mov        ecx, dword ptr [r14 + 8]
00ba6 8b9c249c000000                 mov        ebx, dword ptr [rsp + 0x9c]
00bad 03dd                           add        ebx, ebp
00baf 3bcb                           cmp        ecx, ebx
00bb1 0f820c1e0000                   jb         0x7f4c1be8f243
00bb7 85ed                           test       ebp, ebp
00bb9 0f8c041e0000                   jl         0x7f4c1be8f243
00bbf 85ed                           test       ebp, ebp
00bc1 7432                           je         0x7f4c1be8d475
00bc3 4b8d7c030c                     lea        rdi, [r11 + r8 + 0xc]
00bc8 4d8bd6                         mov        r10, r14
00bcb 4b8d740e0c                     lea        rsi, [r14 + r9 + 0xc]
00bd0 4863d5                         movsxd     rdx, ebp
00bd3 4883fa20                       cmp        rdx, 0x20
00bd7 0f8655ffffff                   jbe        0x7f4c1be8d3b2
00bdd c5f877                         vzeroupper 
00be0 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00bea 41ffd2                         call       r10
00bed 0f1f840000000000               nop        dword ptr [rax + rax]
00bf5 41895d3c                       mov        dword ptr [r13 + 0x3c], ebx
00bf9 c5f877                         vzeroupper 
00bfc 4881c4c0000000                 add        rsp, 0xc0
00c03 5d                             pop        rbp
00c04 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00c08 0f874e270000                   ja         0x7f4c1be8fbdc
00c0e c3                             ret        
00c0f 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00c14 418bd9                         mov        ebx, r9d
00c17 90                             nop        
00c18 448bd8                         mov        r11d, eax
00c1b 44035c2440                     add        r11d, dword ptr [rsp + 0x40]
00c20 62b17e486f841b0c000000         vmovdqu32  zmm0, zmmword ptr [rbx + r11 + 0xc]
00c2b 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00c30 62b17e487f84130c000000         vmovdqu32  zmmword ptr [rbx + r10 + 0xc], zmm0
00c3b 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00c40 4183c240                       add        r10d, 0x40
00c44 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00c49 443bd7                         cmp        r10d, edi
00c4c 7cca                           jl         0x7f4c1be8d498
00c4e 895c2460                       mov        dword ptr [rsp + 0x60], ebx
00c52 e91c030000                     jmp        0x7f4c1be8d7f3
00c57 443b742468                     cmp        r14d, dword ptr [rsp + 0x68]
00c5c 0f83ca210000                   jae        0x7f4c1be8f6ac
00c62 458bd6                         mov        r10d, r14d
00c65 418bc2                         mov        eax, r10d
00c68 4963fa                         movsxd     rdi, r10d
00c6b 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
00c70 4d8b543d0c                     mov        r10, qword ptr [r13 + rdi + 0xc]
00c75 4d8bc2                         mov        r8, r10
00c78 3b5c2468                       cmp        ebx, dword ptr [rsp + 0x68]
00c7c 0f837a220000                   jae        0x7f4c1be8f77c
00c82 8bcb                           mov        ecx, ebx
00c84 448d5108                       lea        r10d, [rcx + 8]
00c88 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00c8d 4c63d1                         movsxd     r10, ecx
00c90 4f8944150c                     mov        qword ptr [r13 + r10 + 0xc], r8
00c95 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
00c9a 443b84249c000000               cmp        r8d, dword ptr [rsp + 0x9c]
00ca2 0f8d2ff9ffff                   jge        0x7f4c1be8ce57
00ca8 492bfa                         sub        rdi, r10
00cab 4963d0                         movsxd     rdx, r8d
00cae 4c8d143a                       lea        r10, [rdx + rdi]
00cb2 4c3b942488000000               cmp        r10, qword ptr [rsp + 0x88]
00cba 0f83ec220000                   jae        0x7f4c1be8f82c
00cc0 4d8bd1                         mov        r10, r9
00cc3 4c2bd2                         sub        r10, rdx
00cc6 4983c207                       add        r10, 7
00cca 4983e2f8                       and        r10, 0xfffffffffffffff8
00cce 458bd2                         mov        r10d, r10d
00cd1 458d5c0a08                     lea        r11d, [r10 + rcx + 8]
00cd6 4d63d3                         movsxd     r10, r11d
00cd9 4d8d5c3af8                     lea        r11, [r10 + rdi - 8]
00cde 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
00ce6 0f83c0220000                   jae        0x7f4c1be8f82c
00cec 443b442468                     cmp        r8d, dword ptr [rsp + 0x68]
00cf1 0f83b5220000                   jae        0x7f4c1be8f82c
00cf7 4983c2f8                       add        r10, -8
00cfb 4c3b942488000000               cmp        r10, qword ptr [rsp + 0x88]
00d03 0f83a3220000                   jae        0x7f4c1be8f82c
00d09 448bac249c000000               mov        r13d, dword ptr [rsp + 0x9c]
00d11 4181fdf8ffff7f                 cmp        r13d, 0x7ffffff8
00d18 0f8f32230000                   jg         0x7f4c1be8f8d0
00d1e 448bd0                         mov        r10d, eax
00d21 442bd1                         sub        r10d, ecx
00d24 418bc2                         mov        eax, r10d
00d27 41baf4ffffff                   mov        r10d, 0xfffffff4
00d2d 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
00d32 458bdd                         mov        r11d, r13d
00d35 452bd3                         sub        r10d, r11d
00d38 442bd1                         sub        r10d, ecx
00d3b 83c110                         add        ecx, 0x10
00d3e 4183c2f0                       add        r10d, -0x10
00d42 4d8d59c8                       lea        r11, [r9 - 0x38]
00d46 4981fb00000080                 cmp        r11, -0x80000000
00d4d 49c7c000000080                 mov        r8, 0xffffffff80000000
00d54 4d0f4cd8                       cmovl      r11, r8
00d58 418bfb                         mov        edi, r11d
00d5b 442bf3                         sub        r14d, ebx
00d5e 4c63d9                         movsxd     r11, ecx
00d61 488b5c2410                     mov        rbx, qword ptr [rsp + 0x10]
00d66 41b806000000                   mov        r8d, 6
00d6c c442b8f5d2                     bzhi       r10, r10, r8
00d71 4d03da                         add        r11, r10
00d74 4d3bd9                         cmp        r11, r9
00d77 4d8bc1                         mov        r8, r9
00d7a 4d0f4cc3                       cmovl      r8, r11
00d7e 4d8bd0                         mov        r10, r8
00d81 4c2bd2                         sub        r10, rdx
00d84 4d8d5aff                       lea        r11, [r10 - 1]
00d88 49c1fb3f                       sar        r11, 0x3f
00d8c 49c1eb3d                       shr        r11, 0x3d
00d90 4f8d5413ff                     lea        r10, [r11 + r10 - 1]
00d95 4983e2f8                       and        r10, 0xfffffffffffffff8
00d99 4c03d2                         add        r10, rdx
00d9c 493bd2                         cmp        rdx, r10
00d9f 490f4cd2                       cmovl      rdx, r10
00da3 448bda                         mov        r11d, edx
00da6 478d541e08                     lea        r10d, [r14 + r11 + 8]
00dab 4183c308                       add        r11d, 8
00daf 4963d2                         movsxd     rdx, r10d
00db2 4803d3                         add        rdx, rbx
00db5 4963f3                         movsxd     rsi, r11d
00db8 4803f3                         add        rsi, rbx
00dbb 4c8d520c                       lea        r10, [rdx + 0xc]
00dbf 4883c24c                       add        rdx, 0x4c
00dc3 488d5e4c                       lea        rbx, [rsi + 0x4c]
00dc7 4533db                         xor        r11d, r11d
00dca 493bda                         cmp        rbx, r10
00dcd 410f96c3                       setbe      r11b
00dd1 4883c60c                       add        rsi, 0xc
00dd5 4533d2                         xor        r10d, r10d
00dd8 483bd6                         cmp        rdx, rsi
00ddb 410f96c2                       setbe      r10b
00ddf 450bda                         or         r11d, r10d
00de2 0f84680f0000                   je         0x7f4c1be8e5d0
00de8 418bc8                         mov        ecx, r8d
00deb 90                             nop        
00dec 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00df1 448bd8                         mov        r11d, eax
00df4 44035c2440                     add        r11d, dword ptr [rsp + 0x40]
00df9 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
00dfd 4e8b5c1b0c                     mov        r11, qword ptr [rbx + r11 + 0xc]
00e02 4e895c130c                     mov        qword ptr [rbx + r10 + 0xc], r11
00e07 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00e0c 4183c208                       add        r10d, 8
00e10 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00e15 443bd1                         cmp        r10d, ecx
00e18 7cd2                           jl         0x7f4c1be8d66c
00e1a 4981c108feffff                 add        r9, -0x1f8
00e21 4981f900000080                 cmp        r9, -0x80000000
00e28 49c7c300000080                 mov        r11, 0xffffffff80000000
00e2f 4d0f4ccb                       cmovl      r9, r11
00e33 418bd1                         mov        edx, r9d
00e36 443bd2                         cmp        r10d, edx
00e39 0f8d34010000                   jge        0x7f4c1be8d7f3
00e3f 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00e44 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00e49 0f1f8000000000                 nop        dword ptr [rax]
00e50 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00e55 4963da                         movsxd     rbx, r10d
00e58 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00e5d 448bc0                         mov        r8d, eax
00e60 4403442440                     add        r8d, dword ptr [rsp + 0x40]
00e65 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00e6a 4183c340                       add        r11d, 0x40
00e6e 4403d8                         add        r11d, eax
00e71 418bc8                         mov        ecx, r8d
00e74 62d17e486f84090c000000         vmovdqu32  zmm0, zmmword ptr [r9 + rcx + 0xc]
00e7f 62917e487f84110c000000         vmovdqu32  zmmword ptr [r9 + r10 + 0xc], zmm0
00e8a 62917e486f84190c000000         vmovdqu32  zmm0, zmmword ptr [r9 + r11 + 0xc]
00e95 62d17e487f84194c000000         vmovdqu32  zmmword ptr [r9 + rbx + 0x4c], zmm0
00ea0 4d63d8                         movsxd     r11, r8d
00ea3 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00ea8 4181c280000000                 add        r10d, 0x80
00eaf 4403d0                         add        r10d, eax
00eb2 62917e486f84110c000000         vmovdqu32  zmm0, zmmword ptr [r9 + r10 + 0xc]
00ebd 62d17e487f84198c000000         vmovdqu32  zmmword ptr [r9 + rbx + 0x8c], zmm0
00ec8 62917e486f8419cc000000         vmovdqu32  zmm0, zmmword ptr [r9 + r11 + 0xcc]
00ed3 62d17e487f8419cc000000         vmovdqu32  zmmword ptr [r9 + rbx + 0xcc], zmm0
00ede 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00ee3 4181c200010000                 add        r10d, 0x100
00eea 4403d0                         add        r10d, eax
00eed 458bc2                         mov        r8d, r10d
00ef0 62917e486f84110c000000         vmovdqu32  zmm0, zmmword ptr [r9 + r10 + 0xc]
00efb 62d17e487f84190c010000         vmovdqu32  zmmword ptr [r9 + rbx + 0x10c], zmm0
00f06 62917e486f84194c010000         vmovdqu32  zmm0, zmmword ptr [r9 + r11 + 0x14c]
00f11 62d17e487f84194c010000         vmovdqu32  zmmword ptr [r9 + rbx + 0x14c], zmm0
00f1c 62917e486f84198c010000         vmovdqu32  zmm0, zmmword ptr [r9 + r11 + 0x18c]
00f27 62d17e487f84198c010000         vmovdqu32  zmmword ptr [r9 + rbx + 0x18c], zmm0
00f32 4d63d0                         movsxd     r10, r8d
00f35 62917e486f8411cc000000         vmovdqu32  zmm0, zmmword ptr [r9 + r10 + 0xcc]
00f40 62d17e487f8419cc010000         vmovdqu32  zmmword ptr [r9 + rbx + 0x1cc], zmm0
00f4b 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00f50 4181c200020000                 add        r10d, 0x200
00f57 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00f5c 443bd2                         cmp        r10d, edx
00f5f 0f8cebfeffff                   jl         0x7f4c1be8d6d0
00f65 443bd7                         cmp        r10d, edi
00f68 0f8ca1fcffff                   jl         0x7f4c1be8d48f
00f6e 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
00f73 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00f78 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
00f80 0f8d51f6ffff                   jge        0x7f4c1be8ce57
00f86 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00f8b 90                             nop        
00f8c 468d1c10                       lea        r11d, [rax + r10]
00f90 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
00f94 4e8b441b0c                     mov        r8, qword ptr [rbx + r11 + 0xc]
00f99 458bda                         mov        r11d, r10d
00f9c 4e89441b0c                     mov        qword ptr [rbx + r11 + 0xc], r8
00fa1 4183c208                       add        r10d, 8
00fa5 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
00fad 7cdd                           jl         0x7f4c1be8d80c
00faf e923f6ffff                     jmp        0x7f4c1be8ce57
00fb4 4d03da                         add        r11, r10
00fb7 4c3bd9                         cmp        r11, rcx
00fba 7e08                           jle        0x7f4c1be8d844
00fbc 4533c9                         xor        r9d, r9d
00fbf e9daf0ffff                     jmp        0x7f4c1be8c91e
00fc4 4533c9                         xor        r9d, r9d
00fc7 bb01000000                     mov        ebx, 1
00fcc e9cff0ffff                     jmp        0x7f4c1be8c920
00fd1 443bb42484000000               cmp        r14d, dword ptr [rsp + 0x84]
00fd9 0f8305210000                   jae        0x7f4c1be8f964
00fdf 4d63c6                         movsxd     r8, r14d
00fe2 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00fe7 c4817a6f44020c                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0xc]
00fee 3b9c2484000000                 cmp        ebx, dword ptr [rsp + 0x84]
00ff5 0f8385210000                   jae        0x7f4c1be8fa00
00ffb 8d6b10                         lea        ebp, [rbx + 0x10]
00ffe 4c63d3                         movsxd     r10, ebx
01001 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01006 c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
0100d 3bac249c000000                 cmp        ebp, dword ptr [rsp + 0x9c]
01014 0f8dbdf5ffff                   jge        0x7f4c1be8ce57
0101a 4d2bc2                         sub        r8, r10
0101d 4c63dd                         movsxd     r11, ebp
01020 4f8d1403                       lea        r10, [r11 + r8]
01024 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
0102c 0f8302220000                   jae        0x7f4c1be8fab4
01032 4d8bd1                         mov        r10, r9
01035 4d2bd3                         sub        r10, r11
01038 4983c20f                       add        r10, 0xf
0103c 4983e2f0                       and        r10, 0xfffffffffffffff0
01040 458bda                         mov        r11d, r10d
01043 458d541b10                     lea        r10d, [r11 + rbx + 0x10]
01048 4d63d2                         movsxd     r10, r10d
0104b 4f8d5c02f0                     lea        r11, [r10 + r8 - 0x10]
01050 4c3b9c2490000000               cmp        r11, qword ptr [rsp + 0x90]
01058 0f83d6210000                   jae        0x7f4c1be8fab4
0105e 3bac2484000000                 cmp        ebp, dword ptr [rsp + 0x84]
01065 0f83c9210000                   jae        0x7f4c1be8fab4
0106b 4983c2f0                       add        r10, -0x10
0106f 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
01077 0f83b7210000                   jae        0x7f4c1be8fab4
0107d 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
01085 4181fbf0ffff7f                 cmp        r11d, 0x7ffffff0
0108c 0f8f1a220000                   jg         0x7f4c1be8fb2c
01092 442bf3                         sub        r14d, ebx
01095 83c320                         add        ebx, 0x20
01098 458d1c2e                       lea        r11d, [r14 + rbp]
0109c 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
010a1 c4817a6f441d0c                 vmovdqu    xmm0, xmmword ptr [r13 + r11 + 0xc]
010a8 448bd5                         mov        r10d, ebp
010ab c4817a7f44150c                 vmovdqu    xmmword ptr [r13 + r10 + 0xc], xmm0
010b2 83c510                         add        ebp, 0x10
010b5 3beb                           cmp        ebp, ebx
010b7 7cdf                           jl         0x7f4c1be8d918
010b9 4981c110ffffff                 add        r9, -0xf0
010c0 4981f900000080                 cmp        r9, -0x80000000
010c7 49c7c200000080                 mov        r10, 0xffffffff80000000
010ce 4d0f4cca                       cmovl      r9, r10
010d2 458bd1                         mov        r10d, r9d
010d5 413bea                         cmp        ebp, r10d
010d8 0f8d48010000                   jge        0x7f4c1be8daa6
010de 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
010e2 0f1f8000000000                 nop        dword ptr [rax]
010e9 0f1f8000000000                 nop        dword ptr [rax]
010f0 458d1c2e                       lea        r11d, [r14 + rbp]
010f4 448bc5                         mov        r8d, ebp
010f7 4d63c0                         movsxd     r8, r8d
010fa 458bcb                         mov        r9d, r11d
010fd c4a17a6f440b0c                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xc]
01104 4d63cb                         movsxd     r9, r11d
01107 448bdd                         mov        r11d, ebp
0110a c4a17a7f441b0c                 vmovdqu    xmmword ptr [rbx + r11 + 0xc], xmm0
01111 c4a17a6f440b1c                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x1c]
01118 c4a17a7f44031c                 vmovdqu    xmmword ptr [rbx + r8 + 0x1c], xmm0
0111f c4a17a6f440b2c                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x2c]
01126 c4a17a7f44032c                 vmovdqu    xmmword ptr [rbx + r8 + 0x2c], xmm0
0112d c4a17a6f440b3c                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x3c]
01134 c4a17a7f44033c                 vmovdqu    xmmword ptr [rbx + r8 + 0x3c], xmm0
0113b c4a17a6f440b4c                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x4c]
01142 c4a17a7f44034c                 vmovdqu    xmmword ptr [rbx + r8 + 0x4c], xmm0
01149 c4a17a6f440b5c                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x5c]
01150 c4a17a7f44035c                 vmovdqu    xmmword ptr [rbx + r8 + 0x5c], xmm0
01157 c4a17a6f440b6c                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x6c]
0115e c4a17a7f44036c                 vmovdqu    xmmword ptr [rbx + r8 + 0x6c], xmm0
01165 c4a17a6f440b7c                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x7c]
0116c c4a17a7f44037c                 vmovdqu    xmmword ptr [rbx + r8 + 0x7c], xmm0
01173 c4a17a6f840b8c000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x8c]
0117d c4a17a7f84038c000000           vmovdqu    xmmword ptr [rbx + r8 + 0x8c], xmm0
01187 c4a17a6f840b9c000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x9c]
01191 c4a17a7f84039c000000           vmovdqu    xmmword ptr [rbx + r8 + 0x9c], xmm0
0119b c4a17a6f840bac000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xac]
011a5 c4a17a7f8403ac000000           vmovdqu    xmmword ptr [rbx + r8 + 0xac], xmm0
011af c4a17a6f840bbc000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xbc]
011b9 c4a17a7f8403bc000000           vmovdqu    xmmword ptr [rbx + r8 + 0xbc], xmm0
011c3 c4a17a6f840bcc000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xcc]
011cd c4a17a7f8403cc000000           vmovdqu    xmmword ptr [rbx + r8 + 0xcc], xmm0
011d7 c4a17a6f840bdc000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xdc]
011e1 c4a17a7f8403dc000000           vmovdqu    xmmword ptr [rbx + r8 + 0xdc], xmm0
011eb c4a17a6f840bec000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xec]
011f5 c4a17a7f8403ec000000           vmovdqu    xmmword ptr [rbx + r8 + 0xec], xmm0
011ff c4a17a6f840bfc000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xfc]
01209 c4a17a7f8403fc000000           vmovdqu    xmmword ptr [rbx + r8 + 0xfc], xmm0
01213 81c500010000                   add        ebp, 0x100
01219 413bea                         cmp        ebp, r10d
0121c 0f8ccefeffff                   jl         0x7f4c1be8d970
01222 895c2460                       mov        dword ptr [rsp + 0x60], ebx
01226 3bac249c000000                 cmp        ebp, dword ptr [rsp + 0x9c]
0122d 0f8da4f3ffff                   jge        0x7f4c1be8ce57
01233 90                             nop        
01234 458d1c2e                       lea        r11d, [r14 + rbp]
01238 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
0123c c4a17a6f441b0c                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xc]
01243 448bd5                         mov        r10d, ebp
01246 c4a17a7f44130c                 vmovdqu    xmmword ptr [rbx + r10 + 0xc], xmm0
0124d 83c510                         add        ebp, 0x10
01250 3bac249c000000                 cmp        ebp, dword ptr [rsp + 0x9c]
01257 7cdb                           jl         0x7f4c1be8dab4
01259 e979f3ffff                     jmp        0x7f4c1be8ce57
0125e bee4ffffff                     mov        esi, 0xffffffe4
01263 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01268 448b1c24                       mov        r11d, dword ptr [rsp]
0126c 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01274 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01279 4c891c24                       mov        qword ptr [rsp], r11
0127d 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01282 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
0128a 48894424f8                     mov        qword ptr [rsp - 8], rax
0128f 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01293 89442408                       mov        dword ptr [rsp + 8], eax
01297 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0129c 8944240c                       mov        dword ptr [rsp + 0xc], eax
012a0 48ff742420                     push       qword ptr [rsp + 0x20]
012a5 488f442418                     pop        qword ptr [rsp + 0x18]
012aa 48894424f8                     mov        qword ptr [rsp - 8], rax
012af 8b442444                       mov        eax, dword ptr [rsp + 0x44]
012b3 89442414                       mov        dword ptr [rsp + 0x14], eax
012b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012bc 48ff742428                     push       qword ptr [rsp + 0x28]
012c1 488f442420                     pop        qword ptr [rsp + 0x20]
012c6 48ff742430                     push       qword ptr [rsp + 0x30]
012cb 488f442428                     pop        qword ptr [rsp + 0x28]
012d0 48894424f8                     mov        qword ptr [rsp - 8], rax
012d5 8b442464                       mov        eax, dword ptr [rsp + 0x64]
012d9 89442430                       mov        dword ptr [rsp + 0x30], eax
012dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012e2 48894424f8                     mov        qword ptr [rsp - 8], rax
012e7 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
012eb 89442434                       mov        dword ptr [rsp + 0x34], eax
012ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012f4 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
012f8 48894424f8                     mov        qword ptr [rsp - 8], rax
012fd 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01301 89442440                       mov        dword ptr [rsp + 0x40], eax
01305 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0130a 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
0130f 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01314 c5f877                         vzeroupper 
01317 e8c4a1b4ff                     call       0x7f4c1b9d7d60
0131c 0f1f840014140002               nop        dword ptr [rax + rax + 0x2001414]
01324 bee4ffffff                     mov        esi, 0xffffffe4
01329 498beb                         mov        rbp, r11
0132c 448b0424                       mov        r8d, dword ptr [rsp]
01330 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01338 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0133d 4c891c24                       mov        qword ptr [rsp], r11
01341 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01346 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0134e 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01353 48ff742420                     push       qword ptr [rsp + 0x20]
01358 488f442418                     pop        qword ptr [rsp + 0x18]
0135d 48894424f8                     mov        qword ptr [rsp - 8], rax
01362 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01366 89442414                       mov        dword ptr [rsp + 0x14], eax
0136a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0136f 48ff742428                     push       qword ptr [rsp + 0x28]
01374 488f442420                     pop        qword ptr [rsp + 0x20]
01379 48ff742430                     push       qword ptr [rsp + 0x30]
0137e 488f442428                     pop        qword ptr [rsp + 0x28]
01383 48894424f8                     mov        qword ptr [rsp - 8], rax
01388 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0138c 89442430                       mov        dword ptr [rsp + 0x30], eax
01390 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01395 48894424f8                     mov        qword ptr [rsp - 8], rax
0139a 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0139e 89442434                       mov        dword ptr [rsp + 0x34], eax
013a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013a7 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
013ab 48894424f8                     mov        qword ptr [rsp - 8], rax
013b0 8b442448                       mov        eax, dword ptr [rsp + 0x48]
013b4 89442440                       mov        dword ptr [rsp + 0x40], eax
013b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013bd 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
013c2 48894424f8                     mov        qword ptr [rsp - 8], rax
013c7 8b442460                       mov        eax, dword ptr [rsp + 0x60]
013cb 89442448                       mov        dword ptr [rsp + 0x48], eax
013cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013d4 8944244c                       mov        dword ptr [rsp + 0x4c], eax
013d8 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
013de 6690                           nop        
013e0 c5f877                         vzeroupper 
013e3 e8f8a0b4ff                     call       0x7f4c1b9d7d60
013e8 0f1f8400e0140003               nop        dword ptr [rax + rax + 0x30014e0]
013f0 bee4ffffff                     mov        esi, 0xffffffe4
013f5 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
013fa 448b1424                       mov        r10d, dword ptr [rsp]
013fe 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01406 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0140b 4c891424                       mov        qword ptr [rsp], r10
0140f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01414 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0141c 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01420 48ff742420                     push       qword ptr [rsp + 0x20]
01425 488f442418                     pop        qword ptr [rsp + 0x18]
0142a 48894424f8                     mov        qword ptr [rsp - 8], rax
0142f 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01433 89442414                       mov        dword ptr [rsp + 0x14], eax
01437 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0143c 48ff742428                     push       qword ptr [rsp + 0x28]
01441 488f442420                     pop        qword ptr [rsp + 0x20]
01446 48ff742430                     push       qword ptr [rsp + 0x30]
0144b 488f442428                     pop        qword ptr [rsp + 0x28]
01450 48894424f8                     mov        qword ptr [rsp - 8], rax
01455 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01459 89442434                       mov        dword ptr [rsp + 0x34], eax
0145d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01462 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01467 4489742444                     mov        dword ptr [rsp + 0x44], r14d
0146c c5f877                         vzeroupper 
0146f e86ca0b4ff                     call       0x7f4c1b9d7d60
01474 0f1f84006c150004               nop        dword ptr [rax + rax + 0x400156c]
0147c bee4ffffff                     mov        esi, 0xffffffe4
01481 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01486 448b1424                       mov        r10d, dword ptr [rsp]
0148a 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01492 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01497 4c891424                       mov        qword ptr [rsp], r10
0149b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
014a0 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
014a8 48ff742420                     push       qword ptr [rsp + 0x20]
014ad 488f442418                     pop        qword ptr [rsp + 0x18]
014b2 48894424f8                     mov        qword ptr [rsp - 8], rax
014b7 8b442444                       mov        eax, dword ptr [rsp + 0x44]
014bb 89442414                       mov        dword ptr [rsp + 0x14], eax
014bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014c4 48ff742428                     push       qword ptr [rsp + 0x28]
014c9 488f442420                     pop        qword ptr [rsp + 0x20]
014ce 48ff742430                     push       qword ptr [rsp + 0x30]
014d3 488f442428                     pop        qword ptr [rsp + 0x28]
014d8 48894424f8                     mov        qword ptr [rsp - 8], rax
014dd 8b442464                       mov        eax, dword ptr [rsp + 0x64]
014e1 89442430                       mov        dword ptr [rsp + 0x30], eax
014e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014ea 48894424f8                     mov        qword ptr [rsp - 8], rax
014ef 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
014f3 89442434                       mov        dword ptr [rsp + 0x34], eax
014f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014fc 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01501 48894424f8                     mov        qword ptr [rsp - 8], rax
01506 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0150a 89442440                       mov        dword ptr [rsp + 0x40], eax
0150e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01513 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01517 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
0151d 666690                         nop        
01520 c5f877                         vzeroupper 
01523 e8b89fb4ff                     call       0x7f4c1b9d7d60
01528 0f1f840020160005               nop        dword ptr [rax + rax + 0x5001620]
01530 be45ffffff                     mov        esi, 0xffffff45
01535 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
0153d 4489ac24d8000000               mov        dword ptr [rsp + 0xd8], r13d
01545 666690                         nop        
01548 c5f877                         vzeroupper 
0154b e8909fb4ff                     call       0x7f4c1b9d7d60
01550 0f1f840048160006               nop        dword ptr [rax + rax + 0x6001648]
01558 be45ffffff                     mov        esi, 0xffffff45
0155d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01562 448b1c24                       mov        r11d, dword ptr [rsp]
01566 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0156e 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01573 4c891c24                       mov        qword ptr [rsp], r11
01577 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0157c 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01584 8944240c                       mov        dword ptr [rsp + 0xc], eax
01588 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0158d 48ff742420                     push       qword ptr [rsp + 0x20]
01592 488f442418                     pop        qword ptr [rsp + 0x18]
01597 48894424f8                     mov        qword ptr [rsp - 8], rax
0159c 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
015a0 89442414                       mov        dword ptr [rsp + 0x14], eax
015a4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015a9 48ff742428                     push       qword ptr [rsp + 0x28]
015ae 488f442420                     pop        qword ptr [rsp + 0x20]
015b3 48ff742430                     push       qword ptr [rsp + 0x30]
015b8 488f442428                     pop        qword ptr [rsp + 0x28]
015bd 48894424f8                     mov        qword ptr [rsp - 8], rax
015c2 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
015c6 89442434                       mov        dword ptr [rsp + 0x34], eax
015ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015cf 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
015d3 4489742440                     mov        dword ptr [rsp + 0x40], r14d
015d8 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
015dd 666690                         nop        
015e0 c5f877                         vzeroupper 
015e3 e8f89eb4ff                     call       0x7f4c1b9d7d60
015e8 0f1f8400e0160007               nop        dword ptr [rax + rax + 0x70016e0]
015f0 493beb                         cmp        rbp, r11
015f3 bdffffffff                     mov        ebp, 0xffffffff
015f8 7c08                           jl         0x7f4c1be8de82
015fa 400f95c5                       setne      bpl
015fe 400fb6ed                       movzx      ebp, bpl
01602 be45ffffff                     mov        esi, 0xffffff45
01607 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
0160c 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
01614 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01619 44894c2404                     mov        dword ptr [rsp + 4], r9d
0161e 48894424f8                     mov        qword ptr [rsp - 8], rax
01623 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01627 89442410                       mov        dword ptr [rsp + 0x10], eax
0162b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01630 89442414                       mov        dword ptr [rsp + 0x14], eax
01634 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01639 48894424f8                     mov        qword ptr [rsp - 8], rax
0163e 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01642 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01646 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0164b 48894424f8                     mov        qword ptr [rsp - 8], rax
01650 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01654 89442438                       mov        dword ptr [rsp + 0x38], eax
01658 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0165d 48894424f8                     mov        qword ptr [rsp - 8], rax
01662 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01666 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0166a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0166f 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01673 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01678 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
0167d 666690                         nop        
01680 c5f877                         vzeroupper 
01683 e8589eb4ff                     call       0x7f4c1b9d7d60
01688 0f1f840080170008               nop        dword ptr [rax + rax + 0x8001780]
01690 be45ffffff                     mov        esi, 0xffffff45
01695 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0169a 448b0424                       mov        r8d, dword ptr [rsp]
0169e 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
016a6 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
016ab 4c891c24                       mov        qword ptr [rsp], r11
016af 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
016b4 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
016bc 48894424f8                     mov        qword ptr [rsp - 8], rax
016c1 8b442460                       mov        eax, dword ptr [rsp + 0x60]
016c5 89442408                       mov        dword ptr [rsp + 8], eax
016c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ce 8944240c                       mov        dword ptr [rsp + 0xc], eax
016d2 4489542410                     mov        dword ptr [rsp + 0x10], r10d
016d7 48ff742420                     push       qword ptr [rsp + 0x20]
016dc 488f442418                     pop        qword ptr [rsp + 0x18]
016e1 48894424f8                     mov        qword ptr [rsp - 8], rax
016e6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
016ea 89442414                       mov        dword ptr [rsp + 0x14], eax
016ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016f3 48ff742428                     push       qword ptr [rsp + 0x28]
016f8 488f442420                     pop        qword ptr [rsp + 0x20]
016fd 48ff742430                     push       qword ptr [rsp + 0x30]
01702 488f442428                     pop        qword ptr [rsp + 0x28]
01707 48894424f8                     mov        qword ptr [rsp - 8], rax
0170c 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01710 89442434                       mov        dword ptr [rsp + 0x34], eax
01714 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01719 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0171d 48894424f8                     mov        qword ptr [rsp - 8], rax
01722 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01726 89442440                       mov        dword ptr [rsp + 0x40], eax
0172a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0172f 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
01734 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01739 666690                         nop        
0173c c5f877                         vzeroupper 
0173f e89c9db4ff                     call       0x7f4c1b9d7d60
01744 0f1f84003c180009               nop        dword ptr [rax + rax + 0x900183c]
0174c be45ffffff                     mov        esi, 0xffffff45
01751 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01756 448b1c24                       mov        r11d, dword ptr [rsp]
0175a 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01762 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01767 4c891c24                       mov        qword ptr [rsp], r11
0176b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01770 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01778 48894424f8                     mov        qword ptr [rsp - 8], rax
0177d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01781 89442408                       mov        dword ptr [rsp + 8], eax
01785 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0178a 8944240c                       mov        dword ptr [rsp + 0xc], eax
0178e 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01793 48ff742420                     push       qword ptr [rsp + 0x20]
01798 488f442418                     pop        qword ptr [rsp + 0x18]
0179d 48894424f8                     mov        qword ptr [rsp - 8], rax
017a2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
017a6 89442414                       mov        dword ptr [rsp + 0x14], eax
017aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017af 48ff742428                     push       qword ptr [rsp + 0x28]
017b4 488f442420                     pop        qword ptr [rsp + 0x20]
017b9 48ff742430                     push       qword ptr [rsp + 0x30]
017be 488f442428                     pop        qword ptr [rsp + 0x28]
017c3 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
017c7 48894424f8                     mov        qword ptr [rsp - 8], rax
017cc 8b442448                       mov        eax, dword ptr [rsp + 0x48]
017d0 89442440                       mov        dword ptr [rsp + 0x40], eax
017d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d9 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
017de 6690                           nop        
017e0 c5f877                         vzeroupper 
017e3 e8f89cb4ff                     call       0x7f4c1b9d7d60
017e8 0f1f8400e018000a               nop        dword ptr [rax + rax + 0xa0018e0]
017f0 4c8b4c2428                     mov        r9, qword ptr [rsp + 0x28]
017f5 4d3bc1                         cmp        r8, r9
017f8 bdffffffff                     mov        ebp, 0xffffffff
017fd 7c08                           jl         0x7f4c1be8e087
017ff 400f95c5                       setne      bpl
01803 400fb6ed                       movzx      ebp, bpl
01807 be45ffffff                     mov        esi, 0xffffff45
0180c 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01811 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
01819 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0181e 44894c2404                     mov        dword ptr [rsp + 4], r9d
01823 48894424f8                     mov        qword ptr [rsp - 8], rax
01828 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0182c 89442410                       mov        dword ptr [rsp + 0x10], eax
01830 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01835 89442414                       mov        dword ptr [rsp + 0x14], eax
01839 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0183e 48894424f8                     mov        qword ptr [rsp - 8], rax
01843 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01847 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0184b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01850 48894424f8                     mov        qword ptr [rsp - 8], rax
01855 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01859 89442438                       mov        dword ptr [rsp + 0x38], eax
0185d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01862 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01866 48894424f8                     mov        qword ptr [rsp - 8], rax
0186b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0186f 89442444                       mov        dword ptr [rsp + 0x44], eax
01873 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01878 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
0187d 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
01882 6690                           nop        
01884 c5f877                         vzeroupper 
01887 e8549cb4ff                     call       0x7f4c1b9d7d60
0188c 0f1f84008419000b               nop        dword ptr [rax + rax + 0xb001984]
01894 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
01899 493be8                         cmp        rbp, r8
0189c bdffffffff                     mov        ebp, 0xffffffff
018a1 7c08                           jl         0x7f4c1be8e12b
018a3 400f95c5                       setne      bpl
018a7 400fb6ed                       movzx      ebp, bpl
018ab be45ffffff                     mov        esi, 0xffffff45
018b0 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
018b5 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
018bd 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
018c2 44894c2404                     mov        dword ptr [rsp + 4], r9d
018c7 48894424f8                     mov        qword ptr [rsp - 8], rax
018cc 8b442460                       mov        eax, dword ptr [rsp + 0x60]
018d0 89442410                       mov        dword ptr [rsp + 0x10], eax
018d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018d9 89442414                       mov        dword ptr [rsp + 0x14], eax
018dd 4489542418                     mov        dword ptr [rsp + 0x18], r10d
018e2 48894424f8                     mov        qword ptr [rsp - 8], rax
018e7 8b442464                       mov        eax, dword ptr [rsp + 0x64]
018eb 8944241c                       mov        dword ptr [rsp + 0x1c], eax
018ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018f4 48894424f8                     mov        qword ptr [rsp - 8], rax
018f9 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
018fd 89442438                       mov        dword ptr [rsp + 0x38], eax
01901 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01906 895c2440                       mov        dword ptr [rsp + 0x40], ebx
0190a 48894424f8                     mov        qword ptr [rsp - 8], rax
0190f 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01913 89442444                       mov        dword ptr [rsp + 0x44], eax
01917 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0191c 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
01921 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
01926 6690                           nop        
01928 c5f877                         vzeroupper 
0192b e8b09bb4ff                     call       0x7f4c1b9d7d60
01930 0f1f8400281a000c               nop        dword ptr [rax + rax + 0xc001a28]
01938 bee4ffffff                     mov        esi, 0xffffffe4
0193d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01942 448b1c24                       mov        r11d, dword ptr [rsp]
01946 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0194e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01953 4c891424                       mov        qword ptr [rsp], r10
01957 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0195c 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01964 48ff742420                     push       qword ptr [rsp + 0x20]
01969 488f442418                     pop        qword ptr [rsp + 0x18]
0196e 48894424f8                     mov        qword ptr [rsp - 8], rax
01973 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01977 89442414                       mov        dword ptr [rsp + 0x14], eax
0197b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01980 48ff742428                     push       qword ptr [rsp + 0x28]
01985 488f442420                     pop        qword ptr [rsp + 0x20]
0198a 48ff742430                     push       qword ptr [rsp + 0x30]
0198f 488f442428                     pop        qword ptr [rsp + 0x28]
01994 48894424f8                     mov        qword ptr [rsp - 8], rax
01999 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0199d 89442430                       mov        dword ptr [rsp + 0x30], eax
019a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019a6 48894424f8                     mov        qword ptr [rsp - 8], rax
019ab 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
019af 89442434                       mov        dword ptr [rsp + 0x34], eax
019b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019b8 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
019bd 895c2444                       mov        dword ptr [rsp + 0x44], ebx
019c1 48894424f8                     mov        qword ptr [rsp - 8], rax
019c6 8b442460                       mov        eax, dword ptr [rsp + 0x60]
019ca 8944244c                       mov        dword ptr [rsp + 0x4c], eax
019ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019d3 895c2450                       mov        dword ptr [rsp + 0x50], ebx
019d7 48894424f8                     mov        qword ptr [rsp - 8], rax
019dc 8b442460                       mov        eax, dword ptr [rsp + 0x60]
019e0 89442454                       mov        dword ptr [rsp + 0x54], eax
019e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019e9 4489742458                     mov        dword ptr [rsp + 0x58], r14d
019ee 48894424f8                     mov        qword ptr [rsp - 8], rax
019f3 8b442468                       mov        eax, dword ptr [rsp + 0x68]
019f7 8944245c                       mov        dword ptr [rsp + 0x5c], eax
019fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a00 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01a05 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01a0a 6690                           nop        
01a0c c5f877                         vzeroupper 
01a0f e8cc9ab4ff                     call       0x7f4c1b9d7d60
01a14 0f1f84000c1b000d               nop        dword ptr [rax + rax + 0xd001b0c]
01a1c bee4ffffff                     mov        esi, 0xffffffe4
01a21 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01a26 448b1424                       mov        r10d, dword ptr [rsp]
01a2a 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01a32 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01a37 4c891424                       mov        qword ptr [rsp], r10
01a3b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01a40 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01a48 48ff742420                     push       qword ptr [rsp + 0x20]
01a4d 488f442418                     pop        qword ptr [rsp + 0x18]
01a52 48894424f8                     mov        qword ptr [rsp - 8], rax
01a57 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01a5b 89442414                       mov        dword ptr [rsp + 0x14], eax
01a5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a64 48ff742428                     push       qword ptr [rsp + 0x28]
01a69 488f442420                     pop        qword ptr [rsp + 0x20]
01a6e 48ff742430                     push       qword ptr [rsp + 0x30]
01a73 488f442428                     pop        qword ptr [rsp + 0x28]
01a78 48894424f8                     mov        qword ptr [rsp - 8], rax
01a7d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01a81 89442430                       mov        dword ptr [rsp + 0x30], eax
01a85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a8a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a8f 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01a93 89442434                       mov        dword ptr [rsp + 0x34], eax
01a97 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a9c 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01aa1 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01aa5 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01aaa 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
01aaf 48894424f8                     mov        qword ptr [rsp - 8], rax
01ab4 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01ab8 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01abc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ac1 895c2458                       mov        dword ptr [rsp + 0x58], ebx
01ac5 48894424f8                     mov        qword ptr [rsp - 8], rax
01aca 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01ace 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01ad2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ad7 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01adc 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01ae1 666690                         nop        
01ae4 c5f877                         vzeroupper 
01ae7 e8f499b4ff                     call       0x7f4c1b9d7d60
01aec 0f1f8400e41b000e               nop        dword ptr [rax + rax + 0xe001be4]
01af4 4183c608                       add        r14d, 8
01af8 be6effffff                     mov        esi, 0xffffff6e
01afd 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01b02 448b1424                       mov        r10d, dword ptr [rsp]
01b06 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01b0e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01b13 4c891424                       mov        qword ptr [rsp], r10
01b17 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01b1c 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01b24 48894424f8                     mov        qword ptr [rsp - 8], rax
01b29 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01b2d 89442408                       mov        dword ptr [rsp + 8], eax
01b31 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b36 897c240c                       mov        dword ptr [rsp + 0xc], edi
01b3a 48ff742420                     push       qword ptr [rsp + 0x20]
01b3f 488f442418                     pop        qword ptr [rsp + 0x18]
01b44 48894424f8                     mov        qword ptr [rsp - 8], rax
01b49 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01b4d 89442414                       mov        dword ptr [rsp + 0x14], eax
01b51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b56 48ff742428                     push       qword ptr [rsp + 0x28]
01b5b 488f442420                     pop        qword ptr [rsp + 0x20]
01b60 48ff742430                     push       qword ptr [rsp + 0x30]
01b65 488f442428                     pop        qword ptr [rsp + 0x28]
01b6a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b6f 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01b73 89442430                       mov        dword ptr [rsp + 0x30], eax
01b77 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b7c 48894424f8                     mov        qword ptr [rsp - 8], rax
01b81 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01b85 89442434                       mov        dword ptr [rsp + 0x34], eax
01b89 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b8e 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01b93 48894424f8                     mov        qword ptr [rsp - 8], rax
01b98 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01b9f 89442440                       mov        dword ptr [rsp + 0x40], eax
01ba3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ba8 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01bad 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
01bb1 666690                         nop        
01bb4 c5f877                         vzeroupper 
01bb7 e82499b4ff                     call       0x7f4c1b9d7d60
01bbc 0f1f8400b41c000f               nop        dword ptr [rax + rax + 0xf001cb4]
01bc4 4183c608                       add        r14d, 8
01bc8 be66ffffff                     mov        esi, 0xffffff66
01bcd 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01bd2 448b1c24                       mov        r11d, dword ptr [rsp]
01bd6 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01bde 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01be3 4c891424                       mov        qword ptr [rsp], r10
01be7 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01bec 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01bf4 48894424f8                     mov        qword ptr [rsp - 8], rax
01bf9 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01bfd 89442408                       mov        dword ptr [rsp + 8], eax
01c01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c06 897c240c                       mov        dword ptr [rsp + 0xc], edi
01c0a 48ff742420                     push       qword ptr [rsp + 0x20]
01c0f 488f442418                     pop        qword ptr [rsp + 0x18]
01c14 48894424f8                     mov        qword ptr [rsp - 8], rax
01c19 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01c1d 89442414                       mov        dword ptr [rsp + 0x14], eax
01c21 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c26 48ff742428                     push       qword ptr [rsp + 0x28]
01c2b 488f442420                     pop        qword ptr [rsp + 0x20]
01c30 48ff742430                     push       qword ptr [rsp + 0x30]
01c35 488f442428                     pop        qword ptr [rsp + 0x28]
01c3a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c3f 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01c43 89442430                       mov        dword ptr [rsp + 0x30], eax
01c47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c4c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c51 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01c55 89442434                       mov        dword ptr [rsp + 0x34], eax
01c59 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c5e 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01c63 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01c68 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
01c6c 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
01c71 666690                         nop        
01c74 c5f877                         vzeroupper 
01c77 e86498b4ff                     call       0x7f4c1b9d7d60
01c7c 0f1f8400741d0010               nop        dword ptr [rax + rax + 0x10001d74]
01c84 418be8                         mov        ebp, r8d
01c87 e942e9ffff                     jmp        0x7f4c1be8ce4e
01c8c beccffffff                     mov        esi, 0xffffffcc
01c91 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01c96 448b1424                       mov        r10d, dword ptr [rsp]
01c9a 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01ca2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01ca7 4c891424                       mov        qword ptr [rsp], r10
01cab 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01cb0 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01cb8 48ff742420                     push       qword ptr [rsp + 0x20]
01cbd 488f442418                     pop        qword ptr [rsp + 0x18]
01cc2 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc7 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01ccb 89442414                       mov        dword ptr [rsp + 0x14], eax
01ccf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd4 48ff742428                     push       qword ptr [rsp + 0x28]
01cd9 488f442420                     pop        qword ptr [rsp + 0x20]
01cde 48ff742430                     push       qword ptr [rsp + 0x30]
01ce3 488f442428                     pop        qword ptr [rsp + 0x28]
01ce8 48894424f8                     mov        qword ptr [rsp - 8], rax
01ced 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01cf1 89442430                       mov        dword ptr [rsp + 0x30], eax
01cf5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cfa 48894424f8                     mov        qword ptr [rsp - 8], rax
01cff 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01d03 89442434                       mov        dword ptr [rsp + 0x34], eax
01d07 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d0c 48894424f8                     mov        qword ptr [rsp - 8], rax
01d11 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01d15 89442440                       mov        dword ptr [rsp + 0x40], eax
01d19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d1e 4489742444                     mov        dword ptr [rsp + 0x44], r14d
01d23 48894424f8                     mov        qword ptr [rsp - 8], rax
01d28 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01d2c 89442448                       mov        dword ptr [rsp + 0x48], eax
01d30 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d35 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01d39 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01d3e 6690                           nop        
01d40 c5f877                         vzeroupper 
01d43 e89897b4ff                     call       0x7f4c1b9d7d60
01d48 0f1f8400401e0011               nop        dword ptr [rax + rax + 0x11001e40]
01d50 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01d55 448bc0                         mov        r8d, eax
01d58 4403442440                     add        r8d, dword ptr [rsp + 0x40]
01d5d 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01d62 4f8b44030c                     mov        r8, qword ptr [r11 + r8 + 0xc]
01d67 4f8944130c                     mov        qword ptr [r11 + r10 + 0xc], r8
01d6c 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01d71 4183c008                       add        r8d, 8
01d75 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01d7a 443bc1                         cmp        r8d, ecx
01d7d 7cd1                           jl         0x7f4c1be8e5d0
01d7f 443bc7                         cmp        r8d, edi
01d82 0f8d9e000000                   jge        0x7f4c1be8e6a6
01d88 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01d8d 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
01d91 0f1f840000000000               nop        dword ptr [rax + rax]
01d99 0f1f8000000000                 nop        dword ptr [rax]
01da0 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01da5 4d63c2                         movsxd     r8, r10d
01da8 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01dad 448bd8                         mov        r11d, eax
01db0 44035c2440                     add        r11d, dword ptr [rsp + 0x40]
01db5 458bcb                         mov        r9d, r11d
01db8 4e8b5c1b0c                     mov        r11, qword ptr [rbx + r11 + 0xc]
01dbd 4e895c130c                     mov        qword ptr [rbx + r10 + 0xc], r11
01dc2 4d63d9                         movsxd     r11, r9d
01dc5 4e8b541b14                     mov        r10, qword ptr [rbx + r11 + 0x14]
01dca 4e89540314                     mov        qword ptr [rbx + r8 + 0x14], r10
01dcf 4e8b541b1c                     mov        r10, qword ptr [rbx + r11 + 0x1c]
01dd4 4e8954031c                     mov        qword ptr [rbx + r8 + 0x1c], r10
01dd9 4e8b541b24                     mov        r10, qword ptr [rbx + r11 + 0x24]
01dde 4e89540324                     mov        qword ptr [rbx + r8 + 0x24], r10
01de3 4e8b541b2c                     mov        r10, qword ptr [rbx + r11 + 0x2c]
01de8 4e8954032c                     mov        qword ptr [rbx + r8 + 0x2c], r10
01ded 4e8b541b34                     mov        r10, qword ptr [rbx + r11 + 0x34]
01df2 4e89540334                     mov        qword ptr [rbx + r8 + 0x34], r10
01df7 4e8b541b3c                     mov        r10, qword ptr [rbx + r11 + 0x3c]
01dfc 4e8954033c                     mov        qword ptr [rbx + r8 + 0x3c], r10
01e01 4e8b541b44                     mov        r10, qword ptr [rbx + r11 + 0x44]
01e06 4e89540344                     mov        qword ptr [rbx + r8 + 0x44], r10
01e0b 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01e10 4183c240                       add        r10d, 0x40
01e14 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01e19 443bd7                         cmp        r10d, edi
01e1c 0f8c7effffff                   jl         0x7f4c1be8e620
01e22 895c2460                       mov        dword ptr [rsp + 0x60], ebx
01e26 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01e2b 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
01e33 0f8d9ee7ffff                   jge        0x7f4c1be8ce57
01e39 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01e3e 418bcb                         mov        ecx, r11d
01e41 666690                         nop        
01e44 448d1c08                       lea        r11d, [rax + rcx]
01e48 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01e4d 4f8b5c1a0c                     mov        r11, qword ptr [r10 + r11 + 0xc]
01e52 448bc1                         mov        r8d, ecx
01e55 4f895c020c                     mov        qword ptr [r10 + r8 + 0xc], r11
01e5a 448d5908                       lea        r11d, [rcx + 8]
01e5e 418bcb                         mov        ecx, r11d
01e61 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
01e69 7cd9                           jl         0x7f4c1be8e6c4
01e6b e967e7ffff                     jmp        0x7f4c1be8ce57
01e70 bee4ffffff                     mov        esi, 0xffffffe4
01e75 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01e7a 448b0424                       mov        r8d, dword ptr [rsp]
01e7e 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01e86 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01e8b 4c891c24                       mov        qword ptr [rsp], r11
01e8f 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01e94 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01e9c 48894424f8                     mov        qword ptr [rsp - 8], rax
01ea1 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01ea5 89442408                       mov        dword ptr [rsp + 8], eax
01ea9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eae 8944240c                       mov        dword ptr [rsp + 0xc], eax
01eb2 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01eb7 48ff742420                     push       qword ptr [rsp + 0x20]
01ebc 488f442418                     pop        qword ptr [rsp + 0x18]
01ec1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ec6 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01eca 89442414                       mov        dword ptr [rsp + 0x14], eax
01ece 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ed3 48ff742428                     push       qword ptr [rsp + 0x28]
01ed8 488f442420                     pop        qword ptr [rsp + 0x20]
01edd 48ff742430                     push       qword ptr [rsp + 0x30]
01ee2 488f442428                     pop        qword ptr [rsp + 0x28]
01ee7 48894424f8                     mov        qword ptr [rsp - 8], rax
01eec 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01ef0 89442430                       mov        dword ptr [rsp + 0x30], eax
01ef4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ef9 48894424f8                     mov        qword ptr [rsp - 8], rax
01efe 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01f02 89442434                       mov        dword ptr [rsp + 0x34], eax
01f06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f0b 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01f0f 4489742440                     mov        dword ptr [rsp + 0x40], r14d
01f14 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
01f19 666690                         nop        
01f1c c5f877                         vzeroupper 
01f1f e8bc95b4ff                     call       0x7f4c1b9d7d60
01f24 0f1f84001c200012               nop        dword ptr [rax + rax + 0x1200201c]
01f2c 4585f6                         test       r14d, r14d
01f2f 0f84ef130000                   je         0x7f4c1be8fba4
01f35 8b2c24                         mov        ebp, dword ptr [rsp]
01f38 8984249c000000                 mov        dword ptr [rsp + 0x9c], eax
01f3f 4533c0                         xor        r8d, r8d
01f42 e941ecffff                     jmp        0x7f4c1be8d408
01f47 bee4ffffff                     mov        esi, 0xffffffe4
01f4c 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01f51 448b1c24                       mov        r11d, dword ptr [rsp]
01f55 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01f5d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01f62 4c891424                       mov        qword ptr [rsp], r10
01f66 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01f6b 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01f73 48ff742420                     push       qword ptr [rsp + 0x20]
01f78 488f442410                     pop        qword ptr [rsp + 0x10]
01f7d 48894424f8                     mov        qword ptr [rsp - 8], rax
01f82 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01f86 89442418                       mov        dword ptr [rsp + 0x18], eax
01f8a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f8f 48ff742428                     push       qword ptr [rsp + 0x28]
01f94 488f442420                     pop        qword ptr [rsp + 0x20]
01f99 48ff742430                     push       qword ptr [rsp + 0x30]
01f9e 488f442428                     pop        qword ptr [rsp + 0x28]
01fa3 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa8 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01fac 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01fb0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fb5 48894424f8                     mov        qword ptr [rsp - 8], rax
01fba 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01fbe 89442430                       mov        dword ptr [rsp + 0x30], eax
01fc2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fc7 48894424f8                     mov        qword ptr [rsp - 8], rax
01fcc 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01fd0 89442438                       mov        dword ptr [rsp + 0x38], eax
01fd4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd9 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
01fde 48894424f8                     mov        qword ptr [rsp - 8], rax
01fe3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01fe7 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01feb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ff0 895c2450                       mov        dword ptr [rsp + 0x50], ebx
01ff4 4489742458                     mov        dword ptr [rsp + 0x58], r14d
01ff9 666690                         nop        
01ffc c5f877                         vzeroupper 
01fff e8dc94b4ff                     call       0x7f4c1b9d7d60
02004 0f1f8400fc200013               nop        dword ptr [rax + rax + 0x130020fc]
0200c bee4ffffff                     mov        esi, 0xffffffe4
02011 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02016 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0201e 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02023 4489542404                     mov        dword ptr [rsp + 4], r10d
02028 48ff742420                     push       qword ptr [rsp + 0x20]
0202d 488f442418                     pop        qword ptr [rsp + 0x18]
02032 48894424f8                     mov        qword ptr [rsp - 8], rax
02037 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0203b 89442420                       mov        dword ptr [rsp + 0x20], eax
0203f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02044 48894424f8                     mov        qword ptr [rsp - 8], rax
02049 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0204d 89442424                       mov        dword ptr [rsp + 0x24], eax
02051 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02056 48894424f8                     mov        qword ptr [rsp - 8], rax
0205b 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0205f 89442438                       mov        dword ptr [rsp + 0x38], eax
02063 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02068 48894424f8                     mov        qword ptr [rsp - 8], rax
0206d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02071 89442440                       mov        dword ptr [rsp + 0x40], eax
02075 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0207a 4489742448                     mov        dword ptr [rsp + 0x48], r14d
0207f 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
02084 4489442450                     mov        dword ptr [rsp + 0x50], r8d
02089 48894424f8                     mov        qword ptr [rsp - 8], rax
0208e 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02092 89442454                       mov        dword ptr [rsp + 0x54], eax
02096 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0209b 895c2458                       mov        dword ptr [rsp + 0x58], ebx
0209f 90                             nop        
020a0 c5f877                         vzeroupper 
020a3 e83894b4ff                     call       0x7f4c1b9d7d60
020a8 0f1f8400a0210014               nop        dword ptr [rax + rax + 0x140021a0]
020b0 418d6e01                       lea        ebp, [r14 + 1]
020b4 bee4ffffff                     mov        esi, 0xffffffe4
020b9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
020be 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
020c6 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
020cb 4489542404                     mov        dword ptr [rsp + 4], r10d
020d0 48ff742420                     push       qword ptr [rsp + 0x20]
020d5 488f442418                     pop        qword ptr [rsp + 0x18]
020da 48894424f8                     mov        qword ptr [rsp - 8], rax
020df 8b442444                       mov        eax, dword ptr [rsp + 0x44]
020e3 89442420                       mov        dword ptr [rsp + 0x20], eax
020e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ec 48894424f8                     mov        qword ptr [rsp - 8], rax
020f1 8b442464                       mov        eax, dword ptr [rsp + 0x64]
020f5 89442424                       mov        dword ptr [rsp + 0x24], eax
020f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020fe 48894424f8                     mov        qword ptr [rsp - 8], rax
02103 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02107 89442438                       mov        dword ptr [rsp + 0x38], eax
0210b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02110 48894424f8                     mov        qword ptr [rsp - 8], rax
02115 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02119 89442440                       mov        dword ptr [rsp + 0x40], eax
0211d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02122 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02126 4489742448                     mov        dword ptr [rsp + 0x48], r14d
0212b 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
02130 4489442450                     mov        dword ptr [rsp + 0x50], r8d
02135 48894424f8                     mov        qword ptr [rsp - 8], rax
0213a 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0213e 89442454                       mov        dword ptr [rsp + 0x54], eax
02142 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02147 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0214c 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02151 894c2470                       mov        dword ptr [rsp + 0x70], ecx
02155 666690                         nop        
02158 c5f877                         vzeroupper 
0215b e88093b4ff                     call       0x7f4c1b9d7d60
02160 0f1f840058220015               nop        dword ptr [rax + rax + 0x15002258]
02168 bee4ffffff                     mov        esi, 0xffffffe4
0216d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02172 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0217a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0217f 44895c2404                     mov        dword ptr [rsp + 4], r11d
02184 48ff742420                     push       qword ptr [rsp + 0x20]
02189 488f442418                     pop        qword ptr [rsp + 0x18]
0218e 48894424f8                     mov        qword ptr [rsp - 8], rax
02193 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02197 89442420                       mov        dword ptr [rsp + 0x20], eax
0219b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021a0 48894424f8                     mov        qword ptr [rsp - 8], rax
021a5 8b442464                       mov        eax, dword ptr [rsp + 0x64]
021a9 89442424                       mov        dword ptr [rsp + 0x24], eax
021ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021b2 48894424f8                     mov        qword ptr [rsp - 8], rax
021b7 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
021bb 89442438                       mov        dword ptr [rsp + 0x38], eax
021bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021c4 48894424f8                     mov        qword ptr [rsp - 8], rax
021c9 8b442460                       mov        eax, dword ptr [rsp + 0x60]
021cd 89442440                       mov        dword ptr [rsp + 0x40], eax
021d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021d6 895c2444                       mov        dword ptr [rsp + 0x44], ebx
021da 4489742448                     mov        dword ptr [rsp + 0x48], r14d
021df 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
021e4 4489442450                     mov        dword ptr [rsp + 0x50], r8d
021e9 48894424f8                     mov        qword ptr [rsp - 8], rax
021ee 8b442460                       mov        eax, dword ptr [rsp + 0x60]
021f2 89442454                       mov        dword ptr [rsp + 0x54], eax
021f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021fb 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
021ff 90                             nop        
02200 c5f877                         vzeroupper 
02203 e8d892b4ff                     call       0x7f4c1b9d7d60
02208 0f1f840000230016               nop        dword ptr [rax + rax + 0x16002300]
02210 bee4ffffff                     mov        esi, 0xffffffe4
02215 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0221a 448b1424                       mov        r10d, dword ptr [rsp]
0221e 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
02226 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0222b 4c891424                       mov        qword ptr [rsp], r10
0222f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02234 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0223c 48ff742420                     push       qword ptr [rsp + 0x20]
02241 488f442410                     pop        qword ptr [rsp + 0x10]
02246 48894424f8                     mov        qword ptr [rsp - 8], rax
0224b 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0224f 89442418                       mov        dword ptr [rsp + 0x18], eax
02253 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02258 48ff742428                     push       qword ptr [rsp + 0x28]
0225d 488f442420                     pop        qword ptr [rsp + 0x20]
02262 48ff742430                     push       qword ptr [rsp + 0x30]
02267 488f442428                     pop        qword ptr [rsp + 0x28]
0226c 48894424f8                     mov        qword ptr [rsp - 8], rax
02271 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02275 89442430                       mov        dword ptr [rsp + 0x30], eax
02279 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0227e 48894424f8                     mov        qword ptr [rsp - 8], rax
02283 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02287 89442438                       mov        dword ptr [rsp + 0x38], eax
0228b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02290 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
02294 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02299 4489742448                     mov        dword ptr [rsp + 0x48], r14d
0229e 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
022a3 90                             nop        
022a4 c5f877                         vzeroupper 
022a7 e83492b4ff                     call       0x7f4c1b9d7d60
022ac 0f1f8400a4230017               nop        dword ptr [rax + rax + 0x170023a4]
022b4 bee4ffffff                     mov        esi, 0xffffffe4
022b9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
022be 448b1c24                       mov        r11d, dword ptr [rsp]
022c2 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
022ca 4c8b542408                     mov        r10, qword ptr [rsp + 8]
022cf 4c891424                       mov        qword ptr [rsp], r10
022d3 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
022d8 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
022e0 48ff742420                     push       qword ptr [rsp + 0x20]
022e5 488f442410                     pop        qword ptr [rsp + 0x10]
022ea 48894424f8                     mov        qword ptr [rsp - 8], rax
022ef 8b442444                       mov        eax, dword ptr [rsp + 0x44]
022f3 89442418                       mov        dword ptr [rsp + 0x18], eax
022f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022fc 48ff742428                     push       qword ptr [rsp + 0x28]
02301 488f442420                     pop        qword ptr [rsp + 0x20]
02306 48ff742430                     push       qword ptr [rsp + 0x30]
0230b 488f442428                     pop        qword ptr [rsp + 0x28]
02310 48894424f8                     mov        qword ptr [rsp - 8], rax
02315 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02319 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0231d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02322 48894424f8                     mov        qword ptr [rsp - 8], rax
02327 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0232b 89442430                       mov        dword ptr [rsp + 0x30], eax
0232f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02334 48894424f8                     mov        qword ptr [rsp - 8], rax
02339 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0233d 89442438                       mov        dword ptr [rsp + 0x38], eax
02341 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02346 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0234a 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
0234f 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02354 48894424f8                     mov        qword ptr [rsp - 8], rax
02359 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0235d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02361 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02366 4489742454                     mov        dword ptr [rsp + 0x54], r14d
0236b 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02370 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02375 894c2470                       mov        dword ptr [rsp + 0x70], ecx
02379 666690                         nop        
0237c c5f877                         vzeroupper 
0237f e85c91b4ff                     call       0x7f4c1b9d7d60
02384 0f1f84007c240018               nop        dword ptr [rax + rax + 0x1800247c]
0238c bee4ffffff                     mov        esi, 0xffffffe4
02391 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02396 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0239e 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
023a3 4489542404                     mov        dword ptr [rsp + 4], r10d
023a8 48ff742420                     push       qword ptr [rsp + 0x20]
023ad 488f442418                     pop        qword ptr [rsp + 0x18]
023b2 48894424f8                     mov        qword ptr [rsp - 8], rax
023b7 8b442444                       mov        eax, dword ptr [rsp + 0x44]
023bb 89442420                       mov        dword ptr [rsp + 0x20], eax
023bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023c4 48894424f8                     mov        qword ptr [rsp - 8], rax
023c9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
023cd 89442424                       mov        dword ptr [rsp + 0x24], eax
023d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d6 48894424f8                     mov        qword ptr [rsp - 8], rax
023db 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
023df 89442438                       mov        dword ptr [rsp + 0x38], eax
023e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023e8 48894424f8                     mov        qword ptr [rsp - 8], rax
023ed 8b442460                       mov        eax, dword ptr [rsp + 0x60]
023f1 89442440                       mov        dword ptr [rsp + 0x40], eax
023f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023fa 895c2444                       mov        dword ptr [rsp + 0x44], ebx
023fe 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02403 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
02408 48894424f8                     mov        qword ptr [rsp - 8], rax
0240d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02411 89442450                       mov        dword ptr [rsp + 0x50], eax
02415 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0241a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0241f 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02424 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
02429 894c2470                       mov        dword ptr [rsp + 0x70], ecx
0242d 666690                         nop        
02430 c5f877                         vzeroupper 
02433 e8a890b4ff                     call       0x7f4c1b9d7d60
02438 0f1f840030250019               nop        dword ptr [rax + rax + 0x19002530]
02440 beccffffff                     mov        esi, 0xffffffcc
02445 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0244a 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02452 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02457 4489542404                     mov        dword ptr [rsp + 4], r10d
0245c 48ff742420                     push       qword ptr [rsp + 0x20]
02461 488f442418                     pop        qword ptr [rsp + 0x18]
02466 48894424f8                     mov        qword ptr [rsp - 8], rax
0246b 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0246f 89442420                       mov        dword ptr [rsp + 0x20], eax
02473 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02478 48894424f8                     mov        qword ptr [rsp - 8], rax
0247d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02481 89442424                       mov        dword ptr [rsp + 0x24], eax
02485 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0248a 48894424f8                     mov        qword ptr [rsp - 8], rax
0248f 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02493 89442438                       mov        dword ptr [rsp + 0x38], eax
02497 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0249c 48894424f8                     mov        qword ptr [rsp - 8], rax
024a1 8b442460                       mov        eax, dword ptr [rsp + 0x60]
024a5 89442440                       mov        dword ptr [rsp + 0x40], eax
024a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024ae 895c2444                       mov        dword ptr [rsp + 0x44], ebx
024b2 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
024b7 48894424f8                     mov        qword ptr [rsp - 8], rax
024bc 8b442460                       mov        eax, dword ptr [rsp + 0x60]
024c0 89442450                       mov        dword ptr [rsp + 0x50], eax
024c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024c9 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
024ce 4c89542468                     mov        qword ptr [rsp + 0x68], r10
024d3 894c2470                       mov        dword ptr [rsp + 0x70], ecx
024d7 90                             nop        
024d8 c5f877                         vzeroupper 
024db e80090b4ff                     call       0x7f4c1b9d7d60
024e0 0f1f8400d825001a               nop        dword ptr [rax + rax + 0x1a0025d8]
024e8 be6effffff                     mov        esi, 0xffffff6e
024ed 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
024f2 448b1c24                       mov        r11d, dword ptr [rsp]
024f6 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
024fe 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
02503 4c891c24                       mov        qword ptr [rsp], r11
02507 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0250c 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02514 48894424f8                     mov        qword ptr [rsp - 8], rax
02519 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0251d 89442408                       mov        dword ptr [rsp + 8], eax
02521 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02526 8944240c                       mov        dword ptr [rsp + 0xc], eax
0252a 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0252f 48ff742420                     push       qword ptr [rsp + 0x20]
02534 488f442418                     pop        qword ptr [rsp + 0x18]
02539 48894424f8                     mov        qword ptr [rsp - 8], rax
0253e 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
02542 89442414                       mov        dword ptr [rsp + 0x14], eax
02546 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0254b 48ff742428                     push       qword ptr [rsp + 0x28]
02550 488f442420                     pop        qword ptr [rsp + 0x20]
02555 48ff742430                     push       qword ptr [rsp + 0x30]
0255a 488f442428                     pop        qword ptr [rsp + 0x28]
0255f 48894424f8                     mov        qword ptr [rsp - 8], rax
02564 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02568 89442430                       mov        dword ptr [rsp + 0x30], eax
0256c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02571 48894424f8                     mov        qword ptr [rsp - 8], rax
02576 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0257a 89442434                       mov        dword ptr [rsp + 0x34], eax
0257e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02583 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
02587 4489742440                     mov        dword ptr [rsp + 0x40], r14d
0258c 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
02591 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
02596 6690                           nop        
02598 c5f877                         vzeroupper 
0259b e8408fb4ff                     call       0x7f4c1b9d7d60
025a0 0f1f84009826001b               nop        dword ptr [rax + rax + 0x1b002698]
025a8 be45ffffff                     mov        esi, 0xffffff45
025ad 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
025b2 448b0424                       mov        r8d, dword ptr [rsp]
025b6 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
025be 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
025c3 4c891c24                       mov        qword ptr [rsp], r11
025c7 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
025cc 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
025d4 48894424f8                     mov        qword ptr [rsp - 8], rax
025d9 8b442460                       mov        eax, dword ptr [rsp + 0x60]
025dd 89442408                       mov        dword ptr [rsp + 8], eax
025e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025e6 8944240c                       mov        dword ptr [rsp + 0xc], eax
025ea 4489542410                     mov        dword ptr [rsp + 0x10], r10d
025ef 48ff742420                     push       qword ptr [rsp + 0x20]
025f4 488f442418                     pop        qword ptr [rsp + 0x18]
025f9 48894424f8                     mov        qword ptr [rsp - 8], rax
025fe 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
02602 89442414                       mov        dword ptr [rsp + 0x14], eax
02606 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0260b 48ff742428                     push       qword ptr [rsp + 0x28]
02610 488f442420                     pop        qword ptr [rsp + 0x20]
02615 48ff742430                     push       qword ptr [rsp + 0x30]
0261a 488f442428                     pop        qword ptr [rsp + 0x28]
0261f 48894424f8                     mov        qword ptr [rsp - 8], rax
02624 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02628 89442430                       mov        dword ptr [rsp + 0x30], eax
0262c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02631 48894424f8                     mov        qword ptr [rsp - 8], rax
02636 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0263a 89442434                       mov        dword ptr [rsp + 0x34], eax
0263e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02643 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
02647 4489742440                     mov        dword ptr [rsp + 0x40], r14d
0264c 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
02651 666690                         nop        
02654 c5f877                         vzeroupper 
02657 e8848eb4ff                     call       0x7f4c1b9d7d60
0265c 0f1f84005427001c               nop        dword ptr [rax + rax + 0x1c002754]
02664 be3dffffff                     mov        esi, 0xffffff3d
02669 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0266e 448b1c24                       mov        r11d, dword ptr [rsp]
02672 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0267a 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0267f 4c891c24                       mov        qword ptr [rsp], r11
02683 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02688 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02690 48894424f8                     mov        qword ptr [rsp - 8], rax
02695 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02699 89442408                       mov        dword ptr [rsp + 8], eax
0269d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026a2 8944240c                       mov        dword ptr [rsp + 0xc], eax
026a6 4489542410                     mov        dword ptr [rsp + 0x10], r10d
026ab 48ff742420                     push       qword ptr [rsp + 0x20]
026b0 488f442418                     pop        qword ptr [rsp + 0x18]
026b5 48894424f8                     mov        qword ptr [rsp - 8], rax
026ba 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
026be 89442414                       mov        dword ptr [rsp + 0x14], eax
026c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026c7 48ff742428                     push       qword ptr [rsp + 0x28]
026cc 488f442420                     pop        qword ptr [rsp + 0x20]
026d1 48ff742430                     push       qword ptr [rsp + 0x30]
026d6 488f442428                     pop        qword ptr [rsp + 0x28]
026db 48894424f8                     mov        qword ptr [rsp - 8], rax
026e0 8b442464                       mov        eax, dword ptr [rsp + 0x64]
026e4 89442430                       mov        dword ptr [rsp + 0x30], eax
026e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026ed 48894424f8                     mov        qword ptr [rsp - 8], rax
026f2 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
026f6 89442434                       mov        dword ptr [rsp + 0x34], eax
026fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026ff 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
02703 4489742440                     mov        dword ptr [rsp + 0x40], r14d
02708 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
0270d 666690                         nop        
02710 c5f877                         vzeroupper 
02713 e8c88db4ff                     call       0x7f4c1b9d7d60
02718 0f1f84001028001d               nop        dword ptr [rax + rax + 0x1d002810]
02720 bee4ffffff                     mov        esi, 0xffffffe4
02725 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0272a 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02732 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02737 4489542404                     mov        dword ptr [rsp + 4], r10d
0273c 48ff742420                     push       qword ptr [rsp + 0x20]
02741 488f442418                     pop        qword ptr [rsp + 0x18]
02746 48894424f8                     mov        qword ptr [rsp - 8], rax
0274b 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0274f 89442420                       mov        dword ptr [rsp + 0x20], eax
02753 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02758 48894424f8                     mov        qword ptr [rsp - 8], rax
0275d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02761 89442424                       mov        dword ptr [rsp + 0x24], eax
02765 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0276a 48894424f8                     mov        qword ptr [rsp - 8], rax
0276f 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02773 89442438                       mov        dword ptr [rsp + 0x38], eax
02777 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0277c 895c2440                       mov        dword ptr [rsp + 0x40], ebx
02780 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02785 48894424f8                     mov        qword ptr [rsp - 8], rax
0278a 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0278e 89442448                       mov        dword ptr [rsp + 0x48], eax
02792 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02797 48894424f8                     mov        qword ptr [rsp - 8], rax
0279c 8b442460                       mov        eax, dword ptr [rsp + 0x60]
027a0 8944244c                       mov        dword ptr [rsp + 0x4c], eax
027a4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027a9 48894424f8                     mov        qword ptr [rsp - 8], rax
027ae 8b442468                       mov        eax, dword ptr [rsp + 0x68]
027b2 89442450                       mov        dword ptr [rsp + 0x50], eax
027b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027bb 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
027c0 c5f877                         vzeroupper 
027c3 e8188db4ff                     call       0x7f4c1b9d7d60
027c8 0f1f8400c028001e               nop        dword ptr [rax + rax + 0x1e0028c0]
027d0 bee4ffffff                     mov        esi, 0xffffffe4
027d5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
027da 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
027e2 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
027e7 44895c2404                     mov        dword ptr [rsp + 4], r11d
027ec 48ff742420                     push       qword ptr [rsp + 0x20]
027f1 488f442418                     pop        qword ptr [rsp + 0x18]
027f6 48894424f8                     mov        qword ptr [rsp - 8], rax
027fb 8b442444                       mov        eax, dword ptr [rsp + 0x44]
027ff 89442420                       mov        dword ptr [rsp + 0x20], eax
02803 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02808 48894424f8                     mov        qword ptr [rsp - 8], rax
0280d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02811 89442424                       mov        dword ptr [rsp + 0x24], eax
02815 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0281a 48894424f8                     mov        qword ptr [rsp - 8], rax
0281f 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02823 89442438                       mov        dword ptr [rsp + 0x38], eax
02827 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0282c 895c2440                       mov        dword ptr [rsp + 0x40], ebx
02830 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02835 48894424f8                     mov        qword ptr [rsp - 8], rax
0283a 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0283e 89442448                       mov        dword ptr [rsp + 0x48], eax
02842 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02847 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
0284c c5f877                         vzeroupper 
0284f e88c8cb4ff                     call       0x7f4c1b9d7d60
02854 0f1f84004c29001f               nop        dword ptr [rax + rax + 0x1f00294c]
0285c beccffffff                     mov        esi, 0xffffffcc
02861 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02866 448b1424                       mov        r10d, dword ptr [rsp]
0286a 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
02872 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02877 4c891424                       mov        qword ptr [rsp], r10
0287b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02880 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
02888 48ff742420                     push       qword ptr [rsp + 0x20]
0288d 488f442410                     pop        qword ptr [rsp + 0x10]
02892 48894424f8                     mov        qword ptr [rsp - 8], rax
02897 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0289b 89442418                       mov        dword ptr [rsp + 0x18], eax
0289f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028a4 48ff742428                     push       qword ptr [rsp + 0x28]
028a9 488f442420                     pop        qword ptr [rsp + 0x20]
028ae 48ff742430                     push       qword ptr [rsp + 0x30]
028b3 488f442428                     pop        qword ptr [rsp + 0x28]
028b8 48894424f8                     mov        qword ptr [rsp - 8], rax
028bd 8b442464                       mov        eax, dword ptr [rsp + 0x64]
028c1 8944241c                       mov        dword ptr [rsp + 0x1c], eax
028c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028ca 48894424f8                     mov        qword ptr [rsp - 8], rax
028cf 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
028d3 89442430                       mov        dword ptr [rsp + 0x30], eax
028d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028dc 48894424f8                     mov        qword ptr [rsp - 8], rax
028e1 8b442460                       mov        eax, dword ptr [rsp + 0x60]
028e5 89442438                       mov        dword ptr [rsp + 0x38], eax
028e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028ee 4489442440                     mov        dword ptr [rsp + 0x40], r8d
028f3 48894424f8                     mov        qword ptr [rsp - 8], rax
028f8 8b442460                       mov        eax, dword ptr [rsp + 0x60]
028fc 89442448                       mov        dword ptr [rsp + 0x48], eax
02900 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02905 448974244c                     mov        dword ptr [rsp + 0x4c], r14d
0290a 895c2454                       mov        dword ptr [rsp + 0x54], ebx
0290e 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
02913 90                             nop        
02914 c5f877                         vzeroupper 
02917 e8c48bb4ff                     call       0x7f4c1b9d7d60
0291c 0f1f8400142a0020               nop        dword ptr [rax + rax + 0x20002a14]
02924 be17000000                     mov        esi, 0x17
02929 666690                         nop        
0292c c5f877                         vzeroupper 
0292f e8ac8bb4ff                     call       0x7f4c1b9d7d60
02934 0f1f84002c2a0021               nop        dword ptr [rax + rax + 0x21002a2c]
0293c be6effffff                     mov        esi, 0xffffff6e
02941 4489742410                     mov        dword ptr [rsp + 0x10], r14d
02946 89442414                       mov        dword ptr [rsp + 0x14], eax
0294a 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0294f 895c2420                       mov        dword ptr [rsp + 0x20], ebx
02953 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
02958 48894c2430                     mov        qword ptr [rsp + 0x30], rcx
0295d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02962 6690                           nop        
02964 c5f877                         vzeroupper 
02967 e8748bb4ff                     call       0x7f4c1b9d7d60
0296c 0f1f8400642a0022               nop        dword ptr [rax + rax + 0x22002a64]
02974 bebeffffff                     mov        esi, 0xffffffbe
02979 4489742410                     mov        dword ptr [rsp + 0x10], r14d
0297e 89442414                       mov        dword ptr [rsp + 0x14], eax
02982 4c89442418                     mov        qword ptr [rsp + 0x18], r8
02987 895c2420                       mov        dword ptr [rsp + 0x20], ebx
0298b 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
02990 48894c2430                     mov        qword ptr [rsp + 0x30], rcx
02995 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0299a 6690                           nop        
0299c c5f877                         vzeroupper 
0299f e83c8bb4ff                     call       0x7f4c1b9d7d60
029a4 0f1f84009c2a0023               nop        dword ptr [rax + rax + 0x23002a9c]
029ac 4c8b6c2478                     mov        r13, qword ptr [rsp + 0x78]
029b1 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
029b6 448b742460                     mov        r14d, dword ptr [rsp + 0x60]
029bb 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
029c3 beccffffff                     mov        esi, 0xffffffcc
029c8 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
029d0 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
029d8 44893424                       mov        dword ptr [rsp], r14d
029dc 44894c2404                     mov        dword ptr [rsp + 4], r9d
029e1 4c896c2408                     mov        qword ptr [rsp + 8], r13
029e6 6690                           nop        
029e8 c5f877                         vzeroupper 
029eb e8f08ab4ff                     call       0x7f4c1b9d7d60
029f0 0f1f8400e82a0024               nop        dword ptr [rax + rax + 0x24002ae8]
029f8 bee4ffffff                     mov        esi, 0xffffffe4
029fd 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02a02 448b1c24                       mov        r11d, dword ptr [rsp]
02a06 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02a0e 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
02a13 4c891c24                       mov        qword ptr [rsp], r11
02a17 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02a1c 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
02a24 48894424f8                     mov        qword ptr [rsp - 8], rax
02a29 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02a2d 89442408                       mov        dword ptr [rsp + 8], eax
02a31 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a36 48ff742420                     push       qword ptr [rsp + 0x20]
02a3b 488f442410                     pop        qword ptr [rsp + 0x10]
02a40 48894424f8                     mov        qword ptr [rsp - 8], rax
02a45 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02a49 89442418                       mov        dword ptr [rsp + 0x18], eax
02a4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a52 48ff742428                     push       qword ptr [rsp + 0x28]
02a57 488f442420                     pop        qword ptr [rsp + 0x20]
02a5c 48ff742430                     push       qword ptr [rsp + 0x30]
02a61 488f442428                     pop        qword ptr [rsp + 0x28]
02a66 48894424f8                     mov        qword ptr [rsp - 8], rax
02a6b 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02a6f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02a73 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a78 48894424f8                     mov        qword ptr [rsp - 8], rax
02a7d 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02a81 89442430                       mov        dword ptr [rsp + 0x30], eax
02a85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a8a 895c2438                       mov        dword ptr [rsp + 0x38], ebx
02a8e 48894424f8                     mov        qword ptr [rsp - 8], rax
02a93 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02a97 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02a9b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02aa0 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
02aa5 48894424f8                     mov        qword ptr [rsp - 8], rax
02aaa 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
02aae 89442444                       mov        dword ptr [rsp + 0x44], eax
02ab2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ab7 89442448                       mov        dword ptr [rsp + 0x48], eax
02abb 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02ac0 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02ac5 48894424f8                     mov        qword ptr [rsp - 8], rax
02aca 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02ace 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02ad2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ad7 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02adc 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02ae1 666690                         nop        
02ae4 c5f877                         vzeroupper 
02ae7 e8f489b4ff                     call       0x7f4c1b9d7d60
02aec 0f1f8400e42b0025               nop        dword ptr [rax + rax + 0x25002be4]
02af4 bee4ffffff                     mov        esi, 0xffffffe4
02af9 498beb                         mov        rbp, r11
02afc 448b1c24                       mov        r11d, dword ptr [rsp]
02b00 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02b08 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
02b0d 4c891c24                       mov        qword ptr [rsp], r11
02b11 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02b16 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02b1e 48ff742420                     push       qword ptr [rsp + 0x20]
02b23 488f442410                     pop        qword ptr [rsp + 0x10]
02b28 48894424f8                     mov        qword ptr [rsp - 8], rax
02b2d 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02b31 89442418                       mov        dword ptr [rsp + 0x18], eax
02b35 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b3a 48ff742428                     push       qword ptr [rsp + 0x28]
02b3f 488f442420                     pop        qword ptr [rsp + 0x20]
02b44 48ff742430                     push       qword ptr [rsp + 0x30]
02b49 488f442428                     pop        qword ptr [rsp + 0x28]
02b4e 48894424f8                     mov        qword ptr [rsp - 8], rax
02b53 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02b57 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02b5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b60 48894424f8                     mov        qword ptr [rsp - 8], rax
02b65 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02b69 89442430                       mov        dword ptr [rsp + 0x30], eax
02b6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b72 895c2438                       mov        dword ptr [rsp + 0x38], ebx
02b76 48894424f8                     mov        qword ptr [rsp - 8], rax
02b7b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02b7f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02b83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b88 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
02b8d 48894424f8                     mov        qword ptr [rsp - 8], rax
02b92 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
02b96 89442444                       mov        dword ptr [rsp + 0x44], eax
02b9a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b9f 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02ba4 48894424f8                     mov        qword ptr [rsp - 8], rax
02ba9 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02bad 89442450                       mov        dword ptr [rsp + 0x50], eax
02bb1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bb6 89442454                       mov        dword ptr [rsp + 0x54], eax
02bba 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02bbf 4c89542460                     mov        qword ptr [rsp + 0x60], r10
02bc4 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02bc9 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02bce c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
02bd4 c5f877                         vzeroupper 
02bd7 e80489b4ff                     call       0x7f4c1b9d7d60
02bdc 0f1f8400d42c0026               nop        dword ptr [rax + rax + 0x26002cd4]
02be4 beccffffff                     mov        esi, 0xffffffcc
02be9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02bee 448b1c24                       mov        r11d, dword ptr [rsp]
02bf2 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02bfa 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
02bff 4c891c24                       mov        qword ptr [rsp], r11
02c03 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02c08 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02c10 48ff742420                     push       qword ptr [rsp + 0x20]
02c15 488f442418                     pop        qword ptr [rsp + 0x18]
02c1a 48894424f8                     mov        qword ptr [rsp - 8], rax
02c1f 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02c23 89442414                       mov        dword ptr [rsp + 0x14], eax
02c27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c2c 48ff742428                     push       qword ptr [rsp + 0x28]
02c31 488f442420                     pop        qword ptr [rsp + 0x20]
02c36 48ff742430                     push       qword ptr [rsp + 0x30]
02c3b 488f442428                     pop        qword ptr [rsp + 0x28]
02c40 48894424f8                     mov        qword ptr [rsp - 8], rax
02c45 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02c49 89442430                       mov        dword ptr [rsp + 0x30], eax
02c4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c52 48894424f8                     mov        qword ptr [rsp - 8], rax
02c57 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02c5b 89442434                       mov        dword ptr [rsp + 0x34], eax
02c5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c64 48894424f8                     mov        qword ptr [rsp - 8], rax
02c69 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02c6d 89442440                       mov        dword ptr [rsp + 0x40], eax
02c71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c76 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
02c7b 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02c80 48894424f8                     mov        qword ptr [rsp - 8], rax
02c85 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02c89 89442454                       mov        dword ptr [rsp + 0x54], eax
02c8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c92 89442458                       mov        dword ptr [rsp + 0x58], eax
02c96 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
02c9a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02c9f 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02ca4 c5f877                         vzeroupper 
02ca7 e83488b4ff                     call       0x7f4c1b9d7d60
02cac 0f1f8400a42d0027               nop        dword ptr [rax + rax + 0x27002da4]
02cb4 418bea                         mov        ebp, r10d
02cb7 83c510                         add        ebp, 0x10
02cba be6effffff                     mov        esi, 0xffffff6e
02cbf 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
02cc4 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
02ccc 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02cd1 4489442404                     mov        dword ptr [rsp + 4], r8d
02cd6 48894424f8                     mov        qword ptr [rsp - 8], rax
02cdb 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02cdf 89442410                       mov        dword ptr [rsp + 0x10], eax
02ce3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ce8 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02ced 48ff742420                     push       qword ptr [rsp + 0x20]
02cf2 488f442418                     pop        qword ptr [rsp + 0x18]
02cf7 48894424f8                     mov        qword ptr [rsp - 8], rax
02cfc 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02d00 89442420                       mov        dword ptr [rsp + 0x20], eax
02d04 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d09 48894424f8                     mov        qword ptr [rsp - 8], rax
02d0e 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02d12 89442424                       mov        dword ptr [rsp + 0x24], eax
02d16 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d1b 48894424f8                     mov        qword ptr [rsp - 8], rax
02d20 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02d24 89442438                       mov        dword ptr [rsp + 0x38], eax
02d28 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d2d 895c2440                       mov        dword ptr [rsp + 0x40], ebx
02d31 48894424f8                     mov        qword ptr [rsp - 8], rax
02d36 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02d3a 89442444                       mov        dword ptr [rsp + 0x44], eax
02d3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d43 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02d48 48894424f8                     mov        qword ptr [rsp - 8], rax
02d4d 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
02d51 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02d55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d5a 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
02d5f 90                             nop        
02d60 c5f877                         vzeroupper 
02d63 e87887b4ff                     call       0x7f4c1b9d7d60
02d68 0f1f8400602e0028               nop        dword ptr [rax + rax + 0x28002e60]
02d70 418bea                         mov        ebp, r10d
02d73 83c510                         add        ebp, 0x10
02d76 be66ffffff                     mov        esi, 0xffffff66
02d7b 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
02d80 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
02d88 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02d8d 44895c2404                     mov        dword ptr [rsp + 4], r11d
02d92 48894424f8                     mov        qword ptr [rsp - 8], rax
02d97 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02d9b 89442410                       mov        dword ptr [rsp + 0x10], eax
02d9f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02da4 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02da9 48ff742420                     push       qword ptr [rsp + 0x20]
02dae 488f442418                     pop        qword ptr [rsp + 0x18]
02db3 48894424f8                     mov        qword ptr [rsp - 8], rax
02db8 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02dbc 89442420                       mov        dword ptr [rsp + 0x20], eax
02dc0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02dc5 48894424f8                     mov        qword ptr [rsp - 8], rax
02dca 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02dce 89442424                       mov        dword ptr [rsp + 0x24], eax
02dd2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02dd7 48894424f8                     mov        qword ptr [rsp - 8], rax
02ddc 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02de0 89442438                       mov        dword ptr [rsp + 0x38], eax
02de4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02de9 895c2440                       mov        dword ptr [rsp + 0x40], ebx
02ded 48894424f8                     mov        qword ptr [rsp - 8], rax
02df2 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02df6 89442444                       mov        dword ptr [rsp + 0x44], eax
02dfa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02dff 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02e04 48894424f8                     mov        qword ptr [rsp - 8], rax
02e09 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
02e0d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02e11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e16 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
02e1b 90                             nop        
02e1c c5f877                         vzeroupper 
02e1f e8bc86b4ff                     call       0x7f4c1b9d7d60
02e24 0f1f84001c2f0029               nop        dword ptr [rax + rax + 0x29002f1c]
02e2c bee4ffffff                     mov        esi, 0xffffffe4
02e31 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02e36 448b1c24                       mov        r11d, dword ptr [rsp]
02e3a 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02e42 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02e47 4c891424                       mov        qword ptr [rsp], r10
02e4b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02e50 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
02e58 48ff742420                     push       qword ptr [rsp + 0x20]
02e5d 488f442410                     pop        qword ptr [rsp + 0x10]
02e62 48894424f8                     mov        qword ptr [rsp - 8], rax
02e67 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02e6b 89442418                       mov        dword ptr [rsp + 0x18], eax
02e6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e74 48ff742428                     push       qword ptr [rsp + 0x28]
02e79 488f442420                     pop        qword ptr [rsp + 0x20]
02e7e 48ff742430                     push       qword ptr [rsp + 0x30]
02e83 488f442428                     pop        qword ptr [rsp + 0x28]
02e88 48894424f8                     mov        qword ptr [rsp - 8], rax
02e8d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02e91 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02e95 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e9a 48894424f8                     mov        qword ptr [rsp - 8], rax
02e9f 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02ea3 89442430                       mov        dword ptr [rsp + 0x30], eax
02ea7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02eac 48894424f8                     mov        qword ptr [rsp - 8], rax
02eb1 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02eb5 89442444                       mov        dword ptr [rsp + 0x44], eax
02eb9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ebe 895c2448                       mov        dword ptr [rsp + 0x48], ebx
02ec2 48894424f8                     mov        qword ptr [rsp - 8], rax
02ec7 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02ecb 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02ecf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ed4 4489742450                     mov        dword ptr [rsp + 0x50], r14d
02ed9 48894424f8                     mov        qword ptr [rsp - 8], rax
02ede 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02ee2 89442454                       mov        dword ptr [rsp + 0x54], eax
02ee6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02eeb 90                             nop        
02eec c5f877                         vzeroupper 
02eef e8ec85b4ff                     call       0x7f4c1b9d7d60
02ef4 0f1f8400ec2f002a               nop        dword ptr [rax + rax + 0x2a002fec]
02efc bee4ffffff                     mov        esi, 0xffffffe4
02f01 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02f06 448b1c24                       mov        r11d, dword ptr [rsp]
02f0a 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02f12 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02f17 4c891424                       mov        qword ptr [rsp], r10
02f1b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02f20 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
02f28 48ff742420                     push       qword ptr [rsp + 0x20]
02f2d 488f442410                     pop        qword ptr [rsp + 0x10]
02f32 48894424f8                     mov        qword ptr [rsp - 8], rax
02f37 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02f3b 89442418                       mov        dword ptr [rsp + 0x18], eax
02f3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f44 48ff742428                     push       qword ptr [rsp + 0x28]
02f49 488f442420                     pop        qword ptr [rsp + 0x20]
02f4e 48ff742430                     push       qword ptr [rsp + 0x30]
02f53 488f442428                     pop        qword ptr [rsp + 0x28]
02f58 48894424f8                     mov        qword ptr [rsp - 8], rax
02f5d 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02f61 89442430                       mov        dword ptr [rsp + 0x30], eax
02f65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f6a 48894424f8                     mov        qword ptr [rsp - 8], rax
02f6f 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02f73 89442440                       mov        dword ptr [rsp + 0x40], eax
02f77 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f7c 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02f80 48894424f8                     mov        qword ptr [rsp - 8], rax
02f85 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02f89 89442448                       mov        dword ptr [rsp + 0x48], eax
02f8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f92 89442460                       mov        dword ptr [rsp + 0x60], eax
02f96 4c89442468                     mov        qword ptr [rsp + 0x68], r8
02f9b 90                             nop        
02f9c c5f877                         vzeroupper 
02f9f e83c85b4ff                     call       0x7f4c1b9d7d60
02fa4 0f1f84009c30002b               nop        dword ptr [rax + rax + 0x2b00309c]
02fac 448bd8                         mov        r11d, eax
02faf 458d5308                       lea        r10d, [r11 + 8]
02fb3 458bca                         mov        r9d, r10d
02fb6 be6effffff                     mov        esi, 0xffffff6e
02fbb 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02fc0 448b1c24                       mov        r11d, dword ptr [rsp]
02fc4 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02fcc 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02fd1 4c891424                       mov        qword ptr [rsp], r10
02fd5 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02fda 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
02fe2 48ff742420                     push       qword ptr [rsp + 0x20]
02fe7 488f442410                     pop        qword ptr [rsp + 0x10]
02fec 48894424f8                     mov        qword ptr [rsp - 8], rax
02ff1 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02ff5 89442418                       mov        dword ptr [rsp + 0x18], eax
02ff9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ffe 48ff742428                     push       qword ptr [rsp + 0x28]
03003 488f442420                     pop        qword ptr [rsp + 0x20]
03008 48ff742430                     push       qword ptr [rsp + 0x30]
0300d 488f442428                     pop        qword ptr [rsp + 0x28]
03012 48894424f8                     mov        qword ptr [rsp - 8], rax
03017 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0301b 89442430                       mov        dword ptr [rsp + 0x30], eax
0301f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03024 48894424f8                     mov        qword ptr [rsp - 8], rax
03029 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
03030 89442438                       mov        dword ptr [rsp + 0x38], eax
03034 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03039 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
0303e 6690                           nop        
03040 c5f877                         vzeroupper 
03043 e89884b4ff                     call       0x7f4c1b9d7d60
03048 0f1f84004031002c               nop        dword ptr [rax + rax + 0x2c003140]
03050 448bd8                         mov        r11d, eax
03053 458d5308                       lea        r10d, [r11 + 8]
03057 458bca                         mov        r9d, r10d
0305a be66ffffff                     mov        esi, 0xffffff66
0305f 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
03064 448b1c24                       mov        r11d, dword ptr [rsp]
03068 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
03070 4c8b542408                     mov        r10, qword ptr [rsp + 8]
03075 4c891424                       mov        qword ptr [rsp], r10
03079 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0307e 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
03086 48ff742420                     push       qword ptr [rsp + 0x20]
0308b 488f442410                     pop        qword ptr [rsp + 0x10]
03090 48894424f8                     mov        qword ptr [rsp - 8], rax
03095 8b442444                       mov        eax, dword ptr [rsp + 0x44]
03099 89442418                       mov        dword ptr [rsp + 0x18], eax
0309d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030a2 48ff742428                     push       qword ptr [rsp + 0x28]
030a7 488f442420                     pop        qword ptr [rsp + 0x20]
030ac 48ff742430                     push       qword ptr [rsp + 0x30]
030b1 488f442428                     pop        qword ptr [rsp + 0x28]
030b6 48894424f8                     mov        qword ptr [rsp - 8], rax
030bb 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
030bf 89442430                       mov        dword ptr [rsp + 0x30], eax
030c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030c8 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
030cd 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
030d2 6690                           nop        
030d4 c5f877                         vzeroupper 
030d7 e80484b4ff                     call       0x7f4c1b9d7d60
030dc 0f1f8400d431002d               nop        dword ptr [rax + rax + 0x2d0031d4]
030e4 bee4ffffff                     mov        esi, 0xffffffe4
030e9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
030ee 448b1c24                       mov        r11d, dword ptr [rsp]
030f2 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
030fa 4c8b542408                     mov        r10, qword ptr [rsp + 8]
030ff 4c891424                       mov        qword ptr [rsp], r10
03103 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
03108 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
03110 48ff742420                     push       qword ptr [rsp + 0x20]
03115 488f442410                     pop        qword ptr [rsp + 0x10]
0311a 48894424f8                     mov        qword ptr [rsp - 8], rax
0311f 8b442444                       mov        eax, dword ptr [rsp + 0x44]
03123 89442418                       mov        dword ptr [rsp + 0x18], eax
03127 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0312c 48ff742428                     push       qword ptr [rsp + 0x28]
03131 488f442420                     pop        qword ptr [rsp + 0x20]
03136 48ff742430                     push       qword ptr [rsp + 0x30]
0313b 488f442428                     pop        qword ptr [rsp + 0x28]
03140 48894424f8                     mov        qword ptr [rsp - 8], rax
03145 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
03149 89442430                       mov        dword ptr [rsp + 0x30], eax
0314d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03152 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
03156 48894424f8                     mov        qword ptr [rsp - 8], rax
0315b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0315f 89442444                       mov        dword ptr [rsp + 0x44], eax
03163 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03168 4489742448                     mov        dword ptr [rsp + 0x48], r14d
0316d 666690                         nop        
03170 c5f877                         vzeroupper 
03173 e86883b4ff                     call       0x7f4c1b9d7d60
03178 0f1f84007032002e               nop        dword ptr [rax + rax + 0x2e003270]
03180 bee4ffffff                     mov        esi, 0xffffffe4
03185 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0318a 448b1c24                       mov        r11d, dword ptr [rsp]
0318e 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
03196 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0319b 4c891424                       mov        qword ptr [rsp], r10
0319f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
031a4 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
031ac 48ff742420                     push       qword ptr [rsp + 0x20]
031b1 488f442410                     pop        qword ptr [rsp + 0x10]
031b6 48894424f8                     mov        qword ptr [rsp - 8], rax
031bb 8b442444                       mov        eax, dword ptr [rsp + 0x44]
031bf 89442418                       mov        dword ptr [rsp + 0x18], eax
031c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031c8 48ff742428                     push       qword ptr [rsp + 0x28]
031cd 488f442420                     pop        qword ptr [rsp + 0x20]
031d2 48ff742430                     push       qword ptr [rsp + 0x30]
031d7 488f442428                     pop        qword ptr [rsp + 0x28]
031dc 48894424f8                     mov        qword ptr [rsp - 8], rax
031e1 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
031e5 89442430                       mov        dword ptr [rsp + 0x30], eax
031e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031ee 4489742440                     mov        dword ptr [rsp + 0x40], r14d
031f3 48894424f8                     mov        qword ptr [rsp - 8], rax
031f8 8b442460                       mov        eax, dword ptr [rsp + 0x60]
031fc 89442444                       mov        dword ptr [rsp + 0x44], eax
03200 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03205 895c2448                       mov        dword ptr [rsp + 0x48], ebx
03209 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0320e 4c89542450                     mov        qword ptr [rsp + 0x50], r10
03213 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
03218 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0321d c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
03223 90                             nop        
03224 c5f877                         vzeroupper 
03227 e8b482b4ff                     call       0x7f4c1b9d7d60
0322c 0f1f84002433002f               nop        dword ptr [rax + rax + 0x2f003324]
03234 4183c610                       add        r14d, 0x10
03238 be6effffff                     mov        esi, 0xffffff6e
0323d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03242 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0324a 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0324f 4489542404                     mov        dword ptr [rsp + 4], r10d
03254 48ff742420                     push       qword ptr [rsp + 0x20]
03259 488f442418                     pop        qword ptr [rsp + 0x18]
0325e 48894424f8                     mov        qword ptr [rsp - 8], rax
03263 8b442444                       mov        eax, dword ptr [rsp + 0x44]
03267 89442420                       mov        dword ptr [rsp + 0x20], eax
0326b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03270 48894424f8                     mov        qword ptr [rsp - 8], rax
03275 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
03279 89442438                       mov        dword ptr [rsp + 0x38], eax
0327d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03282 48894424f8                     mov        qword ptr [rsp - 8], rax
03287 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0328e 89442440                       mov        dword ptr [rsp + 0x40], eax
03292 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03297 4489742444                     mov        dword ptr [rsp + 0x44], r14d
0329c c5f877                         vzeroupper 
0329f e83c82b4ff                     call       0x7f4c1b9d7d60
032a4 0f1f84009c330030               nop        dword ptr [rax + rax + 0x3000339c]
032ac 4183c610                       add        r14d, 0x10
032b0 be66ffffff                     mov        esi, 0xffffff66
032b5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
032ba 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
032c2 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
032c7 44895c2404                     mov        dword ptr [rsp + 4], r11d
032cc 48ff742420                     push       qword ptr [rsp + 0x20]
032d1 488f442418                     pop        qword ptr [rsp + 0x18]
032d6 48894424f8                     mov        qword ptr [rsp - 8], rax
032db 8b442444                       mov        eax, dword ptr [rsp + 0x44]
032df 89442420                       mov        dword ptr [rsp + 0x20], eax
032e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032e8 48894424f8                     mov        qword ptr [rsp - 8], rax
032ed 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
032f1 89442438                       mov        dword ptr [rsp + 0x38], eax
032f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032fa 48894424f8                     mov        qword ptr [rsp - 8], rax
032ff 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
03306 89442440                       mov        dword ptr [rsp + 0x40], eax
0330a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0330f 4489742444                     mov        dword ptr [rsp + 0x44], r14d
03314 c5f877                         vzeroupper 
03317 e8c481b4ff                     call       0x7f4c1b9d7d60
0331c 0f1f840014340031               nop        dword ptr [rax + rax + 0x31003414]
03324 bef6ffffff                     mov        esi, 0xfffffff6
03329 488bea                         mov        rbp, rdx
0332c 898424d0000000                 mov        dword ptr [rsp + 0xd0], eax
03333 90                             nop        
03334 c5f877                         vzeroupper 
03337 e8a481b4ff                     call       0x7f4c1b9d7d60
0333c 0f1f840034340032               nop        dword ptr [rax + rax + 0x32003434]
03344 bef6ffffff                     mov        esi, 0xfffffff6
03349 666690                         nop        
0334c c5f877                         vzeroupper 
0334f e88c81b4ff                     call       0x7f4c1b9d7d60
03354 0f1f84004c340033               nop        dword ptr [rax + rax + 0x3300344c]
0335c 49ba84d4e81b4c7f0000           movabs     r10, 0x7f4c1be8d484
03366 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0336d e9ee32a8ff                     jmp        0x7f4c1b912ee0
03372 e8a9fea6ff                     call       0x7f4c1b8ffaa0
03377 e9c2ccffff                     jmp        0x7f4c1be8c8be
0337c f4                             hlt        
0337d f4                             hlt        
0337e f4                             hlt        
0337f f4                             hlt        
