00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c0ce5307                   jne        0x7fcb338fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ec50020000                 sub        rsp, 0x250
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 7405                           je         0x7fcb2c3bdabf
0003a e8e1cf5207                     call       0x7fcb338eaaa0
0003f 4889b42448010000               mov        qword ptr [rsp + 0x148], rsi
00047 4889942468010000               mov        qword ptr [rsp + 0x168], rdx
0004f 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
00056 4c89842428010000               mov        qword ptr [rsp + 0x128], r8
0005e 4c898c2420010000               mov        qword ptr [rsp + 0x120], r9
00066 89bc2430010000                 mov        dword ptr [rsp + 0x130], edi
0006d 48bb88b1421ccb7f0000           movabs     rbx, 0x7fcb1c42b188
00077 8b4370                         mov        eax, dword ptr [rbx + 0x70]
0007a 83c002                         add        eax, 2
0007d 894370                         mov        dword ptr [rbx + 0x70], eax
00080 25fe070000                     and        eax, 0x7fe
00085 85c0                           test       eax, eax
00087 0f84cc3c0000                   je         0x7fcb2c3c17d9
0008d 48bb88b1421ccb7f0000           movabs     rbx, 0x7fcb1c42b188
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
000e1 48b888b1421ccb7f0000           movabs     rax, 0x7fcb1c42b188
000eb b9f8000000                     mov        ecx, 0xf8
000f0 7f05                           jg         0x7fcb2c3bdb77
000f2 b908010000                     mov        ecx, 0x108
000f7 44899c2440010000               mov        dword ptr [rsp + 0x140], r11d
000ff 4c8b1c08                       mov        r11, qword ptr [rax + rcx]
00103 4d8d5b01                       lea        r11, [r11 + 1]
00107 4c891c08                       mov        qword ptr [rax + rcx], r11
0010b 0f8fa83b0000                   jg         0x7fcb2c3c1739
00111 4863db                         movsxd     rbx, ebx
00114 488b4e20                       mov        rcx, qword ptr [rsi + 0x20]
00118 482bcf                         sub        rcx, rdi
0011b 483bcb                         cmp        rcx, rbx
0011e 48b988b1421ccb7f0000           movabs     rcx, 0x7fcb1c42b188
00128 b828010000                     mov        eax, 0x128
0012d 7c05                           jl         0x7fcb2c3bdbb4
0012f b818010000                     mov        eax, 0x118
00134 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
00138 4d8d5b01                       lea        r11, [r11 + 1]
0013c 4c891c01                       mov        qword ptr [rcx + rax], r11
00140 0f8c733b0000                   jl         0x7fcb2c3c1739
00146 48b988b1421ccb7f0000           movabs     rcx, 0x7fcb1c42b188
00150 ff8158010000                   inc        dword ptr [rcx + 0x158]
00156 b900000000                     mov        ecx, 0
0015b 498bc0                         mov        rax, r8
0015e 483bc1                         cmp        rax, rcx
00161 48b988b1421ccb7f0000           movabs     rcx, 0x7fcb1c42b188
0016b b868010000                     mov        eax, 0x168
00170 7505                           jne        0x7fcb2c3bdbf7
00172 b878010000                     mov        eax, 0x178
00177 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
0017b 4d8d5b01                       lea        r11, [r11 + 1]
0017f 4c891c01                       mov        qword ptr [rcx + rax], r11
00183 0f8531000000                   jne        0x7fcb2c3bdc3a
00189 4803df                         add        rbx, rdi
0018c 498bc9                         mov        rcx, r9
0018f 483bcb                         cmp        rcx, rbx
00192 48b988b1421ccb7f0000           movabs     rcx, 0x7fcb1c42b188
0019c bf98010000                     mov        edi, 0x198
001a1 7d05                           jge        0x7fcb2c3bdc28
001a3 bf88010000                     mov        edi, 0x188
001a8 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
001ac 488d5b01                       lea        rbx, [rbx + 1]
001b0 48891c39                       mov        qword ptr [rcx + rdi], rbx
001b4 0f8d0a000000                   jge        0x7fcb2c3bdc44
001ba bf00000000                     mov        edi, 0
001bf e915000000                     jmp        0x7fcb2c3bdc59
001c4 48b988b1421ccb7f0000           movabs     rcx, 0x7fcb1c42b188
001ce ff81a8010000                   inc        dword ptr [rcx + 0x1a8]
001d4 bf01000000                     mov        edi, 1
001d9 4d2bc6                         sub        r8, r14
001dc 4c89842480010000               mov        qword ptr [rsp + 0x180], r8
001e4 48b988b1421ccb7f0000           movabs     rcx, 0x7fcb1c42b188
001ee 488381c001000001               add        qword ptr [rcx + 0x1c0], 1
001f6 48b9102d131ccb7f0000           movabs     rcx, 0x7fcb1c132d10
00200 8b5970                         mov        ebx, dword ptr [rcx + 0x70]
00203 83c302                         add        ebx, 2
00206 895970                         mov        dword ptr [rcx + 0x70], ebx
00209 81e3feff1f00                   and        ebx, 0x1ffffe
0020f 85db                           test       ebx, ebx
00211 0f84633b0000                   je         0x7fcb2c3c17fa
00217 48b9ffffffffffffff7f           movabs     rcx, 0x7fffffffffffffff
00221 493bc9                         cmp        rcx, r9
00224 48b9102d131ccb7f0000           movabs     rcx, 0x7fcb1c132d10
0022e bbb8000000                     mov        ebx, 0xb8
00233 7d05                           jge        0x7fcb2c3bdcba
00235 bba8000000                     mov        ebx, 0xa8
0023a 488b0419                       mov        rax, qword ptr [rcx + rbx]
0023e 488d4001                       lea        rax, [rax + 1]
00242 48890419                       mov        qword ptr [rcx + rbx], rax
00246 0f8d0f000000                   jge        0x7fcb2c3bdcdb
0024c 49b9ffffffffffffff7f           movabs     r9, 0x7fffffffffffffff
00256 e910000000                     jmp        0x7fcb2c3bdceb
0025b 48b9102d131ccb7f0000           movabs     rcx, 0x7fcb1c132d10
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
002f2 48bf88b1421ccb7f0000           movabs     rdi, 0x7fcb1c42b188
002fc b8d0010000                     mov        eax, 0x1d0
00301 7d05                           jge        0x7fcb2c3bdd88
00303 b8e0010000                     mov        eax, 0x1e0
00308 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
0030c 4d8d5b01                       lea        r11, [r11 + 1]
00310 4c891c07                       mov        qword ptr [rdi + rax], r11
00314 0f8dfa360000                   jge        0x7fcb2c3c1494
0031a 413b5004                       cmp        edx, dword ptr [r8 + 4]
0031e 0f83863a0000                   jae        0x7fcb2c3c182a
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
00367 48b988b1421ccb7f0000           movabs     rcx, 0x7fcb1c42b188
00371 41b8f0010000                   mov        r8d, 0x1f0
00377 7d06                           jge        0x7fcb2c3bddff
00379 41b800020000                   mov        r8d, 0x200
0037f 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00383 4d8d6d01                       lea        r13, [r13 + 1]
00387 4e892c01                       mov        qword ptr [rcx + r8], r13
0038b 0f8d15000000                   jge        0x7fcb2c3bde26
00391 413b5104                       cmp        edx, dword ptr [r9 + 4]
00395 0f83273a0000                   jae        0x7fcb2c3c1842
0039b 4863ca                         movsxd     rcx, edx
0039e 418b4c8908                     mov        ecx, dword ptr [r9 + rcx*4 + 8]
003a3 488bc1                         mov        rax, rcx
003a6 85ff                           test       edi, edi
003a8 48b988b1421ccb7f0000           movabs     rcx, 0x7fcb1c42b188
003b2 41b810020000                   mov        r8d, 0x210
003b8 7406                           je         0x7fcb2c3bde40
003ba 41b820020000                   mov        r8d, 0x220
003c0 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003c4 4d8d6d01                       lea        r13, [r13 + 1]
003c8 4e892c01                       mov        qword ptr [rcx + r8], r13
003cc 0f8431000000                   je         0x7fcb2c3bde83
003d2 498bcb                         mov        rcx, r11
003d5 2bce                           sub        ecx, esi
003d7 3bf9                           cmp        edi, ecx
003d9 48b988b1421ccb7f0000           movabs     rcx, 0x7fcb1c42b188
003e3 41b840020000                   mov        r8d, 0x240
003e9 7f06                           jg         0x7fcb2c3bde71
003eb 41b830020000                   mov        r8d, 0x230
003f1 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003f5 4d8d6d01                       lea        r13, [r13 + 1]
003f9 4e892c01                       mov        qword ptr [rcx + r8], r13
003fd 0f8f16380000                   jg         0x7fcb2c3c1699
00403 83f803                         cmp        eax, 3
00406 48b988b1421ccb7f0000           movabs     rcx, 0x7fcb1c42b188
00410 41b860020000                   mov        r8d, 0x260
00416 7e06                           jle        0x7fcb2c3bde9e
00418 41b870020000                   mov        r8d, 0x270
0041e 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00422 4d8d6d01                       lea        r13, [r13 + 1]
00426 4e892c01                       mov        qword ptr [rcx + r8], r13
0042a 0f8e59000000                   jle        0x7fcb2c3bdf09
00430 83e803                         sub        eax, 3
00433 837b0401                       cmp        dword ptr [rbx + 4], 1
00437 0f869d390000                   jbe        0x7fcb2c3c185a
0043d 8b4b0c                         mov        ecx, dword ptr [rbx + 0xc]
00440 837b0402                       cmp        dword ptr [rbx + 4], 2
00444 0f86a2390000                   jbe        0x7fcb2c3c186c
0044a 894b10                         mov        dword ptr [rbx + 0x10], ecx
0044d 8b4b08                         mov        ecx, dword ptr [rbx + 8]
00450 894b0c                         mov        dword ptr [rbx + 0xc], ecx
00453 894308                         mov        dword ptr [rbx + 8], eax
00456 48b988b1421ccb7f0000           movabs     rcx, 0x7fcb1c42b188
00460 ff8180020000                   inc        dword ptr [rcx + 0x280]
00466 89942444010000                 mov        dword ptr [rsp + 0x144], edx
0046d 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
00474 4c8bb42488010000               mov        r14, qword ptr [rsp + 0x188]
0047c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
00484 e952000000                     jmp        0x7fcb2c3bdf5b
00489 89942444010000                 mov        dword ptr [rsp + 0x144], edx
00490 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
00497 49b888b1421ccb7f0000           movabs     r8, 0x7fcb1c42b188
004a1 4983809802000001               add        qword ptr [r8 + 0x298], 1
004a9 488bf3                         mov        rsi, rbx
004ac 488bd0                         mov        rdx, rax
004af 488bcf                         mov        rcx, rdi
004b2 0f1f440000                     nop        dword ptr [rax + rax]
004b7 e824d95307                     call       0x7fcb338fb860
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
004f0 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
004fa b9b8020000                     mov        ecx, 0x2b8
004ff 7d05                           jge        0x7fcb2c3bdf86
00501 b9a8020000                     mov        ecx, 0x2a8
00506 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0050a 4d8d4001                       lea        r8, [r8 + 1]
0050e 4c89040a                       mov        qword ptr [rdx + rcx], r8
00512 0f8d15000000                   jge        0x7fcb2c3bdfad
00518 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00520 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00528 e9ad000000                     jmp        0x7fcb2c3be05a
0052d 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00535 4585ed                         test       r13d, r13d
00538 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
00542 b9c8020000                     mov        ecx, 0x2c8
00547 7505                           jne        0x7fcb2c3bdfce
00549 b9d8020000                     mov        ecx, 0x2d8
0054e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
00552 4d8d4001                       lea        r8, [r8 + 1]
00556 4c89040a                       mov        qword ptr [rdx + rcx], r8
0055a 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00562 0f8568000000                   jne        0x7fcb2c3be050
00568 498bd3                         mov        rdx, r11
0056b 03d7                           add        edx, edi
0056d 2bd0                           sub        edx, eax
0056f 4863d2                         movsxd     rdx, edx
00572 493bd0                         cmp        rdx, r8
00575 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
0057f b9e8020000                     mov        ecx, 0x2e8
00584 7c05                           jl         0x7fcb2c3be00b
00586 b9f8020000                     mov        ecx, 0x2f8
0058b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0058f 4d8d4901                       lea        r9, [r9 + 1]
00593 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00597 0f8c3d000000                   jl         0x7fcb2c3be05a
0059d 4c8b8c2450010000               mov        r9, qword ptr [rsp + 0x150]
005a5 4c3bcb                         cmp        r9, rbx
005a8 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
005b2 b918030000                     mov        ecx, 0x318
005b7 7c05                           jl         0x7fcb2c3be03e
005b9 b908030000                     mov        ecx, 0x308
005be 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
005c2 4d8d4901                       lea        r9, [r9 + 1]
005c6 4c890c0a                       mov        qword ptr [rdx + rcx], r9
005ca 0f8c0a000000                   jl         0x7fcb2c3be05a
005d0 ba00000000                     mov        edx, 0
005d5 e915000000                     jmp        0x7fcb2c3be06f
005da 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
005e4 ff8228030000                   inc        dword ptr [rdx + 0x328]
005ea ba01000000                     mov        edx, 1
005ef 48899c2498010000               mov        qword ptr [rsp + 0x198], rbx
005f7 85c0                           test       eax, eax
005f9 48b988b1421ccb7f0000           movabs     rcx, 0x7fcb1c42b188
00603 41b940030000                   mov        r9d, 0x340
00609 7e06                           jle        0x7fcb2c3be091
0060b 41b950030000                   mov        r9d, 0x350
00611 4a8b1c09                       mov        rbx, qword ptr [rcx + r9]
00615 488d5b01                       lea        rbx, [rbx + 1]
00619 4a891c09                       mov        qword ptr [rcx + r9], rbx
0061d 0f8e47330000                   jle        0x7fcb2c3c13ea
00623 85d2                           test       edx, edx
00625 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
0062f b970030000                     mov        ecx, 0x370
00634 7505                           jne        0x7fcb2c3be0bb
00636 b960030000                     mov        ecx, 0x360
0063b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0063f 4d8d4901                       lea        r9, [r9 + 1]
00643 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00647 0f851d330000                   jne        0x7fcb2c3c13ea
0064d 498bdb                         mov        rbx, r11
00650 03df                           add        ebx, edi
00652 899c24a0010000                 mov        dword ptr [rsp + 0x1a0], ebx
00659 488bf3                         mov        rsi, rbx
0065c 03b42478010000                 add        esi, dword ptr [rsp + 0x178]
00663 3bb42458010000                 cmp        esi, dword ptr [rsp + 0x158]
0066a 48be88b1421ccb7f0000           movabs     rsi, 0x7fcb1c42b188
00674 ba28040000                     mov        edx, 0x428
00679 7f05                           jg         0x7fcb2c3be100
0067b ba38040000                     mov        edx, 0x438
00680 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
00684 488d4901                       lea        rcx, [rcx + 1]
00688 48890c16                       mov        qword ptr [rsi + rdx], rcx
0068c 0f8f3f000000                   jg         0x7fcb2c3be151
00692 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
00699 03f7                           add        esi, edi
0069b 89b424a4010000                 mov        dword ptr [rsp + 0x1a4], esi
006a2 3bb4245c010000                 cmp        esi, dword ptr [rsp + 0x15c]
006a9 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
006b3 b958040000                     mov        ecx, 0x458
006b8 7e05                           jle        0x7fcb2c3be13f
006ba b948040000                     mov        ecx, 0x448
006bf 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
006c3 4d8d4901                       lea        r9, [r9 + 1]
006c7 4c890c0a                       mov        qword ptr [rdx + rcx], r9
006cb 0f8e76000000                   jle        0x7fcb2c3be1c7
006d1 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
006d9 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
006e1 48be88b1421ccb7f0000           movabs     rsi, 0x7fcb1c42b188
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
00727 e8b4d65307                     call       0x7fcb338fb860
0072c 0f1f840024080001               nop        dword ptr [rax + rax + 0x1000824]
00734 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
0073b 03b4247c010000                 add        esi, dword ptr [rsp + 0x17c]
00742 e9a1310000                     jmp        0x7fcb2c3c1368
00747 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
0074f 83ff10                         cmp        edi, 0x10
00752 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
0075c b968040000                     mov        ecx, 0x468
00761 7f05                           jg         0x7fcb2c3be1e8
00763 b978040000                     mov        ecx, 0x478
00768 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0076c 4d8d4901                       lea        r9, [r9 + 1]
00770 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00774 0f8f470a0000                   jg         0x7fcb2c3bec41
0077a 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
00784 4883828804000001               add        qword ptr [rdx + 0x488], 1
0078c 48ba080a131ccb7f0000           movabs     rdx, 0x7fcb1c130a08
00796 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00799 83c102                         add        ecx, 2
0079c 894a70                         mov        dword ptr [rdx + 0x70], ecx
0079f 81e1feff1f00                   and        ecx, 0x1ffffe
007a5 85c9                           test       ecx, ecx
007a7 0f8451360000                   je         0x7fcb2c3c187e
007ad 48ba58936de200000000           movabs     rdx, 0xe26d9358
007b7 48b9080a131ccb7f0000           movabs     rcx, 0x7fcb1c130a08
007c1 8b12                           mov        edx, dword ptr [rdx]
007c3 c1ea0d                         shr        edx, 0xd
007c6 48c1e20a                       shl        rdx, 0xa
007ca 41ba00000036                   mov        r10d, 0x36000000
007d0 4903d2                         add        rdx, r10
007d3 41ba16000000                   mov        r10d, 0x16
007d9 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
007dd 7436                           je         0x7fcb2c3be295
007df 4983c202                       add        r10, 2
007e3 4983fa1a                       cmp        r10, 0x1a
007e7 75f0                           jne        0x7fcb2c3be259
007e9 41ba16000000                   mov        r10d, 0x16
007ef 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
007f4 7412                           je         0x7fcb2c3be288
007f6 4983c202                       add        r10, 2
007fa 4983fa1a                       cmp        r10, 0x1a
007fe 75ef                           jne        0x7fcb2c3be26f
00800 41ba15000000                   mov        r10d, 0x15
00806 eb11                           jmp        0x7fcb2c3be299
00808 50                             push       rax
00809 4833c0                         xor        rax, rax
0080c f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
00812 58                             pop        rax
00813 ebbe                           jmp        0x7fcb2c3be253
00815 4983c201                       add        r10, 1
00819 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0081e 48ba080a131ccb7f0000           movabs     rdx, 0x7fcb1c130a08
00828 488382d800000001               add        qword ptr [rdx + 0xd8], 1
00830 48ba6000131ccb7f0000           movabs     rdx, 0x7fcb1c130060
0083a 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0083d 83c102                         add        ecx, 2
00840 894a70                         mov        dword ptr [rdx + 0x70], ecx
00843 81e1feff1f00                   and        ecx, 0x1ffffe
00849 85c9                           test       ecx, ecx
0084b 0f84ce350000                   je         0x7fcb2c3c189f
00851 448bac2490010000               mov        r13d, dword ptr [rsp + 0x190]
00859 48ba6000131ccb7f0000           movabs     rdx, 0x7fcb1c130060
00863 4883820801000001               add        qword ptr [rdx + 0x108], 1
0086b 8b942464010000                 mov        edx, dword ptr [rsp + 0x164]
00872 83ea0f                         sub        edx, 0xf
00875 48b930f7121ccb7f0000           movabs     rcx, 0x7fcb1c12f730
0087f 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00883 4183c102                       add        r9d, 2
00887 44894970                       mov        dword ptr [rcx + 0x70], r9d
0088b 4181e1feff1f00                 and        r9d, 0x1ffffe
00892 4585c9                         test       r9d, r9d
00895 0f84a5350000                   je         0x7fcb2c3c18c0
0089b 48b930f7121ccb7f0000           movabs     rcx, 0x7fcb1c12f730
008a5 488381a800000001               add        qword ptr [rcx + 0xa8], 1
008ad 48b90000000000000000           movabs     rcx, 0
008b7 b900000000                     mov        ecx, 0
008bc 443be9                         cmp        r13d, ecx
008bf 0f8c9c350000                   jl         0x7fcb2c3c18e1
008c5 443bea                         cmp        r13d, edx
008c8 0f8da0350000                   jge        0x7fcb2c3c18ee
008ce 498bd5                         mov        rdx, r13
008d1 89942494010000                 mov        dword ptr [rsp + 0x194], edx
008d8 48b958936de200000000           movabs     rcx, 0xe26d9358
008e2 4c8bc9                         mov        r9, rcx
008e5 49be080a131ccb7f0000           movabs     r14, 0x7fcb1c130a08
008ef 458b09                         mov        r9d, dword ptr [r9]
008f2 41c1e90d                       shr        r9d, 0xd
008f6 49c1e10a                       shl        r9, 0xa
008fa 41ba00000036                   mov        r10d, 0x36000000
00900 4d03ca                         add        r9, r10
00903 41ba24000000                   mov        r10d, 0x24
00909 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
0090d 7436                           je         0x7fcb2c3be3c5
0090f 4983c202                       add        r10, 2
00913 4983fa28                       cmp        r10, 0x28
00917 75f0                           jne        0x7fcb2c3be389
00919 41ba24000000                   mov        r10d, 0x24
0091f 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
00924 7412                           je         0x7fcb2c3be3b8
00926 4983c202                       add        r10, 2
0092a 4983fa28                       cmp        r10, 0x28
0092e 75ef                           jne        0x7fcb2c3be39f
00930 41ba23000000                   mov        r10d, 0x23
00936 eb11                           jmp        0x7fcb2c3be3c9
00938 50                             push       rax
00939 4833c0                         xor        rax, rax
0093c f04f0fb10cd6                   lock cmpxchg qword ptr [r14 + r10*8], r9
00942 58                             pop        rax
00943 ebbe                           jmp        0x7fcb2c3be383
00945 4983c201                       add        r10, 1
00949 4b8304d601                     add        qword ptr [r14 + r10*8], 1
0094e 48ba30f8121ccb7f0000           movabs     rdx, 0x7fcb1c12f830
00958 448b4a70                       mov        r9d, dword ptr [rdx + 0x70]
0095c 4183c102                       add        r9d, 2
00960 44894a70                       mov        dword ptr [rdx + 0x70], r9d
00964 4181e1feff1f00                 and        r9d, 0x1ffffe
0096b 4585c9                         test       r9d, r9d
0096e 0f8407350000                   je         0x7fcb2c3c18fb
00974 48ba30f8121ccb7f0000           movabs     rdx, 0x7fcb1c12f830
0097e 488382a800000001               add        qword ptr [rdx + 0xa8], 1
00986 48ba58f9121ccb7f0000           movabs     rdx, 0x7fcb1c12f958
00990 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00993 83c102                         add        ecx, 2
00996 894a70                         mov        dword ptr [rdx + 0x70], ecx
00999 81e1feff1f00                   and        ecx, 0x1ffffe
0099f 85c9                           test       ecx, ecx
009a1 0f84f5340000                   je         0x7fcb2c3c191c
009a7 48ba58f9121ccb7f0000           movabs     rdx, 0x7fcb1c12f958
009b1 ff82b8000000                   inc        dword ptr [rdx + 0xb8]
009b7 8b942494010000                 mov        edx, dword ptr [rsp + 0x194]
009be 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
009c5 4489ac2490010000               mov        dword ptr [rsp + 0x190], r13d
009cd 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
009d5 488b9c2468010000               mov        rbx, qword ptr [rsp + 0x168]
009dd 48b950136ee200000000           movabs     rcx, 0xe26e1350
009e7 4c8bc9                         mov        r9, rcx
009ea 48b8080a131ccb7f0000           movabs     rax, 0x7fcb1c130a08
009f4 4883805801000001               add        qword ptr [rax + 0x158], 1
009fc 49b9d00b131ccb7f0000           movabs     r9, 0x7fcb1c130bd0
00a06 418b4170                       mov        eax, dword ptr [r9 + 0x70]
00a0a 83c002                         add        eax, 2
00a0d 41894170                       mov        dword ptr [r9 + 0x70], eax
00a11 25feff1f00                     and        eax, 0x1ffffe
00a16 85c0                           test       eax, eax
00a18 0f849f340000                   je         0x7fcb2c3c193d
00a1e 4c8bc9                         mov        r9, rcx
00a21 48b8d00b131ccb7f0000           movabs     rax, 0x7fcb1c130bd0
00a2b 488380a800000001               add        qword ptr [rax + 0xa8], 1
00a33 49b9b00c131ccb7f0000           movabs     r9, 0x7fcb1c130cb0
00a3d 418b4170                       mov        eax, dword ptr [r9 + 0x70]
00a41 83c002                         add        eax, 2
00a44 41894170                       mov        dword ptr [r9 + 0x70], eax
00a48 25feff1f00                     and        eax, 0x1ffffe
00a4d 85c0                           test       eax, eax
00a4f 0f8489340000                   je         0x7fcb2c3c195e
00a55 49b9b00c131ccb7f0000           movabs     r9, 0x7fcb1c130cb0
00a5f 498381b800000001               add        qword ptr [r9 + 0xb8], 1
00a67 48b9d801131ccb7f0000           movabs     rcx, 0x7fcb1c1301d8
00a71 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00a75 4183c102                       add        r9d, 2
00a79 44894970                       mov        dword ptr [rcx + 0x70], r9d
00a7d 4181e1feff1f00                 and        r9d, 0x1ffffe
00a84 4585c9                         test       r9d, r9d
00a87 0f8472340000                   je         0x7fcb2c3c197f
00a8d 48b958936de200000000           movabs     rcx, 0xe26d9358
00a97 4c8bc9                         mov        r9, rcx
00a9a 48b8b00c131ccb7f0000           movabs     rax, 0x7fcb1c130cb0
00aa4 458b09                         mov        r9d, dword ptr [r9]
00aa7 41c1e90d                       shr        r9d, 0xd
00aab 49c1e10a                       shl        r9, 0xa
00aaf 41ba00000036                   mov        r10d, 0x36000000
00ab5 4d03ca                         add        r9, r10
00ab8 41ba1c000000                   mov        r10d, 0x1c
00abe 4e3b0cd0                       cmp        r9, qword ptr [rax + r10*8]
00ac2 743c                           je         0x7fcb2c3be580
00ac4 4983c202                       add        r10, 2
00ac8 4983fa20                       cmp        r10, 0x20
00acc 75f0                           jne        0x7fcb2c3be53e
00ace 41ba1c000000                   mov        r10d, 0x1c
00ad4 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
00ad9 7412                           je         0x7fcb2c3be56d
00adb 4983c202                       add        r10, 2
00adf 4983fa20                       cmp        r10, 0x20
00ae3 75ef                           jne        0x7fcb2c3be554
00ae5 41ba1b000000                   mov        r10d, 0x1b
00aeb eb17                           jmp        0x7fcb2c3be584
00aed 53                             push       rbx
00aee 488bd8                         mov        rbx, rax
00af1 4833c0                         xor        rax, rax
00af4 f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
00afa 488bc3                         mov        rax, rbx
00afd 5b                             pop        rbx
00afe ebb8                           jmp        0x7fcb2c3be538
00b00 4983c201                       add        r10, 1
00b04 4a8304d001                     add        qword ptr [rax + r10*8], 1
00b09 49b9b00c131ccb7f0000           movabs     r9, 0x7fcb1c130cb0
00b13 8b09                           mov        ecx, dword ptr [rcx]
00b15 c1e90d                         shr        ecx, 0xd
00b18 48c1e10a                       shl        rcx, 0xa
00b1c 41ba00000036                   mov        r10d, 0x36000000
00b22 4903ca                         add        rcx, r10
00b25 41ba22000000                   mov        r10d, 0x22
00b2b 4b3b0cd1                       cmp        rcx, qword ptr [r9 + r10*8]
00b2f 7436                           je         0x7fcb2c3be5e7
00b31 4983c202                       add        r10, 2
00b35 4983fa26                       cmp        r10, 0x26
00b39 75f0                           jne        0x7fcb2c3be5ab
00b3b 41ba22000000                   mov        r10d, 0x22
00b41 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
00b46 7412                           je         0x7fcb2c3be5da
00b48 4983c202                       add        r10, 2
00b4c 4983fa26                       cmp        r10, 0x26
00b50 75ef                           jne        0x7fcb2c3be5c1
00b52 41ba21000000                   mov        r10d, 0x21
00b58 eb11                           jmp        0x7fcb2c3be5eb
00b5a 50                             push       rax
00b5b 4833c0                         xor        rax, rax
00b5e f04b0fb10cd1                   lock cmpxchg qword ptr [r9 + r10*8], rcx
00b64 58                             pop        rax
00b65 ebbe                           jmp        0x7fcb2c3be5a5
00b67 4983c201                       add        r10, 1
00b6b 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00b70 48b9b00c131ccb7f0000           movabs     rcx, 0x7fcb1c130cb0
00b7a 4883813801000001               add        qword ptr [rcx + 0x138], 1
00b82 48b99802131ccb7f0000           movabs     rcx, 0x7fcb1c130298
00b8c 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00b90 4183c102                       add        r9d, 2
00b94 44894970                       mov        dword ptr [rcx + 0x70], r9d
00b98 4181e1feff1f00                 and        r9d, 0x1ffffe
00b9f 4585c9                         test       r9d, r9d
00ba2 0f8478330000                   je         0x7fcb2c3c19a0
00ba8 48b9b00c131ccb7f0000           movabs     rcx, 0x7fcb1c130cb0
00bb2 4883814801000001               add        qword ptr [rcx + 0x148], 1
00bba 4863c2                         movsxd     rax, edx
00bbd ba08000000                     mov        edx, 8
00bc2 4c8bc8                         mov        r9, rax
00bc5 4c03ca                         add        r9, rdx
00bc8 48ba80f4121ccb7f0000           movabs     rdx, 0x7fcb1c12f480
00bd2 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00bd5 83c102                         add        ecx, 2
00bd8 894a70                         mov        dword ptr [rdx + 0x70], ecx
00bdb 81e1feff1f00                   and        ecx, 0x1ffffe
00be1 85c9                           test       ecx, ecx
00be3 0f8458330000                   je         0x7fcb2c3c19c1
00be9 48ba80f4121ccb7f0000           movabs     rdx, 0x7fcb1c12f480
00bf3 488382d800000001               add        qword ptr [rdx + 0xd8], 1
00bfb 48baf8f5121ccb7f0000           movabs     rdx, 0x7fcb1c12f5f8
00c05 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00c08 83c102                         add        ecx, 2
00c0b 894a70                         mov        dword ptr [rdx + 0x70], ecx
00c0e 81e1feff1f00                   and        ecx, 0x1ffffe
00c14 85c9                           test       ecx, ecx
00c16 0f8446330000                   je         0x7fcb2c3c19e2
00c1c 48bab00c131ccb7f0000           movabs     rdx, 0x7fcb1c130cb0
00c26 4883826801000001               add        qword ptr [rdx + 0x168], 1
00c2e 48ba206c6ee200000000           movabs     rdx, 0xe26e6c20
00c38 48bea0936de200000000           movabs     rsi, 0xe26d93a0
00c42 ba02000000                     mov        edx, 2
00c47 b910000000                     mov        ecx, 0x10
00c4c 4c8bc3                         mov        r8, rbx
00c4f bf00000000                     mov        edi, 0
00c54 48891c24                       mov        qword ptr [rsp], rbx
00c58 4889442408                     mov        qword ptr [rsp + 8], rax
00c5d 49ba58936de200000000           movabs     r10, 0xe26d9358
00c67 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00c6c 49ba206c6ee200000000           movabs     r10, 0xe26e6c20
00c76 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c7b 0f1f4000                       nop        dword ptr [rax]
00c7f e85cd15307                     call       0x7fcb338fb860
00c84 0f1f84007c0d0002               nop        dword ptr [rax + rax + 0x2000d7c]
00c8c 4885c0                         test       rax, rax
00c8f 48bbb00c131ccb7f0000           movabs     rbx, 0x7fcb1c130cb0
00c99 750c                           jne        0x7fcb2c3be727
00c9b 808b7101000001                 or         byte ptr [rbx + 0x171], 1
00ca2 e988000000                     jmp        0x7fcb2c3be7af
00ca7 8b38                           mov        edi, dword ptr [rax]
00ca9 c1ef0d                         shr        edi, 0xd
00cac 48c1e70a                       shl        rdi, 0xa
00cb0 41ba00000036                   mov        r10d, 0x36000000
00cb6 4903fa                         add        rdi, r10
00cb9 41ba30000000                   mov        r10d, 0x30
00cbf 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
00cc3 7436                           je         0x7fcb2c3be77b
00cc5 4983c202                       add        r10, 2
00cc9 4983fa34                       cmp        r10, 0x34
00ccd 75f0                           jne        0x7fcb2c3be73f
00ccf 41ba30000000                   mov        r10d, 0x30
00cd5 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00cda 7412                           je         0x7fcb2c3be76e
00cdc 4983c202                       add        r10, 2
00ce0 4983fa34                       cmp        r10, 0x34
00ce4 75ef                           jne        0x7fcb2c3be755
00ce6 41ba2f000000                   mov        r10d, 0x2f
00cec eb11                           jmp        0x7fcb2c3be77f
00cee 50                             push       rax
00cef 4833c0                         xor        rax, rax
00cf2 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
00cf8 58                             pop        rax
00cf9 ebbe                           jmp        0x7fcb2c3be739
00cfb 4983c201                       add        r10, 1
00cff 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00d04 48bf0080003700000000           movabs     rdi, 0x37008000
00d0e 8b18                           mov        ebx, dword ptr [rax]
00d10 c1eb0d                         shr        ebx, 0xd
00d13 48c1e30a                       shl        rbx, 0xa
00d17 41ba00000036                   mov        r10d, 0x36000000
00d1d 4903da                         add        rbx, r10
00d20 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
00d24 0f8559320000                   jne        0x7fcb2c3c1a03
00d2a e900000000                     jmp        0x7fcb2c3be7af
00d2f 488bf8                         mov        rdi, rax
00d32 4889bc24b0010000               mov        qword ptr [rsp + 0x1b0], rdi
00d3a 483b07                         cmp        rax, qword ptr [rdi]
00d3d 488bf7                         mov        rsi, rdi
00d40 48bb88b1421ccb7f0000           movabs     rbx, 0x7fcb1c42b188
00d4a 8b36                           mov        esi, dword ptr [rsi]
00d4c c1ee0d                         shr        esi, 0xd
00d4f 48c1e60a                       shl        rsi, 0xa
00d53 41ba00000036                   mov        r10d, 0x36000000
00d59 4903f2                         add        rsi, r10
00d5c 41ba94000000                   mov        r10d, 0x94
00d62 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00d66 743c                           je         0x7fcb2c3be824
00d68 4983c202                       add        r10, 2
00d6c 4981fa98000000                 cmp        r10, 0x98
00d73 75ed                           jne        0x7fcb2c3be7e2
00d75 41ba94000000                   mov        r10d, 0x94
00d7b 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00d80 7415                           je         0x7fcb2c3be817
00d82 4983c202                       add        r10, 2
00d86 4981fa98000000                 cmp        r10, 0x98
00d8d 75ec                           jne        0x7fcb2c3be7fb
00d8f 41ba93000000                   mov        r10d, 0x93
00d95 eb11                           jmp        0x7fcb2c3be828
00d97 50                             push       rax
00d98 4833c0                         xor        rax, rax
00d9b f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00da1 58                             pop        rax
00da2 ebb8                           jmp        0x7fcb2c3be7dc
00da4 4983c201                       add        r10, 1
00da8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00dad 48bec816131ccb7f0000           movabs     rsi, 0x7fcb1c1316c8
00db7 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
00dba 83c302                         add        ebx, 2
00dbd 895e70                         mov        dword ptr [rsi + 0x70], ebx
00dc0 81e3feff1f00                   and        ebx, 0x1ffffe
00dc6 85db                           test       ebx, ebx
00dc8 0f84c3310000                   je         0x7fcb2c3c1a11
00dce 488bf7                         mov        rsi, rdi
00dd1 48bbc816131ccb7f0000           movabs     rbx, 0x7fcb1c1316c8
00ddb 8b36                           mov        esi, dword ptr [rsi]
00ddd c1ee0d                         shr        esi, 0xd
00de0 48c1e60a                       shl        rsi, 0xa
00de4 41ba00000036                   mov        r10d, 0x36000000
00dea 4903f2                         add        rsi, r10
00ded 41ba16000000                   mov        r10d, 0x16
00df3 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00df7 7436                           je         0x7fcb2c3be8af
00df9 4983c202                       add        r10, 2
00dfd 4983fa1a                       cmp        r10, 0x1a
00e01 75f0                           jne        0x7fcb2c3be873
00e03 41ba16000000                   mov        r10d, 0x16
00e09 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00e0e 7412                           je         0x7fcb2c3be8a2
00e10 4983c202                       add        r10, 2
00e14 4983fa1a                       cmp        r10, 0x1a
00e18 75ef                           jne        0x7fcb2c3be889
00e1a 41ba15000000                   mov        r10d, 0x15
00e20 eb11                           jmp        0x7fcb2c3be8b3
00e22 50                             push       rax
00e23 4833c0                         xor        rax, rax
00e26 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00e2c 58                             pop        rax
00e2d ebbe                           jmp        0x7fcb2c3be86d
00e2f 4983c201                       add        r10, 1
00e33 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00e38 488bf7                         mov        rsi, rdi
00e3b 6690                           nop        
00e3d 48b870f61308cb7f0000           movabs     rax, 0x7fcb0813f670
00e47 e894ca5307                     call       0x7fcb338fb360
00e4c 0f1f8400440f0003               nop        dword ptr [rax + rax + 0x3000f44]
00e54 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
00e5c 8b7704                         mov        esi, dword ptr [rdi + 4]
00e5f 48bbc816131ccb7f0000           movabs     rbx, 0x7fcb1c1316c8
00e69 488383d800000001               add        qword ptr [rbx + 0xd8], 1
00e71 48bb6000131ccb7f0000           movabs     rbx, 0x7fcb1c130060
00e7b 8b5370                         mov        edx, dword ptr [rbx + 0x70]
00e7e 83c202                         add        edx, 2
00e81 895370                         mov        dword ptr [rbx + 0x70], edx
00e84 81e2feff1f00                   and        edx, 0x1ffffe
00e8a 85d2                           test       edx, edx
00e8c 0f8425310000                   je         0x7fcb2c3c1a37
00e92 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
00e9a 48bb6000131ccb7f0000           movabs     rbx, 0x7fcb1c130060
00ea4 4883830801000001               add        qword ptr [rbx + 0x108], 1
00eac ffc8                           dec        eax
00eae 2bf0                           sub        esi, eax
00eb0 48bb30f7121ccb7f0000           movabs     rbx, 0x7fcb1c12f730
00eba 8b4370                         mov        eax, dword ptr [rbx + 0x70]
00ebd 83c002                         add        eax, 2
00ec0 894370                         mov        dword ptr [rbx + 0x70], eax
00ec3 25feff1f00                     and        eax, 0x1ffffe
00ec8 85c0                           test       eax, eax
00eca 0f8408310000                   je         0x7fcb2c3c1a58
00ed0 48bb30f7121ccb7f0000           movabs     rbx, 0x7fcb1c12f730
00eda 488383a800000001               add        qword ptr [rbx + 0xa8], 1
00ee2 48bb0000000000000000           movabs     rbx, 0
00eec bb00000000                     mov        ebx, 0
00ef1 443bdb                         cmp        r11d, ebx
00ef4 0f8cff300000                   jl         0x7fcb2c3c1a79
00efa 443bde                         cmp        r11d, esi
00efd 0f8d03310000                   jge        0x7fcb2c3c1a86
00f03 498bdb                         mov        rbx, r11
00f06 899c24ac010000                 mov        dword ptr [rsp + 0x1ac], ebx
00f0d 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
00f15 488bbc24b0010000               mov        rdi, qword ptr [rsp + 0x1b0]
00f1d 488bf7                         mov        rsi, rdi
00f20 48bac816131ccb7f0000           movabs     rdx, 0x7fcb1c1316c8
00f2a 8b36                           mov        esi, dword ptr [rsi]
00f2c c1ee0d                         shr        esi, 0xd
00f2f 48c1e60a                       shl        rsi, 0xa
00f33 41ba00000036                   mov        r10d, 0x36000000
00f39 4903f2                         add        rsi, r10
00f3c 41ba1e000000                   mov        r10d, 0x1e
00f42 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
00f46 7436                           je         0x7fcb2c3be9fe
00f48 4983c202                       add        r10, 2
00f4c 4983fa22                       cmp        r10, 0x22
00f50 75f0                           jne        0x7fcb2c3be9c2
00f52 41ba1e000000                   mov        r10d, 0x1e
00f58 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
00f5d 7412                           je         0x7fcb2c3be9f1
00f5f 4983c202                       add        r10, 2
00f63 4983fa22                       cmp        r10, 0x22
00f67 75ef                           jne        0x7fcb2c3be9d8
00f69 41ba1d000000                   mov        r10d, 0x1d
00f6f eb11                           jmp        0x7fcb2c3bea02
00f71 50                             push       rax
00f72 4833c0                         xor        rax, rax
00f75 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
00f7b 58                             pop        rax
00f7c ebbe                           jmp        0x7fcb2c3be9bc
00f7e 4983c201                       add        r10, 1
00f82 4a8304d201                     add        qword ptr [rdx + r10*8], 1
00f87 488bf7                         mov        rsi, rdi
00f8a 666690                         nop        
00f8d 48b898f61308cb7f0000           movabs     rax, 0x7fcb0813f698
00f97 e844c95307                     call       0x7fcb338fb360
00f9c 0f1f840094100004               nop        dword ptr [rax + rax + 0x4001094]
00fa4 483b00                         cmp        rax, qword ptr [rax]
00fa7 488bf0                         mov        rsi, rax
00faa 48bac816131ccb7f0000           movabs     rdx, 0x7fcb1c1316c8
00fb4 8b36                           mov        esi, dword ptr [rsi]
00fb6 c1ee0d                         shr        esi, 0xd
00fb9 48c1e60a                       shl        rsi, 0xa
00fbd 41ba00000036                   mov        r10d, 0x36000000
00fc3 4903f2                         add        rsi, r10
00fc6 41ba24000000                   mov        r10d, 0x24
00fcc 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
00fd0 7436                           je         0x7fcb2c3bea88
00fd2 4983c202                       add        r10, 2
00fd6 4983fa28                       cmp        r10, 0x28
00fda 75f0                           jne        0x7fcb2c3bea4c
00fdc 41ba24000000                   mov        r10d, 0x24
00fe2 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
00fe7 7412                           je         0x7fcb2c3bea7b
00fe9 4983c202                       add        r10, 2
00fed 4983fa28                       cmp        r10, 0x28
00ff1 75ef                           jne        0x7fcb2c3bea62
00ff3 41ba23000000                   mov        r10d, 0x23
00ff9 eb11                           jmp        0x7fcb2c3bea8c
00ffb 50                             push       rax
00ffc 4833c0                         xor        rax, rax
00fff f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01005 58                             pop        rax
01006 ebbe                           jmp        0x7fcb2c3bea46
01008 4983c201                       add        r10, 1
0100c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01011 8b7024                         mov        esi, dword ptr [rax + 0x24]
01014 488bd0                         mov        rdx, rax
01017 48b9c816131ccb7f0000           movabs     rcx, 0x7fcb1c1316c8
01021 8b12                           mov        edx, dword ptr [rdx]
01023 c1ea0d                         shr        edx, 0xd
01026 48c1e20a                       shl        rdx, 0xa
0102a 41ba00000036                   mov        r10d, 0x36000000
01030 4903d2                         add        rdx, r10
01033 41ba2a000000                   mov        r10d, 0x2a
01039 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0103d 7436                           je         0x7fcb2c3beaf5
0103f 4983c202                       add        r10, 2
01043 4983fa2e                       cmp        r10, 0x2e
01047 75f0                           jne        0x7fcb2c3beab9
01049 41ba2a000000                   mov        r10d, 0x2a
0104f 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01054 7412                           je         0x7fcb2c3beae8
01056 4983c202                       add        r10, 2
0105a 4983fa2e                       cmp        r10, 0x2e
0105e 75ef                           jne        0x7fcb2c3beacf
01060 41ba29000000                   mov        r10d, 0x29
01066 eb11                           jmp        0x7fcb2c3beaf9
01068 50                             push       rax
01069 4833c0                         xor        rax, rax
0106c f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
01072 58                             pop        rax
01073 ebbe                           jmp        0x7fcb2c3beab3
01075 4983c201                       add        r10, 1
01079 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0107e 8b4804                         mov        ecx, dword ptr [rax + 4]
01081 48bac816131ccb7f0000           movabs     rdx, 0x7fcb1c1316c8
0108b 4883827801000001               add        qword ptr [rdx + 0x178], 1
01093 48ba9802131ccb7f0000           movabs     rdx, 0x7fcb1c130298
0109d 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
010a1 4183c002                       add        r8d, 2
010a5 44894270                       mov        dword ptr [rdx + 0x70], r8d
010a9 4181e0feff1f00                 and        r8d, 0x1ffffe
010b0 4585c0                         test       r8d, r8d
010b3 0f845f2f0000                   je         0x7fcb2c3c1a98
010b9 48bac816131ccb7f0000           movabs     rdx, 0x7fcb1c1316c8
010c3 4883828801000001               add        qword ptr [rdx + 0x188], 1
010cb 8b9c24ac010000                 mov        ebx, dword ptr [rsp + 0x1ac]
010d2 4863db                         movsxd     rbx, ebx
010d5 ba08000000                     mov        edx, 8
010da 4c8bcb                         mov        r9, rbx
010dd 4c03ca                         add        r9, rdx
010e0 48ba80f4121ccb7f0000           movabs     rdx, 0x7fcb1c12f480
010ea 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
010ee 4183c002                       add        r8d, 2
010f2 44894270                       mov        dword ptr [rdx + 0x70], r8d
010f6 4181e0feff1f00                 and        r8d, 0x1ffffe
010fd 4585c0                         test       r8d, r8d
01100 0f84332f0000                   je         0x7fcb2c3c1ab9
01106 48ba80f4121ccb7f0000           movabs     rdx, 0x7fcb1c12f480
01110 488382d800000001               add        qword ptr [rdx + 0xd8], 1
01118 48baf8f5121ccb7f0000           movabs     rdx, 0x7fcb1c12f5f8
01122 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01126 4183c002                       add        r8d, 2
0112a 44894270                       mov        dword ptr [rdx + 0x70], r8d
0112e 4181e0feff1f00                 and        r8d, 0x1ffffe
01135 4585c0                         test       r8d, r8d
01138 0f841c2f0000                   je         0x7fcb2c3c1ada
0113e 48bac816131ccb7f0000           movabs     rdx, 0x7fcb1c1316c8
01148 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
01150 48ba080a6fe200000000           movabs     rdx, 0xe26f0a08
0115a ba02000000                     mov        edx, 2
0115f 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
01167 bf00000000                     mov        edi, 0
0116c 488b8424b0010000               mov        rax, qword ptr [rsp + 0x1b0]
01174 48890424                       mov        qword ptr [rsp], rax
01178 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
01180 4889442408                     mov        qword ptr [rsp + 8], rax
01185 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
0118a 49ba080a6fe200000000           movabs     r10, 0xe26f0a08
01194 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01199 660f1f440000                   nop        word ptr [rax + rax]
0119f e83ccc5307                     call       0x7fcb338fb860
011a4 0f1f84009c120005               nop        dword ptr [rax + rax + 0x500129c]
011ac 48be88b1421ccb7f0000           movabs     rsi, 0x7fcb1c42b188
011b6 ff86c8040000                   inc        dword ptr [rsi + 0x4c8]
011bc e9dd0b0000                     jmp        0x7fcb2c3bf81e
011c1 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
011c8 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
011d0 83ff30                         cmp        edi, 0x30
011d3 48be88b1421ccb7f0000           movabs     rsi, 0x7fcb1c42b188
011dd bae0040000                     mov        edx, 0x4e0
011e2 7f05                           jg         0x7fcb2c3bec69
011e4 baf0040000                     mov        edx, 0x4f0
011e9 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
011ed 488d4901                       lea        rcx, [rcx + 1]
011f1 48890c16                       mov        qword ptr [rsi + rdx], rcx
011f5 0f8ffe0a0000                   jg         0x7fcb2c3bf779
011fb 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
01202 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
0120a 660f1f440000                   nop        word ptr [rax + rax]
01210 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
01218 8b842464010000                 mov        eax, dword ptr [rsp + 0x164]
0121f 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
01227 48b988b1421ccb7f0000           movabs     rcx, 0x7fcb1c42b188
01231 4883810005000001               add        qword ptr [rcx + 0x500], 1
01239 48b9080a131ccb7f0000           movabs     rcx, 0x7fcb1c130a08
01243 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
01247 4183c002                       add        r8d, 2
0124b 44894170                       mov        dword ptr [rcx + 0x70], r8d
0124f 4181e0feff1f00                 and        r8d, 0x1ffffe
01256 4585c0                         test       r8d, r8d
01259 0f841c2e0000                   je         0x7fcb2c3c1afb
0125f 48b958936de200000000           movabs     rcx, 0xe26d9358
01269 49b8080a131ccb7f0000           movabs     r8, 0x7fcb1c130a08
01273 8b09                           mov        ecx, dword ptr [rcx]
01275 c1e90d                         shr        ecx, 0xd
01278 48c1e10a                       shl        rcx, 0xa
0127c 41ba00000036                   mov        r10d, 0x36000000
01282 4903ca                         add        rcx, r10
01285 41ba16000000                   mov        r10d, 0x16
0128b 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0128f 7436                           je         0x7fcb2c3bed47
01291 4983c202                       add        r10, 2
01295 4983fa1a                       cmp        r10, 0x1a
01299 75f0                           jne        0x7fcb2c3bed0b
0129b 41ba16000000                   mov        r10d, 0x16
012a1 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
012a6 7412                           je         0x7fcb2c3bed3a
012a8 4983c202                       add        r10, 2
012ac 4983fa1a                       cmp        r10, 0x1a
012b0 75ef                           jne        0x7fcb2c3bed21
012b2 41ba15000000                   mov        r10d, 0x15
012b8 eb11                           jmp        0x7fcb2c3bed4b
012ba 50                             push       rax
012bb 4833c0                         xor        rax, rax
012be f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
012c4 58                             pop        rax
012c5 ebbe                           jmp        0x7fcb2c3bed05
012c7 4983c201                       add        r10, 1
012cb 4b8304d001                     add        qword ptr [r8 + r10*8], 1
012d0 48b9080a131ccb7f0000           movabs     rcx, 0x7fcb1c130a08
012da 488381d800000001               add        qword ptr [rcx + 0xd8], 1
012e2 48b96000131ccb7f0000           movabs     rcx, 0x7fcb1c130060
012ec 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
012f0 4183c002                       add        r8d, 2
012f4 44894170                       mov        dword ptr [rcx + 0x70], r8d
012f8 4181e0feff1f00                 and        r8d, 0x1ffffe
012ff 4585c0                         test       r8d, r8d
01302 0f84942d0000                   je         0x7fcb2c3c1b1c
01308 48b96000131ccb7f0000           movabs     rcx, 0x7fcb1c130060
01312 4883810801000001               add        qword ptr [rcx + 0x108], 1
0131a 488bc8                         mov        rcx, rax
0131d 83e90f                         sub        ecx, 0xf
01320 49b830f7121ccb7f0000           movabs     r8, 0x7fcb1c12f730
0132a 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
0132e 4183c102                       add        r9d, 2
01332 45894870                       mov        dword ptr [r8 + 0x70], r9d
01336 4181e1feff1f00                 and        r9d, 0x1ffffe
0133d 4585c9                         test       r9d, r9d
01340 0f84772d0000                   je         0x7fcb2c3c1b3d
01346 49b830f7121ccb7f0000           movabs     r8, 0x7fcb1c12f730
01350 498380a800000001               add        qword ptr [r8 + 0xa8], 1
01358 49b80000000000000000           movabs     r8, 0
01362 41b800000000                   mov        r8d, 0
01368 413bf0                         cmp        esi, r8d
0136b 0f8c6d2d0000                   jl         0x7fcb2c3c1b5e
01371 3bf1                           cmp        esi, ecx
01373 0f8d722d0000                   jge        0x7fcb2c3c1b6b
01379 488bce                         mov        rcx, rsi
0137c 898c24b8010000                 mov        dword ptr [rsp + 0x1b8], ecx
01383 49b858936de200000000           movabs     r8, 0xe26d9358
0138d 4d8bc8                         mov        r9, r8
01390 49be080a131ccb7f0000           movabs     r14, 0x7fcb1c130a08
0139a 458b09                         mov        r9d, dword ptr [r9]
0139d 41c1e90d                       shr        r9d, 0xd
013a1 49c1e10a                       shl        r9, 0xa
013a5 41ba00000036                   mov        r10d, 0x36000000
013ab 4d03ca                         add        r9, r10
013ae 41ba24000000                   mov        r10d, 0x24
013b4 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
013b8 7436                           je         0x7fcb2c3bee70
013ba 4983c202                       add        r10, 2
013be 4983fa28                       cmp        r10, 0x28
013c2 75f0                           jne        0x7fcb2c3bee34
013c4 41ba24000000                   mov        r10d, 0x24
013ca 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
013cf 7412                           je         0x7fcb2c3bee63
013d1 4983c202                       add        r10, 2
013d5 4983fa28                       cmp        r10, 0x28
013d9 75ef                           jne        0x7fcb2c3bee4a
013db 41ba23000000                   mov        r10d, 0x23
013e1 eb11                           jmp        0x7fcb2c3bee74
013e3 50                             push       rax
013e4 4833c0                         xor        rax, rax
013e7 f04f0fb10cd6                   lock cmpxchg qword ptr [r14 + r10*8], r9
013ed 58                             pop        rax
013ee ebbe                           jmp        0x7fcb2c3bee2e
013f0 4983c201                       add        r10, 1
013f4 4b8304d601                     add        qword ptr [r14 + r10*8], 1
013f9 48b930f8121ccb7f0000           movabs     rcx, 0x7fcb1c12f830
01403 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
01407 4183c102                       add        r9d, 2
0140b 44894970                       mov        dword ptr [rcx + 0x70], r9d
0140f 4181e1feff1f00                 and        r9d, 0x1ffffe
01416 4585c9                         test       r9d, r9d
01419 0f84d92c0000                   je         0x7fcb2c3c1b78
0141f 48b930f8121ccb7f0000           movabs     rcx, 0x7fcb1c12f830
01429 488381a800000001               add        qword ptr [rcx + 0xa8], 1
01431 48b958f9121ccb7f0000           movabs     rcx, 0x7fcb1c12f958
0143b 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
0143f 4183c002                       add        r8d, 2
01443 44894170                       mov        dword ptr [rcx + 0x70], r8d
01447 4181e0feff1f00                 and        r8d, 0x1ffffe
0144e 4585c0                         test       r8d, r8d
01451 0f84c22c0000                   je         0x7fcb2c3c1b99
01457 48b958f9121ccb7f0000           movabs     rcx, 0x7fcb1c12f958
01461 ff81b8000000                   inc        dword ptr [rcx + 0xb8]
01467 8b8c24b8010000                 mov        ecx, dword ptr [rsp + 0x1b8]
0146e 89b424c0010000                 mov        dword ptr [rsp + 0x1c0], esi
01475 49b850136ee200000000           movabs     r8, 0xe26e1350
0147f 4d8bc8                         mov        r9, r8
01482 49be080a131ccb7f0000           movabs     r14, 0x7fcb1c130a08
0148c 4983865801000001               add        qword ptr [r14 + 0x158], 1
01494 49b9d00b131ccb7f0000           movabs     r9, 0x7fcb1c130bd0
0149e 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
014a2 83c302                         add        ebx, 2
014a5 41895970                       mov        dword ptr [r9 + 0x70], ebx
014a9 81e3feff1f00                   and        ebx, 0x1ffffe
014af 85db                           test       ebx, ebx
014b1 0f84832c0000                   je         0x7fcb2c3c1bba
014b7 4d8bc8                         mov        r9, r8
014ba 48bbd00b131ccb7f0000           movabs     rbx, 0x7fcb1c130bd0
014c4 488383a800000001               add        qword ptr [rbx + 0xa8], 1
014cc 49b9b00c131ccb7f0000           movabs     r9, 0x7fcb1c130cb0
014d6 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
014da 83c302                         add        ebx, 2
014dd 41895970                       mov        dword ptr [r9 + 0x70], ebx
014e1 81e3feff1f00                   and        ebx, 0x1ffffe
014e7 85db                           test       ebx, ebx
014e9 0f846c2c0000                   je         0x7fcb2c3c1bdb
014ef 49b9b00c131ccb7f0000           movabs     r9, 0x7fcb1c130cb0
014f9 498381b800000001               add        qword ptr [r9 + 0xb8], 1
01501 49b8d801131ccb7f0000           movabs     r8, 0x7fcb1c1301d8
0150b 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
0150f 4183c102                       add        r9d, 2
01513 45894870                       mov        dword ptr [r8 + 0x70], r9d
01517 4181e1feff1f00                 and        r9d, 0x1ffffe
0151e 4585c9                         test       r9d, r9d
01521 0f84552c0000                   je         0x7fcb2c3c1bfc
01527 49b858936de200000000           movabs     r8, 0xe26d9358
01531 4d8bc8                         mov        r9, r8
01534 48bbb00c131ccb7f0000           movabs     rbx, 0x7fcb1c130cb0
0153e 458b09                         mov        r9d, dword ptr [r9]
01541 41c1e90d                       shr        r9d, 0xd
01545 49c1e10a                       shl        r9, 0xa
01549 41ba00000036                   mov        r10d, 0x36000000
0154f 4d03ca                         add        r9, r10
01552 41ba1c000000                   mov        r10d, 0x1c
01558 4e3b0cd3                       cmp        r9, qword ptr [rbx + r10*8]
0155c 7436                           je         0x7fcb2c3bf014
0155e 4983c202                       add        r10, 2
01562 4983fa20                       cmp        r10, 0x20
01566 75f0                           jne        0x7fcb2c3befd8
01568 41ba1c000000                   mov        r10d, 0x1c
0156e 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01573 7412                           je         0x7fcb2c3bf007
01575 4983c202                       add        r10, 2
01579 4983fa20                       cmp        r10, 0x20
0157d 75ef                           jne        0x7fcb2c3befee
0157f 41ba1b000000                   mov        r10d, 0x1b
01585 eb11                           jmp        0x7fcb2c3bf018
01587 50                             push       rax
01588 4833c0                         xor        rax, rax
0158b f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
01591 58                             pop        rax
01592 ebbe                           jmp        0x7fcb2c3befd2
01594 4983c201                       add        r10, 1
01598 4a8304d301                     add        qword ptr [rbx + r10*8], 1
0159d 49b9b00c131ccb7f0000           movabs     r9, 0x7fcb1c130cb0
015a7 458b00                         mov        r8d, dword ptr [r8]
015aa 41c1e80d                       shr        r8d, 0xd
015ae 49c1e00a                       shl        r8, 0xa
015b2 41ba00000036                   mov        r10d, 0x36000000
015b8 4d03c2                         add        r8, r10
015bb 41ba22000000                   mov        r10d, 0x22
015c1 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
015c5 7436                           je         0x7fcb2c3bf07d
015c7 4983c202                       add        r10, 2
015cb 4983fa26                       cmp        r10, 0x26
015cf 75f0                           jne        0x7fcb2c3bf041
015d1 41ba22000000                   mov        r10d, 0x22
015d7 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
015dc 7412                           je         0x7fcb2c3bf070
015de 4983c202                       add        r10, 2
015e2 4983fa26                       cmp        r10, 0x26
015e6 75ef                           jne        0x7fcb2c3bf057
015e8 41ba21000000                   mov        r10d, 0x21
015ee eb11                           jmp        0x7fcb2c3bf081
015f0 50                             push       rax
015f1 4833c0                         xor        rax, rax
015f4 f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
015fa 58                             pop        rax
015fb ebbe                           jmp        0x7fcb2c3bf03b
015fd 4983c201                       add        r10, 1
01601 4b8304d101                     add        qword ptr [r9 + r10*8], 1
01606 49b8b00c131ccb7f0000           movabs     r8, 0x7fcb1c130cb0
01610 4983803801000001               add        qword ptr [r8 + 0x138], 1
01618 49b89802131ccb7f0000           movabs     r8, 0x7fcb1c130298
01622 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
01626 4183c102                       add        r9d, 2
0162a 45894870                       mov        dword ptr [r8 + 0x70], r9d
0162e 4181e1feff1f00                 and        r9d, 0x1ffffe
01635 4585c9                         test       r9d, r9d
01638 0f845f2b0000                   je         0x7fcb2c3c1c1d
0163e 49b8b00c131ccb7f0000           movabs     r8, 0x7fcb1c130cb0
01648 4983804801000001               add        qword ptr [r8 + 0x148], 1
01650 4863d9                         movsxd     rbx, ecx
01653 b908000000                     mov        ecx, 8
01658 4c8bcb                         mov        r9, rbx
0165b 4c03c9                         add        r9, rcx
0165e 48b980f4121ccb7f0000           movabs     rcx, 0x7fcb1c12f480
01668 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
0166c 4183c002                       add        r8d, 2
01670 44894170                       mov        dword ptr [rcx + 0x70], r8d
01674 4181e0feff1f00                 and        r8d, 0x1ffffe
0167b 4585c0                         test       r8d, r8d
0167e 0f843a2b0000                   je         0x7fcb2c3c1c3e
01684 48b980f4121ccb7f0000           movabs     rcx, 0x7fcb1c12f480
0168e 488381d800000001               add        qword ptr [rcx + 0xd8], 1
01696 48b9f8f5121ccb7f0000           movabs     rcx, 0x7fcb1c12f5f8
016a0 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
016a4 4183c002                       add        r8d, 2
016a8 44894170                       mov        dword ptr [rcx + 0x70], r8d
016ac 4181e0feff1f00                 and        r8d, 0x1ffffe
016b3 4585c0                         test       r8d, r8d
016b6 0f84232b0000                   je         0x7fcb2c3c1c5f
016bc 48b9b00c131ccb7f0000           movabs     rcx, 0x7fcb1c130cb0
016c6 4883816801000001               add        qword ptr [rcx + 0x168], 1
016ce 48b9206c6ee200000000           movabs     rcx, 0xe26e6c20
016d8 48bea0936de200000000           movabs     rsi, 0xe26d93a0
016e2 4c8bc2                         mov        r8, rdx
016e5 ba02000000                     mov        edx, 2
016ea b910000000                     mov        ecx, 0x10
016ef 498bc0                         mov        rax, r8
016f2 4c8bc0                         mov        r8, rax
016f5 bf00000000                     mov        edi, 0
016fa 48890424                       mov        qword ptr [rsp], rax
016fe 48895c2408                     mov        qword ptr [rsp + 8], rbx
01703 49ba58936de200000000           movabs     r10, 0xe26d9358
0170d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01712 49ba206c6ee200000000           movabs     r10, 0xe26e6c20
0171c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01721 660f1f440000                   nop        word ptr [rax + rax]
01727 e8b4c65307                     call       0x7fcb338fb860
0172c 0f1f840024180006               nop        dword ptr [rax + rax + 0x6001824]
01734 4885c0                         test       rax, rax
01737 48bbb00c131ccb7f0000           movabs     rbx, 0x7fcb1c130cb0
01741 750c                           jne        0x7fcb2c3bf1cf
01743 808b7101000001                 or         byte ptr [rbx + 0x171], 1
0174a e988000000                     jmp        0x7fcb2c3bf257
0174f 8b38                           mov        edi, dword ptr [rax]
01751 c1ef0d                         shr        edi, 0xd
01754 48c1e70a                       shl        rdi, 0xa
01758 41ba00000036                   mov        r10d, 0x36000000
0175e 4903fa                         add        rdi, r10
01761 41ba30000000                   mov        r10d, 0x30
01767 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
0176b 7436                           je         0x7fcb2c3bf223
0176d 4983c202                       add        r10, 2
01771 4983fa34                       cmp        r10, 0x34
01775 75f0                           jne        0x7fcb2c3bf1e7
01777 41ba30000000                   mov        r10d, 0x30
0177d 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01782 7412                           je         0x7fcb2c3bf216
01784 4983c202                       add        r10, 2
01788 4983fa34                       cmp        r10, 0x34
0178c 75ef                           jne        0x7fcb2c3bf1fd
0178e 41ba2f000000                   mov        r10d, 0x2f
01794 eb11                           jmp        0x7fcb2c3bf227
01796 50                             push       rax
01797 4833c0                         xor        rax, rax
0179a f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
017a0 58                             pop        rax
017a1 ebbe                           jmp        0x7fcb2c3bf1e1
017a3 4983c201                       add        r10, 1
017a7 4a8304d301                     add        qword ptr [rbx + r10*8], 1
017ac 48bf0080003700000000           movabs     rdi, 0x37008000
017b6 8b18                           mov        ebx, dword ptr [rax]
017b8 c1eb0d                         shr        ebx, 0xd
017bb 48c1e30a                       shl        rbx, 0xa
017bf 41ba00000036                   mov        r10d, 0x36000000
017c5 4903da                         add        rbx, r10
017c8 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
017cc 0f852e2a0000                   jne        0x7fcb2c3c1c80
017d2 e900000000                     jmp        0x7fcb2c3bf257
017d7 488bf8                         mov        rdi, rax
017da 4889bc24c8010000               mov        qword ptr [rsp + 0x1c8], rdi
017e2 483b07                         cmp        rax, qword ptr [rdi]
017e5 488bf7                         mov        rsi, rdi
017e8 48bb88b1421ccb7f0000           movabs     rbx, 0x7fcb1c42b188
017f2 8b36                           mov        esi, dword ptr [rsi]
017f4 c1ee0d                         shr        esi, 0xd
017f7 48c1e60a                       shl        rsi, 0xa
017fb 41ba00000036                   mov        r10d, 0x36000000
01801 4903f2                         add        rsi, r10
01804 41baa3000000                   mov        r10d, 0xa3
0180a 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
0180e 743c                           je         0x7fcb2c3bf2cc
01810 4983c202                       add        r10, 2
01814 4981faa7000000                 cmp        r10, 0xa7
0181b 75ed                           jne        0x7fcb2c3bf28a
0181d 41baa3000000                   mov        r10d, 0xa3
01823 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01828 7415                           je         0x7fcb2c3bf2bf
0182a 4983c202                       add        r10, 2
0182e 4981faa7000000                 cmp        r10, 0xa7
01835 75ec                           jne        0x7fcb2c3bf2a3
01837 41baa2000000                   mov        r10d, 0xa2
0183d eb11                           jmp        0x7fcb2c3bf2d0
0183f 50                             push       rax
01840 4833c0                         xor        rax, rax
01843 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01849 58                             pop        rax
0184a ebb8                           jmp        0x7fcb2c3bf284
0184c 4983c201                       add        r10, 1
01850 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01855 48bec816131ccb7f0000           movabs     rsi, 0x7fcb1c1316c8
0185f 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
01862 83c302                         add        ebx, 2
01865 895e70                         mov        dword ptr [rsi + 0x70], ebx
01868 81e3feff1f00                   and        ebx, 0x1ffffe
0186e 85db                           test       ebx, ebx
01870 0f8498290000                   je         0x7fcb2c3c1c8e
01876 488bf7                         mov        rsi, rdi
01879 48bbc816131ccb7f0000           movabs     rbx, 0x7fcb1c1316c8
01883 8b36                           mov        esi, dword ptr [rsi]
01885 c1ee0d                         shr        esi, 0xd
01888 48c1e60a                       shl        rsi, 0xa
0188c 41ba00000036                   mov        r10d, 0x36000000
01892 4903f2                         add        rsi, r10
01895 41ba16000000                   mov        r10d, 0x16
0189b 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
0189f 7436                           je         0x7fcb2c3bf357
018a1 4983c202                       add        r10, 2
018a5 4983fa1a                       cmp        r10, 0x1a
018a9 75f0                           jne        0x7fcb2c3bf31b
018ab 41ba16000000                   mov        r10d, 0x16
018b1 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
018b6 7412                           je         0x7fcb2c3bf34a
018b8 4983c202                       add        r10, 2
018bc 4983fa1a                       cmp        r10, 0x1a
018c0 75ef                           jne        0x7fcb2c3bf331
018c2 41ba15000000                   mov        r10d, 0x15
018c8 eb11                           jmp        0x7fcb2c3bf35b
018ca 50                             push       rax
018cb 4833c0                         xor        rax, rax
018ce f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
018d4 58                             pop        rax
018d5 ebbe                           jmp        0x7fcb2c3bf315
018d7 4983c201                       add        r10, 1
018db 4a8304d301                     add        qword ptr [rbx + r10*8], 1
018e0 488bf7                         mov        rsi, rdi
018e3 6690                           nop        
018e5 48b8c0f61308cb7f0000           movabs     rax, 0x7fcb0813f6c0
018ef e8ecbf5307                     call       0x7fcb338fb360
018f4 0f1f8400ec190007               nop        dword ptr [rax + rax + 0x70019ec]
018fc 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
01904 8b7704                         mov        esi, dword ptr [rdi + 4]
01907 48bbc816131ccb7f0000           movabs     rbx, 0x7fcb1c1316c8
01911 488383d800000001               add        qword ptr [rbx + 0xd8], 1
01919 48bb6000131ccb7f0000           movabs     rbx, 0x7fcb1c130060
01923 8b5370                         mov        edx, dword ptr [rbx + 0x70]
01926 83c202                         add        edx, 2
01929 895370                         mov        dword ptr [rbx + 0x70], edx
0192c 81e2feff1f00                   and        edx, 0x1ffffe
01932 85d2                           test       edx, edx
01934 0f84fa280000                   je         0x7fcb2c3c1cb4
0193a 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01942 48bb6000131ccb7f0000           movabs     rbx, 0x7fcb1c130060
0194c 4883830801000001               add        qword ptr [rbx + 0x108], 1
01954 ffc8                           dec        eax
01956 2bf0                           sub        esi, eax
01958 48bb30f7121ccb7f0000           movabs     rbx, 0x7fcb1c12f730
01962 8b4370                         mov        eax, dword ptr [rbx + 0x70]
01965 83c002                         add        eax, 2
01968 894370                         mov        dword ptr [rbx + 0x70], eax
0196b 25feff1f00                     and        eax, 0x1ffffe
01970 85c0                           test       eax, eax
01972 0f84dd280000                   je         0x7fcb2c3c1cd5
01978 48bb30f7121ccb7f0000           movabs     rbx, 0x7fcb1c12f730
01982 488383a800000001               add        qword ptr [rbx + 0xa8], 1
0198a 48bb0000000000000000           movabs     rbx, 0
01994 bb00000000                     mov        ebx, 0
01999 443bdb                         cmp        r11d, ebx
0199c 0f8cd4280000                   jl         0x7fcb2c3c1cf6
019a2 443bde                         cmp        r11d, esi
019a5 0f8dd8280000                   jge        0x7fcb2c3c1d03
019ab 498bdb                         mov        rbx, r11
019ae 899c24c4010000                 mov        dword ptr [rsp + 0x1c4], ebx
019b5 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
019bd 488bbc24c8010000               mov        rdi, qword ptr [rsp + 0x1c8]
019c5 488bf7                         mov        rsi, rdi
019c8 48bac816131ccb7f0000           movabs     rdx, 0x7fcb1c1316c8
019d2 8b36                           mov        esi, dword ptr [rsi]
019d4 c1ee0d                         shr        esi, 0xd
019d7 48c1e60a                       shl        rsi, 0xa
019db 41ba00000036                   mov        r10d, 0x36000000
019e1 4903f2                         add        rsi, r10
019e4 41ba1e000000                   mov        r10d, 0x1e
019ea 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
019ee 7436                           je         0x7fcb2c3bf4a6
019f0 4983c202                       add        r10, 2
019f4 4983fa22                       cmp        r10, 0x22
019f8 75f0                           jne        0x7fcb2c3bf46a
019fa 41ba1e000000                   mov        r10d, 0x1e
01a00 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01a05 7412                           je         0x7fcb2c3bf499
01a07 4983c202                       add        r10, 2
01a0b 4983fa22                       cmp        r10, 0x22
01a0f 75ef                           jne        0x7fcb2c3bf480
01a11 41ba1d000000                   mov        r10d, 0x1d
01a17 eb11                           jmp        0x7fcb2c3bf4aa
01a19 50                             push       rax
01a1a 4833c0                         xor        rax, rax
01a1d f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01a23 58                             pop        rax
01a24 ebbe                           jmp        0x7fcb2c3bf464
01a26 4983c201                       add        r10, 1
01a2a 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01a2f 488bf7                         mov        rsi, rdi
01a32 666690                         nop        
01a35 48b8e8f61308cb7f0000           movabs     rax, 0x7fcb0813f6e8
01a3f e89cbe5307                     call       0x7fcb338fb360
01a44 0f1f84003c1b0008               nop        dword ptr [rax + rax + 0x8001b3c]
01a4c 483b00                         cmp        rax, qword ptr [rax]
01a4f 488bf0                         mov        rsi, rax
01a52 48bac816131ccb7f0000           movabs     rdx, 0x7fcb1c1316c8
01a5c 8b36                           mov        esi, dword ptr [rsi]
01a5e c1ee0d                         shr        esi, 0xd
01a61 48c1e60a                       shl        rsi, 0xa
01a65 41ba00000036                   mov        r10d, 0x36000000
01a6b 4903f2                         add        rsi, r10
01a6e 41ba24000000                   mov        r10d, 0x24
01a74 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01a78 7436                           je         0x7fcb2c3bf530
01a7a 4983c202                       add        r10, 2
01a7e 4983fa28                       cmp        r10, 0x28
01a82 75f0                           jne        0x7fcb2c3bf4f4
01a84 41ba24000000                   mov        r10d, 0x24
01a8a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01a8f 7412                           je         0x7fcb2c3bf523
01a91 4983c202                       add        r10, 2
01a95 4983fa28                       cmp        r10, 0x28
01a99 75ef                           jne        0x7fcb2c3bf50a
01a9b 41ba23000000                   mov        r10d, 0x23
01aa1 eb11                           jmp        0x7fcb2c3bf534
01aa3 50                             push       rax
01aa4 4833c0                         xor        rax, rax
01aa7 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01aad 58                             pop        rax
01aae ebbe                           jmp        0x7fcb2c3bf4ee
01ab0 4983c201                       add        r10, 1
01ab4 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01ab9 8b7024                         mov        esi, dword ptr [rax + 0x24]
01abc 488bd0                         mov        rdx, rax
01abf 48b9c816131ccb7f0000           movabs     rcx, 0x7fcb1c1316c8
01ac9 8b12                           mov        edx, dword ptr [rdx]
01acb c1ea0d                         shr        edx, 0xd
01ace 48c1e20a                       shl        rdx, 0xa
01ad2 41ba00000036                   mov        r10d, 0x36000000
01ad8 4903d2                         add        rdx, r10
01adb 41ba2a000000                   mov        r10d, 0x2a
01ae1 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01ae5 7436                           je         0x7fcb2c3bf59d
01ae7 4983c202                       add        r10, 2
01aeb 4983fa2e                       cmp        r10, 0x2e
01aef 75f0                           jne        0x7fcb2c3bf561
01af1 41ba2a000000                   mov        r10d, 0x2a
01af7 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01afc 7412                           je         0x7fcb2c3bf590
01afe 4983c202                       add        r10, 2
01b02 4983fa2e                       cmp        r10, 0x2e
01b06 75ef                           jne        0x7fcb2c3bf577
01b08 41ba29000000                   mov        r10d, 0x29
01b0e eb11                           jmp        0x7fcb2c3bf5a1
01b10 50                             push       rax
01b11 4833c0                         xor        rax, rax
01b14 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
01b1a 58                             pop        rax
01b1b ebbe                           jmp        0x7fcb2c3bf55b
01b1d 4983c201                       add        r10, 1
01b21 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01b26 8b4804                         mov        ecx, dword ptr [rax + 4]
01b29 48bac816131ccb7f0000           movabs     rdx, 0x7fcb1c1316c8
01b33 4883827801000001               add        qword ptr [rdx + 0x178], 1
01b3b 48ba9802131ccb7f0000           movabs     rdx, 0x7fcb1c130298
01b45 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01b49 4183c002                       add        r8d, 2
01b4d 44894270                       mov        dword ptr [rdx + 0x70], r8d
01b51 4181e0feff1f00                 and        r8d, 0x1ffffe
01b58 4585c0                         test       r8d, r8d
01b5b 0f8434270000                   je         0x7fcb2c3c1d15
01b61 48bac816131ccb7f0000           movabs     rdx, 0x7fcb1c1316c8
01b6b 4883828801000001               add        qword ptr [rdx + 0x188], 1
01b73 8b9c24c4010000                 mov        ebx, dword ptr [rsp + 0x1c4]
01b7a 4863db                         movsxd     rbx, ebx
01b7d ba08000000                     mov        edx, 8
01b82 4c8bcb                         mov        r9, rbx
01b85 4c03ca                         add        r9, rdx
01b88 48ba80f4121ccb7f0000           movabs     rdx, 0x7fcb1c12f480
01b92 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01b96 4183c002                       add        r8d, 2
01b9a 44894270                       mov        dword ptr [rdx + 0x70], r8d
01b9e 4181e0feff1f00                 and        r8d, 0x1ffffe
01ba5 4585c0                         test       r8d, r8d
01ba8 0f8408270000                   je         0x7fcb2c3c1d36
01bae 48ba80f4121ccb7f0000           movabs     rdx, 0x7fcb1c12f480
01bb8 488382d800000001               add        qword ptr [rdx + 0xd8], 1
01bc0 48baf8f5121ccb7f0000           movabs     rdx, 0x7fcb1c12f5f8
01bca 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01bce 4183c002                       add        r8d, 2
01bd2 44894270                       mov        dword ptr [rdx + 0x70], r8d
01bd6 4181e0feff1f00                 and        r8d, 0x1ffffe
01bdd 4585c0                         test       r8d, r8d
01be0 0f84f1260000                   je         0x7fcb2c3c1d57
01be6 48bac816131ccb7f0000           movabs     rdx, 0x7fcb1c1316c8
01bf0 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
01bf8 48ba080a6fe200000000           movabs     rdx, 0xe26f0a08
01c02 ba02000000                     mov        edx, 2
01c07 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
01c0f bf00000000                     mov        edi, 0
01c14 488b8424c8010000               mov        rax, qword ptr [rsp + 0x1c8]
01c1c 48890424                       mov        qword ptr [rsp], rax
01c20 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
01c28 4889442408                     mov        qword ptr [rsp + 8], rax
01c2d 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01c32 49ba080a6fe200000000           movabs     r10, 0xe26f0a08
01c3c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c41 660f1f440000                   nop        word ptr [rax + rax]
01c47 e894c15307                     call       0x7fcb338fb860
01c4c 0f1f8400441d0009               nop        dword ptr [rax + rax + 0x9001d44]
01c54 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01c5c 4183c310                       add        r11d, 0x10
01c60 8bb424c0010000                 mov        esi, dword ptr [rsp + 0x1c0]
01c67 83c610                         add        esi, 0x10
01c6a 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01c72 ba02000000                     mov        edx, 2
01c77 7c05                           jl         0x7fcb2c3bf6fe
01c79 ba00000000                     mov        edx, 0
01c7e 48b988b1421ccb7f0000           movabs     rcx, 0x7fcb1c42b188
01c88 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
01c8c 4403c2                         add        r8d, edx
01c8f 44894174                       mov        dword ptr [rcx + 0x74], r8d
01c93 85d2                           test       edx, edx
01c95 7506                           jne        0x7fcb2c3bf71d
01c97 41b802000000                   mov        r8d, 2
01c9d 4181e0fe3f0000                 and        r8d, 0x3ffe
01ca4 4585c0                         test       r8d, r8d
01ca7 0f844b260000                   je         0x7fcb2c3c1d78
01cad 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01cb1 418502                         test       dword ptr [r10], eax
01cb4 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01cbc 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
01cc6 b940050000                     mov        ecx, 0x540
01ccb 7c05                           jl         0x7fcb2c3bf752
01ccd b950050000                     mov        ecx, 0x550
01cd2 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01cd6 4d8d4001                       lea        r8, [r8 + 1]
01cda 4c89040a                       mov        qword ptr [rdx + rcx], r8
01cde 0f8c2cf5ffff                   jl         0x7fcb2c3bec90
01ce4 48be88b1421ccb7f0000           movabs     rsi, 0x7fcb1c42b188
01cee ff8660050000                   inc        dword ptr [rsi + 0x560]
01cf4 e9a5000000                     jmp        0x7fcb2c3bf81e
01cf9 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
01d03 4883827805000001               add        qword ptr [rdx + 0x578], 1
01d0b 488bb42468010000               mov        rsi, qword ptr [rsp + 0x168]
01d13 8b942490010000                 mov        edx, dword ptr [rsp + 0x190]
01d1a 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
01d22 448b842474010000               mov        r8d, dword ptr [rsp + 0x174]
01d2a 4c8bcf                         mov        r9, rdi
01d2d 4885c9                         test       rcx, rcx
01d30 0f84e3250000                   je         0x7fcb2c3c1d99
01d36 85d2                           test       edx, edx
01d38 0f8cdb250000                   jl         0x7fcb2c3c1d99
01d3e 4585c0                         test       r8d, r8d
01d41 0f8cd2250000                   jl         0x7fcb2c3c1d99
01d47 4a8d3c0a                       lea        rdi, [rdx + r9]
01d4b 3b7e04                         cmp        edi, dword ptr [rsi + 4]
01d4e 0f87c5250000                   ja         0x7fcb2c3c1d99
01d54 4b8d3c08                       lea        rdi, [r8 + r9]
01d58 3b7904                         cmp        edi, dword ptr [rcx + 4]
01d5b 0f87b8250000                   ja         0x7fcb2c3c1d99
01d61 4585c9                         test       r9d, r9d
01d64 0f8caf250000                   jl         0x7fcb2c3c1d99
01d6a 4863d2                         movsxd     rdx, edx
01d6d 4d63c0                         movsxd     r8, r8d
01d70 488d7c1608                     lea        rdi, [rsi + rdx + 8]
01d75 4a8d740108                     lea        rsi, [rcx + r8 + 8]
01d7a 498bd1                         mov        rdx, r9
01d7d 40f6c40f                       test       spl, 0xf
01d81 0f8412000000                   je         0x7fcb2c3bf819
01d87 4883ec08                       sub        rsp, 8
01d8b e810575207                     call       0x7fcb338e4f20
01d90 4883c408                       add        rsp, 8
01d94 e905000000                     jmp        0x7fcb2c3bf81e
01d99 e802575207                     call       0x7fcb338e4f20
01d9e 8bb424a4010000                 mov        esi, dword ptr [rsp + 0x1a4]
01da5 8b9c24a0010000                 mov        ebx, dword ptr [rsp + 0x1a0]
01dac 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
01db4 488bfb                         mov        rdi, rbx
01db7 2bbc24a8010000                 sub        edi, dword ptr [rsp + 0x1a8]
01dbe 4183f810                       cmp        r8d, 0x10
01dc2 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
01dcc b988050000                     mov        ecx, 0x588
01dd1 7f05                           jg         0x7fcb2c3bf858
01dd3 b998050000                     mov        ecx, 0x598
01dd8 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
01ddc 4d8d4901                       lea        r9, [r9 + 1]
01de0 4c890c0a                       mov        qword ptr [rdx + rcx], r9
01de4 448b8c24a8010000               mov        r9d, dword ptr [rsp + 0x1a8]
01dec 0f8f2c000000                   jg         0x7fcb2c3bf89e
01df2 4183f910                       cmp        r9d, 0x10
01df6 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
01e00 b9b8050000                     mov        ecx, 0x5b8
01e05 7d05                           jge        0x7fcb2c3bf88c
01e07 b9a8050000                     mov        ecx, 0x5a8
01e0c 488b040a                       mov        rax, qword ptr [rdx + rcx]
01e10 488d4001                       lea        rax, [rax + 1]
01e14 4889040a                       mov        qword ptr [rdx + rcx], rax
01e18 0f8da6100000                   jge        0x7fcb2c3c0944
01e1e 453bc8                         cmp        r9d, r8d
01e21 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
01e2b b920060000                     mov        ecx, 0x620
01e30 7c05                           jl         0x7fcb2c3bf8b7
01e32 b930060000                     mov        ecx, 0x630
01e37 488b040a                       mov        rax, qword ptr [rdx + rcx]
01e3b 488d4001                       lea        rax, [rax + 1]
01e3f 4889040a                       mov        qword ptr [rdx + rcx], rax
01e43 0f8c04030000                   jl         0x7fcb2c3bfbcd
01e49 4183f830                       cmp        r8d, 0x30
01e4d 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
01e57 b940060000                     mov        ecx, 0x640
01e5c 7e05                           jle        0x7fcb2c3bf8e3
01e5e b950060000                     mov        ecx, 0x650
01e63 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
01e67 4d8d4901                       lea        r9, [r9 + 1]
01e6b 4c890c0a                       mov        qword ptr [rdx + rcx], r9
01e6f 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
01e76 0f8ec4000000                   jle        0x7fcb2c3bf9c0
01e7c 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
01e86 4883826006000001               add        qword ptr [rdx + 0x660], 1
01e8e 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
01e96 488bd7                         mov        rdx, rdi
01e99 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
01ea1 498bf8                         mov        rdi, r8
01ea4 4c8bc3                         mov        r8, rbx
01ea7 4c8bcf                         mov        r9, rdi
01eaa 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
01eb1 4885f6                         test       rsi, rsi
01eb4 0f846f240000                   je         0x7fcb2c3c1da9
01eba 4885c9                         test       rcx, rcx
01ebd 0f8466240000                   je         0x7fcb2c3c1da9
01ec3 85d2                           test       edx, edx
01ec5 0f8c5e240000                   jl         0x7fcb2c3c1da9
01ecb 4585c0                         test       r8d, r8d
01ece 0f8c55240000                   jl         0x7fcb2c3c1da9
01ed4 4a8d3c0a                       lea        rdi, [rdx + r9]
01ed8 3b7e04                         cmp        edi, dword ptr [rsi + 4]
01edb 0f8748240000                   ja         0x7fcb2c3c1da9
01ee1 4b8d3c08                       lea        rdi, [r8 + r9]
01ee5 3b7904                         cmp        edi, dword ptr [rcx + 4]
01ee8 0f873b240000                   ja         0x7fcb2c3c1da9
01eee 4585c9                         test       r9d, r9d
01ef1 0f8c32240000                   jl         0x7fcb2c3c1da9
01ef7 4863d2                         movsxd     rdx, edx
01efa 4d63c0                         movsxd     r8, r8d
01efd 488d7c1608                     lea        rdi, [rsi + rdx + 8]
01f02 4a8d740108                     lea        rsi, [rcx + r8 + 8]
01f07 498bd1                         mov        rdx, r9
01f0a 40f6c40f                       test       spl, 0xf
01f0e 0f8412000000                   je         0x7fcb2c3bf9a6
01f14 4883ec08                       sub        rsp, 8
01f18 e883555207                     call       0x7fcb338e4f20
01f1d 4883c408                       add        rsp, 8
01f21 e905000000                     jmp        0x7fcb2c3bf9ab
01f26 e875555207                     call       0x7fcb338e4f20
01f2b 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
01f35 ff8270060000                   inc        dword ptr [rdx + 0x670]
01f3b e9ea010000                     jmp        0x7fcb2c3bfbaa
01f40 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
01f47 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
01f4e 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
01f55 899c24e0010000                 mov        dword ptr [rsp + 0x1e0], ebx
01f5c 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
01f63 0f1f440000                     nop        dword ptr [rax + rax]
01f68 898424d8010000                 mov        dword ptr [rsp + 0x1d8], eax
01f6f 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
01f77 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
01f81 4883828806000001               add        qword ptr [rdx + 0x688], 1
01f89 48ba186a043700000000           movabs     rdx, 0x37046a18
01f93 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
01f96 83c102                         add        ecx, 2
01f99 894a70                         mov        dword ptr [rdx + 0x70], ecx
01f9c 81e1feff1f00                   and        ecx, 0x1ffffe
01fa2 85c9                           test       ecx, ecx
01fa4 0f848f230000                   je         0x7fcb2c3c1db9
01faa 660f1f440000                   nop        word ptr [rax + rax]
01fb0 e9b4230000                     jmp        0x7fcb2c3c1de9
01fb5 90                             nop        
01fb6 90                             nop        
01fb7 90                             nop        
01fb8 90                             nop        
01fb9 90                             nop        
01fba 48ba186a043700000000           movabs     rdx, 0x37046a18
01fc4 488d92d8000000                 lea        rdx, [rdx + 0xd8]
01fcb 4885c0                         test       rax, rax
01fce 750c                           jne        0x7fcb2c3bfa5c
01fd0 f6420801                       test       byte ptr [rdx + 8], 1
01fd4 7506                           jne        0x7fcb2c3bfa5c
01fd6 f048834a0801                   lock or    qword ptr [rdx + 8], 1
01fdc 48be90556ae200000000           movabs     rsi, 0xe26a5590
01fe6 488bd6                         mov        rdx, rsi
01fe9 48b9186a043700000000           movabs     rcx, 0x37046a18
01ff3 8b12                           mov        edx, dword ptr [rdx]
01ff5 c1ea0d                         shr        edx, 0xd
01ff8 48c1e20a                       shl        rdx, 0xa
01ffc 41ba00000036                   mov        r10d, 0x36000000
02002 4903d2                         add        rdx, r10
02005 41ba16000000                   mov        r10d, 0x16
0200b 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0200f 7436                           je         0x7fcb2c3bfac7
02011 4983c202                       add        r10, 2
02015 4983fa1a                       cmp        r10, 0x1a
02019 75f0                           jne        0x7fcb2c3bfa8b
0201b 41ba16000000                   mov        r10d, 0x16
02021 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02026 7412                           je         0x7fcb2c3bfaba
02028 4983c202                       add        r10, 2
0202c 4983fa1a                       cmp        r10, 0x1a
02030 75ef                           jne        0x7fcb2c3bfaa1
02032 41ba15000000                   mov        r10d, 0x15
02038 eb11                           jmp        0x7fcb2c3bfacb
0203a 50                             push       rax
0203b 4833c0                         xor        rax, rax
0203e f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02044 58                             pop        rax
02045 ebbe                           jmp        0x7fcb2c3bfa85
02047 4983c201                       add        r10, 1
0204b 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02050 488bd0                         mov        rdx, rax
02053 488bcf                         mov        rcx, rdi
02056 89bc24dc010000                 mov        dword ptr [rsp + 0x1dc], edi
0205d 6690                           nop        
0205f e87cb35307                     call       0x7fcb338fae60
02064 0f1f84005c21000b               nop        dword ptr [rax + rax + 0xb00215c]
0206c 48be88b1421ccb7f0000           movabs     rsi, 0x7fcb1c42b188
02076 4883869806000001               add        qword ptr [rsi + 0x698], 1
0207e 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
02086 8b9424d8010000                 mov        edx, dword ptr [rsp + 0x1d8]
0208d 488bc8                         mov        rcx, rax
02090 0f1f8000000000                 nop        dword ptr [rax]
02097 e844bd5307                     call       0x7fcb338fb860
0209c 0f1f84009421000c               nop        dword ptr [rax + rax + 0xc002194]
020a4 8b8424d8010000                 mov        eax, dword ptr [rsp + 0x1d8]
020ab 83c008                         add        eax, 8
020ae 8bbc24dc010000                 mov        edi, dword ptr [rsp + 0x1dc]
020b5 83c708                         add        edi, 8
020b8 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
020bf be02000000                     mov        esi, 2
020c4 7c05                           jl         0x7fcb2c3bfb4b
020c6 be00000000                     mov        esi, 0
020cb 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
020d5 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
020d8 03ce                           add        ecx, esi
020da 894a74                         mov        dword ptr [rdx + 0x74], ecx
020dd 85f6                           test       esi, esi
020df 7505                           jne        0x7fcb2c3bfb66
020e1 b902000000                     mov        ecx, 2
020e6 81e1fe3f0000                   and        ecx, 0x3ffe
020ec 85c9                           test       ecx, ecx
020ee 0f847f220000                   je         0x7fcb2c3c1df3
020f4 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
020f8 418502                         test       dword ptr [r10], eax
020fb 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
02102 48be88b1421ccb7f0000           movabs     rsi, 0x7fcb1c42b188
0210c baa8060000                     mov        edx, 0x6a8
02111 7c05                           jl         0x7fcb2c3bfb98
02113 bab8060000                     mov        edx, 0x6b8
02118 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0211c 488d4901                       lea        rcx, [rcx + 1]
02120 48890c16                       mov        qword ptr [rsi + rdx], rcx
02124 0f8c3efeffff                   jl         0x7fcb2c3bf9e8
0212a 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
02131 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
02138 48be88b1421ccb7f0000           movabs     rsi, 0x7fcb1c42b188
02142 ff86c8060000                   inc        dword ptr [rsi + 0x6c8]
02148 e981170000                     jmp        0x7fcb2c3c134e
0214d 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
02154 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
0215b 4183f910                       cmp        r9d, 0x10
0215f 48be88b1421ccb7f0000           movabs     rsi, 0x7fcb1c42b188
02169 bae0060000                     mov        edx, 0x6e0
0216e 7c05                           jl         0x7fcb2c3bfbf5
02170 baf0060000                     mov        edx, 0x6f0
02175 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
02179 488d4901                       lea        rcx, [rcx + 1]
0217d 48890c16                       mov        qword ptr [rsi + rdx], rcx
02181 0f8ccd0a0000                   jl         0x7fcb2c3c06d4
02187 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
0218e 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
02195 899c24f0010000                 mov        dword ptr [rsp + 0x1f0], ebx
0219c 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
021a3 0f1f440000                     nop        dword ptr [rax + rax]
021a8 898424ec010000                 mov        dword ptr [rsp + 0x1ec], eax
021af 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
021b7 48be88b1421ccb7f0000           movabs     rsi, 0x7fcb1c42b188
021c1 4883860007000001               add        qword ptr [rsi + 0x700], 1
021c9 48be080a131ccb7f0000           movabs     rsi, 0x7fcb1c130a08
021d3 8b5670                         mov        edx, dword ptr [rsi + 0x70]
021d6 83c202                         add        edx, 2
021d9 895670                         mov        dword ptr [rsi + 0x70], edx
021dc 81e2feff1f00                   and        edx, 0x1ffffe
021e2 85d2                           test       edx, edx
021e4 0f84aa210000                   je         0x7fcb2c3c1e14
021ea 48be58936de200000000           movabs     rsi, 0xe26d9358
021f4 48ba080a131ccb7f0000           movabs     rdx, 0x7fcb1c130a08
021fe 8b36                           mov        esi, dword ptr [rsi]
02200 c1ee0d                         shr        esi, 0xd
02203 48c1e60a                       shl        rsi, 0xa
02207 41ba00000036                   mov        r10d, 0x36000000
0220d 4903f2                         add        rsi, r10
02210 41ba16000000                   mov        r10d, 0x16
02216 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
0221a 7436                           je         0x7fcb2c3bfcd2
0221c 4983c202                       add        r10, 2
02220 4983fa1a                       cmp        r10, 0x1a
02224 75f0                           jne        0x7fcb2c3bfc96
02226 41ba16000000                   mov        r10d, 0x16
0222c 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02231 7412                           je         0x7fcb2c3bfcc5
02233 4983c202                       add        r10, 2
02237 4983fa1a                       cmp        r10, 0x1a
0223b 75ef                           jne        0x7fcb2c3bfcac
0223d 41ba15000000                   mov        r10d, 0x15
02243 eb11                           jmp        0x7fcb2c3bfcd6
02245 50                             push       rax
02246 4833c0                         xor        rax, rax
02249 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
0224f 58                             pop        rax
02250 ebbe                           jmp        0x7fcb2c3bfc90
02252 4983c201                       add        r10, 1
02256 4a8304d201                     add        qword ptr [rdx + r10*8], 1
0225b 448b6804                       mov        r13d, dword ptr [rax + 4]
0225f 48be080a131ccb7f0000           movabs     rsi, 0x7fcb1c130a08
02269 488386d800000001               add        qword ptr [rsi + 0xd8], 1
02271 48be6000131ccb7f0000           movabs     rsi, 0x7fcb1c130060
0227b 8b5670                         mov        edx, dword ptr [rsi + 0x70]
0227e 83c202                         add        edx, 2
02281 895670                         mov        dword ptr [rsi + 0x70], edx
02284 81e2feff1f00                   and        edx, 0x1ffffe
0228a 85d2                           test       edx, edx
0228c 0f8428210000                   je         0x7fcb2c3c1e3a
02292 48be6000131ccb7f0000           movabs     rsi, 0x7fcb1c130060
0229c 4883860801000001               add        qword ptr [rsi + 0x108], 1
022a4 498bf5                         mov        rsi, r13
022a7 83ee0f                         sub        esi, 0xf
022aa 48ba30f7121ccb7f0000           movabs     rdx, 0x7fcb1c12f730
022b4 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
022b7 83c102                         add        ecx, 2
022ba 894a70                         mov        dword ptr [rdx + 0x70], ecx
022bd 81e1feff1f00                   and        ecx, 0x1ffffe
022c3 85c9                           test       ecx, ecx
022c5 0f8410210000                   je         0x7fcb2c3c1e5b
022cb 48ba30f7121ccb7f0000           movabs     rdx, 0x7fcb1c12f730
022d5 488382a800000001               add        qword ptr [rdx + 0xa8], 1
022dd 48ba0000000000000000           movabs     rdx, 0
022e7 ba00000000                     mov        edx, 0
022ec 3bfa                           cmp        edi, edx
022ee 0f8c08210000                   jl         0x7fcb2c3c1e7c
022f4 3bfe                           cmp        edi, esi
022f6 0f8d0d210000                   jge        0x7fcb2c3c1e89
022fc 488bf7                         mov        rsi, rdi
022ff 48ba58936de200000000           movabs     rdx, 0xe26d9358
02309 488bca                         mov        rcx, rdx
0230c 49b8080a131ccb7f0000           movabs     r8, 0x7fcb1c130a08
02316 8b09                           mov        ecx, dword ptr [rcx]
02318 c1e90d                         shr        ecx, 0xd
0231b 48c1e10a                       shl        rcx, 0xa
0231f 41ba00000036                   mov        r10d, 0x36000000
02325 4903ca                         add        rcx, r10
02328 41ba24000000                   mov        r10d, 0x24
0232e 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
02332 7436                           je         0x7fcb2c3bfdea
02334 4983c202                       add        r10, 2
02338 4983fa28                       cmp        r10, 0x28
0233c 75f0                           jne        0x7fcb2c3bfdae
0233e 41ba24000000                   mov        r10d, 0x24
02344 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
02349 7412                           je         0x7fcb2c3bfddd
0234b 4983c202                       add        r10, 2
0234f 4983fa28                       cmp        r10, 0x28
02353 75ef                           jne        0x7fcb2c3bfdc4
02355 41ba23000000                   mov        r10d, 0x23
0235b eb11                           jmp        0x7fcb2c3bfdee
0235d 50                             push       rax
0235e 4833c0                         xor        rax, rax
02361 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
02367 58                             pop        rax
02368 ebbe                           jmp        0x7fcb2c3bfda8
0236a 4983c201                       add        r10, 1
0236e 4b8304d001                     add        qword ptr [r8 + r10*8], 1
02373 48b930f8121ccb7f0000           movabs     rcx, 0x7fcb1c12f830
0237d 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
02381 4183c002                       add        r8d, 2
02385 44894170                       mov        dword ptr [rcx + 0x70], r8d
02389 4181e0feff1f00                 and        r8d, 0x1ffffe
02390 4585c0                         test       r8d, r8d
02393 0f847d200000                   je         0x7fcb2c3c1e96
02399 48b930f8121ccb7f0000           movabs     rcx, 0x7fcb1c12f830
023a3 488381a800000001               add        qword ptr [rcx + 0xa8], 1
023ab 48ba58f9121ccb7f0000           movabs     rdx, 0x7fcb1c12f958
023b5 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
023b8 83c102                         add        ecx, 2
023bb 894a70                         mov        dword ptr [rdx + 0x70], ecx
023be 81e1feff1f00                   and        ecx, 0x1ffffe
023c4 85c9                           test       ecx, ecx
023c6 0f846b200000                   je         0x7fcb2c3c1eb7
023cc 48ba58f9121ccb7f0000           movabs     rdx, 0x7fcb1c12f958
023d6 ff82b8000000                   inc        dword ptr [rdx + 0xb8]
023dc 4489ac24e8010000               mov        dword ptr [rsp + 0x1e8], r13d
023e4 89bc24e4010000                 mov        dword ptr [rsp + 0x1e4], edi
023eb 48ba50136ee200000000           movabs     rdx, 0xe26e1350
023f5 488bca                         mov        rcx, rdx
023f8 49b8080a131ccb7f0000           movabs     r8, 0x7fcb1c130a08
02402 4983805801000001               add        qword ptr [r8 + 0x158], 1
0240a 48b9d00b131ccb7f0000           movabs     rcx, 0x7fcb1c130bd0
02414 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
02418 4183c002                       add        r8d, 2
0241c 44894170                       mov        dword ptr [rcx + 0x70], r8d
02420 4181e0feff1f00                 and        r8d, 0x1ffffe
02427 4585c0                         test       r8d, r8d
0242a 0f8428200000                   je         0x7fcb2c3c1ed8
02430 488bca                         mov        rcx, rdx
02433 49b8d00b131ccb7f0000           movabs     r8, 0x7fcb1c130bd0
0243d 498380a800000001               add        qword ptr [r8 + 0xa8], 1
02445 48b9b00c131ccb7f0000           movabs     rcx, 0x7fcb1c130cb0
0244f 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
02453 4183c002                       add        r8d, 2
02457 44894170                       mov        dword ptr [rcx + 0x70], r8d
0245b 4181e0feff1f00                 and        r8d, 0x1ffffe
02462 4585c0                         test       r8d, r8d
02465 0f840e200000                   je         0x7fcb2c3c1ef9
0246b 48b9b00c131ccb7f0000           movabs     rcx, 0x7fcb1c130cb0
02475 488381b800000001               add        qword ptr [rcx + 0xb8], 1
0247d 48bad801131ccb7f0000           movabs     rdx, 0x7fcb1c1301d8
02487 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0248a 83c102                         add        ecx, 2
0248d 894a70                         mov        dword ptr [rdx + 0x70], ecx
02490 81e1feff1f00                   and        ecx, 0x1ffffe
02496 85c9                           test       ecx, ecx
02498 0f84fc1f0000                   je         0x7fcb2c3c1f1a
0249e 48ba58936de200000000           movabs     rdx, 0xe26d9358
024a8 488bca                         mov        rcx, rdx
024ab 49b8b00c131ccb7f0000           movabs     r8, 0x7fcb1c130cb0
024b5 8b09                           mov        ecx, dword ptr [rcx]
024b7 c1e90d                         shr        ecx, 0xd
024ba 48c1e10a                       shl        rcx, 0xa
024be 41ba00000036                   mov        r10d, 0x36000000
024c4 4903ca                         add        rcx, r10
024c7 41ba1c000000                   mov        r10d, 0x1c
024cd 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
024d1 7436                           je         0x7fcb2c3bff89
024d3 4983c202                       add        r10, 2
024d7 4983fa20                       cmp        r10, 0x20
024db 75f0                           jne        0x7fcb2c3bff4d
024dd 41ba1c000000                   mov        r10d, 0x1c
024e3 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
024e8 7412                           je         0x7fcb2c3bff7c
024ea 4983c202                       add        r10, 2
024ee 4983fa20                       cmp        r10, 0x20
024f2 75ef                           jne        0x7fcb2c3bff63
024f4 41ba1b000000                   mov        r10d, 0x1b
024fa eb11                           jmp        0x7fcb2c3bff8d
024fc 50                             push       rax
024fd 4833c0                         xor        rax, rax
02500 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
02506 58                             pop        rax
02507 ebbe                           jmp        0x7fcb2c3bff47
02509 4983c201                       add        r10, 1
0250d 4b8304d001                     add        qword ptr [r8 + r10*8], 1
02512 48b9b00c131ccb7f0000           movabs     rcx, 0x7fcb1c130cb0
0251c 8b12                           mov        edx, dword ptr [rdx]
0251e c1ea0d                         shr        edx, 0xd
02521 48c1e20a                       shl        rdx, 0xa
02525 41ba00000036                   mov        r10d, 0x36000000
0252b 4903d2                         add        rdx, r10
0252e 41ba22000000                   mov        r10d, 0x22
02534 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02538 7436                           je         0x7fcb2c3bfff0
0253a 4983c202                       add        r10, 2
0253e 4983fa26                       cmp        r10, 0x26
02542 75f0                           jne        0x7fcb2c3bffb4
02544 41ba22000000                   mov        r10d, 0x22
0254a 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0254f 7412                           je         0x7fcb2c3bffe3
02551 4983c202                       add        r10, 2
02555 4983fa26                       cmp        r10, 0x26
02559 75ef                           jne        0x7fcb2c3bffca
0255b 41ba21000000                   mov        r10d, 0x21
02561 eb11                           jmp        0x7fcb2c3bfff4
02563 50                             push       rax
02564 4833c0                         xor        rax, rax
02567 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
0256d 58                             pop        rax
0256e ebbe                           jmp        0x7fcb2c3bffae
02570 4983c201                       add        r10, 1
02574 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02579 48bab00c131ccb7f0000           movabs     rdx, 0x7fcb1c130cb0
02583 4883823801000001               add        qword ptr [rdx + 0x138], 1
0258b 48ba9802131ccb7f0000           movabs     rdx, 0x7fcb1c130298
02595 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02598 83c102                         add        ecx, 2
0259b 894a70                         mov        dword ptr [rdx + 0x70], ecx
0259e 81e1feff1f00                   and        ecx, 0x1ffffe
025a4 85c9                           test       ecx, ecx
025a6 0f840f1f0000                   je         0x7fcb2c3c1f3b
025ac 48bab00c131ccb7f0000           movabs     rdx, 0x7fcb1c130cb0
025b6 4883824801000001               add        qword ptr [rdx + 0x148], 1
025be 4c63f6                         movsxd     r14, esi
025c1 be08000000                     mov        esi, 8
025c6 4d8bce                         mov        r9, r14
025c9 4c03ce                         add        r9, rsi
025cc 48be80f4121ccb7f0000           movabs     rsi, 0x7fcb1c12f480
025d6 8b5670                         mov        edx, dword ptr [rsi + 0x70]
025d9 83c202                         add        edx, 2
025dc 895670                         mov        dword ptr [rsi + 0x70], edx
025df 81e2feff1f00                   and        edx, 0x1ffffe
025e5 85d2                           test       edx, edx
025e7 0f84ef1e0000                   je         0x7fcb2c3c1f5c
025ed 48be80f4121ccb7f0000           movabs     rsi, 0x7fcb1c12f480
025f7 488386d800000001               add        qword ptr [rsi + 0xd8], 1
025ff 48bef8f5121ccb7f0000           movabs     rsi, 0x7fcb1c12f5f8
02609 8b5670                         mov        edx, dword ptr [rsi + 0x70]
0260c 83c202                         add        edx, 2
0260f 895670                         mov        dword ptr [rsi + 0x70], edx
02612 81e2feff1f00                   and        edx, 0x1ffffe
02618 85d2                           test       edx, edx
0261a 0f84dd1e0000                   je         0x7fcb2c3c1f7d
02620 48beb00c131ccb7f0000           movabs     rsi, 0x7fcb1c130cb0
0262a 4883866801000001               add        qword ptr [rsi + 0x168], 1
02632 48be206c6ee200000000           movabs     rsi, 0xe26e6c20
0263c 48bea0936de200000000           movabs     rsi, 0xe26d93a0
02646 ba02000000                     mov        edx, 2
0264b b910000000                     mov        ecx, 0x10
02650 4c8bc0                         mov        r8, rax
02653 bf00000000                     mov        edi, 0
02658 48890424                       mov        qword ptr [rsp], rax
0265c 4c89742408                     mov        qword ptr [rsp + 8], r14
02661 49ba58936de200000000           movabs     r10, 0xe26d9358
0266b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02670 49ba206c6ee200000000           movabs     r10, 0xe26e6c20
0267a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0267f e85cb75307                     call       0x7fcb338fb860
02684 0f1f84007c27000e               nop        dword ptr [rax + rax + 0xe00277c]
0268c 4885c0                         test       rax, rax
0268f 48bbb00c131ccb7f0000           movabs     rbx, 0x7fcb1c130cb0
02699 750c                           jne        0x7fcb2c3c0127
0269b 808b7101000001                 or         byte ptr [rbx + 0x171], 1
026a2 e988000000                     jmp        0x7fcb2c3c01af
026a7 8b38                           mov        edi, dword ptr [rax]
026a9 c1ef0d                         shr        edi, 0xd
026ac 48c1e70a                       shl        rdi, 0xa
026b0 41ba00000036                   mov        r10d, 0x36000000
026b6 4903fa                         add        rdi, r10
026b9 41ba30000000                   mov        r10d, 0x30
026bf 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
026c3 7436                           je         0x7fcb2c3c017b
026c5 4983c202                       add        r10, 2
026c9 4983fa34                       cmp        r10, 0x34
026cd 75f0                           jne        0x7fcb2c3c013f
026cf 41ba30000000                   mov        r10d, 0x30
026d5 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
026da 7412                           je         0x7fcb2c3c016e
026dc 4983c202                       add        r10, 2
026e0 4983fa34                       cmp        r10, 0x34
026e4 75ef                           jne        0x7fcb2c3c0155
026e6 41ba2f000000                   mov        r10d, 0x2f
026ec eb11                           jmp        0x7fcb2c3c017f
026ee 50                             push       rax
026ef 4833c0                         xor        rax, rax
026f2 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
026f8 58                             pop        rax
026f9 ebbe                           jmp        0x7fcb2c3c0139
026fb 4983c201                       add        r10, 1
026ff 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02704 48bf0080003700000000           movabs     rdi, 0x37008000
0270e 8b18                           mov        ebx, dword ptr [rax]
02710 c1eb0d                         shr        ebx, 0xd
02713 48c1e30a                       shl        rbx, 0xa
02717 41ba00000036                   mov        r10d, 0x36000000
0271d 4903da                         add        rbx, r10
02720 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
02724 0f85f41d0000                   jne        0x7fcb2c3c1f9e
0272a e900000000                     jmp        0x7fcb2c3c01af
0272f 488bf8                         mov        rdi, rax
02732 4889bc24f8010000               mov        qword ptr [rsp + 0x1f8], rdi
0273a 483b07                         cmp        rax, qword ptr [rdi]
0273d 488bf7                         mov        rsi, rdi
02740 48bb88b1421ccb7f0000           movabs     rbx, 0x7fcb1c42b188
0274a 8b36                           mov        esi, dword ptr [rsi]
0274c c1ee0d                         shr        esi, 0xd
0274f 48c1e60a                       shl        rsi, 0xa
02753 41ba00000036                   mov        r10d, 0x36000000
02759 4903f2                         add        rsi, r10
0275c 41bae3000000                   mov        r10d, 0xe3
02762 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02766 743c                           je         0x7fcb2c3c0224
02768 4983c202                       add        r10, 2
0276c 4981fae7000000                 cmp        r10, 0xe7
02773 75ed                           jne        0x7fcb2c3c01e2
02775 41bae3000000                   mov        r10d, 0xe3
0277b 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02780 7415                           je         0x7fcb2c3c0217
02782 4983c202                       add        r10, 2
02786 4981fae7000000                 cmp        r10, 0xe7
0278d 75ec                           jne        0x7fcb2c3c01fb
0278f 41bae2000000                   mov        r10d, 0xe2
02795 eb11                           jmp        0x7fcb2c3c0228
02797 50                             push       rax
02798 4833c0                         xor        rax, rax
0279b f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
027a1 58                             pop        rax
027a2 ebb8                           jmp        0x7fcb2c3c01dc
027a4 4983c201                       add        r10, 1
027a8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
027ad 48bec816131ccb7f0000           movabs     rsi, 0x7fcb1c1316c8
027b7 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
027ba 83c302                         add        ebx, 2
027bd 895e70                         mov        dword ptr [rsi + 0x70], ebx
027c0 81e3feff1f00                   and        ebx, 0x1ffffe
027c6 85db                           test       ebx, ebx
027c8 0f845e1d0000                   je         0x7fcb2c3c1fac
027ce 488bf7                         mov        rsi, rdi
027d1 48bbc816131ccb7f0000           movabs     rbx, 0x7fcb1c1316c8
027db 8b36                           mov        esi, dword ptr [rsi]
027dd c1ee0d                         shr        esi, 0xd
027e0 48c1e60a                       shl        rsi, 0xa
027e4 41ba00000036                   mov        r10d, 0x36000000
027ea 4903f2                         add        rsi, r10
027ed 41ba16000000                   mov        r10d, 0x16
027f3 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
027f7 7436                           je         0x7fcb2c3c02af
027f9 4983c202                       add        r10, 2
027fd 4983fa1a                       cmp        r10, 0x1a
02801 75f0                           jne        0x7fcb2c3c0273
02803 41ba16000000                   mov        r10d, 0x16
02809 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0280e 7412                           je         0x7fcb2c3c02a2
02810 4983c202                       add        r10, 2
02814 4983fa1a                       cmp        r10, 0x1a
02818 75ef                           jne        0x7fcb2c3c0289
0281a 41ba15000000                   mov        r10d, 0x15
02820 eb11                           jmp        0x7fcb2c3c02b3
02822 50                             push       rax
02823 4833c0                         xor        rax, rax
02826 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
0282c 58                             pop        rax
0282d ebbe                           jmp        0x7fcb2c3c026d
0282f 4983c201                       add        r10, 1
02833 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02838 488bf7                         mov        rsi, rdi
0283b 6690                           nop        
0283d 48b810f71308cb7f0000           movabs     rax, 0x7fcb0813f710
02847 e894b05307                     call       0x7fcb338fb360
0284c 0f1f84004429000f               nop        dword ptr [rax + rax + 0xf002944]
02854 48bec816131ccb7f0000           movabs     rsi, 0x7fcb1c1316c8
0285e 488386d800000001               add        qword ptr [rsi + 0xd8], 1
02866 48be6000131ccb7f0000           movabs     rsi, 0x7fcb1c130060
02870 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
02873 83c702                         add        edi, 2
02876 897e70                         mov        dword ptr [rsi + 0x70], edi
02879 81e7feff1f00                   and        edi, 0x1ffffe
0287f 85ff                           test       edi, edi
02881 0f84c61c0000                   je         0x7fcb2c3c1fcd
02887 448bac24e8010000               mov        r13d, dword ptr [rsp + 0x1e8]
0288f 8bbc24ec010000                 mov        edi, dword ptr [rsp + 0x1ec]
02896 48be6000131ccb7f0000           movabs     rsi, 0x7fcb1c130060
028a0 4883860801000001               add        qword ptr [rsi + 0x108], 1
028a8 ffc8                           dec        eax
028aa 442be8                         sub        r13d, eax
028ad 48be30f7121ccb7f0000           movabs     rsi, 0x7fcb1c12f730
028b7 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
028ba 83c302                         add        ebx, 2
028bd 895e70                         mov        dword ptr [rsi + 0x70], ebx
028c0 81e3feff1f00                   and        ebx, 0x1ffffe
028c6 85db                           test       ebx, ebx
028c8 0f84a01c0000                   je         0x7fcb2c3c1fee
028ce 48be30f7121ccb7f0000           movabs     rsi, 0x7fcb1c12f730
028d8 488386a800000001               add        qword ptr [rsi + 0xa8], 1
028e0 48be0000000000000000           movabs     rsi, 0
028ea be00000000                     mov        esi, 0
028ef 3bfe                           cmp        edi, esi
028f1 0f8c981c0000                   jl         0x7fcb2c3c200f
028f7 413bfd                         cmp        edi, r13d
028fa 0f8d9c1c0000                   jge        0x7fcb2c3c201c
02900 488bc7                         mov        rax, rdi
02903 898424f4010000                 mov        dword ptr [rsp + 0x1f4], eax
0290a 89bc24ec010000                 mov        dword ptr [rsp + 0x1ec], edi
02911 488bbc24f8010000               mov        rdi, qword ptr [rsp + 0x1f8]
02919 488bf7                         mov        rsi, rdi
0291c 48b9c816131ccb7f0000           movabs     rcx, 0x7fcb1c1316c8
02926 8b36                           mov        esi, dword ptr [rsi]
02928 c1ee0d                         shr        esi, 0xd
0292b 48c1e60a                       shl        rsi, 0xa
0292f 41ba00000036                   mov        r10d, 0x36000000
02935 4903f2                         add        rsi, r10
02938 41ba1e000000                   mov        r10d, 0x1e
0293e 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
02942 7436                           je         0x7fcb2c3c03fa
02944 4983c202                       add        r10, 2
02948 4983fa22                       cmp        r10, 0x22
0294c 75f0                           jne        0x7fcb2c3c03be
0294e 41ba1e000000                   mov        r10d, 0x1e
02954 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02959 7412                           je         0x7fcb2c3c03ed
0295b 4983c202                       add        r10, 2
0295f 4983fa22                       cmp        r10, 0x22
02963 75ef                           jne        0x7fcb2c3c03d4
02965 41ba1d000000                   mov        r10d, 0x1d
0296b eb11                           jmp        0x7fcb2c3c03fe
0296d 50                             push       rax
0296e 4833c0                         xor        rax, rax
02971 f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
02977 58                             pop        rax
02978 ebbe                           jmp        0x7fcb2c3c03b8
0297a 4983c201                       add        r10, 1
0297e 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02983 488bf7                         mov        rsi, rdi
02986 0f1f8000000000                 nop        dword ptr [rax]
0298d 48b838f71308cb7f0000           movabs     rax, 0x7fcb0813f738
02997 e844af5307                     call       0x7fcb338fb360
0299c 0f1f8400942a0010               nop        dword ptr [rax + rax + 0x10002a94]
029a4 483b00                         cmp        rax, qword ptr [rax]
029a7 488bf0                         mov        rsi, rax
029aa 48bac816131ccb7f0000           movabs     rdx, 0x7fcb1c1316c8
029b4 8b36                           mov        esi, dword ptr [rsi]
029b6 c1ee0d                         shr        esi, 0xd
029b9 48c1e60a                       shl        rsi, 0xa
029bd 41ba00000036                   mov        r10d, 0x36000000
029c3 4903f2                         add        rsi, r10
029c6 41ba24000000                   mov        r10d, 0x24
029cc 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
029d0 7436                           je         0x7fcb2c3c0488
029d2 4983c202                       add        r10, 2
029d6 4983fa28                       cmp        r10, 0x28
029da 75f0                           jne        0x7fcb2c3c044c
029dc 41ba24000000                   mov        r10d, 0x24
029e2 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
029e7 7412                           je         0x7fcb2c3c047b
029e9 4983c202                       add        r10, 2
029ed 4983fa28                       cmp        r10, 0x28
029f1 75ef                           jne        0x7fcb2c3c0462
029f3 41ba23000000                   mov        r10d, 0x23
029f9 eb11                           jmp        0x7fcb2c3c048c
029fb 50                             push       rax
029fc 4833c0                         xor        rax, rax
029ff f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
02a05 58                             pop        rax
02a06 ebbe                           jmp        0x7fcb2c3c0446
02a08 4983c201                       add        r10, 1
02a0c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02a11 8b7024                         mov        esi, dword ptr [rax + 0x24]
02a14 488bd0                         mov        rdx, rax
02a17 48b9c816131ccb7f0000           movabs     rcx, 0x7fcb1c1316c8
02a21 8b12                           mov        edx, dword ptr [rdx]
02a23 c1ea0d                         shr        edx, 0xd
02a26 48c1e20a                       shl        rdx, 0xa
02a2a 41ba00000036                   mov        r10d, 0x36000000
02a30 4903d2                         add        rdx, r10
02a33 41ba2a000000                   mov        r10d, 0x2a
02a39 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02a3d 7436                           je         0x7fcb2c3c04f5
02a3f 4983c202                       add        r10, 2
02a43 4983fa2e                       cmp        r10, 0x2e
02a47 75f0                           jne        0x7fcb2c3c04b9
02a49 41ba2a000000                   mov        r10d, 0x2a
02a4f 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02a54 7412                           je         0x7fcb2c3c04e8
02a56 4983c202                       add        r10, 2
02a5a 4983fa2e                       cmp        r10, 0x2e
02a5e 75ef                           jne        0x7fcb2c3c04cf
02a60 41ba29000000                   mov        r10d, 0x29
02a66 eb11                           jmp        0x7fcb2c3c04f9
02a68 50                             push       rax
02a69 4833c0                         xor        rax, rax
02a6c f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02a72 58                             pop        rax
02a73 ebbe                           jmp        0x7fcb2c3c04b3
02a75 4983c201                       add        r10, 1
02a79 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02a7e 8b4804                         mov        ecx, dword ptr [rax + 4]
02a81 48bac816131ccb7f0000           movabs     rdx, 0x7fcb1c1316c8
02a8b 4883827801000001               add        qword ptr [rdx + 0x178], 1
02a93 48ba9802131ccb7f0000           movabs     rdx, 0x7fcb1c130298
02a9d 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02aa1 4183c002                       add        r8d, 2
02aa5 44894270                       mov        dword ptr [rdx + 0x70], r8d
02aa9 4181e0feff1f00                 and        r8d, 0x1ffffe
02ab0 4585c0                         test       r8d, r8d
02ab3 0f84f51a0000                   je         0x7fcb2c3c202e
02ab9 48bac816131ccb7f0000           movabs     rdx, 0x7fcb1c1316c8
02ac3 4883828801000001               add        qword ptr [rdx + 0x188], 1
02acb 8b8424f4010000                 mov        eax, dword ptr [rsp + 0x1f4]
02ad2 4863c0                         movsxd     rax, eax
02ad5 ba08000000                     mov        edx, 8
02ada 4c8bc8                         mov        r9, rax
02add 4c03ca                         add        r9, rdx
02ae0 48ba80f4121ccb7f0000           movabs     rdx, 0x7fcb1c12f480
02aea 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02aee 4183c002                       add        r8d, 2
02af2 44894270                       mov        dword ptr [rdx + 0x70], r8d
02af6 4181e0feff1f00                 and        r8d, 0x1ffffe
02afd 4585c0                         test       r8d, r8d
02b00 0f84c91a0000                   je         0x7fcb2c3c204f
02b06 48ba80f4121ccb7f0000           movabs     rdx, 0x7fcb1c12f480
02b10 488382d800000001               add        qword ptr [rdx + 0xd8], 1
02b18 48baf8f5121ccb7f0000           movabs     rdx, 0x7fcb1c12f5f8
02b22 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02b26 4183c002                       add        r8d, 2
02b2a 44894270                       mov        dword ptr [rdx + 0x70], r8d
02b2e 4181e0feff1f00                 and        r8d, 0x1ffffe
02b35 4585c0                         test       r8d, r8d
02b38 0f84b21a0000                   je         0x7fcb2c3c2070
02b3e 48bac816131ccb7f0000           movabs     rdx, 0x7fcb1c1316c8
02b48 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
02b50 48ba080a6fe200000000           movabs     rdx, 0xe26f0a08
02b5a ba02000000                     mov        edx, 2
02b5f 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
02b67 bf00000000                     mov        edi, 0
02b6c 488b9c24f8010000               mov        rbx, qword ptr [rsp + 0x1f8]
02b74 48891c24                       mov        qword ptr [rsp], rbx
02b78 488b9c2438010000               mov        rbx, qword ptr [rsp + 0x138]
02b80 48895c2408                     mov        qword ptr [rsp + 8], rbx
02b85 4889442410                     mov        qword ptr [rsp + 0x10], rax
02b8a 49ba080a6fe200000000           movabs     r10, 0xe26f0a08
02b94 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02b99 660f1f440000                   nop        word ptr [rax + rax]
02b9f e83cb25307                     call       0x7fcb338fb860
02ba4 0f1f84009c2c0011               nop        dword ptr [rax + rax + 0x11002c9c]
02bac 8b8424ec010000                 mov        eax, dword ptr [rsp + 0x1ec]
02bb3 83c010                         add        eax, 0x10
02bb6 8bbc24e4010000                 mov        edi, dword ptr [rsp + 0x1e4]
02bbd 83c710                         add        edi, 0x10
02bc0 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02bc7 ba02000000                     mov        edx, 2
02bcc 7c05                           jl         0x7fcb2c3c0653
02bce ba00000000                     mov        edx, 0
02bd3 48b988b1421ccb7f0000           movabs     rcx, 0x7fcb1c42b188
02bdd 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
02be1 4403c2                         add        r8d, edx
02be4 44894174                       mov        dword ptr [rcx + 0x74], r8d
02be8 85d2                           test       edx, edx
02bea 7506                           jne        0x7fcb2c3c0672
02bec 41b802000000                   mov        r8d, 2
02bf2 4181e0fe3f0000                 and        r8d, 0x3ffe
02bf9 4585c0                         test       r8d, r8d
02bfc 0f840f1a0000                   je         0x7fcb2c3c2091
02c02 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02c06 418502                         test       dword ptr [r10], eax
02c09 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02c10 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
02c1a b940070000                     mov        ecx, 0x740
02c1f 7c05                           jl         0x7fcb2c3c06a6
02c21 b950070000                     mov        ecx, 0x750
02c26 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
02c2a 4d8d4001                       lea        r8, [r8 + 1]
02c2e 4c89040a                       mov        qword ptr [rdx + rcx], r8
02c32 0f8c70f5ffff                   jl         0x7fcb2c3bfc28
02c38 8b9c24f0010000                 mov        ebx, dword ptr [rsp + 0x1f0]
02c3f 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
02c49 ff8260070000                   inc        dword ptr [rdx + 0x760]
02c4f e97a0c0000                     jmp        0x7fcb2c3c134e
02c54 4183f908                       cmp        r9d, 8
02c58 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
02c62 b978070000                     mov        ecx, 0x778
02c67 7c05                           jl         0x7fcb2c3c06ee
02c69 b988070000                     mov        ecx, 0x788
02c6e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
02c72 4d8d4001                       lea        r8, [r8 + 1]
02c76 4c89040a                       mov        qword ptr [rdx + rcx], r8
02c7a 0f8cfe010000                   jl         0x7fcb2c3c08fe
02c80 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
02c87 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
02c8e 899c2408020000                 mov        dword ptr [rsp + 0x208], ebx
02c95 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
02c9c 0f1f4000                       nop        dword ptr [rax]
02ca0 89842400020000                 mov        dword ptr [rsp + 0x200], eax
02ca7 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
02caf 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
02cb9 4883829807000001               add        qword ptr [rdx + 0x798], 1
02cc1 48ba186a043700000000           movabs     rdx, 0x37046a18
02ccb 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02cce 83c102                         add        ecx, 2
02cd1 894a70                         mov        dword ptr [rdx + 0x70], ecx
02cd4 81e1feff1f00                   and        ecx, 0x1ffffe
02cda 85c9                           test       ecx, ecx
02cdc 0f8450190000                   je         0x7fcb2c3c20b2
02ce2 660f1f440000                   nop        word ptr [rax + rax]
02ce8 e975190000                     jmp        0x7fcb2c3c20e2
02ced 90                             nop        
02cee 90                             nop        
02cef 90                             nop        
02cf0 90                             nop        
02cf1 90                             nop        
02cf2 48ba186a043700000000           movabs     rdx, 0x37046a18
02cfc 488d92d8000000                 lea        rdx, [rdx + 0xd8]
02d03 4885c0                         test       rax, rax
02d06 750c                           jne        0x7fcb2c3c0794
02d08 f6420801                       test       byte ptr [rdx + 8], 1
02d0c 7506                           jne        0x7fcb2c3c0794
02d0e f048834a0801                   lock or    qword ptr [rdx + 8], 1
02d14 48be90556ae200000000           movabs     rsi, 0xe26a5590
02d1e 488bd6                         mov        rdx, rsi
02d21 48b9186a043700000000           movabs     rcx, 0x37046a18
02d2b 8b12                           mov        edx, dword ptr [rdx]
02d2d c1ea0d                         shr        edx, 0xd
02d30 48c1e20a                       shl        rdx, 0xa
02d34 41ba00000036                   mov        r10d, 0x36000000
02d3a 4903d2                         add        rdx, r10
02d3d 41ba16000000                   mov        r10d, 0x16
02d43 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02d47 7436                           je         0x7fcb2c3c07ff
02d49 4983c202                       add        r10, 2
02d4d 4983fa1a                       cmp        r10, 0x1a
02d51 75f0                           jne        0x7fcb2c3c07c3
02d53 41ba16000000                   mov        r10d, 0x16
02d59 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02d5e 7412                           je         0x7fcb2c3c07f2
02d60 4983c202                       add        r10, 2
02d64 4983fa1a                       cmp        r10, 0x1a
02d68 75ef                           jne        0x7fcb2c3c07d9
02d6a 41ba15000000                   mov        r10d, 0x15
02d70 eb11                           jmp        0x7fcb2c3c0803
02d72 50                             push       rax
02d73 4833c0                         xor        rax, rax
02d76 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02d7c 58                             pop        rax
02d7d ebbe                           jmp        0x7fcb2c3c07bd
02d7f 4983c201                       add        r10, 1
02d83 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02d88 488bd0                         mov        rdx, rax
02d8b 488bcf                         mov        rcx, rdi
02d8e 89bc2404020000                 mov        dword ptr [rsp + 0x204], edi
02d95 6690                           nop        
02d97 e844a65307                     call       0x7fcb338fae60
02d9c 0f1f8400942e0013               nop        dword ptr [rax + rax + 0x13002e94]
02da4 48be88b1421ccb7f0000           movabs     rsi, 0x7fcb1c42b188
02dae 488386a807000001               add        qword ptr [rsi + 0x7a8], 1
02db6 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
02dbe 8b942400020000                 mov        edx, dword ptr [rsp + 0x200]
02dc5 488bc8                         mov        rcx, rax
02dc8 0f1f8000000000                 nop        dword ptr [rax]
02dcf e80cb05307                     call       0x7fcb338fb860
02dd4 0f1f8400cc2e0014               nop        dword ptr [rax + rax + 0x14002ecc]
02ddc 8b842400020000                 mov        eax, dword ptr [rsp + 0x200]
02de3 83c008                         add        eax, 8
02de6 8bbc2404020000                 mov        edi, dword ptr [rsp + 0x204]
02ded 83c708                         add        edi, 8
02df0 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
02df7 be02000000                     mov        esi, 2
02dfc 7c05                           jl         0x7fcb2c3c0883
02dfe be00000000                     mov        esi, 0
02e03 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
02e0d 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
02e10 03ce                           add        ecx, esi
02e12 894a74                         mov        dword ptr [rdx + 0x74], ecx
02e15 85f6                           test       esi, esi
02e17 7505                           jne        0x7fcb2c3c089e
02e19 b902000000                     mov        ecx, 2
02e1e 81e1fe3f0000                   and        ecx, 0x3ffe
02e24 85c9                           test       ecx, ecx
02e26 0f8440180000                   je         0x7fcb2c3c20ec
02e2c 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02e30 418502                         test       dword ptr [r10], eax
02e33 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
02e3a 48be88b1421ccb7f0000           movabs     rsi, 0x7fcb1c42b188
02e44 bab8070000                     mov        edx, 0x7b8
02e49 7c05                           jl         0x7fcb2c3c08d0
02e4b bac8070000                     mov        edx, 0x7c8
02e50 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
02e54 488d4901                       lea        rcx, [rcx + 1]
02e58 48890c16                       mov        qword ptr [rsi + rdx], rcx
02e5c 0f8c3efeffff                   jl         0x7fcb2c3c0720
02e62 8b9c2408020000                 mov        ebx, dword ptr [rsp + 0x208]
02e69 48be88b1421ccb7f0000           movabs     rsi, 0x7fcb1c42b188
02e73 ff86d8070000                   inc        dword ptr [rsi + 0x7d8]
02e79 e9500a0000                     jmp        0x7fcb2c3c134e
02e7e 48be88b1421ccb7f0000           movabs     rsi, 0x7fcb1c42b188
02e88 488386f007000001               add        qword ptr [rsi + 0x7f0], 1
02e90 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
02e98 8b9424d0010000                 mov        edx, dword ptr [rsp + 0x1d0]
02e9f 488bcf                         mov        rcx, rdi
02ea2 4d8bc1                         mov        r8, r9
02ea5 448b8c2478010000               mov        r9d, dword ptr [rsp + 0x178]
02ead 6690                           nop        
02eaf e82caf5307                     call       0x7fcb338fb860
02eb4 0f1f8400ac2f0016               nop        dword ptr [rax + rax + 0x16002fac]
02ebc 488bd8                         mov        rbx, rax
02ebf e90a0a0000                     jmp        0x7fcb2c3c134e
02ec4 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
02ecb 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
02ed2 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
02eda 48be88b1421ccb7f0000           movabs     rsi, 0x7fcb1c42b188
02ee4 488386c805000001               add        qword ptr [rsi + 0x5c8], 1
02eec 48be080a131ccb7f0000           movabs     rsi, 0x7fcb1c130a08
02ef6 8b5670                         mov        edx, dword ptr [rsi + 0x70]
02ef9 83c202                         add        edx, 2
02efc 895670                         mov        dword ptr [rsi + 0x70], edx
02eff 81e2feff1f00                   and        edx, 0x1ffffe
02f05 85d2                           test       edx, edx
02f07 0f8480170000                   je         0x7fcb2c3c210d
02f0d 48be58936de200000000           movabs     rsi, 0xe26d9358
02f17 48ba080a131ccb7f0000           movabs     rdx, 0x7fcb1c130a08
02f21 8b36                           mov        esi, dword ptr [rsi]
02f23 c1ee0d                         shr        esi, 0xd
02f26 48c1e60a                       shl        rsi, 0xa
02f2a 41ba00000036                   mov        r10d, 0x36000000
02f30 4903f2                         add        rsi, r10
02f33 41ba16000000                   mov        r10d, 0x16
02f39 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02f3d 7436                           je         0x7fcb2c3c09f5
02f3f 4983c202                       add        r10, 2
02f43 4983fa1a                       cmp        r10, 0x1a
02f47 75f0                           jne        0x7fcb2c3c09b9
02f49 41ba16000000                   mov        r10d, 0x16
02f4f 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02f54 7412                           je         0x7fcb2c3c09e8
02f56 4983c202                       add        r10, 2
02f5a 4983fa1a                       cmp        r10, 0x1a
02f5e 75ef                           jne        0x7fcb2c3c09cf
02f60 41ba15000000                   mov        r10d, 0x15
02f66 eb11                           jmp        0x7fcb2c3c09f9
02f68 50                             push       rax
02f69 4833c0                         xor        rax, rax
02f6c f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
02f72 58                             pop        rax
02f73 ebbe                           jmp        0x7fcb2c3c09b3
02f75 4983c201                       add        r10, 1
02f79 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02f7e 8b5804                         mov        ebx, dword ptr [rax + 4]
02f81 48be080a131ccb7f0000           movabs     rsi, 0x7fcb1c130a08
02f8b 488386d800000001               add        qword ptr [rsi + 0xd8], 1
02f93 48be6000131ccb7f0000           movabs     rsi, 0x7fcb1c130060
02f9d 8b5670                         mov        edx, dword ptr [rsi + 0x70]
02fa0 83c202                         add        edx, 2
02fa3 895670                         mov        dword ptr [rsi + 0x70], edx
02fa6 81e2feff1f00                   and        edx, 0x1ffffe
02fac 85d2                           test       edx, edx
02fae 0f84ff160000                   je         0x7fcb2c3c2133
02fb4 48be6000131ccb7f0000           movabs     rsi, 0x7fcb1c130060
02fbe 4883860801000001               add        qword ptr [rsi + 0x108], 1
02fc6 488bf3                         mov        rsi, rbx
02fc9 83ee0f                         sub        esi, 0xf
02fcc 48ba30f7121ccb7f0000           movabs     rdx, 0x7fcb1c12f730
02fd6 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02fd9 83c102                         add        ecx, 2
02fdc 894a70                         mov        dword ptr [rdx + 0x70], ecx
02fdf 81e1feff1f00                   and        ecx, 0x1ffffe
02fe5 85c9                           test       ecx, ecx
02fe7 0f84e7160000                   je         0x7fcb2c3c2154
02fed 48ba30f7121ccb7f0000           movabs     rdx, 0x7fcb1c12f730
02ff7 488382a800000001               add        qword ptr [rdx + 0xa8], 1
02fff 48ba0000000000000000           movabs     rdx, 0
03009 ba00000000                     mov        edx, 0
0300e 3bfa                           cmp        edi, edx
03010 0f8cdf160000                   jl         0x7fcb2c3c2175
03016 3bfe                           cmp        edi, esi
03018 0f8de4160000                   jge        0x7fcb2c3c2182
0301e 48be58936de200000000           movabs     rsi, 0xe26d9358
03028 488bd6                         mov        rdx, rsi
0302b 48b9080a131ccb7f0000           movabs     rcx, 0x7fcb1c130a08
03035 8b12                           mov        edx, dword ptr [rdx]
03037 c1ea0d                         shr        edx, 0xd
0303a 48c1e20a                       shl        rdx, 0xa
0303e 41ba00000036                   mov        r10d, 0x36000000
03044 4903d2                         add        rdx, r10
03047 41ba24000000                   mov        r10d, 0x24
0304d 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03051 7436                           je         0x7fcb2c3c0b09
03053 4983c202                       add        r10, 2
03057 4983fa28                       cmp        r10, 0x28
0305b 75f0                           jne        0x7fcb2c3c0acd
0305d 41ba24000000                   mov        r10d, 0x24
03063 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03068 7412                           je         0x7fcb2c3c0afc
0306a 4983c202                       add        r10, 2
0306e 4983fa28                       cmp        r10, 0x28
03072 75ef                           jne        0x7fcb2c3c0ae3
03074 41ba23000000                   mov        r10d, 0x23
0307a eb11                           jmp        0x7fcb2c3c0b0d
0307c 50                             push       rax
0307d 4833c0                         xor        rax, rax
03080 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03086 58                             pop        rax
03087 ebbe                           jmp        0x7fcb2c3c0ac7
03089 4983c201                       add        r10, 1
0308d 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03092 48ba30f8121ccb7f0000           movabs     rdx, 0x7fcb1c12f830
0309c 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0309f 83c102                         add        ecx, 2
030a2 894a70                         mov        dword ptr [rdx + 0x70], ecx
030a5 81e1feff1f00                   and        ecx, 0x1ffffe
030ab 85c9                           test       ecx, ecx
030ad 0f845c160000                   je         0x7fcb2c3c218f
030b3 48ba30f8121ccb7f0000           movabs     rdx, 0x7fcb1c12f830
030bd 488382a800000001               add        qword ptr [rdx + 0xa8], 1
030c5 48be58f9121ccb7f0000           movabs     rsi, 0x7fcb1c12f958
030cf 8b5670                         mov        edx, dword ptr [rsi + 0x70]
030d2 83c202                         add        edx, 2
030d5 895670                         mov        dword ptr [rsi + 0x70], edx
030d8 81e2feff1f00                   and        edx, 0x1ffffe
030de 85d2                           test       edx, edx
030e0 0f844a160000                   je         0x7fcb2c3c21b0
030e6 48be58f9121ccb7f0000           movabs     rsi, 0x7fcb1c12f958
030f0 ff86b8000000                   inc        dword ptr [rsi + 0xb8]
030f6 899c240c020000                 mov        dword ptr [rsp + 0x20c], ebx
030fd 48be50136ee200000000           movabs     rsi, 0xe26e1350
03107 488bd6                         mov        rdx, rsi
0310a 48b9080a131ccb7f0000           movabs     rcx, 0x7fcb1c130a08
03114 4883815801000001               add        qword ptr [rcx + 0x158], 1
0311c 48bad00b131ccb7f0000           movabs     rdx, 0x7fcb1c130bd0
03126 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03129 83c102                         add        ecx, 2
0312c 894a70                         mov        dword ptr [rdx + 0x70], ecx
0312f 81e1feff1f00                   and        ecx, 0x1ffffe
03135 85c9                           test       ecx, ecx
03137 0f8414160000                   je         0x7fcb2c3c21d1
0313d 488bd6                         mov        rdx, rsi
03140 48b9d00b131ccb7f0000           movabs     rcx, 0x7fcb1c130bd0
0314a 488381a800000001               add        qword ptr [rcx + 0xa8], 1
03152 48bab00c131ccb7f0000           movabs     rdx, 0x7fcb1c130cb0
0315c 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0315f 83c102                         add        ecx, 2
03162 894a70                         mov        dword ptr [rdx + 0x70], ecx
03165 81e1feff1f00                   and        ecx, 0x1ffffe
0316b 85c9                           test       ecx, ecx
0316d 0f84ff150000                   je         0x7fcb2c3c21f2
03173 48bab00c131ccb7f0000           movabs     rdx, 0x7fcb1c130cb0
0317d 488382b800000001               add        qword ptr [rdx + 0xb8], 1
03185 48bed801131ccb7f0000           movabs     rsi, 0x7fcb1c1301d8
0318f 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03192 83c202                         add        edx, 2
03195 895670                         mov        dword ptr [rsi + 0x70], edx
03198 81e2feff1f00                   and        edx, 0x1ffffe
0319e 85d2                           test       edx, edx
031a0 0f84ed150000                   je         0x7fcb2c3c2213
031a6 48be58936de200000000           movabs     rsi, 0xe26d9358
031b0 488bd6                         mov        rdx, rsi
031b3 48b9b00c131ccb7f0000           movabs     rcx, 0x7fcb1c130cb0
031bd 8b12                           mov        edx, dword ptr [rdx]
031bf c1ea0d                         shr        edx, 0xd
031c2 48c1e20a                       shl        rdx, 0xa
031c6 41ba00000036                   mov        r10d, 0x36000000
031cc 4903d2                         add        rdx, r10
031cf 41ba1c000000                   mov        r10d, 0x1c
031d5 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
031d9 7436                           je         0x7fcb2c3c0c91
031db 4983c202                       add        r10, 2
031df 4983fa20                       cmp        r10, 0x20
031e3 75f0                           jne        0x7fcb2c3c0c55
031e5 41ba1c000000                   mov        r10d, 0x1c
031eb 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
031f0 7412                           je         0x7fcb2c3c0c84
031f2 4983c202                       add        r10, 2
031f6 4983fa20                       cmp        r10, 0x20
031fa 75ef                           jne        0x7fcb2c3c0c6b
031fc 41ba1b000000                   mov        r10d, 0x1b
03202 eb11                           jmp        0x7fcb2c3c0c95
03204 50                             push       rax
03205 4833c0                         xor        rax, rax
03208 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
0320e 58                             pop        rax
0320f ebbe                           jmp        0x7fcb2c3c0c4f
03211 4983c201                       add        r10, 1
03215 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0321a 48bab00c131ccb7f0000           movabs     rdx, 0x7fcb1c130cb0
03224 8b36                           mov        esi, dword ptr [rsi]
03226 c1ee0d                         shr        esi, 0xd
03229 48c1e60a                       shl        rsi, 0xa
0322d 41ba00000036                   mov        r10d, 0x36000000
03233 4903f2                         add        rsi, r10
03236 41ba22000000                   mov        r10d, 0x22
0323c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03240 7436                           je         0x7fcb2c3c0cf8
03242 4983c202                       add        r10, 2
03246 4983fa26                       cmp        r10, 0x26
0324a 75f0                           jne        0x7fcb2c3c0cbc
0324c 41ba22000000                   mov        r10d, 0x22
03252 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03257 7412                           je         0x7fcb2c3c0ceb
03259 4983c202                       add        r10, 2
0325d 4983fa26                       cmp        r10, 0x26
03261 75ef                           jne        0x7fcb2c3c0cd2
03263 41ba21000000                   mov        r10d, 0x21
03269 eb11                           jmp        0x7fcb2c3c0cfc
0326b 50                             push       rax
0326c 4833c0                         xor        rax, rax
0326f f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03275 58                             pop        rax
03276 ebbe                           jmp        0x7fcb2c3c0cb6
03278 4983c201                       add        r10, 1
0327c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03281 48beb00c131ccb7f0000           movabs     rsi, 0x7fcb1c130cb0
0328b 4883863801000001               add        qword ptr [rsi + 0x138], 1
03293 48be9802131ccb7f0000           movabs     rsi, 0x7fcb1c130298
0329d 8b5670                         mov        edx, dword ptr [rsi + 0x70]
032a0 83c202                         add        edx, 2
032a3 895670                         mov        dword ptr [rsi + 0x70], edx
032a6 81e2feff1f00                   and        edx, 0x1ffffe
032ac 85d2                           test       edx, edx
032ae 0f8400150000                   je         0x7fcb2c3c2234
032b4 48beb00c131ccb7f0000           movabs     rsi, 0x7fcb1c130cb0
032be 4883864801000001               add        qword ptr [rsi + 0x148], 1
032c6 4c63df                         movsxd     r11, edi
032c9 be08000000                     mov        esi, 8
032ce 4d8bcb                         mov        r9, r11
032d1 4c03ce                         add        r9, rsi
032d4 48be80f4121ccb7f0000           movabs     rsi, 0x7fcb1c12f480
032de 8b5670                         mov        edx, dword ptr [rsi + 0x70]
032e1 83c202                         add        edx, 2
032e4 895670                         mov        dword ptr [rsi + 0x70], edx
032e7 81e2feff1f00                   and        edx, 0x1ffffe
032ed 85d2                           test       edx, edx
032ef 0f84e0140000                   je         0x7fcb2c3c2255
032f5 48be80f4121ccb7f0000           movabs     rsi, 0x7fcb1c12f480
032ff 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03307 48bef8f5121ccb7f0000           movabs     rsi, 0x7fcb1c12f5f8
03311 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03314 83c202                         add        edx, 2
03317 895670                         mov        dword ptr [rsi + 0x70], edx
0331a 81e2feff1f00                   and        edx, 0x1ffffe
03320 85d2                           test       edx, edx
03322 0f84ce140000                   je         0x7fcb2c3c2276
03328 48beb00c131ccb7f0000           movabs     rsi, 0x7fcb1c130cb0
03332 4883866801000001               add        qword ptr [rsi + 0x168], 1
0333a 48be206c6ee200000000           movabs     rsi, 0xe26e6c20
03344 48bea0936de200000000           movabs     rsi, 0xe26d93a0
0334e ba02000000                     mov        edx, 2
03353 b910000000                     mov        ecx, 0x10
03358 4c8bc0                         mov        r8, rax
0335b bf00000000                     mov        edi, 0
03360 48890424                       mov        qword ptr [rsp], rax
03364 4c895c2408                     mov        qword ptr [rsp + 8], r11
03369 49ba58936de200000000           movabs     r10, 0xe26d9358
03373 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03378 49ba206c6ee200000000           movabs     r10, 0xe26e6c20
03382 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03387 e854aa5307                     call       0x7fcb338fb860
0338c 0f1f840084340017               nop        dword ptr [rax + rax + 0x17003484]
03394 4885c0                         test       rax, rax
03397 48bbb00c131ccb7f0000           movabs     rbx, 0x7fcb1c130cb0
033a1 750c                           jne        0x7fcb2c3c0e2f
033a3 808b7101000001                 or         byte ptr [rbx + 0x171], 1
033aa e988000000                     jmp        0x7fcb2c3c0eb7
033af 8b38                           mov        edi, dword ptr [rax]
033b1 c1ef0d                         shr        edi, 0xd
033b4 48c1e70a                       shl        rdi, 0xa
033b8 41ba00000036                   mov        r10d, 0x36000000
033be 4903fa                         add        rdi, r10
033c1 41ba30000000                   mov        r10d, 0x30
033c7 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
033cb 7436                           je         0x7fcb2c3c0e83
033cd 4983c202                       add        r10, 2
033d1 4983fa34                       cmp        r10, 0x34
033d5 75f0                           jne        0x7fcb2c3c0e47
033d7 41ba30000000                   mov        r10d, 0x30
033dd 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
033e2 7412                           je         0x7fcb2c3c0e76
033e4 4983c202                       add        r10, 2
033e8 4983fa34                       cmp        r10, 0x34
033ec 75ef                           jne        0x7fcb2c3c0e5d
033ee 41ba2f000000                   mov        r10d, 0x2f
033f4 eb11                           jmp        0x7fcb2c3c0e87
033f6 50                             push       rax
033f7 4833c0                         xor        rax, rax
033fa f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
03400 58                             pop        rax
03401 ebbe                           jmp        0x7fcb2c3c0e41
03403 4983c201                       add        r10, 1
03407 4a8304d301                     add        qword ptr [rbx + r10*8], 1
0340c 48bf0080003700000000           movabs     rdi, 0x37008000
03416 8b18                           mov        ebx, dword ptr [rax]
03418 c1eb0d                         shr        ebx, 0xd
0341b 48c1e30a                       shl        rbx, 0xa
0341f 41ba00000036                   mov        r10d, 0x36000000
03425 4903da                         add        rbx, r10
03428 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
0342c 0f85e5130000                   jne        0x7fcb2c3c2297
03432 e900000000                     jmp        0x7fcb2c3c0eb7
03437 488bf8                         mov        rdi, rax
0343a 4889bc2410020000               mov        qword ptr [rsp + 0x210], rdi
03442 483b07                         cmp        rax, qword ptr [rdi]
03445 488bf7                         mov        rsi, rdi
03448 48bb88b1421ccb7f0000           movabs     rbx, 0x7fcb1c42b188
03452 8b36                           mov        esi, dword ptr [rsi]
03454 c1ee0d                         shr        esi, 0xd
03457 48c1e60a                       shl        rsi, 0xa
0345b 41ba00000036                   mov        r10d, 0x36000000
03461 4903f2                         add        rsi, r10
03464 41babc000000                   mov        r10d, 0xbc
0346a 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
0346e 743c                           je         0x7fcb2c3c0f2c
03470 4983c202                       add        r10, 2
03474 4981fac0000000                 cmp        r10, 0xc0
0347b 75ed                           jne        0x7fcb2c3c0eea
0347d 41babc000000                   mov        r10d, 0xbc
03483 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03488 7415                           je         0x7fcb2c3c0f1f
0348a 4983c202                       add        r10, 2
0348e 4981fac0000000                 cmp        r10, 0xc0
03495 75ec                           jne        0x7fcb2c3c0f03
03497 41babb000000                   mov        r10d, 0xbb
0349d eb11                           jmp        0x7fcb2c3c0f30
0349f 50                             push       rax
034a0 4833c0                         xor        rax, rax
034a3 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
034a9 58                             pop        rax
034aa ebb8                           jmp        0x7fcb2c3c0ee4
034ac 4983c201                       add        r10, 1
034b0 4a8304d301                     add        qword ptr [rbx + r10*8], 1
034b5 48bec816131ccb7f0000           movabs     rsi, 0x7fcb1c1316c8
034bf 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
034c2 83c302                         add        ebx, 2
034c5 895e70                         mov        dword ptr [rsi + 0x70], ebx
034c8 81e3feff1f00                   and        ebx, 0x1ffffe
034ce 85db                           test       ebx, ebx
034d0 0f844f130000                   je         0x7fcb2c3c22a5
034d6 488bf7                         mov        rsi, rdi
034d9 48bbc816131ccb7f0000           movabs     rbx, 0x7fcb1c1316c8
034e3 8b36                           mov        esi, dword ptr [rsi]
034e5 c1ee0d                         shr        esi, 0xd
034e8 48c1e60a                       shl        rsi, 0xa
034ec 41ba00000036                   mov        r10d, 0x36000000
034f2 4903f2                         add        rsi, r10
034f5 41ba16000000                   mov        r10d, 0x16
034fb 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
034ff 7436                           je         0x7fcb2c3c0fb7
03501 4983c202                       add        r10, 2
03505 4983fa1a                       cmp        r10, 0x1a
03509 75f0                           jne        0x7fcb2c3c0f7b
0350b 41ba16000000                   mov        r10d, 0x16
03511 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03516 7412                           je         0x7fcb2c3c0faa
03518 4983c202                       add        r10, 2
0351c 4983fa1a                       cmp        r10, 0x1a
03520 75ef                           jne        0x7fcb2c3c0f91
03522 41ba15000000                   mov        r10d, 0x15
03528 eb11                           jmp        0x7fcb2c3c0fbb
0352a 50                             push       rax
0352b 4833c0                         xor        rax, rax
0352e f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
03534 58                             pop        rax
03535 ebbe                           jmp        0x7fcb2c3c0f75
03537 4983c201                       add        r10, 1
0353b 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03540 488bf7                         mov        rsi, rdi
03543 6690                           nop        
03545 48b860f71308cb7f0000           movabs     rax, 0x7fcb0813f760
0354f e88ca35307                     call       0x7fcb338fb360
03554 0f1f84004c360018               nop        dword ptr [rax + rax + 0x1800364c]
0355c 48bec816131ccb7f0000           movabs     rsi, 0x7fcb1c1316c8
03566 488386d800000001               add        qword ptr [rsi + 0xd8], 1
0356e 48be6000131ccb7f0000           movabs     rsi, 0x7fcb1c130060
03578 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
0357b 83c702                         add        edi, 2
0357e 897e70                         mov        dword ptr [rsi + 0x70], edi
03581 81e7feff1f00                   and        edi, 0x1ffffe
03587 85ff                           test       edi, edi
03589 0f84b7120000                   je         0x7fcb2c3c22c6
0358f 8b9c240c020000                 mov        ebx, dword ptr [rsp + 0x20c]
03596 8bbc24d0010000                 mov        edi, dword ptr [rsp + 0x1d0]
0359d 48be6000131ccb7f0000           movabs     rsi, 0x7fcb1c130060
035a7 4883860801000001               add        qword ptr [rsi + 0x108], 1
035af ffc8                           dec        eax
035b1 2bd8                           sub        ebx, eax
035b3 48be30f7121ccb7f0000           movabs     rsi, 0x7fcb1c12f730
035bd 8b4670                         mov        eax, dword ptr [rsi + 0x70]
035c0 83c002                         add        eax, 2
035c3 894670                         mov        dword ptr [rsi + 0x70], eax
035c6 25feff1f00                     and        eax, 0x1ffffe
035cb 85c0                           test       eax, eax
035cd 0f8494120000                   je         0x7fcb2c3c22e7
035d3 48be30f7121ccb7f0000           movabs     rsi, 0x7fcb1c12f730
035dd 488386a800000001               add        qword ptr [rsi + 0xa8], 1
035e5 48be0000000000000000           movabs     rsi, 0
035ef be00000000                     mov        esi, 0
035f4 3bfe                           cmp        edi, esi
035f6 0f8c8c120000                   jl         0x7fcb2c3c2308
035fc 3bfb                           cmp        edi, ebx
035fe 0f8d91120000                   jge        0x7fcb2c3c2315
03604 488bdf                         mov        rbx, rdi
03607 899c2418020000                 mov        dword ptr [rsp + 0x218], ebx
0360e 89bc24d0010000                 mov        dword ptr [rsp + 0x1d0], edi
03615 488bbc2410020000               mov        rdi, qword ptr [rsp + 0x210]
0361d 488bf7                         mov        rsi, rdi
03620 48b9c816131ccb7f0000           movabs     rcx, 0x7fcb1c1316c8
0362a 8b36                           mov        esi, dword ptr [rsi]
0362c c1ee0d                         shr        esi, 0xd
0362f 48c1e60a                       shl        rsi, 0xa
03633 41ba00000036                   mov        r10d, 0x36000000
03639 4903f2                         add        rsi, r10
0363c 41ba1e000000                   mov        r10d, 0x1e
03642 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
03646 7436                           je         0x7fcb2c3c10fe
03648 4983c202                       add        r10, 2
0364c 4983fa22                       cmp        r10, 0x22
03650 75f0                           jne        0x7fcb2c3c10c2
03652 41ba1e000000                   mov        r10d, 0x1e
03658 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0365d 7412                           je         0x7fcb2c3c10f1
0365f 4983c202                       add        r10, 2
03663 4983fa22                       cmp        r10, 0x22
03667 75ef                           jne        0x7fcb2c3c10d8
03669 41ba1d000000                   mov        r10d, 0x1d
0366f eb11                           jmp        0x7fcb2c3c1102
03671 50                             push       rax
03672 4833c0                         xor        rax, rax
03675 f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
0367b 58                             pop        rax
0367c ebbe                           jmp        0x7fcb2c3c10bc
0367e 4983c201                       add        r10, 1
03682 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03687 488bf7                         mov        rsi, rdi
0368a 666690                         nop        
0368d 48b888f71308cb7f0000           movabs     rax, 0x7fcb0813f788
03697 e844a25307                     call       0x7fcb338fb360
0369c 0f1f840094370019               nop        dword ptr [rax + rax + 0x19003794]
036a4 483b00                         cmp        rax, qword ptr [rax]
036a7 488bf0                         mov        rsi, rax
036aa 48bac816131ccb7f0000           movabs     rdx, 0x7fcb1c1316c8
036b4 8b36                           mov        esi, dword ptr [rsi]
036b6 c1ee0d                         shr        esi, 0xd
036b9 48c1e60a                       shl        rsi, 0xa
036bd 41ba00000036                   mov        r10d, 0x36000000
036c3 4903f2                         add        rsi, r10
036c6 41ba24000000                   mov        r10d, 0x24
036cc 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
036d0 7436                           je         0x7fcb2c3c1188
036d2 4983c202                       add        r10, 2
036d6 4983fa28                       cmp        r10, 0x28
036da 75f0                           jne        0x7fcb2c3c114c
036dc 41ba24000000                   mov        r10d, 0x24
036e2 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
036e7 7412                           je         0x7fcb2c3c117b
036e9 4983c202                       add        r10, 2
036ed 4983fa28                       cmp        r10, 0x28
036f1 75ef                           jne        0x7fcb2c3c1162
036f3 41ba23000000                   mov        r10d, 0x23
036f9 eb11                           jmp        0x7fcb2c3c118c
036fb 50                             push       rax
036fc 4833c0                         xor        rax, rax
036ff f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03705 58                             pop        rax
03706 ebbe                           jmp        0x7fcb2c3c1146
03708 4983c201                       add        r10, 1
0370c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03711 8b7024                         mov        esi, dword ptr [rax + 0x24]
03714 488bd0                         mov        rdx, rax
03717 48b9c816131ccb7f0000           movabs     rcx, 0x7fcb1c1316c8
03721 8b12                           mov        edx, dword ptr [rdx]
03723 c1ea0d                         shr        edx, 0xd
03726 48c1e20a                       shl        rdx, 0xa
0372a 41ba00000036                   mov        r10d, 0x36000000
03730 4903d2                         add        rdx, r10
03733 41ba2a000000                   mov        r10d, 0x2a
03739 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0373d 7436                           je         0x7fcb2c3c11f5
0373f 4983c202                       add        r10, 2
03743 4983fa2e                       cmp        r10, 0x2e
03747 75f0                           jne        0x7fcb2c3c11b9
03749 41ba2a000000                   mov        r10d, 0x2a
0374f 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03754 7412                           je         0x7fcb2c3c11e8
03756 4983c202                       add        r10, 2
0375a 4983fa2e                       cmp        r10, 0x2e
0375e 75ef                           jne        0x7fcb2c3c11cf
03760 41ba29000000                   mov        r10d, 0x29
03766 eb11                           jmp        0x7fcb2c3c11f9
03768 50                             push       rax
03769 4833c0                         xor        rax, rax
0376c f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03772 58                             pop        rax
03773 ebbe                           jmp        0x7fcb2c3c11b3
03775 4983c201                       add        r10, 1
03779 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0377e 8b4804                         mov        ecx, dword ptr [rax + 4]
03781 48bac816131ccb7f0000           movabs     rdx, 0x7fcb1c1316c8
0378b 4883827801000001               add        qword ptr [rdx + 0x178], 1
03793 48ba9802131ccb7f0000           movabs     rdx, 0x7fcb1c130298
0379d 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
037a1 4183c002                       add        r8d, 2
037a5 44894270                       mov        dword ptr [rdx + 0x70], r8d
037a9 4181e0feff1f00                 and        r8d, 0x1ffffe
037b0 4585c0                         test       r8d, r8d
037b3 0f84ee100000                   je         0x7fcb2c3c2327
037b9 48bac816131ccb7f0000           movabs     rdx, 0x7fcb1c1316c8
037c3 4883828801000001               add        qword ptr [rdx + 0x188], 1
037cb 8b9c2418020000                 mov        ebx, dword ptr [rsp + 0x218]
037d2 4863db                         movsxd     rbx, ebx
037d5 ba08000000                     mov        edx, 8
037da 4c8bcb                         mov        r9, rbx
037dd 4c03ca                         add        r9, rdx
037e0 48ba80f4121ccb7f0000           movabs     rdx, 0x7fcb1c12f480
037ea 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
037ee 4183c002                       add        r8d, 2
037f2 44894270                       mov        dword ptr [rdx + 0x70], r8d
037f6 4181e0feff1f00                 and        r8d, 0x1ffffe
037fd 4585c0                         test       r8d, r8d
03800 0f84c2100000                   je         0x7fcb2c3c2348
03806 48ba80f4121ccb7f0000           movabs     rdx, 0x7fcb1c12f480
03810 488382d800000001               add        qword ptr [rdx + 0xd8], 1
03818 48baf8f5121ccb7f0000           movabs     rdx, 0x7fcb1c12f5f8
03822 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03826 4183c002                       add        r8d, 2
0382a 44894270                       mov        dword ptr [rdx + 0x70], r8d
0382e 4181e0feff1f00                 and        r8d, 0x1ffffe
03835 4585c0                         test       r8d, r8d
03838 0f84ab100000                   je         0x7fcb2c3c2369
0383e 48bac816131ccb7f0000           movabs     rdx, 0x7fcb1c1316c8
03848 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
03850 48ba080a6fe200000000           movabs     rdx, 0xe26f0a08
0385a ba02000000                     mov        edx, 2
0385f 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
03867 bf00000000                     mov        edi, 0
0386c 488b842410020000               mov        rax, qword ptr [rsp + 0x210]
03874 48890424                       mov        qword ptr [rsp], rax
03878 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03880 4889442408                     mov        qword ptr [rsp + 8], rax
03885 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
0388a 49ba080a6fe200000000           movabs     r10, 0xe26f0a08
03894 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03899 660f1f440000                   nop        word ptr [rax + rax]
0389f e83ca55307                     call       0x7fcb338fb860
038a4 0f1f84009c39001a               nop        dword ptr [rax + rax + 0x1a00399c]
038ac 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
038b3 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
038bb 4103d8                         add        ebx, r8d
038be 48be88b1421ccb7f0000           movabs     rsi, 0x7fcb1c42b188
038c8 ff8608060000                   inc        dword ptr [rsi + 0x608]
038ce 8bb424d4010000                 mov        esi, dword ptr [rsp + 0x1d4]
038d5 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
038df ff8200080000                   inc        dword ptr [rdx + 0x800]
038e5 488bc3                         mov        rax, rbx
038e8 8b942444010000                 mov        edx, dword ptr [rsp + 0x144]
038ef ffc2                           inc        edx
038f1 48b988b1421ccb7f0000           movabs     rcx, 0x7fcb1c42b188
038fb 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
038ff 4183c002                       add        r8d, 2
03903 44894174                       mov        dword ptr [rcx + 0x74], r8d
03907 4181e0fe3f0000                 and        r8d, 0x3ffe
0390e 4585c0                         test       r8d, r8d
03911 0f84f30f0000                   je         0x7fcb2c3c238a
03917 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0391b 418502                         test       dword ptr [r10], eax
0391e 48b988b1421ccb7f0000           movabs     rcx, 0x7fcb1c42b188
03928 ff8128080000                   inc        dword ptr [rcx + 0x828]
0392e 488bce                         mov        rcx, rsi
03931 4c8bd8                         mov        r11, rax
03934 488bf1                         mov        rsi, rcx
03937 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
0393f 488b9c2468020000               mov        rbx, qword ptr [rsp + 0x268]
03947 8bbc2430010000                 mov        edi, dword ptr [rsp + 0x130]
0394e 4c8b8c2420010000               mov        r9, qword ptr [rsp + 0x120]
03956 4c8b842428010000               mov        r8, qword ptr [rsp + 0x128]
0395e 8b8c2434010000                 mov        ecx, dword ptr [rsp + 0x134]
03965 e986c9ffff                     jmp        0x7fcb2c3bdd70
0396a 4c8bc8                         mov        r9, rax
0396d 4585c9                         test       r9d, r9d
03970 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
0397a b980030000                     mov        ecx, 0x380
0397f 7e05                           jle        0x7fcb2c3c1406
03981 b990030000                     mov        ecx, 0x390
03986 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0398a 4d8d4001                       lea        r8, [r8 + 1]
0398e 4c89040a                       mov        qword ptr [rdx + rcx], r8
03992 0f8e77010000                   jle        0x7fcb2c3c158f
03998 488b9c2498010000               mov        rbx, qword ptr [rsp + 0x198]
039a0 482bf3                         sub        rsi, rbx
039a3 ba00000000                     mov        edx, 0
039a8 483bf2                         cmp        rsi, rdx
039ab 48be88b1421ccb7f0000           movabs     rsi, 0x7fcb1c42b188
039b5 baa0030000                     mov        edx, 0x3a0
039ba 7d05                           jge        0x7fcb2c3c1441
039bc bab0030000                     mov        edx, 0x3b0
039c1 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
039c5 488d4901                       lea        rcx, [rcx + 1]
039c9 48890c16                       mov        qword ptr [rsi + rdx], rcx
039cd 0f8d3c010000                   jge        0x7fcb2c3c158f
039d3 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
039db 488b5630                       mov        rdx, qword ptr [rsi + 0x30]
039df be00000000                     mov        esi, 0
039e4 483bd6                         cmp        rdx, rsi
039e7 48be88b1421ccb7f0000           movabs     rsi, 0x7fcb1c42b188
039f1 bac0030000                     mov        edx, 0x3c0
039f6 7505                           jne        0x7fcb2c3c147d
039f8 bad0030000                     mov        edx, 0x3d0
039fd 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
03a01 488d4901                       lea        rcx, [rcx + 1]
03a05 48890c16                       mov        qword ptr [rsi + rdx], rcx
03a09 0f8500010000                   jne        0x7fcb2c3c158f
03a0f e905010000                     jmp        0x7fcb2c3c1599
03a14 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
03a1c 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03a24 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
03a2c 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
03a33 488bce                         mov        rcx, rsi
03a36 8bb42434010000                 mov        esi, dword ptr [rsp + 0x134]
03a3d 488bde                         mov        rbx, rsi
03a40 2bd9                           sub        ebx, ecx
03a42 48be88b1421ccb7f0000           movabs     rsi, 0x7fcb1c42b188
03a4c 4883864008000001               add        qword ptr [rsi + 0x840], 1
03a54 488bf2                         mov        rsi, rdx
03a57 488bd1                         mov        rdx, rcx
03a5a 488bc8                         mov        rcx, rax
03a5d 4d8bc3                         mov        r8, r11
03a60 4c8bcb                         mov        r9, rbx
03a63 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
03a6b 899c241c020000                 mov        dword ptr [rsp + 0x21c], ebx
03a72 4885c9                         test       rcx, rcx
03a75 0f84b00e0000                   je         0x7fcb2c3c23ab
03a7b 85d2                           test       edx, edx
03a7d 0f8ca80e0000                   jl         0x7fcb2c3c23ab
03a83 4585c0                         test       r8d, r8d
03a86 0f8c9f0e0000                   jl         0x7fcb2c3c23ab
03a8c 4a8d3c0a                       lea        rdi, [rdx + r9]
03a90 3b7e04                         cmp        edi, dword ptr [rsi + 4]
03a93 0f87920e0000                   ja         0x7fcb2c3c23ab
03a99 4b8d3c08                       lea        rdi, [r8 + r9]
03a9d 3b7904                         cmp        edi, dword ptr [rcx + 4]
03aa0 0f87850e0000                   ja         0x7fcb2c3c23ab
03aa6 4585c9                         test       r9d, r9d
03aa9 0f8c7c0e0000                   jl         0x7fcb2c3c23ab
03aaf 4863d2                         movsxd     rdx, edx
03ab2 4d63c0                         movsxd     r8, r8d
03ab5 488d7c1608                     lea        rdi, [rsi + rdx + 8]
03aba 4a8d740108                     lea        rsi, [rcx + r8 + 8]
03abf 498bd1                         mov        rdx, r9
03ac2 40f6c40f                       test       spl, 0xf
03ac6 0f8412000000                   je         0x7fcb2c3c155e
03acc 4883ec08                       sub        rsp, 8
03ad0 e8cb395207                     call       0x7fcb338e4f20
03ad5 4883c408                       add        rsp, 8
03ad9 e905000000                     jmp        0x7fcb2c3c1563
03ade e8bd395207                     call       0x7fcb338e4f20
03ae3 8b9c241c020000                 mov        ebx, dword ptr [rsp + 0x21c]
03aea 039c2474010000                 add        ebx, dword ptr [rsp + 0x174]
03af1 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
03af9 895e38                         mov        dword ptr [rsi + 0x38], ebx
03afc 4881c450020000                 add        rsp, 0x250
03b03 5d                             pop        rbp
03b04 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
03b08 0f872b0e0000                   ja         0x7fcb2c3c23b9
03b0e c3                             ret        
03b0f bb02000000                     mov        ebx, 2
03b14 e915000000                     jmp        0x7fcb2c3c15ae
03b19 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
03b23 ff82e0030000                   inc        dword ptr [rdx + 0x3e0]
03b29 bb08000000                     mov        ebx, 8
03b2e 899c2428020000                 mov        dword ptr [rsp + 0x228], ebx
03b35 666690                         nop        
03b38 e9210e0000                     jmp        0x7fcb2c3c23de
03b3d 90                             nop        
03b3e 90                             nop        
03b3f 90                             nop        
03b40 90                             nop        
03b41 90                             nop        
03b42 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
03b49 0f851e0e0000                   jne        0x7fcb2c3c23ed
03b4f 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
03b56 488d7820                       lea        rdi, [rax + 0x20]
03b5a 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
03b61 0f87060e0000                   ja         0x7fcb2c3c23ed
03b67 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
03b6e 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
03b75 488908                         mov        qword ptr [rax], rcx
03b78 4833c9                         xor        rcx, rcx
03b7b 48894808                       mov        qword ptr [rax + 8], rcx
03b7f 48894810                       mov        qword ptr [rax + 0x10], rcx
03b83 48894818                       mov        qword ptr [rax + 0x18], rcx
03b87 90                             nop        
03b88 e9fc0d0000                     jmp        0x7fcb2c3c2409
03b8d 90                             nop        
03b8e 90                             nop        
03b8f 90                             nop        
03b90 90                             nop        
03b91 90                             nop        
03b92 498bf1                         mov        rsi, r9
03b95 4889842420020000               mov        qword ptr [rsp + 0x220], rax
03b9d 6690                           nop        
03b9f e83ca25307                     call       0x7fcb338fb860
03ba4 0f1f84009c3c001c               nop        dword ptr [rax + rax + 0x1c003c9c]
03bac 48ba88b1421ccb7f0000           movabs     rdx, 0x7fcb1c42b188
03bb6 488d9208040000                 lea        rdx, [rdx + 0x408]
03bbd 4885c0                         test       rax, rax
03bc0 750a                           jne        0x7fcb2c3c164c
03bc2 f60201                         test       byte ptr [rdx], 1
03bc5 7505                           jne        0x7fcb2c3c164c
03bc7 f048830a01                     lock or    qword ptr [rdx], 1
03bcc 488b942420020000               mov        rdx, qword ptr [rsp + 0x220]
03bd4 48b988b1421ccb7f0000           movabs     rcx, 0x7fcb1c42b188
03bde 4883811804000001               add        qword ptr [rcx + 0x418], 1
03be6 8b942428020000                 mov        edx, dword ptr [rsp + 0x228]
03bed 488bc8                         mov        rcx, rax
03bf0 488bb42420020000               mov        rsi, qword ptr [rsp + 0x220]
03bf8 0f1f8000000000                 nop        dword ptr [rax]
03bff e8dc975307                     call       0x7fcb338fae60
03c04 0f1f8400fc3c001d               nop        dword ptr [rax + rax + 0x1d003cfc]
03c0c 488b842420020000               mov        rax, qword ptr [rsp + 0x220]
03c14 e9ed0d0000                     jmp        0x7fcb2c3c2486
03c19 0f1f8000000000                 nop        dword ptr [rax]
03c20 e97d0d0000                     jmp        0x7fcb2c3c2422
03c25 90                             nop        
03c26 90                             nop        
03c27 90                             nop        
03c28 90                             nop        
03c29 90                             nop        
03c2a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
03c31 0f857a0d0000                   jne        0x7fcb2c3c2431
03c37 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
03c3e 488d7820                       lea        rdi, [rax + 0x20]
03c42 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
03c49 0f87620d0000                   ja         0x7fcb2c3c2431
03c4f 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
03c56 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
03c5d 488908                         mov        qword ptr [rax], rcx
03c60 4833c9                         xor        rcx, rcx
03c63 48894808                       mov        qword ptr [rax + 8], rcx
03c67 48894810                       mov        qword ptr [rax + 0x10], rcx
03c6b 48894818                       mov        qword ptr [rax + 0x18], rcx
03c6f 488bd0                         mov        rdx, rax
03c72 48b988b1421ccb7f0000           movabs     rcx, 0x7fcb1c42b188
03c7c 4883815002000001               add        qword ptr [rcx + 0x250], 1
03c84 ba02000000                     mov        edx, 2
03c89 48b9c06026e200000000           movabs     rcx, 0xe22660c0
03c93 488bf0                         mov        rsi, rax
03c96 4889842430020000               mov        qword ptr [rsp + 0x230], rax
03c9e 90                             nop        
03c9f e83c975307                     call       0x7fcb338fae60
03ca4 0f1f84009c3d001e               nop        dword ptr [rax + rax + 0x1e003d9c]
03cac 488b842430020000               mov        rax, qword ptr [rsp + 0x230]
03cb4 e94d0d0000                     jmp        0x7fcb2c3c2486
03cb9 0f1f8000000000                 nop        dword ptr [rax]
03cc0 e9080d0000                     jmp        0x7fcb2c3c244d
03cc5 90                             nop        
03cc6 90                             nop        
03cc7 90                             nop        
03cc8 90                             nop        
03cc9 90                             nop        
03cca 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
03cd1 0f85050d0000                   jne        0x7fcb2c3c245c
03cd7 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
03cde 488d7820                       lea        rdi, [rax + 0x20]
03ce2 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
03ce9 0f87ed0c0000                   ja         0x7fcb2c3c245c
03cef 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
03cf6 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
03cfd 488908                         mov        qword ptr [rax], rcx
03d00 4833c9                         xor        rcx, rcx
03d03 48894808                       mov        qword ptr [rax + 8], rcx
03d07 48894810                       mov        qword ptr [rax + 0x10], rcx
03d0b 48894818                       mov        qword ptr [rax + 0x18], rcx
03d0f 488bd0                         mov        rdx, rax
03d12 48b988b1421ccb7f0000           movabs     rcx, 0x7fcb1c42b188
03d1c 4883813801000001               add        qword ptr [rcx + 0x138], 1
03d24 ba05000000                     mov        edx, 5
03d29 48b9f06026e200000000           movabs     rcx, 0xe22660f0
03d33 488bf0                         mov        rsi, rax
03d36 4889842438020000               mov        qword ptr [rsp + 0x238], rax
03d3e 90                             nop        
03d3f e89c965307                     call       0x7fcb338fae60
03d44 0f1f84003c3e001f               nop        dword ptr [rax + rax + 0x1f003e3c]
03d4c 488b842438020000               mov        rax, qword ptr [rsp + 0x238]
03d54 e9ad0c0000                     jmp        0x7fcb2c3c2486
03d59 49ba38de411ccb7f0000           movabs     r10, 0x7fcb1c41de38
03d63 4c89542408                     mov        qword ptr [rsp + 8], r10
03d68 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03d70 e86b0e6007                     call       0x7fcb339c2660
03d75 e913c3ffff                     jmp        0x7fcb2c3bdb0d
03d7a 49bab0314e3600000000           movabs     r10, 0x364e31b0
03d84 4c89542408                     mov        qword ptr [rsp + 8], r10
03d89 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03d91 e84a0e6007                     call       0x7fcb339c2660
03d96 e97cc4ffff                     jmp        0x7fcb2c3bdc97
03d9b e8c0ae5f07                     call       0x7fcb339bc6e0
03da0 e8bbae5f07                     call       0x7fcb339bc6e0
03da5 e8b6ae5f07                     call       0x7fcb339bc6e0
03daa 48891424                       mov        qword ptr [rsp], rdx
03dae 4c89442408                     mov        qword ptr [rsp + 8], r8
03db3 e8a8a55f07                     call       0x7fcb339bbde0
03db8 e8a3ae5f07                     call       0x7fcb339bc6e0
03dbd e89eae5f07                     call       0x7fcb339bc6e0
03dc2 48891424                       mov        qword ptr [rsp], rdx
03dc6 4c894c2408                     mov        qword ptr [rsp + 8], r9
03dcb e890a55f07                     call       0x7fcb339bbde0
03dd0 e88bae5f07                     call       0x7fcb339bc6e0
03dd5 e886ae5f07                     call       0x7fcb339bc6e0
03dda 48c7042401000000               mov        qword ptr [rsp], 1
03de2 48895c2408                     mov        qword ptr [rsp + 8], rbx
03de7 e874a55f07                     call       0x7fcb339bbde0
03dec 48c7042402000000               mov        qword ptr [rsp], 2
03df4 48895c2408                     mov        qword ptr [rsp + 8], rbx
03df9 e862a55f07                     call       0x7fcb339bbde0
03dfe 49bab073051ccb7f0000           movabs     r10, 0x7fcb1c0573b0
03e08 4c89542408                     mov        qword ptr [rsp + 8], r10
03e0d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03e15 e8c60d6007                     call       0x7fcb339c2660
03e1a e98ec9ffff                     jmp        0x7fcb2c3be22d
03e1f 49ba8862121ccb7f0000           movabs     r10, 0x7fcb1c126288
03e29 4c89542408                     mov        qword ptr [rsp + 8], r10
03e2e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03e36 e8a50d6007                     call       0x7fcb339c2660
03e3b e911caffff                     jmp        0x7fcb2c3be2d1
03e40 49ba303e4e3600000000           movabs     r10, 0x364e3e30
03e4a 4c89542408                     mov        qword ptr [rsp + 8], r10
03e4f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03e57 e8840d6007                     call       0x7fcb339c2660
03e5c e93acaffff                     jmp        0x7fcb2c3be31b
03e61 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
03e69 e8f2ee5f07                     call       0x7fcb339c07e0
03e6e 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
03e76 e8e5ee5f07                     call       0x7fcb339c07e0
03e7b 49ba00240b1ccb7f0000           movabs     r10, 0x7fcb1c0b2400
03e85 4c89542408                     mov        qword ptr [rsp + 8], r10
03e8a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03e92 e8490d6007                     call       0x7fcb339c2660
03e97 e9d8caffff                     jmp        0x7fcb2c3be3f4
03e9c 49ba80870b1ccb7f0000           movabs     r10, 0x7fcb1c0b8780
03ea6 4c89542408                     mov        qword ptr [rsp + 8], r10
03eab 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03eb3 e8280d6007                     call       0x7fcb339c2660
03eb8 e9eacaffff                     jmp        0x7fcb2c3be427
03ebd 49ba602e0e1ccb7f0000           movabs     r10, 0x7fcb1c0e2e60
03ec7 4c89542408                     mov        qword ptr [rsp + 8], r10
03ecc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03ed4 e8070d6007                     call       0x7fcb339c2660
03ed9 e940cbffff                     jmp        0x7fcb2c3be49e
03ede 49ba788d051ccb7f0000           movabs     r10, 0x7fcb1c058d78
03ee8 4c89542408                     mov        qword ptr [rsp + 8], r10
03eed 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03ef5 e8e60c6007                     call       0x7fcb339c2660
03efa e956cbffff                     jmp        0x7fcb2c3be4d5
03eff 49bab0f20d1ccb7f0000           movabs     r10, 0x7fcb1c0df2b0
03f09 4c89542408                     mov        qword ptr [rsp + 8], r10
03f0e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03f16 e8c50c6007                     call       0x7fcb339c2660
03f1b e96dcbffff                     jmp        0x7fcb2c3be50d
03f20 49bae0a5051ccb7f0000           movabs     r10, 0x7fcb1c05a5e0
03f2a 4c89542408                     mov        qword ptr [rsp + 8], r10
03f2f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03f37 e8a40c6007                     call       0x7fcb339c2660
03f3c e967ccffff                     jmp        0x7fcb2c3be628
03f41 49bae80c223600000000           movabs     r10, 0x36220ce8
03f4b 4c89542408                     mov        qword ptr [rsp + 8], r10
03f50 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03f58 e8830c6007                     call       0x7fcb339c2660
03f5d e987ccffff                     jmp        0x7fcb2c3be669
03f62 49ba1872223600000000           movabs     r10, 0x36227218
03f6c 4c89542408                     mov        qword ptr [rsp + 8], r10
03f71 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03f79 e8620c6007                     call       0x7fcb339c2660
03f7e e999ccffff                     jmp        0x7fcb2c3be69c
03f83 48890424                       mov        qword ptr [rsp], rax
03f87 e8d4d45f07                     call       0x7fcb339beee0
03f8c e8cfac5f07                     call       0x7fcb339bc6e0
03f91 49ba4081051ccb7f0000           movabs     r10, 0x7fcb1c058140
03f9b 4c89542408                     mov        qword ptr [rsp + 8], r10
03fa0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03fa8 e8330c6007                     call       0x7fcb339c2660
03fad e91cceffff                     jmp        0x7fcb2c3be84e
03fb2 e8a9ac5f07                     call       0x7fcb339bc6e0
03fb7 49ba8862121ccb7f0000           movabs     r10, 0x7fcb1c126288
03fc1 4c89542408                     mov        qword ptr [rsp + 8], r10
03fc6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03fce e80d0c6007                     call       0x7fcb339c2660
03fd3 e9baceffff                     jmp        0x7fcb2c3be912
03fd8 49ba303e4e3600000000           movabs     r10, 0x364e3e30
03fe2 4c89542408                     mov        qword ptr [rsp + 8], r10
03fe7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03fef e8ec0b6007                     call       0x7fcb339c2660
03ff4 e9d7ceffff                     jmp        0x7fcb2c3be950
03ff9 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04001 e85aed5f07                     call       0x7fcb339c07e0
04006 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0400e e84ded5f07                     call       0x7fcb339c07e0
04013 e848ac5f07                     call       0x7fcb339bc6e0
04018 49bae0a5051ccb7f0000           movabs     r10, 0x7fcb1c05a5e0
04022 4c89542408                     mov        qword ptr [rsp + 8], r10
04027 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0402f e8ac0b6007                     call       0x7fcb339c2660
04034 e980d0ffff                     jmp        0x7fcb2c3beb39
04039 49bae80c223600000000           movabs     r10, 0x36220ce8
04043 4c89542408                     mov        qword ptr [rsp + 8], r10
04048 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04050 e88b0b6007                     call       0x7fcb339c2660
04055 e9acd0ffff                     jmp        0x7fcb2c3beb86
0405a 49ba1872223600000000           movabs     r10, 0x36227218
04064 4c89542408                     mov        qword ptr [rsp + 8], r10
04069 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04071 e86a0b6007                     call       0x7fcb339c2660
04076 e9c3d0ffff                     jmp        0x7fcb2c3bebbe
0407b 49bab073051ccb7f0000           movabs     r10, 0x7fcb1c0573b0
04085 4c89542408                     mov        qword ptr [rsp + 8], r10
0408a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04092 e8490b6007                     call       0x7fcb339c2660
04097 e9c3d1ffff                     jmp        0x7fcb2c3becdf
0409c 49ba8862121ccb7f0000           movabs     r10, 0x7fcb1c126288
040a6 4c89542408                     mov        qword ptr [rsp + 8], r10
040ab 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
040b3 e8280b6007                     call       0x7fcb339c2660
040b8 e94bd2ffff                     jmp        0x7fcb2c3bed88
040bd 49ba303e4e3600000000           movabs     r10, 0x364e3e30
040c7 4c89542408                     mov        qword ptr [rsp + 8], r10
040cc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
040d4 e8070b6007                     call       0x7fcb339c2660
040d9 e968d2ffff                     jmp        0x7fcb2c3bedc6
040de 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
040e6 e875ec5f07                     call       0x7fcb339c07e0
040eb 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
040f3 e868ec5f07                     call       0x7fcb339c07e0
040f8 49ba00240b1ccb7f0000           movabs     r10, 0x7fcb1c0b2400
04102 4c89542408                     mov        qword ptr [rsp + 8], r10
04107 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0410f e8cc0a6007                     call       0x7fcb339c2660
04114 e906d3ffff                     jmp        0x7fcb2c3bee9f
04119 49ba80870b1ccb7f0000           movabs     r10, 0x7fcb1c0b8780
04123 4c89542408                     mov        qword ptr [rsp + 8], r10
04128 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04130 e8ab0a6007                     call       0x7fcb339c2660
04135 e91dd3ffff                     jmp        0x7fcb2c3beed7
0413a 49ba602e0e1ccb7f0000           movabs     r10, 0x7fcb1c0e2e60
04144 4c89542408                     mov        qword ptr [rsp + 8], r10
04149 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04151 e88a0a6007                     call       0x7fcb339c2660
04156 e95cd3ffff                     jmp        0x7fcb2c3bef37
0415b 49ba788d051ccb7f0000           movabs     r10, 0x7fcb1c058d78
04165 4c89542408                     mov        qword ptr [rsp + 8], r10
0416a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04172 e8690a6007                     call       0x7fcb339c2660
04177 e973d3ffff                     jmp        0x7fcb2c3bef6f
0417c 49bab0f20d1ccb7f0000           movabs     r10, 0x7fcb1c0df2b0
04186 4c89542408                     mov        qword ptr [rsp + 8], r10
0418b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04193 e8480a6007                     call       0x7fcb339c2660
04198 e98ad3ffff                     jmp        0x7fcb2c3befa7
0419d 49bae0a5051ccb7f0000           movabs     r10, 0x7fcb1c05a5e0
041a7 4c89542408                     mov        qword ptr [rsp + 8], r10
041ac 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
041b4 e8270a6007                     call       0x7fcb339c2660
041b9 e980d4ffff                     jmp        0x7fcb2c3bf0be
041be 49bae80c223600000000           movabs     r10, 0x36220ce8
041c8 4c89542408                     mov        qword ptr [rsp + 8], r10
041cd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
041d5 e8060a6007                     call       0x7fcb339c2660
041da e9a5d4ffff                     jmp        0x7fcb2c3bf104
041df 49ba1872223600000000           movabs     r10, 0x36227218
041e9 4c89542408                     mov        qword ptr [rsp + 8], r10
041ee 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
041f6 e8e5096007                     call       0x7fcb339c2660
041fb e9bcd4ffff                     jmp        0x7fcb2c3bf13c
04200 48890424                       mov        qword ptr [rsp], rax
04204 e857d25f07                     call       0x7fcb339beee0
04209 e852aa5f07                     call       0x7fcb339bc6e0
0420e 49ba4081051ccb7f0000           movabs     r10, 0x7fcb1c058140
04218 4c89542408                     mov        qword ptr [rsp + 8], r10
0421d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04225 e8b6096007                     call       0x7fcb339c2660
0422a e947d6ffff                     jmp        0x7fcb2c3bf2f6
0422f e82caa5f07                     call       0x7fcb339bc6e0
04234 49ba8862121ccb7f0000           movabs     r10, 0x7fcb1c126288
0423e 4c89542408                     mov        qword ptr [rsp + 8], r10
04243 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0424b e890096007                     call       0x7fcb339c2660
04250 e9e5d6ffff                     jmp        0x7fcb2c3bf3ba
04255 49ba303e4e3600000000           movabs     r10, 0x364e3e30
0425f 4c89542408                     mov        qword ptr [rsp + 8], r10
04264 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0426c e86f096007                     call       0x7fcb339c2660
04271 e902d7ffff                     jmp        0x7fcb2c3bf3f8
04276 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0427e e8ddea5f07                     call       0x7fcb339c07e0
04283 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0428b e8d0ea5f07                     call       0x7fcb339c07e0
04290 e8cba95f07                     call       0x7fcb339bc6e0
04295 49bae0a5051ccb7f0000           movabs     r10, 0x7fcb1c05a5e0
0429f 4c89542408                     mov        qword ptr [rsp + 8], r10
042a4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
042ac e82f096007                     call       0x7fcb339c2660
042b1 e9abd8ffff                     jmp        0x7fcb2c3bf5e1
042b6 49bae80c223600000000           movabs     r10, 0x36220ce8
042c0 4c89542408                     mov        qword ptr [rsp + 8], r10
042c5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
042cd e80e096007                     call       0x7fcb339c2660
042d2 e9d7d8ffff                     jmp        0x7fcb2c3bf62e
042d7 49ba1872223600000000           movabs     r10, 0x36227218
042e1 4c89542408                     mov        qword ptr [rsp + 8], r10
042e6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
042ee e8ed086007                     call       0x7fcb339c2660
042f3 e9eed8ffff                     jmp        0x7fcb2c3bf666
042f8 49ba38de411ccb7f0000           movabs     r10, 0x7fcb1c41de38
04302 4c89542408                     mov        qword ptr [rsp + 8], r10
04307 48c704240a020000               mov        qword ptr [rsp], 0x20a
0430f e8cc086007                     call       0x7fcb339c2660
04314 e994d9ffff                     jmp        0x7fcb2c3bf72d
04319 660f1f440000                   nop        word ptr [rax + rax]
0431f e8bc9a5307                     call       0x7fcb338fb860
04324 e975daffff                     jmp        0x7fcb2c3bf81e
04329 660f1f440000                   nop        word ptr [rax + rax]
0432f e8ac9a5307                     call       0x7fcb338fb860
04334 e9f2dbffff                     jmp        0x7fcb2c3bf9ab
04339 49bad005421ccb7f0000           movabs     r10, 0x7fcb1c4205d0
04343 4c89542408                     mov        qword ptr [rsp + 8], r10
04348 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04350 e88b086007                     call       0x7fcb339c2660
04355 e950dcffff                     jmp        0x7fcb2c3bfa2a
0435a 49b80000000000000000           movabs     r8, 0
04364 b8000f050a                     mov        eax, 0xa050f00
04369 e872ff5f07                     call       0x7fcb339c1d60
0436e e93ddcffff                     jmp        0x7fcb2c3bfa30
04373 49ba38de411ccb7f0000           movabs     r10, 0x7fcb1c41de38
0437d 4c89542408                     mov        qword ptr [rsp + 8], r10
04382 48c70424aa020000               mov        qword ptr [rsp], 0x2aa
0438a e851086007                     call       0x7fcb339c2660
0438f e960ddffff                     jmp        0x7fcb2c3bfb74
04394 49bab073051ccb7f0000           movabs     r10, 0x7fcb1c0573b0
0439e 4c89542408                     mov        qword ptr [rsp + 8], r10
043a3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
043ab e830086007                     call       0x7fcb339c2660
043b0 e935deffff                     jmp        0x7fcb2c3bfc6a
043b5 e8a6a85f07                     call       0x7fcb339bc6e0
043ba 49ba8862121ccb7f0000           movabs     r10, 0x7fcb1c126288
043c4 4c89542408                     mov        qword ptr [rsp + 8], r10
043c9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
043d1 e80a086007                     call       0x7fcb339c2660
043d6 e9b7deffff                     jmp        0x7fcb2c3bfd12
043db 49ba303e4e3600000000           movabs     r10, 0x364e3e30
043e5 4c89542408                     mov        qword ptr [rsp + 8], r10
043ea 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
043f2 e8e9076007                     call       0x7fcb339c2660
043f7 e9cfdeffff                     jmp        0x7fcb2c3bfd4b
043fc 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04404 e857e95f07                     call       0x7fcb339c07e0
04409 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04411 e84ae95f07                     call       0x7fcb339c07e0
04416 49ba00240b1ccb7f0000           movabs     r10, 0x7fcb1c0b2400
04420 4c89542408                     mov        qword ptr [rsp + 8], r10
04425 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0442d e8ae076007                     call       0x7fcb339c2660
04432 e962dfffff                     jmp        0x7fcb2c3bfe19
04437 49ba80870b1ccb7f0000           movabs     r10, 0x7fcb1c0b8780
04441 4c89542408                     mov        qword ptr [rsp + 8], r10
04446 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0444e e88d076007                     call       0x7fcb339c2660
04453 e974dfffff                     jmp        0x7fcb2c3bfe4c
04458 49ba602e0e1ccb7f0000           movabs     r10, 0x7fcb1c0e2e60
04462 4c89542408                     mov        qword ptr [rsp + 8], r10
04467 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0446f e86c076007                     call       0x7fcb339c2660
04474 e9b7dfffff                     jmp        0x7fcb2c3bfeb0
04479 49ba788d051ccb7f0000           movabs     r10, 0x7fcb1c058d78
04483 4c89542408                     mov        qword ptr [rsp + 8], r10
04488 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04490 e84b076007                     call       0x7fcb339c2660
04495 e9d1dfffff                     jmp        0x7fcb2c3bfeeb
0449a 49bab0f20d1ccb7f0000           movabs     r10, 0x7fcb1c0df2b0
044a4 4c89542408                     mov        qword ptr [rsp + 8], r10
044a9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044b1 e82a076007                     call       0x7fcb339c2660
044b6 e9e3dfffff                     jmp        0x7fcb2c3bff1e
044bb 49bae0a5051ccb7f0000           movabs     r10, 0x7fcb1c05a5e0
044c5 4c89542408                     mov        qword ptr [rsp + 8], r10
044ca 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044d2 e809076007                     call       0x7fcb339c2660
044d7 e9d0e0ffff                     jmp        0x7fcb2c3c002c
044dc 49bae80c223600000000           movabs     r10, 0x36220ce8
044e6 4c89542408                     mov        qword ptr [rsp + 8], r10
044eb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044f3 e8e8066007                     call       0x7fcb339c2660
044f8 e9f0e0ffff                     jmp        0x7fcb2c3c006d
044fd 49ba1872223600000000           movabs     r10, 0x36227218
04507 4c89542408                     mov        qword ptr [rsp + 8], r10
0450c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04514 e8c7066007                     call       0x7fcb339c2660
04519 e902e1ffff                     jmp        0x7fcb2c3c00a0
0451e 48890424                       mov        qword ptr [rsp], rax
04522 e839cf5f07                     call       0x7fcb339beee0
04527 e834a75f07                     call       0x7fcb339bc6e0
0452c 49ba4081051ccb7f0000           movabs     r10, 0x7fcb1c058140
04536 4c89542408                     mov        qword ptr [rsp + 8], r10
0453b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04543 e898066007                     call       0x7fcb339c2660
04548 e981e2ffff                     jmp        0x7fcb2c3c024e
0454d 49ba8862121ccb7f0000           movabs     r10, 0x7fcb1c126288
04557 4c89542408                     mov        qword ptr [rsp + 8], r10
0455c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04564 e877066007                     call       0x7fcb339c2660
04569 e919e3ffff                     jmp        0x7fcb2c3c0307
0456e 49ba303e4e3600000000           movabs     r10, 0x364e3e30
04578 4c89542408                     mov        qword ptr [rsp + 8], r10
0457d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04585 e856066007                     call       0x7fcb339c2660
0458a e93fe3ffff                     jmp        0x7fcb2c3c034e
0458f 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04597 e8c4e75f07                     call       0x7fcb339c07e0
0459c 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
045a4 e8b7e75f07                     call       0x7fcb339c07e0
045a9 e8b2a65f07                     call       0x7fcb339bc6e0
045ae 49bae0a5051ccb7f0000           movabs     r10, 0x7fcb1c05a5e0
045b8 4c89542408                     mov        qword ptr [rsp + 8], r10
045bd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045c5 e816066007                     call       0x7fcb339c2660
045ca e9eae4ffff                     jmp        0x7fcb2c3c0539
045cf 49bae80c223600000000           movabs     r10, 0x36220ce8
045d9 4c89542408                     mov        qword ptr [rsp + 8], r10
045de 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045e6 e8f5056007                     call       0x7fcb339c2660
045eb e916e5ffff                     jmp        0x7fcb2c3c0586
045f0 49ba1872223600000000           movabs     r10, 0x36227218
045fa 4c89542408                     mov        qword ptr [rsp + 8], r10
045ff 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04607 e8d4056007                     call       0x7fcb339c2660
0460c e92de5ffff                     jmp        0x7fcb2c3c05be
04611 49ba38de411ccb7f0000           movabs     r10, 0x7fcb1c41de38
0461b 4c89542408                     mov        qword ptr [rsp + 8], r10
04620 48c70424e8020000               mov        qword ptr [rsp], 0x2e8
04628 e8b3056007                     call       0x7fcb339c2660
0462d e9d0e5ffff                     jmp        0x7fcb2c3c0682
04632 49bad005421ccb7f0000           movabs     r10, 0x7fcb1c4205d0
0463c 4c89542408                     mov        qword ptr [rsp + 8], r10
04641 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04649 e892056007                     call       0x7fcb339c2660
0464e e98fe6ffff                     jmp        0x7fcb2c3c0762
04653 49b80000000000000000           movabs     r8, 0
0465d b8000f050a                     mov        eax, 0xa050f00
04662 e879fc5f07                     call       0x7fcb339c1d60
04667 e97ce6ffff                     jmp        0x7fcb2c3c0768
0466c 49ba38de411ccb7f0000           movabs     r10, 0x7fcb1c41de38
04676 4c89542408                     mov        qword ptr [rsp + 8], r10
0467b 48c7042420030000               mov        qword ptr [rsp], 0x320
04683 e858056007                     call       0x7fcb339c2660
04688 e99fe7ffff                     jmp        0x7fcb2c3c08ac
0468d 49bab073051ccb7f0000           movabs     r10, 0x7fcb1c0573b0
04697 4c89542408                     mov        qword ptr [rsp + 8], r10
0469c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046a4 e837056007                     call       0x7fcb339c2660
046a9 e95fe8ffff                     jmp        0x7fcb2c3c098d
046ae e8ada55f07                     call       0x7fcb339bc6e0
046b3 49ba8862121ccb7f0000           movabs     r10, 0x7fcb1c126288
046bd 4c89542408                     mov        qword ptr [rsp + 8], r10
046c2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046ca e811056007                     call       0x7fcb339c2660
046cf e9e0e8ffff                     jmp        0x7fcb2c3c0a34
046d4 49ba303e4e3600000000           movabs     r10, 0x364e3e30
046de 4c89542408                     mov        qword ptr [rsp + 8], r10
046e3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046eb e8f0046007                     call       0x7fcb339c2660
046f0 e9f8e8ffff                     jmp        0x7fcb2c3c0a6d
046f5 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
046fd e85ee65f07                     call       0x7fcb339c07e0
04702 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0470a e851e65f07                     call       0x7fcb339c07e0
0470f 49ba00240b1ccb7f0000           movabs     r10, 0x7fcb1c0b2400
04719 4c89542408                     mov        qword ptr [rsp + 8], r10
0471e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04726 e8b5046007                     call       0x7fcb339c2660
0472b e983e9ffff                     jmp        0x7fcb2c3c0b33
04730 49ba80870b1ccb7f0000           movabs     r10, 0x7fcb1c0b8780
0473a 4c89542408                     mov        qword ptr [rsp + 8], r10
0473f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04747 e894046007                     call       0x7fcb339c2660
0474c e995e9ffff                     jmp        0x7fcb2c3c0b66
04751 49ba602e0e1ccb7f0000           movabs     r10, 0x7fcb1c0e2e60
0475b 4c89542408                     mov        qword ptr [rsp + 8], r10
04760 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04768 e873046007                     call       0x7fcb339c2660
0476d e9cbe9ffff                     jmp        0x7fcb2c3c0bbd
04772 49ba788d051ccb7f0000           movabs     r10, 0x7fcb1c058d78
0477c 4c89542408                     mov        qword ptr [rsp + 8], r10
04781 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04789 e852046007                     call       0x7fcb339c2660
0478e e9e0e9ffff                     jmp        0x7fcb2c3c0bf3
04793 49bab0f20d1ccb7f0000           movabs     r10, 0x7fcb1c0df2b0
0479d 4c89542408                     mov        qword ptr [rsp + 8], r10
047a2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047aa e831046007                     call       0x7fcb339c2660
047af e9f2e9ffff                     jmp        0x7fcb2c3c0c26
047b4 49bae0a5051ccb7f0000           movabs     r10, 0x7fcb1c05a5e0
047be 4c89542408                     mov        qword ptr [rsp + 8], r10
047c3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047cb e810046007                     call       0x7fcb339c2660
047d0 e9dfeaffff                     jmp        0x7fcb2c3c0d34
047d5 49bae80c223600000000           movabs     r10, 0x36220ce8
047df 4c89542408                     mov        qword ptr [rsp + 8], r10
047e4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047ec e8ef036007                     call       0x7fcb339c2660
047f1 e9ffeaffff                     jmp        0x7fcb2c3c0d75
047f6 49ba1872223600000000           movabs     r10, 0x36227218
04800 4c89542408                     mov        qword ptr [rsp + 8], r10
04805 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0480d e8ce036007                     call       0x7fcb339c2660
04812 e911ebffff                     jmp        0x7fcb2c3c0da8
04817 48890424                       mov        qword ptr [rsp], rax
0481b e840cc5f07                     call       0x7fcb339beee0
04820 e83ba45f07                     call       0x7fcb339bc6e0
04825 49ba4081051ccb7f0000           movabs     r10, 0x7fcb1c058140
0482f 4c89542408                     mov        qword ptr [rsp + 8], r10
04834 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0483c e89f036007                     call       0x7fcb339c2660
04841 e990ecffff                     jmp        0x7fcb2c3c0f56
04846 49ba8862121ccb7f0000           movabs     r10, 0x7fcb1c126288
04850 4c89542408                     mov        qword ptr [rsp + 8], r10
04855 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0485d e87e036007                     call       0x7fcb339c2660
04862 e928edffff                     jmp        0x7fcb2c3c100f
04867 49ba303e4e3600000000           movabs     r10, 0x364e3e30
04871 4c89542408                     mov        qword ptr [rsp + 8], r10
04876 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0487e e85d036007                     call       0x7fcb339c2660
04883 e94bedffff                     jmp        0x7fcb2c3c1053
04888 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04890 e8cbe45f07                     call       0x7fcb339c07e0
04895 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0489d e8bee45f07                     call       0x7fcb339c07e0
048a2 e8b9a35f07                     call       0x7fcb339bc6e0
048a7 49bae0a5051ccb7f0000           movabs     r10, 0x7fcb1c05a5e0
048b1 4c89542408                     mov        qword ptr [rsp + 8], r10
048b6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048be e81d036007                     call       0x7fcb339c2660
048c3 e9f1eeffff                     jmp        0x7fcb2c3c1239
048c8 49bae80c223600000000           movabs     r10, 0x36220ce8
048d2 4c89542408                     mov        qword ptr [rsp + 8], r10
048d7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048df e8fc026007                     call       0x7fcb339c2660
048e4 e91defffff                     jmp        0x7fcb2c3c1286
048e9 49ba1872223600000000           movabs     r10, 0x36227218
048f3 4c89542408                     mov        qword ptr [rsp + 8], r10
048f8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04900 e8db026007                     call       0x7fcb339c2660
04905 e934efffff                     jmp        0x7fcb2c3c12be
0490a 49ba38de411ccb7f0000           movabs     r10, 0x7fcb1c41de38
04914 4c89542408                     mov        qword ptr [rsp + 8], r10
04919 48c704245a030000               mov        qword ptr [rsp], 0x35a
04921 e8ba026007                     call       0x7fcb339c2660
04926 e9ecefffff                     jmp        0x7fcb2c3c1397
0492b 0f1f4000                       nop        dword ptr [rax]
0492f e8ac945307                     call       0x7fcb338fb860
04934 e9aaf1ffff                     jmp        0x7fcb2c3c1563
04939 49ba84153c2ccb7f0000           movabs     r10, 0x7fcb2c3c1584
04943 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0494a e911bb5307                     jmp        0x7fcb338fdee0
0494f 48ba0000000000000000           movabs     rdx, 0
04959 b8000f050a                     mov        eax, 0xa050f00
0495e e87ded5f07                     call       0x7fcb339c1160
04963 e9d0f1ffff                     jmp        0x7fcb2c3c15b8
04968 e8f3a25f07                     call       0x7fcb339bc6e0
0496d 488bd2                         mov        rdx, rdx
04970 e86bb05f07                     call       0x7fcb339bd460
04975 e90df2ffff                     jmp        0x7fcb2c3c1607
0497a 48ba0000000000000000           movabs     rdx, 0
04984 b8000f050a                     mov        eax, 0xa050f00
04989 e852f95f07                     call       0x7fcb339c1d60
0498e e9f5f1ffff                     jmp        0x7fcb2c3c1608
04993 48ba0000000000000000           movabs     rdx, 0
0499d b8000f050a                     mov        eax, 0xa050f00
049a2 e839ed5f07                     call       0x7fcb339c1160
049a7 e974f2ffff                     jmp        0x7fcb2c3c16a0
049ac e8afa25f07                     call       0x7fcb339bc6e0
049b1 488bd2                         mov        rdx, rdx
049b4 e827b05f07                     call       0x7fcb339bd460
049b9 e9b1f2ffff                     jmp        0x7fcb2c3c16ef
049be 48ba0000000000000000           movabs     rdx, 0
049c8 b8000f050a                     mov        eax, 0xa050f00
049cd e80eed5f07                     call       0x7fcb339c1160
049d2 e9e9f2ffff                     jmp        0x7fcb2c3c1740
049d7 e884a25f07                     call       0x7fcb339bc6e0
049dc 488bd2                         mov        rdx, rdx
049df e8fcaf5f07                     call       0x7fcb339bd460
049e4 e926f3ffff                     jmp        0x7fcb2c3c178f
049e9 498b8778050000                 mov        rax, qword ptr [r15 + 0x578]
049f0 49c7877805000000000000         mov        qword ptr [r15 + 0x578], 0
049fb 49c7878005000000000000         mov        qword ptr [r15 + 0x580], 0
04a06 4881c450020000                 add        rsp, 0x250
04a0d 5d                             pop        rbp
04a0e e94d935f07                     jmp        0x7fcb339bb7e0
04a13 f4                             hlt        
04a14 f4                             hlt        
04a15 f4                             hlt        
04a16 f4                             hlt        
04a17 f4                             hlt        
