00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c0b55307                   jne        0x7f959b8fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ec50020000                 sub        rsp, 0x250
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 7405                           je         0x7f95943bf3bf
0003a e8e1b65207                     call       0x7f959b8eaaa0
0003f 4889b42448010000               mov        qword ptr [rsp + 0x148], rsi
00047 4889942468010000               mov        qword ptr [rsp + 0x168], rdx
0004f 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
00056 4c89842428010000               mov        qword ptr [rsp + 0x128], r8
0005e 4c898c2420010000               mov        qword ptr [rsp + 0x120], r9
00066 89bc2430010000                 mov        dword ptr [rsp + 0x130], edi
0006d 48bbd8ab708c957f0000           movabs     rbx, 0x7f958c70abd8
00077 8b4370                         mov        eax, dword ptr [rbx + 0x70]
0007a 83c002                         add        eax, 2
0007d 894370                         mov        dword ptr [rbx + 0x70], eax
00080 25fe070000                     and        eax, 0x7fe
00085 85c0                           test       eax, eax
00087 0f84c4410000                   je         0x7f95943c35d1
0008d 48bbd8ab708c957f0000           movabs     rbx, 0x7f958c70abd8
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
000e1 48b8d8ab708c957f0000           movabs     rax, 0x7f958c70abd8
000eb b9f8000000                     mov        ecx, 0xf8
000f0 7f05                           jg         0x7f95943bf477
000f2 b908010000                     mov        ecx, 0x108
000f7 44899c2440010000               mov        dword ptr [rsp + 0x140], r11d
000ff 4c8b1c08                       mov        r11, qword ptr [rax + rcx]
00103 4d8d5b01                       lea        r11, [r11 + 1]
00107 4c891c08                       mov        qword ptr [rax + rcx], r11
0010b 0f8fa0400000                   jg         0x7f95943c3531
00111 4863db                         movsxd     rbx, ebx
00114 488b4e20                       mov        rcx, qword ptr [rsi + 0x20]
00118 482bcf                         sub        rcx, rdi
0011b 483bcb                         cmp        rcx, rbx
0011e 48b9d8ab708c957f0000           movabs     rcx, 0x7f958c70abd8
00128 b828010000                     mov        eax, 0x128
0012d 7c05                           jl         0x7f95943bf4b4
0012f b818010000                     mov        eax, 0x118
00134 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
00138 4d8d5b01                       lea        r11, [r11 + 1]
0013c 4c891c01                       mov        qword ptr [rcx + rax], r11
00140 0f8c6b400000                   jl         0x7f95943c3531
00146 48b9d8ab708c957f0000           movabs     rcx, 0x7f958c70abd8
00150 ff8158010000                   inc        dword ptr [rcx + 0x158]
00156 b900000000                     mov        ecx, 0
0015b 498bc0                         mov        rax, r8
0015e 483bc1                         cmp        rax, rcx
00161 48b9d8ab708c957f0000           movabs     rcx, 0x7f958c70abd8
0016b b868010000                     mov        eax, 0x168
00170 7505                           jne        0x7f95943bf4f7
00172 b878010000                     mov        eax, 0x178
00177 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
0017b 4d8d5b01                       lea        r11, [r11 + 1]
0017f 4c891c01                       mov        qword ptr [rcx + rax], r11
00183 0f8531000000                   jne        0x7f95943bf53a
00189 4803df                         add        rbx, rdi
0018c 498bc9                         mov        rcx, r9
0018f 483bcb                         cmp        rcx, rbx
00192 48b9d8ab708c957f0000           movabs     rcx, 0x7f958c70abd8
0019c bf98010000                     mov        edi, 0x198
001a1 7d05                           jge        0x7f95943bf528
001a3 bf88010000                     mov        edi, 0x188
001a8 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
001ac 488d5b01                       lea        rbx, [rbx + 1]
001b0 48891c39                       mov        qword ptr [rcx + rdi], rbx
001b4 0f8d0a000000                   jge        0x7f95943bf544
001ba bf00000000                     mov        edi, 0
001bf e915000000                     jmp        0x7f95943bf559
001c4 48b9d8ab708c957f0000           movabs     rcx, 0x7f958c70abd8
001ce ff81a8010000                   inc        dword ptr [rcx + 0x1a8]
001d4 bf01000000                     mov        edi, 1
001d9 4d2bc6                         sub        r8, r14
001dc 4c89842480010000               mov        qword ptr [rsp + 0x180], r8
001e4 48b9d8ab708c957f0000           movabs     rcx, 0x7f958c70abd8
001ee 488381c001000001               add        qword ptr [rcx + 0x1c0], 1
001f6 48b9f8976e8c957f0000           movabs     rcx, 0x7f958c6e97f8
00200 8b5970                         mov        ebx, dword ptr [rcx + 0x70]
00203 83c302                         add        ebx, 2
00206 895970                         mov        dword ptr [rcx + 0x70], ebx
00209 81e3feff1f00                   and        ebx, 0x1ffffe
0020f 85db                           test       ebx, ebx
00211 0f845b400000                   je         0x7f95943c35f2
00217 48b9ffffffffffffff7f           movabs     rcx, 0x7fffffffffffffff
00221 493bc9                         cmp        rcx, r9
00224 48b9f8976e8c957f0000           movabs     rcx, 0x7f958c6e97f8
0022e bbb8000000                     mov        ebx, 0xb8
00233 7d05                           jge        0x7f95943bf5ba
00235 bba8000000                     mov        ebx, 0xa8
0023a 488b0419                       mov        rax, qword ptr [rcx + rbx]
0023e 488d4001                       lea        rax, [rax + 1]
00242 48890419                       mov        qword ptr [rcx + rbx], rax
00246 0f8d0f000000                   jge        0x7f95943bf5db
0024c 49b9ffffffffffffff7f           movabs     r9, 0x7fffffffffffffff
00256 e910000000                     jmp        0x7f95943bf5eb
0025b 48b9f8976e8c957f0000           movabs     rcx, 0x7f958c6e97f8
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
002f2 48bfd8ab708c957f0000           movabs     rdi, 0x7f958c70abd8
002fc b8d0010000                     mov        eax, 0x1d0
00301 7d05                           jge        0x7f95943bf688
00303 b8e0010000                     mov        eax, 0x1e0
00308 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
0030c 4d8d5b01                       lea        r11, [r11 + 1]
00310 4c891c07                       mov        qword ptr [rdi + rax], r11
00314 0f8df23b0000                   jge        0x7f95943c328c
0031a 413b5004                       cmp        edx, dword ptr [r8 + 4]
0031e 0f837e3f0000                   jae        0x7f95943c3622
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
00367 48b9d8ab708c957f0000           movabs     rcx, 0x7f958c70abd8
00371 41b8f0010000                   mov        r8d, 0x1f0
00377 7d06                           jge        0x7f95943bf6ff
00379 41b800020000                   mov        r8d, 0x200
0037f 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00383 4d8d6d01                       lea        r13, [r13 + 1]
00387 4e892c01                       mov        qword ptr [rcx + r8], r13
0038b 0f8d15000000                   jge        0x7f95943bf726
00391 413b5104                       cmp        edx, dword ptr [r9 + 4]
00395 0f831f3f0000                   jae        0x7f95943c363a
0039b 4863ca                         movsxd     rcx, edx
0039e 418b4c8908                     mov        ecx, dword ptr [r9 + rcx*4 + 8]
003a3 488bc1                         mov        rax, rcx
003a6 85ff                           test       edi, edi
003a8 48b9d8ab708c957f0000           movabs     rcx, 0x7f958c70abd8
003b2 41b810020000                   mov        r8d, 0x210
003b8 7406                           je         0x7f95943bf740
003ba 41b820020000                   mov        r8d, 0x220
003c0 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003c4 4d8d6d01                       lea        r13, [r13 + 1]
003c8 4e892c01                       mov        qword ptr [rcx + r8], r13
003cc 0f8431000000                   je         0x7f95943bf783
003d2 498bcb                         mov        rcx, r11
003d5 2bce                           sub        ecx, esi
003d7 3bf9                           cmp        edi, ecx
003d9 48b9d8ab708c957f0000           movabs     rcx, 0x7f958c70abd8
003e3 41b840020000                   mov        r8d, 0x240
003e9 7f06                           jg         0x7f95943bf771
003eb 41b830020000                   mov        r8d, 0x230
003f1 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003f5 4d8d6d01                       lea        r13, [r13 + 1]
003f9 4e892c01                       mov        qword ptr [rcx + r8], r13
003fd 0f8f0e3d0000                   jg         0x7f95943c3491
00403 83f803                         cmp        eax, 3
00406 48b9d8ab708c957f0000           movabs     rcx, 0x7f958c70abd8
00410 41b860020000                   mov        r8d, 0x260
00416 7e06                           jle        0x7f95943bf79e
00418 41b870020000                   mov        r8d, 0x270
0041e 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00422 4d8d6d01                       lea        r13, [r13 + 1]
00426 4e892c01                       mov        qword ptr [rcx + r8], r13
0042a 0f8e59000000                   jle        0x7f95943bf809
00430 83e803                         sub        eax, 3
00433 837b0401                       cmp        dword ptr [rbx + 4], 1
00437 0f86953e0000                   jbe        0x7f95943c3652
0043d 8b4b0c                         mov        ecx, dword ptr [rbx + 0xc]
00440 837b0402                       cmp        dword ptr [rbx + 4], 2
00444 0f869a3e0000                   jbe        0x7f95943c3664
0044a 894b10                         mov        dword ptr [rbx + 0x10], ecx
0044d 8b4b08                         mov        ecx, dword ptr [rbx + 8]
00450 894b0c                         mov        dword ptr [rbx + 0xc], ecx
00453 894308                         mov        dword ptr [rbx + 8], eax
00456 48b9d8ab708c957f0000           movabs     rcx, 0x7f958c70abd8
00460 ff8180020000                   inc        dword ptr [rcx + 0x280]
00466 89942444010000                 mov        dword ptr [rsp + 0x144], edx
0046d 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
00474 4c8bb42488010000               mov        r14, qword ptr [rsp + 0x188]
0047c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
00484 e952000000                     jmp        0x7f95943bf85b
00489 89942444010000                 mov        dword ptr [rsp + 0x144], edx
00490 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
00497 49b8d8ab708c957f0000           movabs     r8, 0x7f958c70abd8
004a1 4983809802000001               add        qword ptr [r8 + 0x298], 1
004a9 488bf3                         mov        rsi, rbx
004ac 488bd0                         mov        rdx, rax
004af 488bcf                         mov        rcx, rdi
004b2 0f1f440000                     nop        dword ptr [rax + rax]
004b7 e824c05307                     call       0x7f959b8fb860
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
004f0 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
004fa b9b8020000                     mov        ecx, 0x2b8
004ff 7d05                           jge        0x7f95943bf886
00501 b9a8020000                     mov        ecx, 0x2a8
00506 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0050a 4d8d4001                       lea        r8, [r8 + 1]
0050e 4c89040a                       mov        qword ptr [rdx + rcx], r8
00512 0f8d15000000                   jge        0x7f95943bf8ad
00518 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00520 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00528 e9ad000000                     jmp        0x7f95943bf95a
0052d 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00535 4585ed                         test       r13d, r13d
00538 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
00542 b9c8020000                     mov        ecx, 0x2c8
00547 7505                           jne        0x7f95943bf8ce
00549 b9d8020000                     mov        ecx, 0x2d8
0054e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
00552 4d8d4001                       lea        r8, [r8 + 1]
00556 4c89040a                       mov        qword ptr [rdx + rcx], r8
0055a 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00562 0f8568000000                   jne        0x7f95943bf950
00568 498bd3                         mov        rdx, r11
0056b 03d7                           add        edx, edi
0056d 2bd0                           sub        edx, eax
0056f 4863d2                         movsxd     rdx, edx
00572 493bd0                         cmp        rdx, r8
00575 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
0057f b9e8020000                     mov        ecx, 0x2e8
00584 7c05                           jl         0x7f95943bf90b
00586 b9f8020000                     mov        ecx, 0x2f8
0058b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0058f 4d8d4901                       lea        r9, [r9 + 1]
00593 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00597 0f8c3d000000                   jl         0x7f95943bf95a
0059d 4c8b8c2450010000               mov        r9, qword ptr [rsp + 0x150]
005a5 4c3bcb                         cmp        r9, rbx
005a8 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
005b2 b918030000                     mov        ecx, 0x318
005b7 7c05                           jl         0x7f95943bf93e
005b9 b908030000                     mov        ecx, 0x308
005be 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
005c2 4d8d4901                       lea        r9, [r9 + 1]
005c6 4c890c0a                       mov        qword ptr [rdx + rcx], r9
005ca 0f8c0a000000                   jl         0x7f95943bf95a
005d0 ba00000000                     mov        edx, 0
005d5 e915000000                     jmp        0x7f95943bf96f
005da 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
005e4 ff8228030000                   inc        dword ptr [rdx + 0x328]
005ea ba01000000                     mov        edx, 1
005ef 48899c2498010000               mov        qword ptr [rsp + 0x198], rbx
005f7 85c0                           test       eax, eax
005f9 48b9d8ab708c957f0000           movabs     rcx, 0x7f958c70abd8
00603 41b940030000                   mov        r9d, 0x340
00609 7e06                           jle        0x7f95943bf991
0060b 41b950030000                   mov        r9d, 0x350
00611 4a8b1c09                       mov        rbx, qword ptr [rcx + r9]
00615 488d5b01                       lea        rbx, [rbx + 1]
00619 4a891c09                       mov        qword ptr [rcx + r9], rbx
0061d 0f8e3f380000                   jle        0x7f95943c31e2
00623 85d2                           test       edx, edx
00625 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
0062f b970030000                     mov        ecx, 0x370
00634 7505                           jne        0x7f95943bf9bb
00636 b960030000                     mov        ecx, 0x360
0063b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0063f 4d8d4901                       lea        r9, [r9 + 1]
00643 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00647 0f8515380000                   jne        0x7f95943c31e2
0064d 498bdb                         mov        rbx, r11
00650 03df                           add        ebx, edi
00652 899c24a0010000                 mov        dword ptr [rsp + 0x1a0], ebx
00659 488bf3                         mov        rsi, rbx
0065c 03b42478010000                 add        esi, dword ptr [rsp + 0x178]
00663 3bb42458010000                 cmp        esi, dword ptr [rsp + 0x158]
0066a 48bed8ab708c957f0000           movabs     rsi, 0x7f958c70abd8
00674 ba28040000                     mov        edx, 0x428
00679 7f05                           jg         0x7f95943bfa00
0067b ba38040000                     mov        edx, 0x438
00680 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
00684 488d4901                       lea        rcx, [rcx + 1]
00688 48890c16                       mov        qword ptr [rsi + rdx], rcx
0068c 0f8f3f000000                   jg         0x7f95943bfa51
00692 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
00699 03f7                           add        esi, edi
0069b 89b424a4010000                 mov        dword ptr [rsp + 0x1a4], esi
006a2 3bb4245c010000                 cmp        esi, dword ptr [rsp + 0x15c]
006a9 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
006b3 b958040000                     mov        ecx, 0x458
006b8 7e05                           jle        0x7f95943bfa3f
006ba b948040000                     mov        ecx, 0x448
006bf 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
006c3 4d8d4901                       lea        r9, [r9 + 1]
006c7 4c890c0a                       mov        qword ptr [rdx + rcx], r9
006cb 0f8e76000000                   jle        0x7f95943bfac7
006d1 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
006d9 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
006e1 48bed8ab708c957f0000           movabs     rsi, 0x7f958c70abd8
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
00727 e8b4bd5307                     call       0x7f959b8fb860
0072c 0f1f840024080001               nop        dword ptr [rax + rax + 0x1000824]
00734 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
0073b 03b4247c010000                 add        esi, dword ptr [rsp + 0x17c]
00742 e999360000                     jmp        0x7f95943c3160
00747 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
0074f 83ff10                         cmp        edi, 0x10
00752 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
0075c b968040000                     mov        ecx, 0x468
00761 7f05                           jg         0x7f95943bfae8
00763 b978040000                     mov        ecx, 0x478
00768 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0076c 4d8d4901                       lea        r9, [r9 + 1]
00770 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00774 0f8f870b0000                   jg         0x7f95943c0681
0077a 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
00784 4883828804000001               add        qword ptr [rdx + 0x488], 1
0078c 48ba68b86e8c957f0000           movabs     rdx, 0x7f958c6eb868
00796 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00799 83c102                         add        ecx, 2
0079c 894a70                         mov        dword ptr [rdx + 0x70], ecx
0079f 81e1feff1f00                   and        ecx, 0x1ffffe
007a5 85c9                           test       ecx, ecx
007a7 0f84493b0000                   je         0x7f95943c3676
007ad 48bae89372e200000000           movabs     rdx, 0xe27293e8
007b7 48b968b86e8c957f0000           movabs     rcx, 0x7f958c6eb868
007c1 8b12                           mov        edx, dword ptr [rdx]
007c3 c1ea0d                         shr        edx, 0xd
007c6 48c1e20a                       shl        rdx, 0xa
007ca 41ba00000054                   mov        r10d, 0x54000000
007d0 4903d2                         add        rdx, r10
007d3 41ba16000000                   mov        r10d, 0x16
007d9 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
007dd 7436                           je         0x7f95943bfb95
007df 4983c202                       add        r10, 2
007e3 4983fa1a                       cmp        r10, 0x1a
007e7 75f0                           jne        0x7f95943bfb59
007e9 41ba16000000                   mov        r10d, 0x16
007ef 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
007f4 7412                           je         0x7f95943bfb88
007f6 4983c202                       add        r10, 2
007fa 4983fa1a                       cmp        r10, 0x1a
007fe 75ef                           jne        0x7f95943bfb6f
00800 41ba15000000                   mov        r10d, 0x15
00806 eb11                           jmp        0x7f95943bfb99
00808 50                             push       rax
00809 4833c0                         xor        rax, rax
0080c f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
00812 58                             pop        rax
00813 ebbe                           jmp        0x7f95943bfb53
00815 4983c201                       add        r10, 1
00819 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0081e 48ba68b86e8c957f0000           movabs     rdx, 0x7f958c6eb868
00828 488382d800000001               add        qword ptr [rdx + 0xd8], 1
00830 48ba88a46e8c957f0000           movabs     rdx, 0x7f958c6ea488
0083a 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0083d 83c102                         add        ecx, 2
00840 894a70                         mov        dword ptr [rdx + 0x70], ecx
00843 81e1feff1f00                   and        ecx, 0x1ffffe
00849 85c9                           test       ecx, ecx
0084b 0f84c63a0000                   je         0x7f95943c3697
00851 448bac2490010000               mov        r13d, dword ptr [rsp + 0x190]
00859 48ba88a46e8c957f0000           movabs     rdx, 0x7f958c6ea488
00863 4883820801000001               add        qword ptr [rdx + 0x108], 1
0086b 8b942464010000                 mov        edx, dword ptr [rsp + 0x164]
00872 83ea0f                         sub        edx, 0xf
00875 48b9589b6e8c957f0000           movabs     rcx, 0x7f958c6e9b58
0087f 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00883 4183c102                       add        r9d, 2
00887 44894970                       mov        dword ptr [rcx + 0x70], r9d
0088b 4181e1feff1f00                 and        r9d, 0x1ffffe
00892 4585c9                         test       r9d, r9d
00895 0f849d3a0000                   je         0x7f95943c36b8
0089b 48b9589b6e8c957f0000           movabs     rcx, 0x7f958c6e9b58
008a5 488381a800000001               add        qword ptr [rcx + 0xa8], 1
008ad 48b90000000000000000           movabs     rcx, 0
008b7 b900000000                     mov        ecx, 0
008bc 443be9                         cmp        r13d, ecx
008bf 0f8c943a0000                   jl         0x7f95943c36d9
008c5 443bea                         cmp        r13d, edx
008c8 0f8d983a0000                   jge        0x7f95943c36e6
008ce 498bd5                         mov        rdx, r13
008d1 89942494010000                 mov        dword ptr [rsp + 0x194], edx
008d8 48b9e89372e200000000           movabs     rcx, 0xe27293e8
008e2 4c8bc9                         mov        r9, rcx
008e5 49be68b86e8c957f0000           movabs     r14, 0x7f958c6eb868
008ef 458b09                         mov        r9d, dword ptr [r9]
008f2 41c1e90d                       shr        r9d, 0xd
008f6 49c1e10a                       shl        r9, 0xa
008fa 41ba00000054                   mov        r10d, 0x54000000
00900 4d03ca                         add        r9, r10
00903 41ba24000000                   mov        r10d, 0x24
00909 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
0090d 7436                           je         0x7f95943bfcc5
0090f 4983c202                       add        r10, 2
00913 4983fa28                       cmp        r10, 0x28
00917 75f0                           jne        0x7f95943bfc89
00919 41ba24000000                   mov        r10d, 0x24
0091f 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
00924 7412                           je         0x7f95943bfcb8
00926 4983c202                       add        r10, 2
0092a 4983fa28                       cmp        r10, 0x28
0092e 75ef                           jne        0x7f95943bfc9f
00930 41ba23000000                   mov        r10d, 0x23
00936 eb11                           jmp        0x7f95943bfcc9
00938 50                             push       rax
00939 4833c0                         xor        rax, rax
0093c f04f0fb10cd6                   lock cmpxchg qword ptr [r14 + r10*8], r9
00942 58                             pop        rax
00943 ebbe                           jmp        0x7f95943bfc83
00945 4983c201                       add        r10, 1
00949 4b8304d601                     add        qword ptr [r14 + r10*8], 1
0094e 48ba589c6e8c957f0000           movabs     rdx, 0x7f958c6e9c58
00958 448b4a70                       mov        r9d, dword ptr [rdx + 0x70]
0095c 4183c102                       add        r9d, 2
00960 44894a70                       mov        dword ptr [rdx + 0x70], r9d
00964 4181e1feff1f00                 and        r9d, 0x1ffffe
0096b 4585c9                         test       r9d, r9d
0096e 0f84ff390000                   je         0x7f95943c36f3
00974 48ba589c6e8c957f0000           movabs     rdx, 0x7f958c6e9c58
0097e 488382a800000001               add        qword ptr [rdx + 0xa8], 1
00986 48ba809d6e8c957f0000           movabs     rdx, 0x7f958c6e9d80
00990 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00993 83c102                         add        ecx, 2
00996 894a70                         mov        dword ptr [rdx + 0x70], ecx
00999 81e1feff1f00                   and        ecx, 0x1ffffe
0099f 85c9                           test       ecx, ecx
009a1 0f84ed390000                   je         0x7f95943c3714
009a7 48ba809d6e8c957f0000           movabs     rdx, 0x7f958c6e9d80
009b1 ff82b8000000                   inc        dword ptr [rdx + 0xb8]
009b7 8b942494010000                 mov        edx, dword ptr [rsp + 0x194]
009be 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
009c5 4489ac2490010000               mov        dword ptr [rsp + 0x190], r13d
009cd 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
009d5 488b9c2468010000               mov        rbx, qword ptr [rsp + 0x168]
009dd 48b9e01373e200000000           movabs     rcx, 0xe27313e0
009e7 4c8bc9                         mov        r9, rcx
009ea 48b868b86e8c957f0000           movabs     rax, 0x7f958c6eb868
009f4 49b90050165400000000           movabs     r9, 0x54165000
009fe 41ba2a000000                   mov        r10d, 0x2a
00a04 4e3b0cd0                       cmp        r9, qword ptr [rax + r10*8]
00a08 743c                           je         0x7f95943bfdc6
00a0a 4983c202                       add        r10, 2
00a0e 4983fa2e                       cmp        r10, 0x2e
00a12 75f0                           jne        0x7f95943bfd84
00a14 41ba2a000000                   mov        r10d, 0x2a
00a1a 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
00a1f 7412                           je         0x7f95943bfdb3
00a21 4983c202                       add        r10, 2
00a25 4983fa2e                       cmp        r10, 0x2e
00a29 75ef                           jne        0x7f95943bfd9a
00a2b 41ba29000000                   mov        r10d, 0x29
00a31 eb17                           jmp        0x7f95943bfdca
00a33 53                             push       rbx
00a34 488bd8                         mov        rbx, rax
00a37 4833c0                         xor        rax, rax
00a3a f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
00a40 488bc3                         mov        rax, rbx
00a43 5b                             pop        rbx
00a44 ebb8                           jmp        0x7f95943bfd7e
00a46 4983c201                       add        r10, 1
00a4a 4a8304d001                     add        qword ptr [rax + r10*8], 1
00a4f 49b930ba6e8c957f0000           movabs     r9, 0x7f958c6eba30
00a59 418b4170                       mov        eax, dword ptr [r9 + 0x70]
00a5d 83c002                         add        eax, 2
00a60 41894170                       mov        dword ptr [r9 + 0x70], eax
00a64 25feff1f00                     and        eax, 0x1ffffe
00a69 85c0                           test       eax, eax
00a6b 0f8444390000                   je         0x7f95943c3735
00a71 4c8bc9                         mov        r9, rcx
00a74 48b830ba6e8c957f0000           movabs     rax, 0x7f958c6eba30
00a7e 488380a800000001               add        qword ptr [rax + 0xa8], 1
00a86 49b910bb6e8c957f0000           movabs     r9, 0x7f958c6ebb10
00a90 418b4170                       mov        eax, dword ptr [r9 + 0x70]
00a94 83c002                         add        eax, 2
00a97 41894170                       mov        dword ptr [r9 + 0x70], eax
00a9b 25feff1f00                     and        eax, 0x1ffffe
00aa0 85c0                           test       eax, eax
00aa2 0f842e390000                   je         0x7f95943c3756
00aa8 49b910bb6e8c957f0000           movabs     r9, 0x7f958c6ebb10
00ab2 48b90050165400000000           movabs     rcx, 0x54165000
00abc 41ba16000000                   mov        r10d, 0x16
00ac2 4b3b0cd1                       cmp        rcx, qword ptr [r9 + r10*8]
00ac6 7436                           je         0x7f95943bfe7e
00ac8 4983c202                       add        r10, 2
00acc 4983fa1a                       cmp        r10, 0x1a
00ad0 75f0                           jne        0x7f95943bfe42
00ad2 41ba16000000                   mov        r10d, 0x16
00ad8 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
00add 7412                           je         0x7f95943bfe71
00adf 4983c202                       add        r10, 2
00ae3 4983fa1a                       cmp        r10, 0x1a
00ae7 75ef                           jne        0x7f95943bfe58
00ae9 41ba15000000                   mov        r10d, 0x15
00aef eb11                           jmp        0x7f95943bfe82
00af1 50                             push       rax
00af2 4833c0                         xor        rax, rax
00af5 f04b0fb10cd1                   lock cmpxchg qword ptr [r9 + r10*8], rcx
00afb 58                             pop        rax
00afc ebbe                           jmp        0x7f95943bfe3c
00afe 4983c201                       add        r10, 1
00b02 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00b07 48b900a66e8c957f0000           movabs     rcx, 0x7f958c6ea600
00b11 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00b15 4183c102                       add        r9d, 2
00b19 44894970                       mov        dword ptr [rcx + 0x70], r9d
00b1d 4181e1feff1f00                 and        r9d, 0x1ffffe
00b24 4585c9                         test       r9d, r9d
00b27 0f84ca380000                   je         0x7f95943c3777
00b2d 48b9e89372e200000000           movabs     rcx, 0xe27293e8
00b37 4c8bc9                         mov        r9, rcx
00b3a 48b810bb6e8c957f0000           movabs     rax, 0x7f958c6ebb10
00b44 458b09                         mov        r9d, dword ptr [r9]
00b47 41c1e90d                       shr        r9d, 0xd
00b4b 49c1e10a                       shl        r9, 0xa
00b4f 41ba00000054                   mov        r10d, 0x54000000
00b55 4d03ca                         add        r9, r10
00b58 41ba1c000000                   mov        r10d, 0x1c
00b5e 4e3b0cd0                       cmp        r9, qword ptr [rax + r10*8]
00b62 743c                           je         0x7f95943bff20
00b64 4983c202                       add        r10, 2
00b68 4983fa20                       cmp        r10, 0x20
00b6c 75f0                           jne        0x7f95943bfede
00b6e 41ba1c000000                   mov        r10d, 0x1c
00b74 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
00b79 7412                           je         0x7f95943bff0d
00b7b 4983c202                       add        r10, 2
00b7f 4983fa20                       cmp        r10, 0x20
00b83 75ef                           jne        0x7f95943bfef4
00b85 41ba1b000000                   mov        r10d, 0x1b
00b8b eb17                           jmp        0x7f95943bff24
00b8d 53                             push       rbx
00b8e 488bd8                         mov        rbx, rax
00b91 4833c0                         xor        rax, rax
00b94 f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
00b9a 488bc3                         mov        rax, rbx
00b9d 5b                             pop        rbx
00b9e ebb8                           jmp        0x7f95943bfed8
00ba0 4983c201                       add        r10, 1
00ba4 4a8304d001                     add        qword ptr [rax + r10*8], 1
00ba9 49b910bb6e8c957f0000           movabs     r9, 0x7f958c6ebb10
00bb3 8b09                           mov        ecx, dword ptr [rcx]
00bb5 c1e90d                         shr        ecx, 0xd
00bb8 48c1e10a                       shl        rcx, 0xa
00bbc 41ba00000054                   mov        r10d, 0x54000000
00bc2 4903ca                         add        rcx, r10
00bc5 41ba22000000                   mov        r10d, 0x22
00bcb 4b3b0cd1                       cmp        rcx, qword ptr [r9 + r10*8]
00bcf 7436                           je         0x7f95943bff87
00bd1 4983c202                       add        r10, 2
00bd5 4983fa26                       cmp        r10, 0x26
00bd9 75f0                           jne        0x7f95943bff4b
00bdb 41ba22000000                   mov        r10d, 0x22
00be1 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
00be6 7412                           je         0x7f95943bff7a
00be8 4983c202                       add        r10, 2
00bec 4983fa26                       cmp        r10, 0x26
00bf0 75ef                           jne        0x7f95943bff61
00bf2 41ba21000000                   mov        r10d, 0x21
00bf8 eb11                           jmp        0x7f95943bff8b
00bfa 50                             push       rax
00bfb 4833c0                         xor        rax, rax
00bfe f04b0fb10cd1                   lock cmpxchg qword ptr [r9 + r10*8], rcx
00c04 58                             pop        rax
00c05 ebbe                           jmp        0x7f95943bff45
00c07 4983c201                       add        r10, 1
00c0b 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00c10 48b910bb6e8c957f0000           movabs     rcx, 0x7f958c6ebb10
00c1a 4883813801000001               add        qword ptr [rcx + 0x138], 1
00c22 48b9c0a66e8c957f0000           movabs     rcx, 0x7f958c6ea6c0
00c2c 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00c30 4183c102                       add        r9d, 2
00c34 44894970                       mov        dword ptr [rcx + 0x70], r9d
00c38 4181e1feff1f00                 and        r9d, 0x1ffffe
00c3f 4585c9                         test       r9d, r9d
00c42 0f84d0370000                   je         0x7f95943c3798
00c48 48b910bb6e8c957f0000           movabs     rcx, 0x7f958c6ebb10
00c52 4883814801000001               add        qword ptr [rcx + 0x148], 1
00c5a 4863c2                         movsxd     rax, edx
00c5d ba08000000                     mov        edx, 8
00c62 4c8bc8                         mov        r9, rax
00c65 4c03ca                         add        r9, rdx
00c68 48ba108a6e8c957f0000           movabs     rdx, 0x7f958c6e8a10
00c72 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00c75 83c102                         add        ecx, 2
00c78 894a70                         mov        dword ptr [rdx + 0x70], ecx
00c7b 81e1feff1f00                   and        ecx, 0x1ffffe
00c81 85c9                           test       ecx, ecx
00c83 0f84b0370000                   je         0x7f95943c37b9
00c89 48ba108a6e8c957f0000           movabs     rdx, 0x7f958c6e8a10
00c93 488382d800000001               add        qword ptr [rdx + 0xd8], 1
00c9b 48ba888b6e8c957f0000           movabs     rdx, 0x7f958c6e8b88
00ca5 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00ca8 83c102                         add        ecx, 2
00cab 894a70                         mov        dword ptr [rdx + 0x70], ecx
00cae 81e1feff1f00                   and        ecx, 0x1ffffe
00cb4 85c9                           test       ecx, ecx
00cb6 0f849e370000                   je         0x7f95943c37da
00cbc 48ba10bb6e8c957f0000           movabs     rdx, 0x7f958c6ebb10
00cc6 488d9258010000                 lea        rdx, [rdx + 0x158]
00ccd 48b9b06c73e200000000           movabs     rcx, 0xe2736cb0
00cd7 48b900a8165400000000           movabs     rcx, 0x5416a800
00ce1 4c8bd1                         mov        r10, rcx
00ce4 48330a                         xor        rcx, qword ptr [rdx]
00ce7 48f7c1fcffffff                 test       rcx, -4
00cee 7426                           je         0x7f95943c0096
00cf0 f6c102                         test       cl, 2
00cf3 7521                           jne        0x7f95943c0096
00cf5 48f702feffffff                 test       qword ptr [rdx], -2
00cfc 7415                           je         0x7f95943c0093
00cfe 498bca                         mov        rcx, r10
00d01 48330a                         xor        rcx, qword ptr [rdx]
00d04 48f7c1fcffffff                 test       rcx, -4
00d0b 7409                           je         0x7f95943c0096
00d0d 48830a02                       or         qword ptr [rdx], 2
00d11 eb03                           jmp        0x7f95943c0096
00d13 48890a                         mov        qword ptr [rdx], rcx
00d16 48ba10bb6e8c957f0000           movabs     rdx, 0x7f958c6ebb10
00d20 4883826801000001               add        qword ptr [rdx + 0x168], 1
00d28 48be309472e200000000           movabs     rsi, 0xe2729430
00d32 ba02000000                     mov        edx, 2
00d37 b910000000                     mov        ecx, 0x10
00d3c 4c8bc3                         mov        r8, rbx
00d3f bf00000000                     mov        edi, 0
00d44 48891c24                       mov        qword ptr [rsp], rbx
00d48 4889442408                     mov        qword ptr [rsp + 8], rax
00d4d 49bae89372e200000000           movabs     r10, 0xe27293e8
00d57 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00d5c 49bab06c73e200000000           movabs     r10, 0xe2736cb0
00d66 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d6b 0f1f4000                       nop        dword ptr [rax]
00d6f e86cb75307                     call       0x7f959b8fb860
00d74 0f1f84006c0e0002               nop        dword ptr [rax + rax + 0x2000e6c]
00d7c 4885c0                         test       rax, rax
00d7f 48bb10bb6e8c957f0000           movabs     rbx, 0x7f958c6ebb10
00d89 750c                           jne        0x7f95943c0117
00d8b 808b7101000001                 or         byte ptr [rbx + 0x171], 1
00d92 e988000000                     jmp        0x7f95943c019f
00d97 8b38                           mov        edi, dword ptr [rax]
00d99 c1ef0d                         shr        edi, 0xd
00d9c 48c1e70a                       shl        rdi, 0xa
00da0 41ba00000054                   mov        r10d, 0x54000000
00da6 4903fa                         add        rdi, r10
00da9 41ba30000000                   mov        r10d, 0x30
00daf 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
00db3 7436                           je         0x7f95943c016b
00db5 4983c202                       add        r10, 2
00db9 4983fa34                       cmp        r10, 0x34
00dbd 75f0                           jne        0x7f95943c012f
00dbf 41ba30000000                   mov        r10d, 0x30
00dc5 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00dca 7412                           je         0x7f95943c015e
00dcc 4983c202                       add        r10, 2
00dd0 4983fa34                       cmp        r10, 0x34
00dd4 75ef                           jne        0x7f95943c0145
00dd6 41ba2f000000                   mov        r10d, 0x2f
00ddc eb11                           jmp        0x7f95943c016f
00dde 50                             push       rax
00ddf 4833c0                         xor        rax, rax
00de2 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
00de8 58                             pop        rax
00de9 ebbe                           jmp        0x7f95943c0129
00deb 4983c201                       add        r10, 1
00def 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00df4 48bf00b0145400000000           movabs     rdi, 0x5414b000
00dfe 8b18                           mov        ebx, dword ptr [rax]
00e00 c1eb0d                         shr        ebx, 0xd
00e03 48c1e30a                       shl        rbx, 0xa
00e07 41ba00000054                   mov        r10d, 0x54000000
00e0d 4903da                         add        rbx, r10
00e10 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
00e14 0f8561360000                   jne        0x7f95943c37fb
00e1a e900000000                     jmp        0x7f95943c019f
00e1f 488bf8                         mov        rdi, rax
00e22 4889bc24b0010000               mov        qword ptr [rsp + 0x1b0], rdi
00e2a 483b07                         cmp        rax, qword ptr [rdi]
00e2d 488bf7                         mov        rsi, rdi
00e30 48bbd8ab708c957f0000           movabs     rbx, 0x7f958c70abd8
00e3a 8b36                           mov        esi, dword ptr [rsi]
00e3c c1ee0d                         shr        esi, 0xd
00e3f 48c1e60a                       shl        rsi, 0xa
00e43 41ba00000054                   mov        r10d, 0x54000000
00e49 4903f2                         add        rsi, r10
00e4c 41ba94000000                   mov        r10d, 0x94
00e52 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00e56 743c                           je         0x7f95943c0214
00e58 4983c202                       add        r10, 2
00e5c 4981fa98000000                 cmp        r10, 0x98
00e63 75ed                           jne        0x7f95943c01d2
00e65 41ba94000000                   mov        r10d, 0x94
00e6b 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00e70 7415                           je         0x7f95943c0207
00e72 4983c202                       add        r10, 2
00e76 4981fa98000000                 cmp        r10, 0x98
00e7d 75ec                           jne        0x7f95943c01eb
00e7f 41ba93000000                   mov        r10d, 0x93
00e85 eb11                           jmp        0x7f95943c0218
00e87 50                             push       rax
00e88 4833c0                         xor        rax, rax
00e8b f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00e91 58                             pop        rax
00e92 ebb8                           jmp        0x7f95943c01cc
00e94 4983c201                       add        r10, 1
00e98 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00e9d 48bed8be6e8c957f0000           movabs     rsi, 0x7f958c6ebed8
00ea7 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
00eaa 83c302                         add        ebx, 2
00ead 895e70                         mov        dword ptr [rsi + 0x70], ebx
00eb0 81e3feff1f00                   and        ebx, 0x1ffffe
00eb6 85db                           test       ebx, ebx
00eb8 0f84cb350000                   je         0x7f95943c3809
00ebe 488bf7                         mov        rsi, rdi
00ec1 48bbd8be6e8c957f0000           movabs     rbx, 0x7f958c6ebed8
00ecb 8b36                           mov        esi, dword ptr [rsi]
00ecd c1ee0d                         shr        esi, 0xd
00ed0 48c1e60a                       shl        rsi, 0xa
00ed4 41ba00000054                   mov        r10d, 0x54000000
00eda 4903f2                         add        rsi, r10
00edd 41ba16000000                   mov        r10d, 0x16
00ee3 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00ee7 7436                           je         0x7f95943c029f
00ee9 4983c202                       add        r10, 2
00eed 4983fa1a                       cmp        r10, 0x1a
00ef1 75f0                           jne        0x7f95943c0263
00ef3 41ba16000000                   mov        r10d, 0x16
00ef9 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00efe 7412                           je         0x7f95943c0292
00f00 4983c202                       add        r10, 2
00f04 4983fa1a                       cmp        r10, 0x1a
00f08 75ef                           jne        0x7f95943c0279
00f0a 41ba15000000                   mov        r10d, 0x15
00f10 eb11                           jmp        0x7f95943c02a3
00f12 50                             push       rax
00f13 4833c0                         xor        rax, rax
00f16 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00f1c 58                             pop        rax
00f1d ebbe                           jmp        0x7f95943c025d
00f1f 4983c201                       add        r10, 1
00f23 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00f28 488bf7                         mov        rsi, rdi
00f2b 6690                           nop        
00f2d 48b810ca1e70957f0000           movabs     rax, 0x7f95701eca10
00f37 e8a4b05307                     call       0x7f959b8fb360
00f3c 0f1f840034100003               nop        dword ptr [rax + rax + 0x3001034]
00f44 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
00f4c 8b7704                         mov        esi, dword ptr [rdi + 4]
00f4f 48bbd8be6e8c957f0000           movabs     rbx, 0x7f958c6ebed8
00f59 488383d800000001               add        qword ptr [rbx + 0xd8], 1
00f61 48bb88a46e8c957f0000           movabs     rbx, 0x7f958c6ea488
00f6b 8b5370                         mov        edx, dword ptr [rbx + 0x70]
00f6e 83c202                         add        edx, 2
00f71 895370                         mov        dword ptr [rbx + 0x70], edx
00f74 81e2feff1f00                   and        edx, 0x1ffffe
00f7a 85d2                           test       edx, edx
00f7c 0f842d350000                   je         0x7f95943c382f
00f82 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
00f8a 48bb88a46e8c957f0000           movabs     rbx, 0x7f958c6ea488
00f94 4883830801000001               add        qword ptr [rbx + 0x108], 1
00f9c ffc8                           dec        eax
00f9e 2bf0                           sub        esi, eax
00fa0 48bb589b6e8c957f0000           movabs     rbx, 0x7f958c6e9b58
00faa 8b4370                         mov        eax, dword ptr [rbx + 0x70]
00fad 83c002                         add        eax, 2
00fb0 894370                         mov        dword ptr [rbx + 0x70], eax
00fb3 25feff1f00                     and        eax, 0x1ffffe
00fb8 85c0                           test       eax, eax
00fba 0f8410350000                   je         0x7f95943c3850
00fc0 48bb589b6e8c957f0000           movabs     rbx, 0x7f958c6e9b58
00fca 488383a800000001               add        qword ptr [rbx + 0xa8], 1
00fd2 48bb0000000000000000           movabs     rbx, 0
00fdc bb00000000                     mov        ebx, 0
00fe1 443bdb                         cmp        r11d, ebx
00fe4 0f8c07350000                   jl         0x7f95943c3871
00fea 443bde                         cmp        r11d, esi
00fed 0f8d0b350000                   jge        0x7f95943c387e
00ff3 498bdb                         mov        rbx, r11
00ff6 899c24ac010000                 mov        dword ptr [rsp + 0x1ac], ebx
00ffd 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
01005 488bbc24b0010000               mov        rdi, qword ptr [rsp + 0x1b0]
0100d 488bf7                         mov        rsi, rdi
01010 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
0101a 8b36                           mov        esi, dword ptr [rsi]
0101c c1ee0d                         shr        esi, 0xd
0101f 48c1e60a                       shl        rsi, 0xa
01023 41ba00000054                   mov        r10d, 0x54000000
01029 4903f2                         add        rsi, r10
0102c 41ba1e000000                   mov        r10d, 0x1e
01032 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01036 7436                           je         0x7f95943c03ee
01038 4983c202                       add        r10, 2
0103c 4983fa22                       cmp        r10, 0x22
01040 75f0                           jne        0x7f95943c03b2
01042 41ba1e000000                   mov        r10d, 0x1e
01048 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
0104d 7412                           je         0x7f95943c03e1
0104f 4983c202                       add        r10, 2
01053 4983fa22                       cmp        r10, 0x22
01057 75ef                           jne        0x7f95943c03c8
01059 41ba1d000000                   mov        r10d, 0x1d
0105f eb11                           jmp        0x7f95943c03f2
01061 50                             push       rax
01062 4833c0                         xor        rax, rax
01065 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
0106b 58                             pop        rax
0106c ebbe                           jmp        0x7f95943c03ac
0106e 4983c201                       add        r10, 1
01072 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01077 488bf7                         mov        rsi, rdi
0107a 666690                         nop        
0107d 48b838ca1e70957f0000           movabs     rax, 0x7f95701eca38
01087 e854af5307                     call       0x7f959b8fb360
0108c 0f1f840084110004               nop        dword ptr [rax + rax + 0x4001184]
01094 483b00                         cmp        rax, qword ptr [rax]
01097 488bf0                         mov        rsi, rax
0109a 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
010a4 8b36                           mov        esi, dword ptr [rsi]
010a6 c1ee0d                         shr        esi, 0xd
010a9 48c1e60a                       shl        rsi, 0xa
010ad 41ba00000054                   mov        r10d, 0x54000000
010b3 4903f2                         add        rsi, r10
010b6 41ba24000000                   mov        r10d, 0x24
010bc 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
010c0 7436                           je         0x7f95943c0478
010c2 4983c202                       add        r10, 2
010c6 4983fa28                       cmp        r10, 0x28
010ca 75f0                           jne        0x7f95943c043c
010cc 41ba24000000                   mov        r10d, 0x24
010d2 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
010d7 7412                           je         0x7f95943c046b
010d9 4983c202                       add        r10, 2
010dd 4983fa28                       cmp        r10, 0x28
010e1 75ef                           jne        0x7f95943c0452
010e3 41ba23000000                   mov        r10d, 0x23
010e9 eb11                           jmp        0x7f95943c047c
010eb 50                             push       rax
010ec 4833c0                         xor        rax, rax
010ef f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
010f5 58                             pop        rax
010f6 ebbe                           jmp        0x7f95943c0436
010f8 4983c201                       add        r10, 1
010fc 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01101 8b7024                         mov        esi, dword ptr [rax + 0x24]
01104 488bd0                         mov        rdx, rax
01107 48b9d8be6e8c957f0000           movabs     rcx, 0x7f958c6ebed8
01111 8b12                           mov        edx, dword ptr [rdx]
01113 c1ea0d                         shr        edx, 0xd
01116 48c1e20a                       shl        rdx, 0xa
0111a 41ba00000054                   mov        r10d, 0x54000000
01120 4903d2                         add        rdx, r10
01123 41ba2a000000                   mov        r10d, 0x2a
01129 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0112d 7436                           je         0x7f95943c04e5
0112f 4983c202                       add        r10, 2
01133 4983fa2e                       cmp        r10, 0x2e
01137 75f0                           jne        0x7f95943c04a9
01139 41ba2a000000                   mov        r10d, 0x2a
0113f 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01144 7412                           je         0x7f95943c04d8
01146 4983c202                       add        r10, 2
0114a 4983fa2e                       cmp        r10, 0x2e
0114e 75ef                           jne        0x7f95943c04bf
01150 41ba29000000                   mov        r10d, 0x29
01156 eb11                           jmp        0x7f95943c04e9
01158 50                             push       rax
01159 4833c0                         xor        rax, rax
0115c f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
01162 58                             pop        rax
01163 ebbe                           jmp        0x7f95943c04a3
01165 4983c201                       add        r10, 1
01169 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0116e 8b4804                         mov        ecx, dword ptr [rax + 4]
01171 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
0117b 4883827801000001               add        qword ptr [rdx + 0x178], 1
01183 48bac0a66e8c957f0000           movabs     rdx, 0x7f958c6ea6c0
0118d 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01191 4183c002                       add        r8d, 2
01195 44894270                       mov        dword ptr [rdx + 0x70], r8d
01199 4181e0feff1f00                 and        r8d, 0x1ffffe
011a0 4585c0                         test       r8d, r8d
011a3 0f8467330000                   je         0x7f95943c3890
011a9 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
011b3 4883828801000001               add        qword ptr [rdx + 0x188], 1
011bb 8b9c24ac010000                 mov        ebx, dword ptr [rsp + 0x1ac]
011c2 4863db                         movsxd     rbx, ebx
011c5 ba08000000                     mov        edx, 8
011ca 4c8bcb                         mov        r9, rbx
011cd 4c03ca                         add        r9, rdx
011d0 48ba108a6e8c957f0000           movabs     rdx, 0x7f958c6e8a10
011da 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
011de 4183c002                       add        r8d, 2
011e2 44894270                       mov        dword ptr [rdx + 0x70], r8d
011e6 4181e0feff1f00                 and        r8d, 0x1ffffe
011ed 4585c0                         test       r8d, r8d
011f0 0f843b330000                   je         0x7f95943c38b1
011f6 48ba108a6e8c957f0000           movabs     rdx, 0x7f958c6e8a10
01200 488382d800000001               add        qword ptr [rdx + 0xd8], 1
01208 48ba888b6e8c957f0000           movabs     rdx, 0x7f958c6e8b88
01212 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01216 4183c002                       add        r8d, 2
0121a 44894270                       mov        dword ptr [rdx + 0x70], r8d
0121e 4181e0feff1f00                 and        r8d, 0x1ffffe
01225 4585c0                         test       r8d, r8d
01228 0f8424330000                   je         0x7f95943c38d2
0122e 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
01238 488d9298010000                 lea        rdx, [rdx + 0x198]
0123f 49b8980a74e200000000           movabs     r8, 0xe2740a98
01249 49b800b8165400000000           movabs     r8, 0x5416b800
01253 4d8bd0                         mov        r10, r8
01256 4c3302                         xor        r8, qword ptr [rdx]
01259 49f7c0fcffffff                 test       r8, -4
01260 7427                           je         0x7f95943c0609
01262 41f6c002                       test       r8b, 2
01266 7521                           jne        0x7f95943c0609
01268 48f702feffffff                 test       qword ptr [rdx], -2
0126f 7415                           je         0x7f95943c0606
01271 4d8bc2                         mov        r8, r10
01274 4c3302                         xor        r8, qword ptr [rdx]
01277 49f7c0fcffffff                 test       r8, -4
0127e 7409                           je         0x7f95943c0609
01280 48830a02                       or         qword ptr [rdx], 2
01284 eb03                           jmp        0x7f95943c0609
01286 4c8902                         mov        qword ptr [rdx], r8
01289 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
01293 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
0129b ba02000000                     mov        edx, 2
012a0 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
012a8 bf00000000                     mov        edi, 0
012ad 488b8424b0010000               mov        rax, qword ptr [rsp + 0x1b0]
012b5 48890424                       mov        qword ptr [rsp], rax
012b9 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
012c1 4889442408                     mov        qword ptr [rsp + 8], rax
012c6 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
012cb 49ba980a74e200000000           movabs     r10, 0xe2740a98
012d5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
012da 0f1f440000                     nop        dword ptr [rax + rax]
012df e8fcb15307                     call       0x7f959b8fb860
012e4 0f1f8400dc130005               nop        dword ptr [rax + rax + 0x50013dc]
012ec 48bed8ab708c957f0000           movabs     rsi, 0x7f958c70abd8
012f6 ff86c8040000                   inc        dword ptr [rsi + 0x4c8]
012fc e9150d0000                     jmp        0x7f95943c1396
01301 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
01308 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
01310 83ff30                         cmp        edi, 0x30
01313 48bed8ab708c957f0000           movabs     rsi, 0x7f958c70abd8
0131d bae0040000                     mov        edx, 0x4e0
01322 7f05                           jg         0x7f95943c06a9
01324 baf0040000                     mov        edx, 0x4f0
01329 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0132d 488d4901                       lea        rcx, [rcx + 1]
01331 48890c16                       mov        qword ptr [rsi + rdx], rcx
01335 0f8f360c0000                   jg         0x7f95943c12f1
0133b 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
01342 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
0134a 660f1f440000                   nop        word ptr [rax + rax]
01350 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
01358 8b842464010000                 mov        eax, dword ptr [rsp + 0x164]
0135f 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
01367 48b9d8ab708c957f0000           movabs     rcx, 0x7f958c70abd8
01371 4883810005000001               add        qword ptr [rcx + 0x500], 1
01379 48b968b86e8c957f0000           movabs     rcx, 0x7f958c6eb868
01383 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
01387 4183c002                       add        r8d, 2
0138b 44894170                       mov        dword ptr [rcx + 0x70], r8d
0138f 4181e0feff1f00                 and        r8d, 0x1ffffe
01396 4585c0                         test       r8d, r8d
01399 0f84d4310000                   je         0x7f95943c38f3
0139f 48b9e89372e200000000           movabs     rcx, 0xe27293e8
013a9 49b868b86e8c957f0000           movabs     r8, 0x7f958c6eb868
013b3 8b09                           mov        ecx, dword ptr [rcx]
013b5 c1e90d                         shr        ecx, 0xd
013b8 48c1e10a                       shl        rcx, 0xa
013bc 41ba00000054                   mov        r10d, 0x54000000
013c2 4903ca                         add        rcx, r10
013c5 41ba16000000                   mov        r10d, 0x16
013cb 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
013cf 7436                           je         0x7f95943c0787
013d1 4983c202                       add        r10, 2
013d5 4983fa1a                       cmp        r10, 0x1a
013d9 75f0                           jne        0x7f95943c074b
013db 41ba16000000                   mov        r10d, 0x16
013e1 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
013e6 7412                           je         0x7f95943c077a
013e8 4983c202                       add        r10, 2
013ec 4983fa1a                       cmp        r10, 0x1a
013f0 75ef                           jne        0x7f95943c0761
013f2 41ba15000000                   mov        r10d, 0x15
013f8 eb11                           jmp        0x7f95943c078b
013fa 50                             push       rax
013fb 4833c0                         xor        rax, rax
013fe f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
01404 58                             pop        rax
01405 ebbe                           jmp        0x7f95943c0745
01407 4983c201                       add        r10, 1
0140b 4b8304d001                     add        qword ptr [r8 + r10*8], 1
01410 48b968b86e8c957f0000           movabs     rcx, 0x7f958c6eb868
0141a 488381d800000001               add        qword ptr [rcx + 0xd8], 1
01422 48b988a46e8c957f0000           movabs     rcx, 0x7f958c6ea488
0142c 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
01430 4183c002                       add        r8d, 2
01434 44894170                       mov        dword ptr [rcx + 0x70], r8d
01438 4181e0feff1f00                 and        r8d, 0x1ffffe
0143f 4585c0                         test       r8d, r8d
01442 0f844c310000                   je         0x7f95943c3914
01448 48b988a46e8c957f0000           movabs     rcx, 0x7f958c6ea488
01452 4883810801000001               add        qword ptr [rcx + 0x108], 1
0145a 488bc8                         mov        rcx, rax
0145d 83e90f                         sub        ecx, 0xf
01460 49b8589b6e8c957f0000           movabs     r8, 0x7f958c6e9b58
0146a 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
0146e 4183c102                       add        r9d, 2
01472 45894870                       mov        dword ptr [r8 + 0x70], r9d
01476 4181e1feff1f00                 and        r9d, 0x1ffffe
0147d 4585c9                         test       r9d, r9d
01480 0f842f310000                   je         0x7f95943c3935
01486 49b8589b6e8c957f0000           movabs     r8, 0x7f958c6e9b58
01490 498380a800000001               add        qword ptr [r8 + 0xa8], 1
01498 49b80000000000000000           movabs     r8, 0
014a2 41b800000000                   mov        r8d, 0
014a8 413bf0                         cmp        esi, r8d
014ab 0f8c25310000                   jl         0x7f95943c3956
014b1 3bf1                           cmp        esi, ecx
014b3 0f8d2a310000                   jge        0x7f95943c3963
014b9 488bce                         mov        rcx, rsi
014bc 898c24b8010000                 mov        dword ptr [rsp + 0x1b8], ecx
014c3 49b8e89372e200000000           movabs     r8, 0xe27293e8
014cd 4d8bc8                         mov        r9, r8
014d0 49be68b86e8c957f0000           movabs     r14, 0x7f958c6eb868
014da 458b09                         mov        r9d, dword ptr [r9]
014dd 41c1e90d                       shr        r9d, 0xd
014e1 49c1e10a                       shl        r9, 0xa
014e5 41ba00000054                   mov        r10d, 0x54000000
014eb 4d03ca                         add        r9, r10
014ee 41ba24000000                   mov        r10d, 0x24
014f4 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
014f8 7436                           je         0x7f95943c08b0
014fa 4983c202                       add        r10, 2
014fe 4983fa28                       cmp        r10, 0x28
01502 75f0                           jne        0x7f95943c0874
01504 41ba24000000                   mov        r10d, 0x24
0150a 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
0150f 7412                           je         0x7f95943c08a3
01511 4983c202                       add        r10, 2
01515 4983fa28                       cmp        r10, 0x28
01519 75ef                           jne        0x7f95943c088a
0151b 41ba23000000                   mov        r10d, 0x23
01521 eb11                           jmp        0x7f95943c08b4
01523 50                             push       rax
01524 4833c0                         xor        rax, rax
01527 f04f0fb10cd6                   lock cmpxchg qword ptr [r14 + r10*8], r9
0152d 58                             pop        rax
0152e ebbe                           jmp        0x7f95943c086e
01530 4983c201                       add        r10, 1
01534 4b8304d601                     add        qword ptr [r14 + r10*8], 1
01539 48b9589c6e8c957f0000           movabs     rcx, 0x7f958c6e9c58
01543 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
01547 4183c102                       add        r9d, 2
0154b 44894970                       mov        dword ptr [rcx + 0x70], r9d
0154f 4181e1feff1f00                 and        r9d, 0x1ffffe
01556 4585c9                         test       r9d, r9d
01559 0f8491300000                   je         0x7f95943c3970
0155f 48b9589c6e8c957f0000           movabs     rcx, 0x7f958c6e9c58
01569 488381a800000001               add        qword ptr [rcx + 0xa8], 1
01571 48b9809d6e8c957f0000           movabs     rcx, 0x7f958c6e9d80
0157b 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
0157f 4183c002                       add        r8d, 2
01583 44894170                       mov        dword ptr [rcx + 0x70], r8d
01587 4181e0feff1f00                 and        r8d, 0x1ffffe
0158e 4585c0                         test       r8d, r8d
01591 0f847a300000                   je         0x7f95943c3991
01597 48b9809d6e8c957f0000           movabs     rcx, 0x7f958c6e9d80
015a1 ff81b8000000                   inc        dword ptr [rcx + 0xb8]
015a7 8b8c24b8010000                 mov        ecx, dword ptr [rsp + 0x1b8]
015ae 89b424c0010000                 mov        dword ptr [rsp + 0x1c0], esi
015b5 49b8e01373e200000000           movabs     r8, 0xe27313e0
015bf 4d8bc8                         mov        r9, r8
015c2 49be68b86e8c957f0000           movabs     r14, 0x7f958c6eb868
015cc 49b90050165400000000           movabs     r9, 0x54165000
015d6 41ba2a000000                   mov        r10d, 0x2a
015dc 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
015e0 7436                           je         0x7f95943c0998
015e2 4983c202                       add        r10, 2
015e6 4983fa2e                       cmp        r10, 0x2e
015ea 75f0                           jne        0x7f95943c095c
015ec 41ba2a000000                   mov        r10d, 0x2a
015f2 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
015f7 7412                           je         0x7f95943c098b
015f9 4983c202                       add        r10, 2
015fd 4983fa2e                       cmp        r10, 0x2e
01601 75ef                           jne        0x7f95943c0972
01603 41ba29000000                   mov        r10d, 0x29
01609 eb11                           jmp        0x7f95943c099c
0160b 50                             push       rax
0160c 4833c0                         xor        rax, rax
0160f f04f0fb10cd6                   lock cmpxchg qword ptr [r14 + r10*8], r9
01615 58                             pop        rax
01616 ebbe                           jmp        0x7f95943c0956
01618 4983c201                       add        r10, 1
0161c 4b8304d601                     add        qword ptr [r14 + r10*8], 1
01621 49b930ba6e8c957f0000           movabs     r9, 0x7f958c6eba30
0162b 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
0162f 83c302                         add        ebx, 2
01632 41895970                       mov        dword ptr [r9 + 0x70], ebx
01636 81e3feff1f00                   and        ebx, 0x1ffffe
0163c 85db                           test       ebx, ebx
0163e 0f84ee2f0000                   je         0x7f95943c39b2
01644 4d8bc8                         mov        r9, r8
01647 48bb30ba6e8c957f0000           movabs     rbx, 0x7f958c6eba30
01651 488383a800000001               add        qword ptr [rbx + 0xa8], 1
01659 49b910bb6e8c957f0000           movabs     r9, 0x7f958c6ebb10
01663 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
01667 83c302                         add        ebx, 2
0166a 41895970                       mov        dword ptr [r9 + 0x70], ebx
0166e 81e3feff1f00                   and        ebx, 0x1ffffe
01674 85db                           test       ebx, ebx
01676 0f84d72f0000                   je         0x7f95943c39d3
0167c 49b910bb6e8c957f0000           movabs     r9, 0x7f958c6ebb10
01686 49b80050165400000000           movabs     r8, 0x54165000
01690 41ba16000000                   mov        r10d, 0x16
01696 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
0169a 7436                           je         0x7f95943c0a52
0169c 4983c202                       add        r10, 2
016a0 4983fa1a                       cmp        r10, 0x1a
016a4 75f0                           jne        0x7f95943c0a16
016a6 41ba16000000                   mov        r10d, 0x16
016ac 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
016b1 7412                           je         0x7f95943c0a45
016b3 4983c202                       add        r10, 2
016b7 4983fa1a                       cmp        r10, 0x1a
016bb 75ef                           jne        0x7f95943c0a2c
016bd 41ba15000000                   mov        r10d, 0x15
016c3 eb11                           jmp        0x7f95943c0a56
016c5 50                             push       rax
016c6 4833c0                         xor        rax, rax
016c9 f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
016cf 58                             pop        rax
016d0 ebbe                           jmp        0x7f95943c0a10
016d2 4983c201                       add        r10, 1
016d6 4b8304d101                     add        qword ptr [r9 + r10*8], 1
016db 49b800a66e8c957f0000           movabs     r8, 0x7f958c6ea600
016e5 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
016e9 4183c102                       add        r9d, 2
016ed 45894870                       mov        dword ptr [r8 + 0x70], r9d
016f1 4181e1feff1f00                 and        r9d, 0x1ffffe
016f8 4585c9                         test       r9d, r9d
016fb 0f84732f0000                   je         0x7f95943c39f4
01701 49b8e89372e200000000           movabs     r8, 0xe27293e8
0170b 4d8bc8                         mov        r9, r8
0170e 48bb10bb6e8c957f0000           movabs     rbx, 0x7f958c6ebb10
01718 458b09                         mov        r9d, dword ptr [r9]
0171b 41c1e90d                       shr        r9d, 0xd
0171f 49c1e10a                       shl        r9, 0xa
01723 41ba00000054                   mov        r10d, 0x54000000
01729 4d03ca                         add        r9, r10
0172c 41ba1c000000                   mov        r10d, 0x1c
01732 4e3b0cd3                       cmp        r9, qword ptr [rbx + r10*8]
01736 7436                           je         0x7f95943c0aee
01738 4983c202                       add        r10, 2
0173c 4983fa20                       cmp        r10, 0x20
01740 75f0                           jne        0x7f95943c0ab2
01742 41ba1c000000                   mov        r10d, 0x1c
01748 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0174d 7412                           je         0x7f95943c0ae1
0174f 4983c202                       add        r10, 2
01753 4983fa20                       cmp        r10, 0x20
01757 75ef                           jne        0x7f95943c0ac8
01759 41ba1b000000                   mov        r10d, 0x1b
0175f eb11                           jmp        0x7f95943c0af2
01761 50                             push       rax
01762 4833c0                         xor        rax, rax
01765 f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
0176b 58                             pop        rax
0176c ebbe                           jmp        0x7f95943c0aac
0176e 4983c201                       add        r10, 1
01772 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01777 49b910bb6e8c957f0000           movabs     r9, 0x7f958c6ebb10
01781 458b00                         mov        r8d, dword ptr [r8]
01784 41c1e80d                       shr        r8d, 0xd
01788 49c1e00a                       shl        r8, 0xa
0178c 41ba00000054                   mov        r10d, 0x54000000
01792 4d03c2                         add        r8, r10
01795 41ba22000000                   mov        r10d, 0x22
0179b 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
0179f 7436                           je         0x7f95943c0b57
017a1 4983c202                       add        r10, 2
017a5 4983fa26                       cmp        r10, 0x26
017a9 75f0                           jne        0x7f95943c0b1b
017ab 41ba22000000                   mov        r10d, 0x22
017b1 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
017b6 7412                           je         0x7f95943c0b4a
017b8 4983c202                       add        r10, 2
017bc 4983fa26                       cmp        r10, 0x26
017c0 75ef                           jne        0x7f95943c0b31
017c2 41ba21000000                   mov        r10d, 0x21
017c8 eb11                           jmp        0x7f95943c0b5b
017ca 50                             push       rax
017cb 4833c0                         xor        rax, rax
017ce f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
017d4 58                             pop        rax
017d5 ebbe                           jmp        0x7f95943c0b15
017d7 4983c201                       add        r10, 1
017db 4b8304d101                     add        qword ptr [r9 + r10*8], 1
017e0 49b810bb6e8c957f0000           movabs     r8, 0x7f958c6ebb10
017ea 4983803801000001               add        qword ptr [r8 + 0x138], 1
017f2 49b8c0a66e8c957f0000           movabs     r8, 0x7f958c6ea6c0
017fc 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
01800 4183c102                       add        r9d, 2
01804 45894870                       mov        dword ptr [r8 + 0x70], r9d
01808 4181e1feff1f00                 and        r9d, 0x1ffffe
0180f 4585c9                         test       r9d, r9d
01812 0f847d2e0000                   je         0x7f95943c3a15
01818 49b810bb6e8c957f0000           movabs     r8, 0x7f958c6ebb10
01822 4983804801000001               add        qword ptr [r8 + 0x148], 1
0182a 4863d9                         movsxd     rbx, ecx
0182d b908000000                     mov        ecx, 8
01832 4c8bcb                         mov        r9, rbx
01835 4c03c9                         add        r9, rcx
01838 48b9108a6e8c957f0000           movabs     rcx, 0x7f958c6e8a10
01842 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
01846 4183c002                       add        r8d, 2
0184a 44894170                       mov        dword ptr [rcx + 0x70], r8d
0184e 4181e0feff1f00                 and        r8d, 0x1ffffe
01855 4585c0                         test       r8d, r8d
01858 0f84582e0000                   je         0x7f95943c3a36
0185e 48b9108a6e8c957f0000           movabs     rcx, 0x7f958c6e8a10
01868 488381d800000001               add        qword ptr [rcx + 0xd8], 1
01870 48b9888b6e8c957f0000           movabs     rcx, 0x7f958c6e8b88
0187a 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
0187e 4183c002                       add        r8d, 2
01882 44894170                       mov        dword ptr [rcx + 0x70], r8d
01886 4181e0feff1f00                 and        r8d, 0x1ffffe
0188d 4585c0                         test       r8d, r8d
01890 0f84412e0000                   je         0x7f95943c3a57
01896 48b910bb6e8c957f0000           movabs     rcx, 0x7f958c6ebb10
018a0 488d8958010000                 lea        rcx, [rcx + 0x158]
018a7 49b8b06c73e200000000           movabs     r8, 0xe2736cb0
018b1 49b800a8165400000000           movabs     r8, 0x5416a800
018bb 4d8bd0                         mov        r10, r8
018be 4c3301                         xor        r8, qword ptr [rcx]
018c1 49f7c0fcffffff                 test       r8, -4
018c8 7427                           je         0x7f95943c0c71
018ca 41f6c002                       test       r8b, 2
018ce 7521                           jne        0x7f95943c0c71
018d0 48f701feffffff                 test       qword ptr [rcx], -2
018d7 7415                           je         0x7f95943c0c6e
018d9 4d8bc2                         mov        r8, r10
018dc 4c3301                         xor        r8, qword ptr [rcx]
018df 49f7c0fcffffff                 test       r8, -4
018e6 7409                           je         0x7f95943c0c71
018e8 48830902                       or         qword ptr [rcx], 2
018ec eb03                           jmp        0x7f95943c0c71
018ee 4c8901                         mov        qword ptr [rcx], r8
018f1 48b910bb6e8c957f0000           movabs     rcx, 0x7f958c6ebb10
018fb 4883816801000001               add        qword ptr [rcx + 0x168], 1
01903 48be309472e200000000           movabs     rsi, 0xe2729430
0190d 4c8bc2                         mov        r8, rdx
01910 ba02000000                     mov        edx, 2
01915 b910000000                     mov        ecx, 0x10
0191a 498bc0                         mov        rax, r8
0191d 4c8bc0                         mov        r8, rax
01920 bf00000000                     mov        edi, 0
01925 48890424                       mov        qword ptr [rsp], rax
01929 48895c2408                     mov        qword ptr [rsp + 8], rbx
0192e 49bae89372e200000000           movabs     r10, 0xe27293e8
01938 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0193d 49bab06c73e200000000           movabs     r10, 0xe2736cb0
01947 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0194c 666690                         nop        
0194f e88cab5307                     call       0x7f959b8fb860
01954 0f1f84004c1a0006               nop        dword ptr [rax + rax + 0x6001a4c]
0195c 4885c0                         test       rax, rax
0195f 48bb10bb6e8c957f0000           movabs     rbx, 0x7f958c6ebb10
01969 750c                           jne        0x7f95943c0cf7
0196b 808b7101000001                 or         byte ptr [rbx + 0x171], 1
01972 e988000000                     jmp        0x7f95943c0d7f
01977 8b38                           mov        edi, dword ptr [rax]
01979 c1ef0d                         shr        edi, 0xd
0197c 48c1e70a                       shl        rdi, 0xa
01980 41ba00000054                   mov        r10d, 0x54000000
01986 4903fa                         add        rdi, r10
01989 41ba30000000                   mov        r10d, 0x30
0198f 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
01993 7436                           je         0x7f95943c0d4b
01995 4983c202                       add        r10, 2
01999 4983fa34                       cmp        r10, 0x34
0199d 75f0                           jne        0x7f95943c0d0f
0199f 41ba30000000                   mov        r10d, 0x30
019a5 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
019aa 7412                           je         0x7f95943c0d3e
019ac 4983c202                       add        r10, 2
019b0 4983fa34                       cmp        r10, 0x34
019b4 75ef                           jne        0x7f95943c0d25
019b6 41ba2f000000                   mov        r10d, 0x2f
019bc eb11                           jmp        0x7f95943c0d4f
019be 50                             push       rax
019bf 4833c0                         xor        rax, rax
019c2 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
019c8 58                             pop        rax
019c9 ebbe                           jmp        0x7f95943c0d09
019cb 4983c201                       add        r10, 1
019cf 4a8304d301                     add        qword ptr [rbx + r10*8], 1
019d4 48bf00b0145400000000           movabs     rdi, 0x5414b000
019de 8b18                           mov        ebx, dword ptr [rax]
019e0 c1eb0d                         shr        ebx, 0xd
019e3 48c1e30a                       shl        rbx, 0xa
019e7 41ba00000054                   mov        r10d, 0x54000000
019ed 4903da                         add        rbx, r10
019f0 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
019f4 0f85fe2c0000                   jne        0x7f95943c3a78
019fa e900000000                     jmp        0x7f95943c0d7f
019ff 488bf8                         mov        rdi, rax
01a02 4889bc24c8010000               mov        qword ptr [rsp + 0x1c8], rdi
01a0a 483b07                         cmp        rax, qword ptr [rdi]
01a0d 488bf7                         mov        rsi, rdi
01a10 48bbd8ab708c957f0000           movabs     rbx, 0x7f958c70abd8
01a1a 8b36                           mov        esi, dword ptr [rsi]
01a1c c1ee0d                         shr        esi, 0xd
01a1f 48c1e60a                       shl        rsi, 0xa
01a23 41ba00000054                   mov        r10d, 0x54000000
01a29 4903f2                         add        rsi, r10
01a2c 41baa3000000                   mov        r10d, 0xa3
01a32 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
01a36 743c                           je         0x7f95943c0df4
01a38 4983c202                       add        r10, 2
01a3c 4981faa7000000                 cmp        r10, 0xa7
01a43 75ed                           jne        0x7f95943c0db2
01a45 41baa3000000                   mov        r10d, 0xa3
01a4b 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01a50 7415                           je         0x7f95943c0de7
01a52 4983c202                       add        r10, 2
01a56 4981faa7000000                 cmp        r10, 0xa7
01a5d 75ec                           jne        0x7f95943c0dcb
01a5f 41baa2000000                   mov        r10d, 0xa2
01a65 eb11                           jmp        0x7f95943c0df8
01a67 50                             push       rax
01a68 4833c0                         xor        rax, rax
01a6b f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01a71 58                             pop        rax
01a72 ebb8                           jmp        0x7f95943c0dac
01a74 4983c201                       add        r10, 1
01a78 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01a7d 48bed8be6e8c957f0000           movabs     rsi, 0x7f958c6ebed8
01a87 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
01a8a 83c302                         add        ebx, 2
01a8d 895e70                         mov        dword ptr [rsi + 0x70], ebx
01a90 81e3feff1f00                   and        ebx, 0x1ffffe
01a96 85db                           test       ebx, ebx
01a98 0f84682c0000                   je         0x7f95943c3a86
01a9e 488bf7                         mov        rsi, rdi
01aa1 48bbd8be6e8c957f0000           movabs     rbx, 0x7f958c6ebed8
01aab 8b36                           mov        esi, dword ptr [rsi]
01aad c1ee0d                         shr        esi, 0xd
01ab0 48c1e60a                       shl        rsi, 0xa
01ab4 41ba00000054                   mov        r10d, 0x54000000
01aba 4903f2                         add        rsi, r10
01abd 41ba16000000                   mov        r10d, 0x16
01ac3 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
01ac7 7436                           je         0x7f95943c0e7f
01ac9 4983c202                       add        r10, 2
01acd 4983fa1a                       cmp        r10, 0x1a
01ad1 75f0                           jne        0x7f95943c0e43
01ad3 41ba16000000                   mov        r10d, 0x16
01ad9 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01ade 7412                           je         0x7f95943c0e72
01ae0 4983c202                       add        r10, 2
01ae4 4983fa1a                       cmp        r10, 0x1a
01ae8 75ef                           jne        0x7f95943c0e59
01aea 41ba15000000                   mov        r10d, 0x15
01af0 eb11                           jmp        0x7f95943c0e83
01af2 50                             push       rax
01af3 4833c0                         xor        rax, rax
01af6 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01afc 58                             pop        rax
01afd ebbe                           jmp        0x7f95943c0e3d
01aff 4983c201                       add        r10, 1
01b03 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01b08 488bf7                         mov        rsi, rdi
01b0b 6690                           nop        
01b0d 48b860ca1e70957f0000           movabs     rax, 0x7f95701eca60
01b17 e8c4a45307                     call       0x7f959b8fb360
01b1c 0f1f8400141c0007               nop        dword ptr [rax + rax + 0x7001c14]
01b24 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
01b2c 8b7704                         mov        esi, dword ptr [rdi + 4]
01b2f 48bbd8be6e8c957f0000           movabs     rbx, 0x7f958c6ebed8
01b39 488383d800000001               add        qword ptr [rbx + 0xd8], 1
01b41 48bb88a46e8c957f0000           movabs     rbx, 0x7f958c6ea488
01b4b 8b5370                         mov        edx, dword ptr [rbx + 0x70]
01b4e 83c202                         add        edx, 2
01b51 895370                         mov        dword ptr [rbx + 0x70], edx
01b54 81e2feff1f00                   and        edx, 0x1ffffe
01b5a 85d2                           test       edx, edx
01b5c 0f84ca2b0000                   je         0x7f95943c3aac
01b62 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01b6a 48bb88a46e8c957f0000           movabs     rbx, 0x7f958c6ea488
01b74 4883830801000001               add        qword ptr [rbx + 0x108], 1
01b7c ffc8                           dec        eax
01b7e 2bf0                           sub        esi, eax
01b80 48bb589b6e8c957f0000           movabs     rbx, 0x7f958c6e9b58
01b8a 8b4370                         mov        eax, dword ptr [rbx + 0x70]
01b8d 83c002                         add        eax, 2
01b90 894370                         mov        dword ptr [rbx + 0x70], eax
01b93 25feff1f00                     and        eax, 0x1ffffe
01b98 85c0                           test       eax, eax
01b9a 0f84ad2b0000                   je         0x7f95943c3acd
01ba0 48bb589b6e8c957f0000           movabs     rbx, 0x7f958c6e9b58
01baa 488383a800000001               add        qword ptr [rbx + 0xa8], 1
01bb2 48bb0000000000000000           movabs     rbx, 0
01bbc bb00000000                     mov        ebx, 0
01bc1 443bdb                         cmp        r11d, ebx
01bc4 0f8ca42b0000                   jl         0x7f95943c3aee
01bca 443bde                         cmp        r11d, esi
01bcd 0f8da82b0000                   jge        0x7f95943c3afb
01bd3 498bdb                         mov        rbx, r11
01bd6 899c24c4010000                 mov        dword ptr [rsp + 0x1c4], ebx
01bdd 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
01be5 488bbc24c8010000               mov        rdi, qword ptr [rsp + 0x1c8]
01bed 488bf7                         mov        rsi, rdi
01bf0 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
01bfa 8b36                           mov        esi, dword ptr [rsi]
01bfc c1ee0d                         shr        esi, 0xd
01bff 48c1e60a                       shl        rsi, 0xa
01c03 41ba00000054                   mov        r10d, 0x54000000
01c09 4903f2                         add        rsi, r10
01c0c 41ba1e000000                   mov        r10d, 0x1e
01c12 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01c16 7436                           je         0x7f95943c0fce
01c18 4983c202                       add        r10, 2
01c1c 4983fa22                       cmp        r10, 0x22
01c20 75f0                           jne        0x7f95943c0f92
01c22 41ba1e000000                   mov        r10d, 0x1e
01c28 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01c2d 7412                           je         0x7f95943c0fc1
01c2f 4983c202                       add        r10, 2
01c33 4983fa22                       cmp        r10, 0x22
01c37 75ef                           jne        0x7f95943c0fa8
01c39 41ba1d000000                   mov        r10d, 0x1d
01c3f eb11                           jmp        0x7f95943c0fd2
01c41 50                             push       rax
01c42 4833c0                         xor        rax, rax
01c45 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01c4b 58                             pop        rax
01c4c ebbe                           jmp        0x7f95943c0f8c
01c4e 4983c201                       add        r10, 1
01c52 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01c57 488bf7                         mov        rsi, rdi
01c5a 666690                         nop        
01c5d 48b888ca1e70957f0000           movabs     rax, 0x7f95701eca88
01c67 e874a35307                     call       0x7f959b8fb360
01c6c 0f1f8400641d0008               nop        dword ptr [rax + rax + 0x8001d64]
01c74 483b00                         cmp        rax, qword ptr [rax]
01c77 488bf0                         mov        rsi, rax
01c7a 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
01c84 8b36                           mov        esi, dword ptr [rsi]
01c86 c1ee0d                         shr        esi, 0xd
01c89 48c1e60a                       shl        rsi, 0xa
01c8d 41ba00000054                   mov        r10d, 0x54000000
01c93 4903f2                         add        rsi, r10
01c96 41ba24000000                   mov        r10d, 0x24
01c9c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01ca0 7436                           je         0x7f95943c1058
01ca2 4983c202                       add        r10, 2
01ca6 4983fa28                       cmp        r10, 0x28
01caa 75f0                           jne        0x7f95943c101c
01cac 41ba24000000                   mov        r10d, 0x24
01cb2 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01cb7 7412                           je         0x7f95943c104b
01cb9 4983c202                       add        r10, 2
01cbd 4983fa28                       cmp        r10, 0x28
01cc1 75ef                           jne        0x7f95943c1032
01cc3 41ba23000000                   mov        r10d, 0x23
01cc9 eb11                           jmp        0x7f95943c105c
01ccb 50                             push       rax
01ccc 4833c0                         xor        rax, rax
01ccf f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01cd5 58                             pop        rax
01cd6 ebbe                           jmp        0x7f95943c1016
01cd8 4983c201                       add        r10, 1
01cdc 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01ce1 8b7024                         mov        esi, dword ptr [rax + 0x24]
01ce4 488bd0                         mov        rdx, rax
01ce7 48b9d8be6e8c957f0000           movabs     rcx, 0x7f958c6ebed8
01cf1 8b12                           mov        edx, dword ptr [rdx]
01cf3 c1ea0d                         shr        edx, 0xd
01cf6 48c1e20a                       shl        rdx, 0xa
01cfa 41ba00000054                   mov        r10d, 0x54000000
01d00 4903d2                         add        rdx, r10
01d03 41ba2a000000                   mov        r10d, 0x2a
01d09 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01d0d 7436                           je         0x7f95943c10c5
01d0f 4983c202                       add        r10, 2
01d13 4983fa2e                       cmp        r10, 0x2e
01d17 75f0                           jne        0x7f95943c1089
01d19 41ba2a000000                   mov        r10d, 0x2a
01d1f 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01d24 7412                           je         0x7f95943c10b8
01d26 4983c202                       add        r10, 2
01d2a 4983fa2e                       cmp        r10, 0x2e
01d2e 75ef                           jne        0x7f95943c109f
01d30 41ba29000000                   mov        r10d, 0x29
01d36 eb11                           jmp        0x7f95943c10c9
01d38 50                             push       rax
01d39 4833c0                         xor        rax, rax
01d3c f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
01d42 58                             pop        rax
01d43 ebbe                           jmp        0x7f95943c1083
01d45 4983c201                       add        r10, 1
01d49 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01d4e 8b4804                         mov        ecx, dword ptr [rax + 4]
01d51 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
01d5b 4883827801000001               add        qword ptr [rdx + 0x178], 1
01d63 48bac0a66e8c957f0000           movabs     rdx, 0x7f958c6ea6c0
01d6d 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01d71 4183c002                       add        r8d, 2
01d75 44894270                       mov        dword ptr [rdx + 0x70], r8d
01d79 4181e0feff1f00                 and        r8d, 0x1ffffe
01d80 4585c0                         test       r8d, r8d
01d83 0f84042a0000                   je         0x7f95943c3b0d
01d89 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
01d93 4883828801000001               add        qword ptr [rdx + 0x188], 1
01d9b 8b9c24c4010000                 mov        ebx, dword ptr [rsp + 0x1c4]
01da2 4863db                         movsxd     rbx, ebx
01da5 ba08000000                     mov        edx, 8
01daa 4c8bcb                         mov        r9, rbx
01dad 4c03ca                         add        r9, rdx
01db0 48ba108a6e8c957f0000           movabs     rdx, 0x7f958c6e8a10
01dba 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01dbe 4183c002                       add        r8d, 2
01dc2 44894270                       mov        dword ptr [rdx + 0x70], r8d
01dc6 4181e0feff1f00                 and        r8d, 0x1ffffe
01dcd 4585c0                         test       r8d, r8d
01dd0 0f84d8290000                   je         0x7f95943c3b2e
01dd6 48ba108a6e8c957f0000           movabs     rdx, 0x7f958c6e8a10
01de0 488382d800000001               add        qword ptr [rdx + 0xd8], 1
01de8 48ba888b6e8c957f0000           movabs     rdx, 0x7f958c6e8b88
01df2 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01df6 4183c002                       add        r8d, 2
01dfa 44894270                       mov        dword ptr [rdx + 0x70], r8d
01dfe 4181e0feff1f00                 and        r8d, 0x1ffffe
01e05 4585c0                         test       r8d, r8d
01e08 0f84c1290000                   je         0x7f95943c3b4f
01e0e 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
01e18 488d9298010000                 lea        rdx, [rdx + 0x198]
01e1f 49b8980a74e200000000           movabs     r8, 0xe2740a98
01e29 49b800b8165400000000           movabs     r8, 0x5416b800
01e33 4d8bd0                         mov        r10, r8
01e36 4c3302                         xor        r8, qword ptr [rdx]
01e39 49f7c0fcffffff                 test       r8, -4
01e40 7427                           je         0x7f95943c11e9
01e42 41f6c002                       test       r8b, 2
01e46 7521                           jne        0x7f95943c11e9
01e48 48f702feffffff                 test       qword ptr [rdx], -2
01e4f 7415                           je         0x7f95943c11e6
01e51 4d8bc2                         mov        r8, r10
01e54 4c3302                         xor        r8, qword ptr [rdx]
01e57 49f7c0fcffffff                 test       r8, -4
01e5e 7409                           je         0x7f95943c11e9
01e60 48830a02                       or         qword ptr [rdx], 2
01e64 eb03                           jmp        0x7f95943c11e9
01e66 4c8902                         mov        qword ptr [rdx], r8
01e69 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
01e73 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
01e7b ba02000000                     mov        edx, 2
01e80 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
01e88 bf00000000                     mov        edi, 0
01e8d 488b8424c8010000               mov        rax, qword ptr [rsp + 0x1c8]
01e95 48890424                       mov        qword ptr [rsp], rax
01e99 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
01ea1 4889442408                     mov        qword ptr [rsp + 8], rax
01ea6 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01eab 49ba980a74e200000000           movabs     r10, 0xe2740a98
01eb5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01eba 0f1f440000                     nop        dword ptr [rax + rax]
01ebf e81ca65307                     call       0x7f959b8fb860
01ec4 0f1f8400bc1f0009               nop        dword ptr [rax + rax + 0x9001fbc]
01ecc 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01ed4 4183c310                       add        r11d, 0x10
01ed8 8bb424c0010000                 mov        esi, dword ptr [rsp + 0x1c0]
01edf 83c610                         add        esi, 0x10
01ee2 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01eea ba02000000                     mov        edx, 2
01eef 7c05                           jl         0x7f95943c1276
01ef1 ba00000000                     mov        edx, 0
01ef6 48b9d8ab708c957f0000           movabs     rcx, 0x7f958c70abd8
01f00 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
01f04 4403c2                         add        r8d, edx
01f07 44894174                       mov        dword ptr [rcx + 0x74], r8d
01f0b 85d2                           test       edx, edx
01f0d 7506                           jne        0x7f95943c1295
01f0f 41b802000000                   mov        r8d, 2
01f15 4181e0fe3f0000                 and        r8d, 0x3ffe
01f1c 4585c0                         test       r8d, r8d
01f1f 0f84cb280000                   je         0x7f95943c3b70
01f25 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01f29 418502                         test       dword ptr [r10], eax
01f2c 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01f34 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
01f3e b940050000                     mov        ecx, 0x540
01f43 7c05                           jl         0x7f95943c12ca
01f45 b950050000                     mov        ecx, 0x550
01f4a 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01f4e 4d8d4001                       lea        r8, [r8 + 1]
01f52 4c89040a                       mov        qword ptr [rdx + rcx], r8
01f56 0f8cf4f3ffff                   jl         0x7f95943c06d0
01f5c 48bed8ab708c957f0000           movabs     rsi, 0x7f958c70abd8
01f66 ff8660050000                   inc        dword ptr [rsi + 0x560]
01f6c e9a5000000                     jmp        0x7f95943c1396
01f71 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
01f7b 4883827805000001               add        qword ptr [rdx + 0x578], 1
01f83 488bb42468010000               mov        rsi, qword ptr [rsp + 0x168]
01f8b 8b942490010000                 mov        edx, dword ptr [rsp + 0x190]
01f92 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
01f9a 448b842474010000               mov        r8d, dword ptr [rsp + 0x174]
01fa2 4c8bcf                         mov        r9, rdi
01fa5 4885c9                         test       rcx, rcx
01fa8 0f8463280000                   je         0x7f95943c3b91
01fae 85d2                           test       edx, edx
01fb0 0f8c5b280000                   jl         0x7f95943c3b91
01fb6 4585c0                         test       r8d, r8d
01fb9 0f8c52280000                   jl         0x7f95943c3b91
01fbf 4a8d3c0a                       lea        rdi, [rdx + r9]
01fc3 3b7e04                         cmp        edi, dword ptr [rsi + 4]
01fc6 0f8745280000                   ja         0x7f95943c3b91
01fcc 4b8d3c08                       lea        rdi, [r8 + r9]
01fd0 3b7904                         cmp        edi, dword ptr [rcx + 4]
01fd3 0f8738280000                   ja         0x7f95943c3b91
01fd9 4585c9                         test       r9d, r9d
01fdc 0f8c2f280000                   jl         0x7f95943c3b91
01fe2 4863d2                         movsxd     rdx, edx
01fe5 4d63c0                         movsxd     r8, r8d
01fe8 488d7c1608                     lea        rdi, [rsi + rdx + 8]
01fed 4a8d740108                     lea        rsi, [rcx + r8 + 8]
01ff2 498bd1                         mov        rdx, r9
01ff5 40f6c40f                       test       spl, 0xf
01ff9 0f8412000000                   je         0x7f95943c1391
01fff 4883ec08                       sub        rsp, 8
02003 e8983b5207                     call       0x7f959b8e4f20
02008 4883c408                       add        rsp, 8
0200c e905000000                     jmp        0x7f95943c1396
02011 e88a3b5207                     call       0x7f959b8e4f20
02016 8bb424a4010000                 mov        esi, dword ptr [rsp + 0x1a4]
0201d 8b9c24a0010000                 mov        ebx, dword ptr [rsp + 0x1a0]
02024 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
0202c 488bfb                         mov        rdi, rbx
0202f 2bbc24a8010000                 sub        edi, dword ptr [rsp + 0x1a8]
02036 4183f810                       cmp        r8d, 0x10
0203a 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
02044 b988050000                     mov        ecx, 0x588
02049 7f05                           jg         0x7f95943c13d0
0204b b998050000                     mov        ecx, 0x598
02050 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
02054 4d8d4901                       lea        r9, [r9 + 1]
02058 4c890c0a                       mov        qword ptr [rdx + rcx], r9
0205c 448b8c24a8010000               mov        r9d, dword ptr [rsp + 0x1a8]
02064 0f8f2c000000                   jg         0x7f95943c1416
0206a 4183f910                       cmp        r9d, 0x10
0206e 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
02078 b9b8050000                     mov        ecx, 0x5b8
0207d 7d05                           jge        0x7f95943c1404
0207f b9a8050000                     mov        ecx, 0x5a8
02084 488b040a                       mov        rax, qword ptr [rdx + rcx]
02088 488d4001                       lea        rax, [rax + 1]
0208c 4889040a                       mov        qword ptr [rdx + rcx], rax
02090 0f8de6110000                   jge        0x7f95943c25fc
02096 453bc8                         cmp        r9d, r8d
02099 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
020a3 b920060000                     mov        ecx, 0x620
020a8 7c05                           jl         0x7f95943c142f
020aa b930060000                     mov        ecx, 0x630
020af 488b040a                       mov        rax, qword ptr [rdx + rcx]
020b3 488d4001                       lea        rax, [rax + 1]
020b7 4889040a                       mov        qword ptr [rdx + rcx], rax
020bb 0f8c04030000                   jl         0x7f95943c1745
020c1 4183f830                       cmp        r8d, 0x30
020c5 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
020cf b940060000                     mov        ecx, 0x640
020d4 7e05                           jle        0x7f95943c145b
020d6 b950060000                     mov        ecx, 0x650
020db 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
020df 4d8d4901                       lea        r9, [r9 + 1]
020e3 4c890c0a                       mov        qword ptr [rdx + rcx], r9
020e7 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
020ee 0f8ec4000000                   jle        0x7f95943c1538
020f4 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
020fe 4883826006000001               add        qword ptr [rdx + 0x660], 1
02106 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
0210e 488bd7                         mov        rdx, rdi
02111 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
02119 498bf8                         mov        rdi, r8
0211c 4c8bc3                         mov        r8, rbx
0211f 4c8bcf                         mov        r9, rdi
02122 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
02129 4885f6                         test       rsi, rsi
0212c 0f84ef260000                   je         0x7f95943c3ba1
02132 4885c9                         test       rcx, rcx
02135 0f84e6260000                   je         0x7f95943c3ba1
0213b 85d2                           test       edx, edx
0213d 0f8cde260000                   jl         0x7f95943c3ba1
02143 4585c0                         test       r8d, r8d
02146 0f8cd5260000                   jl         0x7f95943c3ba1
0214c 4a8d3c0a                       lea        rdi, [rdx + r9]
02150 3b7e04                         cmp        edi, dword ptr [rsi + 4]
02153 0f87c8260000                   ja         0x7f95943c3ba1
02159 4b8d3c08                       lea        rdi, [r8 + r9]
0215d 3b7904                         cmp        edi, dword ptr [rcx + 4]
02160 0f87bb260000                   ja         0x7f95943c3ba1
02166 4585c9                         test       r9d, r9d
02169 0f8cb2260000                   jl         0x7f95943c3ba1
0216f 4863d2                         movsxd     rdx, edx
02172 4d63c0                         movsxd     r8, r8d
02175 488d7c1608                     lea        rdi, [rsi + rdx + 8]
0217a 4a8d740108                     lea        rsi, [rcx + r8 + 8]
0217f 498bd1                         mov        rdx, r9
02182 40f6c40f                       test       spl, 0xf
02186 0f8412000000                   je         0x7f95943c151e
0218c 4883ec08                       sub        rsp, 8
02190 e80b3a5207                     call       0x7f959b8e4f20
02195 4883c408                       add        rsp, 8
02199 e905000000                     jmp        0x7f95943c1523
0219e e8fd395207                     call       0x7f959b8e4f20
021a3 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
021ad ff8270060000                   inc        dword ptr [rdx + 0x670]
021b3 e9ea010000                     jmp        0x7f95943c1722
021b8 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
021bf 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
021c6 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
021cd 899c24e0010000                 mov        dword ptr [rsp + 0x1e0], ebx
021d4 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
021db 0f1f440000                     nop        dword ptr [rax + rax]
021e0 898424d8010000                 mov        dword ptr [rsp + 0x1d8], eax
021e7 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
021ef 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
021f9 4883828806000001               add        qword ptr [rdx + 0x688], 1
02201 48ba7871708c957f0000           movabs     rdx, 0x7f958c707178
0220b 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0220e 83c102                         add        ecx, 2
02211 894a70                         mov        dword ptr [rdx + 0x70], ecx
02214 81e1feff1f00                   and        ecx, 0x1ffffe
0221a 85c9                           test       ecx, ecx
0221c 0f840f260000                   je         0x7f95943c3bb1
02222 660f1f440000                   nop        word ptr [rax + rax]
02228 e934260000                     jmp        0x7f95943c3be1
0222d 90                             nop        
0222e 90                             nop        
0222f 90                             nop        
02230 90                             nop        
02231 90                             nop        
02232 48ba7871708c957f0000           movabs     rdx, 0x7f958c707178
0223c 488d92d8000000                 lea        rdx, [rdx + 0xd8]
02243 4885c0                         test       rax, rax
02246 750c                           jne        0x7f95943c15d4
02248 f6420801                       test       byte ptr [rdx + 8], 1
0224c 7506                           jne        0x7f95943c15d4
0224e f048834a0801                   lock or    qword ptr [rdx + 8], 1
02254 48be50c66fe200000000           movabs     rsi, 0xe26fc650
0225e 488bd6                         mov        rdx, rsi
02261 48b97871708c957f0000           movabs     rcx, 0x7f958c707178
0226b 8b12                           mov        edx, dword ptr [rdx]
0226d c1ea0d                         shr        edx, 0xd
02270 48c1e20a                       shl        rdx, 0xa
02274 41ba00000054                   mov        r10d, 0x54000000
0227a 4903d2                         add        rdx, r10
0227d 41ba16000000                   mov        r10d, 0x16
02283 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02287 7436                           je         0x7f95943c163f
02289 4983c202                       add        r10, 2
0228d 4983fa1a                       cmp        r10, 0x1a
02291 75f0                           jne        0x7f95943c1603
02293 41ba16000000                   mov        r10d, 0x16
02299 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0229e 7412                           je         0x7f95943c1632
022a0 4983c202                       add        r10, 2
022a4 4983fa1a                       cmp        r10, 0x1a
022a8 75ef                           jne        0x7f95943c1619
022aa 41ba15000000                   mov        r10d, 0x15
022b0 eb11                           jmp        0x7f95943c1643
022b2 50                             push       rax
022b3 4833c0                         xor        rax, rax
022b6 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
022bc 58                             pop        rax
022bd ebbe                           jmp        0x7f95943c15fd
022bf 4983c201                       add        r10, 1
022c3 4a8304d101                     add        qword ptr [rcx + r10*8], 1
022c8 488bd0                         mov        rdx, rax
022cb 488bcf                         mov        rcx, rdi
022ce 89bc24dc010000                 mov        dword ptr [rsp + 0x1dc], edi
022d5 6690                           nop        
022d7 e804985307                     call       0x7f959b8fae60
022dc 0f1f8400d423000b               nop        dword ptr [rax + rax + 0xb0023d4]
022e4 48bed8ab708c957f0000           movabs     rsi, 0x7f958c70abd8
022ee 4883869806000001               add        qword ptr [rsi + 0x698], 1
022f6 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
022fe 8b9424d8010000                 mov        edx, dword ptr [rsp + 0x1d8]
02305 488bc8                         mov        rcx, rax
02308 0f1f8000000000                 nop        dword ptr [rax]
0230f e8cca15307                     call       0x7f959b8fb860
02314 0f1f84000c24000c               nop        dword ptr [rax + rax + 0xc00240c]
0231c 8b8424d8010000                 mov        eax, dword ptr [rsp + 0x1d8]
02323 83c008                         add        eax, 8
02326 8bbc24dc010000                 mov        edi, dword ptr [rsp + 0x1dc]
0232d 83c708                         add        edi, 8
02330 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
02337 be02000000                     mov        esi, 2
0233c 7c05                           jl         0x7f95943c16c3
0233e be00000000                     mov        esi, 0
02343 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
0234d 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
02350 03ce                           add        ecx, esi
02352 894a74                         mov        dword ptr [rdx + 0x74], ecx
02355 85f6                           test       esi, esi
02357 7505                           jne        0x7f95943c16de
02359 b902000000                     mov        ecx, 2
0235e 81e1fe3f0000                   and        ecx, 0x3ffe
02364 85c9                           test       ecx, ecx
02366 0f84ff240000                   je         0x7f95943c3beb
0236c 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02370 418502                         test       dword ptr [r10], eax
02373 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
0237a 48bed8ab708c957f0000           movabs     rsi, 0x7f958c70abd8
02384 baa8060000                     mov        edx, 0x6a8
02389 7c05                           jl         0x7f95943c1710
0238b bab8060000                     mov        edx, 0x6b8
02390 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
02394 488d4901                       lea        rcx, [rcx + 1]
02398 48890c16                       mov        qword ptr [rsi + rdx], rcx
0239c 0f8c3efeffff                   jl         0x7f95943c1560
023a2 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
023a9 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
023b0 48bed8ab708c957f0000           movabs     rsi, 0x7f958c70abd8
023ba ff86c8060000                   inc        dword ptr [rsi + 0x6c8]
023c0 e9011a0000                     jmp        0x7f95943c3146
023c5 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
023cc 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
023d3 4183f910                       cmp        r9d, 0x10
023d7 48bed8ab708c957f0000           movabs     rsi, 0x7f958c70abd8
023e1 bae0060000                     mov        edx, 0x6e0
023e6 7c05                           jl         0x7f95943c176d
023e8 baf0060000                     mov        edx, 0x6f0
023ed 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
023f1 488d4901                       lea        rcx, [rcx + 1]
023f5 48890c16                       mov        qword ptr [rsi + rdx], rcx
023f9 0f8c0d0c0000                   jl         0x7f95943c238c
023ff 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
02406 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
0240d 899c24f0010000                 mov        dword ptr [rsp + 0x1f0], ebx
02414 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
0241b 0f1f440000                     nop        dword ptr [rax + rax]
02420 898424ec010000                 mov        dword ptr [rsp + 0x1ec], eax
02427 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0242f 48bed8ab708c957f0000           movabs     rsi, 0x7f958c70abd8
02439 4883860007000001               add        qword ptr [rsi + 0x700], 1
02441 48be68b86e8c957f0000           movabs     rsi, 0x7f958c6eb868
0244b 8b5670                         mov        edx, dword ptr [rsi + 0x70]
0244e 83c202                         add        edx, 2
02451 895670                         mov        dword ptr [rsi + 0x70], edx
02454 81e2feff1f00                   and        edx, 0x1ffffe
0245a 85d2                           test       edx, edx
0245c 0f842a240000                   je         0x7f95943c3c0c
02462 48bee89372e200000000           movabs     rsi, 0xe27293e8
0246c 48ba68b86e8c957f0000           movabs     rdx, 0x7f958c6eb868
02476 8b36                           mov        esi, dword ptr [rsi]
02478 c1ee0d                         shr        esi, 0xd
0247b 48c1e60a                       shl        rsi, 0xa
0247f 41ba00000054                   mov        r10d, 0x54000000
02485 4903f2                         add        rsi, r10
02488 41ba16000000                   mov        r10d, 0x16
0248e 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02492 7436                           je         0x7f95943c184a
02494 4983c202                       add        r10, 2
02498 4983fa1a                       cmp        r10, 0x1a
0249c 75f0                           jne        0x7f95943c180e
0249e 41ba16000000                   mov        r10d, 0x16
024a4 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
024a9 7412                           je         0x7f95943c183d
024ab 4983c202                       add        r10, 2
024af 4983fa1a                       cmp        r10, 0x1a
024b3 75ef                           jne        0x7f95943c1824
024b5 41ba15000000                   mov        r10d, 0x15
024bb eb11                           jmp        0x7f95943c184e
024bd 50                             push       rax
024be 4833c0                         xor        rax, rax
024c1 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
024c7 58                             pop        rax
024c8 ebbe                           jmp        0x7f95943c1808
024ca 4983c201                       add        r10, 1
024ce 4a8304d201                     add        qword ptr [rdx + r10*8], 1
024d3 448b6804                       mov        r13d, dword ptr [rax + 4]
024d7 48be68b86e8c957f0000           movabs     rsi, 0x7f958c6eb868
024e1 488386d800000001               add        qword ptr [rsi + 0xd8], 1
024e9 48be88a46e8c957f0000           movabs     rsi, 0x7f958c6ea488
024f3 8b5670                         mov        edx, dword ptr [rsi + 0x70]
024f6 83c202                         add        edx, 2
024f9 895670                         mov        dword ptr [rsi + 0x70], edx
024fc 81e2feff1f00                   and        edx, 0x1ffffe
02502 85d2                           test       edx, edx
02504 0f84a8230000                   je         0x7f95943c3c32
0250a 48be88a46e8c957f0000           movabs     rsi, 0x7f958c6ea488
02514 4883860801000001               add        qword ptr [rsi + 0x108], 1
0251c 498bf5                         mov        rsi, r13
0251f 83ee0f                         sub        esi, 0xf
02522 48ba589b6e8c957f0000           movabs     rdx, 0x7f958c6e9b58
0252c 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0252f 83c102                         add        ecx, 2
02532 894a70                         mov        dword ptr [rdx + 0x70], ecx
02535 81e1feff1f00                   and        ecx, 0x1ffffe
0253b 85c9                           test       ecx, ecx
0253d 0f8490230000                   je         0x7f95943c3c53
02543 48ba589b6e8c957f0000           movabs     rdx, 0x7f958c6e9b58
0254d 488382a800000001               add        qword ptr [rdx + 0xa8], 1
02555 48ba0000000000000000           movabs     rdx, 0
0255f ba00000000                     mov        edx, 0
02564 3bfa                           cmp        edi, edx
02566 0f8c88230000                   jl         0x7f95943c3c74
0256c 3bfe                           cmp        edi, esi
0256e 0f8d8d230000                   jge        0x7f95943c3c81
02574 488bf7                         mov        rsi, rdi
02577 48bae89372e200000000           movabs     rdx, 0xe27293e8
02581 488bca                         mov        rcx, rdx
02584 49b868b86e8c957f0000           movabs     r8, 0x7f958c6eb868
0258e 8b09                           mov        ecx, dword ptr [rcx]
02590 c1e90d                         shr        ecx, 0xd
02593 48c1e10a                       shl        rcx, 0xa
02597 41ba00000054                   mov        r10d, 0x54000000
0259d 4903ca                         add        rcx, r10
025a0 41ba24000000                   mov        r10d, 0x24
025a6 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
025aa 7436                           je         0x7f95943c1962
025ac 4983c202                       add        r10, 2
025b0 4983fa28                       cmp        r10, 0x28
025b4 75f0                           jne        0x7f95943c1926
025b6 41ba24000000                   mov        r10d, 0x24
025bc 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
025c1 7412                           je         0x7f95943c1955
025c3 4983c202                       add        r10, 2
025c7 4983fa28                       cmp        r10, 0x28
025cb 75ef                           jne        0x7f95943c193c
025cd 41ba23000000                   mov        r10d, 0x23
025d3 eb11                           jmp        0x7f95943c1966
025d5 50                             push       rax
025d6 4833c0                         xor        rax, rax
025d9 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
025df 58                             pop        rax
025e0 ebbe                           jmp        0x7f95943c1920
025e2 4983c201                       add        r10, 1
025e6 4b8304d001                     add        qword ptr [r8 + r10*8], 1
025eb 48b9589c6e8c957f0000           movabs     rcx, 0x7f958c6e9c58
025f5 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
025f9 4183c002                       add        r8d, 2
025fd 44894170                       mov        dword ptr [rcx + 0x70], r8d
02601 4181e0feff1f00                 and        r8d, 0x1ffffe
02608 4585c0                         test       r8d, r8d
0260b 0f84fd220000                   je         0x7f95943c3c8e
02611 48b9589c6e8c957f0000           movabs     rcx, 0x7f958c6e9c58
0261b 488381a800000001               add        qword ptr [rcx + 0xa8], 1
02623 48ba809d6e8c957f0000           movabs     rdx, 0x7f958c6e9d80
0262d 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02630 83c102                         add        ecx, 2
02633 894a70                         mov        dword ptr [rdx + 0x70], ecx
02636 81e1feff1f00                   and        ecx, 0x1ffffe
0263c 85c9                           test       ecx, ecx
0263e 0f84eb220000                   je         0x7f95943c3caf
02644 48ba809d6e8c957f0000           movabs     rdx, 0x7f958c6e9d80
0264e ff82b8000000                   inc        dword ptr [rdx + 0xb8]
02654 4489ac24e8010000               mov        dword ptr [rsp + 0x1e8], r13d
0265c 89bc24e4010000                 mov        dword ptr [rsp + 0x1e4], edi
02663 48bae01373e200000000           movabs     rdx, 0xe27313e0
0266d 488bca                         mov        rcx, rdx
02670 49b868b86e8c957f0000           movabs     r8, 0x7f958c6eb868
0267a 48b90050165400000000           movabs     rcx, 0x54165000
02684 41ba2a000000                   mov        r10d, 0x2a
0268a 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0268e 7436                           je         0x7f95943c1a46
02690 4983c202                       add        r10, 2
02694 4983fa2e                       cmp        r10, 0x2e
02698 75f0                           jne        0x7f95943c1a0a
0269a 41ba2a000000                   mov        r10d, 0x2a
026a0 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
026a5 7412                           je         0x7f95943c1a39
026a7 4983c202                       add        r10, 2
026ab 4983fa2e                       cmp        r10, 0x2e
026af 75ef                           jne        0x7f95943c1a20
026b1 41ba29000000                   mov        r10d, 0x29
026b7 eb11                           jmp        0x7f95943c1a4a
026b9 50                             push       rax
026ba 4833c0                         xor        rax, rax
026bd f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
026c3 58                             pop        rax
026c4 ebbe                           jmp        0x7f95943c1a04
026c6 4983c201                       add        r10, 1
026ca 4b8304d001                     add        qword ptr [r8 + r10*8], 1
026cf 48b930ba6e8c957f0000           movabs     rcx, 0x7f958c6eba30
026d9 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
026dd 4183c002                       add        r8d, 2
026e1 44894170                       mov        dword ptr [rcx + 0x70], r8d
026e5 4181e0feff1f00                 and        r8d, 0x1ffffe
026ec 4585c0                         test       r8d, r8d
026ef 0f845b220000                   je         0x7f95943c3cd0
026f5 488bca                         mov        rcx, rdx
026f8 49b830ba6e8c957f0000           movabs     r8, 0x7f958c6eba30
02702 498380a800000001               add        qword ptr [r8 + 0xa8], 1
0270a 48b910bb6e8c957f0000           movabs     rcx, 0x7f958c6ebb10
02714 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
02718 4183c002                       add        r8d, 2
0271c 44894170                       mov        dword ptr [rcx + 0x70], r8d
02720 4181e0feff1f00                 and        r8d, 0x1ffffe
02727 4585c0                         test       r8d, r8d
0272a 0f8441220000                   je         0x7f95943c3cf1
02730 48b910bb6e8c957f0000           movabs     rcx, 0x7f958c6ebb10
0273a 48ba0050165400000000           movabs     rdx, 0x54165000
02744 41ba16000000                   mov        r10d, 0x16
0274a 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0274e 7436                           je         0x7f95943c1b06
02750 4983c202                       add        r10, 2
02754 4983fa1a                       cmp        r10, 0x1a
02758 75f0                           jne        0x7f95943c1aca
0275a 41ba16000000                   mov        r10d, 0x16
02760 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02765 7412                           je         0x7f95943c1af9
02767 4983c202                       add        r10, 2
0276b 4983fa1a                       cmp        r10, 0x1a
0276f 75ef                           jne        0x7f95943c1ae0
02771 41ba15000000                   mov        r10d, 0x15
02777 eb11                           jmp        0x7f95943c1b0a
02779 50                             push       rax
0277a 4833c0                         xor        rax, rax
0277d f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02783 58                             pop        rax
02784 ebbe                           jmp        0x7f95943c1ac4
02786 4983c201                       add        r10, 1
0278a 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0278f 48ba00a66e8c957f0000           movabs     rdx, 0x7f958c6ea600
02799 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0279c 83c102                         add        ecx, 2
0279f 894a70                         mov        dword ptr [rdx + 0x70], ecx
027a2 81e1feff1f00                   and        ecx, 0x1ffffe
027a8 85c9                           test       ecx, ecx
027aa 0f84e2210000                   je         0x7f95943c3d12
027b0 48bae89372e200000000           movabs     rdx, 0xe27293e8
027ba 488bca                         mov        rcx, rdx
027bd 49b810bb6e8c957f0000           movabs     r8, 0x7f958c6ebb10
027c7 8b09                           mov        ecx, dword ptr [rcx]
027c9 c1e90d                         shr        ecx, 0xd
027cc 48c1e10a                       shl        rcx, 0xa
027d0 41ba00000054                   mov        r10d, 0x54000000
027d6 4903ca                         add        rcx, r10
027d9 41ba1c000000                   mov        r10d, 0x1c
027df 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
027e3 7436                           je         0x7f95943c1b9b
027e5 4983c202                       add        r10, 2
027e9 4983fa20                       cmp        r10, 0x20
027ed 75f0                           jne        0x7f95943c1b5f
027ef 41ba1c000000                   mov        r10d, 0x1c
027f5 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
027fa 7412                           je         0x7f95943c1b8e
027fc 4983c202                       add        r10, 2
02800 4983fa20                       cmp        r10, 0x20
02804 75ef                           jne        0x7f95943c1b75
02806 41ba1b000000                   mov        r10d, 0x1b
0280c eb11                           jmp        0x7f95943c1b9f
0280e 50                             push       rax
0280f 4833c0                         xor        rax, rax
02812 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
02818 58                             pop        rax
02819 ebbe                           jmp        0x7f95943c1b59
0281b 4983c201                       add        r10, 1
0281f 4b8304d001                     add        qword ptr [r8 + r10*8], 1
02824 48b910bb6e8c957f0000           movabs     rcx, 0x7f958c6ebb10
0282e 8b12                           mov        edx, dword ptr [rdx]
02830 c1ea0d                         shr        edx, 0xd
02833 48c1e20a                       shl        rdx, 0xa
02837 41ba00000054                   mov        r10d, 0x54000000
0283d 4903d2                         add        rdx, r10
02840 41ba22000000                   mov        r10d, 0x22
02846 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0284a 7436                           je         0x7f95943c1c02
0284c 4983c202                       add        r10, 2
02850 4983fa26                       cmp        r10, 0x26
02854 75f0                           jne        0x7f95943c1bc6
02856 41ba22000000                   mov        r10d, 0x22
0285c 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02861 7412                           je         0x7f95943c1bf5
02863 4983c202                       add        r10, 2
02867 4983fa26                       cmp        r10, 0x26
0286b 75ef                           jne        0x7f95943c1bdc
0286d 41ba21000000                   mov        r10d, 0x21
02873 eb11                           jmp        0x7f95943c1c06
02875 50                             push       rax
02876 4833c0                         xor        rax, rax
02879 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
0287f 58                             pop        rax
02880 ebbe                           jmp        0x7f95943c1bc0
02882 4983c201                       add        r10, 1
02886 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0288b 48ba10bb6e8c957f0000           movabs     rdx, 0x7f958c6ebb10
02895 4883823801000001               add        qword ptr [rdx + 0x138], 1
0289d 48bac0a66e8c957f0000           movabs     rdx, 0x7f958c6ea6c0
028a7 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
028aa 83c102                         add        ecx, 2
028ad 894a70                         mov        dword ptr [rdx + 0x70], ecx
028b0 81e1feff1f00                   and        ecx, 0x1ffffe
028b6 85c9                           test       ecx, ecx
028b8 0f84f5200000                   je         0x7f95943c3d33
028be 48ba10bb6e8c957f0000           movabs     rdx, 0x7f958c6ebb10
028c8 4883824801000001               add        qword ptr [rdx + 0x148], 1
028d0 4c63f6                         movsxd     r14, esi
028d3 be08000000                     mov        esi, 8
028d8 4d8bce                         mov        r9, r14
028db 4c03ce                         add        r9, rsi
028de 48be108a6e8c957f0000           movabs     rsi, 0x7f958c6e8a10
028e8 8b5670                         mov        edx, dword ptr [rsi + 0x70]
028eb 83c202                         add        edx, 2
028ee 895670                         mov        dword ptr [rsi + 0x70], edx
028f1 81e2feff1f00                   and        edx, 0x1ffffe
028f7 85d2                           test       edx, edx
028f9 0f84d5200000                   je         0x7f95943c3d54
028ff 48be108a6e8c957f0000           movabs     rsi, 0x7f958c6e8a10
02909 488386d800000001               add        qword ptr [rsi + 0xd8], 1
02911 48be888b6e8c957f0000           movabs     rsi, 0x7f958c6e8b88
0291b 8b5670                         mov        edx, dword ptr [rsi + 0x70]
0291e 83c202                         add        edx, 2
02921 895670                         mov        dword ptr [rsi + 0x70], edx
02924 81e2feff1f00                   and        edx, 0x1ffffe
0292a 85d2                           test       edx, edx
0292c 0f84c3200000                   je         0x7f95943c3d75
02932 48be10bb6e8c957f0000           movabs     rsi, 0x7f958c6ebb10
0293c 488db658010000                 lea        rsi, [rsi + 0x158]
02943 48bab06c73e200000000           movabs     rdx, 0xe2736cb0
0294d 48ba00a8165400000000           movabs     rdx, 0x5416a800
02957 4c8bd2                         mov        r10, rdx
0295a 483316                         xor        rdx, qword ptr [rsi]
0295d 48f7c2fcffffff                 test       rdx, -4
02964 7426                           je         0x7f95943c1d0c
02966 f6c202                         test       dl, 2
02969 7521                           jne        0x7f95943c1d0c
0296b 48f706feffffff                 test       qword ptr [rsi], -2
02972 7415                           je         0x7f95943c1d09
02974 498bd2                         mov        rdx, r10
02977 483316                         xor        rdx, qword ptr [rsi]
0297a 48f7c2fcffffff                 test       rdx, -4
02981 7409                           je         0x7f95943c1d0c
02983 48830e02                       or         qword ptr [rsi], 2
02987 eb03                           jmp        0x7f95943c1d0c
02989 488916                         mov        qword ptr [rsi], rdx
0298c 48be10bb6e8c957f0000           movabs     rsi, 0x7f958c6ebb10
02996 4883866801000001               add        qword ptr [rsi + 0x168], 1
0299e 48be309472e200000000           movabs     rsi, 0xe2729430
029a8 ba02000000                     mov        edx, 2
029ad b910000000                     mov        ecx, 0x10
029b2 4c8bc0                         mov        r8, rax
029b5 bf00000000                     mov        edi, 0
029ba 48890424                       mov        qword ptr [rsp], rax
029be 4c89742408                     mov        qword ptr [rsp + 8], r14
029c3 49bae89372e200000000           movabs     r10, 0xe27293e8
029cd 4c89542410                     mov        qword ptr [rsp + 0x10], r10
029d2 49bab06c73e200000000           movabs     r10, 0xe2736cb0
029dc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
029e1 660f1f440000                   nop        word ptr [rax + rax]
029e7 e8f49a5307                     call       0x7f959b8fb860
029ec 0f1f8400e42a000e               nop        dword ptr [rax + rax + 0xe002ae4]
029f4 4885c0                         test       rax, rax
029f7 48bb10bb6e8c957f0000           movabs     rbx, 0x7f958c6ebb10
02a01 750c                           jne        0x7f95943c1d8f
02a03 808b7101000001                 or         byte ptr [rbx + 0x171], 1
02a0a e988000000                     jmp        0x7f95943c1e17
02a0f 8b38                           mov        edi, dword ptr [rax]
02a11 c1ef0d                         shr        edi, 0xd
02a14 48c1e70a                       shl        rdi, 0xa
02a18 41ba00000054                   mov        r10d, 0x54000000
02a1e 4903fa                         add        rdi, r10
02a21 41ba30000000                   mov        r10d, 0x30
02a27 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
02a2b 7436                           je         0x7f95943c1de3
02a2d 4983c202                       add        r10, 2
02a31 4983fa34                       cmp        r10, 0x34
02a35 75f0                           jne        0x7f95943c1da7
02a37 41ba30000000                   mov        r10d, 0x30
02a3d 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02a42 7412                           je         0x7f95943c1dd6
02a44 4983c202                       add        r10, 2
02a48 4983fa34                       cmp        r10, 0x34
02a4c 75ef                           jne        0x7f95943c1dbd
02a4e 41ba2f000000                   mov        r10d, 0x2f
02a54 eb11                           jmp        0x7f95943c1de7
02a56 50                             push       rax
02a57 4833c0                         xor        rax, rax
02a5a f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
02a60 58                             pop        rax
02a61 ebbe                           jmp        0x7f95943c1da1
02a63 4983c201                       add        r10, 1
02a67 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02a6c 48bf00b0145400000000           movabs     rdi, 0x5414b000
02a76 8b18                           mov        ebx, dword ptr [rax]
02a78 c1eb0d                         shr        ebx, 0xd
02a7b 48c1e30a                       shl        rbx, 0xa
02a7f 41ba00000054                   mov        r10d, 0x54000000
02a85 4903da                         add        rbx, r10
02a88 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
02a8c 0f85841f0000                   jne        0x7f95943c3d96
02a92 e900000000                     jmp        0x7f95943c1e17
02a97 488bf8                         mov        rdi, rax
02a9a 4889bc24f8010000               mov        qword ptr [rsp + 0x1f8], rdi
02aa2 483b07                         cmp        rax, qword ptr [rdi]
02aa5 488bf7                         mov        rsi, rdi
02aa8 48bbd8ab708c957f0000           movabs     rbx, 0x7f958c70abd8
02ab2 8b36                           mov        esi, dword ptr [rsi]
02ab4 c1ee0d                         shr        esi, 0xd
02ab7 48c1e60a                       shl        rsi, 0xa
02abb 41ba00000054                   mov        r10d, 0x54000000
02ac1 4903f2                         add        rsi, r10
02ac4 41bae3000000                   mov        r10d, 0xe3
02aca 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02ace 743c                           je         0x7f95943c1e8c
02ad0 4983c202                       add        r10, 2
02ad4 4981fae7000000                 cmp        r10, 0xe7
02adb 75ed                           jne        0x7f95943c1e4a
02add 41bae3000000                   mov        r10d, 0xe3
02ae3 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02ae8 7415                           je         0x7f95943c1e7f
02aea 4983c202                       add        r10, 2
02aee 4981fae7000000                 cmp        r10, 0xe7
02af5 75ec                           jne        0x7f95943c1e63
02af7 41bae2000000                   mov        r10d, 0xe2
02afd eb11                           jmp        0x7f95943c1e90
02aff 50                             push       rax
02b00 4833c0                         xor        rax, rax
02b03 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02b09 58                             pop        rax
02b0a ebb8                           jmp        0x7f95943c1e44
02b0c 4983c201                       add        r10, 1
02b10 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02b15 48bed8be6e8c957f0000           movabs     rsi, 0x7f958c6ebed8
02b1f 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
02b22 83c302                         add        ebx, 2
02b25 895e70                         mov        dword ptr [rsi + 0x70], ebx
02b28 81e3feff1f00                   and        ebx, 0x1ffffe
02b2e 85db                           test       ebx, ebx
02b30 0f84ee1e0000                   je         0x7f95943c3da4
02b36 488bf7                         mov        rsi, rdi
02b39 48bbd8be6e8c957f0000           movabs     rbx, 0x7f958c6ebed8
02b43 8b36                           mov        esi, dword ptr [rsi]
02b45 c1ee0d                         shr        esi, 0xd
02b48 48c1e60a                       shl        rsi, 0xa
02b4c 41ba00000054                   mov        r10d, 0x54000000
02b52 4903f2                         add        rsi, r10
02b55 41ba16000000                   mov        r10d, 0x16
02b5b 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02b5f 7436                           je         0x7f95943c1f17
02b61 4983c202                       add        r10, 2
02b65 4983fa1a                       cmp        r10, 0x1a
02b69 75f0                           jne        0x7f95943c1edb
02b6b 41ba16000000                   mov        r10d, 0x16
02b71 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02b76 7412                           je         0x7f95943c1f0a
02b78 4983c202                       add        r10, 2
02b7c 4983fa1a                       cmp        r10, 0x1a
02b80 75ef                           jne        0x7f95943c1ef1
02b82 41ba15000000                   mov        r10d, 0x15
02b88 eb11                           jmp        0x7f95943c1f1b
02b8a 50                             push       rax
02b8b 4833c0                         xor        rax, rax
02b8e f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02b94 58                             pop        rax
02b95 ebbe                           jmp        0x7f95943c1ed5
02b97 4983c201                       add        r10, 1
02b9b 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02ba0 488bf7                         mov        rsi, rdi
02ba3 6690                           nop        
02ba5 48b8b0ca1e70957f0000           movabs     rax, 0x7f95701ecab0
02baf e82c945307                     call       0x7f959b8fb360
02bb4 0f1f8400ac2c000f               nop        dword ptr [rax + rax + 0xf002cac]
02bbc 48bed8be6e8c957f0000           movabs     rsi, 0x7f958c6ebed8
02bc6 488386d800000001               add        qword ptr [rsi + 0xd8], 1
02bce 48be88a46e8c957f0000           movabs     rsi, 0x7f958c6ea488
02bd8 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
02bdb 83c702                         add        edi, 2
02bde 897e70                         mov        dword ptr [rsi + 0x70], edi
02be1 81e7feff1f00                   and        edi, 0x1ffffe
02be7 85ff                           test       edi, edi
02be9 0f84561e0000                   je         0x7f95943c3dc5
02bef 448bac24e8010000               mov        r13d, dword ptr [rsp + 0x1e8]
02bf7 8bbc24ec010000                 mov        edi, dword ptr [rsp + 0x1ec]
02bfe 48be88a46e8c957f0000           movabs     rsi, 0x7f958c6ea488
02c08 4883860801000001               add        qword ptr [rsi + 0x108], 1
02c10 ffc8                           dec        eax
02c12 442be8                         sub        r13d, eax
02c15 48be589b6e8c957f0000           movabs     rsi, 0x7f958c6e9b58
02c1f 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
02c22 83c302                         add        ebx, 2
02c25 895e70                         mov        dword ptr [rsi + 0x70], ebx
02c28 81e3feff1f00                   and        ebx, 0x1ffffe
02c2e 85db                           test       ebx, ebx
02c30 0f84301e0000                   je         0x7f95943c3de6
02c36 48be589b6e8c957f0000           movabs     rsi, 0x7f958c6e9b58
02c40 488386a800000001               add        qword ptr [rsi + 0xa8], 1
02c48 48be0000000000000000           movabs     rsi, 0
02c52 be00000000                     mov        esi, 0
02c57 3bfe                           cmp        edi, esi
02c59 0f8c281e0000                   jl         0x7f95943c3e07
02c5f 413bfd                         cmp        edi, r13d
02c62 0f8d2c1e0000                   jge        0x7f95943c3e14
02c68 488bc7                         mov        rax, rdi
02c6b 898424f4010000                 mov        dword ptr [rsp + 0x1f4], eax
02c72 89bc24ec010000                 mov        dword ptr [rsp + 0x1ec], edi
02c79 488bbc24f8010000               mov        rdi, qword ptr [rsp + 0x1f8]
02c81 488bf7                         mov        rsi, rdi
02c84 48b9d8be6e8c957f0000           movabs     rcx, 0x7f958c6ebed8
02c8e 8b36                           mov        esi, dword ptr [rsi]
02c90 c1ee0d                         shr        esi, 0xd
02c93 48c1e60a                       shl        rsi, 0xa
02c97 41ba00000054                   mov        r10d, 0x54000000
02c9d 4903f2                         add        rsi, r10
02ca0 41ba1e000000                   mov        r10d, 0x1e
02ca6 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
02caa 7436                           je         0x7f95943c2062
02cac 4983c202                       add        r10, 2
02cb0 4983fa22                       cmp        r10, 0x22
02cb4 75f0                           jne        0x7f95943c2026
02cb6 41ba1e000000                   mov        r10d, 0x1e
02cbc 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02cc1 7412                           je         0x7f95943c2055
02cc3 4983c202                       add        r10, 2
02cc7 4983fa22                       cmp        r10, 0x22
02ccb 75ef                           jne        0x7f95943c203c
02ccd 41ba1d000000                   mov        r10d, 0x1d
02cd3 eb11                           jmp        0x7f95943c2066
02cd5 50                             push       rax
02cd6 4833c0                         xor        rax, rax
02cd9 f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
02cdf 58                             pop        rax
02ce0 ebbe                           jmp        0x7f95943c2020
02ce2 4983c201                       add        r10, 1
02ce6 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02ceb 488bf7                         mov        rsi, rdi
02cee 0f1f8000000000                 nop        dword ptr [rax]
02cf5 48b8d8ca1e70957f0000           movabs     rax, 0x7f95701ecad8
02cff e8dc925307                     call       0x7f959b8fb360
02d04 0f1f8400fc2d0010               nop        dword ptr [rax + rax + 0x10002dfc]
02d0c 483b00                         cmp        rax, qword ptr [rax]
02d0f 488bf0                         mov        rsi, rax
02d12 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
02d1c 8b36                           mov        esi, dword ptr [rsi]
02d1e c1ee0d                         shr        esi, 0xd
02d21 48c1e60a                       shl        rsi, 0xa
02d25 41ba00000054                   mov        r10d, 0x54000000
02d2b 4903f2                         add        rsi, r10
02d2e 41ba24000000                   mov        r10d, 0x24
02d34 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02d38 7436                           je         0x7f95943c20f0
02d3a 4983c202                       add        r10, 2
02d3e 4983fa28                       cmp        r10, 0x28
02d42 75f0                           jne        0x7f95943c20b4
02d44 41ba24000000                   mov        r10d, 0x24
02d4a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02d4f 7412                           je         0x7f95943c20e3
02d51 4983c202                       add        r10, 2
02d55 4983fa28                       cmp        r10, 0x28
02d59 75ef                           jne        0x7f95943c20ca
02d5b 41ba23000000                   mov        r10d, 0x23
02d61 eb11                           jmp        0x7f95943c20f4
02d63 50                             push       rax
02d64 4833c0                         xor        rax, rax
02d67 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
02d6d 58                             pop        rax
02d6e ebbe                           jmp        0x7f95943c20ae
02d70 4983c201                       add        r10, 1
02d74 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02d79 8b7024                         mov        esi, dword ptr [rax + 0x24]
02d7c 488bd0                         mov        rdx, rax
02d7f 48b9d8be6e8c957f0000           movabs     rcx, 0x7f958c6ebed8
02d89 8b12                           mov        edx, dword ptr [rdx]
02d8b c1ea0d                         shr        edx, 0xd
02d8e 48c1e20a                       shl        rdx, 0xa
02d92 41ba00000054                   mov        r10d, 0x54000000
02d98 4903d2                         add        rdx, r10
02d9b 41ba2a000000                   mov        r10d, 0x2a
02da1 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02da5 7436                           je         0x7f95943c215d
02da7 4983c202                       add        r10, 2
02dab 4983fa2e                       cmp        r10, 0x2e
02daf 75f0                           jne        0x7f95943c2121
02db1 41ba2a000000                   mov        r10d, 0x2a
02db7 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02dbc 7412                           je         0x7f95943c2150
02dbe 4983c202                       add        r10, 2
02dc2 4983fa2e                       cmp        r10, 0x2e
02dc6 75ef                           jne        0x7f95943c2137
02dc8 41ba29000000                   mov        r10d, 0x29
02dce eb11                           jmp        0x7f95943c2161
02dd0 50                             push       rax
02dd1 4833c0                         xor        rax, rax
02dd4 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02dda 58                             pop        rax
02ddb ebbe                           jmp        0x7f95943c211b
02ddd 4983c201                       add        r10, 1
02de1 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02de6 8b4804                         mov        ecx, dword ptr [rax + 4]
02de9 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
02df3 4883827801000001               add        qword ptr [rdx + 0x178], 1
02dfb 48bac0a66e8c957f0000           movabs     rdx, 0x7f958c6ea6c0
02e05 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02e09 4183c002                       add        r8d, 2
02e0d 44894270                       mov        dword ptr [rdx + 0x70], r8d
02e11 4181e0feff1f00                 and        r8d, 0x1ffffe
02e18 4585c0                         test       r8d, r8d
02e1b 0f84851c0000                   je         0x7f95943c3e26
02e21 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
02e2b 4883828801000001               add        qword ptr [rdx + 0x188], 1
02e33 8b8424f4010000                 mov        eax, dword ptr [rsp + 0x1f4]
02e3a 4863c0                         movsxd     rax, eax
02e3d ba08000000                     mov        edx, 8
02e42 4c8bc8                         mov        r9, rax
02e45 4c03ca                         add        r9, rdx
02e48 48ba108a6e8c957f0000           movabs     rdx, 0x7f958c6e8a10
02e52 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02e56 4183c002                       add        r8d, 2
02e5a 44894270                       mov        dword ptr [rdx + 0x70], r8d
02e5e 4181e0feff1f00                 and        r8d, 0x1ffffe
02e65 4585c0                         test       r8d, r8d
02e68 0f84591c0000                   je         0x7f95943c3e47
02e6e 48ba108a6e8c957f0000           movabs     rdx, 0x7f958c6e8a10
02e78 488382d800000001               add        qword ptr [rdx + 0xd8], 1
02e80 48ba888b6e8c957f0000           movabs     rdx, 0x7f958c6e8b88
02e8a 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02e8e 4183c002                       add        r8d, 2
02e92 44894270                       mov        dword ptr [rdx + 0x70], r8d
02e96 4181e0feff1f00                 and        r8d, 0x1ffffe
02e9d 4585c0                         test       r8d, r8d
02ea0 0f84421c0000                   je         0x7f95943c3e68
02ea6 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
02eb0 488d9298010000                 lea        rdx, [rdx + 0x198]
02eb7 49b8980a74e200000000           movabs     r8, 0xe2740a98
02ec1 49b800b8165400000000           movabs     r8, 0x5416b800
02ecb 4d8bd0                         mov        r10, r8
02ece 4c3302                         xor        r8, qword ptr [rdx]
02ed1 49f7c0fcffffff                 test       r8, -4
02ed8 7427                           je         0x7f95943c2281
02eda 41f6c002                       test       r8b, 2
02ede 7521                           jne        0x7f95943c2281
02ee0 48f702feffffff                 test       qword ptr [rdx], -2
02ee7 7415                           je         0x7f95943c227e
02ee9 4d8bc2                         mov        r8, r10
02eec 4c3302                         xor        r8, qword ptr [rdx]
02eef 49f7c0fcffffff                 test       r8, -4
02ef6 7409                           je         0x7f95943c2281
02ef8 48830a02                       or         qword ptr [rdx], 2
02efc eb03                           jmp        0x7f95943c2281
02efe 4c8902                         mov        qword ptr [rdx], r8
02f01 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
02f0b 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
02f13 ba02000000                     mov        edx, 2
02f18 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
02f20 bf00000000                     mov        edi, 0
02f25 488b9c24f8010000               mov        rbx, qword ptr [rsp + 0x1f8]
02f2d 48891c24                       mov        qword ptr [rsp], rbx
02f31 488b9c2438010000               mov        rbx, qword ptr [rsp + 0x138]
02f39 48895c2408                     mov        qword ptr [rsp + 8], rbx
02f3e 4889442410                     mov        qword ptr [rsp + 0x10], rax
02f43 49ba980a74e200000000           movabs     r10, 0xe2740a98
02f4d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02f52 0f1f440000                     nop        dword ptr [rax + rax]
02f57 e884955307                     call       0x7f959b8fb860
02f5c 0f1f840054300011               nop        dword ptr [rax + rax + 0x11003054]
02f64 8b8424ec010000                 mov        eax, dword ptr [rsp + 0x1ec]
02f6b 83c010                         add        eax, 0x10
02f6e 8bbc24e4010000                 mov        edi, dword ptr [rsp + 0x1e4]
02f75 83c710                         add        edi, 0x10
02f78 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02f7f ba02000000                     mov        edx, 2
02f84 7c05                           jl         0x7f95943c230b
02f86 ba00000000                     mov        edx, 0
02f8b 48b9d8ab708c957f0000           movabs     rcx, 0x7f958c70abd8
02f95 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
02f99 4403c2                         add        r8d, edx
02f9c 44894174                       mov        dword ptr [rcx + 0x74], r8d
02fa0 85d2                           test       edx, edx
02fa2 7506                           jne        0x7f95943c232a
02fa4 41b802000000                   mov        r8d, 2
02faa 4181e0fe3f0000                 and        r8d, 0x3ffe
02fb1 4585c0                         test       r8d, r8d
02fb4 0f844f1b0000                   je         0x7f95943c3e89
02fba 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02fbe 418502                         test       dword ptr [r10], eax
02fc1 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02fc8 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
02fd2 b940070000                     mov        ecx, 0x740
02fd7 7c05                           jl         0x7f95943c235e
02fd9 b950070000                     mov        ecx, 0x750
02fde 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
02fe2 4d8d4001                       lea        r8, [r8 + 1]
02fe6 4c89040a                       mov        qword ptr [rdx + rcx], r8
02fea 0f8c30f4ffff                   jl         0x7f95943c17a0
02ff0 8b9c24f0010000                 mov        ebx, dword ptr [rsp + 0x1f0]
02ff7 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
03001 ff8260070000                   inc        dword ptr [rdx + 0x760]
03007 e9ba0d0000                     jmp        0x7f95943c3146
0300c 4183f908                       cmp        r9d, 8
03010 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
0301a b978070000                     mov        ecx, 0x778
0301f 7c05                           jl         0x7f95943c23a6
03021 b988070000                     mov        ecx, 0x788
03026 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0302a 4d8d4001                       lea        r8, [r8 + 1]
0302e 4c89040a                       mov        qword ptr [rdx + rcx], r8
03032 0f8cfe010000                   jl         0x7f95943c25b6
03038 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
0303f 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
03046 899c2408020000                 mov        dword ptr [rsp + 0x208], ebx
0304d 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
03054 0f1f4000                       nop        dword ptr [rax]
03058 89842400020000                 mov        dword ptr [rsp + 0x200], eax
0305f 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03067 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
03071 4883829807000001               add        qword ptr [rdx + 0x798], 1
03079 48ba7871708c957f0000           movabs     rdx, 0x7f958c707178
03083 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03086 83c102                         add        ecx, 2
03089 894a70                         mov        dword ptr [rdx + 0x70], ecx
0308c 81e1feff1f00                   and        ecx, 0x1ffffe
03092 85c9                           test       ecx, ecx
03094 0f84901a0000                   je         0x7f95943c3eaa
0309a 660f1f440000                   nop        word ptr [rax + rax]
030a0 e9b51a0000                     jmp        0x7f95943c3eda
030a5 90                             nop        
030a6 90                             nop        
030a7 90                             nop        
030a8 90                             nop        
030a9 90                             nop        
030aa 48ba7871708c957f0000           movabs     rdx, 0x7f958c707178
030b4 488d92d8000000                 lea        rdx, [rdx + 0xd8]
030bb 4885c0                         test       rax, rax
030be 750c                           jne        0x7f95943c244c
030c0 f6420801                       test       byte ptr [rdx + 8], 1
030c4 7506                           jne        0x7f95943c244c
030c6 f048834a0801                   lock or    qword ptr [rdx + 8], 1
030cc 48be50c66fe200000000           movabs     rsi, 0xe26fc650
030d6 488bd6                         mov        rdx, rsi
030d9 48b97871708c957f0000           movabs     rcx, 0x7f958c707178
030e3 8b12                           mov        edx, dword ptr [rdx]
030e5 c1ea0d                         shr        edx, 0xd
030e8 48c1e20a                       shl        rdx, 0xa
030ec 41ba00000054                   mov        r10d, 0x54000000
030f2 4903d2                         add        rdx, r10
030f5 41ba16000000                   mov        r10d, 0x16
030fb 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
030ff 7436                           je         0x7f95943c24b7
03101 4983c202                       add        r10, 2
03105 4983fa1a                       cmp        r10, 0x1a
03109 75f0                           jne        0x7f95943c247b
0310b 41ba16000000                   mov        r10d, 0x16
03111 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03116 7412                           je         0x7f95943c24aa
03118 4983c202                       add        r10, 2
0311c 4983fa1a                       cmp        r10, 0x1a
03120 75ef                           jne        0x7f95943c2491
03122 41ba15000000                   mov        r10d, 0x15
03128 eb11                           jmp        0x7f95943c24bb
0312a 50                             push       rax
0312b 4833c0                         xor        rax, rax
0312e f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03134 58                             pop        rax
03135 ebbe                           jmp        0x7f95943c2475
03137 4983c201                       add        r10, 1
0313b 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03140 488bd0                         mov        rdx, rax
03143 488bcf                         mov        rcx, rdi
03146 89bc2404020000                 mov        dword ptr [rsp + 0x204], edi
0314d 6690                           nop        
0314f e88c895307                     call       0x7f959b8fae60
03154 0f1f84004c320013               nop        dword ptr [rax + rax + 0x1300324c]
0315c 48bed8ab708c957f0000           movabs     rsi, 0x7f958c70abd8
03166 488386a807000001               add        qword ptr [rsi + 0x7a8], 1
0316e 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
03176 8b942400020000                 mov        edx, dword ptr [rsp + 0x200]
0317d 488bc8                         mov        rcx, rax
03180 0f1f8000000000                 nop        dword ptr [rax]
03187 e854935307                     call       0x7f959b8fb860
0318c 0f1f840084320014               nop        dword ptr [rax + rax + 0x14003284]
03194 8b842400020000                 mov        eax, dword ptr [rsp + 0x200]
0319b 83c008                         add        eax, 8
0319e 8bbc2404020000                 mov        edi, dword ptr [rsp + 0x204]
031a5 83c708                         add        edi, 8
031a8 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
031af be02000000                     mov        esi, 2
031b4 7c05                           jl         0x7f95943c253b
031b6 be00000000                     mov        esi, 0
031bb 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
031c5 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
031c8 03ce                           add        ecx, esi
031ca 894a74                         mov        dword ptr [rdx + 0x74], ecx
031cd 85f6                           test       esi, esi
031cf 7505                           jne        0x7f95943c2556
031d1 b902000000                     mov        ecx, 2
031d6 81e1fe3f0000                   and        ecx, 0x3ffe
031dc 85c9                           test       ecx, ecx
031de 0f8480190000                   je         0x7f95943c3ee4
031e4 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
031e8 418502                         test       dword ptr [r10], eax
031eb 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
031f2 48bed8ab708c957f0000           movabs     rsi, 0x7f958c70abd8
031fc bab8070000                     mov        edx, 0x7b8
03201 7c05                           jl         0x7f95943c2588
03203 bac8070000                     mov        edx, 0x7c8
03208 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0320c 488d4901                       lea        rcx, [rcx + 1]
03210 48890c16                       mov        qword ptr [rsi + rdx], rcx
03214 0f8c3efeffff                   jl         0x7f95943c23d8
0321a 8b9c2408020000                 mov        ebx, dword ptr [rsp + 0x208]
03221 48bed8ab708c957f0000           movabs     rsi, 0x7f958c70abd8
0322b ff86d8070000                   inc        dword ptr [rsi + 0x7d8]
03231 e9900b0000                     jmp        0x7f95943c3146
03236 48bed8ab708c957f0000           movabs     rsi, 0x7f958c70abd8
03240 488386f007000001               add        qword ptr [rsi + 0x7f0], 1
03248 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
03250 8b9424d0010000                 mov        edx, dword ptr [rsp + 0x1d0]
03257 488bcf                         mov        rcx, rdi
0325a 4d8bc1                         mov        r8, r9
0325d 448b8c2478010000               mov        r9d, dword ptr [rsp + 0x178]
03265 6690                           nop        
03267 e874925307                     call       0x7f959b8fb860
0326c 0f1f840064330016               nop        dword ptr [rax + rax + 0x16003364]
03274 488bd8                         mov        rbx, rax
03277 e94a0b0000                     jmp        0x7f95943c3146
0327c 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
03283 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
0328a 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03292 48bed8ab708c957f0000           movabs     rsi, 0x7f958c70abd8
0329c 488386c805000001               add        qword ptr [rsi + 0x5c8], 1
032a4 48be68b86e8c957f0000           movabs     rsi, 0x7f958c6eb868
032ae 8b5670                         mov        edx, dword ptr [rsi + 0x70]
032b1 83c202                         add        edx, 2
032b4 895670                         mov        dword ptr [rsi + 0x70], edx
032b7 81e2feff1f00                   and        edx, 0x1ffffe
032bd 85d2                           test       edx, edx
032bf 0f84c0180000                   je         0x7f95943c3f05
032c5 48bee89372e200000000           movabs     rsi, 0xe27293e8
032cf 48ba68b86e8c957f0000           movabs     rdx, 0x7f958c6eb868
032d9 8b36                           mov        esi, dword ptr [rsi]
032db c1ee0d                         shr        esi, 0xd
032de 48c1e60a                       shl        rsi, 0xa
032e2 41ba00000054                   mov        r10d, 0x54000000
032e8 4903f2                         add        rsi, r10
032eb 41ba16000000                   mov        r10d, 0x16
032f1 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
032f5 7436                           je         0x7f95943c26ad
032f7 4983c202                       add        r10, 2
032fb 4983fa1a                       cmp        r10, 0x1a
032ff 75f0                           jne        0x7f95943c2671
03301 41ba16000000                   mov        r10d, 0x16
03307 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
0330c 7412                           je         0x7f95943c26a0
0330e 4983c202                       add        r10, 2
03312 4983fa1a                       cmp        r10, 0x1a
03316 75ef                           jne        0x7f95943c2687
03318 41ba15000000                   mov        r10d, 0x15
0331e eb11                           jmp        0x7f95943c26b1
03320 50                             push       rax
03321 4833c0                         xor        rax, rax
03324 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
0332a 58                             pop        rax
0332b ebbe                           jmp        0x7f95943c266b
0332d 4983c201                       add        r10, 1
03331 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03336 8b5804                         mov        ebx, dword ptr [rax + 4]
03339 48be68b86e8c957f0000           movabs     rsi, 0x7f958c6eb868
03343 488386d800000001               add        qword ptr [rsi + 0xd8], 1
0334b 48be88a46e8c957f0000           movabs     rsi, 0x7f958c6ea488
03355 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03358 83c202                         add        edx, 2
0335b 895670                         mov        dword ptr [rsi + 0x70], edx
0335e 81e2feff1f00                   and        edx, 0x1ffffe
03364 85d2                           test       edx, edx
03366 0f843f180000                   je         0x7f95943c3f2b
0336c 48be88a46e8c957f0000           movabs     rsi, 0x7f958c6ea488
03376 4883860801000001               add        qword ptr [rsi + 0x108], 1
0337e 488bf3                         mov        rsi, rbx
03381 83ee0f                         sub        esi, 0xf
03384 48ba589b6e8c957f0000           movabs     rdx, 0x7f958c6e9b58
0338e 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03391 83c102                         add        ecx, 2
03394 894a70                         mov        dword ptr [rdx + 0x70], ecx
03397 81e1feff1f00                   and        ecx, 0x1ffffe
0339d 85c9                           test       ecx, ecx
0339f 0f8427180000                   je         0x7f95943c3f4c
033a5 48ba589b6e8c957f0000           movabs     rdx, 0x7f958c6e9b58
033af 488382a800000001               add        qword ptr [rdx + 0xa8], 1
033b7 48ba0000000000000000           movabs     rdx, 0
033c1 ba00000000                     mov        edx, 0
033c6 3bfa                           cmp        edi, edx
033c8 0f8c1f180000                   jl         0x7f95943c3f6d
033ce 3bfe                           cmp        edi, esi
033d0 0f8d24180000                   jge        0x7f95943c3f7a
033d6 48bee89372e200000000           movabs     rsi, 0xe27293e8
033e0 488bd6                         mov        rdx, rsi
033e3 48b968b86e8c957f0000           movabs     rcx, 0x7f958c6eb868
033ed 8b12                           mov        edx, dword ptr [rdx]
033ef c1ea0d                         shr        edx, 0xd
033f2 48c1e20a                       shl        rdx, 0xa
033f6 41ba00000054                   mov        r10d, 0x54000000
033fc 4903d2                         add        rdx, r10
033ff 41ba24000000                   mov        r10d, 0x24
03405 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03409 7436                           je         0x7f95943c27c1
0340b 4983c202                       add        r10, 2
0340f 4983fa28                       cmp        r10, 0x28
03413 75f0                           jne        0x7f95943c2785
03415 41ba24000000                   mov        r10d, 0x24
0341b 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03420 7412                           je         0x7f95943c27b4
03422 4983c202                       add        r10, 2
03426 4983fa28                       cmp        r10, 0x28
0342a 75ef                           jne        0x7f95943c279b
0342c 41ba23000000                   mov        r10d, 0x23
03432 eb11                           jmp        0x7f95943c27c5
03434 50                             push       rax
03435 4833c0                         xor        rax, rax
03438 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
0343e 58                             pop        rax
0343f ebbe                           jmp        0x7f95943c277f
03441 4983c201                       add        r10, 1
03445 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0344a 48ba589c6e8c957f0000           movabs     rdx, 0x7f958c6e9c58
03454 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03457 83c102                         add        ecx, 2
0345a 894a70                         mov        dword ptr [rdx + 0x70], ecx
0345d 81e1feff1f00                   and        ecx, 0x1ffffe
03463 85c9                           test       ecx, ecx
03465 0f849c170000                   je         0x7f95943c3f87
0346b 48ba589c6e8c957f0000           movabs     rdx, 0x7f958c6e9c58
03475 488382a800000001               add        qword ptr [rdx + 0xa8], 1
0347d 48be809d6e8c957f0000           movabs     rsi, 0x7f958c6e9d80
03487 8b5670                         mov        edx, dword ptr [rsi + 0x70]
0348a 83c202                         add        edx, 2
0348d 895670                         mov        dword ptr [rsi + 0x70], edx
03490 81e2feff1f00                   and        edx, 0x1ffffe
03496 85d2                           test       edx, edx
03498 0f848a170000                   je         0x7f95943c3fa8
0349e 48be809d6e8c957f0000           movabs     rsi, 0x7f958c6e9d80
034a8 ff86b8000000                   inc        dword ptr [rsi + 0xb8]
034ae 899c240c020000                 mov        dword ptr [rsp + 0x20c], ebx
034b5 48bee01373e200000000           movabs     rsi, 0xe27313e0
034bf 488bd6                         mov        rdx, rsi
034c2 48b968b86e8c957f0000           movabs     rcx, 0x7f958c6eb868
034cc 48ba0050165400000000           movabs     rdx, 0x54165000
034d6 41ba2a000000                   mov        r10d, 0x2a
034dc 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
034e0 7436                           je         0x7f95943c2898
034e2 4983c202                       add        r10, 2
034e6 4983fa2e                       cmp        r10, 0x2e
034ea 75f0                           jne        0x7f95943c285c
034ec 41ba2a000000                   mov        r10d, 0x2a
034f2 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
034f7 7412                           je         0x7f95943c288b
034f9 4983c202                       add        r10, 2
034fd 4983fa2e                       cmp        r10, 0x2e
03501 75ef                           jne        0x7f95943c2872
03503 41ba29000000                   mov        r10d, 0x29
03509 eb11                           jmp        0x7f95943c289c
0350b 50                             push       rax
0350c 4833c0                         xor        rax, rax
0350f f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03515 58                             pop        rax
03516 ebbe                           jmp        0x7f95943c2856
03518 4983c201                       add        r10, 1
0351c 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03521 48ba30ba6e8c957f0000           movabs     rdx, 0x7f958c6eba30
0352b 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0352e 83c102                         add        ecx, 2
03531 894a70                         mov        dword ptr [rdx + 0x70], ecx
03534 81e1feff1f00                   and        ecx, 0x1ffffe
0353a 85c9                           test       ecx, ecx
0353c 0f8407170000                   je         0x7f95943c3fc9
03542 488bd6                         mov        rdx, rsi
03545 48b930ba6e8c957f0000           movabs     rcx, 0x7f958c6eba30
0354f 488381a800000001               add        qword ptr [rcx + 0xa8], 1
03557 48ba10bb6e8c957f0000           movabs     rdx, 0x7f958c6ebb10
03561 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03564 83c102                         add        ecx, 2
03567 894a70                         mov        dword ptr [rdx + 0x70], ecx
0356a 81e1feff1f00                   and        ecx, 0x1ffffe
03570 85c9                           test       ecx, ecx
03572 0f84f2160000                   je         0x7f95943c3fea
03578 48ba10bb6e8c957f0000           movabs     rdx, 0x7f958c6ebb10
03582 48be0050165400000000           movabs     rsi, 0x54165000
0358c 41ba16000000                   mov        r10d, 0x16
03592 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03596 7436                           je         0x7f95943c294e
03598 4983c202                       add        r10, 2
0359c 4983fa1a                       cmp        r10, 0x1a
035a0 75f0                           jne        0x7f95943c2912
035a2 41ba16000000                   mov        r10d, 0x16
035a8 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
035ad 7412                           je         0x7f95943c2941
035af 4983c202                       add        r10, 2
035b3 4983fa1a                       cmp        r10, 0x1a
035b7 75ef                           jne        0x7f95943c2928
035b9 41ba15000000                   mov        r10d, 0x15
035bf eb11                           jmp        0x7f95943c2952
035c1 50                             push       rax
035c2 4833c0                         xor        rax, rax
035c5 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
035cb 58                             pop        rax
035cc ebbe                           jmp        0x7f95943c290c
035ce 4983c201                       add        r10, 1
035d2 4a8304d201                     add        qword ptr [rdx + r10*8], 1
035d7 48be00a66e8c957f0000           movabs     rsi, 0x7f958c6ea600
035e1 8b5670                         mov        edx, dword ptr [rsi + 0x70]
035e4 83c202                         add        edx, 2
035e7 895670                         mov        dword ptr [rsi + 0x70], edx
035ea 81e2feff1f00                   and        edx, 0x1ffffe
035f0 85d2                           test       edx, edx
035f2 0f8493160000                   je         0x7f95943c400b
035f8 48bee89372e200000000           movabs     rsi, 0xe27293e8
03602 488bd6                         mov        rdx, rsi
03605 48b910bb6e8c957f0000           movabs     rcx, 0x7f958c6ebb10
0360f 8b12                           mov        edx, dword ptr [rdx]
03611 c1ea0d                         shr        edx, 0xd
03614 48c1e20a                       shl        rdx, 0xa
03618 41ba00000054                   mov        r10d, 0x54000000
0361e 4903d2                         add        rdx, r10
03621 41ba1c000000                   mov        r10d, 0x1c
03627 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0362b 7436                           je         0x7f95943c29e3
0362d 4983c202                       add        r10, 2
03631 4983fa20                       cmp        r10, 0x20
03635 75f0                           jne        0x7f95943c29a7
03637 41ba1c000000                   mov        r10d, 0x1c
0363d 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03642 7412                           je         0x7f95943c29d6
03644 4983c202                       add        r10, 2
03648 4983fa20                       cmp        r10, 0x20
0364c 75ef                           jne        0x7f95943c29bd
0364e 41ba1b000000                   mov        r10d, 0x1b
03654 eb11                           jmp        0x7f95943c29e7
03656 50                             push       rax
03657 4833c0                         xor        rax, rax
0365a f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03660 58                             pop        rax
03661 ebbe                           jmp        0x7f95943c29a1
03663 4983c201                       add        r10, 1
03667 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0366c 48ba10bb6e8c957f0000           movabs     rdx, 0x7f958c6ebb10
03676 8b36                           mov        esi, dword ptr [rsi]
03678 c1ee0d                         shr        esi, 0xd
0367b 48c1e60a                       shl        rsi, 0xa
0367f 41ba00000054                   mov        r10d, 0x54000000
03685 4903f2                         add        rsi, r10
03688 41ba22000000                   mov        r10d, 0x22
0368e 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03692 7436                           je         0x7f95943c2a4a
03694 4983c202                       add        r10, 2
03698 4983fa26                       cmp        r10, 0x26
0369c 75f0                           jne        0x7f95943c2a0e
0369e 41ba22000000                   mov        r10d, 0x22
036a4 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
036a9 7412                           je         0x7f95943c2a3d
036ab 4983c202                       add        r10, 2
036af 4983fa26                       cmp        r10, 0x26
036b3 75ef                           jne        0x7f95943c2a24
036b5 41ba21000000                   mov        r10d, 0x21
036bb eb11                           jmp        0x7f95943c2a4e
036bd 50                             push       rax
036be 4833c0                         xor        rax, rax
036c1 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
036c7 58                             pop        rax
036c8 ebbe                           jmp        0x7f95943c2a08
036ca 4983c201                       add        r10, 1
036ce 4a8304d201                     add        qword ptr [rdx + r10*8], 1
036d3 48be10bb6e8c957f0000           movabs     rsi, 0x7f958c6ebb10
036dd 4883863801000001               add        qword ptr [rsi + 0x138], 1
036e5 48bec0a66e8c957f0000           movabs     rsi, 0x7f958c6ea6c0
036ef 8b5670                         mov        edx, dword ptr [rsi + 0x70]
036f2 83c202                         add        edx, 2
036f5 895670                         mov        dword ptr [rsi + 0x70], edx
036f8 81e2feff1f00                   and        edx, 0x1ffffe
036fe 85d2                           test       edx, edx
03700 0f84a6150000                   je         0x7f95943c402c
03706 48be10bb6e8c957f0000           movabs     rsi, 0x7f958c6ebb10
03710 4883864801000001               add        qword ptr [rsi + 0x148], 1
03718 4c63df                         movsxd     r11, edi
0371b be08000000                     mov        esi, 8
03720 4d8bcb                         mov        r9, r11
03723 4c03ce                         add        r9, rsi
03726 48be108a6e8c957f0000           movabs     rsi, 0x7f958c6e8a10
03730 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03733 83c202                         add        edx, 2
03736 895670                         mov        dword ptr [rsi + 0x70], edx
03739 81e2feff1f00                   and        edx, 0x1ffffe
0373f 85d2                           test       edx, edx
03741 0f8486150000                   je         0x7f95943c404d
03747 48be108a6e8c957f0000           movabs     rsi, 0x7f958c6e8a10
03751 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03759 48be888b6e8c957f0000           movabs     rsi, 0x7f958c6e8b88
03763 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03766 83c202                         add        edx, 2
03769 895670                         mov        dword ptr [rsi + 0x70], edx
0376c 81e2feff1f00                   and        edx, 0x1ffffe
03772 85d2                           test       edx, edx
03774 0f8474150000                   je         0x7f95943c406e
0377a 48be10bb6e8c957f0000           movabs     rsi, 0x7f958c6ebb10
03784 488db658010000                 lea        rsi, [rsi + 0x158]
0378b 48bab06c73e200000000           movabs     rdx, 0xe2736cb0
03795 48ba00a8165400000000           movabs     rdx, 0x5416a800
0379f 4c8bd2                         mov        r10, rdx
037a2 483316                         xor        rdx, qword ptr [rsi]
037a5 48f7c2fcffffff                 test       rdx, -4
037ac 7426                           je         0x7f95943c2b54
037ae f6c202                         test       dl, 2
037b1 7521                           jne        0x7f95943c2b54
037b3 48f706feffffff                 test       qword ptr [rsi], -2
037ba 7415                           je         0x7f95943c2b51
037bc 498bd2                         mov        rdx, r10
037bf 483316                         xor        rdx, qword ptr [rsi]
037c2 48f7c2fcffffff                 test       rdx, -4
037c9 7409                           je         0x7f95943c2b54
037cb 48830e02                       or         qword ptr [rsi], 2
037cf eb03                           jmp        0x7f95943c2b54
037d1 488916                         mov        qword ptr [rsi], rdx
037d4 48be10bb6e8c957f0000           movabs     rsi, 0x7f958c6ebb10
037de 4883866801000001               add        qword ptr [rsi + 0x168], 1
037e6 48be309472e200000000           movabs     rsi, 0xe2729430
037f0 ba02000000                     mov        edx, 2
037f5 b910000000                     mov        ecx, 0x10
037fa 4c8bc0                         mov        r8, rax
037fd bf00000000                     mov        edi, 0
03802 48890424                       mov        qword ptr [rsp], rax
03806 4c895c2408                     mov        qword ptr [rsp + 8], r11
0380b 49bae89372e200000000           movabs     r10, 0xe27293e8
03815 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0381a 49bab06c73e200000000           movabs     r10, 0xe2736cb0
03824 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03829 660f1f440000                   nop        word ptr [rax + rax]
0382f e8ac8c5307                     call       0x7f959b8fb860
03834 0f1f84002c390017               nop        dword ptr [rax + rax + 0x1700392c]
0383c 4885c0                         test       rax, rax
0383f 48bb10bb6e8c957f0000           movabs     rbx, 0x7f958c6ebb10
03849 750c                           jne        0x7f95943c2bd7
0384b 808b7101000001                 or         byte ptr [rbx + 0x171], 1
03852 e988000000                     jmp        0x7f95943c2c5f
03857 8b38                           mov        edi, dword ptr [rax]
03859 c1ef0d                         shr        edi, 0xd
0385c 48c1e70a                       shl        rdi, 0xa
03860 41ba00000054                   mov        r10d, 0x54000000
03866 4903fa                         add        rdi, r10
03869 41ba30000000                   mov        r10d, 0x30
0386f 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
03873 7436                           je         0x7f95943c2c2b
03875 4983c202                       add        r10, 2
03879 4983fa34                       cmp        r10, 0x34
0387d 75f0                           jne        0x7f95943c2bef
0387f 41ba30000000                   mov        r10d, 0x30
03885 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0388a 7412                           je         0x7f95943c2c1e
0388c 4983c202                       add        r10, 2
03890 4983fa34                       cmp        r10, 0x34
03894 75ef                           jne        0x7f95943c2c05
03896 41ba2f000000                   mov        r10d, 0x2f
0389c eb11                           jmp        0x7f95943c2c2f
0389e 50                             push       rax
0389f 4833c0                         xor        rax, rax
038a2 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
038a8 58                             pop        rax
038a9 ebbe                           jmp        0x7f95943c2be9
038ab 4983c201                       add        r10, 1
038af 4a8304d301                     add        qword ptr [rbx + r10*8], 1
038b4 48bf00b0145400000000           movabs     rdi, 0x5414b000
038be 8b18                           mov        ebx, dword ptr [rax]
038c0 c1eb0d                         shr        ebx, 0xd
038c3 48c1e30a                       shl        rbx, 0xa
038c7 41ba00000054                   mov        r10d, 0x54000000
038cd 4903da                         add        rbx, r10
038d0 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
038d4 0f8535140000                   jne        0x7f95943c408f
038da e900000000                     jmp        0x7f95943c2c5f
038df 488bf8                         mov        rdi, rax
038e2 4889bc2410020000               mov        qword ptr [rsp + 0x210], rdi
038ea 483b07                         cmp        rax, qword ptr [rdi]
038ed 488bf7                         mov        rsi, rdi
038f0 48bbd8ab708c957f0000           movabs     rbx, 0x7f958c70abd8
038fa 8b36                           mov        esi, dword ptr [rsi]
038fc c1ee0d                         shr        esi, 0xd
038ff 48c1e60a                       shl        rsi, 0xa
03903 41ba00000054                   mov        r10d, 0x54000000
03909 4903f2                         add        rsi, r10
0390c 41babc000000                   mov        r10d, 0xbc
03912 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03916 743c                           je         0x7f95943c2cd4
03918 4983c202                       add        r10, 2
0391c 4981fac0000000                 cmp        r10, 0xc0
03923 75ed                           jne        0x7f95943c2c92
03925 41babc000000                   mov        r10d, 0xbc
0392b 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03930 7415                           je         0x7f95943c2cc7
03932 4983c202                       add        r10, 2
03936 4981fac0000000                 cmp        r10, 0xc0
0393d 75ec                           jne        0x7f95943c2cab
0393f 41babb000000                   mov        r10d, 0xbb
03945 eb11                           jmp        0x7f95943c2cd8
03947 50                             push       rax
03948 4833c0                         xor        rax, rax
0394b f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
03951 58                             pop        rax
03952 ebb8                           jmp        0x7f95943c2c8c
03954 4983c201                       add        r10, 1
03958 4a8304d301                     add        qword ptr [rbx + r10*8], 1
0395d 48bed8be6e8c957f0000           movabs     rsi, 0x7f958c6ebed8
03967 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
0396a 83c302                         add        ebx, 2
0396d 895e70                         mov        dword ptr [rsi + 0x70], ebx
03970 81e3feff1f00                   and        ebx, 0x1ffffe
03976 85db                           test       ebx, ebx
03978 0f849f130000                   je         0x7f95943c409d
0397e 488bf7                         mov        rsi, rdi
03981 48bbd8be6e8c957f0000           movabs     rbx, 0x7f958c6ebed8
0398b 8b36                           mov        esi, dword ptr [rsi]
0398d c1ee0d                         shr        esi, 0xd
03990 48c1e60a                       shl        rsi, 0xa
03994 41ba00000054                   mov        r10d, 0x54000000
0399a 4903f2                         add        rsi, r10
0399d 41ba16000000                   mov        r10d, 0x16
039a3 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
039a7 7436                           je         0x7f95943c2d5f
039a9 4983c202                       add        r10, 2
039ad 4983fa1a                       cmp        r10, 0x1a
039b1 75f0                           jne        0x7f95943c2d23
039b3 41ba16000000                   mov        r10d, 0x16
039b9 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
039be 7412                           je         0x7f95943c2d52
039c0 4983c202                       add        r10, 2
039c4 4983fa1a                       cmp        r10, 0x1a
039c8 75ef                           jne        0x7f95943c2d39
039ca 41ba15000000                   mov        r10d, 0x15
039d0 eb11                           jmp        0x7f95943c2d63
039d2 50                             push       rax
039d3 4833c0                         xor        rax, rax
039d6 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
039dc 58                             pop        rax
039dd ebbe                           jmp        0x7f95943c2d1d
039df 4983c201                       add        r10, 1
039e3 4a8304d301                     add        qword ptr [rbx + r10*8], 1
039e8 488bf7                         mov        rsi, rdi
039eb 6690                           nop        
039ed 48b800cb1e70957f0000           movabs     rax, 0x7f95701ecb00
039f7 e8e4855307                     call       0x7f959b8fb360
039fc 0f1f8400f43a0018               nop        dword ptr [rax + rax + 0x18003af4]
03a04 48bed8be6e8c957f0000           movabs     rsi, 0x7f958c6ebed8
03a0e 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03a16 48be88a46e8c957f0000           movabs     rsi, 0x7f958c6ea488
03a20 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
03a23 83c702                         add        edi, 2
03a26 897e70                         mov        dword ptr [rsi + 0x70], edi
03a29 81e7feff1f00                   and        edi, 0x1ffffe
03a2f 85ff                           test       edi, edi
03a31 0f8407130000                   je         0x7f95943c40be
03a37 8b9c240c020000                 mov        ebx, dword ptr [rsp + 0x20c]
03a3e 8bbc24d0010000                 mov        edi, dword ptr [rsp + 0x1d0]
03a45 48be88a46e8c957f0000           movabs     rsi, 0x7f958c6ea488
03a4f 4883860801000001               add        qword ptr [rsi + 0x108], 1
03a57 ffc8                           dec        eax
03a59 2bd8                           sub        ebx, eax
03a5b 48be589b6e8c957f0000           movabs     rsi, 0x7f958c6e9b58
03a65 8b4670                         mov        eax, dword ptr [rsi + 0x70]
03a68 83c002                         add        eax, 2
03a6b 894670                         mov        dword ptr [rsi + 0x70], eax
03a6e 25feff1f00                     and        eax, 0x1ffffe
03a73 85c0                           test       eax, eax
03a75 0f84e4120000                   je         0x7f95943c40df
03a7b 48be589b6e8c957f0000           movabs     rsi, 0x7f958c6e9b58
03a85 488386a800000001               add        qword ptr [rsi + 0xa8], 1
03a8d 48be0000000000000000           movabs     rsi, 0
03a97 be00000000                     mov        esi, 0
03a9c 3bfe                           cmp        edi, esi
03a9e 0f8cdc120000                   jl         0x7f95943c4100
03aa4 3bfb                           cmp        edi, ebx
03aa6 0f8de1120000                   jge        0x7f95943c410d
03aac 488bdf                         mov        rbx, rdi
03aaf 899c2418020000                 mov        dword ptr [rsp + 0x218], ebx
03ab6 89bc24d0010000                 mov        dword ptr [rsp + 0x1d0], edi
03abd 488bbc2410020000               mov        rdi, qword ptr [rsp + 0x210]
03ac5 488bf7                         mov        rsi, rdi
03ac8 48b9d8be6e8c957f0000           movabs     rcx, 0x7f958c6ebed8
03ad2 8b36                           mov        esi, dword ptr [rsi]
03ad4 c1ee0d                         shr        esi, 0xd
03ad7 48c1e60a                       shl        rsi, 0xa
03adb 41ba00000054                   mov        r10d, 0x54000000
03ae1 4903f2                         add        rsi, r10
03ae4 41ba1e000000                   mov        r10d, 0x1e
03aea 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
03aee 7436                           je         0x7f95943c2ea6
03af0 4983c202                       add        r10, 2
03af4 4983fa22                       cmp        r10, 0x22
03af8 75f0                           jne        0x7f95943c2e6a
03afa 41ba1e000000                   mov        r10d, 0x1e
03b00 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03b05 7412                           je         0x7f95943c2e99
03b07 4983c202                       add        r10, 2
03b0b 4983fa22                       cmp        r10, 0x22
03b0f 75ef                           jne        0x7f95943c2e80
03b11 41ba1d000000                   mov        r10d, 0x1d
03b17 eb11                           jmp        0x7f95943c2eaa
03b19 50                             push       rax
03b1a 4833c0                         xor        rax, rax
03b1d f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
03b23 58                             pop        rax
03b24 ebbe                           jmp        0x7f95943c2e64
03b26 4983c201                       add        r10, 1
03b2a 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03b2f 488bf7                         mov        rsi, rdi
03b32 666690                         nop        
03b35 48b828cb1e70957f0000           movabs     rax, 0x7f95701ecb28
03b3f e89c845307                     call       0x7f959b8fb360
03b44 0f1f84003c3c0019               nop        dword ptr [rax + rax + 0x19003c3c]
03b4c 483b00                         cmp        rax, qword ptr [rax]
03b4f 488bf0                         mov        rsi, rax
03b52 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
03b5c 8b36                           mov        esi, dword ptr [rsi]
03b5e c1ee0d                         shr        esi, 0xd
03b61 48c1e60a                       shl        rsi, 0xa
03b65 41ba00000054                   mov        r10d, 0x54000000
03b6b 4903f2                         add        rsi, r10
03b6e 41ba24000000                   mov        r10d, 0x24
03b74 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03b78 7436                           je         0x7f95943c2f30
03b7a 4983c202                       add        r10, 2
03b7e 4983fa28                       cmp        r10, 0x28
03b82 75f0                           jne        0x7f95943c2ef4
03b84 41ba24000000                   mov        r10d, 0x24
03b8a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03b8f 7412                           je         0x7f95943c2f23
03b91 4983c202                       add        r10, 2
03b95 4983fa28                       cmp        r10, 0x28
03b99 75ef                           jne        0x7f95943c2f0a
03b9b 41ba23000000                   mov        r10d, 0x23
03ba1 eb11                           jmp        0x7f95943c2f34
03ba3 50                             push       rax
03ba4 4833c0                         xor        rax, rax
03ba7 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03bad 58                             pop        rax
03bae ebbe                           jmp        0x7f95943c2eee
03bb0 4983c201                       add        r10, 1
03bb4 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03bb9 8b7024                         mov        esi, dword ptr [rax + 0x24]
03bbc 488bd0                         mov        rdx, rax
03bbf 48b9d8be6e8c957f0000           movabs     rcx, 0x7f958c6ebed8
03bc9 8b12                           mov        edx, dword ptr [rdx]
03bcb c1ea0d                         shr        edx, 0xd
03bce 48c1e20a                       shl        rdx, 0xa
03bd2 41ba00000054                   mov        r10d, 0x54000000
03bd8 4903d2                         add        rdx, r10
03bdb 41ba2a000000                   mov        r10d, 0x2a
03be1 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03be5 7436                           je         0x7f95943c2f9d
03be7 4983c202                       add        r10, 2
03beb 4983fa2e                       cmp        r10, 0x2e
03bef 75f0                           jne        0x7f95943c2f61
03bf1 41ba2a000000                   mov        r10d, 0x2a
03bf7 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03bfc 7412                           je         0x7f95943c2f90
03bfe 4983c202                       add        r10, 2
03c02 4983fa2e                       cmp        r10, 0x2e
03c06 75ef                           jne        0x7f95943c2f77
03c08 41ba29000000                   mov        r10d, 0x29
03c0e eb11                           jmp        0x7f95943c2fa1
03c10 50                             push       rax
03c11 4833c0                         xor        rax, rax
03c14 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03c1a 58                             pop        rax
03c1b ebbe                           jmp        0x7f95943c2f5b
03c1d 4983c201                       add        r10, 1
03c21 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03c26 8b4804                         mov        ecx, dword ptr [rax + 4]
03c29 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
03c33 4883827801000001               add        qword ptr [rdx + 0x178], 1
03c3b 48bac0a66e8c957f0000           movabs     rdx, 0x7f958c6ea6c0
03c45 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03c49 4183c002                       add        r8d, 2
03c4d 44894270                       mov        dword ptr [rdx + 0x70], r8d
03c51 4181e0feff1f00                 and        r8d, 0x1ffffe
03c58 4585c0                         test       r8d, r8d
03c5b 0f843e110000                   je         0x7f95943c411f
03c61 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
03c6b 4883828801000001               add        qword ptr [rdx + 0x188], 1
03c73 8b9c2418020000                 mov        ebx, dword ptr [rsp + 0x218]
03c7a 4863db                         movsxd     rbx, ebx
03c7d ba08000000                     mov        edx, 8
03c82 4c8bcb                         mov        r9, rbx
03c85 4c03ca                         add        r9, rdx
03c88 48ba108a6e8c957f0000           movabs     rdx, 0x7f958c6e8a10
03c92 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03c96 4183c002                       add        r8d, 2
03c9a 44894270                       mov        dword ptr [rdx + 0x70], r8d
03c9e 4181e0feff1f00                 and        r8d, 0x1ffffe
03ca5 4585c0                         test       r8d, r8d
03ca8 0f8412110000                   je         0x7f95943c4140
03cae 48ba108a6e8c957f0000           movabs     rdx, 0x7f958c6e8a10
03cb8 488382d800000001               add        qword ptr [rdx + 0xd8], 1
03cc0 48ba888b6e8c957f0000           movabs     rdx, 0x7f958c6e8b88
03cca 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03cce 4183c002                       add        r8d, 2
03cd2 44894270                       mov        dword ptr [rdx + 0x70], r8d
03cd6 4181e0feff1f00                 and        r8d, 0x1ffffe
03cdd 4585c0                         test       r8d, r8d
03ce0 0f84fb100000                   je         0x7f95943c4161
03ce6 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
03cf0 488d9298010000                 lea        rdx, [rdx + 0x198]
03cf7 49b8980a74e200000000           movabs     r8, 0xe2740a98
03d01 49b800b8165400000000           movabs     r8, 0x5416b800
03d0b 4d8bd0                         mov        r10, r8
03d0e 4c3302                         xor        r8, qword ptr [rdx]
03d11 49f7c0fcffffff                 test       r8, -4
03d18 7427                           je         0x7f95943c30c1
03d1a 41f6c002                       test       r8b, 2
03d1e 7521                           jne        0x7f95943c30c1
03d20 48f702feffffff                 test       qword ptr [rdx], -2
03d27 7415                           je         0x7f95943c30be
03d29 4d8bc2                         mov        r8, r10
03d2c 4c3302                         xor        r8, qword ptr [rdx]
03d2f 49f7c0fcffffff                 test       r8, -4
03d36 7409                           je         0x7f95943c30c1
03d38 48830a02                       or         qword ptr [rdx], 2
03d3c eb03                           jmp        0x7f95943c30c1
03d3e 4c8902                         mov        qword ptr [rdx], r8
03d41 48bad8be6e8c957f0000           movabs     rdx, 0x7f958c6ebed8
03d4b 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
03d53 ba02000000                     mov        edx, 2
03d58 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
03d60 bf00000000                     mov        edi, 0
03d65 488b842410020000               mov        rax, qword ptr [rsp + 0x210]
03d6d 48890424                       mov        qword ptr [rsp], rax
03d71 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03d79 4889442408                     mov        qword ptr [rsp + 8], rax
03d7e 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
03d83 49ba980a74e200000000           movabs     r10, 0xe2740a98
03d8d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03d92 0f1f440000                     nop        dword ptr [rax + rax]
03d97 e844875307                     call       0x7f959b8fb860
03d9c 0f1f8400943e001a               nop        dword ptr [rax + rax + 0x1a003e94]
03da4 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
03dab 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
03db3 4103d8                         add        ebx, r8d
03db6 48bed8ab708c957f0000           movabs     rsi, 0x7f958c70abd8
03dc0 ff8608060000                   inc        dword ptr [rsi + 0x608]
03dc6 8bb424d4010000                 mov        esi, dword ptr [rsp + 0x1d4]
03dcd 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
03dd7 ff8200080000                   inc        dword ptr [rdx + 0x800]
03ddd 488bc3                         mov        rax, rbx
03de0 8b942444010000                 mov        edx, dword ptr [rsp + 0x144]
03de7 ffc2                           inc        edx
03de9 48b9d8ab708c957f0000           movabs     rcx, 0x7f958c70abd8
03df3 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
03df7 4183c002                       add        r8d, 2
03dfb 44894174                       mov        dword ptr [rcx + 0x74], r8d
03dff 4181e0fe3f0000                 and        r8d, 0x3ffe
03e06 4585c0                         test       r8d, r8d
03e09 0f84f30f0000                   je         0x7f95943c4182
03e0f 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03e13 418502                         test       dword ptr [r10], eax
03e16 48b9d8ab708c957f0000           movabs     rcx, 0x7f958c70abd8
03e20 ff8128080000                   inc        dword ptr [rcx + 0x828]
03e26 488bce                         mov        rcx, rsi
03e29 4c8bd8                         mov        r11, rax
03e2c 488bf1                         mov        rsi, rcx
03e2f 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
03e37 488b9c2468020000               mov        rbx, qword ptr [rsp + 0x268]
03e3f 8bbc2430010000                 mov        edi, dword ptr [rsp + 0x130]
03e46 4c8b8c2420010000               mov        r9, qword ptr [rsp + 0x120]
03e4e 4c8b842428010000               mov        r8, qword ptr [rsp + 0x128]
03e56 8b8c2434010000                 mov        ecx, dword ptr [rsp + 0x134]
03e5d e98ec4ffff                     jmp        0x7f95943bf670
03e62 4c8bc8                         mov        r9, rax
03e65 4585c9                         test       r9d, r9d
03e68 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
03e72 b980030000                     mov        ecx, 0x380
03e77 7e05                           jle        0x7f95943c31fe
03e79 b990030000                     mov        ecx, 0x390
03e7e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
03e82 4d8d4001                       lea        r8, [r8 + 1]
03e86 4c89040a                       mov        qword ptr [rdx + rcx], r8
03e8a 0f8e77010000                   jle        0x7f95943c3387
03e90 488b9c2498010000               mov        rbx, qword ptr [rsp + 0x198]
03e98 482bf3                         sub        rsi, rbx
03e9b ba00000000                     mov        edx, 0
03ea0 483bf2                         cmp        rsi, rdx
03ea3 48bed8ab708c957f0000           movabs     rsi, 0x7f958c70abd8
03ead baa0030000                     mov        edx, 0x3a0
03eb2 7d05                           jge        0x7f95943c3239
03eb4 bab0030000                     mov        edx, 0x3b0
03eb9 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
03ebd 488d4901                       lea        rcx, [rcx + 1]
03ec1 48890c16                       mov        qword ptr [rsi + rdx], rcx
03ec5 0f8d3c010000                   jge        0x7f95943c3387
03ecb 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
03ed3 488b5630                       mov        rdx, qword ptr [rsi + 0x30]
03ed7 be00000000                     mov        esi, 0
03edc 483bd6                         cmp        rdx, rsi
03edf 48bed8ab708c957f0000           movabs     rsi, 0x7f958c70abd8
03ee9 bac0030000                     mov        edx, 0x3c0
03eee 7505                           jne        0x7f95943c3275
03ef0 bad0030000                     mov        edx, 0x3d0
03ef5 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
03ef9 488d4901                       lea        rcx, [rcx + 1]
03efd 48890c16                       mov        qword ptr [rsi + rdx], rcx
03f01 0f8500010000                   jne        0x7f95943c3387
03f07 e905010000                     jmp        0x7f95943c3391
03f0c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
03f14 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03f1c 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
03f24 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
03f2b 488bce                         mov        rcx, rsi
03f2e 8bb42434010000                 mov        esi, dword ptr [rsp + 0x134]
03f35 488bde                         mov        rbx, rsi
03f38 2bd9                           sub        ebx, ecx
03f3a 48bed8ab708c957f0000           movabs     rsi, 0x7f958c70abd8
03f44 4883864008000001               add        qword ptr [rsi + 0x840], 1
03f4c 488bf2                         mov        rsi, rdx
03f4f 488bd1                         mov        rdx, rcx
03f52 488bc8                         mov        rcx, rax
03f55 4d8bc3                         mov        r8, r11
03f58 4c8bcb                         mov        r9, rbx
03f5b 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
03f63 899c241c020000                 mov        dword ptr [rsp + 0x21c], ebx
03f6a 4885c9                         test       rcx, rcx
03f6d 0f84b00e0000                   je         0x7f95943c41a3
03f73 85d2                           test       edx, edx
03f75 0f8ca80e0000                   jl         0x7f95943c41a3
03f7b 4585c0                         test       r8d, r8d
03f7e 0f8c9f0e0000                   jl         0x7f95943c41a3
03f84 4a8d3c0a                       lea        rdi, [rdx + r9]
03f88 3b7e04                         cmp        edi, dword ptr [rsi + 4]
03f8b 0f87920e0000                   ja         0x7f95943c41a3
03f91 4b8d3c08                       lea        rdi, [r8 + r9]
03f95 3b7904                         cmp        edi, dword ptr [rcx + 4]
03f98 0f87850e0000                   ja         0x7f95943c41a3
03f9e 4585c9                         test       r9d, r9d
03fa1 0f8c7c0e0000                   jl         0x7f95943c41a3
03fa7 4863d2                         movsxd     rdx, edx
03faa 4d63c0                         movsxd     r8, r8d
03fad 488d7c1608                     lea        rdi, [rsi + rdx + 8]
03fb2 4a8d740108                     lea        rsi, [rcx + r8 + 8]
03fb7 498bd1                         mov        rdx, r9
03fba 40f6c40f                       test       spl, 0xf
03fbe 0f8412000000                   je         0x7f95943c3356
03fc4 4883ec08                       sub        rsp, 8
03fc8 e8d31b5207                     call       0x7f959b8e4f20
03fcd 4883c408                       add        rsp, 8
03fd1 e905000000                     jmp        0x7f95943c335b
03fd6 e8c51b5207                     call       0x7f959b8e4f20
03fdb 8b9c241c020000                 mov        ebx, dword ptr [rsp + 0x21c]
03fe2 039c2474010000                 add        ebx, dword ptr [rsp + 0x174]
03fe9 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
03ff1 895e38                         mov        dword ptr [rsi + 0x38], ebx
03ff4 4881c450020000                 add        rsp, 0x250
03ffb 5d                             pop        rbp
03ffc 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
04000 0f872b0e0000                   ja         0x7f95943c41b1
04006 c3                             ret        
04007 bb02000000                     mov        ebx, 2
0400c e915000000                     jmp        0x7f95943c33a6
04011 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
0401b ff82e0030000                   inc        dword ptr [rdx + 0x3e0]
04021 bb08000000                     mov        ebx, 8
04026 899c2428020000                 mov        dword ptr [rsp + 0x228], ebx
0402d 666690                         nop        
04030 e9210e0000                     jmp        0x7f95943c41d6
04035 90                             nop        
04036 90                             nop        
04037 90                             nop        
04038 90                             nop        
04039 90                             nop        
0403a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04041 0f851e0e0000                   jne        0x7f95943c41e5
04047 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
0404e 488d7820                       lea        rdi, [rax + 0x20]
04052 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
04059 0f87060e0000                   ja         0x7f95943c41e5
0405f 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
04066 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0406d 488908                         mov        qword ptr [rax], rcx
04070 4833c9                         xor        rcx, rcx
04073 48894808                       mov        qword ptr [rax + 8], rcx
04077 48894810                       mov        qword ptr [rax + 0x10], rcx
0407b 48894818                       mov        qword ptr [rax + 0x18], rcx
0407f 90                             nop        
04080 e9fc0d0000                     jmp        0x7f95943c4201
04085 90                             nop        
04086 90                             nop        
04087 90                             nop        
04088 90                             nop        
04089 90                             nop        
0408a 498bf1                         mov        rsi, r9
0408d 4889842420020000               mov        qword ptr [rsp + 0x220], rax
04095 6690                           nop        
04097 e844845307                     call       0x7f959b8fb860
0409c 0f1f84009441001c               nop        dword ptr [rax + rax + 0x1c004194]
040a4 48bad8ab708c957f0000           movabs     rdx, 0x7f958c70abd8
040ae 488d9208040000                 lea        rdx, [rdx + 0x408]
040b5 4885c0                         test       rax, rax
040b8 750a                           jne        0x7f95943c3444
040ba f60201                         test       byte ptr [rdx], 1
040bd 7505                           jne        0x7f95943c3444
040bf f048830a01                     lock or    qword ptr [rdx], 1
040c4 488b942420020000               mov        rdx, qword ptr [rsp + 0x220]
040cc 48b9d8ab708c957f0000           movabs     rcx, 0x7f958c70abd8
040d6 4883811804000001               add        qword ptr [rcx + 0x418], 1
040de 8b942428020000                 mov        edx, dword ptr [rsp + 0x228]
040e5 488bc8                         mov        rcx, rax
040e8 488bb42420020000               mov        rsi, qword ptr [rsp + 0x220]
040f0 0f1f8000000000                 nop        dword ptr [rax]
040f7 e8e4795307                     call       0x7f959b8fae60
040fc 0f1f8400f441001d               nop        dword ptr [rax + rax + 0x1d0041f4]
04104 488b842420020000               mov        rax, qword ptr [rsp + 0x220]
0410c e9ed0d0000                     jmp        0x7f95943c427e
04111 0f1f8000000000                 nop        dword ptr [rax]
04118 e97d0d0000                     jmp        0x7f95943c421a
0411d 90                             nop        
0411e 90                             nop        
0411f 90                             nop        
04120 90                             nop        
04121 90                             nop        
04122 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04129 0f857a0d0000                   jne        0x7f95943c4229
0412f 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
04136 488d7820                       lea        rdi, [rax + 0x20]
0413a 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
04141 0f87620d0000                   ja         0x7f95943c4229
04147 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
0414e 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
04155 488908                         mov        qword ptr [rax], rcx
04158 4833c9                         xor        rcx, rcx
0415b 48894808                       mov        qword ptr [rax + 8], rcx
0415f 48894810                       mov        qword ptr [rax + 0x10], rcx
04163 48894818                       mov        qword ptr [rax + 0x18], rcx
04167 488bd0                         mov        rdx, rax
0416a 48b9d8ab708c957f0000           movabs     rcx, 0x7f958c70abd8
04174 4883815002000001               add        qword ptr [rcx + 0x250], 1
0417c ba02000000                     mov        edx, 2
04181 48b9d06426e200000000           movabs     rcx, 0xe22664d0
0418b 488bf0                         mov        rsi, rax
0418e 4889842430020000               mov        qword ptr [rsp + 0x230], rax
04196 90                             nop        
04197 e844795307                     call       0x7f959b8fae60
0419c 0f1f84009442001e               nop        dword ptr [rax + rax + 0x1e004294]
041a4 488b842430020000               mov        rax, qword ptr [rsp + 0x230]
041ac e94d0d0000                     jmp        0x7f95943c427e
041b1 0f1f8000000000                 nop        dword ptr [rax]
041b8 e9080d0000                     jmp        0x7f95943c4245
041bd 90                             nop        
041be 90                             nop        
041bf 90                             nop        
041c0 90                             nop        
041c1 90                             nop        
041c2 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
041c9 0f85050d0000                   jne        0x7f95943c4254
041cf 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
041d6 488d7820                       lea        rdi, [rax + 0x20]
041da 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
041e1 0f87ed0c0000                   ja         0x7f95943c4254
041e7 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
041ee 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
041f5 488908                         mov        qword ptr [rax], rcx
041f8 4833c9                         xor        rcx, rcx
041fb 48894808                       mov        qword ptr [rax + 8], rcx
041ff 48894810                       mov        qword ptr [rax + 0x10], rcx
04203 48894818                       mov        qword ptr [rax + 0x18], rcx
04207 488bd0                         mov        rdx, rax
0420a 48b9d8ab708c957f0000           movabs     rcx, 0x7f958c70abd8
04214 4883813801000001               add        qword ptr [rcx + 0x138], 1
0421c ba05000000                     mov        edx, 5
04221 48b9006526e200000000           movabs     rcx, 0xe2266500
0422b 488bf0                         mov        rsi, rax
0422e 4889842438020000               mov        qword ptr [rsp + 0x238], rax
04236 90                             nop        
04237 e8a4785307                     call       0x7f959b8fae60
0423c 0f1f84003443001f               nop        dword ptr [rax + rax + 0x1f004334]
04244 488b842438020000               mov        rax, qword ptr [rsp + 0x238]
0424c e9ad0c0000                     jmp        0x7f95943c427e
04251 49ba38de518c957f0000           movabs     r10, 0x7f958c51de38
0425b 4c89542408                     mov        qword ptr [rsp + 8], r10
04260 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04268 e873f05f07                     call       0x7f959b9c2660
0426d e91bbeffff                     jmp        0x7f95943bf40d
04272 49ba58e6188c957f0000           movabs     r10, 0x7f958c18e658
0427c 4c89542408                     mov        qword ptr [rsp + 8], r10
04281 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04289 e852f05f07                     call       0x7f959b9c2660
0428e e984bfffff                     jmp        0x7f95943bf597
04293 e8c8905f07                     call       0x7f959b9bc6e0
04298 e8c3905f07                     call       0x7f959b9bc6e0
0429d e8be905f07                     call       0x7f959b9bc6e0
042a2 48891424                       mov        qword ptr [rsp], rdx
042a6 4c89442408                     mov        qword ptr [rsp + 8], r8
042ab e8b0875f07                     call       0x7f959b9bbde0
042b0 e8ab905f07                     call       0x7f959b9bc6e0
042b5 e8a6905f07                     call       0x7f959b9bc6e0
042ba 48891424                       mov        qword ptr [rsp], rdx
042be 4c894c2408                     mov        qword ptr [rsp + 8], r9
042c3 e898875f07                     call       0x7f959b9bbde0
042c8 e893905f07                     call       0x7f959b9bc6e0
042cd e88e905f07                     call       0x7f959b9bc6e0
042d2 48c7042401000000               mov        qword ptr [rsp], 1
042da 48895c2408                     mov        qword ptr [rsp + 8], rbx
042df e87c875f07                     call       0x7f959b9bbde0
042e4 48c7042402000000               mov        qword ptr [rsp], 2
042ec 48895c2408                     mov        qword ptr [rsp + 8], rbx
042f1 e86a875f07                     call       0x7f959b9bbde0
042f6 49bac84e538c957f0000           movabs     r10, 0x7f958c534ec8
04300 4c89542408                     mov        qword ptr [rsp + 8], r10
04305 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0430d e8ceef5f07                     call       0x7f959b9c2660
04312 e996c4ffff                     jmp        0x7f95943bfb2d
04317 49ba48326e8c957f0000           movabs     r10, 0x7f958c6e3248
04321 4c89542408                     mov        qword ptr [rsp + 8], r10
04326 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0432e e8adef5f07                     call       0x7f959b9c2660
04333 e919c5ffff                     jmp        0x7f95943bfbd1
04338 49ba88cc168c957f0000           movabs     r10, 0x7f958c16cc88
04342 4c89542408                     mov        qword ptr [rsp + 8], r10
04347 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0434f e88cef5f07                     call       0x7f959b9c2660
04354 e942c5ffff                     jmp        0x7f95943bfc1b
04359 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04361 e8fad05f07                     call       0x7f959b9c07e0
04366 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0436e e8edd05f07                     call       0x7f959b9c07e0
04373 49ba280d678c957f0000           movabs     r10, 0x7f958c670d28
0437d 4c89542408                     mov        qword ptr [rsp + 8], r10
04382 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0438a e851ef5f07                     call       0x7f959b9c2660
0438f e9e0c5ffff                     jmp        0x7f95943bfcf4
04394 49baa870678c957f0000           movabs     r10, 0x7f958c6770a8
0439e 4c89542408                     mov        qword ptr [rsp + 8], r10
043a3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
043ab e830ef5f07                     call       0x7f959b9c2660
043b0 e9f2c5ffff                     jmp        0x7f95943bfd27
043b5 49ba00006a8c957f0000           movabs     r10, 0x7f958c6a0000
043bf 4c89542408                     mov        qword ptr [rsp + 8], r10
043c4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
043cc e80fef5f07                     call       0x7f959b9c2660
043d1 e99bc6ffff                     jmp        0x7f95943bfdf1
043d6 49ba9068538c957f0000           movabs     r10, 0x7f958c536890
043e0 4c89542408                     mov        qword ptr [rsp + 8], r10
043e5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
043ed e8eeee5f07                     call       0x7f959b9c2660
043f2 e9b1c6ffff                     jmp        0x7f95943bfe28
043f7 49bac0c5698c957f0000           movabs     r10, 0x7f958c69c5c0
04401 4c89542408                     mov        qword ptr [rsp + 8], r10
04406 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0440e e8cdee5f07                     call       0x7f959b9c2660
04413 e915c7ffff                     jmp        0x7f95943bfead
04418 49baf880538c957f0000           movabs     r10, 0x7f958c5380f8
04422 4c89542408                     mov        qword ptr [rsp + 8], r10
04427 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0442f e8acee5f07                     call       0x7f959b9c2660
04434 e90fc8ffff                     jmp        0x7f95943bffc8
04439 49bad07f468c957f0000           movabs     r10, 0x7f958c467fd0
04443 4c89542408                     mov        qword ptr [rsp + 8], r10
04448 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04450 e88bee5f07                     call       0x7f959b9c2660
04455 e92fc8ffff                     jmp        0x7f95943c0009
0445a 49baa8563a8c957f0000           movabs     r10, 0x7f958c3a56a8
04464 4c89542408                     mov        qword ptr [rsp + 8], r10
04469 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04471 e86aee5f07                     call       0x7f959b9c2660
04476 e941c8ffff                     jmp        0x7f95943c003c
0447b 48890424                       mov        qword ptr [rsp], rax
0447f e8dcb65f07                     call       0x7f959b9beee0
04484 e8d78e5f07                     call       0x7f959b9bc6e0
04489 49ba585c538c957f0000           movabs     r10, 0x7f958c535c58
04493 4c89542408                     mov        qword ptr [rsp + 8], r10
04498 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044a0 e83bee5f07                     call       0x7f959b9c2660
044a5 e914caffff                     jmp        0x7f95943c023e
044aa e8b18e5f07                     call       0x7f959b9bc6e0
044af 49ba48326e8c957f0000           movabs     r10, 0x7f958c6e3248
044b9 4c89542408                     mov        qword ptr [rsp + 8], r10
044be 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044c6 e815ee5f07                     call       0x7f959b9c2660
044cb e9b2caffff                     jmp        0x7f95943c0302
044d0 49ba88cc168c957f0000           movabs     r10, 0x7f958c16cc88
044da 4c89542408                     mov        qword ptr [rsp + 8], r10
044df 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044e7 e8f4ed5f07                     call       0x7f959b9c2660
044ec e9cfcaffff                     jmp        0x7f95943c0340
044f1 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
044f9 e862cf5f07                     call       0x7f959b9c07e0
044fe 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04506 e855cf5f07                     call       0x7f959b9c07e0
0450b e8508e5f07                     call       0x7f959b9bc6e0
04510 49baf880538c957f0000           movabs     r10, 0x7f958c5380f8
0451a 4c89542408                     mov        qword ptr [rsp + 8], r10
0451f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04527 e8b4ed5f07                     call       0x7f959b9c2660
0452c e978ccffff                     jmp        0x7f95943c0529
04531 49bad07f468c957f0000           movabs     r10, 0x7f958c467fd0
0453b 4c89542408                     mov        qword ptr [rsp + 8], r10
04540 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04548 e893ed5f07                     call       0x7f959b9c2660
0454d e9a4ccffff                     jmp        0x7f95943c0576
04552 49baa8563a8c957f0000           movabs     r10, 0x7f958c3a56a8
0455c 4c89542408                     mov        qword ptr [rsp + 8], r10
04561 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04569 e872ed5f07                     call       0x7f959b9c2660
0456e e9bbccffff                     jmp        0x7f95943c05ae
04573 49bac84e538c957f0000           movabs     r10, 0x7f958c534ec8
0457d 4c89542408                     mov        qword ptr [rsp + 8], r10
04582 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0458a e851ed5f07                     call       0x7f959b9c2660
0458f e90bceffff                     jmp        0x7f95943c071f
04594 49ba48326e8c957f0000           movabs     r10, 0x7f958c6e3248
0459e 4c89542408                     mov        qword ptr [rsp + 8], r10
045a3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045ab e830ed5f07                     call       0x7f959b9c2660
045b0 e993ceffff                     jmp        0x7f95943c07c8
045b5 49ba88cc168c957f0000           movabs     r10, 0x7f958c16cc88
045bf 4c89542408                     mov        qword ptr [rsp + 8], r10
045c4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045cc e80fed5f07                     call       0x7f959b9c2660
045d1 e9b0ceffff                     jmp        0x7f95943c0806
045d6 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
045de e87dce5f07                     call       0x7f959b9c07e0
045e3 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
045eb e870ce5f07                     call       0x7f959b9c07e0
045f0 49ba280d678c957f0000           movabs     r10, 0x7f958c670d28
045fa 4c89542408                     mov        qword ptr [rsp + 8], r10
045ff 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04607 e8d4ec5f07                     call       0x7f959b9c2660
0460c e94ecfffff                     jmp        0x7f95943c08df
04611 49baa870678c957f0000           movabs     r10, 0x7f958c6770a8
0461b 4c89542408                     mov        qword ptr [rsp + 8], r10
04620 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04628 e8b3ec5f07                     call       0x7f959b9c2660
0462d e965cfffff                     jmp        0x7f95943c0917
04632 49ba00006a8c957f0000           movabs     r10, 0x7f958c6a0000
0463c 4c89542408                     mov        qword ptr [rsp + 8], r10
04641 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04649 e892ec5f07                     call       0x7f959b9c2660
0464e e9f1cfffff                     jmp        0x7f95943c09c4
04653 49ba9068538c957f0000           movabs     r10, 0x7f958c536890
0465d 4c89542408                     mov        qword ptr [rsp + 8], r10
04662 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0466a e871ec5f07                     call       0x7f959b9c2660
0466f e908d0ffff                     jmp        0x7f95943c09fc
04674 49bac0c5698c957f0000           movabs     r10, 0x7f958c69c5c0
0467e 4c89542408                     mov        qword ptr [rsp + 8], r10
04683 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0468b e850ec5f07                     call       0x7f959b9c2660
04690 e96cd0ffff                     jmp        0x7f95943c0a81
04695 49baf880538c957f0000           movabs     r10, 0x7f958c5380f8
0469f 4c89542408                     mov        qword ptr [rsp + 8], r10
046a4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046ac e82fec5f07                     call       0x7f959b9c2660
046b1 e962d1ffff                     jmp        0x7f95943c0b98
046b6 49bad07f468c957f0000           movabs     r10, 0x7f958c467fd0
046c0 4c89542408                     mov        qword ptr [rsp + 8], r10
046c5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046cd e80eec5f07                     call       0x7f959b9c2660
046d2 e987d1ffff                     jmp        0x7f95943c0bde
046d7 49baa8563a8c957f0000           movabs     r10, 0x7f958c3a56a8
046e1 4c89542408                     mov        qword ptr [rsp + 8], r10
046e6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046ee e8edeb5f07                     call       0x7f959b9c2660
046f3 e99ed1ffff                     jmp        0x7f95943c0c16
046f8 48890424                       mov        qword ptr [rsp], rax
046fc e85fb45f07                     call       0x7f959b9beee0
04701 e85a8c5f07                     call       0x7f959b9bc6e0
04706 49ba585c538c957f0000           movabs     r10, 0x7f958c535c58
04710 4c89542408                     mov        qword ptr [rsp + 8], r10
04715 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0471d e8beeb5f07                     call       0x7f959b9c2660
04722 e977d3ffff                     jmp        0x7f95943c0e1e
04727 e8348c5f07                     call       0x7f959b9bc6e0
0472c 49ba48326e8c957f0000           movabs     r10, 0x7f958c6e3248
04736 4c89542408                     mov        qword ptr [rsp + 8], r10
0473b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04743 e898eb5f07                     call       0x7f959b9c2660
04748 e915d4ffff                     jmp        0x7f95943c0ee2
0474d 49ba88cc168c957f0000           movabs     r10, 0x7f958c16cc88
04757 4c89542408                     mov        qword ptr [rsp + 8], r10
0475c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04764 e877eb5f07                     call       0x7f959b9c2660
04769 e932d4ffff                     jmp        0x7f95943c0f20
0476e 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04776 e8e5cc5f07                     call       0x7f959b9c07e0
0477b 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04783 e8d8cc5f07                     call       0x7f959b9c07e0
04788 e8d38b5f07                     call       0x7f959b9bc6e0
0478d 49baf880538c957f0000           movabs     r10, 0x7f958c5380f8
04797 4c89542408                     mov        qword ptr [rsp + 8], r10
0479c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047a4 e837eb5f07                     call       0x7f959b9c2660
047a9 e9dbd5ffff                     jmp        0x7f95943c1109
047ae 49bad07f468c957f0000           movabs     r10, 0x7f958c467fd0
047b8 4c89542408                     mov        qword ptr [rsp + 8], r10
047bd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047c5 e816eb5f07                     call       0x7f959b9c2660
047ca e907d6ffff                     jmp        0x7f95943c1156
047cf 49baa8563a8c957f0000           movabs     r10, 0x7f958c3a56a8
047d9 4c89542408                     mov        qword ptr [rsp + 8], r10
047de 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047e6 e8f5ea5f07                     call       0x7f959b9c2660
047eb e91ed6ffff                     jmp        0x7f95943c118e
047f0 49ba38de518c957f0000           movabs     r10, 0x7f958c51de38
047fa 4c89542408                     mov        qword ptr [rsp + 8], r10
047ff 48c704240a020000               mov        qword ptr [rsp], 0x20a
04807 e8d4ea5f07                     call       0x7f959b9c2660
0480c e914d7ffff                     jmp        0x7f95943c12a5
04811 660f1f440000                   nop        word ptr [rax + rax]
04817 e8c47c5307                     call       0x7f959b8fb860
0481c e9f5d7ffff                     jmp        0x7f95943c1396
04821 660f1f440000                   nop        word ptr [rax + rax]
04827 e8b47c5307                     call       0x7f959b8fb860
0482c e972d9ffff                     jmp        0x7f95943c1523
04831 49bad005528c957f0000           movabs     r10, 0x7f958c5205d0
0483b 4c89542408                     mov        qword ptr [rsp + 8], r10
04840 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04848 e893ea5f07                     call       0x7f959b9c2660
0484d e9d0d9ffff                     jmp        0x7f95943c15a2
04852 49b80000000000000000           movabs     r8, 0
0485c b8000f050a                     mov        eax, 0xa050f00
04861 e87ae15f07                     call       0x7f959b9c1d60
04866 e9bdd9ffff                     jmp        0x7f95943c15a8
0486b 49ba38de518c957f0000           movabs     r10, 0x7f958c51de38
04875 4c89542408                     mov        qword ptr [rsp + 8], r10
0487a 48c70424aa020000               mov        qword ptr [rsp], 0x2aa
04882 e859ea5f07                     call       0x7f959b9c2660
04887 e9e0daffff                     jmp        0x7f95943c16ec
0488c 49bac84e538c957f0000           movabs     r10, 0x7f958c534ec8
04896 4c89542408                     mov        qword ptr [rsp + 8], r10
0489b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048a3 e838ea5f07                     call       0x7f959b9c2660
048a8 e9b5dbffff                     jmp        0x7f95943c17e2
048ad e8ae8a5f07                     call       0x7f959b9bc6e0
048b2 49ba48326e8c957f0000           movabs     r10, 0x7f958c6e3248
048bc 4c89542408                     mov        qword ptr [rsp + 8], r10
048c1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048c9 e812ea5f07                     call       0x7f959b9c2660
048ce e937dcffff                     jmp        0x7f95943c188a
048d3 49ba88cc168c957f0000           movabs     r10, 0x7f958c16cc88
048dd 4c89542408                     mov        qword ptr [rsp + 8], r10
048e2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048ea e8f1e95f07                     call       0x7f959b9c2660
048ef e94fdcffff                     jmp        0x7f95943c18c3
048f4 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
048fc e85fcb5f07                     call       0x7f959b9c07e0
04901 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04909 e852cb5f07                     call       0x7f959b9c07e0
0490e 49ba280d678c957f0000           movabs     r10, 0x7f958c670d28
04918 4c89542408                     mov        qword ptr [rsp + 8], r10
0491d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04925 e8b6e95f07                     call       0x7f959b9c2660
0492a e9e2dcffff                     jmp        0x7f95943c1991
0492f 49baa870678c957f0000           movabs     r10, 0x7f958c6770a8
04939 4c89542408                     mov        qword ptr [rsp + 8], r10
0493e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04946 e895e95f07                     call       0x7f959b9c2660
0494b e9f4dcffff                     jmp        0x7f95943c19c4
04950 49ba00006a8c957f0000           movabs     r10, 0x7f958c6a0000
0495a 4c89542408                     mov        qword ptr [rsp + 8], r10
0495f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04967 e874e95f07                     call       0x7f959b9c2660
0496c e984ddffff                     jmp        0x7f95943c1a75
04971 49ba9068538c957f0000           movabs     r10, 0x7f958c536890
0497b 4c89542408                     mov        qword ptr [rsp + 8], r10
04980 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04988 e853e95f07                     call       0x7f959b9c2660
0498d e99eddffff                     jmp        0x7f95943c1ab0
04992 49bac0c5698c957f0000           movabs     r10, 0x7f958c69c5c0
0499c 4c89542408                     mov        qword ptr [rsp + 8], r10
049a1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049a9 e832e95f07                     call       0x7f959b9c2660
049ae e9fdddffff                     jmp        0x7f95943c1b30
049b3 49baf880538c957f0000           movabs     r10, 0x7f958c5380f8
049bd 4c89542408                     mov        qword ptr [rsp + 8], r10
049c2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049ca e811e95f07                     call       0x7f959b9c2660
049cf e9eadeffff                     jmp        0x7f95943c1c3e
049d4 49bad07f468c957f0000           movabs     r10, 0x7f958c467fd0
049de 4c89542408                     mov        qword ptr [rsp + 8], r10
049e3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049eb e8f0e85f07                     call       0x7f959b9c2660
049f0 e90adfffff                     jmp        0x7f95943c1c7f
049f5 49baa8563a8c957f0000           movabs     r10, 0x7f958c3a56a8
049ff 4c89542408                     mov        qword ptr [rsp + 8], r10
04a04 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a0c e8cfe85f07                     call       0x7f959b9c2660
04a11 e91cdfffff                     jmp        0x7f95943c1cb2
04a16 48890424                       mov        qword ptr [rsp], rax
04a1a e841b15f07                     call       0x7f959b9beee0
04a1f e83c895f07                     call       0x7f959b9bc6e0
04a24 49ba585c538c957f0000           movabs     r10, 0x7f958c535c58
04a2e 4c89542408                     mov        qword ptr [rsp + 8], r10
04a33 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a3b e8a0e85f07                     call       0x7f959b9c2660
04a40 e9f1e0ffff                     jmp        0x7f95943c1eb6
04a45 49ba48326e8c957f0000           movabs     r10, 0x7f958c6e3248
04a4f 4c89542408                     mov        qword ptr [rsp + 8], r10
04a54 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a5c e87fe85f07                     call       0x7f959b9c2660
04a61 e989e1ffff                     jmp        0x7f95943c1f6f
04a66 49ba88cc168c957f0000           movabs     r10, 0x7f958c16cc88
04a70 4c89542408                     mov        qword ptr [rsp + 8], r10
04a75 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a7d e85ee85f07                     call       0x7f959b9c2660
04a82 e9afe1ffff                     jmp        0x7f95943c1fb6
04a87 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04a8f e8ccc95f07                     call       0x7f959b9c07e0
04a94 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04a9c e8bfc95f07                     call       0x7f959b9c07e0
04aa1 e8ba885f07                     call       0x7f959b9bc6e0
04aa6 49baf880538c957f0000           movabs     r10, 0x7f958c5380f8
04ab0 4c89542408                     mov        qword ptr [rsp + 8], r10
04ab5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04abd e81ee85f07                     call       0x7f959b9c2660
04ac2 e95ae3ffff                     jmp        0x7f95943c21a1
04ac7 49bad07f468c957f0000           movabs     r10, 0x7f958c467fd0
04ad1 4c89542408                     mov        qword ptr [rsp + 8], r10
04ad6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ade e8fde75f07                     call       0x7f959b9c2660
04ae3 e986e3ffff                     jmp        0x7f95943c21ee
04ae8 49baa8563a8c957f0000           movabs     r10, 0x7f958c3a56a8
04af2 4c89542408                     mov        qword ptr [rsp + 8], r10
04af7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04aff e8dce75f07                     call       0x7f959b9c2660
04b04 e99de3ffff                     jmp        0x7f95943c2226
04b09 49ba38de518c957f0000           movabs     r10, 0x7f958c51de38
04b13 4c89542408                     mov        qword ptr [rsp + 8], r10
04b18 48c70424e8020000               mov        qword ptr [rsp], 0x2e8
04b20 e8bbe75f07                     call       0x7f959b9c2660
04b25 e990e4ffff                     jmp        0x7f95943c233a
04b2a 49bad005528c957f0000           movabs     r10, 0x7f958c5205d0
04b34 4c89542408                     mov        qword ptr [rsp + 8], r10
04b39 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b41 e89ae75f07                     call       0x7f959b9c2660
04b46 e94fe5ffff                     jmp        0x7f95943c241a
04b4b 49b80000000000000000           movabs     r8, 0
04b55 b8000f050a                     mov        eax, 0xa050f00
04b5a e881de5f07                     call       0x7f959b9c1d60
04b5f e93ce5ffff                     jmp        0x7f95943c2420
04b64 49ba38de518c957f0000           movabs     r10, 0x7f958c51de38
04b6e 4c89542408                     mov        qword ptr [rsp + 8], r10
04b73 48c7042420030000               mov        qword ptr [rsp], 0x320
04b7b e860e75f07                     call       0x7f959b9c2660
04b80 e95fe6ffff                     jmp        0x7f95943c2564
04b85 49bac84e538c957f0000           movabs     r10, 0x7f958c534ec8
04b8f 4c89542408                     mov        qword ptr [rsp + 8], r10
04b94 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b9c e83fe75f07                     call       0x7f959b9c2660
04ba1 e91fe7ffff                     jmp        0x7f95943c2645
04ba6 e8b5875f07                     call       0x7f959b9bc6e0
04bab 49ba48326e8c957f0000           movabs     r10, 0x7f958c6e3248
04bb5 4c89542408                     mov        qword ptr [rsp + 8], r10
04bba 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bc2 e819e75f07                     call       0x7f959b9c2660
04bc7 e9a0e7ffff                     jmp        0x7f95943c26ec
04bcc 49ba88cc168c957f0000           movabs     r10, 0x7f958c16cc88
04bd6 4c89542408                     mov        qword ptr [rsp + 8], r10
04bdb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04be3 e8f8e65f07                     call       0x7f959b9c2660
04be8 e9b8e7ffff                     jmp        0x7f95943c2725
04bed 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04bf5 e866c85f07                     call       0x7f959b9c07e0
04bfa 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04c02 e859c85f07                     call       0x7f959b9c07e0
04c07 49ba280d678c957f0000           movabs     r10, 0x7f958c670d28
04c11 4c89542408                     mov        qword ptr [rsp + 8], r10
04c16 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c1e e8bde65f07                     call       0x7f959b9c2660
04c23 e943e8ffff                     jmp        0x7f95943c27eb
04c28 49baa870678c957f0000           movabs     r10, 0x7f958c6770a8
04c32 4c89542408                     mov        qword ptr [rsp + 8], r10
04c37 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c3f e89ce65f07                     call       0x7f959b9c2660
04c44 e955e8ffff                     jmp        0x7f95943c281e
04c49 49ba00006a8c957f0000           movabs     r10, 0x7f958c6a0000
04c53 4c89542408                     mov        qword ptr [rsp + 8], r10
04c58 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c60 e87be65f07                     call       0x7f959b9c2660
04c65 e9d8e8ffff                     jmp        0x7f95943c28c2
04c6a 49ba9068538c957f0000           movabs     r10, 0x7f958c536890
04c74 4c89542408                     mov        qword ptr [rsp + 8], r10
04c79 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c81 e85ae65f07                     call       0x7f959b9c2660
04c86 e9ede8ffff                     jmp        0x7f95943c28f8
04c8b 49bac0c5698c957f0000           movabs     r10, 0x7f958c69c5c0
04c95 4c89542408                     mov        qword ptr [rsp + 8], r10
04c9a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ca2 e839e65f07                     call       0x7f959b9c2660
04ca7 e94ce9ffff                     jmp        0x7f95943c2978
04cac 49baf880538c957f0000           movabs     r10, 0x7f958c5380f8
04cb6 4c89542408                     mov        qword ptr [rsp + 8], r10
04cbb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cc3 e818e65f07                     call       0x7f959b9c2660
04cc8 e939eaffff                     jmp        0x7f95943c2a86
04ccd 49bad07f468c957f0000           movabs     r10, 0x7f958c467fd0
04cd7 4c89542408                     mov        qword ptr [rsp + 8], r10
04cdc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ce4 e8f7e55f07                     call       0x7f959b9c2660
04ce9 e959eaffff                     jmp        0x7f95943c2ac7
04cee 49baa8563a8c957f0000           movabs     r10, 0x7f958c3a56a8
04cf8 4c89542408                     mov        qword ptr [rsp + 8], r10
04cfd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d05 e8d6e55f07                     call       0x7f959b9c2660
04d0a e96beaffff                     jmp        0x7f95943c2afa
04d0f 48890424                       mov        qword ptr [rsp], rax
04d13 e848ae5f07                     call       0x7f959b9beee0
04d18 e843865f07                     call       0x7f959b9bc6e0
04d1d 49ba585c538c957f0000           movabs     r10, 0x7f958c535c58
04d27 4c89542408                     mov        qword ptr [rsp + 8], r10
04d2c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d34 e8a7e55f07                     call       0x7f959b9c2660
04d39 e940ecffff                     jmp        0x7f95943c2cfe
04d3e 49ba48326e8c957f0000           movabs     r10, 0x7f958c6e3248
04d48 4c89542408                     mov        qword ptr [rsp + 8], r10
04d4d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d55 e886e55f07                     call       0x7f959b9c2660
04d5a e9d8ecffff                     jmp        0x7f95943c2db7
04d5f 49ba88cc168c957f0000           movabs     r10, 0x7f958c16cc88
04d69 4c89542408                     mov        qword ptr [rsp + 8], r10
04d6e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d76 e865e55f07                     call       0x7f959b9c2660
04d7b e9fbecffff                     jmp        0x7f95943c2dfb
04d80 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04d88 e8d3c65f07                     call       0x7f959b9c07e0
04d8d 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04d95 e8c6c65f07                     call       0x7f959b9c07e0
04d9a e8c1855f07                     call       0x7f959b9bc6e0
04d9f 49baf880538c957f0000           movabs     r10, 0x7f958c5380f8
04da9 4c89542408                     mov        qword ptr [rsp + 8], r10
04dae 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04db6 e825e55f07                     call       0x7f959b9c2660
04dbb e9a1eeffff                     jmp        0x7f95943c2fe1
04dc0 49bad07f468c957f0000           movabs     r10, 0x7f958c467fd0
04dca 4c89542408                     mov        qword ptr [rsp + 8], r10
04dcf 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04dd7 e804e55f07                     call       0x7f959b9c2660
04ddc e9cdeeffff                     jmp        0x7f95943c302e
04de1 49baa8563a8c957f0000           movabs     r10, 0x7f958c3a56a8
04deb 4c89542408                     mov        qword ptr [rsp + 8], r10
04df0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04df8 e8e3e45f07                     call       0x7f959b9c2660
04dfd e9e4eeffff                     jmp        0x7f95943c3066
04e02 49ba38de518c957f0000           movabs     r10, 0x7f958c51de38
04e0c 4c89542408                     mov        qword ptr [rsp + 8], r10
04e11 48c704245a030000               mov        qword ptr [rsp], 0x35a
04e19 e8c2e45f07                     call       0x7f959b9c2660
04e1e e9ecefffff                     jmp        0x7f95943c318f
04e23 0f1f4000                       nop        dword ptr [rax]
04e27 e8b4765307                     call       0x7f959b8fb860
04e2c e9aaf1ffff                     jmp        0x7f95943c335b
04e31 49ba7c333c94957f0000           movabs     r10, 0x7f95943c337c
04e3b 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
04e42 e9199d5307                     jmp        0x7f959b8fdee0
04e47 48ba0000000000000000           movabs     rdx, 0
04e51 b8000f050a                     mov        eax, 0xa050f00
04e56 e885cf5f07                     call       0x7f959b9c1160
04e5b e9d0f1ffff                     jmp        0x7f95943c33b0
04e60 e8fb845f07                     call       0x7f959b9bc6e0
04e65 488bd2                         mov        rdx, rdx
04e68 e873925f07                     call       0x7f959b9bd460
04e6d e90df2ffff                     jmp        0x7f95943c33ff
04e72 48ba0000000000000000           movabs     rdx, 0
04e7c b8000f050a                     mov        eax, 0xa050f00
04e81 e85adb5f07                     call       0x7f959b9c1d60
04e86 e9f5f1ffff                     jmp        0x7f95943c3400
04e8b 48ba0000000000000000           movabs     rdx, 0
04e95 b8000f050a                     mov        eax, 0xa050f00
04e9a e841cf5f07                     call       0x7f959b9c1160
04e9f e974f2ffff                     jmp        0x7f95943c3498
04ea4 e8b7845f07                     call       0x7f959b9bc6e0
04ea9 488bd2                         mov        rdx, rdx
04eac e82f925f07                     call       0x7f959b9bd460
04eb1 e9b1f2ffff                     jmp        0x7f95943c34e7
04eb6 48ba0000000000000000           movabs     rdx, 0
04ec0 b8000f050a                     mov        eax, 0xa050f00
04ec5 e816cf5f07                     call       0x7f959b9c1160
04eca e9e9f2ffff                     jmp        0x7f95943c3538
04ecf e88c845f07                     call       0x7f959b9bc6e0
04ed4 488bd2                         mov        rdx, rdx
04ed7 e804925f07                     call       0x7f959b9bd460
04edc e926f3ffff                     jmp        0x7f95943c3587
04ee1 498b8778050000                 mov        rax, qword ptr [r15 + 0x578]
04ee8 49c7877805000000000000         mov        qword ptr [r15 + 0x578], 0
04ef3 49c7878005000000000000         mov        qword ptr [r15 + 0x580], 0
04efe 4881c450020000                 add        rsp, 0x250
04f05 5d                             pop        rbp
04f06 e955755f07                     jmp        0x7f959b9bb7e0
04f0b f4                             hlt        
04f0c f4                             hlt        
04f0d f4                             hlt        
04f0e f4                             hlt        
04f0f f4                             hlt        
