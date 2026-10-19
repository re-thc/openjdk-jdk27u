00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c0b05007                   jne        0x7f1e7f90f960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ec50020000                 sub        rsp, 0x250
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 7405                           je         0x7f1e784048bf
0003a e8e1b14f07                     call       0x7f1e7f8ffaa0
0003f 4889b42448010000               mov        qword ptr [rsp + 0x148], rsi
00047 4889942468010000               mov        qword ptr [rsp + 0x168], rdx
0004f 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
00056 4c89842428010000               mov        qword ptr [rsp + 0x128], r8
0005e 4c898c2420010000               mov        qword ptr [rsp + 0x120], r9
00066 89bc2430010000                 mov        dword ptr [rsp + 0x130], edi
0006d 48bbe06a72701e7f0000           movabs     rbx, 0x7f1e70726ae0
00077 8b4370                         mov        eax, dword ptr [rbx + 0x70]
0007a 83c002                         add        eax, 2
0007d 894370                         mov        dword ptr [rbx + 0x70], eax
00080 25fe070000                     and        eax, 0x7fe
00085 85c0                           test       eax, eax
00087 0f840c420000                   je         0x7f1e78408b19
0008d 48bbe06a72701e7f0000           movabs     rbx, 0x7f1e70726ae0
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
000e1 48b8e06a72701e7f0000           movabs     rax, 0x7f1e70726ae0
000eb b9f8000000                     mov        ecx, 0xf8
000f0 7f05                           jg         0x7f1e78404977
000f2 b908010000                     mov        ecx, 0x108
000f7 44899c2440010000               mov        dword ptr [rsp + 0x140], r11d
000ff 4c8b1c08                       mov        r11, qword ptr [rax + rcx]
00103 4d8d5b01                       lea        r11, [r11 + 1]
00107 4c891c08                       mov        qword ptr [rax + rcx], r11
0010b 0f8fe0400000                   jg         0x7f1e78408a71
00111 4863db                         movsxd     rbx, ebx
00114 488b4e20                       mov        rcx, qword ptr [rsi + 0x20]
00118 482bcf                         sub        rcx, rdi
0011b 483bcb                         cmp        rcx, rbx
0011e 48b9e06a72701e7f0000           movabs     rcx, 0x7f1e70726ae0
00128 b828010000                     mov        eax, 0x128
0012d 7c05                           jl         0x7f1e784049b4
0012f b818010000                     mov        eax, 0x118
00134 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
00138 4d8d5b01                       lea        r11, [r11 + 1]
0013c 4c891c01                       mov        qword ptr [rcx + rax], r11
00140 0f8cab400000                   jl         0x7f1e78408a71
00146 48b9e06a72701e7f0000           movabs     rcx, 0x7f1e70726ae0
00150 ff8158010000                   inc        dword ptr [rcx + 0x158]
00156 b900000000                     mov        ecx, 0
0015b 498bc0                         mov        rax, r8
0015e 483bc1                         cmp        rax, rcx
00161 48b9e06a72701e7f0000           movabs     rcx, 0x7f1e70726ae0
0016b b868010000                     mov        eax, 0x168
00170 7505                           jne        0x7f1e784049f7
00172 b878010000                     mov        eax, 0x178
00177 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
0017b 4d8d5b01                       lea        r11, [r11 + 1]
0017f 4c891c01                       mov        qword ptr [rcx + rax], r11
00183 0f8531000000                   jne        0x7f1e78404a3a
00189 4803df                         add        rbx, rdi
0018c 498bc9                         mov        rcx, r9
0018f 483bcb                         cmp        rcx, rbx
00192 48b9e06a72701e7f0000           movabs     rcx, 0x7f1e70726ae0
0019c bf98010000                     mov        edi, 0x198
001a1 7d05                           jge        0x7f1e78404a28
001a3 bf88010000                     mov        edi, 0x188
001a8 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
001ac 488d5b01                       lea        rbx, [rbx + 1]
001b0 48891c39                       mov        qword ptr [rcx + rdi], rbx
001b4 0f8d0a000000                   jge        0x7f1e78404a44
001ba bf00000000                     mov        edi, 0
001bf e915000000                     jmp        0x7f1e78404a59
001c4 48b9e06a72701e7f0000           movabs     rcx, 0x7f1e70726ae0
001ce ff81a8010000                   inc        dword ptr [rcx + 0x1a8]
001d4 bf01000000                     mov        edi, 1
001d9 4d2bc6                         sub        r8, r14
001dc 4c89842480010000               mov        qword ptr [rsp + 0x180], r8
001e4 48b9e06a72701e7f0000           movabs     rcx, 0x7f1e70726ae0
001ee 488381c001000001               add        qword ptr [rcx + 0x1c0], 1
001f6 48b9a89379701e7f0000           movabs     rcx, 0x7f1e707993a8
00200 8b5970                         mov        ebx, dword ptr [rcx + 0x70]
00203 83c302                         add        ebx, 2
00206 895970                         mov        dword ptr [rcx + 0x70], ebx
00209 81e3feff1f00                   and        ebx, 0x1ffffe
0020f 85db                           test       ebx, ebx
00211 0f84a3400000                   je         0x7f1e78408b3a
00217 48b9ffffffffffffff7f           movabs     rcx, 0x7fffffffffffffff
00221 493bc9                         cmp        rcx, r9
00224 48b9a89379701e7f0000           movabs     rcx, 0x7f1e707993a8
0022e bbb8000000                     mov        ebx, 0xb8
00233 7d05                           jge        0x7f1e78404aba
00235 bba8000000                     mov        ebx, 0xa8
0023a 488b0419                       mov        rax, qword ptr [rcx + rbx]
0023e 488d4001                       lea        rax, [rax + 1]
00242 48890419                       mov        qword ptr [rcx + rbx], rax
00246 0f8d0f000000                   jge        0x7f1e78404adb
0024c 49b9ffffffffffffff7f           movabs     r9, 0x7fffffffffffffff
00256 e910000000                     jmp        0x7f1e78404aeb
0025b 48b9a89379701e7f0000           movabs     rcx, 0x7f1e707993a8
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
002f2 48bfe06a72701e7f0000           movabs     rdi, 0x7f1e70726ae0
002fc b8d0010000                     mov        eax, 0x1d0
00301 7d05                           jge        0x7f1e78404b88
00303 b8e0010000                     mov        eax, 0x1e0
00308 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
0030c 4d8d5b01                       lea        r11, [r11 + 1]
00310 4c891c07                       mov        qword ptr [rdi + rax], r11
00314 0f8d223c0000                   jge        0x7f1e784087bc
0031a 413b5008                       cmp        edx, dword ptr [r8 + 8]
0031e 0f83c63f0000                   jae        0x7f1e78408b6a
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
00367 48b9e06a72701e7f0000           movabs     rcx, 0x7f1e70726ae0
00371 41b8f0010000                   mov        r8d, 0x1f0
00377 7d06                           jge        0x7f1e78404bff
00379 41b800020000                   mov        r8d, 0x200
0037f 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00383 4d8d6d01                       lea        r13, [r13 + 1]
00387 4e892c01                       mov        qword ptr [rcx + r8], r13
0038b 0f8d15000000                   jge        0x7f1e78404c26
00391 413b5108                       cmp        edx, dword ptr [r9 + 8]
00395 0f83673f0000                   jae        0x7f1e78408b82
0039b 4863ca                         movsxd     rcx, edx
0039e 418b4c890c                     mov        ecx, dword ptr [r9 + rcx*4 + 0xc]
003a3 488bc1                         mov        rax, rcx
003a6 85ff                           test       edi, edi
003a8 48b9e06a72701e7f0000           movabs     rcx, 0x7f1e70726ae0
003b2 41b810020000                   mov        r8d, 0x210
003b8 7406                           je         0x7f1e78404c40
003ba 41b820020000                   mov        r8d, 0x220
003c0 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003c4 4d8d6d01                       lea        r13, [r13 + 1]
003c8 4e892c01                       mov        qword ptr [rcx + r8], r13
003cc 0f8431000000                   je         0x7f1e78404c83
003d2 498bcb                         mov        rcx, r11
003d5 2bce                           sub        ecx, esi
003d7 3bf9                           cmp        edi, ecx
003d9 48b9e06a72701e7f0000           movabs     rcx, 0x7f1e70726ae0
003e3 41b840020000                   mov        r8d, 0x240
003e9 7f06                           jg         0x7f1e78404c71
003eb 41b830020000                   mov        r8d, 0x230
003f1 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003f5 4d8d6d01                       lea        r13, [r13 + 1]
003f9 4e892c01                       mov        qword ptr [rcx + r8], r13
003fd 0f8f463d0000                   jg         0x7f1e784089c9
00403 83f803                         cmp        eax, 3
00406 48b9e06a72701e7f0000           movabs     rcx, 0x7f1e70726ae0
00410 41b860020000                   mov        r8d, 0x260
00416 7e06                           jle        0x7f1e78404c9e
00418 41b870020000                   mov        r8d, 0x270
0041e 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00422 4d8d6d01                       lea        r13, [r13 + 1]
00426 4e892c01                       mov        qword ptr [rcx + r8], r13
0042a 0f8e59000000                   jle        0x7f1e78404d09
00430 83e803                         sub        eax, 3
00433 837b0801                       cmp        dword ptr [rbx + 8], 1
00437 0f86dd3e0000                   jbe        0x7f1e78408b9a
0043d 8b4b10                         mov        ecx, dword ptr [rbx + 0x10]
00440 837b0802                       cmp        dword ptr [rbx + 8], 2
00444 0f86e23e0000                   jbe        0x7f1e78408bac
0044a 894b14                         mov        dword ptr [rbx + 0x14], ecx
0044d 8b4b0c                         mov        ecx, dword ptr [rbx + 0xc]
00450 894b10                         mov        dword ptr [rbx + 0x10], ecx
00453 89430c                         mov        dword ptr [rbx + 0xc], eax
00456 48b9e06a72701e7f0000           movabs     rcx, 0x7f1e70726ae0
00460 ff8180020000                   inc        dword ptr [rcx + 0x280]
00466 89942444010000                 mov        dword ptr [rsp + 0x144], edx
0046d 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
00474 4c8bb42488010000               mov        r14, qword ptr [rsp + 0x188]
0047c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
00484 e952000000                     jmp        0x7f1e78404d5b
00489 89942444010000                 mov        dword ptr [rsp + 0x144], edx
00490 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
00497 49b8e06a72701e7f0000           movabs     r8, 0x7f1e70726ae0
004a1 4983809802000001               add        qword ptr [r8 + 0x298], 1
004a9 488bf3                         mov        rsi, rbx
004ac 488bd0                         mov        rdx, rax
004af 488bcf                         mov        rcx, rdi
004b2 0f1f440000                     nop        dword ptr [rax + rax]
004b7 e824bb5007                     call       0x7f1e7f910860
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
004f0 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
004fa b9b8020000                     mov        ecx, 0x2b8
004ff 7d05                           jge        0x7f1e78404d86
00501 b9a8020000                     mov        ecx, 0x2a8
00506 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0050a 4d8d4001                       lea        r8, [r8 + 1]
0050e 4c89040a                       mov        qword ptr [rdx + rcx], r8
00512 0f8d15000000                   jge        0x7f1e78404dad
00518 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00520 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00528 e9ad000000                     jmp        0x7f1e78404e5a
0052d 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00535 4585ed                         test       r13d, r13d
00538 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
00542 b9c8020000                     mov        ecx, 0x2c8
00547 7505                           jne        0x7f1e78404dce
00549 b9d8020000                     mov        ecx, 0x2d8
0054e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
00552 4d8d4001                       lea        r8, [r8 + 1]
00556 4c89040a                       mov        qword ptr [rdx + rcx], r8
0055a 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00562 0f8568000000                   jne        0x7f1e78404e50
00568 498bd3                         mov        rdx, r11
0056b 03d7                           add        edx, edi
0056d 2bd0                           sub        edx, eax
0056f 4863d2                         movsxd     rdx, edx
00572 493bd0                         cmp        rdx, r8
00575 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
0057f b9e8020000                     mov        ecx, 0x2e8
00584 7c05                           jl         0x7f1e78404e0b
00586 b9f8020000                     mov        ecx, 0x2f8
0058b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0058f 4d8d4901                       lea        r9, [r9 + 1]
00593 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00597 0f8c3d000000                   jl         0x7f1e78404e5a
0059d 4c8b8c2450010000               mov        r9, qword ptr [rsp + 0x150]
005a5 4c3bcb                         cmp        r9, rbx
005a8 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
005b2 b918030000                     mov        ecx, 0x318
005b7 7c05                           jl         0x7f1e78404e3e
005b9 b908030000                     mov        ecx, 0x308
005be 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
005c2 4d8d4901                       lea        r9, [r9 + 1]
005c6 4c890c0a                       mov        qword ptr [rdx + rcx], r9
005ca 0f8c0a000000                   jl         0x7f1e78404e5a
005d0 ba00000000                     mov        edx, 0
005d5 e915000000                     jmp        0x7f1e78404e6f
005da 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
005e4 ff8228030000                   inc        dword ptr [rdx + 0x328]
005ea ba01000000                     mov        edx, 1
005ef 48899c2498010000               mov        qword ptr [rsp + 0x198], rbx
005f7 85c0                           test       eax, eax
005f9 48b9e06a72701e7f0000           movabs     rcx, 0x7f1e70726ae0
00603 41b940030000                   mov        r9d, 0x340
00609 7e06                           jle        0x7f1e78404e91
0060b 41b950030000                   mov        r9d, 0x350
00611 4a8b1c09                       mov        rbx, qword ptr [rcx + r9]
00615 488d5b01                       lea        rbx, [rbx + 1]
00619 4a891c09                       mov        qword ptr [rcx + r9], rbx
0061d 0f8e6f380000                   jle        0x7f1e78408712
00623 85d2                           test       edx, edx
00625 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
0062f b970030000                     mov        ecx, 0x370
00634 7505                           jne        0x7f1e78404ebb
00636 b960030000                     mov        ecx, 0x360
0063b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0063f 4d8d4901                       lea        r9, [r9 + 1]
00643 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00647 0f8545380000                   jne        0x7f1e78408712
0064d 498bdb                         mov        rbx, r11
00650 03df                           add        ebx, edi
00652 899c24a0010000                 mov        dword ptr [rsp + 0x1a0], ebx
00659 488bf3                         mov        rsi, rbx
0065c 03b42478010000                 add        esi, dword ptr [rsp + 0x178]
00663 3bb42458010000                 cmp        esi, dword ptr [rsp + 0x158]
0066a 48bee06a72701e7f0000           movabs     rsi, 0x7f1e70726ae0
00674 ba28040000                     mov        edx, 0x428
00679 7f05                           jg         0x7f1e78404f00
0067b ba38040000                     mov        edx, 0x438
00680 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
00684 488d4901                       lea        rcx, [rcx + 1]
00688 48890c16                       mov        qword ptr [rsi + rdx], rcx
0068c 0f8f3f000000                   jg         0x7f1e78404f51
00692 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
00699 03f7                           add        esi, edi
0069b 89b424a4010000                 mov        dword ptr [rsp + 0x1a4], esi
006a2 3bb4245c010000                 cmp        esi, dword ptr [rsp + 0x15c]
006a9 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
006b3 b958040000                     mov        ecx, 0x458
006b8 7e05                           jle        0x7f1e78404f3f
006ba b948040000                     mov        ecx, 0x448
006bf 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
006c3 4d8d4901                       lea        r9, [r9 + 1]
006c7 4c890c0a                       mov        qword ptr [rdx + rcx], r9
006cb 0f8e76000000                   jle        0x7f1e78404fc7
006d1 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
006d9 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
006e1 48bee06a72701e7f0000           movabs     rsi, 0x7f1e70726ae0
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
00727 e8b4b85007                     call       0x7f1e7f910860
0072c 0f1f840024080001               nop        dword ptr [rax + rax + 0x1000824]
00734 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
0073b 03b4247c010000                 add        esi, dword ptr [rsp + 0x17c]
00742 e9c9360000                     jmp        0x7f1e78408690
00747 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
0074f 83ff10                         cmp        edi, 0x10
00752 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
0075c b968040000                     mov        ecx, 0x468
00761 7f05                           jg         0x7f1e78404fe8
00763 b978040000                     mov        ecx, 0x478
00768 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0076c 4d8d4901                       lea        r9, [r9 + 1]
00770 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00774 0f8f4f0a0000                   jg         0x7f1e78405a49
0077a 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
00784 4883828804000001               add        qword ptr [rdx + 0x488], 1
0078c 48ba284279701e7f0000           movabs     rdx, 0x7f1e70794228
00796 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00799 83c102                         add        ecx, 2
0079c 894a70                         mov        dword ptr [rdx + 0x70], ecx
0079f 81e1feff1f00                   and        ecx, 0x1ffffe
007a5 85c9                           test       ecx, ecx
007a7 0f84913b0000                   je         0x7f1e78408bbe
007ad 48ba50f237e300000000           movabs     rdx, 0xe337f250
007b7 48b9284279701e7f0000           movabs     rcx, 0x7f1e70794228
007c1 488b12                         mov        rdx, qword ptr [rdx]
007c4 48c1ea2a                       shr        rdx, 0x2a
007c8 48c1e209                       shl        rdx, 9
007cc 41ba00000058                   mov        r10d, 0x58000000
007d2 4903d2                         add        rdx, r10
007d5 41ba16000000                   mov        r10d, 0x16
007db 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
007df 7435                           je         0x7f1e78405096
007e1 4983c202                       add        r10, 2
007e5 4983fa1a                       cmp        r10, 0x1a
007e9 75f0                           jne        0x7f1e7840505b
007eb 41ba16000000                   mov        r10d, 0x16
007f1 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
007f6 7412                           je         0x7f1e7840508a
007f8 4983c202                       add        r10, 2
007fc 4983fa1a                       cmp        r10, 0x1a
00800 75ef                           jne        0x7f1e78405071
00802 41ba15000000                   mov        r10d, 0x15
00808 eb10                           jmp        0x7f1e7840509a
0080a 50                             push       rax
0080b 4833c0                         xor        rax, rax
0080e 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
00813 58                             pop        rax
00814 ebbf                           jmp        0x7f1e78405055
00816 4983c201                       add        r10, 1
0081a 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0081f 48ba284279701e7f0000           movabs     rdx, 0x7f1e70794228
00829 488382d800000001               add        qword ptr [rdx + 0xd8], 1
00831 48bac03779701e7f0000           movabs     rdx, 0x7f1e707937c0
0083b 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0083e 83c102                         add        ecx, 2
00841 894a70                         mov        dword ptr [rdx + 0x70], ecx
00844 81e1feff1f00                   and        ecx, 0x1ffffe
0084a 85c9                           test       ecx, ecx
0084c 0f840d3b0000                   je         0x7f1e78408bdf
00852 448bac2490010000               mov        r13d, dword ptr [rsp + 0x190]
0085a 48bac03779701e7f0000           movabs     rdx, 0x7f1e707937c0
00864 4883820801000001               add        qword ptr [rdx + 0x108], 1
0086c 8b942464010000                 mov        edx, dword ptr [rsp + 0x164]
00873 83ea0f                         sub        edx, 0xf
00876 48b9902e79701e7f0000           movabs     rcx, 0x7f1e70792e90
00880 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00884 4183c102                       add        r9d, 2
00888 44894970                       mov        dword ptr [rcx + 0x70], r9d
0088c 4181e1feff1f00                 and        r9d, 0x1ffffe
00893 4585c9                         test       r9d, r9d
00896 0f84e43a0000                   je         0x7f1e78408c00
0089c 48b9902e79701e7f0000           movabs     rcx, 0x7f1e70792e90
008a6 488381a800000001               add        qword ptr [rcx + 0xa8], 1
008ae 48b90000000000000000           movabs     rcx, 0
008b8 b900000000                     mov        ecx, 0
008bd 443be9                         cmp        r13d, ecx
008c0 0f8cdb3a0000                   jl         0x7f1e78408c21
008c6 443bea                         cmp        r13d, edx
008c9 0f8ddf3a0000                   jge        0x7f1e78408c2e
008cf 498bd5                         mov        rdx, r13
008d2 89942494010000                 mov        dword ptr [rsp + 0x194], edx
008d9 48b950f237e300000000           movabs     rcx, 0xe337f250
008e3 4c8bc9                         mov        r9, rcx
008e6 49be284279701e7f0000           movabs     r14, 0x7f1e70794228
008f0 4d8b09                         mov        r9, qword ptr [r9]
008f3 49c1e92a                       shr        r9, 0x2a
008f7 49c1e109                       shl        r9, 9
008fb 41ba00000058                   mov        r10d, 0x58000000
00901 4d03ca                         add        r9, r10
00904 41ba24000000                   mov        r10d, 0x24
0090a 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
0090e 7435                           je         0x7f1e784051c5
00910 4983c202                       add        r10, 2
00914 4983fa28                       cmp        r10, 0x28
00918 75f0                           jne        0x7f1e7840518a
0091a 41ba24000000                   mov        r10d, 0x24
00920 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
00925 7412                           je         0x7f1e784051b9
00927 4983c202                       add        r10, 2
0092b 4983fa28                       cmp        r10, 0x28
0092f 75ef                           jne        0x7f1e784051a0
00931 41ba23000000                   mov        r10d, 0x23
00937 eb10                           jmp        0x7f1e784051c9
00939 50                             push       rax
0093a 4833c0                         xor        rax, rax
0093d 4f0fb10cd6                     cmpxchg    qword ptr [r14 + r10*8], r9
00942 58                             pop        rax
00943 ebbf                           jmp        0x7f1e78405184
00945 4983c201                       add        r10, 1
00949 4b8304d601                     add        qword ptr [r14 + r10*8], 1
0094e 48ba902f79701e7f0000           movabs     rdx, 0x7f1e70792f90
00958 448b4a70                       mov        r9d, dword ptr [rdx + 0x70]
0095c 4183c102                       add        r9d, 2
00960 44894a70                       mov        dword ptr [rdx + 0x70], r9d
00964 4181e1feff1f00                 and        r9d, 0x1ffffe
0096b 4585c9                         test       r9d, r9d
0096e 0f84473a0000                   je         0x7f1e78408c3b
00974 48ba902f79701e7f0000           movabs     rdx, 0x7f1e70792f90
0097e 488382a800000001               add        qword ptr [rdx + 0xa8], 1
00986 48bab83079701e7f0000           movabs     rdx, 0x7f1e707930b8
00990 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00993 83c102                         add        ecx, 2
00996 894a70                         mov        dword ptr [rdx + 0x70], ecx
00999 81e1feff1f00                   and        ecx, 0x1ffffe
0099f 85c9                           test       ecx, ecx
009a1 0f84353a0000                   je         0x7f1e78408c5c
009a7 48bab83079701e7f0000           movabs     rdx, 0x7f1e707930b8
009b1 ff82b8000000                   inc        dword ptr [rdx + 0xb8]
009b7 8b942494010000                 mov        edx, dword ptr [rsp + 0x194]
009be 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
009c5 4489ac2490010000               mov        dword ptr [rsp + 0x190], r13d
009cd 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
009d5 488b9c2468010000               mov        rbx, qword ptr [rsp + 0x168]
009dd 48b968c539e300000000           movabs     rcx, 0xe339c568
009e7 4c8bc9                         mov        r9, rcx
009ea 48b8284279701e7f0000           movabs     rax, 0x7f1e70794228
009f4 4883805801000001               add        qword ptr [rax + 0x158], 1
009fc 49b9f04379701e7f0000           movabs     r9, 0x7f1e707943f0
00a06 418b4170                       mov        eax, dword ptr [r9 + 0x70]
00a0a 83c002                         add        eax, 2
00a0d 41894170                       mov        dword ptr [r9 + 0x70], eax
00a11 25feff1f00                     and        eax, 0x1ffffe
00a16 85c0                           test       eax, eax
00a18 0f84df390000                   je         0x7f1e78408c7d
00a1e 4c8bc9                         mov        r9, rcx
00a21 48b8f04379701e7f0000           movabs     rax, 0x7f1e707943f0
00a2b 488380a800000001               add        qword ptr [rax + 0xa8], 1
00a33 49b9d04479701e7f0000           movabs     r9, 0x7f1e707944d0
00a3d 418b4170                       mov        eax, dword ptr [r9 + 0x70]
00a41 83c002                         add        eax, 2
00a44 41894170                       mov        dword ptr [r9 + 0x70], eax
00a48 25feff1f00                     and        eax, 0x1ffffe
00a4d 85c0                           test       eax, eax
00a4f 0f84c9390000                   je         0x7f1e78408c9e
00a55 49b9d04479701e7f0000           movabs     r9, 0x7f1e707944d0
00a5f 498381b800000001               add        qword ptr [r9 + 0xb8], 1
00a67 48b9383979701e7f0000           movabs     rcx, 0x7f1e70793938
00a71 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00a75 4183c102                       add        r9d, 2
00a79 44894970                       mov        dword ptr [rcx + 0x70], r9d
00a7d 4181e1feff1f00                 and        r9d, 0x1ffffe
00a84 4585c9                         test       r9d, r9d
00a87 0f84b2390000                   je         0x7f1e78408cbf
00a8d 48b950f237e300000000           movabs     rcx, 0xe337f250
00a97 4c8bc9                         mov        r9, rcx
00a9a 48b8d04479701e7f0000           movabs     rax, 0x7f1e707944d0
00aa4 4d8b09                         mov        r9, qword ptr [r9]
00aa7 49c1e92a                       shr        r9, 0x2a
00aab 49c1e109                       shl        r9, 9
00aaf 41ba00000058                   mov        r10d, 0x58000000
00ab5 4d03ca                         add        r9, r10
00ab8 41ba1c000000                   mov        r10d, 0x1c
00abe 4e3b0cd0                       cmp        r9, qword ptr [rax + r10*8]
00ac2 743b                           je         0x7f1e7840537f
00ac4 4983c202                       add        r10, 2
00ac8 4983fa20                       cmp        r10, 0x20
00acc 75f0                           jne        0x7f1e7840533e
00ace 41ba1c000000                   mov        r10d, 0x1c
00ad4 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
00ad9 7412                           je         0x7f1e7840536d
00adb 4983c202                       add        r10, 2
00adf 4983fa20                       cmp        r10, 0x20
00ae3 75ef                           jne        0x7f1e78405354
00ae5 41ba1b000000                   mov        r10d, 0x1b
00aeb eb16                           jmp        0x7f1e78405383
00aed 53                             push       rbx
00aee 488bd8                         mov        rbx, rax
00af1 4833c0                         xor        rax, rax
00af4 4e0fb10cd3                     cmpxchg    qword ptr [rbx + r10*8], r9
00af9 488bc3                         mov        rax, rbx
00afc 5b                             pop        rbx
00afd ebb9                           jmp        0x7f1e78405338
00aff 4983c201                       add        r10, 1
00b03 4a8304d001                     add        qword ptr [rax + r10*8], 1
00b08 49b9d04479701e7f0000           movabs     r9, 0x7f1e707944d0
00b12 488b09                         mov        rcx, qword ptr [rcx]
00b15 48c1e92a                       shr        rcx, 0x2a
00b19 48c1e109                       shl        rcx, 9
00b1d 41ba00000058                   mov        r10d, 0x58000000
00b23 4903ca                         add        rcx, r10
00b26 41ba22000000                   mov        r10d, 0x22
00b2c 4b3b0cd1                       cmp        rcx, qword ptr [r9 + r10*8]
00b30 7435                           je         0x7f1e784053e7
00b32 4983c202                       add        r10, 2
00b36 4983fa26                       cmp        r10, 0x26
00b3a 75f0                           jne        0x7f1e784053ac
00b3c 41ba22000000                   mov        r10d, 0x22
00b42 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
00b47 7412                           je         0x7f1e784053db
00b49 4983c202                       add        r10, 2
00b4d 4983fa26                       cmp        r10, 0x26
00b51 75ef                           jne        0x7f1e784053c2
00b53 41ba21000000                   mov        r10d, 0x21
00b59 eb10                           jmp        0x7f1e784053eb
00b5b 50                             push       rax
00b5c 4833c0                         xor        rax, rax
00b5f 4b0fb10cd1                     cmpxchg    qword ptr [r9 + r10*8], rcx
00b64 58                             pop        rax
00b65 ebbf                           jmp        0x7f1e784053a6
00b67 4983c201                       add        r10, 1
00b6b 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00b70 48b9d04479701e7f0000           movabs     rcx, 0x7f1e707944d0
00b7a 4883813801000001               add        qword ptr [rcx + 0x138], 1
00b82 48b9f83979701e7f0000           movabs     rcx, 0x7f1e707939f8
00b8c 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00b90 4183c102                       add        r9d, 2
00b94 44894970                       mov        dword ptr [rcx + 0x70], r9d
00b98 4181e1feff1f00                 and        r9d, 0x1ffffe
00b9f 4585c9                         test       r9d, r9d
00ba2 0f84b8380000                   je         0x7f1e78408ce0
00ba8 48b9d04479701e7f0000           movabs     rcx, 0x7f1e707944d0
00bb2 4883814801000001               add        qword ptr [rcx + 0x148], 1
00bba 4863c2                         movsxd     rax, edx
00bbd ba0c000000                     mov        edx, 0xc
00bc2 4c8bc8                         mov        r9, rax
00bc5 4c03ca                         add        r9, rdx
00bc8 48bae02b79701e7f0000           movabs     rdx, 0x7f1e70792be0
00bd2 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00bd5 83c102                         add        ecx, 2
00bd8 894a70                         mov        dword ptr [rdx + 0x70], ecx
00bdb 81e1feff1f00                   and        ecx, 0x1ffffe
00be1 85c9                           test       ecx, ecx
00be3 0f8498380000                   je         0x7f1e78408d01
00be9 48bae02b79701e7f0000           movabs     rdx, 0x7f1e70792be0
00bf3 488382d800000001               add        qword ptr [rdx + 0xd8], 1
00bfb 48ba582d79701e7f0000           movabs     rdx, 0x7f1e70792d58
00c05 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00c08 83c102                         add        ecx, 2
00c0b 894a70                         mov        dword ptr [rdx + 0x70], ecx
00c0e 81e1feff1f00                   and        ecx, 0x1ffffe
00c14 85c9                           test       ecx, ecx
00c16 0f8486380000                   je         0x7f1e78408d22
00c1c 48bad04479701e7f0000           movabs     rdx, 0x7f1e707944d0
00c26 4883826801000001               add        qword ptr [rdx + 0x168], 1
00c2e 48ba38c03ae300000000           movabs     rdx, 0xe33ac038
00c38 48be98f237e300000000           movabs     rsi, 0xe337f298
00c42 ba02000000                     mov        edx, 2
00c47 b910000000                     mov        ecx, 0x10
00c4c 4c8bc3                         mov        r8, rbx
00c4f bf00000000                     mov        edi, 0
00c54 48891c24                       mov        qword ptr [rsp], rbx
00c58 4889442408                     mov        qword ptr [rsp + 8], rax
00c5d 49ba50f237e300000000           movabs     r10, 0xe337f250
00c67 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00c6c 49ba38c03ae300000000           movabs     r10, 0xe33ac038
00c76 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c7b 0f1f4000                       nop        dword ptr [rax]
00c7f e85cb35007                     call       0x7f1e7f910860
00c84 0f1f84007c0d0002               nop        dword ptr [rax + rax + 0x2000d7c]
00c8c 4885c0                         test       rax, rax
00c8f 48bbd04479701e7f0000           movabs     rbx, 0x7f1e707944d0
00c99 750c                           jne        0x7f1e78405527
00c9b 808b7101000001                 or         byte ptr [rbx + 0x171], 1
00ca2 e98b000000                     jmp        0x7f1e784055b2
00ca7 488b38                         mov        rdi, qword ptr [rax]
00caa 48c1ef2a                       shr        rdi, 0x2a
00cae 48c1e709                       shl        rdi, 9
00cb2 41ba00000058                   mov        r10d, 0x58000000
00cb8 4903fa                         add        rdi, r10
00cbb 41ba30000000                   mov        r10d, 0x30
00cc1 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
00cc5 7435                           je         0x7f1e7840557c
00cc7 4983c202                       add        r10, 2
00ccb 4983fa34                       cmp        r10, 0x34
00ccf 75f0                           jne        0x7f1e78405541
00cd1 41ba30000000                   mov        r10d, 0x30
00cd7 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00cdc 7412                           je         0x7f1e78405570
00cde 4983c202                       add        r10, 2
00ce2 4983fa34                       cmp        r10, 0x34
00ce6 75ef                           jne        0x7f1e78405557
00ce8 41ba2f000000                   mov        r10d, 0x2f
00cee eb10                           jmp        0x7f1e78405580
00cf0 50                             push       rax
00cf1 4833c0                         xor        rax, rax
00cf4 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
00cf9 58                             pop        rax
00cfa ebbf                           jmp        0x7f1e7840553b
00cfc 4983c201                       add        r10, 1
00d00 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00d05 48bf0006145800000000           movabs     rdi, 0x58140600
00d0f 488b18                         mov        rbx, qword ptr [rax]
00d12 48c1eb2a                       shr        rbx, 0x2a
00d16 48c1e309                       shl        rbx, 9
00d1a 41ba00000058                   mov        r10d, 0x58000000
00d20 4903da                         add        rbx, r10
00d23 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
00d27 0f8596370000                   jne        0x7f1e78408d43
00d2d e900000000                     jmp        0x7f1e784055b2
00d32 488bf8                         mov        rdi, rax
00d35 4889bc24b0010000               mov        qword ptr [rsp + 0x1b0], rdi
00d3d 483b07                         cmp        rax, qword ptr [rdi]
00d40 488bf7                         mov        rsi, rdi
00d43 48bbe06a72701e7f0000           movabs     rbx, 0x7f1e70726ae0
00d4d 488b36                         mov        rsi, qword ptr [rsi]
00d50 48c1ee2a                       shr        rsi, 0x2a
00d54 48c1e609                       shl        rsi, 9
00d58 41ba00000058                   mov        r10d, 0x58000000
00d5e 4903f2                         add        rsi, r10
00d61 41ba94000000                   mov        r10d, 0x94
00d67 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00d6b 743b                           je         0x7f1e78405628
00d6d 4983c202                       add        r10, 2
00d71 4981fa98000000                 cmp        r10, 0x98
00d78 75ed                           jne        0x7f1e784055e7
00d7a 41ba94000000                   mov        r10d, 0x94
00d80 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00d85 7415                           je         0x7f1e7840561c
00d87 4983c202                       add        r10, 2
00d8b 4981fa98000000                 cmp        r10, 0x98
00d92 75ec                           jne        0x7f1e78405600
00d94 41ba93000000                   mov        r10d, 0x93
00d9a eb10                           jmp        0x7f1e7840562c
00d9c 50                             push       rax
00d9d 4833c0                         xor        rax, rax
00da0 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
00da5 58                             pop        rax
00da6 ebb9                           jmp        0x7f1e784055e1
00da8 4983c201                       add        r10, 1
00dac 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00db1 48bee84e79701e7f0000           movabs     rsi, 0x7f1e70794ee8
00dbb 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
00dbe 83c302                         add        ebx, 2
00dc1 895e70                         mov        dword ptr [rsi + 0x70], ebx
00dc4 81e3feff1f00                   and        ebx, 0x1ffffe
00dca 85db                           test       ebx, ebx
00dcc 0f84ff360000                   je         0x7f1e78408d51
00dd2 488bf7                         mov        rsi, rdi
00dd5 48bbe84e79701e7f0000           movabs     rbx, 0x7f1e70794ee8
00ddf 488b36                         mov        rsi, qword ptr [rsi]
00de2 48c1ee2a                       shr        rsi, 0x2a
00de6 48c1e609                       shl        rsi, 9
00dea 41ba00000058                   mov        r10d, 0x58000000
00df0 4903f2                         add        rsi, r10
00df3 41ba16000000                   mov        r10d, 0x16
00df9 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00dfd 7435                           je         0x7f1e784056b4
00dff 4983c202                       add        r10, 2
00e03 4983fa1a                       cmp        r10, 0x1a
00e07 75f0                           jne        0x7f1e78405679
00e09 41ba16000000                   mov        r10d, 0x16
00e0f 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00e14 7412                           je         0x7f1e784056a8
00e16 4983c202                       add        r10, 2
00e1a 4983fa1a                       cmp        r10, 0x1a
00e1e 75ef                           jne        0x7f1e7840568f
00e20 41ba15000000                   mov        r10d, 0x15
00e26 eb10                           jmp        0x7f1e784056b8
00e28 50                             push       rax
00e29 4833c0                         xor        rax, rax
00e2c 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
00e31 58                             pop        rax
00e32 ebbf                           jmp        0x7f1e78405673
00e34 4983c201                       add        r10, 1
00e38 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00e3d 488bf7                         mov        rsi, rdi
00e40 0f1f440000                     nop        dword ptr [rax + rax]
00e45 48b8308464541e7f0000           movabs     rax, 0x7f1e54648430
00e4f e88cac5007                     call       0x7f1e7f910360
00e54 0f1f84004c0f0003               nop        dword ptr [rax + rax + 0x3000f4c]
00e5c 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
00e64 8b7708                         mov        esi, dword ptr [rdi + 8]
00e67 48bbe84e79701e7f0000           movabs     rbx, 0x7f1e70794ee8
00e71 488383d800000001               add        qword ptr [rbx + 0xd8], 1
00e79 48bbc03779701e7f0000           movabs     rbx, 0x7f1e707937c0
00e83 8b5370                         mov        edx, dword ptr [rbx + 0x70]
00e86 83c202                         add        edx, 2
00e89 895370                         mov        dword ptr [rbx + 0x70], edx
00e8c 81e2feff1f00                   and        edx, 0x1ffffe
00e92 85d2                           test       edx, edx
00e94 0f845d360000                   je         0x7f1e78408d77
00e9a 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
00ea2 48bbc03779701e7f0000           movabs     rbx, 0x7f1e707937c0
00eac 4883830801000001               add        qword ptr [rbx + 0x108], 1
00eb4 ffc8                           dec        eax
00eb6 2bf0                           sub        esi, eax
00eb8 48bb902e79701e7f0000           movabs     rbx, 0x7f1e70792e90
00ec2 8b4370                         mov        eax, dword ptr [rbx + 0x70]
00ec5 83c002                         add        eax, 2
00ec8 894370                         mov        dword ptr [rbx + 0x70], eax
00ecb 25feff1f00                     and        eax, 0x1ffffe
00ed0 85c0                           test       eax, eax
00ed2 0f8440360000                   je         0x7f1e78408d98
00ed8 48bb902e79701e7f0000           movabs     rbx, 0x7f1e70792e90
00ee2 488383a800000001               add        qword ptr [rbx + 0xa8], 1
00eea 48bb0000000000000000           movabs     rbx, 0
00ef4 bb00000000                     mov        ebx, 0
00ef9 443bdb                         cmp        r11d, ebx
00efc 0f8c37360000                   jl         0x7f1e78408db9
00f02 443bde                         cmp        r11d, esi
00f05 0f8d3b360000                   jge        0x7f1e78408dc6
00f0b 498bdb                         mov        rbx, r11
00f0e 899c24ac010000                 mov        dword ptr [rsp + 0x1ac], ebx
00f15 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
00f1d 488bbc24b0010000               mov        rdi, qword ptr [rsp + 0x1b0]
00f25 488bf7                         mov        rsi, rdi
00f28 48bae84e79701e7f0000           movabs     rdx, 0x7f1e70794ee8
00f32 488b36                         mov        rsi, qword ptr [rsi]
00f35 48c1ee2a                       shr        rsi, 0x2a
00f39 48c1e609                       shl        rsi, 9
00f3d 41ba00000058                   mov        r10d, 0x58000000
00f43 4903f2                         add        rsi, r10
00f46 41ba1e000000                   mov        r10d, 0x1e
00f4c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
00f50 7435                           je         0x7f1e78405807
00f52 4983c202                       add        r10, 2
00f56 4983fa22                       cmp        r10, 0x22
00f5a 75f0                           jne        0x7f1e784057cc
00f5c 41ba1e000000                   mov        r10d, 0x1e
00f62 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
00f67 7412                           je         0x7f1e784057fb
00f69 4983c202                       add        r10, 2
00f6d 4983fa22                       cmp        r10, 0x22
00f71 75ef                           jne        0x7f1e784057e2
00f73 41ba1d000000                   mov        r10d, 0x1d
00f79 eb10                           jmp        0x7f1e7840580b
00f7b 50                             push       rax
00f7c 4833c0                         xor        rax, rax
00f7f 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
00f84 58                             pop        rax
00f85 ebbf                           jmp        0x7f1e784057c6
00f87 4983c201                       add        r10, 1
00f8b 4a8304d201                     add        qword ptr [rdx + r10*8], 1
00f90 488bf7                         mov        rsi, rdi
00f93 6690                           nop        
00f95 48b8588464541e7f0000           movabs     rax, 0x7f1e54648458
00f9f e83cab5007                     call       0x7f1e7f910360
00fa4 0f1f84009c100004               nop        dword ptr [rax + rax + 0x400109c]
00fac 483b00                         cmp        rax, qword ptr [rax]
00faf 488bf0                         mov        rsi, rax
00fb2 48bae84e79701e7f0000           movabs     rdx, 0x7f1e70794ee8
00fbc 488b36                         mov        rsi, qword ptr [rsi]
00fbf 48c1ee2a                       shr        rsi, 0x2a
00fc3 48c1e609                       shl        rsi, 9
00fc7 41ba00000058                   mov        r10d, 0x58000000
00fcd 4903f2                         add        rsi, r10
00fd0 41ba24000000                   mov        r10d, 0x24
00fd6 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
00fda 7435                           je         0x7f1e78405891
00fdc 4983c202                       add        r10, 2
00fe0 4983fa28                       cmp        r10, 0x28
00fe4 75f0                           jne        0x7f1e78405856
00fe6 41ba24000000                   mov        r10d, 0x24
00fec 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
00ff1 7412                           je         0x7f1e78405885
00ff3 4983c202                       add        r10, 2
00ff7 4983fa28                       cmp        r10, 0x28
00ffb 75ef                           jne        0x7f1e7840586c
00ffd 41ba23000000                   mov        r10d, 0x23
01003 eb10                           jmp        0x7f1e78405895
01005 50                             push       rax
01006 4833c0                         xor        rax, rax
01009 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
0100e 58                             pop        rax
0100f ebbf                           jmp        0x7f1e78405850
01011 4983c201                       add        r10, 1
01015 4a8304d201                     add        qword ptr [rdx + r10*8], 1
0101a 8b7028                         mov        esi, dword ptr [rax + 0x28]
0101d 488bd0                         mov        rdx, rax
01020 48b9e84e79701e7f0000           movabs     rcx, 0x7f1e70794ee8
0102a 488b12                         mov        rdx, qword ptr [rdx]
0102d 48c1ea2a                       shr        rdx, 0x2a
01031 48c1e209                       shl        rdx, 9
01035 41ba00000058                   mov        r10d, 0x58000000
0103b 4903d2                         add        rdx, r10
0103e 41ba2a000000                   mov        r10d, 0x2a
01044 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01048 7435                           je         0x7f1e784058ff
0104a 4983c202                       add        r10, 2
0104e 4983fa2e                       cmp        r10, 0x2e
01052 75f0                           jne        0x7f1e784058c4
01054 41ba2a000000                   mov        r10d, 0x2a
0105a 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0105f 7412                           je         0x7f1e784058f3
01061 4983c202                       add        r10, 2
01065 4983fa2e                       cmp        r10, 0x2e
01069 75ef                           jne        0x7f1e784058da
0106b 41ba29000000                   mov        r10d, 0x29
01071 eb10                           jmp        0x7f1e78405903
01073 50                             push       rax
01074 4833c0                         xor        rax, rax
01077 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
0107c 58                             pop        rax
0107d ebbf                           jmp        0x7f1e784058be
0107f 4983c201                       add        r10, 1
01083 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01088 8b4808                         mov        ecx, dword ptr [rax + 8]
0108b 48bae84e79701e7f0000           movabs     rdx, 0x7f1e70794ee8
01095 4883827801000001               add        qword ptr [rdx + 0x178], 1
0109d 48baf83979701e7f0000           movabs     rdx, 0x7f1e707939f8
010a7 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
010ab 4183c002                       add        r8d, 2
010af 44894270                       mov        dword ptr [rdx + 0x70], r8d
010b3 4181e0feff1f00                 and        r8d, 0x1ffffe
010ba 4585c0                         test       r8d, r8d
010bd 0f8495340000                   je         0x7f1e78408dd8
010c3 48bae84e79701e7f0000           movabs     rdx, 0x7f1e70794ee8
010cd 4883828801000001               add        qword ptr [rdx + 0x188], 1
010d5 8b9c24ac010000                 mov        ebx, dword ptr [rsp + 0x1ac]
010dc 4863db                         movsxd     rbx, ebx
010df ba0c000000                     mov        edx, 0xc
010e4 4c8bcb                         mov        r9, rbx
010e7 4c03ca                         add        r9, rdx
010ea 48bae02b79701e7f0000           movabs     rdx, 0x7f1e70792be0
010f4 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
010f8 4183c002                       add        r8d, 2
010fc 44894270                       mov        dword ptr [rdx + 0x70], r8d
01100 4181e0feff1f00                 and        r8d, 0x1ffffe
01107 4585c0                         test       r8d, r8d
0110a 0f8469340000                   je         0x7f1e78408df9
01110 48bae02b79701e7f0000           movabs     rdx, 0x7f1e70792be0
0111a 488382d800000001               add        qword ptr [rdx + 0xd8], 1
01122 48ba582d79701e7f0000           movabs     rdx, 0x7f1e70792d58
0112c 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01130 4183c002                       add        r8d, 2
01134 44894270                       mov        dword ptr [rdx + 0x70], r8d
01138 4181e0feff1f00                 and        r8d, 0x1ffffe
0113f 4585c0                         test       r8d, r8d
01142 0f8452340000                   je         0x7f1e78408e1a
01148 48bae84e79701e7f0000           movabs     rdx, 0x7f1e70794ee8
01152 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
0115a 48bae0a03ce300000000           movabs     rdx, 0xe33ca0e0
01164 ba02000000                     mov        edx, 2
01169 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
01171 bf00000000                     mov        edi, 0
01176 488b8424b0010000               mov        rax, qword ptr [rsp + 0x1b0]
0117e 48890424                       mov        qword ptr [rsp], rax
01182 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0118a 4889442408                     mov        qword ptr [rsp + 8], rax
0118f 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01194 49bae0a03ce300000000           movabs     r10, 0xe33ca0e0
0119e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
011a3 0f1f4000                       nop        dword ptr [rax]
011a7 e834ae5007                     call       0x7f1e7f910860
011ac 0f1f8400a4120005               nop        dword ptr [rax + rax + 0x50012a4]
011b4 48bee06a72701e7f0000           movabs     rsi, 0x7f1e70726ae0
011be ff86c8040000                   inc        dword ptr [rsi + 0x4c8]
011c4 e9dd0b0000                     jmp        0x7f1e78406626
011c9 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
011d0 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
011d8 83ff30                         cmp        edi, 0x30
011db 48bee06a72701e7f0000           movabs     rsi, 0x7f1e70726ae0
011e5 bae0040000                     mov        edx, 0x4e0
011ea 7f05                           jg         0x7f1e78405a71
011ec baf0040000                     mov        edx, 0x4f0
011f1 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
011f5 488d4901                       lea        rcx, [rcx + 1]
011f9 48890c16                       mov        qword ptr [rsi + rdx], rcx
011fd 0f8ffe0a0000                   jg         0x7f1e78406581
01203 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
0120a 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
01212 660f1f440000                   nop        word ptr [rax + rax]
01218 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
01220 8b842464010000                 mov        eax, dword ptr [rsp + 0x164]
01227 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
0122f 48b9e06a72701e7f0000           movabs     rcx, 0x7f1e70726ae0
01239 4883810005000001               add        qword ptr [rcx + 0x500], 1
01241 48b9284279701e7f0000           movabs     rcx, 0x7f1e70794228
0124b 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
0124f 4183c002                       add        r8d, 2
01253 44894170                       mov        dword ptr [rcx + 0x70], r8d
01257 4181e0feff1f00                 and        r8d, 0x1ffffe
0125e 4585c0                         test       r8d, r8d
01261 0f8454330000                   je         0x7f1e78408e3b
01267 48b950f237e300000000           movabs     rcx, 0xe337f250
01271 49b8284279701e7f0000           movabs     r8, 0x7f1e70794228
0127b 488b09                         mov        rcx, qword ptr [rcx]
0127e 48c1e92a                       shr        rcx, 0x2a
01282 48c1e109                       shl        rcx, 9
01286 41ba00000058                   mov        r10d, 0x58000000
0128c 4903ca                         add        rcx, r10
0128f 41ba16000000                   mov        r10d, 0x16
01295 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
01299 7435                           je         0x7f1e78405b50
0129b 4983c202                       add        r10, 2
0129f 4983fa1a                       cmp        r10, 0x1a
012a3 75f0                           jne        0x7f1e78405b15
012a5 41ba16000000                   mov        r10d, 0x16
012ab 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
012b0 7412                           je         0x7f1e78405b44
012b2 4983c202                       add        r10, 2
012b6 4983fa1a                       cmp        r10, 0x1a
012ba 75ef                           jne        0x7f1e78405b2b
012bc 41ba15000000                   mov        r10d, 0x15
012c2 eb10                           jmp        0x7f1e78405b54
012c4 50                             push       rax
012c5 4833c0                         xor        rax, rax
012c8 4b0fb10cd0                     cmpxchg    qword ptr [r8 + r10*8], rcx
012cd 58                             pop        rax
012ce ebbf                           jmp        0x7f1e78405b0f
012d0 4983c201                       add        r10, 1
012d4 4b8304d001                     add        qword ptr [r8 + r10*8], 1
012d9 48b9284279701e7f0000           movabs     rcx, 0x7f1e70794228
012e3 488381d800000001               add        qword ptr [rcx + 0xd8], 1
012eb 48b9c03779701e7f0000           movabs     rcx, 0x7f1e707937c0
012f5 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
012f9 4183c002                       add        r8d, 2
012fd 44894170                       mov        dword ptr [rcx + 0x70], r8d
01301 4181e0feff1f00                 and        r8d, 0x1ffffe
01308 4585c0                         test       r8d, r8d
0130b 0f84cb320000                   je         0x7f1e78408e5c
01311 48b9c03779701e7f0000           movabs     rcx, 0x7f1e707937c0
0131b 4883810801000001               add        qword ptr [rcx + 0x108], 1
01323 488bc8                         mov        rcx, rax
01326 83e90f                         sub        ecx, 0xf
01329 49b8902e79701e7f0000           movabs     r8, 0x7f1e70792e90
01333 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
01337 4183c102                       add        r9d, 2
0133b 45894870                       mov        dword ptr [r8 + 0x70], r9d
0133f 4181e1feff1f00                 and        r9d, 0x1ffffe
01346 4585c9                         test       r9d, r9d
01349 0f84ae320000                   je         0x7f1e78408e7d
0134f 49b8902e79701e7f0000           movabs     r8, 0x7f1e70792e90
01359 498380a800000001               add        qword ptr [r8 + 0xa8], 1
01361 49b80000000000000000           movabs     r8, 0
0136b 41b800000000                   mov        r8d, 0
01371 413bf0                         cmp        esi, r8d
01374 0f8ca4320000                   jl         0x7f1e78408e9e
0137a 3bf1                           cmp        esi, ecx
0137c 0f8da9320000                   jge        0x7f1e78408eab
01382 488bce                         mov        rcx, rsi
01385 898c24b8010000                 mov        dword ptr [rsp + 0x1b8], ecx
0138c 49b850f237e300000000           movabs     r8, 0xe337f250
01396 4d8bc8                         mov        r9, r8
01399 49be284279701e7f0000           movabs     r14, 0x7f1e70794228
013a3 4d8b09                         mov        r9, qword ptr [r9]
013a6 49c1e92a                       shr        r9, 0x2a
013aa 49c1e109                       shl        r9, 9
013ae 41ba00000058                   mov        r10d, 0x58000000
013b4 4d03ca                         add        r9, r10
013b7 41ba24000000                   mov        r10d, 0x24
013bd 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
013c1 7435                           je         0x7f1e78405c78
013c3 4983c202                       add        r10, 2
013c7 4983fa28                       cmp        r10, 0x28
013cb 75f0                           jne        0x7f1e78405c3d
013cd 41ba24000000                   mov        r10d, 0x24
013d3 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
013d8 7412                           je         0x7f1e78405c6c
013da 4983c202                       add        r10, 2
013de 4983fa28                       cmp        r10, 0x28
013e2 75ef                           jne        0x7f1e78405c53
013e4 41ba23000000                   mov        r10d, 0x23
013ea eb10                           jmp        0x7f1e78405c7c
013ec 50                             push       rax
013ed 4833c0                         xor        rax, rax
013f0 4f0fb10cd6                     cmpxchg    qword ptr [r14 + r10*8], r9
013f5 58                             pop        rax
013f6 ebbf                           jmp        0x7f1e78405c37
013f8 4983c201                       add        r10, 1
013fc 4b8304d601                     add        qword ptr [r14 + r10*8], 1
01401 48b9902f79701e7f0000           movabs     rcx, 0x7f1e70792f90
0140b 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
0140f 4183c102                       add        r9d, 2
01413 44894970                       mov        dword ptr [rcx + 0x70], r9d
01417 4181e1feff1f00                 and        r9d, 0x1ffffe
0141e 4585c9                         test       r9d, r9d
01421 0f8411320000                   je         0x7f1e78408eb8
01427 48b9902f79701e7f0000           movabs     rcx, 0x7f1e70792f90
01431 488381a800000001               add        qword ptr [rcx + 0xa8], 1
01439 48b9b83079701e7f0000           movabs     rcx, 0x7f1e707930b8
01443 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
01447 4183c002                       add        r8d, 2
0144b 44894170                       mov        dword ptr [rcx + 0x70], r8d
0144f 4181e0feff1f00                 and        r8d, 0x1ffffe
01456 4585c0                         test       r8d, r8d
01459 0f84fa310000                   je         0x7f1e78408ed9
0145f 48b9b83079701e7f0000           movabs     rcx, 0x7f1e707930b8
01469 ff81b8000000                   inc        dword ptr [rcx + 0xb8]
0146f 8b8c24b8010000                 mov        ecx, dword ptr [rsp + 0x1b8]
01476 89b424c0010000                 mov        dword ptr [rsp + 0x1c0], esi
0147d 49b868c539e300000000           movabs     r8, 0xe339c568
01487 4d8bc8                         mov        r9, r8
0148a 49be284279701e7f0000           movabs     r14, 0x7f1e70794228
01494 4983865801000001               add        qword ptr [r14 + 0x158], 1
0149c 49b9f04379701e7f0000           movabs     r9, 0x7f1e707943f0
014a6 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
014aa 83c302                         add        ebx, 2
014ad 41895970                       mov        dword ptr [r9 + 0x70], ebx
014b1 81e3feff1f00                   and        ebx, 0x1ffffe
014b7 85db                           test       ebx, ebx
014b9 0f84bb310000                   je         0x7f1e78408efa
014bf 4d8bc8                         mov        r9, r8
014c2 48bbf04379701e7f0000           movabs     rbx, 0x7f1e707943f0
014cc 488383a800000001               add        qword ptr [rbx + 0xa8], 1
014d4 49b9d04479701e7f0000           movabs     r9, 0x7f1e707944d0
014de 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
014e2 83c302                         add        ebx, 2
014e5 41895970                       mov        dword ptr [r9 + 0x70], ebx
014e9 81e3feff1f00                   and        ebx, 0x1ffffe
014ef 85db                           test       ebx, ebx
014f1 0f84a4310000                   je         0x7f1e78408f1b
014f7 49b9d04479701e7f0000           movabs     r9, 0x7f1e707944d0
01501 498381b800000001               add        qword ptr [r9 + 0xb8], 1
01509 49b8383979701e7f0000           movabs     r8, 0x7f1e70793938
01513 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
01517 4183c102                       add        r9d, 2
0151b 45894870                       mov        dword ptr [r8 + 0x70], r9d
0151f 4181e1feff1f00                 and        r9d, 0x1ffffe
01526 4585c9                         test       r9d, r9d
01529 0f848d310000                   je         0x7f1e78408f3c
0152f 49b850f237e300000000           movabs     r8, 0xe337f250
01539 4d8bc8                         mov        r9, r8
0153c 48bbd04479701e7f0000           movabs     rbx, 0x7f1e707944d0
01546 4d8b09                         mov        r9, qword ptr [r9]
01549 49c1e92a                       shr        r9, 0x2a
0154d 49c1e109                       shl        r9, 9
01551 41ba00000058                   mov        r10d, 0x58000000
01557 4d03ca                         add        r9, r10
0155a 41ba1c000000                   mov        r10d, 0x1c
01560 4e3b0cd3                       cmp        r9, qword ptr [rbx + r10*8]
01564 7435                           je         0x7f1e78405e1b
01566 4983c202                       add        r10, 2
0156a 4983fa20                       cmp        r10, 0x20
0156e 75f0                           jne        0x7f1e78405de0
01570 41ba1c000000                   mov        r10d, 0x1c
01576 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0157b 7412                           je         0x7f1e78405e0f
0157d 4983c202                       add        r10, 2
01581 4983fa20                       cmp        r10, 0x20
01585 75ef                           jne        0x7f1e78405df6
01587 41ba1b000000                   mov        r10d, 0x1b
0158d eb10                           jmp        0x7f1e78405e1f
0158f 50                             push       rax
01590 4833c0                         xor        rax, rax
01593 4e0fb10cd3                     cmpxchg    qword ptr [rbx + r10*8], r9
01598 58                             pop        rax
01599 ebbf                           jmp        0x7f1e78405dda
0159b 4983c201                       add        r10, 1
0159f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
015a4 49b9d04479701e7f0000           movabs     r9, 0x7f1e707944d0
015ae 4d8b00                         mov        r8, qword ptr [r8]
015b1 49c1e82a                       shr        r8, 0x2a
015b5 49c1e009                       shl        r8, 9
015b9 41ba00000058                   mov        r10d, 0x58000000
015bf 4d03c2                         add        r8, r10
015c2 41ba22000000                   mov        r10d, 0x22
015c8 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
015cc 7435                           je         0x7f1e78405e83
015ce 4983c202                       add        r10, 2
015d2 4983fa26                       cmp        r10, 0x26
015d6 75f0                           jne        0x7f1e78405e48
015d8 41ba22000000                   mov        r10d, 0x22
015de 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
015e3 7412                           je         0x7f1e78405e77
015e5 4983c202                       add        r10, 2
015e9 4983fa26                       cmp        r10, 0x26
015ed 75ef                           jne        0x7f1e78405e5e
015ef 41ba21000000                   mov        r10d, 0x21
015f5 eb10                           jmp        0x7f1e78405e87
015f7 50                             push       rax
015f8 4833c0                         xor        rax, rax
015fb 4f0fb104d1                     cmpxchg    qword ptr [r9 + r10*8], r8
01600 58                             pop        rax
01601 ebbf                           jmp        0x7f1e78405e42
01603 4983c201                       add        r10, 1
01607 4b8304d101                     add        qword ptr [r9 + r10*8], 1
0160c 49b8d04479701e7f0000           movabs     r8, 0x7f1e707944d0
01616 4983803801000001               add        qword ptr [r8 + 0x138], 1
0161e 49b8f83979701e7f0000           movabs     r8, 0x7f1e707939f8
01628 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
0162c 4183c102                       add        r9d, 2
01630 45894870                       mov        dword ptr [r8 + 0x70], r9d
01634 4181e1feff1f00                 and        r9d, 0x1ffffe
0163b 4585c9                         test       r9d, r9d
0163e 0f8499300000                   je         0x7f1e78408f5d
01644 49b8d04479701e7f0000           movabs     r8, 0x7f1e707944d0
0164e 4983804801000001               add        qword ptr [r8 + 0x148], 1
01656 4863d9                         movsxd     rbx, ecx
01659 b90c000000                     mov        ecx, 0xc
0165e 4c8bcb                         mov        r9, rbx
01661 4c03c9                         add        r9, rcx
01664 48b9e02b79701e7f0000           movabs     rcx, 0x7f1e70792be0
0166e 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
01672 4183c002                       add        r8d, 2
01676 44894170                       mov        dword ptr [rcx + 0x70], r8d
0167a 4181e0feff1f00                 and        r8d, 0x1ffffe
01681 4585c0                         test       r8d, r8d
01684 0f8474300000                   je         0x7f1e78408f7e
0168a 48b9e02b79701e7f0000           movabs     rcx, 0x7f1e70792be0
01694 488381d800000001               add        qword ptr [rcx + 0xd8], 1
0169c 48b9582d79701e7f0000           movabs     rcx, 0x7f1e70792d58
016a6 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
016aa 4183c002                       add        r8d, 2
016ae 44894170                       mov        dword ptr [rcx + 0x70], r8d
016b2 4181e0feff1f00                 and        r8d, 0x1ffffe
016b9 4585c0                         test       r8d, r8d
016bc 0f845d300000                   je         0x7f1e78408f9f
016c2 48b9d04479701e7f0000           movabs     rcx, 0x7f1e707944d0
016cc 4883816801000001               add        qword ptr [rcx + 0x168], 1
016d4 48b938c03ae300000000           movabs     rcx, 0xe33ac038
016de 48be98f237e300000000           movabs     rsi, 0xe337f298
016e8 4c8bc2                         mov        r8, rdx
016eb ba02000000                     mov        edx, 2
016f0 b910000000                     mov        ecx, 0x10
016f5 498bc0                         mov        rax, r8
016f8 4c8bc0                         mov        r8, rax
016fb bf00000000                     mov        edi, 0
01700 48890424                       mov        qword ptr [rsp], rax
01704 48895c2408                     mov        qword ptr [rsp + 8], rbx
01709 49ba50f237e300000000           movabs     r10, 0xe337f250
01713 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01718 49ba38c03ae300000000           movabs     r10, 0xe33ac038
01722 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01727 e8b4a85007                     call       0x7f1e7f910860
0172c 0f1f840024180006               nop        dword ptr [rax + rax + 0x6001824]
01734 4885c0                         test       rax, rax
01737 48bbd04479701e7f0000           movabs     rbx, 0x7f1e707944d0
01741 750c                           jne        0x7f1e78405fcf
01743 808b7101000001                 or         byte ptr [rbx + 0x171], 1
0174a e98b000000                     jmp        0x7f1e7840605a
0174f 488b38                         mov        rdi, qword ptr [rax]
01752 48c1ef2a                       shr        rdi, 0x2a
01756 48c1e709                       shl        rdi, 9
0175a 41ba00000058                   mov        r10d, 0x58000000
01760 4903fa                         add        rdi, r10
01763 41ba30000000                   mov        r10d, 0x30
01769 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
0176d 7435                           je         0x7f1e78406024
0176f 4983c202                       add        r10, 2
01773 4983fa34                       cmp        r10, 0x34
01777 75f0                           jne        0x7f1e78405fe9
01779 41ba30000000                   mov        r10d, 0x30
0177f 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01784 7412                           je         0x7f1e78406018
01786 4983c202                       add        r10, 2
0178a 4983fa34                       cmp        r10, 0x34
0178e 75ef                           jne        0x7f1e78405fff
01790 41ba2f000000                   mov        r10d, 0x2f
01796 eb10                           jmp        0x7f1e78406028
01798 50                             push       rax
01799 4833c0                         xor        rax, rax
0179c 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
017a1 58                             pop        rax
017a2 ebbf                           jmp        0x7f1e78405fe3
017a4 4983c201                       add        r10, 1
017a8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
017ad 48bf0006145800000000           movabs     rdi, 0x58140600
017b7 488b18                         mov        rbx, qword ptr [rax]
017ba 48c1eb2a                       shr        rbx, 0x2a
017be 48c1e309                       shl        rbx, 9
017c2 41ba00000058                   mov        r10d, 0x58000000
017c8 4903da                         add        rbx, r10
017cb 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
017cf 0f856b2f0000                   jne        0x7f1e78408fc0
017d5 e900000000                     jmp        0x7f1e7840605a
017da 488bf8                         mov        rdi, rax
017dd 4889bc24c8010000               mov        qword ptr [rsp + 0x1c8], rdi
017e5 483b07                         cmp        rax, qword ptr [rdi]
017e8 488bf7                         mov        rsi, rdi
017eb 48bbe06a72701e7f0000           movabs     rbx, 0x7f1e70726ae0
017f5 488b36                         mov        rsi, qword ptr [rsi]
017f8 48c1ee2a                       shr        rsi, 0x2a
017fc 48c1e609                       shl        rsi, 9
01800 41ba00000058                   mov        r10d, 0x58000000
01806 4903f2                         add        rsi, r10
01809 41baa3000000                   mov        r10d, 0xa3
0180f 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
01813 743b                           je         0x7f1e784060d0
01815 4983c202                       add        r10, 2
01819 4981faa7000000                 cmp        r10, 0xa7
01820 75ed                           jne        0x7f1e7840608f
01822 41baa3000000                   mov        r10d, 0xa3
01828 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0182d 7415                           je         0x7f1e784060c4
0182f 4983c202                       add        r10, 2
01833 4981faa7000000                 cmp        r10, 0xa7
0183a 75ec                           jne        0x7f1e784060a8
0183c 41baa2000000                   mov        r10d, 0xa2
01842 eb10                           jmp        0x7f1e784060d4
01844 50                             push       rax
01845 4833c0                         xor        rax, rax
01848 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
0184d 58                             pop        rax
0184e ebb9                           jmp        0x7f1e78406089
01850 4983c201                       add        r10, 1
01854 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01859 48bee84e79701e7f0000           movabs     rsi, 0x7f1e70794ee8
01863 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
01866 83c302                         add        ebx, 2
01869 895e70                         mov        dword ptr [rsi + 0x70], ebx
0186c 81e3feff1f00                   and        ebx, 0x1ffffe
01872 85db                           test       ebx, ebx
01874 0f84d42e0000                   je         0x7f1e78408fce
0187a 488bf7                         mov        rsi, rdi
0187d 48bbe84e79701e7f0000           movabs     rbx, 0x7f1e70794ee8
01887 488b36                         mov        rsi, qword ptr [rsi]
0188a 48c1ee2a                       shr        rsi, 0x2a
0188e 48c1e609                       shl        rsi, 9
01892 41ba00000058                   mov        r10d, 0x58000000
01898 4903f2                         add        rsi, r10
0189b 41ba16000000                   mov        r10d, 0x16
018a1 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
018a5 7435                           je         0x7f1e7840615c
018a7 4983c202                       add        r10, 2
018ab 4983fa1a                       cmp        r10, 0x1a
018af 75f0                           jne        0x7f1e78406121
018b1 41ba16000000                   mov        r10d, 0x16
018b7 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
018bc 7412                           je         0x7f1e78406150
018be 4983c202                       add        r10, 2
018c2 4983fa1a                       cmp        r10, 0x1a
018c6 75ef                           jne        0x7f1e78406137
018c8 41ba15000000                   mov        r10d, 0x15
018ce eb10                           jmp        0x7f1e78406160
018d0 50                             push       rax
018d1 4833c0                         xor        rax, rax
018d4 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
018d9 58                             pop        rax
018da ebbf                           jmp        0x7f1e7840611b
018dc 4983c201                       add        r10, 1
018e0 4a8304d301                     add        qword ptr [rbx + r10*8], 1
018e5 488bf7                         mov        rsi, rdi
018e8 0f1f440000                     nop        dword ptr [rax + rax]
018ed 48b8808464541e7f0000           movabs     rax, 0x7f1e54648480
018f7 e8e4a15007                     call       0x7f1e7f910360
018fc 0f1f8400f4190007               nop        dword ptr [rax + rax + 0x70019f4]
01904 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
0190c 8b7708                         mov        esi, dword ptr [rdi + 8]
0190f 48bbe84e79701e7f0000           movabs     rbx, 0x7f1e70794ee8
01919 488383d800000001               add        qword ptr [rbx + 0xd8], 1
01921 48bbc03779701e7f0000           movabs     rbx, 0x7f1e707937c0
0192b 8b5370                         mov        edx, dword ptr [rbx + 0x70]
0192e 83c202                         add        edx, 2
01931 895370                         mov        dword ptr [rbx + 0x70], edx
01934 81e2feff1f00                   and        edx, 0x1ffffe
0193a 85d2                           test       edx, edx
0193c 0f84322e0000                   je         0x7f1e78408ff4
01942 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
0194a 48bbc03779701e7f0000           movabs     rbx, 0x7f1e707937c0
01954 4883830801000001               add        qword ptr [rbx + 0x108], 1
0195c ffc8                           dec        eax
0195e 2bf0                           sub        esi, eax
01960 48bb902e79701e7f0000           movabs     rbx, 0x7f1e70792e90
0196a 8b4370                         mov        eax, dword ptr [rbx + 0x70]
0196d 83c002                         add        eax, 2
01970 894370                         mov        dword ptr [rbx + 0x70], eax
01973 25feff1f00                     and        eax, 0x1ffffe
01978 85c0                           test       eax, eax
0197a 0f84152e0000                   je         0x7f1e78409015
01980 48bb902e79701e7f0000           movabs     rbx, 0x7f1e70792e90
0198a 488383a800000001               add        qword ptr [rbx + 0xa8], 1
01992 48bb0000000000000000           movabs     rbx, 0
0199c bb00000000                     mov        ebx, 0
019a1 443bdb                         cmp        r11d, ebx
019a4 0f8c0c2e0000                   jl         0x7f1e78409036
019aa 443bde                         cmp        r11d, esi
019ad 0f8d102e0000                   jge        0x7f1e78409043
019b3 498bdb                         mov        rbx, r11
019b6 899c24c4010000                 mov        dword ptr [rsp + 0x1c4], ebx
019bd 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
019c5 488bbc24c8010000               mov        rdi, qword ptr [rsp + 0x1c8]
019cd 488bf7                         mov        rsi, rdi
019d0 48bae84e79701e7f0000           movabs     rdx, 0x7f1e70794ee8
019da 488b36                         mov        rsi, qword ptr [rsi]
019dd 48c1ee2a                       shr        rsi, 0x2a
019e1 48c1e609                       shl        rsi, 9
019e5 41ba00000058                   mov        r10d, 0x58000000
019eb 4903f2                         add        rsi, r10
019ee 41ba1e000000                   mov        r10d, 0x1e
019f4 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
019f8 7435                           je         0x7f1e784062af
019fa 4983c202                       add        r10, 2
019fe 4983fa22                       cmp        r10, 0x22
01a02 75f0                           jne        0x7f1e78406274
01a04 41ba1e000000                   mov        r10d, 0x1e
01a0a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01a0f 7412                           je         0x7f1e784062a3
01a11 4983c202                       add        r10, 2
01a15 4983fa22                       cmp        r10, 0x22
01a19 75ef                           jne        0x7f1e7840628a
01a1b 41ba1d000000                   mov        r10d, 0x1d
01a21 eb10                           jmp        0x7f1e784062b3
01a23 50                             push       rax
01a24 4833c0                         xor        rax, rax
01a27 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
01a2c 58                             pop        rax
01a2d ebbf                           jmp        0x7f1e7840626e
01a2f 4983c201                       add        r10, 1
01a33 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01a38 488bf7                         mov        rsi, rdi
01a3b 6690                           nop        
01a3d 48b8a88464541e7f0000           movabs     rax, 0x7f1e546484a8
01a47 e894a05007                     call       0x7f1e7f910360
01a4c 0f1f8400441b0008               nop        dword ptr [rax + rax + 0x8001b44]
01a54 483b00                         cmp        rax, qword ptr [rax]
01a57 488bf0                         mov        rsi, rax
01a5a 48bae84e79701e7f0000           movabs     rdx, 0x7f1e70794ee8
01a64 488b36                         mov        rsi, qword ptr [rsi]
01a67 48c1ee2a                       shr        rsi, 0x2a
01a6b 48c1e609                       shl        rsi, 9
01a6f 41ba00000058                   mov        r10d, 0x58000000
01a75 4903f2                         add        rsi, r10
01a78 41ba24000000                   mov        r10d, 0x24
01a7e 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01a82 7435                           je         0x7f1e78406339
01a84 4983c202                       add        r10, 2
01a88 4983fa28                       cmp        r10, 0x28
01a8c 75f0                           jne        0x7f1e784062fe
01a8e 41ba24000000                   mov        r10d, 0x24
01a94 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01a99 7412                           je         0x7f1e7840632d
01a9b 4983c202                       add        r10, 2
01a9f 4983fa28                       cmp        r10, 0x28
01aa3 75ef                           jne        0x7f1e78406314
01aa5 41ba23000000                   mov        r10d, 0x23
01aab eb10                           jmp        0x7f1e7840633d
01aad 50                             push       rax
01aae 4833c0                         xor        rax, rax
01ab1 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
01ab6 58                             pop        rax
01ab7 ebbf                           jmp        0x7f1e784062f8
01ab9 4983c201                       add        r10, 1
01abd 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01ac2 8b7028                         mov        esi, dword ptr [rax + 0x28]
01ac5 488bd0                         mov        rdx, rax
01ac8 48b9e84e79701e7f0000           movabs     rcx, 0x7f1e70794ee8
01ad2 488b12                         mov        rdx, qword ptr [rdx]
01ad5 48c1ea2a                       shr        rdx, 0x2a
01ad9 48c1e209                       shl        rdx, 9
01add 41ba00000058                   mov        r10d, 0x58000000
01ae3 4903d2                         add        rdx, r10
01ae6 41ba2a000000                   mov        r10d, 0x2a
01aec 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01af0 7435                           je         0x7f1e784063a7
01af2 4983c202                       add        r10, 2
01af6 4983fa2e                       cmp        r10, 0x2e
01afa 75f0                           jne        0x7f1e7840636c
01afc 41ba2a000000                   mov        r10d, 0x2a
01b02 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01b07 7412                           je         0x7f1e7840639b
01b09 4983c202                       add        r10, 2
01b0d 4983fa2e                       cmp        r10, 0x2e
01b11 75ef                           jne        0x7f1e78406382
01b13 41ba29000000                   mov        r10d, 0x29
01b19 eb10                           jmp        0x7f1e784063ab
01b1b 50                             push       rax
01b1c 4833c0                         xor        rax, rax
01b1f 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
01b24 58                             pop        rax
01b25 ebbf                           jmp        0x7f1e78406366
01b27 4983c201                       add        r10, 1
01b2b 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01b30 8b4808                         mov        ecx, dword ptr [rax + 8]
01b33 48bae84e79701e7f0000           movabs     rdx, 0x7f1e70794ee8
01b3d 4883827801000001               add        qword ptr [rdx + 0x178], 1
01b45 48baf83979701e7f0000           movabs     rdx, 0x7f1e707939f8
01b4f 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01b53 4183c002                       add        r8d, 2
01b57 44894270                       mov        dword ptr [rdx + 0x70], r8d
01b5b 4181e0feff1f00                 and        r8d, 0x1ffffe
01b62 4585c0                         test       r8d, r8d
01b65 0f846a2c0000                   je         0x7f1e78409055
01b6b 48bae84e79701e7f0000           movabs     rdx, 0x7f1e70794ee8
01b75 4883828801000001               add        qword ptr [rdx + 0x188], 1
01b7d 8b9c24c4010000                 mov        ebx, dword ptr [rsp + 0x1c4]
01b84 4863db                         movsxd     rbx, ebx
01b87 ba0c000000                     mov        edx, 0xc
01b8c 4c8bcb                         mov        r9, rbx
01b8f 4c03ca                         add        r9, rdx
01b92 48bae02b79701e7f0000           movabs     rdx, 0x7f1e70792be0
01b9c 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01ba0 4183c002                       add        r8d, 2
01ba4 44894270                       mov        dword ptr [rdx + 0x70], r8d
01ba8 4181e0feff1f00                 and        r8d, 0x1ffffe
01baf 4585c0                         test       r8d, r8d
01bb2 0f843e2c0000                   je         0x7f1e78409076
01bb8 48bae02b79701e7f0000           movabs     rdx, 0x7f1e70792be0
01bc2 488382d800000001               add        qword ptr [rdx + 0xd8], 1
01bca 48ba582d79701e7f0000           movabs     rdx, 0x7f1e70792d58
01bd4 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01bd8 4183c002                       add        r8d, 2
01bdc 44894270                       mov        dword ptr [rdx + 0x70], r8d
01be0 4181e0feff1f00                 and        r8d, 0x1ffffe
01be7 4585c0                         test       r8d, r8d
01bea 0f84272c0000                   je         0x7f1e78409097
01bf0 48bae84e79701e7f0000           movabs     rdx, 0x7f1e70794ee8
01bfa 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
01c02 48bae0a03ce300000000           movabs     rdx, 0xe33ca0e0
01c0c ba02000000                     mov        edx, 2
01c11 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
01c19 bf00000000                     mov        edi, 0
01c1e 488b8424c8010000               mov        rax, qword ptr [rsp + 0x1c8]
01c26 48890424                       mov        qword ptr [rsp], rax
01c2a 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
01c32 4889442408                     mov        qword ptr [rsp + 8], rax
01c37 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01c3c 49bae0a03ce300000000           movabs     r10, 0xe33ca0e0
01c46 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c4b 0f1f4000                       nop        dword ptr [rax]
01c4f e88ca35007                     call       0x7f1e7f910860
01c54 0f1f84004c1d0009               nop        dword ptr [rax + rax + 0x9001d4c]
01c5c 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01c64 4183c310                       add        r11d, 0x10
01c68 8bb424c0010000                 mov        esi, dword ptr [rsp + 0x1c0]
01c6f 83c610                         add        esi, 0x10
01c72 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01c7a ba02000000                     mov        edx, 2
01c7f 7c05                           jl         0x7f1e78406506
01c81 ba00000000                     mov        edx, 0
01c86 48b9e06a72701e7f0000           movabs     rcx, 0x7f1e70726ae0
01c90 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
01c94 4403c2                         add        r8d, edx
01c97 44894174                       mov        dword ptr [rcx + 0x74], r8d
01c9b 85d2                           test       edx, edx
01c9d 7506                           jne        0x7f1e78406525
01c9f 41b802000000                   mov        r8d, 2
01ca5 4181e0fe3f0000                 and        r8d, 0x3ffe
01cac 4585c0                         test       r8d, r8d
01caf 0f84832b0000                   je         0x7f1e784090b8
01cb5 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01cb9 418502                         test       dword ptr [r10], eax
01cbc 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01cc4 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
01cce b940050000                     mov        ecx, 0x540
01cd3 7c05                           jl         0x7f1e7840655a
01cd5 b950050000                     mov        ecx, 0x550
01cda 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01cde 4d8d4001                       lea        r8, [r8 + 1]
01ce2 4c89040a                       mov        qword ptr [rdx + rcx], r8
01ce6 0f8c2cf5ffff                   jl         0x7f1e78405a98
01cec 48bee06a72701e7f0000           movabs     rsi, 0x7f1e70726ae0
01cf6 ff8660050000                   inc        dword ptr [rsi + 0x560]
01cfc e9a5000000                     jmp        0x7f1e78406626
01d01 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
01d0b 4883827805000001               add        qword ptr [rdx + 0x578], 1
01d13 488bb42468010000               mov        rsi, qword ptr [rsp + 0x168]
01d1b 8b942490010000                 mov        edx, dword ptr [rsp + 0x190]
01d22 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
01d2a 448b842474010000               mov        r8d, dword ptr [rsp + 0x174]
01d32 4c8bcf                         mov        r9, rdi
01d35 4885c9                         test       rcx, rcx
01d38 0f841b2b0000                   je         0x7f1e784090d9
01d3e 85d2                           test       edx, edx
01d40 0f8c132b0000                   jl         0x7f1e784090d9
01d46 4585c0                         test       r8d, r8d
01d49 0f8c0a2b0000                   jl         0x7f1e784090d9
01d4f 4a8d3c0a                       lea        rdi, [rdx + r9]
01d53 3b7e08                         cmp        edi, dword ptr [rsi + 8]
01d56 0f87fd2a0000                   ja         0x7f1e784090d9
01d5c 4b8d3c08                       lea        rdi, [r8 + r9]
01d60 3b7908                         cmp        edi, dword ptr [rcx + 8]
01d63 0f87f02a0000                   ja         0x7f1e784090d9
01d69 4585c9                         test       r9d, r9d
01d6c 0f8ce72a0000                   jl         0x7f1e784090d9
01d72 4863d2                         movsxd     rdx, edx
01d75 4d63c0                         movsxd     r8, r8d
01d78 488d7c160c                     lea        rdi, [rsi + rdx + 0xc]
01d7d 4a8d74010c                     lea        rsi, [rcx + r8 + 0xc]
01d82 498bd1                         mov        rdx, r9
01d85 40f6c40f                       test       spl, 0xf
01d89 0f8412000000                   je         0x7f1e78406621
01d8f 4883ec08                       sub        rsp, 8
01d93 e808394f07                     call       0x7f1e7f8f9f20
01d98 4883c408                       add        rsp, 8
01d9c e905000000                     jmp        0x7f1e78406626
01da1 e8fa384f07                     call       0x7f1e7f8f9f20
01da6 8bb424a4010000                 mov        esi, dword ptr [rsp + 0x1a4]
01dad 8b9c24a0010000                 mov        ebx, dword ptr [rsp + 0x1a0]
01db4 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
01dbc 488bfb                         mov        rdi, rbx
01dbf 2bbc24a8010000                 sub        edi, dword ptr [rsp + 0x1a8]
01dc6 4183f810                       cmp        r8d, 0x10
01dca 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
01dd4 b988050000                     mov        ecx, 0x588
01dd9 7f05                           jg         0x7f1e78406660
01ddb b998050000                     mov        ecx, 0x598
01de0 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
01de4 4d8d4901                       lea        r9, [r9 + 1]
01de8 4c890c0a                       mov        qword ptr [rdx + rcx], r9
01dec 448b8c24a8010000               mov        r9d, dword ptr [rsp + 0x1a8]
01df4 0f8f2c000000                   jg         0x7f1e784066a6
01dfa 4183f910                       cmp        r9d, 0x10
01dfe 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
01e08 b9b8050000                     mov        ecx, 0x5b8
01e0d 7d05                           jge        0x7f1e78406694
01e0f b9a8050000                     mov        ecx, 0x5a8
01e14 488b040a                       mov        rax, qword ptr [rdx + rcx]
01e18 488d4001                       lea        rax, [rax + 1]
01e1c 4889040a                       mov        qword ptr [rdx + rcx], rax
01e20 0f8db6150000                   jge        0x7f1e78407c5c
01e26 453bc8                         cmp        r9d, r8d
01e29 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
01e33 b920060000                     mov        ecx, 0x620
01e38 7c05                           jl         0x7f1e784066bf
01e3a b930060000                     mov        ecx, 0x630
01e3f 488b040a                       mov        rax, qword ptr [rdx + rcx]
01e43 488d4001                       lea        rax, [rax + 1]
01e47 4889040a                       mov        qword ptr [rdx + rcx], rax
01e4b 0f8c84050000                   jl         0x7f1e78406c55
01e51 4183f830                       cmp        r8d, 0x30
01e55 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
01e5f b940060000                     mov        ecx, 0x640
01e64 7e05                           jle        0x7f1e784066eb
01e66 b950060000                     mov        ecx, 0x650
01e6b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
01e6f 4d8d4901                       lea        r9, [r9 + 1]
01e73 4c890c0a                       mov        qword ptr [rdx + rcx], r9
01e77 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
01e7e 0f8ec4000000                   jle        0x7f1e784067c8
01e84 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
01e8e 4883826006000001               add        qword ptr [rdx + 0x660], 1
01e96 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
01e9e 488bd7                         mov        rdx, rdi
01ea1 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
01ea9 498bf8                         mov        rdi, r8
01eac 4c8bc3                         mov        r8, rbx
01eaf 4c8bcf                         mov        r9, rdi
01eb2 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
01eb9 4885f6                         test       rsi, rsi
01ebc 0f84a7290000                   je         0x7f1e784090e9
01ec2 4885c9                         test       rcx, rcx
01ec5 0f849e290000                   je         0x7f1e784090e9
01ecb 85d2                           test       edx, edx
01ecd 0f8c96290000                   jl         0x7f1e784090e9
01ed3 4585c0                         test       r8d, r8d
01ed6 0f8c8d290000                   jl         0x7f1e784090e9
01edc 4a8d3c0a                       lea        rdi, [rdx + r9]
01ee0 3b7e08                         cmp        edi, dword ptr [rsi + 8]
01ee3 0f8780290000                   ja         0x7f1e784090e9
01ee9 4b8d3c08                       lea        rdi, [r8 + r9]
01eed 3b7908                         cmp        edi, dword ptr [rcx + 8]
01ef0 0f8773290000                   ja         0x7f1e784090e9
01ef6 4585c9                         test       r9d, r9d
01ef9 0f8c6a290000                   jl         0x7f1e784090e9
01eff 4863d2                         movsxd     rdx, edx
01f02 4d63c0                         movsxd     r8, r8d
01f05 488d7c160c                     lea        rdi, [rsi + rdx + 0xc]
01f0a 4a8d74010c                     lea        rsi, [rcx + r8 + 0xc]
01f0f 498bd1                         mov        rdx, r9
01f12 40f6c40f                       test       spl, 0xf
01f16 0f8412000000                   je         0x7f1e784067ae
01f1c 4883ec08                       sub        rsp, 8
01f20 e87b374f07                     call       0x7f1e7f8f9f20
01f25 4883c408                       add        rsp, 8
01f29 e905000000                     jmp        0x7f1e784067b3
01f2e e86d374f07                     call       0x7f1e7f8f9f20
01f33 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
01f3d ff8270060000                   inc        dword ptr [rdx + 0x670]
01f43 e96a040000                     jmp        0x7f1e78406c32
01f48 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
01f4f 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
01f56 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
01f5d 899c24e0010000                 mov        dword ptr [rsp + 0x1e0], ebx
01f64 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
01f6b 0f1f440000                     nop        dword ptr [rax + rax]
01f70 898424d8010000                 mov        dword ptr [rsp + 0x1d8], eax
01f77 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
01f7f 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
01f89 4883828806000001               add        qword ptr [rdx + 0x688], 1
01f91 48ba102e105800000000           movabs     rdx, 0x58102e10
01f9b 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
01f9e 83c102                         add        ecx, 2
01fa1 894a70                         mov        dword ptr [rdx + 0x70], ecx
01fa4 81e1feff1f00                   and        ecx, 0x1ffffe
01faa 85c9                           test       ecx, ecx
01fac 0f84c7280000                   je         0x7f1e784090f9
01fb2 48ba102e105800000000           movabs     rdx, 0x58102e10
01fbc 488d92d8000000                 lea        rdx, [rdx + 0xd8]
01fc3 4885c0                         test       rax, rax
01fc6 750c                           jne        0x7f1e78406854
01fc8 f6420801                       test       byte ptr [rdx + 8], 1
01fcc 7506                           jne        0x7f1e78406854
01fce f048834a0801                   lock or    qword ptr [rdx + 8], 1
01fd4 48ba884c62701e7f0000           movabs     rdx, 0x7f1e70624c88
01fde 488d9240030000                 lea        rdx, [rdx + 0x340]
01fe5 4885c0                         test       rax, rax
01fe8 750c                           jne        0x7f1e78406876
01fea f6421001                       test       byte ptr [rdx + 0x10], 1
01fee 7506                           jne        0x7f1e78406876
01ff0 f048834a1001                   lock or    qword ptr [rdx + 0x10], 1
01ff6 48ba102e105800000000           movabs     rdx, 0x58102e10
02000 488382a800000001               add        qword ptr [rdx + 0xa8], 1
02008 48ba884c62701e7f0000           movabs     rdx, 0x7f1e70624c88
02012 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02015 83c102                         add        ecx, 2
02018 894a70                         mov        dword ptr [rdx + 0x70], ecx
0201b 81e1feff1f00                   and        ecx, 0x1ffffe
02021 85c9                           test       ecx, ecx
02023 0f8471280000                   je         0x7f1e7840911a
02029 48ba687030e300000000           movabs     rdx, 0xe3307068
02033 48b9884c62701e7f0000           movabs     rcx, 0x7f1e70624c88
0203d 488b12                         mov        rdx, qword ptr [rdx]
02040 48c1ea2a                       shr        rdx, 0x2a
02044 48c1e209                       shl        rdx, 9
02048 41ba00000058                   mov        r10d, 0x58000000
0204e 4903d2                         add        rdx, r10
02051 41ba16000000                   mov        r10d, 0x16
02057 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0205b 7435                           je         0x7f1e78406912
0205d 4983c202                       add        r10, 2
02061 4983fa1a                       cmp        r10, 0x1a
02065 75f0                           jne        0x7f1e784068d7
02067 41ba16000000                   mov        r10d, 0x16
0206d 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02072 7412                           je         0x7f1e78406906
02074 4983c202                       add        r10, 2
02078 4983fa1a                       cmp        r10, 0x1a
0207c 75ef                           jne        0x7f1e784068ed
0207e 41ba15000000                   mov        r10d, 0x15
02084 eb10                           jmp        0x7f1e78406916
02086 50                             push       rax
02087 4833c0                         xor        rax, rax
0208a 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
0208f 58                             pop        rax
02090 ebbf                           jmp        0x7f1e784068d1
02092 4983c201                       add        r10, 1
02096 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0209b 48ba18740c5800000000           movabs     rdx, 0x580c7418
020a5 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
020a8 83c102                         add        ecx, 2
020ab 894a70                         mov        dword ptr [rdx + 0x70], ecx
020ae 81e1feff1f00                   and        ecx, 0x1ffffe
020b4 85c9                           test       ecx, ecx
020b6 0f84ff270000                   je         0x7f1e7840913b
020bc 48ba18740c5800000000           movabs     rdx, 0x580c7418
020c6 ff82a8000000                   inc        dword ptr [rdx + 0xa8]
020cc 48ba884c62701e7f0000           movabs     rdx, 0x7f1e70624c88
020d6 ff8200010000                   inc        dword ptr [rdx + 0x100]
020dc 48ba884c62701e7f0000           movabs     rdx, 0x7f1e70624c88
020e6 ff8220010000                   inc        dword ptr [rdx + 0x120]
020ec 48ba186830e300000000           movabs     rdx, 0xe3306818
020f6 48b9884c62701e7f0000           movabs     rcx, 0x7f1e70624c88
02100 488b12                         mov        rdx, qword ptr [rdx]
02103 48c1ea2a                       shr        rdx, 0x2a
02107 48c1e209                       shl        rdx, 9
0210b 41ba00000058                   mov        r10d, 0x58000000
02111 4903d2                         add        rdx, r10
02114 41ba27000000                   mov        r10d, 0x27
0211a 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0211e 7435                           je         0x7f1e784069d5
02120 4983c202                       add        r10, 2
02124 4983fa2b                       cmp        r10, 0x2b
02128 75f0                           jne        0x7f1e7840699a
0212a 41ba27000000                   mov        r10d, 0x27
02130 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02135 7412                           je         0x7f1e784069c9
02137 4983c202                       add        r10, 2
0213b 4983fa2b                       cmp        r10, 0x2b
0213f 75ef                           jne        0x7f1e784069b0
02141 41ba26000000                   mov        r10d, 0x26
02147 eb10                           jmp        0x7f1e784069d9
02149 50                             push       rax
0214a 4833c0                         xor        rax, rax
0214d 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
02152 58                             pop        rax
02153 ebbf                           jmp        0x7f1e78406994
02155 4983c201                       add        r10, 1
02159 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0215e 48ba184a62701e7f0000           movabs     rdx, 0x7f1e70624a18
02168 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0216b 83c102                         add        ecx, 2
0216e 894a70                         mov        dword ptr [rdx + 0x70], ecx
02171 81e1feff1f00                   and        ecx, 0x1ffffe
02177 85c9                           test       ecx, ecx
02179 0f845d270000                   je         0x7f1e7840915c
0217f 48ba184a62701e7f0000           movabs     rdx, 0x7f1e70624a18
02189 ff82a8000000                   inc        dword ptr [rdx + 0xa8]
0218f 48ba884c62701e7f0000           movabs     rdx, 0x7f1e70624c88
02199 488d9280010000                 lea        rdx, [rdx + 0x180]
021a0 4885c0                         test       rax, rax
021a3 750c                           jne        0x7f1e78406a31
021a5 f6421801                       test       byte ptr [rdx + 0x18], 1
021a9 7506                           jne        0x7f1e78406a31
021ab f048834a1801                   lock or    qword ptr [rdx + 0x18], 1
021b1 48ba884c62701e7f0000           movabs     rdx, 0x7f1e70624c88
021bb 4883827001000001               add        qword ptr [rdx + 0x170], 1
021c3 48bae04f62701e7f0000           movabs     rdx, 0x7f1e70624fe0
021cd 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
021d0 83c102                         add        ecx, 2
021d3 894a70                         mov        dword ptr [rdx + 0x70], ecx
021d6 81e1feff1f00                   and        ecx, 0x1ffffe
021dc 85c9                           test       ecx, ecx
021de 0f8419270000                   je         0x7f1e7840917d
021e4 48bae04f62701e7f0000           movabs     rdx, 0x7f1e70624fe0
021ee 4883820801000001               add        qword ptr [rdx + 0x108], 1
021f6 48ba905162701e7f0000           movabs     rdx, 0x7f1e70625190
02200 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02203 83c102                         add        ecx, 2
02206 894a70                         mov        dword ptr [rdx + 0x70], ecx
02209 81e1feff1f00                   and        ecx, 0x1ffffe
0220f 85c9                           test       ecx, ecx
02211 0f8407270000                   je         0x7f1e7840919e
02217 8b5008                         mov        edx, dword ptr [rax + 8]
0221a 48b9905162701e7f0000           movabs     rcx, 0x7f1e70625190
02224 488381a800000001               add        qword ptr [rcx + 0xa8], 1
0222c 83ea07                         sub        edx, 7
0222f 48b9801d23e200000000           movabs     rcx, 0xe2231d80
02239 b900000000                     mov        ecx, 0
0223e 3bf9                           cmp        edi, ecx
02240 0f8cfe260000                   jl         0x7f1e784091c4
02246 3bfa                           cmp        edi, edx
02248 0f8d03270000                   jge        0x7f1e784091d1
0224e 488bd7                         mov        rdx, rdi
02251 48be00b722e200000000           movabs     rsi, 0xe222b700
0225b 488bce                         mov        rcx, rsi
0225e 49b8e04f62701e7f0000           movabs     r8, 0x7f1e70624fe0
02268 488b09                         mov        rcx, qword ptr [rcx]
0226b 48c1e92a                       shr        rcx, 0x2a
0226f 48c1e109                       shl        rcx, 9
02273 41ba00000058                   mov        r10d, 0x58000000
02279 4903ca                         add        rcx, r10
0227c 41ba24000000                   mov        r10d, 0x24
02282 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
02286 7435                           je         0x7f1e78406b3d
02288 4983c202                       add        r10, 2
0228c 4983fa28                       cmp        r10, 0x28
02290 75f0                           jne        0x7f1e78406b02
02292 41ba24000000                   mov        r10d, 0x24
02298 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
0229d 7412                           je         0x7f1e78406b31
0229f 4983c202                       add        r10, 2
022a3 4983fa28                       cmp        r10, 0x28
022a7 75ef                           jne        0x7f1e78406b18
022a9 41ba23000000                   mov        r10d, 0x23
022af eb10                           jmp        0x7f1e78406b41
022b1 50                             push       rax
022b2 4833c0                         xor        rax, rax
022b5 4b0fb10cd0                     cmpxchg    qword ptr [r8 + r10*8], rcx
022ba 58                             pop        rax
022bb ebbf                           jmp        0x7f1e78406afc
022bd 4983c201                       add        r10, 1
022c1 4b8304d001                     add        qword ptr [r8 + r10*8], 1
022c6 4863d2                         movsxd     rdx, edx
022c9 488bca                         mov        rcx, rdx
022cc 41ba0c000000                   mov        r10d, 0xc
022d2 4903ca                         add        rcx, r10
022d5 488bd0                         mov        rdx, rax
022d8 41b800000000                   mov        r8d, 0
022de 89bc24dc010000                 mov        dword ptr [rsp + 0x1dc], edi
022e5 6690                           nop        
022e7 e8f4925007                     call       0x7f1e7f90fe60
022ec 0f1f8400e423000b               nop        dword ptr [rax + rax + 0xb0023e4]
022f4 48bee06a72701e7f0000           movabs     rsi, 0x7f1e70726ae0
022fe 4883869806000001               add        qword ptr [rsi + 0x698], 1
02306 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
0230e 8b9424d8010000                 mov        edx, dword ptr [rsp + 0x1d8]
02315 488bc8                         mov        rcx, rax
02318 0f1f8000000000                 nop        dword ptr [rax]
0231f e8bc9c5007                     call       0x7f1e7f910860
02324 0f1f84001c24000c               nop        dword ptr [rax + rax + 0xc00241c]
0232c 8b8424d8010000                 mov        eax, dword ptr [rsp + 0x1d8]
02333 83c008                         add        eax, 8
02336 8bbc24dc010000                 mov        edi, dword ptr [rsp + 0x1dc]
0233d 83c708                         add        edi, 8
02340 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
02347 be02000000                     mov        esi, 2
0234c 7c05                           jl         0x7f1e78406bd3
0234e be00000000                     mov        esi, 0
02353 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
0235d 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
02360 03ce                           add        ecx, esi
02362 894a74                         mov        dword ptr [rdx + 0x74], ecx
02365 85f6                           test       esi, esi
02367 7505                           jne        0x7f1e78406bee
02369 b902000000                     mov        ecx, 2
0236e 81e1fe3f0000                   and        ecx, 0x3ffe
02374 85c9                           test       ecx, ecx
02376 0f84e2250000                   je         0x7f1e784091de
0237c 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02380 418502                         test       dword ptr [r10], eax
02383 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
0238a 48bee06a72701e7f0000           movabs     rsi, 0x7f1e70726ae0
02394 baa8060000                     mov        edx, 0x6a8
02399 7c05                           jl         0x7f1e78406c20
0239b bab8060000                     mov        edx, 0x6b8
023a0 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
023a4 488d4901                       lea        rcx, [rcx + 1]
023a8 48890c16                       mov        qword ptr [rsi + rdx], rcx
023ac 0f8cbefbffff                   jl         0x7f1e784067f0
023b2 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
023b9 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
023c0 48bee06a72701e7f0000           movabs     rsi, 0x7f1e70726ae0
023ca ff86c8060000                   inc        dword ptr [rsi + 0x6c8]
023d0 e9211a0000                     jmp        0x7f1e78408676
023d5 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
023dc 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
023e3 4183f910                       cmp        r9d, 0x10
023e7 48bee06a72701e7f0000           movabs     rsi, 0x7f1e70726ae0
023f1 bae0060000                     mov        edx, 0x6e0
023f6 7c05                           jl         0x7f1e78406c7d
023f8 baf0060000                     mov        edx, 0x6f0
023fd 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
02401 488d4901                       lea        rcx, [rcx + 1]
02405 48890c16                       mov        qword ptr [rsi + rdx], rcx
02409 0f8cdd0a0000                   jl         0x7f1e7840776c
0240f 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
02416 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
0241d 899c24f0010000                 mov        dword ptr [rsp + 0x1f0], ebx
02424 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
0242b 0f1f440000                     nop        dword ptr [rax + rax]
02430 898424ec010000                 mov        dword ptr [rsp + 0x1ec], eax
02437 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0243f 48bee06a72701e7f0000           movabs     rsi, 0x7f1e70726ae0
02449 4883860007000001               add        qword ptr [rsi + 0x700], 1
02451 48be284279701e7f0000           movabs     rsi, 0x7f1e70794228
0245b 8b5670                         mov        edx, dword ptr [rsi + 0x70]
0245e 83c202                         add        edx, 2
02461 895670                         mov        dword ptr [rsi + 0x70], edx
02464 81e2feff1f00                   and        edx, 0x1ffffe
0246a 85d2                           test       edx, edx
0246c 0f840d250000                   je         0x7f1e784091ff
02472 48be50f237e300000000           movabs     rsi, 0xe337f250
0247c 48ba284279701e7f0000           movabs     rdx, 0x7f1e70794228
02486 488b36                         mov        rsi, qword ptr [rsi]
02489 48c1ee2a                       shr        rsi, 0x2a
0248d 48c1e609                       shl        rsi, 9
02491 41ba00000058                   mov        r10d, 0x58000000
02497 4903f2                         add        rsi, r10
0249a 41ba16000000                   mov        r10d, 0x16
024a0 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
024a4 7435                           je         0x7f1e78406d5b
024a6 4983c202                       add        r10, 2
024aa 4983fa1a                       cmp        r10, 0x1a
024ae 75f0                           jne        0x7f1e78406d20
024b0 41ba16000000                   mov        r10d, 0x16
024b6 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
024bb 7412                           je         0x7f1e78406d4f
024bd 4983c202                       add        r10, 2
024c1 4983fa1a                       cmp        r10, 0x1a
024c5 75ef                           jne        0x7f1e78406d36
024c7 41ba15000000                   mov        r10d, 0x15
024cd eb10                           jmp        0x7f1e78406d5f
024cf 50                             push       rax
024d0 4833c0                         xor        rax, rax
024d3 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
024d8 58                             pop        rax
024d9 ebbf                           jmp        0x7f1e78406d1a
024db 4983c201                       add        r10, 1
024df 4a8304d201                     add        qword ptr [rdx + r10*8], 1
024e4 448b6808                       mov        r13d, dword ptr [rax + 8]
024e8 48be284279701e7f0000           movabs     rsi, 0x7f1e70794228
024f2 488386d800000001               add        qword ptr [rsi + 0xd8], 1
024fa 48bec03779701e7f0000           movabs     rsi, 0x7f1e707937c0
02504 8b5670                         mov        edx, dword ptr [rsi + 0x70]
02507 83c202                         add        edx, 2
0250a 895670                         mov        dword ptr [rsi + 0x70], edx
0250d 81e2feff1f00                   and        edx, 0x1ffffe
02513 85d2                           test       edx, edx
02515 0f848a240000                   je         0x7f1e78409225
0251b 48bec03779701e7f0000           movabs     rsi, 0x7f1e707937c0
02525 4883860801000001               add        qword ptr [rsi + 0x108], 1
0252d 498bf5                         mov        rsi, r13
02530 83ee0f                         sub        esi, 0xf
02533 48ba902e79701e7f0000           movabs     rdx, 0x7f1e70792e90
0253d 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02540 83c102                         add        ecx, 2
02543 894a70                         mov        dword ptr [rdx + 0x70], ecx
02546 81e1feff1f00                   and        ecx, 0x1ffffe
0254c 85c9                           test       ecx, ecx
0254e 0f8472240000                   je         0x7f1e78409246
02554 48ba902e79701e7f0000           movabs     rdx, 0x7f1e70792e90
0255e 488382a800000001               add        qword ptr [rdx + 0xa8], 1
02566 48ba0000000000000000           movabs     rdx, 0
02570 ba00000000                     mov        edx, 0
02575 3bfa                           cmp        edi, edx
02577 0f8c6a240000                   jl         0x7f1e78409267
0257d 3bfe                           cmp        edi, esi
0257f 0f8d6f240000                   jge        0x7f1e78409274
02585 488bf7                         mov        rsi, rdi
02588 48ba50f237e300000000           movabs     rdx, 0xe337f250
02592 488bca                         mov        rcx, rdx
02595 49b8284279701e7f0000           movabs     r8, 0x7f1e70794228
0259f 488b09                         mov        rcx, qword ptr [rcx]
025a2 48c1e92a                       shr        rcx, 0x2a
025a6 48c1e109                       shl        rcx, 9
025aa 41ba00000058                   mov        r10d, 0x58000000
025b0 4903ca                         add        rcx, r10
025b3 41ba24000000                   mov        r10d, 0x24
025b9 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
025bd 7435                           je         0x7f1e78406e74
025bf 4983c202                       add        r10, 2
025c3 4983fa28                       cmp        r10, 0x28
025c7 75f0                           jne        0x7f1e78406e39
025c9 41ba24000000                   mov        r10d, 0x24
025cf 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
025d4 7412                           je         0x7f1e78406e68
025d6 4983c202                       add        r10, 2
025da 4983fa28                       cmp        r10, 0x28
025de 75ef                           jne        0x7f1e78406e4f
025e0 41ba23000000                   mov        r10d, 0x23
025e6 eb10                           jmp        0x7f1e78406e78
025e8 50                             push       rax
025e9 4833c0                         xor        rax, rax
025ec 4b0fb10cd0                     cmpxchg    qword ptr [r8 + r10*8], rcx
025f1 58                             pop        rax
025f2 ebbf                           jmp        0x7f1e78406e33
025f4 4983c201                       add        r10, 1
025f8 4b8304d001                     add        qword ptr [r8 + r10*8], 1
025fd 48b9902f79701e7f0000           movabs     rcx, 0x7f1e70792f90
02607 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
0260b 4183c002                       add        r8d, 2
0260f 44894170                       mov        dword ptr [rcx + 0x70], r8d
02613 4181e0feff1f00                 and        r8d, 0x1ffffe
0261a 4585c0                         test       r8d, r8d
0261d 0f84de230000                   je         0x7f1e78409281
02623 48b9902f79701e7f0000           movabs     rcx, 0x7f1e70792f90
0262d 488381a800000001               add        qword ptr [rcx + 0xa8], 1
02635 48bab83079701e7f0000           movabs     rdx, 0x7f1e707930b8
0263f 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02642 83c102                         add        ecx, 2
02645 894a70                         mov        dword ptr [rdx + 0x70], ecx
02648 81e1feff1f00                   and        ecx, 0x1ffffe
0264e 85c9                           test       ecx, ecx
02650 0f84cc230000                   je         0x7f1e784092a2
02656 48bab83079701e7f0000           movabs     rdx, 0x7f1e707930b8
02660 ff82b8000000                   inc        dword ptr [rdx + 0xb8]
02666 4489ac24e8010000               mov        dword ptr [rsp + 0x1e8], r13d
0266e 89bc24e4010000                 mov        dword ptr [rsp + 0x1e4], edi
02675 48ba68c539e300000000           movabs     rdx, 0xe339c568
0267f 488bca                         mov        rcx, rdx
02682 49b8284279701e7f0000           movabs     r8, 0x7f1e70794228
0268c 4983805801000001               add        qword ptr [r8 + 0x158], 1
02694 48b9f04379701e7f0000           movabs     rcx, 0x7f1e707943f0
0269e 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
026a2 4183c002                       add        r8d, 2
026a6 44894170                       mov        dword ptr [rcx + 0x70], r8d
026aa 4181e0feff1f00                 and        r8d, 0x1ffffe
026b1 4585c0                         test       r8d, r8d
026b4 0f8489230000                   je         0x7f1e784092c3
026ba 488bca                         mov        rcx, rdx
026bd 49b8f04379701e7f0000           movabs     r8, 0x7f1e707943f0
026c7 498380a800000001               add        qword ptr [r8 + 0xa8], 1
026cf 48b9d04479701e7f0000           movabs     rcx, 0x7f1e707944d0
026d9 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
026dd 4183c002                       add        r8d, 2
026e1 44894170                       mov        dword ptr [rcx + 0x70], r8d
026e5 4181e0feff1f00                 and        r8d, 0x1ffffe
026ec 4585c0                         test       r8d, r8d
026ef 0f846f230000                   je         0x7f1e784092e4
026f5 48b9d04479701e7f0000           movabs     rcx, 0x7f1e707944d0
026ff 488381b800000001               add        qword ptr [rcx + 0xb8], 1
02707 48ba383979701e7f0000           movabs     rdx, 0x7f1e70793938
02711 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02714 83c102                         add        ecx, 2
02717 894a70                         mov        dword ptr [rdx + 0x70], ecx
0271a 81e1feff1f00                   and        ecx, 0x1ffffe
02720 85c9                           test       ecx, ecx
02722 0f845d230000                   je         0x7f1e78409305
02728 48ba50f237e300000000           movabs     rdx, 0xe337f250
02732 488bca                         mov        rcx, rdx
02735 49b8d04479701e7f0000           movabs     r8, 0x7f1e707944d0
0273f 488b09                         mov        rcx, qword ptr [rcx]
02742 48c1e92a                       shr        rcx, 0x2a
02746 48c1e109                       shl        rcx, 9
0274a 41ba00000058                   mov        r10d, 0x58000000
02750 4903ca                         add        rcx, r10
02753 41ba1c000000                   mov        r10d, 0x1c
02759 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0275d 7435                           je         0x7f1e78407014
0275f 4983c202                       add        r10, 2
02763 4983fa20                       cmp        r10, 0x20
02767 75f0                           jne        0x7f1e78406fd9
02769 41ba1c000000                   mov        r10d, 0x1c
0276f 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
02774 7412                           je         0x7f1e78407008
02776 4983c202                       add        r10, 2
0277a 4983fa20                       cmp        r10, 0x20
0277e 75ef                           jne        0x7f1e78406fef
02780 41ba1b000000                   mov        r10d, 0x1b
02786 eb10                           jmp        0x7f1e78407018
02788 50                             push       rax
02789 4833c0                         xor        rax, rax
0278c 4b0fb10cd0                     cmpxchg    qword ptr [r8 + r10*8], rcx
02791 58                             pop        rax
02792 ebbf                           jmp        0x7f1e78406fd3
02794 4983c201                       add        r10, 1
02798 4b8304d001                     add        qword ptr [r8 + r10*8], 1
0279d 48b9d04479701e7f0000           movabs     rcx, 0x7f1e707944d0
027a7 488b12                         mov        rdx, qword ptr [rdx]
027aa 48c1ea2a                       shr        rdx, 0x2a
027ae 48c1e209                       shl        rdx, 9
027b2 41ba00000058                   mov        r10d, 0x58000000
027b8 4903d2                         add        rdx, r10
027bb 41ba22000000                   mov        r10d, 0x22
027c1 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
027c5 7435                           je         0x7f1e7840707c
027c7 4983c202                       add        r10, 2
027cb 4983fa26                       cmp        r10, 0x26
027cf 75f0                           jne        0x7f1e78407041
027d1 41ba22000000                   mov        r10d, 0x22
027d7 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
027dc 7412                           je         0x7f1e78407070
027de 4983c202                       add        r10, 2
027e2 4983fa26                       cmp        r10, 0x26
027e6 75ef                           jne        0x7f1e78407057
027e8 41ba21000000                   mov        r10d, 0x21
027ee eb10                           jmp        0x7f1e78407080
027f0 50                             push       rax
027f1 4833c0                         xor        rax, rax
027f4 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
027f9 58                             pop        rax
027fa ebbf                           jmp        0x7f1e7840703b
027fc 4983c201                       add        r10, 1
02800 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02805 48bad04479701e7f0000           movabs     rdx, 0x7f1e707944d0
0280f 4883823801000001               add        qword ptr [rdx + 0x138], 1
02817 48baf83979701e7f0000           movabs     rdx, 0x7f1e707939f8
02821 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02824 83c102                         add        ecx, 2
02827 894a70                         mov        dword ptr [rdx + 0x70], ecx
0282a 81e1feff1f00                   and        ecx, 0x1ffffe
02830 85c9                           test       ecx, ecx
02832 0f846e220000                   je         0x7f1e78409326
02838 48bad04479701e7f0000           movabs     rdx, 0x7f1e707944d0
02842 4883824801000001               add        qword ptr [rdx + 0x148], 1
0284a 4c63f6                         movsxd     r14, esi
0284d be0c000000                     mov        esi, 0xc
02852 4d8bce                         mov        r9, r14
02855 4c03ce                         add        r9, rsi
02858 48bee02b79701e7f0000           movabs     rsi, 0x7f1e70792be0
02862 8b5670                         mov        edx, dword ptr [rsi + 0x70]
02865 83c202                         add        edx, 2
02868 895670                         mov        dword ptr [rsi + 0x70], edx
0286b 81e2feff1f00                   and        edx, 0x1ffffe
02871 85d2                           test       edx, edx
02873 0f844e220000                   je         0x7f1e78409347
02879 48bee02b79701e7f0000           movabs     rsi, 0x7f1e70792be0
02883 488386d800000001               add        qword ptr [rsi + 0xd8], 1
0288b 48be582d79701e7f0000           movabs     rsi, 0x7f1e70792d58
02895 8b5670                         mov        edx, dword ptr [rsi + 0x70]
02898 83c202                         add        edx, 2
0289b 895670                         mov        dword ptr [rsi + 0x70], edx
0289e 81e2feff1f00                   and        edx, 0x1ffffe
028a4 85d2                           test       edx, edx
028a6 0f843c220000                   je         0x7f1e78409368
028ac 48bed04479701e7f0000           movabs     rsi, 0x7f1e707944d0
028b6 4883866801000001               add        qword ptr [rsi + 0x168], 1
028be 48be38c03ae300000000           movabs     rsi, 0xe33ac038
028c8 48be98f237e300000000           movabs     rsi, 0xe337f298
028d2 ba02000000                     mov        edx, 2
028d7 b910000000                     mov        ecx, 0x10
028dc 4c8bc0                         mov        r8, rax
028df bf00000000                     mov        edi, 0
028e4 48890424                       mov        qword ptr [rsp], rax
028e8 4c89742408                     mov        qword ptr [rsp + 8], r14
028ed 49ba50f237e300000000           movabs     r10, 0xe337f250
028f7 4c89542410                     mov        qword ptr [rsp + 0x10], r10
028fc 49ba38c03ae300000000           movabs     r10, 0xe33ac038
02906 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0290b 0f1f4000                       nop        dword ptr [rax]
0290f e8cc965007                     call       0x7f1e7f910860
02914 0f1f84000c2a000e               nop        dword ptr [rax + rax + 0xe002a0c]
0291c 4885c0                         test       rax, rax
0291f 48bbd04479701e7f0000           movabs     rbx, 0x7f1e707944d0
02929 750c                           jne        0x7f1e784071b7
0292b 808b7101000001                 or         byte ptr [rbx + 0x171], 1
02932 e98b000000                     jmp        0x7f1e78407242
02937 488b38                         mov        rdi, qword ptr [rax]
0293a 48c1ef2a                       shr        rdi, 0x2a
0293e 48c1e709                       shl        rdi, 9
02942 41ba00000058                   mov        r10d, 0x58000000
02948 4903fa                         add        rdi, r10
0294b 41ba30000000                   mov        r10d, 0x30
02951 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
02955 7435                           je         0x7f1e7840720c
02957 4983c202                       add        r10, 2
0295b 4983fa34                       cmp        r10, 0x34
0295f 75f0                           jne        0x7f1e784071d1
02961 41ba30000000                   mov        r10d, 0x30
02967 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0296c 7412                           je         0x7f1e78407200
0296e 4983c202                       add        r10, 2
02972 4983fa34                       cmp        r10, 0x34
02976 75ef                           jne        0x7f1e784071e7
02978 41ba2f000000                   mov        r10d, 0x2f
0297e eb10                           jmp        0x7f1e78407210
02980 50                             push       rax
02981 4833c0                         xor        rax, rax
02984 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
02989 58                             pop        rax
0298a ebbf                           jmp        0x7f1e784071cb
0298c 4983c201                       add        r10, 1
02990 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02995 48bf0006145800000000           movabs     rdi, 0x58140600
0299f 488b18                         mov        rbx, qword ptr [rax]
029a2 48c1eb2a                       shr        rbx, 0x2a
029a6 48c1e309                       shl        rbx, 9
029aa 41ba00000058                   mov        r10d, 0x58000000
029b0 4903da                         add        rbx, r10
029b3 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
029b7 0f854c210000                   jne        0x7f1e78409389
029bd e900000000                     jmp        0x7f1e78407242
029c2 488bf8                         mov        rdi, rax
029c5 4889bc24f8010000               mov        qword ptr [rsp + 0x1f8], rdi
029cd 483b07                         cmp        rax, qword ptr [rdi]
029d0 488bf7                         mov        rsi, rdi
029d3 48bbe06a72701e7f0000           movabs     rbx, 0x7f1e70726ae0
029dd 488b36                         mov        rsi, qword ptr [rsi]
029e0 48c1ee2a                       shr        rsi, 0x2a
029e4 48c1e609                       shl        rsi, 9
029e8 41ba00000058                   mov        r10d, 0x58000000
029ee 4903f2                         add        rsi, r10
029f1 41bae3000000                   mov        r10d, 0xe3
029f7 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
029fb 743b                           je         0x7f1e784072b8
029fd 4983c202                       add        r10, 2
02a01 4981fae7000000                 cmp        r10, 0xe7
02a08 75ed                           jne        0x7f1e78407277
02a0a 41bae3000000                   mov        r10d, 0xe3
02a10 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02a15 7415                           je         0x7f1e784072ac
02a17 4983c202                       add        r10, 2
02a1b 4981fae7000000                 cmp        r10, 0xe7
02a22 75ec                           jne        0x7f1e78407290
02a24 41bae2000000                   mov        r10d, 0xe2
02a2a eb10                           jmp        0x7f1e784072bc
02a2c 50                             push       rax
02a2d 4833c0                         xor        rax, rax
02a30 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
02a35 58                             pop        rax
02a36 ebb9                           jmp        0x7f1e78407271
02a38 4983c201                       add        r10, 1
02a3c 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02a41 48bee84e79701e7f0000           movabs     rsi, 0x7f1e70794ee8
02a4b 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
02a4e 83c302                         add        ebx, 2
02a51 895e70                         mov        dword ptr [rsi + 0x70], ebx
02a54 81e3feff1f00                   and        ebx, 0x1ffffe
02a5a 85db                           test       ebx, ebx
02a5c 0f84b5200000                   je         0x7f1e78409397
02a62 488bf7                         mov        rsi, rdi
02a65 48bbe84e79701e7f0000           movabs     rbx, 0x7f1e70794ee8
02a6f 488b36                         mov        rsi, qword ptr [rsi]
02a72 48c1ee2a                       shr        rsi, 0x2a
02a76 48c1e609                       shl        rsi, 9
02a7a 41ba00000058                   mov        r10d, 0x58000000
02a80 4903f2                         add        rsi, r10
02a83 41ba16000000                   mov        r10d, 0x16
02a89 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02a8d 7435                           je         0x7f1e78407344
02a8f 4983c202                       add        r10, 2
02a93 4983fa1a                       cmp        r10, 0x1a
02a97 75f0                           jne        0x7f1e78407309
02a99 41ba16000000                   mov        r10d, 0x16
02a9f 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02aa4 7412                           je         0x7f1e78407338
02aa6 4983c202                       add        r10, 2
02aaa 4983fa1a                       cmp        r10, 0x1a
02aae 75ef                           jne        0x7f1e7840731f
02ab0 41ba15000000                   mov        r10d, 0x15
02ab6 eb10                           jmp        0x7f1e78407348
02ab8 50                             push       rax
02ab9 4833c0                         xor        rax, rax
02abc 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
02ac1 58                             pop        rax
02ac2 ebbf                           jmp        0x7f1e78407303
02ac4 4983c201                       add        r10, 1
02ac8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02acd 488bf7                         mov        rsi, rdi
02ad0 0f1f440000                     nop        dword ptr [rax + rax]
02ad5 48b8d08464541e7f0000           movabs     rax, 0x7f1e546484d0
02adf e8fc8f5007                     call       0x7f1e7f910360
02ae4 0f1f8400dc2b000f               nop        dword ptr [rax + rax + 0xf002bdc]
02aec 48bee84e79701e7f0000           movabs     rsi, 0x7f1e70794ee8
02af6 488386d800000001               add        qword ptr [rsi + 0xd8], 1
02afe 48bec03779701e7f0000           movabs     rsi, 0x7f1e707937c0
02b08 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
02b0b 83c702                         add        edi, 2
02b0e 897e70                         mov        dword ptr [rsi + 0x70], edi
02b11 81e7feff1f00                   and        edi, 0x1ffffe
02b17 85ff                           test       edi, edi
02b19 0f8419200000                   je         0x7f1e784093b8
02b1f 448bac24e8010000               mov        r13d, dword ptr [rsp + 0x1e8]
02b27 8bbc24ec010000                 mov        edi, dword ptr [rsp + 0x1ec]
02b2e 48bec03779701e7f0000           movabs     rsi, 0x7f1e707937c0
02b38 4883860801000001               add        qword ptr [rsi + 0x108], 1
02b40 ffc8                           dec        eax
02b42 442be8                         sub        r13d, eax
02b45 48be902e79701e7f0000           movabs     rsi, 0x7f1e70792e90
02b4f 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
02b52 83c302                         add        ebx, 2
02b55 895e70                         mov        dword ptr [rsi + 0x70], ebx
02b58 81e3feff1f00                   and        ebx, 0x1ffffe
02b5e 85db                           test       ebx, ebx
02b60 0f84f31f0000                   je         0x7f1e784093d9
02b66 48be902e79701e7f0000           movabs     rsi, 0x7f1e70792e90
02b70 488386a800000001               add        qword ptr [rsi + 0xa8], 1
02b78 48be0000000000000000           movabs     rsi, 0
02b82 be00000000                     mov        esi, 0
02b87 3bfe                           cmp        edi, esi
02b89 0f8ceb1f0000                   jl         0x7f1e784093fa
02b8f 413bfd                         cmp        edi, r13d
02b92 0f8def1f0000                   jge        0x7f1e78409407
02b98 488bc7                         mov        rax, rdi
02b9b 898424f4010000                 mov        dword ptr [rsp + 0x1f4], eax
02ba2 89bc24ec010000                 mov        dword ptr [rsp + 0x1ec], edi
02ba9 488bbc24f8010000               mov        rdi, qword ptr [rsp + 0x1f8]
02bb1 488bf7                         mov        rsi, rdi
02bb4 48b9e84e79701e7f0000           movabs     rcx, 0x7f1e70794ee8
02bbe 488b36                         mov        rsi, qword ptr [rsi]
02bc1 48c1ee2a                       shr        rsi, 0x2a
02bc5 48c1e609                       shl        rsi, 9
02bc9 41ba00000058                   mov        r10d, 0x58000000
02bcf 4903f2                         add        rsi, r10
02bd2 41ba1e000000                   mov        r10d, 0x1e
02bd8 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
02bdc 7435                           je         0x7f1e78407493
02bde 4983c202                       add        r10, 2
02be2 4983fa22                       cmp        r10, 0x22
02be6 75f0                           jne        0x7f1e78407458
02be8 41ba1e000000                   mov        r10d, 0x1e
02bee 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02bf3 7412                           je         0x7f1e78407487
02bf5 4983c202                       add        r10, 2
02bf9 4983fa22                       cmp        r10, 0x22
02bfd 75ef                           jne        0x7f1e7840746e
02bff 41ba1d000000                   mov        r10d, 0x1d
02c05 eb10                           jmp        0x7f1e78407497
02c07 50                             push       rax
02c08 4833c0                         xor        rax, rax
02c0b 4a0fb134d1                     cmpxchg    qword ptr [rcx + r10*8], rsi
02c10 58                             pop        rax
02c11 ebbf                           jmp        0x7f1e78407452
02c13 4983c201                       add        r10, 1
02c17 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02c1c 488bf7                         mov        rsi, rdi
02c1f 660f1f440000                   nop        word ptr [rax + rax]
02c25 48b8f88464541e7f0000           movabs     rax, 0x7f1e546484f8
02c2f e8ac8e5007                     call       0x7f1e7f910360
02c34 0f1f84002c2d0010               nop        dword ptr [rax + rax + 0x10002d2c]
02c3c 483b00                         cmp        rax, qword ptr [rax]
02c3f 488bf0                         mov        rsi, rax
02c42 48bae84e79701e7f0000           movabs     rdx, 0x7f1e70794ee8
02c4c 488b36                         mov        rsi, qword ptr [rsi]
02c4f 48c1ee2a                       shr        rsi, 0x2a
02c53 48c1e609                       shl        rsi, 9
02c57 41ba00000058                   mov        r10d, 0x58000000
02c5d 4903f2                         add        rsi, r10
02c60 41ba24000000                   mov        r10d, 0x24
02c66 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02c6a 7435                           je         0x7f1e78407521
02c6c 4983c202                       add        r10, 2
02c70 4983fa28                       cmp        r10, 0x28
02c74 75f0                           jne        0x7f1e784074e6
02c76 41ba24000000                   mov        r10d, 0x24
02c7c 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02c81 7412                           je         0x7f1e78407515
02c83 4983c202                       add        r10, 2
02c87 4983fa28                       cmp        r10, 0x28
02c8b 75ef                           jne        0x7f1e784074fc
02c8d 41ba23000000                   mov        r10d, 0x23
02c93 eb10                           jmp        0x7f1e78407525
02c95 50                             push       rax
02c96 4833c0                         xor        rax, rax
02c99 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
02c9e 58                             pop        rax
02c9f ebbf                           jmp        0x7f1e784074e0
02ca1 4983c201                       add        r10, 1
02ca5 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02caa 8b7028                         mov        esi, dword ptr [rax + 0x28]
02cad 488bd0                         mov        rdx, rax
02cb0 48b9e84e79701e7f0000           movabs     rcx, 0x7f1e70794ee8
02cba 488b12                         mov        rdx, qword ptr [rdx]
02cbd 48c1ea2a                       shr        rdx, 0x2a
02cc1 48c1e209                       shl        rdx, 9
02cc5 41ba00000058                   mov        r10d, 0x58000000
02ccb 4903d2                         add        rdx, r10
02cce 41ba2a000000                   mov        r10d, 0x2a
02cd4 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02cd8 7435                           je         0x7f1e7840758f
02cda 4983c202                       add        r10, 2
02cde 4983fa2e                       cmp        r10, 0x2e
02ce2 75f0                           jne        0x7f1e78407554
02ce4 41ba2a000000                   mov        r10d, 0x2a
02cea 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02cef 7412                           je         0x7f1e78407583
02cf1 4983c202                       add        r10, 2
02cf5 4983fa2e                       cmp        r10, 0x2e
02cf9 75ef                           jne        0x7f1e7840756a
02cfb 41ba29000000                   mov        r10d, 0x29
02d01 eb10                           jmp        0x7f1e78407593
02d03 50                             push       rax
02d04 4833c0                         xor        rax, rax
02d07 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
02d0c 58                             pop        rax
02d0d ebbf                           jmp        0x7f1e7840754e
02d0f 4983c201                       add        r10, 1
02d13 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02d18 8b4808                         mov        ecx, dword ptr [rax + 8]
02d1b 48bae84e79701e7f0000           movabs     rdx, 0x7f1e70794ee8
02d25 4883827801000001               add        qword ptr [rdx + 0x178], 1
02d2d 48baf83979701e7f0000           movabs     rdx, 0x7f1e707939f8
02d37 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02d3b 4183c002                       add        r8d, 2
02d3f 44894270                       mov        dword ptr [rdx + 0x70], r8d
02d43 4181e0feff1f00                 and        r8d, 0x1ffffe
02d4a 4585c0                         test       r8d, r8d
02d4d 0f84461e0000                   je         0x7f1e78409419
02d53 48bae84e79701e7f0000           movabs     rdx, 0x7f1e70794ee8
02d5d 4883828801000001               add        qword ptr [rdx + 0x188], 1
02d65 8b8424f4010000                 mov        eax, dword ptr [rsp + 0x1f4]
02d6c 4863c0                         movsxd     rax, eax
02d6f ba0c000000                     mov        edx, 0xc
02d74 4c8bc8                         mov        r9, rax
02d77 4c03ca                         add        r9, rdx
02d7a 48bae02b79701e7f0000           movabs     rdx, 0x7f1e70792be0
02d84 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02d88 4183c002                       add        r8d, 2
02d8c 44894270                       mov        dword ptr [rdx + 0x70], r8d
02d90 4181e0feff1f00                 and        r8d, 0x1ffffe
02d97 4585c0                         test       r8d, r8d
02d9a 0f841a1e0000                   je         0x7f1e7840943a
02da0 48bae02b79701e7f0000           movabs     rdx, 0x7f1e70792be0
02daa 488382d800000001               add        qword ptr [rdx + 0xd8], 1
02db2 48ba582d79701e7f0000           movabs     rdx, 0x7f1e70792d58
02dbc 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02dc0 4183c002                       add        r8d, 2
02dc4 44894270                       mov        dword ptr [rdx + 0x70], r8d
02dc8 4181e0feff1f00                 and        r8d, 0x1ffffe
02dcf 4585c0                         test       r8d, r8d
02dd2 0f84031e0000                   je         0x7f1e7840945b
02dd8 48bae84e79701e7f0000           movabs     rdx, 0x7f1e70794ee8
02de2 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
02dea 48bae0a03ce300000000           movabs     rdx, 0xe33ca0e0
02df4 ba02000000                     mov        edx, 2
02df9 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
02e01 bf00000000                     mov        edi, 0
02e06 488b9c24f8010000               mov        rbx, qword ptr [rsp + 0x1f8]
02e0e 48891c24                       mov        qword ptr [rsp], rbx
02e12 488b9c2438010000               mov        rbx, qword ptr [rsp + 0x138]
02e1a 48895c2408                     mov        qword ptr [rsp + 8], rbx
02e1f 4889442410                     mov        qword ptr [rsp + 0x10], rax
02e24 49bae0a03ce300000000           movabs     r10, 0xe33ca0e0
02e2e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02e33 0f1f4000                       nop        dword ptr [rax]
02e37 e8a4915007                     call       0x7f1e7f910860
02e3c 0f1f8400342f0011               nop        dword ptr [rax + rax + 0x11002f34]
02e44 8b8424ec010000                 mov        eax, dword ptr [rsp + 0x1ec]
02e4b 83c010                         add        eax, 0x10
02e4e 8bbc24e4010000                 mov        edi, dword ptr [rsp + 0x1e4]
02e55 83c710                         add        edi, 0x10
02e58 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02e5f ba02000000                     mov        edx, 2
02e64 7c05                           jl         0x7f1e784076eb
02e66 ba00000000                     mov        edx, 0
02e6b 48b9e06a72701e7f0000           movabs     rcx, 0x7f1e70726ae0
02e75 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
02e79 4403c2                         add        r8d, edx
02e7c 44894174                       mov        dword ptr [rcx + 0x74], r8d
02e80 85d2                           test       edx, edx
02e82 7506                           jne        0x7f1e7840770a
02e84 41b802000000                   mov        r8d, 2
02e8a 4181e0fe3f0000                 and        r8d, 0x3ffe
02e91 4585c0                         test       r8d, r8d
02e94 0f84621d0000                   je         0x7f1e7840947c
02e9a 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02e9e 418502                         test       dword ptr [r10], eax
02ea1 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02ea8 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
02eb2 b940070000                     mov        ecx, 0x740
02eb7 7c05                           jl         0x7f1e7840773e
02eb9 b950070000                     mov        ecx, 0x750
02ebe 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
02ec2 4d8d4001                       lea        r8, [r8 + 1]
02ec6 4c89040a                       mov        qword ptr [rdx + rcx], r8
02eca 0f8c60f5ffff                   jl         0x7f1e78406cb0
02ed0 8b9c24f0010000                 mov        ebx, dword ptr [rsp + 0x1f0]
02ed7 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
02ee1 ff8260070000                   inc        dword ptr [rdx + 0x760]
02ee7 e90a0f0000                     jmp        0x7f1e78408676
02eec 4183f908                       cmp        r9d, 8
02ef0 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
02efa b978070000                     mov        ecx, 0x778
02eff 7c05                           jl         0x7f1e78407786
02f01 b988070000                     mov        ecx, 0x788
02f06 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
02f0a 4d8d4001                       lea        r8, [r8 + 1]
02f0e 4c89040a                       mov        qword ptr [rdx + rcx], r8
02f12 0f8c7e040000                   jl         0x7f1e78407c16
02f18 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
02f1f 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
02f26 899c2408020000                 mov        dword ptr [rsp + 0x208], ebx
02f2d 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
02f34 0f1f4000                       nop        dword ptr [rax]
02f38 89842400020000                 mov        dword ptr [rsp + 0x200], eax
02f3f 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
02f47 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
02f51 4883829807000001               add        qword ptr [rdx + 0x798], 1
02f59 48ba102e105800000000           movabs     rdx, 0x58102e10
02f63 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02f66 83c102                         add        ecx, 2
02f69 894a70                         mov        dword ptr [rdx + 0x70], ecx
02f6c 81e1feff1f00                   and        ecx, 0x1ffffe
02f72 85c9                           test       ecx, ecx
02f74 0f84a31c0000                   je         0x7f1e7840949d
02f7a 48ba102e105800000000           movabs     rdx, 0x58102e10
02f84 488d92d8000000                 lea        rdx, [rdx + 0xd8]
02f8b 4885c0                         test       rax, rax
02f8e 750c                           jne        0x7f1e7840781c
02f90 f6420801                       test       byte ptr [rdx + 8], 1
02f94 7506                           jne        0x7f1e7840781c
02f96 f048834a0801                   lock or    qword ptr [rdx + 8], 1
02f9c 48ba884c62701e7f0000           movabs     rdx, 0x7f1e70624c88
02fa6 488d9240030000                 lea        rdx, [rdx + 0x340]
02fad 4885c0                         test       rax, rax
02fb0 750c                           jne        0x7f1e7840783e
02fb2 f6421001                       test       byte ptr [rdx + 0x10], 1
02fb6 7506                           jne        0x7f1e7840783e
02fb8 f048834a1001                   lock or    qword ptr [rdx + 0x10], 1
02fbe 48ba102e105800000000           movabs     rdx, 0x58102e10
02fc8 488382a800000001               add        qword ptr [rdx + 0xa8], 1
02fd0 48ba884c62701e7f0000           movabs     rdx, 0x7f1e70624c88
02fda 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02fdd 83c102                         add        ecx, 2
02fe0 894a70                         mov        dword ptr [rdx + 0x70], ecx
02fe3 81e1feff1f00                   and        ecx, 0x1ffffe
02fe9 85c9                           test       ecx, ecx
02feb 0f844d1c0000                   je         0x7f1e784094be
02ff1 48ba687030e300000000           movabs     rdx, 0xe3307068
02ffb 48b9884c62701e7f0000           movabs     rcx, 0x7f1e70624c88
03005 488b12                         mov        rdx, qword ptr [rdx]
03008 48c1ea2a                       shr        rdx, 0x2a
0300c 48c1e209                       shl        rdx, 9
03010 41ba00000058                   mov        r10d, 0x58000000
03016 4903d2                         add        rdx, r10
03019 41ba16000000                   mov        r10d, 0x16
0301f 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03023 7435                           je         0x7f1e784078da
03025 4983c202                       add        r10, 2
03029 4983fa1a                       cmp        r10, 0x1a
0302d 75f0                           jne        0x7f1e7840789f
0302f 41ba16000000                   mov        r10d, 0x16
03035 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0303a 7412                           je         0x7f1e784078ce
0303c 4983c202                       add        r10, 2
03040 4983fa1a                       cmp        r10, 0x1a
03044 75ef                           jne        0x7f1e784078b5
03046 41ba15000000                   mov        r10d, 0x15
0304c eb10                           jmp        0x7f1e784078de
0304e 50                             push       rax
0304f 4833c0                         xor        rax, rax
03052 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
03057 58                             pop        rax
03058 ebbf                           jmp        0x7f1e78407899
0305a 4983c201                       add        r10, 1
0305e 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03063 48ba18740c5800000000           movabs     rdx, 0x580c7418
0306d 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03070 83c102                         add        ecx, 2
03073 894a70                         mov        dword ptr [rdx + 0x70], ecx
03076 81e1feff1f00                   and        ecx, 0x1ffffe
0307c 85c9                           test       ecx, ecx
0307e 0f84db1b0000                   je         0x7f1e784094df
03084 48ba18740c5800000000           movabs     rdx, 0x580c7418
0308e ff82a8000000                   inc        dword ptr [rdx + 0xa8]
03094 48ba884c62701e7f0000           movabs     rdx, 0x7f1e70624c88
0309e ff8200010000                   inc        dword ptr [rdx + 0x100]
030a4 48ba884c62701e7f0000           movabs     rdx, 0x7f1e70624c88
030ae ff8220010000                   inc        dword ptr [rdx + 0x120]
030b4 48ba186830e300000000           movabs     rdx, 0xe3306818
030be 48b9884c62701e7f0000           movabs     rcx, 0x7f1e70624c88
030c8 488b12                         mov        rdx, qword ptr [rdx]
030cb 48c1ea2a                       shr        rdx, 0x2a
030cf 48c1e209                       shl        rdx, 9
030d3 41ba00000058                   mov        r10d, 0x58000000
030d9 4903d2                         add        rdx, r10
030dc 41ba27000000                   mov        r10d, 0x27
030e2 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
030e6 7435                           je         0x7f1e7840799d
030e8 4983c202                       add        r10, 2
030ec 4983fa2b                       cmp        r10, 0x2b
030f0 75f0                           jne        0x7f1e78407962
030f2 41ba27000000                   mov        r10d, 0x27
030f8 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
030fd 7412                           je         0x7f1e78407991
030ff 4983c202                       add        r10, 2
03103 4983fa2b                       cmp        r10, 0x2b
03107 75ef                           jne        0x7f1e78407978
03109 41ba26000000                   mov        r10d, 0x26
0310f eb10                           jmp        0x7f1e784079a1
03111 50                             push       rax
03112 4833c0                         xor        rax, rax
03115 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
0311a 58                             pop        rax
0311b ebbf                           jmp        0x7f1e7840795c
0311d 4983c201                       add        r10, 1
03121 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03126 48ba184a62701e7f0000           movabs     rdx, 0x7f1e70624a18
03130 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03133 83c102                         add        ecx, 2
03136 894a70                         mov        dword ptr [rdx + 0x70], ecx
03139 81e1feff1f00                   and        ecx, 0x1ffffe
0313f 85c9                           test       ecx, ecx
03141 0f84391b0000                   je         0x7f1e78409500
03147 48ba184a62701e7f0000           movabs     rdx, 0x7f1e70624a18
03151 ff82a8000000                   inc        dword ptr [rdx + 0xa8]
03157 48ba884c62701e7f0000           movabs     rdx, 0x7f1e70624c88
03161 488d9280010000                 lea        rdx, [rdx + 0x180]
03168 4885c0                         test       rax, rax
0316b 750c                           jne        0x7f1e784079f9
0316d f6421801                       test       byte ptr [rdx + 0x18], 1
03171 7506                           jne        0x7f1e784079f9
03173 f048834a1801                   lock or    qword ptr [rdx + 0x18], 1
03179 48ba884c62701e7f0000           movabs     rdx, 0x7f1e70624c88
03183 4883827001000001               add        qword ptr [rdx + 0x170], 1
0318b 48bae04f62701e7f0000           movabs     rdx, 0x7f1e70624fe0
03195 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03198 83c102                         add        ecx, 2
0319b 894a70                         mov        dword ptr [rdx + 0x70], ecx
0319e 81e1feff1f00                   and        ecx, 0x1ffffe
031a4 85c9                           test       ecx, ecx
031a6 0f84f51a0000                   je         0x7f1e78409521
031ac 48bae04f62701e7f0000           movabs     rdx, 0x7f1e70624fe0
031b6 4883820801000001               add        qword ptr [rdx + 0x108], 1
031be 48ba905162701e7f0000           movabs     rdx, 0x7f1e70625190
031c8 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
031cb 83c102                         add        ecx, 2
031ce 894a70                         mov        dword ptr [rdx + 0x70], ecx
031d1 81e1feff1f00                   and        ecx, 0x1ffffe
031d7 85c9                           test       ecx, ecx
031d9 0f84e31a0000                   je         0x7f1e78409542
031df 8b5008                         mov        edx, dword ptr [rax + 8]
031e2 48b9905162701e7f0000           movabs     rcx, 0x7f1e70625190
031ec 488381a800000001               add        qword ptr [rcx + 0xa8], 1
031f4 83ea07                         sub        edx, 7
031f7 48b9801d23e200000000           movabs     rcx, 0xe2231d80
03201 b900000000                     mov        ecx, 0
03206 3bf9                           cmp        edi, ecx
03208 0f8cda1a0000                   jl         0x7f1e78409568
0320e 3bfa                           cmp        edi, edx
03210 0f8ddf1a0000                   jge        0x7f1e78409575
03216 488bd7                         mov        rdx, rdi
03219 48be00b722e200000000           movabs     rsi, 0xe222b700
03223 488bce                         mov        rcx, rsi
03226 49b8e04f62701e7f0000           movabs     r8, 0x7f1e70624fe0
03230 488b09                         mov        rcx, qword ptr [rcx]
03233 48c1e92a                       shr        rcx, 0x2a
03237 48c1e109                       shl        rcx, 9
0323b 41ba00000058                   mov        r10d, 0x58000000
03241 4903ca                         add        rcx, r10
03244 41ba24000000                   mov        r10d, 0x24
0324a 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0324e 7435                           je         0x7f1e78407b05
03250 4983c202                       add        r10, 2
03254 4983fa28                       cmp        r10, 0x28
03258 75f0                           jne        0x7f1e78407aca
0325a 41ba24000000                   mov        r10d, 0x24
03260 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
03265 7412                           je         0x7f1e78407af9
03267 4983c202                       add        r10, 2
0326b 4983fa28                       cmp        r10, 0x28
0326f 75ef                           jne        0x7f1e78407ae0
03271 41ba23000000                   mov        r10d, 0x23
03277 eb10                           jmp        0x7f1e78407b09
03279 50                             push       rax
0327a 4833c0                         xor        rax, rax
0327d 4b0fb10cd0                     cmpxchg    qword ptr [r8 + r10*8], rcx
03282 58                             pop        rax
03283 ebbf                           jmp        0x7f1e78407ac4
03285 4983c201                       add        r10, 1
03289 4b8304d001                     add        qword ptr [r8 + r10*8], 1
0328e 4863d2                         movsxd     rdx, edx
03291 488bca                         mov        rcx, rdx
03294 41ba0c000000                   mov        r10d, 0xc
0329a 4903ca                         add        rcx, r10
0329d 488bd0                         mov        rdx, rax
032a0 41b800000000                   mov        r8d, 0
032a6 89bc2404020000                 mov        dword ptr [rsp + 0x204], edi
032ad 6690                           nop        
032af e82c835007                     call       0x7f1e7f90fe60
032b4 0f1f8400ac330013               nop        dword ptr [rax + rax + 0x130033ac]
032bc 48bee06a72701e7f0000           movabs     rsi, 0x7f1e70726ae0
032c6 488386a807000001               add        qword ptr [rsi + 0x7a8], 1
032ce 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
032d6 8b942400020000                 mov        edx, dword ptr [rsp + 0x200]
032dd 488bc8                         mov        rcx, rax
032e0 0f1f8000000000                 nop        dword ptr [rax]
032e7 e8f48c5007                     call       0x7f1e7f910860
032ec 0f1f8400e4330014               nop        dword ptr [rax + rax + 0x140033e4]
032f4 8b842400020000                 mov        eax, dword ptr [rsp + 0x200]
032fb 83c008                         add        eax, 8
032fe 8bbc2404020000                 mov        edi, dword ptr [rsp + 0x204]
03305 83c708                         add        edi, 8
03308 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
0330f be02000000                     mov        esi, 2
03314 7c05                           jl         0x7f1e78407b9b
03316 be00000000                     mov        esi, 0
0331b 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
03325 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
03328 03ce                           add        ecx, esi
0332a 894a74                         mov        dword ptr [rdx + 0x74], ecx
0332d 85f6                           test       esi, esi
0332f 7505                           jne        0x7f1e78407bb6
03331 b902000000                     mov        ecx, 2
03336 81e1fe3f0000                   and        ecx, 0x3ffe
0333c 85c9                           test       ecx, ecx
0333e 0f84be190000                   je         0x7f1e78409582
03344 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03348 418502                         test       dword ptr [r10], eax
0334b 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
03352 48bee06a72701e7f0000           movabs     rsi, 0x7f1e70726ae0
0335c bab8070000                     mov        edx, 0x7b8
03361 7c05                           jl         0x7f1e78407be8
03363 bac8070000                     mov        edx, 0x7c8
03368 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0336c 488d4901                       lea        rcx, [rcx + 1]
03370 48890c16                       mov        qword ptr [rsi + rdx], rcx
03374 0f8cbefbffff                   jl         0x7f1e784077b8
0337a 8b9c2408020000                 mov        ebx, dword ptr [rsp + 0x208]
03381 48bee06a72701e7f0000           movabs     rsi, 0x7f1e70726ae0
0338b ff86d8070000                   inc        dword ptr [rsi + 0x7d8]
03391 e9600a0000                     jmp        0x7f1e78408676
03396 48bee06a72701e7f0000           movabs     rsi, 0x7f1e70726ae0
033a0 488386f007000001               add        qword ptr [rsi + 0x7f0], 1
033a8 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
033b0 8b9424d0010000                 mov        edx, dword ptr [rsp + 0x1d0]
033b7 488bcf                         mov        rcx, rdi
033ba 4d8bc1                         mov        r8, r9
033bd 448b8c2478010000               mov        r9d, dword ptr [rsp + 0x178]
033c5 6690                           nop        
033c7 e8148c5007                     call       0x7f1e7f910860
033cc 0f1f8400c4340016               nop        dword ptr [rax + rax + 0x160034c4]
033d4 488bd8                         mov        rbx, rax
033d7 e91a0a0000                     jmp        0x7f1e78408676
033dc 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
033e3 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
033ea 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
033f2 48bee06a72701e7f0000           movabs     rsi, 0x7f1e70726ae0
033fc 488386c805000001               add        qword ptr [rsi + 0x5c8], 1
03404 48be284279701e7f0000           movabs     rsi, 0x7f1e70794228
0340e 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03411 83c202                         add        edx, 2
03414 895670                         mov        dword ptr [rsi + 0x70], edx
03417 81e2feff1f00                   and        edx, 0x1ffffe
0341d 85d2                           test       edx, edx
0341f 0f84fe180000                   je         0x7f1e784095a3
03425 48be50f237e300000000           movabs     rsi, 0xe337f250
0342f 48ba284279701e7f0000           movabs     rdx, 0x7f1e70794228
03439 488b36                         mov        rsi, qword ptr [rsi]
0343c 48c1ee2a                       shr        rsi, 0x2a
03440 48c1e609                       shl        rsi, 9
03444 41ba00000058                   mov        r10d, 0x58000000
0344a 4903f2                         add        rsi, r10
0344d 41ba16000000                   mov        r10d, 0x16
03453 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03457 7435                           je         0x7f1e78407d0e
03459 4983c202                       add        r10, 2
0345d 4983fa1a                       cmp        r10, 0x1a
03461 75f0                           jne        0x7f1e78407cd3
03463 41ba16000000                   mov        r10d, 0x16
03469 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
0346e 7412                           je         0x7f1e78407d02
03470 4983c202                       add        r10, 2
03474 4983fa1a                       cmp        r10, 0x1a
03478 75ef                           jne        0x7f1e78407ce9
0347a 41ba15000000                   mov        r10d, 0x15
03480 eb10                           jmp        0x7f1e78407d12
03482 50                             push       rax
03483 4833c0                         xor        rax, rax
03486 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
0348b 58                             pop        rax
0348c ebbf                           jmp        0x7f1e78407ccd
0348e 4983c201                       add        r10, 1
03492 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03497 8b5808                         mov        ebx, dword ptr [rax + 8]
0349a 48be284279701e7f0000           movabs     rsi, 0x7f1e70794228
034a4 488386d800000001               add        qword ptr [rsi + 0xd8], 1
034ac 48bec03779701e7f0000           movabs     rsi, 0x7f1e707937c0
034b6 8b5670                         mov        edx, dword ptr [rsi + 0x70]
034b9 83c202                         add        edx, 2
034bc 895670                         mov        dword ptr [rsi + 0x70], edx
034bf 81e2feff1f00                   and        edx, 0x1ffffe
034c5 85d2                           test       edx, edx
034c7 0f847c180000                   je         0x7f1e784095c9
034cd 48bec03779701e7f0000           movabs     rsi, 0x7f1e707937c0
034d7 4883860801000001               add        qword ptr [rsi + 0x108], 1
034df 488bf3                         mov        rsi, rbx
034e2 83ee0f                         sub        esi, 0xf
034e5 48ba902e79701e7f0000           movabs     rdx, 0x7f1e70792e90
034ef 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
034f2 83c102                         add        ecx, 2
034f5 894a70                         mov        dword ptr [rdx + 0x70], ecx
034f8 81e1feff1f00                   and        ecx, 0x1ffffe
034fe 85c9                           test       ecx, ecx
03500 0f8464180000                   je         0x7f1e784095ea
03506 48ba902e79701e7f0000           movabs     rdx, 0x7f1e70792e90
03510 488382a800000001               add        qword ptr [rdx + 0xa8], 1
03518 48ba0000000000000000           movabs     rdx, 0
03522 ba00000000                     mov        edx, 0
03527 3bfa                           cmp        edi, edx
03529 0f8c5c180000                   jl         0x7f1e7840960b
0352f 3bfe                           cmp        edi, esi
03531 0f8d61180000                   jge        0x7f1e78409618
03537 48be50f237e300000000           movabs     rsi, 0xe337f250
03541 488bd6                         mov        rdx, rsi
03544 48b9284279701e7f0000           movabs     rcx, 0x7f1e70794228
0354e 488b12                         mov        rdx, qword ptr [rdx]
03551 48c1ea2a                       shr        rdx, 0x2a
03555 48c1e209                       shl        rdx, 9
03559 41ba00000058                   mov        r10d, 0x58000000
0355f 4903d2                         add        rdx, r10
03562 41ba24000000                   mov        r10d, 0x24
03568 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0356c 7435                           je         0x7f1e78407e23
0356e 4983c202                       add        r10, 2
03572 4983fa28                       cmp        r10, 0x28
03576 75f0                           jne        0x7f1e78407de8
03578 41ba24000000                   mov        r10d, 0x24
0357e 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03583 7412                           je         0x7f1e78407e17
03585 4983c202                       add        r10, 2
03589 4983fa28                       cmp        r10, 0x28
0358d 75ef                           jne        0x7f1e78407dfe
0358f 41ba23000000                   mov        r10d, 0x23
03595 eb10                           jmp        0x7f1e78407e27
03597 50                             push       rax
03598 4833c0                         xor        rax, rax
0359b 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
035a0 58                             pop        rax
035a1 ebbf                           jmp        0x7f1e78407de2
035a3 4983c201                       add        r10, 1
035a7 4a8304d101                     add        qword ptr [rcx + r10*8], 1
035ac 48ba902f79701e7f0000           movabs     rdx, 0x7f1e70792f90
035b6 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
035b9 83c102                         add        ecx, 2
035bc 894a70                         mov        dword ptr [rdx + 0x70], ecx
035bf 81e1feff1f00                   and        ecx, 0x1ffffe
035c5 85c9                           test       ecx, ecx
035c7 0f84d8170000                   je         0x7f1e78409625
035cd 48ba902f79701e7f0000           movabs     rdx, 0x7f1e70792f90
035d7 488382a800000001               add        qword ptr [rdx + 0xa8], 1
035df 48beb83079701e7f0000           movabs     rsi, 0x7f1e707930b8
035e9 8b5670                         mov        edx, dword ptr [rsi + 0x70]
035ec 83c202                         add        edx, 2
035ef 895670                         mov        dword ptr [rsi + 0x70], edx
035f2 81e2feff1f00                   and        edx, 0x1ffffe
035f8 85d2                           test       edx, edx
035fa 0f84c6170000                   je         0x7f1e78409646
03600 48beb83079701e7f0000           movabs     rsi, 0x7f1e707930b8
0360a ff86b8000000                   inc        dword ptr [rsi + 0xb8]
03610 899c240c020000                 mov        dword ptr [rsp + 0x20c], ebx
03617 48be68c539e300000000           movabs     rsi, 0xe339c568
03621 488bd6                         mov        rdx, rsi
03624 48b9284279701e7f0000           movabs     rcx, 0x7f1e70794228
0362e 4883815801000001               add        qword ptr [rcx + 0x158], 1
03636 48baf04379701e7f0000           movabs     rdx, 0x7f1e707943f0
03640 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03643 83c102                         add        ecx, 2
03646 894a70                         mov        dword ptr [rdx + 0x70], ecx
03649 81e1feff1f00                   and        ecx, 0x1ffffe
0364f 85c9                           test       ecx, ecx
03651 0f8490170000                   je         0x7f1e78409667
03657 488bd6                         mov        rdx, rsi
0365a 48b9f04379701e7f0000           movabs     rcx, 0x7f1e707943f0
03664 488381a800000001               add        qword ptr [rcx + 0xa8], 1
0366c 48bad04479701e7f0000           movabs     rdx, 0x7f1e707944d0
03676 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03679 83c102                         add        ecx, 2
0367c 894a70                         mov        dword ptr [rdx + 0x70], ecx
0367f 81e1feff1f00                   and        ecx, 0x1ffffe
03685 85c9                           test       ecx, ecx
03687 0f847b170000                   je         0x7f1e78409688
0368d 48bad04479701e7f0000           movabs     rdx, 0x7f1e707944d0
03697 488382b800000001               add        qword ptr [rdx + 0xb8], 1
0369f 48be383979701e7f0000           movabs     rsi, 0x7f1e70793938
036a9 8b5670                         mov        edx, dword ptr [rsi + 0x70]
036ac 83c202                         add        edx, 2
036af 895670                         mov        dword ptr [rsi + 0x70], edx
036b2 81e2feff1f00                   and        edx, 0x1ffffe
036b8 85d2                           test       edx, edx
036ba 0f8469170000                   je         0x7f1e784096a9
036c0 48be50f237e300000000           movabs     rsi, 0xe337f250
036ca 488bd6                         mov        rdx, rsi
036cd 48b9d04479701e7f0000           movabs     rcx, 0x7f1e707944d0
036d7 488b12                         mov        rdx, qword ptr [rdx]
036da 48c1ea2a                       shr        rdx, 0x2a
036de 48c1e209                       shl        rdx, 9
036e2 41ba00000058                   mov        r10d, 0x58000000
036e8 4903d2                         add        rdx, r10
036eb 41ba1c000000                   mov        r10d, 0x1c
036f1 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
036f5 7435                           je         0x7f1e78407fac
036f7 4983c202                       add        r10, 2
036fb 4983fa20                       cmp        r10, 0x20
036ff 75f0                           jne        0x7f1e78407f71
03701 41ba1c000000                   mov        r10d, 0x1c
03707 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0370c 7412                           je         0x7f1e78407fa0
0370e 4983c202                       add        r10, 2
03712 4983fa20                       cmp        r10, 0x20
03716 75ef                           jne        0x7f1e78407f87
03718 41ba1b000000                   mov        r10d, 0x1b
0371e eb10                           jmp        0x7f1e78407fb0
03720 50                             push       rax
03721 4833c0                         xor        rax, rax
03724 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
03729 58                             pop        rax
0372a ebbf                           jmp        0x7f1e78407f6b
0372c 4983c201                       add        r10, 1
03730 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03735 48bad04479701e7f0000           movabs     rdx, 0x7f1e707944d0
0373f 488b36                         mov        rsi, qword ptr [rsi]
03742 48c1ee2a                       shr        rsi, 0x2a
03746 48c1e609                       shl        rsi, 9
0374a 41ba00000058                   mov        r10d, 0x58000000
03750 4903f2                         add        rsi, r10
03753 41ba22000000                   mov        r10d, 0x22
03759 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
0375d 7435                           je         0x7f1e78408014
0375f 4983c202                       add        r10, 2
03763 4983fa26                       cmp        r10, 0x26
03767 75f0                           jne        0x7f1e78407fd9
03769 41ba22000000                   mov        r10d, 0x22
0376f 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03774 7412                           je         0x7f1e78408008
03776 4983c202                       add        r10, 2
0377a 4983fa26                       cmp        r10, 0x26
0377e 75ef                           jne        0x7f1e78407fef
03780 41ba21000000                   mov        r10d, 0x21
03786 eb10                           jmp        0x7f1e78408018
03788 50                             push       rax
03789 4833c0                         xor        rax, rax
0378c 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
03791 58                             pop        rax
03792 ebbf                           jmp        0x7f1e78407fd3
03794 4983c201                       add        r10, 1
03798 4a8304d201                     add        qword ptr [rdx + r10*8], 1
0379d 48bed04479701e7f0000           movabs     rsi, 0x7f1e707944d0
037a7 4883863801000001               add        qword ptr [rsi + 0x138], 1
037af 48bef83979701e7f0000           movabs     rsi, 0x7f1e707939f8
037b9 8b5670                         mov        edx, dword ptr [rsi + 0x70]
037bc 83c202                         add        edx, 2
037bf 895670                         mov        dword ptr [rsi + 0x70], edx
037c2 81e2feff1f00                   and        edx, 0x1ffffe
037c8 85d2                           test       edx, edx
037ca 0f847a160000                   je         0x7f1e784096ca
037d0 48bed04479701e7f0000           movabs     rsi, 0x7f1e707944d0
037da 4883864801000001               add        qword ptr [rsi + 0x148], 1
037e2 4c63df                         movsxd     r11, edi
037e5 be0c000000                     mov        esi, 0xc
037ea 4d8bcb                         mov        r9, r11
037ed 4c03ce                         add        r9, rsi
037f0 48bee02b79701e7f0000           movabs     rsi, 0x7f1e70792be0
037fa 8b5670                         mov        edx, dword ptr [rsi + 0x70]
037fd 83c202                         add        edx, 2
03800 895670                         mov        dword ptr [rsi + 0x70], edx
03803 81e2feff1f00                   and        edx, 0x1ffffe
03809 85d2                           test       edx, edx
0380b 0f845a160000                   je         0x7f1e784096eb
03811 48bee02b79701e7f0000           movabs     rsi, 0x7f1e70792be0
0381b 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03823 48be582d79701e7f0000           movabs     rsi, 0x7f1e70792d58
0382d 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03830 83c202                         add        edx, 2
03833 895670                         mov        dword ptr [rsi + 0x70], edx
03836 81e2feff1f00                   and        edx, 0x1ffffe
0383c 85d2                           test       edx, edx
0383e 0f8448160000                   je         0x7f1e7840970c
03844 48bed04479701e7f0000           movabs     rsi, 0x7f1e707944d0
0384e 4883866801000001               add        qword ptr [rsi + 0x168], 1
03856 48be38c03ae300000000           movabs     rsi, 0xe33ac038
03860 48be98f237e300000000           movabs     rsi, 0xe337f298
0386a ba02000000                     mov        edx, 2
0386f b910000000                     mov        ecx, 0x10
03874 4c8bc0                         mov        r8, rax
03877 bf00000000                     mov        edi, 0
0387c 48890424                       mov        qword ptr [rsp], rax
03880 4c895c2408                     mov        qword ptr [rsp + 8], r11
03885 49ba50f237e300000000           movabs     r10, 0xe337f250
0388f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03894 49ba38c03ae300000000           movabs     r10, 0xe33ac038
0389e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
038a3 0f1f4000                       nop        dword ptr [rax]
038a7 e834875007                     call       0x7f1e7f910860
038ac 0f1f8400a4390017               nop        dword ptr [rax + rax + 0x170039a4]
038b4 4885c0                         test       rax, rax
038b7 48bbd04479701e7f0000           movabs     rbx, 0x7f1e707944d0
038c1 750c                           jne        0x7f1e7840814f
038c3 808b7101000001                 or         byte ptr [rbx + 0x171], 1
038ca e98b000000                     jmp        0x7f1e784081da
038cf 488b38                         mov        rdi, qword ptr [rax]
038d2 48c1ef2a                       shr        rdi, 0x2a
038d6 48c1e709                       shl        rdi, 9
038da 41ba00000058                   mov        r10d, 0x58000000
038e0 4903fa                         add        rdi, r10
038e3 41ba30000000                   mov        r10d, 0x30
038e9 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
038ed 7435                           je         0x7f1e784081a4
038ef 4983c202                       add        r10, 2
038f3 4983fa34                       cmp        r10, 0x34
038f7 75f0                           jne        0x7f1e78408169
038f9 41ba30000000                   mov        r10d, 0x30
038ff 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03904 7412                           je         0x7f1e78408198
03906 4983c202                       add        r10, 2
0390a 4983fa34                       cmp        r10, 0x34
0390e 75ef                           jne        0x7f1e7840817f
03910 41ba2f000000                   mov        r10d, 0x2f
03916 eb10                           jmp        0x7f1e784081a8
03918 50                             push       rax
03919 4833c0                         xor        rax, rax
0391c 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
03921 58                             pop        rax
03922 ebbf                           jmp        0x7f1e78408163
03924 4983c201                       add        r10, 1
03928 4a8304d301                     add        qword ptr [rbx + r10*8], 1
0392d 48bf0006145800000000           movabs     rdi, 0x58140600
03937 488b18                         mov        rbx, qword ptr [rax]
0393a 48c1eb2a                       shr        rbx, 0x2a
0393e 48c1e309                       shl        rbx, 9
03942 41ba00000058                   mov        r10d, 0x58000000
03948 4903da                         add        rbx, r10
0394b 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
0394f 0f8558150000                   jne        0x7f1e7840972d
03955 e900000000                     jmp        0x7f1e784081da
0395a 488bf8                         mov        rdi, rax
0395d 4889bc2410020000               mov        qword ptr [rsp + 0x210], rdi
03965 483b07                         cmp        rax, qword ptr [rdi]
03968 488bf7                         mov        rsi, rdi
0396b 48bbe06a72701e7f0000           movabs     rbx, 0x7f1e70726ae0
03975 488b36                         mov        rsi, qword ptr [rsi]
03978 48c1ee2a                       shr        rsi, 0x2a
0397c 48c1e609                       shl        rsi, 9
03980 41ba00000058                   mov        r10d, 0x58000000
03986 4903f2                         add        rsi, r10
03989 41babc000000                   mov        r10d, 0xbc
0398f 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03993 743b                           je         0x7f1e78408250
03995 4983c202                       add        r10, 2
03999 4981fac0000000                 cmp        r10, 0xc0
039a0 75ed                           jne        0x7f1e7840820f
039a2 41babc000000                   mov        r10d, 0xbc
039a8 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
039ad 7415                           je         0x7f1e78408244
039af 4983c202                       add        r10, 2
039b3 4981fac0000000                 cmp        r10, 0xc0
039ba 75ec                           jne        0x7f1e78408228
039bc 41babb000000                   mov        r10d, 0xbb
039c2 eb10                           jmp        0x7f1e78408254
039c4 50                             push       rax
039c5 4833c0                         xor        rax, rax
039c8 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
039cd 58                             pop        rax
039ce ebb9                           jmp        0x7f1e78408209
039d0 4983c201                       add        r10, 1
039d4 4a8304d301                     add        qword ptr [rbx + r10*8], 1
039d9 48bee84e79701e7f0000           movabs     rsi, 0x7f1e70794ee8
039e3 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
039e6 83c302                         add        ebx, 2
039e9 895e70                         mov        dword ptr [rsi + 0x70], ebx
039ec 81e3feff1f00                   and        ebx, 0x1ffffe
039f2 85db                           test       ebx, ebx
039f4 0f84c1140000                   je         0x7f1e7840973b
039fa 488bf7                         mov        rsi, rdi
039fd 48bbe84e79701e7f0000           movabs     rbx, 0x7f1e70794ee8
03a07 488b36                         mov        rsi, qword ptr [rsi]
03a0a 48c1ee2a                       shr        rsi, 0x2a
03a0e 48c1e609                       shl        rsi, 9
03a12 41ba00000058                   mov        r10d, 0x58000000
03a18 4903f2                         add        rsi, r10
03a1b 41ba16000000                   mov        r10d, 0x16
03a21 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03a25 7435                           je         0x7f1e784082dc
03a27 4983c202                       add        r10, 2
03a2b 4983fa1a                       cmp        r10, 0x1a
03a2f 75f0                           jne        0x7f1e784082a1
03a31 41ba16000000                   mov        r10d, 0x16
03a37 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03a3c 7412                           je         0x7f1e784082d0
03a3e 4983c202                       add        r10, 2
03a42 4983fa1a                       cmp        r10, 0x1a
03a46 75ef                           jne        0x7f1e784082b7
03a48 41ba15000000                   mov        r10d, 0x15
03a4e eb10                           jmp        0x7f1e784082e0
03a50 50                             push       rax
03a51 4833c0                         xor        rax, rax
03a54 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
03a59 58                             pop        rax
03a5a ebbf                           jmp        0x7f1e7840829b
03a5c 4983c201                       add        r10, 1
03a60 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03a65 488bf7                         mov        rsi, rdi
03a68 0f1f440000                     nop        dword ptr [rax + rax]
03a6d 48b8208564541e7f0000           movabs     rax, 0x7f1e54648520
03a77 e864805007                     call       0x7f1e7f910360
03a7c 0f1f8400743b0018               nop        dword ptr [rax + rax + 0x18003b74]
03a84 48bee84e79701e7f0000           movabs     rsi, 0x7f1e70794ee8
03a8e 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03a96 48bec03779701e7f0000           movabs     rsi, 0x7f1e707937c0
03aa0 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
03aa3 83c702                         add        edi, 2
03aa6 897e70                         mov        dword ptr [rsi + 0x70], edi
03aa9 81e7feff1f00                   and        edi, 0x1ffffe
03aaf 85ff                           test       edi, edi
03ab1 0f8425140000                   je         0x7f1e7840975c
03ab7 8b9c240c020000                 mov        ebx, dword ptr [rsp + 0x20c]
03abe 8bbc24d0010000                 mov        edi, dword ptr [rsp + 0x1d0]
03ac5 48bec03779701e7f0000           movabs     rsi, 0x7f1e707937c0
03acf 4883860801000001               add        qword ptr [rsi + 0x108], 1
03ad7 ffc8                           dec        eax
03ad9 2bd8                           sub        ebx, eax
03adb 48be902e79701e7f0000           movabs     rsi, 0x7f1e70792e90
03ae5 8b4670                         mov        eax, dword ptr [rsi + 0x70]
03ae8 83c002                         add        eax, 2
03aeb 894670                         mov        dword ptr [rsi + 0x70], eax
03aee 25feff1f00                     and        eax, 0x1ffffe
03af3 85c0                           test       eax, eax
03af5 0f8402140000                   je         0x7f1e7840977d
03afb 48be902e79701e7f0000           movabs     rsi, 0x7f1e70792e90
03b05 488386a800000001               add        qword ptr [rsi + 0xa8], 1
03b0d 48be0000000000000000           movabs     rsi, 0
03b17 be00000000                     mov        esi, 0
03b1c 3bfe                           cmp        edi, esi
03b1e 0f8cfa130000                   jl         0x7f1e7840979e
03b24 3bfb                           cmp        edi, ebx
03b26 0f8dff130000                   jge        0x7f1e784097ab
03b2c 488bdf                         mov        rbx, rdi
03b2f 899c2418020000                 mov        dword ptr [rsp + 0x218], ebx
03b36 89bc24d0010000                 mov        dword ptr [rsp + 0x1d0], edi
03b3d 488bbc2410020000               mov        rdi, qword ptr [rsp + 0x210]
03b45 488bf7                         mov        rsi, rdi
03b48 48b9e84e79701e7f0000           movabs     rcx, 0x7f1e70794ee8
03b52 488b36                         mov        rsi, qword ptr [rsi]
03b55 48c1ee2a                       shr        rsi, 0x2a
03b59 48c1e609                       shl        rsi, 9
03b5d 41ba00000058                   mov        r10d, 0x58000000
03b63 4903f2                         add        rsi, r10
03b66 41ba1e000000                   mov        r10d, 0x1e
03b6c 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
03b70 7435                           je         0x7f1e78408427
03b72 4983c202                       add        r10, 2
03b76 4983fa22                       cmp        r10, 0x22
03b7a 75f0                           jne        0x7f1e784083ec
03b7c 41ba1e000000                   mov        r10d, 0x1e
03b82 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03b87 7412                           je         0x7f1e7840841b
03b89 4983c202                       add        r10, 2
03b8d 4983fa22                       cmp        r10, 0x22
03b91 75ef                           jne        0x7f1e78408402
03b93 41ba1d000000                   mov        r10d, 0x1d
03b99 eb10                           jmp        0x7f1e7840842b
03b9b 50                             push       rax
03b9c 4833c0                         xor        rax, rax
03b9f 4a0fb134d1                     cmpxchg    qword ptr [rcx + r10*8], rsi
03ba4 58                             pop        rax
03ba5 ebbf                           jmp        0x7f1e784083e6
03ba7 4983c201                       add        r10, 1
03bab 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03bb0 488bf7                         mov        rsi, rdi
03bb3 6690                           nop        
03bb5 48b8488564541e7f0000           movabs     rax, 0x7f1e54648548
03bbf e81c7f5007                     call       0x7f1e7f910360
03bc4 0f1f8400bc3c0019               nop        dword ptr [rax + rax + 0x19003cbc]
03bcc 483b00                         cmp        rax, qword ptr [rax]
03bcf 488bf0                         mov        rsi, rax
03bd2 48bae84e79701e7f0000           movabs     rdx, 0x7f1e70794ee8
03bdc 488b36                         mov        rsi, qword ptr [rsi]
03bdf 48c1ee2a                       shr        rsi, 0x2a
03be3 48c1e609                       shl        rsi, 9
03be7 41ba00000058                   mov        r10d, 0x58000000
03bed 4903f2                         add        rsi, r10
03bf0 41ba24000000                   mov        r10d, 0x24
03bf6 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03bfa 7435                           je         0x7f1e784084b1
03bfc 4983c202                       add        r10, 2
03c00 4983fa28                       cmp        r10, 0x28
03c04 75f0                           jne        0x7f1e78408476
03c06 41ba24000000                   mov        r10d, 0x24
03c0c 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03c11 7412                           je         0x7f1e784084a5
03c13 4983c202                       add        r10, 2
03c17 4983fa28                       cmp        r10, 0x28
03c1b 75ef                           jne        0x7f1e7840848c
03c1d 41ba23000000                   mov        r10d, 0x23
03c23 eb10                           jmp        0x7f1e784084b5
03c25 50                             push       rax
03c26 4833c0                         xor        rax, rax
03c29 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
03c2e 58                             pop        rax
03c2f ebbf                           jmp        0x7f1e78408470
03c31 4983c201                       add        r10, 1
03c35 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03c3a 8b7028                         mov        esi, dword ptr [rax + 0x28]
03c3d 488bd0                         mov        rdx, rax
03c40 48b9e84e79701e7f0000           movabs     rcx, 0x7f1e70794ee8
03c4a 488b12                         mov        rdx, qword ptr [rdx]
03c4d 48c1ea2a                       shr        rdx, 0x2a
03c51 48c1e209                       shl        rdx, 9
03c55 41ba00000058                   mov        r10d, 0x58000000
03c5b 4903d2                         add        rdx, r10
03c5e 41ba2a000000                   mov        r10d, 0x2a
03c64 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03c68 7435                           je         0x7f1e7840851f
03c6a 4983c202                       add        r10, 2
03c6e 4983fa2e                       cmp        r10, 0x2e
03c72 75f0                           jne        0x7f1e784084e4
03c74 41ba2a000000                   mov        r10d, 0x2a
03c7a 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03c7f 7412                           je         0x7f1e78408513
03c81 4983c202                       add        r10, 2
03c85 4983fa2e                       cmp        r10, 0x2e
03c89 75ef                           jne        0x7f1e784084fa
03c8b 41ba29000000                   mov        r10d, 0x29
03c91 eb10                           jmp        0x7f1e78408523
03c93 50                             push       rax
03c94 4833c0                         xor        rax, rax
03c97 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
03c9c 58                             pop        rax
03c9d ebbf                           jmp        0x7f1e784084de
03c9f 4983c201                       add        r10, 1
03ca3 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03ca8 8b4808                         mov        ecx, dword ptr [rax + 8]
03cab 48bae84e79701e7f0000           movabs     rdx, 0x7f1e70794ee8
03cb5 4883827801000001               add        qword ptr [rdx + 0x178], 1
03cbd 48baf83979701e7f0000           movabs     rdx, 0x7f1e707939f8
03cc7 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03ccb 4183c002                       add        r8d, 2
03ccf 44894270                       mov        dword ptr [rdx + 0x70], r8d
03cd3 4181e0feff1f00                 and        r8d, 0x1ffffe
03cda 4585c0                         test       r8d, r8d
03cdd 0f845a120000                   je         0x7f1e784097bd
03ce3 48bae84e79701e7f0000           movabs     rdx, 0x7f1e70794ee8
03ced 4883828801000001               add        qword ptr [rdx + 0x188], 1
03cf5 8b9c2418020000                 mov        ebx, dword ptr [rsp + 0x218]
03cfc 4863db                         movsxd     rbx, ebx
03cff ba0c000000                     mov        edx, 0xc
03d04 4c8bcb                         mov        r9, rbx
03d07 4c03ca                         add        r9, rdx
03d0a 48bae02b79701e7f0000           movabs     rdx, 0x7f1e70792be0
03d14 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03d18 4183c002                       add        r8d, 2
03d1c 44894270                       mov        dword ptr [rdx + 0x70], r8d
03d20 4181e0feff1f00                 and        r8d, 0x1ffffe
03d27 4585c0                         test       r8d, r8d
03d2a 0f842e120000                   je         0x7f1e784097de
03d30 48bae02b79701e7f0000           movabs     rdx, 0x7f1e70792be0
03d3a 488382d800000001               add        qword ptr [rdx + 0xd8], 1
03d42 48ba582d79701e7f0000           movabs     rdx, 0x7f1e70792d58
03d4c 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03d50 4183c002                       add        r8d, 2
03d54 44894270                       mov        dword ptr [rdx + 0x70], r8d
03d58 4181e0feff1f00                 and        r8d, 0x1ffffe
03d5f 4585c0                         test       r8d, r8d
03d62 0f8417120000                   je         0x7f1e784097ff
03d68 48bae84e79701e7f0000           movabs     rdx, 0x7f1e70794ee8
03d72 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
03d7a 48bae0a03ce300000000           movabs     rdx, 0xe33ca0e0
03d84 ba02000000                     mov        edx, 2
03d89 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
03d91 bf00000000                     mov        edi, 0
03d96 488b842410020000               mov        rax, qword ptr [rsp + 0x210]
03d9e 48890424                       mov        qword ptr [rsp], rax
03da2 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03daa 4889442408                     mov        qword ptr [rsp + 8], rax
03daf 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
03db4 49bae0a03ce300000000           movabs     r10, 0xe33ca0e0
03dbe 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03dc3 0f1f4000                       nop        dword ptr [rax]
03dc7 e814825007                     call       0x7f1e7f910860
03dcc 0f1f8400c43e001a               nop        dword ptr [rax + rax + 0x1a003ec4]
03dd4 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
03ddb 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
03de3 4103d8                         add        ebx, r8d
03de6 48bee06a72701e7f0000           movabs     rsi, 0x7f1e70726ae0
03df0 ff8608060000                   inc        dword ptr [rsi + 0x608]
03df6 8bb424d4010000                 mov        esi, dword ptr [rsp + 0x1d4]
03dfd 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
03e07 ff8200080000                   inc        dword ptr [rdx + 0x800]
03e0d 488bc3                         mov        rax, rbx
03e10 8b942444010000                 mov        edx, dword ptr [rsp + 0x144]
03e17 ffc2                           inc        edx
03e19 48b9e06a72701e7f0000           movabs     rcx, 0x7f1e70726ae0
03e23 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
03e27 4183c002                       add        r8d, 2
03e2b 44894174                       mov        dword ptr [rcx + 0x74], r8d
03e2f 4181e0fe3f0000                 and        r8d, 0x3ffe
03e36 4585c0                         test       r8d, r8d
03e39 0f8461110000                   je         0x7f1e78409820
03e3f 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03e43 418502                         test       dword ptr [r10], eax
03e46 48b9e06a72701e7f0000           movabs     rcx, 0x7f1e70726ae0
03e50 ff8128080000                   inc        dword ptr [rcx + 0x828]
03e56 488bce                         mov        rcx, rsi
03e59 4c8bd8                         mov        r11, rax
03e5c 488bf1                         mov        rsi, rcx
03e5f 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
03e67 488b9c2468020000               mov        rbx, qword ptr [rsp + 0x268]
03e6f 8bbc2430010000                 mov        edi, dword ptr [rsp + 0x130]
03e76 4c8b8c2420010000               mov        r9, qword ptr [rsp + 0x120]
03e7e 4c8b842428010000               mov        r8, qword ptr [rsp + 0x128]
03e86 8b8c2434010000                 mov        ecx, dword ptr [rsp + 0x134]
03e8d e95ec4ffff                     jmp        0x7f1e78404b70
03e92 4c8bc8                         mov        r9, rax
03e95 4585c9                         test       r9d, r9d
03e98 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
03ea2 b980030000                     mov        ecx, 0x380
03ea7 7e05                           jle        0x7f1e7840872e
03ea9 b990030000                     mov        ecx, 0x390
03eae 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
03eb2 4d8d4001                       lea        r8, [r8 + 1]
03eb6 4c89040a                       mov        qword ptr [rdx + rcx], r8
03eba 0f8e77010000                   jle        0x7f1e784088b7
03ec0 488b9c2498010000               mov        rbx, qword ptr [rsp + 0x198]
03ec8 482bf3                         sub        rsi, rbx
03ecb ba00000000                     mov        edx, 0
03ed0 483bf2                         cmp        rsi, rdx
03ed3 48bee06a72701e7f0000           movabs     rsi, 0x7f1e70726ae0
03edd baa0030000                     mov        edx, 0x3a0
03ee2 7d05                           jge        0x7f1e78408769
03ee4 bab0030000                     mov        edx, 0x3b0
03ee9 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
03eed 488d4901                       lea        rcx, [rcx + 1]
03ef1 48890c16                       mov        qword ptr [rsi + rdx], rcx
03ef5 0f8d3c010000                   jge        0x7f1e784088b7
03efb 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
03f03 488b5630                       mov        rdx, qword ptr [rsi + 0x30]
03f07 be00000000                     mov        esi, 0
03f0c 483bd6                         cmp        rdx, rsi
03f0f 48bee06a72701e7f0000           movabs     rsi, 0x7f1e70726ae0
03f19 bac0030000                     mov        edx, 0x3c0
03f1e 7505                           jne        0x7f1e784087a5
03f20 bad0030000                     mov        edx, 0x3d0
03f25 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
03f29 488d4901                       lea        rcx, [rcx + 1]
03f2d 48890c16                       mov        qword ptr [rsi + rdx], rcx
03f31 0f8500010000                   jne        0x7f1e784088b7
03f37 e905010000                     jmp        0x7f1e784088c1
03f3c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
03f44 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03f4c 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
03f54 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
03f5b 488bce                         mov        rcx, rsi
03f5e 8bb42434010000                 mov        esi, dword ptr [rsp + 0x134]
03f65 488bde                         mov        rbx, rsi
03f68 2bd9                           sub        ebx, ecx
03f6a 48bee06a72701e7f0000           movabs     rsi, 0x7f1e70726ae0
03f74 4883864008000001               add        qword ptr [rsi + 0x840], 1
03f7c 488bf2                         mov        rsi, rdx
03f7f 488bd1                         mov        rdx, rcx
03f82 488bc8                         mov        rcx, rax
03f85 4d8bc3                         mov        r8, r11
03f88 4c8bcb                         mov        r9, rbx
03f8b 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
03f93 899c241c020000                 mov        dword ptr [rsp + 0x21c], ebx
03f9a 4885c9                         test       rcx, rcx
03f9d 0f841e100000                   je         0x7f1e78409841
03fa3 85d2                           test       edx, edx
03fa5 0f8c16100000                   jl         0x7f1e78409841
03fab 4585c0                         test       r8d, r8d
03fae 0f8c0d100000                   jl         0x7f1e78409841
03fb4 4a8d3c0a                       lea        rdi, [rdx + r9]
03fb8 3b7e08                         cmp        edi, dword ptr [rsi + 8]
03fbb 0f8700100000                   ja         0x7f1e78409841
03fc1 4b8d3c08                       lea        rdi, [r8 + r9]
03fc5 3b7908                         cmp        edi, dword ptr [rcx + 8]
03fc8 0f87f30f0000                   ja         0x7f1e78409841
03fce 4585c9                         test       r9d, r9d
03fd1 0f8cea0f0000                   jl         0x7f1e78409841
03fd7 4863d2                         movsxd     rdx, edx
03fda 4d63c0                         movsxd     r8, r8d
03fdd 488d7c160c                     lea        rdi, [rsi + rdx + 0xc]
03fe2 4a8d74010c                     lea        rsi, [rcx + r8 + 0xc]
03fe7 498bd1                         mov        rdx, r9
03fea 40f6c40f                       test       spl, 0xf
03fee 0f8412000000                   je         0x7f1e78408886
03ff4 4883ec08                       sub        rsp, 8
03ff8 e8a3164f07                     call       0x7f1e7f8f9f20
03ffd 4883c408                       add        rsp, 8
04001 e905000000                     jmp        0x7f1e7840888b
04006 e895164f07                     call       0x7f1e7f8f9f20
0400b 8b9c241c020000                 mov        ebx, dword ptr [rsp + 0x21c]
04012 039c2474010000                 add        ebx, dword ptr [rsp + 0x174]
04019 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
04021 895e3c                         mov        dword ptr [rsi + 0x3c], ebx
04024 4881c450020000                 add        rsp, 0x250
0402b 5d                             pop        rbp
0402c 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
04030 0f879b0f0000                   ja         0x7f1e78409851
04036 c3                             ret        
04037 bb02000000                     mov        ebx, 2
0403c e915000000                     jmp        0x7f1e784088d6
04041 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
0404b ff82e0030000                   inc        dword ptr [rdx + 0x3e0]
04051 bb08000000                     mov        ebx, 8
04056 899c2428020000                 mov        dword ptr [rsp + 0x228], ebx
0405d 666690                         nop        
04060 e9910f0000                     jmp        0x7f1e78409876
04065 90                             nop        
04066 90                             nop        
04067 90                             nop        
04068 90                             nop        
04069 90                             nop        
0406a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04071 0f858e0f0000                   jne        0x7f1e78409885
04077 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
0407e 488d7828                       lea        rdi, [rax + 0x28]
04082 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
04089 0f87760f0000                   ja         0x7f1e78409885
0408f 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
04096 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0409d 488908                         mov        qword ptr [rax], rcx
040a0 4833c9                         xor        rcx, rcx
040a3 48894808                       mov        qword ptr [rax + 8], rcx
040a7 48894810                       mov        qword ptr [rax + 0x10], rcx
040ab 48894818                       mov        qword ptr [rax + 0x18], rcx
040af 48894820                       mov        qword ptr [rax + 0x20], rcx
040b3 0f1f440000                     nop        dword ptr [rax + rax]
040b8 e9640f0000                     jmp        0x7f1e784098a1
040bd 90                             nop        
040be 90                             nop        
040bf 90                             nop        
040c0 90                             nop        
040c1 90                             nop        
040c2 498bf1                         mov        rsi, r9
040c5 4889842420020000               mov        qword ptr [rsp + 0x220], rax
040cd 6690                           nop        
040cf e80c7f5007                     call       0x7f1e7f910860
040d4 0f1f8400cc41001c               nop        dword ptr [rax + rax + 0x1c0041cc]
040dc 48bae06a72701e7f0000           movabs     rdx, 0x7f1e70726ae0
040e6 488d9208040000                 lea        rdx, [rdx + 0x408]
040ed 4885c0                         test       rax, rax
040f0 750a                           jne        0x7f1e7840897c
040f2 f60201                         test       byte ptr [rdx], 1
040f5 7505                           jne        0x7f1e7840897c
040f7 f048830a01                     lock or    qword ptr [rdx], 1
040fc 488b942420020000               mov        rdx, qword ptr [rsp + 0x220]
04104 48b9e06a72701e7f0000           movabs     rcx, 0x7f1e70726ae0
0410e 4883811804000001               add        qword ptr [rcx + 0x418], 1
04116 8b942428020000                 mov        edx, dword ptr [rsp + 0x228]
0411d 488bc8                         mov        rcx, rax
04120 488bb42420020000               mov        rsi, qword ptr [rsp + 0x220]
04128 0f1f8000000000                 nop        dword ptr [rax]
0412f e8ac745007                     call       0x7f1e7f90fe60
04134 0f1f84002c42001d               nop        dword ptr [rax + rax + 0x1d00422c]
0413c 488b842420020000               mov        rax, qword ptr [rsp + 0x220]
04144 e9550f0000                     jmp        0x7f1e7840991e
04149 0f1f8000000000                 nop        dword ptr [rax]
04150 e9e50e0000                     jmp        0x7f1e784098ba
04155 90                             nop        
04156 90                             nop        
04157 90                             nop        
04158 90                             nop        
04159 90                             nop        
0415a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04161 0f85e20e0000                   jne        0x7f1e784098c9
04167 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
0416e 488d7828                       lea        rdi, [rax + 0x28]
04172 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
04179 0f87ca0e0000                   ja         0x7f1e784098c9
0417f 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
04186 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0418d 488908                         mov        qword ptr [rax], rcx
04190 4833c9                         xor        rcx, rcx
04193 48894808                       mov        qword ptr [rax + 8], rcx
04197 48894810                       mov        qword ptr [rax + 0x10], rcx
0419b 48894818                       mov        qword ptr [rax + 0x18], rcx
0419f 48894820                       mov        qword ptr [rax + 0x20], rcx
041a3 488bd0                         mov        rdx, rax
041a6 48b9e06a72701e7f0000           movabs     rcx, 0x7f1e70726ae0
041b0 4883815002000001               add        qword ptr [rcx + 0x250], 1
041b8 ba02000000                     mov        edx, 2
041bd 48b9006426e200000000           movabs     rcx, 0xe2266400
041c7 488bf0                         mov        rsi, rax
041ca 4889842430020000               mov        qword ptr [rsp + 0x230], rax
041d2 0f1f440000                     nop        dword ptr [rax + rax]
041d7 e804745007                     call       0x7f1e7f90fe60
041dc 0f1f8400d442001e               nop        dword ptr [rax + rax + 0x1e0042d4]
041e4 488b842430020000               mov        rax, qword ptr [rsp + 0x230]
041ec e9ad0e0000                     jmp        0x7f1e7840991e
041f1 0f1f8000000000                 nop        dword ptr [rax]
041f8 e9680e0000                     jmp        0x7f1e784098e5
041fd 90                             nop        
041fe 90                             nop        
041ff 90                             nop        
04200 90                             nop        
04201 90                             nop        
04202 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04209 0f85650e0000                   jne        0x7f1e784098f4
0420f 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
04216 488d7828                       lea        rdi, [rax + 0x28]
0421a 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
04221 0f874d0e0000                   ja         0x7f1e784098f4
04227 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
0422e 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
04235 488908                         mov        qword ptr [rax], rcx
04238 4833c9                         xor        rcx, rcx
0423b 48894808                       mov        qword ptr [rax + 8], rcx
0423f 48894810                       mov        qword ptr [rax + 0x10], rcx
04243 48894818                       mov        qword ptr [rax + 0x18], rcx
04247 48894820                       mov        qword ptr [rax + 0x20], rcx
0424b 488bd0                         mov        rdx, rax
0424e 48b9e06a72701e7f0000           movabs     rcx, 0x7f1e70726ae0
04258 4883813801000001               add        qword ptr [rcx + 0x138], 1
04260 ba05000000                     mov        edx, 5
04265 48b9406426e200000000           movabs     rcx, 0xe2266440
0426f 488bf0                         mov        rsi, rax
04272 4889842438020000               mov        qword ptr [rsp + 0x238], rax
0427a 0f1f440000                     nop        dword ptr [rax + rax]
0427f e85c735007                     call       0x7f1e7f90fe60
04284 0f1f84007c43001f               nop        dword ptr [rax + rax + 0x1f00437c]
0428c 488b842438020000               mov        rax, qword ptr [rsp + 0x238]
04294 e9050e0000                     jmp        0x7f1e7840991e
04299 49bad8e570701e7f0000           movabs     r10, 0x7f1e7070e5d8
042a3 4c89542408                     mov        qword ptr [rsp + 8], r10
042a8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
042b0 e82be25c07                     call       0x7f1e7f9d6d60
042b5 e9d3bdffff                     jmp        0x7f1e7840490d
042ba 49ba302619701e7f0000           movabs     r10, 0x7f1e70192630
042c4 4c89542408                     mov        qword ptr [rsp + 8], r10
042c9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
042d1 e80ae25c07                     call       0x7f1e7f9d6d60
042d6 e93cbfffff                     jmp        0x7f1e78404a97
042db e880825c07                     call       0x7f1e7f9d0de0
042e0 e87b825c07                     call       0x7f1e7f9d0de0
042e5 e876825c07                     call       0x7f1e7f9d0de0
042ea 48891424                       mov        qword ptr [rsp], rdx
042ee 4c89442408                     mov        qword ptr [rsp + 8], r8
042f3 e868795c07                     call       0x7f1e7f9d04e0
042f8 e863825c07                     call       0x7f1e7f9d0de0
042fd e85e825c07                     call       0x7f1e7f9d0de0
04302 48891424                       mov        qword ptr [rsp], rdx
04306 4c894c2408                     mov        qword ptr [rsp + 8], r9
0430b e850795c07                     call       0x7f1e7f9d04e0
04310 e84b825c07                     call       0x7f1e7f9d0de0
04315 e846825c07                     call       0x7f1e7f9d0de0
0431a 48c7042401000000               mov        qword ptr [rsp], 1
04322 48895c2408                     mov        qword ptr [rsp + 8], rbx
04327 e834795c07                     call       0x7f1e7f9d04e0
0432c 48c7042402000000               mov        qword ptr [rsp], 2
04334 48895c2408                     mov        qword ptr [rsp + 8], rbx
04339 e822795c07                     call       0x7f1e7f9d04e0
0433e 49ba587963701e7f0000           movabs     r10, 0x7f1e70637958
04348 4c89542408                     mov        qword ptr [rsp + 8], r10
0434d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04355 e886e15c07                     call       0x7f1e7f9d6d60
0435a e94ec4ffff                     jmp        0x7f1e7840502d
0435f 49baf85178701e7f0000           movabs     r10, 0x7f1e707851f8
04369 4c89542408                     mov        qword ptr [rsp + 8], r10
0436e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04376 e865e15c07                     call       0x7f1e7f9d6d60
0437b e9d2c4ffff                     jmp        0x7f1e784050d2
04380 49ba30f516701e7f0000           movabs     r10, 0x7f1e7016f530
0438a 4c89542408                     mov        qword ptr [rsp + 8], r10
0438f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04397 e844e15c07                     call       0x7f1e7f9d6d60
0439c e9fbc4ffff                     jmp        0x7f1e7840511c
043a1 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
043a9 e8b2c25c07                     call       0x7f1e7f9d4ee0
043ae 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
043b6 e8a5c25c07                     call       0x7f1e7f9d4ee0
043bb 49bae8f068701e7f0000           movabs     r10, 0x7f1e7068f0e8
043c5 4c89542408                     mov        qword ptr [rsp + 8], r10
043ca 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
043d2 e809e15c07                     call       0x7f1e7f9d6d60
043d7 e998c5ffff                     jmp        0x7f1e784051f4
043dc 49ba985969701e7f0000           movabs     r10, 0x7f1e70695998
043e6 4c89542408                     mov        qword ptr [rsp + 8], r10
043eb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
043f3 e8e8e05c07                     call       0x7f1e7f9d6d60
043f8 e9aac5ffff                     jmp        0x7f1e78405227
043fd 49ba08166c701e7f0000           movabs     r10, 0x7f1e706c1608
04407 4c89542408                     mov        qword ptr [rsp + 8], r10
0440c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04414 e8c7e05c07                     call       0x7f1e7f9d6d60
04419 e900c6ffff                     jmp        0x7f1e7840529e
0441e 49ba209363701e7f0000           movabs     r10, 0x7f1e70639320
04428 4c89542408                     mov        qword ptr [rsp + 8], r10
0442d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04435 e8a6e05c07                     call       0x7f1e7f9d6d60
0443a e916c6ffff                     jmp        0x7f1e784052d5
0443f 49ba38d96b701e7f0000           movabs     r10, 0x7f1e706bd938
04449 4c89542408                     mov        qword ptr [rsp + 8], r10
0444e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04456 e885e05c07                     call       0x7f1e7f9d6d60
0445b e92dc6ffff                     jmp        0x7f1e7840530d
04460 49ba88ab63701e7f0000           movabs     r10, 0x7f1e7063ab88
0446a 4c89542408                     mov        qword ptr [rsp + 8], r10
0446f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04477 e864e05c07                     call       0x7f1e7f9d6d60
0447c e927c7ffff                     jmp        0x7f1e78405428
04481 49ba48d640701e7f0000           movabs     r10, 0x7f1e7040d648
0448b 4c89542408                     mov        qword ptr [rsp + 8], r10
04490 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04498 e843e05c07                     call       0x7f1e7f9d6d60
0449d e947c7ffff                     jmp        0x7f1e78405469
044a2 49bab8af3b701e7f0000           movabs     r10, 0x7f1e703bafb8
044ac 4c89542408                     mov        qword ptr [rsp + 8], r10
044b1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044b9 e822e05c07                     call       0x7f1e7f9d6d60
044be e959c7ffff                     jmp        0x7f1e7840549c
044c3 48890424                       mov        qword ptr [rsp], rax
044c7 e894a85c07                     call       0x7f1e7f9d35e0
044cc e88f805c07                     call       0x7f1e7f9d0de0
044d1 49bae88663701e7f0000           movabs     r10, 0x7f1e706386e8
044db 4c89542408                     mov        qword ptr [rsp + 8], r10
044e0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044e8 e8f3df5c07                     call       0x7f1e7f9d6d60
044ed e9e0c8ffff                     jmp        0x7f1e78405652
044f2 e869805c07                     call       0x7f1e7f9d0de0
044f7 49baf85178701e7f0000           movabs     r10, 0x7f1e707851f8
04501 4c89542408                     mov        qword ptr [rsp + 8], r10
04506 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0450e e8cddf5c07                     call       0x7f1e7f9d6d60
04513 e982c9ffff                     jmp        0x7f1e7840571a
04518 49ba30f516701e7f0000           movabs     r10, 0x7f1e7016f530
04522 4c89542408                     mov        qword ptr [rsp + 8], r10
04527 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0452f e8acdf5c07                     call       0x7f1e7f9d6d60
04534 e99fc9ffff                     jmp        0x7f1e78405758
04539 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04541 e81ac15c07                     call       0x7f1e7f9d4ee0
04546 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0454e e80dc15c07                     call       0x7f1e7f9d4ee0
04553 e808805c07                     call       0x7f1e7f9d0de0
04558 49ba88ab63701e7f0000           movabs     r10, 0x7f1e7063ab88
04562 4c89542408                     mov        qword ptr [rsp + 8], r10
04567 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0456f e86cdf5c07                     call       0x7f1e7f9d6d60
04574 e94acbffff                     jmp        0x7f1e78405943
04579 49ba48d640701e7f0000           movabs     r10, 0x7f1e7040d648
04583 4c89542408                     mov        qword ptr [rsp + 8], r10
04588 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04590 e84bdf5c07                     call       0x7f1e7f9d6d60
04595 e976cbffff                     jmp        0x7f1e78405990
0459a 49bab8af3b701e7f0000           movabs     r10, 0x7f1e703bafb8
045a4 4c89542408                     mov        qword ptr [rsp + 8], r10
045a9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045b1 e82adf5c07                     call       0x7f1e7f9d6d60
045b6 e98dcbffff                     jmp        0x7f1e784059c8
045bb 49ba587963701e7f0000           movabs     r10, 0x7f1e70637958
045c5 4c89542408                     mov        qword ptr [rsp + 8], r10
045ca 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045d2 e809df5c07                     call       0x7f1e7f9d6d60
045d7 e98bccffff                     jmp        0x7f1e78405ae7
045dc 49baf85178701e7f0000           movabs     r10, 0x7f1e707851f8
045e6 4c89542408                     mov        qword ptr [rsp + 8], r10
045eb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045f3 e8e8de5c07                     call       0x7f1e7f9d6d60
045f8 e914cdffff                     jmp        0x7f1e78405b91
045fd 49ba30f516701e7f0000           movabs     r10, 0x7f1e7016f530
04607 4c89542408                     mov        qword ptr [rsp + 8], r10
0460c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04614 e8c7de5c07                     call       0x7f1e7f9d6d60
04619 e931cdffff                     jmp        0x7f1e78405bcf
0461e 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04626 e835c05c07                     call       0x7f1e7f9d4ee0
0462b 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04633 e828c05c07                     call       0x7f1e7f9d4ee0
04638 49bae8f068701e7f0000           movabs     r10, 0x7f1e7068f0e8
04642 4c89542408                     mov        qword ptr [rsp + 8], r10
04647 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0464f e88cde5c07                     call       0x7f1e7f9d6d60
04654 e9cecdffff                     jmp        0x7f1e78405ca7
04659 49ba985969701e7f0000           movabs     r10, 0x7f1e70695998
04663 4c89542408                     mov        qword ptr [rsp + 8], r10
04668 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04670 e86bde5c07                     call       0x7f1e7f9d6d60
04675 e9e5cdffff                     jmp        0x7f1e78405cdf
0467a 49ba08166c701e7f0000           movabs     r10, 0x7f1e706c1608
04684 4c89542408                     mov        qword ptr [rsp + 8], r10
04689 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04691 e84ade5c07                     call       0x7f1e7f9d6d60
04696 e924ceffff                     jmp        0x7f1e78405d3f
0469b 49ba209363701e7f0000           movabs     r10, 0x7f1e70639320
046a5 4c89542408                     mov        qword ptr [rsp + 8], r10
046aa 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046b2 e829de5c07                     call       0x7f1e7f9d6d60
046b7 e93bceffff                     jmp        0x7f1e78405d77
046bc 49ba38d96b701e7f0000           movabs     r10, 0x7f1e706bd938
046c6 4c89542408                     mov        qword ptr [rsp + 8], r10
046cb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046d3 e808de5c07                     call       0x7f1e7f9d6d60
046d8 e952ceffff                     jmp        0x7f1e78405daf
046dd 49ba88ab63701e7f0000           movabs     r10, 0x7f1e7063ab88
046e7 4c89542408                     mov        qword ptr [rsp + 8], r10
046ec 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046f4 e8e7dd5c07                     call       0x7f1e7f9d6d60
046f9 e946cfffff                     jmp        0x7f1e78405ec4
046fe 49ba48d640701e7f0000           movabs     r10, 0x7f1e7040d648
04708 4c89542408                     mov        qword ptr [rsp + 8], r10
0470d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04715 e8c6dd5c07                     call       0x7f1e7f9d6d60
0471a e96bcfffff                     jmp        0x7f1e78405f0a
0471f 49bab8af3b701e7f0000           movabs     r10, 0x7f1e703bafb8
04729 4c89542408                     mov        qword ptr [rsp + 8], r10
0472e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04736 e8a5dd5c07                     call       0x7f1e7f9d6d60
0473b e982cfffff                     jmp        0x7f1e78405f42
04740 48890424                       mov        qword ptr [rsp], rax
04744 e817a65c07                     call       0x7f1e7f9d35e0
04749 e8127e5c07                     call       0x7f1e7f9d0de0
0474e 49bae88663701e7f0000           movabs     r10, 0x7f1e706386e8
04758 4c89542408                     mov        qword ptr [rsp + 8], r10
0475d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04765 e876dd5c07                     call       0x7f1e7f9d6d60
0476a e90bd1ffff                     jmp        0x7f1e784060fa
0476f e8ec7d5c07                     call       0x7f1e7f9d0de0
04774 49baf85178701e7f0000           movabs     r10, 0x7f1e707851f8
0477e 4c89542408                     mov        qword ptr [rsp + 8], r10
04783 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0478b e850dd5c07                     call       0x7f1e7f9d6d60
04790 e9add1ffff                     jmp        0x7f1e784061c2
04795 49ba30f516701e7f0000           movabs     r10, 0x7f1e7016f530
0479f 4c89542408                     mov        qword ptr [rsp + 8], r10
047a4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047ac e82fdd5c07                     call       0x7f1e7f9d6d60
047b1 e9cad1ffff                     jmp        0x7f1e78406200
047b6 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
047be e89dbe5c07                     call       0x7f1e7f9d4ee0
047c3 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
047cb e890be5c07                     call       0x7f1e7f9d4ee0
047d0 e88b7d5c07                     call       0x7f1e7f9d0de0
047d5 49ba88ab63701e7f0000           movabs     r10, 0x7f1e7063ab88
047df 4c89542408                     mov        qword ptr [rsp + 8], r10
047e4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047ec e8efdc5c07                     call       0x7f1e7f9d6d60
047f1 e975d3ffff                     jmp        0x7f1e784063eb
047f6 49ba48d640701e7f0000           movabs     r10, 0x7f1e7040d648
04800 4c89542408                     mov        qword ptr [rsp + 8], r10
04805 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0480d e8cedc5c07                     call       0x7f1e7f9d6d60
04812 e9a1d3ffff                     jmp        0x7f1e78406438
04817 49bab8af3b701e7f0000           movabs     r10, 0x7f1e703bafb8
04821 4c89542408                     mov        qword ptr [rsp + 8], r10
04826 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0482e e8addc5c07                     call       0x7f1e7f9d6d60
04833 e9b8d3ffff                     jmp        0x7f1e78406470
04838 49bad8e570701e7f0000           movabs     r10, 0x7f1e7070e5d8
04842 4c89542408                     mov        qword ptr [rsp + 8], r10
04847 48c704240a020000               mov        qword ptr [rsp], 0x20a
0484f e88cdc5c07                     call       0x7f1e7f9d6d60
04854 e95cd4ffff                     jmp        0x7f1e78406535
04859 660f1f440000                   nop        word ptr [rax + rax]
0485f e87c775007                     call       0x7f1e7f910860
04864 e93dd5ffff                     jmp        0x7f1e78406626
04869 660f1f440000                   nop        word ptr [rax + rax]
0486f e86c775007                     call       0x7f1e7f910860
04874 e9bad6ffff                     jmp        0x7f1e784067b3
04879 49ba680d71701e7f0000           movabs     r10, 0x7f1e70710d68
04883 4c89542408                     mov        qword ptr [rsp + 8], r10
04888 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04890 e84bdc5c07                     call       0x7f1e7f9d6d60
04895 e918d7ffff                     jmp        0x7f1e78406832
0489a 49bac0ec60701e7f0000           movabs     r10, 0x7f1e7060ecc0
048a4 4c89542408                     mov        qword ptr [rsp + 8], r10
048a9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048b1 e82adc5c07                     call       0x7f1e7f9d6d60
048b6 e96ed7ffff                     jmp        0x7f1e784068a9
048bb 49ba000d09701e7f0000           movabs     r10, 0x7f1e70090d00
048c5 4c89542408                     mov        qword ptr [rsp + 8], r10
048ca 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048d2 e809dc5c07                     call       0x7f1e7f9d6d60
048d7 e9e0d7ffff                     jmp        0x7f1e7840693c
048dc 49ba78b661701e7f0000           movabs     r10, 0x7f1e7061b678
048e6 4c89542408                     mov        qword ptr [rsp + 8], r10
048eb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048f3 e8e8db5c07                     call       0x7f1e7f9d6d60
048f8 e982d8ffff                     jmp        0x7f1e784069ff
048fd 49ba10fd61701e7f0000           movabs     r10, 0x7f1e7061fd10
04907 4c89542408                     mov        qword ptr [rsp + 8], r10
0490c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04914 e8c7db5c07                     call       0x7f1e7f9d6d60
04919 e9c6d8ffff                     jmp        0x7f1e78406a64
0491e 49baf8fb61701e7f0000           movabs     r10, 0x7f1e7061fbf8
04928 4c89542408                     mov        qword ptr [rsp + 8], r10
0492d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04935 e8a6db5c07                     call       0x7f1e7f9d6d60
0493a e9d8d8ffff                     jmp        0x7f1e78406a97
0493f e81c7c5c07                     call       0x7f1e7f9d0de0
04944 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0494c e80fbd5c07                     call       0x7f1e7f9d4ee0
04951 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04959 e802bd5c07                     call       0x7f1e7f9d4ee0
0495e 49bad8e570701e7f0000           movabs     r10, 0x7f1e7070e5d8
04968 4c89542408                     mov        qword ptr [rsp + 8], r10
0496d 48c70424aa020000               mov        qword ptr [rsp], 0x2aa
04975 e866db5c07                     call       0x7f1e7f9d6d60
0497a e9fdd9ffff                     jmp        0x7f1e78406bfc
0497f 49ba587963701e7f0000           movabs     r10, 0x7f1e70637958
04989 4c89542408                     mov        qword ptr [rsp + 8], r10
0498e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04996 e845db5c07                     call       0x7f1e7f9d6d60
0499b e9d2daffff                     jmp        0x7f1e78406cf2
049a0 e8bb7b5c07                     call       0x7f1e7f9d0de0
049a5 49baf85178701e7f0000           movabs     r10, 0x7f1e707851f8
049af 4c89542408                     mov        qword ptr [rsp + 8], r10
049b4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049bc e81fdb5c07                     call       0x7f1e7f9d6d60
049c1 e955dbffff                     jmp        0x7f1e78406d9b
049c6 49ba30f516701e7f0000           movabs     r10, 0x7f1e7016f530
049d0 4c89542408                     mov        qword ptr [rsp + 8], r10
049d5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049dd e8feda5c07                     call       0x7f1e7f9d6d60
049e2 e96ddbffff                     jmp        0x7f1e78406dd4
049e7 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
049ef e86cbc5c07                     call       0x7f1e7f9d4ee0
049f4 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
049fc e85fbc5c07                     call       0x7f1e7f9d4ee0
04a01 49bae8f068701e7f0000           movabs     r10, 0x7f1e7068f0e8
04a0b 4c89542408                     mov        qword ptr [rsp + 8], r10
04a10 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a18 e8c3da5c07                     call       0x7f1e7f9d6d60
04a1d e901dcffff                     jmp        0x7f1e78406ea3
04a22 49ba985969701e7f0000           movabs     r10, 0x7f1e70695998
04a2c 4c89542408                     mov        qword ptr [rsp + 8], r10
04a31 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a39 e8a2da5c07                     call       0x7f1e7f9d6d60
04a3e e913dcffff                     jmp        0x7f1e78406ed6
04a43 49ba08166c701e7f0000           movabs     r10, 0x7f1e706c1608
04a4d 4c89542408                     mov        qword ptr [rsp + 8], r10
04a52 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a5a e881da5c07                     call       0x7f1e7f9d6d60
04a5f e956dcffff                     jmp        0x7f1e78406f3a
04a64 49ba209363701e7f0000           movabs     r10, 0x7f1e70639320
04a6e 4c89542408                     mov        qword ptr [rsp + 8], r10
04a73 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a7b e860da5c07                     call       0x7f1e7f9d6d60
04a80 e970dcffff                     jmp        0x7f1e78406f75
04a85 49ba38d96b701e7f0000           movabs     r10, 0x7f1e706bd938
04a8f 4c89542408                     mov        qword ptr [rsp + 8], r10
04a94 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a9c e83fda5c07                     call       0x7f1e7f9d6d60
04aa1 e982dcffff                     jmp        0x7f1e78406fa8
04aa6 49ba88ab63701e7f0000           movabs     r10, 0x7f1e7063ab88
04ab0 4c89542408                     mov        qword ptr [rsp + 8], r10
04ab5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04abd e81eda5c07                     call       0x7f1e7f9d6d60
04ac2 e971ddffff                     jmp        0x7f1e784070b8
04ac7 49ba48d640701e7f0000           movabs     r10, 0x7f1e7040d648
04ad1 4c89542408                     mov        qword ptr [rsp + 8], r10
04ad6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ade e8fdd95c07                     call       0x7f1e7f9d6d60
04ae3 e991ddffff                     jmp        0x7f1e784070f9
04ae8 49bab8af3b701e7f0000           movabs     r10, 0x7f1e703bafb8
04af2 4c89542408                     mov        qword ptr [rsp + 8], r10
04af7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04aff e8dcd95c07                     call       0x7f1e7f9d6d60
04b04 e9a3ddffff                     jmp        0x7f1e7840712c
04b09 48890424                       mov        qword ptr [rsp], rax
04b0d e84ea25c07                     call       0x7f1e7f9d35e0
04b12 e8497a5c07                     call       0x7f1e7f9d0de0
04b17 49bae88663701e7f0000           movabs     r10, 0x7f1e706386e8
04b21 4c89542408                     mov        qword ptr [rsp + 8], r10
04b26 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b2e e8add95c07                     call       0x7f1e7f9d6d60
04b33 e92adfffff                     jmp        0x7f1e784072e2
04b38 49baf85178701e7f0000           movabs     r10, 0x7f1e707851f8
04b42 4c89542408                     mov        qword ptr [rsp + 8], r10
04b47 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b4f e88cd95c07                     call       0x7f1e7f9d6d60
04b54 e9c6dfffff                     jmp        0x7f1e7840739f
04b59 49ba30f516701e7f0000           movabs     r10, 0x7f1e7016f530
04b63 4c89542408                     mov        qword ptr [rsp + 8], r10
04b68 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b70 e86bd95c07                     call       0x7f1e7f9d6d60
04b75 e9ecdfffff                     jmp        0x7f1e784073e6
04b7a 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04b82 e8d9ba5c07                     call       0x7f1e7f9d4ee0
04b87 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04b8f e8ccba5c07                     call       0x7f1e7f9d4ee0
04b94 e8c7795c07                     call       0x7f1e7f9d0de0
04b99 49ba88ab63701e7f0000           movabs     r10, 0x7f1e7063ab88
04ba3 4c89542408                     mov        qword ptr [rsp + 8], r10
04ba8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bb0 e82bd95c07                     call       0x7f1e7f9d6d60
04bb5 e999e1ffff                     jmp        0x7f1e784075d3
04bba 49ba48d640701e7f0000           movabs     r10, 0x7f1e7040d648
04bc4 4c89542408                     mov        qword ptr [rsp + 8], r10
04bc9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bd1 e80ad95c07                     call       0x7f1e7f9d6d60
04bd6 e9c5e1ffff                     jmp        0x7f1e78407620
04bdb 49bab8af3b701e7f0000           movabs     r10, 0x7f1e703bafb8
04be5 4c89542408                     mov        qword ptr [rsp + 8], r10
04bea 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bf2 e8e9d85c07                     call       0x7f1e7f9d6d60
04bf7 e9dce1ffff                     jmp        0x7f1e78407658
04bfc 49bad8e570701e7f0000           movabs     r10, 0x7f1e7070e5d8
04c06 4c89542408                     mov        qword ptr [rsp + 8], r10
04c0b 48c70424e8020000               mov        qword ptr [rsp], 0x2e8
04c13 e8c8d85c07                     call       0x7f1e7f9d6d60
04c18 e97de2ffff                     jmp        0x7f1e7840771a
04c1d 49ba680d71701e7f0000           movabs     r10, 0x7f1e70710d68
04c27 4c89542408                     mov        qword ptr [rsp + 8], r10
04c2c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c34 e8a7d85c07                     call       0x7f1e7f9d6d60
04c39 e93ce3ffff                     jmp        0x7f1e784077fa
04c3e 49bac0ec60701e7f0000           movabs     r10, 0x7f1e7060ecc0
04c48 4c89542408                     mov        qword ptr [rsp + 8], r10
04c4d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c55 e886d85c07                     call       0x7f1e7f9d6d60
04c5a e992e3ffff                     jmp        0x7f1e78407871
04c5f 49ba000d09701e7f0000           movabs     r10, 0x7f1e70090d00
04c69 4c89542408                     mov        qword ptr [rsp + 8], r10
04c6e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c76 e865d85c07                     call       0x7f1e7f9d6d60
04c7b e904e4ffff                     jmp        0x7f1e78407904
04c80 49ba78b661701e7f0000           movabs     r10, 0x7f1e7061b678
04c8a 4c89542408                     mov        qword ptr [rsp + 8], r10
04c8f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c97 e844d85c07                     call       0x7f1e7f9d6d60
04c9c e9a6e4ffff                     jmp        0x7f1e784079c7
04ca1 49ba10fd61701e7f0000           movabs     r10, 0x7f1e7061fd10
04cab 4c89542408                     mov        qword ptr [rsp + 8], r10
04cb0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cb8 e823d85c07                     call       0x7f1e7f9d6d60
04cbd e9eae4ffff                     jmp        0x7f1e78407a2c
04cc2 49baf8fb61701e7f0000           movabs     r10, 0x7f1e7061fbf8
04ccc 4c89542408                     mov        qword ptr [rsp + 8], r10
04cd1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cd9 e802d85c07                     call       0x7f1e7f9d6d60
04cde e9fce4ffff                     jmp        0x7f1e78407a5f
04ce3 e878785c07                     call       0x7f1e7f9d0de0
04ce8 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04cf0 e86bb95c07                     call       0x7f1e7f9d4ee0
04cf5 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04cfd e85eb95c07                     call       0x7f1e7f9d4ee0
04d02 49bad8e570701e7f0000           movabs     r10, 0x7f1e7070e5d8
04d0c 4c89542408                     mov        qword ptr [rsp + 8], r10
04d11 48c7042420030000               mov        qword ptr [rsp], 0x320
04d19 e8c2d75c07                     call       0x7f1e7f9d6d60
04d1e e921e6ffff                     jmp        0x7f1e78407bc4
04d23 49ba587963701e7f0000           movabs     r10, 0x7f1e70637958
04d2d 4c89542408                     mov        qword ptr [rsp + 8], r10
04d32 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d3a e8a1d75c07                     call       0x7f1e7f9d6d60
04d3f e9e1e6ffff                     jmp        0x7f1e78407ca5
04d44 e817785c07                     call       0x7f1e7f9d0de0
04d49 49baf85178701e7f0000           movabs     r10, 0x7f1e707851f8
04d53 4c89542408                     mov        qword ptr [rsp + 8], r10
04d58 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d60 e87bd75c07                     call       0x7f1e7f9d6d60
04d65 e963e7ffff                     jmp        0x7f1e78407d4d
04d6a 49ba30f516701e7f0000           movabs     r10, 0x7f1e7016f530
04d74 4c89542408                     mov        qword ptr [rsp + 8], r10
04d79 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d81 e85ad75c07                     call       0x7f1e7f9d6d60
04d86 e97be7ffff                     jmp        0x7f1e78407d86
04d8b 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04d93 e8c8b85c07                     call       0x7f1e7f9d4ee0
04d98 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04da0 e8bbb85c07                     call       0x7f1e7f9d4ee0
04da5 49bae8f068701e7f0000           movabs     r10, 0x7f1e7068f0e8
04daf 4c89542408                     mov        qword ptr [rsp + 8], r10
04db4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04dbc e81fd75c07                     call       0x7f1e7f9d6d60
04dc1 e907e8ffff                     jmp        0x7f1e78407e4d
04dc6 49ba985969701e7f0000           movabs     r10, 0x7f1e70695998
04dd0 4c89542408                     mov        qword ptr [rsp + 8], r10
04dd5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ddd e8fed65c07                     call       0x7f1e7f9d6d60
04de2 e919e8ffff                     jmp        0x7f1e78407e80
04de7 49ba08166c701e7f0000           movabs     r10, 0x7f1e706c1608
04df1 4c89542408                     mov        qword ptr [rsp + 8], r10
04df6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04dfe e8ddd65c07                     call       0x7f1e7f9d6d60
04e03 e94fe8ffff                     jmp        0x7f1e78407ed7
04e08 49ba209363701e7f0000           movabs     r10, 0x7f1e70639320
04e12 4c89542408                     mov        qword ptr [rsp + 8], r10
04e17 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e1f e8bcd65c07                     call       0x7f1e7f9d6d60
04e24 e964e8ffff                     jmp        0x7f1e78407f0d
04e29 49ba38d96b701e7f0000           movabs     r10, 0x7f1e706bd938
04e33 4c89542408                     mov        qword ptr [rsp + 8], r10
04e38 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e40 e89bd65c07                     call       0x7f1e7f9d6d60
04e45 e976e8ffff                     jmp        0x7f1e78407f40
04e4a 49ba88ab63701e7f0000           movabs     r10, 0x7f1e7063ab88
04e54 4c89542408                     mov        qword ptr [rsp + 8], r10
04e59 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e61 e87ad65c07                     call       0x7f1e7f9d6d60
04e66 e965e9ffff                     jmp        0x7f1e78408050
04e6b 49ba48d640701e7f0000           movabs     r10, 0x7f1e7040d648
04e75 4c89542408                     mov        qword ptr [rsp + 8], r10
04e7a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e82 e859d65c07                     call       0x7f1e7f9d6d60
04e87 e985e9ffff                     jmp        0x7f1e78408091
04e8c 49bab8af3b701e7f0000           movabs     r10, 0x7f1e703bafb8
04e96 4c89542408                     mov        qword ptr [rsp + 8], r10
04e9b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ea3 e838d65c07                     call       0x7f1e7f9d6d60
04ea8 e997e9ffff                     jmp        0x7f1e784080c4
04ead 48890424                       mov        qword ptr [rsp], rax
04eb1 e8aa9e5c07                     call       0x7f1e7f9d35e0
04eb6 e8a5765c07                     call       0x7f1e7f9d0de0
04ebb 49bae88663701e7f0000           movabs     r10, 0x7f1e706386e8
04ec5 4c89542408                     mov        qword ptr [rsp + 8], r10
04eca 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ed2 e809d65c07                     call       0x7f1e7f9d6d60
04ed7 e91eebffff                     jmp        0x7f1e7840827a
04edc 49baf85178701e7f0000           movabs     r10, 0x7f1e707851f8
04ee6 4c89542408                     mov        qword ptr [rsp + 8], r10
04eeb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ef3 e8e8d55c07                     call       0x7f1e7f9d6d60
04ef8 e9baebffff                     jmp        0x7f1e78408337
04efd 49ba30f516701e7f0000           movabs     r10, 0x7f1e7016f530
04f07 4c89542408                     mov        qword ptr [rsp + 8], r10
04f0c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f14 e8c7d55c07                     call       0x7f1e7f9d6d60
04f19 e9ddebffff                     jmp        0x7f1e7840837b
04f1e 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04f26 e835b75c07                     call       0x7f1e7f9d4ee0
04f2b 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04f33 e828b75c07                     call       0x7f1e7f9d4ee0
04f38 e823765c07                     call       0x7f1e7f9d0de0
04f3d 49ba88ab63701e7f0000           movabs     r10, 0x7f1e7063ab88
04f47 4c89542408                     mov        qword ptr [rsp + 8], r10
04f4c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f54 e887d55c07                     call       0x7f1e7f9d6d60
04f59 e985edffff                     jmp        0x7f1e78408563
04f5e 49ba48d640701e7f0000           movabs     r10, 0x7f1e7040d648
04f68 4c89542408                     mov        qword ptr [rsp + 8], r10
04f6d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f75 e866d55c07                     call       0x7f1e7f9d6d60
04f7a e9b1edffff                     jmp        0x7f1e784085b0
04f7f 49bab8af3b701e7f0000           movabs     r10, 0x7f1e703bafb8
04f89 4c89542408                     mov        qword ptr [rsp + 8], r10
04f8e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f96 e845d55c07                     call       0x7f1e7f9d6d60
04f9b e9c8edffff                     jmp        0x7f1e784085e8
04fa0 49bad8e570701e7f0000           movabs     r10, 0x7f1e7070e5d8
04faa 4c89542408                     mov        qword ptr [rsp + 8], r10
04faf 48c704245a030000               mov        qword ptr [rsp], 0x35a
04fb7 e824d55c07                     call       0x7f1e7f9d6d60
04fbc e97eeeffff                     jmp        0x7f1e784086bf
04fc1 660f1f440000                   nop        word ptr [rax + rax]
04fc7 e814705007                     call       0x7f1e7f910860
04fcc e93af0ffff                     jmp        0x7f1e7840888b
04fd1 49baac8840781e7f0000           movabs     r10, 0x7f1e784088ac
04fdb 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
04fe2 e979965007                     jmp        0x7f1e7f912ee0
04fe7 48ba0000000000000000           movabs     rdx, 0
04ff1 b8000f050a                     mov        eax, 0xa050f00
04ff6 e8e5bf5c07                     call       0x7f1e7f9d5860
04ffb e960f0ffff                     jmp        0x7f1e784088e0
05000 e85b755c07                     call       0x7f1e7f9d0de0
05005 488bd2                         mov        rdx, rdx
05008 e8d3825c07                     call       0x7f1e7f9d1b60
0500d e9a1f0ffff                     jmp        0x7f1e78408933
05012 48ba0000000000000000           movabs     rdx, 0
0501c b8000f050a                     mov        eax, 0xa050f00
05021 e8bacb5c07                     call       0x7f1e7f9d6460
05026 e98df0ffff                     jmp        0x7f1e78408938
0502b 48ba0000000000000000           movabs     rdx, 0
05035 b8000f050a                     mov        eax, 0xa050f00
0503a e8a1bf5c07                     call       0x7f1e7f9d5860
0503f e90cf1ffff                     jmp        0x7f1e784089d0
05044 e817755c07                     call       0x7f1e7f9d0de0
05049 488bd2                         mov        rdx, rdx
0504c e88f825c07                     call       0x7f1e7f9d1b60
05051 e94df1ffff                     jmp        0x7f1e78408a23
05056 48ba0000000000000000           movabs     rdx, 0
05060 b8000f050a                     mov        eax, 0xa050f00
05065 e876bf5c07                     call       0x7f1e7f9d5860
0506a e989f1ffff                     jmp        0x7f1e78408a78
0506f e8ec745c07                     call       0x7f1e7f9d0de0
05074 488bd2                         mov        rdx, rdx
05077 e864825c07                     call       0x7f1e7f9d1b60
0507c e9caf1ffff                     jmp        0x7f1e78408acb
05081 498b8778050000                 mov        rax, qword ptr [r15 + 0x578]
05088 49c7877805000000000000         mov        qword ptr [r15 + 0x578], 0
05093 49c7878005000000000000         mov        qword ptr [r15 + 0x580], 0
0509e 4881c450020000                 add        rsp, 0x250
050a5 5d                             pop        rbp
050a6 e9b5655c07                     jmp        0x7f1e7f9cfee0
050ab f4                             hlt        
050ac f4                             hlt        
050ad f4                             hlt        
050ae f4                             hlt        
050af f4                             hlt        
