00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f8540ee5107                   jne        0x7fd1c390f960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ece0020000                 sub        rsp, 0x2e0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 7405                           je         0x7fd1bc3f0b3f
0003a e861ef5007                     call       0x7fd1c38ffaa0
0003f 898c2420010000                 mov        dword ptr [rsp + 0x120], ecx
00046 4c89842428010000               mov        qword ptr [rsp + 0x128], r8
0004e 4c898c2430010000               mov        qword ptr [rsp + 0x130], r9
00056 89bc2424010000                 mov        dword ptr [rsp + 0x124], edi
0005d 48bbe86872b4d17f0000           movabs     rbx, 0x7fd1b47268e8
00067 8b4370                         mov        eax, dword ptr [rbx + 0x70]
0006a 83c002                         add        eax, 2
0006d 894370                         mov        dword ptr [rbx + 0x70], eax
00070 25fe070000                     and        eax, 0x7fe
00075 85c0                           test       eax, eax
00077 0f84e6470000                   je         0x7fd1bc3f5363
0007d 48bbe86872b4d17f0000           movabs     rbx, 0x7fd1b47268e8
00087 ff83a8000000                   inc        dword ptr [rbx + 0xa8]
0008d 8b9c24f0020000                 mov        ebx, dword ptr [rsp + 0x2f0]
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
000b9 48bfe86872b4d17f0000           movabs     rdi, 0x7fd1b47268e8
000c3 4889842438010000               mov        qword ptr [rsp + 0x138], rax
000cb b8f8000000                     mov        eax, 0xf8
000d0 7f05                           jg         0x7fd1bc3f0bd7
000d2 b808010000                     mov        eax, 0x108
000d7 44899c2440010000               mov        dword ptr [rsp + 0x140], r11d
000df 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
000e3 4d8d5b01                       lea        r11, [r11 + 1]
000e7 4c891c07                       mov        qword ptr [rdi + rax], r11
000eb 0f8f10440000                   jg         0x7fd1bc3f5001
000f1 4863db                         movsxd     rbx, ebx
000f4 488b7e20                       mov        rdi, qword ptr [rsi + 0x20]
000f8 492bf9                         sub        rdi, r9
000fb 483bfb                         cmp        rdi, rbx
000fe 48bfe86872b4d17f0000           movabs     rdi, 0x7fd1b47268e8
00108 b828010000                     mov        eax, 0x128
0010d 7c05                           jl         0x7fd1bc3f0c14
0010f b818010000                     mov        eax, 0x118
00114 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
00118 4d8d5b01                       lea        r11, [r11 + 1]
0011c 4c891c07                       mov        qword ptr [rdi + rax], r11
00120 0f8cdb430000                   jl         0x7fd1bc3f5001
00126 48bfe86872b4d17f0000           movabs     rdi, 0x7fd1b47268e8
00130 ff8758010000                   inc        dword ptr [rdi + 0x158]
00136 498bf8                         mov        rdi, r8
00139 4883ff00                       cmp        rdi, 0
0013d 48bfe86872b4d17f0000           movabs     rdi, 0x7fd1b47268e8
00147 b868010000                     mov        eax, 0x168
0014c 7505                           jne        0x7fd1bc3f0c53
0014e b878010000                     mov        eax, 0x178
00153 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
00157 4d8d5b01                       lea        r11, [r11 + 1]
0015b 4c891c07                       mov        qword ptr [rdi + rax], r11
0015f 0f8531000000                   jne        0x7fd1bc3f0c96
00165 4903d9                         add        rbx, r9
00168 488bf9                         mov        rdi, rcx
0016b 483bfb                         cmp        rdi, rbx
0016e 48bfe86872b4d17f0000           movabs     rdi, 0x7fd1b47268e8
00178 bb98010000                     mov        ebx, 0x198
0017d 7d05                           jge        0x7fd1bc3f0c84
0017f bb88010000                     mov        ebx, 0x188
00184 488b041f                       mov        rax, qword ptr [rdi + rbx]
00188 488d4001                       lea        rax, [rax + 1]
0018c 4889041f                       mov        qword ptr [rdi + rbx], rax
00190 0f8d0a000000                   jge        0x7fd1bc3f0ca0
00196 bf00000000                     mov        edi, 0
0019b e915000000                     jmp        0x7fd1bc3f0cb5
001a0 48bfe86872b4d17f0000           movabs     rdi, 0x7fd1b47268e8
001aa ff87a8010000                   inc        dword ptr [rdi + 0x1a8]
001b0 bf01000000                     mov        edi, 1
001b5 4d2bc6                         sub        r8, r14
001b8 48bbe86872b4d17f0000           movabs     rbx, 0x7fd1b47268e8
001c2 488383c001000001               add        qword ptr [rbx + 0x1c0], 1
001ca 48bb505e79b4d17f0000           movabs     rbx, 0x7fd1b4795e50
001d4 8b4370                         mov        eax, dword ptr [rbx + 0x70]
001d7 83c002                         add        eax, 2
001da 894370                         mov        dword ptr [rbx + 0x70], eax
001dd 25feff1f00                     and        eax, 0x1ffffe
001e2 85c0                           test       eax, eax
001e4 0f849a460000                   je         0x7fd1bc3f5384
001ea 48bbffffffffffffff7f           movabs     rbx, 0x7fffffffffffffff
001f4 483bd9                         cmp        rbx, rcx
001f7 48bb505e79b4d17f0000           movabs     rbx, 0x7fd1b4795e50
00201 b8b8000000                     mov        eax, 0xb8
00206 7d05                           jge        0x7fd1bc3f0d0d
00208 b8a8000000                     mov        eax, 0xa8
0020d 4c8b0c03                       mov        r9, qword ptr [rbx + rax]
00211 4d8d4901                       lea        r9, [r9 + 1]
00215 4c890c03                       mov        qword ptr [rbx + rax], r9
00219 0f8d0f000000                   jge        0x7fd1bc3f0d2e
0021f 48b9ffffffffffffff7f           movabs     rcx, 0x7fffffffffffffff
00229 e910000000                     jmp        0x7fd1bc3f0d3e
0022e 48bb505e79b4d17f0000           movabs     rbx, 0x7fd1b4795e50
00238 ff83c8000000                   inc        dword ptr [rbx + 0xc8]
0023e 448b9c2440010000               mov        r11d, dword ptr [rsp + 0x140]
00246 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0024e 488b9c24f8020000               mov        rbx, qword ptr [rsp + 0x2f8]
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
0034f 48bbe86872b4d17f0000           movabs     rbx, 0x7fd1b47268e8
00359 41bbd0010000                   mov        r11d, 0x1d0
0035f 7d06                           jge        0x7fd1bc3f0e67
00361 41bbe0010000                   mov        r11d, 0x1e0
00367 4e8b2c1b                       mov        r13, qword ptr [rbx + r11]
0036b 4d8d6d01                       lea        r13, [r13 + 1]
0036f 4e892c1b                       mov        qword ptr [rbx + r11], r13
00373 0f8ded3e0000                   jge        0x7fd1bc3f4d66
00379 3b5608                         cmp        edx, dword ptr [rsi + 8]
0037c 0f8332450000                   jae        0x7fd1bc3f53b4
00382 4863ca                         movsxd     rcx, edx
00385 4c8b5cce10                     mov        r11, qword ptr [rsi + rcx*8 + 0x10]
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
003cd 48b9e86872b4d17f0000           movabs     rcx, 0x7fd1b47268e8
003d7 bef0010000                     mov        esi, 0x1f0
003dc 7d05                           jge        0x7fd1bc3f0ee3
003de be00020000                     mov        esi, 0x200
003e3 488b1c31                       mov        rbx, qword ptr [rcx + rsi]
003e7 488d5b01                       lea        rbx, [rbx + 1]
003eb 48891c31                       mov        qword ptr [rcx + rsi], rbx
003ef 0f8d13000000                   jge        0x7fd1bc3f0f08
003f5 3b5708                         cmp        edx, dword ptr [rdi + 8]
003f8 0f83ce440000                   jae        0x7fd1bc3f53cc
003fe 4863f2                         movsxd     rsi, edx
00401 8b74b70c                       mov        esi, dword ptr [rdi + rsi*4 + 0xc]
00405 4c8bde                         mov        r11, rsi
00408 4585ed                         test       r13d, r13d
0040b 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
00415 b910020000                     mov        ecx, 0x210
0041a 7405                           je         0x7fd1bc3f0f21
0041c b920020000                     mov        ecx, 0x220
00421 488b1c0e                       mov        rbx, qword ptr [rsi + rcx]
00425 488d5b01                       lea        rbx, [rbx + 1]
00429 48891c0e                       mov        qword ptr [rsi + rcx], rbx
0042d 0f8431000000                   je         0x7fd1bc3f0f64
00433 488bd8                         mov        rbx, rax
00436 412bd8                         sub        ebx, r8d
00439 443beb                         cmp        r13d, ebx
0043c 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
00446 b940020000                     mov        ecx, 0x240
0044b 7f05                           jg         0x7fd1bc3f0f52
0044d b930020000                     mov        ecx, 0x230
00452 488b1c0e                       mov        rbx, qword ptr [rsi + rcx]
00456 488d5b01                       lea        rbx, [rbx + 1]
0045a 48891c0e                       mov        qword ptr [rsi + rcx], rbx
0045e 0f8ff53f0000                   jg         0x7fd1bc3f4f59
00464 4183fb03                       cmp        r11d, 3
00468 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
00472 b960020000                     mov        ecx, 0x260
00477 7e05                           jle        0x7fd1bc3f0f7e
00479 b970020000                     mov        ecx, 0x270
0047e 488b1c0e                       mov        rbx, qword ptr [rsi + rcx]
00482 488d5b01                       lea        rbx, [rbx + 1]
00486 48891c0e                       mov        qword ptr [rsi + rcx], rbx
0048a 0f8e9c000000                   jle        0x7fd1bc3f102c
00490 4183eb03                       sub        r11d, 3
00494 4183790801                     cmp        dword ptr [r9 + 8], 1
00499 0f8645440000                   jbe        0x7fd1bc3f53e4
0049f 418b7110                       mov        esi, dword ptr [r9 + 0x10]
004a3 4183790802                     cmp        dword ptr [r9 + 8], 2
004a8 0f8648440000                   jbe        0x7fd1bc3f53f6
004ae 41897114                       mov        dword ptr [r9 + 0x14], esi
004b2 4183790800                     cmp        dword ptr [r9 + 8], 0
004b7 0f864b440000                   jbe        0x7fd1bc3f5408
004bd 418b710c                       mov        esi, dword ptr [r9 + 0xc]
004c1 4183790801                     cmp        dword ptr [r9 + 8], 1
004c6 0f864e440000                   jbe        0x7fd1bc3f541a
004cc 41897110                       mov        dword ptr [r9 + 0x10], esi
004d0 4183790800                     cmp        dword ptr [r9 + 8], 0
004d5 0f8651440000                   jbe        0x7fd1bc3f542c
004db 4589590c                       mov        dword ptr [r9 + 0xc], r11d
004df 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
004e9 ff8680020000                   inc        dword ptr [rsi + 0x280]
004ef 498bcd                         mov        rcx, r13
004f2 89942428020000                 mov        dword ptr [rsp + 0x228], edx
004f9 4c8bb42420020000               mov        r14, qword ptr [rsp + 0x220]
00501 44898424e8010000               mov        dword ptr [rsp + 0x1e8], r8d
00509 8b9c2408020000                 mov        ebx, dword ptr [rsp + 0x208]
00510 4c898c2450010000               mov        qword ptr [rsp + 0x150], r9
00518 4889bc2458010000               mov        qword ptr [rsp + 0x158], rdi
00520 89842478010000                 mov        dword ptr [rsp + 0x178], eax
00527 e969000000                     jmp        0x7fd1bc3f1095
0052c 89942428020000                 mov        dword ptr [rsp + 0x228], edx
00533 44898424e8010000               mov        dword ptr [rsp + 0x1e8], r8d
0053b 4889bc2458010000               mov        qword ptr [rsp + 0x158], rdi
00543 89842478010000                 mov        dword ptr [rsp + 0x178], eax
0054a 48bfe86872b4d17f0000           movabs     rdi, 0x7fd1b47268e8
00554 4883879802000001               add        qword ptr [rdi + 0x298], 1
0055c 498bf1                         mov        rsi, r9
0055f 498bd3                         mov        rdx, r11
00562 498bcd                         mov        rcx, r13
00565 4c898c2450010000               mov        qword ptr [rsp + 0x150], r9
0056d 6690                           nop        
0056f e8ecf75107                     call       0x7fd1c3910860
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
005aa 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
005b4 41b8b8020000                   mov        r8d, 0x2b8
005ba 7d06                           jge        0x7fd1bc3f10c2
005bc 41b8a8020000                   mov        r8d, 0x2a8
005c2 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
005c6 4d8d4901                       lea        r9, [r9 + 1]
005ca 4e890c02                       mov        qword ptr [rdx + r8], r9
005ce 0f8d14000000                   jge        0x7fd1bc3f10e8
005d4 4c8b842418020000               mov        r8, qword ptr [rsp + 0x218]
005dc 8b84240c020000                 mov        eax, dword ptr [rsp + 0x20c]
005e3 e9b2000000                     jmp        0x7fd1bc3f119a
005e8 8b84240c020000                 mov        eax, dword ptr [rsp + 0x20c]
005ef 85c0                           test       eax, eax
005f1 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
005fb 41b8c8020000                   mov        r8d, 0x2c8
00601 7506                           jne        0x7fd1bc3f1109
00603 41b8d8020000                   mov        r8d, 0x2d8
00609 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
0060d 4d8d4901                       lea        r9, [r9 + 1]
00611 4e890c02                       mov        qword ptr [rdx + r8], r9
00615 4c8b842418020000               mov        r8, qword ptr [rsp + 0x218]
0061d 0f856d000000                   jne        0x7fd1bc3f1190
00623 488bd3                         mov        rdx, rbx
00626 03d1                           add        edx, ecx
00628 412bd3                         sub        edx, r11d
0062b 4863d2                         movsxd     rdx, edx
0062e 493bd0                         cmp        rdx, r8
00631 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
0063b 41b9e8020000                   mov        r9d, 0x2e8
00641 7c06                           jl         0x7fd1bc3f1149
00643 41b9f8020000                   mov        r9d, 0x2f8
00649 4e8b2c0a                       mov        r13, qword ptr [rdx + r9]
0064d 4d8d6d01                       lea        r13, [r13 + 1]
00651 4e892c0a                       mov        qword ptr [rdx + r9], r13
00655 0f8c3f000000                   jl         0x7fd1bc3f119a
0065b 488b9424f0010000               mov        rdx, qword ptr [rsp + 0x1f0]
00663 483bd7                         cmp        rdx, rdi
00666 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
00670 41b918030000                   mov        r9d, 0x318
00676 7c06                           jl         0x7fd1bc3f117e
00678 41b908030000                   mov        r9d, 0x308
0067e 4e8b2c0a                       mov        r13, qword ptr [rdx + r9]
00682 4d8d6d01                       lea        r13, [r13 + 1]
00686 4e892c0a                       mov        qword ptr [rdx + r9], r13
0068a 0f8c0a000000                   jl         0x7fd1bc3f119a
00690 ba00000000                     mov        edx, 0
00695 e915000000                     jmp        0x7fd1bc3f11af
0069a 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
006a4 ff8228030000                   inc        dword ptr [rdx + 0x328]
006aa ba01000000                     mov        edx, 1
006af 4889bc2430020000               mov        qword ptr [rsp + 0x230], rdi
006b7 4585db                         test       r11d, r11d
006ba 49b9e86872b4d17f0000           movabs     r9, 0x7fd1b47268e8
006c4 41bd40030000                   mov        r13d, 0x340
006ca 7e06                           jle        0x7fd1bc3f11d2
006cc 41bd50030000                   mov        r13d, 0x350
006d2 4b8b3c29                       mov        rdi, qword ptr [r9 + r13]
006d6 488d7f01                       lea        rdi, [rdi + 1]
006da 4b893c29                       mov        qword ptr [r9 + r13], rdi
006de 0f8edb3a0000                   jle        0x7fd1bc3f4cbf
006e4 85d2                           test       edx, edx
006e6 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
006f0 41b970030000                   mov        r9d, 0x370
006f6 7506                           jne        0x7fd1bc3f11fe
006f8 41b960030000                   mov        r9d, 0x360
006fe 4a8b3c0a                       mov        rdi, qword ptr [rdx + r9]
00702 488d7f01                       lea        rdi, [rdi + 1]
00706 4a893c0a                       mov        qword ptr [rdx + r9], rdi
0070a 0f85af3a0000                   jne        0x7fd1bc3f4cbf
00710 4c8beb                         mov        r13, rbx
00713 4403e9                         add        r13d, ecx
00716 4489ac2440020000               mov        dword ptr [rsp + 0x240], r13d
0071e 498bf5                         mov        rsi, r13
00721 03b42410020000                 add        esi, dword ptr [rsp + 0x210]
00728 3bb424ec010000                 cmp        esi, dword ptr [rsp + 0x1ec]
0072f 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
00739 ba28040000                     mov        edx, 0x428
0073e 7f05                           jg         0x7fd1bc3f1245
00740 ba38040000                     mov        edx, 0x438
00745 4c8b0c16                       mov        r9, qword ptr [rsi + rdx]
00749 4d8d4901                       lea        r9, [r9 + 1]
0074d 4c890c16                       mov        qword ptr [rsi + rdx], r9
00751 0f8f3f000000                   jg         0x7fd1bc3f1296
00757 8bbc24e8010000                 mov        edi, dword ptr [rsp + 0x1e8]
0075e 03f9                           add        edi, ecx
00760 89bc2438020000                 mov        dword ptr [rsp + 0x238], edi
00767 3bbc24f8010000                 cmp        edi, dword ptr [rsp + 0x1f8]
0076e 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
00778 ba58040000                     mov        edx, 0x458
0077d 7e05                           jle        0x7fd1bc3f1284
0077f ba48040000                     mov        edx, 0x448
00784 4c8b0c16                       mov        r9, qword ptr [rsi + rdx]
00788 4d8d4901                       lea        r9, [r9 + 1]
0078c 4c890c16                       mov        qword ptr [rsi + rdx], r9
00790 0f8e89000000                   jle        0x7fd1bc3f131f
00796 8bb42410020000                 mov        esi, dword ptr [rsp + 0x210]
0079d 4c89842418020000               mov        qword ptr [rsp + 0x218], r8
007a5 8984240c020000                 mov        dword ptr [rsp + 0x20c], eax
007ac 4c89b42420020000               mov        qword ptr [rsp + 0x220], r14
007b4 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
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
007ff e85cf55107                     call       0x7fd1c3910860
00804 0f1f8400fc080001               nop        dword ptr [rax + rax + 0x10008fc]
0080c 8b9c24e8010000                 mov        ebx, dword ptr [rsp + 0x1e8]
00813 039c2414020000                 add        ebx, dword ptr [rsp + 0x214]
0081a e94c390000                     jmp        0x7fd1bc3f4c6b
0081f 4c89842418020000               mov        qword ptr [rsp + 0x218], r8
00827 8984240c020000                 mov        dword ptr [rsp + 0x20c], eax
0082e 4c89b42420020000               mov        qword ptr [rsp + 0x220], r14
00836 8b842410020000                 mov        eax, dword ptr [rsp + 0x210]
0083d 83f910                         cmp        ecx, 0x10
00840 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
0084a ba68040000                     mov        edx, 0x468
0084f 7f05                           jg         0x7fd1bc3f1356
00851 ba78040000                     mov        edx, 0x478
00856 4c8b0416                       mov        r8, qword ptr [rsi + rdx]
0085a 4d8d4001                       lea        r8, [r8 + 1]
0085e 4c890416                       mov        qword ptr [rsi + rdx], r8
00862 0f8f790a0000                   jg         0x7fd1bc3f1de1
00868 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
00870 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
0087a 4883868804000001               add        qword ptr [rsi + 0x488], 1
00882 48bea83e79b4d17f0000           movabs     rsi, 0x7fd1b4793ea8
0088c 448b4670                       mov        r8d, dword ptr [rsi + 0x70]
00890 4183c002                       add        r8d, 2
00894 44894670                       mov        dword ptr [rsi + 0x70], r8d
00898 4181e0feff1f00                 and        r8d, 0x1ffffe
0089f 4585c0                         test       r8d, r8d
008a2 0f8496400000                   je         0x7fd1bc3f543e
008a8 48bed82f84e200000000           movabs     rsi, 0xe2842fd8
008b2 49b8a83e79b4d17f0000           movabs     r8, 0x7fd1b4793ea8
008bc 488b36                         mov        rsi, qword ptr [rsi]
008bf 48c1ee2a                       shr        rsi, 0x2a
008c3 48c1e609                       shl        rsi, 9
008c7 41ba0000005a                   mov        r10d, 0x5a000000
008cd 4903f2                         add        rsi, r10
008d0 41ba16000000                   mov        r10d, 0x16
008d6 4b3b34d0                       cmp        rsi, qword ptr [r8 + r10*8]
008da 7435                           je         0x7fd1bc3f1411
008dc 4983c202                       add        r10, 2
008e0 4983fa1a                       cmp        r10, 0x1a
008e4 75f0                           jne        0x7fd1bc3f13d6
008e6 41ba16000000                   mov        r10d, 0x16
008ec 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
008f1 7412                           je         0x7fd1bc3f1405
008f3 4983c202                       add        r10, 2
008f7 4983fa1a                       cmp        r10, 0x1a
008fb 75ef                           jne        0x7fd1bc3f13ec
008fd 41ba15000000                   mov        r10d, 0x15
00903 eb10                           jmp        0x7fd1bc3f1415
00905 50                             push       rax
00906 4833c0                         xor        rax, rax
00909 4b0fb134d0                     cmpxchg    qword ptr [r8 + r10*8], rsi
0090e 58                             pop        rax
0090f ebbf                           jmp        0x7fd1bc3f13d0
00911 4983c201                       add        r10, 1
00915 4b8304d001                     add        qword ptr [r8 + r10*8], 1
0091a 8b7208                         mov        esi, dword ptr [rdx + 8]
0091d 49b8a83e79b4d17f0000           movabs     r8, 0x7fd1b4793ea8
00927 498380d800000001               add        qword ptr [r8 + 0xd8], 1
0092f 49b8003579b4d17f0000           movabs     r8, 0x7fd1b4793500
00939 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
0093d 4183c102                       add        r9d, 2
00941 45894870                       mov        dword ptr [r8 + 0x70], r9d
00945 4181e1feff1f00                 and        r9d, 0x1ffffe
0094c 4585c9                         test       r9d, r9d
0094f 0f840f400000                   je         0x7fd1bc3f5464
00955 448bb424e8010000               mov        r14d, dword ptr [rsp + 0x1e8]
0095d 49b8003579b4d17f0000           movabs     r8, 0x7fd1b4793500
00967 4983800801000001               add        qword ptr [r8 + 0x108], 1
0096f 83ee0f                         sub        esi, 0xf
00972 49b8d02b79b4d17f0000           movabs     r8, 0x7fd1b4792bd0
0097c 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
00980 4183c102                       add        r9d, 2
00984 45894870                       mov        dword ptr [r8 + 0x70], r9d
00988 4181e1feff1f00                 and        r9d, 0x1ffffe
0098f 4585c9                         test       r9d, r9d
00992 0f84ed3f0000                   je         0x7fd1bc3f5485
00998 49b8d02b79b4d17f0000           movabs     r8, 0x7fd1b4792bd0
009a2 498380a800000001               add        qword ptr [r8 + 0xa8], 1
009aa 49b80000000000000000           movabs     r8, 0
009b4 41b800000000                   mov        r8d, 0
009ba 453bf0                         cmp        r14d, r8d
009bd 0f8ce33f0000                   jl         0x7fd1bc3f54a6
009c3 443bf6                         cmp        r14d, esi
009c6 0f8de73f0000                   jge        0x7fd1bc3f54b3
009cc 498bf6                         mov        rsi, r14
009cf 89b4242c020000                 mov        dword ptr [rsp + 0x22c], esi
009d6 49b8d82f84e200000000           movabs     r8, 0xe2842fd8
009e0 4d8bc8                         mov        r9, r8
009e3 48bea83e79b4d17f0000           movabs     rsi, 0x7fd1b4793ea8
009ed 4d8b09                         mov        r9, qword ptr [r9]
009f0 49c1e92a                       shr        r9, 0x2a
009f4 49c1e109                       shl        r9, 9
009f8 41ba0000005a                   mov        r10d, 0x5a000000
009fe 4d03ca                         add        r9, r10
00a01 41ba24000000                   mov        r10d, 0x24
00a07 4e3b0cd6                       cmp        r9, qword ptr [rsi + r10*8]
00a0b 7435                           je         0x7fd1bc3f1542
00a0d 4983c202                       add        r10, 2
00a11 4983fa28                       cmp        r10, 0x28
00a15 75f0                           jne        0x7fd1bc3f1507
00a17 41ba24000000                   mov        r10d, 0x24
00a1d 4a833cd600                     cmp        qword ptr [rsi + r10*8], 0
00a22 7412                           je         0x7fd1bc3f1536
00a24 4983c202                       add        r10, 2
00a28 4983fa28                       cmp        r10, 0x28
00a2c 75ef                           jne        0x7fd1bc3f151d
00a2e 41ba23000000                   mov        r10d, 0x23
00a34 eb10                           jmp        0x7fd1bc3f1546
00a36 50                             push       rax
00a37 4833c0                         xor        rax, rax
00a3a 4e0fb10cd6                     cmpxchg    qword ptr [rsi + r10*8], r9
00a3f 58                             pop        rax
00a40 ebbf                           jmp        0x7fd1bc3f1501
00a42 4983c201                       add        r10, 1
00a46 4a8304d601                     add        qword ptr [rsi + r10*8], 1
00a4b 48bed02c79b4d17f0000           movabs     rsi, 0x7fd1b4792cd0
00a55 448b4e70                       mov        r9d, dword ptr [rsi + 0x70]
00a59 4183c102                       add        r9d, 2
00a5d 44894e70                       mov        dword ptr [rsi + 0x70], r9d
00a61 4181e1feff1f00                 and        r9d, 0x1ffffe
00a68 4585c9                         test       r9d, r9d
00a6b 0f844f3f0000                   je         0x7fd1bc3f54c0
00a71 48bed02c79b4d17f0000           movabs     rsi, 0x7fd1b4792cd0
00a7b 488386a800000001               add        qword ptr [rsi + 0xa8], 1
00a83 48bef82d79b4d17f0000           movabs     rsi, 0x7fd1b4792df8
00a8d 448b4670                       mov        r8d, dword ptr [rsi + 0x70]
00a91 4183c002                       add        r8d, 2
00a95 44894670                       mov        dword ptr [rsi + 0x70], r8d
00a99 4181e0feff1f00                 and        r8d, 0x1ffffe
00aa0 4585c0                         test       r8d, r8d
00aa3 0f84383f0000                   je         0x7fd1bc3f54e1
00aa9 48bef82d79b4d17f0000           movabs     rsi, 0x7fd1b4792df8
00ab3 ff86b8000000                   inc        dword ptr [rsi + 0xb8]
00ab9 8bb4242c020000                 mov        esi, dword ptr [rsp + 0x22c]
00ac0 44899c243c020000               mov        dword ptr [rsp + 0x23c], r11d
00ac8 4489b424e8010000               mov        dword ptr [rsp + 0x1e8], r14d
00ad0 899c2408020000                 mov        dword ptr [rsp + 0x208], ebx
00ad7 49b8d0fa85e200000000           movabs     r8, 0xe285fad0
00ae1 4d8bc8                         mov        r9, r8
00ae4 48bba83e79b4d17f0000           movabs     rbx, 0x7fd1b4793ea8
00aee 4883835801000001               add        qword ptr [rbx + 0x158], 1
00af6 49b9704079b4d17f0000           movabs     r9, 0x7fd1b4794070
00b00 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
00b04 83c302                         add        ebx, 2
00b07 41895970                       mov        dword ptr [r9 + 0x70], ebx
00b0b 81e3feff1f00                   and        ebx, 0x1ffffe
00b11 85db                           test       ebx, ebx
00b13 0f84e93e0000                   je         0x7fd1bc3f5502
00b19 4d8bc8                         mov        r9, r8
00b1c 48bb704079b4d17f0000           movabs     rbx, 0x7fd1b4794070
00b26 488383a800000001               add        qword ptr [rbx + 0xa8], 1
00b2e 49b9504179b4d17f0000           movabs     r9, 0x7fd1b4794150
00b38 418b5970                       mov        ebx, dword ptr [r9 + 0x70]
00b3c 83c302                         add        ebx, 2
00b3f 41895970                       mov        dword ptr [r9 + 0x70], ebx
00b43 81e3feff1f00                   and        ebx, 0x1ffffe
00b49 85db                           test       ebx, ebx
00b4b 0f84d23e0000                   je         0x7fd1bc3f5523
00b51 49b9504179b4d17f0000           movabs     r9, 0x7fd1b4794150
00b5b 498381b800000001               add        qword ptr [r9 + 0xb8], 1
00b63 49b8783679b4d17f0000           movabs     r8, 0x7fd1b4793678
00b6d 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
00b71 4183c102                       add        r9d, 2
00b75 45894870                       mov        dword ptr [r8 + 0x70], r9d
00b79 4181e1feff1f00                 and        r9d, 0x1ffffe
00b80 4585c9                         test       r9d, r9d
00b83 0f84bb3e0000                   je         0x7fd1bc3f5544
00b89 49b8d82f84e200000000           movabs     r8, 0xe2842fd8
00b93 4d8bc8                         mov        r9, r8
00b96 48bb504179b4d17f0000           movabs     rbx, 0x7fd1b4794150
00ba0 4d8b09                         mov        r9, qword ptr [r9]
00ba3 49c1e92a                       shr        r9, 0x2a
00ba7 49c1e109                       shl        r9, 9
00bab 41ba0000005a                   mov        r10d, 0x5a000000
00bb1 4d03ca                         add        r9, r10
00bb4 41ba1c000000                   mov        r10d, 0x1c
00bba 4e3b0cd3                       cmp        r9, qword ptr [rbx + r10*8]
00bbe 7435                           je         0x7fd1bc3f16f5
00bc0 4983c202                       add        r10, 2
00bc4 4983fa20                       cmp        r10, 0x20
00bc8 75f0                           jne        0x7fd1bc3f16ba
00bca 41ba1c000000                   mov        r10d, 0x1c
00bd0 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00bd5 7412                           je         0x7fd1bc3f16e9
00bd7 4983c202                       add        r10, 2
00bdb 4983fa20                       cmp        r10, 0x20
00bdf 75ef                           jne        0x7fd1bc3f16d0
00be1 41ba1b000000                   mov        r10d, 0x1b
00be7 eb10                           jmp        0x7fd1bc3f16f9
00be9 50                             push       rax
00bea 4833c0                         xor        rax, rax
00bed 4e0fb10cd3                     cmpxchg    qword ptr [rbx + r10*8], r9
00bf2 58                             pop        rax
00bf3 ebbf                           jmp        0x7fd1bc3f16b4
00bf5 4983c201                       add        r10, 1
00bf9 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00bfe 49b9504179b4d17f0000           movabs     r9, 0x7fd1b4794150
00c08 4d8b00                         mov        r8, qword ptr [r8]
00c0b 49c1e82a                       shr        r8, 0x2a
00c0f 49c1e009                       shl        r8, 9
00c13 41ba0000005a                   mov        r10d, 0x5a000000
00c19 4d03c2                         add        r8, r10
00c1c 41ba22000000                   mov        r10d, 0x22
00c22 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
00c26 7435                           je         0x7fd1bc3f175d
00c28 4983c202                       add        r10, 2
00c2c 4983fa26                       cmp        r10, 0x26
00c30 75f0                           jne        0x7fd1bc3f1722
00c32 41ba22000000                   mov        r10d, 0x22
00c38 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
00c3d 7412                           je         0x7fd1bc3f1751
00c3f 4983c202                       add        r10, 2
00c43 4983fa26                       cmp        r10, 0x26
00c47 75ef                           jne        0x7fd1bc3f1738
00c49 41ba21000000                   mov        r10d, 0x21
00c4f eb10                           jmp        0x7fd1bc3f1761
00c51 50                             push       rax
00c52 4833c0                         xor        rax, rax
00c55 4f0fb104d1                     cmpxchg    qword ptr [r9 + r10*8], r8
00c5a 58                             pop        rax
00c5b ebbf                           jmp        0x7fd1bc3f171c
00c5d 4983c201                       add        r10, 1
00c61 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00c66 49b8504179b4d17f0000           movabs     r8, 0x7fd1b4794150
00c70 4983803801000001               add        qword ptr [r8 + 0x138], 1
00c78 49b8383779b4d17f0000           movabs     r8, 0x7fd1b4793738
00c82 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
00c86 4183c102                       add        r9d, 2
00c8a 45894870                       mov        dword ptr [r8 + 0x70], r9d
00c8e 4181e1feff1f00                 and        r9d, 0x1ffffe
00c95 4585c9                         test       r9d, r9d
00c98 0f84c73d0000                   je         0x7fd1bc3f5565
00c9e 49b8504179b4d17f0000           movabs     r8, 0x7fd1b4794150
00ca8 4983804801000001               add        qword ptr [r8 + 0x148], 1
00cb0 4863de                         movsxd     rbx, esi
00cb3 be0c000000                     mov        esi, 0xc
00cb8 4c8bcb                         mov        r9, rbx
00cbb 4c03ce                         add        r9, rsi
00cbe 48be202979b4d17f0000           movabs     rsi, 0x7fd1b4792920
00cc8 448b4670                       mov        r8d, dword ptr [rsi + 0x70]
00ccc 4183c002                       add        r8d, 2
00cd0 44894670                       mov        dword ptr [rsi + 0x70], r8d
00cd4 4181e0feff1f00                 and        r8d, 0x1ffffe
00cdb 4585c0                         test       r8d, r8d
00cde 0f84a23d0000                   je         0x7fd1bc3f5586
00ce4 48be202979b4d17f0000           movabs     rsi, 0x7fd1b4792920
00cee 488386d800000001               add        qword ptr [rsi + 0xd8], 1
00cf6 48be982a79b4d17f0000           movabs     rsi, 0x7fd1b4792a98
00d00 448b4670                       mov        r8d, dword ptr [rsi + 0x70]
00d04 4183c002                       add        r8d, 2
00d08 44894670                       mov        dword ptr [rsi + 0x70], r8d
00d0c 4181e0feff1f00                 and        r8d, 0x1ffffe
00d13 4585c0                         test       r8d, r8d
00d16 0f848b3d0000                   je         0x7fd1bc3f55a7
00d1c 48be504179b4d17f0000           movabs     rsi, 0x7fd1b4794150
00d26 4883866801000001               add        qword ptr [rsi + 0x168], 1
00d2e 48bea0f586e200000000           movabs     rsi, 0xe286f5a0
00d38 48be203084e200000000           movabs     rsi, 0xe2843020
00d42 488bc2                         mov        rax, rdx
00d45 ba02000000                     mov        edx, 2
00d4a b910000000                     mov        ecx, 0x10
00d4f 4c8bc0                         mov        r8, rax
00d52 bf00000000                     mov        edi, 0
00d57 48890424                       mov        qword ptr [rsp], rax
00d5b 48895c2408                     mov        qword ptr [rsp + 8], rbx
00d60 49bad82f84e200000000           movabs     r10, 0xe2842fd8
00d6a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00d6f 49baa0f586e200000000           movabs     r10, 0xe286f5a0
00d79 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d7e 4889842468010000               mov        qword ptr [rsp + 0x168], rax
00d86 90                             nop        
00d87 e8d4ef5107                     call       0x7fd1c3910860
00d8c 0f1f8400840e0002               nop        dword ptr [rax + rax + 0x2000e84]
00d94 4885c0                         test       rax, rax
00d97 48bb504179b4d17f0000           movabs     rbx, 0x7fd1b4794150
00da1 750c                           jne        0x7fd1bc3f18af
00da3 808b7101000001                 or         byte ptr [rbx + 0x171], 1
00daa e98b000000                     jmp        0x7fd1bc3f193a
00daf 488b38                         mov        rdi, qword ptr [rax]
00db2 48c1ef2a                       shr        rdi, 0x2a
00db6 48c1e709                       shl        rdi, 9
00dba 41ba0000005a                   mov        r10d, 0x5a000000
00dc0 4903fa                         add        rdi, r10
00dc3 41ba30000000                   mov        r10d, 0x30
00dc9 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
00dcd 7435                           je         0x7fd1bc3f1904
00dcf 4983c202                       add        r10, 2
00dd3 4983fa34                       cmp        r10, 0x34
00dd7 75f0                           jne        0x7fd1bc3f18c9
00dd9 41ba30000000                   mov        r10d, 0x30
00ddf 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00de4 7412                           je         0x7fd1bc3f18f8
00de6 4983c202                       add        r10, 2
00dea 4983fa34                       cmp        r10, 0x34
00dee 75ef                           jne        0x7fd1bc3f18df
00df0 41ba2f000000                   mov        r10d, 0x2f
00df6 eb10                           jmp        0x7fd1bc3f1908
00df8 50                             push       rax
00df9 4833c0                         xor        rax, rax
00dfc 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
00e01 58                             pop        rax
00e02 ebbf                           jmp        0x7fd1bc3f18c3
00e04 4983c201                       add        r10, 1
00e08 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00e0d 48bf0006145a00000000           movabs     rdi, 0x5a140600
00e17 488b18                         mov        rbx, qword ptr [rax]
00e1a 48c1eb2a                       shr        rbx, 0x2a
00e1e 48c1e309                       shl        rbx, 9
00e22 41ba0000005a                   mov        r10d, 0x5a000000
00e28 4903da                         add        rbx, r10
00e2b 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
00e2f 0f85933c0000                   jne        0x7fd1bc3f55c8
00e35 e900000000                     jmp        0x7fd1bc3f193a
00e3a 488bf8                         mov        rdi, rax
00e3d 4889bc2448020000               mov        qword ptr [rsp + 0x248], rdi
00e45 483b07                         cmp        rax, qword ptr [rdi]
00e48 488bf7                         mov        rsi, rdi
00e4b 48bbe86872b4d17f0000           movabs     rbx, 0x7fd1b47268e8
00e55 488b36                         mov        rsi, qword ptr [rsi]
00e58 48c1ee2a                       shr        rsi, 0x2a
00e5c 48c1e609                       shl        rsi, 9
00e60 41ba0000005a                   mov        r10d, 0x5a000000
00e66 4903f2                         add        rsi, r10
00e69 41ba94000000                   mov        r10d, 0x94
00e6f 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00e73 743b                           je         0x7fd1bc3f19b0
00e75 4983c202                       add        r10, 2
00e79 4981fa98000000                 cmp        r10, 0x98
00e80 75ed                           jne        0x7fd1bc3f196f
00e82 41ba94000000                   mov        r10d, 0x94
00e88 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00e8d 7415                           je         0x7fd1bc3f19a4
00e8f 4983c202                       add        r10, 2
00e93 4981fa98000000                 cmp        r10, 0x98
00e9a 75ec                           jne        0x7fd1bc3f1988
00e9c 41ba93000000                   mov        r10d, 0x93
00ea2 eb10                           jmp        0x7fd1bc3f19b4
00ea4 50                             push       rax
00ea5 4833c0                         xor        rax, rax
00ea8 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
00ead 58                             pop        rax
00eae ebb9                           jmp        0x7fd1bc3f1969
00eb0 4983c201                       add        r10, 1
00eb4 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00eb9 48be684b79b4d17f0000           movabs     rsi, 0x7fd1b4794b68
00ec3 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
00ec6 83c302                         add        ebx, 2
00ec9 895e70                         mov        dword ptr [rsi + 0x70], ebx
00ecc 81e3feff1f00                   and        ebx, 0x1ffffe
00ed2 85db                           test       ebx, ebx
00ed4 0f84fc3b0000                   je         0x7fd1bc3f55d6
00eda 488bf7                         mov        rsi, rdi
00edd 48bb684b79b4d17f0000           movabs     rbx, 0x7fd1b4794b68
00ee7 488b36                         mov        rsi, qword ptr [rsi]
00eea 48c1ee2a                       shr        rsi, 0x2a
00eee 48c1e609                       shl        rsi, 9
00ef2 41ba0000005a                   mov        r10d, 0x5a000000
00ef8 4903f2                         add        rsi, r10
00efb 41ba16000000                   mov        r10d, 0x16
00f01 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00f05 7435                           je         0x7fd1bc3f1a3c
00f07 4983c202                       add        r10, 2
00f0b 4983fa1a                       cmp        r10, 0x1a
00f0f 75f0                           jne        0x7fd1bc3f1a01
00f11 41ba16000000                   mov        r10d, 0x16
00f17 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00f1c 7412                           je         0x7fd1bc3f1a30
00f1e 4983c202                       add        r10, 2
00f22 4983fa1a                       cmp        r10, 0x1a
00f26 75ef                           jne        0x7fd1bc3f1a17
00f28 41ba15000000                   mov        r10d, 0x15
00f2e eb10                           jmp        0x7fd1bc3f1a40
00f30 50                             push       rax
00f31 4833c0                         xor        rax, rax
00f34 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
00f39 58                             pop        rax
00f3a ebbf                           jmp        0x7fd1bc3f19fb
00f3c 4983c201                       add        r10, 1
00f40 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00f45 488bf7                         mov        rsi, rdi
00f48 0f1f440000                     nop        dword ptr [rax + rax]
00f4d 48b8e0c33998d17f0000           movabs     rax, 0x7fd19839c3e0
00f57 e804e95107                     call       0x7fd1c3910360
00f5c 0f1f840054100003               nop        dword ptr [rax + rax + 0x3001054]
00f64 488bbc2400020000               mov        rdi, qword ptr [rsp + 0x200]
00f6c 8b7708                         mov        esi, dword ptr [rdi + 8]
00f6f 48bb684b79b4d17f0000           movabs     rbx, 0x7fd1b4794b68
00f79 488383d800000001               add        qword ptr [rbx + 0xd8], 1
00f81 48bb003579b4d17f0000           movabs     rbx, 0x7fd1b4793500
00f8b 8b5370                         mov        edx, dword ptr [rbx + 0x70]
00f8e 83c202                         add        edx, 2
00f91 895370                         mov        dword ptr [rbx + 0x70], edx
00f94 81e2feff1f00                   and        edx, 0x1ffffe
00f9a 85d2                           test       edx, edx
00f9c 0f845a3b0000                   je         0x7fd1bc3f55fc
00fa2 448b9c2408020000               mov        r11d, dword ptr [rsp + 0x208]
00faa 48bb003579b4d17f0000           movabs     rbx, 0x7fd1b4793500
00fb4 4883830801000001               add        qword ptr [rbx + 0x108], 1
00fbc ffc8                           dec        eax
00fbe 2bf0                           sub        esi, eax
00fc0 48bbd02b79b4d17f0000           movabs     rbx, 0x7fd1b4792bd0
00fca 8b4370                         mov        eax, dword ptr [rbx + 0x70]
00fcd 83c002                         add        eax, 2
00fd0 894370                         mov        dword ptr [rbx + 0x70], eax
00fd3 25feff1f00                     and        eax, 0x1ffffe
00fd8 85c0                           test       eax, eax
00fda 0f843d3b0000                   je         0x7fd1bc3f561d
00fe0 48bbd02b79b4d17f0000           movabs     rbx, 0x7fd1b4792bd0
00fea 488383a800000001               add        qword ptr [rbx + 0xa8], 1
00ff2 48bb0000000000000000           movabs     rbx, 0
00ffc bb00000000                     mov        ebx, 0
01001 443bdb                         cmp        r11d, ebx
01004 0f8c343b0000                   jl         0x7fd1bc3f563e
0100a 443bde                         cmp        r11d, esi
0100d 0f8d383b0000                   jge        0x7fd1bc3f564b
01013 498bdb                         mov        rbx, r11
01016 899c2444020000                 mov        dword ptr [rsp + 0x244], ebx
0101d 44899c2408020000               mov        dword ptr [rsp + 0x208], r11d
01025 4889bc2400020000               mov        qword ptr [rsp + 0x200], rdi
0102d 488bbc2448020000               mov        rdi, qword ptr [rsp + 0x248]
01035 488bf7                         mov        rsi, rdi
01038 48ba684b79b4d17f0000           movabs     rdx, 0x7fd1b4794b68
01042 488b36                         mov        rsi, qword ptr [rsi]
01045 48c1ee2a                       shr        rsi, 0x2a
01049 48c1e609                       shl        rsi, 9
0104d 41ba0000005a                   mov        r10d, 0x5a000000
01053 4903f2                         add        rsi, r10
01056 41ba1e000000                   mov        r10d, 0x1e
0105c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01060 7435                           je         0x7fd1bc3f1b97
01062 4983c202                       add        r10, 2
01066 4983fa22                       cmp        r10, 0x22
0106a 75f0                           jne        0x7fd1bc3f1b5c
0106c 41ba1e000000                   mov        r10d, 0x1e
01072 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01077 7412                           je         0x7fd1bc3f1b8b
01079 4983c202                       add        r10, 2
0107d 4983fa22                       cmp        r10, 0x22
01081 75ef                           jne        0x7fd1bc3f1b72
01083 41ba1d000000                   mov        r10d, 0x1d
01089 eb10                           jmp        0x7fd1bc3f1b9b
0108b 50                             push       rax
0108c 4833c0                         xor        rax, rax
0108f 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
01094 58                             pop        rax
01095 ebbf                           jmp        0x7fd1bc3f1b56
01097 4983c201                       add        r10, 1
0109b 4a8304d201                     add        qword ptr [rdx + r10*8], 1
010a0 488bf7                         mov        rsi, rdi
010a3 6690                           nop        
010a5 48b808c43998d17f0000           movabs     rax, 0x7fd19839c408
010af e8ace75107                     call       0x7fd1c3910360
010b4 0f1f8400ac110004               nop        dword ptr [rax + rax + 0x40011ac]
010bc 483b00                         cmp        rax, qword ptr [rax]
010bf 488bf0                         mov        rsi, rax
010c2 48ba684b79b4d17f0000           movabs     rdx, 0x7fd1b4794b68
010cc 488b36                         mov        rsi, qword ptr [rsi]
010cf 48c1ee2a                       shr        rsi, 0x2a
010d3 48c1e609                       shl        rsi, 9
010d7 41ba0000005a                   mov        r10d, 0x5a000000
010dd 4903f2                         add        rsi, r10
010e0 41ba24000000                   mov        r10d, 0x24
010e6 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
010ea 7435                           je         0x7fd1bc3f1c21
010ec 4983c202                       add        r10, 2
010f0 4983fa28                       cmp        r10, 0x28
010f4 75f0                           jne        0x7fd1bc3f1be6
010f6 41ba24000000                   mov        r10d, 0x24
010fc 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01101 7412                           je         0x7fd1bc3f1c15
01103 4983c202                       add        r10, 2
01107 4983fa28                       cmp        r10, 0x28
0110b 75ef                           jne        0x7fd1bc3f1bfc
0110d 41ba23000000                   mov        r10d, 0x23
01113 eb10                           jmp        0x7fd1bc3f1c25
01115 50                             push       rax
01116 4833c0                         xor        rax, rax
01119 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
0111e 58                             pop        rax
0111f ebbf                           jmp        0x7fd1bc3f1be0
01121 4983c201                       add        r10, 1
01125 4a8304d201                     add        qword ptr [rdx + r10*8], 1
0112a 8b7028                         mov        esi, dword ptr [rax + 0x28]
0112d 488bd0                         mov        rdx, rax
01130 48b9684b79b4d17f0000           movabs     rcx, 0x7fd1b4794b68
0113a 488b12                         mov        rdx, qword ptr [rdx]
0113d 48c1ea2a                       shr        rdx, 0x2a
01141 48c1e209                       shl        rdx, 9
01145 41ba0000005a                   mov        r10d, 0x5a000000
0114b 4903d2                         add        rdx, r10
0114e 41ba2a000000                   mov        r10d, 0x2a
01154 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01158 7435                           je         0x7fd1bc3f1c8f
0115a 4983c202                       add        r10, 2
0115e 4983fa2e                       cmp        r10, 0x2e
01162 75f0                           jne        0x7fd1bc3f1c54
01164 41ba2a000000                   mov        r10d, 0x2a
0116a 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0116f 7412                           je         0x7fd1bc3f1c83
01171 4983c202                       add        r10, 2
01175 4983fa2e                       cmp        r10, 0x2e
01179 75ef                           jne        0x7fd1bc3f1c6a
0117b 41ba29000000                   mov        r10d, 0x29
01181 eb10                           jmp        0x7fd1bc3f1c93
01183 50                             push       rax
01184 4833c0                         xor        rax, rax
01187 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
0118c 58                             pop        rax
0118d ebbf                           jmp        0x7fd1bc3f1c4e
0118f 4983c201                       add        r10, 1
01193 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01198 8b4808                         mov        ecx, dword ptr [rax + 8]
0119b 48ba684b79b4d17f0000           movabs     rdx, 0x7fd1b4794b68
011a5 4883827801000001               add        qword ptr [rdx + 0x178], 1
011ad 48ba383779b4d17f0000           movabs     rdx, 0x7fd1b4793738
011b7 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
011bb 4183c002                       add        r8d, 2
011bf 44894270                       mov        dword ptr [rdx + 0x70], r8d
011c3 4181e0feff1f00                 and        r8d, 0x1ffffe
011ca 4585c0                         test       r8d, r8d
011cd 0f848a390000                   je         0x7fd1bc3f565d
011d3 48ba684b79b4d17f0000           movabs     rdx, 0x7fd1b4794b68
011dd 4883828801000001               add        qword ptr [rdx + 0x188], 1
011e5 8b9c2444020000                 mov        ebx, dword ptr [rsp + 0x244]
011ec 4863db                         movsxd     rbx, ebx
011ef ba0c000000                     mov        edx, 0xc
011f4 4c8bcb                         mov        r9, rbx
011f7 4c03ca                         add        r9, rdx
011fa 48ba202979b4d17f0000           movabs     rdx, 0x7fd1b4792920
01204 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01208 4183c002                       add        r8d, 2
0120c 44894270                       mov        dword ptr [rdx + 0x70], r8d
01210 4181e0feff1f00                 and        r8d, 0x1ffffe
01217 4585c0                         test       r8d, r8d
0121a 0f845e390000                   je         0x7fd1bc3f567e
01220 48ba202979b4d17f0000           movabs     rdx, 0x7fd1b4792920
0122a 488382d800000001               add        qword ptr [rdx + 0xd8], 1
01232 48ba982a79b4d17f0000           movabs     rdx, 0x7fd1b4792a98
0123c 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01240 4183c002                       add        r8d, 2
01244 44894270                       mov        dword ptr [rdx + 0x70], r8d
01248 4181e0feff1f00                 and        r8d, 0x1ffffe
0124f 4585c0                         test       r8d, r8d
01252 0f8447390000                   je         0x7fd1bc3f569f
01258 48ba684b79b4d17f0000           movabs     rdx, 0x7fd1b4794b68
01262 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
0126a 48ba48d688e200000000           movabs     rdx, 0xe288d648
01274 ba02000000                     mov        edx, 2
01279 4c8b842400020000               mov        r8, qword ptr [rsp + 0x200]
01281 bf00000000                     mov        edi, 0
01286 488b842448020000               mov        rax, qword ptr [rsp + 0x248]
0128e 48890424                       mov        qword ptr [rsp], rax
01292 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
0129a 4889442408                     mov        qword ptr [rsp + 8], rax
0129f 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
012a4 49ba48d688e200000000           movabs     r10, 0xe288d648
012ae 4c89542418                     mov        qword ptr [rsp + 0x18], r10
012b3 4889842400020000               mov        qword ptr [rsp + 0x200], rax
012bb 0f1f4000                       nop        dword ptr [rax]
012bf e89cea5107                     call       0x7fd1c3910860
012c4 0f1f8400bc130005               nop        dword ptr [rax + rax + 0x50013bc]
012cc 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
012d6 ff86c8040000                   inc        dword ptr [rsi + 0x4c8]
012dc e9d00b0000                     jmp        0x7fd1bc3f29b1
012e1 44899c243c020000               mov        dword ptr [rsp + 0x23c], r11d
012e9 899c2408020000                 mov        dword ptr [rsp + 0x208], ebx
012f0 83f930                         cmp        ecx, 0x30
012f3 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
012fd bae0040000                     mov        edx, 0x4e0
01302 7f05                           jg         0x7fd1bc3f1e09
01304 baf0040000                     mov        edx, 0x4f0
01309 4c8b0416                       mov        r8, qword ptr [rsi + rdx]
0130d 4d8d4001                       lea        r8, [r8 + 1]
01311 4c890416                       mov        qword ptr [rsi + rdx], r8
01315 0f8f000b0000                   jg         0x7fd1bc3f291b
0131b 8b9c24e8010000                 mov        ebx, dword ptr [rsp + 0x1e8]
01322 448b9c2408020000               mov        r11d, dword ptr [rsp + 0x208]
0132a 660f1f440000                   nop        word ptr [rax + rax]
01330 44899c2454020000               mov        dword ptr [rsp + 0x254], r11d
01338 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
01340 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
0134a 4883860005000001               add        qword ptr [rsi + 0x500], 1
01352 48bea83e79b4d17f0000           movabs     rsi, 0x7fd1b4793ea8
0135c 448b4670                       mov        r8d, dword ptr [rsi + 0x70]
01360 4183c002                       add        r8d, 2
01364 44894670                       mov        dword ptr [rsi + 0x70], r8d
01368 4181e0feff1f00                 and        r8d, 0x1ffffe
0136f 4585c0                         test       r8d, r8d
01372 0f8448380000                   je         0x7fd1bc3f56c0
01378 48bed82f84e200000000           movabs     rsi, 0xe2842fd8
01382 49b8a83e79b4d17f0000           movabs     r8, 0x7fd1b4793ea8
0138c 488b36                         mov        rsi, qword ptr [rsi]
0138f 48c1ee2a                       shr        rsi, 0x2a
01393 48c1e609                       shl        rsi, 9
01397 41ba0000005a                   mov        r10d, 0x5a000000
0139d 4903f2                         add        rsi, r10
013a0 41ba16000000                   mov        r10d, 0x16
013a6 4b3b34d0                       cmp        rsi, qword ptr [r8 + r10*8]
013aa 7435                           je         0x7fd1bc3f1ee1
013ac 4983c202                       add        r10, 2
013b0 4983fa1a                       cmp        r10, 0x1a
013b4 75f0                           jne        0x7fd1bc3f1ea6
013b6 41ba16000000                   mov        r10d, 0x16
013bc 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
013c1 7412                           je         0x7fd1bc3f1ed5
013c3 4983c202                       add        r10, 2
013c7 4983fa1a                       cmp        r10, 0x1a
013cb 75ef                           jne        0x7fd1bc3f1ebc
013cd 41ba15000000                   mov        r10d, 0x15
013d3 eb10                           jmp        0x7fd1bc3f1ee5
013d5 50                             push       rax
013d6 4833c0                         xor        rax, rax
013d9 4b0fb134d0                     cmpxchg    qword ptr [r8 + r10*8], rsi
013de 58                             pop        rax
013df ebbf                           jmp        0x7fd1bc3f1ea0
013e1 4983c201                       add        r10, 1
013e5 4b8304d001                     add        qword ptr [r8 + r10*8], 1
013ea 8b7208                         mov        esi, dword ptr [rdx + 8]
013ed 49b8a83e79b4d17f0000           movabs     r8, 0x7fd1b4793ea8
013f7 498380d800000001               add        qword ptr [r8 + 0xd8], 1
013ff 49b8003579b4d17f0000           movabs     r8, 0x7fd1b4793500
01409 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
0140d 4183c102                       add        r9d, 2
01411 45894870                       mov        dword ptr [r8 + 0x70], r9d
01415 4181e1feff1f00                 and        r9d, 0x1ffffe
0141c 4585c9                         test       r9d, r9d
0141f 0f84c1370000                   je         0x7fd1bc3f56e6
01425 49b8003579b4d17f0000           movabs     r8, 0x7fd1b4793500
0142f 4983800801000001               add        qword ptr [r8 + 0x108], 1
01437 83ee0f                         sub        esi, 0xf
0143a 49b8d02b79b4d17f0000           movabs     r8, 0x7fd1b4792bd0
01444 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
01448 4183c102                       add        r9d, 2
0144c 45894870                       mov        dword ptr [r8 + 0x70], r9d
01450 4181e1feff1f00                 and        r9d, 0x1ffffe
01457 4585c9                         test       r9d, r9d
0145a 0f84a7370000                   je         0x7fd1bc3f5707
01460 49b8d02b79b4d17f0000           movabs     r8, 0x7fd1b4792bd0
0146a 498380a800000001               add        qword ptr [r8 + 0xa8], 1
01472 49b80000000000000000           movabs     r8, 0
0147c 41b800000000                   mov        r8d, 0
01482 413bd8                         cmp        ebx, r8d
01485 0f8c9d370000                   jl         0x7fd1bc3f5728
0148b 3bde                           cmp        ebx, esi
0148d 0f8da2370000                   jge        0x7fd1bc3f5735
01493 488bf3                         mov        rsi, rbx
01496 49b8d82f84e200000000           movabs     r8, 0xe2842fd8
014a0 4d8bc8                         mov        r9, r8
014a3 48bfa83e79b4d17f0000           movabs     rdi, 0x7fd1b4793ea8
014ad 4d8b09                         mov        r9, qword ptr [r9]
014b0 49c1e92a                       shr        r9, 0x2a
014b4 49c1e109                       shl        r9, 9
014b8 41ba0000005a                   mov        r10d, 0x5a000000
014be 4d03ca                         add        r9, r10
014c1 41ba24000000                   mov        r10d, 0x24
014c7 4e3b0cd7                       cmp        r9, qword ptr [rdi + r10*8]
014cb 7435                           je         0x7fd1bc3f2002
014cd 4983c202                       add        r10, 2
014d1 4983fa28                       cmp        r10, 0x28
014d5 75f0                           jne        0x7fd1bc3f1fc7
014d7 41ba24000000                   mov        r10d, 0x24
014dd 4a833cd700                     cmp        qword ptr [rdi + r10*8], 0
014e2 7412                           je         0x7fd1bc3f1ff6
014e4 4983c202                       add        r10, 2
014e8 4983fa28                       cmp        r10, 0x28
014ec 75ef                           jne        0x7fd1bc3f1fdd
014ee 41ba23000000                   mov        r10d, 0x23
014f4 eb10                           jmp        0x7fd1bc3f2006
014f6 50                             push       rax
014f7 4833c0                         xor        rax, rax
014fa 4e0fb10cd7                     cmpxchg    qword ptr [rdi + r10*8], r9
014ff 58                             pop        rax
01500 ebbf                           jmp        0x7fd1bc3f1fc1
01502 4983c201                       add        r10, 1
01506 4a8304d701                     add        qword ptr [rdi + r10*8], 1
0150b 49b9d02c79b4d17f0000           movabs     r9, 0x7fd1b4792cd0
01515 418b7970                       mov        edi, dword ptr [r9 + 0x70]
01519 83c702                         add        edi, 2
0151c 41897970                       mov        dword ptr [r9 + 0x70], edi
01520 81e7feff1f00                   and        edi, 0x1ffffe
01526 85ff                           test       edi, edi
01528 0f8414370000                   je         0x7fd1bc3f5742
0152e 49b9d02c79b4d17f0000           movabs     r9, 0x7fd1b4792cd0
01538 498381a800000001               add        qword ptr [r9 + 0xa8], 1
01540 49b8f82d79b4d17f0000           movabs     r8, 0x7fd1b4792df8
0154a 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
0154e 4183c102                       add        r9d, 2
01552 45894870                       mov        dword ptr [r8 + 0x70], r9d
01556 4181e1feff1f00                 and        r9d, 0x1ffffe
0155d 4585c9                         test       r9d, r9d
01560 0f84fd360000                   je         0x7fd1bc3f5763
01566 49b8f82d79b4d17f0000           movabs     r8, 0x7fd1b4792df8
01570 41ff80b8000000                 inc        dword ptr [r8 + 0xb8]
01577 899c2450020000                 mov        dword ptr [rsp + 0x250], ebx
0157e 49b8d0fa85e200000000           movabs     r8, 0xe285fad0
01588 4d8bc8                         mov        r9, r8
0158b 48bfa83e79b4d17f0000           movabs     rdi, 0x7fd1b4793ea8
01595 4883875801000001               add        qword ptr [rdi + 0x158], 1
0159d 49b9704079b4d17f0000           movabs     r9, 0x7fd1b4794070
015a7 418b7970                       mov        edi, dword ptr [r9 + 0x70]
015ab 83c702                         add        edi, 2
015ae 41897970                       mov        dword ptr [r9 + 0x70], edi
015b2 81e7feff1f00                   and        edi, 0x1ffffe
015b8 85ff                           test       edi, edi
015ba 0f84c4360000                   je         0x7fd1bc3f5784
015c0 4d8bc8                         mov        r9, r8
015c3 48bf704079b4d17f0000           movabs     rdi, 0x7fd1b4794070
015cd 488387a800000001               add        qword ptr [rdi + 0xa8], 1
015d5 49b9504179b4d17f0000           movabs     r9, 0x7fd1b4794150
015df 418b7970                       mov        edi, dword ptr [r9 + 0x70]
015e3 83c702                         add        edi, 2
015e6 41897970                       mov        dword ptr [r9 + 0x70], edi
015ea 81e7feff1f00                   and        edi, 0x1ffffe
015f0 85ff                           test       edi, edi
015f2 0f84ad360000                   je         0x7fd1bc3f57a5
015f8 49b9504179b4d17f0000           movabs     r9, 0x7fd1b4794150
01602 498381b800000001               add        qword ptr [r9 + 0xb8], 1
0160a 49b8783679b4d17f0000           movabs     r8, 0x7fd1b4793678
01614 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
01618 4183c102                       add        r9d, 2
0161c 45894870                       mov        dword ptr [r8 + 0x70], r9d
01620 4181e1feff1f00                 and        r9d, 0x1ffffe
01627 4585c9                         test       r9d, r9d
0162a 0f8496360000                   je         0x7fd1bc3f57c6
01630 49b8d82f84e200000000           movabs     r8, 0xe2842fd8
0163a 4d8bc8                         mov        r9, r8
0163d 48bf504179b4d17f0000           movabs     rdi, 0x7fd1b4794150
01647 4d8b09                         mov        r9, qword ptr [r9]
0164a 49c1e92a                       shr        r9, 0x2a
0164e 49c1e109                       shl        r9, 9
01652 41ba0000005a                   mov        r10d, 0x5a000000
01658 4d03ca                         add        r9, r10
0165b 41ba1c000000                   mov        r10d, 0x1c
01661 4e3b0cd7                       cmp        r9, qword ptr [rdi + r10*8]
01665 7435                           je         0x7fd1bc3f219c
01667 4983c202                       add        r10, 2
0166b 4983fa20                       cmp        r10, 0x20
0166f 75f0                           jne        0x7fd1bc3f2161
01671 41ba1c000000                   mov        r10d, 0x1c
01677 4a833cd700                     cmp        qword ptr [rdi + r10*8], 0
0167c 7412                           je         0x7fd1bc3f2190
0167e 4983c202                       add        r10, 2
01682 4983fa20                       cmp        r10, 0x20
01686 75ef                           jne        0x7fd1bc3f2177
01688 41ba1b000000                   mov        r10d, 0x1b
0168e eb10                           jmp        0x7fd1bc3f21a0
01690 50                             push       rax
01691 4833c0                         xor        rax, rax
01694 4e0fb10cd7                     cmpxchg    qword ptr [rdi + r10*8], r9
01699 58                             pop        rax
0169a ebbf                           jmp        0x7fd1bc3f215b
0169c 4983c201                       add        r10, 1
016a0 4a8304d701                     add        qword ptr [rdi + r10*8], 1
016a5 49b9504179b4d17f0000           movabs     r9, 0x7fd1b4794150
016af 4d8b00                         mov        r8, qword ptr [r8]
016b2 49c1e82a                       shr        r8, 0x2a
016b6 49c1e009                       shl        r8, 9
016ba 41ba0000005a                   mov        r10d, 0x5a000000
016c0 4d03c2                         add        r8, r10
016c3 41ba22000000                   mov        r10d, 0x22
016c9 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
016cd 7435                           je         0x7fd1bc3f2204
016cf 4983c202                       add        r10, 2
016d3 4983fa26                       cmp        r10, 0x26
016d7 75f0                           jne        0x7fd1bc3f21c9
016d9 41ba22000000                   mov        r10d, 0x22
016df 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
016e4 7412                           je         0x7fd1bc3f21f8
016e6 4983c202                       add        r10, 2
016ea 4983fa26                       cmp        r10, 0x26
016ee 75ef                           jne        0x7fd1bc3f21df
016f0 41ba21000000                   mov        r10d, 0x21
016f6 eb10                           jmp        0x7fd1bc3f2208
016f8 50                             push       rax
016f9 4833c0                         xor        rax, rax
016fc 4f0fb104d1                     cmpxchg    qword ptr [r9 + r10*8], r8
01701 58                             pop        rax
01702 ebbf                           jmp        0x7fd1bc3f21c3
01704 4983c201                       add        r10, 1
01708 4b8304d101                     add        qword ptr [r9 + r10*8], 1
0170d 49b8504179b4d17f0000           movabs     r8, 0x7fd1b4794150
01717 4983803801000001               add        qword ptr [r8 + 0x138], 1
0171f 49b8383779b4d17f0000           movabs     r8, 0x7fd1b4793738
01729 458b4870                       mov        r9d, dword ptr [r8 + 0x70]
0172d 4183c102                       add        r9d, 2
01731 45894870                       mov        dword ptr [r8 + 0x70], r9d
01735 4181e1feff1f00                 and        r9d, 0x1ffffe
0173c 4585c9                         test       r9d, r9d
0173f 0f84a2350000                   je         0x7fd1bc3f57e7
01745 49b8504179b4d17f0000           movabs     r8, 0x7fd1b4794150
0174f 4983804801000001               add        qword ptr [r8 + 0x148], 1
01757 4c63f6                         movsxd     r14, esi
0175a be0c000000                     mov        esi, 0xc
0175f 4d8bce                         mov        r9, r14
01762 4c03ce                         add        r9, rsi
01765 48be202979b4d17f0000           movabs     rsi, 0x7fd1b4792920
0176f 448b4670                       mov        r8d, dword ptr [rsi + 0x70]
01773 4183c002                       add        r8d, 2
01777 44894670                       mov        dword ptr [rsi + 0x70], r8d
0177b 4181e0feff1f00                 and        r8d, 0x1ffffe
01782 4585c0                         test       r8d, r8d
01785 0f847d350000                   je         0x7fd1bc3f5808
0178b 48be202979b4d17f0000           movabs     rsi, 0x7fd1b4792920
01795 488386d800000001               add        qword ptr [rsi + 0xd8], 1
0179d 48be982a79b4d17f0000           movabs     rsi, 0x7fd1b4792a98
017a7 448b4670                       mov        r8d, dword ptr [rsi + 0x70]
017ab 4183c002                       add        r8d, 2
017af 44894670                       mov        dword ptr [rsi + 0x70], r8d
017b3 4181e0feff1f00                 and        r8d, 0x1ffffe
017ba 4585c0                         test       r8d, r8d
017bd 0f8466350000                   je         0x7fd1bc3f5829
017c3 48be504179b4d17f0000           movabs     rsi, 0x7fd1b4794150
017cd 4883866801000001               add        qword ptr [rsi + 0x168], 1
017d5 48bea0f586e200000000           movabs     rsi, 0xe286f5a0
017df 48be203084e200000000           movabs     rsi, 0xe2843020
017e9 488bfa                         mov        rdi, rdx
017ec ba02000000                     mov        edx, 2
017f1 b910000000                     mov        ecx, 0x10
017f6 4c8bc7                         mov        r8, rdi
017f9 488bdf                         mov        rbx, rdi
017fc bf00000000                     mov        edi, 0
01801 48891c24                       mov        qword ptr [rsp], rbx
01805 4c89742408                     mov        qword ptr [rsp + 8], r14
0180a 49bad82f84e200000000           movabs     r10, 0xe2842fd8
01814 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01819 49baa0f586e200000000           movabs     r10, 0xe286f5a0
01823 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01828 48899c2468010000               mov        qword ptr [rsp + 0x168], rbx
01830 0f1f8000000000                 nop        dword ptr [rax]
01837 e824e55107                     call       0x7fd1c3910860
0183c 0f1f840034190006               nop        dword ptr [rax + rax + 0x6001934]
01844 4885c0                         test       rax, rax
01847 48bb504179b4d17f0000           movabs     rbx, 0x7fd1b4794150
01851 750c                           jne        0x7fd1bc3f235f
01853 808b7101000001                 or         byte ptr [rbx + 0x171], 1
0185a e98b000000                     jmp        0x7fd1bc3f23ea
0185f 488b38                         mov        rdi, qword ptr [rax]
01862 48c1ef2a                       shr        rdi, 0x2a
01866 48c1e709                       shl        rdi, 9
0186a 41ba0000005a                   mov        r10d, 0x5a000000
01870 4903fa                         add        rdi, r10
01873 41ba30000000                   mov        r10d, 0x30
01879 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
0187d 7435                           je         0x7fd1bc3f23b4
0187f 4983c202                       add        r10, 2
01883 4983fa34                       cmp        r10, 0x34
01887 75f0                           jne        0x7fd1bc3f2379
01889 41ba30000000                   mov        r10d, 0x30
0188f 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01894 7412                           je         0x7fd1bc3f23a8
01896 4983c202                       add        r10, 2
0189a 4983fa34                       cmp        r10, 0x34
0189e 75ef                           jne        0x7fd1bc3f238f
018a0 41ba2f000000                   mov        r10d, 0x2f
018a6 eb10                           jmp        0x7fd1bc3f23b8
018a8 50                             push       rax
018a9 4833c0                         xor        rax, rax
018ac 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
018b1 58                             pop        rax
018b2 ebbf                           jmp        0x7fd1bc3f2373
018b4 4983c201                       add        r10, 1
018b8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
018bd 48bf0006145a00000000           movabs     rdi, 0x5a140600
018c7 488b18                         mov        rbx, qword ptr [rax]
018ca 48c1eb2a                       shr        rbx, 0x2a
018ce 48c1e309                       shl        rbx, 9
018d2 41ba0000005a                   mov        r10d, 0x5a000000
018d8 4903da                         add        rbx, r10
018db 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
018df 0f8565340000                   jne        0x7fd1bc3f584a
018e5 e900000000                     jmp        0x7fd1bc3f23ea
018ea 488bf8                         mov        rdi, rax
018ed 4889bc2458020000               mov        qword ptr [rsp + 0x258], rdi
018f5 483b07                         cmp        rax, qword ptr [rdi]
018f8 488bf7                         mov        rsi, rdi
018fb 48bbe86872b4d17f0000           movabs     rbx, 0x7fd1b47268e8
01905 488b36                         mov        rsi, qword ptr [rsi]
01908 48c1ee2a                       shr        rsi, 0x2a
0190c 48c1e609                       shl        rsi, 9
01910 41ba0000005a                   mov        r10d, 0x5a000000
01916 4903f2                         add        rsi, r10
01919 41baa3000000                   mov        r10d, 0xa3
0191f 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
01923 743b                           je         0x7fd1bc3f2460
01925 4983c202                       add        r10, 2
01929 4981faa7000000                 cmp        r10, 0xa7
01930 75ed                           jne        0x7fd1bc3f241f
01932 41baa3000000                   mov        r10d, 0xa3
01938 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0193d 7415                           je         0x7fd1bc3f2454
0193f 4983c202                       add        r10, 2
01943 4981faa7000000                 cmp        r10, 0xa7
0194a 75ec                           jne        0x7fd1bc3f2438
0194c 41baa2000000                   mov        r10d, 0xa2
01952 eb10                           jmp        0x7fd1bc3f2464
01954 50                             push       rax
01955 4833c0                         xor        rax, rax
01958 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
0195d 58                             pop        rax
0195e ebb9                           jmp        0x7fd1bc3f2419
01960 4983c201                       add        r10, 1
01964 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01969 48be684b79b4d17f0000           movabs     rsi, 0x7fd1b4794b68
01973 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
01976 83c302                         add        ebx, 2
01979 895e70                         mov        dword ptr [rsi + 0x70], ebx
0197c 81e3feff1f00                   and        ebx, 0x1ffffe
01982 85db                           test       ebx, ebx
01984 0f84ce330000                   je         0x7fd1bc3f5858
0198a 488bf7                         mov        rsi, rdi
0198d 48bb684b79b4d17f0000           movabs     rbx, 0x7fd1b4794b68
01997 488b36                         mov        rsi, qword ptr [rsi]
0199a 48c1ee2a                       shr        rsi, 0x2a
0199e 48c1e609                       shl        rsi, 9
019a2 41ba0000005a                   mov        r10d, 0x5a000000
019a8 4903f2                         add        rsi, r10
019ab 41ba16000000                   mov        r10d, 0x16
019b1 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
019b5 7435                           je         0x7fd1bc3f24ec
019b7 4983c202                       add        r10, 2
019bb 4983fa1a                       cmp        r10, 0x1a
019bf 75f0                           jne        0x7fd1bc3f24b1
019c1 41ba16000000                   mov        r10d, 0x16
019c7 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
019cc 7412                           je         0x7fd1bc3f24e0
019ce 4983c202                       add        r10, 2
019d2 4983fa1a                       cmp        r10, 0x1a
019d6 75ef                           jne        0x7fd1bc3f24c7
019d8 41ba15000000                   mov        r10d, 0x15
019de eb10                           jmp        0x7fd1bc3f24f0
019e0 50                             push       rax
019e1 4833c0                         xor        rax, rax
019e4 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
019e9 58                             pop        rax
019ea ebbf                           jmp        0x7fd1bc3f24ab
019ec 4983c201                       add        r10, 1
019f0 4a8304d301                     add        qword ptr [rbx + r10*8], 1
019f5 488bf7                         mov        rsi, rdi
019f8 0f1f440000                     nop        dword ptr [rax + rax]
019fd 48b830c43998d17f0000           movabs     rax, 0x7fd19839c430
01a07 e854de5107                     call       0x7fd1c3910360
01a0c 0f1f8400041b0007               nop        dword ptr [rax + rax + 0x7001b04]
01a14 488bbc2400020000               mov        rdi, qword ptr [rsp + 0x200]
01a1c 8b7708                         mov        esi, dword ptr [rdi + 8]
01a1f 48bb684b79b4d17f0000           movabs     rbx, 0x7fd1b4794b68
01a29 488383d800000001               add        qword ptr [rbx + 0xd8], 1
01a31 48bb003579b4d17f0000           movabs     rbx, 0x7fd1b4793500
01a3b 8b5370                         mov        edx, dword ptr [rbx + 0x70]
01a3e 83c202                         add        edx, 2
01a41 895370                         mov        dword ptr [rbx + 0x70], edx
01a44 81e2feff1f00                   and        edx, 0x1ffffe
01a4a 85d2                           test       edx, edx
01a4c 0f842c330000                   je         0x7fd1bc3f587e
01a52 448b9c2454020000               mov        r11d, dword ptr [rsp + 0x254]
01a5a 48bb003579b4d17f0000           movabs     rbx, 0x7fd1b4793500
01a64 4883830801000001               add        qword ptr [rbx + 0x108], 1
01a6c ffc8                           dec        eax
01a6e 2bf0                           sub        esi, eax
01a70 48bbd02b79b4d17f0000           movabs     rbx, 0x7fd1b4792bd0
01a7a 8b4370                         mov        eax, dword ptr [rbx + 0x70]
01a7d 83c002                         add        eax, 2
01a80 894370                         mov        dword ptr [rbx + 0x70], eax
01a83 25feff1f00                     and        eax, 0x1ffffe
01a88 85c0                           test       eax, eax
01a8a 0f840f330000                   je         0x7fd1bc3f589f
01a90 48bbd02b79b4d17f0000           movabs     rbx, 0x7fd1b4792bd0
01a9a 488383a800000001               add        qword ptr [rbx + 0xa8], 1
01aa2 48bb0000000000000000           movabs     rbx, 0
01aac bb00000000                     mov        ebx, 0
01ab1 443bdb                         cmp        r11d, ebx
01ab4 0f8c06330000                   jl         0x7fd1bc3f58c0
01aba 443bde                         cmp        r11d, esi
01abd 0f8d0a330000                   jge        0x7fd1bc3f58cd
01ac3 498bdb                         mov        rbx, r11
01ac6 899c2460020000                 mov        dword ptr [rsp + 0x260], ebx
01acd 44899c2454020000               mov        dword ptr [rsp + 0x254], r11d
01ad5 4889bc2400020000               mov        qword ptr [rsp + 0x200], rdi
01add 488bbc2458020000               mov        rdi, qword ptr [rsp + 0x258]
01ae5 488bf7                         mov        rsi, rdi
01ae8 48ba684b79b4d17f0000           movabs     rdx, 0x7fd1b4794b68
01af2 488b36                         mov        rsi, qword ptr [rsi]
01af5 48c1ee2a                       shr        rsi, 0x2a
01af9 48c1e609                       shl        rsi, 9
01afd 41ba0000005a                   mov        r10d, 0x5a000000
01b03 4903f2                         add        rsi, r10
01b06 41ba1e000000                   mov        r10d, 0x1e
01b0c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01b10 7435                           je         0x7fd1bc3f2647
01b12 4983c202                       add        r10, 2
01b16 4983fa22                       cmp        r10, 0x22
01b1a 75f0                           jne        0x7fd1bc3f260c
01b1c 41ba1e000000                   mov        r10d, 0x1e
01b22 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01b27 7412                           je         0x7fd1bc3f263b
01b29 4983c202                       add        r10, 2
01b2d 4983fa22                       cmp        r10, 0x22
01b31 75ef                           jne        0x7fd1bc3f2622
01b33 41ba1d000000                   mov        r10d, 0x1d
01b39 eb10                           jmp        0x7fd1bc3f264b
01b3b 50                             push       rax
01b3c 4833c0                         xor        rax, rax
01b3f 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
01b44 58                             pop        rax
01b45 ebbf                           jmp        0x7fd1bc3f2606
01b47 4983c201                       add        r10, 1
01b4b 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01b50 488bf7                         mov        rsi, rdi
01b53 6690                           nop        
01b55 48b858c43998d17f0000           movabs     rax, 0x7fd19839c458
01b5f e8fcdc5107                     call       0x7fd1c3910360
01b64 0f1f84005c1c0008               nop        dword ptr [rax + rax + 0x8001c5c]
01b6c 483b00                         cmp        rax, qword ptr [rax]
01b6f 488bf0                         mov        rsi, rax
01b72 48ba684b79b4d17f0000           movabs     rdx, 0x7fd1b4794b68
01b7c 488b36                         mov        rsi, qword ptr [rsi]
01b7f 48c1ee2a                       shr        rsi, 0x2a
01b83 48c1e609                       shl        rsi, 9
01b87 41ba0000005a                   mov        r10d, 0x5a000000
01b8d 4903f2                         add        rsi, r10
01b90 41ba24000000                   mov        r10d, 0x24
01b96 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01b9a 7435                           je         0x7fd1bc3f26d1
01b9c 4983c202                       add        r10, 2
01ba0 4983fa28                       cmp        r10, 0x28
01ba4 75f0                           jne        0x7fd1bc3f2696
01ba6 41ba24000000                   mov        r10d, 0x24
01bac 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01bb1 7412                           je         0x7fd1bc3f26c5
01bb3 4983c202                       add        r10, 2
01bb7 4983fa28                       cmp        r10, 0x28
01bbb 75ef                           jne        0x7fd1bc3f26ac
01bbd 41ba23000000                   mov        r10d, 0x23
01bc3 eb10                           jmp        0x7fd1bc3f26d5
01bc5 50                             push       rax
01bc6 4833c0                         xor        rax, rax
01bc9 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
01bce 58                             pop        rax
01bcf ebbf                           jmp        0x7fd1bc3f2690
01bd1 4983c201                       add        r10, 1
01bd5 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01bda 8b7028                         mov        esi, dword ptr [rax + 0x28]
01bdd 488bd0                         mov        rdx, rax
01be0 48b9684b79b4d17f0000           movabs     rcx, 0x7fd1b4794b68
01bea 488b12                         mov        rdx, qword ptr [rdx]
01bed 48c1ea2a                       shr        rdx, 0x2a
01bf1 48c1e209                       shl        rdx, 9
01bf5 41ba0000005a                   mov        r10d, 0x5a000000
01bfb 4903d2                         add        rdx, r10
01bfe 41ba2a000000                   mov        r10d, 0x2a
01c04 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01c08 7435                           je         0x7fd1bc3f273f
01c0a 4983c202                       add        r10, 2
01c0e 4983fa2e                       cmp        r10, 0x2e
01c12 75f0                           jne        0x7fd1bc3f2704
01c14 41ba2a000000                   mov        r10d, 0x2a
01c1a 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01c1f 7412                           je         0x7fd1bc3f2733
01c21 4983c202                       add        r10, 2
01c25 4983fa2e                       cmp        r10, 0x2e
01c29 75ef                           jne        0x7fd1bc3f271a
01c2b 41ba29000000                   mov        r10d, 0x29
01c31 eb10                           jmp        0x7fd1bc3f2743
01c33 50                             push       rax
01c34 4833c0                         xor        rax, rax
01c37 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
01c3c 58                             pop        rax
01c3d ebbf                           jmp        0x7fd1bc3f26fe
01c3f 4983c201                       add        r10, 1
01c43 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01c48 8b4808                         mov        ecx, dword ptr [rax + 8]
01c4b 48ba684b79b4d17f0000           movabs     rdx, 0x7fd1b4794b68
01c55 4883827801000001               add        qword ptr [rdx + 0x178], 1
01c5d 48ba383779b4d17f0000           movabs     rdx, 0x7fd1b4793738
01c67 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01c6b 4183c002                       add        r8d, 2
01c6f 44894270                       mov        dword ptr [rdx + 0x70], r8d
01c73 4181e0feff1f00                 and        r8d, 0x1ffffe
01c7a 4585c0                         test       r8d, r8d
01c7d 0f845c310000                   je         0x7fd1bc3f58df
01c83 48ba684b79b4d17f0000           movabs     rdx, 0x7fd1b4794b68
01c8d 4883828801000001               add        qword ptr [rdx + 0x188], 1
01c95 8b9c2460020000                 mov        ebx, dword ptr [rsp + 0x260]
01c9c 4863db                         movsxd     rbx, ebx
01c9f ba0c000000                     mov        edx, 0xc
01ca4 4c8bcb                         mov        r9, rbx
01ca7 4c03ca                         add        r9, rdx
01caa 48ba202979b4d17f0000           movabs     rdx, 0x7fd1b4792920
01cb4 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01cb8 4183c002                       add        r8d, 2
01cbc 44894270                       mov        dword ptr [rdx + 0x70], r8d
01cc0 4181e0feff1f00                 and        r8d, 0x1ffffe
01cc7 4585c0                         test       r8d, r8d
01cca 0f8430310000                   je         0x7fd1bc3f5900
01cd0 48ba202979b4d17f0000           movabs     rdx, 0x7fd1b4792920
01cda 488382d800000001               add        qword ptr [rdx + 0xd8], 1
01ce2 48ba982a79b4d17f0000           movabs     rdx, 0x7fd1b4792a98
01cec 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
01cf0 4183c002                       add        r8d, 2
01cf4 44894270                       mov        dword ptr [rdx + 0x70], r8d
01cf8 4181e0feff1f00                 and        r8d, 0x1ffffe
01cff 4585c0                         test       r8d, r8d
01d02 0f8419310000                   je         0x7fd1bc3f5921
01d08 48ba684b79b4d17f0000           movabs     rdx, 0x7fd1b4794b68
01d12 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
01d1a 48ba48d688e200000000           movabs     rdx, 0xe288d648
01d24 ba02000000                     mov        edx, 2
01d29 4c8b842400020000               mov        r8, qword ptr [rsp + 0x200]
01d31 bf00000000                     mov        edi, 0
01d36 488b842458020000               mov        rax, qword ptr [rsp + 0x258]
01d3e 48890424                       mov        qword ptr [rsp], rax
01d42 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
01d4a 4889442408                     mov        qword ptr [rsp + 8], rax
01d4f 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01d54 49ba48d688e200000000           movabs     r10, 0xe288d648
01d5e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d63 4889842400020000               mov        qword ptr [rsp + 0x200], rax
01d6b 0f1f4000                       nop        dword ptr [rax]
01d6f e8ecdf5107                     call       0x7fd1c3910860
01d74 0f1f84006c1e0009               nop        dword ptr [rax + rax + 0x9001e6c]
01d7c 448b9c2454020000               mov        r11d, dword ptr [rsp + 0x254]
01d84 4183c310                       add        r11d, 0x10
01d88 8b9c2450020000                 mov        ebx, dword ptr [rsp + 0x250]
01d8f 83c310                         add        ebx, 0x10
01d92 443b9c2440020000               cmp        r11d, dword ptr [rsp + 0x240]
01d9a be02000000                     mov        esi, 2
01d9f 7c05                           jl         0x7fd1bc3f28a6
01da1 be00000000                     mov        esi, 0
01da6 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
01db0 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
01db3 03ce                           add        ecx, esi
01db5 894a74                         mov        dword ptr [rdx + 0x74], ecx
01db8 85f6                           test       esi, esi
01dba 7505                           jne        0x7fd1bc3f28c1
01dbc b902000000                     mov        ecx, 2
01dc1 81e1fe3f0000                   and        ecx, 0x3ffe
01dc7 85c9                           test       ecx, ecx
01dc9 0f8473300000                   je         0x7fd1bc3f5942
01dcf 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01dd3 418502                         test       dword ptr [r10], eax
01dd6 443b9c2440020000               cmp        r11d, dword ptr [rsp + 0x240]
01dde 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
01de8 ba40050000                     mov        edx, 0x540
01ded 7c05                           jl         0x7fd1bc3f28f4
01def ba50050000                     mov        edx, 0x550
01df4 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
01df8 488d4901                       lea        rcx, [rcx + 1]
01dfc 48890c16                       mov        qword ptr [rsi + rdx], rcx
01e00 0f8c2af5ffff                   jl         0x7fd1bc3f1e30
01e06 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
01e10 ff8660050000                   inc        dword ptr [rsi + 0x560]
01e16 e996000000                     jmp        0x7fd1bc3f29b1
01e1b 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
01e25 4883867805000001               add        qword ptr [rsi + 0x578], 1
01e2d 488bb42468010000               mov        rsi, qword ptr [rsp + 0x168]
01e35 8b9424e8010000                 mov        edx, dword ptr [rsp + 0x1e8]
01e3c 488bd9                         mov        rbx, rcx
01e3f 488b8c2400020000               mov        rcx, qword ptr [rsp + 0x200]
01e47 448b842408020000               mov        r8d, dword ptr [rsp + 0x208]
01e4f 4c8bcb                         mov        r9, rbx
01e52 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
01e57 4c89442408                     mov        qword ptr [rsp + 8], r8
01e5c 48890c24                       mov        qword ptr [rsp], rcx
01e60 4889542418                     mov        qword ptr [rsp + 0x18], rdx
01e65 4889742420                     mov        qword ptr [rsp + 0x20], rsi
01e6a 488bfe                         mov        rdi, rsi
01e6d 488bf2                         mov        rsi, rdx
01e70 488bd1                         mov        rdx, rcx
01e73 498bc8                         mov        rcx, r8
01e76 4d8bc1                         mov        r8, r9
01e79 e8c2be5007                     call       0x7fd1c38fe840
01e7e 85c0                           test       eax, eax
01e80 0f842b000000                   je         0x7fd1bc3f29b1
01e86 488bf8                         mov        rdi, rax
01e89 83f7ff                         xor        edi, 0xffffffff
01e8c 488b0c24                       mov        rcx, qword ptr [rsp]
01e90 4c8b442408                     mov        r8, qword ptr [rsp + 8]
01e95 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
01e9a 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
01e9f 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
01ea4 442bcf                         sub        r9d, edi
01ea7 03d7                           add        edx, edi
01ea9 4403c7                         add        r8d, edi
01eac e9b22f0000                     jmp        0x7fd1bc3f5963
01eb1 8bbc2438020000                 mov        edi, dword ptr [rsp + 0x238]
01eb8 448bac2440020000               mov        r13d, dword ptr [rsp + 0x240]
01ec0 8bb42410020000                 mov        esi, dword ptr [rsp + 0x210]
01ec7 498bdd                         mov        rbx, r13
01eca 2b9c243c020000                 sub        ebx, dword ptr [rsp + 0x23c]
01ed1 83fe10                         cmp        esi, 0x10
01ed4 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
01ede b988050000                     mov        ecx, 0x588
01ee3 7f05                           jg         0x7fd1bc3f29ea
01ee5 b998050000                     mov        ecx, 0x598
01eea 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01eee 4d8d4001                       lea        r8, [r8 + 1]
01ef2 4c89040a                       mov        qword ptr [rdx + rcx], r8
01ef6 448b9c243c020000               mov        r11d, dword ptr [rsp + 0x23c]
01efe 0f8f2c000000                   jg         0x7fd1bc3f2a30
01f04 4183fb10                       cmp        r11d, 0x10
01f08 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
01f12 b9b8050000                     mov        ecx, 0x5b8
01f17 7d05                           jge        0x7fd1bc3f2a1e
01f19 b9a8050000                     mov        ecx, 0x5a8
01f1e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01f22 4d8d4001                       lea        r8, [r8 + 1]
01f26 4c89040a                       mov        qword ptr [rdx + rcx], r8
01f2a 0f8dec170000                   jge        0x7fd1bc3f421c
01f30 443bde                         cmp        r11d, esi
01f33 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
01f3d b920060000                     mov        ecx, 0x620
01f42 7c05                           jl         0x7fd1bc3f2a49
01f44 b930060000                     mov        ecx, 0x630
01f49 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01f4d 4d8d4001                       lea        r8, [r8 + 1]
01f51 4c89040a                       mov        qword ptr [rdx + rcx], r8
01f55 0f8c84060000                   jl         0x7fd1bc3f30df
01f5b 83fe30                         cmp        esi, 0x30
01f5e 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
01f68 b940060000                     mov        ecx, 0x640
01f6d 7e05                           jle        0x7fd1bc3f2a74
01f6f b950060000                     mov        ecx, 0x650
01f74 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01f78 4d8d4001                       lea        r8, [r8 + 1]
01f7c 4c89040a                       mov        qword ptr [rdx + rcx], r8
01f80 89bc2468020000                 mov        dword ptr [rsp + 0x268], edi
01f87 0f8eaa000000                   jle        0x7fd1bc3f2b37
01f8d 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
01f97 4883826006000001               add        qword ptr [rdx + 0x660], 1
01f9f 488bc6                         mov        rax, rsi
01fa2 488bb42400020000               mov        rsi, qword ptr [rsp + 0x200]
01faa 488bd3                         mov        rdx, rbx
01fad 488b8c2400020000               mov        rcx, qword ptr [rsp + 0x200]
01fb5 4d8bc5                         mov        r8, r13
01fb8 4c8bc8                         mov        r9, rax
01fbb 4489ac2464020000               mov        dword ptr [rsp + 0x264], r13d
01fc3 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
01fc8 4c89442408                     mov        qword ptr [rsp + 8], r8
01fcd 48890c24                       mov        qword ptr [rsp], rcx
01fd1 4889542418                     mov        qword ptr [rsp + 0x18], rdx
01fd6 4889742420                     mov        qword ptr [rsp + 0x20], rsi
01fdb 488bfe                         mov        rdi, rsi
01fde 488bf2                         mov        rsi, rdx
01fe1 488bd1                         mov        rdx, rcx
01fe4 498bc8                         mov        rcx, r8
01fe7 4d8bc1                         mov        r8, r9
01fea e851bd5007                     call       0x7fd1c38fe840
01fef 85c0                           test       eax, eax
01ff1 0f842b000000                   je         0x7fd1bc3f2b22
01ff7 488bf8                         mov        rdi, rax
01ffa 83f7ff                         xor        edi, 0xffffffff
01ffd 488b0c24                       mov        rcx, qword ptr [rsp]
02001 4c8b442408                     mov        r8, qword ptr [rsp + 8]
02006 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
0200b 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
02010 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
02015 442bcf                         sub        r9d, edi
02018 03d7                           add        edx, edi
0201a 4403c7                         add        r8d, edi
0201d e94f2e0000                     jmp        0x7fd1bc3f5971
02022 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
0202c ff8270060000                   inc        dword ptr [rdx + 0x670]
02032 e983050000                     jmp        0x7fd1bc3f30ba
02037 4489ac2464020000               mov        dword ptr [rsp + 0x264], r13d
0203f 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
02047 4403ac2410020000               add        r13d, dword ptr [rsp + 0x210]
0204f 4489ac2474020000               mov        dword ptr [rsp + 0x274], r13d
02057 8bbc2464020000                 mov        edi, dword ptr [rsp + 0x264]
0205e 6690                           nop        
02060 89bc246c020000                 mov        dword ptr [rsp + 0x26c], edi
02067 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
0206f 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
02079 4883828806000001               add        qword ptr [rdx + 0x688], 1
02081 48ba102e105a00000000           movabs     rdx, 0x5a102e10
0208b 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0208e 83c102                         add        ecx, 2
02091 894a70                         mov        dword ptr [rdx + 0x70], ecx
02094 81e1feff1f00                   and        ecx, 0x1ffffe
0209a 85c9                           test       ecx, ecx
0209c 0f84df2d0000                   je         0x7fd1bc3f5981
020a2 48ba102e105a00000000           movabs     rdx, 0x5a102e10
020ac 488d92d8000000                 lea        rdx, [rdx + 0xd8]
020b3 4885c0                         test       rax, rax
020b6 750c                           jne        0x7fd1bc3f2bc4
020b8 f6420801                       test       byte ptr [rdx + 8], 1
020bc 7506                           jne        0x7fd1bc3f2bc4
020be f048834a0801                   lock or    qword ptr [rdx + 8], 1
020c4 48ba884b62b4d17f0000           movabs     rdx, 0x7fd1b4624b88
020ce 488d9240030000                 lea        rdx, [rdx + 0x340]
020d5 4885c0                         test       rax, rax
020d8 750e                           jne        0x7fd1bc3f2be8
020da f6421001                       test       byte ptr [rdx + 0x10], 1
020de 7536                           jne        0x7fd1bc3f2c16
020e0 f048834a1001                   lock or    qword ptr [rdx + 0x10], 1
020e6 eb2e                           jmp        0x7fd1bc3f2c16
020e8 488b08                         mov        rcx, qword ptr [rax]
020eb 48c1e92a                       shr        rcx, 0x2a
020ef 48c1e109                       shl        rcx, 9
020f3 41ba0000005a                   mov        r10d, 0x5a000000
020f9 4903ca                         add        rcx, r10
020fc 4c8bd1                         mov        r10, rcx
020ff 48334a10                       xor        rcx, qword ptr [rdx + 0x10]
02103 48f7c1fcffffff                 test       rcx, -4
0210a 740a                           je         0x7fd1bc3f2c16
0210c f6c102                         test       cl, 2
0210f 7505                           jne        0x7fd1bc3f2c16
02111 48834a1002                     or         qword ptr [rdx + 0x10], 2
02116 48ba102e105a00000000           movabs     rdx, 0x5a102e10
02120 488382a800000001               add        qword ptr [rdx + 0xa8], 1
02128 48ba884b62b4d17f0000           movabs     rdx, 0x7fd1b4624b88
02132 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02135 83c102                         add        ecx, 2
02138 894a70                         mov        dword ptr [rdx + 0x70], ecx
0213b 81e1feff1f00                   and        ecx, 0x1ffffe
02141 85c9                           test       ecx, ecx
02143 0f84592d0000                   je         0x7fd1bc3f59a2
02149 48ba501d7ae200000000           movabs     rdx, 0xe27a1d50
02153 48b9884b62b4d17f0000           movabs     rcx, 0x7fd1b4624b88
0215d 488b12                         mov        rdx, qword ptr [rdx]
02160 48c1ea2a                       shr        rdx, 0x2a
02164 48c1e209                       shl        rdx, 9
02168 41ba0000005a                   mov        r10d, 0x5a000000
0216e 4903d2                         add        rdx, r10
02171 41ba16000000                   mov        r10d, 0x16
02177 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0217b 7435                           je         0x7fd1bc3f2cb2
0217d 4983c202                       add        r10, 2
02181 4983fa1a                       cmp        r10, 0x1a
02185 75f0                           jne        0x7fd1bc3f2c77
02187 41ba16000000                   mov        r10d, 0x16
0218d 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02192 7412                           je         0x7fd1bc3f2ca6
02194 4983c202                       add        r10, 2
02198 4983fa1a                       cmp        r10, 0x1a
0219c 75ef                           jne        0x7fd1bc3f2c8d
0219e 41ba15000000                   mov        r10d, 0x15
021a4 eb10                           jmp        0x7fd1bc3f2cb6
021a6 50                             push       rax
021a7 4833c0                         xor        rax, rax
021aa 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
021af 58                             pop        rax
021b0 ebbf                           jmp        0x7fd1bc3f2c71
021b2 4983c201                       add        r10, 1
021b6 4a8304d101                     add        qword ptr [rcx + r10*8], 1
021bb 48ba18740c5a00000000           movabs     rdx, 0x5a0c7418
021c5 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
021c8 83c102                         add        ecx, 2
021cb 894a70                         mov        dword ptr [rdx + 0x70], ecx
021ce 81e1feff1f00                   and        ecx, 0x1ffffe
021d4 85c9                           test       ecx, ecx
021d6 0f84e72c0000                   je         0x7fd1bc3f59c3
021dc 48ba18740c5a00000000           movabs     rdx, 0x5a0c7418
021e6 ff82a8000000                   inc        dword ptr [rdx + 0xa8]
021ec 48ba884b62b4d17f0000           movabs     rdx, 0x7fd1b4624b88
021f6 ff8200010000                   inc        dword ptr [rdx + 0x100]
021fc 48ba884b62b4d17f0000           movabs     rdx, 0x7fd1b4624b88
02206 ff8220010000                   inc        dword ptr [rdx + 0x120]
0220c 48ba00157ae200000000           movabs     rdx, 0xe27a1500
02216 48b9884b62b4d17f0000           movabs     rcx, 0x7fd1b4624b88
02220 488b12                         mov        rdx, qword ptr [rdx]
02223 48c1ea2a                       shr        rdx, 0x2a
02227 48c1e209                       shl        rdx, 9
0222b 41ba0000005a                   mov        r10d, 0x5a000000
02231 4903d2                         add        rdx, r10
02234 41ba27000000                   mov        r10d, 0x27
0223a 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0223e 7435                           je         0x7fd1bc3f2d75
02240 4983c202                       add        r10, 2
02244 4983fa2b                       cmp        r10, 0x2b
02248 75f0                           jne        0x7fd1bc3f2d3a
0224a 41ba27000000                   mov        r10d, 0x27
02250 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02255 7412                           je         0x7fd1bc3f2d69
02257 4983c202                       add        r10, 2
0225b 4983fa2b                       cmp        r10, 0x2b
0225f 75ef                           jne        0x7fd1bc3f2d50
02261 41ba26000000                   mov        r10d, 0x26
02267 eb10                           jmp        0x7fd1bc3f2d79
02269 50                             push       rax
0226a 4833c0                         xor        rax, rax
0226d 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
02272 58                             pop        rax
02273 ebbf                           jmp        0x7fd1bc3f2d34
02275 4983c201                       add        r10, 1
02279 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0227e 48ba184962b4d17f0000           movabs     rdx, 0x7fd1b4624918
02288 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0228b 83c102                         add        ecx, 2
0228e 894a70                         mov        dword ptr [rdx + 0x70], ecx
02291 81e1feff1f00                   and        ecx, 0x1ffffe
02297 85c9                           test       ecx, ecx
02299 0f84452c0000                   je         0x7fd1bc3f59e4
0229f 48ba184962b4d17f0000           movabs     rdx, 0x7fd1b4624918
022a9 ff82a8000000                   inc        dword ptr [rdx + 0xa8]
022af 48ba884b62b4d17f0000           movabs     rdx, 0x7fd1b4624b88
022b9 488d9280010000                 lea        rdx, [rdx + 0x180]
022c0 4885c0                         test       rax, rax
022c3 750e                           jne        0x7fd1bc3f2dd3
022c5 f6421801                       test       byte ptr [rdx + 0x18], 1
022c9 7536                           jne        0x7fd1bc3f2e01
022cb f048834a1801                   lock or    qword ptr [rdx + 0x18], 1
022d1 eb2e                           jmp        0x7fd1bc3f2e01
022d3 488b08                         mov        rcx, qword ptr [rax]
022d6 48c1e92a                       shr        rcx, 0x2a
022da 48c1e109                       shl        rcx, 9
022de 41ba0000005a                   mov        r10d, 0x5a000000
022e4 4903ca                         add        rcx, r10
022e7 4c8bd1                         mov        r10, rcx
022ea 48334a18                       xor        rcx, qword ptr [rdx + 0x18]
022ee 48f7c1fcffffff                 test       rcx, -4
022f5 740a                           je         0x7fd1bc3f2e01
022f7 f6c102                         test       cl, 2
022fa 7505                           jne        0x7fd1bc3f2e01
022fc 48834a1802                     or         qword ptr [rdx + 0x18], 2
02301 48ba884b62b4d17f0000           movabs     rdx, 0x7fd1b4624b88
0230b 4883827001000001               add        qword ptr [rdx + 0x170], 1
02313 48bae04e62b4d17f0000           movabs     rdx, 0x7fd1b4624ee0
0231d 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02320 83c102                         add        ecx, 2
02323 894a70                         mov        dword ptr [rdx + 0x70], ecx
02326 81e1feff1f00                   and        ecx, 0x1ffffe
0232c 85c9                           test       ecx, ecx
0232e 0f84d12b0000                   je         0x7fd1bc3f5a05
02334 4885c0                         test       rax, rax
02337 49b8e04e62b4d17f0000           movabs     r8, 0x7fd1b4624ee0
02341 750d                           jne        0x7fd1bc3f2e50
02343 418088d100000001               or         byte ptr [r8 + 0xd1], 1
0234b e98b000000                     jmp        0x7fd1bc3f2edb
02350 488b30                         mov        rsi, qword ptr [rax]
02353 48c1ee2a                       shr        rsi, 0x2a
02357 48c1e609                       shl        rsi, 9
0235b 41ba0000005a                   mov        r10d, 0x5a000000
02361 4903f2                         add        rsi, r10
02364 41ba1c000000                   mov        r10d, 0x1c
0236a 4b3b34d0                       cmp        rsi, qword ptr [r8 + r10*8]
0236e 7435                           je         0x7fd1bc3f2ea5
02370 4983c202                       add        r10, 2
02374 4983fa20                       cmp        r10, 0x20
02378 75f0                           jne        0x7fd1bc3f2e6a
0237a 41ba1c000000                   mov        r10d, 0x1c
02380 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
02385 7412                           je         0x7fd1bc3f2e99
02387 4983c202                       add        r10, 2
0238b 4983fa20                       cmp        r10, 0x20
0238f 75ef                           jne        0x7fd1bc3f2e80
02391 41ba1b000000                   mov        r10d, 0x1b
02397 eb10                           jmp        0x7fd1bc3f2ea9
02399 50                             push       rax
0239a 4833c0                         xor        rax, rax
0239d 4b0fb134d0                     cmpxchg    qword ptr [r8 + r10*8], rsi
023a2 58                             pop        rax
023a3 ebbf                           jmp        0x7fd1bc3f2e64
023a5 4983c201                       add        r10, 1
023a9 4b8304d001                     add        qword ptr [r8 + r10*8], 1
023ae 48be000a045a00000000           movabs     rsi, 0x5a040a00
023b8 4c8b00                         mov        r8, qword ptr [rax]
023bb 49c1e82a                       shr        r8, 0x2a
023bf 49c1e009                       shl        r8, 9
023c3 41ba0000005a                   mov        r10d, 0x5a000000
023c9 4d03c2                         add        r8, r10
023cc 493b7038                       cmp        rsi, qword ptr [r8 + 0x38]
023d0 0f85502b0000                   jne        0x7fd1bc3f5a26
023d6 e900000000                     jmp        0x7fd1bc3f2edb
023db 488bd0                         mov        rdx, rax
023de 48b9e04e62b4d17f0000           movabs     rcx, 0x7fd1b4624ee0
023e8 4883810801000001               add        qword ptr [rcx + 0x108], 1
023f0 48b9905062b4d17f0000           movabs     rcx, 0x7fd1b4625090
023fa 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
023fe 4183c002                       add        r8d, 2
02402 44894170                       mov        dword ptr [rcx + 0x70], r8d
02406 4181e0feff1f00                 and        r8d, 0x1ffffe
0240d 4585c0                         test       r8d, r8d
02410 0f84192b0000                   je         0x7fd1bc3f5a2f
02416 8b4a08                         mov        ecx, dword ptr [rdx + 8]
02419 49b8905062b4d17f0000           movabs     r8, 0x7fd1b4625090
02423 498380a800000001               add        qword ptr [r8 + 0xa8], 1
0242b 83e907                         sub        ecx, 7
0242e 49b8801d23e200000000           movabs     r8, 0xe2231d80
02438 41b800000000                   mov        r8d, 0
0243e 413bd8                         cmp        ebx, r8d
02441 0f8c0e2b0000                   jl         0x7fd1bc3f5a55
02447 3bd9                           cmp        ebx, ecx
02449 0f8d132b0000                   jge        0x7fd1bc3f5a62
0244f 488bcb                         mov        rcx, rbx
02452 48be00b722e200000000           movabs     rsi, 0xe222b700
0245c 4c8bc6                         mov        r8, rsi
0245f 49b9e04e62b4d17f0000           movabs     r9, 0x7fd1b4624ee0
02469 4d8b00                         mov        r8, qword ptr [r8]
0246c 49c1e82a                       shr        r8, 0x2a
02470 49c1e009                       shl        r8, 9
02474 41ba0000005a                   mov        r10d, 0x5a000000
0247a 4d03c2                         add        r8, r10
0247d 41ba24000000                   mov        r10d, 0x24
02483 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
02487 7435                           je         0x7fd1bc3f2fbe
02489 4983c202                       add        r10, 2
0248d 4983fa28                       cmp        r10, 0x28
02491 75f0                           jne        0x7fd1bc3f2f83
02493 41ba24000000                   mov        r10d, 0x24
02499 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
0249e 7412                           je         0x7fd1bc3f2fb2
024a0 4983c202                       add        r10, 2
024a4 4983fa28                       cmp        r10, 0x28
024a8 75ef                           jne        0x7fd1bc3f2f99
024aa 41ba23000000                   mov        r10d, 0x23
024b0 eb10                           jmp        0x7fd1bc3f2fc2
024b2 50                             push       rax
024b3 4833c0                         xor        rax, rax
024b6 4f0fb104d1                     cmpxchg    qword ptr [r9 + r10*8], r8
024bb 58                             pop        rax
024bc ebbf                           jmp        0x7fd1bc3f2f7d
024be 4983c201                       add        r10, 1
024c2 4b8304d101                     add        qword ptr [r9 + r10*8], 1
024c7 4863c9                         movsxd     rcx, ecx
024ca 41ba0c000000                   mov        r10d, 0xc
024d0 4903ca                         add        rcx, r10
024d3 41b800000000                   mov        r8d, 0
024d9 899c2470020000                 mov        dword ptr [rsp + 0x270], ebx
024e0 4889842400020000               mov        qword ptr [rsp + 0x200], rax
024e8 0f1f8000000000                 nop        dword ptr [rax]
024ef e86cce5107                     call       0x7fd1c390fe60
024f4 0f1f8400ec25000b               nop        dword ptr [rax + rax + 0xb0025ec]
024fc 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
02506 4883869806000001               add        qword ptr [rsi + 0x698], 1
0250e 488bb42400020000               mov        rsi, qword ptr [rsp + 0x200]
02516 8b94246c020000                 mov        edx, dword ptr [rsp + 0x26c]
0251d 488bc8                         mov        rcx, rax
02520 0f1f8000000000                 nop        dword ptr [rax]
02527 e834d85107                     call       0x7fd1c3910860
0252c 0f1f84002426000c               nop        dword ptr [rax + rax + 0xc002624]
02534 8bbc246c020000                 mov        edi, dword ptr [rsp + 0x26c]
0253b 83c708                         add        edi, 8
0253e 8b9c2470020000                 mov        ebx, dword ptr [rsp + 0x270]
02545 83c308                         add        ebx, 8
02548 3bbc2474020000                 cmp        edi, dword ptr [rsp + 0x274]
0254f be02000000                     mov        esi, 2
02554 7c05                           jl         0x7fd1bc3f305b
02556 be00000000                     mov        esi, 0
0255b 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
02565 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
02568 03ce                           add        ecx, esi
0256a 894a74                         mov        dword ptr [rdx + 0x74], ecx
0256d 85f6                           test       esi, esi
0256f 7505                           jne        0x7fd1bc3f3076
02571 b902000000                     mov        ecx, 2
02576 81e1fe3f0000                   and        ecx, 0x3ffe
0257c 85c9                           test       ecx, ecx
0257e 0f84eb290000                   je         0x7fd1bc3f5a6f
02584 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02588 418502                         test       dword ptr [r10], eax
0258b 3bbc2474020000                 cmp        edi, dword ptr [rsp + 0x274]
02592 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
0259c baa8060000                     mov        edx, 0x6a8
025a1 7c05                           jl         0x7fd1bc3f30a8
025a3 bab8060000                     mov        edx, 0x6b8
025a8 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
025ac 488d4901                       lea        rcx, [rcx + 1]
025b0 48890c16                       mov        qword ptr [rsi + rdx], rcx
025b4 0f8ca6faffff                   jl         0x7fd1bc3f2b60
025ba 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
025c2 4403ac2410020000               add        r13d, dword ptr [rsp + 0x210]
025ca 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
025d4 ff86c8060000                   inc        dword ptr [rsi + 0x6c8]
025da e96f1b0000                     jmp        0x7fd1bc3f4c4e
025df 89bc2468020000                 mov        dword ptr [rsp + 0x268], edi
025e6 4489ac2464020000               mov        dword ptr [rsp + 0x264], r13d
025ee 4183fb10                       cmp        r11d, 0x10
025f2 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
025fc bae0060000                     mov        edx, 0x6e0
02601 7c05                           jl         0x7fd1bc3f3108
02603 baf0060000                     mov        edx, 0x6f0
02608 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0260c 488d4901                       lea        rcx, [rcx + 1]
02610 48890c16                       mov        qword ptr [rsi + rdx], rcx
02614 0f8cfb0a0000                   jl         0x7fd1bc3f3c15
0261a 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
02622 4403ac2410020000               add        r13d, dword ptr [rsp + 0x210]
0262a 4489ac2484020000               mov        dword ptr [rsp + 0x284], r13d
02632 8b842464020000                 mov        eax, dword ptr [rsp + 0x264]
02639 0f1f8000000000                 nop        dword ptr [rax]
02640 89842478020000                 mov        dword ptr [rsp + 0x278], eax
02647 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
0264f 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
02659 4883860007000001               add        qword ptr [rsi + 0x700], 1
02661 48bea83e79b4d17f0000           movabs     rsi, 0x7fd1b4793ea8
0266b 8b5670                         mov        edx, dword ptr [rsi + 0x70]
0266e 83c202                         add        edx, 2
02671 895670                         mov        dword ptr [rsi + 0x70], edx
02674 81e2feff1f00                   and        edx, 0x1ffffe
0267a 85d2                           test       edx, edx
0267c 0f840e290000                   je         0x7fd1bc3f5a90
02682 48bed82f84e200000000           movabs     rsi, 0xe2842fd8
0268c 48baa83e79b4d17f0000           movabs     rdx, 0x7fd1b4793ea8
02696 488b36                         mov        rsi, qword ptr [rsi]
02699 48c1ee2a                       shr        rsi, 0x2a
0269d 48c1e609                       shl        rsi, 9
026a1 41ba0000005a                   mov        r10d, 0x5a000000
026a7 4903f2                         add        rsi, r10
026aa 41ba16000000                   mov        r10d, 0x16
026b0 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
026b4 7435                           je         0x7fd1bc3f31eb
026b6 4983c202                       add        r10, 2
026ba 4983fa1a                       cmp        r10, 0x1a
026be 75f0                           jne        0x7fd1bc3f31b0
026c0 41ba16000000                   mov        r10d, 0x16
026c6 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
026cb 7412                           je         0x7fd1bc3f31df
026cd 4983c202                       add        r10, 2
026d1 4983fa1a                       cmp        r10, 0x1a
026d5 75ef                           jne        0x7fd1bc3f31c6
026d7 41ba15000000                   mov        r10d, 0x15
026dd eb10                           jmp        0x7fd1bc3f31ef
026df 50                             push       rax
026e0 4833c0                         xor        rax, rax
026e3 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
026e8 58                             pop        rax
026e9 ebbf                           jmp        0x7fd1bc3f31aa
026eb 4983c201                       add        r10, 1
026ef 4a8304d201                     add        qword ptr [rdx + r10*8], 1
026f4 448b7008                       mov        r14d, dword ptr [rax + 8]
026f8 48bea83e79b4d17f0000           movabs     rsi, 0x7fd1b4793ea8
02702 488386d800000001               add        qword ptr [rsi + 0xd8], 1
0270a 48be003579b4d17f0000           movabs     rsi, 0x7fd1b4793500
02714 8b5670                         mov        edx, dword ptr [rsi + 0x70]
02717 83c202                         add        edx, 2
0271a 895670                         mov        dword ptr [rsi + 0x70], edx
0271d 81e2feff1f00                   and        edx, 0x1ffffe
02723 85d2                           test       edx, edx
02725 0f848b280000                   je         0x7fd1bc3f5ab6
0272b 48be003579b4d17f0000           movabs     rsi, 0x7fd1b4793500
02735 4883860801000001               add        qword ptr [rsi + 0x108], 1
0273d 498bf6                         mov        rsi, r14
02740 83ee0f                         sub        esi, 0xf
02743 48bad02b79b4d17f0000           movabs     rdx, 0x7fd1b4792bd0
0274d 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02750 83c102                         add        ecx, 2
02753 894a70                         mov        dword ptr [rdx + 0x70], ecx
02756 81e1feff1f00                   and        ecx, 0x1ffffe
0275c 85c9                           test       ecx, ecx
0275e 0f8473280000                   je         0x7fd1bc3f5ad7
02764 48bad02b79b4d17f0000           movabs     rdx, 0x7fd1b4792bd0
0276e 488382a800000001               add        qword ptr [rdx + 0xa8], 1
02776 48ba0000000000000000           movabs     rdx, 0
02780 ba00000000                     mov        edx, 0
02785 3bda                           cmp        ebx, edx
02787 0f8c6b280000                   jl         0x7fd1bc3f5af8
0278d 3bde                           cmp        ebx, esi
0278f 0f8d70280000                   jge        0x7fd1bc3f5b05
02795 488bf3                         mov        rsi, rbx
02798 48bad82f84e200000000           movabs     rdx, 0xe2842fd8
027a2 488bca                         mov        rcx, rdx
027a5 49b8a83e79b4d17f0000           movabs     r8, 0x7fd1b4793ea8
027af 488b09                         mov        rcx, qword ptr [rcx]
027b2 48c1e92a                       shr        rcx, 0x2a
027b6 48c1e109                       shl        rcx, 9
027ba 41ba0000005a                   mov        r10d, 0x5a000000
027c0 4903ca                         add        rcx, r10
027c3 41ba24000000                   mov        r10d, 0x24
027c9 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
027cd 7435                           je         0x7fd1bc3f3304
027cf 4983c202                       add        r10, 2
027d3 4983fa28                       cmp        r10, 0x28
027d7 75f0                           jne        0x7fd1bc3f32c9
027d9 41ba24000000                   mov        r10d, 0x24
027df 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
027e4 7412                           je         0x7fd1bc3f32f8
027e6 4983c202                       add        r10, 2
027ea 4983fa28                       cmp        r10, 0x28
027ee 75ef                           jne        0x7fd1bc3f32df
027f0 41ba23000000                   mov        r10d, 0x23
027f6 eb10                           jmp        0x7fd1bc3f3308
027f8 50                             push       rax
027f9 4833c0                         xor        rax, rax
027fc 4b0fb10cd0                     cmpxchg    qword ptr [r8 + r10*8], rcx
02801 58                             pop        rax
02802 ebbf                           jmp        0x7fd1bc3f32c3
02804 4983c201                       add        r10, 1
02808 4b8304d001                     add        qword ptr [r8 + r10*8], 1
0280d 48b9d02c79b4d17f0000           movabs     rcx, 0x7fd1b4792cd0
02817 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
0281b 4183c002                       add        r8d, 2
0281f 44894170                       mov        dword ptr [rcx + 0x70], r8d
02823 4181e0feff1f00                 and        r8d, 0x1ffffe
0282a 4585c0                         test       r8d, r8d
0282d 0f84df270000                   je         0x7fd1bc3f5b12
02833 48b9d02c79b4d17f0000           movabs     rcx, 0x7fd1b4792cd0
0283d 488381a800000001               add        qword ptr [rcx + 0xa8], 1
02845 48baf82d79b4d17f0000           movabs     rdx, 0x7fd1b4792df8
0284f 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02852 83c102                         add        ecx, 2
02855 894a70                         mov        dword ptr [rdx + 0x70], ecx
02858 81e1feff1f00                   and        ecx, 0x1ffffe
0285e 85c9                           test       ecx, ecx
02860 0f84cd270000                   je         0x7fd1bc3f5b33
02866 48baf82d79b4d17f0000           movabs     rdx, 0x7fd1b4792df8
02870 ff82b8000000                   inc        dword ptr [rdx + 0xb8]
02876 4489b4247c020000               mov        dword ptr [rsp + 0x27c], r14d
0287e 899c2480020000                 mov        dword ptr [rsp + 0x280], ebx
02885 48bad0fa85e200000000           movabs     rdx, 0xe285fad0
0288f 488bca                         mov        rcx, rdx
02892 49b8a83e79b4d17f0000           movabs     r8, 0x7fd1b4793ea8
0289c 4983805801000001               add        qword ptr [r8 + 0x158], 1
028a4 48b9704079b4d17f0000           movabs     rcx, 0x7fd1b4794070
028ae 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
028b2 4183c002                       add        r8d, 2
028b6 44894170                       mov        dword ptr [rcx + 0x70], r8d
028ba 4181e0feff1f00                 and        r8d, 0x1ffffe
028c1 4585c0                         test       r8d, r8d
028c4 0f848a270000                   je         0x7fd1bc3f5b54
028ca 488bca                         mov        rcx, rdx
028cd 49b8704079b4d17f0000           movabs     r8, 0x7fd1b4794070
028d7 498380a800000001               add        qword ptr [r8 + 0xa8], 1
028df 48b9504179b4d17f0000           movabs     rcx, 0x7fd1b4794150
028e9 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
028ed 4183c002                       add        r8d, 2
028f1 44894170                       mov        dword ptr [rcx + 0x70], r8d
028f5 4181e0feff1f00                 and        r8d, 0x1ffffe
028fc 4585c0                         test       r8d, r8d
028ff 0f8470270000                   je         0x7fd1bc3f5b75
02905 48b9504179b4d17f0000           movabs     rcx, 0x7fd1b4794150
0290f 488381b800000001               add        qword ptr [rcx + 0xb8], 1
02917 48ba783679b4d17f0000           movabs     rdx, 0x7fd1b4793678
02921 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02924 83c102                         add        ecx, 2
02927 894a70                         mov        dword ptr [rdx + 0x70], ecx
0292a 81e1feff1f00                   and        ecx, 0x1ffffe
02930 85c9                           test       ecx, ecx
02932 0f845e270000                   je         0x7fd1bc3f5b96
02938 48bad82f84e200000000           movabs     rdx, 0xe2842fd8
02942 488bca                         mov        rcx, rdx
02945 49b8504179b4d17f0000           movabs     r8, 0x7fd1b4794150
0294f 488b09                         mov        rcx, qword ptr [rcx]
02952 48c1e92a                       shr        rcx, 0x2a
02956 48c1e109                       shl        rcx, 9
0295a 41ba0000005a                   mov        r10d, 0x5a000000
02960 4903ca                         add        rcx, r10
02963 41ba1c000000                   mov        r10d, 0x1c
02969 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0296d 7435                           je         0x7fd1bc3f34a4
0296f 4983c202                       add        r10, 2
02973 4983fa20                       cmp        r10, 0x20
02977 75f0                           jne        0x7fd1bc3f3469
02979 41ba1c000000                   mov        r10d, 0x1c
0297f 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
02984 7412                           je         0x7fd1bc3f3498
02986 4983c202                       add        r10, 2
0298a 4983fa20                       cmp        r10, 0x20
0298e 75ef                           jne        0x7fd1bc3f347f
02990 41ba1b000000                   mov        r10d, 0x1b
02996 eb10                           jmp        0x7fd1bc3f34a8
02998 50                             push       rax
02999 4833c0                         xor        rax, rax
0299c 4b0fb10cd0                     cmpxchg    qword ptr [r8 + r10*8], rcx
029a1 58                             pop        rax
029a2 ebbf                           jmp        0x7fd1bc3f3463
029a4 4983c201                       add        r10, 1
029a8 4b8304d001                     add        qword ptr [r8 + r10*8], 1
029ad 48b9504179b4d17f0000           movabs     rcx, 0x7fd1b4794150
029b7 488b12                         mov        rdx, qword ptr [rdx]
029ba 48c1ea2a                       shr        rdx, 0x2a
029be 48c1e209                       shl        rdx, 9
029c2 41ba0000005a                   mov        r10d, 0x5a000000
029c8 4903d2                         add        rdx, r10
029cb 41ba22000000                   mov        r10d, 0x22
029d1 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
029d5 7435                           je         0x7fd1bc3f350c
029d7 4983c202                       add        r10, 2
029db 4983fa26                       cmp        r10, 0x26
029df 75f0                           jne        0x7fd1bc3f34d1
029e1 41ba22000000                   mov        r10d, 0x22
029e7 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
029ec 7412                           je         0x7fd1bc3f3500
029ee 4983c202                       add        r10, 2
029f2 4983fa26                       cmp        r10, 0x26
029f6 75ef                           jne        0x7fd1bc3f34e7
029f8 41ba21000000                   mov        r10d, 0x21
029fe eb10                           jmp        0x7fd1bc3f3510
02a00 50                             push       rax
02a01 4833c0                         xor        rax, rax
02a04 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
02a09 58                             pop        rax
02a0a ebbf                           jmp        0x7fd1bc3f34cb
02a0c 4983c201                       add        r10, 1
02a10 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02a15 48ba504179b4d17f0000           movabs     rdx, 0x7fd1b4794150
02a1f 4883823801000001               add        qword ptr [rdx + 0x138], 1
02a27 48ba383779b4d17f0000           movabs     rdx, 0x7fd1b4793738
02a31 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02a34 83c102                         add        ecx, 2
02a37 894a70                         mov        dword ptr [rdx + 0x70], ecx
02a3a 81e1feff1f00                   and        ecx, 0x1ffffe
02a40 85c9                           test       ecx, ecx
02a42 0f846f260000                   je         0x7fd1bc3f5bb7
02a48 48ba504179b4d17f0000           movabs     rdx, 0x7fd1b4794150
02a52 4883824801000001               add        qword ptr [rdx + 0x148], 1
02a5a 4863f6                         movsxd     rsi, esi
02a5d ba0c000000                     mov        edx, 0xc
02a62 4c8bce                         mov        r9, rsi
02a65 4c03ca                         add        r9, rdx
02a68 48ba202979b4d17f0000           movabs     rdx, 0x7fd1b4792920
02a72 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02a75 83c102                         add        ecx, 2
02a78 894a70                         mov        dword ptr [rdx + 0x70], ecx
02a7b 81e1feff1f00                   and        ecx, 0x1ffffe
02a81 85c9                           test       ecx, ecx
02a83 0f844f260000                   je         0x7fd1bc3f5bd8
02a89 48ba202979b4d17f0000           movabs     rdx, 0x7fd1b4792920
02a93 488382d800000001               add        qword ptr [rdx + 0xd8], 1
02a9b 48ba982a79b4d17f0000           movabs     rdx, 0x7fd1b4792a98
02aa5 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
02aa8 83c102                         add        ecx, 2
02aab 894a70                         mov        dword ptr [rdx + 0x70], ecx
02aae 81e1feff1f00                   and        ecx, 0x1ffffe
02ab4 85c9                           test       ecx, ecx
02ab6 0f843d260000                   je         0x7fd1bc3f5bf9
02abc 48ba504179b4d17f0000           movabs     rdx, 0x7fd1b4794150
02ac6 4883826801000001               add        qword ptr [rdx + 0x168], 1
02ace 48baa0f586e200000000           movabs     rdx, 0xe286f5a0
02ad8 488bfe                         mov        rdi, rsi
02adb 48be203084e200000000           movabs     rsi, 0xe2843020
02ae5 ba02000000                     mov        edx, 2
02aea b910000000                     mov        ecx, 0x10
02aef 4c8bc0                         mov        r8, rax
02af2 488bdf                         mov        rbx, rdi
02af5 bf00000000                     mov        edi, 0
02afa 48890424                       mov        qword ptr [rsp], rax
02afe 48895c2408                     mov        qword ptr [rsp + 8], rbx
02b03 49bad82f84e200000000           movabs     r10, 0xe2842fd8
02b0d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02b12 49baa0f586e200000000           movabs     r10, 0xe286f5a0
02b1c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02b21 4889842400020000               mov        qword ptr [rsp + 0x200], rax
02b29 660f1f440000                   nop        word ptr [rax + rax]
02b2f e82cd25107                     call       0x7fd1c3910860
02b34 0f1f84002c2c000e               nop        dword ptr [rax + rax + 0xe002c2c]
02b3c 4885c0                         test       rax, rax
02b3f 48bb504179b4d17f0000           movabs     rbx, 0x7fd1b4794150
02b49 750c                           jne        0x7fd1bc3f3657
02b4b 808b7101000001                 or         byte ptr [rbx + 0x171], 1
02b52 e98b000000                     jmp        0x7fd1bc3f36e2
02b57 488b38                         mov        rdi, qword ptr [rax]
02b5a 48c1ef2a                       shr        rdi, 0x2a
02b5e 48c1e709                       shl        rdi, 9
02b62 41ba0000005a                   mov        r10d, 0x5a000000
02b68 4903fa                         add        rdi, r10
02b6b 41ba30000000                   mov        r10d, 0x30
02b71 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
02b75 7435                           je         0x7fd1bc3f36ac
02b77 4983c202                       add        r10, 2
02b7b 4983fa34                       cmp        r10, 0x34
02b7f 75f0                           jne        0x7fd1bc3f3671
02b81 41ba30000000                   mov        r10d, 0x30
02b87 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02b8c 7412                           je         0x7fd1bc3f36a0
02b8e 4983c202                       add        r10, 2
02b92 4983fa34                       cmp        r10, 0x34
02b96 75ef                           jne        0x7fd1bc3f3687
02b98 41ba2f000000                   mov        r10d, 0x2f
02b9e eb10                           jmp        0x7fd1bc3f36b0
02ba0 50                             push       rax
02ba1 4833c0                         xor        rax, rax
02ba4 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
02ba9 58                             pop        rax
02baa ebbf                           jmp        0x7fd1bc3f366b
02bac 4983c201                       add        r10, 1
02bb0 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02bb5 48bf0006145a00000000           movabs     rdi, 0x5a140600
02bbf 488b18                         mov        rbx, qword ptr [rax]
02bc2 48c1eb2a                       shr        rbx, 0x2a
02bc6 48c1e309                       shl        rbx, 9
02bca 41ba0000005a                   mov        r10d, 0x5a000000
02bd0 4903da                         add        rbx, r10
02bd3 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
02bd7 0f853d250000                   jne        0x7fd1bc3f5c1a
02bdd e900000000                     jmp        0x7fd1bc3f36e2
02be2 488bf8                         mov        rdi, rax
02be5 4889bc2488020000               mov        qword ptr [rsp + 0x288], rdi
02bed 483b07                         cmp        rax, qword ptr [rdi]
02bf0 488bf7                         mov        rsi, rdi
02bf3 48bbe86872b4d17f0000           movabs     rbx, 0x7fd1b47268e8
02bfd 488b36                         mov        rsi, qword ptr [rsi]
02c00 48c1ee2a                       shr        rsi, 0x2a
02c04 48c1e609                       shl        rsi, 9
02c08 41ba0000005a                   mov        r10d, 0x5a000000
02c0e 4903f2                         add        rsi, r10
02c11 41bae3000000                   mov        r10d, 0xe3
02c17 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02c1b 743b                           je         0x7fd1bc3f3758
02c1d 4983c202                       add        r10, 2
02c21 4981fae7000000                 cmp        r10, 0xe7
02c28 75ed                           jne        0x7fd1bc3f3717
02c2a 41bae3000000                   mov        r10d, 0xe3
02c30 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02c35 7415                           je         0x7fd1bc3f374c
02c37 4983c202                       add        r10, 2
02c3b 4981fae7000000                 cmp        r10, 0xe7
02c42 75ec                           jne        0x7fd1bc3f3730
02c44 41bae2000000                   mov        r10d, 0xe2
02c4a eb10                           jmp        0x7fd1bc3f375c
02c4c 50                             push       rax
02c4d 4833c0                         xor        rax, rax
02c50 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
02c55 58                             pop        rax
02c56 ebb9                           jmp        0x7fd1bc3f3711
02c58 4983c201                       add        r10, 1
02c5c 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02c61 48be684b79b4d17f0000           movabs     rsi, 0x7fd1b4794b68
02c6b 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
02c6e 83c302                         add        ebx, 2
02c71 895e70                         mov        dword ptr [rsi + 0x70], ebx
02c74 81e3feff1f00                   and        ebx, 0x1ffffe
02c7a 85db                           test       ebx, ebx
02c7c 0f84a6240000                   je         0x7fd1bc3f5c28
02c82 488bf7                         mov        rsi, rdi
02c85 48bb684b79b4d17f0000           movabs     rbx, 0x7fd1b4794b68
02c8f 488b36                         mov        rsi, qword ptr [rsi]
02c92 48c1ee2a                       shr        rsi, 0x2a
02c96 48c1e609                       shl        rsi, 9
02c9a 41ba0000005a                   mov        r10d, 0x5a000000
02ca0 4903f2                         add        rsi, r10
02ca3 41ba16000000                   mov        r10d, 0x16
02ca9 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02cad 7435                           je         0x7fd1bc3f37e4
02caf 4983c202                       add        r10, 2
02cb3 4983fa1a                       cmp        r10, 0x1a
02cb7 75f0                           jne        0x7fd1bc3f37a9
02cb9 41ba16000000                   mov        r10d, 0x16
02cbf 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02cc4 7412                           je         0x7fd1bc3f37d8
02cc6 4983c202                       add        r10, 2
02cca 4983fa1a                       cmp        r10, 0x1a
02cce 75ef                           jne        0x7fd1bc3f37bf
02cd0 41ba15000000                   mov        r10d, 0x15
02cd6 eb10                           jmp        0x7fd1bc3f37e8
02cd8 50                             push       rax
02cd9 4833c0                         xor        rax, rax
02cdc 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
02ce1 58                             pop        rax
02ce2 ebbf                           jmp        0x7fd1bc3f37a3
02ce4 4983c201                       add        r10, 1
02ce8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02ced 488bf7                         mov        rsi, rdi
02cf0 0f1f440000                     nop        dword ptr [rax + rax]
02cf5 48b880c43998d17f0000           movabs     rax, 0x7fd19839c480
02cff e85ccb5107                     call       0x7fd1c3910360
02d04 0f1f8400fc2d000f               nop        dword ptr [rax + rax + 0xf002dfc]
02d0c 48be684b79b4d17f0000           movabs     rsi, 0x7fd1b4794b68
02d16 488386d800000001               add        qword ptr [rsi + 0xd8], 1
02d1e 48be003579b4d17f0000           movabs     rsi, 0x7fd1b4793500
02d28 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
02d2b 83c702                         add        edi, 2
02d2e 897e70                         mov        dword ptr [rsi + 0x70], edi
02d31 81e7feff1f00                   and        edi, 0x1ffffe
02d37 85ff                           test       edi, edi
02d39 0f840a240000                   je         0x7fd1bc3f5c49
02d3f 448bb4247c020000               mov        r14d, dword ptr [rsp + 0x27c]
02d47 8bbc2478020000                 mov        edi, dword ptr [rsp + 0x278]
02d4e 48be003579b4d17f0000           movabs     rsi, 0x7fd1b4793500
02d58 4883860801000001               add        qword ptr [rsi + 0x108], 1
02d60 ffc8                           dec        eax
02d62 442bf0                         sub        r14d, eax
02d65 48bed02b79b4d17f0000           movabs     rsi, 0x7fd1b4792bd0
02d6f 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
02d72 83c302                         add        ebx, 2
02d75 895e70                         mov        dword ptr [rsi + 0x70], ebx
02d78 81e3feff1f00                   and        ebx, 0x1ffffe
02d7e 85db                           test       ebx, ebx
02d80 0f84e4230000                   je         0x7fd1bc3f5c6a
02d86 48bed02b79b4d17f0000           movabs     rsi, 0x7fd1b4792bd0
02d90 488386a800000001               add        qword ptr [rsi + 0xa8], 1
02d98 48be0000000000000000           movabs     rsi, 0
02da2 be00000000                     mov        esi, 0
02da7 3bfe                           cmp        edi, esi
02da9 0f8cdc230000                   jl         0x7fd1bc3f5c8b
02daf 413bfe                         cmp        edi, r14d
02db2 0f8de0230000                   jge        0x7fd1bc3f5c98
02db8 488bc7                         mov        rax, rdi
02dbb 89842490020000                 mov        dword ptr [rsp + 0x290], eax
02dc2 89bc2478020000                 mov        dword ptr [rsp + 0x278], edi
02dc9 488bbc2488020000               mov        rdi, qword ptr [rsp + 0x288]
02dd1 488bf7                         mov        rsi, rdi
02dd4 48b9684b79b4d17f0000           movabs     rcx, 0x7fd1b4794b68
02dde 488b36                         mov        rsi, qword ptr [rsi]
02de1 48c1ee2a                       shr        rsi, 0x2a
02de5 48c1e609                       shl        rsi, 9
02de9 41ba0000005a                   mov        r10d, 0x5a000000
02def 4903f2                         add        rsi, r10
02df2 41ba1e000000                   mov        r10d, 0x1e
02df8 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
02dfc 7435                           je         0x7fd1bc3f3933
02dfe 4983c202                       add        r10, 2
02e02 4983fa22                       cmp        r10, 0x22
02e06 75f0                           jne        0x7fd1bc3f38f8
02e08 41ba1e000000                   mov        r10d, 0x1e
02e0e 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02e13 7412                           je         0x7fd1bc3f3927
02e15 4983c202                       add        r10, 2
02e19 4983fa22                       cmp        r10, 0x22
02e1d 75ef                           jne        0x7fd1bc3f390e
02e1f 41ba1d000000                   mov        r10d, 0x1d
02e25 eb10                           jmp        0x7fd1bc3f3937
02e27 50                             push       rax
02e28 4833c0                         xor        rax, rax
02e2b 4a0fb134d1                     cmpxchg    qword ptr [rcx + r10*8], rsi
02e30 58                             pop        rax
02e31 ebbf                           jmp        0x7fd1bc3f38f2
02e33 4983c201                       add        r10, 1
02e37 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02e3c 488bf7                         mov        rsi, rdi
02e3f 660f1f440000                   nop        word ptr [rax + rax]
02e45 48b8a8c43998d17f0000           movabs     rax, 0x7fd19839c4a8
02e4f e80cca5107                     call       0x7fd1c3910360
02e54 0f1f84004c2f0010               nop        dword ptr [rax + rax + 0x10002f4c]
02e5c 483b00                         cmp        rax, qword ptr [rax]
02e5f 488bf0                         mov        rsi, rax
02e62 48ba684b79b4d17f0000           movabs     rdx, 0x7fd1b4794b68
02e6c 488b36                         mov        rsi, qword ptr [rsi]
02e6f 48c1ee2a                       shr        rsi, 0x2a
02e73 48c1e609                       shl        rsi, 9
02e77 41ba0000005a                   mov        r10d, 0x5a000000
02e7d 4903f2                         add        rsi, r10
02e80 41ba24000000                   mov        r10d, 0x24
02e86 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02e8a 7435                           je         0x7fd1bc3f39c1
02e8c 4983c202                       add        r10, 2
02e90 4983fa28                       cmp        r10, 0x28
02e94 75f0                           jne        0x7fd1bc3f3986
02e96 41ba24000000                   mov        r10d, 0x24
02e9c 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02ea1 7412                           je         0x7fd1bc3f39b5
02ea3 4983c202                       add        r10, 2
02ea7 4983fa28                       cmp        r10, 0x28
02eab 75ef                           jne        0x7fd1bc3f399c
02ead 41ba23000000                   mov        r10d, 0x23
02eb3 eb10                           jmp        0x7fd1bc3f39c5
02eb5 50                             push       rax
02eb6 4833c0                         xor        rax, rax
02eb9 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
02ebe 58                             pop        rax
02ebf ebbf                           jmp        0x7fd1bc3f3980
02ec1 4983c201                       add        r10, 1
02ec5 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02eca 8b7028                         mov        esi, dword ptr [rax + 0x28]
02ecd 488bd0                         mov        rdx, rax
02ed0 48b9684b79b4d17f0000           movabs     rcx, 0x7fd1b4794b68
02eda 488b12                         mov        rdx, qword ptr [rdx]
02edd 48c1ea2a                       shr        rdx, 0x2a
02ee1 48c1e209                       shl        rdx, 9
02ee5 41ba0000005a                   mov        r10d, 0x5a000000
02eeb 4903d2                         add        rdx, r10
02eee 41ba2a000000                   mov        r10d, 0x2a
02ef4 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02ef8 7435                           je         0x7fd1bc3f3a2f
02efa 4983c202                       add        r10, 2
02efe 4983fa2e                       cmp        r10, 0x2e
02f02 75f0                           jne        0x7fd1bc3f39f4
02f04 41ba2a000000                   mov        r10d, 0x2a
02f0a 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02f0f 7412                           je         0x7fd1bc3f3a23
02f11 4983c202                       add        r10, 2
02f15 4983fa2e                       cmp        r10, 0x2e
02f19 75ef                           jne        0x7fd1bc3f3a0a
02f1b 41ba29000000                   mov        r10d, 0x29
02f21 eb10                           jmp        0x7fd1bc3f3a33
02f23 50                             push       rax
02f24 4833c0                         xor        rax, rax
02f27 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
02f2c 58                             pop        rax
02f2d ebbf                           jmp        0x7fd1bc3f39ee
02f2f 4983c201                       add        r10, 1
02f33 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02f38 8b4808                         mov        ecx, dword ptr [rax + 8]
02f3b 48ba684b79b4d17f0000           movabs     rdx, 0x7fd1b4794b68
02f45 4883827801000001               add        qword ptr [rdx + 0x178], 1
02f4d 48ba383779b4d17f0000           movabs     rdx, 0x7fd1b4793738
02f57 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02f5b 4183c002                       add        r8d, 2
02f5f 44894270                       mov        dword ptr [rdx + 0x70], r8d
02f63 4181e0feff1f00                 and        r8d, 0x1ffffe
02f6a 4585c0                         test       r8d, r8d
02f6d 0f8437220000                   je         0x7fd1bc3f5caa
02f73 48ba684b79b4d17f0000           movabs     rdx, 0x7fd1b4794b68
02f7d 4883828801000001               add        qword ptr [rdx + 0x188], 1
02f85 8b842490020000                 mov        eax, dword ptr [rsp + 0x290]
02f8c 4863c0                         movsxd     rax, eax
02f8f ba0c000000                     mov        edx, 0xc
02f94 4c8bc8                         mov        r9, rax
02f97 4c03ca                         add        r9, rdx
02f9a 48ba202979b4d17f0000           movabs     rdx, 0x7fd1b4792920
02fa4 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02fa8 4183c002                       add        r8d, 2
02fac 44894270                       mov        dword ptr [rdx + 0x70], r8d
02fb0 4181e0feff1f00                 and        r8d, 0x1ffffe
02fb7 4585c0                         test       r8d, r8d
02fba 0f840b220000                   je         0x7fd1bc3f5ccb
02fc0 48ba202979b4d17f0000           movabs     rdx, 0x7fd1b4792920
02fca 488382d800000001               add        qword ptr [rdx + 0xd8], 1
02fd2 48ba982a79b4d17f0000           movabs     rdx, 0x7fd1b4792a98
02fdc 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
02fe0 4183c002                       add        r8d, 2
02fe4 44894270                       mov        dword ptr [rdx + 0x70], r8d
02fe8 4181e0feff1f00                 and        r8d, 0x1ffffe
02fef 4585c0                         test       r8d, r8d
02ff2 0f84f4210000                   je         0x7fd1bc3f5cec
02ff8 48ba684b79b4d17f0000           movabs     rdx, 0x7fd1b4794b68
03002 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
0300a 48ba48d688e200000000           movabs     rdx, 0xe288d648
03014 ba02000000                     mov        edx, 2
03019 4c8b842400020000               mov        r8, qword ptr [rsp + 0x200]
03021 bf00000000                     mov        edi, 0
03026 488b9c2488020000               mov        rbx, qword ptr [rsp + 0x288]
0302e 48891c24                       mov        qword ptr [rsp], rbx
03032 488b9c2400020000               mov        rbx, qword ptr [rsp + 0x200]
0303a 48895c2408                     mov        qword ptr [rsp + 8], rbx
0303f 4889442410                     mov        qword ptr [rsp + 0x10], rax
03044 49ba48d688e200000000           movabs     r10, 0xe288d648
0304e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03053 48899c2400020000               mov        qword ptr [rsp + 0x200], rbx
0305b 0f1f4000                       nop        dword ptr [rax]
0305f e8fccc5107                     call       0x7fd1c3910860
03064 0f1f84005c310011               nop        dword ptr [rax + rax + 0x1100315c]
0306c 8b842478020000                 mov        eax, dword ptr [rsp + 0x278]
03073 83c010                         add        eax, 0x10
03076 8b9c2480020000                 mov        ebx, dword ptr [rsp + 0x280]
0307d 83c310                         add        ebx, 0x10
03080 3b842484020000                 cmp        eax, dword ptr [rsp + 0x284]
03087 ba02000000                     mov        edx, 2
0308c 7c05                           jl         0x7fd1bc3f3b93
0308e ba00000000                     mov        edx, 0
03093 48b9e86872b4d17f0000           movabs     rcx, 0x7fd1b47268e8
0309d 448b4174                       mov        r8d, dword ptr [rcx + 0x74]
030a1 4403c2                         add        r8d, edx
030a4 44894174                       mov        dword ptr [rcx + 0x74], r8d
030a8 85d2                           test       edx, edx
030aa 7506                           jne        0x7fd1bc3f3bb2
030ac 41b802000000                   mov        r8d, 2
030b2 4181e0fe3f0000                 and        r8d, 0x3ffe
030b9 4585c0                         test       r8d, r8d
030bc 0f844b210000                   je         0x7fd1bc3f5d0d
030c2 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
030c6 418502                         test       dword ptr [r10], eax
030c9 3b842484020000                 cmp        eax, dword ptr [rsp + 0x284]
030d0 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
030da b940070000                     mov        ecx, 0x740
030df 7c05                           jl         0x7fd1bc3f3be6
030e1 b950070000                     mov        ecx, 0x750
030e6 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
030ea 4d8d4001                       lea        r8, [r8 + 1]
030ee 4c89040a                       mov        qword ptr [rdx + rcx], r8
030f2 0f8c48f5ffff                   jl         0x7fd1bc3f3140
030f8 448bac2484020000               mov        r13d, dword ptr [rsp + 0x284]
03100 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
0310a ff8260070000                   inc        dword ptr [rdx + 0x760]
03110 e939100000                     jmp        0x7fd1bc3f4c4e
03115 4183fb08                       cmp        r11d, 8
03119 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
03123 b978070000                     mov        ecx, 0x778
03128 7c05                           jl         0x7fd1bc3f3c2f
0312a b988070000                     mov        ecx, 0x788
0312f 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
03133 4d8d4001                       lea        r8, [r8 + 1]
03137 4c89040a                       mov        qword ptr [rdx + rcx], r8
0313b 0f8c96050000                   jl         0x7fd1bc3f41d7
03141 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
03149 4403ac2410020000               add        r13d, dword ptr [rsp + 0x210]
03151 4489ac249c020000               mov        dword ptr [rsp + 0x29c], r13d
03159 8bbc2464020000                 mov        edi, dword ptr [rsp + 0x264]
03160 89bc2494020000                 mov        dword ptr [rsp + 0x294], edi
03167 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
0316f 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
03179 4883829807000001               add        qword ptr [rdx + 0x798], 1
03181 48ba102e105a00000000           movabs     rdx, 0x5a102e10
0318b 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0318e 83c102                         add        ecx, 2
03191 894a70                         mov        dword ptr [rdx + 0x70], ecx
03194 81e1feff1f00                   and        ecx, 0x1ffffe
0319a 85c9                           test       ecx, ecx
0319c 0f848c200000                   je         0x7fd1bc3f5d2e
031a2 48ba102e105a00000000           movabs     rdx, 0x5a102e10
031ac 488d92d8000000                 lea        rdx, [rdx + 0xd8]
031b3 4885c0                         test       rax, rax
031b6 750c                           jne        0x7fd1bc3f3cc4
031b8 f6420801                       test       byte ptr [rdx + 8], 1
031bc 7506                           jne        0x7fd1bc3f3cc4
031be f048834a0801                   lock or    qword ptr [rdx + 8], 1
031c4 48ba884b62b4d17f0000           movabs     rdx, 0x7fd1b4624b88
031ce 488d9240030000                 lea        rdx, [rdx + 0x340]
031d5 4885c0                         test       rax, rax
031d8 750e                           jne        0x7fd1bc3f3ce8
031da f6421001                       test       byte ptr [rdx + 0x10], 1
031de 7536                           jne        0x7fd1bc3f3d16
031e0 f048834a1001                   lock or    qword ptr [rdx + 0x10], 1
031e6 eb2e                           jmp        0x7fd1bc3f3d16
031e8 488b08                         mov        rcx, qword ptr [rax]
031eb 48c1e92a                       shr        rcx, 0x2a
031ef 48c1e109                       shl        rcx, 9
031f3 41ba0000005a                   mov        r10d, 0x5a000000
031f9 4903ca                         add        rcx, r10
031fc 4c8bd1                         mov        r10, rcx
031ff 48334a10                       xor        rcx, qword ptr [rdx + 0x10]
03203 48f7c1fcffffff                 test       rcx, -4
0320a 740a                           je         0x7fd1bc3f3d16
0320c f6c102                         test       cl, 2
0320f 7505                           jne        0x7fd1bc3f3d16
03211 48834a1002                     or         qword ptr [rdx + 0x10], 2
03216 48ba102e105a00000000           movabs     rdx, 0x5a102e10
03220 488382a800000001               add        qword ptr [rdx + 0xa8], 1
03228 48ba884b62b4d17f0000           movabs     rdx, 0x7fd1b4624b88
03232 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03235 83c102                         add        ecx, 2
03238 894a70                         mov        dword ptr [rdx + 0x70], ecx
0323b 81e1feff1f00                   and        ecx, 0x1ffffe
03241 85c9                           test       ecx, ecx
03243 0f8406200000                   je         0x7fd1bc3f5d4f
03249 48ba501d7ae200000000           movabs     rdx, 0xe27a1d50
03253 48b9884b62b4d17f0000           movabs     rcx, 0x7fd1b4624b88
0325d 488b12                         mov        rdx, qword ptr [rdx]
03260 48c1ea2a                       shr        rdx, 0x2a
03264 48c1e209                       shl        rdx, 9
03268 41ba0000005a                   mov        r10d, 0x5a000000
0326e 4903d2                         add        rdx, r10
03271 41ba16000000                   mov        r10d, 0x16
03277 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0327b 7435                           je         0x7fd1bc3f3db2
0327d 4983c202                       add        r10, 2
03281 4983fa1a                       cmp        r10, 0x1a
03285 75f0                           jne        0x7fd1bc3f3d77
03287 41ba16000000                   mov        r10d, 0x16
0328d 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03292 7412                           je         0x7fd1bc3f3da6
03294 4983c202                       add        r10, 2
03298 4983fa1a                       cmp        r10, 0x1a
0329c 75ef                           jne        0x7fd1bc3f3d8d
0329e 41ba15000000                   mov        r10d, 0x15
032a4 eb10                           jmp        0x7fd1bc3f3db6
032a6 50                             push       rax
032a7 4833c0                         xor        rax, rax
032aa 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
032af 58                             pop        rax
032b0 ebbf                           jmp        0x7fd1bc3f3d71
032b2 4983c201                       add        r10, 1
032b6 4a8304d101                     add        qword ptr [rcx + r10*8], 1
032bb 48ba18740c5a00000000           movabs     rdx, 0x5a0c7418
032c5 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
032c8 83c102                         add        ecx, 2
032cb 894a70                         mov        dword ptr [rdx + 0x70], ecx
032ce 81e1feff1f00                   and        ecx, 0x1ffffe
032d4 85c9                           test       ecx, ecx
032d6 0f84941f0000                   je         0x7fd1bc3f5d70
032dc 48ba18740c5a00000000           movabs     rdx, 0x5a0c7418
032e6 ff82a8000000                   inc        dword ptr [rdx + 0xa8]
032ec 48ba884b62b4d17f0000           movabs     rdx, 0x7fd1b4624b88
032f6 ff8200010000                   inc        dword ptr [rdx + 0x100]
032fc 48ba884b62b4d17f0000           movabs     rdx, 0x7fd1b4624b88
03306 ff8220010000                   inc        dword ptr [rdx + 0x120]
0330c 48ba00157ae200000000           movabs     rdx, 0xe27a1500
03316 48b9884b62b4d17f0000           movabs     rcx, 0x7fd1b4624b88
03320 488b12                         mov        rdx, qword ptr [rdx]
03323 48c1ea2a                       shr        rdx, 0x2a
03327 48c1e209                       shl        rdx, 9
0332b 41ba0000005a                   mov        r10d, 0x5a000000
03331 4903d2                         add        rdx, r10
03334 41ba27000000                   mov        r10d, 0x27
0333a 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0333e 7435                           je         0x7fd1bc3f3e75
03340 4983c202                       add        r10, 2
03344 4983fa2b                       cmp        r10, 0x2b
03348 75f0                           jne        0x7fd1bc3f3e3a
0334a 41ba27000000                   mov        r10d, 0x27
03350 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03355 7412                           je         0x7fd1bc3f3e69
03357 4983c202                       add        r10, 2
0335b 4983fa2b                       cmp        r10, 0x2b
0335f 75ef                           jne        0x7fd1bc3f3e50
03361 41ba26000000                   mov        r10d, 0x26
03367 eb10                           jmp        0x7fd1bc3f3e79
03369 50                             push       rax
0336a 4833c0                         xor        rax, rax
0336d 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
03372 58                             pop        rax
03373 ebbf                           jmp        0x7fd1bc3f3e34
03375 4983c201                       add        r10, 1
03379 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0337e 48ba184962b4d17f0000           movabs     rdx, 0x7fd1b4624918
03388 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
0338b 83c102                         add        ecx, 2
0338e 894a70                         mov        dword ptr [rdx + 0x70], ecx
03391 81e1feff1f00                   and        ecx, 0x1ffffe
03397 85c9                           test       ecx, ecx
03399 0f84f21e0000                   je         0x7fd1bc3f5d91
0339f 48ba184962b4d17f0000           movabs     rdx, 0x7fd1b4624918
033a9 ff82a8000000                   inc        dword ptr [rdx + 0xa8]
033af 48ba884b62b4d17f0000           movabs     rdx, 0x7fd1b4624b88
033b9 488d9280010000                 lea        rdx, [rdx + 0x180]
033c0 4885c0                         test       rax, rax
033c3 750e                           jne        0x7fd1bc3f3ed3
033c5 f6421801                       test       byte ptr [rdx + 0x18], 1
033c9 7536                           jne        0x7fd1bc3f3f01
033cb f048834a1801                   lock or    qword ptr [rdx + 0x18], 1
033d1 eb2e                           jmp        0x7fd1bc3f3f01
033d3 488b08                         mov        rcx, qword ptr [rax]
033d6 48c1e92a                       shr        rcx, 0x2a
033da 48c1e109                       shl        rcx, 9
033de 41ba0000005a                   mov        r10d, 0x5a000000
033e4 4903ca                         add        rcx, r10
033e7 4c8bd1                         mov        r10, rcx
033ea 48334a18                       xor        rcx, qword ptr [rdx + 0x18]
033ee 48f7c1fcffffff                 test       rcx, -4
033f5 740a                           je         0x7fd1bc3f3f01
033f7 f6c102                         test       cl, 2
033fa 7505                           jne        0x7fd1bc3f3f01
033fc 48834a1802                     or         qword ptr [rdx + 0x18], 2
03401 48ba884b62b4d17f0000           movabs     rdx, 0x7fd1b4624b88
0340b 4883827001000001               add        qword ptr [rdx + 0x170], 1
03413 48bae04e62b4d17f0000           movabs     rdx, 0x7fd1b4624ee0
0341d 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03420 83c102                         add        ecx, 2
03423 894a70                         mov        dword ptr [rdx + 0x70], ecx
03426 81e1feff1f00                   and        ecx, 0x1ffffe
0342c 85c9                           test       ecx, ecx
0342e 0f847e1e0000                   je         0x7fd1bc3f5db2
03434 4885c0                         test       rax, rax
03437 49b8e04e62b4d17f0000           movabs     r8, 0x7fd1b4624ee0
03441 750d                           jne        0x7fd1bc3f3f50
03443 418088d100000001               or         byte ptr [r8 + 0xd1], 1
0344b e98b000000                     jmp        0x7fd1bc3f3fdb
03450 488b30                         mov        rsi, qword ptr [rax]
03453 48c1ee2a                       shr        rsi, 0x2a
03457 48c1e609                       shl        rsi, 9
0345b 41ba0000005a                   mov        r10d, 0x5a000000
03461 4903f2                         add        rsi, r10
03464 41ba1c000000                   mov        r10d, 0x1c
0346a 4b3b34d0                       cmp        rsi, qword ptr [r8 + r10*8]
0346e 7435                           je         0x7fd1bc3f3fa5
03470 4983c202                       add        r10, 2
03474 4983fa20                       cmp        r10, 0x20
03478 75f0                           jne        0x7fd1bc3f3f6a
0347a 41ba1c000000                   mov        r10d, 0x1c
03480 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
03485 7412                           je         0x7fd1bc3f3f99
03487 4983c202                       add        r10, 2
0348b 4983fa20                       cmp        r10, 0x20
0348f 75ef                           jne        0x7fd1bc3f3f80
03491 41ba1b000000                   mov        r10d, 0x1b
03497 eb10                           jmp        0x7fd1bc3f3fa9
03499 50                             push       rax
0349a 4833c0                         xor        rax, rax
0349d 4b0fb134d0                     cmpxchg    qword ptr [r8 + r10*8], rsi
034a2 58                             pop        rax
034a3 ebbf                           jmp        0x7fd1bc3f3f64
034a5 4983c201                       add        r10, 1
034a9 4b8304d001                     add        qword ptr [r8 + r10*8], 1
034ae 48be000a045a00000000           movabs     rsi, 0x5a040a00
034b8 4c8b00                         mov        r8, qword ptr [rax]
034bb 49c1e82a                       shr        r8, 0x2a
034bf 49c1e009                       shl        r8, 9
034c3 41ba0000005a                   mov        r10d, 0x5a000000
034c9 4d03c2                         add        r8, r10
034cc 493b7038                       cmp        rsi, qword ptr [r8 + 0x38]
034d0 0f85fd1d0000                   jne        0x7fd1bc3f5dd3
034d6 e900000000                     jmp        0x7fd1bc3f3fdb
034db 488bd0                         mov        rdx, rax
034de 48b9e04e62b4d17f0000           movabs     rcx, 0x7fd1b4624ee0
034e8 4883810801000001               add        qword ptr [rcx + 0x108], 1
034f0 48b9905062b4d17f0000           movabs     rcx, 0x7fd1b4625090
034fa 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
034fe 4183c002                       add        r8d, 2
03502 44894170                       mov        dword ptr [rcx + 0x70], r8d
03506 4181e0feff1f00                 and        r8d, 0x1ffffe
0350d 4585c0                         test       r8d, r8d
03510 0f84c61d0000                   je         0x7fd1bc3f5ddc
03516 8b4a08                         mov        ecx, dword ptr [rdx + 8]
03519 49b8905062b4d17f0000           movabs     r8, 0x7fd1b4625090
03523 498380a800000001               add        qword ptr [r8 + 0xa8], 1
0352b 83e907                         sub        ecx, 7
0352e 49b8801d23e200000000           movabs     r8, 0xe2231d80
03538 41b800000000                   mov        r8d, 0
0353e 413bd8                         cmp        ebx, r8d
03541 0f8cbb1d0000                   jl         0x7fd1bc3f5e02
03547 3bd9                           cmp        ebx, ecx
03549 0f8dc01d0000                   jge        0x7fd1bc3f5e0f
0354f 488bcb                         mov        rcx, rbx
03552 48be00b722e200000000           movabs     rsi, 0xe222b700
0355c 4c8bc6                         mov        r8, rsi
0355f 49b9e04e62b4d17f0000           movabs     r9, 0x7fd1b4624ee0
03569 4d8b00                         mov        r8, qword ptr [r8]
0356c 49c1e82a                       shr        r8, 0x2a
03570 49c1e009                       shl        r8, 9
03574 41ba0000005a                   mov        r10d, 0x5a000000
0357a 4d03c2                         add        r8, r10
0357d 41ba24000000                   mov        r10d, 0x24
03583 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
03587 7435                           je         0x7fd1bc3f40be
03589 4983c202                       add        r10, 2
0358d 4983fa28                       cmp        r10, 0x28
03591 75f0                           jne        0x7fd1bc3f4083
03593 41ba24000000                   mov        r10d, 0x24
03599 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
0359e 7412                           je         0x7fd1bc3f40b2
035a0 4983c202                       add        r10, 2
035a4 4983fa28                       cmp        r10, 0x28
035a8 75ef                           jne        0x7fd1bc3f4099
035aa 41ba23000000                   mov        r10d, 0x23
035b0 eb10                           jmp        0x7fd1bc3f40c2
035b2 50                             push       rax
035b3 4833c0                         xor        rax, rax
035b6 4f0fb104d1                     cmpxchg    qword ptr [r9 + r10*8], r8
035bb 58                             pop        rax
035bc ebbf                           jmp        0x7fd1bc3f407d
035be 4983c201                       add        r10, 1
035c2 4b8304d101                     add        qword ptr [r9 + r10*8], 1
035c7 4863c9                         movsxd     rcx, ecx
035ca 41ba0c000000                   mov        r10d, 0xc
035d0 4903ca                         add        rcx, r10
035d3 41b800000000                   mov        r8d, 0
035d9 899c2498020000                 mov        dword ptr [rsp + 0x298], ebx
035e0 4889842400020000               mov        qword ptr [rsp + 0x200], rax
035e8 0f1f8000000000                 nop        dword ptr [rax]
035ef e86cbd5107                     call       0x7fd1c390fe60
035f4 0f1f8400ec360013               nop        dword ptr [rax + rax + 0x130036ec]
035fc 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
03606 488386a807000001               add        qword ptr [rsi + 0x7a8], 1
0360e 488bb42400020000               mov        rsi, qword ptr [rsp + 0x200]
03616 8b942494020000                 mov        edx, dword ptr [rsp + 0x294]
0361d 488bc8                         mov        rcx, rax
03620 0f1f8000000000                 nop        dword ptr [rax]
03627 e834c75107                     call       0x7fd1c3910860
0362c 0f1f840024370014               nop        dword ptr [rax + rax + 0x14003724]
03634 8bbc2494020000                 mov        edi, dword ptr [rsp + 0x294]
0363b 83c708                         add        edi, 8
0363e 8b9c2498020000                 mov        ebx, dword ptr [rsp + 0x298]
03645 83c308                         add        ebx, 8
03648 3bbc249c020000                 cmp        edi, dword ptr [rsp + 0x29c]
0364f be02000000                     mov        esi, 2
03654 7c05                           jl         0x7fd1bc3f415b
03656 be00000000                     mov        esi, 0
0365b 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
03665 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
03668 03ce                           add        ecx, esi
0366a 894a74                         mov        dword ptr [rdx + 0x74], ecx
0366d 85f6                           test       esi, esi
0366f 7505                           jne        0x7fd1bc3f4176
03671 b902000000                     mov        ecx, 2
03676 81e1fe3f0000                   and        ecx, 0x3ffe
0367c 85c9                           test       ecx, ecx
0367e 0f84981c0000                   je         0x7fd1bc3f5e1c
03684 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03688 418502                         test       dword ptr [r10], eax
0368b 3bbc249c020000                 cmp        edi, dword ptr [rsp + 0x29c]
03692 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
0369c bab8070000                     mov        edx, 0x7b8
036a1 7c05                           jl         0x7fd1bc3f41a8
036a3 bac8070000                     mov        edx, 0x7c8
036a8 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
036ac 488d4901                       lea        rcx, [rcx + 1]
036b0 48890c16                       mov        qword ptr [rsi + rdx], rcx
036b4 0f8ca6faffff                   jl         0x7fd1bc3f3c60
036ba 448bac249c020000               mov        r13d, dword ptr [rsp + 0x29c]
036c2 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
036cc ff86d8070000                   inc        dword ptr [rsi + 0x7d8]
036d2 e9770a0000                     jmp        0x7fd1bc3f4c4e
036d7 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
036e1 488386f007000001               add        qword ptr [rsi + 0x7f0], 1
036e9 488bb42400020000               mov        rsi, qword ptr [rsp + 0x200]
036f1 8b942464020000                 mov        edx, dword ptr [rsp + 0x264]
036f8 488bcb                         mov        rcx, rbx
036fb 4d8bc3                         mov        r8, r11
036fe 448b8c2410020000               mov        r9d, dword ptr [rsp + 0x210]
03706 90                             nop        
03707 e854c65107                     call       0x7fd1c3910860
0370c 0f1f840004380016               nop        dword ptr [rax + rax + 0x16003804]
03714 4c8be8                         mov        r13, rax
03717 e9320a0000                     jmp        0x7fd1bc3f4c4e
0371c 89bc2468020000                 mov        dword ptr [rsp + 0x268], edi
03723 4489ac2464020000               mov        dword ptr [rsp + 0x264], r13d
0372b 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
03733 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
0373d 488386c805000001               add        qword ptr [rsi + 0x5c8], 1
03745 48bea83e79b4d17f0000           movabs     rsi, 0x7fd1b4793ea8
0374f 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03752 83c202                         add        edx, 2
03755 895670                         mov        dword ptr [rsi + 0x70], edx
03758 81e2feff1f00                   and        edx, 0x1ffffe
0375e 85d2                           test       edx, edx
03760 0f84d71b0000                   je         0x7fd1bc3f5e3d
03766 48bed82f84e200000000           movabs     rsi, 0xe2842fd8
03770 48baa83e79b4d17f0000           movabs     rdx, 0x7fd1b4793ea8
0377a 488b36                         mov        rsi, qword ptr [rsi]
0377d 48c1ee2a                       shr        rsi, 0x2a
03781 48c1e609                       shl        rsi, 9
03785 41ba0000005a                   mov        r10d, 0x5a000000
0378b 4903f2                         add        rsi, r10
0378e 41ba16000000                   mov        r10d, 0x16
03794 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03798 7435                           je         0x7fd1bc3f42cf
0379a 4983c202                       add        r10, 2
0379e 4983fa1a                       cmp        r10, 0x1a
037a2 75f0                           jne        0x7fd1bc3f4294
037a4 41ba16000000                   mov        r10d, 0x16
037aa 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
037af 7412                           je         0x7fd1bc3f42c3
037b1 4983c202                       add        r10, 2
037b5 4983fa1a                       cmp        r10, 0x1a
037b9 75ef                           jne        0x7fd1bc3f42aa
037bb 41ba15000000                   mov        r10d, 0x15
037c1 eb10                           jmp        0x7fd1bc3f42d3
037c3 50                             push       rax
037c4 4833c0                         xor        rax, rax
037c7 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
037cc 58                             pop        rax
037cd ebbf                           jmp        0x7fd1bc3f428e
037cf 4983c201                       add        r10, 1
037d3 4a8304d201                     add        qword ptr [rdx + r10*8], 1
037d8 448b5808                       mov        r11d, dword ptr [rax + 8]
037dc 48bea83e79b4d17f0000           movabs     rsi, 0x7fd1b4793ea8
037e6 488386d800000001               add        qword ptr [rsi + 0xd8], 1
037ee 48be003579b4d17f0000           movabs     rsi, 0x7fd1b4793500
037f8 8b5670                         mov        edx, dword ptr [rsi + 0x70]
037fb 83c202                         add        edx, 2
037fe 895670                         mov        dword ptr [rsi + 0x70], edx
03801 81e2feff1f00                   and        edx, 0x1ffffe
03807 85d2                           test       edx, edx
03809 0f84541b0000                   je         0x7fd1bc3f5e63
0380f 48be003579b4d17f0000           movabs     rsi, 0x7fd1b4793500
03819 4883860801000001               add        qword ptr [rsi + 0x108], 1
03821 498bf3                         mov        rsi, r11
03824 83ee0f                         sub        esi, 0xf
03827 48bad02b79b4d17f0000           movabs     rdx, 0x7fd1b4792bd0
03831 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03834 83c102                         add        ecx, 2
03837 894a70                         mov        dword ptr [rdx + 0x70], ecx
0383a 81e1feff1f00                   and        ecx, 0x1ffffe
03840 85c9                           test       ecx, ecx
03842 0f843c1b0000                   je         0x7fd1bc3f5e84
03848 48bad02b79b4d17f0000           movabs     rdx, 0x7fd1b4792bd0
03852 488382a800000001               add        qword ptr [rdx + 0xa8], 1
0385a 48ba0000000000000000           movabs     rdx, 0
03864 ba00000000                     mov        edx, 0
03869 3bda                           cmp        ebx, edx
0386b 0f8c341b0000                   jl         0x7fd1bc3f5ea5
03871 3bde                           cmp        ebx, esi
03873 0f8d391b0000                   jge        0x7fd1bc3f5eb2
03879 48bed82f84e200000000           movabs     rsi, 0xe2842fd8
03883 488bd6                         mov        rdx, rsi
03886 48b9a83e79b4d17f0000           movabs     rcx, 0x7fd1b4793ea8
03890 488b12                         mov        rdx, qword ptr [rdx]
03893 48c1ea2a                       shr        rdx, 0x2a
03897 48c1e209                       shl        rdx, 9
0389b 41ba0000005a                   mov        r10d, 0x5a000000
038a1 4903d2                         add        rdx, r10
038a4 41ba24000000                   mov        r10d, 0x24
038aa 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
038ae 7435                           je         0x7fd1bc3f43e5
038b0 4983c202                       add        r10, 2
038b4 4983fa28                       cmp        r10, 0x28
038b8 75f0                           jne        0x7fd1bc3f43aa
038ba 41ba24000000                   mov        r10d, 0x24
038c0 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
038c5 7412                           je         0x7fd1bc3f43d9
038c7 4983c202                       add        r10, 2
038cb 4983fa28                       cmp        r10, 0x28
038cf 75ef                           jne        0x7fd1bc3f43c0
038d1 41ba23000000                   mov        r10d, 0x23
038d7 eb10                           jmp        0x7fd1bc3f43e9
038d9 50                             push       rax
038da 4833c0                         xor        rax, rax
038dd 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
038e2 58                             pop        rax
038e3 ebbf                           jmp        0x7fd1bc3f43a4
038e5 4983c201                       add        r10, 1
038e9 4a8304d101                     add        qword ptr [rcx + r10*8], 1
038ee 48bad02c79b4d17f0000           movabs     rdx, 0x7fd1b4792cd0
038f8 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
038fb 83c102                         add        ecx, 2
038fe 894a70                         mov        dword ptr [rdx + 0x70], ecx
03901 81e1feff1f00                   and        ecx, 0x1ffffe
03907 85c9                           test       ecx, ecx
03909 0f84b01a0000                   je         0x7fd1bc3f5ebf
0390f 48bad02c79b4d17f0000           movabs     rdx, 0x7fd1b4792cd0
03919 488382a800000001               add        qword ptr [rdx + 0xa8], 1
03921 48bef82d79b4d17f0000           movabs     rsi, 0x7fd1b4792df8
0392b 8b5670                         mov        edx, dword ptr [rsi + 0x70]
0392e 83c202                         add        edx, 2
03931 895670                         mov        dword ptr [rsi + 0x70], edx
03934 81e2feff1f00                   and        edx, 0x1ffffe
0393a 85d2                           test       edx, edx
0393c 0f849e1a0000                   je         0x7fd1bc3f5ee0
03942 48bef82d79b4d17f0000           movabs     rsi, 0x7fd1b4792df8
0394c ff86b8000000                   inc        dword ptr [rsi + 0xb8]
03952 44899c24a0020000               mov        dword ptr [rsp + 0x2a0], r11d
0395a 48bed0fa85e200000000           movabs     rsi, 0xe285fad0
03964 488bd6                         mov        rdx, rsi
03967 48b9a83e79b4d17f0000           movabs     rcx, 0x7fd1b4793ea8
03971 4883815801000001               add        qword ptr [rcx + 0x158], 1
03979 48ba704079b4d17f0000           movabs     rdx, 0x7fd1b4794070
03983 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
03986 83c102                         add        ecx, 2
03989 894a70                         mov        dword ptr [rdx + 0x70], ecx
0398c 81e1feff1f00                   and        ecx, 0x1ffffe
03992 85c9                           test       ecx, ecx
03994 0f84671a0000                   je         0x7fd1bc3f5f01
0399a 488bd6                         mov        rdx, rsi
0399d 48b9704079b4d17f0000           movabs     rcx, 0x7fd1b4794070
039a7 488381a800000001               add        qword ptr [rcx + 0xa8], 1
039af 48ba504179b4d17f0000           movabs     rdx, 0x7fd1b4794150
039b9 8b4a70                         mov        ecx, dword ptr [rdx + 0x70]
039bc 83c102                         add        ecx, 2
039bf 894a70                         mov        dword ptr [rdx + 0x70], ecx
039c2 81e1feff1f00                   and        ecx, 0x1ffffe
039c8 85c9                           test       ecx, ecx
039ca 0f84521a0000                   je         0x7fd1bc3f5f22
039d0 48ba504179b4d17f0000           movabs     rdx, 0x7fd1b4794150
039da 488382b800000001               add        qword ptr [rdx + 0xb8], 1
039e2 48be783679b4d17f0000           movabs     rsi, 0x7fd1b4793678
039ec 8b5670                         mov        edx, dword ptr [rsi + 0x70]
039ef 83c202                         add        edx, 2
039f2 895670                         mov        dword ptr [rsi + 0x70], edx
039f5 81e2feff1f00                   and        edx, 0x1ffffe
039fb 85d2                           test       edx, edx
039fd 0f84401a0000                   je         0x7fd1bc3f5f43
03a03 48bed82f84e200000000           movabs     rsi, 0xe2842fd8
03a0d 488bd6                         mov        rdx, rsi
03a10 48b9504179b4d17f0000           movabs     rcx, 0x7fd1b4794150
03a1a 488b12                         mov        rdx, qword ptr [rdx]
03a1d 48c1ea2a                       shr        rdx, 0x2a
03a21 48c1e209                       shl        rdx, 9
03a25 41ba0000005a                   mov        r10d, 0x5a000000
03a2b 4903d2                         add        rdx, r10
03a2e 41ba1c000000                   mov        r10d, 0x1c
03a34 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03a38 7435                           je         0x7fd1bc3f456f
03a3a 4983c202                       add        r10, 2
03a3e 4983fa20                       cmp        r10, 0x20
03a42 75f0                           jne        0x7fd1bc3f4534
03a44 41ba1c000000                   mov        r10d, 0x1c
03a4a 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03a4f 7412                           je         0x7fd1bc3f4563
03a51 4983c202                       add        r10, 2
03a55 4983fa20                       cmp        r10, 0x20
03a59 75ef                           jne        0x7fd1bc3f454a
03a5b 41ba1b000000                   mov        r10d, 0x1b
03a61 eb10                           jmp        0x7fd1bc3f4573
03a63 50                             push       rax
03a64 4833c0                         xor        rax, rax
03a67 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
03a6c 58                             pop        rax
03a6d ebbf                           jmp        0x7fd1bc3f452e
03a6f 4983c201                       add        r10, 1
03a73 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03a78 48ba504179b4d17f0000           movabs     rdx, 0x7fd1b4794150
03a82 488b36                         mov        rsi, qword ptr [rsi]
03a85 48c1ee2a                       shr        rsi, 0x2a
03a89 48c1e609                       shl        rsi, 9
03a8d 41ba0000005a                   mov        r10d, 0x5a000000
03a93 4903f2                         add        rsi, r10
03a96 41ba22000000                   mov        r10d, 0x22
03a9c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03aa0 7435                           je         0x7fd1bc3f45d7
03aa2 4983c202                       add        r10, 2
03aa6 4983fa26                       cmp        r10, 0x26
03aaa 75f0                           jne        0x7fd1bc3f459c
03aac 41ba22000000                   mov        r10d, 0x22
03ab2 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03ab7 7412                           je         0x7fd1bc3f45cb
03ab9 4983c202                       add        r10, 2
03abd 4983fa26                       cmp        r10, 0x26
03ac1 75ef                           jne        0x7fd1bc3f45b2
03ac3 41ba21000000                   mov        r10d, 0x21
03ac9 eb10                           jmp        0x7fd1bc3f45db
03acb 50                             push       rax
03acc 4833c0                         xor        rax, rax
03acf 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
03ad4 58                             pop        rax
03ad5 ebbf                           jmp        0x7fd1bc3f4596
03ad7 4983c201                       add        r10, 1
03adb 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03ae0 48be504179b4d17f0000           movabs     rsi, 0x7fd1b4794150
03aea 4883863801000001               add        qword ptr [rsi + 0x138], 1
03af2 48be383779b4d17f0000           movabs     rsi, 0x7fd1b4793738
03afc 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03aff 83c202                         add        edx, 2
03b02 895670                         mov        dword ptr [rsi + 0x70], edx
03b05 81e2feff1f00                   and        edx, 0x1ffffe
03b0b 85d2                           test       edx, edx
03b0d 0f8451190000                   je         0x7fd1bc3f5f64
03b13 48be504179b4d17f0000           movabs     rsi, 0x7fd1b4794150
03b1d 4883864801000001               add        qword ptr [rsi + 0x148], 1
03b25 4863db                         movsxd     rbx, ebx
03b28 be0c000000                     mov        esi, 0xc
03b2d 4c8bcb                         mov        r9, rbx
03b30 4c03ce                         add        r9, rsi
03b33 48be202979b4d17f0000           movabs     rsi, 0x7fd1b4792920
03b3d 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03b40 83c202                         add        edx, 2
03b43 895670                         mov        dword ptr [rsi + 0x70], edx
03b46 81e2feff1f00                   and        edx, 0x1ffffe
03b4c 85d2                           test       edx, edx
03b4e 0f8431190000                   je         0x7fd1bc3f5f85
03b54 48be202979b4d17f0000           movabs     rsi, 0x7fd1b4792920
03b5e 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03b66 48be982a79b4d17f0000           movabs     rsi, 0x7fd1b4792a98
03b70 8b5670                         mov        edx, dword ptr [rsi + 0x70]
03b73 83c202                         add        edx, 2
03b76 895670                         mov        dword ptr [rsi + 0x70], edx
03b79 81e2feff1f00                   and        edx, 0x1ffffe
03b7f 85d2                           test       edx, edx
03b81 0f841f190000                   je         0x7fd1bc3f5fa6
03b87 48be504179b4d17f0000           movabs     rsi, 0x7fd1b4794150
03b91 4883866801000001               add        qword ptr [rsi + 0x168], 1
03b99 48bea0f586e200000000           movabs     rsi, 0xe286f5a0
03ba3 48be203084e200000000           movabs     rsi, 0xe2843020
03bad ba02000000                     mov        edx, 2
03bb2 b910000000                     mov        ecx, 0x10
03bb7 4c8bc0                         mov        r8, rax
03bba bf00000000                     mov        edi, 0
03bbf 48890424                       mov        qword ptr [rsp], rax
03bc3 48895c2408                     mov        qword ptr [rsp + 8], rbx
03bc8 49bad82f84e200000000           movabs     r10, 0xe2842fd8
03bd2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03bd7 49baa0f586e200000000           movabs     r10, 0xe286f5a0
03be1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03be6 4889842400020000               mov        qword ptr [rsp + 0x200], rax
03bee 90                             nop        
03bef e86cc15107                     call       0x7fd1c3910860
03bf4 0f1f8400ec3c0017               nop        dword ptr [rax + rax + 0x17003cec]
03bfc 4885c0                         test       rax, rax
03bff 48bb504179b4d17f0000           movabs     rbx, 0x7fd1b4794150
03c09 750c                           jne        0x7fd1bc3f4717
03c0b 808b7101000001                 or         byte ptr [rbx + 0x171], 1
03c12 e98b000000                     jmp        0x7fd1bc3f47a2
03c17 488b38                         mov        rdi, qword ptr [rax]
03c1a 48c1ef2a                       shr        rdi, 0x2a
03c1e 48c1e709                       shl        rdi, 9
03c22 41ba0000005a                   mov        r10d, 0x5a000000
03c28 4903fa                         add        rdi, r10
03c2b 41ba30000000                   mov        r10d, 0x30
03c31 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
03c35 7435                           je         0x7fd1bc3f476c
03c37 4983c202                       add        r10, 2
03c3b 4983fa34                       cmp        r10, 0x34
03c3f 75f0                           jne        0x7fd1bc3f4731
03c41 41ba30000000                   mov        r10d, 0x30
03c47 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03c4c 7412                           je         0x7fd1bc3f4760
03c4e 4983c202                       add        r10, 2
03c52 4983fa34                       cmp        r10, 0x34
03c56 75ef                           jne        0x7fd1bc3f4747
03c58 41ba2f000000                   mov        r10d, 0x2f
03c5e eb10                           jmp        0x7fd1bc3f4770
03c60 50                             push       rax
03c61 4833c0                         xor        rax, rax
03c64 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
03c69 58                             pop        rax
03c6a ebbf                           jmp        0x7fd1bc3f472b
03c6c 4983c201                       add        r10, 1
03c70 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03c75 48bf0006145a00000000           movabs     rdi, 0x5a140600
03c7f 488b18                         mov        rbx, qword ptr [rax]
03c82 48c1eb2a                       shr        rbx, 0x2a
03c86 48c1e309                       shl        rbx, 9
03c8a 41ba0000005a                   mov        r10d, 0x5a000000
03c90 4903da                         add        rbx, r10
03c93 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
03c97 0f852a180000                   jne        0x7fd1bc3f5fc7
03c9d e900000000                     jmp        0x7fd1bc3f47a2
03ca2 488bf8                         mov        rdi, rax
03ca5 4889bc24a8020000               mov        qword ptr [rsp + 0x2a8], rdi
03cad 483b07                         cmp        rax, qword ptr [rdi]
03cb0 488bf7                         mov        rsi, rdi
03cb3 48bbe86872b4d17f0000           movabs     rbx, 0x7fd1b47268e8
03cbd 488b36                         mov        rsi, qword ptr [rsi]
03cc0 48c1ee2a                       shr        rsi, 0x2a
03cc4 48c1e609                       shl        rsi, 9
03cc8 41ba0000005a                   mov        r10d, 0x5a000000
03cce 4903f2                         add        rsi, r10
03cd1 41babc000000                   mov        r10d, 0xbc
03cd7 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03cdb 743b                           je         0x7fd1bc3f4818
03cdd 4983c202                       add        r10, 2
03ce1 4981fac0000000                 cmp        r10, 0xc0
03ce8 75ed                           jne        0x7fd1bc3f47d7
03cea 41babc000000                   mov        r10d, 0xbc
03cf0 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03cf5 7415                           je         0x7fd1bc3f480c
03cf7 4983c202                       add        r10, 2
03cfb 4981fac0000000                 cmp        r10, 0xc0
03d02 75ec                           jne        0x7fd1bc3f47f0
03d04 41babb000000                   mov        r10d, 0xbb
03d0a eb10                           jmp        0x7fd1bc3f481c
03d0c 50                             push       rax
03d0d 4833c0                         xor        rax, rax
03d10 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
03d15 58                             pop        rax
03d16 ebb9                           jmp        0x7fd1bc3f47d1
03d18 4983c201                       add        r10, 1
03d1c 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03d21 48be684b79b4d17f0000           movabs     rsi, 0x7fd1b4794b68
03d2b 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
03d2e 83c302                         add        ebx, 2
03d31 895e70                         mov        dword ptr [rsi + 0x70], ebx
03d34 81e3feff1f00                   and        ebx, 0x1ffffe
03d3a 85db                           test       ebx, ebx
03d3c 0f8493170000                   je         0x7fd1bc3f5fd5
03d42 488bf7                         mov        rsi, rdi
03d45 48bb684b79b4d17f0000           movabs     rbx, 0x7fd1b4794b68
03d4f 488b36                         mov        rsi, qword ptr [rsi]
03d52 48c1ee2a                       shr        rsi, 0x2a
03d56 48c1e609                       shl        rsi, 9
03d5a 41ba0000005a                   mov        r10d, 0x5a000000
03d60 4903f2                         add        rsi, r10
03d63 41ba16000000                   mov        r10d, 0x16
03d69 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03d6d 7435                           je         0x7fd1bc3f48a4
03d6f 4983c202                       add        r10, 2
03d73 4983fa1a                       cmp        r10, 0x1a
03d77 75f0                           jne        0x7fd1bc3f4869
03d79 41ba16000000                   mov        r10d, 0x16
03d7f 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03d84 7412                           je         0x7fd1bc3f4898
03d86 4983c202                       add        r10, 2
03d8a 4983fa1a                       cmp        r10, 0x1a
03d8e 75ef                           jne        0x7fd1bc3f487f
03d90 41ba15000000                   mov        r10d, 0x15
03d96 eb10                           jmp        0x7fd1bc3f48a8
03d98 50                             push       rax
03d99 4833c0                         xor        rax, rax
03d9c 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
03da1 58                             pop        rax
03da2 ebbf                           jmp        0x7fd1bc3f4863
03da4 4983c201                       add        r10, 1
03da8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03dad 488bf7                         mov        rsi, rdi
03db0 0f1f440000                     nop        dword ptr [rax + rax]
03db5 48b8d0c43998d17f0000           movabs     rax, 0x7fd19839c4d0
03dbf e89cba5107                     call       0x7fd1c3910360
03dc4 0f1f8400bc3e0018               nop        dword ptr [rax + rax + 0x18003ebc]
03dcc 48be684b79b4d17f0000           movabs     rsi, 0x7fd1b4794b68
03dd6 488386d800000001               add        qword ptr [rsi + 0xd8], 1
03dde 48be003579b4d17f0000           movabs     rsi, 0x7fd1b4793500
03de8 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
03deb 83c702                         add        edi, 2
03dee 897e70                         mov        dword ptr [rsi + 0x70], edi
03df1 81e7feff1f00                   and        edi, 0x1ffffe
03df7 85ff                           test       edi, edi
03df9 0f84f7160000                   je         0x7fd1bc3f5ff6
03dff 448b9c24a0020000               mov        r11d, dword ptr [rsp + 0x2a0]
03e07 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
03e0f 48be003579b4d17f0000           movabs     rsi, 0x7fd1b4793500
03e19 4883860801000001               add        qword ptr [rsi + 0x108], 1
03e21 ffc8                           dec        eax
03e23 442bd8                         sub        r11d, eax
03e26 48bed02b79b4d17f0000           movabs     rsi, 0x7fd1b4792bd0
03e30 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
03e33 83c702                         add        edi, 2
03e36 897e70                         mov        dword ptr [rsi + 0x70], edi
03e39 81e7feff1f00                   and        edi, 0x1ffffe
03e3f 85ff                           test       edi, edi
03e41 0f84d0160000                   je         0x7fd1bc3f6017
03e47 48bed02b79b4d17f0000           movabs     rsi, 0x7fd1b4792bd0
03e51 488386a800000001               add        qword ptr [rsi + 0xa8], 1
03e59 48be0000000000000000           movabs     rsi, 0
03e63 be00000000                     mov        esi, 0
03e68 443bee                         cmp        r13d, esi
03e6b 0f8cc7160000                   jl         0x7fd1bc3f6038
03e71 453beb                         cmp        r13d, r11d
03e74 0f8dcb160000                   jge        0x7fd1bc3f6045
03e7a 498bfd                         mov        rdi, r13
03e7d 89bc24a4020000                 mov        dword ptr [rsp + 0x2a4], edi
03e84 488bbc24a8020000               mov        rdi, qword ptr [rsp + 0x2a8]
03e8c 4489ac2464020000               mov        dword ptr [rsp + 0x264], r13d
03e94 488bf7                         mov        rsi, rdi
03e97 48ba684b79b4d17f0000           movabs     rdx, 0x7fd1b4794b68
03ea1 488b36                         mov        rsi, qword ptr [rsi]
03ea4 48c1ee2a                       shr        rsi, 0x2a
03ea8 48c1e609                       shl        rsi, 9
03eac 41ba0000005a                   mov        r10d, 0x5a000000
03eb2 4903f2                         add        rsi, r10
03eb5 41ba1e000000                   mov        r10d, 0x1e
03ebb 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03ebf 7435                           je         0x7fd1bc3f49f6
03ec1 4983c202                       add        r10, 2
03ec5 4983fa22                       cmp        r10, 0x22
03ec9 75f0                           jne        0x7fd1bc3f49bb
03ecb 41ba1e000000                   mov        r10d, 0x1e
03ed1 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03ed6 7412                           je         0x7fd1bc3f49ea
03ed8 4983c202                       add        r10, 2
03edc 4983fa22                       cmp        r10, 0x22
03ee0 75ef                           jne        0x7fd1bc3f49d1
03ee2 41ba1d000000                   mov        r10d, 0x1d
03ee8 eb10                           jmp        0x7fd1bc3f49fa
03eea 50                             push       rax
03eeb 4833c0                         xor        rax, rax
03eee 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
03ef3 58                             pop        rax
03ef4 ebbf                           jmp        0x7fd1bc3f49b5
03ef6 4983c201                       add        r10, 1
03efa 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03eff 488bf7                         mov        rsi, rdi
03f02 666690                         nop        
03f05 48b8f8c43998d17f0000           movabs     rax, 0x7fd19839c4f8
03f0f e84cb95107                     call       0x7fd1c3910360
03f14 0f1f84000c400019               nop        dword ptr [rax + rax + 0x1900400c]
03f1c 483b00                         cmp        rax, qword ptr [rax]
03f1f 488bf0                         mov        rsi, rax
03f22 48ba684b79b4d17f0000           movabs     rdx, 0x7fd1b4794b68
03f2c 488b36                         mov        rsi, qword ptr [rsi]
03f2f 48c1ee2a                       shr        rsi, 0x2a
03f33 48c1e609                       shl        rsi, 9
03f37 41ba0000005a                   mov        r10d, 0x5a000000
03f3d 4903f2                         add        rsi, r10
03f40 41ba24000000                   mov        r10d, 0x24
03f46 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03f4a 7435                           je         0x7fd1bc3f4a81
03f4c 4983c202                       add        r10, 2
03f50 4983fa28                       cmp        r10, 0x28
03f54 75f0                           jne        0x7fd1bc3f4a46
03f56 41ba24000000                   mov        r10d, 0x24
03f5c 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03f61 7412                           je         0x7fd1bc3f4a75
03f63 4983c202                       add        r10, 2
03f67 4983fa28                       cmp        r10, 0x28
03f6b 75ef                           jne        0x7fd1bc3f4a5c
03f6d 41ba23000000                   mov        r10d, 0x23
03f73 eb10                           jmp        0x7fd1bc3f4a85
03f75 50                             push       rax
03f76 4833c0                         xor        rax, rax
03f79 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
03f7e 58                             pop        rax
03f7f ebbf                           jmp        0x7fd1bc3f4a40
03f81 4983c201                       add        r10, 1
03f85 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03f8a 8b7028                         mov        esi, dword ptr [rax + 0x28]
03f8d 488bd0                         mov        rdx, rax
03f90 48b9684b79b4d17f0000           movabs     rcx, 0x7fd1b4794b68
03f9a 488b12                         mov        rdx, qword ptr [rdx]
03f9d 48c1ea2a                       shr        rdx, 0x2a
03fa1 48c1e209                       shl        rdx, 9
03fa5 41ba0000005a                   mov        r10d, 0x5a000000
03fab 4903d2                         add        rdx, r10
03fae 41ba2a000000                   mov        r10d, 0x2a
03fb4 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03fb8 7435                           je         0x7fd1bc3f4aef
03fba 4983c202                       add        r10, 2
03fbe 4983fa2e                       cmp        r10, 0x2e
03fc2 75f0                           jne        0x7fd1bc3f4ab4
03fc4 41ba2a000000                   mov        r10d, 0x2a
03fca 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03fcf 7412                           je         0x7fd1bc3f4ae3
03fd1 4983c202                       add        r10, 2
03fd5 4983fa2e                       cmp        r10, 0x2e
03fd9 75ef                           jne        0x7fd1bc3f4aca
03fdb 41ba29000000                   mov        r10d, 0x29
03fe1 eb10                           jmp        0x7fd1bc3f4af3
03fe3 50                             push       rax
03fe4 4833c0                         xor        rax, rax
03fe7 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
03fec 58                             pop        rax
03fed ebbf                           jmp        0x7fd1bc3f4aae
03fef 4983c201                       add        r10, 1
03ff3 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03ff8 8b4808                         mov        ecx, dword ptr [rax + 8]
03ffb 48ba684b79b4d17f0000           movabs     rdx, 0x7fd1b4794b68
04005 4883827801000001               add        qword ptr [rdx + 0x178], 1
0400d 48ba383779b4d17f0000           movabs     rdx, 0x7fd1b4793738
04017 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
0401b 4183c002                       add        r8d, 2
0401f 44894270                       mov        dword ptr [rdx + 0x70], r8d
04023 4181e0feff1f00                 and        r8d, 0x1ffffe
0402a 4585c0                         test       r8d, r8d
0402d 0f8424150000                   je         0x7fd1bc3f6057
04033 48ba684b79b4d17f0000           movabs     rdx, 0x7fd1b4794b68
0403d 4883828801000001               add        qword ptr [rdx + 0x188], 1
04045 8bbc24a4020000                 mov        edi, dword ptr [rsp + 0x2a4]
0404c 4863df                         movsxd     rbx, edi
0404f ba0c000000                     mov        edx, 0xc
04054 4c8bcb                         mov        r9, rbx
04057 4c03ca                         add        r9, rdx
0405a 48ba202979b4d17f0000           movabs     rdx, 0x7fd1b4792920
04064 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
04068 4183c002                       add        r8d, 2
0406c 44894270                       mov        dword ptr [rdx + 0x70], r8d
04070 4181e0feff1f00                 and        r8d, 0x1ffffe
04077 4585c0                         test       r8d, r8d
0407a 0f84f8140000                   je         0x7fd1bc3f6078
04080 48ba202979b4d17f0000           movabs     rdx, 0x7fd1b4792920
0408a 488382d800000001               add        qword ptr [rdx + 0xd8], 1
04092 48ba982a79b4d17f0000           movabs     rdx, 0x7fd1b4792a98
0409c 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
040a0 4183c002                       add        r8d, 2
040a4 44894270                       mov        dword ptr [rdx + 0x70], r8d
040a8 4181e0feff1f00                 and        r8d, 0x1ffffe
040af 4585c0                         test       r8d, r8d
040b2 0f84e1140000                   je         0x7fd1bc3f6099
040b8 48ba684b79b4d17f0000           movabs     rdx, 0x7fd1b4794b68
040c2 488382a801000001               add        qword ptr [rdx + 0x1a8], 1
040ca 48ba48d688e200000000           movabs     rdx, 0xe288d648
040d4 ba02000000                     mov        edx, 2
040d9 4c8b842400020000               mov        r8, qword ptr [rsp + 0x200]
040e1 bf00000000                     mov        edi, 0
040e6 488b8424a8020000               mov        rax, qword ptr [rsp + 0x2a8]
040ee 48890424                       mov        qword ptr [rsp], rax
040f2 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
040fa 4889442408                     mov        qword ptr [rsp + 8], rax
040ff 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
04104 49ba48d688e200000000           movabs     r10, 0xe288d648
0410e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
04113 4889842400020000               mov        qword ptr [rsp + 0x200], rax
0411b 0f1f4000                       nop        dword ptr [rax]
0411f e83cbc5107                     call       0x7fd1c3910860
04124 0f1f84001c42001a               nop        dword ptr [rax + rax + 0x1a00421c]
0412c 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
04134 8bb42410020000                 mov        esi, dword ptr [rsp + 0x210]
0413b 4403ee                         add        r13d, esi
0413e 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
04148 ff8608060000                   inc        dword ptr [rsi + 0x608]
0414e 8bbc2468020000                 mov        edi, dword ptr [rsp + 0x268]
04155 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
0415f ff8600080000                   inc        dword ptr [rsi + 0x800]
04165 488bdf                         mov        rbx, rdi
04168 498bc5                         mov        rax, r13
0416b 8b942428020000                 mov        edx, dword ptr [rsp + 0x228]
04172 ffc2                           inc        edx
04174 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
0417e 8b4e74                         mov        ecx, dword ptr [rsi + 0x74]
04181 83c102                         add        ecx, 2
04184 894e74                         mov        dword ptr [rsi + 0x74], ecx
04187 81e1fe3f0000                   and        ecx, 0x3ffe
0418d 85c9                           test       ecx, ecx
0418f 0f8425140000                   je         0x7fd1bc3f60ba
04195 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
04199 418502                         test       dword ptr [r10], eax
0419c 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
041a6 ff8628080000                   inc        dword ptr [rsi + 0x828]
041ac 4c8bd8                         mov        r11, rax
041af 4c8bc3                         mov        r8, rbx
041b2 44899c2408020000               mov        dword ptr [rsp + 0x208], r11d
041ba e961c1ffff                     jmp        0x7fd1bc3f0e20
041bf 4585db                         test       r11d, r11d
041c2 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
041cc b980030000                     mov        ecx, 0x380
041d1 7e05                           jle        0x7fd1bc3f4cd8
041d3 b990030000                     mov        ecx, 0x390
041d8 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
041dc 4d8d4001                       lea        r8, [r8 + 1]
041e0 4c89040a                       mov        qword ptr [rdx + rcx], r8
041e4 0f8e5f010000                   jle        0x7fd1bc3f4e49
041ea 488bbc2430020000               mov        rdi, qword ptr [rsp + 0x230]
041f2 482bf7                         sub        rsi, rdi
041f5 ba00000000                     mov        edx, 0
041fa 483bf2                         cmp        rsi, rdx
041fd 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
04207 baa0030000                     mov        edx, 0x3a0
0420c 7d05                           jge        0x7fd1bc3f4d13
0420e bab0030000                     mov        edx, 0x3b0
04213 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
04217 488d4901                       lea        rcx, [rcx + 1]
0421b 48890c16                       mov        qword ptr [rsi + rdx], rcx
0421f 0f8d24010000                   jge        0x7fd1bc3f4e49
04225 488b942470010000               mov        rdx, qword ptr [rsp + 0x170]
0422d 488b7230                       mov        rsi, qword ptr [rdx + 0x30]
04231 ba00000000                     mov        edx, 0
04236 483bf2                         cmp        rsi, rdx
04239 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
04243 bac0030000                     mov        edx, 0x3c0
04248 7505                           jne        0x7fd1bc3f4d4f
0424a bad0030000                     mov        edx, 0x3d0
0424f 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
04253 488d4901                       lea        rcx, [rcx + 1]
04257 48890c16                       mov        qword ptr [rsi + rdx], rcx
0425b 0f85e8000000                   jne        0x7fd1bc3f4e49
04261 e9ed000000                     jmp        0x7fd1bc3f4e53
04266 498bd8                         mov        rbx, r8
04269 448b9c2408020000               mov        r11d, dword ptr [rsp + 0x208]
04271 488bf0                         mov        rsi, rax
04274 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
0427c 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
04284 4c8bee                         mov        r13, rsi
04287 442beb                         sub        r13d, ebx
0428a 48bee86872b4d17f0000           movabs     rsi, 0x7fd1b47268e8
04294 4883864008000001               add        qword ptr [rsi + 0x840], 1
0429c 488bf2                         mov        rsi, rdx
0429f 488bd3                         mov        rdx, rbx
042a2 488bc8                         mov        rcx, rax
042a5 4d8bc3                         mov        r8, r11
042a8 4d8bcd                         mov        r9, r13
042ab 44899c2408020000               mov        dword ptr [rsp + 0x208], r11d
042b3 4489ac24b0020000               mov        dword ptr [rsp + 0x2b0], r13d
042bb 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
042c0 4c89442408                     mov        qword ptr [rsp + 8], r8
042c5 48890c24                       mov        qword ptr [rsp], rcx
042c9 4889542418                     mov        qword ptr [rsp + 0x18], rdx
042ce 4889742420                     mov        qword ptr [rsp + 0x20], rsi
042d3 488bfe                         mov        rdi, rsi
042d6 488bf2                         mov        rsi, rdx
042d9 488bd1                         mov        rdx, rcx
042dc 498bc8                         mov        rcx, r8
042df 4d8bc1                         mov        r8, r9
042e2 e8599a5007                     call       0x7fd1c38fe840
042e7 85c0                           test       eax, eax
042e9 0f842b000000                   je         0x7fd1bc3f4e1a
042ef 488bf8                         mov        rdi, rax
042f2 83f7ff                         xor        edi, 0xffffffff
042f5 488b0c24                       mov        rcx, qword ptr [rsp]
042f9 4c8b442408                     mov        r8, qword ptr [rsp + 8]
042fe 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
04303 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
04308 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
0430d 442bcf                         sub        r9d, edi
04310 03d7                           add        edx, edi
04312 4403c7                         add        r8d, edi
04315 e9c6120000                     jmp        0x7fd1bc3f60e0
0431a 448bac24b0020000               mov        r13d, dword ptr [rsp + 0x2b0]
04322 4403ac2408020000               add        r13d, dword ptr [rsp + 0x208]
0432a 488b942470010000               mov        rdx, qword ptr [rsp + 0x170]
04332 44896a3c                       mov        dword ptr [rdx + 0x3c], r13d
04336 4881c4e0020000                 add        rsp, 0x2e0
0433d 5d                             pop        rbp
0433e 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
04342 0f87ae120000                   ja         0x7fd1bc3f60f6
04348 c3                             ret        
04349 bb02000000                     mov        ebx, 2
0434e e915000000                     jmp        0x7fd1bc3f4e68
04353 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
0435d ff82e0030000                   inc        dword ptr [rdx + 0x3e0]
04363 bb08000000                     mov        ebx, 8
04368 899c24b4020000                 mov        dword ptr [rsp + 0x2b4], ebx
0436f 90                             nop        
04370 e9a6120000                     jmp        0x7fd1bc3f611b
04375 90                             nop        
04376 90                             nop        
04377 90                             nop        
04378 90                             nop        
04379 90                             nop        
0437a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04381 0f85a3120000                   jne        0x7fd1bc3f612a
04387 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
0438e 488d7828                       lea        rdi, [rax + 0x28]
04392 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
04399 0f878b120000                   ja         0x7fd1bc3f612a
0439f 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
043a6 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
043ad 488908                         mov        qword ptr [rax], rcx
043b0 4833c9                         xor        rcx, rcx
043b3 48894808                       mov        qword ptr [rax + 8], rcx
043b7 48894810                       mov        qword ptr [rax + 0x10], rcx
043bb 48894818                       mov        qword ptr [rax + 0x18], rcx
043bf 48894820                       mov        qword ptr [rax + 0x20], rcx
043c3 0f1f440000                     nop        dword ptr [rax + rax]
043c8 e979120000                     jmp        0x7fd1bc3f6146
043cd 90                             nop        
043ce 90                             nop        
043cf 90                             nop        
043d0 90                             nop        
043d1 90                             nop        
043d2 498bf3                         mov        rsi, r11
043d5 48898424b8020000               mov        qword ptr [rsp + 0x2b8], rax
043dd 6690                           nop        
043df e87cb95107                     call       0x7fd1c3910860
043e4 0f1f8400dc44001c               nop        dword ptr [rax + rax + 0x1c0044dc]
043ec 48bae86872b4d17f0000           movabs     rdx, 0x7fd1b47268e8
043f6 488d9208040000                 lea        rdx, [rdx + 0x408]
043fd 4885c0                         test       rax, rax
04400 750a                           jne        0x7fd1bc3f4f0c
04402 f60201                         test       byte ptr [rdx], 1
04405 7505                           jne        0x7fd1bc3f4f0c
04407 f048830a01                     lock or    qword ptr [rdx], 1
0440c 488b9424b8020000               mov        rdx, qword ptr [rsp + 0x2b8]
04414 48b9e86872b4d17f0000           movabs     rcx, 0x7fd1b47268e8
0441e 4883811804000001               add        qword ptr [rcx + 0x418], 1
04426 8b9424b4020000                 mov        edx, dword ptr [rsp + 0x2b4]
0442d 488bc8                         mov        rcx, rax
04430 488bb424b8020000               mov        rsi, qword ptr [rsp + 0x2b8]
04438 0f1f8000000000                 nop        dword ptr [rax]
0443f e81caf5107                     call       0x7fd1c390fe60
04444 0f1f84003c45001d               nop        dword ptr [rax + rax + 0x1d00453c]
0444c 488b8424b8020000               mov        rax, qword ptr [rsp + 0x2b8]
04454 e96a120000                     jmp        0x7fd1bc3f61c3
04459 0f1f8000000000                 nop        dword ptr [rax]
04460 e9fa110000                     jmp        0x7fd1bc3f615f
04465 90                             nop        
04466 90                             nop        
04467 90                             nop        
04468 90                             nop        
04469 90                             nop        
0446a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04471 0f85f7110000                   jne        0x7fd1bc3f616e
04477 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
0447e 488d7828                       lea        rdi, [rax + 0x28]
04482 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
04489 0f87df110000                   ja         0x7fd1bc3f616e
0448f 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
04496 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0449d 488908                         mov        qword ptr [rax], rcx
044a0 4833c9                         xor        rcx, rcx
044a3 48894808                       mov        qword ptr [rax + 8], rcx
044a7 48894810                       mov        qword ptr [rax + 0x10], rcx
044ab 48894818                       mov        qword ptr [rax + 0x18], rcx
044af 48894820                       mov        qword ptr [rax + 0x20], rcx
044b3 488bd0                         mov        rdx, rax
044b6 48b9e86872b4d17f0000           movabs     rcx, 0x7fd1b47268e8
044c0 4883815002000001               add        qword ptr [rcx + 0x250], 1
044c8 ba02000000                     mov        edx, 2
044cd 48b9306326e200000000           movabs     rcx, 0xe2266330
044d7 488bf0                         mov        rsi, rax
044da 48898424c0020000               mov        qword ptr [rsp + 0x2c0], rax
044e2 0f1f440000                     nop        dword ptr [rax + rax]
044e7 e874ae5107                     call       0x7fd1c390fe60
044ec 0f1f8400e445001e               nop        dword ptr [rax + rax + 0x1e0045e4]
044f4 488b8424c0020000               mov        rax, qword ptr [rsp + 0x2c0]
044fc e9c2110000                     jmp        0x7fd1bc3f61c3
04501 0f1f8000000000                 nop        dword ptr [rax]
04508 e97d110000                     jmp        0x7fd1bc3f618a
0450d 90                             nop        
0450e 90                             nop        
0450f 90                             nop        
04510 90                             nop        
04511 90                             nop        
04512 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04519 0f857a110000                   jne        0x7fd1bc3f6199
0451f 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
04526 488d7828                       lea        rdi, [rax + 0x28]
0452a 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
04531 0f8762110000                   ja         0x7fd1bc3f6199
04537 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
0453e 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
04545 488908                         mov        qword ptr [rax], rcx
04548 4833c9                         xor        rcx, rcx
0454b 48894808                       mov        qword ptr [rax + 8], rcx
0454f 48894810                       mov        qword ptr [rax + 0x10], rcx
04553 48894818                       mov        qword ptr [rax + 0x18], rcx
04557 48894820                       mov        qword ptr [rax + 0x20], rcx
0455b 488bd0                         mov        rdx, rax
0455e 48b9e86872b4d17f0000           movabs     rcx, 0x7fd1b47268e8
04568 4883813801000001               add        qword ptr [rcx + 0x138], 1
04570 ba05000000                     mov        edx, 5
04575 48b9706326e200000000           movabs     rcx, 0xe2266370
0457f 488bf0                         mov        rsi, rax
04582 48898424c8020000               mov        qword ptr [rsp + 0x2c8], rax
0458a 0f1f440000                     nop        dword ptr [rax + rax]
0458f e8ccad5107                     call       0x7fd1c390fe60
04594 0f1f84008c46001f               nop        dword ptr [rax + rax + 0x1f00468c]
0459c 488b8424c8020000               mov        rax, qword ptr [rsp + 0x2c8]
045a4 e91a110000                     jmp        0x7fd1bc3f61c3
045a9 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
045b0 55                             push       rbp
045b1 4881ece0020000                 sub        rsp, 0x2e0
045b8 41817f2000000000               cmp        dword ptr [r15 + 0x20], 0
045c0 7405                           je         0x7fd1bc3f50c7
045c2 e8d9a95007                     call       0x7fd1c38ffaa0
045c7 bf40010000                     mov        edi, 0x140
045cc 4863ff                         movsxd     rdi, edi
045cf 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
045d3 48899c2480010000               mov        qword ptr [rsp + 0x180], rbx
045db bf38010000                     mov        edi, 0x138
045e0 4863ff                         movsxd     rdi, edi
045e3 488b043e                       mov        rax, qword ptr [rsi + rdi]
045e7 4889842488010000               mov        qword ptr [rsp + 0x188], rax
045ef bf30010000                     mov        edi, 0x130
045f4 4863ff                         movsxd     rdi, edi
045f7 8b143e                         mov        edx, dword ptr [rsi + rdi]
045fa bf28010000                     mov        edi, 0x128
045ff 4863ff                         movsxd     rdi, edi
04602 488b0c3e                       mov        rcx, qword ptr [rsi + rdi]
04606 bf20010000                     mov        edi, 0x120
0460b 4863ff                         movsxd     rdi, edi
0460e 4c8b043e                       mov        r8, qword ptr [rsi + rdi]
04612 bf18010000                     mov        edi, 0x118
04617 4863ff                         movsxd     rdi, edi
0461a 448b0c3e                       mov        r9d, dword ptr [rsi + rdi]
0461e bf08010000                     mov        edi, 0x108
04623 4863ff                         movsxd     rdi, edi
04626 4c8b1c3e                       mov        r11, qword ptr [rsi + rdi]
0462a bf00010000                     mov        edi, 0x100
0462f 4863ff                         movsxd     rdi, edi
04632 4c8b2c3e                       mov        r13, qword ptr [rsi + rdi]
04636 bff8000000                     mov        edi, 0xf8
0463b 4863ff                         movsxd     rdi, edi
0463e 448b343e                       mov        r14d, dword ptr [rsi + rdi]
04642 bff0000000                     mov        edi, 0xf0
04647 4863ff                         movsxd     rdi, edi
0464a 8b3c3e                         mov        edi, dword ptr [rsi + rdi]
0464d bbe8000000                     mov        ebx, 0xe8
04652 4863db                         movsxd     rbx, ebx
04655 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
04658 899c247c010000                 mov        dword ptr [rsp + 0x17c], ebx
0465f bbd8000000                     mov        ebx, 0xd8
04664 4863db                         movsxd     rbx, ebx
04667 488b041e                       mov        rax, qword ptr [rsi + rbx]
0466b 4889842498010000               mov        qword ptr [rsp + 0x198], rax
04673 bba0000000                     mov        ebx, 0xa0
04678 4863db                         movsxd     rbx, ebx
0467b 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
0467e 899c2490010000                 mov        dword ptr [rsp + 0x190], ebx
04685 bb90000000                     mov        ebx, 0x90
0468a 4863db                         movsxd     rbx, ebx
0468d 488b041e                       mov        rax, qword ptr [rsi + rbx]
04691 48898424a0010000               mov        qword ptr [rsp + 0x1a0], rax
04699 bb80000000                     mov        ebx, 0x80
0469e 4863db                         movsxd     rbx, ebx
046a1 488b041e                       mov        rax, qword ptr [rsi + rbx]
046a5 bb78000000                     mov        ebx, 0x78
046aa 4863db                         movsxd     rbx, ebx
046ad 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
046b0 899c2494010000                 mov        dword ptr [rsp + 0x194], ebx
046b7 bb70000000                     mov        ebx, 0x70
046bc 4863db                         movsxd     rbx, ebx
046bf 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
046c2 899c24a8010000                 mov        dword ptr [rsp + 0x1a8], ebx
046c9 bb68000000                     mov        ebx, 0x68
046ce 4863db                         movsxd     rbx, ebx
046d1 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
046d4 89bc24ac010000                 mov        dword ptr [rsp + 0x1ac], edi
046db 488bfe                         mov        rdi, rsi
046de 899424d4010000                 mov        dword ptr [rsp + 0x1d4], edx
046e5 48898c24e0010000               mov        qword ptr [rsp + 0x1e0], rcx
046ed 4c898424d8010000               mov        qword ptr [rsp + 0x1d8], r8
046f5 44898c24d0010000               mov        dword ptr [rsp + 0x1d0], r9d
046fd 4c899c24c8010000               mov        qword ptr [rsp + 0x1c8], r11
04705 4c89ac24c0010000               mov        qword ptr [rsp + 0x1c0], r13
0470d 4489b424b4010000               mov        dword ptr [rsp + 0x1b4], r14d
04715 48898424b8010000               mov        qword ptr [rsp + 0x1b8], rax
0471d 899c24b0010000                 mov        dword ptr [rsp + 0x1b0], ebx
04724 e8d754f820                     call       0x7fd1dd37a700
04729 0f1f840000000000               nop        dword ptr [rax + rax]
04731 8b9c24b0010000                 mov        ebx, dword ptr [rsp + 0x1b0]
04738 488bd3                         mov        rdx, rbx
0473b 8b9c24a8010000                 mov        ebx, dword ptr [rsp + 0x1a8]
04742 4c8bcb                         mov        r9, rbx
04745 8b9c2494010000                 mov        ebx, dword ptr [rsp + 0x194]
0474c 488bf3                         mov        rsi, rbx
0474f 488b8424b8010000               mov        rax, qword ptr [rsp + 0x1b8]
04757 488bc8                         mov        rcx, rax
0475a 488b8424a0010000               mov        rax, qword ptr [rsp + 0x1a0]
04762 4c8bc0                         mov        r8, rax
04765 8b9c2490010000                 mov        ebx, dword ptr [rsp + 0x190]
0476c 488bfb                         mov        rdi, rbx
0476f 488b842498010000               mov        rax, qword ptr [rsp + 0x198]
04777 4c8bf0                         mov        r14, rax
0477a 8b9c247c010000                 mov        ebx, dword ptr [rsp + 0x17c]
04781 4c8beb                         mov        r13, rbx
04784 8b9c24ac010000                 mov        ebx, dword ptr [rsp + 0x1ac]
0478b 8b8424b4010000                 mov        eax, dword ptr [rsp + 0x1b4]
04792 4c8bd8                         mov        r11, rax
04795 488b8424c0010000               mov        rax, qword ptr [rsp + 0x1c0]
0479d 899c24e8010000                 mov        dword ptr [rsp + 0x1e8], ebx
047a4 488b9c24c8010000               mov        rbx, qword ptr [rsp + 0x1c8]
047ac 48899c2450010000               mov        qword ptr [rsp + 0x150], rbx
047b4 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
047bb 899c2444010000                 mov        dword ptr [rsp + 0x144], ebx
047c2 488b9c24d8010000               mov        rbx, qword ptr [rsp + 0x1d8]
047ca 48899c2458010000               mov        qword ptr [rsp + 0x158], rbx
047d2 488b9c24e0010000               mov        rbx, qword ptr [rsp + 0x1e0]
047da 48899c2460010000               mov        qword ptr [rsp + 0x160], rbx
047e2 8b9c24d4010000                 mov        ebx, dword ptr [rsp + 0x1d4]
047e9 899c2478010000                 mov        dword ptr [rsp + 0x178], ebx
047f0 488b9c2488010000               mov        rbx, qword ptr [rsp + 0x188]
047f8 48899c2468010000               mov        qword ptr [rsp + 0x168], rbx
04800 488b9c2480010000               mov        rbx, qword ptr [rsp + 0x180]
04808 48899c2470010000               mov        qword ptr [rsp + 0x170], rbx
04810 44898c24f8010000               mov        dword ptr [rsp + 0x1f8], r9d
04818 89b424ec010000                 mov        dword ptr [rsp + 0x1ec], esi
0481f 48898c24f0010000               mov        qword ptr [rsp + 0x1f0], rcx
04827 4c89842418020000               mov        qword ptr [rsp + 0x218], r8
0482f 89bc240c020000                 mov        dword ptr [rsp + 0x20c], edi
04836 4c89b42420020000               mov        qword ptr [rsp + 0x220], r14
0483e 4489ac24fc010000               mov        dword ptr [rsp + 0x1fc], r13d
04846 448b8424e8010000               mov        r8d, dword ptr [rsp + 0x1e8]
0484e 44899c2408020000               mov        dword ptr [rsp + 0x208], r11d
04856 4889842400020000               mov        qword ptr [rsp + 0x200], rax
0485e e9bdbaffff                     jmp        0x7fd1bc3f0e20
04863 49bad8e570b4d17f0000           movabs     r10, 0x7fd1b470e5d8
0486d 4c89542408                     mov        qword ptr [rsp + 8], r10
04872 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0487a e8e1565e07                     call       0x7fd1c39daa60
0487f e9f9b7ffff                     jmp        0x7fd1bc3f0b7d
04884 49ba302619b4d17f0000           movabs     r10, 0x7fd1b4192630
0488e 4c89542408                     mov        qword ptr [rsp + 8], r10
04893 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0489b e8c0565e07                     call       0x7fd1c39daa60
048a0 e945b9ffff                     jmp        0x7fd1bc3f0cea
048a5 e8b60c5507                     call       0x7fd1c3946060
048aa e8b10c5507                     call       0x7fd1c3946060
048af e8ac0c5507                     call       0x7fd1c3946060
048b4 48891424                       mov        qword ptr [rsp], rdx
048b8 4889742408                     mov        qword ptr [rsp + 8], rsi
048bd e89e155507                     call       0x7fd1c3946960
048c2 e8990c5507                     call       0x7fd1c3946060
048c7 e8940c5507                     call       0x7fd1c3946060
048cc 48891424                       mov        qword ptr [rsp], rdx
048d0 48897c2408                     mov        qword ptr [rsp + 8], rdi
048d5 e886155507                     call       0x7fd1c3946960
048da e8810c5507                     call       0x7fd1c3946060
048df e87c0c5507                     call       0x7fd1c3946060
048e4 48c7042401000000               mov        qword ptr [rsp], 1
048ec 4c894c2408                     mov        qword ptr [rsp + 8], r9
048f1 e86a155507                     call       0x7fd1c3946960
048f6 48c7042402000000               mov        qword ptr [rsp], 2
048fe 4c894c2408                     mov        qword ptr [rsp + 8], r9
04903 e858155507                     call       0x7fd1c3946960
04908 48c7042400000000               mov        qword ptr [rsp], 0
04910 4c894c2408                     mov        qword ptr [rsp + 8], r9
04915 e846155507                     call       0x7fd1c3946960
0491a 48c7042401000000               mov        qword ptr [rsp], 1
04922 4c894c2408                     mov        qword ptr [rsp + 8], r9
04927 e834155507                     call       0x7fd1c3946960
0492c 48c7042400000000               mov        qword ptr [rsp], 0
04934 4c894c2408                     mov        qword ptr [rsp + 8], r9
04939 e822155507                     call       0x7fd1c3946960
0493e 49ba807963b4d17f0000           movabs     r10, 0x7fd1b4637980
04948 4c89542408                     mov        qword ptr [rsp + 8], r10
0494d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04955 e806565e07                     call       0x7fd1c39daa60
0495a e949bfffff                     jmp        0x7fd1bc3f13a8
0495f e8fc0b5507                     call       0x7fd1c3946060
04964 49ba185278b4d17f0000           movabs     r10, 0x7fd1b4785218
0496e 4c89542408                     mov        qword ptr [rsp + 8], r10
04973 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0497b e8e0555e07                     call       0x7fd1c39daa60
04980 e9d0bfffff                     jmp        0x7fd1bc3f1455
04985 49ba30f516b4d17f0000           movabs     r10, 0x7fd1b416f530
0498f 4c89542408                     mov        qword ptr [rsp + 8], r10
04994 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0499c e8bf555e07                     call       0x7fd1c39daa60
049a1 e9f2bfffff                     jmp        0x7fd1bc3f1498
049a6 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
049ae e82d375e07                     call       0x7fd1c39d8be0
049b3 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
049bb e820375e07                     call       0x7fd1c39d8be0
049c0 49ba08f168b4d17f0000           movabs     r10, 0x7fd1b468f108
049ca 4c89542408                     mov        qword ptr [rsp + 8], r10
049cf 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049d7 e884555e07                     call       0x7fd1c39daa60
049dc e990c0ffff                     jmp        0x7fd1bc3f1571
049e1 49bab85969b4d17f0000           movabs     r10, 0x7fd1b46959b8
049eb 4c89542408                     mov        qword ptr [rsp + 8], r10
049f0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049f8 e863555e07                     call       0x7fd1c39daa60
049fd e9a7c0ffff                     jmp        0x7fd1bc3f15a9
04a02 49ba28166cb4d17f0000           movabs     r10, 0x7fd1b46c1628
04a0c 4c89542408                     mov        qword ptr [rsp + 8], r10
04a11 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a19 e842555e07                     call       0x7fd1c39daa60
04a1e e9f6c0ffff                     jmp        0x7fd1bc3f1619
04a23 49ba489363b4d17f0000           movabs     r10, 0x7fd1b4639348
04a2d 4c89542408                     mov        qword ptr [rsp + 8], r10
04a32 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a3a e821555e07                     call       0x7fd1c39daa60
04a3f e90dc1ffff                     jmp        0x7fd1bc3f1651
04a44 49ba58d96bb4d17f0000           movabs     r10, 0x7fd1b46bd958
04a4e 4c89542408                     mov        qword ptr [rsp + 8], r10
04a53 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a5b e800555e07                     call       0x7fd1c39daa60
04a60 e924c1ffff                     jmp        0x7fd1bc3f1689
04a65 49bab0ab63b4d17f0000           movabs     r10, 0x7fd1b463abb0
04a6f 4c89542408                     mov        qword ptr [rsp + 8], r10
04a74 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a7c e8df545e07                     call       0x7fd1c39daa60
04a81 e918c2ffff                     jmp        0x7fd1bc3f179e
04a86 49ba48d640b4d17f0000           movabs     r10, 0x7fd1b440d648
04a90 4c89542408                     mov        qword ptr [rsp + 8], r10
04a95 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a9d e8be545e07                     call       0x7fd1c39daa60
04aa2 e93dc2ffff                     jmp        0x7fd1bc3f17e4
04aa7 49bab8af3bb4d17f0000           movabs     r10, 0x7fd1b43bafb8
04ab1 4c89542408                     mov        qword ptr [rsp + 8], r10
04ab6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04abe e89d545e07                     call       0x7fd1c39daa60
04ac3 e954c2ffff                     jmp        0x7fd1bc3f181c
04ac8 48890424                       mov        qword ptr [rsp], rax
04acc e80f1d5e07                     call       0x7fd1c39d72e0
04ad1 e88a0a5507                     call       0x7fd1c3946060
04ad6 49ba108763b4d17f0000           movabs     r10, 0x7fd1b4638710
04ae0 4c89542408                     mov        qword ptr [rsp + 8], r10
04ae5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04aed e86e545e07                     call       0x7fd1c39daa60
04af2 e9e3c3ffff                     jmp        0x7fd1bc3f19da
04af7 e8640a5507                     call       0x7fd1c3946060
04afc 49ba185278b4d17f0000           movabs     r10, 0x7fd1b4785218
04b06 4c89542408                     mov        qword ptr [rsp + 8], r10
04b0b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b13 e848545e07                     call       0x7fd1c39daa60
04b18 e985c4ffff                     jmp        0x7fd1bc3f1aa2
04b1d 49ba30f516b4d17f0000           movabs     r10, 0x7fd1b416f530
04b27 4c89542408                     mov        qword ptr [rsp + 8], r10
04b2c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b34 e827545e07                     call       0x7fd1c39daa60
04b39 e9a2c4ffff                     jmp        0x7fd1bc3f1ae0
04b3e 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04b46 e895355e07                     call       0x7fd1c39d8be0
04b4b 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04b53 e888355e07                     call       0x7fd1c39d8be0
04b58 e8030a5507                     call       0x7fd1c3946060
04b5d 49bab0ab63b4d17f0000           movabs     r10, 0x7fd1b463abb0
04b67 4c89542408                     mov        qword ptr [rsp + 8], r10
04b6c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b74 e8e7535e07                     call       0x7fd1c39daa60
04b79 e955c6ffff                     jmp        0x7fd1bc3f1cd3
04b7e 49ba48d640b4d17f0000           movabs     r10, 0x7fd1b440d648
04b88 4c89542408                     mov        qword ptr [rsp + 8], r10
04b8d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b95 e8c6535e07                     call       0x7fd1c39daa60
04b9a e981c6ffff                     jmp        0x7fd1bc3f1d20
04b9f 49bab8af3bb4d17f0000           movabs     r10, 0x7fd1b43bafb8
04ba9 4c89542408                     mov        qword ptr [rsp + 8], r10
04bae 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bb6 e8a5535e07                     call       0x7fd1c39daa60
04bbb e998c6ffff                     jmp        0x7fd1bc3f1d58
04bc0 49ba807963b4d17f0000           movabs     r10, 0x7fd1b4637980
04bca 4c89542408                     mov        qword ptr [rsp + 8], r10
04bcf 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bd7 e884535e07                     call       0x7fd1c39daa60
04bdc e997c7ffff                     jmp        0x7fd1bc3f1e78
04be1 e87a095507                     call       0x7fd1c3946060
04be6 49ba185278b4d17f0000           movabs     r10, 0x7fd1b4785218
04bf0 4c89542408                     mov        qword ptr [rsp + 8], r10
04bf5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bfd e85e535e07                     call       0x7fd1c39daa60
04c02 e91ec8ffff                     jmp        0x7fd1bc3f1f25
04c07 49ba30f516b4d17f0000           movabs     r10, 0x7fd1b416f530
04c11 4c89542408                     mov        qword ptr [rsp + 8], r10
04c16 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c1e e83d535e07                     call       0x7fd1c39daa60
04c23 e938c8ffff                     jmp        0x7fd1bc3f1f60
04c28 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04c30 e8ab345e07                     call       0x7fd1c39d8be0
04c35 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04c3d e89e345e07                     call       0x7fd1c39d8be0
04c42 49ba08f168b4d17f0000           movabs     r10, 0x7fd1b468f108
04c4c 4c89542408                     mov        qword ptr [rsp + 8], r10
04c51 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c59 e802535e07                     call       0x7fd1c39daa60
04c5e e9cbc8ffff                     jmp        0x7fd1bc3f202e
04c63 49bab85969b4d17f0000           movabs     r10, 0x7fd1b46959b8
04c6d 4c89542408                     mov        qword ptr [rsp + 8], r10
04c72 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c7a e8e1525e07                     call       0x7fd1c39daa60
04c7f e9e2c8ffff                     jmp        0x7fd1bc3f2066
04c84 49ba28166cb4d17f0000           movabs     r10, 0x7fd1b46c1628
04c8e 4c89542408                     mov        qword ptr [rsp + 8], r10
04c93 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c9b e8c0525e07                     call       0x7fd1c39daa60
04ca0 e91bc9ffff                     jmp        0x7fd1bc3f20c0
04ca5 49ba489363b4d17f0000           movabs     r10, 0x7fd1b4639348
04caf 4c89542408                     mov        qword ptr [rsp + 8], r10
04cb4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cbc e89f525e07                     call       0x7fd1c39daa60
04cc1 e932c9ffff                     jmp        0x7fd1bc3f20f8
04cc6 49ba58d96bb4d17f0000           movabs     r10, 0x7fd1b46bd958
04cd0 4c89542408                     mov        qword ptr [rsp + 8], r10
04cd5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cdd e87e525e07                     call       0x7fd1c39daa60
04ce2 e949c9ffff                     jmp        0x7fd1bc3f2130
04ce7 49bab0ab63b4d17f0000           movabs     r10, 0x7fd1b463abb0
04cf1 4c89542408                     mov        qword ptr [rsp + 8], r10
04cf6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cfe e85d525e07                     call       0x7fd1c39daa60
04d03 e93dcaffff                     jmp        0x7fd1bc3f2245
04d08 49ba48d640b4d17f0000           movabs     r10, 0x7fd1b440d648
04d12 4c89542408                     mov        qword ptr [rsp + 8], r10
04d17 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d1f e83c525e07                     call       0x7fd1c39daa60
04d24 e962caffff                     jmp        0x7fd1bc3f228b
04d29 49bab8af3bb4d17f0000           movabs     r10, 0x7fd1b43bafb8
04d33 4c89542408                     mov        qword ptr [rsp + 8], r10
04d38 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d40 e81b525e07                     call       0x7fd1c39daa60
04d45 e979caffff                     jmp        0x7fd1bc3f22c3
04d4a 48890424                       mov        qword ptr [rsp], rax
04d4e e88d1a5e07                     call       0x7fd1c39d72e0
04d53 e808085507                     call       0x7fd1c3946060
04d58 49ba108763b4d17f0000           movabs     r10, 0x7fd1b4638710
04d62 4c89542408                     mov        qword ptr [rsp + 8], r10
04d67 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d6f e8ec515e07                     call       0x7fd1c39daa60
04d74 e911ccffff                     jmp        0x7fd1bc3f248a
04d79 e8e2075507                     call       0x7fd1c3946060
04d7e 49ba185278b4d17f0000           movabs     r10, 0x7fd1b4785218
04d88 4c89542408                     mov        qword ptr [rsp + 8], r10
04d8d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d95 e8c6515e07                     call       0x7fd1c39daa60
04d9a e9b3ccffff                     jmp        0x7fd1bc3f2552
04d9f 49ba30f516b4d17f0000           movabs     r10, 0x7fd1b416f530
04da9 4c89542408                     mov        qword ptr [rsp + 8], r10
04dae 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04db6 e8a5515e07                     call       0x7fd1c39daa60
04dbb e9d0ccffff                     jmp        0x7fd1bc3f2590
04dc0 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04dc8 e813335e07                     call       0x7fd1c39d8be0
04dcd 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04dd5 e806335e07                     call       0x7fd1c39d8be0
04dda e881075507                     call       0x7fd1c3946060
04ddf 49bab0ab63b4d17f0000           movabs     r10, 0x7fd1b463abb0
04de9 4c89542408                     mov        qword ptr [rsp + 8], r10
04dee 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04df6 e865515e07                     call       0x7fd1c39daa60
04dfb e983ceffff                     jmp        0x7fd1bc3f2783
04e00 49ba48d640b4d17f0000           movabs     r10, 0x7fd1b440d648
04e0a 4c89542408                     mov        qword ptr [rsp + 8], r10
04e0f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e17 e844515e07                     call       0x7fd1c39daa60
04e1c e9afceffff                     jmp        0x7fd1bc3f27d0
04e21 49bab8af3bb4d17f0000           movabs     r10, 0x7fd1b43bafb8
04e2b 4c89542408                     mov        qword ptr [rsp + 8], r10
04e30 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e38 e823515e07                     call       0x7fd1c39daa60
04e3d e9c6ceffff                     jmp        0x7fd1bc3f2808
04e42 49bad8e570b4d17f0000           movabs     r10, 0x7fd1b470e5d8
04e4c 4c89542408                     mov        qword ptr [rsp + 8], r10
04e51 48c704240a020000               mov        qword ptr [rsp], 0x20a
04e59 e802515e07                     call       0x7fd1c39daa60
04e5e e96ccfffff                     jmp        0x7fd1bc3f28cf
04e63 0f1f4000                       nop        dword ptr [rax]
04e67 e8f4ae5107                     call       0x7fd1c3910860
04e6c e940d0ffff                     jmp        0x7fd1bc3f29b1
04e71 660f1f440000                   nop        word ptr [rax + rax]
04e77 e8e4ae5107                     call       0x7fd1c3910860
04e7c e9a1d1ffff                     jmp        0x7fd1bc3f2b22
04e81 49ba680d71b4d17f0000           movabs     r10, 0x7fd1b4710d68
04e8b 4c89542408                     mov        qword ptr [rsp + 8], r10
04e90 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e98 e8c3505e07                     call       0x7fd1c39daa60
04e9d e900d2ffff                     jmp        0x7fd1bc3f2ba2
04ea2 49bac0ec60b4d17f0000           movabs     r10, 0x7fd1b460ecc0
04eac 4c89542408                     mov        qword ptr [rsp + 8], r10
04eb1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04eb9 e8a2505e07                     call       0x7fd1c39daa60
04ebe e986d2ffff                     jmp        0x7fd1bc3f2c49
04ec3 49ba000d09b4d17f0000           movabs     r10, 0x7fd1b4090d00
04ecd 4c89542408                     mov        qword ptr [rsp + 8], r10
04ed2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04eda e881505e07                     call       0x7fd1c39daa60
04edf e9f8d2ffff                     jmp        0x7fd1bc3f2cdc
04ee4 49ba78b661b4d17f0000           movabs     r10, 0x7fd1b461b678
04eee 4c89542408                     mov        qword ptr [rsp + 8], r10
04ef3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04efb e860505e07                     call       0x7fd1c39daa60
04f00 e99ad3ffff                     jmp        0x7fd1bc3f2d9f
04f05 49ba50fc61b4d17f0000           movabs     r10, 0x7fd1b461fc50
04f0f 4c89542408                     mov        qword ptr [rsp + 8], r10
04f14 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f1c e83f505e07                     call       0x7fd1c39daa60
04f21 e90ed4ffff                     jmp        0x7fd1bc3f2e34
04f26 48890424                       mov        qword ptr [rsp], rax
04f2a e8b1185e07                     call       0x7fd1c39d72e0
04f2f 49ba38fb61b4d17f0000           movabs     r10, 0x7fd1b461fb38
04f39 4c89542408                     mov        qword ptr [rsp + 8], r10
04f3e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f46 e815505e07                     call       0x7fd1c39daa60
04f4b e9c6d4ffff                     jmp        0x7fd1bc3f2f16
04f50 e80b065507                     call       0x7fd1c3946060
04f55 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04f5d e87e315e07                     call       0x7fd1c39d8be0
04f62 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04f6a e871315e07                     call       0x7fd1c39d8be0
04f6f 49bad8e570b4d17f0000           movabs     r10, 0x7fd1b470e5d8
04f79 4c89542408                     mov        qword ptr [rsp + 8], r10
04f7e 48c70424aa020000               mov        qword ptr [rsp], 0x2aa
04f86 e8d54f5e07                     call       0x7fd1c39daa60
04f8b e9f4d5ffff                     jmp        0x7fd1bc3f3084
04f90 49ba807963b4d17f0000           movabs     r10, 0x7fd1b4637980
04f9a 4c89542408                     mov        qword ptr [rsp + 8], r10
04f9f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04fa7 e8b44f5e07                     call       0x7fd1c39daa60
04fac e9d1d6ffff                     jmp        0x7fd1bc3f3182
04fb1 e8aa055507                     call       0x7fd1c3946060
04fb6 49ba185278b4d17f0000           movabs     r10, 0x7fd1b4785218
04fc0 4c89542408                     mov        qword ptr [rsp + 8], r10
04fc5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04fcd e88e4f5e07                     call       0x7fd1c39daa60
04fd2 e954d7ffff                     jmp        0x7fd1bc3f322b
04fd7 49ba30f516b4d17f0000           movabs     r10, 0x7fd1b416f530
04fe1 4c89542408                     mov        qword ptr [rsp + 8], r10
04fe6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04fee e86d4f5e07                     call       0x7fd1c39daa60
04ff3 e96cd7ffff                     jmp        0x7fd1bc3f3264
04ff8 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05000 e8db305e07                     call       0x7fd1c39d8be0
05005 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0500d e8ce305e07                     call       0x7fd1c39d8be0
05012 49ba08f168b4d17f0000           movabs     r10, 0x7fd1b468f108
0501c 4c89542408                     mov        qword ptr [rsp + 8], r10
05021 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05029 e8324f5e07                     call       0x7fd1c39daa60
0502e e900d8ffff                     jmp        0x7fd1bc3f3333
05033 49bab85969b4d17f0000           movabs     r10, 0x7fd1b46959b8
0503d 4c89542408                     mov        qword ptr [rsp + 8], r10
05042 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0504a e8114f5e07                     call       0x7fd1c39daa60
0504f e912d8ffff                     jmp        0x7fd1bc3f3366
05054 49ba28166cb4d17f0000           movabs     r10, 0x7fd1b46c1628
0505e 4c89542408                     mov        qword ptr [rsp + 8], r10
05063 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0506b e8f04e5e07                     call       0x7fd1c39daa60
05070 e955d8ffff                     jmp        0x7fd1bc3f33ca
05075 49ba489363b4d17f0000           movabs     r10, 0x7fd1b4639348
0507f 4c89542408                     mov        qword ptr [rsp + 8], r10
05084 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0508c e8cf4e5e07                     call       0x7fd1c39daa60
05091 e96fd8ffff                     jmp        0x7fd1bc3f3405
05096 49ba58d96bb4d17f0000           movabs     r10, 0x7fd1b46bd958
050a0 4c89542408                     mov        qword ptr [rsp + 8], r10
050a5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050ad e8ae4e5e07                     call       0x7fd1c39daa60
050b2 e981d8ffff                     jmp        0x7fd1bc3f3438
050b7 49bab0ab63b4d17f0000           movabs     r10, 0x7fd1b463abb0
050c1 4c89542408                     mov        qword ptr [rsp + 8], r10
050c6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050ce e88d4e5e07                     call       0x7fd1c39daa60
050d3 e970d9ffff                     jmp        0x7fd1bc3f3548
050d8 49ba48d640b4d17f0000           movabs     r10, 0x7fd1b440d648
050e2 4c89542408                     mov        qword ptr [rsp + 8], r10
050e7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050ef e86c4e5e07                     call       0x7fd1c39daa60
050f4 e990d9ffff                     jmp        0x7fd1bc3f3589
050f9 49bab8af3bb4d17f0000           movabs     r10, 0x7fd1b43bafb8
05103 4c89542408                     mov        qword ptr [rsp + 8], r10
05108 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05110 e84b4e5e07                     call       0x7fd1c39daa60
05115 e9a2d9ffff                     jmp        0x7fd1bc3f35bc
0511a 48890424                       mov        qword ptr [rsp], rax
0511e e8bd165e07                     call       0x7fd1c39d72e0
05123 e838045507                     call       0x7fd1c3946060
05128 49ba108763b4d17f0000           movabs     r10, 0x7fd1b4638710
05132 4c89542408                     mov        qword ptr [rsp + 8], r10
05137 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0513f e81c4e5e07                     call       0x7fd1c39daa60
05144 e939dbffff                     jmp        0x7fd1bc3f3782
05149 49ba185278b4d17f0000           movabs     r10, 0x7fd1b4785218
05153 4c89542408                     mov        qword ptr [rsp + 8], r10
05158 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05160 e8fb4d5e07                     call       0x7fd1c39daa60
05165 e9d5dbffff                     jmp        0x7fd1bc3f383f
0516a 49ba30f516b4d17f0000           movabs     r10, 0x7fd1b416f530
05174 4c89542408                     mov        qword ptr [rsp + 8], r10
05179 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05181 e8da4d5e07                     call       0x7fd1c39daa60
05186 e9fbdbffff                     jmp        0x7fd1bc3f3886
0518b 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05193 e8482f5e07                     call       0x7fd1c39d8be0
05198 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
051a0 e83b2f5e07                     call       0x7fd1c39d8be0
051a5 e8b6035507                     call       0x7fd1c3946060
051aa 49bab0ab63b4d17f0000           movabs     r10, 0x7fd1b463abb0
051b4 4c89542408                     mov        qword ptr [rsp + 8], r10
051b9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
051c1 e89a4d5e07                     call       0x7fd1c39daa60
051c6 e9a8ddffff                     jmp        0x7fd1bc3f3a73
051cb 49ba48d640b4d17f0000           movabs     r10, 0x7fd1b440d648
051d5 4c89542408                     mov        qword ptr [rsp + 8], r10
051da 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
051e2 e8794d5e07                     call       0x7fd1c39daa60
051e7 e9d4ddffff                     jmp        0x7fd1bc3f3ac0
051ec 49bab8af3bb4d17f0000           movabs     r10, 0x7fd1b43bafb8
051f6 4c89542408                     mov        qword ptr [rsp + 8], r10
051fb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05203 e8584d5e07                     call       0x7fd1c39daa60
05208 e9ebddffff                     jmp        0x7fd1bc3f3af8
0520d 49bad8e570b4d17f0000           movabs     r10, 0x7fd1b470e5d8
05217 4c89542408                     mov        qword ptr [rsp + 8], r10
0521c 48c70424e8020000               mov        qword ptr [rsp], 0x2e8
05224 e8374d5e07                     call       0x7fd1c39daa60
05229 e994deffff                     jmp        0x7fd1bc3f3bc2
0522e 49ba680d71b4d17f0000           movabs     r10, 0x7fd1b4710d68
05238 4c89542408                     mov        qword ptr [rsp + 8], r10
0523d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05245 e8164d5e07                     call       0x7fd1c39daa60
0524a e953dfffff                     jmp        0x7fd1bc3f3ca2
0524f 49bac0ec60b4d17f0000           movabs     r10, 0x7fd1b460ecc0
05259 4c89542408                     mov        qword ptr [rsp + 8], r10
0525e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05266 e8f54c5e07                     call       0x7fd1c39daa60
0526b e9d9dfffff                     jmp        0x7fd1bc3f3d49
05270 49ba000d09b4d17f0000           movabs     r10, 0x7fd1b4090d00
0527a 4c89542408                     mov        qword ptr [rsp + 8], r10
0527f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05287 e8d44c5e07                     call       0x7fd1c39daa60
0528c e94be0ffff                     jmp        0x7fd1bc3f3ddc
05291 49ba78b661b4d17f0000           movabs     r10, 0x7fd1b461b678
0529b 4c89542408                     mov        qword ptr [rsp + 8], r10
052a0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052a8 e8b34c5e07                     call       0x7fd1c39daa60
052ad e9ede0ffff                     jmp        0x7fd1bc3f3e9f
052b2 49ba50fc61b4d17f0000           movabs     r10, 0x7fd1b461fc50
052bc 4c89542408                     mov        qword ptr [rsp + 8], r10
052c1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052c9 e8924c5e07                     call       0x7fd1c39daa60
052ce e961e1ffff                     jmp        0x7fd1bc3f3f34
052d3 48890424                       mov        qword ptr [rsp], rax
052d7 e804155e07                     call       0x7fd1c39d72e0
052dc 49ba38fb61b4d17f0000           movabs     r10, 0x7fd1b461fb38
052e6 4c89542408                     mov        qword ptr [rsp + 8], r10
052eb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052f3 e8684c5e07                     call       0x7fd1c39daa60
052f8 e919e2ffff                     jmp        0x7fd1bc3f4016
052fd e85e025507                     call       0x7fd1c3946060
05302 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0530a e8d12d5e07                     call       0x7fd1c39d8be0
0530f 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05317 e8c42d5e07                     call       0x7fd1c39d8be0
0531c 49bad8e570b4d17f0000           movabs     r10, 0x7fd1b470e5d8
05326 4c89542408                     mov        qword ptr [rsp + 8], r10
0532b 48c7042420030000               mov        qword ptr [rsp], 0x320
05333 e8284c5e07                     call       0x7fd1c39daa60
05338 e947e3ffff                     jmp        0x7fd1bc3f4184
0533d 49ba807963b4d17f0000           movabs     r10, 0x7fd1b4637980
05347 4c89542408                     mov        qword ptr [rsp + 8], r10
0534c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05354 e8074c5e07                     call       0x7fd1c39daa60
05359 e908e4ffff                     jmp        0x7fd1bc3f4266
0535e e8fd015507                     call       0x7fd1c3946060
05363 49ba185278b4d17f0000           movabs     r10, 0x7fd1b4785218
0536d 4c89542408                     mov        qword ptr [rsp + 8], r10
05372 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0537a e8e14b5e07                     call       0x7fd1c39daa60
0537f e98be4ffff                     jmp        0x7fd1bc3f430f
05384 49ba30f516b4d17f0000           movabs     r10, 0x7fd1b416f530
0538e 4c89542408                     mov        qword ptr [rsp + 8], r10
05393 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0539b e8c04b5e07                     call       0x7fd1c39daa60
053a0 e9a3e4ffff                     jmp        0x7fd1bc3f4348
053a5 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
053ad e82e2d5e07                     call       0x7fd1c39d8be0
053b2 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
053ba e8212d5e07                     call       0x7fd1c39d8be0
053bf 49ba08f168b4d17f0000           movabs     r10, 0x7fd1b468f108
053c9 4c89542408                     mov        qword ptr [rsp + 8], r10
053ce 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053d6 e8854b5e07                     call       0x7fd1c39daa60
053db e92fe5ffff                     jmp        0x7fd1bc3f440f
053e0 49bab85969b4d17f0000           movabs     r10, 0x7fd1b46959b8
053ea 4c89542408                     mov        qword ptr [rsp + 8], r10
053ef 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053f7 e8644b5e07                     call       0x7fd1c39daa60
053fc e941e5ffff                     jmp        0x7fd1bc3f4442
05401 49ba28166cb4d17f0000           movabs     r10, 0x7fd1b46c1628
0540b 4c89542408                     mov        qword ptr [rsp + 8], r10
05410 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05418 e8434b5e07                     call       0x7fd1c39daa60
0541d e978e5ffff                     jmp        0x7fd1bc3f449a
05422 49ba489363b4d17f0000           movabs     r10, 0x7fd1b4639348
0542c 4c89542408                     mov        qword ptr [rsp + 8], r10
05431 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05439 e8224b5e07                     call       0x7fd1c39daa60
0543e e98de5ffff                     jmp        0x7fd1bc3f44d0
05443 49ba58d96bb4d17f0000           movabs     r10, 0x7fd1b46bd958
0544d 4c89542408                     mov        qword ptr [rsp + 8], r10
05452 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0545a e8014b5e07                     call       0x7fd1c39daa60
0545f e99fe5ffff                     jmp        0x7fd1bc3f4503
05464 49bab0ab63b4d17f0000           movabs     r10, 0x7fd1b463abb0
0546e 4c89542408                     mov        qword ptr [rsp + 8], r10
05473 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0547b e8e04a5e07                     call       0x7fd1c39daa60
05480 e98ee6ffff                     jmp        0x7fd1bc3f4613
05485 49ba48d640b4d17f0000           movabs     r10, 0x7fd1b440d648
0548f 4c89542408                     mov        qword ptr [rsp + 8], r10
05494 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0549c e8bf4a5e07                     call       0x7fd1c39daa60
054a1 e9aee6ffff                     jmp        0x7fd1bc3f4654
054a6 49bab8af3bb4d17f0000           movabs     r10, 0x7fd1b43bafb8
054b0 4c89542408                     mov        qword ptr [rsp + 8], r10
054b5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
054bd e89e4a5e07                     call       0x7fd1c39daa60
054c2 e9c0e6ffff                     jmp        0x7fd1bc3f4687
054c7 48890424                       mov        qword ptr [rsp], rax
054cb e810135e07                     call       0x7fd1c39d72e0
054d0 e88b005507                     call       0x7fd1c3946060
054d5 49ba108763b4d17f0000           movabs     r10, 0x7fd1b4638710
054df 4c89542408                     mov        qword ptr [rsp + 8], r10
054e4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
054ec e86f4a5e07                     call       0x7fd1c39daa60
054f1 e94ce8ffff                     jmp        0x7fd1bc3f4842
054f6 49ba185278b4d17f0000           movabs     r10, 0x7fd1b4785218
05500 4c89542408                     mov        qword ptr [rsp + 8], r10
05505 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0550d e84e4a5e07                     call       0x7fd1c39daa60
05512 e9e8e8ffff                     jmp        0x7fd1bc3f48ff
05517 49ba30f516b4d17f0000           movabs     r10, 0x7fd1b416f530
05521 4c89542408                     mov        qword ptr [rsp + 8], r10
05526 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0552e e82d4a5e07                     call       0x7fd1c39daa60
05533 e90fe9ffff                     jmp        0x7fd1bc3f4947
05538 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05540 e89b2b5e07                     call       0x7fd1c39d8be0
05545 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0554d e88e2b5e07                     call       0x7fd1c39d8be0
05552 e809005507                     call       0x7fd1c3946060
05557 49bab0ab63b4d17f0000           movabs     r10, 0x7fd1b463abb0
05561 4c89542408                     mov        qword ptr [rsp + 8], r10
05566 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0556e e8ed495e07                     call       0x7fd1c39daa60
05573 e9bbeaffff                     jmp        0x7fd1bc3f4b33
05578 49ba48d640b4d17f0000           movabs     r10, 0x7fd1b440d648
05582 4c89542408                     mov        qword ptr [rsp + 8], r10
05587 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0558f e8cc495e07                     call       0x7fd1c39daa60
05594 e9e7eaffff                     jmp        0x7fd1bc3f4b80
05599 49bab8af3bb4d17f0000           movabs     r10, 0x7fd1b43bafb8
055a3 4c89542408                     mov        qword ptr [rsp + 8], r10
055a8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
055b0 e8ab495e07                     call       0x7fd1c39daa60
055b5 e9feeaffff                     jmp        0x7fd1bc3f4bb8
055ba 49bad8e570b4d17f0000           movabs     r10, 0x7fd1b470e5d8
055c4 4c89542408                     mov        qword ptr [rsp + 8], r10
055c9 48c704245a030000               mov        qword ptr [rsp], 0x35a
055d1 e88a495e07                     call       0x7fd1c39daa60
055d6 e9baebffff                     jmp        0x7fd1bc3f4c95
055db e880ff5407                     call       0x7fd1c3946060
055e0 0f1f8000000000                 nop        dword ptr [rax]
055e7 e874a75107                     call       0x7fd1c3910860
055ec e929edffff                     jmp        0x7fd1bc3f4e1a
055f1 e86aff5407                     call       0x7fd1c3946060
055f6 49ba3e4e3fbcd17f0000           movabs     r10, 0x7fd1bc3f4e3e
05600 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
05607 e9d4cd5107                     jmp        0x7fd1c3912ee0
0560c 48ba0000000000000000           movabs     rdx, 0
05616 b8000f050a                     mov        eax, 0xa050f00
0561b e840345e07                     call       0x7fd1c39d9560
05620 e94bedffff                     jmp        0x7fd1bc3f4e70
05625 e836ff5407                     call       0x7fd1c3946060
0562a 488bd2                         mov        rdx, rdx
0562d e82ef15407                     call       0x7fd1c3945260
05632 e98cedffff                     jmp        0x7fd1bc3f4ec3
05637 48ba0000000000000000           movabs     rdx, 0
05641 b8000f050a                     mov        eax, 0xa050f00
05646 e815405e07                     call       0x7fd1c39da160
0564b e978edffff                     jmp        0x7fd1bc3f4ec8
05650 48ba0000000000000000           movabs     rdx, 0
0565a b8000f050a                     mov        eax, 0xa050f00
0565f e8fc335e07                     call       0x7fd1c39d9560
05664 e9f7edffff                     jmp        0x7fd1bc3f4f60
05669 e8f2fe5407                     call       0x7fd1c3946060
0566e 488bd2                         mov        rdx, rdx
05671 e8eaf05407                     call       0x7fd1c3945260
05676 e938eeffff                     jmp        0x7fd1bc3f4fb3
0567b 48ba0000000000000000           movabs     rdx, 0
05685 b8000f050a                     mov        eax, 0xa050f00
0568a e8d1335e07                     call       0x7fd1c39d9560
0568f e974eeffff                     jmp        0x7fd1bc3f5008
05694 e8c7fe5407                     call       0x7fd1c3946060
05699 488bd2                         mov        rdx, rdx
0569c e8bff05407                     call       0x7fd1c3945260
056a1 e9b5eeffff                     jmp        0x7fd1bc3f505b
056a6 498b8778050000                 mov        rax, qword ptr [r15 + 0x578]
056ad 49c7877805000000000000         mov        qword ptr [r15 + 0x578], 0
056b8 49c7878005000000000000         mov        qword ptr [r15 + 0x580], 0
056c3 4881c4e0020000                 add        rsp, 0x2e0
056ca 5d                             pop        rbp
056cb e9900d5507                     jmp        0x7fd1c3946f60
