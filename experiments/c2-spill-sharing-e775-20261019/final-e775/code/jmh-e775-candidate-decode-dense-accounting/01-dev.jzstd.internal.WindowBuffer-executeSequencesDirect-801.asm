00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f8540a74b07                   jne        0x7f138f8f9960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ece0020000                 sub        rsp, 0x2e0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 7405                           je         0x7f138843f23f
0003a e861a84a07                     call       0x7f138f8e9aa0
0003f 898c2420010000                 mov        dword ptr [rsp + 0x120], ecx
00046 4c89842428010000               mov        qword ptr [rsp + 0x128], r8
0004e 4c898c2430010000               mov        qword ptr [rsp + 0x130], r9
00056 89bc2424010000                 mov        dword ptr [rsp + 0x124], edi
0005d 48bb00e04b78137f0000           movabs     rbx, 0x7f13784be000
00067 8b4370                         mov        eax, dword ptr [rbx + 0x70]
0006a 83c002                         add        eax, 2
0006d 894370                         mov        dword ptr [rbx + 0x70], eax
00070 25fe070000                     and        eax, 0x7fe
00075 85c0                           test       eax, eax
00077 0f849e470000                   je         0x7f1388443a1b
0007d 48bb00e04b78137f0000           movabs     rbx, 0x7f13784be000
00087 ff83a8000000                   inc        dword ptr [rbx + 0xa8]
0008d 8b9c24f0020000                 mov        ebx, dword ptr [rsp + 0x2f0]
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
000b9 48bf00e04b78137f0000           movabs     rdi, 0x7f13784be000
000c3 4889842438010000               mov        qword ptr [rsp + 0x138], rax
000cb b8f8000000                     mov        eax, 0xf8
000d0 7f05                           jg         0x7f138843f2d7
000d2 b808010000                     mov        eax, 0x108
000d7 44899c2440010000               mov        dword ptr [rsp + 0x140], r11d
000df 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
000e3 4d8d5b01                       lea        r11, [r11 + 1]
000e7 4c891c07                       mov        qword ptr [rdi + rax], r11
000eb 0f8fd0430000                   jg         0x7f13884436c1
000f1 4863db                         movsxd     rbx, ebx
000f4 488b7e20                       mov        rdi, qword ptr [rsi + 0x20]
000f8 492bf9                         sub        rdi, r9
000fb 483bfb                         cmp        rdi, rbx
000fe 48bf00e04b78137f0000           movabs     rdi, 0x7f13784be000
00108 b828010000                     mov        eax, 0x128
0010d 7c05                           jl         0x7f138843f314
0010f b818010000                     mov        eax, 0x118
00114 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
00118 4d8d5b01                       lea        r11, [r11 + 1]
0011c 4c891c07                       mov        qword ptr [rdi + rax], r11
00120 0f8c9b430000                   jl         0x7f13884436c1
00126 48bf00e04b78137f0000           movabs     rdi, 0x7f13784be000
00130 ff8758010000                   inc        dword ptr [rdi + 0x158]
00136 498bf8                         mov        rdi, r8
00139 4883ff00                       cmp        rdi, 0
0013d 48bf00e04b78137f0000           movabs     rdi, 0x7f13784be000
00147 b868010000                     mov        eax, 0x168
0014c 7505                           jne        0x7f138843f353
0014e b878010000                     mov        eax, 0x178
00153 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
00157 4d8d5b01                       lea        r11, [r11 + 1]
0015b 4c891c07                       mov        qword ptr [rdi + rax], r11
0015f 0f8531000000                   jne        0x7f138843f396
00165 4903d9                         add        rbx, r9
00168 488bf9                         mov        rdi, rcx
0016b 483bfb                         cmp        rdi, rbx
0016e 48bf00e04b78137f0000           movabs     rdi, 0x7f13784be000
00178 bb98010000                     mov        ebx, 0x198
0017d 7d05                           jge        0x7f138843f384
0017f bb88010000                     mov        ebx, 0x188
00184 488b041f                       mov        rax, qword ptr [rdi + rbx]
00188 488d4001                       lea        rax, [rax + 1]
0018c 4889041f                       mov        qword ptr [rdi + rbx], rax
00190 0f8d0a000000                   jge        0x7f138843f3a0
00196 bf00000000                     mov        edi, 0
0019b e915000000                     jmp        0x7f138843f3b5
001a0 48bf00e04b78137f0000           movabs     rdi, 0x7f13784be000
001aa ff87a8010000                   inc        dword ptr [rdi + 0x1a8]
001b0 bf01000000                     mov        edi, 1
001b5 4d2bc6                         sub        r8, r14
001b8 48bb00e04b78137f0000           movabs     rbx, 0x7f13784be000
001c2 488383c001000001               add        qword ptr [rbx + 0x1c0], 1
001ca 48bb284a068900000000           movabs     rbx, 0x89064a28
001d4 8b4370                         mov        eax, dword ptr [rbx + 0x70]
001d7 83c002                         add        eax, 2
001da 894370                         mov        dword ptr [rbx + 0x70], eax
001dd 25feff1f00                     and        eax, 0x1ffffe
001e2 85c0                           test       eax, eax
001e4 0f8452460000                   je         0x7f1388443a3c
001ea 48bbffffffffffffff7f           movabs     rbx, 0x7fffffffffffffff
001f4 483bd9                         cmp        rbx, rcx
001f7 48bb284a068900000000           movabs     rbx, 0x89064a28
00201 b8b8000000                     mov        eax, 0xb8
00206 7d05                           jge        0x7f138843f40d
00208 b8a8000000                     mov        eax, 0xa8
0020d 4c8b0c03                       mov        r9, qword ptr [rbx + rax]
00211 4d8d4901                       lea        r9, [r9 + 1]
00215 4c890c03                       mov        qword ptr [rbx + rax], r9
00219 0f8d0f000000                   jge        0x7f138843f42e
0021f 48b9ffffffffffffff7f           movabs     rcx, 0x7fffffffffffffff
00229 e910000000                     jmp        0x7f138843f43e
0022e 48bb284a068900000000           movabs     rbx, 0x89064a28
00238 ff83c8000000                   inc        dword ptr [rbx + 0xc8]
0023e 448b9c2440010000               mov        r11d, dword ptr [rsp + 0x140]
00246 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0024e 488b9c24f8020000               mov        rbx, qword ptr [rsp + 0x2f8]
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
002a9 4889942468010000               mov        qword ptr [rsp + 0x168], rdx
002b1 488b942448010000               mov        rdx, qword ptr [rsp + 0x148]
002b9 4889942470010000               mov        qword ptr [rsp + 0x170], rdx
002c1 ba00000000                     mov        edx, 0
002c6 899c2478010000                 mov        dword ptr [rsp + 0x178], ebx
002cd bb00000000                     mov        ebx, 0
002d2 44898c24f8010000               mov        dword ptr [rsp + 0x1f8], r9d
002da 89b424ec010000                 mov        dword ptr [rsp + 0x1ec], esi
002e1 48898c24f0010000               mov        qword ptr [rsp + 0x1f0], rcx
002e9 4c89842418020000               mov        qword ptr [rsp + 0x218], r8
002f1 89bc240c020000                 mov        dword ptr [rsp + 0x20c], edi
002f8 4c89b42420020000               mov        qword ptr [rsp + 0x220], r14
00300 4489ac24fc010000               mov        dword ptr [rsp + 0x1fc], r13d
00308 4c8bc3                         mov        r8, rbx
0030b 44899c2408020000               mov        dword ptr [rsp + 0x208], r11d
00313 4889842400020000               mov        qword ptr [rsp + 0x200], rax
0031b 0f1f440000                     nop        dword ptr [rax + rax]
00320 4c8b8c2450010000               mov        r9, qword ptr [rsp + 0x150]
00328 8b9c2444010000                 mov        ebx, dword ptr [rsp + 0x144]
0032f 488bbc2458010000               mov        rdi, qword ptr [rsp + 0x158]
00337 488bb42460010000               mov        rsi, qword ptr [rsp + 0x160]
0033f 8b842478010000                 mov        eax, dword ptr [rsp + 0x178]
00346 3bd3                           cmp        edx, ebx
00348 899c2444010000                 mov        dword ptr [rsp + 0x144], ebx
0034f 48bb00e04b78137f0000           movabs     rbx, 0x7f13784be000
00359 41bbd0010000                   mov        r11d, 0x1d0
0035f 7d06                           jge        0x7f138843f567
00361 41bbe0010000                   mov        r11d, 0x1e0
00367 4e8b2c1b                       mov        r13, qword ptr [rbx + r11]
0036b 4d8d6d01                       lea        r13, [r13 + 1]
0036f 4e892c1b                       mov        qword ptr [rbx + r11], r13
00373 0f8dbd3e0000                   jge        0x7f1388443436
00379 3b5604                         cmp        edx, dword ptr [rsi + 4]
0037c 0f83ea440000                   jae        0x7f1388443a6c
00382 4863ca                         movsxd     rcx, edx
00385 4c8b5cce08                     mov        r11, qword ptr [rsi + rcx*8 + 8]
0038a 418bcb                         mov        ecx, r11d
0038d 81e1ffff0100                   and        ecx, 0x1ffff
00393 898c2414020000                 mov        dword ptr [rsp + 0x214], ecx
0039a 4c8be9                         mov        r13, rcx
0039d b912000000                     mov        ecx, 0x12
003a2 4889b42460010000               mov        qword ptr [rsp + 0x160], rsi
003aa 498bf3                         mov        rsi, r11
003ad 48d3ee                         shr        rsi, cl
003b0 8bf6                           mov        esi, esi
003b2 81e6ffff0300                   and        esi, 0x3ffff
003b8 89b42410020000                 mov        dword ptr [rsp + 0x210], esi
003bf b924000000                     mov        ecx, 0x24
003c4 49d3fb                         sar        r11, cl
003c7 458bdb                         mov        r11d, r11d
003ca 4585db                         test       r11d, r11d
003cd 48b900e04b78137f0000           movabs     rcx, 0x7f13784be000
003d7 bef0010000                     mov        esi, 0x1f0
003dc 7d05                           jge        0x7f138843f5e3
003de be00020000                     mov        esi, 0x200
003e3 488b1c31                       mov        rbx, qword ptr [rcx + rsi]
003e7 488d5b01                       lea        rbx, [rbx + 1]
003eb 48891c31                       mov        qword ptr [rcx + rsi], rbx
003ef 0f8d13000000                   jge        0x7f138843f608
003f5 3b5704                         cmp        edx, dword ptr [rdi + 4]
003f8 0f8386440000                   jae        0x7f1388443a84
003fe 4863f2                         movsxd     rsi, edx
00401 8b74b708                       mov        esi, dword ptr [rdi + rsi*4 + 8]
00405 4c8bde                         mov        r11, rsi
00408 4585ed                         test       r13d, r13d
0040b 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
00415 b910020000                     mov        ecx, 0x210
0041a 7405                           je         0x7f138843f621
0041c b920020000                     mov        ecx, 0x220
00421 488b1c0e                       mov        rbx, qword ptr [rsi + rcx]
00425 488d5b01                       lea        rbx, [rbx + 1]
00429 48891c0e                       mov        qword ptr [rsi + rcx], rbx
0042d 0f8431000000                   je         0x7f138843f664
00433 488bd8                         mov        rbx, rax
00436 412bd8                         sub        ebx, r8d
00439 443beb                         cmp        r13d, ebx
0043c 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
00446 b940020000                     mov        ecx, 0x240
0044b 7f05                           jg         0x7f138843f652
0044d b930020000                     mov        ecx, 0x230
00452 488b1c0e                       mov        rbx, qword ptr [rsi + rcx]
00456 488d5b01                       lea        rbx, [rbx + 1]
0045a 48891c0e                       mov        qword ptr [rsi + rcx], rbx
0045e 0f8fbd3f0000                   jg         0x7f1388443621
00464 4183fb03                       cmp        r11d, 3
00468 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
00472 b960020000                     mov        ecx, 0x260
00477 7e05                           jle        0x7f138843f67e
00479 b970020000                     mov        ecx, 0x270
0047e 488b1c0e                       mov        rbx, qword ptr [rsi + rcx]
00482 488d5b01                       lea        rbx, [rbx + 1]
00486 48891c0e                       mov        qword ptr [rsi + rcx], rbx
0048a 0f8e9c000000                   jle        0x7f138843f72c
00490 4183eb03                       sub        r11d, 3
00494 4183790401                     cmp        dword ptr [r9 + 4], 1
00499 0f86fd430000                   jbe        0x7f1388443a9c
0049f 418b710c                       mov        esi, dword ptr [r9 + 0xc]
004a3 4183790402                     cmp        dword ptr [r9 + 4], 2
004a8 0f8600440000                   jbe        0x7f1388443aae
004ae 41897110                       mov        dword ptr [r9 + 0x10], esi
004b2 4183790400                     cmp        dword ptr [r9 + 4], 0
004b7 0f8603440000                   jbe        0x7f1388443ac0
004bd 418b7108                       mov        esi, dword ptr [r9 + 8]
004c1 4183790401                     cmp        dword ptr [r9 + 4], 1
004c6 0f8606440000                   jbe        0x7f1388443ad2
004cc 4189710c                       mov        dword ptr [r9 + 0xc], esi
004d0 4183790400                     cmp        dword ptr [r9 + 4], 0
004d5 0f8609440000                   jbe        0x7f1388443ae4
004db 45895908                       mov        dword ptr [r9 + 8], r11d
004df 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
004e9 ff8680020000                   inc        dword ptr [rsi + 0x280]
004ef 498bcd                         mov        rcx, r13
004f2 89942428020000                 mov        dword ptr [rsp + 0x228], edx
004f9 4c8bb42420020000               mov        r14, qword ptr [rsp + 0x220]
00501 44898424e8010000               mov        dword ptr [rsp + 0x1e8], r8d
00509 8b9c2408020000                 mov        ebx, dword ptr [rsp + 0x208]
00510 4c898c2450010000               mov        qword ptr [rsp + 0x150], r9
00518 4889bc2458010000               mov        qword ptr [rsp + 0x158], rdi
00520 89842478010000                 mov        dword ptr [rsp + 0x178], eax
00527 e969000000                     jmp        0x7f138843f795
0052c 89942428020000                 mov        dword ptr [rsp + 0x228], edx
00533 44898424e8010000               mov        dword ptr [rsp + 0x1e8], r8d
0053b 4889bc2458010000               mov        qword ptr [rsp + 0x158], rdi
00543 89842478010000                 mov        dword ptr [rsp + 0x178], eax
0054a 48bf00e04b78137f0000           movabs     rdi, 0x7f13784be000
00554 4883879802000001               add        qword ptr [rdi + 0x298], 1
0055c 498bf1                         mov        rsi, r9
0055f 498bd3                         mov        rdx, r11
00562 498bcd                         mov        rcx, r13
00565 4c898c2450010000               mov        qword ptr [rsp + 0x150], r9
0056d 6690                           nop        
0056f e8ecb04b07                     call       0x7f138f8fa860
00574 0f1f84006c060000               nop        dword ptr [rax + rax + 0x66c]
0057c 4c8bd8                         mov        r11, rax
0057f 8b8c2414020000                 mov        ecx, dword ptr [rsp + 0x214]
00586 4c8bb42420020000               mov        r14, qword ptr [rsp + 0x220]
0058e 8b9c2408020000                 mov        ebx, dword ptr [rsp + 0x208]
00595 4863f3                         movsxd     rsi, ebx
00598 4903f6                         add        rsi, r14
0059b 4863d1                         movsxd     rdx, ecx
0059e 4803f2                         add        rsi, rdx
005a1 4963fb                         movsxd     rdi, r11d
005a4 488bd6                         mov        rdx, rsi
005a7 483bd7                         cmp        rdx, rdi
005aa 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
005b4 41b8b8020000                   mov        r8d, 0x2b8
005ba 7d06                           jge        0x7f138843f7c2
005bc 41b8a8020000                   mov        r8d, 0x2a8
005c2 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
005c6 4d8d4901                       lea        r9, [r9 + 1]
005ca 4e890c02                       mov        qword ptr [rdx + r8], r9
005ce 0f8d14000000                   jge        0x7f138843f7e8
005d4 4c8b842418020000               mov        r8, qword ptr [rsp + 0x218]
005dc 8b84240c020000                 mov        eax, dword ptr [rsp + 0x20c]
005e3 e9b2000000                     jmp        0x7f138843f89a
005e8 8b84240c020000                 mov        eax, dword ptr [rsp + 0x20c]
005ef 85c0                           test       eax, eax
005f1 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
005fb 41b8c8020000                   mov        r8d, 0x2c8
00601 7506                           jne        0x7f138843f809
00603 41b8d8020000                   mov        r8d, 0x2d8
00609 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
0060d 4d8d4901                       lea        r9, [r9 + 1]
00611 4e890c02                       mov        qword ptr [rdx + r8], r9
00615 4c8b842418020000               mov        r8, qword ptr [rsp + 0x218]
0061d 0f856d000000                   jne        0x7f138843f890
00623 488bd3                         mov        rdx, rbx
00626 03d1                           add        edx, ecx
00628 412bd3                         sub        edx, r11d
0062b 4863d2                         movsxd     rdx, edx
0062e 493bd0                         cmp        rdx, r8
00631 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
0063b 41b9e8020000                   mov        r9d, 0x2e8
00641 7c06                           jl         0x7f138843f849
00643 41b9f8020000                   mov        r9d, 0x2f8
00649 4e8b2c0a                       mov        r13, qword ptr [rdx + r9]
0064d 4d8d6d01                       lea        r13, [r13 + 1]
00651 4e892c0a                       mov        qword ptr [rdx + r9], r13
00655 0f8c3f000000                   jl         0x7f138843f89a
0065b 488b9424f0010000               mov        rdx, qword ptr [rsp + 0x1f0]
00663 483bd7                         cmp        rdx, rdi
00666 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
00670 41b918030000                   mov        r9d, 0x318
00676 7c06                           jl         0x7f138843f87e
00678 41b908030000                   mov        r9d, 0x308
0067e 4e8b2c0a                       mov        r13, qword ptr [rdx + r9]
00682 4d8d6d01                       lea        r13, [r13 + 1]
00686 4e892c0a                       mov        qword ptr [rdx + r9], r13
0068a 0f8c0a000000                   jl         0x7f138843f89a
00690 ba00000000                     mov        edx, 0
00695 e915000000                     jmp        0x7f138843f8af
0069a 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
006a4 ff8228030000                   inc        dword ptr [rdx + 0x328]
006aa ba01000000                     mov        edx, 1
006af 4889bc2430020000               mov        qword ptr [rsp + 0x230], rdi
006b7 4585db                         test       r11d, r11d
006ba 49b900e04b78137f0000           movabs     r9, 0x7f13784be000
006c4 41bd40030000                   mov        r13d, 0x340
006ca 7e06                           jle        0x7f138843f8d2
006cc 41bd50030000                   mov        r13d, 0x350
006d2 4b8b3c29                       mov        rdi, qword ptr [r9 + r13]
006d6 488d7f01                       lea        rdi, [rdi + 1]
006da 4b893c29                       mov        qword ptr [r9 + r13], rdi
006de 0f8eab3a0000                   jle        0x7f138844338f
006e4 85d2                           test       edx, edx
006e6 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
006f0 41b970030000                   mov        r9d, 0x370
006f6 7506                           jne        0x7f138843f8fe
006f8 41b960030000                   mov        r9d, 0x360
006fe 4a8b3c0a                       mov        rdi, qword ptr [rdx + r9]
00702 488d7f01                       lea        rdi, [rdi + 1]
00706 4a893c0a                       mov        qword ptr [rdx + r9], rdi
0070a 0f857f3a0000                   jne        0x7f138844338f
00710 4c8beb                         mov        r13, rbx
00713 4403e9                         add        r13d, ecx
00716 4489ac2440020000               mov        dword ptr [rsp + 0x240], r13d
0071e 498bf5                         mov        rsi, r13
00721 03b42410020000                 add        esi, dword ptr [rsp + 0x210]
00728 3bb424ec010000                 cmp        esi, dword ptr [rsp + 0x1ec]
0072f 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
00739 ba28040000                     mov        edx, 0x428
0073e 7f05                           jg         0x7f138843f945
00740 ba38040000                     mov        edx, 0x438
00745 4c8b0c16                       mov        r9, qword ptr [rsi + rdx]
00749 4d8d4901                       lea        r9, [r9 + 1]
0074d 4c890c16                       mov        qword ptr [rsi + rdx], r9
00751 0f8f3f000000                   jg         0x7f138843f996
00757 8bbc24e8010000                 mov        edi, dword ptr [rsp + 0x1e8]
0075e 03f9                           add        edi, ecx
00760 89bc2438020000                 mov        dword ptr [rsp + 0x238], edi
00767 3bbc24f8010000                 cmp        edi, dword ptr [rsp + 0x1f8]
0076e 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
00778 ba58040000                     mov        edx, 0x458
0077d 7e05                           jle        0x7f138843f984
0077f ba48040000                     mov        edx, 0x448
00784 4c8b0c16                       mov        r9, qword ptr [rsi + rdx]
00788 4d8d4901                       lea        r9, [r9 + 1]
0078c 4c890c16                       mov        qword ptr [rsi + rdx], r9
00790 0f8e89000000                   jle        0x7f138843fa1f
00796 8bb42410020000                 mov        esi, dword ptr [rsp + 0x210]
0079d 4c89842418020000               mov        qword ptr [rsp + 0x218], r8
007a5 8984240c020000                 mov        dword ptr [rsp + 0x20c], eax
007ac 4c89b42420020000               mov        qword ptr [rsp + 0x220], r14
007b4 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
007be 4883821808000001               add        qword ptr [rdx + 0x818], 1
007c6 488bc6                         mov        rax, rsi
007c9 488bb42400020000               mov        rsi, qword ptr [rsp + 0x200]
007d1 488bd3                         mov        rdx, rbx
007d4 488bd9                         mov        rbx, rcx
007d7 8b8c24fc010000                 mov        ecx, dword ptr [rsp + 0x1fc]
007de 4c8b842468010000               mov        r8, qword ptr [rsp + 0x168]
007e6 448b8c24e8010000               mov        r9d, dword ptr [rsp + 0x1e8]
007ee 488bfb                         mov        rdi, rbx
007f1 44891c24                       mov        dword ptr [rsp], r11d
007f5 89442408                       mov        dword ptr [rsp + 8], eax
007f9 660f1f440000                   nop        word ptr [rax + rax]
007ff e85cae4b07                     call       0x7f138f8fa860
00804 0f1f8400fc080001               nop        dword ptr [rax + rax + 0x10008fc]
0080c 8b9c24e8010000                 mov        ebx, dword ptr [rsp + 0x1e8]
00813 039c2414020000                 add        ebx, dword ptr [rsp + 0x214]
0081a e91c390000                     jmp        0x7f138844333b
0081f 4c89842418020000               mov        qword ptr [rsp + 0x218], r8
00827 8984240c020000                 mov        dword ptr [rsp + 0x20c], eax
0082e 4c89b42420020000               mov        qword ptr [rsp + 0x220], r14
00836 8b842410020000                 mov        eax, dword ptr [rsp + 0x210]
0083d 83f910                         cmp        ecx, 0x10
00840 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
0084a ba68040000                     mov        edx, 0x468
0084f 7f05                           jg         0x7f138843fa56
00851 ba78040000                     mov        edx, 0x478
00856 4c8b0416                       mov        r8, qword ptr [rsi + rdx]
0085a 4d8d4001                       lea        r8, [r8 + 1]
0085e 4c890416                       mov        qword ptr [rsi + rdx], r8
00862 0f8f790a0000                   jg         0x7f13884404e1
00868 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
00870 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
0087a 4883868804000001               add        qword ptr [rsi + 0x488], 1
00882 48be18b32e78137f0000           movabs     rsi, 0x7f13782eb318
0088c 448b4670                       mov        r8d, dword ptr [rsi + 0x70]
00890 4183c002                       add        r8d, 2
00894 44894670                       mov        dword ptr [rsi + 0x70], r8d
00898 4181e0feff1f00                 and        r8d, 0x1ffffe
0089f 4585c0                         test       r8d, r8d
008a2 0f844e400000                   je         0x7f1388443af6
008a8 48be60e0bde200000000           movabs     rsi, 0xe2bde060
008b2 49b818b32e78137f0000           movabs     r8, 0x7f13782eb318
008bc 8b36                           mov        esi, dword ptr [rsi]
008be c1ee0d                         shr        esi, 0xd
008c1 48c1e60a                       shl        rsi, 0xa
008c5 41ba00000088                   mov        r10d, 0x88000000
008cb 4903f2                         add        rsi, r10
008ce 41ba16000000                   mov        r10d, 0x16
008d4 4b3b34d0                       cmp        rsi, qword ptr [r8 + r10*8]
008d8 7436                           je         0x7f138843fb10
008da 4983c202                       add        r10, 2
008de 4983fa1a                       cmp        r10, 0x1a
008e2 75f0                           jne        0x7f138843fad4
008e4 41ba16000000                   mov        r10d, 0x16
008ea 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
008ef 7412                           je         0x7f138843fb03
008f1 4983c202                       add        r10, 2
008f5 4983fa1a                       cmp        r10, 0x1a
008f9 75ef                           jne        0x7f138843faea
008fb 41ba15000000                   mov        r10d, 0x15
00901 eb11                           jmp        0x7f138843fb14
00903 50                             push       rax
00904 4833c0                         xor        rax, rax
00907 f04b0fb134d0                   lock cmpxchg qword ptr [r8 + r10*8], rsi
0090d 58                             pop        rax
0090e ebbe                           jmp        0x7f138843face
00910 4983c201                       add        r10, 1
00914 4b8304d001                     add        qword ptr [r8 + r10*8], 1
00919 8b7204                         mov        esi, dword ptr [rdx + 4]
0091c 49b818b32e78137f0000           movabs     r8, 0x7f13782eb318
00926 498380d800000001               add        qword ptr [r8 + 0xd8], 1
0092e 49b858a82e78137f0000           movabs     r8, 0x7f13782ea858
00938 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
0093c 4183c102                       add        r9d, 2
00940 45894870                       mov        dword ptr [r8 + 0x70], r9d
00944 4181e1feff1f00                 and        r9d, 0x1ffffe
0094b 4585c9                         test       r9d, r9d
0094e 0f84c83f0000                   je         0x7f1388443b1c
00954 448bb424e8010000               mov        r14d, dword ptr [rsp + 0x1e8]
0095c 49b858a82e78137f0000           movabs     r8, 0x7f13782ea858
00966 4983800801000001               add        qword ptr [r8 + 0x108], 1
0096e 83ee0f                         sub        esi, 0xf
00971 49b8d0771878137f0000           movabs     r8, 0x7f13781877d0
0097b 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
0097f 4183c102                       add        r9d, 2
00983 45894870                       mov        dword ptr [r8 + 0x70], r9d
00987 4181e1feff1f00                 and        r9d, 0x1ffffe
0098e 4585c9                         test       r9d, r9d
00991 0f84a63f0000                   je         0x7f1388443b3d
00997 49b8d0771878137f0000           movabs     r8, 0x7f13781877d0
009a1 498380a800000001               add        qword ptr [r8 + 0xa8], 1
009a9 49b80000000000000000           movabs     r8, 0
009b3 41b800000000                   mov        r8d, 0
009b9 453bf0                         cmp        r14d, r8d
009bc 0f8c9c3f0000                   jl         0x7f1388443b5e
009c2 443bf6                         cmp        r14d, esi
009c5 0f8da03f0000                   jge        0x7f1388443b6b
009cb 498bf6                         mov        rsi, r14
009ce 89b4242c020000                 mov        dword ptr [rsp + 0x22c], esi
009d5 49b860e0bde200000000           movabs     r8, 0xe2bde060
009df 4d8bc8                         mov        r9, r8
009e2 48be18b32e78137f0000           movabs     rsi, 0x7f13782eb318
009ec 458b09                         mov        r9d, dword ptr [r9]
009ef 41c1e90d                       shr        r9d, 0xd
009f3 49c1e10a                       shl        r9, 0xa
009f7 41ba00000088                   mov        r10d, 0x88000000
009fd 4d03ca                         add        r9, r10
00a00 41ba24000000                   mov        r10d, 0x24
00a06 4e3b0cd6                       cmp        r9, qword ptr [rsi + r10*8]
00a0a 7436                           je         0x7f138843fc42
00a0c 4983c202                       add        r10, 2
00a10 4983fa28                       cmp        r10, 0x28
00a14 75f0                           jne        0x7f138843fc06
00a16 41ba24000000                   mov        r10d, 0x24
00a1c 4a833cd600                     cmp        qword ptr [rsi + r10*8], 0
00a21 7412                           je         0x7f138843fc35
00a23 4983c202                       add        r10, 2
00a27 4983fa28                       cmp        r10, 0x28
00a2b 75ef                           jne        0x7f138843fc1c
00a2d 41ba23000000                   mov        r10d, 0x23
00a33 eb11                           jmp        0x7f138843fc46
00a35 50                             push       rax
00a36 4833c0                         xor        rax, rax
00a39 f04e0fb10cd6                   lock cmpxchg qword ptr [rsi + r10*8], r9
00a3f 58                             pop        rax
00a40 ebbe                           jmp        0x7f138843fc00
00a42 4983c201                       add        r10, 1
00a46 4a8304d601                     add        qword ptr [rsi + r10*8], 1
00a4b 48be28a12e78137f0000           movabs     rsi, 0x7f13782ea128
00a55 448b4e70                       mov        r9d, dword ptr [rsi + 0x70]
00a59 4183c102                       add        r9d, 2
00a5d 44894e70                       mov        dword ptr [rsi + 0x70], r9d
00a61 4181e1feff1f00                 and        r9d, 0x1ffffe
00a68 4585c9                         test       r9d, r9d
00a6b 0f84073f0000                   je         0x7f1388443b78
00a71 48be28a12e78137f0000           movabs     rsi, 0x7f13782ea128
00a7b 488386a800000001               add        qword ptr [rsi + 0xa8], 1
00a83 48be50a22e78137f0000           movabs     rsi, 0x7f13782ea250
00a8d 448b4670                       mov        r8d, dword ptr [rsi + 0x70]
00a91 4183c002                       add        r8d, 2
00a95 44894670                       mov        dword ptr [rsi + 0x70], r8d
00a99 4181e0feff1f00                 and        r8d, 0x1ffffe
00aa0 4585c0                         test       r8d, r8d
00aa3 0f84f03e0000                   je         0x7f1388443b99
00aa9 48be50a22e78137f0000           movabs     rsi, 0x7f13782ea250
00ab3 ff86b8000000                   inc        dword ptr [rsi + 0xb8]
00ab9 8bb4242c020000                 mov        esi, dword ptr [rsp + 0x22c]
00ac0 44899c243c020000               mov        dword ptr [rsp + 0x23c], r11d
00ac8 4489b424e8010000               mov        dword ptr [rsp + 0x1e8], r14d
00ad0 899c2408020000                 mov        dword ptr [rsp + 0x208], ebx
00ad7 49b85860bee200000000           movabs     r8, 0xe2be6058
00ae1 4d8bc8                         mov        r9, r8
00ae4 48bb18b32e78137f0000           movabs     rbx, 0x7f13782eb318
00aee 4883835801000001               add        qword ptr [rbx + 0x158], 1
00af6 49b9e0b42e78137f0000           movabs     r9, 0x7f13782eb4e0
00b00 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
00b04 83c302                         add        ebx, 2
00b07 41895970                       mov        dword ptr [r9 + 0x70], ebx
00b0b 81e3feff1f00                   and        ebx, 0x1ffffe
00b11 85db                           test       ebx, ebx
00b13 0f84a13e0000                   je         0x7f1388443bba
00b19 4d8bc8                         mov        r9, r8
00b1c 48bbe0b42e78137f0000           movabs     rbx, 0x7f13782eb4e0
00b26 488383a800000001               add        qword ptr [rbx + 0xa8], 1
00b2e 49b9c0b52e78137f0000           movabs     r9, 0x7f13782eb5c0
00b38 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
00b3c 83c302                         add        ebx, 2
00b3f 41895970                       mov        dword ptr [r9 + 0x70], ebx
00b43 81e3feff1f00                   and        ebx, 0x1ffffe
00b49 85db                           test       ebx, ebx
00b4b 0f848a3e0000                   je         0x7f1388443bdb
00b51 49b9c0b52e78137f0000           movabs     r9, 0x7f13782eb5c0
00b5b 498381b800000001               add        qword ptr [r9 + 0xb8], 1
00b63 49b8d0a92e78137f0000           movabs     r8, 0x7f13782ea9d0
00b6d 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
00b71 4183c102                       add        r9d, 2
00b75 45894870                       mov        dword ptr [r8 + 0x70], r9d
00b79 4181e1feff1f00                 and        r9d, 0x1ffffe
00b80 4585c9                         test       r9d, r9d
00b83 0f84733e0000                   je         0x7f1388443bfc
00b89 49b860e0bde200000000           movabs     r8, 0xe2bde060
00b93 4d8bc8                         mov        r9, r8
00b96 48bbc0b52e78137f0000           movabs     rbx, 0x7f13782eb5c0
00ba0 458b09                         mov        r9d, dword ptr [r9]
00ba3 41c1e90d                       shr        r9d, 0xd
00ba7 49c1e10a                       shl        r9, 0xa
00bab 41ba00000088                   mov        r10d, 0x88000000
00bb1 4d03ca                         add        r9, r10
00bb4 41ba1c000000                   mov        r10d, 0x1c
00bba 4e3b0cd3                       cmp        r9, qword ptr [rbx + r10*8]
00bbe 7436                           je         0x7f138843fdf6
00bc0 4983c202                       add        r10, 2
00bc4 4983fa20                       cmp        r10, 0x20
00bc8 75f0                           jne        0x7f138843fdba
00bca 41ba1c000000                   mov        r10d, 0x1c
00bd0 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00bd5 7412                           je         0x7f138843fde9
00bd7 4983c202                       add        r10, 2
00bdb 4983fa20                       cmp        r10, 0x20
00bdf 75ef                           jne        0x7f138843fdd0
00be1 41ba1b000000                   mov        r10d, 0x1b
00be7 eb11                           jmp        0x7f138843fdfa
00be9 50                             push       rax
00bea 4833c0                         xor        rax, rax
00bed f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
00bf3 58                             pop        rax
00bf4 ebbe                           jmp        0x7f138843fdb4
00bf6 4983c201                       add        r10, 1
00bfa 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00bff 49b9c0b52e78137f0000           movabs     r9, 0x7f13782eb5c0
00c09 458b00                         mov        r8d, dword ptr [r8]
00c0c 41c1e80d                       shr        r8d, 0xd
00c10 49c1e00a                       shl        r8, 0xa
00c14 41ba00000088                   mov        r10d, 0x88000000
00c1a 4d03c2                         add        r8, r10
00c1d 41ba22000000                   mov        r10d, 0x22
00c23 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
00c27 7436                           je         0x7f138843fe5f
00c29 4983c202                       add        r10, 2
00c2d 4983fa26                       cmp        r10, 0x26
00c31 75f0                           jne        0x7f138843fe23
00c33 41ba22000000                   mov        r10d, 0x22
00c39 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
00c3e 7412                           je         0x7f138843fe52
00c40 4983c202                       add        r10, 2
00c44 4983fa26                       cmp        r10, 0x26
00c48 75ef                           jne        0x7f138843fe39
00c4a 41ba21000000                   mov        r10d, 0x21
00c50 eb11                           jmp        0x7f138843fe63
00c52 50                             push       rax
00c53 4833c0                         xor        rax, rax
00c56 f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
00c5c 58                             pop        rax
00c5d ebbe                           jmp        0x7f138843fe1d
00c5f 4983c201                       add        r10, 1
00c63 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00c68 49b8c0b52e78137f0000           movabs     r8, 0x7f13782eb5c0
00c72 4983803801000001               add        qword ptr [r8 + 0x138], 1
00c7a 49b890aa2e78137f0000           movabs     r8, 0x7f13782eaa90
00c84 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
00c88 4183c102                       add        r9d, 2
00c8c 45894870                       mov        dword ptr [r8 + 0x70], r9d
00c90 4181e1feff1f00                 and        r9d, 0x1ffffe
00c97 4585c9                         test       r9d, r9d
00c9a 0f847d3d0000                   je         0x7f1388443c1d
00ca0 49b8c0b52e78137f0000           movabs     r8, 0x7f13782eb5c0
00caa 4983804801000001               add        qword ptr [r8 + 0x148], 1
00cb2 4863de                         movsxd     rbx, esi
00cb5 be08000000                     mov        esi, 8
00cba 4c8bcb                         mov        r9, rbx
00cbd 4c03ce                         add        r9, rsi
00cc0 48be789e2e78137f0000           movabs     rsi, 0x7f13782e9e78
00cca 448b4670                       mov        r8d, dword ptr [rsi + 0x70]
00cce 4183c002                       add        r8d, 2
00cd2 44894670                       mov        dword ptr [rsi + 0x70], r8d
00cd6 4181e0feff1f00                 and        r8d, 0x1ffffe
00cdd 4585c0                         test       r8d, r8d
00ce0 0f84583d0000                   je         0x7f1388443c3e
00ce6 48be789e2e78137f0000           movabs     rsi, 0x7f13782e9e78
00cf0 488386d800000001               add        qword ptr [rsi + 0xd8], 1
00cf8 48bef09f2e78137f0000           movabs     rsi, 0x7f13782e9ff0
00d02 448b4670                       mov        r8d, dword ptr [rsi + 0x70]
00d06 4183c002                       add        r8d, 2
00d0a 44894670                       mov        dword ptr [rsi + 0x70], r8d
00d0e 4181e0feff1f00                 and        r8d, 0x1ffffe
00d15 4585c0                         test       r8d, r8d
00d18 0f84413d0000                   je         0x7f1388443c5f
00d1e 48bec0b52e78137f0000           movabs     rsi, 0x7f13782eb5c0
00d28 4883866801000001               add        qword ptr [rsi + 0x168], 1
00d30 48be28b9bee200000000           movabs     rsi, 0xe2beb928
00d3a 48bea8e0bde200000000           movabs     rsi, 0xe2bde0a8
00d44 488bc2                         mov        rax, rdx
00d47 ba02000000                     mov        edx, 2
00d4c b910000000                     mov        ecx, 0x10
00d51 4c8bc0                         mov        r8, rax
00d54 bf00000000                     mov        edi, 0
00d59 48890424                       mov        qword ptr [rsp], rax
00d5d 48895c2408                     mov        qword ptr [rsp + 8], rbx
00d62 49ba60e0bde200000000           movabs     r10, 0xe2bde060
00d6c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00d71 49ba28b9bee200000000           movabs     r10, 0xe2beb928
00d7b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d80 4889842468010000               mov        qword ptr [rsp + 0x168], rax
00d88 0f1f8000000000                 nop        dword ptr [rax]
00d8f e86c55a307                     call       0x7f138fe75500
00d94 0f1f84008c0e0002               nop        dword ptr [rax + rax + 0x2000e8c]
00d9c 4885c0                         test       rax, rax
00d9f 48bbc0b52e78137f0000           movabs     rbx, 0x7f13782eb5c0
00da9 750c                           jne        0x7f138843ffb7
00dab 808b7101000001                 or         byte ptr [rbx + 0x171], 1
00db2 e988000000                     jmp        0x7f138844003f
00db7 8b38                           mov        edi, dword ptr [rax]
00db9 c1ef0d                         shr        edi, 0xd
00dbc 48c1e70a                       shl        rdi, 0xa
00dc0 41ba00000088                   mov        r10d, 0x88000000
00dc6 4903fa                         add        rdi, r10
00dc9 41ba30000000                   mov        r10d, 0x30
00dcf 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
00dd3 7436                           je         0x7f138844000b
00dd5 4983c202                       add        r10, 2
00dd9 4983fa34                       cmp        r10, 0x34
00ddd 75f0                           jne        0x7f138843ffcf
00ddf 41ba30000000                   mov        r10d, 0x30
00de5 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00dea 7412                           je         0x7f138843fffe
00dec 4983c202                       add        r10, 2
00df0 4983fa34                       cmp        r10, 0x34
00df4 75ef                           jne        0x7f138843ffe5
00df6 41ba2f000000                   mov        r10d, 0x2f
00dfc eb11                           jmp        0x7f138844000f
00dfe 50                             push       rax
00dff 4833c0                         xor        rax, rax
00e02 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
00e08 58                             pop        rax
00e09 ebbe                           jmp        0x7f138843ffc9
00e0b 4983c201                       add        r10, 1
00e0f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00e14 48bf00dc0c8900000000           movabs     rdi, 0x890cdc00
00e1e 8b18                           mov        ebx, dword ptr [rax]
00e20 c1eb0d                         shr        ebx, 0xd
00e23 48c1e30a                       shl        rbx, 0xa
00e27 41ba00000088                   mov        r10d, 0x88000000
00e2d 4903da                         add        rbx, r10
00e30 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
00e34 0f85463c0000                   jne        0x7f1388443c80
00e3a e900000000                     jmp        0x7f138844003f
00e3f 488bf8                         mov        rdi, rax
00e42 4889bc2448020000               mov        qword ptr [rsp + 0x248], rdi
00e4a 483b07                         cmp        rax, qword ptr [rdi]
00e4d 488bf7                         mov        rsi, rdi
00e50 48bb00e04b78137f0000           movabs     rbx, 0x7f13784be000
00e5a 8b36                           mov        esi, dword ptr [rsi]
00e5c c1ee0d                         shr        esi, 0xd
00e5f 48c1e60a                       shl        rsi, 0xa
00e63 41ba00000088                   mov        r10d, 0x88000000
00e69 4903f2                         add        rsi, r10
00e6c 41ba94000000                   mov        r10d, 0x94
00e72 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00e76 743c                           je         0x7f13884400b4
00e78 4983c202                       add        r10, 2
00e7c 4981fa98000000                 cmp        r10, 0x98
00e83 75ed                           jne        0x7f1388440072
00e85 41ba94000000                   mov        r10d, 0x94
00e8b 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00e90 7415                           je         0x7f13884400a7
00e92 4983c202                       add        r10, 2
00e96 4981fa98000000                 cmp        r10, 0x98
00e9d 75ec                           jne        0x7f138844008b
00e9f 41ba93000000                   mov        r10d, 0x93
00ea5 eb11                           jmp        0x7f13884400b8
00ea7 50                             push       rax
00ea8 4833c0                         xor        rax, rax
00eab f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00eb1 58                             pop        rax
00eb2 ebb8                           jmp        0x7f138844006c
00eb4 4983c201                       add        r10, 1
00eb8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00ebd 48bed8bf2e78137f0000           movabs     rsi, 0x7f13782ebfd8
00ec7 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
00eca 83c302                         add        ebx, 2
00ecd 895e70                         mov        dword ptr [rsi + 0x70], ebx
00ed0 81e3feff1f00                   and        ebx, 0x1ffffe
00ed6 85db                           test       ebx, ebx
00ed8 0f84b03b0000                   je         0x7f1388443c8e
00ede 488bf7                         mov        rsi, rdi
00ee1 48bbd8bf2e78137f0000           movabs     rbx, 0x7f13782ebfd8
00eeb 8b36                           mov        esi, dword ptr [rsi]
00eed c1ee0d                         shr        esi, 0xd
00ef0 48c1e60a                       shl        rsi, 0xa
00ef4 41ba00000088                   mov        r10d, 0x88000000
00efa 4903f2                         add        rsi, r10
00efd 41ba16000000                   mov        r10d, 0x16
00f03 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00f07 7436                           je         0x7f138844013f
00f09 4983c202                       add        r10, 2
00f0d 4983fa1a                       cmp        r10, 0x1a
00f11 75f0                           jne        0x7f1388440103
00f13 41ba16000000                   mov        r10d, 0x16
00f19 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00f1e 7412                           je         0x7f1388440132
00f20 4983c202                       add        r10, 2
00f24 4983fa1a                       cmp        r10, 0x1a
00f28 75ef                           jne        0x7f1388440119
00f2a 41ba15000000                   mov        r10d, 0x15
00f30 eb11                           jmp        0x7f1388440143
00f32 50                             push       rax
00f33 4833c0                         xor        rax, rax
00f36 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00f3c 58                             pop        rax
00f3d ebbe                           jmp        0x7f13884400fd
00f3f 4983c201                       add        r10, 1
00f43 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00f48 488bf7                         mov        rsi, rdi
00f4b 6690                           nop        
00f4d 48b810612464137f0000           movabs     rax, 0x7f1364246110
00f57 e8b33da307                     call       0x7f138fe73f0f
00f5c 0f1f840054100003               nop        dword ptr [rax + rax + 0x3001054]
00f64 488bbc2400020000               mov        rdi, qword ptr [rsp + 0x200]
00f6c 8b7704                         mov        esi, dword ptr [rdi + 4]
00f6f 48bbd8bf2e78137f0000           movabs     rbx, 0x7f13782ebfd8
00f79 488383d800000001               add        qword ptr [rbx + 0xd8], 1
00f81 48bb58a82e78137f0000           movabs     rbx, 0x7f13782ea858
00f8b 8b5370                         mov        edx, dword ptr [rbx + 0x70]
00f8e 83c202                         add        edx, 2
00f91 895370                         mov        dword ptr [rbx + 0x70], edx
00f94 81e2feff1f00                   and        edx, 0x1ffffe
00f9a 85d2                           test       edx, edx
00f9c 0f84123b0000                   je         0x7f1388443cb4
00fa2 448b9c2408020000               mov        r11d, dword ptr [rsp + 0x208]
00faa 48bb58a82e78137f0000           movabs     rbx, 0x7f13782ea858
00fb4 4883830801000001               add        qword ptr [rbx + 0x108], 1
00fbc ffc8                           dec        eax
00fbe 2bf0                           sub        esi, eax
00fc0 48bbd0771878137f0000           movabs     rbx, 0x7f13781877d0
00fca 8b4370                         mov        eax, dword ptr [rbx + 0x70]
00fcd 83c002                         add        eax, 2
00fd0 894370                         mov        dword ptr [rbx + 0x70], eax
00fd3 25feff1f00                     and        eax, 0x1ffffe
00fd8 85c0                           test       eax, eax
00fda 0f84f53a0000                   je         0x7f1388443cd5
00fe0 48bbd0771878137f0000           movabs     rbx, 0x7f13781877d0
00fea 488383a800000001               add        qword ptr [rbx + 0xa8], 1
00ff2 48bb0000000000000000           movabs     rbx, 0
00ffc bb00000000                     mov        ebx, 0
01001 443bdb                         cmp        r11d, ebx
01004 0f8cec3a0000                   jl         0x7f1388443cf6
0100a 443bde                         cmp        r11d, esi
0100d 0f8df03a0000                   jge        0x7f1388443d03
01013 498bdb                         mov        rbx, r11
01016 899c2444020000                 mov        dword ptr [rsp + 0x244], ebx
0101d 44899c2408020000               mov        dword ptr [rsp + 0x208], r11d
01025 4889bc2400020000               mov        qword ptr [rsp + 0x200], rdi
0102d 488bbc2448020000               mov        rdi, qword ptr [rsp + 0x248]
01035 488bf7                         mov        rsi, rdi
01038 48bad8bf2e78137f0000           movabs     rdx, 0x7f13782ebfd8
01042 8b36                           mov        esi, dword ptr [rsi]
01044 c1ee0d                         shr        esi, 0xd
01047 48c1e60a                       shl        rsi, 0xa
0104b 41ba00000088                   mov        r10d, 0x88000000
01051 4903f2                         add        rsi, r10
01054 41ba1e000000                   mov        r10d, 0x1e
0105a 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
0105e 7436                           je         0x7f1388440296
01060 4983c202                       add        r10, 2
01064 4983fa22                       cmp        r10, 0x22
01068 75f0                           jne        0x7f138844025a
0106a 41ba1e000000                   mov        r10d, 0x1e
01070 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01075 7412                           je         0x7f1388440289
01077 4983c202                       add        r10, 2
0107b 4983fa22                       cmp        r10, 0x22
0107f 75ef                           jne        0x7f1388440270
01081 41ba1d000000                   mov        r10d, 0x1d
01087 eb11                           jmp        0x7f138844029a
01089 50                             push       rax
0108a 4833c0                         xor        rax, rax
0108d f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01093 58                             pop        rax
01094 ebbe                           jmp        0x7f1388440254
01096 4983c201                       add        r10, 1
0109a 4a8304d201                     add        qword ptr [rdx + r10*8], 1
0109f 488bf7                         mov        rsi, rdi
010a2 666690                         nop        
010a5 48b838612464137f0000           movabs     rax, 0x7f1364246138
010af e85b3fa307                     call       0x7f138fe7420f
010b4 0f1f8400ac110004               nop        dword ptr [rax + rax + 0x40011ac]
010bc 483b00                         cmp        rax, qword ptr [rax]
010bf 488bf0                         mov        rsi, rax
010c2 48bad8bf2e78137f0000           movabs     rdx, 0x7f13782ebfd8
010cc 8b36                           mov        esi, dword ptr [rsi]
010ce c1ee0d                         shr        esi, 0xd
010d1 48c1e60a                       shl        rsi, 0xa
010d5 41ba00000088                   mov        r10d, 0x88000000
010db 4903f2                         add        rsi, r10
010de 41ba24000000                   mov        r10d, 0x24
010e4 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
010e8 7436                           je         0x7f1388440320
010ea 4983c202                       add        r10, 2
010ee 4983fa28                       cmp        r10, 0x28
010f2 75f0                           jne        0x7f13884402e4
010f4 41ba24000000                   mov        r10d, 0x24
010fa 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
010ff 7412                           je         0x7f1388440313
01101 4983c202                       add        r10, 2
01105 4983fa28                       cmp        r10, 0x28
01109 75ef                           jne        0x7f13884402fa
0110b 41ba23000000                   mov        r10d, 0x23
01111 eb11                           jmp        0x7f1388440324
01113 50                             push       rax
01114 4833c0                         xor        rax, rax
01117 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
0111d 58                             pop        rax
0111e ebbe                           jmp        0x7f13884402de
01120 4983c201                       add        r10, 1
01124 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01129 8b7024                         mov        esi, dword ptr [rax + 0x24]
0112c 488bd0                         mov        rdx, rax
0112f 48b9d8bf2e78137f0000           movabs     rcx, 0x7f13782ebfd8
01139 8b12                           mov        edx, dword ptr [rdx]
0113b c1ea0d                         shr        edx, 0xd
0113e 48c1e20a                       shl        rdx, 0xa
01142 41ba00000088                   mov        r10d, 0x88000000
01148 4903d2                         add        rdx, r10
0114b 41ba2a000000                   mov        r10d, 0x2a
01151 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01155 7436                           je         0x7f138844038d
01157 4983c202                       add        r10, 2
0115b 4983fa2e                       cmp        r10, 0x2e
0115f 75f0                           jne        0x7f1388440351
01161 41ba2a000000                   mov        r10d, 0x2a
01167 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0116c 7412                           je         0x7f1388440380
0116e 4983c202                       add        r10, 2
01172 4983fa2e                       cmp        r10, 0x2e
01176 75ef                           jne        0x7f1388440367
01178 41ba29000000                   mov        r10d, 0x29
0117e eb11                           jmp        0x7f1388440391
01180 50                             push       rax
01181 4833c0                         xor        rax, rax
01184 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
0118a 58                             pop        rax
0118b ebbe                           jmp        0x7f138844034b
0118d 4983c201                       add        r10, 1
01191 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01196 8b4804                         mov        ecx, dword ptr [rax + 4]
01199 48bad8bf2e78137f0000           movabs     rdx, 0x7f13782ebfd8
011a3 4883827801000001               add        qword ptr [rdx + 0x178], 1
011ab 48ba90aa2e78137f0000           movabs     rdx, 0x7f13782eaa90
011b5 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
011b9 4183c002                       add        r8d, 2
011bd 44894270                       mov        dword ptr [rdx + 0x70], r8d
011c1 4181e0feff1f00                 and        r8d, 0x1ffffe
011c8 4585c0                         test       r8d, r8d
011cb 0f8444390000                   je         0x7f1388443d15
011d1 48bad8bf2e78137f0000           movabs     rdx, 0x7f13782ebfd8
011db 4883828801000001               add        qword ptr [rdx + 0x188], 1
011e3 8b9c2444020000                 mov        ebx, dword ptr [rsp + 0x244]
011ea 4863db                         movsxd     rbx, ebx
011ed ba08000000                     mov        edx, 8
011f2 4c8bcb                         mov        r9, rbx
011f5 4c03ca                         add        r9, rdx
011f8 48ba789e2e78137f0000           movabs     rdx, 0x7f13782e9e78
01202 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01206 4183c002                       add        r8d, 2
0120a 44894270                       mov        dword ptr [rdx + 0x70], r8d
0120e 4181e0feff1f00                 and        r8d, 0x1ffffe
01215 4585c0                         test       r8d, r8d
01218 0f8418390000                   je         0x7f1388443d36
0121e 48ba789e2e78137f0000           movabs     rdx, 0x7f13782e9e78
01228 488382d800000001               add        qword ptr [rdx + 0xd8], 1
01230 48baf09f2e78137f0000           movabs     rdx, 0x7f13782e9ff0
0123a 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
0123e 4183c002                       add        r8d, 2
01242 44894270                       mov        dword ptr [rdx + 0x70], r8d
01246 4181e0feff1f00                 and        r8d, 0x1ffffe
0124d 4585c0                         test       r8d, r8d
01250 0f8401390000                   je         0x7f1388443d57
01256 48bad8bf2e78137f0000           movabs     rdx, 0x7f13782ebfd8
01260 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
01268 48bac857bfe200000000           movabs     rdx, 0xe2bf57c8
01272 ba02000000                     mov        edx, 2
01277 4c8b842400020000               mov        r8, qword ptr [rsp + 0x200]
0127f bf00000000                     mov        edi, 0
01284 488b842448020000               mov        rax, qword ptr [rsp + 0x248]
0128c 48890424                       mov        qword ptr [rsp], rax
01290 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
01298 4889442408                     mov        qword ptr [rsp + 8], rax
0129d 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
012a2 49bac857bfe200000000           movabs     r10, 0xe2bf57c8
012ac 4c89542418                     mov        qword ptr [rsp + 0x18], r10
012b1 4889842400020000               mov        qword ptr [rsp + 0x200], rax
012b9 660f1f440000                   nop        word ptr [rax + rax]
012bf e8bc6ca307                     call       0x7f138fe77180
012c4 0f1f8400bc130005               nop        dword ptr [rax + rax + 0x50013bc]
012cc 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
012d6 ff86c8040000                   inc        dword ptr [rsi + 0x4c8]
012dc e9c80b0000                     jmp        0x7f13884410a9
012e1 44899c243c020000               mov        dword ptr [rsp + 0x23c], r11d
012e9 899c2408020000                 mov        dword ptr [rsp + 0x208], ebx
012f0 83f930                         cmp        ecx, 0x30
012f3 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
012fd bae0040000                     mov        edx, 0x4e0
01302 7f05                           jg         0x7f1388440509
01304 baf0040000                     mov        edx, 0x4f0
01309 4c8b0416                       mov        r8, qword ptr [rsi + rdx]
0130d 4d8d4001                       lea        r8, [r8 + 1]
01311 4c890416                       mov        qword ptr [rsi + rdx], r8
01315 0f8ff80a0000                   jg         0x7f1388441013
0131b 8b9c24e8010000                 mov        ebx, dword ptr [rsp + 0x1e8]
01322 448b9c2408020000               mov        r11d, dword ptr [rsp + 0x208]
0132a 660f1f440000                   nop        word ptr [rax + rax]
01330 44899c2454020000               mov        dword ptr [rsp + 0x254], r11d
01338 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
01340 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
0134a 4883860005000001               add        qword ptr [rsi + 0x500], 1
01352 48be18b32e78137f0000           movabs     rsi, 0x7f13782eb318
0135c 448b4670                       mov        r8d, dword ptr [rsi + 0x70]
01360 4183c002                       add        r8d, 2
01364 44894670                       mov        dword ptr [rsi + 0x70], r8d
01368 4181e0feff1f00                 and        r8d, 0x1ffffe
0136f 4585c0                         test       r8d, r8d
01372 0f8400380000                   je         0x7f1388443d78
01378 48be60e0bde200000000           movabs     rsi, 0xe2bde060
01382 49b818b32e78137f0000           movabs     r8, 0x7f13782eb318
0138c 8b36                           mov        esi, dword ptr [rsi]
0138e c1ee0d                         shr        esi, 0xd
01391 48c1e60a                       shl        rsi, 0xa
01395 41ba00000088                   mov        r10d, 0x88000000
0139b 4903f2                         add        rsi, r10
0139e 41ba16000000                   mov        r10d, 0x16
013a4 4b3b34d0                       cmp        rsi, qword ptr [r8 + r10*8]
013a8 7436                           je         0x7f13884405e0
013aa 4983c202                       add        r10, 2
013ae 4983fa1a                       cmp        r10, 0x1a
013b2 75f0                           jne        0x7f13884405a4
013b4 41ba16000000                   mov        r10d, 0x16
013ba 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
013bf 7412                           je         0x7f13884405d3
013c1 4983c202                       add        r10, 2
013c5 4983fa1a                       cmp        r10, 0x1a
013c9 75ef                           jne        0x7f13884405ba
013cb 41ba15000000                   mov        r10d, 0x15
013d1 eb11                           jmp        0x7f13884405e4
013d3 50                             push       rax
013d4 4833c0                         xor        rax, rax
013d7 f04b0fb134d0                   lock cmpxchg qword ptr [r8 + r10*8], rsi
013dd 58                             pop        rax
013de ebbe                           jmp        0x7f138844059e
013e0 4983c201                       add        r10, 1
013e4 4b8304d001                     add        qword ptr [r8 + r10*8], 1
013e9 8b7204                         mov        esi, dword ptr [rdx + 4]
013ec 49b818b32e78137f0000           movabs     r8, 0x7f13782eb318
013f6 498380d800000001               add        qword ptr [r8 + 0xd8], 1
013fe 49b858a82e78137f0000           movabs     r8, 0x7f13782ea858
01408 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
0140c 4183c102                       add        r9d, 2
01410 45894870                       mov        dword ptr [r8 + 0x70], r9d
01414 4181e1feff1f00                 and        r9d, 0x1ffffe
0141b 4585c9                         test       r9d, r9d
0141e 0f847a370000                   je         0x7f1388443d9e
01424 49b858a82e78137f0000           movabs     r8, 0x7f13782ea858
0142e 4983800801000001               add        qword ptr [r8 + 0x108], 1
01436 83ee0f                         sub        esi, 0xf
01439 49b8d0771878137f0000           movabs     r8, 0x7f13781877d0
01443 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
01447 4183c102                       add        r9d, 2
0144b 45894870                       mov        dword ptr [r8 + 0x70], r9d
0144f 4181e1feff1f00                 and        r9d, 0x1ffffe
01456 4585c9                         test       r9d, r9d
01459 0f8460370000                   je         0x7f1388443dbf
0145f 49b8d0771878137f0000           movabs     r8, 0x7f13781877d0
01469 498380a800000001               add        qword ptr [r8 + 0xa8], 1
01471 49b80000000000000000           movabs     r8, 0
0147b 41b800000000                   mov        r8d, 0
01481 413bd8                         cmp        ebx, r8d
01484 0f8c56370000                   jl         0x7f1388443de0
0148a 3bde                           cmp        ebx, esi
0148c 0f8d5b370000                   jge        0x7f1388443ded
01492 488bf3                         mov        rsi, rbx
01495 49b860e0bde200000000           movabs     r8, 0xe2bde060
0149f 4d8bc8                         mov        r9, r8
014a2 48bf18b32e78137f0000           movabs     rdi, 0x7f13782eb318
014ac 458b09                         mov        r9d, dword ptr [r9]
014af 41c1e90d                       shr        r9d, 0xd
014b3 49c1e10a                       shl        r9, 0xa
014b7 41ba00000088                   mov        r10d, 0x88000000
014bd 4d03ca                         add        r9, r10
014c0 41ba24000000                   mov        r10d, 0x24
014c6 4e3b0cd7                       cmp        r9, qword ptr [rdi + r10*8]
014ca 7436                           je         0x7f1388440702
014cc 4983c202                       add        r10, 2
014d0 4983fa28                       cmp        r10, 0x28
014d4 75f0                           jne        0x7f13884406c6
014d6 41ba24000000                   mov        r10d, 0x24
014dc 4a833cd700                     cmp        qword ptr [rdi + r10*8], 0
014e1 7412                           je         0x7f13884406f5
014e3 4983c202                       add        r10, 2
014e7 4983fa28                       cmp        r10, 0x28
014eb 75ef                           jne        0x7f13884406dc
014ed 41ba23000000                   mov        r10d, 0x23
014f3 eb11                           jmp        0x7f1388440706
014f5 50                             push       rax
014f6 4833c0                         xor        rax, rax
014f9 f04e0fb10cd7                   lock cmpxchg qword ptr [rdi + r10*8], r9
014ff 58                             pop        rax
01500 ebbe                           jmp        0x7f13884406c0
01502 4983c201                       add        r10, 1
01506 4a8304d701                     add        qword ptr [rdi + r10*8], 1
0150b 49b928a12e78137f0000           movabs     r9, 0x7f13782ea128
01515 418b7970                       mov        edi, dword ptr [r9 + 0x70]
01519 83c702                         add        edi, 2
0151c 41897970                       mov        dword ptr [r9 + 0x70], edi
01520 81e7feff1f00                   and        edi, 0x1ffffe
01526 85ff                           test       edi, edi
01528 0f84cc360000                   je         0x7f1388443dfa
0152e 49b928a12e78137f0000           movabs     r9, 0x7f13782ea128
01538 498381a800000001               add        qword ptr [r9 + 0xa8], 1
01540 49b850a22e78137f0000           movabs     r8, 0x7f13782ea250
0154a 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
0154e 4183c102                       add        r9d, 2
01552 45894870                       mov        dword ptr [r8 + 0x70], r9d
01556 4181e1feff1f00                 and        r9d, 0x1ffffe
0155d 4585c9                         test       r9d, r9d
01560 0f84b5360000                   je         0x7f1388443e1b
01566 49b850a22e78137f0000           movabs     r8, 0x7f13782ea250
01570 41ff80b8000000                 inc        dword ptr [r8 + 0xb8]
01577 899c2450020000                 mov        dword ptr [rsp + 0x250], ebx
0157e 49b85860bee200000000           movabs     r8, 0xe2be6058
01588 4d8bc8                         mov        r9, r8
0158b 48bf18b32e78137f0000           movabs     rdi, 0x7f13782eb318
01595 4883875801000001               add        qword ptr [rdi + 0x158], 1
0159d 49b9e0b42e78137f0000           movabs     r9, 0x7f13782eb4e0
015a7 418b7970                       mov        edi, dword ptr [r9 + 0x70]
015ab 83c702                         add        edi, 2
015ae 41897970                       mov        dword ptr [r9 + 0x70], edi
015b2 81e7feff1f00                   and        edi, 0x1ffffe
015b8 85ff                           test       edi, edi
015ba 0f847c360000                   je         0x7f1388443e3c
015c0 4d8bc8                         mov        r9, r8
015c3 48bfe0b42e78137f0000           movabs     rdi, 0x7f13782eb4e0
015cd 488387a800000001               add        qword ptr [rdi + 0xa8], 1
015d5 49b9c0b52e78137f0000           movabs     r9, 0x7f13782eb5c0
015df 418b7970                       mov        edi, dword ptr [r9 + 0x70]
015e3 83c702                         add        edi, 2
015e6 41897970                       mov        dword ptr [r9 + 0x70], edi
015ea 81e7feff1f00                   and        edi, 0x1ffffe
015f0 85ff                           test       edi, edi
015f2 0f8465360000                   je         0x7f1388443e5d
015f8 49b9c0b52e78137f0000           movabs     r9, 0x7f13782eb5c0
01602 498381b800000001               add        qword ptr [r9 + 0xb8], 1
0160a 49b8d0a92e78137f0000           movabs     r8, 0x7f13782ea9d0
01614 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
01618 4183c102                       add        r9d, 2
0161c 45894870                       mov        dword ptr [r8 + 0x70], r9d
01620 4181e1feff1f00                 and        r9d, 0x1ffffe
01627 4585c9                         test       r9d, r9d
0162a 0f844e360000                   je         0x7f1388443e7e
01630 49b860e0bde200000000           movabs     r8, 0xe2bde060
0163a 4d8bc8                         mov        r9, r8
0163d 48bfc0b52e78137f0000           movabs     rdi, 0x7f13782eb5c0
01647 458b09                         mov        r9d, dword ptr [r9]
0164a 41c1e90d                       shr        r9d, 0xd
0164e 49c1e10a                       shl        r9, 0xa
01652 41ba00000088                   mov        r10d, 0x88000000
01658 4d03ca                         add        r9, r10
0165b 41ba1c000000                   mov        r10d, 0x1c
01661 4e3b0cd7                       cmp        r9, qword ptr [rdi + r10*8]
01665 7436                           je         0x7f138844089d
01667 4983c202                       add        r10, 2
0166b 4983fa20                       cmp        r10, 0x20
0166f 75f0                           jne        0x7f1388440861
01671 41ba1c000000                   mov        r10d, 0x1c
01677 4a833cd700                     cmp        qword ptr [rdi + r10*8], 0
0167c 7412                           je         0x7f1388440890
0167e 4983c202                       add        r10, 2
01682 4983fa20                       cmp        r10, 0x20
01686 75ef                           jne        0x7f1388440877
01688 41ba1b000000                   mov        r10d, 0x1b
0168e eb11                           jmp        0x7f13884408a1
01690 50                             push       rax
01691 4833c0                         xor        rax, rax
01694 f04e0fb10cd7                   lock cmpxchg qword ptr [rdi + r10*8], r9
0169a 58                             pop        rax
0169b ebbe                           jmp        0x7f138844085b
0169d 4983c201                       add        r10, 1
016a1 4a8304d701                     add        qword ptr [rdi + r10*8], 1
016a6 49b9c0b52e78137f0000           movabs     r9, 0x7f13782eb5c0
016b0 458b00                         mov        r8d, dword ptr [r8]
016b3 41c1e80d                       shr        r8d, 0xd
016b7 49c1e00a                       shl        r8, 0xa
016bb 41ba00000088                   mov        r10d, 0x88000000
016c1 4d03c2                         add        r8, r10
016c4 41ba22000000                   mov        r10d, 0x22
016ca 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
016ce 7436                           je         0x7f1388440906
016d0 4983c202                       add        r10, 2
016d4 4983fa26                       cmp        r10, 0x26
016d8 75f0                           jne        0x7f13884408ca
016da 41ba22000000                   mov        r10d, 0x22
016e0 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
016e5 7412                           je         0x7f13884408f9
016e7 4983c202                       add        r10, 2
016eb 4983fa26                       cmp        r10, 0x26
016ef 75ef                           jne        0x7f13884408e0
016f1 41ba21000000                   mov        r10d, 0x21
016f7 eb11                           jmp        0x7f138844090a
016f9 50                             push       rax
016fa 4833c0                         xor        rax, rax
016fd f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
01703 58                             pop        rax
01704 ebbe                           jmp        0x7f13884408c4
01706 4983c201                       add        r10, 1
0170a 4b8304d101                     add        qword ptr [r9 + r10*8], 1
0170f 49b8c0b52e78137f0000           movabs     r8, 0x7f13782eb5c0
01719 4983803801000001               add        qword ptr [r8 + 0x138], 1
01721 49b890aa2e78137f0000           movabs     r8, 0x7f13782eaa90
0172b 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
0172f 4183c102                       add        r9d, 2
01733 45894870                       mov        dword ptr [r8 + 0x70], r9d
01737 4181e1feff1f00                 and        r9d, 0x1ffffe
0173e 4585c9                         test       r9d, r9d
01741 0f8458350000                   je         0x7f1388443e9f
01747 49b8c0b52e78137f0000           movabs     r8, 0x7f13782eb5c0
01751 4983804801000001               add        qword ptr [r8 + 0x148], 1
01759 4c63f6                         movsxd     r14, esi
0175c be08000000                     mov        esi, 8
01761 4d8bce                         mov        r9, r14
01764 4c03ce                         add        r9, rsi
01767 48be789e2e78137f0000           movabs     rsi, 0x7f13782e9e78
01771 448b4670                       mov        r8d, dword ptr [rsi + 0x70]
01775 4183c002                       add        r8d, 2
01779 44894670                       mov        dword ptr [rsi + 0x70], r8d
0177d 4181e0feff1f00                 and        r8d, 0x1ffffe
01784 4585c0                         test       r8d, r8d
01787 0f8433350000                   je         0x7f1388443ec0
0178d 48be789e2e78137f0000           movabs     rsi, 0x7f13782e9e78
01797 488386d800000001               add        qword ptr [rsi + 0xd8], 1
0179f 48bef09f2e78137f0000           movabs     rsi, 0x7f13782e9ff0
017a9 448b4670                       mov        r8d, dword ptr [rsi + 0x70]
017ad 4183c002                       add        r8d, 2
017b1 44894670                       mov        dword ptr [rsi + 0x70], r8d
017b5 4181e0feff1f00                 and        r8d, 0x1ffffe
017bc 4585c0                         test       r8d, r8d
017bf 0f841c350000                   je         0x7f1388443ee1
017c5 48bec0b52e78137f0000           movabs     rsi, 0x7f13782eb5c0
017cf 4883866801000001               add        qword ptr [rsi + 0x168], 1
017d7 48be28b9bee200000000           movabs     rsi, 0xe2beb928
017e1 48bea8e0bde200000000           movabs     rsi, 0xe2bde0a8
017eb 488bfa                         mov        rdi, rdx
017ee ba02000000                     mov        edx, 2
017f3 b910000000                     mov        ecx, 0x10
017f8 4c8bc7                         mov        r8, rdi
017fb 488bdf                         mov        rbx, rdi
017fe bf00000000                     mov        edi, 0
01803 48891c24                       mov        qword ptr [rsp], rbx
01807 4c89742408                     mov        qword ptr [rsp + 8], r14
0180c 49ba60e0bde200000000           movabs     r10, 0xe2bde060
01816 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0181b 49ba28b9bee200000000           movabs     r10, 0xe2beb928
01825 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0182a 48899c2468010000               mov        qword ptr [rsp + 0x168], rbx
01832 0f1f440000                     nop        dword ptr [rax + rax]
01837 e8249e4b07                     call       0x7f138f8fa860
0183c 0f1f840034190006               nop        dword ptr [rax + rax + 0x6001934]
01844 4885c0                         test       rax, rax
01847 48bbc0b52e78137f0000           movabs     rbx, 0x7f13782eb5c0
01851 750c                           jne        0x7f1388440a5f
01853 808b7101000001                 or         byte ptr [rbx + 0x171], 1
0185a e988000000                     jmp        0x7f1388440ae7
0185f 8b38                           mov        edi, dword ptr [rax]
01861 c1ef0d                         shr        edi, 0xd
01864 48c1e70a                       shl        rdi, 0xa
01868 41ba00000088                   mov        r10d, 0x88000000
0186e 4903fa                         add        rdi, r10
01871 41ba30000000                   mov        r10d, 0x30
01877 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
0187b 7436                           je         0x7f1388440ab3
0187d 4983c202                       add        r10, 2
01881 4983fa34                       cmp        r10, 0x34
01885 75f0                           jne        0x7f1388440a77
01887 41ba30000000                   mov        r10d, 0x30
0188d 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01892 7412                           je         0x7f1388440aa6
01894 4983c202                       add        r10, 2
01898 4983fa34                       cmp        r10, 0x34
0189c 75ef                           jne        0x7f1388440a8d
0189e 41ba2f000000                   mov        r10d, 0x2f
018a4 eb11                           jmp        0x7f1388440ab7
018a6 50                             push       rax
018a7 4833c0                         xor        rax, rax
018aa f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
018b0 58                             pop        rax
018b1 ebbe                           jmp        0x7f1388440a71
018b3 4983c201                       add        r10, 1
018b7 4a8304d301                     add        qword ptr [rbx + r10*8], 1
018bc 48bf00dc0c8900000000           movabs     rdi, 0x890cdc00
018c6 8b18                           mov        ebx, dword ptr [rax]
018c8 c1eb0d                         shr        ebx, 0xd
018cb 48c1e30a                       shl        rbx, 0xa
018cf 41ba00000088                   mov        r10d, 0x88000000
018d5 4903da                         add        rbx, r10
018d8 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
018dc 0f8520340000                   jne        0x7f1388443f02
018e2 e900000000                     jmp        0x7f1388440ae7
018e7 488bf8                         mov        rdi, rax
018ea 4889bc2458020000               mov        qword ptr [rsp + 0x258], rdi
018f2 483b07                         cmp        rax, qword ptr [rdi]
018f5 488bf7                         mov        rsi, rdi
018f8 48bb00e04b78137f0000           movabs     rbx, 0x7f13784be000
01902 8b36                           mov        esi, dword ptr [rsi]
01904 c1ee0d                         shr        esi, 0xd
01907 48c1e60a                       shl        rsi, 0xa
0190b 41ba00000088                   mov        r10d, 0x88000000
01911 4903f2                         add        rsi, r10
01914 41baa3000000                   mov        r10d, 0xa3
0191a 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
0191e 743c                           je         0x7f1388440b5c
01920 4983c202                       add        r10, 2
01924 4981faa7000000                 cmp        r10, 0xa7
0192b 75ed                           jne        0x7f1388440b1a
0192d 41baa3000000                   mov        r10d, 0xa3
01933 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01938 7415                           je         0x7f1388440b4f
0193a 4983c202                       add        r10, 2
0193e 4981faa7000000                 cmp        r10, 0xa7
01945 75ec                           jne        0x7f1388440b33
01947 41baa2000000                   mov        r10d, 0xa2
0194d eb11                           jmp        0x7f1388440b60
0194f 50                             push       rax
01950 4833c0                         xor        rax, rax
01953 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01959 58                             pop        rax
0195a ebb8                           jmp        0x7f1388440b14
0195c 4983c201                       add        r10, 1
01960 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01965 48bed8bf2e78137f0000           movabs     rsi, 0x7f13782ebfd8
0196f 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
01972 83c302                         add        ebx, 2
01975 895e70                         mov        dword ptr [rsi + 0x70], ebx
01978 81e3feff1f00                   and        ebx, 0x1ffffe
0197e 85db                           test       ebx, ebx
01980 0f848a330000                   je         0x7f1388443f10
01986 488bf7                         mov        rsi, rdi
01989 48bbd8bf2e78137f0000           movabs     rbx, 0x7f13782ebfd8
01993 8b36                           mov        esi, dword ptr [rsi]
01995 c1ee0d                         shr        esi, 0xd
01998 48c1e60a                       shl        rsi, 0xa
0199c 41ba00000088                   mov        r10d, 0x88000000
019a2 4903f2                         add        rsi, r10
019a5 41ba16000000                   mov        r10d, 0x16
019ab 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
019af 7436                           je         0x7f1388440be7
019b1 4983c202                       add        r10, 2
019b5 4983fa1a                       cmp        r10, 0x1a
019b9 75f0                           jne        0x7f1388440bab
019bb 41ba16000000                   mov        r10d, 0x16
019c1 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
019c6 7412                           je         0x7f1388440bda
019c8 4983c202                       add        r10, 2
019cc 4983fa1a                       cmp        r10, 0x1a
019d0 75ef                           jne        0x7f1388440bc1
019d2 41ba15000000                   mov        r10d, 0x15
019d8 eb11                           jmp        0x7f1388440beb
019da 50                             push       rax
019db 4833c0                         xor        rax, rax
019de f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
019e4 58                             pop        rax
019e5 ebbe                           jmp        0x7f1388440ba5
019e7 4983c201                       add        r10, 1
019eb 4a8304d301                     add        qword ptr [rbx + r10*8], 1
019f0 488bf7                         mov        rsi, rdi
019f3 6690                           nop        
019f5 48b860612464137f0000           movabs     rax, 0x7f1364246160
019ff e85c974b07                     call       0x7f138f8fa360
01a04 0f1f8400fc1a0007               nop        dword ptr [rax + rax + 0x7001afc]
01a0c 488bbc2400020000               mov        rdi, qword ptr [rsp + 0x200]
01a14 8b7704                         mov        esi, dword ptr [rdi + 4]
01a17 48bbd8bf2e78137f0000           movabs     rbx, 0x7f13782ebfd8
01a21 488383d800000001               add        qword ptr [rbx + 0xd8], 1
01a29 48bb58a82e78137f0000           movabs     rbx, 0x7f13782ea858
01a33 8b5370                         mov        edx, dword ptr [rbx + 0x70]
01a36 83c202                         add        edx, 2
01a39 895370                         mov        dword ptr [rbx + 0x70], edx
01a3c 81e2feff1f00                   and        edx, 0x1ffffe
01a42 85d2                           test       edx, edx
01a44 0f84ec320000                   je         0x7f1388443f36
01a4a 448b9c2454020000               mov        r11d, dword ptr [rsp + 0x254]
01a52 48bb58a82e78137f0000           movabs     rbx, 0x7f13782ea858
01a5c 4883830801000001               add        qword ptr [rbx + 0x108], 1
01a64 ffc8                           dec        eax
01a66 2bf0                           sub        esi, eax
01a68 48bbd0771878137f0000           movabs     rbx, 0x7f13781877d0
01a72 8b4370                         mov        eax, dword ptr [rbx + 0x70]
01a75 83c002                         add        eax, 2
01a78 894370                         mov        dword ptr [rbx + 0x70], eax
01a7b 25feff1f00                     and        eax, 0x1ffffe
01a80 85c0                           test       eax, eax
01a82 0f84cf320000                   je         0x7f1388443f57
01a88 48bbd0771878137f0000           movabs     rbx, 0x7f13781877d0
01a92 488383a800000001               add        qword ptr [rbx + 0xa8], 1
01a9a 48bb0000000000000000           movabs     rbx, 0
01aa4 bb00000000                     mov        ebx, 0
01aa9 443bdb                         cmp        r11d, ebx
01aac 0f8cc6320000                   jl         0x7f1388443f78
01ab2 443bde                         cmp        r11d, esi
01ab5 0f8dca320000                   jge        0x7f1388443f85
01abb 498bdb                         mov        rbx, r11
01abe 899c2460020000                 mov        dword ptr [rsp + 0x260], ebx
01ac5 44899c2454020000               mov        dword ptr [rsp + 0x254], r11d
01acd 4889bc2400020000               mov        qword ptr [rsp + 0x200], rdi
01ad5 488bbc2458020000               mov        rdi, qword ptr [rsp + 0x258]
01add 488bf7                         mov        rsi, rdi
01ae0 48bad8bf2e78137f0000           movabs     rdx, 0x7f13782ebfd8
01aea 8b36                           mov        esi, dword ptr [rsi]
01aec c1ee0d                         shr        esi, 0xd
01aef 48c1e60a                       shl        rsi, 0xa
01af3 41ba00000088                   mov        r10d, 0x88000000
01af9 4903f2                         add        rsi, r10
01afc 41ba1e000000                   mov        r10d, 0x1e
01b02 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01b06 7436                           je         0x7f1388440d3e
01b08 4983c202                       add        r10, 2
01b0c 4983fa22                       cmp        r10, 0x22
01b10 75f0                           jne        0x7f1388440d02
01b12 41ba1e000000                   mov        r10d, 0x1e
01b18 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01b1d 7412                           je         0x7f1388440d31
01b1f 4983c202                       add        r10, 2
01b23 4983fa22                       cmp        r10, 0x22
01b27 75ef                           jne        0x7f1388440d18
01b29 41ba1d000000                   mov        r10d, 0x1d
01b2f eb11                           jmp        0x7f1388440d42
01b31 50                             push       rax
01b32 4833c0                         xor        rax, rax
01b35 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01b3b 58                             pop        rax
01b3c ebbe                           jmp        0x7f1388440cfc
01b3e 4983c201                       add        r10, 1
01b42 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01b47 488bf7                         mov        rsi, rdi
01b4a 666690                         nop        
01b4d 48b888612464137f0000           movabs     rax, 0x7f1364246188
01b57 e804964b07                     call       0x7f138f8fa360
01b5c 0f1f8400541c0008               nop        dword ptr [rax + rax + 0x8001c54]
01b64 483b00                         cmp        rax, qword ptr [rax]
01b67 488bf0                         mov        rsi, rax
01b6a 48bad8bf2e78137f0000           movabs     rdx, 0x7f13782ebfd8
01b74 8b36                           mov        esi, dword ptr [rsi]
01b76 c1ee0d                         shr        esi, 0xd
01b79 48c1e60a                       shl        rsi, 0xa
01b7d 41ba00000088                   mov        r10d, 0x88000000
01b83 4903f2                         add        rsi, r10
01b86 41ba24000000                   mov        r10d, 0x24
01b8c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01b90 7436                           je         0x7f1388440dc8
01b92 4983c202                       add        r10, 2
01b96 4983fa28                       cmp        r10, 0x28
01b9a 75f0                           jne        0x7f1388440d8c
01b9c 41ba24000000                   mov        r10d, 0x24
01ba2 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01ba7 7412                           je         0x7f1388440dbb
01ba9 4983c202                       add        r10, 2
01bad 4983fa28                       cmp        r10, 0x28
01bb1 75ef                           jne        0x7f1388440da2
01bb3 41ba23000000                   mov        r10d, 0x23
01bb9 eb11                           jmp        0x7f1388440dcc
01bbb 50                             push       rax
01bbc 4833c0                         xor        rax, rax
01bbf f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01bc5 58                             pop        rax
01bc6 ebbe                           jmp        0x7f1388440d86
01bc8 4983c201                       add        r10, 1
01bcc 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01bd1 8b7024                         mov        esi, dword ptr [rax + 0x24]
01bd4 488bd0                         mov        rdx, rax
01bd7 48b9d8bf2e78137f0000           movabs     rcx, 0x7f13782ebfd8
01be1 8b12                           mov        edx, dword ptr [rdx]
01be3 c1ea0d                         shr        edx, 0xd
01be6 48c1e20a                       shl        rdx, 0xa
01bea 41ba00000088                   mov        r10d, 0x88000000
01bf0 4903d2                         add        rdx, r10
01bf3 41ba2a000000                   mov        r10d, 0x2a
01bf9 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01bfd 7436                           je         0x7f1388440e35
01bff 4983c202                       add        r10, 2
01c03 4983fa2e                       cmp        r10, 0x2e
01c07 75f0                           jne        0x7f1388440df9
01c09 41ba2a000000                   mov        r10d, 0x2a
01c0f 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01c14 7412                           je         0x7f1388440e28
01c16 4983c202                       add        r10, 2
01c1a 4983fa2e                       cmp        r10, 0x2e
01c1e 75ef                           jne        0x7f1388440e0f
01c20 41ba29000000                   mov        r10d, 0x29
01c26 eb11                           jmp        0x7f1388440e39
01c28 50                             push       rax
01c29 4833c0                         xor        rax, rax
01c2c f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
01c32 58                             pop        rax
01c33 ebbe                           jmp        0x7f1388440df3
01c35 4983c201                       add        r10, 1
01c39 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01c3e 8b4804                         mov        ecx, dword ptr [rax + 4]
01c41 48bad8bf2e78137f0000           movabs     rdx, 0x7f13782ebfd8
01c4b 4883827801000001               add        qword ptr [rdx + 0x178], 1
01c53 48ba90aa2e78137f0000           movabs     rdx, 0x7f13782eaa90
01c5d 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01c61 4183c002                       add        r8d, 2
01c65 44894270                       mov        dword ptr [rdx + 0x70], r8d
01c69 4181e0feff1f00                 and        r8d, 0x1ffffe
01c70 4585c0                         test       r8d, r8d
01c73 0f841e310000                   je         0x7f1388443f97
01c79 48bad8bf2e78137f0000           movabs     rdx, 0x7f13782ebfd8
01c83 4883828801000001               add        qword ptr [rdx + 0x188], 1
01c8b 8b9c2460020000                 mov        ebx, dword ptr [rsp + 0x260]
01c92 4863db                         movsxd     rbx, ebx
01c95 ba08000000                     mov        edx, 8
01c9a 4c8bcb                         mov        r9, rbx
01c9d 4c03ca                         add        r9, rdx
01ca0 48ba789e2e78137f0000           movabs     rdx, 0x7f13782e9e78
01caa 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01cae 4183c002                       add        r8d, 2
01cb2 44894270                       mov        dword ptr [rdx + 0x70], r8d
01cb6 4181e0feff1f00                 and        r8d, 0x1ffffe
01cbd 4585c0                         test       r8d, r8d
01cc0 0f84f2300000                   je         0x7f1388443fb8
01cc6 48ba789e2e78137f0000           movabs     rdx, 0x7f13782e9e78
01cd0 488382d800000001               add        qword ptr [rdx + 0xd8], 1
01cd8 48baf09f2e78137f0000           movabs     rdx, 0x7f13782e9ff0
01ce2 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01ce6 4183c002                       add        r8d, 2
01cea 44894270                       mov        dword ptr [rdx + 0x70], r8d
01cee 4181e0feff1f00                 and        r8d, 0x1ffffe
01cf5 4585c0                         test       r8d, r8d
01cf8 0f84db300000                   je         0x7f1388443fd9
01cfe 48bad8bf2e78137f0000           movabs     rdx, 0x7f13782ebfd8
01d08 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
01d10 48bac857bfe200000000           movabs     rdx, 0xe2bf57c8
01d1a ba02000000                     mov        edx, 2
01d1f 4c8b842400020000               mov        r8, qword ptr [rsp + 0x200]
01d27 bf00000000                     mov        edi, 0
01d2c 488b842458020000               mov        rax, qword ptr [rsp + 0x258]
01d34 48890424                       mov        qword ptr [rsp], rax
01d38 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
01d40 4889442408                     mov        qword ptr [rsp + 8], rax
01d45 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01d4a 49bac857bfe200000000           movabs     r10, 0xe2bf57c8
01d54 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d59 4889842400020000               mov        qword ptr [rsp + 0x200], rax
01d61 660f1f440000                   nop        word ptr [rax + rax]
01d67 e8f4984b07                     call       0x7f138f8fa860
01d6c 0f1f8400641e0009               nop        dword ptr [rax + rax + 0x9001e64]
01d74 448b9c2454020000               mov        r11d, dword ptr [rsp + 0x254]
01d7c 4183c310                       add        r11d, 0x10
01d80 8b9c2450020000                 mov        ebx, dword ptr [rsp + 0x250]
01d87 83c310                         add        ebx, 0x10
01d8a 443b9c2440020000               cmp        r11d, dword ptr [rsp + 0x240]
01d92 be02000000                     mov        esi, 2
01d97 7c05                           jl         0x7f1388440f9e
01d99 be00000000                     mov        esi, 0
01d9e 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
01da8 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
01dab 03ce                           add        ecx, esi
01dad 894a74                         mov        dword ptr [rdx + 0x74], ecx
01db0 85f6                           test       esi, esi
01db2 7505                           jne        0x7f1388440fb9
01db4 b902000000                     mov        ecx, 2
01db9 81e1fe3f0000                   and        ecx, 0x3ffe
01dbf 85c9                           test       ecx, ecx
01dc1 0f8433300000                   je         0x7f1388443ffa
01dc7 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01dcb 418502                         test       dword ptr [r10], eax
01dce 443b9c2440020000               cmp        r11d, dword ptr [rsp + 0x240]
01dd6 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
01de0 ba40050000                     mov        edx, 0x540
01de5 7c05                           jl         0x7f1388440fec
01de7 ba50050000                     mov        edx, 0x550
01dec 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
01df0 488d4901                       lea        rcx, [rcx + 1]
01df4 48890c16                       mov        qword ptr [rsi + rdx], rcx
01df8 0f8c32f5ffff                   jl         0x7f1388440530
01dfe 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
01e08 ff8660050000                   inc        dword ptr [rsi + 0x560]
01e0e e996000000                     jmp        0x7f13884410a9
01e13 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
01e1d 4883867805000001               add        qword ptr [rsi + 0x578], 1
01e25 488bb42468010000               mov        rsi, qword ptr [rsp + 0x168]
01e2d 8b9424e8010000                 mov        edx, dword ptr [rsp + 0x1e8]
01e34 488bd9                         mov        rbx, rcx
01e37 488b8c2400020000               mov        rcx, qword ptr [rsp + 0x200]
01e3f 448b842408020000               mov        r8d, dword ptr [rsp + 0x208]
01e47 4c8bcb                         mov        r9, rbx
01e4a 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
01e4f 4c89442408                     mov        qword ptr [rsp + 8], r8
01e54 48890c24                       mov        qword ptr [rsp], rcx
01e58 4889542418                     mov        qword ptr [rsp + 0x18], rdx
01e5d 4889742420                     mov        qword ptr [rsp + 0x20], rsi
01e62 488bfe                         mov        rdi, rsi
01e65 488bf2                         mov        rsi, rdx
01e68 488bd1                         mov        rdx, rcx
01e6b 498bc8                         mov        rcx, r8
01e6e 4d8bc1                         mov        r8, r9
01e71 e8ca774a07                     call       0x7f138f8e8840
01e76 85c0                           test       eax, eax
01e78 0f842b000000                   je         0x7f13884410a9
01e7e 488bf8                         mov        rdi, rax
01e81 83f7ff                         xor        edi, 0xffffffff
01e84 488b0c24                       mov        rcx, qword ptr [rsp]
01e88 4c8b442408                     mov        r8, qword ptr [rsp + 8]
01e8d 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
01e92 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
01e97 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
01e9c 442bcf                         sub        r9d, edi
01e9f 03d7                           add        edx, edi
01ea1 4403c7                         add        r8d, edi
01ea4 e9722f0000                     jmp        0x7f138844401b
01ea9 8bbc2438020000                 mov        edi, dword ptr [rsp + 0x238]
01eb0 448bac2440020000               mov        r13d, dword ptr [rsp + 0x240]
01eb8 8bb42410020000                 mov        esi, dword ptr [rsp + 0x210]
01ebf 498bdd                         mov        rbx, r13
01ec2 2b9c243c020000                 sub        ebx, dword ptr [rsp + 0x23c]
01ec9 83fe10                         cmp        esi, 0x10
01ecc 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
01ed6 b988050000                     mov        ecx, 0x588
01edb 7f05                           jg         0x7f13884410e2
01edd b998050000                     mov        ecx, 0x598
01ee2 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01ee6 4d8d4001                       lea        r8, [r8 + 1]
01eea 4c89040a                       mov        qword ptr [rdx + rcx], r8
01eee 448b9c243c020000               mov        r11d, dword ptr [rsp + 0x23c]
01ef6 0f8f2c000000                   jg         0x7f1388441128
01efc 4183fb10                       cmp        r11d, 0x10
01f00 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
01f0a b9b8050000                     mov        ecx, 0x5b8
01f0f 7d05                           jge        0x7f1388441116
01f11 b9a8050000                     mov        ecx, 0x5a8
01f16 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01f1a 4d8d4001                       lea        r8, [r8 + 1]
01f1e 4c89040a                       mov        qword ptr [rdx + rcx], r8
01f22 0f8dcc170000                   jge        0x7f13884428f4
01f28 443bde                         cmp        r11d, esi
01f2b 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
01f35 b920060000                     mov        ecx, 0x620
01f3a 7c05                           jl         0x7f1388441141
01f3c b930060000                     mov        ecx, 0x630
01f41 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01f45 4d8d4001                       lea        r8, [r8 + 1]
01f49 4c89040a                       mov        qword ptr [rdx + rcx], r8
01f4d 0f8c7c060000                   jl         0x7f13884417cf
01f53 83fe30                         cmp        esi, 0x30
01f56 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
01f60 b940060000                     mov        ecx, 0x640
01f65 7e05                           jle        0x7f138844116c
01f67 b950060000                     mov        ecx, 0x650
01f6c 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01f70 4d8d4001                       lea        r8, [r8 + 1]
01f74 4c89040a                       mov        qword ptr [rdx + rcx], r8
01f78 89bc2468020000                 mov        dword ptr [rsp + 0x268], edi
01f7f 0f8eaa000000                   jle        0x7f138844122f
01f85 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
01f8f 4883826006000001               add        qword ptr [rdx + 0x660], 1
01f97 488bc6                         mov        rax, rsi
01f9a 488bb42400020000               mov        rsi, qword ptr [rsp + 0x200]
01fa2 488bd3                         mov        rdx, rbx
01fa5 488b8c2400020000               mov        rcx, qword ptr [rsp + 0x200]
01fad 4d8bc5                         mov        r8, r13
01fb0 4c8bc8                         mov        r9, rax
01fb3 4489ac2464020000               mov        dword ptr [rsp + 0x264], r13d
01fbb 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
01fc0 4c89442408                     mov        qword ptr [rsp + 8], r8
01fc5 48890c24                       mov        qword ptr [rsp], rcx
01fc9 4889542418                     mov        qword ptr [rsp + 0x18], rdx
01fce 4889742420                     mov        qword ptr [rsp + 0x20], rsi
01fd3 488bfe                         mov        rdi, rsi
01fd6 488bf2                         mov        rsi, rdx
01fd9 488bd1                         mov        rdx, rcx
01fdc 498bc8                         mov        rcx, r8
01fdf 4d8bc1                         mov        r8, r9
01fe2 e859764a07                     call       0x7f138f8e8840
01fe7 85c0                           test       eax, eax
01fe9 0f842b000000                   je         0x7f138844121a
01fef 488bf8                         mov        rdi, rax
01ff2 83f7ff                         xor        edi, 0xffffffff
01ff5 488b0c24                       mov        rcx, qword ptr [rsp]
01ff9 4c8b442408                     mov        r8, qword ptr [rsp + 8]
01ffe 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
02003 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
02008 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
0200d 442bcf                         sub        r9d, edi
02010 03d7                           add        edx, edi
02012 4403c7                         add        r8d, edi
02015 e90f2e0000                     jmp        0x7f1388444029
0201a 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
02024 ff8270060000                   inc        dword ptr [rdx + 0x670]
0202a e97b050000                     jmp        0x7f13884417aa
0202f 4489ac2464020000               mov        dword ptr [rsp + 0x264], r13d
02037 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
0203f 4403ac2410020000               add        r13d, dword ptr [rsp + 0x210]
02047 4489ac2474020000               mov        dword ptr [rsp + 0x274], r13d
0204f 8bbc2464020000                 mov        edi, dword ptr [rsp + 0x264]
02056 6690                           nop        
02058 89bc246c020000                 mov        dword ptr [rsp + 0x26c], edi
0205f 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
02067 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
02071 4883828806000001               add        qword ptr [rdx + 0x688], 1
02079 48ba189e088900000000           movabs     rdx, 0x89089e18
02083 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02086 83c102                         add        ecx, 2
02089 894a70                         mov        dword ptr [rdx + 0x70], ecx
0208c 81e1feff1f00                   and        ecx, 0x1ffffe
02092 85c9                           test       ecx, ecx
02094 0f849f2d0000                   je         0x7f1388444039
0209a 48ba189e088900000000           movabs     rdx, 0x89089e18
020a4 488d92d8000000                 lea        rdx, [rdx + 0xd8]
020ab 4885c0                         test       rax, rax
020ae 750c                           jne        0x7f13884412bc
020b0 f6420801                       test       byte ptr [rdx + 8], 1
020b4 7506                           jne        0x7f13884412bc
020b6 f048834a0801                   lock or    qword ptr [rdx + 8], 1
020bc 48ba20172178137f0000           movabs     rdx, 0x7f1378211720
020c6 488d9240030000                 lea        rdx, [rdx + 0x340]
020cd 4885c0                         test       rax, rax
020d0 750e                           jne        0x7f13884412e0
020d2 f6421001                       test       byte ptr [rdx + 0x10], 1
020d6 7534                           jne        0x7f138844130c
020d8 f048834a1001                   lock or    qword ptr [rdx + 0x10], 1
020de eb2c                           jmp        0x7f138844130c
020e0 8b08                           mov        ecx, dword ptr [rax]
020e2 c1e90d                         shr        ecx, 0xd
020e5 48c1e10a                       shl        rcx, 0xa
020e9 41ba00000088                   mov        r10d, 0x88000000
020ef 4903ca                         add        rcx, r10
020f2 4c8bd1                         mov        r10, rcx
020f5 48334a10                       xor        rcx, qword ptr [rdx + 0x10]
020f9 48f7c1fcffffff                 test       rcx, -4
02100 740a                           je         0x7f138844130c
02102 f6c102                         test       cl, 2
02105 7505                           jne        0x7f138844130c
02107 48834a1002                     or         qword ptr [rdx + 0x10], 2
0210c 48ba189e088900000000           movabs     rdx, 0x89089e18
02116 488382a800000001               add        qword ptr [rdx + 0xa8], 1
0211e 48ba20172178137f0000           movabs     rdx, 0x7f1378211720
02128 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0212b 83c102                         add        ecx, 2
0212e 894a70                         mov        dword ptr [rdx + 0x70], ecx
02131 81e1feff1f00                   and        ecx, 0x1ffffe
02137 85c9                           test       ecx, ecx
02139 0f841b2d0000                   je         0x7f138844405a
0213f 48ba98f7b6e200000000           movabs     rdx, 0xe2b6f798
02149 48b920172178137f0000           movabs     rcx, 0x7f1378211720
02153 8b12                           mov        edx, dword ptr [rdx]
02155 c1ea0d                         shr        edx, 0xd
02158 48c1e20a                       shl        rdx, 0xa
0215c 41ba00000088                   mov        r10d, 0x88000000
02162 4903d2                         add        rdx, r10
02165 41ba16000000                   mov        r10d, 0x16
0216b 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0216f 7436                           je         0x7f13884413a7
02171 4983c202                       add        r10, 2
02175 4983fa1a                       cmp        r10, 0x1a
02179 75f0                           jne        0x7f138844136b
0217b 41ba16000000                   mov        r10d, 0x16
02181 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02186 7412                           je         0x7f138844139a
02188 4983c202                       add        r10, 2
0218c 4983fa1a                       cmp        r10, 0x1a
02190 75ef                           jne        0x7f1388441381
02192 41ba15000000                   mov        r10d, 0x15
02198 eb11                           jmp        0x7f13884413ab
0219a 50                             push       rax
0219b 4833c0                         xor        rax, rax
0219e f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
021a4 58                             pop        rax
021a5 ebbe                           jmp        0x7f1388441365
021a7 4983c201                       add        r10, 1
021ab 4a8304d101                     add        qword ptr [rcx + r10*8], 1
021b0 48bac85b1578137f0000           movabs     rdx, 0x7f1378155bc8
021ba 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
021bd 83c102                         add        ecx, 2
021c0 894a70                         mov        dword ptr [rdx + 0x70], ecx
021c3 81e1feff1f00                   and        ecx, 0x1ffffe
021c9 85c9                           test       ecx, ecx
021cb 0f84aa2c0000                   je         0x7f138844407b
021d1 48bac85b1578137f0000           movabs     rdx, 0x7f1378155bc8
021db ff82a8000000                   inc        dword ptr [rdx + 0xa8]
021e1 48ba20172178137f0000           movabs     rdx, 0x7f1378211720
021eb ff8200010000                   inc        dword ptr [rdx + 0x100]
021f1 48ba20172178137f0000           movabs     rdx, 0x7f1378211720
021fb ff8220010000                   inc        dword ptr [rdx + 0x120]
02201 48ba307239e200000000           movabs     rdx, 0xe2397230
0220b 48b920172178137f0000           movabs     rcx, 0x7f1378211720
02215 8b12                           mov        edx, dword ptr [rdx]
02217 c1ea0d                         shr        edx, 0xd
0221a 48c1e20a                       shl        rdx, 0xa
0221e 41ba00000088                   mov        r10d, 0x88000000
02224 4903d2                         add        rdx, r10
02227 41ba27000000                   mov        r10d, 0x27
0222d 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02231 7436                           je         0x7f1388441469
02233 4983c202                       add        r10, 2
02237 4983fa2b                       cmp        r10, 0x2b
0223b 75f0                           jne        0x7f138844142d
0223d 41ba27000000                   mov        r10d, 0x27
02243 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02248 7412                           je         0x7f138844145c
0224a 4983c202                       add        r10, 2
0224e 4983fa2b                       cmp        r10, 0x2b
02252 75ef                           jne        0x7f1388441443
02254 41ba26000000                   mov        r10d, 0x26
0225a eb11                           jmp        0x7f138844146d
0225c 50                             push       rax
0225d 4833c0                         xor        rax, rax
02260 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02266 58                             pop        rax
02267 ebbe                           jmp        0x7f1388441427
02269 4983c201                       add        r10, 1
0226d 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02272 48ba30661578137f0000           movabs     rdx, 0x7f1378156630
0227c 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0227f 83c102                         add        ecx, 2
02282 894a70                         mov        dword ptr [rdx + 0x70], ecx
02285 81e1feff1f00                   and        ecx, 0x1ffffe
0228b 85c9                           test       ecx, ecx
0228d 0f84092c0000                   je         0x7f138844409c
02293 48ba30661578137f0000           movabs     rdx, 0x7f1378156630
0229d ff82a8000000                   inc        dword ptr [rdx + 0xa8]
022a3 48ba20172178137f0000           movabs     rdx, 0x7f1378211720
022ad 488d9280010000                 lea        rdx, [rdx + 0x180]
022b4 4885c0                         test       rax, rax
022b7 750e                           jne        0x7f13884414c7
022b9 f6421801                       test       byte ptr [rdx + 0x18], 1
022bd 7534                           jne        0x7f13884414f3
022bf f048834a1801                   lock or    qword ptr [rdx + 0x18], 1
022c5 eb2c                           jmp        0x7f13884414f3
022c7 8b08                           mov        ecx, dword ptr [rax]
022c9 c1e90d                         shr        ecx, 0xd
022cc 48c1e10a                       shl        rcx, 0xa
022d0 41ba00000088                   mov        r10d, 0x88000000
022d6 4903ca                         add        rcx, r10
022d9 4c8bd1                         mov        r10, rcx
022dc 48334a18                       xor        rcx, qword ptr [rdx + 0x18]
022e0 48f7c1fcffffff                 test       rcx, -4
022e7 740a                           je         0x7f13884414f3
022e9 f6c102                         test       cl, 2
022ec 7505                           jne        0x7f13884414f3
022ee 48834a1802                     or         qword ptr [rdx + 0x18], 2
022f3 48ba20172178137f0000           movabs     rdx, 0x7f1378211720
022fd 4883827001000001               add        qword ptr [rdx + 0x170], 1
02305 48ba881b2178137f0000           movabs     rdx, 0x7f1378211b88
0230f 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02312 83c102                         add        ecx, 2
02315 894a70                         mov        dword ptr [rdx + 0x70], ecx
02318 81e1feff1f00                   and        ecx, 0x1ffffe
0231e 85c9                           test       ecx, ecx
02320 0f84972b0000                   je         0x7f13884440bd
02326 4885c0                         test       rax, rax
02329 49b8881b2178137f0000           movabs     r8, 0x7f1378211b88
02333 750d                           jne        0x7f1388441542
02335 418088d100000001               or         byte ptr [r8 + 0xd1], 1
0233d e98a000000                     jmp        0x7f13884415cc
02342 8b30                           mov        esi, dword ptr [rax]
02344 c1ee0d                         shr        esi, 0xd
02347 48c1e60a                       shl        rsi, 0xa
0234b 41ba00000088                   mov        r10d, 0x88000000
02351 4903f2                         add        rsi, r10
02354 41ba1c000000                   mov        r10d, 0x1c
0235a 4b3b34d0                       cmp        rsi, qword ptr [r8 + r10*8]
0235e 7436                           je         0x7f1388441596
02360 4983c202                       add        r10, 2
02364 4983fa20                       cmp        r10, 0x20
02368 75f0                           jne        0x7f138844155a
0236a 41ba1c000000                   mov        r10d, 0x1c
02370 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
02375 7412                           je         0x7f1388441589
02377 4983c202                       add        r10, 2
0237b 4983fa20                       cmp        r10, 0x20
0237f 75ef                           jne        0x7f1388441570
02381 41ba1b000000                   mov        r10d, 0x1b
02387 eb11                           jmp        0x7f138844159a
02389 50                             push       rax
0238a 4833c0                         xor        rax, rax
0238d f04b0fb134d0                   lock cmpxchg qword ptr [r8 + r10*8], rsi
02393 58                             pop        rax
02394 ebbe                           jmp        0x7f1388441554
02396 4983c201                       add        r10, 1
0239a 4b8304d001                     add        qword ptr [r8 + r10*8], 1
0239f 48be0090178800000000           movabs     rsi, 0x88179000
023a9 448b00                         mov        r8d, dword ptr [rax]
023ac 41c1e80d                       shr        r8d, 0xd
023b0 49c1e00a                       shl        r8, 0xa
023b4 41ba00000088                   mov        r10d, 0x88000000
023ba 4d03c2                         add        r8, r10
023bd 493b7038                       cmp        rsi, qword ptr [r8 + 0x38]
023c1 0f85172b0000                   jne        0x7f13884440de
023c7 e900000000                     jmp        0x7f13884415cc
023cc 488bd0                         mov        rdx, rax
023cf 48b9881b2178137f0000           movabs     rcx, 0x7f1378211b88
023d9 4883810801000001               add        qword ptr [rcx + 0x108], 1
023e1 48b958132178137f0000           movabs     rcx, 0x7f1378211358
023eb 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
023ef 4183c002                       add        r8d, 2
023f3 44894170                       mov        dword ptr [rcx + 0x70], r8d
023f7 4181e0feff1f00                 and        r8d, 0x1ffffe
023fe 4585c0                         test       r8d, r8d
02401 0f84e02a0000                   je         0x7f13884440e7
02407 8b4a04                         mov        ecx, dword ptr [rdx + 4]
0240a 49b858132178137f0000           movabs     r8, 0x7f1378211358
02414 498380a800000001               add        qword ptr [r8 + 0xa8], 1
0241c 83e907                         sub        ecx, 7
0241f 49b8a01923e200000000           movabs     r8, 0xe22319a0
02429 41b800000000                   mov        r8d, 0
0242f 413bd8                         cmp        ebx, r8d
02432 0f8cd52a0000                   jl         0x7f138844410d
02438 3bd9                           cmp        ebx, ecx
0243a 0f8dda2a0000                   jge        0x7f138844411a
02440 488bcb                         mov        rcx, rbx
02443 48be28c122e200000000           movabs     rsi, 0xe222c128
0244d 4c8bc6                         mov        r8, rsi
02450 49b9881b2178137f0000           movabs     r9, 0x7f1378211b88
0245a 458b00                         mov        r8d, dword ptr [r8]
0245d 41c1e80d                       shr        r8d, 0xd
02461 49c1e00a                       shl        r8, 0xa
02465 41ba00000088                   mov        r10d, 0x88000000
0246b 4d03c2                         add        r8, r10
0246e 41ba24000000                   mov        r10d, 0x24
02474 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
02478 7436                           je         0x7f13884416b0
0247a 4983c202                       add        r10, 2
0247e 4983fa28                       cmp        r10, 0x28
02482 75f0                           jne        0x7f1388441674
02484 41ba24000000                   mov        r10d, 0x24
0248a 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
0248f 7412                           je         0x7f13884416a3
02491 4983c202                       add        r10, 2
02495 4983fa28                       cmp        r10, 0x28
02499 75ef                           jne        0x7f138844168a
0249b 41ba23000000                   mov        r10d, 0x23
024a1 eb11                           jmp        0x7f13884416b4
024a3 50                             push       rax
024a4 4833c0                         xor        rax, rax
024a7 f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
024ad 58                             pop        rax
024ae ebbe                           jmp        0x7f138844166e
024b0 4983c201                       add        r10, 1
024b4 4b8304d101                     add        qword ptr [r9 + r10*8], 1
024b9 4863c9                         movsxd     rcx, ecx
024bc 41ba08000000                   mov        r10d, 8
024c2 4903ca                         add        rcx, r10
024c5 41b800000000                   mov        r8d, 0
024cb 899c2470020000                 mov        dword ptr [rsp + 0x270], ebx
024d2 4889842400020000               mov        qword ptr [rsp + 0x200], rax
024da 0f1f440000                     nop        dword ptr [rax + rax]
024df e83cdda207                     call       0x7f138fe6f420
024e4 0f1f8400dc25000b               nop        dword ptr [rax + rax + 0xb0025dc]
024ec 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
024f6 4883869806000001               add        qword ptr [rsi + 0x698], 1
024fe 488bb42400020000               mov        rsi, qword ptr [rsp + 0x200]
02506 8b94246c020000                 mov        edx, dword ptr [rsp + 0x26c]
0250d 488bc8                         mov        rcx, rax
02510 0f1f8000000000                 nop        dword ptr [rax]
02517 e83f320000                     call       0x7f138844495b
0251c 0f1f84001426000c               nop        dword ptr [rax + rax + 0xc002614]
02524 8bbc246c020000                 mov        edi, dword ptr [rsp + 0x26c]
0252b 83c708                         add        edi, 8
0252e 8b9c2470020000                 mov        ebx, dword ptr [rsp + 0x270]
02535 83c308                         add        ebx, 8
02538 3bbc2474020000                 cmp        edi, dword ptr [rsp + 0x274]
0253f be02000000                     mov        esi, 2
02544 7c05                           jl         0x7f138844174b
02546 be00000000                     mov        esi, 0
0254b 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
02555 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
02558 03ce                           add        ecx, esi
0255a 894a74                         mov        dword ptr [rdx + 0x74], ecx
0255d 85f6                           test       esi, esi
0255f 7505                           jne        0x7f1388441766
02561 b902000000                     mov        ecx, 2
02566 81e1fe3f0000                   and        ecx, 0x3ffe
0256c 85c9                           test       ecx, ecx
0256e 0f84b3290000                   je         0x7f1388444127
02574 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02578 418502                         test       dword ptr [r10], eax
0257b 3bbc2474020000                 cmp        edi, dword ptr [rsp + 0x274]
02582 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
0258c baa8060000                     mov        edx, 0x6a8
02591 7c05                           jl         0x7f1388441798
02593 bab8060000                     mov        edx, 0x6b8
02598 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0259c 488d4901                       lea        rcx, [rcx + 1]
025a0 48890c16                       mov        qword ptr [rsi + rdx], rcx
025a4 0f8caefaffff                   jl         0x7f1388441258
025aa 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
025b2 4403ac2410020000               add        r13d, dword ptr [rsp + 0x210]
025ba 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
025c4 ff86c8060000                   inc        dword ptr [rsi + 0x6c8]
025ca e94f1b0000                     jmp        0x7f138844331e
025cf 89bc2468020000                 mov        dword ptr [rsp + 0x268], edi
025d6 4489ac2464020000               mov        dword ptr [rsp + 0x264], r13d
025de 4183fb10                       cmp        r11d, 0x10
025e2 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
025ec bae0060000                     mov        edx, 0x6e0
025f1 7c05                           jl         0x7f13884417f8
025f3 baf0060000                     mov        edx, 0x6f0
025f8 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
025fc 488d4901                       lea        rcx, [rcx + 1]
02600 48890c16                       mov        qword ptr [rsi + rdx], rcx
02604 0f8ceb0a0000                   jl         0x7f13884422f5
0260a 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
02612 4403ac2410020000               add        r13d, dword ptr [rsp + 0x210]
0261a 4489ac2484020000               mov        dword ptr [rsp + 0x284], r13d
02622 8b842464020000                 mov        eax, dword ptr [rsp + 0x264]
02629 0f1f8000000000                 nop        dword ptr [rax]
02630 89842478020000                 mov        dword ptr [rsp + 0x278], eax
02637 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
0263f 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
02649 4883860007000001               add        qword ptr [rsi + 0x700], 1
02651 48be18b32e78137f0000           movabs     rsi, 0x7f13782eb318
0265b 8b5670                         mov        edx, dword ptr [rsi + 0x70]
0265e 83c202                         add        edx, 2
02661 895670                         mov        dword ptr [rsi + 0x70], edx
02664 81e2feff1f00                   and        edx, 0x1ffffe
0266a 85d2                           test       edx, edx
0266c 0f84d6280000                   je         0x7f1388444148
02672 48be60e0bde200000000           movabs     rsi, 0xe2bde060
0267c 48ba18b32e78137f0000           movabs     rdx, 0x7f13782eb318
02686 8b36                           mov        esi, dword ptr [rsi]
02688 c1ee0d                         shr        esi, 0xd
0268b 48c1e60a                       shl        rsi, 0xa
0268f 41ba00000088                   mov        r10d, 0x88000000
02695 4903f2                         add        rsi, r10
02698 41ba16000000                   mov        r10d, 0x16
0269e 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
026a2 7436                           je         0x7f13884418da
026a4 4983c202                       add        r10, 2
026a8 4983fa1a                       cmp        r10, 0x1a
026ac 75f0                           jne        0x7f138844189e
026ae 41ba16000000                   mov        r10d, 0x16
026b4 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
026b9 7412                           je         0x7f13884418cd
026bb 4983c202                       add        r10, 2
026bf 4983fa1a                       cmp        r10, 0x1a
026c3 75ef                           jne        0x7f13884418b4
026c5 41ba15000000                   mov        r10d, 0x15
026cb eb11                           jmp        0x7f13884418de
026cd 50                             push       rax
026ce 4833c0                         xor        rax, rax
026d1 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
026d7 58                             pop        rax
026d8 ebbe                           jmp        0x7f1388441898
026da 4983c201                       add        r10, 1
026de 4a8304d201                     add        qword ptr [rdx + r10*8], 1
026e3 448b7004                       mov        r14d, dword ptr [rax + 4]
026e7 48be18b32e78137f0000           movabs     rsi, 0x7f13782eb318
026f1 488386d800000001               add        qword ptr [rsi + 0xd8], 1
026f9 48be58a82e78137f0000           movabs     rsi, 0x7f13782ea858
02703 8b5670                         mov        edx, dword ptr [rsi + 0x70]
02706 83c202                         add        edx, 2
02709 895670                         mov        dword ptr [rsi + 0x70], edx
0270c 81e2feff1f00                   and        edx, 0x1ffffe
02712 85d2                           test       edx, edx
02714 0f8454280000                   je         0x7f138844416e
0271a 48be58a82e78137f0000           movabs     rsi, 0x7f13782ea858
02724 4883860801000001               add        qword ptr [rsi + 0x108], 1
0272c 498bf6                         mov        rsi, r14
0272f 83ee0f                         sub        esi, 0xf
02732 48bad0771878137f0000           movabs     rdx, 0x7f13781877d0
0273c 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0273f 83c102                         add        ecx, 2
02742 894a70                         mov        dword ptr [rdx + 0x70], ecx
02745 81e1feff1f00                   and        ecx, 0x1ffffe
0274b 85c9                           test       ecx, ecx
0274d 0f843c280000                   je         0x7f138844418f
02753 48bad0771878137f0000           movabs     rdx, 0x7f13781877d0
0275d 488382a800000001               add        qword ptr [rdx + 0xa8], 1
02765 48ba0000000000000000           movabs     rdx, 0
0276f ba00000000                     mov        edx, 0
02774 3bda                           cmp        ebx, edx
02776 0f8c34280000                   jl         0x7f13884441b0
0277c 3bde                           cmp        ebx, esi
0277e 0f8d39280000                   jge        0x7f13884441bd
02784 488bf3                         mov        rsi, rbx
02787 48ba60e0bde200000000           movabs     rdx, 0xe2bde060
02791 488bca                         mov        rcx, rdx
02794 49b818b32e78137f0000           movabs     r8, 0x7f13782eb318
0279e 8b09                           mov        ecx, dword ptr [rcx]
027a0 c1e90d                         shr        ecx, 0xd
027a3 48c1e10a                       shl        rcx, 0xa
027a7 41ba00000088                   mov        r10d, 0x88000000
027ad 4903ca                         add        rcx, r10
027b0 41ba24000000                   mov        r10d, 0x24
027b6 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
027ba 7436                           je         0x7f13884419f2
027bc 4983c202                       add        r10, 2
027c0 4983fa28                       cmp        r10, 0x28
027c4 75f0                           jne        0x7f13884419b6
027c6 41ba24000000                   mov        r10d, 0x24
027cc 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
027d1 7412                           je         0x7f13884419e5
027d3 4983c202                       add        r10, 2
027d7 4983fa28                       cmp        r10, 0x28
027db 75ef                           jne        0x7f13884419cc
027dd 41ba23000000                   mov        r10d, 0x23
027e3 eb11                           jmp        0x7f13884419f6
027e5 50                             push       rax
027e6 4833c0                         xor        rax, rax
027e9 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
027ef 58                             pop        rax
027f0 ebbe                           jmp        0x7f13884419b0
027f2 4983c201                       add        r10, 1
027f6 4b8304d001                     add        qword ptr [r8 + r10*8], 1
027fb 48b928a12e78137f0000           movabs     rcx, 0x7f13782ea128
02805 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
02809 4183c002                       add        r8d, 2
0280d 44894170                       mov        dword ptr [rcx + 0x70], r8d
02811 4181e0feff1f00                 and        r8d, 0x1ffffe
02818 4585c0                         test       r8d, r8d
0281b 0f84a9270000                   je         0x7f13884441ca
02821 48b928a12e78137f0000           movabs     rcx, 0x7f13782ea128
0282b 488381a800000001               add        qword ptr [rcx + 0xa8], 1
02833 48ba50a22e78137f0000           movabs     rdx, 0x7f13782ea250
0283d 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02840 83c102                         add        ecx, 2
02843 894a70                         mov        dword ptr [rdx + 0x70], ecx
02846 81e1feff1f00                   and        ecx, 0x1ffffe
0284c 85c9                           test       ecx, ecx
0284e 0f8497270000                   je         0x7f13884441eb
02854 48ba50a22e78137f0000           movabs     rdx, 0x7f13782ea250
0285e ff82b8000000                   inc        dword ptr [rdx + 0xb8]
02864 4489b4247c020000               mov        dword ptr [rsp + 0x27c], r14d
0286c 899c2480020000                 mov        dword ptr [rsp + 0x280], ebx
02873 48ba5860bee200000000           movabs     rdx, 0xe2be6058
0287d 488bca                         mov        rcx, rdx
02880 49b818b32e78137f0000           movabs     r8, 0x7f13782eb318
0288a 4983805801000001               add        qword ptr [r8 + 0x158], 1
02892 48b9e0b42e78137f0000           movabs     rcx, 0x7f13782eb4e0
0289c 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
028a0 4183c002                       add        r8d, 2
028a4 44894170                       mov        dword ptr [rcx + 0x70], r8d
028a8 4181e0feff1f00                 and        r8d, 0x1ffffe
028af 4585c0                         test       r8d, r8d
028b2 0f8454270000                   je         0x7f138844420c
028b8 488bca                         mov        rcx, rdx
028bb 49b8e0b42e78137f0000           movabs     r8, 0x7f13782eb4e0
028c5 498380a800000001               add        qword ptr [r8 + 0xa8], 1
028cd 48b9c0b52e78137f0000           movabs     rcx, 0x7f13782eb5c0
028d7 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
028db 4183c002                       add        r8d, 2
028df 44894170                       mov        dword ptr [rcx + 0x70], r8d
028e3 4181e0feff1f00                 and        r8d, 0x1ffffe
028ea 4585c0                         test       r8d, r8d
028ed 0f843a270000                   je         0x7f138844422d
028f3 48b9c0b52e78137f0000           movabs     rcx, 0x7f13782eb5c0
028fd 488381b800000001               add        qword ptr [rcx + 0xb8], 1
02905 48bad0a92e78137f0000           movabs     rdx, 0x7f13782ea9d0
0290f 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02912 83c102                         add        ecx, 2
02915 894a70                         mov        dword ptr [rdx + 0x70], ecx
02918 81e1feff1f00                   and        ecx, 0x1ffffe
0291e 85c9                           test       ecx, ecx
02920 0f8428270000                   je         0x7f138844424e
02926 48ba60e0bde200000000           movabs     rdx, 0xe2bde060
02930 488bca                         mov        rcx, rdx
02933 49b8c0b52e78137f0000           movabs     r8, 0x7f13782eb5c0
0293d 8b09                           mov        ecx, dword ptr [rcx]
0293f c1e90d                         shr        ecx, 0xd
02942 48c1e10a                       shl        rcx, 0xa
02946 41ba00000088                   mov        r10d, 0x88000000
0294c 4903ca                         add        rcx, r10
0294f 41ba1c000000                   mov        r10d, 0x1c
02955 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
02959 7436                           je         0x7f1388441b91
0295b 4983c202                       add        r10, 2
0295f 4983fa20                       cmp        r10, 0x20
02963 75f0                           jne        0x7f1388441b55
02965 41ba1c000000                   mov        r10d, 0x1c
0296b 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
02970 7412                           je         0x7f1388441b84
02972 4983c202                       add        r10, 2
02976 4983fa20                       cmp        r10, 0x20
0297a 75ef                           jne        0x7f1388441b6b
0297c 41ba1b000000                   mov        r10d, 0x1b
02982 eb11                           jmp        0x7f1388441b95
02984 50                             push       rax
02985 4833c0                         xor        rax, rax
02988 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
0298e 58                             pop        rax
0298f ebbe                           jmp        0x7f1388441b4f
02991 4983c201                       add        r10, 1
02995 4b8304d001                     add        qword ptr [r8 + r10*8], 1
0299a 48b9c0b52e78137f0000           movabs     rcx, 0x7f13782eb5c0
029a4 8b12                           mov        edx, dword ptr [rdx]
029a6 c1ea0d                         shr        edx, 0xd
029a9 48c1e20a                       shl        rdx, 0xa
029ad 41ba00000088                   mov        r10d, 0x88000000
029b3 4903d2                         add        rdx, r10
029b6 41ba22000000                   mov        r10d, 0x22
029bc 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
029c0 7436                           je         0x7f1388441bf8
029c2 4983c202                       add        r10, 2
029c6 4983fa26                       cmp        r10, 0x26
029ca 75f0                           jne        0x7f1388441bbc
029cc 41ba22000000                   mov        r10d, 0x22
029d2 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
029d7 7412                           je         0x7f1388441beb
029d9 4983c202                       add        r10, 2
029dd 4983fa26                       cmp        r10, 0x26
029e1 75ef                           jne        0x7f1388441bd2
029e3 41ba21000000                   mov        r10d, 0x21
029e9 eb11                           jmp        0x7f1388441bfc
029eb 50                             push       rax
029ec 4833c0                         xor        rax, rax
029ef f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
029f5 58                             pop        rax
029f6 ebbe                           jmp        0x7f1388441bb6
029f8 4983c201                       add        r10, 1
029fc 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02a01 48bac0b52e78137f0000           movabs     rdx, 0x7f13782eb5c0
02a0b 4883823801000001               add        qword ptr [rdx + 0x138], 1
02a13 48ba90aa2e78137f0000           movabs     rdx, 0x7f13782eaa90
02a1d 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02a20 83c102                         add        ecx, 2
02a23 894a70                         mov        dword ptr [rdx + 0x70], ecx
02a26 81e1feff1f00                   and        ecx, 0x1ffffe
02a2c 85c9                           test       ecx, ecx
02a2e 0f843b260000                   je         0x7f138844426f
02a34 48bac0b52e78137f0000           movabs     rdx, 0x7f13782eb5c0
02a3e 4883824801000001               add        qword ptr [rdx + 0x148], 1
02a46 4863f6                         movsxd     rsi, esi
02a49 ba08000000                     mov        edx, 8
02a4e 4c8bce                         mov        r9, rsi
02a51 4c03ca                         add        r9, rdx
02a54 48ba789e2e78137f0000           movabs     rdx, 0x7f13782e9e78
02a5e 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02a61 83c102                         add        ecx, 2
02a64 894a70                         mov        dword ptr [rdx + 0x70], ecx
02a67 81e1feff1f00                   and        ecx, 0x1ffffe
02a6d 85c9                           test       ecx, ecx
02a6f 0f841b260000                   je         0x7f1388444290
02a75 48ba789e2e78137f0000           movabs     rdx, 0x7f13782e9e78
02a7f 488382d800000001               add        qword ptr [rdx + 0xd8], 1
02a87 48baf09f2e78137f0000           movabs     rdx, 0x7f13782e9ff0
02a91 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02a94 83c102                         add        ecx, 2
02a97 894a70                         mov        dword ptr [rdx + 0x70], ecx
02a9a 81e1feff1f00                   and        ecx, 0x1ffffe
02aa0 85c9                           test       ecx, ecx
02aa2 0f8409260000                   je         0x7f13884442b1
02aa8 48bac0b52e78137f0000           movabs     rdx, 0x7f13782eb5c0
02ab2 4883826801000001               add        qword ptr [rdx + 0x168], 1
02aba 48ba28b9bee200000000           movabs     rdx, 0xe2beb928
02ac4 488bfe                         mov        rdi, rsi
02ac7 48bea8e0bde200000000           movabs     rsi, 0xe2bde0a8
02ad1 ba02000000                     mov        edx, 2
02ad6 b910000000                     mov        ecx, 0x10
02adb 4c8bc0                         mov        r8, rax
02ade 488bdf                         mov        rbx, rdi
02ae1 bf00000000                     mov        edi, 0
02ae6 48890424                       mov        qword ptr [rsp], rax
02aea 48895c2408                     mov        qword ptr [rsp + 8], rbx
02aef 49ba60e0bde200000000           movabs     r10, 0xe2bde060
02af9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02afe 49ba28b9bee200000000           movabs     r10, 0xe2beb928
02b08 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02b0d 4889842400020000               mov        qword ptr [rsp + 0x200], rax
02b15 6690                           nop        
02b17 e8448b4b07                     call       0x7f138f8fa860
02b1c 0f1f8400142c000e               nop        dword ptr [rax + rax + 0xe002c14]
02b24 4885c0                         test       rax, rax
02b27 48bbc0b52e78137f0000           movabs     rbx, 0x7f13782eb5c0
02b31 750c                           jne        0x7f1388441d3f
02b33 808b7101000001                 or         byte ptr [rbx + 0x171], 1
02b3a e988000000                     jmp        0x7f1388441dc7
02b3f 8b38                           mov        edi, dword ptr [rax]
02b41 c1ef0d                         shr        edi, 0xd
02b44 48c1e70a                       shl        rdi, 0xa
02b48 41ba00000088                   mov        r10d, 0x88000000
02b4e 4903fa                         add        rdi, r10
02b51 41ba30000000                   mov        r10d, 0x30
02b57 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
02b5b 7436                           je         0x7f1388441d93
02b5d 4983c202                       add        r10, 2
02b61 4983fa34                       cmp        r10, 0x34
02b65 75f0                           jne        0x7f1388441d57
02b67 41ba30000000                   mov        r10d, 0x30
02b6d 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02b72 7412                           je         0x7f1388441d86
02b74 4983c202                       add        r10, 2
02b78 4983fa34                       cmp        r10, 0x34
02b7c 75ef                           jne        0x7f1388441d6d
02b7e 41ba2f000000                   mov        r10d, 0x2f
02b84 eb11                           jmp        0x7f1388441d97
02b86 50                             push       rax
02b87 4833c0                         xor        rax, rax
02b8a f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
02b90 58                             pop        rax
02b91 ebbe                           jmp        0x7f1388441d51
02b93 4983c201                       add        r10, 1
02b97 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02b9c 48bf00dc0c8900000000           movabs     rdi, 0x890cdc00
02ba6 8b18                           mov        ebx, dword ptr [rax]
02ba8 c1eb0d                         shr        ebx, 0xd
02bab 48c1e30a                       shl        rbx, 0xa
02baf 41ba00000088                   mov        r10d, 0x88000000
02bb5 4903da                         add        rbx, r10
02bb8 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
02bbc 0f8510250000                   jne        0x7f13884442d2
02bc2 e900000000                     jmp        0x7f1388441dc7
02bc7 488bf8                         mov        rdi, rax
02bca 4889bc2488020000               mov        qword ptr [rsp + 0x288], rdi
02bd2 483b07                         cmp        rax, qword ptr [rdi]
02bd5 488bf7                         mov        rsi, rdi
02bd8 48bb00e04b78137f0000           movabs     rbx, 0x7f13784be000
02be2 8b36                           mov        esi, dword ptr [rsi]
02be4 c1ee0d                         shr        esi, 0xd
02be7 48c1e60a                       shl        rsi, 0xa
02beb 41ba00000088                   mov        r10d, 0x88000000
02bf1 4903f2                         add        rsi, r10
02bf4 41bae3000000                   mov        r10d, 0xe3
02bfa 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02bfe 743c                           je         0x7f1388441e3c
02c00 4983c202                       add        r10, 2
02c04 4981fae7000000                 cmp        r10, 0xe7
02c0b 75ed                           jne        0x7f1388441dfa
02c0d 41bae3000000                   mov        r10d, 0xe3
02c13 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02c18 7415                           je         0x7f1388441e2f
02c1a 4983c202                       add        r10, 2
02c1e 4981fae7000000                 cmp        r10, 0xe7
02c25 75ec                           jne        0x7f1388441e13
02c27 41bae2000000                   mov        r10d, 0xe2
02c2d eb11                           jmp        0x7f1388441e40
02c2f 50                             push       rax
02c30 4833c0                         xor        rax, rax
02c33 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02c39 58                             pop        rax
02c3a ebb8                           jmp        0x7f1388441df4
02c3c 4983c201                       add        r10, 1
02c40 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02c45 48bed8bf2e78137f0000           movabs     rsi, 0x7f13782ebfd8
02c4f 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
02c52 83c302                         add        ebx, 2
02c55 895e70                         mov        dword ptr [rsi + 0x70], ebx
02c58 81e3feff1f00                   and        ebx, 0x1ffffe
02c5e 85db                           test       ebx, ebx
02c60 0f847a240000                   je         0x7f13884442e0
02c66 488bf7                         mov        rsi, rdi
02c69 48bbd8bf2e78137f0000           movabs     rbx, 0x7f13782ebfd8
02c73 8b36                           mov        esi, dword ptr [rsi]
02c75 c1ee0d                         shr        esi, 0xd
02c78 48c1e60a                       shl        rsi, 0xa
02c7c 41ba00000088                   mov        r10d, 0x88000000
02c82 4903f2                         add        rsi, r10
02c85 41ba16000000                   mov        r10d, 0x16
02c8b 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02c8f 7436                           je         0x7f1388441ec7
02c91 4983c202                       add        r10, 2
02c95 4983fa1a                       cmp        r10, 0x1a
02c99 75f0                           jne        0x7f1388441e8b
02c9b 41ba16000000                   mov        r10d, 0x16
02ca1 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02ca6 7412                           je         0x7f1388441eba
02ca8 4983c202                       add        r10, 2
02cac 4983fa1a                       cmp        r10, 0x1a
02cb0 75ef                           jne        0x7f1388441ea1
02cb2 41ba15000000                   mov        r10d, 0x15
02cb8 eb11                           jmp        0x7f1388441ecb
02cba 50                             push       rax
02cbb 4833c0                         xor        rax, rax
02cbe f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02cc4 58                             pop        rax
02cc5 ebbe                           jmp        0x7f1388441e85
02cc7 4983c201                       add        r10, 1
02ccb 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02cd0 488bf7                         mov        rsi, rdi
02cd3 6690                           nop        
02cd5 48b8b0612464137f0000           movabs     rax, 0x7f13642461b0
02cdf e87c844b07                     call       0x7f138f8fa360
02ce4 0f1f8400dc2d000f               nop        dword ptr [rax + rax + 0xf002ddc]
02cec 48bed8bf2e78137f0000           movabs     rsi, 0x7f13782ebfd8
02cf6 488386d800000001               add        qword ptr [rsi + 0xd8], 1
02cfe 48be58a82e78137f0000           movabs     rsi, 0x7f13782ea858
02d08 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
02d0b 83c702                         add        edi, 2
02d0e 897e70                         mov        dword ptr [rsi + 0x70], edi
02d11 81e7feff1f00                   and        edi, 0x1ffffe
02d17 85ff                           test       edi, edi
02d19 0f84e2230000                   je         0x7f1388444301
02d1f 448bb4247c020000               mov        r14d, dword ptr [rsp + 0x27c]
02d27 8bbc2478020000                 mov        edi, dword ptr [rsp + 0x278]
02d2e 48be58a82e78137f0000           movabs     rsi, 0x7f13782ea858
02d38 4883860801000001               add        qword ptr [rsi + 0x108], 1
02d40 ffc8                           dec        eax
02d42 442bf0                         sub        r14d, eax
02d45 48bed0771878137f0000           movabs     rsi, 0x7f13781877d0
02d4f 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
02d52 83c302                         add        ebx, 2
02d55 895e70                         mov        dword ptr [rsi + 0x70], ebx
02d58 81e3feff1f00                   and        ebx, 0x1ffffe
02d5e 85db                           test       ebx, ebx
02d60 0f84bc230000                   je         0x7f1388444322
02d66 48bed0771878137f0000           movabs     rsi, 0x7f13781877d0
02d70 488386a800000001               add        qword ptr [rsi + 0xa8], 1
02d78 48be0000000000000000           movabs     rsi, 0
02d82 be00000000                     mov        esi, 0
02d87 3bfe                           cmp        edi, esi
02d89 0f8cb4230000                   jl         0x7f1388444343
02d8f 413bfe                         cmp        edi, r14d
02d92 0f8db8230000                   jge        0x7f1388444350
02d98 488bc7                         mov        rax, rdi
02d9b 89842490020000                 mov        dword ptr [rsp + 0x290], eax
02da2 89bc2478020000                 mov        dword ptr [rsp + 0x278], edi
02da9 488bbc2488020000               mov        rdi, qword ptr [rsp + 0x288]
02db1 488bf7                         mov        rsi, rdi
02db4 48b9d8bf2e78137f0000           movabs     rcx, 0x7f13782ebfd8
02dbe 8b36                           mov        esi, dword ptr [rsi]
02dc0 c1ee0d                         shr        esi, 0xd
02dc3 48c1e60a                       shl        rsi, 0xa
02dc7 41ba00000088                   mov        r10d, 0x88000000
02dcd 4903f2                         add        rsi, r10
02dd0 41ba1e000000                   mov        r10d, 0x1e
02dd6 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
02dda 7436                           je         0x7f1388442012
02ddc 4983c202                       add        r10, 2
02de0 4983fa22                       cmp        r10, 0x22
02de4 75f0                           jne        0x7f1388441fd6
02de6 41ba1e000000                   mov        r10d, 0x1e
02dec 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02df1 7412                           je         0x7f1388442005
02df3 4983c202                       add        r10, 2
02df7 4983fa22                       cmp        r10, 0x22
02dfb 75ef                           jne        0x7f1388441fec
02dfd 41ba1d000000                   mov        r10d, 0x1d
02e03 eb11                           jmp        0x7f1388442016
02e05 50                             push       rax
02e06 4833c0                         xor        rax, rax
02e09 f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
02e0f 58                             pop        rax
02e10 ebbe                           jmp        0x7f1388441fd0
02e12 4983c201                       add        r10, 1
02e16 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02e1b 488bf7                         mov        rsi, rdi
02e1e 0f1f8000000000                 nop        dword ptr [rax]
02e25 48b8d8612464137f0000           movabs     rax, 0x7f13642461d8
02e2f e82c834b07                     call       0x7f138f8fa360
02e34 0f1f84002c2f0010               nop        dword ptr [rax + rax + 0x10002f2c]
02e3c 483b00                         cmp        rax, qword ptr [rax]
02e3f 488bf0                         mov        rsi, rax
02e42 48bad8bf2e78137f0000           movabs     rdx, 0x7f13782ebfd8
02e4c 8b36                           mov        esi, dword ptr [rsi]
02e4e c1ee0d                         shr        esi, 0xd
02e51 48c1e60a                       shl        rsi, 0xa
02e55 41ba00000088                   mov        r10d, 0x88000000
02e5b 4903f2                         add        rsi, r10
02e5e 41ba24000000                   mov        r10d, 0x24
02e64 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02e68 7436                           je         0x7f13884420a0
02e6a 4983c202                       add        r10, 2
02e6e 4983fa28                       cmp        r10, 0x28
02e72 75f0                           jne        0x7f1388442064
02e74 41ba24000000                   mov        r10d, 0x24
02e7a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02e7f 7412                           je         0x7f1388442093
02e81 4983c202                       add        r10, 2
02e85 4983fa28                       cmp        r10, 0x28
02e89 75ef                           jne        0x7f138844207a
02e8b 41ba23000000                   mov        r10d, 0x23
02e91 eb11                           jmp        0x7f13884420a4
02e93 50                             push       rax
02e94 4833c0                         xor        rax, rax
02e97 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
02e9d 58                             pop        rax
02e9e ebbe                           jmp        0x7f138844205e
02ea0 4983c201                       add        r10, 1
02ea4 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02ea9 8b7024                         mov        esi, dword ptr [rax + 0x24]
02eac 488bd0                         mov        rdx, rax
02eaf 48b9d8bf2e78137f0000           movabs     rcx, 0x7f13782ebfd8
02eb9 8b12                           mov        edx, dword ptr [rdx]
02ebb c1ea0d                         shr        edx, 0xd
02ebe 48c1e20a                       shl        rdx, 0xa
02ec2 41ba00000088                   mov        r10d, 0x88000000
02ec8 4903d2                         add        rdx, r10
02ecb 41ba2a000000                   mov        r10d, 0x2a
02ed1 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02ed5 7436                           je         0x7f138844210d
02ed7 4983c202                       add        r10, 2
02edb 4983fa2e                       cmp        r10, 0x2e
02edf 75f0                           jne        0x7f13884420d1
02ee1 41ba2a000000                   mov        r10d, 0x2a
02ee7 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02eec 7412                           je         0x7f1388442100
02eee 4983c202                       add        r10, 2
02ef2 4983fa2e                       cmp        r10, 0x2e
02ef6 75ef                           jne        0x7f13884420e7
02ef8 41ba29000000                   mov        r10d, 0x29
02efe eb11                           jmp        0x7f1388442111
02f00 50                             push       rax
02f01 4833c0                         xor        rax, rax
02f04 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02f0a 58                             pop        rax
02f0b ebbe                           jmp        0x7f13884420cb
02f0d 4983c201                       add        r10, 1
02f11 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02f16 8b4804                         mov        ecx, dword ptr [rax + 4]
02f19 48bad8bf2e78137f0000           movabs     rdx, 0x7f13782ebfd8
02f23 4883827801000001               add        qword ptr [rdx + 0x178], 1
02f2b 48ba90aa2e78137f0000           movabs     rdx, 0x7f13782eaa90
02f35 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02f39 4183c002                       add        r8d, 2
02f3d 44894270                       mov        dword ptr [rdx + 0x70], r8d
02f41 4181e0feff1f00                 and        r8d, 0x1ffffe
02f48 4585c0                         test       r8d, r8d
02f4b 0f8411220000                   je         0x7f1388444362
02f51 48bad8bf2e78137f0000           movabs     rdx, 0x7f13782ebfd8
02f5b 4883828801000001               add        qword ptr [rdx + 0x188], 1
02f63 8b842490020000                 mov        eax, dword ptr [rsp + 0x290]
02f6a 4863c0                         movsxd     rax, eax
02f6d ba08000000                     mov        edx, 8
02f72 4c8bc8                         mov        r9, rax
02f75 4c03ca                         add        r9, rdx
02f78 48ba789e2e78137f0000           movabs     rdx, 0x7f13782e9e78
02f82 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02f86 4183c002                       add        r8d, 2
02f8a 44894270                       mov        dword ptr [rdx + 0x70], r8d
02f8e 4181e0feff1f00                 and        r8d, 0x1ffffe
02f95 4585c0                         test       r8d, r8d
02f98 0f84e5210000                   je         0x7f1388444383
02f9e 48ba789e2e78137f0000           movabs     rdx, 0x7f13782e9e78
02fa8 488382d800000001               add        qword ptr [rdx + 0xd8], 1
02fb0 48baf09f2e78137f0000           movabs     rdx, 0x7f13782e9ff0
02fba 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02fbe 4183c002                       add        r8d, 2
02fc2 44894270                       mov        dword ptr [rdx + 0x70], r8d
02fc6 4181e0feff1f00                 and        r8d, 0x1ffffe
02fcd 4585c0                         test       r8d, r8d
02fd0 0f84ce210000                   je         0x7f13884443a4
02fd6 48bad8bf2e78137f0000           movabs     rdx, 0x7f13782ebfd8
02fe0 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
02fe8 48bac857bfe200000000           movabs     rdx, 0xe2bf57c8
02ff2 ba02000000                     mov        edx, 2
02ff7 4c8b842400020000               mov        r8, qword ptr [rsp + 0x200]
02fff bf00000000                     mov        edi, 0
03004 488b9c2488020000               mov        rbx, qword ptr [rsp + 0x288]
0300c 48891c24                       mov        qword ptr [rsp], rbx
03010 488b9c2400020000               mov        rbx, qword ptr [rsp + 0x200]
03018 48895c2408                     mov        qword ptr [rsp + 8], rbx
0301d 4889442410                     mov        qword ptr [rsp + 0x10], rax
03022 49bac857bfe200000000           movabs     r10, 0xe2bf57c8
0302c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03031 48899c2400020000               mov        qword ptr [rsp + 0x200], rbx
03039 660f1f440000                   nop        word ptr [rax + rax]
0303f e81c864b07                     call       0x7f138f8fa860
03044 0f1f84003c310011               nop        dword ptr [rax + rax + 0x1100313c]
0304c 8b842478020000                 mov        eax, dword ptr [rsp + 0x278]
03053 83c010                         add        eax, 0x10
03056 8b9c2480020000                 mov        ebx, dword ptr [rsp + 0x280]
0305d 83c310                         add        ebx, 0x10
03060 3b842484020000                 cmp        eax, dword ptr [rsp + 0x284]
03067 ba02000000                     mov        edx, 2
0306c 7c05                           jl         0x7f1388442273
0306e ba00000000                     mov        edx, 0
03073 48b900e04b78137f0000           movabs     rcx, 0x7f13784be000
0307d 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
03081 4403c2                         add        r8d, edx
03084 44894174                       mov        dword ptr [rcx + 0x74], r8d
03088 85d2                           test       edx, edx
0308a 7506                           jne        0x7f1388442292
0308c 41b802000000                   mov        r8d, 2
03092 4181e0fe3f0000                 and        r8d, 0x3ffe
03099 4585c0                         test       r8d, r8d
0309c 0f8423210000                   je         0x7f13884443c5
030a2 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
030a6 418502                         test       dword ptr [r10], eax
030a9 3b842484020000                 cmp        eax, dword ptr [rsp + 0x284]
030b0 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
030ba b940070000                     mov        ecx, 0x740
030bf 7c05                           jl         0x7f13884422c6
030c1 b950070000                     mov        ecx, 0x750
030c6 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
030ca 4d8d4001                       lea        r8, [r8 + 1]
030ce 4c89040a                       mov        qword ptr [rdx + rcx], r8
030d2 0f8c58f5ffff                   jl         0x7f1388441830
030d8 448bac2484020000               mov        r13d, dword ptr [rsp + 0x284]
030e0 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
030ea ff8260070000                   inc        dword ptr [rdx + 0x760]
030f0 e929100000                     jmp        0x7f138844331e
030f5 4183fb08                       cmp        r11d, 8
030f9 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
03103 b978070000                     mov        ecx, 0x778
03108 7c05                           jl         0x7f138844230f
0310a b988070000                     mov        ecx, 0x788
0310f 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
03113 4d8d4001                       lea        r8, [r8 + 1]
03117 4c89040a                       mov        qword ptr [rdx + rcx], r8
0311b 0f8c8e050000                   jl         0x7f13884428af
03121 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
03129 4403ac2410020000               add        r13d, dword ptr [rsp + 0x210]
03131 4489ac249c020000               mov        dword ptr [rsp + 0x29c], r13d
03139 8bbc2464020000                 mov        edi, dword ptr [rsp + 0x264]
03140 89bc2494020000                 mov        dword ptr [rsp + 0x294], edi
03147 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
0314f 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
03159 4883829807000001               add        qword ptr [rdx + 0x798], 1
03161 48ba189e088900000000           movabs     rdx, 0x89089e18
0316b 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0316e 83c102                         add        ecx, 2
03171 894a70                         mov        dword ptr [rdx + 0x70], ecx
03174 81e1feff1f00                   and        ecx, 0x1ffffe
0317a 85c9                           test       ecx, ecx
0317c 0f8464200000                   je         0x7f13884443e6
03182 48ba189e088900000000           movabs     rdx, 0x89089e18
0318c 488d92d8000000                 lea        rdx, [rdx + 0xd8]
03193 4885c0                         test       rax, rax
03196 750c                           jne        0x7f13884423a4
03198 f6420801                       test       byte ptr [rdx + 8], 1
0319c 7506                           jne        0x7f13884423a4
0319e f048834a0801                   lock or    qword ptr [rdx + 8], 1
031a4 48ba20172178137f0000           movabs     rdx, 0x7f1378211720
031ae 488d9240030000                 lea        rdx, [rdx + 0x340]
031b5 4885c0                         test       rax, rax
031b8 750e                           jne        0x7f13884423c8
031ba f6421001                       test       byte ptr [rdx + 0x10], 1
031be 7534                           jne        0x7f13884423f4
031c0 f048834a1001                   lock or    qword ptr [rdx + 0x10], 1
031c6 eb2c                           jmp        0x7f13884423f4
031c8 8b08                           mov        ecx, dword ptr [rax]
031ca c1e90d                         shr        ecx, 0xd
031cd 48c1e10a                       shl        rcx, 0xa
031d1 41ba00000088                   mov        r10d, 0x88000000
031d7 4903ca                         add        rcx, r10
031da 4c8bd1                         mov        r10, rcx
031dd 48334a10                       xor        rcx, qword ptr [rdx + 0x10]
031e1 48f7c1fcffffff                 test       rcx, -4
031e8 740a                           je         0x7f13884423f4
031ea f6c102                         test       cl, 2
031ed 7505                           jne        0x7f13884423f4
031ef 48834a1002                     or         qword ptr [rdx + 0x10], 2
031f4 48ba189e088900000000           movabs     rdx, 0x89089e18
031fe 488382a800000001               add        qword ptr [rdx + 0xa8], 1
03206 48ba20172178137f0000           movabs     rdx, 0x7f1378211720
03210 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03213 83c102                         add        ecx, 2
03216 894a70                         mov        dword ptr [rdx + 0x70], ecx
03219 81e1feff1f00                   and        ecx, 0x1ffffe
0321f 85c9                           test       ecx, ecx
03221 0f84e01f0000                   je         0x7f1388444407
03227 48ba98f7b6e200000000           movabs     rdx, 0xe2b6f798
03231 48b920172178137f0000           movabs     rcx, 0x7f1378211720
0323b 8b12                           mov        edx, dword ptr [rdx]
0323d c1ea0d                         shr        edx, 0xd
03240 48c1e20a                       shl        rdx, 0xa
03244 41ba00000088                   mov        r10d, 0x88000000
0324a 4903d2                         add        rdx, r10
0324d 41ba16000000                   mov        r10d, 0x16
03253 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03257 7436                           je         0x7f138844248f
03259 4983c202                       add        r10, 2
0325d 4983fa1a                       cmp        r10, 0x1a
03261 75f0                           jne        0x7f1388442453
03263 41ba16000000                   mov        r10d, 0x16
03269 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0326e 7412                           je         0x7f1388442482
03270 4983c202                       add        r10, 2
03274 4983fa1a                       cmp        r10, 0x1a
03278 75ef                           jne        0x7f1388442469
0327a 41ba15000000                   mov        r10d, 0x15
03280 eb11                           jmp        0x7f1388442493
03282 50                             push       rax
03283 4833c0                         xor        rax, rax
03286 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
0328c 58                             pop        rax
0328d ebbe                           jmp        0x7f138844244d
0328f 4983c201                       add        r10, 1
03293 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03298 48bac85b1578137f0000           movabs     rdx, 0x7f1378155bc8
032a2 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
032a5 83c102                         add        ecx, 2
032a8 894a70                         mov        dword ptr [rdx + 0x70], ecx
032ab 81e1feff1f00                   and        ecx, 0x1ffffe
032b1 85c9                           test       ecx, ecx
032b3 0f846f1f0000                   je         0x7f1388444428
032b9 48bac85b1578137f0000           movabs     rdx, 0x7f1378155bc8
032c3 ff82a8000000                   inc        dword ptr [rdx + 0xa8]
032c9 48ba20172178137f0000           movabs     rdx, 0x7f1378211720
032d3 ff8200010000                   inc        dword ptr [rdx + 0x100]
032d9 48ba20172178137f0000           movabs     rdx, 0x7f1378211720
032e3 ff8220010000                   inc        dword ptr [rdx + 0x120]
032e9 48ba307239e200000000           movabs     rdx, 0xe2397230
032f3 48b920172178137f0000           movabs     rcx, 0x7f1378211720
032fd 8b12                           mov        edx, dword ptr [rdx]
032ff c1ea0d                         shr        edx, 0xd
03302 48c1e20a                       shl        rdx, 0xa
03306 41ba00000088                   mov        r10d, 0x88000000
0330c 4903d2                         add        rdx, r10
0330f 41ba27000000                   mov        r10d, 0x27
03315 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03319 7436                           je         0x7f1388442551
0331b 4983c202                       add        r10, 2
0331f 4983fa2b                       cmp        r10, 0x2b
03323 75f0                           jne        0x7f1388442515
03325 41ba27000000                   mov        r10d, 0x27
0332b 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03330 7412                           je         0x7f1388442544
03332 4983c202                       add        r10, 2
03336 4983fa2b                       cmp        r10, 0x2b
0333a 75ef                           jne        0x7f138844252b
0333c 41ba26000000                   mov        r10d, 0x26
03342 eb11                           jmp        0x7f1388442555
03344 50                             push       rax
03345 4833c0                         xor        rax, rax
03348 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
0334e 58                             pop        rax
0334f ebbe                           jmp        0x7f138844250f
03351 4983c201                       add        r10, 1
03355 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0335a 48ba30661578137f0000           movabs     rdx, 0x7f1378156630
03364 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03367 83c102                         add        ecx, 2
0336a 894a70                         mov        dword ptr [rdx + 0x70], ecx
0336d 81e1feff1f00                   and        ecx, 0x1ffffe
03373 85c9                           test       ecx, ecx
03375 0f84ce1e0000                   je         0x7f1388444449
0337b 48ba30661578137f0000           movabs     rdx, 0x7f1378156630
03385 ff82a8000000                   inc        dword ptr [rdx + 0xa8]
0338b 48ba20172178137f0000           movabs     rdx, 0x7f1378211720
03395 488d9280010000                 lea        rdx, [rdx + 0x180]
0339c 4885c0                         test       rax, rax
0339f 750e                           jne        0x7f13884425af
033a1 f6421801                       test       byte ptr [rdx + 0x18], 1
033a5 7534                           jne        0x7f13884425db
033a7 f048834a1801                   lock or    qword ptr [rdx + 0x18], 1
033ad eb2c                           jmp        0x7f13884425db
033af 8b08                           mov        ecx, dword ptr [rax]
033b1 c1e90d                         shr        ecx, 0xd
033b4 48c1e10a                       shl        rcx, 0xa
033b8 41ba00000088                   mov        r10d, 0x88000000
033be 4903ca                         add        rcx, r10
033c1 4c8bd1                         mov        r10, rcx
033c4 48334a18                       xor        rcx, qword ptr [rdx + 0x18]
033c8 48f7c1fcffffff                 test       rcx, -4
033cf 740a                           je         0x7f13884425db
033d1 f6c102                         test       cl, 2
033d4 7505                           jne        0x7f13884425db
033d6 48834a1802                     or         qword ptr [rdx + 0x18], 2
033db 48ba20172178137f0000           movabs     rdx, 0x7f1378211720
033e5 4883827001000001               add        qword ptr [rdx + 0x170], 1
033ed 48ba881b2178137f0000           movabs     rdx, 0x7f1378211b88
033f7 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
033fa 83c102                         add        ecx, 2
033fd 894a70                         mov        dword ptr [rdx + 0x70], ecx
03400 81e1feff1f00                   and        ecx, 0x1ffffe
03406 85c9                           test       ecx, ecx
03408 0f845c1e0000                   je         0x7f138844446a
0340e 4885c0                         test       rax, rax
03411 49b8881b2178137f0000           movabs     r8, 0x7f1378211b88
0341b 750d                           jne        0x7f138844262a
0341d 418088d100000001               or         byte ptr [r8 + 0xd1], 1
03425 e98a000000                     jmp        0x7f13884426b4
0342a 8b30                           mov        esi, dword ptr [rax]
0342c c1ee0d                         shr        esi, 0xd
0342f 48c1e60a                       shl        rsi, 0xa
03433 41ba00000088                   mov        r10d, 0x88000000
03439 4903f2                         add        rsi, r10
0343c 41ba1c000000                   mov        r10d, 0x1c
03442 4b3b34d0                       cmp        rsi, qword ptr [r8 + r10*8]
03446 7436                           je         0x7f138844267e
03448 4983c202                       add        r10, 2
0344c 4983fa20                       cmp        r10, 0x20
03450 75f0                           jne        0x7f1388442642
03452 41ba1c000000                   mov        r10d, 0x1c
03458 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
0345d 7412                           je         0x7f1388442671
0345f 4983c202                       add        r10, 2
03463 4983fa20                       cmp        r10, 0x20
03467 75ef                           jne        0x7f1388442658
03469 41ba1b000000                   mov        r10d, 0x1b
0346f eb11                           jmp        0x7f1388442682
03471 50                             push       rax
03472 4833c0                         xor        rax, rax
03475 f04b0fb134d0                   lock cmpxchg qword ptr [r8 + r10*8], rsi
0347b 58                             pop        rax
0347c ebbe                           jmp        0x7f138844263c
0347e 4983c201                       add        r10, 1
03482 4b8304d001                     add        qword ptr [r8 + r10*8], 1
03487 48be0090178800000000           movabs     rsi, 0x88179000
03491 448b00                         mov        r8d, dword ptr [rax]
03494 41c1e80d                       shr        r8d, 0xd
03498 49c1e00a                       shl        r8, 0xa
0349c 41ba00000088                   mov        r10d, 0x88000000
034a2 4d03c2                         add        r8, r10
034a5 493b7038                       cmp        rsi, qword ptr [r8 + 0x38]
034a9 0f85dc1d0000                   jne        0x7f138844448b
034af e900000000                     jmp        0x7f13884426b4
034b4 488bd0                         mov        rdx, rax
034b7 48b9881b2178137f0000           movabs     rcx, 0x7f1378211b88
034c1 4883810801000001               add        qword ptr [rcx + 0x108], 1
034c9 48b958132178137f0000           movabs     rcx, 0x7f1378211358
034d3 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
034d7 4183c002                       add        r8d, 2
034db 44894170                       mov        dword ptr [rcx + 0x70], r8d
034df 4181e0feff1f00                 and        r8d, 0x1ffffe
034e6 4585c0                         test       r8d, r8d
034e9 0f84a51d0000                   je         0x7f1388444494
034ef 8b4a04                         mov        ecx, dword ptr [rdx + 4]
034f2 49b858132178137f0000           movabs     r8, 0x7f1378211358
034fc 498380a800000001               add        qword ptr [r8 + 0xa8], 1
03504 83e907                         sub        ecx, 7
03507 49b8a01923e200000000           movabs     r8, 0xe22319a0
03511 41b800000000                   mov        r8d, 0
03517 413bd8                         cmp        ebx, r8d
0351a 0f8c9a1d0000                   jl         0x7f13884444ba
03520 3bd9                           cmp        ebx, ecx
03522 0f8d9f1d0000                   jge        0x7f13884444c7
03528 488bcb                         mov        rcx, rbx
0352b 48be28c122e200000000           movabs     rsi, 0xe222c128
03535 4c8bc6                         mov        r8, rsi
03538 49b9881b2178137f0000           movabs     r9, 0x7f1378211b88
03542 458b00                         mov        r8d, dword ptr [r8]
03545 41c1e80d                       shr        r8d, 0xd
03549 49c1e00a                       shl        r8, 0xa
0354d 41ba00000088                   mov        r10d, 0x88000000
03553 4d03c2                         add        r8, r10
03556 41ba24000000                   mov        r10d, 0x24
0355c 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
03560 7436                           je         0x7f1388442798
03562 4983c202                       add        r10, 2
03566 4983fa28                       cmp        r10, 0x28
0356a 75f0                           jne        0x7f138844275c
0356c 41ba24000000                   mov        r10d, 0x24
03572 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
03577 7412                           je         0x7f138844278b
03579 4983c202                       add        r10, 2
0357d 4983fa28                       cmp        r10, 0x28
03581 75ef                           jne        0x7f1388442772
03583 41ba23000000                   mov        r10d, 0x23
03589 eb11                           jmp        0x7f138844279c
0358b 50                             push       rax
0358c 4833c0                         xor        rax, rax
0358f f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
03595 58                             pop        rax
03596 ebbe                           jmp        0x7f1388442756
03598 4983c201                       add        r10, 1
0359c 4b8304d101                     add        qword ptr [r9 + r10*8], 1
035a1 4863c9                         movsxd     rcx, ecx
035a4 41ba08000000                   mov        r10d, 8
035aa 4903ca                         add        rcx, r10
035ad 41b800000000                   mov        r8d, 0
035b3 899c2498020000                 mov        dword ptr [rsp + 0x298], ebx
035ba 4889842400020000               mov        qword ptr [rsp + 0x200], rax
035c2 0f1f440000                     nop        dword ptr [rax + rax]
035c7 e894764b07                     call       0x7f138f8f9e60
035cc 0f1f8400c4360013               nop        dword ptr [rax + rax + 0x130036c4]
035d4 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
035de 488386a807000001               add        qword ptr [rsi + 0x7a8], 1
035e6 488bb42400020000               mov        rsi, qword ptr [rsp + 0x200]
035ee 8b942494020000                 mov        edx, dword ptr [rsp + 0x294]
035f5 488bc8                         mov        rcx, rax
035f8 0f1f8000000000                 nop        dword ptr [rax]
035ff e85c804b07                     call       0x7f138f8fa860
03604 0f1f8400fc360014               nop        dword ptr [rax + rax + 0x140036fc]
0360c 8bbc2494020000                 mov        edi, dword ptr [rsp + 0x294]
03613 83c708                         add        edi, 8
03616 8b9c2498020000                 mov        ebx, dword ptr [rsp + 0x298]
0361d 83c308                         add        ebx, 8
03620 3bbc249c020000                 cmp        edi, dword ptr [rsp + 0x29c]
03627 be02000000                     mov        esi, 2
0362c 7c05                           jl         0x7f1388442833
0362e be00000000                     mov        esi, 0
03633 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
0363d 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
03640 03ce                           add        ecx, esi
03642 894a74                         mov        dword ptr [rdx + 0x74], ecx
03645 85f6                           test       esi, esi
03647 7505                           jne        0x7f138844284e
03649 b902000000                     mov        ecx, 2
0364e 81e1fe3f0000                   and        ecx, 0x3ffe
03654 85c9                           test       ecx, ecx
03656 0f84781c0000                   je         0x7f13884444d4
0365c 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03660 418502                         test       dword ptr [r10], eax
03663 3bbc249c020000                 cmp        edi, dword ptr [rsp + 0x29c]
0366a 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
03674 bab8070000                     mov        edx, 0x7b8
03679 7c05                           jl         0x7f1388442880
0367b bac8070000                     mov        edx, 0x7c8
03680 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
03684 488d4901                       lea        rcx, [rcx + 1]
03688 48890c16                       mov        qword ptr [rsi + rdx], rcx
0368c 0f8caefaffff                   jl         0x7f1388442340
03692 448bac249c020000               mov        r13d, dword ptr [rsp + 0x29c]
0369a 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
036a4 ff86d8070000                   inc        dword ptr [rsi + 0x7d8]
036aa e96f0a0000                     jmp        0x7f138844331e
036af 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
036b9 488386f007000001               add        qword ptr [rsi + 0x7f0], 1
036c1 488bb42400020000               mov        rsi, qword ptr [rsp + 0x200]
036c9 8b942464020000                 mov        edx, dword ptr [rsp + 0x264]
036d0 488bcb                         mov        rcx, rbx
036d3 4d8bc3                         mov        r8, r11
036d6 448b8c2410020000               mov        r9d, dword ptr [rsp + 0x210]
036de 90                             nop        
036df e87c7f4b07                     call       0x7f138f8fa860
036e4 0f1f8400dc370016               nop        dword ptr [rax + rax + 0x160037dc]
036ec 4c8be8                         mov        r13, rax
036ef e92a0a0000                     jmp        0x7f138844331e
036f4 89bc2468020000                 mov        dword ptr [rsp + 0x268], edi
036fb 4489ac2464020000               mov        dword ptr [rsp + 0x264], r13d
03703 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
0370b 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
03715 488386c805000001               add        qword ptr [rsi + 0x5c8], 1
0371d 48be18b32e78137f0000           movabs     rsi, 0x7f13782eb318
03727 8b5670                         mov        edx, dword ptr [rsi + 0x70]
0372a 83c202                         add        edx, 2
0372d 895670                         mov        dword ptr [rsi + 0x70], edx
03730 81e2feff1f00                   and        edx, 0x1ffffe
03736 85d2                           test       edx, edx
03738 0f84b71b0000                   je         0x7f13884444f5
0373e 48be60e0bde200000000           movabs     rsi, 0xe2bde060
03748 48ba18b32e78137f0000           movabs     rdx, 0x7f13782eb318
03752 8b36                           mov        esi, dword ptr [rsi]
03754 c1ee0d                         shr        esi, 0xd
03757 48c1e60a                       shl        rsi, 0xa
0375b 41ba00000088                   mov        r10d, 0x88000000
03761 4903f2                         add        rsi, r10
03764 41ba16000000                   mov        r10d, 0x16
0376a 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
0376e 7436                           je         0x7f13884429a6
03770 4983c202                       add        r10, 2
03774 4983fa1a                       cmp        r10, 0x1a
03778 75f0                           jne        0x7f138844296a
0377a 41ba16000000                   mov        r10d, 0x16
03780 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03785 7412                           je         0x7f1388442999
03787 4983c202                       add        r10, 2
0378b 4983fa1a                       cmp        r10, 0x1a
0378f 75ef                           jne        0x7f1388442980
03791 41ba15000000                   mov        r10d, 0x15
03797 eb11                           jmp        0x7f13884429aa
03799 50                             push       rax
0379a 4833c0                         xor        rax, rax
0379d f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
037a3 58                             pop        rax
037a4 ebbe                           jmp        0x7f1388442964
037a6 4983c201                       add        r10, 1
037aa 4a8304d201                     add        qword ptr [rdx + r10*8], 1
037af 448b5804                       mov        r11d, dword ptr [rax + 4]
037b3 48be18b32e78137f0000           movabs     rsi, 0x7f13782eb318
037bd 488386d800000001               add        qword ptr [rsi + 0xd8], 1
037c5 48be58a82e78137f0000           movabs     rsi, 0x7f13782ea858
037cf 8b5670                         mov        edx, dword ptr [rsi + 0x70]
037d2 83c202                         add        edx, 2
037d5 895670                         mov        dword ptr [rsi + 0x70], edx
037d8 81e2feff1f00                   and        edx, 0x1ffffe
037de 85d2                           test       edx, edx
037e0 0f84351b0000                   je         0x7f138844451b
037e6 48be58a82e78137f0000           movabs     rsi, 0x7f13782ea858
037f0 4883860801000001               add        qword ptr [rsi + 0x108], 1
037f8 498bf3                         mov        rsi, r11
037fb 83ee0f                         sub        esi, 0xf
037fe 48bad0771878137f0000           movabs     rdx, 0x7f13781877d0
03808 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0380b 83c102                         add        ecx, 2
0380e 894a70                         mov        dword ptr [rdx + 0x70], ecx
03811 81e1feff1f00                   and        ecx, 0x1ffffe
03817 85c9                           test       ecx, ecx
03819 0f841d1b0000                   je         0x7f138844453c
0381f 48bad0771878137f0000           movabs     rdx, 0x7f13781877d0
03829 488382a800000001               add        qword ptr [rdx + 0xa8], 1
03831 48ba0000000000000000           movabs     rdx, 0
0383b ba00000000                     mov        edx, 0
03840 3bda                           cmp        ebx, edx
03842 0f8c151b0000                   jl         0x7f138844455d
03848 3bde                           cmp        ebx, esi
0384a 0f8d1a1b0000                   jge        0x7f138844456a
03850 48be60e0bde200000000           movabs     rsi, 0xe2bde060
0385a 488bd6                         mov        rdx, rsi
0385d 48b918b32e78137f0000           movabs     rcx, 0x7f13782eb318
03867 8b12                           mov        edx, dword ptr [rdx]
03869 c1ea0d                         shr        edx, 0xd
0386c 48c1e20a                       shl        rdx, 0xa
03870 41ba00000088                   mov        r10d, 0x88000000
03876 4903d2                         add        rdx, r10
03879 41ba24000000                   mov        r10d, 0x24
0387f 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03883 7436                           je         0x7f1388442abb
03885 4983c202                       add        r10, 2
03889 4983fa28                       cmp        r10, 0x28
0388d 75f0                           jne        0x7f1388442a7f
0388f 41ba24000000                   mov        r10d, 0x24
03895 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0389a 7412                           je         0x7f1388442aae
0389c 4983c202                       add        r10, 2
038a0 4983fa28                       cmp        r10, 0x28
038a4 75ef                           jne        0x7f1388442a95
038a6 41ba23000000                   mov        r10d, 0x23
038ac eb11                           jmp        0x7f1388442abf
038ae 50                             push       rax
038af 4833c0                         xor        rax, rax
038b2 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
038b8 58                             pop        rax
038b9 ebbe                           jmp        0x7f1388442a79
038bb 4983c201                       add        r10, 1
038bf 4a8304d101                     add        qword ptr [rcx + r10*8], 1
038c4 48ba28a12e78137f0000           movabs     rdx, 0x7f13782ea128
038ce 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
038d1 83c102                         add        ecx, 2
038d4 894a70                         mov        dword ptr [rdx + 0x70], ecx
038d7 81e1feff1f00                   and        ecx, 0x1ffffe
038dd 85c9                           test       ecx, ecx
038df 0f84921a0000                   je         0x7f1388444577
038e5 48ba28a12e78137f0000           movabs     rdx, 0x7f13782ea128
038ef 488382a800000001               add        qword ptr [rdx + 0xa8], 1
038f7 48be50a22e78137f0000           movabs     rsi, 0x7f13782ea250
03901 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03904 83c202                         add        edx, 2
03907 895670                         mov        dword ptr [rsi + 0x70], edx
0390a 81e2feff1f00                   and        edx, 0x1ffffe
03910 85d2                           test       edx, edx
03912 0f84801a0000                   je         0x7f1388444598
03918 48be50a22e78137f0000           movabs     rsi, 0x7f13782ea250
03922 ff86b8000000                   inc        dword ptr [rsi + 0xb8]
03928 44899c24a0020000               mov        dword ptr [rsp + 0x2a0], r11d
03930 48be5860bee200000000           movabs     rsi, 0xe2be6058
0393a 488bd6                         mov        rdx, rsi
0393d 48b918b32e78137f0000           movabs     rcx, 0x7f13782eb318
03947 4883815801000001               add        qword ptr [rcx + 0x158], 1
0394f 48bae0b42e78137f0000           movabs     rdx, 0x7f13782eb4e0
03959 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0395c 83c102                         add        ecx, 2
0395f 894a70                         mov        dword ptr [rdx + 0x70], ecx
03962 81e1feff1f00                   and        ecx, 0x1ffffe
03968 85c9                           test       ecx, ecx
0396a 0f84491a0000                   je         0x7f13884445b9
03970 488bd6                         mov        rdx, rsi
03973 48b9e0b42e78137f0000           movabs     rcx, 0x7f13782eb4e0
0397d 488381a800000001               add        qword ptr [rcx + 0xa8], 1
03985 48bac0b52e78137f0000           movabs     rdx, 0x7f13782eb5c0
0398f 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03992 83c102                         add        ecx, 2
03995 894a70                         mov        dword ptr [rdx + 0x70], ecx
03998 81e1feff1f00                   and        ecx, 0x1ffffe
0399e 85c9                           test       ecx, ecx
039a0 0f84341a0000                   je         0x7f13884445da
039a6 48bac0b52e78137f0000           movabs     rdx, 0x7f13782eb5c0
039b0 488382b800000001               add        qword ptr [rdx + 0xb8], 1
039b8 48bed0a92e78137f0000           movabs     rsi, 0x7f13782ea9d0
039c2 8b5670                         mov        edx, dword ptr [rsi + 0x70]
039c5 83c202                         add        edx, 2
039c8 895670                         mov        dword ptr [rsi + 0x70], edx
039cb 81e2feff1f00                   and        edx, 0x1ffffe
039d1 85d2                           test       edx, edx
039d3 0f84221a0000                   je         0x7f13884445fb
039d9 48be60e0bde200000000           movabs     rsi, 0xe2bde060
039e3 488bd6                         mov        rdx, rsi
039e6 48b9c0b52e78137f0000           movabs     rcx, 0x7f13782eb5c0
039f0 8b12                           mov        edx, dword ptr [rdx]
039f2 c1ea0d                         shr        edx, 0xd
039f5 48c1e20a                       shl        rdx, 0xa
039f9 41ba00000088                   mov        r10d, 0x88000000
039ff 4903d2                         add        rdx, r10
03a02 41ba1c000000                   mov        r10d, 0x1c
03a08 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03a0c 7436                           je         0x7f1388442c44
03a0e 4983c202                       add        r10, 2
03a12 4983fa20                       cmp        r10, 0x20
03a16 75f0                           jne        0x7f1388442c08
03a18 41ba1c000000                   mov        r10d, 0x1c
03a1e 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03a23 7412                           je         0x7f1388442c37
03a25 4983c202                       add        r10, 2
03a29 4983fa20                       cmp        r10, 0x20
03a2d 75ef                           jne        0x7f1388442c1e
03a2f 41ba1b000000                   mov        r10d, 0x1b
03a35 eb11                           jmp        0x7f1388442c48
03a37 50                             push       rax
03a38 4833c0                         xor        rax, rax
03a3b f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03a41 58                             pop        rax
03a42 ebbe                           jmp        0x7f1388442c02
03a44 4983c201                       add        r10, 1
03a48 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03a4d 48bac0b52e78137f0000           movabs     rdx, 0x7f13782eb5c0
03a57 8b36                           mov        esi, dword ptr [rsi]
03a59 c1ee0d                         shr        esi, 0xd
03a5c 48c1e60a                       shl        rsi, 0xa
03a60 41ba00000088                   mov        r10d, 0x88000000
03a66 4903f2                         add        rsi, r10
03a69 41ba22000000                   mov        r10d, 0x22
03a6f 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03a73 7436                           je         0x7f1388442cab
03a75 4983c202                       add        r10, 2
03a79 4983fa26                       cmp        r10, 0x26
03a7d 75f0                           jne        0x7f1388442c6f
03a7f 41ba22000000                   mov        r10d, 0x22
03a85 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03a8a 7412                           je         0x7f1388442c9e
03a8c 4983c202                       add        r10, 2
03a90 4983fa26                       cmp        r10, 0x26
03a94 75ef                           jne        0x7f1388442c85
03a96 41ba21000000                   mov        r10d, 0x21
03a9c eb11                           jmp        0x7f1388442caf
03a9e 50                             push       rax
03a9f 4833c0                         xor        rax, rax
03aa2 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03aa8 58                             pop        rax
03aa9 ebbe                           jmp        0x7f1388442c69
03aab 4983c201                       add        r10, 1
03aaf 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03ab4 48bec0b52e78137f0000           movabs     rsi, 0x7f13782eb5c0
03abe 4883863801000001               add        qword ptr [rsi + 0x138], 1
03ac6 48be90aa2e78137f0000           movabs     rsi, 0x7f13782eaa90
03ad0 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03ad3 83c202                         add        edx, 2
03ad6 895670                         mov        dword ptr [rsi + 0x70], edx
03ad9 81e2feff1f00                   and        edx, 0x1ffffe
03adf 85d2                           test       edx, edx
03ae1 0f8435190000                   je         0x7f138844461c
03ae7 48bec0b52e78137f0000           movabs     rsi, 0x7f13782eb5c0
03af1 4883864801000001               add        qword ptr [rsi + 0x148], 1
03af9 4863db                         movsxd     rbx, ebx
03afc be08000000                     mov        esi, 8
03b01 4c8bcb                         mov        r9, rbx
03b04 4c03ce                         add        r9, rsi
03b07 48be789e2e78137f0000           movabs     rsi, 0x7f13782e9e78
03b11 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03b14 83c202                         add        edx, 2
03b17 895670                         mov        dword ptr [rsi + 0x70], edx
03b1a 81e2feff1f00                   and        edx, 0x1ffffe
03b20 85d2                           test       edx, edx
03b22 0f8415190000                   je         0x7f138844463d
03b28 48be789e2e78137f0000           movabs     rsi, 0x7f13782e9e78
03b32 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03b3a 48bef09f2e78137f0000           movabs     rsi, 0x7f13782e9ff0
03b44 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03b47 83c202                         add        edx, 2
03b4a 895670                         mov        dword ptr [rsi + 0x70], edx
03b4d 81e2feff1f00                   and        edx, 0x1ffffe
03b53 85d2                           test       edx, edx
03b55 0f8403190000                   je         0x7f138844465e
03b5b 48bec0b52e78137f0000           movabs     rsi, 0x7f13782eb5c0
03b65 4883866801000001               add        qword ptr [rsi + 0x168], 1
03b6d 48be28b9bee200000000           movabs     rsi, 0xe2beb928
03b77 48bea8e0bde200000000           movabs     rsi, 0xe2bde0a8
03b81 ba02000000                     mov        edx, 2
03b86 b910000000                     mov        ecx, 0x10
03b8b 4c8bc0                         mov        r8, rax
03b8e bf00000000                     mov        edi, 0
03b93 48890424                       mov        qword ptr [rsp], rax
03b97 48895c2408                     mov        qword ptr [rsp + 8], rbx
03b9c 49ba60e0bde200000000           movabs     r10, 0xe2bde060
03ba6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03bab 49ba28b9bee200000000           movabs     r10, 0xe2beb928
03bb5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03bba 4889842400020000               mov        qword ptr [rsp + 0x200], rax
03bc2 0f1f440000                     nop        dword ptr [rax + rax]
03bc7 e83427a307                     call       0x7f138fe75500
03bcc 0f1f8400c43c0017               nop        dword ptr [rax + rax + 0x17003cc4]
03bd4 4885c0                         test       rax, rax
03bd7 48bbc0b52e78137f0000           movabs     rbx, 0x7f13782eb5c0
03be1 750c                           jne        0x7f1388442def
03be3 808b7101000001                 or         byte ptr [rbx + 0x171], 1
03bea e988000000                     jmp        0x7f1388442e77
03bef 8b38                           mov        edi, dword ptr [rax]
03bf1 c1ef0d                         shr        edi, 0xd
03bf4 48c1e70a                       shl        rdi, 0xa
03bf8 41ba00000088                   mov        r10d, 0x88000000
03bfe 4903fa                         add        rdi, r10
03c01 41ba30000000                   mov        r10d, 0x30
03c07 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
03c0b 7436                           je         0x7f1388442e43
03c0d 4983c202                       add        r10, 2
03c11 4983fa34                       cmp        r10, 0x34
03c15 75f0                           jne        0x7f1388442e07
03c17 41ba30000000                   mov        r10d, 0x30
03c1d 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03c22 7412                           je         0x7f1388442e36
03c24 4983c202                       add        r10, 2
03c28 4983fa34                       cmp        r10, 0x34
03c2c 75ef                           jne        0x7f1388442e1d
03c2e 41ba2f000000                   mov        r10d, 0x2f
03c34 eb11                           jmp        0x7f1388442e47
03c36 50                             push       rax
03c37 4833c0                         xor        rax, rax
03c3a f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
03c40 58                             pop        rax
03c41 ebbe                           jmp        0x7f1388442e01
03c43 4983c201                       add        r10, 1
03c47 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03c4c 48bf00dc0c8900000000           movabs     rdi, 0x890cdc00
03c56 8b18                           mov        ebx, dword ptr [rax]
03c58 c1eb0d                         shr        ebx, 0xd
03c5b 48c1e30a                       shl        rbx, 0xa
03c5f 41ba00000088                   mov        r10d, 0x88000000
03c65 4903da                         add        rbx, r10
03c68 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
03c6c 0f850d180000                   jne        0x7f138844467f
03c72 e900000000                     jmp        0x7f1388442e77
03c77 488bf8                         mov        rdi, rax
03c7a 4889bc24a8020000               mov        qword ptr [rsp + 0x2a8], rdi
03c82 483b07                         cmp        rax, qword ptr [rdi]
03c85 488bf7                         mov        rsi, rdi
03c88 48bb00e04b78137f0000           movabs     rbx, 0x7f13784be000
03c92 8b36                           mov        esi, dword ptr [rsi]
03c94 c1ee0d                         shr        esi, 0xd
03c97 48c1e60a                       shl        rsi, 0xa
03c9b 41ba00000088                   mov        r10d, 0x88000000
03ca1 4903f2                         add        rsi, r10
03ca4 41babc000000                   mov        r10d, 0xbc
03caa 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03cae 743c                           je         0x7f1388442eec
03cb0 4983c202                       add        r10, 2
03cb4 4981fac0000000                 cmp        r10, 0xc0
03cbb 75ed                           jne        0x7f1388442eaa
03cbd 41babc000000                   mov        r10d, 0xbc
03cc3 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03cc8 7415                           je         0x7f1388442edf
03cca 4983c202                       add        r10, 2
03cce 4981fac0000000                 cmp        r10, 0xc0
03cd5 75ec                           jne        0x7f1388442ec3
03cd7 41babb000000                   mov        r10d, 0xbb
03cdd eb11                           jmp        0x7f1388442ef0
03cdf 50                             push       rax
03ce0 4833c0                         xor        rax, rax
03ce3 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
03ce9 58                             pop        rax
03cea ebb8                           jmp        0x7f1388442ea4
03cec 4983c201                       add        r10, 1
03cf0 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03cf5 48bed8bf2e78137f0000           movabs     rsi, 0x7f13782ebfd8
03cff 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
03d02 83c302                         add        ebx, 2
03d05 895e70                         mov        dword ptr [rsi + 0x70], ebx
03d08 81e3feff1f00                   and        ebx, 0x1ffffe
03d0e 85db                           test       ebx, ebx
03d10 0f8477170000                   je         0x7f138844468d
03d16 488bf7                         mov        rsi, rdi
03d19 48bbd8bf2e78137f0000           movabs     rbx, 0x7f13782ebfd8
03d23 8b36                           mov        esi, dword ptr [rsi]
03d25 c1ee0d                         shr        esi, 0xd
03d28 48c1e60a                       shl        rsi, 0xa
03d2c 41ba00000088                   mov        r10d, 0x88000000
03d32 4903f2                         add        rsi, r10
03d35 41ba16000000                   mov        r10d, 0x16
03d3b 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03d3f 7436                           je         0x7f1388442f77
03d41 4983c202                       add        r10, 2
03d45 4983fa1a                       cmp        r10, 0x1a
03d49 75f0                           jne        0x7f1388442f3b
03d4b 41ba16000000                   mov        r10d, 0x16
03d51 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03d56 7412                           je         0x7f1388442f6a
03d58 4983c202                       add        r10, 2
03d5c 4983fa1a                       cmp        r10, 0x1a
03d60 75ef                           jne        0x7f1388442f51
03d62 41ba15000000                   mov        r10d, 0x15
03d68 eb11                           jmp        0x7f1388442f7b
03d6a 50                             push       rax
03d6b 4833c0                         xor        rax, rax
03d6e f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
03d74 58                             pop        rax
03d75 ebbe                           jmp        0x7f1388442f35
03d77 4983c201                       add        r10, 1
03d7b 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03d80 488bf7                         mov        rsi, rdi
03d83 6690                           nop        
03d85 48b800622464137f0000           movabs     rax, 0x7f1364246200
03d8f e87b0fa307                     call       0x7f138fe73f0f
03d94 0f1f84008c3e0018               nop        dword ptr [rax + rax + 0x18003e8c]
03d9c 48bed8bf2e78137f0000           movabs     rsi, 0x7f13782ebfd8
03da6 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03dae 48be58a82e78137f0000           movabs     rsi, 0x7f13782ea858
03db8 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
03dbb 83c702                         add        edi, 2
03dbe 897e70                         mov        dword ptr [rsi + 0x70], edi
03dc1 81e7feff1f00                   and        edi, 0x1ffffe
03dc7 85ff                           test       edi, edi
03dc9 0f84df160000                   je         0x7f13884446ae
03dcf 448b9c24a0020000               mov        r11d, dword ptr [rsp + 0x2a0]
03dd7 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
03ddf 48be58a82e78137f0000           movabs     rsi, 0x7f13782ea858
03de9 4883860801000001               add        qword ptr [rsi + 0x108], 1
03df1 ffc8                           dec        eax
03df3 442bd8                         sub        r11d, eax
03df6 48bed0771878137f0000           movabs     rsi, 0x7f13781877d0
03e00 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
03e03 83c702                         add        edi, 2
03e06 897e70                         mov        dword ptr [rsi + 0x70], edi
03e09 81e7feff1f00                   and        edi, 0x1ffffe
03e0f 85ff                           test       edi, edi
03e11 0f84b8160000                   je         0x7f13884446cf
03e17 48bed0771878137f0000           movabs     rsi, 0x7f13781877d0
03e21 488386a800000001               add        qword ptr [rsi + 0xa8], 1
03e29 48be0000000000000000           movabs     rsi, 0
03e33 be00000000                     mov        esi, 0
03e38 443bee                         cmp        r13d, esi
03e3b 0f8caf160000                   jl         0x7f13884446f0
03e41 453beb                         cmp        r13d, r11d
03e44 0f8db3160000                   jge        0x7f13884446fd
03e4a 498bfd                         mov        rdi, r13
03e4d 89bc24a4020000                 mov        dword ptr [rsp + 0x2a4], edi
03e54 488bbc24a8020000               mov        rdi, qword ptr [rsp + 0x2a8]
03e5c 4489ac2464020000               mov        dword ptr [rsp + 0x264], r13d
03e64 488bf7                         mov        rsi, rdi
03e67 48bad8bf2e78137f0000           movabs     rdx, 0x7f13782ebfd8
03e71 8b36                           mov        esi, dword ptr [rsi]
03e73 c1ee0d                         shr        esi, 0xd
03e76 48c1e60a                       shl        rsi, 0xa
03e7a 41ba00000088                   mov        r10d, 0x88000000
03e80 4903f2                         add        rsi, r10
03e83 41ba1e000000                   mov        r10d, 0x1e
03e89 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03e8d 7436                           je         0x7f13884430c5
03e8f 4983c202                       add        r10, 2
03e93 4983fa22                       cmp        r10, 0x22
03e97 75f0                           jne        0x7f1388443089
03e99 41ba1e000000                   mov        r10d, 0x1e
03e9f 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03ea4 7412                           je         0x7f13884430b8
03ea6 4983c202                       add        r10, 2
03eaa 4983fa22                       cmp        r10, 0x22
03eae 75ef                           jne        0x7f138844309f
03eb0 41ba1d000000                   mov        r10d, 0x1d
03eb6 eb11                           jmp        0x7f13884430c9
03eb8 50                             push       rax
03eb9 4833c0                         xor        rax, rax
03ebc f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03ec2 58                             pop        rax
03ec3 ebbe                           jmp        0x7f1388443083
03ec5 4983c201                       add        r10, 1
03ec9 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03ece 488bf7                         mov        rsi, rdi
03ed1 0f1f4000                       nop        dword ptr [rax]
03ed5 48b828622464137f0000           movabs     rax, 0x7f1364246228
03edf e82b11a307                     call       0x7f138fe7420f
03ee4 0f1f8400dc3f0019               nop        dword ptr [rax + rax + 0x19003fdc]
03eec 483b00                         cmp        rax, qword ptr [rax]
03eef 488bf0                         mov        rsi, rax
03ef2 48bad8bf2e78137f0000           movabs     rdx, 0x7f13782ebfd8
03efc 8b36                           mov        esi, dword ptr [rsi]
03efe c1ee0d                         shr        esi, 0xd
03f01 48c1e60a                       shl        rsi, 0xa
03f05 41ba00000088                   mov        r10d, 0x88000000
03f0b 4903f2                         add        rsi, r10
03f0e 41ba24000000                   mov        r10d, 0x24
03f14 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03f18 7436                           je         0x7f1388443150
03f1a 4983c202                       add        r10, 2
03f1e 4983fa28                       cmp        r10, 0x28
03f22 75f0                           jne        0x7f1388443114
03f24 41ba24000000                   mov        r10d, 0x24
03f2a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03f2f 7412                           je         0x7f1388443143
03f31 4983c202                       add        r10, 2
03f35 4983fa28                       cmp        r10, 0x28
03f39 75ef                           jne        0x7f138844312a
03f3b 41ba23000000                   mov        r10d, 0x23
03f41 eb11                           jmp        0x7f1388443154
03f43 50                             push       rax
03f44 4833c0                         xor        rax, rax
03f47 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03f4d 58                             pop        rax
03f4e ebbe                           jmp        0x7f138844310e
03f50 4983c201                       add        r10, 1
03f54 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03f59 8b7024                         mov        esi, dword ptr [rax + 0x24]
03f5c 488bd0                         mov        rdx, rax
03f5f 48b9d8bf2e78137f0000           movabs     rcx, 0x7f13782ebfd8
03f69 8b12                           mov        edx, dword ptr [rdx]
03f6b c1ea0d                         shr        edx, 0xd
03f6e 48c1e20a                       shl        rdx, 0xa
03f72 41ba00000088                   mov        r10d, 0x88000000
03f78 4903d2                         add        rdx, r10
03f7b 41ba2a000000                   mov        r10d, 0x2a
03f81 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03f85 7436                           je         0x7f13884431bd
03f87 4983c202                       add        r10, 2
03f8b 4983fa2e                       cmp        r10, 0x2e
03f8f 75f0                           jne        0x7f1388443181
03f91 41ba2a000000                   mov        r10d, 0x2a
03f97 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03f9c 7412                           je         0x7f13884431b0
03f9e 4983c202                       add        r10, 2
03fa2 4983fa2e                       cmp        r10, 0x2e
03fa6 75ef                           jne        0x7f1388443197
03fa8 41ba29000000                   mov        r10d, 0x29
03fae eb11                           jmp        0x7f13884431c1
03fb0 50                             push       rax
03fb1 4833c0                         xor        rax, rax
03fb4 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03fba 58                             pop        rax
03fbb ebbe                           jmp        0x7f138844317b
03fbd 4983c201                       add        r10, 1
03fc1 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03fc6 8b4804                         mov        ecx, dword ptr [rax + 4]
03fc9 48bad8bf2e78137f0000           movabs     rdx, 0x7f13782ebfd8
03fd3 4883827801000001               add        qword ptr [rdx + 0x178], 1
03fdb 48ba90aa2e78137f0000           movabs     rdx, 0x7f13782eaa90
03fe5 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
03fe9 4183c002                       add        r8d, 2
03fed 44894270                       mov        dword ptr [rdx + 0x70], r8d
03ff1 4181e0feff1f00                 and        r8d, 0x1ffffe
03ff8 4585c0                         test       r8d, r8d
03ffb 0f840e150000                   je         0x7f138844470f
04001 48bad8bf2e78137f0000           movabs     rdx, 0x7f13782ebfd8
0400b 4883828801000001               add        qword ptr [rdx + 0x188], 1
04013 8bbc24a4020000                 mov        edi, dword ptr [rsp + 0x2a4]
0401a 4863df                         movsxd     rbx, edi
0401d ba08000000                     mov        edx, 8
04022 4c8bcb                         mov        r9, rbx
04025 4c03ca                         add        r9, rdx
04028 48ba789e2e78137f0000           movabs     rdx, 0x7f13782e9e78
04032 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
04036 4183c002                       add        r8d, 2
0403a 44894270                       mov        dword ptr [rdx + 0x70], r8d
0403e 4181e0feff1f00                 and        r8d, 0x1ffffe
04045 4585c0                         test       r8d, r8d
04048 0f84e2140000                   je         0x7f1388444730
0404e 48ba789e2e78137f0000           movabs     rdx, 0x7f13782e9e78
04058 488382d800000001               add        qword ptr [rdx + 0xd8], 1
04060 48baf09f2e78137f0000           movabs     rdx, 0x7f13782e9ff0
0406a 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
0406e 4183c002                       add        r8d, 2
04072 44894270                       mov        dword ptr [rdx + 0x70], r8d
04076 4181e0feff1f00                 and        r8d, 0x1ffffe
0407d 4585c0                         test       r8d, r8d
04080 0f84cb140000                   je         0x7f1388444751
04086 48bad8bf2e78137f0000           movabs     rdx, 0x7f13782ebfd8
04090 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
04098 48bac857bfe200000000           movabs     rdx, 0xe2bf57c8
040a2 ba02000000                     mov        edx, 2
040a7 4c8b842400020000               mov        r8, qword ptr [rsp + 0x200]
040af bf00000000                     mov        edi, 0
040b4 488b8424a8020000               mov        rax, qword ptr [rsp + 0x2a8]
040bc 48890424                       mov        qword ptr [rsp], rax
040c0 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
040c8 4889442408                     mov        qword ptr [rsp + 8], rax
040cd 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
040d2 49bac857bfe200000000           movabs     r10, 0xe2bf57c8
040dc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
040e1 4889842400020000               mov        qword ptr [rsp + 0x200], rax
040e9 660f1f440000                   nop        word ptr [rax + rax]
040ef e88c3ea307                     call       0x7f138fe77180
040f4 0f1f8400ec41001a               nop        dword ptr [rax + rax + 0x1a0041ec]
040fc 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
04104 8bb42410020000                 mov        esi, dword ptr [rsp + 0x210]
0410b 4403ee                         add        r13d, esi
0410e 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
04118 ff8608060000                   inc        dword ptr [rsi + 0x608]
0411e 8bbc2468020000                 mov        edi, dword ptr [rsp + 0x268]
04125 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
0412f ff8600080000                   inc        dword ptr [rsi + 0x800]
04135 488bdf                         mov        rbx, rdi
04138 498bc5                         mov        rax, r13
0413b 8b942428020000                 mov        edx, dword ptr [rsp + 0x228]
04142 ffc2                           inc        edx
04144 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
0414e 8b4e74                         mov        ecx, dword ptr [rsi + 0x74]
04151 83c102                         add        ecx, 2
04154 894e74                         mov        dword ptr [rsi + 0x74], ecx
04157 81e1fe3f0000                   and        ecx, 0x3ffe
0415d 85c9                           test       ecx, ecx
0415f 0f840d140000                   je         0x7f1388444772
04165 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
04169 418502                         test       dword ptr [r10], eax
0416c 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
04176 ff8628080000                   inc        dword ptr [rsi + 0x828]
0417c 4c8bd8                         mov        r11, rax
0417f 4c8bc3                         mov        r8, rbx
04182 44899c2408020000               mov        dword ptr [rsp + 0x208], r11d
0418a e991c1ffff                     jmp        0x7f138843f520
0418f 4585db                         test       r11d, r11d
04192 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
0419c b980030000                     mov        ecx, 0x380
041a1 7e05                           jle        0x7f13884433a8
041a3 b990030000                     mov        ecx, 0x390
041a8 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
041ac 4d8d4001                       lea        r8, [r8 + 1]
041b0 4c89040a                       mov        qword ptr [rdx + rcx], r8
041b4 0f8e5f010000                   jle        0x7f1388443519
041ba 488bbc2430020000               mov        rdi, qword ptr [rsp + 0x230]
041c2 482bf7                         sub        rsi, rdi
041c5 ba00000000                     mov        edx, 0
041ca 483bf2                         cmp        rsi, rdx
041cd 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
041d7 baa0030000                     mov        edx, 0x3a0
041dc 7d05                           jge        0x7f13884433e3
041de bab0030000                     mov        edx, 0x3b0
041e3 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
041e7 488d4901                       lea        rcx, [rcx + 1]
041eb 48890c16                       mov        qword ptr [rsi + rdx], rcx
041ef 0f8d24010000                   jge        0x7f1388443519
041f5 488b942470010000               mov        rdx, qword ptr [rsp + 0x170]
041fd 488b7230                       mov        rsi, qword ptr [rdx + 0x30]
04201 ba00000000                     mov        edx, 0
04206 483bf2                         cmp        rsi, rdx
04209 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
04213 bac0030000                     mov        edx, 0x3c0
04218 7505                           jne        0x7f138844341f
0421a bad0030000                     mov        edx, 0x3d0
0421f 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
04223 488d4901                       lea        rcx, [rcx + 1]
04227 48890c16                       mov        qword ptr [rsi + rdx], rcx
0422b 0f85e8000000                   jne        0x7f1388443519
04231 e9ed000000                     jmp        0x7f1388443523
04236 498bd8                         mov        rbx, r8
04239 448b9c2408020000               mov        r11d, dword ptr [rsp + 0x208]
04241 488bf0                         mov        rsi, rax
04244 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
0424c 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
04254 4c8bee                         mov        r13, rsi
04257 442beb                         sub        r13d, ebx
0425a 48be00e04b78137f0000           movabs     rsi, 0x7f13784be000
04264 4883864008000001               add        qword ptr [rsi + 0x840], 1
0426c 488bf2                         mov        rsi, rdx
0426f 488bd3                         mov        rdx, rbx
04272 488bc8                         mov        rcx, rax
04275 4d8bc3                         mov        r8, r11
04278 4d8bcd                         mov        r9, r13
0427b 44899c2408020000               mov        dword ptr [rsp + 0x208], r11d
04283 4489ac24b0020000               mov        dword ptr [rsp + 0x2b0], r13d
0428b 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
04290 4c89442408                     mov        qword ptr [rsp + 8], r8
04295 48890c24                       mov        qword ptr [rsp], rcx
04299 4889542418                     mov        qword ptr [rsp + 0x18], rdx
0429e 4889742420                     mov        qword ptr [rsp + 0x20], rsi
042a3 488bfe                         mov        rdi, rsi
042a6 488bf2                         mov        rsi, rdx
042a9 488bd1                         mov        rdx, rcx
042ac 498bc8                         mov        rcx, r8
042af 4d8bc1                         mov        r8, r9
042b2 e889534a07                     call       0x7f138f8e8840
042b7 85c0                           test       eax, eax
042b9 0f842b000000                   je         0x7f13884434ea
042bf 488bf8                         mov        rdi, rax
042c2 83f7ff                         xor        edi, 0xffffffff
042c5 488b0c24                       mov        rcx, qword ptr [rsp]
042c9 4c8b442408                     mov        r8, qword ptr [rsp + 8]
042ce 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
042d3 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
042d8 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
042dd 442bcf                         sub        r9d, edi
042e0 03d7                           add        edx, edi
042e2 4403c7                         add        r8d, edi
042e5 e9ae120000                     jmp        0x7f1388444798
042ea 448bac24b0020000               mov        r13d, dword ptr [rsp + 0x2b0]
042f2 4403ac2408020000               add        r13d, dword ptr [rsp + 0x208]
042fa 488b942470010000               mov        rdx, qword ptr [rsp + 0x170]
04302 44896a38                       mov        dword ptr [rdx + 0x38], r13d
04306 4881c4e0020000                 add        rsp, 0x2e0
0430d 5d                             pop        rbp
0430e 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
04312 0f8796120000                   ja         0x7f13884447ae
04318 c3                             ret        
04319 bb02000000                     mov        ebx, 2
0431e e915000000                     jmp        0x7f1388443538
04323 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
0432d ff82e0030000                   inc        dword ptr [rdx + 0x3e0]
04333 bb08000000                     mov        ebx, 8
04338 899c24b4020000                 mov        dword ptr [rsp + 0x2b4], ebx
0433f 90                             nop        
04340 e98e120000                     jmp        0x7f13884447d3
04345 90                             nop        
04346 90                             nop        
04347 90                             nop        
04348 90                             nop        
04349 90                             nop        
0434a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04351 0f858b120000                   jne        0x7f13884447e2
04357 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
0435e 488d7820                       lea        rdi, [rax + 0x20]
04362 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
04369 0f8773120000                   ja         0x7f13884447e2
0436f 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
04376 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0437d 488908                         mov        qword ptr [rax], rcx
04380 4833c9                         xor        rcx, rcx
04383 48894808                       mov        qword ptr [rax + 8], rcx
04387 48894810                       mov        qword ptr [rax + 0x10], rcx
0438b 48894818                       mov        qword ptr [rax + 0x18], rcx
0438f 90                             nop        
04390 e969120000                     jmp        0x7f13884447fe
04395 90                             nop        
04396 90                             nop        
04397 90                             nop        
04398 90                             nop        
04399 90                             nop        
0439a 498bf3                         mov        rsi, r11
0439d 48898424b8020000               mov        qword ptr [rsp + 0x2b8], rax
043a5 6690                           nop        
043a7 e8b4724b07                     call       0x7f138f8fa860
043ac 0f1f8400a444001c               nop        dword ptr [rax + rax + 0x1c0044a4]
043b4 48ba00e04b78137f0000           movabs     rdx, 0x7f13784be000
043be 488d9208040000                 lea        rdx, [rdx + 0x408]
043c5 4885c0                         test       rax, rax
043c8 750a                           jne        0x7f13884435d4
043ca f60201                         test       byte ptr [rdx], 1
043cd 7505                           jne        0x7f13884435d4
043cf f048830a01                     lock or    qword ptr [rdx], 1
043d4 488b9424b8020000               mov        rdx, qword ptr [rsp + 0x2b8]
043dc 48b900e04b78137f0000           movabs     rcx, 0x7f13784be000
043e6 4883811804000001               add        qword ptr [rcx + 0x418], 1
043ee 8b9424b4020000                 mov        edx, dword ptr [rsp + 0x2b4]
043f5 488bc8                         mov        rcx, rax
043f8 488bb424b8020000               mov        rsi, qword ptr [rsp + 0x2b8]
04400 0f1f8000000000                 nop        dword ptr [rax]
04407 e854684b07                     call       0x7f138f8f9e60
0440c 0f1f84000445001d               nop        dword ptr [rax + rax + 0x1d004504]
04414 488b8424b8020000               mov        rax, qword ptr [rsp + 0x2b8]
0441c e95a120000                     jmp        0x7f138844487b
04421 0f1f8000000000                 nop        dword ptr [rax]
04428 e9ea110000                     jmp        0x7f1388444817
0442d 90                             nop        
0442e 90                             nop        
0442f 90                             nop        
04430 90                             nop        
04431 90                             nop        
04432 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04439 0f85e7110000                   jne        0x7f1388444826
0443f 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
04446 488d7820                       lea        rdi, [rax + 0x20]
0444a 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
04451 0f87cf110000                   ja         0x7f1388444826
04457 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
0445e 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
04465 488908                         mov        qword ptr [rax], rcx
04468 4833c9                         xor        rcx, rcx
0446b 48894808                       mov        qword ptr [rax + 8], rcx
0446f 48894810                       mov        qword ptr [rax + 0x10], rcx
04473 48894818                       mov        qword ptr [rax + 0x18], rcx
04477 488bd0                         mov        rdx, rax
0447a 48b900e04b78137f0000           movabs     rcx, 0x7f13784be000
04484 4883815002000001               add        qword ptr [rcx + 0x250], 1
0448c ba02000000                     mov        edx, 2
04491 48b9f06526e200000000           movabs     rcx, 0xe22665f0
0449b 488bf0                         mov        rsi, rax
0449e 48898424c0020000               mov        qword ptr [rsp + 0x2c0], rax
044a6 90                             nop        
044a7 e8b4674b07                     call       0x7f138f8f9e60
044ac 0f1f8400a445001e               nop        dword ptr [rax + rax + 0x1e0045a4]
044b4 488b8424c0020000               mov        rax, qword ptr [rsp + 0x2c0]
044bc e9ba110000                     jmp        0x7f138844487b
044c1 0f1f8000000000                 nop        dword ptr [rax]
044c8 e975110000                     jmp        0x7f1388444842
044cd 90                             nop        
044ce 90                             nop        
044cf 90                             nop        
044d0 90                             nop        
044d1 90                             nop        
044d2 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
044d9 0f8572110000                   jne        0x7f1388444851
044df 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
044e6 488d7820                       lea        rdi, [rax + 0x20]
044ea 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
044f1 0f875a110000                   ja         0x7f1388444851
044f7 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
044fe 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
04505 488908                         mov        qword ptr [rax], rcx
04508 4833c9                         xor        rcx, rcx
0450b 48894808                       mov        qword ptr [rax + 8], rcx
0450f 48894810                       mov        qword ptr [rax + 0x10], rcx
04513 48894818                       mov        qword ptr [rax + 0x18], rcx
04517 488bd0                         mov        rdx, rax
0451a 48b900e04b78137f0000           movabs     rcx, 0x7f13784be000
04524 4883813801000001               add        qword ptr [rcx + 0x138], 1
0452c ba05000000                     mov        edx, 5
04531 48b9206626e200000000           movabs     rcx, 0xe2266620
0453b 488bf0                         mov        rsi, rax
0453e 48898424c8020000               mov        qword ptr [rsp + 0x2c8], rax
04546 90                             nop        
04547 e814674b07                     call       0x7f138f8f9e60
0454c 0f1f84004446001f               nop        dword ptr [rax + rax + 0x1f004644]
04554 488b8424c8020000               mov        rax, qword ptr [rsp + 0x2c8]
0455c e91a110000                     jmp        0x7f138844487b
04561 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
04568 55                             push       rbp
04569 4881ece0020000                 sub        rsp, 0x2e0
04570 41817f2000000000               cmp        dword ptr [r15 + 0x20], 0
04578 7405                           je         0x7f138844377f
0457a e821634a07                     call       0x7f138f8e9aa0
0457f bf40010000                     mov        edi, 0x140
04584 4863ff                         movsxd     rdi, edi
04587 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
0458b 48899c2480010000               mov        qword ptr [rsp + 0x180], rbx
04593 bf38010000                     mov        edi, 0x138
04598 4863ff                         movsxd     rdi, edi
0459b 488b043e                       mov        rax, qword ptr [rsi + rdi]
0459f 4889842488010000               mov        qword ptr [rsp + 0x188], rax
045a7 bf30010000                     mov        edi, 0x130
045ac 4863ff                         movsxd     rdi, edi
045af 8b143e                         mov        edx, dword ptr [rsi + rdi]
045b2 bf28010000                     mov        edi, 0x128
045b7 4863ff                         movsxd     rdi, edi
045ba 488b0c3e                       mov        rcx, qword ptr [rsi + rdi]
045be bf20010000                     mov        edi, 0x120
045c3 4863ff                         movsxd     rdi, edi
045c6 4c8b043e                       mov        r8, qword ptr [rsi + rdi]
045ca bf18010000                     mov        edi, 0x118
045cf 4863ff                         movsxd     rdi, edi
045d2 448b0c3e                       mov        r9d, dword ptr [rsi + rdi]
045d6 bf08010000                     mov        edi, 0x108
045db 4863ff                         movsxd     rdi, edi
045de 4c8b1c3e                       mov        r11, qword ptr [rsi + rdi]
045e2 bf00010000                     mov        edi, 0x100
045e7 4863ff                         movsxd     rdi, edi
045ea 4c8b2c3e                       mov        r13, qword ptr [rsi + rdi]
045ee bff8000000                     mov        edi, 0xf8
045f3 4863ff                         movsxd     rdi, edi
045f6 448b343e                       mov        r14d, dword ptr [rsi + rdi]
045fa bff0000000                     mov        edi, 0xf0
045ff 4863ff                         movsxd     rdi, edi
04602 8b3c3e                         mov        edi, dword ptr [rsi + rdi]
04605 bbe8000000                     mov        ebx, 0xe8
0460a 4863db                         movsxd     rbx, ebx
0460d 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
04610 899c247c010000                 mov        dword ptr [rsp + 0x17c], ebx
04617 bbd8000000                     mov        ebx, 0xd8
0461c 4863db                         movsxd     rbx, ebx
0461f 488b041e                       mov        rax, qword ptr [rsi + rbx]
04623 4889842498010000               mov        qword ptr [rsp + 0x198], rax
0462b bba0000000                     mov        ebx, 0xa0
04630 4863db                         movsxd     rbx, ebx
04633 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
04636 899c2490010000                 mov        dword ptr [rsp + 0x190], ebx
0463d bb90000000                     mov        ebx, 0x90
04642 4863db                         movsxd     rbx, ebx
04645 488b041e                       mov        rax, qword ptr [rsi + rbx]
04649 48898424a0010000               mov        qword ptr [rsp + 0x1a0], rax
04651 bb80000000                     mov        ebx, 0x80
04656 4863db                         movsxd     rbx, ebx
04659 488b041e                       mov        rax, qword ptr [rsi + rbx]
0465d bb78000000                     mov        ebx, 0x78
04662 4863db                         movsxd     rbx, ebx
04665 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
04668 899c2494010000                 mov        dword ptr [rsp + 0x194], ebx
0466f bb70000000                     mov        ebx, 0x70
04674 4863db                         movsxd     rbx, ebx
04677 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
0467a 899c24a8010000                 mov        dword ptr [rsp + 0x1a8], ebx
04681 bb68000000                     mov        ebx, 0x68
04686 4863db                         movsxd     rbx, ebx
04689 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
0468c 89bc24ac010000                 mov        dword ptr [rsp + 0x1ac], edi
04693 488bfe                         mov        rdi, rsi
04696 899424d4010000                 mov        dword ptr [rsp + 0x1d4], edx
0469d 48898c24e0010000               mov        qword ptr [rsp + 0x1e0], rcx
046a5 4c898424d8010000               mov        qword ptr [rsp + 0x1d8], r8
046ad 44898c24d0010000               mov        dword ptr [rsp + 0x1d0], r9d
046b5 4c899c24c8010000               mov        qword ptr [rsp + 0x1c8], r11
046bd 4c89ac24c0010000               mov        qword ptr [rsp + 0x1c0], r13
046c5 4489b424b4010000               mov        dword ptr [rsp + 0x1b4], r14d
046cd 48898424b8010000               mov        qword ptr [rsp + 0x1b8], rax
046d5 899c24b0010000                 mov        dword ptr [rsp + 0x1b0], ebx
046dc e89f940a1e                     call       0x7f13a64ecd80
046e1 0f1f840000000000               nop        dword ptr [rax + rax]
046e9 8b9c24b0010000                 mov        ebx, dword ptr [rsp + 0x1b0]
046f0 488bd3                         mov        rdx, rbx
046f3 8b9c24a8010000                 mov        ebx, dword ptr [rsp + 0x1a8]
046fa 4c8bcb                         mov        r9, rbx
046fd 8b9c2494010000                 mov        ebx, dword ptr [rsp + 0x194]
04704 488bf3                         mov        rsi, rbx
04707 488b8424b8010000               mov        rax, qword ptr [rsp + 0x1b8]
0470f 488bc8                         mov        rcx, rax
04712 488b8424a0010000               mov        rax, qword ptr [rsp + 0x1a0]
0471a 4c8bc0                         mov        r8, rax
0471d 8b9c2490010000                 mov        ebx, dword ptr [rsp + 0x190]
04724 488bfb                         mov        rdi, rbx
04727 488b842498010000               mov        rax, qword ptr [rsp + 0x198]
0472f 4c8bf0                         mov        r14, rax
04732 8b9c247c010000                 mov        ebx, dword ptr [rsp + 0x17c]
04739 4c8beb                         mov        r13, rbx
0473c 8b9c24ac010000                 mov        ebx, dword ptr [rsp + 0x1ac]
04743 8b8424b4010000                 mov        eax, dword ptr [rsp + 0x1b4]
0474a 4c8bd8                         mov        r11, rax
0474d 488b8424c0010000               mov        rax, qword ptr [rsp + 0x1c0]
04755 899c24e8010000                 mov        dword ptr [rsp + 0x1e8], ebx
0475c 488b9c24c8010000               mov        rbx, qword ptr [rsp + 0x1c8]
04764 48899c2450010000               mov        qword ptr [rsp + 0x150], rbx
0476c 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
04773 899c2444010000                 mov        dword ptr [rsp + 0x144], ebx
0477a 488b9c24d8010000               mov        rbx, qword ptr [rsp + 0x1d8]
04782 48899c2458010000               mov        qword ptr [rsp + 0x158], rbx
0478a 488b9c24e0010000               mov        rbx, qword ptr [rsp + 0x1e0]
04792 48899c2460010000               mov        qword ptr [rsp + 0x160], rbx
0479a 8b9c24d4010000                 mov        ebx, dword ptr [rsp + 0x1d4]
047a1 899c2478010000                 mov        dword ptr [rsp + 0x178], ebx
047a8 488b9c2488010000               mov        rbx, qword ptr [rsp + 0x188]
047b0 48899c2468010000               mov        qword ptr [rsp + 0x168], rbx
047b8 488b9c2480010000               mov        rbx, qword ptr [rsp + 0x180]
047c0 48899c2470010000               mov        qword ptr [rsp + 0x170], rbx
047c8 44898c24f8010000               mov        dword ptr [rsp + 0x1f8], r9d
047d0 89b424ec010000                 mov        dword ptr [rsp + 0x1ec], esi
047d7 48898c24f0010000               mov        qword ptr [rsp + 0x1f0], rcx
047df 4c89842418020000               mov        qword ptr [rsp + 0x218], r8
047e7 89bc240c020000                 mov        dword ptr [rsp + 0x20c], edi
047ee 4c89b42420020000               mov        qword ptr [rsp + 0x220], r14
047f6 4489ac24fc010000               mov        dword ptr [rsp + 0x1fc], r13d
047fe 448b8424e8010000               mov        r8d, dword ptr [rsp + 0x1e8]
04806 44899c2408020000               mov        dword ptr [rsp + 0x208], r11d
0480e 4889842400020000               mov        qword ptr [rsp + 0x200], rax
04816 e905bbffff                     jmp        0x7f138843f520
0481b 49ba00584a78137f0000           movabs     r10, 0x7f13784a5800
04825 4c89542408                     mov        qword ptr [rsp + 8], r10
0482a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04832 e829f15707                     call       0x7f138f9c2b60
04837 e941b8ffff                     jmp        0x7f138843f27d
0483c 49bab0314e8800000000           movabs     r10, 0x884e31b0
04846 4c89542408                     mov        qword ptr [rsp + 8], r10
0484b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04853 e808f15707                     call       0x7f138f9c2b60
04858 e98db9ffff                     jmp        0x7f138843f3ea
0485d e87e855707                     call       0x7f138f9bbfe0
04862 e879855707                     call       0x7f138f9bbfe0
04867 e874855707                     call       0x7f138f9bbfe0
0486c 48891424                       mov        qword ptr [rsp], rdx
04870 4889742408                     mov        qword ptr [rsp + 8], rsi
04875 e866765707                     call       0x7f138f9bb0e0
0487a e861855707                     call       0x7f138f9bbfe0
0487f e85c855707                     call       0x7f138f9bbfe0
04884 48891424                       mov        qword ptr [rsp], rdx
04888 48897c2408                     mov        qword ptr [rsp + 8], rdi
0488d e84e765707                     call       0x7f138f9bb0e0
04892 e849855707                     call       0x7f138f9bbfe0
04897 e844855707                     call       0x7f138f9bbfe0
0489c 48c7042401000000               mov        qword ptr [rsp], 1
048a4 4c894c2408                     mov        qword ptr [rsp + 8], r9
048a9 e832765707                     call       0x7f138f9bb0e0
048ae 48c7042402000000               mov        qword ptr [rsp], 2
048b6 4c894c2408                     mov        qword ptr [rsp + 8], r9
048bb e820765707                     call       0x7f138f9bb0e0
048c0 48c7042400000000               mov        qword ptr [rsp], 0
048c8 4c894c2408                     mov        qword ptr [rsp + 8], r9
048cd e80e765707                     call       0x7f138f9bb0e0
048d2 48c7042401000000               mov        qword ptr [rsp], 1
048da 4c894c2408                     mov        qword ptr [rsp + 8], r9
048df e8fc755707                     call       0x7f138f9bb0e0
048e4 48c7042400000000               mov        qword ptr [rsp], 0
048ec 4c894c2408                     mov        qword ptr [rsp + 8], r9
048f1 e8ea755707                     call       0x7f138f9bb0e0
048f6 49ba60422278137f0000           movabs     r10, 0x7f1378224260
04900 4c89542408                     mov        qword ptr [rsp + 8], r10
04905 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0490d e84ef05707                     call       0x7f138f9c2b60
04912 e991bfffff                     jmp        0x7f138843faa8
04917 e8c4845707                     call       0x7f138f9bbfe0
0491c 49ba50552e78137f0000           movabs     r10, 0x7f13782e5550
04926 4c89542408                     mov        qword ptr [rsp + 8], r10
0492b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04933 e828f05707                     call       0x7f138f9c2b60
04938 e917c0ffff                     jmp        0x7f138843fb54
0493d 49ba303e4e8800000000           movabs     r10, 0x884e3e30
04947 4c89542408                     mov        qword ptr [rsp + 8], r10
0494c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04954 e807f05707                     call       0x7f138f9c2b60
04959 e939c0ffff                     jmp        0x7f138843fb97
0495e 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04966 e875c85707                     call       0x7f138f9c03e0
0496b 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04973 e868c85707                     call       0x7f138f9c03e0
04978 49ba102e2778137f0000           movabs     r10, 0x7f1378272e10
04982 4c89542408                     mov        qword ptr [rsp + 8], r10
04987 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0498f e8ccef5707                     call       0x7f138f9c2b60
04994 e9d8c0ffff                     jmp        0x7f138843fc71
04999 49ba90912778137f0000           movabs     r10, 0x7f1378279190
049a3 4c89542408                     mov        qword ptr [rsp + 8], r10
049a8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049b0 e8abef5707                     call       0x7f138f9c2b60
049b5 e9efc0ffff                     jmp        0x7f138843fca9
049ba 49ba48192a78137f0000           movabs     r10, 0x7f13782a1948
049c4 4c89542408                     mov        qword ptr [rsp + 8], r10
049c9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049d1 e88aef5707                     call       0x7f138f9c2b60
049d6 e93ec1ffff                     jmp        0x7f138843fd19
049db 49ba285c2278137f0000           movabs     r10, 0x7f1378225c28
049e5 4c89542408                     mov        qword ptr [rsp + 8], r10
049ea 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049f2 e869ef5707                     call       0x7f138f9c2b60
049f7 e955c1ffff                     jmp        0x7f138843fd51
049fc 49ba08df2978137f0000           movabs     r10, 0x7f137829df08
04a06 4c89542408                     mov        qword ptr [rsp + 8], r10
04a0b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a13 e848ef5707                     call       0x7f138f9c2b60
04a18 e96cc1ffff                     jmp        0x7f138843fd89
04a1d 49ba90742278137f0000           movabs     r10, 0x7f1378227490
04a27 4c89542408                     mov        qword ptr [rsp + 8], r10
04a2c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a34 e827ef5707                     call       0x7f138f9c2b60
04a39 e962c2ffff                     jmp        0x7f138843fea0
04a3e 49bae80c228800000000           movabs     r10, 0x88220ce8
04a48 4c89542408                     mov        qword ptr [rsp + 8], r10
04a4d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a55 e806ef5707                     call       0x7f138f9c2b60
04a5a e987c2ffff                     jmp        0x7f138843fee6
04a5f 49ba1872228800000000           movabs     r10, 0x88227218
04a69 4c89542408                     mov        qword ptr [rsp + 8], r10
04a6e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a76 e8e5ee5707                     call       0x7f138f9c2b60
04a7b e99ec2ffff                     jmp        0x7f138843ff1e
04a80 48890424                       mov        qword ptr [rsp], rax
04a84 e857ab5707                     call       0x7f138f9be7e0
04a89 e852835707                     call       0x7f138f9bbfe0
04a8e 49baf04f2278137f0000           movabs     r10, 0x7f1378224ff0
04a98 4c89542408                     mov        qword ptr [rsp + 8], r10
04a9d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04aa5 e8b6ee5707                     call       0x7f138f9c2b60
04aaa e92fc4ffff                     jmp        0x7f13884400de
04aaf e82c835707                     call       0x7f138f9bbfe0
04ab4 49ba50552e78137f0000           movabs     r10, 0x7f13782e5550
04abe 4c89542408                     mov        qword ptr [rsp + 8], r10
04ac3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04acb e890ee5707                     call       0x7f138f9c2b60
04ad0 e9cdc4ffff                     jmp        0x7f13884401a2
04ad5 49ba303e4e8800000000           movabs     r10, 0x884e3e30
04adf 4c89542408                     mov        qword ptr [rsp + 8], r10
04ae4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04aec e86fee5707                     call       0x7f138f9c2b60
04af1 e9eac4ffff                     jmp        0x7f13884401e0
04af6 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04afe e8ddc65707                     call       0x7f138f9c03e0
04b03 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04b0b e8d0c65707                     call       0x7f138f9c03e0
04b10 e8cb825707                     call       0x7f138f9bbfe0
04b15 49ba90742278137f0000           movabs     r10, 0x7f1378227490
04b1f 4c89542408                     mov        qword ptr [rsp + 8], r10
04b24 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b2c e82fee5707                     call       0x7f138f9c2b60
04b31 e99bc6ffff                     jmp        0x7f13884403d1
04b36 49bae80c228800000000           movabs     r10, 0x88220ce8
04b40 4c89542408                     mov        qword ptr [rsp + 8], r10
04b45 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b4d e80eee5707                     call       0x7f138f9c2b60
04b52 e9c7c6ffff                     jmp        0x7f138844041e
04b57 49ba1872228800000000           movabs     r10, 0x88227218
04b61 4c89542408                     mov        qword ptr [rsp + 8], r10
04b66 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b6e e8eded5707                     call       0x7f138f9c2b60
04b73 e9dec6ffff                     jmp        0x7f1388440456
04b78 49ba60422278137f0000           movabs     r10, 0x7f1378224260
04b82 4c89542408                     mov        qword ptr [rsp + 8], r10
04b87 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b8f e8cced5707                     call       0x7f138f9c2b60
04b94 e9dfc7ffff                     jmp        0x7f1388440578
04b99 e842825707                     call       0x7f138f9bbfe0
04b9e 49ba50552e78137f0000           movabs     r10, 0x7f13782e5550
04ba8 4c89542408                     mov        qword ptr [rsp + 8], r10
04bad 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bb5 e8a6ed5707                     call       0x7f138f9c2b60
04bba e965c8ffff                     jmp        0x7f1388440624
04bbf 49ba303e4e8800000000           movabs     r10, 0x884e3e30
04bc9 4c89542408                     mov        qword ptr [rsp + 8], r10
04bce 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bd6 e885ed5707                     call       0x7f138f9c2b60
04bdb e97fc8ffff                     jmp        0x7f138844065f
04be0 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04be8 e8f3c55707                     call       0x7f138f9c03e0
04bed 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04bf5 e8e6c55707                     call       0x7f138f9c03e0
04bfa 49ba102e2778137f0000           movabs     r10, 0x7f1378272e10
04c04 4c89542408                     mov        qword ptr [rsp + 8], r10
04c09 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c11 e84aed5707                     call       0x7f138f9c2b60
04c16 e913c9ffff                     jmp        0x7f138844072e
04c1b 49ba90912778137f0000           movabs     r10, 0x7f1378279190
04c25 4c89542408                     mov        qword ptr [rsp + 8], r10
04c2a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c32 e829ed5707                     call       0x7f138f9c2b60
04c37 e92ac9ffff                     jmp        0x7f1388440766
04c3c 49ba48192a78137f0000           movabs     r10, 0x7f13782a1948
04c46 4c89542408                     mov        qword ptr [rsp + 8], r10
04c4b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c53 e808ed5707                     call       0x7f138f9c2b60
04c58 e963c9ffff                     jmp        0x7f13884407c0
04c5d 49ba285c2278137f0000           movabs     r10, 0x7f1378225c28
04c67 4c89542408                     mov        qword ptr [rsp + 8], r10
04c6c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c74 e8e7ec5707                     call       0x7f138f9c2b60
04c79 e97ac9ffff                     jmp        0x7f13884407f8
04c7e 49ba08df2978137f0000           movabs     r10, 0x7f137829df08
04c88 4c89542408                     mov        qword ptr [rsp + 8], r10
04c8d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c95 e8c6ec5707                     call       0x7f138f9c2b60
04c9a e991c9ffff                     jmp        0x7f1388440830
04c9f 49ba90742278137f0000           movabs     r10, 0x7f1378227490
04ca9 4c89542408                     mov        qword ptr [rsp + 8], r10
04cae 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cb6 e8a5ec5707                     call       0x7f138f9c2b60
04cbb e987caffff                     jmp        0x7f1388440947
04cc0 49bae80c228800000000           movabs     r10, 0x88220ce8
04cca 4c89542408                     mov        qword ptr [rsp + 8], r10
04ccf 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cd7 e884ec5707                     call       0x7f138f9c2b60
04cdc e9accaffff                     jmp        0x7f138844098d
04ce1 49ba1872228800000000           movabs     r10, 0x88227218
04ceb 4c89542408                     mov        qword ptr [rsp + 8], r10
04cf0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cf8 e863ec5707                     call       0x7f138f9c2b60
04cfd e9c3caffff                     jmp        0x7f13884409c5
04d02 48890424                       mov        qword ptr [rsp], rax
04d06 e8d5a85707                     call       0x7f138f9be7e0
04d0b e8d0805707                     call       0x7f138f9bbfe0
04d10 49baf04f2278137f0000           movabs     r10, 0x7f1378224ff0
04d1a 4c89542408                     mov        qword ptr [rsp + 8], r10
04d1f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d27 e834ec5707                     call       0x7f138f9c2b60
04d2c e955ccffff                     jmp        0x7f1388440b86
04d31 e8aa805707                     call       0x7f138f9bbfe0
04d36 49ba50552e78137f0000           movabs     r10, 0x7f13782e5550
04d40 4c89542408                     mov        qword ptr [rsp + 8], r10
04d45 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d4d e80eec5707                     call       0x7f138f9c2b60
04d52 e9f3ccffff                     jmp        0x7f1388440c4a
04d57 49ba303e4e8800000000           movabs     r10, 0x884e3e30
04d61 4c89542408                     mov        qword ptr [rsp + 8], r10
04d66 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d6e e8edeb5707                     call       0x7f138f9c2b60
04d73 e910cdffff                     jmp        0x7f1388440c88
04d78 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04d80 e85bc45707                     call       0x7f138f9c03e0
04d85 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04d8d e84ec45707                     call       0x7f138f9c03e0
04d92 e849805707                     call       0x7f138f9bbfe0
04d97 49ba90742278137f0000           movabs     r10, 0x7f1378227490
04da1 4c89542408                     mov        qword ptr [rsp + 8], r10
04da6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04dae e8adeb5707                     call       0x7f138f9c2b60
04db3 e9c1ceffff                     jmp        0x7f1388440e79
04db8 49bae80c228800000000           movabs     r10, 0x88220ce8
04dc2 4c89542408                     mov        qword ptr [rsp + 8], r10
04dc7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04dcf e88ceb5707                     call       0x7f138f9c2b60
04dd4 e9edceffff                     jmp        0x7f1388440ec6
04dd9 49ba1872228800000000           movabs     r10, 0x88227218
04de3 4c89542408                     mov        qword ptr [rsp + 8], r10
04de8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04df0 e86beb5707                     call       0x7f138f9c2b60
04df5 e904cfffff                     jmp        0x7f1388440efe
04dfa 49ba00584a78137f0000           movabs     r10, 0x7f13784a5800
04e04 4c89542408                     mov        qword ptr [rsp + 8], r10
04e09 48c704240a020000               mov        qword ptr [rsp], 0x20a
04e11 e84aeb5707                     call       0x7f138f9c2b60
04e16 e9accfffff                     jmp        0x7f1388440fc7
04e1b 0f1f4000                       nop        dword ptr [rax]
04e1f e83c684b07                     call       0x7f138f8fa860
04e24 e980d0ffff                     jmp        0x7f13884410a9
04e29 660f1f440000                   nop        word ptr [rax + rax]
04e2f e82c684b07                     call       0x7f138f8fa860
04e34 e9e1d1ffff                     jmp        0x7f138844121a
04e39 49ba807f4a78137f0000           movabs     r10, 0x7f13784a7f80
04e43 4c89542408                     mov        qword ptr [rsp + 8], r10
04e48 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e50 e80beb5707                     call       0x7f138f9c2b60
04e55 e940d2ffff                     jmp        0x7f138844129a
04e5a 49bae8742a8800000000           movabs     r10, 0x882a74e8
04e64 4c89542408                     mov        qword ptr [rsp + 8], r10
04e69 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e71 e8eaea5707                     call       0x7f138f9c2b60
04e76 e9c4d2ffff                     jmp        0x7f138844133f
04e7b 49bab83d218800000000           movabs     r10, 0x88213db8
04e85 4c89542408                     mov        qword ptr [rsp + 8], r10
04e8a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e92 e8c9ea5707                     call       0x7f138f9c2b60
04e97 e935d3ffff                     jmp        0x7f13884413d1
04e9c 49ba80672a8800000000           movabs     r10, 0x882a6780
04ea6 4c89542408                     mov        qword ptr [rsp + 8], r10
04eab 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04eb3 e8a8ea5707                     call       0x7f138f9c2b60
04eb8 e9d6d3ffff                     jmp        0x7f1388441493
04ebd 49baf812398800000000           movabs     r10, 0x883912f8
04ec7 4c89542408                     mov        qword ptr [rsp + 8], r10
04ecc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ed4 e887ea5707                     call       0x7f138f9c2b60
04ed9 e948d4ffff                     jmp        0x7f1388441526
04ede 48890424                       mov        qword ptr [rsp], rax
04ee2 e8f9a65707                     call       0x7f138f9be7e0
04ee7 49bab00e398800000000           movabs     r10, 0x88390eb0
04ef1 4c89542408                     mov        qword ptr [rsp + 8], r10
04ef6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04efe e85dea5707                     call       0x7f138f9c2b60
04f03 e9ffd4ffff                     jmp        0x7f1388441607
04f08 e8d37e5707                     call       0x7f138f9bbfe0
04f0d 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04f15 e8c6c25707                     call       0x7f138f9c03e0
04f1a 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04f22 e8b9c25707                     call       0x7f138f9c03e0
04f27 49ba00584a78137f0000           movabs     r10, 0x7f13784a5800
04f31 4c89542408                     mov        qword ptr [rsp + 8], r10
04f36 48c70424aa020000               mov        qword ptr [rsp], 0x2aa
04f3e e81dea5707                     call       0x7f138f9c2b60
04f43 e92cd6ffff                     jmp        0x7f1388441774
04f48 49ba60422278137f0000           movabs     r10, 0x7f1378224260
04f52 4c89542408                     mov        qword ptr [rsp + 8], r10
04f57 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f5f e8fce95707                     call       0x7f138f9c2b60
04f64 e909d7ffff                     jmp        0x7f1388441872
04f69 e8727e5707                     call       0x7f138f9bbfe0
04f6e 49ba50552e78137f0000           movabs     r10, 0x7f13782e5550
04f78 4c89542408                     mov        qword ptr [rsp + 8], r10
04f7d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f85 e8d6e95707                     call       0x7f138f9c2b60
04f8a e98bd7ffff                     jmp        0x7f138844191a
04f8f 49ba303e4e8800000000           movabs     r10, 0x884e3e30
04f99 4c89542408                     mov        qword ptr [rsp + 8], r10
04f9e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04fa6 e8b5e95707                     call       0x7f138f9c2b60
04fab e9a3d7ffff                     jmp        0x7f1388441953
04fb0 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04fb8 e823c25707                     call       0x7f138f9c03e0
04fbd 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04fc5 e816c25707                     call       0x7f138f9c03e0
04fca 49ba102e2778137f0000           movabs     r10, 0x7f1378272e10
04fd4 4c89542408                     mov        qword ptr [rsp + 8], r10
04fd9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04fe1 e87ae95707                     call       0x7f138f9c2b60
04fe6 e936d8ffff                     jmp        0x7f1388441a21
04feb 49ba90912778137f0000           movabs     r10, 0x7f1378279190
04ff5 4c89542408                     mov        qword ptr [rsp + 8], r10
04ffa 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05002 e859e95707                     call       0x7f138f9c2b60
05007 e948d8ffff                     jmp        0x7f1388441a54
0500c 49ba48192a78137f0000           movabs     r10, 0x7f13782a1948
05016 4c89542408                     mov        qword ptr [rsp + 8], r10
0501b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05023 e838e95707                     call       0x7f138f9c2b60
05028 e98bd8ffff                     jmp        0x7f1388441ab8
0502d 49ba285c2278137f0000           movabs     r10, 0x7f1378225c28
05037 4c89542408                     mov        qword ptr [rsp + 8], r10
0503c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05044 e817e95707                     call       0x7f138f9c2b60
05049 e9a5d8ffff                     jmp        0x7f1388441af3
0504e 49ba08df2978137f0000           movabs     r10, 0x7f137829df08
05058 4c89542408                     mov        qword ptr [rsp + 8], r10
0505d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05065 e8f6e85707                     call       0x7f138f9c2b60
0506a e9b7d8ffff                     jmp        0x7f1388441b26
0506f 49ba90742278137f0000           movabs     r10, 0x7f1378227490
05079 4c89542408                     mov        qword ptr [rsp + 8], r10
0507e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05086 e8d5e85707                     call       0x7f138f9c2b60
0508b e9a4d9ffff                     jmp        0x7f1388441c34
05090 49bae80c228800000000           movabs     r10, 0x88220ce8
0509a 4c89542408                     mov        qword ptr [rsp + 8], r10
0509f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050a7 e8b4e85707                     call       0x7f138f9c2b60
050ac e9c4d9ffff                     jmp        0x7f1388441c75
050b1 49ba1872228800000000           movabs     r10, 0x88227218
050bb 4c89542408                     mov        qword ptr [rsp + 8], r10
050c0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050c8 e893e85707                     call       0x7f138f9c2b60
050cd e9d6d9ffff                     jmp        0x7f1388441ca8
050d2 48890424                       mov        qword ptr [rsp], rax
050d6 e805a55707                     call       0x7f138f9be7e0
050db e8007d5707                     call       0x7f138f9bbfe0
050e0 49baf04f2278137f0000           movabs     r10, 0x7f1378224ff0
050ea 4c89542408                     mov        qword ptr [rsp + 8], r10
050ef 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050f7 e864e85707                     call       0x7f138f9c2b60
050fc e965dbffff                     jmp        0x7f1388441e66
05101 49ba50552e78137f0000           movabs     r10, 0x7f13782e5550
0510b 4c89542408                     mov        qword ptr [rsp + 8], r10
05110 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05118 e843e85707                     call       0x7f138f9c2b60
0511d e9fddbffff                     jmp        0x7f1388441f1f
05122 49ba303e4e8800000000           movabs     r10, 0x884e3e30
0512c 4c89542408                     mov        qword ptr [rsp + 8], r10
05131 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05139 e822e85707                     call       0x7f138f9c2b60
0513e e923dcffff                     jmp        0x7f1388441f66
05143 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0514b e890c05707                     call       0x7f138f9c03e0
05150 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05158 e883c05707                     call       0x7f138f9c03e0
0515d e87e7c5707                     call       0x7f138f9bbfe0
05162 49ba90742278137f0000           movabs     r10, 0x7f1378227490
0516c 4c89542408                     mov        qword ptr [rsp + 8], r10
05171 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05179 e8e2e75707                     call       0x7f138f9c2b60
0517e e9ceddffff                     jmp        0x7f1388442151
05183 49bae80c228800000000           movabs     r10, 0x88220ce8
0518d 4c89542408                     mov        qword ptr [rsp + 8], r10
05192 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0519a e8c1e75707                     call       0x7f138f9c2b60
0519f e9faddffff                     jmp        0x7f138844219e
051a4 49ba1872228800000000           movabs     r10, 0x88227218
051ae 4c89542408                     mov        qword ptr [rsp + 8], r10
051b3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
051bb e8a0e75707                     call       0x7f138f9c2b60
051c0 e911deffff                     jmp        0x7f13884421d6
051c5 49ba00584a78137f0000           movabs     r10, 0x7f13784a5800
051cf 4c89542408                     mov        qword ptr [rsp + 8], r10
051d4 48c70424e8020000               mov        qword ptr [rsp], 0x2e8
051dc e87fe75707                     call       0x7f138f9c2b60
051e1 e9bcdeffff                     jmp        0x7f13884422a2
051e6 49ba807f4a78137f0000           movabs     r10, 0x7f13784a7f80
051f0 4c89542408                     mov        qword ptr [rsp + 8], r10
051f5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
051fd e85ee75707                     call       0x7f138f9c2b60
05202 e97bdfffff                     jmp        0x7f1388442382
05207 49bae8742a8800000000           movabs     r10, 0x882a74e8
05211 4c89542408                     mov        qword ptr [rsp + 8], r10
05216 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0521e e83de75707                     call       0x7f138f9c2b60
05223 e9ffdfffff                     jmp        0x7f1388442427
05228 49bab83d218800000000           movabs     r10, 0x88213db8
05232 4c89542408                     mov        qword ptr [rsp + 8], r10
05237 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0523f e81ce75707                     call       0x7f138f9c2b60
05244 e970e0ffff                     jmp        0x7f13884424b9
05249 49ba80672a8800000000           movabs     r10, 0x882a6780
05253 4c89542408                     mov        qword ptr [rsp + 8], r10
05258 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05260 e8fbe65707                     call       0x7f138f9c2b60
05265 e911e1ffff                     jmp        0x7f138844257b
0526a 49baf812398800000000           movabs     r10, 0x883912f8
05274 4c89542408                     mov        qword ptr [rsp + 8], r10
05279 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05281 e8dae65707                     call       0x7f138f9c2b60
05286 e983e1ffff                     jmp        0x7f138844260e
0528b 48890424                       mov        qword ptr [rsp], rax
0528f e84ca35707                     call       0x7f138f9be7e0
05294 49bab00e398800000000           movabs     r10, 0x88390eb0
0529e 4c89542408                     mov        qword ptr [rsp + 8], r10
052a3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052ab e8b0e65707                     call       0x7f138f9c2b60
052b0 e93ae2ffff                     jmp        0x7f13884426ef
052b5 e8267b5707                     call       0x7f138f9bbfe0
052ba 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
052c2 e819bf5707                     call       0x7f138f9c03e0
052c7 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
052cf e80cbf5707                     call       0x7f138f9c03e0
052d4 49ba00584a78137f0000           movabs     r10, 0x7f13784a5800
052de 4c89542408                     mov        qword ptr [rsp + 8], r10
052e3 48c7042420030000               mov        qword ptr [rsp], 0x320
052eb e870e65707                     call       0x7f138f9c2b60
052f0 e967e3ffff                     jmp        0x7f138844285c
052f5 49ba60422278137f0000           movabs     r10, 0x7f1378224260
052ff 4c89542408                     mov        qword ptr [rsp + 8], r10
05304 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0530c e84fe65707                     call       0x7f138f9c2b60
05311 e928e4ffff                     jmp        0x7f138844293e
05316 e8c57a5707                     call       0x7f138f9bbfe0
0531b 49ba50552e78137f0000           movabs     r10, 0x7f13782e5550
05325 4c89542408                     mov        qword ptr [rsp + 8], r10
0532a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05332 e829e65707                     call       0x7f138f9c2b60
05337 e9aae4ffff                     jmp        0x7f13884429e6
0533c 49ba303e4e8800000000           movabs     r10, 0x884e3e30
05346 4c89542408                     mov        qword ptr [rsp + 8], r10
0534b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05353 e808e65707                     call       0x7f138f9c2b60
05358 e9c2e4ffff                     jmp        0x7f1388442a1f
0535d 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05365 e876be5707                     call       0x7f138f9c03e0
0536a 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05372 e869be5707                     call       0x7f138f9c03e0
05377 49ba102e2778137f0000           movabs     r10, 0x7f1378272e10
05381 4c89542408                     mov        qword ptr [rsp + 8], r10
05386 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0538e e8cde55707                     call       0x7f138f9c2b60
05393 e94de5ffff                     jmp        0x7f1388442ae5
05398 49ba90912778137f0000           movabs     r10, 0x7f1378279190
053a2 4c89542408                     mov        qword ptr [rsp + 8], r10
053a7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053af e8ace55707                     call       0x7f138f9c2b60
053b4 e95fe5ffff                     jmp        0x7f1388442b18
053b9 49ba48192a78137f0000           movabs     r10, 0x7f13782a1948
053c3 4c89542408                     mov        qword ptr [rsp + 8], r10
053c8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053d0 e88be55707                     call       0x7f138f9c2b60
053d5 e996e5ffff                     jmp        0x7f1388442b70
053da 49ba285c2278137f0000           movabs     r10, 0x7f1378225c28
053e4 4c89542408                     mov        qword ptr [rsp + 8], r10
053e9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053f1 e86ae55707                     call       0x7f138f9c2b60
053f6 e9abe5ffff                     jmp        0x7f1388442ba6
053fb 49ba08df2978137f0000           movabs     r10, 0x7f137829df08
05405 4c89542408                     mov        qword ptr [rsp + 8], r10
0540a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05412 e849e55707                     call       0x7f138f9c2b60
05417 e9bde5ffff                     jmp        0x7f1388442bd9
0541c 49ba90742278137f0000           movabs     r10, 0x7f1378227490
05426 4c89542408                     mov        qword ptr [rsp + 8], r10
0542b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05433 e828e55707                     call       0x7f138f9c2b60
05438 e9aae6ffff                     jmp        0x7f1388442ce7
0543d 49bae80c228800000000           movabs     r10, 0x88220ce8
05447 4c89542408                     mov        qword ptr [rsp + 8], r10
0544c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05454 e807e55707                     call       0x7f138f9c2b60
05459 e9cae6ffff                     jmp        0x7f1388442d28
0545e 49ba1872228800000000           movabs     r10, 0x88227218
05468 4c89542408                     mov        qword ptr [rsp + 8], r10
0546d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05475 e8e6e45707                     call       0x7f138f9c2b60
0547a e9dce6ffff                     jmp        0x7f1388442d5b
0547f 48890424                       mov        qword ptr [rsp], rax
05483 e858a15707                     call       0x7f138f9be7e0
05488 e853795707                     call       0x7f138f9bbfe0
0548d 49baf04f2278137f0000           movabs     r10, 0x7f1378224ff0
05497 4c89542408                     mov        qword ptr [rsp + 8], r10
0549c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
054a4 e8b7e45707                     call       0x7f138f9c2b60
054a9 e968e8ffff                     jmp        0x7f1388442f16
054ae 49ba50552e78137f0000           movabs     r10, 0x7f13782e5550
054b8 4c89542408                     mov        qword ptr [rsp + 8], r10
054bd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
054c5 e896e45707                     call       0x7f138f9c2b60
054ca e900e9ffff                     jmp        0x7f1388442fcf
054cf 49ba303e4e8800000000           movabs     r10, 0x884e3e30
054d9 4c89542408                     mov        qword ptr [rsp + 8], r10
054de 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
054e6 e875e45707                     call       0x7f138f9c2b60
054eb e927e9ffff                     jmp        0x7f1388443017
054f0 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
054f8 e8e3bc5707                     call       0x7f138f9c03e0
054fd 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05505 e8d6bc5707                     call       0x7f138f9c03e0
0550a e8d1785707                     call       0x7f138f9bbfe0
0550f 49ba90742278137f0000           movabs     r10, 0x7f1378227490
05519 4c89542408                     mov        qword ptr [rsp + 8], r10
0551e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05526 e835e45707                     call       0x7f138f9c2b60
0552b e9d1eaffff                     jmp        0x7f1388443201
05530 49bae80c228800000000           movabs     r10, 0x88220ce8
0553a 4c89542408                     mov        qword ptr [rsp + 8], r10
0553f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05547 e814e45707                     call       0x7f138f9c2b60
0554c e9fdeaffff                     jmp        0x7f138844324e
05551 49ba1872228800000000           movabs     r10, 0x88227218
0555b 4c89542408                     mov        qword ptr [rsp + 8], r10
05560 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05568 e8f3e35707                     call       0x7f138f9c2b60
0556d e914ebffff                     jmp        0x7f1388443286
05572 49ba00584a78137f0000           movabs     r10, 0x7f13784a5800
0557c 4c89542408                     mov        qword ptr [rsp + 8], r10
05581 48c704245a030000               mov        qword ptr [rsp], 0x35a
05589 e8d2e35707                     call       0x7f138f9c2b60
0558e e9d2ebffff                     jmp        0x7f1388443365
05593 e848785707                     call       0x7f138f9bbfe0
05598 0f1f8000000000                 nop        dword ptr [rax]
0559f e8bc604b07                     call       0x7f138f8fa860
055a4 e941edffff                     jmp        0x7f13884434ea
055a9 e832785707                     call       0x7f138f9bbfe0
055ae 49ba0e354488137f0000           movabs     r10, 0x7f138844350e
055b8 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
055bf e91c874b07                     jmp        0x7f138f8fcee0
055c4 48ba0000000000000000           movabs     rdx, 0
055ce b8000f050a                     mov        eax, 0xa050f00
055d3 e888c55707                     call       0x7f138f9c0d60
055d8 e963edffff                     jmp        0x7f1388443540
055dd e8fe775707                     call       0x7f138f9bbfe0
055e2 488bd2                         mov        rdx, rdx
055e5 e876855707                     call       0x7f138f9bcd60
055ea e9a0edffff                     jmp        0x7f138844358f
055ef 48ba0000000000000000           movabs     rdx, 0
055f9 b8000f050a                     mov        eax, 0xa050f00
055fe e85dda5707                     call       0x7f138f9c2260
05603 e988edffff                     jmp        0x7f1388443590
05608 48ba0000000000000000           movabs     rdx, 0
05612 b8000f050a                     mov        eax, 0xa050f00
05617 e844c55707                     call       0x7f138f9c0d60
0561c e907eeffff                     jmp        0x7f1388443628
05621 e8ba775707                     call       0x7f138f9bbfe0
05626 488bd2                         mov        rdx, rdx
05629 e832855707                     call       0x7f138f9bcd60
0562e e944eeffff                     jmp        0x7f1388443677
05633 48ba0000000000000000           movabs     rdx, 0
0563d b8000f050a                     mov        eax, 0xa050f00
05642 e819c55707                     call       0x7f138f9c0d60
05647 e97ceeffff                     jmp        0x7f13884436c8
0564c e88f775707                     call       0x7f138f9bbfe0
05651 488bd2                         mov        rdx, rdx
05654 e807855707                     call       0x7f138f9bcd60
05659 e9b9eeffff                     jmp        0x7f1388443717
0565e 498b8778050000                 mov        rax, qword ptr [r15 + 0x578]
05665 49c7877805000000000000         mov        qword ptr [r15 + 0x578], 0
05670 49c7878005000000000000         mov        qword ptr [r15 + 0x580], 0
0567b 4881c4e0020000                 add        rsp, 0x2e0
05682 5d                             pop        rbp
05683 e958625707                     jmp        0x7f138f9baae0
