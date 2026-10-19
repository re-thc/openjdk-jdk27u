00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f8540185307                   jne        0x7f05378fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ec50020000                 sub        rsp, 0x250
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 7405                           je         0x7f05303c913f
0003a e861195207                     call       0x7f05378eaaa0
0003f 4889b42448010000               mov        qword ptr [rsp + 0x148], rsi
00047 4889942468010000               mov        qword ptr [rsp + 0x168], rdx
0004f 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
00056 4c89842428010000               mov        qword ptr [rsp + 0x128], r8
0005e 4c898c2420010000               mov        qword ptr [rsp + 0x120], r9
00066 89bc2430010000                 mov        dword ptr [rsp + 0x130], edi
0006d 48bb88644320057f0000           movabs     rbx, 0x7f0520436488
00077 8b4370                         mov        eax, dword ptr [rbx + 0x70]
0007a 83c002                         add        eax, 2
0007d 894370                         mov        dword ptr [rbx + 0x70], eax
00080 25fe070000                     and        eax, 0x7fe
00085 85c0                           test       eax, eax
00087 0f84cc410000                   je         0x7f05303cd359
0008d 48bb88644320057f0000           movabs     rbx, 0x7f0520436488
00097 ff83a8000000                   inc        dword ptr [rbx + 0xa8]
0009d 8b9c2460020000                 mov        ebx, dword ptr [rsp + 0x260]
000a4 8b4640                         mov        eax, dword ptr [rsi + 0x40]
000a7 4889842438010000               mov        qword ptr [rsp + 0x138], rax
000af 448b5e38                       mov        r11d, dword ptr [rsi + 0x38]
000b3 448b6e04                       mov        r13d, dword ptr [rsi + 4]
000b7 4489ac2460010000               mov        dword ptr [rsp + 0x160], r13d
000bf 4c8b7608                       mov        r14, qword ptr [rsi + 8]
000c3 4c89b42488010000               mov        qword ptr [rsp + 0x188], r14
000cb 4c8b4e10                       mov        r9, qword ptr [rsi + 0x10]
000cf 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000d3 4963fb                         movsxd     rdi, r11d
000d6 4903fe                         add        rdi, r14
000d9 498bc5                         mov        rax, r13
000dc 412bc3                         sub        eax, r11d
000df 3bd8                           cmp        ebx, eax
000e1 48b888644320057f0000           movabs     rax, 0x7f0520436488
000eb b9f8000000                     mov        ecx, 0xf8
000f0 7f05                           jg         0x7f05303c91f7
000f2 b908010000                     mov        ecx, 0x108
000f7 44899c2440010000               mov        dword ptr [rsp + 0x140], r11d
000ff 4c8b1c08                       mov        r11, qword ptr [rax + rcx]
00103 4d8d5b01                       lea        r11, [r11 + 1]
00107 4c891c08                       mov        qword ptr [rax + rcx], r11
0010b 0f8fa8400000                   jg         0x7f05303cd2b9
00111 4863db                         movsxd     rbx, ebx
00114 488b4e20                       mov        rcx, qword ptr [rsi + 0x20]
00118 482bcf                         sub        rcx, rdi
0011b 483bcb                         cmp        rcx, rbx
0011e 48b988644320057f0000           movabs     rcx, 0x7f0520436488
00128 b828010000                     mov        eax, 0x128
0012d 7c05                           jl         0x7f05303c9234
0012f b818010000                     mov        eax, 0x118
00134 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
00138 4d8d5b01                       lea        r11, [r11 + 1]
0013c 4c891c01                       mov        qword ptr [rcx + rax], r11
00140 0f8c73400000                   jl         0x7f05303cd2b9
00146 48b988644320057f0000           movabs     rcx, 0x7f0520436488
00150 ff8158010000                   inc        dword ptr [rcx + 0x158]
00156 b900000000                     mov        ecx, 0
0015b 498bc0                         mov        rax, r8
0015e 483bc1                         cmp        rax, rcx
00161 48b988644320057f0000           movabs     rcx, 0x7f0520436488
0016b b868010000                     mov        eax, 0x168
00170 7505                           jne        0x7f05303c9277
00172 b878010000                     mov        eax, 0x178
00177 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
0017b 4d8d5b01                       lea        r11, [r11 + 1]
0017f 4c891c01                       mov        qword ptr [rcx + rax], r11
00183 0f8531000000                   jne        0x7f05303c92ba
00189 4803df                         add        rbx, rdi
0018c 498bc9                         mov        rcx, r9
0018f 483bcb                         cmp        rcx, rbx
00192 48b988644320057f0000           movabs     rcx, 0x7f0520436488
0019c bf98010000                     mov        edi, 0x198
001a1 7d05                           jge        0x7f05303c92a8
001a3 bf88010000                     mov        edi, 0x188
001a8 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
001ac 488d5b01                       lea        rbx, [rbx + 1]
001b0 48891c39                       mov        qword ptr [rcx + rdi], rbx
001b4 0f8d0a000000                   jge        0x7f05303c92c4
001ba bf00000000                     mov        edi, 0
001bf e915000000                     jmp        0x7f05303c92d9
001c4 48b988644320057f0000           movabs     rcx, 0x7f0520436488
001ce ff81a8010000                   inc        dword ptr [rcx + 0x1a8]
001d4 bf01000000                     mov        edi, 1
001d9 4d2bc6                         sub        r8, r14
001dc 4c89842480010000               mov        qword ptr [rsp + 0x180], r8
001e4 48b988644320057f0000           movabs     rcx, 0x7f0520436488
001ee 488381c001000001               add        qword ptr [rcx + 0x1c0], 1
001f6 48b9207f1320057f0000           movabs     rcx, 0x7f0520137f20
00200 8b5970                         mov        ebx, dword ptr [rcx + 0x70]
00203 83c302                         add        ebx, 2
00206 895970                         mov        dword ptr [rcx + 0x70], ebx
00209 81e3feff1f00                   and        ebx, 0x1ffffe
0020f 85db                           test       ebx, ebx
00211 0f8463400000                   je         0x7f05303cd37a
00217 48b9ffffffffffffff7f           movabs     rcx, 0x7fffffffffffffff
00221 493bc9                         cmp        rcx, r9
00224 48b9207f1320057f0000           movabs     rcx, 0x7f0520137f20
0022e bbb8000000                     mov        ebx, 0xb8
00233 7d05                           jge        0x7f05303c933a
00235 bba8000000                     mov        ebx, 0xa8
0023a 488b0419                       mov        rax, qword ptr [rcx + rbx]
0023e 488d4001                       lea        rax, [rax + 1]
00242 48890419                       mov        qword ptr [rcx + rbx], rax
00246 0f8d0f000000                   jge        0x7f05303c935b
0024c 49b9ffffffffffffff7f           movabs     r9, 0x7fffffffffffffff
00256 e910000000                     jmp        0x7f05303c936b
0025b 48b9207f1320057f0000           movabs     rcx, 0x7f0520137f20
00265 ff81c8000000                   inc        dword ptr [rcx + 0xc8]
0026b 448b9c2440010000               mov        r11d, dword ptr [rsp + 0x140]
00273 498bdd                         mov        rbx, r13
00276 83eb20                         sub        ebx, 0x20
00279 899c2458010000                 mov        dword ptr [rsp + 0x158], ebx
00280 8b4204                         mov        eax, dword ptr [rdx + 4]
00283 89842464010000                 mov        dword ptr [rsp + 0x164], eax
0028a 488bc8                         mov        rcx, rax
0028d 83e920                         sub        ecx, 0x20
00290 898c245c010000                 mov        dword ptr [rsp + 0x15c], ecx
00297 be00000000                     mov        esi, 0
0029c 89b42444010000                 mov        dword ptr [rsp + 0x144], esi
002a3 be00000000                     mov        esi, 0
002a8 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
002b0 4c898c2450010000               mov        qword ptr [rsp + 0x150], r9
002b8 89bc2470010000                 mov        dword ptr [rsp + 0x170], edi
002bf 488b9c2468020000               mov        rbx, qword ptr [rsp + 0x268]
002c7 8bbc2430010000                 mov        edi, dword ptr [rsp + 0x130]
002ce 4c8b8c2420010000               mov        r9, qword ptr [rsp + 0x120]
002d6 4c8b842428010000               mov        r8, qword ptr [rsp + 0x128]
002de 8b8c2434010000                 mov        ecx, dword ptr [rsp + 0x134]
002e5 8b942444010000                 mov        edx, dword ptr [rsp + 0x144]
002ec 0f1f4000                       nop        dword ptr [rax]
002f0 3bd7                           cmp        edx, edi
002f2 48bf88644320057f0000           movabs     rdi, 0x7f0520436488
002fc b8d0010000                     mov        eax, 0x1d0
00301 7d05                           jge        0x7f05303c9408
00303 b8e0010000                     mov        eax, 0x1e0
00308 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
0030c 4d8d5b01                       lea        r11, [r11 + 1]
00310 4c891c07                       mov        qword ptr [rdi + rax], r11
00314 0f8dfa3b0000                   jge        0x7f05303cd014
0031a 413b5004                       cmp        edx, dword ptr [r8 + 4]
0031e 0f83863f0000                   jae        0x7f05303cd3aa
00324 4863fa                         movsxd     rdi, edx
00327 498b44f808                     mov        rax, qword ptr [r8 + rdi*8 + 8]
0032c 8bf8                           mov        edi, eax
0032e 81e7ffff0100                   and        edi, 0x1ffff
00334 89bc247c010000                 mov        dword ptr [rsp + 0x17c], edi
0033b 4c8bd9                         mov        r11, rcx
0033e b912000000                     mov        ecx, 0x12
00343 4c8bc0                         mov        r8, rax
00346 49d3e8                         shr        r8, cl
00349 458bc0                         mov        r8d, r8d
0034c 4181e0ffff0300                 and        r8d, 0x3ffff
00353 4489842478010000               mov        dword ptr [rsp + 0x178], r8d
0035b b924000000                     mov        ecx, 0x24
00360 48d3f8                         sar        rax, cl
00363 8bc0                           mov        eax, eax
00365 85c0                           test       eax, eax
00367 48b988644320057f0000           movabs     rcx, 0x7f0520436488
00371 41b8f0010000                   mov        r8d, 0x1f0
00377 7d06                           jge        0x7f05303c947f
00379 41b800020000                   mov        r8d, 0x200
0037f 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00383 4d8d6d01                       lea        r13, [r13 + 1]
00387 4e892c01                       mov        qword ptr [rcx + r8], r13
0038b 0f8d15000000                   jge        0x7f05303c94a6
00391 413b5104                       cmp        edx, dword ptr [r9 + 4]
00395 0f83273f0000                   jae        0x7f05303cd3c2
0039b 4863ca                         movsxd     rcx, edx
0039e 418b4c8908                     mov        ecx, dword ptr [r9 + rcx*4 + 8]
003a3 488bc1                         mov        rax, rcx
003a6 85ff                           test       edi, edi
003a8 48b988644320057f0000           movabs     rcx, 0x7f0520436488
003b2 41b810020000                   mov        r8d, 0x210
003b8 7406                           je         0x7f05303c94c0
003ba 41b820020000                   mov        r8d, 0x220
003c0 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003c4 4d8d6d01                       lea        r13, [r13 + 1]
003c8 4e892c01                       mov        qword ptr [rcx + r8], r13
003cc 0f8431000000                   je         0x7f05303c9503
003d2 498bcb                         mov        rcx, r11
003d5 2bce                           sub        ecx, esi
003d7 3bf9                           cmp        edi, ecx
003d9 48b988644320057f0000           movabs     rcx, 0x7f0520436488
003e3 41b840020000                   mov        r8d, 0x240
003e9 7f06                           jg         0x7f05303c94f1
003eb 41b830020000                   mov        r8d, 0x230
003f1 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003f5 4d8d6d01                       lea        r13, [r13 + 1]
003f9 4e892c01                       mov        qword ptr [rcx + r8], r13
003fd 0f8f163d0000                   jg         0x7f05303cd219
00403 83f803                         cmp        eax, 3
00406 48b988644320057f0000           movabs     rcx, 0x7f0520436488
00410 41b860020000                   mov        r8d, 0x260
00416 7e06                           jle        0x7f05303c951e
00418 41b870020000                   mov        r8d, 0x270
0041e 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00422 4d8d6d01                       lea        r13, [r13 + 1]
00426 4e892c01                       mov        qword ptr [rcx + r8], r13
0042a 0f8e59000000                   jle        0x7f05303c9589
00430 83e803                         sub        eax, 3
00433 837b0401                       cmp        dword ptr [rbx + 4], 1
00437 0f869d3e0000                   jbe        0x7f05303cd3da
0043d 8b4b0c                         mov        ecx, dword ptr [rbx + 0xc]
00440 837b0402                       cmp        dword ptr [rbx + 4], 2
00444 0f86a23e0000                   jbe        0x7f05303cd3ec
0044a 894b10                         mov        dword ptr [rbx + 0x10], ecx
0044d 8b4b08                         mov        ecx, dword ptr [rbx + 8]
00450 894b0c                         mov        dword ptr [rbx + 0xc], ecx
00453 894308                         mov        dword ptr [rbx + 8], eax
00456 48b988644320057f0000           movabs     rcx, 0x7f0520436488
00460 ff8180020000                   inc        dword ptr [rcx + 0x280]
00466 89942444010000                 mov        dword ptr [rsp + 0x144], edx
0046d 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
00474 4c8bb42488010000               mov        r14, qword ptr [rsp + 0x188]
0047c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
00484 e952000000                     jmp        0x7f05303c95db
00489 89942444010000                 mov        dword ptr [rsp + 0x144], edx
00490 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
00497 49b888644320057f0000           movabs     r8, 0x7f0520436488
004a1 4983809802000001               add        qword ptr [r8 + 0x298], 1
004a9 488bf3                         mov        rsi, rbx
004ac 488bd0                         mov        rdx, rax
004af 488bcf                         mov        rcx, rdi
004b2 0f1f440000                     nop        dword ptr [rax + rax]
004b7 e8a4225307                     call       0x7f05378fb860
004bc 0f1f8400b4050000               nop        dword ptr [rax + rax + 0x5b4]
004c4 8bbc247c010000                 mov        edi, dword ptr [rsp + 0x17c]
004cb 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
004d3 4c8bb42488010000               mov        r14, qword ptr [rsp + 0x188]
004db 4963f3                         movsxd     rsi, r11d
004de 4903f6                         add        rsi, r14
004e1 4863d7                         movsxd     rdx, edi
004e4 4803f2                         add        rsi, rdx
004e7 4863d8                         movsxd     rbx, eax
004ea 488bd6                         mov        rdx, rsi
004ed 483bd3                         cmp        rdx, rbx
004f0 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
004fa b9b8020000                     mov        ecx, 0x2b8
004ff 7d05                           jge        0x7f05303c9606
00501 b9a8020000                     mov        ecx, 0x2a8
00506 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0050a 4d8d4001                       lea        r8, [r8 + 1]
0050e 4c89040a                       mov        qword ptr [rdx + rcx], r8
00512 0f8d15000000                   jge        0x7f05303c962d
00518 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00520 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00528 e9ad000000                     jmp        0x7f05303c96da
0052d 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00535 4585ed                         test       r13d, r13d
00538 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
00542 b9c8020000                     mov        ecx, 0x2c8
00547 7505                           jne        0x7f05303c964e
00549 b9d8020000                     mov        ecx, 0x2d8
0054e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
00552 4d8d4001                       lea        r8, [r8 + 1]
00556 4c89040a                       mov        qword ptr [rdx + rcx], r8
0055a 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00562 0f8568000000                   jne        0x7f05303c96d0
00568 498bd3                         mov        rdx, r11
0056b 03d7                           add        edx, edi
0056d 2bd0                           sub        edx, eax
0056f 4863d2                         movsxd     rdx, edx
00572 493bd0                         cmp        rdx, r8
00575 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
0057f b9e8020000                     mov        ecx, 0x2e8
00584 7c05                           jl         0x7f05303c968b
00586 b9f8020000                     mov        ecx, 0x2f8
0058b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0058f 4d8d4901                       lea        r9, [r9 + 1]
00593 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00597 0f8c3d000000                   jl         0x7f05303c96da
0059d 4c8b8c2450010000               mov        r9, qword ptr [rsp + 0x150]
005a5 4c3bcb                         cmp        r9, rbx
005a8 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
005b2 b918030000                     mov        ecx, 0x318
005b7 7c05                           jl         0x7f05303c96be
005b9 b908030000                     mov        ecx, 0x308
005be 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
005c2 4d8d4901                       lea        r9, [r9 + 1]
005c6 4c890c0a                       mov        qword ptr [rdx + rcx], r9
005ca 0f8c0a000000                   jl         0x7f05303c96da
005d0 ba00000000                     mov        edx, 0
005d5 e915000000                     jmp        0x7f05303c96ef
005da 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
005e4 ff8228030000                   inc        dword ptr [rdx + 0x328]
005ea ba01000000                     mov        edx, 1
005ef 48899c2498010000               mov        qword ptr [rsp + 0x198], rbx
005f7 85c0                           test       eax, eax
005f9 48b988644320057f0000           movabs     rcx, 0x7f0520436488
00603 41b940030000                   mov        r9d, 0x340
00609 7e06                           jle        0x7f05303c9711
0060b 41b950030000                   mov        r9d, 0x350
00611 4a8b1c09                       mov        rbx, qword ptr [rcx + r9]
00615 488d5b01                       lea        rbx, [rbx + 1]
00619 4a891c09                       mov        qword ptr [rcx + r9], rbx
0061d 0f8e47380000                   jle        0x7f05303ccf6a
00623 85d2                           test       edx, edx
00625 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
0062f b970030000                     mov        ecx, 0x370
00634 7505                           jne        0x7f05303c973b
00636 b960030000                     mov        ecx, 0x360
0063b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0063f 4d8d4901                       lea        r9, [r9 + 1]
00643 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00647 0f851d380000                   jne        0x7f05303ccf6a
0064d 498bdb                         mov        rbx, r11
00650 03df                           add        ebx, edi
00652 899c24a0010000                 mov        dword ptr [rsp + 0x1a0], ebx
00659 488bf3                         mov        rsi, rbx
0065c 03b42478010000                 add        esi, dword ptr [rsp + 0x178]
00663 3bb42458010000                 cmp        esi, dword ptr [rsp + 0x158]
0066a 48be88644320057f0000           movabs     rsi, 0x7f0520436488
00674 ba28040000                     mov        edx, 0x428
00679 7f05                           jg         0x7f05303c9780
0067b ba38040000                     mov        edx, 0x438
00680 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
00684 488d4901                       lea        rcx, [rcx + 1]
00688 48890c16                       mov        qword ptr [rsi + rdx], rcx
0068c 0f8f3f000000                   jg         0x7f05303c97d1
00692 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
00699 03f7                           add        esi, edi
0069b 89b424a4010000                 mov        dword ptr [rsp + 0x1a4], esi
006a2 3bb4245c010000                 cmp        esi, dword ptr [rsp + 0x15c]
006a9 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
006b3 b958040000                     mov        ecx, 0x458
006b8 7e05                           jle        0x7f05303c97bf
006ba b948040000                     mov        ecx, 0x448
006bf 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
006c3 4d8d4901                       lea        r9, [r9 + 1]
006c7 4c890c0a                       mov        qword ptr [rdx + rcx], r9
006cb 0f8e76000000                   jle        0x7f05303c9847
006d1 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
006d9 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
006e1 48be88644320057f0000           movabs     rsi, 0x7f0520436488
006eb 4883861808000001               add        qword ptr [rsi + 0x818], 1
006f3 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
006fb 498bd3                         mov        rdx, r11
006fe 8b8c2460010000                 mov        ecx, dword ptr [rsp + 0x160]
00705 4d8bd8                         mov        r11, r8
00708 4c8b842468010000               mov        r8, qword ptr [rsp + 0x168]
00710 448b8c2490010000               mov        r9d, dword ptr [rsp + 0x190]
00718 8bbc247c010000                 mov        edi, dword ptr [rsp + 0x17c]
0071f 890424                         mov        dword ptr [rsp], eax
00722 44895c2408                     mov        dword ptr [rsp + 8], r11d
00727 e834205307                     call       0x7f05378fb860
0072c 0f1f840024080001               nop        dword ptr [rax + rax + 0x1000824]
00734 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
0073b 03b4247c010000                 add        esi, dword ptr [rsp + 0x17c]
00742 e9a1360000                     jmp        0x7f05303ccee8
00747 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
0074f 83ff10                         cmp        edi, 0x10
00752 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
0075c b968040000                     mov        ecx, 0x468
00761 7f05                           jg         0x7f05303c9868
00763 b978040000                     mov        ecx, 0x478
00768 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0076c 4d8d4901                       lea        r9, [r9 + 1]
00770 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00774 0f8f470a0000                   jg         0x7f05303ca2c1
0077a 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
00784 4883828804000001               add        qword ptr [rdx + 0x488], 1
0078c 48ba182e1320057f0000           movabs     rdx, 0x7f0520132e18
00796 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00799 83c102                         add        ecx, 2
0079c 894a70                         mov        dword ptr [rdx + 0x70], ecx
0079f 81e1feff1f00                   and        ecx, 0x1ffffe
007a5 85c9                           test       ecx, ecx
007a7 0f84513b0000                   je         0x7f05303cd3fe
007ad 48bab8c02ce300000000           movabs     rdx, 0xe32cc0b8
007b7 48b9182e1320057f0000           movabs     rcx, 0x7f0520132e18
007c1 8b12                           mov        edx, dword ptr [rdx]
007c3 c1ea0d                         shr        edx, 0xd
007c6 48c1e20a                       shl        rdx, 0xa
007ca 41ba00000012                   mov        r10d, 0x12000000
007d0 4903d2                         add        rdx, r10
007d3 41ba16000000                   mov        r10d, 0x16
007d9 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
007dd 7436                           je         0x7f05303c9915
007df 4983c202                       add        r10, 2
007e3 4983fa1a                       cmp        r10, 0x1a
007e7 75f0                           jne        0x7f05303c98d9
007e9 41ba16000000                   mov        r10d, 0x16
007ef 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
007f4 7412                           je         0x7f05303c9908
007f6 4983c202                       add        r10, 2
007fa 4983fa1a                       cmp        r10, 0x1a
007fe 75ef                           jne        0x7f05303c98ef
00800 41ba15000000                   mov        r10d, 0x15
00806 eb11                           jmp        0x7f05303c9919
00808 50                             push       rax
00809 4833c0                         xor        rax, rax
0080c f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
00812 58                             pop        rax
00813 ebbe                           jmp        0x7f05303c98d3
00815 4983c201                       add        r10, 1
00819 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0081e 48ba182e1320057f0000           movabs     rdx, 0x7f0520132e18
00828 488382d800000001               add        qword ptr [rdx + 0xd8], 1
00830 48ba30241320057f0000           movabs     rdx, 0x7f0520132430
0083a 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0083d 83c102                         add        ecx, 2
00840 894a70                         mov        dword ptr [rdx + 0x70], ecx
00843 81e1feff1f00                   and        ecx, 0x1ffffe
00849 85c9                           test       ecx, ecx
0084b 0f84ce3a0000                   je         0x7f05303cd41f
00851 448bac2490010000               mov        r13d, dword ptr [rsp + 0x190]
00859 48ba30241320057f0000           movabs     rdx, 0x7f0520132430
00863 4883820801000001               add        qword ptr [rdx + 0x108], 1
0086b 8b942464010000                 mov        edx, dword ptr [rsp + 0x164]
00872 83ea0f                         sub        edx, 0xf
00875 48b9001b1320057f0000           movabs     rcx, 0x7f0520131b00
0087f 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00883 4183c102                       add        r9d, 2
00887 44894970                       mov        dword ptr [rcx + 0x70], r9d
0088b 4181e1feff1f00                 and        r9d, 0x1ffffe
00892 4585c9                         test       r9d, r9d
00895 0f84a53a0000                   je         0x7f05303cd440
0089b 48b9001b1320057f0000           movabs     rcx, 0x7f0520131b00
008a5 488381a800000001               add        qword ptr [rcx + 0xa8], 1
008ad 48b90000000000000000           movabs     rcx, 0
008b7 b900000000                     mov        ecx, 0
008bc 443be9                         cmp        r13d, ecx
008bf 0f8c9c3a0000                   jl         0x7f05303cd461
008c5 443bea                         cmp        r13d, edx
008c8 0f8da03a0000                   jge        0x7f05303cd46e
008ce 498bd5                         mov        rdx, r13
008d1 89942494010000                 mov        dword ptr [rsp + 0x194], edx
008d8 48b9b8c02ce300000000           movabs     rcx, 0xe32cc0b8
008e2 4c8bc9                         mov        r9, rcx
008e5 49be182e1320057f0000           movabs     r14, 0x7f0520132e18
008ef 458b09                         mov        r9d, dword ptr [r9]
008f2 41c1e90d                       shr        r9d, 0xd
008f6 49c1e10a                       shl        r9, 0xa
008fa 41ba00000012                   mov        r10d, 0x12000000
00900 4d03ca                         add        r9, r10
00903 41ba24000000                   mov        r10d, 0x24
00909 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
0090d 7436                           je         0x7f05303c9a45
0090f 4983c202                       add        r10, 2
00913 4983fa28                       cmp        r10, 0x28
00917 75f0                           jne        0x7f05303c9a09
00919 41ba24000000                   mov        r10d, 0x24
0091f 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
00924 7412                           je         0x7f05303c9a38
00926 4983c202                       add        r10, 2
0092a 4983fa28                       cmp        r10, 0x28
0092e 75ef                           jne        0x7f05303c9a1f
00930 41ba23000000                   mov        r10d, 0x23
00936 eb11                           jmp        0x7f05303c9a49
00938 50                             push       rax
00939 4833c0                         xor        rax, rax
0093c f04f0fb10cd6                   lock cmpxchg qword ptr [r14 + r10*8], r9
00942 58                             pop        rax
00943 ebbe                           jmp        0x7f05303c9a03
00945 4983c201                       add        r10, 1
00949 4b8304d601                     add        qword ptr [r14 + r10*8], 1
0094e 48ba001c1320057f0000           movabs     rdx, 0x7f0520131c00
00958 448b4a70                       mov        r9d, dword ptr [rdx + 0x70]
0095c 4183c102                       add        r9d, 2
00960 44894a70                       mov        dword ptr [rdx + 0x70], r9d
00964 4181e1feff1f00                 and        r9d, 0x1ffffe
0096b 4585c9                         test       r9d, r9d
0096e 0f84073a0000                   je         0x7f05303cd47b
00974 48ba001c1320057f0000           movabs     rdx, 0x7f0520131c00
0097e 488382a800000001               add        qword ptr [rdx + 0xa8], 1
00986 48ba281d1320057f0000           movabs     rdx, 0x7f0520131d28
00990 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00993 83c102                         add        ecx, 2
00996 894a70                         mov        dword ptr [rdx + 0x70], ecx
00999 81e1feff1f00                   and        ecx, 0x1ffffe
0099f 85c9                           test       ecx, ecx
009a1 0f84f5390000                   je         0x7f05303cd49c
009a7 48ba281d1320057f0000           movabs     rdx, 0x7f0520131d28
009b1 ff82b8000000                   inc        dword ptr [rdx + 0xb8]
009b7 8b942494010000                 mov        edx, dword ptr [rsp + 0x194]
009be 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
009c5 4489ac2490010000               mov        dword ptr [rsp + 0x190], r13d
009cd 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
009d5 488b9c2468010000               mov        rbx, qword ptr [rsp + 0x168]
009dd 48b9b0402de300000000           movabs     rcx, 0xe32d40b0
009e7 4c8bc9                         mov        r9, rcx
009ea 48b8182e1320057f0000           movabs     rax, 0x7f0520132e18
009f4 4883805801000001               add        qword ptr [rax + 0x158], 1
009fc 49b9e02f1320057f0000           movabs     r9, 0x7f0520132fe0
00a06 418b4170                       mov        eax, dword ptr [r9 + 0x70]
00a0a 83c002                         add        eax, 2
00a0d 41894170                       mov        dword ptr [r9 + 0x70], eax
00a11 25feff1f00                     and        eax, 0x1ffffe
00a16 85c0                           test       eax, eax
00a18 0f849f390000                   je         0x7f05303cd4bd
00a1e 4c8bc9                         mov        r9, rcx
00a21 48b8e02f1320057f0000           movabs     rax, 0x7f0520132fe0
00a2b 488380a800000001               add        qword ptr [rax + 0xa8], 1
00a33 49b9c0301320057f0000           movabs     r9, 0x7f05201330c0
00a3d 418b4170                       mov        eax, dword ptr [r9 + 0x70]
00a41 83c002                         add        eax, 2
00a44 41894170                       mov        dword ptr [r9 + 0x70], eax
00a48 25feff1f00                     and        eax, 0x1ffffe
00a4d 85c0                           test       eax, eax
00a4f 0f8489390000                   je         0x7f05303cd4de
00a55 49b9c0301320057f0000           movabs     r9, 0x7f05201330c0
00a5f 498381b800000001               add        qword ptr [r9 + 0xb8], 1
00a67 48b9a8251320057f0000           movabs     rcx, 0x7f05201325a8
00a71 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00a75 4183c102                       add        r9d, 2
00a79 44894970                       mov        dword ptr [rcx + 0x70], r9d
00a7d 4181e1feff1f00                 and        r9d, 0x1ffffe
00a84 4585c9                         test       r9d, r9d
00a87 0f8472390000                   je         0x7f05303cd4ff
00a8d 48b9b8c02ce300000000           movabs     rcx, 0xe32cc0b8
00a97 4c8bc9                         mov        r9, rcx
00a9a 48b8c0301320057f0000           movabs     rax, 0x7f05201330c0
00aa4 458b09                         mov        r9d, dword ptr [r9]
00aa7 41c1e90d                       shr        r9d, 0xd
00aab 49c1e10a                       shl        r9, 0xa
00aaf 41ba00000012                   mov        r10d, 0x12000000
00ab5 4d03ca                         add        r9, r10
00ab8 41ba1c000000                   mov        r10d, 0x1c
00abe 4e3b0cd0                       cmp        r9, qword ptr [rax + r10*8]
00ac2 743c                           je         0x7f05303c9c00
00ac4 4983c202                       add        r10, 2
00ac8 4983fa20                       cmp        r10, 0x20
00acc 75f0                           jne        0x7f05303c9bbe
00ace 41ba1c000000                   mov        r10d, 0x1c
00ad4 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
00ad9 7412                           je         0x7f05303c9bed
00adb 4983c202                       add        r10, 2
00adf 4983fa20                       cmp        r10, 0x20
00ae3 75ef                           jne        0x7f05303c9bd4
00ae5 41ba1b000000                   mov        r10d, 0x1b
00aeb eb17                           jmp        0x7f05303c9c04
00aed 53                             push       rbx
00aee 488bd8                         mov        rbx, rax
00af1 4833c0                         xor        rax, rax
00af4 f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
00afa 488bc3                         mov        rax, rbx
00afd 5b                             pop        rbx
00afe ebb8                           jmp        0x7f05303c9bb8
00b00 4983c201                       add        r10, 1
00b04 4a8304d001                     add        qword ptr [rax + r10*8], 1
00b09 49b9c0301320057f0000           movabs     r9, 0x7f05201330c0
00b13 8b09                           mov        ecx, dword ptr [rcx]
00b15 c1e90d                         shr        ecx, 0xd
00b18 48c1e10a                       shl        rcx, 0xa
00b1c 41ba00000012                   mov        r10d, 0x12000000
00b22 4903ca                         add        rcx, r10
00b25 41ba22000000                   mov        r10d, 0x22
00b2b 4b3b0cd1                       cmp        rcx, qword ptr [r9 + r10*8]
00b2f 7436                           je         0x7f05303c9c67
00b31 4983c202                       add        r10, 2
00b35 4983fa26                       cmp        r10, 0x26
00b39 75f0                           jne        0x7f05303c9c2b
00b3b 41ba22000000                   mov        r10d, 0x22
00b41 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
00b46 7412                           je         0x7f05303c9c5a
00b48 4983c202                       add        r10, 2
00b4c 4983fa26                       cmp        r10, 0x26
00b50 75ef                           jne        0x7f05303c9c41
00b52 41ba21000000                   mov        r10d, 0x21
00b58 eb11                           jmp        0x7f05303c9c6b
00b5a 50                             push       rax
00b5b 4833c0                         xor        rax, rax
00b5e f04b0fb10cd1                   lock cmpxchg qword ptr [r9 + r10*8], rcx
00b64 58                             pop        rax
00b65 ebbe                           jmp        0x7f05303c9c25
00b67 4983c201                       add        r10, 1
00b6b 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00b70 48b9c0301320057f0000           movabs     rcx, 0x7f05201330c0
00b7a 4883813801000001               add        qword ptr [rcx + 0x138], 1
00b82 48b968261320057f0000           movabs     rcx, 0x7f0520132668
00b8c 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00b90 4183c102                       add        r9d, 2
00b94 44894970                       mov        dword ptr [rcx + 0x70], r9d
00b98 4181e1feff1f00                 and        r9d, 0x1ffffe
00b9f 4585c9                         test       r9d, r9d
00ba2 0f8478380000                   je         0x7f05303cd520
00ba8 48b9c0301320057f0000           movabs     rcx, 0x7f05201330c0
00bb2 4883814801000001               add        qword ptr [rcx + 0x148], 1
00bba 4863c2                         movsxd     rax, edx
00bbd ba08000000                     mov        edx, 8
00bc2 4c8bc8                         mov        r9, rax
00bc5 4c03ca                         add        r9, rdx
00bc8 48ba50181320057f0000           movabs     rdx, 0x7f0520131850
00bd2 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00bd5 83c102                         add        ecx, 2
00bd8 894a70                         mov        dword ptr [rdx + 0x70], ecx
00bdb 81e1feff1f00                   and        ecx, 0x1ffffe
00be1 85c9                           test       ecx, ecx
00be3 0f8458380000                   je         0x7f05303cd541
00be9 48ba50181320057f0000           movabs     rdx, 0x7f0520131850
00bf3 488382d800000001               add        qword ptr [rdx + 0xd8], 1
00bfb 48bac8191320057f0000           movabs     rdx, 0x7f05201319c8
00c05 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00c08 83c102                         add        ecx, 2
00c0b 894a70                         mov        dword ptr [rdx + 0x70], ecx
00c0e 81e1feff1f00                   and        ecx, 0x1ffffe
00c14 85c9                           test       ecx, ecx
00c16 0f8446380000                   je         0x7f05303cd562
00c1c 48bac0301320057f0000           movabs     rdx, 0x7f05201330c0
00c26 4883826801000001               add        qword ptr [rdx + 0x168], 1
00c2e 48ba80992de300000000           movabs     rdx, 0xe32d9980
00c38 48be00c12ce300000000           movabs     rsi, 0xe32cc100
00c42 ba02000000                     mov        edx, 2
00c47 b910000000                     mov        ecx, 0x10
00c4c 4c8bc3                         mov        r8, rbx
00c4f bf00000000                     mov        edi, 0
00c54 48891c24                       mov        qword ptr [rsp], rbx
00c58 4889442408                     mov        qword ptr [rsp + 8], rax
00c5d 49bab8c02ce300000000           movabs     r10, 0xe32cc0b8
00c67 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00c6c 49ba80992de300000000           movabs     r10, 0xe32d9980
00c76 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c7b 0f1f4000                       nop        dword ptr [rax]
00c7f e8dc1a5307                     call       0x7f05378fb860
00c84 0f1f84007c0d0002               nop        dword ptr [rax + rax + 0x2000d7c]
00c8c 4885c0                         test       rax, rax
00c8f 48bbc0301320057f0000           movabs     rbx, 0x7f05201330c0
00c99 750c                           jne        0x7f05303c9da7
00c9b 808b7101000001                 or         byte ptr [rbx + 0x171], 1
00ca2 e988000000                     jmp        0x7f05303c9e2f
00ca7 8b38                           mov        edi, dword ptr [rax]
00ca9 c1ef0d                         shr        edi, 0xd
00cac 48c1e70a                       shl        rdi, 0xa
00cb0 41ba00000012                   mov        r10d, 0x12000000
00cb6 4903fa                         add        rdi, r10
00cb9 41ba30000000                   mov        r10d, 0x30
00cbf 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
00cc3 7436                           je         0x7f05303c9dfb
00cc5 4983c202                       add        r10, 2
00cc9 4983fa34                       cmp        r10, 0x34
00ccd 75f0                           jne        0x7f05303c9dbf
00ccf 41ba30000000                   mov        r10d, 0x30
00cd5 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00cda 7412                           je         0x7f05303c9dee
00cdc 4983c202                       add        r10, 2
00ce0 4983fa34                       cmp        r10, 0x34
00ce4 75ef                           jne        0x7f05303c9dd5
00ce6 41ba2f000000                   mov        r10d, 0x2f
00cec eb11                           jmp        0x7f05303c9dff
00cee 50                             push       rax
00cef 4833c0                         xor        rax, rax
00cf2 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
00cf8 58                             pop        rax
00cf9 ebbe                           jmp        0x7f05303c9db9
00cfb 4983c201                       add        r10, 1
00cff 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00d04 48bf0084001300000000           movabs     rdi, 0x13008400
00d0e 8b18                           mov        ebx, dword ptr [rax]
00d10 c1eb0d                         shr        ebx, 0xd
00d13 48c1e30a                       shl        rbx, 0xa
00d17 41ba00000012                   mov        r10d, 0x12000000
00d1d 4903da                         add        rbx, r10
00d20 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
00d24 0f8559370000                   jne        0x7f05303cd583
00d2a e900000000                     jmp        0x7f05303c9e2f
00d2f 488bf8                         mov        rdi, rax
00d32 4889bc24b0010000               mov        qword ptr [rsp + 0x1b0], rdi
00d3a 483b07                         cmp        rax, qword ptr [rdi]
00d3d 488bf7                         mov        rsi, rdi
00d40 48bb88644320057f0000           movabs     rbx, 0x7f0520436488
00d4a 8b36                           mov        esi, dword ptr [rsi]
00d4c c1ee0d                         shr        esi, 0xd
00d4f 48c1e60a                       shl        rsi, 0xa
00d53 41ba00000012                   mov        r10d, 0x12000000
00d59 4903f2                         add        rsi, r10
00d5c 41ba94000000                   mov        r10d, 0x94
00d62 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00d66 743c                           je         0x7f05303c9ea4
00d68 4983c202                       add        r10, 2
00d6c 4981fa98000000                 cmp        r10, 0x98
00d73 75ed                           jne        0x7f05303c9e62
00d75 41ba94000000                   mov        r10d, 0x94
00d7b 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00d80 7415                           je         0x7f05303c9e97
00d82 4983c202                       add        r10, 2
00d86 4981fa98000000                 cmp        r10, 0x98
00d8d 75ec                           jne        0x7f05303c9e7b
00d8f 41ba93000000                   mov        r10d, 0x93
00d95 eb11                           jmp        0x7f05303c9ea8
00d97 50                             push       rax
00d98 4833c0                         xor        rax, rax
00d9b f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00da1 58                             pop        rax
00da2 ebb8                           jmp        0x7f05303c9e5c
00da4 4983c201                       add        r10, 1
00da8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00dad 48bed83a1320057f0000           movabs     rsi, 0x7f0520133ad8
00db7 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
00dba 83c302                         add        ebx, 2
00dbd 895e70                         mov        dword ptr [rsi + 0x70], ebx
00dc0 81e3feff1f00                   and        ebx, 0x1ffffe
00dc6 85db                           test       ebx, ebx
00dc8 0f84c3360000                   je         0x7f05303cd591
00dce 488bf7                         mov        rsi, rdi
00dd1 48bbd83a1320057f0000           movabs     rbx, 0x7f0520133ad8
00ddb 8b36                           mov        esi, dword ptr [rsi]
00ddd c1ee0d                         shr        esi, 0xd
00de0 48c1e60a                       shl        rsi, 0xa
00de4 41ba00000012                   mov        r10d, 0x12000000
00dea 4903f2                         add        rsi, r10
00ded 41ba16000000                   mov        r10d, 0x16
00df3 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00df7 7436                           je         0x7f05303c9f2f
00df9 4983c202                       add        r10, 2
00dfd 4983fa1a                       cmp        r10, 0x1a
00e01 75f0                           jne        0x7f05303c9ef3
00e03 41ba16000000                   mov        r10d, 0x16
00e09 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00e0e 7412                           je         0x7f05303c9f22
00e10 4983c202                       add        r10, 2
00e14 4983fa1a                       cmp        r10, 0x1a
00e18 75ef                           jne        0x7f05303c9f09
00e1a 41ba15000000                   mov        r10d, 0x15
00e20 eb11                           jmp        0x7f05303c9f33
00e22 50                             push       rax
00e23 4833c0                         xor        rax, rax
00e26 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00e2c 58                             pop        rax
00e2d ebbe                           jmp        0x7f05303c9eed
00e2f 4983c201                       add        r10, 1
00e33 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00e38 488bf7                         mov        rsi, rdi
00e3b 6690                           nop        
00e3d 48b8b0cb190c057f0000           movabs     rax, 0x7f050c19cbb0
00e47 e814145307                     call       0x7f05378fb360
00e4c 0f1f8400440f0003               nop        dword ptr [rax + rax + 0x3000f44]
00e54 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
00e5c 8b7704                         mov        esi, dword ptr [rdi + 4]
00e5f 48bbd83a1320057f0000           movabs     rbx, 0x7f0520133ad8
00e69 488383d800000001               add        qword ptr [rbx + 0xd8], 1
00e71 48bb30241320057f0000           movabs     rbx, 0x7f0520132430
00e7b 8b5370                         mov        edx, dword ptr [rbx + 0x70]
00e7e 83c202                         add        edx, 2
00e81 895370                         mov        dword ptr [rbx + 0x70], edx
00e84 81e2feff1f00                   and        edx, 0x1ffffe
00e8a 85d2                           test       edx, edx
00e8c 0f8425360000                   je         0x7f05303cd5b7
00e92 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
00e9a 48bb30241320057f0000           movabs     rbx, 0x7f0520132430
00ea4 4883830801000001               add        qword ptr [rbx + 0x108], 1
00eac ffc8                           dec        eax
00eae 2bf0                           sub        esi, eax
00eb0 48bb001b1320057f0000           movabs     rbx, 0x7f0520131b00
00eba 8b4370                         mov        eax, dword ptr [rbx + 0x70]
00ebd 83c002                         add        eax, 2
00ec0 894370                         mov        dword ptr [rbx + 0x70], eax
00ec3 25feff1f00                     and        eax, 0x1ffffe
00ec8 85c0                           test       eax, eax
00eca 0f8408360000                   je         0x7f05303cd5d8
00ed0 48bb001b1320057f0000           movabs     rbx, 0x7f0520131b00
00eda 488383a800000001               add        qword ptr [rbx + 0xa8], 1
00ee2 48bb0000000000000000           movabs     rbx, 0
00eec bb00000000                     mov        ebx, 0
00ef1 443bdb                         cmp        r11d, ebx
00ef4 0f8cff350000                   jl         0x7f05303cd5f9
00efa 443bde                         cmp        r11d, esi
00efd 0f8d03360000                   jge        0x7f05303cd606
00f03 498bdb                         mov        rbx, r11
00f06 899c24ac010000                 mov        dword ptr [rsp + 0x1ac], ebx
00f0d 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
00f15 488bbc24b0010000               mov        rdi, qword ptr [rsp + 0x1b0]
00f1d 488bf7                         mov        rsi, rdi
00f20 48bad83a1320057f0000           movabs     rdx, 0x7f0520133ad8
00f2a 8b36                           mov        esi, dword ptr [rsi]
00f2c c1ee0d                         shr        esi, 0xd
00f2f 48c1e60a                       shl        rsi, 0xa
00f33 41ba00000012                   mov        r10d, 0x12000000
00f39 4903f2                         add        rsi, r10
00f3c 41ba1e000000                   mov        r10d, 0x1e
00f42 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
00f46 7436                           je         0x7f05303ca07e
00f48 4983c202                       add        r10, 2
00f4c 4983fa22                       cmp        r10, 0x22
00f50 75f0                           jne        0x7f05303ca042
00f52 41ba1e000000                   mov        r10d, 0x1e
00f58 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
00f5d 7412                           je         0x7f05303ca071
00f5f 4983c202                       add        r10, 2
00f63 4983fa22                       cmp        r10, 0x22
00f67 75ef                           jne        0x7f05303ca058
00f69 41ba1d000000                   mov        r10d, 0x1d
00f6f eb11                           jmp        0x7f05303ca082
00f71 50                             push       rax
00f72 4833c0                         xor        rax, rax
00f75 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
00f7b 58                             pop        rax
00f7c ebbe                           jmp        0x7f05303ca03c
00f7e 4983c201                       add        r10, 1
00f82 4a8304d201                     add        qword ptr [rdx + r10*8], 1
00f87 488bf7                         mov        rsi, rdi
00f8a 666690                         nop        
00f8d 48b8d8cb190c057f0000           movabs     rax, 0x7f050c19cbd8
00f97 e8c4125307                     call       0x7f05378fb360
00f9c 0f1f840094100004               nop        dword ptr [rax + rax + 0x4001094]
00fa4 483b00                         cmp        rax, qword ptr [rax]
00fa7 488bf0                         mov        rsi, rax
00faa 48bad83a1320057f0000           movabs     rdx, 0x7f0520133ad8
00fb4 8b36                           mov        esi, dword ptr [rsi]
00fb6 c1ee0d                         shr        esi, 0xd
00fb9 48c1e60a                       shl        rsi, 0xa
00fbd 41ba00000012                   mov        r10d, 0x12000000
00fc3 4903f2                         add        rsi, r10
00fc6 41ba24000000                   mov        r10d, 0x24
00fcc 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
00fd0 7436                           je         0x7f05303ca108
00fd2 4983c202                       add        r10, 2
00fd6 4983fa28                       cmp        r10, 0x28
00fda 75f0                           jne        0x7f05303ca0cc
00fdc 41ba24000000                   mov        r10d, 0x24
00fe2 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
00fe7 7412                           je         0x7f05303ca0fb
00fe9 4983c202                       add        r10, 2
00fed 4983fa28                       cmp        r10, 0x28
00ff1 75ef                           jne        0x7f05303ca0e2
00ff3 41ba23000000                   mov        r10d, 0x23
00ff9 eb11                           jmp        0x7f05303ca10c
00ffb 50                             push       rax
00ffc 4833c0                         xor        rax, rax
00fff f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01005 58                             pop        rax
01006 ebbe                           jmp        0x7f05303ca0c6
01008 4983c201                       add        r10, 1
0100c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01011 8b7024                         mov        esi, dword ptr [rax + 0x24]
01014 488bd0                         mov        rdx, rax
01017 48b9d83a1320057f0000           movabs     rcx, 0x7f0520133ad8
01021 8b12                           mov        edx, dword ptr [rdx]
01023 c1ea0d                         shr        edx, 0xd
01026 48c1e20a                       shl        rdx, 0xa
0102a 41ba00000012                   mov        r10d, 0x12000000
01030 4903d2                         add        rdx, r10
01033 41ba2a000000                   mov        r10d, 0x2a
01039 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0103d 7436                           je         0x7f05303ca175
0103f 4983c202                       add        r10, 2
01043 4983fa2e                       cmp        r10, 0x2e
01047 75f0                           jne        0x7f05303ca139
01049 41ba2a000000                   mov        r10d, 0x2a
0104f 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01054 7412                           je         0x7f05303ca168
01056 4983c202                       add        r10, 2
0105a 4983fa2e                       cmp        r10, 0x2e
0105e 75ef                           jne        0x7f05303ca14f
01060 41ba29000000                   mov        r10d, 0x29
01066 eb11                           jmp        0x7f05303ca179
01068 50                             push       rax
01069 4833c0                         xor        rax, rax
0106c f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
01072 58                             pop        rax
01073 ebbe                           jmp        0x7f05303ca133
01075 4983c201                       add        r10, 1
01079 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0107e 8b4804                         mov        ecx, dword ptr [rax + 4]
01081 48bad83a1320057f0000           movabs     rdx, 0x7f0520133ad8
0108b 4883827801000001               add        qword ptr [rdx + 0x178], 1
01093 48ba68261320057f0000           movabs     rdx, 0x7f0520132668
0109d 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
010a1 4183c002                       add        r8d, 2
010a5 44894270                       mov        dword ptr [rdx + 0x70], r8d
010a9 4181e0feff1f00                 and        r8d, 0x1ffffe
010b0 4585c0                         test       r8d, r8d
010b3 0f845f340000                   je         0x7f05303cd618
010b9 48bad83a1320057f0000           movabs     rdx, 0x7f0520133ad8
010c3 4883828801000001               add        qword ptr [rdx + 0x188], 1
010cb 8b9c24ac010000                 mov        ebx, dword ptr [rsp + 0x1ac]
010d2 4863db                         movsxd     rbx, ebx
010d5 ba08000000                     mov        edx, 8
010da 4c8bcb                         mov        r9, rbx
010dd 4c03ca                         add        r9, rdx
010e0 48ba50181320057f0000           movabs     rdx, 0x7f0520131850
010ea 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
010ee 4183c002                       add        r8d, 2
010f2 44894270                       mov        dword ptr [rdx + 0x70], r8d
010f6 4181e0feff1f00                 and        r8d, 0x1ffffe
010fd 4585c0                         test       r8d, r8d
01100 0f8433340000                   je         0x7f05303cd639
01106 48ba50181320057f0000           movabs     rdx, 0x7f0520131850
01110 488382d800000001               add        qword ptr [rdx + 0xd8], 1
01118 48bac8191320057f0000           movabs     rdx, 0x7f05201319c8
01122 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01126 4183c002                       add        r8d, 2
0112a 44894270                       mov        dword ptr [rdx + 0x70], r8d
0112e 4181e0feff1f00                 and        r8d, 0x1ffffe
01135 4585c0                         test       r8d, r8d
01138 0f841c340000                   je         0x7f05303cd65a
0113e 48bad83a1320057f0000           movabs     rdx, 0x7f0520133ad8
01148 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
01150 48ba68372ee300000000           movabs     rdx, 0xe32e3768
0115a ba02000000                     mov        edx, 2
0115f 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
01167 bf00000000                     mov        edi, 0
0116c 488b8424b0010000               mov        rax, qword ptr [rsp + 0x1b0]
01174 48890424                       mov        qword ptr [rsp], rax
01178 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
01180 4889442408                     mov        qword ptr [rsp + 8], rax
01185 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
0118a 49ba68372ee300000000           movabs     r10, 0xe32e3768
01194 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01199 660f1f440000                   nop        word ptr [rax + rax]
0119f e8bc155307                     call       0x7f05378fb860
011a4 0f1f84009c120005               nop        dword ptr [rax + rax + 0x500129c]
011ac 48be88644320057f0000           movabs     rsi, 0x7f0520436488
011b6 ff86c8040000                   inc        dword ptr [rsi + 0x4c8]
011bc e9dd0b0000                     jmp        0x7f05303cae9e
011c1 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
011c8 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
011d0 83ff30                         cmp        edi, 0x30
011d3 48be88644320057f0000           movabs     rsi, 0x7f0520436488
011dd bae0040000                     mov        edx, 0x4e0
011e2 7f05                           jg         0x7f05303ca2e9
011e4 baf0040000                     mov        edx, 0x4f0
011e9 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
011ed 488d4901                       lea        rcx, [rcx + 1]
011f1 48890c16                       mov        qword ptr [rsi + rdx], rcx
011f5 0f8ffe0a0000                   jg         0x7f05303cadf9
011fb 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
01202 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
0120a 660f1f440000                   nop        word ptr [rax + rax]
01210 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
01218 8b842464010000                 mov        eax, dword ptr [rsp + 0x164]
0121f 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
01227 48b988644320057f0000           movabs     rcx, 0x7f0520436488
01231 4883810005000001               add        qword ptr [rcx + 0x500], 1
01239 48b9182e1320057f0000           movabs     rcx, 0x7f0520132e18
01243 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
01247 4183c002                       add        r8d, 2
0124b 44894170                       mov        dword ptr [rcx + 0x70], r8d
0124f 4181e0feff1f00                 and        r8d, 0x1ffffe
01256 4585c0                         test       r8d, r8d
01259 0f841c330000                   je         0x7f05303cd67b
0125f 48b9b8c02ce300000000           movabs     rcx, 0xe32cc0b8
01269 49b8182e1320057f0000           movabs     r8, 0x7f0520132e18
01273 8b09                           mov        ecx, dword ptr [rcx]
01275 c1e90d                         shr        ecx, 0xd
01278 48c1e10a                       shl        rcx, 0xa
0127c 41ba00000012                   mov        r10d, 0x12000000
01282 4903ca                         add        rcx, r10
01285 41ba16000000                   mov        r10d, 0x16
0128b 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0128f 7436                           je         0x7f05303ca3c7
01291 4983c202                       add        r10, 2
01295 4983fa1a                       cmp        r10, 0x1a
01299 75f0                           jne        0x7f05303ca38b
0129b 41ba16000000                   mov        r10d, 0x16
012a1 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
012a6 7412                           je         0x7f05303ca3ba
012a8 4983c202                       add        r10, 2
012ac 4983fa1a                       cmp        r10, 0x1a
012b0 75ef                           jne        0x7f05303ca3a1
012b2 41ba15000000                   mov        r10d, 0x15
012b8 eb11                           jmp        0x7f05303ca3cb
012ba 50                             push       rax
012bb 4833c0                         xor        rax, rax
012be f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
012c4 58                             pop        rax
012c5 ebbe                           jmp        0x7f05303ca385
012c7 4983c201                       add        r10, 1
012cb 4b8304d001                     add        qword ptr [r8 + r10*8], 1
012d0 48b9182e1320057f0000           movabs     rcx, 0x7f0520132e18
012da 488381d800000001               add        qword ptr [rcx + 0xd8], 1
012e2 48b930241320057f0000           movabs     rcx, 0x7f0520132430
012ec 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
012f0 4183c002                       add        r8d, 2
012f4 44894170                       mov        dword ptr [rcx + 0x70], r8d
012f8 4181e0feff1f00                 and        r8d, 0x1ffffe
012ff 4585c0                         test       r8d, r8d
01302 0f8494320000                   je         0x7f05303cd69c
01308 48b930241320057f0000           movabs     rcx, 0x7f0520132430
01312 4883810801000001               add        qword ptr [rcx + 0x108], 1
0131a 488bc8                         mov        rcx, rax
0131d 83e90f                         sub        ecx, 0xf
01320 49b8001b1320057f0000           movabs     r8, 0x7f0520131b00
0132a 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
0132e 4183c102                       add        r9d, 2
01332 45894870                       mov        dword ptr [r8 + 0x70], r9d
01336 4181e1feff1f00                 and        r9d, 0x1ffffe
0133d 4585c9                         test       r9d, r9d
01340 0f8477320000                   je         0x7f05303cd6bd
01346 49b8001b1320057f0000           movabs     r8, 0x7f0520131b00
01350 498380a800000001               add        qword ptr [r8 + 0xa8], 1
01358 49b80000000000000000           movabs     r8, 0
01362 41b800000000                   mov        r8d, 0
01368 413bf0                         cmp        esi, r8d
0136b 0f8c6d320000                   jl         0x7f05303cd6de
01371 3bf1                           cmp        esi, ecx
01373 0f8d72320000                   jge        0x7f05303cd6eb
01379 488bce                         mov        rcx, rsi
0137c 898c24b8010000                 mov        dword ptr [rsp + 0x1b8], ecx
01383 49b8b8c02ce300000000           movabs     r8, 0xe32cc0b8
0138d 4d8bc8                         mov        r9, r8
01390 49be182e1320057f0000           movabs     r14, 0x7f0520132e18
0139a 458b09                         mov        r9d, dword ptr [r9]
0139d 41c1e90d                       shr        r9d, 0xd
013a1 49c1e10a                       shl        r9, 0xa
013a5 41ba00000012                   mov        r10d, 0x12000000
013ab 4d03ca                         add        r9, r10
013ae 41ba24000000                   mov        r10d, 0x24
013b4 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
013b8 7436                           je         0x7f05303ca4f0
013ba 4983c202                       add        r10, 2
013be 4983fa28                       cmp        r10, 0x28
013c2 75f0                           jne        0x7f05303ca4b4
013c4 41ba24000000                   mov        r10d, 0x24
013ca 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
013cf 7412                           je         0x7f05303ca4e3
013d1 4983c202                       add        r10, 2
013d5 4983fa28                       cmp        r10, 0x28
013d9 75ef                           jne        0x7f05303ca4ca
013db 41ba23000000                   mov        r10d, 0x23
013e1 eb11                           jmp        0x7f05303ca4f4
013e3 50                             push       rax
013e4 4833c0                         xor        rax, rax
013e7 f04f0fb10cd6                   lock cmpxchg qword ptr [r14 + r10*8], r9
013ed 58                             pop        rax
013ee ebbe                           jmp        0x7f05303ca4ae
013f0 4983c201                       add        r10, 1
013f4 4b8304d601                     add        qword ptr [r14 + r10*8], 1
013f9 48b9001c1320057f0000           movabs     rcx, 0x7f0520131c00
01403 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
01407 4183c102                       add        r9d, 2
0140b 44894970                       mov        dword ptr [rcx + 0x70], r9d
0140f 4181e1feff1f00                 and        r9d, 0x1ffffe
01416 4585c9                         test       r9d, r9d
01419 0f84d9310000                   je         0x7f05303cd6f8
0141f 48b9001c1320057f0000           movabs     rcx, 0x7f0520131c00
01429 488381a800000001               add        qword ptr [rcx + 0xa8], 1
01431 48b9281d1320057f0000           movabs     rcx, 0x7f0520131d28
0143b 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
0143f 4183c002                       add        r8d, 2
01443 44894170                       mov        dword ptr [rcx + 0x70], r8d
01447 4181e0feff1f00                 and        r8d, 0x1ffffe
0144e 4585c0                         test       r8d, r8d
01451 0f84c2310000                   je         0x7f05303cd719
01457 48b9281d1320057f0000           movabs     rcx, 0x7f0520131d28
01461 ff81b8000000                   inc        dword ptr [rcx + 0xb8]
01467 8b8c24b8010000                 mov        ecx, dword ptr [rsp + 0x1b8]
0146e 89b424c0010000                 mov        dword ptr [rsp + 0x1c0], esi
01475 49b8b0402de300000000           movabs     r8, 0xe32d40b0
0147f 4d8bc8                         mov        r9, r8
01482 49be182e1320057f0000           movabs     r14, 0x7f0520132e18
0148c 4983865801000001               add        qword ptr [r14 + 0x158], 1
01494 49b9e02f1320057f0000           movabs     r9, 0x7f0520132fe0
0149e 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
014a2 83c302                         add        ebx, 2
014a5 41895970                       mov        dword ptr [r9 + 0x70], ebx
014a9 81e3feff1f00                   and        ebx, 0x1ffffe
014af 85db                           test       ebx, ebx
014b1 0f8483310000                   je         0x7f05303cd73a
014b7 4d8bc8                         mov        r9, r8
014ba 48bbe02f1320057f0000           movabs     rbx, 0x7f0520132fe0
014c4 488383a800000001               add        qword ptr [rbx + 0xa8], 1
014cc 49b9c0301320057f0000           movabs     r9, 0x7f05201330c0
014d6 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
014da 83c302                         add        ebx, 2
014dd 41895970                       mov        dword ptr [r9 + 0x70], ebx
014e1 81e3feff1f00                   and        ebx, 0x1ffffe
014e7 85db                           test       ebx, ebx
014e9 0f846c310000                   je         0x7f05303cd75b
014ef 49b9c0301320057f0000           movabs     r9, 0x7f05201330c0
014f9 498381b800000001               add        qword ptr [r9 + 0xb8], 1
01501 49b8a8251320057f0000           movabs     r8, 0x7f05201325a8
0150b 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
0150f 4183c102                       add        r9d, 2
01513 45894870                       mov        dword ptr [r8 + 0x70], r9d
01517 4181e1feff1f00                 and        r9d, 0x1ffffe
0151e 4585c9                         test       r9d, r9d
01521 0f8455310000                   je         0x7f05303cd77c
01527 49b8b8c02ce300000000           movabs     r8, 0xe32cc0b8
01531 4d8bc8                         mov        r9, r8
01534 48bbc0301320057f0000           movabs     rbx, 0x7f05201330c0
0153e 458b09                         mov        r9d, dword ptr [r9]
01541 41c1e90d                       shr        r9d, 0xd
01545 49c1e10a                       shl        r9, 0xa
01549 41ba00000012                   mov        r10d, 0x12000000
0154f 4d03ca                         add        r9, r10
01552 41ba1c000000                   mov        r10d, 0x1c
01558 4e3b0cd3                       cmp        r9, qword ptr [rbx + r10*8]
0155c 7436                           je         0x7f05303ca694
0155e 4983c202                       add        r10, 2
01562 4983fa20                       cmp        r10, 0x20
01566 75f0                           jne        0x7f05303ca658
01568 41ba1c000000                   mov        r10d, 0x1c
0156e 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01573 7412                           je         0x7f05303ca687
01575 4983c202                       add        r10, 2
01579 4983fa20                       cmp        r10, 0x20
0157d 75ef                           jne        0x7f05303ca66e
0157f 41ba1b000000                   mov        r10d, 0x1b
01585 eb11                           jmp        0x7f05303ca698
01587 50                             push       rax
01588 4833c0                         xor        rax, rax
0158b f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
01591 58                             pop        rax
01592 ebbe                           jmp        0x7f05303ca652
01594 4983c201                       add        r10, 1
01598 4a8304d301                     add        qword ptr [rbx + r10*8], 1
0159d 49b9c0301320057f0000           movabs     r9, 0x7f05201330c0
015a7 458b00                         mov        r8d, dword ptr [r8]
015aa 41c1e80d                       shr        r8d, 0xd
015ae 49c1e00a                       shl        r8, 0xa
015b2 41ba00000012                   mov        r10d, 0x12000000
015b8 4d03c2                         add        r8, r10
015bb 41ba22000000                   mov        r10d, 0x22
015c1 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
015c5 7436                           je         0x7f05303ca6fd
015c7 4983c202                       add        r10, 2
015cb 4983fa26                       cmp        r10, 0x26
015cf 75f0                           jne        0x7f05303ca6c1
015d1 41ba22000000                   mov        r10d, 0x22
015d7 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
015dc 7412                           je         0x7f05303ca6f0
015de 4983c202                       add        r10, 2
015e2 4983fa26                       cmp        r10, 0x26
015e6 75ef                           jne        0x7f05303ca6d7
015e8 41ba21000000                   mov        r10d, 0x21
015ee eb11                           jmp        0x7f05303ca701
015f0 50                             push       rax
015f1 4833c0                         xor        rax, rax
015f4 f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
015fa 58                             pop        rax
015fb ebbe                           jmp        0x7f05303ca6bb
015fd 4983c201                       add        r10, 1
01601 4b8304d101                     add        qword ptr [r9 + r10*8], 1
01606 49b8c0301320057f0000           movabs     r8, 0x7f05201330c0
01610 4983803801000001               add        qword ptr [r8 + 0x138], 1
01618 49b868261320057f0000           movabs     r8, 0x7f0520132668
01622 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
01626 4183c102                       add        r9d, 2
0162a 45894870                       mov        dword ptr [r8 + 0x70], r9d
0162e 4181e1feff1f00                 and        r9d, 0x1ffffe
01635 4585c9                         test       r9d, r9d
01638 0f845f300000                   je         0x7f05303cd79d
0163e 49b8c0301320057f0000           movabs     r8, 0x7f05201330c0
01648 4983804801000001               add        qword ptr [r8 + 0x148], 1
01650 4863d9                         movsxd     rbx, ecx
01653 b908000000                     mov        ecx, 8
01658 4c8bcb                         mov        r9, rbx
0165b 4c03c9                         add        r9, rcx
0165e 48b950181320057f0000           movabs     rcx, 0x7f0520131850
01668 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
0166c 4183c002                       add        r8d, 2
01670 44894170                       mov        dword ptr [rcx + 0x70], r8d
01674 4181e0feff1f00                 and        r8d, 0x1ffffe
0167b 4585c0                         test       r8d, r8d
0167e 0f843a300000                   je         0x7f05303cd7be
01684 48b950181320057f0000           movabs     rcx, 0x7f0520131850
0168e 488381d800000001               add        qword ptr [rcx + 0xd8], 1
01696 48b9c8191320057f0000           movabs     rcx, 0x7f05201319c8
016a0 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
016a4 4183c002                       add        r8d, 2
016a8 44894170                       mov        dword ptr [rcx + 0x70], r8d
016ac 4181e0feff1f00                 and        r8d, 0x1ffffe
016b3 4585c0                         test       r8d, r8d
016b6 0f8423300000                   je         0x7f05303cd7df
016bc 48b9c0301320057f0000           movabs     rcx, 0x7f05201330c0
016c6 4883816801000001               add        qword ptr [rcx + 0x168], 1
016ce 48b980992de300000000           movabs     rcx, 0xe32d9980
016d8 48be00c12ce300000000           movabs     rsi, 0xe32cc100
016e2 4c8bc2                         mov        r8, rdx
016e5 ba02000000                     mov        edx, 2
016ea b910000000                     mov        ecx, 0x10
016ef 498bc0                         mov        rax, r8
016f2 4c8bc0                         mov        r8, rax
016f5 bf00000000                     mov        edi, 0
016fa 48890424                       mov        qword ptr [rsp], rax
016fe 48895c2408                     mov        qword ptr [rsp + 8], rbx
01703 49bab8c02ce300000000           movabs     r10, 0xe32cc0b8
0170d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01712 49ba80992de300000000           movabs     r10, 0xe32d9980
0171c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01721 660f1f440000                   nop        word ptr [rax + rax]
01727 e834105307                     call       0x7f05378fb860
0172c 0f1f840024180006               nop        dword ptr [rax + rax + 0x6001824]
01734 4885c0                         test       rax, rax
01737 48bbc0301320057f0000           movabs     rbx, 0x7f05201330c0
01741 750c                           jne        0x7f05303ca84f
01743 808b7101000001                 or         byte ptr [rbx + 0x171], 1
0174a e988000000                     jmp        0x7f05303ca8d7
0174f 8b38                           mov        edi, dword ptr [rax]
01751 c1ef0d                         shr        edi, 0xd
01754 48c1e70a                       shl        rdi, 0xa
01758 41ba00000012                   mov        r10d, 0x12000000
0175e 4903fa                         add        rdi, r10
01761 41ba30000000                   mov        r10d, 0x30
01767 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
0176b 7436                           je         0x7f05303ca8a3
0176d 4983c202                       add        r10, 2
01771 4983fa34                       cmp        r10, 0x34
01775 75f0                           jne        0x7f05303ca867
01777 41ba30000000                   mov        r10d, 0x30
0177d 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01782 7412                           je         0x7f05303ca896
01784 4983c202                       add        r10, 2
01788 4983fa34                       cmp        r10, 0x34
0178c 75ef                           jne        0x7f05303ca87d
0178e 41ba2f000000                   mov        r10d, 0x2f
01794 eb11                           jmp        0x7f05303ca8a7
01796 50                             push       rax
01797 4833c0                         xor        rax, rax
0179a f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
017a0 58                             pop        rax
017a1 ebbe                           jmp        0x7f05303ca861
017a3 4983c201                       add        r10, 1
017a7 4a8304d301                     add        qword ptr [rbx + r10*8], 1
017ac 48bf0084001300000000           movabs     rdi, 0x13008400
017b6 8b18                           mov        ebx, dword ptr [rax]
017b8 c1eb0d                         shr        ebx, 0xd
017bb 48c1e30a                       shl        rbx, 0xa
017bf 41ba00000012                   mov        r10d, 0x12000000
017c5 4903da                         add        rbx, r10
017c8 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
017cc 0f852e2f0000                   jne        0x7f05303cd800
017d2 e900000000                     jmp        0x7f05303ca8d7
017d7 488bf8                         mov        rdi, rax
017da 4889bc24c8010000               mov        qword ptr [rsp + 0x1c8], rdi
017e2 483b07                         cmp        rax, qword ptr [rdi]
017e5 488bf7                         mov        rsi, rdi
017e8 48bb88644320057f0000           movabs     rbx, 0x7f0520436488
017f2 8b36                           mov        esi, dword ptr [rsi]
017f4 c1ee0d                         shr        esi, 0xd
017f7 48c1e60a                       shl        rsi, 0xa
017fb 41ba00000012                   mov        r10d, 0x12000000
01801 4903f2                         add        rsi, r10
01804 41baa3000000                   mov        r10d, 0xa3
0180a 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
0180e 743c                           je         0x7f05303ca94c
01810 4983c202                       add        r10, 2
01814 4981faa7000000                 cmp        r10, 0xa7
0181b 75ed                           jne        0x7f05303ca90a
0181d 41baa3000000                   mov        r10d, 0xa3
01823 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01828 7415                           je         0x7f05303ca93f
0182a 4983c202                       add        r10, 2
0182e 4981faa7000000                 cmp        r10, 0xa7
01835 75ec                           jne        0x7f05303ca923
01837 41baa2000000                   mov        r10d, 0xa2
0183d eb11                           jmp        0x7f05303ca950
0183f 50                             push       rax
01840 4833c0                         xor        rax, rax
01843 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01849 58                             pop        rax
0184a ebb8                           jmp        0x7f05303ca904
0184c 4983c201                       add        r10, 1
01850 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01855 48bed83a1320057f0000           movabs     rsi, 0x7f0520133ad8
0185f 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
01862 83c302                         add        ebx, 2
01865 895e70                         mov        dword ptr [rsi + 0x70], ebx
01868 81e3feff1f00                   and        ebx, 0x1ffffe
0186e 85db                           test       ebx, ebx
01870 0f84982e0000                   je         0x7f05303cd80e
01876 488bf7                         mov        rsi, rdi
01879 48bbd83a1320057f0000           movabs     rbx, 0x7f0520133ad8
01883 8b36                           mov        esi, dword ptr [rsi]
01885 c1ee0d                         shr        esi, 0xd
01888 48c1e60a                       shl        rsi, 0xa
0188c 41ba00000012                   mov        r10d, 0x12000000
01892 4903f2                         add        rsi, r10
01895 41ba16000000                   mov        r10d, 0x16
0189b 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
0189f 7436                           je         0x7f05303ca9d7
018a1 4983c202                       add        r10, 2
018a5 4983fa1a                       cmp        r10, 0x1a
018a9 75f0                           jne        0x7f05303ca99b
018ab 41ba16000000                   mov        r10d, 0x16
018b1 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
018b6 7412                           je         0x7f05303ca9ca
018b8 4983c202                       add        r10, 2
018bc 4983fa1a                       cmp        r10, 0x1a
018c0 75ef                           jne        0x7f05303ca9b1
018c2 41ba15000000                   mov        r10d, 0x15
018c8 eb11                           jmp        0x7f05303ca9db
018ca 50                             push       rax
018cb 4833c0                         xor        rax, rax
018ce f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
018d4 58                             pop        rax
018d5 ebbe                           jmp        0x7f05303ca995
018d7 4983c201                       add        r10, 1
018db 4a8304d301                     add        qword ptr [rbx + r10*8], 1
018e0 488bf7                         mov        rsi, rdi
018e3 6690                           nop        
018e5 48b800cc190c057f0000           movabs     rax, 0x7f050c19cc00
018ef e86c095307                     call       0x7f05378fb360
018f4 0f1f8400ec190007               nop        dword ptr [rax + rax + 0x70019ec]
018fc 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
01904 8b7704                         mov        esi, dword ptr [rdi + 4]
01907 48bbd83a1320057f0000           movabs     rbx, 0x7f0520133ad8
01911 488383d800000001               add        qword ptr [rbx + 0xd8], 1
01919 48bb30241320057f0000           movabs     rbx, 0x7f0520132430
01923 8b5370                         mov        edx, dword ptr [rbx + 0x70]
01926 83c202                         add        edx, 2
01929 895370                         mov        dword ptr [rbx + 0x70], edx
0192c 81e2feff1f00                   and        edx, 0x1ffffe
01932 85d2                           test       edx, edx
01934 0f84fa2d0000                   je         0x7f05303cd834
0193a 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01942 48bb30241320057f0000           movabs     rbx, 0x7f0520132430
0194c 4883830801000001               add        qword ptr [rbx + 0x108], 1
01954 ffc8                           dec        eax
01956 2bf0                           sub        esi, eax
01958 48bb001b1320057f0000           movabs     rbx, 0x7f0520131b00
01962 8b4370                         mov        eax, dword ptr [rbx + 0x70]
01965 83c002                         add        eax, 2
01968 894370                         mov        dword ptr [rbx + 0x70], eax
0196b 25feff1f00                     and        eax, 0x1ffffe
01970 85c0                           test       eax, eax
01972 0f84dd2d0000                   je         0x7f05303cd855
01978 48bb001b1320057f0000           movabs     rbx, 0x7f0520131b00
01982 488383a800000001               add        qword ptr [rbx + 0xa8], 1
0198a 48bb0000000000000000           movabs     rbx, 0
01994 bb00000000                     mov        ebx, 0
01999 443bdb                         cmp        r11d, ebx
0199c 0f8cd42d0000                   jl         0x7f05303cd876
019a2 443bde                         cmp        r11d, esi
019a5 0f8dd82d0000                   jge        0x7f05303cd883
019ab 498bdb                         mov        rbx, r11
019ae 899c24c4010000                 mov        dword ptr [rsp + 0x1c4], ebx
019b5 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
019bd 488bbc24c8010000               mov        rdi, qword ptr [rsp + 0x1c8]
019c5 488bf7                         mov        rsi, rdi
019c8 48bad83a1320057f0000           movabs     rdx, 0x7f0520133ad8
019d2 8b36                           mov        esi, dword ptr [rsi]
019d4 c1ee0d                         shr        esi, 0xd
019d7 48c1e60a                       shl        rsi, 0xa
019db 41ba00000012                   mov        r10d, 0x12000000
019e1 4903f2                         add        rsi, r10
019e4 41ba1e000000                   mov        r10d, 0x1e
019ea 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
019ee 7436                           je         0x7f05303cab26
019f0 4983c202                       add        r10, 2
019f4 4983fa22                       cmp        r10, 0x22
019f8 75f0                           jne        0x7f05303caaea
019fa 41ba1e000000                   mov        r10d, 0x1e
01a00 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01a05 7412                           je         0x7f05303cab19
01a07 4983c202                       add        r10, 2
01a0b 4983fa22                       cmp        r10, 0x22
01a0f 75ef                           jne        0x7f05303cab00
01a11 41ba1d000000                   mov        r10d, 0x1d
01a17 eb11                           jmp        0x7f05303cab2a
01a19 50                             push       rax
01a1a 4833c0                         xor        rax, rax
01a1d f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01a23 58                             pop        rax
01a24 ebbe                           jmp        0x7f05303caae4
01a26 4983c201                       add        r10, 1
01a2a 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01a2f 488bf7                         mov        rsi, rdi
01a32 666690                         nop        
01a35 48b828cc190c057f0000           movabs     rax, 0x7f050c19cc28
01a3f e81c085307                     call       0x7f05378fb360
01a44 0f1f84003c1b0008               nop        dword ptr [rax + rax + 0x8001b3c]
01a4c 483b00                         cmp        rax, qword ptr [rax]
01a4f 488bf0                         mov        rsi, rax
01a52 48bad83a1320057f0000           movabs     rdx, 0x7f0520133ad8
01a5c 8b36                           mov        esi, dword ptr [rsi]
01a5e c1ee0d                         shr        esi, 0xd
01a61 48c1e60a                       shl        rsi, 0xa
01a65 41ba00000012                   mov        r10d, 0x12000000
01a6b 4903f2                         add        rsi, r10
01a6e 41ba24000000                   mov        r10d, 0x24
01a74 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01a78 7436                           je         0x7f05303cabb0
01a7a 4983c202                       add        r10, 2
01a7e 4983fa28                       cmp        r10, 0x28
01a82 75f0                           jne        0x7f05303cab74
01a84 41ba24000000                   mov        r10d, 0x24
01a8a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01a8f 7412                           je         0x7f05303caba3
01a91 4983c202                       add        r10, 2
01a95 4983fa28                       cmp        r10, 0x28
01a99 75ef                           jne        0x7f05303cab8a
01a9b 41ba23000000                   mov        r10d, 0x23
01aa1 eb11                           jmp        0x7f05303cabb4
01aa3 50                             push       rax
01aa4 4833c0                         xor        rax, rax
01aa7 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01aad 58                             pop        rax
01aae ebbe                           jmp        0x7f05303cab6e
01ab0 4983c201                       add        r10, 1
01ab4 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01ab9 8b7024                         mov        esi, dword ptr [rax + 0x24]
01abc 488bd0                         mov        rdx, rax
01abf 48b9d83a1320057f0000           movabs     rcx, 0x7f0520133ad8
01ac9 8b12                           mov        edx, dword ptr [rdx]
01acb c1ea0d                         shr        edx, 0xd
01ace 48c1e20a                       shl        rdx, 0xa
01ad2 41ba00000012                   mov        r10d, 0x12000000
01ad8 4903d2                         add        rdx, r10
01adb 41ba2a000000                   mov        r10d, 0x2a
01ae1 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01ae5 7436                           je         0x7f05303cac1d
01ae7 4983c202                       add        r10, 2
01aeb 4983fa2e                       cmp        r10, 0x2e
01aef 75f0                           jne        0x7f05303cabe1
01af1 41ba2a000000                   mov        r10d, 0x2a
01af7 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01afc 7412                           je         0x7f05303cac10
01afe 4983c202                       add        r10, 2
01b02 4983fa2e                       cmp        r10, 0x2e
01b06 75ef                           jne        0x7f05303cabf7
01b08 41ba29000000                   mov        r10d, 0x29
01b0e eb11                           jmp        0x7f05303cac21
01b10 50                             push       rax
01b11 4833c0                         xor        rax, rax
01b14 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
01b1a 58                             pop        rax
01b1b ebbe                           jmp        0x7f05303cabdb
01b1d 4983c201                       add        r10, 1
01b21 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01b26 8b4804                         mov        ecx, dword ptr [rax + 4]
01b29 48bad83a1320057f0000           movabs     rdx, 0x7f0520133ad8
01b33 4883827801000001               add        qword ptr [rdx + 0x178], 1
01b3b 48ba68261320057f0000           movabs     rdx, 0x7f0520132668
01b45 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01b49 4183c002                       add        r8d, 2
01b4d 44894270                       mov        dword ptr [rdx + 0x70], r8d
01b51 4181e0feff1f00                 and        r8d, 0x1ffffe
01b58 4585c0                         test       r8d, r8d
01b5b 0f84342c0000                   je         0x7f05303cd895
01b61 48bad83a1320057f0000           movabs     rdx, 0x7f0520133ad8
01b6b 4883828801000001               add        qword ptr [rdx + 0x188], 1
01b73 8b9c24c4010000                 mov        ebx, dword ptr [rsp + 0x1c4]
01b7a 4863db                         movsxd     rbx, ebx
01b7d ba08000000                     mov        edx, 8
01b82 4c8bcb                         mov        r9, rbx
01b85 4c03ca                         add        r9, rdx
01b88 48ba50181320057f0000           movabs     rdx, 0x7f0520131850
01b92 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01b96 4183c002                       add        r8d, 2
01b9a 44894270                       mov        dword ptr [rdx + 0x70], r8d
01b9e 4181e0feff1f00                 and        r8d, 0x1ffffe
01ba5 4585c0                         test       r8d, r8d
01ba8 0f84082c0000                   je         0x7f05303cd8b6
01bae 48ba50181320057f0000           movabs     rdx, 0x7f0520131850
01bb8 488382d800000001               add        qword ptr [rdx + 0xd8], 1
01bc0 48bac8191320057f0000           movabs     rdx, 0x7f05201319c8
01bca 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01bce 4183c002                       add        r8d, 2
01bd2 44894270                       mov        dword ptr [rdx + 0x70], r8d
01bd6 4181e0feff1f00                 and        r8d, 0x1ffffe
01bdd 4585c0                         test       r8d, r8d
01be0 0f84f12b0000                   je         0x7f05303cd8d7
01be6 48bad83a1320057f0000           movabs     rdx, 0x7f0520133ad8
01bf0 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
01bf8 48ba68372ee300000000           movabs     rdx, 0xe32e3768
01c02 ba02000000                     mov        edx, 2
01c07 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
01c0f bf00000000                     mov        edi, 0
01c14 488b8424c8010000               mov        rax, qword ptr [rsp + 0x1c8]
01c1c 48890424                       mov        qword ptr [rsp], rax
01c20 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
01c28 4889442408                     mov        qword ptr [rsp + 8], rax
01c2d 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01c32 49ba68372ee300000000           movabs     r10, 0xe32e3768
01c3c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c41 660f1f440000                   nop        word ptr [rax + rax]
01c47 e8140b5307                     call       0x7f05378fb860
01c4c 0f1f8400441d0009               nop        dword ptr [rax + rax + 0x9001d44]
01c54 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01c5c 4183c310                       add        r11d, 0x10
01c60 8bb424c0010000                 mov        esi, dword ptr [rsp + 0x1c0]
01c67 83c610                         add        esi, 0x10
01c6a 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01c72 ba02000000                     mov        edx, 2
01c77 7c05                           jl         0x7f05303cad7e
01c79 ba00000000                     mov        edx, 0
01c7e 48b988644320057f0000           movabs     rcx, 0x7f0520436488
01c88 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
01c8c 4403c2                         add        r8d, edx
01c8f 44894174                       mov        dword ptr [rcx + 0x74], r8d
01c93 85d2                           test       edx, edx
01c95 7506                           jne        0x7f05303cad9d
01c97 41b802000000                   mov        r8d, 2
01c9d 4181e0fe3f0000                 and        r8d, 0x3ffe
01ca4 4585c0                         test       r8d, r8d
01ca7 0f844b2b0000                   je         0x7f05303cd8f8
01cad 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01cb1 418502                         test       dword ptr [r10], eax
01cb4 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01cbc 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
01cc6 b940050000                     mov        ecx, 0x540
01ccb 7c05                           jl         0x7f05303cadd2
01ccd b950050000                     mov        ecx, 0x550
01cd2 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01cd6 4d8d4001                       lea        r8, [r8 + 1]
01cda 4c89040a                       mov        qword ptr [rdx + rcx], r8
01cde 0f8c2cf5ffff                   jl         0x7f05303ca310
01ce4 48be88644320057f0000           movabs     rsi, 0x7f0520436488
01cee ff8660050000                   inc        dword ptr [rsi + 0x560]
01cf4 e9a5000000                     jmp        0x7f05303cae9e
01cf9 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
01d03 4883827805000001               add        qword ptr [rdx + 0x578], 1
01d0b 488bb42468010000               mov        rsi, qword ptr [rsp + 0x168]
01d13 8b942490010000                 mov        edx, dword ptr [rsp + 0x190]
01d1a 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
01d22 448b842474010000               mov        r8d, dword ptr [rsp + 0x174]
01d2a 4c8bcf                         mov        r9, rdi
01d2d 4885c9                         test       rcx, rcx
01d30 0f84e32a0000                   je         0x7f05303cd919
01d36 85d2                           test       edx, edx
01d38 0f8cdb2a0000                   jl         0x7f05303cd919
01d3e 4585c0                         test       r8d, r8d
01d41 0f8cd22a0000                   jl         0x7f05303cd919
01d47 4a8d3c0a                       lea        rdi, [rdx + r9]
01d4b 3b7e04                         cmp        edi, dword ptr [rsi + 4]
01d4e 0f87c52a0000                   ja         0x7f05303cd919
01d54 4b8d3c08                       lea        rdi, [r8 + r9]
01d58 3b7904                         cmp        edi, dword ptr [rcx + 4]
01d5b 0f87b82a0000                   ja         0x7f05303cd919
01d61 4585c9                         test       r9d, r9d
01d64 0f8caf2a0000                   jl         0x7f05303cd919
01d6a 4863d2                         movsxd     rdx, edx
01d6d 4d63c0                         movsxd     r8, r8d
01d70 488d7c1608                     lea        rdi, [rsi + rdx + 8]
01d75 4a8d740108                     lea        rsi, [rcx + r8 + 8]
01d7a 498bd1                         mov        rdx, r9
01d7d 40f6c40f                       test       spl, 0xf
01d81 0f8412000000                   je         0x7f05303cae99
01d87 4883ec08                       sub        rsp, 8
01d8b e890a05107                     call       0x7f05378e4f20
01d90 4883c408                       add        rsp, 8
01d94 e905000000                     jmp        0x7f05303cae9e
01d99 e882a05107                     call       0x7f05378e4f20
01d9e 8bb424a4010000                 mov        esi, dword ptr [rsp + 0x1a4]
01da5 8b9c24a0010000                 mov        ebx, dword ptr [rsp + 0x1a0]
01dac 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
01db4 488bfb                         mov        rdi, rbx
01db7 2bbc24a8010000                 sub        edi, dword ptr [rsp + 0x1a8]
01dbe 4183f810                       cmp        r8d, 0x10
01dc2 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
01dcc b988050000                     mov        ecx, 0x588
01dd1 7f05                           jg         0x7f05303caed8
01dd3 b998050000                     mov        ecx, 0x598
01dd8 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
01ddc 4d8d4901                       lea        r9, [r9 + 1]
01de0 4c890c0a                       mov        qword ptr [rdx + rcx], r9
01de4 448b8c24a8010000               mov        r9d, dword ptr [rsp + 0x1a8]
01dec 0f8f2c000000                   jg         0x7f05303caf1e
01df2 4183f910                       cmp        r9d, 0x10
01df6 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
01e00 b9b8050000                     mov        ecx, 0x5b8
01e05 7d05                           jge        0x7f05303caf0c
01e07 b9a8050000                     mov        ecx, 0x5a8
01e0c 488b040a                       mov        rax, qword ptr [rdx + rcx]
01e10 488d4001                       lea        rax, [rax + 1]
01e14 4889040a                       mov        qword ptr [rdx + rcx], rax
01e18 0f8da6150000                   jge        0x7f05303cc4c4
01e1e 453bc8                         cmp        r9d, r8d
01e21 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
01e2b b920060000                     mov        ecx, 0x620
01e30 7c05                           jl         0x7f05303caf37
01e32 b930060000                     mov        ecx, 0x630
01e37 488b040a                       mov        rax, qword ptr [rdx + rcx]
01e3b 488d4001                       lea        rax, [rax + 1]
01e3f 4889040a                       mov        qword ptr [rdx + rcx], rax
01e43 0f8c84050000                   jl         0x7f05303cb4cd
01e49 4183f830                       cmp        r8d, 0x30
01e4d 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
01e57 b940060000                     mov        ecx, 0x640
01e5c 7e05                           jle        0x7f05303caf63
01e5e b950060000                     mov        ecx, 0x650
01e63 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
01e67 4d8d4901                       lea        r9, [r9 + 1]
01e6b 4c890c0a                       mov        qword ptr [rdx + rcx], r9
01e6f 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
01e76 0f8ec4000000                   jle        0x7f05303cb040
01e7c 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
01e86 4883826006000001               add        qword ptr [rdx + 0x660], 1
01e8e 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
01e96 488bd7                         mov        rdx, rdi
01e99 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
01ea1 498bf8                         mov        rdi, r8
01ea4 4c8bc3                         mov        r8, rbx
01ea7 4c8bcf                         mov        r9, rdi
01eaa 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
01eb1 4885f6                         test       rsi, rsi
01eb4 0f846f290000                   je         0x7f05303cd929
01eba 4885c9                         test       rcx, rcx
01ebd 0f8466290000                   je         0x7f05303cd929
01ec3 85d2                           test       edx, edx
01ec5 0f8c5e290000                   jl         0x7f05303cd929
01ecb 4585c0                         test       r8d, r8d
01ece 0f8c55290000                   jl         0x7f05303cd929
01ed4 4a8d3c0a                       lea        rdi, [rdx + r9]
01ed8 3b7e04                         cmp        edi, dword ptr [rsi + 4]
01edb 0f8748290000                   ja         0x7f05303cd929
01ee1 4b8d3c08                       lea        rdi, [r8 + r9]
01ee5 3b7904                         cmp        edi, dword ptr [rcx + 4]
01ee8 0f873b290000                   ja         0x7f05303cd929
01eee 4585c9                         test       r9d, r9d
01ef1 0f8c32290000                   jl         0x7f05303cd929
01ef7 4863d2                         movsxd     rdx, edx
01efa 4d63c0                         movsxd     r8, r8d
01efd 488d7c1608                     lea        rdi, [rsi + rdx + 8]
01f02 4a8d740108                     lea        rsi, [rcx + r8 + 8]
01f07 498bd1                         mov        rdx, r9
01f0a 40f6c40f                       test       spl, 0xf
01f0e 0f8412000000                   je         0x7f05303cb026
01f14 4883ec08                       sub        rsp, 8
01f18 e8039f5107                     call       0x7f05378e4f20
01f1d 4883c408                       add        rsp, 8
01f21 e905000000                     jmp        0x7f05303cb02b
01f26 e8f59e5107                     call       0x7f05378e4f20
01f2b 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
01f35 ff8270060000                   inc        dword ptr [rdx + 0x670]
01f3b e96a040000                     jmp        0x7f05303cb4aa
01f40 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
01f47 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
01f4e 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
01f55 899c24e0010000                 mov        dword ptr [rsp + 0x1e0], ebx
01f5c 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
01f63 0f1f440000                     nop        dword ptr [rax + rax]
01f68 898424d8010000                 mov        dword ptr [rsp + 0x1d8], eax
01f6f 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
01f77 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
01f81 4883828806000001               add        qword ptr [rdx + 0x688], 1
01f89 48ba186a041300000000           movabs     rdx, 0x13046a18
01f93 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
01f96 83c102                         add        ecx, 2
01f99 894a70                         mov        dword ptr [rdx + 0x70], ecx
01f9c 81e1feff1f00                   and        ecx, 0x1ffffe
01fa2 85c9                           test       ecx, ecx
01fa4 0f848f280000                   je         0x7f05303cd939
01faa 48ba186a041300000000           movabs     rdx, 0x13046a18
01fb4 488d92d8000000                 lea        rdx, [rdx + 0xd8]
01fbb 4885c0                         test       rax, rax
01fbe 750c                           jne        0x7f05303cb0cc
01fc0 f6420801                       test       byte ptr [rdx + 8], 1
01fc4 7506                           jne        0x7f05303cb0cc
01fc6 f048834a0801                   lock or    qword ptr [rdx + 8], 1
01fcc 48bae0680420057f0000           movabs     rdx, 0x7f05200468e0
01fd6 488d9240030000                 lea        rdx, [rdx + 0x340]
01fdd 4885c0                         test       rax, rax
01fe0 750c                           jne        0x7f05303cb0ee
01fe2 f6421001                       test       byte ptr [rdx + 0x10], 1
01fe6 7506                           jne        0x7f05303cb0ee
01fe8 f048834a1001                   lock or    qword ptr [rdx + 0x10], 1
01fee 48ba186a041300000000           movabs     rdx, 0x13046a18
01ff8 488382a800000001               add        qword ptr [rdx + 0xa8], 1
02000 48bae0680420057f0000           movabs     rdx, 0x7f05200468e0
0200a 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0200d 83c102                         add        ecx, 2
02010 894a70                         mov        dword ptr [rdx + 0x70], ecx
02013 81e1feff1f00                   and        ecx, 0x1ffffe
02019 85c9                           test       ecx, ecx
0201b 0f8439280000                   je         0x7f05303cd95a
02021 48baa8b827e300000000           movabs     rdx, 0xe327b8a8
0202b 48b9e0680420057f0000           movabs     rcx, 0x7f05200468e0
02035 8b12                           mov        edx, dword ptr [rdx]
02037 c1ea0d                         shr        edx, 0xd
0203a 48c1e20a                       shl        rdx, 0xa
0203e 41ba00000012                   mov        r10d, 0x12000000
02044 4903d2                         add        rdx, r10
02047 41ba16000000                   mov        r10d, 0x16
0204d 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02051 7436                           je         0x7f05303cb189
02053 4983c202                       add        r10, 2
02057 4983fa1a                       cmp        r10, 0x1a
0205b 75f0                           jne        0x7f05303cb14d
0205d 41ba16000000                   mov        r10d, 0x16
02063 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02068 7412                           je         0x7f05303cb17c
0206a 4983c202                       add        r10, 2
0206e 4983fa1a                       cmp        r10, 0x1a
02072 75ef                           jne        0x7f05303cb163
02074 41ba15000000                   mov        r10d, 0x15
0207a eb11                           jmp        0x7f05303cb18d
0207c 50                             push       rax
0207d 4833c0                         xor        rax, rax
02080 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02086 58                             pop        rax
02087 ebbe                           jmp        0x7f05303cb147
02089 4983c201                       add        r10, 1
0208d 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02092 48bae0600420057f0000           movabs     rdx, 0x7f05200460e0
0209c 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0209f 83c102                         add        ecx, 2
020a2 894a70                         mov        dword ptr [rdx + 0x70], ecx
020a5 81e1feff1f00                   and        ecx, 0x1ffffe
020ab 85c9                           test       ecx, ecx
020ad 0f84c8270000                   je         0x7f05303cd97b
020b3 48bae0600420057f0000           movabs     rdx, 0x7f05200460e0
020bd ff82a8000000                   inc        dword ptr [rdx + 0xa8]
020c3 48bae0680420057f0000           movabs     rdx, 0x7f05200468e0
020cd ff8200010000                   inc        dword ptr [rdx + 0x100]
020d3 48bae0680420057f0000           movabs     rdx, 0x7f05200468e0
020dd ff8220010000                   inc        dword ptr [rdx + 0x120]
020e3 48ba60b127e300000000           movabs     rdx, 0xe327b160
020ed 48b9e0680420057f0000           movabs     rcx, 0x7f05200468e0
020f7 8b12                           mov        edx, dword ptr [rdx]
020f9 c1ea0d                         shr        edx, 0xd
020fc 48c1e20a                       shl        rdx, 0xa
02100 41ba00000012                   mov        r10d, 0x12000000
02106 4903d2                         add        rdx, r10
02109 41ba27000000                   mov        r10d, 0x27
0210f 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02113 7436                           je         0x7f05303cb24b
02115 4983c202                       add        r10, 2
02119 4983fa2b                       cmp        r10, 0x2b
0211d 75f0                           jne        0x7f05303cb20f
0211f 41ba27000000                   mov        r10d, 0x27
02125 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0212a 7412                           je         0x7f05303cb23e
0212c 4983c202                       add        r10, 2
02130 4983fa2b                       cmp        r10, 0x2b
02134 75ef                           jne        0x7f05303cb225
02136 41ba26000000                   mov        r10d, 0x26
0213c eb11                           jmp        0x7f05303cb24f
0213e 50                             push       rax
0213f 4833c0                         xor        rax, rax
02142 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02148 58                             pop        rax
02149 ebbe                           jmp        0x7f05303cb209
0214b 4983c201                       add        r10, 1
0214f 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02154 48ba70660420057f0000           movabs     rdx, 0x7f0520046670
0215e 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02161 83c102                         add        ecx, 2
02164 894a70                         mov        dword ptr [rdx + 0x70], ecx
02167 81e1feff1f00                   and        ecx, 0x1ffffe
0216d 85c9                           test       ecx, ecx
0216f 0f8427270000                   je         0x7f05303cd99c
02175 48ba70660420057f0000           movabs     rdx, 0x7f0520046670
0217f ff82a8000000                   inc        dword ptr [rdx + 0xa8]
02185 48bae0680420057f0000           movabs     rdx, 0x7f05200468e0
0218f 488d9280010000                 lea        rdx, [rdx + 0x180]
02196 4885c0                         test       rax, rax
02199 750c                           jne        0x7f05303cb2a7
0219b f6421801                       test       byte ptr [rdx + 0x18], 1
0219f 7506                           jne        0x7f05303cb2a7
021a1 f048834a1801                   lock or    qword ptr [rdx + 0x18], 1
021a7 48bae0680420057f0000           movabs     rdx, 0x7f05200468e0
021b1 4883827001000001               add        qword ptr [rdx + 0x170], 1
021b9 48ba386c0420057f0000           movabs     rdx, 0x7f0520046c38
021c3 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
021c6 83c102                         add        ecx, 2
021c9 894a70                         mov        dword ptr [rdx + 0x70], ecx
021cc 81e1feff1f00                   and        ecx, 0x1ffffe
021d2 85c9                           test       ecx, ecx
021d4 0f84e3260000                   je         0x7f05303cd9bd
021da 48ba386c0420057f0000           movabs     rdx, 0x7f0520046c38
021e4 4883820801000001               add        qword ptr [rdx + 0x108], 1
021ec 48bae86d0420057f0000           movabs     rdx, 0x7f0520046de8
021f6 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
021f9 83c102                         add        ecx, 2
021fc 894a70                         mov        dword ptr [rdx + 0x70], ecx
021ff 81e1feff1f00                   and        ecx, 0x1ffffe
02205 85c9                           test       ecx, ecx
02207 0f84d1260000                   je         0x7f05303cd9de
0220d 8b5004                         mov        edx, dword ptr [rax + 4]
02210 48b9e86d0420057f0000           movabs     rcx, 0x7f0520046de8
0221a 488381a800000001               add        qword ptr [rcx + 0xa8], 1
02222 83ea07                         sub        edx, 7
02225 48b9881823e200000000           movabs     rcx, 0xe2231888
0222f b900000000                     mov        ecx, 0
02234 3bf9                           cmp        edi, ecx
02236 0f8cc8260000                   jl         0x7f05303cda04
0223c 3bfa                           cmp        edi, edx
0223e 0f8dcd260000                   jge        0x7f05303cda11
02244 488bd7                         mov        rdx, rdi
02247 48be28c122e200000000           movabs     rsi, 0xe222c128
02251 488bce                         mov        rcx, rsi
02254 49b8386c0420057f0000           movabs     r8, 0x7f0520046c38
0225e 8b09                           mov        ecx, dword ptr [rcx]
02260 c1e90d                         shr        ecx, 0xd
02263 48c1e10a                       shl        rcx, 0xa
02267 41ba00000012                   mov        r10d, 0x12000000
0226d 4903ca                         add        rcx, r10
02270 41ba24000000                   mov        r10d, 0x24
02276 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0227a 7436                           je         0x7f05303cb3b2
0227c 4983c202                       add        r10, 2
02280 4983fa28                       cmp        r10, 0x28
02284 75f0                           jne        0x7f05303cb376
02286 41ba24000000                   mov        r10d, 0x24
0228c 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
02291 7412                           je         0x7f05303cb3a5
02293 4983c202                       add        r10, 2
02297 4983fa28                       cmp        r10, 0x28
0229b 75ef                           jne        0x7f05303cb38c
0229d 41ba23000000                   mov        r10d, 0x23
022a3 eb11                           jmp        0x7f05303cb3b6
022a5 50                             push       rax
022a6 4833c0                         xor        rax, rax
022a9 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
022af 58                             pop        rax
022b0 ebbe                           jmp        0x7f05303cb370
022b2 4983c201                       add        r10, 1
022b6 4b8304d001                     add        qword ptr [r8 + r10*8], 1
022bb 4863d2                         movsxd     rdx, edx
022be 488bca                         mov        rcx, rdx
022c1 41ba08000000                   mov        r10d, 8
022c7 4903ca                         add        rcx, r10
022ca 488bd0                         mov        rdx, rax
022cd 41b800000000                   mov        r8d, 0
022d3 89bc24dc010000                 mov        dword ptr [rsp + 0x1dc], edi
022da 0f1f440000                     nop        dword ptr [rax + rax]
022df e87cfa5207                     call       0x7f05378fae60
022e4 0f1f8400dc23000b               nop        dword ptr [rax + rax + 0xb0023dc]
022ec 48be88644320057f0000           movabs     rsi, 0x7f0520436488
022f6 4883869806000001               add        qword ptr [rsi + 0x698], 1
022fe 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
02306 8b9424d8010000                 mov        edx, dword ptr [rsp + 0x1d8]
0230d 488bc8                         mov        rcx, rax
02310 0f1f8000000000                 nop        dword ptr [rax]
02317 e844045307                     call       0x7f05378fb860
0231c 0f1f84001424000c               nop        dword ptr [rax + rax + 0xc002414]
02324 8b8424d8010000                 mov        eax, dword ptr [rsp + 0x1d8]
0232b 83c008                         add        eax, 8
0232e 8bbc24dc010000                 mov        edi, dword ptr [rsp + 0x1dc]
02335 83c708                         add        edi, 8
02338 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
0233f be02000000                     mov        esi, 2
02344 7c05                           jl         0x7f05303cb44b
02346 be00000000                     mov        esi, 0
0234b 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
02355 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
02358 03ce                           add        ecx, esi
0235a 894a74                         mov        dword ptr [rdx + 0x74], ecx
0235d 85f6                           test       esi, esi
0235f 7505                           jne        0x7f05303cb466
02361 b902000000                     mov        ecx, 2
02366 81e1fe3f0000                   and        ecx, 0x3ffe
0236c 85c9                           test       ecx, ecx
0236e 0f84aa250000                   je         0x7f05303cda1e
02374 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02378 418502                         test       dword ptr [r10], eax
0237b 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
02382 48be88644320057f0000           movabs     rsi, 0x7f0520436488
0238c baa8060000                     mov        edx, 0x6a8
02391 7c05                           jl         0x7f05303cb498
02393 bab8060000                     mov        edx, 0x6b8
02398 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0239c 488d4901                       lea        rcx, [rcx + 1]
023a0 48890c16                       mov        qword ptr [rsi + rdx], rcx
023a4 0f8cbefbffff                   jl         0x7f05303cb068
023aa 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
023b1 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
023b8 48be88644320057f0000           movabs     rsi, 0x7f0520436488
023c2 ff86c8060000                   inc        dword ptr [rsi + 0x6c8]
023c8 e9011a0000                     jmp        0x7f05303ccece
023cd 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
023d4 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
023db 4183f910                       cmp        r9d, 0x10
023df 48be88644320057f0000           movabs     rsi, 0x7f0520436488
023e9 bae0060000                     mov        edx, 0x6e0
023ee 7c05                           jl         0x7f05303cb4f5
023f0 baf0060000                     mov        edx, 0x6f0
023f5 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
023f9 488d4901                       lea        rcx, [rcx + 1]
023fd 48890c16                       mov        qword ptr [rsi + rdx], rcx
02401 0f8ccd0a0000                   jl         0x7f05303cbfd4
02407 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
0240e 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
02415 899c24f0010000                 mov        dword ptr [rsp + 0x1f0], ebx
0241c 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
02423 0f1f440000                     nop        dword ptr [rax + rax]
02428 898424ec010000                 mov        dword ptr [rsp + 0x1ec], eax
0242f 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
02437 48be88644320057f0000           movabs     rsi, 0x7f0520436488
02441 4883860007000001               add        qword ptr [rsi + 0x700], 1
02449 48be182e1320057f0000           movabs     rsi, 0x7f0520132e18
02453 8b5670                         mov        edx, dword ptr [rsi + 0x70]
02456 83c202                         add        edx, 2
02459 895670                         mov        dword ptr [rsi + 0x70], edx
0245c 81e2feff1f00                   and        edx, 0x1ffffe
02462 85d2                           test       edx, edx
02464 0f84d5240000                   je         0x7f05303cda3f
0246a 48beb8c02ce300000000           movabs     rsi, 0xe32cc0b8
02474 48ba182e1320057f0000           movabs     rdx, 0x7f0520132e18
0247e 8b36                           mov        esi, dword ptr [rsi]
02480 c1ee0d                         shr        esi, 0xd
02483 48c1e60a                       shl        rsi, 0xa
02487 41ba00000012                   mov        r10d, 0x12000000
0248d 4903f2                         add        rsi, r10
02490 41ba16000000                   mov        r10d, 0x16
02496 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
0249a 7436                           je         0x7f05303cb5d2
0249c 4983c202                       add        r10, 2
024a0 4983fa1a                       cmp        r10, 0x1a
024a4 75f0                           jne        0x7f05303cb596
024a6 41ba16000000                   mov        r10d, 0x16
024ac 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
024b1 7412                           je         0x7f05303cb5c5
024b3 4983c202                       add        r10, 2
024b7 4983fa1a                       cmp        r10, 0x1a
024bb 75ef                           jne        0x7f05303cb5ac
024bd 41ba15000000                   mov        r10d, 0x15
024c3 eb11                           jmp        0x7f05303cb5d6
024c5 50                             push       rax
024c6 4833c0                         xor        rax, rax
024c9 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
024cf 58                             pop        rax
024d0 ebbe                           jmp        0x7f05303cb590
024d2 4983c201                       add        r10, 1
024d6 4a8304d201                     add        qword ptr [rdx + r10*8], 1
024db 448b6804                       mov        r13d, dword ptr [rax + 4]
024df 48be182e1320057f0000           movabs     rsi, 0x7f0520132e18
024e9 488386d800000001               add        qword ptr [rsi + 0xd8], 1
024f1 48be30241320057f0000           movabs     rsi, 0x7f0520132430
024fb 8b5670                         mov        edx, dword ptr [rsi + 0x70]
024fe 83c202                         add        edx, 2
02501 895670                         mov        dword ptr [rsi + 0x70], edx
02504 81e2feff1f00                   and        edx, 0x1ffffe
0250a 85d2                           test       edx, edx
0250c 0f8453240000                   je         0x7f05303cda65
02512 48be30241320057f0000           movabs     rsi, 0x7f0520132430
0251c 4883860801000001               add        qword ptr [rsi + 0x108], 1
02524 498bf5                         mov        rsi, r13
02527 83ee0f                         sub        esi, 0xf
0252a 48ba001b1320057f0000           movabs     rdx, 0x7f0520131b00
02534 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02537 83c102                         add        ecx, 2
0253a 894a70                         mov        dword ptr [rdx + 0x70], ecx
0253d 81e1feff1f00                   and        ecx, 0x1ffffe
02543 85c9                           test       ecx, ecx
02545 0f843b240000                   je         0x7f05303cda86
0254b 48ba001b1320057f0000           movabs     rdx, 0x7f0520131b00
02555 488382a800000001               add        qword ptr [rdx + 0xa8], 1
0255d 48ba0000000000000000           movabs     rdx, 0
02567 ba00000000                     mov        edx, 0
0256c 3bfa                           cmp        edi, edx
0256e 0f8c33240000                   jl         0x7f05303cdaa7
02574 3bfe                           cmp        edi, esi
02576 0f8d38240000                   jge        0x7f05303cdab4
0257c 488bf7                         mov        rsi, rdi
0257f 48bab8c02ce300000000           movabs     rdx, 0xe32cc0b8
02589 488bca                         mov        rcx, rdx
0258c 49b8182e1320057f0000           movabs     r8, 0x7f0520132e18
02596 8b09                           mov        ecx, dword ptr [rcx]
02598 c1e90d                         shr        ecx, 0xd
0259b 48c1e10a                       shl        rcx, 0xa
0259f 41ba00000012                   mov        r10d, 0x12000000
025a5 4903ca                         add        rcx, r10
025a8 41ba24000000                   mov        r10d, 0x24
025ae 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
025b2 7436                           je         0x7f05303cb6ea
025b4 4983c202                       add        r10, 2
025b8 4983fa28                       cmp        r10, 0x28
025bc 75f0                           jne        0x7f05303cb6ae
025be 41ba24000000                   mov        r10d, 0x24
025c4 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
025c9 7412                           je         0x7f05303cb6dd
025cb 4983c202                       add        r10, 2
025cf 4983fa28                       cmp        r10, 0x28
025d3 75ef                           jne        0x7f05303cb6c4
025d5 41ba23000000                   mov        r10d, 0x23
025db eb11                           jmp        0x7f05303cb6ee
025dd 50                             push       rax
025de 4833c0                         xor        rax, rax
025e1 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
025e7 58                             pop        rax
025e8 ebbe                           jmp        0x7f05303cb6a8
025ea 4983c201                       add        r10, 1
025ee 4b8304d001                     add        qword ptr [r8 + r10*8], 1
025f3 48b9001c1320057f0000           movabs     rcx, 0x7f0520131c00
025fd 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
02601 4183c002                       add        r8d, 2
02605 44894170                       mov        dword ptr [rcx + 0x70], r8d
02609 4181e0feff1f00                 and        r8d, 0x1ffffe
02610 4585c0                         test       r8d, r8d
02613 0f84a8230000                   je         0x7f05303cdac1
02619 48b9001c1320057f0000           movabs     rcx, 0x7f0520131c00
02623 488381a800000001               add        qword ptr [rcx + 0xa8], 1
0262b 48ba281d1320057f0000           movabs     rdx, 0x7f0520131d28
02635 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02638 83c102                         add        ecx, 2
0263b 894a70                         mov        dword ptr [rdx + 0x70], ecx
0263e 81e1feff1f00                   and        ecx, 0x1ffffe
02644 85c9                           test       ecx, ecx
02646 0f8496230000                   je         0x7f05303cdae2
0264c 48ba281d1320057f0000           movabs     rdx, 0x7f0520131d28
02656 ff82b8000000                   inc        dword ptr [rdx + 0xb8]
0265c 4489ac24e8010000               mov        dword ptr [rsp + 0x1e8], r13d
02664 89bc24e4010000                 mov        dword ptr [rsp + 0x1e4], edi
0266b 48bab0402de300000000           movabs     rdx, 0xe32d40b0
02675 488bca                         mov        rcx, rdx
02678 49b8182e1320057f0000           movabs     r8, 0x7f0520132e18
02682 4983805801000001               add        qword ptr [r8 + 0x158], 1
0268a 48b9e02f1320057f0000           movabs     rcx, 0x7f0520132fe0
02694 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
02698 4183c002                       add        r8d, 2
0269c 44894170                       mov        dword ptr [rcx + 0x70], r8d
026a0 4181e0feff1f00                 and        r8d, 0x1ffffe
026a7 4585c0                         test       r8d, r8d
026aa 0f8453230000                   je         0x7f05303cdb03
026b0 488bca                         mov        rcx, rdx
026b3 49b8e02f1320057f0000           movabs     r8, 0x7f0520132fe0
026bd 498380a800000001               add        qword ptr [r8 + 0xa8], 1
026c5 48b9c0301320057f0000           movabs     rcx, 0x7f05201330c0
026cf 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
026d3 4183c002                       add        r8d, 2
026d7 44894170                       mov        dword ptr [rcx + 0x70], r8d
026db 4181e0feff1f00                 and        r8d, 0x1ffffe
026e2 4585c0                         test       r8d, r8d
026e5 0f8439230000                   je         0x7f05303cdb24
026eb 48b9c0301320057f0000           movabs     rcx, 0x7f05201330c0
026f5 488381b800000001               add        qword ptr [rcx + 0xb8], 1
026fd 48baa8251320057f0000           movabs     rdx, 0x7f05201325a8
02707 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0270a 83c102                         add        ecx, 2
0270d 894a70                         mov        dword ptr [rdx + 0x70], ecx
02710 81e1feff1f00                   and        ecx, 0x1ffffe
02716 85c9                           test       ecx, ecx
02718 0f8427230000                   je         0x7f05303cdb45
0271e 48bab8c02ce300000000           movabs     rdx, 0xe32cc0b8
02728 488bca                         mov        rcx, rdx
0272b 49b8c0301320057f0000           movabs     r8, 0x7f05201330c0
02735 8b09                           mov        ecx, dword ptr [rcx]
02737 c1e90d                         shr        ecx, 0xd
0273a 48c1e10a                       shl        rcx, 0xa
0273e 41ba00000012                   mov        r10d, 0x12000000
02744 4903ca                         add        rcx, r10
02747 41ba1c000000                   mov        r10d, 0x1c
0274d 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
02751 7436                           je         0x7f05303cb889
02753 4983c202                       add        r10, 2
02757 4983fa20                       cmp        r10, 0x20
0275b 75f0                           jne        0x7f05303cb84d
0275d 41ba1c000000                   mov        r10d, 0x1c
02763 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
02768 7412                           je         0x7f05303cb87c
0276a 4983c202                       add        r10, 2
0276e 4983fa20                       cmp        r10, 0x20
02772 75ef                           jne        0x7f05303cb863
02774 41ba1b000000                   mov        r10d, 0x1b
0277a eb11                           jmp        0x7f05303cb88d
0277c 50                             push       rax
0277d 4833c0                         xor        rax, rax
02780 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
02786 58                             pop        rax
02787 ebbe                           jmp        0x7f05303cb847
02789 4983c201                       add        r10, 1
0278d 4b8304d001                     add        qword ptr [r8 + r10*8], 1
02792 48b9c0301320057f0000           movabs     rcx, 0x7f05201330c0
0279c 8b12                           mov        edx, dword ptr [rdx]
0279e c1ea0d                         shr        edx, 0xd
027a1 48c1e20a                       shl        rdx, 0xa
027a5 41ba00000012                   mov        r10d, 0x12000000
027ab 4903d2                         add        rdx, r10
027ae 41ba22000000                   mov        r10d, 0x22
027b4 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
027b8 7436                           je         0x7f05303cb8f0
027ba 4983c202                       add        r10, 2
027be 4983fa26                       cmp        r10, 0x26
027c2 75f0                           jne        0x7f05303cb8b4
027c4 41ba22000000                   mov        r10d, 0x22
027ca 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
027cf 7412                           je         0x7f05303cb8e3
027d1 4983c202                       add        r10, 2
027d5 4983fa26                       cmp        r10, 0x26
027d9 75ef                           jne        0x7f05303cb8ca
027db 41ba21000000                   mov        r10d, 0x21
027e1 eb11                           jmp        0x7f05303cb8f4
027e3 50                             push       rax
027e4 4833c0                         xor        rax, rax
027e7 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
027ed 58                             pop        rax
027ee ebbe                           jmp        0x7f05303cb8ae
027f0 4983c201                       add        r10, 1
027f4 4a8304d101                     add        qword ptr [rcx + r10*8], 1
027f9 48bac0301320057f0000           movabs     rdx, 0x7f05201330c0
02803 4883823801000001               add        qword ptr [rdx + 0x138], 1
0280b 48ba68261320057f0000           movabs     rdx, 0x7f0520132668
02815 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02818 83c102                         add        ecx, 2
0281b 894a70                         mov        dword ptr [rdx + 0x70], ecx
0281e 81e1feff1f00                   and        ecx, 0x1ffffe
02824 85c9                           test       ecx, ecx
02826 0f843a220000                   je         0x7f05303cdb66
0282c 48bac0301320057f0000           movabs     rdx, 0x7f05201330c0
02836 4883824801000001               add        qword ptr [rdx + 0x148], 1
0283e 4c63f6                         movsxd     r14, esi
02841 be08000000                     mov        esi, 8
02846 4d8bce                         mov        r9, r14
02849 4c03ce                         add        r9, rsi
0284c 48be50181320057f0000           movabs     rsi, 0x7f0520131850
02856 8b5670                         mov        edx, dword ptr [rsi + 0x70]
02859 83c202                         add        edx, 2
0285c 895670                         mov        dword ptr [rsi + 0x70], edx
0285f 81e2feff1f00                   and        edx, 0x1ffffe
02865 85d2                           test       edx, edx
02867 0f841a220000                   je         0x7f05303cdb87
0286d 48be50181320057f0000           movabs     rsi, 0x7f0520131850
02877 488386d800000001               add        qword ptr [rsi + 0xd8], 1
0287f 48bec8191320057f0000           movabs     rsi, 0x7f05201319c8
02889 8b5670                         mov        edx, dword ptr [rsi + 0x70]
0288c 83c202                         add        edx, 2
0288f 895670                         mov        dword ptr [rsi + 0x70], edx
02892 81e2feff1f00                   and        edx, 0x1ffffe
02898 85d2                           test       edx, edx
0289a 0f8408220000                   je         0x7f05303cdba8
028a0 48bec0301320057f0000           movabs     rsi, 0x7f05201330c0
028aa 4883866801000001               add        qword ptr [rsi + 0x168], 1
028b2 48be80992de300000000           movabs     rsi, 0xe32d9980
028bc 48be00c12ce300000000           movabs     rsi, 0xe32cc100
028c6 ba02000000                     mov        edx, 2
028cb b910000000                     mov        ecx, 0x10
028d0 4c8bc0                         mov        r8, rax
028d3 bf00000000                     mov        edi, 0
028d8 48890424                       mov        qword ptr [rsp], rax
028dc 4c89742408                     mov        qword ptr [rsp + 8], r14
028e1 49bab8c02ce300000000           movabs     r10, 0xe32cc0b8
028eb 4c89542410                     mov        qword ptr [rsp + 0x10], r10
028f0 49ba80992de300000000           movabs     r10, 0xe32d9980
028fa 4c89542418                     mov        qword ptr [rsp + 0x18], r10
028ff e85cfe5207                     call       0x7f05378fb860
02904 0f1f8400fc29000e               nop        dword ptr [rax + rax + 0xe0029fc]
0290c 4885c0                         test       rax, rax
0290f 48bbc0301320057f0000           movabs     rbx, 0x7f05201330c0
02919 750c                           jne        0x7f05303cba27
0291b 808b7101000001                 or         byte ptr [rbx + 0x171], 1
02922 e988000000                     jmp        0x7f05303cbaaf
02927 8b38                           mov        edi, dword ptr [rax]
02929 c1ef0d                         shr        edi, 0xd
0292c 48c1e70a                       shl        rdi, 0xa
02930 41ba00000012                   mov        r10d, 0x12000000
02936 4903fa                         add        rdi, r10
02939 41ba30000000                   mov        r10d, 0x30
0293f 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
02943 7436                           je         0x7f05303cba7b
02945 4983c202                       add        r10, 2
02949 4983fa34                       cmp        r10, 0x34
0294d 75f0                           jne        0x7f05303cba3f
0294f 41ba30000000                   mov        r10d, 0x30
02955 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0295a 7412                           je         0x7f05303cba6e
0295c 4983c202                       add        r10, 2
02960 4983fa34                       cmp        r10, 0x34
02964 75ef                           jne        0x7f05303cba55
02966 41ba2f000000                   mov        r10d, 0x2f
0296c eb11                           jmp        0x7f05303cba7f
0296e 50                             push       rax
0296f 4833c0                         xor        rax, rax
02972 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
02978 58                             pop        rax
02979 ebbe                           jmp        0x7f05303cba39
0297b 4983c201                       add        r10, 1
0297f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02984 48bf0084001300000000           movabs     rdi, 0x13008400
0298e 8b18                           mov        ebx, dword ptr [rax]
02990 c1eb0d                         shr        ebx, 0xd
02993 48c1e30a                       shl        rbx, 0xa
02997 41ba00000012                   mov        r10d, 0x12000000
0299d 4903da                         add        rbx, r10
029a0 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
029a4 0f851f210000                   jne        0x7f05303cdbc9
029aa e900000000                     jmp        0x7f05303cbaaf
029af 488bf8                         mov        rdi, rax
029b2 4889bc24f8010000               mov        qword ptr [rsp + 0x1f8], rdi
029ba 483b07                         cmp        rax, qword ptr [rdi]
029bd 488bf7                         mov        rsi, rdi
029c0 48bb88644320057f0000           movabs     rbx, 0x7f0520436488
029ca 8b36                           mov        esi, dword ptr [rsi]
029cc c1ee0d                         shr        esi, 0xd
029cf 48c1e60a                       shl        rsi, 0xa
029d3 41ba00000012                   mov        r10d, 0x12000000
029d9 4903f2                         add        rsi, r10
029dc 41bae3000000                   mov        r10d, 0xe3
029e2 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
029e6 743c                           je         0x7f05303cbb24
029e8 4983c202                       add        r10, 2
029ec 4981fae7000000                 cmp        r10, 0xe7
029f3 75ed                           jne        0x7f05303cbae2
029f5 41bae3000000                   mov        r10d, 0xe3
029fb 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02a00 7415                           je         0x7f05303cbb17
02a02 4983c202                       add        r10, 2
02a06 4981fae7000000                 cmp        r10, 0xe7
02a0d 75ec                           jne        0x7f05303cbafb
02a0f 41bae2000000                   mov        r10d, 0xe2
02a15 eb11                           jmp        0x7f05303cbb28
02a17 50                             push       rax
02a18 4833c0                         xor        rax, rax
02a1b f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02a21 58                             pop        rax
02a22 ebb8                           jmp        0x7f05303cbadc
02a24 4983c201                       add        r10, 1
02a28 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02a2d 48bed83a1320057f0000           movabs     rsi, 0x7f0520133ad8
02a37 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
02a3a 83c302                         add        ebx, 2
02a3d 895e70                         mov        dword ptr [rsi + 0x70], ebx
02a40 81e3feff1f00                   and        ebx, 0x1ffffe
02a46 85db                           test       ebx, ebx
02a48 0f8489200000                   je         0x7f05303cdbd7
02a4e 488bf7                         mov        rsi, rdi
02a51 48bbd83a1320057f0000           movabs     rbx, 0x7f0520133ad8
02a5b 8b36                           mov        esi, dword ptr [rsi]
02a5d c1ee0d                         shr        esi, 0xd
02a60 48c1e60a                       shl        rsi, 0xa
02a64 41ba00000012                   mov        r10d, 0x12000000
02a6a 4903f2                         add        rsi, r10
02a6d 41ba16000000                   mov        r10d, 0x16
02a73 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02a77 7436                           je         0x7f05303cbbaf
02a79 4983c202                       add        r10, 2
02a7d 4983fa1a                       cmp        r10, 0x1a
02a81 75f0                           jne        0x7f05303cbb73
02a83 41ba16000000                   mov        r10d, 0x16
02a89 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02a8e 7412                           je         0x7f05303cbba2
02a90 4983c202                       add        r10, 2
02a94 4983fa1a                       cmp        r10, 0x1a
02a98 75ef                           jne        0x7f05303cbb89
02a9a 41ba15000000                   mov        r10d, 0x15
02aa0 eb11                           jmp        0x7f05303cbbb3
02aa2 50                             push       rax
02aa3 4833c0                         xor        rax, rax
02aa6 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02aac 58                             pop        rax
02aad ebbe                           jmp        0x7f05303cbb6d
02aaf 4983c201                       add        r10, 1
02ab3 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02ab8 488bf7                         mov        rsi, rdi
02abb 6690                           nop        
02abd 48b850cc190c057f0000           movabs     rax, 0x7f050c19cc50
02ac7 e894f75207                     call       0x7f05378fb360
02acc 0f1f8400c42b000f               nop        dword ptr [rax + rax + 0xf002bc4]
02ad4 48bed83a1320057f0000           movabs     rsi, 0x7f0520133ad8
02ade 488386d800000001               add        qword ptr [rsi + 0xd8], 1
02ae6 48be30241320057f0000           movabs     rsi, 0x7f0520132430
02af0 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
02af3 83c702                         add        edi, 2
02af6 897e70                         mov        dword ptr [rsi + 0x70], edi
02af9 81e7feff1f00                   and        edi, 0x1ffffe
02aff 85ff                           test       edi, edi
02b01 0f84f11f0000                   je         0x7f05303cdbf8
02b07 448bac24e8010000               mov        r13d, dword ptr [rsp + 0x1e8]
02b0f 8bbc24ec010000                 mov        edi, dword ptr [rsp + 0x1ec]
02b16 48be30241320057f0000           movabs     rsi, 0x7f0520132430
02b20 4883860801000001               add        qword ptr [rsi + 0x108], 1
02b28 ffc8                           dec        eax
02b2a 442be8                         sub        r13d, eax
02b2d 48be001b1320057f0000           movabs     rsi, 0x7f0520131b00
02b37 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
02b3a 83c302                         add        ebx, 2
02b3d 895e70                         mov        dword ptr [rsi + 0x70], ebx
02b40 81e3feff1f00                   and        ebx, 0x1ffffe
02b46 85db                           test       ebx, ebx
02b48 0f84cb1f0000                   je         0x7f05303cdc19
02b4e 48be001b1320057f0000           movabs     rsi, 0x7f0520131b00
02b58 488386a800000001               add        qword ptr [rsi + 0xa8], 1
02b60 48be0000000000000000           movabs     rsi, 0
02b6a be00000000                     mov        esi, 0
02b6f 3bfe                           cmp        edi, esi
02b71 0f8cc31f0000                   jl         0x7f05303cdc3a
02b77 413bfd                         cmp        edi, r13d
02b7a 0f8dc71f0000                   jge        0x7f05303cdc47
02b80 488bc7                         mov        rax, rdi
02b83 898424f4010000                 mov        dword ptr [rsp + 0x1f4], eax
02b8a 89bc24ec010000                 mov        dword ptr [rsp + 0x1ec], edi
02b91 488bbc24f8010000               mov        rdi, qword ptr [rsp + 0x1f8]
02b99 488bf7                         mov        rsi, rdi
02b9c 48b9d83a1320057f0000           movabs     rcx, 0x7f0520133ad8
02ba6 8b36                           mov        esi, dword ptr [rsi]
02ba8 c1ee0d                         shr        esi, 0xd
02bab 48c1e60a                       shl        rsi, 0xa
02baf 41ba00000012                   mov        r10d, 0x12000000
02bb5 4903f2                         add        rsi, r10
02bb8 41ba1e000000                   mov        r10d, 0x1e
02bbe 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
02bc2 7436                           je         0x7f05303cbcfa
02bc4 4983c202                       add        r10, 2
02bc8 4983fa22                       cmp        r10, 0x22
02bcc 75f0                           jne        0x7f05303cbcbe
02bce 41ba1e000000                   mov        r10d, 0x1e
02bd4 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02bd9 7412                           je         0x7f05303cbced
02bdb 4983c202                       add        r10, 2
02bdf 4983fa22                       cmp        r10, 0x22
02be3 75ef                           jne        0x7f05303cbcd4
02be5 41ba1d000000                   mov        r10d, 0x1d
02beb eb11                           jmp        0x7f05303cbcfe
02bed 50                             push       rax
02bee 4833c0                         xor        rax, rax
02bf1 f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
02bf7 58                             pop        rax
02bf8 ebbe                           jmp        0x7f05303cbcb8
02bfa 4983c201                       add        r10, 1
02bfe 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02c03 488bf7                         mov        rsi, rdi
02c06 0f1f8000000000                 nop        dword ptr [rax]
02c0d 48b878cc190c057f0000           movabs     rax, 0x7f050c19cc78
02c17 e844f65207                     call       0x7f05378fb360
02c1c 0f1f8400142d0010               nop        dword ptr [rax + rax + 0x10002d14]
02c24 483b00                         cmp        rax, qword ptr [rax]
02c27 488bf0                         mov        rsi, rax
02c2a 48bad83a1320057f0000           movabs     rdx, 0x7f0520133ad8
02c34 8b36                           mov        esi, dword ptr [rsi]
02c36 c1ee0d                         shr        esi, 0xd
02c39 48c1e60a                       shl        rsi, 0xa
02c3d 41ba00000012                   mov        r10d, 0x12000000
02c43 4903f2                         add        rsi, r10
02c46 41ba24000000                   mov        r10d, 0x24
02c4c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02c50 7436                           je         0x7f05303cbd88
02c52 4983c202                       add        r10, 2
02c56 4983fa28                       cmp        r10, 0x28
02c5a 75f0                           jne        0x7f05303cbd4c
02c5c 41ba24000000                   mov        r10d, 0x24
02c62 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02c67 7412                           je         0x7f05303cbd7b
02c69 4983c202                       add        r10, 2
02c6d 4983fa28                       cmp        r10, 0x28
02c71 75ef                           jne        0x7f05303cbd62
02c73 41ba23000000                   mov        r10d, 0x23
02c79 eb11                           jmp        0x7f05303cbd8c
02c7b 50                             push       rax
02c7c 4833c0                         xor        rax, rax
02c7f f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
02c85 58                             pop        rax
02c86 ebbe                           jmp        0x7f05303cbd46
02c88 4983c201                       add        r10, 1
02c8c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02c91 8b7024                         mov        esi, dword ptr [rax + 0x24]
02c94 488bd0                         mov        rdx, rax
02c97 48b9d83a1320057f0000           movabs     rcx, 0x7f0520133ad8
02ca1 8b12                           mov        edx, dword ptr [rdx]
02ca3 c1ea0d                         shr        edx, 0xd
02ca6 48c1e20a                       shl        rdx, 0xa
02caa 41ba00000012                   mov        r10d, 0x12000000
02cb0 4903d2                         add        rdx, r10
02cb3 41ba2a000000                   mov        r10d, 0x2a
02cb9 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02cbd 7436                           je         0x7f05303cbdf5
02cbf 4983c202                       add        r10, 2
02cc3 4983fa2e                       cmp        r10, 0x2e
02cc7 75f0                           jne        0x7f05303cbdb9
02cc9 41ba2a000000                   mov        r10d, 0x2a
02ccf 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02cd4 7412                           je         0x7f05303cbde8
02cd6 4983c202                       add        r10, 2
02cda 4983fa2e                       cmp        r10, 0x2e
02cde 75ef                           jne        0x7f05303cbdcf
02ce0 41ba29000000                   mov        r10d, 0x29
02ce6 eb11                           jmp        0x7f05303cbdf9
02ce8 50                             push       rax
02ce9 4833c0                         xor        rax, rax
02cec f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02cf2 58                             pop        rax
02cf3 ebbe                           jmp        0x7f05303cbdb3
02cf5 4983c201                       add        r10, 1
02cf9 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02cfe 8b4804                         mov        ecx, dword ptr [rax + 4]
02d01 48bad83a1320057f0000           movabs     rdx, 0x7f0520133ad8
02d0b 4883827801000001               add        qword ptr [rdx + 0x178], 1
02d13 48ba68261320057f0000           movabs     rdx, 0x7f0520132668
02d1d 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02d21 4183c002                       add        r8d, 2
02d25 44894270                       mov        dword ptr [rdx + 0x70], r8d
02d29 4181e0feff1f00                 and        r8d, 0x1ffffe
02d30 4585c0                         test       r8d, r8d
02d33 0f84201e0000                   je         0x7f05303cdc59
02d39 48bad83a1320057f0000           movabs     rdx, 0x7f0520133ad8
02d43 4883828801000001               add        qword ptr [rdx + 0x188], 1
02d4b 8b8424f4010000                 mov        eax, dword ptr [rsp + 0x1f4]
02d52 4863c0                         movsxd     rax, eax
02d55 ba08000000                     mov        edx, 8
02d5a 4c8bc8                         mov        r9, rax
02d5d 4c03ca                         add        r9, rdx
02d60 48ba50181320057f0000           movabs     rdx, 0x7f0520131850
02d6a 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02d6e 4183c002                       add        r8d, 2
02d72 44894270                       mov        dword ptr [rdx + 0x70], r8d
02d76 4181e0feff1f00                 and        r8d, 0x1ffffe
02d7d 4585c0                         test       r8d, r8d
02d80 0f84f41d0000                   je         0x7f05303cdc7a
02d86 48ba50181320057f0000           movabs     rdx, 0x7f0520131850
02d90 488382d800000001               add        qword ptr [rdx + 0xd8], 1
02d98 48bac8191320057f0000           movabs     rdx, 0x7f05201319c8
02da2 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02da6 4183c002                       add        r8d, 2
02daa 44894270                       mov        dword ptr [rdx + 0x70], r8d
02dae 4181e0feff1f00                 and        r8d, 0x1ffffe
02db5 4585c0                         test       r8d, r8d
02db8 0f84dd1d0000                   je         0x7f05303cdc9b
02dbe 48bad83a1320057f0000           movabs     rdx, 0x7f0520133ad8
02dc8 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
02dd0 48ba68372ee300000000           movabs     rdx, 0xe32e3768
02dda ba02000000                     mov        edx, 2
02ddf 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
02de7 bf00000000                     mov        edi, 0
02dec 488b9c24f8010000               mov        rbx, qword ptr [rsp + 0x1f8]
02df4 48891c24                       mov        qword ptr [rsp], rbx
02df8 488b9c2438010000               mov        rbx, qword ptr [rsp + 0x138]
02e00 48895c2408                     mov        qword ptr [rsp + 8], rbx
02e05 4889442410                     mov        qword ptr [rsp + 0x10], rax
02e0a 49ba68372ee300000000           movabs     r10, 0xe32e3768
02e14 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02e19 660f1f440000                   nop        word ptr [rax + rax]
02e1f e83cf95207                     call       0x7f05378fb860
02e24 0f1f84001c2f0011               nop        dword ptr [rax + rax + 0x11002f1c]
02e2c 8b8424ec010000                 mov        eax, dword ptr [rsp + 0x1ec]
02e33 83c010                         add        eax, 0x10
02e36 8bbc24e4010000                 mov        edi, dword ptr [rsp + 0x1e4]
02e3d 83c710                         add        edi, 0x10
02e40 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02e47 ba02000000                     mov        edx, 2
02e4c 7c05                           jl         0x7f05303cbf53
02e4e ba00000000                     mov        edx, 0
02e53 48b988644320057f0000           movabs     rcx, 0x7f0520436488
02e5d 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
02e61 4403c2                         add        r8d, edx
02e64 44894174                       mov        dword ptr [rcx + 0x74], r8d
02e68 85d2                           test       edx, edx
02e6a 7506                           jne        0x7f05303cbf72
02e6c 41b802000000                   mov        r8d, 2
02e72 4181e0fe3f0000                 and        r8d, 0x3ffe
02e79 4585c0                         test       r8d, r8d
02e7c 0f843a1d0000                   je         0x7f05303cdcbc
02e82 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02e86 418502                         test       dword ptr [r10], eax
02e89 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02e90 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
02e9a b940070000                     mov        ecx, 0x740
02e9f 7c05                           jl         0x7f05303cbfa6
02ea1 b950070000                     mov        ecx, 0x750
02ea6 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
02eaa 4d8d4001                       lea        r8, [r8 + 1]
02eae 4c89040a                       mov        qword ptr [rdx + rcx], r8
02eb2 0f8c70f5ffff                   jl         0x7f05303cb528
02eb8 8b9c24f0010000                 mov        ebx, dword ptr [rsp + 0x1f0]
02ebf 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
02ec9 ff8260070000                   inc        dword ptr [rdx + 0x760]
02ecf e9fa0e0000                     jmp        0x7f05303ccece
02ed4 4183f908                       cmp        r9d, 8
02ed8 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
02ee2 b978070000                     mov        ecx, 0x778
02ee7 7c05                           jl         0x7f05303cbfee
02ee9 b988070000                     mov        ecx, 0x788
02eee 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
02ef2 4d8d4001                       lea        r8, [r8 + 1]
02ef6 4c89040a                       mov        qword ptr [rdx + rcx], r8
02efa 0f8c7e040000                   jl         0x7f05303cc47e
02f00 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
02f07 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
02f0e 899c2408020000                 mov        dword ptr [rsp + 0x208], ebx
02f15 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
02f1c 0f1f4000                       nop        dword ptr [rax]
02f20 89842400020000                 mov        dword ptr [rsp + 0x200], eax
02f27 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
02f2f 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
02f39 4883829807000001               add        qword ptr [rdx + 0x798], 1
02f41 48ba186a041300000000           movabs     rdx, 0x13046a18
02f4b 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02f4e 83c102                         add        ecx, 2
02f51 894a70                         mov        dword ptr [rdx + 0x70], ecx
02f54 81e1feff1f00                   and        ecx, 0x1ffffe
02f5a 85c9                           test       ecx, ecx
02f5c 0f847b1c0000                   je         0x7f05303cdcdd
02f62 48ba186a041300000000           movabs     rdx, 0x13046a18
02f6c 488d92d8000000                 lea        rdx, [rdx + 0xd8]
02f73 4885c0                         test       rax, rax
02f76 750c                           jne        0x7f05303cc084
02f78 f6420801                       test       byte ptr [rdx + 8], 1
02f7c 7506                           jne        0x7f05303cc084
02f7e f048834a0801                   lock or    qword ptr [rdx + 8], 1
02f84 48bae0680420057f0000           movabs     rdx, 0x7f05200468e0
02f8e 488d9240030000                 lea        rdx, [rdx + 0x340]
02f95 4885c0                         test       rax, rax
02f98 750c                           jne        0x7f05303cc0a6
02f9a f6421001                       test       byte ptr [rdx + 0x10], 1
02f9e 7506                           jne        0x7f05303cc0a6
02fa0 f048834a1001                   lock or    qword ptr [rdx + 0x10], 1
02fa6 48ba186a041300000000           movabs     rdx, 0x13046a18
02fb0 488382a800000001               add        qword ptr [rdx + 0xa8], 1
02fb8 48bae0680420057f0000           movabs     rdx, 0x7f05200468e0
02fc2 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02fc5 83c102                         add        ecx, 2
02fc8 894a70                         mov        dword ptr [rdx + 0x70], ecx
02fcb 81e1feff1f00                   and        ecx, 0x1ffffe
02fd1 85c9                           test       ecx, ecx
02fd3 0f84251c0000                   je         0x7f05303cdcfe
02fd9 48baa8b827e300000000           movabs     rdx, 0xe327b8a8
02fe3 48b9e0680420057f0000           movabs     rcx, 0x7f05200468e0
02fed 8b12                           mov        edx, dword ptr [rdx]
02fef c1ea0d                         shr        edx, 0xd
02ff2 48c1e20a                       shl        rdx, 0xa
02ff6 41ba00000012                   mov        r10d, 0x12000000
02ffc 4903d2                         add        rdx, r10
02fff 41ba16000000                   mov        r10d, 0x16
03005 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03009 7436                           je         0x7f05303cc141
0300b 4983c202                       add        r10, 2
0300f 4983fa1a                       cmp        r10, 0x1a
03013 75f0                           jne        0x7f05303cc105
03015 41ba16000000                   mov        r10d, 0x16
0301b 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03020 7412                           je         0x7f05303cc134
03022 4983c202                       add        r10, 2
03026 4983fa1a                       cmp        r10, 0x1a
0302a 75ef                           jne        0x7f05303cc11b
0302c 41ba15000000                   mov        r10d, 0x15
03032 eb11                           jmp        0x7f05303cc145
03034 50                             push       rax
03035 4833c0                         xor        rax, rax
03038 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
0303e 58                             pop        rax
0303f ebbe                           jmp        0x7f05303cc0ff
03041 4983c201                       add        r10, 1
03045 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0304a 48bae0600420057f0000           movabs     rdx, 0x7f05200460e0
03054 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03057 83c102                         add        ecx, 2
0305a 894a70                         mov        dword ptr [rdx + 0x70], ecx
0305d 81e1feff1f00                   and        ecx, 0x1ffffe
03063 85c9                           test       ecx, ecx
03065 0f84b41b0000                   je         0x7f05303cdd1f
0306b 48bae0600420057f0000           movabs     rdx, 0x7f05200460e0
03075 ff82a8000000                   inc        dword ptr [rdx + 0xa8]
0307b 48bae0680420057f0000           movabs     rdx, 0x7f05200468e0
03085 ff8200010000                   inc        dword ptr [rdx + 0x100]
0308b 48bae0680420057f0000           movabs     rdx, 0x7f05200468e0
03095 ff8220010000                   inc        dword ptr [rdx + 0x120]
0309b 48ba60b127e300000000           movabs     rdx, 0xe327b160
030a5 48b9e0680420057f0000           movabs     rcx, 0x7f05200468e0
030af 8b12                           mov        edx, dword ptr [rdx]
030b1 c1ea0d                         shr        edx, 0xd
030b4 48c1e20a                       shl        rdx, 0xa
030b8 41ba00000012                   mov        r10d, 0x12000000
030be 4903d2                         add        rdx, r10
030c1 41ba27000000                   mov        r10d, 0x27
030c7 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
030cb 7436                           je         0x7f05303cc203
030cd 4983c202                       add        r10, 2
030d1 4983fa2b                       cmp        r10, 0x2b
030d5 75f0                           jne        0x7f05303cc1c7
030d7 41ba27000000                   mov        r10d, 0x27
030dd 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
030e2 7412                           je         0x7f05303cc1f6
030e4 4983c202                       add        r10, 2
030e8 4983fa2b                       cmp        r10, 0x2b
030ec 75ef                           jne        0x7f05303cc1dd
030ee 41ba26000000                   mov        r10d, 0x26
030f4 eb11                           jmp        0x7f05303cc207
030f6 50                             push       rax
030f7 4833c0                         xor        rax, rax
030fa f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03100 58                             pop        rax
03101 ebbe                           jmp        0x7f05303cc1c1
03103 4983c201                       add        r10, 1
03107 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0310c 48ba70660420057f0000           movabs     rdx, 0x7f0520046670
03116 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03119 83c102                         add        ecx, 2
0311c 894a70                         mov        dword ptr [rdx + 0x70], ecx
0311f 81e1feff1f00                   and        ecx, 0x1ffffe
03125 85c9                           test       ecx, ecx
03127 0f84131b0000                   je         0x7f05303cdd40
0312d 48ba70660420057f0000           movabs     rdx, 0x7f0520046670
03137 ff82a8000000                   inc        dword ptr [rdx + 0xa8]
0313d 48bae0680420057f0000           movabs     rdx, 0x7f05200468e0
03147 488d9280010000                 lea        rdx, [rdx + 0x180]
0314e 4885c0                         test       rax, rax
03151 750c                           jne        0x7f05303cc25f
03153 f6421801                       test       byte ptr [rdx + 0x18], 1
03157 7506                           jne        0x7f05303cc25f
03159 f048834a1801                   lock or    qword ptr [rdx + 0x18], 1
0315f 48bae0680420057f0000           movabs     rdx, 0x7f05200468e0
03169 4883827001000001               add        qword ptr [rdx + 0x170], 1
03171 48ba386c0420057f0000           movabs     rdx, 0x7f0520046c38
0317b 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0317e 83c102                         add        ecx, 2
03181 894a70                         mov        dword ptr [rdx + 0x70], ecx
03184 81e1feff1f00                   and        ecx, 0x1ffffe
0318a 85c9                           test       ecx, ecx
0318c 0f84cf1a0000                   je         0x7f05303cdd61
03192 48ba386c0420057f0000           movabs     rdx, 0x7f0520046c38
0319c 4883820801000001               add        qword ptr [rdx + 0x108], 1
031a4 48bae86d0420057f0000           movabs     rdx, 0x7f0520046de8
031ae 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
031b1 83c102                         add        ecx, 2
031b4 894a70                         mov        dword ptr [rdx + 0x70], ecx
031b7 81e1feff1f00                   and        ecx, 0x1ffffe
031bd 85c9                           test       ecx, ecx
031bf 0f84bd1a0000                   je         0x7f05303cdd82
031c5 8b5004                         mov        edx, dword ptr [rax + 4]
031c8 48b9e86d0420057f0000           movabs     rcx, 0x7f0520046de8
031d2 488381a800000001               add        qword ptr [rcx + 0xa8], 1
031da 83ea07                         sub        edx, 7
031dd 48b9881823e200000000           movabs     rcx, 0xe2231888
031e7 b900000000                     mov        ecx, 0
031ec 3bf9                           cmp        edi, ecx
031ee 0f8cb41a0000                   jl         0x7f05303cdda8
031f4 3bfa                           cmp        edi, edx
031f6 0f8db91a0000                   jge        0x7f05303cddb5
031fc 488bd7                         mov        rdx, rdi
031ff 48be28c122e200000000           movabs     rsi, 0xe222c128
03209 488bce                         mov        rcx, rsi
0320c 49b8386c0420057f0000           movabs     r8, 0x7f0520046c38
03216 8b09                           mov        ecx, dword ptr [rcx]
03218 c1e90d                         shr        ecx, 0xd
0321b 48c1e10a                       shl        rcx, 0xa
0321f 41ba00000012                   mov        r10d, 0x12000000
03225 4903ca                         add        rcx, r10
03228 41ba24000000                   mov        r10d, 0x24
0322e 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
03232 7436                           je         0x7f05303cc36a
03234 4983c202                       add        r10, 2
03238 4983fa28                       cmp        r10, 0x28
0323c 75f0                           jne        0x7f05303cc32e
0323e 41ba24000000                   mov        r10d, 0x24
03244 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
03249 7412                           je         0x7f05303cc35d
0324b 4983c202                       add        r10, 2
0324f 4983fa28                       cmp        r10, 0x28
03253 75ef                           jne        0x7f05303cc344
03255 41ba23000000                   mov        r10d, 0x23
0325b eb11                           jmp        0x7f05303cc36e
0325d 50                             push       rax
0325e 4833c0                         xor        rax, rax
03261 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
03267 58                             pop        rax
03268 ebbe                           jmp        0x7f05303cc328
0326a 4983c201                       add        r10, 1
0326e 4b8304d001                     add        qword ptr [r8 + r10*8], 1
03273 4863d2                         movsxd     rdx, edx
03276 488bca                         mov        rcx, rdx
03279 41ba08000000                   mov        r10d, 8
0327f 4903ca                         add        rcx, r10
03282 488bd0                         mov        rdx, rax
03285 41b800000000                   mov        r8d, 0
0328b 89bc2404020000                 mov        dword ptr [rsp + 0x204], edi
03292 0f1f440000                     nop        dword ptr [rax + rax]
03297 e8c4ea5207                     call       0x7f05378fae60
0329c 0f1f840094330013               nop        dword ptr [rax + rax + 0x13003394]
032a4 48be88644320057f0000           movabs     rsi, 0x7f0520436488
032ae 488386a807000001               add        qword ptr [rsi + 0x7a8], 1
032b6 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
032be 8b942400020000                 mov        edx, dword ptr [rsp + 0x200]
032c5 488bc8                         mov        rcx, rax
032c8 0f1f8000000000                 nop        dword ptr [rax]
032cf e88cf45207                     call       0x7f05378fb860
032d4 0f1f8400cc330014               nop        dword ptr [rax + rax + 0x140033cc]
032dc 8b842400020000                 mov        eax, dword ptr [rsp + 0x200]
032e3 83c008                         add        eax, 8
032e6 8bbc2404020000                 mov        edi, dword ptr [rsp + 0x204]
032ed 83c708                         add        edi, 8
032f0 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
032f7 be02000000                     mov        esi, 2
032fc 7c05                           jl         0x7f05303cc403
032fe be00000000                     mov        esi, 0
03303 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
0330d 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
03310 03ce                           add        ecx, esi
03312 894a74                         mov        dword ptr [rdx + 0x74], ecx
03315 85f6                           test       esi, esi
03317 7505                           jne        0x7f05303cc41e
03319 b902000000                     mov        ecx, 2
0331e 81e1fe3f0000                   and        ecx, 0x3ffe
03324 85c9                           test       ecx, ecx
03326 0f8496190000                   je         0x7f05303cddc2
0332c 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03330 418502                         test       dword ptr [r10], eax
03333 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
0333a 48be88644320057f0000           movabs     rsi, 0x7f0520436488
03344 bab8070000                     mov        edx, 0x7b8
03349 7c05                           jl         0x7f05303cc450
0334b bac8070000                     mov        edx, 0x7c8
03350 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
03354 488d4901                       lea        rcx, [rcx + 1]
03358 48890c16                       mov        qword ptr [rsi + rdx], rcx
0335c 0f8cbefbffff                   jl         0x7f05303cc020
03362 8b9c2408020000                 mov        ebx, dword ptr [rsp + 0x208]
03369 48be88644320057f0000           movabs     rsi, 0x7f0520436488
03373 ff86d8070000                   inc        dword ptr [rsi + 0x7d8]
03379 e9500a0000                     jmp        0x7f05303ccece
0337e 48be88644320057f0000           movabs     rsi, 0x7f0520436488
03388 488386f007000001               add        qword ptr [rsi + 0x7f0], 1
03390 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
03398 8b9424d0010000                 mov        edx, dword ptr [rsp + 0x1d0]
0339f 488bcf                         mov        rcx, rdi
033a2 4d8bc1                         mov        r8, r9
033a5 448b8c2478010000               mov        r9d, dword ptr [rsp + 0x178]
033ad 6690                           nop        
033af e8acf35207                     call       0x7f05378fb860
033b4 0f1f8400ac340016               nop        dword ptr [rax + rax + 0x160034ac]
033bc 488bd8                         mov        rbx, rax
033bf e90a0a0000                     jmp        0x7f05303ccece
033c4 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
033cb 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
033d2 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
033da 48be88644320057f0000           movabs     rsi, 0x7f0520436488
033e4 488386c805000001               add        qword ptr [rsi + 0x5c8], 1
033ec 48be182e1320057f0000           movabs     rsi, 0x7f0520132e18
033f6 8b5670                         mov        edx, dword ptr [rsi + 0x70]
033f9 83c202                         add        edx, 2
033fc 895670                         mov        dword ptr [rsi + 0x70], edx
033ff 81e2feff1f00                   and        edx, 0x1ffffe
03405 85d2                           test       edx, edx
03407 0f84d6180000                   je         0x7f05303cdde3
0340d 48beb8c02ce300000000           movabs     rsi, 0xe32cc0b8
03417 48ba182e1320057f0000           movabs     rdx, 0x7f0520132e18
03421 8b36                           mov        esi, dword ptr [rsi]
03423 c1ee0d                         shr        esi, 0xd
03426 48c1e60a                       shl        rsi, 0xa
0342a 41ba00000012                   mov        r10d, 0x12000000
03430 4903f2                         add        rsi, r10
03433 41ba16000000                   mov        r10d, 0x16
03439 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
0343d 7436                           je         0x7f05303cc575
0343f 4983c202                       add        r10, 2
03443 4983fa1a                       cmp        r10, 0x1a
03447 75f0                           jne        0x7f05303cc539
03449 41ba16000000                   mov        r10d, 0x16
0344f 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03454 7412                           je         0x7f05303cc568
03456 4983c202                       add        r10, 2
0345a 4983fa1a                       cmp        r10, 0x1a
0345e 75ef                           jne        0x7f05303cc54f
03460 41ba15000000                   mov        r10d, 0x15
03466 eb11                           jmp        0x7f05303cc579
03468 50                             push       rax
03469 4833c0                         xor        rax, rax
0346c f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03472 58                             pop        rax
03473 ebbe                           jmp        0x7f05303cc533
03475 4983c201                       add        r10, 1
03479 4a8304d201                     add        qword ptr [rdx + r10*8], 1
0347e 8b5804                         mov        ebx, dword ptr [rax + 4]
03481 48be182e1320057f0000           movabs     rsi, 0x7f0520132e18
0348b 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03493 48be30241320057f0000           movabs     rsi, 0x7f0520132430
0349d 8b5670                         mov        edx, dword ptr [rsi + 0x70]
034a0 83c202                         add        edx, 2
034a3 895670                         mov        dword ptr [rsi + 0x70], edx
034a6 81e2feff1f00                   and        edx, 0x1ffffe
034ac 85d2                           test       edx, edx
034ae 0f8455180000                   je         0x7f05303cde09
034b4 48be30241320057f0000           movabs     rsi, 0x7f0520132430
034be 4883860801000001               add        qword ptr [rsi + 0x108], 1
034c6 488bf3                         mov        rsi, rbx
034c9 83ee0f                         sub        esi, 0xf
034cc 48ba001b1320057f0000           movabs     rdx, 0x7f0520131b00
034d6 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
034d9 83c102                         add        ecx, 2
034dc 894a70                         mov        dword ptr [rdx + 0x70], ecx
034df 81e1feff1f00                   and        ecx, 0x1ffffe
034e5 85c9                           test       ecx, ecx
034e7 0f843d180000                   je         0x7f05303cde2a
034ed 48ba001b1320057f0000           movabs     rdx, 0x7f0520131b00
034f7 488382a800000001               add        qword ptr [rdx + 0xa8], 1
034ff 48ba0000000000000000           movabs     rdx, 0
03509 ba00000000                     mov        edx, 0
0350e 3bfa                           cmp        edi, edx
03510 0f8c35180000                   jl         0x7f05303cde4b
03516 3bfe                           cmp        edi, esi
03518 0f8d3a180000                   jge        0x7f05303cde58
0351e 48beb8c02ce300000000           movabs     rsi, 0xe32cc0b8
03528 488bd6                         mov        rdx, rsi
0352b 48b9182e1320057f0000           movabs     rcx, 0x7f0520132e18
03535 8b12                           mov        edx, dword ptr [rdx]
03537 c1ea0d                         shr        edx, 0xd
0353a 48c1e20a                       shl        rdx, 0xa
0353e 41ba00000012                   mov        r10d, 0x12000000
03544 4903d2                         add        rdx, r10
03547 41ba24000000                   mov        r10d, 0x24
0354d 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03551 7436                           je         0x7f05303cc689
03553 4983c202                       add        r10, 2
03557 4983fa28                       cmp        r10, 0x28
0355b 75f0                           jne        0x7f05303cc64d
0355d 41ba24000000                   mov        r10d, 0x24
03563 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03568 7412                           je         0x7f05303cc67c
0356a 4983c202                       add        r10, 2
0356e 4983fa28                       cmp        r10, 0x28
03572 75ef                           jne        0x7f05303cc663
03574 41ba23000000                   mov        r10d, 0x23
0357a eb11                           jmp        0x7f05303cc68d
0357c 50                             push       rax
0357d 4833c0                         xor        rax, rax
03580 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03586 58                             pop        rax
03587 ebbe                           jmp        0x7f05303cc647
03589 4983c201                       add        r10, 1
0358d 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03592 48ba001c1320057f0000           movabs     rdx, 0x7f0520131c00
0359c 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0359f 83c102                         add        ecx, 2
035a2 894a70                         mov        dword ptr [rdx + 0x70], ecx
035a5 81e1feff1f00                   and        ecx, 0x1ffffe
035ab 85c9                           test       ecx, ecx
035ad 0f84b2170000                   je         0x7f05303cde65
035b3 48ba001c1320057f0000           movabs     rdx, 0x7f0520131c00
035bd 488382a800000001               add        qword ptr [rdx + 0xa8], 1
035c5 48be281d1320057f0000           movabs     rsi, 0x7f0520131d28
035cf 8b5670                         mov        edx, dword ptr [rsi + 0x70]
035d2 83c202                         add        edx, 2
035d5 895670                         mov        dword ptr [rsi + 0x70], edx
035d8 81e2feff1f00                   and        edx, 0x1ffffe
035de 85d2                           test       edx, edx
035e0 0f84a0170000                   je         0x7f05303cde86
035e6 48be281d1320057f0000           movabs     rsi, 0x7f0520131d28
035f0 ff86b8000000                   inc        dword ptr [rsi + 0xb8]
035f6 899c240c020000                 mov        dword ptr [rsp + 0x20c], ebx
035fd 48beb0402de300000000           movabs     rsi, 0xe32d40b0
03607 488bd6                         mov        rdx, rsi
0360a 48b9182e1320057f0000           movabs     rcx, 0x7f0520132e18
03614 4883815801000001               add        qword ptr [rcx + 0x158], 1
0361c 48bae02f1320057f0000           movabs     rdx, 0x7f0520132fe0
03626 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03629 83c102                         add        ecx, 2
0362c 894a70                         mov        dword ptr [rdx + 0x70], ecx
0362f 81e1feff1f00                   and        ecx, 0x1ffffe
03635 85c9                           test       ecx, ecx
03637 0f846a170000                   je         0x7f05303cdea7
0363d 488bd6                         mov        rdx, rsi
03640 48b9e02f1320057f0000           movabs     rcx, 0x7f0520132fe0
0364a 488381a800000001               add        qword ptr [rcx + 0xa8], 1
03652 48bac0301320057f0000           movabs     rdx, 0x7f05201330c0
0365c 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0365f 83c102                         add        ecx, 2
03662 894a70                         mov        dword ptr [rdx + 0x70], ecx
03665 81e1feff1f00                   and        ecx, 0x1ffffe
0366b 85c9                           test       ecx, ecx
0366d 0f8455170000                   je         0x7f05303cdec8
03673 48bac0301320057f0000           movabs     rdx, 0x7f05201330c0
0367d 488382b800000001               add        qword ptr [rdx + 0xb8], 1
03685 48bea8251320057f0000           movabs     rsi, 0x7f05201325a8
0368f 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03692 83c202                         add        edx, 2
03695 895670                         mov        dword ptr [rsi + 0x70], edx
03698 81e2feff1f00                   and        edx, 0x1ffffe
0369e 85d2                           test       edx, edx
036a0 0f8443170000                   je         0x7f05303cdee9
036a6 48beb8c02ce300000000           movabs     rsi, 0xe32cc0b8
036b0 488bd6                         mov        rdx, rsi
036b3 48b9c0301320057f0000           movabs     rcx, 0x7f05201330c0
036bd 8b12                           mov        edx, dword ptr [rdx]
036bf c1ea0d                         shr        edx, 0xd
036c2 48c1e20a                       shl        rdx, 0xa
036c6 41ba00000012                   mov        r10d, 0x12000000
036cc 4903d2                         add        rdx, r10
036cf 41ba1c000000                   mov        r10d, 0x1c
036d5 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
036d9 7436                           je         0x7f05303cc811
036db 4983c202                       add        r10, 2
036df 4983fa20                       cmp        r10, 0x20
036e3 75f0                           jne        0x7f05303cc7d5
036e5 41ba1c000000                   mov        r10d, 0x1c
036eb 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
036f0 7412                           je         0x7f05303cc804
036f2 4983c202                       add        r10, 2
036f6 4983fa20                       cmp        r10, 0x20
036fa 75ef                           jne        0x7f05303cc7eb
036fc 41ba1b000000                   mov        r10d, 0x1b
03702 eb11                           jmp        0x7f05303cc815
03704 50                             push       rax
03705 4833c0                         xor        rax, rax
03708 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
0370e 58                             pop        rax
0370f ebbe                           jmp        0x7f05303cc7cf
03711 4983c201                       add        r10, 1
03715 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0371a 48bac0301320057f0000           movabs     rdx, 0x7f05201330c0
03724 8b36                           mov        esi, dword ptr [rsi]
03726 c1ee0d                         shr        esi, 0xd
03729 48c1e60a                       shl        rsi, 0xa
0372d 41ba00000012                   mov        r10d, 0x12000000
03733 4903f2                         add        rsi, r10
03736 41ba22000000                   mov        r10d, 0x22
0373c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03740 7436                           je         0x7f05303cc878
03742 4983c202                       add        r10, 2
03746 4983fa26                       cmp        r10, 0x26
0374a 75f0                           jne        0x7f05303cc83c
0374c 41ba22000000                   mov        r10d, 0x22
03752 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03757 7412                           je         0x7f05303cc86b
03759 4983c202                       add        r10, 2
0375d 4983fa26                       cmp        r10, 0x26
03761 75ef                           jne        0x7f05303cc852
03763 41ba21000000                   mov        r10d, 0x21
03769 eb11                           jmp        0x7f05303cc87c
0376b 50                             push       rax
0376c 4833c0                         xor        rax, rax
0376f f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03775 58                             pop        rax
03776 ebbe                           jmp        0x7f05303cc836
03778 4983c201                       add        r10, 1
0377c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03781 48bec0301320057f0000           movabs     rsi, 0x7f05201330c0
0378b 4883863801000001               add        qword ptr [rsi + 0x138], 1
03793 48be68261320057f0000           movabs     rsi, 0x7f0520132668
0379d 8b5670                         mov        edx, dword ptr [rsi + 0x70]
037a0 83c202                         add        edx, 2
037a3 895670                         mov        dword ptr [rsi + 0x70], edx
037a6 81e2feff1f00                   and        edx, 0x1ffffe
037ac 85d2                           test       edx, edx
037ae 0f8456160000                   je         0x7f05303cdf0a
037b4 48bec0301320057f0000           movabs     rsi, 0x7f05201330c0
037be 4883864801000001               add        qword ptr [rsi + 0x148], 1
037c6 4c63df                         movsxd     r11, edi
037c9 be08000000                     mov        esi, 8
037ce 4d8bcb                         mov        r9, r11
037d1 4c03ce                         add        r9, rsi
037d4 48be50181320057f0000           movabs     rsi, 0x7f0520131850
037de 8b5670                         mov        edx, dword ptr [rsi + 0x70]
037e1 83c202                         add        edx, 2
037e4 895670                         mov        dword ptr [rsi + 0x70], edx
037e7 81e2feff1f00                   and        edx, 0x1ffffe
037ed 85d2                           test       edx, edx
037ef 0f8436160000                   je         0x7f05303cdf2b
037f5 48be50181320057f0000           movabs     rsi, 0x7f0520131850
037ff 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03807 48bec8191320057f0000           movabs     rsi, 0x7f05201319c8
03811 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03814 83c202                         add        edx, 2
03817 895670                         mov        dword ptr [rsi + 0x70], edx
0381a 81e2feff1f00                   and        edx, 0x1ffffe
03820 85d2                           test       edx, edx
03822 0f8424160000                   je         0x7f05303cdf4c
03828 48bec0301320057f0000           movabs     rsi, 0x7f05201330c0
03832 4883866801000001               add        qword ptr [rsi + 0x168], 1
0383a 48be80992de300000000           movabs     rsi, 0xe32d9980
03844 48be00c12ce300000000           movabs     rsi, 0xe32cc100
0384e ba02000000                     mov        edx, 2
03853 b910000000                     mov        ecx, 0x10
03858 4c8bc0                         mov        r8, rax
0385b bf00000000                     mov        edi, 0
03860 48890424                       mov        qword ptr [rsp], rax
03864 4c895c2408                     mov        qword ptr [rsp + 8], r11
03869 49bab8c02ce300000000           movabs     r10, 0xe32cc0b8
03873 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03878 49ba80992de300000000           movabs     r10, 0xe32d9980
03882 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03887 e8d4ee5207                     call       0x7f05378fb860
0388c 0f1f840084390017               nop        dword ptr [rax + rax + 0x17003984]
03894 4885c0                         test       rax, rax
03897 48bbc0301320057f0000           movabs     rbx, 0x7f05201330c0
038a1 750c                           jne        0x7f05303cc9af
038a3 808b7101000001                 or         byte ptr [rbx + 0x171], 1
038aa e988000000                     jmp        0x7f05303cca37
038af 8b38                           mov        edi, dword ptr [rax]
038b1 c1ef0d                         shr        edi, 0xd
038b4 48c1e70a                       shl        rdi, 0xa
038b8 41ba00000012                   mov        r10d, 0x12000000
038be 4903fa                         add        rdi, r10
038c1 41ba30000000                   mov        r10d, 0x30
038c7 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
038cb 7436                           je         0x7f05303cca03
038cd 4983c202                       add        r10, 2
038d1 4983fa34                       cmp        r10, 0x34
038d5 75f0                           jne        0x7f05303cc9c7
038d7 41ba30000000                   mov        r10d, 0x30
038dd 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
038e2 7412                           je         0x7f05303cc9f6
038e4 4983c202                       add        r10, 2
038e8 4983fa34                       cmp        r10, 0x34
038ec 75ef                           jne        0x7f05303cc9dd
038ee 41ba2f000000                   mov        r10d, 0x2f
038f4 eb11                           jmp        0x7f05303cca07
038f6 50                             push       rax
038f7 4833c0                         xor        rax, rax
038fa f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
03900 58                             pop        rax
03901 ebbe                           jmp        0x7f05303cc9c1
03903 4983c201                       add        r10, 1
03907 4a8304d301                     add        qword ptr [rbx + r10*8], 1
0390c 48bf0084001300000000           movabs     rdi, 0x13008400
03916 8b18                           mov        ebx, dword ptr [rax]
03918 c1eb0d                         shr        ebx, 0xd
0391b 48c1e30a                       shl        rbx, 0xa
0391f 41ba00000012                   mov        r10d, 0x12000000
03925 4903da                         add        rbx, r10
03928 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
0392c 0f853b150000                   jne        0x7f05303cdf6d
03932 e900000000                     jmp        0x7f05303cca37
03937 488bf8                         mov        rdi, rax
0393a 4889bc2410020000               mov        qword ptr [rsp + 0x210], rdi
03942 483b07                         cmp        rax, qword ptr [rdi]
03945 488bf7                         mov        rsi, rdi
03948 48bb88644320057f0000           movabs     rbx, 0x7f0520436488
03952 8b36                           mov        esi, dword ptr [rsi]
03954 c1ee0d                         shr        esi, 0xd
03957 48c1e60a                       shl        rsi, 0xa
0395b 41ba00000012                   mov        r10d, 0x12000000
03961 4903f2                         add        rsi, r10
03964 41babc000000                   mov        r10d, 0xbc
0396a 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
0396e 743c                           je         0x7f05303ccaac
03970 4983c202                       add        r10, 2
03974 4981fac0000000                 cmp        r10, 0xc0
0397b 75ed                           jne        0x7f05303cca6a
0397d 41babc000000                   mov        r10d, 0xbc
03983 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03988 7415                           je         0x7f05303cca9f
0398a 4983c202                       add        r10, 2
0398e 4981fac0000000                 cmp        r10, 0xc0
03995 75ec                           jne        0x7f05303cca83
03997 41babb000000                   mov        r10d, 0xbb
0399d eb11                           jmp        0x7f05303ccab0
0399f 50                             push       rax
039a0 4833c0                         xor        rax, rax
039a3 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
039a9 58                             pop        rax
039aa ebb8                           jmp        0x7f05303cca64
039ac 4983c201                       add        r10, 1
039b0 4a8304d301                     add        qword ptr [rbx + r10*8], 1
039b5 48bed83a1320057f0000           movabs     rsi, 0x7f0520133ad8
039bf 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
039c2 83c302                         add        ebx, 2
039c5 895e70                         mov        dword ptr [rsi + 0x70], ebx
039c8 81e3feff1f00                   and        ebx, 0x1ffffe
039ce 85db                           test       ebx, ebx
039d0 0f84a5140000                   je         0x7f05303cdf7b
039d6 488bf7                         mov        rsi, rdi
039d9 48bbd83a1320057f0000           movabs     rbx, 0x7f0520133ad8
039e3 8b36                           mov        esi, dword ptr [rsi]
039e5 c1ee0d                         shr        esi, 0xd
039e8 48c1e60a                       shl        rsi, 0xa
039ec 41ba00000012                   mov        r10d, 0x12000000
039f2 4903f2                         add        rsi, r10
039f5 41ba16000000                   mov        r10d, 0x16
039fb 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
039ff 7436                           je         0x7f05303ccb37
03a01 4983c202                       add        r10, 2
03a05 4983fa1a                       cmp        r10, 0x1a
03a09 75f0                           jne        0x7f05303ccafb
03a0b 41ba16000000                   mov        r10d, 0x16
03a11 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03a16 7412                           je         0x7f05303ccb2a
03a18 4983c202                       add        r10, 2
03a1c 4983fa1a                       cmp        r10, 0x1a
03a20 75ef                           jne        0x7f05303ccb11
03a22 41ba15000000                   mov        r10d, 0x15
03a28 eb11                           jmp        0x7f05303ccb3b
03a2a 50                             push       rax
03a2b 4833c0                         xor        rax, rax
03a2e f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
03a34 58                             pop        rax
03a35 ebbe                           jmp        0x7f05303ccaf5
03a37 4983c201                       add        r10, 1
03a3b 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03a40 488bf7                         mov        rsi, rdi
03a43 6690                           nop        
03a45 48b8a0cc190c057f0000           movabs     rax, 0x7f050c19cca0
03a4f e80ce85207                     call       0x7f05378fb360
03a54 0f1f84004c3b0018               nop        dword ptr [rax + rax + 0x18003b4c]
03a5c 48bed83a1320057f0000           movabs     rsi, 0x7f0520133ad8
03a66 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03a6e 48be30241320057f0000           movabs     rsi, 0x7f0520132430
03a78 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
03a7b 83c702                         add        edi, 2
03a7e 897e70                         mov        dword ptr [rsi + 0x70], edi
03a81 81e7feff1f00                   and        edi, 0x1ffffe
03a87 85ff                           test       edi, edi
03a89 0f840d140000                   je         0x7f05303cdf9c
03a8f 8b9c240c020000                 mov        ebx, dword ptr [rsp + 0x20c]
03a96 8bbc24d0010000                 mov        edi, dword ptr [rsp + 0x1d0]
03a9d 48be30241320057f0000           movabs     rsi, 0x7f0520132430
03aa7 4883860801000001               add        qword ptr [rsi + 0x108], 1
03aaf ffc8                           dec        eax
03ab1 2bd8                           sub        ebx, eax
03ab3 48be001b1320057f0000           movabs     rsi, 0x7f0520131b00
03abd 8b4670                         mov        eax, dword ptr [rsi + 0x70]
03ac0 83c002                         add        eax, 2
03ac3 894670                         mov        dword ptr [rsi + 0x70], eax
03ac6 25feff1f00                     and        eax, 0x1ffffe
03acb 85c0                           test       eax, eax
03acd 0f84ea130000                   je         0x7f05303cdfbd
03ad3 48be001b1320057f0000           movabs     rsi, 0x7f0520131b00
03add 488386a800000001               add        qword ptr [rsi + 0xa8], 1
03ae5 48be0000000000000000           movabs     rsi, 0
03aef be00000000                     mov        esi, 0
03af4 3bfe                           cmp        edi, esi
03af6 0f8ce2130000                   jl         0x7f05303cdfde
03afc 3bfb                           cmp        edi, ebx
03afe 0f8de7130000                   jge        0x7f05303cdfeb
03b04 488bdf                         mov        rbx, rdi
03b07 899c2418020000                 mov        dword ptr [rsp + 0x218], ebx
03b0e 89bc24d0010000                 mov        dword ptr [rsp + 0x1d0], edi
03b15 488bbc2410020000               mov        rdi, qword ptr [rsp + 0x210]
03b1d 488bf7                         mov        rsi, rdi
03b20 48b9d83a1320057f0000           movabs     rcx, 0x7f0520133ad8
03b2a 8b36                           mov        esi, dword ptr [rsi]
03b2c c1ee0d                         shr        esi, 0xd
03b2f 48c1e60a                       shl        rsi, 0xa
03b33 41ba00000012                   mov        r10d, 0x12000000
03b39 4903f2                         add        rsi, r10
03b3c 41ba1e000000                   mov        r10d, 0x1e
03b42 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
03b46 7436                           je         0x7f05303ccc7e
03b48 4983c202                       add        r10, 2
03b4c 4983fa22                       cmp        r10, 0x22
03b50 75f0                           jne        0x7f05303ccc42
03b52 41ba1e000000                   mov        r10d, 0x1e
03b58 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03b5d 7412                           je         0x7f05303ccc71
03b5f 4983c202                       add        r10, 2
03b63 4983fa22                       cmp        r10, 0x22
03b67 75ef                           jne        0x7f05303ccc58
03b69 41ba1d000000                   mov        r10d, 0x1d
03b6f eb11                           jmp        0x7f05303ccc82
03b71 50                             push       rax
03b72 4833c0                         xor        rax, rax
03b75 f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
03b7b 58                             pop        rax
03b7c ebbe                           jmp        0x7f05303ccc3c
03b7e 4983c201                       add        r10, 1
03b82 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03b87 488bf7                         mov        rsi, rdi
03b8a 666690                         nop        
03b8d 48b8c8cc190c057f0000           movabs     rax, 0x7f050c19ccc8
03b97 e8c4e65207                     call       0x7f05378fb360
03b9c 0f1f8400943c0019               nop        dword ptr [rax + rax + 0x19003c94]
03ba4 483b00                         cmp        rax, qword ptr [rax]
03ba7 488bf0                         mov        rsi, rax
03baa 48bad83a1320057f0000           movabs     rdx, 0x7f0520133ad8
03bb4 8b36                           mov        esi, dword ptr [rsi]
03bb6 c1ee0d                         shr        esi, 0xd
03bb9 48c1e60a                       shl        rsi, 0xa
03bbd 41ba00000012                   mov        r10d, 0x12000000
03bc3 4903f2                         add        rsi, r10
03bc6 41ba24000000                   mov        r10d, 0x24
03bcc 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03bd0 7436                           je         0x7f05303ccd08
03bd2 4983c202                       add        r10, 2
03bd6 4983fa28                       cmp        r10, 0x28
03bda 75f0                           jne        0x7f05303ccccc
03bdc 41ba24000000                   mov        r10d, 0x24
03be2 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03be7 7412                           je         0x7f05303cccfb
03be9 4983c202                       add        r10, 2
03bed 4983fa28                       cmp        r10, 0x28
03bf1 75ef                           jne        0x7f05303ccce2
03bf3 41ba23000000                   mov        r10d, 0x23
03bf9 eb11                           jmp        0x7f05303ccd0c
03bfb 50                             push       rax
03bfc 4833c0                         xor        rax, rax
03bff f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03c05 58                             pop        rax
03c06 ebbe                           jmp        0x7f05303cccc6
03c08 4983c201                       add        r10, 1
03c0c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03c11 8b7024                         mov        esi, dword ptr [rax + 0x24]
03c14 488bd0                         mov        rdx, rax
03c17 48b9d83a1320057f0000           movabs     rcx, 0x7f0520133ad8
03c21 8b12                           mov        edx, dword ptr [rdx]
03c23 c1ea0d                         shr        edx, 0xd
03c26 48c1e20a                       shl        rdx, 0xa
03c2a 41ba00000012                   mov        r10d, 0x12000000
03c30 4903d2                         add        rdx, r10
03c33 41ba2a000000                   mov        r10d, 0x2a
03c39 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03c3d 7436                           je         0x7f05303ccd75
03c3f 4983c202                       add        r10, 2
03c43 4983fa2e                       cmp        r10, 0x2e
03c47 75f0                           jne        0x7f05303ccd39
03c49 41ba2a000000                   mov        r10d, 0x2a
03c4f 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03c54 7412                           je         0x7f05303ccd68
03c56 4983c202                       add        r10, 2
03c5a 4983fa2e                       cmp        r10, 0x2e
03c5e 75ef                           jne        0x7f05303ccd4f
03c60 41ba29000000                   mov        r10d, 0x29
03c66 eb11                           jmp        0x7f05303ccd79
03c68 50                             push       rax
03c69 4833c0                         xor        rax, rax
03c6c f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03c72 58                             pop        rax
03c73 ebbe                           jmp        0x7f05303ccd33
03c75 4983c201                       add        r10, 1
03c79 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03c7e 8b4804                         mov        ecx, dword ptr [rax + 4]
03c81 48bad83a1320057f0000           movabs     rdx, 0x7f0520133ad8
03c8b 4883827801000001               add        qword ptr [rdx + 0x178], 1
03c93 48ba68261320057f0000           movabs     rdx, 0x7f0520132668
03c9d 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03ca1 4183c002                       add        r8d, 2
03ca5 44894270                       mov        dword ptr [rdx + 0x70], r8d
03ca9 4181e0feff1f00                 and        r8d, 0x1ffffe
03cb0 4585c0                         test       r8d, r8d
03cb3 0f8444120000                   je         0x7f05303cdffd
03cb9 48bad83a1320057f0000           movabs     rdx, 0x7f0520133ad8
03cc3 4883828801000001               add        qword ptr [rdx + 0x188], 1
03ccb 8b9c2418020000                 mov        ebx, dword ptr [rsp + 0x218]
03cd2 4863db                         movsxd     rbx, ebx
03cd5 ba08000000                     mov        edx, 8
03cda 4c8bcb                         mov        r9, rbx
03cdd 4c03ca                         add        r9, rdx
03ce0 48ba50181320057f0000           movabs     rdx, 0x7f0520131850
03cea 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03cee 4183c002                       add        r8d, 2
03cf2 44894270                       mov        dword ptr [rdx + 0x70], r8d
03cf6 4181e0feff1f00                 and        r8d, 0x1ffffe
03cfd 4585c0                         test       r8d, r8d
03d00 0f8418120000                   je         0x7f05303ce01e
03d06 48ba50181320057f0000           movabs     rdx, 0x7f0520131850
03d10 488382d800000001               add        qword ptr [rdx + 0xd8], 1
03d18 48bac8191320057f0000           movabs     rdx, 0x7f05201319c8
03d22 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03d26 4183c002                       add        r8d, 2
03d2a 44894270                       mov        dword ptr [rdx + 0x70], r8d
03d2e 4181e0feff1f00                 and        r8d, 0x1ffffe
03d35 4585c0                         test       r8d, r8d
03d38 0f8401120000                   je         0x7f05303ce03f
03d3e 48bad83a1320057f0000           movabs     rdx, 0x7f0520133ad8
03d48 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
03d50 48ba68372ee300000000           movabs     rdx, 0xe32e3768
03d5a ba02000000                     mov        edx, 2
03d5f 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
03d67 bf00000000                     mov        edi, 0
03d6c 488b842410020000               mov        rax, qword ptr [rsp + 0x210]
03d74 48890424                       mov        qword ptr [rsp], rax
03d78 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03d80 4889442408                     mov        qword ptr [rsp + 8], rax
03d85 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
03d8a 49ba68372ee300000000           movabs     r10, 0xe32e3768
03d94 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03d99 660f1f440000                   nop        word ptr [rax + rax]
03d9f e8bce95207                     call       0x7f05378fb860
03da4 0f1f84009c3e001a               nop        dword ptr [rax + rax + 0x1a003e9c]
03dac 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
03db3 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
03dbb 4103d8                         add        ebx, r8d
03dbe 48be88644320057f0000           movabs     rsi, 0x7f0520436488
03dc8 ff8608060000                   inc        dword ptr [rsi + 0x608]
03dce 8bb424d4010000                 mov        esi, dword ptr [rsp + 0x1d4]
03dd5 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
03ddf ff8200080000                   inc        dword ptr [rdx + 0x800]
03de5 488bc3                         mov        rax, rbx
03de8 8b942444010000                 mov        edx, dword ptr [rsp + 0x144]
03def ffc2                           inc        edx
03df1 48b988644320057f0000           movabs     rcx, 0x7f0520436488
03dfb 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
03dff 4183c002                       add        r8d, 2
03e03 44894174                       mov        dword ptr [rcx + 0x74], r8d
03e07 4181e0fe3f0000                 and        r8d, 0x3ffe
03e0e 4585c0                         test       r8d, r8d
03e11 0f8449110000                   je         0x7f05303ce060
03e17 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03e1b 418502                         test       dword ptr [r10], eax
03e1e 48b988644320057f0000           movabs     rcx, 0x7f0520436488
03e28 ff8128080000                   inc        dword ptr [rcx + 0x828]
03e2e 488bce                         mov        rcx, rsi
03e31 4c8bd8                         mov        r11, rax
03e34 488bf1                         mov        rsi, rcx
03e37 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
03e3f 488b9c2468020000               mov        rbx, qword ptr [rsp + 0x268]
03e47 8bbc2430010000                 mov        edi, dword ptr [rsp + 0x130]
03e4e 4c8b8c2420010000               mov        r9, qword ptr [rsp + 0x120]
03e56 4c8b842428010000               mov        r8, qword ptr [rsp + 0x128]
03e5e 8b8c2434010000                 mov        ecx, dword ptr [rsp + 0x134]
03e65 e986c4ffff                     jmp        0x7f05303c93f0
03e6a 4c8bc8                         mov        r9, rax
03e6d 4585c9                         test       r9d, r9d
03e70 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
03e7a b980030000                     mov        ecx, 0x380
03e7f 7e05                           jle        0x7f05303ccf86
03e81 b990030000                     mov        ecx, 0x390
03e86 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
03e8a 4d8d4001                       lea        r8, [r8 + 1]
03e8e 4c89040a                       mov        qword ptr [rdx + rcx], r8
03e92 0f8e77010000                   jle        0x7f05303cd10f
03e98 488b9c2498010000               mov        rbx, qword ptr [rsp + 0x198]
03ea0 482bf3                         sub        rsi, rbx
03ea3 ba00000000                     mov        edx, 0
03ea8 483bf2                         cmp        rsi, rdx
03eab 48be88644320057f0000           movabs     rsi, 0x7f0520436488
03eb5 baa0030000                     mov        edx, 0x3a0
03eba 7d05                           jge        0x7f05303ccfc1
03ebc bab0030000                     mov        edx, 0x3b0
03ec1 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
03ec5 488d4901                       lea        rcx, [rcx + 1]
03ec9 48890c16                       mov        qword ptr [rsi + rdx], rcx
03ecd 0f8d3c010000                   jge        0x7f05303cd10f
03ed3 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
03edb 488b5630                       mov        rdx, qword ptr [rsi + 0x30]
03edf be00000000                     mov        esi, 0
03ee4 483bd6                         cmp        rdx, rsi
03ee7 48be88644320057f0000           movabs     rsi, 0x7f0520436488
03ef1 bac0030000                     mov        edx, 0x3c0
03ef6 7505                           jne        0x7f05303ccffd
03ef8 bad0030000                     mov        edx, 0x3d0
03efd 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
03f01 488d4901                       lea        rcx, [rcx + 1]
03f05 48890c16                       mov        qword ptr [rsi + rdx], rcx
03f09 0f8500010000                   jne        0x7f05303cd10f
03f0f e905010000                     jmp        0x7f05303cd119
03f14 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
03f1c 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03f24 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
03f2c 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
03f33 488bce                         mov        rcx, rsi
03f36 8bb42434010000                 mov        esi, dword ptr [rsp + 0x134]
03f3d 488bde                         mov        rbx, rsi
03f40 2bd9                           sub        ebx, ecx
03f42 48be88644320057f0000           movabs     rsi, 0x7f0520436488
03f4c 4883864008000001               add        qword ptr [rsi + 0x840], 1
03f54 488bf2                         mov        rsi, rdx
03f57 488bd1                         mov        rdx, rcx
03f5a 488bc8                         mov        rcx, rax
03f5d 4d8bc3                         mov        r8, r11
03f60 4c8bcb                         mov        r9, rbx
03f63 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
03f6b 899c241c020000                 mov        dword ptr [rsp + 0x21c], ebx
03f72 4885c9                         test       rcx, rcx
03f75 0f8406100000                   je         0x7f05303ce081
03f7b 85d2                           test       edx, edx
03f7d 0f8cfe0f0000                   jl         0x7f05303ce081
03f83 4585c0                         test       r8d, r8d
03f86 0f8cf50f0000                   jl         0x7f05303ce081
03f8c 4a8d3c0a                       lea        rdi, [rdx + r9]
03f90 3b7e04                         cmp        edi, dword ptr [rsi + 4]
03f93 0f87e80f0000                   ja         0x7f05303ce081
03f99 4b8d3c08                       lea        rdi, [r8 + r9]
03f9d 3b7904                         cmp        edi, dword ptr [rcx + 4]
03fa0 0f87db0f0000                   ja         0x7f05303ce081
03fa6 4585c9                         test       r9d, r9d
03fa9 0f8cd20f0000                   jl         0x7f05303ce081
03faf 4863d2                         movsxd     rdx, edx
03fb2 4d63c0                         movsxd     r8, r8d
03fb5 488d7c1608                     lea        rdi, [rsi + rdx + 8]
03fba 4a8d740108                     lea        rsi, [rcx + r8 + 8]
03fbf 498bd1                         mov        rdx, r9
03fc2 40f6c40f                       test       spl, 0xf
03fc6 0f8412000000                   je         0x7f05303cd0de
03fcc 4883ec08                       sub        rsp, 8
03fd0 e84b7e5107                     call       0x7f05378e4f20
03fd5 4883c408                       add        rsp, 8
03fd9 e905000000                     jmp        0x7f05303cd0e3
03fde e83d7e5107                     call       0x7f05378e4f20
03fe3 8b9c241c020000                 mov        ebx, dword ptr [rsp + 0x21c]
03fea 039c2474010000                 add        ebx, dword ptr [rsp + 0x174]
03ff1 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
03ff9 895e38                         mov        dword ptr [rsi + 0x38], ebx
03ffc 4881c450020000                 add        rsp, 0x250
04003 5d                             pop        rbp
04004 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
04008 0f87830f0000                   ja         0x7f05303ce091
0400e c3                             ret        
0400f bb02000000                     mov        ebx, 2
04014 e915000000                     jmp        0x7f05303cd12e
04019 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
04023 ff82e0030000                   inc        dword ptr [rdx + 0x3e0]
04029 bb08000000                     mov        ebx, 8
0402e 899c2428020000                 mov        dword ptr [rsp + 0x228], ebx
04035 666690                         nop        
04038 e9790f0000                     jmp        0x7f05303ce0b6
0403d 90                             nop        
0403e 90                             nop        
0403f 90                             nop        
04040 90                             nop        
04041 90                             nop        
04042 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04049 0f85760f0000                   jne        0x7f05303ce0c5
0404f 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
04056 488d7820                       lea        rdi, [rax + 0x20]
0405a 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
04061 0f875e0f0000                   ja         0x7f05303ce0c5
04067 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
0406e 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
04075 488908                         mov        qword ptr [rax], rcx
04078 4833c9                         xor        rcx, rcx
0407b 48894808                       mov        qword ptr [rax + 8], rcx
0407f 48894810                       mov        qword ptr [rax + 0x10], rcx
04083 48894818                       mov        qword ptr [rax + 0x18], rcx
04087 90                             nop        
04088 e9540f0000                     jmp        0x7f05303ce0e1
0408d 90                             nop        
0408e 90                             nop        
0408f 90                             nop        
04090 90                             nop        
04091 90                             nop        
04092 498bf1                         mov        rsi, r9
04095 4889842420020000               mov        qword ptr [rsp + 0x220], rax
0409d 6690                           nop        
0409f e8bce65207                     call       0x7f05378fb860
040a4 0f1f84009c41001c               nop        dword ptr [rax + rax + 0x1c00419c]
040ac 48ba88644320057f0000           movabs     rdx, 0x7f0520436488
040b6 488d9208040000                 lea        rdx, [rdx + 0x408]
040bd 4885c0                         test       rax, rax
040c0 750a                           jne        0x7f05303cd1cc
040c2 f60201                         test       byte ptr [rdx], 1
040c5 7505                           jne        0x7f05303cd1cc
040c7 f048830a01                     lock or    qword ptr [rdx], 1
040cc 488b942420020000               mov        rdx, qword ptr [rsp + 0x220]
040d4 48b988644320057f0000           movabs     rcx, 0x7f0520436488
040de 4883811804000001               add        qword ptr [rcx + 0x418], 1
040e6 8b942428020000                 mov        edx, dword ptr [rsp + 0x228]
040ed 488bc8                         mov        rcx, rax
040f0 488bb42420020000               mov        rsi, qword ptr [rsp + 0x220]
040f8 0f1f8000000000                 nop        dword ptr [rax]
040ff e85cdc5207                     call       0x7f05378fae60
04104 0f1f8400fc41001d               nop        dword ptr [rax + rax + 0x1d0041fc]
0410c 488b842420020000               mov        rax, qword ptr [rsp + 0x220]
04114 e9450f0000                     jmp        0x7f05303ce15e
04119 0f1f8000000000                 nop        dword ptr [rax]
04120 e9d50e0000                     jmp        0x7f05303ce0fa
04125 90                             nop        
04126 90                             nop        
04127 90                             nop        
04128 90                             nop        
04129 90                             nop        
0412a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04131 0f85d20e0000                   jne        0x7f05303ce109
04137 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
0413e 488d7820                       lea        rdi, [rax + 0x20]
04142 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
04149 0f87ba0e0000                   ja         0x7f05303ce109
0414f 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
04156 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0415d 488908                         mov        qword ptr [rax], rcx
04160 4833c9                         xor        rcx, rcx
04163 48894808                       mov        qword ptr [rax + 8], rcx
04167 48894810                       mov        qword ptr [rax + 0x10], rcx
0416b 48894818                       mov        qword ptr [rax + 0x18], rcx
0416f 488bd0                         mov        rdx, rax
04172 48b988644320057f0000           movabs     rcx, 0x7f0520436488
0417c 4883815002000001               add        qword ptr [rcx + 0x250], 1
04184 ba02000000                     mov        edx, 2
04189 48b9a86126e200000000           movabs     rcx, 0xe22661a8
04193 488bf0                         mov        rsi, rax
04196 4889842430020000               mov        qword ptr [rsp + 0x230], rax
0419e 90                             nop        
0419f e8bcdb5207                     call       0x7f05378fae60
041a4 0f1f84009c42001e               nop        dword ptr [rax + rax + 0x1e00429c]
041ac 488b842430020000               mov        rax, qword ptr [rsp + 0x230]
041b4 e9a50e0000                     jmp        0x7f05303ce15e
041b9 0f1f8000000000                 nop        dword ptr [rax]
041c0 e9600e0000                     jmp        0x7f05303ce125
041c5 90                             nop        
041c6 90                             nop        
041c7 90                             nop        
041c8 90                             nop        
041c9 90                             nop        
041ca 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
041d1 0f855d0e0000                   jne        0x7f05303ce134
041d7 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
041de 488d7820                       lea        rdi, [rax + 0x20]
041e2 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
041e9 0f87450e0000                   ja         0x7f05303ce134
041ef 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
041f6 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
041fd 488908                         mov        qword ptr [rax], rcx
04200 4833c9                         xor        rcx, rcx
04203 48894808                       mov        qword ptr [rax + 8], rcx
04207 48894810                       mov        qword ptr [rax + 0x10], rcx
0420b 48894818                       mov        qword ptr [rax + 0x18], rcx
0420f 488bd0                         mov        rdx, rax
04212 48b988644320057f0000           movabs     rcx, 0x7f0520436488
0421c 4883813801000001               add        qword ptr [rcx + 0x138], 1
04224 ba05000000                     mov        edx, 5
04229 48b9d86126e200000000           movabs     rcx, 0xe22661d8
04233 488bf0                         mov        rsi, rax
04236 4889842438020000               mov        qword ptr [rsp + 0x238], rax
0423e 90                             nop        
0423f e81cdb5207                     call       0x7f05378fae60
04244 0f1f84003c43001f               nop        dword ptr [rax + rax + 0x1f00433c]
0424c 488b842438020000               mov        rax, qword ptr [rsp + 0x238]
04254 e9050e0000                     jmp        0x7f05303ce15e
04259 49ba38de4120057f0000           movabs     r10, 0x7f052041de38
04263 4c89542408                     mov        qword ptr [rsp + 8], r10
04268 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04270 e8eb525f07                     call       0x7f05379c2660
04275 e913beffff                     jmp        0x7f05303c918d
0427a 49bad8d84d1200000000           movabs     r10, 0x124dd8d8
04284 4c89542408                     mov        qword ptr [rsp + 8], r10
04289 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04291 e8ca525f07                     call       0x7f05379c2660
04296 e97cbfffff                     jmp        0x7f05303c9317
0429b e840f35e07                     call       0x7f05379bc6e0
042a0 e83bf35e07                     call       0x7f05379bc6e0
042a5 e836f35e07                     call       0x7f05379bc6e0
042aa 48891424                       mov        qword ptr [rsp], rdx
042ae 4c89442408                     mov        qword ptr [rsp + 8], r8
042b3 e828ea5e07                     call       0x7f05379bbde0
042b8 e823f35e07                     call       0x7f05379bc6e0
042bd e81ef35e07                     call       0x7f05379bc6e0
042c2 48891424                       mov        qword ptr [rsp], rdx
042c6 4c894c2408                     mov        qword ptr [rsp + 8], r9
042cb e810ea5e07                     call       0x7f05379bbde0
042d0 e80bf35e07                     call       0x7f05379bc6e0
042d5 e806f35e07                     call       0x7f05379bc6e0
042da 48c7042401000000               mov        qword ptr [rsp], 1
042e2 48895c2408                     mov        qword ptr [rsp + 8], rbx
042e7 e8f4e95e07                     call       0x7f05379bbde0
042ec 48c7042402000000               mov        qword ptr [rsp], 2
042f4 48895c2408                     mov        qword ptr [rsp + 8], rbx
042f9 e8e2e95e07                     call       0x7f05379bbde0
042fe 49ba18960520057f0000           movabs     r10, 0x7f0520059618
04308 4c89542408                     mov        qword ptr [rsp + 8], r10
0430d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04315 e846525f07                     call       0x7f05379c2660
0431a e98ec4ffff                     jmp        0x7f05303c98ad
0431f 49ba28861220057f0000           movabs     r10, 0x7f0520128628
04329 4c89542408                     mov        qword ptr [rsp + 8], r10
0432e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04336 e825525f07                     call       0x7f05379c2660
0433b e911c5ffff                     jmp        0x7f05303c9951
04340 49ba58e54d1200000000           movabs     r10, 0x124de558
0434a 4c89542408                     mov        qword ptr [rsp + 8], r10
0434f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04357 e804525f07                     call       0x7f05379c2660
0435c e93ac5ffff                     jmp        0x7f05303c999b
04361 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04369 e872335f07                     call       0x7f05379c07e0
0436e 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04376 e865335f07                     call       0x7f05379c07e0
0437b 49ba10480b20057f0000           movabs     r10, 0x7f05200b4810
04385 4c89542408                     mov        qword ptr [rsp + 8], r10
0438a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04392 e8c9515f07                     call       0x7f05379c2660
04397 e9d8c5ffff                     jmp        0x7f05303c9a74
0439c 49ba90ab0b20057f0000           movabs     r10, 0x7f05200bab90
043a6 4c89542408                     mov        qword ptr [rsp + 8], r10
043ab 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
043b3 e8a8515f07                     call       0x7f05379c2660
043b8 e9eac5ffff                     jmp        0x7f05303c9aa7
043bd 49baf8510e20057f0000           movabs     r10, 0x7f05200e51f8
043c7 4c89542408                     mov        qword ptr [rsp + 8], r10
043cc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
043d4 e887515f07                     call       0x7f05379c2660
043d9 e940c6ffff                     jmp        0x7f05303c9b1e
043de 49bae0af0520057f0000           movabs     r10, 0x7f052005afe0
043e8 4c89542408                     mov        qword ptr [rsp + 8], r10
043ed 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
043f5 e866515f07                     call       0x7f05379c2660
043fa e956c6ffff                     jmp        0x7f05303c9b55
043ff 49baf8140e20057f0000           movabs     r10, 0x7f05200e14f8
04409 4c89542408                     mov        qword ptr [rsp + 8], r10
0440e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04416 e845515f07                     call       0x7f05379c2660
0441b e96dc6ffff                     jmp        0x7f05303c9b8d
04420 49ba48c80520057f0000           movabs     r10, 0x7f052005c848
0442a 4c89542408                     mov        qword ptr [rsp + 8], r10
0442f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04437 e824515f07                     call       0x7f05379c2660
0443c e967c7ffff                     jmp        0x7f05303c9ca8
04441 49bab0f2211200000000           movabs     r10, 0x1221f2b0
0444b 4c89542408                     mov        qword ptr [rsp + 8], r10
04450 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04458 e803515f07                     call       0x7f05379c2660
0445d e987c7ffff                     jmp        0x7f05303c9ce9
04462 49bad057221200000000           movabs     r10, 0x122257d0
0446c 4c89542408                     mov        qword ptr [rsp + 8], r10
04471 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04479 e8e2505f07                     call       0x7f05379c2660
0447e e999c7ffff                     jmp        0x7f05303c9d1c
04483 48890424                       mov        qword ptr [rsp], rax
04487 e854195f07                     call       0x7f05379beee0
0448c e84ff15e07                     call       0x7f05379bc6e0
04491 49baa8a30520057f0000           movabs     r10, 0x7f052005a3a8
0449b 4c89542408                     mov        qword ptr [rsp + 8], r10
044a0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044a8 e8b3505f07                     call       0x7f05379c2660
044ad e91cc9ffff                     jmp        0x7f05303c9ece
044b2 e829f15e07                     call       0x7f05379bc6e0
044b7 49ba28861220057f0000           movabs     r10, 0x7f0520128628
044c1 4c89542408                     mov        qword ptr [rsp + 8], r10
044c6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044ce e88d505f07                     call       0x7f05379c2660
044d3 e9bac9ffff                     jmp        0x7f05303c9f92
044d8 49ba58e54d1200000000           movabs     r10, 0x124de558
044e2 4c89542408                     mov        qword ptr [rsp + 8], r10
044e7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044ef e86c505f07                     call       0x7f05379c2660
044f4 e9d7c9ffff                     jmp        0x7f05303c9fd0
044f9 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04501 e8da315f07                     call       0x7f05379c07e0
04506 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0450e e8cd315f07                     call       0x7f05379c07e0
04513 e8c8f05e07                     call       0x7f05379bc6e0
04518 49ba48c80520057f0000           movabs     r10, 0x7f052005c848
04522 4c89542408                     mov        qword ptr [rsp + 8], r10
04527 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0452f e82c505f07                     call       0x7f05379c2660
04534 e980cbffff                     jmp        0x7f05303ca1b9
04539 49bab0f2211200000000           movabs     r10, 0x1221f2b0
04543 4c89542408                     mov        qword ptr [rsp + 8], r10
04548 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04550 e80b505f07                     call       0x7f05379c2660
04555 e9accbffff                     jmp        0x7f05303ca206
0455a 49bad057221200000000           movabs     r10, 0x122257d0
04564 4c89542408                     mov        qword ptr [rsp + 8], r10
04569 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04571 e8ea4f5f07                     call       0x7f05379c2660
04576 e9c3cbffff                     jmp        0x7f05303ca23e
0457b 49ba18960520057f0000           movabs     r10, 0x7f0520059618
04585 4c89542408                     mov        qword ptr [rsp + 8], r10
0458a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04592 e8c94f5f07                     call       0x7f05379c2660
04597 e9c3ccffff                     jmp        0x7f05303ca35f
0459c 49ba28861220057f0000           movabs     r10, 0x7f0520128628
045a6 4c89542408                     mov        qword ptr [rsp + 8], r10
045ab 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045b3 e8a84f5f07                     call       0x7f05379c2660
045b8 e94bcdffff                     jmp        0x7f05303ca408
045bd 49ba58e54d1200000000           movabs     r10, 0x124de558
045c7 4c89542408                     mov        qword ptr [rsp + 8], r10
045cc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045d4 e8874f5f07                     call       0x7f05379c2660
045d9 e968cdffff                     jmp        0x7f05303ca446
045de 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
045e6 e8f5305f07                     call       0x7f05379c07e0
045eb 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
045f3 e8e8305f07                     call       0x7f05379c07e0
045f8 49ba10480b20057f0000           movabs     r10, 0x7f05200b4810
04602 4c89542408                     mov        qword ptr [rsp + 8], r10
04607 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0460f e84c4f5f07                     call       0x7f05379c2660
04614 e906ceffff                     jmp        0x7f05303ca51f
04619 49ba90ab0b20057f0000           movabs     r10, 0x7f05200bab90
04623 4c89542408                     mov        qword ptr [rsp + 8], r10
04628 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04630 e82b4f5f07                     call       0x7f05379c2660
04635 e91dceffff                     jmp        0x7f05303ca557
0463a 49baf8510e20057f0000           movabs     r10, 0x7f05200e51f8
04644 4c89542408                     mov        qword ptr [rsp + 8], r10
04649 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04651 e80a4f5f07                     call       0x7f05379c2660
04656 e95cceffff                     jmp        0x7f05303ca5b7
0465b 49bae0af0520057f0000           movabs     r10, 0x7f052005afe0
04665 4c89542408                     mov        qword ptr [rsp + 8], r10
0466a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04672 e8e94e5f07                     call       0x7f05379c2660
04677 e973ceffff                     jmp        0x7f05303ca5ef
0467c 49baf8140e20057f0000           movabs     r10, 0x7f05200e14f8
04686 4c89542408                     mov        qword ptr [rsp + 8], r10
0468b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04693 e8c84e5f07                     call       0x7f05379c2660
04698 e98aceffff                     jmp        0x7f05303ca627
0469d 49ba48c80520057f0000           movabs     r10, 0x7f052005c848
046a7 4c89542408                     mov        qword ptr [rsp + 8], r10
046ac 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046b4 e8a74e5f07                     call       0x7f05379c2660
046b9 e980cfffff                     jmp        0x7f05303ca73e
046be 49bab0f2211200000000           movabs     r10, 0x1221f2b0
046c8 4c89542408                     mov        qword ptr [rsp + 8], r10
046cd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046d5 e8864e5f07                     call       0x7f05379c2660
046da e9a5cfffff                     jmp        0x7f05303ca784
046df 49bad057221200000000           movabs     r10, 0x122257d0
046e9 4c89542408                     mov        qword ptr [rsp + 8], r10
046ee 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046f6 e8654e5f07                     call       0x7f05379c2660
046fb e9bccfffff                     jmp        0x7f05303ca7bc
04700 48890424                       mov        qword ptr [rsp], rax
04704 e8d7165f07                     call       0x7f05379beee0
04709 e8d2ee5e07                     call       0x7f05379bc6e0
0470e 49baa8a30520057f0000           movabs     r10, 0x7f052005a3a8
04718 4c89542408                     mov        qword ptr [rsp + 8], r10
0471d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04725 e8364e5f07                     call       0x7f05379c2660
0472a e947d1ffff                     jmp        0x7f05303ca976
0472f e8acee5e07                     call       0x7f05379bc6e0
04734 49ba28861220057f0000           movabs     r10, 0x7f0520128628
0473e 4c89542408                     mov        qword ptr [rsp + 8], r10
04743 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0474b e8104e5f07                     call       0x7f05379c2660
04750 e9e5d1ffff                     jmp        0x7f05303caa3a
04755 49ba58e54d1200000000           movabs     r10, 0x124de558
0475f 4c89542408                     mov        qword ptr [rsp + 8], r10
04764 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0476c e8ef4d5f07                     call       0x7f05379c2660
04771 e902d2ffff                     jmp        0x7f05303caa78
04776 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0477e e85d2f5f07                     call       0x7f05379c07e0
04783 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0478b e8502f5f07                     call       0x7f05379c07e0
04790 e84bee5e07                     call       0x7f05379bc6e0
04795 49ba48c80520057f0000           movabs     r10, 0x7f052005c848
0479f 4c89542408                     mov        qword ptr [rsp + 8], r10
047a4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047ac e8af4d5f07                     call       0x7f05379c2660
047b1 e9abd3ffff                     jmp        0x7f05303cac61
047b6 49bab0f2211200000000           movabs     r10, 0x1221f2b0
047c0 4c89542408                     mov        qword ptr [rsp + 8], r10
047c5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047cd e88e4d5f07                     call       0x7f05379c2660
047d2 e9d7d3ffff                     jmp        0x7f05303cacae
047d7 49bad057221200000000           movabs     r10, 0x122257d0
047e1 4c89542408                     mov        qword ptr [rsp + 8], r10
047e6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047ee e86d4d5f07                     call       0x7f05379c2660
047f3 e9eed3ffff                     jmp        0x7f05303cace6
047f8 49ba38de4120057f0000           movabs     r10, 0x7f052041de38
04802 4c89542408                     mov        qword ptr [rsp + 8], r10
04807 48c704240a020000               mov        qword ptr [rsp], 0x20a
0480f e84c4d5f07                     call       0x7f05379c2660
04814 e994d4ffff                     jmp        0x7f05303cadad
04819 660f1f440000                   nop        word ptr [rax + rax]
0481f e83cdf5207                     call       0x7f05378fb860
04824 e975d5ffff                     jmp        0x7f05303cae9e
04829 660f1f440000                   nop        word ptr [rax + rax]
0482f e82cdf5207                     call       0x7f05378fb860
04834 e9f2d6ffff                     jmp        0x7f05303cb02b
04839 49bad0054220057f0000           movabs     r10, 0x7f05204205d0
04843 4c89542408                     mov        qword ptr [rsp + 8], r10
04848 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04850 e80b4d5f07                     call       0x7f05379c2660
04855 e950d7ffff                     jmp        0x7f05303cb0aa
0485a 49ba485a2a1200000000           movabs     r10, 0x122a5a48
04864 4c89542408                     mov        qword ptr [rsp + 8], r10
04869 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04871 e8ea4c5f07                     call       0x7f05379c2660
04876 e9a6d7ffff                     jmp        0x7f05303cb121
0487b 49baa823211200000000           movabs     r10, 0x122123a8
04885 4c89542408                     mov        qword ptr [rsp + 8], r10
0488a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04892 e8c94c5f07                     call       0x7f05379c2660
04897 e917d8ffff                     jmp        0x7f05303cb1b3
0489c 49ba10472a1200000000           movabs     r10, 0x122a4710
048a6 4c89542408                     mov        qword ptr [rsp + 8], r10
048ab 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048b3 e8a84c5f07                     call       0x7f05379c2660
048b8 e9b8d8ffff                     jmp        0x7f05303cb275
048bd 49ba50d3381200000000           movabs     r10, 0x1238d350
048c7 4c89542408                     mov        qword ptr [rsp + 8], r10
048cc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048d4 e8874c5f07                     call       0x7f05379c2660
048d9 e9fcd8ffff                     jmp        0x7f05303cb2da
048de 49ba28cf381200000000           movabs     r10, 0x1238cf28
048e8 4c89542408                     mov        qword ptr [rsp + 8], r10
048ed 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048f5 e8664c5f07                     call       0x7f05379c2660
048fa e90ed9ffff                     jmp        0x7f05303cb30d
048ff e8dcec5e07                     call       0x7f05379bc6e0
04904 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0490c e8cf2d5f07                     call       0x7f05379c07e0
04911 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04919 e8c22d5f07                     call       0x7f05379c07e0
0491e 49ba38de4120057f0000           movabs     r10, 0x7f052041de38
04928 4c89542408                     mov        qword ptr [rsp + 8], r10
0492d 48c70424aa020000               mov        qword ptr [rsp], 0x2aa
04935 e8264c5f07                     call       0x7f05379c2660
0493a e935daffff                     jmp        0x7f05303cb474
0493f 49ba18960520057f0000           movabs     r10, 0x7f0520059618
04949 4c89542408                     mov        qword ptr [rsp + 8], r10
0494e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04956 e8054c5f07                     call       0x7f05379c2660
0495b e90adbffff                     jmp        0x7f05303cb56a
04960 e87bec5e07                     call       0x7f05379bc6e0
04965 49ba28861220057f0000           movabs     r10, 0x7f0520128628
0496f 4c89542408                     mov        qword ptr [rsp + 8], r10
04974 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0497c e8df4b5f07                     call       0x7f05379c2660
04981 e98cdbffff                     jmp        0x7f05303cb612
04986 49ba58e54d1200000000           movabs     r10, 0x124de558
04990 4c89542408                     mov        qword ptr [rsp + 8], r10
04995 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0499d e8be4b5f07                     call       0x7f05379c2660
049a2 e9a4dbffff                     jmp        0x7f05303cb64b
049a7 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
049af e82c2d5f07                     call       0x7f05379c07e0
049b4 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
049bc e81f2d5f07                     call       0x7f05379c07e0
049c1 49ba10480b20057f0000           movabs     r10, 0x7f05200b4810
049cb 4c89542408                     mov        qword ptr [rsp + 8], r10
049d0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049d8 e8834b5f07                     call       0x7f05379c2660
049dd e937dcffff                     jmp        0x7f05303cb719
049e2 49ba90ab0b20057f0000           movabs     r10, 0x7f05200bab90
049ec 4c89542408                     mov        qword ptr [rsp + 8], r10
049f1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049f9 e8624b5f07                     call       0x7f05379c2660
049fe e949dcffff                     jmp        0x7f05303cb74c
04a03 49baf8510e20057f0000           movabs     r10, 0x7f05200e51f8
04a0d 4c89542408                     mov        qword ptr [rsp + 8], r10
04a12 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a1a e8414b5f07                     call       0x7f05379c2660
04a1f e98cdcffff                     jmp        0x7f05303cb7b0
04a24 49bae0af0520057f0000           movabs     r10, 0x7f052005afe0
04a2e 4c89542408                     mov        qword ptr [rsp + 8], r10
04a33 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a3b e8204b5f07                     call       0x7f05379c2660
04a40 e9a6dcffff                     jmp        0x7f05303cb7eb
04a45 49baf8140e20057f0000           movabs     r10, 0x7f05200e14f8
04a4f 4c89542408                     mov        qword ptr [rsp + 8], r10
04a54 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a5c e8ff4a5f07                     call       0x7f05379c2660
04a61 e9b8dcffff                     jmp        0x7f05303cb81e
04a66 49ba48c80520057f0000           movabs     r10, 0x7f052005c848
04a70 4c89542408                     mov        qword ptr [rsp + 8], r10
04a75 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a7d e8de4a5f07                     call       0x7f05379c2660
04a82 e9a5ddffff                     jmp        0x7f05303cb92c
04a87 49bab0f2211200000000           movabs     r10, 0x1221f2b0
04a91 4c89542408                     mov        qword ptr [rsp + 8], r10
04a96 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a9e e8bd4a5f07                     call       0x7f05379c2660
04aa3 e9c5ddffff                     jmp        0x7f05303cb96d
04aa8 49bad057221200000000           movabs     r10, 0x122257d0
04ab2 4c89542408                     mov        qword ptr [rsp + 8], r10
04ab7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04abf e89c4a5f07                     call       0x7f05379c2660
04ac4 e9d7ddffff                     jmp        0x7f05303cb9a0
04ac9 48890424                       mov        qword ptr [rsp], rax
04acd e80e135f07                     call       0x7f05379beee0
04ad2 e809eb5e07                     call       0x7f05379bc6e0
04ad7 49baa8a30520057f0000           movabs     r10, 0x7f052005a3a8
04ae1 4c89542408                     mov        qword ptr [rsp + 8], r10
04ae6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04aee e86d4a5f07                     call       0x7f05379c2660
04af3 e956dfffff                     jmp        0x7f05303cbb4e
04af8 49ba28861220057f0000           movabs     r10, 0x7f0520128628
04b02 4c89542408                     mov        qword ptr [rsp + 8], r10
04b07 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b0f e84c4a5f07                     call       0x7f05379c2660
04b14 e9eedfffff                     jmp        0x7f05303cbc07
04b19 49ba58e54d1200000000           movabs     r10, 0x124de558
04b23 4c89542408                     mov        qword ptr [rsp + 8], r10
04b28 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b30 e82b4a5f07                     call       0x7f05379c2660
04b35 e914e0ffff                     jmp        0x7f05303cbc4e
04b3a 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04b42 e8992b5f07                     call       0x7f05379c07e0
04b47 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04b4f e88c2b5f07                     call       0x7f05379c07e0
04b54 e887ea5e07                     call       0x7f05379bc6e0
04b59 49ba48c80520057f0000           movabs     r10, 0x7f052005c848
04b63 4c89542408                     mov        qword ptr [rsp + 8], r10
04b68 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b70 e8eb495f07                     call       0x7f05379c2660
04b75 e9bfe1ffff                     jmp        0x7f05303cbe39
04b7a 49bab0f2211200000000           movabs     r10, 0x1221f2b0
04b84 4c89542408                     mov        qword ptr [rsp + 8], r10
04b89 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b91 e8ca495f07                     call       0x7f05379c2660
04b96 e9ebe1ffff                     jmp        0x7f05303cbe86
04b9b 49bad057221200000000           movabs     r10, 0x122257d0
04ba5 4c89542408                     mov        qword ptr [rsp + 8], r10
04baa 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bb2 e8a9495f07                     call       0x7f05379c2660
04bb7 e902e2ffff                     jmp        0x7f05303cbebe
04bbc 49ba38de4120057f0000           movabs     r10, 0x7f052041de38
04bc6 4c89542408                     mov        qword ptr [rsp + 8], r10
04bcb 48c70424e8020000               mov        qword ptr [rsp], 0x2e8
04bd3 e888495f07                     call       0x7f05379c2660
04bd8 e9a5e2ffff                     jmp        0x7f05303cbf82
04bdd 49bad0054220057f0000           movabs     r10, 0x7f05204205d0
04be7 4c89542408                     mov        qword ptr [rsp + 8], r10
04bec 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bf4 e867495f07                     call       0x7f05379c2660
04bf9 e964e3ffff                     jmp        0x7f05303cc062
04bfe 49ba485a2a1200000000           movabs     r10, 0x122a5a48
04c08 4c89542408                     mov        qword ptr [rsp + 8], r10
04c0d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c15 e846495f07                     call       0x7f05379c2660
04c1a e9bae3ffff                     jmp        0x7f05303cc0d9
04c1f 49baa823211200000000           movabs     r10, 0x122123a8
04c29 4c89542408                     mov        qword ptr [rsp + 8], r10
04c2e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c36 e825495f07                     call       0x7f05379c2660
04c3b e92be4ffff                     jmp        0x7f05303cc16b
04c40 49ba10472a1200000000           movabs     r10, 0x122a4710
04c4a 4c89542408                     mov        qword ptr [rsp + 8], r10
04c4f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c57 e804495f07                     call       0x7f05379c2660
04c5c e9cce4ffff                     jmp        0x7f05303cc22d
04c61 49ba50d3381200000000           movabs     r10, 0x1238d350
04c6b 4c89542408                     mov        qword ptr [rsp + 8], r10
04c70 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c78 e8e3485f07                     call       0x7f05379c2660
04c7d e910e5ffff                     jmp        0x7f05303cc292
04c82 49ba28cf381200000000           movabs     r10, 0x1238cf28
04c8c 4c89542408                     mov        qword ptr [rsp + 8], r10
04c91 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c99 e8c2485f07                     call       0x7f05379c2660
04c9e e922e5ffff                     jmp        0x7f05303cc2c5
04ca3 e838e95e07                     call       0x7f05379bc6e0
04ca8 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04cb0 e82b2a5f07                     call       0x7f05379c07e0
04cb5 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04cbd e81e2a5f07                     call       0x7f05379c07e0
04cc2 49ba38de4120057f0000           movabs     r10, 0x7f052041de38
04ccc 4c89542408                     mov        qword ptr [rsp + 8], r10
04cd1 48c7042420030000               mov        qword ptr [rsp], 0x320
04cd9 e882485f07                     call       0x7f05379c2660
04cde e949e6ffff                     jmp        0x7f05303cc42c
04ce3 49ba18960520057f0000           movabs     r10, 0x7f0520059618
04ced 4c89542408                     mov        qword ptr [rsp + 8], r10
04cf2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cfa e861485f07                     call       0x7f05379c2660
04cff e909e7ffff                     jmp        0x7f05303cc50d
04d04 e8d7e85e07                     call       0x7f05379bc6e0
04d09 49ba28861220057f0000           movabs     r10, 0x7f0520128628
04d13 4c89542408                     mov        qword ptr [rsp + 8], r10
04d18 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d20 e83b485f07                     call       0x7f05379c2660
04d25 e98ae7ffff                     jmp        0x7f05303cc5b4
04d2a 49ba58e54d1200000000           movabs     r10, 0x124de558
04d34 4c89542408                     mov        qword ptr [rsp + 8], r10
04d39 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d41 e81a485f07                     call       0x7f05379c2660
04d46 e9a2e7ffff                     jmp        0x7f05303cc5ed
04d4b 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04d53 e888295f07                     call       0x7f05379c07e0
04d58 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04d60 e87b295f07                     call       0x7f05379c07e0
04d65 49ba10480b20057f0000           movabs     r10, 0x7f05200b4810
04d6f 4c89542408                     mov        qword ptr [rsp + 8], r10
04d74 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d7c e8df475f07                     call       0x7f05379c2660
04d81 e92de8ffff                     jmp        0x7f05303cc6b3
04d86 49ba90ab0b20057f0000           movabs     r10, 0x7f05200bab90
04d90 4c89542408                     mov        qword ptr [rsp + 8], r10
04d95 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d9d e8be475f07                     call       0x7f05379c2660
04da2 e93fe8ffff                     jmp        0x7f05303cc6e6
04da7 49baf8510e20057f0000           movabs     r10, 0x7f05200e51f8
04db1 4c89542408                     mov        qword ptr [rsp + 8], r10
04db6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04dbe e89d475f07                     call       0x7f05379c2660
04dc3 e975e8ffff                     jmp        0x7f05303cc73d
04dc8 49bae0af0520057f0000           movabs     r10, 0x7f052005afe0
04dd2 4c89542408                     mov        qword ptr [rsp + 8], r10
04dd7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ddf e87c475f07                     call       0x7f05379c2660
04de4 e98ae8ffff                     jmp        0x7f05303cc773
04de9 49baf8140e20057f0000           movabs     r10, 0x7f05200e14f8
04df3 4c89542408                     mov        qword ptr [rsp + 8], r10
04df8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e00 e85b475f07                     call       0x7f05379c2660
04e05 e99ce8ffff                     jmp        0x7f05303cc7a6
04e0a 49ba48c80520057f0000           movabs     r10, 0x7f052005c848
04e14 4c89542408                     mov        qword ptr [rsp + 8], r10
04e19 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e21 e83a475f07                     call       0x7f05379c2660
04e26 e989e9ffff                     jmp        0x7f05303cc8b4
04e2b 49bab0f2211200000000           movabs     r10, 0x1221f2b0
04e35 4c89542408                     mov        qword ptr [rsp + 8], r10
04e3a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e42 e819475f07                     call       0x7f05379c2660
04e47 e9a9e9ffff                     jmp        0x7f05303cc8f5
04e4c 49bad057221200000000           movabs     r10, 0x122257d0
04e56 4c89542408                     mov        qword ptr [rsp + 8], r10
04e5b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e63 e8f8465f07                     call       0x7f05379c2660
04e68 e9bbe9ffff                     jmp        0x7f05303cc928
04e6d 48890424                       mov        qword ptr [rsp], rax
04e71 e86a0f5f07                     call       0x7f05379beee0
04e76 e865e75e07                     call       0x7f05379bc6e0
04e7b 49baa8a30520057f0000           movabs     r10, 0x7f052005a3a8
04e85 4c89542408                     mov        qword ptr [rsp + 8], r10
04e8a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e92 e8c9465f07                     call       0x7f05379c2660
04e97 e93aebffff                     jmp        0x7f05303ccad6
04e9c 49ba28861220057f0000           movabs     r10, 0x7f0520128628
04ea6 4c89542408                     mov        qword ptr [rsp + 8], r10
04eab 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04eb3 e8a8465f07                     call       0x7f05379c2660
04eb8 e9d2ebffff                     jmp        0x7f05303ccb8f
04ebd 49ba58e54d1200000000           movabs     r10, 0x124de558
04ec7 4c89542408                     mov        qword ptr [rsp + 8], r10
04ecc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ed4 e887465f07                     call       0x7f05379c2660
04ed9 e9f5ebffff                     jmp        0x7f05303ccbd3
04ede 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04ee6 e8f5275f07                     call       0x7f05379c07e0
04eeb 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04ef3 e8e8275f07                     call       0x7f05379c07e0
04ef8 e8e3e65e07                     call       0x7f05379bc6e0
04efd 49ba48c80520057f0000           movabs     r10, 0x7f052005c848
04f07 4c89542408                     mov        qword ptr [rsp + 8], r10
04f0c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f14 e847465f07                     call       0x7f05379c2660
04f19 e99bedffff                     jmp        0x7f05303ccdb9
04f1e 49bab0f2211200000000           movabs     r10, 0x1221f2b0
04f28 4c89542408                     mov        qword ptr [rsp + 8], r10
04f2d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f35 e826465f07                     call       0x7f05379c2660
04f3a e9c7edffff                     jmp        0x7f05303cce06
04f3f 49bad057221200000000           movabs     r10, 0x122257d0
04f49 4c89542408                     mov        qword ptr [rsp + 8], r10
04f4e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f56 e805465f07                     call       0x7f05379c2660
04f5b e9deedffff                     jmp        0x7f05303cce3e
04f60 49ba38de4120057f0000           movabs     r10, 0x7f052041de38
04f6a 4c89542408                     mov        qword ptr [rsp + 8], r10
04f6f 48c704245a030000               mov        qword ptr [rsp], 0x35a
04f77 e8e4455f07                     call       0x7f05379c2660
04f7c e996eeffff                     jmp        0x7f05303ccf17
04f81 660f1f440000                   nop        word ptr [rax + rax]
04f87 e8d4d75207                     call       0x7f05378fb860
04f8c e952f0ffff                     jmp        0x7f05303cd0e3
04f91 49ba04d13c30057f0000           movabs     r10, 0x7f05303cd104
04f9b 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
04fa2 e939fe5207                     jmp        0x7f05378fdee0
04fa7 48ba0000000000000000           movabs     rdx, 0
04fb1 b8000f050a                     mov        eax, 0xa050f00
04fb6 e8a5305f07                     call       0x7f05379c1160
04fbb e978f0ffff                     jmp        0x7f05303cd138
04fc0 e81be65e07                     call       0x7f05379bc6e0
04fc5 488bd2                         mov        rdx, rdx
04fc8 e893f35e07                     call       0x7f05379bd460
04fcd e9b5f0ffff                     jmp        0x7f05303cd187
04fd2 48ba0000000000000000           movabs     rdx, 0
04fdc b8000f050a                     mov        eax, 0xa050f00
04fe1 e87a3c5f07                     call       0x7f05379c1d60
04fe6 e99df0ffff                     jmp        0x7f05303cd188
04feb 48ba0000000000000000           movabs     rdx, 0
04ff5 b8000f050a                     mov        eax, 0xa050f00
04ffa e861305f07                     call       0x7f05379c1160
04fff e91cf1ffff                     jmp        0x7f05303cd220
05004 e8d7e55e07                     call       0x7f05379bc6e0
05009 488bd2                         mov        rdx, rdx
0500c e84ff35e07                     call       0x7f05379bd460
05011 e959f1ffff                     jmp        0x7f05303cd26f
05016 48ba0000000000000000           movabs     rdx, 0
05020 b8000f050a                     mov        eax, 0xa050f00
05025 e836305f07                     call       0x7f05379c1160
0502a e991f1ffff                     jmp        0x7f05303cd2c0
0502f e8ace55e07                     call       0x7f05379bc6e0
05034 488bd2                         mov        rdx, rdx
05037 e824f35e07                     call       0x7f05379bd460
0503c e9cef1ffff                     jmp        0x7f05303cd30f
05041 498b8778050000                 mov        rax, qword ptr [r15 + 0x578]
05048 49c7877805000000000000         mov        qword ptr [r15 + 0x578], 0
05053 49c7878005000000000000         mov        qword ptr [r15 + 0x580], 0
0505e 4881c450020000                 add        rsp, 0x250
05065 5d                             pop        rbp
05066 e975d65e07                     jmp        0x7f05379bb7e0
0506b f4                             hlt        
0506c f4                             hlt        
0506d f4                             hlt        
0506e f4                             hlt        
0506f f4                             hlt        
