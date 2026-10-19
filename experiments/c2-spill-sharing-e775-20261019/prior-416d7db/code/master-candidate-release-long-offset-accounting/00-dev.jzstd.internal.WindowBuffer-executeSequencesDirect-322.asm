00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f8540b75307                   jne        0x7f98bf8fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ec50020000                 sub        rsp, 0x250
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 7405                           je         0x7f98b83bf23f
0003a e861b85207                     call       0x7f98bf8eaaa0
0003f 4889b42448010000               mov        qword ptr [rsp + 0x148], rsi
00047 4889942468010000               mov        qword ptr [rsp + 0x168], rdx
0004f 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
00056 4c89842428010000               mov        qword ptr [rsp + 0x128], r8
0005e 4c898c2420010000               mov        qword ptr [rsp + 0x120], r9
00066 89bc2430010000                 mov        dword ptr [rsp + 0x130], edi
0006d 48bbd8ab70b0987f0000           movabs     rbx, 0x7f98b070abd8
00077 8b4370                         mov        eax, dword ptr [rbx + 0x70]
0007a 83c002                         add        eax, 2
0007d 894370                         mov        dword ptr [rbx + 0x70], eax
00080 25fe070000                     and        eax, 0x7fe
00085 85c0                           test       eax, eax
00087 0f84c4410000                   je         0x7f98b83c3451
0008d 48bbd8ab70b0987f0000           movabs     rbx, 0x7f98b070abd8
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
000e1 48b8d8ab70b0987f0000           movabs     rax, 0x7f98b070abd8
000eb b9f8000000                     mov        ecx, 0xf8
000f0 7f05                           jg         0x7f98b83bf2f7
000f2 b908010000                     mov        ecx, 0x108
000f7 44899c2440010000               mov        dword ptr [rsp + 0x140], r11d
000ff 4c8b1c08                       mov        r11, qword ptr [rax + rcx]
00103 4d8d5b01                       lea        r11, [r11 + 1]
00107 4c891c08                       mov        qword ptr [rax + rcx], r11
0010b 0f8fa0400000                   jg         0x7f98b83c33b1
00111 4863db                         movsxd     rbx, ebx
00114 488b4e20                       mov        rcx, qword ptr [rsi + 0x20]
00118 482bcf                         sub        rcx, rdi
0011b 483bcb                         cmp        rcx, rbx
0011e 48b9d8ab70b0987f0000           movabs     rcx, 0x7f98b070abd8
00128 b828010000                     mov        eax, 0x128
0012d 7c05                           jl         0x7f98b83bf334
0012f b818010000                     mov        eax, 0x118
00134 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
00138 4d8d5b01                       lea        r11, [r11 + 1]
0013c 4c891c01                       mov        qword ptr [rcx + rax], r11
00140 0f8c6b400000                   jl         0x7f98b83c33b1
00146 48b9d8ab70b0987f0000           movabs     rcx, 0x7f98b070abd8
00150 ff8158010000                   inc        dword ptr [rcx + 0x158]
00156 b900000000                     mov        ecx, 0
0015b 498bc0                         mov        rax, r8
0015e 483bc1                         cmp        rax, rcx
00161 48b9d8ab70b0987f0000           movabs     rcx, 0x7f98b070abd8
0016b b868010000                     mov        eax, 0x168
00170 7505                           jne        0x7f98b83bf377
00172 b878010000                     mov        eax, 0x178
00177 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
0017b 4d8d5b01                       lea        r11, [r11 + 1]
0017f 4c891c01                       mov        qword ptr [rcx + rax], r11
00183 0f8531000000                   jne        0x7f98b83bf3ba
00189 4803df                         add        rbx, rdi
0018c 498bc9                         mov        rcx, r9
0018f 483bcb                         cmp        rcx, rbx
00192 48b9d8ab70b0987f0000           movabs     rcx, 0x7f98b070abd8
0019c bf98010000                     mov        edi, 0x198
001a1 7d05                           jge        0x7f98b83bf3a8
001a3 bf88010000                     mov        edi, 0x188
001a8 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
001ac 488d5b01                       lea        rbx, [rbx + 1]
001b0 48891c39                       mov        qword ptr [rcx + rdi], rbx
001b4 0f8d0a000000                   jge        0x7f98b83bf3c4
001ba bf00000000                     mov        edi, 0
001bf e915000000                     jmp        0x7f98b83bf3d9
001c4 48b9d8ab70b0987f0000           movabs     rcx, 0x7f98b070abd8
001ce ff81a8010000                   inc        dword ptr [rcx + 0x1a8]
001d4 bf01000000                     mov        edi, 1
001d9 4d2bc6                         sub        r8, r14
001dc 4c89842480010000               mov        qword ptr [rsp + 0x180], r8
001e4 48b9d8ab70b0987f0000           movabs     rcx, 0x7f98b070abd8
001ee 488381c001000001               add        qword ptr [rcx + 0x1c0], 1
001f6 48b938986eb0987f0000           movabs     rcx, 0x7f98b06e9838
00200 8b5970                         mov        ebx, dword ptr [rcx + 0x70]
00203 83c302                         add        ebx, 2
00206 895970                         mov        dword ptr [rcx + 0x70], ebx
00209 81e3feff1f00                   and        ebx, 0x1ffffe
0020f 85db                           test       ebx, ebx
00211 0f845b400000                   je         0x7f98b83c3472
00217 48b9ffffffffffffff7f           movabs     rcx, 0x7fffffffffffffff
00221 493bc9                         cmp        rcx, r9
00224 48b938986eb0987f0000           movabs     rcx, 0x7f98b06e9838
0022e bbb8000000                     mov        ebx, 0xb8
00233 7d05                           jge        0x7f98b83bf43a
00235 bba8000000                     mov        ebx, 0xa8
0023a 488b0419                       mov        rax, qword ptr [rcx + rbx]
0023e 488d4001                       lea        rax, [rax + 1]
00242 48890419                       mov        qword ptr [rcx + rbx], rax
00246 0f8d0f000000                   jge        0x7f98b83bf45b
0024c 49b9ffffffffffffff7f           movabs     r9, 0x7fffffffffffffff
00256 e910000000                     jmp        0x7f98b83bf46b
0025b 48b938986eb0987f0000           movabs     rcx, 0x7f98b06e9838
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
002f2 48bfd8ab70b0987f0000           movabs     rdi, 0x7f98b070abd8
002fc b8d0010000                     mov        eax, 0x1d0
00301 7d05                           jge        0x7f98b83bf508
00303 b8e0010000                     mov        eax, 0x1e0
00308 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
0030c 4d8d5b01                       lea        r11, [r11 + 1]
00310 4c891c07                       mov        qword ptr [rdi + rax], r11
00314 0f8df23b0000                   jge        0x7f98b83c310c
0031a 413b5004                       cmp        edx, dword ptr [r8 + 4]
0031e 0f837e3f0000                   jae        0x7f98b83c34a2
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
00367 48b9d8ab70b0987f0000           movabs     rcx, 0x7f98b070abd8
00371 41b8f0010000                   mov        r8d, 0x1f0
00377 7d06                           jge        0x7f98b83bf57f
00379 41b800020000                   mov        r8d, 0x200
0037f 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00383 4d8d6d01                       lea        r13, [r13 + 1]
00387 4e892c01                       mov        qword ptr [rcx + r8], r13
0038b 0f8d15000000                   jge        0x7f98b83bf5a6
00391 413b5104                       cmp        edx, dword ptr [r9 + 4]
00395 0f831f3f0000                   jae        0x7f98b83c34ba
0039b 4863ca                         movsxd     rcx, edx
0039e 418b4c8908                     mov        ecx, dword ptr [r9 + rcx*4 + 8]
003a3 488bc1                         mov        rax, rcx
003a6 85ff                           test       edi, edi
003a8 48b9d8ab70b0987f0000           movabs     rcx, 0x7f98b070abd8
003b2 41b810020000                   mov        r8d, 0x210
003b8 7406                           je         0x7f98b83bf5c0
003ba 41b820020000                   mov        r8d, 0x220
003c0 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003c4 4d8d6d01                       lea        r13, [r13 + 1]
003c8 4e892c01                       mov        qword ptr [rcx + r8], r13
003cc 0f8431000000                   je         0x7f98b83bf603
003d2 498bcb                         mov        rcx, r11
003d5 2bce                           sub        ecx, esi
003d7 3bf9                           cmp        edi, ecx
003d9 48b9d8ab70b0987f0000           movabs     rcx, 0x7f98b070abd8
003e3 41b840020000                   mov        r8d, 0x240
003e9 7f06                           jg         0x7f98b83bf5f1
003eb 41b830020000                   mov        r8d, 0x230
003f1 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003f5 4d8d6d01                       lea        r13, [r13 + 1]
003f9 4e892c01                       mov        qword ptr [rcx + r8], r13
003fd 0f8f0e3d0000                   jg         0x7f98b83c3311
00403 83f803                         cmp        eax, 3
00406 48b9d8ab70b0987f0000           movabs     rcx, 0x7f98b070abd8
00410 41b860020000                   mov        r8d, 0x260
00416 7e06                           jle        0x7f98b83bf61e
00418 41b870020000                   mov        r8d, 0x270
0041e 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00422 4d8d6d01                       lea        r13, [r13 + 1]
00426 4e892c01                       mov        qword ptr [rcx + r8], r13
0042a 0f8e59000000                   jle        0x7f98b83bf689
00430 83e803                         sub        eax, 3
00433 837b0401                       cmp        dword ptr [rbx + 4], 1
00437 0f86953e0000                   jbe        0x7f98b83c34d2
0043d 8b4b0c                         mov        ecx, dword ptr [rbx + 0xc]
00440 837b0402                       cmp        dword ptr [rbx + 4], 2
00444 0f869a3e0000                   jbe        0x7f98b83c34e4
0044a 894b10                         mov        dword ptr [rbx + 0x10], ecx
0044d 8b4b08                         mov        ecx, dword ptr [rbx + 8]
00450 894b0c                         mov        dword ptr [rbx + 0xc], ecx
00453 894308                         mov        dword ptr [rbx + 8], eax
00456 48b9d8ab70b0987f0000           movabs     rcx, 0x7f98b070abd8
00460 ff8180020000                   inc        dword ptr [rcx + 0x280]
00466 89942444010000                 mov        dword ptr [rsp + 0x144], edx
0046d 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
00474 4c8bb42488010000               mov        r14, qword ptr [rsp + 0x188]
0047c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
00484 e952000000                     jmp        0x7f98b83bf6db
00489 89942444010000                 mov        dword ptr [rsp + 0x144], edx
00490 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
00497 49b8d8ab70b0987f0000           movabs     r8, 0x7f98b070abd8
004a1 4983809802000001               add        qword ptr [r8 + 0x298], 1
004a9 488bf3                         mov        rsi, rbx
004ac 488bd0                         mov        rdx, rax
004af 488bcf                         mov        rcx, rdi
004b2 0f1f440000                     nop        dword ptr [rax + rax]
004b7 e8a4c15307                     call       0x7f98bf8fb860
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
004f0 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
004fa b9b8020000                     mov        ecx, 0x2b8
004ff 7d05                           jge        0x7f98b83bf706
00501 b9a8020000                     mov        ecx, 0x2a8
00506 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0050a 4d8d4001                       lea        r8, [r8 + 1]
0050e 4c89040a                       mov        qword ptr [rdx + rcx], r8
00512 0f8d15000000                   jge        0x7f98b83bf72d
00518 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00520 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00528 e9ad000000                     jmp        0x7f98b83bf7da
0052d 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00535 4585ed                         test       r13d, r13d
00538 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
00542 b9c8020000                     mov        ecx, 0x2c8
00547 7505                           jne        0x7f98b83bf74e
00549 b9d8020000                     mov        ecx, 0x2d8
0054e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
00552 4d8d4001                       lea        r8, [r8 + 1]
00556 4c89040a                       mov        qword ptr [rdx + rcx], r8
0055a 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00562 0f8568000000                   jne        0x7f98b83bf7d0
00568 498bd3                         mov        rdx, r11
0056b 03d7                           add        edx, edi
0056d 2bd0                           sub        edx, eax
0056f 4863d2                         movsxd     rdx, edx
00572 493bd0                         cmp        rdx, r8
00575 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
0057f b9e8020000                     mov        ecx, 0x2e8
00584 7c05                           jl         0x7f98b83bf78b
00586 b9f8020000                     mov        ecx, 0x2f8
0058b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0058f 4d8d4901                       lea        r9, [r9 + 1]
00593 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00597 0f8c3d000000                   jl         0x7f98b83bf7da
0059d 4c8b8c2450010000               mov        r9, qword ptr [rsp + 0x150]
005a5 4c3bcb                         cmp        r9, rbx
005a8 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
005b2 b918030000                     mov        ecx, 0x318
005b7 7c05                           jl         0x7f98b83bf7be
005b9 b908030000                     mov        ecx, 0x308
005be 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
005c2 4d8d4901                       lea        r9, [r9 + 1]
005c6 4c890c0a                       mov        qword ptr [rdx + rcx], r9
005ca 0f8c0a000000                   jl         0x7f98b83bf7da
005d0 ba00000000                     mov        edx, 0
005d5 e915000000                     jmp        0x7f98b83bf7ef
005da 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
005e4 ff8228030000                   inc        dword ptr [rdx + 0x328]
005ea ba01000000                     mov        edx, 1
005ef 48899c2498010000               mov        qword ptr [rsp + 0x198], rbx
005f7 85c0                           test       eax, eax
005f9 48b9d8ab70b0987f0000           movabs     rcx, 0x7f98b070abd8
00603 41b940030000                   mov        r9d, 0x340
00609 7e06                           jle        0x7f98b83bf811
0060b 41b950030000                   mov        r9d, 0x350
00611 4a8b1c09                       mov        rbx, qword ptr [rcx + r9]
00615 488d5b01                       lea        rbx, [rbx + 1]
00619 4a891c09                       mov        qword ptr [rcx + r9], rbx
0061d 0f8e3f380000                   jle        0x7f98b83c3062
00623 85d2                           test       edx, edx
00625 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
0062f b970030000                     mov        ecx, 0x370
00634 7505                           jne        0x7f98b83bf83b
00636 b960030000                     mov        ecx, 0x360
0063b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0063f 4d8d4901                       lea        r9, [r9 + 1]
00643 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00647 0f8515380000                   jne        0x7f98b83c3062
0064d 498bdb                         mov        rbx, r11
00650 03df                           add        ebx, edi
00652 899c24a0010000                 mov        dword ptr [rsp + 0x1a0], ebx
00659 488bf3                         mov        rsi, rbx
0065c 03b42478010000                 add        esi, dword ptr [rsp + 0x178]
00663 3bb42458010000                 cmp        esi, dword ptr [rsp + 0x158]
0066a 48bed8ab70b0987f0000           movabs     rsi, 0x7f98b070abd8
00674 ba28040000                     mov        edx, 0x428
00679 7f05                           jg         0x7f98b83bf880
0067b ba38040000                     mov        edx, 0x438
00680 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
00684 488d4901                       lea        rcx, [rcx + 1]
00688 48890c16                       mov        qword ptr [rsi + rdx], rcx
0068c 0f8f3f000000                   jg         0x7f98b83bf8d1
00692 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
00699 03f7                           add        esi, edi
0069b 89b424a4010000                 mov        dword ptr [rsp + 0x1a4], esi
006a2 3bb4245c010000                 cmp        esi, dword ptr [rsp + 0x15c]
006a9 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
006b3 b958040000                     mov        ecx, 0x458
006b8 7e05                           jle        0x7f98b83bf8bf
006ba b948040000                     mov        ecx, 0x448
006bf 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
006c3 4d8d4901                       lea        r9, [r9 + 1]
006c7 4c890c0a                       mov        qword ptr [rdx + rcx], r9
006cb 0f8e76000000                   jle        0x7f98b83bf947
006d1 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
006d9 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
006e1 48bed8ab70b0987f0000           movabs     rsi, 0x7f98b070abd8
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
00727 e834bf5307                     call       0x7f98bf8fb860
0072c 0f1f840024080001               nop        dword ptr [rax + rax + 0x1000824]
00734 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
0073b 03b4247c010000                 add        esi, dword ptr [rsp + 0x17c]
00742 e999360000                     jmp        0x7f98b83c2fe0
00747 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
0074f 83ff10                         cmp        edi, 0x10
00752 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
0075c b968040000                     mov        ecx, 0x468
00761 7f05                           jg         0x7f98b83bf968
00763 b978040000                     mov        ecx, 0x478
00768 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0076c 4d8d4901                       lea        r9, [r9 + 1]
00770 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00774 0f8f870b0000                   jg         0x7f98b83c0501
0077a 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
00784 4883828804000001               add        qword ptr [rdx + 0x488], 1
0078c 48baa8b86eb0987f0000           movabs     rdx, 0x7f98b06eb8a8
00796 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00799 83c102                         add        ecx, 2
0079c 894a70                         mov        dword ptr [rdx + 0x70], ecx
0079f 81e1feff1f00                   and        ecx, 0x1ffffe
007a5 85c9                           test       ecx, ecx
007a7 0f84493b0000                   je         0x7f98b83c34f6
007ad 48bac09272e200000000           movabs     rdx, 0xe27292c0
007b7 48b9a8b86eb0987f0000           movabs     rcx, 0x7f98b06eb8a8
007c1 8b12                           mov        edx, dword ptr [rdx]
007c3 c1ea0d                         shr        edx, 0xd
007c6 48c1e20a                       shl        rdx, 0xa
007ca 41ba00000080                   mov        r10d, 0x80000000
007d0 4903d2                         add        rdx, r10
007d3 41ba16000000                   mov        r10d, 0x16
007d9 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
007dd 7436                           je         0x7f98b83bfa15
007df 4983c202                       add        r10, 2
007e3 4983fa1a                       cmp        r10, 0x1a
007e7 75f0                           jne        0x7f98b83bf9d9
007e9 41ba16000000                   mov        r10d, 0x16
007ef 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
007f4 7412                           je         0x7f98b83bfa08
007f6 4983c202                       add        r10, 2
007fa 4983fa1a                       cmp        r10, 0x1a
007fe 75ef                           jne        0x7f98b83bf9ef
00800 41ba15000000                   mov        r10d, 0x15
00806 eb11                           jmp        0x7f98b83bfa19
00808 50                             push       rax
00809 4833c0                         xor        rax, rax
0080c f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
00812 58                             pop        rax
00813 ebbe                           jmp        0x7f98b83bf9d3
00815 4983c201                       add        r10, 1
00819 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0081e 48baa8b86eb0987f0000           movabs     rdx, 0x7f98b06eb8a8
00828 488382d800000001               add        qword ptr [rdx + 0xd8], 1
00830 48bac8a46eb0987f0000           movabs     rdx, 0x7f98b06ea4c8
0083a 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0083d 83c102                         add        ecx, 2
00840 894a70                         mov        dword ptr [rdx + 0x70], ecx
00843 81e1feff1f00                   and        ecx, 0x1ffffe
00849 85c9                           test       ecx, ecx
0084b 0f84c63a0000                   je         0x7f98b83c3517
00851 448bac2490010000               mov        r13d, dword ptr [rsp + 0x190]
00859 48bac8a46eb0987f0000           movabs     rdx, 0x7f98b06ea4c8
00863 4883820801000001               add        qword ptr [rdx + 0x108], 1
0086b 8b942464010000                 mov        edx, dword ptr [rsp + 0x164]
00872 83ea0f                         sub        edx, 0xf
00875 48b9989b6eb0987f0000           movabs     rcx, 0x7f98b06e9b98
0087f 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00883 4183c102                       add        r9d, 2
00887 44894970                       mov        dword ptr [rcx + 0x70], r9d
0088b 4181e1feff1f00                 and        r9d, 0x1ffffe
00892 4585c9                         test       r9d, r9d
00895 0f849d3a0000                   je         0x7f98b83c3538
0089b 48b9989b6eb0987f0000           movabs     rcx, 0x7f98b06e9b98
008a5 488381a800000001               add        qword ptr [rcx + 0xa8], 1
008ad 48b90000000000000000           movabs     rcx, 0
008b7 b900000000                     mov        ecx, 0
008bc 443be9                         cmp        r13d, ecx
008bf 0f8c943a0000                   jl         0x7f98b83c3559
008c5 443bea                         cmp        r13d, edx
008c8 0f8d983a0000                   jge        0x7f98b83c3566
008ce 498bd5                         mov        rdx, r13
008d1 89942494010000                 mov        dword ptr [rsp + 0x194], edx
008d8 48b9c09272e200000000           movabs     rcx, 0xe27292c0
008e2 4c8bc9                         mov        r9, rcx
008e5 49bea8b86eb0987f0000           movabs     r14, 0x7f98b06eb8a8
008ef 458b09                         mov        r9d, dword ptr [r9]
008f2 41c1e90d                       shr        r9d, 0xd
008f6 49c1e10a                       shl        r9, 0xa
008fa 41ba00000080                   mov        r10d, 0x80000000
00900 4d03ca                         add        r9, r10
00903 41ba24000000                   mov        r10d, 0x24
00909 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
0090d 7436                           je         0x7f98b83bfb45
0090f 4983c202                       add        r10, 2
00913 4983fa28                       cmp        r10, 0x28
00917 75f0                           jne        0x7f98b83bfb09
00919 41ba24000000                   mov        r10d, 0x24
0091f 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
00924 7412                           je         0x7f98b83bfb38
00926 4983c202                       add        r10, 2
0092a 4983fa28                       cmp        r10, 0x28
0092e 75ef                           jne        0x7f98b83bfb1f
00930 41ba23000000                   mov        r10d, 0x23
00936 eb11                           jmp        0x7f98b83bfb49
00938 50                             push       rax
00939 4833c0                         xor        rax, rax
0093c f04f0fb10cd6                   lock cmpxchg qword ptr [r14 + r10*8], r9
00942 58                             pop        rax
00943 ebbe                           jmp        0x7f98b83bfb03
00945 4983c201                       add        r10, 1
00949 4b8304d601                     add        qword ptr [r14 + r10*8], 1
0094e 48ba989c6eb0987f0000           movabs     rdx, 0x7f98b06e9c98
00958 448b4a70                       mov        r9d, dword ptr [rdx + 0x70]
0095c 4183c102                       add        r9d, 2
00960 44894a70                       mov        dword ptr [rdx + 0x70], r9d
00964 4181e1feff1f00                 and        r9d, 0x1ffffe
0096b 4585c9                         test       r9d, r9d
0096e 0f84ff390000                   je         0x7f98b83c3573
00974 48ba989c6eb0987f0000           movabs     rdx, 0x7f98b06e9c98
0097e 488382a800000001               add        qword ptr [rdx + 0xa8], 1
00986 48bac09d6eb0987f0000           movabs     rdx, 0x7f98b06e9dc0
00990 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00993 83c102                         add        ecx, 2
00996 894a70                         mov        dword ptr [rdx + 0x70], ecx
00999 81e1feff1f00                   and        ecx, 0x1ffffe
0099f 85c9                           test       ecx, ecx
009a1 0f84ed390000                   je         0x7f98b83c3594
009a7 48bac09d6eb0987f0000           movabs     rdx, 0x7f98b06e9dc0
009b1 ff82b8000000                   inc        dword ptr [rdx + 0xb8]
009b7 8b942494010000                 mov        edx, dword ptr [rsp + 0x194]
009be 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
009c5 4489ac2490010000               mov        dword ptr [rsp + 0x190], r13d
009cd 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
009d5 488b9c2468010000               mov        rbx, qword ptr [rsp + 0x168]
009dd 48b9b81273e200000000           movabs     rcx, 0xe27312b8
009e7 4c8bc9                         mov        r9, rcx
009ea 48b8a8b86eb0987f0000           movabs     rax, 0x7f98b06eb8a8
009f4 49b90050168000000000           movabs     r9, 0x80165000
009fe 41ba2a000000                   mov        r10d, 0x2a
00a04 4e3b0cd0                       cmp        r9, qword ptr [rax + r10*8]
00a08 743c                           je         0x7f98b83bfc46
00a0a 4983c202                       add        r10, 2
00a0e 4983fa2e                       cmp        r10, 0x2e
00a12 75f0                           jne        0x7f98b83bfc04
00a14 41ba2a000000                   mov        r10d, 0x2a
00a1a 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
00a1f 7412                           je         0x7f98b83bfc33
00a21 4983c202                       add        r10, 2
00a25 4983fa2e                       cmp        r10, 0x2e
00a29 75ef                           jne        0x7f98b83bfc1a
00a2b 41ba29000000                   mov        r10d, 0x29
00a31 eb17                           jmp        0x7f98b83bfc4a
00a33 53                             push       rbx
00a34 488bd8                         mov        rbx, rax
00a37 4833c0                         xor        rax, rax
00a3a f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
00a40 488bc3                         mov        rax, rbx
00a43 5b                             pop        rbx
00a44 ebb8                           jmp        0x7f98b83bfbfe
00a46 4983c201                       add        r10, 1
00a4a 4a8304d001                     add        qword ptr [rax + r10*8], 1
00a4f 49b970ba6eb0987f0000           movabs     r9, 0x7f98b06eba70
00a59 418b4170                       mov        eax, dword ptr [r9 + 0x70]
00a5d 83c002                         add        eax, 2
00a60 41894170                       mov        dword ptr [r9 + 0x70], eax
00a64 25feff1f00                     and        eax, 0x1ffffe
00a69 85c0                           test       eax, eax
00a6b 0f8444390000                   je         0x7f98b83c35b5
00a71 4c8bc9                         mov        r9, rcx
00a74 48b870ba6eb0987f0000           movabs     rax, 0x7f98b06eba70
00a7e 488380a800000001               add        qword ptr [rax + 0xa8], 1
00a86 49b950bb6eb0987f0000           movabs     r9, 0x7f98b06ebb50
00a90 418b4170                       mov        eax, dword ptr [r9 + 0x70]
00a94 83c002                         add        eax, 2
00a97 41894170                       mov        dword ptr [r9 + 0x70], eax
00a9b 25feff1f00                     and        eax, 0x1ffffe
00aa0 85c0                           test       eax, eax
00aa2 0f842e390000                   je         0x7f98b83c35d6
00aa8 49b950bb6eb0987f0000           movabs     r9, 0x7f98b06ebb50
00ab2 48b90050168000000000           movabs     rcx, 0x80165000
00abc 41ba16000000                   mov        r10d, 0x16
00ac2 4b3b0cd1                       cmp        rcx, qword ptr [r9 + r10*8]
00ac6 7436                           je         0x7f98b83bfcfe
00ac8 4983c202                       add        r10, 2
00acc 4983fa1a                       cmp        r10, 0x1a
00ad0 75f0                           jne        0x7f98b83bfcc2
00ad2 41ba16000000                   mov        r10d, 0x16
00ad8 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
00add 7412                           je         0x7f98b83bfcf1
00adf 4983c202                       add        r10, 2
00ae3 4983fa1a                       cmp        r10, 0x1a
00ae7 75ef                           jne        0x7f98b83bfcd8
00ae9 41ba15000000                   mov        r10d, 0x15
00aef eb11                           jmp        0x7f98b83bfd02
00af1 50                             push       rax
00af2 4833c0                         xor        rax, rax
00af5 f04b0fb10cd1                   lock cmpxchg qword ptr [r9 + r10*8], rcx
00afb 58                             pop        rax
00afc ebbe                           jmp        0x7f98b83bfcbc
00afe 4983c201                       add        r10, 1
00b02 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00b07 48b940a66eb0987f0000           movabs     rcx, 0x7f98b06ea640
00b11 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00b15 4183c102                       add        r9d, 2
00b19 44894970                       mov        dword ptr [rcx + 0x70], r9d
00b1d 4181e1feff1f00                 and        r9d, 0x1ffffe
00b24 4585c9                         test       r9d, r9d
00b27 0f84ca380000                   je         0x7f98b83c35f7
00b2d 48b9c09272e200000000           movabs     rcx, 0xe27292c0
00b37 4c8bc9                         mov        r9, rcx
00b3a 48b850bb6eb0987f0000           movabs     rax, 0x7f98b06ebb50
00b44 458b09                         mov        r9d, dword ptr [r9]
00b47 41c1e90d                       shr        r9d, 0xd
00b4b 49c1e10a                       shl        r9, 0xa
00b4f 41ba00000080                   mov        r10d, 0x80000000
00b55 4d03ca                         add        r9, r10
00b58 41ba1c000000                   mov        r10d, 0x1c
00b5e 4e3b0cd0                       cmp        r9, qword ptr [rax + r10*8]
00b62 743c                           je         0x7f98b83bfda0
00b64 4983c202                       add        r10, 2
00b68 4983fa20                       cmp        r10, 0x20
00b6c 75f0                           jne        0x7f98b83bfd5e
00b6e 41ba1c000000                   mov        r10d, 0x1c
00b74 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
00b79 7412                           je         0x7f98b83bfd8d
00b7b 4983c202                       add        r10, 2
00b7f 4983fa20                       cmp        r10, 0x20
00b83 75ef                           jne        0x7f98b83bfd74
00b85 41ba1b000000                   mov        r10d, 0x1b
00b8b eb17                           jmp        0x7f98b83bfda4
00b8d 53                             push       rbx
00b8e 488bd8                         mov        rbx, rax
00b91 4833c0                         xor        rax, rax
00b94 f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
00b9a 488bc3                         mov        rax, rbx
00b9d 5b                             pop        rbx
00b9e ebb8                           jmp        0x7f98b83bfd58
00ba0 4983c201                       add        r10, 1
00ba4 4a8304d001                     add        qword ptr [rax + r10*8], 1
00ba9 49b950bb6eb0987f0000           movabs     r9, 0x7f98b06ebb50
00bb3 8b09                           mov        ecx, dword ptr [rcx]
00bb5 c1e90d                         shr        ecx, 0xd
00bb8 48c1e10a                       shl        rcx, 0xa
00bbc 41ba00000080                   mov        r10d, 0x80000000
00bc2 4903ca                         add        rcx, r10
00bc5 41ba22000000                   mov        r10d, 0x22
00bcb 4b3b0cd1                       cmp        rcx, qword ptr [r9 + r10*8]
00bcf 7436                           je         0x7f98b83bfe07
00bd1 4983c202                       add        r10, 2
00bd5 4983fa26                       cmp        r10, 0x26
00bd9 75f0                           jne        0x7f98b83bfdcb
00bdb 41ba22000000                   mov        r10d, 0x22
00be1 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
00be6 7412                           je         0x7f98b83bfdfa
00be8 4983c202                       add        r10, 2
00bec 4983fa26                       cmp        r10, 0x26
00bf0 75ef                           jne        0x7f98b83bfde1
00bf2 41ba21000000                   mov        r10d, 0x21
00bf8 eb11                           jmp        0x7f98b83bfe0b
00bfa 50                             push       rax
00bfb 4833c0                         xor        rax, rax
00bfe f04b0fb10cd1                   lock cmpxchg qword ptr [r9 + r10*8], rcx
00c04 58                             pop        rax
00c05 ebbe                           jmp        0x7f98b83bfdc5
00c07 4983c201                       add        r10, 1
00c0b 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00c10 48b950bb6eb0987f0000           movabs     rcx, 0x7f98b06ebb50
00c1a 4883813801000001               add        qword ptr [rcx + 0x138], 1
00c22 48b900a76eb0987f0000           movabs     rcx, 0x7f98b06ea700
00c2c 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00c30 4183c102                       add        r9d, 2
00c34 44894970                       mov        dword ptr [rcx + 0x70], r9d
00c38 4181e1feff1f00                 and        r9d, 0x1ffffe
00c3f 4585c9                         test       r9d, r9d
00c42 0f84d0370000                   je         0x7f98b83c3618
00c48 48b950bb6eb0987f0000           movabs     rcx, 0x7f98b06ebb50
00c52 4883814801000001               add        qword ptr [rcx + 0x148], 1
00c5a 4863c2                         movsxd     rax, edx
00c5d ba08000000                     mov        edx, 8
00c62 4c8bc8                         mov        r9, rax
00c65 4c03ca                         add        r9, rdx
00c68 48ba508a6eb0987f0000           movabs     rdx, 0x7f98b06e8a50
00c72 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00c75 83c102                         add        ecx, 2
00c78 894a70                         mov        dword ptr [rdx + 0x70], ecx
00c7b 81e1feff1f00                   and        ecx, 0x1ffffe
00c81 85c9                           test       ecx, ecx
00c83 0f84b0370000                   je         0x7f98b83c3639
00c89 48ba508a6eb0987f0000           movabs     rdx, 0x7f98b06e8a50
00c93 488382d800000001               add        qword ptr [rdx + 0xd8], 1
00c9b 48bac88b6eb0987f0000           movabs     rdx, 0x7f98b06e8bc8
00ca5 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
00ca8 83c102                         add        ecx, 2
00cab 894a70                         mov        dword ptr [rdx + 0x70], ecx
00cae 81e1feff1f00                   and        ecx, 0x1ffffe
00cb4 85c9                           test       ecx, ecx
00cb6 0f849e370000                   je         0x7f98b83c365a
00cbc 48ba50bb6eb0987f0000           movabs     rdx, 0x7f98b06ebb50
00cc6 488d9258010000                 lea        rdx, [rdx + 0x158]
00ccd 48b9886b73e200000000           movabs     rcx, 0xe2736b88
00cd7 48b900a8168000000000           movabs     rcx, 0x8016a800
00ce1 4c8bd1                         mov        r10, rcx
00ce4 48330a                         xor        rcx, qword ptr [rdx]
00ce7 48f7c1fcffffff                 test       rcx, -4
00cee 7426                           je         0x7f98b83bff16
00cf0 f6c102                         test       cl, 2
00cf3 7521                           jne        0x7f98b83bff16
00cf5 48f702feffffff                 test       qword ptr [rdx], -2
00cfc 7415                           je         0x7f98b83bff13
00cfe 498bca                         mov        rcx, r10
00d01 48330a                         xor        rcx, qword ptr [rdx]
00d04 48f7c1fcffffff                 test       rcx, -4
00d0b 7409                           je         0x7f98b83bff16
00d0d 48830a02                       or         qword ptr [rdx], 2
00d11 eb03                           jmp        0x7f98b83bff16
00d13 48890a                         mov        qword ptr [rdx], rcx
00d16 48ba50bb6eb0987f0000           movabs     rdx, 0x7f98b06ebb50
00d20 4883826801000001               add        qword ptr [rdx + 0x168], 1
00d28 48be089372e200000000           movabs     rsi, 0xe2729308
00d32 ba02000000                     mov        edx, 2
00d37 b910000000                     mov        ecx, 0x10
00d3c 4c8bc3                         mov        r8, rbx
00d3f bf00000000                     mov        edi, 0
00d44 48891c24                       mov        qword ptr [rsp], rbx
00d48 4889442408                     mov        qword ptr [rsp + 8], rax
00d4d 49bac09272e200000000           movabs     r10, 0xe27292c0
00d57 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00d5c 49ba886b73e200000000           movabs     r10, 0xe2736b88
00d66 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d6b 0f1f4000                       nop        dword ptr [rax]
00d6f e8ecb85307                     call       0x7f98bf8fb860
00d74 0f1f84006c0e0002               nop        dword ptr [rax + rax + 0x2000e6c]
00d7c 4885c0                         test       rax, rax
00d7f 48bb50bb6eb0987f0000           movabs     rbx, 0x7f98b06ebb50
00d89 750c                           jne        0x7f98b83bff97
00d8b 808b7101000001                 or         byte ptr [rbx + 0x171], 1
00d92 e988000000                     jmp        0x7f98b83c001f
00d97 8b38                           mov        edi, dword ptr [rax]
00d99 c1ef0d                         shr        edi, 0xd
00d9c 48c1e70a                       shl        rdi, 0xa
00da0 41ba00000080                   mov        r10d, 0x80000000
00da6 4903fa                         add        rdi, r10
00da9 41ba30000000                   mov        r10d, 0x30
00daf 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
00db3 7436                           je         0x7f98b83bffeb
00db5 4983c202                       add        r10, 2
00db9 4983fa34                       cmp        r10, 0x34
00dbd 75f0                           jne        0x7f98b83bffaf
00dbf 41ba30000000                   mov        r10d, 0x30
00dc5 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00dca 7412                           je         0x7f98b83bffde
00dcc 4983c202                       add        r10, 2
00dd0 4983fa34                       cmp        r10, 0x34
00dd4 75ef                           jne        0x7f98b83bffc5
00dd6 41ba2f000000                   mov        r10d, 0x2f
00ddc eb11                           jmp        0x7f98b83bffef
00dde 50                             push       rax
00ddf 4833c0                         xor        rax, rax
00de2 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
00de8 58                             pop        rax
00de9 ebbe                           jmp        0x7f98b83bffa9
00deb 4983c201                       add        r10, 1
00def 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00df4 48bf00b0148000000000           movabs     rdi, 0x8014b000
00dfe 8b18                           mov        ebx, dword ptr [rax]
00e00 c1eb0d                         shr        ebx, 0xd
00e03 48c1e30a                       shl        rbx, 0xa
00e07 41ba00000080                   mov        r10d, 0x80000000
00e0d 4903da                         add        rbx, r10
00e10 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
00e14 0f8561360000                   jne        0x7f98b83c367b
00e1a e900000000                     jmp        0x7f98b83c001f
00e1f 488bf8                         mov        rdi, rax
00e22 4889bc24b0010000               mov        qword ptr [rsp + 0x1b0], rdi
00e2a 483b07                         cmp        rax, qword ptr [rdi]
00e2d 488bf7                         mov        rsi, rdi
00e30 48bbd8ab70b0987f0000           movabs     rbx, 0x7f98b070abd8
00e3a 8b36                           mov        esi, dword ptr [rsi]
00e3c c1ee0d                         shr        esi, 0xd
00e3f 48c1e60a                       shl        rsi, 0xa
00e43 41ba00000080                   mov        r10d, 0x80000000
00e49 4903f2                         add        rsi, r10
00e4c 41ba94000000                   mov        r10d, 0x94
00e52 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00e56 743c                           je         0x7f98b83c0094
00e58 4983c202                       add        r10, 2
00e5c 4981fa98000000                 cmp        r10, 0x98
00e63 75ed                           jne        0x7f98b83c0052
00e65 41ba94000000                   mov        r10d, 0x94
00e6b 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00e70 7415                           je         0x7f98b83c0087
00e72 4983c202                       add        r10, 2
00e76 4981fa98000000                 cmp        r10, 0x98
00e7d 75ec                           jne        0x7f98b83c006b
00e7f 41ba93000000                   mov        r10d, 0x93
00e85 eb11                           jmp        0x7f98b83c0098
00e87 50                             push       rax
00e88 4833c0                         xor        rax, rax
00e8b f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00e91 58                             pop        rax
00e92 ebb8                           jmp        0x7f98b83c004c
00e94 4983c201                       add        r10, 1
00e98 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00e9d 48be18bf6eb0987f0000           movabs     rsi, 0x7f98b06ebf18
00ea7 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
00eaa 83c302                         add        ebx, 2
00ead 895e70                         mov        dword ptr [rsi + 0x70], ebx
00eb0 81e3feff1f00                   and        ebx, 0x1ffffe
00eb6 85db                           test       ebx, ebx
00eb8 0f84cb350000                   je         0x7f98b83c3689
00ebe 488bf7                         mov        rsi, rdi
00ec1 48bb18bf6eb0987f0000           movabs     rbx, 0x7f98b06ebf18
00ecb 8b36                           mov        esi, dword ptr [rsi]
00ecd c1ee0d                         shr        esi, 0xd
00ed0 48c1e60a                       shl        rsi, 0xa
00ed4 41ba00000080                   mov        r10d, 0x80000000
00eda 4903f2                         add        rsi, r10
00edd 41ba16000000                   mov        r10d, 0x16
00ee3 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00ee7 7436                           je         0x7f98b83c011f
00ee9 4983c202                       add        r10, 2
00eed 4983fa1a                       cmp        r10, 0x1a
00ef1 75f0                           jne        0x7f98b83c00e3
00ef3 41ba16000000                   mov        r10d, 0x16
00ef9 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00efe 7412                           je         0x7f98b83c0112
00f00 4983c202                       add        r10, 2
00f04 4983fa1a                       cmp        r10, 0x1a
00f08 75ef                           jne        0x7f98b83c00f9
00f0a 41ba15000000                   mov        r10d, 0x15
00f10 eb11                           jmp        0x7f98b83c0123
00f12 50                             push       rax
00f13 4833c0                         xor        rax, rax
00f16 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00f1c 58                             pop        rax
00f1d ebbe                           jmp        0x7f98b83c00dd
00f1f 4983c201                       add        r10, 1
00f23 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00f28 488bf7                         mov        rsi, rdi
00f2b 6690                           nop        
00f2d 48b870c91e8c987f0000           movabs     rax, 0x7f988c1ec970
00f37 e824b25307                     call       0x7f98bf8fb360
00f3c 0f1f840034100003               nop        dword ptr [rax + rax + 0x3001034]
00f44 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
00f4c 8b7704                         mov        esi, dword ptr [rdi + 4]
00f4f 48bb18bf6eb0987f0000           movabs     rbx, 0x7f98b06ebf18
00f59 488383d800000001               add        qword ptr [rbx + 0xd8], 1
00f61 48bbc8a46eb0987f0000           movabs     rbx, 0x7f98b06ea4c8
00f6b 8b5370                         mov        edx, dword ptr [rbx + 0x70]
00f6e 83c202                         add        edx, 2
00f71 895370                         mov        dword ptr [rbx + 0x70], edx
00f74 81e2feff1f00                   and        edx, 0x1ffffe
00f7a 85d2                           test       edx, edx
00f7c 0f842d350000                   je         0x7f98b83c36af
00f82 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
00f8a 48bbc8a46eb0987f0000           movabs     rbx, 0x7f98b06ea4c8
00f94 4883830801000001               add        qword ptr [rbx + 0x108], 1
00f9c ffc8                           dec        eax
00f9e 2bf0                           sub        esi, eax
00fa0 48bb989b6eb0987f0000           movabs     rbx, 0x7f98b06e9b98
00faa 8b4370                         mov        eax, dword ptr [rbx + 0x70]
00fad 83c002                         add        eax, 2
00fb0 894370                         mov        dword ptr [rbx + 0x70], eax
00fb3 25feff1f00                     and        eax, 0x1ffffe
00fb8 85c0                           test       eax, eax
00fba 0f8410350000                   je         0x7f98b83c36d0
00fc0 48bb989b6eb0987f0000           movabs     rbx, 0x7f98b06e9b98
00fca 488383a800000001               add        qword ptr [rbx + 0xa8], 1
00fd2 48bb0000000000000000           movabs     rbx, 0
00fdc bb00000000                     mov        ebx, 0
00fe1 443bdb                         cmp        r11d, ebx
00fe4 0f8c07350000                   jl         0x7f98b83c36f1
00fea 443bde                         cmp        r11d, esi
00fed 0f8d0b350000                   jge        0x7f98b83c36fe
00ff3 498bdb                         mov        rbx, r11
00ff6 899c24ac010000                 mov        dword ptr [rsp + 0x1ac], ebx
00ffd 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
01005 488bbc24b0010000               mov        rdi, qword ptr [rsp + 0x1b0]
0100d 488bf7                         mov        rsi, rdi
01010 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
0101a 8b36                           mov        esi, dword ptr [rsi]
0101c c1ee0d                         shr        esi, 0xd
0101f 48c1e60a                       shl        rsi, 0xa
01023 41ba00000080                   mov        r10d, 0x80000000
01029 4903f2                         add        rsi, r10
0102c 41ba1e000000                   mov        r10d, 0x1e
01032 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01036 7436                           je         0x7f98b83c026e
01038 4983c202                       add        r10, 2
0103c 4983fa22                       cmp        r10, 0x22
01040 75f0                           jne        0x7f98b83c0232
01042 41ba1e000000                   mov        r10d, 0x1e
01048 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
0104d 7412                           je         0x7f98b83c0261
0104f 4983c202                       add        r10, 2
01053 4983fa22                       cmp        r10, 0x22
01057 75ef                           jne        0x7f98b83c0248
01059 41ba1d000000                   mov        r10d, 0x1d
0105f eb11                           jmp        0x7f98b83c0272
01061 50                             push       rax
01062 4833c0                         xor        rax, rax
01065 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
0106b 58                             pop        rax
0106c ebbe                           jmp        0x7f98b83c022c
0106e 4983c201                       add        r10, 1
01072 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01077 488bf7                         mov        rsi, rdi
0107a 666690                         nop        
0107d 48b898c91e8c987f0000           movabs     rax, 0x7f988c1ec998
01087 e8d4b05307                     call       0x7f98bf8fb360
0108c 0f1f840084110004               nop        dword ptr [rax + rax + 0x4001184]
01094 483b00                         cmp        rax, qword ptr [rax]
01097 488bf0                         mov        rsi, rax
0109a 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
010a4 8b36                           mov        esi, dword ptr [rsi]
010a6 c1ee0d                         shr        esi, 0xd
010a9 48c1e60a                       shl        rsi, 0xa
010ad 41ba00000080                   mov        r10d, 0x80000000
010b3 4903f2                         add        rsi, r10
010b6 41ba24000000                   mov        r10d, 0x24
010bc 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
010c0 7436                           je         0x7f98b83c02f8
010c2 4983c202                       add        r10, 2
010c6 4983fa28                       cmp        r10, 0x28
010ca 75f0                           jne        0x7f98b83c02bc
010cc 41ba24000000                   mov        r10d, 0x24
010d2 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
010d7 7412                           je         0x7f98b83c02eb
010d9 4983c202                       add        r10, 2
010dd 4983fa28                       cmp        r10, 0x28
010e1 75ef                           jne        0x7f98b83c02d2
010e3 41ba23000000                   mov        r10d, 0x23
010e9 eb11                           jmp        0x7f98b83c02fc
010eb 50                             push       rax
010ec 4833c0                         xor        rax, rax
010ef f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
010f5 58                             pop        rax
010f6 ebbe                           jmp        0x7f98b83c02b6
010f8 4983c201                       add        r10, 1
010fc 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01101 8b7024                         mov        esi, dword ptr [rax + 0x24]
01104 488bd0                         mov        rdx, rax
01107 48b918bf6eb0987f0000           movabs     rcx, 0x7f98b06ebf18
01111 8b12                           mov        edx, dword ptr [rdx]
01113 c1ea0d                         shr        edx, 0xd
01116 48c1e20a                       shl        rdx, 0xa
0111a 41ba00000080                   mov        r10d, 0x80000000
01120 4903d2                         add        rdx, r10
01123 41ba2a000000                   mov        r10d, 0x2a
01129 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0112d 7436                           je         0x7f98b83c0365
0112f 4983c202                       add        r10, 2
01133 4983fa2e                       cmp        r10, 0x2e
01137 75f0                           jne        0x7f98b83c0329
01139 41ba2a000000                   mov        r10d, 0x2a
0113f 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01144 7412                           je         0x7f98b83c0358
01146 4983c202                       add        r10, 2
0114a 4983fa2e                       cmp        r10, 0x2e
0114e 75ef                           jne        0x7f98b83c033f
01150 41ba29000000                   mov        r10d, 0x29
01156 eb11                           jmp        0x7f98b83c0369
01158 50                             push       rax
01159 4833c0                         xor        rax, rax
0115c f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
01162 58                             pop        rax
01163 ebbe                           jmp        0x7f98b83c0323
01165 4983c201                       add        r10, 1
01169 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0116e 8b4804                         mov        ecx, dword ptr [rax + 4]
01171 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
0117b 4883827801000001               add        qword ptr [rdx + 0x178], 1
01183 48ba00a76eb0987f0000           movabs     rdx, 0x7f98b06ea700
0118d 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01191 4183c002                       add        r8d, 2
01195 44894270                       mov        dword ptr [rdx + 0x70], r8d
01199 4181e0feff1f00                 and        r8d, 0x1ffffe
011a0 4585c0                         test       r8d, r8d
011a3 0f8467330000                   je         0x7f98b83c3710
011a9 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
011b3 4883828801000001               add        qword ptr [rdx + 0x188], 1
011bb 8b9c24ac010000                 mov        ebx, dword ptr [rsp + 0x1ac]
011c2 4863db                         movsxd     rbx, ebx
011c5 ba08000000                     mov        edx, 8
011ca 4c8bcb                         mov        r9, rbx
011cd 4c03ca                         add        r9, rdx
011d0 48ba508a6eb0987f0000           movabs     rdx, 0x7f98b06e8a50
011da 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
011de 4183c002                       add        r8d, 2
011e2 44894270                       mov        dword ptr [rdx + 0x70], r8d
011e6 4181e0feff1f00                 and        r8d, 0x1ffffe
011ed 4585c0                         test       r8d, r8d
011f0 0f843b330000                   je         0x7f98b83c3731
011f6 48ba508a6eb0987f0000           movabs     rdx, 0x7f98b06e8a50
01200 488382d800000001               add        qword ptr [rdx + 0xd8], 1
01208 48bac88b6eb0987f0000           movabs     rdx, 0x7f98b06e8bc8
01212 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01216 4183c002                       add        r8d, 2
0121a 44894270                       mov        dword ptr [rdx + 0x70], r8d
0121e 4181e0feff1f00                 and        r8d, 0x1ffffe
01225 4585c0                         test       r8d, r8d
01228 0f8424330000                   je         0x7f98b83c3752
0122e 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
01238 488d9298010000                 lea        rdx, [rdx + 0x198]
0123f 49b8700974e200000000           movabs     r8, 0xe2740970
01249 49b800b8168000000000           movabs     r8, 0x8016b800
01253 4d8bd0                         mov        r10, r8
01256 4c3302                         xor        r8, qword ptr [rdx]
01259 49f7c0fcffffff                 test       r8, -4
01260 7427                           je         0x7f98b83c0489
01262 41f6c002                       test       r8b, 2
01266 7521                           jne        0x7f98b83c0489
01268 48f702feffffff                 test       qword ptr [rdx], -2
0126f 7415                           je         0x7f98b83c0486
01271 4d8bc2                         mov        r8, r10
01274 4c3302                         xor        r8, qword ptr [rdx]
01277 49f7c0fcffffff                 test       r8, -4
0127e 7409                           je         0x7f98b83c0489
01280 48830a02                       or         qword ptr [rdx], 2
01284 eb03                           jmp        0x7f98b83c0489
01286 4c8902                         mov        qword ptr [rdx], r8
01289 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
01293 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
0129b ba02000000                     mov        edx, 2
012a0 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
012a8 bf00000000                     mov        edi, 0
012ad 488b8424b0010000               mov        rax, qword ptr [rsp + 0x1b0]
012b5 48890424                       mov        qword ptr [rsp], rax
012b9 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
012c1 4889442408                     mov        qword ptr [rsp + 8], rax
012c6 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
012cb 49ba700974e200000000           movabs     r10, 0xe2740970
012d5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
012da 0f1f440000                     nop        dword ptr [rax + rax]
012df e87cb35307                     call       0x7f98bf8fb860
012e4 0f1f8400dc130005               nop        dword ptr [rax + rax + 0x50013dc]
012ec 48bed8ab70b0987f0000           movabs     rsi, 0x7f98b070abd8
012f6 ff86c8040000                   inc        dword ptr [rsi + 0x4c8]
012fc e9150d0000                     jmp        0x7f98b83c1216
01301 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
01308 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
01310 83ff30                         cmp        edi, 0x30
01313 48bed8ab70b0987f0000           movabs     rsi, 0x7f98b070abd8
0131d bae0040000                     mov        edx, 0x4e0
01322 7f05                           jg         0x7f98b83c0529
01324 baf0040000                     mov        edx, 0x4f0
01329 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0132d 488d4901                       lea        rcx, [rcx + 1]
01331 48890c16                       mov        qword ptr [rsi + rdx], rcx
01335 0f8f360c0000                   jg         0x7f98b83c1171
0133b 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
01342 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
0134a 660f1f440000                   nop        word ptr [rax + rax]
01350 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
01358 8b842464010000                 mov        eax, dword ptr [rsp + 0x164]
0135f 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
01367 48b9d8ab70b0987f0000           movabs     rcx, 0x7f98b070abd8
01371 4883810005000001               add        qword ptr [rcx + 0x500], 1
01379 48b9a8b86eb0987f0000           movabs     rcx, 0x7f98b06eb8a8
01383 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
01387 4183c002                       add        r8d, 2
0138b 44894170                       mov        dword ptr [rcx + 0x70], r8d
0138f 4181e0feff1f00                 and        r8d, 0x1ffffe
01396 4585c0                         test       r8d, r8d
01399 0f84d4310000                   je         0x7f98b83c3773
0139f 48b9c09272e200000000           movabs     rcx, 0xe27292c0
013a9 49b8a8b86eb0987f0000           movabs     r8, 0x7f98b06eb8a8
013b3 8b09                           mov        ecx, dword ptr [rcx]
013b5 c1e90d                         shr        ecx, 0xd
013b8 48c1e10a                       shl        rcx, 0xa
013bc 41ba00000080                   mov        r10d, 0x80000000
013c2 4903ca                         add        rcx, r10
013c5 41ba16000000                   mov        r10d, 0x16
013cb 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
013cf 7436                           je         0x7f98b83c0607
013d1 4983c202                       add        r10, 2
013d5 4983fa1a                       cmp        r10, 0x1a
013d9 75f0                           jne        0x7f98b83c05cb
013db 41ba16000000                   mov        r10d, 0x16
013e1 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
013e6 7412                           je         0x7f98b83c05fa
013e8 4983c202                       add        r10, 2
013ec 4983fa1a                       cmp        r10, 0x1a
013f0 75ef                           jne        0x7f98b83c05e1
013f2 41ba15000000                   mov        r10d, 0x15
013f8 eb11                           jmp        0x7f98b83c060b
013fa 50                             push       rax
013fb 4833c0                         xor        rax, rax
013fe f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
01404 58                             pop        rax
01405 ebbe                           jmp        0x7f98b83c05c5
01407 4983c201                       add        r10, 1
0140b 4b8304d001                     add        qword ptr [r8 + r10*8], 1
01410 48b9a8b86eb0987f0000           movabs     rcx, 0x7f98b06eb8a8
0141a 488381d800000001               add        qword ptr [rcx + 0xd8], 1
01422 48b9c8a46eb0987f0000           movabs     rcx, 0x7f98b06ea4c8
0142c 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
01430 4183c002                       add        r8d, 2
01434 44894170                       mov        dword ptr [rcx + 0x70], r8d
01438 4181e0feff1f00                 and        r8d, 0x1ffffe
0143f 4585c0                         test       r8d, r8d
01442 0f844c310000                   je         0x7f98b83c3794
01448 48b9c8a46eb0987f0000           movabs     rcx, 0x7f98b06ea4c8
01452 4883810801000001               add        qword ptr [rcx + 0x108], 1
0145a 488bc8                         mov        rcx, rax
0145d 83e90f                         sub        ecx, 0xf
01460 49b8989b6eb0987f0000           movabs     r8, 0x7f98b06e9b98
0146a 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
0146e 4183c102                       add        r9d, 2
01472 45894870                       mov        dword ptr [r8 + 0x70], r9d
01476 4181e1feff1f00                 and        r9d, 0x1ffffe
0147d 4585c9                         test       r9d, r9d
01480 0f842f310000                   je         0x7f98b83c37b5
01486 49b8989b6eb0987f0000           movabs     r8, 0x7f98b06e9b98
01490 498380a800000001               add        qword ptr [r8 + 0xa8], 1
01498 49b80000000000000000           movabs     r8, 0
014a2 41b800000000                   mov        r8d, 0
014a8 413bf0                         cmp        esi, r8d
014ab 0f8c25310000                   jl         0x7f98b83c37d6
014b1 3bf1                           cmp        esi, ecx
014b3 0f8d2a310000                   jge        0x7f98b83c37e3
014b9 488bce                         mov        rcx, rsi
014bc 898c24b8010000                 mov        dword ptr [rsp + 0x1b8], ecx
014c3 49b8c09272e200000000           movabs     r8, 0xe27292c0
014cd 4d8bc8                         mov        r9, r8
014d0 49bea8b86eb0987f0000           movabs     r14, 0x7f98b06eb8a8
014da 458b09                         mov        r9d, dword ptr [r9]
014dd 41c1e90d                       shr        r9d, 0xd
014e1 49c1e10a                       shl        r9, 0xa
014e5 41ba00000080                   mov        r10d, 0x80000000
014eb 4d03ca                         add        r9, r10
014ee 41ba24000000                   mov        r10d, 0x24
014f4 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
014f8 7436                           je         0x7f98b83c0730
014fa 4983c202                       add        r10, 2
014fe 4983fa28                       cmp        r10, 0x28
01502 75f0                           jne        0x7f98b83c06f4
01504 41ba24000000                   mov        r10d, 0x24
0150a 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
0150f 7412                           je         0x7f98b83c0723
01511 4983c202                       add        r10, 2
01515 4983fa28                       cmp        r10, 0x28
01519 75ef                           jne        0x7f98b83c070a
0151b 41ba23000000                   mov        r10d, 0x23
01521 eb11                           jmp        0x7f98b83c0734
01523 50                             push       rax
01524 4833c0                         xor        rax, rax
01527 f04f0fb10cd6                   lock cmpxchg qword ptr [r14 + r10*8], r9
0152d 58                             pop        rax
0152e ebbe                           jmp        0x7f98b83c06ee
01530 4983c201                       add        r10, 1
01534 4b8304d601                     add        qword ptr [r14 + r10*8], 1
01539 48b9989c6eb0987f0000           movabs     rcx, 0x7f98b06e9c98
01543 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
01547 4183c102                       add        r9d, 2
0154b 44894970                       mov        dword ptr [rcx + 0x70], r9d
0154f 4181e1feff1f00                 and        r9d, 0x1ffffe
01556 4585c9                         test       r9d, r9d
01559 0f8491300000                   je         0x7f98b83c37f0
0155f 48b9989c6eb0987f0000           movabs     rcx, 0x7f98b06e9c98
01569 488381a800000001               add        qword ptr [rcx + 0xa8], 1
01571 48b9c09d6eb0987f0000           movabs     rcx, 0x7f98b06e9dc0
0157b 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
0157f 4183c002                       add        r8d, 2
01583 44894170                       mov        dword ptr [rcx + 0x70], r8d
01587 4181e0feff1f00                 and        r8d, 0x1ffffe
0158e 4585c0                         test       r8d, r8d
01591 0f847a300000                   je         0x7f98b83c3811
01597 48b9c09d6eb0987f0000           movabs     rcx, 0x7f98b06e9dc0
015a1 ff81b8000000                   inc        dword ptr [rcx + 0xb8]
015a7 8b8c24b8010000                 mov        ecx, dword ptr [rsp + 0x1b8]
015ae 89b424c0010000                 mov        dword ptr [rsp + 0x1c0], esi
015b5 49b8b81273e200000000           movabs     r8, 0xe27312b8
015bf 4d8bc8                         mov        r9, r8
015c2 49bea8b86eb0987f0000           movabs     r14, 0x7f98b06eb8a8
015cc 49b90050168000000000           movabs     r9, 0x80165000
015d6 41ba2a000000                   mov        r10d, 0x2a
015dc 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
015e0 7436                           je         0x7f98b83c0818
015e2 4983c202                       add        r10, 2
015e6 4983fa2e                       cmp        r10, 0x2e
015ea 75f0                           jne        0x7f98b83c07dc
015ec 41ba2a000000                   mov        r10d, 0x2a
015f2 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
015f7 7412                           je         0x7f98b83c080b
015f9 4983c202                       add        r10, 2
015fd 4983fa2e                       cmp        r10, 0x2e
01601 75ef                           jne        0x7f98b83c07f2
01603 41ba29000000                   mov        r10d, 0x29
01609 eb11                           jmp        0x7f98b83c081c
0160b 50                             push       rax
0160c 4833c0                         xor        rax, rax
0160f f04f0fb10cd6                   lock cmpxchg qword ptr [r14 + r10*8], r9
01615 58                             pop        rax
01616 ebbe                           jmp        0x7f98b83c07d6
01618 4983c201                       add        r10, 1
0161c 4b8304d601                     add        qword ptr [r14 + r10*8], 1
01621 49b970ba6eb0987f0000           movabs     r9, 0x7f98b06eba70
0162b 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
0162f 83c302                         add        ebx, 2
01632 41895970                       mov        dword ptr [r9 + 0x70], ebx
01636 81e3feff1f00                   and        ebx, 0x1ffffe
0163c 85db                           test       ebx, ebx
0163e 0f84ee2f0000                   je         0x7f98b83c3832
01644 4d8bc8                         mov        r9, r8
01647 48bb70ba6eb0987f0000           movabs     rbx, 0x7f98b06eba70
01651 488383a800000001               add        qword ptr [rbx + 0xa8], 1
01659 49b950bb6eb0987f0000           movabs     r9, 0x7f98b06ebb50
01663 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
01667 83c302                         add        ebx, 2
0166a 41895970                       mov        dword ptr [r9 + 0x70], ebx
0166e 81e3feff1f00                   and        ebx, 0x1ffffe
01674 85db                           test       ebx, ebx
01676 0f84d72f0000                   je         0x7f98b83c3853
0167c 49b950bb6eb0987f0000           movabs     r9, 0x7f98b06ebb50
01686 49b80050168000000000           movabs     r8, 0x80165000
01690 41ba16000000                   mov        r10d, 0x16
01696 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
0169a 7436                           je         0x7f98b83c08d2
0169c 4983c202                       add        r10, 2
016a0 4983fa1a                       cmp        r10, 0x1a
016a4 75f0                           jne        0x7f98b83c0896
016a6 41ba16000000                   mov        r10d, 0x16
016ac 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
016b1 7412                           je         0x7f98b83c08c5
016b3 4983c202                       add        r10, 2
016b7 4983fa1a                       cmp        r10, 0x1a
016bb 75ef                           jne        0x7f98b83c08ac
016bd 41ba15000000                   mov        r10d, 0x15
016c3 eb11                           jmp        0x7f98b83c08d6
016c5 50                             push       rax
016c6 4833c0                         xor        rax, rax
016c9 f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
016cf 58                             pop        rax
016d0 ebbe                           jmp        0x7f98b83c0890
016d2 4983c201                       add        r10, 1
016d6 4b8304d101                     add        qword ptr [r9 + r10*8], 1
016db 49b840a66eb0987f0000           movabs     r8, 0x7f98b06ea640
016e5 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
016e9 4183c102                       add        r9d, 2
016ed 45894870                       mov        dword ptr [r8 + 0x70], r9d
016f1 4181e1feff1f00                 and        r9d, 0x1ffffe
016f8 4585c9                         test       r9d, r9d
016fb 0f84732f0000                   je         0x7f98b83c3874
01701 49b8c09272e200000000           movabs     r8, 0xe27292c0
0170b 4d8bc8                         mov        r9, r8
0170e 48bb50bb6eb0987f0000           movabs     rbx, 0x7f98b06ebb50
01718 458b09                         mov        r9d, dword ptr [r9]
0171b 41c1e90d                       shr        r9d, 0xd
0171f 49c1e10a                       shl        r9, 0xa
01723 41ba00000080                   mov        r10d, 0x80000000
01729 4d03ca                         add        r9, r10
0172c 41ba1c000000                   mov        r10d, 0x1c
01732 4e3b0cd3                       cmp        r9, qword ptr [rbx + r10*8]
01736 7436                           je         0x7f98b83c096e
01738 4983c202                       add        r10, 2
0173c 4983fa20                       cmp        r10, 0x20
01740 75f0                           jne        0x7f98b83c0932
01742 41ba1c000000                   mov        r10d, 0x1c
01748 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0174d 7412                           je         0x7f98b83c0961
0174f 4983c202                       add        r10, 2
01753 4983fa20                       cmp        r10, 0x20
01757 75ef                           jne        0x7f98b83c0948
01759 41ba1b000000                   mov        r10d, 0x1b
0175f eb11                           jmp        0x7f98b83c0972
01761 50                             push       rax
01762 4833c0                         xor        rax, rax
01765 f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
0176b 58                             pop        rax
0176c ebbe                           jmp        0x7f98b83c092c
0176e 4983c201                       add        r10, 1
01772 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01777 49b950bb6eb0987f0000           movabs     r9, 0x7f98b06ebb50
01781 458b00                         mov        r8d, dword ptr [r8]
01784 41c1e80d                       shr        r8d, 0xd
01788 49c1e00a                       shl        r8, 0xa
0178c 41ba00000080                   mov        r10d, 0x80000000
01792 4d03c2                         add        r8, r10
01795 41ba22000000                   mov        r10d, 0x22
0179b 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
0179f 7436                           je         0x7f98b83c09d7
017a1 4983c202                       add        r10, 2
017a5 4983fa26                       cmp        r10, 0x26
017a9 75f0                           jne        0x7f98b83c099b
017ab 41ba22000000                   mov        r10d, 0x22
017b1 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
017b6 7412                           je         0x7f98b83c09ca
017b8 4983c202                       add        r10, 2
017bc 4983fa26                       cmp        r10, 0x26
017c0 75ef                           jne        0x7f98b83c09b1
017c2 41ba21000000                   mov        r10d, 0x21
017c8 eb11                           jmp        0x7f98b83c09db
017ca 50                             push       rax
017cb 4833c0                         xor        rax, rax
017ce f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
017d4 58                             pop        rax
017d5 ebbe                           jmp        0x7f98b83c0995
017d7 4983c201                       add        r10, 1
017db 4b8304d101                     add        qword ptr [r9 + r10*8], 1
017e0 49b850bb6eb0987f0000           movabs     r8, 0x7f98b06ebb50
017ea 4983803801000001               add        qword ptr [r8 + 0x138], 1
017f2 49b800a76eb0987f0000           movabs     r8, 0x7f98b06ea700
017fc 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
01800 4183c102                       add        r9d, 2
01804 45894870                       mov        dword ptr [r8 + 0x70], r9d
01808 4181e1feff1f00                 and        r9d, 0x1ffffe
0180f 4585c9                         test       r9d, r9d
01812 0f847d2e0000                   je         0x7f98b83c3895
01818 49b850bb6eb0987f0000           movabs     r8, 0x7f98b06ebb50
01822 4983804801000001               add        qword ptr [r8 + 0x148], 1
0182a 4863d9                         movsxd     rbx, ecx
0182d b908000000                     mov        ecx, 8
01832 4c8bcb                         mov        r9, rbx
01835 4c03c9                         add        r9, rcx
01838 48b9508a6eb0987f0000           movabs     rcx, 0x7f98b06e8a50
01842 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
01846 4183c002                       add        r8d, 2
0184a 44894170                       mov        dword ptr [rcx + 0x70], r8d
0184e 4181e0feff1f00                 and        r8d, 0x1ffffe
01855 4585c0                         test       r8d, r8d
01858 0f84582e0000                   je         0x7f98b83c38b6
0185e 48b9508a6eb0987f0000           movabs     rcx, 0x7f98b06e8a50
01868 488381d800000001               add        qword ptr [rcx + 0xd8], 1
01870 48b9c88b6eb0987f0000           movabs     rcx, 0x7f98b06e8bc8
0187a 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
0187e 4183c002                       add        r8d, 2
01882 44894170                       mov        dword ptr [rcx + 0x70], r8d
01886 4181e0feff1f00                 and        r8d, 0x1ffffe
0188d 4585c0                         test       r8d, r8d
01890 0f84412e0000                   je         0x7f98b83c38d7
01896 48b950bb6eb0987f0000           movabs     rcx, 0x7f98b06ebb50
018a0 488d8958010000                 lea        rcx, [rcx + 0x158]
018a7 49b8886b73e200000000           movabs     r8, 0xe2736b88
018b1 49b800a8168000000000           movabs     r8, 0x8016a800
018bb 4d8bd0                         mov        r10, r8
018be 4c3301                         xor        r8, qword ptr [rcx]
018c1 49f7c0fcffffff                 test       r8, -4
018c8 7427                           je         0x7f98b83c0af1
018ca 41f6c002                       test       r8b, 2
018ce 7521                           jne        0x7f98b83c0af1
018d0 48f701feffffff                 test       qword ptr [rcx], -2
018d7 7415                           je         0x7f98b83c0aee
018d9 4d8bc2                         mov        r8, r10
018dc 4c3301                         xor        r8, qword ptr [rcx]
018df 49f7c0fcffffff                 test       r8, -4
018e6 7409                           je         0x7f98b83c0af1
018e8 48830902                       or         qword ptr [rcx], 2
018ec eb03                           jmp        0x7f98b83c0af1
018ee 4c8901                         mov        qword ptr [rcx], r8
018f1 48b950bb6eb0987f0000           movabs     rcx, 0x7f98b06ebb50
018fb 4883816801000001               add        qword ptr [rcx + 0x168], 1
01903 48be089372e200000000           movabs     rsi, 0xe2729308
0190d 4c8bc2                         mov        r8, rdx
01910 ba02000000                     mov        edx, 2
01915 b910000000                     mov        ecx, 0x10
0191a 498bc0                         mov        rax, r8
0191d 4c8bc0                         mov        r8, rax
01920 bf00000000                     mov        edi, 0
01925 48890424                       mov        qword ptr [rsp], rax
01929 48895c2408                     mov        qword ptr [rsp + 8], rbx
0192e 49bac09272e200000000           movabs     r10, 0xe27292c0
01938 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0193d 49ba886b73e200000000           movabs     r10, 0xe2736b88
01947 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0194c 666690                         nop        
0194f e80cad5307                     call       0x7f98bf8fb860
01954 0f1f84004c1a0006               nop        dword ptr [rax + rax + 0x6001a4c]
0195c 4885c0                         test       rax, rax
0195f 48bb50bb6eb0987f0000           movabs     rbx, 0x7f98b06ebb50
01969 750c                           jne        0x7f98b83c0b77
0196b 808b7101000001                 or         byte ptr [rbx + 0x171], 1
01972 e988000000                     jmp        0x7f98b83c0bff
01977 8b38                           mov        edi, dword ptr [rax]
01979 c1ef0d                         shr        edi, 0xd
0197c 48c1e70a                       shl        rdi, 0xa
01980 41ba00000080                   mov        r10d, 0x80000000
01986 4903fa                         add        rdi, r10
01989 41ba30000000                   mov        r10d, 0x30
0198f 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
01993 7436                           je         0x7f98b83c0bcb
01995 4983c202                       add        r10, 2
01999 4983fa34                       cmp        r10, 0x34
0199d 75f0                           jne        0x7f98b83c0b8f
0199f 41ba30000000                   mov        r10d, 0x30
019a5 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
019aa 7412                           je         0x7f98b83c0bbe
019ac 4983c202                       add        r10, 2
019b0 4983fa34                       cmp        r10, 0x34
019b4 75ef                           jne        0x7f98b83c0ba5
019b6 41ba2f000000                   mov        r10d, 0x2f
019bc eb11                           jmp        0x7f98b83c0bcf
019be 50                             push       rax
019bf 4833c0                         xor        rax, rax
019c2 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
019c8 58                             pop        rax
019c9 ebbe                           jmp        0x7f98b83c0b89
019cb 4983c201                       add        r10, 1
019cf 4a8304d301                     add        qword ptr [rbx + r10*8], 1
019d4 48bf00b0148000000000           movabs     rdi, 0x8014b000
019de 8b18                           mov        ebx, dword ptr [rax]
019e0 c1eb0d                         shr        ebx, 0xd
019e3 48c1e30a                       shl        rbx, 0xa
019e7 41ba00000080                   mov        r10d, 0x80000000
019ed 4903da                         add        rbx, r10
019f0 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
019f4 0f85fe2c0000                   jne        0x7f98b83c38f8
019fa e900000000                     jmp        0x7f98b83c0bff
019ff 488bf8                         mov        rdi, rax
01a02 4889bc24c8010000               mov        qword ptr [rsp + 0x1c8], rdi
01a0a 483b07                         cmp        rax, qword ptr [rdi]
01a0d 488bf7                         mov        rsi, rdi
01a10 48bbd8ab70b0987f0000           movabs     rbx, 0x7f98b070abd8
01a1a 8b36                           mov        esi, dword ptr [rsi]
01a1c c1ee0d                         shr        esi, 0xd
01a1f 48c1e60a                       shl        rsi, 0xa
01a23 41ba00000080                   mov        r10d, 0x80000000
01a29 4903f2                         add        rsi, r10
01a2c 41baa3000000                   mov        r10d, 0xa3
01a32 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
01a36 743c                           je         0x7f98b83c0c74
01a38 4983c202                       add        r10, 2
01a3c 4981faa7000000                 cmp        r10, 0xa7
01a43 75ed                           jne        0x7f98b83c0c32
01a45 41baa3000000                   mov        r10d, 0xa3
01a4b 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01a50 7415                           je         0x7f98b83c0c67
01a52 4983c202                       add        r10, 2
01a56 4981faa7000000                 cmp        r10, 0xa7
01a5d 75ec                           jne        0x7f98b83c0c4b
01a5f 41baa2000000                   mov        r10d, 0xa2
01a65 eb11                           jmp        0x7f98b83c0c78
01a67 50                             push       rax
01a68 4833c0                         xor        rax, rax
01a6b f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01a71 58                             pop        rax
01a72 ebb8                           jmp        0x7f98b83c0c2c
01a74 4983c201                       add        r10, 1
01a78 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01a7d 48be18bf6eb0987f0000           movabs     rsi, 0x7f98b06ebf18
01a87 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
01a8a 83c302                         add        ebx, 2
01a8d 895e70                         mov        dword ptr [rsi + 0x70], ebx
01a90 81e3feff1f00                   and        ebx, 0x1ffffe
01a96 85db                           test       ebx, ebx
01a98 0f84682c0000                   je         0x7f98b83c3906
01a9e 488bf7                         mov        rsi, rdi
01aa1 48bb18bf6eb0987f0000           movabs     rbx, 0x7f98b06ebf18
01aab 8b36                           mov        esi, dword ptr [rsi]
01aad c1ee0d                         shr        esi, 0xd
01ab0 48c1e60a                       shl        rsi, 0xa
01ab4 41ba00000080                   mov        r10d, 0x80000000
01aba 4903f2                         add        rsi, r10
01abd 41ba16000000                   mov        r10d, 0x16
01ac3 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
01ac7 7436                           je         0x7f98b83c0cff
01ac9 4983c202                       add        r10, 2
01acd 4983fa1a                       cmp        r10, 0x1a
01ad1 75f0                           jne        0x7f98b83c0cc3
01ad3 41ba16000000                   mov        r10d, 0x16
01ad9 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01ade 7412                           je         0x7f98b83c0cf2
01ae0 4983c202                       add        r10, 2
01ae4 4983fa1a                       cmp        r10, 0x1a
01ae8 75ef                           jne        0x7f98b83c0cd9
01aea 41ba15000000                   mov        r10d, 0x15
01af0 eb11                           jmp        0x7f98b83c0d03
01af2 50                             push       rax
01af3 4833c0                         xor        rax, rax
01af6 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01afc 58                             pop        rax
01afd ebbe                           jmp        0x7f98b83c0cbd
01aff 4983c201                       add        r10, 1
01b03 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01b08 488bf7                         mov        rsi, rdi
01b0b 6690                           nop        
01b0d 48b8c0c91e8c987f0000           movabs     rax, 0x7f988c1ec9c0
01b17 e844a65307                     call       0x7f98bf8fb360
01b1c 0f1f8400141c0007               nop        dword ptr [rax + rax + 0x7001c14]
01b24 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
01b2c 8b7704                         mov        esi, dword ptr [rdi + 4]
01b2f 48bb18bf6eb0987f0000           movabs     rbx, 0x7f98b06ebf18
01b39 488383d800000001               add        qword ptr [rbx + 0xd8], 1
01b41 48bbc8a46eb0987f0000           movabs     rbx, 0x7f98b06ea4c8
01b4b 8b5370                         mov        edx, dword ptr [rbx + 0x70]
01b4e 83c202                         add        edx, 2
01b51 895370                         mov        dword ptr [rbx + 0x70], edx
01b54 81e2feff1f00                   and        edx, 0x1ffffe
01b5a 85d2                           test       edx, edx
01b5c 0f84ca2b0000                   je         0x7f98b83c392c
01b62 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01b6a 48bbc8a46eb0987f0000           movabs     rbx, 0x7f98b06ea4c8
01b74 4883830801000001               add        qword ptr [rbx + 0x108], 1
01b7c ffc8                           dec        eax
01b7e 2bf0                           sub        esi, eax
01b80 48bb989b6eb0987f0000           movabs     rbx, 0x7f98b06e9b98
01b8a 8b4370                         mov        eax, dword ptr [rbx + 0x70]
01b8d 83c002                         add        eax, 2
01b90 894370                         mov        dword ptr [rbx + 0x70], eax
01b93 25feff1f00                     and        eax, 0x1ffffe
01b98 85c0                           test       eax, eax
01b9a 0f84ad2b0000                   je         0x7f98b83c394d
01ba0 48bb989b6eb0987f0000           movabs     rbx, 0x7f98b06e9b98
01baa 488383a800000001               add        qword ptr [rbx + 0xa8], 1
01bb2 48bb0000000000000000           movabs     rbx, 0
01bbc bb00000000                     mov        ebx, 0
01bc1 443bdb                         cmp        r11d, ebx
01bc4 0f8ca42b0000                   jl         0x7f98b83c396e
01bca 443bde                         cmp        r11d, esi
01bcd 0f8da82b0000                   jge        0x7f98b83c397b
01bd3 498bdb                         mov        rbx, r11
01bd6 899c24c4010000                 mov        dword ptr [rsp + 0x1c4], ebx
01bdd 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
01be5 488bbc24c8010000               mov        rdi, qword ptr [rsp + 0x1c8]
01bed 488bf7                         mov        rsi, rdi
01bf0 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
01bfa 8b36                           mov        esi, dword ptr [rsi]
01bfc c1ee0d                         shr        esi, 0xd
01bff 48c1e60a                       shl        rsi, 0xa
01c03 41ba00000080                   mov        r10d, 0x80000000
01c09 4903f2                         add        rsi, r10
01c0c 41ba1e000000                   mov        r10d, 0x1e
01c12 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01c16 7436                           je         0x7f98b83c0e4e
01c18 4983c202                       add        r10, 2
01c1c 4983fa22                       cmp        r10, 0x22
01c20 75f0                           jne        0x7f98b83c0e12
01c22 41ba1e000000                   mov        r10d, 0x1e
01c28 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01c2d 7412                           je         0x7f98b83c0e41
01c2f 4983c202                       add        r10, 2
01c33 4983fa22                       cmp        r10, 0x22
01c37 75ef                           jne        0x7f98b83c0e28
01c39 41ba1d000000                   mov        r10d, 0x1d
01c3f eb11                           jmp        0x7f98b83c0e52
01c41 50                             push       rax
01c42 4833c0                         xor        rax, rax
01c45 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01c4b 58                             pop        rax
01c4c ebbe                           jmp        0x7f98b83c0e0c
01c4e 4983c201                       add        r10, 1
01c52 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01c57 488bf7                         mov        rsi, rdi
01c5a 666690                         nop        
01c5d 48b8e8c91e8c987f0000           movabs     rax, 0x7f988c1ec9e8
01c67 e8f4a45307                     call       0x7f98bf8fb360
01c6c 0f1f8400641d0008               nop        dword ptr [rax + rax + 0x8001d64]
01c74 483b00                         cmp        rax, qword ptr [rax]
01c77 488bf0                         mov        rsi, rax
01c7a 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
01c84 8b36                           mov        esi, dword ptr [rsi]
01c86 c1ee0d                         shr        esi, 0xd
01c89 48c1e60a                       shl        rsi, 0xa
01c8d 41ba00000080                   mov        r10d, 0x80000000
01c93 4903f2                         add        rsi, r10
01c96 41ba24000000                   mov        r10d, 0x24
01c9c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01ca0 7436                           je         0x7f98b83c0ed8
01ca2 4983c202                       add        r10, 2
01ca6 4983fa28                       cmp        r10, 0x28
01caa 75f0                           jne        0x7f98b83c0e9c
01cac 41ba24000000                   mov        r10d, 0x24
01cb2 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01cb7 7412                           je         0x7f98b83c0ecb
01cb9 4983c202                       add        r10, 2
01cbd 4983fa28                       cmp        r10, 0x28
01cc1 75ef                           jne        0x7f98b83c0eb2
01cc3 41ba23000000                   mov        r10d, 0x23
01cc9 eb11                           jmp        0x7f98b83c0edc
01ccb 50                             push       rax
01ccc 4833c0                         xor        rax, rax
01ccf f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01cd5 58                             pop        rax
01cd6 ebbe                           jmp        0x7f98b83c0e96
01cd8 4983c201                       add        r10, 1
01cdc 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01ce1 8b7024                         mov        esi, dword ptr [rax + 0x24]
01ce4 488bd0                         mov        rdx, rax
01ce7 48b918bf6eb0987f0000           movabs     rcx, 0x7f98b06ebf18
01cf1 8b12                           mov        edx, dword ptr [rdx]
01cf3 c1ea0d                         shr        edx, 0xd
01cf6 48c1e20a                       shl        rdx, 0xa
01cfa 41ba00000080                   mov        r10d, 0x80000000
01d00 4903d2                         add        rdx, r10
01d03 41ba2a000000                   mov        r10d, 0x2a
01d09 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01d0d 7436                           je         0x7f98b83c0f45
01d0f 4983c202                       add        r10, 2
01d13 4983fa2e                       cmp        r10, 0x2e
01d17 75f0                           jne        0x7f98b83c0f09
01d19 41ba2a000000                   mov        r10d, 0x2a
01d1f 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01d24 7412                           je         0x7f98b83c0f38
01d26 4983c202                       add        r10, 2
01d2a 4983fa2e                       cmp        r10, 0x2e
01d2e 75ef                           jne        0x7f98b83c0f1f
01d30 41ba29000000                   mov        r10d, 0x29
01d36 eb11                           jmp        0x7f98b83c0f49
01d38 50                             push       rax
01d39 4833c0                         xor        rax, rax
01d3c f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
01d42 58                             pop        rax
01d43 ebbe                           jmp        0x7f98b83c0f03
01d45 4983c201                       add        r10, 1
01d49 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01d4e 8b4804                         mov        ecx, dword ptr [rax + 4]
01d51 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
01d5b 4883827801000001               add        qword ptr [rdx + 0x178], 1
01d63 48ba00a76eb0987f0000           movabs     rdx, 0x7f98b06ea700
01d6d 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01d71 4183c002                       add        r8d, 2
01d75 44894270                       mov        dword ptr [rdx + 0x70], r8d
01d79 4181e0feff1f00                 and        r8d, 0x1ffffe
01d80 4585c0                         test       r8d, r8d
01d83 0f84042a0000                   je         0x7f98b83c398d
01d89 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
01d93 4883828801000001               add        qword ptr [rdx + 0x188], 1
01d9b 8b9c24c4010000                 mov        ebx, dword ptr [rsp + 0x1c4]
01da2 4863db                         movsxd     rbx, ebx
01da5 ba08000000                     mov        edx, 8
01daa 4c8bcb                         mov        r9, rbx
01dad 4c03ca                         add        r9, rdx
01db0 48ba508a6eb0987f0000           movabs     rdx, 0x7f98b06e8a50
01dba 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01dbe 4183c002                       add        r8d, 2
01dc2 44894270                       mov        dword ptr [rdx + 0x70], r8d
01dc6 4181e0feff1f00                 and        r8d, 0x1ffffe
01dcd 4585c0                         test       r8d, r8d
01dd0 0f84d8290000                   je         0x7f98b83c39ae
01dd6 48ba508a6eb0987f0000           movabs     rdx, 0x7f98b06e8a50
01de0 488382d800000001               add        qword ptr [rdx + 0xd8], 1
01de8 48bac88b6eb0987f0000           movabs     rdx, 0x7f98b06e8bc8
01df2 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01df6 4183c002                       add        r8d, 2
01dfa 44894270                       mov        dword ptr [rdx + 0x70], r8d
01dfe 4181e0feff1f00                 and        r8d, 0x1ffffe
01e05 4585c0                         test       r8d, r8d
01e08 0f84c1290000                   je         0x7f98b83c39cf
01e0e 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
01e18 488d9298010000                 lea        rdx, [rdx + 0x198]
01e1f 49b8700974e200000000           movabs     r8, 0xe2740970
01e29 49b800b8168000000000           movabs     r8, 0x8016b800
01e33 4d8bd0                         mov        r10, r8
01e36 4c3302                         xor        r8, qword ptr [rdx]
01e39 49f7c0fcffffff                 test       r8, -4
01e40 7427                           je         0x7f98b83c1069
01e42 41f6c002                       test       r8b, 2
01e46 7521                           jne        0x7f98b83c1069
01e48 48f702feffffff                 test       qword ptr [rdx], -2
01e4f 7415                           je         0x7f98b83c1066
01e51 4d8bc2                         mov        r8, r10
01e54 4c3302                         xor        r8, qword ptr [rdx]
01e57 49f7c0fcffffff                 test       r8, -4
01e5e 7409                           je         0x7f98b83c1069
01e60 48830a02                       or         qword ptr [rdx], 2
01e64 eb03                           jmp        0x7f98b83c1069
01e66 4c8902                         mov        qword ptr [rdx], r8
01e69 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
01e73 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
01e7b ba02000000                     mov        edx, 2
01e80 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
01e88 bf00000000                     mov        edi, 0
01e8d 488b8424c8010000               mov        rax, qword ptr [rsp + 0x1c8]
01e95 48890424                       mov        qword ptr [rsp], rax
01e99 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
01ea1 4889442408                     mov        qword ptr [rsp + 8], rax
01ea6 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01eab 49ba700974e200000000           movabs     r10, 0xe2740970
01eb5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01eba 0f1f440000                     nop        dword ptr [rax + rax]
01ebf e89ca75307                     call       0x7f98bf8fb860
01ec4 0f1f8400bc1f0009               nop        dword ptr [rax + rax + 0x9001fbc]
01ecc 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01ed4 4183c310                       add        r11d, 0x10
01ed8 8bb424c0010000                 mov        esi, dword ptr [rsp + 0x1c0]
01edf 83c610                         add        esi, 0x10
01ee2 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01eea ba02000000                     mov        edx, 2
01eef 7c05                           jl         0x7f98b83c10f6
01ef1 ba00000000                     mov        edx, 0
01ef6 48b9d8ab70b0987f0000           movabs     rcx, 0x7f98b070abd8
01f00 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
01f04 4403c2                         add        r8d, edx
01f07 44894174                       mov        dword ptr [rcx + 0x74], r8d
01f0b 85d2                           test       edx, edx
01f0d 7506                           jne        0x7f98b83c1115
01f0f 41b802000000                   mov        r8d, 2
01f15 4181e0fe3f0000                 and        r8d, 0x3ffe
01f1c 4585c0                         test       r8d, r8d
01f1f 0f84cb280000                   je         0x7f98b83c39f0
01f25 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01f29 418502                         test       dword ptr [r10], eax
01f2c 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01f34 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
01f3e b940050000                     mov        ecx, 0x540
01f43 7c05                           jl         0x7f98b83c114a
01f45 b950050000                     mov        ecx, 0x550
01f4a 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01f4e 4d8d4001                       lea        r8, [r8 + 1]
01f52 4c89040a                       mov        qword ptr [rdx + rcx], r8
01f56 0f8cf4f3ffff                   jl         0x7f98b83c0550
01f5c 48bed8ab70b0987f0000           movabs     rsi, 0x7f98b070abd8
01f66 ff8660050000                   inc        dword ptr [rsi + 0x560]
01f6c e9a5000000                     jmp        0x7f98b83c1216
01f71 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
01f7b 4883827805000001               add        qword ptr [rdx + 0x578], 1
01f83 488bb42468010000               mov        rsi, qword ptr [rsp + 0x168]
01f8b 8b942490010000                 mov        edx, dword ptr [rsp + 0x190]
01f92 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
01f9a 448b842474010000               mov        r8d, dword ptr [rsp + 0x174]
01fa2 4c8bcf                         mov        r9, rdi
01fa5 4885c9                         test       rcx, rcx
01fa8 0f8463280000                   je         0x7f98b83c3a11
01fae 85d2                           test       edx, edx
01fb0 0f8c5b280000                   jl         0x7f98b83c3a11
01fb6 4585c0                         test       r8d, r8d
01fb9 0f8c52280000                   jl         0x7f98b83c3a11
01fbf 4a8d3c0a                       lea        rdi, [rdx + r9]
01fc3 3b7e04                         cmp        edi, dword ptr [rsi + 4]
01fc6 0f8745280000                   ja         0x7f98b83c3a11
01fcc 4b8d3c08                       lea        rdi, [r8 + r9]
01fd0 3b7904                         cmp        edi, dword ptr [rcx + 4]
01fd3 0f8738280000                   ja         0x7f98b83c3a11
01fd9 4585c9                         test       r9d, r9d
01fdc 0f8c2f280000                   jl         0x7f98b83c3a11
01fe2 4863d2                         movsxd     rdx, edx
01fe5 4d63c0                         movsxd     r8, r8d
01fe8 488d7c1608                     lea        rdi, [rsi + rdx + 8]
01fed 4a8d740108                     lea        rsi, [rcx + r8 + 8]
01ff2 498bd1                         mov        rdx, r9
01ff5 40f6c40f                       test       spl, 0xf
01ff9 0f8412000000                   je         0x7f98b83c1211
01fff 4883ec08                       sub        rsp, 8
02003 e8183d5207                     call       0x7f98bf8e4f20
02008 4883c408                       add        rsp, 8
0200c e905000000                     jmp        0x7f98b83c1216
02011 e80a3d5207                     call       0x7f98bf8e4f20
02016 8bb424a4010000                 mov        esi, dword ptr [rsp + 0x1a4]
0201d 8b9c24a0010000                 mov        ebx, dword ptr [rsp + 0x1a0]
02024 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
0202c 488bfb                         mov        rdi, rbx
0202f 2bbc24a8010000                 sub        edi, dword ptr [rsp + 0x1a8]
02036 4183f810                       cmp        r8d, 0x10
0203a 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
02044 b988050000                     mov        ecx, 0x588
02049 7f05                           jg         0x7f98b83c1250
0204b b998050000                     mov        ecx, 0x598
02050 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
02054 4d8d4901                       lea        r9, [r9 + 1]
02058 4c890c0a                       mov        qword ptr [rdx + rcx], r9
0205c 448b8c24a8010000               mov        r9d, dword ptr [rsp + 0x1a8]
02064 0f8f2c000000                   jg         0x7f98b83c1296
0206a 4183f910                       cmp        r9d, 0x10
0206e 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
02078 b9b8050000                     mov        ecx, 0x5b8
0207d 7d05                           jge        0x7f98b83c1284
0207f b9a8050000                     mov        ecx, 0x5a8
02084 488b040a                       mov        rax, qword ptr [rdx + rcx]
02088 488d4001                       lea        rax, [rax + 1]
0208c 4889040a                       mov        qword ptr [rdx + rcx], rax
02090 0f8de6110000                   jge        0x7f98b83c247c
02096 453bc8                         cmp        r9d, r8d
02099 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
020a3 b920060000                     mov        ecx, 0x620
020a8 7c05                           jl         0x7f98b83c12af
020aa b930060000                     mov        ecx, 0x630
020af 488b040a                       mov        rax, qword ptr [rdx + rcx]
020b3 488d4001                       lea        rax, [rax + 1]
020b7 4889040a                       mov        qword ptr [rdx + rcx], rax
020bb 0f8c04030000                   jl         0x7f98b83c15c5
020c1 4183f830                       cmp        r8d, 0x30
020c5 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
020cf b940060000                     mov        ecx, 0x640
020d4 7e05                           jle        0x7f98b83c12db
020d6 b950060000                     mov        ecx, 0x650
020db 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
020df 4d8d4901                       lea        r9, [r9 + 1]
020e3 4c890c0a                       mov        qword ptr [rdx + rcx], r9
020e7 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
020ee 0f8ec4000000                   jle        0x7f98b83c13b8
020f4 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
020fe 4883826006000001               add        qword ptr [rdx + 0x660], 1
02106 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
0210e 488bd7                         mov        rdx, rdi
02111 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
02119 498bf8                         mov        rdi, r8
0211c 4c8bc3                         mov        r8, rbx
0211f 4c8bcf                         mov        r9, rdi
02122 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
02129 4885f6                         test       rsi, rsi
0212c 0f84ef260000                   je         0x7f98b83c3a21
02132 4885c9                         test       rcx, rcx
02135 0f84e6260000                   je         0x7f98b83c3a21
0213b 85d2                           test       edx, edx
0213d 0f8cde260000                   jl         0x7f98b83c3a21
02143 4585c0                         test       r8d, r8d
02146 0f8cd5260000                   jl         0x7f98b83c3a21
0214c 4a8d3c0a                       lea        rdi, [rdx + r9]
02150 3b7e04                         cmp        edi, dword ptr [rsi + 4]
02153 0f87c8260000                   ja         0x7f98b83c3a21
02159 4b8d3c08                       lea        rdi, [r8 + r9]
0215d 3b7904                         cmp        edi, dword ptr [rcx + 4]
02160 0f87bb260000                   ja         0x7f98b83c3a21
02166 4585c9                         test       r9d, r9d
02169 0f8cb2260000                   jl         0x7f98b83c3a21
0216f 4863d2                         movsxd     rdx, edx
02172 4d63c0                         movsxd     r8, r8d
02175 488d7c1608                     lea        rdi, [rsi + rdx + 8]
0217a 4a8d740108                     lea        rsi, [rcx + r8 + 8]
0217f 498bd1                         mov        rdx, r9
02182 40f6c40f                       test       spl, 0xf
02186 0f8412000000                   je         0x7f98b83c139e
0218c 4883ec08                       sub        rsp, 8
02190 e88b3b5207                     call       0x7f98bf8e4f20
02195 4883c408                       add        rsp, 8
02199 e905000000                     jmp        0x7f98b83c13a3
0219e e87d3b5207                     call       0x7f98bf8e4f20
021a3 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
021ad ff8270060000                   inc        dword ptr [rdx + 0x670]
021b3 e9ea010000                     jmp        0x7f98b83c15a2
021b8 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
021bf 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
021c6 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
021cd 899c24e0010000                 mov        dword ptr [rsp + 0x1e0], ebx
021d4 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
021db 0f1f440000                     nop        dword ptr [rax + rax]
021e0 898424d8010000                 mov        dword ptr [rsp + 0x1d8], eax
021e7 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
021ef 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
021f9 4883828806000001               add        qword ptr [rdx + 0x688], 1
02201 48ba787170b0987f0000           movabs     rdx, 0x7f98b0707178
0220b 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0220e 83c102                         add        ecx, 2
02211 894a70                         mov        dword ptr [rdx + 0x70], ecx
02214 81e1feff1f00                   and        ecx, 0x1ffffe
0221a 85c9                           test       ecx, ecx
0221c 0f840f260000                   je         0x7f98b83c3a31
02222 660f1f440000                   nop        word ptr [rax + rax]
02228 e934260000                     jmp        0x7f98b83c3a61
0222d 90                             nop        
0222e 90                             nop        
0222f 90                             nop        
02230 90                             nop        
02231 90                             nop        
02232 48ba787170b0987f0000           movabs     rdx, 0x7f98b0707178
0223c 488d92d8000000                 lea        rdx, [rdx + 0xd8]
02243 4885c0                         test       rax, rax
02246 750c                           jne        0x7f98b83c1454
02248 f6420801                       test       byte ptr [rdx + 8], 1
0224c 7506                           jne        0x7f98b83c1454
0224e f048834a0801                   lock or    qword ptr [rdx + 8], 1
02254 48be38c66fe200000000           movabs     rsi, 0xe26fc638
0225e 488bd6                         mov        rdx, rsi
02261 48b9787170b0987f0000           movabs     rcx, 0x7f98b0707178
0226b 8b12                           mov        edx, dword ptr [rdx]
0226d c1ea0d                         shr        edx, 0xd
02270 48c1e20a                       shl        rdx, 0xa
02274 41ba00000080                   mov        r10d, 0x80000000
0227a 4903d2                         add        rdx, r10
0227d 41ba16000000                   mov        r10d, 0x16
02283 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02287 7436                           je         0x7f98b83c14bf
02289 4983c202                       add        r10, 2
0228d 4983fa1a                       cmp        r10, 0x1a
02291 75f0                           jne        0x7f98b83c1483
02293 41ba16000000                   mov        r10d, 0x16
02299 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0229e 7412                           je         0x7f98b83c14b2
022a0 4983c202                       add        r10, 2
022a4 4983fa1a                       cmp        r10, 0x1a
022a8 75ef                           jne        0x7f98b83c1499
022aa 41ba15000000                   mov        r10d, 0x15
022b0 eb11                           jmp        0x7f98b83c14c3
022b2 50                             push       rax
022b3 4833c0                         xor        rax, rax
022b6 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
022bc 58                             pop        rax
022bd ebbe                           jmp        0x7f98b83c147d
022bf 4983c201                       add        r10, 1
022c3 4a8304d101                     add        qword ptr [rcx + r10*8], 1
022c8 488bd0                         mov        rdx, rax
022cb 488bcf                         mov        rcx, rdi
022ce 89bc24dc010000                 mov        dword ptr [rsp + 0x1dc], edi
022d5 6690                           nop        
022d7 e884995307                     call       0x7f98bf8fae60
022dc 0f1f8400d423000b               nop        dword ptr [rax + rax + 0xb0023d4]
022e4 48bed8ab70b0987f0000           movabs     rsi, 0x7f98b070abd8
022ee 4883869806000001               add        qword ptr [rsi + 0x698], 1
022f6 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
022fe 8b9424d8010000                 mov        edx, dword ptr [rsp + 0x1d8]
02305 488bc8                         mov        rcx, rax
02308 0f1f8000000000                 nop        dword ptr [rax]
0230f e84ca35307                     call       0x7f98bf8fb860
02314 0f1f84000c24000c               nop        dword ptr [rax + rax + 0xc00240c]
0231c 8b8424d8010000                 mov        eax, dword ptr [rsp + 0x1d8]
02323 83c008                         add        eax, 8
02326 8bbc24dc010000                 mov        edi, dword ptr [rsp + 0x1dc]
0232d 83c708                         add        edi, 8
02330 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
02337 be02000000                     mov        esi, 2
0233c 7c05                           jl         0x7f98b83c1543
0233e be00000000                     mov        esi, 0
02343 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
0234d 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
02350 03ce                           add        ecx, esi
02352 894a74                         mov        dword ptr [rdx + 0x74], ecx
02355 85f6                           test       esi, esi
02357 7505                           jne        0x7f98b83c155e
02359 b902000000                     mov        ecx, 2
0235e 81e1fe3f0000                   and        ecx, 0x3ffe
02364 85c9                           test       ecx, ecx
02366 0f84ff240000                   je         0x7f98b83c3a6b
0236c 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02370 418502                         test       dword ptr [r10], eax
02373 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
0237a 48bed8ab70b0987f0000           movabs     rsi, 0x7f98b070abd8
02384 baa8060000                     mov        edx, 0x6a8
02389 7c05                           jl         0x7f98b83c1590
0238b bab8060000                     mov        edx, 0x6b8
02390 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
02394 488d4901                       lea        rcx, [rcx + 1]
02398 48890c16                       mov        qword ptr [rsi + rdx], rcx
0239c 0f8c3efeffff                   jl         0x7f98b83c13e0
023a2 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
023a9 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
023b0 48bed8ab70b0987f0000           movabs     rsi, 0x7f98b070abd8
023ba ff86c8060000                   inc        dword ptr [rsi + 0x6c8]
023c0 e9011a0000                     jmp        0x7f98b83c2fc6
023c5 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
023cc 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
023d3 4183f910                       cmp        r9d, 0x10
023d7 48bed8ab70b0987f0000           movabs     rsi, 0x7f98b070abd8
023e1 bae0060000                     mov        edx, 0x6e0
023e6 7c05                           jl         0x7f98b83c15ed
023e8 baf0060000                     mov        edx, 0x6f0
023ed 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
023f1 488d4901                       lea        rcx, [rcx + 1]
023f5 48890c16                       mov        qword ptr [rsi + rdx], rcx
023f9 0f8c0d0c0000                   jl         0x7f98b83c220c
023ff 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
02406 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
0240d 899c24f0010000                 mov        dword ptr [rsp + 0x1f0], ebx
02414 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
0241b 0f1f440000                     nop        dword ptr [rax + rax]
02420 898424ec010000                 mov        dword ptr [rsp + 0x1ec], eax
02427 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0242f 48bed8ab70b0987f0000           movabs     rsi, 0x7f98b070abd8
02439 4883860007000001               add        qword ptr [rsi + 0x700], 1
02441 48bea8b86eb0987f0000           movabs     rsi, 0x7f98b06eb8a8
0244b 8b5670                         mov        edx, dword ptr [rsi + 0x70]
0244e 83c202                         add        edx, 2
02451 895670                         mov        dword ptr [rsi + 0x70], edx
02454 81e2feff1f00                   and        edx, 0x1ffffe
0245a 85d2                           test       edx, edx
0245c 0f842a240000                   je         0x7f98b83c3a8c
02462 48bec09272e200000000           movabs     rsi, 0xe27292c0
0246c 48baa8b86eb0987f0000           movabs     rdx, 0x7f98b06eb8a8
02476 8b36                           mov        esi, dword ptr [rsi]
02478 c1ee0d                         shr        esi, 0xd
0247b 48c1e60a                       shl        rsi, 0xa
0247f 41ba00000080                   mov        r10d, 0x80000000
02485 4903f2                         add        rsi, r10
02488 41ba16000000                   mov        r10d, 0x16
0248e 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02492 7436                           je         0x7f98b83c16ca
02494 4983c202                       add        r10, 2
02498 4983fa1a                       cmp        r10, 0x1a
0249c 75f0                           jne        0x7f98b83c168e
0249e 41ba16000000                   mov        r10d, 0x16
024a4 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
024a9 7412                           je         0x7f98b83c16bd
024ab 4983c202                       add        r10, 2
024af 4983fa1a                       cmp        r10, 0x1a
024b3 75ef                           jne        0x7f98b83c16a4
024b5 41ba15000000                   mov        r10d, 0x15
024bb eb11                           jmp        0x7f98b83c16ce
024bd 50                             push       rax
024be 4833c0                         xor        rax, rax
024c1 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
024c7 58                             pop        rax
024c8 ebbe                           jmp        0x7f98b83c1688
024ca 4983c201                       add        r10, 1
024ce 4a8304d201                     add        qword ptr [rdx + r10*8], 1
024d3 448b6804                       mov        r13d, dword ptr [rax + 4]
024d7 48bea8b86eb0987f0000           movabs     rsi, 0x7f98b06eb8a8
024e1 488386d800000001               add        qword ptr [rsi + 0xd8], 1
024e9 48bec8a46eb0987f0000           movabs     rsi, 0x7f98b06ea4c8
024f3 8b5670                         mov        edx, dword ptr [rsi + 0x70]
024f6 83c202                         add        edx, 2
024f9 895670                         mov        dword ptr [rsi + 0x70], edx
024fc 81e2feff1f00                   and        edx, 0x1ffffe
02502 85d2                           test       edx, edx
02504 0f84a8230000                   je         0x7f98b83c3ab2
0250a 48bec8a46eb0987f0000           movabs     rsi, 0x7f98b06ea4c8
02514 4883860801000001               add        qword ptr [rsi + 0x108], 1
0251c 498bf5                         mov        rsi, r13
0251f 83ee0f                         sub        esi, 0xf
02522 48ba989b6eb0987f0000           movabs     rdx, 0x7f98b06e9b98
0252c 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0252f 83c102                         add        ecx, 2
02532 894a70                         mov        dword ptr [rdx + 0x70], ecx
02535 81e1feff1f00                   and        ecx, 0x1ffffe
0253b 85c9                           test       ecx, ecx
0253d 0f8490230000                   je         0x7f98b83c3ad3
02543 48ba989b6eb0987f0000           movabs     rdx, 0x7f98b06e9b98
0254d 488382a800000001               add        qword ptr [rdx + 0xa8], 1
02555 48ba0000000000000000           movabs     rdx, 0
0255f ba00000000                     mov        edx, 0
02564 3bfa                           cmp        edi, edx
02566 0f8c88230000                   jl         0x7f98b83c3af4
0256c 3bfe                           cmp        edi, esi
0256e 0f8d8d230000                   jge        0x7f98b83c3b01
02574 488bf7                         mov        rsi, rdi
02577 48bac09272e200000000           movabs     rdx, 0xe27292c0
02581 488bca                         mov        rcx, rdx
02584 49b8a8b86eb0987f0000           movabs     r8, 0x7f98b06eb8a8
0258e 8b09                           mov        ecx, dword ptr [rcx]
02590 c1e90d                         shr        ecx, 0xd
02593 48c1e10a                       shl        rcx, 0xa
02597 41ba00000080                   mov        r10d, 0x80000000
0259d 4903ca                         add        rcx, r10
025a0 41ba24000000                   mov        r10d, 0x24
025a6 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
025aa 7436                           je         0x7f98b83c17e2
025ac 4983c202                       add        r10, 2
025b0 4983fa28                       cmp        r10, 0x28
025b4 75f0                           jne        0x7f98b83c17a6
025b6 41ba24000000                   mov        r10d, 0x24
025bc 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
025c1 7412                           je         0x7f98b83c17d5
025c3 4983c202                       add        r10, 2
025c7 4983fa28                       cmp        r10, 0x28
025cb 75ef                           jne        0x7f98b83c17bc
025cd 41ba23000000                   mov        r10d, 0x23
025d3 eb11                           jmp        0x7f98b83c17e6
025d5 50                             push       rax
025d6 4833c0                         xor        rax, rax
025d9 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
025df 58                             pop        rax
025e0 ebbe                           jmp        0x7f98b83c17a0
025e2 4983c201                       add        r10, 1
025e6 4b8304d001                     add        qword ptr [r8 + r10*8], 1
025eb 48b9989c6eb0987f0000           movabs     rcx, 0x7f98b06e9c98
025f5 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
025f9 4183c002                       add        r8d, 2
025fd 44894170                       mov        dword ptr [rcx + 0x70], r8d
02601 4181e0feff1f00                 and        r8d, 0x1ffffe
02608 4585c0                         test       r8d, r8d
0260b 0f84fd220000                   je         0x7f98b83c3b0e
02611 48b9989c6eb0987f0000           movabs     rcx, 0x7f98b06e9c98
0261b 488381a800000001               add        qword ptr [rcx + 0xa8], 1
02623 48bac09d6eb0987f0000           movabs     rdx, 0x7f98b06e9dc0
0262d 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02630 83c102                         add        ecx, 2
02633 894a70                         mov        dword ptr [rdx + 0x70], ecx
02636 81e1feff1f00                   and        ecx, 0x1ffffe
0263c 85c9                           test       ecx, ecx
0263e 0f84eb220000                   je         0x7f98b83c3b2f
02644 48bac09d6eb0987f0000           movabs     rdx, 0x7f98b06e9dc0
0264e ff82b8000000                   inc        dword ptr [rdx + 0xb8]
02654 4489ac24e8010000               mov        dword ptr [rsp + 0x1e8], r13d
0265c 89bc24e4010000                 mov        dword ptr [rsp + 0x1e4], edi
02663 48bab81273e200000000           movabs     rdx, 0xe27312b8
0266d 488bca                         mov        rcx, rdx
02670 49b8a8b86eb0987f0000           movabs     r8, 0x7f98b06eb8a8
0267a 48b90050168000000000           movabs     rcx, 0x80165000
02684 41ba2a000000                   mov        r10d, 0x2a
0268a 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0268e 7436                           je         0x7f98b83c18c6
02690 4983c202                       add        r10, 2
02694 4983fa2e                       cmp        r10, 0x2e
02698 75f0                           jne        0x7f98b83c188a
0269a 41ba2a000000                   mov        r10d, 0x2a
026a0 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
026a5 7412                           je         0x7f98b83c18b9
026a7 4983c202                       add        r10, 2
026ab 4983fa2e                       cmp        r10, 0x2e
026af 75ef                           jne        0x7f98b83c18a0
026b1 41ba29000000                   mov        r10d, 0x29
026b7 eb11                           jmp        0x7f98b83c18ca
026b9 50                             push       rax
026ba 4833c0                         xor        rax, rax
026bd f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
026c3 58                             pop        rax
026c4 ebbe                           jmp        0x7f98b83c1884
026c6 4983c201                       add        r10, 1
026ca 4b8304d001                     add        qword ptr [r8 + r10*8], 1
026cf 48b970ba6eb0987f0000           movabs     rcx, 0x7f98b06eba70
026d9 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
026dd 4183c002                       add        r8d, 2
026e1 44894170                       mov        dword ptr [rcx + 0x70], r8d
026e5 4181e0feff1f00                 and        r8d, 0x1ffffe
026ec 4585c0                         test       r8d, r8d
026ef 0f845b220000                   je         0x7f98b83c3b50
026f5 488bca                         mov        rcx, rdx
026f8 49b870ba6eb0987f0000           movabs     r8, 0x7f98b06eba70
02702 498380a800000001               add        qword ptr [r8 + 0xa8], 1
0270a 48b950bb6eb0987f0000           movabs     rcx, 0x7f98b06ebb50
02714 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
02718 4183c002                       add        r8d, 2
0271c 44894170                       mov        dword ptr [rcx + 0x70], r8d
02720 4181e0feff1f00                 and        r8d, 0x1ffffe
02727 4585c0                         test       r8d, r8d
0272a 0f8441220000                   je         0x7f98b83c3b71
02730 48b950bb6eb0987f0000           movabs     rcx, 0x7f98b06ebb50
0273a 48ba0050168000000000           movabs     rdx, 0x80165000
02744 41ba16000000                   mov        r10d, 0x16
0274a 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0274e 7436                           je         0x7f98b83c1986
02750 4983c202                       add        r10, 2
02754 4983fa1a                       cmp        r10, 0x1a
02758 75f0                           jne        0x7f98b83c194a
0275a 41ba16000000                   mov        r10d, 0x16
02760 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02765 7412                           je         0x7f98b83c1979
02767 4983c202                       add        r10, 2
0276b 4983fa1a                       cmp        r10, 0x1a
0276f 75ef                           jne        0x7f98b83c1960
02771 41ba15000000                   mov        r10d, 0x15
02777 eb11                           jmp        0x7f98b83c198a
02779 50                             push       rax
0277a 4833c0                         xor        rax, rax
0277d f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02783 58                             pop        rax
02784 ebbe                           jmp        0x7f98b83c1944
02786 4983c201                       add        r10, 1
0278a 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0278f 48ba40a66eb0987f0000           movabs     rdx, 0x7f98b06ea640
02799 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0279c 83c102                         add        ecx, 2
0279f 894a70                         mov        dword ptr [rdx + 0x70], ecx
027a2 81e1feff1f00                   and        ecx, 0x1ffffe
027a8 85c9                           test       ecx, ecx
027aa 0f84e2210000                   je         0x7f98b83c3b92
027b0 48bac09272e200000000           movabs     rdx, 0xe27292c0
027ba 488bca                         mov        rcx, rdx
027bd 49b850bb6eb0987f0000           movabs     r8, 0x7f98b06ebb50
027c7 8b09                           mov        ecx, dword ptr [rcx]
027c9 c1e90d                         shr        ecx, 0xd
027cc 48c1e10a                       shl        rcx, 0xa
027d0 41ba00000080                   mov        r10d, 0x80000000
027d6 4903ca                         add        rcx, r10
027d9 41ba1c000000                   mov        r10d, 0x1c
027df 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
027e3 7436                           je         0x7f98b83c1a1b
027e5 4983c202                       add        r10, 2
027e9 4983fa20                       cmp        r10, 0x20
027ed 75f0                           jne        0x7f98b83c19df
027ef 41ba1c000000                   mov        r10d, 0x1c
027f5 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
027fa 7412                           je         0x7f98b83c1a0e
027fc 4983c202                       add        r10, 2
02800 4983fa20                       cmp        r10, 0x20
02804 75ef                           jne        0x7f98b83c19f5
02806 41ba1b000000                   mov        r10d, 0x1b
0280c eb11                           jmp        0x7f98b83c1a1f
0280e 50                             push       rax
0280f 4833c0                         xor        rax, rax
02812 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
02818 58                             pop        rax
02819 ebbe                           jmp        0x7f98b83c19d9
0281b 4983c201                       add        r10, 1
0281f 4b8304d001                     add        qword ptr [r8 + r10*8], 1
02824 48b950bb6eb0987f0000           movabs     rcx, 0x7f98b06ebb50
0282e 8b12                           mov        edx, dword ptr [rdx]
02830 c1ea0d                         shr        edx, 0xd
02833 48c1e20a                       shl        rdx, 0xa
02837 41ba00000080                   mov        r10d, 0x80000000
0283d 4903d2                         add        rdx, r10
02840 41ba22000000                   mov        r10d, 0x22
02846 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0284a 7436                           je         0x7f98b83c1a82
0284c 4983c202                       add        r10, 2
02850 4983fa26                       cmp        r10, 0x26
02854 75f0                           jne        0x7f98b83c1a46
02856 41ba22000000                   mov        r10d, 0x22
0285c 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02861 7412                           je         0x7f98b83c1a75
02863 4983c202                       add        r10, 2
02867 4983fa26                       cmp        r10, 0x26
0286b 75ef                           jne        0x7f98b83c1a5c
0286d 41ba21000000                   mov        r10d, 0x21
02873 eb11                           jmp        0x7f98b83c1a86
02875 50                             push       rax
02876 4833c0                         xor        rax, rax
02879 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
0287f 58                             pop        rax
02880 ebbe                           jmp        0x7f98b83c1a40
02882 4983c201                       add        r10, 1
02886 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0288b 48ba50bb6eb0987f0000           movabs     rdx, 0x7f98b06ebb50
02895 4883823801000001               add        qword ptr [rdx + 0x138], 1
0289d 48ba00a76eb0987f0000           movabs     rdx, 0x7f98b06ea700
028a7 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
028aa 83c102                         add        ecx, 2
028ad 894a70                         mov        dword ptr [rdx + 0x70], ecx
028b0 81e1feff1f00                   and        ecx, 0x1ffffe
028b6 85c9                           test       ecx, ecx
028b8 0f84f5200000                   je         0x7f98b83c3bb3
028be 48ba50bb6eb0987f0000           movabs     rdx, 0x7f98b06ebb50
028c8 4883824801000001               add        qword ptr [rdx + 0x148], 1
028d0 4c63f6                         movsxd     r14, esi
028d3 be08000000                     mov        esi, 8
028d8 4d8bce                         mov        r9, r14
028db 4c03ce                         add        r9, rsi
028de 48be508a6eb0987f0000           movabs     rsi, 0x7f98b06e8a50
028e8 8b5670                         mov        edx, dword ptr [rsi + 0x70]
028eb 83c202                         add        edx, 2
028ee 895670                         mov        dword ptr [rsi + 0x70], edx
028f1 81e2feff1f00                   and        edx, 0x1ffffe
028f7 85d2                           test       edx, edx
028f9 0f84d5200000                   je         0x7f98b83c3bd4
028ff 48be508a6eb0987f0000           movabs     rsi, 0x7f98b06e8a50
02909 488386d800000001               add        qword ptr [rsi + 0xd8], 1
02911 48bec88b6eb0987f0000           movabs     rsi, 0x7f98b06e8bc8
0291b 8b5670                         mov        edx, dword ptr [rsi + 0x70]
0291e 83c202                         add        edx, 2
02921 895670                         mov        dword ptr [rsi + 0x70], edx
02924 81e2feff1f00                   and        edx, 0x1ffffe
0292a 85d2                           test       edx, edx
0292c 0f84c3200000                   je         0x7f98b83c3bf5
02932 48be50bb6eb0987f0000           movabs     rsi, 0x7f98b06ebb50
0293c 488db658010000                 lea        rsi, [rsi + 0x158]
02943 48ba886b73e200000000           movabs     rdx, 0xe2736b88
0294d 48ba00a8168000000000           movabs     rdx, 0x8016a800
02957 4c8bd2                         mov        r10, rdx
0295a 483316                         xor        rdx, qword ptr [rsi]
0295d 48f7c2fcffffff                 test       rdx, -4
02964 7426                           je         0x7f98b83c1b8c
02966 f6c202                         test       dl, 2
02969 7521                           jne        0x7f98b83c1b8c
0296b 48f706feffffff                 test       qword ptr [rsi], -2
02972 7415                           je         0x7f98b83c1b89
02974 498bd2                         mov        rdx, r10
02977 483316                         xor        rdx, qword ptr [rsi]
0297a 48f7c2fcffffff                 test       rdx, -4
02981 7409                           je         0x7f98b83c1b8c
02983 48830e02                       or         qword ptr [rsi], 2
02987 eb03                           jmp        0x7f98b83c1b8c
02989 488916                         mov        qword ptr [rsi], rdx
0298c 48be50bb6eb0987f0000           movabs     rsi, 0x7f98b06ebb50
02996 4883866801000001               add        qword ptr [rsi + 0x168], 1
0299e 48be089372e200000000           movabs     rsi, 0xe2729308
029a8 ba02000000                     mov        edx, 2
029ad b910000000                     mov        ecx, 0x10
029b2 4c8bc0                         mov        r8, rax
029b5 bf00000000                     mov        edi, 0
029ba 48890424                       mov        qword ptr [rsp], rax
029be 4c89742408                     mov        qword ptr [rsp + 8], r14
029c3 49bac09272e200000000           movabs     r10, 0xe27292c0
029cd 4c89542410                     mov        qword ptr [rsp + 0x10], r10
029d2 49ba886b73e200000000           movabs     r10, 0xe2736b88
029dc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
029e1 660f1f440000                   nop        word ptr [rax + rax]
029e7 e8749c5307                     call       0x7f98bf8fb860
029ec 0f1f8400e42a000e               nop        dword ptr [rax + rax + 0xe002ae4]
029f4 4885c0                         test       rax, rax
029f7 48bb50bb6eb0987f0000           movabs     rbx, 0x7f98b06ebb50
02a01 750c                           jne        0x7f98b83c1c0f
02a03 808b7101000001                 or         byte ptr [rbx + 0x171], 1
02a0a e988000000                     jmp        0x7f98b83c1c97
02a0f 8b38                           mov        edi, dword ptr [rax]
02a11 c1ef0d                         shr        edi, 0xd
02a14 48c1e70a                       shl        rdi, 0xa
02a18 41ba00000080                   mov        r10d, 0x80000000
02a1e 4903fa                         add        rdi, r10
02a21 41ba30000000                   mov        r10d, 0x30
02a27 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
02a2b 7436                           je         0x7f98b83c1c63
02a2d 4983c202                       add        r10, 2
02a31 4983fa34                       cmp        r10, 0x34
02a35 75f0                           jne        0x7f98b83c1c27
02a37 41ba30000000                   mov        r10d, 0x30
02a3d 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02a42 7412                           je         0x7f98b83c1c56
02a44 4983c202                       add        r10, 2
02a48 4983fa34                       cmp        r10, 0x34
02a4c 75ef                           jne        0x7f98b83c1c3d
02a4e 41ba2f000000                   mov        r10d, 0x2f
02a54 eb11                           jmp        0x7f98b83c1c67
02a56 50                             push       rax
02a57 4833c0                         xor        rax, rax
02a5a f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
02a60 58                             pop        rax
02a61 ebbe                           jmp        0x7f98b83c1c21
02a63 4983c201                       add        r10, 1
02a67 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02a6c 48bf00b0148000000000           movabs     rdi, 0x8014b000
02a76 8b18                           mov        ebx, dword ptr [rax]
02a78 c1eb0d                         shr        ebx, 0xd
02a7b 48c1e30a                       shl        rbx, 0xa
02a7f 41ba00000080                   mov        r10d, 0x80000000
02a85 4903da                         add        rbx, r10
02a88 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
02a8c 0f85841f0000                   jne        0x7f98b83c3c16
02a92 e900000000                     jmp        0x7f98b83c1c97
02a97 488bf8                         mov        rdi, rax
02a9a 4889bc24f8010000               mov        qword ptr [rsp + 0x1f8], rdi
02aa2 483b07                         cmp        rax, qword ptr [rdi]
02aa5 488bf7                         mov        rsi, rdi
02aa8 48bbd8ab70b0987f0000           movabs     rbx, 0x7f98b070abd8
02ab2 8b36                           mov        esi, dword ptr [rsi]
02ab4 c1ee0d                         shr        esi, 0xd
02ab7 48c1e60a                       shl        rsi, 0xa
02abb 41ba00000080                   mov        r10d, 0x80000000
02ac1 4903f2                         add        rsi, r10
02ac4 41bae3000000                   mov        r10d, 0xe3
02aca 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02ace 743c                           je         0x7f98b83c1d0c
02ad0 4983c202                       add        r10, 2
02ad4 4981fae7000000                 cmp        r10, 0xe7
02adb 75ed                           jne        0x7f98b83c1cca
02add 41bae3000000                   mov        r10d, 0xe3
02ae3 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02ae8 7415                           je         0x7f98b83c1cff
02aea 4983c202                       add        r10, 2
02aee 4981fae7000000                 cmp        r10, 0xe7
02af5 75ec                           jne        0x7f98b83c1ce3
02af7 41bae2000000                   mov        r10d, 0xe2
02afd eb11                           jmp        0x7f98b83c1d10
02aff 50                             push       rax
02b00 4833c0                         xor        rax, rax
02b03 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02b09 58                             pop        rax
02b0a ebb8                           jmp        0x7f98b83c1cc4
02b0c 4983c201                       add        r10, 1
02b10 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02b15 48be18bf6eb0987f0000           movabs     rsi, 0x7f98b06ebf18
02b1f 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
02b22 83c302                         add        ebx, 2
02b25 895e70                         mov        dword ptr [rsi + 0x70], ebx
02b28 81e3feff1f00                   and        ebx, 0x1ffffe
02b2e 85db                           test       ebx, ebx
02b30 0f84ee1e0000                   je         0x7f98b83c3c24
02b36 488bf7                         mov        rsi, rdi
02b39 48bb18bf6eb0987f0000           movabs     rbx, 0x7f98b06ebf18
02b43 8b36                           mov        esi, dword ptr [rsi]
02b45 c1ee0d                         shr        esi, 0xd
02b48 48c1e60a                       shl        rsi, 0xa
02b4c 41ba00000080                   mov        r10d, 0x80000000
02b52 4903f2                         add        rsi, r10
02b55 41ba16000000                   mov        r10d, 0x16
02b5b 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02b5f 7436                           je         0x7f98b83c1d97
02b61 4983c202                       add        r10, 2
02b65 4983fa1a                       cmp        r10, 0x1a
02b69 75f0                           jne        0x7f98b83c1d5b
02b6b 41ba16000000                   mov        r10d, 0x16
02b71 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02b76 7412                           je         0x7f98b83c1d8a
02b78 4983c202                       add        r10, 2
02b7c 4983fa1a                       cmp        r10, 0x1a
02b80 75ef                           jne        0x7f98b83c1d71
02b82 41ba15000000                   mov        r10d, 0x15
02b88 eb11                           jmp        0x7f98b83c1d9b
02b8a 50                             push       rax
02b8b 4833c0                         xor        rax, rax
02b8e f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02b94 58                             pop        rax
02b95 ebbe                           jmp        0x7f98b83c1d55
02b97 4983c201                       add        r10, 1
02b9b 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02ba0 488bf7                         mov        rsi, rdi
02ba3 6690                           nop        
02ba5 48b810ca1e8c987f0000           movabs     rax, 0x7f988c1eca10
02baf e8ac955307                     call       0x7f98bf8fb360
02bb4 0f1f8400ac2c000f               nop        dword ptr [rax + rax + 0xf002cac]
02bbc 48be18bf6eb0987f0000           movabs     rsi, 0x7f98b06ebf18
02bc6 488386d800000001               add        qword ptr [rsi + 0xd8], 1
02bce 48bec8a46eb0987f0000           movabs     rsi, 0x7f98b06ea4c8
02bd8 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
02bdb 83c702                         add        edi, 2
02bde 897e70                         mov        dword ptr [rsi + 0x70], edi
02be1 81e7feff1f00                   and        edi, 0x1ffffe
02be7 85ff                           test       edi, edi
02be9 0f84561e0000                   je         0x7f98b83c3c45
02bef 448bac24e8010000               mov        r13d, dword ptr [rsp + 0x1e8]
02bf7 8bbc24ec010000                 mov        edi, dword ptr [rsp + 0x1ec]
02bfe 48bec8a46eb0987f0000           movabs     rsi, 0x7f98b06ea4c8
02c08 4883860801000001               add        qword ptr [rsi + 0x108], 1
02c10 ffc8                           dec        eax
02c12 442be8                         sub        r13d, eax
02c15 48be989b6eb0987f0000           movabs     rsi, 0x7f98b06e9b98
02c1f 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
02c22 83c302                         add        ebx, 2
02c25 895e70                         mov        dword ptr [rsi + 0x70], ebx
02c28 81e3feff1f00                   and        ebx, 0x1ffffe
02c2e 85db                           test       ebx, ebx
02c30 0f84301e0000                   je         0x7f98b83c3c66
02c36 48be989b6eb0987f0000           movabs     rsi, 0x7f98b06e9b98
02c40 488386a800000001               add        qword ptr [rsi + 0xa8], 1
02c48 48be0000000000000000           movabs     rsi, 0
02c52 be00000000                     mov        esi, 0
02c57 3bfe                           cmp        edi, esi
02c59 0f8c281e0000                   jl         0x7f98b83c3c87
02c5f 413bfd                         cmp        edi, r13d
02c62 0f8d2c1e0000                   jge        0x7f98b83c3c94
02c68 488bc7                         mov        rax, rdi
02c6b 898424f4010000                 mov        dword ptr [rsp + 0x1f4], eax
02c72 89bc24ec010000                 mov        dword ptr [rsp + 0x1ec], edi
02c79 488bbc24f8010000               mov        rdi, qword ptr [rsp + 0x1f8]
02c81 488bf7                         mov        rsi, rdi
02c84 48b918bf6eb0987f0000           movabs     rcx, 0x7f98b06ebf18
02c8e 8b36                           mov        esi, dword ptr [rsi]
02c90 c1ee0d                         shr        esi, 0xd
02c93 48c1e60a                       shl        rsi, 0xa
02c97 41ba00000080                   mov        r10d, 0x80000000
02c9d 4903f2                         add        rsi, r10
02ca0 41ba1e000000                   mov        r10d, 0x1e
02ca6 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
02caa 7436                           je         0x7f98b83c1ee2
02cac 4983c202                       add        r10, 2
02cb0 4983fa22                       cmp        r10, 0x22
02cb4 75f0                           jne        0x7f98b83c1ea6
02cb6 41ba1e000000                   mov        r10d, 0x1e
02cbc 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02cc1 7412                           je         0x7f98b83c1ed5
02cc3 4983c202                       add        r10, 2
02cc7 4983fa22                       cmp        r10, 0x22
02ccb 75ef                           jne        0x7f98b83c1ebc
02ccd 41ba1d000000                   mov        r10d, 0x1d
02cd3 eb11                           jmp        0x7f98b83c1ee6
02cd5 50                             push       rax
02cd6 4833c0                         xor        rax, rax
02cd9 f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
02cdf 58                             pop        rax
02ce0 ebbe                           jmp        0x7f98b83c1ea0
02ce2 4983c201                       add        r10, 1
02ce6 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02ceb 488bf7                         mov        rsi, rdi
02cee 0f1f8000000000                 nop        dword ptr [rax]
02cf5 48b838ca1e8c987f0000           movabs     rax, 0x7f988c1eca38
02cff e85c945307                     call       0x7f98bf8fb360
02d04 0f1f8400fc2d0010               nop        dword ptr [rax + rax + 0x10002dfc]
02d0c 483b00                         cmp        rax, qword ptr [rax]
02d0f 488bf0                         mov        rsi, rax
02d12 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
02d1c 8b36                           mov        esi, dword ptr [rsi]
02d1e c1ee0d                         shr        esi, 0xd
02d21 48c1e60a                       shl        rsi, 0xa
02d25 41ba00000080                   mov        r10d, 0x80000000
02d2b 4903f2                         add        rsi, r10
02d2e 41ba24000000                   mov        r10d, 0x24
02d34 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02d38 7436                           je         0x7f98b83c1f70
02d3a 4983c202                       add        r10, 2
02d3e 4983fa28                       cmp        r10, 0x28
02d42 75f0                           jne        0x7f98b83c1f34
02d44 41ba24000000                   mov        r10d, 0x24
02d4a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02d4f 7412                           je         0x7f98b83c1f63
02d51 4983c202                       add        r10, 2
02d55 4983fa28                       cmp        r10, 0x28
02d59 75ef                           jne        0x7f98b83c1f4a
02d5b 41ba23000000                   mov        r10d, 0x23
02d61 eb11                           jmp        0x7f98b83c1f74
02d63 50                             push       rax
02d64 4833c0                         xor        rax, rax
02d67 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
02d6d 58                             pop        rax
02d6e ebbe                           jmp        0x7f98b83c1f2e
02d70 4983c201                       add        r10, 1
02d74 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02d79 8b7024                         mov        esi, dword ptr [rax + 0x24]
02d7c 488bd0                         mov        rdx, rax
02d7f 48b918bf6eb0987f0000           movabs     rcx, 0x7f98b06ebf18
02d89 8b12                           mov        edx, dword ptr [rdx]
02d8b c1ea0d                         shr        edx, 0xd
02d8e 48c1e20a                       shl        rdx, 0xa
02d92 41ba00000080                   mov        r10d, 0x80000000
02d98 4903d2                         add        rdx, r10
02d9b 41ba2a000000                   mov        r10d, 0x2a
02da1 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02da5 7436                           je         0x7f98b83c1fdd
02da7 4983c202                       add        r10, 2
02dab 4983fa2e                       cmp        r10, 0x2e
02daf 75f0                           jne        0x7f98b83c1fa1
02db1 41ba2a000000                   mov        r10d, 0x2a
02db7 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02dbc 7412                           je         0x7f98b83c1fd0
02dbe 4983c202                       add        r10, 2
02dc2 4983fa2e                       cmp        r10, 0x2e
02dc6 75ef                           jne        0x7f98b83c1fb7
02dc8 41ba29000000                   mov        r10d, 0x29
02dce eb11                           jmp        0x7f98b83c1fe1
02dd0 50                             push       rax
02dd1 4833c0                         xor        rax, rax
02dd4 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02dda 58                             pop        rax
02ddb ebbe                           jmp        0x7f98b83c1f9b
02ddd 4983c201                       add        r10, 1
02de1 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02de6 8b4804                         mov        ecx, dword ptr [rax + 4]
02de9 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
02df3 4883827801000001               add        qword ptr [rdx + 0x178], 1
02dfb 48ba00a76eb0987f0000           movabs     rdx, 0x7f98b06ea700
02e05 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02e09 4183c002                       add        r8d, 2
02e0d 44894270                       mov        dword ptr [rdx + 0x70], r8d
02e11 4181e0feff1f00                 and        r8d, 0x1ffffe
02e18 4585c0                         test       r8d, r8d
02e1b 0f84851c0000                   je         0x7f98b83c3ca6
02e21 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
02e2b 4883828801000001               add        qword ptr [rdx + 0x188], 1
02e33 8b8424f4010000                 mov        eax, dword ptr [rsp + 0x1f4]
02e3a 4863c0                         movsxd     rax, eax
02e3d ba08000000                     mov        edx, 8
02e42 4c8bc8                         mov        r9, rax
02e45 4c03ca                         add        r9, rdx
02e48 48ba508a6eb0987f0000           movabs     rdx, 0x7f98b06e8a50
02e52 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02e56 4183c002                       add        r8d, 2
02e5a 44894270                       mov        dword ptr [rdx + 0x70], r8d
02e5e 4181e0feff1f00                 and        r8d, 0x1ffffe
02e65 4585c0                         test       r8d, r8d
02e68 0f84591c0000                   je         0x7f98b83c3cc7
02e6e 48ba508a6eb0987f0000           movabs     rdx, 0x7f98b06e8a50
02e78 488382d800000001               add        qword ptr [rdx + 0xd8], 1
02e80 48bac88b6eb0987f0000           movabs     rdx, 0x7f98b06e8bc8
02e8a 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02e8e 4183c002                       add        r8d, 2
02e92 44894270                       mov        dword ptr [rdx + 0x70], r8d
02e96 4181e0feff1f00                 and        r8d, 0x1ffffe
02e9d 4585c0                         test       r8d, r8d
02ea0 0f84421c0000                   je         0x7f98b83c3ce8
02ea6 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
02eb0 488d9298010000                 lea        rdx, [rdx + 0x198]
02eb7 49b8700974e200000000           movabs     r8, 0xe2740970
02ec1 49b800b8168000000000           movabs     r8, 0x8016b800
02ecb 4d8bd0                         mov        r10, r8
02ece 4c3302                         xor        r8, qword ptr [rdx]
02ed1 49f7c0fcffffff                 test       r8, -4
02ed8 7427                           je         0x7f98b83c2101
02eda 41f6c002                       test       r8b, 2
02ede 7521                           jne        0x7f98b83c2101
02ee0 48f702feffffff                 test       qword ptr [rdx], -2
02ee7 7415                           je         0x7f98b83c20fe
02ee9 4d8bc2                         mov        r8, r10
02eec 4c3302                         xor        r8, qword ptr [rdx]
02eef 49f7c0fcffffff                 test       r8, -4
02ef6 7409                           je         0x7f98b83c2101
02ef8 48830a02                       or         qword ptr [rdx], 2
02efc eb03                           jmp        0x7f98b83c2101
02efe 4c8902                         mov        qword ptr [rdx], r8
02f01 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
02f0b 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
02f13 ba02000000                     mov        edx, 2
02f18 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
02f20 bf00000000                     mov        edi, 0
02f25 488b9c24f8010000               mov        rbx, qword ptr [rsp + 0x1f8]
02f2d 48891c24                       mov        qword ptr [rsp], rbx
02f31 488b9c2438010000               mov        rbx, qword ptr [rsp + 0x138]
02f39 48895c2408                     mov        qword ptr [rsp + 8], rbx
02f3e 4889442410                     mov        qword ptr [rsp + 0x10], rax
02f43 49ba700974e200000000           movabs     r10, 0xe2740970
02f4d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02f52 0f1f440000                     nop        dword ptr [rax + rax]
02f57 e804975307                     call       0x7f98bf8fb860
02f5c 0f1f840054300011               nop        dword ptr [rax + rax + 0x11003054]
02f64 8b8424ec010000                 mov        eax, dword ptr [rsp + 0x1ec]
02f6b 83c010                         add        eax, 0x10
02f6e 8bbc24e4010000                 mov        edi, dword ptr [rsp + 0x1e4]
02f75 83c710                         add        edi, 0x10
02f78 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02f7f ba02000000                     mov        edx, 2
02f84 7c05                           jl         0x7f98b83c218b
02f86 ba00000000                     mov        edx, 0
02f8b 48b9d8ab70b0987f0000           movabs     rcx, 0x7f98b070abd8
02f95 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
02f99 4403c2                         add        r8d, edx
02f9c 44894174                       mov        dword ptr [rcx + 0x74], r8d
02fa0 85d2                           test       edx, edx
02fa2 7506                           jne        0x7f98b83c21aa
02fa4 41b802000000                   mov        r8d, 2
02faa 4181e0fe3f0000                 and        r8d, 0x3ffe
02fb1 4585c0                         test       r8d, r8d
02fb4 0f844f1b0000                   je         0x7f98b83c3d09
02fba 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02fbe 418502                         test       dword ptr [r10], eax
02fc1 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02fc8 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
02fd2 b940070000                     mov        ecx, 0x740
02fd7 7c05                           jl         0x7f98b83c21de
02fd9 b950070000                     mov        ecx, 0x750
02fde 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
02fe2 4d8d4001                       lea        r8, [r8 + 1]
02fe6 4c89040a                       mov        qword ptr [rdx + rcx], r8
02fea 0f8c30f4ffff                   jl         0x7f98b83c1620
02ff0 8b9c24f0010000                 mov        ebx, dword ptr [rsp + 0x1f0]
02ff7 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
03001 ff8260070000                   inc        dword ptr [rdx + 0x760]
03007 e9ba0d0000                     jmp        0x7f98b83c2fc6
0300c 4183f908                       cmp        r9d, 8
03010 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
0301a b978070000                     mov        ecx, 0x778
0301f 7c05                           jl         0x7f98b83c2226
03021 b988070000                     mov        ecx, 0x788
03026 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0302a 4d8d4001                       lea        r8, [r8 + 1]
0302e 4c89040a                       mov        qword ptr [rdx + rcx], r8
03032 0f8cfe010000                   jl         0x7f98b83c2436
03038 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
0303f 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
03046 899c2408020000                 mov        dword ptr [rsp + 0x208], ebx
0304d 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
03054 0f1f4000                       nop        dword ptr [rax]
03058 89842400020000                 mov        dword ptr [rsp + 0x200], eax
0305f 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03067 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
03071 4883829807000001               add        qword ptr [rdx + 0x798], 1
03079 48ba787170b0987f0000           movabs     rdx, 0x7f98b0707178
03083 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03086 83c102                         add        ecx, 2
03089 894a70                         mov        dword ptr [rdx + 0x70], ecx
0308c 81e1feff1f00                   and        ecx, 0x1ffffe
03092 85c9                           test       ecx, ecx
03094 0f84901a0000                   je         0x7f98b83c3d2a
0309a 660f1f440000                   nop        word ptr [rax + rax]
030a0 e9b51a0000                     jmp        0x7f98b83c3d5a
030a5 90                             nop        
030a6 90                             nop        
030a7 90                             nop        
030a8 90                             nop        
030a9 90                             nop        
030aa 48ba787170b0987f0000           movabs     rdx, 0x7f98b0707178
030b4 488d92d8000000                 lea        rdx, [rdx + 0xd8]
030bb 4885c0                         test       rax, rax
030be 750c                           jne        0x7f98b83c22cc
030c0 f6420801                       test       byte ptr [rdx + 8], 1
030c4 7506                           jne        0x7f98b83c22cc
030c6 f048834a0801                   lock or    qword ptr [rdx + 8], 1
030cc 48be38c66fe200000000           movabs     rsi, 0xe26fc638
030d6 488bd6                         mov        rdx, rsi
030d9 48b9787170b0987f0000           movabs     rcx, 0x7f98b0707178
030e3 8b12                           mov        edx, dword ptr [rdx]
030e5 c1ea0d                         shr        edx, 0xd
030e8 48c1e20a                       shl        rdx, 0xa
030ec 41ba00000080                   mov        r10d, 0x80000000
030f2 4903d2                         add        rdx, r10
030f5 41ba16000000                   mov        r10d, 0x16
030fb 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
030ff 7436                           je         0x7f98b83c2337
03101 4983c202                       add        r10, 2
03105 4983fa1a                       cmp        r10, 0x1a
03109 75f0                           jne        0x7f98b83c22fb
0310b 41ba16000000                   mov        r10d, 0x16
03111 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03116 7412                           je         0x7f98b83c232a
03118 4983c202                       add        r10, 2
0311c 4983fa1a                       cmp        r10, 0x1a
03120 75ef                           jne        0x7f98b83c2311
03122 41ba15000000                   mov        r10d, 0x15
03128 eb11                           jmp        0x7f98b83c233b
0312a 50                             push       rax
0312b 4833c0                         xor        rax, rax
0312e f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03134 58                             pop        rax
03135 ebbe                           jmp        0x7f98b83c22f5
03137 4983c201                       add        r10, 1
0313b 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03140 488bd0                         mov        rdx, rax
03143 488bcf                         mov        rcx, rdi
03146 89bc2404020000                 mov        dword ptr [rsp + 0x204], edi
0314d 6690                           nop        
0314f e80c8b5307                     call       0x7f98bf8fae60
03154 0f1f84004c320013               nop        dword ptr [rax + rax + 0x1300324c]
0315c 48bed8ab70b0987f0000           movabs     rsi, 0x7f98b070abd8
03166 488386a807000001               add        qword ptr [rsi + 0x7a8], 1
0316e 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
03176 8b942400020000                 mov        edx, dword ptr [rsp + 0x200]
0317d 488bc8                         mov        rcx, rax
03180 0f1f8000000000                 nop        dword ptr [rax]
03187 e8d4945307                     call       0x7f98bf8fb860
0318c 0f1f840084320014               nop        dword ptr [rax + rax + 0x14003284]
03194 8b842400020000                 mov        eax, dword ptr [rsp + 0x200]
0319b 83c008                         add        eax, 8
0319e 8bbc2404020000                 mov        edi, dword ptr [rsp + 0x204]
031a5 83c708                         add        edi, 8
031a8 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
031af be02000000                     mov        esi, 2
031b4 7c05                           jl         0x7f98b83c23bb
031b6 be00000000                     mov        esi, 0
031bb 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
031c5 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
031c8 03ce                           add        ecx, esi
031ca 894a74                         mov        dword ptr [rdx + 0x74], ecx
031cd 85f6                           test       esi, esi
031cf 7505                           jne        0x7f98b83c23d6
031d1 b902000000                     mov        ecx, 2
031d6 81e1fe3f0000                   and        ecx, 0x3ffe
031dc 85c9                           test       ecx, ecx
031de 0f8480190000                   je         0x7f98b83c3d64
031e4 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
031e8 418502                         test       dword ptr [r10], eax
031eb 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
031f2 48bed8ab70b0987f0000           movabs     rsi, 0x7f98b070abd8
031fc bab8070000                     mov        edx, 0x7b8
03201 7c05                           jl         0x7f98b83c2408
03203 bac8070000                     mov        edx, 0x7c8
03208 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0320c 488d4901                       lea        rcx, [rcx + 1]
03210 48890c16                       mov        qword ptr [rsi + rdx], rcx
03214 0f8c3efeffff                   jl         0x7f98b83c2258
0321a 8b9c2408020000                 mov        ebx, dword ptr [rsp + 0x208]
03221 48bed8ab70b0987f0000           movabs     rsi, 0x7f98b070abd8
0322b ff86d8070000                   inc        dword ptr [rsi + 0x7d8]
03231 e9900b0000                     jmp        0x7f98b83c2fc6
03236 48bed8ab70b0987f0000           movabs     rsi, 0x7f98b070abd8
03240 488386f007000001               add        qword ptr [rsi + 0x7f0], 1
03248 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
03250 8b9424d0010000                 mov        edx, dword ptr [rsp + 0x1d0]
03257 488bcf                         mov        rcx, rdi
0325a 4d8bc1                         mov        r8, r9
0325d 448b8c2478010000               mov        r9d, dword ptr [rsp + 0x178]
03265 6690                           nop        
03267 e8f4935307                     call       0x7f98bf8fb860
0326c 0f1f840064330016               nop        dword ptr [rax + rax + 0x16003364]
03274 488bd8                         mov        rbx, rax
03277 e94a0b0000                     jmp        0x7f98b83c2fc6
0327c 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
03283 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
0328a 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03292 48bed8ab70b0987f0000           movabs     rsi, 0x7f98b070abd8
0329c 488386c805000001               add        qword ptr [rsi + 0x5c8], 1
032a4 48bea8b86eb0987f0000           movabs     rsi, 0x7f98b06eb8a8
032ae 8b5670                         mov        edx, dword ptr [rsi + 0x70]
032b1 83c202                         add        edx, 2
032b4 895670                         mov        dword ptr [rsi + 0x70], edx
032b7 81e2feff1f00                   and        edx, 0x1ffffe
032bd 85d2                           test       edx, edx
032bf 0f84c0180000                   je         0x7f98b83c3d85
032c5 48bec09272e200000000           movabs     rsi, 0xe27292c0
032cf 48baa8b86eb0987f0000           movabs     rdx, 0x7f98b06eb8a8
032d9 8b36                           mov        esi, dword ptr [rsi]
032db c1ee0d                         shr        esi, 0xd
032de 48c1e60a                       shl        rsi, 0xa
032e2 41ba00000080                   mov        r10d, 0x80000000
032e8 4903f2                         add        rsi, r10
032eb 41ba16000000                   mov        r10d, 0x16
032f1 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
032f5 7436                           je         0x7f98b83c252d
032f7 4983c202                       add        r10, 2
032fb 4983fa1a                       cmp        r10, 0x1a
032ff 75f0                           jne        0x7f98b83c24f1
03301 41ba16000000                   mov        r10d, 0x16
03307 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
0330c 7412                           je         0x7f98b83c2520
0330e 4983c202                       add        r10, 2
03312 4983fa1a                       cmp        r10, 0x1a
03316 75ef                           jne        0x7f98b83c2507
03318 41ba15000000                   mov        r10d, 0x15
0331e eb11                           jmp        0x7f98b83c2531
03320 50                             push       rax
03321 4833c0                         xor        rax, rax
03324 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
0332a 58                             pop        rax
0332b ebbe                           jmp        0x7f98b83c24eb
0332d 4983c201                       add        r10, 1
03331 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03336 8b5804                         mov        ebx, dword ptr [rax + 4]
03339 48bea8b86eb0987f0000           movabs     rsi, 0x7f98b06eb8a8
03343 488386d800000001               add        qword ptr [rsi + 0xd8], 1
0334b 48bec8a46eb0987f0000           movabs     rsi, 0x7f98b06ea4c8
03355 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03358 83c202                         add        edx, 2
0335b 895670                         mov        dword ptr [rsi + 0x70], edx
0335e 81e2feff1f00                   and        edx, 0x1ffffe
03364 85d2                           test       edx, edx
03366 0f843f180000                   je         0x7f98b83c3dab
0336c 48bec8a46eb0987f0000           movabs     rsi, 0x7f98b06ea4c8
03376 4883860801000001               add        qword ptr [rsi + 0x108], 1
0337e 488bf3                         mov        rsi, rbx
03381 83ee0f                         sub        esi, 0xf
03384 48ba989b6eb0987f0000           movabs     rdx, 0x7f98b06e9b98
0338e 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03391 83c102                         add        ecx, 2
03394 894a70                         mov        dword ptr [rdx + 0x70], ecx
03397 81e1feff1f00                   and        ecx, 0x1ffffe
0339d 85c9                           test       ecx, ecx
0339f 0f8427180000                   je         0x7f98b83c3dcc
033a5 48ba989b6eb0987f0000           movabs     rdx, 0x7f98b06e9b98
033af 488382a800000001               add        qword ptr [rdx + 0xa8], 1
033b7 48ba0000000000000000           movabs     rdx, 0
033c1 ba00000000                     mov        edx, 0
033c6 3bfa                           cmp        edi, edx
033c8 0f8c1f180000                   jl         0x7f98b83c3ded
033ce 3bfe                           cmp        edi, esi
033d0 0f8d24180000                   jge        0x7f98b83c3dfa
033d6 48bec09272e200000000           movabs     rsi, 0xe27292c0
033e0 488bd6                         mov        rdx, rsi
033e3 48b9a8b86eb0987f0000           movabs     rcx, 0x7f98b06eb8a8
033ed 8b12                           mov        edx, dword ptr [rdx]
033ef c1ea0d                         shr        edx, 0xd
033f2 48c1e20a                       shl        rdx, 0xa
033f6 41ba00000080                   mov        r10d, 0x80000000
033fc 4903d2                         add        rdx, r10
033ff 41ba24000000                   mov        r10d, 0x24
03405 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03409 7436                           je         0x7f98b83c2641
0340b 4983c202                       add        r10, 2
0340f 4983fa28                       cmp        r10, 0x28
03413 75f0                           jne        0x7f98b83c2605
03415 41ba24000000                   mov        r10d, 0x24
0341b 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03420 7412                           je         0x7f98b83c2634
03422 4983c202                       add        r10, 2
03426 4983fa28                       cmp        r10, 0x28
0342a 75ef                           jne        0x7f98b83c261b
0342c 41ba23000000                   mov        r10d, 0x23
03432 eb11                           jmp        0x7f98b83c2645
03434 50                             push       rax
03435 4833c0                         xor        rax, rax
03438 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
0343e 58                             pop        rax
0343f ebbe                           jmp        0x7f98b83c25ff
03441 4983c201                       add        r10, 1
03445 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0344a 48ba989c6eb0987f0000           movabs     rdx, 0x7f98b06e9c98
03454 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03457 83c102                         add        ecx, 2
0345a 894a70                         mov        dword ptr [rdx + 0x70], ecx
0345d 81e1feff1f00                   and        ecx, 0x1ffffe
03463 85c9                           test       ecx, ecx
03465 0f849c170000                   je         0x7f98b83c3e07
0346b 48ba989c6eb0987f0000           movabs     rdx, 0x7f98b06e9c98
03475 488382a800000001               add        qword ptr [rdx + 0xa8], 1
0347d 48bec09d6eb0987f0000           movabs     rsi, 0x7f98b06e9dc0
03487 8b5670                         mov        edx, dword ptr [rsi + 0x70]
0348a 83c202                         add        edx, 2
0348d 895670                         mov        dword ptr [rsi + 0x70], edx
03490 81e2feff1f00                   and        edx, 0x1ffffe
03496 85d2                           test       edx, edx
03498 0f848a170000                   je         0x7f98b83c3e28
0349e 48bec09d6eb0987f0000           movabs     rsi, 0x7f98b06e9dc0
034a8 ff86b8000000                   inc        dword ptr [rsi + 0xb8]
034ae 899c240c020000                 mov        dword ptr [rsp + 0x20c], ebx
034b5 48beb81273e200000000           movabs     rsi, 0xe27312b8
034bf 488bd6                         mov        rdx, rsi
034c2 48b9a8b86eb0987f0000           movabs     rcx, 0x7f98b06eb8a8
034cc 48ba0050168000000000           movabs     rdx, 0x80165000
034d6 41ba2a000000                   mov        r10d, 0x2a
034dc 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
034e0 7436                           je         0x7f98b83c2718
034e2 4983c202                       add        r10, 2
034e6 4983fa2e                       cmp        r10, 0x2e
034ea 75f0                           jne        0x7f98b83c26dc
034ec 41ba2a000000                   mov        r10d, 0x2a
034f2 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
034f7 7412                           je         0x7f98b83c270b
034f9 4983c202                       add        r10, 2
034fd 4983fa2e                       cmp        r10, 0x2e
03501 75ef                           jne        0x7f98b83c26f2
03503 41ba29000000                   mov        r10d, 0x29
03509 eb11                           jmp        0x7f98b83c271c
0350b 50                             push       rax
0350c 4833c0                         xor        rax, rax
0350f f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03515 58                             pop        rax
03516 ebbe                           jmp        0x7f98b83c26d6
03518 4983c201                       add        r10, 1
0351c 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03521 48ba70ba6eb0987f0000           movabs     rdx, 0x7f98b06eba70
0352b 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0352e 83c102                         add        ecx, 2
03531 894a70                         mov        dword ptr [rdx + 0x70], ecx
03534 81e1feff1f00                   and        ecx, 0x1ffffe
0353a 85c9                           test       ecx, ecx
0353c 0f8407170000                   je         0x7f98b83c3e49
03542 488bd6                         mov        rdx, rsi
03545 48b970ba6eb0987f0000           movabs     rcx, 0x7f98b06eba70
0354f 488381a800000001               add        qword ptr [rcx + 0xa8], 1
03557 48ba50bb6eb0987f0000           movabs     rdx, 0x7f98b06ebb50
03561 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03564 83c102                         add        ecx, 2
03567 894a70                         mov        dword ptr [rdx + 0x70], ecx
0356a 81e1feff1f00                   and        ecx, 0x1ffffe
03570 85c9                           test       ecx, ecx
03572 0f84f2160000                   je         0x7f98b83c3e6a
03578 48ba50bb6eb0987f0000           movabs     rdx, 0x7f98b06ebb50
03582 48be0050168000000000           movabs     rsi, 0x80165000
0358c 41ba16000000                   mov        r10d, 0x16
03592 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03596 7436                           je         0x7f98b83c27ce
03598 4983c202                       add        r10, 2
0359c 4983fa1a                       cmp        r10, 0x1a
035a0 75f0                           jne        0x7f98b83c2792
035a2 41ba16000000                   mov        r10d, 0x16
035a8 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
035ad 7412                           je         0x7f98b83c27c1
035af 4983c202                       add        r10, 2
035b3 4983fa1a                       cmp        r10, 0x1a
035b7 75ef                           jne        0x7f98b83c27a8
035b9 41ba15000000                   mov        r10d, 0x15
035bf eb11                           jmp        0x7f98b83c27d2
035c1 50                             push       rax
035c2 4833c0                         xor        rax, rax
035c5 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
035cb 58                             pop        rax
035cc ebbe                           jmp        0x7f98b83c278c
035ce 4983c201                       add        r10, 1
035d2 4a8304d201                     add        qword ptr [rdx + r10*8], 1
035d7 48be40a66eb0987f0000           movabs     rsi, 0x7f98b06ea640
035e1 8b5670                         mov        edx, dword ptr [rsi + 0x70]
035e4 83c202                         add        edx, 2
035e7 895670                         mov        dword ptr [rsi + 0x70], edx
035ea 81e2feff1f00                   and        edx, 0x1ffffe
035f0 85d2                           test       edx, edx
035f2 0f8493160000                   je         0x7f98b83c3e8b
035f8 48bec09272e200000000           movabs     rsi, 0xe27292c0
03602 488bd6                         mov        rdx, rsi
03605 48b950bb6eb0987f0000           movabs     rcx, 0x7f98b06ebb50
0360f 8b12                           mov        edx, dword ptr [rdx]
03611 c1ea0d                         shr        edx, 0xd
03614 48c1e20a                       shl        rdx, 0xa
03618 41ba00000080                   mov        r10d, 0x80000000
0361e 4903d2                         add        rdx, r10
03621 41ba1c000000                   mov        r10d, 0x1c
03627 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0362b 7436                           je         0x7f98b83c2863
0362d 4983c202                       add        r10, 2
03631 4983fa20                       cmp        r10, 0x20
03635 75f0                           jne        0x7f98b83c2827
03637 41ba1c000000                   mov        r10d, 0x1c
0363d 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03642 7412                           je         0x7f98b83c2856
03644 4983c202                       add        r10, 2
03648 4983fa20                       cmp        r10, 0x20
0364c 75ef                           jne        0x7f98b83c283d
0364e 41ba1b000000                   mov        r10d, 0x1b
03654 eb11                           jmp        0x7f98b83c2867
03656 50                             push       rax
03657 4833c0                         xor        rax, rax
0365a f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03660 58                             pop        rax
03661 ebbe                           jmp        0x7f98b83c2821
03663 4983c201                       add        r10, 1
03667 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0366c 48ba50bb6eb0987f0000           movabs     rdx, 0x7f98b06ebb50
03676 8b36                           mov        esi, dword ptr [rsi]
03678 c1ee0d                         shr        esi, 0xd
0367b 48c1e60a                       shl        rsi, 0xa
0367f 41ba00000080                   mov        r10d, 0x80000000
03685 4903f2                         add        rsi, r10
03688 41ba22000000                   mov        r10d, 0x22
0368e 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03692 7436                           je         0x7f98b83c28ca
03694 4983c202                       add        r10, 2
03698 4983fa26                       cmp        r10, 0x26
0369c 75f0                           jne        0x7f98b83c288e
0369e 41ba22000000                   mov        r10d, 0x22
036a4 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
036a9 7412                           je         0x7f98b83c28bd
036ab 4983c202                       add        r10, 2
036af 4983fa26                       cmp        r10, 0x26
036b3 75ef                           jne        0x7f98b83c28a4
036b5 41ba21000000                   mov        r10d, 0x21
036bb eb11                           jmp        0x7f98b83c28ce
036bd 50                             push       rax
036be 4833c0                         xor        rax, rax
036c1 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
036c7 58                             pop        rax
036c8 ebbe                           jmp        0x7f98b83c2888
036ca 4983c201                       add        r10, 1
036ce 4a8304d201                     add        qword ptr [rdx + r10*8], 1
036d3 48be50bb6eb0987f0000           movabs     rsi, 0x7f98b06ebb50
036dd 4883863801000001               add        qword ptr [rsi + 0x138], 1
036e5 48be00a76eb0987f0000           movabs     rsi, 0x7f98b06ea700
036ef 8b5670                         mov        edx, dword ptr [rsi + 0x70]
036f2 83c202                         add        edx, 2
036f5 895670                         mov        dword ptr [rsi + 0x70], edx
036f8 81e2feff1f00                   and        edx, 0x1ffffe
036fe 85d2                           test       edx, edx
03700 0f84a6150000                   je         0x7f98b83c3eac
03706 48be50bb6eb0987f0000           movabs     rsi, 0x7f98b06ebb50
03710 4883864801000001               add        qword ptr [rsi + 0x148], 1
03718 4c63df                         movsxd     r11, edi
0371b be08000000                     mov        esi, 8
03720 4d8bcb                         mov        r9, r11
03723 4c03ce                         add        r9, rsi
03726 48be508a6eb0987f0000           movabs     rsi, 0x7f98b06e8a50
03730 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03733 83c202                         add        edx, 2
03736 895670                         mov        dword ptr [rsi + 0x70], edx
03739 81e2feff1f00                   and        edx, 0x1ffffe
0373f 85d2                           test       edx, edx
03741 0f8486150000                   je         0x7f98b83c3ecd
03747 48be508a6eb0987f0000           movabs     rsi, 0x7f98b06e8a50
03751 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03759 48bec88b6eb0987f0000           movabs     rsi, 0x7f98b06e8bc8
03763 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03766 83c202                         add        edx, 2
03769 895670                         mov        dword ptr [rsi + 0x70], edx
0376c 81e2feff1f00                   and        edx, 0x1ffffe
03772 85d2                           test       edx, edx
03774 0f8474150000                   je         0x7f98b83c3eee
0377a 48be50bb6eb0987f0000           movabs     rsi, 0x7f98b06ebb50
03784 488db658010000                 lea        rsi, [rsi + 0x158]
0378b 48ba886b73e200000000           movabs     rdx, 0xe2736b88
03795 48ba00a8168000000000           movabs     rdx, 0x8016a800
0379f 4c8bd2                         mov        r10, rdx
037a2 483316                         xor        rdx, qword ptr [rsi]
037a5 48f7c2fcffffff                 test       rdx, -4
037ac 7426                           je         0x7f98b83c29d4
037ae f6c202                         test       dl, 2
037b1 7521                           jne        0x7f98b83c29d4
037b3 48f706feffffff                 test       qword ptr [rsi], -2
037ba 7415                           je         0x7f98b83c29d1
037bc 498bd2                         mov        rdx, r10
037bf 483316                         xor        rdx, qword ptr [rsi]
037c2 48f7c2fcffffff                 test       rdx, -4
037c9 7409                           je         0x7f98b83c29d4
037cb 48830e02                       or         qword ptr [rsi], 2
037cf eb03                           jmp        0x7f98b83c29d4
037d1 488916                         mov        qword ptr [rsi], rdx
037d4 48be50bb6eb0987f0000           movabs     rsi, 0x7f98b06ebb50
037de 4883866801000001               add        qword ptr [rsi + 0x168], 1
037e6 48be089372e200000000           movabs     rsi, 0xe2729308
037f0 ba02000000                     mov        edx, 2
037f5 b910000000                     mov        ecx, 0x10
037fa 4c8bc0                         mov        r8, rax
037fd bf00000000                     mov        edi, 0
03802 48890424                       mov        qword ptr [rsp], rax
03806 4c895c2408                     mov        qword ptr [rsp + 8], r11
0380b 49bac09272e200000000           movabs     r10, 0xe27292c0
03815 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0381a 49ba886b73e200000000           movabs     r10, 0xe2736b88
03824 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03829 660f1f440000                   nop        word ptr [rax + rax]
0382f e82c8e5307                     call       0x7f98bf8fb860
03834 0f1f84002c390017               nop        dword ptr [rax + rax + 0x1700392c]
0383c 4885c0                         test       rax, rax
0383f 48bb50bb6eb0987f0000           movabs     rbx, 0x7f98b06ebb50
03849 750c                           jne        0x7f98b83c2a57
0384b 808b7101000001                 or         byte ptr [rbx + 0x171], 1
03852 e988000000                     jmp        0x7f98b83c2adf
03857 8b38                           mov        edi, dword ptr [rax]
03859 c1ef0d                         shr        edi, 0xd
0385c 48c1e70a                       shl        rdi, 0xa
03860 41ba00000080                   mov        r10d, 0x80000000
03866 4903fa                         add        rdi, r10
03869 41ba30000000                   mov        r10d, 0x30
0386f 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
03873 7436                           je         0x7f98b83c2aab
03875 4983c202                       add        r10, 2
03879 4983fa34                       cmp        r10, 0x34
0387d 75f0                           jne        0x7f98b83c2a6f
0387f 41ba30000000                   mov        r10d, 0x30
03885 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0388a 7412                           je         0x7f98b83c2a9e
0388c 4983c202                       add        r10, 2
03890 4983fa34                       cmp        r10, 0x34
03894 75ef                           jne        0x7f98b83c2a85
03896 41ba2f000000                   mov        r10d, 0x2f
0389c eb11                           jmp        0x7f98b83c2aaf
0389e 50                             push       rax
0389f 4833c0                         xor        rax, rax
038a2 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
038a8 58                             pop        rax
038a9 ebbe                           jmp        0x7f98b83c2a69
038ab 4983c201                       add        r10, 1
038af 4a8304d301                     add        qword ptr [rbx + r10*8], 1
038b4 48bf00b0148000000000           movabs     rdi, 0x8014b000
038be 8b18                           mov        ebx, dword ptr [rax]
038c0 c1eb0d                         shr        ebx, 0xd
038c3 48c1e30a                       shl        rbx, 0xa
038c7 41ba00000080                   mov        r10d, 0x80000000
038cd 4903da                         add        rbx, r10
038d0 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
038d4 0f8535140000                   jne        0x7f98b83c3f0f
038da e900000000                     jmp        0x7f98b83c2adf
038df 488bf8                         mov        rdi, rax
038e2 4889bc2410020000               mov        qword ptr [rsp + 0x210], rdi
038ea 483b07                         cmp        rax, qword ptr [rdi]
038ed 488bf7                         mov        rsi, rdi
038f0 48bbd8ab70b0987f0000           movabs     rbx, 0x7f98b070abd8
038fa 8b36                           mov        esi, dword ptr [rsi]
038fc c1ee0d                         shr        esi, 0xd
038ff 48c1e60a                       shl        rsi, 0xa
03903 41ba00000080                   mov        r10d, 0x80000000
03909 4903f2                         add        rsi, r10
0390c 41babc000000                   mov        r10d, 0xbc
03912 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03916 743c                           je         0x7f98b83c2b54
03918 4983c202                       add        r10, 2
0391c 4981fac0000000                 cmp        r10, 0xc0
03923 75ed                           jne        0x7f98b83c2b12
03925 41babc000000                   mov        r10d, 0xbc
0392b 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03930 7415                           je         0x7f98b83c2b47
03932 4983c202                       add        r10, 2
03936 4981fac0000000                 cmp        r10, 0xc0
0393d 75ec                           jne        0x7f98b83c2b2b
0393f 41babb000000                   mov        r10d, 0xbb
03945 eb11                           jmp        0x7f98b83c2b58
03947 50                             push       rax
03948 4833c0                         xor        rax, rax
0394b f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
03951 58                             pop        rax
03952 ebb8                           jmp        0x7f98b83c2b0c
03954 4983c201                       add        r10, 1
03958 4a8304d301                     add        qword ptr [rbx + r10*8], 1
0395d 48be18bf6eb0987f0000           movabs     rsi, 0x7f98b06ebf18
03967 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
0396a 83c302                         add        ebx, 2
0396d 895e70                         mov        dword ptr [rsi + 0x70], ebx
03970 81e3feff1f00                   and        ebx, 0x1ffffe
03976 85db                           test       ebx, ebx
03978 0f849f130000                   je         0x7f98b83c3f1d
0397e 488bf7                         mov        rsi, rdi
03981 48bb18bf6eb0987f0000           movabs     rbx, 0x7f98b06ebf18
0398b 8b36                           mov        esi, dword ptr [rsi]
0398d c1ee0d                         shr        esi, 0xd
03990 48c1e60a                       shl        rsi, 0xa
03994 41ba00000080                   mov        r10d, 0x80000000
0399a 4903f2                         add        rsi, r10
0399d 41ba16000000                   mov        r10d, 0x16
039a3 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
039a7 7436                           je         0x7f98b83c2bdf
039a9 4983c202                       add        r10, 2
039ad 4983fa1a                       cmp        r10, 0x1a
039b1 75f0                           jne        0x7f98b83c2ba3
039b3 41ba16000000                   mov        r10d, 0x16
039b9 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
039be 7412                           je         0x7f98b83c2bd2
039c0 4983c202                       add        r10, 2
039c4 4983fa1a                       cmp        r10, 0x1a
039c8 75ef                           jne        0x7f98b83c2bb9
039ca 41ba15000000                   mov        r10d, 0x15
039d0 eb11                           jmp        0x7f98b83c2be3
039d2 50                             push       rax
039d3 4833c0                         xor        rax, rax
039d6 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
039dc 58                             pop        rax
039dd ebbe                           jmp        0x7f98b83c2b9d
039df 4983c201                       add        r10, 1
039e3 4a8304d301                     add        qword ptr [rbx + r10*8], 1
039e8 488bf7                         mov        rsi, rdi
039eb 6690                           nop        
039ed 48b860ca1e8c987f0000           movabs     rax, 0x7f988c1eca60
039f7 e864875307                     call       0x7f98bf8fb360
039fc 0f1f8400f43a0018               nop        dword ptr [rax + rax + 0x18003af4]
03a04 48be18bf6eb0987f0000           movabs     rsi, 0x7f98b06ebf18
03a0e 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03a16 48bec8a46eb0987f0000           movabs     rsi, 0x7f98b06ea4c8
03a20 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
03a23 83c702                         add        edi, 2
03a26 897e70                         mov        dword ptr [rsi + 0x70], edi
03a29 81e7feff1f00                   and        edi, 0x1ffffe
03a2f 85ff                           test       edi, edi
03a31 0f8407130000                   je         0x7f98b83c3f3e
03a37 8b9c240c020000                 mov        ebx, dword ptr [rsp + 0x20c]
03a3e 8bbc24d0010000                 mov        edi, dword ptr [rsp + 0x1d0]
03a45 48bec8a46eb0987f0000           movabs     rsi, 0x7f98b06ea4c8
03a4f 4883860801000001               add        qword ptr [rsi + 0x108], 1
03a57 ffc8                           dec        eax
03a59 2bd8                           sub        ebx, eax
03a5b 48be989b6eb0987f0000           movabs     rsi, 0x7f98b06e9b98
03a65 8b4670                         mov        eax, dword ptr [rsi + 0x70]
03a68 83c002                         add        eax, 2
03a6b 894670                         mov        dword ptr [rsi + 0x70], eax
03a6e 25feff1f00                     and        eax, 0x1ffffe
03a73 85c0                           test       eax, eax
03a75 0f84e4120000                   je         0x7f98b83c3f5f
03a7b 48be989b6eb0987f0000           movabs     rsi, 0x7f98b06e9b98
03a85 488386a800000001               add        qword ptr [rsi + 0xa8], 1
03a8d 48be0000000000000000           movabs     rsi, 0
03a97 be00000000                     mov        esi, 0
03a9c 3bfe                           cmp        edi, esi
03a9e 0f8cdc120000                   jl         0x7f98b83c3f80
03aa4 3bfb                           cmp        edi, ebx
03aa6 0f8de1120000                   jge        0x7f98b83c3f8d
03aac 488bdf                         mov        rbx, rdi
03aaf 899c2418020000                 mov        dword ptr [rsp + 0x218], ebx
03ab6 89bc24d0010000                 mov        dword ptr [rsp + 0x1d0], edi
03abd 488bbc2410020000               mov        rdi, qword ptr [rsp + 0x210]
03ac5 488bf7                         mov        rsi, rdi
03ac8 48b918bf6eb0987f0000           movabs     rcx, 0x7f98b06ebf18
03ad2 8b36                           mov        esi, dword ptr [rsi]
03ad4 c1ee0d                         shr        esi, 0xd
03ad7 48c1e60a                       shl        rsi, 0xa
03adb 41ba00000080                   mov        r10d, 0x80000000
03ae1 4903f2                         add        rsi, r10
03ae4 41ba1e000000                   mov        r10d, 0x1e
03aea 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
03aee 7436                           je         0x7f98b83c2d26
03af0 4983c202                       add        r10, 2
03af4 4983fa22                       cmp        r10, 0x22
03af8 75f0                           jne        0x7f98b83c2cea
03afa 41ba1e000000                   mov        r10d, 0x1e
03b00 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03b05 7412                           je         0x7f98b83c2d19
03b07 4983c202                       add        r10, 2
03b0b 4983fa22                       cmp        r10, 0x22
03b0f 75ef                           jne        0x7f98b83c2d00
03b11 41ba1d000000                   mov        r10d, 0x1d
03b17 eb11                           jmp        0x7f98b83c2d2a
03b19 50                             push       rax
03b1a 4833c0                         xor        rax, rax
03b1d f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
03b23 58                             pop        rax
03b24 ebbe                           jmp        0x7f98b83c2ce4
03b26 4983c201                       add        r10, 1
03b2a 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03b2f 488bf7                         mov        rsi, rdi
03b32 666690                         nop        
03b35 48b888ca1e8c987f0000           movabs     rax, 0x7f988c1eca88
03b3f e81c865307                     call       0x7f98bf8fb360
03b44 0f1f84003c3c0019               nop        dword ptr [rax + rax + 0x19003c3c]
03b4c 483b00                         cmp        rax, qword ptr [rax]
03b4f 488bf0                         mov        rsi, rax
03b52 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
03b5c 8b36                           mov        esi, dword ptr [rsi]
03b5e c1ee0d                         shr        esi, 0xd
03b61 48c1e60a                       shl        rsi, 0xa
03b65 41ba00000080                   mov        r10d, 0x80000000
03b6b 4903f2                         add        rsi, r10
03b6e 41ba24000000                   mov        r10d, 0x24
03b74 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03b78 7436                           je         0x7f98b83c2db0
03b7a 4983c202                       add        r10, 2
03b7e 4983fa28                       cmp        r10, 0x28
03b82 75f0                           jne        0x7f98b83c2d74
03b84 41ba24000000                   mov        r10d, 0x24
03b8a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03b8f 7412                           je         0x7f98b83c2da3
03b91 4983c202                       add        r10, 2
03b95 4983fa28                       cmp        r10, 0x28
03b99 75ef                           jne        0x7f98b83c2d8a
03b9b 41ba23000000                   mov        r10d, 0x23
03ba1 eb11                           jmp        0x7f98b83c2db4
03ba3 50                             push       rax
03ba4 4833c0                         xor        rax, rax
03ba7 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03bad 58                             pop        rax
03bae ebbe                           jmp        0x7f98b83c2d6e
03bb0 4983c201                       add        r10, 1
03bb4 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03bb9 8b7024                         mov        esi, dword ptr [rax + 0x24]
03bbc 488bd0                         mov        rdx, rax
03bbf 48b918bf6eb0987f0000           movabs     rcx, 0x7f98b06ebf18
03bc9 8b12                           mov        edx, dword ptr [rdx]
03bcb c1ea0d                         shr        edx, 0xd
03bce 48c1e20a                       shl        rdx, 0xa
03bd2 41ba00000080                   mov        r10d, 0x80000000
03bd8 4903d2                         add        rdx, r10
03bdb 41ba2a000000                   mov        r10d, 0x2a
03be1 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03be5 7436                           je         0x7f98b83c2e1d
03be7 4983c202                       add        r10, 2
03beb 4983fa2e                       cmp        r10, 0x2e
03bef 75f0                           jne        0x7f98b83c2de1
03bf1 41ba2a000000                   mov        r10d, 0x2a
03bf7 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03bfc 7412                           je         0x7f98b83c2e10
03bfe 4983c202                       add        r10, 2
03c02 4983fa2e                       cmp        r10, 0x2e
03c06 75ef                           jne        0x7f98b83c2df7
03c08 41ba29000000                   mov        r10d, 0x29
03c0e eb11                           jmp        0x7f98b83c2e21
03c10 50                             push       rax
03c11 4833c0                         xor        rax, rax
03c14 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03c1a 58                             pop        rax
03c1b ebbe                           jmp        0x7f98b83c2ddb
03c1d 4983c201                       add        r10, 1
03c21 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03c26 8b4804                         mov        ecx, dword ptr [rax + 4]
03c29 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
03c33 4883827801000001               add        qword ptr [rdx + 0x178], 1
03c3b 48ba00a76eb0987f0000           movabs     rdx, 0x7f98b06ea700
03c45 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03c49 4183c002                       add        r8d, 2
03c4d 44894270                       mov        dword ptr [rdx + 0x70], r8d
03c51 4181e0feff1f00                 and        r8d, 0x1ffffe
03c58 4585c0                         test       r8d, r8d
03c5b 0f843e110000                   je         0x7f98b83c3f9f
03c61 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
03c6b 4883828801000001               add        qword ptr [rdx + 0x188], 1
03c73 8b9c2418020000                 mov        ebx, dword ptr [rsp + 0x218]
03c7a 4863db                         movsxd     rbx, ebx
03c7d ba08000000                     mov        edx, 8
03c82 4c8bcb                         mov        r9, rbx
03c85 4c03ca                         add        r9, rdx
03c88 48ba508a6eb0987f0000           movabs     rdx, 0x7f98b06e8a50
03c92 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03c96 4183c002                       add        r8d, 2
03c9a 44894270                       mov        dword ptr [rdx + 0x70], r8d
03c9e 4181e0feff1f00                 and        r8d, 0x1ffffe
03ca5 4585c0                         test       r8d, r8d
03ca8 0f8412110000                   je         0x7f98b83c3fc0
03cae 48ba508a6eb0987f0000           movabs     rdx, 0x7f98b06e8a50
03cb8 488382d800000001               add        qword ptr [rdx + 0xd8], 1
03cc0 48bac88b6eb0987f0000           movabs     rdx, 0x7f98b06e8bc8
03cca 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03cce 4183c002                       add        r8d, 2
03cd2 44894270                       mov        dword ptr [rdx + 0x70], r8d
03cd6 4181e0feff1f00                 and        r8d, 0x1ffffe
03cdd 4585c0                         test       r8d, r8d
03ce0 0f84fb100000                   je         0x7f98b83c3fe1
03ce6 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
03cf0 488d9298010000                 lea        rdx, [rdx + 0x198]
03cf7 49b8700974e200000000           movabs     r8, 0xe2740970
03d01 49b800b8168000000000           movabs     r8, 0x8016b800
03d0b 4d8bd0                         mov        r10, r8
03d0e 4c3302                         xor        r8, qword ptr [rdx]
03d11 49f7c0fcffffff                 test       r8, -4
03d18 7427                           je         0x7f98b83c2f41
03d1a 41f6c002                       test       r8b, 2
03d1e 7521                           jne        0x7f98b83c2f41
03d20 48f702feffffff                 test       qword ptr [rdx], -2
03d27 7415                           je         0x7f98b83c2f3e
03d29 4d8bc2                         mov        r8, r10
03d2c 4c3302                         xor        r8, qword ptr [rdx]
03d2f 49f7c0fcffffff                 test       r8, -4
03d36 7409                           je         0x7f98b83c2f41
03d38 48830a02                       or         qword ptr [rdx], 2
03d3c eb03                           jmp        0x7f98b83c2f41
03d3e 4c8902                         mov        qword ptr [rdx], r8
03d41 48ba18bf6eb0987f0000           movabs     rdx, 0x7f98b06ebf18
03d4b 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
03d53 ba02000000                     mov        edx, 2
03d58 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
03d60 bf00000000                     mov        edi, 0
03d65 488b842410020000               mov        rax, qword ptr [rsp + 0x210]
03d6d 48890424                       mov        qword ptr [rsp], rax
03d71 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03d79 4889442408                     mov        qword ptr [rsp + 8], rax
03d7e 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
03d83 49ba700974e200000000           movabs     r10, 0xe2740970
03d8d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03d92 0f1f440000                     nop        dword ptr [rax + rax]
03d97 e8c4885307                     call       0x7f98bf8fb860
03d9c 0f1f8400943e001a               nop        dword ptr [rax + rax + 0x1a003e94]
03da4 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
03dab 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
03db3 4103d8                         add        ebx, r8d
03db6 48bed8ab70b0987f0000           movabs     rsi, 0x7f98b070abd8
03dc0 ff8608060000                   inc        dword ptr [rsi + 0x608]
03dc6 8bb424d4010000                 mov        esi, dword ptr [rsp + 0x1d4]
03dcd 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
03dd7 ff8200080000                   inc        dword ptr [rdx + 0x800]
03ddd 488bc3                         mov        rax, rbx
03de0 8b942444010000                 mov        edx, dword ptr [rsp + 0x144]
03de7 ffc2                           inc        edx
03de9 48b9d8ab70b0987f0000           movabs     rcx, 0x7f98b070abd8
03df3 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
03df7 4183c002                       add        r8d, 2
03dfb 44894174                       mov        dword ptr [rcx + 0x74], r8d
03dff 4181e0fe3f0000                 and        r8d, 0x3ffe
03e06 4585c0                         test       r8d, r8d
03e09 0f84f30f0000                   je         0x7f98b83c4002
03e0f 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03e13 418502                         test       dword ptr [r10], eax
03e16 48b9d8ab70b0987f0000           movabs     rcx, 0x7f98b070abd8
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
03e5d e98ec4ffff                     jmp        0x7f98b83bf4f0
03e62 4c8bc8                         mov        r9, rax
03e65 4585c9                         test       r9d, r9d
03e68 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
03e72 b980030000                     mov        ecx, 0x380
03e77 7e05                           jle        0x7f98b83c307e
03e79 b990030000                     mov        ecx, 0x390
03e7e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
03e82 4d8d4001                       lea        r8, [r8 + 1]
03e86 4c89040a                       mov        qword ptr [rdx + rcx], r8
03e8a 0f8e77010000                   jle        0x7f98b83c3207
03e90 488b9c2498010000               mov        rbx, qword ptr [rsp + 0x198]
03e98 482bf3                         sub        rsi, rbx
03e9b ba00000000                     mov        edx, 0
03ea0 483bf2                         cmp        rsi, rdx
03ea3 48bed8ab70b0987f0000           movabs     rsi, 0x7f98b070abd8
03ead baa0030000                     mov        edx, 0x3a0
03eb2 7d05                           jge        0x7f98b83c30b9
03eb4 bab0030000                     mov        edx, 0x3b0
03eb9 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
03ebd 488d4901                       lea        rcx, [rcx + 1]
03ec1 48890c16                       mov        qword ptr [rsi + rdx], rcx
03ec5 0f8d3c010000                   jge        0x7f98b83c3207
03ecb 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
03ed3 488b5630                       mov        rdx, qword ptr [rsi + 0x30]
03ed7 be00000000                     mov        esi, 0
03edc 483bd6                         cmp        rdx, rsi
03edf 48bed8ab70b0987f0000           movabs     rsi, 0x7f98b070abd8
03ee9 bac0030000                     mov        edx, 0x3c0
03eee 7505                           jne        0x7f98b83c30f5
03ef0 bad0030000                     mov        edx, 0x3d0
03ef5 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
03ef9 488d4901                       lea        rcx, [rcx + 1]
03efd 48890c16                       mov        qword ptr [rsi + rdx], rcx
03f01 0f8500010000                   jne        0x7f98b83c3207
03f07 e905010000                     jmp        0x7f98b83c3211
03f0c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
03f14 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03f1c 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
03f24 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
03f2b 488bce                         mov        rcx, rsi
03f2e 8bb42434010000                 mov        esi, dword ptr [rsp + 0x134]
03f35 488bde                         mov        rbx, rsi
03f38 2bd9                           sub        ebx, ecx
03f3a 48bed8ab70b0987f0000           movabs     rsi, 0x7f98b070abd8
03f44 4883864008000001               add        qword ptr [rsi + 0x840], 1
03f4c 488bf2                         mov        rsi, rdx
03f4f 488bd1                         mov        rdx, rcx
03f52 488bc8                         mov        rcx, rax
03f55 4d8bc3                         mov        r8, r11
03f58 4c8bcb                         mov        r9, rbx
03f5b 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
03f63 899c241c020000                 mov        dword ptr [rsp + 0x21c], ebx
03f6a 4885c9                         test       rcx, rcx
03f6d 0f84b00e0000                   je         0x7f98b83c4023
03f73 85d2                           test       edx, edx
03f75 0f8ca80e0000                   jl         0x7f98b83c4023
03f7b 4585c0                         test       r8d, r8d
03f7e 0f8c9f0e0000                   jl         0x7f98b83c4023
03f84 4a8d3c0a                       lea        rdi, [rdx + r9]
03f88 3b7e04                         cmp        edi, dword ptr [rsi + 4]
03f8b 0f87920e0000                   ja         0x7f98b83c4023
03f91 4b8d3c08                       lea        rdi, [r8 + r9]
03f95 3b7904                         cmp        edi, dword ptr [rcx + 4]
03f98 0f87850e0000                   ja         0x7f98b83c4023
03f9e 4585c9                         test       r9d, r9d
03fa1 0f8c7c0e0000                   jl         0x7f98b83c4023
03fa7 4863d2                         movsxd     rdx, edx
03faa 4d63c0                         movsxd     r8, r8d
03fad 488d7c1608                     lea        rdi, [rsi + rdx + 8]
03fb2 4a8d740108                     lea        rsi, [rcx + r8 + 8]
03fb7 498bd1                         mov        rdx, r9
03fba 40f6c40f                       test       spl, 0xf
03fbe 0f8412000000                   je         0x7f98b83c31d6
03fc4 4883ec08                       sub        rsp, 8
03fc8 e8531d5207                     call       0x7f98bf8e4f20
03fcd 4883c408                       add        rsp, 8
03fd1 e905000000                     jmp        0x7f98b83c31db
03fd6 e8451d5207                     call       0x7f98bf8e4f20
03fdb 8b9c241c020000                 mov        ebx, dword ptr [rsp + 0x21c]
03fe2 039c2474010000                 add        ebx, dword ptr [rsp + 0x174]
03fe9 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
03ff1 895e38                         mov        dword ptr [rsi + 0x38], ebx
03ff4 4881c450020000                 add        rsp, 0x250
03ffb 5d                             pop        rbp
03ffc 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
04000 0f872b0e0000                   ja         0x7f98b83c4031
04006 c3                             ret        
04007 bb02000000                     mov        ebx, 2
0400c e915000000                     jmp        0x7f98b83c3226
04011 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
0401b ff82e0030000                   inc        dword ptr [rdx + 0x3e0]
04021 bb08000000                     mov        ebx, 8
04026 899c2428020000                 mov        dword ptr [rsp + 0x228], ebx
0402d 666690                         nop        
04030 e9210e0000                     jmp        0x7f98b83c4056
04035 90                             nop        
04036 90                             nop        
04037 90                             nop        
04038 90                             nop        
04039 90                             nop        
0403a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04041 0f851e0e0000                   jne        0x7f98b83c4065
04047 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
0404e 488d7820                       lea        rdi, [rax + 0x20]
04052 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
04059 0f87060e0000                   ja         0x7f98b83c4065
0405f 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
04066 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0406d 488908                         mov        qword ptr [rax], rcx
04070 4833c9                         xor        rcx, rcx
04073 48894808                       mov        qword ptr [rax + 8], rcx
04077 48894810                       mov        qword ptr [rax + 0x10], rcx
0407b 48894818                       mov        qword ptr [rax + 0x18], rcx
0407f 90                             nop        
04080 e9fc0d0000                     jmp        0x7f98b83c4081
04085 90                             nop        
04086 90                             nop        
04087 90                             nop        
04088 90                             nop        
04089 90                             nop        
0408a 498bf1                         mov        rsi, r9
0408d 4889842420020000               mov        qword ptr [rsp + 0x220], rax
04095 6690                           nop        
04097 e8c4855307                     call       0x7f98bf8fb860
0409c 0f1f84009441001c               nop        dword ptr [rax + rax + 0x1c004194]
040a4 48bad8ab70b0987f0000           movabs     rdx, 0x7f98b070abd8
040ae 488d9208040000                 lea        rdx, [rdx + 0x408]
040b5 4885c0                         test       rax, rax
040b8 750a                           jne        0x7f98b83c32c4
040ba f60201                         test       byte ptr [rdx], 1
040bd 7505                           jne        0x7f98b83c32c4
040bf f048830a01                     lock or    qword ptr [rdx], 1
040c4 488b942420020000               mov        rdx, qword ptr [rsp + 0x220]
040cc 48b9d8ab70b0987f0000           movabs     rcx, 0x7f98b070abd8
040d6 4883811804000001               add        qword ptr [rcx + 0x418], 1
040de 8b942428020000                 mov        edx, dword ptr [rsp + 0x228]
040e5 488bc8                         mov        rcx, rax
040e8 488bb42420020000               mov        rsi, qword ptr [rsp + 0x220]
040f0 0f1f8000000000                 nop        dword ptr [rax]
040f7 e8647b5307                     call       0x7f98bf8fae60
040fc 0f1f8400f441001d               nop        dword ptr [rax + rax + 0x1d0041f4]
04104 488b842420020000               mov        rax, qword ptr [rsp + 0x220]
0410c e9ed0d0000                     jmp        0x7f98b83c40fe
04111 0f1f8000000000                 nop        dword ptr [rax]
04118 e97d0d0000                     jmp        0x7f98b83c409a
0411d 90                             nop        
0411e 90                             nop        
0411f 90                             nop        
04120 90                             nop        
04121 90                             nop        
04122 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04129 0f857a0d0000                   jne        0x7f98b83c40a9
0412f 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
04136 488d7820                       lea        rdi, [rax + 0x20]
0413a 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
04141 0f87620d0000                   ja         0x7f98b83c40a9
04147 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
0414e 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
04155 488908                         mov        qword ptr [rax], rcx
04158 4833c9                         xor        rcx, rcx
0415b 48894808                       mov        qword ptr [rax + 8], rcx
0415f 48894810                       mov        qword ptr [rax + 0x10], rcx
04163 48894818                       mov        qword ptr [rax + 0x18], rcx
04167 488bd0                         mov        rdx, rax
0416a 48b9d8ab70b0987f0000           movabs     rcx, 0x7f98b070abd8
04174 4883815002000001               add        qword ptr [rcx + 0x250], 1
0417c ba02000000                     mov        edx, 2
04181 48b9d06426e200000000           movabs     rcx, 0xe22664d0
0418b 488bf0                         mov        rsi, rax
0418e 4889842430020000               mov        qword ptr [rsp + 0x230], rax
04196 90                             nop        
04197 e8c47a5307                     call       0x7f98bf8fae60
0419c 0f1f84009442001e               nop        dword ptr [rax + rax + 0x1e004294]
041a4 488b842430020000               mov        rax, qword ptr [rsp + 0x230]
041ac e94d0d0000                     jmp        0x7f98b83c40fe
041b1 0f1f8000000000                 nop        dword ptr [rax]
041b8 e9080d0000                     jmp        0x7f98b83c40c5
041bd 90                             nop        
041be 90                             nop        
041bf 90                             nop        
041c0 90                             nop        
041c1 90                             nop        
041c2 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
041c9 0f85050d0000                   jne        0x7f98b83c40d4
041cf 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
041d6 488d7820                       lea        rdi, [rax + 0x20]
041da 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
041e1 0f87ed0c0000                   ja         0x7f98b83c40d4
041e7 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
041ee 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
041f5 488908                         mov        qword ptr [rax], rcx
041f8 4833c9                         xor        rcx, rcx
041fb 48894808                       mov        qword ptr [rax + 8], rcx
041ff 48894810                       mov        qword ptr [rax + 0x10], rcx
04203 48894818                       mov        qword ptr [rax + 0x18], rcx
04207 488bd0                         mov        rdx, rax
0420a 48b9d8ab70b0987f0000           movabs     rcx, 0x7f98b070abd8
04214 4883813801000001               add        qword ptr [rcx + 0x138], 1
0421c ba05000000                     mov        edx, 5
04221 48b9006526e200000000           movabs     rcx, 0xe2266500
0422b 488bf0                         mov        rsi, rax
0422e 4889842438020000               mov        qword ptr [rsp + 0x238], rax
04236 90                             nop        
04237 e8247a5307                     call       0x7f98bf8fae60
0423c 0f1f84003443001f               nop        dword ptr [rax + rax + 0x1f004334]
04244 488b842438020000               mov        rax, qword ptr [rsp + 0x238]
0424c e9ad0c0000                     jmp        0x7f98b83c40fe
04251 49ba38de51b0987f0000           movabs     r10, 0x7f98b051de38
0425b 4c89542408                     mov        qword ptr [rsp + 8], r10
04260 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04268 e8f3f15f07                     call       0x7f98bf9c2660
0426d e91bbeffff                     jmp        0x7f98b83bf28d
04272 49ba58e618b0987f0000           movabs     r10, 0x7f98b018e658
0427c 4c89542408                     mov        qword ptr [rsp + 8], r10
04281 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04289 e8d2f15f07                     call       0x7f98bf9c2660
0428e e984bfffff                     jmp        0x7f98b83bf417
04293 e848925f07                     call       0x7f98bf9bc6e0
04298 e843925f07                     call       0x7f98bf9bc6e0
0429d e83e925f07                     call       0x7f98bf9bc6e0
042a2 48891424                       mov        qword ptr [rsp], rdx
042a6 4c89442408                     mov        qword ptr [rsp + 8], r8
042ab e830895f07                     call       0x7f98bf9bbde0
042b0 e82b925f07                     call       0x7f98bf9bc6e0
042b5 e826925f07                     call       0x7f98bf9bc6e0
042ba 48891424                       mov        qword ptr [rsp], rdx
042be 4c894c2408                     mov        qword ptr [rsp + 8], r9
042c3 e818895f07                     call       0x7f98bf9bbde0
042c8 e813925f07                     call       0x7f98bf9bc6e0
042cd e80e925f07                     call       0x7f98bf9bc6e0
042d2 48c7042401000000               mov        qword ptr [rsp], 1
042da 48895c2408                     mov        qword ptr [rsp + 8], rbx
042df e8fc885f07                     call       0x7f98bf9bbde0
042e4 48c7042402000000               mov        qword ptr [rsp], 2
042ec 48895c2408                     mov        qword ptr [rsp + 8], rbx
042f1 e8ea885f07                     call       0x7f98bf9bbde0
042f6 49ba084f53b0987f0000           movabs     r10, 0x7f98b0534f08
04300 4c89542408                     mov        qword ptr [rsp + 8], r10
04305 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0430d e84ef15f07                     call       0x7f98bf9c2660
04312 e996c4ffff                     jmp        0x7f98b83bf9ad
04317 49ba88326eb0987f0000           movabs     r10, 0x7f98b06e3288
04321 4c89542408                     mov        qword ptr [rsp + 8], r10
04326 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0432e e82df15f07                     call       0x7f98bf9c2660
04333 e919c5ffff                     jmp        0x7f98b83bfa51
04338 49ba88cc16b0987f0000           movabs     r10, 0x7f98b016cc88
04342 4c89542408                     mov        qword ptr [rsp + 8], r10
04347 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0434f e80cf15f07                     call       0x7f98bf9c2660
04354 e942c5ffff                     jmp        0x7f98b83bfa9b
04359 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04361 e87ad25f07                     call       0x7f98bf9c07e0
04366 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0436e e86dd25f07                     call       0x7f98bf9c07e0
04373 49ba680d67b0987f0000           movabs     r10, 0x7f98b0670d68
0437d 4c89542408                     mov        qword ptr [rsp + 8], r10
04382 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0438a e8d1f05f07                     call       0x7f98bf9c2660
0438f e9e0c5ffff                     jmp        0x7f98b83bfb74
04394 49bae87067b0987f0000           movabs     r10, 0x7f98b06770e8
0439e 4c89542408                     mov        qword ptr [rsp + 8], r10
043a3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
043ab e8b0f05f07                     call       0x7f98bf9c2660
043b0 e9f2c5ffff                     jmp        0x7f98b83bfba7
043b5 49ba40006ab0987f0000           movabs     r10, 0x7f98b06a0040
043bf 4c89542408                     mov        qword ptr [rsp + 8], r10
043c4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
043cc e88ff05f07                     call       0x7f98bf9c2660
043d1 e99bc6ffff                     jmp        0x7f98b83bfc71
043d6 49bad06853b0987f0000           movabs     r10, 0x7f98b05368d0
043e0 4c89542408                     mov        qword ptr [rsp + 8], r10
043e5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
043ed e86ef05f07                     call       0x7f98bf9c2660
043f2 e9b1c6ffff                     jmp        0x7f98b83bfca8
043f7 49ba00c669b0987f0000           movabs     r10, 0x7f98b069c600
04401 4c89542408                     mov        qword ptr [rsp + 8], r10
04406 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0440e e84df05f07                     call       0x7f98bf9c2660
04413 e915c7ffff                     jmp        0x7f98b83bfd2d
04418 49ba388153b0987f0000           movabs     r10, 0x7f98b0538138
04422 4c89542408                     mov        qword ptr [rsp + 8], r10
04427 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0442f e82cf05f07                     call       0x7f98bf9c2660
04434 e90fc8ffff                     jmp        0x7f98b83bfe48
04439 49bad07f46b0987f0000           movabs     r10, 0x7f98b0467fd0
04443 4c89542408                     mov        qword ptr [rsp + 8], r10
04448 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04450 e80bf05f07                     call       0x7f98bf9c2660
04455 e92fc8ffff                     jmp        0x7f98b83bfe89
0445a 49baa8563ab0987f0000           movabs     r10, 0x7f98b03a56a8
04464 4c89542408                     mov        qword ptr [rsp + 8], r10
04469 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04471 e8eaef5f07                     call       0x7f98bf9c2660
04476 e941c8ffff                     jmp        0x7f98b83bfebc
0447b 48890424                       mov        qword ptr [rsp], rax
0447f e85cb85f07                     call       0x7f98bf9beee0
04484 e857905f07                     call       0x7f98bf9bc6e0
04489 49ba985c53b0987f0000           movabs     r10, 0x7f98b0535c98
04493 4c89542408                     mov        qword ptr [rsp + 8], r10
04498 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044a0 e8bbef5f07                     call       0x7f98bf9c2660
044a5 e914caffff                     jmp        0x7f98b83c00be
044aa e831905f07                     call       0x7f98bf9bc6e0
044af 49ba88326eb0987f0000           movabs     r10, 0x7f98b06e3288
044b9 4c89542408                     mov        qword ptr [rsp + 8], r10
044be 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044c6 e895ef5f07                     call       0x7f98bf9c2660
044cb e9b2caffff                     jmp        0x7f98b83c0182
044d0 49ba88cc16b0987f0000           movabs     r10, 0x7f98b016cc88
044da 4c89542408                     mov        qword ptr [rsp + 8], r10
044df 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044e7 e874ef5f07                     call       0x7f98bf9c2660
044ec e9cfcaffff                     jmp        0x7f98b83c01c0
044f1 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
044f9 e8e2d05f07                     call       0x7f98bf9c07e0
044fe 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04506 e8d5d05f07                     call       0x7f98bf9c07e0
0450b e8d08f5f07                     call       0x7f98bf9bc6e0
04510 49ba388153b0987f0000           movabs     r10, 0x7f98b0538138
0451a 4c89542408                     mov        qword ptr [rsp + 8], r10
0451f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04527 e834ef5f07                     call       0x7f98bf9c2660
0452c e978ccffff                     jmp        0x7f98b83c03a9
04531 49bad07f46b0987f0000           movabs     r10, 0x7f98b0467fd0
0453b 4c89542408                     mov        qword ptr [rsp + 8], r10
04540 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04548 e813ef5f07                     call       0x7f98bf9c2660
0454d e9a4ccffff                     jmp        0x7f98b83c03f6
04552 49baa8563ab0987f0000           movabs     r10, 0x7f98b03a56a8
0455c 4c89542408                     mov        qword ptr [rsp + 8], r10
04561 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04569 e8f2ee5f07                     call       0x7f98bf9c2660
0456e e9bbccffff                     jmp        0x7f98b83c042e
04573 49ba084f53b0987f0000           movabs     r10, 0x7f98b0534f08
0457d 4c89542408                     mov        qword ptr [rsp + 8], r10
04582 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0458a e8d1ee5f07                     call       0x7f98bf9c2660
0458f e90bceffff                     jmp        0x7f98b83c059f
04594 49ba88326eb0987f0000           movabs     r10, 0x7f98b06e3288
0459e 4c89542408                     mov        qword ptr [rsp + 8], r10
045a3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045ab e8b0ee5f07                     call       0x7f98bf9c2660
045b0 e993ceffff                     jmp        0x7f98b83c0648
045b5 49ba88cc16b0987f0000           movabs     r10, 0x7f98b016cc88
045bf 4c89542408                     mov        qword ptr [rsp + 8], r10
045c4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045cc e88fee5f07                     call       0x7f98bf9c2660
045d1 e9b0ceffff                     jmp        0x7f98b83c0686
045d6 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
045de e8fdcf5f07                     call       0x7f98bf9c07e0
045e3 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
045eb e8f0cf5f07                     call       0x7f98bf9c07e0
045f0 49ba680d67b0987f0000           movabs     r10, 0x7f98b0670d68
045fa 4c89542408                     mov        qword ptr [rsp + 8], r10
045ff 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04607 e854ee5f07                     call       0x7f98bf9c2660
0460c e94ecfffff                     jmp        0x7f98b83c075f
04611 49bae87067b0987f0000           movabs     r10, 0x7f98b06770e8
0461b 4c89542408                     mov        qword ptr [rsp + 8], r10
04620 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04628 e833ee5f07                     call       0x7f98bf9c2660
0462d e965cfffff                     jmp        0x7f98b83c0797
04632 49ba40006ab0987f0000           movabs     r10, 0x7f98b06a0040
0463c 4c89542408                     mov        qword ptr [rsp + 8], r10
04641 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04649 e812ee5f07                     call       0x7f98bf9c2660
0464e e9f1cfffff                     jmp        0x7f98b83c0844
04653 49bad06853b0987f0000           movabs     r10, 0x7f98b05368d0
0465d 4c89542408                     mov        qword ptr [rsp + 8], r10
04662 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0466a e8f1ed5f07                     call       0x7f98bf9c2660
0466f e908d0ffff                     jmp        0x7f98b83c087c
04674 49ba00c669b0987f0000           movabs     r10, 0x7f98b069c600
0467e 4c89542408                     mov        qword ptr [rsp + 8], r10
04683 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0468b e8d0ed5f07                     call       0x7f98bf9c2660
04690 e96cd0ffff                     jmp        0x7f98b83c0901
04695 49ba388153b0987f0000           movabs     r10, 0x7f98b0538138
0469f 4c89542408                     mov        qword ptr [rsp + 8], r10
046a4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046ac e8afed5f07                     call       0x7f98bf9c2660
046b1 e962d1ffff                     jmp        0x7f98b83c0a18
046b6 49bad07f46b0987f0000           movabs     r10, 0x7f98b0467fd0
046c0 4c89542408                     mov        qword ptr [rsp + 8], r10
046c5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046cd e88eed5f07                     call       0x7f98bf9c2660
046d2 e987d1ffff                     jmp        0x7f98b83c0a5e
046d7 49baa8563ab0987f0000           movabs     r10, 0x7f98b03a56a8
046e1 4c89542408                     mov        qword ptr [rsp + 8], r10
046e6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046ee e86ded5f07                     call       0x7f98bf9c2660
046f3 e99ed1ffff                     jmp        0x7f98b83c0a96
046f8 48890424                       mov        qword ptr [rsp], rax
046fc e8dfb55f07                     call       0x7f98bf9beee0
04701 e8da8d5f07                     call       0x7f98bf9bc6e0
04706 49ba985c53b0987f0000           movabs     r10, 0x7f98b0535c98
04710 4c89542408                     mov        qword ptr [rsp + 8], r10
04715 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0471d e83eed5f07                     call       0x7f98bf9c2660
04722 e977d3ffff                     jmp        0x7f98b83c0c9e
04727 e8b48d5f07                     call       0x7f98bf9bc6e0
0472c 49ba88326eb0987f0000           movabs     r10, 0x7f98b06e3288
04736 4c89542408                     mov        qword ptr [rsp + 8], r10
0473b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04743 e818ed5f07                     call       0x7f98bf9c2660
04748 e915d4ffff                     jmp        0x7f98b83c0d62
0474d 49ba88cc16b0987f0000           movabs     r10, 0x7f98b016cc88
04757 4c89542408                     mov        qword ptr [rsp + 8], r10
0475c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04764 e8f7ec5f07                     call       0x7f98bf9c2660
04769 e932d4ffff                     jmp        0x7f98b83c0da0
0476e 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04776 e865ce5f07                     call       0x7f98bf9c07e0
0477b 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04783 e858ce5f07                     call       0x7f98bf9c07e0
04788 e8538d5f07                     call       0x7f98bf9bc6e0
0478d 49ba388153b0987f0000           movabs     r10, 0x7f98b0538138
04797 4c89542408                     mov        qword ptr [rsp + 8], r10
0479c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047a4 e8b7ec5f07                     call       0x7f98bf9c2660
047a9 e9dbd5ffff                     jmp        0x7f98b83c0f89
047ae 49bad07f46b0987f0000           movabs     r10, 0x7f98b0467fd0
047b8 4c89542408                     mov        qword ptr [rsp + 8], r10
047bd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047c5 e896ec5f07                     call       0x7f98bf9c2660
047ca e907d6ffff                     jmp        0x7f98b83c0fd6
047cf 49baa8563ab0987f0000           movabs     r10, 0x7f98b03a56a8
047d9 4c89542408                     mov        qword ptr [rsp + 8], r10
047de 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047e6 e875ec5f07                     call       0x7f98bf9c2660
047eb e91ed6ffff                     jmp        0x7f98b83c100e
047f0 49ba38de51b0987f0000           movabs     r10, 0x7f98b051de38
047fa 4c89542408                     mov        qword ptr [rsp + 8], r10
047ff 48c704240a020000               mov        qword ptr [rsp], 0x20a
04807 e854ec5f07                     call       0x7f98bf9c2660
0480c e914d7ffff                     jmp        0x7f98b83c1125
04811 660f1f440000                   nop        word ptr [rax + rax]
04817 e8447e5307                     call       0x7f98bf8fb860
0481c e9f5d7ffff                     jmp        0x7f98b83c1216
04821 660f1f440000                   nop        word ptr [rax + rax]
04827 e8347e5307                     call       0x7f98bf8fb860
0482c e972d9ffff                     jmp        0x7f98b83c13a3
04831 49bad00552b0987f0000           movabs     r10, 0x7f98b05205d0
0483b 4c89542408                     mov        qword ptr [rsp + 8], r10
04840 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04848 e813ec5f07                     call       0x7f98bf9c2660
0484d e9d0d9ffff                     jmp        0x7f98b83c1422
04852 49b80000000000000000           movabs     r8, 0
0485c b8000f050a                     mov        eax, 0xa050f00
04861 e8fae25f07                     call       0x7f98bf9c1d60
04866 e9bdd9ffff                     jmp        0x7f98b83c1428
0486b 49ba38de51b0987f0000           movabs     r10, 0x7f98b051de38
04875 4c89542408                     mov        qword ptr [rsp + 8], r10
0487a 48c70424aa020000               mov        qword ptr [rsp], 0x2aa
04882 e8d9eb5f07                     call       0x7f98bf9c2660
04887 e9e0daffff                     jmp        0x7f98b83c156c
0488c 49ba084f53b0987f0000           movabs     r10, 0x7f98b0534f08
04896 4c89542408                     mov        qword ptr [rsp + 8], r10
0489b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048a3 e8b8eb5f07                     call       0x7f98bf9c2660
048a8 e9b5dbffff                     jmp        0x7f98b83c1662
048ad e82e8c5f07                     call       0x7f98bf9bc6e0
048b2 49ba88326eb0987f0000           movabs     r10, 0x7f98b06e3288
048bc 4c89542408                     mov        qword ptr [rsp + 8], r10
048c1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048c9 e892eb5f07                     call       0x7f98bf9c2660
048ce e937dcffff                     jmp        0x7f98b83c170a
048d3 49ba88cc16b0987f0000           movabs     r10, 0x7f98b016cc88
048dd 4c89542408                     mov        qword ptr [rsp + 8], r10
048e2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048ea e871eb5f07                     call       0x7f98bf9c2660
048ef e94fdcffff                     jmp        0x7f98b83c1743
048f4 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
048fc e8dfcc5f07                     call       0x7f98bf9c07e0
04901 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04909 e8d2cc5f07                     call       0x7f98bf9c07e0
0490e 49ba680d67b0987f0000           movabs     r10, 0x7f98b0670d68
04918 4c89542408                     mov        qword ptr [rsp + 8], r10
0491d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04925 e836eb5f07                     call       0x7f98bf9c2660
0492a e9e2dcffff                     jmp        0x7f98b83c1811
0492f 49bae87067b0987f0000           movabs     r10, 0x7f98b06770e8
04939 4c89542408                     mov        qword ptr [rsp + 8], r10
0493e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04946 e815eb5f07                     call       0x7f98bf9c2660
0494b e9f4dcffff                     jmp        0x7f98b83c1844
04950 49ba40006ab0987f0000           movabs     r10, 0x7f98b06a0040
0495a 4c89542408                     mov        qword ptr [rsp + 8], r10
0495f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04967 e8f4ea5f07                     call       0x7f98bf9c2660
0496c e984ddffff                     jmp        0x7f98b83c18f5
04971 49bad06853b0987f0000           movabs     r10, 0x7f98b05368d0
0497b 4c89542408                     mov        qword ptr [rsp + 8], r10
04980 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04988 e8d3ea5f07                     call       0x7f98bf9c2660
0498d e99eddffff                     jmp        0x7f98b83c1930
04992 49ba00c669b0987f0000           movabs     r10, 0x7f98b069c600
0499c 4c89542408                     mov        qword ptr [rsp + 8], r10
049a1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049a9 e8b2ea5f07                     call       0x7f98bf9c2660
049ae e9fdddffff                     jmp        0x7f98b83c19b0
049b3 49ba388153b0987f0000           movabs     r10, 0x7f98b0538138
049bd 4c89542408                     mov        qword ptr [rsp + 8], r10
049c2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049ca e891ea5f07                     call       0x7f98bf9c2660
049cf e9eadeffff                     jmp        0x7f98b83c1abe
049d4 49bad07f46b0987f0000           movabs     r10, 0x7f98b0467fd0
049de 4c89542408                     mov        qword ptr [rsp + 8], r10
049e3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049eb e870ea5f07                     call       0x7f98bf9c2660
049f0 e90adfffff                     jmp        0x7f98b83c1aff
049f5 49baa8563ab0987f0000           movabs     r10, 0x7f98b03a56a8
049ff 4c89542408                     mov        qword ptr [rsp + 8], r10
04a04 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a0c e84fea5f07                     call       0x7f98bf9c2660
04a11 e91cdfffff                     jmp        0x7f98b83c1b32
04a16 48890424                       mov        qword ptr [rsp], rax
04a1a e8c1b25f07                     call       0x7f98bf9beee0
04a1f e8bc8a5f07                     call       0x7f98bf9bc6e0
04a24 49ba985c53b0987f0000           movabs     r10, 0x7f98b0535c98
04a2e 4c89542408                     mov        qword ptr [rsp + 8], r10
04a33 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a3b e820ea5f07                     call       0x7f98bf9c2660
04a40 e9f1e0ffff                     jmp        0x7f98b83c1d36
04a45 49ba88326eb0987f0000           movabs     r10, 0x7f98b06e3288
04a4f 4c89542408                     mov        qword ptr [rsp + 8], r10
04a54 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a5c e8ffe95f07                     call       0x7f98bf9c2660
04a61 e989e1ffff                     jmp        0x7f98b83c1def
04a66 49ba88cc16b0987f0000           movabs     r10, 0x7f98b016cc88
04a70 4c89542408                     mov        qword ptr [rsp + 8], r10
04a75 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a7d e8dee95f07                     call       0x7f98bf9c2660
04a82 e9afe1ffff                     jmp        0x7f98b83c1e36
04a87 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04a8f e84ccb5f07                     call       0x7f98bf9c07e0
04a94 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04a9c e83fcb5f07                     call       0x7f98bf9c07e0
04aa1 e83a8a5f07                     call       0x7f98bf9bc6e0
04aa6 49ba388153b0987f0000           movabs     r10, 0x7f98b0538138
04ab0 4c89542408                     mov        qword ptr [rsp + 8], r10
04ab5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04abd e89ee95f07                     call       0x7f98bf9c2660
04ac2 e95ae3ffff                     jmp        0x7f98b83c2021
04ac7 49bad07f46b0987f0000           movabs     r10, 0x7f98b0467fd0
04ad1 4c89542408                     mov        qword ptr [rsp + 8], r10
04ad6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ade e87de95f07                     call       0x7f98bf9c2660
04ae3 e986e3ffff                     jmp        0x7f98b83c206e
04ae8 49baa8563ab0987f0000           movabs     r10, 0x7f98b03a56a8
04af2 4c89542408                     mov        qword ptr [rsp + 8], r10
04af7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04aff e85ce95f07                     call       0x7f98bf9c2660
04b04 e99de3ffff                     jmp        0x7f98b83c20a6
04b09 49ba38de51b0987f0000           movabs     r10, 0x7f98b051de38
04b13 4c89542408                     mov        qword ptr [rsp + 8], r10
04b18 48c70424e8020000               mov        qword ptr [rsp], 0x2e8
04b20 e83be95f07                     call       0x7f98bf9c2660
04b25 e990e4ffff                     jmp        0x7f98b83c21ba
04b2a 49bad00552b0987f0000           movabs     r10, 0x7f98b05205d0
04b34 4c89542408                     mov        qword ptr [rsp + 8], r10
04b39 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b41 e81ae95f07                     call       0x7f98bf9c2660
04b46 e94fe5ffff                     jmp        0x7f98b83c229a
04b4b 49b80000000000000000           movabs     r8, 0
04b55 b8000f050a                     mov        eax, 0xa050f00
04b5a e801e05f07                     call       0x7f98bf9c1d60
04b5f e93ce5ffff                     jmp        0x7f98b83c22a0
04b64 49ba38de51b0987f0000           movabs     r10, 0x7f98b051de38
04b6e 4c89542408                     mov        qword ptr [rsp + 8], r10
04b73 48c7042420030000               mov        qword ptr [rsp], 0x320
04b7b e8e0e85f07                     call       0x7f98bf9c2660
04b80 e95fe6ffff                     jmp        0x7f98b83c23e4
04b85 49ba084f53b0987f0000           movabs     r10, 0x7f98b0534f08
04b8f 4c89542408                     mov        qword ptr [rsp + 8], r10
04b94 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b9c e8bfe85f07                     call       0x7f98bf9c2660
04ba1 e91fe7ffff                     jmp        0x7f98b83c24c5
04ba6 e835895f07                     call       0x7f98bf9bc6e0
04bab 49ba88326eb0987f0000           movabs     r10, 0x7f98b06e3288
04bb5 4c89542408                     mov        qword ptr [rsp + 8], r10
04bba 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bc2 e899e85f07                     call       0x7f98bf9c2660
04bc7 e9a0e7ffff                     jmp        0x7f98b83c256c
04bcc 49ba88cc16b0987f0000           movabs     r10, 0x7f98b016cc88
04bd6 4c89542408                     mov        qword ptr [rsp + 8], r10
04bdb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04be3 e878e85f07                     call       0x7f98bf9c2660
04be8 e9b8e7ffff                     jmp        0x7f98b83c25a5
04bed 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04bf5 e8e6c95f07                     call       0x7f98bf9c07e0
04bfa 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04c02 e8d9c95f07                     call       0x7f98bf9c07e0
04c07 49ba680d67b0987f0000           movabs     r10, 0x7f98b0670d68
04c11 4c89542408                     mov        qword ptr [rsp + 8], r10
04c16 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c1e e83de85f07                     call       0x7f98bf9c2660
04c23 e943e8ffff                     jmp        0x7f98b83c266b
04c28 49bae87067b0987f0000           movabs     r10, 0x7f98b06770e8
04c32 4c89542408                     mov        qword ptr [rsp + 8], r10
04c37 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c3f e81ce85f07                     call       0x7f98bf9c2660
04c44 e955e8ffff                     jmp        0x7f98b83c269e
04c49 49ba40006ab0987f0000           movabs     r10, 0x7f98b06a0040
04c53 4c89542408                     mov        qword ptr [rsp + 8], r10
04c58 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c60 e8fbe75f07                     call       0x7f98bf9c2660
04c65 e9d8e8ffff                     jmp        0x7f98b83c2742
04c6a 49bad06853b0987f0000           movabs     r10, 0x7f98b05368d0
04c74 4c89542408                     mov        qword ptr [rsp + 8], r10
04c79 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c81 e8dae75f07                     call       0x7f98bf9c2660
04c86 e9ede8ffff                     jmp        0x7f98b83c2778
04c8b 49ba00c669b0987f0000           movabs     r10, 0x7f98b069c600
04c95 4c89542408                     mov        qword ptr [rsp + 8], r10
04c9a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ca2 e8b9e75f07                     call       0x7f98bf9c2660
04ca7 e94ce9ffff                     jmp        0x7f98b83c27f8
04cac 49ba388153b0987f0000           movabs     r10, 0x7f98b0538138
04cb6 4c89542408                     mov        qword ptr [rsp + 8], r10
04cbb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cc3 e898e75f07                     call       0x7f98bf9c2660
04cc8 e939eaffff                     jmp        0x7f98b83c2906
04ccd 49bad07f46b0987f0000           movabs     r10, 0x7f98b0467fd0
04cd7 4c89542408                     mov        qword ptr [rsp + 8], r10
04cdc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ce4 e877e75f07                     call       0x7f98bf9c2660
04ce9 e959eaffff                     jmp        0x7f98b83c2947
04cee 49baa8563ab0987f0000           movabs     r10, 0x7f98b03a56a8
04cf8 4c89542408                     mov        qword ptr [rsp + 8], r10
04cfd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d05 e856e75f07                     call       0x7f98bf9c2660
04d0a e96beaffff                     jmp        0x7f98b83c297a
04d0f 48890424                       mov        qword ptr [rsp], rax
04d13 e8c8af5f07                     call       0x7f98bf9beee0
04d18 e8c3875f07                     call       0x7f98bf9bc6e0
04d1d 49ba985c53b0987f0000           movabs     r10, 0x7f98b0535c98
04d27 4c89542408                     mov        qword ptr [rsp + 8], r10
04d2c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d34 e827e75f07                     call       0x7f98bf9c2660
04d39 e940ecffff                     jmp        0x7f98b83c2b7e
04d3e 49ba88326eb0987f0000           movabs     r10, 0x7f98b06e3288
04d48 4c89542408                     mov        qword ptr [rsp + 8], r10
04d4d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d55 e806e75f07                     call       0x7f98bf9c2660
04d5a e9d8ecffff                     jmp        0x7f98b83c2c37
04d5f 49ba88cc16b0987f0000           movabs     r10, 0x7f98b016cc88
04d69 4c89542408                     mov        qword ptr [rsp + 8], r10
04d6e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d76 e8e5e65f07                     call       0x7f98bf9c2660
04d7b e9fbecffff                     jmp        0x7f98b83c2c7b
04d80 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04d88 e853c85f07                     call       0x7f98bf9c07e0
04d8d 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04d95 e846c85f07                     call       0x7f98bf9c07e0
04d9a e841875f07                     call       0x7f98bf9bc6e0
04d9f 49ba388153b0987f0000           movabs     r10, 0x7f98b0538138
04da9 4c89542408                     mov        qword ptr [rsp + 8], r10
04dae 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04db6 e8a5e65f07                     call       0x7f98bf9c2660
04dbb e9a1eeffff                     jmp        0x7f98b83c2e61
04dc0 49bad07f46b0987f0000           movabs     r10, 0x7f98b0467fd0
04dca 4c89542408                     mov        qword ptr [rsp + 8], r10
04dcf 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04dd7 e884e65f07                     call       0x7f98bf9c2660
04ddc e9cdeeffff                     jmp        0x7f98b83c2eae
04de1 49baa8563ab0987f0000           movabs     r10, 0x7f98b03a56a8
04deb 4c89542408                     mov        qword ptr [rsp + 8], r10
04df0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04df8 e863e65f07                     call       0x7f98bf9c2660
04dfd e9e4eeffff                     jmp        0x7f98b83c2ee6
04e02 49ba38de51b0987f0000           movabs     r10, 0x7f98b051de38
04e0c 4c89542408                     mov        qword ptr [rsp + 8], r10
04e11 48c704245a030000               mov        qword ptr [rsp], 0x35a
04e19 e842e65f07                     call       0x7f98bf9c2660
04e1e e9ecefffff                     jmp        0x7f98b83c300f
04e23 0f1f4000                       nop        dword ptr [rax]
04e27 e834785307                     call       0x7f98bf8fb860
04e2c e9aaf1ffff                     jmp        0x7f98b83c31db
04e31 49bafc313cb8987f0000           movabs     r10, 0x7f98b83c31fc
04e3b 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
04e42 e9999e5307                     jmp        0x7f98bf8fdee0
04e47 48ba0000000000000000           movabs     rdx, 0
04e51 b8000f050a                     mov        eax, 0xa050f00
04e56 e805d15f07                     call       0x7f98bf9c1160
04e5b e9d0f1ffff                     jmp        0x7f98b83c3230
04e60 e87b865f07                     call       0x7f98bf9bc6e0
04e65 488bd2                         mov        rdx, rdx
04e68 e8f3935f07                     call       0x7f98bf9bd460
04e6d e90df2ffff                     jmp        0x7f98b83c327f
04e72 48ba0000000000000000           movabs     rdx, 0
04e7c b8000f050a                     mov        eax, 0xa050f00
04e81 e8dadc5f07                     call       0x7f98bf9c1d60
04e86 e9f5f1ffff                     jmp        0x7f98b83c3280
04e8b 48ba0000000000000000           movabs     rdx, 0
04e95 b8000f050a                     mov        eax, 0xa050f00
04e9a e8c1d05f07                     call       0x7f98bf9c1160
04e9f e974f2ffff                     jmp        0x7f98b83c3318
04ea4 e837865f07                     call       0x7f98bf9bc6e0
04ea9 488bd2                         mov        rdx, rdx
04eac e8af935f07                     call       0x7f98bf9bd460
04eb1 e9b1f2ffff                     jmp        0x7f98b83c3367
04eb6 48ba0000000000000000           movabs     rdx, 0
04ec0 b8000f050a                     mov        eax, 0xa050f00
04ec5 e896d05f07                     call       0x7f98bf9c1160
04eca e9e9f2ffff                     jmp        0x7f98b83c33b8
04ecf e80c865f07                     call       0x7f98bf9bc6e0
04ed4 488bd2                         mov        rdx, rdx
04ed7 e884935f07                     call       0x7f98bf9bd460
04edc e926f3ffff                     jmp        0x7f98b83c3407
04ee1 498b8778050000                 mov        rax, qword ptr [r15 + 0x578]
04ee8 49c7877805000000000000         mov        qword ptr [r15 + 0x578], 0
04ef3 49c7878005000000000000         mov        qword ptr [r15 + 0x580], 0
04efe 4881c450020000                 add        rsp, 0x250
04f05 5d                             pop        rbp
04f06 e9d5765f07                     jmp        0x7f98bf9bb7e0
04f0b f4                             hlt        
04f0c f4                             hlt        
04f0d f4                             hlt        
04f0e f4                             hlt        
04f0f f4                             hlt        
