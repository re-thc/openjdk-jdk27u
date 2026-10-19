00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c02d5207                   jne        0x7f75ef90f960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ec50020000                 sub        rsp, 0x250
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 7405                           je         0x7f75e83ecbbf
0003a e8e12e5107                     call       0x7f75ef8ffaa0
0003f 4889b42448010000               mov        qword ptr [rsp + 0x148], rsi
00047 4889942468010000               mov        qword ptr [rsp + 0x168], rdx
0004f 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
00056 4c89842428010000               mov        qword ptr [rsp + 0x128], r8
0005e 4c898c2420010000               mov        qword ptr [rsp + 0x120], r9
00066 89bc2430010000                 mov        dword ptr [rsp + 0x130], edi
0006d 48bb701472e0757f0000           movabs     rbx, 0x7f75e0721470
00077 8b4370                         mov        eax, dword ptr [rbx + 0x70]
0007a 83c002                         add        eax, 2
0007d 894370                         mov        dword ptr [rbx + 0x70], eax
00080 25fe070000                     and        eax, 0x7fe
00085 85c0                           test       eax, eax
00087 0f84fc410000                   je         0x7f75e83f0e09
0008d 48bb701472e0757f0000           movabs     rbx, 0x7f75e0721470
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
000e1 48b8701472e0757f0000           movabs     rax, 0x7f75e0721470
000eb b9f8000000                     mov        ecx, 0xf8
000f0 7f05                           jg         0x7f75e83ecc77
000f2 b908010000                     mov        ecx, 0x108
000f7 44899c2440010000               mov        dword ptr [rsp + 0x140], r11d
000ff 4c8b1c08                       mov        r11, qword ptr [rax + rcx]
00103 4d8d5b01                       lea        r11, [r11 + 1]
00107 4c891c08                       mov        qword ptr [rax + rcx], r11
0010b 0f8fd0400000                   jg         0x7f75e83f0d61
00111 4863db                         movsxd     rbx, ebx
00114 488b4e20                       mov        rcx, qword ptr [rsi + 0x20]
00118 482bcf                         sub        rcx, rdi
0011b 483bcb                         cmp        rcx, rbx
0011e 48b9701472e0757f0000           movabs     rcx, 0x7f75e0721470
00128 b828010000                     mov        eax, 0x128
0012d 7c05                           jl         0x7f75e83eccb4
0012f b818010000                     mov        eax, 0x118
00134 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
00138 4d8d5b01                       lea        r11, [r11 + 1]
0013c 4c891c01                       mov        qword ptr [rcx + rax], r11
00140 0f8c9b400000                   jl         0x7f75e83f0d61
00146 48b9701472e0757f0000           movabs     rcx, 0x7f75e0721470
00150 ff8158010000                   inc        dword ptr [rcx + 0x158]
00156 b900000000                     mov        ecx, 0
0015b 498bc0                         mov        rax, r8
0015e 483bc1                         cmp        rax, rcx
00161 48b9701472e0757f0000           movabs     rcx, 0x7f75e0721470
0016b b868010000                     mov        eax, 0x168
00170 7505                           jne        0x7f75e83eccf7
00172 b878010000                     mov        eax, 0x178
00177 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
0017b 4d8d5b01                       lea        r11, [r11 + 1]
0017f 4c891c01                       mov        qword ptr [rcx + rax], r11
00183 0f8531000000                   jne        0x7f75e83ecd3a
00189 4803df                         add        rbx, rdi
0018c 498bc9                         mov        rcx, r9
0018f 483bcb                         cmp        rcx, rbx
00192 48b9701472e0757f0000           movabs     rcx, 0x7f75e0721470
0019c bf98010000                     mov        edi, 0x198
001a1 7d05                           jge        0x7f75e83ecd28
001a3 bf88010000                     mov        edi, 0x188
001a8 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
001ac 488d5b01                       lea        rbx, [rbx + 1]
001b0 48891c39                       mov        qword ptr [rcx + rdi], rbx
001b4 0f8d0a000000                   jge        0x7f75e83ecd44
001ba bf00000000                     mov        edi, 0
001bf e915000000                     jmp        0x7f75e83ecd59
001c4 48b9701472e0757f0000           movabs     rcx, 0x7f75e0721470
001ce ff81a8010000                   inc        dword ptr [rcx + 0x1a8]
001d4 bf01000000                     mov        edi, 1
001d9 4d2bc6                         sub        r8, r14
001dc 4c89842480010000               mov        qword ptr [rsp + 0x180], r8
001e4 48b9701472e0757f0000           movabs     rcx, 0x7f75e0721470
001ee 488381c001000001               add        qword ptr [rcx + 0x1c0], 1
001f6 48b9b01479e0757f0000           movabs     rcx, 0x7f75e07914b0
00200 8b5970                         mov        ebx, dword ptr [rcx + 0x70]
00203 83c302                         add        ebx, 2
00206 895970                         mov        dword ptr [rcx + 0x70], ebx
00209 81e3feff1f00                   and        ebx, 0x1ffffe
0020f 85db                           test       ebx, ebx
00211 0f8493400000                   je         0x7f75e83f0e2a
00217 48b9ffffffffffffff7f           movabs     rcx, 0x7fffffffffffffff
00221 493bc9                         cmp        rcx, r9
00224 48b9b01479e0757f0000           movabs     rcx, 0x7f75e07914b0
0022e bbb8000000                     mov        ebx, 0xb8
00233 7d05                           jge        0x7f75e83ecdba
00235 bba8000000                     mov        ebx, 0xa8
0023a 488b0419                       mov        rax, qword ptr [rcx + rbx]
0023e 488d4001                       lea        rax, [rax + 1]
00242 48890419                       mov        qword ptr [rcx + rbx], rax
00246 0f8d0f000000                   jge        0x7f75e83ecddb
0024c 49b9ffffffffffffff7f           movabs     r9, 0x7fffffffffffffff
00256 e910000000                     jmp        0x7f75e83ecdeb
0025b 48b9b01479e0757f0000           movabs     rcx, 0x7f75e07914b0
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
002f2 48bf701472e0757f0000           movabs     rdi, 0x7f75e0721470
002fc b8d0010000                     mov        eax, 0x1d0
00301 7d05                           jge        0x7f75e83ece88
00303 b8e0010000                     mov        eax, 0x1e0
00308 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
0030c 4d8d5b01                       lea        r11, [r11 + 1]
00310 4c891c07                       mov        qword ptr [rdi + rax], r11
00314 0f8d123c0000                   jge        0x7f75e83f0aac
0031a 413b5008                       cmp        edx, dword ptr [r8 + 8]
0031e 0f83b63f0000                   jae        0x7f75e83f0e5a
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
00367 48b9701472e0757f0000           movabs     rcx, 0x7f75e0721470
00371 41b8f0010000                   mov        r8d, 0x1f0
00377 7d06                           jge        0x7f75e83eceff
00379 41b800020000                   mov        r8d, 0x200
0037f 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00383 4d8d6d01                       lea        r13, [r13 + 1]
00387 4e892c01                       mov        qword ptr [rcx + r8], r13
0038b 0f8d15000000                   jge        0x7f75e83ecf26
00391 413b5108                       cmp        edx, dword ptr [r9 + 8]
00395 0f83573f0000                   jae        0x7f75e83f0e72
0039b 4863ca                         movsxd     rcx, edx
0039e 418b4c890c                     mov        ecx, dword ptr [r9 + rcx*4 + 0xc]
003a3 488bc1                         mov        rax, rcx
003a6 85ff                           test       edi, edi
003a8 48b9701472e0757f0000           movabs     rcx, 0x7f75e0721470
003b2 41b810020000                   mov        r8d, 0x210
003b8 7406                           je         0x7f75e83ecf40
003ba 41b820020000                   mov        r8d, 0x220
003c0 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003c4 4d8d6d01                       lea        r13, [r13 + 1]
003c8 4e892c01                       mov        qword ptr [rcx + r8], r13
003cc 0f8431000000                   je         0x7f75e83ecf83
003d2 498bcb                         mov        rcx, r11
003d5 2bce                           sub        ecx, esi
003d7 3bf9                           cmp        edi, ecx
003d9 48b9701472e0757f0000           movabs     rcx, 0x7f75e0721470
003e3 41b840020000                   mov        r8d, 0x240
003e9 7f06                           jg         0x7f75e83ecf71
003eb 41b830020000                   mov        r8d, 0x230
003f1 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003f5 4d8d6d01                       lea        r13, [r13 + 1]
003f9 4e892c01                       mov        qword ptr [rcx + r8], r13
003fd 0f8f363d0000                   jg         0x7f75e83f0cb9
00403 83f803                         cmp        eax, 3
00406 48b9701472e0757f0000           movabs     rcx, 0x7f75e0721470
00410 41b860020000                   mov        r8d, 0x260
00416 7e06                           jle        0x7f75e83ecf9e
00418 41b870020000                   mov        r8d, 0x270
0041e 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00422 4d8d6d01                       lea        r13, [r13 + 1]
00426 4e892c01                       mov        qword ptr [rcx + r8], r13
0042a 0f8e59000000                   jle        0x7f75e83ed009
00430 83e803                         sub        eax, 3
00433 837b0801                       cmp        dword ptr [rbx + 8], 1
00437 0f86cd3e0000                   jbe        0x7f75e83f0e8a
0043d 8b4b10                         mov        ecx, dword ptr [rbx + 0x10]
00440 837b0802                       cmp        dword ptr [rbx + 8], 2
00444 0f86d23e0000                   jbe        0x7f75e83f0e9c
0044a 894b14                         mov        dword ptr [rbx + 0x14], ecx
0044d 8b4b0c                         mov        ecx, dword ptr [rbx + 0xc]
00450 894b10                         mov        dword ptr [rbx + 0x10], ecx
00453 89430c                         mov        dword ptr [rbx + 0xc], eax
00456 48b9701472e0757f0000           movabs     rcx, 0x7f75e0721470
00460 ff8180020000                   inc        dword ptr [rcx + 0x280]
00466 89942444010000                 mov        dword ptr [rsp + 0x144], edx
0046d 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
00474 4c8bb42488010000               mov        r14, qword ptr [rsp + 0x188]
0047c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
00484 e952000000                     jmp        0x7f75e83ed05b
00489 89942444010000                 mov        dword ptr [rsp + 0x144], edx
00490 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
00497 49b8701472e0757f0000           movabs     r8, 0x7f75e0721470
004a1 4983809802000001               add        qword ptr [r8 + 0x298], 1
004a9 488bf3                         mov        rsi, rbx
004ac 488bd0                         mov        rdx, rax
004af 488bcf                         mov        rcx, rdi
004b2 0f1f440000                     nop        dword ptr [rax + rax]
004b7 e824385207                     call       0x7f75ef910860
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
004f0 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
004fa b9b8020000                     mov        ecx, 0x2b8
004ff 7d05                           jge        0x7f75e83ed086
00501 b9a8020000                     mov        ecx, 0x2a8
00506 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0050a 4d8d4001                       lea        r8, [r8 + 1]
0050e 4c89040a                       mov        qword ptr [rdx + rcx], r8
00512 0f8d15000000                   jge        0x7f75e83ed0ad
00518 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00520 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00528 e9ad000000                     jmp        0x7f75e83ed15a
0052d 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00535 4585ed                         test       r13d, r13d
00538 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
00542 b9c8020000                     mov        ecx, 0x2c8
00547 7505                           jne        0x7f75e83ed0ce
00549 b9d8020000                     mov        ecx, 0x2d8
0054e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
00552 4d8d4001                       lea        r8, [r8 + 1]
00556 4c89040a                       mov        qword ptr [rdx + rcx], r8
0055a 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00562 0f8568000000                   jne        0x7f75e83ed150
00568 498bd3                         mov        rdx, r11
0056b 03d7                           add        edx, edi
0056d 2bd0                           sub        edx, eax
0056f 4863d2                         movsxd     rdx, edx
00572 493bd0                         cmp        rdx, r8
00575 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
0057f b9e8020000                     mov        ecx, 0x2e8
00584 7c05                           jl         0x7f75e83ed10b
00586 b9f8020000                     mov        ecx, 0x2f8
0058b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0058f 4d8d4901                       lea        r9, [r9 + 1]
00593 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00597 0f8c3d000000                   jl         0x7f75e83ed15a
0059d 4c8b8c2450010000               mov        r9, qword ptr [rsp + 0x150]
005a5 4c3bcb                         cmp        r9, rbx
005a8 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
005b2 b918030000                     mov        ecx, 0x318
005b7 7c05                           jl         0x7f75e83ed13e
005b9 b908030000                     mov        ecx, 0x308
005be 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
005c2 4d8d4901                       lea        r9, [r9 + 1]
005c6 4c890c0a                       mov        qword ptr [rdx + rcx], r9
005ca 0f8c0a000000                   jl         0x7f75e83ed15a
005d0 ba00000000                     mov        edx, 0
005d5 e915000000                     jmp        0x7f75e83ed16f
005da 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
005e4 ff8228030000                   inc        dword ptr [rdx + 0x328]
005ea ba01000000                     mov        edx, 1
005ef 48899c2498010000               mov        qword ptr [rsp + 0x198], rbx
005f7 85c0                           test       eax, eax
005f9 48b9701472e0757f0000           movabs     rcx, 0x7f75e0721470
00603 41b940030000                   mov        r9d, 0x340
00609 7e06                           jle        0x7f75e83ed191
0060b 41b950030000                   mov        r9d, 0x350
00611 4a8b1c09                       mov        rbx, qword ptr [rcx + r9]
00615 488d5b01                       lea        rbx, [rbx + 1]
00619 4a891c09                       mov        qword ptr [rcx + r9], rbx
0061d 0f8e5f380000                   jle        0x7f75e83f0a02
00623 85d2                           test       edx, edx
00625 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
0062f b970030000                     mov        ecx, 0x370
00634 7505                           jne        0x7f75e83ed1bb
00636 b960030000                     mov        ecx, 0x360
0063b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0063f 4d8d4901                       lea        r9, [r9 + 1]
00643 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00647 0f8535380000                   jne        0x7f75e83f0a02
0064d 498bdb                         mov        rbx, r11
00650 03df                           add        ebx, edi
00652 899c24a0010000                 mov        dword ptr [rsp + 0x1a0], ebx
00659 488bf3                         mov        rsi, rbx
0065c 03b42478010000                 add        esi, dword ptr [rsp + 0x178]
00663 3bb42458010000                 cmp        esi, dword ptr [rsp + 0x158]
0066a 48be701472e0757f0000           movabs     rsi, 0x7f75e0721470
00674 ba28040000                     mov        edx, 0x428
00679 7f05                           jg         0x7f75e83ed200
0067b ba38040000                     mov        edx, 0x438
00680 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
00684 488d4901                       lea        rcx, [rcx + 1]
00688 48890c16                       mov        qword ptr [rsi + rdx], rcx
0068c 0f8f3f000000                   jg         0x7f75e83ed251
00692 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
00699 03f7                           add        esi, edi
0069b 89b424a4010000                 mov        dword ptr [rsp + 0x1a4], esi
006a2 3bb4245c010000                 cmp        esi, dword ptr [rsp + 0x15c]
006a9 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
006b3 b958040000                     mov        ecx, 0x458
006b8 7e05                           jle        0x7f75e83ed23f
006ba b948040000                     mov        ecx, 0x448
006bf 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
006c3 4d8d4901                       lea        r9, [r9 + 1]
006c7 4c890c0a                       mov        qword ptr [rdx + rcx], r9
006cb 0f8e76000000                   jle        0x7f75e83ed2c7
006d1 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
006d9 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
006e1 48be701472e0757f0000           movabs     rsi, 0x7f75e0721470
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
00727 e8b4355207                     call       0x7f75ef910860
0072c 0f1f840024080001               nop        dword ptr [rax + rax + 0x1000824]
00734 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
0073b 03b4247c010000                 add        esi, dword ptr [rsp + 0x17c]
00742 e9b9360000                     jmp        0x7f75e83f0980
00747 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
0074f 83ff10                         cmp        edi, 0x10
00752 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
0075c b968040000                     mov        ecx, 0x468
00761 7f05                           jg         0x7f75e83ed2e8
00763 b978040000                     mov        ecx, 0x478
00768 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0076c 4d8d4901                       lea        r9, [r9 + 1]
00770 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00774 0f8f8f0b0000                   jg         0x7f75e83ede89
0077a 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
00784 4883828804000001               add        qword ptr [rdx + 0x488], 1
0078c 48ba783a79e0757f0000           movabs     rdx, 0x7f75e0793a78
00796 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00799 83c102                         add        ecx, 2
0079c 894a70                         mov        dword ptr [rdx + 0x70], ecx
0079f 81e1feff1f00                   and        ecx, 0x1ffffe
007a5 85c9                           test       ecx, ecx
007a7 0f84813b0000                   je         0x7f75e83f0eae
007ad 48bac08f7ce200000000           movabs     rdx, 0xe27c8fc0
007b7 48b9783a79e0757f0000           movabs     rcx, 0x7f75e0793a78
007c1 488b12                         mov        rdx, qword ptr [rdx]
007c4 48c1ea2a                       shr        rdx, 0x2a
007c8 48c1e209                       shl        rdx, 9
007cc 41ba00000016                   mov        r10d, 0x16000000
007d2 4903d2                         add        rdx, r10
007d5 41ba16000000                   mov        r10d, 0x16
007db 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
007df 7435                           je         0x7f75e83ed396
007e1 4983c202                       add        r10, 2
007e5 4983fa1a                       cmp        r10, 0x1a
007e9 75f0                           jne        0x7f75e83ed35b
007eb 41ba16000000                   mov        r10d, 0x16
007f1 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
007f6 7412                           je         0x7f75e83ed38a
007f8 4983c202                       add        r10, 2
007fc 4983fa1a                       cmp        r10, 0x1a
00800 75ef                           jne        0x7f75e83ed371
00802 41ba15000000                   mov        r10d, 0x15
00808 eb10                           jmp        0x7f75e83ed39a
0080a 50                             push       rax
0080b 4833c0                         xor        rax, rax
0080e 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
00813 58                             pop        rax
00814 ebbf                           jmp        0x7f75e83ed355
00816 4983c201                       add        r10, 1
0081a 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0081f 48ba783a79e0757f0000           movabs     rdx, 0x7f75e0793a78
00829 488382d800000001               add        qword ptr [rdx + 0xd8], 1
00831 48baf82779e0757f0000           movabs     rdx, 0x7f75e07927f8
0083b 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0083e 83c102                         add        ecx, 2
00841 894a70                         mov        dword ptr [rdx + 0x70], ecx
00844 81e1feff1f00                   and        ecx, 0x1ffffe
0084a 85c9                           test       ecx, ecx
0084c 0f84fd3a0000                   je         0x7f75e83f0ecf
00852 448bac2490010000               mov        r13d, dword ptr [rsp + 0x190]
0085a 48baf82779e0757f0000           movabs     rdx, 0x7f75e07927f8
00864 4883820801000001               add        qword ptr [rdx + 0x108], 1
0086c 8b942464010000                 mov        edx, dword ptr [rsp + 0x164]
00873 83ea0f                         sub        edx, 0xf
00876 48b9c81e79e0757f0000           movabs     rcx, 0x7f75e0791ec8
00880 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00884 4183c102                       add        r9d, 2
00888 44894970                       mov        dword ptr [rcx + 0x70], r9d
0088c 4181e1feff1f00                 and        r9d, 0x1ffffe
00893 4585c9                         test       r9d, r9d
00896 0f84d43a0000                   je         0x7f75e83f0ef0
0089c 48b9c81e79e0757f0000           movabs     rcx, 0x7f75e0791ec8
008a6 488381a800000001               add        qword ptr [rcx + 0xa8], 1
008ae 48b90000000000000000           movabs     rcx, 0
008b8 b900000000                     mov        ecx, 0
008bd 443be9                         cmp        r13d, ecx
008c0 0f8ccb3a0000                   jl         0x7f75e83f0f11
008c6 443bea                         cmp        r13d, edx
008c9 0f8dcf3a0000                   jge        0x7f75e83f0f1e
008cf 498bd5                         mov        rdx, r13
008d2 89942494010000                 mov        dword ptr [rsp + 0x194], edx
008d9 48b9c08f7ce200000000           movabs     rcx, 0xe27c8fc0
008e3 4c8bc9                         mov        r9, rcx
008e6 49be783a79e0757f0000           movabs     r14, 0x7f75e0793a78
008f0 4d8b09                         mov        r9, qword ptr [r9]
008f3 49c1e92a                       shr        r9, 0x2a
008f7 49c1e109                       shl        r9, 9
008fb 41ba00000016                   mov        r10d, 0x16000000
00901 4d03ca                         add        r9, r10
00904 41ba24000000                   mov        r10d, 0x24
0090a 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
0090e 7435                           je         0x7f75e83ed4c5
00910 4983c202                       add        r10, 2
00914 4983fa28                       cmp        r10, 0x28
00918 75f0                           jne        0x7f75e83ed48a
0091a 41ba24000000                   mov        r10d, 0x24
00920 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
00925 7412                           je         0x7f75e83ed4b9
00927 4983c202                       add        r10, 2
0092b 4983fa28                       cmp        r10, 0x28
0092f 75ef                           jne        0x7f75e83ed4a0
00931 41ba23000000                   mov        r10d, 0x23
00937 eb10                           jmp        0x7f75e83ed4c9
00939 50                             push       rax
0093a 4833c0                         xor        rax, rax
0093d 4f0fb10cd6                     cmpxchg    qword ptr [r14 + r10*8], r9
00942 58                             pop        rax
00943 ebbf                           jmp        0x7f75e83ed484
00945 4983c201                       add        r10, 1
00949 4b8304d601                     add        qword ptr [r14 + r10*8], 1
0094e 48bac81f79e0757f0000           movabs     rdx, 0x7f75e0791fc8
00958 448b4a70                       mov        r9d, dword ptr [rdx + 0x70]
0095c 4183c102                       add        r9d, 2
00960 44894a70                       mov        dword ptr [rdx + 0x70], r9d
00964 4181e1feff1f00                 and        r9d, 0x1ffffe
0096b 4585c9                         test       r9d, r9d
0096e 0f84373a0000                   je         0x7f75e83f0f2b
00974 48bac81f79e0757f0000           movabs     rdx, 0x7f75e0791fc8
0097e 488382a800000001               add        qword ptr [rdx + 0xa8], 1
00986 48baf02079e0757f0000           movabs     rdx, 0x7f75e07920f0
00990 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00993 83c102                         add        ecx, 2
00996 894a70                         mov        dword ptr [rdx + 0x70], ecx
00999 81e1feff1f00                   and        ecx, 0x1ffffe
0099f 85c9                           test       ecx, ecx
009a1 0f84253a0000                   je         0x7f75e83f0f4c
009a7 48baf02079e0757f0000           movabs     rdx, 0x7f75e07920f0
009b1 ff82b8000000                   inc        dword ptr [rdx + 0xb8]
009b7 8b942494010000                 mov        edx, dword ptr [rsp + 0x194]
009be 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
009c5 4489ac2490010000               mov        dword ptr [rsp + 0x190], r13d
009cd 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
009d5 488b9c2468010000               mov        rbx, qword ptr [rsp + 0x168]
009dd 48b9a8607ee200000000           movabs     rcx, 0xe27e60a8
009e7 4c8bc9                         mov        r9, rcx
009ea 48b8783a79e0757f0000           movabs     rax, 0x7f75e0793a78
009f4 49b90000151600000000           movabs     r9, 0x16150000
009fe 41ba2a000000                   mov        r10d, 0x2a
00a04 4e3b0cd0                       cmp        r9, qword ptr [rax + r10*8]
00a08 743b                           je         0x7f75e83ed5c5
00a0a 4983c202                       add        r10, 2
00a0e 4983fa2e                       cmp        r10, 0x2e
00a12 75f0                           jne        0x7f75e83ed584
00a14 41ba2a000000                   mov        r10d, 0x2a
00a1a 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
00a1f 7412                           je         0x7f75e83ed5b3
00a21 4983c202                       add        r10, 2
00a25 4983fa2e                       cmp        r10, 0x2e
00a29 75ef                           jne        0x7f75e83ed59a
00a2b 41ba29000000                   mov        r10d, 0x29
00a31 eb16                           jmp        0x7f75e83ed5c9
00a33 53                             push       rbx
00a34 488bd8                         mov        rbx, rax
00a37 4833c0                         xor        rax, rax
00a3a 4e0fb10cd3                     cmpxchg    qword ptr [rbx + r10*8], r9
00a3f 488bc3                         mov        rax, rbx
00a42 5b                             pop        rbx
00a43 ebb9                           jmp        0x7f75e83ed57e
00a45 4983c201                       add        r10, 1
00a49 4a8304d001                     add        qword ptr [rax + r10*8], 1
00a4e 49b9403c79e0757f0000           movabs     r9, 0x7f75e0793c40
00a58 418b4170                       mov        eax, dword ptr [r9 + 0x70]
00a5c 83c002                         add        eax, 2
00a5f 41894170                       mov        dword ptr [r9 + 0x70], eax
00a63 25feff1f00                     and        eax, 0x1ffffe
00a68 85c0                           test       eax, eax
00a6a 0f847d390000                   je         0x7f75e83f0f6d
00a70 4c8bc9                         mov        r9, rcx
00a73 48b8403c79e0757f0000           movabs     rax, 0x7f75e0793c40
00a7d 488380a800000001               add        qword ptr [rax + 0xa8], 1
00a85 49b9203d79e0757f0000           movabs     r9, 0x7f75e0793d20
00a8f 418b4170                       mov        eax, dword ptr [r9 + 0x70]
00a93 83c002                         add        eax, 2
00a96 41894170                       mov        dword ptr [r9 + 0x70], eax
00a9a 25feff1f00                     and        eax, 0x1ffffe
00a9f 85c0                           test       eax, eax
00aa1 0f8467390000                   je         0x7f75e83f0f8e
00aa7 49b9203d79e0757f0000           movabs     r9, 0x7f75e0793d20
00ab1 48b90000151600000000           movabs     rcx, 0x16150000
00abb 41ba16000000                   mov        r10d, 0x16
00ac1 4b3b0cd1                       cmp        rcx, qword ptr [r9 + r10*8]
00ac5 7435                           je         0x7f75e83ed67c
00ac7 4983c202                       add        r10, 2
00acb 4983fa1a                       cmp        r10, 0x1a
00acf 75f0                           jne        0x7f75e83ed641
00ad1 41ba16000000                   mov        r10d, 0x16
00ad7 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
00adc 7412                           je         0x7f75e83ed670
00ade 4983c202                       add        r10, 2
00ae2 4983fa1a                       cmp        r10, 0x1a
00ae6 75ef                           jne        0x7f75e83ed657
00ae8 41ba15000000                   mov        r10d, 0x15
00aee eb10                           jmp        0x7f75e83ed680
00af0 50                             push       rax
00af1 4833c0                         xor        rax, rax
00af4 4b0fb10cd1                     cmpxchg    qword ptr [r9 + r10*8], rcx
00af9 58                             pop        rax
00afa ebbf                           jmp        0x7f75e83ed63b
00afc 4983c201                       add        r10, 1
00b00 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00b05 48b9702979e0757f0000           movabs     rcx, 0x7f75e0792970
00b0f 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00b13 4183c102                       add        r9d, 2
00b17 44894970                       mov        dword ptr [rcx + 0x70], r9d
00b1b 4181e1feff1f00                 and        r9d, 0x1ffffe
00b22 4585c9                         test       r9d, r9d
00b25 0f8404390000                   je         0x7f75e83f0faf
00b2b 48b9c08f7ce200000000           movabs     rcx, 0xe27c8fc0
00b35 4c8bc9                         mov        r9, rcx
00b38 48b8203d79e0757f0000           movabs     rax, 0x7f75e0793d20
00b42 4d8b09                         mov        r9, qword ptr [r9]
00b45 49c1e92a                       shr        r9, 0x2a
00b49 49c1e109                       shl        r9, 9
00b4d 41ba00000016                   mov        r10d, 0x16000000
00b53 4d03ca                         add        r9, r10
00b56 41ba1c000000                   mov        r10d, 0x1c
00b5c 4e3b0cd0                       cmp        r9, qword ptr [rax + r10*8]
00b60 743b                           je         0x7f75e83ed71d
00b62 4983c202                       add        r10, 2
00b66 4983fa20                       cmp        r10, 0x20
00b6a 75f0                           jne        0x7f75e83ed6dc
00b6c 41ba1c000000                   mov        r10d, 0x1c
00b72 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
00b77 7412                           je         0x7f75e83ed70b
00b79 4983c202                       add        r10, 2
00b7d 4983fa20                       cmp        r10, 0x20
00b81 75ef                           jne        0x7f75e83ed6f2
00b83 41ba1b000000                   mov        r10d, 0x1b
00b89 eb16                           jmp        0x7f75e83ed721
00b8b 53                             push       rbx
00b8c 488bd8                         mov        rbx, rax
00b8f 4833c0                         xor        rax, rax
00b92 4e0fb10cd3                     cmpxchg    qword ptr [rbx + r10*8], r9
00b97 488bc3                         mov        rax, rbx
00b9a 5b                             pop        rbx
00b9b ebb9                           jmp        0x7f75e83ed6d6
00b9d 4983c201                       add        r10, 1
00ba1 4a8304d001                     add        qword ptr [rax + r10*8], 1
00ba6 49b9203d79e0757f0000           movabs     r9, 0x7f75e0793d20
00bb0 488b09                         mov        rcx, qword ptr [rcx]
00bb3 48c1e92a                       shr        rcx, 0x2a
00bb7 48c1e109                       shl        rcx, 9
00bbb 41ba00000016                   mov        r10d, 0x16000000
00bc1 4903ca                         add        rcx, r10
00bc4 41ba22000000                   mov        r10d, 0x22
00bca 4b3b0cd1                       cmp        rcx, qword ptr [r9 + r10*8]
00bce 7435                           je         0x7f75e83ed785
00bd0 4983c202                       add        r10, 2
00bd4 4983fa26                       cmp        r10, 0x26
00bd8 75f0                           jne        0x7f75e83ed74a
00bda 41ba22000000                   mov        r10d, 0x22
00be0 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
00be5 7412                           je         0x7f75e83ed779
00be7 4983c202                       add        r10, 2
00beb 4983fa26                       cmp        r10, 0x26
00bef 75ef                           jne        0x7f75e83ed760
00bf1 41ba21000000                   mov        r10d, 0x21
00bf7 eb10                           jmp        0x7f75e83ed789
00bf9 50                             push       rax
00bfa 4833c0                         xor        rax, rax
00bfd 4b0fb10cd1                     cmpxchg    qword ptr [r9 + r10*8], rcx
00c02 58                             pop        rax
00c03 ebbf                           jmp        0x7f75e83ed744
00c05 4983c201                       add        r10, 1
00c09 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00c0e 48b9203d79e0757f0000           movabs     rcx, 0x7f75e0793d20
00c18 4883813801000001               add        qword ptr [rcx + 0x138], 1
00c20 48b9302a79e0757f0000           movabs     rcx, 0x7f75e0792a30
00c2a 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00c2e 4183c102                       add        r9d, 2
00c32 44894970                       mov        dword ptr [rcx + 0x70], r9d
00c36 4181e1feff1f00                 and        r9d, 0x1ffffe
00c3d 4585c9                         test       r9d, r9d
00c40 0f840a380000                   je         0x7f75e83f0fd0
00c46 48b9203d79e0757f0000           movabs     rcx, 0x7f75e0793d20
00c50 4883814801000001               add        qword ptr [rcx + 0x148], 1
00c58 4863c2                         movsxd     rax, edx
00c5b ba0c000000                     mov        edx, 0xc
00c60 4c8bc8                         mov        r9, rax
00c63 4c03ca                         add        r9, rdx
00c66 48ba100579e0757f0000           movabs     rdx, 0x7f75e0790510
00c70 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00c73 83c102                         add        ecx, 2
00c76 894a70                         mov        dword ptr [rdx + 0x70], ecx
00c79 81e1feff1f00                   and        ecx, 0x1ffffe
00c7f 85c9                           test       ecx, ecx
00c81 0f84ea370000                   je         0x7f75e83f0ff1
00c87 48ba100579e0757f0000           movabs     rdx, 0x7f75e0790510
00c91 488382d800000001               add        qword ptr [rdx + 0xd8], 1
00c99 48ba880679e0757f0000           movabs     rdx, 0x7f75e0790688
00ca3 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00ca6 83c102                         add        ecx, 2
00ca9 894a70                         mov        dword ptr [rdx + 0x70], ecx
00cac 81e1feff1f00                   and        ecx, 0x1ffffe
00cb2 85c9                           test       ecx, ecx
00cb4 0f84d8370000                   je         0x7f75e83f1012
00cba 48ba203d79e0757f0000           movabs     rdx, 0x7f75e0793d20
00cc4 488d9258010000                 lea        rdx, [rdx + 0x158]
00ccb 48b9785b7fe200000000           movabs     rcx, 0xe27f5b78
00cd5 48b90058151600000000           movabs     rcx, 0x16155800
00cdf 4c8bd1                         mov        r10, rcx
00ce2 48330a                         xor        rcx, qword ptr [rdx]
00ce5 48f7c1fcffffff                 test       rcx, -4
00cec 7426                           je         0x7f75e83ed894
00cee f6c102                         test       cl, 2
00cf1 7521                           jne        0x7f75e83ed894
00cf3 48f702feffffff                 test       qword ptr [rdx], -2
00cfa 7415                           je         0x7f75e83ed891
00cfc 498bca                         mov        rcx, r10
00cff 48330a                         xor        rcx, qword ptr [rdx]
00d02 48f7c1fcffffff                 test       rcx, -4
00d09 7409                           je         0x7f75e83ed894
00d0b 48830a02                       or         qword ptr [rdx], 2
00d0f eb03                           jmp        0x7f75e83ed894
00d11 48890a                         mov        qword ptr [rdx], rcx
00d14 48ba203d79e0757f0000           movabs     rdx, 0x7f75e0793d20
00d1e 4883826801000001               add        qword ptr [rdx + 0x168], 1
00d26 48be08907ce200000000           movabs     rsi, 0xe27c9008
00d30 ba02000000                     mov        edx, 2
00d35 b910000000                     mov        ecx, 0x10
00d3a 4c8bc3                         mov        r8, rbx
00d3d bf00000000                     mov        edi, 0
00d42 48891c24                       mov        qword ptr [rsp], rbx
00d46 4889442408                     mov        qword ptr [rsp + 8], rax
00d4b 49bac08f7ce200000000           movabs     r10, 0xe27c8fc0
00d55 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00d5a 49ba785b7fe200000000           movabs     r10, 0xe27f5b78
00d64 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d69 660f1f440000                   nop        word ptr [rax + rax]
00d6f e86c2f5207                     call       0x7f75ef910860
00d74 0f1f84006c0e0002               nop        dword ptr [rax + rax + 0x2000e6c]
00d7c 4885c0                         test       rax, rax
00d7f 48bb203d79e0757f0000           movabs     rbx, 0x7f75e0793d20
00d89 750c                           jne        0x7f75e83ed917
00d8b 808b7101000001                 or         byte ptr [rbx + 0x171], 1
00d92 e98b000000                     jmp        0x7f75e83ed9a2
00d97 488b38                         mov        rdi, qword ptr [rax]
00d9a 48c1ef2a                       shr        rdi, 0x2a
00d9e 48c1e709                       shl        rdi, 9
00da2 41ba00000016                   mov        r10d, 0x16000000
00da8 4903fa                         add        rdi, r10
00dab 41ba30000000                   mov        r10d, 0x30
00db1 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
00db5 7435                           je         0x7f75e83ed96c
00db7 4983c202                       add        r10, 2
00dbb 4983fa34                       cmp        r10, 0x34
00dbf 75f0                           jne        0x7f75e83ed931
00dc1 41ba30000000                   mov        r10d, 0x30
00dc7 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00dcc 7412                           je         0x7f75e83ed960
00dce 4983c202                       add        r10, 2
00dd2 4983fa34                       cmp        r10, 0x34
00dd6 75ef                           jne        0x7f75e83ed947
00dd8 41ba2f000000                   mov        r10d, 0x2f
00dde eb10                           jmp        0x7f75e83ed970
00de0 50                             push       rax
00de1 4833c0                         xor        rax, rax
00de4 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
00de9 58                             pop        rax
00dea ebbf                           jmp        0x7f75e83ed92b
00dec 4983c201                       add        r10, 1
00df0 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00df5 48bf0006141600000000           movabs     rdi, 0x16140600
00dff 488b18                         mov        rbx, qword ptr [rax]
00e02 48c1eb2a                       shr        rbx, 0x2a
00e06 48c1e309                       shl        rbx, 9
00e0a 41ba00000016                   mov        r10d, 0x16000000
00e10 4903da                         add        rbx, r10
00e13 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
00e17 0f8596360000                   jne        0x7f75e83f1033
00e1d e900000000                     jmp        0x7f75e83ed9a2
00e22 488bf8                         mov        rdi, rax
00e25 4889bc24b0010000               mov        qword ptr [rsp + 0x1b0], rdi
00e2d 483b07                         cmp        rax, qword ptr [rdi]
00e30 488bf7                         mov        rsi, rdi
00e33 48bb701472e0757f0000           movabs     rbx, 0x7f75e0721470
00e3d 488b36                         mov        rsi, qword ptr [rsi]
00e40 48c1ee2a                       shr        rsi, 0x2a
00e44 48c1e609                       shl        rsi, 9
00e48 41ba00000016                   mov        r10d, 0x16000000
00e4e 4903f2                         add        rsi, r10
00e51 41ba94000000                   mov        r10d, 0x94
00e57 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00e5b 743b                           je         0x7f75e83eda18
00e5d 4983c202                       add        r10, 2
00e61 4981fa98000000                 cmp        r10, 0x98
00e68 75ed                           jne        0x7f75e83ed9d7
00e6a 41ba94000000                   mov        r10d, 0x94
00e70 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00e75 7415                           je         0x7f75e83eda0c
00e77 4983c202                       add        r10, 2
00e7b 4981fa98000000                 cmp        r10, 0x98
00e82 75ec                           jne        0x7f75e83ed9f0
00e84 41ba93000000                   mov        r10d, 0x93
00e8a eb10                           jmp        0x7f75e83eda1c
00e8c 50                             push       rax
00e8d 4833c0                         xor        rax, rax
00e90 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
00e95 58                             pop        rax
00e96 ebb9                           jmp        0x7f75e83ed9d1
00e98 4983c201                       add        r10, 1
00e9c 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00ea1 48bee84079e0757f0000           movabs     rsi, 0x7f75e07940e8
00eab 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
00eae 83c302                         add        ebx, 2
00eb1 895e70                         mov        dword ptr [rsi + 0x70], ebx
00eb4 81e3feff1f00                   and        ebx, 0x1ffffe
00eba 85db                           test       ebx, ebx
00ebc 0f84ff350000                   je         0x7f75e83f1041
00ec2 488bf7                         mov        rsi, rdi
00ec5 48bbe84079e0757f0000           movabs     rbx, 0x7f75e07940e8
00ecf 488b36                         mov        rsi, qword ptr [rsi]
00ed2 48c1ee2a                       shr        rsi, 0x2a
00ed6 48c1e609                       shl        rsi, 9
00eda 41ba00000016                   mov        r10d, 0x16000000
00ee0 4903f2                         add        rsi, r10
00ee3 41ba16000000                   mov        r10d, 0x16
00ee9 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00eed 7435                           je         0x7f75e83edaa4
00eef 4983c202                       add        r10, 2
00ef3 4983fa1a                       cmp        r10, 0x1a
00ef7 75f0                           jne        0x7f75e83eda69
00ef9 41ba16000000                   mov        r10d, 0x16
00eff 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00f04 7412                           je         0x7f75e83eda98
00f06 4983c202                       add        r10, 2
00f0a 4983fa1a                       cmp        r10, 0x1a
00f0e 75ef                           jne        0x7f75e83eda7f
00f10 41ba15000000                   mov        r10d, 0x15
00f16 eb10                           jmp        0x7f75e83edaa8
00f18 50                             push       rax
00f19 4833c0                         xor        rax, rax
00f1c 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
00f21 58                             pop        rax
00f22 ebbf                           jmp        0x7f75e83eda63
00f24 4983c201                       add        r10, 1
00f28 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00f2d 488bf7                         mov        rsi, rdi
00f30 0f1f440000                     nop        dword ptr [rax + rax]
00f35 48b8b09439c0757f0000           movabs     rax, 0x7f75c03994b0
00f3f e89c285207                     call       0x7f75ef910360
00f44 0f1f84003c100003               nop        dword ptr [rax + rax + 0x300103c]
00f4c 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
00f54 8b7708                         mov        esi, dword ptr [rdi + 8]
00f57 48bbe84079e0757f0000           movabs     rbx, 0x7f75e07940e8
00f61 488383d800000001               add        qword ptr [rbx + 0xd8], 1
00f69 48bbf82779e0757f0000           movabs     rbx, 0x7f75e07927f8
00f73 8b5370                         mov        edx, dword ptr [rbx + 0x70]
00f76 83c202                         add        edx, 2
00f79 895370                         mov        dword ptr [rbx + 0x70], edx
00f7c 81e2feff1f00                   and        edx, 0x1ffffe
00f82 85d2                           test       edx, edx
00f84 0f845d350000                   je         0x7f75e83f1067
00f8a 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
00f92 48bbf82779e0757f0000           movabs     rbx, 0x7f75e07927f8
00f9c 4883830801000001               add        qword ptr [rbx + 0x108], 1
00fa4 ffc8                           dec        eax
00fa6 2bf0                           sub        esi, eax
00fa8 48bbc81e79e0757f0000           movabs     rbx, 0x7f75e0791ec8
00fb2 8b4370                         mov        eax, dword ptr [rbx + 0x70]
00fb5 83c002                         add        eax, 2
00fb8 894370                         mov        dword ptr [rbx + 0x70], eax
00fbb 25feff1f00                     and        eax, 0x1ffffe
00fc0 85c0                           test       eax, eax
00fc2 0f8440350000                   je         0x7f75e83f1088
00fc8 48bbc81e79e0757f0000           movabs     rbx, 0x7f75e0791ec8
00fd2 488383a800000001               add        qword ptr [rbx + 0xa8], 1
00fda 48bb0000000000000000           movabs     rbx, 0
00fe4 bb00000000                     mov        ebx, 0
00fe9 443bdb                         cmp        r11d, ebx
00fec 0f8c37350000                   jl         0x7f75e83f10a9
00ff2 443bde                         cmp        r11d, esi
00ff5 0f8d3b350000                   jge        0x7f75e83f10b6
00ffb 498bdb                         mov        rbx, r11
00ffe 899c24ac010000                 mov        dword ptr [rsp + 0x1ac], ebx
01005 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
0100d 488bbc24b0010000               mov        rdi, qword ptr [rsp + 0x1b0]
01015 488bf7                         mov        rsi, rdi
01018 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
01022 488b36                         mov        rsi, qword ptr [rsi]
01025 48c1ee2a                       shr        rsi, 0x2a
01029 48c1e609                       shl        rsi, 9
0102d 41ba00000016                   mov        r10d, 0x16000000
01033 4903f2                         add        rsi, r10
01036 41ba1e000000                   mov        r10d, 0x1e
0103c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01040 7435                           je         0x7f75e83edbf7
01042 4983c202                       add        r10, 2
01046 4983fa22                       cmp        r10, 0x22
0104a 75f0                           jne        0x7f75e83edbbc
0104c 41ba1e000000                   mov        r10d, 0x1e
01052 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01057 7412                           je         0x7f75e83edbeb
01059 4983c202                       add        r10, 2
0105d 4983fa22                       cmp        r10, 0x22
01061 75ef                           jne        0x7f75e83edbd2
01063 41ba1d000000                   mov        r10d, 0x1d
01069 eb10                           jmp        0x7f75e83edbfb
0106b 50                             push       rax
0106c 4833c0                         xor        rax, rax
0106f 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
01074 58                             pop        rax
01075 ebbf                           jmp        0x7f75e83edbb6
01077 4983c201                       add        r10, 1
0107b 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01080 488bf7                         mov        rsi, rdi
01083 6690                           nop        
01085 48b8d89439c0757f0000           movabs     rax, 0x7f75c03994d8
0108f e84c275207                     call       0x7f75ef910360
01094 0f1f84008c110004               nop        dword ptr [rax + rax + 0x400118c]
0109c 483b00                         cmp        rax, qword ptr [rax]
0109f 488bf0                         mov        rsi, rax
010a2 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
010ac 488b36                         mov        rsi, qword ptr [rsi]
010af 48c1ee2a                       shr        rsi, 0x2a
010b3 48c1e609                       shl        rsi, 9
010b7 41ba00000016                   mov        r10d, 0x16000000
010bd 4903f2                         add        rsi, r10
010c0 41ba24000000                   mov        r10d, 0x24
010c6 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
010ca 7435                           je         0x7f75e83edc81
010cc 4983c202                       add        r10, 2
010d0 4983fa28                       cmp        r10, 0x28
010d4 75f0                           jne        0x7f75e83edc46
010d6 41ba24000000                   mov        r10d, 0x24
010dc 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
010e1 7412                           je         0x7f75e83edc75
010e3 4983c202                       add        r10, 2
010e7 4983fa28                       cmp        r10, 0x28
010eb 75ef                           jne        0x7f75e83edc5c
010ed 41ba23000000                   mov        r10d, 0x23
010f3 eb10                           jmp        0x7f75e83edc85
010f5 50                             push       rax
010f6 4833c0                         xor        rax, rax
010f9 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
010fe 58                             pop        rax
010ff ebbf                           jmp        0x7f75e83edc40
01101 4983c201                       add        r10, 1
01105 4a8304d201                     add        qword ptr [rdx + r10*8], 1
0110a 8b7028                         mov        esi, dword ptr [rax + 0x28]
0110d 488bd0                         mov        rdx, rax
01110 48b9e84079e0757f0000           movabs     rcx, 0x7f75e07940e8
0111a 488b12                         mov        rdx, qword ptr [rdx]
0111d 48c1ea2a                       shr        rdx, 0x2a
01121 48c1e209                       shl        rdx, 9
01125 41ba00000016                   mov        r10d, 0x16000000
0112b 4903d2                         add        rdx, r10
0112e 41ba2a000000                   mov        r10d, 0x2a
01134 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01138 7435                           je         0x7f75e83edcef
0113a 4983c202                       add        r10, 2
0113e 4983fa2e                       cmp        r10, 0x2e
01142 75f0                           jne        0x7f75e83edcb4
01144 41ba2a000000                   mov        r10d, 0x2a
0114a 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0114f 7412                           je         0x7f75e83edce3
01151 4983c202                       add        r10, 2
01155 4983fa2e                       cmp        r10, 0x2e
01159 75ef                           jne        0x7f75e83edcca
0115b 41ba29000000                   mov        r10d, 0x29
01161 eb10                           jmp        0x7f75e83edcf3
01163 50                             push       rax
01164 4833c0                         xor        rax, rax
01167 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
0116c 58                             pop        rax
0116d ebbf                           jmp        0x7f75e83edcae
0116f 4983c201                       add        r10, 1
01173 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01178 8b4808                         mov        ecx, dword ptr [rax + 8]
0117b 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
01185 4883827801000001               add        qword ptr [rdx + 0x178], 1
0118d 48ba302a79e0757f0000           movabs     rdx, 0x7f75e0792a30
01197 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
0119b 4183c002                       add        r8d, 2
0119f 44894270                       mov        dword ptr [rdx + 0x70], r8d
011a3 4181e0feff1f00                 and        r8d, 0x1ffffe
011aa 4585c0                         test       r8d, r8d
011ad 0f8495330000                   je         0x7f75e83f10c8
011b3 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
011bd 4883828801000001               add        qword ptr [rdx + 0x188], 1
011c5 8b9c24ac010000                 mov        ebx, dword ptr [rsp + 0x1ac]
011cc 4863db                         movsxd     rbx, ebx
011cf ba0c000000                     mov        edx, 0xc
011d4 4c8bcb                         mov        r9, rbx
011d7 4c03ca                         add        r9, rdx
011da 48ba100579e0757f0000           movabs     rdx, 0x7f75e0790510
011e4 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
011e8 4183c002                       add        r8d, 2
011ec 44894270                       mov        dword ptr [rdx + 0x70], r8d
011f0 4181e0feff1f00                 and        r8d, 0x1ffffe
011f7 4585c0                         test       r8d, r8d
011fa 0f8469330000                   je         0x7f75e83f10e9
01200 48ba100579e0757f0000           movabs     rdx, 0x7f75e0790510
0120a 488382d800000001               add        qword ptr [rdx + 0xd8], 1
01212 48ba880679e0757f0000           movabs     rdx, 0x7f75e0790688
0121c 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01220 4183c002                       add        r8d, 2
01224 44894270                       mov        dword ptr [rdx + 0x70], r8d
01228 4181e0feff1f00                 and        r8d, 0x1ffffe
0122f 4585c0                         test       r8d, r8d
01232 0f8452330000                   je         0x7f75e83f110a
01238 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
01242 488d9298010000                 lea        rdx, [rdx + 0x198]
01249 49b8203c81e200000000           movabs     r8, 0xe2813c20
01253 49b80068151600000000           movabs     r8, 0x16156800
0125d 4d8bd0                         mov        r10, r8
01260 4c3302                         xor        r8, qword ptr [rdx]
01263 49f7c0fcffffff                 test       r8, -4
0126a 7427                           je         0x7f75e83ede13
0126c 41f6c002                       test       r8b, 2
01270 7521                           jne        0x7f75e83ede13
01272 48f702feffffff                 test       qword ptr [rdx], -2
01279 7415                           je         0x7f75e83ede10
0127b 4d8bc2                         mov        r8, r10
0127e 4c3302                         xor        r8, qword ptr [rdx]
01281 49f7c0fcffffff                 test       r8, -4
01288 7409                           je         0x7f75e83ede13
0128a 48830a02                       or         qword ptr [rdx], 2
0128e eb03                           jmp        0x7f75e83ede13
01290 4c8902                         mov        qword ptr [rdx], r8
01293 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
0129d 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
012a5 ba02000000                     mov        edx, 2
012aa 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
012b2 bf00000000                     mov        edi, 0
012b7 488b8424b0010000               mov        rax, qword ptr [rsp + 0x1b0]
012bf 48890424                       mov        qword ptr [rsp], rax
012c3 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
012cb 4889442408                     mov        qword ptr [rsp + 8], rax
012d0 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
012d5 49ba203c81e200000000           movabs     r10, 0xe2813c20
012df 4c89542418                     mov        qword ptr [rsp + 0x18], r10
012e4 666690                         nop        
012e7 e8f4295207                     call       0x7f75ef910860
012ec 0f1f8400e4130005               nop        dword ptr [rax + rax + 0x50013e4]
012f4 48be701472e0757f0000           movabs     rsi, 0x7f75e0721470
012fe ff86c8040000                   inc        dword ptr [rsi + 0x4c8]
01304 e91d0d0000                     jmp        0x7f75e83eeba6
01309 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
01310 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
01318 83ff30                         cmp        edi, 0x30
0131b 48be701472e0757f0000           movabs     rsi, 0x7f75e0721470
01325 bae0040000                     mov        edx, 0x4e0
0132a 7f05                           jg         0x7f75e83edeb1
0132c baf0040000                     mov        edx, 0x4f0
01331 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
01335 488d4901                       lea        rcx, [rcx + 1]
01339 48890c16                       mov        qword ptr [rsi + rdx], rcx
0133d 0f8f3e0c0000                   jg         0x7f75e83eeb01
01343 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
0134a 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
01352 660f1f440000                   nop        word ptr [rax + rax]
01358 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
01360 8b842464010000                 mov        eax, dword ptr [rsp + 0x164]
01367 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
0136f 48b9701472e0757f0000           movabs     rcx, 0x7f75e0721470
01379 4883810005000001               add        qword ptr [rcx + 0x500], 1
01381 48b9783a79e0757f0000           movabs     rcx, 0x7f75e0793a78
0138b 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
0138f 4183c002                       add        r8d, 2
01393 44894170                       mov        dword ptr [rcx + 0x70], r8d
01397 4181e0feff1f00                 and        r8d, 0x1ffffe
0139e 4585c0                         test       r8d, r8d
013a1 0f8404320000                   je         0x7f75e83f112b
013a7 48b9c08f7ce200000000           movabs     rcx, 0xe27c8fc0
013b1 49b8783a79e0757f0000           movabs     r8, 0x7f75e0793a78
013bb 488b09                         mov        rcx, qword ptr [rcx]
013be 48c1e92a                       shr        rcx, 0x2a
013c2 48c1e109                       shl        rcx, 9
013c6 41ba00000016                   mov        r10d, 0x16000000
013cc 4903ca                         add        rcx, r10
013cf 41ba16000000                   mov        r10d, 0x16
013d5 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
013d9 7435                           je         0x7f75e83edf90
013db 4983c202                       add        r10, 2
013df 4983fa1a                       cmp        r10, 0x1a
013e3 75f0                           jne        0x7f75e83edf55
013e5 41ba16000000                   mov        r10d, 0x16
013eb 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
013f0 7412                           je         0x7f75e83edf84
013f2 4983c202                       add        r10, 2
013f6 4983fa1a                       cmp        r10, 0x1a
013fa 75ef                           jne        0x7f75e83edf6b
013fc 41ba15000000                   mov        r10d, 0x15
01402 eb10                           jmp        0x7f75e83edf94
01404 50                             push       rax
01405 4833c0                         xor        rax, rax
01408 4b0fb10cd0                     cmpxchg    qword ptr [r8 + r10*8], rcx
0140d 58                             pop        rax
0140e ebbf                           jmp        0x7f75e83edf4f
01410 4983c201                       add        r10, 1
01414 4b8304d001                     add        qword ptr [r8 + r10*8], 1
01419 48b9783a79e0757f0000           movabs     rcx, 0x7f75e0793a78
01423 488381d800000001               add        qword ptr [rcx + 0xd8], 1
0142b 48b9f82779e0757f0000           movabs     rcx, 0x7f75e07927f8
01435 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
01439 4183c002                       add        r8d, 2
0143d 44894170                       mov        dword ptr [rcx + 0x70], r8d
01441 4181e0feff1f00                 and        r8d, 0x1ffffe
01448 4585c0                         test       r8d, r8d
0144b 0f847b310000                   je         0x7f75e83f114c
01451 48b9f82779e0757f0000           movabs     rcx, 0x7f75e07927f8
0145b 4883810801000001               add        qword ptr [rcx + 0x108], 1
01463 488bc8                         mov        rcx, rax
01466 83e90f                         sub        ecx, 0xf
01469 49b8c81e79e0757f0000           movabs     r8, 0x7f75e0791ec8
01473 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
01477 4183c102                       add        r9d, 2
0147b 45894870                       mov        dword ptr [r8 + 0x70], r9d
0147f 4181e1feff1f00                 and        r9d, 0x1ffffe
01486 4585c9                         test       r9d, r9d
01489 0f845e310000                   je         0x7f75e83f116d
0148f 49b8c81e79e0757f0000           movabs     r8, 0x7f75e0791ec8
01499 498380a800000001               add        qword ptr [r8 + 0xa8], 1
014a1 49b80000000000000000           movabs     r8, 0
014ab 41b800000000                   mov        r8d, 0
014b1 413bf0                         cmp        esi, r8d
014b4 0f8c54310000                   jl         0x7f75e83f118e
014ba 3bf1                           cmp        esi, ecx
014bc 0f8d59310000                   jge        0x7f75e83f119b
014c2 488bce                         mov        rcx, rsi
014c5 898c24b8010000                 mov        dword ptr [rsp + 0x1b8], ecx
014cc 49b8c08f7ce200000000           movabs     r8, 0xe27c8fc0
014d6 4d8bc8                         mov        r9, r8
014d9 49be783a79e0757f0000           movabs     r14, 0x7f75e0793a78
014e3 4d8b09                         mov        r9, qword ptr [r9]
014e6 49c1e92a                       shr        r9, 0x2a
014ea 49c1e109                       shl        r9, 9
014ee 41ba00000016                   mov        r10d, 0x16000000
014f4 4d03ca                         add        r9, r10
014f7 41ba24000000                   mov        r10d, 0x24
014fd 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
01501 7435                           je         0x7f75e83ee0b8
01503 4983c202                       add        r10, 2
01507 4983fa28                       cmp        r10, 0x28
0150b 75f0                           jne        0x7f75e83ee07d
0150d 41ba24000000                   mov        r10d, 0x24
01513 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
01518 7412                           je         0x7f75e83ee0ac
0151a 4983c202                       add        r10, 2
0151e 4983fa28                       cmp        r10, 0x28
01522 75ef                           jne        0x7f75e83ee093
01524 41ba23000000                   mov        r10d, 0x23
0152a eb10                           jmp        0x7f75e83ee0bc
0152c 50                             push       rax
0152d 4833c0                         xor        rax, rax
01530 4f0fb10cd6                     cmpxchg    qword ptr [r14 + r10*8], r9
01535 58                             pop        rax
01536 ebbf                           jmp        0x7f75e83ee077
01538 4983c201                       add        r10, 1
0153c 4b8304d601                     add        qword ptr [r14 + r10*8], 1
01541 48b9c81f79e0757f0000           movabs     rcx, 0x7f75e0791fc8
0154b 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
0154f 4183c102                       add        r9d, 2
01553 44894970                       mov        dword ptr [rcx + 0x70], r9d
01557 4181e1feff1f00                 and        r9d, 0x1ffffe
0155e 4585c9                         test       r9d, r9d
01561 0f84c1300000                   je         0x7f75e83f11a8
01567 48b9c81f79e0757f0000           movabs     rcx, 0x7f75e0791fc8
01571 488381a800000001               add        qword ptr [rcx + 0xa8], 1
01579 48b9f02079e0757f0000           movabs     rcx, 0x7f75e07920f0
01583 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
01587 4183c002                       add        r8d, 2
0158b 44894170                       mov        dword ptr [rcx + 0x70], r8d
0158f 4181e0feff1f00                 and        r8d, 0x1ffffe
01596 4585c0                         test       r8d, r8d
01599 0f84aa300000                   je         0x7f75e83f11c9
0159f 48b9f02079e0757f0000           movabs     rcx, 0x7f75e07920f0
015a9 ff81b8000000                   inc        dword ptr [rcx + 0xb8]
015af 8b8c24b8010000                 mov        ecx, dword ptr [rsp + 0x1b8]
015b6 89b424c0010000                 mov        dword ptr [rsp + 0x1c0], esi
015bd 49b8a8607ee200000000           movabs     r8, 0xe27e60a8
015c7 4d8bc8                         mov        r9, r8
015ca 49be783a79e0757f0000           movabs     r14, 0x7f75e0793a78
015d4 49b90000151600000000           movabs     r9, 0x16150000
015de 41ba2a000000                   mov        r10d, 0x2a
015e4 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
015e8 7435                           je         0x7f75e83ee19f
015ea 4983c202                       add        r10, 2
015ee 4983fa2e                       cmp        r10, 0x2e
015f2 75f0                           jne        0x7f75e83ee164
015f4 41ba2a000000                   mov        r10d, 0x2a
015fa 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
015ff 7412                           je         0x7f75e83ee193
01601 4983c202                       add        r10, 2
01605 4983fa2e                       cmp        r10, 0x2e
01609 75ef                           jne        0x7f75e83ee17a
0160b 41ba29000000                   mov        r10d, 0x29
01611 eb10                           jmp        0x7f75e83ee1a3
01613 50                             push       rax
01614 4833c0                         xor        rax, rax
01617 4f0fb10cd6                     cmpxchg    qword ptr [r14 + r10*8], r9
0161c 58                             pop        rax
0161d ebbf                           jmp        0x7f75e83ee15e
0161f 4983c201                       add        r10, 1
01623 4b8304d601                     add        qword ptr [r14 + r10*8], 1
01628 49b9403c79e0757f0000           movabs     r9, 0x7f75e0793c40
01632 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
01636 83c302                         add        ebx, 2
01639 41895970                       mov        dword ptr [r9 + 0x70], ebx
0163d 81e3feff1f00                   and        ebx, 0x1ffffe
01643 85db                           test       ebx, ebx
01645 0f841f300000                   je         0x7f75e83f11ea
0164b 4d8bc8                         mov        r9, r8
0164e 48bb403c79e0757f0000           movabs     rbx, 0x7f75e0793c40
01658 488383a800000001               add        qword ptr [rbx + 0xa8], 1
01660 49b9203d79e0757f0000           movabs     r9, 0x7f75e0793d20
0166a 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
0166e 83c302                         add        ebx, 2
01671 41895970                       mov        dword ptr [r9 + 0x70], ebx
01675 81e3feff1f00                   and        ebx, 0x1ffffe
0167b 85db                           test       ebx, ebx
0167d 0f8408300000                   je         0x7f75e83f120b
01683 49b9203d79e0757f0000           movabs     r9, 0x7f75e0793d20
0168d 49b80000151600000000           movabs     r8, 0x16150000
01697 41ba16000000                   mov        r10d, 0x16
0169d 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
016a1 7435                           je         0x7f75e83ee258
016a3 4983c202                       add        r10, 2
016a7 4983fa1a                       cmp        r10, 0x1a
016ab 75f0                           jne        0x7f75e83ee21d
016ad 41ba16000000                   mov        r10d, 0x16
016b3 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
016b8 7412                           je         0x7f75e83ee24c
016ba 4983c202                       add        r10, 2
016be 4983fa1a                       cmp        r10, 0x1a
016c2 75ef                           jne        0x7f75e83ee233
016c4 41ba15000000                   mov        r10d, 0x15
016ca eb10                           jmp        0x7f75e83ee25c
016cc 50                             push       rax
016cd 4833c0                         xor        rax, rax
016d0 4f0fb104d1                     cmpxchg    qword ptr [r9 + r10*8], r8
016d5 58                             pop        rax
016d6 ebbf                           jmp        0x7f75e83ee217
016d8 4983c201                       add        r10, 1
016dc 4b8304d101                     add        qword ptr [r9 + r10*8], 1
016e1 49b8702979e0757f0000           movabs     r8, 0x7f75e0792970
016eb 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
016ef 4183c102                       add        r9d, 2
016f3 45894870                       mov        dword ptr [r8 + 0x70], r9d
016f7 4181e1feff1f00                 and        r9d, 0x1ffffe
016fe 4585c9                         test       r9d, r9d
01701 0f84a52f0000                   je         0x7f75e83f122c
01707 49b8c08f7ce200000000           movabs     r8, 0xe27c8fc0
01711 4d8bc8                         mov        r9, r8
01714 48bb203d79e0757f0000           movabs     rbx, 0x7f75e0793d20
0171e 4d8b09                         mov        r9, qword ptr [r9]
01721 49c1e92a                       shr        r9, 0x2a
01725 49c1e109                       shl        r9, 9
01729 41ba00000016                   mov        r10d, 0x16000000
0172f 4d03ca                         add        r9, r10
01732 41ba1c000000                   mov        r10d, 0x1c
01738 4e3b0cd3                       cmp        r9, qword ptr [rbx + r10*8]
0173c 7435                           je         0x7f75e83ee2f3
0173e 4983c202                       add        r10, 2
01742 4983fa20                       cmp        r10, 0x20
01746 75f0                           jne        0x7f75e83ee2b8
01748 41ba1c000000                   mov        r10d, 0x1c
0174e 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01753 7412                           je         0x7f75e83ee2e7
01755 4983c202                       add        r10, 2
01759 4983fa20                       cmp        r10, 0x20
0175d 75ef                           jne        0x7f75e83ee2ce
0175f 41ba1b000000                   mov        r10d, 0x1b
01765 eb10                           jmp        0x7f75e83ee2f7
01767 50                             push       rax
01768 4833c0                         xor        rax, rax
0176b 4e0fb10cd3                     cmpxchg    qword ptr [rbx + r10*8], r9
01770 58                             pop        rax
01771 ebbf                           jmp        0x7f75e83ee2b2
01773 4983c201                       add        r10, 1
01777 4a8304d301                     add        qword ptr [rbx + r10*8], 1
0177c 49b9203d79e0757f0000           movabs     r9, 0x7f75e0793d20
01786 4d8b00                         mov        r8, qword ptr [r8]
01789 49c1e82a                       shr        r8, 0x2a
0178d 49c1e009                       shl        r8, 9
01791 41ba00000016                   mov        r10d, 0x16000000
01797 4d03c2                         add        r8, r10
0179a 41ba22000000                   mov        r10d, 0x22
017a0 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
017a4 7435                           je         0x7f75e83ee35b
017a6 4983c202                       add        r10, 2
017aa 4983fa26                       cmp        r10, 0x26
017ae 75f0                           jne        0x7f75e83ee320
017b0 41ba22000000                   mov        r10d, 0x22
017b6 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
017bb 7412                           je         0x7f75e83ee34f
017bd 4983c202                       add        r10, 2
017c1 4983fa26                       cmp        r10, 0x26
017c5 75ef                           jne        0x7f75e83ee336
017c7 41ba21000000                   mov        r10d, 0x21
017cd eb10                           jmp        0x7f75e83ee35f
017cf 50                             push       rax
017d0 4833c0                         xor        rax, rax
017d3 4f0fb104d1                     cmpxchg    qword ptr [r9 + r10*8], r8
017d8 58                             pop        rax
017d9 ebbf                           jmp        0x7f75e83ee31a
017db 4983c201                       add        r10, 1
017df 4b8304d101                     add        qword ptr [r9 + r10*8], 1
017e4 49b8203d79e0757f0000           movabs     r8, 0x7f75e0793d20
017ee 4983803801000001               add        qword ptr [r8 + 0x138], 1
017f6 49b8302a79e0757f0000           movabs     r8, 0x7f75e0792a30
01800 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
01804 4183c102                       add        r9d, 2
01808 45894870                       mov        dword ptr [r8 + 0x70], r9d
0180c 4181e1feff1f00                 and        r9d, 0x1ffffe
01813 4585c9                         test       r9d, r9d
01816 0f84b12e0000                   je         0x7f75e83f124d
0181c 49b8203d79e0757f0000           movabs     r8, 0x7f75e0793d20
01826 4983804801000001               add        qword ptr [r8 + 0x148], 1
0182e 4863d9                         movsxd     rbx, ecx
01831 b90c000000                     mov        ecx, 0xc
01836 4c8bcb                         mov        r9, rbx
01839 4c03c9                         add        r9, rcx
0183c 48b9100579e0757f0000           movabs     rcx, 0x7f75e0790510
01846 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
0184a 4183c002                       add        r8d, 2
0184e 44894170                       mov        dword ptr [rcx + 0x70], r8d
01852 4181e0feff1f00                 and        r8d, 0x1ffffe
01859 4585c0                         test       r8d, r8d
0185c 0f848c2e0000                   je         0x7f75e83f126e
01862 48b9100579e0757f0000           movabs     rcx, 0x7f75e0790510
0186c 488381d800000001               add        qword ptr [rcx + 0xd8], 1
01874 48b9880679e0757f0000           movabs     rcx, 0x7f75e0790688
0187e 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
01882 4183c002                       add        r8d, 2
01886 44894170                       mov        dword ptr [rcx + 0x70], r8d
0188a 4181e0feff1f00                 and        r8d, 0x1ffffe
01891 4585c0                         test       r8d, r8d
01894 0f84752e0000                   je         0x7f75e83f128f
0189a 48b9203d79e0757f0000           movabs     rcx, 0x7f75e0793d20
018a4 488d8958010000                 lea        rcx, [rcx + 0x158]
018ab 49b8785b7fe200000000           movabs     r8, 0xe27f5b78
018b5 49b80058151600000000           movabs     r8, 0x16155800
018bf 4d8bd0                         mov        r10, r8
018c2 4c3301                         xor        r8, qword ptr [rcx]
018c5 49f7c0fcffffff                 test       r8, -4
018cc 7427                           je         0x7f75e83ee475
018ce 41f6c002                       test       r8b, 2
018d2 7521                           jne        0x7f75e83ee475
018d4 48f701feffffff                 test       qword ptr [rcx], -2
018db 7415                           je         0x7f75e83ee472
018dd 4d8bc2                         mov        r8, r10
018e0 4c3301                         xor        r8, qword ptr [rcx]
018e3 49f7c0fcffffff                 test       r8, -4
018ea 7409                           je         0x7f75e83ee475
018ec 48830902                       or         qword ptr [rcx], 2
018f0 eb03                           jmp        0x7f75e83ee475
018f2 4c8901                         mov        qword ptr [rcx], r8
018f5 48b9203d79e0757f0000           movabs     rcx, 0x7f75e0793d20
018ff 4883816801000001               add        qword ptr [rcx + 0x168], 1
01907 48be08907ce200000000           movabs     rsi, 0xe27c9008
01911 4c8bc2                         mov        r8, rdx
01914 ba02000000                     mov        edx, 2
01919 b910000000                     mov        ecx, 0x10
0191e 498bc0                         mov        rax, r8
01921 4c8bc0                         mov        r8, rax
01924 bf00000000                     mov        edi, 0
01929 48890424                       mov        qword ptr [rsp], rax
0192d 48895c2408                     mov        qword ptr [rsp + 8], rbx
01932 49bac08f7ce200000000           movabs     r10, 0xe27c8fc0
0193c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01941 49ba785b7fe200000000           movabs     r10, 0xe27f5b78
0194b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01950 0f1f8000000000                 nop        dword ptr [rax]
01957 e884235207                     call       0x7f75ef910860
0195c 0f1f8400541a0006               nop        dword ptr [rax + rax + 0x6001a54]
01964 4885c0                         test       rax, rax
01967 48bb203d79e0757f0000           movabs     rbx, 0x7f75e0793d20
01971 750c                           jne        0x7f75e83ee4ff
01973 808b7101000001                 or         byte ptr [rbx + 0x171], 1
0197a e98b000000                     jmp        0x7f75e83ee58a
0197f 488b38                         mov        rdi, qword ptr [rax]
01982 48c1ef2a                       shr        rdi, 0x2a
01986 48c1e709                       shl        rdi, 9
0198a 41ba00000016                   mov        r10d, 0x16000000
01990 4903fa                         add        rdi, r10
01993 41ba30000000                   mov        r10d, 0x30
01999 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
0199d 7435                           je         0x7f75e83ee554
0199f 4983c202                       add        r10, 2
019a3 4983fa34                       cmp        r10, 0x34
019a7 75f0                           jne        0x7f75e83ee519
019a9 41ba30000000                   mov        r10d, 0x30
019af 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
019b4 7412                           je         0x7f75e83ee548
019b6 4983c202                       add        r10, 2
019ba 4983fa34                       cmp        r10, 0x34
019be 75ef                           jne        0x7f75e83ee52f
019c0 41ba2f000000                   mov        r10d, 0x2f
019c6 eb10                           jmp        0x7f75e83ee558
019c8 50                             push       rax
019c9 4833c0                         xor        rax, rax
019cc 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
019d1 58                             pop        rax
019d2 ebbf                           jmp        0x7f75e83ee513
019d4 4983c201                       add        r10, 1
019d8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
019dd 48bf0006141600000000           movabs     rdi, 0x16140600
019e7 488b18                         mov        rbx, qword ptr [rax]
019ea 48c1eb2a                       shr        rbx, 0x2a
019ee 48c1e309                       shl        rbx, 9
019f2 41ba00000016                   mov        r10d, 0x16000000
019f8 4903da                         add        rbx, r10
019fb 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
019ff 0f852b2d0000                   jne        0x7f75e83f12b0
01a05 e900000000                     jmp        0x7f75e83ee58a
01a0a 488bf8                         mov        rdi, rax
01a0d 4889bc24c8010000               mov        qword ptr [rsp + 0x1c8], rdi
01a15 483b07                         cmp        rax, qword ptr [rdi]
01a18 488bf7                         mov        rsi, rdi
01a1b 48bb701472e0757f0000           movabs     rbx, 0x7f75e0721470
01a25 488b36                         mov        rsi, qword ptr [rsi]
01a28 48c1ee2a                       shr        rsi, 0x2a
01a2c 48c1e609                       shl        rsi, 9
01a30 41ba00000016                   mov        r10d, 0x16000000
01a36 4903f2                         add        rsi, r10
01a39 41baa3000000                   mov        r10d, 0xa3
01a3f 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
01a43 743b                           je         0x7f75e83ee600
01a45 4983c202                       add        r10, 2
01a49 4981faa7000000                 cmp        r10, 0xa7
01a50 75ed                           jne        0x7f75e83ee5bf
01a52 41baa3000000                   mov        r10d, 0xa3
01a58 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01a5d 7415                           je         0x7f75e83ee5f4
01a5f 4983c202                       add        r10, 2
01a63 4981faa7000000                 cmp        r10, 0xa7
01a6a 75ec                           jne        0x7f75e83ee5d8
01a6c 41baa2000000                   mov        r10d, 0xa2
01a72 eb10                           jmp        0x7f75e83ee604
01a74 50                             push       rax
01a75 4833c0                         xor        rax, rax
01a78 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
01a7d 58                             pop        rax
01a7e ebb9                           jmp        0x7f75e83ee5b9
01a80 4983c201                       add        r10, 1
01a84 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01a89 48bee84079e0757f0000           movabs     rsi, 0x7f75e07940e8
01a93 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
01a96 83c302                         add        ebx, 2
01a99 895e70                         mov        dword ptr [rsi + 0x70], ebx
01a9c 81e3feff1f00                   and        ebx, 0x1ffffe
01aa2 85db                           test       ebx, ebx
01aa4 0f84942c0000                   je         0x7f75e83f12be
01aaa 488bf7                         mov        rsi, rdi
01aad 48bbe84079e0757f0000           movabs     rbx, 0x7f75e07940e8
01ab7 488b36                         mov        rsi, qword ptr [rsi]
01aba 48c1ee2a                       shr        rsi, 0x2a
01abe 48c1e609                       shl        rsi, 9
01ac2 41ba00000016                   mov        r10d, 0x16000000
01ac8 4903f2                         add        rsi, r10
01acb 41ba16000000                   mov        r10d, 0x16
01ad1 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
01ad5 7435                           je         0x7f75e83ee68c
01ad7 4983c202                       add        r10, 2
01adb 4983fa1a                       cmp        r10, 0x1a
01adf 75f0                           jne        0x7f75e83ee651
01ae1 41ba16000000                   mov        r10d, 0x16
01ae7 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01aec 7412                           je         0x7f75e83ee680
01aee 4983c202                       add        r10, 2
01af2 4983fa1a                       cmp        r10, 0x1a
01af6 75ef                           jne        0x7f75e83ee667
01af8 41ba15000000                   mov        r10d, 0x15
01afe eb10                           jmp        0x7f75e83ee690
01b00 50                             push       rax
01b01 4833c0                         xor        rax, rax
01b04 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
01b09 58                             pop        rax
01b0a ebbf                           jmp        0x7f75e83ee64b
01b0c 4983c201                       add        r10, 1
01b10 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01b15 488bf7                         mov        rsi, rdi
01b18 0f1f440000                     nop        dword ptr [rax + rax]
01b1d 48b8009539c0757f0000           movabs     rax, 0x7f75c0399500
01b27 e8b41c5207                     call       0x7f75ef910360
01b2c 0f1f8400241c0007               nop        dword ptr [rax + rax + 0x7001c24]
01b34 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
01b3c 8b7708                         mov        esi, dword ptr [rdi + 8]
01b3f 48bbe84079e0757f0000           movabs     rbx, 0x7f75e07940e8
01b49 488383d800000001               add        qword ptr [rbx + 0xd8], 1
01b51 48bbf82779e0757f0000           movabs     rbx, 0x7f75e07927f8
01b5b 8b5370                         mov        edx, dword ptr [rbx + 0x70]
01b5e 83c202                         add        edx, 2
01b61 895370                         mov        dword ptr [rbx + 0x70], edx
01b64 81e2feff1f00                   and        edx, 0x1ffffe
01b6a 85d2                           test       edx, edx
01b6c 0f84f22b0000                   je         0x7f75e83f12e4
01b72 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01b7a 48bbf82779e0757f0000           movabs     rbx, 0x7f75e07927f8
01b84 4883830801000001               add        qword ptr [rbx + 0x108], 1
01b8c ffc8                           dec        eax
01b8e 2bf0                           sub        esi, eax
01b90 48bbc81e79e0757f0000           movabs     rbx, 0x7f75e0791ec8
01b9a 8b4370                         mov        eax, dword ptr [rbx + 0x70]
01b9d 83c002                         add        eax, 2
01ba0 894370                         mov        dword ptr [rbx + 0x70], eax
01ba3 25feff1f00                     and        eax, 0x1ffffe
01ba8 85c0                           test       eax, eax
01baa 0f84d52b0000                   je         0x7f75e83f1305
01bb0 48bbc81e79e0757f0000           movabs     rbx, 0x7f75e0791ec8
01bba 488383a800000001               add        qword ptr [rbx + 0xa8], 1
01bc2 48bb0000000000000000           movabs     rbx, 0
01bcc bb00000000                     mov        ebx, 0
01bd1 443bdb                         cmp        r11d, ebx
01bd4 0f8ccc2b0000                   jl         0x7f75e83f1326
01bda 443bde                         cmp        r11d, esi
01bdd 0f8dd02b0000                   jge        0x7f75e83f1333
01be3 498bdb                         mov        rbx, r11
01be6 899c24c4010000                 mov        dword ptr [rsp + 0x1c4], ebx
01bed 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
01bf5 488bbc24c8010000               mov        rdi, qword ptr [rsp + 0x1c8]
01bfd 488bf7                         mov        rsi, rdi
01c00 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
01c0a 488b36                         mov        rsi, qword ptr [rsi]
01c0d 48c1ee2a                       shr        rsi, 0x2a
01c11 48c1e609                       shl        rsi, 9
01c15 41ba00000016                   mov        r10d, 0x16000000
01c1b 4903f2                         add        rsi, r10
01c1e 41ba1e000000                   mov        r10d, 0x1e
01c24 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01c28 7435                           je         0x7f75e83ee7df
01c2a 4983c202                       add        r10, 2
01c2e 4983fa22                       cmp        r10, 0x22
01c32 75f0                           jne        0x7f75e83ee7a4
01c34 41ba1e000000                   mov        r10d, 0x1e
01c3a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01c3f 7412                           je         0x7f75e83ee7d3
01c41 4983c202                       add        r10, 2
01c45 4983fa22                       cmp        r10, 0x22
01c49 75ef                           jne        0x7f75e83ee7ba
01c4b 41ba1d000000                   mov        r10d, 0x1d
01c51 eb10                           jmp        0x7f75e83ee7e3
01c53 50                             push       rax
01c54 4833c0                         xor        rax, rax
01c57 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
01c5c 58                             pop        rax
01c5d ebbf                           jmp        0x7f75e83ee79e
01c5f 4983c201                       add        r10, 1
01c63 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01c68 488bf7                         mov        rsi, rdi
01c6b 6690                           nop        
01c6d 48b8289539c0757f0000           movabs     rax, 0x7f75c0399528
01c77 e8641b5207                     call       0x7f75ef910360
01c7c 0f1f8400741d0008               nop        dword ptr [rax + rax + 0x8001d74]
01c84 483b00                         cmp        rax, qword ptr [rax]
01c87 488bf0                         mov        rsi, rax
01c8a 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
01c94 488b36                         mov        rsi, qword ptr [rsi]
01c97 48c1ee2a                       shr        rsi, 0x2a
01c9b 48c1e609                       shl        rsi, 9
01c9f 41ba00000016                   mov        r10d, 0x16000000
01ca5 4903f2                         add        rsi, r10
01ca8 41ba24000000                   mov        r10d, 0x24
01cae 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01cb2 7435                           je         0x7f75e83ee869
01cb4 4983c202                       add        r10, 2
01cb8 4983fa28                       cmp        r10, 0x28
01cbc 75f0                           jne        0x7f75e83ee82e
01cbe 41ba24000000                   mov        r10d, 0x24
01cc4 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01cc9 7412                           je         0x7f75e83ee85d
01ccb 4983c202                       add        r10, 2
01ccf 4983fa28                       cmp        r10, 0x28
01cd3 75ef                           jne        0x7f75e83ee844
01cd5 41ba23000000                   mov        r10d, 0x23
01cdb eb10                           jmp        0x7f75e83ee86d
01cdd 50                             push       rax
01cde 4833c0                         xor        rax, rax
01ce1 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
01ce6 58                             pop        rax
01ce7 ebbf                           jmp        0x7f75e83ee828
01ce9 4983c201                       add        r10, 1
01ced 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01cf2 8b7028                         mov        esi, dword ptr [rax + 0x28]
01cf5 488bd0                         mov        rdx, rax
01cf8 48b9e84079e0757f0000           movabs     rcx, 0x7f75e07940e8
01d02 488b12                         mov        rdx, qword ptr [rdx]
01d05 48c1ea2a                       shr        rdx, 0x2a
01d09 48c1e209                       shl        rdx, 9
01d0d 41ba00000016                   mov        r10d, 0x16000000
01d13 4903d2                         add        rdx, r10
01d16 41ba2a000000                   mov        r10d, 0x2a
01d1c 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01d20 7435                           je         0x7f75e83ee8d7
01d22 4983c202                       add        r10, 2
01d26 4983fa2e                       cmp        r10, 0x2e
01d2a 75f0                           jne        0x7f75e83ee89c
01d2c 41ba2a000000                   mov        r10d, 0x2a
01d32 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01d37 7412                           je         0x7f75e83ee8cb
01d39 4983c202                       add        r10, 2
01d3d 4983fa2e                       cmp        r10, 0x2e
01d41 75ef                           jne        0x7f75e83ee8b2
01d43 41ba29000000                   mov        r10d, 0x29
01d49 eb10                           jmp        0x7f75e83ee8db
01d4b 50                             push       rax
01d4c 4833c0                         xor        rax, rax
01d4f 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
01d54 58                             pop        rax
01d55 ebbf                           jmp        0x7f75e83ee896
01d57 4983c201                       add        r10, 1
01d5b 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01d60 8b4808                         mov        ecx, dword ptr [rax + 8]
01d63 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
01d6d 4883827801000001               add        qword ptr [rdx + 0x178], 1
01d75 48ba302a79e0757f0000           movabs     rdx, 0x7f75e0792a30
01d7f 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01d83 4183c002                       add        r8d, 2
01d87 44894270                       mov        dword ptr [rdx + 0x70], r8d
01d8b 4181e0feff1f00                 and        r8d, 0x1ffffe
01d92 4585c0                         test       r8d, r8d
01d95 0f842a2a0000                   je         0x7f75e83f1345
01d9b 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
01da5 4883828801000001               add        qword ptr [rdx + 0x188], 1
01dad 8b9c24c4010000                 mov        ebx, dword ptr [rsp + 0x1c4]
01db4 4863db                         movsxd     rbx, ebx
01db7 ba0c000000                     mov        edx, 0xc
01dbc 4c8bcb                         mov        r9, rbx
01dbf 4c03ca                         add        r9, rdx
01dc2 48ba100579e0757f0000           movabs     rdx, 0x7f75e0790510
01dcc 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01dd0 4183c002                       add        r8d, 2
01dd4 44894270                       mov        dword ptr [rdx + 0x70], r8d
01dd8 4181e0feff1f00                 and        r8d, 0x1ffffe
01ddf 4585c0                         test       r8d, r8d
01de2 0f84fe290000                   je         0x7f75e83f1366
01de8 48ba100579e0757f0000           movabs     rdx, 0x7f75e0790510
01df2 488382d800000001               add        qword ptr [rdx + 0xd8], 1
01dfa 48ba880679e0757f0000           movabs     rdx, 0x7f75e0790688
01e04 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01e08 4183c002                       add        r8d, 2
01e0c 44894270                       mov        dword ptr [rdx + 0x70], r8d
01e10 4181e0feff1f00                 and        r8d, 0x1ffffe
01e17 4585c0                         test       r8d, r8d
01e1a 0f84e7290000                   je         0x7f75e83f1387
01e20 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
01e2a 488d9298010000                 lea        rdx, [rdx + 0x198]
01e31 49b8203c81e200000000           movabs     r8, 0xe2813c20
01e3b 49b80068151600000000           movabs     r8, 0x16156800
01e45 4d8bd0                         mov        r10, r8
01e48 4c3302                         xor        r8, qword ptr [rdx]
01e4b 49f7c0fcffffff                 test       r8, -4
01e52 7427                           je         0x7f75e83ee9fb
01e54 41f6c002                       test       r8b, 2
01e58 7521                           jne        0x7f75e83ee9fb
01e5a 48f702feffffff                 test       qword ptr [rdx], -2
01e61 7415                           je         0x7f75e83ee9f8
01e63 4d8bc2                         mov        r8, r10
01e66 4c3302                         xor        r8, qword ptr [rdx]
01e69 49f7c0fcffffff                 test       r8, -4
01e70 7409                           je         0x7f75e83ee9fb
01e72 48830a02                       or         qword ptr [rdx], 2
01e76 eb03                           jmp        0x7f75e83ee9fb
01e78 4c8902                         mov        qword ptr [rdx], r8
01e7b 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
01e85 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
01e8d ba02000000                     mov        edx, 2
01e92 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
01e9a bf00000000                     mov        edi, 0
01e9f 488b8424c8010000               mov        rax, qword ptr [rsp + 0x1c8]
01ea7 48890424                       mov        qword ptr [rsp], rax
01eab 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
01eb3 4889442408                     mov        qword ptr [rsp + 8], rax
01eb8 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01ebd 49ba203c81e200000000           movabs     r10, 0xe2813c20
01ec7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ecc 666690                         nop        
01ecf e80c1e5207                     call       0x7f75ef910860
01ed4 0f1f8400cc1f0009               nop        dword ptr [rax + rax + 0x9001fcc]
01edc 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01ee4 4183c310                       add        r11d, 0x10
01ee8 8bb424c0010000                 mov        esi, dword ptr [rsp + 0x1c0]
01eef 83c610                         add        esi, 0x10
01ef2 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01efa ba02000000                     mov        edx, 2
01eff 7c05                           jl         0x7f75e83eea86
01f01 ba00000000                     mov        edx, 0
01f06 48b9701472e0757f0000           movabs     rcx, 0x7f75e0721470
01f10 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
01f14 4403c2                         add        r8d, edx
01f17 44894174                       mov        dword ptr [rcx + 0x74], r8d
01f1b 85d2                           test       edx, edx
01f1d 7506                           jne        0x7f75e83eeaa5
01f1f 41b802000000                   mov        r8d, 2
01f25 4181e0fe3f0000                 and        r8d, 0x3ffe
01f2c 4585c0                         test       r8d, r8d
01f2f 0f84f3280000                   je         0x7f75e83f13a8
01f35 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01f39 418502                         test       dword ptr [r10], eax
01f3c 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01f44 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
01f4e b940050000                     mov        ecx, 0x540
01f53 7c05                           jl         0x7f75e83eeada
01f55 b950050000                     mov        ecx, 0x550
01f5a 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01f5e 4d8d4001                       lea        r8, [r8 + 1]
01f62 4c89040a                       mov        qword ptr [rdx + rcx], r8
01f66 0f8cecf3ffff                   jl         0x7f75e83eded8
01f6c 48be701472e0757f0000           movabs     rsi, 0x7f75e0721470
01f76 ff8660050000                   inc        dword ptr [rsi + 0x560]
01f7c e9a5000000                     jmp        0x7f75e83eeba6
01f81 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
01f8b 4883827805000001               add        qword ptr [rdx + 0x578], 1
01f93 488bb42468010000               mov        rsi, qword ptr [rsp + 0x168]
01f9b 8b942490010000                 mov        edx, dword ptr [rsp + 0x190]
01fa2 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
01faa 448b842474010000               mov        r8d, dword ptr [rsp + 0x174]
01fb2 4c8bcf                         mov        r9, rdi
01fb5 4885c9                         test       rcx, rcx
01fb8 0f848b280000                   je         0x7f75e83f13c9
01fbe 85d2                           test       edx, edx
01fc0 0f8c83280000                   jl         0x7f75e83f13c9
01fc6 4585c0                         test       r8d, r8d
01fc9 0f8c7a280000                   jl         0x7f75e83f13c9
01fcf 4a8d3c0a                       lea        rdi, [rdx + r9]
01fd3 3b7e08                         cmp        edi, dword ptr [rsi + 8]
01fd6 0f876d280000                   ja         0x7f75e83f13c9
01fdc 4b8d3c08                       lea        rdi, [r8 + r9]
01fe0 3b7908                         cmp        edi, dword ptr [rcx + 8]
01fe3 0f8760280000                   ja         0x7f75e83f13c9
01fe9 4585c9                         test       r9d, r9d
01fec 0f8c57280000                   jl         0x7f75e83f13c9
01ff2 4863d2                         movsxd     rdx, edx
01ff5 4d63c0                         movsxd     r8, r8d
01ff8 488d7c160c                     lea        rdi, [rsi + rdx + 0xc]
01ffd 4a8d74010c                     lea        rsi, [rcx + r8 + 0xc]
02002 498bd1                         mov        rdx, r9
02005 40f6c40f                       test       spl, 0xf
02009 0f8412000000                   je         0x7f75e83eeba1
0200f 4883ec08                       sub        rsp, 8
02013 e888b35007                     call       0x7f75ef8f9f20
02018 4883c408                       add        rsp, 8
0201c e905000000                     jmp        0x7f75e83eeba6
02021 e87ab35007                     call       0x7f75ef8f9f20
02026 8bb424a4010000                 mov        esi, dword ptr [rsp + 0x1a4]
0202d 8b9c24a0010000                 mov        ebx, dword ptr [rsp + 0x1a0]
02034 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
0203c 488bfb                         mov        rdi, rbx
0203f 2bbc24a8010000                 sub        edi, dword ptr [rsp + 0x1a8]
02046 4183f810                       cmp        r8d, 0x10
0204a 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
02054 b988050000                     mov        ecx, 0x588
02059 7f05                           jg         0x7f75e83eebe0
0205b b998050000                     mov        ecx, 0x598
02060 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
02064 4d8d4901                       lea        r9, [r9 + 1]
02068 4c890c0a                       mov        qword ptr [rdx + rcx], r9
0206c 448b8c24a8010000               mov        r9d, dword ptr [rsp + 0x1a8]
02074 0f8f2c000000                   jg         0x7f75e83eec26
0207a 4183f910                       cmp        r9d, 0x10
0207e 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
02088 b9b8050000                     mov        ecx, 0x5b8
0208d 7d05                           jge        0x7f75e83eec14
0208f b9a8050000                     mov        ecx, 0x5a8
02094 488b040a                       mov        rax, qword ptr [rdx + rcx]
02098 488d4001                       lea        rax, [rax + 1]
0209c 4889040a                       mov        qword ptr [rdx + rcx], rax
020a0 0f8dee110000                   jge        0x7f75e83efe14
020a6 453bc8                         cmp        r9d, r8d
020a9 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
020b3 b920060000                     mov        ecx, 0x620
020b8 7c05                           jl         0x7f75e83eec3f
020ba b930060000                     mov        ecx, 0x630
020bf 488b040a                       mov        rax, qword ptr [rdx + rcx]
020c3 488d4001                       lea        rax, [rax + 1]
020c7 4889040a                       mov        qword ptr [rdx + rcx], rax
020cb 0f8c04030000                   jl         0x7f75e83eef55
020d1 4183f830                       cmp        r8d, 0x30
020d5 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
020df b940060000                     mov        ecx, 0x640
020e4 7e05                           jle        0x7f75e83eec6b
020e6 b950060000                     mov        ecx, 0x650
020eb 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
020ef 4d8d4901                       lea        r9, [r9 + 1]
020f3 4c890c0a                       mov        qword ptr [rdx + rcx], r9
020f7 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
020fe 0f8ec4000000                   jle        0x7f75e83eed48
02104 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
0210e 4883826006000001               add        qword ptr [rdx + 0x660], 1
02116 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
0211e 488bd7                         mov        rdx, rdi
02121 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
02129 498bf8                         mov        rdi, r8
0212c 4c8bc3                         mov        r8, rbx
0212f 4c8bcf                         mov        r9, rdi
02132 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
02139 4885f6                         test       rsi, rsi
0213c 0f8417270000                   je         0x7f75e83f13d9
02142 4885c9                         test       rcx, rcx
02145 0f840e270000                   je         0x7f75e83f13d9
0214b 85d2                           test       edx, edx
0214d 0f8c06270000                   jl         0x7f75e83f13d9
02153 4585c0                         test       r8d, r8d
02156 0f8cfd260000                   jl         0x7f75e83f13d9
0215c 4a8d3c0a                       lea        rdi, [rdx + r9]
02160 3b7e08                         cmp        edi, dword ptr [rsi + 8]
02163 0f87f0260000                   ja         0x7f75e83f13d9
02169 4b8d3c08                       lea        rdi, [r8 + r9]
0216d 3b7908                         cmp        edi, dword ptr [rcx + 8]
02170 0f87e3260000                   ja         0x7f75e83f13d9
02176 4585c9                         test       r9d, r9d
02179 0f8cda260000                   jl         0x7f75e83f13d9
0217f 4863d2                         movsxd     rdx, edx
02182 4d63c0                         movsxd     r8, r8d
02185 488d7c160c                     lea        rdi, [rsi + rdx + 0xc]
0218a 4a8d74010c                     lea        rsi, [rcx + r8 + 0xc]
0218f 498bd1                         mov        rdx, r9
02192 40f6c40f                       test       spl, 0xf
02196 0f8412000000                   je         0x7f75e83eed2e
0219c 4883ec08                       sub        rsp, 8
021a0 e8fbb15007                     call       0x7f75ef8f9f20
021a5 4883c408                       add        rsp, 8
021a9 e905000000                     jmp        0x7f75e83eed33
021ae e8edb15007                     call       0x7f75ef8f9f20
021b3 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
021bd ff8270060000                   inc        dword ptr [rdx + 0x670]
021c3 e9ea010000                     jmp        0x7f75e83eef32
021c8 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
021cf 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
021d6 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
021dd 899c24e0010000                 mov        dword ptr [rsp + 0x1e0], ebx
021e4 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
021eb 0f1f440000                     nop        dword ptr [rax + rax]
021f0 898424d8010000                 mov        dword ptr [rsp + 0x1d8], eax
021f7 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
021ff 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
02209 4883828806000001               add        qword ptr [rdx + 0x688], 1
02211 48ba585972e0757f0000           movabs     rdx, 0x7f75e0725958
0221b 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0221e 83c102                         add        ecx, 2
02221 894a70                         mov        dword ptr [rdx + 0x70], ecx
02224 81e1feff1f00                   and        ecx, 0x1ffffe
0222a 85c9                           test       ecx, ecx
0222c 0f8437260000                   je         0x7f75e83f13e9
02232 660f1f440000                   nop        word ptr [rax + rax]
02238 e95c260000                     jmp        0x7f75e83f1419
0223d 90                             nop        
0223e 90                             nop        
0223f 90                             nop        
02240 90                             nop        
02241 90                             nop        
02242 48ba585972e0757f0000           movabs     rdx, 0x7f75e0725958
0224c 488d92d8000000                 lea        rdx, [rdx + 0xd8]
02253 4885c0                         test       rax, rax
02256 750c                           jne        0x7f75e83eede4
02258 f6420801                       test       byte ptr [rdx + 8], 1
0225c 7506                           jne        0x7f75e83eede4
0225e f048834a0801                   lock or    qword ptr [rdx + 8], 1
02264 48bee00977e200000000           movabs     rsi, 0xe27709e0
0226e 488bd6                         mov        rdx, rsi
02271 48b9585972e0757f0000           movabs     rcx, 0x7f75e0725958
0227b 488b12                         mov        rdx, qword ptr [rdx]
0227e 48c1ea2a                       shr        rdx, 0x2a
02282 48c1e209                       shl        rdx, 9
02286 41ba00000016                   mov        r10d, 0x16000000
0228c 4903d2                         add        rdx, r10
0228f 41ba16000000                   mov        r10d, 0x16
02295 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02299 7435                           je         0x7f75e83eee50
0229b 4983c202                       add        r10, 2
0229f 4983fa1a                       cmp        r10, 0x1a
022a3 75f0                           jne        0x7f75e83eee15
022a5 41ba16000000                   mov        r10d, 0x16
022ab 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
022b0 7412                           je         0x7f75e83eee44
022b2 4983c202                       add        r10, 2
022b6 4983fa1a                       cmp        r10, 0x1a
022ba 75ef                           jne        0x7f75e83eee2b
022bc 41ba15000000                   mov        r10d, 0x15
022c2 eb10                           jmp        0x7f75e83eee54
022c4 50                             push       rax
022c5 4833c0                         xor        rax, rax
022c8 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
022cd 58                             pop        rax
022ce ebbf                           jmp        0x7f75e83eee0f
022d0 4983c201                       add        r10, 1
022d4 4a8304d101                     add        qword ptr [rcx + r10*8], 1
022d9 488bd0                         mov        rdx, rax
022dc 488bcf                         mov        rcx, rdi
022df 89bc24dc010000                 mov        dword ptr [rsp + 0x1dc], edi
022e6 90                             nop        
022e7 e8f40f5207                     call       0x7f75ef90fe60
022ec 0f1f8400e423000b               nop        dword ptr [rax + rax + 0xb0023e4]
022f4 48be701472e0757f0000           movabs     rsi, 0x7f75e0721470
022fe 4883869806000001               add        qword ptr [rsi + 0x698], 1
02306 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
0230e 8b9424d8010000                 mov        edx, dword ptr [rsp + 0x1d8]
02315 488bc8                         mov        rcx, rax
02318 0f1f8000000000                 nop        dword ptr [rax]
0231f e8bc195207                     call       0x7f75ef910860
02324 0f1f84001c24000c               nop        dword ptr [rax + rax + 0xc00241c]
0232c 8b8424d8010000                 mov        eax, dword ptr [rsp + 0x1d8]
02333 83c008                         add        eax, 8
02336 8bbc24dc010000                 mov        edi, dword ptr [rsp + 0x1dc]
0233d 83c708                         add        edi, 8
02340 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
02347 be02000000                     mov        esi, 2
0234c 7c05                           jl         0x7f75e83eeed3
0234e be00000000                     mov        esi, 0
02353 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
0235d 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
02360 03ce                           add        ecx, esi
02362 894a74                         mov        dword ptr [rdx + 0x74], ecx
02365 85f6                           test       esi, esi
02367 7505                           jne        0x7f75e83eeeee
02369 b902000000                     mov        ecx, 2
0236e 81e1fe3f0000                   and        ecx, 0x3ffe
02374 85c9                           test       ecx, ecx
02376 0f8427250000                   je         0x7f75e83f1423
0237c 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02380 418502                         test       dword ptr [r10], eax
02383 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
0238a 48be701472e0757f0000           movabs     rsi, 0x7f75e0721470
02394 baa8060000                     mov        edx, 0x6a8
02399 7c05                           jl         0x7f75e83eef20
0239b bab8060000                     mov        edx, 0x6b8
023a0 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
023a4 488d4901                       lea        rcx, [rcx + 1]
023a8 48890c16                       mov        qword ptr [rsi + rdx], rcx
023ac 0f8c3efeffff                   jl         0x7f75e83eed70
023b2 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
023b9 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
023c0 48be701472e0757f0000           movabs     rsi, 0x7f75e0721470
023ca ff86c8060000                   inc        dword ptr [rsi + 0x6c8]
023d0 e9111a0000                     jmp        0x7f75e83f0966
023d5 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
023dc 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
023e3 4183f910                       cmp        r9d, 0x10
023e7 48be701472e0757f0000           movabs     rsi, 0x7f75e0721470
023f1 bae0060000                     mov        edx, 0x6e0
023f6 7c05                           jl         0x7f75e83eef7d
023f8 baf0060000                     mov        edx, 0x6f0
023fd 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
02401 488d4901                       lea        rcx, [rcx + 1]
02405 48890c16                       mov        qword ptr [rsi + rdx], rcx
02409 0f8c150c0000                   jl         0x7f75e83efba4
0240f 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
02416 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
0241d 899c24f0010000                 mov        dword ptr [rsp + 0x1f0], ebx
02424 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
0242b 0f1f440000                     nop        dword ptr [rax + rax]
02430 898424ec010000                 mov        dword ptr [rsp + 0x1ec], eax
02437 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0243f 48be701472e0757f0000           movabs     rsi, 0x7f75e0721470
02449 4883860007000001               add        qword ptr [rsi + 0x700], 1
02451 48be783a79e0757f0000           movabs     rsi, 0x7f75e0793a78
0245b 8b5670                         mov        edx, dword ptr [rsi + 0x70]
0245e 83c202                         add        edx, 2
02461 895670                         mov        dword ptr [rsi + 0x70], edx
02464 81e2feff1f00                   and        edx, 0x1ffffe
0246a 85d2                           test       edx, edx
0246c 0f8452240000                   je         0x7f75e83f1444
02472 48bec08f7ce200000000           movabs     rsi, 0xe27c8fc0
0247c 48ba783a79e0757f0000           movabs     rdx, 0x7f75e0793a78
02486 488b36                         mov        rsi, qword ptr [rsi]
02489 48c1ee2a                       shr        rsi, 0x2a
0248d 48c1e609                       shl        rsi, 9
02491 41ba00000016                   mov        r10d, 0x16000000
02497 4903f2                         add        rsi, r10
0249a 41ba16000000                   mov        r10d, 0x16
024a0 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
024a4 7435                           je         0x7f75e83ef05b
024a6 4983c202                       add        r10, 2
024aa 4983fa1a                       cmp        r10, 0x1a
024ae 75f0                           jne        0x7f75e83ef020
024b0 41ba16000000                   mov        r10d, 0x16
024b6 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
024bb 7412                           je         0x7f75e83ef04f
024bd 4983c202                       add        r10, 2
024c1 4983fa1a                       cmp        r10, 0x1a
024c5 75ef                           jne        0x7f75e83ef036
024c7 41ba15000000                   mov        r10d, 0x15
024cd eb10                           jmp        0x7f75e83ef05f
024cf 50                             push       rax
024d0 4833c0                         xor        rax, rax
024d3 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
024d8 58                             pop        rax
024d9 ebbf                           jmp        0x7f75e83ef01a
024db 4983c201                       add        r10, 1
024df 4a8304d201                     add        qword ptr [rdx + r10*8], 1
024e4 448b6808                       mov        r13d, dword ptr [rax + 8]
024e8 48be783a79e0757f0000           movabs     rsi, 0x7f75e0793a78
024f2 488386d800000001               add        qword ptr [rsi + 0xd8], 1
024fa 48bef82779e0757f0000           movabs     rsi, 0x7f75e07927f8
02504 8b5670                         mov        edx, dword ptr [rsi + 0x70]
02507 83c202                         add        edx, 2
0250a 895670                         mov        dword ptr [rsi + 0x70], edx
0250d 81e2feff1f00                   and        edx, 0x1ffffe
02513 85d2                           test       edx, edx
02515 0f84cf230000                   je         0x7f75e83f146a
0251b 48bef82779e0757f0000           movabs     rsi, 0x7f75e07927f8
02525 4883860801000001               add        qword ptr [rsi + 0x108], 1
0252d 498bf5                         mov        rsi, r13
02530 83ee0f                         sub        esi, 0xf
02533 48bac81e79e0757f0000           movabs     rdx, 0x7f75e0791ec8
0253d 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02540 83c102                         add        ecx, 2
02543 894a70                         mov        dword ptr [rdx + 0x70], ecx
02546 81e1feff1f00                   and        ecx, 0x1ffffe
0254c 85c9                           test       ecx, ecx
0254e 0f84b7230000                   je         0x7f75e83f148b
02554 48bac81e79e0757f0000           movabs     rdx, 0x7f75e0791ec8
0255e 488382a800000001               add        qword ptr [rdx + 0xa8], 1
02566 48ba0000000000000000           movabs     rdx, 0
02570 ba00000000                     mov        edx, 0
02575 3bfa                           cmp        edi, edx
02577 0f8caf230000                   jl         0x7f75e83f14ac
0257d 3bfe                           cmp        edi, esi
0257f 0f8db4230000                   jge        0x7f75e83f14b9
02585 488bf7                         mov        rsi, rdi
02588 48bac08f7ce200000000           movabs     rdx, 0xe27c8fc0
02592 488bca                         mov        rcx, rdx
02595 49b8783a79e0757f0000           movabs     r8, 0x7f75e0793a78
0259f 488b09                         mov        rcx, qword ptr [rcx]
025a2 48c1e92a                       shr        rcx, 0x2a
025a6 48c1e109                       shl        rcx, 9
025aa 41ba00000016                   mov        r10d, 0x16000000
025b0 4903ca                         add        rcx, r10
025b3 41ba24000000                   mov        r10d, 0x24
025b9 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
025bd 7435                           je         0x7f75e83ef174
025bf 4983c202                       add        r10, 2
025c3 4983fa28                       cmp        r10, 0x28
025c7 75f0                           jne        0x7f75e83ef139
025c9 41ba24000000                   mov        r10d, 0x24
025cf 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
025d4 7412                           je         0x7f75e83ef168
025d6 4983c202                       add        r10, 2
025da 4983fa28                       cmp        r10, 0x28
025de 75ef                           jne        0x7f75e83ef14f
025e0 41ba23000000                   mov        r10d, 0x23
025e6 eb10                           jmp        0x7f75e83ef178
025e8 50                             push       rax
025e9 4833c0                         xor        rax, rax
025ec 4b0fb10cd0                     cmpxchg    qword ptr [r8 + r10*8], rcx
025f1 58                             pop        rax
025f2 ebbf                           jmp        0x7f75e83ef133
025f4 4983c201                       add        r10, 1
025f8 4b8304d001                     add        qword ptr [r8 + r10*8], 1
025fd 48b9c81f79e0757f0000           movabs     rcx, 0x7f75e0791fc8
02607 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
0260b 4183c002                       add        r8d, 2
0260f 44894170                       mov        dword ptr [rcx + 0x70], r8d
02613 4181e0feff1f00                 and        r8d, 0x1ffffe
0261a 4585c0                         test       r8d, r8d
0261d 0f8423230000                   je         0x7f75e83f14c6
02623 48b9c81f79e0757f0000           movabs     rcx, 0x7f75e0791fc8
0262d 488381a800000001               add        qword ptr [rcx + 0xa8], 1
02635 48baf02079e0757f0000           movabs     rdx, 0x7f75e07920f0
0263f 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02642 83c102                         add        ecx, 2
02645 894a70                         mov        dword ptr [rdx + 0x70], ecx
02648 81e1feff1f00                   and        ecx, 0x1ffffe
0264e 85c9                           test       ecx, ecx
02650 0f8411230000                   je         0x7f75e83f14e7
02656 48baf02079e0757f0000           movabs     rdx, 0x7f75e07920f0
02660 ff82b8000000                   inc        dword ptr [rdx + 0xb8]
02666 4489ac24e8010000               mov        dword ptr [rsp + 0x1e8], r13d
0266e 89bc24e4010000                 mov        dword ptr [rsp + 0x1e4], edi
02675 48baa8607ee200000000           movabs     rdx, 0xe27e60a8
0267f 488bca                         mov        rcx, rdx
02682 49b8783a79e0757f0000           movabs     r8, 0x7f75e0793a78
0268c 48b90000151600000000           movabs     rcx, 0x16150000
02696 41ba2a000000                   mov        r10d, 0x2a
0269c 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
026a0 7435                           je         0x7f75e83ef257
026a2 4983c202                       add        r10, 2
026a6 4983fa2e                       cmp        r10, 0x2e
026aa 75f0                           jne        0x7f75e83ef21c
026ac 41ba2a000000                   mov        r10d, 0x2a
026b2 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
026b7 7412                           je         0x7f75e83ef24b
026b9 4983c202                       add        r10, 2
026bd 4983fa2e                       cmp        r10, 0x2e
026c1 75ef                           jne        0x7f75e83ef232
026c3 41ba29000000                   mov        r10d, 0x29
026c9 eb10                           jmp        0x7f75e83ef25b
026cb 50                             push       rax
026cc 4833c0                         xor        rax, rax
026cf 4b0fb10cd0                     cmpxchg    qword ptr [r8 + r10*8], rcx
026d4 58                             pop        rax
026d5 ebbf                           jmp        0x7f75e83ef216
026d7 4983c201                       add        r10, 1
026db 4b8304d001                     add        qword ptr [r8 + r10*8], 1
026e0 48b9403c79e0757f0000           movabs     rcx, 0x7f75e0793c40
026ea 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
026ee 4183c002                       add        r8d, 2
026f2 44894170                       mov        dword ptr [rcx + 0x70], r8d
026f6 4181e0feff1f00                 and        r8d, 0x1ffffe
026fd 4585c0                         test       r8d, r8d
02700 0f8482220000                   je         0x7f75e83f1508
02706 488bca                         mov        rcx, rdx
02709 49b8403c79e0757f0000           movabs     r8, 0x7f75e0793c40
02713 498380a800000001               add        qword ptr [r8 + 0xa8], 1
0271b 48b9203d79e0757f0000           movabs     rcx, 0x7f75e0793d20
02725 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
02729 4183c002                       add        r8d, 2
0272d 44894170                       mov        dword ptr [rcx + 0x70], r8d
02731 4181e0feff1f00                 and        r8d, 0x1ffffe
02738 4585c0                         test       r8d, r8d
0273b 0f8468220000                   je         0x7f75e83f1529
02741 48b9203d79e0757f0000           movabs     rcx, 0x7f75e0793d20
0274b 48ba0000151600000000           movabs     rdx, 0x16150000
02755 41ba16000000                   mov        r10d, 0x16
0275b 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0275f 7435                           je         0x7f75e83ef316
02761 4983c202                       add        r10, 2
02765 4983fa1a                       cmp        r10, 0x1a
02769 75f0                           jne        0x7f75e83ef2db
0276b 41ba16000000                   mov        r10d, 0x16
02771 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02776 7412                           je         0x7f75e83ef30a
02778 4983c202                       add        r10, 2
0277c 4983fa1a                       cmp        r10, 0x1a
02780 75ef                           jne        0x7f75e83ef2f1
02782 41ba15000000                   mov        r10d, 0x15
02788 eb10                           jmp        0x7f75e83ef31a
0278a 50                             push       rax
0278b 4833c0                         xor        rax, rax
0278e 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
02793 58                             pop        rax
02794 ebbf                           jmp        0x7f75e83ef2d5
02796 4983c201                       add        r10, 1
0279a 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0279f 48ba702979e0757f0000           movabs     rdx, 0x7f75e0792970
027a9 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
027ac 83c102                         add        ecx, 2
027af 894a70                         mov        dword ptr [rdx + 0x70], ecx
027b2 81e1feff1f00                   and        ecx, 0x1ffffe
027b8 85c9                           test       ecx, ecx
027ba 0f840a220000                   je         0x7f75e83f154a
027c0 48bac08f7ce200000000           movabs     rdx, 0xe27c8fc0
027ca 488bca                         mov        rcx, rdx
027cd 49b8203d79e0757f0000           movabs     r8, 0x7f75e0793d20
027d7 488b09                         mov        rcx, qword ptr [rcx]
027da 48c1e92a                       shr        rcx, 0x2a
027de 48c1e109                       shl        rcx, 9
027e2 41ba00000016                   mov        r10d, 0x16000000
027e8 4903ca                         add        rcx, r10
027eb 41ba1c000000                   mov        r10d, 0x1c
027f1 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
027f5 7435                           je         0x7f75e83ef3ac
027f7 4983c202                       add        r10, 2
027fb 4983fa20                       cmp        r10, 0x20
027ff 75f0                           jne        0x7f75e83ef371
02801 41ba1c000000                   mov        r10d, 0x1c
02807 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
0280c 7412                           je         0x7f75e83ef3a0
0280e 4983c202                       add        r10, 2
02812 4983fa20                       cmp        r10, 0x20
02816 75ef                           jne        0x7f75e83ef387
02818 41ba1b000000                   mov        r10d, 0x1b
0281e eb10                           jmp        0x7f75e83ef3b0
02820 50                             push       rax
02821 4833c0                         xor        rax, rax
02824 4b0fb10cd0                     cmpxchg    qword ptr [r8 + r10*8], rcx
02829 58                             pop        rax
0282a ebbf                           jmp        0x7f75e83ef36b
0282c 4983c201                       add        r10, 1
02830 4b8304d001                     add        qword ptr [r8 + r10*8], 1
02835 48b9203d79e0757f0000           movabs     rcx, 0x7f75e0793d20
0283f 488b12                         mov        rdx, qword ptr [rdx]
02842 48c1ea2a                       shr        rdx, 0x2a
02846 48c1e209                       shl        rdx, 9
0284a 41ba00000016                   mov        r10d, 0x16000000
02850 4903d2                         add        rdx, r10
02853 41ba22000000                   mov        r10d, 0x22
02859 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0285d 7435                           je         0x7f75e83ef414
0285f 4983c202                       add        r10, 2
02863 4983fa26                       cmp        r10, 0x26
02867 75f0                           jne        0x7f75e83ef3d9
02869 41ba22000000                   mov        r10d, 0x22
0286f 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02874 7412                           je         0x7f75e83ef408
02876 4983c202                       add        r10, 2
0287a 4983fa26                       cmp        r10, 0x26
0287e 75ef                           jne        0x7f75e83ef3ef
02880 41ba21000000                   mov        r10d, 0x21
02886 eb10                           jmp        0x7f75e83ef418
02888 50                             push       rax
02889 4833c0                         xor        rax, rax
0288c 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
02891 58                             pop        rax
02892 ebbf                           jmp        0x7f75e83ef3d3
02894 4983c201                       add        r10, 1
02898 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0289d 48ba203d79e0757f0000           movabs     rdx, 0x7f75e0793d20
028a7 4883823801000001               add        qword ptr [rdx + 0x138], 1
028af 48ba302a79e0757f0000           movabs     rdx, 0x7f75e0792a30
028b9 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
028bc 83c102                         add        ecx, 2
028bf 894a70                         mov        dword ptr [rdx + 0x70], ecx
028c2 81e1feff1f00                   and        ecx, 0x1ffffe
028c8 85c9                           test       ecx, ecx
028ca 0f841b210000                   je         0x7f75e83f156b
028d0 48ba203d79e0757f0000           movabs     rdx, 0x7f75e0793d20
028da 4883824801000001               add        qword ptr [rdx + 0x148], 1
028e2 4c63f6                         movsxd     r14, esi
028e5 be0c000000                     mov        esi, 0xc
028ea 4d8bce                         mov        r9, r14
028ed 4c03ce                         add        r9, rsi
028f0 48be100579e0757f0000           movabs     rsi, 0x7f75e0790510
028fa 8b5670                         mov        edx, dword ptr [rsi + 0x70]
028fd 83c202                         add        edx, 2
02900 895670                         mov        dword ptr [rsi + 0x70], edx
02903 81e2feff1f00                   and        edx, 0x1ffffe
02909 85d2                           test       edx, edx
0290b 0f84fb200000                   je         0x7f75e83f158c
02911 48be100579e0757f0000           movabs     rsi, 0x7f75e0790510
0291b 488386d800000001               add        qword ptr [rsi + 0xd8], 1
02923 48be880679e0757f0000           movabs     rsi, 0x7f75e0790688
0292d 8b5670                         mov        edx, dword ptr [rsi + 0x70]
02930 83c202                         add        edx, 2
02933 895670                         mov        dword ptr [rsi + 0x70], edx
02936 81e2feff1f00                   and        edx, 0x1ffffe
0293c 85d2                           test       edx, edx
0293e 0f84e9200000                   je         0x7f75e83f15ad
02944 48be203d79e0757f0000           movabs     rsi, 0x7f75e0793d20
0294e 488db658010000                 lea        rsi, [rsi + 0x158]
02955 48ba785b7fe200000000           movabs     rdx, 0xe27f5b78
0295f 48ba0058151600000000           movabs     rdx, 0x16155800
02969 4c8bd2                         mov        r10, rdx
0296c 483316                         xor        rdx, qword ptr [rsi]
0296f 48f7c2fcffffff                 test       rdx, -4
02976 7426                           je         0x7f75e83ef51e
02978 f6c202                         test       dl, 2
0297b 7521                           jne        0x7f75e83ef51e
0297d 48f706feffffff                 test       qword ptr [rsi], -2
02984 7415                           je         0x7f75e83ef51b
02986 498bd2                         mov        rdx, r10
02989 483316                         xor        rdx, qword ptr [rsi]
0298c 48f7c2fcffffff                 test       rdx, -4
02993 7409                           je         0x7f75e83ef51e
02995 48830e02                       or         qword ptr [rsi], 2
02999 eb03                           jmp        0x7f75e83ef51e
0299b 488916                         mov        qword ptr [rsi], rdx
0299e 48be203d79e0757f0000           movabs     rsi, 0x7f75e0793d20
029a8 4883866801000001               add        qword ptr [rsi + 0x168], 1
029b0 48be08907ce200000000           movabs     rsi, 0xe27c9008
029ba ba02000000                     mov        edx, 2
029bf b910000000                     mov        ecx, 0x10
029c4 4c8bc0                         mov        r8, rax
029c7 bf00000000                     mov        edi, 0
029cc 48890424                       mov        qword ptr [rsp], rax
029d0 4c89742408                     mov        qword ptr [rsp + 8], r14
029d5 49bac08f7ce200000000           movabs     r10, 0xe27c8fc0
029df 4c89542410                     mov        qword ptr [rsp + 0x10], r10
029e4 49ba785b7fe200000000           movabs     r10, 0xe27f5b78
029ee 4c89542418                     mov        qword ptr [rsp + 0x18], r10
029f3 0f1f4000                       nop        dword ptr [rax]
029f7 e8e4125207                     call       0x7f75ef910860
029fc 0f1f8400f42a000e               nop        dword ptr [rax + rax + 0xe002af4]
02a04 4885c0                         test       rax, rax
02a07 48bb203d79e0757f0000           movabs     rbx, 0x7f75e0793d20
02a11 750c                           jne        0x7f75e83ef59f
02a13 808b7101000001                 or         byte ptr [rbx + 0x171], 1
02a1a e98b000000                     jmp        0x7f75e83ef62a
02a1f 488b38                         mov        rdi, qword ptr [rax]
02a22 48c1ef2a                       shr        rdi, 0x2a
02a26 48c1e709                       shl        rdi, 9
02a2a 41ba00000016                   mov        r10d, 0x16000000
02a30 4903fa                         add        rdi, r10
02a33 41ba30000000                   mov        r10d, 0x30
02a39 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
02a3d 7435                           je         0x7f75e83ef5f4
02a3f 4983c202                       add        r10, 2
02a43 4983fa34                       cmp        r10, 0x34
02a47 75f0                           jne        0x7f75e83ef5b9
02a49 41ba30000000                   mov        r10d, 0x30
02a4f 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02a54 7412                           je         0x7f75e83ef5e8
02a56 4983c202                       add        r10, 2
02a5a 4983fa34                       cmp        r10, 0x34
02a5e 75ef                           jne        0x7f75e83ef5cf
02a60 41ba2f000000                   mov        r10d, 0x2f
02a66 eb10                           jmp        0x7f75e83ef5f8
02a68 50                             push       rax
02a69 4833c0                         xor        rax, rax
02a6c 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
02a71 58                             pop        rax
02a72 ebbf                           jmp        0x7f75e83ef5b3
02a74 4983c201                       add        r10, 1
02a78 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02a7d 48bf0006141600000000           movabs     rdi, 0x16140600
02a87 488b18                         mov        rbx, qword ptr [rax]
02a8a 48c1eb2a                       shr        rbx, 0x2a
02a8e 48c1e309                       shl        rbx, 9
02a92 41ba00000016                   mov        r10d, 0x16000000
02a98 4903da                         add        rbx, r10
02a9b 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
02a9f 0f85a91f0000                   jne        0x7f75e83f15ce
02aa5 e900000000                     jmp        0x7f75e83ef62a
02aaa 488bf8                         mov        rdi, rax
02aad 4889bc24f8010000               mov        qword ptr [rsp + 0x1f8], rdi
02ab5 483b07                         cmp        rax, qword ptr [rdi]
02ab8 488bf7                         mov        rsi, rdi
02abb 48bb701472e0757f0000           movabs     rbx, 0x7f75e0721470
02ac5 488b36                         mov        rsi, qword ptr [rsi]
02ac8 48c1ee2a                       shr        rsi, 0x2a
02acc 48c1e609                       shl        rsi, 9
02ad0 41ba00000016                   mov        r10d, 0x16000000
02ad6 4903f2                         add        rsi, r10
02ad9 41bae3000000                   mov        r10d, 0xe3
02adf 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02ae3 743b                           je         0x7f75e83ef6a0
02ae5 4983c202                       add        r10, 2
02ae9 4981fae7000000                 cmp        r10, 0xe7
02af0 75ed                           jne        0x7f75e83ef65f
02af2 41bae3000000                   mov        r10d, 0xe3
02af8 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02afd 7415                           je         0x7f75e83ef694
02aff 4983c202                       add        r10, 2
02b03 4981fae7000000                 cmp        r10, 0xe7
02b0a 75ec                           jne        0x7f75e83ef678
02b0c 41bae2000000                   mov        r10d, 0xe2
02b12 eb10                           jmp        0x7f75e83ef6a4
02b14 50                             push       rax
02b15 4833c0                         xor        rax, rax
02b18 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
02b1d 58                             pop        rax
02b1e ebb9                           jmp        0x7f75e83ef659
02b20 4983c201                       add        r10, 1
02b24 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02b29 48bee84079e0757f0000           movabs     rsi, 0x7f75e07940e8
02b33 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
02b36 83c302                         add        ebx, 2
02b39 895e70                         mov        dword ptr [rsi + 0x70], ebx
02b3c 81e3feff1f00                   and        ebx, 0x1ffffe
02b42 85db                           test       ebx, ebx
02b44 0f84121f0000                   je         0x7f75e83f15dc
02b4a 488bf7                         mov        rsi, rdi
02b4d 48bbe84079e0757f0000           movabs     rbx, 0x7f75e07940e8
02b57 488b36                         mov        rsi, qword ptr [rsi]
02b5a 48c1ee2a                       shr        rsi, 0x2a
02b5e 48c1e609                       shl        rsi, 9
02b62 41ba00000016                   mov        r10d, 0x16000000
02b68 4903f2                         add        rsi, r10
02b6b 41ba16000000                   mov        r10d, 0x16
02b71 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02b75 7435                           je         0x7f75e83ef72c
02b77 4983c202                       add        r10, 2
02b7b 4983fa1a                       cmp        r10, 0x1a
02b7f 75f0                           jne        0x7f75e83ef6f1
02b81 41ba16000000                   mov        r10d, 0x16
02b87 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02b8c 7412                           je         0x7f75e83ef720
02b8e 4983c202                       add        r10, 2
02b92 4983fa1a                       cmp        r10, 0x1a
02b96 75ef                           jne        0x7f75e83ef707
02b98 41ba15000000                   mov        r10d, 0x15
02b9e eb10                           jmp        0x7f75e83ef730
02ba0 50                             push       rax
02ba1 4833c0                         xor        rax, rax
02ba4 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
02ba9 58                             pop        rax
02baa ebbf                           jmp        0x7f75e83ef6eb
02bac 4983c201                       add        r10, 1
02bb0 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02bb5 488bf7                         mov        rsi, rdi
02bb8 0f1f440000                     nop        dword ptr [rax + rax]
02bbd 48b8509539c0757f0000           movabs     rax, 0x7f75c0399550
02bc7 e8140c5207                     call       0x7f75ef910360
02bcc 0f1f8400c42c000f               nop        dword ptr [rax + rax + 0xf002cc4]
02bd4 48bee84079e0757f0000           movabs     rsi, 0x7f75e07940e8
02bde 488386d800000001               add        qword ptr [rsi + 0xd8], 1
02be6 48bef82779e0757f0000           movabs     rsi, 0x7f75e07927f8
02bf0 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
02bf3 83c702                         add        edi, 2
02bf6 897e70                         mov        dword ptr [rsi + 0x70], edi
02bf9 81e7feff1f00                   and        edi, 0x1ffffe
02bff 85ff                           test       edi, edi
02c01 0f84761e0000                   je         0x7f75e83f15fd
02c07 448bac24e8010000               mov        r13d, dword ptr [rsp + 0x1e8]
02c0f 8bbc24ec010000                 mov        edi, dword ptr [rsp + 0x1ec]
02c16 48bef82779e0757f0000           movabs     rsi, 0x7f75e07927f8
02c20 4883860801000001               add        qword ptr [rsi + 0x108], 1
02c28 ffc8                           dec        eax
02c2a 442be8                         sub        r13d, eax
02c2d 48bec81e79e0757f0000           movabs     rsi, 0x7f75e0791ec8
02c37 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
02c3a 83c302                         add        ebx, 2
02c3d 895e70                         mov        dword ptr [rsi + 0x70], ebx
02c40 81e3feff1f00                   and        ebx, 0x1ffffe
02c46 85db                           test       ebx, ebx
02c48 0f84501e0000                   je         0x7f75e83f161e
02c4e 48bec81e79e0757f0000           movabs     rsi, 0x7f75e0791ec8
02c58 488386a800000001               add        qword ptr [rsi + 0xa8], 1
02c60 48be0000000000000000           movabs     rsi, 0
02c6a be00000000                     mov        esi, 0
02c6f 3bfe                           cmp        edi, esi
02c71 0f8c481e0000                   jl         0x7f75e83f163f
02c77 413bfd                         cmp        edi, r13d
02c7a 0f8d4c1e0000                   jge        0x7f75e83f164c
02c80 488bc7                         mov        rax, rdi
02c83 898424f4010000                 mov        dword ptr [rsp + 0x1f4], eax
02c8a 89bc24ec010000                 mov        dword ptr [rsp + 0x1ec], edi
02c91 488bbc24f8010000               mov        rdi, qword ptr [rsp + 0x1f8]
02c99 488bf7                         mov        rsi, rdi
02c9c 48b9e84079e0757f0000           movabs     rcx, 0x7f75e07940e8
02ca6 488b36                         mov        rsi, qword ptr [rsi]
02ca9 48c1ee2a                       shr        rsi, 0x2a
02cad 48c1e609                       shl        rsi, 9
02cb1 41ba00000016                   mov        r10d, 0x16000000
02cb7 4903f2                         add        rsi, r10
02cba 41ba1e000000                   mov        r10d, 0x1e
02cc0 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
02cc4 7435                           je         0x7f75e83ef87b
02cc6 4983c202                       add        r10, 2
02cca 4983fa22                       cmp        r10, 0x22
02cce 75f0                           jne        0x7f75e83ef840
02cd0 41ba1e000000                   mov        r10d, 0x1e
02cd6 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02cdb 7412                           je         0x7f75e83ef86f
02cdd 4983c202                       add        r10, 2
02ce1 4983fa22                       cmp        r10, 0x22
02ce5 75ef                           jne        0x7f75e83ef856
02ce7 41ba1d000000                   mov        r10d, 0x1d
02ced eb10                           jmp        0x7f75e83ef87f
02cef 50                             push       rax
02cf0 4833c0                         xor        rax, rax
02cf3 4a0fb134d1                     cmpxchg    qword ptr [rcx + r10*8], rsi
02cf8 58                             pop        rax
02cf9 ebbf                           jmp        0x7f75e83ef83a
02cfb 4983c201                       add        r10, 1
02cff 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02d04 488bf7                         mov        rsi, rdi
02d07 660f1f440000                   nop        word ptr [rax + rax]
02d0d 48b8789539c0757f0000           movabs     rax, 0x7f75c0399578
02d17 e8c40a5207                     call       0x7f75ef910360
02d1c 0f1f8400142e0010               nop        dword ptr [rax + rax + 0x10002e14]
02d24 483b00                         cmp        rax, qword ptr [rax]
02d27 488bf0                         mov        rsi, rax
02d2a 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
02d34 488b36                         mov        rsi, qword ptr [rsi]
02d37 48c1ee2a                       shr        rsi, 0x2a
02d3b 48c1e609                       shl        rsi, 9
02d3f 41ba00000016                   mov        r10d, 0x16000000
02d45 4903f2                         add        rsi, r10
02d48 41ba24000000                   mov        r10d, 0x24
02d4e 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02d52 7435                           je         0x7f75e83ef909
02d54 4983c202                       add        r10, 2
02d58 4983fa28                       cmp        r10, 0x28
02d5c 75f0                           jne        0x7f75e83ef8ce
02d5e 41ba24000000                   mov        r10d, 0x24
02d64 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02d69 7412                           je         0x7f75e83ef8fd
02d6b 4983c202                       add        r10, 2
02d6f 4983fa28                       cmp        r10, 0x28
02d73 75ef                           jne        0x7f75e83ef8e4
02d75 41ba23000000                   mov        r10d, 0x23
02d7b eb10                           jmp        0x7f75e83ef90d
02d7d 50                             push       rax
02d7e 4833c0                         xor        rax, rax
02d81 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
02d86 58                             pop        rax
02d87 ebbf                           jmp        0x7f75e83ef8c8
02d89 4983c201                       add        r10, 1
02d8d 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02d92 8b7028                         mov        esi, dword ptr [rax + 0x28]
02d95 488bd0                         mov        rdx, rax
02d98 48b9e84079e0757f0000           movabs     rcx, 0x7f75e07940e8
02da2 488b12                         mov        rdx, qword ptr [rdx]
02da5 48c1ea2a                       shr        rdx, 0x2a
02da9 48c1e209                       shl        rdx, 9
02dad 41ba00000016                   mov        r10d, 0x16000000
02db3 4903d2                         add        rdx, r10
02db6 41ba2a000000                   mov        r10d, 0x2a
02dbc 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02dc0 7435                           je         0x7f75e83ef977
02dc2 4983c202                       add        r10, 2
02dc6 4983fa2e                       cmp        r10, 0x2e
02dca 75f0                           jne        0x7f75e83ef93c
02dcc 41ba2a000000                   mov        r10d, 0x2a
02dd2 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02dd7 7412                           je         0x7f75e83ef96b
02dd9 4983c202                       add        r10, 2
02ddd 4983fa2e                       cmp        r10, 0x2e
02de1 75ef                           jne        0x7f75e83ef952
02de3 41ba29000000                   mov        r10d, 0x29
02de9 eb10                           jmp        0x7f75e83ef97b
02deb 50                             push       rax
02dec 4833c0                         xor        rax, rax
02def 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
02df4 58                             pop        rax
02df5 ebbf                           jmp        0x7f75e83ef936
02df7 4983c201                       add        r10, 1
02dfb 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02e00 8b4808                         mov        ecx, dword ptr [rax + 8]
02e03 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
02e0d 4883827801000001               add        qword ptr [rdx + 0x178], 1
02e15 48ba302a79e0757f0000           movabs     rdx, 0x7f75e0792a30
02e1f 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02e23 4183c002                       add        r8d, 2
02e27 44894270                       mov        dword ptr [rdx + 0x70], r8d
02e2b 4181e0feff1f00                 and        r8d, 0x1ffffe
02e32 4585c0                         test       r8d, r8d
02e35 0f84a31c0000                   je         0x7f75e83f165e
02e3b 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
02e45 4883828801000001               add        qword ptr [rdx + 0x188], 1
02e4d 8b8424f4010000                 mov        eax, dword ptr [rsp + 0x1f4]
02e54 4863c0                         movsxd     rax, eax
02e57 ba0c000000                     mov        edx, 0xc
02e5c 4c8bc8                         mov        r9, rax
02e5f 4c03ca                         add        r9, rdx
02e62 48ba100579e0757f0000           movabs     rdx, 0x7f75e0790510
02e6c 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02e70 4183c002                       add        r8d, 2
02e74 44894270                       mov        dword ptr [rdx + 0x70], r8d
02e78 4181e0feff1f00                 and        r8d, 0x1ffffe
02e7f 4585c0                         test       r8d, r8d
02e82 0f84771c0000                   je         0x7f75e83f167f
02e88 48ba100579e0757f0000           movabs     rdx, 0x7f75e0790510
02e92 488382d800000001               add        qword ptr [rdx + 0xd8], 1
02e9a 48ba880679e0757f0000           movabs     rdx, 0x7f75e0790688
02ea4 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02ea8 4183c002                       add        r8d, 2
02eac 44894270                       mov        dword ptr [rdx + 0x70], r8d
02eb0 4181e0feff1f00                 and        r8d, 0x1ffffe
02eb7 4585c0                         test       r8d, r8d
02eba 0f84601c0000                   je         0x7f75e83f16a0
02ec0 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
02eca 488d9298010000                 lea        rdx, [rdx + 0x198]
02ed1 49b8203c81e200000000           movabs     r8, 0xe2813c20
02edb 49b80068151600000000           movabs     r8, 0x16156800
02ee5 4d8bd0                         mov        r10, r8
02ee8 4c3302                         xor        r8, qword ptr [rdx]
02eeb 49f7c0fcffffff                 test       r8, -4
02ef2 7427                           je         0x7f75e83efa9b
02ef4 41f6c002                       test       r8b, 2
02ef8 7521                           jne        0x7f75e83efa9b
02efa 48f702feffffff                 test       qword ptr [rdx], -2
02f01 7415                           je         0x7f75e83efa98
02f03 4d8bc2                         mov        r8, r10
02f06 4c3302                         xor        r8, qword ptr [rdx]
02f09 49f7c0fcffffff                 test       r8, -4
02f10 7409                           je         0x7f75e83efa9b
02f12 48830a02                       or         qword ptr [rdx], 2
02f16 eb03                           jmp        0x7f75e83efa9b
02f18 4c8902                         mov        qword ptr [rdx], r8
02f1b 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
02f25 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
02f2d ba02000000                     mov        edx, 2
02f32 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
02f3a bf00000000                     mov        edi, 0
02f3f 488b9c24f8010000               mov        rbx, qword ptr [rsp + 0x1f8]
02f47 48891c24                       mov        qword ptr [rsp], rbx
02f4b 488b9c2438010000               mov        rbx, qword ptr [rsp + 0x138]
02f53 48895c2408                     mov        qword ptr [rsp + 8], rbx
02f58 4889442410                     mov        qword ptr [rsp + 0x10], rax
02f5d 49ba203c81e200000000           movabs     r10, 0xe2813c20
02f67 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02f6c 666690                         nop        
02f6f e86c0d5207                     call       0x7f75ef910860
02f74 0f1f84006c300011               nop        dword ptr [rax + rax + 0x1100306c]
02f7c 8b8424ec010000                 mov        eax, dword ptr [rsp + 0x1ec]
02f83 83c010                         add        eax, 0x10
02f86 8bbc24e4010000                 mov        edi, dword ptr [rsp + 0x1e4]
02f8d 83c710                         add        edi, 0x10
02f90 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02f97 ba02000000                     mov        edx, 2
02f9c 7c05                           jl         0x7f75e83efb23
02f9e ba00000000                     mov        edx, 0
02fa3 48b9701472e0757f0000           movabs     rcx, 0x7f75e0721470
02fad 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
02fb1 4403c2                         add        r8d, edx
02fb4 44894174                       mov        dword ptr [rcx + 0x74], r8d
02fb8 85d2                           test       edx, edx
02fba 7506                           jne        0x7f75e83efb42
02fbc 41b802000000                   mov        r8d, 2
02fc2 4181e0fe3f0000                 and        r8d, 0x3ffe
02fc9 4585c0                         test       r8d, r8d
02fcc 0f846f1b0000                   je         0x7f75e83f16c1
02fd2 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02fd6 418502                         test       dword ptr [r10], eax
02fd9 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02fe0 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
02fea b940070000                     mov        ecx, 0x740
02fef 7c05                           jl         0x7f75e83efb76
02ff1 b950070000                     mov        ecx, 0x750
02ff6 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
02ffa 4d8d4001                       lea        r8, [r8 + 1]
02ffe 4c89040a                       mov        qword ptr [rdx + rcx], r8
03002 0f8c28f4ffff                   jl         0x7f75e83eefb0
03008 8b9c24f0010000                 mov        ebx, dword ptr [rsp + 0x1f0]
0300f 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
03019 ff8260070000                   inc        dword ptr [rdx + 0x760]
0301f e9c20d0000                     jmp        0x7f75e83f0966
03024 4183f908                       cmp        r9d, 8
03028 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
03032 b978070000                     mov        ecx, 0x778
03037 7c05                           jl         0x7f75e83efbbe
03039 b988070000                     mov        ecx, 0x788
0303e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
03042 4d8d4001                       lea        r8, [r8 + 1]
03046 4c89040a                       mov        qword ptr [rdx + rcx], r8
0304a 0f8cfe010000                   jl         0x7f75e83efdce
03050 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
03057 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
0305e 899c2408020000                 mov        dword ptr [rsp + 0x208], ebx
03065 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
0306c 0f1f4000                       nop        dword ptr [rax]
03070 89842400020000                 mov        dword ptr [rsp + 0x200], eax
03077 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0307f 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
03089 4883829807000001               add        qword ptr [rdx + 0x798], 1
03091 48ba585972e0757f0000           movabs     rdx, 0x7f75e0725958
0309b 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0309e 83c102                         add        ecx, 2
030a1 894a70                         mov        dword ptr [rdx + 0x70], ecx
030a4 81e1feff1f00                   and        ecx, 0x1ffffe
030aa 85c9                           test       ecx, ecx
030ac 0f84b01a0000                   je         0x7f75e83f16e2
030b2 660f1f440000                   nop        word ptr [rax + rax]
030b8 e9d51a0000                     jmp        0x7f75e83f1712
030bd 90                             nop        
030be 90                             nop        
030bf 90                             nop        
030c0 90                             nop        
030c1 90                             nop        
030c2 48ba585972e0757f0000           movabs     rdx, 0x7f75e0725958
030cc 488d92d8000000                 lea        rdx, [rdx + 0xd8]
030d3 4885c0                         test       rax, rax
030d6 750c                           jne        0x7f75e83efc64
030d8 f6420801                       test       byte ptr [rdx + 8], 1
030dc 7506                           jne        0x7f75e83efc64
030de f048834a0801                   lock or    qword ptr [rdx + 8], 1
030e4 48bee00977e200000000           movabs     rsi, 0xe27709e0
030ee 488bd6                         mov        rdx, rsi
030f1 48b9585972e0757f0000           movabs     rcx, 0x7f75e0725958
030fb 488b12                         mov        rdx, qword ptr [rdx]
030fe 48c1ea2a                       shr        rdx, 0x2a
03102 48c1e209                       shl        rdx, 9
03106 41ba00000016                   mov        r10d, 0x16000000
0310c 4903d2                         add        rdx, r10
0310f 41ba16000000                   mov        r10d, 0x16
03115 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03119 7435                           je         0x7f75e83efcd0
0311b 4983c202                       add        r10, 2
0311f 4983fa1a                       cmp        r10, 0x1a
03123 75f0                           jne        0x7f75e83efc95
03125 41ba16000000                   mov        r10d, 0x16
0312b 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03130 7412                           je         0x7f75e83efcc4
03132 4983c202                       add        r10, 2
03136 4983fa1a                       cmp        r10, 0x1a
0313a 75ef                           jne        0x7f75e83efcab
0313c 41ba15000000                   mov        r10d, 0x15
03142 eb10                           jmp        0x7f75e83efcd4
03144 50                             push       rax
03145 4833c0                         xor        rax, rax
03148 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
0314d 58                             pop        rax
0314e ebbf                           jmp        0x7f75e83efc8f
03150 4983c201                       add        r10, 1
03154 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03159 488bd0                         mov        rdx, rax
0315c 488bcf                         mov        rcx, rdi
0315f 89bc2404020000                 mov        dword ptr [rsp + 0x204], edi
03166 90                             nop        
03167 e874015207                     call       0x7f75ef90fe60
0316c 0f1f840064320013               nop        dword ptr [rax + rax + 0x13003264]
03174 48be701472e0757f0000           movabs     rsi, 0x7f75e0721470
0317e 488386a807000001               add        qword ptr [rsi + 0x7a8], 1
03186 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
0318e 8b942400020000                 mov        edx, dword ptr [rsp + 0x200]
03195 488bc8                         mov        rcx, rax
03198 0f1f8000000000                 nop        dword ptr [rax]
0319f e83c0b5207                     call       0x7f75ef910860
031a4 0f1f84009c320014               nop        dword ptr [rax + rax + 0x1400329c]
031ac 8b842400020000                 mov        eax, dword ptr [rsp + 0x200]
031b3 83c008                         add        eax, 8
031b6 8bbc2404020000                 mov        edi, dword ptr [rsp + 0x204]
031bd 83c708                         add        edi, 8
031c0 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
031c7 be02000000                     mov        esi, 2
031cc 7c05                           jl         0x7f75e83efd53
031ce be00000000                     mov        esi, 0
031d3 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
031dd 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
031e0 03ce                           add        ecx, esi
031e2 894a74                         mov        dword ptr [rdx + 0x74], ecx
031e5 85f6                           test       esi, esi
031e7 7505                           jne        0x7f75e83efd6e
031e9 b902000000                     mov        ecx, 2
031ee 81e1fe3f0000                   and        ecx, 0x3ffe
031f4 85c9                           test       ecx, ecx
031f6 0f84a0190000                   je         0x7f75e83f171c
031fc 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03200 418502                         test       dword ptr [r10], eax
03203 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
0320a 48be701472e0757f0000           movabs     rsi, 0x7f75e0721470
03214 bab8070000                     mov        edx, 0x7b8
03219 7c05                           jl         0x7f75e83efda0
0321b bac8070000                     mov        edx, 0x7c8
03220 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
03224 488d4901                       lea        rcx, [rcx + 1]
03228 48890c16                       mov        qword ptr [rsi + rdx], rcx
0322c 0f8c3efeffff                   jl         0x7f75e83efbf0
03232 8b9c2408020000                 mov        ebx, dword ptr [rsp + 0x208]
03239 48be701472e0757f0000           movabs     rsi, 0x7f75e0721470
03243 ff86d8070000                   inc        dword ptr [rsi + 0x7d8]
03249 e9980b0000                     jmp        0x7f75e83f0966
0324e 48be701472e0757f0000           movabs     rsi, 0x7f75e0721470
03258 488386f007000001               add        qword ptr [rsi + 0x7f0], 1
03260 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
03268 8b9424d0010000                 mov        edx, dword ptr [rsp + 0x1d0]
0326f 488bcf                         mov        rcx, rdi
03272 4d8bc1                         mov        r8, r9
03275 448b8c2478010000               mov        r9d, dword ptr [rsp + 0x178]
0327d 6690                           nop        
0327f e85c0a5207                     call       0x7f75ef910860
03284 0f1f84007c330016               nop        dword ptr [rax + rax + 0x1600337c]
0328c 488bd8                         mov        rbx, rax
0328f e9520b0000                     jmp        0x7f75e83f0966
03294 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
0329b 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
032a2 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
032aa 48be701472e0757f0000           movabs     rsi, 0x7f75e0721470
032b4 488386c805000001               add        qword ptr [rsi + 0x5c8], 1
032bc 48be783a79e0757f0000           movabs     rsi, 0x7f75e0793a78
032c6 8b5670                         mov        edx, dword ptr [rsi + 0x70]
032c9 83c202                         add        edx, 2
032cc 895670                         mov        dword ptr [rsi + 0x70], edx
032cf 81e2feff1f00                   and        edx, 0x1ffffe
032d5 85d2                           test       edx, edx
032d7 0f84e0180000                   je         0x7f75e83f173d
032dd 48bec08f7ce200000000           movabs     rsi, 0xe27c8fc0
032e7 48ba783a79e0757f0000           movabs     rdx, 0x7f75e0793a78
032f1 488b36                         mov        rsi, qword ptr [rsi]
032f4 48c1ee2a                       shr        rsi, 0x2a
032f8 48c1e609                       shl        rsi, 9
032fc 41ba00000016                   mov        r10d, 0x16000000
03302 4903f2                         add        rsi, r10
03305 41ba16000000                   mov        r10d, 0x16
0330b 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
0330f 7435                           je         0x7f75e83efec6
03311 4983c202                       add        r10, 2
03315 4983fa1a                       cmp        r10, 0x1a
03319 75f0                           jne        0x7f75e83efe8b
0331b 41ba16000000                   mov        r10d, 0x16
03321 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03326 7412                           je         0x7f75e83efeba
03328 4983c202                       add        r10, 2
0332c 4983fa1a                       cmp        r10, 0x1a
03330 75ef                           jne        0x7f75e83efea1
03332 41ba15000000                   mov        r10d, 0x15
03338 eb10                           jmp        0x7f75e83efeca
0333a 50                             push       rax
0333b 4833c0                         xor        rax, rax
0333e 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
03343 58                             pop        rax
03344 ebbf                           jmp        0x7f75e83efe85
03346 4983c201                       add        r10, 1
0334a 4a8304d201                     add        qword ptr [rdx + r10*8], 1
0334f 8b5808                         mov        ebx, dword ptr [rax + 8]
03352 48be783a79e0757f0000           movabs     rsi, 0x7f75e0793a78
0335c 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03364 48bef82779e0757f0000           movabs     rsi, 0x7f75e07927f8
0336e 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03371 83c202                         add        edx, 2
03374 895670                         mov        dword ptr [rsi + 0x70], edx
03377 81e2feff1f00                   and        edx, 0x1ffffe
0337d 85d2                           test       edx, edx
0337f 0f845e180000                   je         0x7f75e83f1763
03385 48bef82779e0757f0000           movabs     rsi, 0x7f75e07927f8
0338f 4883860801000001               add        qword ptr [rsi + 0x108], 1
03397 488bf3                         mov        rsi, rbx
0339a 83ee0f                         sub        esi, 0xf
0339d 48bac81e79e0757f0000           movabs     rdx, 0x7f75e0791ec8
033a7 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
033aa 83c102                         add        ecx, 2
033ad 894a70                         mov        dword ptr [rdx + 0x70], ecx
033b0 81e1feff1f00                   and        ecx, 0x1ffffe
033b6 85c9                           test       ecx, ecx
033b8 0f8446180000                   je         0x7f75e83f1784
033be 48bac81e79e0757f0000           movabs     rdx, 0x7f75e0791ec8
033c8 488382a800000001               add        qword ptr [rdx + 0xa8], 1
033d0 48ba0000000000000000           movabs     rdx, 0
033da ba00000000                     mov        edx, 0
033df 3bfa                           cmp        edi, edx
033e1 0f8c3e180000                   jl         0x7f75e83f17a5
033e7 3bfe                           cmp        edi, esi
033e9 0f8d43180000                   jge        0x7f75e83f17b2
033ef 48bec08f7ce200000000           movabs     rsi, 0xe27c8fc0
033f9 488bd6                         mov        rdx, rsi
033fc 48b9783a79e0757f0000           movabs     rcx, 0x7f75e0793a78
03406 488b12                         mov        rdx, qword ptr [rdx]
03409 48c1ea2a                       shr        rdx, 0x2a
0340d 48c1e209                       shl        rdx, 9
03411 41ba00000016                   mov        r10d, 0x16000000
03417 4903d2                         add        rdx, r10
0341a 41ba24000000                   mov        r10d, 0x24
03420 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03424 7435                           je         0x7f75e83effdb
03426 4983c202                       add        r10, 2
0342a 4983fa28                       cmp        r10, 0x28
0342e 75f0                           jne        0x7f75e83effa0
03430 41ba24000000                   mov        r10d, 0x24
03436 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0343b 7412                           je         0x7f75e83effcf
0343d 4983c202                       add        r10, 2
03441 4983fa28                       cmp        r10, 0x28
03445 75ef                           jne        0x7f75e83effb6
03447 41ba23000000                   mov        r10d, 0x23
0344d eb10                           jmp        0x7f75e83effdf
0344f 50                             push       rax
03450 4833c0                         xor        rax, rax
03453 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
03458 58                             pop        rax
03459 ebbf                           jmp        0x7f75e83eff9a
0345b 4983c201                       add        r10, 1
0345f 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03464 48bac81f79e0757f0000           movabs     rdx, 0x7f75e0791fc8
0346e 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03471 83c102                         add        ecx, 2
03474 894a70                         mov        dword ptr [rdx + 0x70], ecx
03477 81e1feff1f00                   and        ecx, 0x1ffffe
0347d 85c9                           test       ecx, ecx
0347f 0f84ba170000                   je         0x7f75e83f17bf
03485 48bac81f79e0757f0000           movabs     rdx, 0x7f75e0791fc8
0348f 488382a800000001               add        qword ptr [rdx + 0xa8], 1
03497 48bef02079e0757f0000           movabs     rsi, 0x7f75e07920f0
034a1 8b5670                         mov        edx, dword ptr [rsi + 0x70]
034a4 83c202                         add        edx, 2
034a7 895670                         mov        dword ptr [rsi + 0x70], edx
034aa 81e2feff1f00                   and        edx, 0x1ffffe
034b0 85d2                           test       edx, edx
034b2 0f84a8170000                   je         0x7f75e83f17e0
034b8 48bef02079e0757f0000           movabs     rsi, 0x7f75e07920f0
034c2 ff86b8000000                   inc        dword ptr [rsi + 0xb8]
034c8 899c240c020000                 mov        dword ptr [rsp + 0x20c], ebx
034cf 48bea8607ee200000000           movabs     rsi, 0xe27e60a8
034d9 488bd6                         mov        rdx, rsi
034dc 48b9783a79e0757f0000           movabs     rcx, 0x7f75e0793a78
034e6 48ba0000151600000000           movabs     rdx, 0x16150000
034f0 41ba2a000000                   mov        r10d, 0x2a
034f6 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
034fa 7435                           je         0x7f75e83f00b1
034fc 4983c202                       add        r10, 2
03500 4983fa2e                       cmp        r10, 0x2e
03504 75f0                           jne        0x7f75e83f0076
03506 41ba2a000000                   mov        r10d, 0x2a
0350c 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03511 7412                           je         0x7f75e83f00a5
03513 4983c202                       add        r10, 2
03517 4983fa2e                       cmp        r10, 0x2e
0351b 75ef                           jne        0x7f75e83f008c
0351d 41ba29000000                   mov        r10d, 0x29
03523 eb10                           jmp        0x7f75e83f00b5
03525 50                             push       rax
03526 4833c0                         xor        rax, rax
03529 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
0352e 58                             pop        rax
0352f ebbf                           jmp        0x7f75e83f0070
03531 4983c201                       add        r10, 1
03535 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0353a 48ba403c79e0757f0000           movabs     rdx, 0x7f75e0793c40
03544 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03547 83c102                         add        ecx, 2
0354a 894a70                         mov        dword ptr [rdx + 0x70], ecx
0354d 81e1feff1f00                   and        ecx, 0x1ffffe
03553 85c9                           test       ecx, ecx
03555 0f8426170000                   je         0x7f75e83f1801
0355b 488bd6                         mov        rdx, rsi
0355e 48b9403c79e0757f0000           movabs     rcx, 0x7f75e0793c40
03568 488381a800000001               add        qword ptr [rcx + 0xa8], 1
03570 48ba203d79e0757f0000           movabs     rdx, 0x7f75e0793d20
0357a 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0357d 83c102                         add        ecx, 2
03580 894a70                         mov        dword ptr [rdx + 0x70], ecx
03583 81e1feff1f00                   and        ecx, 0x1ffffe
03589 85c9                           test       ecx, ecx
0358b 0f8411170000                   je         0x7f75e83f1822
03591 48ba203d79e0757f0000           movabs     rdx, 0x7f75e0793d20
0359b 48be0000151600000000           movabs     rsi, 0x16150000
035a5 41ba16000000                   mov        r10d, 0x16
035ab 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
035af 7435                           je         0x7f75e83f0166
035b1 4983c202                       add        r10, 2
035b5 4983fa1a                       cmp        r10, 0x1a
035b9 75f0                           jne        0x7f75e83f012b
035bb 41ba16000000                   mov        r10d, 0x16
035c1 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
035c6 7412                           je         0x7f75e83f015a
035c8 4983c202                       add        r10, 2
035cc 4983fa1a                       cmp        r10, 0x1a
035d0 75ef                           jne        0x7f75e83f0141
035d2 41ba15000000                   mov        r10d, 0x15
035d8 eb10                           jmp        0x7f75e83f016a
035da 50                             push       rax
035db 4833c0                         xor        rax, rax
035de 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
035e3 58                             pop        rax
035e4 ebbf                           jmp        0x7f75e83f0125
035e6 4983c201                       add        r10, 1
035ea 4a8304d201                     add        qword ptr [rdx + r10*8], 1
035ef 48be702979e0757f0000           movabs     rsi, 0x7f75e0792970
035f9 8b5670                         mov        edx, dword ptr [rsi + 0x70]
035fc 83c202                         add        edx, 2
035ff 895670                         mov        dword ptr [rsi + 0x70], edx
03602 81e2feff1f00                   and        edx, 0x1ffffe
03608 85d2                           test       edx, edx
0360a 0f84b3160000                   je         0x7f75e83f1843
03610 48bec08f7ce200000000           movabs     rsi, 0xe27c8fc0
0361a 488bd6                         mov        rdx, rsi
0361d 48b9203d79e0757f0000           movabs     rcx, 0x7f75e0793d20
03627 488b12                         mov        rdx, qword ptr [rdx]
0362a 48c1ea2a                       shr        rdx, 0x2a
0362e 48c1e209                       shl        rdx, 9
03632 41ba00000016                   mov        r10d, 0x16000000
03638 4903d2                         add        rdx, r10
0363b 41ba1c000000                   mov        r10d, 0x1c
03641 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03645 7435                           je         0x7f75e83f01fc
03647 4983c202                       add        r10, 2
0364b 4983fa20                       cmp        r10, 0x20
0364f 75f0                           jne        0x7f75e83f01c1
03651 41ba1c000000                   mov        r10d, 0x1c
03657 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0365c 7412                           je         0x7f75e83f01f0
0365e 4983c202                       add        r10, 2
03662 4983fa20                       cmp        r10, 0x20
03666 75ef                           jne        0x7f75e83f01d7
03668 41ba1b000000                   mov        r10d, 0x1b
0366e eb10                           jmp        0x7f75e83f0200
03670 50                             push       rax
03671 4833c0                         xor        rax, rax
03674 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
03679 58                             pop        rax
0367a ebbf                           jmp        0x7f75e83f01bb
0367c 4983c201                       add        r10, 1
03680 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03685 48ba203d79e0757f0000           movabs     rdx, 0x7f75e0793d20
0368f 488b36                         mov        rsi, qword ptr [rsi]
03692 48c1ee2a                       shr        rsi, 0x2a
03696 48c1e609                       shl        rsi, 9
0369a 41ba00000016                   mov        r10d, 0x16000000
036a0 4903f2                         add        rsi, r10
036a3 41ba22000000                   mov        r10d, 0x22
036a9 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
036ad 7435                           je         0x7f75e83f0264
036af 4983c202                       add        r10, 2
036b3 4983fa26                       cmp        r10, 0x26
036b7 75f0                           jne        0x7f75e83f0229
036b9 41ba22000000                   mov        r10d, 0x22
036bf 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
036c4 7412                           je         0x7f75e83f0258
036c6 4983c202                       add        r10, 2
036ca 4983fa26                       cmp        r10, 0x26
036ce 75ef                           jne        0x7f75e83f023f
036d0 41ba21000000                   mov        r10d, 0x21
036d6 eb10                           jmp        0x7f75e83f0268
036d8 50                             push       rax
036d9 4833c0                         xor        rax, rax
036dc 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
036e1 58                             pop        rax
036e2 ebbf                           jmp        0x7f75e83f0223
036e4 4983c201                       add        r10, 1
036e8 4a8304d201                     add        qword ptr [rdx + r10*8], 1
036ed 48be203d79e0757f0000           movabs     rsi, 0x7f75e0793d20
036f7 4883863801000001               add        qword ptr [rsi + 0x138], 1
036ff 48be302a79e0757f0000           movabs     rsi, 0x7f75e0792a30
03709 8b5670                         mov        edx, dword ptr [rsi + 0x70]
0370c 83c202                         add        edx, 2
0370f 895670                         mov        dword ptr [rsi + 0x70], edx
03712 81e2feff1f00                   and        edx, 0x1ffffe
03718 85d2                           test       edx, edx
0371a 0f84c4150000                   je         0x7f75e83f1864
03720 48be203d79e0757f0000           movabs     rsi, 0x7f75e0793d20
0372a 4883864801000001               add        qword ptr [rsi + 0x148], 1
03732 4c63df                         movsxd     r11, edi
03735 be0c000000                     mov        esi, 0xc
0373a 4d8bcb                         mov        r9, r11
0373d 4c03ce                         add        r9, rsi
03740 48be100579e0757f0000           movabs     rsi, 0x7f75e0790510
0374a 8b5670                         mov        edx, dword ptr [rsi + 0x70]
0374d 83c202                         add        edx, 2
03750 895670                         mov        dword ptr [rsi + 0x70], edx
03753 81e2feff1f00                   and        edx, 0x1ffffe
03759 85d2                           test       edx, edx
0375b 0f84a4150000                   je         0x7f75e83f1885
03761 48be100579e0757f0000           movabs     rsi, 0x7f75e0790510
0376b 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03773 48be880679e0757f0000           movabs     rsi, 0x7f75e0790688
0377d 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03780 83c202                         add        edx, 2
03783 895670                         mov        dword ptr [rsi + 0x70], edx
03786 81e2feff1f00                   and        edx, 0x1ffffe
0378c 85d2                           test       edx, edx
0378e 0f8492150000                   je         0x7f75e83f18a6
03794 48be203d79e0757f0000           movabs     rsi, 0x7f75e0793d20
0379e 488db658010000                 lea        rsi, [rsi + 0x158]
037a5 48ba785b7fe200000000           movabs     rdx, 0xe27f5b78
037af 48ba0058151600000000           movabs     rdx, 0x16155800
037b9 4c8bd2                         mov        r10, rdx
037bc 483316                         xor        rdx, qword ptr [rsi]
037bf 48f7c2fcffffff                 test       rdx, -4
037c6 7426                           je         0x7f75e83f036e
037c8 f6c202                         test       dl, 2
037cb 7521                           jne        0x7f75e83f036e
037cd 48f706feffffff                 test       qword ptr [rsi], -2
037d4 7415                           je         0x7f75e83f036b
037d6 498bd2                         mov        rdx, r10
037d9 483316                         xor        rdx, qword ptr [rsi]
037dc 48f7c2fcffffff                 test       rdx, -4
037e3 7409                           je         0x7f75e83f036e
037e5 48830e02                       or         qword ptr [rsi], 2
037e9 eb03                           jmp        0x7f75e83f036e
037eb 488916                         mov        qword ptr [rsi], rdx
037ee 48be203d79e0757f0000           movabs     rsi, 0x7f75e0793d20
037f8 4883866801000001               add        qword ptr [rsi + 0x168], 1
03800 48be08907ce200000000           movabs     rsi, 0xe27c9008
0380a ba02000000                     mov        edx, 2
0380f b910000000                     mov        ecx, 0x10
03814 4c8bc0                         mov        r8, rax
03817 bf00000000                     mov        edi, 0
0381c 48890424                       mov        qword ptr [rsp], rax
03820 4c895c2408                     mov        qword ptr [rsp + 8], r11
03825 49bac08f7ce200000000           movabs     r10, 0xe27c8fc0
0382f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03834 49ba785b7fe200000000           movabs     r10, 0xe27f5b78
0383e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03843 0f1f4000                       nop        dword ptr [rax]
03847 e894045207                     call       0x7f75ef910860
0384c 0f1f840044390017               nop        dword ptr [rax + rax + 0x17003944]
03854 4885c0                         test       rax, rax
03857 48bb203d79e0757f0000           movabs     rbx, 0x7f75e0793d20
03861 750c                           jne        0x7f75e83f03ef
03863 808b7101000001                 or         byte ptr [rbx + 0x171], 1
0386a e98b000000                     jmp        0x7f75e83f047a
0386f 488b38                         mov        rdi, qword ptr [rax]
03872 48c1ef2a                       shr        rdi, 0x2a
03876 48c1e709                       shl        rdi, 9
0387a 41ba00000016                   mov        r10d, 0x16000000
03880 4903fa                         add        rdi, r10
03883 41ba30000000                   mov        r10d, 0x30
03889 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
0388d 7435                           je         0x7f75e83f0444
0388f 4983c202                       add        r10, 2
03893 4983fa34                       cmp        r10, 0x34
03897 75f0                           jne        0x7f75e83f0409
03899 41ba30000000                   mov        r10d, 0x30
0389f 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
038a4 7412                           je         0x7f75e83f0438
038a6 4983c202                       add        r10, 2
038aa 4983fa34                       cmp        r10, 0x34
038ae 75ef                           jne        0x7f75e83f041f
038b0 41ba2f000000                   mov        r10d, 0x2f
038b6 eb10                           jmp        0x7f75e83f0448
038b8 50                             push       rax
038b9 4833c0                         xor        rax, rax
038bc 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
038c1 58                             pop        rax
038c2 ebbf                           jmp        0x7f75e83f0403
038c4 4983c201                       add        r10, 1
038c8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
038cd 48bf0006141600000000           movabs     rdi, 0x16140600
038d7 488b18                         mov        rbx, qword ptr [rax]
038da 48c1eb2a                       shr        rbx, 0x2a
038de 48c1e309                       shl        rbx, 9
038e2 41ba00000016                   mov        r10d, 0x16000000
038e8 4903da                         add        rbx, r10
038eb 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
038ef 0f8552140000                   jne        0x7f75e83f18c7
038f5 e900000000                     jmp        0x7f75e83f047a
038fa 488bf8                         mov        rdi, rax
038fd 4889bc2410020000               mov        qword ptr [rsp + 0x210], rdi
03905 483b07                         cmp        rax, qword ptr [rdi]
03908 488bf7                         mov        rsi, rdi
0390b 48bb701472e0757f0000           movabs     rbx, 0x7f75e0721470
03915 488b36                         mov        rsi, qword ptr [rsi]
03918 48c1ee2a                       shr        rsi, 0x2a
0391c 48c1e609                       shl        rsi, 9
03920 41ba00000016                   mov        r10d, 0x16000000
03926 4903f2                         add        rsi, r10
03929 41babc000000                   mov        r10d, 0xbc
0392f 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03933 743b                           je         0x7f75e83f04f0
03935 4983c202                       add        r10, 2
03939 4981fac0000000                 cmp        r10, 0xc0
03940 75ed                           jne        0x7f75e83f04af
03942 41babc000000                   mov        r10d, 0xbc
03948 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0394d 7415                           je         0x7f75e83f04e4
0394f 4983c202                       add        r10, 2
03953 4981fac0000000                 cmp        r10, 0xc0
0395a 75ec                           jne        0x7f75e83f04c8
0395c 41babb000000                   mov        r10d, 0xbb
03962 eb10                           jmp        0x7f75e83f04f4
03964 50                             push       rax
03965 4833c0                         xor        rax, rax
03968 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
0396d 58                             pop        rax
0396e ebb9                           jmp        0x7f75e83f04a9
03970 4983c201                       add        r10, 1
03974 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03979 48bee84079e0757f0000           movabs     rsi, 0x7f75e07940e8
03983 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
03986 83c302                         add        ebx, 2
03989 895e70                         mov        dword ptr [rsi + 0x70], ebx
0398c 81e3feff1f00                   and        ebx, 0x1ffffe
03992 85db                           test       ebx, ebx
03994 0f84bb130000                   je         0x7f75e83f18d5
0399a 488bf7                         mov        rsi, rdi
0399d 48bbe84079e0757f0000           movabs     rbx, 0x7f75e07940e8
039a7 488b36                         mov        rsi, qword ptr [rsi]
039aa 48c1ee2a                       shr        rsi, 0x2a
039ae 48c1e609                       shl        rsi, 9
039b2 41ba00000016                   mov        r10d, 0x16000000
039b8 4903f2                         add        rsi, r10
039bb 41ba16000000                   mov        r10d, 0x16
039c1 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
039c5 7435                           je         0x7f75e83f057c
039c7 4983c202                       add        r10, 2
039cb 4983fa1a                       cmp        r10, 0x1a
039cf 75f0                           jne        0x7f75e83f0541
039d1 41ba16000000                   mov        r10d, 0x16
039d7 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
039dc 7412                           je         0x7f75e83f0570
039de 4983c202                       add        r10, 2
039e2 4983fa1a                       cmp        r10, 0x1a
039e6 75ef                           jne        0x7f75e83f0557
039e8 41ba15000000                   mov        r10d, 0x15
039ee eb10                           jmp        0x7f75e83f0580
039f0 50                             push       rax
039f1 4833c0                         xor        rax, rax
039f4 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
039f9 58                             pop        rax
039fa ebbf                           jmp        0x7f75e83f053b
039fc 4983c201                       add        r10, 1
03a00 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03a05 488bf7                         mov        rsi, rdi
03a08 0f1f440000                     nop        dword ptr [rax + rax]
03a0d 48b8a09539c0757f0000           movabs     rax, 0x7f75c03995a0
03a17 e8c4fd5107                     call       0x7f75ef910360
03a1c 0f1f8400143b0018               nop        dword ptr [rax + rax + 0x18003b14]
03a24 48bee84079e0757f0000           movabs     rsi, 0x7f75e07940e8
03a2e 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03a36 48bef82779e0757f0000           movabs     rsi, 0x7f75e07927f8
03a40 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
03a43 83c702                         add        edi, 2
03a46 897e70                         mov        dword ptr [rsi + 0x70], edi
03a49 81e7feff1f00                   and        edi, 0x1ffffe
03a4f 85ff                           test       edi, edi
03a51 0f841f130000                   je         0x7f75e83f18f6
03a57 8b9c240c020000                 mov        ebx, dword ptr [rsp + 0x20c]
03a5e 8bbc24d0010000                 mov        edi, dword ptr [rsp + 0x1d0]
03a65 48bef82779e0757f0000           movabs     rsi, 0x7f75e07927f8
03a6f 4883860801000001               add        qword ptr [rsi + 0x108], 1
03a77 ffc8                           dec        eax
03a79 2bd8                           sub        ebx, eax
03a7b 48bec81e79e0757f0000           movabs     rsi, 0x7f75e0791ec8
03a85 8b4670                         mov        eax, dword ptr [rsi + 0x70]
03a88 83c002                         add        eax, 2
03a8b 894670                         mov        dword ptr [rsi + 0x70], eax
03a8e 25feff1f00                     and        eax, 0x1ffffe
03a93 85c0                           test       eax, eax
03a95 0f84fc120000                   je         0x7f75e83f1917
03a9b 48bec81e79e0757f0000           movabs     rsi, 0x7f75e0791ec8
03aa5 488386a800000001               add        qword ptr [rsi + 0xa8], 1
03aad 48be0000000000000000           movabs     rsi, 0
03ab7 be00000000                     mov        esi, 0
03abc 3bfe                           cmp        edi, esi
03abe 0f8cf4120000                   jl         0x7f75e83f1938
03ac4 3bfb                           cmp        edi, ebx
03ac6 0f8df9120000                   jge        0x7f75e83f1945
03acc 488bdf                         mov        rbx, rdi
03acf 899c2418020000                 mov        dword ptr [rsp + 0x218], ebx
03ad6 89bc24d0010000                 mov        dword ptr [rsp + 0x1d0], edi
03add 488bbc2410020000               mov        rdi, qword ptr [rsp + 0x210]
03ae5 488bf7                         mov        rsi, rdi
03ae8 48b9e84079e0757f0000           movabs     rcx, 0x7f75e07940e8
03af2 488b36                         mov        rsi, qword ptr [rsi]
03af5 48c1ee2a                       shr        rsi, 0x2a
03af9 48c1e609                       shl        rsi, 9
03afd 41ba00000016                   mov        r10d, 0x16000000
03b03 4903f2                         add        rsi, r10
03b06 41ba1e000000                   mov        r10d, 0x1e
03b0c 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
03b10 7435                           je         0x7f75e83f06c7
03b12 4983c202                       add        r10, 2
03b16 4983fa22                       cmp        r10, 0x22
03b1a 75f0                           jne        0x7f75e83f068c
03b1c 41ba1e000000                   mov        r10d, 0x1e
03b22 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03b27 7412                           je         0x7f75e83f06bb
03b29 4983c202                       add        r10, 2
03b2d 4983fa22                       cmp        r10, 0x22
03b31 75ef                           jne        0x7f75e83f06a2
03b33 41ba1d000000                   mov        r10d, 0x1d
03b39 eb10                           jmp        0x7f75e83f06cb
03b3b 50                             push       rax
03b3c 4833c0                         xor        rax, rax
03b3f 4a0fb134d1                     cmpxchg    qword ptr [rcx + r10*8], rsi
03b44 58                             pop        rax
03b45 ebbf                           jmp        0x7f75e83f0686
03b47 4983c201                       add        r10, 1
03b4b 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03b50 488bf7                         mov        rsi, rdi
03b53 6690                           nop        
03b55 48b8c89539c0757f0000           movabs     rax, 0x7f75c03995c8
03b5f e87cfc5107                     call       0x7f75ef910360
03b64 0f1f84005c3c0019               nop        dword ptr [rax + rax + 0x19003c5c]
03b6c 483b00                         cmp        rax, qword ptr [rax]
03b6f 488bf0                         mov        rsi, rax
03b72 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
03b7c 488b36                         mov        rsi, qword ptr [rsi]
03b7f 48c1ee2a                       shr        rsi, 0x2a
03b83 48c1e609                       shl        rsi, 9
03b87 41ba00000016                   mov        r10d, 0x16000000
03b8d 4903f2                         add        rsi, r10
03b90 41ba24000000                   mov        r10d, 0x24
03b96 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03b9a 7435                           je         0x7f75e83f0751
03b9c 4983c202                       add        r10, 2
03ba0 4983fa28                       cmp        r10, 0x28
03ba4 75f0                           jne        0x7f75e83f0716
03ba6 41ba24000000                   mov        r10d, 0x24
03bac 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03bb1 7412                           je         0x7f75e83f0745
03bb3 4983c202                       add        r10, 2
03bb7 4983fa28                       cmp        r10, 0x28
03bbb 75ef                           jne        0x7f75e83f072c
03bbd 41ba23000000                   mov        r10d, 0x23
03bc3 eb10                           jmp        0x7f75e83f0755
03bc5 50                             push       rax
03bc6 4833c0                         xor        rax, rax
03bc9 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
03bce 58                             pop        rax
03bcf ebbf                           jmp        0x7f75e83f0710
03bd1 4983c201                       add        r10, 1
03bd5 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03bda 8b7028                         mov        esi, dword ptr [rax + 0x28]
03bdd 488bd0                         mov        rdx, rax
03be0 48b9e84079e0757f0000           movabs     rcx, 0x7f75e07940e8
03bea 488b12                         mov        rdx, qword ptr [rdx]
03bed 48c1ea2a                       shr        rdx, 0x2a
03bf1 48c1e209                       shl        rdx, 9
03bf5 41ba00000016                   mov        r10d, 0x16000000
03bfb 4903d2                         add        rdx, r10
03bfe 41ba2a000000                   mov        r10d, 0x2a
03c04 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03c08 7435                           je         0x7f75e83f07bf
03c0a 4983c202                       add        r10, 2
03c0e 4983fa2e                       cmp        r10, 0x2e
03c12 75f0                           jne        0x7f75e83f0784
03c14 41ba2a000000                   mov        r10d, 0x2a
03c1a 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03c1f 7412                           je         0x7f75e83f07b3
03c21 4983c202                       add        r10, 2
03c25 4983fa2e                       cmp        r10, 0x2e
03c29 75ef                           jne        0x7f75e83f079a
03c2b 41ba29000000                   mov        r10d, 0x29
03c31 eb10                           jmp        0x7f75e83f07c3
03c33 50                             push       rax
03c34 4833c0                         xor        rax, rax
03c37 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
03c3c 58                             pop        rax
03c3d ebbf                           jmp        0x7f75e83f077e
03c3f 4983c201                       add        r10, 1
03c43 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03c48 8b4808                         mov        ecx, dword ptr [rax + 8]
03c4b 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
03c55 4883827801000001               add        qword ptr [rdx + 0x178], 1
03c5d 48ba302a79e0757f0000           movabs     rdx, 0x7f75e0792a30
03c67 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03c6b 4183c002                       add        r8d, 2
03c6f 44894270                       mov        dword ptr [rdx + 0x70], r8d
03c73 4181e0feff1f00                 and        r8d, 0x1ffffe
03c7a 4585c0                         test       r8d, r8d
03c7d 0f8454110000                   je         0x7f75e83f1957
03c83 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
03c8d 4883828801000001               add        qword ptr [rdx + 0x188], 1
03c95 8b9c2418020000                 mov        ebx, dword ptr [rsp + 0x218]
03c9c 4863db                         movsxd     rbx, ebx
03c9f ba0c000000                     mov        edx, 0xc
03ca4 4c8bcb                         mov        r9, rbx
03ca7 4c03ca                         add        r9, rdx
03caa 48ba100579e0757f0000           movabs     rdx, 0x7f75e0790510
03cb4 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03cb8 4183c002                       add        r8d, 2
03cbc 44894270                       mov        dword ptr [rdx + 0x70], r8d
03cc0 4181e0feff1f00                 and        r8d, 0x1ffffe
03cc7 4585c0                         test       r8d, r8d
03cca 0f8428110000                   je         0x7f75e83f1978
03cd0 48ba100579e0757f0000           movabs     rdx, 0x7f75e0790510
03cda 488382d800000001               add        qword ptr [rdx + 0xd8], 1
03ce2 48ba880679e0757f0000           movabs     rdx, 0x7f75e0790688
03cec 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03cf0 4183c002                       add        r8d, 2
03cf4 44894270                       mov        dword ptr [rdx + 0x70], r8d
03cf8 4181e0feff1f00                 and        r8d, 0x1ffffe
03cff 4585c0                         test       r8d, r8d
03d02 0f8411110000                   je         0x7f75e83f1999
03d08 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
03d12 488d9298010000                 lea        rdx, [rdx + 0x198]
03d19 49b8203c81e200000000           movabs     r8, 0xe2813c20
03d23 49b80068151600000000           movabs     r8, 0x16156800
03d2d 4d8bd0                         mov        r10, r8
03d30 4c3302                         xor        r8, qword ptr [rdx]
03d33 49f7c0fcffffff                 test       r8, -4
03d3a 7427                           je         0x7f75e83f08e3
03d3c 41f6c002                       test       r8b, 2
03d40 7521                           jne        0x7f75e83f08e3
03d42 48f702feffffff                 test       qword ptr [rdx], -2
03d49 7415                           je         0x7f75e83f08e0
03d4b 4d8bc2                         mov        r8, r10
03d4e 4c3302                         xor        r8, qword ptr [rdx]
03d51 49f7c0fcffffff                 test       r8, -4
03d58 7409                           je         0x7f75e83f08e3
03d5a 48830a02                       or         qword ptr [rdx], 2
03d5e eb03                           jmp        0x7f75e83f08e3
03d60 4c8902                         mov        qword ptr [rdx], r8
03d63 48bae84079e0757f0000           movabs     rdx, 0x7f75e07940e8
03d6d 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
03d75 ba02000000                     mov        edx, 2
03d7a 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
03d82 bf00000000                     mov        edi, 0
03d87 488b842410020000               mov        rax, qword ptr [rsp + 0x210]
03d8f 48890424                       mov        qword ptr [rsp], rax
03d93 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03d9b 4889442408                     mov        qword ptr [rsp + 8], rax
03da0 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
03da5 49ba203c81e200000000           movabs     r10, 0xe2813c20
03daf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03db4 666690                         nop        
03db7 e824ff5107                     call       0x7f75ef910860
03dbc 0f1f8400b43e001a               nop        dword ptr [rax + rax + 0x1a003eb4]
03dc4 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
03dcb 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
03dd3 4103d8                         add        ebx, r8d
03dd6 48be701472e0757f0000           movabs     rsi, 0x7f75e0721470
03de0 ff8608060000                   inc        dword ptr [rsi + 0x608]
03de6 8bb424d4010000                 mov        esi, dword ptr [rsp + 0x1d4]
03ded 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
03df7 ff8200080000                   inc        dword ptr [rdx + 0x800]
03dfd 488bc3                         mov        rax, rbx
03e00 8b942444010000                 mov        edx, dword ptr [rsp + 0x144]
03e07 ffc2                           inc        edx
03e09 48b9701472e0757f0000           movabs     rcx, 0x7f75e0721470
03e13 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
03e17 4183c002                       add        r8d, 2
03e1b 44894174                       mov        dword ptr [rcx + 0x74], r8d
03e1f 4181e0fe3f0000                 and        r8d, 0x3ffe
03e26 4585c0                         test       r8d, r8d
03e29 0f840b100000                   je         0x7f75e83f19ba
03e2f 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03e33 418502                         test       dword ptr [r10], eax
03e36 48b9701472e0757f0000           movabs     rcx, 0x7f75e0721470
03e40 ff8128080000                   inc        dword ptr [rcx + 0x828]
03e46 488bce                         mov        rcx, rsi
03e49 4c8bd8                         mov        r11, rax
03e4c 488bf1                         mov        rsi, rcx
03e4f 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
03e57 488b9c2468020000               mov        rbx, qword ptr [rsp + 0x268]
03e5f 8bbc2430010000                 mov        edi, dword ptr [rsp + 0x130]
03e66 4c8b8c2420010000               mov        r9, qword ptr [rsp + 0x120]
03e6e 4c8b842428010000               mov        r8, qword ptr [rsp + 0x128]
03e76 8b8c2434010000                 mov        ecx, dword ptr [rsp + 0x134]
03e7d e96ec4ffff                     jmp        0x7f75e83ece70
03e82 4c8bc8                         mov        r9, rax
03e85 4585c9                         test       r9d, r9d
03e88 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
03e92 b980030000                     mov        ecx, 0x380
03e97 7e05                           jle        0x7f75e83f0a1e
03e99 b990030000                     mov        ecx, 0x390
03e9e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
03ea2 4d8d4001                       lea        r8, [r8 + 1]
03ea6 4c89040a                       mov        qword ptr [rdx + rcx], r8
03eaa 0f8e77010000                   jle        0x7f75e83f0ba7
03eb0 488b9c2498010000               mov        rbx, qword ptr [rsp + 0x198]
03eb8 482bf3                         sub        rsi, rbx
03ebb ba00000000                     mov        edx, 0
03ec0 483bf2                         cmp        rsi, rdx
03ec3 48be701472e0757f0000           movabs     rsi, 0x7f75e0721470
03ecd baa0030000                     mov        edx, 0x3a0
03ed2 7d05                           jge        0x7f75e83f0a59
03ed4 bab0030000                     mov        edx, 0x3b0
03ed9 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
03edd 488d4901                       lea        rcx, [rcx + 1]
03ee1 48890c16                       mov        qword ptr [rsi + rdx], rcx
03ee5 0f8d3c010000                   jge        0x7f75e83f0ba7
03eeb 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
03ef3 488b5630                       mov        rdx, qword ptr [rsi + 0x30]
03ef7 be00000000                     mov        esi, 0
03efc 483bd6                         cmp        rdx, rsi
03eff 48be701472e0757f0000           movabs     rsi, 0x7f75e0721470
03f09 bac0030000                     mov        edx, 0x3c0
03f0e 7505                           jne        0x7f75e83f0a95
03f10 bad0030000                     mov        edx, 0x3d0
03f15 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
03f19 488d4901                       lea        rcx, [rcx + 1]
03f1d 48890c16                       mov        qword ptr [rsi + rdx], rcx
03f21 0f8500010000                   jne        0x7f75e83f0ba7
03f27 e905010000                     jmp        0x7f75e83f0bb1
03f2c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
03f34 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03f3c 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
03f44 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
03f4b 488bce                         mov        rcx, rsi
03f4e 8bb42434010000                 mov        esi, dword ptr [rsp + 0x134]
03f55 488bde                         mov        rbx, rsi
03f58 2bd9                           sub        ebx, ecx
03f5a 48be701472e0757f0000           movabs     rsi, 0x7f75e0721470
03f64 4883864008000001               add        qword ptr [rsi + 0x840], 1
03f6c 488bf2                         mov        rsi, rdx
03f6f 488bd1                         mov        rdx, rcx
03f72 488bc8                         mov        rcx, rax
03f75 4d8bc3                         mov        r8, r11
03f78 4c8bcb                         mov        r9, rbx
03f7b 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
03f83 899c241c020000                 mov        dword ptr [rsp + 0x21c], ebx
03f8a 4885c9                         test       rcx, rcx
03f8d 0f84c80e0000                   je         0x7f75e83f19db
03f93 85d2                           test       edx, edx
03f95 0f8cc00e0000                   jl         0x7f75e83f19db
03f9b 4585c0                         test       r8d, r8d
03f9e 0f8cb70e0000                   jl         0x7f75e83f19db
03fa4 4a8d3c0a                       lea        rdi, [rdx + r9]
03fa8 3b7e08                         cmp        edi, dword ptr [rsi + 8]
03fab 0f87aa0e0000                   ja         0x7f75e83f19db
03fb1 4b8d3c08                       lea        rdi, [r8 + r9]
03fb5 3b7908                         cmp        edi, dword ptr [rcx + 8]
03fb8 0f879d0e0000                   ja         0x7f75e83f19db
03fbe 4585c9                         test       r9d, r9d
03fc1 0f8c940e0000                   jl         0x7f75e83f19db
03fc7 4863d2                         movsxd     rdx, edx
03fca 4d63c0                         movsxd     r8, r8d
03fcd 488d7c160c                     lea        rdi, [rsi + rdx + 0xc]
03fd2 4a8d74010c                     lea        rsi, [rcx + r8 + 0xc]
03fd7 498bd1                         mov        rdx, r9
03fda 40f6c40f                       test       spl, 0xf
03fde 0f8412000000                   je         0x7f75e83f0b76
03fe4 4883ec08                       sub        rsp, 8
03fe8 e8b3935007                     call       0x7f75ef8f9f20
03fed 4883c408                       add        rsp, 8
03ff1 e905000000                     jmp        0x7f75e83f0b7b
03ff6 e8a5935007                     call       0x7f75ef8f9f20
03ffb 8b9c241c020000                 mov        ebx, dword ptr [rsp + 0x21c]
04002 039c2474010000                 add        ebx, dword ptr [rsp + 0x174]
04009 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
04011 895e3c                         mov        dword ptr [rsi + 0x3c], ebx
04014 4881c450020000                 add        rsp, 0x250
0401b 5d                             pop        rbp
0401c 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
04020 0f87430e0000                   ja         0x7f75e83f19e9
04026 c3                             ret        
04027 bb02000000                     mov        ebx, 2
0402c e915000000                     jmp        0x7f75e83f0bc6
04031 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
0403b ff82e0030000                   inc        dword ptr [rdx + 0x3e0]
04041 bb08000000                     mov        ebx, 8
04046 899c2428020000                 mov        dword ptr [rsp + 0x228], ebx
0404d 666690                         nop        
04050 e9390e0000                     jmp        0x7f75e83f1a0e
04055 90                             nop        
04056 90                             nop        
04057 90                             nop        
04058 90                             nop        
04059 90                             nop        
0405a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04061 0f85360e0000                   jne        0x7f75e83f1a1d
04067 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
0406e 488d7828                       lea        rdi, [rax + 0x28]
04072 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
04079 0f871e0e0000                   ja         0x7f75e83f1a1d
0407f 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
04086 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0408d 488908                         mov        qword ptr [rax], rcx
04090 4833c9                         xor        rcx, rcx
04093 48894808                       mov        qword ptr [rax + 8], rcx
04097 48894810                       mov        qword ptr [rax + 0x10], rcx
0409b 48894818                       mov        qword ptr [rax + 0x18], rcx
0409f 48894820                       mov        qword ptr [rax + 0x20], rcx
040a3 0f1f440000                     nop        dword ptr [rax + rax]
040a8 e90c0e0000                     jmp        0x7f75e83f1a39
040ad 90                             nop        
040ae 90                             nop        
040af 90                             nop        
040b0 90                             nop        
040b1 90                             nop        
040b2 498bf1                         mov        rsi, r9
040b5 4889842420020000               mov        qword ptr [rsp + 0x220], rax
040bd 6690                           nop        
040bf e81cfc5107                     call       0x7f75ef910860
040c4 0f1f8400bc41001c               nop        dword ptr [rax + rax + 0x1c0041bc]
040cc 48ba701472e0757f0000           movabs     rdx, 0x7f75e0721470
040d6 488d9208040000                 lea        rdx, [rdx + 0x408]
040dd 4885c0                         test       rax, rax
040e0 750a                           jne        0x7f75e83f0c6c
040e2 f60201                         test       byte ptr [rdx], 1
040e5 7505                           jne        0x7f75e83f0c6c
040e7 f048830a01                     lock or    qword ptr [rdx], 1
040ec 488b942420020000               mov        rdx, qword ptr [rsp + 0x220]
040f4 48b9701472e0757f0000           movabs     rcx, 0x7f75e0721470
040fe 4883811804000001               add        qword ptr [rcx + 0x418], 1
04106 8b942428020000                 mov        edx, dword ptr [rsp + 0x228]
0410d 488bc8                         mov        rcx, rax
04110 488bb42420020000               mov        rsi, qword ptr [rsp + 0x220]
04118 0f1f8000000000                 nop        dword ptr [rax]
0411f e8bcf15107                     call       0x7f75ef90fe60
04124 0f1f84001c42001d               nop        dword ptr [rax + rax + 0x1d00421c]
0412c 488b842420020000               mov        rax, qword ptr [rsp + 0x220]
04134 e9fd0d0000                     jmp        0x7f75e83f1ab6
04139 0f1f8000000000                 nop        dword ptr [rax]
04140 e98d0d0000                     jmp        0x7f75e83f1a52
04145 90                             nop        
04146 90                             nop        
04147 90                             nop        
04148 90                             nop        
04149 90                             nop        
0414a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04151 0f858a0d0000                   jne        0x7f75e83f1a61
04157 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
0415e 488d7828                       lea        rdi, [rax + 0x28]
04162 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
04169 0f87720d0000                   ja         0x7f75e83f1a61
0416f 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
04176 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0417d 488908                         mov        qword ptr [rax], rcx
04180 4833c9                         xor        rcx, rcx
04183 48894808                       mov        qword ptr [rax + 8], rcx
04187 48894810                       mov        qword ptr [rax + 0x10], rcx
0418b 48894818                       mov        qword ptr [rax + 0x18], rcx
0418f 48894820                       mov        qword ptr [rax + 0x20], rcx
04193 488bd0                         mov        rdx, rax
04196 48b9701472e0757f0000           movabs     rcx, 0x7f75e0721470
041a0 4883815002000001               add        qword ptr [rcx + 0x250], 1
041a8 ba02000000                     mov        edx, 2
041ad 48b9686726e200000000           movabs     rcx, 0xe2266768
041b7 488bf0                         mov        rsi, rax
041ba 4889842430020000               mov        qword ptr [rsp + 0x230], rax
041c2 0f1f440000                     nop        dword ptr [rax + rax]
041c7 e814f15107                     call       0x7f75ef90fe60
041cc 0f1f8400c442001e               nop        dword ptr [rax + rax + 0x1e0042c4]
041d4 488b842430020000               mov        rax, qword ptr [rsp + 0x230]
041dc e9550d0000                     jmp        0x7f75e83f1ab6
041e1 0f1f8000000000                 nop        dword ptr [rax]
041e8 e9100d0000                     jmp        0x7f75e83f1a7d
041ed 90                             nop        
041ee 90                             nop        
041ef 90                             nop        
041f0 90                             nop        
041f1 90                             nop        
041f2 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
041f9 0f850d0d0000                   jne        0x7f75e83f1a8c
041ff 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
04206 488d7828                       lea        rdi, [rax + 0x28]
0420a 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
04211 0f87f50c0000                   ja         0x7f75e83f1a8c
04217 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
0421e 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
04225 488908                         mov        qword ptr [rax], rcx
04228 4833c9                         xor        rcx, rcx
0422b 48894808                       mov        qword ptr [rax + 8], rcx
0422f 48894810                       mov        qword ptr [rax + 0x10], rcx
04233 48894818                       mov        qword ptr [rax + 0x18], rcx
04237 48894820                       mov        qword ptr [rax + 0x20], rcx
0423b 488bd0                         mov        rdx, rax
0423e 48b9701472e0757f0000           movabs     rcx, 0x7f75e0721470
04248 4883813801000001               add        qword ptr [rcx + 0x138], 1
04250 ba05000000                     mov        edx, 5
04255 48b9a86726e200000000           movabs     rcx, 0xe22667a8
0425f 488bf0                         mov        rsi, rax
04262 4889842438020000               mov        qword ptr [rsp + 0x238], rax
0426a 0f1f440000                     nop        dword ptr [rax + rax]
0426f e86cf05107                     call       0x7f75ef90fe60
04274 0f1f84006c43001f               nop        dword ptr [rax + rax + 0x1f00436c]
0427c 488b842438020000               mov        rax, qword ptr [rsp + 0x238]
04284 e9ad0c0000                     jmp        0x7f75e83f1ab6
04289 49bad8e570e0757f0000           movabs     r10, 0x7f75e070e5d8
04293 4c89542408                     mov        qword ptr [rsp + 8], r10
04298 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
042a0 e83b5f5e07                     call       0x7f75ef9d6d60
042a5 e9e3bdffff                     jmp        0x7f75e83ecc0d
042aa 49ba302619e0757f0000           movabs     r10, 0x7f75e0192630
042b4 4c89542408                     mov        qword ptr [rsp + 8], r10
042b9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
042c1 e81a5f5e07                     call       0x7f75ef9d6d60
042c6 e94cbfffff                     jmp        0x7f75e83ecd97
042cb e890ff5d07                     call       0x7f75ef9d0de0
042d0 e88bff5d07                     call       0x7f75ef9d0de0
042d5 e886ff5d07                     call       0x7f75ef9d0de0
042da 48891424                       mov        qword ptr [rsp], rdx
042de 4c89442408                     mov        qword ptr [rsp + 8], r8
042e3 e878f65d07                     call       0x7f75ef9d04e0
042e8 e873ff5d07                     call       0x7f75ef9d0de0
042ed e86eff5d07                     call       0x7f75ef9d0de0
042f2 48891424                       mov        qword ptr [rsp], rdx
042f6 4c894c2408                     mov        qword ptr [rsp + 8], r9
042fb e860f65d07                     call       0x7f75ef9d04e0
04300 e85bff5d07                     call       0x7f75ef9d0de0
04305 e856ff5d07                     call       0x7f75ef9d0de0
0430a 48c7042401000000               mov        qword ptr [rsp], 1
04312 48895c2408                     mov        qword ptr [rsp + 8], rbx
04317 e844f65d07                     call       0x7f75ef9d04e0
0431c 48c7042402000000               mov        qword ptr [rsp], 2
04324 48895c2408                     mov        qword ptr [rsp + 8], rbx
04329 e832f65d07                     call       0x7f75ef9d04e0
0432e 49ba305a63e0757f0000           movabs     r10, 0x7f75e0635a30
04338 4c89542408                     mov        qword ptr [rsp + 8], r10
0433d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04345 e8965e5e07                     call       0x7f75ef9d6d60
0434a e95ec4ffff                     jmp        0x7f75e83ed32d
0434f 49ba082978e0757f0000           movabs     r10, 0x7f75e0782908
04359 4c89542408                     mov        qword ptr [rsp + 8], r10
0435e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04366 e8755e5e07                     call       0x7f75ef9d6d60
0436b e9e2c4ffff                     jmp        0x7f75e83ed3d2
04370 49ba30f516e0757f0000           movabs     r10, 0x7f75e016f530
0437a 4c89542408                     mov        qword ptr [rsp + 8], r10
0437f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04387 e8545e5e07                     call       0x7f75ef9d6d60
0438c e90bc5ffff                     jmp        0x7f75e83ed41c
04391 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04399 e8c23f5e07                     call       0x7f75ef9d4ee0
0439e 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
043a6 e8b53f5e07                     call       0x7f75ef9d4ee0
043ab 49ba68cd68e0757f0000           movabs     r10, 0x7f75e068cd68
043b5 4c89542408                     mov        qword ptr [rsp + 8], r10
043ba 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
043c2 e8195e5e07                     call       0x7f75ef9d6d60
043c7 e9a8c5ffff                     jmp        0x7f75e83ed4f4
043cc 49ba183669e0757f0000           movabs     r10, 0x7f75e0693618
043d6 4c89542408                     mov        qword ptr [rsp + 8], r10
043db 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
043e3 e8f85d5e07                     call       0x7f75ef9d6d60
043e8 e9bac5ffff                     jmp        0x7f75e83ed527
043ed 49ba60d76be0757f0000           movabs     r10, 0x7f75e06bd760
043f7 4c89542408                     mov        qword ptr [rsp + 8], r10
043fc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04404 e8d75d5e07                     call       0x7f75ef9d6d60
04409 e962c6ffff                     jmp        0x7f75e83ed5f0
0440e 49baf87363e0757f0000           movabs     r10, 0x7f75e06373f8
04418 4c89542408                     mov        qword ptr [rsp + 8], r10
0441d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04425 e8b65d5e07                     call       0x7f75ef9d6d60
0442a e978c6ffff                     jmp        0x7f75e83ed627
0442f 49ba309d6be0757f0000           movabs     r10, 0x7f75e06b9d30
04439 4c89542408                     mov        qword ptr [rsp + 8], r10
0443e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04446 e8955d5e07                     call       0x7f75ef9d6d60
0444b e9dbc6ffff                     jmp        0x7f75e83ed6ab
04450 49ba608c63e0757f0000           movabs     r10, 0x7f75e0638c60
0445a 4c89542408                     mov        qword ptr [rsp + 8], r10
0445f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04467 e8745d5e07                     call       0x7f75ef9d6d60
0446c e9d5c7ffff                     jmp        0x7f75e83ed7c6
04471 49ba48d640e0757f0000           movabs     r10, 0x7f75e040d648
0447b 4c89542408                     mov        qword ptr [rsp + 8], r10
04480 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04488 e8535d5e07                     call       0x7f75ef9d6d60
0448d e9f5c7ffff                     jmp        0x7f75e83ed807
04492 49bab0af3be0757f0000           movabs     r10, 0x7f75e03bafb0
0449c 4c89542408                     mov        qword ptr [rsp + 8], r10
044a1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044a9 e8325d5e07                     call       0x7f75ef9d6d60
044ae e907c8ffff                     jmp        0x7f75e83ed83a
044b3 48890424                       mov        qword ptr [rsp], rax
044b7 e8a4255e07                     call       0x7f75ef9d35e0
044bc e89ffd5d07                     call       0x7f75ef9d0de0
044c1 49bac06763e0757f0000           movabs     r10, 0x7f75e06367c0
044cb 4c89542408                     mov        qword ptr [rsp + 8], r10
044d0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044d8 e8035d5e07                     call       0x7f75ef9d6d60
044dd e9e0c9ffff                     jmp        0x7f75e83eda42
044e2 e879fd5d07                     call       0x7f75ef9d0de0
044e7 49ba082978e0757f0000           movabs     r10, 0x7f75e0782908
044f1 4c89542408                     mov        qword ptr [rsp + 8], r10
044f6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044fe e8dd5c5e07                     call       0x7f75ef9d6d60
04503 e982caffff                     jmp        0x7f75e83edb0a
04508 49ba30f516e0757f0000           movabs     r10, 0x7f75e016f530
04512 4c89542408                     mov        qword ptr [rsp + 8], r10
04517 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0451f e8bc5c5e07                     call       0x7f75ef9d6d60
04524 e99fcaffff                     jmp        0x7f75e83edb48
04529 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04531 e82a3e5e07                     call       0x7f75ef9d4ee0
04536 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0453e e81d3e5e07                     call       0x7f75ef9d4ee0
04543 e818fd5d07                     call       0x7f75ef9d0de0
04548 49ba608c63e0757f0000           movabs     r10, 0x7f75e0638c60
04552 4c89542408                     mov        qword ptr [rsp + 8], r10
04557 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0455f e87c5c5e07                     call       0x7f75ef9d6d60
04564 e94accffff                     jmp        0x7f75e83edd33
04569 49ba48d640e0757f0000           movabs     r10, 0x7f75e040d648
04573 4c89542408                     mov        qword ptr [rsp + 8], r10
04578 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04580 e85b5c5e07                     call       0x7f75ef9d6d60
04585 e976ccffff                     jmp        0x7f75e83edd80
0458a 49bab0af3be0757f0000           movabs     r10, 0x7f75e03bafb0
04594 4c89542408                     mov        qword ptr [rsp + 8], r10
04599 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045a1 e83a5c5e07                     call       0x7f75ef9d6d60
045a6 e98dccffff                     jmp        0x7f75e83eddb8
045ab 49ba305a63e0757f0000           movabs     r10, 0x7f75e0635a30
045b5 4c89542408                     mov        qword ptr [rsp + 8], r10
045ba 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045c2 e8195c5e07                     call       0x7f75ef9d6d60
045c7 e9dbcdffff                     jmp        0x7f75e83edf27
045cc 49ba082978e0757f0000           movabs     r10, 0x7f75e0782908
045d6 4c89542408                     mov        qword ptr [rsp + 8], r10
045db 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045e3 e8f85b5e07                     call       0x7f75ef9d6d60
045e8 e964ceffff                     jmp        0x7f75e83edfd1
045ed 49ba30f516e0757f0000           movabs     r10, 0x7f75e016f530
045f7 4c89542408                     mov        qword ptr [rsp + 8], r10
045fc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04604 e8d75b5e07                     call       0x7f75ef9d6d60
04609 e981ceffff                     jmp        0x7f75e83ee00f
0460e 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04616 e8453d5e07                     call       0x7f75ef9d4ee0
0461b 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04623 e8383d5e07                     call       0x7f75ef9d4ee0
04628 49ba68cd68e0757f0000           movabs     r10, 0x7f75e068cd68
04632 4c89542408                     mov        qword ptr [rsp + 8], r10
04637 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0463f e89c5b5e07                     call       0x7f75ef9d6d60
04644 e91ecfffff                     jmp        0x7f75e83ee0e7
04649 49ba183669e0757f0000           movabs     r10, 0x7f75e0693618
04653 4c89542408                     mov        qword ptr [rsp + 8], r10
04658 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04660 e87b5b5e07                     call       0x7f75ef9d6d60
04665 e935cfffff                     jmp        0x7f75e83ee11f
0466a 49ba60d76be0757f0000           movabs     r10, 0x7f75e06bd760
04674 4c89542408                     mov        qword ptr [rsp + 8], r10
04679 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04681 e85a5b5e07                     call       0x7f75ef9d6d60
04686 e9c0cfffff                     jmp        0x7f75e83ee1cb
0468b 49baf87363e0757f0000           movabs     r10, 0x7f75e06373f8
04695 4c89542408                     mov        qword ptr [rsp + 8], r10
0469a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046a2 e8395b5e07                     call       0x7f75ef9d6d60
046a7 e9d7cfffff                     jmp        0x7f75e83ee203
046ac 49ba309d6be0757f0000           movabs     r10, 0x7f75e06b9d30
046b6 4c89542408                     mov        qword ptr [rsp + 8], r10
046bb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046c3 e8185b5e07                     call       0x7f75ef9d6d60
046c8 e93ad0ffff                     jmp        0x7f75e83ee287
046cd 49ba608c63e0757f0000           movabs     r10, 0x7f75e0638c60
046d7 4c89542408                     mov        qword ptr [rsp + 8], r10
046dc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046e4 e8f75a5e07                     call       0x7f75ef9d6d60
046e9 e92ed1ffff                     jmp        0x7f75e83ee39c
046ee 49ba48d640e0757f0000           movabs     r10, 0x7f75e040d648
046f8 4c89542408                     mov        qword ptr [rsp + 8], r10
046fd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04705 e8d65a5e07                     call       0x7f75ef9d6d60
0470a e953d1ffff                     jmp        0x7f75e83ee3e2
0470f 49bab0af3be0757f0000           movabs     r10, 0x7f75e03bafb0
04719 4c89542408                     mov        qword ptr [rsp + 8], r10
0471e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04726 e8b55a5e07                     call       0x7f75ef9d6d60
0472b e96ad1ffff                     jmp        0x7f75e83ee41a
04730 48890424                       mov        qword ptr [rsp], rax
04734 e827235e07                     call       0x7f75ef9d35e0
04739 e822fb5d07                     call       0x7f75ef9d0de0
0473e 49bac06763e0757f0000           movabs     r10, 0x7f75e06367c0
04748 4c89542408                     mov        qword ptr [rsp + 8], r10
0474d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04755 e8865a5e07                     call       0x7f75ef9d6d60
0475a e94bd3ffff                     jmp        0x7f75e83ee62a
0475f e8fcfa5d07                     call       0x7f75ef9d0de0
04764 49ba082978e0757f0000           movabs     r10, 0x7f75e0782908
0476e 4c89542408                     mov        qword ptr [rsp + 8], r10
04773 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0477b e8605a5e07                     call       0x7f75ef9d6d60
04780 e9edd3ffff                     jmp        0x7f75e83ee6f2
04785 49ba30f516e0757f0000           movabs     r10, 0x7f75e016f530
0478f 4c89542408                     mov        qword ptr [rsp + 8], r10
04794 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0479c e83f5a5e07                     call       0x7f75ef9d6d60
047a1 e90ad4ffff                     jmp        0x7f75e83ee730
047a6 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
047ae e8ad3b5e07                     call       0x7f75ef9d4ee0
047b3 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
047bb e8a03b5e07                     call       0x7f75ef9d4ee0
047c0 e89bfa5d07                     call       0x7f75ef9d0de0
047c5 49ba608c63e0757f0000           movabs     r10, 0x7f75e0638c60
047cf 4c89542408                     mov        qword ptr [rsp + 8], r10
047d4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047dc e8ff595e07                     call       0x7f75ef9d6d60
047e1 e9b5d5ffff                     jmp        0x7f75e83ee91b
047e6 49ba48d640e0757f0000           movabs     r10, 0x7f75e040d648
047f0 4c89542408                     mov        qword ptr [rsp + 8], r10
047f5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047fd e8de595e07                     call       0x7f75ef9d6d60
04802 e9e1d5ffff                     jmp        0x7f75e83ee968
04807 49bab0af3be0757f0000           movabs     r10, 0x7f75e03bafb0
04811 4c89542408                     mov        qword ptr [rsp + 8], r10
04816 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0481e e8bd595e07                     call       0x7f75ef9d6d60
04823 e9f8d5ffff                     jmp        0x7f75e83ee9a0
04828 49bad8e570e0757f0000           movabs     r10, 0x7f75e070e5d8
04832 4c89542408                     mov        qword ptr [rsp + 8], r10
04837 48c704240a020000               mov        qword ptr [rsp], 0x20a
0483f e89c595e07                     call       0x7f75ef9d6d60
04844 e9ecd6ffff                     jmp        0x7f75e83eeab5
04849 660f1f440000                   nop        word ptr [rax + rax]
0484f e88cf45107                     call       0x7f75ef910860
04854 e9cdd7ffff                     jmp        0x7f75e83eeba6
04859 660f1f440000                   nop        word ptr [rax + rax]
0485f e87cf45107                     call       0x7f75ef910860
04864 e94ad9ffff                     jmp        0x7f75e83eed33
04869 49ba680d71e0757f0000           movabs     r10, 0x7f75e0710d68
04873 4c89542408                     mov        qword ptr [rsp + 8], r10
04878 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04880 e85b595e07                     call       0x7f75ef9d6d60
04885 e9a8d9ffff                     jmp        0x7f75e83eedb2
0488a 49b80000000000000000           movabs     r8, 0
04894 b8000f050a                     mov        eax, 0xa050f00
04899 e842505e07                     call       0x7f75ef9d6460
0489e e995d9ffff                     jmp        0x7f75e83eedb8
048a3 49bad8e570e0757f0000           movabs     r10, 0x7f75e070e5d8
048ad 4c89542408                     mov        qword ptr [rsp + 8], r10
048b2 48c70424aa020000               mov        qword ptr [rsp], 0x2aa
048ba e821595e07                     call       0x7f75ef9d6d60
048bf e9b8daffff                     jmp        0x7f75e83eeefc
048c4 49ba305a63e0757f0000           movabs     r10, 0x7f75e0635a30
048ce 4c89542408                     mov        qword ptr [rsp + 8], r10
048d3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048db e800595e07                     call       0x7f75ef9d6d60
048e0 e98ddbffff                     jmp        0x7f75e83eeff2
048e5 e876f95d07                     call       0x7f75ef9d0de0
048ea 49ba082978e0757f0000           movabs     r10, 0x7f75e0782908
048f4 4c89542408                     mov        qword ptr [rsp + 8], r10
048f9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04901 e8da585e07                     call       0x7f75ef9d6d60
04906 e910dcffff                     jmp        0x7f75e83ef09b
0490b 49ba30f516e0757f0000           movabs     r10, 0x7f75e016f530
04915 4c89542408                     mov        qword ptr [rsp + 8], r10
0491a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04922 e8b9585e07                     call       0x7f75ef9d6d60
04927 e928dcffff                     jmp        0x7f75e83ef0d4
0492c 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04934 e8273a5e07                     call       0x7f75ef9d4ee0
04939 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04941 e81a3a5e07                     call       0x7f75ef9d4ee0
04946 49ba68cd68e0757f0000           movabs     r10, 0x7f75e068cd68
04950 4c89542408                     mov        qword ptr [rsp + 8], r10
04955 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0495d e87e585e07                     call       0x7f75ef9d6d60
04962 e9bcdcffff                     jmp        0x7f75e83ef1a3
04967 49ba183669e0757f0000           movabs     r10, 0x7f75e0693618
04971 4c89542408                     mov        qword ptr [rsp + 8], r10
04976 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0497e e85d585e07                     call       0x7f75ef9d6d60
04983 e9cedcffff                     jmp        0x7f75e83ef1d6
04988 49ba60d76be0757f0000           movabs     r10, 0x7f75e06bd760
04992 4c89542408                     mov        qword ptr [rsp + 8], r10
04997 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0499f e83c585e07                     call       0x7f75ef9d6d60
049a4 e95dddffff                     jmp        0x7f75e83ef286
049a9 49baf87363e0757f0000           movabs     r10, 0x7f75e06373f8
049b3 4c89542408                     mov        qword ptr [rsp + 8], r10
049b8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049c0 e81b585e07                     call       0x7f75ef9d6d60
049c5 e977ddffff                     jmp        0x7f75e83ef2c1
049ca 49ba309d6be0757f0000           movabs     r10, 0x7f75e06b9d30
049d4 4c89542408                     mov        qword ptr [rsp + 8], r10
049d9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049e1 e8fa575e07                     call       0x7f75ef9d6d60
049e6 e9d5ddffff                     jmp        0x7f75e83ef340
049eb 49ba608c63e0757f0000           movabs     r10, 0x7f75e0638c60
049f5 4c89542408                     mov        qword ptr [rsp + 8], r10
049fa 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a02 e8d9575e07                     call       0x7f75ef9d6d60
04a07 e9c4deffff                     jmp        0x7f75e83ef450
04a0c 49ba48d640e0757f0000           movabs     r10, 0x7f75e040d648
04a16 4c89542408                     mov        qword ptr [rsp + 8], r10
04a1b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a23 e8b8575e07                     call       0x7f75ef9d6d60
04a28 e9e4deffff                     jmp        0x7f75e83ef491
04a2d 49bab0af3be0757f0000           movabs     r10, 0x7f75e03bafb0
04a37 4c89542408                     mov        qword ptr [rsp + 8], r10
04a3c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a44 e897575e07                     call       0x7f75ef9d6d60
04a49 e9f6deffff                     jmp        0x7f75e83ef4c4
04a4e 48890424                       mov        qword ptr [rsp], rax
04a52 e809205e07                     call       0x7f75ef9d35e0
04a57 e804f85d07                     call       0x7f75ef9d0de0
04a5c 49bac06763e0757f0000           movabs     r10, 0x7f75e06367c0
04a66 4c89542408                     mov        qword ptr [rsp + 8], r10
04a6b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a73 e868575e07                     call       0x7f75ef9d6d60
04a78 e9cde0ffff                     jmp        0x7f75e83ef6ca
04a7d 49ba082978e0757f0000           movabs     r10, 0x7f75e0782908
04a87 4c89542408                     mov        qword ptr [rsp + 8], r10
04a8c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a94 e847575e07                     call       0x7f75ef9d6d60
04a99 e969e1ffff                     jmp        0x7f75e83ef787
04a9e 49ba30f516e0757f0000           movabs     r10, 0x7f75e016f530
04aa8 4c89542408                     mov        qword ptr [rsp + 8], r10
04aad 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ab5 e826575e07                     call       0x7f75ef9d6d60
04aba e98fe1ffff                     jmp        0x7f75e83ef7ce
04abf 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04ac7 e894385e07                     call       0x7f75ef9d4ee0
04acc 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04ad4 e887385e07                     call       0x7f75ef9d4ee0
04ad9 e882f75d07                     call       0x7f75ef9d0de0
04ade 49ba608c63e0757f0000           movabs     r10, 0x7f75e0638c60
04ae8 4c89542408                     mov        qword ptr [rsp + 8], r10
04aed 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04af5 e8e6565e07                     call       0x7f75ef9d6d60
04afa e93ce3ffff                     jmp        0x7f75e83ef9bb
04aff 49ba48d640e0757f0000           movabs     r10, 0x7f75e040d648
04b09 4c89542408                     mov        qword ptr [rsp + 8], r10
04b0e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b16 e8c5565e07                     call       0x7f75ef9d6d60
04b1b e968e3ffff                     jmp        0x7f75e83efa08
04b20 49bab0af3be0757f0000           movabs     r10, 0x7f75e03bafb0
04b2a 4c89542408                     mov        qword ptr [rsp + 8], r10
04b2f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b37 e8a4565e07                     call       0x7f75ef9d6d60
04b3c e97fe3ffff                     jmp        0x7f75e83efa40
04b41 49bad8e570e0757f0000           movabs     r10, 0x7f75e070e5d8
04b4b 4c89542408                     mov        qword ptr [rsp + 8], r10
04b50 48c70424e8020000               mov        qword ptr [rsp], 0x2e8
04b58 e883565e07                     call       0x7f75ef9d6d60
04b5d e970e4ffff                     jmp        0x7f75e83efb52
04b62 49ba680d71e0757f0000           movabs     r10, 0x7f75e0710d68
04b6c 4c89542408                     mov        qword ptr [rsp + 8], r10
04b71 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b79 e862565e07                     call       0x7f75ef9d6d60
04b7e e92fe5ffff                     jmp        0x7f75e83efc32
04b83 49b80000000000000000           movabs     r8, 0
04b8d b8000f050a                     mov        eax, 0xa050f00
04b92 e8494d5e07                     call       0x7f75ef9d6460
04b97 e91ce5ffff                     jmp        0x7f75e83efc38
04b9c 49bad8e570e0757f0000           movabs     r10, 0x7f75e070e5d8
04ba6 4c89542408                     mov        qword ptr [rsp + 8], r10
04bab 48c7042420030000               mov        qword ptr [rsp], 0x320
04bb3 e828565e07                     call       0x7f75ef9d6d60
04bb8 e93fe6ffff                     jmp        0x7f75e83efd7c
04bbd 49ba305a63e0757f0000           movabs     r10, 0x7f75e0635a30
04bc7 4c89542408                     mov        qword ptr [rsp + 8], r10
04bcc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bd4 e807565e07                     call       0x7f75ef9d6d60
04bd9 e9ffe6ffff                     jmp        0x7f75e83efe5d
04bde e87df65d07                     call       0x7f75ef9d0de0
04be3 49ba082978e0757f0000           movabs     r10, 0x7f75e0782908
04bed 4c89542408                     mov        qword ptr [rsp + 8], r10
04bf2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bfa e8e1555e07                     call       0x7f75ef9d6d60
04bff e981e7ffff                     jmp        0x7f75e83eff05
04c04 49ba30f516e0757f0000           movabs     r10, 0x7f75e016f530
04c0e 4c89542408                     mov        qword ptr [rsp + 8], r10
04c13 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c1b e8c0555e07                     call       0x7f75ef9d6d60
04c20 e999e7ffff                     jmp        0x7f75e83eff3e
04c25 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04c2d e82e375e07                     call       0x7f75ef9d4ee0
04c32 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04c3a e821375e07                     call       0x7f75ef9d4ee0
04c3f 49ba68cd68e0757f0000           movabs     r10, 0x7f75e068cd68
04c49 4c89542408                     mov        qword ptr [rsp + 8], r10
04c4e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c56 e885555e07                     call       0x7f75ef9d6d60
04c5b e925e8ffff                     jmp        0x7f75e83f0005
04c60 49ba183669e0757f0000           movabs     r10, 0x7f75e0693618
04c6a 4c89542408                     mov        qword ptr [rsp + 8], r10
04c6f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c77 e864555e07                     call       0x7f75ef9d6d60
04c7c e937e8ffff                     jmp        0x7f75e83f0038
04c81 49ba60d76be0757f0000           movabs     r10, 0x7f75e06bd760
04c8b 4c89542408                     mov        qword ptr [rsp + 8], r10
04c90 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c98 e843555e07                     call       0x7f75ef9d6d60
04c9d e9b9e8ffff                     jmp        0x7f75e83f00db
04ca2 49baf87363e0757f0000           movabs     r10, 0x7f75e06373f8
04cac 4c89542408                     mov        qword ptr [rsp + 8], r10
04cb1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cb9 e822555e07                     call       0x7f75ef9d6d60
04cbe e9cee8ffff                     jmp        0x7f75e83f0111
04cc3 49ba309d6be0757f0000           movabs     r10, 0x7f75e06b9d30
04ccd 4c89542408                     mov        qword ptr [rsp + 8], r10
04cd2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cda e801555e07                     call       0x7f75ef9d6d60
04cdf e92ce9ffff                     jmp        0x7f75e83f0190
04ce4 49ba608c63e0757f0000           movabs     r10, 0x7f75e0638c60
04cee 4c89542408                     mov        qword ptr [rsp + 8], r10
04cf3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cfb e8e0545e07                     call       0x7f75ef9d6d60
04d00 e91beaffff                     jmp        0x7f75e83f02a0
04d05 49ba48d640e0757f0000           movabs     r10, 0x7f75e040d648
04d0f 4c89542408                     mov        qword ptr [rsp + 8], r10
04d14 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d1c e8bf545e07                     call       0x7f75ef9d6d60
04d21 e93beaffff                     jmp        0x7f75e83f02e1
04d26 49bab0af3be0757f0000           movabs     r10, 0x7f75e03bafb0
04d30 4c89542408                     mov        qword ptr [rsp + 8], r10
04d35 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d3d e89e545e07                     call       0x7f75ef9d6d60
04d42 e94deaffff                     jmp        0x7f75e83f0314
04d47 48890424                       mov        qword ptr [rsp], rax
04d4b e8101d5e07                     call       0x7f75ef9d35e0
04d50 e80bf55d07                     call       0x7f75ef9d0de0
04d55 49bac06763e0757f0000           movabs     r10, 0x7f75e06367c0
04d5f 4c89542408                     mov        qword ptr [rsp + 8], r10
04d64 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d6c e86f545e07                     call       0x7f75ef9d6d60
04d71 e924ecffff                     jmp        0x7f75e83f051a
04d76 49ba082978e0757f0000           movabs     r10, 0x7f75e0782908
04d80 4c89542408                     mov        qword ptr [rsp + 8], r10
04d85 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d8d e84e545e07                     call       0x7f75ef9d6d60
04d92 e9c0ecffff                     jmp        0x7f75e83f05d7
04d97 49ba30f516e0757f0000           movabs     r10, 0x7f75e016f530
04da1 4c89542408                     mov        qword ptr [rsp + 8], r10
04da6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04dae e82d545e07                     call       0x7f75ef9d6d60
04db3 e9e3ecffff                     jmp        0x7f75e83f061b
04db8 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04dc0 e89b355e07                     call       0x7f75ef9d4ee0
04dc5 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04dcd e88e355e07                     call       0x7f75ef9d4ee0
04dd2 e889f45d07                     call       0x7f75ef9d0de0
04dd7 49ba608c63e0757f0000           movabs     r10, 0x7f75e0638c60
04de1 4c89542408                     mov        qword ptr [rsp + 8], r10
04de6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04dee e8ed535e07                     call       0x7f75ef9d6d60
04df3 e98beeffff                     jmp        0x7f75e83f0803
04df8 49ba48d640e0757f0000           movabs     r10, 0x7f75e040d648
04e02 4c89542408                     mov        qword ptr [rsp + 8], r10
04e07 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e0f e8cc535e07                     call       0x7f75ef9d6d60
04e14 e9b7eeffff                     jmp        0x7f75e83f0850
04e19 49bab0af3be0757f0000           movabs     r10, 0x7f75e03bafb0
04e23 4c89542408                     mov        qword ptr [rsp + 8], r10
04e28 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e30 e8ab535e07                     call       0x7f75ef9d6d60
04e35 e9ceeeffff                     jmp        0x7f75e83f0888
04e3a 49bad8e570e0757f0000           movabs     r10, 0x7f75e070e5d8
04e44 4c89542408                     mov        qword ptr [rsp + 8], r10
04e49 48c704245a030000               mov        qword ptr [rsp], 0x35a
04e51 e88a535e07                     call       0x7f75ef9d6d60
04e56 e9d4efffff                     jmp        0x7f75e83f09af
04e5b 0f1f4000                       nop        dword ptr [rax]
04e5f e87cee5107                     call       0x7f75ef910860
04e64 e992f1ffff                     jmp        0x7f75e83f0b7b
04e69 49ba9c0b3fe8757f0000           movabs     r10, 0x7f75e83f0b9c
04e73 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
04e7a e9e1145207                     jmp        0x7f75ef912ee0
04e7f 48ba0000000000000000           movabs     rdx, 0
04e89 b8000f050a                     mov        eax, 0xa050f00
04e8e e84d3e5e07                     call       0x7f75ef9d5860
04e93 e9b8f1ffff                     jmp        0x7f75e83f0bd0
04e98 e8c3f35d07                     call       0x7f75ef9d0de0
04e9d 488bd2                         mov        rdx, rdx
04ea0 e83b015e07                     call       0x7f75ef9d1b60
04ea5 e9f9f1ffff                     jmp        0x7f75e83f0c23
04eaa 48ba0000000000000000           movabs     rdx, 0
04eb4 b8000f050a                     mov        eax, 0xa050f00
04eb9 e8224a5e07                     call       0x7f75ef9d6460
04ebe e9e5f1ffff                     jmp        0x7f75e83f0c28
04ec3 48ba0000000000000000           movabs     rdx, 0
04ecd b8000f050a                     mov        eax, 0xa050f00
04ed2 e8093e5e07                     call       0x7f75ef9d5860
04ed7 e964f2ffff                     jmp        0x7f75e83f0cc0
04edc e87ff35d07                     call       0x7f75ef9d0de0
04ee1 488bd2                         mov        rdx, rdx
04ee4 e8f7005e07                     call       0x7f75ef9d1b60
04ee9 e9a5f2ffff                     jmp        0x7f75e83f0d13
04eee 48ba0000000000000000           movabs     rdx, 0
04ef8 b8000f050a                     mov        eax, 0xa050f00
04efd e8de3d5e07                     call       0x7f75ef9d5860
04f02 e9e1f2ffff                     jmp        0x7f75e83f0d68
04f07 e854f35d07                     call       0x7f75ef9d0de0
04f0c 488bd2                         mov        rdx, rdx
04f0f e8cc005e07                     call       0x7f75ef9d1b60
04f14 e922f3ffff                     jmp        0x7f75e83f0dbb
04f19 498b8778050000                 mov        rax, qword ptr [r15 + 0x578]
04f20 49c7877805000000000000         mov        qword ptr [r15 + 0x578], 0
04f2b 49c7878005000000000000         mov        qword ptr [r15 + 0x580], 0
04f36 4881c450020000                 add        rsp, 0x250
04f3d 5d                             pop        rbp
04f3e e91de45d07                     jmp        0x7f75ef9cfee0
04f43 f4                             hlt        
04f44 f4                             hlt        
04f45 f4                             hlt        
04f46 f4                             hlt        
04f47 f4                             hlt        
