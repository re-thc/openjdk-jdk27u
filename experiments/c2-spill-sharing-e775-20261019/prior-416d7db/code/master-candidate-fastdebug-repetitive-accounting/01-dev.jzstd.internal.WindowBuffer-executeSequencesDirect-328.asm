00000 90                             nop        
00001 90                             nop        
00002 90                             nop        
00003 90                             nop        
00004 90                             nop        
00005 90                             nop        
00006 90                             nop        
00007 90                             nop        
00008 90                             nop        
00009 90                             nop        
0000a 90                             nop        
0000b 90                             nop        
0000c 90                             nop        
0000d 90                             nop        
0000e 90                             nop        
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c0345f07                   jne        0x7f102772ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ec50020000                 sub        rsp, 0x250
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 7405                           je         0x7f102013b8bf
0003a e821395e07                     call       0x7f102771f1e0
0003f 4889b42448010000               mov        qword ptr [rsp + 0x148], rsi
00047 4889942468010000               mov        qword ptr [rsp + 0x168], rdx
0004f 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
00056 4c89842428010000               mov        qword ptr [rsp + 0x128], r8
0005e 4c898c2420010000               mov        qword ptr [rsp + 0x120], r9
00066 89bc2430010000                 mov        dword ptr [rsp + 0x130], edi
0006d 48bb48e76214107f0000           movabs     rbx, 0x7f101462e748
00077 8b4378                         mov        eax, dword ptr [rbx + 0x78]
0007a 83c002                         add        eax, 2
0007d 894378                         mov        dword ptr [rbx + 0x78], eax
00080 25fe070000                     and        eax, 0x7fe
00085 85c0                           test       eax, eax
00087 0f845c3e0000                   je         0x7f102013f769
0008d 48bb48e76214107f0000           movabs     rbx, 0x7f101462e748
00097 ff83b0000000                   inc        dword ptr [rbx + 0xb0]
0009d 8b9c2460020000                 mov        ebx, dword ptr [rsp + 0x260]
000a4 8b4640                         mov        eax, dword ptr [rsi + 0x40]
000a7 4c3b25eac31022                 cmp        r12, qword ptr [rip + 0x2210c3ea]
000ae 0f8414000000                   je         0x7f102013b948
000b4 48bf38a33140107f0000           movabs     rdi, 0x7f104031a338
000be 4883e4f0                       and        rsp, 0xfffffffffffffff0
000c2 e899ab4d21                     call       0x7f10416164e0
000c7 f4                             hlt        
000c8 4889842438010000               mov        qword ptr [rsp + 0x138], rax
000d0 448b5e38                       mov        r11d, dword ptr [rsi + 0x38]
000d4 448b6e04                       mov        r13d, dword ptr [rsi + 4]
000d8 4489ac2460010000               mov        dword ptr [rsp + 0x160], r13d
000e0 4c8b7608                       mov        r14, qword ptr [rsi + 8]
000e4 4c89b42488010000               mov        qword ptr [rsp + 0x188], r14
000ec 4c8b4e10                       mov        r9, qword ptr [rsi + 0x10]
000f0 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000f4 4963fb                         movsxd     rdi, r11d
000f7 4903fe                         add        rdi, r14
000fa 498bc5                         mov        rax, r13
000fd 412bc3                         sub        eax, r11d
00100 3bd8                           cmp        ebx, eax
00102 48b848e76214107f0000           movabs     rax, 0x7f101462e748
0010c b900010000                     mov        ecx, 0x100
00111 7f05                           jg         0x7f102013b998
00113 b910010000                     mov        ecx, 0x110
00118 44899c2440010000               mov        dword ptr [rsp + 0x140], r11d
00120 4c8b1c08                       mov        r11, qword ptr [rax + rcx]
00124 4d8d5b01                       lea        r11, [r11 + 1]
00128 4c891c08                       mov        qword ptr [rax + rcx], r11
0012c 0f8f173d0000                   jg         0x7f102013f6c9
00132 4863db                         movsxd     rbx, ebx
00135 488b4e20                       mov        rcx, qword ptr [rsi + 0x20]
00139 482bcf                         sub        rcx, rdi
0013c 483bcb                         cmp        rcx, rbx
0013f 48b948e76214107f0000           movabs     rcx, 0x7f101462e748
00149 b830010000                     mov        eax, 0x130
0014e 7c05                           jl         0x7f102013b9d5
00150 b820010000                     mov        eax, 0x120
00155 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
00159 4d8d5b01                       lea        r11, [r11 + 1]
0015d 4c891c01                       mov        qword ptr [rcx + rax], r11
00161 0f8ce23c0000                   jl         0x7f102013f6c9
00167 48b948e76214107f0000           movabs     rcx, 0x7f101462e748
00171 ff8160010000                   inc        dword ptr [rcx + 0x160]
00177 b900000000                     mov        ecx, 0
0017c 498bc0                         mov        rax, r8
0017f 483bc1                         cmp        rax, rcx
00182 48b948e76214107f0000           movabs     rcx, 0x7f101462e748
0018c b870010000                     mov        eax, 0x170
00191 7505                           jne        0x7f102013ba18
00193 b880010000                     mov        eax, 0x180
00198 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
0019c 4d8d5b01                       lea        r11, [r11 + 1]
001a0 4c891c01                       mov        qword ptr [rcx + rax], r11
001a4 0f8531000000                   jne        0x7f102013ba5b
001aa 4803df                         add        rbx, rdi
001ad 498bc9                         mov        rcx, r9
001b0 483bcb                         cmp        rcx, rbx
001b3 48b948e76214107f0000           movabs     rcx, 0x7f101462e748
001bd bfa0010000                     mov        edi, 0x1a0
001c2 7d05                           jge        0x7f102013ba49
001c4 bf90010000                     mov        edi, 0x190
001c9 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
001cd 488d5b01                       lea        rbx, [rbx + 1]
001d1 48891c39                       mov        qword ptr [rcx + rdi], rbx
001d5 0f8d0a000000                   jge        0x7f102013ba65
001db bf00000000                     mov        edi, 0
001e0 e915000000                     jmp        0x7f102013ba7a
001e5 48b948e76214107f0000           movabs     rcx, 0x7f101462e748
001ef ff81b0010000                   inc        dword ptr [rcx + 0x1b0]
001f5 bf01000000                     mov        edi, 1
001fa 4d2bc6                         sub        r8, r14
001fd 4c89842480010000               mov        qword ptr [rsp + 0x180], r8
00205 48b948e76214107f0000           movabs     rcx, 0x7f101462e748
0020f 488381c801000001               add        qword ptr [rcx + 0x1c8], 1
00217 48b950bc6d14107f0000           movabs     rcx, 0x7f10146dbc50
00221 8b5978                         mov        ebx, dword ptr [rcx + 0x78]
00224 83c302                         add        ebx, 2
00227 895978                         mov        dword ptr [rcx + 0x78], ebx
0022a 81e3feff1f00                   and        ebx, 0x1ffffe
00230 85db                           test       ebx, ebx
00232 0f84d23c0000                   je         0x7f102013f78a
00238 48b9ffffffffffffff7f           movabs     rcx, 0x7fffffffffffffff
00242 493bc9                         cmp        rcx, r9
00245 48b950bc6d14107f0000           movabs     rcx, 0x7f10146dbc50
0024f bbc0000000                     mov        ebx, 0xc0
00254 7d05                           jge        0x7f102013badb
00256 bbb0000000                     mov        ebx, 0xb0
0025b 488b0419                       mov        rax, qword ptr [rcx + rbx]
0025f 488d4001                       lea        rax, [rax + 1]
00263 48890419                       mov        qword ptr [rcx + rbx], rax
00267 0f8d0f000000                   jge        0x7f102013bafc
0026d 49b9ffffffffffffff7f           movabs     r9, 0x7fffffffffffffff
00277 e910000000                     jmp        0x7f102013bb0c
0027c 48b950bc6d14107f0000           movabs     rcx, 0x7f10146dbc50
00286 ff81d0000000                   inc        dword ptr [rcx + 0xd0]
0028c 448b9c2440010000               mov        r11d, dword ptr [rsp + 0x140]
00294 498bdd                         mov        rbx, r13
00297 83eb20                         sub        ebx, 0x20
0029a 899c2458010000                 mov        dword ptr [rsp + 0x158], ebx
002a1 8b4204                         mov        eax, dword ptr [rdx + 4]
002a4 89842464010000                 mov        dword ptr [rsp + 0x164], eax
002ab 488bc8                         mov        rcx, rax
002ae 83e920                         sub        ecx, 0x20
002b1 898c245c010000                 mov        dword ptr [rsp + 0x15c], ecx
002b8 be00000000                     mov        esi, 0
002bd 89b42444010000                 mov        dword ptr [rsp + 0x144], esi
002c4 be00000000                     mov        esi, 0
002c9 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
002d1 4c898c2450010000               mov        qword ptr [rsp + 0x150], r9
002d9 89bc2470010000                 mov        dword ptr [rsp + 0x170], edi
002e0 488b9c2468020000               mov        rbx, qword ptr [rsp + 0x268]
002e8 8bbc2430010000                 mov        edi, dword ptr [rsp + 0x130]
002ef 4c8b8c2420010000               mov        r9, qword ptr [rsp + 0x120]
002f7 4c8b842428010000               mov        r8, qword ptr [rsp + 0x128]
002ff 8b8c2434010000                 mov        ecx, dword ptr [rsp + 0x134]
00306 8b942444010000                 mov        edx, dword ptr [rsp + 0x144]
0030d 90                             nop        
0030e 90                             nop        
0030f 90                             nop        
00310 3bd7                           cmp        edx, edi
00312 48bf48e76214107f0000           movabs     rdi, 0x7f101462e748
0031c b8d8010000                     mov        eax, 0x1d8
00321 7d05                           jge        0x7f102013bba8
00323 b8e8010000                     mov        eax, 0x1e8
00328 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
0032c 4d8d5b01                       lea        r11, [r11 + 1]
00330 4c891c07                       mov        qword ptr [rdi + rax], r11
00334 0f8d22380000                   jge        0x7f102013f3dc
0033a 413b5004                       cmp        edx, dword ptr [r8 + 4]
0033e 0f83323c0000                   jae        0x7f102013f7f6
00344 4863fa                         movsxd     rdi, edx
00347 498b44f808                     mov        rax, qword ptr [r8 + rdi*8 + 8]
0034c 8bf8                           mov        edi, eax
0034e 81e7ffff0100                   and        edi, 0x1ffff
00354 89bc247c010000                 mov        dword ptr [rsp + 0x17c], edi
0035b 4c8bd9                         mov        r11, rcx
0035e b912000000                     mov        ecx, 0x12
00363 4c8bc0                         mov        r8, rax
00366 49d3e8                         shr        r8, cl
00369 458bc0                         mov        r8d, r8d
0036c 4181e0ffff0300                 and        r8d, 0x3ffff
00373 4489842478010000               mov        dword ptr [rsp + 0x178], r8d
0037b b924000000                     mov        ecx, 0x24
00380 48d3f8                         sar        rax, cl
00383 8bc0                           mov        eax, eax
00385 85c0                           test       eax, eax
00387 48b948e76214107f0000           movabs     rcx, 0x7f101462e748
00391 41b8f8010000                   mov        r8d, 0x1f8
00397 7d06                           jge        0x7f102013bc1f
00399 41b808020000                   mov        r8d, 0x208
0039f 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003a3 4d8d6d01                       lea        r13, [r13 + 1]
003a7 4e892c01                       mov        qword ptr [rcx + r8], r13
003ab 0f8d15000000                   jge        0x7f102013bc46
003b1 413b5104                       cmp        edx, dword ptr [r9 + 4]
003b5 0f830f3c0000                   jae        0x7f102013f84a
003bb 4863ca                         movsxd     rcx, edx
003be 418b4c8908                     mov        ecx, dword ptr [r9 + rcx*4 + 8]
003c3 488bc1                         mov        rax, rcx
003c6 85ff                           test       edi, edi
003c8 48b948e76214107f0000           movabs     rcx, 0x7f101462e748
003d2 41b818020000                   mov        r8d, 0x218
003d8 7406                           je         0x7f102013bc60
003da 41b828020000                   mov        r8d, 0x228
003e0 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003e4 4d8d6d01                       lea        r13, [r13 + 1]
003e8 4e892c01                       mov        qword ptr [rcx + r8], r13
003ec 0f8431000000                   je         0x7f102013bca3
003f2 498bcb                         mov        rcx, r11
003f5 2bce                           sub        ecx, esi
003f7 3bf9                           cmp        edi, ecx
003f9 48b948e76214107f0000           movabs     rcx, 0x7f101462e748
00403 41b848020000                   mov        r8d, 0x248
00409 7f06                           jg         0x7f102013bc91
0040b 41b838020000                   mov        r8d, 0x238
00411 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00415 4d8d6d01                       lea        r13, [r13 + 1]
00419 4e892c01                       mov        qword ptr [rcx + r8], r13
0041d 0f8f86390000                   jg         0x7f102013f629
00423 83f803                         cmp        eax, 3
00426 48b948e76214107f0000           movabs     rcx, 0x7f101462e748
00430 41b868020000                   mov        r8d, 0x268
00436 7e06                           jle        0x7f102013bcbe
00438 41b878020000                   mov        r8d, 0x278
0043e 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00442 4d8d6d01                       lea        r13, [r13 + 1]
00446 4e892c01                       mov        qword ptr [rcx + r8], r13
0044a 0f8e59000000                   jle        0x7f102013bd29
00450 83e803                         sub        eax, 3
00453 837b0401                       cmp        dword ptr [rbx + 4], 1
00457 0f86c13b0000                   jbe        0x7f102013f89e
0045d 8b4b0c                         mov        ecx, dword ptr [rbx + 0xc]
00460 837b0402                       cmp        dword ptr [rbx + 4], 2
00464 0f86da3b0000                   jbe        0x7f102013f8c4
0046a 894b10                         mov        dword ptr [rbx + 0x10], ecx
0046d 8b4b08                         mov        ecx, dword ptr [rbx + 8]
00470 894b0c                         mov        dword ptr [rbx + 0xc], ecx
00473 894308                         mov        dword ptr [rbx + 8], eax
00476 48b948e76214107f0000           movabs     rcx, 0x7f101462e748
00480 ff8188020000                   inc        dword ptr [rcx + 0x288]
00486 89942444010000                 mov        dword ptr [rsp + 0x144], edx
0048d 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
00494 4c8bb42488010000               mov        r14, qword ptr [rsp + 0x188]
0049c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
004a4 e952000000                     jmp        0x7f102013bd7b
004a9 89942444010000                 mov        dword ptr [rsp + 0x144], edx
004b0 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
004b7 49b848e76214107f0000           movabs     r8, 0x7f101462e748
004c1 498380a002000001               add        qword ptr [r8 + 0x2a0], 1
004c9 488bf3                         mov        rsi, rbx
004cc 488bd0                         mov        rdx, rax
004cf 488bcf                         mov        rcx, rdi
004d2 90                             nop        
004d3 90                             nop        
004d4 90                             nop        
004d5 90                             nop        
004d6 90                             nop        
004d7 e8043f5f07                     call       0x7f102772fc60
004dc 0f1f8400d4050000               nop        dword ptr [rax + rax + 0x5d4]
004e4 8bbc247c010000                 mov        edi, dword ptr [rsp + 0x17c]
004eb 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
004f3 4c8bb42488010000               mov        r14, qword ptr [rsp + 0x188]
004fb 4963f3                         movsxd     rsi, r11d
004fe 4903f6                         add        rsi, r14
00501 4863d7                         movsxd     rdx, edi
00504 4803f2                         add        rsi, rdx
00507 4863d8                         movsxd     rbx, eax
0050a 488bd6                         mov        rdx, rsi
0050d 483bd3                         cmp        rdx, rbx
00510 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
0051a b9c0020000                     mov        ecx, 0x2c0
0051f 7d05                           jge        0x7f102013bda6
00521 b9b0020000                     mov        ecx, 0x2b0
00526 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0052a 4d8d4001                       lea        r8, [r8 + 1]
0052e 4c89040a                       mov        qword ptr [rdx + rcx], r8
00532 0f8d15000000                   jge        0x7f102013bdcd
00538 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00540 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00548 e9ad000000                     jmp        0x7f102013be7a
0054d 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00555 4585ed                         test       r13d, r13d
00558 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
00562 b9d0020000                     mov        ecx, 0x2d0
00567 7505                           jne        0x7f102013bdee
00569 b9e0020000                     mov        ecx, 0x2e0
0056e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
00572 4d8d4001                       lea        r8, [r8 + 1]
00576 4c89040a                       mov        qword ptr [rdx + rcx], r8
0057a 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00582 0f8568000000                   jne        0x7f102013be70
00588 498bd3                         mov        rdx, r11
0058b 03d7                           add        edx, edi
0058d 2bd0                           sub        edx, eax
0058f 4863d2                         movsxd     rdx, edx
00592 493bd0                         cmp        rdx, r8
00595 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
0059f b9f0020000                     mov        ecx, 0x2f0
005a4 7c05                           jl         0x7f102013be2b
005a6 b900030000                     mov        ecx, 0x300
005ab 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
005af 4d8d4901                       lea        r9, [r9 + 1]
005b3 4c890c0a                       mov        qword ptr [rdx + rcx], r9
005b7 0f8c3d000000                   jl         0x7f102013be7a
005bd 4c8b8c2450010000               mov        r9, qword ptr [rsp + 0x150]
005c5 4c3bcb                         cmp        r9, rbx
005c8 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
005d2 b920030000                     mov        ecx, 0x320
005d7 7c05                           jl         0x7f102013be5e
005d9 b910030000                     mov        ecx, 0x310
005de 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
005e2 4d8d4901                       lea        r9, [r9 + 1]
005e6 4c890c0a                       mov        qword ptr [rdx + rcx], r9
005ea 0f8c0a000000                   jl         0x7f102013be7a
005f0 ba00000000                     mov        edx, 0
005f5 e915000000                     jmp        0x7f102013be8f
005fa 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
00604 ff8230030000                   inc        dword ptr [rdx + 0x330]
0060a ba01000000                     mov        edx, 1
0060f 48899c2498010000               mov        qword ptr [rsp + 0x198], rbx
00617 85c0                           test       eax, eax
00619 48b948e76214107f0000           movabs     rcx, 0x7f101462e748
00623 41b948030000                   mov        r9d, 0x348
00629 7e06                           jle        0x7f102013beb1
0062b 41b958030000                   mov        r9d, 0x358
00631 4a8b1c09                       mov        rbx, qword ptr [rcx + r9]
00635 488d5b01                       lea        rbx, [rbx + 1]
00639 4a891c09                       mov        qword ptr [rcx + r9], rbx
0063d 0f8e6f340000                   jle        0x7f102013f332
00643 85d2                           test       edx, edx
00645 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
0064f b978030000                     mov        ecx, 0x378
00654 7505                           jne        0x7f102013bedb
00656 b968030000                     mov        ecx, 0x368
0065b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0065f 4d8d4901                       lea        r9, [r9 + 1]
00663 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00667 0f8545340000                   jne        0x7f102013f332
0066d 498bdb                         mov        rbx, r11
00670 03df                           add        ebx, edi
00672 899c24a0010000                 mov        dword ptr [rsp + 0x1a0], ebx
00679 488bf3                         mov        rsi, rbx
0067c 03b42478010000                 add        esi, dword ptr [rsp + 0x178]
00683 3bb42458010000                 cmp        esi, dword ptr [rsp + 0x158]
0068a 48be48e76214107f0000           movabs     rsi, 0x7f101462e748
00694 ba30040000                     mov        edx, 0x430
00699 7f05                           jg         0x7f102013bf20
0069b ba40040000                     mov        edx, 0x440
006a0 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
006a4 488d4901                       lea        rcx, [rcx + 1]
006a8 48890c16                       mov        qword ptr [rsi + rdx], rcx
006ac 0f8f3f000000                   jg         0x7f102013bf71
006b2 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
006b9 03f7                           add        esi, edi
006bb 89b424a4010000                 mov        dword ptr [rsp + 0x1a4], esi
006c2 3bb4245c010000                 cmp        esi, dword ptr [rsp + 0x15c]
006c9 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
006d3 b960040000                     mov        ecx, 0x460
006d8 7e05                           jle        0x7f102013bf5f
006da b950040000                     mov        ecx, 0x450
006df 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
006e3 4d8d4901                       lea        r9, [r9 + 1]
006e7 4c890c0a                       mov        qword ptr [rdx + rcx], r9
006eb 0f8e76000000                   jle        0x7f102013bfe7
006f1 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
006f9 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
00701 48be48e76214107f0000           movabs     rsi, 0x7f101462e748
0070b 4883862008000001               add        qword ptr [rsi + 0x820], 1
00713 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
0071b 498bd3                         mov        rdx, r11
0071e 8b8c2460010000                 mov        ecx, dword ptr [rsp + 0x160]
00725 4d8bd8                         mov        r11, r8
00728 4c8b842468010000               mov        r8, qword ptr [rsp + 0x168]
00730 448b8c2490010000               mov        r9d, dword ptr [rsp + 0x190]
00738 8bbc247c010000                 mov        edi, dword ptr [rsp + 0x17c]
0073f 890424                         mov        dword ptr [rsp], eax
00742 44895c2408                     mov        dword ptr [rsp + 8], r11d
00747 e8943c5f07                     call       0x7f102772fc60
0074c 0f1f840044080001               nop        dword ptr [rax + rax + 0x1000844]
00754 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
0075b 03b4247c010000                 add        esi, dword ptr [rsp + 0x17c]
00762 e9c9320000                     jmp        0x7f102013f2b0
00767 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
0076f 83ff10                         cmp        edi, 0x10
00772 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
0077c b970040000                     mov        ecx, 0x470
00781 7f05                           jg         0x7f102013c008
00783 b980040000                     mov        ecx, 0x480
00788 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0078c 4d8d4901                       lea        r9, [r9 + 1]
00790 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00794 0f8f670a0000                   jg         0x7f102013ca81
0079a 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
007a4 4883829004000001               add        qword ptr [rdx + 0x490], 1
007ac 48ba00986d14107f0000           movabs     rdx, 0x7f10146d9800
007b6 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
007b9 83c102                         add        ecx, 2
007bc 894a78                         mov        dword ptr [rdx + 0x78], ecx
007bf 81e1feff1f00                   and        ecx, 0x1ffffe
007c5 85c9                           test       ecx, ecx
007c7 0f849d380000                   je         0x7f102013f8ea
007cd 48baf8926ee200000000           movabs     rdx, 0xe26e92f8
007d7 48b900986d14107f0000           movabs     rcx, 0x7f10146d9800
007e1 8b12                           mov        edx, dword ptr [rdx]
007e3 c1ea0d                         shr        edx, 0xd
007e6 48c1e20a                       shl        rdx, 0xa
007ea 41ba00000010                   mov        r10d, 0x10000000
007f0 4903d2                         add        rdx, r10
007f3 41ba17000000                   mov        r10d, 0x17
007f9 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
007fd 7436                           je         0x7f102013c0b5
007ff 4983c202                       add        r10, 2
00803 4983fa1b                       cmp        r10, 0x1b
00807 75f0                           jne        0x7f102013c079
00809 41ba17000000                   mov        r10d, 0x17
0080f 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
00814 7412                           je         0x7f102013c0a8
00816 4983c202                       add        r10, 2
0081a 4983fa1b                       cmp        r10, 0x1b
0081e 75ef                           jne        0x7f102013c08f
00820 41ba16000000                   mov        r10d, 0x16
00826 eb11                           jmp        0x7f102013c0b9
00828 50                             push       rax
00829 4833c0                         xor        rax, rax
0082c f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
00832 58                             pop        rax
00833 ebbe                           jmp        0x7f102013c073
00835 4983c201                       add        r10, 1
00839 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0083e 48ba00986d14107f0000           movabs     rdx, 0x7f10146d9800
00848 488382e000000001               add        qword ptr [rdx + 0xe0], 1
00850 48ba088e6d14107f0000           movabs     rdx, 0x7f10146d8e08
0085a 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0085d 83c102                         add        ecx, 2
00860 894a78                         mov        dword ptr [rdx + 0x78], ecx
00863 81e1feff1f00                   and        ecx, 0x1ffffe
00869 85c9                           test       ecx, ecx
0086b 0f841a380000                   je         0x7f102013f90b
00871 448bac2490010000               mov        r13d, dword ptr [rsp + 0x190]
00879 48ba088e6d14107f0000           movabs     rdx, 0x7f10146d8e08
00883 4883821001000001               add        qword ptr [rdx + 0x110], 1
0088b 8b942464010000                 mov        edx, dword ptr [rsp + 0x164]
00892 83ea0f                         sub        edx, 0xf
00895 48b998846d14107f0000           movabs     rcx, 0x7f10146d8498
0089f 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
008a3 4183c102                       add        r9d, 2
008a7 44894978                       mov        dword ptr [rcx + 0x78], r9d
008ab 4181e1feff1f00                 and        r9d, 0x1ffffe
008b2 4585c9                         test       r9d, r9d
008b5 0f84f1370000                   je         0x7f102013f92c
008bb 48b998846d14107f0000           movabs     rcx, 0x7f10146d8498
008c5 488381b000000001               add        qword ptr [rcx + 0xb0], 1
008cd 48b90000000000000000           movabs     rcx, 0
008d7 b900000000                     mov        ecx, 0
008dc 443be9                         cmp        r13d, ecx
008df 0f8ce8370000                   jl         0x7f102013f94d
008e5 443bea                         cmp        r13d, edx
008e8 0f8d00380000                   jge        0x7f102013f96e
008ee 498bd5                         mov        rdx, r13
008f1 89942494010000                 mov        dword ptr [rsp + 0x194], edx
008f8 48b9f8926ee200000000           movabs     rcx, 0xe26e92f8
00902 4c8bc9                         mov        r9, rcx
00905 49be00986d14107f0000           movabs     r14, 0x7f10146d9800
0090f 458b09                         mov        r9d, dword ptr [r9]
00912 41c1e90d                       shr        r9d, 0xd
00916 49c1e10a                       shl        r9, 0xa
0091a 41ba00000010                   mov        r10d, 0x10000000
00920 4d03ca                         add        r9, r10
00923 41ba25000000                   mov        r10d, 0x25
00929 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
0092d 7436                           je         0x7f102013c1e5
0092f 4983c202                       add        r10, 2
00933 4983fa29                       cmp        r10, 0x29
00937 75f0                           jne        0x7f102013c1a9
00939 41ba25000000                   mov        r10d, 0x25
0093f 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
00944 7412                           je         0x7f102013c1d8
00946 4983c202                       add        r10, 2
0094a 4983fa29                       cmp        r10, 0x29
0094e 75ef                           jne        0x7f102013c1bf
00950 41ba24000000                   mov        r10d, 0x24
00956 eb11                           jmp        0x7f102013c1e9
00958 50                             push       rax
00959 4833c0                         xor        rax, rax
0095c f04f0fb10cd6                   lock cmpxchg qword ptr [r14 + r10*8], r9
00962 58                             pop        rax
00963 ebbe                           jmp        0x7f102013c1a3
00965 4983c201                       add        r10, 1
00969 4b8304d601                     add        qword ptr [r14 + r10*8], 1
0096e 48baa0856d14107f0000           movabs     rdx, 0x7f10146d85a0
00978 448b4a78                       mov        r9d, dword ptr [rdx + 0x78]
0097c 4183c102                       add        r9d, 2
00980 44894a78                       mov        dword ptr [rdx + 0x78], r9d
00984 4181e1feff1f00                 and        r9d, 0x1ffffe
0098b 4585c9                         test       r9d, r9d
0098e 0f847b370000                   je         0x7f102013f98f
00994 48baa0856d14107f0000           movabs     rdx, 0x7f10146d85a0
0099e 488382b000000001               add        qword ptr [rdx + 0xb0], 1
009a6 48bad0866d14107f0000           movabs     rdx, 0x7f10146d86d0
009b0 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
009b3 83c102                         add        ecx, 2
009b6 894a78                         mov        dword ptr [rdx + 0x78], ecx
009b9 81e1feff1f00                   and        ecx, 0x1ffffe
009bf 85c9                           test       ecx, ecx
009c1 0f8469370000                   je         0x7f102013f9b0
009c7 48bad0866d14107f0000           movabs     rdx, 0x7f10146d86d0
009d1 ff82c0000000                   inc        dword ptr [rdx + 0xc0]
009d7 8b942494010000                 mov        edx, dword ptr [rsp + 0x194]
009de 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
009e5 4489ac2490010000               mov        dword ptr [rsp + 0x190], r13d
009ed 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
009f5 488b9c2468010000               mov        rbx, qword ptr [rsp + 0x168]
009fd 48b9f0126fe200000000           movabs     rcx, 0xe26f12f0
00a07 4c8bc9                         mov        r9, rcx
00a0a 48b800986d14107f0000           movabs     rax, 0x7f10146d9800
00a14 4883806001000001               add        qword ptr [rax + 0x160], 1
00a1c 49b9d0996d14107f0000           movabs     r9, 0x7f10146d99d0
00a26 418b4178                       mov        eax, dword ptr [r9 + 0x78]
00a2a 83c002                         add        eax, 2
00a2d 41894178                       mov        dword ptr [r9 + 0x78], eax
00a31 25feff1f00                     and        eax, 0x1ffffe
00a36 85c0                           test       eax, eax
00a38 0f8413370000                   je         0x7f102013f9d1
00a3e 4c8bc9                         mov        r9, rcx
00a41 48b8d0996d14107f0000           movabs     rax, 0x7f10146d99d0
00a4b 488380b000000001               add        qword ptr [rax + 0xb0], 1
00a53 49b9b89a6d14107f0000           movabs     r9, 0x7f10146d9ab8
00a5d 418b4178                       mov        eax, dword ptr [r9 + 0x78]
00a61 83c002                         add        eax, 2
00a64 41894178                       mov        dword ptr [r9 + 0x78], eax
00a68 25feff1f00                     and        eax, 0x1ffffe
00a6d 85c0                           test       eax, eax
00a6f 0f84fd360000                   je         0x7f102013f9f2
00a75 49b9b89a6d14107f0000           movabs     r9, 0x7f10146d9ab8
00a7f 498381c000000001               add        qword ptr [r9 + 0xc0], 1
00a87 48b9888f6d14107f0000           movabs     rcx, 0x7f10146d8f88
00a91 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
00a95 4183c102                       add        r9d, 2
00a99 44894978                       mov        dword ptr [rcx + 0x78], r9d
00a9d 4181e1feff1f00                 and        r9d, 0x1ffffe
00aa4 4585c9                         test       r9d, r9d
00aa7 0f84e6360000                   je         0x7f102013fa13
00aad 48b9f8926ee200000000           movabs     rcx, 0xe26e92f8
00ab7 4c8bc9                         mov        r9, rcx
00aba 48b8b89a6d14107f0000           movabs     rax, 0x7f10146d9ab8
00ac4 458b09                         mov        r9d, dword ptr [r9]
00ac7 41c1e90d                       shr        r9d, 0xd
00acb 49c1e10a                       shl        r9, 0xa
00acf 41ba00000010                   mov        r10d, 0x10000000
00ad5 4d03ca                         add        r9, r10
00ad8 41ba1d000000                   mov        r10d, 0x1d
00ade 4e3b0cd0                       cmp        r9, qword ptr [rax + r10*8]
00ae2 743c                           je         0x7f102013c3a0
00ae4 4983c202                       add        r10, 2
00ae8 4983fa21                       cmp        r10, 0x21
00aec 75f0                           jne        0x7f102013c35e
00aee 41ba1d000000                   mov        r10d, 0x1d
00af4 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
00af9 7412                           je         0x7f102013c38d
00afb 4983c202                       add        r10, 2
00aff 4983fa21                       cmp        r10, 0x21
00b03 75ef                           jne        0x7f102013c374
00b05 41ba1c000000                   mov        r10d, 0x1c
00b0b eb17                           jmp        0x7f102013c3a4
00b0d 53                             push       rbx
00b0e 488bd8                         mov        rbx, rax
00b11 4833c0                         xor        rax, rax
00b14 f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
00b1a 488bc3                         mov        rax, rbx
00b1d 5b                             pop        rbx
00b1e ebb8                           jmp        0x7f102013c358
00b20 4983c201                       add        r10, 1
00b24 4a8304d001                     add        qword ptr [rax + r10*8], 1
00b29 49b9b89a6d14107f0000           movabs     r9, 0x7f10146d9ab8
00b33 8b09                           mov        ecx, dword ptr [rcx]
00b35 c1e90d                         shr        ecx, 0xd
00b38 48c1e10a                       shl        rcx, 0xa
00b3c 41ba00000010                   mov        r10d, 0x10000000
00b42 4903ca                         add        rcx, r10
00b45 41ba23000000                   mov        r10d, 0x23
00b4b 4b3b0cd1                       cmp        rcx, qword ptr [r9 + r10*8]
00b4f 7436                           je         0x7f102013c407
00b51 4983c202                       add        r10, 2
00b55 4983fa27                       cmp        r10, 0x27
00b59 75f0                           jne        0x7f102013c3cb
00b5b 41ba23000000                   mov        r10d, 0x23
00b61 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
00b66 7412                           je         0x7f102013c3fa
00b68 4983c202                       add        r10, 2
00b6c 4983fa27                       cmp        r10, 0x27
00b70 75ef                           jne        0x7f102013c3e1
00b72 41ba22000000                   mov        r10d, 0x22
00b78 eb11                           jmp        0x7f102013c40b
00b7a 50                             push       rax
00b7b 4833c0                         xor        rax, rax
00b7e f04b0fb10cd1                   lock cmpxchg qword ptr [r9 + r10*8], rcx
00b84 58                             pop        rax
00b85 ebbe                           jmp        0x7f102013c3c5
00b87 4983c201                       add        r10, 1
00b8b 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00b90 48b9b89a6d14107f0000           movabs     rcx, 0x7f10146d9ab8
00b9a 4883814001000001               add        qword ptr [rcx + 0x140], 1
00ba2 48b950906d14107f0000           movabs     rcx, 0x7f10146d9050
00bac 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
00bb0 4183c102                       add        r9d, 2
00bb4 44894978                       mov        dword ptr [rcx + 0x78], r9d
00bb8 4181e1feff1f00                 and        r9d, 0x1ffffe
00bbf 4585c9                         test       r9d, r9d
00bc2 0f84ec350000                   je         0x7f102013fa34
00bc8 48b9b89a6d14107f0000           movabs     rcx, 0x7f10146d9ab8
00bd2 4883815001000001               add        qword ptr [rcx + 0x150], 1
00bda 4863c2                         movsxd     rax, edx
00bdd ba08000000                     mov        edx, 8
00be2 4c8bc8                         mov        r9, rax
00be5 4c03ca                         add        r9, rdx
00be8 48bad8816d14107f0000           movabs     rdx, 0x7f10146d81d8
00bf2 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
00bf5 83c102                         add        ecx, 2
00bf8 894a78                         mov        dword ptr [rdx + 0x78], ecx
00bfb 81e1feff1f00                   and        ecx, 0x1ffffe
00c01 85c9                           test       ecx, ecx
00c03 0f84cc350000                   je         0x7f102013fa55
00c09 48bad8816d14107f0000           movabs     rdx, 0x7f10146d81d8
00c13 488382e000000001               add        qword ptr [rdx + 0xe0], 1
00c1b 48ba58836d14107f0000           movabs     rdx, 0x7f10146d8358
00c25 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
00c28 83c102                         add        ecx, 2
00c2b 894a78                         mov        dword ptr [rdx + 0x78], ecx
00c2e 81e1feff1f00                   and        ecx, 0x1ffffe
00c34 85c9                           test       ecx, ecx
00c36 0f84ba350000                   je         0x7f102013fa76
00c3c 48bab89a6d14107f0000           movabs     rdx, 0x7f10146d9ab8
00c46 4883827001000001               add        qword ptr [rdx + 0x170], 1
00c4e 48bac06b6fe200000000           movabs     rdx, 0xe26f6bc0
00c58 48be40936ee200000000           movabs     rsi, 0xe26e9340
00c62 ba02000000                     mov        edx, 2
00c67 b910000000                     mov        ecx, 0x10
00c6c 4c8bc3                         mov        r8, rbx
00c6f bf00000000                     mov        edi, 0
00c74 48891c24                       mov        qword ptr [rsp], rbx
00c78 4889442408                     mov        qword ptr [rsp + 8], rax
00c7d 49baf8926ee200000000           movabs     r10, 0xe26e92f8
00c87 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00c8c 49bac06b6fe200000000           movabs     r10, 0xe26f6bc0
00c96 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c9b 90                             nop        
00c9c 90                             nop        
00c9d 90                             nop        
00c9e 90                             nop        
00c9f e83c375f07                     call       0x7f102772fc60
00ca4 0f1f84009c0d0002               nop        dword ptr [rax + rax + 0x2000d9c]
00cac 4885c0                         test       rax, rax
00caf 48bbb89a6d14107f0000           movabs     rbx, 0x7f10146d9ab8
00cb9 750c                           jne        0x7f102013c547
00cbb 808b7901000001                 or         byte ptr [rbx + 0x179], 1
00cc2 e988000000                     jmp        0x7f102013c5cf
00cc7 8b38                           mov        edi, dword ptr [rax]
00cc9 c1ef0d                         shr        edi, 0xd
00ccc 48c1e70a                       shl        rdi, 0xa
00cd0 41ba00000010                   mov        r10d, 0x10000000
00cd6 4903fa                         add        rdi, r10
00cd9 41ba31000000                   mov        r10d, 0x31
00cdf 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
00ce3 7436                           je         0x7f102013c59b
00ce5 4983c202                       add        r10, 2
00ce9 4983fa35                       cmp        r10, 0x35
00ced 75f0                           jne        0x7f102013c55f
00cef 41ba31000000                   mov        r10d, 0x31
00cf5 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00cfa 7412                           je         0x7f102013c58e
00cfc 4983c202                       add        r10, 2
00d00 4983fa35                       cmp        r10, 0x35
00d04 75ef                           jne        0x7f102013c575
00d06 41ba30000000                   mov        r10d, 0x30
00d0c eb11                           jmp        0x7f102013c59f
00d0e 50                             push       rax
00d0f 4833c0                         xor        rax, rax
00d12 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
00d18 58                             pop        rax
00d19 ebbe                           jmp        0x7f102013c559
00d1b 4983c201                       add        r10, 1
00d1f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00d24 48bf00b0141000000000           movabs     rdi, 0x1014b000
00d2e 8b18                           mov        ebx, dword ptr [rax]
00d30 c1eb0d                         shr        ebx, 0xd
00d33 48c1e30a                       shl        rbx, 0xa
00d37 41ba00000010                   mov        r10d, 0x10000000
00d3d 4903da                         add        rbx, r10
00d40 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
00d44 0f85cd340000                   jne        0x7f102013fa97
00d4a e900000000                     jmp        0x7f102013c5cf
00d4f 488bf8                         mov        rdi, rax
00d52 4889bc24b0010000               mov        qword ptr [rsp + 0x1b0], rdi
00d5a 483b07                         cmp        rax, qword ptr [rdi]
00d5d 488bf7                         mov        rsi, rdi
00d60 48bb48e76214107f0000           movabs     rbx, 0x7f101462e748
00d6a 8b36                           mov        esi, dword ptr [rsi]
00d6c c1ee0d                         shr        esi, 0xd
00d6f 48c1e60a                       shl        rsi, 0xa
00d73 41ba00000010                   mov        r10d, 0x10000000
00d79 4903f2                         add        rsi, r10
00d7c 41ba95000000                   mov        r10d, 0x95
00d82 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00d86 743c                           je         0x7f102013c644
00d88 4983c202                       add        r10, 2
00d8c 4981fa99000000                 cmp        r10, 0x99
00d93 75ed                           jne        0x7f102013c602
00d95 41ba95000000                   mov        r10d, 0x95
00d9b 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00da0 7415                           je         0x7f102013c637
00da2 4983c202                       add        r10, 2
00da6 4981fa99000000                 cmp        r10, 0x99
00dad 75ec                           jne        0x7f102013c61b
00daf 41ba94000000                   mov        r10d, 0x94
00db5 eb11                           jmp        0x7f102013c648
00db7 50                             push       rax
00db8 4833c0                         xor        rax, rax
00dbb f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00dc1 58                             pop        rax
00dc2 ebb8                           jmp        0x7f102013c5fc
00dc4 4983c201                       add        r10, 1
00dc8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00dcd 48be08a56d14107f0000           movabs     rsi, 0x7f10146da508
00dd7 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
00dda 83c302                         add        ebx, 2
00ddd 895e78                         mov        dword ptr [rsi + 0x78], ebx
00de0 81e3feff1f00                   and        ebx, 0x1ffffe
00de6 85db                           test       ebx, ebx
00de8 0f845f340000                   je         0x7f102013facd
00dee 488bf7                         mov        rsi, rdi
00df1 48bb08a56d14107f0000           movabs     rbx, 0x7f10146da508
00dfb 8b36                           mov        esi, dword ptr [rsi]
00dfd c1ee0d                         shr        esi, 0xd
00e00 48c1e60a                       shl        rsi, 0xa
00e04 41ba00000010                   mov        r10d, 0x10000000
00e0a 4903f2                         add        rsi, r10
00e0d 41ba17000000                   mov        r10d, 0x17
00e13 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00e17 7436                           je         0x7f102013c6cf
00e19 4983c202                       add        r10, 2
00e1d 4983fa1b                       cmp        r10, 0x1b
00e21 75f0                           jne        0x7f102013c693
00e23 41ba17000000                   mov        r10d, 0x17
00e29 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00e2e 7412                           je         0x7f102013c6c2
00e30 4983c202                       add        r10, 2
00e34 4983fa1b                       cmp        r10, 0x1b
00e38 75ef                           jne        0x7f102013c6a9
00e3a 41ba16000000                   mov        r10d, 0x16
00e40 eb11                           jmp        0x7f102013c6d3
00e42 50                             push       rax
00e43 4833c0                         xor        rax, rax
00e46 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00e4c 58                             pop        rax
00e4d ebbe                           jmp        0x7f102013c68d
00e4f 4983c201                       add        r10, 1
00e53 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00e58 488bf7                         mov        rsi, rdi
00e5b 90                             nop        
00e5c 90                             nop        
00e5d 48b8301c5ff40f7f0000           movabs     rax, 0x7f0ff45f1c30
00e67 e874305f07                     call       0x7f102772f760
00e6c 0f1f8400640f0003               nop        dword ptr [rax + rax + 0x3000f64]
00e74 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
00e7c 8b7704                         mov        esi, dword ptr [rdi + 4]
00e7f 48bb08a56d14107f0000           movabs     rbx, 0x7f10146da508
00e89 488383e000000001               add        qword ptr [rbx + 0xe0], 1
00e91 48bb088e6d14107f0000           movabs     rbx, 0x7f10146d8e08
00e9b 8b5378                         mov        edx, dword ptr [rbx + 0x78]
00e9e 83c202                         add        edx, 2
00ea1 895378                         mov        dword ptr [rbx + 0x78], edx
00ea4 81e2feff1f00                   and        edx, 0x1ffffe
00eaa 85d2                           test       edx, edx
00eac 0f84d5330000                   je         0x7f102013fb07
00eb2 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
00eba 48bb088e6d14107f0000           movabs     rbx, 0x7f10146d8e08
00ec4 4883831001000001               add        qword ptr [rbx + 0x110], 1
00ecc ffc8                           dec        eax
00ece 2bf0                           sub        esi, eax
00ed0 48bb98846d14107f0000           movabs     rbx, 0x7f10146d8498
00eda 8b4378                         mov        eax, dword ptr [rbx + 0x78]
00edd 83c002                         add        eax, 2
00ee0 894378                         mov        dword ptr [rbx + 0x78], eax
00ee3 25feff1f00                     and        eax, 0x1ffffe
00ee8 85c0                           test       eax, eax
00eea 0f84b8330000                   je         0x7f102013fb28
00ef0 48bb98846d14107f0000           movabs     rbx, 0x7f10146d8498
00efa 488383b000000001               add        qword ptr [rbx + 0xb0], 1
00f02 48bb0000000000000000           movabs     rbx, 0
00f0c bb00000000                     mov        ebx, 0
00f11 443bdb                         cmp        r11d, ebx
00f14 0f8caf330000                   jl         0x7f102013fb49
00f1a 443bde                         cmp        r11d, esi
00f1d 0f8dc7330000                   jge        0x7f102013fb6a
00f23 498bdb                         mov        rbx, r11
00f26 899c24ac010000                 mov        dword ptr [rsp + 0x1ac], ebx
00f2d 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
00f35 488bbc24b0010000               mov        rdi, qword ptr [rsp + 0x1b0]
00f3d 488bf7                         mov        rsi, rdi
00f40 48ba08a56d14107f0000           movabs     rdx, 0x7f10146da508
00f4a 8b36                           mov        esi, dword ptr [rsi]
00f4c c1ee0d                         shr        esi, 0xd
00f4f 48c1e60a                       shl        rsi, 0xa
00f53 41ba00000010                   mov        r10d, 0x10000000
00f59 4903f2                         add        rsi, r10
00f5c 41ba1f000000                   mov        r10d, 0x1f
00f62 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
00f66 7436                           je         0x7f102013c81e
00f68 4983c202                       add        r10, 2
00f6c 4983fa23                       cmp        r10, 0x23
00f70 75f0                           jne        0x7f102013c7e2
00f72 41ba1f000000                   mov        r10d, 0x1f
00f78 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
00f7d 7412                           je         0x7f102013c811
00f7f 4983c202                       add        r10, 2
00f83 4983fa23                       cmp        r10, 0x23
00f87 75ef                           jne        0x7f102013c7f8
00f89 41ba1e000000                   mov        r10d, 0x1e
00f8f eb11                           jmp        0x7f102013c822
00f91 50                             push       rax
00f92 4833c0                         xor        rax, rax
00f95 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
00f9b 58                             pop        rax
00f9c ebbe                           jmp        0x7f102013c7dc
00f9e 4983c201                       add        r10, 1
00fa2 4a8304d201                     add        qword ptr [rdx + r10*8], 1
00fa7 488bf7                         mov        rsi, rdi
00faa 90                             nop        
00fab 90                             nop        
00fac 90                             nop        
00fad 48b8581c5ff40f7f0000           movabs     rax, 0x7f0ff45f1c58
00fb7 e8242f5f07                     call       0x7f102772f760
00fbc 0f1f8400b4100004               nop        dword ptr [rax + rax + 0x40010b4]
00fc4 483b00                         cmp        rax, qword ptr [rax]
00fc7 488bf0                         mov        rsi, rax
00fca 48ba08a56d14107f0000           movabs     rdx, 0x7f10146da508
00fd4 8b36                           mov        esi, dword ptr [rsi]
00fd6 c1ee0d                         shr        esi, 0xd
00fd9 48c1e60a                       shl        rsi, 0xa
00fdd 41ba00000010                   mov        r10d, 0x10000000
00fe3 4903f2                         add        rsi, r10
00fe6 41ba25000000                   mov        r10d, 0x25
00fec 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
00ff0 7436                           je         0x7f102013c8a8
00ff2 4983c202                       add        r10, 2
00ff6 4983fa29                       cmp        r10, 0x29
00ffa 75f0                           jne        0x7f102013c86c
00ffc 41ba25000000                   mov        r10d, 0x25
01002 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01007 7412                           je         0x7f102013c89b
01009 4983c202                       add        r10, 2
0100d 4983fa29                       cmp        r10, 0x29
01011 75ef                           jne        0x7f102013c882
01013 41ba24000000                   mov        r10d, 0x24
01019 eb11                           jmp        0x7f102013c8ac
0101b 50                             push       rax
0101c 4833c0                         xor        rax, rax
0101f f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01025 58                             pop        rax
01026 ebbe                           jmp        0x7f102013c866
01028 4983c201                       add        r10, 1
0102c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01031 8b7024                         mov        esi, dword ptr [rax + 0x24]
01034 4c3b255db41022                 cmp        r12, qword ptr [rip + 0x2210b45d]
0103b 0f8414000000                   je         0x7f102013c8d5
01041 48bf38a33140107f0000           movabs     rdi, 0x7f104031a338
0104b 4883e4f0                       and        rsp, 0xfffffffffffffff0
0104f e80c9c4d21                     call       0x7f10416164e0
01054 f4                             hlt        
01055 488bd0                         mov        rdx, rax
01058 48b908a56d14107f0000           movabs     rcx, 0x7f10146da508
01062 8b12                           mov        edx, dword ptr [rdx]
01064 c1ea0d                         shr        edx, 0xd
01067 48c1e20a                       shl        rdx, 0xa
0106b 41ba00000010                   mov        r10d, 0x10000000
01071 4903d2                         add        rdx, r10
01074 41ba2b000000                   mov        r10d, 0x2b
0107a 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0107e 7436                           je         0x7f102013c936
01080 4983c202                       add        r10, 2
01084 4983fa2f                       cmp        r10, 0x2f
01088 75f0                           jne        0x7f102013c8fa
0108a 41ba2b000000                   mov        r10d, 0x2b
01090 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01095 7412                           je         0x7f102013c929
01097 4983c202                       add        r10, 2
0109b 4983fa2f                       cmp        r10, 0x2f
0109f 75ef                           jne        0x7f102013c910
010a1 41ba2a000000                   mov        r10d, 0x2a
010a7 eb11                           jmp        0x7f102013c93a
010a9 50                             push       rax
010aa 4833c0                         xor        rax, rax
010ad f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
010b3 58                             pop        rax
010b4 ebbe                           jmp        0x7f102013c8f4
010b6 4983c201                       add        r10, 1
010ba 4a8304d101                     add        qword ptr [rcx + r10*8], 1
010bf 8b4804                         mov        ecx, dword ptr [rax + 4]
010c2 48ba08a56d14107f0000           movabs     rdx, 0x7f10146da508
010cc 4883828001000001               add        qword ptr [rdx + 0x180], 1
010d4 48ba50906d14107f0000           movabs     rdx, 0x7f10146d9050
010de 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
010e2 4183c002                       add        r8d, 2
010e6 44894278                       mov        dword ptr [rdx + 0x78], r8d
010ea 4181e0feff1f00                 and        r8d, 0x1ffffe
010f1 4585c0                         test       r8d, r8d
010f4 0f842a320000                   je         0x7f102013fba4
010fa 48ba08a56d14107f0000           movabs     rdx, 0x7f10146da508
01104 4883829001000001               add        qword ptr [rdx + 0x190], 1
0110c 8b9c24ac010000                 mov        ebx, dword ptr [rsp + 0x1ac]
01113 4863db                         movsxd     rbx, ebx
01116 ba08000000                     mov        edx, 8
0111b 4c8bcb                         mov        r9, rbx
0111e 4c03ca                         add        r9, rdx
01121 48bad8816d14107f0000           movabs     rdx, 0x7f10146d81d8
0112b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
0112f 4183c002                       add        r8d, 2
01133 44894278                       mov        dword ptr [rdx + 0x78], r8d
01137 4181e0feff1f00                 and        r8d, 0x1ffffe
0113e 4585c0                         test       r8d, r8d
01141 0f84fe310000                   je         0x7f102013fbc5
01147 48bad8816d14107f0000           movabs     rdx, 0x7f10146d81d8
01151 488382e000000001               add        qword ptr [rdx + 0xe0], 1
01159 48ba58836d14107f0000           movabs     rdx, 0x7f10146d8358
01163 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01167 4183c002                       add        r8d, 2
0116b 44894278                       mov        dword ptr [rdx + 0x78], r8d
0116f 4181e0feff1f00                 and        r8d, 0x1ffffe
01176 4585c0                         test       r8d, r8d
01179 0f84e7310000                   je         0x7f102013fbe6
0117f 48ba08a56d14107f0000           movabs     rdx, 0x7f10146da508
01189 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
01191 48baa80970e200000000           movabs     rdx, 0xe27009a8
0119b ba02000000                     mov        edx, 2
011a0 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
011a8 bf00000000                     mov        edi, 0
011ad 488b8424b0010000               mov        rax, qword ptr [rsp + 0x1b0]
011b5 48890424                       mov        qword ptr [rsp], rax
011b9 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
011c1 4889442408                     mov        qword ptr [rsp + 8], rax
011c6 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
011cb 49baa80970e200000000           movabs     r10, 0xe27009a8
011d5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
011da 90                             nop        
011db 90                             nop        
011dc 90                             nop        
011dd 90                             nop        
011de 90                             nop        
011df e8fc315f07                     call       0x7f102772fc60
011e4 0f1f8400dc120005               nop        dword ptr [rax + rax + 0x50012dc]
011ec 48be48e76214107f0000           movabs     rsi, 0x7f101462e748
011f6 ff86d0040000                   inc        dword ptr [rsi + 0x4d0]
011fc e9480c0000                     jmp        0x7f102013d6c9
01201 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
01208 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
01210 83ff30                         cmp        edi, 0x30
01213 48be48e76214107f0000           movabs     rsi, 0x7f101462e748
0121d bae8040000                     mov        edx, 0x4e8
01222 7f05                           jg         0x7f102013caa9
01224 baf8040000                     mov        edx, 0x4f8
01229 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0122d 488d4901                       lea        rcx, [rcx + 1]
01231 48890c16                       mov        qword ptr [rsi + rdx], rcx
01235 0f8f1e0b0000                   jg         0x7f102013d5d9
0123b 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
01242 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
0124a 90                             nop        
0124b 90                             nop        
0124c 90                             nop        
0124d 90                             nop        
0124e 90                             nop        
0124f 90                             nop        
01250 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
01258 8b842464010000                 mov        eax, dword ptr [rsp + 0x164]
0125f 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
01267 48b948e76214107f0000           movabs     rcx, 0x7f101462e748
01271 4883810805000001               add        qword ptr [rcx + 0x508], 1
01279 48b900986d14107f0000           movabs     rcx, 0x7f10146d9800
01283 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
01287 4183c002                       add        r8d, 2
0128b 44894178                       mov        dword ptr [rcx + 0x78], r8d
0128f 4181e0feff1f00                 and        r8d, 0x1ffffe
01296 4585c0                         test       r8d, r8d
01299 0f84e8300000                   je         0x7f102013fc07
0129f 48b9f8926ee200000000           movabs     rcx, 0xe26e92f8
012a9 49b800986d14107f0000           movabs     r8, 0x7f10146d9800
012b3 8b09                           mov        ecx, dword ptr [rcx]
012b5 c1e90d                         shr        ecx, 0xd
012b8 48c1e10a                       shl        rcx, 0xa
012bc 41ba00000010                   mov        r10d, 0x10000000
012c2 4903ca                         add        rcx, r10
012c5 41ba17000000                   mov        r10d, 0x17
012cb 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
012cf 7436                           je         0x7f102013cb87
012d1 4983c202                       add        r10, 2
012d5 4983fa1b                       cmp        r10, 0x1b
012d9 75f0                           jne        0x7f102013cb4b
012db 41ba17000000                   mov        r10d, 0x17
012e1 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
012e6 7412                           je         0x7f102013cb7a
012e8 4983c202                       add        r10, 2
012ec 4983fa1b                       cmp        r10, 0x1b
012f0 75ef                           jne        0x7f102013cb61
012f2 41ba16000000                   mov        r10d, 0x16
012f8 eb11                           jmp        0x7f102013cb8b
012fa 50                             push       rax
012fb 4833c0                         xor        rax, rax
012fe f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
01304 58                             pop        rax
01305 ebbe                           jmp        0x7f102013cb45
01307 4983c201                       add        r10, 1
0130b 4b8304d001                     add        qword ptr [r8 + r10*8], 1
01310 48b900986d14107f0000           movabs     rcx, 0x7f10146d9800
0131a 488381e000000001               add        qword ptr [rcx + 0xe0], 1
01322 48b9088e6d14107f0000           movabs     rcx, 0x7f10146d8e08
0132c 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
01330 4183c002                       add        r8d, 2
01334 44894178                       mov        dword ptr [rcx + 0x78], r8d
01338 4181e0feff1f00                 and        r8d, 0x1ffffe
0133f 4585c0                         test       r8d, r8d
01342 0f8460300000                   je         0x7f102013fc28
01348 48b9088e6d14107f0000           movabs     rcx, 0x7f10146d8e08
01352 4883811001000001               add        qword ptr [rcx + 0x110], 1
0135a 488bc8                         mov        rcx, rax
0135d 83e90f                         sub        ecx, 0xf
01360 49b898846d14107f0000           movabs     r8, 0x7f10146d8498
0136a 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
0136e 4183c102                       add        r9d, 2
01372 45894878                       mov        dword ptr [r8 + 0x78], r9d
01376 4181e1feff1f00                 and        r9d, 0x1ffffe
0137d 4585c9                         test       r9d, r9d
01380 0f8443300000                   je         0x7f102013fc49
01386 49b898846d14107f0000           movabs     r8, 0x7f10146d8498
01390 498380b000000001               add        qword ptr [r8 + 0xb0], 1
01398 49b80000000000000000           movabs     r8, 0
013a2 41b800000000                   mov        r8d, 0
013a8 413bf0                         cmp        esi, r8d
013ab 0f8c39300000                   jl         0x7f102013fc6a
013b1 3bf1                           cmp        esi, ecx
013b3 0f8d52300000                   jge        0x7f102013fc8b
013b9 488bce                         mov        rcx, rsi
013bc 898c24b8010000                 mov        dword ptr [rsp + 0x1b8], ecx
013c3 49b8f8926ee200000000           movabs     r8, 0xe26e92f8
013cd 4d8bc8                         mov        r9, r8
013d0 49be00986d14107f0000           movabs     r14, 0x7f10146d9800
013da 458b09                         mov        r9d, dword ptr [r9]
013dd 41c1e90d                       shr        r9d, 0xd
013e1 49c1e10a                       shl        r9, 0xa
013e5 41ba00000010                   mov        r10d, 0x10000000
013eb 4d03ca                         add        r9, r10
013ee 41ba25000000                   mov        r10d, 0x25
013f4 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
013f8 7436                           je         0x7f102013ccb0
013fa 4983c202                       add        r10, 2
013fe 4983fa29                       cmp        r10, 0x29
01402 75f0                           jne        0x7f102013cc74
01404 41ba25000000                   mov        r10d, 0x25
0140a 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
0140f 7412                           je         0x7f102013cca3
01411 4983c202                       add        r10, 2
01415 4983fa29                       cmp        r10, 0x29
01419 75ef                           jne        0x7f102013cc8a
0141b 41ba24000000                   mov        r10d, 0x24
01421 eb11                           jmp        0x7f102013ccb4
01423 50                             push       rax
01424 4833c0                         xor        rax, rax
01427 f04f0fb10cd6                   lock cmpxchg qword ptr [r14 + r10*8], r9
0142d 58                             pop        rax
0142e ebbe                           jmp        0x7f102013cc6e
01430 4983c201                       add        r10, 1
01434 4b8304d601                     add        qword ptr [r14 + r10*8], 1
01439 48b9a0856d14107f0000           movabs     rcx, 0x7f10146d85a0
01443 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
01447 4183c102                       add        r9d, 2
0144b 44894978                       mov        dword ptr [rcx + 0x78], r9d
0144f 4181e1feff1f00                 and        r9d, 0x1ffffe
01456 4585c9                         test       r9d, r9d
01459 0f84cd2f0000                   je         0x7f102013fcac
0145f 48b9a0856d14107f0000           movabs     rcx, 0x7f10146d85a0
01469 488381b000000001               add        qword ptr [rcx + 0xb0], 1
01471 48b9d0866d14107f0000           movabs     rcx, 0x7f10146d86d0
0147b 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
0147f 4183c002                       add        r8d, 2
01483 44894178                       mov        dword ptr [rcx + 0x78], r8d
01487 4181e0feff1f00                 and        r8d, 0x1ffffe
0148e 4585c0                         test       r8d, r8d
01491 0f84b62f0000                   je         0x7f102013fccd
01497 48b9d0866d14107f0000           movabs     rcx, 0x7f10146d86d0
014a1 ff81c0000000                   inc        dword ptr [rcx + 0xc0]
014a7 8b8c24b8010000                 mov        ecx, dword ptr [rsp + 0x1b8]
014ae 89b424c0010000                 mov        dword ptr [rsp + 0x1c0], esi
014b5 49b8f0126fe200000000           movabs     r8, 0xe26f12f0
014bf 4d8bc8                         mov        r9, r8
014c2 49be00986d14107f0000           movabs     r14, 0x7f10146d9800
014cc 4983866001000001               add        qword ptr [r14 + 0x160], 1
014d4 49b9d0996d14107f0000           movabs     r9, 0x7f10146d99d0
014de 418b5978                       mov        ebx, dword ptr [r9 + 0x78]
014e2 83c302                         add        ebx, 2
014e5 41895978                       mov        dword ptr [r9 + 0x78], ebx
014e9 81e3feff1f00                   and        ebx, 0x1ffffe
014ef 85db                           test       ebx, ebx
014f1 0f84772f0000                   je         0x7f102013fcee
014f7 4d8bc8                         mov        r9, r8
014fa 48bbd0996d14107f0000           movabs     rbx, 0x7f10146d99d0
01504 488383b000000001               add        qword ptr [rbx + 0xb0], 1
0150c 49b9b89a6d14107f0000           movabs     r9, 0x7f10146d9ab8
01516 418b5978                       mov        ebx, dword ptr [r9 + 0x78]
0151a 83c302                         add        ebx, 2
0151d 41895978                       mov        dword ptr [r9 + 0x78], ebx
01521 81e3feff1f00                   and        ebx, 0x1ffffe
01527 85db                           test       ebx, ebx
01529 0f84602f0000                   je         0x7f102013fd0f
0152f 49b9b89a6d14107f0000           movabs     r9, 0x7f10146d9ab8
01539 498381c000000001               add        qword ptr [r9 + 0xc0], 1
01541 49b8888f6d14107f0000           movabs     r8, 0x7f10146d8f88
0154b 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
0154f 4183c102                       add        r9d, 2
01553 45894878                       mov        dword ptr [r8 + 0x78], r9d
01557 4181e1feff1f00                 and        r9d, 0x1ffffe
0155e 4585c9                         test       r9d, r9d
01561 0f84492f0000                   je         0x7f102013fd30
01567 49b8f8926ee200000000           movabs     r8, 0xe26e92f8
01571 4d8bc8                         mov        r9, r8
01574 48bbb89a6d14107f0000           movabs     rbx, 0x7f10146d9ab8
0157e 458b09                         mov        r9d, dword ptr [r9]
01581 41c1e90d                       shr        r9d, 0xd
01585 49c1e10a                       shl        r9, 0xa
01589 41ba00000010                   mov        r10d, 0x10000000
0158f 4d03ca                         add        r9, r10
01592 41ba1d000000                   mov        r10d, 0x1d
01598 4e3b0cd3                       cmp        r9, qword ptr [rbx + r10*8]
0159c 7436                           je         0x7f102013ce54
0159e 4983c202                       add        r10, 2
015a2 4983fa21                       cmp        r10, 0x21
015a6 75f0                           jne        0x7f102013ce18
015a8 41ba1d000000                   mov        r10d, 0x1d
015ae 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
015b3 7412                           je         0x7f102013ce47
015b5 4983c202                       add        r10, 2
015b9 4983fa21                       cmp        r10, 0x21
015bd 75ef                           jne        0x7f102013ce2e
015bf 41ba1c000000                   mov        r10d, 0x1c
015c5 eb11                           jmp        0x7f102013ce58
015c7 50                             push       rax
015c8 4833c0                         xor        rax, rax
015cb f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
015d1 58                             pop        rax
015d2 ebbe                           jmp        0x7f102013ce12
015d4 4983c201                       add        r10, 1
015d8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
015dd 49b9b89a6d14107f0000           movabs     r9, 0x7f10146d9ab8
015e7 458b00                         mov        r8d, dword ptr [r8]
015ea 41c1e80d                       shr        r8d, 0xd
015ee 49c1e00a                       shl        r8, 0xa
015f2 41ba00000010                   mov        r10d, 0x10000000
015f8 4d03c2                         add        r8, r10
015fb 41ba23000000                   mov        r10d, 0x23
01601 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
01605 7436                           je         0x7f102013cebd
01607 4983c202                       add        r10, 2
0160b 4983fa27                       cmp        r10, 0x27
0160f 75f0                           jne        0x7f102013ce81
01611 41ba23000000                   mov        r10d, 0x23
01617 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
0161c 7412                           je         0x7f102013ceb0
0161e 4983c202                       add        r10, 2
01622 4983fa27                       cmp        r10, 0x27
01626 75ef                           jne        0x7f102013ce97
01628 41ba22000000                   mov        r10d, 0x22
0162e eb11                           jmp        0x7f102013cec1
01630 50                             push       rax
01631 4833c0                         xor        rax, rax
01634 f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
0163a 58                             pop        rax
0163b ebbe                           jmp        0x7f102013ce7b
0163d 4983c201                       add        r10, 1
01641 4b8304d101                     add        qword ptr [r9 + r10*8], 1
01646 49b8b89a6d14107f0000           movabs     r8, 0x7f10146d9ab8
01650 4983804001000001               add        qword ptr [r8 + 0x140], 1
01658 49b850906d14107f0000           movabs     r8, 0x7f10146d9050
01662 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
01666 4183c102                       add        r9d, 2
0166a 45894878                       mov        dword ptr [r8 + 0x78], r9d
0166e 4181e1feff1f00                 and        r9d, 0x1ffffe
01675 4585c9                         test       r9d, r9d
01678 0f84532e0000                   je         0x7f102013fd51
0167e 49b8b89a6d14107f0000           movabs     r8, 0x7f10146d9ab8
01688 4983805001000001               add        qword ptr [r8 + 0x150], 1
01690 4863d9                         movsxd     rbx, ecx
01693 b908000000                     mov        ecx, 8
01698 4c8bcb                         mov        r9, rbx
0169b 4c03c9                         add        r9, rcx
0169e 48b9d8816d14107f0000           movabs     rcx, 0x7f10146d81d8
016a8 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
016ac 4183c002                       add        r8d, 2
016b0 44894178                       mov        dword ptr [rcx + 0x78], r8d
016b4 4181e0feff1f00                 and        r8d, 0x1ffffe
016bb 4585c0                         test       r8d, r8d
016be 0f842e2e0000                   je         0x7f102013fd72
016c4 48b9d8816d14107f0000           movabs     rcx, 0x7f10146d81d8
016ce 488381e000000001               add        qword ptr [rcx + 0xe0], 1
016d6 48b958836d14107f0000           movabs     rcx, 0x7f10146d8358
016e0 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
016e4 4183c002                       add        r8d, 2
016e8 44894178                       mov        dword ptr [rcx + 0x78], r8d
016ec 4181e0feff1f00                 and        r8d, 0x1ffffe
016f3 4585c0                         test       r8d, r8d
016f6 0f84172e0000                   je         0x7f102013fd93
016fc 48b9b89a6d14107f0000           movabs     rcx, 0x7f10146d9ab8
01706 4883817001000001               add        qword ptr [rcx + 0x170], 1
0170e 48b9c06b6fe200000000           movabs     rcx, 0xe26f6bc0
01718 48be40936ee200000000           movabs     rsi, 0xe26e9340
01722 4c8bc2                         mov        r8, rdx
01725 ba02000000                     mov        edx, 2
0172a b910000000                     mov        ecx, 0x10
0172f 498bc0                         mov        rax, r8
01732 4c8bc0                         mov        r8, rax
01735 bf00000000                     mov        edi, 0
0173a 48890424                       mov        qword ptr [rsp], rax
0173e 48895c2408                     mov        qword ptr [rsp + 8], rbx
01743 49baf8926ee200000000           movabs     r10, 0xe26e92f8
0174d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01752 49bac06b6fe200000000           movabs     r10, 0xe26f6bc0
0175c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01761 90                             nop        
01762 90                             nop        
01763 90                             nop        
01764 90                             nop        
01765 90                             nop        
01766 90                             nop        
01767 e8742c5f07                     call       0x7f102772fc60
0176c 0f1f840064180006               nop        dword ptr [rax + rax + 0x6001864]
01774 4885c0                         test       rax, rax
01777 48bbb89a6d14107f0000           movabs     rbx, 0x7f10146d9ab8
01781 750c                           jne        0x7f102013d00f
01783 808b7901000001                 or         byte ptr [rbx + 0x179], 1
0178a e988000000                     jmp        0x7f102013d097
0178f 8b38                           mov        edi, dword ptr [rax]
01791 c1ef0d                         shr        edi, 0xd
01794 48c1e70a                       shl        rdi, 0xa
01798 41ba00000010                   mov        r10d, 0x10000000
0179e 4903fa                         add        rdi, r10
017a1 41ba31000000                   mov        r10d, 0x31
017a7 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
017ab 7436                           je         0x7f102013d063
017ad 4983c202                       add        r10, 2
017b1 4983fa35                       cmp        r10, 0x35
017b5 75f0                           jne        0x7f102013d027
017b7 41ba31000000                   mov        r10d, 0x31
017bd 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
017c2 7412                           je         0x7f102013d056
017c4 4983c202                       add        r10, 2
017c8 4983fa35                       cmp        r10, 0x35
017cc 75ef                           jne        0x7f102013d03d
017ce 41ba30000000                   mov        r10d, 0x30
017d4 eb11                           jmp        0x7f102013d067
017d6 50                             push       rax
017d7 4833c0                         xor        rax, rax
017da f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
017e0 58                             pop        rax
017e1 ebbe                           jmp        0x7f102013d021
017e3 4983c201                       add        r10, 1
017e7 4a8304d301                     add        qword ptr [rbx + r10*8], 1
017ec 48bf00b0141000000000           movabs     rdi, 0x1014b000
017f6 8b18                           mov        ebx, dword ptr [rax]
017f8 c1eb0d                         shr        ebx, 0xd
017fb 48c1e30a                       shl        rbx, 0xa
017ff 41ba00000010                   mov        r10d, 0x10000000
01805 4903da                         add        rbx, r10
01808 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
0180c 0f85222d0000                   jne        0x7f102013fdb4
01812 e900000000                     jmp        0x7f102013d097
01817 488bf8                         mov        rdi, rax
0181a 4889bc24c8010000               mov        qword ptr [rsp + 0x1c8], rdi
01822 483b07                         cmp        rax, qword ptr [rdi]
01825 488bf7                         mov        rsi, rdi
01828 48bb48e76214107f0000           movabs     rbx, 0x7f101462e748
01832 8b36                           mov        esi, dword ptr [rsi]
01834 c1ee0d                         shr        esi, 0xd
01837 48c1e60a                       shl        rsi, 0xa
0183b 41ba00000010                   mov        r10d, 0x10000000
01841 4903f2                         add        rsi, r10
01844 41baa4000000                   mov        r10d, 0xa4
0184a 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
0184e 743c                           je         0x7f102013d10c
01850 4983c202                       add        r10, 2
01854 4981faa8000000                 cmp        r10, 0xa8
0185b 75ed                           jne        0x7f102013d0ca
0185d 41baa4000000                   mov        r10d, 0xa4
01863 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01868 7415                           je         0x7f102013d0ff
0186a 4983c202                       add        r10, 2
0186e 4981faa8000000                 cmp        r10, 0xa8
01875 75ec                           jne        0x7f102013d0e3
01877 41baa3000000                   mov        r10d, 0xa3
0187d eb11                           jmp        0x7f102013d110
0187f 50                             push       rax
01880 4833c0                         xor        rax, rax
01883 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01889 58                             pop        rax
0188a ebb8                           jmp        0x7f102013d0c4
0188c 4983c201                       add        r10, 1
01890 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01895 48be08a56d14107f0000           movabs     rsi, 0x7f10146da508
0189f 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
018a2 83c302                         add        ebx, 2
018a5 895e78                         mov        dword ptr [rsi + 0x78], ebx
018a8 81e3feff1f00                   and        ebx, 0x1ffffe
018ae 85db                           test       ebx, ebx
018b0 0f84b42c0000                   je         0x7f102013fdea
018b6 488bf7                         mov        rsi, rdi
018b9 48bb08a56d14107f0000           movabs     rbx, 0x7f10146da508
018c3 8b36                           mov        esi, dword ptr [rsi]
018c5 c1ee0d                         shr        esi, 0xd
018c8 48c1e60a                       shl        rsi, 0xa
018cc 41ba00000010                   mov        r10d, 0x10000000
018d2 4903f2                         add        rsi, r10
018d5 41ba17000000                   mov        r10d, 0x17
018db 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
018df 7436                           je         0x7f102013d197
018e1 4983c202                       add        r10, 2
018e5 4983fa1b                       cmp        r10, 0x1b
018e9 75f0                           jne        0x7f102013d15b
018eb 41ba17000000                   mov        r10d, 0x17
018f1 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
018f6 7412                           je         0x7f102013d18a
018f8 4983c202                       add        r10, 2
018fc 4983fa1b                       cmp        r10, 0x1b
01900 75ef                           jne        0x7f102013d171
01902 41ba16000000                   mov        r10d, 0x16
01908 eb11                           jmp        0x7f102013d19b
0190a 50                             push       rax
0190b 4833c0                         xor        rax, rax
0190e f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01914 58                             pop        rax
01915 ebbe                           jmp        0x7f102013d155
01917 4983c201                       add        r10, 1
0191b 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01920 488bf7                         mov        rsi, rdi
01923 90                             nop        
01924 90                             nop        
01925 48b8801c5ff40f7f0000           movabs     rax, 0x7f0ff45f1c80
0192f e8ac255f07                     call       0x7f102772f760
01934 0f1f84002c1a0007               nop        dword ptr [rax + rax + 0x7001a2c]
0193c 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
01944 8b7704                         mov        esi, dword ptr [rdi + 4]
01947 48bb08a56d14107f0000           movabs     rbx, 0x7f10146da508
01951 488383e000000001               add        qword ptr [rbx + 0xe0], 1
01959 48bb088e6d14107f0000           movabs     rbx, 0x7f10146d8e08
01963 8b5378                         mov        edx, dword ptr [rbx + 0x78]
01966 83c202                         add        edx, 2
01969 895378                         mov        dword ptr [rbx + 0x78], edx
0196c 81e2feff1f00                   and        edx, 0x1ffffe
01972 85d2                           test       edx, edx
01974 0f842a2c0000                   je         0x7f102013fe24
0197a 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01982 48bb088e6d14107f0000           movabs     rbx, 0x7f10146d8e08
0198c 4883831001000001               add        qword ptr [rbx + 0x110], 1
01994 ffc8                           dec        eax
01996 2bf0                           sub        esi, eax
01998 48bb98846d14107f0000           movabs     rbx, 0x7f10146d8498
019a2 8b4378                         mov        eax, dword ptr [rbx + 0x78]
019a5 83c002                         add        eax, 2
019a8 894378                         mov        dword ptr [rbx + 0x78], eax
019ab 25feff1f00                     and        eax, 0x1ffffe
019b0 85c0                           test       eax, eax
019b2 0f840d2c0000                   je         0x7f102013fe45
019b8 48bb98846d14107f0000           movabs     rbx, 0x7f10146d8498
019c2 488383b000000001               add        qword ptr [rbx + 0xb0], 1
019ca 48bb0000000000000000           movabs     rbx, 0
019d4 bb00000000                     mov        ebx, 0
019d9 443bdb                         cmp        r11d, ebx
019dc 0f8c042c0000                   jl         0x7f102013fe66
019e2 443bde                         cmp        r11d, esi
019e5 0f8d1c2c0000                   jge        0x7f102013fe87
019eb 498bdb                         mov        rbx, r11
019ee 899c24c4010000                 mov        dword ptr [rsp + 0x1c4], ebx
019f5 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
019fd 488bbc24c8010000               mov        rdi, qword ptr [rsp + 0x1c8]
01a05 488bf7                         mov        rsi, rdi
01a08 48ba08a56d14107f0000           movabs     rdx, 0x7f10146da508
01a12 8b36                           mov        esi, dword ptr [rsi]
01a14 c1ee0d                         shr        esi, 0xd
01a17 48c1e60a                       shl        rsi, 0xa
01a1b 41ba00000010                   mov        r10d, 0x10000000
01a21 4903f2                         add        rsi, r10
01a24 41ba1f000000                   mov        r10d, 0x1f
01a2a 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01a2e 7436                           je         0x7f102013d2e6
01a30 4983c202                       add        r10, 2
01a34 4983fa23                       cmp        r10, 0x23
01a38 75f0                           jne        0x7f102013d2aa
01a3a 41ba1f000000                   mov        r10d, 0x1f
01a40 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01a45 7412                           je         0x7f102013d2d9
01a47 4983c202                       add        r10, 2
01a4b 4983fa23                       cmp        r10, 0x23
01a4f 75ef                           jne        0x7f102013d2c0
01a51 41ba1e000000                   mov        r10d, 0x1e
01a57 eb11                           jmp        0x7f102013d2ea
01a59 50                             push       rax
01a5a 4833c0                         xor        rax, rax
01a5d f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01a63 58                             pop        rax
01a64 ebbe                           jmp        0x7f102013d2a4
01a66 4983c201                       add        r10, 1
01a6a 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01a6f 488bf7                         mov        rsi, rdi
01a72 90                             nop        
01a73 90                             nop        
01a74 90                             nop        
01a75 48b8a81c5ff40f7f0000           movabs     rax, 0x7f0ff45f1ca8
01a7f e85c245f07                     call       0x7f102772f760
01a84 0f1f84007c1b0008               nop        dword ptr [rax + rax + 0x8001b7c]
01a8c 483b00                         cmp        rax, qword ptr [rax]
01a8f 488bf0                         mov        rsi, rax
01a92 48ba08a56d14107f0000           movabs     rdx, 0x7f10146da508
01a9c 8b36                           mov        esi, dword ptr [rsi]
01a9e c1ee0d                         shr        esi, 0xd
01aa1 48c1e60a                       shl        rsi, 0xa
01aa5 41ba00000010                   mov        r10d, 0x10000000
01aab 4903f2                         add        rsi, r10
01aae 41ba25000000                   mov        r10d, 0x25
01ab4 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01ab8 7436                           je         0x7f102013d370
01aba 4983c202                       add        r10, 2
01abe 4983fa29                       cmp        r10, 0x29
01ac2 75f0                           jne        0x7f102013d334
01ac4 41ba25000000                   mov        r10d, 0x25
01aca 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01acf 7412                           je         0x7f102013d363
01ad1 4983c202                       add        r10, 2
01ad5 4983fa29                       cmp        r10, 0x29
01ad9 75ef                           jne        0x7f102013d34a
01adb 41ba24000000                   mov        r10d, 0x24
01ae1 eb11                           jmp        0x7f102013d374
01ae3 50                             push       rax
01ae4 4833c0                         xor        rax, rax
01ae7 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01aed 58                             pop        rax
01aee ebbe                           jmp        0x7f102013d32e
01af0 4983c201                       add        r10, 1
01af4 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01af9 8b7024                         mov        esi, dword ptr [rax + 0x24]
01afc 4c3b2595a91022                 cmp        r12, qword ptr [rip + 0x2210a995]
01b03 0f8414000000                   je         0x7f102013d39d
01b09 48bf38a33140107f0000           movabs     rdi, 0x7f104031a338
01b13 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b17 e844914d21                     call       0x7f10416164e0
01b1c f4                             hlt        
01b1d 488bd0                         mov        rdx, rax
01b20 48b908a56d14107f0000           movabs     rcx, 0x7f10146da508
01b2a 8b12                           mov        edx, dword ptr [rdx]
01b2c c1ea0d                         shr        edx, 0xd
01b2f 48c1e20a                       shl        rdx, 0xa
01b33 41ba00000010                   mov        r10d, 0x10000000
01b39 4903d2                         add        rdx, r10
01b3c 41ba2b000000                   mov        r10d, 0x2b
01b42 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01b46 7436                           je         0x7f102013d3fe
01b48 4983c202                       add        r10, 2
01b4c 4983fa2f                       cmp        r10, 0x2f
01b50 75f0                           jne        0x7f102013d3c2
01b52 41ba2b000000                   mov        r10d, 0x2b
01b58 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01b5d 7412                           je         0x7f102013d3f1
01b5f 4983c202                       add        r10, 2
01b63 4983fa2f                       cmp        r10, 0x2f
01b67 75ef                           jne        0x7f102013d3d8
01b69 41ba2a000000                   mov        r10d, 0x2a
01b6f eb11                           jmp        0x7f102013d402
01b71 50                             push       rax
01b72 4833c0                         xor        rax, rax
01b75 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
01b7b 58                             pop        rax
01b7c ebbe                           jmp        0x7f102013d3bc
01b7e 4983c201                       add        r10, 1
01b82 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01b87 8b4804                         mov        ecx, dword ptr [rax + 4]
01b8a 48ba08a56d14107f0000           movabs     rdx, 0x7f10146da508
01b94 4883828001000001               add        qword ptr [rdx + 0x180], 1
01b9c 48ba50906d14107f0000           movabs     rdx, 0x7f10146d9050
01ba6 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01baa 4183c002                       add        r8d, 2
01bae 44894278                       mov        dword ptr [rdx + 0x78], r8d
01bb2 4181e0feff1f00                 and        r8d, 0x1ffffe
01bb9 4585c0                         test       r8d, r8d
01bbc 0f847f2a0000                   je         0x7f102013fec1
01bc2 48ba08a56d14107f0000           movabs     rdx, 0x7f10146da508
01bcc 4883829001000001               add        qword ptr [rdx + 0x190], 1
01bd4 8b9c24c4010000                 mov        ebx, dword ptr [rsp + 0x1c4]
01bdb 4863db                         movsxd     rbx, ebx
01bde ba08000000                     mov        edx, 8
01be3 4c8bcb                         mov        r9, rbx
01be6 4c03ca                         add        r9, rdx
01be9 48bad8816d14107f0000           movabs     rdx, 0x7f10146d81d8
01bf3 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01bf7 4183c002                       add        r8d, 2
01bfb 44894278                       mov        dword ptr [rdx + 0x78], r8d
01bff 4181e0feff1f00                 and        r8d, 0x1ffffe
01c06 4585c0                         test       r8d, r8d
01c09 0f84532a0000                   je         0x7f102013fee2
01c0f 48bad8816d14107f0000           movabs     rdx, 0x7f10146d81d8
01c19 488382e000000001               add        qword ptr [rdx + 0xe0], 1
01c21 48ba58836d14107f0000           movabs     rdx, 0x7f10146d8358
01c2b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01c2f 4183c002                       add        r8d, 2
01c33 44894278                       mov        dword ptr [rdx + 0x78], r8d
01c37 4181e0feff1f00                 and        r8d, 0x1ffffe
01c3e 4585c0                         test       r8d, r8d
01c41 0f843c2a0000                   je         0x7f102013ff03
01c47 48ba08a56d14107f0000           movabs     rdx, 0x7f10146da508
01c51 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
01c59 48baa80970e200000000           movabs     rdx, 0xe27009a8
01c63 ba02000000                     mov        edx, 2
01c68 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
01c70 bf00000000                     mov        edi, 0
01c75 488b8424c8010000               mov        rax, qword ptr [rsp + 0x1c8]
01c7d 48890424                       mov        qword ptr [rsp], rax
01c81 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
01c89 4889442408                     mov        qword ptr [rsp + 8], rax
01c8e 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01c93 49baa80970e200000000           movabs     r10, 0xe27009a8
01c9d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ca2 90                             nop        
01ca3 90                             nop        
01ca4 90                             nop        
01ca5 90                             nop        
01ca6 90                             nop        
01ca7 e834275f07                     call       0x7f102772fc60
01cac 0f1f8400a41d0009               nop        dword ptr [rax + rax + 0x9001da4]
01cb4 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01cbc 4183c310                       add        r11d, 0x10
01cc0 8bb424c0010000                 mov        esi, dword ptr [rsp + 0x1c0]
01cc7 83c610                         add        esi, 0x10
01cca 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01cd2 ba02000000                     mov        edx, 2
01cd7 7c05                           jl         0x7f102013d55e
01cd9 ba00000000                     mov        edx, 0
01cde 48b948e76214107f0000           movabs     rcx, 0x7f101462e748
01ce8 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
01cec 4403c2                         add        r8d, edx
01cef 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
01cf3 85d2                           test       edx, edx
01cf5 7506                           jne        0x7f102013d57d
01cf7 41b802000000                   mov        r8d, 2
01cfd 4181e0fe3f0000                 and        r8d, 0x3ffe
01d04 4585c0                         test       r8d, r8d
01d07 0f8497290000                   je         0x7f102013ff24
01d0d 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01d11 418502                         test       dword ptr [r10], eax
01d14 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01d1c 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
01d26 b948050000                     mov        ecx, 0x548
01d2b 7c05                           jl         0x7f102013d5b2
01d2d b958050000                     mov        ecx, 0x558
01d32 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01d36 4d8d4001                       lea        r8, [r8 + 1]
01d3a 4c89040a                       mov        qword ptr [rdx + rcx], r8
01d3e 0f8c0cf5ffff                   jl         0x7f102013cad0
01d44 48be48e76214107f0000           movabs     rsi, 0x7f101462e748
01d4e ff8668050000                   inc        dword ptr [rsi + 0x568]
01d54 e9f0000000                     jmp        0x7f102013d6c9
01d59 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
01d63 4883828005000001               add        qword ptr [rdx + 0x580], 1
01d6b 488bb42468010000               mov        rsi, qword ptr [rsp + 0x168]
01d73 8b942490010000                 mov        edx, dword ptr [rsp + 0x190]
01d7a 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
01d82 448b842474010000               mov        r8d, dword ptr [rsp + 0x174]
01d8a 4c8bcf                         mov        r9, rdi
01d8d 4885c9                         test       rcx, rcx
01d90 0f842f290000                   je         0x7f102013ff45
01d96 85d2                           test       edx, edx
01d98 0f8c27290000                   jl         0x7f102013ff45
01d9e 4585c0                         test       r8d, r8d
01da1 0f8c1e290000                   jl         0x7f102013ff45
01da7 4a8d3c0a                       lea        rdi, [rdx + r9]
01dab 3b7e04                         cmp        edi, dword ptr [rsi + 4]
01dae 0f8711290000                   ja         0x7f102013ff45
01db4 4b8d3c08                       lea        rdi, [r8 + r9]
01db8 3b7904                         cmp        edi, dword ptr [rcx + 4]
01dbb 0f8704290000                   ja         0x7f102013ff45
01dc1 4585c9                         test       r9d, r9d
01dc4 0f8cfb280000                   jl         0x7f102013ff45
01dca 4863d2                         movsxd     rdx, edx
01dcd 4d63c0                         movsxd     r8, r8d
01dd0 48bf0014041000000000           movabs     rdi, 0x10041400
01dda 41ba00000010                   mov        r10d, 0x10000000
01de0 492bfa                         sub        rdi, r10
01de3 48c1ef0a                       shr        rdi, 0xa
01de7 448b19                         mov        r11d, dword ptr [rcx]
01dea 41c1eb0d                       shr        r11d, 0xd
01dee 413bfb                         cmp        edi, r11d
01df1 0f8510000000                   jne        0x7f102013d687
01df7 448b1e                         mov        r11d, dword ptr [rsi]
01dfa 41c1eb0d                       shr        r11d, 0xd
01dfe 413bfb                         cmp        edi, r11d
01e01 0f8414000000                   je         0x7f102013d69b
01e07 48bf88152b40107f0000           movabs     rdi, 0x7f10402b1588
01e11 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e15 e8468e4d21                     call       0x7f10416164e0
01e1a f4                             hlt        
01e1b 488d7c1608                     lea        rdi, [rsi + rdx + 8]
01e20 4a8d740108                     lea        rsi, [rcx + r8 + 8]
01e25 498bd1                         mov        rdx, r9
01e28 40f6c40f                       test       spl, 0xf
01e2c 0f8412000000                   je         0x7f102013d6c4
01e32 4883ec08                       sub        rsp, 8
01e36 e885ba5d07                     call       0x7f1027719140
01e3b 4883c408                       add        rsp, 8
01e3f e905000000                     jmp        0x7f102013d6c9
01e44 e877ba5d07                     call       0x7f1027719140
01e49 8bb424a4010000                 mov        esi, dword ptr [rsp + 0x1a4]
01e50 8b9c24a0010000                 mov        ebx, dword ptr [rsp + 0x1a0]
01e57 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
01e5f 488bfb                         mov        rdi, rbx
01e62 2bbc24a8010000                 sub        edi, dword ptr [rsp + 0x1a8]
01e69 4183f810                       cmp        r8d, 0x10
01e6d 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
01e77 b990050000                     mov        ecx, 0x590
01e7c 7f05                           jg         0x7f102013d703
01e7e b9a0050000                     mov        ecx, 0x5a0
01e83 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
01e87 4d8d4901                       lea        r9, [r9 + 1]
01e8b 4c890c0a                       mov        qword ptr [rdx + rcx], r9
01e8f 448b8c24a8010000               mov        r9d, dword ptr [rsp + 0x1a8]
01e97 0f8f2c000000                   jg         0x7f102013d749
01e9d 4183f910                       cmp        r9d, 0x10
01ea1 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
01eab b9c0050000                     mov        ecx, 0x5c0
01eb0 7d05                           jge        0x7f102013d737
01eb2 b9b0050000                     mov        ecx, 0x5b0
01eb7 488b040a                       mov        rax, qword ptr [rdx + rcx]
01ebb 488d4001                       lea        rax, [rax + 1]
01ebf 4889040a                       mov        qword ptr [rdx + rcx], rax
01ec3 0f8d23110000                   jge        0x7f102013e86c
01ec9 453bc8                         cmp        r9d, r8d
01ecc 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
01ed6 b928060000                     mov        ecx, 0x628
01edb 7c05                           jl         0x7f102013d762
01edd b938060000                     mov        ecx, 0x638
01ee2 488b040a                       mov        rax, qword ptr [rdx + rcx]
01ee6 488d4001                       lea        rax, [rax + 1]
01eea 4889040a                       mov        qword ptr [rdx + rcx], rax
01eee 0f8c59030000                   jl         0x7f102013dacd
01ef4 4183f830                       cmp        r8d, 0x30
01ef8 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
01f02 b948060000                     mov        ecx, 0x648
01f07 7e05                           jle        0x7f102013d78e
01f09 b958060000                     mov        ecx, 0x658
01f0e 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
01f12 4d8d4901                       lea        r9, [r9 + 1]
01f16 4c890c0a                       mov        qword ptr [rdx + rcx], r9
01f1a 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
01f21 0f8e0f010000                   jle        0x7f102013d8b6
01f27 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
01f31 4883826806000001               add        qword ptr [rdx + 0x668], 1
01f39 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
01f41 488bd7                         mov        rdx, rdi
01f44 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
01f4c 498bf8                         mov        rdi, r8
01f4f 4c8bc3                         mov        r8, rbx
01f52 4c8bcf                         mov        r9, rdi
01f55 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
01f5c 4885f6                         test       rsi, rsi
01f5f 0f846c270000                   je         0x7f102013ff51
01f65 4885c9                         test       rcx, rcx
01f68 0f8463270000                   je         0x7f102013ff51
01f6e 85d2                           test       edx, edx
01f70 0f8c5b270000                   jl         0x7f102013ff51
01f76 4585c0                         test       r8d, r8d
01f79 0f8c52270000                   jl         0x7f102013ff51
01f7f 4a8d3c0a                       lea        rdi, [rdx + r9]
01f83 3b7e04                         cmp        edi, dword ptr [rsi + 4]
01f86 0f8745270000                   ja         0x7f102013ff51
01f8c 4b8d3c08                       lea        rdi, [r8 + r9]
01f90 3b7904                         cmp        edi, dword ptr [rcx + 4]
01f93 0f8738270000                   ja         0x7f102013ff51
01f99 4585c9                         test       r9d, r9d
01f9c 0f8c2f270000                   jl         0x7f102013ff51
01fa2 4863d2                         movsxd     rdx, edx
01fa5 4d63c0                         movsxd     r8, r8d
01fa8 48bf0014041000000000           movabs     rdi, 0x10041400
01fb2 41ba00000010                   mov        r10d, 0x10000000
01fb8 492bfa                         sub        rdi, r10
01fbb 48c1ef0a                       shr        rdi, 0xa
01fbf 448b19                         mov        r11d, dword ptr [rcx]
01fc2 41c1eb0d                       shr        r11d, 0xd
01fc6 413bfb                         cmp        edi, r11d
01fc9 0f8510000000                   jne        0x7f102013d85f
01fcf 448b1e                         mov        r11d, dword ptr [rsi]
01fd2 41c1eb0d                       shr        r11d, 0xd
01fd6 413bfb                         cmp        edi, r11d
01fd9 0f8414000000                   je         0x7f102013d873
01fdf 48bf88152b40107f0000           movabs     rdi, 0x7f10402b1588
01fe9 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fed e86e8c4d21                     call       0x7f10416164e0
01ff2 f4                             hlt        
01ff3 488d7c1608                     lea        rdi, [rsi + rdx + 8]
01ff8 4a8d740108                     lea        rsi, [rcx + r8 + 8]
01ffd 498bd1                         mov        rdx, r9
02000 40f6c40f                       test       spl, 0xf
02004 0f8412000000                   je         0x7f102013d89c
0200a 4883ec08                       sub        rsp, 8
0200e e8adb85d07                     call       0x7f1027719140
02013 4883c408                       add        rsp, 8
02017 e905000000                     jmp        0x7f102013d8a1
0201c e89fb85d07                     call       0x7f1027719140
02021 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
0202b ff8278060000                   inc        dword ptr [rdx + 0x678]
02031 e9f4010000                     jmp        0x7f102013daaa
02036 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
0203d 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
02044 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
0204b 899c24e0010000                 mov        dword ptr [rsp + 0x1e0], ebx
02052 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
02059 90                             nop        
0205a 90                             nop        
0205b 90                             nop        
0205c 90                             nop        
0205d 90                             nop        
0205e 90                             nop        
0205f 90                             nop        
02060 898424d8010000                 mov        dword ptr [rsp + 0x1d8], eax
02067 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0206f 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
02079 4883829006000001               add        qword ptr [rdx + 0x690], 1
02081 48ba206a101000000000           movabs     rdx, 0x10106a20
0208b 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0208e 83c102                         add        ecx, 2
02091 894a78                         mov        dword ptr [rdx + 0x78], ecx
02094 81e1feff1f00                   and        ecx, 0x1ffffe
0209a 85c9                           test       ecx, ecx
0209c 0f843f260000                   je         0x7f102013ff61
020a2 90                             nop        
020a3 90                             nop        
020a4 90                             nop        
020a5 90                             nop        
020a6 90                             nop        
020a7 90                             nop        
020a8 e964260000                     jmp        0x7f102013ff91
020ad 90                             nop        
020ae 90                             nop        
020af 90                             nop        
020b0 90                             nop        
020b1 90                             nop        
020b2 48ba206a101000000000           movabs     rdx, 0x10106a20
020bc 488d92e0000000                 lea        rdx, [rdx + 0xe0]
020c3 4885c0                         test       rax, rax
020c6 7510                           jne        0x7f102013d958
020c8 f6420801                       test       byte ptr [rdx + 8], 1
020cc 0f8506000000                   jne        0x7f102013d958
020d2 f048834a0801                   lock or    qword ptr [rdx + 8], 1
020d8 48be78c66be200000000           movabs     rsi, 0xe26bc678
020e2 488bd6                         mov        rdx, rsi
020e5 48b9206a101000000000           movabs     rcx, 0x10106a20
020ef 8b12                           mov        edx, dword ptr [rdx]
020f1 c1ea0d                         shr        edx, 0xd
020f4 48c1e20a                       shl        rdx, 0xa
020f8 41ba00000010                   mov        r10d, 0x10000000
020fe 4903d2                         add        rdx, r10
02101 41ba17000000                   mov        r10d, 0x17
02107 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0210b 7436                           je         0x7f102013d9c3
0210d 4983c202                       add        r10, 2
02111 4983fa1b                       cmp        r10, 0x1b
02115 75f0                           jne        0x7f102013d987
02117 41ba17000000                   mov        r10d, 0x17
0211d 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02122 7412                           je         0x7f102013d9b6
02124 4983c202                       add        r10, 2
02128 4983fa1b                       cmp        r10, 0x1b
0212c 75ef                           jne        0x7f102013d99d
0212e 41ba16000000                   mov        r10d, 0x16
02134 eb11                           jmp        0x7f102013d9c7
02136 50                             push       rax
02137 4833c0                         xor        rax, rax
0213a f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02140 58                             pop        rax
02141 ebbe                           jmp        0x7f102013d981
02143 4983c201                       add        r10, 1
02147 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0214c 488bd0                         mov        rdx, rax
0214f 488bcf                         mov        rcx, rdi
02152 89bc24dc010000                 mov        dword ptr [rsp + 0x1dc], edi
02159 90                             nop        
0215a 90                             nop        
0215b 90                             nop        
0215c 90                             nop        
0215d 90                             nop        
0215e 90                             nop        
0215f e87c185f07                     call       0x7f102772f260
02164 0f1f84005c22000b               nop        dword ptr [rax + rax + 0xb00225c]
0216c 48be48e76214107f0000           movabs     rsi, 0x7f101462e748
02176 488386a006000001               add        qword ptr [rsi + 0x6a0], 1
0217e 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
02186 8b9424d8010000                 mov        edx, dword ptr [rsp + 0x1d8]
0218d 488bc8                         mov        rcx, rax
02190 90                             nop        
02191 90                             nop        
02192 90                             nop        
02193 90                             nop        
02194 90                             nop        
02195 90                             nop        
02196 90                             nop        
02197 e844225f07                     call       0x7f102772fc60
0219c 0f1f84009422000c               nop        dword ptr [rax + rax + 0xc002294]
021a4 8b8424d8010000                 mov        eax, dword ptr [rsp + 0x1d8]
021ab 83c008                         add        eax, 8
021ae 8bbc24dc010000                 mov        edi, dword ptr [rsp + 0x1dc]
021b5 83c708                         add        edi, 8
021b8 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
021bf be02000000                     mov        esi, 2
021c4 7c05                           jl         0x7f102013da4b
021c6 be00000000                     mov        esi, 0
021cb 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
021d5 8b4a7c                         mov        ecx, dword ptr [rdx + 0x7c]
021d8 03ce                           add        ecx, esi
021da 894a7c                         mov        dword ptr [rdx + 0x7c], ecx
021dd 85f6                           test       esi, esi
021df 7505                           jne        0x7f102013da66
021e1 b902000000                     mov        ecx, 2
021e6 81e1fe3f0000                   and        ecx, 0x3ffe
021ec 85c9                           test       ecx, ecx
021ee 0f8427250000                   je         0x7f102013ff9b
021f4 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
021f8 418502                         test       dword ptr [r10], eax
021fb 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
02202 48be48e76214107f0000           movabs     rsi, 0x7f101462e748
0220c bab0060000                     mov        edx, 0x6b0
02211 7c05                           jl         0x7f102013da98
02213 bac0060000                     mov        edx, 0x6c0
02218 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0221c 488d4901                       lea        rcx, [rcx + 1]
02220 48890c16                       mov        qword ptr [rsi + rdx], rcx
02224 0f8c36feffff                   jl         0x7f102013d8e0
0222a 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
02231 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
02238 48be48e76214107f0000           movabs     rsi, 0x7f101462e748
02242 ff86d0060000                   inc        dword ptr [rsi + 0x6d0]
02248 e9c9170000                     jmp        0x7f102013f296
0224d 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
02254 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
0225b 4183f910                       cmp        r9d, 0x10
0225f 48be48e76214107f0000           movabs     rsi, 0x7f101462e748
02269 bae8060000                     mov        edx, 0x6e8
0226e 7c05                           jl         0x7f102013daf5
02270 baf8060000                     mov        edx, 0x6f8
02275 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
02279 488d4901                       lea        rcx, [rcx + 1]
0227d 48890c16                       mov        qword ptr [rsi + rdx], rcx
02281 0f8ced0a0000                   jl         0x7f102013e5f4
02287 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
0228e 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
02295 899c24f0010000                 mov        dword ptr [rsp + 0x1f0], ebx
0229c 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
022a3 90                             nop        
022a4 90                             nop        
022a5 90                             nop        
022a6 90                             nop        
022a7 90                             nop        
022a8 898424ec010000                 mov        dword ptr [rsp + 0x1ec], eax
022af 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
022b7 48be48e76214107f0000           movabs     rsi, 0x7f101462e748
022c1 4883860807000001               add        qword ptr [rsi + 0x708], 1
022c9 48be00986d14107f0000           movabs     rsi, 0x7f10146d9800
022d3 8b5678                         mov        edx, dword ptr [rsi + 0x78]
022d6 83c202                         add        edx, 2
022d9 895678                         mov        dword ptr [rsi + 0x78], edx
022dc 81e2feff1f00                   and        edx, 0x1ffffe
022e2 85d2                           test       edx, edx
022e4 0f8452240000                   je         0x7f102013ffbc
022ea 48bef8926ee200000000           movabs     rsi, 0xe26e92f8
022f4 48ba00986d14107f0000           movabs     rdx, 0x7f10146d9800
022fe 8b36                           mov        esi, dword ptr [rsi]
02300 c1ee0d                         shr        esi, 0xd
02303 48c1e60a                       shl        rsi, 0xa
02307 41ba00000010                   mov        r10d, 0x10000000
0230d 4903f2                         add        rsi, r10
02310 41ba17000000                   mov        r10d, 0x17
02316 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
0231a 7436                           je         0x7f102013dbd2
0231c 4983c202                       add        r10, 2
02320 4983fa1b                       cmp        r10, 0x1b
02324 75f0                           jne        0x7f102013db96
02326 41ba17000000                   mov        r10d, 0x17
0232c 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02331 7412                           je         0x7f102013dbc5
02333 4983c202                       add        r10, 2
02337 4983fa1b                       cmp        r10, 0x1b
0233b 75ef                           jne        0x7f102013dbac
0233d 41ba16000000                   mov        r10d, 0x16
02343 eb11                           jmp        0x7f102013dbd6
02345 50                             push       rax
02346 4833c0                         xor        rax, rax
02349 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
0234f 58                             pop        rax
02350 ebbe                           jmp        0x7f102013db90
02352 4983c201                       add        r10, 1
02356 4a8304d201                     add        qword ptr [rdx + r10*8], 1
0235b 448b6804                       mov        r13d, dword ptr [rax + 4]
0235f 48be00986d14107f0000           movabs     rsi, 0x7f10146d9800
02369 488386e000000001               add        qword ptr [rsi + 0xe0], 1
02371 48be088e6d14107f0000           movabs     rsi, 0x7f10146d8e08
0237b 8b5678                         mov        edx, dword ptr [rsi + 0x78]
0237e 83c202                         add        edx, 2
02381 895678                         mov        dword ptr [rsi + 0x78], edx
02384 81e2feff1f00                   and        edx, 0x1ffffe
0238a 85d2                           test       edx, edx
0238c 0f84e4230000                   je         0x7f102013fff6
02392 48be088e6d14107f0000           movabs     rsi, 0x7f10146d8e08
0239c 4883861001000001               add        qword ptr [rsi + 0x110], 1
023a4 498bf5                         mov        rsi, r13
023a7 83ee0f                         sub        esi, 0xf
023aa 48ba98846d14107f0000           movabs     rdx, 0x7f10146d8498
023b4 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
023b7 83c102                         add        ecx, 2
023ba 894a78                         mov        dword ptr [rdx + 0x78], ecx
023bd 81e1feff1f00                   and        ecx, 0x1ffffe
023c3 85c9                           test       ecx, ecx
023c5 0f84cc230000                   je         0x7f1020140017
023cb 48ba98846d14107f0000           movabs     rdx, 0x7f10146d8498
023d5 488382b000000001               add        qword ptr [rdx + 0xb0], 1
023dd 48ba0000000000000000           movabs     rdx, 0
023e7 ba00000000                     mov        edx, 0
023ec 3bfa                           cmp        edi, edx
023ee 0f8cc4230000                   jl         0x7f1020140038
023f4 3bfe                           cmp        edi, esi
023f6 0f8ddd230000                   jge        0x7f1020140059
023fc 488bf7                         mov        rsi, rdi
023ff 48baf8926ee200000000           movabs     rdx, 0xe26e92f8
02409 488bca                         mov        rcx, rdx
0240c 49b800986d14107f0000           movabs     r8, 0x7f10146d9800
02416 8b09                           mov        ecx, dword ptr [rcx]
02418 c1e90d                         shr        ecx, 0xd
0241b 48c1e10a                       shl        rcx, 0xa
0241f 41ba00000010                   mov        r10d, 0x10000000
02425 4903ca                         add        rcx, r10
02428 41ba25000000                   mov        r10d, 0x25
0242e 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
02432 7436                           je         0x7f102013dcea
02434 4983c202                       add        r10, 2
02438 4983fa29                       cmp        r10, 0x29
0243c 75f0                           jne        0x7f102013dcae
0243e 41ba25000000                   mov        r10d, 0x25
02444 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
02449 7412                           je         0x7f102013dcdd
0244b 4983c202                       add        r10, 2
0244f 4983fa29                       cmp        r10, 0x29
02453 75ef                           jne        0x7f102013dcc4
02455 41ba24000000                   mov        r10d, 0x24
0245b eb11                           jmp        0x7f102013dcee
0245d 50                             push       rax
0245e 4833c0                         xor        rax, rax
02461 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
02467 58                             pop        rax
02468 ebbe                           jmp        0x7f102013dca8
0246a 4983c201                       add        r10, 1
0246e 4b8304d001                     add        qword ptr [r8 + r10*8], 1
02473 48b9a0856d14107f0000           movabs     rcx, 0x7f10146d85a0
0247d 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
02481 4183c002                       add        r8d, 2
02485 44894178                       mov        dword ptr [rcx + 0x78], r8d
02489 4181e0feff1f00                 and        r8d, 0x1ffffe
02490 4585c0                         test       r8d, r8d
02493 0f8461230000                   je         0x7f102014007a
02499 48b9a0856d14107f0000           movabs     rcx, 0x7f10146d85a0
024a3 488381b000000001               add        qword ptr [rcx + 0xb0], 1
024ab 48bad0866d14107f0000           movabs     rdx, 0x7f10146d86d0
024b5 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
024b8 83c102                         add        ecx, 2
024bb 894a78                         mov        dword ptr [rdx + 0x78], ecx
024be 81e1feff1f00                   and        ecx, 0x1ffffe
024c4 85c9                           test       ecx, ecx
024c6 0f844f230000                   je         0x7f102014009b
024cc 48bad0866d14107f0000           movabs     rdx, 0x7f10146d86d0
024d6 ff82c0000000                   inc        dword ptr [rdx + 0xc0]
024dc 4489ac24e8010000               mov        dword ptr [rsp + 0x1e8], r13d
024e4 89bc24e4010000                 mov        dword ptr [rsp + 0x1e4], edi
024eb 48baf0126fe200000000           movabs     rdx, 0xe26f12f0
024f5 488bca                         mov        rcx, rdx
024f8 49b800986d14107f0000           movabs     r8, 0x7f10146d9800
02502 4983806001000001               add        qword ptr [r8 + 0x160], 1
0250a 48b9d0996d14107f0000           movabs     rcx, 0x7f10146d99d0
02514 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
02518 4183c002                       add        r8d, 2
0251c 44894178                       mov        dword ptr [rcx + 0x78], r8d
02520 4181e0feff1f00                 and        r8d, 0x1ffffe
02527 4585c0                         test       r8d, r8d
0252a 0f840c230000                   je         0x7f10201400bc
02530 488bca                         mov        rcx, rdx
02533 49b8d0996d14107f0000           movabs     r8, 0x7f10146d99d0
0253d 498380b000000001               add        qword ptr [r8 + 0xb0], 1
02545 48b9b89a6d14107f0000           movabs     rcx, 0x7f10146d9ab8
0254f 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
02553 4183c002                       add        r8d, 2
02557 44894178                       mov        dword ptr [rcx + 0x78], r8d
0255b 4181e0feff1f00                 and        r8d, 0x1ffffe
02562 4585c0                         test       r8d, r8d
02565 0f84f2220000                   je         0x7f10201400dd
0256b 48b9b89a6d14107f0000           movabs     rcx, 0x7f10146d9ab8
02575 488381c000000001               add        qword ptr [rcx + 0xc0], 1
0257d 48ba888f6d14107f0000           movabs     rdx, 0x7f10146d8f88
02587 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0258a 83c102                         add        ecx, 2
0258d 894a78                         mov        dword ptr [rdx + 0x78], ecx
02590 81e1feff1f00                   and        ecx, 0x1ffffe
02596 85c9                           test       ecx, ecx
02598 0f84e0220000                   je         0x7f10201400fe
0259e 48baf8926ee200000000           movabs     rdx, 0xe26e92f8
025a8 488bca                         mov        rcx, rdx
025ab 49b8b89a6d14107f0000           movabs     r8, 0x7f10146d9ab8
025b5 8b09                           mov        ecx, dword ptr [rcx]
025b7 c1e90d                         shr        ecx, 0xd
025ba 48c1e10a                       shl        rcx, 0xa
025be 41ba00000010                   mov        r10d, 0x10000000
025c4 4903ca                         add        rcx, r10
025c7 41ba1d000000                   mov        r10d, 0x1d
025cd 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
025d1 7436                           je         0x7f102013de89
025d3 4983c202                       add        r10, 2
025d7 4983fa21                       cmp        r10, 0x21
025db 75f0                           jne        0x7f102013de4d
025dd 41ba1d000000                   mov        r10d, 0x1d
025e3 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
025e8 7412                           je         0x7f102013de7c
025ea 4983c202                       add        r10, 2
025ee 4983fa21                       cmp        r10, 0x21
025f2 75ef                           jne        0x7f102013de63
025f4 41ba1c000000                   mov        r10d, 0x1c
025fa eb11                           jmp        0x7f102013de8d
025fc 50                             push       rax
025fd 4833c0                         xor        rax, rax
02600 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
02606 58                             pop        rax
02607 ebbe                           jmp        0x7f102013de47
02609 4983c201                       add        r10, 1
0260d 4b8304d001                     add        qword ptr [r8 + r10*8], 1
02612 48b9b89a6d14107f0000           movabs     rcx, 0x7f10146d9ab8
0261c 8b12                           mov        edx, dword ptr [rdx]
0261e c1ea0d                         shr        edx, 0xd
02621 48c1e20a                       shl        rdx, 0xa
02625 41ba00000010                   mov        r10d, 0x10000000
0262b 4903d2                         add        rdx, r10
0262e 41ba23000000                   mov        r10d, 0x23
02634 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02638 7436                           je         0x7f102013def0
0263a 4983c202                       add        r10, 2
0263e 4983fa27                       cmp        r10, 0x27
02642 75f0                           jne        0x7f102013deb4
02644 41ba23000000                   mov        r10d, 0x23
0264a 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0264f 7412                           je         0x7f102013dee3
02651 4983c202                       add        r10, 2
02655 4983fa27                       cmp        r10, 0x27
02659 75ef                           jne        0x7f102013deca
0265b 41ba22000000                   mov        r10d, 0x22
02661 eb11                           jmp        0x7f102013def4
02663 50                             push       rax
02664 4833c0                         xor        rax, rax
02667 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
0266d 58                             pop        rax
0266e ebbe                           jmp        0x7f102013deae
02670 4983c201                       add        r10, 1
02674 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02679 48bab89a6d14107f0000           movabs     rdx, 0x7f10146d9ab8
02683 4883824001000001               add        qword ptr [rdx + 0x140], 1
0268b 48ba50906d14107f0000           movabs     rdx, 0x7f10146d9050
02695 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02698 83c102                         add        ecx, 2
0269b 894a78                         mov        dword ptr [rdx + 0x78], ecx
0269e 81e1feff1f00                   and        ecx, 0x1ffffe
026a4 85c9                           test       ecx, ecx
026a6 0f84f3210000                   je         0x7f102014011f
026ac 48bab89a6d14107f0000           movabs     rdx, 0x7f10146d9ab8
026b6 4883825001000001               add        qword ptr [rdx + 0x150], 1
026be 4c63f6                         movsxd     r14, esi
026c1 be08000000                     mov        esi, 8
026c6 4d8bce                         mov        r9, r14
026c9 4c03ce                         add        r9, rsi
026cc 48bed8816d14107f0000           movabs     rsi, 0x7f10146d81d8
026d6 8b5678                         mov        edx, dword ptr [rsi + 0x78]
026d9 83c202                         add        edx, 2
026dc 895678                         mov        dword ptr [rsi + 0x78], edx
026df 81e2feff1f00                   and        edx, 0x1ffffe
026e5 85d2                           test       edx, edx
026e7 0f84d3210000                   je         0x7f1020140140
026ed 48bed8816d14107f0000           movabs     rsi, 0x7f10146d81d8
026f7 488386e000000001               add        qword ptr [rsi + 0xe0], 1
026ff 48be58836d14107f0000           movabs     rsi, 0x7f10146d8358
02709 8b5678                         mov        edx, dword ptr [rsi + 0x78]
0270c 83c202                         add        edx, 2
0270f 895678                         mov        dword ptr [rsi + 0x78], edx
02712 81e2feff1f00                   and        edx, 0x1ffffe
02718 85d2                           test       edx, edx
0271a 0f84c1210000                   je         0x7f1020140161
02720 48beb89a6d14107f0000           movabs     rsi, 0x7f10146d9ab8
0272a 4883867001000001               add        qword ptr [rsi + 0x170], 1
02732 48bec06b6fe200000000           movabs     rsi, 0xe26f6bc0
0273c 48be40936ee200000000           movabs     rsi, 0xe26e9340
02746 ba02000000                     mov        edx, 2
0274b b910000000                     mov        ecx, 0x10
02750 4c8bc0                         mov        r8, rax
02753 bf00000000                     mov        edi, 0
02758 48890424                       mov        qword ptr [rsp], rax
0275c 4c89742408                     mov        qword ptr [rsp + 8], r14
02761 49baf8926ee200000000           movabs     r10, 0xe26e92f8
0276b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02770 49bac06b6fe200000000           movabs     r10, 0xe26f6bc0
0277a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0277f e85c1c5f07                     call       0x7f102772fc60
02784 0f1f84007c28000e               nop        dword ptr [rax + rax + 0xe00287c]
0278c 4885c0                         test       rax, rax
0278f 48bbb89a6d14107f0000           movabs     rbx, 0x7f10146d9ab8
02799 750c                           jne        0x7f102013e027
0279b 808b7901000001                 or         byte ptr [rbx + 0x179], 1
027a2 e988000000                     jmp        0x7f102013e0af
027a7 8b38                           mov        edi, dword ptr [rax]
027a9 c1ef0d                         shr        edi, 0xd
027ac 48c1e70a                       shl        rdi, 0xa
027b0 41ba00000010                   mov        r10d, 0x10000000
027b6 4903fa                         add        rdi, r10
027b9 41ba31000000                   mov        r10d, 0x31
027bf 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
027c3 7436                           je         0x7f102013e07b
027c5 4983c202                       add        r10, 2
027c9 4983fa35                       cmp        r10, 0x35
027cd 75f0                           jne        0x7f102013e03f
027cf 41ba31000000                   mov        r10d, 0x31
027d5 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
027da 7412                           je         0x7f102013e06e
027dc 4983c202                       add        r10, 2
027e0 4983fa35                       cmp        r10, 0x35
027e4 75ef                           jne        0x7f102013e055
027e6 41ba30000000                   mov        r10d, 0x30
027ec eb11                           jmp        0x7f102013e07f
027ee 50                             push       rax
027ef 4833c0                         xor        rax, rax
027f2 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
027f8 58                             pop        rax
027f9 ebbe                           jmp        0x7f102013e039
027fb 4983c201                       add        r10, 1
027ff 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02804 48bf00b0141000000000           movabs     rdi, 0x1014b000
0280e 8b18                           mov        ebx, dword ptr [rax]
02810 c1eb0d                         shr        ebx, 0xd
02813 48c1e30a                       shl        rbx, 0xa
02817 41ba00000010                   mov        r10d, 0x10000000
0281d 4903da                         add        rbx, r10
02820 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
02824 0f85d8200000                   jne        0x7f1020140182
0282a e900000000                     jmp        0x7f102013e0af
0282f 488bf8                         mov        rdi, rax
02832 4889bc24f8010000               mov        qword ptr [rsp + 0x1f8], rdi
0283a 483b07                         cmp        rax, qword ptr [rdi]
0283d 488bf7                         mov        rsi, rdi
02840 48bb48e76214107f0000           movabs     rbx, 0x7f101462e748
0284a 8b36                           mov        esi, dword ptr [rsi]
0284c c1ee0d                         shr        esi, 0xd
0284f 48c1e60a                       shl        rsi, 0xa
02853 41ba00000010                   mov        r10d, 0x10000000
02859 4903f2                         add        rsi, r10
0285c 41bae4000000                   mov        r10d, 0xe4
02862 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02866 743c                           je         0x7f102013e124
02868 4983c202                       add        r10, 2
0286c 4981fae8000000                 cmp        r10, 0xe8
02873 75ed                           jne        0x7f102013e0e2
02875 41bae4000000                   mov        r10d, 0xe4
0287b 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02880 7415                           je         0x7f102013e117
02882 4983c202                       add        r10, 2
02886 4981fae8000000                 cmp        r10, 0xe8
0288d 75ec                           jne        0x7f102013e0fb
0288f 41bae3000000                   mov        r10d, 0xe3
02895 eb11                           jmp        0x7f102013e128
02897 50                             push       rax
02898 4833c0                         xor        rax, rax
0289b f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
028a1 58                             pop        rax
028a2 ebb8                           jmp        0x7f102013e0dc
028a4 4983c201                       add        r10, 1
028a8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
028ad 48be08a56d14107f0000           movabs     rsi, 0x7f10146da508
028b7 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
028ba 83c302                         add        ebx, 2
028bd 895e78                         mov        dword ptr [rsi + 0x78], ebx
028c0 81e3feff1f00                   and        ebx, 0x1ffffe
028c6 85db                           test       ebx, ebx
028c8 0f846a200000                   je         0x7f10201401b8
028ce 488bf7                         mov        rsi, rdi
028d1 48bb08a56d14107f0000           movabs     rbx, 0x7f10146da508
028db 8b36                           mov        esi, dword ptr [rsi]
028dd c1ee0d                         shr        esi, 0xd
028e0 48c1e60a                       shl        rsi, 0xa
028e4 41ba00000010                   mov        r10d, 0x10000000
028ea 4903f2                         add        rsi, r10
028ed 41ba17000000                   mov        r10d, 0x17
028f3 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
028f7 7436                           je         0x7f102013e1af
028f9 4983c202                       add        r10, 2
028fd 4983fa1b                       cmp        r10, 0x1b
02901 75f0                           jne        0x7f102013e173
02903 41ba17000000                   mov        r10d, 0x17
02909 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0290e 7412                           je         0x7f102013e1a2
02910 4983c202                       add        r10, 2
02914 4983fa1b                       cmp        r10, 0x1b
02918 75ef                           jne        0x7f102013e189
0291a 41ba16000000                   mov        r10d, 0x16
02920 eb11                           jmp        0x7f102013e1b3
02922 50                             push       rax
02923 4833c0                         xor        rax, rax
02926 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
0292c 58                             pop        rax
0292d ebbe                           jmp        0x7f102013e16d
0292f 4983c201                       add        r10, 1
02933 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02938 488bf7                         mov        rsi, rdi
0293b 90                             nop        
0293c 90                             nop        
0293d 48b8d01c5ff40f7f0000           movabs     rax, 0x7f0ff45f1cd0
02947 e894155f07                     call       0x7f102772f760
0294c 0f1f8400442a000f               nop        dword ptr [rax + rax + 0xf002a44]
02954 48be08a56d14107f0000           movabs     rsi, 0x7f10146da508
0295e 488386e000000001               add        qword ptr [rsi + 0xe0], 1
02966 48be088e6d14107f0000           movabs     rsi, 0x7f10146d8e08
02970 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
02973 83c702                         add        edi, 2
02976 897e78                         mov        dword ptr [rsi + 0x78], edi
02979 81e7feff1f00                   and        edi, 0x1ffffe
0297f 85ff                           test       edi, edi
02981 0f84d21f0000                   je         0x7f10201401d9
02987 448bac24e8010000               mov        r13d, dword ptr [rsp + 0x1e8]
0298f 8bbc24ec010000                 mov        edi, dword ptr [rsp + 0x1ec]
02996 48be088e6d14107f0000           movabs     rsi, 0x7f10146d8e08
029a0 4883861001000001               add        qword ptr [rsi + 0x110], 1
029a8 ffc8                           dec        eax
029aa 442be8                         sub        r13d, eax
029ad 48be98846d14107f0000           movabs     rsi, 0x7f10146d8498
029b7 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
029ba 83c302                         add        ebx, 2
029bd 895e78                         mov        dword ptr [rsi + 0x78], ebx
029c0 81e3feff1f00                   and        ebx, 0x1ffffe
029c6 85db                           test       ebx, ebx
029c8 0f84ac1f0000                   je         0x7f10201401fa
029ce 48be98846d14107f0000           movabs     rsi, 0x7f10146d8498
029d8 488386b000000001               add        qword ptr [rsi + 0xb0], 1
029e0 48be0000000000000000           movabs     rsi, 0
029ea be00000000                     mov        esi, 0
029ef 3bfe                           cmp        edi, esi
029f1 0f8ca41f0000                   jl         0x7f102014021b
029f7 413bfd                         cmp        edi, r13d
029fa 0f8dbc1f0000                   jge        0x7f102014023c
02a00 488bc7                         mov        rax, rdi
02a03 898424f4010000                 mov        dword ptr [rsp + 0x1f4], eax
02a0a 89bc24ec010000                 mov        dword ptr [rsp + 0x1ec], edi
02a11 488bbc24f8010000               mov        rdi, qword ptr [rsp + 0x1f8]
02a19 488bf7                         mov        rsi, rdi
02a1c 48b908a56d14107f0000           movabs     rcx, 0x7f10146da508
02a26 8b36                           mov        esi, dword ptr [rsi]
02a28 c1ee0d                         shr        esi, 0xd
02a2b 48c1e60a                       shl        rsi, 0xa
02a2f 41ba00000010                   mov        r10d, 0x10000000
02a35 4903f2                         add        rsi, r10
02a38 41ba1f000000                   mov        r10d, 0x1f
02a3e 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
02a42 7436                           je         0x7f102013e2fa
02a44 4983c202                       add        r10, 2
02a48 4983fa23                       cmp        r10, 0x23
02a4c 75f0                           jne        0x7f102013e2be
02a4e 41ba1f000000                   mov        r10d, 0x1f
02a54 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02a59 7412                           je         0x7f102013e2ed
02a5b 4983c202                       add        r10, 2
02a5f 4983fa23                       cmp        r10, 0x23
02a63 75ef                           jne        0x7f102013e2d4
02a65 41ba1e000000                   mov        r10d, 0x1e
02a6b eb11                           jmp        0x7f102013e2fe
02a6d 50                             push       rax
02a6e 4833c0                         xor        rax, rax
02a71 f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
02a77 58                             pop        rax
02a78 ebbe                           jmp        0x7f102013e2b8
02a7a 4983c201                       add        r10, 1
02a7e 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02a83 488bf7                         mov        rsi, rdi
02a86 90                             nop        
02a87 90                             nop        
02a88 90                             nop        
02a89 90                             nop        
02a8a 90                             nop        
02a8b 90                             nop        
02a8c 90                             nop        
02a8d 48b8f81c5ff40f7f0000           movabs     rax, 0x7f0ff45f1cf8
02a97 e844145f07                     call       0x7f102772f760
02a9c 0f1f8400942b0010               nop        dword ptr [rax + rax + 0x10002b94]
02aa4 483b00                         cmp        rax, qword ptr [rax]
02aa7 488bf0                         mov        rsi, rax
02aaa 48ba08a56d14107f0000           movabs     rdx, 0x7f10146da508
02ab4 8b36                           mov        esi, dword ptr [rsi]
02ab6 c1ee0d                         shr        esi, 0xd
02ab9 48c1e60a                       shl        rsi, 0xa
02abd 41ba00000010                   mov        r10d, 0x10000000
02ac3 4903f2                         add        rsi, r10
02ac6 41ba25000000                   mov        r10d, 0x25
02acc 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02ad0 7436                           je         0x7f102013e388
02ad2 4983c202                       add        r10, 2
02ad6 4983fa29                       cmp        r10, 0x29
02ada 75f0                           jne        0x7f102013e34c
02adc 41ba25000000                   mov        r10d, 0x25
02ae2 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02ae7 7412                           je         0x7f102013e37b
02ae9 4983c202                       add        r10, 2
02aed 4983fa29                       cmp        r10, 0x29
02af1 75ef                           jne        0x7f102013e362
02af3 41ba24000000                   mov        r10d, 0x24
02af9 eb11                           jmp        0x7f102013e38c
02afb 50                             push       rax
02afc 4833c0                         xor        rax, rax
02aff f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
02b05 58                             pop        rax
02b06 ebbe                           jmp        0x7f102013e346
02b08 4983c201                       add        r10, 1
02b0c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02b11 8b7024                         mov        esi, dword ptr [rax + 0x24]
02b14 4c3b257d991022                 cmp        r12, qword ptr [rip + 0x2210997d]
02b1b 0f8414000000                   je         0x7f102013e3b5
02b21 48bf38a33140107f0000           movabs     rdi, 0x7f104031a338
02b2b 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b2f e82c814d21                     call       0x7f10416164e0
02b34 f4                             hlt        
02b35 488bd0                         mov        rdx, rax
02b38 48b908a56d14107f0000           movabs     rcx, 0x7f10146da508
02b42 8b12                           mov        edx, dword ptr [rdx]
02b44 c1ea0d                         shr        edx, 0xd
02b47 48c1e20a                       shl        rdx, 0xa
02b4b 41ba00000010                   mov        r10d, 0x10000000
02b51 4903d2                         add        rdx, r10
02b54 41ba2b000000                   mov        r10d, 0x2b
02b5a 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02b5e 7436                           je         0x7f102013e416
02b60 4983c202                       add        r10, 2
02b64 4983fa2f                       cmp        r10, 0x2f
02b68 75f0                           jne        0x7f102013e3da
02b6a 41ba2b000000                   mov        r10d, 0x2b
02b70 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02b75 7412                           je         0x7f102013e409
02b77 4983c202                       add        r10, 2
02b7b 4983fa2f                       cmp        r10, 0x2f
02b7f 75ef                           jne        0x7f102013e3f0
02b81 41ba2a000000                   mov        r10d, 0x2a
02b87 eb11                           jmp        0x7f102013e41a
02b89 50                             push       rax
02b8a 4833c0                         xor        rax, rax
02b8d f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02b93 58                             pop        rax
02b94 ebbe                           jmp        0x7f102013e3d4
02b96 4983c201                       add        r10, 1
02b9a 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02b9f 8b4804                         mov        ecx, dword ptr [rax + 4]
02ba2 48ba08a56d14107f0000           movabs     rdx, 0x7f10146da508
02bac 4883828001000001               add        qword ptr [rdx + 0x180], 1
02bb4 48ba50906d14107f0000           movabs     rdx, 0x7f10146d9050
02bbe 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
02bc2 4183c002                       add        r8d, 2
02bc6 44894278                       mov        dword ptr [rdx + 0x78], r8d
02bca 4181e0feff1f00                 and        r8d, 0x1ffffe
02bd1 4585c0                         test       r8d, r8d
02bd4 0f841c1e0000                   je         0x7f1020140276
02bda 48ba08a56d14107f0000           movabs     rdx, 0x7f10146da508
02be4 4883829001000001               add        qword ptr [rdx + 0x190], 1
02bec 8b8424f4010000                 mov        eax, dword ptr [rsp + 0x1f4]
02bf3 4863c0                         movsxd     rax, eax
02bf6 ba08000000                     mov        edx, 8
02bfb 4c8bc8                         mov        r9, rax
02bfe 4c03ca                         add        r9, rdx
02c01 48bad8816d14107f0000           movabs     rdx, 0x7f10146d81d8
02c0b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
02c0f 4183c002                       add        r8d, 2
02c13 44894278                       mov        dword ptr [rdx + 0x78], r8d
02c17 4181e0feff1f00                 and        r8d, 0x1ffffe
02c1e 4585c0                         test       r8d, r8d
02c21 0f84f01d0000                   je         0x7f1020140297
02c27 48bad8816d14107f0000           movabs     rdx, 0x7f10146d81d8
02c31 488382e000000001               add        qword ptr [rdx + 0xe0], 1
02c39 48ba58836d14107f0000           movabs     rdx, 0x7f10146d8358
02c43 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
02c47 4183c002                       add        r8d, 2
02c4b 44894278                       mov        dword ptr [rdx + 0x78], r8d
02c4f 4181e0feff1f00                 and        r8d, 0x1ffffe
02c56 4585c0                         test       r8d, r8d
02c59 0f84d91d0000                   je         0x7f10201402b8
02c5f 48ba08a56d14107f0000           movabs     rdx, 0x7f10146da508
02c69 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
02c71 48baa80970e200000000           movabs     rdx, 0xe27009a8
02c7b ba02000000                     mov        edx, 2
02c80 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
02c88 bf00000000                     mov        edi, 0
02c8d 488b9c24f8010000               mov        rbx, qword ptr [rsp + 0x1f8]
02c95 48891c24                       mov        qword ptr [rsp], rbx
02c99 488b9c2438010000               mov        rbx, qword ptr [rsp + 0x138]
02ca1 48895c2408                     mov        qword ptr [rsp + 8], rbx
02ca6 4889442410                     mov        qword ptr [rsp + 0x10], rax
02cab 49baa80970e200000000           movabs     r10, 0xe27009a8
02cb5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02cba 90                             nop        
02cbb 90                             nop        
02cbc 90                             nop        
02cbd 90                             nop        
02cbe 90                             nop        
02cbf e81c175f07                     call       0x7f102772fc60
02cc4 0f1f8400bc2d0011               nop        dword ptr [rax + rax + 0x11002dbc]
02ccc 8b8424ec010000                 mov        eax, dword ptr [rsp + 0x1ec]
02cd3 83c010                         add        eax, 0x10
02cd6 8bbc24e4010000                 mov        edi, dword ptr [rsp + 0x1e4]
02cdd 83c710                         add        edi, 0x10
02ce0 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02ce7 ba02000000                     mov        edx, 2
02cec 7c05                           jl         0x7f102013e573
02cee ba00000000                     mov        edx, 0
02cf3 48b948e76214107f0000           movabs     rcx, 0x7f101462e748
02cfd 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
02d01 4403c2                         add        r8d, edx
02d04 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
02d08 85d2                           test       edx, edx
02d0a 7506                           jne        0x7f102013e592
02d0c 41b802000000                   mov        r8d, 2
02d12 4181e0fe3f0000                 and        r8d, 0x3ffe
02d19 4585c0                         test       r8d, r8d
02d1c 0f84371d0000                   je         0x7f10201402d9
02d22 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02d26 418502                         test       dword ptr [r10], eax
02d29 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02d30 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
02d3a b948070000                     mov        ecx, 0x748
02d3f 7c05                           jl         0x7f102013e5c6
02d41 b958070000                     mov        ecx, 0x758
02d46 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
02d4a 4d8d4001                       lea        r8, [r8 + 1]
02d4e 4c89040a                       mov        qword ptr [rdx + rcx], r8
02d52 0f8c50f5ffff                   jl         0x7f102013db28
02d58 8b9c24f0010000                 mov        ebx, dword ptr [rsp + 0x1f0]
02d5f 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
02d69 ff8268070000                   inc        dword ptr [rdx + 0x768]
02d6f e9a20c0000                     jmp        0x7f102013f296
02d74 4183f908                       cmp        r9d, 8
02d78 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
02d82 b980070000                     mov        ecx, 0x780
02d87 7c05                           jl         0x7f102013e60e
02d89 b990070000                     mov        ecx, 0x790
02d8e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
02d92 4d8d4001                       lea        r8, [r8 + 1]
02d96 4c89040a                       mov        qword ptr [rdx + rcx], r8
02d9a 0f8c06020000                   jl         0x7f102013e826
02da0 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
02da7 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
02dae 899c2408020000                 mov        dword ptr [rsp + 0x208], ebx
02db5 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
02dbc 90                             nop        
02dbd 90                             nop        
02dbe 90                             nop        
02dbf 90                             nop        
02dc0 89842400020000                 mov        dword ptr [rsp + 0x200], eax
02dc7 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
02dcf 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
02dd9 488382a007000001               add        qword ptr [rdx + 0x7a0], 1
02de1 48ba206a101000000000           movabs     rdx, 0x10106a20
02deb 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02dee 83c102                         add        ecx, 2
02df1 894a78                         mov        dword ptr [rdx + 0x78], ecx
02df4 81e1feff1f00                   and        ecx, 0x1ffffe
02dfa 85c9                           test       ecx, ecx
02dfc 0f84781c0000                   je         0x7f10201402fa
02e02 90                             nop        
02e03 90                             nop        
02e04 90                             nop        
02e05 90                             nop        
02e06 90                             nop        
02e07 90                             nop        
02e08 e99d1c0000                     jmp        0x7f102014032a
02e0d 90                             nop        
02e0e 90                             nop        
02e0f 90                             nop        
02e10 90                             nop        
02e11 90                             nop        
02e12 48ba206a101000000000           movabs     rdx, 0x10106a20
02e1c 488d92e0000000                 lea        rdx, [rdx + 0xe0]
02e23 4885c0                         test       rax, rax
02e26 7510                           jne        0x7f102013e6b8
02e28 f6420801                       test       byte ptr [rdx + 8], 1
02e2c 0f8506000000                   jne        0x7f102013e6b8
02e32 f048834a0801                   lock or    qword ptr [rdx + 8], 1
02e38 48be78c66be200000000           movabs     rsi, 0xe26bc678
02e42 488bd6                         mov        rdx, rsi
02e45 48b9206a101000000000           movabs     rcx, 0x10106a20
02e4f 8b12                           mov        edx, dword ptr [rdx]
02e51 c1ea0d                         shr        edx, 0xd
02e54 48c1e20a                       shl        rdx, 0xa
02e58 41ba00000010                   mov        r10d, 0x10000000
02e5e 4903d2                         add        rdx, r10
02e61 41ba17000000                   mov        r10d, 0x17
02e67 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02e6b 7436                           je         0x7f102013e723
02e6d 4983c202                       add        r10, 2
02e71 4983fa1b                       cmp        r10, 0x1b
02e75 75f0                           jne        0x7f102013e6e7
02e77 41ba17000000                   mov        r10d, 0x17
02e7d 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02e82 7412                           je         0x7f102013e716
02e84 4983c202                       add        r10, 2
02e88 4983fa1b                       cmp        r10, 0x1b
02e8c 75ef                           jne        0x7f102013e6fd
02e8e 41ba16000000                   mov        r10d, 0x16
02e94 eb11                           jmp        0x7f102013e727
02e96 50                             push       rax
02e97 4833c0                         xor        rax, rax
02e9a f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02ea0 58                             pop        rax
02ea1 ebbe                           jmp        0x7f102013e6e1
02ea3 4983c201                       add        r10, 1
02ea7 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02eac 488bd0                         mov        rdx, rax
02eaf 488bcf                         mov        rcx, rdi
02eb2 89bc2404020000                 mov        dword ptr [rsp + 0x204], edi
02eb9 90                             nop        
02eba 90                             nop        
02ebb 90                             nop        
02ebc 90                             nop        
02ebd 90                             nop        
02ebe 90                             nop        
02ebf e81c0b5f07                     call       0x7f102772f260
02ec4 0f1f8400bc2f0013               nop        dword ptr [rax + rax + 0x13002fbc]
02ecc 48be48e76214107f0000           movabs     rsi, 0x7f101462e748
02ed6 488386b007000001               add        qword ptr [rsi + 0x7b0], 1
02ede 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
02ee6 8b942400020000                 mov        edx, dword ptr [rsp + 0x200]
02eed 488bc8                         mov        rcx, rax
02ef0 90                             nop        
02ef1 90                             nop        
02ef2 90                             nop        
02ef3 90                             nop        
02ef4 90                             nop        
02ef5 90                             nop        
02ef6 90                             nop        
02ef7 e8e4145f07                     call       0x7f102772fc60
02efc 0f1f8400f42f0014               nop        dword ptr [rax + rax + 0x14002ff4]
02f04 8b842400020000                 mov        eax, dword ptr [rsp + 0x200]
02f0b 83c008                         add        eax, 8
02f0e 8bbc2404020000                 mov        edi, dword ptr [rsp + 0x204]
02f15 83c708                         add        edi, 8
02f18 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
02f1f be02000000                     mov        esi, 2
02f24 7c05                           jl         0x7f102013e7ab
02f26 be00000000                     mov        esi, 0
02f2b 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
02f35 8b4a7c                         mov        ecx, dword ptr [rdx + 0x7c]
02f38 03ce                           add        ecx, esi
02f3a 894a7c                         mov        dword ptr [rdx + 0x7c], ecx
02f3d 85f6                           test       esi, esi
02f3f 7505                           jne        0x7f102013e7c6
02f41 b902000000                     mov        ecx, 2
02f46 81e1fe3f0000                   and        ecx, 0x3ffe
02f4c 85c9                           test       ecx, ecx
02f4e 0f84601b0000                   je         0x7f1020140334
02f54 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02f58 418502                         test       dword ptr [r10], eax
02f5b 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
02f62 48be48e76214107f0000           movabs     rsi, 0x7f101462e748
02f6c bac0070000                     mov        edx, 0x7c0
02f71 7c05                           jl         0x7f102013e7f8
02f73 bad0070000                     mov        edx, 0x7d0
02f78 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
02f7c 488d4901                       lea        rcx, [rcx + 1]
02f80 48890c16                       mov        qword ptr [rsi + rdx], rcx
02f84 0f8c36feffff                   jl         0x7f102013e640
02f8a 8b9c2408020000                 mov        ebx, dword ptr [rsp + 0x208]
02f91 48be48e76214107f0000           movabs     rsi, 0x7f101462e748
02f9b ff86e0070000                   inc        dword ptr [rsi + 0x7e0]
02fa1 e9700a0000                     jmp        0x7f102013f296
02fa6 48be48e76214107f0000           movabs     rsi, 0x7f101462e748
02fb0 488386f807000001               add        qword ptr [rsi + 0x7f8], 1
02fb8 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
02fc0 8b9424d0010000                 mov        edx, dword ptr [rsp + 0x1d0]
02fc7 488bcf                         mov        rcx, rdi
02fca 4d8bc1                         mov        r8, r9
02fcd 448b8c2478010000               mov        r9d, dword ptr [rsp + 0x178]
02fd5 90                             nop        
02fd6 90                             nop        
02fd7 e804145f07                     call       0x7f102772fc60
02fdc 0f1f8400d4300016               nop        dword ptr [rax + rax + 0x160030d4]
02fe4 488bd8                         mov        rbx, rax
02fe7 e92a0a0000                     jmp        0x7f102013f296
02fec 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
02ff3 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
02ffa 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03002 48be48e76214107f0000           movabs     rsi, 0x7f101462e748
0300c 488386d005000001               add        qword ptr [rsi + 0x5d0], 1
03014 48be00986d14107f0000           movabs     rsi, 0x7f10146d9800
0301e 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03021 83c202                         add        edx, 2
03024 895678                         mov        dword ptr [rsi + 0x78], edx
03027 81e2feff1f00                   and        edx, 0x1ffffe
0302d 85d2                           test       edx, edx
0302f 0f84a01a0000                   je         0x7f1020140355
03035 48bef8926ee200000000           movabs     rsi, 0xe26e92f8
0303f 48ba00986d14107f0000           movabs     rdx, 0x7f10146d9800
03049 8b36                           mov        esi, dword ptr [rsi]
0304b c1ee0d                         shr        esi, 0xd
0304e 48c1e60a                       shl        rsi, 0xa
03052 41ba00000010                   mov        r10d, 0x10000000
03058 4903f2                         add        rsi, r10
0305b 41ba17000000                   mov        r10d, 0x17
03061 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03065 7436                           je         0x7f102013e91d
03067 4983c202                       add        r10, 2
0306b 4983fa1b                       cmp        r10, 0x1b
0306f 75f0                           jne        0x7f102013e8e1
03071 41ba17000000                   mov        r10d, 0x17
03077 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
0307c 7412                           je         0x7f102013e910
0307e 4983c202                       add        r10, 2
03082 4983fa1b                       cmp        r10, 0x1b
03086 75ef                           jne        0x7f102013e8f7
03088 41ba16000000                   mov        r10d, 0x16
0308e eb11                           jmp        0x7f102013e921
03090 50                             push       rax
03091 4833c0                         xor        rax, rax
03094 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
0309a 58                             pop        rax
0309b ebbe                           jmp        0x7f102013e8db
0309d 4983c201                       add        r10, 1
030a1 4a8304d201                     add        qword ptr [rdx + r10*8], 1
030a6 8b5804                         mov        ebx, dword ptr [rax + 4]
030a9 48be00986d14107f0000           movabs     rsi, 0x7f10146d9800
030b3 488386e000000001               add        qword ptr [rsi + 0xe0], 1
030bb 48be088e6d14107f0000           movabs     rsi, 0x7f10146d8e08
030c5 8b5678                         mov        edx, dword ptr [rsi + 0x78]
030c8 83c202                         add        edx, 2
030cb 895678                         mov        dword ptr [rsi + 0x78], edx
030ce 81e2feff1f00                   and        edx, 0x1ffffe
030d4 85d2                           test       edx, edx
030d6 0f84331a0000                   je         0x7f102014038f
030dc 48be088e6d14107f0000           movabs     rsi, 0x7f10146d8e08
030e6 4883861001000001               add        qword ptr [rsi + 0x110], 1
030ee 488bf3                         mov        rsi, rbx
030f1 83ee0f                         sub        esi, 0xf
030f4 48ba98846d14107f0000           movabs     rdx, 0x7f10146d8498
030fe 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03101 83c102                         add        ecx, 2
03104 894a78                         mov        dword ptr [rdx + 0x78], ecx
03107 81e1feff1f00                   and        ecx, 0x1ffffe
0310d 85c9                           test       ecx, ecx
0310f 0f841b1a0000                   je         0x7f10201403b0
03115 48ba98846d14107f0000           movabs     rdx, 0x7f10146d8498
0311f 488382b000000001               add        qword ptr [rdx + 0xb0], 1
03127 48ba0000000000000000           movabs     rdx, 0
03131 ba00000000                     mov        edx, 0
03136 3bfa                           cmp        edi, edx
03138 0f8c131a0000                   jl         0x7f10201403d1
0313e 3bfe                           cmp        edi, esi
03140 0f8d2c1a0000                   jge        0x7f10201403f2
03146 48bef8926ee200000000           movabs     rsi, 0xe26e92f8
03150 488bd6                         mov        rdx, rsi
03153 48b900986d14107f0000           movabs     rcx, 0x7f10146d9800
0315d 8b12                           mov        edx, dword ptr [rdx]
0315f c1ea0d                         shr        edx, 0xd
03162 48c1e20a                       shl        rdx, 0xa
03166 41ba00000010                   mov        r10d, 0x10000000
0316c 4903d2                         add        rdx, r10
0316f 41ba25000000                   mov        r10d, 0x25
03175 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03179 7436                           je         0x7f102013ea31
0317b 4983c202                       add        r10, 2
0317f 4983fa29                       cmp        r10, 0x29
03183 75f0                           jne        0x7f102013e9f5
03185 41ba25000000                   mov        r10d, 0x25
0318b 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03190 7412                           je         0x7f102013ea24
03192 4983c202                       add        r10, 2
03196 4983fa29                       cmp        r10, 0x29
0319a 75ef                           jne        0x7f102013ea0b
0319c 41ba24000000                   mov        r10d, 0x24
031a2 eb11                           jmp        0x7f102013ea35
031a4 50                             push       rax
031a5 4833c0                         xor        rax, rax
031a8 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
031ae 58                             pop        rax
031af ebbe                           jmp        0x7f102013e9ef
031b1 4983c201                       add        r10, 1
031b5 4a8304d101                     add        qword ptr [rcx + r10*8], 1
031ba 48baa0856d14107f0000           movabs     rdx, 0x7f10146d85a0
031c4 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
031c7 83c102                         add        ecx, 2
031ca 894a78                         mov        dword ptr [rdx + 0x78], ecx
031cd 81e1feff1f00                   and        ecx, 0x1ffffe
031d3 85c9                           test       ecx, ecx
031d5 0f84b8190000                   je         0x7f1020140413
031db 48baa0856d14107f0000           movabs     rdx, 0x7f10146d85a0
031e5 488382b000000001               add        qword ptr [rdx + 0xb0], 1
031ed 48bed0866d14107f0000           movabs     rsi, 0x7f10146d86d0
031f7 8b5678                         mov        edx, dword ptr [rsi + 0x78]
031fa 83c202                         add        edx, 2
031fd 895678                         mov        dword ptr [rsi + 0x78], edx
03200 81e2feff1f00                   and        edx, 0x1ffffe
03206 85d2                           test       edx, edx
03208 0f84a6190000                   je         0x7f1020140434
0320e 48bed0866d14107f0000           movabs     rsi, 0x7f10146d86d0
03218 ff86c0000000                   inc        dword ptr [rsi + 0xc0]
0321e 899c240c020000                 mov        dword ptr [rsp + 0x20c], ebx
03225 48bef0126fe200000000           movabs     rsi, 0xe26f12f0
0322f 488bd6                         mov        rdx, rsi
03232 48b900986d14107f0000           movabs     rcx, 0x7f10146d9800
0323c 4883816001000001               add        qword ptr [rcx + 0x160], 1
03244 48bad0996d14107f0000           movabs     rdx, 0x7f10146d99d0
0324e 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03251 83c102                         add        ecx, 2
03254 894a78                         mov        dword ptr [rdx + 0x78], ecx
03257 81e1feff1f00                   and        ecx, 0x1ffffe
0325d 85c9                           test       ecx, ecx
0325f 0f8470190000                   je         0x7f1020140455
03265 488bd6                         mov        rdx, rsi
03268 48b9d0996d14107f0000           movabs     rcx, 0x7f10146d99d0
03272 488381b000000001               add        qword ptr [rcx + 0xb0], 1
0327a 48bab89a6d14107f0000           movabs     rdx, 0x7f10146d9ab8
03284 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03287 83c102                         add        ecx, 2
0328a 894a78                         mov        dword ptr [rdx + 0x78], ecx
0328d 81e1feff1f00                   and        ecx, 0x1ffffe
03293 85c9                           test       ecx, ecx
03295 0f845b190000                   je         0x7f1020140476
0329b 48bab89a6d14107f0000           movabs     rdx, 0x7f10146d9ab8
032a5 488382c000000001               add        qword ptr [rdx + 0xc0], 1
032ad 48be888f6d14107f0000           movabs     rsi, 0x7f10146d8f88
032b7 8b5678                         mov        edx, dword ptr [rsi + 0x78]
032ba 83c202                         add        edx, 2
032bd 895678                         mov        dword ptr [rsi + 0x78], edx
032c0 81e2feff1f00                   and        edx, 0x1ffffe
032c6 85d2                           test       edx, edx
032c8 0f8449190000                   je         0x7f1020140497
032ce 48bef8926ee200000000           movabs     rsi, 0xe26e92f8
032d8 488bd6                         mov        rdx, rsi
032db 48b9b89a6d14107f0000           movabs     rcx, 0x7f10146d9ab8
032e5 8b12                           mov        edx, dword ptr [rdx]
032e7 c1ea0d                         shr        edx, 0xd
032ea 48c1e20a                       shl        rdx, 0xa
032ee 41ba00000010                   mov        r10d, 0x10000000
032f4 4903d2                         add        rdx, r10
032f7 41ba1d000000                   mov        r10d, 0x1d
032fd 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03301 7436                           je         0x7f102013ebb9
03303 4983c202                       add        r10, 2
03307 4983fa21                       cmp        r10, 0x21
0330b 75f0                           jne        0x7f102013eb7d
0330d 41ba1d000000                   mov        r10d, 0x1d
03313 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03318 7412                           je         0x7f102013ebac
0331a 4983c202                       add        r10, 2
0331e 4983fa21                       cmp        r10, 0x21
03322 75ef                           jne        0x7f102013eb93
03324 41ba1c000000                   mov        r10d, 0x1c
0332a eb11                           jmp        0x7f102013ebbd
0332c 50                             push       rax
0332d 4833c0                         xor        rax, rax
03330 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03336 58                             pop        rax
03337 ebbe                           jmp        0x7f102013eb77
03339 4983c201                       add        r10, 1
0333d 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03342 48bab89a6d14107f0000           movabs     rdx, 0x7f10146d9ab8
0334c 8b36                           mov        esi, dword ptr [rsi]
0334e c1ee0d                         shr        esi, 0xd
03351 48c1e60a                       shl        rsi, 0xa
03355 41ba00000010                   mov        r10d, 0x10000000
0335b 4903f2                         add        rsi, r10
0335e 41ba23000000                   mov        r10d, 0x23
03364 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03368 7436                           je         0x7f102013ec20
0336a 4983c202                       add        r10, 2
0336e 4983fa27                       cmp        r10, 0x27
03372 75f0                           jne        0x7f102013ebe4
03374 41ba23000000                   mov        r10d, 0x23
0337a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
0337f 7412                           je         0x7f102013ec13
03381 4983c202                       add        r10, 2
03385 4983fa27                       cmp        r10, 0x27
03389 75ef                           jne        0x7f102013ebfa
0338b 41ba22000000                   mov        r10d, 0x22
03391 eb11                           jmp        0x7f102013ec24
03393 50                             push       rax
03394 4833c0                         xor        rax, rax
03397 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
0339d 58                             pop        rax
0339e ebbe                           jmp        0x7f102013ebde
033a0 4983c201                       add        r10, 1
033a4 4a8304d201                     add        qword ptr [rdx + r10*8], 1
033a9 48beb89a6d14107f0000           movabs     rsi, 0x7f10146d9ab8
033b3 4883864001000001               add        qword ptr [rsi + 0x140], 1
033bb 48be50906d14107f0000           movabs     rsi, 0x7f10146d9050
033c5 8b5678                         mov        edx, dword ptr [rsi + 0x78]
033c8 83c202                         add        edx, 2
033cb 895678                         mov        dword ptr [rsi + 0x78], edx
033ce 81e2feff1f00                   and        edx, 0x1ffffe
033d4 85d2                           test       edx, edx
033d6 0f845c180000                   je         0x7f10201404b8
033dc 48beb89a6d14107f0000           movabs     rsi, 0x7f10146d9ab8
033e6 4883865001000001               add        qword ptr [rsi + 0x150], 1
033ee 4c63df                         movsxd     r11, edi
033f1 be08000000                     mov        esi, 8
033f6 4d8bcb                         mov        r9, r11
033f9 4c03ce                         add        r9, rsi
033fc 48bed8816d14107f0000           movabs     rsi, 0x7f10146d81d8
03406 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03409 83c202                         add        edx, 2
0340c 895678                         mov        dword ptr [rsi + 0x78], edx
0340f 81e2feff1f00                   and        edx, 0x1ffffe
03415 85d2                           test       edx, edx
03417 0f843c180000                   je         0x7f10201404d9
0341d 48bed8816d14107f0000           movabs     rsi, 0x7f10146d81d8
03427 488386e000000001               add        qword ptr [rsi + 0xe0], 1
0342f 48be58836d14107f0000           movabs     rsi, 0x7f10146d8358
03439 8b5678                         mov        edx, dword ptr [rsi + 0x78]
0343c 83c202                         add        edx, 2
0343f 895678                         mov        dword ptr [rsi + 0x78], edx
03442 81e2feff1f00                   and        edx, 0x1ffffe
03448 85d2                           test       edx, edx
0344a 0f842a180000                   je         0x7f10201404fa
03450 48beb89a6d14107f0000           movabs     rsi, 0x7f10146d9ab8
0345a 4883867001000001               add        qword ptr [rsi + 0x170], 1
03462 48bec06b6fe200000000           movabs     rsi, 0xe26f6bc0
0346c 48be40936ee200000000           movabs     rsi, 0xe26e9340
03476 ba02000000                     mov        edx, 2
0347b b910000000                     mov        ecx, 0x10
03480 4c8bc0                         mov        r8, rax
03483 bf00000000                     mov        edi, 0
03488 48890424                       mov        qword ptr [rsp], rax
0348c 4c895c2408                     mov        qword ptr [rsp + 8], r11
03491 49baf8926ee200000000           movabs     r10, 0xe26e92f8
0349b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
034a0 49bac06b6fe200000000           movabs     r10, 0xe26f6bc0
034aa 4c89542418                     mov        qword ptr [rsp + 0x18], r10
034af e82c0f5f07                     call       0x7f102772fc60
034b4 0f1f8400ac350017               nop        dword ptr [rax + rax + 0x170035ac]
034bc 4885c0                         test       rax, rax
034bf 48bbb89a6d14107f0000           movabs     rbx, 0x7f10146d9ab8
034c9 750c                           jne        0x7f102013ed57
034cb 808b7901000001                 or         byte ptr [rbx + 0x179], 1
034d2 e988000000                     jmp        0x7f102013eddf
034d7 8b38                           mov        edi, dword ptr [rax]
034d9 c1ef0d                         shr        edi, 0xd
034dc 48c1e70a                       shl        rdi, 0xa
034e0 41ba00000010                   mov        r10d, 0x10000000
034e6 4903fa                         add        rdi, r10
034e9 41ba31000000                   mov        r10d, 0x31
034ef 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
034f3 7436                           je         0x7f102013edab
034f5 4983c202                       add        r10, 2
034f9 4983fa35                       cmp        r10, 0x35
034fd 75f0                           jne        0x7f102013ed6f
034ff 41ba31000000                   mov        r10d, 0x31
03505 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0350a 7412                           je         0x7f102013ed9e
0350c 4983c202                       add        r10, 2
03510 4983fa35                       cmp        r10, 0x35
03514 75ef                           jne        0x7f102013ed85
03516 41ba30000000                   mov        r10d, 0x30
0351c eb11                           jmp        0x7f102013edaf
0351e 50                             push       rax
0351f 4833c0                         xor        rax, rax
03522 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
03528 58                             pop        rax
03529 ebbe                           jmp        0x7f102013ed69
0352b 4983c201                       add        r10, 1
0352f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03534 48bf00b0141000000000           movabs     rdi, 0x1014b000
0353e 8b18                           mov        ebx, dword ptr [rax]
03540 c1eb0d                         shr        ebx, 0xd
03543 48c1e30a                       shl        rbx, 0xa
03547 41ba00000010                   mov        r10d, 0x10000000
0354d 4903da                         add        rbx, r10
03550 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
03554 0f8541170000                   jne        0x7f102014051b
0355a e900000000                     jmp        0x7f102013eddf
0355f 488bf8                         mov        rdi, rax
03562 4889bc2410020000               mov        qword ptr [rsp + 0x210], rdi
0356a 483b07                         cmp        rax, qword ptr [rdi]
0356d 488bf7                         mov        rsi, rdi
03570 48bb48e76214107f0000           movabs     rbx, 0x7f101462e748
0357a 8b36                           mov        esi, dword ptr [rsi]
0357c c1ee0d                         shr        esi, 0xd
0357f 48c1e60a                       shl        rsi, 0xa
03583 41ba00000010                   mov        r10d, 0x10000000
03589 4903f2                         add        rsi, r10
0358c 41babd000000                   mov        r10d, 0xbd
03592 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03596 743c                           je         0x7f102013ee54
03598 4983c202                       add        r10, 2
0359c 4981fac1000000                 cmp        r10, 0xc1
035a3 75ed                           jne        0x7f102013ee12
035a5 41babd000000                   mov        r10d, 0xbd
035ab 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
035b0 7415                           je         0x7f102013ee47
035b2 4983c202                       add        r10, 2
035b6 4981fac1000000                 cmp        r10, 0xc1
035bd 75ec                           jne        0x7f102013ee2b
035bf 41babc000000                   mov        r10d, 0xbc
035c5 eb11                           jmp        0x7f102013ee58
035c7 50                             push       rax
035c8 4833c0                         xor        rax, rax
035cb f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
035d1 58                             pop        rax
035d2 ebb8                           jmp        0x7f102013ee0c
035d4 4983c201                       add        r10, 1
035d8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
035dd 48be08a56d14107f0000           movabs     rsi, 0x7f10146da508
035e7 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
035ea 83c302                         add        ebx, 2
035ed 895e78                         mov        dword ptr [rsi + 0x78], ebx
035f0 81e3feff1f00                   and        ebx, 0x1ffffe
035f6 85db                           test       ebx, ebx
035f8 0f84d3160000                   je         0x7f1020140551
035fe 488bf7                         mov        rsi, rdi
03601 48bb08a56d14107f0000           movabs     rbx, 0x7f10146da508
0360b 8b36                           mov        esi, dword ptr [rsi]
0360d c1ee0d                         shr        esi, 0xd
03610 48c1e60a                       shl        rsi, 0xa
03614 41ba00000010                   mov        r10d, 0x10000000
0361a 4903f2                         add        rsi, r10
0361d 41ba17000000                   mov        r10d, 0x17
03623 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03627 7436                           je         0x7f102013eedf
03629 4983c202                       add        r10, 2
0362d 4983fa1b                       cmp        r10, 0x1b
03631 75f0                           jne        0x7f102013eea3
03633 41ba17000000                   mov        r10d, 0x17
03639 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0363e 7412                           je         0x7f102013eed2
03640 4983c202                       add        r10, 2
03644 4983fa1b                       cmp        r10, 0x1b
03648 75ef                           jne        0x7f102013eeb9
0364a 41ba16000000                   mov        r10d, 0x16
03650 eb11                           jmp        0x7f102013eee3
03652 50                             push       rax
03653 4833c0                         xor        rax, rax
03656 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
0365c 58                             pop        rax
0365d ebbe                           jmp        0x7f102013ee9d
0365f 4983c201                       add        r10, 1
03663 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03668 488bf7                         mov        rsi, rdi
0366b 90                             nop        
0366c 90                             nop        
0366d 48b8201d5ff40f7f0000           movabs     rax, 0x7f0ff45f1d20
03677 e864085f07                     call       0x7f102772f760
0367c 0f1f840074370018               nop        dword ptr [rax + rax + 0x18003774]
03684 48be08a56d14107f0000           movabs     rsi, 0x7f10146da508
0368e 488386e000000001               add        qword ptr [rsi + 0xe0], 1
03696 48be088e6d14107f0000           movabs     rsi, 0x7f10146d8e08
036a0 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
036a3 83c702                         add        edi, 2
036a6 897e78                         mov        dword ptr [rsi + 0x78], edi
036a9 81e7feff1f00                   and        edi, 0x1ffffe
036af 85ff                           test       edi, edi
036b1 0f843b160000                   je         0x7f1020140572
036b7 8b9c240c020000                 mov        ebx, dword ptr [rsp + 0x20c]
036be 8bbc24d0010000                 mov        edi, dword ptr [rsp + 0x1d0]
036c5 48be088e6d14107f0000           movabs     rsi, 0x7f10146d8e08
036cf 4883861001000001               add        qword ptr [rsi + 0x110], 1
036d7 ffc8                           dec        eax
036d9 2bd8                           sub        ebx, eax
036db 48be98846d14107f0000           movabs     rsi, 0x7f10146d8498
036e5 8b4678                         mov        eax, dword ptr [rsi + 0x78]
036e8 83c002                         add        eax, 2
036eb 894678                         mov        dword ptr [rsi + 0x78], eax
036ee 25feff1f00                     and        eax, 0x1ffffe
036f3 85c0                           test       eax, eax
036f5 0f8418160000                   je         0x7f1020140593
036fb 48be98846d14107f0000           movabs     rsi, 0x7f10146d8498
03705 488386b000000001               add        qword ptr [rsi + 0xb0], 1
0370d 48be0000000000000000           movabs     rsi, 0
03717 be00000000                     mov        esi, 0
0371c 3bfe                           cmp        edi, esi
0371e 0f8c10160000                   jl         0x7f10201405b4
03724 3bfb                           cmp        edi, ebx
03726 0f8d29160000                   jge        0x7f10201405d5
0372c 488bdf                         mov        rbx, rdi
0372f 899c2418020000                 mov        dword ptr [rsp + 0x218], ebx
03736 89bc24d0010000                 mov        dword ptr [rsp + 0x1d0], edi
0373d 488bbc2410020000               mov        rdi, qword ptr [rsp + 0x210]
03745 488bf7                         mov        rsi, rdi
03748 48b908a56d14107f0000           movabs     rcx, 0x7f10146da508
03752 8b36                           mov        esi, dword ptr [rsi]
03754 c1ee0d                         shr        esi, 0xd
03757 48c1e60a                       shl        rsi, 0xa
0375b 41ba00000010                   mov        r10d, 0x10000000
03761 4903f2                         add        rsi, r10
03764 41ba1f000000                   mov        r10d, 0x1f
0376a 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
0376e 7436                           je         0x7f102013f026
03770 4983c202                       add        r10, 2
03774 4983fa23                       cmp        r10, 0x23
03778 75f0                           jne        0x7f102013efea
0377a 41ba1f000000                   mov        r10d, 0x1f
03780 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03785 7412                           je         0x7f102013f019
03787 4983c202                       add        r10, 2
0378b 4983fa23                       cmp        r10, 0x23
0378f 75ef                           jne        0x7f102013f000
03791 41ba1e000000                   mov        r10d, 0x1e
03797 eb11                           jmp        0x7f102013f02a
03799 50                             push       rax
0379a 4833c0                         xor        rax, rax
0379d f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
037a3 58                             pop        rax
037a4 ebbe                           jmp        0x7f102013efe4
037a6 4983c201                       add        r10, 1
037aa 4a8304d101                     add        qword ptr [rcx + r10*8], 1
037af 488bf7                         mov        rsi, rdi
037b2 90                             nop        
037b3 90                             nop        
037b4 90                             nop        
037b5 48b8481d5ff40f7f0000           movabs     rax, 0x7f0ff45f1d48
037bf e81c075f07                     call       0x7f102772f760
037c4 0f1f8400bc380019               nop        dword ptr [rax + rax + 0x190038bc]
037cc 483b00                         cmp        rax, qword ptr [rax]
037cf 488bf0                         mov        rsi, rax
037d2 48ba08a56d14107f0000           movabs     rdx, 0x7f10146da508
037dc 8b36                           mov        esi, dword ptr [rsi]
037de c1ee0d                         shr        esi, 0xd
037e1 48c1e60a                       shl        rsi, 0xa
037e5 41ba00000010                   mov        r10d, 0x10000000
037eb 4903f2                         add        rsi, r10
037ee 41ba25000000                   mov        r10d, 0x25
037f4 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
037f8 7436                           je         0x7f102013f0b0
037fa 4983c202                       add        r10, 2
037fe 4983fa29                       cmp        r10, 0x29
03802 75f0                           jne        0x7f102013f074
03804 41ba25000000                   mov        r10d, 0x25
0380a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
0380f 7412                           je         0x7f102013f0a3
03811 4983c202                       add        r10, 2
03815 4983fa29                       cmp        r10, 0x29
03819 75ef                           jne        0x7f102013f08a
0381b 41ba24000000                   mov        r10d, 0x24
03821 eb11                           jmp        0x7f102013f0b4
03823 50                             push       rax
03824 4833c0                         xor        rax, rax
03827 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
0382d 58                             pop        rax
0382e ebbe                           jmp        0x7f102013f06e
03830 4983c201                       add        r10, 1
03834 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03839 8b7024                         mov        esi, dword ptr [rax + 0x24]
0383c 4c3b25558c1022                 cmp        r12, qword ptr [rip + 0x22108c55]
03843 0f8414000000                   je         0x7f102013f0dd
03849 48bf38a33140107f0000           movabs     rdi, 0x7f104031a338
03853 4883e4f0                       and        rsp, 0xfffffffffffffff0
03857 e804744d21                     call       0x7f10416164e0
0385c f4                             hlt        
0385d 488bd0                         mov        rdx, rax
03860 48b908a56d14107f0000           movabs     rcx, 0x7f10146da508
0386a 8b12                           mov        edx, dword ptr [rdx]
0386c c1ea0d                         shr        edx, 0xd
0386f 48c1e20a                       shl        rdx, 0xa
03873 41ba00000010                   mov        r10d, 0x10000000
03879 4903d2                         add        rdx, r10
0387c 41ba2b000000                   mov        r10d, 0x2b
03882 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03886 7436                           je         0x7f102013f13e
03888 4983c202                       add        r10, 2
0388c 4983fa2f                       cmp        r10, 0x2f
03890 75f0                           jne        0x7f102013f102
03892 41ba2b000000                   mov        r10d, 0x2b
03898 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0389d 7412                           je         0x7f102013f131
0389f 4983c202                       add        r10, 2
038a3 4983fa2f                       cmp        r10, 0x2f
038a7 75ef                           jne        0x7f102013f118
038a9 41ba2a000000                   mov        r10d, 0x2a
038af eb11                           jmp        0x7f102013f142
038b1 50                             push       rax
038b2 4833c0                         xor        rax, rax
038b5 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
038bb 58                             pop        rax
038bc ebbe                           jmp        0x7f102013f0fc
038be 4983c201                       add        r10, 1
038c2 4a8304d101                     add        qword ptr [rcx + r10*8], 1
038c7 8b4804                         mov        ecx, dword ptr [rax + 4]
038ca 48ba08a56d14107f0000           movabs     rdx, 0x7f10146da508
038d4 4883828001000001               add        qword ptr [rdx + 0x180], 1
038dc 48ba50906d14107f0000           movabs     rdx, 0x7f10146d9050
038e6 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
038ea 4183c002                       add        r8d, 2
038ee 44894278                       mov        dword ptr [rdx + 0x78], r8d
038f2 4181e0feff1f00                 and        r8d, 0x1ffffe
038f9 4585c0                         test       r8d, r8d
038fc 0f848d140000                   je         0x7f102014060f
03902 48ba08a56d14107f0000           movabs     rdx, 0x7f10146da508
0390c 4883829001000001               add        qword ptr [rdx + 0x190], 1
03914 8b9c2418020000                 mov        ebx, dword ptr [rsp + 0x218]
0391b 4863db                         movsxd     rbx, ebx
0391e ba08000000                     mov        edx, 8
03923 4c8bcb                         mov        r9, rbx
03926 4c03ca                         add        r9, rdx
03929 48bad8816d14107f0000           movabs     rdx, 0x7f10146d81d8
03933 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
03937 4183c002                       add        r8d, 2
0393b 44894278                       mov        dword ptr [rdx + 0x78], r8d
0393f 4181e0feff1f00                 and        r8d, 0x1ffffe
03946 4585c0                         test       r8d, r8d
03949 0f8461140000                   je         0x7f1020140630
0394f 48bad8816d14107f0000           movabs     rdx, 0x7f10146d81d8
03959 488382e000000001               add        qword ptr [rdx + 0xe0], 1
03961 48ba58836d14107f0000           movabs     rdx, 0x7f10146d8358
0396b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
0396f 4183c002                       add        r8d, 2
03973 44894278                       mov        dword ptr [rdx + 0x78], r8d
03977 4181e0feff1f00                 and        r8d, 0x1ffffe
0397e 4585c0                         test       r8d, r8d
03981 0f844a140000                   je         0x7f1020140651
03987 48ba08a56d14107f0000           movabs     rdx, 0x7f10146da508
03991 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
03999 48baa80970e200000000           movabs     rdx, 0xe27009a8
039a3 ba02000000                     mov        edx, 2
039a8 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
039b0 bf00000000                     mov        edi, 0
039b5 488b842410020000               mov        rax, qword ptr [rsp + 0x210]
039bd 48890424                       mov        qword ptr [rsp], rax
039c1 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
039c9 4889442408                     mov        qword ptr [rsp + 8], rax
039ce 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
039d3 49baa80970e200000000           movabs     r10, 0xe27009a8
039dd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
039e2 90                             nop        
039e3 90                             nop        
039e4 90                             nop        
039e5 90                             nop        
039e6 90                             nop        
039e7 e8f4095f07                     call       0x7f102772fc60
039ec 0f1f8400e43a001a               nop        dword ptr [rax + rax + 0x1a003ae4]
039f4 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
039fb 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
03a03 4103d8                         add        ebx, r8d
03a06 48be48e76214107f0000           movabs     rsi, 0x7f101462e748
03a10 ff8610060000                   inc        dword ptr [rsi + 0x610]
03a16 8bb424d4010000                 mov        esi, dword ptr [rsp + 0x1d4]
03a1d 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
03a27 ff8208080000                   inc        dword ptr [rdx + 0x808]
03a2d 488bc3                         mov        rax, rbx
03a30 8b942444010000                 mov        edx, dword ptr [rsp + 0x144]
03a37 ffc2                           inc        edx
03a39 48b948e76214107f0000           movabs     rcx, 0x7f101462e748
03a43 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
03a47 4183c002                       add        r8d, 2
03a4b 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
03a4f 4181e0fe3f0000                 and        r8d, 0x3ffe
03a56 4585c0                         test       r8d, r8d
03a59 0f8493130000                   je         0x7f1020140672
03a5f 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03a63 418502                         test       dword ptr [r10], eax
03a66 48b948e76214107f0000           movabs     rcx, 0x7f101462e748
03a70 ff8130080000                   inc        dword ptr [rcx + 0x830]
03a76 488bce                         mov        rcx, rsi
03a79 4c8bd8                         mov        r11, rax
03a7c 488bf1                         mov        rsi, rcx
03a7f 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
03a87 488b9c2468020000               mov        rbx, qword ptr [rsp + 0x268]
03a8f 8bbc2430010000                 mov        edi, dword ptr [rsp + 0x130]
03a96 4c8b8c2420010000               mov        r9, qword ptr [rsp + 0x120]
03a9e 4c8b842428010000               mov        r8, qword ptr [rsp + 0x128]
03aa6 8b8c2434010000                 mov        ecx, dword ptr [rsp + 0x134]
03aad e95ec8ffff                     jmp        0x7f102013bb90
03ab2 4c8bc8                         mov        r9, rax
03ab5 4585c9                         test       r9d, r9d
03ab8 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
03ac2 b988030000                     mov        ecx, 0x388
03ac7 7e05                           jle        0x7f102013f34e
03ac9 b998030000                     mov        ecx, 0x398
03ace 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
03ad2 4d8d4001                       lea        r8, [r8 + 1]
03ad6 4c89040a                       mov        qword ptr [rdx + rcx], r8
03ada 0f8ec2010000                   jle        0x7f102013f522
03ae0 488b9c2498010000               mov        rbx, qword ptr [rsp + 0x198]
03ae8 482bf3                         sub        rsi, rbx
03aeb ba00000000                     mov        edx, 0
03af0 483bf2                         cmp        rsi, rdx
03af3 48be48e76214107f0000           movabs     rsi, 0x7f101462e748
03afd baa8030000                     mov        edx, 0x3a8
03b02 7d05                           jge        0x7f102013f389
03b04 bab8030000                     mov        edx, 0x3b8
03b09 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
03b0d 488d4901                       lea        rcx, [rcx + 1]
03b11 48890c16                       mov        qword ptr [rsi + rdx], rcx
03b15 0f8d87010000                   jge        0x7f102013f522
03b1b 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
03b23 488b5630                       mov        rdx, qword ptr [rsi + 0x30]
03b27 be00000000                     mov        esi, 0
03b2c 483bd6                         cmp        rdx, rsi
03b2f 48be48e76214107f0000           movabs     rsi, 0x7f101462e748
03b39 bac8030000                     mov        edx, 0x3c8
03b3e 7505                           jne        0x7f102013f3c5
03b40 bad8030000                     mov        edx, 0x3d8
03b45 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
03b49 488d4901                       lea        rcx, [rcx + 1]
03b4d 48890c16                       mov        qword ptr [rsi + rdx], rcx
03b51 0f854b010000                   jne        0x7f102013f522
03b57 e950010000                     jmp        0x7f102013f52c
03b5c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
03b64 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03b6c 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
03b74 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
03b7b 488bce                         mov        rcx, rsi
03b7e 8bb42434010000                 mov        esi, dword ptr [rsp + 0x134]
03b85 488bde                         mov        rbx, rsi
03b88 2bd9                           sub        ebx, ecx
03b8a 48be48e76214107f0000           movabs     rsi, 0x7f101462e748
03b94 4883864808000001               add        qword ptr [rsi + 0x848], 1
03b9c 488bf2                         mov        rsi, rdx
03b9f 488bd1                         mov        rdx, rcx
03ba2 488bc8                         mov        rcx, rax
03ba5 4d8bc3                         mov        r8, r11
03ba8 4c8bcb                         mov        r9, rbx
03bab 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
03bb3 899c241c020000                 mov        dword ptr [rsp + 0x21c], ebx
03bba 4885c9                         test       rcx, rcx
03bbd 0f8450120000                   je         0x7f1020140693
03bc3 85d2                           test       edx, edx
03bc5 0f8c48120000                   jl         0x7f1020140693
03bcb 4585c0                         test       r8d, r8d
03bce 0f8c3f120000                   jl         0x7f1020140693
03bd4 4a8d3c0a                       lea        rdi, [rdx + r9]
03bd8 3b7e04                         cmp        edi, dword ptr [rsi + 4]
03bdb 0f8732120000                   ja         0x7f1020140693
03be1 4b8d3c08                       lea        rdi, [r8 + r9]
03be5 3b7904                         cmp        edi, dword ptr [rcx + 4]
03be8 0f8725120000                   ja         0x7f1020140693
03bee 4585c9                         test       r9d, r9d
03bf1 0f8c1c120000                   jl         0x7f1020140693
03bf7 4863d2                         movsxd     rdx, edx
03bfa 4d63c0                         movsxd     r8, r8d
03bfd 48bf0014041000000000           movabs     rdi, 0x10041400
03c07 41ba00000010                   mov        r10d, 0x10000000
03c0d 492bfa                         sub        rdi, r10
03c10 48c1ef0a                       shr        rdi, 0xa
03c14 448b19                         mov        r11d, dword ptr [rcx]
03c17 41c1eb0d                       shr        r11d, 0xd
03c1b 413bfb                         cmp        edi, r11d
03c1e 0f8510000000                   jne        0x7f102013f4b4
03c24 448b1e                         mov        r11d, dword ptr [rsi]
03c27 41c1eb0d                       shr        r11d, 0xd
03c2b 413bfb                         cmp        edi, r11d
03c2e 0f8414000000                   je         0x7f102013f4c8
03c34 48bf88152b40107f0000           movabs     rdi, 0x7f10402b1588
03c3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03c42 e819704d21                     call       0x7f10416164e0
03c47 f4                             hlt        
03c48 488d7c1608                     lea        rdi, [rsi + rdx + 8]
03c4d 4a8d740108                     lea        rsi, [rcx + r8 + 8]
03c52 498bd1                         mov        rdx, r9
03c55 40f6c40f                       test       spl, 0xf
03c59 0f8412000000                   je         0x7f102013f4f1
03c5f 4883ec08                       sub        rsp, 8
03c63 e8589c5d07                     call       0x7f1027719140
03c68 4883c408                       add        rsp, 8
03c6c e905000000                     jmp        0x7f102013f4f6
03c71 e84a9c5d07                     call       0x7f1027719140
03c76 8b9c241c020000                 mov        ebx, dword ptr [rsp + 0x21c]
03c7d 039c2474010000                 add        ebx, dword ptr [rsp + 0x174]
03c84 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
03c8c 895e38                         mov        dword ptr [rsi + 0x38], ebx
03c8f 4881c450020000                 add        rsp, 0x250
03c96 5d                             pop        rbp
03c97 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
03c9b 0f8780110000                   ja         0x7f10201406a1
03ca1 c3                             ret        
03ca2 bb02000000                     mov        ebx, 2
03ca7 e915000000                     jmp        0x7f102013f541
03cac 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
03cb6 ff82e8030000                   inc        dword ptr [rdx + 0x3e8]
03cbc bb08000000                     mov        ebx, 8
03cc1 899c2428020000                 mov        dword ptr [rsp + 0x228], ebx
03cc8 e979110000                     jmp        0x7f10201406c6
03ccd 90                             nop        
03cce 90                             nop        
03ccf 90                             nop        
03cd0 90                             nop        
03cd1 90                             nop        
03cd2 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
03cd9 0f858a110000                   jne        0x7f10201406e9
03cdf 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
03ce6 488d7820                       lea        rdi, [rax + 0x20]
03cea 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
03cf1 0f8772110000                   ja         0x7f10201406e9
03cf7 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
03cfe 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
03d05 488908                         mov        qword ptr [rax], rcx
03d08 4833c9                         xor        rcx, rcx
03d0b 48894808                       mov        qword ptr [rax + 8], rcx
03d0f 48894810                       mov        qword ptr [rax + 0x10], rcx
03d13 48894818                       mov        qword ptr [rax + 0x18], rcx
03d17 90                             nop        
03d18 e968110000                     jmp        0x7f1020140705
03d1d 90                             nop        
03d1e 90                             nop        
03d1f 90                             nop        
03d20 90                             nop        
03d21 90                             nop        
03d22 498bf1                         mov        rsi, r9
03d25 4889842420020000               mov        qword ptr [rsp + 0x220], rax
03d2d 90                             nop        
03d2e 90                             nop        
03d2f e8ac065f07                     call       0x7f102772fc60
03d34 0f1f84002c3e001c               nop        dword ptr [rax + rax + 0x1c003e2c]
03d3c 48ba48e76214107f0000           movabs     rdx, 0x7f101462e748
03d46 488d9210040000                 lea        rdx, [rdx + 0x410]
03d4d 4885c0                         test       rax, rax
03d50 750e                           jne        0x7f102013f5e0
03d52 f60201                         test       byte ptr [rdx], 1
03d55 0f8505000000                   jne        0x7f102013f5e0
03d5b f048830a01                     lock or    qword ptr [rdx], 1
03d60 488b942420020000               mov        rdx, qword ptr [rsp + 0x220]
03d68 48b948e76214107f0000           movabs     rcx, 0x7f101462e748
03d72 4883812004000001               add        qword ptr [rcx + 0x420], 1
03d7a 8b942428020000                 mov        edx, dword ptr [rsp + 0x228]
03d81 488bc8                         mov        rcx, rax
03d84 488bb42420020000               mov        rsi, qword ptr [rsp + 0x220]
03d8c 90                             nop        
03d8d 90                             nop        
03d8e 90                             nop        
03d8f e84cfc5e07                     call       0x7f102772f260
03d94 0f1f84008c3e001d               nop        dword ptr [rax + rax + 0x1d003e8c]
03d9c 488b842420020000               mov        rax, qword ptr [rsp + 0x220]
03da4 e981110000                     jmp        0x7f10201407aa
03da9 90                             nop        
03daa 90                             nop        
03dab 90                             nop        
03dac 90                             nop        
03dad 90                             nop        
03dae 90                             nop        
03daf 90                             nop        
03db0 e9e9100000                     jmp        0x7f102014071e
03db5 90                             nop        
03db6 90                             nop        
03db7 90                             nop        
03db8 90                             nop        
03db9 90                             nop        
03dba 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
03dc1 0f85fa100000                   jne        0x7f1020140741
03dc7 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
03dce 488d7820                       lea        rdi, [rax + 0x20]
03dd2 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
03dd9 0f87e2100000                   ja         0x7f1020140741
03ddf 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
03de6 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
03ded 488908                         mov        qword ptr [rax], rcx
03df0 4833c9                         xor        rcx, rcx
03df3 48894808                       mov        qword ptr [rax + 8], rcx
03df7 48894810                       mov        qword ptr [rax + 0x10], rcx
03dfb 48894818                       mov        qword ptr [rax + 0x18], rcx
03dff 488bd0                         mov        rdx, rax
03e02 48b948e76214107f0000           movabs     rcx, 0x7f101462e748
03e0c 4883815802000001               add        qword ptr [rcx + 0x258], 1
03e14 ba02000000                     mov        edx, 2
03e19 48b9a86126e200000000           movabs     rcx, 0xe22661a8
03e23 488bf0                         mov        rsi, rax
03e26 4889842430020000               mov        qword ptr [rsp + 0x230], rax
03e2e 90                             nop        
03e2f e8acfb5e07                     call       0x7f102772f260
03e34 0f1f84002c3f001e               nop        dword ptr [rax + rax + 0x1e003f2c]
03e3c 488b842430020000               mov        rax, qword ptr [rsp + 0x230]
03e44 e9e1100000                     jmp        0x7f10201407aa
03e49 90                             nop        
03e4a 90                             nop        
03e4b 90                             nop        
03e4c 90                             nop        
03e4d 90                             nop        
03e4e 90                             nop        
03e4f 90                             nop        
03e50 e988100000                     jmp        0x7f102014075d
03e55 90                             nop        
03e56 90                             nop        
03e57 90                             nop        
03e58 90                             nop        
03e59 90                             nop        
03e5a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
03e61 0f8599100000                   jne        0x7f1020140780
03e67 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
03e6e 488d7820                       lea        rdi, [rax + 0x20]
03e72 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
03e79 0f8781100000                   ja         0x7f1020140780
03e7f 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
03e86 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
03e8d 488908                         mov        qword ptr [rax], rcx
03e90 4833c9                         xor        rcx, rcx
03e93 48894808                       mov        qword ptr [rax + 8], rcx
03e97 48894810                       mov        qword ptr [rax + 0x10], rcx
03e9b 48894818                       mov        qword ptr [rax + 0x18], rcx
03e9f 488bd0                         mov        rdx, rax
03ea2 48b948e76214107f0000           movabs     rcx, 0x7f101462e748
03eac 4883814001000001               add        qword ptr [rcx + 0x140], 1
03eb4 ba05000000                     mov        edx, 5
03eb9 48b9d86126e200000000           movabs     rcx, 0xe22661d8
03ec3 488bf0                         mov        rsi, rax
03ec6 4889842438020000               mov        qword ptr [rsp + 0x238], rax
03ece 90                             nop        
03ecf e80cfb5e07                     call       0x7f102772f260
03ed4 0f1f8400cc3f001f               nop        dword ptr [rax + rax + 0x1f003fcc]
03edc 488b842438020000               mov        rax, qword ptr [rsp + 0x238]
03ee4 e941100000                     jmp        0x7f10201407aa
03ee9 49ba30046214107f0000           movabs     r10, 0x7f1014620430
03ef3 4c89542408                     mov        qword ptr [rsp + 8], r10
03ef8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03f00 e8dbf25807                     call       0x7f10276cea60
03f05 e983c1ffff                     jmp        0x7f102013b90d
03f0a 49baa8ee1a14107f0000           movabs     r10, 0x7f10141aeea8
03f14 4c89542408                     mov        qword ptr [rsp + 8], r10
03f19 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
03f21 e8baf25807                     call       0x7f10276cea60
03f26 e90dc3ffff                     jmp        0x7f102013bab8
03f2b e8305e5907                     call       0x7f10276d55e0
03f30 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
03f3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
03f3e e81d6d4d21                     call       0x7f10416164e0
03f43 f4                             hlt        
03f44 e8175e5907                     call       0x7f10276d55e0
03f49 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
03f53 4883e4f0                       and        rsp, 0xfffffffffffffff0
03f57 e8046d4d21                     call       0x7f10416164e0
03f5c f4                             hlt        
03f5d e8fe5d5907                     call       0x7f10276d55e0
03f62 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
03f6c 4883e4f0                       and        rsp, 0xfffffffffffffff0
03f70 e8eb6c4d21                     call       0x7f10416164e0
03f75 f4                             hlt        
03f76 48891424                       mov        qword ptr [rsp], rdx
03f7a 4c89442408                     mov        qword ptr [rsp + 8], r8
03f7f e8dc665907                     call       0x7f10276d5ee0
03f84 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
03f8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03f92 e8c96c4d21                     call       0x7f10416164e0
03f97 f4                             hlt        
03f98 e8c35d5907                     call       0x7f10276d55e0
03f9d 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
03fa7 4883e4f0                       and        rsp, 0xfffffffffffffff0
03fab e8b06c4d21                     call       0x7f10416164e0
03fb0 f4                             hlt        
03fb1 e8aa5d5907                     call       0x7f10276d55e0
03fb6 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
03fc0 4883e4f0                       and        rsp, 0xfffffffffffffff0
03fc4 e8976c4d21                     call       0x7f10416164e0
03fc9 f4                             hlt        
03fca 48891424                       mov        qword ptr [rsp], rdx
03fce 4c894c2408                     mov        qword ptr [rsp + 8], r9
03fd3 e888665907                     call       0x7f10276d5ee0
03fd8 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
03fe2 4883e4f0                       and        rsp, 0xfffffffffffffff0
03fe6 e8756c4d21                     call       0x7f10416164e0
03feb f4                             hlt        
03fec e86f5d5907                     call       0x7f10276d55e0
03ff1 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
03ffb 4883e4f0                       and        rsp, 0xfffffffffffffff0
03fff e85c6c4d21                     call       0x7f10416164e0
04004 f4                             hlt        
04005 e8565d5907                     call       0x7f10276d55e0
0400a 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04014 4883e4f0                       and        rsp, 0xfffffffffffffff0
04018 e8436c4d21                     call       0x7f10416164e0
0401d f4                             hlt        
0401e 48c7042401000000               mov        qword ptr [rsp], 1
04026 48895c2408                     mov        qword ptr [rsp + 8], rbx
0402b e830665907                     call       0x7f10276d5ee0
04030 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
0403a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0403e e81d6c4d21                     call       0x7f10416164e0
04043 f4                             hlt        
04044 48c7042402000000               mov        qword ptr [rsp], 2
0404c 48895c2408                     mov        qword ptr [rsp + 8], rbx
04051 e80a665907                     call       0x7f10276d5ee0
04056 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04060 4883e4f0                       and        rsp, 0xfffffffffffffff0
04064 e8f76b4d21                     call       0x7f10416164e0
04069 f4                             hlt        
0406a 49ba08967414107f0000           movabs     r10, 0x7f1014749608
04074 4c89542408                     mov        qword ptr [rsp + 8], r10
04079 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04081 e85af15807                     call       0x7f10276cea60
04086 e942c7ffff                     jmp        0x7f102013c04d
0408b 49ba78286d14107f0000           movabs     r10, 0x7f10146d2878
04095 4c89542408                     mov        qword ptr [rsp + 8], r10
0409a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
040a2 e839f15807                     call       0x7f10276cea60
040a7 e9c5c7ffff                     jmp        0x7f102013c0f1
040ac 49ba90a61814107f0000           movabs     r10, 0x7f101418a690
040b6 4c89542408                     mov        qword ptr [rsp + 8], r10
040bb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
040c3 e818f15807                     call       0x7f10276cea60
040c8 e9eec7ffff                     jmp        0x7f102013c13b
040cd 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
040d5 e806145907                     call       0x7f10276d0d60
040da 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
040e4 4883e4f0                       and        rsp, 0xfffffffffffffff0
040e8 e8736b4d21                     call       0x7f10416164e0
040ed f4                             hlt        
040ee 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
040f6 e8e5135907                     call       0x7f10276d0d60
040fb 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04105 4883e4f0                       and        rsp, 0xfffffffffffffff0
04109 e8526b4d21                     call       0x7f10416164e0
0410e f4                             hlt        
0410f 49ba50577d14107f0000           movabs     r10, 0x7f10147d5750
04119 4c89542408                     mov        qword ptr [rsp + 8], r10
0411e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04126 e8b5f05807                     call       0x7f10276cea60
0412b e964c8ffff                     jmp        0x7f102013c214
04130 49ba78c97d14107f0000           movabs     r10, 0x7f10147dc978
0413a 4c89542408                     mov        qword ptr [rsp + 8], r10
0413f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04147 e894f05807                     call       0x7f10276cea60
0414c e976c8ffff                     jmp        0x7f102013c247
04151 49ba088d6814107f0000           movabs     r10, 0x7f1014688d08
0415b 4c89542408                     mov        qword ptr [rsp + 8], r10
04160 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04168 e873f05807                     call       0x7f10276cea60
0416d e9ccc8ffff                     jmp        0x7f102013c2be
04172 49bac8b17414107f0000           movabs     r10, 0x7f101474b1c8
0417c 4c89542408                     mov        qword ptr [rsp + 8], r10
04181 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04189 e852f05807                     call       0x7f10276cea60
0418e e9e2c8ffff                     jmp        0x7f102013c2f5
04193 49ba584c6814107f0000           movabs     r10, 0x7f1014684c58
0419d 4c89542408                     mov        qword ptr [rsp + 8], r10
041a2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
041aa e831f05807                     call       0x7f10276cea60
041af e9f9c8ffff                     jmp        0x7f102013c32d
041b4 49ba88cc7414107f0000           movabs     r10, 0x7f101474cc88
041be 4c89542408                     mov        qword ptr [rsp + 8], r10
041c3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
041cb e810f05807                     call       0x7f10276cea60
041d0 e9f3c9ffff                     jmp        0x7f102013c448
041d5 49ba10d44c14107f0000           movabs     r10, 0x7f10144cd410
041df 4c89542408                     mov        qword ptr [rsp + 8], r10
041e4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
041ec e8efef5807                     call       0x7f10276cea60
041f1 e913caffff                     jmp        0x7f102013c489
041f6 49baa0913f14107f0000           movabs     r10, 0x7f10143f91a0
04200 4c89542408                     mov        qword ptr [rsp + 8], r10
04205 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0420d e8ceef5807                     call       0x7f10276cea60
04212 e925caffff                     jmp        0x7f102013c4bc
04217 48890424                       mov        qword ptr [rsp], rax
0421b e8c02d5907                     call       0x7f10276d2860
04220 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
0422a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0422e e82d6a4d21                     call       0x7f10416164e0
04233 f4                             hlt        
04234 e8275b5907                     call       0x7f10276d55e0
04239 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04243 4883e4f0                       and        rsp, 0xfffffffffffffff0
04247 e8146a4d21                     call       0x7f10416164e0
0424c f4                             hlt        
0424d 49ba88a47414107f0000           movabs     r10, 0x7f101474a488
04257 4c89542408                     mov        qword ptr [rsp + 8], r10
0425c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04264 e877ef5807                     call       0x7f10276cea60
04269 e980cbffff                     jmp        0x7f102013c66e
0426e e8ed5a5907                     call       0x7f10276d55e0
04273 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
0427d 4883e4f0                       and        rsp, 0xfffffffffffffff0
04281 e8da694d21                     call       0x7f10416164e0
04286 f4                             hlt        
04287 49ba78286d14107f0000           movabs     r10, 0x7f10146d2878
04291 4c89542408                     mov        qword ptr [rsp + 8], r10
04296 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0429e e83def5807                     call       0x7f10276cea60
042a3 e90accffff                     jmp        0x7f102013c732
042a8 49ba90a61814107f0000           movabs     r10, 0x7f101418a690
042b2 4c89542408                     mov        qword ptr [rsp + 8], r10
042b7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
042bf e81cef5807                     call       0x7f10276cea60
042c4 e927ccffff                     jmp        0x7f102013c770
042c9 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
042d1 e80a125907                     call       0x7f10276d0d60
042d6 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
042e0 4883e4f0                       and        rsp, 0xfffffffffffffff0
042e4 e877694d21                     call       0x7f10416164e0
042e9 f4                             hlt        
042ea 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
042f2 e8e9115907                     call       0x7f10276d0d60
042f7 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04301 4883e4f0                       and        rsp, 0xfffffffffffffff0
04305 e856694d21                     call       0x7f10416164e0
0430a f4                             hlt        
0430b e8505a5907                     call       0x7f10276d55e0
04310 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
0431a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0431e e83d694d21                     call       0x7f10416164e0
04323 f4                             hlt        
04324 49ba88cc7414107f0000           movabs     r10, 0x7f101474cc88
0432e 4c89542408                     mov        qword ptr [rsp + 8], r10
04333 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0433b e8a0ee5807                     call       0x7f10276cea60
04340 e9b5cdffff                     jmp        0x7f102013c97a
04345 49ba10d44c14107f0000           movabs     r10, 0x7f10144cd410
0434f 4c89542408                     mov        qword ptr [rsp + 8], r10
04354 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0435c e87fee5807                     call       0x7f10276cea60
04361 e9e1cdffff                     jmp        0x7f102013c9c7
04366 49baa0913f14107f0000           movabs     r10, 0x7f10143f91a0
04370 4c89542408                     mov        qword ptr [rsp + 8], r10
04375 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0437d e85eee5807                     call       0x7f10276cea60
04382 e9f8cdffff                     jmp        0x7f102013c9ff
04387 49ba08967414107f0000           movabs     r10, 0x7f1014749608
04391 4c89542408                     mov        qword ptr [rsp + 8], r10
04396 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0439e e83dee5807                     call       0x7f10276cea60
043a3 e9f7ceffff                     jmp        0x7f102013cb1f
043a8 49ba78286d14107f0000           movabs     r10, 0x7f10146d2878
043b2 4c89542408                     mov        qword ptr [rsp + 8], r10
043b7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
043bf e81cee5807                     call       0x7f10276cea60
043c4 e97fcfffff                     jmp        0x7f102013cbc8
043c9 49ba90a61814107f0000           movabs     r10, 0x7f101418a690
043d3 4c89542408                     mov        qword ptr [rsp + 8], r10
043d8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
043e0 e8fbed5807                     call       0x7f10276cea60
043e5 e99ccfffff                     jmp        0x7f102013cc06
043ea 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
043f2 e8e9105907                     call       0x7f10276d0d60
043f7 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04401 4883e4f0                       and        rsp, 0xfffffffffffffff0
04405 e856684d21                     call       0x7f10416164e0
0440a f4                             hlt        
0440b 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04413 e8c8105907                     call       0x7f10276d0d60
04418 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04422 4883e4f0                       and        rsp, 0xfffffffffffffff0
04426 e835684d21                     call       0x7f10416164e0
0442b f4                             hlt        
0442c 49ba50577d14107f0000           movabs     r10, 0x7f10147d5750
04436 4c89542408                     mov        qword ptr [rsp + 8], r10
0443b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04443 e898ed5807                     call       0x7f10276cea60
04448 e912d0ffff                     jmp        0x7f102013ccdf
0444d 49ba78c97d14107f0000           movabs     r10, 0x7f10147dc978
04457 4c89542408                     mov        qword ptr [rsp + 8], r10
0445c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04464 e877ed5807                     call       0x7f10276cea60
04469 e929d0ffff                     jmp        0x7f102013cd17
0446e 49ba088d6814107f0000           movabs     r10, 0x7f1014688d08
04478 4c89542408                     mov        qword ptr [rsp + 8], r10
0447d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04485 e856ed5807                     call       0x7f10276cea60
0448a e968d0ffff                     jmp        0x7f102013cd77
0448f 49bac8b17414107f0000           movabs     r10, 0x7f101474b1c8
04499 4c89542408                     mov        qword ptr [rsp + 8], r10
0449e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044a6 e835ed5807                     call       0x7f10276cea60
044ab e97fd0ffff                     jmp        0x7f102013cdaf
044b0 49ba584c6814107f0000           movabs     r10, 0x7f1014684c58
044ba 4c89542408                     mov        qword ptr [rsp + 8], r10
044bf 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044c7 e814ed5807                     call       0x7f10276cea60
044cc e996d0ffff                     jmp        0x7f102013cde7
044d1 49ba88cc7414107f0000           movabs     r10, 0x7f101474cc88
044db 4c89542408                     mov        qword ptr [rsp + 8], r10
044e0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
044e8 e8f3ec5807                     call       0x7f10276cea60
044ed e98cd1ffff                     jmp        0x7f102013cefe
044f2 49ba10d44c14107f0000           movabs     r10, 0x7f10144cd410
044fc 4c89542408                     mov        qword ptr [rsp + 8], r10
04501 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04509 e8d2ec5807                     call       0x7f10276cea60
0450e e9b1d1ffff                     jmp        0x7f102013cf44
04513 49baa0913f14107f0000           movabs     r10, 0x7f10143f91a0
0451d 4c89542408                     mov        qword ptr [rsp + 8], r10
04522 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0452a e8b1ec5807                     call       0x7f10276cea60
0452f e9c8d1ffff                     jmp        0x7f102013cf7c
04534 48890424                       mov        qword ptr [rsp], rax
04538 e8a32a5907                     call       0x7f10276d2860
0453d 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04547 4883e4f0                       and        rsp, 0xfffffffffffffff0
0454b e810674d21                     call       0x7f10416164e0
04550 f4                             hlt        
04551 e80a585907                     call       0x7f10276d55e0
04556 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04560 4883e4f0                       and        rsp, 0xfffffffffffffff0
04564 e8f7664d21                     call       0x7f10416164e0
04569 f4                             hlt        
0456a 49ba88a47414107f0000           movabs     r10, 0x7f101474a488
04574 4c89542408                     mov        qword ptr [rsp + 8], r10
04579 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04581 e85aec5807                     call       0x7f10276cea60
04586 e92bd3ffff                     jmp        0x7f102013d136
0458b e8d0575907                     call       0x7f10276d55e0
04590 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
0459a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0459e e8bd664d21                     call       0x7f10416164e0
045a3 f4                             hlt        
045a4 49ba78286d14107f0000           movabs     r10, 0x7f10146d2878
045ae 4c89542408                     mov        qword ptr [rsp + 8], r10
045b3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045bb e820ec5807                     call       0x7f10276cea60
045c0 e9b5d3ffff                     jmp        0x7f102013d1fa
045c5 49ba90a61814107f0000           movabs     r10, 0x7f101418a690
045cf 4c89542408                     mov        qword ptr [rsp + 8], r10
045d4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045dc e8ffeb5807                     call       0x7f10276cea60
045e1 e9d2d3ffff                     jmp        0x7f102013d238
045e6 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
045ee e8ed0e5907                     call       0x7f10276d0d60
045f3 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
045fd 4883e4f0                       and        rsp, 0xfffffffffffffff0
04601 e85a664d21                     call       0x7f10416164e0
04606 f4                             hlt        
04607 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0460f e8cc0e5907                     call       0x7f10276d0d60
04614 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
0461e 4883e4f0                       and        rsp, 0xfffffffffffffff0
04622 e839664d21                     call       0x7f10416164e0
04627 f4                             hlt        
04628 e833575907                     call       0x7f10276d55e0
0462d 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04637 4883e4f0                       and        rsp, 0xfffffffffffffff0
0463b e820664d21                     call       0x7f10416164e0
04640 f4                             hlt        
04641 49ba88cc7414107f0000           movabs     r10, 0x7f101474cc88
0464b 4c89542408                     mov        qword ptr [rsp + 8], r10
04650 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04658 e883eb5807                     call       0x7f10276cea60
0465d e960d5ffff                     jmp        0x7f102013d442
04662 49ba10d44c14107f0000           movabs     r10, 0x7f10144cd410
0466c 4c89542408                     mov        qword ptr [rsp + 8], r10
04671 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04679 e862eb5807                     call       0x7f10276cea60
0467e e98cd5ffff                     jmp        0x7f102013d48f
04683 49baa0913f14107f0000           movabs     r10, 0x7f10143f91a0
0468d 4c89542408                     mov        qword ptr [rsp + 8], r10
04692 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0469a e841eb5807                     call       0x7f10276cea60
0469f e9a3d5ffff                     jmp        0x7f102013d4c7
046a4 49ba30046214107f0000           movabs     r10, 0x7f1014620430
046ae 4c89542408                     mov        qword ptr [rsp + 8], r10
046b3 48c704240a020000               mov        qword ptr [rsp], 0x20a
046bb e820eb5807                     call       0x7f10276cea60
046c0 e948d6ffff                     jmp        0x7f102013d58d
046c5 90                             nop        
046c6 90                             nop        
046c7 e814fd5e07                     call       0x7f102772fc60
046cc e978d7ffff                     jmp        0x7f102013d6c9
046d1 90                             nop        
046d2 90                             nop        
046d3 90                             nop        
046d4 90                             nop        
046d5 90                             nop        
046d6 90                             nop        
046d7 e804fd5e07                     call       0x7f102772fc60
046dc e940d9ffff                     jmp        0x7f102013d8a1
046e1 49bac02e6214107f0000           movabs     r10, 0x7f1014622ec0
046eb 4c89542408                     mov        qword ptr [rsp + 8], r10
046f0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046f8 e8e3ea5807                     call       0x7f10276cea60
046fd e9a0d9ffff                     jmp        0x7f102013d922
04702 49b80000000000000000           movabs     r8, 0
0470c b8000f050a                     mov        eax, 0xa050f00
04711 e8caf15807                     call       0x7f10276cf160
04716 e98dd9ffff                     jmp        0x7f102013d928
0471b 49ba30046214107f0000           movabs     r10, 0x7f1014620430
04725 4c89542408                     mov        qword ptr [rsp + 8], r10
0472a 48c70424aa020000               mov        qword ptr [rsp], 0x2aa
04732 e8a9ea5807                     call       0x7f10276cea60
04737 e9b8daffff                     jmp        0x7f102013da74
0473c 49ba08967414107f0000           movabs     r10, 0x7f1014749608
04746 4c89542408                     mov        qword ptr [rsp + 8], r10
0474b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04753 e888ea5807                     call       0x7f10276cea60
04758 e98ddbffff                     jmp        0x7f102013db6a
0475d e8fe555907                     call       0x7f10276d55e0
04762 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
0476c 4883e4f0                       and        rsp, 0xfffffffffffffff0
04770 e8eb644d21                     call       0x7f10416164e0
04775 f4                             hlt        
04776 49ba78286d14107f0000           movabs     r10, 0x7f10146d2878
04780 4c89542408                     mov        qword ptr [rsp + 8], r10
04785 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0478d e84eea5807                     call       0x7f10276cea60
04792 e9fbdbffff                     jmp        0x7f102013dc12
04797 49ba90a61814107f0000           movabs     r10, 0x7f101418a690
047a1 4c89542408                     mov        qword ptr [rsp + 8], r10
047a6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047ae e82dea5807                     call       0x7f10276cea60
047b3 e913dcffff                     jmp        0x7f102013dc4b
047b8 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
047c0 e81b0d5907                     call       0x7f10276d0d60
047c5 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
047cf 4883e4f0                       and        rsp, 0xfffffffffffffff0
047d3 e888644d21                     call       0x7f10416164e0
047d8 f4                             hlt        
047d9 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
047e1 e8fa0c5907                     call       0x7f10276d0d60
047e6 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
047f0 4883e4f0                       and        rsp, 0xfffffffffffffff0
047f4 e867644d21                     call       0x7f10416164e0
047f9 f4                             hlt        
047fa 49ba50577d14107f0000           movabs     r10, 0x7f10147d5750
04804 4c89542408                     mov        qword ptr [rsp + 8], r10
04809 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04811 e8cae95807                     call       0x7f10276cea60
04816 e97edcffff                     jmp        0x7f102013dd19
0481b 49ba78c97d14107f0000           movabs     r10, 0x7f10147dc978
04825 4c89542408                     mov        qword ptr [rsp + 8], r10
0482a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04832 e8a9e95807                     call       0x7f10276cea60
04837 e990dcffff                     jmp        0x7f102013dd4c
0483c 49ba088d6814107f0000           movabs     r10, 0x7f1014688d08
04846 4c89542408                     mov        qword ptr [rsp + 8], r10
0484b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04853 e888e95807                     call       0x7f10276cea60
04858 e9d3dcffff                     jmp        0x7f102013ddb0
0485d 49bac8b17414107f0000           movabs     r10, 0x7f101474b1c8
04867 4c89542408                     mov        qword ptr [rsp + 8], r10
0486c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04874 e867e95807                     call       0x7f10276cea60
04879 e9eddcffff                     jmp        0x7f102013ddeb
0487e 49ba584c6814107f0000           movabs     r10, 0x7f1014684c58
04888 4c89542408                     mov        qword ptr [rsp + 8], r10
0488d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04895 e846e95807                     call       0x7f10276cea60
0489a e9ffdcffff                     jmp        0x7f102013de1e
0489f 49ba88cc7414107f0000           movabs     r10, 0x7f101474cc88
048a9 4c89542408                     mov        qword ptr [rsp + 8], r10
048ae 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048b6 e825e95807                     call       0x7f10276cea60
048bb e9ecddffff                     jmp        0x7f102013df2c
048c0 49ba10d44c14107f0000           movabs     r10, 0x7f10144cd410
048ca 4c89542408                     mov        qword ptr [rsp + 8], r10
048cf 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048d7 e804e95807                     call       0x7f10276cea60
048dc e90cdeffff                     jmp        0x7f102013df6d
048e1 49baa0913f14107f0000           movabs     r10, 0x7f10143f91a0
048eb 4c89542408                     mov        qword ptr [rsp + 8], r10
048f0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048f8 e8e3e85807                     call       0x7f10276cea60
048fd e91edeffff                     jmp        0x7f102013dfa0
04902 48890424                       mov        qword ptr [rsp], rax
04906 e8d5265907                     call       0x7f10276d2860
0490b 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04915 4883e4f0                       and        rsp, 0xfffffffffffffff0
04919 e842634d21                     call       0x7f10416164e0
0491e f4                             hlt        
0491f e83c545907                     call       0x7f10276d55e0
04924 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
0492e 4883e4f0                       and        rsp, 0xfffffffffffffff0
04932 e829634d21                     call       0x7f10416164e0
04937 f4                             hlt        
04938 49ba88a47414107f0000           movabs     r10, 0x7f101474a488
04942 4c89542408                     mov        qword ptr [rsp + 8], r10
04947 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0494f e88ce85807                     call       0x7f10276cea60
04954 e975dfffff                     jmp        0x7f102013e14e
04959 49ba78286d14107f0000           movabs     r10, 0x7f10146d2878
04963 4c89542408                     mov        qword ptr [rsp + 8], r10
04968 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04970 e86be85807                     call       0x7f10276cea60
04975 e90de0ffff                     jmp        0x7f102013e207
0497a 49ba90a61814107f0000           movabs     r10, 0x7f101418a690
04984 4c89542408                     mov        qword ptr [rsp + 8], r10
04989 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04991 e84ae85807                     call       0x7f10276cea60
04996 e933e0ffff                     jmp        0x7f102013e24e
0499b 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
049a3 e8380b5907                     call       0x7f10276d0d60
049a8 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
049b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
049b6 e8a5624d21                     call       0x7f10416164e0
049bb f4                             hlt        
049bc 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
049c4 e8170b5907                     call       0x7f10276d0d60
049c9 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
049d3 4883e4f0                       and        rsp, 0xfffffffffffffff0
049d7 e884624d21                     call       0x7f10416164e0
049dc f4                             hlt        
049dd e87e535907                     call       0x7f10276d55e0
049e2 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
049ec 4883e4f0                       and        rsp, 0xfffffffffffffff0
049f0 e86b624d21                     call       0x7f10416164e0
049f5 f4                             hlt        
049f6 49ba88cc7414107f0000           movabs     r10, 0x7f101474cc88
04a00 4c89542408                     mov        qword ptr [rsp + 8], r10
04a05 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a0d e8cee75807                     call       0x7f10276cea60
04a12 e9c3e1ffff                     jmp        0x7f102013e45a
04a17 49ba10d44c14107f0000           movabs     r10, 0x7f10144cd410
04a21 4c89542408                     mov        qword ptr [rsp + 8], r10
04a26 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a2e e8ade75807                     call       0x7f10276cea60
04a33 e9efe1ffff                     jmp        0x7f102013e4a7
04a38 49baa0913f14107f0000           movabs     r10, 0x7f10143f91a0
04a42 4c89542408                     mov        qword ptr [rsp + 8], r10
04a47 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a4f e88ce75807                     call       0x7f10276cea60
04a54 e906e2ffff                     jmp        0x7f102013e4df
04a59 49ba30046214107f0000           movabs     r10, 0x7f1014620430
04a63 4c89542408                     mov        qword ptr [rsp + 8], r10
04a68 48c70424e8020000               mov        qword ptr [rsp], 0x2e8
04a70 e86be75807                     call       0x7f10276cea60
04a75 e9a8e2ffff                     jmp        0x7f102013e5a2
04a7a 49bac02e6214107f0000           movabs     r10, 0x7f1014622ec0
04a84 4c89542408                     mov        qword ptr [rsp + 8], r10
04a89 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a91 e84ae75807                     call       0x7f10276cea60
04a96 e967e3ffff                     jmp        0x7f102013e682
04a9b 49b80000000000000000           movabs     r8, 0
04aa5 b8000f050a                     mov        eax, 0xa050f00
04aaa e831ee5807                     call       0x7f10276cf160
04aaf e954e3ffff                     jmp        0x7f102013e688
04ab4 49ba30046214107f0000           movabs     r10, 0x7f1014620430
04abe 4c89542408                     mov        qword ptr [rsp + 8], r10
04ac3 48c7042420030000               mov        qword ptr [rsp], 0x320
04acb e810e75807                     call       0x7f10276cea60
04ad0 e97fe4ffff                     jmp        0x7f102013e7d4
04ad5 49ba08967414107f0000           movabs     r10, 0x7f1014749608
04adf 4c89542408                     mov        qword ptr [rsp + 8], r10
04ae4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04aec e8efe65807                     call       0x7f10276cea60
04af1 e93fe5ffff                     jmp        0x7f102013e8b5
04af6 e865525907                     call       0x7f10276d55e0
04afb 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04b05 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b09 e852614d21                     call       0x7f10416164e0
04b0e f4                             hlt        
04b0f 49ba78286d14107f0000           movabs     r10, 0x7f10146d2878
04b19 4c89542408                     mov        qword ptr [rsp + 8], r10
04b1e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b26 e8b5e65807                     call       0x7f10276cea60
04b2b e9ace5ffff                     jmp        0x7f102013e95c
04b30 49ba90a61814107f0000           movabs     r10, 0x7f101418a690
04b3a 4c89542408                     mov        qword ptr [rsp + 8], r10
04b3f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b47 e894e65807                     call       0x7f10276cea60
04b4c e9c4e5ffff                     jmp        0x7f102013e995
04b51 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04b59 e882095907                     call       0x7f10276d0d60
04b5e 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04b68 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b6c e8ef604d21                     call       0x7f10416164e0
04b71 f4                             hlt        
04b72 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04b7a e861095907                     call       0x7f10276d0d60
04b7f 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04b89 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b8d e8ce604d21                     call       0x7f10416164e0
04b92 f4                             hlt        
04b93 49ba50577d14107f0000           movabs     r10, 0x7f10147d5750
04b9d 4c89542408                     mov        qword ptr [rsp + 8], r10
04ba2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04baa e831e65807                     call       0x7f10276cea60
04baf e927e6ffff                     jmp        0x7f102013ea5b
04bb4 49ba78c97d14107f0000           movabs     r10, 0x7f10147dc978
04bbe 4c89542408                     mov        qword ptr [rsp + 8], r10
04bc3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bcb e810e65807                     call       0x7f10276cea60
04bd0 e939e6ffff                     jmp        0x7f102013ea8e
04bd5 49ba088d6814107f0000           movabs     r10, 0x7f1014688d08
04bdf 4c89542408                     mov        qword ptr [rsp + 8], r10
04be4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bec e8efe55807                     call       0x7f10276cea60
04bf1 e96fe6ffff                     jmp        0x7f102013eae5
04bf6 49bac8b17414107f0000           movabs     r10, 0x7f101474b1c8
04c00 4c89542408                     mov        qword ptr [rsp + 8], r10
04c05 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c0d e8cee55807                     call       0x7f10276cea60
04c12 e984e6ffff                     jmp        0x7f102013eb1b
04c17 49ba584c6814107f0000           movabs     r10, 0x7f1014684c58
04c21 4c89542408                     mov        qword ptr [rsp + 8], r10
04c26 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c2e e8ade55807                     call       0x7f10276cea60
04c33 e996e6ffff                     jmp        0x7f102013eb4e
04c38 49ba88cc7414107f0000           movabs     r10, 0x7f101474cc88
04c42 4c89542408                     mov        qword ptr [rsp + 8], r10
04c47 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c4f e88ce55807                     call       0x7f10276cea60
04c54 e983e7ffff                     jmp        0x7f102013ec5c
04c59 49ba10d44c14107f0000           movabs     r10, 0x7f10144cd410
04c63 4c89542408                     mov        qword ptr [rsp + 8], r10
04c68 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c70 e86be55807                     call       0x7f10276cea60
04c75 e9a3e7ffff                     jmp        0x7f102013ec9d
04c7a 49baa0913f14107f0000           movabs     r10, 0x7f10143f91a0
04c84 4c89542408                     mov        qword ptr [rsp + 8], r10
04c89 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c91 e84ae55807                     call       0x7f10276cea60
04c96 e9b5e7ffff                     jmp        0x7f102013ecd0
04c9b 48890424                       mov        qword ptr [rsp], rax
04c9f e83c235907                     call       0x7f10276d2860
04ca4 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04cae 4883e4f0                       and        rsp, 0xfffffffffffffff0
04cb2 e8a95f4d21                     call       0x7f10416164e0
04cb7 f4                             hlt        
04cb8 e8a3505907                     call       0x7f10276d55e0
04cbd 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04cc7 4883e4f0                       and        rsp, 0xfffffffffffffff0
04ccb e8905f4d21                     call       0x7f10416164e0
04cd0 f4                             hlt        
04cd1 49ba88a47414107f0000           movabs     r10, 0x7f101474a488
04cdb 4c89542408                     mov        qword ptr [rsp + 8], r10
04ce0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ce8 e8f3e45807                     call       0x7f10276cea60
04ced e90ce9ffff                     jmp        0x7f102013ee7e
04cf2 49ba78286d14107f0000           movabs     r10, 0x7f10146d2878
04cfc 4c89542408                     mov        qword ptr [rsp + 8], r10
04d01 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d09 e8d2e45807                     call       0x7f10276cea60
04d0e e9a4e9ffff                     jmp        0x7f102013ef37
04d13 49ba90a61814107f0000           movabs     r10, 0x7f101418a690
04d1d 4c89542408                     mov        qword ptr [rsp + 8], r10
04d22 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d2a e8b1e45807                     call       0x7f10276cea60
04d2f e9c7e9ffff                     jmp        0x7f102013ef7b
04d34 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04d3c e89f075907                     call       0x7f10276d0d60
04d41 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04d4b 4883e4f0                       and        rsp, 0xfffffffffffffff0
04d4f e80c5f4d21                     call       0x7f10416164e0
04d54 f4                             hlt        
04d55 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04d5d e87e075907                     call       0x7f10276d0d60
04d62 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04d6c 4883e4f0                       and        rsp, 0xfffffffffffffff0
04d70 e8eb5e4d21                     call       0x7f10416164e0
04d75 f4                             hlt        
04d76 e8e54f5907                     call       0x7f10276d55e0
04d7b 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04d85 4883e4f0                       and        rsp, 0xfffffffffffffff0
04d89 e8d25e4d21                     call       0x7f10416164e0
04d8e f4                             hlt        
04d8f 49ba88cc7414107f0000           movabs     r10, 0x7f101474cc88
04d99 4c89542408                     mov        qword ptr [rsp + 8], r10
04d9e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04da6 e835e45807                     call       0x7f10276cea60
04dab e952ebffff                     jmp        0x7f102013f182
04db0 49ba10d44c14107f0000           movabs     r10, 0x7f10144cd410
04dba 4c89542408                     mov        qword ptr [rsp + 8], r10
04dbf 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04dc7 e814e45807                     call       0x7f10276cea60
04dcc e97eebffff                     jmp        0x7f102013f1cf
04dd1 49baa0913f14107f0000           movabs     r10, 0x7f10143f91a0
04ddb 4c89542408                     mov        qword ptr [rsp + 8], r10
04de0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04de8 e8f3e35807                     call       0x7f10276cea60
04ded e995ebffff                     jmp        0x7f102013f207
04df2 49ba30046214107f0000           movabs     r10, 0x7f1014620430
04dfc 4c89542408                     mov        qword ptr [rsp + 8], r10
04e01 48c704245a030000               mov        qword ptr [rsp], 0x35a
04e09 e8d2e35807                     call       0x7f10276cea60
04e0e e94cecffff                     jmp        0x7f102013f2df
04e13 90                             nop        
04e14 90                             nop        
04e15 90                             nop        
04e16 90                             nop        
04e17 e8c4f55e07                     call       0x7f102772fc60
04e1c e955eeffff                     jmp        0x7f102013f4f6
04e21 49ba17f51320107f0000           movabs     r10, 0x7f102013f517
04e2b 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
04e32 e9a91c5f07                     jmp        0x7f1027732360
04e37 48ba0000000000000000           movabs     rdx, 0
04e41 b8000f050a                     mov        eax, 0xa050f00
04e46 e895f85807                     call       0x7f10276cff60
04e4b e978eeffff                     jmp        0x7f102013f548
04e50 e80b4f5907                     call       0x7f10276d55e0
04e55 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04e5f 4883e4f0                       and        rsp, 0xfffffffffffffff0
04e63 e8f85d4d21                     call       0x7f10416164e0
04e68 f4                             hlt        
04e69 488bd2                         mov        rdx, rdx
04e6c e8ef3e5907                     call       0x7f10276d45e0
04e71 e9a1eeffff                     jmp        0x7f102013f597
04e76 48ba0000000000000000           movabs     rdx, 0
04e80 b8000f050a                     mov        eax, 0xa050f00
04e85 e856ea5807                     call       0x7f10276cf160
04e8a e989eeffff                     jmp        0x7f102013f598
04e8f 48ba0000000000000000           movabs     rdx, 0
04e99 b8000f050a                     mov        eax, 0xa050f00
04e9e e83df85807                     call       0x7f10276cff60
04ea3 e908efffff                     jmp        0x7f102013f630
04ea8 e8b34e5907                     call       0x7f10276d55e0
04ead 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04eb7 4883e4f0                       and        rsp, 0xfffffffffffffff0
04ebb e8a05d4d21                     call       0x7f10416164e0
04ec0 f4                             hlt        
04ec1 488bd2                         mov        rdx, rdx
04ec4 e8973e5907                     call       0x7f10276d45e0
04ec9 e931efffff                     jmp        0x7f102013f67f
04ece 48ba0000000000000000           movabs     rdx, 0
04ed8 b8000f050a                     mov        eax, 0xa050f00
04edd e8fef75807                     call       0x7f10276cff60
04ee2 e969efffff                     jmp        0x7f102013f6d0
04ee7 e8744e5907                     call       0x7f10276d55e0
04eec 48bfb5002040107f0000           movabs     rdi, 0x7f10402000b5
04ef6 4883e4f0                       and        rsp, 0xfffffffffffffff0
04efa e8615d4d21                     call       0x7f10416164e0
04eff f4                             hlt        
04f00 488bd2                         mov        rdx, rdx
04f03 e8583e5907                     call       0x7f10276d45e0
04f08 e992efffff                     jmp        0x7f102013f71f
04f0d 498b8708060000                 mov        rax, qword ptr [r15 + 0x608]
04f14 49c7870806000000000000         mov        qword ptr [r15 + 0x608], 0
04f1f 49c7871006000000000000         mov        qword ptr [r15 + 0x610], 0
04f2a 4881c450020000                 add        rsp, 0x250
04f31 5d                             pop        rbp
04f32 e9a95d5907                     jmp        0x7f10276d6560
04f37 f4                             hlt        
