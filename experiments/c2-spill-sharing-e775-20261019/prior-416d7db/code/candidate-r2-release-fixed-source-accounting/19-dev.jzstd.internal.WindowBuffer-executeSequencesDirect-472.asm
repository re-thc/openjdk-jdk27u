00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f8540dda7ff                   jne        0x7f4c1b90f960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecd0000000                 sub        rsp, 0xd0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85ef330000                   jne        0x7f4c1be9502d
0003e 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00043 894c240c                       mov        dword ptr [rsp + 0xc], ecx
00047 498bd8                         mov        rbx, r8
0004a 448bdf                         mov        r11d, edi
0004d 4c8bf6                         mov        r14, rsi
00050 448b463c                       mov        r8d, dword ptr [rsi + 0x3c]
00054 4489442464                     mov        dword ptr [rsp + 0x64], r8d
00059 448b5638                       mov        r10d, dword ptr [rsi + 0x38]
0005d 458bc2                         mov        r8d, r10d
00060 442b442464                     sub        r8d, dword ptr [rsp + 0x64]
00065 8b8c24e0000000                 mov        ecx, dword ptr [rsp + 0xe0]
0006c 413bc8                         cmp        ecx, r8d
0006f 0f8f432c0000                   jg         0x7f4c1be948b8
00075 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00079 4c89442428                     mov        qword ptr [rsp + 0x28], r8
0007e 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
00082 4c638c24e0000000               movsxd     r9, dword ptr [rsp + 0xe0]
0008a 48634c2464                     movsxd     rcx, dword ptr [rsp + 0x64]
0008f 48034c2428                     add        rcx, qword ptr [rsp + 0x28]
00094 4c2bc1                         sub        r8, rcx
00097 4d3bc8                         cmp        r9, r8
0009a 0f8f182c0000                   jg         0x7f4c1be948b8
000a0 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
000a4 4c89442440                     mov        qword ptr [rsp + 0x40], r8
000a9 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000ad 4d85c0                         test       r8, r8
000b0 0f840f130000                   je         0x7f4c1be92fc5
000b6 33ff                           xor        edi, edi
000b8 4c8bea                         mov        r13, rdx
000bb 8b7208                         mov        esi, dword ptr [rdx + 8]
000be 458b4e44                       mov        r9d, dword ptr [r14 + 0x44]
000c2 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
000ca 418beb                         mov        ebp, r11d
000cd 4585db                         test       r11d, r11d
000d0 0f8ec2240000                   jle        0x7f4c1be94198
000d6 4c2b442428                     sub        r8, qword ptr [rsp + 0x28]
000db 448d4ee0                       lea        r9d, [rsi - 0x20]
000df 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
000e7 418d4ae0                       lea        ecx, [r10 - 0x20]
000eb 4c8bdb                         mov        r11, rbx
000ee 458b5308                       mov        r10d, dword ptr [r11 + 8]
000f2 4585d2                         test       r10d, r10d
000f5 0f86d52b0000                   jbe        0x7f4c1be948d0
000fb 4d63d2                         movsxd     r10, r10d
000fe 4863dd                         movsxd     rbx, ebp
00101 48ffcb                         dec        rbx
00104 493bda                         cmp        rbx, r10
00107 0f83c32b0000                   jae        0x7f4c1be948d0
0010d 488b9424e8000000               mov        rdx, qword ptr [rsp + 0xe8]
00115 8b5a08                         mov        ebx, dword ptr [rdx + 8]
00118 85db                           test       ebx, ebx
0011a 0f86002c0000                   jbe        0x7f4c1be94920
00120 83fb01                         cmp        ebx, 1
00123 0f86f72b0000                   jbe        0x7f4c1be94920
00129 83fb02                         cmp        ebx, 2
0012c 0f86ee2b0000                   jbe        0x7f4c1be94920
00132 448d56f1                       lea        r10d, [rsi - 0xf]
00136 4585d2                         test       r10d, r10d
00139 0f8ce12b0000                   jl         0x7f4c1be94920
0013f 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00147 418b4208                       mov        eax, dword ptr [r10 + 8]
0014b 448d50f1                       lea        r10d, [rax - 0xf]
0014f 4585d2                         test       r10d, r10d
00152 0f8cc82b0000                   jl         0x7f4c1be94920
00158 448d50fd                       lea        r10d, [rax - 3]
0015c 4585d2                         test       r10d, r10d
0015f 0f8cbb2b0000                   jl         0x7f4c1be94920
00165 448d50f9                       lea        r10d, [rax - 7]
00169 4585d2                         test       r10d, r10d
0016c 0f8cae2b0000                   jl         0x7f4c1be94920
00172 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00176 899c24ec000000                 mov        dword ptr [rsp + 0xec], ebx
0017d 894c2448                       mov        dword ptr [rsp + 0x48], ecx
00181 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
00186 89b424e8000000                 mov        dword ptr [rsp + 0xe8], esi
0018d 897c2430                       mov        dword ptr [rsp + 0x30], edi
00191 4c89442438                     mov        qword ptr [rsp + 0x38], r8
00196 4889542450                     mov        qword ptr [rsp + 0x50], rdx
0019b 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
001a0 896c2418                       mov        dword ptr [rsp + 0x18], ebp
001a4 4c896c2468                     mov        qword ptr [rsp + 0x68], r13
001a9 4c89742478                     mov        qword ptr [rsp + 0x78], r14
001ae 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
001b6 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001bb 448bd0                         mov        r10d, eax
001be 448bde                         mov        r11d, esi
001c1 458d4afd                       lea        r9d, [r10 - 3]
001c5 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
001cd 4d63c3                         movsxd     r8, r11d
001d0 4183c3f1                       add        r11d, -0xf
001d4 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
001dc 4983c0f1                       add        r8, -0xf
001e0 4c89842490000000               mov        qword ptr [rsp + 0x90], r8
001e8 4d63da                         movsxd     r11, r10d
001eb 458d42f9                       lea        r8d, [r10 - 7]
001ef 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
001f7 4183c2f1                       add        r10d, -0xf
001fb 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00203 4d8d53f1                       lea        r10, [r11 - 0xf]
00207 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0020f 4983c3f9                       add        r11, -7
00213 4c899c24a8000000               mov        qword ptr [rsp + 0xa8], r11
0021b 4533c9                         xor        r9d, r9d
0021e 4533c0                         xor        r8d, r8d
00221 e975040000                     jmp        0x7f4c1be9229b
00226 448bdd                         mov        r11d, ebp
00229 4d63d3                         movsxd     r10, r11d
0022c 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00233 c442a8f5db                     bzhi       r11, r11, r10
00238 c4c1fb92fb                     kmovq      k7, r11
0023d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00243 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00249 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00251 4403dd                         add        r11d, ebp
00254 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
0025c 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00260 418502                         test       dword ptr [r10], eax
00263 443b5c245c                     cmp        r11d, dword ptr [rsp + 0x5c]
00268 0f8dc2070000                   jge        0x7f4c1be92630
0026e 4489b424b4000000               mov        dword ptr [rsp + 0xb4], r14d
00276 448b8424b4000000               mov        r8d, dword ptr [rsp + 0xb4]
0027e 442b8424b0000000               sub        r8d, dword ptr [rsp + 0xb0]
00286 8b6c245c                       mov        ebp, dword ptr [rsp + 0x5c]
0028a 2bac24b0000000                 sub        ebp, dword ptr [rsp + 0xb0]
00291 3bac24b0000000                 cmp        ebp, dword ptr [rsp + 0xb0]
00298 448bb424b0000000               mov        r14d, dword ptr [rsp + 0xb0]
002a0 410f4fee                       cmovg      ebp, r14d
002a4 458bd8                         mov        r11d, r8d
002a7 4585c0                         test       r8d, r8d
002aa 0f8c541d0000                   jl         0x7f4c1be93c04
002b0 448bb424b4000000               mov        r14d, dword ptr [rsp + 0xb4]
002b8 4585f6                         test       r14d, r14d
002bb 0f8c431d0000                   jl         0x7f4c1be93c04
002c1 458d1428                       lea        r10d, [r8 + rbp]
002c5 448b4c241c                     mov        r9d, dword ptr [rsp + 0x1c]
002ca 453bca                         cmp        r9d, r10d
002cd 0f82311d0000                   jb         0x7f4c1be93c04
002d3 4403f5                         add        r14d, ebp
002d6 453bce                         cmp        r9d, r14d
002d9 0f82251d0000                   jb         0x7f4c1be93c04
002df 85ed                           test       ebp, ebp
002e1 0f8c1d1d0000                   jl         0x7f4c1be93c04
002e7 85ed                           test       ebp, ebp
002e9 0f845affffff                   je         0x7f4c1be91e49
002ef 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
002f7 448b8c24b4000000               mov        r9d, dword ptr [rsp + 0xb4]
002ff 4b8d740a0c                     lea        rsi, [r10 + r9 + 0xc]
00304 4b8d7c1a0c                     lea        rdi, [r10 + r11 + 0xc]
00309 4863d5                         movsxd     rdx, ebp
0030c 4883fa20                       cmp        rdx, 0x20
00310 0f8610ffffff                   jbe        0x7f4c1be91e26
00316 c5f877                         vzeroupper 
00319 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00323 41ffd2                         call       r10
00326 0f1f840000000000               nop        dword ptr [rax + rax]
0032e e916ffffff                     jmp        0x7f4c1be91e49
00333 458beb                         mov        r13d, r11d
00336 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
0033e 4585db                         test       r11d, r11d
00341 0f8ed5130000                   jle        0x7f4c1be9331c
00347 458d1c01                       lea        r11d, [r9 + rax]
0034b 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00350 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00355 4403d3                         add        r10d, ebx
00358 443b542448                     cmp        r10d, dword ptr [rsp + 0x48]
0035d 0f8f81100000                   jg         0x7f4c1be92fe4
00363 443b5c2458                     cmp        r11d, dword ptr [rsp + 0x58]
00368 0f8f16150000                   jg         0x7f4c1be93484
0036e 83f810                         cmp        eax, 0x10
00371 0f8f6c070000                   jg         0x7f4c1be926e3
00377 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
0037f 0f83c8100000                   jae        0x7f4c1be9304d
00385 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0038a c4817a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 0xc]
00391 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00396 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
0039e 0f8350110000                   jae        0x7f4c1be930f4
003a4 468d1408                       lea        r10d, [rax + r9]
003a8 4489542460                     mov        dword ptr [rsp + 0x60], r10d
003ad 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
003b2 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
003ba c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
003c1 468d1c10                       lea        r11d, [rax + r10]
003c5 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
003ca 458bf3                         mov        r14d, r11d
003cd 442bb424b0000000               sub        r14d, dword ptr [rsp + 0xb0]
003d5 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
003d9 83fb10                         cmp        ebx, 0x10
003dc 7f56                           jg         0x7f4c1be92034
003de 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
003e5 83fb10                         cmp        ebx, 0x10
003e8 7c4a                           jl         0x7f4c1be92034
003ea 443bb4249c000000               cmp        r14d, dword ptr [rsp + 0x9c]
003f2 0f83b8110000                   jae        0x7f4c1be931b0
003f8 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00400 c4817a6f44330c                 vmovdqu    xmm0, xmmword ptr [r11 + r14 + 0xc]
00407 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
0040b 3b9c249c000000                 cmp        ebx, dword ptr [rsp + 0x9c]
00412 0f834c120000                   jae        0x7f4c1be93264
00418 448b6c2464                     mov        r13d, dword ptr [rsp + 0x64]
0041d c4817a7f442b0c                 vmovdqu    xmmword ptr [r11 + r13 + 0xc], xmm0
00424 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
00428 4103dd                         add        ebx, r13d
0042b 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0042f e94c020000                     jmp        0x7f4c1be92280
00434 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0043c 4b8d7c320c                     lea        rdi, [r10 + r14 + 0xc]
00441 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00445 498d741a0c                     lea        rsi, [r10 + rbx + 0xc]
0044a 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
0044e 035c2464                       add        ebx, dword ptr [rsp + 0x64]
00452 4c63c3                         movsxd     r8, ebx
00455 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
0045d 443b5c245c                     cmp        r11d, dword ptr [rsp + 0x5c]
00462 0f8c15040000                   jl         0x7f4c1be9247d
00468 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0046d 4183fa30                       cmp        r10d, 0x30
00471 0f8e8b000000                   jle        0x7f4c1be92102
00477 4585f6                         test       r14d, r14d
0047a 0f8cf0180000                   jl         0x7f4c1be93970
00480 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00485 4585db                         test       r11d, r11d
00488 0f8ce2180000                   jl         0x7f4c1be93970
0048e 4503d6                         add        r10d, r14d
00491 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
00496 453bda                         cmp        r11d, r10d
00499 0f82d1180000                   jb         0x7f4c1be93970
0049f 443bdb                         cmp        r11d, ebx
004a2 0f82c8180000                   jb         0x7f4c1be93970
004a8 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
004ac 85db                           test       ebx, ebx
004ae 0f84c0010000                   je         0x7f4c1be92274
004b4 4863d3                         movsxd     rdx, ebx
004b7 4883fa20                       cmp        rdx, 0x20
004bb 7728                           ja         0x7f4c1be920e5
004bd 448bdb                         mov        r11d, ebx
004c0 4d63d3                         movsxd     r10, r11d
004c3 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
004ca c442a8f5db                     bzhi       r11, r11, r10
004cf c4c1fb92fb                     kmovq      k7, r11
004d4 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
004da 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
004e0 e98f010000                     jmp        0x7f4c1be92274
004e5 c5f877                         vzeroupper 
004e8 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
004f2 41ffd2                         call       r10
004f5 0f1f840000000000               nop        dword ptr [rax + rax]
004fd e972010000                     jmp        0x7f4c1be92274
00502 443bb42498000000               cmp        r14d, dword ptr [rsp + 0x98]
0050a 0f831c140000                   jae        0x7f4c1be9352c
00510 4963d6                         movsxd     rdx, r14d
00513 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0051b 498b7c120c                     mov        rdi, qword ptr [r10 + rdx + 0xc]
00520 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00525 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
0052d 0f83b5140000                   jae        0x7f4c1be935e8
00533 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
00538 418d4908                       lea        ecx, [r9 + 8]
0053c 4d63d1                         movsxd     r10, r9d
0053f 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00547 4b897c130c                     mov        qword ptr [r11 + r10 + 0xc], rdi
0054c 3bcb                           cmp        ecx, ebx
0054e 0f8d20010000                   jge        0x7f4c1be92274
00554 492bd2                         sub        rdx, r10
00557 4c63d9                         movsxd     r11, ecx
0055a 4d8d1413                       lea        r10, [r11 + rdx]
0055e 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00566 0f8394160000                   jae        0x7f4c1be93800
0056c 4d8bd0                         mov        r10, r8
0056f 4d2bd3                         sub        r10, r11
00572 4983c207                       add        r10, 7
00576 4983e2f8                       and        r10, 0xfffffffffffffff8
0057a 458bda                         mov        r11d, r10d
0057d 478d540b08                     lea        r10d, [r11 + r9 + 8]
00582 4d63d2                         movsxd     r10, r10d
00585 4d8d5c12f8                     lea        r11, [r10 + rdx - 8]
0058a 4c3b9c24a8000000               cmp        r11, qword ptr [rsp + 0xa8]
00592 0f8368160000                   jae        0x7f4c1be93800
00598 3b8c2498000000                 cmp        ecx, dword ptr [rsp + 0x98]
0059f 0f835b160000                   jae        0x7f4c1be93800
005a5 4983c2f8                       add        r10, -8
005a9 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
005b1 0f8349160000                   jae        0x7f4c1be93800
005b7 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
005bd 0f8ff5160000                   jg         0x7f4c1be938b8
005c3 452bf1                         sub        r14d, r9d
005c6 4183c110                       add        r9d, 0x10
005ca 458d140e                       lea        r10d, [r14 + rcx]
005ce 8bbc2484000000                 mov        edi, dword ptr [rsp + 0x84]
005d5 4a8b7c170c                     mov        rdi, qword ptr [rdi + r10 + 0xc]
005da 448bd9                         mov        r11d, ecx
005dd 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
005e5 4b897c1a0c                     mov        qword ptr [r10 + r11 + 0xc], rdi
005ea 83c108                         add        ecx, 8
005ed 413bc9                         cmp        ecx, r9d
005f0 7cd8                           jl         0x7f4c1be921ca
005f2 4983c0f8                       add        r8, -8
005f6 4981f800000080                 cmp        r8, -0x80000000
005fd 49c7c200000080                 mov        r10, 0xffffffff80000000
00604 4d0f4cc2                       cmovl      r8, r10
00608 458bd0                         mov        r10d, r8d
0060b 413bca                         cmp        ecx, r10d
0060e 7d37                           jge        0x7f4c1be92247
00610 458d040e                       lea        r8d, [r14 + rcx]
00614 448bc9                         mov        r9d, ecx
00617 4963f9                         movsxd     rdi, r9d
0061a 458bd8                         mov        r11d, r8d
0061d 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
00625 4b8b54190c                     mov        rdx, qword ptr [r9 + r11 + 0xc]
0062a 4963f0                         movsxd     rsi, r8d
0062d 448bd9                         mov        r11d, ecx
00630 4b8954190c                     mov        qword ptr [r9 + r11 + 0xc], rdx
00635 4d8b5c3114                     mov        r11, qword ptr [r9 + rsi + 0x14]
0063a 4d895c3914                     mov        qword ptr [r9 + rdi + 0x14], r11
0063f 83c110                         add        ecx, 0x10
00642 413bca                         cmp        ecx, r10d
00645 7cc9                           jl         0x7f4c1be92210
00647 3bcb                           cmp        ecx, ebx
00649 7d29                           jge        0x7f4c1be92274
0064b 90                             nop        
0064c 458d1c0e                       lea        r11d, [r14 + rcx]
00650 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00658 4f8b44180c                     mov        r8, qword ptr [r8 + r11 + 0xc]
0065d 448bd1                         mov        r10d, ecx
00660 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00668 4f8944130c                     mov        qword ptr [r11 + r10 + 0xc], r8
0066d 83c108                         add        ecx, 8
00670 3bcb                           cmp        ecx, ebx
00672 7cd8                           jl         0x7f4c1be9224c
00674 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00678 035c245c                       add        ebx, dword ptr [rsp + 0x5c]
0067c 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00680 448b8424b8000000               mov        r8d, dword ptr [rsp + 0xb8]
00688 41ffc0                         inc        r8d
0068b 443b442418                     cmp        r8d, dword ptr [rsp + 0x18]
00690 0f8d8f050000                   jge        0x7f4c1be92825
00696 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0069b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
006a0 4f8b5cc210                     mov        r11, qword ptr [r10 + r8*8 + 0x10]
006a5 4d8bd3                         mov        r10, r11
006a8 49c1fa24                       sar        r10, 0x24
006ac 458bd2                         mov        r10d, r10d
006af 418bca                         mov        ecx, r10d
006b2 458bd3                         mov        r10d, r11d
006b5 49c1eb12                       shr        r11, 0x12
006b9 4181e2ffff0100                 and        r10d, 0x1ffff
006c0 418bc2                         mov        eax, r10d
006c3 418bdb                         mov        ebx, r11d
006c6 81e3ffff0300                   and        ebx, 0x3ffff
006cc 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
006d0 448bd1                         mov        r10d, ecx
006d3 4585d2                         test       r10d, r10d
006d6 0f8c60100000                   jl         0x7f4c1be9333c
006dc 448bd0                         mov        r10d, eax
006df 4585d2                         test       r10d, r10d
006e2 0f85ba000000                   jne        0x7f4c1be923a2
006e8 4533d2                         xor        r10d, r10d
006eb 418bc2                         mov        eax, r10d
006ee 448bd1                         mov        r10d, ecx
006f1 4183fa03                       cmp        r10d, 3
006f5 0f8ed9000000                   jle        0x7f4c1be923d4
006fb 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00700 458b5210                       mov        r10d, dword ptr [r10 + 0x10]
00704 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00709 45895314                       mov        dword ptr [r11 + 0x14], r10d
0070d 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
00711 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00716 45895a10                       mov        dword ptr [r10 + 0x10], r11d
0071a 448d51fd                       lea        r10d, [rcx - 3]
0071e 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
00726 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0072b 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
00732 41895a0c                       mov        dword ptr [r10 + 0xc], ebx
00736 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
0073e 48639c24b0000000               movsxd     rbx, dword ptr [rsp + 0xb0]
00746 488beb                         mov        rbp, rbx
00749 4c63542464                     movsxd     r10, dword ptr [rsp + 0x64]
0074e 4c03542428                     add        r10, qword ptr [rsp + 0x28]
00753 4863d0                         movsxd     rdx, eax
00756 4c03d2                         add        r10, rdx
00759 493bda                         cmp        rbx, r10
0075c 0f8f8a100000                   jg         0x7f4c1be933ec
00762 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00766 03d8                           add        ebx, eax
00768 448bf3                         mov        r14d, ebx
0076b 442bb424b0000000               sub        r14d, dword ptr [rsp + 0xb0]
00773 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00778 4585db                         test       r11d, r11d
0077b 0f85b2fbffff                   jne        0x7f4c1be91f33
00781 4d63de                         movsxd     r11, r14d
00784 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
00789 0f8c0d130000                   jl         0x7f4c1be9369c
0078f 483b6c2440                     cmp        rbp, qword ptr [rsp + 0x40]
00794 0f8fb2130000                   jg         0x7f4c1be9374c
0079a 4533ed                         xor        r13d, r13d
0079d e994fbffff                     jmp        0x7f4c1be91f36
007a2 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
007a7 452bd9                         sub        r11d, r9d
007aa 453bd3                         cmp        r10d, r11d
007ad 0f8e3bffffff                   jle        0x7f4c1be922ee
007b3 be45ffffff                     mov        esi, 0xffffff45
007b8 418bea                         mov        ebp, r10d
007bb 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
007c3 90                             nop        
007c4 c5f877                         vzeroupper 
007c7 e89459b4ff                     call       0x7f4c1b9d7d60
007cc 0f1f8400c4080001               nop        dword ptr [rax + rax + 0x10008c4]
007d4 85c0                           test       eax, eax
007d6 7407                           je         0x7f4c1be923df
007d8 448d51ff                       lea        r10d, [rcx - 1]
007dc 418bca                         mov        ecx, r10d
007df 85c9                           test       ecx, ecx
007e1 7516                           jne        0x7f4c1be923f9
007e3 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
007e8 418b5a0c                       mov        ebx, dword ptr [r10 + 0xc]
007ec 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
007f4 e978000000                     jmp        0x7f4c1be92471
007f9 83f903                         cmp        ecx, 3
007fc 0f84621e0000                   je         0x7f4c1be94264
00802 83f902                         cmp        ecx, 2
00805 0f87091f0000                   ja         0x7f4c1be94314
0080b 3b8c24ec000000                 cmp        ecx, dword ptr [rsp + 0xec]
00812 0f8332170000                   jae        0x7f4c1be93b4a
00818 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
0081d 418b5c8b0c                     mov        ebx, dword ptr [r11 + rcx*4 + 0xc]
00822 85c9                           test       ecx, ecx
00824 7e3a                           jle        0x7f4c1be92460
00826 448d59ff                       lea        r11d, [rcx - 1]
0082a 443b9c24ec000000               cmp        r11d, dword ptr [rsp + 0xec]
00832 0f837c1d0000                   jae        0x7f4c1be941b4
00838 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
00840 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00845 458b548b08                     mov        r10d, dword ptr [r11 + rcx*4 + 8]
0084a 4d8bc3                         mov        r8, r11
0084d 458954880c                     mov        dword ptr [r8 + rcx*4 + 0xc], r10d
00852 448d51ff                       lea        r10d, [rcx - 1]
00856 418bca                         mov        ecx, r10d
00859 4585d2                         test       r10d, r10d
0085c 7fe2                           jg         0x7f4c1be92440
0085e eb08                           jmp        0x7f4c1be92468
00860 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
00868 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0086d 41895a0c                       mov        dword ptr [r10 + 0xc], ebx
00871 899c24b0000000                 mov        dword ptr [rsp + 0xb0], ebx
00878 e9c1feffff                     jmp        0x7f4c1be9233e
0087d 4183fb10                       cmp        r11d, 0x10
00881 0f8dc0080000                   jge        0x7f4c1be92d47
00887 4183fb08                       cmp        r11d, 8
0088b 0f8d52040000                   jge        0x7f4c1be928e3
00891 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00896 4183fb10                       cmp        r11d, 0x10
0089a 0f8f99010000                   jg         0x7f4c1be92639
008a0 443b74241c                     cmp        r14d, dword ptr [rsp + 0x1c]
008a5 0f8315180000                   jae        0x7f4c1be93cc0
008ab 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
008b3 430fbe6c330c                   movsx      ebp, byte ptr [r11 + r14 + 0xc]
008b9 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
008be 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
008c3 0f83b3180000                   jae        0x7f4c1be93d7c
008c9 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
008d1 43886c1a0c                     mov        byte ptr [r10 + r11 + 0xc], bpl
008d6 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
008db 41ffc1                         inc        r9d
008de 458d5603                       lea        r10d, [r14 + 3]
008e2 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
008e7 0f832b190000                   jae        0x7f4c1be93e18
008ed 4d63de                         movsxd     r11, r14d
008f0 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
008f8 430fbe6c1a0d                   movsx      ebp, byte ptr [r10 + r11 + 0xd]
008fe 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00903 4183c203                       add        r10d, 3
00907 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
0090c 0f83b2190000                   jae        0x7f4c1be93ec4
00912 4c634c2464                     movsxd     r9, dword ptr [rsp + 0x64]
00917 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0091f 43886c0a0d                     mov        byte ptr [r10 + r9 + 0xd], bpl
00924 470fbe541a0e                   movsx      r10d, byte ptr [r10 + r11 + 0xe]
0092a 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00932 478854080e                     mov        byte ptr [r8 + r9 + 0xe], r10b
00937 470fbe54180f                   movsx      r10d, byte ptr [r8 + r11 + 0xf]
0093d 478854080f                     mov        byte ptr [r8 + r9 + 0xf], r10b
00942 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
0094a 4183fb08                       cmp        r11d, 8
0094e 0f83181a0000                   jae        0x7f4c1be93f6c
00954 49bbe0df2fe300000000           movabs     r11, 0xe32fdfe0
0095e 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00966 470374930c                     add        r14d, dword ptr [r11 + r10*4 + 0xc]
0096b 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00970 4183fb04                       cmp        r11d, 4
00974 7e42                           jle        0x7f4c1be925b8
00976 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0097b 4183c004                       add        r8d, 4
0097f 443bb42488000000               cmp        r14d, dword ptr [rsp + 0x88]
00987 0f838b1a0000                   jae        0x7f4c1be94018
0098d 418bce                         mov        ecx, r14d
00990 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00998 418b6c0a0c                     mov        ebp, dword ptr [r10 + rcx + 0xc]
0099d 443b842488000000               cmp        r8d, dword ptr [rsp + 0x88]
009a5 0f83311b0000                   jae        0x7f4c1be940dc
009ab 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
009b0 4d63db                         movsxd     r11, r11d
009b3 43896c1a10                     mov        dword ptr [r10 + r11 + 0x10], ebp
009b8 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
009bd 4183fa08                       cmp        r10d, 8
009c1 7e6d                           jle        0x7f4c1be92630
009c3 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
009c8 4183c208                       add        r10d, 8
009cc 458bca                         mov        r9d, r10d
009cf 49ba10e02fe300000000           movabs     r10, 0xe32fe010
009d9 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
009e1 478b5c9a0c                     mov        r11d, dword ptr [r10 + r11*4 + 0xc]
009e6 452bf3                         sub        r14d, r11d
009e9 418d6e08                       lea        ebp, [r14 + 8]
009ed 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
009f4 0f83ca1d0000                   jae        0x7f4c1be943c4
009fa 4d63d6                         movsxd     r10, r14d
009fd 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00a05 4b8b6c1314                     mov        rbp, qword ptr [r11 + r10 + 0x14]
00a0a 458bd1                         mov        r10d, r9d
00a0d 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00a15 0f83591e0000                   jae        0x7f4c1be94474
00a1b 448b6c2464                     mov        r13d, dword ptr [rsp + 0x64]
00a20 4d63dd                         movsxd     r11, r13d
00a23 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00a2b 4b896c1a14                     mov        qword ptr [r10 + r11 + 0x14], rbp
00a30 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00a34 e947fcffff                     jmp        0x7f4c1be92280
00a39 4585f6                         test       r14d, r14d
00a3c 0f8ce21e0000                   jl         0x7f4c1be94524
00a42 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00a47 4585d2                         test       r10d, r10d
00a4a 0f8cd41e0000                   jl         0x7f4c1be94524
00a50 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
00a55 443b5c2464                     cmp        r11d, dword ptr [rsp + 0x64]
00a5a 0f82c41e0000                   jb         0x7f4c1be94524
00a60 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00a68 4403542464                     add        r10d, dword ptr [rsp + 0x64]
00a6d 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00a75 453bda                         cmp        r11d, r10d
00a78 0f82a61e0000                   jb         0x7f4c1be94524
00a7e 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00a86 4585d2                         test       r10d, r10d
00a89 0f8c951e0000                   jl         0x7f4c1be94524
00a8f 4585d2                         test       r10d, r10d
00a92 0f84def7ffff                   je         0x7f4c1be91e76
00a98 4883fd20                       cmp        rbp, 0x20
00a9c 7725                           ja         0x7f4c1be926c3
00a9e 4d63d2                         movsxd     r10, r10d
00aa1 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00aa8 c442a8f5db                     bzhi       r11, r11, r10
00aad c4c1fb92fb                     kmovq      k7, r11
00ab2 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ab8 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00abe e9b3f7ffff                     jmp        0x7f4c1be91e76
00ac3 488bd5                         mov        rdx, rbp
00ac6 c5f877                         vzeroupper 
00ac9 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00ad3 41ffd2                         call       r10
00ad6 0f1f840000000000               nop        dword ptr [rax + rax]
00ade e993f7ffff                     jmp        0x7f4c1be91e76
00ae3 83f830                         cmp        eax, 0x30
00ae6 0f8fd8050000                   jg         0x7f4c1be92cc4
00aec 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
00af4 0f83e61e0000                   jae        0x7f4c1be945e0
00afa 4963c9                         movsxd     rcx, r9d
00afd 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00b02 c4c17a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0xc]
00b09 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b0e 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
00b16 0f83741f0000                   jae        0x7f4c1be94690
00b1c 418bd2                         mov        edx, r10d
00b1f 4183c210                       add        r10d, 0x10
00b23 418bfa                         mov        edi, r10d
00b26 4c63d2                         movsxd     r10, edx
00b29 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00b31 c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
00b38 448bdf                         mov        r11d, edi
00b3b 443bdb                         cmp        r11d, ebx
00b3e 0f8daa000000                   jge        0x7f4c1be927ee
00b44 492bca                         sub        rcx, r10
00b47 4d63c3                         movsxd     r8, r11d
00b4a 4d8d1408                       lea        r10, [r8 + rcx]
00b4e 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
00b56 0f830c200000                   jae        0x7f4c1be94768
00b5c 4c63d3                         movsxd     r10, ebx
00b5f 4d2bd0                         sub        r10, r8
00b62 4983c20f                       add        r10, 0xf
00b66 4983e2f0                       and        r10, 0xfffffffffffffff0
00b6a 458bd2                         mov        r10d, r10d
00b6d 458d441210                     lea        r8d, [r10 + rdx + 0x10]
00b72 4d63d0                         movsxd     r10, r8d
00b75 4d8d440af0                     lea        r8, [r10 + rcx - 0x10]
00b7a 4c3b842490000000               cmp        r8, qword ptr [rsp + 0x90]
00b82 0f83e01f0000                   jae        0x7f4c1be94768
00b88 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
00b90 0f83d21f0000                   jae        0x7f4c1be94768
00b96 4983c2f0                       add        r10, -0x10
00b9a 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
00ba2 0f83c01f0000                   jae        0x7f4c1be94768
00ba8 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00bae 0f8f5c200000                   jg         0x7f4c1be94810
00bb4 458bd1                         mov        r10d, r9d
00bb7 442bd2                         sub        r10d, edx
00bba 660f1f440000                   nop        word ptr [rax + rax]
00bc0 458d1c3a                       lea        r11d, [r10 + rdi]
00bc4 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
00bc9 c4817a6f44180c                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 0xc]
00bd0 448bdf                         mov        r11d, edi
00bd3 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00bdb c4817a7f44180c                 vmovdqu    xmmword ptr [r8 + r11 + 0xc], xmm0
00be2 448d5f10                       lea        r11d, [rdi + 0x10]
00be6 418bfb                         mov        edi, r11d
00be9 443bdb                         cmp        r11d, ebx
00bec 7cd2                           jl         0x7f4c1be927c0
00bee 468d1408                       lea        r10d, [rax + r9]
00bf2 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00bf7 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00bfb e9d5f7ffff                     jmp        0x7f4c1be91fd5
00c00 4d63d2                         movsxd     r10, r10d
00c03 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c0a c442a8f5db                     bzhi       r11, r11, r10
00c0f c4c1fb92fb                     kmovq      k7, r11
00c14 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c1a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c20 e9a4000000                     jmp        0x7f4c1be928c9
00c25 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00c2a 458bd3                         mov        r10d, r11d
00c2d 442b542460                     sub        r10d, dword ptr [rsp + 0x60]
00c32 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00c3a 4585c0                         test       r8d, r8d
00c3d 0f843d210000                   je         0x7f4c1be94980
00c43 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00c48 4585db                         test       r11d, r11d
00c4b 0f8caf210000                   jl         0x7f4c1be94a00
00c51 4c8b742478                     mov        r14, qword ptr [rsp + 0x78]
00c56 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
00c5b 8bb424e8000000                 mov        esi, dword ptr [rsp + 0xe8]
00c62 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
00c66 85c9                           test       ecx, ecx
00c68 0f8c46210000                   jl         0x7f4c1be949b4
00c6e 3b74240c                       cmp        esi, dword ptr [rsp + 0xc]
00c72 0f8242210000                   jb         0x7f4c1be949ba
00c78 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
00c7c 4103ea                         add        ebp, r10d
00c7f 458b4808                       mov        r9d, dword ptr [r8 + 8]
00c83 443bcd                         cmp        r9d, ebp
00c86 0f8234210000                   jb         0x7f4c1be949c0
00c8c 4585d2                         test       r10d, r10d
00c8f 0f8c31210000                   jl         0x7f4c1be949c6
00c95 4585d2                         test       r10d, r10d
00c98 742f                           je         0x7f4c1be928c9
00c9a 498d74080c                     lea        rsi, [r8 + rcx + 0xc]
00c9f 4b8d7c1d0c                     lea        rdi, [r13 + r11 + 0xc]
00ca4 4963d2                         movsxd     rdx, r10d
00ca7 4883fa20                       cmp        rdx, 0x20
00cab 0f864fffffff                   jbe        0x7f4c1be92800
00cb1 c5f877                         vzeroupper 
00cb4 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00cbe 41ffd2                         call       r10
00cc1 0f1f840000000000               nop        dword ptr [rax + rax]
00cc9 41896e3c                       mov        dword ptr [r14 + 0x3c], ebp
00ccd c5f877                         vzeroupper 
00cd0 4881c4d0000000                 add        rsp, 0xd0
00cd7 5d                             pop        rbp
00cd8 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00cdc 0f8735270000                   ja         0x7f4c1be95017
00ce2 c3                             ret        
00ce3 443bb42498000000               cmp        r14d, dword ptr [rsp + 0x98]
00ceb 0f831f210000                   jae        0x7f4c1be94a10
00cf1 458bd6                         mov        r10d, r14d
00cf4 418bc2                         mov        eax, r10d
00cf7 4963fa                         movsxd     rdi, r10d
00cfa 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00d02 498b4c3a0c                     mov        rcx, qword ptr [r10 + rdi + 0xc]
00d07 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00d0c 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00d14 0f83a2210000                   jae        0x7f4c1be94abc
00d1a 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
00d1f 458d5108                       lea        r10d, [r9 + 8]
00d23 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00d28 4963d1                         movsxd     rdx, r9d
00d2b 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00d33 49894c130c                     mov        qword ptr [r11 + rdx + 0xc], rcx
00d38 443bd3                         cmp        r10d, ebx
00d3b 0f8d55030000                   jge        0x7f4c1be92c96
00d41 482bfa                         sub        rdi, rdx
00d44 4963d2                         movsxd     rdx, r10d
00d47 4c8d1c3a                       lea        r11, [rdx + rdi]
00d4b 4c3b9c24a8000000               cmp        r11, qword ptr [rsp + 0xa8]
00d53 0f831f220000                   jae        0x7f4c1be94b78
00d59 4d8bd8                         mov        r11, r8
00d5c 4c2bda                         sub        r11, rdx
00d5f 4983c307                       add        r11, 7
00d63 4983e3f8                       and        r11, 0xfffffffffffffff8
00d67 458bdb                         mov        r11d, r11d
00d6a 438d4c0b08                     lea        ecx, [r11 + r9 + 8]
00d6f 4c63d9                         movsxd     r11, ecx
00d72 498d4c3bf8                     lea        rcx, [r11 + rdi - 8]
00d77 483b8c24a8000000               cmp        rcx, qword ptr [rsp + 0xa8]
00d7f 0f83f3210000                   jae        0x7f4c1be94b78
00d85 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00d8d 0f83e5210000                   jae        0x7f4c1be94b78
00d93 4983c3f8                       add        r11, -8
00d97 4c3b9c24a8000000               cmp        r11, qword ptr [rsp + 0xa8]
00d9f 0f83d3210000                   jae        0x7f4c1be94b78
00da5 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
00dab 0f8f63220000                   jg         0x7f4c1be94c14
00db1 448bd0                         mov        r10d, eax
00db4 452bd1                         sub        r10d, r9d
00db7 458bea                         mov        r13d, r10d
00dba 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00dc2 458bd3                         mov        r10d, r11d
00dc5 41bbf4ffffff                   mov        r11d, 0xfffffff4
00dcb 452bda                         sub        r11d, r10d
00dce 452bd9                         sub        r11d, r9d
00dd1 4183c110                       add        r9d, 0x10
00dd5 4183c3f0                       add        r11d, -0x10
00dd9 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00dde 498d48c8                       lea        rcx, [r8 - 0x38]
00de2 4881f900000080                 cmp        rcx, -0x80000000
00de9 48c7c700000080                 mov        rdi, 0xffffffff80000000
00df0 480f4ccf                       cmovl      rcx, rdi
00df4 8bc9                           mov        ecx, ecx
00df6 442b742464                     sub        r14d, dword ptr [rsp + 0x64]
00dfb 4963c1                         movsxd     rax, r9d
00dfe be06000000                     mov        esi, 6
00e03 c442c8f5db                     bzhi       r11, r11, rsi
00e08 4903c3                         add        rax, r11
00e0b 493bc0                         cmp        rax, r8
00e0e 498bf8                         mov        rdi, r8
00e11 480f4cf8                       cmovl      rdi, rax
00e15 4c8bdf                         mov        r11, rdi
00e18 4c2bda                         sub        r11, rdx
00e1b 498d73ff                       lea        rsi, [r11 - 1]
00e1f 48c1fe3f                       sar        rsi, 0x3f
00e23 48c1ee3d                       shr        rsi, 0x3d
00e27 4e8d5c1eff                     lea        r11, [rsi + r11 - 1]
00e2c 4983e3f8                       and        r11, 0xfffffffffffffff8
00e30 4c03da                         add        r11, rdx
00e33 493bd3                         cmp        rdx, r11
00e36 490f4cd3                       cmovl      rdx, r11
00e3a 8bd2                           mov        edx, edx
00e3c 458d5c1608                     lea        r11d, [r14 + rdx + 8]
00e41 83c208                         add        edx, 8
00e44 4963f3                         movsxd     rsi, r11d
00e47 4903f2                         add        rsi, r10
00e4a 4863d2                         movsxd     rdx, edx
00e4d 4903d2                         add        rdx, r10
00e50 4c8d5e0c                       lea        r11, [rsi + 0xc]
00e54 4883c64c                       add        rsi, 0x4c
00e58 488d424c                       lea        rax, [rdx + 0x4c]
00e5c 4533d2                         xor        r10d, r10d
00e5f 493bc3                         cmp        rax, r11
00e62 410f96c2                       setbe      r10b
00e66 4883c20c                       add        rdx, 0xc
00e6a 4533db                         xor        r11d, r11d
00e6d 483bf2                         cmp        rsi, rdx
00e70 410f96c3                       setbe      r11b
00e74 450bd3                         or         r10d, r11d
00e77 0f84a70f0000                   je         0x7f4c1be93a24
00e7d 8bd7                           mov        edx, edi
00e7f 90                             nop        
00e80 458bd5                         mov        r10d, r13d
00e83 440354244c                     add        r10d, dword ptr [rsp + 0x4c]
00e88 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
00e90 4f8b4c110c                     mov        r9, qword ptr [r9 + r10 + 0xc]
00e95 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00e9a 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00ea2 4f894c130c                     mov        qword ptr [r11 + r10 + 0xc], r9
00ea7 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00eac 4183c208                       add        r10d, 8
00eb0 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00eb5 458bda                         mov        r11d, r10d
00eb8 443bd2                         cmp        r10d, edx
00ebb 7cc3                           jl         0x7f4c1be92a80
00ebd 4981c008feffff                 add        r8, -0x1f8
00ec4 4981f800000080                 cmp        r8, -0x80000000
00ecb 49c7c200000080                 mov        r10, 0xffffffff80000000
00ed2 4d0f4cc2                       cmovl      r8, r10
00ed6 458bd0                         mov        r10d, r8d
00ed9 453bda                         cmp        r11d, r10d
00edc 0f8d78010000                   jge        0x7f4c1be92c5a
00ee2 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00ee7 660f1f840000000000             nop        word ptr [rax + rax]
00ef0 458bc5                         mov        r8d, r13d
00ef3 440344244c                     add        r8d, dword ptr [rsp + 0x4c]
00ef8 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00efd 4d63cb                         movsxd     r9, r11d
00f00 458bd8                         mov        r11d, r8d
00f03 8bbc2484000000                 mov        edi, dword ptr [rsp + 0x84]
00f0a 62b17e486f841f0c000000         vmovdqu32  zmm0, zmmword ptr [rdi + r11 + 0xc]
00f15 4963d0                         movsxd     rdx, r8d
00f18 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00f1d 4183c340                       add        r11d, 0x40
00f21 4503dd                         add        r11d, r13d
00f24 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
00f28 0580000000                     add        eax, 0x80
00f2d 4103c5                         add        eax, r13d
00f30 8b7c244c                       mov        edi, dword ptr [rsp + 0x4c]
00f34 81c700010000                   add        edi, 0x100
00f3a 4103fd                         add        edi, r13d
00f3d 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00f42 8bb42484000000                 mov        esi, dword ptr [rsp + 0x84]
00f49 62b17e487f84060c000000         vmovdqu32  zmmword ptr [rsi + r8 + 0xc], zmm0
00f54 62b17e486f841e0c000000         vmovdqu32  zmm0, zmmword ptr [rsi + r11 + 0xc]
00f5f 62b17e487f840e4c000000         vmovdqu32  zmmword ptr [rsi + r9 + 0x4c], zmm0
00f6a 62f17e486f84060c000000         vmovdqu32  zmm0, zmmword ptr [rsi + rax + 0xc]
00f75 62b17e487f840e8c000000         vmovdqu32  zmmword ptr [rsi + r9 + 0x8c], zmm0
00f80 62f17e486f8416cc000000         vmovdqu32  zmm0, zmmword ptr [rsi + rdx + 0xcc]
00f8b 62b17e487f840ecc000000         vmovdqu32  zmmword ptr [rsi + r9 + 0xcc], zmm0
00f96 448bdf                         mov        r11d, edi
00f99 62b17e486f841e0c000000         vmovdqu32  zmm0, zmmword ptr [rsi + r11 + 0xc]
00fa4 62b17e487f840e0c010000         vmovdqu32  zmmword ptr [rsi + r9 + 0x10c], zmm0
00faf 62f17e486f84164c010000         vmovdqu32  zmm0, zmmword ptr [rsi + rdx + 0x14c]
00fba 62b17e487f840e4c010000         vmovdqu32  zmmword ptr [rsi + r9 + 0x14c], zmm0
00fc5 62f17e486f84168c010000         vmovdqu32  zmm0, zmmword ptr [rsi + rdx + 0x18c]
00fd0 62b17e487f840e8c010000         vmovdqu32  zmmword ptr [rsi + r9 + 0x18c], zmm0
00fdb 4c63df                         movsxd     r11, edi
00fde 62b17e486f841ecc000000         vmovdqu32  zmm0, zmmword ptr [rsi + r11 + 0xcc]
00fe9 62b17e487f840ecc010000         vmovdqu32  zmmword ptr [rsi + r9 + 0x1cc], zmm0
00ff4 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00ff9 4181c300020000                 add        r11d, 0x200
01000 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01005 453bda                         cmp        r11d, r10d
01008 0f8ce2feffff                   jl         0x7f4c1be92af0
0100e 443bd9                         cmp        r11d, ecx
01011 7d47                           jge        0x7f4c1be92c5a
01013 458bd3                         mov        r10d, r11d
01016 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0101b 90                             nop        
0101c 458bd5                         mov        r10d, r13d
0101f 440354244c                     add        r10d, dword ptr [rsp + 0x4c]
01024 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
0102c 62917e486f84100c000000         vmovdqu32  zmm0, zmmword ptr [r8 + r10 + 0xc]
01037 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0103c 62917e487f84100c000000         vmovdqu32  zmmword ptr [r8 + r10 + 0xc], zmm0
01047 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0104c 4183c240                       add        r10d, 0x40
01050 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01055 443bd1                         cmp        r10d, ecx
01058 7cc2                           jl         0x7f4c1be92c1c
0105a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0105f 443bd3                         cmp        r10d, ebx
01062 7d32                           jge        0x7f4c1be92c96
01064 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
01069 666690                         nop        
0106c 478d1429                       lea        r10d, [r9 + r13]
01070 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
01078 4f8b44100c                     mov        r8, qword ptr [r8 + r10 + 0xc]
0107d 458bd1                         mov        r10d, r9d
01080 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01088 4f8944130c                     mov        qword ptr [r11 + r10 + 0xc], r8
0108d 4183c108                       add        r9d, 8
01091 443bcb                         cmp        r9d, ebx
01094 7cd6                           jl         0x7f4c1be92c6c
01096 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0109a e9e1f5ffff                     jmp        0x7f4c1be92280
0109f 448bd0                         mov        r10d, eax
010a2 4d63d2                         movsxd     r10, r10d
010a5 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
010ac c442a8f5db                     bzhi       r11, r11, r10
010b1 c4c1fb92fb                     kmovq      k7, r11
010b6 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
010bc 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
010c2 eb7a                           jmp        0x7f4c1be92d3e
010c4 4585c9                         test       r9d, r9d
010c7 0f8ce31f0000                   jl         0x7f4c1be94cb0
010cd 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
010d2 4585d2                         test       r10d, r10d
010d5 0f8cd51f0000                   jl         0x7f4c1be94cb0
010db 448b9c24e8000000               mov        r11d, dword ptr [rsp + 0xe8]
010e3 443b5c2460                     cmp        r11d, dword ptr [rsp + 0x60]
010e8 0f82c21f0000                   jb         0x7f4c1be94cb0
010ee 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
010f3 443bd3                         cmp        r10d, ebx
010f6 0f82b41f0000                   jb         0x7f4c1be94cb0
010fc 85c0                           test       eax, eax
010fe 743e                           je         0x7f4c1be92d3e
01100 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01105 4b8d7c0a0c                     lea        rdi, [r10 + r9 + 0xc]
0110a 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
01112 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01117 4b8d74100c                     lea        rsi, [r8 + r10 + 0xc]
0111c 4883fa20                       cmp        rdx, 0x20
01120 0f8679ffffff                   jbe        0x7f4c1be92c9f
01126 c5f877                         vzeroupper 
01129 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
01133 41ffd2                         call       r10
01136 0f1f840000000000               nop        dword ptr [rax + rax]
0113e 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01142 e98ef2ffff                     jmp        0x7f4c1be91fd5
01147 443bb4249c000000               cmp        r14d, dword ptr [rsp + 0x9c]
0114f 0f83ff1f0000                   jae        0x7f4c1be94d54
01155 4d63ce                         movsxd     r9, r14d
01158 c4817a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 0xc]
0115f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01164 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
0116c 0f838e200000                   jae        0x7f4c1be94e00
01172 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01177 418bcb                         mov        ecx, r11d
0117a 418d6b10                       lea        ebp, [r11 + 0x10]
0117e 4d63d3                         movsxd     r10, r11d
01181 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01189 c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
01190 3beb                           cmp        ebp, ebx
01192 0f8d24020000                   jge        0x7f4c1be92fbc
01198 4d2bca                         sub        r9, r10
0119b 4c63dd                         movsxd     r11, ebp
0119e 4f8d140b                       lea        r10, [r11 + r9]
011a2 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
011aa 0f8318210000                   jae        0x7f4c1be94ec8
011b0 4d8bd0                         mov        r10, r8
011b3 4d2bd3                         sub        r10, r11
011b6 4983c20f                       add        r10, 0xf
011ba 4983e2f0                       and        r10, 0xfffffffffffffff0
011be 458bd2                         mov        r10d, r10d
011c1 448bd9                         mov        r11d, ecx
011c4 478d541a10                     lea        r10d, [r10 + r11 + 0x10]
011c9 4d63d2                         movsxd     r10, r10d
011cc 4f8d5c0af0                     lea        r11, [r10 + r9 - 0x10]
011d1 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
011d9 0f83e9200000                   jae        0x7f4c1be94ec8
011df 3bac249c000000                 cmp        ebp, dword ptr [rsp + 0x9c]
011e6 0f83dc200000                   jae        0x7f4c1be94ec8
011ec 4983c2f0                       add        r10, -0x10
011f0 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
011f8 0f83ca200000                   jae        0x7f4c1be94ec8
011fe 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
01204 0f8f4a210000                   jg         0x7f4c1be94f54
0120a 442bf1                         sub        r14d, ecx
0120d 448d5120                       lea        r10d, [rcx + 0x20]
01211 666690                         nop        
01214 458d1c2e                       lea        r11d, [r14 + rbp]
01218 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
01220 c4817a6f44190c                 vmovdqu    xmm0, xmmword ptr [r9 + r11 + 0xc]
01227 448bdd                         mov        r11d, ebp
0122a c4817a7f44190c                 vmovdqu    xmmword ptr [r9 + r11 + 0xc], xmm0
01231 83c510                         add        ebp, 0x10
01234 413bea                         cmp        ebp, r10d
01237 7cdb                           jl         0x7f4c1be92e14
01239 4981c010ffffff                 add        r8, -0xf0
01240 4981f800000080                 cmp        r8, -0x80000000
01247 49c7c200000080                 mov        r10, 0xffffffff80000000
0124e 4d0f4cc2                       cmovl      r8, r10
01252 458bc8                         mov        r9d, r8d
01255 413be9                         cmp        ebp, r9d
01258 0f8d34010000                   jge        0x7f4c1be92f92
0125e 6690                           nop        
01260 458d142e                       lea        r10d, [r14 + rbp]
01264 448bdd                         mov        r11d, ebp
01267 4963cb                         movsxd     rcx, r11d
0126a 458bc2                         mov        r8d, r10d
0126d 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01275 c4817a6f44030c                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0xc]
0127c 4d63c2                         movsxd     r8, r10d
0127f 448bdd                         mov        r11d, ebp
01282 8bbc2484000000                 mov        edi, dword ptr [rsp + 0x84]
01289 c4a17a7f441f0c                 vmovdqu    xmmword ptr [rdi + r11 + 0xc], xmm0
01290 c4a17a6f44071c                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x1c]
01297 c5fa7f440f1c                   vmovdqu    xmmword ptr [rdi + rcx + 0x1c], xmm0
0129d c4a17a6f44072c                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x2c]
012a4 c5fa7f440f2c                   vmovdqu    xmmword ptr [rdi + rcx + 0x2c], xmm0
012aa c4a17a6f44073c                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x3c]
012b1 c5fa7f440f3c                   vmovdqu    xmmword ptr [rdi + rcx + 0x3c], xmm0
012b7 c4a17a6f44074c                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x4c]
012be c5fa7f440f4c                   vmovdqu    xmmword ptr [rdi + rcx + 0x4c], xmm0
012c4 c4a17a6f44075c                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x5c]
012cb c5fa7f440f5c                   vmovdqu    xmmword ptr [rdi + rcx + 0x5c], xmm0
012d1 c4a17a6f44076c                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x6c]
012d8 c5fa7f440f6c                   vmovdqu    xmmword ptr [rdi + rcx + 0x6c], xmm0
012de c4a17a6f44077c                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x7c]
012e5 c5fa7f440f7c                   vmovdqu    xmmword ptr [rdi + rcx + 0x7c], xmm0
012eb c4a17a6f84078c000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x8c]
012f5 c5fa7f840f8c000000             vmovdqu    xmmword ptr [rdi + rcx + 0x8c], xmm0
012fe c4a17a6f84079c000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x9c]
01308 c5fa7f840f9c000000             vmovdqu    xmmword ptr [rdi + rcx + 0x9c], xmm0
01311 c4a17a6f8407ac000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0xac]
0131b c5fa7f840fac000000             vmovdqu    xmmword ptr [rdi + rcx + 0xac], xmm0
01324 c4a17a6f8407bc000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0xbc]
0132e c5fa7f840fbc000000             vmovdqu    xmmword ptr [rdi + rcx + 0xbc], xmm0
01337 c4a17a6f8407cc000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0xcc]
01341 c5fa7f840fcc000000             vmovdqu    xmmword ptr [rdi + rcx + 0xcc], xmm0
0134a c4a17a6f8407dc000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0xdc]
01354 c5fa7f840fdc000000             vmovdqu    xmmword ptr [rdi + rcx + 0xdc], xmm0
0135d c4a17a6f8407ec000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0xec]
01367 c5fa7f840fec000000             vmovdqu    xmmword ptr [rdi + rcx + 0xec], xmm0
01370 c4a17a6f8407fc000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0xfc]
0137a c5fa7f840ffc000000             vmovdqu    xmmword ptr [rdi + rcx + 0xfc], xmm0
01383 81c500010000                   add        ebp, 0x100
01389 413be9                         cmp        ebp, r9d
0138c 0f8ccefeffff                   jl         0x7f4c1be92e60
01392 3beb                           cmp        ebp, ebx
01394 7d26                           jge        0x7f4c1be92fbc
01396 6690                           nop        
01398 458d1c2e                       lea        r11d, [r14 + rbp]
0139c 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
013a4 c4817a6f44180c                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 0xc]
013ab 448bd5                         mov        r10d, ebp
013ae c4817a7f44100c                 vmovdqu    xmmword ptr [r8 + r10 + 0xc], xmm0
013b5 83c510                         add        ebp, 0x10
013b8 3beb                           cmp        ebp, ebx
013ba 7cdc                           jl         0x7f4c1be92f98
013bc 895c2464                       mov        dword ptr [rsp + 0x64], ebx
013c0 e9bbf2ffff                     jmp        0x7f4c1be92280
013c5 4903c9                         add        rcx, r9
013c8 483b4c2440                     cmp        rcx, qword ptr [rsp + 0x40]
013cd 7e08                           jle        0x7f4c1be92fd7
013cf 4533c0                         xor        r8d, r8d
013d2 e9dfecffff                     jmp        0x7f4c1be91cb6
013d7 4533c0                         xor        r8d, r8d
013da bf01000000                     mov        edi, 1
013df e9d4ecffff                     jmp        0x7f4c1be91cb8
013e4 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
013ec 418be9                         mov        ebp, r9d
013ef 4489ac24e0000000               mov        dword ptr [rsp + 0xe0], r13d
013f7 898424e4000000                 mov        dword ptr [rsp + 0xe4], eax
013fe 498bf2                         mov        rsi, r10
01401 8b542464                       mov        edx, dword ptr [rsp + 0x64]
01405 8b8c2480000000                 mov        ecx, dword ptr [rsp + 0x80]
0140c 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
01411 8bf8                           mov        edi, eax
01413 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
0141b 44891c24                       mov        dword ptr [rsp], r11d
0141f 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01424 44895c2408                     mov        dword ptr [rsp + 8], r11d
01429 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
01431 666690                         nop        
01434 c5f877                         vzeroupper 
01437 e824d8a7ff                     call       0x7f4c1b910860
0143c 0f1f840034150002               nop        dword ptr [rax + rax + 0x2001534]
01444 89442464                       mov        dword ptr [rsp + 0x64], eax
01448 e933f2ffff                     jmp        0x7f4c1be92280
0144d bee4ffffff                     mov        esi, 0xffffffe4
01452 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01457 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0145c 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01464 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01469 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01471 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01476 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
0147e 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01483 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01488 48894424f8                     mov        qword ptr [rsp - 8], rax
0148d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01491 89442418                       mov        dword ptr [rsp + 0x18], eax
01495 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0149a 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0149f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
014a4 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
014a9 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
014ae 4c89542430                     mov        qword ptr [rsp + 0x30], r10
014b3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
014b8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
014bd 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
014c2 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
014c7 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
014cc 4489542440                     mov        dword ptr [rsp + 0x40], r10d
014d1 89442448                       mov        dword ptr [rsp + 0x48], eax
014d5 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
014da 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
014df 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
014e4 c5f877                         vzeroupper 
014e7 e8744cb4ff                     call       0x7f4c1b9d7d60
014ec 0f1f8400e4150003               nop        dword ptr [rax + rax + 0x30015e4]
014f4 bee4ffffff                     mov        esi, 0xffffffe4
014f9 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
014fe 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01503 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
0150b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01510 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01518 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0151d 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01525 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0152a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0152f 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01537 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0153c 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01541 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01546 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0154b 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01550 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01555 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0155a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0155f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01564 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01569 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0156e 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01573 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01578 89442448                       mov        dword ptr [rsp + 0x48], eax
0157c 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01581 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01586 48894424f8                     mov        qword ptr [rsp - 8], rax
0158b 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0158f 89442458                       mov        dword ptr [rsp + 0x58], eax
01593 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01598 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
0159e 6690                           nop        
015a0 c5f877                         vzeroupper 
015a3 e8b84bb4ff                     call       0x7f4c1b9d7d60
015a8 0f1f8400a0160004               nop        dword ptr [rax + rax + 0x40016a0]
015b0 bee4ffffff                     mov        esi, 0xffffffe4
015b5 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
015ba 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
015bf 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
015c7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
015cc 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
015d4 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
015d9 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
015e1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
015e6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
015eb 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
015f3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
015f8 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
015fd 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01602 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01607 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0160c 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01611 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01616 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
0161b 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01620 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01625 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0162a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0162f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01634 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01639 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0163e 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01643 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01648 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0164d 4489742450                     mov        dword ptr [rsp + 0x50], r14d
01652 6690                           nop        
01654 c5f877                         vzeroupper 
01657 e8044bb4ff                     call       0x7f4c1b9d7d60
0165c 0f1f840054170005               nop        dword ptr [rax + rax + 0x5001754]
01664 bee4ffffff                     mov        esi, 0xffffffe4
01669 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0166e 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01673 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
0167b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01680 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01688 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0168d 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01695 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0169a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0169f 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
016a7 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
016ac 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
016b1 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
016b6 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
016bb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
016c0 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
016c5 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
016ca 4c89542430                     mov        qword ptr [rsp + 0x30], r10
016cf 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
016d4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
016d9 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
016de 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
016e3 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
016e8 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
016ed 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
016f2 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
016f7 895c2450                       mov        dword ptr [rsp + 0x50], ebx
016fb c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
01701 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01706 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0170b 90                             nop        
0170c c5f877                         vzeroupper 
0170f e84c4ab4ff                     call       0x7f4c1b9d7d60
01714 0f1f84000c180006               nop        dword ptr [rax + rax + 0x600180c]
0171c be45ffffff                     mov        esi, 0xffffff45
01721 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01729 666690                         nop        
0172c c5f877                         vzeroupper 
0172f e82c4ab4ff                     call       0x7f4c1b9d7d60
01734 0f1f84002c180007               nop        dword ptr [rax + rax + 0x700182c]
0173c be45ffffff                     mov        esi, 0xffffff45
01741 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01746 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0174b 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01753 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01758 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01760 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01765 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
0176d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01772 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01777 48894424f8                     mov        qword ptr [rsp - 8], rax
0177c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01780 89442418                       mov        dword ptr [rsp + 0x18], eax
01784 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01789 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
0178e 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01793 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01798 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0179d 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
017a2 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
017a7 4c89542430                     mov        qword ptr [rsp + 0x30], r10
017ac 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
017b1 4c89542438                     mov        qword ptr [rsp + 0x38], r10
017b6 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
017bb 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
017c0 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
017c5 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
017ca 4489442444                     mov        dword ptr [rsp + 0x44], r8d
017cf 89442448                       mov        dword ptr [rsp + 0x48], eax
017d3 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
017d7 894c2450                       mov        dword ptr [rsp + 0x50], ecx
017db 90                             nop        
017dc c5f877                         vzeroupper 
017df e87c49b4ff                     call       0x7f4c1b9d7d60
017e4 0f1f8400dc180008               nop        dword ptr [rax + rax + 0x80018dc]
017ec 493bda                         cmp        rbx, r10
017ef bdffffffff                     mov        ebp, 0xffffffff
017f4 7c08                           jl         0x7f4c1be933fe
017f6 400f95c5                       setne      bpl
017fa 400fb6ed                       movzx      ebp, bpl
017fe be45ffffff                     mov        esi, 0xffffff45
01803 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01808 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
01810 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01815 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
0181d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01822 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
0182a 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
0182f 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01834 48894424f8                     mov        qword ptr [rsp - 8], rax
01839 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0183d 89442420                       mov        dword ptr [rsp + 0x20], eax
01841 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01846 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0184b 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01850 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01855 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0185a 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0185f 89442450                       mov        dword ptr [rsp + 0x50], eax
01863 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01868 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
0186d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01872 6690                           nop        
01874 c5f877                         vzeroupper 
01877 e8e448b4ff                     call       0x7f4c1b9d7d60
0187c 0f1f840074190009               nop        dword ptr [rax + rax + 0x9001974]
01884 be45ffffff                     mov        esi, 0xffffff45
01889 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0188e 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01893 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0189b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
018a0 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
018a8 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
018ad 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
018b5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
018ba 4c89542410                     mov        qword ptr [rsp + 0x10], r10
018bf 48894424f8                     mov        qword ptr [rsp - 8], rax
018c4 8b442464                       mov        eax, dword ptr [rsp + 0x64]
018c8 89442418                       mov        dword ptr [rsp + 0x18], eax
018cc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018d1 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
018d6 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
018db 4c89542420                     mov        qword ptr [rsp + 0x20], r10
018e0 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
018e5 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
018ea 4c89542430                     mov        qword ptr [rsp + 0x30], r10
018ef 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
018f4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
018f9 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
018fe 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01903 89442448                       mov        dword ptr [rsp + 0x48], eax
01907 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0190c 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01911 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01916 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
0191b 90                             nop        
0191c c5f877                         vzeroupper 
0191f e83c48b4ff                     call       0x7f4c1b9d7d60
01924 0f1f84001c1a000a               nop        dword ptr [rax + rax + 0xa001a1c]
0192c bee4ffffff                     mov        esi, 0xffffffe4
01931 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01936 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0193b 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01943 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01948 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01950 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01955 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
0195d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01962 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01967 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0196f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01974 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01979 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0197e 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01983 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01988 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
0198d 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01992 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01997 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0199c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
019a1 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
019a6 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
019ab 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
019b0 4489542440                     mov        dword ptr [rsp + 0x40], r10d
019b5 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
019ba 4489542448                     mov        dword ptr [rsp + 0x48], r10d
019bf 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
019c3 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
019c8 4489542450                     mov        dword ptr [rsp + 0x50], r10d
019cd 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
019d2 4489742464                     mov        dword ptr [rsp + 0x64], r14d
019d7 90                             nop        
019d8 c5f877                         vzeroupper 
019db e88047b4ff                     call       0x7f4c1b9d7d60
019e0 0f1f8400d81a000b               nop        dword ptr [rax + rax + 0xb001ad8]
019e8 bee4ffffff                     mov        esi, 0xffffffe4
019ed 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
019f2 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
019f7 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
019ff 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01a04 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01a0c 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01a11 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01a19 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01a1e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01a23 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01a2b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01a30 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01a35 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01a3a 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01a3f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01a44 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01a49 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01a4e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01a53 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01a58 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01a5d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01a62 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01a67 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01a6c 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01a71 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01a76 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01a7b 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01a7f 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01a84 48897c2458                     mov        qword ptr [rsp + 0x58], rdi
01a89 666690                         nop        
01a8c c5f877                         vzeroupper 
01a8f e8cc46b4ff                     call       0x7f4c1b9d7d60
01a94 0f1f84008c1b000c               nop        dword ptr [rax + rax + 0xc001b8c]
01a9c 4c8b442438                     mov        r8, qword ptr [rsp + 0x38]
01aa1 4d3bd8                         cmp        r11, r8
01aa4 bdffffffff                     mov        ebp, 0xffffffff
01aa9 7c08                           jl         0x7f4c1be936b3
01aab 400f95c5                       setne      bpl
01aaf 400fb6ed                       movzx      ebp, bpl
01ab3 be45ffffff                     mov        esi, 0xffffff45
01ab8 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01abd 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
01ac5 8b4c240c                       mov        ecx, dword ptr [rsp + 0xc]
01ac9 898c24e8000000                 mov        dword ptr [rsp + 0xe8], ecx
01ad0 8b4c2418                       mov        ecx, dword ptr [rsp + 0x18]
01ad4 898c24ec000000                 mov        dword ptr [rsp + 0xec], ecx
01adb 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
01ae0 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01ae5 48894424f8                     mov        qword ptr [rsp - 8], rax
01aea 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01aee 89442420                       mov        dword ptr [rsp + 0x20], eax
01af2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af7 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01afc 4c89442430                     mov        qword ptr [rsp + 0x30], r8
01b01 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01b06 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
01b0b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01b10 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01b15 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
01b1a 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01b1f 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01b23 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
01b28 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01b2d 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01b32 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01b37 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01b3c c5f877                         vzeroupper 
01b3f e81c46b4ff                     call       0x7f4c1b9d7d60
01b44 0f1f84003c1c000d               nop        dword ptr [rax + rax + 0xd001c3c]
01b4c 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
01b51 493be8                         cmp        rbp, r8
01b54 bdffffffff                     mov        ebp, 0xffffffff
01b59 7c08                           jl         0x7f4c1be93763
01b5b 400f95c5                       setne      bpl
01b5f 400fb6ed                       movzx      ebp, bpl
01b63 be45ffffff                     mov        esi, 0xffffff45
01b68 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01b6d 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
01b75 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01b7a 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01b82 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01b87 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01b8f 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
01b94 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01b99 48894424f8                     mov        qword ptr [rsp - 8], rax
01b9e 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01ba2 89442420                       mov        dword ptr [rsp + 0x20], eax
01ba6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bab 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01bb0 4c8b5c2438                     mov        r11, qword ptr [rsp + 0x38]
01bb5 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
01bba 4c89442438                     mov        qword ptr [rsp + 0x38], r8
01bbf 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01bc4 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01bc9 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01bce 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01bd3 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01bd7 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01bdc 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01be1 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01be6 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01beb 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01bf0 c5f877                         vzeroupper 
01bf3 e86845b4ff                     call       0x7f4c1b9d7d60
01bf8 0f1f8400f01c000e               nop        dword ptr [rax + rax + 0xe001cf0]
01c00 4183c608                       add        r14d, 8
01c04 be6effffff                     mov        esi, 0xffffff6e
01c09 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01c0e 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01c13 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01c1b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01c20 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01c28 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01c2d 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01c35 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01c3a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01c3f 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
01c44 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01c49 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01c4e 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01c53 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01c58 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01c5d 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01c62 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01c67 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01c6c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01c71 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01c76 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01c7b 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01c80 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01c85 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01c8a 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01c8f 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01c94 894c2458                       mov        dword ptr [rsp + 0x58], ecx
01c98 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
01c9c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01ca1 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01ca6 6690                           nop        
01ca8 c5f877                         vzeroupper 
01cab e8b044b4ff                     call       0x7f4c1b9d7d60
01cb0 0f1f8400a81d000f               nop        dword ptr [rax + rax + 0xf001da8]
01cb8 4183c608                       add        r14d, 8
01cbc be66ffffff                     mov        esi, 0xffffff66
01cc1 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01cc6 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01ccb 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01cd3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01cd8 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01ce0 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01ce5 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01ced 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01cf2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01cf7 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
01cfc 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01d01 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01d06 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01d0b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01d10 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01d15 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01d1a 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01d1f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01d24 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01d29 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01d2e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01d33 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01d38 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01d3d 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01d42 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01d47 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01d4c 894c2458                       mov        dword ptr [rsp + 0x58], ecx
01d50 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
01d54 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01d59 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01d5e 6690                           nop        
01d60 c5f877                         vzeroupper 
01d63 e8f843b4ff                     call       0x7f4c1b9d7d60
01d68 0f1f8400601e0010               nop        dword ptr [rax + rax + 0x10001e60]
01d70 beccffffff                     mov        esi, 0xffffffcc
01d75 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01d7a 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01d7f 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01d87 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01d8c 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01d94 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01d99 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01da1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01da6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01dab 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01db3 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01db8 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01dbd 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01dc2 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01dc7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01dcc 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01dd1 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01dd6 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01ddb 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01de0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01de5 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01dea 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01def 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01df4 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01df9 4489742450                     mov        dword ptr [rsp + 0x50], r14d
01dfe 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01e03 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01e08 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01e0d 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01e12 6690                           nop        
01e14 c5f877                         vzeroupper 
01e17 e84443b4ff                     call       0x7f4c1b9d7d60
01e1c 0f1f8400141f0011               nop        dword ptr [rax + rax + 0x11001f14]
01e24 458bdd                         mov        r11d, r13d
01e27 44035c244c                     add        r11d, dword ptr [rsp + 0x4c]
01e2c 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01e34 4f8b5c1a0c                     mov        r11, qword ptr [r10 + r11 + 0xc]
01e39 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01e3e 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
01e46 4f895c100c                     mov        qword ptr [r8 + r10 + 0xc], r11
01e4b 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01e50 4183c308                       add        r11d, 8
01e54 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01e59 453bd9                         cmp        r11d, r9d
01e5c 7cc6                           jl         0x7f4c1be93a24
01e5e 443bd9                         cmp        r11d, ecx
01e61 0f8d99000000                   jge        0x7f4c1be93b00
01e67 458bd3                         mov        r10d, r11d
01e6a 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01e6f 90                             nop        
01e70 418bfd                         mov        edi, r13d
01e73 037c244c                       add        edi, dword ptr [rsp + 0x4c]
01e77 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01e7c 4d63ca                         movsxd     r9, r10d
01e7f 448bd7                         mov        r10d, edi
01e82 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
01e8a 4f8b5c100c                     mov        r11, qword ptr [r8 + r10 + 0xc]
01e8f 4c63c7                         movsxd     r8, edi
01e92 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01e97 8bbc2484000000                 mov        edi, dword ptr [rsp + 0x84]
01e9e 4e895c170c                     mov        qword ptr [rdi + r10 + 0xc], r11
01ea3 4e8b540714                     mov        r10, qword ptr [rdi + r8 + 0x14]
01ea8 4e89540f14                     mov        qword ptr [rdi + r9 + 0x14], r10
01ead 4e8b54071c                     mov        r10, qword ptr [rdi + r8 + 0x1c]
01eb2 4e89540f1c                     mov        qword ptr [rdi + r9 + 0x1c], r10
01eb7 4e8b540724                     mov        r10, qword ptr [rdi + r8 + 0x24]
01ebc 4e89540f24                     mov        qword ptr [rdi + r9 + 0x24], r10
01ec1 4e8b54072c                     mov        r10, qword ptr [rdi + r8 + 0x2c]
01ec6 4e89540f2c                     mov        qword ptr [rdi + r9 + 0x2c], r10
01ecb 4e8b540734                     mov        r10, qword ptr [rdi + r8 + 0x34]
01ed0 4e89540f34                     mov        qword ptr [rdi + r9 + 0x34], r10
01ed5 4e8b54073c                     mov        r10, qword ptr [rdi + r8 + 0x3c]
01eda 4e89540f3c                     mov        qword ptr [rdi + r9 + 0x3c], r10
01edf 4e8b5c0744                     mov        r11, qword ptr [rdi + r8 + 0x44]
01ee4 4e895c0f44                     mov        qword ptr [rdi + r9 + 0x44], r11
01ee9 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01eee 4183c340                       add        r11d, 0x40
01ef2 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01ef7 443bd9                         cmp        r11d, ecx
01efa 0f8c70ffffff                   jl         0x7f4c1be93a70
01f00 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01f05 443bdb                         cmp        r11d, ebx
01f08 0f8d88f1ffff                   jge        0x7f4c1be92c96
01f0e 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01f13 458bca                         mov        r9d, r10d
01f16 6690                           nop        
01f18 478d1c29                       lea        r11d, [r9 + r13]
01f1c 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
01f24 4f8b44180c                     mov        r8, qword ptr [r8 + r11 + 0xc]
01f29 458bd1                         mov        r10d, r9d
01f2c 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01f34 4f8944130c                     mov        qword ptr [r11 + r10 + 0xc], r8
01f39 458d5908                       lea        r11d, [r9 + 8]
01f3d 458bcb                         mov        r9d, r11d
01f40 443bdb                         cmp        r11d, ebx
01f43 7cd3                           jl         0x7f4c1be93b18
01f45 e94cf1ffff                     jmp        0x7f4c1be92c96
01f4a bee4ffffff                     mov        esi, 0xffffffe4
01f4f 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01f54 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01f59 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01f61 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01f66 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01f6e 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01f73 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01f7b 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01f80 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01f85 48894424f8                     mov        qword ptr [rsp - 8], rax
01f8a 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01f8e 89442418                       mov        dword ptr [rsp + 0x18], eax
01f92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f97 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01f9c 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01fa1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01fa6 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01fab 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01fb0 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01fb5 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01fba 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01fbf 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01fc4 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01fc9 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01fce 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01fd3 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01fd8 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01fdd 89442448                       mov        dword ptr [rsp + 0x48], eax
01fe1 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01fe5 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
01fe9 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01fee 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01ff3 90                             nop        
01ff4 c5f877                         vzeroupper 
01ff7 e86441b4ff                     call       0x7f4c1b9d7d60
01ffc 0f1f8400f4200012               nop        dword ptr [rax + rax + 0x120020f4]
02004 beccffffff                     mov        esi, 0xffffffcc
02009 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0200e 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02016 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0201b 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02023 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02028 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02030 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02035 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0203a 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02042 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02047 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0204c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02051 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02056 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0205b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02060 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02065 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0206a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0206f 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02074 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02079 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0207e 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02083 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02088 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0208d 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
02092 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02097 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0209c 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
020a4 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
020a9 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
020ae 6690                           nop        
020b0 c5f877                         vzeroupper 
020b3 e8a840b4ff                     call       0x7f4c1b9d7d60
020b8 0f1f8400b0210013               nop        dword ptr [rax + rax + 0x130021b0]
020c0 bee4ffffff                     mov        esi, 0xffffffe4
020c5 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
020ca 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
020cf 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
020d7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
020dc 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
020e4 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
020e9 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
020f1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
020f6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
020fb 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02103 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02108 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0210d 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02112 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02117 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0211c 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02121 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02126 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0212b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02130 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02135 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0213a 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0213f 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02144 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02149 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0214e 4489542454                     mov        dword ptr [rsp + 0x54], r10d
02153 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02158 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0215d 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02162 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02167 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0216c c5f877                         vzeroupper 
0216f e8ec3fb4ff                     call       0x7f4c1b9d7d60
02174 0f1f84006c220014               nop        dword ptr [rax + rax + 0x1400226c]
0217c bee4ffffff                     mov        esi, 0xffffffe4
02181 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02186 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0218e 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02193 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
0219b 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
021a0 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
021a8 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
021ad 4c89542418                     mov        qword ptr [rsp + 0x18], r10
021b2 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
021ba 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
021bf 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
021c4 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
021c9 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
021ce 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
021d3 4c89542430                     mov        qword ptr [rsp + 0x30], r10
021d8 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
021dd 4c89542438                     mov        qword ptr [rsp + 0x38], r10
021e2 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
021e7 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
021ec 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
021f1 4489542444                     mov        dword ptr [rsp + 0x44], r10d
021f6 4489742454                     mov        dword ptr [rsp + 0x54], r14d
021fb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02200 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02205 666690                         nop        
02208 c5f877                         vzeroupper 
0220b e8503fb4ff                     call       0x7f4c1b9d7d60
02210 0f1f840008230015               nop        dword ptr [rax + rax + 0x15002308]
02218 418d6e01                       lea        ebp, [r14 + 1]
0221c bee4ffffff                     mov        esi, 0xffffffe4
02221 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02226 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0222e 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02233 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
0223b 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02240 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02248 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0224d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02252 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0225a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0225f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02264 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02269 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
0226e 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02273 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02278 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0227d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02282 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02287 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0228c 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02291 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02296 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0229b 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
022a0 4489742454                     mov        dword ptr [rsp + 0x54], r14d
022a5 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
022aa 4c89542468                     mov        qword ptr [rsp + 0x68], r10
022af 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
022b4 c5f877                         vzeroupper 
022b7 e8a43eb4ff                     call       0x7f4c1b9d7d60
022bc 0f1f8400b4230016               nop        dword ptr [rax + rax + 0x160023b4]
022c4 bee4ffffff                     mov        esi, 0xffffffe4
022c9 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
022ce 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
022d6 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
022db 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
022e3 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
022e8 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
022f0 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
022f5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
022fa 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02302 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02307 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0230c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02311 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02316 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0231b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02320 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02325 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0232a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0232f 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02334 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02339 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0233e 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02343 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02348 4489742454                     mov        dword ptr [rsp + 0x54], r14d
0234d 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02352 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02357 44894c2478                     mov        dword ptr [rsp + 0x78], r9d
0235c c5f877                         vzeroupper 
0235f e8fc3db4ff                     call       0x7f4c1b9d7d60
02364 0f1f84005c240017               nop        dword ptr [rax + rax + 0x1700245c]
0236c bee4ffffff                     mov        esi, 0xffffffe4
02371 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02376 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0237b 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02383 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02388 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02390 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02395 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
0239d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
023a2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
023a7 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
023ac 4489542418                     mov        dword ptr [rsp + 0x18], r10d
023b1 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
023b6 4c89542420                     mov        qword ptr [rsp + 0x20], r10
023bb 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
023c0 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
023c5 4c89542428                     mov        qword ptr [rsp + 0x28], r10
023ca 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
023cf 4c89542430                     mov        qword ptr [rsp + 0x30], r10
023d4 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
023d9 4489542438                     mov        dword ptr [rsp + 0x38], r10d
023de 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
023e3 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
023e8 4489442444                     mov        dword ptr [rsp + 0x44], r8d
023ed 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
023f2 4489542448                     mov        dword ptr [rsp + 0x48], r10d
023f7 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
023fc 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02401 4489742454                     mov        dword ptr [rsp + 0x54], r14d
02406 6690                           nop        
02408 c5f877                         vzeroupper 
0240b e8503db4ff                     call       0x7f4c1b9d7d60
02410 0f1f840008250018               nop        dword ptr [rax + rax + 0x18002508]
02418 bee4ffffff                     mov        esi, 0xffffffe4
0241d 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02422 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02427 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0242f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02434 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0243c 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02441 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02449 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0244e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02453 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0245b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02460 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02465 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0246a 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0246f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02474 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02479 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0247e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02483 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02488 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0248d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02492 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02497 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0249c 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
024a1 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
024a6 4489542448                     mov        dword ptr [rsp + 0x48], r10d
024ab 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
024b0 4489542450                     mov        dword ptr [rsp + 0x50], r10d
024b5 4489742460                     mov        dword ptr [rsp + 0x60], r14d
024ba 48ff742478                     push       qword ptr [rsp + 0x78]
024bf 488f442468                     pop        qword ptr [rsp + 0x68]
024c4 4489442478                     mov        dword ptr [rsp + 0x78], r8d
024c9 666690                         nop        
024cc c5f877                         vzeroupper 
024cf e88c3cb4ff                     call       0x7f4c1b9d7d60
024d4 0f1f8400cc250019               nop        dword ptr [rax + rax + 0x190025cc]
024dc bee4ffffff                     mov        esi, 0xffffffe4
024e1 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
024e6 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
024ee 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
024f3 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
024fb 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02500 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02508 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0250d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02512 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0251a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0251f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02524 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02529 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
0252e 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02533 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02538 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0253d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02542 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02547 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0254c 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02551 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02556 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0255b 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02560 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02565 4489542458                     mov        dword ptr [rsp + 0x58], r10d
0256a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0256f 4c89542460                     mov        qword ptr [rsp + 0x60], r10
02574 48ff742470                     push       qword ptr [rsp + 0x70]
02579 488f442468                     pop        qword ptr [rsp + 0x68]
0257e 894c2474                       mov        dword ptr [rsp + 0x74], ecx
02582 4489442478                     mov        dword ptr [rsp + 0x78], r8d
02587 90                             nop        
02588 c5f877                         vzeroupper 
0258b e8d03bb4ff                     call       0x7f4c1b9d7d60
02590 0f1f84008826001a               nop        dword ptr [rax + rax + 0x1a002688]
02598 4585c9                         test       r9d, r9d
0259b 0f843f0e0000                   je         0x7f4c1be94fe0
025a1 4d8bc1                         mov        r8, r9
025a4 448b4c240c                     mov        r9d, dword ptr [rsp + 0xc]
025a9 4533db                         xor        r11d, r11d
025ac 458bd1                         mov        r10d, r9d
025af e9aee6ffff                     jmp        0x7f4c1be92862
025b4 be6effffff                     mov        esi, 0xffffff6e
025b9 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
025be 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
025c3 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
025cb 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
025d0 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
025d8 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
025dd 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
025e5 48894424f8                     mov        qword ptr [rsp - 8], rax
025ea 8b442464                       mov        eax, dword ptr [rsp + 0x64]
025ee 89442418                       mov        dword ptr [rsp + 0x18], eax
025f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025f7 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
025fc 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02601 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02606 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0260b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
02610 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02615 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0261a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0261f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02624 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02629 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0262e 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02633 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02638 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0263d 89442448                       mov        dword ptr [rsp + 0x48], eax
02641 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02646 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0264b 895c2458                       mov        dword ptr [rsp + 0x58], ebx
0264f 894c2460                       mov        dword ptr [rsp + 0x60], ecx
02653 90                             nop        
02654 c5f877                         vzeroupper 
02657 e8043bb4ff                     call       0x7f4c1b9d7d60
0265c 0f1f84005427001b               nop        dword ptr [rax + rax + 0x1b002754]
02664 be45ffffff                     mov        esi, 0xffffff45
02669 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0266e 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02673 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0267b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02680 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02688 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0268d 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02695 48894424f8                     mov        qword ptr [rsp - 8], rax
0269a 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0269e 89442418                       mov        dword ptr [rsp + 0x18], eax
026a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026a7 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
026ac 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
026b1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
026b6 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
026bb 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
026c0 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
026c5 4c89542430                     mov        qword ptr [rsp + 0x30], r10
026ca 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
026cf 4c89542438                     mov        qword ptr [rsp + 0x38], r10
026d4 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
026d9 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
026de 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
026e3 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
026e8 4489442444                     mov        dword ptr [rsp + 0x44], r8d
026ed 89442448                       mov        dword ptr [rsp + 0x48], eax
026f1 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
026f5 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
026f9 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
026fe 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02703 90                             nop        
02704 c5f877                         vzeroupper 
02707 e8543ab4ff                     call       0x7f4c1b9d7d60
0270c 0f1f84000428001c               nop        dword ptr [rax + rax + 0x1c002804]
02714 be3dffffff                     mov        esi, 0xffffff3d
02719 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0271e 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02723 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
0272b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02730 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02738 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0273d 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02745 48894424f8                     mov        qword ptr [rsp - 8], rax
0274a 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0274e 89442418                       mov        dword ptr [rsp + 0x18], eax
02752 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02757 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
0275c 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02761 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02766 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0276b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
02770 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02775 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0277a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0277f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02784 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02789 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0278e 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02793 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02798 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0279d 89442448                       mov        dword ptr [rsp + 0x48], eax
027a1 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
027a5 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
027a9 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
027ae 4c89542468                     mov        qword ptr [rsp + 0x68], r10
027b3 90                             nop        
027b4 c5f877                         vzeroupper 
027b7 e8a439b4ff                     call       0x7f4c1b9d7d60
027bc 0f1f8400b428001d               nop        dword ptr [rax + rax + 0x1d0028b4]
027c4 bee4ffffff                     mov        esi, 0xffffffe4
027c9 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
027ce 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
027d6 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
027db 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
027e3 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
027e8 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
027f0 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
027f5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
027fa 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02802 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02807 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0280c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02811 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02816 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0281b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02820 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02825 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0282a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0282f 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02834 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02839 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0283e 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02843 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02848 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0284d 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02852 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02857 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0285c 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
02861 666690                         nop        
02864 c5f877                         vzeroupper 
02867 e8f438b4ff                     call       0x7f4c1b9d7d60
0286c 0f1f84006429001e               nop        dword ptr [rax + rax + 0x1e002964]
02874 bee4ffffff                     mov        esi, 0xffffffe4
02879 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0287e 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02886 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0288b 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02893 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02898 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
028a0 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
028a5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
028aa 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
028b2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
028b7 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
028bc 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
028c1 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
028c6 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
028cb 4c89542430                     mov        qword ptr [rsp + 0x30], r10
028d0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
028d5 4c89542438                     mov        qword ptr [rsp + 0x38], r10
028da 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
028df 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
028e4 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
028e9 4489542444                     mov        dword ptr [rsp + 0x44], r10d
028ee 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
028f3 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
028f8 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
028fd 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02902 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02907 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0290c 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
02911 666690                         nop        
02914 c5f877                         vzeroupper 
02917 e84438b4ff                     call       0x7f4c1b9d7d60
0291c 0f1f8400142a001f               nop        dword ptr [rax + rax + 0x1f002a14]
02924 beccffffff                     mov        esi, 0xffffffcc
02929 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0292e 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02933 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0293b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02940 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02948 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0294d 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02955 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0295a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0295f 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02967 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0296c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02971 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02976 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0297b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02980 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02985 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0298a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0298f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02994 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02999 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0299e 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
029a3 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
029a8 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
029ad 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
029b2 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
029b7 4489742458                     mov        dword ptr [rsp + 0x58], r14d
029bc 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
029c1 4489542460                     mov        dword ptr [rsp + 0x60], r10d
029c6 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
029cb 4c89542468                     mov        qword ptr [rsp + 0x68], r10
029d0 c5f877                         vzeroupper 
029d3 e88837b4ff                     call       0x7f4c1b9d7d60
029d8 0f1f8400d02a0020               nop        dword ptr [rax + rax + 0x20002ad0]
029e0 bee4ffffff                     mov        esi, 0xffffffe4
029e5 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
029ea 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
029ef 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
029f7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
029fc 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02a04 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02a09 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02a11 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02a16 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02a1b 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02a20 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02a25 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02a2a 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02a2f 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02a34 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02a39 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02a3e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02a43 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02a48 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02a4d 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02a52 89442444                       mov        dword ptr [rsp + 0x44], eax
02a56 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02a5b 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02a60 895c2450                       mov        dword ptr [rsp + 0x50], ebx
02a64 48894424f8                     mov        qword ptr [rsp - 8], rax
02a69 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02a6d 89442454                       mov        dword ptr [rsp + 0x54], eax
02a71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a76 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
02a7b 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
02a80 c5f877                         vzeroupper 
02a83 e8d836b4ff                     call       0x7f4c1b9d7d60
02a88 0f1f8400802b0021               nop        dword ptr [rax + rax + 0x21002b80]
02a90 bee4ffffff                     mov        esi, 0xffffffe4
02a95 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02a9a 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02a9f 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02aa7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02aac 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02ab4 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02ab9 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02ac1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02ac6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02acb 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02ad3 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02ad8 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02add 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02ae2 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02ae7 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02aec 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02af1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02af6 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02afb 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02b00 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02b05 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02b0a 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02b0f 89442444                       mov        dword ptr [rsp + 0x44], eax
02b13 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02b18 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02b1d 895c2450                       mov        dword ptr [rsp + 0x50], ebx
02b21 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
02b26 48894424f8                     mov        qword ptr [rsp - 8], rax
02b2b 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02b2f 89442460                       mov        dword ptr [rsp + 0x60], eax
02b33 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b38 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02b3d 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02b42 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
02b4a 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
02b4f c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
02b58 c5f877                         vzeroupper 
02b5b e80036b4ff                     call       0x7f4c1b9d7d60
02b60 0f1f8400582c0022               nop        dword ptr [rax + rax + 0x22002c58]
02b68 418be9                         mov        ebp, r9d
02b6b 83c510                         add        ebp, 0x10
02b6e be6effffff                     mov        esi, 0xffffff6e
02b73 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02b78 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02b80 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02b85 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02b8d 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02b92 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02b9a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02b9f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02ba4 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
02ba9 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02bae 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02bb3 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02bb8 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02bbd 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02bc2 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02bc7 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02bcc 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02bd1 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02bd6 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02bda 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02bdf 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02be4 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
02be8 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02bed 4c89542460                     mov        qword ptr [rsp + 0x60], r10
02bf2 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02bf7 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02bfc 897c2478                       mov        dword ptr [rsp + 0x78], edi
02c00 c5f877                         vzeroupper 
02c03 e85835b4ff                     call       0x7f4c1b9d7d60
02c08 0f1f8400002d0023               nop        dword ptr [rax + rax + 0x23002d00]
02c10 418be9                         mov        ebp, r9d
02c13 83c510                         add        ebp, 0x10
02c16 be66ffffff                     mov        esi, 0xffffff66
02c1b 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02c20 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02c28 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02c2d 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02c35 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02c3a 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02c42 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02c47 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02c4c 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
02c51 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02c56 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02c5b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02c60 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02c65 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02c6a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02c6f 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02c74 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02c79 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02c7e 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02c82 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02c87 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02c8c 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
02c90 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02c95 4c89542460                     mov        qword ptr [rsp + 0x60], r10
02c9a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02c9f 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02ca4 897c2478                       mov        dword ptr [rsp + 0x78], edi
02ca8 c5f877                         vzeroupper 
02cab e8b034b4ff                     call       0x7f4c1b9d7d60
02cb0 0f1f8400a82d0024               nop        dword ptr [rax + rax + 0x24002da8]
02cb8 be17000000                     mov        esi, 0x17
02cbd 666690                         nop        
02cc0 c5f877                         vzeroupper 
02cc3 e89834b4ff                     call       0x7f4c1b9d7d60
02cc8 0f1f8400c02d0025               nop        dword ptr [rax + rax + 0x25002dc0]
02cd0 be6effffff                     mov        esi, 0xffffff6e
02cd5 48899424e0000000               mov        qword ptr [rsp + 0xe0], rdx
02cdd 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02ce2 48ff742428                     push       qword ptr [rsp + 0x28]
02ce7 488f442420                     pop        qword ptr [rsp + 0x20]
02cec 897c2428                       mov        dword ptr [rsp + 0x28], edi
02cf0 4c89442430                     mov        qword ptr [rsp + 0x30], r8
02cf5 48ff742440                     push       qword ptr [rsp + 0x40]
02cfa 488f442438                     pop        qword ptr [rsp + 0x38]
02cff 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
02d03 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
02d08 4c89742448                     mov        qword ptr [rsp + 0x48], r14
02d0d 666690                         nop        
02d10 c5f877                         vzeroupper 
02d13 e84834b4ff                     call       0x7f4c1b9d7d60
02d18 0f1f8400102e0026               nop        dword ptr [rax + rax + 0x26002e10]
02d20 bebeffffff                     mov        esi, 0xffffffbe
02d25 4c89ac24e0000000               mov        qword ptr [rsp + 0xe0], r13
02d2d 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02d32 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02d3a 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02d3f 4889542418                     mov        qword ptr [rsp + 0x18], rdx
02d44 48ff742428                     push       qword ptr [rsp + 0x28]
02d49 488f442420                     pop        qword ptr [rsp + 0x20]
02d4e 897c2428                       mov        dword ptr [rsp + 0x28], edi
02d52 4c89442430                     mov        qword ptr [rsp + 0x30], r8
02d57 48ff742440                     push       qword ptr [rsp + 0x40]
02d5c 488f442438                     pop        qword ptr [rsp + 0x38]
02d61 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
02d65 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
02d6a 4c89742448                     mov        qword ptr [rsp + 0x48], r14
02d6f 90                             nop        
02d70 c5f877                         vzeroupper 
02d73 e8e833b4ff                     call       0x7f4c1b9d7d60
02d78 0f1f8400702e0027               nop        dword ptr [rax + rax + 0x27002e70]
02d80 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
02d85 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
02d8a bef6ffffff                     mov        esi, 0xfffffff6
02d8f 498bed                         mov        rbp, r13
02d92 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
02d9a 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02da2 6690                           nop        
02da4 c5f877                         vzeroupper 
02da7 e8b433b4ff                     call       0x7f4c1b9d7d60
02dac 0f1f8400a42e0028               nop        dword ptr [rax + rax + 0x28002ea4]
02db4 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02db8 eb10                           jmp        0x7f4c1be949ca
02dba 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02dbe eb0a                           jmp        0x7f4c1be949ca
02dc0 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02dc4 eb04                           jmp        0x7f4c1be949ca
02dc6 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02dca beccffffff                     mov        esi, 0xffffffcc
02dcf 4c89ac24e0000000               mov        qword ptr [rsp + 0xe0], r13
02dd7 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02ddf 4c89742410                     mov        qword ptr [rsp + 0x10], r14
02de4 4c89442418                     mov        qword ptr [rsp + 0x18], r8
02de9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02dee 6690                           nop        
02df0 c5f877                         vzeroupper 
02df3 e86833b4ff                     call       0x7f4c1b9d7d60
02df8 0f1f8400f02e0029               nop        dword ptr [rax + rax + 0x29002ef0]
02e00 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02e04 4c8b742478                     mov        r14, qword ptr [rsp + 0x78]
02e09 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
02e0e ebba                           jmp        0x7f4c1be949ca
02e10 bee4ffffff                     mov        esi, 0xffffffe4
02e15 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02e1a 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02e1f 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02e27 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02e2c 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02e34 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02e39 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02e41 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02e46 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02e4b 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02e53 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02e58 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02e5d 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02e62 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02e67 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02e6c 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02e71 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02e76 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02e7b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02e80 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02e85 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02e8a 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02e8f 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02e94 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02e99 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02e9d 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02ea2 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
02ea7 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
02eac c5f877                         vzeroupper 
02eaf e8ac32b4ff                     call       0x7f4c1b9d7d60
02eb4 0f1f8400ac2f002a               nop        dword ptr [rax + rax + 0x2a002fac]
02ebc bee4ffffff                     mov        esi, 0xffffffe4
02ec1 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02ec6 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02ecb 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02ed3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02ed8 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02ee0 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02ee5 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02eed 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02ef2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02ef7 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02eff 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02f04 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02f09 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02f0e 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02f13 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02f18 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02f1d 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02f22 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02f27 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02f2c 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02f31 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02f36 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02f3b 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02f40 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02f45 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02f49 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02f4e 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02f53 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02f58 4c89542460                     mov        qword ptr [rsp + 0x60], r10
02f5d 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02f61 48894c2470                     mov        qword ptr [rsp + 0x70], rcx
02f66 6690                           nop        
02f68 c5f877                         vzeroupper 
02f6b e8f031b4ff                     call       0x7f4c1b9d7d60
02f70 0f1f84006830002b               nop        dword ptr [rax + rax + 0x2b003068]
02f78 448bd0                         mov        r10d, eax
02f7b 4183c208                       add        r10d, 8
02f7f be6effffff                     mov        esi, 0xffffff6e
02f84 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02f89 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02f8e 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02f96 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02f9b 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
02fa3 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
02fa8 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
02fb0 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
02fb5 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02fba 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
02fbf 4489442418                     mov        dword ptr [rsp + 0x18], r8d
02fc4 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
02fc9 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
02fce 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02fd3 4c8b5c2438                     mov        r11, qword ptr [rsp + 0x38]
02fd8 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
02fdd 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
02fe2 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
02fe7 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
02fec 4489442438                     mov        dword ptr [rsp + 0x38], r8d
02ff1 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02ff6 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02ffb 895c2448                       mov        dword ptr [rsp + 0x48], ebx
02fff 4489542464                     mov        dword ptr [rsp + 0x64], r10d
03004 c5f877                         vzeroupper 
03007 e85431b4ff                     call       0x7f4c1b9d7d60
0300c 0f1f84000431002c               nop        dword ptr [rax + rax + 0x2c003104]
03014 448bd0                         mov        r10d, eax
03017 4183c208                       add        r10d, 8
0301b be66ffffff                     mov        esi, 0xffffff66
03020 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
03025 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
0302a 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
03032 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
03037 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
0303f 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
03044 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
0304c 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
03051 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
03056 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0305b 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
03060 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
03065 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
0306a 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
0306f 4c8b5c2438                     mov        r11, qword ptr [rsp + 0x38]
03074 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
03079 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
0307e 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
03083 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
03088 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0308d 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
03092 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
03097 895c2448                       mov        dword ptr [rsp + 0x48], ebx
0309b 4489542464                     mov        dword ptr [rsp + 0x64], r10d
030a0 c5f877                         vzeroupper 
030a3 e8b830b4ff                     call       0x7f4c1b9d7d60
030a8 0f1f8400a031002d               nop        dword ptr [rax + rax + 0x2d0031a0]
030b0 beccffffff                     mov        esi, 0xffffffcc
030b5 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
030ba 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
030bf 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
030c7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
030cc 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
030d4 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
030d9 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
030e1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
030e6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
030eb 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
030f3 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
030f8 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
030fd 4c89542420                     mov        qword ptr [rsp + 0x20], r10
03102 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
03107 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0310c 4c89542430                     mov        qword ptr [rsp + 0x30], r10
03111 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
03116 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0311b 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
03120 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
03125 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0312a 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0312f 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
03134 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
03139 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
0313e 89442468                       mov        dword ptr [rsp + 0x68], eax
03142 6690                           nop        
03144 c5f877                         vzeroupper 
03147 e81430b4ff                     call       0x7f4c1b9d7d60
0314c 0f1f84004432002e               nop        dword ptr [rax + rax + 0x2e003244]
03154 bee4ffffff                     mov        esi, 0xffffffe4
03159 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0315e 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
03163 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0316b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
03170 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
03178 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0317d 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
03185 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0318a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0318f 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
03197 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0319c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
031a1 4489542418                     mov        dword ptr [rsp + 0x18], r10d
031a6 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
031ab 4c89542420                     mov        qword ptr [rsp + 0x20], r10
031b0 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
031b5 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
031ba 4c89542428                     mov        qword ptr [rsp + 0x28], r10
031bf 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
031c4 4c89542430                     mov        qword ptr [rsp + 0x30], r10
031c9 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
031ce 4489542438                     mov        dword ptr [rsp + 0x38], r10d
031d3 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
031d8 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
031dd 895c2444                       mov        dword ptr [rsp + 0x44], ebx
031e1 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
031e6 4489542448                     mov        dword ptr [rsp + 0x48], r10d
031eb 4489742454                     mov        dword ptr [rsp + 0x54], r14d
031f0 c5f877                         vzeroupper 
031f3 e8682fb4ff                     call       0x7f4c1b9d7d60
031f8 0f1f8400f032002f               nop        dword ptr [rax + rax + 0x2f0032f0]
03200 bee4ffffff                     mov        esi, 0xffffffe4
03205 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0320a 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0320f 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
03217 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0321c 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
03224 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
03229 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
03231 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03236 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0323b 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
03243 448954240c                     mov        dword ptr [rsp + 0xc], r10d
03248 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0324d 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
03252 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
03257 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0325c 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
03261 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
03266 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0326b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
03270 4c89542430                     mov        qword ptr [rsp + 0x30], r10
03275 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0327a 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0327f 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
03284 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
03289 895c2444                       mov        dword ptr [rsp + 0x44], ebx
0328d 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
03292 448974244c                     mov        dword ptr [rsp + 0x4c], r14d
03297 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
0329c 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
032a1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
032a6 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
032ab 4c89542468                     mov        qword ptr [rsp + 0x68], r10
032b0 c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
032b6 6690                           nop        
032b8 c5f877                         vzeroupper 
032bb e8a02eb4ff                     call       0x7f4c1b9d7d60
032c0 0f1f8400b8330030               nop        dword ptr [rax + rax + 0x300033b8]
032c8 4183c610                       add        r14d, 0x10
032cc be6effffff                     mov        esi, 0xffffff6e
032d1 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
032d6 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
032de 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
032e3 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
032eb 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
032f0 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
032f8 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
032fd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03302 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
03307 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0330c 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
03311 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
03316 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0331b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
03320 4c89542438                     mov        qword ptr [rsp + 0x38], r10
03325 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0332a 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0332f 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
03334 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
03339 4489742450                     mov        dword ptr [rsp + 0x50], r14d
0333e 895c2454                       mov        dword ptr [rsp + 0x54], ebx
03342 6690                           nop        
03344 c5f877                         vzeroupper 
03347 e8142eb4ff                     call       0x7f4c1b9d7d60
0334c 0f1f840044340031               nop        dword ptr [rax + rax + 0x31003444]
03354 4183c610                       add        r14d, 0x10
03358 be66ffffff                     mov        esi, 0xffffff66
0335d 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
03362 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0336a 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0336f 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
03377 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0337c 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
03384 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03389 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0338e 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
03393 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
03398 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
0339d 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
033a2 4c89542430                     mov        qword ptr [rsp + 0x30], r10
033a7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
033ac 4c89542438                     mov        qword ptr [rsp + 0x38], r10
033b1 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
033b6 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
033bb 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
033c0 4489542444                     mov        dword ptr [rsp + 0x44], r10d
033c5 4489742450                     mov        dword ptr [rsp + 0x50], r14d
033ca 895c2454                       mov        dword ptr [rsp + 0x54], ebx
033ce 6690                           nop        
033d0 c5f877                         vzeroupper 
033d3 e8882db4ff                     call       0x7f4c1b9d7d60
033d8 0f1f8400d0340032               nop        dword ptr [rax + rax + 0x320034d0]
033e0 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
033e5 4533c0                         xor        r8d, r8d
033e8 e99df9ffff                     jmp        0x7f4c1be9498a
033ed bef6ffffff                     mov        esi, 0xfffffff6
033f2 6690                           nop        
033f4 c5f877                         vzeroupper 
033f7 e8642db4ff                     call       0x7f4c1b9d7d60
033fc 0f1f8400f4340033               nop        dword ptr [rax + rax + 0x330034f4]
03404 488bf0                         mov        rsi, rax
03407 c5f877                         vzeroupper 
0340a 4881c4d0000000                 add        rsp, 0xd0
03411 5d                             pop        rbp
03412 e9c955b4ff                     jmp        0x7f4c1b9da5e0
03417 49bad828e91b4c7f0000           movabs     r10, 0x7f4c1be928d8
03421 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
03428 e9b3dea7ff                     jmp        0x7f4c1b912ee0
0342d e86eaaa6ff                     call       0x7f4c1b8ffaa0
03432 e907ccffff                     jmp        0x7f4c1be91c3e
03437 f4                             hlt        
