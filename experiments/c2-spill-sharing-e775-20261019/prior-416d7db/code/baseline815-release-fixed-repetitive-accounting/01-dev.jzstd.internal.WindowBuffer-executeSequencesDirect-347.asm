00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c01c5207                   jne        0x7f5bbb90f960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ec50020000                 sub        rsp, 0x250
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 7405                           je         0x7f5bb43edcbf
0003a e8e11d5107                     call       0x7f5bbb8ffaa0
0003f 4889b42448010000               mov        qword ptr [rsp + 0x148], rsi
00047 4889942468010000               mov        qword ptr [rsp + 0x168], rdx
0004f 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
00056 4c89842428010000               mov        qword ptr [rsp + 0x128], r8
0005e 4c898c2420010000               mov        qword ptr [rsp + 0x120], r9
00066 89bc2430010000                 mov        dword ptr [rsp + 0x130], edi
0006d 48bb004072ac5b7f0000           movabs     rbx, 0x7f5bac724000
00077 8b4370                         mov        eax, dword ptr [rbx + 0x70]
0007a 83c002                         add        eax, 2
0007d 894370                         mov        dword ptr [rbx + 0x70], eax
00080 25fe070000                     and        eax, 0x7fe
00085 85c0                           test       eax, eax
00087 0f840c3d0000                   je         0x7f5bb43f1a19
0008d 48bb004072ac5b7f0000           movabs     rbx, 0x7f5bac724000
00097 ff83a8000000                   inc        dword ptr [rbx + 0xa8]
0009d 8b9c2460020000                 mov        ebx, dword ptr [rsp + 0x260]
000a4 8b4644                         mov        eax, dword ptr [rsi + 0x44]
000a7 4889842438010000               mov        qword ptr [rsp + 0x138], rax
000af 448b5e3c                       mov        r11d, dword ptr [rsi + 0x3c]
000b3 448b6e38                       mov        r13d, dword ptr [rsi + 0x38]
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
000e1 48b8004072ac5b7f0000           movabs     rax, 0x7f5bac724000
000eb b9f8000000                     mov        ecx, 0xf8
000f0 7f05                           jg         0x7f5bb43edd77
000f2 b908010000                     mov        ecx, 0x108
000f7 44899c2440010000               mov        dword ptr [rsp + 0x140], r11d
000ff 4c8b1c08                       mov        r11, qword ptr [rax + rcx]
00103 4d8d5b01                       lea        r11, [r11 + 1]
00107 4c891c08                       mov        qword ptr [rax + rcx], r11
0010b 0f8fe03b0000                   jg         0x7f5bb43f1971
00111 4863db                         movsxd     rbx, ebx
00114 488b4e20                       mov        rcx, qword ptr [rsi + 0x20]
00118 482bcf                         sub        rcx, rdi
0011b 483bcb                         cmp        rcx, rbx
0011e 48b9004072ac5b7f0000           movabs     rcx, 0x7f5bac724000
00128 b828010000                     mov        eax, 0x128
0012d 7c05                           jl         0x7f5bb43eddb4
0012f b818010000                     mov        eax, 0x118
00134 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
00138 4d8d5b01                       lea        r11, [r11 + 1]
0013c 4c891c01                       mov        qword ptr [rcx + rax], r11
00140 0f8cab3b0000                   jl         0x7f5bb43f1971
00146 48b9004072ac5b7f0000           movabs     rcx, 0x7f5bac724000
00150 ff8158010000                   inc        dword ptr [rcx + 0x158]
00156 b900000000                     mov        ecx, 0
0015b 498bc0                         mov        rax, r8
0015e 483bc1                         cmp        rax, rcx
00161 48b9004072ac5b7f0000           movabs     rcx, 0x7f5bac724000
0016b b868010000                     mov        eax, 0x168
00170 7505                           jne        0x7f5bb43eddf7
00172 b878010000                     mov        eax, 0x178
00177 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
0017b 4d8d5b01                       lea        r11, [r11 + 1]
0017f 4c891c01                       mov        qword ptr [rcx + rax], r11
00183 0f8531000000                   jne        0x7f5bb43ede3a
00189 4803df                         add        rbx, rdi
0018c 498bc9                         mov        rcx, r9
0018f 483bcb                         cmp        rcx, rbx
00192 48b9004072ac5b7f0000           movabs     rcx, 0x7f5bac724000
0019c bf98010000                     mov        edi, 0x198
001a1 7d05                           jge        0x7f5bb43ede28
001a3 bf88010000                     mov        edi, 0x188
001a8 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
001ac 488d5b01                       lea        rbx, [rbx + 1]
001b0 48891c39                       mov        qword ptr [rcx + rdi], rbx
001b4 0f8d0a000000                   jge        0x7f5bb43ede44
001ba bf00000000                     mov        edi, 0
001bf e915000000                     jmp        0x7f5bb43ede59
001c4 48b9004072ac5b7f0000           movabs     rcx, 0x7f5bac724000
001ce ff81a8010000                   inc        dword ptr [rcx + 0x1a8]
001d4 bf01000000                     mov        edi, 1
001d9 4d2bc6                         sub        r8, r14
001dc 4c89842480010000               mov        qword ptr [rsp + 0x180], r8
001e4 48b9004072ac5b7f0000           movabs     rcx, 0x7f5bac724000
001ee 488381c001000001               add        qword ptr [rcx + 0x1c0], 1
001f6 48b9603f79ac5b7f0000           movabs     rcx, 0x7f5bac793f60
00200 8b5970                         mov        ebx, dword ptr [rcx + 0x70]
00203 83c302                         add        ebx, 2
00206 895970                         mov        dword ptr [rcx + 0x70], ebx
00209 81e3feff1f00                   and        ebx, 0x1ffffe
0020f 85db                           test       ebx, ebx
00211 0f84a33b0000                   je         0x7f5bb43f1a3a
00217 48b9ffffffffffffff7f           movabs     rcx, 0x7fffffffffffffff
00221 493bc9                         cmp        rcx, r9
00224 48b9603f79ac5b7f0000           movabs     rcx, 0x7f5bac793f60
0022e bbb8000000                     mov        ebx, 0xb8
00233 7d05                           jge        0x7f5bb43edeba
00235 bba8000000                     mov        ebx, 0xa8
0023a 488b0419                       mov        rax, qword ptr [rcx + rbx]
0023e 488d4001                       lea        rax, [rax + 1]
00242 48890419                       mov        qword ptr [rcx + rbx], rax
00246 0f8d0f000000                   jge        0x7f5bb43ededb
0024c 49b9ffffffffffffff7f           movabs     r9, 0x7fffffffffffffff
00256 e910000000                     jmp        0x7f5bb43edeeb
0025b 48b9603f79ac5b7f0000           movabs     rcx, 0x7f5bac793f60
00265 ff81c8000000                   inc        dword ptr [rcx + 0xc8]
0026b 448b9c2440010000               mov        r11d, dword ptr [rsp + 0x140]
00273 498bdd                         mov        rbx, r13
00276 83eb20                         sub        ebx, 0x20
00279 899c2458010000                 mov        dword ptr [rsp + 0x158], ebx
00280 8b4208                         mov        eax, dword ptr [rdx + 8]
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
002f2 48bf004072ac5b7f0000           movabs     rdi, 0x7f5bac724000
002fc b8d0010000                     mov        eax, 0x1d0
00301 7d05                           jge        0x7f5bb43edf88
00303 b8e0010000                     mov        eax, 0x1e0
00308 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
0030c 4d8d5b01                       lea        r11, [r11 + 1]
00310 4c891c07                       mov        qword ptr [rdi + rax], r11
00314 0f8d22370000                   jge        0x7f5bb43f16bc
0031a 413b5008                       cmp        edx, dword ptr [r8 + 8]
0031e 0f83c63a0000                   jae        0x7f5bb43f1a6a
00324 4863fa                         movsxd     rdi, edx
00327 498b44f810                     mov        rax, qword ptr [r8 + rdi*8 + 0x10]
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
00367 48b9004072ac5b7f0000           movabs     rcx, 0x7f5bac724000
00371 41b8f0010000                   mov        r8d, 0x1f0
00377 7d06                           jge        0x7f5bb43edfff
00379 41b800020000                   mov        r8d, 0x200
0037f 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00383 4d8d6d01                       lea        r13, [r13 + 1]
00387 4e892c01                       mov        qword ptr [rcx + r8], r13
0038b 0f8d15000000                   jge        0x7f5bb43ee026
00391 413b5108                       cmp        edx, dword ptr [r9 + 8]
00395 0f83673a0000                   jae        0x7f5bb43f1a82
0039b 4863ca                         movsxd     rcx, edx
0039e 418b4c890c                     mov        ecx, dword ptr [r9 + rcx*4 + 0xc]
003a3 488bc1                         mov        rax, rcx
003a6 85ff                           test       edi, edi
003a8 48b9004072ac5b7f0000           movabs     rcx, 0x7f5bac724000
003b2 41b810020000                   mov        r8d, 0x210
003b8 7406                           je         0x7f5bb43ee040
003ba 41b820020000                   mov        r8d, 0x220
003c0 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003c4 4d8d6d01                       lea        r13, [r13 + 1]
003c8 4e892c01                       mov        qword ptr [rcx + r8], r13
003cc 0f8431000000                   je         0x7f5bb43ee083
003d2 498bcb                         mov        rcx, r11
003d5 2bce                           sub        ecx, esi
003d7 3bf9                           cmp        edi, ecx
003d9 48b9004072ac5b7f0000           movabs     rcx, 0x7f5bac724000
003e3 41b840020000                   mov        r8d, 0x240
003e9 7f06                           jg         0x7f5bb43ee071
003eb 41b830020000                   mov        r8d, 0x230
003f1 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003f5 4d8d6d01                       lea        r13, [r13 + 1]
003f9 4e892c01                       mov        qword ptr [rcx + r8], r13
003fd 0f8f46380000                   jg         0x7f5bb43f18c9
00403 83f803                         cmp        eax, 3
00406 48b9004072ac5b7f0000           movabs     rcx, 0x7f5bac724000
00410 41b860020000                   mov        r8d, 0x260
00416 7e06                           jle        0x7f5bb43ee09e
00418 41b870020000                   mov        r8d, 0x270
0041e 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00422 4d8d6d01                       lea        r13, [r13 + 1]
00426 4e892c01                       mov        qword ptr [rcx + r8], r13
0042a 0f8e59000000                   jle        0x7f5bb43ee109
00430 83e803                         sub        eax, 3
00433 837b0801                       cmp        dword ptr [rbx + 8], 1
00437 0f86dd390000                   jbe        0x7f5bb43f1a9a
0043d 8b4b10                         mov        ecx, dword ptr [rbx + 0x10]
00440 837b0802                       cmp        dword ptr [rbx + 8], 2
00444 0f86e2390000                   jbe        0x7f5bb43f1aac
0044a 894b14                         mov        dword ptr [rbx + 0x14], ecx
0044d 8b4b0c                         mov        ecx, dword ptr [rbx + 0xc]
00450 894b10                         mov        dword ptr [rbx + 0x10], ecx
00453 89430c                         mov        dword ptr [rbx + 0xc], eax
00456 48b9004072ac5b7f0000           movabs     rcx, 0x7f5bac724000
00460 ff8180020000                   inc        dword ptr [rcx + 0x280]
00466 89942444010000                 mov        dword ptr [rsp + 0x144], edx
0046d 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
00474 4c8bb42488010000               mov        r14, qword ptr [rsp + 0x188]
0047c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
00484 e952000000                     jmp        0x7f5bb43ee15b
00489 89942444010000                 mov        dword ptr [rsp + 0x144], edx
00490 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
00497 49b8004072ac5b7f0000           movabs     r8, 0x7f5bac724000
004a1 4983809802000001               add        qword ptr [r8 + 0x298], 1
004a9 488bf3                         mov        rsi, rbx
004ac 488bd0                         mov        rdx, rax
004af 488bcf                         mov        rcx, rdi
004b2 0f1f440000                     nop        dword ptr [rax + rax]
004b7 e824275207                     call       0x7f5bbb910860
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
004f0 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
004fa b9b8020000                     mov        ecx, 0x2b8
004ff 7d05                           jge        0x7f5bb43ee186
00501 b9a8020000                     mov        ecx, 0x2a8
00506 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0050a 4d8d4001                       lea        r8, [r8 + 1]
0050e 4c89040a                       mov        qword ptr [rdx + rcx], r8
00512 0f8d15000000                   jge        0x7f5bb43ee1ad
00518 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00520 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00528 e9ad000000                     jmp        0x7f5bb43ee25a
0052d 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00535 4585ed                         test       r13d, r13d
00538 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
00542 b9c8020000                     mov        ecx, 0x2c8
00547 7505                           jne        0x7f5bb43ee1ce
00549 b9d8020000                     mov        ecx, 0x2d8
0054e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
00552 4d8d4001                       lea        r8, [r8 + 1]
00556 4c89040a                       mov        qword ptr [rdx + rcx], r8
0055a 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00562 0f8568000000                   jne        0x7f5bb43ee250
00568 498bd3                         mov        rdx, r11
0056b 03d7                           add        edx, edi
0056d 2bd0                           sub        edx, eax
0056f 4863d2                         movsxd     rdx, edx
00572 493bd0                         cmp        rdx, r8
00575 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
0057f b9e8020000                     mov        ecx, 0x2e8
00584 7c05                           jl         0x7f5bb43ee20b
00586 b9f8020000                     mov        ecx, 0x2f8
0058b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0058f 4d8d4901                       lea        r9, [r9 + 1]
00593 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00597 0f8c3d000000                   jl         0x7f5bb43ee25a
0059d 4c8b8c2450010000               mov        r9, qword ptr [rsp + 0x150]
005a5 4c3bcb                         cmp        r9, rbx
005a8 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
005b2 b918030000                     mov        ecx, 0x318
005b7 7c05                           jl         0x7f5bb43ee23e
005b9 b908030000                     mov        ecx, 0x308
005be 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
005c2 4d8d4901                       lea        r9, [r9 + 1]
005c6 4c890c0a                       mov        qword ptr [rdx + rcx], r9
005ca 0f8c0a000000                   jl         0x7f5bb43ee25a
005d0 ba00000000                     mov        edx, 0
005d5 e915000000                     jmp        0x7f5bb43ee26f
005da 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
005e4 ff8228030000                   inc        dword ptr [rdx + 0x328]
005ea ba01000000                     mov        edx, 1
005ef 48899c2498010000               mov        qword ptr [rsp + 0x198], rbx
005f7 85c0                           test       eax, eax
005f9 48b9004072ac5b7f0000           movabs     rcx, 0x7f5bac724000
00603 41b940030000                   mov        r9d, 0x340
00609 7e06                           jle        0x7f5bb43ee291
0060b 41b950030000                   mov        r9d, 0x350
00611 4a8b1c09                       mov        rbx, qword ptr [rcx + r9]
00615 488d5b01                       lea        rbx, [rbx + 1]
00619 4a891c09                       mov        qword ptr [rcx + r9], rbx
0061d 0f8e6f330000                   jle        0x7f5bb43f1612
00623 85d2                           test       edx, edx
00625 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
0062f b970030000                     mov        ecx, 0x370
00634 7505                           jne        0x7f5bb43ee2bb
00636 b960030000                     mov        ecx, 0x360
0063b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0063f 4d8d4901                       lea        r9, [r9 + 1]
00643 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00647 0f8545330000                   jne        0x7f5bb43f1612
0064d 498bdb                         mov        rbx, r11
00650 03df                           add        ebx, edi
00652 899c24a0010000                 mov        dword ptr [rsp + 0x1a0], ebx
00659 488bf3                         mov        rsi, rbx
0065c 03b42478010000                 add        esi, dword ptr [rsp + 0x178]
00663 3bb42458010000                 cmp        esi, dword ptr [rsp + 0x158]
0066a 48be004072ac5b7f0000           movabs     rsi, 0x7f5bac724000
00674 ba28040000                     mov        edx, 0x428
00679 7f05                           jg         0x7f5bb43ee300
0067b ba38040000                     mov        edx, 0x438
00680 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
00684 488d4901                       lea        rcx, [rcx + 1]
00688 48890c16                       mov        qword ptr [rsi + rdx], rcx
0068c 0f8f3f000000                   jg         0x7f5bb43ee351
00692 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
00699 03f7                           add        esi, edi
0069b 89b424a4010000                 mov        dword ptr [rsp + 0x1a4], esi
006a2 3bb4245c010000                 cmp        esi, dword ptr [rsp + 0x15c]
006a9 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
006b3 b958040000                     mov        ecx, 0x458
006b8 7e05                           jle        0x7f5bb43ee33f
006ba b948040000                     mov        ecx, 0x448
006bf 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
006c3 4d8d4901                       lea        r9, [r9 + 1]
006c7 4c890c0a                       mov        qword ptr [rdx + rcx], r9
006cb 0f8e76000000                   jle        0x7f5bb43ee3c7
006d1 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
006d9 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
006e1 48be004072ac5b7f0000           movabs     rsi, 0x7f5bac724000
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
00727 e8b4245207                     call       0x7f5bbb910860
0072c 0f1f840024080001               nop        dword ptr [rax + rax + 0x1000824]
00734 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
0073b 03b4247c010000                 add        esi, dword ptr [rsp + 0x17c]
00742 e9c9310000                     jmp        0x7f5bb43f1590
00747 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
0074f 83ff10                         cmp        edi, 0x10
00752 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
0075c b968040000                     mov        ecx, 0x468
00761 7f05                           jg         0x7f5bb43ee3e8
00763 b978040000                     mov        ecx, 0x478
00768 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0076c 4d8d4901                       lea        r9, [r9 + 1]
00770 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00774 0f8f4f0a0000                   jg         0x7f5bb43eee49
0077a 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
00784 4883828804000001               add        qword ptr [rdx + 0x488], 1
0078c 48baa01a79ac5b7f0000           movabs     rdx, 0x7f5bac791aa0
00796 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00799 83c102                         add        ecx, 2
0079c 894a70                         mov        dword ptr [rdx + 0x70], ecx
0079f 81e1feff1f00                   and        ecx, 0x1ffffe
007a5 85c9                           test       ecx, ecx
007a7 0f8491360000                   je         0x7f5bb43f1abe
007ad 48ba708d78e200000000           movabs     rdx, 0xe2788d70
007b7 48b9a01a79ac5b7f0000           movabs     rcx, 0x7f5bac791aa0
007c1 488b12                         mov        rdx, qword ptr [rdx]
007c4 48c1ea2a                       shr        rdx, 0x2a
007c8 48c1e209                       shl        rdx, 9
007cc 41ba0000006a                   mov        r10d, 0x6a000000
007d2 4903d2                         add        rdx, r10
007d5 41ba16000000                   mov        r10d, 0x16
007db 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
007df 7435                           je         0x7f5bb43ee496
007e1 4983c202                       add        r10, 2
007e5 4983fa1a                       cmp        r10, 0x1a
007e9 75f0                           jne        0x7f5bb43ee45b
007eb 41ba16000000                   mov        r10d, 0x16
007f1 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
007f6 7412                           je         0x7f5bb43ee48a
007f8 4983c202                       add        r10, 2
007fc 4983fa1a                       cmp        r10, 0x1a
00800 75ef                           jne        0x7f5bb43ee471
00802 41ba15000000                   mov        r10d, 0x15
00808 eb10                           jmp        0x7f5bb43ee49a
0080a 50                             push       rax
0080b 4833c0                         xor        rax, rax
0080e 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
00813 58                             pop        rax
00814 ebbf                           jmp        0x7f5bb43ee455
00816 4983c201                       add        r10, 1
0081a 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0081f 48baa01a79ac5b7f0000           movabs     rdx, 0x7f5bac791aa0
00829 488382d800000001               add        qword ptr [rdx + 0xd8], 1
00831 48baf81079ac5b7f0000           movabs     rdx, 0x7f5bac7910f8
0083b 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0083e 83c102                         add        ecx, 2
00841 894a70                         mov        dword ptr [rdx + 0x70], ecx
00844 81e1feff1f00                   and        ecx, 0x1ffffe
0084a 85c9                           test       ecx, ecx
0084c 0f840d360000                   je         0x7f5bb43f1adf
00852 448bac2490010000               mov        r13d, dword ptr [rsp + 0x190]
0085a 48baf81079ac5b7f0000           movabs     rdx, 0x7f5bac7910f8
00864 4883820801000001               add        qword ptr [rdx + 0x108], 1
0086c 8b942464010000                 mov        edx, dword ptr [rsp + 0x164]
00873 83ea0f                         sub        edx, 0xf
00876 48b9c80779ac5b7f0000           movabs     rcx, 0x7f5bac7907c8
00880 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00884 4183c102                       add        r9d, 2
00888 44894970                       mov        dword ptr [rcx + 0x70], r9d
0088c 4181e1feff1f00                 and        r9d, 0x1ffffe
00893 4585c9                         test       r9d, r9d
00896 0f84e4350000                   je         0x7f5bb43f1b00
0089c 48b9c80779ac5b7f0000           movabs     rcx, 0x7f5bac7907c8
008a6 488381a800000001               add        qword ptr [rcx + 0xa8], 1
008ae 48b90000000000000000           movabs     rcx, 0
008b8 b900000000                     mov        ecx, 0
008bd 443be9                         cmp        r13d, ecx
008c0 0f8cdb350000                   jl         0x7f5bb43f1b21
008c6 443bea                         cmp        r13d, edx
008c9 0f8ddf350000                   jge        0x7f5bb43f1b2e
008cf 498bd5                         mov        rdx, r13
008d2 89942494010000                 mov        dword ptr [rsp + 0x194], edx
008d9 48b9708d78e200000000           movabs     rcx, 0xe2788d70
008e3 4c8bc9                         mov        r9, rcx
008e6 49bea01a79ac5b7f0000           movabs     r14, 0x7f5bac791aa0
008f0 4d8b09                         mov        r9, qword ptr [r9]
008f3 49c1e92a                       shr        r9, 0x2a
008f7 49c1e109                       shl        r9, 9
008fb 41ba0000006a                   mov        r10d, 0x6a000000
00901 4d03ca                         add        r9, r10
00904 41ba24000000                   mov        r10d, 0x24
0090a 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
0090e 7435                           je         0x7f5bb43ee5c5
00910 4983c202                       add        r10, 2
00914 4983fa28                       cmp        r10, 0x28
00918 75f0                           jne        0x7f5bb43ee58a
0091a 41ba24000000                   mov        r10d, 0x24
00920 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
00925 7412                           je         0x7f5bb43ee5b9
00927 4983c202                       add        r10, 2
0092b 4983fa28                       cmp        r10, 0x28
0092f 75ef                           jne        0x7f5bb43ee5a0
00931 41ba23000000                   mov        r10d, 0x23
00937 eb10                           jmp        0x7f5bb43ee5c9
00939 50                             push       rax
0093a 4833c0                         xor        rax, rax
0093d 4f0fb10cd6                     cmpxchg    qword ptr [r14 + r10*8], r9
00942 58                             pop        rax
00943 ebbf                           jmp        0x7f5bb43ee584
00945 4983c201                       add        r10, 1
00949 4b8304d601                     add        qword ptr [r14 + r10*8], 1
0094e 48bac80879ac5b7f0000           movabs     rdx, 0x7f5bac7908c8
00958 448b4a70                       mov        r9d, dword ptr [rdx + 0x70]
0095c 4183c102                       add        r9d, 2
00960 44894a70                       mov        dword ptr [rdx + 0x70], r9d
00964 4181e1feff1f00                 and        r9d, 0x1ffffe
0096b 4585c9                         test       r9d, r9d
0096e 0f8447350000                   je         0x7f5bb43f1b3b
00974 48bac80879ac5b7f0000           movabs     rdx, 0x7f5bac7908c8
0097e 488382a800000001               add        qword ptr [rdx + 0xa8], 1
00986 48baf00979ac5b7f0000           movabs     rdx, 0x7f5bac7909f0
00990 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00993 83c102                         add        ecx, 2
00996 894a70                         mov        dword ptr [rdx + 0x70], ecx
00999 81e1feff1f00                   and        ecx, 0x1ffffe
0099f 85c9                           test       ecx, ecx
009a1 0f8435350000                   je         0x7f5bb43f1b5c
009a7 48baf00979ac5b7f0000           movabs     rdx, 0x7f5bac7909f0
009b1 ff82b8000000                   inc        dword ptr [rdx + 0xb8]
009b7 8b942494010000                 mov        edx, dword ptr [rsp + 0x194]
009be 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
009c5 4489ac2490010000               mov        dword ptr [rsp + 0x190], r13d
009cd 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
009d5 488b9c2468010000               mov        rbx, qword ptr [rsp + 0x168]
009dd 48b9585e7ae200000000           movabs     rcx, 0xe27a5e58
009e7 4c8bc9                         mov        r9, rcx
009ea 48b8a01a79ac5b7f0000           movabs     rax, 0x7f5bac791aa0
009f4 4883805801000001               add        qword ptr [rax + 0x158], 1
009fc 49b9681c79ac5b7f0000           movabs     r9, 0x7f5bac791c68
00a06 418b4170                       mov        eax, dword ptr [r9 + 0x70]
00a0a 83c002                         add        eax, 2
00a0d 41894170                       mov        dword ptr [r9 + 0x70], eax
00a11 25feff1f00                     and        eax, 0x1ffffe
00a16 85c0                           test       eax, eax
00a18 0f84df340000                   je         0x7f5bb43f1b7d
00a1e 4c8bc9                         mov        r9, rcx
00a21 48b8681c79ac5b7f0000           movabs     rax, 0x7f5bac791c68
00a2b 488380a800000001               add        qword ptr [rax + 0xa8], 1
00a33 49b9481d79ac5b7f0000           movabs     r9, 0x7f5bac791d48
00a3d 418b4170                       mov        eax, dword ptr [r9 + 0x70]
00a41 83c002                         add        eax, 2
00a44 41894170                       mov        dword ptr [r9 + 0x70], eax
00a48 25feff1f00                     and        eax, 0x1ffffe
00a4d 85c0                           test       eax, eax
00a4f 0f84c9340000                   je         0x7f5bb43f1b9e
00a55 49b9481d79ac5b7f0000           movabs     r9, 0x7f5bac791d48
00a5f 498381b800000001               add        qword ptr [r9 + 0xb8], 1
00a67 48b9701279ac5b7f0000           movabs     rcx, 0x7f5bac791270
00a71 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00a75 4183c102                       add        r9d, 2
00a79 44894970                       mov        dword ptr [rcx + 0x70], r9d
00a7d 4181e1feff1f00                 and        r9d, 0x1ffffe
00a84 4585c9                         test       r9d, r9d
00a87 0f84b2340000                   je         0x7f5bb43f1bbf
00a8d 48b9708d78e200000000           movabs     rcx, 0xe2788d70
00a97 4c8bc9                         mov        r9, rcx
00a9a 48b8481d79ac5b7f0000           movabs     rax, 0x7f5bac791d48
00aa4 4d8b09                         mov        r9, qword ptr [r9]
00aa7 49c1e92a                       shr        r9, 0x2a
00aab 49c1e109                       shl        r9, 9
00aaf 41ba0000006a                   mov        r10d, 0x6a000000
00ab5 4d03ca                         add        r9, r10
00ab8 41ba1c000000                   mov        r10d, 0x1c
00abe 4e3b0cd0                       cmp        r9, qword ptr [rax + r10*8]
00ac2 743b                           je         0x7f5bb43ee77f
00ac4 4983c202                       add        r10, 2
00ac8 4983fa20                       cmp        r10, 0x20
00acc 75f0                           jne        0x7f5bb43ee73e
00ace 41ba1c000000                   mov        r10d, 0x1c
00ad4 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
00ad9 7412                           je         0x7f5bb43ee76d
00adb 4983c202                       add        r10, 2
00adf 4983fa20                       cmp        r10, 0x20
00ae3 75ef                           jne        0x7f5bb43ee754
00ae5 41ba1b000000                   mov        r10d, 0x1b
00aeb eb16                           jmp        0x7f5bb43ee783
00aed 53                             push       rbx
00aee 488bd8                         mov        rbx, rax
00af1 4833c0                         xor        rax, rax
00af4 4e0fb10cd3                     cmpxchg    qword ptr [rbx + r10*8], r9
00af9 488bc3                         mov        rax, rbx
00afc 5b                             pop        rbx
00afd ebb9                           jmp        0x7f5bb43ee738
00aff 4983c201                       add        r10, 1
00b03 4a8304d001                     add        qword ptr [rax + r10*8], 1
00b08 49b9481d79ac5b7f0000           movabs     r9, 0x7f5bac791d48
00b12 488b09                         mov        rcx, qword ptr [rcx]
00b15 48c1e92a                       shr        rcx, 0x2a
00b19 48c1e109                       shl        rcx, 9
00b1d 41ba0000006a                   mov        r10d, 0x6a000000
00b23 4903ca                         add        rcx, r10
00b26 41ba22000000                   mov        r10d, 0x22
00b2c 4b3b0cd1                       cmp        rcx, qword ptr [r9 + r10*8]
00b30 7435                           je         0x7f5bb43ee7e7
00b32 4983c202                       add        r10, 2
00b36 4983fa26                       cmp        r10, 0x26
00b3a 75f0                           jne        0x7f5bb43ee7ac
00b3c 41ba22000000                   mov        r10d, 0x22
00b42 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
00b47 7412                           je         0x7f5bb43ee7db
00b49 4983c202                       add        r10, 2
00b4d 4983fa26                       cmp        r10, 0x26
00b51 75ef                           jne        0x7f5bb43ee7c2
00b53 41ba21000000                   mov        r10d, 0x21
00b59 eb10                           jmp        0x7f5bb43ee7eb
00b5b 50                             push       rax
00b5c 4833c0                         xor        rax, rax
00b5f 4b0fb10cd1                     cmpxchg    qword ptr [r9 + r10*8], rcx
00b64 58                             pop        rax
00b65 ebbf                           jmp        0x7f5bb43ee7a6
00b67 4983c201                       add        r10, 1
00b6b 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00b70 48b9481d79ac5b7f0000           movabs     rcx, 0x7f5bac791d48
00b7a 4883813801000001               add        qword ptr [rcx + 0x138], 1
00b82 48b9301379ac5b7f0000           movabs     rcx, 0x7f5bac791330
00b8c 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00b90 4183c102                       add        r9d, 2
00b94 44894970                       mov        dword ptr [rcx + 0x70], r9d
00b98 4181e1feff1f00                 and        r9d, 0x1ffffe
00b9f 4585c9                         test       r9d, r9d
00ba2 0f84b8330000                   je         0x7f5bb43f1be0
00ba8 48b9481d79ac5b7f0000           movabs     rcx, 0x7f5bac791d48
00bb2 4883814801000001               add        qword ptr [rcx + 0x148], 1
00bba 4863c2                         movsxd     rax, edx
00bbd ba0c000000                     mov        edx, 0xc
00bc2 4c8bc8                         mov        r9, rax
00bc5 4c03ca                         add        r9, rdx
00bc8 48ba180579ac5b7f0000           movabs     rdx, 0x7f5bac790518
00bd2 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00bd5 83c102                         add        ecx, 2
00bd8 894a70                         mov        dword ptr [rdx + 0x70], ecx
00bdb 81e1feff1f00                   and        ecx, 0x1ffffe
00be1 85c9                           test       ecx, ecx
00be3 0f8498330000                   je         0x7f5bb43f1c01
00be9 48ba180579ac5b7f0000           movabs     rdx, 0x7f5bac790518
00bf3 488382d800000001               add        qword ptr [rdx + 0xd8], 1
00bfb 48ba900679ac5b7f0000           movabs     rdx, 0x7f5bac790690
00c05 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00c08 83c102                         add        ecx, 2
00c0b 894a70                         mov        dword ptr [rdx + 0x70], ecx
00c0e 81e1feff1f00                   and        ecx, 0x1ffffe
00c14 85c9                           test       ecx, ecx
00c16 0f8486330000                   je         0x7f5bb43f1c22
00c1c 48ba481d79ac5b7f0000           movabs     rdx, 0x7f5bac791d48
00c26 4883826801000001               add        qword ptr [rdx + 0x168], 1
00c2e 48ba28597be200000000           movabs     rdx, 0xe27b5928
00c38 48beb88d78e200000000           movabs     rsi, 0xe2788db8
00c42 ba02000000                     mov        edx, 2
00c47 b910000000                     mov        ecx, 0x10
00c4c 4c8bc3                         mov        r8, rbx
00c4f bf00000000                     mov        edi, 0
00c54 48891c24                       mov        qword ptr [rsp], rbx
00c58 4889442408                     mov        qword ptr [rsp + 8], rax
00c5d 49ba708d78e200000000           movabs     r10, 0xe2788d70
00c67 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00c6c 49ba28597be200000000           movabs     r10, 0xe27b5928
00c76 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c7b 0f1f4000                       nop        dword ptr [rax]
00c7f e85c1f5207                     call       0x7f5bbb910860
00c84 0f1f84007c0d0002               nop        dword ptr [rax + rax + 0x2000d7c]
00c8c 4885c0                         test       rax, rax
00c8f 48bb481d79ac5b7f0000           movabs     rbx, 0x7f5bac791d48
00c99 750c                           jne        0x7f5bb43ee927
00c9b 808b7101000001                 or         byte ptr [rbx + 0x171], 1
00ca2 e98b000000                     jmp        0x7f5bb43ee9b2
00ca7 488b38                         mov        rdi, qword ptr [rax]
00caa 48c1ef2a                       shr        rdi, 0x2a
00cae 48c1e709                       shl        rdi, 9
00cb2 41ba0000006a                   mov        r10d, 0x6a000000
00cb8 4903fa                         add        rdi, r10
00cbb 41ba30000000                   mov        r10d, 0x30
00cc1 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
00cc5 7435                           je         0x7f5bb43ee97c
00cc7 4983c202                       add        r10, 2
00ccb 4983fa34                       cmp        r10, 0x34
00ccf 75f0                           jne        0x7f5bb43ee941
00cd1 41ba30000000                   mov        r10d, 0x30
00cd7 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00cdc 7412                           je         0x7f5bb43ee970
00cde 4983c202                       add        r10, 2
00ce2 4983fa34                       cmp        r10, 0x34
00ce6 75ef                           jne        0x7f5bb43ee957
00ce8 41ba2f000000                   mov        r10d, 0x2f
00cee eb10                           jmp        0x7f5bb43ee980
00cf0 50                             push       rax
00cf1 4833c0                         xor        rax, rax
00cf4 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
00cf9 58                             pop        rax
00cfa ebbf                           jmp        0x7f5bb43ee93b
00cfc 4983c201                       add        r10, 1
00d00 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00d05 48bf0006146a00000000           movabs     rdi, 0x6a140600
00d0f 488b18                         mov        rbx, qword ptr [rax]
00d12 48c1eb2a                       shr        rbx, 0x2a
00d16 48c1e309                       shl        rbx, 9
00d1a 41ba0000006a                   mov        r10d, 0x6a000000
00d20 4903da                         add        rbx, r10
00d23 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
00d27 0f8596320000                   jne        0x7f5bb43f1c43
00d2d e900000000                     jmp        0x7f5bb43ee9b2
00d32 488bf8                         mov        rdi, rax
00d35 4889bc24b0010000               mov        qword ptr [rsp + 0x1b0], rdi
00d3d 483b07                         cmp        rax, qword ptr [rdi]
00d40 488bf7                         mov        rsi, rdi
00d43 48bb004072ac5b7f0000           movabs     rbx, 0x7f5bac724000
00d4d 488b36                         mov        rsi, qword ptr [rsi]
00d50 48c1ee2a                       shr        rsi, 0x2a
00d54 48c1e609                       shl        rsi, 9
00d58 41ba0000006a                   mov        r10d, 0x6a000000
00d5e 4903f2                         add        rsi, r10
00d61 41ba94000000                   mov        r10d, 0x94
00d67 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00d6b 743b                           je         0x7f5bb43eea28
00d6d 4983c202                       add        r10, 2
00d71 4981fa98000000                 cmp        r10, 0x98
00d78 75ed                           jne        0x7f5bb43ee9e7
00d7a 41ba94000000                   mov        r10d, 0x94
00d80 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00d85 7415                           je         0x7f5bb43eea1c
00d87 4983c202                       add        r10, 2
00d8b 4981fa98000000                 cmp        r10, 0x98
00d92 75ec                           jne        0x7f5bb43eea00
00d94 41ba93000000                   mov        r10d, 0x93
00d9a eb10                           jmp        0x7f5bb43eea2c
00d9c 50                             push       rax
00d9d 4833c0                         xor        rax, rax
00da0 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
00da5 58                             pop        rax
00da6 ebb9                           jmp        0x7f5bb43ee9e1
00da8 4983c201                       add        r10, 1
00dac 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00db1 48be602779ac5b7f0000           movabs     rsi, 0x7f5bac792760
00dbb 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
00dbe 83c302                         add        ebx, 2
00dc1 895e70                         mov        dword ptr [rsi + 0x70], ebx
00dc4 81e3feff1f00                   and        ebx, 0x1ffffe
00dca 85db                           test       ebx, ebx
00dcc 0f84ff310000                   je         0x7f5bb43f1c51
00dd2 488bf7                         mov        rsi, rdi
00dd5 48bb602779ac5b7f0000           movabs     rbx, 0x7f5bac792760
00ddf 488b36                         mov        rsi, qword ptr [rsi]
00de2 48c1ee2a                       shr        rsi, 0x2a
00de6 48c1e609                       shl        rsi, 9
00dea 41ba0000006a                   mov        r10d, 0x6a000000
00df0 4903f2                         add        rsi, r10
00df3 41ba16000000                   mov        r10d, 0x16
00df9 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00dfd 7435                           je         0x7f5bb43eeab4
00dff 4983c202                       add        r10, 2
00e03 4983fa1a                       cmp        r10, 0x1a
00e07 75f0                           jne        0x7f5bb43eea79
00e09 41ba16000000                   mov        r10d, 0x16
00e0f 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00e14 7412                           je         0x7f5bb43eeaa8
00e16 4983c202                       add        r10, 2
00e1a 4983fa1a                       cmp        r10, 0x1a
00e1e 75ef                           jne        0x7f5bb43eea8f
00e20 41ba15000000                   mov        r10d, 0x15
00e26 eb10                           jmp        0x7f5bb43eeab8
00e28 50                             push       rax
00e29 4833c0                         xor        rax, rax
00e2c 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
00e31 58                             pop        rax
00e32 ebbf                           jmp        0x7f5bb43eea73
00e34 4983c201                       add        r10, 1
00e38 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00e3d 488bf7                         mov        rsi, rdi
00e40 0f1f440000                     nop        dword ptr [rax + rax]
00e45 48b8b0173b905b7f0000           movabs     rax, 0x7f5b903b17b0
00e4f e88c185207                     call       0x7f5bbb910360
00e54 0f1f84004c0f0003               nop        dword ptr [rax + rax + 0x3000f4c]
00e5c 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
00e64 8b7708                         mov        esi, dword ptr [rdi + 8]
00e67 48bb602779ac5b7f0000           movabs     rbx, 0x7f5bac792760
00e71 488383d800000001               add        qword ptr [rbx + 0xd8], 1
00e79 48bbf81079ac5b7f0000           movabs     rbx, 0x7f5bac7910f8
00e83 8b5370                         mov        edx, dword ptr [rbx + 0x70]
00e86 83c202                         add        edx, 2
00e89 895370                         mov        dword ptr [rbx + 0x70], edx
00e8c 81e2feff1f00                   and        edx, 0x1ffffe
00e92 85d2                           test       edx, edx
00e94 0f845d310000                   je         0x7f5bb43f1c77
00e9a 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
00ea2 48bbf81079ac5b7f0000           movabs     rbx, 0x7f5bac7910f8
00eac 4883830801000001               add        qword ptr [rbx + 0x108], 1
00eb4 ffc8                           dec        eax
00eb6 2bf0                           sub        esi, eax
00eb8 48bbc80779ac5b7f0000           movabs     rbx, 0x7f5bac7907c8
00ec2 8b4370                         mov        eax, dword ptr [rbx + 0x70]
00ec5 83c002                         add        eax, 2
00ec8 894370                         mov        dword ptr [rbx + 0x70], eax
00ecb 25feff1f00                     and        eax, 0x1ffffe
00ed0 85c0                           test       eax, eax
00ed2 0f8440310000                   je         0x7f5bb43f1c98
00ed8 48bbc80779ac5b7f0000           movabs     rbx, 0x7f5bac7907c8
00ee2 488383a800000001               add        qword ptr [rbx + 0xa8], 1
00eea 48bb0000000000000000           movabs     rbx, 0
00ef4 bb00000000                     mov        ebx, 0
00ef9 443bdb                         cmp        r11d, ebx
00efc 0f8c37310000                   jl         0x7f5bb43f1cb9
00f02 443bde                         cmp        r11d, esi
00f05 0f8d3b310000                   jge        0x7f5bb43f1cc6
00f0b 498bdb                         mov        rbx, r11
00f0e 899c24ac010000                 mov        dword ptr [rsp + 0x1ac], ebx
00f15 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
00f1d 488bbc24b0010000               mov        rdi, qword ptr [rsp + 0x1b0]
00f25 488bf7                         mov        rsi, rdi
00f28 48ba602779ac5b7f0000           movabs     rdx, 0x7f5bac792760
00f32 488b36                         mov        rsi, qword ptr [rsi]
00f35 48c1ee2a                       shr        rsi, 0x2a
00f39 48c1e609                       shl        rsi, 9
00f3d 41ba0000006a                   mov        r10d, 0x6a000000
00f43 4903f2                         add        rsi, r10
00f46 41ba1e000000                   mov        r10d, 0x1e
00f4c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
00f50 7435                           je         0x7f5bb43eec07
00f52 4983c202                       add        r10, 2
00f56 4983fa22                       cmp        r10, 0x22
00f5a 75f0                           jne        0x7f5bb43eebcc
00f5c 41ba1e000000                   mov        r10d, 0x1e
00f62 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
00f67 7412                           je         0x7f5bb43eebfb
00f69 4983c202                       add        r10, 2
00f6d 4983fa22                       cmp        r10, 0x22
00f71 75ef                           jne        0x7f5bb43eebe2
00f73 41ba1d000000                   mov        r10d, 0x1d
00f79 eb10                           jmp        0x7f5bb43eec0b
00f7b 50                             push       rax
00f7c 4833c0                         xor        rax, rax
00f7f 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
00f84 58                             pop        rax
00f85 ebbf                           jmp        0x7f5bb43eebc6
00f87 4983c201                       add        r10, 1
00f8b 4a8304d201                     add        qword ptr [rdx + r10*8], 1
00f90 488bf7                         mov        rsi, rdi
00f93 6690                           nop        
00f95 48b8d8173b905b7f0000           movabs     rax, 0x7f5b903b17d8
00f9f e83c175207                     call       0x7f5bbb910360
00fa4 0f1f84009c100004               nop        dword ptr [rax + rax + 0x400109c]
00fac 483b00                         cmp        rax, qword ptr [rax]
00faf 488bf0                         mov        rsi, rax
00fb2 48ba602779ac5b7f0000           movabs     rdx, 0x7f5bac792760
00fbc 488b36                         mov        rsi, qword ptr [rsi]
00fbf 48c1ee2a                       shr        rsi, 0x2a
00fc3 48c1e609                       shl        rsi, 9
00fc7 41ba0000006a                   mov        r10d, 0x6a000000
00fcd 4903f2                         add        rsi, r10
00fd0 41ba24000000                   mov        r10d, 0x24
00fd6 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
00fda 7435                           je         0x7f5bb43eec91
00fdc 4983c202                       add        r10, 2
00fe0 4983fa28                       cmp        r10, 0x28
00fe4 75f0                           jne        0x7f5bb43eec56
00fe6 41ba24000000                   mov        r10d, 0x24
00fec 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
00ff1 7412                           je         0x7f5bb43eec85
00ff3 4983c202                       add        r10, 2
00ff7 4983fa28                       cmp        r10, 0x28
00ffb 75ef                           jne        0x7f5bb43eec6c
00ffd 41ba23000000                   mov        r10d, 0x23
01003 eb10                           jmp        0x7f5bb43eec95
01005 50                             push       rax
01006 4833c0                         xor        rax, rax
01009 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
0100e 58                             pop        rax
0100f ebbf                           jmp        0x7f5bb43eec50
01011 4983c201                       add        r10, 1
01015 4a8304d201                     add        qword ptr [rdx + r10*8], 1
0101a 8b7028                         mov        esi, dword ptr [rax + 0x28]
0101d 488bd0                         mov        rdx, rax
01020 48b9602779ac5b7f0000           movabs     rcx, 0x7f5bac792760
0102a 488b12                         mov        rdx, qword ptr [rdx]
0102d 48c1ea2a                       shr        rdx, 0x2a
01031 48c1e209                       shl        rdx, 9
01035 41ba0000006a                   mov        r10d, 0x6a000000
0103b 4903d2                         add        rdx, r10
0103e 41ba2a000000                   mov        r10d, 0x2a
01044 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01048 7435                           je         0x7f5bb43eecff
0104a 4983c202                       add        r10, 2
0104e 4983fa2e                       cmp        r10, 0x2e
01052 75f0                           jne        0x7f5bb43eecc4
01054 41ba2a000000                   mov        r10d, 0x2a
0105a 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0105f 7412                           je         0x7f5bb43eecf3
01061 4983c202                       add        r10, 2
01065 4983fa2e                       cmp        r10, 0x2e
01069 75ef                           jne        0x7f5bb43eecda
0106b 41ba29000000                   mov        r10d, 0x29
01071 eb10                           jmp        0x7f5bb43eed03
01073 50                             push       rax
01074 4833c0                         xor        rax, rax
01077 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
0107c 58                             pop        rax
0107d ebbf                           jmp        0x7f5bb43eecbe
0107f 4983c201                       add        r10, 1
01083 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01088 8b4808                         mov        ecx, dword ptr [rax + 8]
0108b 48ba602779ac5b7f0000           movabs     rdx, 0x7f5bac792760
01095 4883827801000001               add        qword ptr [rdx + 0x178], 1
0109d 48ba301379ac5b7f0000           movabs     rdx, 0x7f5bac791330
010a7 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
010ab 4183c002                       add        r8d, 2
010af 44894270                       mov        dword ptr [rdx + 0x70], r8d
010b3 4181e0feff1f00                 and        r8d, 0x1ffffe
010ba 4585c0                         test       r8d, r8d
010bd 0f84952f0000                   je         0x7f5bb43f1cd8
010c3 48ba602779ac5b7f0000           movabs     rdx, 0x7f5bac792760
010cd 4883828801000001               add        qword ptr [rdx + 0x188], 1
010d5 8b9c24ac010000                 mov        ebx, dword ptr [rsp + 0x1ac]
010dc 4863db                         movsxd     rbx, ebx
010df ba0c000000                     mov        edx, 0xc
010e4 4c8bcb                         mov        r9, rbx
010e7 4c03ca                         add        r9, rdx
010ea 48ba180579ac5b7f0000           movabs     rdx, 0x7f5bac790518
010f4 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
010f8 4183c002                       add        r8d, 2
010fc 44894270                       mov        dword ptr [rdx + 0x70], r8d
01100 4181e0feff1f00                 and        r8d, 0x1ffffe
01107 4585c0                         test       r8d, r8d
0110a 0f84692f0000                   je         0x7f5bb43f1cf9
01110 48ba180579ac5b7f0000           movabs     rdx, 0x7f5bac790518
0111a 488382d800000001               add        qword ptr [rdx + 0xd8], 1
01122 48ba900679ac5b7f0000           movabs     rdx, 0x7f5bac790690
0112c 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01130 4183c002                       add        r8d, 2
01134 44894270                       mov        dword ptr [rdx + 0x70], r8d
01138 4181e0feff1f00                 and        r8d, 0x1ffffe
0113f 4585c0                         test       r8d, r8d
01142 0f84522f0000                   je         0x7f5bb43f1d1a
01148 48ba602779ac5b7f0000           movabs     rdx, 0x7f5bac792760
01152 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
0115a 48bad0397de200000000           movabs     rdx, 0xe27d39d0
01164 ba02000000                     mov        edx, 2
01169 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
01171 bf00000000                     mov        edi, 0
01176 488b8424b0010000               mov        rax, qword ptr [rsp + 0x1b0]
0117e 48890424                       mov        qword ptr [rsp], rax
01182 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0118a 4889442408                     mov        qword ptr [rsp + 8], rax
0118f 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01194 49bad0397de200000000           movabs     r10, 0xe27d39d0
0119e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
011a3 0f1f4000                       nop        dword ptr [rax]
011a7 e8341a5207                     call       0x7f5bbb910860
011ac 0f1f8400a4120005               nop        dword ptr [rax + rax + 0x50012a4]
011b4 48be004072ac5b7f0000           movabs     rsi, 0x7f5bac724000
011be ff86c8040000                   inc        dword ptr [rsi + 0x4c8]
011c4 e9dd0b0000                     jmp        0x7f5bb43efa26
011c9 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
011d0 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
011d8 83ff30                         cmp        edi, 0x30
011db 48be004072ac5b7f0000           movabs     rsi, 0x7f5bac724000
011e5 bae0040000                     mov        edx, 0x4e0
011ea 7f05                           jg         0x7f5bb43eee71
011ec baf0040000                     mov        edx, 0x4f0
011f1 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
011f5 488d4901                       lea        rcx, [rcx + 1]
011f9 48890c16                       mov        qword ptr [rsi + rdx], rcx
011fd 0f8ffe0a0000                   jg         0x7f5bb43ef981
01203 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
0120a 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
01212 660f1f440000                   nop        word ptr [rax + rax]
01218 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
01220 8b842464010000                 mov        eax, dword ptr [rsp + 0x164]
01227 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
0122f 48b9004072ac5b7f0000           movabs     rcx, 0x7f5bac724000
01239 4883810005000001               add        qword ptr [rcx + 0x500], 1
01241 48b9a01a79ac5b7f0000           movabs     rcx, 0x7f5bac791aa0
0124b 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
0124f 4183c002                       add        r8d, 2
01253 44894170                       mov        dword ptr [rcx + 0x70], r8d
01257 4181e0feff1f00                 and        r8d, 0x1ffffe
0125e 4585c0                         test       r8d, r8d
01261 0f84542e0000                   je         0x7f5bb43f1d3b
01267 48b9708d78e200000000           movabs     rcx, 0xe2788d70
01271 49b8a01a79ac5b7f0000           movabs     r8, 0x7f5bac791aa0
0127b 488b09                         mov        rcx, qword ptr [rcx]
0127e 48c1e92a                       shr        rcx, 0x2a
01282 48c1e109                       shl        rcx, 9
01286 41ba0000006a                   mov        r10d, 0x6a000000
0128c 4903ca                         add        rcx, r10
0128f 41ba16000000                   mov        r10d, 0x16
01295 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
01299 7435                           je         0x7f5bb43eef50
0129b 4983c202                       add        r10, 2
0129f 4983fa1a                       cmp        r10, 0x1a
012a3 75f0                           jne        0x7f5bb43eef15
012a5 41ba16000000                   mov        r10d, 0x16
012ab 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
012b0 7412                           je         0x7f5bb43eef44
012b2 4983c202                       add        r10, 2
012b6 4983fa1a                       cmp        r10, 0x1a
012ba 75ef                           jne        0x7f5bb43eef2b
012bc 41ba15000000                   mov        r10d, 0x15
012c2 eb10                           jmp        0x7f5bb43eef54
012c4 50                             push       rax
012c5 4833c0                         xor        rax, rax
012c8 4b0fb10cd0                     cmpxchg    qword ptr [r8 + r10*8], rcx
012cd 58                             pop        rax
012ce ebbf                           jmp        0x7f5bb43eef0f
012d0 4983c201                       add        r10, 1
012d4 4b8304d001                     add        qword ptr [r8 + r10*8], 1
012d9 48b9a01a79ac5b7f0000           movabs     rcx, 0x7f5bac791aa0
012e3 488381d800000001               add        qword ptr [rcx + 0xd8], 1
012eb 48b9f81079ac5b7f0000           movabs     rcx, 0x7f5bac7910f8
012f5 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
012f9 4183c002                       add        r8d, 2
012fd 44894170                       mov        dword ptr [rcx + 0x70], r8d
01301 4181e0feff1f00                 and        r8d, 0x1ffffe
01308 4585c0                         test       r8d, r8d
0130b 0f84cb2d0000                   je         0x7f5bb43f1d5c
01311 48b9f81079ac5b7f0000           movabs     rcx, 0x7f5bac7910f8
0131b 4883810801000001               add        qword ptr [rcx + 0x108], 1
01323 488bc8                         mov        rcx, rax
01326 83e90f                         sub        ecx, 0xf
01329 49b8c80779ac5b7f0000           movabs     r8, 0x7f5bac7907c8
01333 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
01337 4183c102                       add        r9d, 2
0133b 45894870                       mov        dword ptr [r8 + 0x70], r9d
0133f 4181e1feff1f00                 and        r9d, 0x1ffffe
01346 4585c9                         test       r9d, r9d
01349 0f84ae2d0000                   je         0x7f5bb43f1d7d
0134f 49b8c80779ac5b7f0000           movabs     r8, 0x7f5bac7907c8
01359 498380a800000001               add        qword ptr [r8 + 0xa8], 1
01361 49b80000000000000000           movabs     r8, 0
0136b 41b800000000                   mov        r8d, 0
01371 413bf0                         cmp        esi, r8d
01374 0f8ca42d0000                   jl         0x7f5bb43f1d9e
0137a 3bf1                           cmp        esi, ecx
0137c 0f8da92d0000                   jge        0x7f5bb43f1dab
01382 488bce                         mov        rcx, rsi
01385 898c24b8010000                 mov        dword ptr [rsp + 0x1b8], ecx
0138c 49b8708d78e200000000           movabs     r8, 0xe2788d70
01396 4d8bc8                         mov        r9, r8
01399 49bea01a79ac5b7f0000           movabs     r14, 0x7f5bac791aa0
013a3 4d8b09                         mov        r9, qword ptr [r9]
013a6 49c1e92a                       shr        r9, 0x2a
013aa 49c1e109                       shl        r9, 9
013ae 41ba0000006a                   mov        r10d, 0x6a000000
013b4 4d03ca                         add        r9, r10
013b7 41ba24000000                   mov        r10d, 0x24
013bd 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
013c1 7435                           je         0x7f5bb43ef078
013c3 4983c202                       add        r10, 2
013c7 4983fa28                       cmp        r10, 0x28
013cb 75f0                           jne        0x7f5bb43ef03d
013cd 41ba24000000                   mov        r10d, 0x24
013d3 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
013d8 7412                           je         0x7f5bb43ef06c
013da 4983c202                       add        r10, 2
013de 4983fa28                       cmp        r10, 0x28
013e2 75ef                           jne        0x7f5bb43ef053
013e4 41ba23000000                   mov        r10d, 0x23
013ea eb10                           jmp        0x7f5bb43ef07c
013ec 50                             push       rax
013ed 4833c0                         xor        rax, rax
013f0 4f0fb10cd6                     cmpxchg    qword ptr [r14 + r10*8], r9
013f5 58                             pop        rax
013f6 ebbf                           jmp        0x7f5bb43ef037
013f8 4983c201                       add        r10, 1
013fc 4b8304d601                     add        qword ptr [r14 + r10*8], 1
01401 48b9c80879ac5b7f0000           movabs     rcx, 0x7f5bac7908c8
0140b 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
0140f 4183c102                       add        r9d, 2
01413 44894970                       mov        dword ptr [rcx + 0x70], r9d
01417 4181e1feff1f00                 and        r9d, 0x1ffffe
0141e 4585c9                         test       r9d, r9d
01421 0f84112d0000                   je         0x7f5bb43f1db8
01427 48b9c80879ac5b7f0000           movabs     rcx, 0x7f5bac7908c8
01431 488381a800000001               add        qword ptr [rcx + 0xa8], 1
01439 48b9f00979ac5b7f0000           movabs     rcx, 0x7f5bac7909f0
01443 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
01447 4183c002                       add        r8d, 2
0144b 44894170                       mov        dword ptr [rcx + 0x70], r8d
0144f 4181e0feff1f00                 and        r8d, 0x1ffffe
01456 4585c0                         test       r8d, r8d
01459 0f84fa2c0000                   je         0x7f5bb43f1dd9
0145f 48b9f00979ac5b7f0000           movabs     rcx, 0x7f5bac7909f0
01469 ff81b8000000                   inc        dword ptr [rcx + 0xb8]
0146f 8b8c24b8010000                 mov        ecx, dword ptr [rsp + 0x1b8]
01476 89b424c0010000                 mov        dword ptr [rsp + 0x1c0], esi
0147d 49b8585e7ae200000000           movabs     r8, 0xe27a5e58
01487 4d8bc8                         mov        r9, r8
0148a 49bea01a79ac5b7f0000           movabs     r14, 0x7f5bac791aa0
01494 4983865801000001               add        qword ptr [r14 + 0x158], 1
0149c 49b9681c79ac5b7f0000           movabs     r9, 0x7f5bac791c68
014a6 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
014aa 83c302                         add        ebx, 2
014ad 41895970                       mov        dword ptr [r9 + 0x70], ebx
014b1 81e3feff1f00                   and        ebx, 0x1ffffe
014b7 85db                           test       ebx, ebx
014b9 0f84bb2c0000                   je         0x7f5bb43f1dfa
014bf 4d8bc8                         mov        r9, r8
014c2 48bb681c79ac5b7f0000           movabs     rbx, 0x7f5bac791c68
014cc 488383a800000001               add        qword ptr [rbx + 0xa8], 1
014d4 49b9481d79ac5b7f0000           movabs     r9, 0x7f5bac791d48
014de 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
014e2 83c302                         add        ebx, 2
014e5 41895970                       mov        dword ptr [r9 + 0x70], ebx
014e9 81e3feff1f00                   and        ebx, 0x1ffffe
014ef 85db                           test       ebx, ebx
014f1 0f84a42c0000                   je         0x7f5bb43f1e1b
014f7 49b9481d79ac5b7f0000           movabs     r9, 0x7f5bac791d48
01501 498381b800000001               add        qword ptr [r9 + 0xb8], 1
01509 49b8701279ac5b7f0000           movabs     r8, 0x7f5bac791270
01513 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
01517 4183c102                       add        r9d, 2
0151b 45894870                       mov        dword ptr [r8 + 0x70], r9d
0151f 4181e1feff1f00                 and        r9d, 0x1ffffe
01526 4585c9                         test       r9d, r9d
01529 0f848d2c0000                   je         0x7f5bb43f1e3c
0152f 49b8708d78e200000000           movabs     r8, 0xe2788d70
01539 4d8bc8                         mov        r9, r8
0153c 48bb481d79ac5b7f0000           movabs     rbx, 0x7f5bac791d48
01546 4d8b09                         mov        r9, qword ptr [r9]
01549 49c1e92a                       shr        r9, 0x2a
0154d 49c1e109                       shl        r9, 9
01551 41ba0000006a                   mov        r10d, 0x6a000000
01557 4d03ca                         add        r9, r10
0155a 41ba1c000000                   mov        r10d, 0x1c
01560 4e3b0cd3                       cmp        r9, qword ptr [rbx + r10*8]
01564 7435                           je         0x7f5bb43ef21b
01566 4983c202                       add        r10, 2
0156a 4983fa20                       cmp        r10, 0x20
0156e 75f0                           jne        0x7f5bb43ef1e0
01570 41ba1c000000                   mov        r10d, 0x1c
01576 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0157b 7412                           je         0x7f5bb43ef20f
0157d 4983c202                       add        r10, 2
01581 4983fa20                       cmp        r10, 0x20
01585 75ef                           jne        0x7f5bb43ef1f6
01587 41ba1b000000                   mov        r10d, 0x1b
0158d eb10                           jmp        0x7f5bb43ef21f
0158f 50                             push       rax
01590 4833c0                         xor        rax, rax
01593 4e0fb10cd3                     cmpxchg    qword ptr [rbx + r10*8], r9
01598 58                             pop        rax
01599 ebbf                           jmp        0x7f5bb43ef1da
0159b 4983c201                       add        r10, 1
0159f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
015a4 49b9481d79ac5b7f0000           movabs     r9, 0x7f5bac791d48
015ae 4d8b00                         mov        r8, qword ptr [r8]
015b1 49c1e82a                       shr        r8, 0x2a
015b5 49c1e009                       shl        r8, 9
015b9 41ba0000006a                   mov        r10d, 0x6a000000
015bf 4d03c2                         add        r8, r10
015c2 41ba22000000                   mov        r10d, 0x22
015c8 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
015cc 7435                           je         0x7f5bb43ef283
015ce 4983c202                       add        r10, 2
015d2 4983fa26                       cmp        r10, 0x26
015d6 75f0                           jne        0x7f5bb43ef248
015d8 41ba22000000                   mov        r10d, 0x22
015de 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
015e3 7412                           je         0x7f5bb43ef277
015e5 4983c202                       add        r10, 2
015e9 4983fa26                       cmp        r10, 0x26
015ed 75ef                           jne        0x7f5bb43ef25e
015ef 41ba21000000                   mov        r10d, 0x21
015f5 eb10                           jmp        0x7f5bb43ef287
015f7 50                             push       rax
015f8 4833c0                         xor        rax, rax
015fb 4f0fb104d1                     cmpxchg    qword ptr [r9 + r10*8], r8
01600 58                             pop        rax
01601 ebbf                           jmp        0x7f5bb43ef242
01603 4983c201                       add        r10, 1
01607 4b8304d101                     add        qword ptr [r9 + r10*8], 1
0160c 49b8481d79ac5b7f0000           movabs     r8, 0x7f5bac791d48
01616 4983803801000001               add        qword ptr [r8 + 0x138], 1
0161e 49b8301379ac5b7f0000           movabs     r8, 0x7f5bac791330
01628 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
0162c 4183c102                       add        r9d, 2
01630 45894870                       mov        dword ptr [r8 + 0x70], r9d
01634 4181e1feff1f00                 and        r9d, 0x1ffffe
0163b 4585c9                         test       r9d, r9d
0163e 0f84992b0000                   je         0x7f5bb43f1e5d
01644 49b8481d79ac5b7f0000           movabs     r8, 0x7f5bac791d48
0164e 4983804801000001               add        qword ptr [r8 + 0x148], 1
01656 4863d9                         movsxd     rbx, ecx
01659 b90c000000                     mov        ecx, 0xc
0165e 4c8bcb                         mov        r9, rbx
01661 4c03c9                         add        r9, rcx
01664 48b9180579ac5b7f0000           movabs     rcx, 0x7f5bac790518
0166e 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
01672 4183c002                       add        r8d, 2
01676 44894170                       mov        dword ptr [rcx + 0x70], r8d
0167a 4181e0feff1f00                 and        r8d, 0x1ffffe
01681 4585c0                         test       r8d, r8d
01684 0f84742b0000                   je         0x7f5bb43f1e7e
0168a 48b9180579ac5b7f0000           movabs     rcx, 0x7f5bac790518
01694 488381d800000001               add        qword ptr [rcx + 0xd8], 1
0169c 48b9900679ac5b7f0000           movabs     rcx, 0x7f5bac790690
016a6 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
016aa 4183c002                       add        r8d, 2
016ae 44894170                       mov        dword ptr [rcx + 0x70], r8d
016b2 4181e0feff1f00                 and        r8d, 0x1ffffe
016b9 4585c0                         test       r8d, r8d
016bc 0f845d2b0000                   je         0x7f5bb43f1e9f
016c2 48b9481d79ac5b7f0000           movabs     rcx, 0x7f5bac791d48
016cc 4883816801000001               add        qword ptr [rcx + 0x168], 1
016d4 48b928597be200000000           movabs     rcx, 0xe27b5928
016de 48beb88d78e200000000           movabs     rsi, 0xe2788db8
016e8 4c8bc2                         mov        r8, rdx
016eb ba02000000                     mov        edx, 2
016f0 b910000000                     mov        ecx, 0x10
016f5 498bc0                         mov        rax, r8
016f8 4c8bc0                         mov        r8, rax
016fb bf00000000                     mov        edi, 0
01700 48890424                       mov        qword ptr [rsp], rax
01704 48895c2408                     mov        qword ptr [rsp + 8], rbx
01709 49ba708d78e200000000           movabs     r10, 0xe2788d70
01713 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01718 49ba28597be200000000           movabs     r10, 0xe27b5928
01722 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01727 e8b4145207                     call       0x7f5bbb910860
0172c 0f1f840024180006               nop        dword ptr [rax + rax + 0x6001824]
01734 4885c0                         test       rax, rax
01737 48bb481d79ac5b7f0000           movabs     rbx, 0x7f5bac791d48
01741 750c                           jne        0x7f5bb43ef3cf
01743 808b7101000001                 or         byte ptr [rbx + 0x171], 1
0174a e98b000000                     jmp        0x7f5bb43ef45a
0174f 488b38                         mov        rdi, qword ptr [rax]
01752 48c1ef2a                       shr        rdi, 0x2a
01756 48c1e709                       shl        rdi, 9
0175a 41ba0000006a                   mov        r10d, 0x6a000000
01760 4903fa                         add        rdi, r10
01763 41ba30000000                   mov        r10d, 0x30
01769 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
0176d 7435                           je         0x7f5bb43ef424
0176f 4983c202                       add        r10, 2
01773 4983fa34                       cmp        r10, 0x34
01777 75f0                           jne        0x7f5bb43ef3e9
01779 41ba30000000                   mov        r10d, 0x30
0177f 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01784 7412                           je         0x7f5bb43ef418
01786 4983c202                       add        r10, 2
0178a 4983fa34                       cmp        r10, 0x34
0178e 75ef                           jne        0x7f5bb43ef3ff
01790 41ba2f000000                   mov        r10d, 0x2f
01796 eb10                           jmp        0x7f5bb43ef428
01798 50                             push       rax
01799 4833c0                         xor        rax, rax
0179c 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
017a1 58                             pop        rax
017a2 ebbf                           jmp        0x7f5bb43ef3e3
017a4 4983c201                       add        r10, 1
017a8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
017ad 48bf0006146a00000000           movabs     rdi, 0x6a140600
017b7 488b18                         mov        rbx, qword ptr [rax]
017ba 48c1eb2a                       shr        rbx, 0x2a
017be 48c1e309                       shl        rbx, 9
017c2 41ba0000006a                   mov        r10d, 0x6a000000
017c8 4903da                         add        rbx, r10
017cb 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
017cf 0f856b2a0000                   jne        0x7f5bb43f1ec0
017d5 e900000000                     jmp        0x7f5bb43ef45a
017da 488bf8                         mov        rdi, rax
017dd 4889bc24c8010000               mov        qword ptr [rsp + 0x1c8], rdi
017e5 483b07                         cmp        rax, qword ptr [rdi]
017e8 488bf7                         mov        rsi, rdi
017eb 48bb004072ac5b7f0000           movabs     rbx, 0x7f5bac724000
017f5 488b36                         mov        rsi, qword ptr [rsi]
017f8 48c1ee2a                       shr        rsi, 0x2a
017fc 48c1e609                       shl        rsi, 9
01800 41ba0000006a                   mov        r10d, 0x6a000000
01806 4903f2                         add        rsi, r10
01809 41baa3000000                   mov        r10d, 0xa3
0180f 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
01813 743b                           je         0x7f5bb43ef4d0
01815 4983c202                       add        r10, 2
01819 4981faa7000000                 cmp        r10, 0xa7
01820 75ed                           jne        0x7f5bb43ef48f
01822 41baa3000000                   mov        r10d, 0xa3
01828 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0182d 7415                           je         0x7f5bb43ef4c4
0182f 4983c202                       add        r10, 2
01833 4981faa7000000                 cmp        r10, 0xa7
0183a 75ec                           jne        0x7f5bb43ef4a8
0183c 41baa2000000                   mov        r10d, 0xa2
01842 eb10                           jmp        0x7f5bb43ef4d4
01844 50                             push       rax
01845 4833c0                         xor        rax, rax
01848 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
0184d 58                             pop        rax
0184e ebb9                           jmp        0x7f5bb43ef489
01850 4983c201                       add        r10, 1
01854 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01859 48be602779ac5b7f0000           movabs     rsi, 0x7f5bac792760
01863 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
01866 83c302                         add        ebx, 2
01869 895e70                         mov        dword ptr [rsi + 0x70], ebx
0186c 81e3feff1f00                   and        ebx, 0x1ffffe
01872 85db                           test       ebx, ebx
01874 0f84d4290000                   je         0x7f5bb43f1ece
0187a 488bf7                         mov        rsi, rdi
0187d 48bb602779ac5b7f0000           movabs     rbx, 0x7f5bac792760
01887 488b36                         mov        rsi, qword ptr [rsi]
0188a 48c1ee2a                       shr        rsi, 0x2a
0188e 48c1e609                       shl        rsi, 9
01892 41ba0000006a                   mov        r10d, 0x6a000000
01898 4903f2                         add        rsi, r10
0189b 41ba16000000                   mov        r10d, 0x16
018a1 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
018a5 7435                           je         0x7f5bb43ef55c
018a7 4983c202                       add        r10, 2
018ab 4983fa1a                       cmp        r10, 0x1a
018af 75f0                           jne        0x7f5bb43ef521
018b1 41ba16000000                   mov        r10d, 0x16
018b7 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
018bc 7412                           je         0x7f5bb43ef550
018be 4983c202                       add        r10, 2
018c2 4983fa1a                       cmp        r10, 0x1a
018c6 75ef                           jne        0x7f5bb43ef537
018c8 41ba15000000                   mov        r10d, 0x15
018ce eb10                           jmp        0x7f5bb43ef560
018d0 50                             push       rax
018d1 4833c0                         xor        rax, rax
018d4 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
018d9 58                             pop        rax
018da ebbf                           jmp        0x7f5bb43ef51b
018dc 4983c201                       add        r10, 1
018e0 4a8304d301                     add        qword ptr [rbx + r10*8], 1
018e5 488bf7                         mov        rsi, rdi
018e8 0f1f440000                     nop        dword ptr [rax + rax]
018ed 48b800183b905b7f0000           movabs     rax, 0x7f5b903b1800
018f7 e8e40d5207                     call       0x7f5bbb910360
018fc 0f1f8400f4190007               nop        dword ptr [rax + rax + 0x70019f4]
01904 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
0190c 8b7708                         mov        esi, dword ptr [rdi + 8]
0190f 48bb602779ac5b7f0000           movabs     rbx, 0x7f5bac792760
01919 488383d800000001               add        qword ptr [rbx + 0xd8], 1
01921 48bbf81079ac5b7f0000           movabs     rbx, 0x7f5bac7910f8
0192b 8b5370                         mov        edx, dword ptr [rbx + 0x70]
0192e 83c202                         add        edx, 2
01931 895370                         mov        dword ptr [rbx + 0x70], edx
01934 81e2feff1f00                   and        edx, 0x1ffffe
0193a 85d2                           test       edx, edx
0193c 0f8432290000                   je         0x7f5bb43f1ef4
01942 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
0194a 48bbf81079ac5b7f0000           movabs     rbx, 0x7f5bac7910f8
01954 4883830801000001               add        qword ptr [rbx + 0x108], 1
0195c ffc8                           dec        eax
0195e 2bf0                           sub        esi, eax
01960 48bbc80779ac5b7f0000           movabs     rbx, 0x7f5bac7907c8
0196a 8b4370                         mov        eax, dword ptr [rbx + 0x70]
0196d 83c002                         add        eax, 2
01970 894370                         mov        dword ptr [rbx + 0x70], eax
01973 25feff1f00                     and        eax, 0x1ffffe
01978 85c0                           test       eax, eax
0197a 0f8415290000                   je         0x7f5bb43f1f15
01980 48bbc80779ac5b7f0000           movabs     rbx, 0x7f5bac7907c8
0198a 488383a800000001               add        qword ptr [rbx + 0xa8], 1
01992 48bb0000000000000000           movabs     rbx, 0
0199c bb00000000                     mov        ebx, 0
019a1 443bdb                         cmp        r11d, ebx
019a4 0f8c0c290000                   jl         0x7f5bb43f1f36
019aa 443bde                         cmp        r11d, esi
019ad 0f8d10290000                   jge        0x7f5bb43f1f43
019b3 498bdb                         mov        rbx, r11
019b6 899c24c4010000                 mov        dword ptr [rsp + 0x1c4], ebx
019bd 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
019c5 488bbc24c8010000               mov        rdi, qword ptr [rsp + 0x1c8]
019cd 488bf7                         mov        rsi, rdi
019d0 48ba602779ac5b7f0000           movabs     rdx, 0x7f5bac792760
019da 488b36                         mov        rsi, qword ptr [rsi]
019dd 48c1ee2a                       shr        rsi, 0x2a
019e1 48c1e609                       shl        rsi, 9
019e5 41ba0000006a                   mov        r10d, 0x6a000000
019eb 4903f2                         add        rsi, r10
019ee 41ba1e000000                   mov        r10d, 0x1e
019f4 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
019f8 7435                           je         0x7f5bb43ef6af
019fa 4983c202                       add        r10, 2
019fe 4983fa22                       cmp        r10, 0x22
01a02 75f0                           jne        0x7f5bb43ef674
01a04 41ba1e000000                   mov        r10d, 0x1e
01a0a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01a0f 7412                           je         0x7f5bb43ef6a3
01a11 4983c202                       add        r10, 2
01a15 4983fa22                       cmp        r10, 0x22
01a19 75ef                           jne        0x7f5bb43ef68a
01a1b 41ba1d000000                   mov        r10d, 0x1d
01a21 eb10                           jmp        0x7f5bb43ef6b3
01a23 50                             push       rax
01a24 4833c0                         xor        rax, rax
01a27 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
01a2c 58                             pop        rax
01a2d ebbf                           jmp        0x7f5bb43ef66e
01a2f 4983c201                       add        r10, 1
01a33 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01a38 488bf7                         mov        rsi, rdi
01a3b 6690                           nop        
01a3d 48b828183b905b7f0000           movabs     rax, 0x7f5b903b1828
01a47 e8940c5207                     call       0x7f5bbb910360
01a4c 0f1f8400441b0008               nop        dword ptr [rax + rax + 0x8001b44]
01a54 483b00                         cmp        rax, qword ptr [rax]
01a57 488bf0                         mov        rsi, rax
01a5a 48ba602779ac5b7f0000           movabs     rdx, 0x7f5bac792760
01a64 488b36                         mov        rsi, qword ptr [rsi]
01a67 48c1ee2a                       shr        rsi, 0x2a
01a6b 48c1e609                       shl        rsi, 9
01a6f 41ba0000006a                   mov        r10d, 0x6a000000
01a75 4903f2                         add        rsi, r10
01a78 41ba24000000                   mov        r10d, 0x24
01a7e 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01a82 7435                           je         0x7f5bb43ef739
01a84 4983c202                       add        r10, 2
01a88 4983fa28                       cmp        r10, 0x28
01a8c 75f0                           jne        0x7f5bb43ef6fe
01a8e 41ba24000000                   mov        r10d, 0x24
01a94 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01a99 7412                           je         0x7f5bb43ef72d
01a9b 4983c202                       add        r10, 2
01a9f 4983fa28                       cmp        r10, 0x28
01aa3 75ef                           jne        0x7f5bb43ef714
01aa5 41ba23000000                   mov        r10d, 0x23
01aab eb10                           jmp        0x7f5bb43ef73d
01aad 50                             push       rax
01aae 4833c0                         xor        rax, rax
01ab1 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
01ab6 58                             pop        rax
01ab7 ebbf                           jmp        0x7f5bb43ef6f8
01ab9 4983c201                       add        r10, 1
01abd 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01ac2 8b7028                         mov        esi, dword ptr [rax + 0x28]
01ac5 488bd0                         mov        rdx, rax
01ac8 48b9602779ac5b7f0000           movabs     rcx, 0x7f5bac792760
01ad2 488b12                         mov        rdx, qword ptr [rdx]
01ad5 48c1ea2a                       shr        rdx, 0x2a
01ad9 48c1e209                       shl        rdx, 9
01add 41ba0000006a                   mov        r10d, 0x6a000000
01ae3 4903d2                         add        rdx, r10
01ae6 41ba2a000000                   mov        r10d, 0x2a
01aec 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01af0 7435                           je         0x7f5bb43ef7a7
01af2 4983c202                       add        r10, 2
01af6 4983fa2e                       cmp        r10, 0x2e
01afa 75f0                           jne        0x7f5bb43ef76c
01afc 41ba2a000000                   mov        r10d, 0x2a
01b02 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01b07 7412                           je         0x7f5bb43ef79b
01b09 4983c202                       add        r10, 2
01b0d 4983fa2e                       cmp        r10, 0x2e
01b11 75ef                           jne        0x7f5bb43ef782
01b13 41ba29000000                   mov        r10d, 0x29
01b19 eb10                           jmp        0x7f5bb43ef7ab
01b1b 50                             push       rax
01b1c 4833c0                         xor        rax, rax
01b1f 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
01b24 58                             pop        rax
01b25 ebbf                           jmp        0x7f5bb43ef766
01b27 4983c201                       add        r10, 1
01b2b 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01b30 8b4808                         mov        ecx, dword ptr [rax + 8]
01b33 48ba602779ac5b7f0000           movabs     rdx, 0x7f5bac792760
01b3d 4883827801000001               add        qword ptr [rdx + 0x178], 1
01b45 48ba301379ac5b7f0000           movabs     rdx, 0x7f5bac791330
01b4f 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01b53 4183c002                       add        r8d, 2
01b57 44894270                       mov        dword ptr [rdx + 0x70], r8d
01b5b 4181e0feff1f00                 and        r8d, 0x1ffffe
01b62 4585c0                         test       r8d, r8d
01b65 0f846a270000                   je         0x7f5bb43f1f55
01b6b 48ba602779ac5b7f0000           movabs     rdx, 0x7f5bac792760
01b75 4883828801000001               add        qword ptr [rdx + 0x188], 1
01b7d 8b9c24c4010000                 mov        ebx, dword ptr [rsp + 0x1c4]
01b84 4863db                         movsxd     rbx, ebx
01b87 ba0c000000                     mov        edx, 0xc
01b8c 4c8bcb                         mov        r9, rbx
01b8f 4c03ca                         add        r9, rdx
01b92 48ba180579ac5b7f0000           movabs     rdx, 0x7f5bac790518
01b9c 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01ba0 4183c002                       add        r8d, 2
01ba4 44894270                       mov        dword ptr [rdx + 0x70], r8d
01ba8 4181e0feff1f00                 and        r8d, 0x1ffffe
01baf 4585c0                         test       r8d, r8d
01bb2 0f843e270000                   je         0x7f5bb43f1f76
01bb8 48ba180579ac5b7f0000           movabs     rdx, 0x7f5bac790518
01bc2 488382d800000001               add        qword ptr [rdx + 0xd8], 1
01bca 48ba900679ac5b7f0000           movabs     rdx, 0x7f5bac790690
01bd4 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01bd8 4183c002                       add        r8d, 2
01bdc 44894270                       mov        dword ptr [rdx + 0x70], r8d
01be0 4181e0feff1f00                 and        r8d, 0x1ffffe
01be7 4585c0                         test       r8d, r8d
01bea 0f8427270000                   je         0x7f5bb43f1f97
01bf0 48ba602779ac5b7f0000           movabs     rdx, 0x7f5bac792760
01bfa 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
01c02 48bad0397de200000000           movabs     rdx, 0xe27d39d0
01c0c ba02000000                     mov        edx, 2
01c11 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
01c19 bf00000000                     mov        edi, 0
01c1e 488b8424c8010000               mov        rax, qword ptr [rsp + 0x1c8]
01c26 48890424                       mov        qword ptr [rsp], rax
01c2a 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
01c32 4889442408                     mov        qword ptr [rsp + 8], rax
01c37 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01c3c 49bad0397de200000000           movabs     r10, 0xe27d39d0
01c46 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c4b 0f1f4000                       nop        dword ptr [rax]
01c4f e88c0f5207                     call       0x7f5bbb910860
01c54 0f1f84004c1d0009               nop        dword ptr [rax + rax + 0x9001d4c]
01c5c 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01c64 4183c310                       add        r11d, 0x10
01c68 8bb424c0010000                 mov        esi, dword ptr [rsp + 0x1c0]
01c6f 83c610                         add        esi, 0x10
01c72 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01c7a ba02000000                     mov        edx, 2
01c7f 7c05                           jl         0x7f5bb43ef906
01c81 ba00000000                     mov        edx, 0
01c86 48b9004072ac5b7f0000           movabs     rcx, 0x7f5bac724000
01c90 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
01c94 4403c2                         add        r8d, edx
01c97 44894174                       mov        dword ptr [rcx + 0x74], r8d
01c9b 85d2                           test       edx, edx
01c9d 7506                           jne        0x7f5bb43ef925
01c9f 41b802000000                   mov        r8d, 2
01ca5 4181e0fe3f0000                 and        r8d, 0x3ffe
01cac 4585c0                         test       r8d, r8d
01caf 0f8483260000                   je         0x7f5bb43f1fb8
01cb5 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01cb9 418502                         test       dword ptr [r10], eax
01cbc 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01cc4 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
01cce b940050000                     mov        ecx, 0x540
01cd3 7c05                           jl         0x7f5bb43ef95a
01cd5 b950050000                     mov        ecx, 0x550
01cda 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01cde 4d8d4001                       lea        r8, [r8 + 1]
01ce2 4c89040a                       mov        qword ptr [rdx + rcx], r8
01ce6 0f8c2cf5ffff                   jl         0x7f5bb43eee98
01cec 48be004072ac5b7f0000           movabs     rsi, 0x7f5bac724000
01cf6 ff8660050000                   inc        dword ptr [rsi + 0x560]
01cfc e9a5000000                     jmp        0x7f5bb43efa26
01d01 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
01d0b 4883827805000001               add        qword ptr [rdx + 0x578], 1
01d13 488bb42468010000               mov        rsi, qword ptr [rsp + 0x168]
01d1b 8b942490010000                 mov        edx, dword ptr [rsp + 0x190]
01d22 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
01d2a 448b842474010000               mov        r8d, dword ptr [rsp + 0x174]
01d32 4c8bcf                         mov        r9, rdi
01d35 4885c9                         test       rcx, rcx
01d38 0f841b260000                   je         0x7f5bb43f1fd9
01d3e 85d2                           test       edx, edx
01d40 0f8c13260000                   jl         0x7f5bb43f1fd9
01d46 4585c0                         test       r8d, r8d
01d49 0f8c0a260000                   jl         0x7f5bb43f1fd9
01d4f 4a8d3c0a                       lea        rdi, [rdx + r9]
01d53 3b7e08                         cmp        edi, dword ptr [rsi + 8]
01d56 0f87fd250000                   ja         0x7f5bb43f1fd9
01d5c 4b8d3c08                       lea        rdi, [r8 + r9]
01d60 3b7908                         cmp        edi, dword ptr [rcx + 8]
01d63 0f87f0250000                   ja         0x7f5bb43f1fd9
01d69 4585c9                         test       r9d, r9d
01d6c 0f8ce7250000                   jl         0x7f5bb43f1fd9
01d72 4863d2                         movsxd     rdx, edx
01d75 4d63c0                         movsxd     r8, r8d
01d78 488d7c160c                     lea        rdi, [rsi + rdx + 0xc]
01d7d 4a8d74010c                     lea        rsi, [rcx + r8 + 0xc]
01d82 498bd1                         mov        rdx, r9
01d85 40f6c40f                       test       spl, 0xf
01d89 0f8412000000                   je         0x7f5bb43efa21
01d8f 4883ec08                       sub        rsp, 8
01d93 e808a55007                     call       0x7f5bbb8f9f20
01d98 4883c408                       add        rsp, 8
01d9c e905000000                     jmp        0x7f5bb43efa26
01da1 e8faa45007                     call       0x7f5bbb8f9f20
01da6 8bb424a4010000                 mov        esi, dword ptr [rsp + 0x1a4]
01dad 8b9c24a0010000                 mov        ebx, dword ptr [rsp + 0x1a0]
01db4 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
01dbc 488bfb                         mov        rdi, rbx
01dbf 2bbc24a8010000                 sub        edi, dword ptr [rsp + 0x1a8]
01dc6 4183f810                       cmp        r8d, 0x10
01dca 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
01dd4 b988050000                     mov        ecx, 0x588
01dd9 7f05                           jg         0x7f5bb43efa60
01ddb b998050000                     mov        ecx, 0x598
01de0 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
01de4 4d8d4901                       lea        r9, [r9 + 1]
01de8 4c890c0a                       mov        qword ptr [rdx + rcx], r9
01dec 448b8c24a8010000               mov        r9d, dword ptr [rsp + 0x1a8]
01df4 0f8f2c000000                   jg         0x7f5bb43efaa6
01dfa 4183f910                       cmp        r9d, 0x10
01dfe 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
01e08 b9b8050000                     mov        ecx, 0x5b8
01e0d 7d05                           jge        0x7f5bb43efa94
01e0f b9a8050000                     mov        ecx, 0x5a8
01e14 488b040a                       mov        rax, qword ptr [rdx + rcx]
01e18 488d4001                       lea        rax, [rax + 1]
01e1c 4889040a                       mov        qword ptr [rdx + rcx], rax
01e20 0f8db6100000                   jge        0x7f5bb43f0b5c
01e26 453bc8                         cmp        r9d, r8d
01e29 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
01e33 b920060000                     mov        ecx, 0x620
01e38 7c05                           jl         0x7f5bb43efabf
01e3a b930060000                     mov        ecx, 0x630
01e3f 488b040a                       mov        rax, qword ptr [rdx + rcx]
01e43 488d4001                       lea        rax, [rax + 1]
01e47 4889040a                       mov        qword ptr [rdx + rcx], rax
01e4b 0f8c04030000                   jl         0x7f5bb43efdd5
01e51 4183f830                       cmp        r8d, 0x30
01e55 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
01e5f b940060000                     mov        ecx, 0x640
01e64 7e05                           jle        0x7f5bb43efaeb
01e66 b950060000                     mov        ecx, 0x650
01e6b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
01e6f 4d8d4901                       lea        r9, [r9 + 1]
01e73 4c890c0a                       mov        qword ptr [rdx + rcx], r9
01e77 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
01e7e 0f8ec4000000                   jle        0x7f5bb43efbc8
01e84 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
01e8e 4883826006000001               add        qword ptr [rdx + 0x660], 1
01e96 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
01e9e 488bd7                         mov        rdx, rdi
01ea1 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
01ea9 498bf8                         mov        rdi, r8
01eac 4c8bc3                         mov        r8, rbx
01eaf 4c8bcf                         mov        r9, rdi
01eb2 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
01eb9 4885f6                         test       rsi, rsi
01ebc 0f84a7240000                   je         0x7f5bb43f1fe9
01ec2 4885c9                         test       rcx, rcx
01ec5 0f849e240000                   je         0x7f5bb43f1fe9
01ecb 85d2                           test       edx, edx
01ecd 0f8c96240000                   jl         0x7f5bb43f1fe9
01ed3 4585c0                         test       r8d, r8d
01ed6 0f8c8d240000                   jl         0x7f5bb43f1fe9
01edc 4a8d3c0a                       lea        rdi, [rdx + r9]
01ee0 3b7e08                         cmp        edi, dword ptr [rsi + 8]
01ee3 0f8780240000                   ja         0x7f5bb43f1fe9
01ee9 4b8d3c08                       lea        rdi, [r8 + r9]
01eed 3b7908                         cmp        edi, dword ptr [rcx + 8]
01ef0 0f8773240000                   ja         0x7f5bb43f1fe9
01ef6 4585c9                         test       r9d, r9d
01ef9 0f8c6a240000                   jl         0x7f5bb43f1fe9
01eff 4863d2                         movsxd     rdx, edx
01f02 4d63c0                         movsxd     r8, r8d
01f05 488d7c160c                     lea        rdi, [rsi + rdx + 0xc]
01f0a 4a8d74010c                     lea        rsi, [rcx + r8 + 0xc]
01f0f 498bd1                         mov        rdx, r9
01f12 40f6c40f                       test       spl, 0xf
01f16 0f8412000000                   je         0x7f5bb43efbae
01f1c 4883ec08                       sub        rsp, 8
01f20 e87ba35007                     call       0x7f5bbb8f9f20
01f25 4883c408                       add        rsp, 8
01f29 e905000000                     jmp        0x7f5bb43efbb3
01f2e e86da35007                     call       0x7f5bbb8f9f20
01f33 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
01f3d ff8270060000                   inc        dword ptr [rdx + 0x670]
01f43 e9ea010000                     jmp        0x7f5bb43efdb2
01f48 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
01f4f 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
01f56 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
01f5d 899c24e0010000                 mov        dword ptr [rsp + 0x1e0], ebx
01f64 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
01f6b 0f1f440000                     nop        dword ptr [rax + rax]
01f70 898424d8010000                 mov        dword ptr [rsp + 0x1d8], eax
01f77 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
01f7f 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
01f89 4883828806000001               add        qword ptr [rdx + 0x688], 1
01f91 48ba887e71ac5b7f0000           movabs     rdx, 0x7f5bac717e88
01f9b 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
01f9e 83c102                         add        ecx, 2
01fa1 894a70                         mov        dword ptr [rdx + 0x70], ecx
01fa4 81e1feff1f00                   and        ecx, 0x1ffffe
01faa 85c9                           test       ecx, ecx
01fac 0f84c7230000                   je         0x7f5bb43f1ff9
01fb2 660f1f440000                   nop        word ptr [rax + rax]
01fb8 e9ec230000                     jmp        0x7f5bb43f2029
01fbd 90                             nop        
01fbe 90                             nop        
01fbf 90                             nop        
01fc0 90                             nop        
01fc1 90                             nop        
01fc2 48ba887e71ac5b7f0000           movabs     rdx, 0x7f5bac717e88
01fcc 488d92d8000000                 lea        rdx, [rdx + 0xd8]
01fd3 4885c0                         test       rax, rax
01fd6 750c                           jne        0x7f5bb43efc64
01fd8 f6420801                       test       byte ptr [rdx + 8], 1
01fdc 7506                           jne        0x7f5bb43efc64
01fde f048834a0801                   lock or    qword ptr [rdx + 8], 1
01fe4 48be900773e200000000           movabs     rsi, 0xe2730790
01fee 488bd6                         mov        rdx, rsi
01ff1 48b9887e71ac5b7f0000           movabs     rcx, 0x7f5bac717e88
01ffb 488b12                         mov        rdx, qword ptr [rdx]
01ffe 48c1ea2a                       shr        rdx, 0x2a
02002 48c1e209                       shl        rdx, 9
02006 41ba0000006a                   mov        r10d, 0x6a000000
0200c 4903d2                         add        rdx, r10
0200f 41ba16000000                   mov        r10d, 0x16
02015 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02019 7435                           je         0x7f5bb43efcd0
0201b 4983c202                       add        r10, 2
0201f 4983fa1a                       cmp        r10, 0x1a
02023 75f0                           jne        0x7f5bb43efc95
02025 41ba16000000                   mov        r10d, 0x16
0202b 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02030 7412                           je         0x7f5bb43efcc4
02032 4983c202                       add        r10, 2
02036 4983fa1a                       cmp        r10, 0x1a
0203a 75ef                           jne        0x7f5bb43efcab
0203c 41ba15000000                   mov        r10d, 0x15
02042 eb10                           jmp        0x7f5bb43efcd4
02044 50                             push       rax
02045 4833c0                         xor        rax, rax
02048 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
0204d 58                             pop        rax
0204e ebbf                           jmp        0x7f5bb43efc8f
02050 4983c201                       add        r10, 1
02054 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02059 488bd0                         mov        rdx, rax
0205c 488bcf                         mov        rcx, rdi
0205f 89bc24dc010000                 mov        dword ptr [rsp + 0x1dc], edi
02066 90                             nop        
02067 e874015207                     call       0x7f5bbb90fe60
0206c 0f1f84006421000b               nop        dword ptr [rax + rax + 0xb002164]
02074 48be004072ac5b7f0000           movabs     rsi, 0x7f5bac724000
0207e 4883869806000001               add        qword ptr [rsi + 0x698], 1
02086 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
0208e 8b9424d8010000                 mov        edx, dword ptr [rsp + 0x1d8]
02095 488bc8                         mov        rcx, rax
02098 0f1f8000000000                 nop        dword ptr [rax]
0209f e83c0b5207                     call       0x7f5bbb910860
020a4 0f1f84009c21000c               nop        dword ptr [rax + rax + 0xc00219c]
020ac 8b8424d8010000                 mov        eax, dword ptr [rsp + 0x1d8]
020b3 83c008                         add        eax, 8
020b6 8bbc24dc010000                 mov        edi, dword ptr [rsp + 0x1dc]
020bd 83c708                         add        edi, 8
020c0 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
020c7 be02000000                     mov        esi, 2
020cc 7c05                           jl         0x7f5bb43efd53
020ce be00000000                     mov        esi, 0
020d3 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
020dd 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
020e0 03ce                           add        ecx, esi
020e2 894a74                         mov        dword ptr [rdx + 0x74], ecx
020e5 85f6                           test       esi, esi
020e7 7505                           jne        0x7f5bb43efd6e
020e9 b902000000                     mov        ecx, 2
020ee 81e1fe3f0000                   and        ecx, 0x3ffe
020f4 85c9                           test       ecx, ecx
020f6 0f84b7220000                   je         0x7f5bb43f2033
020fc 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02100 418502                         test       dword ptr [r10], eax
02103 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
0210a 48be004072ac5b7f0000           movabs     rsi, 0x7f5bac724000
02114 baa8060000                     mov        edx, 0x6a8
02119 7c05                           jl         0x7f5bb43efda0
0211b bab8060000                     mov        edx, 0x6b8
02120 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
02124 488d4901                       lea        rcx, [rcx + 1]
02128 48890c16                       mov        qword ptr [rsi + rdx], rcx
0212c 0f8c3efeffff                   jl         0x7f5bb43efbf0
02132 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
02139 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
02140 48be004072ac5b7f0000           movabs     rsi, 0x7f5bac724000
0214a ff86c8060000                   inc        dword ptr [rsi + 0x6c8]
02150 e9a1170000                     jmp        0x7f5bb43f1576
02155 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
0215c 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
02163 4183f910                       cmp        r9d, 0x10
02167 48be004072ac5b7f0000           movabs     rsi, 0x7f5bac724000
02171 bae0060000                     mov        edx, 0x6e0
02176 7c05                           jl         0x7f5bb43efdfd
02178 baf0060000                     mov        edx, 0x6f0
0217d 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
02181 488d4901                       lea        rcx, [rcx + 1]
02185 48890c16                       mov        qword ptr [rsi + rdx], rcx
02189 0f8cdd0a0000                   jl         0x7f5bb43f08ec
0218f 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
02196 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
0219d 899c24f0010000                 mov        dword ptr [rsp + 0x1f0], ebx
021a4 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
021ab 0f1f440000                     nop        dword ptr [rax + rax]
021b0 898424ec010000                 mov        dword ptr [rsp + 0x1ec], eax
021b7 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
021bf 48be004072ac5b7f0000           movabs     rsi, 0x7f5bac724000
021c9 4883860007000001               add        qword ptr [rsi + 0x700], 1
021d1 48bea01a79ac5b7f0000           movabs     rsi, 0x7f5bac791aa0
021db 8b5670                         mov        edx, dword ptr [rsi + 0x70]
021de 83c202                         add        edx, 2
021e1 895670                         mov        dword ptr [rsi + 0x70], edx
021e4 81e2feff1f00                   and        edx, 0x1ffffe
021ea 85d2                           test       edx, edx
021ec 0f84e2210000                   je         0x7f5bb43f2054
021f2 48be708d78e200000000           movabs     rsi, 0xe2788d70
021fc 48baa01a79ac5b7f0000           movabs     rdx, 0x7f5bac791aa0
02206 488b36                         mov        rsi, qword ptr [rsi]
02209 48c1ee2a                       shr        rsi, 0x2a
0220d 48c1e609                       shl        rsi, 9
02211 41ba0000006a                   mov        r10d, 0x6a000000
02217 4903f2                         add        rsi, r10
0221a 41ba16000000                   mov        r10d, 0x16
02220 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02224 7435                           je         0x7f5bb43efedb
02226 4983c202                       add        r10, 2
0222a 4983fa1a                       cmp        r10, 0x1a
0222e 75f0                           jne        0x7f5bb43efea0
02230 41ba16000000                   mov        r10d, 0x16
02236 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
0223b 7412                           je         0x7f5bb43efecf
0223d 4983c202                       add        r10, 2
02241 4983fa1a                       cmp        r10, 0x1a
02245 75ef                           jne        0x7f5bb43efeb6
02247 41ba15000000                   mov        r10d, 0x15
0224d eb10                           jmp        0x7f5bb43efedf
0224f 50                             push       rax
02250 4833c0                         xor        rax, rax
02253 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
02258 58                             pop        rax
02259 ebbf                           jmp        0x7f5bb43efe9a
0225b 4983c201                       add        r10, 1
0225f 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02264 448b6808                       mov        r13d, dword ptr [rax + 8]
02268 48bea01a79ac5b7f0000           movabs     rsi, 0x7f5bac791aa0
02272 488386d800000001               add        qword ptr [rsi + 0xd8], 1
0227a 48bef81079ac5b7f0000           movabs     rsi, 0x7f5bac7910f8
02284 8b5670                         mov        edx, dword ptr [rsi + 0x70]
02287 83c202                         add        edx, 2
0228a 895670                         mov        dword ptr [rsi + 0x70], edx
0228d 81e2feff1f00                   and        edx, 0x1ffffe
02293 85d2                           test       edx, edx
02295 0f845f210000                   je         0x7f5bb43f207a
0229b 48bef81079ac5b7f0000           movabs     rsi, 0x7f5bac7910f8
022a5 4883860801000001               add        qword ptr [rsi + 0x108], 1
022ad 498bf5                         mov        rsi, r13
022b0 83ee0f                         sub        esi, 0xf
022b3 48bac80779ac5b7f0000           movabs     rdx, 0x7f5bac7907c8
022bd 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
022c0 83c102                         add        ecx, 2
022c3 894a70                         mov        dword ptr [rdx + 0x70], ecx
022c6 81e1feff1f00                   and        ecx, 0x1ffffe
022cc 85c9                           test       ecx, ecx
022ce 0f8447210000                   je         0x7f5bb43f209b
022d4 48bac80779ac5b7f0000           movabs     rdx, 0x7f5bac7907c8
022de 488382a800000001               add        qword ptr [rdx + 0xa8], 1
022e6 48ba0000000000000000           movabs     rdx, 0
022f0 ba00000000                     mov        edx, 0
022f5 3bfa                           cmp        edi, edx
022f7 0f8c3f210000                   jl         0x7f5bb43f20bc
022fd 3bfe                           cmp        edi, esi
022ff 0f8d44210000                   jge        0x7f5bb43f20c9
02305 488bf7                         mov        rsi, rdi
02308 48ba708d78e200000000           movabs     rdx, 0xe2788d70
02312 488bca                         mov        rcx, rdx
02315 49b8a01a79ac5b7f0000           movabs     r8, 0x7f5bac791aa0
0231f 488b09                         mov        rcx, qword ptr [rcx]
02322 48c1e92a                       shr        rcx, 0x2a
02326 48c1e109                       shl        rcx, 9
0232a 41ba0000006a                   mov        r10d, 0x6a000000
02330 4903ca                         add        rcx, r10
02333 41ba24000000                   mov        r10d, 0x24
02339 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0233d 7435                           je         0x7f5bb43efff4
0233f 4983c202                       add        r10, 2
02343 4983fa28                       cmp        r10, 0x28
02347 75f0                           jne        0x7f5bb43effb9
02349 41ba24000000                   mov        r10d, 0x24
0234f 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
02354 7412                           je         0x7f5bb43effe8
02356 4983c202                       add        r10, 2
0235a 4983fa28                       cmp        r10, 0x28
0235e 75ef                           jne        0x7f5bb43effcf
02360 41ba23000000                   mov        r10d, 0x23
02366 eb10                           jmp        0x7f5bb43efff8
02368 50                             push       rax
02369 4833c0                         xor        rax, rax
0236c 4b0fb10cd0                     cmpxchg    qword ptr [r8 + r10*8], rcx
02371 58                             pop        rax
02372 ebbf                           jmp        0x7f5bb43effb3
02374 4983c201                       add        r10, 1
02378 4b8304d001                     add        qword ptr [r8 + r10*8], 1
0237d 48b9c80879ac5b7f0000           movabs     rcx, 0x7f5bac7908c8
02387 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
0238b 4183c002                       add        r8d, 2
0238f 44894170                       mov        dword ptr [rcx + 0x70], r8d
02393 4181e0feff1f00                 and        r8d, 0x1ffffe
0239a 4585c0                         test       r8d, r8d
0239d 0f84b3200000                   je         0x7f5bb43f20d6
023a3 48b9c80879ac5b7f0000           movabs     rcx, 0x7f5bac7908c8
023ad 488381a800000001               add        qword ptr [rcx + 0xa8], 1
023b5 48baf00979ac5b7f0000           movabs     rdx, 0x7f5bac7909f0
023bf 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
023c2 83c102                         add        ecx, 2
023c5 894a70                         mov        dword ptr [rdx + 0x70], ecx
023c8 81e1feff1f00                   and        ecx, 0x1ffffe
023ce 85c9                           test       ecx, ecx
023d0 0f84a1200000                   je         0x7f5bb43f20f7
023d6 48baf00979ac5b7f0000           movabs     rdx, 0x7f5bac7909f0
023e0 ff82b8000000                   inc        dword ptr [rdx + 0xb8]
023e6 4489ac24e8010000               mov        dword ptr [rsp + 0x1e8], r13d
023ee 89bc24e4010000                 mov        dword ptr [rsp + 0x1e4], edi
023f5 48ba585e7ae200000000           movabs     rdx, 0xe27a5e58
023ff 488bca                         mov        rcx, rdx
02402 49b8a01a79ac5b7f0000           movabs     r8, 0x7f5bac791aa0
0240c 4983805801000001               add        qword ptr [r8 + 0x158], 1
02414 48b9681c79ac5b7f0000           movabs     rcx, 0x7f5bac791c68
0241e 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
02422 4183c002                       add        r8d, 2
02426 44894170                       mov        dword ptr [rcx + 0x70], r8d
0242a 4181e0feff1f00                 and        r8d, 0x1ffffe
02431 4585c0                         test       r8d, r8d
02434 0f845e200000                   je         0x7f5bb43f2118
0243a 488bca                         mov        rcx, rdx
0243d 49b8681c79ac5b7f0000           movabs     r8, 0x7f5bac791c68
02447 498380a800000001               add        qword ptr [r8 + 0xa8], 1
0244f 48b9481d79ac5b7f0000           movabs     rcx, 0x7f5bac791d48
02459 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
0245d 4183c002                       add        r8d, 2
02461 44894170                       mov        dword ptr [rcx + 0x70], r8d
02465 4181e0feff1f00                 and        r8d, 0x1ffffe
0246c 4585c0                         test       r8d, r8d
0246f 0f8444200000                   je         0x7f5bb43f2139
02475 48b9481d79ac5b7f0000           movabs     rcx, 0x7f5bac791d48
0247f 488381b800000001               add        qword ptr [rcx + 0xb8], 1
02487 48ba701279ac5b7f0000           movabs     rdx, 0x7f5bac791270
02491 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02494 83c102                         add        ecx, 2
02497 894a70                         mov        dword ptr [rdx + 0x70], ecx
0249a 81e1feff1f00                   and        ecx, 0x1ffffe
024a0 85c9                           test       ecx, ecx
024a2 0f8432200000                   je         0x7f5bb43f215a
024a8 48ba708d78e200000000           movabs     rdx, 0xe2788d70
024b2 488bca                         mov        rcx, rdx
024b5 49b8481d79ac5b7f0000           movabs     r8, 0x7f5bac791d48
024bf 488b09                         mov        rcx, qword ptr [rcx]
024c2 48c1e92a                       shr        rcx, 0x2a
024c6 48c1e109                       shl        rcx, 9
024ca 41ba0000006a                   mov        r10d, 0x6a000000
024d0 4903ca                         add        rcx, r10
024d3 41ba1c000000                   mov        r10d, 0x1c
024d9 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
024dd 7435                           je         0x7f5bb43f0194
024df 4983c202                       add        r10, 2
024e3 4983fa20                       cmp        r10, 0x20
024e7 75f0                           jne        0x7f5bb43f0159
024e9 41ba1c000000                   mov        r10d, 0x1c
024ef 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
024f4 7412                           je         0x7f5bb43f0188
024f6 4983c202                       add        r10, 2
024fa 4983fa20                       cmp        r10, 0x20
024fe 75ef                           jne        0x7f5bb43f016f
02500 41ba1b000000                   mov        r10d, 0x1b
02506 eb10                           jmp        0x7f5bb43f0198
02508 50                             push       rax
02509 4833c0                         xor        rax, rax
0250c 4b0fb10cd0                     cmpxchg    qword ptr [r8 + r10*8], rcx
02511 58                             pop        rax
02512 ebbf                           jmp        0x7f5bb43f0153
02514 4983c201                       add        r10, 1
02518 4b8304d001                     add        qword ptr [r8 + r10*8], 1
0251d 48b9481d79ac5b7f0000           movabs     rcx, 0x7f5bac791d48
02527 488b12                         mov        rdx, qword ptr [rdx]
0252a 48c1ea2a                       shr        rdx, 0x2a
0252e 48c1e209                       shl        rdx, 9
02532 41ba0000006a                   mov        r10d, 0x6a000000
02538 4903d2                         add        rdx, r10
0253b 41ba22000000                   mov        r10d, 0x22
02541 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02545 7435                           je         0x7f5bb43f01fc
02547 4983c202                       add        r10, 2
0254b 4983fa26                       cmp        r10, 0x26
0254f 75f0                           jne        0x7f5bb43f01c1
02551 41ba22000000                   mov        r10d, 0x22
02557 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0255c 7412                           je         0x7f5bb43f01f0
0255e 4983c202                       add        r10, 2
02562 4983fa26                       cmp        r10, 0x26
02566 75ef                           jne        0x7f5bb43f01d7
02568 41ba21000000                   mov        r10d, 0x21
0256e eb10                           jmp        0x7f5bb43f0200
02570 50                             push       rax
02571 4833c0                         xor        rax, rax
02574 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
02579 58                             pop        rax
0257a ebbf                           jmp        0x7f5bb43f01bb
0257c 4983c201                       add        r10, 1
02580 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02585 48ba481d79ac5b7f0000           movabs     rdx, 0x7f5bac791d48
0258f 4883823801000001               add        qword ptr [rdx + 0x138], 1
02597 48ba301379ac5b7f0000           movabs     rdx, 0x7f5bac791330
025a1 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
025a4 83c102                         add        ecx, 2
025a7 894a70                         mov        dword ptr [rdx + 0x70], ecx
025aa 81e1feff1f00                   and        ecx, 0x1ffffe
025b0 85c9                           test       ecx, ecx
025b2 0f84431f0000                   je         0x7f5bb43f217b
025b8 48ba481d79ac5b7f0000           movabs     rdx, 0x7f5bac791d48
025c2 4883824801000001               add        qword ptr [rdx + 0x148], 1
025ca 4c63f6                         movsxd     r14, esi
025cd be0c000000                     mov        esi, 0xc
025d2 4d8bce                         mov        r9, r14
025d5 4c03ce                         add        r9, rsi
025d8 48be180579ac5b7f0000           movabs     rsi, 0x7f5bac790518
025e2 8b5670                         mov        edx, dword ptr [rsi + 0x70]
025e5 83c202                         add        edx, 2
025e8 895670                         mov        dword ptr [rsi + 0x70], edx
025eb 81e2feff1f00                   and        edx, 0x1ffffe
025f1 85d2                           test       edx, edx
025f3 0f84231f0000                   je         0x7f5bb43f219c
025f9 48be180579ac5b7f0000           movabs     rsi, 0x7f5bac790518
02603 488386d800000001               add        qword ptr [rsi + 0xd8], 1
0260b 48be900679ac5b7f0000           movabs     rsi, 0x7f5bac790690
02615 8b5670                         mov        edx, dword ptr [rsi + 0x70]
02618 83c202                         add        edx, 2
0261b 895670                         mov        dword ptr [rsi + 0x70], edx
0261e 81e2feff1f00                   and        edx, 0x1ffffe
02624 85d2                           test       edx, edx
02626 0f84111f0000                   je         0x7f5bb43f21bd
0262c 48be481d79ac5b7f0000           movabs     rsi, 0x7f5bac791d48
02636 4883866801000001               add        qword ptr [rsi + 0x168], 1
0263e 48be28597be200000000           movabs     rsi, 0xe27b5928
02648 48beb88d78e200000000           movabs     rsi, 0xe2788db8
02652 ba02000000                     mov        edx, 2
02657 b910000000                     mov        ecx, 0x10
0265c 4c8bc0                         mov        r8, rax
0265f bf00000000                     mov        edi, 0
02664 48890424                       mov        qword ptr [rsp], rax
02668 4c89742408                     mov        qword ptr [rsp + 8], r14
0266d 49ba708d78e200000000           movabs     r10, 0xe2788d70
02677 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0267c 49ba28597be200000000           movabs     r10, 0xe27b5928
02686 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0268b 0f1f4000                       nop        dword ptr [rax]
0268f e84c055207                     call       0x7f5bbb910860
02694 0f1f84008c27000e               nop        dword ptr [rax + rax + 0xe00278c]
0269c 4885c0                         test       rax, rax
0269f 48bb481d79ac5b7f0000           movabs     rbx, 0x7f5bac791d48
026a9 750c                           jne        0x7f5bb43f0337
026ab 808b7101000001                 or         byte ptr [rbx + 0x171], 1
026b2 e98b000000                     jmp        0x7f5bb43f03c2
026b7 488b38                         mov        rdi, qword ptr [rax]
026ba 48c1ef2a                       shr        rdi, 0x2a
026be 48c1e709                       shl        rdi, 9
026c2 41ba0000006a                   mov        r10d, 0x6a000000
026c8 4903fa                         add        rdi, r10
026cb 41ba30000000                   mov        r10d, 0x30
026d1 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
026d5 7435                           je         0x7f5bb43f038c
026d7 4983c202                       add        r10, 2
026db 4983fa34                       cmp        r10, 0x34
026df 75f0                           jne        0x7f5bb43f0351
026e1 41ba30000000                   mov        r10d, 0x30
026e7 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
026ec 7412                           je         0x7f5bb43f0380
026ee 4983c202                       add        r10, 2
026f2 4983fa34                       cmp        r10, 0x34
026f6 75ef                           jne        0x7f5bb43f0367
026f8 41ba2f000000                   mov        r10d, 0x2f
026fe eb10                           jmp        0x7f5bb43f0390
02700 50                             push       rax
02701 4833c0                         xor        rax, rax
02704 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
02709 58                             pop        rax
0270a ebbf                           jmp        0x7f5bb43f034b
0270c 4983c201                       add        r10, 1
02710 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02715 48bf0006146a00000000           movabs     rdi, 0x6a140600
0271f 488b18                         mov        rbx, qword ptr [rax]
02722 48c1eb2a                       shr        rbx, 0x2a
02726 48c1e309                       shl        rbx, 9
0272a 41ba0000006a                   mov        r10d, 0x6a000000
02730 4903da                         add        rbx, r10
02733 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
02737 0f85211e0000                   jne        0x7f5bb43f21de
0273d e900000000                     jmp        0x7f5bb43f03c2
02742 488bf8                         mov        rdi, rax
02745 4889bc24f8010000               mov        qword ptr [rsp + 0x1f8], rdi
0274d 483b07                         cmp        rax, qword ptr [rdi]
02750 488bf7                         mov        rsi, rdi
02753 48bb004072ac5b7f0000           movabs     rbx, 0x7f5bac724000
0275d 488b36                         mov        rsi, qword ptr [rsi]
02760 48c1ee2a                       shr        rsi, 0x2a
02764 48c1e609                       shl        rsi, 9
02768 41ba0000006a                   mov        r10d, 0x6a000000
0276e 4903f2                         add        rsi, r10
02771 41bae3000000                   mov        r10d, 0xe3
02777 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
0277b 743b                           je         0x7f5bb43f0438
0277d 4983c202                       add        r10, 2
02781 4981fae7000000                 cmp        r10, 0xe7
02788 75ed                           jne        0x7f5bb43f03f7
0278a 41bae3000000                   mov        r10d, 0xe3
02790 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02795 7415                           je         0x7f5bb43f042c
02797 4983c202                       add        r10, 2
0279b 4981fae7000000                 cmp        r10, 0xe7
027a2 75ec                           jne        0x7f5bb43f0410
027a4 41bae2000000                   mov        r10d, 0xe2
027aa eb10                           jmp        0x7f5bb43f043c
027ac 50                             push       rax
027ad 4833c0                         xor        rax, rax
027b0 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
027b5 58                             pop        rax
027b6 ebb9                           jmp        0x7f5bb43f03f1
027b8 4983c201                       add        r10, 1
027bc 4a8304d301                     add        qword ptr [rbx + r10*8], 1
027c1 48be602779ac5b7f0000           movabs     rsi, 0x7f5bac792760
027cb 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
027ce 83c302                         add        ebx, 2
027d1 895e70                         mov        dword ptr [rsi + 0x70], ebx
027d4 81e3feff1f00                   and        ebx, 0x1ffffe
027da 85db                           test       ebx, ebx
027dc 0f848a1d0000                   je         0x7f5bb43f21ec
027e2 488bf7                         mov        rsi, rdi
027e5 48bb602779ac5b7f0000           movabs     rbx, 0x7f5bac792760
027ef 488b36                         mov        rsi, qword ptr [rsi]
027f2 48c1ee2a                       shr        rsi, 0x2a
027f6 48c1e609                       shl        rsi, 9
027fa 41ba0000006a                   mov        r10d, 0x6a000000
02800 4903f2                         add        rsi, r10
02803 41ba16000000                   mov        r10d, 0x16
02809 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
0280d 7435                           je         0x7f5bb43f04c4
0280f 4983c202                       add        r10, 2
02813 4983fa1a                       cmp        r10, 0x1a
02817 75f0                           jne        0x7f5bb43f0489
02819 41ba16000000                   mov        r10d, 0x16
0281f 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02824 7412                           je         0x7f5bb43f04b8
02826 4983c202                       add        r10, 2
0282a 4983fa1a                       cmp        r10, 0x1a
0282e 75ef                           jne        0x7f5bb43f049f
02830 41ba15000000                   mov        r10d, 0x15
02836 eb10                           jmp        0x7f5bb43f04c8
02838 50                             push       rax
02839 4833c0                         xor        rax, rax
0283c 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
02841 58                             pop        rax
02842 ebbf                           jmp        0x7f5bb43f0483
02844 4983c201                       add        r10, 1
02848 4a8304d301                     add        qword ptr [rbx + r10*8], 1
0284d 488bf7                         mov        rsi, rdi
02850 0f1f440000                     nop        dword ptr [rax + rax]
02855 48b850183b905b7f0000           movabs     rax, 0x7f5b903b1850
0285f e87cfe5107                     call       0x7f5bbb910360
02864 0f1f84005c29000f               nop        dword ptr [rax + rax + 0xf00295c]
0286c 48be602779ac5b7f0000           movabs     rsi, 0x7f5bac792760
02876 488386d800000001               add        qword ptr [rsi + 0xd8], 1
0287e 48bef81079ac5b7f0000           movabs     rsi, 0x7f5bac7910f8
02888 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
0288b 83c702                         add        edi, 2
0288e 897e70                         mov        dword ptr [rsi + 0x70], edi
02891 81e7feff1f00                   and        edi, 0x1ffffe
02897 85ff                           test       edi, edi
02899 0f84ee1c0000                   je         0x7f5bb43f220d
0289f 448bac24e8010000               mov        r13d, dword ptr [rsp + 0x1e8]
028a7 8bbc24ec010000                 mov        edi, dword ptr [rsp + 0x1ec]
028ae 48bef81079ac5b7f0000           movabs     rsi, 0x7f5bac7910f8
028b8 4883860801000001               add        qword ptr [rsi + 0x108], 1
028c0 ffc8                           dec        eax
028c2 442be8                         sub        r13d, eax
028c5 48bec80779ac5b7f0000           movabs     rsi, 0x7f5bac7907c8
028cf 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
028d2 83c302                         add        ebx, 2
028d5 895e70                         mov        dword ptr [rsi + 0x70], ebx
028d8 81e3feff1f00                   and        ebx, 0x1ffffe
028de 85db                           test       ebx, ebx
028e0 0f84c81c0000                   je         0x7f5bb43f222e
028e6 48bec80779ac5b7f0000           movabs     rsi, 0x7f5bac7907c8
028f0 488386a800000001               add        qword ptr [rsi + 0xa8], 1
028f8 48be0000000000000000           movabs     rsi, 0
02902 be00000000                     mov        esi, 0
02907 3bfe                           cmp        edi, esi
02909 0f8cc01c0000                   jl         0x7f5bb43f224f
0290f 413bfd                         cmp        edi, r13d
02912 0f8dc41c0000                   jge        0x7f5bb43f225c
02918 488bc7                         mov        rax, rdi
0291b 898424f4010000                 mov        dword ptr [rsp + 0x1f4], eax
02922 89bc24ec010000                 mov        dword ptr [rsp + 0x1ec], edi
02929 488bbc24f8010000               mov        rdi, qword ptr [rsp + 0x1f8]
02931 488bf7                         mov        rsi, rdi
02934 48b9602779ac5b7f0000           movabs     rcx, 0x7f5bac792760
0293e 488b36                         mov        rsi, qword ptr [rsi]
02941 48c1ee2a                       shr        rsi, 0x2a
02945 48c1e609                       shl        rsi, 9
02949 41ba0000006a                   mov        r10d, 0x6a000000
0294f 4903f2                         add        rsi, r10
02952 41ba1e000000                   mov        r10d, 0x1e
02958 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
0295c 7435                           je         0x7f5bb43f0613
0295e 4983c202                       add        r10, 2
02962 4983fa22                       cmp        r10, 0x22
02966 75f0                           jne        0x7f5bb43f05d8
02968 41ba1e000000                   mov        r10d, 0x1e
0296e 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02973 7412                           je         0x7f5bb43f0607
02975 4983c202                       add        r10, 2
02979 4983fa22                       cmp        r10, 0x22
0297d 75ef                           jne        0x7f5bb43f05ee
0297f 41ba1d000000                   mov        r10d, 0x1d
02985 eb10                           jmp        0x7f5bb43f0617
02987 50                             push       rax
02988 4833c0                         xor        rax, rax
0298b 4a0fb134d1                     cmpxchg    qword ptr [rcx + r10*8], rsi
02990 58                             pop        rax
02991 ebbf                           jmp        0x7f5bb43f05d2
02993 4983c201                       add        r10, 1
02997 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0299c 488bf7                         mov        rsi, rdi
0299f 660f1f440000                   nop        word ptr [rax + rax]
029a5 48b878183b905b7f0000           movabs     rax, 0x7f5b903b1878
029af e82cfd5107                     call       0x7f5bbb910360
029b4 0f1f8400ac2a0010               nop        dword ptr [rax + rax + 0x10002aac]
029bc 483b00                         cmp        rax, qword ptr [rax]
029bf 488bf0                         mov        rsi, rax
029c2 48ba602779ac5b7f0000           movabs     rdx, 0x7f5bac792760
029cc 488b36                         mov        rsi, qword ptr [rsi]
029cf 48c1ee2a                       shr        rsi, 0x2a
029d3 48c1e609                       shl        rsi, 9
029d7 41ba0000006a                   mov        r10d, 0x6a000000
029dd 4903f2                         add        rsi, r10
029e0 41ba24000000                   mov        r10d, 0x24
029e6 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
029ea 7435                           je         0x7f5bb43f06a1
029ec 4983c202                       add        r10, 2
029f0 4983fa28                       cmp        r10, 0x28
029f4 75f0                           jne        0x7f5bb43f0666
029f6 41ba24000000                   mov        r10d, 0x24
029fc 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02a01 7412                           je         0x7f5bb43f0695
02a03 4983c202                       add        r10, 2
02a07 4983fa28                       cmp        r10, 0x28
02a0b 75ef                           jne        0x7f5bb43f067c
02a0d 41ba23000000                   mov        r10d, 0x23
02a13 eb10                           jmp        0x7f5bb43f06a5
02a15 50                             push       rax
02a16 4833c0                         xor        rax, rax
02a19 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
02a1e 58                             pop        rax
02a1f ebbf                           jmp        0x7f5bb43f0660
02a21 4983c201                       add        r10, 1
02a25 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02a2a 8b7028                         mov        esi, dword ptr [rax + 0x28]
02a2d 488bd0                         mov        rdx, rax
02a30 48b9602779ac5b7f0000           movabs     rcx, 0x7f5bac792760
02a3a 488b12                         mov        rdx, qword ptr [rdx]
02a3d 48c1ea2a                       shr        rdx, 0x2a
02a41 48c1e209                       shl        rdx, 9
02a45 41ba0000006a                   mov        r10d, 0x6a000000
02a4b 4903d2                         add        rdx, r10
02a4e 41ba2a000000                   mov        r10d, 0x2a
02a54 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02a58 7435                           je         0x7f5bb43f070f
02a5a 4983c202                       add        r10, 2
02a5e 4983fa2e                       cmp        r10, 0x2e
02a62 75f0                           jne        0x7f5bb43f06d4
02a64 41ba2a000000                   mov        r10d, 0x2a
02a6a 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02a6f 7412                           je         0x7f5bb43f0703
02a71 4983c202                       add        r10, 2
02a75 4983fa2e                       cmp        r10, 0x2e
02a79 75ef                           jne        0x7f5bb43f06ea
02a7b 41ba29000000                   mov        r10d, 0x29
02a81 eb10                           jmp        0x7f5bb43f0713
02a83 50                             push       rax
02a84 4833c0                         xor        rax, rax
02a87 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
02a8c 58                             pop        rax
02a8d ebbf                           jmp        0x7f5bb43f06ce
02a8f 4983c201                       add        r10, 1
02a93 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02a98 8b4808                         mov        ecx, dword ptr [rax + 8]
02a9b 48ba602779ac5b7f0000           movabs     rdx, 0x7f5bac792760
02aa5 4883827801000001               add        qword ptr [rdx + 0x178], 1
02aad 48ba301379ac5b7f0000           movabs     rdx, 0x7f5bac791330
02ab7 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02abb 4183c002                       add        r8d, 2
02abf 44894270                       mov        dword ptr [rdx + 0x70], r8d
02ac3 4181e0feff1f00                 and        r8d, 0x1ffffe
02aca 4585c0                         test       r8d, r8d
02acd 0f841b1b0000                   je         0x7f5bb43f226e
02ad3 48ba602779ac5b7f0000           movabs     rdx, 0x7f5bac792760
02add 4883828801000001               add        qword ptr [rdx + 0x188], 1
02ae5 8b8424f4010000                 mov        eax, dword ptr [rsp + 0x1f4]
02aec 4863c0                         movsxd     rax, eax
02aef ba0c000000                     mov        edx, 0xc
02af4 4c8bc8                         mov        r9, rax
02af7 4c03ca                         add        r9, rdx
02afa 48ba180579ac5b7f0000           movabs     rdx, 0x7f5bac790518
02b04 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02b08 4183c002                       add        r8d, 2
02b0c 44894270                       mov        dword ptr [rdx + 0x70], r8d
02b10 4181e0feff1f00                 and        r8d, 0x1ffffe
02b17 4585c0                         test       r8d, r8d
02b1a 0f84ef1a0000                   je         0x7f5bb43f228f
02b20 48ba180579ac5b7f0000           movabs     rdx, 0x7f5bac790518
02b2a 488382d800000001               add        qword ptr [rdx + 0xd8], 1
02b32 48ba900679ac5b7f0000           movabs     rdx, 0x7f5bac790690
02b3c 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02b40 4183c002                       add        r8d, 2
02b44 44894270                       mov        dword ptr [rdx + 0x70], r8d
02b48 4181e0feff1f00                 and        r8d, 0x1ffffe
02b4f 4585c0                         test       r8d, r8d
02b52 0f84d81a0000                   je         0x7f5bb43f22b0
02b58 48ba602779ac5b7f0000           movabs     rdx, 0x7f5bac792760
02b62 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
02b6a 48bad0397de200000000           movabs     rdx, 0xe27d39d0
02b74 ba02000000                     mov        edx, 2
02b79 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
02b81 bf00000000                     mov        edi, 0
02b86 488b9c24f8010000               mov        rbx, qword ptr [rsp + 0x1f8]
02b8e 48891c24                       mov        qword ptr [rsp], rbx
02b92 488b9c2438010000               mov        rbx, qword ptr [rsp + 0x138]
02b9a 48895c2408                     mov        qword ptr [rsp + 8], rbx
02b9f 4889442410                     mov        qword ptr [rsp + 0x10], rax
02ba4 49bad0397de200000000           movabs     r10, 0xe27d39d0
02bae 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02bb3 0f1f4000                       nop        dword ptr [rax]
02bb7 e824005207                     call       0x7f5bbb910860
02bbc 0f1f8400b42c0011               nop        dword ptr [rax + rax + 0x11002cb4]
02bc4 8b8424ec010000                 mov        eax, dword ptr [rsp + 0x1ec]
02bcb 83c010                         add        eax, 0x10
02bce 8bbc24e4010000                 mov        edi, dword ptr [rsp + 0x1e4]
02bd5 83c710                         add        edi, 0x10
02bd8 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02bdf ba02000000                     mov        edx, 2
02be4 7c05                           jl         0x7f5bb43f086b
02be6 ba00000000                     mov        edx, 0
02beb 48b9004072ac5b7f0000           movabs     rcx, 0x7f5bac724000
02bf5 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
02bf9 4403c2                         add        r8d, edx
02bfc 44894174                       mov        dword ptr [rcx + 0x74], r8d
02c00 85d2                           test       edx, edx
02c02 7506                           jne        0x7f5bb43f088a
02c04 41b802000000                   mov        r8d, 2
02c0a 4181e0fe3f0000                 and        r8d, 0x3ffe
02c11 4585c0                         test       r8d, r8d
02c14 0f84371a0000                   je         0x7f5bb43f22d1
02c1a 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02c1e 418502                         test       dword ptr [r10], eax
02c21 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02c28 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
02c32 b940070000                     mov        ecx, 0x740
02c37 7c05                           jl         0x7f5bb43f08be
02c39 b950070000                     mov        ecx, 0x750
02c3e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
02c42 4d8d4001                       lea        r8, [r8 + 1]
02c46 4c89040a                       mov        qword ptr [rdx + rcx], r8
02c4a 0f8c60f5ffff                   jl         0x7f5bb43efe30
02c50 8b9c24f0010000                 mov        ebx, dword ptr [rsp + 0x1f0]
02c57 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
02c61 ff8260070000                   inc        dword ptr [rdx + 0x760]
02c67 e98a0c0000                     jmp        0x7f5bb43f1576
02c6c 4183f908                       cmp        r9d, 8
02c70 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
02c7a b978070000                     mov        ecx, 0x778
02c7f 7c05                           jl         0x7f5bb43f0906
02c81 b988070000                     mov        ecx, 0x788
02c86 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
02c8a 4d8d4001                       lea        r8, [r8 + 1]
02c8e 4c89040a                       mov        qword ptr [rdx + rcx], r8
02c92 0f8cfe010000                   jl         0x7f5bb43f0b16
02c98 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
02c9f 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
02ca6 899c2408020000                 mov        dword ptr [rsp + 0x208], ebx
02cad 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
02cb4 0f1f4000                       nop        dword ptr [rax]
02cb8 89842400020000                 mov        dword ptr [rsp + 0x200], eax
02cbf 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
02cc7 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
02cd1 4883829807000001               add        qword ptr [rdx + 0x798], 1
02cd9 48ba887e71ac5b7f0000           movabs     rdx, 0x7f5bac717e88
02ce3 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02ce6 83c102                         add        ecx, 2
02ce9 894a70                         mov        dword ptr [rdx + 0x70], ecx
02cec 81e1feff1f00                   and        ecx, 0x1ffffe
02cf2 85c9                           test       ecx, ecx
02cf4 0f8478190000                   je         0x7f5bb43f22f2
02cfa 660f1f440000                   nop        word ptr [rax + rax]
02d00 e99d190000                     jmp        0x7f5bb43f2322
02d05 90                             nop        
02d06 90                             nop        
02d07 90                             nop        
02d08 90                             nop        
02d09 90                             nop        
02d0a 48ba887e71ac5b7f0000           movabs     rdx, 0x7f5bac717e88
02d14 488d92d8000000                 lea        rdx, [rdx + 0xd8]
02d1b 4885c0                         test       rax, rax
02d1e 750c                           jne        0x7f5bb43f09ac
02d20 f6420801                       test       byte ptr [rdx + 8], 1
02d24 7506                           jne        0x7f5bb43f09ac
02d26 f048834a0801                   lock or    qword ptr [rdx + 8], 1
02d2c 48be900773e200000000           movabs     rsi, 0xe2730790
02d36 488bd6                         mov        rdx, rsi
02d39 48b9887e71ac5b7f0000           movabs     rcx, 0x7f5bac717e88
02d43 488b12                         mov        rdx, qword ptr [rdx]
02d46 48c1ea2a                       shr        rdx, 0x2a
02d4a 48c1e209                       shl        rdx, 9
02d4e 41ba0000006a                   mov        r10d, 0x6a000000
02d54 4903d2                         add        rdx, r10
02d57 41ba16000000                   mov        r10d, 0x16
02d5d 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02d61 7435                           je         0x7f5bb43f0a18
02d63 4983c202                       add        r10, 2
02d67 4983fa1a                       cmp        r10, 0x1a
02d6b 75f0                           jne        0x7f5bb43f09dd
02d6d 41ba16000000                   mov        r10d, 0x16
02d73 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02d78 7412                           je         0x7f5bb43f0a0c
02d7a 4983c202                       add        r10, 2
02d7e 4983fa1a                       cmp        r10, 0x1a
02d82 75ef                           jne        0x7f5bb43f09f3
02d84 41ba15000000                   mov        r10d, 0x15
02d8a eb10                           jmp        0x7f5bb43f0a1c
02d8c 50                             push       rax
02d8d 4833c0                         xor        rax, rax
02d90 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
02d95 58                             pop        rax
02d96 ebbf                           jmp        0x7f5bb43f09d7
02d98 4983c201                       add        r10, 1
02d9c 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02da1 488bd0                         mov        rdx, rax
02da4 488bcf                         mov        rcx, rdi
02da7 89bc2404020000                 mov        dword ptr [rsp + 0x204], edi
02dae 90                             nop        
02daf e82cf45107                     call       0x7f5bbb90fe60
02db4 0f1f8400ac2e0013               nop        dword ptr [rax + rax + 0x13002eac]
02dbc 48be004072ac5b7f0000           movabs     rsi, 0x7f5bac724000
02dc6 488386a807000001               add        qword ptr [rsi + 0x7a8], 1
02dce 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
02dd6 8b942400020000                 mov        edx, dword ptr [rsp + 0x200]
02ddd 488bc8                         mov        rcx, rax
02de0 0f1f8000000000                 nop        dword ptr [rax]
02de7 e8f4fd5107                     call       0x7f5bbb910860
02dec 0f1f8400e42e0014               nop        dword ptr [rax + rax + 0x14002ee4]
02df4 8b842400020000                 mov        eax, dword ptr [rsp + 0x200]
02dfb 83c008                         add        eax, 8
02dfe 8bbc2404020000                 mov        edi, dword ptr [rsp + 0x204]
02e05 83c708                         add        edi, 8
02e08 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
02e0f be02000000                     mov        esi, 2
02e14 7c05                           jl         0x7f5bb43f0a9b
02e16 be00000000                     mov        esi, 0
02e1b 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
02e25 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
02e28 03ce                           add        ecx, esi
02e2a 894a74                         mov        dword ptr [rdx + 0x74], ecx
02e2d 85f6                           test       esi, esi
02e2f 7505                           jne        0x7f5bb43f0ab6
02e31 b902000000                     mov        ecx, 2
02e36 81e1fe3f0000                   and        ecx, 0x3ffe
02e3c 85c9                           test       ecx, ecx
02e3e 0f8468180000                   je         0x7f5bb43f232c
02e44 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02e48 418502                         test       dword ptr [r10], eax
02e4b 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
02e52 48be004072ac5b7f0000           movabs     rsi, 0x7f5bac724000
02e5c bab8070000                     mov        edx, 0x7b8
02e61 7c05                           jl         0x7f5bb43f0ae8
02e63 bac8070000                     mov        edx, 0x7c8
02e68 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
02e6c 488d4901                       lea        rcx, [rcx + 1]
02e70 48890c16                       mov        qword ptr [rsi + rdx], rcx
02e74 0f8c3efeffff                   jl         0x7f5bb43f0938
02e7a 8b9c2408020000                 mov        ebx, dword ptr [rsp + 0x208]
02e81 48be004072ac5b7f0000           movabs     rsi, 0x7f5bac724000
02e8b ff86d8070000                   inc        dword ptr [rsi + 0x7d8]
02e91 e9600a0000                     jmp        0x7f5bb43f1576
02e96 48be004072ac5b7f0000           movabs     rsi, 0x7f5bac724000
02ea0 488386f007000001               add        qword ptr [rsi + 0x7f0], 1
02ea8 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
02eb0 8b9424d0010000                 mov        edx, dword ptr [rsp + 0x1d0]
02eb7 488bcf                         mov        rcx, rdi
02eba 4d8bc1                         mov        r8, r9
02ebd 448b8c2478010000               mov        r9d, dword ptr [rsp + 0x178]
02ec5 6690                           nop        
02ec7 e814fd5107                     call       0x7f5bbb910860
02ecc 0f1f8400c42f0016               nop        dword ptr [rax + rax + 0x16002fc4]
02ed4 488bd8                         mov        rbx, rax
02ed7 e91a0a0000                     jmp        0x7f5bb43f1576
02edc 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
02ee3 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
02eea 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
02ef2 48be004072ac5b7f0000           movabs     rsi, 0x7f5bac724000
02efc 488386c805000001               add        qword ptr [rsi + 0x5c8], 1
02f04 48bea01a79ac5b7f0000           movabs     rsi, 0x7f5bac791aa0
02f0e 8b5670                         mov        edx, dword ptr [rsi + 0x70]
02f11 83c202                         add        edx, 2
02f14 895670                         mov        dword ptr [rsi + 0x70], edx
02f17 81e2feff1f00                   and        edx, 0x1ffffe
02f1d 85d2                           test       edx, edx
02f1f 0f84a8170000                   je         0x7f5bb43f234d
02f25 48be708d78e200000000           movabs     rsi, 0xe2788d70
02f2f 48baa01a79ac5b7f0000           movabs     rdx, 0x7f5bac791aa0
02f39 488b36                         mov        rsi, qword ptr [rsi]
02f3c 48c1ee2a                       shr        rsi, 0x2a
02f40 48c1e609                       shl        rsi, 9
02f44 41ba0000006a                   mov        r10d, 0x6a000000
02f4a 4903f2                         add        rsi, r10
02f4d 41ba16000000                   mov        r10d, 0x16
02f53 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02f57 7435                           je         0x7f5bb43f0c0e
02f59 4983c202                       add        r10, 2
02f5d 4983fa1a                       cmp        r10, 0x1a
02f61 75f0                           jne        0x7f5bb43f0bd3
02f63 41ba16000000                   mov        r10d, 0x16
02f69 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02f6e 7412                           je         0x7f5bb43f0c02
02f70 4983c202                       add        r10, 2
02f74 4983fa1a                       cmp        r10, 0x1a
02f78 75ef                           jne        0x7f5bb43f0be9
02f7a 41ba15000000                   mov        r10d, 0x15
02f80 eb10                           jmp        0x7f5bb43f0c12
02f82 50                             push       rax
02f83 4833c0                         xor        rax, rax
02f86 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
02f8b 58                             pop        rax
02f8c ebbf                           jmp        0x7f5bb43f0bcd
02f8e 4983c201                       add        r10, 1
02f92 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02f97 8b5808                         mov        ebx, dword ptr [rax + 8]
02f9a 48bea01a79ac5b7f0000           movabs     rsi, 0x7f5bac791aa0
02fa4 488386d800000001               add        qword ptr [rsi + 0xd8], 1
02fac 48bef81079ac5b7f0000           movabs     rsi, 0x7f5bac7910f8
02fb6 8b5670                         mov        edx, dword ptr [rsi + 0x70]
02fb9 83c202                         add        edx, 2
02fbc 895670                         mov        dword ptr [rsi + 0x70], edx
02fbf 81e2feff1f00                   and        edx, 0x1ffffe
02fc5 85d2                           test       edx, edx
02fc7 0f8426170000                   je         0x7f5bb43f2373
02fcd 48bef81079ac5b7f0000           movabs     rsi, 0x7f5bac7910f8
02fd7 4883860801000001               add        qword ptr [rsi + 0x108], 1
02fdf 488bf3                         mov        rsi, rbx
02fe2 83ee0f                         sub        esi, 0xf
02fe5 48bac80779ac5b7f0000           movabs     rdx, 0x7f5bac7907c8
02fef 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02ff2 83c102                         add        ecx, 2
02ff5 894a70                         mov        dword ptr [rdx + 0x70], ecx
02ff8 81e1feff1f00                   and        ecx, 0x1ffffe
02ffe 85c9                           test       ecx, ecx
03000 0f840e170000                   je         0x7f5bb43f2394
03006 48bac80779ac5b7f0000           movabs     rdx, 0x7f5bac7907c8
03010 488382a800000001               add        qword ptr [rdx + 0xa8], 1
03018 48ba0000000000000000           movabs     rdx, 0
03022 ba00000000                     mov        edx, 0
03027 3bfa                           cmp        edi, edx
03029 0f8c06170000                   jl         0x7f5bb43f23b5
0302f 3bfe                           cmp        edi, esi
03031 0f8d0b170000                   jge        0x7f5bb43f23c2
03037 48be708d78e200000000           movabs     rsi, 0xe2788d70
03041 488bd6                         mov        rdx, rsi
03044 48b9a01a79ac5b7f0000           movabs     rcx, 0x7f5bac791aa0
0304e 488b12                         mov        rdx, qword ptr [rdx]
03051 48c1ea2a                       shr        rdx, 0x2a
03055 48c1e209                       shl        rdx, 9
03059 41ba0000006a                   mov        r10d, 0x6a000000
0305f 4903d2                         add        rdx, r10
03062 41ba24000000                   mov        r10d, 0x24
03068 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0306c 7435                           je         0x7f5bb43f0d23
0306e 4983c202                       add        r10, 2
03072 4983fa28                       cmp        r10, 0x28
03076 75f0                           jne        0x7f5bb43f0ce8
03078 41ba24000000                   mov        r10d, 0x24
0307e 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03083 7412                           je         0x7f5bb43f0d17
03085 4983c202                       add        r10, 2
03089 4983fa28                       cmp        r10, 0x28
0308d 75ef                           jne        0x7f5bb43f0cfe
0308f 41ba23000000                   mov        r10d, 0x23
03095 eb10                           jmp        0x7f5bb43f0d27
03097 50                             push       rax
03098 4833c0                         xor        rax, rax
0309b 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
030a0 58                             pop        rax
030a1 ebbf                           jmp        0x7f5bb43f0ce2
030a3 4983c201                       add        r10, 1
030a7 4a8304d101                     add        qword ptr [rcx + r10*8], 1
030ac 48bac80879ac5b7f0000           movabs     rdx, 0x7f5bac7908c8
030b6 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
030b9 83c102                         add        ecx, 2
030bc 894a70                         mov        dword ptr [rdx + 0x70], ecx
030bf 81e1feff1f00                   and        ecx, 0x1ffffe
030c5 85c9                           test       ecx, ecx
030c7 0f8482160000                   je         0x7f5bb43f23cf
030cd 48bac80879ac5b7f0000           movabs     rdx, 0x7f5bac7908c8
030d7 488382a800000001               add        qword ptr [rdx + 0xa8], 1
030df 48bef00979ac5b7f0000           movabs     rsi, 0x7f5bac7909f0
030e9 8b5670                         mov        edx, dword ptr [rsi + 0x70]
030ec 83c202                         add        edx, 2
030ef 895670                         mov        dword ptr [rsi + 0x70], edx
030f2 81e2feff1f00                   and        edx, 0x1ffffe
030f8 85d2                           test       edx, edx
030fa 0f8470160000                   je         0x7f5bb43f23f0
03100 48bef00979ac5b7f0000           movabs     rsi, 0x7f5bac7909f0
0310a ff86b8000000                   inc        dword ptr [rsi + 0xb8]
03110 899c240c020000                 mov        dword ptr [rsp + 0x20c], ebx
03117 48be585e7ae200000000           movabs     rsi, 0xe27a5e58
03121 488bd6                         mov        rdx, rsi
03124 48b9a01a79ac5b7f0000           movabs     rcx, 0x7f5bac791aa0
0312e 4883815801000001               add        qword ptr [rcx + 0x158], 1
03136 48ba681c79ac5b7f0000           movabs     rdx, 0x7f5bac791c68
03140 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03143 83c102                         add        ecx, 2
03146 894a70                         mov        dword ptr [rdx + 0x70], ecx
03149 81e1feff1f00                   and        ecx, 0x1ffffe
0314f 85c9                           test       ecx, ecx
03151 0f843a160000                   je         0x7f5bb43f2411
03157 488bd6                         mov        rdx, rsi
0315a 48b9681c79ac5b7f0000           movabs     rcx, 0x7f5bac791c68
03164 488381a800000001               add        qword ptr [rcx + 0xa8], 1
0316c 48ba481d79ac5b7f0000           movabs     rdx, 0x7f5bac791d48
03176 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03179 83c102                         add        ecx, 2
0317c 894a70                         mov        dword ptr [rdx + 0x70], ecx
0317f 81e1feff1f00                   and        ecx, 0x1ffffe
03185 85c9                           test       ecx, ecx
03187 0f8425160000                   je         0x7f5bb43f2432
0318d 48ba481d79ac5b7f0000           movabs     rdx, 0x7f5bac791d48
03197 488382b800000001               add        qword ptr [rdx + 0xb8], 1
0319f 48be701279ac5b7f0000           movabs     rsi, 0x7f5bac791270
031a9 8b5670                         mov        edx, dword ptr [rsi + 0x70]
031ac 83c202                         add        edx, 2
031af 895670                         mov        dword ptr [rsi + 0x70], edx
031b2 81e2feff1f00                   and        edx, 0x1ffffe
031b8 85d2                           test       edx, edx
031ba 0f8413160000                   je         0x7f5bb43f2453
031c0 48be708d78e200000000           movabs     rsi, 0xe2788d70
031ca 488bd6                         mov        rdx, rsi
031cd 48b9481d79ac5b7f0000           movabs     rcx, 0x7f5bac791d48
031d7 488b12                         mov        rdx, qword ptr [rdx]
031da 48c1ea2a                       shr        rdx, 0x2a
031de 48c1e209                       shl        rdx, 9
031e2 41ba0000006a                   mov        r10d, 0x6a000000
031e8 4903d2                         add        rdx, r10
031eb 41ba1c000000                   mov        r10d, 0x1c
031f1 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
031f5 7435                           je         0x7f5bb43f0eac
031f7 4983c202                       add        r10, 2
031fb 4983fa20                       cmp        r10, 0x20
031ff 75f0                           jne        0x7f5bb43f0e71
03201 41ba1c000000                   mov        r10d, 0x1c
03207 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0320c 7412                           je         0x7f5bb43f0ea0
0320e 4983c202                       add        r10, 2
03212 4983fa20                       cmp        r10, 0x20
03216 75ef                           jne        0x7f5bb43f0e87
03218 41ba1b000000                   mov        r10d, 0x1b
0321e eb10                           jmp        0x7f5bb43f0eb0
03220 50                             push       rax
03221 4833c0                         xor        rax, rax
03224 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
03229 58                             pop        rax
0322a ebbf                           jmp        0x7f5bb43f0e6b
0322c 4983c201                       add        r10, 1
03230 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03235 48ba481d79ac5b7f0000           movabs     rdx, 0x7f5bac791d48
0323f 488b36                         mov        rsi, qword ptr [rsi]
03242 48c1ee2a                       shr        rsi, 0x2a
03246 48c1e609                       shl        rsi, 9
0324a 41ba0000006a                   mov        r10d, 0x6a000000
03250 4903f2                         add        rsi, r10
03253 41ba22000000                   mov        r10d, 0x22
03259 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
0325d 7435                           je         0x7f5bb43f0f14
0325f 4983c202                       add        r10, 2
03263 4983fa26                       cmp        r10, 0x26
03267 75f0                           jne        0x7f5bb43f0ed9
03269 41ba22000000                   mov        r10d, 0x22
0326f 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03274 7412                           je         0x7f5bb43f0f08
03276 4983c202                       add        r10, 2
0327a 4983fa26                       cmp        r10, 0x26
0327e 75ef                           jne        0x7f5bb43f0eef
03280 41ba21000000                   mov        r10d, 0x21
03286 eb10                           jmp        0x7f5bb43f0f18
03288 50                             push       rax
03289 4833c0                         xor        rax, rax
0328c 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
03291 58                             pop        rax
03292 ebbf                           jmp        0x7f5bb43f0ed3
03294 4983c201                       add        r10, 1
03298 4a8304d201                     add        qword ptr [rdx + r10*8], 1
0329d 48be481d79ac5b7f0000           movabs     rsi, 0x7f5bac791d48
032a7 4883863801000001               add        qword ptr [rsi + 0x138], 1
032af 48be301379ac5b7f0000           movabs     rsi, 0x7f5bac791330
032b9 8b5670                         mov        edx, dword ptr [rsi + 0x70]
032bc 83c202                         add        edx, 2
032bf 895670                         mov        dword ptr [rsi + 0x70], edx
032c2 81e2feff1f00                   and        edx, 0x1ffffe
032c8 85d2                           test       edx, edx
032ca 0f8424150000                   je         0x7f5bb43f2474
032d0 48be481d79ac5b7f0000           movabs     rsi, 0x7f5bac791d48
032da 4883864801000001               add        qword ptr [rsi + 0x148], 1
032e2 4c63df                         movsxd     r11, edi
032e5 be0c000000                     mov        esi, 0xc
032ea 4d8bcb                         mov        r9, r11
032ed 4c03ce                         add        r9, rsi
032f0 48be180579ac5b7f0000           movabs     rsi, 0x7f5bac790518
032fa 8b5670                         mov        edx, dword ptr [rsi + 0x70]
032fd 83c202                         add        edx, 2
03300 895670                         mov        dword ptr [rsi + 0x70], edx
03303 81e2feff1f00                   and        edx, 0x1ffffe
03309 85d2                           test       edx, edx
0330b 0f8404150000                   je         0x7f5bb43f2495
03311 48be180579ac5b7f0000           movabs     rsi, 0x7f5bac790518
0331b 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03323 48be900679ac5b7f0000           movabs     rsi, 0x7f5bac790690
0332d 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03330 83c202                         add        edx, 2
03333 895670                         mov        dword ptr [rsi + 0x70], edx
03336 81e2feff1f00                   and        edx, 0x1ffffe
0333c 85d2                           test       edx, edx
0333e 0f84f2140000                   je         0x7f5bb43f24b6
03344 48be481d79ac5b7f0000           movabs     rsi, 0x7f5bac791d48
0334e 4883866801000001               add        qword ptr [rsi + 0x168], 1
03356 48be28597be200000000           movabs     rsi, 0xe27b5928
03360 48beb88d78e200000000           movabs     rsi, 0xe2788db8
0336a ba02000000                     mov        edx, 2
0336f b910000000                     mov        ecx, 0x10
03374 4c8bc0                         mov        r8, rax
03377 bf00000000                     mov        edi, 0
0337c 48890424                       mov        qword ptr [rsp], rax
03380 4c895c2408                     mov        qword ptr [rsp + 8], r11
03385 49ba708d78e200000000           movabs     r10, 0xe2788d70
0338f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03394 49ba28597be200000000           movabs     r10, 0xe27b5928
0339e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
033a3 0f1f4000                       nop        dword ptr [rax]
033a7 e834f85107                     call       0x7f5bbb910860
033ac 0f1f8400a4340017               nop        dword ptr [rax + rax + 0x170034a4]
033b4 4885c0                         test       rax, rax
033b7 48bb481d79ac5b7f0000           movabs     rbx, 0x7f5bac791d48
033c1 750c                           jne        0x7f5bb43f104f
033c3 808b7101000001                 or         byte ptr [rbx + 0x171], 1
033ca e98b000000                     jmp        0x7f5bb43f10da
033cf 488b38                         mov        rdi, qword ptr [rax]
033d2 48c1ef2a                       shr        rdi, 0x2a
033d6 48c1e709                       shl        rdi, 9
033da 41ba0000006a                   mov        r10d, 0x6a000000
033e0 4903fa                         add        rdi, r10
033e3 41ba30000000                   mov        r10d, 0x30
033e9 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
033ed 7435                           je         0x7f5bb43f10a4
033ef 4983c202                       add        r10, 2
033f3 4983fa34                       cmp        r10, 0x34
033f7 75f0                           jne        0x7f5bb43f1069
033f9 41ba30000000                   mov        r10d, 0x30
033ff 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03404 7412                           je         0x7f5bb43f1098
03406 4983c202                       add        r10, 2
0340a 4983fa34                       cmp        r10, 0x34
0340e 75ef                           jne        0x7f5bb43f107f
03410 41ba2f000000                   mov        r10d, 0x2f
03416 eb10                           jmp        0x7f5bb43f10a8
03418 50                             push       rax
03419 4833c0                         xor        rax, rax
0341c 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
03421 58                             pop        rax
03422 ebbf                           jmp        0x7f5bb43f1063
03424 4983c201                       add        r10, 1
03428 4a8304d301                     add        qword ptr [rbx + r10*8], 1
0342d 48bf0006146a00000000           movabs     rdi, 0x6a140600
03437 488b18                         mov        rbx, qword ptr [rax]
0343a 48c1eb2a                       shr        rbx, 0x2a
0343e 48c1e309                       shl        rbx, 9
03442 41ba0000006a                   mov        r10d, 0x6a000000
03448 4903da                         add        rbx, r10
0344b 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
0344f 0f8502140000                   jne        0x7f5bb43f24d7
03455 e900000000                     jmp        0x7f5bb43f10da
0345a 488bf8                         mov        rdi, rax
0345d 4889bc2410020000               mov        qword ptr [rsp + 0x210], rdi
03465 483b07                         cmp        rax, qword ptr [rdi]
03468 488bf7                         mov        rsi, rdi
0346b 48bb004072ac5b7f0000           movabs     rbx, 0x7f5bac724000
03475 488b36                         mov        rsi, qword ptr [rsi]
03478 48c1ee2a                       shr        rsi, 0x2a
0347c 48c1e609                       shl        rsi, 9
03480 41ba0000006a                   mov        r10d, 0x6a000000
03486 4903f2                         add        rsi, r10
03489 41babc000000                   mov        r10d, 0xbc
0348f 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03493 743b                           je         0x7f5bb43f1150
03495 4983c202                       add        r10, 2
03499 4981fac0000000                 cmp        r10, 0xc0
034a0 75ed                           jne        0x7f5bb43f110f
034a2 41babc000000                   mov        r10d, 0xbc
034a8 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
034ad 7415                           je         0x7f5bb43f1144
034af 4983c202                       add        r10, 2
034b3 4981fac0000000                 cmp        r10, 0xc0
034ba 75ec                           jne        0x7f5bb43f1128
034bc 41babb000000                   mov        r10d, 0xbb
034c2 eb10                           jmp        0x7f5bb43f1154
034c4 50                             push       rax
034c5 4833c0                         xor        rax, rax
034c8 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
034cd 58                             pop        rax
034ce ebb9                           jmp        0x7f5bb43f1109
034d0 4983c201                       add        r10, 1
034d4 4a8304d301                     add        qword ptr [rbx + r10*8], 1
034d9 48be602779ac5b7f0000           movabs     rsi, 0x7f5bac792760
034e3 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
034e6 83c302                         add        ebx, 2
034e9 895e70                         mov        dword ptr [rsi + 0x70], ebx
034ec 81e3feff1f00                   and        ebx, 0x1ffffe
034f2 85db                           test       ebx, ebx
034f4 0f846b130000                   je         0x7f5bb43f24e5
034fa 488bf7                         mov        rsi, rdi
034fd 48bb602779ac5b7f0000           movabs     rbx, 0x7f5bac792760
03507 488b36                         mov        rsi, qword ptr [rsi]
0350a 48c1ee2a                       shr        rsi, 0x2a
0350e 48c1e609                       shl        rsi, 9
03512 41ba0000006a                   mov        r10d, 0x6a000000
03518 4903f2                         add        rsi, r10
0351b 41ba16000000                   mov        r10d, 0x16
03521 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03525 7435                           je         0x7f5bb43f11dc
03527 4983c202                       add        r10, 2
0352b 4983fa1a                       cmp        r10, 0x1a
0352f 75f0                           jne        0x7f5bb43f11a1
03531 41ba16000000                   mov        r10d, 0x16
03537 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0353c 7412                           je         0x7f5bb43f11d0
0353e 4983c202                       add        r10, 2
03542 4983fa1a                       cmp        r10, 0x1a
03546 75ef                           jne        0x7f5bb43f11b7
03548 41ba15000000                   mov        r10d, 0x15
0354e eb10                           jmp        0x7f5bb43f11e0
03550 50                             push       rax
03551 4833c0                         xor        rax, rax
03554 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
03559 58                             pop        rax
0355a ebbf                           jmp        0x7f5bb43f119b
0355c 4983c201                       add        r10, 1
03560 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03565 488bf7                         mov        rsi, rdi
03568 0f1f440000                     nop        dword ptr [rax + rax]
0356d 48b8a0183b905b7f0000           movabs     rax, 0x7f5b903b18a0
03577 e864f15107                     call       0x7f5bbb910360
0357c 0f1f840074360018               nop        dword ptr [rax + rax + 0x18003674]
03584 48be602779ac5b7f0000           movabs     rsi, 0x7f5bac792760
0358e 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03596 48bef81079ac5b7f0000           movabs     rsi, 0x7f5bac7910f8
035a0 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
035a3 83c702                         add        edi, 2
035a6 897e70                         mov        dword ptr [rsi + 0x70], edi
035a9 81e7feff1f00                   and        edi, 0x1ffffe
035af 85ff                           test       edi, edi
035b1 0f84cf120000                   je         0x7f5bb43f2506
035b7 8b9c240c020000                 mov        ebx, dword ptr [rsp + 0x20c]
035be 8bbc24d0010000                 mov        edi, dword ptr [rsp + 0x1d0]
035c5 48bef81079ac5b7f0000           movabs     rsi, 0x7f5bac7910f8
035cf 4883860801000001               add        qword ptr [rsi + 0x108], 1
035d7 ffc8                           dec        eax
035d9 2bd8                           sub        ebx, eax
035db 48bec80779ac5b7f0000           movabs     rsi, 0x7f5bac7907c8
035e5 8b4670                         mov        eax, dword ptr [rsi + 0x70]
035e8 83c002                         add        eax, 2
035eb 894670                         mov        dword ptr [rsi + 0x70], eax
035ee 25feff1f00                     and        eax, 0x1ffffe
035f3 85c0                           test       eax, eax
035f5 0f84ac120000                   je         0x7f5bb43f2527
035fb 48bec80779ac5b7f0000           movabs     rsi, 0x7f5bac7907c8
03605 488386a800000001               add        qword ptr [rsi + 0xa8], 1
0360d 48be0000000000000000           movabs     rsi, 0
03617 be00000000                     mov        esi, 0
0361c 3bfe                           cmp        edi, esi
0361e 0f8ca4120000                   jl         0x7f5bb43f2548
03624 3bfb                           cmp        edi, ebx
03626 0f8da9120000                   jge        0x7f5bb43f2555
0362c 488bdf                         mov        rbx, rdi
0362f 899c2418020000                 mov        dword ptr [rsp + 0x218], ebx
03636 89bc24d0010000                 mov        dword ptr [rsp + 0x1d0], edi
0363d 488bbc2410020000               mov        rdi, qword ptr [rsp + 0x210]
03645 488bf7                         mov        rsi, rdi
03648 48b9602779ac5b7f0000           movabs     rcx, 0x7f5bac792760
03652 488b36                         mov        rsi, qword ptr [rsi]
03655 48c1ee2a                       shr        rsi, 0x2a
03659 48c1e609                       shl        rsi, 9
0365d 41ba0000006a                   mov        r10d, 0x6a000000
03663 4903f2                         add        rsi, r10
03666 41ba1e000000                   mov        r10d, 0x1e
0366c 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
03670 7435                           je         0x7f5bb43f1327
03672 4983c202                       add        r10, 2
03676 4983fa22                       cmp        r10, 0x22
0367a 75f0                           jne        0x7f5bb43f12ec
0367c 41ba1e000000                   mov        r10d, 0x1e
03682 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03687 7412                           je         0x7f5bb43f131b
03689 4983c202                       add        r10, 2
0368d 4983fa22                       cmp        r10, 0x22
03691 75ef                           jne        0x7f5bb43f1302
03693 41ba1d000000                   mov        r10d, 0x1d
03699 eb10                           jmp        0x7f5bb43f132b
0369b 50                             push       rax
0369c 4833c0                         xor        rax, rax
0369f 4a0fb134d1                     cmpxchg    qword ptr [rcx + r10*8], rsi
036a4 58                             pop        rax
036a5 ebbf                           jmp        0x7f5bb43f12e6
036a7 4983c201                       add        r10, 1
036ab 4a8304d101                     add        qword ptr [rcx + r10*8], 1
036b0 488bf7                         mov        rsi, rdi
036b3 6690                           nop        
036b5 48b8c8183b905b7f0000           movabs     rax, 0x7f5b903b18c8
036bf e81cf05107                     call       0x7f5bbb910360
036c4 0f1f8400bc370019               nop        dword ptr [rax + rax + 0x190037bc]
036cc 483b00                         cmp        rax, qword ptr [rax]
036cf 488bf0                         mov        rsi, rax
036d2 48ba602779ac5b7f0000           movabs     rdx, 0x7f5bac792760
036dc 488b36                         mov        rsi, qword ptr [rsi]
036df 48c1ee2a                       shr        rsi, 0x2a
036e3 48c1e609                       shl        rsi, 9
036e7 41ba0000006a                   mov        r10d, 0x6a000000
036ed 4903f2                         add        rsi, r10
036f0 41ba24000000                   mov        r10d, 0x24
036f6 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
036fa 7435                           je         0x7f5bb43f13b1
036fc 4983c202                       add        r10, 2
03700 4983fa28                       cmp        r10, 0x28
03704 75f0                           jne        0x7f5bb43f1376
03706 41ba24000000                   mov        r10d, 0x24
0370c 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03711 7412                           je         0x7f5bb43f13a5
03713 4983c202                       add        r10, 2
03717 4983fa28                       cmp        r10, 0x28
0371b 75ef                           jne        0x7f5bb43f138c
0371d 41ba23000000                   mov        r10d, 0x23
03723 eb10                           jmp        0x7f5bb43f13b5
03725 50                             push       rax
03726 4833c0                         xor        rax, rax
03729 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
0372e 58                             pop        rax
0372f ebbf                           jmp        0x7f5bb43f1370
03731 4983c201                       add        r10, 1
03735 4a8304d201                     add        qword ptr [rdx + r10*8], 1
0373a 8b7028                         mov        esi, dword ptr [rax + 0x28]
0373d 488bd0                         mov        rdx, rax
03740 48b9602779ac5b7f0000           movabs     rcx, 0x7f5bac792760
0374a 488b12                         mov        rdx, qword ptr [rdx]
0374d 48c1ea2a                       shr        rdx, 0x2a
03751 48c1e209                       shl        rdx, 9
03755 41ba0000006a                   mov        r10d, 0x6a000000
0375b 4903d2                         add        rdx, r10
0375e 41ba2a000000                   mov        r10d, 0x2a
03764 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03768 7435                           je         0x7f5bb43f141f
0376a 4983c202                       add        r10, 2
0376e 4983fa2e                       cmp        r10, 0x2e
03772 75f0                           jne        0x7f5bb43f13e4
03774 41ba2a000000                   mov        r10d, 0x2a
0377a 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0377f 7412                           je         0x7f5bb43f1413
03781 4983c202                       add        r10, 2
03785 4983fa2e                       cmp        r10, 0x2e
03789 75ef                           jne        0x7f5bb43f13fa
0378b 41ba29000000                   mov        r10d, 0x29
03791 eb10                           jmp        0x7f5bb43f1423
03793 50                             push       rax
03794 4833c0                         xor        rax, rax
03797 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
0379c 58                             pop        rax
0379d ebbf                           jmp        0x7f5bb43f13de
0379f 4983c201                       add        r10, 1
037a3 4a8304d101                     add        qword ptr [rcx + r10*8], 1
037a8 8b4808                         mov        ecx, dword ptr [rax + 8]
037ab 48ba602779ac5b7f0000           movabs     rdx, 0x7f5bac792760
037b5 4883827801000001               add        qword ptr [rdx + 0x178], 1
037bd 48ba301379ac5b7f0000           movabs     rdx, 0x7f5bac791330
037c7 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
037cb 4183c002                       add        r8d, 2
037cf 44894270                       mov        dword ptr [rdx + 0x70], r8d
037d3 4181e0feff1f00                 and        r8d, 0x1ffffe
037da 4585c0                         test       r8d, r8d
037dd 0f8404110000                   je         0x7f5bb43f2567
037e3 48ba602779ac5b7f0000           movabs     rdx, 0x7f5bac792760
037ed 4883828801000001               add        qword ptr [rdx + 0x188], 1
037f5 8b9c2418020000                 mov        ebx, dword ptr [rsp + 0x218]
037fc 4863db                         movsxd     rbx, ebx
037ff ba0c000000                     mov        edx, 0xc
03804 4c8bcb                         mov        r9, rbx
03807 4c03ca                         add        r9, rdx
0380a 48ba180579ac5b7f0000           movabs     rdx, 0x7f5bac790518
03814 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03818 4183c002                       add        r8d, 2
0381c 44894270                       mov        dword ptr [rdx + 0x70], r8d
03820 4181e0feff1f00                 and        r8d, 0x1ffffe
03827 4585c0                         test       r8d, r8d
0382a 0f84d8100000                   je         0x7f5bb43f2588
03830 48ba180579ac5b7f0000           movabs     rdx, 0x7f5bac790518
0383a 488382d800000001               add        qword ptr [rdx + 0xd8], 1
03842 48ba900679ac5b7f0000           movabs     rdx, 0x7f5bac790690
0384c 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03850 4183c002                       add        r8d, 2
03854 44894270                       mov        dword ptr [rdx + 0x70], r8d
03858 4181e0feff1f00                 and        r8d, 0x1ffffe
0385f 4585c0                         test       r8d, r8d
03862 0f84c1100000                   je         0x7f5bb43f25a9
03868 48ba602779ac5b7f0000           movabs     rdx, 0x7f5bac792760
03872 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
0387a 48bad0397de200000000           movabs     rdx, 0xe27d39d0
03884 ba02000000                     mov        edx, 2
03889 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
03891 bf00000000                     mov        edi, 0
03896 488b842410020000               mov        rax, qword ptr [rsp + 0x210]
0389e 48890424                       mov        qword ptr [rsp], rax
038a2 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
038aa 4889442408                     mov        qword ptr [rsp + 8], rax
038af 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
038b4 49bad0397de200000000           movabs     r10, 0xe27d39d0
038be 4c89542418                     mov        qword ptr [rsp + 0x18], r10
038c3 0f1f4000                       nop        dword ptr [rax]
038c7 e814f35107                     call       0x7f5bbb910860
038cc 0f1f8400c439001a               nop        dword ptr [rax + rax + 0x1a0039c4]
038d4 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
038db 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
038e3 4103d8                         add        ebx, r8d
038e6 48be004072ac5b7f0000           movabs     rsi, 0x7f5bac724000
038f0 ff8608060000                   inc        dword ptr [rsi + 0x608]
038f6 8bb424d4010000                 mov        esi, dword ptr [rsp + 0x1d4]
038fd 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
03907 ff8200080000                   inc        dword ptr [rdx + 0x800]
0390d 488bc3                         mov        rax, rbx
03910 8b942444010000                 mov        edx, dword ptr [rsp + 0x144]
03917 ffc2                           inc        edx
03919 48b9004072ac5b7f0000           movabs     rcx, 0x7f5bac724000
03923 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
03927 4183c002                       add        r8d, 2
0392b 44894174                       mov        dword ptr [rcx + 0x74], r8d
0392f 4181e0fe3f0000                 and        r8d, 0x3ffe
03936 4585c0                         test       r8d, r8d
03939 0f840b100000                   je         0x7f5bb43f25ca
0393f 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03943 418502                         test       dword ptr [r10], eax
03946 48b9004072ac5b7f0000           movabs     rcx, 0x7f5bac724000
03950 ff8128080000                   inc        dword ptr [rcx + 0x828]
03956 488bce                         mov        rcx, rsi
03959 4c8bd8                         mov        r11, rax
0395c 488bf1                         mov        rsi, rcx
0395f 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
03967 488b9c2468020000               mov        rbx, qword ptr [rsp + 0x268]
0396f 8bbc2430010000                 mov        edi, dword ptr [rsp + 0x130]
03976 4c8b8c2420010000               mov        r9, qword ptr [rsp + 0x120]
0397e 4c8b842428010000               mov        r8, qword ptr [rsp + 0x128]
03986 8b8c2434010000                 mov        ecx, dword ptr [rsp + 0x134]
0398d e95ec9ffff                     jmp        0x7f5bb43edf70
03992 4c8bc8                         mov        r9, rax
03995 4585c9                         test       r9d, r9d
03998 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
039a2 b980030000                     mov        ecx, 0x380
039a7 7e05                           jle        0x7f5bb43f162e
039a9 b990030000                     mov        ecx, 0x390
039ae 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
039b2 4d8d4001                       lea        r8, [r8 + 1]
039b6 4c89040a                       mov        qword ptr [rdx + rcx], r8
039ba 0f8e77010000                   jle        0x7f5bb43f17b7
039c0 488b9c2498010000               mov        rbx, qword ptr [rsp + 0x198]
039c8 482bf3                         sub        rsi, rbx
039cb ba00000000                     mov        edx, 0
039d0 483bf2                         cmp        rsi, rdx
039d3 48be004072ac5b7f0000           movabs     rsi, 0x7f5bac724000
039dd baa0030000                     mov        edx, 0x3a0
039e2 7d05                           jge        0x7f5bb43f1669
039e4 bab0030000                     mov        edx, 0x3b0
039e9 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
039ed 488d4901                       lea        rcx, [rcx + 1]
039f1 48890c16                       mov        qword ptr [rsi + rdx], rcx
039f5 0f8d3c010000                   jge        0x7f5bb43f17b7
039fb 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
03a03 488b5630                       mov        rdx, qword ptr [rsi + 0x30]
03a07 be00000000                     mov        esi, 0
03a0c 483bd6                         cmp        rdx, rsi
03a0f 48be004072ac5b7f0000           movabs     rsi, 0x7f5bac724000
03a19 bac0030000                     mov        edx, 0x3c0
03a1e 7505                           jne        0x7f5bb43f16a5
03a20 bad0030000                     mov        edx, 0x3d0
03a25 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
03a29 488d4901                       lea        rcx, [rcx + 1]
03a2d 48890c16                       mov        qword ptr [rsi + rdx], rcx
03a31 0f8500010000                   jne        0x7f5bb43f17b7
03a37 e905010000                     jmp        0x7f5bb43f17c1
03a3c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
03a44 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03a4c 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
03a54 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
03a5b 488bce                         mov        rcx, rsi
03a5e 8bb42434010000                 mov        esi, dword ptr [rsp + 0x134]
03a65 488bde                         mov        rbx, rsi
03a68 2bd9                           sub        ebx, ecx
03a6a 48be004072ac5b7f0000           movabs     rsi, 0x7f5bac724000
03a74 4883864008000001               add        qword ptr [rsi + 0x840], 1
03a7c 488bf2                         mov        rsi, rdx
03a7f 488bd1                         mov        rdx, rcx
03a82 488bc8                         mov        rcx, rax
03a85 4d8bc3                         mov        r8, r11
03a88 4c8bcb                         mov        r9, rbx
03a8b 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
03a93 899c241c020000                 mov        dword ptr [rsp + 0x21c], ebx
03a9a 4885c9                         test       rcx, rcx
03a9d 0f84c80e0000                   je         0x7f5bb43f25eb
03aa3 85d2                           test       edx, edx
03aa5 0f8cc00e0000                   jl         0x7f5bb43f25eb
03aab 4585c0                         test       r8d, r8d
03aae 0f8cb70e0000                   jl         0x7f5bb43f25eb
03ab4 4a8d3c0a                       lea        rdi, [rdx + r9]
03ab8 3b7e08                         cmp        edi, dword ptr [rsi + 8]
03abb 0f87aa0e0000                   ja         0x7f5bb43f25eb
03ac1 4b8d3c08                       lea        rdi, [r8 + r9]
03ac5 3b7908                         cmp        edi, dword ptr [rcx + 8]
03ac8 0f879d0e0000                   ja         0x7f5bb43f25eb
03ace 4585c9                         test       r9d, r9d
03ad1 0f8c940e0000                   jl         0x7f5bb43f25eb
03ad7 4863d2                         movsxd     rdx, edx
03ada 4d63c0                         movsxd     r8, r8d
03add 488d7c160c                     lea        rdi, [rsi + rdx + 0xc]
03ae2 4a8d74010c                     lea        rsi, [rcx + r8 + 0xc]
03ae7 498bd1                         mov        rdx, r9
03aea 40f6c40f                       test       spl, 0xf
03aee 0f8412000000                   je         0x7f5bb43f1786
03af4 4883ec08                       sub        rsp, 8
03af8 e8a3875007                     call       0x7f5bbb8f9f20
03afd 4883c408                       add        rsp, 8
03b01 e905000000                     jmp        0x7f5bb43f178b
03b06 e895875007                     call       0x7f5bbb8f9f20
03b0b 8b9c241c020000                 mov        ebx, dword ptr [rsp + 0x21c]
03b12 039c2474010000                 add        ebx, dword ptr [rsp + 0x174]
03b19 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
03b21 895e3c                         mov        dword ptr [rsi + 0x3c], ebx
03b24 4881c450020000                 add        rsp, 0x250
03b2b 5d                             pop        rbp
03b2c 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
03b30 0f87430e0000                   ja         0x7f5bb43f25f9
03b36 c3                             ret        
03b37 bb02000000                     mov        ebx, 2
03b3c e915000000                     jmp        0x7f5bb43f17d6
03b41 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
03b4b ff82e0030000                   inc        dword ptr [rdx + 0x3e0]
03b51 bb08000000                     mov        ebx, 8
03b56 899c2428020000                 mov        dword ptr [rsp + 0x228], ebx
03b5d 666690                         nop        
03b60 e9390e0000                     jmp        0x7f5bb43f261e
03b65 90                             nop        
03b66 90                             nop        
03b67 90                             nop        
03b68 90                             nop        
03b69 90                             nop        
03b6a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
03b71 0f85360e0000                   jne        0x7f5bb43f262d
03b77 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
03b7e 488d7828                       lea        rdi, [rax + 0x28]
03b82 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
03b89 0f871e0e0000                   ja         0x7f5bb43f262d
03b8f 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
03b96 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
03b9d 488908                         mov        qword ptr [rax], rcx
03ba0 4833c9                         xor        rcx, rcx
03ba3 48894808                       mov        qword ptr [rax + 8], rcx
03ba7 48894810                       mov        qword ptr [rax + 0x10], rcx
03bab 48894818                       mov        qword ptr [rax + 0x18], rcx
03baf 48894820                       mov        qword ptr [rax + 0x20], rcx
03bb3 0f1f440000                     nop        dword ptr [rax + rax]
03bb8 e90c0e0000                     jmp        0x7f5bb43f2649
03bbd 90                             nop        
03bbe 90                             nop        
03bbf 90                             nop        
03bc0 90                             nop        
03bc1 90                             nop        
03bc2 498bf1                         mov        rsi, r9
03bc5 4889842420020000               mov        qword ptr [rsp + 0x220], rax
03bcd 6690                           nop        
03bcf e80cf05107                     call       0x7f5bbb910860
03bd4 0f1f8400cc3c001c               nop        dword ptr [rax + rax + 0x1c003ccc]
03bdc 48ba004072ac5b7f0000           movabs     rdx, 0x7f5bac724000
03be6 488d9208040000                 lea        rdx, [rdx + 0x408]
03bed 4885c0                         test       rax, rax
03bf0 750a                           jne        0x7f5bb43f187c
03bf2 f60201                         test       byte ptr [rdx], 1
03bf5 7505                           jne        0x7f5bb43f187c
03bf7 f048830a01                     lock or    qword ptr [rdx], 1
03bfc 488b942420020000               mov        rdx, qword ptr [rsp + 0x220]
03c04 48b9004072ac5b7f0000           movabs     rcx, 0x7f5bac724000
03c0e 4883811804000001               add        qword ptr [rcx + 0x418], 1
03c16 8b942428020000                 mov        edx, dword ptr [rsp + 0x228]
03c1d 488bc8                         mov        rcx, rax
03c20 488bb42420020000               mov        rsi, qword ptr [rsp + 0x220]
03c28 0f1f8000000000                 nop        dword ptr [rax]
03c2f e8ace55107                     call       0x7f5bbb90fe60
03c34 0f1f84002c3d001d               nop        dword ptr [rax + rax + 0x1d003d2c]
03c3c 488b842420020000               mov        rax, qword ptr [rsp + 0x220]
03c44 e9fd0d0000                     jmp        0x7f5bb43f26c6
03c49 0f1f8000000000                 nop        dword ptr [rax]
03c50 e98d0d0000                     jmp        0x7f5bb43f2662
03c55 90                             nop        
03c56 90                             nop        
03c57 90                             nop        
03c58 90                             nop        
03c59 90                             nop        
03c5a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
03c61 0f858a0d0000                   jne        0x7f5bb43f2671
03c67 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
03c6e 488d7828                       lea        rdi, [rax + 0x28]
03c72 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
03c79 0f87720d0000                   ja         0x7f5bb43f2671
03c7f 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
03c86 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
03c8d 488908                         mov        qword ptr [rax], rcx
03c90 4833c9                         xor        rcx, rcx
03c93 48894808                       mov        qword ptr [rax + 8], rcx
03c97 48894810                       mov        qword ptr [rax + 0x10], rcx
03c9b 48894818                       mov        qword ptr [rax + 0x18], rcx
03c9f 48894820                       mov        qword ptr [rax + 0x20], rcx
03ca3 488bd0                         mov        rdx, rax
03ca6 48b9004072ac5b7f0000           movabs     rcx, 0x7f5bac724000
03cb0 4883815002000001               add        qword ptr [rcx + 0x250], 1
03cb8 ba02000000                     mov        edx, 2
03cbd 48b9a06326e200000000           movabs     rcx, 0xe22663a0
03cc7 488bf0                         mov        rsi, rax
03cca 4889842430020000               mov        qword ptr [rsp + 0x230], rax
03cd2 0f1f440000                     nop        dword ptr [rax + rax]
03cd7 e804e55107                     call       0x7f5bbb90fe60
03cdc 0f1f8400d43d001e               nop        dword ptr [rax + rax + 0x1e003dd4]
03ce4 488b842430020000               mov        rax, qword ptr [rsp + 0x230]
03cec e9550d0000                     jmp        0x7f5bb43f26c6
03cf1 0f1f8000000000                 nop        dword ptr [rax]
03cf8 e9100d0000                     jmp        0x7f5bb43f268d
03cfd 90                             nop        
03cfe 90                             nop        
03cff 90                             nop        
03d00 90                             nop        
03d01 90                             nop        
03d02 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
03d09 0f850d0d0000                   jne        0x7f5bb43f269c
03d0f 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
03d16 488d7828                       lea        rdi, [rax + 0x28]
03d1a 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
03d21 0f87f50c0000                   ja         0x7f5bb43f269c
03d27 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
03d2e 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
03d35 488908                         mov        qword ptr [rax], rcx
03d38 4833c9                         xor        rcx, rcx
03d3b 48894808                       mov        qword ptr [rax + 8], rcx
03d3f 48894810                       mov        qword ptr [rax + 0x10], rcx
03d43 48894818                       mov        qword ptr [rax + 0x18], rcx
03d47 48894820                       mov        qword ptr [rax + 0x20], rcx
03d4b 488bd0                         mov        rdx, rax
03d4e 48b9004072ac5b7f0000           movabs     rcx, 0x7f5bac724000
03d58 4883813801000001               add        qword ptr [rcx + 0x138], 1
03d60 ba05000000                     mov        edx, 5
03d65 48b9e06326e200000000           movabs     rcx, 0xe22663e0
03d6f 488bf0                         mov        rsi, rax
03d72 4889842438020000               mov        qword ptr [rsp + 0x238], rax
03d7a 0f1f440000                     nop        dword ptr [rax + rax]
03d7f e85ce45107                     call       0x7f5bbb90fe60
03d84 0f1f84007c3e001f               nop        dword ptr [rax + rax + 0x1f003e7c]
03d8c 488b842438020000               mov        rax, qword ptr [rsp + 0x238]
03d94 e9ad0c0000                     jmp        0x7f5bb43f26c6
03d99 49bad8e570ac5b7f0000           movabs     r10, 0x7f5bac70e5d8
03da3 4c89542408                     mov        qword ptr [rsp + 8], r10
03da8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03db0 e82b535e07                     call       0x7f5bbb9d6d60
03db5 e9d3c2ffff                     jmp        0x7f5bb43edd0d
03dba 49ba302619ac5b7f0000           movabs     r10, 0x7f5bac192630
03dc4 4c89542408                     mov        qword ptr [rsp + 8], r10
03dc9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03dd1 e80a535e07                     call       0x7f5bbb9d6d60
03dd6 e93cc4ffff                     jmp        0x7f5bb43ede97
03ddb e880f35d07                     call       0x7f5bbb9d0de0
03de0 e87bf35d07                     call       0x7f5bbb9d0de0
03de5 e876f35d07                     call       0x7f5bbb9d0de0
03dea 48891424                       mov        qword ptr [rsp], rdx
03dee 4c89442408                     mov        qword ptr [rsp + 8], r8
03df3 e868ea5d07                     call       0x7f5bbb9d04e0
03df8 e863f35d07                     call       0x7f5bbb9d0de0
03dfd e85ef35d07                     call       0x7f5bbb9d0de0
03e02 48891424                       mov        qword ptr [rsp], rdx
03e06 4c894c2408                     mov        qword ptr [rsp + 8], r9
03e0b e850ea5d07                     call       0x7f5bbb9d04e0
03e10 e84bf35d07                     call       0x7f5bbb9d0de0
03e15 e846f35d07                     call       0x7f5bbb9d0de0
03e1a 48c7042401000000               mov        qword ptr [rsp], 1
03e22 48895c2408                     mov        qword ptr [rsp + 8], rbx
03e27 e834ea5d07                     call       0x7f5bbb9d04e0
03e2c 48c7042402000000               mov        qword ptr [rsp], 2
03e34 48895c2408                     mov        qword ptr [rsp + 8], rbx
03e39 e822ea5d07                     call       0x7f5bbb9d04e0
03e3e 49ba385a63ac5b7f0000           movabs     r10, 0x7f5bac635a38
03e48 4c89542408                     mov        qword ptr [rsp + 8], r10
03e4d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03e55 e886525e07                     call       0x7f5bbb9d6d60
03e5a e94ec9ffff                     jmp        0x7f5bb43ee42d
03e5f 49ba102978ac5b7f0000           movabs     r10, 0x7f5bac782910
03e69 4c89542408                     mov        qword ptr [rsp + 8], r10
03e6e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03e76 e865525e07                     call       0x7f5bbb9d6d60
03e7b e9d2c9ffff                     jmp        0x7f5bb43ee4d2
03e80 49ba30f516ac5b7f0000           movabs     r10, 0x7f5bac16f530
03e8a 4c89542408                     mov        qword ptr [rsp + 8], r10
03e8f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03e97 e844525e07                     call       0x7f5bbb9d6d60
03e9c e9fbc9ffff                     jmp        0x7f5bb43ee51c
03ea1 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
03ea9 e8b2335e07                     call       0x7f5bbb9d4ee0
03eae 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
03eb6 e8a5335e07                     call       0x7f5bbb9d4ee0
03ebb 49ba70cd68ac5b7f0000           movabs     r10, 0x7f5bac68cd70
03ec5 4c89542408                     mov        qword ptr [rsp + 8], r10
03eca 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03ed2 e809525e07                     call       0x7f5bbb9d6d60
03ed7 e998caffff                     jmp        0x7f5bb43ee5f4
03edc 49ba203669ac5b7f0000           movabs     r10, 0x7f5bac693620
03ee6 4c89542408                     mov        qword ptr [rsp + 8], r10
03eeb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03ef3 e8e8515e07                     call       0x7f5bbb9d6d60
03ef8 e9aacaffff                     jmp        0x7f5bb43ee627
03efd 49ba68d76bac5b7f0000           movabs     r10, 0x7f5bac6bd768
03f07 4c89542408                     mov        qword ptr [rsp + 8], r10
03f0c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03f14 e8c7515e07                     call       0x7f5bbb9d6d60
03f19 e900cbffff                     jmp        0x7f5bb43ee69e
03f1e 49ba007463ac5b7f0000           movabs     r10, 0x7f5bac637400
03f28 4c89542408                     mov        qword ptr [rsp + 8], r10
03f2d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03f35 e8a6515e07                     call       0x7f5bbb9d6d60
03f3a e916cbffff                     jmp        0x7f5bb43ee6d5
03f3f 49ba389d6bac5b7f0000           movabs     r10, 0x7f5bac6b9d38
03f49 4c89542408                     mov        qword ptr [rsp + 8], r10
03f4e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03f56 e885515e07                     call       0x7f5bbb9d6d60
03f5b e92dcbffff                     jmp        0x7f5bb43ee70d
03f60 49ba688c63ac5b7f0000           movabs     r10, 0x7f5bac638c68
03f6a 4c89542408                     mov        qword ptr [rsp + 8], r10
03f6f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03f77 e864515e07                     call       0x7f5bbb9d6d60
03f7c e927ccffff                     jmp        0x7f5bb43ee828
03f81 49ba48d640ac5b7f0000           movabs     r10, 0x7f5bac40d648
03f8b 4c89542408                     mov        qword ptr [rsp + 8], r10
03f90 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03f98 e843515e07                     call       0x7f5bbb9d6d60
03f9d e947ccffff                     jmp        0x7f5bb43ee869
03fa2 49bab8af3bac5b7f0000           movabs     r10, 0x7f5bac3bafb8
03fac 4c89542408                     mov        qword ptr [rsp + 8], r10
03fb1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03fb9 e822515e07                     call       0x7f5bbb9d6d60
03fbe e959ccffff                     jmp        0x7f5bb43ee89c
03fc3 48890424                       mov        qword ptr [rsp], rax
03fc7 e894195e07                     call       0x7f5bbb9d35e0
03fcc e88ff15d07                     call       0x7f5bbb9d0de0
03fd1 49bac86763ac5b7f0000           movabs     r10, 0x7f5bac6367c8
03fdb 4c89542408                     mov        qword ptr [rsp + 8], r10
03fe0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03fe8 e8f3505e07                     call       0x7f5bbb9d6d60
03fed e9e0cdffff                     jmp        0x7f5bb43eea52
03ff2 e869f15d07                     call       0x7f5bbb9d0de0
03ff7 49ba102978ac5b7f0000           movabs     r10, 0x7f5bac782910
04001 4c89542408                     mov        qword ptr [rsp + 8], r10
04006 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0400e e8cd505e07                     call       0x7f5bbb9d6d60
04013 e982ceffff                     jmp        0x7f5bb43eeb1a
04018 49ba30f516ac5b7f0000           movabs     r10, 0x7f5bac16f530
04022 4c89542408                     mov        qword ptr [rsp + 8], r10
04027 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0402f e8ac505e07                     call       0x7f5bbb9d6d60
04034 e99fceffff                     jmp        0x7f5bb43eeb58
04039 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04041 e81a325e07                     call       0x7f5bbb9d4ee0
04046 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0404e e80d325e07                     call       0x7f5bbb9d4ee0
04053 e808f15d07                     call       0x7f5bbb9d0de0
04058 49ba688c63ac5b7f0000           movabs     r10, 0x7f5bac638c68
04062 4c89542408                     mov        qword ptr [rsp + 8], r10
04067 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0406f e86c505e07                     call       0x7f5bbb9d6d60
04074 e94ad0ffff                     jmp        0x7f5bb43eed43
04079 49ba48d640ac5b7f0000           movabs     r10, 0x7f5bac40d648
04083 4c89542408                     mov        qword ptr [rsp + 8], r10
04088 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04090 e84b505e07                     call       0x7f5bbb9d6d60
04095 e976d0ffff                     jmp        0x7f5bb43eed90
0409a 49bab8af3bac5b7f0000           movabs     r10, 0x7f5bac3bafb8
040a4 4c89542408                     mov        qword ptr [rsp + 8], r10
040a9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
040b1 e82a505e07                     call       0x7f5bbb9d6d60
040b6 e98dd0ffff                     jmp        0x7f5bb43eedc8
040bb 49ba385a63ac5b7f0000           movabs     r10, 0x7f5bac635a38
040c5 4c89542408                     mov        qword ptr [rsp + 8], r10
040ca 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
040d2 e809505e07                     call       0x7f5bbb9d6d60
040d7 e98bd1ffff                     jmp        0x7f5bb43eeee7
040dc 49ba102978ac5b7f0000           movabs     r10, 0x7f5bac782910
040e6 4c89542408                     mov        qword ptr [rsp + 8], r10
040eb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
040f3 e8e84f5e07                     call       0x7f5bbb9d6d60
040f8 e914d2ffff                     jmp        0x7f5bb43eef91
040fd 49ba30f516ac5b7f0000           movabs     r10, 0x7f5bac16f530
04107 4c89542408                     mov        qword ptr [rsp + 8], r10
0410c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04114 e8c74f5e07                     call       0x7f5bbb9d6d60
04119 e931d2ffff                     jmp        0x7f5bb43eefcf
0411e 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04126 e835315e07                     call       0x7f5bbb9d4ee0
0412b 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04133 e828315e07                     call       0x7f5bbb9d4ee0
04138 49ba70cd68ac5b7f0000           movabs     r10, 0x7f5bac68cd70
04142 4c89542408                     mov        qword ptr [rsp + 8], r10
04147 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0414f e88c4f5e07                     call       0x7f5bbb9d6d60
04154 e9ced2ffff                     jmp        0x7f5bb43ef0a7
04159 49ba203669ac5b7f0000           movabs     r10, 0x7f5bac693620
04163 4c89542408                     mov        qword ptr [rsp + 8], r10
04168 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04170 e86b4f5e07                     call       0x7f5bbb9d6d60
04175 e9e5d2ffff                     jmp        0x7f5bb43ef0df
0417a 49ba68d76bac5b7f0000           movabs     r10, 0x7f5bac6bd768
04184 4c89542408                     mov        qword ptr [rsp + 8], r10
04189 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04191 e84a4f5e07                     call       0x7f5bbb9d6d60
04196 e924d3ffff                     jmp        0x7f5bb43ef13f
0419b 49ba007463ac5b7f0000           movabs     r10, 0x7f5bac637400
041a5 4c89542408                     mov        qword ptr [rsp + 8], r10
041aa 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
041b2 e8294f5e07                     call       0x7f5bbb9d6d60
041b7 e93bd3ffff                     jmp        0x7f5bb43ef177
041bc 49ba389d6bac5b7f0000           movabs     r10, 0x7f5bac6b9d38
041c6 4c89542408                     mov        qword ptr [rsp + 8], r10
041cb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
041d3 e8084f5e07                     call       0x7f5bbb9d6d60
041d8 e952d3ffff                     jmp        0x7f5bb43ef1af
041dd 49ba688c63ac5b7f0000           movabs     r10, 0x7f5bac638c68
041e7 4c89542408                     mov        qword ptr [rsp + 8], r10
041ec 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
041f4 e8e74e5e07                     call       0x7f5bbb9d6d60
041f9 e946d4ffff                     jmp        0x7f5bb43ef2c4
041fe 49ba48d640ac5b7f0000           movabs     r10, 0x7f5bac40d648
04208 4c89542408                     mov        qword ptr [rsp + 8], r10
0420d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04215 e8c64e5e07                     call       0x7f5bbb9d6d60
0421a e96bd4ffff                     jmp        0x7f5bb43ef30a
0421f 49bab8af3bac5b7f0000           movabs     r10, 0x7f5bac3bafb8
04229 4c89542408                     mov        qword ptr [rsp + 8], r10
0422e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04236 e8a54e5e07                     call       0x7f5bbb9d6d60
0423b e982d4ffff                     jmp        0x7f5bb43ef342
04240 48890424                       mov        qword ptr [rsp], rax
04244 e817175e07                     call       0x7f5bbb9d35e0
04249 e812ef5d07                     call       0x7f5bbb9d0de0
0424e 49bac86763ac5b7f0000           movabs     r10, 0x7f5bac6367c8
04258 4c89542408                     mov        qword ptr [rsp + 8], r10
0425d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04265 e8764e5e07                     call       0x7f5bbb9d6d60
0426a e90bd6ffff                     jmp        0x7f5bb43ef4fa
0426f e8ecee5d07                     call       0x7f5bbb9d0de0
04274 49ba102978ac5b7f0000           movabs     r10, 0x7f5bac782910
0427e 4c89542408                     mov        qword ptr [rsp + 8], r10
04283 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0428b e8504e5e07                     call       0x7f5bbb9d6d60
04290 e9add6ffff                     jmp        0x7f5bb43ef5c2
04295 49ba30f516ac5b7f0000           movabs     r10, 0x7f5bac16f530
0429f 4c89542408                     mov        qword ptr [rsp + 8], r10
042a4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
042ac e82f4e5e07                     call       0x7f5bbb9d6d60
042b1 e9cad6ffff                     jmp        0x7f5bb43ef600
042b6 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
042be e89d2f5e07                     call       0x7f5bbb9d4ee0
042c3 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
042cb e8902f5e07                     call       0x7f5bbb9d4ee0
042d0 e88bee5d07                     call       0x7f5bbb9d0de0
042d5 49ba688c63ac5b7f0000           movabs     r10, 0x7f5bac638c68
042df 4c89542408                     mov        qword ptr [rsp + 8], r10
042e4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
042ec e8ef4d5e07                     call       0x7f5bbb9d6d60
042f1 e975d8ffff                     jmp        0x7f5bb43ef7eb
042f6 49ba48d640ac5b7f0000           movabs     r10, 0x7f5bac40d648
04300 4c89542408                     mov        qword ptr [rsp + 8], r10
04305 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0430d e8ce4d5e07                     call       0x7f5bbb9d6d60
04312 e9a1d8ffff                     jmp        0x7f5bb43ef838
04317 49bab8af3bac5b7f0000           movabs     r10, 0x7f5bac3bafb8
04321 4c89542408                     mov        qword ptr [rsp + 8], r10
04326 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0432e e8ad4d5e07                     call       0x7f5bbb9d6d60
04333 e9b8d8ffff                     jmp        0x7f5bb43ef870
04338 49bad8e570ac5b7f0000           movabs     r10, 0x7f5bac70e5d8
04342 4c89542408                     mov        qword ptr [rsp + 8], r10
04347 48c704240a020000               mov        qword ptr [rsp], 0x20a
0434f e88c4d5e07                     call       0x7f5bbb9d6d60
04354 e95cd9ffff                     jmp        0x7f5bb43ef935
04359 660f1f440000                   nop        word ptr [rax + rax]
0435f e87ce85107                     call       0x7f5bbb910860
04364 e93ddaffff                     jmp        0x7f5bb43efa26
04369 660f1f440000                   nop        word ptr [rax + rax]
0436f e86ce85107                     call       0x7f5bbb910860
04374 e9badbffff                     jmp        0x7f5bb43efbb3
04379 49ba680d71ac5b7f0000           movabs     r10, 0x7f5bac710d68
04383 4c89542408                     mov        qword ptr [rsp + 8], r10
04388 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04390 e84b4d5e07                     call       0x7f5bbb9d6d60
04395 e918dcffff                     jmp        0x7f5bb43efc32
0439a 49b80000000000000000           movabs     r8, 0
043a4 b8000f050a                     mov        eax, 0xa050f00
043a9 e832445e07                     call       0x7f5bbb9d6460
043ae e905dcffff                     jmp        0x7f5bb43efc38
043b3 49bad8e570ac5b7f0000           movabs     r10, 0x7f5bac70e5d8
043bd 4c89542408                     mov        qword ptr [rsp + 8], r10
043c2 48c70424aa020000               mov        qword ptr [rsp], 0x2aa
043ca e8114d5e07                     call       0x7f5bbb9d6d60
043cf e928ddffff                     jmp        0x7f5bb43efd7c
043d4 49ba385a63ac5b7f0000           movabs     r10, 0x7f5bac635a38
043de 4c89542408                     mov        qword ptr [rsp + 8], r10
043e3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
043eb e8f04c5e07                     call       0x7f5bbb9d6d60
043f0 e9fdddffff                     jmp        0x7f5bb43efe72
043f5 e866ed5d07                     call       0x7f5bbb9d0de0
043fa 49ba102978ac5b7f0000           movabs     r10, 0x7f5bac782910
04404 4c89542408                     mov        qword ptr [rsp + 8], r10
04409 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04411 e8ca4c5e07                     call       0x7f5bbb9d6d60
04416 e980deffff                     jmp        0x7f5bb43eff1b
0441b 49ba30f516ac5b7f0000           movabs     r10, 0x7f5bac16f530
04425 4c89542408                     mov        qword ptr [rsp + 8], r10
0442a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04432 e8a94c5e07                     call       0x7f5bbb9d6d60
04437 e998deffff                     jmp        0x7f5bb43eff54
0443c 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04444 e8172e5e07                     call       0x7f5bbb9d4ee0
04449 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04451 e80a2e5e07                     call       0x7f5bbb9d4ee0
04456 49ba70cd68ac5b7f0000           movabs     r10, 0x7f5bac68cd70
04460 4c89542408                     mov        qword ptr [rsp + 8], r10
04465 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0446d e86e4c5e07                     call       0x7f5bbb9d6d60
04472 e92cdfffff                     jmp        0x7f5bb43f0023
04477 49ba203669ac5b7f0000           movabs     r10, 0x7f5bac693620
04481 4c89542408                     mov        qword ptr [rsp + 8], r10
04486 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0448e e84d4c5e07                     call       0x7f5bbb9d6d60
04493 e93edfffff                     jmp        0x7f5bb43f0056
04498 49ba68d76bac5b7f0000           movabs     r10, 0x7f5bac6bd768
044a2 4c89542408                     mov        qword ptr [rsp + 8], r10
044a7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044af e82c4c5e07                     call       0x7f5bbb9d6d60
044b4 e981dfffff                     jmp        0x7f5bb43f00ba
044b9 49ba007463ac5b7f0000           movabs     r10, 0x7f5bac637400
044c3 4c89542408                     mov        qword ptr [rsp + 8], r10
044c8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044d0 e80b4c5e07                     call       0x7f5bbb9d6d60
044d5 e99bdfffff                     jmp        0x7f5bb43f00f5
044da 49ba389d6bac5b7f0000           movabs     r10, 0x7f5bac6b9d38
044e4 4c89542408                     mov        qword ptr [rsp + 8], r10
044e9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044f1 e8ea4b5e07                     call       0x7f5bbb9d6d60
044f6 e9addfffff                     jmp        0x7f5bb43f0128
044fb 49ba688c63ac5b7f0000           movabs     r10, 0x7f5bac638c68
04505 4c89542408                     mov        qword ptr [rsp + 8], r10
0450a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04512 e8c94b5e07                     call       0x7f5bbb9d6d60
04517 e99ce0ffff                     jmp        0x7f5bb43f0238
0451c 49ba48d640ac5b7f0000           movabs     r10, 0x7f5bac40d648
04526 4c89542408                     mov        qword ptr [rsp + 8], r10
0452b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04533 e8a84b5e07                     call       0x7f5bbb9d6d60
04538 e9bce0ffff                     jmp        0x7f5bb43f0279
0453d 49bab8af3bac5b7f0000           movabs     r10, 0x7f5bac3bafb8
04547 4c89542408                     mov        qword ptr [rsp + 8], r10
0454c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04554 e8874b5e07                     call       0x7f5bbb9d6d60
04559 e9cee0ffff                     jmp        0x7f5bb43f02ac
0455e 48890424                       mov        qword ptr [rsp], rax
04562 e8f9135e07                     call       0x7f5bbb9d35e0
04567 e8f4eb5d07                     call       0x7f5bbb9d0de0
0456c 49bac86763ac5b7f0000           movabs     r10, 0x7f5bac6367c8
04576 4c89542408                     mov        qword ptr [rsp + 8], r10
0457b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04583 e8584b5e07                     call       0x7f5bbb9d6d60
04588 e955e2ffff                     jmp        0x7f5bb43f0462
0458d 49ba102978ac5b7f0000           movabs     r10, 0x7f5bac782910
04597 4c89542408                     mov        qword ptr [rsp + 8], r10
0459c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045a4 e8374b5e07                     call       0x7f5bbb9d6d60
045a9 e9f1e2ffff                     jmp        0x7f5bb43f051f
045ae 49ba30f516ac5b7f0000           movabs     r10, 0x7f5bac16f530
045b8 4c89542408                     mov        qword ptr [rsp + 8], r10
045bd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045c5 e8164b5e07                     call       0x7f5bbb9d6d60
045ca e917e3ffff                     jmp        0x7f5bb43f0566
045cf 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
045d7 e8842c5e07                     call       0x7f5bbb9d4ee0
045dc 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
045e4 e8772c5e07                     call       0x7f5bbb9d4ee0
045e9 e872eb5d07                     call       0x7f5bbb9d0de0
045ee 49ba688c63ac5b7f0000           movabs     r10, 0x7f5bac638c68
045f8 4c89542408                     mov        qword ptr [rsp + 8], r10
045fd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04605 e8d64a5e07                     call       0x7f5bbb9d6d60
0460a e9c4e4ffff                     jmp        0x7f5bb43f0753
0460f 49ba48d640ac5b7f0000           movabs     r10, 0x7f5bac40d648
04619 4c89542408                     mov        qword ptr [rsp + 8], r10
0461e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04626 e8b54a5e07                     call       0x7f5bbb9d6d60
0462b e9f0e4ffff                     jmp        0x7f5bb43f07a0
04630 49bab8af3bac5b7f0000           movabs     r10, 0x7f5bac3bafb8
0463a 4c89542408                     mov        qword ptr [rsp + 8], r10
0463f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04647 e8944a5e07                     call       0x7f5bbb9d6d60
0464c e907e5ffff                     jmp        0x7f5bb43f07d8
04651 49bad8e570ac5b7f0000           movabs     r10, 0x7f5bac70e5d8
0465b 4c89542408                     mov        qword ptr [rsp + 8], r10
04660 48c70424e8020000               mov        qword ptr [rsp], 0x2e8
04668 e8734a5e07                     call       0x7f5bbb9d6d60
0466d e9a8e5ffff                     jmp        0x7f5bb43f089a
04672 49ba680d71ac5b7f0000           movabs     r10, 0x7f5bac710d68
0467c 4c89542408                     mov        qword ptr [rsp + 8], r10
04681 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04689 e8524a5e07                     call       0x7f5bbb9d6d60
0468e e967e6ffff                     jmp        0x7f5bb43f097a
04693 49b80000000000000000           movabs     r8, 0
0469d b8000f050a                     mov        eax, 0xa050f00
046a2 e839415e07                     call       0x7f5bbb9d6460
046a7 e954e6ffff                     jmp        0x7f5bb43f0980
046ac 49bad8e570ac5b7f0000           movabs     r10, 0x7f5bac70e5d8
046b6 4c89542408                     mov        qword ptr [rsp + 8], r10
046bb 48c7042420030000               mov        qword ptr [rsp], 0x320
046c3 e8184a5e07                     call       0x7f5bbb9d6d60
046c8 e977e7ffff                     jmp        0x7f5bb43f0ac4
046cd 49ba385a63ac5b7f0000           movabs     r10, 0x7f5bac635a38
046d7 4c89542408                     mov        qword ptr [rsp + 8], r10
046dc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046e4 e8f7495e07                     call       0x7f5bbb9d6d60
046e9 e937e8ffff                     jmp        0x7f5bb43f0ba5
046ee e86dea5d07                     call       0x7f5bbb9d0de0
046f3 49ba102978ac5b7f0000           movabs     r10, 0x7f5bac782910
046fd 4c89542408                     mov        qword ptr [rsp + 8], r10
04702 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0470a e8d1495e07                     call       0x7f5bbb9d6d60
0470f e9b9e8ffff                     jmp        0x7f5bb43f0c4d
04714 49ba30f516ac5b7f0000           movabs     r10, 0x7f5bac16f530
0471e 4c89542408                     mov        qword ptr [rsp + 8], r10
04723 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0472b e8b0495e07                     call       0x7f5bbb9d6d60
04730 e9d1e8ffff                     jmp        0x7f5bb43f0c86
04735 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0473d e81e2b5e07                     call       0x7f5bbb9d4ee0
04742 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0474a e8112b5e07                     call       0x7f5bbb9d4ee0
0474f 49ba70cd68ac5b7f0000           movabs     r10, 0x7f5bac68cd70
04759 4c89542408                     mov        qword ptr [rsp + 8], r10
0475e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04766 e875495e07                     call       0x7f5bbb9d6d60
0476b e95de9ffff                     jmp        0x7f5bb43f0d4d
04770 49ba203669ac5b7f0000           movabs     r10, 0x7f5bac693620
0477a 4c89542408                     mov        qword ptr [rsp + 8], r10
0477f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04787 e854495e07                     call       0x7f5bbb9d6d60
0478c e96fe9ffff                     jmp        0x7f5bb43f0d80
04791 49ba68d76bac5b7f0000           movabs     r10, 0x7f5bac6bd768
0479b 4c89542408                     mov        qword ptr [rsp + 8], r10
047a0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047a8 e833495e07                     call       0x7f5bbb9d6d60
047ad e9a5e9ffff                     jmp        0x7f5bb43f0dd7
047b2 49ba007463ac5b7f0000           movabs     r10, 0x7f5bac637400
047bc 4c89542408                     mov        qword ptr [rsp + 8], r10
047c1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047c9 e812495e07                     call       0x7f5bbb9d6d60
047ce e9bae9ffff                     jmp        0x7f5bb43f0e0d
047d3 49ba389d6bac5b7f0000           movabs     r10, 0x7f5bac6b9d38
047dd 4c89542408                     mov        qword ptr [rsp + 8], r10
047e2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047ea e8f1485e07                     call       0x7f5bbb9d6d60
047ef e9cce9ffff                     jmp        0x7f5bb43f0e40
047f4 49ba688c63ac5b7f0000           movabs     r10, 0x7f5bac638c68
047fe 4c89542408                     mov        qword ptr [rsp + 8], r10
04803 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0480b e8d0485e07                     call       0x7f5bbb9d6d60
04810 e9bbeaffff                     jmp        0x7f5bb43f0f50
04815 49ba48d640ac5b7f0000           movabs     r10, 0x7f5bac40d648
0481f 4c89542408                     mov        qword ptr [rsp + 8], r10
04824 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0482c e8af485e07                     call       0x7f5bbb9d6d60
04831 e9dbeaffff                     jmp        0x7f5bb43f0f91
04836 49bab8af3bac5b7f0000           movabs     r10, 0x7f5bac3bafb8
04840 4c89542408                     mov        qword ptr [rsp + 8], r10
04845 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0484d e88e485e07                     call       0x7f5bbb9d6d60
04852 e9edeaffff                     jmp        0x7f5bb43f0fc4
04857 48890424                       mov        qword ptr [rsp], rax
0485b e800115e07                     call       0x7f5bbb9d35e0
04860 e8fbe85d07                     call       0x7f5bbb9d0de0
04865 49bac86763ac5b7f0000           movabs     r10, 0x7f5bac6367c8
0486f 4c89542408                     mov        qword ptr [rsp + 8], r10
04874 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0487c e85f485e07                     call       0x7f5bbb9d6d60
04881 e974ecffff                     jmp        0x7f5bb43f117a
04886 49ba102978ac5b7f0000           movabs     r10, 0x7f5bac782910
04890 4c89542408                     mov        qword ptr [rsp + 8], r10
04895 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0489d e83e485e07                     call       0x7f5bbb9d6d60
048a2 e910edffff                     jmp        0x7f5bb43f1237
048a7 49ba30f516ac5b7f0000           movabs     r10, 0x7f5bac16f530
048b1 4c89542408                     mov        qword ptr [rsp + 8], r10
048b6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048be e81d485e07                     call       0x7f5bbb9d6d60
048c3 e933edffff                     jmp        0x7f5bb43f127b
048c8 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
048d0 e88b295e07                     call       0x7f5bbb9d4ee0
048d5 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
048dd e87e295e07                     call       0x7f5bbb9d4ee0
048e2 e879e85d07                     call       0x7f5bbb9d0de0
048e7 49ba688c63ac5b7f0000           movabs     r10, 0x7f5bac638c68
048f1 4c89542408                     mov        qword ptr [rsp + 8], r10
048f6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048fe e8dd475e07                     call       0x7f5bbb9d6d60
04903 e9dbeeffff                     jmp        0x7f5bb43f1463
04908 49ba48d640ac5b7f0000           movabs     r10, 0x7f5bac40d648
04912 4c89542408                     mov        qword ptr [rsp + 8], r10
04917 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0491f e8bc475e07                     call       0x7f5bbb9d6d60
04924 e907efffff                     jmp        0x7f5bb43f14b0
04929 49bab8af3bac5b7f0000           movabs     r10, 0x7f5bac3bafb8
04933 4c89542408                     mov        qword ptr [rsp + 8], r10
04938 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04940 e89b475e07                     call       0x7f5bbb9d6d60
04945 e91eefffff                     jmp        0x7f5bb43f14e8
0494a 49bad8e570ac5b7f0000           movabs     r10, 0x7f5bac70e5d8
04954 4c89542408                     mov        qword ptr [rsp + 8], r10
04959 48c704245a030000               mov        qword ptr [rsp], 0x35a
04961 e87a475e07                     call       0x7f5bbb9d6d60
04966 e9d4efffff                     jmp        0x7f5bb43f15bf
0496b 0f1f4000                       nop        dword ptr [rax]
0496f e86ce25107                     call       0x7f5bbb910860
04974 e992f1ffff                     jmp        0x7f5bb43f178b
04979 49baac173fb45b7f0000           movabs     r10, 0x7f5bb43f17ac
04983 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0498a e9d1085207                     jmp        0x7f5bbb912ee0
0498f 48ba0000000000000000           movabs     rdx, 0
04999 b8000f050a                     mov        eax, 0xa050f00
0499e e83d325e07                     call       0x7f5bbb9d5860
049a3 e9b8f1ffff                     jmp        0x7f5bb43f17e0
049a8 e8b3e75d07                     call       0x7f5bbb9d0de0
049ad 488bd2                         mov        rdx, rdx
049b0 e82bf55d07                     call       0x7f5bbb9d1b60
049b5 e9f9f1ffff                     jmp        0x7f5bb43f1833
049ba 48ba0000000000000000           movabs     rdx, 0
049c4 b8000f050a                     mov        eax, 0xa050f00
049c9 e8123e5e07                     call       0x7f5bbb9d6460
049ce e9e5f1ffff                     jmp        0x7f5bb43f1838
049d3 48ba0000000000000000           movabs     rdx, 0
049dd b8000f050a                     mov        eax, 0xa050f00
049e2 e8f9315e07                     call       0x7f5bbb9d5860
049e7 e964f2ffff                     jmp        0x7f5bb43f18d0
049ec e86fe75d07                     call       0x7f5bbb9d0de0
049f1 488bd2                         mov        rdx, rdx
049f4 e8e7f45d07                     call       0x7f5bbb9d1b60
049f9 e9a5f2ffff                     jmp        0x7f5bb43f1923
049fe 48ba0000000000000000           movabs     rdx, 0
04a08 b8000f050a                     mov        eax, 0xa050f00
04a0d e8ce315e07                     call       0x7f5bbb9d5860
04a12 e9e1f2ffff                     jmp        0x7f5bb43f1978
04a17 e844e75d07                     call       0x7f5bbb9d0de0
04a1c 488bd2                         mov        rdx, rdx
04a1f e8bcf45d07                     call       0x7f5bbb9d1b60
04a24 e922f3ffff                     jmp        0x7f5bb43f19cb
04a29 498b8778050000                 mov        rax, qword ptr [r15 + 0x578]
04a30 49c7877805000000000000         mov        qword ptr [r15 + 0x578], 0
04a3b 49c7878005000000000000         mov        qword ptr [r15 + 0x580], 0
04a46 4881c450020000                 add        rsp, 0x250
04a4d 5d                             pop        rbp
04a4e e90dd85d07                     jmp        0x7f5bbb9cfee0
04a53 f4                             hlt        
04a54 f4                             hlt        
04a55 f4                             hlt        
04a56 f4                             hlt        
04a57 f4                             hlt        
