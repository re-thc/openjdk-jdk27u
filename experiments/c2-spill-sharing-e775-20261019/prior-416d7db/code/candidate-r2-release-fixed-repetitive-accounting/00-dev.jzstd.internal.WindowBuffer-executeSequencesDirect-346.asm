00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c0755207                   jne        0x7fea6f90f960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecd0030000                 sub        rsp, 0x3d0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 7405                           je         0x7fea683e83bf
0003a e8e1765107                     call       0x7fea6f8ffaa0
0003f 898c2420010000                 mov        dword ptr [rsp + 0x120], ecx
00046 4c89842428010000               mov        qword ptr [rsp + 0x128], r8
0004e 4c898c2430010000               mov        qword ptr [rsp + 0x130], r9
00056 89bc2424010000                 mov        dword ptr [rsp + 0x124], edi
0005d 48bb00407260ea7f0000           movabs     rbx, 0x7fea60724000
00067 8b4370                         mov        eax, dword ptr [rbx + 0x70]
0006a 83c002                         add        eax, 2
0006d 894370                         mov        dword ptr [rbx + 0x70], eax
00070 25fe070000                     and        eax, 0x7fe
00075 85c0                           test       eax, eax
00077 0f8473480000                   je         0x7fea683ecc70
0007d 48bb00407260ea7f0000           movabs     rbx, 0x7fea60724000
00087 ff83a8000000                   inc        dword ptr [rbx + 0xa8]
0008d 8b9c24e0030000                 mov        ebx, dword ptr [rsp + 0x3e0]
00094 8b4644                         mov        eax, dword ptr [rsi + 0x44]
00097 448b5e3c                       mov        r11d, dword ptr [rsi + 0x3c]
0009b 448b6e38                       mov        r13d, dword ptr [rsi + 0x38]
0009f 4c8b7608                       mov        r14, qword ptr [rsi + 8]
000a3 488b4e10                       mov        rcx, qword ptr [rsi + 0x10]
000a7 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000ab 4d63cb                         movsxd     r9, r11d
000ae 4d03ce                         add        r9, r14
000b1 498bfd                         mov        rdi, r13
000b4 412bfb                         sub        edi, r11d
000b7 3bdf                           cmp        ebx, edi
000b9 48bf00407260ea7f0000           movabs     rdi, 0x7fea60724000
000c3 4889842438010000               mov        qword ptr [rsp + 0x138], rax
000cb b8f8000000                     mov        eax, 0xf8
000d0 7f05                           jg         0x7fea683e8457
000d2 b808010000                     mov        eax, 0x108
000d7 44899c2440010000               mov        dword ptr [rsp + 0x140], r11d
000df 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
000e3 4d8d5b01                       lea        r11, [r11 + 1]
000e7 4c891c07                       mov        qword ptr [rdi + rax], r11
000eb 0f8f68440000                   jg         0x7fea683ec8d9
000f1 4863db                         movsxd     rbx, ebx
000f4 488b7e20                       mov        rdi, qword ptr [rsi + 0x20]
000f8 492bf9                         sub        rdi, r9
000fb 483bfb                         cmp        rdi, rbx
000fe 48bf00407260ea7f0000           movabs     rdi, 0x7fea60724000
00108 b828010000                     mov        eax, 0x128
0010d 7c05                           jl         0x7fea683e8494
0010f b818010000                     mov        eax, 0x118
00114 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
00118 4d8d5b01                       lea        r11, [r11 + 1]
0011c 4c891c07                       mov        qword ptr [rdi + rax], r11
00120 0f8c33440000                   jl         0x7fea683ec8d9
00126 48bf00407260ea7f0000           movabs     rdi, 0x7fea60724000
00130 ff8758010000                   inc        dword ptr [rdi + 0x158]
00136 498bf8                         mov        rdi, r8
00139 4883ff00                       cmp        rdi, 0
0013d 48bf00407260ea7f0000           movabs     rdi, 0x7fea60724000
00147 b868010000                     mov        eax, 0x168
0014c 7505                           jne        0x7fea683e84d3
0014e b878010000                     mov        eax, 0x178
00153 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
00157 4d8d5b01                       lea        r11, [r11 + 1]
0015b 4c891c07                       mov        qword ptr [rdi + rax], r11
0015f 0f8531000000                   jne        0x7fea683e8516
00165 4903d9                         add        rbx, r9
00168 488bf9                         mov        rdi, rcx
0016b 483bfb                         cmp        rdi, rbx
0016e 48bf00407260ea7f0000           movabs     rdi, 0x7fea60724000
00178 bb98010000                     mov        ebx, 0x198
0017d 7d05                           jge        0x7fea683e8504
0017f bb88010000                     mov        ebx, 0x188
00184 488b041f                       mov        rax, qword ptr [rdi + rbx]
00188 488d4001                       lea        rax, [rax + 1]
0018c 4889041f                       mov        qword ptr [rdi + rbx], rax
00190 0f8d0a000000                   jge        0x7fea683e8520
00196 bf00000000                     mov        edi, 0
0019b e915000000                     jmp        0x7fea683e8535
001a0 48bf00407260ea7f0000           movabs     rdi, 0x7fea60724000
001aa ff87a8010000                   inc        dword ptr [rdi + 0x1a8]
001b0 bf01000000                     mov        edi, 1
001b5 4d2bc6                         sub        r8, r14
001b8 48bb00407260ea7f0000           movabs     rbx, 0x7fea60724000
001c2 488383c001000001               add        qword ptr [rbx + 0x1c0], 1
001ca 48bb583f7960ea7f0000           movabs     rbx, 0x7fea60793f58
001d4 8b4370                         mov        eax, dword ptr [rbx + 0x70]
001d7 83c002                         add        eax, 2
001da 894370                         mov        dword ptr [rbx + 0x70], eax
001dd 25feff1f00                     and        eax, 0x1ffffe
001e2 85c0                           test       eax, eax
001e4 0f8427470000                   je         0x7fea683ecc91
001ea 48bbffffffffffffff7f           movabs     rbx, 0x7fffffffffffffff
001f4 483bd9                         cmp        rbx, rcx
001f7 48bb583f7960ea7f0000           movabs     rbx, 0x7fea60793f58
00201 b8b8000000                     mov        eax, 0xb8
00206 7d05                           jge        0x7fea683e858d
00208 b8a8000000                     mov        eax, 0xa8
0020d 4c8b0c03                       mov        r9, qword ptr [rbx + rax]
00211 4d8d4901                       lea        r9, [r9 + 1]
00215 4c890c03                       mov        qword ptr [rbx + rax], r9
00219 0f8d0f000000                   jge        0x7fea683e85ae
0021f 48b9ffffffffffffff7f           movabs     rcx, 0x7fffffffffffffff
00229 e910000000                     jmp        0x7fea683e85be
0022e 48bb583f7960ea7f0000           movabs     rbx, 0x7fea60793f58
00238 ff83c8000000                   inc        dword ptr [rbx + 0xc8]
0023e 448b9c2440010000               mov        r11d, dword ptr [rsp + 0x140]
00246 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0024e 488b9c24e8030000               mov        rbx, qword ptr [rsp + 0x3e8]
00256 4889b42448010000               mov        qword ptr [rsp + 0x148], rsi
0025e 498bf5                         mov        rsi, r13
00261 83ee20                         sub        esi, 0x20
00264 448b4a08                       mov        r9d, dword ptr [rdx + 8]
00268 4183e920                       sub        r9d, 0x20
0026c 48899c2450010000               mov        qword ptr [rsp + 0x150], rbx
00274 8b9c2424010000                 mov        ebx, dword ptr [rsp + 0x124]
0027b 899c2444010000                 mov        dword ptr [rsp + 0x144], ebx
00282 488b9c2430010000               mov        rbx, qword ptr [rsp + 0x130]
0028a 48899c2458010000               mov        qword ptr [rsp + 0x158], rbx
00292 488b9c2428010000               mov        rbx, qword ptr [rsp + 0x128]
0029a 48899c2460010000               mov        qword ptr [rsp + 0x160], rbx
002a2 8b9c2420010000                 mov        ebx, dword ptr [rsp + 0x120]
002a9 899c2468010000                 mov        dword ptr [rsp + 0x168], ebx
002b0 488b9c2448010000               mov        rbx, qword ptr [rsp + 0x148]
002b8 89b4246c010000                 mov        dword ptr [rsp + 0x16c], esi
002bf be00000000                     mov        esi, 0
002c4 89b42470010000                 mov        dword ptr [rsp + 0x170], esi
002cb be00000000                     mov        esi, 0
002d0 44898c2474010000               mov        dword ptr [rsp + 0x174], r9d
002d8 48898c2478010000               mov        qword ptr [rsp + 0x178], rcx
002e0 4c898424a8010000               mov        qword ptr [rsp + 0x1a8], r8
002e8 89bc24a0010000                 mov        dword ptr [rsp + 0x1a0], edi
002ef 4c89b424b0010000               mov        qword ptr [rsp + 0x1b0], r14
002f7 4489ac2488010000               mov        dword ptr [rsp + 0x188], r13d
002ff 44899c248c010000               mov        dword ptr [rsp + 0x18c], r11d
00307 4889842480010000               mov        qword ptr [rsp + 0x180], rax
0030f 4c8b8c2450010000               mov        r9, qword ptr [rsp + 0x150]
00317 488b842458010000               mov        rax, qword ptr [rsp + 0x158]
0031f 488bbc2460010000               mov        rdi, qword ptr [rsp + 0x160]
00327 448b842468010000               mov        r8d, dword ptr [rsp + 0x168]
0032f 4889942490010000               mov        qword ptr [rsp + 0x190], rdx
00337 48899c2498010000               mov        qword ptr [rsp + 0x198], rbx
0033f 8b942470010000                 mov        edx, dword ptr [rsp + 0x170]
00346 8b9c2444010000                 mov        ebx, dword ptr [rsp + 0x144]
0034d 666690                         nop        
00350 3bd3                           cmp        edx, ebx
00352 899c2444010000                 mov        dword ptr [rsp + 0x144], ebx
00359 48bb00407260ea7f0000           movabs     rbx, 0x7fea60724000
00363 41bbd0010000                   mov        r11d, 0x1d0
00369 7d06                           jge        0x7fea683e86f1
0036b 41bbe0010000                   mov        r11d, 0x1e0
00371 4e8b2c1b                       mov        r13, qword ptr [rbx + r11]
00375 4d8d6d01                       lea        r13, [r13 + 1]
00379 4e892c1b                       mov        qword ptr [rbx + r11], r13
0037d 0f8d403f0000                   jge        0x7fea683ec643
00383 3b5708                         cmp        edx, dword ptr [rdi + 8]
00386 0f83b5450000                   jae        0x7fea683eccc1
0038c 4863ca                         movsxd     rcx, edx
0038f 4c8b5ccf10                     mov        r11, qword ptr [rdi + rcx*8 + 0x10]
00394 418bcb                         mov        ecx, r11d
00397 81e1ffff0100                   and        ecx, 0x1ffff
0039d 898c24b8010000                 mov        dword ptr [rsp + 0x1b8], ecx
003a4 4c8be9                         mov        r13, rcx
003a7 b912000000                     mov        ecx, 0x12
003ac 4889bc2460010000               mov        qword ptr [rsp + 0x160], rdi
003b4 498bfb                         mov        rdi, r11
003b7 48d3ef                         shr        rdi, cl
003ba 8bff                           mov        edi, edi
003bc 81e7ffff0300                   and        edi, 0x3ffff
003c2 89bc24a4010000                 mov        dword ptr [rsp + 0x1a4], edi
003c9 b924000000                     mov        ecx, 0x24
003ce 49d3fb                         sar        r11, cl
003d1 458bdb                         mov        r11d, r11d
003d4 4585db                         test       r11d, r11d
003d7 48b900407260ea7f0000           movabs     rcx, 0x7fea60724000
003e1 bff0010000                     mov        edi, 0x1f0
003e6 7d05                           jge        0x7fea683e876d
003e8 bf00020000                     mov        edi, 0x200
003ed 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
003f1 488d5b01                       lea        rbx, [rbx + 1]
003f5 48891c39                       mov        qword ptr [rcx + rdi], rbx
003f9 0f8d13000000                   jge        0x7fea683e8792
003ff 3b5008                         cmp        edx, dword ptr [rax + 8]
00402 0f8351450000                   jae        0x7fea683eccd9
00408 4863ca                         movsxd     rcx, edx
0040b 8b4c880c                       mov        ecx, dword ptr [rax + rcx*4 + 0xc]
0040f 4c8bd9                         mov        r11, rcx
00412 4585ed                         test       r13d, r13d
00415 48b900407260ea7f0000           movabs     rcx, 0x7fea60724000
0041f bf10020000                     mov        edi, 0x210
00424 7405                           je         0x7fea683e87ab
00426 bf20020000                     mov        edi, 0x220
0042b 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
0042f 488d5b01                       lea        rbx, [rbx + 1]
00433 48891c39                       mov        qword ptr [rcx + rdi], rbx
00437 0f8430000000                   je         0x7fea683e87ed
0043d 498bd8                         mov        rbx, r8
00440 2bde                           sub        ebx, esi
00442 443beb                         cmp        r13d, ebx
00445 48b900407260ea7f0000           movabs     rcx, 0x7fea60724000
0044f bf40020000                     mov        edi, 0x240
00454 7f05                           jg         0x7fea683e87db
00456 bf30020000                     mov        edi, 0x230
0045b 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
0045f 488d5b01                       lea        rbx, [rbx + 1]
00463 48891c39                       mov        qword ptr [rcx + rdi], rbx
00467 0f8f44400000                   jg         0x7fea683ec831
0046d 4183fb03                       cmp        r11d, 3
00471 48b900407260ea7f0000           movabs     rcx, 0x7fea60724000
0047b bf60020000                     mov        edi, 0x260
00480 7e05                           jle        0x7fea683e8807
00482 bf70020000                     mov        edi, 0x270
00487 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
0048b 488d5b01                       lea        rbx, [rbx + 1]
0048f 48891c39                       mov        qword ptr [rcx + rdi], rbx
00493 0f8e9c000000                   jle        0x7fea683e88b5
00499 4183eb03                       sub        r11d, 3
0049d 4183790801                     cmp        dword ptr [r9 + 8], 1
004a2 0f86c9440000                   jbe        0x7fea683eccf1
004a8 418b4910                       mov        ecx, dword ptr [r9 + 0x10]
004ac 4183790802                     cmp        dword ptr [r9 + 8], 2
004b1 0f86cc440000                   jbe        0x7fea683ecd03
004b7 41894914                       mov        dword ptr [r9 + 0x14], ecx
004bb 4183790800                     cmp        dword ptr [r9 + 8], 0
004c0 0f86cf440000                   jbe        0x7fea683ecd15
004c6 418b490c                       mov        ecx, dword ptr [r9 + 0xc]
004ca 4183790801                     cmp        dword ptr [r9 + 8], 1
004cf 0f86d2440000                   jbe        0x7fea683ecd27
004d5 41894910                       mov        dword ptr [r9 + 0x10], ecx
004d9 4183790800                     cmp        dword ptr [r9 + 8], 0
004de 0f86d5440000                   jbe        0x7fea683ecd39
004e4 4589590c                       mov        dword ptr [r9 + 0xc], r11d
004e8 48b900407260ea7f0000           movabs     rcx, 0x7fea60724000
004f2 ff8180020000                   inc        dword ptr [rcx + 0x280]
004f8 498bcd                         mov        rcx, r13
004fb 89942470010000                 mov        dword ptr [rsp + 0x170], edx
00502 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
0050a 89b424bc010000                 mov        dword ptr [rsp + 0x1bc], esi
00511 8b9c248c010000                 mov        ebx, dword ptr [rsp + 0x18c]
00518 4c898c2450010000               mov        qword ptr [rsp + 0x150], r9
00520 4889842458010000               mov        qword ptr [rsp + 0x158], rax
00528 4489842468010000               mov        dword ptr [rsp + 0x168], r8d
00530 e968000000                     jmp        0x7fea683e891d
00535 89942470010000                 mov        dword ptr [rsp + 0x170], edx
0053c 89b424bc010000                 mov        dword ptr [rsp + 0x1bc], esi
00543 4889842458010000               mov        qword ptr [rsp + 0x158], rax
0054b 4489842468010000               mov        dword ptr [rsp + 0x168], r8d
00553 48bf00407260ea7f0000           movabs     rdi, 0x7fea60724000
0055d 4883879802000001               add        qword ptr [rdi + 0x298], 1
00565 498bf1                         mov        rsi, r9
00568 498bd3                         mov        rdx, r11
0056b 498bcd                         mov        rcx, r13
0056e 4c898c2450010000               mov        qword ptr [rsp + 0x150], r9
00576 90                             nop        
00577 e8647f5207                     call       0x7fea6f910860
0057c 0f1f840074060000               nop        dword ptr [rax + rax + 0x674]
00584 4c8bd8                         mov        r11, rax
00587 8b8c24b8010000                 mov        ecx, dword ptr [rsp + 0x1b8]
0058e 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
00596 8b9c248c010000                 mov        ebx, dword ptr [rsp + 0x18c]
0059d 4863f3                         movsxd     rsi, ebx
005a0 4903f6                         add        rsi, r14
005a3 4863d1                         movsxd     rdx, ecx
005a6 4803f2                         add        rsi, rdx
005a9 4963fb                         movsxd     rdi, r11d
005ac 488bd6                         mov        rdx, rsi
005af 483bd7                         cmp        rdx, rdi
005b2 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
005bc 41b8b8020000                   mov        r8d, 0x2b8
005c2 7d06                           jge        0x7fea683e894a
005c4 41b8a8020000                   mov        r8d, 0x2a8
005ca 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
005ce 4d8d4901                       lea        r9, [r9 + 1]
005d2 4e890c02                       mov        qword ptr [rdx + r8], r9
005d6 0f8d14000000                   jge        0x7fea683e8970
005dc 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
005e4 8b8424a0010000                 mov        eax, dword ptr [rsp + 0x1a0]
005eb e9b2000000                     jmp        0x7fea683e8a22
005f0 8b8424a0010000                 mov        eax, dword ptr [rsp + 0x1a0]
005f7 85c0                           test       eax, eax
005f9 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
00603 41b8c8020000                   mov        r8d, 0x2c8
00609 7506                           jne        0x7fea683e8991
0060b 41b8d8020000                   mov        r8d, 0x2d8
00611 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
00615 4d8d4901                       lea        r9, [r9 + 1]
00619 4e890c02                       mov        qword ptr [rdx + r8], r9
0061d 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
00625 0f856d000000                   jne        0x7fea683e8a18
0062b 488bd3                         mov        rdx, rbx
0062e 03d1                           add        edx, ecx
00630 412bd3                         sub        edx, r11d
00633 4863d2                         movsxd     rdx, edx
00636 493bd0                         cmp        rdx, r8
00639 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
00643 41b9e8020000                   mov        r9d, 0x2e8
00649 7c06                           jl         0x7fea683e89d1
0064b 41b9f8020000                   mov        r9d, 0x2f8
00651 4e8b2c0a                       mov        r13, qword ptr [rdx + r9]
00655 4d8d6d01                       lea        r13, [r13 + 1]
00659 4e892c0a                       mov        qword ptr [rdx + r9], r13
0065d 0f8c3f000000                   jl         0x7fea683e8a22
00663 488b942478010000               mov        rdx, qword ptr [rsp + 0x178]
0066b 483bd7                         cmp        rdx, rdi
0066e 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
00678 41b918030000                   mov        r9d, 0x318
0067e 7c06                           jl         0x7fea683e8a06
00680 41b908030000                   mov        r9d, 0x308
00686 4e8b2c0a                       mov        r13, qword ptr [rdx + r9]
0068a 4d8d6d01                       lea        r13, [r13 + 1]
0068e 4e892c0a                       mov        qword ptr [rdx + r9], r13
00692 0f8c0a000000                   jl         0x7fea683e8a22
00698 ba00000000                     mov        edx, 0
0069d e915000000                     jmp        0x7fea683e8a37
006a2 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
006ac ff8228030000                   inc        dword ptr [rdx + 0x328]
006b2 ba01000000                     mov        edx, 1
006b7 4889bc24c0010000               mov        qword ptr [rsp + 0x1c0], rdi
006bf 4585db                         test       r11d, r11d
006c2 49b900407260ea7f0000           movabs     r9, 0x7fea60724000
006cc 41bd40030000                   mov        r13d, 0x340
006d2 7e06                           jle        0x7fea683e8a5a
006d4 41bd50030000                   mov        r13d, 0x350
006da 4b8b3c29                       mov        rdi, qword ptr [r9 + r13]
006de 488d7f01                       lea        rdi, [rdi + 1]
006e2 4b893c29                       mov        qword ptr [r9 + r13], rdi
006e6 0f8e2b3b0000                   jle        0x7fea683ec597
006ec 85d2                           test       edx, edx
006ee 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
006f8 41b970030000                   mov        r9d, 0x370
006fe 7506                           jne        0x7fea683e8a86
00700 41b960030000                   mov        r9d, 0x360
00706 4a8b3c0a                       mov        rdi, qword ptr [rdx + r9]
0070a 488d7f01                       lea        rdi, [rdi + 1]
0070e 4a893c0a                       mov        qword ptr [rdx + r9], rdi
00712 0f85ff3a0000                   jne        0x7fea683ec597
00718 4c8beb                         mov        r13, rbx
0071b 4403e9                         add        r13d, ecx
0071e 4489ac2404020000               mov        dword ptr [rsp + 0x204], r13d
00726 498bf5                         mov        rsi, r13
00729 03b424a4010000                 add        esi, dword ptr [rsp + 0x1a4]
00730 3bb4246c010000                 cmp        esi, dword ptr [rsp + 0x16c]
00737 48be00407260ea7f0000           movabs     rsi, 0x7fea60724000
00741 ba28040000                     mov        edx, 0x428
00746 7f05                           jg         0x7fea683e8acd
00748 ba38040000                     mov        edx, 0x438
0074d 4c8b0c16                       mov        r9, qword ptr [rsi + rdx]
00751 4d8d4901                       lea        r9, [r9 + 1]
00755 4c890c16                       mov        qword ptr [rsi + rdx], r9
00759 0f8f41000000                   jg         0x7fea683e8b20
0075f 8bb424bc010000                 mov        esi, dword ptr [rsp + 0x1bc]
00766 03f1                           add        esi, ecx
00768 89b424fc010000                 mov        dword ptr [rsp + 0x1fc], esi
0076f 3bb42474010000                 cmp        esi, dword ptr [rsp + 0x174]
00776 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
00780 41b958040000                   mov        r9d, 0x458
00786 7e06                           jle        0x7fea683e8b0e
00788 41b948040000                   mov        r9d, 0x448
0078e 4a8b3c0a                       mov        rdi, qword ptr [rdx + r9]
00792 488d7f01                       lea        rdi, [rdi + 1]
00796 4a893c0a                       mov        qword ptr [rdx + r9], rdi
0079a 0f8e43010000                   jle        0x7fea683e8c63
007a0 8bbc24a4010000                 mov        edi, dword ptr [rsp + 0x1a4]
007a7 4c898424a8010000               mov        qword ptr [rsp + 0x1a8], r8
007af 898424a0010000                 mov        dword ptr [rsp + 0x1a0], eax
007b6 4c89b424b0010000               mov        qword ptr [rsp + 0x1b0], r14
007be 48be00407260ea7f0000           movabs     rsi, 0x7fea60724000
007c8 4883861808000001               add        qword ptr [rsi + 0x818], 1
007d0 488bb42480010000               mov        rsi, qword ptr [rsp + 0x180]
007d8 488bd3                         mov        rdx, rbx
007db 488bd9                         mov        rbx, rcx
007de 8b8c2488010000                 mov        ecx, dword ptr [rsp + 0x188]
007e5 4c8b842490010000               mov        r8, qword ptr [rsp + 0x190]
007ed 448b8c24bc010000               mov        r9d, dword ptr [rsp + 0x1bc]
007f5 488bc7                         mov        rax, rdi
007f8 488bfb                         mov        rdi, rbx
007fb 44891c24                       mov        dword ptr [rsp], r11d
007ff 89442408                       mov        dword ptr [rsp + 8], eax
00803 0f1f4000                       nop        dword ptr [rax]
00807 e8d47c5207                     call       0x7fea6f910860
0080c 0f1f840004090001               nop        dword ptr [rax + rax + 0x1000904]
00814 8bb424bc010000                 mov        esi, dword ptr [rsp + 0x1bc]
0081b 03b424b8010000                 add        esi, dword ptr [rsp + 0x1b8]
00822 8bbc2470010000                 mov        edi, dword ptr [rsp + 0x170]
00829 448b8c2474010000               mov        r9d, dword ptr [rsp + 0x174]
00831 8b9c246c010000                 mov        ebx, dword ptr [rsp + 0x16c]
00838 488b8c2478010000               mov        rcx, qword ptr [rsp + 0x178]
00840 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
00848 8b9424a0010000                 mov        edx, dword ptr [rsp + 0x1a0]
0084f 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
00857 448bac2488010000               mov        r13d, dword ptr [rsp + 0x188]
0085f 4c8b9c2480010000               mov        r11, qword ptr [rsp + 0x180]
00867 4c899c24c8010000               mov        qword ptr [rsp + 0x1c8], r11
0086f 4c8b9c2450010000               mov        r11, qword ptr [rsp + 0x150]
00877 4c899c24d0010000               mov        qword ptr [rsp + 0x1d0], r11
0087f 448b9c2444010000               mov        r11d, dword ptr [rsp + 0x144]
00887 44899c24d8010000               mov        dword ptr [rsp + 0x1d8], r11d
0088f 4c8b9c2458010000               mov        r11, qword ptr [rsp + 0x158]
00897 4c899c24e0010000               mov        qword ptr [rsp + 0x1e0], r11
0089f 4c8b9c2460010000               mov        r11, qword ptr [rsp + 0x160]
008a7 4c899c24e8010000               mov        qword ptr [rsp + 0x1e8], r11
008af 448b9c2468010000               mov        r11d, dword ptr [rsp + 0x168]
008b7 44899c24dc010000               mov        dword ptr [rsp + 0x1dc], r11d
008bf 4c8b9c2490010000               mov        r11, qword ptr [rsp + 0x190]
008c7 4c899c24f0010000               mov        qword ptr [rsp + 0x1f0], r11
008cf 4c8b9c2498010000               mov        r11, qword ptr [rsp + 0x198]
008d7 8984248c030000                 mov        dword ptr [rsp + 0x38c], eax
008de e9fa370000                     jmp        0x7fea683ec45d
008e3 4c898424a8010000               mov        qword ptr [rsp + 0x1a8], r8
008eb 898424a0010000                 mov        dword ptr [rsp + 0x1a0], eax
008f2 4c89b424b0010000               mov        qword ptr [rsp + 0x1b0], r14
008fa 8b8424a4010000                 mov        eax, dword ptr [rsp + 0x1a4]
00901 83f910                         cmp        ecx, 0x10
00904 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
0090e 41b868040000                   mov        r8d, 0x468
00914 7f06                           jg         0x7fea683e8c9c
00916 41b878040000                   mov        r8d, 0x478
0091c 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
00920 4d8d4901                       lea        r9, [r9 + 1]
00924 4e890c02                       mov        qword ptr [rdx + r8], r9
00928 0f8f6b0a0000                   jg         0x7fea683e9719
0092e 488b942490010000               mov        rdx, qword ptr [rsp + 0x190]
00936 49b800407260ea7f0000           movabs     r8, 0x7fea60724000
00940 4983808804000001               add        qword ptr [r8 + 0x488], 1
00948 49b8981a7960ea7f0000           movabs     r8, 0x7fea60791a98
00952 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
00956 4183c102                       add        r9d, 2
0095a 45894870                       mov        dword ptr [r8 + 0x70], r9d
0095e 4181e1feff1f00                 and        r9d, 0x1ffffe
00965 4585c9                         test       r9d, r9d
00968 0f845d400000                   je         0x7fea683ecd4b
0096e 49b8488d78e200000000           movabs     r8, 0xe2788d48
00978 49b9981a7960ea7f0000           movabs     r9, 0x7fea60791a98
00982 4d8b00                         mov        r8, qword ptr [r8]
00985 49c1e82a                       shr        r8, 0x2a
00989 49c1e009                       shl        r8, 9
0098d 41ba00000047                   mov        r10d, 0x47000000
00993 4d03c2                         add        r8, r10
00996 41ba16000000                   mov        r10d, 0x16
0099c 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
009a0 7435                           je         0x7fea683e8d57
009a2 4983c202                       add        r10, 2
009a6 4983fa1a                       cmp        r10, 0x1a
009aa 75f0                           jne        0x7fea683e8d1c
009ac 41ba16000000                   mov        r10d, 0x16
009b2 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
009b7 7412                           je         0x7fea683e8d4b
009b9 4983c202                       add        r10, 2
009bd 4983fa1a                       cmp        r10, 0x1a
009c1 75ef                           jne        0x7fea683e8d32
009c3 41ba15000000                   mov        r10d, 0x15
009c9 eb10                           jmp        0x7fea683e8d5b
009cb 50                             push       rax
009cc 4833c0                         xor        rax, rax
009cf 4f0fb104d1                     cmpxchg    qword ptr [r9 + r10*8], r8
009d4 58                             pop        rax
009d5 ebbf                           jmp        0x7fea683e8d16
009d7 4983c201                       add        r10, 1
009db 4b8304d101                     add        qword ptr [r9 + r10*8], 1
009e0 448b4208                       mov        r8d, dword ptr [rdx + 8]
009e4 49b9981a7960ea7f0000           movabs     r9, 0x7fea60791a98
009ee 498381d800000001               add        qword ptr [r9 + 0xd8], 1
009f6 49b9f0107960ea7f0000           movabs     r9, 0x7fea607910f0
00a00 418b7970                       mov        edi, dword ptr [r9 + 0x70]
00a04 83c702                         add        edi, 2
00a07 41897970                       mov        dword ptr [r9 + 0x70], edi
00a0b 81e7feff1f00                   and        edi, 0x1ffffe
00a11 85ff                           test       edi, edi
00a13 0f84d83f0000                   je         0x7fea683ecd71
00a19 448bb424bc010000               mov        r14d, dword ptr [rsp + 0x1bc]
00a21 49b9f0107960ea7f0000           movabs     r9, 0x7fea607910f0
00a2b 4983810801000001               add        qword ptr [r9 + 0x108], 1
00a33 4183e80f                       sub        r8d, 0xf
00a37 49b9c0077960ea7f0000           movabs     r9, 0x7fea607907c0
00a41 418b7970                       mov        edi, dword ptr [r9 + 0x70]
00a45 83c702                         add        edi, 2
00a48 41897970                       mov        dword ptr [r9 + 0x70], edi
00a4c 81e7feff1f00                   and        edi, 0x1ffffe
00a52 85ff                           test       edi, edi
00a54 0f84b83f0000                   je         0x7fea683ecd92
00a5a 49b9c0077960ea7f0000           movabs     r9, 0x7fea607907c0
00a64 498381a800000001               add        qword ptr [r9 + 0xa8], 1
00a6c 49b90000000000000000           movabs     r9, 0
00a76 41b900000000                   mov        r9d, 0
00a7c 453bf1                         cmp        r14d, r9d
00a7f 0f8cae3f0000                   jl         0x7fea683ecdb3
00a85 453bf0                         cmp        r14d, r8d
00a88 0f8db23f0000                   jge        0x7fea683ecdc0
00a8e 4d8bc6                         mov        r8, r14
00a91 44898424f8010000               mov        dword ptr [rsp + 0x1f8], r8d
00a99 49b9488d78e200000000           movabs     r9, 0xe2788d48
00aa3 498bf9                         mov        rdi, r9
00aa6 49b8981a7960ea7f0000           movabs     r8, 0x7fea60791a98
00ab0 488b3f                         mov        rdi, qword ptr [rdi]
00ab3 48c1ef2a                       shr        rdi, 0x2a
00ab7 48c1e709                       shl        rdi, 9
00abb 41ba00000047                   mov        r10d, 0x47000000
00ac1 4903fa                         add        rdi, r10
00ac4 41ba24000000                   mov        r10d, 0x24
00aca 4b3b3cd0                       cmp        rdi, qword ptr [r8 + r10*8]
00ace 7435                           je         0x7fea683e8e85
00ad0 4983c202                       add        r10, 2
00ad4 4983fa28                       cmp        r10, 0x28
00ad8 75f0                           jne        0x7fea683e8e4a
00ada 41ba24000000                   mov        r10d, 0x24
00ae0 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
00ae5 7412                           je         0x7fea683e8e79
00ae7 4983c202                       add        r10, 2
00aeb 4983fa28                       cmp        r10, 0x28
00aef 75ef                           jne        0x7fea683e8e60
00af1 41ba23000000                   mov        r10d, 0x23
00af7 eb10                           jmp        0x7fea683e8e89
00af9 50                             push       rax
00afa 4833c0                         xor        rax, rax
00afd 4b0fb13cd0                     cmpxchg    qword ptr [r8 + r10*8], rdi
00b02 58                             pop        rax
00b03 ebbf                           jmp        0x7fea683e8e44
00b05 4983c201                       add        r10, 1
00b09 4b8304d001                     add        qword ptr [r8 + r10*8], 1
00b0e 48bec0087960ea7f0000           movabs     rsi, 0x7fea607908c0
00b18 448b4670                       mov        r8d, dword ptr [rsi + 0x70]
00b1c 4183c002                       add        r8d, 2
00b20 44894670                       mov        dword ptr [rsi + 0x70], r8d
00b24 4181e0feff1f00                 and        r8d, 0x1ffffe
00b2b 4585c0                         test       r8d, r8d
00b2e 0f84193f0000                   je         0x7fea683ecdcd
00b34 48bec0087960ea7f0000           movabs     rsi, 0x7fea607908c0
00b3e 488386a800000001               add        qword ptr [rsi + 0xa8], 1
00b46 48bee8097960ea7f0000           movabs     rsi, 0x7fea607909e8
00b50 448b4670                       mov        r8d, dword ptr [rsi + 0x70]
00b54 4183c002                       add        r8d, 2
00b58 44894670                       mov        dword ptr [rsi + 0x70], r8d
00b5c 4181e0feff1f00                 and        r8d, 0x1ffffe
00b63 4585c0                         test       r8d, r8d
00b66 0f84023f0000                   je         0x7fea683ecdee
00b6c 48bee8097960ea7f0000           movabs     rsi, 0x7fea607909e8
00b76 ff86b8000000                   inc        dword ptr [rsi + 0xb8]
00b7c 448b8424f8010000               mov        r8d, dword ptr [rsp + 0x1f8]
00b84 44899c2400020000               mov        dword ptr [rsp + 0x200], r11d
00b8c 4489b424bc010000               mov        dword ptr [rsp + 0x1bc], r14d
00b94 899c248c010000                 mov        dword ptr [rsp + 0x18c], ebx
00b9b 49b9305e7ae200000000           movabs     r9, 0xe27a5e30
00ba5 4d8bf1                         mov        r14, r9
00ba8 48bb981a7960ea7f0000           movabs     rbx, 0x7fea60791a98
00bb2 4883835801000001               add        qword ptr [rbx + 0x158], 1
00bba 48bb601c7960ea7f0000           movabs     rbx, 0x7fea60791c60
00bc4 8b4370                         mov        eax, dword ptr [rbx + 0x70]
00bc7 83c002                         add        eax, 2
00bca 894370                         mov        dword ptr [rbx + 0x70], eax
00bcd 25feff1f00                     and        eax, 0x1ffffe
00bd2 85c0                           test       eax, eax
00bd4 0f84b53e0000                   je         0x7fea683ece0f
00bda 498bd9                         mov        rbx, r9
00bdd 48b8601c7960ea7f0000           movabs     rax, 0x7fea60791c60
00be7 488380a800000001               add        qword ptr [rax + 0xa8], 1
00bef 48bb401d7960ea7f0000           movabs     rbx, 0x7fea60791d40
00bf9 8b4370                         mov        eax, dword ptr [rbx + 0x70]
00bfc 83c002                         add        eax, 2
00bff 894370                         mov        dword ptr [rbx + 0x70], eax
00c02 25feff1f00                     and        eax, 0x1ffffe
00c07 85c0                           test       eax, eax
00c09 0f84a13e0000                   je         0x7fea683ece30
00c0f 48bb401d7960ea7f0000           movabs     rbx, 0x7fea60791d40
00c19 488383b800000001               add        qword ptr [rbx + 0xb8], 1
00c21 49b968127960ea7f0000           movabs     r9, 0x7fea60791268
00c2b 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
00c2f 83c302                         add        ebx, 2
00c32 41895970                       mov        dword ptr [r9 + 0x70], ebx
00c36 81e3feff1f00                   and        ebx, 0x1ffffe
00c3c 85db                           test       ebx, ebx
00c3e 0f848d3e0000                   je         0x7fea683ece51
00c44 49b9488d78e200000000           movabs     r9, 0xe2788d48
00c4e 498bd9                         mov        rbx, r9
00c51 48b8401d7960ea7f0000           movabs     rax, 0x7fea60791d40
00c5b 488b1b                         mov        rbx, qword ptr [rbx]
00c5e 48c1eb2a                       shr        rbx, 0x2a
00c62 48c1e309                       shl        rbx, 9
00c66 41ba00000047                   mov        r10d, 0x47000000
00c6c 4903da                         add        rbx, r10
00c6f 41ba1c000000                   mov        r10d, 0x1c
00c75 4a3b1cd0                       cmp        rbx, qword ptr [rax + r10*8]
00c79 743b                           je         0x7fea683e9036
00c7b 4983c202                       add        r10, 2
00c7f 4983fa20                       cmp        r10, 0x20
00c83 75f0                           jne        0x7fea683e8ff5
00c85 41ba1c000000                   mov        r10d, 0x1c
00c8b 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
00c90 7412                           je         0x7fea683e9024
00c92 4983c202                       add        r10, 2
00c96 4983fa20                       cmp        r10, 0x20
00c9a 75ef                           jne        0x7fea683e900b
00c9c 41ba1b000000                   mov        r10d, 0x1b
00ca2 eb16                           jmp        0x7fea683e903a
00ca4 51                             push       rcx
00ca5 488bc8                         mov        rcx, rax
00ca8 4833c0                         xor        rax, rax
00cab 4a0fb11cd1                     cmpxchg    qword ptr [rcx + r10*8], rbx
00cb0 488bc1                         mov        rax, rcx
00cb3 59                             pop        rcx
00cb4 ebb9                           jmp        0x7fea683e8fef
00cb6 4983c201                       add        r10, 1
00cba 4a8304d001                     add        qword ptr [rax + r10*8], 1
00cbf 48bb401d7960ea7f0000           movabs     rbx, 0x7fea60791d40
00cc9 4d8b09                         mov        r9, qword ptr [r9]
00ccc 49c1e92a                       shr        r9, 0x2a
00cd0 49c1e109                       shl        r9, 9
00cd4 41ba00000047                   mov        r10d, 0x47000000
00cda 4d03ca                         add        r9, r10
00cdd 41ba22000000                   mov        r10d, 0x22
00ce3 4e3b0cd3                       cmp        r9, qword ptr [rbx + r10*8]
00ce7 7435                           je         0x7fea683e909e
00ce9 4983c202                       add        r10, 2
00ced 4983fa26                       cmp        r10, 0x26
00cf1 75f0                           jne        0x7fea683e9063
00cf3 41ba22000000                   mov        r10d, 0x22
00cf9 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00cfe 7412                           je         0x7fea683e9092
00d00 4983c202                       add        r10, 2
00d04 4983fa26                       cmp        r10, 0x26
00d08 75ef                           jne        0x7fea683e9079
00d0a 41ba21000000                   mov        r10d, 0x21
00d10 eb10                           jmp        0x7fea683e90a2
00d12 50                             push       rax
00d13 4833c0                         xor        rax, rax
00d16 4e0fb10cd3                     cmpxchg    qword ptr [rbx + r10*8], r9
00d1b 58                             pop        rax
00d1c ebbf                           jmp        0x7fea683e905d
00d1e 4983c201                       add        r10, 1
00d22 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00d27 49b9401d7960ea7f0000           movabs     r9, 0x7fea60791d40
00d31 4983813801000001               add        qword ptr [r9 + 0x138], 1
00d39 49b928137960ea7f0000           movabs     r9, 0x7fea60791328
00d43 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
00d47 83c302                         add        ebx, 2
00d4a 41895970                       mov        dword ptr [r9 + 0x70], ebx
00d4e 81e3feff1f00                   and        ebx, 0x1ffffe
00d54 85db                           test       ebx, ebx
00d56 0f84963d0000                   je         0x7fea683ece72
00d5c 49b9401d7960ea7f0000           movabs     r9, 0x7fea60791d40
00d66 4983814801000001               add        qword ptr [r9 + 0x148], 1
00d6e 4963d8                         movsxd     rbx, r8d
00d71 41b80c000000                   mov        r8d, 0xc
00d77 4c8bcb                         mov        r9, rbx
00d7a 4d03c8                         add        r9, r8
00d7d 49b810057960ea7f0000           movabs     r8, 0x7fea60790510
00d87 418b4070                       mov        eax, dword ptr [r8 + 0x70]
00d8b 83c002                         add        eax, 2
00d8e 41894070                       mov        dword ptr [r8 + 0x70], eax
00d92 25feff1f00                     and        eax, 0x1ffffe
00d97 85c0                           test       eax, eax
00d99 0f84743d0000                   je         0x7fea683ece93
00d9f 49b810057960ea7f0000           movabs     r8, 0x7fea60790510
00da9 498380d800000001               add        qword ptr [r8 + 0xd8], 1
00db1 49b888067960ea7f0000           movabs     r8, 0x7fea60790688
00dbb 418b4070                       mov        eax, dword ptr [r8 + 0x70]
00dbf 83c002                         add        eax, 2
00dc2 41894070                       mov        dword ptr [r8 + 0x70], eax
00dc6 25feff1f00                     and        eax, 0x1ffffe
00dcb 85c0                           test       eax, eax
00dcd 0f84613d0000                   je         0x7fea683eceb4
00dd3 49b8401d7960ea7f0000           movabs     r8, 0x7fea60791d40
00ddd 4983806801000001               add        qword ptr [r8 + 0x168], 1
00de5 49b800597be200000000           movabs     r8, 0xe27b5900
00def 48be908d78e200000000           movabs     rsi, 0xe2788d90
00df9 4c8bf2                         mov        r14, rdx
00dfc ba02000000                     mov        edx, 2
00e01 b910000000                     mov        ecx, 0x10
00e06 4d8bc6                         mov        r8, r14
00e09 bf00000000                     mov        edi, 0
00e0e 4c893424                       mov        qword ptr [rsp], r14
00e12 48895c2408                     mov        qword ptr [rsp + 8], rbx
00e17 49ba488d78e200000000           movabs     r10, 0xe2788d48
00e21 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00e26 49ba00597be200000000           movabs     r10, 0xe27b5900
00e30 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e35 4c89b42490010000               mov        qword ptr [rsp + 0x190], r14
00e3d 6690                           nop        
00e3f e89c765207                     call       0x7fea6f910860
00e44 0f1f84003c0f0002               nop        dword ptr [rax + rax + 0x2000f3c]
00e4c 4885c0                         test       rax, rax
00e4f 48bb401d7960ea7f0000           movabs     rbx, 0x7fea60791d40
00e59 750c                           jne        0x7fea683e91e7
00e5b 808b7101000001                 or         byte ptr [rbx + 0x171], 1
00e62 e98b000000                     jmp        0x7fea683e9272
00e67 488b38                         mov        rdi, qword ptr [rax]
00e6a 48c1ef2a                       shr        rdi, 0x2a
00e6e 48c1e709                       shl        rdi, 9
00e72 41ba00000047                   mov        r10d, 0x47000000
00e78 4903fa                         add        rdi, r10
00e7b 41ba30000000                   mov        r10d, 0x30
00e81 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
00e85 7435                           je         0x7fea683e923c
00e87 4983c202                       add        r10, 2
00e8b 4983fa34                       cmp        r10, 0x34
00e8f 75f0                           jne        0x7fea683e9201
00e91 41ba30000000                   mov        r10d, 0x30
00e97 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00e9c 7412                           je         0x7fea683e9230
00e9e 4983c202                       add        r10, 2
00ea2 4983fa34                       cmp        r10, 0x34
00ea6 75ef                           jne        0x7fea683e9217
00ea8 41ba2f000000                   mov        r10d, 0x2f
00eae eb10                           jmp        0x7fea683e9240
00eb0 50                             push       rax
00eb1 4833c0                         xor        rax, rax
00eb4 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
00eb9 58                             pop        rax
00eba ebbf                           jmp        0x7fea683e91fb
00ebc 4983c201                       add        r10, 1
00ec0 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00ec5 48bf0006144700000000           movabs     rdi, 0x47140600
00ecf 488b18                         mov        rbx, qword ptr [rax]
00ed2 48c1eb2a                       shr        rbx, 0x2a
00ed6 48c1e309                       shl        rbx, 9
00eda 41ba00000047                   mov        r10d, 0x47000000
00ee0 4903da                         add        rbx, r10
00ee3 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
00ee7 0f85683c0000                   jne        0x7fea683eced5
00eed e900000000                     jmp        0x7fea683e9272
00ef2 488bf8                         mov        rdi, rax
00ef5 4889bc2408020000               mov        qword ptr [rsp + 0x208], rdi
00efd 483b07                         cmp        rax, qword ptr [rdi]
00f00 488bf7                         mov        rsi, rdi
00f03 48bb00407260ea7f0000           movabs     rbx, 0x7fea60724000
00f0d 488b36                         mov        rsi, qword ptr [rsi]
00f10 48c1ee2a                       shr        rsi, 0x2a
00f14 48c1e609                       shl        rsi, 9
00f18 41ba00000047                   mov        r10d, 0x47000000
00f1e 4903f2                         add        rsi, r10
00f21 41ba94000000                   mov        r10d, 0x94
00f27 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00f2b 743b                           je         0x7fea683e92e8
00f2d 4983c202                       add        r10, 2
00f31 4981fa98000000                 cmp        r10, 0x98
00f38 75ed                           jne        0x7fea683e92a7
00f3a 41ba94000000                   mov        r10d, 0x94
00f40 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00f45 7415                           je         0x7fea683e92dc
00f47 4983c202                       add        r10, 2
00f4b 4981fa98000000                 cmp        r10, 0x98
00f52 75ec                           jne        0x7fea683e92c0
00f54 41ba93000000                   mov        r10d, 0x93
00f5a eb10                           jmp        0x7fea683e92ec
00f5c 50                             push       rax
00f5d 4833c0                         xor        rax, rax
00f60 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
00f65 58                             pop        rax
00f66 ebb9                           jmp        0x7fea683e92a1
00f68 4983c201                       add        r10, 1
00f6c 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00f71 48be58277960ea7f0000           movabs     rsi, 0x7fea60792758
00f7b 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
00f7e 83c302                         add        ebx, 2
00f81 895e70                         mov        dword ptr [rsi + 0x70], ebx
00f84 81e3feff1f00                   and        ebx, 0x1ffffe
00f8a 85db                           test       ebx, ebx
00f8c 0f84d13b0000                   je         0x7fea683ecee3
00f92 488bf7                         mov        rsi, rdi
00f95 48bb58277960ea7f0000           movabs     rbx, 0x7fea60792758
00f9f 488b36                         mov        rsi, qword ptr [rsi]
00fa2 48c1ee2a                       shr        rsi, 0x2a
00fa6 48c1e609                       shl        rsi, 9
00faa 41ba00000047                   mov        r10d, 0x47000000
00fb0 4903f2                         add        rsi, r10
00fb3 41ba16000000                   mov        r10d, 0x16
00fb9 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00fbd 7435                           je         0x7fea683e9374
00fbf 4983c202                       add        r10, 2
00fc3 4983fa1a                       cmp        r10, 0x1a
00fc7 75f0                           jne        0x7fea683e9339
00fc9 41ba16000000                   mov        r10d, 0x16
00fcf 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00fd4 7412                           je         0x7fea683e9368
00fd6 4983c202                       add        r10, 2
00fda 4983fa1a                       cmp        r10, 0x1a
00fde 75ef                           jne        0x7fea683e934f
00fe0 41ba15000000                   mov        r10d, 0x15
00fe6 eb10                           jmp        0x7fea683e9378
00fe8 50                             push       rax
00fe9 4833c0                         xor        rax, rax
00fec 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
00ff1 58                             pop        rax
00ff2 ebbf                           jmp        0x7fea683e9333
00ff4 4983c201                       add        r10, 1
00ff8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00ffd 488bf7                         mov        rsi, rdi
01000 0f1f440000                     nop        dword ptr [rax + rax]
01005 48b8c0ef3944ea7f0000           movabs     rax, 0x7fea4439efc0
0100f e8cc6f5207                     call       0x7fea6f910360
01014 0f1f84000c110003               nop        dword ptr [rax + rax + 0x300110c]
0101c 488bbc2480010000               mov        rdi, qword ptr [rsp + 0x180]
01024 8b7708                         mov        esi, dword ptr [rdi + 8]
01027 48bb58277960ea7f0000           movabs     rbx, 0x7fea60792758
01031 488383d800000001               add        qword ptr [rbx + 0xd8], 1
01039 48bbf0107960ea7f0000           movabs     rbx, 0x7fea607910f0
01043 8b5370                         mov        edx, dword ptr [rbx + 0x70]
01046 83c202                         add        edx, 2
01049 895370                         mov        dword ptr [rbx + 0x70], edx
0104c 81e2feff1f00                   and        edx, 0x1ffffe
01052 85d2                           test       edx, edx
01054 0f842f3b0000                   je         0x7fea683ecf09
0105a 448b9c248c010000               mov        r11d, dword ptr [rsp + 0x18c]
01062 48bbf0107960ea7f0000           movabs     rbx, 0x7fea607910f0
0106c 4883830801000001               add        qword ptr [rbx + 0x108], 1
01074 ffc8                           dec        eax
01076 2bf0                           sub        esi, eax
01078 48bbc0077960ea7f0000           movabs     rbx, 0x7fea607907c0
01082 8b4370                         mov        eax, dword ptr [rbx + 0x70]
01085 83c002                         add        eax, 2
01088 894370                         mov        dword ptr [rbx + 0x70], eax
0108b 25feff1f00                     and        eax, 0x1ffffe
01090 85c0                           test       eax, eax
01092 0f84123b0000                   je         0x7fea683ecf2a
01098 48bbc0077960ea7f0000           movabs     rbx, 0x7fea607907c0
010a2 488383a800000001               add        qword ptr [rbx + 0xa8], 1
010aa 48bb0000000000000000           movabs     rbx, 0
010b4 bb00000000                     mov        ebx, 0
010b9 443bdb                         cmp        r11d, ebx
010bc 0f8c093b0000                   jl         0x7fea683ecf4b
010c2 443bde                         cmp        r11d, esi
010c5 0f8d0d3b0000                   jge        0x7fea683ecf58
010cb 498bdb                         mov        rbx, r11
010ce 899c2410020000                 mov        dword ptr [rsp + 0x210], ebx
010d5 44899c248c010000               mov        dword ptr [rsp + 0x18c], r11d
010dd 4889bc2480010000               mov        qword ptr [rsp + 0x180], rdi
010e5 488bbc2408020000               mov        rdi, qword ptr [rsp + 0x208]
010ed 488bf7                         mov        rsi, rdi
010f0 48ba58277960ea7f0000           movabs     rdx, 0x7fea60792758
010fa 488b36                         mov        rsi, qword ptr [rsi]
010fd 48c1ee2a                       shr        rsi, 0x2a
01101 48c1e609                       shl        rsi, 9
01105 41ba00000047                   mov        r10d, 0x47000000
0110b 4903f2                         add        rsi, r10
0110e 41ba1e000000                   mov        r10d, 0x1e
01114 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01118 7435                           je         0x7fea683e94cf
0111a 4983c202                       add        r10, 2
0111e 4983fa22                       cmp        r10, 0x22
01122 75f0                           jne        0x7fea683e9494
01124 41ba1e000000                   mov        r10d, 0x1e
0112a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
0112f 7412                           je         0x7fea683e94c3
01131 4983c202                       add        r10, 2
01135 4983fa22                       cmp        r10, 0x22
01139 75ef                           jne        0x7fea683e94aa
0113b 41ba1d000000                   mov        r10d, 0x1d
01141 eb10                           jmp        0x7fea683e94d3
01143 50                             push       rax
01144 4833c0                         xor        rax, rax
01147 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
0114c 58                             pop        rax
0114d ebbf                           jmp        0x7fea683e948e
0114f 4983c201                       add        r10, 1
01153 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01158 488bf7                         mov        rsi, rdi
0115b 6690                           nop        
0115d 48b8e8ef3944ea7f0000           movabs     rax, 0x7fea4439efe8
01167 e8746e5207                     call       0x7fea6f910360
0116c 0f1f840064120004               nop        dword ptr [rax + rax + 0x4001264]
01174 483b00                         cmp        rax, qword ptr [rax]
01177 488bf0                         mov        rsi, rax
0117a 48ba58277960ea7f0000           movabs     rdx, 0x7fea60792758
01184 488b36                         mov        rsi, qword ptr [rsi]
01187 48c1ee2a                       shr        rsi, 0x2a
0118b 48c1e609                       shl        rsi, 9
0118f 41ba00000047                   mov        r10d, 0x47000000
01195 4903f2                         add        rsi, r10
01198 41ba24000000                   mov        r10d, 0x24
0119e 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
011a2 7435                           je         0x7fea683e9559
011a4 4983c202                       add        r10, 2
011a8 4983fa28                       cmp        r10, 0x28
011ac 75f0                           jne        0x7fea683e951e
011ae 41ba24000000                   mov        r10d, 0x24
011b4 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
011b9 7412                           je         0x7fea683e954d
011bb 4983c202                       add        r10, 2
011bf 4983fa28                       cmp        r10, 0x28
011c3 75ef                           jne        0x7fea683e9534
011c5 41ba23000000                   mov        r10d, 0x23
011cb eb10                           jmp        0x7fea683e955d
011cd 50                             push       rax
011ce 4833c0                         xor        rax, rax
011d1 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
011d6 58                             pop        rax
011d7 ebbf                           jmp        0x7fea683e9518
011d9 4983c201                       add        r10, 1
011dd 4a8304d201                     add        qword ptr [rdx + r10*8], 1
011e2 8b7028                         mov        esi, dword ptr [rax + 0x28]
011e5 488bd0                         mov        rdx, rax
011e8 48b958277960ea7f0000           movabs     rcx, 0x7fea60792758
011f2 488b12                         mov        rdx, qword ptr [rdx]
011f5 48c1ea2a                       shr        rdx, 0x2a
011f9 48c1e209                       shl        rdx, 9
011fd 41ba00000047                   mov        r10d, 0x47000000
01203 4903d2                         add        rdx, r10
01206 41ba2a000000                   mov        r10d, 0x2a
0120c 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01210 7435                           je         0x7fea683e95c7
01212 4983c202                       add        r10, 2
01216 4983fa2e                       cmp        r10, 0x2e
0121a 75f0                           jne        0x7fea683e958c
0121c 41ba2a000000                   mov        r10d, 0x2a
01222 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01227 7412                           je         0x7fea683e95bb
01229 4983c202                       add        r10, 2
0122d 4983fa2e                       cmp        r10, 0x2e
01231 75ef                           jne        0x7fea683e95a2
01233 41ba29000000                   mov        r10d, 0x29
01239 eb10                           jmp        0x7fea683e95cb
0123b 50                             push       rax
0123c 4833c0                         xor        rax, rax
0123f 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
01244 58                             pop        rax
01245 ebbf                           jmp        0x7fea683e9586
01247 4983c201                       add        r10, 1
0124b 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01250 8b4808                         mov        ecx, dword ptr [rax + 8]
01253 48ba58277960ea7f0000           movabs     rdx, 0x7fea60792758
0125d 4883827801000001               add        qword ptr [rdx + 0x178], 1
01265 48ba28137960ea7f0000           movabs     rdx, 0x7fea60791328
0126f 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01273 4183c002                       add        r8d, 2
01277 44894270                       mov        dword ptr [rdx + 0x70], r8d
0127b 4181e0feff1f00                 and        r8d, 0x1ffffe
01282 4585c0                         test       r8d, r8d
01285 0f845f390000                   je         0x7fea683ecf6a
0128b 48ba58277960ea7f0000           movabs     rdx, 0x7fea60792758
01295 4883828801000001               add        qword ptr [rdx + 0x188], 1
0129d 8b9c2410020000                 mov        ebx, dword ptr [rsp + 0x210]
012a4 4863db                         movsxd     rbx, ebx
012a7 ba0c000000                     mov        edx, 0xc
012ac 4c8bcb                         mov        r9, rbx
012af 4c03ca                         add        r9, rdx
012b2 48ba10057960ea7f0000           movabs     rdx, 0x7fea60790510
012bc 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
012c0 4183c002                       add        r8d, 2
012c4 44894270                       mov        dword ptr [rdx + 0x70], r8d
012c8 4181e0feff1f00                 and        r8d, 0x1ffffe
012cf 4585c0                         test       r8d, r8d
012d2 0f8433390000                   je         0x7fea683ecf8b
012d8 48ba10057960ea7f0000           movabs     rdx, 0x7fea60790510
012e2 488382d800000001               add        qword ptr [rdx + 0xd8], 1
012ea 48ba88067960ea7f0000           movabs     rdx, 0x7fea60790688
012f4 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
012f8 4183c002                       add        r8d, 2
012fc 44894270                       mov        dword ptr [rdx + 0x70], r8d
01300 4181e0feff1f00                 and        r8d, 0x1ffffe
01307 4585c0                         test       r8d, r8d
0130a 0f841c390000                   je         0x7fea683ecfac
01310 48ba58277960ea7f0000           movabs     rdx, 0x7fea60792758
0131a 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
01322 48baa8397de200000000           movabs     rdx, 0xe27d39a8
0132c ba02000000                     mov        edx, 2
01331 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
01339 bf00000000                     mov        edi, 0
0133e 488b842408020000               mov        rax, qword ptr [rsp + 0x208]
01346 48890424                       mov        qword ptr [rsp], rax
0134a 488b842480010000               mov        rax, qword ptr [rsp + 0x180]
01352 4889442408                     mov        qword ptr [rsp + 8], rax
01357 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
0135c 49baa8397de200000000           movabs     r10, 0xe27d39a8
01366 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0136b 4889842480010000               mov        qword ptr [rsp + 0x180], rax
01373 0f1f4000                       nop        dword ptr [rax]
01377 e864715207                     call       0x7fea6f910860
0137c 0f1f840074140005               nop        dword ptr [rax + rax + 0x5001474]
01384 48be00407260ea7f0000           movabs     rsi, 0x7fea60724000
0138e ff86c8040000                   inc        dword ptr [rsi + 0x4c8]
01394 e9be0b0000                     jmp        0x7fea683ea2d7
01399 44899c2400020000               mov        dword ptr [rsp + 0x200], r11d
013a1 899c248c010000                 mov        dword ptr [rsp + 0x18c], ebx
013a8 83f930                         cmp        ecx, 0x30
013ab 48be00407260ea7f0000           movabs     rsi, 0x7fea60724000
013b5 bae0040000                     mov        edx, 0x4e0
013ba 7f05                           jg         0x7fea683e9741
013bc baf0040000                     mov        edx, 0x4f0
013c1 4c8b0416                       mov        r8, qword ptr [rsi + rdx]
013c5 4d8d4001                       lea        r8, [r8 + 1]
013c9 4c890416                       mov        qword ptr [rsi + rdx], r8
013cd 0f8fee0a0000                   jg         0x7fea683ea241
013d3 8bb424bc010000                 mov        esi, dword ptr [rsp + 0x1bc]
013da 448b9c248c010000               mov        r11d, dword ptr [rsp + 0x18c]
013e2 660f1f440000                   nop        word ptr [rax + rax]
013e8 44899c2414020000               mov        dword ptr [rsp + 0x214], r11d
013f0 488b942490010000               mov        rdx, qword ptr [rsp + 0x190]
013f8 49b800407260ea7f0000           movabs     r8, 0x7fea60724000
01402 4983800005000001               add        qword ptr [r8 + 0x500], 1
0140a 49b8981a7960ea7f0000           movabs     r8, 0x7fea60791a98
01414 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
01418 4183c102                       add        r9d, 2
0141c 45894870                       mov        dword ptr [r8 + 0x70], r9d
01420 4181e1feff1f00                 and        r9d, 0x1ffffe
01427 4585c9                         test       r9d, r9d
0142a 0f841d380000                   je         0x7fea683ecfcd
01430 49b8488d78e200000000           movabs     r8, 0xe2788d48
0143a 49b9981a7960ea7f0000           movabs     r9, 0x7fea60791a98
01444 4d8b00                         mov        r8, qword ptr [r8]
01447 49c1e82a                       shr        r8, 0x2a
0144b 49c1e009                       shl        r8, 9
0144f 41ba00000047                   mov        r10d, 0x47000000
01455 4d03c2                         add        r8, r10
01458 41ba16000000                   mov        r10d, 0x16
0145e 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
01462 7435                           je         0x7fea683e9819
01464 4983c202                       add        r10, 2
01468 4983fa1a                       cmp        r10, 0x1a
0146c 75f0                           jne        0x7fea683e97de
0146e 41ba16000000                   mov        r10d, 0x16
01474 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
01479 7412                           je         0x7fea683e980d
0147b 4983c202                       add        r10, 2
0147f 4983fa1a                       cmp        r10, 0x1a
01483 75ef                           jne        0x7fea683e97f4
01485 41ba15000000                   mov        r10d, 0x15
0148b eb10                           jmp        0x7fea683e981d
0148d 50                             push       rax
0148e 4833c0                         xor        rax, rax
01491 4f0fb104d1                     cmpxchg    qword ptr [r9 + r10*8], r8
01496 58                             pop        rax
01497 ebbf                           jmp        0x7fea683e97d8
01499 4983c201                       add        r10, 1
0149d 4b8304d101                     add        qword ptr [r9 + r10*8], 1
014a2 448b4208                       mov        r8d, dword ptr [rdx + 8]
014a6 49b9981a7960ea7f0000           movabs     r9, 0x7fea60791a98
014b0 498381d800000001               add        qword ptr [r9 + 0xd8], 1
014b8 49b9f0107960ea7f0000           movabs     r9, 0x7fea607910f0
014c2 418b7970                       mov        edi, dword ptr [r9 + 0x70]
014c6 83c702                         add        edi, 2
014c9 41897970                       mov        dword ptr [r9 + 0x70], edi
014cd 81e7feff1f00                   and        edi, 0x1ffffe
014d3 85ff                           test       edi, edi
014d5 0f8498370000                   je         0x7fea683ecff3
014db 49b9f0107960ea7f0000           movabs     r9, 0x7fea607910f0
014e5 4983810801000001               add        qword ptr [r9 + 0x108], 1
014ed 4183e80f                       sub        r8d, 0xf
014f1 49b9c0077960ea7f0000           movabs     r9, 0x7fea607907c0
014fb 418b7970                       mov        edi, dword ptr [r9 + 0x70]
014ff 83c702                         add        edi, 2
01502 41897970                       mov        dword ptr [r9 + 0x70], edi
01506 81e7feff1f00                   and        edi, 0x1ffffe
0150c 85ff                           test       edi, edi
0150e 0f8480370000                   je         0x7fea683ed014
01514 49b9c0077960ea7f0000           movabs     r9, 0x7fea607907c0
0151e 498381a800000001               add        qword ptr [r9 + 0xa8], 1
01526 49b90000000000000000           movabs     r9, 0
01530 41b900000000                   mov        r9d, 0
01536 413bf1                         cmp        esi, r9d
01539 0f8c76370000                   jl         0x7fea683ed035
0153f 413bf0                         cmp        esi, r8d
01542 0f8d7a370000                   jge        0x7fea683ed042
01548 4c8bc6                         mov        r8, rsi
0154b 49b9488d78e200000000           movabs     r9, 0xe2788d48
01555 498bf9                         mov        rdi, r9
01558 48bb981a7960ea7f0000           movabs     rbx, 0x7fea60791a98
01562 488b3f                         mov        rdi, qword ptr [rdi]
01565 48c1ef2a                       shr        rdi, 0x2a
01569 48c1e709                       shl        rdi, 9
0156d 41ba00000047                   mov        r10d, 0x47000000
01573 4903fa                         add        rdi, r10
01576 41ba24000000                   mov        r10d, 0x24
0157c 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
01580 7435                           je         0x7fea683e9937
01582 4983c202                       add        r10, 2
01586 4983fa28                       cmp        r10, 0x28
0158a 75f0                           jne        0x7fea683e98fc
0158c 41ba24000000                   mov        r10d, 0x24
01592 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01597 7412                           je         0x7fea683e992b
01599 4983c202                       add        r10, 2
0159d 4983fa28                       cmp        r10, 0x28
015a1 75ef                           jne        0x7fea683e9912
015a3 41ba23000000                   mov        r10d, 0x23
015a9 eb10                           jmp        0x7fea683e993b
015ab 50                             push       rax
015ac 4833c0                         xor        rax, rax
015af 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
015b4 58                             pop        rax
015b5 ebbf                           jmp        0x7fea683e98f6
015b7 4983c201                       add        r10, 1
015bb 4a8304d301                     add        qword ptr [rbx + r10*8], 1
015c0 48bfc0087960ea7f0000           movabs     rdi, 0x7fea607908c0
015ca 8b5f70                         mov        ebx, dword ptr [rdi + 0x70]
015cd 83c302                         add        ebx, 2
015d0 895f70                         mov        dword ptr [rdi + 0x70], ebx
015d3 81e3feff1f00                   and        ebx, 0x1ffffe
015d9 85db                           test       ebx, ebx
015db 0f84ee360000                   je         0x7fea683ed04f
015e1 48bfc0087960ea7f0000           movabs     rdi, 0x7fea607908c0
015eb 488387a800000001               add        qword ptr [rdi + 0xa8], 1
015f3 49b9e8097960ea7f0000           movabs     r9, 0x7fea607909e8
015fd 418b7970                       mov        edi, dword ptr [r9 + 0x70]
01601 83c702                         add        edi, 2
01604 41897970                       mov        dword ptr [r9 + 0x70], edi
01608 81e7feff1f00                   and        edi, 0x1ffffe
0160e 85ff                           test       edi, edi
01610 0f84da360000                   je         0x7fea683ed070
01616 49b9e8097960ea7f0000           movabs     r9, 0x7fea607909e8
01620 41ff81b8000000                 inc        dword ptr [r9 + 0xb8]
01627 89b42418020000                 mov        dword ptr [rsp + 0x218], esi
0162e 49b9305e7ae200000000           movabs     r9, 0xe27a5e30
01638 498bf9                         mov        rdi, r9
0163b 48bb981a7960ea7f0000           movabs     rbx, 0x7fea60791a98
01645 4883835801000001               add        qword ptr [rbx + 0x158], 1
0164d 48bf601c7960ea7f0000           movabs     rdi, 0x7fea60791c60
01657 8b5f70                         mov        ebx, dword ptr [rdi + 0x70]
0165a 83c302                         add        ebx, 2
0165d 895f70                         mov        dword ptr [rdi + 0x70], ebx
01660 81e3feff1f00                   and        ebx, 0x1ffffe
01666 85db                           test       ebx, ebx
01668 0f84a3360000                   je         0x7fea683ed091
0166e 498bf9                         mov        rdi, r9
01671 48bb601c7960ea7f0000           movabs     rbx, 0x7fea60791c60
0167b 488383a800000001               add        qword ptr [rbx + 0xa8], 1
01683 48bf401d7960ea7f0000           movabs     rdi, 0x7fea60791d40
0168d 8b5f70                         mov        ebx, dword ptr [rdi + 0x70]
01690 83c302                         add        ebx, 2
01693 895f70                         mov        dword ptr [rdi + 0x70], ebx
01696 81e3feff1f00                   and        ebx, 0x1ffffe
0169c 85db                           test       ebx, ebx
0169e 0f848e360000                   je         0x7fea683ed0b2
016a4 48bf401d7960ea7f0000           movabs     rdi, 0x7fea60791d40
016ae 488387b800000001               add        qword ptr [rdi + 0xb8], 1
016b6 49b968127960ea7f0000           movabs     r9, 0x7fea60791268
016c0 418b7970                       mov        edi, dword ptr [r9 + 0x70]
016c4 83c702                         add        edi, 2
016c7 41897970                       mov        dword ptr [r9 + 0x70], edi
016cb 81e7feff1f00                   and        edi, 0x1ffffe
016d1 85ff                           test       edi, edi
016d3 0f847a360000                   je         0x7fea683ed0d3
016d9 49b9488d78e200000000           movabs     r9, 0xe2788d48
016e3 498bf9                         mov        rdi, r9
016e6 48bb401d7960ea7f0000           movabs     rbx, 0x7fea60791d40
016f0 488b3f                         mov        rdi, qword ptr [rdi]
016f3 48c1ef2a                       shr        rdi, 0x2a
016f7 48c1e709                       shl        rdi, 9
016fb 41ba00000047                   mov        r10d, 0x47000000
01701 4903fa                         add        rdi, r10
01704 41ba1c000000                   mov        r10d, 0x1c
0170a 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
0170e 7435                           je         0x7fea683e9ac5
01710 4983c202                       add        r10, 2
01714 4983fa20                       cmp        r10, 0x20
01718 75f0                           jne        0x7fea683e9a8a
0171a 41ba1c000000                   mov        r10d, 0x1c
01720 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01725 7412                           je         0x7fea683e9ab9
01727 4983c202                       add        r10, 2
0172b 4983fa20                       cmp        r10, 0x20
0172f 75ef                           jne        0x7fea683e9aa0
01731 41ba1b000000                   mov        r10d, 0x1b
01737 eb10                           jmp        0x7fea683e9ac9
01739 50                             push       rax
0173a 4833c0                         xor        rax, rax
0173d 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
01742 58                             pop        rax
01743 ebbf                           jmp        0x7fea683e9a84
01745 4983c201                       add        r10, 1
01749 4a8304d301                     add        qword ptr [rbx + r10*8], 1
0174e 48bf401d7960ea7f0000           movabs     rdi, 0x7fea60791d40
01758 4d8b09                         mov        r9, qword ptr [r9]
0175b 49c1e92a                       shr        r9, 0x2a
0175f 49c1e109                       shl        r9, 9
01763 41ba00000047                   mov        r10d, 0x47000000
01769 4d03ca                         add        r9, r10
0176c 41ba22000000                   mov        r10d, 0x22
01772 4e3b0cd7                       cmp        r9, qword ptr [rdi + r10*8]
01776 7435                           je         0x7fea683e9b2d
01778 4983c202                       add        r10, 2
0177c 4983fa26                       cmp        r10, 0x26
01780 75f0                           jne        0x7fea683e9af2
01782 41ba22000000                   mov        r10d, 0x22
01788 4a833cd700                     cmp        qword ptr [rdi + r10*8], 0
0178d 7412                           je         0x7fea683e9b21
0178f 4983c202                       add        r10, 2
01793 4983fa26                       cmp        r10, 0x26
01797 75ef                           jne        0x7fea683e9b08
01799 41ba21000000                   mov        r10d, 0x21
0179f eb10                           jmp        0x7fea683e9b31
017a1 50                             push       rax
017a2 4833c0                         xor        rax, rax
017a5 4e0fb10cd7                     cmpxchg    qword ptr [rdi + r10*8], r9
017aa 58                             pop        rax
017ab ebbf                           jmp        0x7fea683e9aec
017ad 4983c201                       add        r10, 1
017b1 4a8304d701                     add        qword ptr [rdi + r10*8], 1
017b6 49b9401d7960ea7f0000           movabs     r9, 0x7fea60791d40
017c0 4983813801000001               add        qword ptr [r9 + 0x138], 1
017c8 49b928137960ea7f0000           movabs     r9, 0x7fea60791328
017d2 418b7970                       mov        edi, dword ptr [r9 + 0x70]
017d6 83c702                         add        edi, 2
017d9 41897970                       mov        dword ptr [r9 + 0x70], edi
017dd 81e7feff1f00                   and        edi, 0x1ffffe
017e3 85ff                           test       edi, edi
017e5 0f8489350000                   je         0x7fea683ed0f4
017eb 49b9401d7960ea7f0000           movabs     r9, 0x7fea60791d40
017f5 4983814801000001               add        qword ptr [r9 + 0x148], 1
017fd 4963d8                         movsxd     rbx, r8d
01800 41b80c000000                   mov        r8d, 0xc
01806 4c8bcb                         mov        r9, rbx
01809 4d03c8                         add        r9, r8
0180c 49b810057960ea7f0000           movabs     r8, 0x7fea60790510
01816 418b7870                       mov        edi, dword ptr [r8 + 0x70]
0181a 83c702                         add        edi, 2
0181d 41897870                       mov        dword ptr [r8 + 0x70], edi
01821 81e7feff1f00                   and        edi, 0x1ffffe
01827 85ff                           test       edi, edi
01829 0f8466350000                   je         0x7fea683ed115
0182f 49b810057960ea7f0000           movabs     r8, 0x7fea60790510
01839 498380d800000001               add        qword ptr [r8 + 0xd8], 1
01841 49b888067960ea7f0000           movabs     r8, 0x7fea60790688
0184b 418b7870                       mov        edi, dword ptr [r8 + 0x70]
0184f 83c702                         add        edi, 2
01852 41897870                       mov        dword ptr [r8 + 0x70], edi
01856 81e7feff1f00                   and        edi, 0x1ffffe
0185c 85ff                           test       edi, edi
0185e 0f8452350000                   je         0x7fea683ed136
01864 49b8401d7960ea7f0000           movabs     r8, 0x7fea60791d40
0186e 4983806801000001               add        qword ptr [r8 + 0x168], 1
01876 49b800597be200000000           movabs     r8, 0xe27b5900
01880 48be908d78e200000000           movabs     rsi, 0xe2788d90
0188a 488bfa                         mov        rdi, rdx
0188d ba02000000                     mov        edx, 2
01892 b910000000                     mov        ecx, 0x10
01897 4c8bc7                         mov        r8, rdi
0189a 488bc7                         mov        rax, rdi
0189d bf00000000                     mov        edi, 0
018a2 48890424                       mov        qword ptr [rsp], rax
018a6 48895c2408                     mov        qword ptr [rsp + 8], rbx
018ab 49ba488d78e200000000           movabs     r10, 0xe2788d48
018b5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
018ba 49ba00597be200000000           movabs     r10, 0xe27b5900
018c4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018c9 4889842490010000               mov        qword ptr [rsp + 0x190], rax
018d1 660f1f440000                   nop        word ptr [rax + rax]
018d7 e8046c5207                     call       0x7fea6f910860
018dc 0f1f8400d4190006               nop        dword ptr [rax + rax + 0x60019d4]
018e4 4885c0                         test       rax, rax
018e7 48bb401d7960ea7f0000           movabs     rbx, 0x7fea60791d40
018f1 750c                           jne        0x7fea683e9c7f
018f3 808b7101000001                 or         byte ptr [rbx + 0x171], 1
018fa e98b000000                     jmp        0x7fea683e9d0a
018ff 488b38                         mov        rdi, qword ptr [rax]
01902 48c1ef2a                       shr        rdi, 0x2a
01906 48c1e709                       shl        rdi, 9
0190a 41ba00000047                   mov        r10d, 0x47000000
01910 4903fa                         add        rdi, r10
01913 41ba30000000                   mov        r10d, 0x30
01919 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
0191d 7435                           je         0x7fea683e9cd4
0191f 4983c202                       add        r10, 2
01923 4983fa34                       cmp        r10, 0x34
01927 75f0                           jne        0x7fea683e9c99
01929 41ba30000000                   mov        r10d, 0x30
0192f 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01934 7412                           je         0x7fea683e9cc8
01936 4983c202                       add        r10, 2
0193a 4983fa34                       cmp        r10, 0x34
0193e 75ef                           jne        0x7fea683e9caf
01940 41ba2f000000                   mov        r10d, 0x2f
01946 eb10                           jmp        0x7fea683e9cd8
01948 50                             push       rax
01949 4833c0                         xor        rax, rax
0194c 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
01951 58                             pop        rax
01952 ebbf                           jmp        0x7fea683e9c93
01954 4983c201                       add        r10, 1
01958 4a8304d301                     add        qword ptr [rbx + r10*8], 1
0195d 48bf0006144700000000           movabs     rdi, 0x47140600
01967 488b18                         mov        rbx, qword ptr [rax]
0196a 48c1eb2a                       shr        rbx, 0x2a
0196e 48c1e309                       shl        rbx, 9
01972 41ba00000047                   mov        r10d, 0x47000000
01978 4903da                         add        rbx, r10
0197b 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
0197f 0f8552340000                   jne        0x7fea683ed157
01985 e900000000                     jmp        0x7fea683e9d0a
0198a 488bf8                         mov        rdi, rax
0198d 4889bc2420020000               mov        qword ptr [rsp + 0x220], rdi
01995 483b07                         cmp        rax, qword ptr [rdi]
01998 488bf7                         mov        rsi, rdi
0199b 48bb00407260ea7f0000           movabs     rbx, 0x7fea60724000
019a5 488b36                         mov        rsi, qword ptr [rsi]
019a8 48c1ee2a                       shr        rsi, 0x2a
019ac 48c1e609                       shl        rsi, 9
019b0 41ba00000047                   mov        r10d, 0x47000000
019b6 4903f2                         add        rsi, r10
019b9 41baa3000000                   mov        r10d, 0xa3
019bf 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
019c3 743b                           je         0x7fea683e9d80
019c5 4983c202                       add        r10, 2
019c9 4981faa7000000                 cmp        r10, 0xa7
019d0 75ed                           jne        0x7fea683e9d3f
019d2 41baa3000000                   mov        r10d, 0xa3
019d8 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
019dd 7415                           je         0x7fea683e9d74
019df 4983c202                       add        r10, 2
019e3 4981faa7000000                 cmp        r10, 0xa7
019ea 75ec                           jne        0x7fea683e9d58
019ec 41baa2000000                   mov        r10d, 0xa2
019f2 eb10                           jmp        0x7fea683e9d84
019f4 50                             push       rax
019f5 4833c0                         xor        rax, rax
019f8 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
019fd 58                             pop        rax
019fe ebb9                           jmp        0x7fea683e9d39
01a00 4983c201                       add        r10, 1
01a04 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01a09 48be58277960ea7f0000           movabs     rsi, 0x7fea60792758
01a13 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
01a16 83c302                         add        ebx, 2
01a19 895e70                         mov        dword ptr [rsi + 0x70], ebx
01a1c 81e3feff1f00                   and        ebx, 0x1ffffe
01a22 85db                           test       ebx, ebx
01a24 0f84bb330000                   je         0x7fea683ed165
01a2a 488bf7                         mov        rsi, rdi
01a2d 48bb58277960ea7f0000           movabs     rbx, 0x7fea60792758
01a37 488b36                         mov        rsi, qword ptr [rsi]
01a3a 48c1ee2a                       shr        rsi, 0x2a
01a3e 48c1e609                       shl        rsi, 9
01a42 41ba00000047                   mov        r10d, 0x47000000
01a48 4903f2                         add        rsi, r10
01a4b 41ba16000000                   mov        r10d, 0x16
01a51 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
01a55 7435                           je         0x7fea683e9e0c
01a57 4983c202                       add        r10, 2
01a5b 4983fa1a                       cmp        r10, 0x1a
01a5f 75f0                           jne        0x7fea683e9dd1
01a61 41ba16000000                   mov        r10d, 0x16
01a67 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01a6c 7412                           je         0x7fea683e9e00
01a6e 4983c202                       add        r10, 2
01a72 4983fa1a                       cmp        r10, 0x1a
01a76 75ef                           jne        0x7fea683e9de7
01a78 41ba15000000                   mov        r10d, 0x15
01a7e eb10                           jmp        0x7fea683e9e10
01a80 50                             push       rax
01a81 4833c0                         xor        rax, rax
01a84 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
01a89 58                             pop        rax
01a8a ebbf                           jmp        0x7fea683e9dcb
01a8c 4983c201                       add        r10, 1
01a90 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01a95 488bf7                         mov        rsi, rdi
01a98 0f1f440000                     nop        dword ptr [rax + rax]
01a9d 48b810f03944ea7f0000           movabs     rax, 0x7fea4439f010
01aa7 e834655207                     call       0x7fea6f910360
01aac 0f1f8400a41b0007               nop        dword ptr [rax + rax + 0x7001ba4]
01ab4 488bbc2480010000               mov        rdi, qword ptr [rsp + 0x180]
01abc 8b7708                         mov        esi, dword ptr [rdi + 8]
01abf 48bb58277960ea7f0000           movabs     rbx, 0x7fea60792758
01ac9 488383d800000001               add        qword ptr [rbx + 0xd8], 1
01ad1 48bbf0107960ea7f0000           movabs     rbx, 0x7fea607910f0
01adb 8b5370                         mov        edx, dword ptr [rbx + 0x70]
01ade 83c202                         add        edx, 2
01ae1 895370                         mov        dword ptr [rbx + 0x70], edx
01ae4 81e2feff1f00                   and        edx, 0x1ffffe
01aea 85d2                           test       edx, edx
01aec 0f8419330000                   je         0x7fea683ed18b
01af2 448b9c2414020000               mov        r11d, dword ptr [rsp + 0x214]
01afa 48bbf0107960ea7f0000           movabs     rbx, 0x7fea607910f0
01b04 4883830801000001               add        qword ptr [rbx + 0x108], 1
01b0c ffc8                           dec        eax
01b0e 2bf0                           sub        esi, eax
01b10 48bbc0077960ea7f0000           movabs     rbx, 0x7fea607907c0
01b1a 8b4370                         mov        eax, dword ptr [rbx + 0x70]
01b1d 83c002                         add        eax, 2
01b20 894370                         mov        dword ptr [rbx + 0x70], eax
01b23 25feff1f00                     and        eax, 0x1ffffe
01b28 85c0                           test       eax, eax
01b2a 0f84fc320000                   je         0x7fea683ed1ac
01b30 48bbc0077960ea7f0000           movabs     rbx, 0x7fea607907c0
01b3a 488383a800000001               add        qword ptr [rbx + 0xa8], 1
01b42 48bb0000000000000000           movabs     rbx, 0
01b4c bb00000000                     mov        ebx, 0
01b51 443bdb                         cmp        r11d, ebx
01b54 0f8cf3320000                   jl         0x7fea683ed1cd
01b5a 443bde                         cmp        r11d, esi
01b5d 0f8df7320000                   jge        0x7fea683ed1da
01b63 498bdb                         mov        rbx, r11
01b66 899c241c020000                 mov        dword ptr [rsp + 0x21c], ebx
01b6d 44899c2414020000               mov        dword ptr [rsp + 0x214], r11d
01b75 4889bc2480010000               mov        qword ptr [rsp + 0x180], rdi
01b7d 488bbc2420020000               mov        rdi, qword ptr [rsp + 0x220]
01b85 488bf7                         mov        rsi, rdi
01b88 48ba58277960ea7f0000           movabs     rdx, 0x7fea60792758
01b92 488b36                         mov        rsi, qword ptr [rsi]
01b95 48c1ee2a                       shr        rsi, 0x2a
01b99 48c1e609                       shl        rsi, 9
01b9d 41ba00000047                   mov        r10d, 0x47000000
01ba3 4903f2                         add        rsi, r10
01ba6 41ba1e000000                   mov        r10d, 0x1e
01bac 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01bb0 7435                           je         0x7fea683e9f67
01bb2 4983c202                       add        r10, 2
01bb6 4983fa22                       cmp        r10, 0x22
01bba 75f0                           jne        0x7fea683e9f2c
01bbc 41ba1e000000                   mov        r10d, 0x1e
01bc2 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01bc7 7412                           je         0x7fea683e9f5b
01bc9 4983c202                       add        r10, 2
01bcd 4983fa22                       cmp        r10, 0x22
01bd1 75ef                           jne        0x7fea683e9f42
01bd3 41ba1d000000                   mov        r10d, 0x1d
01bd9 eb10                           jmp        0x7fea683e9f6b
01bdb 50                             push       rax
01bdc 4833c0                         xor        rax, rax
01bdf 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
01be4 58                             pop        rax
01be5 ebbf                           jmp        0x7fea683e9f26
01be7 4983c201                       add        r10, 1
01beb 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01bf0 488bf7                         mov        rsi, rdi
01bf3 6690                           nop        
01bf5 48b838f03944ea7f0000           movabs     rax, 0x7fea4439f038
01bff e8dc635207                     call       0x7fea6f910360
01c04 0f1f8400fc1c0008               nop        dword ptr [rax + rax + 0x8001cfc]
01c0c 483b00                         cmp        rax, qword ptr [rax]
01c0f 488bf0                         mov        rsi, rax
01c12 48ba58277960ea7f0000           movabs     rdx, 0x7fea60792758
01c1c 488b36                         mov        rsi, qword ptr [rsi]
01c1f 48c1ee2a                       shr        rsi, 0x2a
01c23 48c1e609                       shl        rsi, 9
01c27 41ba00000047                   mov        r10d, 0x47000000
01c2d 4903f2                         add        rsi, r10
01c30 41ba24000000                   mov        r10d, 0x24
01c36 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01c3a 7435                           je         0x7fea683e9ff1
01c3c 4983c202                       add        r10, 2
01c40 4983fa28                       cmp        r10, 0x28
01c44 75f0                           jne        0x7fea683e9fb6
01c46 41ba24000000                   mov        r10d, 0x24
01c4c 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01c51 7412                           je         0x7fea683e9fe5
01c53 4983c202                       add        r10, 2
01c57 4983fa28                       cmp        r10, 0x28
01c5b 75ef                           jne        0x7fea683e9fcc
01c5d 41ba23000000                   mov        r10d, 0x23
01c63 eb10                           jmp        0x7fea683e9ff5
01c65 50                             push       rax
01c66 4833c0                         xor        rax, rax
01c69 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
01c6e 58                             pop        rax
01c6f ebbf                           jmp        0x7fea683e9fb0
01c71 4983c201                       add        r10, 1
01c75 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01c7a 8b7028                         mov        esi, dword ptr [rax + 0x28]
01c7d 488bd0                         mov        rdx, rax
01c80 48b958277960ea7f0000           movabs     rcx, 0x7fea60792758
01c8a 488b12                         mov        rdx, qword ptr [rdx]
01c8d 48c1ea2a                       shr        rdx, 0x2a
01c91 48c1e209                       shl        rdx, 9
01c95 41ba00000047                   mov        r10d, 0x47000000
01c9b 4903d2                         add        rdx, r10
01c9e 41ba2a000000                   mov        r10d, 0x2a
01ca4 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01ca8 7435                           je         0x7fea683ea05f
01caa 4983c202                       add        r10, 2
01cae 4983fa2e                       cmp        r10, 0x2e
01cb2 75f0                           jne        0x7fea683ea024
01cb4 41ba2a000000                   mov        r10d, 0x2a
01cba 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01cbf 7412                           je         0x7fea683ea053
01cc1 4983c202                       add        r10, 2
01cc5 4983fa2e                       cmp        r10, 0x2e
01cc9 75ef                           jne        0x7fea683ea03a
01ccb 41ba29000000                   mov        r10d, 0x29
01cd1 eb10                           jmp        0x7fea683ea063
01cd3 50                             push       rax
01cd4 4833c0                         xor        rax, rax
01cd7 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
01cdc 58                             pop        rax
01cdd ebbf                           jmp        0x7fea683ea01e
01cdf 4983c201                       add        r10, 1
01ce3 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01ce8 8b4808                         mov        ecx, dword ptr [rax + 8]
01ceb 48ba58277960ea7f0000           movabs     rdx, 0x7fea60792758
01cf5 4883827801000001               add        qword ptr [rdx + 0x178], 1
01cfd 48ba28137960ea7f0000           movabs     rdx, 0x7fea60791328
01d07 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01d0b 4183c002                       add        r8d, 2
01d0f 44894270                       mov        dword ptr [rdx + 0x70], r8d
01d13 4181e0feff1f00                 and        r8d, 0x1ffffe
01d1a 4585c0                         test       r8d, r8d
01d1d 0f8449310000                   je         0x7fea683ed1ec
01d23 48ba58277960ea7f0000           movabs     rdx, 0x7fea60792758
01d2d 4883828801000001               add        qword ptr [rdx + 0x188], 1
01d35 8b9c241c020000                 mov        ebx, dword ptr [rsp + 0x21c]
01d3c 4863db                         movsxd     rbx, ebx
01d3f ba0c000000                     mov        edx, 0xc
01d44 4c8bcb                         mov        r9, rbx
01d47 4c03ca                         add        r9, rdx
01d4a 48ba10057960ea7f0000           movabs     rdx, 0x7fea60790510
01d54 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01d58 4183c002                       add        r8d, 2
01d5c 44894270                       mov        dword ptr [rdx + 0x70], r8d
01d60 4181e0feff1f00                 and        r8d, 0x1ffffe
01d67 4585c0                         test       r8d, r8d
01d6a 0f841d310000                   je         0x7fea683ed20d
01d70 48ba10057960ea7f0000           movabs     rdx, 0x7fea60790510
01d7a 488382d800000001               add        qword ptr [rdx + 0xd8], 1
01d82 48ba88067960ea7f0000           movabs     rdx, 0x7fea60790688
01d8c 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01d90 4183c002                       add        r8d, 2
01d94 44894270                       mov        dword ptr [rdx + 0x70], r8d
01d98 4181e0feff1f00                 and        r8d, 0x1ffffe
01d9f 4585c0                         test       r8d, r8d
01da2 0f8406310000                   je         0x7fea683ed22e
01da8 48ba58277960ea7f0000           movabs     rdx, 0x7fea60792758
01db2 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
01dba 48baa8397de200000000           movabs     rdx, 0xe27d39a8
01dc4 ba02000000                     mov        edx, 2
01dc9 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
01dd1 bf00000000                     mov        edi, 0
01dd6 488b842420020000               mov        rax, qword ptr [rsp + 0x220]
01dde 48890424                       mov        qword ptr [rsp], rax
01de2 488b842480010000               mov        rax, qword ptr [rsp + 0x180]
01dea 4889442408                     mov        qword ptr [rsp + 8], rax
01def 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01df4 49baa8397de200000000           movabs     r10, 0xe27d39a8
01dfe 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e03 4889842480010000               mov        qword ptr [rsp + 0x180], rax
01e0b 0f1f4000                       nop        dword ptr [rax]
01e0f e8cc665207                     call       0x7fea6f910860
01e14 0f1f84000c1f0009               nop        dword ptr [rax + rax + 0x9001f0c]
01e1c 448b9c2414020000               mov        r11d, dword ptr [rsp + 0x214]
01e24 4183c310                       add        r11d, 0x10
01e28 8bb42418020000                 mov        esi, dword ptr [rsp + 0x218]
01e2f 83c610                         add        esi, 0x10
01e32 443b9c2404020000               cmp        r11d, dword ptr [rsp + 0x204]
01e3a ba02000000                     mov        edx, 2
01e3f 7c05                           jl         0x7fea683ea1c6
01e41 ba00000000                     mov        edx, 0
01e46 48b900407260ea7f0000           movabs     rcx, 0x7fea60724000
01e50 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
01e54 4403c2                         add        r8d, edx
01e57 44894174                       mov        dword ptr [rcx + 0x74], r8d
01e5b 85d2                           test       edx, edx
01e5d 7506                           jne        0x7fea683ea1e5
01e5f 41b802000000                   mov        r8d, 2
01e65 4181e0fe3f0000                 and        r8d, 0x3ffe
01e6c 4585c0                         test       r8d, r8d
01e6f 0f845a300000                   je         0x7fea683ed24f
01e75 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01e79 418502                         test       dword ptr [r10], eax
01e7c 443b9c2404020000               cmp        r11d, dword ptr [rsp + 0x204]
01e84 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
01e8e b940050000                     mov        ecx, 0x540
01e93 7c05                           jl         0x7fea683ea21a
01e95 b950050000                     mov        ecx, 0x550
01e9a 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01e9e 4d8d4001                       lea        r8, [r8 + 1]
01ea2 4c89040a                       mov        qword ptr [rdx + rcx], r8
01ea6 0f8c3cf5ffff                   jl         0x7fea683e9768
01eac 48be00407260ea7f0000           movabs     rsi, 0x7fea60724000
01eb6 ff8660050000                   inc        dword ptr [rsi + 0x560]
01ebc e996000000                     jmp        0x7fea683ea2d7
01ec1 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
01ecb 4883827805000001               add        qword ptr [rdx + 0x578], 1
01ed3 488bb42490010000               mov        rsi, qword ptr [rsp + 0x190]
01edb 8b9424bc010000                 mov        edx, dword ptr [rsp + 0x1bc]
01ee2 488bd9                         mov        rbx, rcx
01ee5 488b8c2480010000               mov        rcx, qword ptr [rsp + 0x180]
01eed 448b84248c010000               mov        r8d, dword ptr [rsp + 0x18c]
01ef5 4c8bcb                         mov        r9, rbx
01ef8 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
01efd 4c89442408                     mov        qword ptr [rsp + 8], r8
01f02 48890c24                       mov        qword ptr [rsp], rcx
01f06 4889542418                     mov        qword ptr [rsp + 0x18], rdx
01f0b 4889742420                     mov        qword ptr [rsp + 0x20], rsi
01f10 488bfe                         mov        rdi, rsi
01f13 488bf2                         mov        rsi, rdx
01f16 488bd1                         mov        rdx, rcx
01f19 498bc8                         mov        rcx, r8
01f1c 4d8bc1                         mov        r8, r9
01f1f e89c455107                     call       0x7fea6f8fe840
01f24 85c0                           test       eax, eax
01f26 0f842b000000                   je         0x7fea683ea2d7
01f2c 488bf8                         mov        rdi, rax
01f2f 83f7ff                         xor        edi, 0xffffffff
01f32 488b0c24                       mov        rcx, qword ptr [rsp]
01f36 4c8b442408                     mov        r8, qword ptr [rsp + 8]
01f3b 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
01f40 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
01f45 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
01f4a 442bcf                         sub        r9d, edi
01f4d 03d7                           add        edx, edi
01f4f 4403c7                         add        r8d, edi
01f52 e9992f0000                     jmp        0x7fea683ed270
01f57 8bb424fc010000                 mov        esi, dword ptr [rsp + 0x1fc]
01f5e 448bac2404020000               mov        r13d, dword ptr [rsp + 0x204]
01f66 8bbc24a4010000                 mov        edi, dword ptr [rsp + 0x1a4]
01f6d 498bdd                         mov        rbx, r13
01f70 2b9c2400020000                 sub        ebx, dword ptr [rsp + 0x200]
01f77 83ff10                         cmp        edi, 0x10
01f7a 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
01f84 b988050000                     mov        ecx, 0x588
01f89 7f05                           jg         0x7fea683ea310
01f8b b998050000                     mov        ecx, 0x598
01f90 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01f94 4d8d4001                       lea        r8, [r8 + 1]
01f98 4c89040a                       mov        qword ptr [rdx + rcx], r8
01f9c 448b9c2400020000               mov        r11d, dword ptr [rsp + 0x200]
01fa4 0f8f2c000000                   jg         0x7fea683ea356
01faa 4183fb10                       cmp        r11d, 0x10
01fae 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
01fb8 b9b8050000                     mov        ecx, 0x5b8
01fbd 7d05                           jge        0x7fea683ea344
01fbf b9a8050000                     mov        ecx, 0x5a8
01fc4 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01fc8 4d8d4001                       lea        r8, [r8 + 1]
01fcc 4c89040a                       mov        qword ptr [rdx + rcx], r8
01fd0 0f8d6b150000                   jge        0x7fea683eb8c1
01fd6 443bdf                         cmp        r11d, edi
01fd9 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
01fe3 b920060000                     mov        ecx, 0x620
01fe8 7c05                           jl         0x7fea683ea36f
01fea b930060000                     mov        ecx, 0x630
01fef 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01ff3 4d8d4001                       lea        r8, [r8 + 1]
01ff7 4c89040a                       mov        qword ptr [rdx + rcx], r8
01ffb 0f8cc9030000                   jl         0x7fea683ea74a
02001 83ff30                         cmp        edi, 0x30
02004 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
0200e b940060000                     mov        ecx, 0x640
02013 7e05                           jle        0x7fea683ea39a
02015 b950060000                     mov        ecx, 0x650
0201a 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0201e 4d8d4001                       lea        r8, [r8 + 1]
02022 4c89040a                       mov        qword ptr [rdx + rcx], r8
02026 89b4242c020000                 mov        dword ptr [rsp + 0x22c], esi
0202d 0f8ea7000000                   jle        0x7fea683ea45a
02033 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
0203d 4883826006000001               add        qword ptr [rdx + 0x660], 1
02045 488bb42480010000               mov        rsi, qword ptr [rsp + 0x180]
0204d 488bd3                         mov        rdx, rbx
02050 488b8c2480010000               mov        rcx, qword ptr [rsp + 0x180]
02058 4d8bc5                         mov        r8, r13
0205b 4c8bcf                         mov        r9, rdi
0205e 4489ac2428020000               mov        dword ptr [rsp + 0x228], r13d
02066 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
0206b 4c89442408                     mov        qword ptr [rsp + 8], r8
02070 48890c24                       mov        qword ptr [rsp], rcx
02074 4889542418                     mov        qword ptr [rsp + 0x18], rdx
02079 4889742420                     mov        qword ptr [rsp + 0x20], rsi
0207e 488bfe                         mov        rdi, rsi
02081 488bf2                         mov        rsi, rdx
02084 488bd1                         mov        rdx, rcx
02087 498bc8                         mov        rcx, r8
0208a 4d8bc1                         mov        r8, r9
0208d e82e445107                     call       0x7fea6f8fe840
02092 85c0                           test       eax, eax
02094 0f842b000000                   je         0x7fea683ea445
0209a 488bf8                         mov        rdi, rax
0209d 83f7ff                         xor        edi, 0xffffffff
020a0 488b0c24                       mov        rcx, qword ptr [rsp]
020a4 4c8b442408                     mov        r8, qword ptr [rsp + 8]
020a9 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
020ae 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
020b3 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
020b8 442bcf                         sub        r9d, edi
020bb 03d7                           add        edx, edi
020bd 4403c7                         add        r8d, edi
020c0 e93c2e0000                     jmp        0x7fea683ed281
020c5 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
020cf ff8270060000                   inc        dword ptr [rdx + 0x670]
020d5 e9f8010000                     jmp        0x7fea683ea652
020da 4489ac2428020000               mov        dword ptr [rsp + 0x228], r13d
020e2 448bac2428020000               mov        r13d, dword ptr [rsp + 0x228]
020ea 4403ac24a4010000               add        r13d, dword ptr [rsp + 0x1a4]
020f2 4489ac2438020000               mov        dword ptr [rsp + 0x238], r13d
020fa 8bbc2428020000                 mov        edi, dword ptr [rsp + 0x228]
02101 0f1f8000000000                 nop        dword ptr [rax]
02108 89bc2430020000                 mov        dword ptr [rsp + 0x230], edi
0210f 488b842480010000               mov        rax, qword ptr [rsp + 0x180]
02117 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
02121 4883828806000001               add        qword ptr [rdx + 0x688], 1
02129 48ba887e7160ea7f0000           movabs     rdx, 0x7fea60717e88
02133 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02136 83c102                         add        ecx, 2
02139 894a70                         mov        dword ptr [rdx + 0x70], ecx
0213c 81e1feff1f00                   and        ecx, 0x1ffffe
02142 85c9                           test       ecx, ecx
02144 0f84c72d0000                   je         0x7fea683ed291
0214a 660f1f440000                   nop        word ptr [rax + rax]
02150 e9ec2d0000                     jmp        0x7fea683ed2c1
02155 90                             nop        
02156 90                             nop        
02157 90                             nop        
02158 90                             nop        
02159 90                             nop        
0215a 48ba887e7160ea7f0000           movabs     rdx, 0x7fea60717e88
02164 488d92d8000000                 lea        rdx, [rdx + 0xd8]
0216b 4885c0                         test       rax, rax
0216e 750c                           jne        0x7fea683ea4fc
02170 f6420801                       test       byte ptr [rdx + 8], 1
02174 7506                           jne        0x7fea683ea4fc
02176 f048834a0801                   lock or    qword ptr [rdx + 8], 1
0217c 48be680773e200000000           movabs     rsi, 0xe2730768
02186 488bd6                         mov        rdx, rsi
02189 48b9887e7160ea7f0000           movabs     rcx, 0x7fea60717e88
02193 488b12                         mov        rdx, qword ptr [rdx]
02196 48c1ea2a                       shr        rdx, 0x2a
0219a 48c1e209                       shl        rdx, 9
0219e 41ba00000047                   mov        r10d, 0x47000000
021a4 4903d2                         add        rdx, r10
021a7 41ba16000000                   mov        r10d, 0x16
021ad 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
021b1 7435                           je         0x7fea683ea568
021b3 4983c202                       add        r10, 2
021b7 4983fa1a                       cmp        r10, 0x1a
021bb 75f0                           jne        0x7fea683ea52d
021bd 41ba16000000                   mov        r10d, 0x16
021c3 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
021c8 7412                           je         0x7fea683ea55c
021ca 4983c202                       add        r10, 2
021ce 4983fa1a                       cmp        r10, 0x1a
021d2 75ef                           jne        0x7fea683ea543
021d4 41ba15000000                   mov        r10d, 0x15
021da eb10                           jmp        0x7fea683ea56c
021dc 50                             push       rax
021dd 4833c0                         xor        rax, rax
021e0 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
021e5 58                             pop        rax
021e6 ebbf                           jmp        0x7fea683ea527
021e8 4983c201                       add        r10, 1
021ec 4a8304d101                     add        qword ptr [rcx + r10*8], 1
021f1 488bd0                         mov        rdx, rax
021f4 488bcb                         mov        rcx, rbx
021f7 899c2434020000                 mov        dword ptr [rsp + 0x234], ebx
021fe 4889842480010000               mov        qword ptr [rsp + 0x180], rax
02206 90                             nop        
02207 e8d4585207                     call       0x7fea6f90fe60
0220c 0f1f84000423000b               nop        dword ptr [rax + rax + 0xb002304]
02214 48be00407260ea7f0000           movabs     rsi, 0x7fea60724000
0221e 4883869806000001               add        qword ptr [rsi + 0x698], 1
02226 488bb42480010000               mov        rsi, qword ptr [rsp + 0x180]
0222e 8b942430020000                 mov        edx, dword ptr [rsp + 0x230]
02235 488bc8                         mov        rcx, rax
02238 0f1f8000000000                 nop        dword ptr [rax]
0223f e89c625207                     call       0x7fea6f910860
02244 0f1f84003c23000c               nop        dword ptr [rax + rax + 0xc00233c]
0224c 8bbc2430020000                 mov        edi, dword ptr [rsp + 0x230]
02253 83c708                         add        edi, 8
02256 8b9c2434020000                 mov        ebx, dword ptr [rsp + 0x234]
0225d 83c308                         add        ebx, 8
02260 3bbc2438020000                 cmp        edi, dword ptr [rsp + 0x238]
02267 be02000000                     mov        esi, 2
0226c 7c05                           jl         0x7fea683ea5f3
0226e be00000000                     mov        esi, 0
02273 48b800407260ea7f0000           movabs     rax, 0x7fea60724000
0227d 8b5074                         mov        edx, dword ptr [rax + 0x74]
02280 03d6                           add        edx, esi
02282 895074                         mov        dword ptr [rax + 0x74], edx
02285 85f6                           test       esi, esi
02287 7505                           jne        0x7fea683ea60e
02289 ba02000000                     mov        edx, 2
0228e 81e2fe3f0000                   and        edx, 0x3ffe
02294 85d2                           test       edx, edx
02296 0f84af2c0000                   je         0x7fea683ed2cb
0229c 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
022a0 418502                         test       dword ptr [r10], eax
022a3 3bbc2438020000                 cmp        edi, dword ptr [rsp + 0x238]
022aa 48be00407260ea7f0000           movabs     rsi, 0x7fea60724000
022b4 b8a8060000                     mov        eax, 0x6a8
022b9 7c05                           jl         0x7fea683ea640
022bb b8b8060000                     mov        eax, 0x6b8
022c0 488b1406                       mov        rdx, qword ptr [rsi + rax]
022c4 488d5201                       lea        rdx, [rdx + 1]
022c8 48891406                       mov        qword ptr [rsi + rax], rdx
022cc 0f8c36feffff                   jl         0x7fea683ea488
022d2 448bac2428020000               mov        r13d, dword ptr [rsp + 0x228]
022da 4403ac24a4010000               add        r13d, dword ptr [rsp + 0x1a4]
022e2 48be00407260ea7f0000           movabs     rsi, 0x7fea60724000
022ec ff86c8060000                   inc        dword ptr [rsi + 0x6c8]
022f2 8bb42470010000                 mov        esi, dword ptr [rsp + 0x170]
022f9 448b8c2474010000               mov        r9d, dword ptr [rsp + 0x174]
02301 8b9c246c010000                 mov        ebx, dword ptr [rsp + 0x16c]
02308 488b8c2478010000               mov        rcx, qword ptr [rsp + 0x178]
02310 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
02318 8b8424a0010000                 mov        eax, dword ptr [rsp + 0x1a0]
0231f 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
02327 448b9c2488010000               mov        r11d, dword ptr [rsp + 0x188]
0232f 8b94242c020000                 mov        edx, dword ptr [rsp + 0x22c]
02336 488bbc2480010000               mov        rdi, qword ptr [rsp + 0x180]
0233e 4889bc2440020000               mov        qword ptr [rsp + 0x240], rdi
02346 488bbc2450010000               mov        rdi, qword ptr [rsp + 0x150]
0234e 4889bc2448020000               mov        qword ptr [rsp + 0x248], rdi
02356 8bbc2444010000                 mov        edi, dword ptr [rsp + 0x144]
0235d 89bc243c020000                 mov        dword ptr [rsp + 0x23c], edi
02364 488bbc2458010000               mov        rdi, qword ptr [rsp + 0x158]
0236c 4889bc2450020000               mov        qword ptr [rsp + 0x250], rdi
02374 488bbc2460010000               mov        rdi, qword ptr [rsp + 0x160]
0237c 4889bc2458020000               mov        qword ptr [rsp + 0x258], rdi
02384 8bbc2468010000                 mov        edi, dword ptr [rsp + 0x168]
0238b 89bc2460020000                 mov        dword ptr [rsp + 0x260], edi
02392 488bbc2490010000               mov        rdi, qword ptr [rsp + 0x190]
0239a 4889bc2468020000               mov        qword ptr [rsp + 0x268], rdi
023a2 488bbc2498010000               mov        rdi, qword ptr [rsp + 0x198]
023aa 4489ac2468030000               mov        dword ptr [rsp + 0x368], r13d
023b2 4889bc2490030000               mov        qword ptr [rsp + 0x390], rdi
023ba 4d8beb                         mov        r13, r11
023bd 4c8b9c2468020000               mov        r11, qword ptr [rsp + 0x268]
023c5 e9801c0000                     jmp        0x7fea683ec3ca
023ca 89b4242c020000                 mov        dword ptr [rsp + 0x22c], esi
023d1 4489ac2428020000               mov        dword ptr [rsp + 0x228], r13d
023d9 4183fb10                       cmp        r11d, 0x10
023dd 48be00407260ea7f0000           movabs     rsi, 0x7fea60724000
023e7 bfe0060000                     mov        edi, 0x6e0
023ec 7c05                           jl         0x7fea683ea773
023ee bff0060000                     mov        edi, 0x6f0
023f3 488b043e                       mov        rax, qword ptr [rsi + rdi]
023f7 488d4001                       lea        rax, [rax + 1]
023fb 4889043e                       mov        qword ptr [rsi + rdi], rax
023ff 0f8c080d0000                   jl         0x7fea683eb48d
02405 448bac2428020000               mov        r13d, dword ptr [rsp + 0x228]
0240d 4403ac24a4010000               add        r13d, dword ptr [rsp + 0x1a4]
02415 8b842428020000                 mov        eax, dword ptr [rsp + 0x228]
0241c 8bb42470010000                 mov        esi, dword ptr [rsp + 0x170]
02423 448b8c2474010000               mov        r9d, dword ptr [rsp + 0x174]
0242b 448b9c246c010000               mov        r11d, dword ptr [rsp + 0x16c]
02433 488b8c2478010000               mov        rcx, qword ptr [rsp + 0x178]
0243b 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
02443 8bbc24a0010000                 mov        edi, dword ptr [rsp + 0x1a0]
0244a 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
02452 8b942488010000                 mov        edx, dword ptr [rsp + 0x188]
02459 89942464020000                 mov        dword ptr [rsp + 0x264], edx
02460 8b94242c020000                 mov        edx, dword ptr [rsp + 0x22c]
02467 89942470020000                 mov        dword ptr [rsp + 0x270], edx
0246e 488b942480010000               mov        rdx, qword ptr [rsp + 0x180]
02476 4889942478020000               mov        qword ptr [rsp + 0x278], rdx
0247e 488b942450010000               mov        rdx, qword ptr [rsp + 0x150]
02486 4889942480020000               mov        qword ptr [rsp + 0x280], rdx
0248e 8b942444010000                 mov        edx, dword ptr [rsp + 0x144]
02495 89942474020000                 mov        dword ptr [rsp + 0x274], edx
0249c 488b942458010000               mov        rdx, qword ptr [rsp + 0x158]
024a4 4889942488020000               mov        qword ptr [rsp + 0x288], rdx
024ac 488b942460010000               mov        rdx, qword ptr [rsp + 0x160]
024b4 4889942490020000               mov        qword ptr [rsp + 0x290], rdx
024bc 8b942468010000                 mov        edx, dword ptr [rsp + 0x168]
024c3 89942498020000                 mov        dword ptr [rsp + 0x298], edx
024ca 488b942490010000               mov        rdx, qword ptr [rsp + 0x190]
024d2 48899424a0020000               mov        qword ptr [rsp + 0x2a0], rdx
024da 488b942498010000               mov        rdx, qword ptr [rsp + 0x198]
024e2 89842428030000                 mov        dword ptr [rsp + 0x328], eax
024e9 4489ac2440030000               mov        dword ptr [rsp + 0x340], r13d
024f1 89b42420030000                 mov        dword ptr [rsp + 0x320], esi
024f8 44898c2444030000               mov        dword ptr [rsp + 0x344], r9d
02500 44899c2450030000               mov        dword ptr [rsp + 0x350], r11d
02508 48898c2458030000               mov        qword ptr [rsp + 0x358], rcx
02510 4c89842448030000               mov        qword ptr [rsp + 0x348], r8
02518 89bc2424030000                 mov        dword ptr [rsp + 0x324], edi
0251f 4c89b42438030000               mov        qword ptr [rsp + 0x338], r14
02527 4889942418030000               mov        qword ptr [rsp + 0x318], rdx
0252f 90                             nop        
02530 488b942478020000               mov        rdx, qword ptr [rsp + 0x278]
02538 48be00407260ea7f0000           movabs     rsi, 0x7fea60724000
02542 4883860007000001               add        qword ptr [rsi + 0x700], 1
0254a 48be981a7960ea7f0000           movabs     rsi, 0x7fea60791a98
02554 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
02557 83c702                         add        edi, 2
0255a 897e70                         mov        dword ptr [rsi + 0x70], edi
0255d 81e7feff1f00                   and        edi, 0x1ffffe
02563 85ff                           test       edi, edi
02565 0f84012a0000                   je         0x7fea683ed2ec
0256b 48be488d78e200000000           movabs     rsi, 0xe2788d48
02575 48bf981a7960ea7f0000           movabs     rdi, 0x7fea60791a98
0257f 488b36                         mov        rsi, qword ptr [rsi]
02582 48c1ee2a                       shr        rsi, 0x2a
02586 48c1e609                       shl        rsi, 9
0258a 41ba00000047                   mov        r10d, 0x47000000
02590 4903f2                         add        rsi, r10
02593 41ba16000000                   mov        r10d, 0x16
02599 4a3b34d7                       cmp        rsi, qword ptr [rdi + r10*8]
0259d 7435                           je         0x7fea683ea954
0259f 4983c202                       add        r10, 2
025a3 4983fa1a                       cmp        r10, 0x1a
025a7 75f0                           jne        0x7fea683ea919
025a9 41ba16000000                   mov        r10d, 0x16
025af 4a833cd700                     cmp        qword ptr [rdi + r10*8], 0
025b4 7412                           je         0x7fea683ea948
025b6 4983c202                       add        r10, 2
025ba 4983fa1a                       cmp        r10, 0x1a
025be 75ef                           jne        0x7fea683ea92f
025c0 41ba15000000                   mov        r10d, 0x15
025c6 eb10                           jmp        0x7fea683ea958
025c8 50                             push       rax
025c9 4833c0                         xor        rax, rax
025cc 4a0fb134d7                     cmpxchg    qword ptr [rdi + r10*8], rsi
025d1 58                             pop        rax
025d2 ebbf                           jmp        0x7fea683ea913
025d4 4983c201                       add        r10, 1
025d8 4a8304d701                     add        qword ptr [rdi + r10*8], 1
025dd 8b4208                         mov        eax, dword ptr [rdx + 8]
025e0 8984242c030000                 mov        dword ptr [rsp + 0x32c], eax
025e7 48be981a7960ea7f0000           movabs     rsi, 0x7fea60791a98
025f1 488386d800000001               add        qword ptr [rsi + 0xd8], 1
025f9 48bef0107960ea7f0000           movabs     rsi, 0x7fea607910f0
02603 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
02606 83c702                         add        edi, 2
02609 897e70                         mov        dword ptr [rsi + 0x70], edi
0260c 81e7feff1f00                   and        edi, 0x1ffffe
02612 85ff                           test       edi, edi
02614 0f8478290000                   je         0x7fea683ed312
0261a 48bef0107960ea7f0000           movabs     rsi, 0x7fea607910f0
02624 4883860801000001               add        qword ptr [rsi + 0x108], 1
0262c 488bf0                         mov        rsi, rax
0262f 83ee0f                         sub        esi, 0xf
02632 48bfc0077960ea7f0000           movabs     rdi, 0x7fea607907c0
0263c 8b4770                         mov        eax, dword ptr [rdi + 0x70]
0263f 83c002                         add        eax, 2
02642 894770                         mov        dword ptr [rdi + 0x70], eax
02645 25feff1f00                     and        eax, 0x1ffffe
0264a 85c0                           test       eax, eax
0264c 0f8461290000                   je         0x7fea683ed333
02652 48bfc0077960ea7f0000           movabs     rdi, 0x7fea607907c0
0265c 488387a800000001               add        qword ptr [rdi + 0xa8], 1
02664 48bf0000000000000000           movabs     rdi, 0
0266e bf00000000                     mov        edi, 0
02673 3bdf                           cmp        ebx, edi
02675 0f8c59290000                   jl         0x7fea683ed354
0267b 3bde                           cmp        ebx, esi
0267d 0f8d5e290000                   jge        0x7fea683ed361
02683 488bf3                         mov        rsi, rbx
02686 89b42430030000                 mov        dword ptr [rsp + 0x330], esi
0268d 899c2434030000                 mov        dword ptr [rsp + 0x334], ebx
02694 48bf488d78e200000000           movabs     rdi, 0xe2788d48
0269e 488bc7                         mov        rax, rdi
026a1 48be981a7960ea7f0000           movabs     rsi, 0x7fea60791a98
026ab 488b00                         mov        rax, qword ptr [rax]
026ae 48c1e82a                       shr        rax, 0x2a
026b2 48c1e009                       shl        rax, 9
026b6 41ba00000047                   mov        r10d, 0x47000000
026bc 4903c2                         add        rax, r10
026bf 41ba24000000                   mov        r10d, 0x24
026c5 4a3b04d6                       cmp        rax, qword ptr [rsi + r10*8]
026c9 743b                           je         0x7fea683eaa86
026cb 4983c202                       add        r10, 2
026cf 4983fa28                       cmp        r10, 0x28
026d3 75f0                           jne        0x7fea683eaa45
026d5 41ba24000000                   mov        r10d, 0x24
026db 4a833cd600                     cmp        qword ptr [rsi + r10*8], 0
026e0 7412                           je         0x7fea683eaa74
026e2 4983c202                       add        r10, 2
026e6 4983fa28                       cmp        r10, 0x28
026ea 75ef                           jne        0x7fea683eaa5b
026ec 41ba23000000                   mov        r10d, 0x23
026f2 eb16                           jmp        0x7fea683eaa8a
026f4 53                             push       rbx
026f5 488bd8                         mov        rbx, rax
026f8 4833c0                         xor        rax, rax
026fb 4a0fb11cd6                     cmpxchg    qword ptr [rsi + r10*8], rbx
02700 488bc3                         mov        rax, rbx
02703 5b                             pop        rbx
02704 ebb9                           jmp        0x7fea683eaa3f
02706 4983c201                       add        r10, 1
0270a 4a8304d601                     add        qword ptr [rsi + r10*8], 1
0270f 48bec0087960ea7f0000           movabs     rsi, 0x7fea607908c0
02719 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
0271c 83c302                         add        ebx, 2
0271f 895e70                         mov        dword ptr [rsi + 0x70], ebx
02722 81e3feff1f00                   and        ebx, 0x1ffffe
02728 85db                           test       ebx, ebx
0272a 0f84be280000                   je         0x7fea683ed36e
02730 48bec0087960ea7f0000           movabs     rsi, 0x7fea607908c0
0273a 488386a800000001               add        qword ptr [rsi + 0xa8], 1
02742 48bee8097960ea7f0000           movabs     rsi, 0x7fea607909e8
0274c 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
0274f 83c702                         add        edi, 2
02752 897e70                         mov        dword ptr [rsi + 0x70], edi
02755 81e7feff1f00                   and        edi, 0x1ffffe
0275b 85ff                           test       edi, edi
0275d 0f84ac280000                   je         0x7fea683ed38f
02763 48bee8097960ea7f0000           movabs     rsi, 0x7fea607909e8
0276d ff86b8000000                   inc        dword ptr [rsi + 0xb8]
02773 8bb42430030000                 mov        esi, dword ptr [rsp + 0x330]
0277a 48bb305e7ae200000000           movabs     rbx, 0xe27a5e30
02784 488bc3                         mov        rax, rbx
02787 49bb981a7960ea7f0000           movabs     r11, 0x7fea60791a98
02791 4983835801000001               add        qword ptr [r11 + 0x158], 1
02799 48b8601c7960ea7f0000           movabs     rax, 0x7fea60791c60
027a3 448b5870                       mov        r11d, dword ptr [rax + 0x70]
027a7 4183c302                       add        r11d, 2
027ab 44895870                       mov        dword ptr [rax + 0x70], r11d
027af 4181e3feff1f00                 and        r11d, 0x1ffffe
027b6 4585db                         test       r11d, r11d
027b9 0f8471280000                   je         0x7fea683ed3b0
027bf 488bc3                         mov        rax, rbx
027c2 49bb601c7960ea7f0000           movabs     r11, 0x7fea60791c60
027cc 498383a800000001               add        qword ptr [r11 + 0xa8], 1
027d4 48b8401d7960ea7f0000           movabs     rax, 0x7fea60791d40
027de 448b5870                       mov        r11d, dword ptr [rax + 0x70]
027e2 4183c302                       add        r11d, 2
027e6 44895870                       mov        dword ptr [rax + 0x70], r11d
027ea 4181e3feff1f00                 and        r11d, 0x1ffffe
027f1 4585db                         test       r11d, r11d
027f4 0f8457280000                   je         0x7fea683ed3d1
027fa 48b8401d7960ea7f0000           movabs     rax, 0x7fea60791d40
02804 488380b800000001               add        qword ptr [rax + 0xb8], 1
0280c 48bb68127960ea7f0000           movabs     rbx, 0x7fea60791268
02816 8b4370                         mov        eax, dword ptr [rbx + 0x70]
02819 83c002                         add        eax, 2
0281c 894370                         mov        dword ptr [rbx + 0x70], eax
0281f 25feff1f00                     and        eax, 0x1ffffe
02824 85c0                           test       eax, eax
02826 0f8446280000                   je         0x7fea683ed3f2
0282c 48bb488d78e200000000           movabs     rbx, 0xe2788d48
02836 488bc3                         mov        rax, rbx
02839 49bb401d7960ea7f0000           movabs     r11, 0x7fea60791d40
02843 488b00                         mov        rax, qword ptr [rax]
02846 48c1e82a                       shr        rax, 0x2a
0284a 48c1e009                       shl        rax, 9
0284e 41ba00000047                   mov        r10d, 0x47000000
02854 4903c2                         add        rax, r10
02857 41ba1c000000                   mov        r10d, 0x1c
0285d 4b3b04d3                       cmp        rax, qword ptr [r11 + r10*8]
02861 743b                           je         0x7fea683eac1e
02863 4983c202                       add        r10, 2
02867 4983fa20                       cmp        r10, 0x20
0286b 75f0                           jne        0x7fea683eabdd
0286d 41ba1c000000                   mov        r10d, 0x1c
02873 4b833cd300                     cmp        qword ptr [r11 + r10*8], 0
02878 7412                           je         0x7fea683eac0c
0287a 4983c202                       add        r10, 2
0287e 4983fa20                       cmp        r10, 0x20
02882 75ef                           jne        0x7fea683eabf3
02884 41ba1b000000                   mov        r10d, 0x1b
0288a eb16                           jmp        0x7fea683eac22
0288c 53                             push       rbx
0288d 488bd8                         mov        rbx, rax
02890 4833c0                         xor        rax, rax
02893 4b0fb11cd3                     cmpxchg    qword ptr [r11 + r10*8], rbx
02898 488bc3                         mov        rax, rbx
0289b 5b                             pop        rbx
0289c ebb9                           jmp        0x7fea683eabd7
0289e 4983c201                       add        r10, 1
028a2 4b8304d301                     add        qword ptr [r11 + r10*8], 1
028a7 48b8401d7960ea7f0000           movabs     rax, 0x7fea60791d40
028b1 488b1b                         mov        rbx, qword ptr [rbx]
028b4 48c1eb2a                       shr        rbx, 0x2a
028b8 48c1e309                       shl        rbx, 9
028bc 41ba00000047                   mov        r10d, 0x47000000
028c2 4903da                         add        rbx, r10
028c5 41ba22000000                   mov        r10d, 0x22
028cb 4a3b1cd0                       cmp        rbx, qword ptr [rax + r10*8]
028cf 743b                           je         0x7fea683eac8c
028d1 4983c202                       add        r10, 2
028d5 4983fa26                       cmp        r10, 0x26
028d9 75f0                           jne        0x7fea683eac4b
028db 41ba22000000                   mov        r10d, 0x22
028e1 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
028e6 7412                           je         0x7fea683eac7a
028e8 4983c202                       add        r10, 2
028ec 4983fa26                       cmp        r10, 0x26
028f0 75ef                           jne        0x7fea683eac61
028f2 41ba21000000                   mov        r10d, 0x21
028f8 eb16                           jmp        0x7fea683eac90
028fa 51                             push       rcx
028fb 488bc8                         mov        rcx, rax
028fe 4833c0                         xor        rax, rax
02901 4a0fb11cd1                     cmpxchg    qword ptr [rcx + r10*8], rbx
02906 488bc1                         mov        rax, rcx
02909 59                             pop        rcx
0290a ebb9                           jmp        0x7fea683eac45
0290c 4983c201                       add        r10, 1
02910 4a8304d001                     add        qword ptr [rax + r10*8], 1
02915 48bb401d7960ea7f0000           movabs     rbx, 0x7fea60791d40
0291f 4883833801000001               add        qword ptr [rbx + 0x138], 1
02927 48bb28137960ea7f0000           movabs     rbx, 0x7fea60791328
02931 8b4370                         mov        eax, dword ptr [rbx + 0x70]
02934 83c002                         add        eax, 2
02937 894370                         mov        dword ptr [rbx + 0x70], eax
0293a 25feff1f00                     and        eax, 0x1ffffe
0293f 85c0                           test       eax, eax
02941 0f844c270000                   je         0x7fea683ed413
02947 48bb401d7960ea7f0000           movabs     rbx, 0x7fea60791d40
02951 4883834801000001               add        qword ptr [rbx + 0x148], 1
02959 4863de                         movsxd     rbx, esi
0295c be0c000000                     mov        esi, 0xc
02961 488bc3                         mov        rax, rbx
02964 4803c6                         add        rax, rsi
02967 48be10057960ea7f0000           movabs     rsi, 0x7fea60790510
02971 448b5e70                       mov        r11d, dword ptr [rsi + 0x70]
02975 4183c302                       add        r11d, 2
02979 44895e70                       mov        dword ptr [rsi + 0x70], r11d
0297d 4181e3feff1f00                 and        r11d, 0x1ffffe
02984 4585db                         test       r11d, r11d
02987 0f8427270000                   je         0x7fea683ed434
0298d 48be10057960ea7f0000           movabs     rsi, 0x7fea60790510
02997 488386d800000001               add        qword ptr [rsi + 0xd8], 1
0299f 48be88067960ea7f0000           movabs     rsi, 0x7fea60790688
029a9 448b5e70                       mov        r11d, dword ptr [rsi + 0x70]
029ad 4183c302                       add        r11d, 2
029b1 44895e70                       mov        dword ptr [rsi + 0x70], r11d
029b5 4181e3feff1f00                 and        r11d, 0x1ffffe
029bc 4585db                         test       r11d, r11d
029bf 0f8410270000                   je         0x7fea683ed455
029c5 48be401d7960ea7f0000           movabs     rsi, 0x7fea60791d40
029cf 4883866801000001               add        qword ptr [rsi + 0x168], 1
029d7 48be00597be200000000           movabs     rsi, 0xe27b5900
029e1 48be908d78e200000000           movabs     rsi, 0xe2788d90
029eb 4c8bda                         mov        r11, rdx
029ee ba02000000                     mov        edx, 2
029f3 b910000000                     mov        ecx, 0x10
029f8 4d8bc3                         mov        r8, r11
029fb 4c8bc8                         mov        r9, rax
029fe bf00000000                     mov        edi, 0
02a03 4c891c24                       mov        qword ptr [rsp], r11
02a07 48895c2408                     mov        qword ptr [rsp + 8], rbx
02a0c 49ba488d78e200000000           movabs     r10, 0xe2788d48
02a16 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02a1b 49ba00597be200000000           movabs     r10, 0xe27b5900
02a25 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02a2a 4c899c2478020000               mov        qword ptr [rsp + 0x278], r11
02a32 0f1f440000                     nop        dword ptr [rax + rax]
02a37 e8a45a5207                     call       0x7fea6f910860
02a3c 0f1f8400342b000e               nop        dword ptr [rax + rax + 0xe002b34]
02a44 4885c0                         test       rax, rax
02a47 48bb401d7960ea7f0000           movabs     rbx, 0x7fea60791d40
02a51 750c                           jne        0x7fea683eaddf
02a53 808b7101000001                 or         byte ptr [rbx + 0x171], 1
02a5a e98b000000                     jmp        0x7fea683eae6a
02a5f 488b38                         mov        rdi, qword ptr [rax]
02a62 48c1ef2a                       shr        rdi, 0x2a
02a66 48c1e709                       shl        rdi, 9
02a6a 41ba00000047                   mov        r10d, 0x47000000
02a70 4903fa                         add        rdi, r10
02a73 41ba30000000                   mov        r10d, 0x30
02a79 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
02a7d 7435                           je         0x7fea683eae34
02a7f 4983c202                       add        r10, 2
02a83 4983fa34                       cmp        r10, 0x34
02a87 75f0                           jne        0x7fea683eadf9
02a89 41ba30000000                   mov        r10d, 0x30
02a8f 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02a94 7412                           je         0x7fea683eae28
02a96 4983c202                       add        r10, 2
02a9a 4983fa34                       cmp        r10, 0x34
02a9e 75ef                           jne        0x7fea683eae0f
02aa0 41ba2f000000                   mov        r10d, 0x2f
02aa6 eb10                           jmp        0x7fea683eae38
02aa8 50                             push       rax
02aa9 4833c0                         xor        rax, rax
02aac 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
02ab1 58                             pop        rax
02ab2 ebbf                           jmp        0x7fea683eadf3
02ab4 4983c201                       add        r10, 1
02ab8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02abd 48bf0006144700000000           movabs     rdi, 0x47140600
02ac7 488b18                         mov        rbx, qword ptr [rax]
02aca 48c1eb2a                       shr        rbx, 0x2a
02ace 48c1e309                       shl        rbx, 9
02ad2 41ba00000047                   mov        r10d, 0x47000000
02ad8 4903da                         add        rbx, r10
02adb 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
02adf 0f8511260000                   jne        0x7fea683ed476
02ae5 e900000000                     jmp        0x7fea683eae6a
02aea 488bf8                         mov        rdi, rax
02aed 4889bc2460030000               mov        qword ptr [rsp + 0x360], rdi
02af5 483b07                         cmp        rax, qword ptr [rdi]
02af8 488bf7                         mov        rsi, rdi
02afb 48bb00407260ea7f0000           movabs     rbx, 0x7fea60724000
02b05 488b36                         mov        rsi, qword ptr [rsi]
02b08 48c1ee2a                       shr        rsi, 0x2a
02b0c 48c1e609                       shl        rsi, 9
02b10 41ba00000047                   mov        r10d, 0x47000000
02b16 4903f2                         add        rsi, r10
02b19 41bae3000000                   mov        r10d, 0xe3
02b1f 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02b23 743b                           je         0x7fea683eaee0
02b25 4983c202                       add        r10, 2
02b29 4981fae7000000                 cmp        r10, 0xe7
02b30 75ed                           jne        0x7fea683eae9f
02b32 41bae3000000                   mov        r10d, 0xe3
02b38 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02b3d 7415                           je         0x7fea683eaed4
02b3f 4983c202                       add        r10, 2
02b43 4981fae7000000                 cmp        r10, 0xe7
02b4a 75ec                           jne        0x7fea683eaeb8
02b4c 41bae2000000                   mov        r10d, 0xe2
02b52 eb10                           jmp        0x7fea683eaee4
02b54 50                             push       rax
02b55 4833c0                         xor        rax, rax
02b58 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
02b5d 58                             pop        rax
02b5e ebb9                           jmp        0x7fea683eae99
02b60 4983c201                       add        r10, 1
02b64 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02b69 48be58277960ea7f0000           movabs     rsi, 0x7fea60792758
02b73 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
02b76 83c302                         add        ebx, 2
02b79 895e70                         mov        dword ptr [rsi + 0x70], ebx
02b7c 81e3feff1f00                   and        ebx, 0x1ffffe
02b82 85db                           test       ebx, ebx
02b84 0f847a250000                   je         0x7fea683ed484
02b8a 488bf7                         mov        rsi, rdi
02b8d 48bb58277960ea7f0000           movabs     rbx, 0x7fea60792758
02b97 488b36                         mov        rsi, qword ptr [rsi]
02b9a 48c1ee2a                       shr        rsi, 0x2a
02b9e 48c1e609                       shl        rsi, 9
02ba2 41ba00000047                   mov        r10d, 0x47000000
02ba8 4903f2                         add        rsi, r10
02bab 41ba16000000                   mov        r10d, 0x16
02bb1 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02bb5 7435                           je         0x7fea683eaf6c
02bb7 4983c202                       add        r10, 2
02bbb 4983fa1a                       cmp        r10, 0x1a
02bbf 75f0                           jne        0x7fea683eaf31
02bc1 41ba16000000                   mov        r10d, 0x16
02bc7 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02bcc 7412                           je         0x7fea683eaf60
02bce 4983c202                       add        r10, 2
02bd2 4983fa1a                       cmp        r10, 0x1a
02bd6 75ef                           jne        0x7fea683eaf47
02bd8 41ba15000000                   mov        r10d, 0x15
02bde eb10                           jmp        0x7fea683eaf70
02be0 50                             push       rax
02be1 4833c0                         xor        rax, rax
02be4 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
02be9 58                             pop        rax
02bea ebbf                           jmp        0x7fea683eaf2b
02bec 4983c201                       add        r10, 1
02bf0 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02bf5 488bf7                         mov        rsi, rdi
02bf8 0f1f440000                     nop        dword ptr [rax + rax]
02bfd 48b860f03944ea7f0000           movabs     rax, 0x7fea4439f060
02c07 e8d4535207                     call       0x7fea6f910360
02c0c 0f1f8400042d000f               nop        dword ptr [rax + rax + 0xf002d04]
02c14 48be58277960ea7f0000           movabs     rsi, 0x7fea60792758
02c1e 488386d800000001               add        qword ptr [rsi + 0xd8], 1
02c26 48bef0107960ea7f0000           movabs     rsi, 0x7fea607910f0
02c30 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
02c33 83c702                         add        edi, 2
02c36 897e70                         mov        dword ptr [rsi + 0x70], edi
02c39 81e7feff1f00                   and        edi, 0x1ffffe
02c3f 85ff                           test       edi, edi
02c41 0f84de240000                   je         0x7fea683ed4a5
02c47 8bb4242c030000                 mov        esi, dword ptr [rsp + 0x32c]
02c4e 8bbc2428030000                 mov        edi, dword ptr [rsp + 0x328]
02c55 48bbf0107960ea7f0000           movabs     rbx, 0x7fea607910f0
02c5f 4883830801000001               add        qword ptr [rbx + 0x108], 1
02c67 ffc8                           dec        eax
02c69 2bf0                           sub        esi, eax
02c6b 48bbc0077960ea7f0000           movabs     rbx, 0x7fea607907c0
02c75 8b4370                         mov        eax, dword ptr [rbx + 0x70]
02c78 83c002                         add        eax, 2
02c7b 894370                         mov        dword ptr [rbx + 0x70], eax
02c7e 25feff1f00                     and        eax, 0x1ffffe
02c83 85c0                           test       eax, eax
02c85 0f84bb240000                   je         0x7fea683ed4c6
02c8b 48bbc0077960ea7f0000           movabs     rbx, 0x7fea607907c0
02c95 488383a800000001               add        qword ptr [rbx + 0xa8], 1
02c9d 48bb0000000000000000           movabs     rbx, 0
02ca7 bb00000000                     mov        ebx, 0
02cac 3bfb                           cmp        edi, ebx
02cae 0f8cb3240000                   jl         0x7fea683ed4e7
02cb4 3bfe                           cmp        edi, esi
02cb6 0f8db8240000                   jge        0x7fea683ed4f4
02cbc 488bc7                         mov        rax, rdi
02cbf 89842454030000                 mov        dword ptr [rsp + 0x354], eax
02cc6 89bc2428030000                 mov        dword ptr [rsp + 0x328], edi
02ccd 488bbc2460030000               mov        rdi, qword ptr [rsp + 0x360]
02cd5 488bf7                         mov        rsi, rdi
02cd8 48b958277960ea7f0000           movabs     rcx, 0x7fea60792758
02ce2 488b36                         mov        rsi, qword ptr [rsi]
02ce5 48c1ee2a                       shr        rsi, 0x2a
02ce9 48c1e609                       shl        rsi, 9
02ced 41ba00000047                   mov        r10d, 0x47000000
02cf3 4903f2                         add        rsi, r10
02cf6 41ba1e000000                   mov        r10d, 0x1e
02cfc 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
02d00 7435                           je         0x7fea683eb0b7
02d02 4983c202                       add        r10, 2
02d06 4983fa22                       cmp        r10, 0x22
02d0a 75f0                           jne        0x7fea683eb07c
02d0c 41ba1e000000                   mov        r10d, 0x1e
02d12 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02d17 7412                           je         0x7fea683eb0ab
02d19 4983c202                       add        r10, 2
02d1d 4983fa22                       cmp        r10, 0x22
02d21 75ef                           jne        0x7fea683eb092
02d23 41ba1d000000                   mov        r10d, 0x1d
02d29 eb10                           jmp        0x7fea683eb0bb
02d2b 50                             push       rax
02d2c 4833c0                         xor        rax, rax
02d2f 4a0fb134d1                     cmpxchg    qword ptr [rcx + r10*8], rsi
02d34 58                             pop        rax
02d35 ebbf                           jmp        0x7fea683eb076
02d37 4983c201                       add        r10, 1
02d3b 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02d40 488bf7                         mov        rsi, rdi
02d43 6690                           nop        
02d45 48b888f03944ea7f0000           movabs     rax, 0x7fea4439f088
02d4f e88c525207                     call       0x7fea6f910360
02d54 0f1f84004c2e0010               nop        dword ptr [rax + rax + 0x10002e4c]
02d5c 483b00                         cmp        rax, qword ptr [rax]
02d5f 488bf0                         mov        rsi, rax
02d62 48ba58277960ea7f0000           movabs     rdx, 0x7fea60792758
02d6c 488b36                         mov        rsi, qword ptr [rsi]
02d6f 48c1ee2a                       shr        rsi, 0x2a
02d73 48c1e609                       shl        rsi, 9
02d77 41ba00000047                   mov        r10d, 0x47000000
02d7d 4903f2                         add        rsi, r10
02d80 41ba24000000                   mov        r10d, 0x24
02d86 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02d8a 7435                           je         0x7fea683eb141
02d8c 4983c202                       add        r10, 2
02d90 4983fa28                       cmp        r10, 0x28
02d94 75f0                           jne        0x7fea683eb106
02d96 41ba24000000                   mov        r10d, 0x24
02d9c 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02da1 7412                           je         0x7fea683eb135
02da3 4983c202                       add        r10, 2
02da7 4983fa28                       cmp        r10, 0x28
02dab 75ef                           jne        0x7fea683eb11c
02dad 41ba23000000                   mov        r10d, 0x23
02db3 eb10                           jmp        0x7fea683eb145
02db5 50                             push       rax
02db6 4833c0                         xor        rax, rax
02db9 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
02dbe 58                             pop        rax
02dbf ebbf                           jmp        0x7fea683eb100
02dc1 4983c201                       add        r10, 1
02dc5 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02dca 8b7028                         mov        esi, dword ptr [rax + 0x28]
02dcd 488bd0                         mov        rdx, rax
02dd0 48b958277960ea7f0000           movabs     rcx, 0x7fea60792758
02dda 488b12                         mov        rdx, qword ptr [rdx]
02ddd 48c1ea2a                       shr        rdx, 0x2a
02de1 48c1e209                       shl        rdx, 9
02de5 41ba00000047                   mov        r10d, 0x47000000
02deb 4903d2                         add        rdx, r10
02dee 41ba2a000000                   mov        r10d, 0x2a
02df4 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02df8 7435                           je         0x7fea683eb1af
02dfa 4983c202                       add        r10, 2
02dfe 4983fa2e                       cmp        r10, 0x2e
02e02 75f0                           jne        0x7fea683eb174
02e04 41ba2a000000                   mov        r10d, 0x2a
02e0a 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02e0f 7412                           je         0x7fea683eb1a3
02e11 4983c202                       add        r10, 2
02e15 4983fa2e                       cmp        r10, 0x2e
02e19 75ef                           jne        0x7fea683eb18a
02e1b 41ba29000000                   mov        r10d, 0x29
02e21 eb10                           jmp        0x7fea683eb1b3
02e23 50                             push       rax
02e24 4833c0                         xor        rax, rax
02e27 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
02e2c 58                             pop        rax
02e2d ebbf                           jmp        0x7fea683eb16e
02e2f 4983c201                       add        r10, 1
02e33 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02e38 8b4808                         mov        ecx, dword ptr [rax + 8]
02e3b 48ba58277960ea7f0000           movabs     rdx, 0x7fea60792758
02e45 4883827801000001               add        qword ptr [rdx + 0x178], 1
02e4d 48ba28137960ea7f0000           movabs     rdx, 0x7fea60791328
02e57 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02e5b 4183c002                       add        r8d, 2
02e5f 44894270                       mov        dword ptr [rdx + 0x70], r8d
02e63 4181e0feff1f00                 and        r8d, 0x1ffffe
02e6a 4585c0                         test       r8d, r8d
02e6d 0f8413230000                   je         0x7fea683ed506
02e73 48ba58277960ea7f0000           movabs     rdx, 0x7fea60792758
02e7d 4883828801000001               add        qword ptr [rdx + 0x188], 1
02e85 8b842454030000                 mov        eax, dword ptr [rsp + 0x354]
02e8c 4863c0                         movsxd     rax, eax
02e8f ba0c000000                     mov        edx, 0xc
02e94 4c8bc8                         mov        r9, rax
02e97 4c03ca                         add        r9, rdx
02e9a 48ba10057960ea7f0000           movabs     rdx, 0x7fea60790510
02ea4 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02ea8 4183c002                       add        r8d, 2
02eac 44894270                       mov        dword ptr [rdx + 0x70], r8d
02eb0 4181e0feff1f00                 and        r8d, 0x1ffffe
02eb7 4585c0                         test       r8d, r8d
02eba 0f84e7220000                   je         0x7fea683ed527
02ec0 48ba10057960ea7f0000           movabs     rdx, 0x7fea60790510
02eca 488382d800000001               add        qword ptr [rdx + 0xd8], 1
02ed2 48ba88067960ea7f0000           movabs     rdx, 0x7fea60790688
02edc 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02ee0 4183c002                       add        r8d, 2
02ee4 44894270                       mov        dword ptr [rdx + 0x70], r8d
02ee8 4181e0feff1f00                 and        r8d, 0x1ffffe
02eef 4585c0                         test       r8d, r8d
02ef2 0f84d0220000                   je         0x7fea683ed548
02ef8 48ba58277960ea7f0000           movabs     rdx, 0x7fea60792758
02f02 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
02f0a 48baa8397de200000000           movabs     rdx, 0xe27d39a8
02f14 ba02000000                     mov        edx, 2
02f19 4c8b842478020000               mov        r8, qword ptr [rsp + 0x278]
02f21 bf00000000                     mov        edi, 0
02f26 488b9c2460030000               mov        rbx, qword ptr [rsp + 0x360]
02f2e 48891c24                       mov        qword ptr [rsp], rbx
02f32 488b9c2478020000               mov        rbx, qword ptr [rsp + 0x278]
02f3a 48895c2408                     mov        qword ptr [rsp + 8], rbx
02f3f 4889442410                     mov        qword ptr [rsp + 0x10], rax
02f44 49baa8397de200000000           movabs     r10, 0xe27d39a8
02f4e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02f53 48899c2478020000               mov        qword ptr [rsp + 0x278], rbx
02f5b 0f1f4000                       nop        dword ptr [rax]
02f5f e87c555207                     call       0x7fea6f910860
02f64 0f1f84005c300011               nop        dword ptr [rax + rax + 0x1100305c]
02f6c 8b842428030000                 mov        eax, dword ptr [rsp + 0x328]
02f73 83c010                         add        eax, 0x10
02f76 8b9c2434030000                 mov        ebx, dword ptr [rsp + 0x334]
02f7d 83c310                         add        ebx, 0x10
02f80 3b842440030000                 cmp        eax, dword ptr [rsp + 0x340]
02f87 ba02000000                     mov        edx, 2
02f8c 7c05                           jl         0x7fea683eb313
02f8e ba00000000                     mov        edx, 0
02f93 48b900407260ea7f0000           movabs     rcx, 0x7fea60724000
02f9d 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
02fa1 4403c2                         add        r8d, edx
02fa4 44894174                       mov        dword ptr [rcx + 0x74], r8d
02fa8 85d2                           test       edx, edx
02faa 7506                           jne        0x7fea683eb332
02fac 41b802000000                   mov        r8d, 2
02fb2 4181e0fe3f0000                 and        r8d, 0x3ffe
02fb9 4585c0                         test       r8d, r8d
02fbc 0f8427220000                   je         0x7fea683ed569
02fc2 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02fc6 418502                         test       dword ptr [r10], eax
02fc9 3b842440030000                 cmp        eax, dword ptr [rsp + 0x340]
02fd0 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
02fda b950070000                     mov        ecx, 0x750
02fdf 7d05                           jge        0x7fea683eb366
02fe1 b940070000                     mov        ecx, 0x740
02fe6 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
02fea 4d8d4001                       lea        r8, [r8 + 1]
02fee 4c89040a                       mov        qword ptr [rdx + rcx], r8
02ff2 0f8d0c000000                   jge        0x7fea683eb384
02ff8 89842428030000                 mov        dword ptr [rsp + 0x328], eax
02fff e92cf5ffff                     jmp        0x7fea683ea8b0
03004 8b842440030000                 mov        eax, dword ptr [rsp + 0x340]
0300b 8bb42420030000                 mov        esi, dword ptr [rsp + 0x320]
03012 448b8c2444030000               mov        r9d, dword ptr [rsp + 0x344]
0301a 448b9c2450030000               mov        r11d, dword ptr [rsp + 0x350]
03022 488b8c2458030000               mov        rcx, qword ptr [rsp + 0x358]
0302a 4c8b842448030000               mov        r8, qword ptr [rsp + 0x348]
03032 8bbc2424030000                 mov        edi, dword ptr [rsp + 0x324]
03039 4c8bb42438030000               mov        r14, qword ptr [rsp + 0x338]
03041 8b942464020000                 mov        edx, dword ptr [rsp + 0x264]
03048 49bd00407260ea7f0000           movabs     r13, 0x7fea60724000
03052 41ff8560070000                 inc        dword ptr [r13 + 0x760]
03059 498bdb                         mov        rbx, r11
0305c 4c8bd8                         mov        r11, rax
0305f 488bc7                         mov        rax, rdi
03062 498bfb                         mov        rdi, r11
03065 4c8bda                         mov        r11, rdx
03068 8b942470020000                 mov        edx, dword ptr [rsp + 0x270]
0306f 4c8bef                         mov        r13, rdi
03072 488bbc2478020000               mov        rdi, qword ptr [rsp + 0x278]
0307a 4489ac2468030000               mov        dword ptr [rsp + 0x368], r13d
03082 4c8bac2480020000               mov        r13, qword ptr [rsp + 0x280]
0308a 4c89ac2448020000               mov        qword ptr [rsp + 0x248], r13
03092 448bac2474020000               mov        r13d, dword ptr [rsp + 0x274]
0309a 4489ac243c020000               mov        dword ptr [rsp + 0x23c], r13d
030a2 4c8bac2488020000               mov        r13, qword ptr [rsp + 0x288]
030aa 4c89ac2450020000               mov        qword ptr [rsp + 0x250], r13
030b2 4c8bac2490020000               mov        r13, qword ptr [rsp + 0x290]
030ba 4c89ac2458020000               mov        qword ptr [rsp + 0x258], r13
030c2 448bac2498020000               mov        r13d, dword ptr [rsp + 0x298]
030ca 4489ac2460020000               mov        dword ptr [rsp + 0x260], r13d
030d2 4c8bac24a0020000               mov        r13, qword ptr [rsp + 0x2a0]
030da 4c89ac2468020000               mov        qword ptr [rsp + 0x268], r13
030e2 4c8bef                         mov        r13, rdi
030e5 488bbc2418030000               mov        rdi, qword ptr [rsp + 0x318]
030ed 4c89ac2440020000               mov        qword ptr [rsp + 0x240], r13
030f5 4889bc2490030000               mov        qword ptr [rsp + 0x390], rdi
030fd 4d8beb                         mov        r13, r11
03100 4c8b9c2468020000               mov        r11, qword ptr [rsp + 0x268]
03108 e93d0f0000                     jmp        0x7fea683ec3ca
0310d 4183fb08                       cmp        r11d, 8
03111 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
0311b b978070000                     mov        ecx, 0x778
03120 7c05                           jl         0x7fea683eb4a7
03122 b988070000                     mov        ecx, 0x788
03127 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0312b 4d8d4001                       lea        r8, [r8 + 1]
0312f 4c89040a                       mov        qword ptr [rdx + rcx], r8
03133 0f8ce3020000                   jl         0x7fea683eb79c
03139 448bac2428020000               mov        r13d, dword ptr [rsp + 0x228]
03141 4403ac24a4010000               add        r13d, dword ptr [rsp + 0x1a4]
03149 4489ac2474030000               mov        dword ptr [rsp + 0x374], r13d
03151 8bbc2428020000                 mov        edi, dword ptr [rsp + 0x228]
03158 89bc246c030000                 mov        dword ptr [rsp + 0x36c], edi
0315f 488b842480010000               mov        rax, qword ptr [rsp + 0x180]
03167 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
03171 4883829807000001               add        qword ptr [rdx + 0x798], 1
03179 48ba887e7160ea7f0000           movabs     rdx, 0x7fea60717e88
03183 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03186 83c102                         add        ecx, 2
03189 894a70                         mov        dword ptr [rdx + 0x70], ecx
0318c 81e1feff1f00                   and        ecx, 0x1ffffe
03192 85c9                           test       ecx, ecx
03194 0f8470200000                   je         0x7fea683ed58a
0319a 660f1f440000                   nop        word ptr [rax + rax]
031a0 e995200000                     jmp        0x7fea683ed5ba
031a5 90                             nop        
031a6 90                             nop        
031a7 90                             nop        
031a8 90                             nop        
031a9 90                             nop        
031aa 48ba887e7160ea7f0000           movabs     rdx, 0x7fea60717e88
031b4 488d92d8000000                 lea        rdx, [rdx + 0xd8]
031bb 4885c0                         test       rax, rax
031be 750c                           jne        0x7fea683eb54c
031c0 f6420801                       test       byte ptr [rdx + 8], 1
031c4 7506                           jne        0x7fea683eb54c
031c6 f048834a0801                   lock or    qword ptr [rdx + 8], 1
031cc 48be680773e200000000           movabs     rsi, 0xe2730768
031d6 488bd6                         mov        rdx, rsi
031d9 48b9887e7160ea7f0000           movabs     rcx, 0x7fea60717e88
031e3 488b12                         mov        rdx, qword ptr [rdx]
031e6 48c1ea2a                       shr        rdx, 0x2a
031ea 48c1e209                       shl        rdx, 9
031ee 41ba00000047                   mov        r10d, 0x47000000
031f4 4903d2                         add        rdx, r10
031f7 41ba16000000                   mov        r10d, 0x16
031fd 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03201 7435                           je         0x7fea683eb5b8
03203 4983c202                       add        r10, 2
03207 4983fa1a                       cmp        r10, 0x1a
0320b 75f0                           jne        0x7fea683eb57d
0320d 41ba16000000                   mov        r10d, 0x16
03213 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03218 7412                           je         0x7fea683eb5ac
0321a 4983c202                       add        r10, 2
0321e 4983fa1a                       cmp        r10, 0x1a
03222 75ef                           jne        0x7fea683eb593
03224 41ba15000000                   mov        r10d, 0x15
0322a eb10                           jmp        0x7fea683eb5bc
0322c 50                             push       rax
0322d 4833c0                         xor        rax, rax
03230 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
03235 58                             pop        rax
03236 ebbf                           jmp        0x7fea683eb577
03238 4983c201                       add        r10, 1
0323c 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03241 488bd0                         mov        rdx, rax
03244 488bcb                         mov        rcx, rbx
03247 899c2470030000                 mov        dword ptr [rsp + 0x370], ebx
0324e 4889842480010000               mov        qword ptr [rsp + 0x180], rax
03256 90                             nop        
03257 e884485207                     call       0x7fea6f90fe60
0325c 0f1f840054330013               nop        dword ptr [rax + rax + 0x13003354]
03264 48be00407260ea7f0000           movabs     rsi, 0x7fea60724000
0326e 488386a807000001               add        qword ptr [rsi + 0x7a8], 1
03276 488bb42480010000               mov        rsi, qword ptr [rsp + 0x180]
0327e 8b94246c030000                 mov        edx, dword ptr [rsp + 0x36c]
03285 488bc8                         mov        rcx, rax
03288 0f1f8000000000                 nop        dword ptr [rax]
0328f e84c525207                     call       0x7fea6f910860
03294 0f1f84008c330014               nop        dword ptr [rax + rax + 0x1400338c]
0329c 8bbc246c030000                 mov        edi, dword ptr [rsp + 0x36c]
032a3 83c708                         add        edi, 8
032a6 8b9c2470030000                 mov        ebx, dword ptr [rsp + 0x370]
032ad 83c308                         add        ebx, 8
032b0 3bbc2474030000                 cmp        edi, dword ptr [rsp + 0x374]
032b7 be02000000                     mov        esi, 2
032bc 7c05                           jl         0x7fea683eb643
032be be00000000                     mov        esi, 0
032c3 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
032cd 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
032d0 03ce                           add        ecx, esi
032d2 894a74                         mov        dword ptr [rdx + 0x74], ecx
032d5 85f6                           test       esi, esi
032d7 7505                           jne        0x7fea683eb65e
032d9 b902000000                     mov        ecx, 2
032de 81e1fe3f0000                   and        ecx, 0x3ffe
032e4 85c9                           test       ecx, ecx
032e6 0f84581f0000                   je         0x7fea683ed5c4
032ec 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
032f0 418502                         test       dword ptr [r10], eax
032f3 3bbc2474030000                 cmp        edi, dword ptr [rsp + 0x374]
032fa 48be00407260ea7f0000           movabs     rsi, 0x7fea60724000
03304 bab8070000                     mov        edx, 0x7b8
03309 7c05                           jl         0x7fea683eb690
0330b bac8070000                     mov        edx, 0x7c8
03310 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
03314 488d4901                       lea        rcx, [rcx + 1]
03318 48890c16                       mov        qword ptr [rsi + rdx], rcx
0331c 0f8c36feffff                   jl         0x7fea683eb4d8
03322 448bac2474030000               mov        r13d, dword ptr [rsp + 0x374]
0332a 48be00407260ea7f0000           movabs     rsi, 0x7fea60724000
03334 ff86d8070000                   inc        dword ptr [rsi + 0x7d8]
0333a 8bb42470010000                 mov        esi, dword ptr [rsp + 0x170]
03341 448b8c2474010000               mov        r9d, dword ptr [rsp + 0x174]
03349 8b9c246c010000                 mov        ebx, dword ptr [rsp + 0x16c]
03350 488b8c2478010000               mov        rcx, qword ptr [rsp + 0x178]
03358 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
03360 8b8424a0010000                 mov        eax, dword ptr [rsp + 0x1a0]
03367 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
0336f 448b9c2488010000               mov        r11d, dword ptr [rsp + 0x188]
03377 8b94242c020000                 mov        edx, dword ptr [rsp + 0x22c]
0337e 498bfd                         mov        rdi, r13
03381 4c8bac2480010000               mov        r13, qword ptr [rsp + 0x180]
03389 4c89ac2440020000               mov        qword ptr [rsp + 0x240], r13
03391 4c8bac2450010000               mov        r13, qword ptr [rsp + 0x150]
03399 4c89ac2448020000               mov        qword ptr [rsp + 0x248], r13
033a1 448bac2444010000               mov        r13d, dword ptr [rsp + 0x144]
033a9 4489ac243c020000               mov        dword ptr [rsp + 0x23c], r13d
033b1 4c8bac2458010000               mov        r13, qword ptr [rsp + 0x158]
033b9 4c89ac2450020000               mov        qword ptr [rsp + 0x250], r13
033c1 4c8bac2460010000               mov        r13, qword ptr [rsp + 0x160]
033c9 4c89ac2458020000               mov        qword ptr [rsp + 0x258], r13
033d1 448bac2468010000               mov        r13d, dword ptr [rsp + 0x168]
033d9 4489ac2460020000               mov        dword ptr [rsp + 0x260], r13d
033e1 4c8bac2490010000               mov        r13, qword ptr [rsp + 0x190]
033e9 4c89ac2468020000               mov        qword ptr [rsp + 0x268], r13
033f1 4c8bef                         mov        r13, rdi
033f4 488bbc2498010000               mov        rdi, qword ptr [rsp + 0x198]
033fc 4489ac2468030000               mov        dword ptr [rsp + 0x368], r13d
03404 4889bc2490030000               mov        qword ptr [rsp + 0x390], rdi
0340c 4d8beb                         mov        r13, r11
0340f 4c8b9c2468020000               mov        r11, qword ptr [rsp + 0x268]
03417 e92e0c0000                     jmp        0x7fea683ec3ca
0341c 48be00407260ea7f0000           movabs     rsi, 0x7fea60724000
03426 488386f007000001               add        qword ptr [rsi + 0x7f0], 1
0342e 488bb42480010000               mov        rsi, qword ptr [rsp + 0x180]
03436 8b942428020000                 mov        edx, dword ptr [rsp + 0x228]
0343d 488bcb                         mov        rcx, rbx
03440 4d8bc3                         mov        r8, r11
03443 448b8c24a4010000               mov        r9d, dword ptr [rsp + 0x1a4]
0344b 0f1f4000                       nop        dword ptr [rax]
0344f e88c505207                     call       0x7fea6f910860
03454 0f1f84004c350016               nop        dword ptr [rax + rax + 0x1600354c]
0345c 488bf8                         mov        rdi, rax
0345f 8bb42470010000                 mov        esi, dword ptr [rsp + 0x170]
03466 448b8c2474010000               mov        r9d, dword ptr [rsp + 0x174]
0346e 8b9c246c010000                 mov        ebx, dword ptr [rsp + 0x16c]
03475 488b8c2478010000               mov        rcx, qword ptr [rsp + 0x178]
0347d 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
03485 8b8424a0010000                 mov        eax, dword ptr [rsp + 0x1a0]
0348c 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
03494 448b9c2488010000               mov        r11d, dword ptr [rsp + 0x188]
0349c 8b94242c020000                 mov        edx, dword ptr [rsp + 0x22c]
034a3 4c8bef                         mov        r13, rdi
034a6 488bbc2480010000               mov        rdi, qword ptr [rsp + 0x180]
034ae 4489ac2468030000               mov        dword ptr [rsp + 0x368], r13d
034b6 4c8bac2450010000               mov        r13, qword ptr [rsp + 0x150]
034be 4c89ac2448020000               mov        qword ptr [rsp + 0x248], r13
034c6 448bac2444010000               mov        r13d, dword ptr [rsp + 0x144]
034ce 4489ac243c020000               mov        dword ptr [rsp + 0x23c], r13d
034d6 4c8bac2458010000               mov        r13, qword ptr [rsp + 0x158]
034de 4c89ac2450020000               mov        qword ptr [rsp + 0x250], r13
034e6 4c8bac2460010000               mov        r13, qword ptr [rsp + 0x160]
034ee 4c89ac2458020000               mov        qword ptr [rsp + 0x258], r13
034f6 448bac2468010000               mov        r13d, dword ptr [rsp + 0x168]
034fe 4489ac2460020000               mov        dword ptr [rsp + 0x260], r13d
03506 4c8bac2490010000               mov        r13, qword ptr [rsp + 0x190]
0350e 4c89ac2468020000               mov        qword ptr [rsp + 0x268], r13
03516 4c8bef                         mov        r13, rdi
03519 488bbc2498010000               mov        rdi, qword ptr [rsp + 0x198]
03521 4c89ac2440020000               mov        qword ptr [rsp + 0x240], r13
03529 4889bc2490030000               mov        qword ptr [rsp + 0x390], rdi
03531 4d8beb                         mov        r13, r11
03534 4c8b9c2468020000               mov        r11, qword ptr [rsp + 0x268]
0353c e9090b0000                     jmp        0x7fea683ec3ca
03541 89b4242c020000                 mov        dword ptr [rsp + 0x22c], esi
03548 4489ac2428020000               mov        dword ptr [rsp + 0x228], r13d
03550 488b842480010000               mov        rax, qword ptr [rsp + 0x180]
03558 48be00407260ea7f0000           movabs     rsi, 0x7fea60724000
03562 488386c805000001               add        qword ptr [rsi + 0x5c8], 1
0356a 48be981a7960ea7f0000           movabs     rsi, 0x7fea60791a98
03574 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03577 83c202                         add        edx, 2
0357a 895670                         mov        dword ptr [rsi + 0x70], edx
0357d 81e2feff1f00                   and        edx, 0x1ffffe
03583 85d2                           test       edx, edx
03585 0f84da1c0000                   je         0x7fea683ed5e5
0358b 48be488d78e200000000           movabs     rsi, 0xe2788d48
03595 48ba981a7960ea7f0000           movabs     rdx, 0x7fea60791a98
0359f 488b36                         mov        rsi, qword ptr [rsi]
035a2 48c1ee2a                       shr        rsi, 0x2a
035a6 48c1e609                       shl        rsi, 9
035aa 41ba00000047                   mov        r10d, 0x47000000
035b0 4903f2                         add        rsi, r10
035b3 41ba16000000                   mov        r10d, 0x16
035b9 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
035bd 7435                           je         0x7fea683eb974
035bf 4983c202                       add        r10, 2
035c3 4983fa1a                       cmp        r10, 0x1a
035c7 75f0                           jne        0x7fea683eb939
035c9 41ba16000000                   mov        r10d, 0x16
035cf 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
035d4 7412                           je         0x7fea683eb968
035d6 4983c202                       add        r10, 2
035da 4983fa1a                       cmp        r10, 0x1a
035de 75ef                           jne        0x7fea683eb94f
035e0 41ba15000000                   mov        r10d, 0x15
035e6 eb10                           jmp        0x7fea683eb978
035e8 50                             push       rax
035e9 4833c0                         xor        rax, rax
035ec 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
035f1 58                             pop        rax
035f2 ebbf                           jmp        0x7fea683eb933
035f4 4983c201                       add        r10, 1
035f8 4a8304d201                     add        qword ptr [rdx + r10*8], 1
035fd 448b5808                       mov        r11d, dword ptr [rax + 8]
03601 48be981a7960ea7f0000           movabs     rsi, 0x7fea60791a98
0360b 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03613 48bef0107960ea7f0000           movabs     rsi, 0x7fea607910f0
0361d 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03620 83c202                         add        edx, 2
03623 895670                         mov        dword ptr [rsi + 0x70], edx
03626 81e2feff1f00                   and        edx, 0x1ffffe
0362c 85d2                           test       edx, edx
0362e 0f84571c0000                   je         0x7fea683ed60b
03634 48bef0107960ea7f0000           movabs     rsi, 0x7fea607910f0
0363e 4883860801000001               add        qword ptr [rsi + 0x108], 1
03646 498bf3                         mov        rsi, r11
03649 83ee0f                         sub        esi, 0xf
0364c 48bac0077960ea7f0000           movabs     rdx, 0x7fea607907c0
03656 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03659 83c102                         add        ecx, 2
0365c 894a70                         mov        dword ptr [rdx + 0x70], ecx
0365f 81e1feff1f00                   and        ecx, 0x1ffffe
03665 85c9                           test       ecx, ecx
03667 0f843f1c0000                   je         0x7fea683ed62c
0366d 48bac0077960ea7f0000           movabs     rdx, 0x7fea607907c0
03677 488382a800000001               add        qword ptr [rdx + 0xa8], 1
0367f 48ba0000000000000000           movabs     rdx, 0
03689 ba00000000                     mov        edx, 0
0368e 3bda                           cmp        ebx, edx
03690 0f8c371c0000                   jl         0x7fea683ed64d
03696 3bde                           cmp        ebx, esi
03698 0f8d3c1c0000                   jge        0x7fea683ed65a
0369e 48be488d78e200000000           movabs     rsi, 0xe2788d48
036a8 488bd6                         mov        rdx, rsi
036ab 48b9981a7960ea7f0000           movabs     rcx, 0x7fea60791a98
036b5 488b12                         mov        rdx, qword ptr [rdx]
036b8 48c1ea2a                       shr        rdx, 0x2a
036bc 48c1e209                       shl        rdx, 9
036c0 41ba00000047                   mov        r10d, 0x47000000
036c6 4903d2                         add        rdx, r10
036c9 41ba24000000                   mov        r10d, 0x24
036cf 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
036d3 7435                           je         0x7fea683eba8a
036d5 4983c202                       add        r10, 2
036d9 4983fa28                       cmp        r10, 0x28
036dd 75f0                           jne        0x7fea683eba4f
036df 41ba24000000                   mov        r10d, 0x24
036e5 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
036ea 7412                           je         0x7fea683eba7e
036ec 4983c202                       add        r10, 2
036f0 4983fa28                       cmp        r10, 0x28
036f4 75ef                           jne        0x7fea683eba65
036f6 41ba23000000                   mov        r10d, 0x23
036fc eb10                           jmp        0x7fea683eba8e
036fe 50                             push       rax
036ff 4833c0                         xor        rax, rax
03702 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
03707 58                             pop        rax
03708 ebbf                           jmp        0x7fea683eba49
0370a 4983c201                       add        r10, 1
0370e 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03713 48bac0087960ea7f0000           movabs     rdx, 0x7fea607908c0
0371d 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03720 83c102                         add        ecx, 2
03723 894a70                         mov        dword ptr [rdx + 0x70], ecx
03726 81e1feff1f00                   and        ecx, 0x1ffffe
0372c 85c9                           test       ecx, ecx
0372e 0f84b31b0000                   je         0x7fea683ed667
03734 48bac0087960ea7f0000           movabs     rdx, 0x7fea607908c0
0373e 488382a800000001               add        qword ptr [rdx + 0xa8], 1
03746 48bee8097960ea7f0000           movabs     rsi, 0x7fea607909e8
03750 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03753 83c202                         add        edx, 2
03756 895670                         mov        dword ptr [rsi + 0x70], edx
03759 81e2feff1f00                   and        edx, 0x1ffffe
0375f 85d2                           test       edx, edx
03761 0f84a11b0000                   je         0x7fea683ed688
03767 48bee8097960ea7f0000           movabs     rsi, 0x7fea607909e8
03771 ff86b8000000                   inc        dword ptr [rsi + 0xb8]
03777 44899c2478030000               mov        dword ptr [rsp + 0x378], r11d
0377f 48be305e7ae200000000           movabs     rsi, 0xe27a5e30
03789 488bd6                         mov        rdx, rsi
0378c 48b9981a7960ea7f0000           movabs     rcx, 0x7fea60791a98
03796 4883815801000001               add        qword ptr [rcx + 0x158], 1
0379e 48ba601c7960ea7f0000           movabs     rdx, 0x7fea60791c60
037a8 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
037ab 83c102                         add        ecx, 2
037ae 894a70                         mov        dword ptr [rdx + 0x70], ecx
037b1 81e1feff1f00                   and        ecx, 0x1ffffe
037b7 85c9                           test       ecx, ecx
037b9 0f846a1b0000                   je         0x7fea683ed6a9
037bf 488bd6                         mov        rdx, rsi
037c2 48b9601c7960ea7f0000           movabs     rcx, 0x7fea60791c60
037cc 488381a800000001               add        qword ptr [rcx + 0xa8], 1
037d4 48ba401d7960ea7f0000           movabs     rdx, 0x7fea60791d40
037de 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
037e1 83c102                         add        ecx, 2
037e4 894a70                         mov        dword ptr [rdx + 0x70], ecx
037e7 81e1feff1f00                   and        ecx, 0x1ffffe
037ed 85c9                           test       ecx, ecx
037ef 0f84551b0000                   je         0x7fea683ed6ca
037f5 48ba401d7960ea7f0000           movabs     rdx, 0x7fea60791d40
037ff 488382b800000001               add        qword ptr [rdx + 0xb8], 1
03807 48be68127960ea7f0000           movabs     rsi, 0x7fea60791268
03811 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03814 83c202                         add        edx, 2
03817 895670                         mov        dword ptr [rsi + 0x70], edx
0381a 81e2feff1f00                   and        edx, 0x1ffffe
03820 85d2                           test       edx, edx
03822 0f84431b0000                   je         0x7fea683ed6eb
03828 48be488d78e200000000           movabs     rsi, 0xe2788d48
03832 488bd6                         mov        rdx, rsi
03835 48b9401d7960ea7f0000           movabs     rcx, 0x7fea60791d40
0383f 488b12                         mov        rdx, qword ptr [rdx]
03842 48c1ea2a                       shr        rdx, 0x2a
03846 48c1e209                       shl        rdx, 9
0384a 41ba00000047                   mov        r10d, 0x47000000
03850 4903d2                         add        rdx, r10
03853 41ba1c000000                   mov        r10d, 0x1c
03859 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0385d 7435                           je         0x7fea683ebc14
0385f 4983c202                       add        r10, 2
03863 4983fa20                       cmp        r10, 0x20
03867 75f0                           jne        0x7fea683ebbd9
03869 41ba1c000000                   mov        r10d, 0x1c
0386f 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03874 7412                           je         0x7fea683ebc08
03876 4983c202                       add        r10, 2
0387a 4983fa20                       cmp        r10, 0x20
0387e 75ef                           jne        0x7fea683ebbef
03880 41ba1b000000                   mov        r10d, 0x1b
03886 eb10                           jmp        0x7fea683ebc18
03888 50                             push       rax
03889 4833c0                         xor        rax, rax
0388c 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
03891 58                             pop        rax
03892 ebbf                           jmp        0x7fea683ebbd3
03894 4983c201                       add        r10, 1
03898 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0389d 48ba401d7960ea7f0000           movabs     rdx, 0x7fea60791d40
038a7 488b36                         mov        rsi, qword ptr [rsi]
038aa 48c1ee2a                       shr        rsi, 0x2a
038ae 48c1e609                       shl        rsi, 9
038b2 41ba00000047                   mov        r10d, 0x47000000
038b8 4903f2                         add        rsi, r10
038bb 41ba22000000                   mov        r10d, 0x22
038c1 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
038c5 7435                           je         0x7fea683ebc7c
038c7 4983c202                       add        r10, 2
038cb 4983fa26                       cmp        r10, 0x26
038cf 75f0                           jne        0x7fea683ebc41
038d1 41ba22000000                   mov        r10d, 0x22
038d7 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
038dc 7412                           je         0x7fea683ebc70
038de 4983c202                       add        r10, 2
038e2 4983fa26                       cmp        r10, 0x26
038e6 75ef                           jne        0x7fea683ebc57
038e8 41ba21000000                   mov        r10d, 0x21
038ee eb10                           jmp        0x7fea683ebc80
038f0 50                             push       rax
038f1 4833c0                         xor        rax, rax
038f4 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
038f9 58                             pop        rax
038fa ebbf                           jmp        0x7fea683ebc3b
038fc 4983c201                       add        r10, 1
03900 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03905 48be401d7960ea7f0000           movabs     rsi, 0x7fea60791d40
0390f 4883863801000001               add        qword ptr [rsi + 0x138], 1
03917 48be28137960ea7f0000           movabs     rsi, 0x7fea60791328
03921 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03924 83c202                         add        edx, 2
03927 895670                         mov        dword ptr [rsi + 0x70], edx
0392a 81e2feff1f00                   and        edx, 0x1ffffe
03930 85d2                           test       edx, edx
03932 0f84541a0000                   je         0x7fea683ed70c
03938 48be401d7960ea7f0000           movabs     rsi, 0x7fea60791d40
03942 4883864801000001               add        qword ptr [rsi + 0x148], 1
0394a 4863db                         movsxd     rbx, ebx
0394d be0c000000                     mov        esi, 0xc
03952 4c8bcb                         mov        r9, rbx
03955 4c03ce                         add        r9, rsi
03958 48be10057960ea7f0000           movabs     rsi, 0x7fea60790510
03962 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03965 83c202                         add        edx, 2
03968 895670                         mov        dword ptr [rsi + 0x70], edx
0396b 81e2feff1f00                   and        edx, 0x1ffffe
03971 85d2                           test       edx, edx
03973 0f84341a0000                   je         0x7fea683ed72d
03979 48be10057960ea7f0000           movabs     rsi, 0x7fea60790510
03983 488386d800000001               add        qword ptr [rsi + 0xd8], 1
0398b 48be88067960ea7f0000           movabs     rsi, 0x7fea60790688
03995 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03998 83c202                         add        edx, 2
0399b 895670                         mov        dword ptr [rsi + 0x70], edx
0399e 81e2feff1f00                   and        edx, 0x1ffffe
039a4 85d2                           test       edx, edx
039a6 0f84221a0000                   je         0x7fea683ed74e
039ac 48be401d7960ea7f0000           movabs     rsi, 0x7fea60791d40
039b6 4883866801000001               add        qword ptr [rsi + 0x168], 1
039be 48be00597be200000000           movabs     rsi, 0xe27b5900
039c8 48be908d78e200000000           movabs     rsi, 0xe2788d90
039d2 ba02000000                     mov        edx, 2
039d7 b910000000                     mov        ecx, 0x10
039dc 4c8bc0                         mov        r8, rax
039df bf00000000                     mov        edi, 0
039e4 48890424                       mov        qword ptr [rsp], rax
039e8 48895c2408                     mov        qword ptr [rsp + 8], rbx
039ed 49ba488d78e200000000           movabs     r10, 0xe2788d48
039f7 4c89542410                     mov        qword ptr [rsp + 0x10], r10
039fc 49ba00597be200000000           movabs     r10, 0xe27b5900
03a06 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03a0b 4889842480010000               mov        qword ptr [rsp + 0x180], rax
03a13 0f1f4000                       nop        dword ptr [rax]
03a17 e8c44a5207                     call       0x7fea6f910860
03a1c 0f1f8400143b0017               nop        dword ptr [rax + rax + 0x17003b14]
03a24 4885c0                         test       rax, rax
03a27 48bb401d7960ea7f0000           movabs     rbx, 0x7fea60791d40
03a31 750c                           jne        0x7fea683ebdbf
03a33 808b7101000001                 or         byte ptr [rbx + 0x171], 1
03a3a e98b000000                     jmp        0x7fea683ebe4a
03a3f 488b38                         mov        rdi, qword ptr [rax]
03a42 48c1ef2a                       shr        rdi, 0x2a
03a46 48c1e709                       shl        rdi, 9
03a4a 41ba00000047                   mov        r10d, 0x47000000
03a50 4903fa                         add        rdi, r10
03a53 41ba30000000                   mov        r10d, 0x30
03a59 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
03a5d 7435                           je         0x7fea683ebe14
03a5f 4983c202                       add        r10, 2
03a63 4983fa34                       cmp        r10, 0x34
03a67 75f0                           jne        0x7fea683ebdd9
03a69 41ba30000000                   mov        r10d, 0x30
03a6f 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03a74 7412                           je         0x7fea683ebe08
03a76 4983c202                       add        r10, 2
03a7a 4983fa34                       cmp        r10, 0x34
03a7e 75ef                           jne        0x7fea683ebdef
03a80 41ba2f000000                   mov        r10d, 0x2f
03a86 eb10                           jmp        0x7fea683ebe18
03a88 50                             push       rax
03a89 4833c0                         xor        rax, rax
03a8c 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
03a91 58                             pop        rax
03a92 ebbf                           jmp        0x7fea683ebdd3
03a94 4983c201                       add        r10, 1
03a98 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03a9d 48bf0006144700000000           movabs     rdi, 0x47140600
03aa7 488b18                         mov        rbx, qword ptr [rax]
03aaa 48c1eb2a                       shr        rbx, 0x2a
03aae 48c1e309                       shl        rbx, 9
03ab2 41ba00000047                   mov        r10d, 0x47000000
03ab8 4903da                         add        rbx, r10
03abb 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
03abf 0f852a190000                   jne        0x7fea683ed76f
03ac5 e900000000                     jmp        0x7fea683ebe4a
03aca 488bf8                         mov        rdi, rax
03acd 4889bc2480030000               mov        qword ptr [rsp + 0x380], rdi
03ad5 483b07                         cmp        rax, qword ptr [rdi]
03ad8 488bf7                         mov        rsi, rdi
03adb 48bb00407260ea7f0000           movabs     rbx, 0x7fea60724000
03ae5 488b36                         mov        rsi, qword ptr [rsi]
03ae8 48c1ee2a                       shr        rsi, 0x2a
03aec 48c1e609                       shl        rsi, 9
03af0 41ba00000047                   mov        r10d, 0x47000000
03af6 4903f2                         add        rsi, r10
03af9 41babc000000                   mov        r10d, 0xbc
03aff 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03b03 743b                           je         0x7fea683ebec0
03b05 4983c202                       add        r10, 2
03b09 4981fac0000000                 cmp        r10, 0xc0
03b10 75ed                           jne        0x7fea683ebe7f
03b12 41babc000000                   mov        r10d, 0xbc
03b18 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03b1d 7415                           je         0x7fea683ebeb4
03b1f 4983c202                       add        r10, 2
03b23 4981fac0000000                 cmp        r10, 0xc0
03b2a 75ec                           jne        0x7fea683ebe98
03b2c 41babb000000                   mov        r10d, 0xbb
03b32 eb10                           jmp        0x7fea683ebec4
03b34 50                             push       rax
03b35 4833c0                         xor        rax, rax
03b38 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
03b3d 58                             pop        rax
03b3e ebb9                           jmp        0x7fea683ebe79
03b40 4983c201                       add        r10, 1
03b44 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03b49 48be58277960ea7f0000           movabs     rsi, 0x7fea60792758
03b53 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
03b56 83c302                         add        ebx, 2
03b59 895e70                         mov        dword ptr [rsi + 0x70], ebx
03b5c 81e3feff1f00                   and        ebx, 0x1ffffe
03b62 85db                           test       ebx, ebx
03b64 0f8493180000                   je         0x7fea683ed77d
03b6a 488bf7                         mov        rsi, rdi
03b6d 48bb58277960ea7f0000           movabs     rbx, 0x7fea60792758
03b77 488b36                         mov        rsi, qword ptr [rsi]
03b7a 48c1ee2a                       shr        rsi, 0x2a
03b7e 48c1e609                       shl        rsi, 9
03b82 41ba00000047                   mov        r10d, 0x47000000
03b88 4903f2                         add        rsi, r10
03b8b 41ba16000000                   mov        r10d, 0x16
03b91 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03b95 7435                           je         0x7fea683ebf4c
03b97 4983c202                       add        r10, 2
03b9b 4983fa1a                       cmp        r10, 0x1a
03b9f 75f0                           jne        0x7fea683ebf11
03ba1 41ba16000000                   mov        r10d, 0x16
03ba7 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03bac 7412                           je         0x7fea683ebf40
03bae 4983c202                       add        r10, 2
03bb2 4983fa1a                       cmp        r10, 0x1a
03bb6 75ef                           jne        0x7fea683ebf27
03bb8 41ba15000000                   mov        r10d, 0x15
03bbe eb10                           jmp        0x7fea683ebf50
03bc0 50                             push       rax
03bc1 4833c0                         xor        rax, rax
03bc4 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
03bc9 58                             pop        rax
03bca ebbf                           jmp        0x7fea683ebf0b
03bcc 4983c201                       add        r10, 1
03bd0 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03bd5 488bf7                         mov        rsi, rdi
03bd8 0f1f440000                     nop        dword ptr [rax + rax]
03bdd 48b8b0f03944ea7f0000           movabs     rax, 0x7fea4439f0b0
03be7 e8f4435207                     call       0x7fea6f910360
03bec 0f1f8400e43c0018               nop        dword ptr [rax + rax + 0x18003ce4]
03bf4 48be58277960ea7f0000           movabs     rsi, 0x7fea60792758
03bfe 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03c06 48bef0107960ea7f0000           movabs     rsi, 0x7fea607910f0
03c10 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
03c13 83c702                         add        edi, 2
03c16 897e70                         mov        dword ptr [rsi + 0x70], edi
03c19 81e7feff1f00                   and        edi, 0x1ffffe
03c1f 85ff                           test       edi, edi
03c21 0f84f7170000                   je         0x7fea683ed79e
03c27 448b9c2478030000               mov        r11d, dword ptr [rsp + 0x378]
03c2f 448bac2428020000               mov        r13d, dword ptr [rsp + 0x228]
03c37 48bef0107960ea7f0000           movabs     rsi, 0x7fea607910f0
03c41 4883860801000001               add        qword ptr [rsi + 0x108], 1
03c49 ffc8                           dec        eax
03c4b 442bd8                         sub        r11d, eax
03c4e 48bec0077960ea7f0000           movabs     rsi, 0x7fea607907c0
03c58 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
03c5b 83c702                         add        edi, 2
03c5e 897e70                         mov        dword ptr [rsi + 0x70], edi
03c61 81e7feff1f00                   and        edi, 0x1ffffe
03c67 85ff                           test       edi, edi
03c69 0f84d0170000                   je         0x7fea683ed7bf
03c6f 48bec0077960ea7f0000           movabs     rsi, 0x7fea607907c0
03c79 488386a800000001               add        qword ptr [rsi + 0xa8], 1
03c81 48be0000000000000000           movabs     rsi, 0
03c8b be00000000                     mov        esi, 0
03c90 443bee                         cmp        r13d, esi
03c93 0f8cc7170000                   jl         0x7fea683ed7e0
03c99 453beb                         cmp        r13d, r11d
03c9c 0f8dcb170000                   jge        0x7fea683ed7ed
03ca2 498bfd                         mov        rdi, r13
03ca5 89bc247c030000                 mov        dword ptr [rsp + 0x37c], edi
03cac 488bbc2480030000               mov        rdi, qword ptr [rsp + 0x380]
03cb4 4489ac2428020000               mov        dword ptr [rsp + 0x228], r13d
03cbc 488bf7                         mov        rsi, rdi
03cbf 48ba58277960ea7f0000           movabs     rdx, 0x7fea60792758
03cc9 488b36                         mov        rsi, qword ptr [rsi]
03ccc 48c1ee2a                       shr        rsi, 0x2a
03cd0 48c1e609                       shl        rsi, 9
03cd4 41ba00000047                   mov        r10d, 0x47000000
03cda 4903f2                         add        rsi, r10
03cdd 41ba1e000000                   mov        r10d, 0x1e
03ce3 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03ce7 7435                           je         0x7fea683ec09e
03ce9 4983c202                       add        r10, 2
03ced 4983fa22                       cmp        r10, 0x22
03cf1 75f0                           jne        0x7fea683ec063
03cf3 41ba1e000000                   mov        r10d, 0x1e
03cf9 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03cfe 7412                           je         0x7fea683ec092
03d00 4983c202                       add        r10, 2
03d04 4983fa22                       cmp        r10, 0x22
03d08 75ef                           jne        0x7fea683ec079
03d0a 41ba1d000000                   mov        r10d, 0x1d
03d10 eb10                           jmp        0x7fea683ec0a2
03d12 50                             push       rax
03d13 4833c0                         xor        rax, rax
03d16 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
03d1b 58                             pop        rax
03d1c ebbf                           jmp        0x7fea683ec05d
03d1e 4983c201                       add        r10, 1
03d22 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03d27 488bf7                         mov        rsi, rdi
03d2a 666690                         nop        
03d2d 48b8d8f03944ea7f0000           movabs     rax, 0x7fea4439f0d8
03d37 e8a4425207                     call       0x7fea6f910360
03d3c 0f1f8400343e0019               nop        dword ptr [rax + rax + 0x19003e34]
03d44 483b00                         cmp        rax, qword ptr [rax]
03d47 488bf0                         mov        rsi, rax
03d4a 48ba58277960ea7f0000           movabs     rdx, 0x7fea60792758
03d54 488b36                         mov        rsi, qword ptr [rsi]
03d57 48c1ee2a                       shr        rsi, 0x2a
03d5b 48c1e609                       shl        rsi, 9
03d5f 41ba00000047                   mov        r10d, 0x47000000
03d65 4903f2                         add        rsi, r10
03d68 41ba24000000                   mov        r10d, 0x24
03d6e 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03d72 7435                           je         0x7fea683ec129
03d74 4983c202                       add        r10, 2
03d78 4983fa28                       cmp        r10, 0x28
03d7c 75f0                           jne        0x7fea683ec0ee
03d7e 41ba24000000                   mov        r10d, 0x24
03d84 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03d89 7412                           je         0x7fea683ec11d
03d8b 4983c202                       add        r10, 2
03d8f 4983fa28                       cmp        r10, 0x28
03d93 75ef                           jne        0x7fea683ec104
03d95 41ba23000000                   mov        r10d, 0x23
03d9b eb10                           jmp        0x7fea683ec12d
03d9d 50                             push       rax
03d9e 4833c0                         xor        rax, rax
03da1 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
03da6 58                             pop        rax
03da7 ebbf                           jmp        0x7fea683ec0e8
03da9 4983c201                       add        r10, 1
03dad 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03db2 8b7028                         mov        esi, dword ptr [rax + 0x28]
03db5 488bd0                         mov        rdx, rax
03db8 48b958277960ea7f0000           movabs     rcx, 0x7fea60792758
03dc2 488b12                         mov        rdx, qword ptr [rdx]
03dc5 48c1ea2a                       shr        rdx, 0x2a
03dc9 48c1e209                       shl        rdx, 9
03dcd 41ba00000047                   mov        r10d, 0x47000000
03dd3 4903d2                         add        rdx, r10
03dd6 41ba2a000000                   mov        r10d, 0x2a
03ddc 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03de0 7435                           je         0x7fea683ec197
03de2 4983c202                       add        r10, 2
03de6 4983fa2e                       cmp        r10, 0x2e
03dea 75f0                           jne        0x7fea683ec15c
03dec 41ba2a000000                   mov        r10d, 0x2a
03df2 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03df7 7412                           je         0x7fea683ec18b
03df9 4983c202                       add        r10, 2
03dfd 4983fa2e                       cmp        r10, 0x2e
03e01 75ef                           jne        0x7fea683ec172
03e03 41ba29000000                   mov        r10d, 0x29
03e09 eb10                           jmp        0x7fea683ec19b
03e0b 50                             push       rax
03e0c 4833c0                         xor        rax, rax
03e0f 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
03e14 58                             pop        rax
03e15 ebbf                           jmp        0x7fea683ec156
03e17 4983c201                       add        r10, 1
03e1b 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03e20 8b4808                         mov        ecx, dword ptr [rax + 8]
03e23 48ba58277960ea7f0000           movabs     rdx, 0x7fea60792758
03e2d 4883827801000001               add        qword ptr [rdx + 0x178], 1
03e35 48ba28137960ea7f0000           movabs     rdx, 0x7fea60791328
03e3f 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03e43 4183c002                       add        r8d, 2
03e47 44894270                       mov        dword ptr [rdx + 0x70], r8d
03e4b 4181e0feff1f00                 and        r8d, 0x1ffffe
03e52 4585c0                         test       r8d, r8d
03e55 0f8424160000                   je         0x7fea683ed7ff
03e5b 48ba58277960ea7f0000           movabs     rdx, 0x7fea60792758
03e65 4883828801000001               add        qword ptr [rdx + 0x188], 1
03e6d 8bbc247c030000                 mov        edi, dword ptr [rsp + 0x37c]
03e74 4863df                         movsxd     rbx, edi
03e77 ba0c000000                     mov        edx, 0xc
03e7c 4c8bcb                         mov        r9, rbx
03e7f 4c03ca                         add        r9, rdx
03e82 48ba10057960ea7f0000           movabs     rdx, 0x7fea60790510
03e8c 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03e90 4183c002                       add        r8d, 2
03e94 44894270                       mov        dword ptr [rdx + 0x70], r8d
03e98 4181e0feff1f00                 and        r8d, 0x1ffffe
03e9f 4585c0                         test       r8d, r8d
03ea2 0f84f8150000                   je         0x7fea683ed820
03ea8 48ba10057960ea7f0000           movabs     rdx, 0x7fea60790510
03eb2 488382d800000001               add        qword ptr [rdx + 0xd8], 1
03eba 48ba88067960ea7f0000           movabs     rdx, 0x7fea60790688
03ec4 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03ec8 4183c002                       add        r8d, 2
03ecc 44894270                       mov        dword ptr [rdx + 0x70], r8d
03ed0 4181e0feff1f00                 and        r8d, 0x1ffffe
03ed7 4585c0                         test       r8d, r8d
03eda 0f84e1150000                   je         0x7fea683ed841
03ee0 48ba58277960ea7f0000           movabs     rdx, 0x7fea60792758
03eea 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
03ef2 48baa8397de200000000           movabs     rdx, 0xe27d39a8
03efc ba02000000                     mov        edx, 2
03f01 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
03f09 bf00000000                     mov        edi, 0
03f0e 488b842480030000               mov        rax, qword ptr [rsp + 0x380]
03f16 48890424                       mov        qword ptr [rsp], rax
03f1a 488b842480010000               mov        rax, qword ptr [rsp + 0x180]
03f22 4889442408                     mov        qword ptr [rsp + 8], rax
03f27 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
03f2c 49baa8397de200000000           movabs     r10, 0xe27d39a8
03f36 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03f3b 4889842480010000               mov        qword ptr [rsp + 0x180], rax
03f43 0f1f4000                       nop        dword ptr [rax]
03f47 e894455207                     call       0x7fea6f910860
03f4c 0f1f84004440001a               nop        dword ptr [rax + rax + 0x1a004044]
03f54 8b94242c020000                 mov        edx, dword ptr [rsp + 0x22c]
03f5b 448bac2428020000               mov        r13d, dword ptr [rsp + 0x228]
03f63 8bbc24a4010000                 mov        edi, dword ptr [rsp + 0x1a4]
03f6a 4403ef                         add        r13d, edi
03f6d 48be00407260ea7f0000           movabs     rsi, 0x7fea60724000
03f77 ff8608060000                   inc        dword ptr [rsi + 0x608]
03f7d 8bb42470010000                 mov        esi, dword ptr [rsp + 0x170]
03f84 448b8c2474010000               mov        r9d, dword ptr [rsp + 0x174]
03f8c 8b9c246c010000                 mov        ebx, dword ptr [rsp + 0x16c]
03f93 488b8c2478010000               mov        rcx, qword ptr [rsp + 0x178]
03f9b 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
03fa3 8b8424a0010000                 mov        eax, dword ptr [rsp + 0x1a0]
03faa 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
03fb2 448b9c2488010000               mov        r11d, dword ptr [rsp + 0x188]
03fba 4489ac2468030000               mov        dword ptr [rsp + 0x368], r13d
03fc2 4c8bac2480010000               mov        r13, qword ptr [rsp + 0x180]
03fca 44899c2488030000               mov        dword ptr [rsp + 0x388], r11d
03fd2 4c8b9c2450010000               mov        r11, qword ptr [rsp + 0x150]
03fda 4c899c2448020000               mov        qword ptr [rsp + 0x248], r11
03fe2 448b9c2444010000               mov        r11d, dword ptr [rsp + 0x144]
03fea 44899c243c020000               mov        dword ptr [rsp + 0x23c], r11d
03ff2 4c8b9c2458010000               mov        r11, qword ptr [rsp + 0x158]
03ffa 4c899c2450020000               mov        qword ptr [rsp + 0x250], r11
04002 4c8b9c2460010000               mov        r11, qword ptr [rsp + 0x160]
0400a 4c899c2458020000               mov        qword ptr [rsp + 0x258], r11
04012 448b9c2468010000               mov        r11d, dword ptr [rsp + 0x168]
0401a 44899c2460020000               mov        dword ptr [rsp + 0x260], r11d
04022 4c8b9c2490010000               mov        r11, qword ptr [rsp + 0x190]
0402a 488bbc2498010000               mov        rdi, qword ptr [rsp + 0x198]
04032 4c89ac2440020000               mov        qword ptr [rsp + 0x240], r13
0403a 4889bc2490030000               mov        qword ptr [rsp + 0x390], rdi
04042 448bac2488030000               mov        r13d, dword ptr [rsp + 0x388]
0404a 48bf00407260ea7f0000           movabs     rdi, 0x7fea60724000
04054 ff8700080000                   inc        dword ptr [rdi + 0x800]
0405a 488bfe                         mov        rdi, rsi
0405d 488bf2                         mov        rsi, rdx
04060 488bd0                         mov        rdx, rax
04063 8b842468030000                 mov        eax, dword ptr [rsp + 0x368]
0406a 8984248c030000                 mov        dword ptr [rsp + 0x38c], eax
04071 488b842440020000               mov        rax, qword ptr [rsp + 0x240]
04079 48898424c8010000               mov        qword ptr [rsp + 0x1c8], rax
04081 488b842448020000               mov        rax, qword ptr [rsp + 0x248]
04089 48898424d0010000               mov        qword ptr [rsp + 0x1d0], rax
04091 8b84243c020000                 mov        eax, dword ptr [rsp + 0x23c]
04098 898424d8010000                 mov        dword ptr [rsp + 0x1d8], eax
0409f 488b842450020000               mov        rax, qword ptr [rsp + 0x250]
040a7 48898424e0010000               mov        qword ptr [rsp + 0x1e0], rax
040af 488b842458020000               mov        rax, qword ptr [rsp + 0x258]
040b7 48898424e8010000               mov        qword ptr [rsp + 0x1e8], rax
040bf 8b842460020000                 mov        eax, dword ptr [rsp + 0x260]
040c6 4c899c24f0010000               mov        qword ptr [rsp + 0x1f0], r11
040ce 4c8b9c2490030000               mov        r11, qword ptr [rsp + 0x390]
040d6 898424dc010000                 mov        dword ptr [rsp + 0x1dc], eax
040dd 4c899c2498030000               mov        qword ptr [rsp + 0x398], r11
040e5 ffc7                           inc        edi
040e7 49bb00407260ea7f0000           movabs     r11, 0x7fea60724000
040f1 418b4374                       mov        eax, dword ptr [r11 + 0x74]
040f5 83c002                         add        eax, 2
040f8 41894374                       mov        dword ptr [r11 + 0x74], eax
040fc 25fe3f0000                     and        eax, 0x3ffe
04101 85c0                           test       eax, eax
04103 0f84d9130000                   je         0x7fea683ed862
04109 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0410d 418502                         test       dword ptr [r10], eax
04110 48b800407260ea7f0000           movabs     rax, 0x7fea60724000
0411a ff8028080000                   inc        dword ptr [rax + 0x828]
04120 488bc6                         mov        rax, rsi
04123 448b9c248c030000               mov        r11d, dword ptr [rsp + 0x38c]
0412b 488bb424c8010000               mov        rsi, qword ptr [rsp + 0x1c8]
04133 4889b42480010000               mov        qword ptr [rsp + 0x180], rsi
0413b 488bb424d0010000               mov        rsi, qword ptr [rsp + 0x1d0]
04143 4889b42450010000               mov        qword ptr [rsp + 0x150], rsi
0414b 8bb424d8010000                 mov        esi, dword ptr [rsp + 0x1d8]
04152 89b42444010000                 mov        dword ptr [rsp + 0x144], esi
04159 488bb424e0010000               mov        rsi, qword ptr [rsp + 0x1e0]
04161 4889b42458010000               mov        qword ptr [rsp + 0x158], rsi
04169 488bb424e8010000               mov        rsi, qword ptr [rsp + 0x1e8]
04171 4889b42460010000               mov        qword ptr [rsp + 0x160], rsi
04179 8bb424dc010000                 mov        esi, dword ptr [rsp + 0x1dc]
04180 89b42468010000                 mov        dword ptr [rsp + 0x168], esi
04187 488bb424f0010000               mov        rsi, qword ptr [rsp + 0x1f0]
0418f 4889b42490010000               mov        qword ptr [rsp + 0x190], rsi
04197 488bb42498030000               mov        rsi, qword ptr [rsp + 0x398]
0419f 44898c2474010000               mov        dword ptr [rsp + 0x174], r9d
041a7 899c246c010000                 mov        dword ptr [rsp + 0x16c], ebx
041ae 48898c2478010000               mov        qword ptr [rsp + 0x178], rcx
041b6 4c898424a8010000               mov        qword ptr [rsp + 0x1a8], r8
041be 899424a0010000                 mov        dword ptr [rsp + 0x1a0], edx
041c5 4c89b424b0010000               mov        qword ptr [rsp + 0x1b0], r14
041cd 4489ac2488010000               mov        dword ptr [rsp + 0x188], r13d
041d5 44899c248c010000               mov        dword ptr [rsp + 0x18c], r11d
041dd 4c8b8c2450010000               mov        r9, qword ptr [rsp + 0x150]
041e5 8b9c2444010000                 mov        ebx, dword ptr [rsp + 0x144]
041ec 448b842468010000               mov        r8d, dword ptr [rsp + 0x168]
041f4 4889b42498010000               mov        qword ptr [rsp + 0x198], rsi
041fc 488bd7                         mov        rdx, rdi
041ff 488bf0                         mov        rsi, rax
04202 488b842458010000               mov        rax, qword ptr [rsp + 0x158]
0420a 488bbc2460010000               mov        rdi, qword ptr [rsp + 0x160]
04212 e939c1ffff                     jmp        0x7fea683e86d0
04217 488bd6                         mov        rdx, rsi
0421a 488bb42498010000               mov        rsi, qword ptr [rsp + 0x198]
04222 4585db                         test       r11d, r11d
04225 48b900407260ea7f0000           movabs     rcx, 0x7fea60724000
0422f 41b880030000                   mov        r8d, 0x380
04235 7e06                           jle        0x7fea683ec5bd
04237 41b890030000                   mov        r8d, 0x390
0423d 4e8b0c01                       mov        r9, qword ptr [rcx + r8]
04241 4d8d4901                       lea        r9, [r9 + 1]
04245 4e890c01                       mov        qword ptr [rcx + r8], r9
04249 0f8e4c010000                   jle        0x7fea683ec71b
0424f 488bbc24c0010000               mov        rdi, qword ptr [rsp + 0x1c0]
04257 482bd7                         sub        rdx, rdi
0425a b900000000                     mov        ecx, 0
0425f 483bd1                         cmp        rdx, rcx
04262 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
0426c b9a0030000                     mov        ecx, 0x3a0
04271 7d05                           jge        0x7fea683ec5f8
04273 b9b0030000                     mov        ecx, 0x3b0
04278 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0427c 4d8d4001                       lea        r8, [r8 + 1]
04280 4c89040a                       mov        qword ptr [rdx + rcx], r8
04284 0f8d11010000                   jge        0x7fea683ec71b
0428a 488b5630                       mov        rdx, qword ptr [rsi + 0x30]
0428e be00000000                     mov        esi, 0
04293 483bd6                         cmp        rdx, rsi
04296 48be00407260ea7f0000           movabs     rsi, 0x7fea60724000
042a0 bac0030000                     mov        edx, 0x3c0
042a5 7505                           jne        0x7fea683ec62c
042a7 bad0030000                     mov        edx, 0x3d0
042ac 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
042b0 488d4901                       lea        rcx, [rcx + 1]
042b4 48890c16                       mov        qword ptr [rsi + rdx], rcx
042b8 0f85dd000000                   jne        0x7fea683ec71b
042be e9e2000000                     jmp        0x7fea683ec725
042c3 488bc6                         mov        rax, rsi
042c6 448b9c248c010000               mov        r11d, dword ptr [rsp + 0x18c]
042ce 488b8c2480010000               mov        rcx, qword ptr [rsp + 0x180]
042d6 498bd8                         mov        rbx, r8
042d9 488b942490010000               mov        rdx, qword ptr [rsp + 0x190]
042e1 2bd8                           sub        ebx, eax
042e3 48be00407260ea7f0000           movabs     rsi, 0x7fea60724000
042ed 4883864008000001               add        qword ptr [rsi + 0x840], 1
042f5 488bf2                         mov        rsi, rdx
042f8 488bd0                         mov        rdx, rax
042fb 4d8bc3                         mov        r8, r11
042fe 4c8bcb                         mov        r9, rbx
04301 44899c248c010000               mov        dword ptr [rsp + 0x18c], r11d
04309 899c24a0030000                 mov        dword ptr [rsp + 0x3a0], ebx
04310 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
04315 4c89442408                     mov        qword ptr [rsp + 8], r8
0431a 48890c24                       mov        qword ptr [rsp], rcx
0431e 4889542418                     mov        qword ptr [rsp + 0x18], rdx
04323 4889742420                     mov        qword ptr [rsp + 0x20], rsi
04328 488bfe                         mov        rdi, rsi
0432b 488bf2                         mov        rsi, rdx
0432e 488bd1                         mov        rdx, rcx
04331 498bc8                         mov        rcx, r8
04334 4d8bc1                         mov        r8, r9
04337 e884215107                     call       0x7fea6f8fe840
0433c 85c0                           test       eax, eax
0433e 0f842b000000                   je         0x7fea683ec6ef
04344 488bf8                         mov        rdi, rax
04347 83f7ff                         xor        edi, 0xffffffff
0434a 488b0c24                       mov        rcx, qword ptr [rsp]
0434e 4c8b442408                     mov        r8, qword ptr [rsp + 8]
04353 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
04358 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
0435d 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
04362 442bcf                         sub        r9d, edi
04365 03d7                           add        edx, edi
04367 4403c7                         add        r8d, edi
0436a e999110000                     jmp        0x7fea683ed888
0436f 8b9c24a0030000                 mov        ebx, dword ptr [rsp + 0x3a0]
04376 039c248c010000                 add        ebx, dword ptr [rsp + 0x18c]
0437d 488b942498010000               mov        rdx, qword ptr [rsp + 0x198]
04385 895a3c                         mov        dword ptr [rdx + 0x3c], ebx
04388 4881c4d0030000                 add        rsp, 0x3d0
0438f 5d                             pop        rbp
04390 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
04394 0f8784110000                   ja         0x7fea683ed89e
0439a c3                             ret        
0439b bb02000000                     mov        ebx, 2
043a0 e915000000                     jmp        0x7fea683ec73a
043a5 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
043af ff82e0030000                   inc        dword ptr [rdx + 0x3e0]
043b5 bb08000000                     mov        ebx, 8
043ba 899c24a4030000                 mov        dword ptr [rsp + 0x3a4], ebx
043c1 0f1f8000000000                 nop        dword ptr [rax]
043c8 e976110000                     jmp        0x7fea683ed8c3
043cd 90                             nop        
043ce 90                             nop        
043cf 90                             nop        
043d0 90                             nop        
043d1 90                             nop        
043d2 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
043d9 0f8573110000                   jne        0x7fea683ed8d2
043df 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
043e6 488d7828                       lea        rdi, [rax + 0x28]
043ea 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
043f1 0f875b110000                   ja         0x7fea683ed8d2
043f7 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
043fe 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
04405 488908                         mov        qword ptr [rax], rcx
04408 4833c9                         xor        rcx, rcx
0440b 48894808                       mov        qword ptr [rax + 8], rcx
0440f 48894810                       mov        qword ptr [rax + 0x10], rcx
04413 48894818                       mov        qword ptr [rax + 0x18], rcx
04417 48894820                       mov        qword ptr [rax + 0x20], rcx
0441b 0f1f440000                     nop        dword ptr [rax + rax]
04420 e949110000                     jmp        0x7fea683ed8ee
04425 90                             nop        
04426 90                             nop        
04427 90                             nop        
04428 90                             nop        
04429 90                             nop        
0442a 498bf3                         mov        rsi, r11
0442d 48898424a8030000               mov        qword ptr [rsp + 0x3a8], rax
04435 6690                           nop        
04437 e8a4405207                     call       0x7fea6f910860
0443c 0f1f84003445001c               nop        dword ptr [rax + rax + 0x1c004534]
04444 48ba00407260ea7f0000           movabs     rdx, 0x7fea60724000
0444e 488d9208040000                 lea        rdx, [rdx + 0x408]
04455 4885c0                         test       rax, rax
04458 750a                           jne        0x7fea683ec7e4
0445a f60201                         test       byte ptr [rdx], 1
0445d 7505                           jne        0x7fea683ec7e4
0445f f048830a01                     lock or    qword ptr [rdx], 1
04464 488b9424a8030000               mov        rdx, qword ptr [rsp + 0x3a8]
0446c 48b900407260ea7f0000           movabs     rcx, 0x7fea60724000
04476 4883811804000001               add        qword ptr [rcx + 0x418], 1
0447e 8b9424a4030000                 mov        edx, dword ptr [rsp + 0x3a4]
04485 488bc8                         mov        rcx, rax
04488 488bb424a8030000               mov        rsi, qword ptr [rsp + 0x3a8]
04490 0f1f8000000000                 nop        dword ptr [rax]
04497 e844365207                     call       0x7fea6f90fe60
0449c 0f1f84009445001d               nop        dword ptr [rax + rax + 0x1d004594]
044a4 488b8424a8030000               mov        rax, qword ptr [rsp + 0x3a8]
044ac e93a110000                     jmp        0x7fea683ed96b
044b1 0f1f8000000000                 nop        dword ptr [rax]
044b8 e9ca100000                     jmp        0x7fea683ed907
044bd 90                             nop        
044be 90                             nop        
044bf 90                             nop        
044c0 90                             nop        
044c1 90                             nop        
044c2 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
044c9 0f85c7100000                   jne        0x7fea683ed916
044cf 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
044d6 488d7828                       lea        rdi, [rax + 0x28]
044da 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
044e1 0f87af100000                   ja         0x7fea683ed916
044e7 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
044ee 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
044f5 488908                         mov        qword ptr [rax], rcx
044f8 4833c9                         xor        rcx, rcx
044fb 48894808                       mov        qword ptr [rax + 8], rcx
044ff 48894810                       mov        qword ptr [rax + 0x10], rcx
04503 48894818                       mov        qword ptr [rax + 0x18], rcx
04507 48894820                       mov        qword ptr [rax + 0x20], rcx
0450b 488bd0                         mov        rdx, rax
0450e 48b900407260ea7f0000           movabs     rcx, 0x7fea60724000
04518 4883815002000001               add        qword ptr [rcx + 0x250], 1
04520 ba02000000                     mov        edx, 2
04525 48b9a06326e200000000           movabs     rcx, 0xe22663a0
0452f 488bf0                         mov        rsi, rax
04532 48898424b0030000               mov        qword ptr [rsp + 0x3b0], rax
0453a 0f1f440000                     nop        dword ptr [rax + rax]
0453f e89c355207                     call       0x7fea6f90fe60
04544 0f1f84003c46001e               nop        dword ptr [rax + rax + 0x1e00463c]
0454c 488b8424b0030000               mov        rax, qword ptr [rsp + 0x3b0]
04554 e992100000                     jmp        0x7fea683ed96b
04559 0f1f8000000000                 nop        dword ptr [rax]
04560 e94d100000                     jmp        0x7fea683ed932
04565 90                             nop        
04566 90                             nop        
04567 90                             nop        
04568 90                             nop        
04569 90                             nop        
0456a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04571 0f854a100000                   jne        0x7fea683ed941
04577 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
0457e 488d7828                       lea        rdi, [rax + 0x28]
04582 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
04589 0f8732100000                   ja         0x7fea683ed941
0458f 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
04596 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0459d 488908                         mov        qword ptr [rax], rcx
045a0 4833c9                         xor        rcx, rcx
045a3 48894808                       mov        qword ptr [rax + 8], rcx
045a7 48894810                       mov        qword ptr [rax + 0x10], rcx
045ab 48894818                       mov        qword ptr [rax + 0x18], rcx
045af 48894820                       mov        qword ptr [rax + 0x20], rcx
045b3 488bd0                         mov        rdx, rax
045b6 48b900407260ea7f0000           movabs     rcx, 0x7fea60724000
045c0 4883813801000001               add        qword ptr [rcx + 0x138], 1
045c8 ba05000000                     mov        edx, 5
045cd 48b9e06326e200000000           movabs     rcx, 0xe22663e0
045d7 488bf0                         mov        rsi, rax
045da 48898424b8030000               mov        qword ptr [rsp + 0x3b8], rax
045e2 0f1f440000                     nop        dword ptr [rax + rax]
045e7 e8f4345207                     call       0x7fea6f90fe60
045ec 0f1f8400e446001f               nop        dword ptr [rax + rax + 0x1f0046e4]
045f4 488b8424b8030000               mov        rax, qword ptr [rsp + 0x3b8]
045fc e9ea0f0000                     jmp        0x7fea683ed96b
04601 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
04608 55                             push       rbp
04609 4881ecd0030000                 sub        rsp, 0x3d0
04610 41817f2000000000               cmp        dword ptr [r15 + 0x20], 0
04618 7405                           je         0x7fea683ec99f
0461a e801315107                     call       0x7fea6f8ffaa0
0461f bf40010000                     mov        edi, 0x140
04624 4863ff                         movsxd     rdi, edi
04627 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
0462b 48899c24a8020000               mov        qword ptr [rsp + 0x2a8], rbx
04633 bf38010000                     mov        edi, 0x138
04638 4863ff                         movsxd     rdi, edi
0463b 488b043e                       mov        rax, qword ptr [rsi + rdi]
0463f 48898424b0020000               mov        qword ptr [rsp + 0x2b0], rax
04647 bf30010000                     mov        edi, 0x130
0464c 4863ff                         movsxd     rdi, edi
0464f 8b143e                         mov        edx, dword ptr [rsi + rdi]
04652 bf28010000                     mov        edi, 0x128
04657 4863ff                         movsxd     rdi, edi
0465a 488b0c3e                       mov        rcx, qword ptr [rsi + rdi]
0465e bf20010000                     mov        edi, 0x120
04663 4863ff                         movsxd     rdi, edi
04666 4c8b043e                       mov        r8, qword ptr [rsi + rdi]
0466a bf18010000                     mov        edi, 0x118
0466f 4863ff                         movsxd     rdi, edi
04672 448b0c3e                       mov        r9d, dword ptr [rsi + rdi]
04676 bf08010000                     mov        edi, 0x108
0467b 4863ff                         movsxd     rdi, edi
0467e 4c8b1c3e                       mov        r11, qword ptr [rsi + rdi]
04682 bf00010000                     mov        edi, 0x100
04687 4863ff                         movsxd     rdi, edi
0468a 4c8b2c3e                       mov        r13, qword ptr [rsi + rdi]
0468e bff0000000                     mov        edi, 0xf0
04693 4863ff                         movsxd     rdi, edi
04696 448b343e                       mov        r14d, dword ptr [rsi + rdi]
0469a bfe8000000                     mov        edi, 0xe8
0469f 4863ff                         movsxd     rdi, edi
046a2 8b3c3e                         mov        edi, dword ptr [rsi + rdi]
046a5 bbd8000000                     mov        ebx, 0xd8
046aa 4863db                         movsxd     rbx, ebx
046ad 488b041e                       mov        rax, qword ptr [rsi + rbx]
046b1 48898424b8020000               mov        qword ptr [rsp + 0x2b8], rax
046b9 bba0000000                     mov        ebx, 0xa0
046be 4863db                         movsxd     rbx, ebx
046c1 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
046c4 899c249c020000                 mov        dword ptr [rsp + 0x29c], ebx
046cb bb90000000                     mov        ebx, 0x90
046d0 4863db                         movsxd     rbx, ebx
046d3 488b041e                       mov        rax, qword ptr [rsi + rbx]
046d7 48898424c0020000               mov        qword ptr [rsp + 0x2c0], rax
046df bb80000000                     mov        ebx, 0x80
046e4 4863db                         movsxd     rbx, ebx
046e7 488b041e                       mov        rax, qword ptr [rsi + rbx]
046eb bb78000000                     mov        ebx, 0x78
046f0 4863db                         movsxd     rbx, ebx
046f3 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
046f6 899c24c8020000                 mov        dword ptr [rsp + 0x2c8], ebx
046fd bb70000000                     mov        ebx, 0x70
04702 4863db                         movsxd     rbx, ebx
04705 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
04708 899c24cc020000                 mov        dword ptr [rsp + 0x2cc], ebx
0470f bb68000000                     mov        ebx, 0x68
04714 4863db                         movsxd     rbx, ebx
04717 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
0471a 899c24d0020000                 mov        dword ptr [rsp + 0x2d0], ebx
04721 bb10000000                     mov        ebx, 0x10
04726 4863db                         movsxd     rbx, ebx
04729 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
0472c 899c24d4020000                 mov        dword ptr [rsp + 0x2d4], ebx
04733 bb08000000                     mov        ebx, 8
04738 4863db                         movsxd     rbx, ebx
0473b 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
0473e 899c24d8020000                 mov        dword ptr [rsp + 0x2d8], ebx
04745 bb00000000                     mov        ebx, 0
0474a 4863db                         movsxd     rbx, ebx
0474d 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
04750 89bc24dc020000                 mov        dword ptr [rsp + 0x2dc], edi
04757 488bfe                         mov        rdi, rsi
0475a 89942404030000                 mov        dword ptr [rsp + 0x304], edx
04761 48898c2410030000               mov        qword ptr [rsp + 0x310], rcx
04769 4c89842408030000               mov        qword ptr [rsp + 0x308], r8
04771 44898c2400030000               mov        dword ptr [rsp + 0x300], r9d
04779 4c899c24f8020000               mov        qword ptr [rsp + 0x2f8], r11
04781 4c89ac24f0020000               mov        qword ptr [rsp + 0x2f0], r13
04789 4489b424e4020000               mov        dword ptr [rsp + 0x2e4], r14d
04791 48898424e8020000               mov        qword ptr [rsp + 0x2e8], rax
04799 899c24e0020000                 mov        dword ptr [rsp + 0x2e0], ebx
047a0 e81b2ddf20                     call       0x7fea891df840
047a5 0f1f840000000000               nop        dword ptr [rax + rax]
047ad 8b9c24e0020000                 mov        ebx, dword ptr [rsp + 0x2e0]
047b4 8bb424d8020000                 mov        esi, dword ptr [rsp + 0x2d8]
047bb 488bc6                         mov        rax, rsi
047be 8bb424d4020000                 mov        esi, dword ptr [rsp + 0x2d4]
047c5 4c8bee                         mov        r13, rsi
047c8 8bb424d0020000                 mov        esi, dword ptr [rsp + 0x2d0]
047cf 8b9424cc020000                 mov        edx, dword ptr [rsp + 0x2cc]
047d6 4c8bca                         mov        r9, rdx
047d9 8b9424c8020000                 mov        edx, dword ptr [rsp + 0x2c8]
047e0 4c8bda                         mov        r11, rdx
047e3 488b9424e8020000               mov        rdx, qword ptr [rsp + 0x2e8]
047eb 488bca                         mov        rcx, rdx
047ee 488b9424c0020000               mov        rdx, qword ptr [rsp + 0x2c0]
047f6 4c8bc2                         mov        r8, rdx
047f9 8b94249c020000                 mov        edx, dword ptr [rsp + 0x29c]
04800 488bfa                         mov        rdi, rdx
04803 488b9424b8020000               mov        rdx, qword ptr [rsp + 0x2b8]
0480b 4c8bf2                         mov        r14, rdx
0480e 8b9424dc020000                 mov        edx, dword ptr [rsp + 0x2dc]
04815 89942464020000                 mov        dword ptr [rsp + 0x264], edx
0481c 8b9424e4020000                 mov        edx, dword ptr [rsp + 0x2e4]
04823 89942470020000                 mov        dword ptr [rsp + 0x270], edx
0482a 488b9424f0020000               mov        rdx, qword ptr [rsp + 0x2f0]
04832 4889942478020000               mov        qword ptr [rsp + 0x278], rdx
0483a 488b9424f8020000               mov        rdx, qword ptr [rsp + 0x2f8]
04842 4889942480020000               mov        qword ptr [rsp + 0x280], rdx
0484a 8b942400030000                 mov        edx, dword ptr [rsp + 0x300]
04851 89942474020000                 mov        dword ptr [rsp + 0x274], edx
04858 488b942408030000               mov        rdx, qword ptr [rsp + 0x308]
04860 4889942488020000               mov        qword ptr [rsp + 0x288], rdx
04868 488b942410030000               mov        rdx, qword ptr [rsp + 0x310]
04870 4889942490020000               mov        qword ptr [rsp + 0x290], rdx
04878 8b942404030000                 mov        edx, dword ptr [rsp + 0x304]
0487f 89942498020000                 mov        dword ptr [rsp + 0x298], edx
04886 488b9424b0020000               mov        rdx, qword ptr [rsp + 0x2b0]
0488e 48899424a0020000               mov        qword ptr [rsp + 0x2a0], rdx
04896 488b9424a8020000               mov        rdx, qword ptr [rsp + 0x2a8]
0489e 89842428030000                 mov        dword ptr [rsp + 0x328], eax
048a5 4489ac2440030000               mov        dword ptr [rsp + 0x340], r13d
048ad 89b42420030000                 mov        dword ptr [rsp + 0x320], esi
048b4 44898c2444030000               mov        dword ptr [rsp + 0x344], r9d
048bc 44899c2450030000               mov        dword ptr [rsp + 0x350], r11d
048c4 48898c2458030000               mov        qword ptr [rsp + 0x358], rcx
048cc 4c89842448030000               mov        qword ptr [rsp + 0x348], r8
048d4 89bc2424030000                 mov        dword ptr [rsp + 0x324], edi
048db 4c89b42438030000               mov        qword ptr [rsp + 0x338], r14
048e3 4889942418030000               mov        qword ptr [rsp + 0x318], rdx
048eb e940dcffff                     jmp        0x7fea683ea8b0
048f0 49bad8e57060ea7f0000           movabs     r10, 0x7fea6070e5d8
048fa 4c89542408                     mov        qword ptr [rsp + 8], r10
048ff 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04907 e8d4a05e07                     call       0x7fea6f9d6d60
0490c e96cb7ffff                     jmp        0x7fea683e83fd
04911 49ba30261960ea7f0000           movabs     r10, 0x7fea60192630
0491b 4c89542408                     mov        qword ptr [rsp + 8], r10
04920 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04928 e8b3a05e07                     call       0x7fea6f9d6d60
0492d e9b8b8ffff                     jmp        0x7fea683e856a
04932 e829415e07                     call       0x7fea6f9d0de0
04937 e824415e07                     call       0x7fea6f9d0de0
0493c e81f415e07                     call       0x7fea6f9d0de0
04941 48891424                       mov        qword ptr [rsp], rdx
04945 48897c2408                     mov        qword ptr [rsp + 8], rdi
0494a e811385e07                     call       0x7fea6f9d04e0
0494f e80c415e07                     call       0x7fea6f9d0de0
04954 e807415e07                     call       0x7fea6f9d0de0
04959 48891424                       mov        qword ptr [rsp], rdx
0495d 4889442408                     mov        qword ptr [rsp + 8], rax
04962 e8f9375e07                     call       0x7fea6f9d04e0
04967 e8f4405e07                     call       0x7fea6f9d0de0
0496c e8ef405e07                     call       0x7fea6f9d0de0
04971 48c7042401000000               mov        qword ptr [rsp], 1
04979 4c894c2408                     mov        qword ptr [rsp + 8], r9
0497e e8dd375e07                     call       0x7fea6f9d04e0
04983 48c7042402000000               mov        qword ptr [rsp], 2
0498b 4c894c2408                     mov        qword ptr [rsp + 8], r9
04990 e8cb375e07                     call       0x7fea6f9d04e0
04995 48c7042400000000               mov        qword ptr [rsp], 0
0499d 4c894c2408                     mov        qword ptr [rsp + 8], r9
049a2 e8b9375e07                     call       0x7fea6f9d04e0
049a7 48c7042401000000               mov        qword ptr [rsp], 1
049af 4c894c2408                     mov        qword ptr [rsp + 8], r9
049b4 e8a7375e07                     call       0x7fea6f9d04e0
049b9 48c7042400000000               mov        qword ptr [rsp], 0
049c1 4c894c2408                     mov        qword ptr [rsp + 8], r9
049c6 e895375e07                     call       0x7fea6f9d04e0
049cb 49ba305a6360ea7f0000           movabs     r10, 0x7fea60635a30
049d5 4c89542408                     mov        qword ptr [rsp + 8], r10
049da 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049e2 e8f99f5e07                     call       0x7fea6f9d6d60
049e7 e982bfffff                     jmp        0x7fea683e8cee
049ec e86f405e07                     call       0x7fea6f9d0de0
049f1 49ba08297860ea7f0000           movabs     r10, 0x7fea60782908
049fb 4c89542408                     mov        qword ptr [rsp + 8], r10
04a00 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a08 e8d39f5e07                     call       0x7fea6f9d6d60
04a0d e907c0ffff                     jmp        0x7fea683e8d99
04a12 49ba30f51660ea7f0000           movabs     r10, 0x7fea6016f530
04a1c 4c89542408                     mov        qword ptr [rsp + 8], r10
04a21 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a29 e8b29f5e07                     call       0x7fea6f9d6d60
04a2e e927c0ffff                     jmp        0x7fea683e8dda
04a33 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04a3b e820815e07                     call       0x7fea6f9d4ee0
04a40 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04a48 e813815e07                     call       0x7fea6f9d4ee0
04a4d 49ba68cd6860ea7f0000           movabs     r10, 0x7fea6068cd68
04a57 4c89542408                     mov        qword ptr [rsp + 8], r10
04a5c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a64 e8779f5e07                     call       0x7fea6f9d6d60
04a69 e9c6c0ffff                     jmp        0x7fea683e8eb4
04a6e 49ba18366960ea7f0000           movabs     r10, 0x7fea60693618
04a78 4c89542408                     mov        qword ptr [rsp + 8], r10
04a7d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a85 e8569f5e07                     call       0x7fea6f9d6d60
04a8a e9ddc0ffff                     jmp        0x7fea683e8eec
04a8f 49ba60d76b60ea7f0000           movabs     r10, 0x7fea606bd760
04a99 4c89542408                     mov        qword ptr [rsp + 8], r10
04a9e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04aa6 e8359f5e07                     call       0x7fea6f9d6d60
04aab e92ac1ffff                     jmp        0x7fea683e8f5a
04ab0 49baf8736360ea7f0000           movabs     r10, 0x7fea606373f8
04aba 4c89542408                     mov        qword ptr [rsp + 8], r10
04abf 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ac7 e8149f5e07                     call       0x7fea6f9d6d60
04acc e93ec1ffff                     jmp        0x7fea683e8f8f
04ad1 49ba309d6b60ea7f0000           movabs     r10, 0x7fea606b9d30
04adb 4c89542408                     mov        qword ptr [rsp + 8], r10
04ae0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ae8 e8f39e5e07                     call       0x7fea6f9d6d60
04aed e952c1ffff                     jmp        0x7fea683e8fc4
04af2 49ba608c6360ea7f0000           movabs     r10, 0x7fea60638c60
04afc 4c89542408                     mov        qword ptr [rsp + 8], r10
04b01 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b09 e8d29e5e07                     call       0x7fea6f9d6d60
04b0e e949c2ffff                     jmp        0x7fea683e90dc
04b13 49ba48d64060ea7f0000           movabs     r10, 0x7fea6040d648
04b1d 4c89542408                     mov        qword ptr [rsp + 8], r10
04b22 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b2a e8b19e5e07                     call       0x7fea6f9d6d60
04b2f e96bc2ffff                     jmp        0x7fea683e911f
04b34 49bab0af3b60ea7f0000           movabs     r10, 0x7fea603bafb0
04b3e 4c89542408                     mov        qword ptr [rsp + 8], r10
04b43 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b4b e8909e5e07                     call       0x7fea6f9d6d60
04b50 e97ec2ffff                     jmp        0x7fea683e9153
04b55 48890424                       mov        qword ptr [rsp], rax
04b59 e802675e07                     call       0x7fea6f9d35e0
04b5e e8fd3e5e07                     call       0x7fea6f9d0de0
04b63 49bac0676360ea7f0000           movabs     r10, 0x7fea606367c0
04b6d 4c89542408                     mov        qword ptr [rsp + 8], r10
04b72 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b7a e8619e5e07                     call       0x7fea6f9d6d60
04b7f e90ec4ffff                     jmp        0x7fea683e9312
04b84 e8d73e5e07                     call       0x7fea6f9d0de0
04b89 49ba08297860ea7f0000           movabs     r10, 0x7fea60782908
04b93 4c89542408                     mov        qword ptr [rsp + 8], r10
04b98 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ba0 e83b9e5e07                     call       0x7fea6f9d6d60
04ba5 e9b0c4ffff                     jmp        0x7fea683e93da
04baa 49ba30f51660ea7f0000           movabs     r10, 0x7fea6016f530
04bb4 4c89542408                     mov        qword ptr [rsp + 8], r10
04bb9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bc1 e81a9e5e07                     call       0x7fea6f9d6d60
04bc6 e9cdc4ffff                     jmp        0x7fea683e9418
04bcb 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04bd3 e8887f5e07                     call       0x7fea6f9d4ee0
04bd8 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04be0 e87b7f5e07                     call       0x7fea6f9d4ee0
04be5 e8763e5e07                     call       0x7fea6f9d0de0
04bea 49ba608c6360ea7f0000           movabs     r10, 0x7fea60638c60
04bf4 4c89542408                     mov        qword ptr [rsp + 8], r10
04bf9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c01 e8da9d5e07                     call       0x7fea6f9d6d60
04c06 e980c6ffff                     jmp        0x7fea683e960b
04c0b 49ba48d64060ea7f0000           movabs     r10, 0x7fea6040d648
04c15 4c89542408                     mov        qword ptr [rsp + 8], r10
04c1a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c22 e8b99d5e07                     call       0x7fea6f9d6d60
04c27 e9acc6ffff                     jmp        0x7fea683e9658
04c2c 49bab0af3b60ea7f0000           movabs     r10, 0x7fea603bafb0
04c36 4c89542408                     mov        qword ptr [rsp + 8], r10
04c3b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c43 e8989d5e07                     call       0x7fea6f9d6d60
04c48 e9c3c6ffff                     jmp        0x7fea683e9690
04c4d 49ba305a6360ea7f0000           movabs     r10, 0x7fea60635a30
04c57 4c89542408                     mov        qword ptr [rsp + 8], r10
04c5c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c64 e8779d5e07                     call       0x7fea6f9d6d60
04c69 e9c2c7ffff                     jmp        0x7fea683e97b0
04c6e e8ed3d5e07                     call       0x7fea6f9d0de0
04c73 49ba08297860ea7f0000           movabs     r10, 0x7fea60782908
04c7d 4c89542408                     mov        qword ptr [rsp + 8], r10
04c82 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c8a e8519d5e07                     call       0x7fea6f9d6d60
04c8f e947c8ffff                     jmp        0x7fea683e985b
04c94 49ba30f51660ea7f0000           movabs     r10, 0x7fea6016f530
04c9e 4c89542408                     mov        qword ptr [rsp + 8], r10
04ca3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cab e8309d5e07                     call       0x7fea6f9d6d60
04cb0 e95fc8ffff                     jmp        0x7fea683e9894
04cb5 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04cbd e89e7e5e07                     call       0x7fea6f9d4ee0
04cc2 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04cca e8917e5e07                     call       0x7fea6f9d4ee0
04ccf 49ba68cd6860ea7f0000           movabs     r10, 0x7fea6068cd68
04cd9 4c89542408                     mov        qword ptr [rsp + 8], r10
04cde 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ce6 e8f59c5e07                     call       0x7fea6f9d6d60
04ceb e9f1c8ffff                     jmp        0x7fea683e9961
04cf0 49ba18366960ea7f0000           movabs     r10, 0x7fea60693618
04cfa 4c89542408                     mov        qword ptr [rsp + 8], r10
04cff 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d07 e8d49c5e07                     call       0x7fea6f9d6d60
04d0c e905c9ffff                     jmp        0x7fea683e9996
04d11 49ba60d76b60ea7f0000           movabs     r10, 0x7fea606bd760
04d1b 4c89542408                     mov        qword ptr [rsp + 8], r10
04d20 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d28 e8b39c5e07                     call       0x7fea6f9d6d60
04d2d e93cc9ffff                     jmp        0x7fea683e99ee
04d32 49baf8736360ea7f0000           movabs     r10, 0x7fea606373f8
04d3c 4c89542408                     mov        qword ptr [rsp + 8], r10
04d41 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d49 e8929c5e07                     call       0x7fea6f9d6d60
04d4e e951c9ffff                     jmp        0x7fea683e9a24
04d53 49ba309d6b60ea7f0000           movabs     r10, 0x7fea606b9d30
04d5d 4c89542408                     mov        qword ptr [rsp + 8], r10
04d62 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d6a e8719c5e07                     call       0x7fea6f9d6d60
04d6f e965c9ffff                     jmp        0x7fea683e9a59
04d74 49ba608c6360ea7f0000           movabs     r10, 0x7fea60638c60
04d7e 4c89542408                     mov        qword ptr [rsp + 8], r10
04d83 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d8b e8509c5e07                     call       0x7fea6f9d6d60
04d90 e956caffff                     jmp        0x7fea683e9b6b
04d95 49ba48d64060ea7f0000           movabs     r10, 0x7fea6040d648
04d9f 4c89542408                     mov        qword ptr [rsp + 8], r10
04da4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04dac e82f9c5e07                     call       0x7fea6f9d6d60
04db1 e979caffff                     jmp        0x7fea683e9baf
04db6 49bab0af3b60ea7f0000           movabs     r10, 0x7fea603bafb0
04dc0 4c89542408                     mov        qword ptr [rsp + 8], r10
04dc5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04dcd e80e9c5e07                     call       0x7fea6f9d6d60
04dd2 e98dcaffff                     jmp        0x7fea683e9be4
04dd7 48890424                       mov        qword ptr [rsp], rax
04ddb e880645e07                     call       0x7fea6f9d35e0
04de0 e87b3c5e07                     call       0x7fea6f9d0de0
04de5 49bac0676360ea7f0000           movabs     r10, 0x7fea606367c0
04def 4c89542408                     mov        qword ptr [rsp + 8], r10
04df4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04dfc e8df9b5e07                     call       0x7fea6f9d6d60
04e01 e924ccffff                     jmp        0x7fea683e9daa
04e06 e8553c5e07                     call       0x7fea6f9d0de0
04e0b 49ba08297860ea7f0000           movabs     r10, 0x7fea60782908
04e15 4c89542408                     mov        qword ptr [rsp + 8], r10
04e1a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e22 e8b99b5e07                     call       0x7fea6f9d6d60
04e27 e9c6ccffff                     jmp        0x7fea683e9e72
04e2c 49ba30f51660ea7f0000           movabs     r10, 0x7fea6016f530
04e36 4c89542408                     mov        qword ptr [rsp + 8], r10
04e3b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e43 e8989b5e07                     call       0x7fea6f9d6d60
04e48 e9e3ccffff                     jmp        0x7fea683e9eb0
04e4d 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04e55 e8067d5e07                     call       0x7fea6f9d4ee0
04e5a 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04e62 e8f97c5e07                     call       0x7fea6f9d4ee0
04e67 e8f43b5e07                     call       0x7fea6f9d0de0
04e6c 49ba608c6360ea7f0000           movabs     r10, 0x7fea60638c60
04e76 4c89542408                     mov        qword ptr [rsp + 8], r10
04e7b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e83 e8589b5e07                     call       0x7fea6f9d6d60
04e88 e996ceffff                     jmp        0x7fea683ea0a3
04e8d 49ba48d64060ea7f0000           movabs     r10, 0x7fea6040d648
04e97 4c89542408                     mov        qword ptr [rsp + 8], r10
04e9c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ea4 e8379b5e07                     call       0x7fea6f9d6d60
04ea9 e9c2ceffff                     jmp        0x7fea683ea0f0
04eae 49bab0af3b60ea7f0000           movabs     r10, 0x7fea603bafb0
04eb8 4c89542408                     mov        qword ptr [rsp + 8], r10
04ebd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ec5 e8169b5e07                     call       0x7fea6f9d6d60
04eca e9d9ceffff                     jmp        0x7fea683ea128
04ecf 49bad8e57060ea7f0000           movabs     r10, 0x7fea6070e5d8
04ed9 4c89542408                     mov        qword ptr [rsp + 8], r10
04ede 48c704240a020000               mov        qword ptr [rsp], 0x20a
04ee6 e8f59a5e07                     call       0x7fea6f9d6d60
04eeb e985cfffff                     jmp        0x7fea683ea1f5
04ef0 0f1f8000000000                 nop        dword ptr [rax]
04ef7 e8e4355207                     call       0x7fea6f910860
04efc e956d0ffff                     jmp        0x7fea683ea2d7
04f01 660f1f440000                   nop        word ptr [rax + rax]
04f07 e8d4355207                     call       0x7fea6f910860
04f0c e9b4d1ffff                     jmp        0x7fea683ea445
04f11 49ba680d7160ea7f0000           movabs     r10, 0x7fea60710d68
04f1b 4c89542408                     mov        qword ptr [rsp + 8], r10
04f20 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f28 e8b39a5e07                     call       0x7fea6f9d6d60
04f2d e918d2ffff                     jmp        0x7fea683ea4ca
04f32 49b80000000000000000           movabs     r8, 0
04f3c b8000f050a                     mov        eax, 0xa050f00
04f41 e89a915e07                     call       0x7fea6f9d6460
04f46 e905d2ffff                     jmp        0x7fea683ea4d0
04f4b 49bad8e57060ea7f0000           movabs     r10, 0x7fea6070e5d8
04f55 4c89542408                     mov        qword ptr [rsp + 8], r10
04f5a 48c70424aa020000               mov        qword ptr [rsp], 0x2aa
04f62 e8799a5e07                     call       0x7fea6f9d6d60
04f67 e930d3ffff                     jmp        0x7fea683ea61c
04f6c 49ba305a6360ea7f0000           movabs     r10, 0x7fea60635a30
04f76 4c89542408                     mov        qword ptr [rsp + 8], r10
04f7b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f83 e8589a5e07                     call       0x7fea6f9d6d60
04f88 e9ded5ffff                     jmp        0x7fea683ea8eb
04f8d e8ce3a5e07                     call       0x7fea6f9d0de0
04f92 49ba08297860ea7f0000           movabs     r10, 0x7fea60782908
04f9c 4c89542408                     mov        qword ptr [rsp + 8], r10
04fa1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04fa9 e8329a5e07                     call       0x7fea6f9d6d60
04fae e967d6ffff                     jmp        0x7fea683ea99a
04fb3 49ba30f51660ea7f0000           movabs     r10, 0x7fea6016f530
04fbd 4c89542408                     mov        qword ptr [rsp + 8], r10
04fc2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04fca e8119a5e07                     call       0x7fea6f9d6d60
04fcf e97ed6ffff                     jmp        0x7fea683ea9d2
04fd4 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04fdc e87f7b5e07                     call       0x7fea6f9d4ee0
04fe1 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04fe9 e8727b5e07                     call       0x7fea6f9d4ee0
04fee 49ba68cd6860ea7f0000           movabs     r10, 0x7fea6068cd68
04ff8 4c89542408                     mov        qword ptr [rsp + 8], r10
04ffd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05005 e8d6995e07                     call       0x7fea6f9d6d60
0500a e921d7ffff                     jmp        0x7fea683eaab0
0500f 49ba18366960ea7f0000           movabs     r10, 0x7fea60693618
05019 4c89542408                     mov        qword ptr [rsp + 8], r10
0501e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05026 e8b5995e07                     call       0x7fea6f9d6d60
0502b e933d7ffff                     jmp        0x7fea683eaae3
05030 49ba60d76b60ea7f0000           movabs     r10, 0x7fea606bd760
0503a 4c89542408                     mov        qword ptr [rsp + 8], r10
0503f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05047 e894995e07                     call       0x7fea6f9d6d60
0504c e96ed7ffff                     jmp        0x7fea683eab3f
05051 49baf8736360ea7f0000           movabs     r10, 0x7fea606373f8
0505b 4c89542408                     mov        qword ptr [rsp + 8], r10
05060 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05068 e873995e07                     call       0x7fea6f9d6d60
0506d e988d7ffff                     jmp        0x7fea683eab7a
05072 49ba309d6b60ea7f0000           movabs     r10, 0x7fea606b9d30
0507c 4c89542408                     mov        qword ptr [rsp + 8], r10
05081 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05089 e852995e07                     call       0x7fea6f9d6d60
0508e e999d7ffff                     jmp        0x7fea683eabac
05093 49ba608c6360ea7f0000           movabs     r10, 0x7fea60638c60
0509d 4c89542408                     mov        qword ptr [rsp + 8], r10
050a2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050aa e831995e07                     call       0x7fea6f9d6d60
050af e993d8ffff                     jmp        0x7fea683eacc7
050b4 49ba48d64060ea7f0000           movabs     r10, 0x7fea6040d648
050be 4c89542408                     mov        qword ptr [rsp + 8], r10
050c3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050cb e810995e07                     call       0x7fea6f9d6d60
050d0 e9b8d8ffff                     jmp        0x7fea683ead0d
050d5 49bab0af3b60ea7f0000           movabs     r10, 0x7fea603bafb0
050df 4c89542408                     mov        qword ptr [rsp + 8], r10
050e4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050ec e8ef985e07                     call       0x7fea6f9d6d60
050f1 e9cfd8ffff                     jmp        0x7fea683ead45
050f6 48890424                       mov        qword ptr [rsp], rax
050fa e861615e07                     call       0x7fea6f9d35e0
050ff e85c395e07                     call       0x7fea6f9d0de0
05104 49bac0676360ea7f0000           movabs     r10, 0x7fea606367c0
0510e 4c89542408                     mov        qword ptr [rsp + 8], r10
05113 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0511b e8c0985e07                     call       0x7fea6f9d6d60
05120 e965daffff                     jmp        0x7fea683eaf0a
05125 49ba08297860ea7f0000           movabs     r10, 0x7fea60782908
0512f 4c89542408                     mov        qword ptr [rsp + 8], r10
05134 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0513c e89f985e07                     call       0x7fea6f9d6d60
05141 e901dbffff                     jmp        0x7fea683eafc7
05146 49ba30f51660ea7f0000           movabs     r10, 0x7fea6016f530
05150 4c89542408                     mov        qword ptr [rsp + 8], r10
05155 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0515d e87e985e07                     call       0x7fea6f9d6d60
05162 e924dbffff                     jmp        0x7fea683eb00b
05167 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0516f e8ec795e07                     call       0x7fea6f9d4ee0
05174 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0517c e8df795e07                     call       0x7fea6f9d4ee0
05181 e8da385e07                     call       0x7fea6f9d0de0
05186 49ba608c6360ea7f0000           movabs     r10, 0x7fea60638c60
05190 4c89542408                     mov        qword ptr [rsp + 8], r10
05195 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0519d e83e985e07                     call       0x7fea6f9d6d60
051a2 e9ccdcffff                     jmp        0x7fea683eb1f3
051a7 49ba48d64060ea7f0000           movabs     r10, 0x7fea6040d648
051b1 4c89542408                     mov        qword ptr [rsp + 8], r10
051b6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
051be e81d985e07                     call       0x7fea6f9d6d60
051c3 e9f8dcffff                     jmp        0x7fea683eb240
051c8 49bab0af3b60ea7f0000           movabs     r10, 0x7fea603bafb0
051d2 4c89542408                     mov        qword ptr [rsp + 8], r10
051d7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
051df e8fc975e07                     call       0x7fea6f9d6d60
051e4 e90fddffff                     jmp        0x7fea683eb278
051e9 49bad8e57060ea7f0000           movabs     r10, 0x7fea6070e5d8
051f3 4c89542408                     mov        qword ptr [rsp + 8], r10
051f8 48c70424e8020000               mov        qword ptr [rsp], 0x2e8
05200 e8db975e07                     call       0x7fea6f9d6d60
05205 e9b8ddffff                     jmp        0x7fea683eb342
0520a 49ba680d7160ea7f0000           movabs     r10, 0x7fea60710d68
05214 4c89542408                     mov        qword ptr [rsp + 8], r10
05219 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05221 e8ba975e07                     call       0x7fea6f9d6d60
05226 e96fdfffff                     jmp        0x7fea683eb51a
0522b 49b80000000000000000           movabs     r8, 0
05235 b8000f050a                     mov        eax, 0xa050f00
0523a e8a18e5e07                     call       0x7fea6f9d6460
0523f e95cdfffff                     jmp        0x7fea683eb520
05244 49bad8e57060ea7f0000           movabs     r10, 0x7fea6070e5d8
0524e 4c89542408                     mov        qword ptr [rsp + 8], r10
05253 48c7042420030000               mov        qword ptr [rsp], 0x320
0525b e880975e07                     call       0x7fea6f9d6d60
05260 e987e0ffff                     jmp        0x7fea683eb66c
05265 49ba305a6360ea7f0000           movabs     r10, 0x7fea60635a30
0526f 4c89542408                     mov        qword ptr [rsp + 8], r10
05274 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0527c e85f975e07                     call       0x7fea6f9d6d60
05281 e905e3ffff                     jmp        0x7fea683eb90b
05286 e8d5375e07                     call       0x7fea6f9d0de0
0528b 49ba08297860ea7f0000           movabs     r10, 0x7fea60782908
05295 4c89542408                     mov        qword ptr [rsp + 8], r10
0529a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052a2 e839975e07                     call       0x7fea6f9d6d60
052a7 e988e3ffff                     jmp        0x7fea683eb9b4
052ac 49ba30f51660ea7f0000           movabs     r10, 0x7fea6016f530
052b6 4c89542408                     mov        qword ptr [rsp + 8], r10
052bb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052c3 e818975e07                     call       0x7fea6f9d6d60
052c8 e9a0e3ffff                     jmp        0x7fea683eb9ed
052cd 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
052d5 e886785e07                     call       0x7fea6f9d4ee0
052da 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
052e2 e879785e07                     call       0x7fea6f9d4ee0
052e7 49ba68cd6860ea7f0000           movabs     r10, 0x7fea6068cd68
052f1 4c89542408                     mov        qword ptr [rsp + 8], r10
052f6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052fe e8dd965e07                     call       0x7fea6f9d6d60
05303 e92ce4ffff                     jmp        0x7fea683ebab4
05308 49ba18366960ea7f0000           movabs     r10, 0x7fea60693618
05312 4c89542408                     mov        qword ptr [rsp + 8], r10
05317 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0531f e8bc965e07                     call       0x7fea6f9d6d60
05324 e93ee4ffff                     jmp        0x7fea683ebae7
05329 49ba60d76b60ea7f0000           movabs     r10, 0x7fea606bd760
05333 4c89542408                     mov        qword ptr [rsp + 8], r10
05338 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05340 e89b965e07                     call       0x7fea6f9d6d60
05345 e975e4ffff                     jmp        0x7fea683ebb3f
0534a 49baf8736360ea7f0000           movabs     r10, 0x7fea606373f8
05354 4c89542408                     mov        qword ptr [rsp + 8], r10
05359 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05361 e87a965e07                     call       0x7fea6f9d6d60
05366 e98ae4ffff                     jmp        0x7fea683ebb75
0536b 49ba309d6b60ea7f0000           movabs     r10, 0x7fea606b9d30
05375 4c89542408                     mov        qword ptr [rsp + 8], r10
0537a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05382 e859965e07                     call       0x7fea6f9d6d60
05387 e99ce4ffff                     jmp        0x7fea683ebba8
0538c 49ba608c6360ea7f0000           movabs     r10, 0x7fea60638c60
05396 4c89542408                     mov        qword ptr [rsp + 8], r10
0539b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053a3 e838965e07                     call       0x7fea6f9d6d60
053a8 e98be5ffff                     jmp        0x7fea683ebcb8
053ad 49ba48d64060ea7f0000           movabs     r10, 0x7fea6040d648
053b7 4c89542408                     mov        qword ptr [rsp + 8], r10
053bc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053c4 e817965e07                     call       0x7fea6f9d6d60
053c9 e9abe5ffff                     jmp        0x7fea683ebcf9
053ce 49bab0af3b60ea7f0000           movabs     r10, 0x7fea603bafb0
053d8 4c89542408                     mov        qword ptr [rsp + 8], r10
053dd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053e5 e8f6955e07                     call       0x7fea6f9d6d60
053ea e9bde5ffff                     jmp        0x7fea683ebd2c
053ef 48890424                       mov        qword ptr [rsp], rax
053f3 e8685e5e07                     call       0x7fea6f9d35e0
053f8 e863365e07                     call       0x7fea6f9d0de0
053fd 49bac0676360ea7f0000           movabs     r10, 0x7fea606367c0
05407 4c89542408                     mov        qword ptr [rsp + 8], r10
0540c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05414 e8c7955e07                     call       0x7fea6f9d6d60
05419 e94ce7ffff                     jmp        0x7fea683ebeea
0541e 49ba08297860ea7f0000           movabs     r10, 0x7fea60782908
05428 4c89542408                     mov        qword ptr [rsp + 8], r10
0542d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05435 e8a6955e07                     call       0x7fea6f9d6d60
0543a e9e8e7ffff                     jmp        0x7fea683ebfa7
0543f 49ba30f51660ea7f0000           movabs     r10, 0x7fea6016f530
05449 4c89542408                     mov        qword ptr [rsp + 8], r10
0544e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05456 e885955e07                     call       0x7fea6f9d6d60
0545b e90fe8ffff                     jmp        0x7fea683ebfef
05460 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05468 e8f3765e07                     call       0x7fea6f9d4ee0
0546d 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05475 e8e6765e07                     call       0x7fea6f9d4ee0
0547a e8e1355e07                     call       0x7fea6f9d0de0
0547f 49ba608c6360ea7f0000           movabs     r10, 0x7fea60638c60
05489 4c89542408                     mov        qword ptr [rsp + 8], r10
0548e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05496 e845955e07                     call       0x7fea6f9d6d60
0549b e9bbe9ffff                     jmp        0x7fea683ec1db
054a0 49ba48d64060ea7f0000           movabs     r10, 0x7fea6040d648
054aa 4c89542408                     mov        qword ptr [rsp + 8], r10
054af 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
054b7 e824955e07                     call       0x7fea6f9d6d60
054bc e9e7e9ffff                     jmp        0x7fea683ec228
054c1 49bab0af3b60ea7f0000           movabs     r10, 0x7fea603bafb0
054cb 4c89542408                     mov        qword ptr [rsp + 8], r10
054d0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
054d8 e803955e07                     call       0x7fea6f9d6d60
054dd e9fee9ffff                     jmp        0x7fea683ec260
054e2 49bad8e57060ea7f0000           movabs     r10, 0x7fea6070e5d8
054ec 4c89542408                     mov        qword ptr [rsp + 8], r10
054f1 48c704245a030000               mov        qword ptr [rsp], 0x35a
054f9 e8e2945e07                     call       0x7fea6f9d6d60
054fe e906ecffff                     jmp        0x7fea683ec489
05503 e858355e07                     call       0x7fea6f9d0de0
05508 0f1f8000000000                 nop        dword ptr [rax]
0550f e8cc2f5207                     call       0x7fea6f910860
05514 e956eeffff                     jmp        0x7fea683ec6ef
05519 e842355e07                     call       0x7fea6f9d0de0
0551e 49ba10c73e68ea7f0000           movabs     r10, 0x7fea683ec710
05528 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0552f e92c565207                     jmp        0x7fea6f912ee0
05534 48ba0000000000000000           movabs     rdx, 0
0553e b8000f050a                     mov        eax, 0xa050f00
05543 e8987f5e07                     call       0x7fea6f9d5860
05548 e97beeffff                     jmp        0x7fea683ec748
0554d e80e355e07                     call       0x7fea6f9d0de0
05552 488bd2                         mov        rdx, rdx
05555 e886425e07                     call       0x7fea6f9d1b60
0555a e9bceeffff                     jmp        0x7fea683ec79b
0555f 48ba0000000000000000           movabs     rdx, 0
05569 b8000f050a                     mov        eax, 0xa050f00
0556e e86d8b5e07                     call       0x7fea6f9d6460
05573 e9a8eeffff                     jmp        0x7fea683ec7a0
05578 48ba0000000000000000           movabs     rdx, 0
05582 b8000f050a                     mov        eax, 0xa050f00
05587 e8547f5e07                     call       0x7fea6f9d5860
0558c e927efffff                     jmp        0x7fea683ec838
05591 e8ca345e07                     call       0x7fea6f9d0de0
05596 488bd2                         mov        rdx, rdx
05599 e842425e07                     call       0x7fea6f9d1b60
0559e e968efffff                     jmp        0x7fea683ec88b
055a3 48ba0000000000000000           movabs     rdx, 0
055ad b8000f050a                     mov        eax, 0xa050f00
055b2 e8297f5e07                     call       0x7fea6f9d5860
055b7 e9a4efffff                     jmp        0x7fea683ec8e0
055bc e89f345e07                     call       0x7fea6f9d0de0
055c1 488bd2                         mov        rdx, rdx
055c4 e817425e07                     call       0x7fea6f9d1b60
055c9 e9e5efffff                     jmp        0x7fea683ec933
055ce 498b8778050000                 mov        rax, qword ptr [r15 + 0x578]
055d5 49c7877805000000000000         mov        qword ptr [r15 + 0x578], 0
055e0 49c7878005000000000000         mov        qword ptr [r15 + 0x580], 0
055eb 4881c4d0030000                 add        rsp, 0x3d0
055f2 5d                             pop        rbp
055f3 e968255e07                     jmp        0x7fea6f9cfee0
