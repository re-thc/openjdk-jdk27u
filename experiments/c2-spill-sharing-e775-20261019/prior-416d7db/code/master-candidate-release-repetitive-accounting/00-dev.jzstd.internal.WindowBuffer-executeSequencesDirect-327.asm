00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f8540ec5307                   jne        0x7fbe2f8fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecd0030000                 sub        rsp, 0x3d0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 7405                           je         0x7fbe283bbd3f
0003a e861ed5207                     call       0x7fbe2f8eaaa0
0003f 898c2420010000                 mov        dword ptr [rsp + 0x120], ecx
00046 4c89842428010000               mov        qword ptr [rsp + 0x128], r8
0004e 4c898c2430010000               mov        qword ptr [rsp + 0x130], r9
00056 89bc2424010000                 mov        dword ptr [rsp + 0x124], edi
0005d 48bb88b15220be7f0000           movabs     rbx, 0x7fbe2052b188
00067 8b4370                         mov        eax, dword ptr [rbx + 0x70]
0006a 83c002                         add        eax, 2
0006d 894370                         mov        dword ptr [rbx + 0x70], eax
00070 25fe070000                     and        eax, 0x7fe
00075 85c0                           test       eax, eax
00077 0f842b480000                   je         0x7fbe283c05a8
0007d 48bb88b15220be7f0000           movabs     rbx, 0x7fbe2052b188
00087 ff83a8000000                   inc        dword ptr [rbx + 0xa8]
0008d 8b9c24e0030000                 mov        ebx, dword ptr [rsp + 0x3e0]
00094 8b4640                         mov        eax, dword ptr [rsi + 0x40]
00097 448b5e38                       mov        r11d, dword ptr [rsi + 0x38]
0009b 448b6e04                       mov        r13d, dword ptr [rsi + 4]
0009f 4c8b7608                       mov        r14, qword ptr [rsi + 8]
000a3 488b4e10                       mov        rcx, qword ptr [rsi + 0x10]
000a7 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000ab 4d63cb                         movsxd     r9, r11d
000ae 4d03ce                         add        r9, r14
000b1 498bfd                         mov        rdi, r13
000b4 412bfb                         sub        edi, r11d
000b7 3bdf                           cmp        ebx, edi
000b9 48bf88b15220be7f0000           movabs     rdi, 0x7fbe2052b188
000c3 4889842438010000               mov        qword ptr [rsp + 0x138], rax
000cb b8f8000000                     mov        eax, 0xf8
000d0 7f05                           jg         0x7fbe283bbdd7
000d2 b808010000                     mov        eax, 0x108
000d7 44899c2440010000               mov        dword ptr [rsp + 0x140], r11d
000df 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
000e3 4d8d5b01                       lea        r11, [r11 + 1]
000e7 4c891c07                       mov        qword ptr [rdi + rax], r11
000eb 0f8f28440000                   jg         0x7fbe283c0219
000f1 4863db                         movsxd     rbx, ebx
000f4 488b7e20                       mov        rdi, qword ptr [rsi + 0x20]
000f8 492bf9                         sub        rdi, r9
000fb 483bfb                         cmp        rdi, rbx
000fe 48bf88b15220be7f0000           movabs     rdi, 0x7fbe2052b188
00108 b828010000                     mov        eax, 0x128
0010d 7c05                           jl         0x7fbe283bbe14
0010f b818010000                     mov        eax, 0x118
00114 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
00118 4d8d5b01                       lea        r11, [r11 + 1]
0011c 4c891c07                       mov        qword ptr [rdi + rax], r11
00120 0f8cf3430000                   jl         0x7fbe283c0219
00126 48bf88b15220be7f0000           movabs     rdi, 0x7fbe2052b188
00130 ff8758010000                   inc        dword ptr [rdi + 0x158]
00136 498bf8                         mov        rdi, r8
00139 4883ff00                       cmp        rdi, 0
0013d 48bf88b15220be7f0000           movabs     rdi, 0x7fbe2052b188
00147 b868010000                     mov        eax, 0x168
0014c 7505                           jne        0x7fbe283bbe53
0014e b878010000                     mov        eax, 0x178
00153 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
00157 4d8d5b01                       lea        r11, [r11 + 1]
0015b 4c891c07                       mov        qword ptr [rdi + rax], r11
0015f 0f8531000000                   jne        0x7fbe283bbe96
00165 4903d9                         add        rbx, r9
00168 488bf9                         mov        rdi, rcx
0016b 483bfb                         cmp        rdi, rbx
0016e 48bf88b15220be7f0000           movabs     rdi, 0x7fbe2052b188
00178 bb98010000                     mov        ebx, 0x198
0017d 7d05                           jge        0x7fbe283bbe84
0017f bb88010000                     mov        ebx, 0x188
00184 488b041f                       mov        rax, qword ptr [rdi + rbx]
00188 488d4001                       lea        rax, [rax + 1]
0018c 4889041f                       mov        qword ptr [rdi + rbx], rax
00190 0f8d0a000000                   jge        0x7fbe283bbea0
00196 bf00000000                     mov        edi, 0
0019b e915000000                     jmp        0x7fbe283bbeb5
001a0 48bf88b15220be7f0000           movabs     rdi, 0x7fbe2052b188
001aa ff87a8010000                   inc        dword ptr [rdi + 0x1a8]
001b0 bf01000000                     mov        edi, 1
001b5 4d2bc6                         sub        r8, r14
001b8 48bb88b15220be7f0000           movabs     rbx, 0x7fbe2052b188
001c2 488383c001000001               add        qword ptr [rbx + 0x1c0], 1
001ca 48bbe0c26e20be7f0000           movabs     rbx, 0x7fbe206ec2e0
001d4 8b4370                         mov        eax, dword ptr [rbx + 0x70]
001d7 83c002                         add        eax, 2
001da 894370                         mov        dword ptr [rbx + 0x70], eax
001dd 25feff1f00                     and        eax, 0x1ffffe
001e2 85c0                           test       eax, eax
001e4 0f84df460000                   je         0x7fbe283c05c9
001ea 48bbffffffffffffff7f           movabs     rbx, 0x7fffffffffffffff
001f4 483bd9                         cmp        rbx, rcx
001f7 48bbe0c26e20be7f0000           movabs     rbx, 0x7fbe206ec2e0
00201 b8b8000000                     mov        eax, 0xb8
00206 7d05                           jge        0x7fbe283bbf0d
00208 b8a8000000                     mov        eax, 0xa8
0020d 4c8b0c03                       mov        r9, qword ptr [rbx + rax]
00211 4d8d4901                       lea        r9, [r9 + 1]
00215 4c890c03                       mov        qword ptr [rbx + rax], r9
00219 0f8d0f000000                   jge        0x7fbe283bbf2e
0021f 48b9ffffffffffffff7f           movabs     rcx, 0x7fffffffffffffff
00229 e910000000                     jmp        0x7fbe283bbf3e
0022e 48bbe0c26e20be7f0000           movabs     rbx, 0x7fbe206ec2e0
00238 ff83c8000000                   inc        dword ptr [rbx + 0xc8]
0023e 448b9c2440010000               mov        r11d, dword ptr [rsp + 0x140]
00246 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0024e 488b9c24e8030000               mov        rbx, qword ptr [rsp + 0x3e8]
00256 4889b42448010000               mov        qword ptr [rsp + 0x148], rsi
0025e 498bf5                         mov        rsi, r13
00261 83ee20                         sub        esi, 0x20
00264 448b4a04                       mov        r9d, dword ptr [rdx + 4]
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
00359 48bb88b15220be7f0000           movabs     rbx, 0x7fbe2052b188
00363 41bbd0010000                   mov        r11d, 0x1d0
00369 7d06                           jge        0x7fbe283bc071
0036b 41bbe0010000                   mov        r11d, 0x1e0
00371 4e8b2c1b                       mov        r13, qword ptr [rbx + r11]
00375 4d8d6d01                       lea        r13, [r13 + 1]
00379 4e892c1b                       mov        qword ptr [rbx + r11], r13
0037d 0f8d103f0000                   jge        0x7fbe283bff93
00383 3b5704                         cmp        edx, dword ptr [rdi + 4]
00386 0f836d450000                   jae        0x7fbe283c05f9
0038c 4863ca                         movsxd     rcx, edx
0038f 4c8b5ccf08                     mov        r11, qword ptr [rdi + rcx*8 + 8]
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
003d7 48b988b15220be7f0000           movabs     rcx, 0x7fbe2052b188
003e1 bff0010000                     mov        edi, 0x1f0
003e6 7d05                           jge        0x7fbe283bc0ed
003e8 bf00020000                     mov        edi, 0x200
003ed 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
003f1 488d5b01                       lea        rbx, [rbx + 1]
003f5 48891c39                       mov        qword ptr [rcx + rdi], rbx
003f9 0f8d13000000                   jge        0x7fbe283bc112
003ff 3b5004                         cmp        edx, dword ptr [rax + 4]
00402 0f8309450000                   jae        0x7fbe283c0611
00408 4863ca                         movsxd     rcx, edx
0040b 8b4c8808                       mov        ecx, dword ptr [rax + rcx*4 + 8]
0040f 4c8bd9                         mov        r11, rcx
00412 4585ed                         test       r13d, r13d
00415 48b988b15220be7f0000           movabs     rcx, 0x7fbe2052b188
0041f bf10020000                     mov        edi, 0x210
00424 7405                           je         0x7fbe283bc12b
00426 bf20020000                     mov        edi, 0x220
0042b 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
0042f 488d5b01                       lea        rbx, [rbx + 1]
00433 48891c39                       mov        qword ptr [rcx + rdi], rbx
00437 0f8430000000                   je         0x7fbe283bc16d
0043d 498bd8                         mov        rbx, r8
00440 2bde                           sub        ebx, esi
00442 443beb                         cmp        r13d, ebx
00445 48b988b15220be7f0000           movabs     rcx, 0x7fbe2052b188
0044f bf40020000                     mov        edi, 0x240
00454 7f05                           jg         0x7fbe283bc15b
00456 bf30020000                     mov        edi, 0x230
0045b 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
0045f 488d5b01                       lea        rbx, [rbx + 1]
00463 48891c39                       mov        qword ptr [rcx + rdi], rbx
00467 0f8f0c400000                   jg         0x7fbe283c0179
0046d 4183fb03                       cmp        r11d, 3
00471 48b988b15220be7f0000           movabs     rcx, 0x7fbe2052b188
0047b bf60020000                     mov        edi, 0x260
00480 7e05                           jle        0x7fbe283bc187
00482 bf70020000                     mov        edi, 0x270
00487 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
0048b 488d5b01                       lea        rbx, [rbx + 1]
0048f 48891c39                       mov        qword ptr [rcx + rdi], rbx
00493 0f8e9c000000                   jle        0x7fbe283bc235
00499 4183eb03                       sub        r11d, 3
0049d 4183790401                     cmp        dword ptr [r9 + 4], 1
004a2 0f8681440000                   jbe        0x7fbe283c0629
004a8 418b490c                       mov        ecx, dword ptr [r9 + 0xc]
004ac 4183790402                     cmp        dword ptr [r9 + 4], 2
004b1 0f8684440000                   jbe        0x7fbe283c063b
004b7 41894910                       mov        dword ptr [r9 + 0x10], ecx
004bb 4183790400                     cmp        dword ptr [r9 + 4], 0
004c0 0f8687440000                   jbe        0x7fbe283c064d
004c6 418b4908                       mov        ecx, dword ptr [r9 + 8]
004ca 4183790401                     cmp        dword ptr [r9 + 4], 1
004cf 0f868a440000                   jbe        0x7fbe283c065f
004d5 4189490c                       mov        dword ptr [r9 + 0xc], ecx
004d9 4183790400                     cmp        dword ptr [r9 + 4], 0
004de 0f868d440000                   jbe        0x7fbe283c0671
004e4 45895908                       mov        dword ptr [r9 + 8], r11d
004e8 48b988b15220be7f0000           movabs     rcx, 0x7fbe2052b188
004f2 ff8180020000                   inc        dword ptr [rcx + 0x280]
004f8 498bcd                         mov        rcx, r13
004fb 89942470010000                 mov        dword ptr [rsp + 0x170], edx
00502 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
0050a 89b424bc010000                 mov        dword ptr [rsp + 0x1bc], esi
00511 8b9c248c010000                 mov        ebx, dword ptr [rsp + 0x18c]
00518 4c898c2450010000               mov        qword ptr [rsp + 0x150], r9
00520 4889842458010000               mov        qword ptr [rsp + 0x158], rax
00528 4489842468010000               mov        dword ptr [rsp + 0x168], r8d
00530 e968000000                     jmp        0x7fbe283bc29d
00535 89942470010000                 mov        dword ptr [rsp + 0x170], edx
0053c 89b424bc010000                 mov        dword ptr [rsp + 0x1bc], esi
00543 4889842458010000               mov        qword ptr [rsp + 0x158], rax
0054b 4489842468010000               mov        dword ptr [rsp + 0x168], r8d
00553 48bf88b15220be7f0000           movabs     rdi, 0x7fbe2052b188
0055d 4883879802000001               add        qword ptr [rdi + 0x298], 1
00565 498bf1                         mov        rsi, r9
00568 498bd3                         mov        rdx, r11
0056b 498bcd                         mov        rcx, r13
0056e 4c898c2450010000               mov        qword ptr [rsp + 0x150], r9
00576 90                             nop        
00577 e8e4f55307                     call       0x7fbe2f8fb860
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
005b2 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
005bc 41b8b8020000                   mov        r8d, 0x2b8
005c2 7d06                           jge        0x7fbe283bc2ca
005c4 41b8a8020000                   mov        r8d, 0x2a8
005ca 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
005ce 4d8d4901                       lea        r9, [r9 + 1]
005d2 4e890c02                       mov        qword ptr [rdx + r8], r9
005d6 0f8d14000000                   jge        0x7fbe283bc2f0
005dc 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
005e4 8b8424a0010000                 mov        eax, dword ptr [rsp + 0x1a0]
005eb e9b2000000                     jmp        0x7fbe283bc3a2
005f0 8b8424a0010000                 mov        eax, dword ptr [rsp + 0x1a0]
005f7 85c0                           test       eax, eax
005f9 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
00603 41b8c8020000                   mov        r8d, 0x2c8
00609 7506                           jne        0x7fbe283bc311
0060b 41b8d8020000                   mov        r8d, 0x2d8
00611 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
00615 4d8d4901                       lea        r9, [r9 + 1]
00619 4e890c02                       mov        qword ptr [rdx + r8], r9
0061d 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
00625 0f856d000000                   jne        0x7fbe283bc398
0062b 488bd3                         mov        rdx, rbx
0062e 03d1                           add        edx, ecx
00630 412bd3                         sub        edx, r11d
00633 4863d2                         movsxd     rdx, edx
00636 493bd0                         cmp        rdx, r8
00639 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
00643 41b9e8020000                   mov        r9d, 0x2e8
00649 7c06                           jl         0x7fbe283bc351
0064b 41b9f8020000                   mov        r9d, 0x2f8
00651 4e8b2c0a                       mov        r13, qword ptr [rdx + r9]
00655 4d8d6d01                       lea        r13, [r13 + 1]
00659 4e892c0a                       mov        qword ptr [rdx + r9], r13
0065d 0f8c3f000000                   jl         0x7fbe283bc3a2
00663 488b942478010000               mov        rdx, qword ptr [rsp + 0x178]
0066b 483bd7                         cmp        rdx, rdi
0066e 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
00678 41b918030000                   mov        r9d, 0x318
0067e 7c06                           jl         0x7fbe283bc386
00680 41b908030000                   mov        r9d, 0x308
00686 4e8b2c0a                       mov        r13, qword ptr [rdx + r9]
0068a 4d8d6d01                       lea        r13, [r13 + 1]
0068e 4e892c0a                       mov        qword ptr [rdx + r9], r13
00692 0f8c0a000000                   jl         0x7fbe283bc3a2
00698 ba00000000                     mov        edx, 0
0069d e915000000                     jmp        0x7fbe283bc3b7
006a2 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
006ac ff8228030000                   inc        dword ptr [rdx + 0x328]
006b2 ba01000000                     mov        edx, 1
006b7 4889bc24c0010000               mov        qword ptr [rsp + 0x1c0], rdi
006bf 4585db                         test       r11d, r11d
006c2 49b988b15220be7f0000           movabs     r9, 0x7fbe2052b188
006cc 41bd40030000                   mov        r13d, 0x340
006d2 7e06                           jle        0x7fbe283bc3da
006d4 41bd50030000                   mov        r13d, 0x350
006da 4b8b3c29                       mov        rdi, qword ptr [r9 + r13]
006de 488d7f01                       lea        rdi, [rdi + 1]
006e2 4b893c29                       mov        qword ptr [r9 + r13], rdi
006e6 0f8efb3a0000                   jle        0x7fbe283bfee7
006ec 85d2                           test       edx, edx
006ee 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
006f8 41b970030000                   mov        r9d, 0x370
006fe 7506                           jne        0x7fbe283bc406
00700 41b960030000                   mov        r9d, 0x360
00706 4a8b3c0a                       mov        rdi, qword ptr [rdx + r9]
0070a 488d7f01                       lea        rdi, [rdi + 1]
0070e 4a893c0a                       mov        qword ptr [rdx + r9], rdi
00712 0f85cf3a0000                   jne        0x7fbe283bfee7
00718 4c8beb                         mov        r13, rbx
0071b 4403e9                         add        r13d, ecx
0071e 4489ac2404020000               mov        dword ptr [rsp + 0x204], r13d
00726 498bf5                         mov        rsi, r13
00729 03b424a4010000                 add        esi, dword ptr [rsp + 0x1a4]
00730 3bb4246c010000                 cmp        esi, dword ptr [rsp + 0x16c]
00737 48be88b15220be7f0000           movabs     rsi, 0x7fbe2052b188
00741 ba28040000                     mov        edx, 0x428
00746 7f05                           jg         0x7fbe283bc44d
00748 ba38040000                     mov        edx, 0x438
0074d 4c8b0c16                       mov        r9, qword ptr [rsi + rdx]
00751 4d8d4901                       lea        r9, [r9 + 1]
00755 4c890c16                       mov        qword ptr [rsi + rdx], r9
00759 0f8f41000000                   jg         0x7fbe283bc4a0
0075f 8bb424bc010000                 mov        esi, dword ptr [rsp + 0x1bc]
00766 03f1                           add        esi, ecx
00768 89b424fc010000                 mov        dword ptr [rsp + 0x1fc], esi
0076f 3bb42474010000                 cmp        esi, dword ptr [rsp + 0x174]
00776 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
00780 41b958040000                   mov        r9d, 0x458
00786 7e06                           jle        0x7fbe283bc48e
00788 41b948040000                   mov        r9d, 0x448
0078e 4a8b3c0a                       mov        rdi, qword ptr [rdx + r9]
00792 488d7f01                       lea        rdi, [rdi + 1]
00796 4a893c0a                       mov        qword ptr [rdx + r9], rdi
0079a 0f8e43010000                   jle        0x7fbe283bc5e3
007a0 8bbc24a4010000                 mov        edi, dword ptr [rsp + 0x1a4]
007a7 4c898424a8010000               mov        qword ptr [rsp + 0x1a8], r8
007af 898424a0010000                 mov        dword ptr [rsp + 0x1a0], eax
007b6 4c89b424b0010000               mov        qword ptr [rsp + 0x1b0], r14
007be 48be88b15220be7f0000           movabs     rsi, 0x7fbe2052b188
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
00807 e854f35307                     call       0x7fbe2f8fb860
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
008de e9ca370000                     jmp        0x7fbe283bfdad
008e3 4c898424a8010000               mov        qword ptr [rsp + 0x1a8], r8
008eb 898424a0010000                 mov        dword ptr [rsp + 0x1a0], eax
008f2 4c89b424b0010000               mov        qword ptr [rsp + 0x1b0], r14
008fa 8b8424a4010000                 mov        eax, dword ptr [rsp + 0x1a4]
00901 83f910                         cmp        ecx, 0x10
00904 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
0090e 41b868040000                   mov        r8d, 0x468
00914 7f06                           jg         0x7fbe283bc61c
00916 41b878040000                   mov        r8d, 0x478
0091c 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
00920 4d8d4901                       lea        r9, [r9 + 1]
00924 4e890c02                       mov        qword ptr [rdx + r8], r9
00928 0f8f630a0000                   jg         0x7fbe283bd091
0092e 488b942490010000               mov        rdx, qword ptr [rsp + 0x190]
00936 49b888b15220be7f0000           movabs     r8, 0x7fbe2052b188
00940 4983808804000001               add        qword ptr [r8 + 0x488], 1
00948 49b8d89f6e20be7f0000           movabs     r8, 0x7fbe206e9fd8
00952 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
00956 4183c102                       add        r9d, 2
0095a 45894870                       mov        dword ptr [r8 + 0x70], r9d
0095e 4181e1feff1f00                 and        r9d, 0x1ffffe
00965 4585c9                         test       r9d, r9d
00968 0f8415400000                   je         0x7fbe283c0683
0096e 49b8c0906ee200000000           movabs     r8, 0xe26e90c0
00978 49b9d89f6e20be7f0000           movabs     r9, 0x7fbe206e9fd8
00982 458b00                         mov        r8d, dword ptr [r8]
00985 41c1e80d                       shr        r8d, 0xd
00989 49c1e00a                       shl        r8, 0xa
0098d 41ba0000008b                   mov        r10d, 0x8b000000
00993 4d03c2                         add        r8, r10
00996 41ba16000000                   mov        r10d, 0x16
0099c 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
009a0 7436                           je         0x7fbe283bc6d8
009a2 4983c202                       add        r10, 2
009a6 4983fa1a                       cmp        r10, 0x1a
009aa 75f0                           jne        0x7fbe283bc69c
009ac 41ba16000000                   mov        r10d, 0x16
009b2 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
009b7 7412                           je         0x7fbe283bc6cb
009b9 4983c202                       add        r10, 2
009bd 4983fa1a                       cmp        r10, 0x1a
009c1 75ef                           jne        0x7fbe283bc6b2
009c3 41ba15000000                   mov        r10d, 0x15
009c9 eb11                           jmp        0x7fbe283bc6dc
009cb 50                             push       rax
009cc 4833c0                         xor        rax, rax
009cf f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
009d5 58                             pop        rax
009d6 ebbe                           jmp        0x7fbe283bc696
009d8 4983c201                       add        r10, 1
009dc 4b8304d101                     add        qword ptr [r9 + r10*8], 1
009e1 448b4204                       mov        r8d, dword ptr [rdx + 4]
009e5 49b9d89f6e20be7f0000           movabs     r9, 0x7fbe206e9fd8
009ef 498381d800000001               add        qword ptr [r9 + 0xd8], 1
009f7 49b930966e20be7f0000           movabs     r9, 0x7fbe206e9630
00a01 418b7970                       mov        edi, dword ptr [r9 + 0x70]
00a05 83c702                         add        edi, 2
00a08 41897970                       mov        dword ptr [r9 + 0x70], edi
00a0c 81e7feff1f00                   and        edi, 0x1ffffe
00a12 85ff                           test       edi, edi
00a14 0f848f3f0000                   je         0x7fbe283c06a9
00a1a 448bb424bc010000               mov        r14d, dword ptr [rsp + 0x1bc]
00a22 49b930966e20be7f0000           movabs     r9, 0x7fbe206e9630
00a2c 4983810801000001               add        qword ptr [r9 + 0x108], 1
00a34 4183e80f                       sub        r8d, 0xf
00a38 49b9008d6e20be7f0000           movabs     r9, 0x7fbe206e8d00
00a42 418b7970                       mov        edi, dword ptr [r9 + 0x70]
00a46 83c702                         add        edi, 2
00a49 41897970                       mov        dword ptr [r9 + 0x70], edi
00a4d 81e7feff1f00                   and        edi, 0x1ffffe
00a53 85ff                           test       edi, edi
00a55 0f846f3f0000                   je         0x7fbe283c06ca
00a5b 49b9008d6e20be7f0000           movabs     r9, 0x7fbe206e8d00
00a65 498381a800000001               add        qword ptr [r9 + 0xa8], 1
00a6d 49b90000000000000000           movabs     r9, 0
00a77 41b900000000                   mov        r9d, 0
00a7d 453bf1                         cmp        r14d, r9d
00a80 0f8c653f0000                   jl         0x7fbe283c06eb
00a86 453bf0                         cmp        r14d, r8d
00a89 0f8d693f0000                   jge        0x7fbe283c06f8
00a8f 4d8bc6                         mov        r8, r14
00a92 44898424f8010000               mov        dword ptr [rsp + 0x1f8], r8d
00a9a 49b9c0906ee200000000           movabs     r9, 0xe26e90c0
00aa4 498bf9                         mov        rdi, r9
00aa7 49b8d89f6e20be7f0000           movabs     r8, 0x7fbe206e9fd8
00ab1 8b3f                           mov        edi, dword ptr [rdi]
00ab3 c1ef0d                         shr        edi, 0xd
00ab6 48c1e70a                       shl        rdi, 0xa
00aba 41ba0000008b                   mov        r10d, 0x8b000000
00ac0 4903fa                         add        rdi, r10
00ac3 41ba24000000                   mov        r10d, 0x24
00ac9 4b3b3cd0                       cmp        rdi, qword ptr [r8 + r10*8]
00acd 7436                           je         0x7fbe283bc805
00acf 4983c202                       add        r10, 2
00ad3 4983fa28                       cmp        r10, 0x28
00ad7 75f0                           jne        0x7fbe283bc7c9
00ad9 41ba24000000                   mov        r10d, 0x24
00adf 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
00ae4 7412                           je         0x7fbe283bc7f8
00ae6 4983c202                       add        r10, 2
00aea 4983fa28                       cmp        r10, 0x28
00aee 75ef                           jne        0x7fbe283bc7df
00af0 41ba23000000                   mov        r10d, 0x23
00af6 eb11                           jmp        0x7fbe283bc809
00af8 50                             push       rax
00af9 4833c0                         xor        rax, rax
00afc f04b0fb13cd0                   lock cmpxchg qword ptr [r8 + r10*8], rdi
00b02 58                             pop        rax
00b03 ebbe                           jmp        0x7fbe283bc7c3
00b05 4983c201                       add        r10, 1
00b09 4b8304d001                     add        qword ptr [r8 + r10*8], 1
00b0e 48be008e6e20be7f0000           movabs     rsi, 0x7fbe206e8e00
00b18 448b4670                       mov        r8d, dword ptr [rsi + 0x70]
00b1c 4183c002                       add        r8d, 2
00b20 44894670                       mov        dword ptr [rsi + 0x70], r8d
00b24 4181e0feff1f00                 and        r8d, 0x1ffffe
00b2b 4585c0                         test       r8d, r8d
00b2e 0f84d13e0000                   je         0x7fbe283c0705
00b34 48be008e6e20be7f0000           movabs     rsi, 0x7fbe206e8e00
00b3e 488386a800000001               add        qword ptr [rsi + 0xa8], 1
00b46 48be288f6e20be7f0000           movabs     rsi, 0x7fbe206e8f28
00b50 448b4670                       mov        r8d, dword ptr [rsi + 0x70]
00b54 4183c002                       add        r8d, 2
00b58 44894670                       mov        dword ptr [rsi + 0x70], r8d
00b5c 4181e0feff1f00                 and        r8d, 0x1ffffe
00b63 4585c0                         test       r8d, r8d
00b66 0f84ba3e0000                   je         0x7fbe283c0726
00b6c 48be288f6e20be7f0000           movabs     rsi, 0x7fbe206e8f28
00b76 ff86b8000000                   inc        dword ptr [rsi + 0xb8]
00b7c 448b8424f8010000               mov        r8d, dword ptr [rsp + 0x1f8]
00b84 44899c2400020000               mov        dword ptr [rsp + 0x200], r11d
00b8c 4489b424bc010000               mov        dword ptr [rsp + 0x1bc], r14d
00b94 899c248c010000                 mov        dword ptr [rsp + 0x18c], ebx
00b9b 49b9b8106fe200000000           movabs     r9, 0xe26f10b8
00ba5 4d8bf1                         mov        r14, r9
00ba8 48bbd89f6e20be7f0000           movabs     rbx, 0x7fbe206e9fd8
00bb2 4883835801000001               add        qword ptr [rbx + 0x158], 1
00bba 48bba0a16e20be7f0000           movabs     rbx, 0x7fbe206ea1a0
00bc4 8b4370                         mov        eax, dword ptr [rbx + 0x70]
00bc7 83c002                         add        eax, 2
00bca 894370                         mov        dword ptr [rbx + 0x70], eax
00bcd 25feff1f00                     and        eax, 0x1ffffe
00bd2 85c0                           test       eax, eax
00bd4 0f846d3e0000                   je         0x7fbe283c0747
00bda 498bd9                         mov        rbx, r9
00bdd 48b8a0a16e20be7f0000           movabs     rax, 0x7fbe206ea1a0
00be7 488380a800000001               add        qword ptr [rax + 0xa8], 1
00bef 48bb80a26e20be7f0000           movabs     rbx, 0x7fbe206ea280
00bf9 8b4370                         mov        eax, dword ptr [rbx + 0x70]
00bfc 83c002                         add        eax, 2
00bff 894370                         mov        dword ptr [rbx + 0x70], eax
00c02 25feff1f00                     and        eax, 0x1ffffe
00c07 85c0                           test       eax, eax
00c09 0f84593e0000                   je         0x7fbe283c0768
00c0f 48bb80a26e20be7f0000           movabs     rbx, 0x7fbe206ea280
00c19 488383b800000001               add        qword ptr [rbx + 0xb8], 1
00c21 49b9a8976e20be7f0000           movabs     r9, 0x7fbe206e97a8
00c2b 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
00c2f 83c302                         add        ebx, 2
00c32 41895970                       mov        dword ptr [r9 + 0x70], ebx
00c36 81e3feff1f00                   and        ebx, 0x1ffffe
00c3c 85db                           test       ebx, ebx
00c3e 0f84453e0000                   je         0x7fbe283c0789
00c44 49b9c0906ee200000000           movabs     r9, 0xe26e90c0
00c4e 498bd9                         mov        rbx, r9
00c51 48b880a26e20be7f0000           movabs     rax, 0x7fbe206ea280
00c5b 8b1b                           mov        ebx, dword ptr [rbx]
00c5d c1eb0d                         shr        ebx, 0xd
00c60 48c1e30a                       shl        rbx, 0xa
00c64 41ba0000008b                   mov        r10d, 0x8b000000
00c6a 4903da                         add        rbx, r10
00c6d 41ba1c000000                   mov        r10d, 0x1c
00c73 4a3b1cd0                       cmp        rbx, qword ptr [rax + r10*8]
00c77 743c                           je         0x7fbe283bc9b5
00c79 4983c202                       add        r10, 2
00c7d 4983fa20                       cmp        r10, 0x20
00c81 75f0                           jne        0x7fbe283bc973
00c83 41ba1c000000                   mov        r10d, 0x1c
00c89 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
00c8e 7412                           je         0x7fbe283bc9a2
00c90 4983c202                       add        r10, 2
00c94 4983fa20                       cmp        r10, 0x20
00c98 75ef                           jne        0x7fbe283bc989
00c9a 41ba1b000000                   mov        r10d, 0x1b
00ca0 eb17                           jmp        0x7fbe283bc9b9
00ca2 51                             push       rcx
00ca3 488bc8                         mov        rcx, rax
00ca6 4833c0                         xor        rax, rax
00ca9 f04a0fb11cd1                   lock cmpxchg qword ptr [rcx + r10*8], rbx
00caf 488bc1                         mov        rax, rcx
00cb2 59                             pop        rcx
00cb3 ebb8                           jmp        0x7fbe283bc96d
00cb5 4983c201                       add        r10, 1
00cb9 4a8304d001                     add        qword ptr [rax + r10*8], 1
00cbe 48bb80a26e20be7f0000           movabs     rbx, 0x7fbe206ea280
00cc8 458b09                         mov        r9d, dword ptr [r9]
00ccb 41c1e90d                       shr        r9d, 0xd
00ccf 49c1e10a                       shl        r9, 0xa
00cd3 41ba0000008b                   mov        r10d, 0x8b000000
00cd9 4d03ca                         add        r9, r10
00cdc 41ba22000000                   mov        r10d, 0x22
00ce2 4e3b0cd3                       cmp        r9, qword ptr [rbx + r10*8]
00ce6 7436                           je         0x7fbe283bca1e
00ce8 4983c202                       add        r10, 2
00cec 4983fa26                       cmp        r10, 0x26
00cf0 75f0                           jne        0x7fbe283bc9e2
00cf2 41ba22000000                   mov        r10d, 0x22
00cf8 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00cfd 7412                           je         0x7fbe283bca11
00cff 4983c202                       add        r10, 2
00d03 4983fa26                       cmp        r10, 0x26
00d07 75ef                           jne        0x7fbe283bc9f8
00d09 41ba21000000                   mov        r10d, 0x21
00d0f eb11                           jmp        0x7fbe283bca22
00d11 50                             push       rax
00d12 4833c0                         xor        rax, rax
00d15 f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
00d1b 58                             pop        rax
00d1c ebbe                           jmp        0x7fbe283bc9dc
00d1e 4983c201                       add        r10, 1
00d22 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00d27 49b980a26e20be7f0000           movabs     r9, 0x7fbe206ea280
00d31 4983813801000001               add        qword ptr [r9 + 0x138], 1
00d39 49b968986e20be7f0000           movabs     r9, 0x7fbe206e9868
00d43 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
00d47 83c302                         add        ebx, 2
00d4a 41895970                       mov        dword ptr [r9 + 0x70], ebx
00d4e 81e3feff1f00                   and        ebx, 0x1ffffe
00d54 85db                           test       ebx, ebx
00d56 0f844e3d0000                   je         0x7fbe283c07aa
00d5c 49b980a26e20be7f0000           movabs     r9, 0x7fbe206ea280
00d66 4983814801000001               add        qword ptr [r9 + 0x148], 1
00d6e 4963d8                         movsxd     rbx, r8d
00d71 41b808000000                   mov        r8d, 8
00d77 4c8bcb                         mov        r9, rbx
00d7a 4d03c8                         add        r9, r8
00d7d 49b8508a6e20be7f0000           movabs     r8, 0x7fbe206e8a50
00d87 418b4070                       mov        eax, dword ptr [r8 + 0x70]
00d8b 83c002                         add        eax, 2
00d8e 41894070                       mov        dword ptr [r8 + 0x70], eax
00d92 25feff1f00                     and        eax, 0x1ffffe
00d97 85c0                           test       eax, eax
00d99 0f842c3d0000                   je         0x7fbe283c07cb
00d9f 49b8508a6e20be7f0000           movabs     r8, 0x7fbe206e8a50
00da9 498380d800000001               add        qword ptr [r8 + 0xd8], 1
00db1 49b8c88b6e20be7f0000           movabs     r8, 0x7fbe206e8bc8
00dbb 418b4070                       mov        eax, dword ptr [r8 + 0x70]
00dbf 83c002                         add        eax, 2
00dc2 41894070                       mov        dword ptr [r8 + 0x70], eax
00dc6 25feff1f00                     and        eax, 0x1ffffe
00dcb 85c0                           test       eax, eax
00dcd 0f84193d0000                   je         0x7fbe283c07ec
00dd3 49b880a26e20be7f0000           movabs     r8, 0x7fbe206ea280
00ddd 4983806801000001               add        qword ptr [r8 + 0x168], 1
00de5 49b888696fe200000000           movabs     r8, 0xe26f6988
00def 48be08916ee200000000           movabs     rsi, 0xe26e9108
00df9 4c8bf2                         mov        r14, rdx
00dfc ba02000000                     mov        edx, 2
00e01 b910000000                     mov        ecx, 0x10
00e06 4d8bc6                         mov        r8, r14
00e09 bf00000000                     mov        edi, 0
00e0e 4c893424                       mov        qword ptr [rsp], r14
00e12 48895c2408                     mov        qword ptr [rsp + 8], rbx
00e17 49bac0906ee200000000           movabs     r10, 0xe26e90c0
00e21 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00e26 49ba88696fe200000000           movabs     r10, 0xe26f6988
00e30 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e35 4c89b42490010000               mov        qword ptr [rsp + 0x190], r14
00e3d 6690                           nop        
00e3f e81ced5307                     call       0x7fbe2f8fb860
00e44 0f1f84003c0f0002               nop        dword ptr [rax + rax + 0x2000f3c]
00e4c 4885c0                         test       rax, rax
00e4f 48bb80a26e20be7f0000           movabs     rbx, 0x7fbe206ea280
00e59 750c                           jne        0x7fbe283bcb67
00e5b 808b7101000001                 or         byte ptr [rbx + 0x171], 1
00e62 e988000000                     jmp        0x7fbe283bcbef
00e67 8b38                           mov        edi, dword ptr [rax]
00e69 c1ef0d                         shr        edi, 0xd
00e6c 48c1e70a                       shl        rdi, 0xa
00e70 41ba0000008b                   mov        r10d, 0x8b000000
00e76 4903fa                         add        rdi, r10
00e79 41ba30000000                   mov        r10d, 0x30
00e7f 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
00e83 7436                           je         0x7fbe283bcbbb
00e85 4983c202                       add        r10, 2
00e89 4983fa34                       cmp        r10, 0x34
00e8d 75f0                           jne        0x7fbe283bcb7f
00e8f 41ba30000000                   mov        r10d, 0x30
00e95 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00e9a 7412                           je         0x7fbe283bcbae
00e9c 4983c202                       add        r10, 2
00ea0 4983fa34                       cmp        r10, 0x34
00ea4 75ef                           jne        0x7fbe283bcb95
00ea6 41ba2f000000                   mov        r10d, 0x2f
00eac eb11                           jmp        0x7fbe283bcbbf
00eae 50                             push       rax
00eaf 4833c0                         xor        rax, rax
00eb2 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
00eb8 58                             pop        rax
00eb9 ebbe                           jmp        0x7fbe283bcb79
00ebb 4983c201                       add        r10, 1
00ebf 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00ec4 48bf00b0148b00000000           movabs     rdi, 0x8b14b000
00ece 8b18                           mov        ebx, dword ptr [rax]
00ed0 c1eb0d                         shr        ebx, 0xd
00ed3 48c1e30a                       shl        rbx, 0xa
00ed7 41ba0000008b                   mov        r10d, 0x8b000000
00edd 4903da                         add        rbx, r10
00ee0 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
00ee4 0f85233c0000                   jne        0x7fbe283c080d
00eea e900000000                     jmp        0x7fbe283bcbef
00eef 488bf8                         mov        rdi, rax
00ef2 4889bc2408020000               mov        qword ptr [rsp + 0x208], rdi
00efa 483b07                         cmp        rax, qword ptr [rdi]
00efd 488bf7                         mov        rsi, rdi
00f00 48bb88b15220be7f0000           movabs     rbx, 0x7fbe2052b188
00f0a 8b36                           mov        esi, dword ptr [rsi]
00f0c c1ee0d                         shr        esi, 0xd
00f0f 48c1e60a                       shl        rsi, 0xa
00f13 41ba0000008b                   mov        r10d, 0x8b000000
00f19 4903f2                         add        rsi, r10
00f1c 41ba94000000                   mov        r10d, 0x94
00f22 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00f26 743c                           je         0x7fbe283bcc64
00f28 4983c202                       add        r10, 2
00f2c 4981fa98000000                 cmp        r10, 0x98
00f33 75ed                           jne        0x7fbe283bcc22
00f35 41ba94000000                   mov        r10d, 0x94
00f3b 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00f40 7415                           je         0x7fbe283bcc57
00f42 4983c202                       add        r10, 2
00f46 4981fa98000000                 cmp        r10, 0x98
00f4d 75ec                           jne        0x7fbe283bcc3b
00f4f 41ba93000000                   mov        r10d, 0x93
00f55 eb11                           jmp        0x7fbe283bcc68
00f57 50                             push       rax
00f58 4833c0                         xor        rax, rax
00f5b f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00f61 58                             pop        rax
00f62 ebb8                           jmp        0x7fbe283bcc1c
00f64 4983c201                       add        r10, 1
00f68 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00f6d 48be98ac6e20be7f0000           movabs     rsi, 0x7fbe206eac98
00f77 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
00f7a 83c302                         add        ebx, 2
00f7d 895e70                         mov        dword ptr [rsi + 0x70], ebx
00f80 81e3feff1f00                   and        ebx, 0x1ffffe
00f86 85db                           test       ebx, ebx
00f88 0f848d3b0000                   je         0x7fbe283c081b
00f8e 488bf7                         mov        rsi, rdi
00f91 48bb98ac6e20be7f0000           movabs     rbx, 0x7fbe206eac98
00f9b 8b36                           mov        esi, dword ptr [rsi]
00f9d c1ee0d                         shr        esi, 0xd
00fa0 48c1e60a                       shl        rsi, 0xa
00fa4 41ba0000008b                   mov        r10d, 0x8b000000
00faa 4903f2                         add        rsi, r10
00fad 41ba16000000                   mov        r10d, 0x16
00fb3 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00fb7 7436                           je         0x7fbe283bccef
00fb9 4983c202                       add        r10, 2
00fbd 4983fa1a                       cmp        r10, 0x1a
00fc1 75f0                           jne        0x7fbe283bccb3
00fc3 41ba16000000                   mov        r10d, 0x16
00fc9 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00fce 7412                           je         0x7fbe283bcce2
00fd0 4983c202                       add        r10, 2
00fd4 4983fa1a                       cmp        r10, 0x1a
00fd8 75ef                           jne        0x7fbe283bccc9
00fda 41ba15000000                   mov        r10d, 0x15
00fe0 eb11                           jmp        0x7fbe283bccf3
00fe2 50                             push       rax
00fe3 4833c0                         xor        rax, rax
00fe6 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00fec 58                             pop        rax
00fed ebbe                           jmp        0x7fbe283bccad
00fef 4983c201                       add        r10, 1
00ff3 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00ff8 488bf7                         mov        rsi, rdi
00ffb 6690                           nop        
00ffd 48b850a12004be7f0000           movabs     rax, 0x7fbe0420a150
01007 e854e65307                     call       0x7fbe2f8fb360
0100c 0f1f840004110003               nop        dword ptr [rax + rax + 0x3001104]
01014 488bbc2480010000               mov        rdi, qword ptr [rsp + 0x180]
0101c 8b7704                         mov        esi, dword ptr [rdi + 4]
0101f 48bb98ac6e20be7f0000           movabs     rbx, 0x7fbe206eac98
01029 488383d800000001               add        qword ptr [rbx + 0xd8], 1
01031 48bb30966e20be7f0000           movabs     rbx, 0x7fbe206e9630
0103b 8b5370                         mov        edx, dword ptr [rbx + 0x70]
0103e 83c202                         add        edx, 2
01041 895370                         mov        dword ptr [rbx + 0x70], edx
01044 81e2feff1f00                   and        edx, 0x1ffffe
0104a 85d2                           test       edx, edx
0104c 0f84ef3a0000                   je         0x7fbe283c0841
01052 448b9c248c010000               mov        r11d, dword ptr [rsp + 0x18c]
0105a 48bb30966e20be7f0000           movabs     rbx, 0x7fbe206e9630
01064 4883830801000001               add        qword ptr [rbx + 0x108], 1
0106c ffc8                           dec        eax
0106e 2bf0                           sub        esi, eax
01070 48bb008d6e20be7f0000           movabs     rbx, 0x7fbe206e8d00
0107a 8b4370                         mov        eax, dword ptr [rbx + 0x70]
0107d 83c002                         add        eax, 2
01080 894370                         mov        dword ptr [rbx + 0x70], eax
01083 25feff1f00                     and        eax, 0x1ffffe
01088 85c0                           test       eax, eax
0108a 0f84d23a0000                   je         0x7fbe283c0862
01090 48bb008d6e20be7f0000           movabs     rbx, 0x7fbe206e8d00
0109a 488383a800000001               add        qword ptr [rbx + 0xa8], 1
010a2 48bb0000000000000000           movabs     rbx, 0
010ac bb00000000                     mov        ebx, 0
010b1 443bdb                         cmp        r11d, ebx
010b4 0f8cc93a0000                   jl         0x7fbe283c0883
010ba 443bde                         cmp        r11d, esi
010bd 0f8dcd3a0000                   jge        0x7fbe283c0890
010c3 498bdb                         mov        rbx, r11
010c6 899c2410020000                 mov        dword ptr [rsp + 0x210], ebx
010cd 44899c248c010000               mov        dword ptr [rsp + 0x18c], r11d
010d5 4889bc2480010000               mov        qword ptr [rsp + 0x180], rdi
010dd 488bbc2408020000               mov        rdi, qword ptr [rsp + 0x208]
010e5 488bf7                         mov        rsi, rdi
010e8 48ba98ac6e20be7f0000           movabs     rdx, 0x7fbe206eac98
010f2 8b36                           mov        esi, dword ptr [rsi]
010f4 c1ee0d                         shr        esi, 0xd
010f7 48c1e60a                       shl        rsi, 0xa
010fb 41ba0000008b                   mov        r10d, 0x8b000000
01101 4903f2                         add        rsi, r10
01104 41ba1e000000                   mov        r10d, 0x1e
0110a 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
0110e 7436                           je         0x7fbe283bce46
01110 4983c202                       add        r10, 2
01114 4983fa22                       cmp        r10, 0x22
01118 75f0                           jne        0x7fbe283bce0a
0111a 41ba1e000000                   mov        r10d, 0x1e
01120 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01125 7412                           je         0x7fbe283bce39
01127 4983c202                       add        r10, 2
0112b 4983fa22                       cmp        r10, 0x22
0112f 75ef                           jne        0x7fbe283bce20
01131 41ba1d000000                   mov        r10d, 0x1d
01137 eb11                           jmp        0x7fbe283bce4a
01139 50                             push       rax
0113a 4833c0                         xor        rax, rax
0113d f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01143 58                             pop        rax
01144 ebbe                           jmp        0x7fbe283bce04
01146 4983c201                       add        r10, 1
0114a 4a8304d201                     add        qword ptr [rdx + r10*8], 1
0114f 488bf7                         mov        rsi, rdi
01152 666690                         nop        
01155 48b878a12004be7f0000           movabs     rax, 0x7fbe0420a178
0115f e8fce45307                     call       0x7fbe2f8fb360
01164 0f1f84005c120004               nop        dword ptr [rax + rax + 0x400125c]
0116c 483b00                         cmp        rax, qword ptr [rax]
0116f 488bf0                         mov        rsi, rax
01172 48ba98ac6e20be7f0000           movabs     rdx, 0x7fbe206eac98
0117c 8b36                           mov        esi, dword ptr [rsi]
0117e c1ee0d                         shr        esi, 0xd
01181 48c1e60a                       shl        rsi, 0xa
01185 41ba0000008b                   mov        r10d, 0x8b000000
0118b 4903f2                         add        rsi, r10
0118e 41ba24000000                   mov        r10d, 0x24
01194 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01198 7436                           je         0x7fbe283bced0
0119a 4983c202                       add        r10, 2
0119e 4983fa28                       cmp        r10, 0x28
011a2 75f0                           jne        0x7fbe283bce94
011a4 41ba24000000                   mov        r10d, 0x24
011aa 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
011af 7412                           je         0x7fbe283bcec3
011b1 4983c202                       add        r10, 2
011b5 4983fa28                       cmp        r10, 0x28
011b9 75ef                           jne        0x7fbe283bceaa
011bb 41ba23000000                   mov        r10d, 0x23
011c1 eb11                           jmp        0x7fbe283bced4
011c3 50                             push       rax
011c4 4833c0                         xor        rax, rax
011c7 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
011cd 58                             pop        rax
011ce ebbe                           jmp        0x7fbe283bce8e
011d0 4983c201                       add        r10, 1
011d4 4a8304d201                     add        qword ptr [rdx + r10*8], 1
011d9 8b7024                         mov        esi, dword ptr [rax + 0x24]
011dc 488bd0                         mov        rdx, rax
011df 48b998ac6e20be7f0000           movabs     rcx, 0x7fbe206eac98
011e9 8b12                           mov        edx, dword ptr [rdx]
011eb c1ea0d                         shr        edx, 0xd
011ee 48c1e20a                       shl        rdx, 0xa
011f2 41ba0000008b                   mov        r10d, 0x8b000000
011f8 4903d2                         add        rdx, r10
011fb 41ba2a000000                   mov        r10d, 0x2a
01201 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01205 7436                           je         0x7fbe283bcf3d
01207 4983c202                       add        r10, 2
0120b 4983fa2e                       cmp        r10, 0x2e
0120f 75f0                           jne        0x7fbe283bcf01
01211 41ba2a000000                   mov        r10d, 0x2a
01217 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0121c 7412                           je         0x7fbe283bcf30
0121e 4983c202                       add        r10, 2
01222 4983fa2e                       cmp        r10, 0x2e
01226 75ef                           jne        0x7fbe283bcf17
01228 41ba29000000                   mov        r10d, 0x29
0122e eb11                           jmp        0x7fbe283bcf41
01230 50                             push       rax
01231 4833c0                         xor        rax, rax
01234 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
0123a 58                             pop        rax
0123b ebbe                           jmp        0x7fbe283bcefb
0123d 4983c201                       add        r10, 1
01241 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01246 8b4804                         mov        ecx, dword ptr [rax + 4]
01249 48ba98ac6e20be7f0000           movabs     rdx, 0x7fbe206eac98
01253 4883827801000001               add        qword ptr [rdx + 0x178], 1
0125b 48ba68986e20be7f0000           movabs     rdx, 0x7fbe206e9868
01265 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01269 4183c002                       add        r8d, 2
0126d 44894270                       mov        dword ptr [rdx + 0x70], r8d
01271 4181e0feff1f00                 and        r8d, 0x1ffffe
01278 4585c0                         test       r8d, r8d
0127b 0f8421390000                   je         0x7fbe283c08a2
01281 48ba98ac6e20be7f0000           movabs     rdx, 0x7fbe206eac98
0128b 4883828801000001               add        qword ptr [rdx + 0x188], 1
01293 8b9c2410020000                 mov        ebx, dword ptr [rsp + 0x210]
0129a 4863db                         movsxd     rbx, ebx
0129d ba08000000                     mov        edx, 8
012a2 4c8bcb                         mov        r9, rbx
012a5 4c03ca                         add        r9, rdx
012a8 48ba508a6e20be7f0000           movabs     rdx, 0x7fbe206e8a50
012b2 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
012b6 4183c002                       add        r8d, 2
012ba 44894270                       mov        dword ptr [rdx + 0x70], r8d
012be 4181e0feff1f00                 and        r8d, 0x1ffffe
012c5 4585c0                         test       r8d, r8d
012c8 0f84f5380000                   je         0x7fbe283c08c3
012ce 48ba508a6e20be7f0000           movabs     rdx, 0x7fbe206e8a50
012d8 488382d800000001               add        qword ptr [rdx + 0xd8], 1
012e0 48bac88b6e20be7f0000           movabs     rdx, 0x7fbe206e8bc8
012ea 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
012ee 4183c002                       add        r8d, 2
012f2 44894270                       mov        dword ptr [rdx + 0x70], r8d
012f6 4181e0feff1f00                 and        r8d, 0x1ffffe
012fd 4585c0                         test       r8d, r8d
01300 0f84de380000                   je         0x7fbe283c08e4
01306 48ba98ac6e20be7f0000           movabs     rdx, 0x7fbe206eac98
01310 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
01318 48ba700770e200000000           movabs     rdx, 0xe2700770
01322 ba02000000                     mov        edx, 2
01327 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
0132f bf00000000                     mov        edi, 0
01334 488b842408020000               mov        rax, qword ptr [rsp + 0x208]
0133c 48890424                       mov        qword ptr [rsp], rax
01340 488b842480010000               mov        rax, qword ptr [rsp + 0x180]
01348 4889442408                     mov        qword ptr [rsp + 8], rax
0134d 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01352 49ba700770e200000000           movabs     r10, 0xe2700770
0135c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01361 4889842480010000               mov        qword ptr [rsp + 0x180], rax
01369 660f1f440000                   nop        word ptr [rax + rax]
0136f e8ece75307                     call       0x7fbe2f8fb860
01374 0f1f84006c140005               nop        dword ptr [rax + rax + 0x500146c]
0137c 48be88b15220be7f0000           movabs     rsi, 0x7fbe2052b188
01386 ff86c8040000                   inc        dword ptr [rsi + 0x4c8]
0138c e9b60b0000                     jmp        0x7fbe283bdc47
01391 44899c2400020000               mov        dword ptr [rsp + 0x200], r11d
01399 899c248c010000                 mov        dword ptr [rsp + 0x18c], ebx
013a0 83f930                         cmp        ecx, 0x30
013a3 48be88b15220be7f0000           movabs     rsi, 0x7fbe2052b188
013ad bae0040000                     mov        edx, 0x4e0
013b2 7f05                           jg         0x7fbe283bd0b9
013b4 baf0040000                     mov        edx, 0x4f0
013b9 4c8b0416                       mov        r8, qword ptr [rsi + rdx]
013bd 4d8d4001                       lea        r8, [r8 + 1]
013c1 4c890416                       mov        qword ptr [rsi + rdx], r8
013c5 0f8fe60a0000                   jg         0x7fbe283bdbb1
013cb 8bb424bc010000                 mov        esi, dword ptr [rsp + 0x1bc]
013d2 448b9c248c010000               mov        r11d, dword ptr [rsp + 0x18c]
013da 660f1f440000                   nop        word ptr [rax + rax]
013e0 44899c2414020000               mov        dword ptr [rsp + 0x214], r11d
013e8 488b942490010000               mov        rdx, qword ptr [rsp + 0x190]
013f0 49b888b15220be7f0000           movabs     r8, 0x7fbe2052b188
013fa 4983800005000001               add        qword ptr [r8 + 0x500], 1
01402 49b8d89f6e20be7f0000           movabs     r8, 0x7fbe206e9fd8
0140c 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
01410 4183c102                       add        r9d, 2
01414 45894870                       mov        dword ptr [r8 + 0x70], r9d
01418 4181e1feff1f00                 and        r9d, 0x1ffffe
0141f 4585c9                         test       r9d, r9d
01422 0f84dd370000                   je         0x7fbe283c0905
01428 49b8c0906ee200000000           movabs     r8, 0xe26e90c0
01432 49b9d89f6e20be7f0000           movabs     r9, 0x7fbe206e9fd8
0143c 458b00                         mov        r8d, dword ptr [r8]
0143f 41c1e80d                       shr        r8d, 0xd
01443 49c1e00a                       shl        r8, 0xa
01447 41ba0000008b                   mov        r10d, 0x8b000000
0144d 4d03c2                         add        r8, r10
01450 41ba16000000                   mov        r10d, 0x16
01456 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
0145a 7436                           je         0x7fbe283bd192
0145c 4983c202                       add        r10, 2
01460 4983fa1a                       cmp        r10, 0x1a
01464 75f0                           jne        0x7fbe283bd156
01466 41ba16000000                   mov        r10d, 0x16
0146c 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
01471 7412                           je         0x7fbe283bd185
01473 4983c202                       add        r10, 2
01477 4983fa1a                       cmp        r10, 0x1a
0147b 75ef                           jne        0x7fbe283bd16c
0147d 41ba15000000                   mov        r10d, 0x15
01483 eb11                           jmp        0x7fbe283bd196
01485 50                             push       rax
01486 4833c0                         xor        rax, rax
01489 f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
0148f 58                             pop        rax
01490 ebbe                           jmp        0x7fbe283bd150
01492 4983c201                       add        r10, 1
01496 4b8304d101                     add        qword ptr [r9 + r10*8], 1
0149b 448b4204                       mov        r8d, dword ptr [rdx + 4]
0149f 49b9d89f6e20be7f0000           movabs     r9, 0x7fbe206e9fd8
014a9 498381d800000001               add        qword ptr [r9 + 0xd8], 1
014b1 49b930966e20be7f0000           movabs     r9, 0x7fbe206e9630
014bb 418b7970                       mov        edi, dword ptr [r9 + 0x70]
014bf 83c702                         add        edi, 2
014c2 41897970                       mov        dword ptr [r9 + 0x70], edi
014c6 81e7feff1f00                   and        edi, 0x1ffffe
014cc 85ff                           test       edi, edi
014ce 0f8457370000                   je         0x7fbe283c092b
014d4 49b930966e20be7f0000           movabs     r9, 0x7fbe206e9630
014de 4983810801000001               add        qword ptr [r9 + 0x108], 1
014e6 4183e80f                       sub        r8d, 0xf
014ea 49b9008d6e20be7f0000           movabs     r9, 0x7fbe206e8d00
014f4 418b7970                       mov        edi, dword ptr [r9 + 0x70]
014f8 83c702                         add        edi, 2
014fb 41897970                       mov        dword ptr [r9 + 0x70], edi
014ff 81e7feff1f00                   and        edi, 0x1ffffe
01505 85ff                           test       edi, edi
01507 0f843f370000                   je         0x7fbe283c094c
0150d 49b9008d6e20be7f0000           movabs     r9, 0x7fbe206e8d00
01517 498381a800000001               add        qword ptr [r9 + 0xa8], 1
0151f 49b90000000000000000           movabs     r9, 0
01529 41b900000000                   mov        r9d, 0
0152f 413bf1                         cmp        esi, r9d
01532 0f8c35370000                   jl         0x7fbe283c096d
01538 413bf0                         cmp        esi, r8d
0153b 0f8d39370000                   jge        0x7fbe283c097a
01541 4c8bc6                         mov        r8, rsi
01544 49b9c0906ee200000000           movabs     r9, 0xe26e90c0
0154e 498bf9                         mov        rdi, r9
01551 48bbd89f6e20be7f0000           movabs     rbx, 0x7fbe206e9fd8
0155b 8b3f                           mov        edi, dword ptr [rdi]
0155d c1ef0d                         shr        edi, 0xd
01560 48c1e70a                       shl        rdi, 0xa
01564 41ba0000008b                   mov        r10d, 0x8b000000
0156a 4903fa                         add        rdi, r10
0156d 41ba24000000                   mov        r10d, 0x24
01573 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
01577 7436                           je         0x7fbe283bd2af
01579 4983c202                       add        r10, 2
0157d 4983fa28                       cmp        r10, 0x28
01581 75f0                           jne        0x7fbe283bd273
01583 41ba24000000                   mov        r10d, 0x24
01589 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0158e 7412                           je         0x7fbe283bd2a2
01590 4983c202                       add        r10, 2
01594 4983fa28                       cmp        r10, 0x28
01598 75ef                           jne        0x7fbe283bd289
0159a 41ba23000000                   mov        r10d, 0x23
015a0 eb11                           jmp        0x7fbe283bd2b3
015a2 50                             push       rax
015a3 4833c0                         xor        rax, rax
015a6 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
015ac 58                             pop        rax
015ad ebbe                           jmp        0x7fbe283bd26d
015af 4983c201                       add        r10, 1
015b3 4a8304d301                     add        qword ptr [rbx + r10*8], 1
015b8 48bf008e6e20be7f0000           movabs     rdi, 0x7fbe206e8e00
015c2 8b5f70                         mov        ebx, dword ptr [rdi + 0x70]
015c5 83c302                         add        ebx, 2
015c8 895f70                         mov        dword ptr [rdi + 0x70], ebx
015cb 81e3feff1f00                   and        ebx, 0x1ffffe
015d1 85db                           test       ebx, ebx
015d3 0f84ae360000                   je         0x7fbe283c0987
015d9 48bf008e6e20be7f0000           movabs     rdi, 0x7fbe206e8e00
015e3 488387a800000001               add        qword ptr [rdi + 0xa8], 1
015eb 49b9288f6e20be7f0000           movabs     r9, 0x7fbe206e8f28
015f5 418b7970                       mov        edi, dword ptr [r9 + 0x70]
015f9 83c702                         add        edi, 2
015fc 41897970                       mov        dword ptr [r9 + 0x70], edi
01600 81e7feff1f00                   and        edi, 0x1ffffe
01606 85ff                           test       edi, edi
01608 0f849a360000                   je         0x7fbe283c09a8
0160e 49b9288f6e20be7f0000           movabs     r9, 0x7fbe206e8f28
01618 41ff81b8000000                 inc        dword ptr [r9 + 0xb8]
0161f 89b42418020000                 mov        dword ptr [rsp + 0x218], esi
01626 49b9b8106fe200000000           movabs     r9, 0xe26f10b8
01630 498bf9                         mov        rdi, r9
01633 48bbd89f6e20be7f0000           movabs     rbx, 0x7fbe206e9fd8
0163d 4883835801000001               add        qword ptr [rbx + 0x158], 1
01645 48bfa0a16e20be7f0000           movabs     rdi, 0x7fbe206ea1a0
0164f 8b5f70                         mov        ebx, dword ptr [rdi + 0x70]
01652 83c302                         add        ebx, 2
01655 895f70                         mov        dword ptr [rdi + 0x70], ebx
01658 81e3feff1f00                   and        ebx, 0x1ffffe
0165e 85db                           test       ebx, ebx
01660 0f8463360000                   je         0x7fbe283c09c9
01666 498bf9                         mov        rdi, r9
01669 48bba0a16e20be7f0000           movabs     rbx, 0x7fbe206ea1a0
01673 488383a800000001               add        qword ptr [rbx + 0xa8], 1
0167b 48bf80a26e20be7f0000           movabs     rdi, 0x7fbe206ea280
01685 8b5f70                         mov        ebx, dword ptr [rdi + 0x70]
01688 83c302                         add        ebx, 2
0168b 895f70                         mov        dword ptr [rdi + 0x70], ebx
0168e 81e3feff1f00                   and        ebx, 0x1ffffe
01694 85db                           test       ebx, ebx
01696 0f844e360000                   je         0x7fbe283c09ea
0169c 48bf80a26e20be7f0000           movabs     rdi, 0x7fbe206ea280
016a6 488387b800000001               add        qword ptr [rdi + 0xb8], 1
016ae 49b9a8976e20be7f0000           movabs     r9, 0x7fbe206e97a8
016b8 418b7970                       mov        edi, dword ptr [r9 + 0x70]
016bc 83c702                         add        edi, 2
016bf 41897970                       mov        dword ptr [r9 + 0x70], edi
016c3 81e7feff1f00                   and        edi, 0x1ffffe
016c9 85ff                           test       edi, edi
016cb 0f843a360000                   je         0x7fbe283c0a0b
016d1 49b9c0906ee200000000           movabs     r9, 0xe26e90c0
016db 498bf9                         mov        rdi, r9
016de 48bb80a26e20be7f0000           movabs     rbx, 0x7fbe206ea280
016e8 8b3f                           mov        edi, dword ptr [rdi]
016ea c1ef0d                         shr        edi, 0xd
016ed 48c1e70a                       shl        rdi, 0xa
016f1 41ba0000008b                   mov        r10d, 0x8b000000
016f7 4903fa                         add        rdi, r10
016fa 41ba1c000000                   mov        r10d, 0x1c
01700 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
01704 7436                           je         0x7fbe283bd43c
01706 4983c202                       add        r10, 2
0170a 4983fa20                       cmp        r10, 0x20
0170e 75f0                           jne        0x7fbe283bd400
01710 41ba1c000000                   mov        r10d, 0x1c
01716 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0171b 7412                           je         0x7fbe283bd42f
0171d 4983c202                       add        r10, 2
01721 4983fa20                       cmp        r10, 0x20
01725 75ef                           jne        0x7fbe283bd416
01727 41ba1b000000                   mov        r10d, 0x1b
0172d eb11                           jmp        0x7fbe283bd440
0172f 50                             push       rax
01730 4833c0                         xor        rax, rax
01733 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
01739 58                             pop        rax
0173a ebbe                           jmp        0x7fbe283bd3fa
0173c 4983c201                       add        r10, 1
01740 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01745 48bf80a26e20be7f0000           movabs     rdi, 0x7fbe206ea280
0174f 458b09                         mov        r9d, dword ptr [r9]
01752 41c1e90d                       shr        r9d, 0xd
01756 49c1e10a                       shl        r9, 0xa
0175a 41ba0000008b                   mov        r10d, 0x8b000000
01760 4d03ca                         add        r9, r10
01763 41ba22000000                   mov        r10d, 0x22
01769 4e3b0cd7                       cmp        r9, qword ptr [rdi + r10*8]
0176d 7436                           je         0x7fbe283bd4a5
0176f 4983c202                       add        r10, 2
01773 4983fa26                       cmp        r10, 0x26
01777 75f0                           jne        0x7fbe283bd469
01779 41ba22000000                   mov        r10d, 0x22
0177f 4a833cd700                     cmp        qword ptr [rdi + r10*8], 0
01784 7412                           je         0x7fbe283bd498
01786 4983c202                       add        r10, 2
0178a 4983fa26                       cmp        r10, 0x26
0178e 75ef                           jne        0x7fbe283bd47f
01790 41ba21000000                   mov        r10d, 0x21
01796 eb11                           jmp        0x7fbe283bd4a9
01798 50                             push       rax
01799 4833c0                         xor        rax, rax
0179c f04e0fb10cd7                   lock cmpxchg qword ptr [rdi + r10*8], r9
017a2 58                             pop        rax
017a3 ebbe                           jmp        0x7fbe283bd463
017a5 4983c201                       add        r10, 1
017a9 4a8304d701                     add        qword ptr [rdi + r10*8], 1
017ae 49b980a26e20be7f0000           movabs     r9, 0x7fbe206ea280
017b8 4983813801000001               add        qword ptr [r9 + 0x138], 1
017c0 49b968986e20be7f0000           movabs     r9, 0x7fbe206e9868
017ca 418b7970                       mov        edi, dword ptr [r9 + 0x70]
017ce 83c702                         add        edi, 2
017d1 41897970                       mov        dword ptr [r9 + 0x70], edi
017d5 81e7feff1f00                   and        edi, 0x1ffffe
017db 85ff                           test       edi, edi
017dd 0f8449350000                   je         0x7fbe283c0a2c
017e3 49b980a26e20be7f0000           movabs     r9, 0x7fbe206ea280
017ed 4983814801000001               add        qword ptr [r9 + 0x148], 1
017f5 4963d8                         movsxd     rbx, r8d
017f8 41b808000000                   mov        r8d, 8
017fe 4c8bcb                         mov        r9, rbx
01801 4d03c8                         add        r9, r8
01804 49b8508a6e20be7f0000           movabs     r8, 0x7fbe206e8a50
0180e 418b7870                       mov        edi, dword ptr [r8 + 0x70]
01812 83c702                         add        edi, 2
01815 41897870                       mov        dword ptr [r8 + 0x70], edi
01819 81e7feff1f00                   and        edi, 0x1ffffe
0181f 85ff                           test       edi, edi
01821 0f8426350000                   je         0x7fbe283c0a4d
01827 49b8508a6e20be7f0000           movabs     r8, 0x7fbe206e8a50
01831 498380d800000001               add        qword ptr [r8 + 0xd8], 1
01839 49b8c88b6e20be7f0000           movabs     r8, 0x7fbe206e8bc8
01843 418b7870                       mov        edi, dword ptr [r8 + 0x70]
01847 83c702                         add        edi, 2
0184a 41897870                       mov        dword ptr [r8 + 0x70], edi
0184e 81e7feff1f00                   and        edi, 0x1ffffe
01854 85ff                           test       edi, edi
01856 0f8412350000                   je         0x7fbe283c0a6e
0185c 49b880a26e20be7f0000           movabs     r8, 0x7fbe206ea280
01866 4983806801000001               add        qword ptr [r8 + 0x168], 1
0186e 49b888696fe200000000           movabs     r8, 0xe26f6988
01878 48be08916ee200000000           movabs     rsi, 0xe26e9108
01882 488bfa                         mov        rdi, rdx
01885 ba02000000                     mov        edx, 2
0188a b910000000                     mov        ecx, 0x10
0188f 4c8bc7                         mov        r8, rdi
01892 488bc7                         mov        rax, rdi
01895 bf00000000                     mov        edi, 0
0189a 48890424                       mov        qword ptr [rsp], rax
0189e 48895c2408                     mov        qword ptr [rsp + 8], rbx
018a3 49bac0906ee200000000           movabs     r10, 0xe26e90c0
018ad 4c89542410                     mov        qword ptr [rsp + 0x10], r10
018b2 49ba88696fe200000000           movabs     r10, 0xe26f6988
018bc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018c1 4889842490010000               mov        qword ptr [rsp + 0x190], rax
018c9 660f1f440000                   nop        word ptr [rax + rax]
018cf e88ce25307                     call       0x7fbe2f8fb860
018d4 0f1f8400cc190006               nop        dword ptr [rax + rax + 0x60019cc]
018dc 4885c0                         test       rax, rax
018df 48bb80a26e20be7f0000           movabs     rbx, 0x7fbe206ea280
018e9 750c                           jne        0x7fbe283bd5f7
018eb 808b7101000001                 or         byte ptr [rbx + 0x171], 1
018f2 e988000000                     jmp        0x7fbe283bd67f
018f7 8b38                           mov        edi, dword ptr [rax]
018f9 c1ef0d                         shr        edi, 0xd
018fc 48c1e70a                       shl        rdi, 0xa
01900 41ba0000008b                   mov        r10d, 0x8b000000
01906 4903fa                         add        rdi, r10
01909 41ba30000000                   mov        r10d, 0x30
0190f 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
01913 7436                           je         0x7fbe283bd64b
01915 4983c202                       add        r10, 2
01919 4983fa34                       cmp        r10, 0x34
0191d 75f0                           jne        0x7fbe283bd60f
0191f 41ba30000000                   mov        r10d, 0x30
01925 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0192a 7412                           je         0x7fbe283bd63e
0192c 4983c202                       add        r10, 2
01930 4983fa34                       cmp        r10, 0x34
01934 75ef                           jne        0x7fbe283bd625
01936 41ba2f000000                   mov        r10d, 0x2f
0193c eb11                           jmp        0x7fbe283bd64f
0193e 50                             push       rax
0193f 4833c0                         xor        rax, rax
01942 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
01948 58                             pop        rax
01949 ebbe                           jmp        0x7fbe283bd609
0194b 4983c201                       add        r10, 1
0194f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01954 48bf00b0148b00000000           movabs     rdi, 0x8b14b000
0195e 8b18                           mov        ebx, dword ptr [rax]
01960 c1eb0d                         shr        ebx, 0xd
01963 48c1e30a                       shl        rbx, 0xa
01967 41ba0000008b                   mov        r10d, 0x8b000000
0196d 4903da                         add        rbx, r10
01970 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
01974 0f8515340000                   jne        0x7fbe283c0a8f
0197a e900000000                     jmp        0x7fbe283bd67f
0197f 488bf8                         mov        rdi, rax
01982 4889bc2420020000               mov        qword ptr [rsp + 0x220], rdi
0198a 483b07                         cmp        rax, qword ptr [rdi]
0198d 488bf7                         mov        rsi, rdi
01990 48bb88b15220be7f0000           movabs     rbx, 0x7fbe2052b188
0199a 8b36                           mov        esi, dword ptr [rsi]
0199c c1ee0d                         shr        esi, 0xd
0199f 48c1e60a                       shl        rsi, 0xa
019a3 41ba0000008b                   mov        r10d, 0x8b000000
019a9 4903f2                         add        rsi, r10
019ac 41baa3000000                   mov        r10d, 0xa3
019b2 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
019b6 743c                           je         0x7fbe283bd6f4
019b8 4983c202                       add        r10, 2
019bc 4981faa7000000                 cmp        r10, 0xa7
019c3 75ed                           jne        0x7fbe283bd6b2
019c5 41baa3000000                   mov        r10d, 0xa3
019cb 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
019d0 7415                           je         0x7fbe283bd6e7
019d2 4983c202                       add        r10, 2
019d6 4981faa7000000                 cmp        r10, 0xa7
019dd 75ec                           jne        0x7fbe283bd6cb
019df 41baa2000000                   mov        r10d, 0xa2
019e5 eb11                           jmp        0x7fbe283bd6f8
019e7 50                             push       rax
019e8 4833c0                         xor        rax, rax
019eb f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
019f1 58                             pop        rax
019f2 ebb8                           jmp        0x7fbe283bd6ac
019f4 4983c201                       add        r10, 1
019f8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
019fd 48be98ac6e20be7f0000           movabs     rsi, 0x7fbe206eac98
01a07 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
01a0a 83c302                         add        ebx, 2
01a0d 895e70                         mov        dword ptr [rsi + 0x70], ebx
01a10 81e3feff1f00                   and        ebx, 0x1ffffe
01a16 85db                           test       ebx, ebx
01a18 0f847f330000                   je         0x7fbe283c0a9d
01a1e 488bf7                         mov        rsi, rdi
01a21 48bb98ac6e20be7f0000           movabs     rbx, 0x7fbe206eac98
01a2b 8b36                           mov        esi, dword ptr [rsi]
01a2d c1ee0d                         shr        esi, 0xd
01a30 48c1e60a                       shl        rsi, 0xa
01a34 41ba0000008b                   mov        r10d, 0x8b000000
01a3a 4903f2                         add        rsi, r10
01a3d 41ba16000000                   mov        r10d, 0x16
01a43 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
01a47 7436                           je         0x7fbe283bd77f
01a49 4983c202                       add        r10, 2
01a4d 4983fa1a                       cmp        r10, 0x1a
01a51 75f0                           jne        0x7fbe283bd743
01a53 41ba16000000                   mov        r10d, 0x16
01a59 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01a5e 7412                           je         0x7fbe283bd772
01a60 4983c202                       add        r10, 2
01a64 4983fa1a                       cmp        r10, 0x1a
01a68 75ef                           jne        0x7fbe283bd759
01a6a 41ba15000000                   mov        r10d, 0x15
01a70 eb11                           jmp        0x7fbe283bd783
01a72 50                             push       rax
01a73 4833c0                         xor        rax, rax
01a76 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01a7c 58                             pop        rax
01a7d ebbe                           jmp        0x7fbe283bd73d
01a7f 4983c201                       add        r10, 1
01a83 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01a88 488bf7                         mov        rsi, rdi
01a8b 6690                           nop        
01a8d 48b8a0a12004be7f0000           movabs     rax, 0x7fbe0420a1a0
01a97 e8c4db5307                     call       0x7fbe2f8fb360
01a9c 0f1f8400941b0007               nop        dword ptr [rax + rax + 0x7001b94]
01aa4 488bbc2480010000               mov        rdi, qword ptr [rsp + 0x180]
01aac 8b7704                         mov        esi, dword ptr [rdi + 4]
01aaf 48bb98ac6e20be7f0000           movabs     rbx, 0x7fbe206eac98
01ab9 488383d800000001               add        qword ptr [rbx + 0xd8], 1
01ac1 48bb30966e20be7f0000           movabs     rbx, 0x7fbe206e9630
01acb 8b5370                         mov        edx, dword ptr [rbx + 0x70]
01ace 83c202                         add        edx, 2
01ad1 895370                         mov        dword ptr [rbx + 0x70], edx
01ad4 81e2feff1f00                   and        edx, 0x1ffffe
01ada 85d2                           test       edx, edx
01adc 0f84e1320000                   je         0x7fbe283c0ac3
01ae2 448b9c2414020000               mov        r11d, dword ptr [rsp + 0x214]
01aea 48bb30966e20be7f0000           movabs     rbx, 0x7fbe206e9630
01af4 4883830801000001               add        qword ptr [rbx + 0x108], 1
01afc ffc8                           dec        eax
01afe 2bf0                           sub        esi, eax
01b00 48bb008d6e20be7f0000           movabs     rbx, 0x7fbe206e8d00
01b0a 8b4370                         mov        eax, dword ptr [rbx + 0x70]
01b0d 83c002                         add        eax, 2
01b10 894370                         mov        dword ptr [rbx + 0x70], eax
01b13 25feff1f00                     and        eax, 0x1ffffe
01b18 85c0                           test       eax, eax
01b1a 0f84c4320000                   je         0x7fbe283c0ae4
01b20 48bb008d6e20be7f0000           movabs     rbx, 0x7fbe206e8d00
01b2a 488383a800000001               add        qword ptr [rbx + 0xa8], 1
01b32 48bb0000000000000000           movabs     rbx, 0
01b3c bb00000000                     mov        ebx, 0
01b41 443bdb                         cmp        r11d, ebx
01b44 0f8cbb320000                   jl         0x7fbe283c0b05
01b4a 443bde                         cmp        r11d, esi
01b4d 0f8dbf320000                   jge        0x7fbe283c0b12
01b53 498bdb                         mov        rbx, r11
01b56 899c241c020000                 mov        dword ptr [rsp + 0x21c], ebx
01b5d 44899c2414020000               mov        dword ptr [rsp + 0x214], r11d
01b65 4889bc2480010000               mov        qword ptr [rsp + 0x180], rdi
01b6d 488bbc2420020000               mov        rdi, qword ptr [rsp + 0x220]
01b75 488bf7                         mov        rsi, rdi
01b78 48ba98ac6e20be7f0000           movabs     rdx, 0x7fbe206eac98
01b82 8b36                           mov        esi, dword ptr [rsi]
01b84 c1ee0d                         shr        esi, 0xd
01b87 48c1e60a                       shl        rsi, 0xa
01b8b 41ba0000008b                   mov        r10d, 0x8b000000
01b91 4903f2                         add        rsi, r10
01b94 41ba1e000000                   mov        r10d, 0x1e
01b9a 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01b9e 7436                           je         0x7fbe283bd8d6
01ba0 4983c202                       add        r10, 2
01ba4 4983fa22                       cmp        r10, 0x22
01ba8 75f0                           jne        0x7fbe283bd89a
01baa 41ba1e000000                   mov        r10d, 0x1e
01bb0 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01bb5 7412                           je         0x7fbe283bd8c9
01bb7 4983c202                       add        r10, 2
01bbb 4983fa22                       cmp        r10, 0x22
01bbf 75ef                           jne        0x7fbe283bd8b0
01bc1 41ba1d000000                   mov        r10d, 0x1d
01bc7 eb11                           jmp        0x7fbe283bd8da
01bc9 50                             push       rax
01bca 4833c0                         xor        rax, rax
01bcd f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01bd3 58                             pop        rax
01bd4 ebbe                           jmp        0x7fbe283bd894
01bd6 4983c201                       add        r10, 1
01bda 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01bdf 488bf7                         mov        rsi, rdi
01be2 666690                         nop        
01be5 48b8c8a12004be7f0000           movabs     rax, 0x7fbe0420a1c8
01bef e86cda5307                     call       0x7fbe2f8fb360
01bf4 0f1f8400ec1c0008               nop        dword ptr [rax + rax + 0x8001cec]
01bfc 483b00                         cmp        rax, qword ptr [rax]
01bff 488bf0                         mov        rsi, rax
01c02 48ba98ac6e20be7f0000           movabs     rdx, 0x7fbe206eac98
01c0c 8b36                           mov        esi, dword ptr [rsi]
01c0e c1ee0d                         shr        esi, 0xd
01c11 48c1e60a                       shl        rsi, 0xa
01c15 41ba0000008b                   mov        r10d, 0x8b000000
01c1b 4903f2                         add        rsi, r10
01c1e 41ba24000000                   mov        r10d, 0x24
01c24 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01c28 7436                           je         0x7fbe283bd960
01c2a 4983c202                       add        r10, 2
01c2e 4983fa28                       cmp        r10, 0x28
01c32 75f0                           jne        0x7fbe283bd924
01c34 41ba24000000                   mov        r10d, 0x24
01c3a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01c3f 7412                           je         0x7fbe283bd953
01c41 4983c202                       add        r10, 2
01c45 4983fa28                       cmp        r10, 0x28
01c49 75ef                           jne        0x7fbe283bd93a
01c4b 41ba23000000                   mov        r10d, 0x23
01c51 eb11                           jmp        0x7fbe283bd964
01c53 50                             push       rax
01c54 4833c0                         xor        rax, rax
01c57 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01c5d 58                             pop        rax
01c5e ebbe                           jmp        0x7fbe283bd91e
01c60 4983c201                       add        r10, 1
01c64 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01c69 8b7024                         mov        esi, dword ptr [rax + 0x24]
01c6c 488bd0                         mov        rdx, rax
01c6f 48b998ac6e20be7f0000           movabs     rcx, 0x7fbe206eac98
01c79 8b12                           mov        edx, dword ptr [rdx]
01c7b c1ea0d                         shr        edx, 0xd
01c7e 48c1e20a                       shl        rdx, 0xa
01c82 41ba0000008b                   mov        r10d, 0x8b000000
01c88 4903d2                         add        rdx, r10
01c8b 41ba2a000000                   mov        r10d, 0x2a
01c91 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01c95 7436                           je         0x7fbe283bd9cd
01c97 4983c202                       add        r10, 2
01c9b 4983fa2e                       cmp        r10, 0x2e
01c9f 75f0                           jne        0x7fbe283bd991
01ca1 41ba2a000000                   mov        r10d, 0x2a
01ca7 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01cac 7412                           je         0x7fbe283bd9c0
01cae 4983c202                       add        r10, 2
01cb2 4983fa2e                       cmp        r10, 0x2e
01cb6 75ef                           jne        0x7fbe283bd9a7
01cb8 41ba29000000                   mov        r10d, 0x29
01cbe eb11                           jmp        0x7fbe283bd9d1
01cc0 50                             push       rax
01cc1 4833c0                         xor        rax, rax
01cc4 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
01cca 58                             pop        rax
01ccb ebbe                           jmp        0x7fbe283bd98b
01ccd 4983c201                       add        r10, 1
01cd1 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01cd6 8b4804                         mov        ecx, dword ptr [rax + 4]
01cd9 48ba98ac6e20be7f0000           movabs     rdx, 0x7fbe206eac98
01ce3 4883827801000001               add        qword ptr [rdx + 0x178], 1
01ceb 48ba68986e20be7f0000           movabs     rdx, 0x7fbe206e9868
01cf5 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01cf9 4183c002                       add        r8d, 2
01cfd 44894270                       mov        dword ptr [rdx + 0x70], r8d
01d01 4181e0feff1f00                 and        r8d, 0x1ffffe
01d08 4585c0                         test       r8d, r8d
01d0b 0f8413310000                   je         0x7fbe283c0b24
01d11 48ba98ac6e20be7f0000           movabs     rdx, 0x7fbe206eac98
01d1b 4883828801000001               add        qword ptr [rdx + 0x188], 1
01d23 8b9c241c020000                 mov        ebx, dword ptr [rsp + 0x21c]
01d2a 4863db                         movsxd     rbx, ebx
01d2d ba08000000                     mov        edx, 8
01d32 4c8bcb                         mov        r9, rbx
01d35 4c03ca                         add        r9, rdx
01d38 48ba508a6e20be7f0000           movabs     rdx, 0x7fbe206e8a50
01d42 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01d46 4183c002                       add        r8d, 2
01d4a 44894270                       mov        dword ptr [rdx + 0x70], r8d
01d4e 4181e0feff1f00                 and        r8d, 0x1ffffe
01d55 4585c0                         test       r8d, r8d
01d58 0f84e7300000                   je         0x7fbe283c0b45
01d5e 48ba508a6e20be7f0000           movabs     rdx, 0x7fbe206e8a50
01d68 488382d800000001               add        qword ptr [rdx + 0xd8], 1
01d70 48bac88b6e20be7f0000           movabs     rdx, 0x7fbe206e8bc8
01d7a 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01d7e 4183c002                       add        r8d, 2
01d82 44894270                       mov        dword ptr [rdx + 0x70], r8d
01d86 4181e0feff1f00                 and        r8d, 0x1ffffe
01d8d 4585c0                         test       r8d, r8d
01d90 0f84d0300000                   je         0x7fbe283c0b66
01d96 48ba98ac6e20be7f0000           movabs     rdx, 0x7fbe206eac98
01da0 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
01da8 48ba700770e200000000           movabs     rdx, 0xe2700770
01db2 ba02000000                     mov        edx, 2
01db7 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
01dbf bf00000000                     mov        edi, 0
01dc4 488b842420020000               mov        rax, qword ptr [rsp + 0x220]
01dcc 48890424                       mov        qword ptr [rsp], rax
01dd0 488b842480010000               mov        rax, qword ptr [rsp + 0x180]
01dd8 4889442408                     mov        qword ptr [rsp + 8], rax
01ddd 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01de2 49ba700770e200000000           movabs     r10, 0xe2700770
01dec 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01df1 4889842480010000               mov        qword ptr [rsp + 0x180], rax
01df9 660f1f440000                   nop        word ptr [rax + rax]
01dff e85cdd5307                     call       0x7fbe2f8fb860
01e04 0f1f8400fc1e0009               nop        dword ptr [rax + rax + 0x9001efc]
01e0c 448b9c2414020000               mov        r11d, dword ptr [rsp + 0x214]
01e14 4183c310                       add        r11d, 0x10
01e18 8bb42418020000                 mov        esi, dword ptr [rsp + 0x218]
01e1f 83c610                         add        esi, 0x10
01e22 443b9c2404020000               cmp        r11d, dword ptr [rsp + 0x204]
01e2a ba02000000                     mov        edx, 2
01e2f 7c05                           jl         0x7fbe283bdb36
01e31 ba00000000                     mov        edx, 0
01e36 48b988b15220be7f0000           movabs     rcx, 0x7fbe2052b188
01e40 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
01e44 4403c2                         add        r8d, edx
01e47 44894174                       mov        dword ptr [rcx + 0x74], r8d
01e4b 85d2                           test       edx, edx
01e4d 7506                           jne        0x7fbe283bdb55
01e4f 41b802000000                   mov        r8d, 2
01e55 4181e0fe3f0000                 and        r8d, 0x3ffe
01e5c 4585c0                         test       r8d, r8d
01e5f 0f8422300000                   je         0x7fbe283c0b87
01e65 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01e69 418502                         test       dword ptr [r10], eax
01e6c 443b9c2404020000               cmp        r11d, dword ptr [rsp + 0x204]
01e74 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
01e7e b940050000                     mov        ecx, 0x540
01e83 7c05                           jl         0x7fbe283bdb8a
01e85 b950050000                     mov        ecx, 0x550
01e8a 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01e8e 4d8d4001                       lea        r8, [r8 + 1]
01e92 4c89040a                       mov        qword ptr [rdx + rcx], r8
01e96 0f8c44f5ffff                   jl         0x7fbe283bd0e0
01e9c 48be88b15220be7f0000           movabs     rsi, 0x7fbe2052b188
01ea6 ff8660050000                   inc        dword ptr [rsi + 0x560]
01eac e996000000                     jmp        0x7fbe283bdc47
01eb1 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
01ebb 4883827805000001               add        qword ptr [rdx + 0x578], 1
01ec3 488bb42490010000               mov        rsi, qword ptr [rsp + 0x190]
01ecb 8b9424bc010000                 mov        edx, dword ptr [rsp + 0x1bc]
01ed2 488bd9                         mov        rbx, rcx
01ed5 488b8c2480010000               mov        rcx, qword ptr [rsp + 0x180]
01edd 448b84248c010000               mov        r8d, dword ptr [rsp + 0x18c]
01ee5 4c8bcb                         mov        r9, rbx
01ee8 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
01eed 4c89442408                     mov        qword ptr [rsp + 8], r8
01ef2 48890c24                       mov        qword ptr [rsp], rcx
01ef6 4889542418                     mov        qword ptr [rsp + 0x18], rdx
01efb 4889742420                     mov        qword ptr [rsp + 0x20], rsi
01f00 488bfe                         mov        rdi, rsi
01f03 488bf2                         mov        rsi, rdx
01f06 488bd1                         mov        rdx, rcx
01f09 498bc8                         mov        rcx, r8
01f0c 4d8bc1                         mov        r8, r9
01f0f e82cbc5207                     call       0x7fbe2f8e9840
01f14 85c0                           test       eax, eax
01f16 0f842b000000                   je         0x7fbe283bdc47
01f1c 488bf8                         mov        rdi, rax
01f1f 83f7ff                         xor        edi, 0xffffffff
01f22 488b0c24                       mov        rcx, qword ptr [rsp]
01f26 4c8b442408                     mov        r8, qword ptr [rsp + 8]
01f2b 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
01f30 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
01f35 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
01f3a 442bcf                         sub        r9d, edi
01f3d 03d7                           add        edx, edi
01f3f 4403c7                         add        r8d, edi
01f42 e9612f0000                     jmp        0x7fbe283c0ba8
01f47 8bb424fc010000                 mov        esi, dword ptr [rsp + 0x1fc]
01f4e 448bac2404020000               mov        r13d, dword ptr [rsp + 0x204]
01f56 8bbc24a4010000                 mov        edi, dword ptr [rsp + 0x1a4]
01f5d 498bdd                         mov        rbx, r13
01f60 2b9c2400020000                 sub        ebx, dword ptr [rsp + 0x200]
01f67 83ff10                         cmp        edi, 0x10
01f6a 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
01f74 b988050000                     mov        ecx, 0x588
01f79 7f05                           jg         0x7fbe283bdc80
01f7b b998050000                     mov        ecx, 0x598
01f80 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01f84 4d8d4001                       lea        r8, [r8 + 1]
01f88 4c89040a                       mov        qword ptr [rdx + rcx], r8
01f8c 448b9c2400020000               mov        r11d, dword ptr [rsp + 0x200]
01f94 0f8f2c000000                   jg         0x7fbe283bdcc6
01f9a 4183fb10                       cmp        r11d, 0x10
01f9e 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
01fa8 b9b8050000                     mov        ecx, 0x5b8
01fad 7d05                           jge        0x7fbe283bdcb4
01faf b9a8050000                     mov        ecx, 0x5a8
01fb4 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01fb8 4d8d4001                       lea        r8, [r8 + 1]
01fbc 4c89040a                       mov        qword ptr [rdx + rcx], r8
01fc0 0f8d5b150000                   jge        0x7fbe283bf221
01fc6 443bdf                         cmp        r11d, edi
01fc9 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
01fd3 b920060000                     mov        ecx, 0x620
01fd8 7c05                           jl         0x7fbe283bdcdf
01fda b930060000                     mov        ecx, 0x630
01fdf 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01fe3 4d8d4001                       lea        r8, [r8 + 1]
01fe7 4c89040a                       mov        qword ptr [rdx + rcx], r8
01feb 0f8cc9030000                   jl         0x7fbe283be0ba
01ff1 83ff30                         cmp        edi, 0x30
01ff4 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
01ffe b940060000                     mov        ecx, 0x640
02003 7e05                           jle        0x7fbe283bdd0a
02005 b950060000                     mov        ecx, 0x650
0200a 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0200e 4d8d4001                       lea        r8, [r8 + 1]
02012 4c89040a                       mov        qword ptr [rdx + rcx], r8
02016 89b4242c020000                 mov        dword ptr [rsp + 0x22c], esi
0201d 0f8ea7000000                   jle        0x7fbe283bddca
02023 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
0202d 4883826006000001               add        qword ptr [rdx + 0x660], 1
02035 488bb42480010000               mov        rsi, qword ptr [rsp + 0x180]
0203d 488bd3                         mov        rdx, rbx
02040 488b8c2480010000               mov        rcx, qword ptr [rsp + 0x180]
02048 4d8bc5                         mov        r8, r13
0204b 4c8bcf                         mov        r9, rdi
0204e 4489ac2428020000               mov        dword ptr [rsp + 0x228], r13d
02056 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
0205b 4c89442408                     mov        qword ptr [rsp + 8], r8
02060 48890c24                       mov        qword ptr [rsp], rcx
02064 4889542418                     mov        qword ptr [rsp + 0x18], rdx
02069 4889742420                     mov        qword ptr [rsp + 0x20], rsi
0206e 488bfe                         mov        rdi, rsi
02071 488bf2                         mov        rsi, rdx
02074 488bd1                         mov        rdx, rcx
02077 498bc8                         mov        rcx, r8
0207a 4d8bc1                         mov        r8, r9
0207d e8beba5207                     call       0x7fbe2f8e9840
02082 85c0                           test       eax, eax
02084 0f842b000000                   je         0x7fbe283bddb5
0208a 488bf8                         mov        rdi, rax
0208d 83f7ff                         xor        edi, 0xffffffff
02090 488b0c24                       mov        rcx, qword ptr [rsp]
02094 4c8b442408                     mov        r8, qword ptr [rsp + 8]
02099 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
0209e 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
020a3 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
020a8 442bcf                         sub        r9d, edi
020ab 03d7                           add        edx, edi
020ad 4403c7                         add        r8d, edi
020b0 e9042e0000                     jmp        0x7fbe283c0bb9
020b5 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
020bf ff8270060000                   inc        dword ptr [rdx + 0x670]
020c5 e9f8010000                     jmp        0x7fbe283bdfc2
020ca 4489ac2428020000               mov        dword ptr [rsp + 0x228], r13d
020d2 448bac2428020000               mov        r13d, dword ptr [rsp + 0x228]
020da 4403ac24a4010000               add        r13d, dword ptr [rsp + 0x1a4]
020e2 4489ac2438020000               mov        dword ptr [rsp + 0x238], r13d
020ea 8bbc2428020000                 mov        edi, dword ptr [rsp + 0x228]
020f1 0f1f8000000000                 nop        dword ptr [rax]
020f8 89bc2430020000                 mov        dword ptr [rsp + 0x230], edi
020ff 488b842480010000               mov        rax, qword ptr [rsp + 0x180]
02107 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
02111 4883828806000001               add        qword ptr [rdx + 0x688], 1
02119 48ba186a108b00000000           movabs     rdx, 0x8b106a18
02123 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02126 83c102                         add        ecx, 2
02129 894a70                         mov        dword ptr [rdx + 0x70], ecx
0212c 81e1feff1f00                   and        ecx, 0x1ffffe
02132 85c9                           test       ecx, ecx
02134 0f848f2d0000                   je         0x7fbe283c0bc9
0213a 660f1f440000                   nop        word ptr [rax + rax]
02140 e9b42d0000                     jmp        0x7fbe283c0bf9
02145 90                             nop        
02146 90                             nop        
02147 90                             nop        
02148 90                             nop        
02149 90                             nop        
0214a 48ba186a108b00000000           movabs     rdx, 0x8b106a18
02154 488d92d8000000                 lea        rdx, [rdx + 0xd8]
0215b 4885c0                         test       rax, rax
0215e 750c                           jne        0x7fbe283bde6c
02160 f6420801                       test       byte ptr [rdx + 8], 1
02164 7506                           jne        0x7fbe283bde6c
02166 f048834a0801                   lock or    qword ptr [rdx + 8], 1
0216c 48be40c46be200000000           movabs     rsi, 0xe26bc440
02176 488bd6                         mov        rdx, rsi
02179 48b9186a108b00000000           movabs     rcx, 0x8b106a18
02183 8b12                           mov        edx, dword ptr [rdx]
02185 c1ea0d                         shr        edx, 0xd
02188 48c1e20a                       shl        rdx, 0xa
0218c 41ba0000008b                   mov        r10d, 0x8b000000
02192 4903d2                         add        rdx, r10
02195 41ba16000000                   mov        r10d, 0x16
0219b 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0219f 7436                           je         0x7fbe283bded7
021a1 4983c202                       add        r10, 2
021a5 4983fa1a                       cmp        r10, 0x1a
021a9 75f0                           jne        0x7fbe283bde9b
021ab 41ba16000000                   mov        r10d, 0x16
021b1 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
021b6 7412                           je         0x7fbe283bdeca
021b8 4983c202                       add        r10, 2
021bc 4983fa1a                       cmp        r10, 0x1a
021c0 75ef                           jne        0x7fbe283bdeb1
021c2 41ba15000000                   mov        r10d, 0x15
021c8 eb11                           jmp        0x7fbe283bdedb
021ca 50                             push       rax
021cb 4833c0                         xor        rax, rax
021ce f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
021d4 58                             pop        rax
021d5 ebbe                           jmp        0x7fbe283bde95
021d7 4983c201                       add        r10, 1
021db 4a8304d101                     add        qword ptr [rcx + r10*8], 1
021e0 488bd0                         mov        rdx, rax
021e3 488bcb                         mov        rcx, rbx
021e6 899c2434020000                 mov        dword ptr [rsp + 0x234], ebx
021ed 4889842480010000               mov        qword ptr [rsp + 0x180], rax
021f5 6690                           nop        
021f7 e864cf5307                     call       0x7fbe2f8fae60
021fc 0f1f8400f422000b               nop        dword ptr [rax + rax + 0xb0022f4]
02204 48be88b15220be7f0000           movabs     rsi, 0x7fbe2052b188
0220e 4883869806000001               add        qword ptr [rsi + 0x698], 1
02216 488bb42480010000               mov        rsi, qword ptr [rsp + 0x180]
0221e 8b942430020000                 mov        edx, dword ptr [rsp + 0x230]
02225 488bc8                         mov        rcx, rax
02228 0f1f8000000000                 nop        dword ptr [rax]
0222f e82cd95307                     call       0x7fbe2f8fb860
02234 0f1f84002c23000c               nop        dword ptr [rax + rax + 0xc00232c]
0223c 8bbc2430020000                 mov        edi, dword ptr [rsp + 0x230]
02243 83c708                         add        edi, 8
02246 8b9c2434020000                 mov        ebx, dword ptr [rsp + 0x234]
0224d 83c308                         add        ebx, 8
02250 3bbc2438020000                 cmp        edi, dword ptr [rsp + 0x238]
02257 be02000000                     mov        esi, 2
0225c 7c05                           jl         0x7fbe283bdf63
0225e be00000000                     mov        esi, 0
02263 48b888b15220be7f0000           movabs     rax, 0x7fbe2052b188
0226d 8b5074                         mov        edx, dword ptr [rax + 0x74]
02270 03d6                           add        edx, esi
02272 895074                         mov        dword ptr [rax + 0x74], edx
02275 85f6                           test       esi, esi
02277 7505                           jne        0x7fbe283bdf7e
02279 ba02000000                     mov        edx, 2
0227e 81e2fe3f0000                   and        edx, 0x3ffe
02284 85d2                           test       edx, edx
02286 0f84772c0000                   je         0x7fbe283c0c03
0228c 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02290 418502                         test       dword ptr [r10], eax
02293 3bbc2438020000                 cmp        edi, dword ptr [rsp + 0x238]
0229a 48be88b15220be7f0000           movabs     rsi, 0x7fbe2052b188
022a4 b8a8060000                     mov        eax, 0x6a8
022a9 7c05                           jl         0x7fbe283bdfb0
022ab b8b8060000                     mov        eax, 0x6b8
022b0 488b1406                       mov        rdx, qword ptr [rsi + rax]
022b4 488d5201                       lea        rdx, [rdx + 1]
022b8 48891406                       mov        qword ptr [rsi + rax], rdx
022bc 0f8c36feffff                   jl         0x7fbe283bddf8
022c2 448bac2428020000               mov        r13d, dword ptr [rsp + 0x228]
022ca 4403ac24a4010000               add        r13d, dword ptr [rsp + 0x1a4]
022d2 48be88b15220be7f0000           movabs     rsi, 0x7fbe2052b188
022dc ff86c8060000                   inc        dword ptr [rsi + 0x6c8]
022e2 8bb42470010000                 mov        esi, dword ptr [rsp + 0x170]
022e9 448b8c2474010000               mov        r9d, dword ptr [rsp + 0x174]
022f1 8b9c246c010000                 mov        ebx, dword ptr [rsp + 0x16c]
022f8 488b8c2478010000               mov        rcx, qword ptr [rsp + 0x178]
02300 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
02308 8b8424a0010000                 mov        eax, dword ptr [rsp + 0x1a0]
0230f 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
02317 448b9c2488010000               mov        r11d, dword ptr [rsp + 0x188]
0231f 8b94242c020000                 mov        edx, dword ptr [rsp + 0x22c]
02326 488bbc2480010000               mov        rdi, qword ptr [rsp + 0x180]
0232e 4889bc2440020000               mov        qword ptr [rsp + 0x240], rdi
02336 488bbc2450010000               mov        rdi, qword ptr [rsp + 0x150]
0233e 4889bc2448020000               mov        qword ptr [rsp + 0x248], rdi
02346 8bbc2444010000                 mov        edi, dword ptr [rsp + 0x144]
0234d 89bc243c020000                 mov        dword ptr [rsp + 0x23c], edi
02354 488bbc2458010000               mov        rdi, qword ptr [rsp + 0x158]
0235c 4889bc2450020000               mov        qword ptr [rsp + 0x250], rdi
02364 488bbc2460010000               mov        rdi, qword ptr [rsp + 0x160]
0236c 4889bc2458020000               mov        qword ptr [rsp + 0x258], rdi
02374 8bbc2468010000                 mov        edi, dword ptr [rsp + 0x168]
0237b 89bc2460020000                 mov        dword ptr [rsp + 0x260], edi
02382 488bbc2490010000               mov        rdi, qword ptr [rsp + 0x190]
0238a 4889bc2468020000               mov        qword ptr [rsp + 0x268], rdi
02392 488bbc2498010000               mov        rdi, qword ptr [rsp + 0x198]
0239a 4489ac2468030000               mov        dword ptr [rsp + 0x368], r13d
023a2 4889bc2490030000               mov        qword ptr [rsp + 0x390], rdi
023aa 4d8beb                         mov        r13, r11
023ad 4c8b9c2468020000               mov        r11, qword ptr [rsp + 0x268]
023b5 e9601c0000                     jmp        0x7fbe283bfd1a
023ba 89b4242c020000                 mov        dword ptr [rsp + 0x22c], esi
023c1 4489ac2428020000               mov        dword ptr [rsp + 0x228], r13d
023c9 4183fb10                       cmp        r11d, 0x10
023cd 48be88b15220be7f0000           movabs     rsi, 0x7fbe2052b188
023d7 bfe0060000                     mov        edi, 0x6e0
023dc 7c05                           jl         0x7fbe283be0e3
023de bff0060000                     mov        edi, 0x6f0
023e3 488b043e                       mov        rax, qword ptr [rsi + rdi]
023e7 488d4001                       lea        rax, [rax + 1]
023eb 4889043e                       mov        qword ptr [rsi + rdi], rax
023ef 0f8cf80c0000                   jl         0x7fbe283beded
023f5 448bac2428020000               mov        r13d, dword ptr [rsp + 0x228]
023fd 4403ac24a4010000               add        r13d, dword ptr [rsp + 0x1a4]
02405 8b842428020000                 mov        eax, dword ptr [rsp + 0x228]
0240c 8bb42470010000                 mov        esi, dword ptr [rsp + 0x170]
02413 448b8c2474010000               mov        r9d, dword ptr [rsp + 0x174]
0241b 448b9c246c010000               mov        r11d, dword ptr [rsp + 0x16c]
02423 488b8c2478010000               mov        rcx, qword ptr [rsp + 0x178]
0242b 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
02433 8bbc24a0010000                 mov        edi, dword ptr [rsp + 0x1a0]
0243a 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
02442 8b942488010000                 mov        edx, dword ptr [rsp + 0x188]
02449 89942464020000                 mov        dword ptr [rsp + 0x264], edx
02450 8b94242c020000                 mov        edx, dword ptr [rsp + 0x22c]
02457 89942470020000                 mov        dword ptr [rsp + 0x270], edx
0245e 488b942480010000               mov        rdx, qword ptr [rsp + 0x180]
02466 4889942478020000               mov        qword ptr [rsp + 0x278], rdx
0246e 488b942450010000               mov        rdx, qword ptr [rsp + 0x150]
02476 4889942480020000               mov        qword ptr [rsp + 0x280], rdx
0247e 8b942444010000                 mov        edx, dword ptr [rsp + 0x144]
02485 89942474020000                 mov        dword ptr [rsp + 0x274], edx
0248c 488b942458010000               mov        rdx, qword ptr [rsp + 0x158]
02494 4889942488020000               mov        qword ptr [rsp + 0x288], rdx
0249c 488b942460010000               mov        rdx, qword ptr [rsp + 0x160]
024a4 4889942490020000               mov        qword ptr [rsp + 0x290], rdx
024ac 8b942468010000                 mov        edx, dword ptr [rsp + 0x168]
024b3 89942498020000                 mov        dword ptr [rsp + 0x298], edx
024ba 488b942490010000               mov        rdx, qword ptr [rsp + 0x190]
024c2 48899424a0020000               mov        qword ptr [rsp + 0x2a0], rdx
024ca 488b942498010000               mov        rdx, qword ptr [rsp + 0x198]
024d2 89842428030000                 mov        dword ptr [rsp + 0x328], eax
024d9 4489ac2440030000               mov        dword ptr [rsp + 0x340], r13d
024e1 89b42420030000                 mov        dword ptr [rsp + 0x320], esi
024e8 44898c2444030000               mov        dword ptr [rsp + 0x344], r9d
024f0 44899c2450030000               mov        dword ptr [rsp + 0x350], r11d
024f8 48898c2458030000               mov        qword ptr [rsp + 0x358], rcx
02500 4c89842448030000               mov        qword ptr [rsp + 0x348], r8
02508 89bc2424030000                 mov        dword ptr [rsp + 0x324], edi
0250f 4c89b42438030000               mov        qword ptr [rsp + 0x338], r14
02517 4889942418030000               mov        qword ptr [rsp + 0x318], rdx
0251f 90                             nop        
02520 488b942478020000               mov        rdx, qword ptr [rsp + 0x278]
02528 48be88b15220be7f0000           movabs     rsi, 0x7fbe2052b188
02532 4883860007000001               add        qword ptr [rsi + 0x700], 1
0253a 48bed89f6e20be7f0000           movabs     rsi, 0x7fbe206e9fd8
02544 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
02547 83c702                         add        edi, 2
0254a 897e70                         mov        dword ptr [rsi + 0x70], edi
0254d 81e7feff1f00                   and        edi, 0x1ffffe
02553 85ff                           test       edi, edi
02555 0f84c9290000                   je         0x7fbe283c0c24
0255b 48bec0906ee200000000           movabs     rsi, 0xe26e90c0
02565 48bfd89f6e20be7f0000           movabs     rdi, 0x7fbe206e9fd8
0256f 8b36                           mov        esi, dword ptr [rsi]
02571 c1ee0d                         shr        esi, 0xd
02574 48c1e60a                       shl        rsi, 0xa
02578 41ba0000008b                   mov        r10d, 0x8b000000
0257e 4903f2                         add        rsi, r10
02581 41ba16000000                   mov        r10d, 0x16
02587 4a3b34d7                       cmp        rsi, qword ptr [rdi + r10*8]
0258b 7436                           je         0x7fbe283be2c3
0258d 4983c202                       add        r10, 2
02591 4983fa1a                       cmp        r10, 0x1a
02595 75f0                           jne        0x7fbe283be287
02597 41ba16000000                   mov        r10d, 0x16
0259d 4a833cd700                     cmp        qword ptr [rdi + r10*8], 0
025a2 7412                           je         0x7fbe283be2b6
025a4 4983c202                       add        r10, 2
025a8 4983fa1a                       cmp        r10, 0x1a
025ac 75ef                           jne        0x7fbe283be29d
025ae 41ba15000000                   mov        r10d, 0x15
025b4 eb11                           jmp        0x7fbe283be2c7
025b6 50                             push       rax
025b7 4833c0                         xor        rax, rax
025ba f04a0fb134d7                   lock cmpxchg qword ptr [rdi + r10*8], rsi
025c0 58                             pop        rax
025c1 ebbe                           jmp        0x7fbe283be281
025c3 4983c201                       add        r10, 1
025c7 4a8304d701                     add        qword ptr [rdi + r10*8], 1
025cc 8b4204                         mov        eax, dword ptr [rdx + 4]
025cf 8984242c030000                 mov        dword ptr [rsp + 0x32c], eax
025d6 48bed89f6e20be7f0000           movabs     rsi, 0x7fbe206e9fd8
025e0 488386d800000001               add        qword ptr [rsi + 0xd8], 1
025e8 48be30966e20be7f0000           movabs     rsi, 0x7fbe206e9630
025f2 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
025f5 83c702                         add        edi, 2
025f8 897e70                         mov        dword ptr [rsi + 0x70], edi
025fb 81e7feff1f00                   and        edi, 0x1ffffe
02601 85ff                           test       edi, edi
02603 0f8441290000                   je         0x7fbe283c0c4a
02609 48be30966e20be7f0000           movabs     rsi, 0x7fbe206e9630
02613 4883860801000001               add        qword ptr [rsi + 0x108], 1
0261b 488bf0                         mov        rsi, rax
0261e 83ee0f                         sub        esi, 0xf
02621 48bf008d6e20be7f0000           movabs     rdi, 0x7fbe206e8d00
0262b 8b4770                         mov        eax, dword ptr [rdi + 0x70]
0262e 83c002                         add        eax, 2
02631 894770                         mov        dword ptr [rdi + 0x70], eax
02634 25feff1f00                     and        eax, 0x1ffffe
02639 85c0                           test       eax, eax
0263b 0f842a290000                   je         0x7fbe283c0c6b
02641 48bf008d6e20be7f0000           movabs     rdi, 0x7fbe206e8d00
0264b 488387a800000001               add        qword ptr [rdi + 0xa8], 1
02653 48bf0000000000000000           movabs     rdi, 0
0265d bf00000000                     mov        edi, 0
02662 3bdf                           cmp        ebx, edi
02664 0f8c22290000                   jl         0x7fbe283c0c8c
0266a 3bde                           cmp        ebx, esi
0266c 0f8d27290000                   jge        0x7fbe283c0c99
02672 488bf3                         mov        rsi, rbx
02675 89b42430030000                 mov        dword ptr [rsp + 0x330], esi
0267c 899c2434030000                 mov        dword ptr [rsp + 0x334], ebx
02683 48bfc0906ee200000000           movabs     rdi, 0xe26e90c0
0268d 488bc7                         mov        rax, rdi
02690 48bed89f6e20be7f0000           movabs     rsi, 0x7fbe206e9fd8
0269a 8b00                           mov        eax, dword ptr [rax]
0269c c1e80d                         shr        eax, 0xd
0269f 48c1e00a                       shl        rax, 0xa
026a3 41ba0000008b                   mov        r10d, 0x8b000000
026a9 4903c2                         add        rax, r10
026ac 41ba24000000                   mov        r10d, 0x24
026b2 4a3b04d6                       cmp        rax, qword ptr [rsi + r10*8]
026b6 743c                           je         0x7fbe283be3f4
026b8 4983c202                       add        r10, 2
026bc 4983fa28                       cmp        r10, 0x28
026c0 75f0                           jne        0x7fbe283be3b2
026c2 41ba24000000                   mov        r10d, 0x24
026c8 4a833cd600                     cmp        qword ptr [rsi + r10*8], 0
026cd 7412                           je         0x7fbe283be3e1
026cf 4983c202                       add        r10, 2
026d3 4983fa28                       cmp        r10, 0x28
026d7 75ef                           jne        0x7fbe283be3c8
026d9 41ba23000000                   mov        r10d, 0x23
026df eb17                           jmp        0x7fbe283be3f8
026e1 53                             push       rbx
026e2 488bd8                         mov        rbx, rax
026e5 4833c0                         xor        rax, rax
026e8 f04a0fb11cd6                   lock cmpxchg qword ptr [rsi + r10*8], rbx
026ee 488bc3                         mov        rax, rbx
026f1 5b                             pop        rbx
026f2 ebb8                           jmp        0x7fbe283be3ac
026f4 4983c201                       add        r10, 1
026f8 4a8304d601                     add        qword ptr [rsi + r10*8], 1
026fd 48be008e6e20be7f0000           movabs     rsi, 0x7fbe206e8e00
02707 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
0270a 83c302                         add        ebx, 2
0270d 895e70                         mov        dword ptr [rsi + 0x70], ebx
02710 81e3feff1f00                   and        ebx, 0x1ffffe
02716 85db                           test       ebx, ebx
02718 0f8488280000                   je         0x7fbe283c0ca6
0271e 48be008e6e20be7f0000           movabs     rsi, 0x7fbe206e8e00
02728 488386a800000001               add        qword ptr [rsi + 0xa8], 1
02730 48be288f6e20be7f0000           movabs     rsi, 0x7fbe206e8f28
0273a 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
0273d 83c702                         add        edi, 2
02740 897e70                         mov        dword ptr [rsi + 0x70], edi
02743 81e7feff1f00                   and        edi, 0x1ffffe
02749 85ff                           test       edi, edi
0274b 0f8476280000                   je         0x7fbe283c0cc7
02751 48be288f6e20be7f0000           movabs     rsi, 0x7fbe206e8f28
0275b ff86b8000000                   inc        dword ptr [rsi + 0xb8]
02761 8bb42430030000                 mov        esi, dword ptr [rsp + 0x330]
02768 48bbb8106fe200000000           movabs     rbx, 0xe26f10b8
02772 488bc3                         mov        rax, rbx
02775 49bbd89f6e20be7f0000           movabs     r11, 0x7fbe206e9fd8
0277f 4983835801000001               add        qword ptr [r11 + 0x158], 1
02787 48b8a0a16e20be7f0000           movabs     rax, 0x7fbe206ea1a0
02791 448b5870                       mov        r11d, dword ptr [rax + 0x70]
02795 4183c302                       add        r11d, 2
02799 44895870                       mov        dword ptr [rax + 0x70], r11d
0279d 4181e3feff1f00                 and        r11d, 0x1ffffe
027a4 4585db                         test       r11d, r11d
027a7 0f843b280000                   je         0x7fbe283c0ce8
027ad 488bc3                         mov        rax, rbx
027b0 49bba0a16e20be7f0000           movabs     r11, 0x7fbe206ea1a0
027ba 498383a800000001               add        qword ptr [r11 + 0xa8], 1
027c2 48b880a26e20be7f0000           movabs     rax, 0x7fbe206ea280
027cc 448b5870                       mov        r11d, dword ptr [rax + 0x70]
027d0 4183c302                       add        r11d, 2
027d4 44895870                       mov        dword ptr [rax + 0x70], r11d
027d8 4181e3feff1f00                 and        r11d, 0x1ffffe
027df 4585db                         test       r11d, r11d
027e2 0f8421280000                   je         0x7fbe283c0d09
027e8 48b880a26e20be7f0000           movabs     rax, 0x7fbe206ea280
027f2 488380b800000001               add        qword ptr [rax + 0xb8], 1
027fa 48bba8976e20be7f0000           movabs     rbx, 0x7fbe206e97a8
02804 8b4370                         mov        eax, dword ptr [rbx + 0x70]
02807 83c002                         add        eax, 2
0280a 894370                         mov        dword ptr [rbx + 0x70], eax
0280d 25feff1f00                     and        eax, 0x1ffffe
02812 85c0                           test       eax, eax
02814 0f8410280000                   je         0x7fbe283c0d2a
0281a 48bbc0906ee200000000           movabs     rbx, 0xe26e90c0
02824 488bc3                         mov        rax, rbx
02827 49bb80a26e20be7f0000           movabs     r11, 0x7fbe206ea280
02831 8b00                           mov        eax, dword ptr [rax]
02833 c1e80d                         shr        eax, 0xd
02836 48c1e00a                       shl        rax, 0xa
0283a 41ba0000008b                   mov        r10d, 0x8b000000
02840 4903c2                         add        rax, r10
02843 41ba1c000000                   mov        r10d, 0x1c
02849 4b3b04d3                       cmp        rax, qword ptr [r11 + r10*8]
0284d 743c                           je         0x7fbe283be58b
0284f 4983c202                       add        r10, 2
02853 4983fa20                       cmp        r10, 0x20
02857 75f0                           jne        0x7fbe283be549
02859 41ba1c000000                   mov        r10d, 0x1c
0285f 4b833cd300                     cmp        qword ptr [r11 + r10*8], 0
02864 7412                           je         0x7fbe283be578
02866 4983c202                       add        r10, 2
0286a 4983fa20                       cmp        r10, 0x20
0286e 75ef                           jne        0x7fbe283be55f
02870 41ba1b000000                   mov        r10d, 0x1b
02876 eb17                           jmp        0x7fbe283be58f
02878 53                             push       rbx
02879 488bd8                         mov        rbx, rax
0287c 4833c0                         xor        rax, rax
0287f f04b0fb11cd3                   lock cmpxchg qword ptr [r11 + r10*8], rbx
02885 488bc3                         mov        rax, rbx
02888 5b                             pop        rbx
02889 ebb8                           jmp        0x7fbe283be543
0288b 4983c201                       add        r10, 1
0288f 4b8304d301                     add        qword ptr [r11 + r10*8], 1
02894 48b880a26e20be7f0000           movabs     rax, 0x7fbe206ea280
0289e 8b1b                           mov        ebx, dword ptr [rbx]
028a0 c1eb0d                         shr        ebx, 0xd
028a3 48c1e30a                       shl        rbx, 0xa
028a7 41ba0000008b                   mov        r10d, 0x8b000000
028ad 4903da                         add        rbx, r10
028b0 41ba22000000                   mov        r10d, 0x22
028b6 4a3b1cd0                       cmp        rbx, qword ptr [rax + r10*8]
028ba 743c                           je         0x7fbe283be5f8
028bc 4983c202                       add        r10, 2
028c0 4983fa26                       cmp        r10, 0x26
028c4 75f0                           jne        0x7fbe283be5b6
028c6 41ba22000000                   mov        r10d, 0x22
028cc 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
028d1 7412                           je         0x7fbe283be5e5
028d3 4983c202                       add        r10, 2
028d7 4983fa26                       cmp        r10, 0x26
028db 75ef                           jne        0x7fbe283be5cc
028dd 41ba21000000                   mov        r10d, 0x21
028e3 eb17                           jmp        0x7fbe283be5fc
028e5 51                             push       rcx
028e6 488bc8                         mov        rcx, rax
028e9 4833c0                         xor        rax, rax
028ec f04a0fb11cd1                   lock cmpxchg qword ptr [rcx + r10*8], rbx
028f2 488bc1                         mov        rax, rcx
028f5 59                             pop        rcx
028f6 ebb8                           jmp        0x7fbe283be5b0
028f8 4983c201                       add        r10, 1
028fc 4a8304d001                     add        qword ptr [rax + r10*8], 1
02901 48bb80a26e20be7f0000           movabs     rbx, 0x7fbe206ea280
0290b 4883833801000001               add        qword ptr [rbx + 0x138], 1
02913 48bb68986e20be7f0000           movabs     rbx, 0x7fbe206e9868
0291d 8b4370                         mov        eax, dword ptr [rbx + 0x70]
02920 83c002                         add        eax, 2
02923 894370                         mov        dword ptr [rbx + 0x70], eax
02926 25feff1f00                     and        eax, 0x1ffffe
0292b 85c0                           test       eax, eax
0292d 0f8418270000                   je         0x7fbe283c0d4b
02933 48bb80a26e20be7f0000           movabs     rbx, 0x7fbe206ea280
0293d 4883834801000001               add        qword ptr [rbx + 0x148], 1
02945 4863de                         movsxd     rbx, esi
02948 be08000000                     mov        esi, 8
0294d 488bc3                         mov        rax, rbx
02950 4803c6                         add        rax, rsi
02953 48be508a6e20be7f0000           movabs     rsi, 0x7fbe206e8a50
0295d 448b5e70                       mov        r11d, dword ptr [rsi + 0x70]
02961 4183c302                       add        r11d, 2
02965 44895e70                       mov        dword ptr [rsi + 0x70], r11d
02969 4181e3feff1f00                 and        r11d, 0x1ffffe
02970 4585db                         test       r11d, r11d
02973 0f84f3260000                   je         0x7fbe283c0d6c
02979 48be508a6e20be7f0000           movabs     rsi, 0x7fbe206e8a50
02983 488386d800000001               add        qword ptr [rsi + 0xd8], 1
0298b 48bec88b6e20be7f0000           movabs     rsi, 0x7fbe206e8bc8
02995 448b5e70                       mov        r11d, dword ptr [rsi + 0x70]
02999 4183c302                       add        r11d, 2
0299d 44895e70                       mov        dword ptr [rsi + 0x70], r11d
029a1 4181e3feff1f00                 and        r11d, 0x1ffffe
029a8 4585db                         test       r11d, r11d
029ab 0f84dc260000                   je         0x7fbe283c0d8d
029b1 48be80a26e20be7f0000           movabs     rsi, 0x7fbe206ea280
029bb 4883866801000001               add        qword ptr [rsi + 0x168], 1
029c3 48be88696fe200000000           movabs     rsi, 0xe26f6988
029cd 48be08916ee200000000           movabs     rsi, 0xe26e9108
029d7 4c8bda                         mov        r11, rdx
029da ba02000000                     mov        edx, 2
029df b910000000                     mov        ecx, 0x10
029e4 4d8bc3                         mov        r8, r11
029e7 4c8bc8                         mov        r9, rax
029ea bf00000000                     mov        edi, 0
029ef 4c891c24                       mov        qword ptr [rsp], r11
029f3 48895c2408                     mov        qword ptr [rsp + 8], rbx
029f8 49bac0906ee200000000           movabs     r10, 0xe26e90c0
02a02 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02a07 49ba88696fe200000000           movabs     r10, 0xe26f6988
02a11 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02a16 4c899c2478020000               mov        qword ptr [rsp + 0x278], r11
02a1e 90                             nop        
02a1f e83cd15307                     call       0x7fbe2f8fb860
02a24 0f1f84001c2b000e               nop        dword ptr [rax + rax + 0xe002b1c]
02a2c 4885c0                         test       rax, rax
02a2f 48bb80a26e20be7f0000           movabs     rbx, 0x7fbe206ea280
02a39 750c                           jne        0x7fbe283be747
02a3b 808b7101000001                 or         byte ptr [rbx + 0x171], 1
02a42 e988000000                     jmp        0x7fbe283be7cf
02a47 8b38                           mov        edi, dword ptr [rax]
02a49 c1ef0d                         shr        edi, 0xd
02a4c 48c1e70a                       shl        rdi, 0xa
02a50 41ba0000008b                   mov        r10d, 0x8b000000
02a56 4903fa                         add        rdi, r10
02a59 41ba30000000                   mov        r10d, 0x30
02a5f 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
02a63 7436                           je         0x7fbe283be79b
02a65 4983c202                       add        r10, 2
02a69 4983fa34                       cmp        r10, 0x34
02a6d 75f0                           jne        0x7fbe283be75f
02a6f 41ba30000000                   mov        r10d, 0x30
02a75 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02a7a 7412                           je         0x7fbe283be78e
02a7c 4983c202                       add        r10, 2
02a80 4983fa34                       cmp        r10, 0x34
02a84 75ef                           jne        0x7fbe283be775
02a86 41ba2f000000                   mov        r10d, 0x2f
02a8c eb11                           jmp        0x7fbe283be79f
02a8e 50                             push       rax
02a8f 4833c0                         xor        rax, rax
02a92 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
02a98 58                             pop        rax
02a99 ebbe                           jmp        0x7fbe283be759
02a9b 4983c201                       add        r10, 1
02a9f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02aa4 48bf00b0148b00000000           movabs     rdi, 0x8b14b000
02aae 8b18                           mov        ebx, dword ptr [rax]
02ab0 c1eb0d                         shr        ebx, 0xd
02ab3 48c1e30a                       shl        rbx, 0xa
02ab7 41ba0000008b                   mov        r10d, 0x8b000000
02abd 4903da                         add        rbx, r10
02ac0 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
02ac4 0f85e4250000                   jne        0x7fbe283c0dae
02aca e900000000                     jmp        0x7fbe283be7cf
02acf 488bf8                         mov        rdi, rax
02ad2 4889bc2460030000               mov        qword ptr [rsp + 0x360], rdi
02ada 483b07                         cmp        rax, qword ptr [rdi]
02add 488bf7                         mov        rsi, rdi
02ae0 48bb88b15220be7f0000           movabs     rbx, 0x7fbe2052b188
02aea 8b36                           mov        esi, dword ptr [rsi]
02aec c1ee0d                         shr        esi, 0xd
02aef 48c1e60a                       shl        rsi, 0xa
02af3 41ba0000008b                   mov        r10d, 0x8b000000
02af9 4903f2                         add        rsi, r10
02afc 41bae3000000                   mov        r10d, 0xe3
02b02 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02b06 743c                           je         0x7fbe283be844
02b08 4983c202                       add        r10, 2
02b0c 4981fae7000000                 cmp        r10, 0xe7
02b13 75ed                           jne        0x7fbe283be802
02b15 41bae3000000                   mov        r10d, 0xe3
02b1b 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02b20 7415                           je         0x7fbe283be837
02b22 4983c202                       add        r10, 2
02b26 4981fae7000000                 cmp        r10, 0xe7
02b2d 75ec                           jne        0x7fbe283be81b
02b2f 41bae2000000                   mov        r10d, 0xe2
02b35 eb11                           jmp        0x7fbe283be848
02b37 50                             push       rax
02b38 4833c0                         xor        rax, rax
02b3b f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02b41 58                             pop        rax
02b42 ebb8                           jmp        0x7fbe283be7fc
02b44 4983c201                       add        r10, 1
02b48 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02b4d 48be98ac6e20be7f0000           movabs     rsi, 0x7fbe206eac98
02b57 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
02b5a 83c302                         add        ebx, 2
02b5d 895e70                         mov        dword ptr [rsi + 0x70], ebx
02b60 81e3feff1f00                   and        ebx, 0x1ffffe
02b66 85db                           test       ebx, ebx
02b68 0f844e250000                   je         0x7fbe283c0dbc
02b6e 488bf7                         mov        rsi, rdi
02b71 48bb98ac6e20be7f0000           movabs     rbx, 0x7fbe206eac98
02b7b 8b36                           mov        esi, dword ptr [rsi]
02b7d c1ee0d                         shr        esi, 0xd
02b80 48c1e60a                       shl        rsi, 0xa
02b84 41ba0000008b                   mov        r10d, 0x8b000000
02b8a 4903f2                         add        rsi, r10
02b8d 41ba16000000                   mov        r10d, 0x16
02b93 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02b97 7436                           je         0x7fbe283be8cf
02b99 4983c202                       add        r10, 2
02b9d 4983fa1a                       cmp        r10, 0x1a
02ba1 75f0                           jne        0x7fbe283be893
02ba3 41ba16000000                   mov        r10d, 0x16
02ba9 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02bae 7412                           je         0x7fbe283be8c2
02bb0 4983c202                       add        r10, 2
02bb4 4983fa1a                       cmp        r10, 0x1a
02bb8 75ef                           jne        0x7fbe283be8a9
02bba 41ba15000000                   mov        r10d, 0x15
02bc0 eb11                           jmp        0x7fbe283be8d3
02bc2 50                             push       rax
02bc3 4833c0                         xor        rax, rax
02bc6 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02bcc 58                             pop        rax
02bcd ebbe                           jmp        0x7fbe283be88d
02bcf 4983c201                       add        r10, 1
02bd3 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02bd8 488bf7                         mov        rsi, rdi
02bdb 6690                           nop        
02bdd 48b8f0a12004be7f0000           movabs     rax, 0x7fbe0420a1f0
02be7 e874ca5307                     call       0x7fbe2f8fb360
02bec 0f1f8400e42c000f               nop        dword ptr [rax + rax + 0xf002ce4]
02bf4 48be98ac6e20be7f0000           movabs     rsi, 0x7fbe206eac98
02bfe 488386d800000001               add        qword ptr [rsi + 0xd8], 1
02c06 48be30966e20be7f0000           movabs     rsi, 0x7fbe206e9630
02c10 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
02c13 83c702                         add        edi, 2
02c16 897e70                         mov        dword ptr [rsi + 0x70], edi
02c19 81e7feff1f00                   and        edi, 0x1ffffe
02c1f 85ff                           test       edi, edi
02c21 0f84b6240000                   je         0x7fbe283c0ddd
02c27 8bb4242c030000                 mov        esi, dword ptr [rsp + 0x32c]
02c2e 8bbc2428030000                 mov        edi, dword ptr [rsp + 0x328]
02c35 48bb30966e20be7f0000           movabs     rbx, 0x7fbe206e9630
02c3f 4883830801000001               add        qword ptr [rbx + 0x108], 1
02c47 ffc8                           dec        eax
02c49 2bf0                           sub        esi, eax
02c4b 48bb008d6e20be7f0000           movabs     rbx, 0x7fbe206e8d00
02c55 8b4370                         mov        eax, dword ptr [rbx + 0x70]
02c58 83c002                         add        eax, 2
02c5b 894370                         mov        dword ptr [rbx + 0x70], eax
02c5e 25feff1f00                     and        eax, 0x1ffffe
02c63 85c0                           test       eax, eax
02c65 0f8493240000                   je         0x7fbe283c0dfe
02c6b 48bb008d6e20be7f0000           movabs     rbx, 0x7fbe206e8d00
02c75 488383a800000001               add        qword ptr [rbx + 0xa8], 1
02c7d 48bb0000000000000000           movabs     rbx, 0
02c87 bb00000000                     mov        ebx, 0
02c8c 3bfb                           cmp        edi, ebx
02c8e 0f8c8b240000                   jl         0x7fbe283c0e1f
02c94 3bfe                           cmp        edi, esi
02c96 0f8d90240000                   jge        0x7fbe283c0e2c
02c9c 488bc7                         mov        rax, rdi
02c9f 89842454030000                 mov        dword ptr [rsp + 0x354], eax
02ca6 89bc2428030000                 mov        dword ptr [rsp + 0x328], edi
02cad 488bbc2460030000               mov        rdi, qword ptr [rsp + 0x360]
02cb5 488bf7                         mov        rsi, rdi
02cb8 48b998ac6e20be7f0000           movabs     rcx, 0x7fbe206eac98
02cc2 8b36                           mov        esi, dword ptr [rsi]
02cc4 c1ee0d                         shr        esi, 0xd
02cc7 48c1e60a                       shl        rsi, 0xa
02ccb 41ba0000008b                   mov        r10d, 0x8b000000
02cd1 4903f2                         add        rsi, r10
02cd4 41ba1e000000                   mov        r10d, 0x1e
02cda 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
02cde 7436                           je         0x7fbe283bea16
02ce0 4983c202                       add        r10, 2
02ce4 4983fa22                       cmp        r10, 0x22
02ce8 75f0                           jne        0x7fbe283be9da
02cea 41ba1e000000                   mov        r10d, 0x1e
02cf0 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02cf5 7412                           je         0x7fbe283bea09
02cf7 4983c202                       add        r10, 2
02cfb 4983fa22                       cmp        r10, 0x22
02cff 75ef                           jne        0x7fbe283be9f0
02d01 41ba1d000000                   mov        r10d, 0x1d
02d07 eb11                           jmp        0x7fbe283bea1a
02d09 50                             push       rax
02d0a 4833c0                         xor        rax, rax
02d0d f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
02d13 58                             pop        rax
02d14 ebbe                           jmp        0x7fbe283be9d4
02d16 4983c201                       add        r10, 1
02d1a 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02d1f 488bf7                         mov        rsi, rdi
02d22 666690                         nop        
02d25 48b818a22004be7f0000           movabs     rax, 0x7fbe0420a218
02d2f e82cc95307                     call       0x7fbe2f8fb360
02d34 0f1f84002c2e0010               nop        dword ptr [rax + rax + 0x10002e2c]
02d3c 483b00                         cmp        rax, qword ptr [rax]
02d3f 488bf0                         mov        rsi, rax
02d42 48ba98ac6e20be7f0000           movabs     rdx, 0x7fbe206eac98
02d4c 8b36                           mov        esi, dword ptr [rsi]
02d4e c1ee0d                         shr        esi, 0xd
02d51 48c1e60a                       shl        rsi, 0xa
02d55 41ba0000008b                   mov        r10d, 0x8b000000
02d5b 4903f2                         add        rsi, r10
02d5e 41ba24000000                   mov        r10d, 0x24
02d64 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02d68 7436                           je         0x7fbe283beaa0
02d6a 4983c202                       add        r10, 2
02d6e 4983fa28                       cmp        r10, 0x28
02d72 75f0                           jne        0x7fbe283bea64
02d74 41ba24000000                   mov        r10d, 0x24
02d7a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02d7f 7412                           je         0x7fbe283bea93
02d81 4983c202                       add        r10, 2
02d85 4983fa28                       cmp        r10, 0x28
02d89 75ef                           jne        0x7fbe283bea7a
02d8b 41ba23000000                   mov        r10d, 0x23
02d91 eb11                           jmp        0x7fbe283beaa4
02d93 50                             push       rax
02d94 4833c0                         xor        rax, rax
02d97 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
02d9d 58                             pop        rax
02d9e ebbe                           jmp        0x7fbe283bea5e
02da0 4983c201                       add        r10, 1
02da4 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02da9 8b7024                         mov        esi, dword ptr [rax + 0x24]
02dac 488bd0                         mov        rdx, rax
02daf 48b998ac6e20be7f0000           movabs     rcx, 0x7fbe206eac98
02db9 8b12                           mov        edx, dword ptr [rdx]
02dbb c1ea0d                         shr        edx, 0xd
02dbe 48c1e20a                       shl        rdx, 0xa
02dc2 41ba0000008b                   mov        r10d, 0x8b000000
02dc8 4903d2                         add        rdx, r10
02dcb 41ba2a000000                   mov        r10d, 0x2a
02dd1 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02dd5 7436                           je         0x7fbe283beb0d
02dd7 4983c202                       add        r10, 2
02ddb 4983fa2e                       cmp        r10, 0x2e
02ddf 75f0                           jne        0x7fbe283bead1
02de1 41ba2a000000                   mov        r10d, 0x2a
02de7 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02dec 7412                           je         0x7fbe283beb00
02dee 4983c202                       add        r10, 2
02df2 4983fa2e                       cmp        r10, 0x2e
02df6 75ef                           jne        0x7fbe283beae7
02df8 41ba29000000                   mov        r10d, 0x29
02dfe eb11                           jmp        0x7fbe283beb11
02e00 50                             push       rax
02e01 4833c0                         xor        rax, rax
02e04 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02e0a 58                             pop        rax
02e0b ebbe                           jmp        0x7fbe283beacb
02e0d 4983c201                       add        r10, 1
02e11 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02e16 8b4804                         mov        ecx, dword ptr [rax + 4]
02e19 48ba98ac6e20be7f0000           movabs     rdx, 0x7fbe206eac98
02e23 4883827801000001               add        qword ptr [rdx + 0x178], 1
02e2b 48ba68986e20be7f0000           movabs     rdx, 0x7fbe206e9868
02e35 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02e39 4183c002                       add        r8d, 2
02e3d 44894270                       mov        dword ptr [rdx + 0x70], r8d
02e41 4181e0feff1f00                 and        r8d, 0x1ffffe
02e48 4585c0                         test       r8d, r8d
02e4b 0f84ed220000                   je         0x7fbe283c0e3e
02e51 48ba98ac6e20be7f0000           movabs     rdx, 0x7fbe206eac98
02e5b 4883828801000001               add        qword ptr [rdx + 0x188], 1
02e63 8b842454030000                 mov        eax, dword ptr [rsp + 0x354]
02e6a 4863c0                         movsxd     rax, eax
02e6d ba08000000                     mov        edx, 8
02e72 4c8bc8                         mov        r9, rax
02e75 4c03ca                         add        r9, rdx
02e78 48ba508a6e20be7f0000           movabs     rdx, 0x7fbe206e8a50
02e82 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02e86 4183c002                       add        r8d, 2
02e8a 44894270                       mov        dword ptr [rdx + 0x70], r8d
02e8e 4181e0feff1f00                 and        r8d, 0x1ffffe
02e95 4585c0                         test       r8d, r8d
02e98 0f84c1220000                   je         0x7fbe283c0e5f
02e9e 48ba508a6e20be7f0000           movabs     rdx, 0x7fbe206e8a50
02ea8 488382d800000001               add        qword ptr [rdx + 0xd8], 1
02eb0 48bac88b6e20be7f0000           movabs     rdx, 0x7fbe206e8bc8
02eba 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02ebe 4183c002                       add        r8d, 2
02ec2 44894270                       mov        dword ptr [rdx + 0x70], r8d
02ec6 4181e0feff1f00                 and        r8d, 0x1ffffe
02ecd 4585c0                         test       r8d, r8d
02ed0 0f84aa220000                   je         0x7fbe283c0e80
02ed6 48ba98ac6e20be7f0000           movabs     rdx, 0x7fbe206eac98
02ee0 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
02ee8 48ba700770e200000000           movabs     rdx, 0xe2700770
02ef2 ba02000000                     mov        edx, 2
02ef7 4c8b842478020000               mov        r8, qword ptr [rsp + 0x278]
02eff bf00000000                     mov        edi, 0
02f04 488b9c2460030000               mov        rbx, qword ptr [rsp + 0x360]
02f0c 48891c24                       mov        qword ptr [rsp], rbx
02f10 488b9c2478020000               mov        rbx, qword ptr [rsp + 0x278]
02f18 48895c2408                     mov        qword ptr [rsp + 8], rbx
02f1d 4889442410                     mov        qword ptr [rsp + 0x10], rax
02f22 49ba700770e200000000           movabs     r10, 0xe2700770
02f2c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02f31 48899c2478020000               mov        qword ptr [rsp + 0x278], rbx
02f39 660f1f440000                   nop        word ptr [rax + rax]
02f3f e81ccc5307                     call       0x7fbe2f8fb860
02f44 0f1f84003c300011               nop        dword ptr [rax + rax + 0x1100303c]
02f4c 8b842428030000                 mov        eax, dword ptr [rsp + 0x328]
02f53 83c010                         add        eax, 0x10
02f56 8b9c2434030000                 mov        ebx, dword ptr [rsp + 0x334]
02f5d 83c310                         add        ebx, 0x10
02f60 3b842440030000                 cmp        eax, dword ptr [rsp + 0x340]
02f67 ba02000000                     mov        edx, 2
02f6c 7c05                           jl         0x7fbe283bec73
02f6e ba00000000                     mov        edx, 0
02f73 48b988b15220be7f0000           movabs     rcx, 0x7fbe2052b188
02f7d 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
02f81 4403c2                         add        r8d, edx
02f84 44894174                       mov        dword ptr [rcx + 0x74], r8d
02f88 85d2                           test       edx, edx
02f8a 7506                           jne        0x7fbe283bec92
02f8c 41b802000000                   mov        r8d, 2
02f92 4181e0fe3f0000                 and        r8d, 0x3ffe
02f99 4585c0                         test       r8d, r8d
02f9c 0f84ff210000                   je         0x7fbe283c0ea1
02fa2 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02fa6 418502                         test       dword ptr [r10], eax
02fa9 3b842440030000                 cmp        eax, dword ptr [rsp + 0x340]
02fb0 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
02fba b950070000                     mov        ecx, 0x750
02fbf 7d05                           jge        0x7fbe283becc6
02fc1 b940070000                     mov        ecx, 0x740
02fc6 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
02fca 4d8d4001                       lea        r8, [r8 + 1]
02fce 4c89040a                       mov        qword ptr [rdx + rcx], r8
02fd2 0f8d0c000000                   jge        0x7fbe283bece4
02fd8 89842428030000                 mov        dword ptr [rsp + 0x328], eax
02fdf e93cf5ffff                     jmp        0x7fbe283be220
02fe4 8b842440030000                 mov        eax, dword ptr [rsp + 0x340]
02feb 8bb42420030000                 mov        esi, dword ptr [rsp + 0x320]
02ff2 448b8c2444030000               mov        r9d, dword ptr [rsp + 0x344]
02ffa 448b9c2450030000               mov        r11d, dword ptr [rsp + 0x350]
03002 488b8c2458030000               mov        rcx, qword ptr [rsp + 0x358]
0300a 4c8b842448030000               mov        r8, qword ptr [rsp + 0x348]
03012 8bbc2424030000                 mov        edi, dword ptr [rsp + 0x324]
03019 4c8bb42438030000               mov        r14, qword ptr [rsp + 0x338]
03021 8b942464020000                 mov        edx, dword ptr [rsp + 0x264]
03028 49bd88b15220be7f0000           movabs     r13, 0x7fbe2052b188
03032 41ff8560070000                 inc        dword ptr [r13 + 0x760]
03039 498bdb                         mov        rbx, r11
0303c 4c8bd8                         mov        r11, rax
0303f 488bc7                         mov        rax, rdi
03042 498bfb                         mov        rdi, r11
03045 4c8bda                         mov        r11, rdx
03048 8b942470020000                 mov        edx, dword ptr [rsp + 0x270]
0304f 4c8bef                         mov        r13, rdi
03052 488bbc2478020000               mov        rdi, qword ptr [rsp + 0x278]
0305a 4489ac2468030000               mov        dword ptr [rsp + 0x368], r13d
03062 4c8bac2480020000               mov        r13, qword ptr [rsp + 0x280]
0306a 4c89ac2448020000               mov        qword ptr [rsp + 0x248], r13
03072 448bac2474020000               mov        r13d, dword ptr [rsp + 0x274]
0307a 4489ac243c020000               mov        dword ptr [rsp + 0x23c], r13d
03082 4c8bac2488020000               mov        r13, qword ptr [rsp + 0x288]
0308a 4c89ac2450020000               mov        qword ptr [rsp + 0x250], r13
03092 4c8bac2490020000               mov        r13, qword ptr [rsp + 0x290]
0309a 4c89ac2458020000               mov        qword ptr [rsp + 0x258], r13
030a2 448bac2498020000               mov        r13d, dword ptr [rsp + 0x298]
030aa 4489ac2460020000               mov        dword ptr [rsp + 0x260], r13d
030b2 4c8bac24a0020000               mov        r13, qword ptr [rsp + 0x2a0]
030ba 4c89ac2468020000               mov        qword ptr [rsp + 0x268], r13
030c2 4c8bef                         mov        r13, rdi
030c5 488bbc2418030000               mov        rdi, qword ptr [rsp + 0x318]
030cd 4c89ac2440020000               mov        qword ptr [rsp + 0x240], r13
030d5 4889bc2490030000               mov        qword ptr [rsp + 0x390], rdi
030dd 4d8beb                         mov        r13, r11
030e0 4c8b9c2468020000               mov        r11, qword ptr [rsp + 0x268]
030e8 e92d0f0000                     jmp        0x7fbe283bfd1a
030ed 4183fb08                       cmp        r11d, 8
030f1 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
030fb b978070000                     mov        ecx, 0x778
03100 7c05                           jl         0x7fbe283bee07
03102 b988070000                     mov        ecx, 0x788
03107 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0310b 4d8d4001                       lea        r8, [r8 + 1]
0310f 4c89040a                       mov        qword ptr [rdx + rcx], r8
03113 0f8ce3020000                   jl         0x7fbe283bf0fc
03119 448bac2428020000               mov        r13d, dword ptr [rsp + 0x228]
03121 4403ac24a4010000               add        r13d, dword ptr [rsp + 0x1a4]
03129 4489ac2474030000               mov        dword ptr [rsp + 0x374], r13d
03131 8bbc2428020000                 mov        edi, dword ptr [rsp + 0x228]
03138 89bc246c030000                 mov        dword ptr [rsp + 0x36c], edi
0313f 488b842480010000               mov        rax, qword ptr [rsp + 0x180]
03147 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
03151 4883829807000001               add        qword ptr [rdx + 0x798], 1
03159 48ba186a108b00000000           movabs     rdx, 0x8b106a18
03163 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03166 83c102                         add        ecx, 2
03169 894a70                         mov        dword ptr [rdx + 0x70], ecx
0316c 81e1feff1f00                   and        ecx, 0x1ffffe
03172 85c9                           test       ecx, ecx
03174 0f8448200000                   je         0x7fbe283c0ec2
0317a 660f1f440000                   nop        word ptr [rax + rax]
03180 e96d200000                     jmp        0x7fbe283c0ef2
03185 90                             nop        
03186 90                             nop        
03187 90                             nop        
03188 90                             nop        
03189 90                             nop        
0318a 48ba186a108b00000000           movabs     rdx, 0x8b106a18
03194 488d92d8000000                 lea        rdx, [rdx + 0xd8]
0319b 4885c0                         test       rax, rax
0319e 750c                           jne        0x7fbe283beeac
031a0 f6420801                       test       byte ptr [rdx + 8], 1
031a4 7506                           jne        0x7fbe283beeac
031a6 f048834a0801                   lock or    qword ptr [rdx + 8], 1
031ac 48be40c46be200000000           movabs     rsi, 0xe26bc440
031b6 488bd6                         mov        rdx, rsi
031b9 48b9186a108b00000000           movabs     rcx, 0x8b106a18
031c3 8b12                           mov        edx, dword ptr [rdx]
031c5 c1ea0d                         shr        edx, 0xd
031c8 48c1e20a                       shl        rdx, 0xa
031cc 41ba0000008b                   mov        r10d, 0x8b000000
031d2 4903d2                         add        rdx, r10
031d5 41ba16000000                   mov        r10d, 0x16
031db 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
031df 7436                           je         0x7fbe283bef17
031e1 4983c202                       add        r10, 2
031e5 4983fa1a                       cmp        r10, 0x1a
031e9 75f0                           jne        0x7fbe283beedb
031eb 41ba16000000                   mov        r10d, 0x16
031f1 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
031f6 7412                           je         0x7fbe283bef0a
031f8 4983c202                       add        r10, 2
031fc 4983fa1a                       cmp        r10, 0x1a
03200 75ef                           jne        0x7fbe283beef1
03202 41ba15000000                   mov        r10d, 0x15
03208 eb11                           jmp        0x7fbe283bef1b
0320a 50                             push       rax
0320b 4833c0                         xor        rax, rax
0320e f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03214 58                             pop        rax
03215 ebbe                           jmp        0x7fbe283beed5
03217 4983c201                       add        r10, 1
0321b 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03220 488bd0                         mov        rdx, rax
03223 488bcb                         mov        rcx, rbx
03226 899c2470030000                 mov        dword ptr [rsp + 0x370], ebx
0322d 4889842480010000               mov        qword ptr [rsp + 0x180], rax
03235 6690                           nop        
03237 e824bf5307                     call       0x7fbe2f8fae60
0323c 0f1f840034330013               nop        dword ptr [rax + rax + 0x13003334]
03244 48be88b15220be7f0000           movabs     rsi, 0x7fbe2052b188
0324e 488386a807000001               add        qword ptr [rsi + 0x7a8], 1
03256 488bb42480010000               mov        rsi, qword ptr [rsp + 0x180]
0325e 8b94246c030000                 mov        edx, dword ptr [rsp + 0x36c]
03265 488bc8                         mov        rcx, rax
03268 0f1f8000000000                 nop        dword ptr [rax]
0326f e8ecc85307                     call       0x7fbe2f8fb860
03274 0f1f84006c330014               nop        dword ptr [rax + rax + 0x1400336c]
0327c 8bbc246c030000                 mov        edi, dword ptr [rsp + 0x36c]
03283 83c708                         add        edi, 8
03286 8b9c2470030000                 mov        ebx, dword ptr [rsp + 0x370]
0328d 83c308                         add        ebx, 8
03290 3bbc2474030000                 cmp        edi, dword ptr [rsp + 0x374]
03297 be02000000                     mov        esi, 2
0329c 7c05                           jl         0x7fbe283befa3
0329e be00000000                     mov        esi, 0
032a3 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
032ad 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
032b0 03ce                           add        ecx, esi
032b2 894a74                         mov        dword ptr [rdx + 0x74], ecx
032b5 85f6                           test       esi, esi
032b7 7505                           jne        0x7fbe283befbe
032b9 b902000000                     mov        ecx, 2
032be 81e1fe3f0000                   and        ecx, 0x3ffe
032c4 85c9                           test       ecx, ecx
032c6 0f84301f0000                   je         0x7fbe283c0efc
032cc 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
032d0 418502                         test       dword ptr [r10], eax
032d3 3bbc2474030000                 cmp        edi, dword ptr [rsp + 0x374]
032da 48be88b15220be7f0000           movabs     rsi, 0x7fbe2052b188
032e4 bab8070000                     mov        edx, 0x7b8
032e9 7c05                           jl         0x7fbe283beff0
032eb bac8070000                     mov        edx, 0x7c8
032f0 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
032f4 488d4901                       lea        rcx, [rcx + 1]
032f8 48890c16                       mov        qword ptr [rsi + rdx], rcx
032fc 0f8c36feffff                   jl         0x7fbe283bee38
03302 448bac2474030000               mov        r13d, dword ptr [rsp + 0x374]
0330a 48be88b15220be7f0000           movabs     rsi, 0x7fbe2052b188
03314 ff86d8070000                   inc        dword ptr [rsi + 0x7d8]
0331a 8bb42470010000                 mov        esi, dword ptr [rsp + 0x170]
03321 448b8c2474010000               mov        r9d, dword ptr [rsp + 0x174]
03329 8b9c246c010000                 mov        ebx, dword ptr [rsp + 0x16c]
03330 488b8c2478010000               mov        rcx, qword ptr [rsp + 0x178]
03338 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
03340 8b8424a0010000                 mov        eax, dword ptr [rsp + 0x1a0]
03347 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
0334f 448b9c2488010000               mov        r11d, dword ptr [rsp + 0x188]
03357 8b94242c020000                 mov        edx, dword ptr [rsp + 0x22c]
0335e 498bfd                         mov        rdi, r13
03361 4c8bac2480010000               mov        r13, qword ptr [rsp + 0x180]
03369 4c89ac2440020000               mov        qword ptr [rsp + 0x240], r13
03371 4c8bac2450010000               mov        r13, qword ptr [rsp + 0x150]
03379 4c89ac2448020000               mov        qword ptr [rsp + 0x248], r13
03381 448bac2444010000               mov        r13d, dword ptr [rsp + 0x144]
03389 4489ac243c020000               mov        dword ptr [rsp + 0x23c], r13d
03391 4c8bac2458010000               mov        r13, qword ptr [rsp + 0x158]
03399 4c89ac2450020000               mov        qword ptr [rsp + 0x250], r13
033a1 4c8bac2460010000               mov        r13, qword ptr [rsp + 0x160]
033a9 4c89ac2458020000               mov        qword ptr [rsp + 0x258], r13
033b1 448bac2468010000               mov        r13d, dword ptr [rsp + 0x168]
033b9 4489ac2460020000               mov        dword ptr [rsp + 0x260], r13d
033c1 4c8bac2490010000               mov        r13, qword ptr [rsp + 0x190]
033c9 4c89ac2468020000               mov        qword ptr [rsp + 0x268], r13
033d1 4c8bef                         mov        r13, rdi
033d4 488bbc2498010000               mov        rdi, qword ptr [rsp + 0x198]
033dc 4489ac2468030000               mov        dword ptr [rsp + 0x368], r13d
033e4 4889bc2490030000               mov        qword ptr [rsp + 0x390], rdi
033ec 4d8beb                         mov        r13, r11
033ef 4c8b9c2468020000               mov        r11, qword ptr [rsp + 0x268]
033f7 e91e0c0000                     jmp        0x7fbe283bfd1a
033fc 48be88b15220be7f0000           movabs     rsi, 0x7fbe2052b188
03406 488386f007000001               add        qword ptr [rsi + 0x7f0], 1
0340e 488bb42480010000               mov        rsi, qword ptr [rsp + 0x180]
03416 8b942428020000                 mov        edx, dword ptr [rsp + 0x228]
0341d 488bcb                         mov        rcx, rbx
03420 4d8bc3                         mov        r8, r11
03423 448b8c24a4010000               mov        r9d, dword ptr [rsp + 0x1a4]
0342b 0f1f4000                       nop        dword ptr [rax]
0342f e82cc75307                     call       0x7fbe2f8fb860
03434 0f1f84002c350016               nop        dword ptr [rax + rax + 0x1600352c]
0343c 488bf8                         mov        rdi, rax
0343f 8bb42470010000                 mov        esi, dword ptr [rsp + 0x170]
03446 448b8c2474010000               mov        r9d, dword ptr [rsp + 0x174]
0344e 8b9c246c010000                 mov        ebx, dword ptr [rsp + 0x16c]
03455 488b8c2478010000               mov        rcx, qword ptr [rsp + 0x178]
0345d 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
03465 8b8424a0010000                 mov        eax, dword ptr [rsp + 0x1a0]
0346c 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
03474 448b9c2488010000               mov        r11d, dword ptr [rsp + 0x188]
0347c 8b94242c020000                 mov        edx, dword ptr [rsp + 0x22c]
03483 4c8bef                         mov        r13, rdi
03486 488bbc2480010000               mov        rdi, qword ptr [rsp + 0x180]
0348e 4489ac2468030000               mov        dword ptr [rsp + 0x368], r13d
03496 4c8bac2450010000               mov        r13, qword ptr [rsp + 0x150]
0349e 4c89ac2448020000               mov        qword ptr [rsp + 0x248], r13
034a6 448bac2444010000               mov        r13d, dword ptr [rsp + 0x144]
034ae 4489ac243c020000               mov        dword ptr [rsp + 0x23c], r13d
034b6 4c8bac2458010000               mov        r13, qword ptr [rsp + 0x158]
034be 4c89ac2450020000               mov        qword ptr [rsp + 0x250], r13
034c6 4c8bac2460010000               mov        r13, qword ptr [rsp + 0x160]
034ce 4c89ac2458020000               mov        qword ptr [rsp + 0x258], r13
034d6 448bac2468010000               mov        r13d, dword ptr [rsp + 0x168]
034de 4489ac2460020000               mov        dword ptr [rsp + 0x260], r13d
034e6 4c8bac2490010000               mov        r13, qword ptr [rsp + 0x190]
034ee 4c89ac2468020000               mov        qword ptr [rsp + 0x268], r13
034f6 4c8bef                         mov        r13, rdi
034f9 488bbc2498010000               mov        rdi, qword ptr [rsp + 0x198]
03501 4c89ac2440020000               mov        qword ptr [rsp + 0x240], r13
03509 4889bc2490030000               mov        qword ptr [rsp + 0x390], rdi
03511 4d8beb                         mov        r13, r11
03514 4c8b9c2468020000               mov        r11, qword ptr [rsp + 0x268]
0351c e9f90a0000                     jmp        0x7fbe283bfd1a
03521 89b4242c020000                 mov        dword ptr [rsp + 0x22c], esi
03528 4489ac2428020000               mov        dword ptr [rsp + 0x228], r13d
03530 488b842480010000               mov        rax, qword ptr [rsp + 0x180]
03538 48be88b15220be7f0000           movabs     rsi, 0x7fbe2052b188
03542 488386c805000001               add        qword ptr [rsi + 0x5c8], 1
0354a 48bed89f6e20be7f0000           movabs     rsi, 0x7fbe206e9fd8
03554 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03557 83c202                         add        edx, 2
0355a 895670                         mov        dword ptr [rsi + 0x70], edx
0355d 81e2feff1f00                   and        edx, 0x1ffffe
03563 85d2                           test       edx, edx
03565 0f84b21c0000                   je         0x7fbe283c0f1d
0356b 48bec0906ee200000000           movabs     rsi, 0xe26e90c0
03575 48bad89f6e20be7f0000           movabs     rdx, 0x7fbe206e9fd8
0357f 8b36                           mov        esi, dword ptr [rsi]
03581 c1ee0d                         shr        esi, 0xd
03584 48c1e60a                       shl        rsi, 0xa
03588 41ba0000008b                   mov        r10d, 0x8b000000
0358e 4903f2                         add        rsi, r10
03591 41ba16000000                   mov        r10d, 0x16
03597 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
0359b 7436                           je         0x7fbe283bf2d3
0359d 4983c202                       add        r10, 2
035a1 4983fa1a                       cmp        r10, 0x1a
035a5 75f0                           jne        0x7fbe283bf297
035a7 41ba16000000                   mov        r10d, 0x16
035ad 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
035b2 7412                           je         0x7fbe283bf2c6
035b4 4983c202                       add        r10, 2
035b8 4983fa1a                       cmp        r10, 0x1a
035bc 75ef                           jne        0x7fbe283bf2ad
035be 41ba15000000                   mov        r10d, 0x15
035c4 eb11                           jmp        0x7fbe283bf2d7
035c6 50                             push       rax
035c7 4833c0                         xor        rax, rax
035ca f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
035d0 58                             pop        rax
035d1 ebbe                           jmp        0x7fbe283bf291
035d3 4983c201                       add        r10, 1
035d7 4a8304d201                     add        qword ptr [rdx + r10*8], 1
035dc 448b5804                       mov        r11d, dword ptr [rax + 4]
035e0 48bed89f6e20be7f0000           movabs     rsi, 0x7fbe206e9fd8
035ea 488386d800000001               add        qword ptr [rsi + 0xd8], 1
035f2 48be30966e20be7f0000           movabs     rsi, 0x7fbe206e9630
035fc 8b5670                         mov        edx, dword ptr [rsi + 0x70]
035ff 83c202                         add        edx, 2
03602 895670                         mov        dword ptr [rsi + 0x70], edx
03605 81e2feff1f00                   and        edx, 0x1ffffe
0360b 85d2                           test       edx, edx
0360d 0f84301c0000                   je         0x7fbe283c0f43
03613 48be30966e20be7f0000           movabs     rsi, 0x7fbe206e9630
0361d 4883860801000001               add        qword ptr [rsi + 0x108], 1
03625 498bf3                         mov        rsi, r11
03628 83ee0f                         sub        esi, 0xf
0362b 48ba008d6e20be7f0000           movabs     rdx, 0x7fbe206e8d00
03635 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03638 83c102                         add        ecx, 2
0363b 894a70                         mov        dword ptr [rdx + 0x70], ecx
0363e 81e1feff1f00                   and        ecx, 0x1ffffe
03644 85c9                           test       ecx, ecx
03646 0f84181c0000                   je         0x7fbe283c0f64
0364c 48ba008d6e20be7f0000           movabs     rdx, 0x7fbe206e8d00
03656 488382a800000001               add        qword ptr [rdx + 0xa8], 1
0365e 48ba0000000000000000           movabs     rdx, 0
03668 ba00000000                     mov        edx, 0
0366d 3bda                           cmp        ebx, edx
0366f 0f8c101c0000                   jl         0x7fbe283c0f85
03675 3bde                           cmp        ebx, esi
03677 0f8d151c0000                   jge        0x7fbe283c0f92
0367d 48bec0906ee200000000           movabs     rsi, 0xe26e90c0
03687 488bd6                         mov        rdx, rsi
0368a 48b9d89f6e20be7f0000           movabs     rcx, 0x7fbe206e9fd8
03694 8b12                           mov        edx, dword ptr [rdx]
03696 c1ea0d                         shr        edx, 0xd
03699 48c1e20a                       shl        rdx, 0xa
0369d 41ba0000008b                   mov        r10d, 0x8b000000
036a3 4903d2                         add        rdx, r10
036a6 41ba24000000                   mov        r10d, 0x24
036ac 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
036b0 7436                           je         0x7fbe283bf3e8
036b2 4983c202                       add        r10, 2
036b6 4983fa28                       cmp        r10, 0x28
036ba 75f0                           jne        0x7fbe283bf3ac
036bc 41ba24000000                   mov        r10d, 0x24
036c2 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
036c7 7412                           je         0x7fbe283bf3db
036c9 4983c202                       add        r10, 2
036cd 4983fa28                       cmp        r10, 0x28
036d1 75ef                           jne        0x7fbe283bf3c2
036d3 41ba23000000                   mov        r10d, 0x23
036d9 eb11                           jmp        0x7fbe283bf3ec
036db 50                             push       rax
036dc 4833c0                         xor        rax, rax
036df f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
036e5 58                             pop        rax
036e6 ebbe                           jmp        0x7fbe283bf3a6
036e8 4983c201                       add        r10, 1
036ec 4a8304d101                     add        qword ptr [rcx + r10*8], 1
036f1 48ba008e6e20be7f0000           movabs     rdx, 0x7fbe206e8e00
036fb 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
036fe 83c102                         add        ecx, 2
03701 894a70                         mov        dword ptr [rdx + 0x70], ecx
03704 81e1feff1f00                   and        ecx, 0x1ffffe
0370a 85c9                           test       ecx, ecx
0370c 0f848d1b0000                   je         0x7fbe283c0f9f
03712 48ba008e6e20be7f0000           movabs     rdx, 0x7fbe206e8e00
0371c 488382a800000001               add        qword ptr [rdx + 0xa8], 1
03724 48be288f6e20be7f0000           movabs     rsi, 0x7fbe206e8f28
0372e 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03731 83c202                         add        edx, 2
03734 895670                         mov        dword ptr [rsi + 0x70], edx
03737 81e2feff1f00                   and        edx, 0x1ffffe
0373d 85d2                           test       edx, edx
0373f 0f847b1b0000                   je         0x7fbe283c0fc0
03745 48be288f6e20be7f0000           movabs     rsi, 0x7fbe206e8f28
0374f ff86b8000000                   inc        dword ptr [rsi + 0xb8]
03755 44899c2478030000               mov        dword ptr [rsp + 0x378], r11d
0375d 48beb8106fe200000000           movabs     rsi, 0xe26f10b8
03767 488bd6                         mov        rdx, rsi
0376a 48b9d89f6e20be7f0000           movabs     rcx, 0x7fbe206e9fd8
03774 4883815801000001               add        qword ptr [rcx + 0x158], 1
0377c 48baa0a16e20be7f0000           movabs     rdx, 0x7fbe206ea1a0
03786 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03789 83c102                         add        ecx, 2
0378c 894a70                         mov        dword ptr [rdx + 0x70], ecx
0378f 81e1feff1f00                   and        ecx, 0x1ffffe
03795 85c9                           test       ecx, ecx
03797 0f84441b0000                   je         0x7fbe283c0fe1
0379d 488bd6                         mov        rdx, rsi
037a0 48b9a0a16e20be7f0000           movabs     rcx, 0x7fbe206ea1a0
037aa 488381a800000001               add        qword ptr [rcx + 0xa8], 1
037b2 48ba80a26e20be7f0000           movabs     rdx, 0x7fbe206ea280
037bc 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
037bf 83c102                         add        ecx, 2
037c2 894a70                         mov        dword ptr [rdx + 0x70], ecx
037c5 81e1feff1f00                   and        ecx, 0x1ffffe
037cb 85c9                           test       ecx, ecx
037cd 0f842f1b0000                   je         0x7fbe283c1002
037d3 48ba80a26e20be7f0000           movabs     rdx, 0x7fbe206ea280
037dd 488382b800000001               add        qword ptr [rdx + 0xb8], 1
037e5 48bea8976e20be7f0000           movabs     rsi, 0x7fbe206e97a8
037ef 8b5670                         mov        edx, dword ptr [rsi + 0x70]
037f2 83c202                         add        edx, 2
037f5 895670                         mov        dword ptr [rsi + 0x70], edx
037f8 81e2feff1f00                   and        edx, 0x1ffffe
037fe 85d2                           test       edx, edx
03800 0f841d1b0000                   je         0x7fbe283c1023
03806 48bec0906ee200000000           movabs     rsi, 0xe26e90c0
03810 488bd6                         mov        rdx, rsi
03813 48b980a26e20be7f0000           movabs     rcx, 0x7fbe206ea280
0381d 8b12                           mov        edx, dword ptr [rdx]
0381f c1ea0d                         shr        edx, 0xd
03822 48c1e20a                       shl        rdx, 0xa
03826 41ba0000008b                   mov        r10d, 0x8b000000
0382c 4903d2                         add        rdx, r10
0382f 41ba1c000000                   mov        r10d, 0x1c
03835 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03839 7436                           je         0x7fbe283bf571
0383b 4983c202                       add        r10, 2
0383f 4983fa20                       cmp        r10, 0x20
03843 75f0                           jne        0x7fbe283bf535
03845 41ba1c000000                   mov        r10d, 0x1c
0384b 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03850 7412                           je         0x7fbe283bf564
03852 4983c202                       add        r10, 2
03856 4983fa20                       cmp        r10, 0x20
0385a 75ef                           jne        0x7fbe283bf54b
0385c 41ba1b000000                   mov        r10d, 0x1b
03862 eb11                           jmp        0x7fbe283bf575
03864 50                             push       rax
03865 4833c0                         xor        rax, rax
03868 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
0386e 58                             pop        rax
0386f ebbe                           jmp        0x7fbe283bf52f
03871 4983c201                       add        r10, 1
03875 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0387a 48ba80a26e20be7f0000           movabs     rdx, 0x7fbe206ea280
03884 8b36                           mov        esi, dword ptr [rsi]
03886 c1ee0d                         shr        esi, 0xd
03889 48c1e60a                       shl        rsi, 0xa
0388d 41ba0000008b                   mov        r10d, 0x8b000000
03893 4903f2                         add        rsi, r10
03896 41ba22000000                   mov        r10d, 0x22
0389c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
038a0 7436                           je         0x7fbe283bf5d8
038a2 4983c202                       add        r10, 2
038a6 4983fa26                       cmp        r10, 0x26
038aa 75f0                           jne        0x7fbe283bf59c
038ac 41ba22000000                   mov        r10d, 0x22
038b2 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
038b7 7412                           je         0x7fbe283bf5cb
038b9 4983c202                       add        r10, 2
038bd 4983fa26                       cmp        r10, 0x26
038c1 75ef                           jne        0x7fbe283bf5b2
038c3 41ba21000000                   mov        r10d, 0x21
038c9 eb11                           jmp        0x7fbe283bf5dc
038cb 50                             push       rax
038cc 4833c0                         xor        rax, rax
038cf f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
038d5 58                             pop        rax
038d6 ebbe                           jmp        0x7fbe283bf596
038d8 4983c201                       add        r10, 1
038dc 4a8304d201                     add        qword ptr [rdx + r10*8], 1
038e1 48be80a26e20be7f0000           movabs     rsi, 0x7fbe206ea280
038eb 4883863801000001               add        qword ptr [rsi + 0x138], 1
038f3 48be68986e20be7f0000           movabs     rsi, 0x7fbe206e9868
038fd 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03900 83c202                         add        edx, 2
03903 895670                         mov        dword ptr [rsi + 0x70], edx
03906 81e2feff1f00                   and        edx, 0x1ffffe
0390c 85d2                           test       edx, edx
0390e 0f84301a0000                   je         0x7fbe283c1044
03914 48be80a26e20be7f0000           movabs     rsi, 0x7fbe206ea280
0391e 4883864801000001               add        qword ptr [rsi + 0x148], 1
03926 4863db                         movsxd     rbx, ebx
03929 be08000000                     mov        esi, 8
0392e 4c8bcb                         mov        r9, rbx
03931 4c03ce                         add        r9, rsi
03934 48be508a6e20be7f0000           movabs     rsi, 0x7fbe206e8a50
0393e 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03941 83c202                         add        edx, 2
03944 895670                         mov        dword ptr [rsi + 0x70], edx
03947 81e2feff1f00                   and        edx, 0x1ffffe
0394d 85d2                           test       edx, edx
0394f 0f84101a0000                   je         0x7fbe283c1065
03955 48be508a6e20be7f0000           movabs     rsi, 0x7fbe206e8a50
0395f 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03967 48bec88b6e20be7f0000           movabs     rsi, 0x7fbe206e8bc8
03971 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03974 83c202                         add        edx, 2
03977 895670                         mov        dword ptr [rsi + 0x70], edx
0397a 81e2feff1f00                   and        edx, 0x1ffffe
03980 85d2                           test       edx, edx
03982 0f84fe190000                   je         0x7fbe283c1086
03988 48be80a26e20be7f0000           movabs     rsi, 0x7fbe206ea280
03992 4883866801000001               add        qword ptr [rsi + 0x168], 1
0399a 48be88696fe200000000           movabs     rsi, 0xe26f6988
039a4 48be08916ee200000000           movabs     rsi, 0xe26e9108
039ae ba02000000                     mov        edx, 2
039b3 b910000000                     mov        ecx, 0x10
039b8 4c8bc0                         mov        r8, rax
039bb bf00000000                     mov        edi, 0
039c0 48890424                       mov        qword ptr [rsp], rax
039c4 48895c2408                     mov        qword ptr [rsp + 8], rbx
039c9 49bac0906ee200000000           movabs     r10, 0xe26e90c0
039d3 4c89542410                     mov        qword ptr [rsp + 0x10], r10
039d8 49ba88696fe200000000           movabs     r10, 0xe26f6988
039e2 4c89542418                     mov        qword ptr [rsp + 0x18], r10
039e7 4889842480010000               mov        qword ptr [rsp + 0x180], rax
039ef e86cc15307                     call       0x7fbe2f8fb860
039f4 0f1f8400ec3a0017               nop        dword ptr [rax + rax + 0x17003aec]
039fc 4885c0                         test       rax, rax
039ff 48bb80a26e20be7f0000           movabs     rbx, 0x7fbe206ea280
03a09 750c                           jne        0x7fbe283bf717
03a0b 808b7101000001                 or         byte ptr [rbx + 0x171], 1
03a12 e988000000                     jmp        0x7fbe283bf79f
03a17 8b38                           mov        edi, dword ptr [rax]
03a19 c1ef0d                         shr        edi, 0xd
03a1c 48c1e70a                       shl        rdi, 0xa
03a20 41ba0000008b                   mov        r10d, 0x8b000000
03a26 4903fa                         add        rdi, r10
03a29 41ba30000000                   mov        r10d, 0x30
03a2f 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
03a33 7436                           je         0x7fbe283bf76b
03a35 4983c202                       add        r10, 2
03a39 4983fa34                       cmp        r10, 0x34
03a3d 75f0                           jne        0x7fbe283bf72f
03a3f 41ba30000000                   mov        r10d, 0x30
03a45 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03a4a 7412                           je         0x7fbe283bf75e
03a4c 4983c202                       add        r10, 2
03a50 4983fa34                       cmp        r10, 0x34
03a54 75ef                           jne        0x7fbe283bf745
03a56 41ba2f000000                   mov        r10d, 0x2f
03a5c eb11                           jmp        0x7fbe283bf76f
03a5e 50                             push       rax
03a5f 4833c0                         xor        rax, rax
03a62 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
03a68 58                             pop        rax
03a69 ebbe                           jmp        0x7fbe283bf729
03a6b 4983c201                       add        r10, 1
03a6f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03a74 48bf00b0148b00000000           movabs     rdi, 0x8b14b000
03a7e 8b18                           mov        ebx, dword ptr [rax]
03a80 c1eb0d                         shr        ebx, 0xd
03a83 48c1e30a                       shl        rbx, 0xa
03a87 41ba0000008b                   mov        r10d, 0x8b000000
03a8d 4903da                         add        rbx, r10
03a90 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
03a94 0f850d190000                   jne        0x7fbe283c10a7
03a9a e900000000                     jmp        0x7fbe283bf79f
03a9f 488bf8                         mov        rdi, rax
03aa2 4889bc2480030000               mov        qword ptr [rsp + 0x380], rdi
03aaa 483b07                         cmp        rax, qword ptr [rdi]
03aad 488bf7                         mov        rsi, rdi
03ab0 48bb88b15220be7f0000           movabs     rbx, 0x7fbe2052b188
03aba 8b36                           mov        esi, dword ptr [rsi]
03abc c1ee0d                         shr        esi, 0xd
03abf 48c1e60a                       shl        rsi, 0xa
03ac3 41ba0000008b                   mov        r10d, 0x8b000000
03ac9 4903f2                         add        rsi, r10
03acc 41babc000000                   mov        r10d, 0xbc
03ad2 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03ad6 743c                           je         0x7fbe283bf814
03ad8 4983c202                       add        r10, 2
03adc 4981fac0000000                 cmp        r10, 0xc0
03ae3 75ed                           jne        0x7fbe283bf7d2
03ae5 41babc000000                   mov        r10d, 0xbc
03aeb 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03af0 7415                           je         0x7fbe283bf807
03af2 4983c202                       add        r10, 2
03af6 4981fac0000000                 cmp        r10, 0xc0
03afd 75ec                           jne        0x7fbe283bf7eb
03aff 41babb000000                   mov        r10d, 0xbb
03b05 eb11                           jmp        0x7fbe283bf818
03b07 50                             push       rax
03b08 4833c0                         xor        rax, rax
03b0b f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
03b11 58                             pop        rax
03b12 ebb8                           jmp        0x7fbe283bf7cc
03b14 4983c201                       add        r10, 1
03b18 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03b1d 48be98ac6e20be7f0000           movabs     rsi, 0x7fbe206eac98
03b27 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
03b2a 83c302                         add        ebx, 2
03b2d 895e70                         mov        dword ptr [rsi + 0x70], ebx
03b30 81e3feff1f00                   and        ebx, 0x1ffffe
03b36 85db                           test       ebx, ebx
03b38 0f8477180000                   je         0x7fbe283c10b5
03b3e 488bf7                         mov        rsi, rdi
03b41 48bb98ac6e20be7f0000           movabs     rbx, 0x7fbe206eac98
03b4b 8b36                           mov        esi, dword ptr [rsi]
03b4d c1ee0d                         shr        esi, 0xd
03b50 48c1e60a                       shl        rsi, 0xa
03b54 41ba0000008b                   mov        r10d, 0x8b000000
03b5a 4903f2                         add        rsi, r10
03b5d 41ba16000000                   mov        r10d, 0x16
03b63 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03b67 7436                           je         0x7fbe283bf89f
03b69 4983c202                       add        r10, 2
03b6d 4983fa1a                       cmp        r10, 0x1a
03b71 75f0                           jne        0x7fbe283bf863
03b73 41ba16000000                   mov        r10d, 0x16
03b79 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03b7e 7412                           je         0x7fbe283bf892
03b80 4983c202                       add        r10, 2
03b84 4983fa1a                       cmp        r10, 0x1a
03b88 75ef                           jne        0x7fbe283bf879
03b8a 41ba15000000                   mov        r10d, 0x15
03b90 eb11                           jmp        0x7fbe283bf8a3
03b92 50                             push       rax
03b93 4833c0                         xor        rax, rax
03b96 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
03b9c 58                             pop        rax
03b9d ebbe                           jmp        0x7fbe283bf85d
03b9f 4983c201                       add        r10, 1
03ba3 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03ba8 488bf7                         mov        rsi, rdi
03bab 6690                           nop        
03bad 48b840a22004be7f0000           movabs     rax, 0x7fbe0420a240
03bb7 e8a4ba5307                     call       0x7fbe2f8fb360
03bbc 0f1f8400b43c0018               nop        dword ptr [rax + rax + 0x18003cb4]
03bc4 48be98ac6e20be7f0000           movabs     rsi, 0x7fbe206eac98
03bce 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03bd6 48be30966e20be7f0000           movabs     rsi, 0x7fbe206e9630
03be0 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
03be3 83c702                         add        edi, 2
03be6 897e70                         mov        dword ptr [rsi + 0x70], edi
03be9 81e7feff1f00                   and        edi, 0x1ffffe
03bef 85ff                           test       edi, edi
03bf1 0f84df170000                   je         0x7fbe283c10d6
03bf7 448b9c2478030000               mov        r11d, dword ptr [rsp + 0x378]
03bff 448bac2428020000               mov        r13d, dword ptr [rsp + 0x228]
03c07 48be30966e20be7f0000           movabs     rsi, 0x7fbe206e9630
03c11 4883860801000001               add        qword ptr [rsi + 0x108], 1
03c19 ffc8                           dec        eax
03c1b 442bd8                         sub        r11d, eax
03c1e 48be008d6e20be7f0000           movabs     rsi, 0x7fbe206e8d00
03c28 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
03c2b 83c702                         add        edi, 2
03c2e 897e70                         mov        dword ptr [rsi + 0x70], edi
03c31 81e7feff1f00                   and        edi, 0x1ffffe
03c37 85ff                           test       edi, edi
03c39 0f84b8170000                   je         0x7fbe283c10f7
03c3f 48be008d6e20be7f0000           movabs     rsi, 0x7fbe206e8d00
03c49 488386a800000001               add        qword ptr [rsi + 0xa8], 1
03c51 48be0000000000000000           movabs     rsi, 0
03c5b be00000000                     mov        esi, 0
03c60 443bee                         cmp        r13d, esi
03c63 0f8caf170000                   jl         0x7fbe283c1118
03c69 453beb                         cmp        r13d, r11d
03c6c 0f8db3170000                   jge        0x7fbe283c1125
03c72 498bfd                         mov        rdi, r13
03c75 89bc247c030000                 mov        dword ptr [rsp + 0x37c], edi
03c7c 488bbc2480030000               mov        rdi, qword ptr [rsp + 0x380]
03c84 4489ac2428020000               mov        dword ptr [rsp + 0x228], r13d
03c8c 488bf7                         mov        rsi, rdi
03c8f 48ba98ac6e20be7f0000           movabs     rdx, 0x7fbe206eac98
03c99 8b36                           mov        esi, dword ptr [rsi]
03c9b c1ee0d                         shr        esi, 0xd
03c9e 48c1e60a                       shl        rsi, 0xa
03ca2 41ba0000008b                   mov        r10d, 0x8b000000
03ca8 4903f2                         add        rsi, r10
03cab 41ba1e000000                   mov        r10d, 0x1e
03cb1 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03cb5 7436                           je         0x7fbe283bf9ed
03cb7 4983c202                       add        r10, 2
03cbb 4983fa22                       cmp        r10, 0x22
03cbf 75f0                           jne        0x7fbe283bf9b1
03cc1 41ba1e000000                   mov        r10d, 0x1e
03cc7 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03ccc 7412                           je         0x7fbe283bf9e0
03cce 4983c202                       add        r10, 2
03cd2 4983fa22                       cmp        r10, 0x22
03cd6 75ef                           jne        0x7fbe283bf9c7
03cd8 41ba1d000000                   mov        r10d, 0x1d
03cde eb11                           jmp        0x7fbe283bf9f1
03ce0 50                             push       rax
03ce1 4833c0                         xor        rax, rax
03ce4 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03cea 58                             pop        rax
03ceb ebbe                           jmp        0x7fbe283bf9ab
03ced 4983c201                       add        r10, 1
03cf1 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03cf6 488bf7                         mov        rsi, rdi
03cf9 0f1f4000                       nop        dword ptr [rax]
03cfd 48b868a22004be7f0000           movabs     rax, 0x7fbe0420a268
03d07 e854b95307                     call       0x7fbe2f8fb360
03d0c 0f1f8400043e0019               nop        dword ptr [rax + rax + 0x19003e04]
03d14 483b00                         cmp        rax, qword ptr [rax]
03d17 488bf0                         mov        rsi, rax
03d1a 48ba98ac6e20be7f0000           movabs     rdx, 0x7fbe206eac98
03d24 8b36                           mov        esi, dword ptr [rsi]
03d26 c1ee0d                         shr        esi, 0xd
03d29 48c1e60a                       shl        rsi, 0xa
03d2d 41ba0000008b                   mov        r10d, 0x8b000000
03d33 4903f2                         add        rsi, r10
03d36 41ba24000000                   mov        r10d, 0x24
03d3c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03d40 7436                           je         0x7fbe283bfa78
03d42 4983c202                       add        r10, 2
03d46 4983fa28                       cmp        r10, 0x28
03d4a 75f0                           jne        0x7fbe283bfa3c
03d4c 41ba24000000                   mov        r10d, 0x24
03d52 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03d57 7412                           je         0x7fbe283bfa6b
03d59 4983c202                       add        r10, 2
03d5d 4983fa28                       cmp        r10, 0x28
03d61 75ef                           jne        0x7fbe283bfa52
03d63 41ba23000000                   mov        r10d, 0x23
03d69 eb11                           jmp        0x7fbe283bfa7c
03d6b 50                             push       rax
03d6c 4833c0                         xor        rax, rax
03d6f f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03d75 58                             pop        rax
03d76 ebbe                           jmp        0x7fbe283bfa36
03d78 4983c201                       add        r10, 1
03d7c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03d81 8b7024                         mov        esi, dword ptr [rax + 0x24]
03d84 488bd0                         mov        rdx, rax
03d87 48b998ac6e20be7f0000           movabs     rcx, 0x7fbe206eac98
03d91 8b12                           mov        edx, dword ptr [rdx]
03d93 c1ea0d                         shr        edx, 0xd
03d96 48c1e20a                       shl        rdx, 0xa
03d9a 41ba0000008b                   mov        r10d, 0x8b000000
03da0 4903d2                         add        rdx, r10
03da3 41ba2a000000                   mov        r10d, 0x2a
03da9 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03dad 7436                           je         0x7fbe283bfae5
03daf 4983c202                       add        r10, 2
03db3 4983fa2e                       cmp        r10, 0x2e
03db7 75f0                           jne        0x7fbe283bfaa9
03db9 41ba2a000000                   mov        r10d, 0x2a
03dbf 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03dc4 7412                           je         0x7fbe283bfad8
03dc6 4983c202                       add        r10, 2
03dca 4983fa2e                       cmp        r10, 0x2e
03dce 75ef                           jne        0x7fbe283bfabf
03dd0 41ba29000000                   mov        r10d, 0x29
03dd6 eb11                           jmp        0x7fbe283bfae9
03dd8 50                             push       rax
03dd9 4833c0                         xor        rax, rax
03ddc f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03de2 58                             pop        rax
03de3 ebbe                           jmp        0x7fbe283bfaa3
03de5 4983c201                       add        r10, 1
03de9 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03dee 8b4804                         mov        ecx, dword ptr [rax + 4]
03df1 48ba98ac6e20be7f0000           movabs     rdx, 0x7fbe206eac98
03dfb 4883827801000001               add        qword ptr [rdx + 0x178], 1
03e03 48ba68986e20be7f0000           movabs     rdx, 0x7fbe206e9868
03e0d 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03e11 4183c002                       add        r8d, 2
03e15 44894270                       mov        dword ptr [rdx + 0x70], r8d
03e19 4181e0feff1f00                 and        r8d, 0x1ffffe
03e20 4585c0                         test       r8d, r8d
03e23 0f840e160000                   je         0x7fbe283c1137
03e29 48ba98ac6e20be7f0000           movabs     rdx, 0x7fbe206eac98
03e33 4883828801000001               add        qword ptr [rdx + 0x188], 1
03e3b 8bbc247c030000                 mov        edi, dword ptr [rsp + 0x37c]
03e42 4863df                         movsxd     rbx, edi
03e45 ba08000000                     mov        edx, 8
03e4a 4c8bcb                         mov        r9, rbx
03e4d 4c03ca                         add        r9, rdx
03e50 48ba508a6e20be7f0000           movabs     rdx, 0x7fbe206e8a50
03e5a 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03e5e 4183c002                       add        r8d, 2
03e62 44894270                       mov        dword ptr [rdx + 0x70], r8d
03e66 4181e0feff1f00                 and        r8d, 0x1ffffe
03e6d 4585c0                         test       r8d, r8d
03e70 0f84e2150000                   je         0x7fbe283c1158
03e76 48ba508a6e20be7f0000           movabs     rdx, 0x7fbe206e8a50
03e80 488382d800000001               add        qword ptr [rdx + 0xd8], 1
03e88 48bac88b6e20be7f0000           movabs     rdx, 0x7fbe206e8bc8
03e92 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03e96 4183c002                       add        r8d, 2
03e9a 44894270                       mov        dword ptr [rdx + 0x70], r8d
03e9e 4181e0feff1f00                 and        r8d, 0x1ffffe
03ea5 4585c0                         test       r8d, r8d
03ea8 0f84cb150000                   je         0x7fbe283c1179
03eae 48ba98ac6e20be7f0000           movabs     rdx, 0x7fbe206eac98
03eb8 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
03ec0 48ba700770e200000000           movabs     rdx, 0xe2700770
03eca ba02000000                     mov        edx, 2
03ecf 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
03ed7 bf00000000                     mov        edi, 0
03edc 488b842480030000               mov        rax, qword ptr [rsp + 0x380]
03ee4 48890424                       mov        qword ptr [rsp], rax
03ee8 488b842480010000               mov        rax, qword ptr [rsp + 0x180]
03ef0 4889442408                     mov        qword ptr [rsp + 8], rax
03ef5 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
03efa 49ba700770e200000000           movabs     r10, 0xe2700770
03f04 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03f09 4889842480010000               mov        qword ptr [rsp + 0x180], rax
03f11 660f1f440000                   nop        word ptr [rax + rax]
03f17 e844bc5307                     call       0x7fbe2f8fb860
03f1c 0f1f84001440001a               nop        dword ptr [rax + rax + 0x1a004014]
03f24 8b94242c020000                 mov        edx, dword ptr [rsp + 0x22c]
03f2b 448bac2428020000               mov        r13d, dword ptr [rsp + 0x228]
03f33 8bbc24a4010000                 mov        edi, dword ptr [rsp + 0x1a4]
03f3a 4403ef                         add        r13d, edi
03f3d 48be88b15220be7f0000           movabs     rsi, 0x7fbe2052b188
03f47 ff8608060000                   inc        dword ptr [rsi + 0x608]
03f4d 8bb42470010000                 mov        esi, dword ptr [rsp + 0x170]
03f54 448b8c2474010000               mov        r9d, dword ptr [rsp + 0x174]
03f5c 8b9c246c010000                 mov        ebx, dword ptr [rsp + 0x16c]
03f63 488b8c2478010000               mov        rcx, qword ptr [rsp + 0x178]
03f6b 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
03f73 8b8424a0010000                 mov        eax, dword ptr [rsp + 0x1a0]
03f7a 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
03f82 448b9c2488010000               mov        r11d, dword ptr [rsp + 0x188]
03f8a 4489ac2468030000               mov        dword ptr [rsp + 0x368], r13d
03f92 4c8bac2480010000               mov        r13, qword ptr [rsp + 0x180]
03f9a 44899c2488030000               mov        dword ptr [rsp + 0x388], r11d
03fa2 4c8b9c2450010000               mov        r11, qword ptr [rsp + 0x150]
03faa 4c899c2448020000               mov        qword ptr [rsp + 0x248], r11
03fb2 448b9c2444010000               mov        r11d, dword ptr [rsp + 0x144]
03fba 44899c243c020000               mov        dword ptr [rsp + 0x23c], r11d
03fc2 4c8b9c2458010000               mov        r11, qword ptr [rsp + 0x158]
03fca 4c899c2450020000               mov        qword ptr [rsp + 0x250], r11
03fd2 4c8b9c2460010000               mov        r11, qword ptr [rsp + 0x160]
03fda 4c899c2458020000               mov        qword ptr [rsp + 0x258], r11
03fe2 448b9c2468010000               mov        r11d, dword ptr [rsp + 0x168]
03fea 44899c2460020000               mov        dword ptr [rsp + 0x260], r11d
03ff2 4c8b9c2490010000               mov        r11, qword ptr [rsp + 0x190]
03ffa 488bbc2498010000               mov        rdi, qword ptr [rsp + 0x198]
04002 4c89ac2440020000               mov        qword ptr [rsp + 0x240], r13
0400a 4889bc2490030000               mov        qword ptr [rsp + 0x390], rdi
04012 448bac2488030000               mov        r13d, dword ptr [rsp + 0x388]
0401a 48bf88b15220be7f0000           movabs     rdi, 0x7fbe2052b188
04024 ff8700080000                   inc        dword ptr [rdi + 0x800]
0402a 488bfe                         mov        rdi, rsi
0402d 488bf2                         mov        rsi, rdx
04030 488bd0                         mov        rdx, rax
04033 8b842468030000                 mov        eax, dword ptr [rsp + 0x368]
0403a 8984248c030000                 mov        dword ptr [rsp + 0x38c], eax
04041 488b842440020000               mov        rax, qword ptr [rsp + 0x240]
04049 48898424c8010000               mov        qword ptr [rsp + 0x1c8], rax
04051 488b842448020000               mov        rax, qword ptr [rsp + 0x248]
04059 48898424d0010000               mov        qword ptr [rsp + 0x1d0], rax
04061 8b84243c020000                 mov        eax, dword ptr [rsp + 0x23c]
04068 898424d8010000                 mov        dword ptr [rsp + 0x1d8], eax
0406f 488b842450020000               mov        rax, qword ptr [rsp + 0x250]
04077 48898424e0010000               mov        qword ptr [rsp + 0x1e0], rax
0407f 488b842458020000               mov        rax, qword ptr [rsp + 0x258]
04087 48898424e8010000               mov        qword ptr [rsp + 0x1e8], rax
0408f 8b842460020000                 mov        eax, dword ptr [rsp + 0x260]
04096 4c899c24f0010000               mov        qword ptr [rsp + 0x1f0], r11
0409e 4c8b9c2490030000               mov        r11, qword ptr [rsp + 0x390]
040a6 898424dc010000                 mov        dword ptr [rsp + 0x1dc], eax
040ad 4c899c2498030000               mov        qword ptr [rsp + 0x398], r11
040b5 ffc7                           inc        edi
040b7 49bb88b15220be7f0000           movabs     r11, 0x7fbe2052b188
040c1 418b4374                       mov        eax, dword ptr [r11 + 0x74]
040c5 83c002                         add        eax, 2
040c8 41894374                       mov        dword ptr [r11 + 0x74], eax
040cc 25fe3f0000                     and        eax, 0x3ffe
040d1 85c0                           test       eax, eax
040d3 0f84c1130000                   je         0x7fbe283c119a
040d9 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
040dd 418502                         test       dword ptr [r10], eax
040e0 48b888b15220be7f0000           movabs     rax, 0x7fbe2052b188
040ea ff8028080000                   inc        dword ptr [rax + 0x828]
040f0 488bc6                         mov        rax, rsi
040f3 448b9c248c030000               mov        r11d, dword ptr [rsp + 0x38c]
040fb 488bb424c8010000               mov        rsi, qword ptr [rsp + 0x1c8]
04103 4889b42480010000               mov        qword ptr [rsp + 0x180], rsi
0410b 488bb424d0010000               mov        rsi, qword ptr [rsp + 0x1d0]
04113 4889b42450010000               mov        qword ptr [rsp + 0x150], rsi
0411b 8bb424d8010000                 mov        esi, dword ptr [rsp + 0x1d8]
04122 89b42444010000                 mov        dword ptr [rsp + 0x144], esi
04129 488bb424e0010000               mov        rsi, qword ptr [rsp + 0x1e0]
04131 4889b42458010000               mov        qword ptr [rsp + 0x158], rsi
04139 488bb424e8010000               mov        rsi, qword ptr [rsp + 0x1e8]
04141 4889b42460010000               mov        qword ptr [rsp + 0x160], rsi
04149 8bb424dc010000                 mov        esi, dword ptr [rsp + 0x1dc]
04150 89b42468010000                 mov        dword ptr [rsp + 0x168], esi
04157 488bb424f0010000               mov        rsi, qword ptr [rsp + 0x1f0]
0415f 4889b42490010000               mov        qword ptr [rsp + 0x190], rsi
04167 488bb42498030000               mov        rsi, qword ptr [rsp + 0x398]
0416f 44898c2474010000               mov        dword ptr [rsp + 0x174], r9d
04177 899c246c010000                 mov        dword ptr [rsp + 0x16c], ebx
0417e 48898c2478010000               mov        qword ptr [rsp + 0x178], rcx
04186 4c898424a8010000               mov        qword ptr [rsp + 0x1a8], r8
0418e 899424a0010000                 mov        dword ptr [rsp + 0x1a0], edx
04195 4c89b424b0010000               mov        qword ptr [rsp + 0x1b0], r14
0419d 4489ac2488010000               mov        dword ptr [rsp + 0x188], r13d
041a5 44899c248c010000               mov        dword ptr [rsp + 0x18c], r11d
041ad 4c8b8c2450010000               mov        r9, qword ptr [rsp + 0x150]
041b5 8b9c2444010000                 mov        ebx, dword ptr [rsp + 0x144]
041bc 448b842468010000               mov        r8d, dword ptr [rsp + 0x168]
041c4 4889b42498010000               mov        qword ptr [rsp + 0x198], rsi
041cc 488bd7                         mov        rdx, rdi
041cf 488bf0                         mov        rsi, rax
041d2 488b842458010000               mov        rax, qword ptr [rsp + 0x158]
041da 488bbc2460010000               mov        rdi, qword ptr [rsp + 0x160]
041e2 e969c1ffff                     jmp        0x7fbe283bc050
041e7 488bd6                         mov        rdx, rsi
041ea 488bb42498010000               mov        rsi, qword ptr [rsp + 0x198]
041f2 4585db                         test       r11d, r11d
041f5 48b988b15220be7f0000           movabs     rcx, 0x7fbe2052b188
041ff 41b880030000                   mov        r8d, 0x380
04205 7e06                           jle        0x7fbe283bff0d
04207 41b890030000                   mov        r8d, 0x390
0420d 4e8b0c01                       mov        r9, qword ptr [rcx + r8]
04211 4d8d4901                       lea        r9, [r9 + 1]
04215 4e890c01                       mov        qword ptr [rcx + r8], r9
04219 0f8e4c010000                   jle        0x7fbe283c006b
0421f 488bbc24c0010000               mov        rdi, qword ptr [rsp + 0x1c0]
04227 482bd7                         sub        rdx, rdi
0422a b900000000                     mov        ecx, 0
0422f 483bd1                         cmp        rdx, rcx
04232 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
0423c b9a0030000                     mov        ecx, 0x3a0
04241 7d05                           jge        0x7fbe283bff48
04243 b9b0030000                     mov        ecx, 0x3b0
04248 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0424c 4d8d4001                       lea        r8, [r8 + 1]
04250 4c89040a                       mov        qword ptr [rdx + rcx], r8
04254 0f8d11010000                   jge        0x7fbe283c006b
0425a 488b5630                       mov        rdx, qword ptr [rsi + 0x30]
0425e be00000000                     mov        esi, 0
04263 483bd6                         cmp        rdx, rsi
04266 48be88b15220be7f0000           movabs     rsi, 0x7fbe2052b188
04270 bac0030000                     mov        edx, 0x3c0
04275 7505                           jne        0x7fbe283bff7c
04277 bad0030000                     mov        edx, 0x3d0
0427c 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
04280 488d4901                       lea        rcx, [rcx + 1]
04284 48890c16                       mov        qword ptr [rsi + rdx], rcx
04288 0f85dd000000                   jne        0x7fbe283c006b
0428e e9e2000000                     jmp        0x7fbe283c0075
04293 488bc6                         mov        rax, rsi
04296 448b9c248c010000               mov        r11d, dword ptr [rsp + 0x18c]
0429e 488b8c2480010000               mov        rcx, qword ptr [rsp + 0x180]
042a6 498bd8                         mov        rbx, r8
042a9 488b942490010000               mov        rdx, qword ptr [rsp + 0x190]
042b1 2bd8                           sub        ebx, eax
042b3 48be88b15220be7f0000           movabs     rsi, 0x7fbe2052b188
042bd 4883864008000001               add        qword ptr [rsi + 0x840], 1
042c5 488bf2                         mov        rsi, rdx
042c8 488bd0                         mov        rdx, rax
042cb 4d8bc3                         mov        r8, r11
042ce 4c8bcb                         mov        r9, rbx
042d1 44899c248c010000               mov        dword ptr [rsp + 0x18c], r11d
042d9 899c24a0030000                 mov        dword ptr [rsp + 0x3a0], ebx
042e0 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
042e5 4c89442408                     mov        qword ptr [rsp + 8], r8
042ea 48890c24                       mov        qword ptr [rsp], rcx
042ee 4889542418                     mov        qword ptr [rsp + 0x18], rdx
042f3 4889742420                     mov        qword ptr [rsp + 0x20], rsi
042f8 488bfe                         mov        rdi, rsi
042fb 488bf2                         mov        rsi, rdx
042fe 488bd1                         mov        rdx, rcx
04301 498bc8                         mov        rcx, r8
04304 4d8bc1                         mov        r8, r9
04307 e834985207                     call       0x7fbe2f8e9840
0430c 85c0                           test       eax, eax
0430e 0f842b000000                   je         0x7fbe283c003f
04314 488bf8                         mov        rdi, rax
04317 83f7ff                         xor        edi, 0xffffffff
0431a 488b0c24                       mov        rcx, qword ptr [rsp]
0431e 4c8b442408                     mov        r8, qword ptr [rsp + 8]
04323 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
04328 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
0432d 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
04332 442bcf                         sub        r9d, edi
04335 03d7                           add        edx, edi
04337 4403c7                         add        r8d, edi
0433a e981110000                     jmp        0x7fbe283c11c0
0433f 8b9c24a0030000                 mov        ebx, dword ptr [rsp + 0x3a0]
04346 039c248c010000                 add        ebx, dword ptr [rsp + 0x18c]
0434d 488b942498010000               mov        rdx, qword ptr [rsp + 0x198]
04355 895a38                         mov        dword ptr [rdx + 0x38], ebx
04358 4881c4d0030000                 add        rsp, 0x3d0
0435f 5d                             pop        rbp
04360 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
04364 0f876c110000                   ja         0x7fbe283c11d6
0436a c3                             ret        
0436b bb02000000                     mov        ebx, 2
04370 e915000000                     jmp        0x7fbe283c008a
04375 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
0437f ff82e0030000                   inc        dword ptr [rdx + 0x3e0]
04385 bb08000000                     mov        ebx, 8
0438a 899c24a4030000                 mov        dword ptr [rsp + 0x3a4], ebx
04391 0f1f8000000000                 nop        dword ptr [rax]
04398 e95e110000                     jmp        0x7fbe283c11fb
0439d 90                             nop        
0439e 90                             nop        
0439f 90                             nop        
043a0 90                             nop        
043a1 90                             nop        
043a2 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
043a9 0f855b110000                   jne        0x7fbe283c120a
043af 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
043b6 488d7820                       lea        rdi, [rax + 0x20]
043ba 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
043c1 0f8743110000                   ja         0x7fbe283c120a
043c7 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
043ce 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
043d5 488908                         mov        qword ptr [rax], rcx
043d8 4833c9                         xor        rcx, rcx
043db 48894808                       mov        qword ptr [rax + 8], rcx
043df 48894810                       mov        qword ptr [rax + 0x10], rcx
043e3 48894818                       mov        qword ptr [rax + 0x18], rcx
043e7 90                             nop        
043e8 e939110000                     jmp        0x7fbe283c1226
043ed 90                             nop        
043ee 90                             nop        
043ef 90                             nop        
043f0 90                             nop        
043f1 90                             nop        
043f2 498bf3                         mov        rsi, r11
043f5 48898424a8030000               mov        qword ptr [rsp + 0x3a8], rax
043fd 6690                           nop        
043ff e85cb75307                     call       0x7fbe2f8fb860
04404 0f1f8400fc44001c               nop        dword ptr [rax + rax + 0x1c0044fc]
0440c 48ba88b15220be7f0000           movabs     rdx, 0x7fbe2052b188
04416 488d9208040000                 lea        rdx, [rdx + 0x408]
0441d 4885c0                         test       rax, rax
04420 750a                           jne        0x7fbe283c012c
04422 f60201                         test       byte ptr [rdx], 1
04425 7505                           jne        0x7fbe283c012c
04427 f048830a01                     lock or    qword ptr [rdx], 1
0442c 488b9424a8030000               mov        rdx, qword ptr [rsp + 0x3a8]
04434 48b988b15220be7f0000           movabs     rcx, 0x7fbe2052b188
0443e 4883811804000001               add        qword ptr [rcx + 0x418], 1
04446 8b9424a4030000                 mov        edx, dword ptr [rsp + 0x3a4]
0444d 488bc8                         mov        rcx, rax
04450 488bb424a8030000               mov        rsi, qword ptr [rsp + 0x3a8]
04458 0f1f8000000000                 nop        dword ptr [rax]
0445f e8fcac5307                     call       0x7fbe2f8fae60
04464 0f1f84005c45001d               nop        dword ptr [rax + rax + 0x1d00455c]
0446c 488b8424a8030000               mov        rax, qword ptr [rsp + 0x3a8]
04474 e92a110000                     jmp        0x7fbe283c12a3
04479 0f1f8000000000                 nop        dword ptr [rax]
04480 e9ba100000                     jmp        0x7fbe283c123f
04485 90                             nop        
04486 90                             nop        
04487 90                             nop        
04488 90                             nop        
04489 90                             nop        
0448a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04491 0f85b7100000                   jne        0x7fbe283c124e
04497 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
0449e 488d7820                       lea        rdi, [rax + 0x20]
044a2 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
044a9 0f879f100000                   ja         0x7fbe283c124e
044af 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
044b6 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
044bd 488908                         mov        qword ptr [rax], rcx
044c0 4833c9                         xor        rcx, rcx
044c3 48894808                       mov        qword ptr [rax + 8], rcx
044c7 48894810                       mov        qword ptr [rax + 0x10], rcx
044cb 48894818                       mov        qword ptr [rax + 0x18], rcx
044cf 488bd0                         mov        rdx, rax
044d2 48b988b15220be7f0000           movabs     rcx, 0x7fbe2052b188
044dc 4883815002000001               add        qword ptr [rcx + 0x250], 1
044e4 ba02000000                     mov        edx, 2
044e9 48b9a86126e200000000           movabs     rcx, 0xe22661a8
044f3 488bf0                         mov        rsi, rax
044f6 48898424b0030000               mov        qword ptr [rsp + 0x3b0], rax
044fe 90                             nop        
044ff e85cac5307                     call       0x7fbe2f8fae60
04504 0f1f8400fc45001e               nop        dword ptr [rax + rax + 0x1e0045fc]
0450c 488b8424b0030000               mov        rax, qword ptr [rsp + 0x3b0]
04514 e98a100000                     jmp        0x7fbe283c12a3
04519 0f1f8000000000                 nop        dword ptr [rax]
04520 e945100000                     jmp        0x7fbe283c126a
04525 90                             nop        
04526 90                             nop        
04527 90                             nop        
04528 90                             nop        
04529 90                             nop        
0452a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04531 0f8542100000                   jne        0x7fbe283c1279
04537 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
0453e 488d7820                       lea        rdi, [rax + 0x20]
04542 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
04549 0f872a100000                   ja         0x7fbe283c1279
0454f 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
04556 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0455d 488908                         mov        qword ptr [rax], rcx
04560 4833c9                         xor        rcx, rcx
04563 48894808                       mov        qword ptr [rax + 8], rcx
04567 48894810                       mov        qword ptr [rax + 0x10], rcx
0456b 48894818                       mov        qword ptr [rax + 0x18], rcx
0456f 488bd0                         mov        rdx, rax
04572 48b988b15220be7f0000           movabs     rcx, 0x7fbe2052b188
0457c 4883813801000001               add        qword ptr [rcx + 0x138], 1
04584 ba05000000                     mov        edx, 5
04589 48b9d86126e200000000           movabs     rcx, 0xe22661d8
04593 488bf0                         mov        rsi, rax
04596 48898424b8030000               mov        qword ptr [rsp + 0x3b8], rax
0459e 90                             nop        
0459f e8bcab5307                     call       0x7fbe2f8fae60
045a4 0f1f84009c46001f               nop        dword ptr [rax + rax + 0x1f00469c]
045ac 488b8424b8030000               mov        rax, qword ptr [rsp + 0x3b8]
045b4 e9ea0f0000                     jmp        0x7fbe283c12a3
045b9 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
045c0 55                             push       rbp
045c1 4881ecd0030000                 sub        rsp, 0x3d0
045c8 41817f2000000000               cmp        dword ptr [r15 + 0x20], 0
045d0 7405                           je         0x7fbe283c02d7
045d2 e8c9a75207                     call       0x7fbe2f8eaaa0
045d7 bf40010000                     mov        edi, 0x140
045dc 4863ff                         movsxd     rdi, edi
045df 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
045e3 48899c24a8020000               mov        qword ptr [rsp + 0x2a8], rbx
045eb bf38010000                     mov        edi, 0x138
045f0 4863ff                         movsxd     rdi, edi
045f3 488b043e                       mov        rax, qword ptr [rsi + rdi]
045f7 48898424b0020000               mov        qword ptr [rsp + 0x2b0], rax
045ff bf30010000                     mov        edi, 0x130
04604 4863ff                         movsxd     rdi, edi
04607 8b143e                         mov        edx, dword ptr [rsi + rdi]
0460a bf28010000                     mov        edi, 0x128
0460f 4863ff                         movsxd     rdi, edi
04612 488b0c3e                       mov        rcx, qword ptr [rsi + rdi]
04616 bf20010000                     mov        edi, 0x120
0461b 4863ff                         movsxd     rdi, edi
0461e 4c8b043e                       mov        r8, qword ptr [rsi + rdi]
04622 bf18010000                     mov        edi, 0x118
04627 4863ff                         movsxd     rdi, edi
0462a 448b0c3e                       mov        r9d, dword ptr [rsi + rdi]
0462e bf08010000                     mov        edi, 0x108
04633 4863ff                         movsxd     rdi, edi
04636 4c8b1c3e                       mov        r11, qword ptr [rsi + rdi]
0463a bf00010000                     mov        edi, 0x100
0463f 4863ff                         movsxd     rdi, edi
04642 4c8b2c3e                       mov        r13, qword ptr [rsi + rdi]
04646 bff0000000                     mov        edi, 0xf0
0464b 4863ff                         movsxd     rdi, edi
0464e 448b343e                       mov        r14d, dword ptr [rsi + rdi]
04652 bfe8000000                     mov        edi, 0xe8
04657 4863ff                         movsxd     rdi, edi
0465a 8b3c3e                         mov        edi, dword ptr [rsi + rdi]
0465d bbd8000000                     mov        ebx, 0xd8
04662 4863db                         movsxd     rbx, ebx
04665 488b041e                       mov        rax, qword ptr [rsi + rbx]
04669 48898424b8020000               mov        qword ptr [rsp + 0x2b8], rax
04671 bba0000000                     mov        ebx, 0xa0
04676 4863db                         movsxd     rbx, ebx
04679 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
0467c 899c249c020000                 mov        dword ptr [rsp + 0x29c], ebx
04683 bb90000000                     mov        ebx, 0x90
04688 4863db                         movsxd     rbx, ebx
0468b 488b041e                       mov        rax, qword ptr [rsi + rbx]
0468f 48898424c0020000               mov        qword ptr [rsp + 0x2c0], rax
04697 bb80000000                     mov        ebx, 0x80
0469c 4863db                         movsxd     rbx, ebx
0469f 488b041e                       mov        rax, qword ptr [rsi + rbx]
046a3 bb78000000                     mov        ebx, 0x78
046a8 4863db                         movsxd     rbx, ebx
046ab 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
046ae 899c24c8020000                 mov        dword ptr [rsp + 0x2c8], ebx
046b5 bb70000000                     mov        ebx, 0x70
046ba 4863db                         movsxd     rbx, ebx
046bd 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
046c0 899c24cc020000                 mov        dword ptr [rsp + 0x2cc], ebx
046c7 bb68000000                     mov        ebx, 0x68
046cc 4863db                         movsxd     rbx, ebx
046cf 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
046d2 899c24d0020000                 mov        dword ptr [rsp + 0x2d0], ebx
046d9 bb10000000                     mov        ebx, 0x10
046de 4863db                         movsxd     rbx, ebx
046e1 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
046e4 899c24d4020000                 mov        dword ptr [rsp + 0x2d4], ebx
046eb bb08000000                     mov        ebx, 8
046f0 4863db                         movsxd     rbx, ebx
046f3 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
046f6 899c24d8020000                 mov        dword ptr [rsp + 0x2d8], ebx
046fd bb00000000                     mov        ebx, 0
04702 4863db                         movsxd     rbx, ebx
04705 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
04708 89bc24dc020000                 mov        dword ptr [rsp + 0x2dc], edi
0470f 488bfe                         mov        rdi, rsi
04712 89942404030000                 mov        dword ptr [rsp + 0x304], edx
04719 48898c2410030000               mov        qword ptr [rsp + 0x310], rcx
04721 4c89842408030000               mov        qword ptr [rsp + 0x308], r8
04729 44898c2400030000               mov        dword ptr [rsp + 0x300], r9d
04731 4c899c24f8020000               mov        qword ptr [rsp + 0x2f8], r11
04739 4c89ac24f0020000               mov        qword ptr [rsp + 0x2f0], r13
04741 4489b424e4020000               mov        dword ptr [rsp + 0x2e4], r14d
04749 48898424e8020000               mov        qword ptr [rsp + 0x2e8], rax
04751 899c24e0020000                 mov        dword ptr [rsp + 0x2e0], ebx
04758 e823a62521                     call       0x7fbe4961aa80
0475d 0f1f840000000000               nop        dword ptr [rax + rax]
04765 8b9c24e0020000                 mov        ebx, dword ptr [rsp + 0x2e0]
0476c 8bb424d8020000                 mov        esi, dword ptr [rsp + 0x2d8]
04773 488bc6                         mov        rax, rsi
04776 8bb424d4020000                 mov        esi, dword ptr [rsp + 0x2d4]
0477d 4c8bee                         mov        r13, rsi
04780 8bb424d0020000                 mov        esi, dword ptr [rsp + 0x2d0]
04787 8b9424cc020000                 mov        edx, dword ptr [rsp + 0x2cc]
0478e 4c8bca                         mov        r9, rdx
04791 8b9424c8020000                 mov        edx, dword ptr [rsp + 0x2c8]
04798 4c8bda                         mov        r11, rdx
0479b 488b9424e8020000               mov        rdx, qword ptr [rsp + 0x2e8]
047a3 488bca                         mov        rcx, rdx
047a6 488b9424c0020000               mov        rdx, qword ptr [rsp + 0x2c0]
047ae 4c8bc2                         mov        r8, rdx
047b1 8b94249c020000                 mov        edx, dword ptr [rsp + 0x29c]
047b8 488bfa                         mov        rdi, rdx
047bb 488b9424b8020000               mov        rdx, qword ptr [rsp + 0x2b8]
047c3 4c8bf2                         mov        r14, rdx
047c6 8b9424dc020000                 mov        edx, dword ptr [rsp + 0x2dc]
047cd 89942464020000                 mov        dword ptr [rsp + 0x264], edx
047d4 8b9424e4020000                 mov        edx, dword ptr [rsp + 0x2e4]
047db 89942470020000                 mov        dword ptr [rsp + 0x270], edx
047e2 488b9424f0020000               mov        rdx, qword ptr [rsp + 0x2f0]
047ea 4889942478020000               mov        qword ptr [rsp + 0x278], rdx
047f2 488b9424f8020000               mov        rdx, qword ptr [rsp + 0x2f8]
047fa 4889942480020000               mov        qword ptr [rsp + 0x280], rdx
04802 8b942400030000                 mov        edx, dword ptr [rsp + 0x300]
04809 89942474020000                 mov        dword ptr [rsp + 0x274], edx
04810 488b942408030000               mov        rdx, qword ptr [rsp + 0x308]
04818 4889942488020000               mov        qword ptr [rsp + 0x288], rdx
04820 488b942410030000               mov        rdx, qword ptr [rsp + 0x310]
04828 4889942490020000               mov        qword ptr [rsp + 0x290], rdx
04830 8b942404030000                 mov        edx, dword ptr [rsp + 0x304]
04837 89942498020000                 mov        dword ptr [rsp + 0x298], edx
0483e 488b9424b0020000               mov        rdx, qword ptr [rsp + 0x2b0]
04846 48899424a0020000               mov        qword ptr [rsp + 0x2a0], rdx
0484e 488b9424a8020000               mov        rdx, qword ptr [rsp + 0x2a8]
04856 89842428030000                 mov        dword ptr [rsp + 0x328], eax
0485d 4489ac2440030000               mov        dword ptr [rsp + 0x340], r13d
04865 89b42420030000                 mov        dword ptr [rsp + 0x320], esi
0486c 44898c2444030000               mov        dword ptr [rsp + 0x344], r9d
04874 44899c2450030000               mov        dword ptr [rsp + 0x350], r11d
0487c 48898c2458030000               mov        qword ptr [rsp + 0x358], rcx
04884 4c89842448030000               mov        qword ptr [rsp + 0x348], r8
0488c 89bc2424030000                 mov        dword ptr [rsp + 0x324], edi
04893 4c89b42438030000               mov        qword ptr [rsp + 0x338], r14
0489b 4889942418030000               mov        qword ptr [rsp + 0x318], rdx
048a3 e978dcffff                     jmp        0x7fbe283be220
048a8 49ba38de5120be7f0000           movabs     r10, 0x7fbe2051de38
048b2 4c89542408                     mov        qword ptr [rsp + 8], r10
048b7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048bf e89c206007                     call       0x7fbe2f9c2660
048c4 e9b4b7ffff                     jmp        0x7fbe283bbd7d
048c9 49ba58e61820be7f0000           movabs     r10, 0x7fbe2018e658
048d3 4c89542408                     mov        qword ptr [rsp + 8], r10
048d8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048e0 e87b206007                     call       0x7fbe2f9c2660
048e5 e900b9ffff                     jmp        0x7fbe283bbeea
048ea e8f1c05f07                     call       0x7fbe2f9bc6e0
048ef e8ecc05f07                     call       0x7fbe2f9bc6e0
048f4 e8e7c05f07                     call       0x7fbe2f9bc6e0
048f9 48891424                       mov        qword ptr [rsp], rdx
048fd 48897c2408                     mov        qword ptr [rsp + 8], rdi
04902 e8d9b75f07                     call       0x7fbe2f9bbde0
04907 e8d4c05f07                     call       0x7fbe2f9bc6e0
0490c e8cfc05f07                     call       0x7fbe2f9bc6e0
04911 48891424                       mov        qword ptr [rsp], rdx
04915 4889442408                     mov        qword ptr [rsp + 8], rax
0491a e8c1b75f07                     call       0x7fbe2f9bbde0
0491f e8bcc05f07                     call       0x7fbe2f9bc6e0
04924 e8b7c05f07                     call       0x7fbe2f9bc6e0
04929 48c7042401000000               mov        qword ptr [rsp], 1
04931 4c894c2408                     mov        qword ptr [rsp + 8], r9
04936 e8a5b75f07                     call       0x7fbe2f9bbde0
0493b 48c7042402000000               mov        qword ptr [rsp], 2
04943 4c894c2408                     mov        qword ptr [rsp + 8], r9
04948 e893b75f07                     call       0x7fbe2f9bbde0
0494d 48c7042400000000               mov        qword ptr [rsp], 0
04955 4c894c2408                     mov        qword ptr [rsp + 8], r9
0495a e881b75f07                     call       0x7fbe2f9bbde0
0495f 48c7042401000000               mov        qword ptr [rsp], 1
04967 4c894c2408                     mov        qword ptr [rsp + 8], r9
0496c e86fb75f07                     call       0x7fbe2f9bbde0
04971 48c7042400000000               mov        qword ptr [rsp], 0
04979 4c894c2408                     mov        qword ptr [rsp + 8], r9
0497e e85db75f07                     call       0x7fbe2f9bbde0
04983 49ba084f5320be7f0000           movabs     r10, 0x7fbe20534f08
0498d 4c89542408                     mov        qword ptr [rsp + 8], r10
04992 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0499a e8c11f6007                     call       0x7fbe2f9c2660
0499f e9cabfffff                     jmp        0x7fbe283bc66e
049a4 e837c05f07                     call       0x7fbe2f9bc6e0
049a9 49ba88326e20be7f0000           movabs     r10, 0x7fbe206e3288
049b3 4c89542408                     mov        qword ptr [rsp + 8], r10
049b8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049c0 e89b1f6007                     call       0x7fbe2f9c2660
049c5 e950c0ffff                     jmp        0x7fbe283bc71a
049ca 49ba88cc1620be7f0000           movabs     r10, 0x7fbe2016cc88
049d4 4c89542408                     mov        qword ptr [rsp + 8], r10
049d9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049e1 e87a1f6007                     call       0x7fbe2f9c2660
049e6 e970c0ffff                     jmp        0x7fbe283bc75b
049eb 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
049f3 e8e8006007                     call       0x7fbe2f9c07e0
049f8 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04a00 e8db006007                     call       0x7fbe2f9c07e0
04a05 49ba680d6720be7f0000           movabs     r10, 0x7fbe20670d68
04a0f 4c89542408                     mov        qword ptr [rsp + 8], r10
04a14 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a1c e83f1f6007                     call       0x7fbe2f9c2660
04a21 e90ec1ffff                     jmp        0x7fbe283bc834
04a26 49bae8706720be7f0000           movabs     r10, 0x7fbe206770e8
04a30 4c89542408                     mov        qword ptr [rsp + 8], r10
04a35 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a3d e81e1f6007                     call       0x7fbe2f9c2660
04a42 e925c1ffff                     jmp        0x7fbe283bc86c
04a47 49ba40006a20be7f0000           movabs     r10, 0x7fbe206a0040
04a51 4c89542408                     mov        qword ptr [rsp + 8], r10
04a56 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a5e e8fd1e6007                     call       0x7fbe2f9c2660
04a63 e972c1ffff                     jmp        0x7fbe283bc8da
04a68 49bad0685320be7f0000           movabs     r10, 0x7fbe205368d0
04a72 4c89542408                     mov        qword ptr [rsp + 8], r10
04a77 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a7f e8dc1e6007                     call       0x7fbe2f9c2660
04a84 e986c1ffff                     jmp        0x7fbe283bc90f
04a89 49ba00c66920be7f0000           movabs     r10, 0x7fbe2069c600
04a93 4c89542408                     mov        qword ptr [rsp + 8], r10
04a98 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04aa0 e8bb1e6007                     call       0x7fbe2f9c2660
04aa5 e99ac1ffff                     jmp        0x7fbe283bc944
04aaa 49ba38815320be7f0000           movabs     r10, 0x7fbe20538138
04ab4 4c89542408                     mov        qword ptr [rsp + 8], r10
04ab9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ac1 e89a1e6007                     call       0x7fbe2f9c2660
04ac6 e991c2ffff                     jmp        0x7fbe283bca5c
04acb 49bad07f4620be7f0000           movabs     r10, 0x7fbe20467fd0
04ad5 4c89542408                     mov        qword ptr [rsp + 8], r10
04ada 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ae2 e8791e6007                     call       0x7fbe2f9c2660
04ae7 e9b3c2ffff                     jmp        0x7fbe283bca9f
04aec 49baa8563a20be7f0000           movabs     r10, 0x7fbe203a56a8
04af6 4c89542408                     mov        qword ptr [rsp + 8], r10
04afb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b03 e8581e6007                     call       0x7fbe2f9c2660
04b08 e9c6c2ffff                     jmp        0x7fbe283bcad3
04b0d 48890424                       mov        qword ptr [rsp], rax
04b11 e8cae65f07                     call       0x7fbe2f9beee0
04b16 e8c5be5f07                     call       0x7fbe2f9bc6e0
04b1b 49ba985c5320be7f0000           movabs     r10, 0x7fbe20535c98
04b25 4c89542408                     mov        qword ptr [rsp + 8], r10
04b2a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b32 e8291e6007                     call       0x7fbe2f9c2660
04b37 e952c4ffff                     jmp        0x7fbe283bcc8e
04b3c e89fbe5f07                     call       0x7fbe2f9bc6e0
04b41 49ba88326e20be7f0000           movabs     r10, 0x7fbe206e3288
04b4b 4c89542408                     mov        qword ptr [rsp + 8], r10
04b50 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b58 e8031e6007                     call       0x7fbe2f9c2660
04b5d e9f0c4ffff                     jmp        0x7fbe283bcd52
04b62 49ba88cc1620be7f0000           movabs     r10, 0x7fbe2016cc88
04b6c 4c89542408                     mov        qword ptr [rsp + 8], r10
04b71 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b79 e8e21d6007                     call       0x7fbe2f9c2660
04b7e e90dc5ffff                     jmp        0x7fbe283bcd90
04b83 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04b8b e850ff5f07                     call       0x7fbe2f9c07e0
04b90 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04b98 e843ff5f07                     call       0x7fbe2f9c07e0
04b9d e83ebe5f07                     call       0x7fbe2f9bc6e0
04ba2 49ba38815320be7f0000           movabs     r10, 0x7fbe20538138
04bac 4c89542408                     mov        qword ptr [rsp + 8], r10
04bb1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bb9 e8a21d6007                     call       0x7fbe2f9c2660
04bbe e9bec6ffff                     jmp        0x7fbe283bcf81
04bc3 49bad07f4620be7f0000           movabs     r10, 0x7fbe20467fd0
04bcd 4c89542408                     mov        qword ptr [rsp + 8], r10
04bd2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bda e8811d6007                     call       0x7fbe2f9c2660
04bdf e9eac6ffff                     jmp        0x7fbe283bcfce
04be4 49baa8563a20be7f0000           movabs     r10, 0x7fbe203a56a8
04bee 4c89542408                     mov        qword ptr [rsp + 8], r10
04bf3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bfb e8601d6007                     call       0x7fbe2f9c2660
04c00 e901c7ffff                     jmp        0x7fbe283bd006
04c05 49ba084f5320be7f0000           movabs     r10, 0x7fbe20534f08
04c0f 4c89542408                     mov        qword ptr [rsp + 8], r10
04c14 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c1c e83f1d6007                     call       0x7fbe2f9c2660
04c21 e902c8ffff                     jmp        0x7fbe283bd128
04c26 e8b5bd5f07                     call       0x7fbe2f9bc6e0
04c2b 49ba88326e20be7f0000           movabs     r10, 0x7fbe206e3288
04c35 4c89542408                     mov        qword ptr [rsp + 8], r10
04c3a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c42 e8191d6007                     call       0x7fbe2f9c2660
04c47 e988c8ffff                     jmp        0x7fbe283bd1d4
04c4c 49ba88cc1620be7f0000           movabs     r10, 0x7fbe2016cc88
04c56 4c89542408                     mov        qword ptr [rsp + 8], r10
04c5b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c63 e8f81c6007                     call       0x7fbe2f9c2660
04c68 e9a0c8ffff                     jmp        0x7fbe283bd20d
04c6d 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04c75 e866fe5f07                     call       0x7fbe2f9c07e0
04c7a 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04c82 e859fe5f07                     call       0x7fbe2f9c07e0
04c87 49ba680d6720be7f0000           movabs     r10, 0x7fbe20670d68
04c91 4c89542408                     mov        qword ptr [rsp + 8], r10
04c96 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c9e e8bd1c6007                     call       0x7fbe2f9c2660
04ca3 e931c9ffff                     jmp        0x7fbe283bd2d9
04ca8 49bae8706720be7f0000           movabs     r10, 0x7fbe206770e8
04cb2 4c89542408                     mov        qword ptr [rsp + 8], r10
04cb7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cbf e89c1c6007                     call       0x7fbe2f9c2660
04cc4 e945c9ffff                     jmp        0x7fbe283bd30e
04cc9 49ba40006a20be7f0000           movabs     r10, 0x7fbe206a0040
04cd3 4c89542408                     mov        qword ptr [rsp + 8], r10
04cd8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ce0 e87b1c6007                     call       0x7fbe2f9c2660
04ce5 e97cc9ffff                     jmp        0x7fbe283bd366
04cea 49bad0685320be7f0000           movabs     r10, 0x7fbe205368d0
04cf4 4c89542408                     mov        qword ptr [rsp + 8], r10
04cf9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d01 e85a1c6007                     call       0x7fbe2f9c2660
04d06 e991c9ffff                     jmp        0x7fbe283bd39c
04d0b 49ba00c66920be7f0000           movabs     r10, 0x7fbe2069c600
04d15 4c89542408                     mov        qword ptr [rsp + 8], r10
04d1a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d22 e8391c6007                     call       0x7fbe2f9c2660
04d27 e9a5c9ffff                     jmp        0x7fbe283bd3d1
04d2c 49ba38815320be7f0000           movabs     r10, 0x7fbe20538138
04d36 4c89542408                     mov        qword ptr [rsp + 8], r10
04d3b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d43 e8181c6007                     call       0x7fbe2f9c2660
04d48 e996caffff                     jmp        0x7fbe283bd4e3
04d4d 49bad07f4620be7f0000           movabs     r10, 0x7fbe20467fd0
04d57 4c89542408                     mov        qword ptr [rsp + 8], r10
04d5c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d64 e8f71b6007                     call       0x7fbe2f9c2660
04d69 e9b9caffff                     jmp        0x7fbe283bd527
04d6e 49baa8563a20be7f0000           movabs     r10, 0x7fbe203a56a8
04d78 4c89542408                     mov        qword ptr [rsp + 8], r10
04d7d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d85 e8d61b6007                     call       0x7fbe2f9c2660
04d8a e9cdcaffff                     jmp        0x7fbe283bd55c
04d8f 48890424                       mov        qword ptr [rsp], rax
04d93 e848e45f07                     call       0x7fbe2f9beee0
04d98 e843bc5f07                     call       0x7fbe2f9bc6e0
04d9d 49ba985c5320be7f0000           movabs     r10, 0x7fbe20535c98
04da7 4c89542408                     mov        qword ptr [rsp + 8], r10
04dac 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04db4 e8a71b6007                     call       0x7fbe2f9c2660
04db9 e960ccffff                     jmp        0x7fbe283bd71e
04dbe e81dbc5f07                     call       0x7fbe2f9bc6e0
04dc3 49ba88326e20be7f0000           movabs     r10, 0x7fbe206e3288
04dcd 4c89542408                     mov        qword ptr [rsp + 8], r10
04dd2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04dda e8811b6007                     call       0x7fbe2f9c2660
04ddf e9feccffff                     jmp        0x7fbe283bd7e2
04de4 49ba88cc1620be7f0000           movabs     r10, 0x7fbe2016cc88
04dee 4c89542408                     mov        qword ptr [rsp + 8], r10
04df3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04dfb e8601b6007                     call       0x7fbe2f9c2660
04e00 e91bcdffff                     jmp        0x7fbe283bd820
04e05 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04e0d e8cefc5f07                     call       0x7fbe2f9c07e0
04e12 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04e1a e8c1fc5f07                     call       0x7fbe2f9c07e0
04e1f e8bcbb5f07                     call       0x7fbe2f9bc6e0
04e24 49ba38815320be7f0000           movabs     r10, 0x7fbe20538138
04e2e 4c89542408                     mov        qword ptr [rsp + 8], r10
04e33 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e3b e8201b6007                     call       0x7fbe2f9c2660
04e40 e9ccceffff                     jmp        0x7fbe283bda11
04e45 49bad07f4620be7f0000           movabs     r10, 0x7fbe20467fd0
04e4f 4c89542408                     mov        qword ptr [rsp + 8], r10
04e54 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e5c e8ff1a6007                     call       0x7fbe2f9c2660
04e61 e9f8ceffff                     jmp        0x7fbe283bda5e
04e66 49baa8563a20be7f0000           movabs     r10, 0x7fbe203a56a8
04e70 4c89542408                     mov        qword ptr [rsp + 8], r10
04e75 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e7d e8de1a6007                     call       0x7fbe2f9c2660
04e82 e90fcfffff                     jmp        0x7fbe283bda96
04e87 49ba38de5120be7f0000           movabs     r10, 0x7fbe2051de38
04e91 4c89542408                     mov        qword ptr [rsp + 8], r10
04e96 48c704240a020000               mov        qword ptr [rsp], 0x20a
04e9e e8bd1a6007                     call       0x7fbe2f9c2660
04ea3 e9bdcfffff                     jmp        0x7fbe283bdb65
04ea8 0f1f8000000000                 nop        dword ptr [rax]
04eaf e8acac5307                     call       0x7fbe2f8fb860
04eb4 e98ed0ffff                     jmp        0x7fbe283bdc47
04eb9 660f1f440000                   nop        word ptr [rax + rax]
04ebf e89cac5307                     call       0x7fbe2f8fb860
04ec4 e9ecd1ffff                     jmp        0x7fbe283bddb5
04ec9 49bad0055220be7f0000           movabs     r10, 0x7fbe205205d0
04ed3 4c89542408                     mov        qword ptr [rsp + 8], r10
04ed8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ee0 e87b1a6007                     call       0x7fbe2f9c2660
04ee5 e950d2ffff                     jmp        0x7fbe283bde3a
04eea 49b80000000000000000           movabs     r8, 0
04ef4 b8000f050a                     mov        eax, 0xa050f00
04ef9 e862116007                     call       0x7fbe2f9c1d60
04efe e93dd2ffff                     jmp        0x7fbe283bde40
04f03 49ba38de5120be7f0000           movabs     r10, 0x7fbe2051de38
04f0d 4c89542408                     mov        qword ptr [rsp + 8], r10
04f12 48c70424aa020000               mov        qword ptr [rsp], 0x2aa
04f1a e8411a6007                     call       0x7fbe2f9c2660
04f1f e968d3ffff                     jmp        0x7fbe283bdf8c
04f24 49ba084f5320be7f0000           movabs     r10, 0x7fbe20534f08
04f2e 4c89542408                     mov        qword ptr [rsp + 8], r10
04f33 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f3b e8201a6007                     call       0x7fbe2f9c2660
04f40 e916d6ffff                     jmp        0x7fbe283be25b
04f45 e896ba5f07                     call       0x7fbe2f9bc6e0
04f4a 49ba88326e20be7f0000           movabs     r10, 0x7fbe206e3288
04f54 4c89542408                     mov        qword ptr [rsp + 8], r10
04f59 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f61 e8fa196007                     call       0x7fbe2f9c2660
04f66 e99ed6ffff                     jmp        0x7fbe283be309
04f6b 49ba88cc1620be7f0000           movabs     r10, 0x7fbe2016cc88
04f75 4c89542408                     mov        qword ptr [rsp + 8], r10
04f7a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f82 e8d9196007                     call       0x7fbe2f9c2660
04f87 e9b5d6ffff                     jmp        0x7fbe283be341
04f8c 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04f94 e847fb5f07                     call       0x7fbe2f9c07e0
04f99 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04fa1 e83afb5f07                     call       0x7fbe2f9c07e0
04fa6 49ba680d6720be7f0000           movabs     r10, 0x7fbe20670d68
04fb0 4c89542408                     mov        qword ptr [rsp + 8], r10
04fb5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04fbd e89e196007                     call       0x7fbe2f9c2660
04fc2 e957d7ffff                     jmp        0x7fbe283be41e
04fc7 49bae8706720be7f0000           movabs     r10, 0x7fbe206770e8
04fd1 4c89542408                     mov        qword ptr [rsp + 8], r10
04fd6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04fde e87d196007                     call       0x7fbe2f9c2660
04fe3 e969d7ffff                     jmp        0x7fbe283be451
04fe8 49ba40006a20be7f0000           movabs     r10, 0x7fbe206a0040
04ff2 4c89542408                     mov        qword ptr [rsp + 8], r10
04ff7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04fff e85c196007                     call       0x7fbe2f9c2660
05004 e9a4d7ffff                     jmp        0x7fbe283be4ad
05009 49bad0685320be7f0000           movabs     r10, 0x7fbe205368d0
05013 4c89542408                     mov        qword ptr [rsp + 8], r10
05018 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05020 e83b196007                     call       0x7fbe2f9c2660
05025 e9bed7ffff                     jmp        0x7fbe283be4e8
0502a 49ba00c66920be7f0000           movabs     r10, 0x7fbe2069c600
05034 4c89542408                     mov        qword ptr [rsp + 8], r10
05039 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05041 e81a196007                     call       0x7fbe2f9c2660
05046 e9cfd7ffff                     jmp        0x7fbe283be51a
0504b 49ba38815320be7f0000           movabs     r10, 0x7fbe20538138
05055 4c89542408                     mov        qword ptr [rsp + 8], r10
0505a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05062 e8f9186007                     call       0x7fbe2f9c2660
05067 e9c7d8ffff                     jmp        0x7fbe283be633
0506c 49bad07f4620be7f0000           movabs     r10, 0x7fbe20467fd0
05076 4c89542408                     mov        qword ptr [rsp + 8], r10
0507b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05083 e8d8186007                     call       0x7fbe2f9c2660
05088 e9ecd8ffff                     jmp        0x7fbe283be679
0508d 49baa8563a20be7f0000           movabs     r10, 0x7fbe203a56a8
05097 4c89542408                     mov        qword ptr [rsp + 8], r10
0509c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050a4 e8b7186007                     call       0x7fbe2f9c2660
050a9 e903d9ffff                     jmp        0x7fbe283be6b1
050ae 48890424                       mov        qword ptr [rsp], rax
050b2 e829e15f07                     call       0x7fbe2f9beee0
050b7 e824b95f07                     call       0x7fbe2f9bc6e0
050bc 49ba985c5320be7f0000           movabs     r10, 0x7fbe20535c98
050c6 4c89542408                     mov        qword ptr [rsp + 8], r10
050cb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050d3 e888186007                     call       0x7fbe2f9c2660
050d8 e991daffff                     jmp        0x7fbe283be86e
050dd 49ba88326e20be7f0000           movabs     r10, 0x7fbe206e3288
050e7 4c89542408                     mov        qword ptr [rsp + 8], r10
050ec 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050f4 e867186007                     call       0x7fbe2f9c2660
050f9 e929dbffff                     jmp        0x7fbe283be927
050fe 49ba88cc1620be7f0000           movabs     r10, 0x7fbe2016cc88
05108 4c89542408                     mov        qword ptr [rsp + 8], r10
0510d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05115 e846186007                     call       0x7fbe2f9c2660
0511a e94cdbffff                     jmp        0x7fbe283be96b
0511f 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05127 e8b4f95f07                     call       0x7fbe2f9c07e0
0512c 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05134 e8a7f95f07                     call       0x7fbe2f9c07e0
05139 e8a2b85f07                     call       0x7fbe2f9bc6e0
0513e 49ba38815320be7f0000           movabs     r10, 0x7fbe20538138
05148 4c89542408                     mov        qword ptr [rsp + 8], r10
0514d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05155 e806186007                     call       0x7fbe2f9c2660
0515a e9f2dcffff                     jmp        0x7fbe283beb51
0515f 49bad07f4620be7f0000           movabs     r10, 0x7fbe20467fd0
05169 4c89542408                     mov        qword ptr [rsp + 8], r10
0516e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05176 e8e5176007                     call       0x7fbe2f9c2660
0517b e91eddffff                     jmp        0x7fbe283beb9e
05180 49baa8563a20be7f0000           movabs     r10, 0x7fbe203a56a8
0518a 4c89542408                     mov        qword ptr [rsp + 8], r10
0518f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05197 e8c4176007                     call       0x7fbe2f9c2660
0519c e935ddffff                     jmp        0x7fbe283bebd6
051a1 49ba38de5120be7f0000           movabs     r10, 0x7fbe2051de38
051ab 4c89542408                     mov        qword ptr [rsp + 8], r10
051b0 48c70424e8020000               mov        qword ptr [rsp], 0x2e8
051b8 e8a3176007                     call       0x7fbe2f9c2660
051bd e9e0ddffff                     jmp        0x7fbe283beca2
051c2 49bad0055220be7f0000           movabs     r10, 0x7fbe205205d0
051cc 4c89542408                     mov        qword ptr [rsp + 8], r10
051d1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
051d9 e882176007                     call       0x7fbe2f9c2660
051de e997dfffff                     jmp        0x7fbe283bee7a
051e3 49b80000000000000000           movabs     r8, 0
051ed b8000f050a                     mov        eax, 0xa050f00
051f2 e8690e6007                     call       0x7fbe2f9c1d60
051f7 e984dfffff                     jmp        0x7fbe283bee80
051fc 49ba38de5120be7f0000           movabs     r10, 0x7fbe2051de38
05206 4c89542408                     mov        qword ptr [rsp + 8], r10
0520b 48c7042420030000               mov        qword ptr [rsp], 0x320
05213 e848176007                     call       0x7fbe2f9c2660
05218 e9afe0ffff                     jmp        0x7fbe283befcc
0521d 49ba084f5320be7f0000           movabs     r10, 0x7fbe20534f08
05227 4c89542408                     mov        qword ptr [rsp + 8], r10
0522c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05234 e827176007                     call       0x7fbe2f9c2660
05239 e92de3ffff                     jmp        0x7fbe283bf26b
0523e e89db75f07                     call       0x7fbe2f9bc6e0
05243 49ba88326e20be7f0000           movabs     r10, 0x7fbe206e3288
0524d 4c89542408                     mov        qword ptr [rsp + 8], r10
05252 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0525a e801176007                     call       0x7fbe2f9c2660
0525f e9afe3ffff                     jmp        0x7fbe283bf313
05264 49ba88cc1620be7f0000           movabs     r10, 0x7fbe2016cc88
0526e 4c89542408                     mov        qword ptr [rsp + 8], r10
05273 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0527b e8e0166007                     call       0x7fbe2f9c2660
05280 e9c7e3ffff                     jmp        0x7fbe283bf34c
05285 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0528d e84ef85f07                     call       0x7fbe2f9c07e0
05292 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0529a e841f85f07                     call       0x7fbe2f9c07e0
0529f 49ba680d6720be7f0000           movabs     r10, 0x7fbe20670d68
052a9 4c89542408                     mov        qword ptr [rsp + 8], r10
052ae 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052b6 e8a5166007                     call       0x7fbe2f9c2660
052bb e952e4ffff                     jmp        0x7fbe283bf412
052c0 49bae8706720be7f0000           movabs     r10, 0x7fbe206770e8
052ca 4c89542408                     mov        qword ptr [rsp + 8], r10
052cf 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052d7 e884166007                     call       0x7fbe2f9c2660
052dc e964e4ffff                     jmp        0x7fbe283bf445
052e1 49ba40006a20be7f0000           movabs     r10, 0x7fbe206a0040
052eb 4c89542408                     mov        qword ptr [rsp + 8], r10
052f0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052f8 e863166007                     call       0x7fbe2f9c2660
052fd e99be4ffff                     jmp        0x7fbe283bf49d
05302 49bad0685320be7f0000           movabs     r10, 0x7fbe205368d0
0530c 4c89542408                     mov        qword ptr [rsp + 8], r10
05311 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05319 e842166007                     call       0x7fbe2f9c2660
0531e e9b0e4ffff                     jmp        0x7fbe283bf4d3
05323 49ba00c66920be7f0000           movabs     r10, 0x7fbe2069c600
0532d 4c89542408                     mov        qword ptr [rsp + 8], r10
05332 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0533a e821166007                     call       0x7fbe2f9c2660
0533f e9c2e4ffff                     jmp        0x7fbe283bf506
05344 49ba38815320be7f0000           movabs     r10, 0x7fbe20538138
0534e 4c89542408                     mov        qword ptr [rsp + 8], r10
05353 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0535b e800166007                     call       0x7fbe2f9c2660
05360 e9afe5ffff                     jmp        0x7fbe283bf614
05365 49bad07f4620be7f0000           movabs     r10, 0x7fbe20467fd0
0536f 4c89542408                     mov        qword ptr [rsp + 8], r10
05374 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0537c e8df156007                     call       0x7fbe2f9c2660
05381 e9cfe5ffff                     jmp        0x7fbe283bf655
05386 49baa8563a20be7f0000           movabs     r10, 0x7fbe203a56a8
05390 4c89542408                     mov        qword ptr [rsp + 8], r10
05395 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0539d e8be156007                     call       0x7fbe2f9c2660
053a2 e9e1e5ffff                     jmp        0x7fbe283bf688
053a7 48890424                       mov        qword ptr [rsp], rax
053ab e830de5f07                     call       0x7fbe2f9beee0
053b0 e82bb65f07                     call       0x7fbe2f9bc6e0
053b5 49ba985c5320be7f0000           movabs     r10, 0x7fbe20535c98
053bf 4c89542408                     mov        qword ptr [rsp + 8], r10
053c4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053cc e88f156007                     call       0x7fbe2f9c2660
053d1 e968e7ffff                     jmp        0x7fbe283bf83e
053d6 49ba88326e20be7f0000           movabs     r10, 0x7fbe206e3288
053e0 4c89542408                     mov        qword ptr [rsp + 8], r10
053e5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053ed e86e156007                     call       0x7fbe2f9c2660
053f2 e900e8ffff                     jmp        0x7fbe283bf8f7
053f7 49ba88cc1620be7f0000           movabs     r10, 0x7fbe2016cc88
05401 4c89542408                     mov        qword ptr [rsp + 8], r10
05406 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0540e e84d156007                     call       0x7fbe2f9c2660
05413 e927e8ffff                     jmp        0x7fbe283bf93f
05418 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05420 e8bbf65f07                     call       0x7fbe2f9c07e0
05425 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0542d e8aef65f07                     call       0x7fbe2f9c07e0
05432 e8a9b55f07                     call       0x7fbe2f9bc6e0
05437 49ba38815320be7f0000           movabs     r10, 0x7fbe20538138
05441 4c89542408                     mov        qword ptr [rsp + 8], r10
05446 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0544e e80d156007                     call       0x7fbe2f9c2660
05453 e9d1e9ffff                     jmp        0x7fbe283bfb29
05458 49bad07f4620be7f0000           movabs     r10, 0x7fbe20467fd0
05462 4c89542408                     mov        qword ptr [rsp + 8], r10
05467 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0546f e8ec146007                     call       0x7fbe2f9c2660
05474 e9fde9ffff                     jmp        0x7fbe283bfb76
05479 49baa8563a20be7f0000           movabs     r10, 0x7fbe203a56a8
05483 4c89542408                     mov        qword ptr [rsp + 8], r10
05488 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05490 e8cb146007                     call       0x7fbe2f9c2660
05495 e914eaffff                     jmp        0x7fbe283bfbae
0549a 49ba38de5120be7f0000           movabs     r10, 0x7fbe2051de38
054a4 4c89542408                     mov        qword ptr [rsp + 8], r10
054a9 48c704245a030000               mov        qword ptr [rsp], 0x35a
054b1 e8aa146007                     call       0x7fbe2f9c2660
054b6 e91eecffff                     jmp        0x7fbe283bfdd9
054bb e820b55f07                     call       0x7fbe2f9bc6e0
054c0 0f1f8000000000                 nop        dword ptr [rax]
054c7 e894a65307                     call       0x7fbe2f8fb860
054cc e96eeeffff                     jmp        0x7fbe283c003f
054d1 e80ab55f07                     call       0x7fbe2f9bc6e0
054d6 49ba60003c28be7f0000           movabs     r10, 0x7fbe283c0060
054e0 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
054e7 e9f4cc5307                     jmp        0x7fbe2f8fdee0
054ec 48ba0000000000000000           movabs     rdx, 0
054f6 b8000f050a                     mov        eax, 0xa050f00
054fb e860ff5f07                     call       0x7fbe2f9c1160
05500 e993eeffff                     jmp        0x7fbe283c0098
05505 e8d6b45f07                     call       0x7fbe2f9bc6e0
0550a 488bd2                         mov        rdx, rdx
0550d e84ec25f07                     call       0x7fbe2f9bd460
05512 e9d0eeffff                     jmp        0x7fbe283c00e7
05517 48ba0000000000000000           movabs     rdx, 0
05521 b8000f050a                     mov        eax, 0xa050f00
05526 e8350b6007                     call       0x7fbe2f9c1d60
0552b e9b8eeffff                     jmp        0x7fbe283c00e8
05530 48ba0000000000000000           movabs     rdx, 0
0553a b8000f050a                     mov        eax, 0xa050f00
0553f e81cff5f07                     call       0x7fbe2f9c1160
05544 e937efffff                     jmp        0x7fbe283c0180
05549 e892b45f07                     call       0x7fbe2f9bc6e0
0554e 488bd2                         mov        rdx, rdx
05551 e80ac25f07                     call       0x7fbe2f9bd460
05556 e974efffff                     jmp        0x7fbe283c01cf
0555b 48ba0000000000000000           movabs     rdx, 0
05565 b8000f050a                     mov        eax, 0xa050f00
0556a e8f1fe5f07                     call       0x7fbe2f9c1160
0556f e9acefffff                     jmp        0x7fbe283c0220
05574 e867b45f07                     call       0x7fbe2f9bc6e0
05579 488bd2                         mov        rdx, rdx
0557c e8dfc15f07                     call       0x7fbe2f9bd460
05581 e9e9efffff                     jmp        0x7fbe283c026f
05586 498b8778050000                 mov        rax, qword ptr [r15 + 0x578]
0558d 49c7877805000000000000         mov        qword ptr [r15 + 0x578], 0
05598 49c7878005000000000000         mov        qword ptr [r15 + 0x580], 0
055a3 4881c4d0030000                 add        rsp, 0x3d0
055aa 5d                             pop        rbp
055ab e930a55f07                     jmp        0x7fbe2f9bb7e0
