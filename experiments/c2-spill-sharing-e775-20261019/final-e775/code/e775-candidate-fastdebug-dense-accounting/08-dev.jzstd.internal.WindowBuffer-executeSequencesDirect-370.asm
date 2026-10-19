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
0001a 0f85c04a5e07                   jne        0x7ff8d772ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ec50020000                 sub        rsp, 0x250
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 7405                           je         0x7ff8d014a2bf
0003a e8214f5d07                     call       0x7ff8d771f1e0
0003f 4889b42448010000               mov        qword ptr [rsp + 0x148], rsi
00047 4889942468010000               mov        qword ptr [rsp + 0x168], rdx
0004f 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
00056 4c89842428010000               mov        qword ptr [rsp + 0x128], r8
0005e 4c898c2420010000               mov        qword ptr [rsp + 0x120], r9
00066 89bc2430010000                 mov        dword ptr [rsp + 0x130], edi
0006d 48bb00c043c4f87f0000           movabs     rbx, 0x7ff8c443c000
00077 8b4378                         mov        eax, dword ptr [rbx + 0x78]
0007a 83c002                         add        eax, 2
0007d 894378                         mov        dword ptr [rbx + 0x78], eax
00080 25fe070000                     and        eax, 0x7fe
00085 85c0                           test       eax, eax
00087 0f845c430000                   je         0x7ff8d014e669
0008d 48bb00c043c4f87f0000           movabs     rbx, 0x7ff8c443c000
00097 ff83b0000000                   inc        dword ptr [rbx + 0xb0]
0009d 8b9c2460020000                 mov        ebx, dword ptr [rsp + 0x260]
000a4 8b4640                         mov        eax, dword ptr [rsi + 0x40]
000a7 4c3b25ea40851f                 cmp        r12, qword ptr [rip + 0x1f8540ea]
000ae 0f8414000000                   je         0x7ff8d014a348
000b4 48bf3803a7edf87f0000           movabs     rdi, 0x7ff8eda70338
000be 4883e4f0                       and        rsp, 0xfffffffffffffff0
000c2 e89928c21e                     call       0x7ff8eed6cbe0
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
00102 48b800c043c4f87f0000           movabs     rax, 0x7ff8c443c000
0010c b900010000                     mov        ecx, 0x100
00111 7f05                           jg         0x7ff8d014a398
00113 b910010000                     mov        ecx, 0x110
00118 44899c2440010000               mov        dword ptr [rsp + 0x140], r11d
00120 4c8b1c08                       mov        r11, qword ptr [rax + rcx]
00124 4d8d5b01                       lea        r11, [r11 + 1]
00128 4c891c08                       mov        qword ptr [rax + rcx], r11
0012c 0f8f17420000                   jg         0x7ff8d014e5c9
00132 4863db                         movsxd     rbx, ebx
00135 488b4e20                       mov        rcx, qword ptr [rsi + 0x20]
00139 482bcf                         sub        rcx, rdi
0013c 483bcb                         cmp        rcx, rbx
0013f 48b900c043c4f87f0000           movabs     rcx, 0x7ff8c443c000
00149 b830010000                     mov        eax, 0x130
0014e 7c05                           jl         0x7ff8d014a3d5
00150 b820010000                     mov        eax, 0x120
00155 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
00159 4d8d5b01                       lea        r11, [r11 + 1]
0015d 4c891c01                       mov        qword ptr [rcx + rax], r11
00161 0f8ce2410000                   jl         0x7ff8d014e5c9
00167 48b900c043c4f87f0000           movabs     rcx, 0x7ff8c443c000
00171 ff8160010000                   inc        dword ptr [rcx + 0x160]
00177 b900000000                     mov        ecx, 0
0017c 498bc0                         mov        rax, r8
0017f 483bc1                         cmp        rax, rcx
00182 48b900c043c4f87f0000           movabs     rcx, 0x7ff8c443c000
0018c b870010000                     mov        eax, 0x170
00191 7505                           jne        0x7ff8d014a418
00193 b880010000                     mov        eax, 0x180
00198 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
0019c 4d8d5b01                       lea        r11, [r11 + 1]
001a0 4c891c01                       mov        qword ptr [rcx + rax], r11
001a4 0f8531000000                   jne        0x7ff8d014a45b
001aa 4803df                         add        rbx, rdi
001ad 498bc9                         mov        rcx, r9
001b0 483bcb                         cmp        rcx, rbx
001b3 48b900c043c4f87f0000           movabs     rcx, 0x7ff8c443c000
001bd bfa0010000                     mov        edi, 0x1a0
001c2 7d05                           jge        0x7ff8d014a449
001c4 bf90010000                     mov        edi, 0x190
001c9 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
001cd 488d5b01                       lea        rbx, [rbx + 1]
001d1 48891c39                       mov        qword ptr [rcx + rdi], rbx
001d5 0f8d0a000000                   jge        0x7ff8d014a465
001db bf00000000                     mov        edi, 0
001e0 e915000000                     jmp        0x7ff8d014a47a
001e5 48b900c043c4f87f0000           movabs     rcx, 0x7ff8c443c000
001ef ff81b0010000                   inc        dword ptr [rcx + 0x1b0]
001f5 bf01000000                     mov        edi, 1
001fa 4d2bc6                         sub        r8, r14
001fd 4c89842480010000               mov        qword ptr [rsp + 0x180], r8
00205 48b900c043c4f87f0000           movabs     rcx, 0x7ff8c443c000
0020f 488381c801000001               add        qword ptr [rcx + 0x1c8], 1
00217 48b9e01215c4f87f0000           movabs     rcx, 0x7ff8c41512e0
00221 8b5978                         mov        ebx, dword ptr [rcx + 0x78]
00224 83c302                         add        ebx, 2
00227 895978                         mov        dword ptr [rcx + 0x78], ebx
0022a 81e3feff1f00                   and        ebx, 0x1ffffe
00230 85db                           test       ebx, ebx
00232 0f84d2410000                   je         0x7ff8d014e68a
00238 48b9ffffffffffffff7f           movabs     rcx, 0x7fffffffffffffff
00242 493bc9                         cmp        rcx, r9
00245 48b9e01215c4f87f0000           movabs     rcx, 0x7ff8c41512e0
0024f bbc0000000                     mov        ebx, 0xc0
00254 7d05                           jge        0x7ff8d014a4db
00256 bbb0000000                     mov        ebx, 0xb0
0025b 488b0419                       mov        rax, qword ptr [rcx + rbx]
0025f 488d4001                       lea        rax, [rax + 1]
00263 48890419                       mov        qword ptr [rcx + rbx], rax
00267 0f8d0f000000                   jge        0x7ff8d014a4fc
0026d 49b9ffffffffffffff7f           movabs     r9, 0x7fffffffffffffff
00277 e910000000                     jmp        0x7ff8d014a50c
0027c 48b9e01215c4f87f0000           movabs     rcx, 0x7ff8c41512e0
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
00312 48bf00c043c4f87f0000           movabs     rdi, 0x7ff8c443c000
0031c b8d8010000                     mov        eax, 0x1d8
00321 7d05                           jge        0x7ff8d014a5a8
00323 b8e8010000                     mov        eax, 0x1e8
00328 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
0032c 4d8d5b01                       lea        r11, [r11 + 1]
00330 4c891c07                       mov        qword ptr [rdi + rax], r11
00334 0f8d223d0000                   jge        0x7ff8d014e2dc
0033a 413b5004                       cmp        edx, dword ptr [r8 + 4]
0033e 0f8332410000                   jae        0x7ff8d014e6f6
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
00387 48b900c043c4f87f0000           movabs     rcx, 0x7ff8c443c000
00391 41b8f8010000                   mov        r8d, 0x1f8
00397 7d06                           jge        0x7ff8d014a61f
00399 41b808020000                   mov        r8d, 0x208
0039f 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003a3 4d8d6d01                       lea        r13, [r13 + 1]
003a7 4e892c01                       mov        qword ptr [rcx + r8], r13
003ab 0f8d15000000                   jge        0x7ff8d014a646
003b1 413b5104                       cmp        edx, dword ptr [r9 + 4]
003b5 0f830f410000                   jae        0x7ff8d014e74a
003bb 4863ca                         movsxd     rcx, edx
003be 418b4c8908                     mov        ecx, dword ptr [r9 + rcx*4 + 8]
003c3 488bc1                         mov        rax, rcx
003c6 85ff                           test       edi, edi
003c8 48b900c043c4f87f0000           movabs     rcx, 0x7ff8c443c000
003d2 41b818020000                   mov        r8d, 0x218
003d8 7406                           je         0x7ff8d014a660
003da 41b828020000                   mov        r8d, 0x228
003e0 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003e4 4d8d6d01                       lea        r13, [r13 + 1]
003e8 4e892c01                       mov        qword ptr [rcx + r8], r13
003ec 0f8431000000                   je         0x7ff8d014a6a3
003f2 498bcb                         mov        rcx, r11
003f5 2bce                           sub        ecx, esi
003f7 3bf9                           cmp        edi, ecx
003f9 48b900c043c4f87f0000           movabs     rcx, 0x7ff8c443c000
00403 41b848020000                   mov        r8d, 0x248
00409 7f06                           jg         0x7ff8d014a691
0040b 41b838020000                   mov        r8d, 0x238
00411 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00415 4d8d6d01                       lea        r13, [r13 + 1]
00419 4e892c01                       mov        qword ptr [rcx + r8], r13
0041d 0f8f863e0000                   jg         0x7ff8d014e529
00423 83f803                         cmp        eax, 3
00426 48b900c043c4f87f0000           movabs     rcx, 0x7ff8c443c000
00430 41b868020000                   mov        r8d, 0x268
00436 7e06                           jle        0x7ff8d014a6be
00438 41b878020000                   mov        r8d, 0x278
0043e 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00442 4d8d6d01                       lea        r13, [r13 + 1]
00446 4e892c01                       mov        qword ptr [rcx + r8], r13
0044a 0f8e59000000                   jle        0x7ff8d014a729
00450 83e803                         sub        eax, 3
00453 837b0401                       cmp        dword ptr [rbx + 4], 1
00457 0f86c1400000                   jbe        0x7ff8d014e79e
0045d 8b4b0c                         mov        ecx, dword ptr [rbx + 0xc]
00460 837b0402                       cmp        dword ptr [rbx + 4], 2
00464 0f86da400000                   jbe        0x7ff8d014e7c4
0046a 894b10                         mov        dword ptr [rbx + 0x10], ecx
0046d 8b4b08                         mov        ecx, dword ptr [rbx + 8]
00470 894b0c                         mov        dword ptr [rbx + 0xc], ecx
00473 894308                         mov        dword ptr [rbx + 8], eax
00476 48b900c043c4f87f0000           movabs     rcx, 0x7ff8c443c000
00480 ff8188020000                   inc        dword ptr [rcx + 0x288]
00486 89942444010000                 mov        dword ptr [rsp + 0x144], edx
0048d 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
00494 4c8bb42488010000               mov        r14, qword ptr [rsp + 0x188]
0049c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
004a4 e952000000                     jmp        0x7ff8d014a77b
004a9 89942444010000                 mov        dword ptr [rsp + 0x144], edx
004b0 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
004b7 49b800c043c4f87f0000           movabs     r8, 0x7ff8c443c000
004c1 498380a002000001               add        qword ptr [r8 + 0x2a0], 1
004c9 488bf3                         mov        rsi, rbx
004cc 488bd0                         mov        rdx, rax
004cf 488bcf                         mov        rcx, rdi
004d2 90                             nop        
004d3 90                             nop        
004d4 90                             nop        
004d5 90                             nop        
004d6 90                             nop        
004d7 e804555e07                     call       0x7ff8d772fc60
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
00510 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
0051a b9c0020000                     mov        ecx, 0x2c0
0051f 7d05                           jge        0x7ff8d014a7a6
00521 b9b0020000                     mov        ecx, 0x2b0
00526 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0052a 4d8d4001                       lea        r8, [r8 + 1]
0052e 4c89040a                       mov        qword ptr [rdx + rcx], r8
00532 0f8d15000000                   jge        0x7ff8d014a7cd
00538 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00540 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00548 e9ad000000                     jmp        0x7ff8d014a87a
0054d 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00555 4585ed                         test       r13d, r13d
00558 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
00562 b9d0020000                     mov        ecx, 0x2d0
00567 7505                           jne        0x7ff8d014a7ee
00569 b9e0020000                     mov        ecx, 0x2e0
0056e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
00572 4d8d4001                       lea        r8, [r8 + 1]
00576 4c89040a                       mov        qword ptr [rdx + rcx], r8
0057a 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00582 0f8568000000                   jne        0x7ff8d014a870
00588 498bd3                         mov        rdx, r11
0058b 03d7                           add        edx, edi
0058d 2bd0                           sub        edx, eax
0058f 4863d2                         movsxd     rdx, edx
00592 493bd0                         cmp        rdx, r8
00595 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
0059f b9f0020000                     mov        ecx, 0x2f0
005a4 7c05                           jl         0x7ff8d014a82b
005a6 b900030000                     mov        ecx, 0x300
005ab 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
005af 4d8d4901                       lea        r9, [r9 + 1]
005b3 4c890c0a                       mov        qword ptr [rdx + rcx], r9
005b7 0f8c3d000000                   jl         0x7ff8d014a87a
005bd 4c8b8c2450010000               mov        r9, qword ptr [rsp + 0x150]
005c5 4c3bcb                         cmp        r9, rbx
005c8 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
005d2 b920030000                     mov        ecx, 0x320
005d7 7c05                           jl         0x7ff8d014a85e
005d9 b910030000                     mov        ecx, 0x310
005de 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
005e2 4d8d4901                       lea        r9, [r9 + 1]
005e6 4c890c0a                       mov        qword ptr [rdx + rcx], r9
005ea 0f8c0a000000                   jl         0x7ff8d014a87a
005f0 ba00000000                     mov        edx, 0
005f5 e915000000                     jmp        0x7ff8d014a88f
005fa 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
00604 ff8230030000                   inc        dword ptr [rdx + 0x330]
0060a ba01000000                     mov        edx, 1
0060f 48899c2498010000               mov        qword ptr [rsp + 0x198], rbx
00617 85c0                           test       eax, eax
00619 48b900c043c4f87f0000           movabs     rcx, 0x7ff8c443c000
00623 41b948030000                   mov        r9d, 0x348
00629 7e06                           jle        0x7ff8d014a8b1
0062b 41b958030000                   mov        r9d, 0x358
00631 4a8b1c09                       mov        rbx, qword ptr [rcx + r9]
00635 488d5b01                       lea        rbx, [rbx + 1]
00639 4a891c09                       mov        qword ptr [rcx + r9], rbx
0063d 0f8e6f390000                   jle        0x7ff8d014e232
00643 85d2                           test       edx, edx
00645 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
0064f b978030000                     mov        ecx, 0x378
00654 7505                           jne        0x7ff8d014a8db
00656 b968030000                     mov        ecx, 0x368
0065b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0065f 4d8d4901                       lea        r9, [r9 + 1]
00663 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00667 0f8545390000                   jne        0x7ff8d014e232
0066d 498bdb                         mov        rbx, r11
00670 03df                           add        ebx, edi
00672 899c24a0010000                 mov        dword ptr [rsp + 0x1a0], ebx
00679 488bf3                         mov        rsi, rbx
0067c 03b42478010000                 add        esi, dword ptr [rsp + 0x178]
00683 3bb42458010000                 cmp        esi, dword ptr [rsp + 0x158]
0068a 48be00c043c4f87f0000           movabs     rsi, 0x7ff8c443c000
00694 ba30040000                     mov        edx, 0x430
00699 7f05                           jg         0x7ff8d014a920
0069b ba40040000                     mov        edx, 0x440
006a0 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
006a4 488d4901                       lea        rcx, [rcx + 1]
006a8 48890c16                       mov        qword ptr [rsi + rdx], rcx
006ac 0f8f3f000000                   jg         0x7ff8d014a971
006b2 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
006b9 03f7                           add        esi, edi
006bb 89b424a4010000                 mov        dword ptr [rsp + 0x1a4], esi
006c2 3bb4245c010000                 cmp        esi, dword ptr [rsp + 0x15c]
006c9 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
006d3 b960040000                     mov        ecx, 0x460
006d8 7e05                           jle        0x7ff8d014a95f
006da b950040000                     mov        ecx, 0x450
006df 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
006e3 4d8d4901                       lea        r9, [r9 + 1]
006e7 4c890c0a                       mov        qword ptr [rdx + rcx], r9
006eb 0f8e76000000                   jle        0x7ff8d014a9e7
006f1 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
006f9 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
00701 48be00c043c4f87f0000           movabs     rsi, 0x7ff8c443c000
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
00747 e894525e07                     call       0x7ff8d772fc60
0074c 0f1f840044080001               nop        dword ptr [rax + rax + 0x1000844]
00754 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
0075b 03b4247c010000                 add        esi, dword ptr [rsp + 0x17c]
00762 e9c9370000                     jmp        0x7ff8d014e1b0
00767 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
0076f 83ff10                         cmp        edi, 0x10
00772 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
0077c b970040000                     mov        ecx, 0x470
00781 7f05                           jg         0x7ff8d014aa08
00783 b980040000                     mov        ecx, 0x480
00788 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0078c 4d8d4901                       lea        r9, [r9 + 1]
00790 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00794 0f8f670a0000                   jg         0x7ff8d014b481
0079a 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
007a4 4883829004000001               add        qword ptr [rdx + 0x490], 1
007ac 48baf8f214c4f87f0000           movabs     rdx, 0x7ff8c414f2f8
007b6 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
007b9 83c102                         add        ecx, 2
007bc 894a78                         mov        dword ptr [rdx + 0x78], ecx
007bf 81e1feff1f00                   and        ecx, 0x1ffffe
007c5 85c9                           test       ecx, ecx
007c7 0f849d3d0000                   je         0x7ff8d014e7ea
007cd 48ba180579e200000000           movabs     rdx, 0xe2790518
007d7 48b9f8f214c4f87f0000           movabs     rcx, 0x7ff8c414f2f8
007e1 8b12                           mov        edx, dword ptr [rdx]
007e3 c1ea0d                         shr        edx, 0xd
007e6 48c1e20a                       shl        rdx, 0xa
007ea 41ba00000035                   mov        r10d, 0x35000000
007f0 4903d2                         add        rdx, r10
007f3 41ba17000000                   mov        r10d, 0x17
007f9 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
007fd 7436                           je         0x7ff8d014aab5
007ff 4983c202                       add        r10, 2
00803 4983fa1b                       cmp        r10, 0x1b
00807 75f0                           jne        0x7ff8d014aa79
00809 41ba17000000                   mov        r10d, 0x17
0080f 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
00814 7412                           je         0x7ff8d014aaa8
00816 4983c202                       add        r10, 2
0081a 4983fa1b                       cmp        r10, 0x1b
0081e 75ef                           jne        0x7ff8d014aa8f
00820 41ba16000000                   mov        r10d, 0x16
00826 eb11                           jmp        0x7ff8d014aab9
00828 50                             push       rax
00829 4833c0                         xor        rax, rax
0082c f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
00832 58                             pop        rax
00833 ebbe                           jmp        0x7ff8d014aa73
00835 4983c201                       add        r10, 1
00839 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0083e 48baf8f214c4f87f0000           movabs     rdx, 0x7ff8c414f2f8
00848 488382e000000001               add        qword ptr [rdx + 0xe0], 1
00850 48ba00e914c4f87f0000           movabs     rdx, 0x7ff8c414e900
0085a 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0085d 83c102                         add        ecx, 2
00860 894a78                         mov        dword ptr [rdx + 0x78], ecx
00863 81e1feff1f00                   and        ecx, 0x1ffffe
00869 85c9                           test       ecx, ecx
0086b 0f841a3d0000                   je         0x7ff8d014e80b
00871 448bac2490010000               mov        r13d, dword ptr [rsp + 0x190]
00879 48ba00e914c4f87f0000           movabs     rdx, 0x7ff8c414e900
00883 4883821001000001               add        qword ptr [rdx + 0x110], 1
0088b 8b942464010000                 mov        edx, dword ptr [rsp + 0x164]
00892 83ea0f                         sub        edx, 0xf
00895 48b990df14c4f87f0000           movabs     rcx, 0x7ff8c414df90
0089f 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
008a3 4183c102                       add        r9d, 2
008a7 44894978                       mov        dword ptr [rcx + 0x78], r9d
008ab 4181e1feff1f00                 and        r9d, 0x1ffffe
008b2 4585c9                         test       r9d, r9d
008b5 0f84f13c0000                   je         0x7ff8d014e82c
008bb 48b990df14c4f87f0000           movabs     rcx, 0x7ff8c414df90
008c5 488381b000000001               add        qword ptr [rcx + 0xb0], 1
008cd 48b90000000000000000           movabs     rcx, 0
008d7 b900000000                     mov        ecx, 0
008dc 443be9                         cmp        r13d, ecx
008df 0f8ce83c0000                   jl         0x7ff8d014e84d
008e5 443bea                         cmp        r13d, edx
008e8 0f8d003d0000                   jge        0x7ff8d014e86e
008ee 498bd5                         mov        rdx, r13
008f1 89942494010000                 mov        dword ptr [rsp + 0x194], edx
008f8 48b9180579e200000000           movabs     rcx, 0xe2790518
00902 4c8bc9                         mov        r9, rcx
00905 49bef8f214c4f87f0000           movabs     r14, 0x7ff8c414f2f8
0090f 458b09                         mov        r9d, dword ptr [r9]
00912 41c1e90d                       shr        r9d, 0xd
00916 49c1e10a                       shl        r9, 0xa
0091a 41ba00000035                   mov        r10d, 0x35000000
00920 4d03ca                         add        r9, r10
00923 41ba25000000                   mov        r10d, 0x25
00929 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
0092d 7436                           je         0x7ff8d014abe5
0092f 4983c202                       add        r10, 2
00933 4983fa29                       cmp        r10, 0x29
00937 75f0                           jne        0x7ff8d014aba9
00939 41ba25000000                   mov        r10d, 0x25
0093f 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
00944 7412                           je         0x7ff8d014abd8
00946 4983c202                       add        r10, 2
0094a 4983fa29                       cmp        r10, 0x29
0094e 75ef                           jne        0x7ff8d014abbf
00950 41ba24000000                   mov        r10d, 0x24
00956 eb11                           jmp        0x7ff8d014abe9
00958 50                             push       rax
00959 4833c0                         xor        rax, rax
0095c f04f0fb10cd6                   lock cmpxchg qword ptr [r14 + r10*8], r9
00962 58                             pop        rax
00963 ebbe                           jmp        0x7ff8d014aba3
00965 4983c201                       add        r10, 1
00969 4b8304d601                     add        qword ptr [r14 + r10*8], 1
0096e 48ba98e014c4f87f0000           movabs     rdx, 0x7ff8c414e098
00978 448b4a78                       mov        r9d, dword ptr [rdx + 0x78]
0097c 4183c102                       add        r9d, 2
00980 44894a78                       mov        dword ptr [rdx + 0x78], r9d
00984 4181e1feff1f00                 and        r9d, 0x1ffffe
0098b 4585c9                         test       r9d, r9d
0098e 0f847b3c0000                   je         0x7ff8d014e88f
00994 48ba98e014c4f87f0000           movabs     rdx, 0x7ff8c414e098
0099e 488382b000000001               add        qword ptr [rdx + 0xb0], 1
009a6 48bac8e114c4f87f0000           movabs     rdx, 0x7ff8c414e1c8
009b0 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
009b3 83c102                         add        ecx, 2
009b6 894a78                         mov        dword ptr [rdx + 0x78], ecx
009b9 81e1feff1f00                   and        ecx, 0x1ffffe
009bf 85c9                           test       ecx, ecx
009c1 0f84693c0000                   je         0x7ff8d014e8b0
009c7 48bac8e114c4f87f0000           movabs     rdx, 0x7ff8c414e1c8
009d1 ff82c0000000                   inc        dword ptr [rdx + 0xc0]
009d7 8b942494010000                 mov        edx, dword ptr [rsp + 0x194]
009de 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
009e5 4489ac2490010000               mov        dword ptr [rsp + 0x190], r13d
009ed 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
009f5 488b9c2468010000               mov        rbx, qword ptr [rsp + 0x168]
009fd 48b9108579e200000000           movabs     rcx, 0xe2798510
00a07 4c8bc9                         mov        r9, rcx
00a0a 48b8f8f214c4f87f0000           movabs     rax, 0x7ff8c414f2f8
00a14 4883806001000001               add        qword ptr [rax + 0x160], 1
00a1c 49b9c8f414c4f87f0000           movabs     r9, 0x7ff8c414f4c8
00a26 418b4178                       mov        eax, dword ptr [r9 + 0x78]
00a2a 83c002                         add        eax, 2
00a2d 41894178                       mov        dword ptr [r9 + 0x78], eax
00a31 25feff1f00                     and        eax, 0x1ffffe
00a36 85c0                           test       eax, eax
00a38 0f84133c0000                   je         0x7ff8d014e8d1
00a3e 4c8bc9                         mov        r9, rcx
00a41 48b8c8f414c4f87f0000           movabs     rax, 0x7ff8c414f4c8
00a4b 488380b000000001               add        qword ptr [rax + 0xb0], 1
00a53 49b9b0f514c4f87f0000           movabs     r9, 0x7ff8c414f5b0
00a5d 418b4178                       mov        eax, dword ptr [r9 + 0x78]
00a61 83c002                         add        eax, 2
00a64 41894178                       mov        dword ptr [r9 + 0x78], eax
00a68 25feff1f00                     and        eax, 0x1ffffe
00a6d 85c0                           test       eax, eax
00a6f 0f84fd3b0000                   je         0x7ff8d014e8f2
00a75 49b9b0f514c4f87f0000           movabs     r9, 0x7ff8c414f5b0
00a7f 498381c000000001               add        qword ptr [r9 + 0xc0], 1
00a87 48b980ea14c4f87f0000           movabs     rcx, 0x7ff8c414ea80
00a91 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
00a95 4183c102                       add        r9d, 2
00a99 44894978                       mov        dword ptr [rcx + 0x78], r9d
00a9d 4181e1feff1f00                 and        r9d, 0x1ffffe
00aa4 4585c9                         test       r9d, r9d
00aa7 0f84e63b0000                   je         0x7ff8d014e913
00aad 48b9180579e200000000           movabs     rcx, 0xe2790518
00ab7 4c8bc9                         mov        r9, rcx
00aba 48b8b0f514c4f87f0000           movabs     rax, 0x7ff8c414f5b0
00ac4 458b09                         mov        r9d, dword ptr [r9]
00ac7 41c1e90d                       shr        r9d, 0xd
00acb 49c1e10a                       shl        r9, 0xa
00acf 41ba00000035                   mov        r10d, 0x35000000
00ad5 4d03ca                         add        r9, r10
00ad8 41ba1d000000                   mov        r10d, 0x1d
00ade 4e3b0cd0                       cmp        r9, qword ptr [rax + r10*8]
00ae2 743c                           je         0x7ff8d014ada0
00ae4 4983c202                       add        r10, 2
00ae8 4983fa21                       cmp        r10, 0x21
00aec 75f0                           jne        0x7ff8d014ad5e
00aee 41ba1d000000                   mov        r10d, 0x1d
00af4 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
00af9 7412                           je         0x7ff8d014ad8d
00afb 4983c202                       add        r10, 2
00aff 4983fa21                       cmp        r10, 0x21
00b03 75ef                           jne        0x7ff8d014ad74
00b05 41ba1c000000                   mov        r10d, 0x1c
00b0b eb17                           jmp        0x7ff8d014ada4
00b0d 53                             push       rbx
00b0e 488bd8                         mov        rbx, rax
00b11 4833c0                         xor        rax, rax
00b14 f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
00b1a 488bc3                         mov        rax, rbx
00b1d 5b                             pop        rbx
00b1e ebb8                           jmp        0x7ff8d014ad58
00b20 4983c201                       add        r10, 1
00b24 4a8304d001                     add        qword ptr [rax + r10*8], 1
00b29 49b9b0f514c4f87f0000           movabs     r9, 0x7ff8c414f5b0
00b33 8b09                           mov        ecx, dword ptr [rcx]
00b35 c1e90d                         shr        ecx, 0xd
00b38 48c1e10a                       shl        rcx, 0xa
00b3c 41ba00000035                   mov        r10d, 0x35000000
00b42 4903ca                         add        rcx, r10
00b45 41ba23000000                   mov        r10d, 0x23
00b4b 4b3b0cd1                       cmp        rcx, qword ptr [r9 + r10*8]
00b4f 7436                           je         0x7ff8d014ae07
00b51 4983c202                       add        r10, 2
00b55 4983fa27                       cmp        r10, 0x27
00b59 75f0                           jne        0x7ff8d014adcb
00b5b 41ba23000000                   mov        r10d, 0x23
00b61 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
00b66 7412                           je         0x7ff8d014adfa
00b68 4983c202                       add        r10, 2
00b6c 4983fa27                       cmp        r10, 0x27
00b70 75ef                           jne        0x7ff8d014ade1
00b72 41ba22000000                   mov        r10d, 0x22
00b78 eb11                           jmp        0x7ff8d014ae0b
00b7a 50                             push       rax
00b7b 4833c0                         xor        rax, rax
00b7e f04b0fb10cd1                   lock cmpxchg qword ptr [r9 + r10*8], rcx
00b84 58                             pop        rax
00b85 ebbe                           jmp        0x7ff8d014adc5
00b87 4983c201                       add        r10, 1
00b8b 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00b90 48b9b0f514c4f87f0000           movabs     rcx, 0x7ff8c414f5b0
00b9a 4883814001000001               add        qword ptr [rcx + 0x140], 1
00ba2 48b948eb14c4f87f0000           movabs     rcx, 0x7ff8c414eb48
00bac 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
00bb0 4183c102                       add        r9d, 2
00bb4 44894978                       mov        dword ptr [rcx + 0x78], r9d
00bb8 4181e1feff1f00                 and        r9d, 0x1ffffe
00bbf 4585c9                         test       r9d, r9d
00bc2 0f84ec3a0000                   je         0x7ff8d014e934
00bc8 48b9b0f514c4f87f0000           movabs     rcx, 0x7ff8c414f5b0
00bd2 4883815001000001               add        qword ptr [rcx + 0x150], 1
00bda 4863c2                         movsxd     rax, edx
00bdd ba08000000                     mov        edx, 8
00be2 4c8bc8                         mov        r9, rax
00be5 4c03ca                         add        r9, rdx
00be8 48bad0dc14c4f87f0000           movabs     rdx, 0x7ff8c414dcd0
00bf2 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
00bf5 83c102                         add        ecx, 2
00bf8 894a78                         mov        dword ptr [rdx + 0x78], ecx
00bfb 81e1feff1f00                   and        ecx, 0x1ffffe
00c01 85c9                           test       ecx, ecx
00c03 0f84cc3a0000                   je         0x7ff8d014e955
00c09 48bad0dc14c4f87f0000           movabs     rdx, 0x7ff8c414dcd0
00c13 488382e000000001               add        qword ptr [rdx + 0xe0], 1
00c1b 48ba50de14c4f87f0000           movabs     rdx, 0x7ff8c414de50
00c25 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
00c28 83c102                         add        ecx, 2
00c2b 894a78                         mov        dword ptr [rdx + 0x78], ecx
00c2e 81e1feff1f00                   and        ecx, 0x1ffffe
00c34 85c9                           test       ecx, ecx
00c36 0f84ba3a0000                   je         0x7ff8d014e976
00c3c 48bab0f514c4f87f0000           movabs     rdx, 0x7ff8c414f5b0
00c46 4883827001000001               add        qword ptr [rdx + 0x170], 1
00c4e 48bae0dd79e200000000           movabs     rdx, 0xe279dde0
00c58 48be600579e200000000           movabs     rsi, 0xe2790560
00c62 ba02000000                     mov        edx, 2
00c67 b910000000                     mov        ecx, 0x10
00c6c 4c8bc3                         mov        r8, rbx
00c6f bf00000000                     mov        edi, 0
00c74 48891c24                       mov        qword ptr [rsp], rbx
00c78 4889442408                     mov        qword ptr [rsp + 8], rax
00c7d 49ba180579e200000000           movabs     r10, 0xe2790518
00c87 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00c8c 49bae0dd79e200000000           movabs     r10, 0xe279dde0
00c96 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c9b 90                             nop        
00c9c 90                             nop        
00c9d 90                             nop        
00c9e 90                             nop        
00c9f e83c4d5e07                     call       0x7ff8d772fc60
00ca4 0f1f84009c0d0002               nop        dword ptr [rax + rax + 0x2000d9c]
00cac 4885c0                         test       rax, rax
00caf 48bbb0f514c4f87f0000           movabs     rbx, 0x7ff8c414f5b0
00cb9 750c                           jne        0x7ff8d014af47
00cbb 808b7901000001                 or         byte ptr [rbx + 0x179], 1
00cc2 e988000000                     jmp        0x7ff8d014afcf
00cc7 8b38                           mov        edi, dword ptr [rax]
00cc9 c1ef0d                         shr        edi, 0xd
00ccc 48c1e70a                       shl        rdi, 0xa
00cd0 41ba00000035                   mov        r10d, 0x35000000
00cd6 4903fa                         add        rdi, r10
00cd9 41ba31000000                   mov        r10d, 0x31
00cdf 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
00ce3 7436                           je         0x7ff8d014af9b
00ce5 4983c202                       add        r10, 2
00ce9 4983fa35                       cmp        r10, 0x35
00ced 75f0                           jne        0x7ff8d014af5f
00cef 41ba31000000                   mov        r10d, 0x31
00cf5 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00cfa 7412                           je         0x7ff8d014af8e
00cfc 4983c202                       add        r10, 2
00d00 4983fa35                       cmp        r10, 0x35
00d04 75ef                           jne        0x7ff8d014af75
00d06 41ba30000000                   mov        r10d, 0x30
00d0c eb11                           jmp        0x7ff8d014af9f
00d0e 50                             push       rax
00d0f 4833c0                         xor        rax, rax
00d12 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
00d18 58                             pop        rax
00d19 ebbe                           jmp        0x7ff8d014af59
00d1b 4983c201                       add        r10, 1
00d1f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00d24 48bf0084003600000000           movabs     rdi, 0x36008400
00d2e 8b18                           mov        ebx, dword ptr [rax]
00d30 c1eb0d                         shr        ebx, 0xd
00d33 48c1e30a                       shl        rbx, 0xa
00d37 41ba00000035                   mov        r10d, 0x35000000
00d3d 4903da                         add        rbx, r10
00d40 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
00d44 0f85cd390000                   jne        0x7ff8d014e997
00d4a e900000000                     jmp        0x7ff8d014afcf
00d4f 488bf8                         mov        rdi, rax
00d52 4889bc24b0010000               mov        qword ptr [rsp + 0x1b0], rdi
00d5a 483b07                         cmp        rax, qword ptr [rdi]
00d5d 488bf7                         mov        rsi, rdi
00d60 48bb00c043c4f87f0000           movabs     rbx, 0x7ff8c443c000
00d6a 8b36                           mov        esi, dword ptr [rsi]
00d6c c1ee0d                         shr        esi, 0xd
00d6f 48c1e60a                       shl        rsi, 0xa
00d73 41ba00000035                   mov        r10d, 0x35000000
00d79 4903f2                         add        rsi, r10
00d7c 41ba95000000                   mov        r10d, 0x95
00d82 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00d86 743c                           je         0x7ff8d014b044
00d88 4983c202                       add        r10, 2
00d8c 4981fa99000000                 cmp        r10, 0x99
00d93 75ed                           jne        0x7ff8d014b002
00d95 41ba95000000                   mov        r10d, 0x95
00d9b 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00da0 7415                           je         0x7ff8d014b037
00da2 4983c202                       add        r10, 2
00da6 4981fa99000000                 cmp        r10, 0x99
00dad 75ec                           jne        0x7ff8d014b01b
00daf 41ba94000000                   mov        r10d, 0x94
00db5 eb11                           jmp        0x7ff8d014b048
00db7 50                             push       rax
00db8 4833c0                         xor        rax, rax
00dbb f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00dc1 58                             pop        rax
00dc2 ebb8                           jmp        0x7ff8d014affc
00dc4 4983c201                       add        r10, 1
00dc8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00dcd 48be000015c4f87f0000           movabs     rsi, 0x7ff8c4150000
00dd7 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
00dda 83c302                         add        ebx, 2
00ddd 895e78                         mov        dword ptr [rsi + 0x78], ebx
00de0 81e3feff1f00                   and        ebx, 0x1ffffe
00de6 85db                           test       ebx, ebx
00de8 0f845f390000                   je         0x7ff8d014e9cd
00dee 488bf7                         mov        rsi, rdi
00df1 48bb000015c4f87f0000           movabs     rbx, 0x7ff8c4150000
00dfb 8b36                           mov        esi, dword ptr [rsi]
00dfd c1ee0d                         shr        esi, 0xd
00e00 48c1e60a                       shl        rsi, 0xa
00e04 41ba00000035                   mov        r10d, 0x35000000
00e0a 4903f2                         add        rsi, r10
00e0d 41ba17000000                   mov        r10d, 0x17
00e13 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00e17 7436                           je         0x7ff8d014b0cf
00e19 4983c202                       add        r10, 2
00e1d 4983fa1b                       cmp        r10, 0x1b
00e21 75f0                           jne        0x7ff8d014b093
00e23 41ba17000000                   mov        r10d, 0x17
00e29 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00e2e 7412                           je         0x7ff8d014b0c2
00e30 4983c202                       add        r10, 2
00e34 4983fa1b                       cmp        r10, 0x1b
00e38 75ef                           jne        0x7ff8d014b0a9
00e3a 41ba16000000                   mov        r10d, 0x16
00e40 eb11                           jmp        0x7ff8d014b0d3
00e42 50                             push       rax
00e43 4833c0                         xor        rax, rax
00e46 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00e4c 58                             pop        rax
00e4d ebbe                           jmp        0x7ff8d014b08d
00e4f 4983c201                       add        r10, 1
00e53 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00e58 488bf7                         mov        rsi, rdi
00e5b 90                             nop        
00e5c 90                             nop        
00e5d 48b8b0e75fa4f87f0000           movabs     rax, 0x7ff8a45fe7b0
00e67 e874465e07                     call       0x7ff8d772f760
00e6c 0f1f8400640f0003               nop        dword ptr [rax + rax + 0x3000f64]
00e74 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
00e7c 8b7704                         mov        esi, dword ptr [rdi + 4]
00e7f 48bb000015c4f87f0000           movabs     rbx, 0x7ff8c4150000
00e89 488383e000000001               add        qword ptr [rbx + 0xe0], 1
00e91 48bb00e914c4f87f0000           movabs     rbx, 0x7ff8c414e900
00e9b 8b5378                         mov        edx, dword ptr [rbx + 0x78]
00e9e 83c202                         add        edx, 2
00ea1 895378                         mov        dword ptr [rbx + 0x78], edx
00ea4 81e2feff1f00                   and        edx, 0x1ffffe
00eaa 85d2                           test       edx, edx
00eac 0f84d5380000                   je         0x7ff8d014ea07
00eb2 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
00eba 48bb00e914c4f87f0000           movabs     rbx, 0x7ff8c414e900
00ec4 4883831001000001               add        qword ptr [rbx + 0x110], 1
00ecc ffc8                           dec        eax
00ece 2bf0                           sub        esi, eax
00ed0 48bb90df14c4f87f0000           movabs     rbx, 0x7ff8c414df90
00eda 8b4378                         mov        eax, dword ptr [rbx + 0x78]
00edd 83c002                         add        eax, 2
00ee0 894378                         mov        dword ptr [rbx + 0x78], eax
00ee3 25feff1f00                     and        eax, 0x1ffffe
00ee8 85c0                           test       eax, eax
00eea 0f84b8380000                   je         0x7ff8d014ea28
00ef0 48bb90df14c4f87f0000           movabs     rbx, 0x7ff8c414df90
00efa 488383b000000001               add        qword ptr [rbx + 0xb0], 1
00f02 48bb0000000000000000           movabs     rbx, 0
00f0c bb00000000                     mov        ebx, 0
00f11 443bdb                         cmp        r11d, ebx
00f14 0f8caf380000                   jl         0x7ff8d014ea49
00f1a 443bde                         cmp        r11d, esi
00f1d 0f8dc7380000                   jge        0x7ff8d014ea6a
00f23 498bdb                         mov        rbx, r11
00f26 899c24ac010000                 mov        dword ptr [rsp + 0x1ac], ebx
00f2d 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
00f35 488bbc24b0010000               mov        rdi, qword ptr [rsp + 0x1b0]
00f3d 488bf7                         mov        rsi, rdi
00f40 48ba000015c4f87f0000           movabs     rdx, 0x7ff8c4150000
00f4a 8b36                           mov        esi, dword ptr [rsi]
00f4c c1ee0d                         shr        esi, 0xd
00f4f 48c1e60a                       shl        rsi, 0xa
00f53 41ba00000035                   mov        r10d, 0x35000000
00f59 4903f2                         add        rsi, r10
00f5c 41ba1f000000                   mov        r10d, 0x1f
00f62 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
00f66 7436                           je         0x7ff8d014b21e
00f68 4983c202                       add        r10, 2
00f6c 4983fa23                       cmp        r10, 0x23
00f70 75f0                           jne        0x7ff8d014b1e2
00f72 41ba1f000000                   mov        r10d, 0x1f
00f78 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
00f7d 7412                           je         0x7ff8d014b211
00f7f 4983c202                       add        r10, 2
00f83 4983fa23                       cmp        r10, 0x23
00f87 75ef                           jne        0x7ff8d014b1f8
00f89 41ba1e000000                   mov        r10d, 0x1e
00f8f eb11                           jmp        0x7ff8d014b222
00f91 50                             push       rax
00f92 4833c0                         xor        rax, rax
00f95 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
00f9b 58                             pop        rax
00f9c ebbe                           jmp        0x7ff8d014b1dc
00f9e 4983c201                       add        r10, 1
00fa2 4a8304d201                     add        qword ptr [rdx + r10*8], 1
00fa7 488bf7                         mov        rsi, rdi
00faa 90                             nop        
00fab 90                             nop        
00fac 90                             nop        
00fad 48b8d8e75fa4f87f0000           movabs     rax, 0x7ff8a45fe7d8
00fb7 e824455e07                     call       0x7ff8d772f760
00fbc 0f1f8400b4100004               nop        dword ptr [rax + rax + 0x40010b4]
00fc4 483b00                         cmp        rax, qword ptr [rax]
00fc7 488bf0                         mov        rsi, rax
00fca 48ba000015c4f87f0000           movabs     rdx, 0x7ff8c4150000
00fd4 8b36                           mov        esi, dword ptr [rsi]
00fd6 c1ee0d                         shr        esi, 0xd
00fd9 48c1e60a                       shl        rsi, 0xa
00fdd 41ba00000035                   mov        r10d, 0x35000000
00fe3 4903f2                         add        rsi, r10
00fe6 41ba25000000                   mov        r10d, 0x25
00fec 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
00ff0 7436                           je         0x7ff8d014b2a8
00ff2 4983c202                       add        r10, 2
00ff6 4983fa29                       cmp        r10, 0x29
00ffa 75f0                           jne        0x7ff8d014b26c
00ffc 41ba25000000                   mov        r10d, 0x25
01002 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01007 7412                           je         0x7ff8d014b29b
01009 4983c202                       add        r10, 2
0100d 4983fa29                       cmp        r10, 0x29
01011 75ef                           jne        0x7ff8d014b282
01013 41ba24000000                   mov        r10d, 0x24
01019 eb11                           jmp        0x7ff8d014b2ac
0101b 50                             push       rax
0101c 4833c0                         xor        rax, rax
0101f f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01025 58                             pop        rax
01026 ebbe                           jmp        0x7ff8d014b266
01028 4983c201                       add        r10, 1
0102c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01031 8b7024                         mov        esi, dword ptr [rax + 0x24]
01034 4c3b255d31851f                 cmp        r12, qword ptr [rip + 0x1f85315d]
0103b 0f8414000000                   je         0x7ff8d014b2d5
01041 48bf3803a7edf87f0000           movabs     rdi, 0x7ff8eda70338
0104b 4883e4f0                       and        rsp, 0xfffffffffffffff0
0104f e80c19c21e                     call       0x7ff8eed6cbe0
01054 f4                             hlt        
01055 488bd0                         mov        rdx, rax
01058 48b9000015c4f87f0000           movabs     rcx, 0x7ff8c4150000
01062 8b12                           mov        edx, dword ptr [rdx]
01064 c1ea0d                         shr        edx, 0xd
01067 48c1e20a                       shl        rdx, 0xa
0106b 41ba00000035                   mov        r10d, 0x35000000
01071 4903d2                         add        rdx, r10
01074 41ba2b000000                   mov        r10d, 0x2b
0107a 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0107e 7436                           je         0x7ff8d014b336
01080 4983c202                       add        r10, 2
01084 4983fa2f                       cmp        r10, 0x2f
01088 75f0                           jne        0x7ff8d014b2fa
0108a 41ba2b000000                   mov        r10d, 0x2b
01090 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01095 7412                           je         0x7ff8d014b329
01097 4983c202                       add        r10, 2
0109b 4983fa2f                       cmp        r10, 0x2f
0109f 75ef                           jne        0x7ff8d014b310
010a1 41ba2a000000                   mov        r10d, 0x2a
010a7 eb11                           jmp        0x7ff8d014b33a
010a9 50                             push       rax
010aa 4833c0                         xor        rax, rax
010ad f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
010b3 58                             pop        rax
010b4 ebbe                           jmp        0x7ff8d014b2f4
010b6 4983c201                       add        r10, 1
010ba 4a8304d101                     add        qword ptr [rcx + r10*8], 1
010bf 8b4804                         mov        ecx, dword ptr [rax + 4]
010c2 48ba000015c4f87f0000           movabs     rdx, 0x7ff8c4150000
010cc 4883828001000001               add        qword ptr [rdx + 0x180], 1
010d4 48ba48eb14c4f87f0000           movabs     rdx, 0x7ff8c414eb48
010de 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
010e2 4183c002                       add        r8d, 2
010e6 44894278                       mov        dword ptr [rdx + 0x78], r8d
010ea 4181e0feff1f00                 and        r8d, 0x1ffffe
010f1 4585c0                         test       r8d, r8d
010f4 0f842a370000                   je         0x7ff8d014eaa4
010fa 48ba000015c4f87f0000           movabs     rdx, 0x7ff8c4150000
01104 4883829001000001               add        qword ptr [rdx + 0x190], 1
0110c 8b9c24ac010000                 mov        ebx, dword ptr [rsp + 0x1ac]
01113 4863db                         movsxd     rbx, ebx
01116 ba08000000                     mov        edx, 8
0111b 4c8bcb                         mov        r9, rbx
0111e 4c03ca                         add        r9, rdx
01121 48bad0dc14c4f87f0000           movabs     rdx, 0x7ff8c414dcd0
0112b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
0112f 4183c002                       add        r8d, 2
01133 44894278                       mov        dword ptr [rdx + 0x78], r8d
01137 4181e0feff1f00                 and        r8d, 0x1ffffe
0113e 4585c0                         test       r8d, r8d
01141 0f84fe360000                   je         0x7ff8d014eac5
01147 48bad0dc14c4f87f0000           movabs     rdx, 0x7ff8c414dcd0
01151 488382e000000001               add        qword ptr [rdx + 0xe0], 1
01159 48ba50de14c4f87f0000           movabs     rdx, 0x7ff8c414de50
01163 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01167 4183c002                       add        r8d, 2
0116b 44894278                       mov        dword ptr [rdx + 0x78], r8d
0116f 4181e0feff1f00                 and        r8d, 0x1ffffe
01176 4585c0                         test       r8d, r8d
01179 0f84e7360000                   je         0x7ff8d014eae6
0117f 48ba000015c4f87f0000           movabs     rdx, 0x7ff8c4150000
01189 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
01191 48bac87b7ae200000000           movabs     rdx, 0xe27a7bc8
0119b ba02000000                     mov        edx, 2
011a0 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
011a8 bf00000000                     mov        edi, 0
011ad 488b8424b0010000               mov        rax, qword ptr [rsp + 0x1b0]
011b5 48890424                       mov        qword ptr [rsp], rax
011b9 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
011c1 4889442408                     mov        qword ptr [rsp + 8], rax
011c6 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
011cb 49bac87b7ae200000000           movabs     r10, 0xe27a7bc8
011d5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
011da 90                             nop        
011db 90                             nop        
011dc 90                             nop        
011dd 90                             nop        
011de 90                             nop        
011df e8fc475e07                     call       0x7ff8d772fc60
011e4 0f1f8400dc120005               nop        dword ptr [rax + rax + 0x50012dc]
011ec 48be00c043c4f87f0000           movabs     rsi, 0x7ff8c443c000
011f6 ff86d0040000                   inc        dword ptr [rsi + 0x4d0]
011fc e9480c0000                     jmp        0x7ff8d014c0c9
01201 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
01208 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
01210 83ff30                         cmp        edi, 0x30
01213 48be00c043c4f87f0000           movabs     rsi, 0x7ff8c443c000
0121d bae8040000                     mov        edx, 0x4e8
01222 7f05                           jg         0x7ff8d014b4a9
01224 baf8040000                     mov        edx, 0x4f8
01229 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0122d 488d4901                       lea        rcx, [rcx + 1]
01231 48890c16                       mov        qword ptr [rsi + rdx], rcx
01235 0f8f1e0b0000                   jg         0x7ff8d014bfd9
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
01267 48b900c043c4f87f0000           movabs     rcx, 0x7ff8c443c000
01271 4883810805000001               add        qword ptr [rcx + 0x508], 1
01279 48b9f8f214c4f87f0000           movabs     rcx, 0x7ff8c414f2f8
01283 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
01287 4183c002                       add        r8d, 2
0128b 44894178                       mov        dword ptr [rcx + 0x78], r8d
0128f 4181e0feff1f00                 and        r8d, 0x1ffffe
01296 4585c0                         test       r8d, r8d
01299 0f84e8350000                   je         0x7ff8d014eb07
0129f 48b9180579e200000000           movabs     rcx, 0xe2790518
012a9 49b8f8f214c4f87f0000           movabs     r8, 0x7ff8c414f2f8
012b3 8b09                           mov        ecx, dword ptr [rcx]
012b5 c1e90d                         shr        ecx, 0xd
012b8 48c1e10a                       shl        rcx, 0xa
012bc 41ba00000035                   mov        r10d, 0x35000000
012c2 4903ca                         add        rcx, r10
012c5 41ba17000000                   mov        r10d, 0x17
012cb 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
012cf 7436                           je         0x7ff8d014b587
012d1 4983c202                       add        r10, 2
012d5 4983fa1b                       cmp        r10, 0x1b
012d9 75f0                           jne        0x7ff8d014b54b
012db 41ba17000000                   mov        r10d, 0x17
012e1 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
012e6 7412                           je         0x7ff8d014b57a
012e8 4983c202                       add        r10, 2
012ec 4983fa1b                       cmp        r10, 0x1b
012f0 75ef                           jne        0x7ff8d014b561
012f2 41ba16000000                   mov        r10d, 0x16
012f8 eb11                           jmp        0x7ff8d014b58b
012fa 50                             push       rax
012fb 4833c0                         xor        rax, rax
012fe f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
01304 58                             pop        rax
01305 ebbe                           jmp        0x7ff8d014b545
01307 4983c201                       add        r10, 1
0130b 4b8304d001                     add        qword ptr [r8 + r10*8], 1
01310 48b9f8f214c4f87f0000           movabs     rcx, 0x7ff8c414f2f8
0131a 488381e000000001               add        qword ptr [rcx + 0xe0], 1
01322 48b900e914c4f87f0000           movabs     rcx, 0x7ff8c414e900
0132c 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
01330 4183c002                       add        r8d, 2
01334 44894178                       mov        dword ptr [rcx + 0x78], r8d
01338 4181e0feff1f00                 and        r8d, 0x1ffffe
0133f 4585c0                         test       r8d, r8d
01342 0f8460350000                   je         0x7ff8d014eb28
01348 48b900e914c4f87f0000           movabs     rcx, 0x7ff8c414e900
01352 4883811001000001               add        qword ptr [rcx + 0x110], 1
0135a 488bc8                         mov        rcx, rax
0135d 83e90f                         sub        ecx, 0xf
01360 49b890df14c4f87f0000           movabs     r8, 0x7ff8c414df90
0136a 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
0136e 4183c102                       add        r9d, 2
01372 45894878                       mov        dword ptr [r8 + 0x78], r9d
01376 4181e1feff1f00                 and        r9d, 0x1ffffe
0137d 4585c9                         test       r9d, r9d
01380 0f8443350000                   je         0x7ff8d014eb49
01386 49b890df14c4f87f0000           movabs     r8, 0x7ff8c414df90
01390 498380b000000001               add        qword ptr [r8 + 0xb0], 1
01398 49b80000000000000000           movabs     r8, 0
013a2 41b800000000                   mov        r8d, 0
013a8 413bf0                         cmp        esi, r8d
013ab 0f8c39350000                   jl         0x7ff8d014eb6a
013b1 3bf1                           cmp        esi, ecx
013b3 0f8d52350000                   jge        0x7ff8d014eb8b
013b9 488bce                         mov        rcx, rsi
013bc 898c24b8010000                 mov        dword ptr [rsp + 0x1b8], ecx
013c3 49b8180579e200000000           movabs     r8, 0xe2790518
013cd 4d8bc8                         mov        r9, r8
013d0 49bef8f214c4f87f0000           movabs     r14, 0x7ff8c414f2f8
013da 458b09                         mov        r9d, dword ptr [r9]
013dd 41c1e90d                       shr        r9d, 0xd
013e1 49c1e10a                       shl        r9, 0xa
013e5 41ba00000035                   mov        r10d, 0x35000000
013eb 4d03ca                         add        r9, r10
013ee 41ba25000000                   mov        r10d, 0x25
013f4 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
013f8 7436                           je         0x7ff8d014b6b0
013fa 4983c202                       add        r10, 2
013fe 4983fa29                       cmp        r10, 0x29
01402 75f0                           jne        0x7ff8d014b674
01404 41ba25000000                   mov        r10d, 0x25
0140a 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
0140f 7412                           je         0x7ff8d014b6a3
01411 4983c202                       add        r10, 2
01415 4983fa29                       cmp        r10, 0x29
01419 75ef                           jne        0x7ff8d014b68a
0141b 41ba24000000                   mov        r10d, 0x24
01421 eb11                           jmp        0x7ff8d014b6b4
01423 50                             push       rax
01424 4833c0                         xor        rax, rax
01427 f04f0fb10cd6                   lock cmpxchg qword ptr [r14 + r10*8], r9
0142d 58                             pop        rax
0142e ebbe                           jmp        0x7ff8d014b66e
01430 4983c201                       add        r10, 1
01434 4b8304d601                     add        qword ptr [r14 + r10*8], 1
01439 48b998e014c4f87f0000           movabs     rcx, 0x7ff8c414e098
01443 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
01447 4183c102                       add        r9d, 2
0144b 44894978                       mov        dword ptr [rcx + 0x78], r9d
0144f 4181e1feff1f00                 and        r9d, 0x1ffffe
01456 4585c9                         test       r9d, r9d
01459 0f84cd340000                   je         0x7ff8d014ebac
0145f 48b998e014c4f87f0000           movabs     rcx, 0x7ff8c414e098
01469 488381b000000001               add        qword ptr [rcx + 0xb0], 1
01471 48b9c8e114c4f87f0000           movabs     rcx, 0x7ff8c414e1c8
0147b 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
0147f 4183c002                       add        r8d, 2
01483 44894178                       mov        dword ptr [rcx + 0x78], r8d
01487 4181e0feff1f00                 and        r8d, 0x1ffffe
0148e 4585c0                         test       r8d, r8d
01491 0f84b6340000                   je         0x7ff8d014ebcd
01497 48b9c8e114c4f87f0000           movabs     rcx, 0x7ff8c414e1c8
014a1 ff81c0000000                   inc        dword ptr [rcx + 0xc0]
014a7 8b8c24b8010000                 mov        ecx, dword ptr [rsp + 0x1b8]
014ae 89b424c0010000                 mov        dword ptr [rsp + 0x1c0], esi
014b5 49b8108579e200000000           movabs     r8, 0xe2798510
014bf 4d8bc8                         mov        r9, r8
014c2 49bef8f214c4f87f0000           movabs     r14, 0x7ff8c414f2f8
014cc 4983866001000001               add        qword ptr [r14 + 0x160], 1
014d4 49b9c8f414c4f87f0000           movabs     r9, 0x7ff8c414f4c8
014de 418b5978                       mov        ebx, dword ptr [r9 + 0x78]
014e2 83c302                         add        ebx, 2
014e5 41895978                       mov        dword ptr [r9 + 0x78], ebx
014e9 81e3feff1f00                   and        ebx, 0x1ffffe
014ef 85db                           test       ebx, ebx
014f1 0f8477340000                   je         0x7ff8d014ebee
014f7 4d8bc8                         mov        r9, r8
014fa 48bbc8f414c4f87f0000           movabs     rbx, 0x7ff8c414f4c8
01504 488383b000000001               add        qword ptr [rbx + 0xb0], 1
0150c 49b9b0f514c4f87f0000           movabs     r9, 0x7ff8c414f5b0
01516 418b5978                       mov        ebx, dword ptr [r9 + 0x78]
0151a 83c302                         add        ebx, 2
0151d 41895978                       mov        dword ptr [r9 + 0x78], ebx
01521 81e3feff1f00                   and        ebx, 0x1ffffe
01527 85db                           test       ebx, ebx
01529 0f8460340000                   je         0x7ff8d014ec0f
0152f 49b9b0f514c4f87f0000           movabs     r9, 0x7ff8c414f5b0
01539 498381c000000001               add        qword ptr [r9 + 0xc0], 1
01541 49b880ea14c4f87f0000           movabs     r8, 0x7ff8c414ea80
0154b 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
0154f 4183c102                       add        r9d, 2
01553 45894878                       mov        dword ptr [r8 + 0x78], r9d
01557 4181e1feff1f00                 and        r9d, 0x1ffffe
0155e 4585c9                         test       r9d, r9d
01561 0f8449340000                   je         0x7ff8d014ec30
01567 49b8180579e200000000           movabs     r8, 0xe2790518
01571 4d8bc8                         mov        r9, r8
01574 48bbb0f514c4f87f0000           movabs     rbx, 0x7ff8c414f5b0
0157e 458b09                         mov        r9d, dword ptr [r9]
01581 41c1e90d                       shr        r9d, 0xd
01585 49c1e10a                       shl        r9, 0xa
01589 41ba00000035                   mov        r10d, 0x35000000
0158f 4d03ca                         add        r9, r10
01592 41ba1d000000                   mov        r10d, 0x1d
01598 4e3b0cd3                       cmp        r9, qword ptr [rbx + r10*8]
0159c 7436                           je         0x7ff8d014b854
0159e 4983c202                       add        r10, 2
015a2 4983fa21                       cmp        r10, 0x21
015a6 75f0                           jne        0x7ff8d014b818
015a8 41ba1d000000                   mov        r10d, 0x1d
015ae 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
015b3 7412                           je         0x7ff8d014b847
015b5 4983c202                       add        r10, 2
015b9 4983fa21                       cmp        r10, 0x21
015bd 75ef                           jne        0x7ff8d014b82e
015bf 41ba1c000000                   mov        r10d, 0x1c
015c5 eb11                           jmp        0x7ff8d014b858
015c7 50                             push       rax
015c8 4833c0                         xor        rax, rax
015cb f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
015d1 58                             pop        rax
015d2 ebbe                           jmp        0x7ff8d014b812
015d4 4983c201                       add        r10, 1
015d8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
015dd 49b9b0f514c4f87f0000           movabs     r9, 0x7ff8c414f5b0
015e7 458b00                         mov        r8d, dword ptr [r8]
015ea 41c1e80d                       shr        r8d, 0xd
015ee 49c1e00a                       shl        r8, 0xa
015f2 41ba00000035                   mov        r10d, 0x35000000
015f8 4d03c2                         add        r8, r10
015fb 41ba23000000                   mov        r10d, 0x23
01601 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
01605 7436                           je         0x7ff8d014b8bd
01607 4983c202                       add        r10, 2
0160b 4983fa27                       cmp        r10, 0x27
0160f 75f0                           jne        0x7ff8d014b881
01611 41ba23000000                   mov        r10d, 0x23
01617 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
0161c 7412                           je         0x7ff8d014b8b0
0161e 4983c202                       add        r10, 2
01622 4983fa27                       cmp        r10, 0x27
01626 75ef                           jne        0x7ff8d014b897
01628 41ba22000000                   mov        r10d, 0x22
0162e eb11                           jmp        0x7ff8d014b8c1
01630 50                             push       rax
01631 4833c0                         xor        rax, rax
01634 f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
0163a 58                             pop        rax
0163b ebbe                           jmp        0x7ff8d014b87b
0163d 4983c201                       add        r10, 1
01641 4b8304d101                     add        qword ptr [r9 + r10*8], 1
01646 49b8b0f514c4f87f0000           movabs     r8, 0x7ff8c414f5b0
01650 4983804001000001               add        qword ptr [r8 + 0x140], 1
01658 49b848eb14c4f87f0000           movabs     r8, 0x7ff8c414eb48
01662 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
01666 4183c102                       add        r9d, 2
0166a 45894878                       mov        dword ptr [r8 + 0x78], r9d
0166e 4181e1feff1f00                 and        r9d, 0x1ffffe
01675 4585c9                         test       r9d, r9d
01678 0f8453330000                   je         0x7ff8d014ec51
0167e 49b8b0f514c4f87f0000           movabs     r8, 0x7ff8c414f5b0
01688 4983805001000001               add        qword ptr [r8 + 0x150], 1
01690 4863d9                         movsxd     rbx, ecx
01693 b908000000                     mov        ecx, 8
01698 4c8bcb                         mov        r9, rbx
0169b 4c03c9                         add        r9, rcx
0169e 48b9d0dc14c4f87f0000           movabs     rcx, 0x7ff8c414dcd0
016a8 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
016ac 4183c002                       add        r8d, 2
016b0 44894178                       mov        dword ptr [rcx + 0x78], r8d
016b4 4181e0feff1f00                 and        r8d, 0x1ffffe
016bb 4585c0                         test       r8d, r8d
016be 0f842e330000                   je         0x7ff8d014ec72
016c4 48b9d0dc14c4f87f0000           movabs     rcx, 0x7ff8c414dcd0
016ce 488381e000000001               add        qword ptr [rcx + 0xe0], 1
016d6 48b950de14c4f87f0000           movabs     rcx, 0x7ff8c414de50
016e0 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
016e4 4183c002                       add        r8d, 2
016e8 44894178                       mov        dword ptr [rcx + 0x78], r8d
016ec 4181e0feff1f00                 and        r8d, 0x1ffffe
016f3 4585c0                         test       r8d, r8d
016f6 0f8417330000                   je         0x7ff8d014ec93
016fc 48b9b0f514c4f87f0000           movabs     rcx, 0x7ff8c414f5b0
01706 4883817001000001               add        qword ptr [rcx + 0x170], 1
0170e 48b9e0dd79e200000000           movabs     rcx, 0xe279dde0
01718 48be600579e200000000           movabs     rsi, 0xe2790560
01722 4c8bc2                         mov        r8, rdx
01725 ba02000000                     mov        edx, 2
0172a b910000000                     mov        ecx, 0x10
0172f 498bc0                         mov        rax, r8
01732 4c8bc0                         mov        r8, rax
01735 bf00000000                     mov        edi, 0
0173a 48890424                       mov        qword ptr [rsp], rax
0173e 48895c2408                     mov        qword ptr [rsp + 8], rbx
01743 49ba180579e200000000           movabs     r10, 0xe2790518
0174d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01752 49bae0dd79e200000000           movabs     r10, 0xe279dde0
0175c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01761 90                             nop        
01762 90                             nop        
01763 90                             nop        
01764 90                             nop        
01765 90                             nop        
01766 90                             nop        
01767 e874425e07                     call       0x7ff8d772fc60
0176c 0f1f840064180006               nop        dword ptr [rax + rax + 0x6001864]
01774 4885c0                         test       rax, rax
01777 48bbb0f514c4f87f0000           movabs     rbx, 0x7ff8c414f5b0
01781 750c                           jne        0x7ff8d014ba0f
01783 808b7901000001                 or         byte ptr [rbx + 0x179], 1
0178a e988000000                     jmp        0x7ff8d014ba97
0178f 8b38                           mov        edi, dword ptr [rax]
01791 c1ef0d                         shr        edi, 0xd
01794 48c1e70a                       shl        rdi, 0xa
01798 41ba00000035                   mov        r10d, 0x35000000
0179e 4903fa                         add        rdi, r10
017a1 41ba31000000                   mov        r10d, 0x31
017a7 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
017ab 7436                           je         0x7ff8d014ba63
017ad 4983c202                       add        r10, 2
017b1 4983fa35                       cmp        r10, 0x35
017b5 75f0                           jne        0x7ff8d014ba27
017b7 41ba31000000                   mov        r10d, 0x31
017bd 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
017c2 7412                           je         0x7ff8d014ba56
017c4 4983c202                       add        r10, 2
017c8 4983fa35                       cmp        r10, 0x35
017cc 75ef                           jne        0x7ff8d014ba3d
017ce 41ba30000000                   mov        r10d, 0x30
017d4 eb11                           jmp        0x7ff8d014ba67
017d6 50                             push       rax
017d7 4833c0                         xor        rax, rax
017da f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
017e0 58                             pop        rax
017e1 ebbe                           jmp        0x7ff8d014ba21
017e3 4983c201                       add        r10, 1
017e7 4a8304d301                     add        qword ptr [rbx + r10*8], 1
017ec 48bf0084003600000000           movabs     rdi, 0x36008400
017f6 8b18                           mov        ebx, dword ptr [rax]
017f8 c1eb0d                         shr        ebx, 0xd
017fb 48c1e30a                       shl        rbx, 0xa
017ff 41ba00000035                   mov        r10d, 0x35000000
01805 4903da                         add        rbx, r10
01808 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
0180c 0f8522320000                   jne        0x7ff8d014ecb4
01812 e900000000                     jmp        0x7ff8d014ba97
01817 488bf8                         mov        rdi, rax
0181a 4889bc24c8010000               mov        qword ptr [rsp + 0x1c8], rdi
01822 483b07                         cmp        rax, qword ptr [rdi]
01825 488bf7                         mov        rsi, rdi
01828 48bb00c043c4f87f0000           movabs     rbx, 0x7ff8c443c000
01832 8b36                           mov        esi, dword ptr [rsi]
01834 c1ee0d                         shr        esi, 0xd
01837 48c1e60a                       shl        rsi, 0xa
0183b 41ba00000035                   mov        r10d, 0x35000000
01841 4903f2                         add        rsi, r10
01844 41baa4000000                   mov        r10d, 0xa4
0184a 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
0184e 743c                           je         0x7ff8d014bb0c
01850 4983c202                       add        r10, 2
01854 4981faa8000000                 cmp        r10, 0xa8
0185b 75ed                           jne        0x7ff8d014baca
0185d 41baa4000000                   mov        r10d, 0xa4
01863 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01868 7415                           je         0x7ff8d014baff
0186a 4983c202                       add        r10, 2
0186e 4981faa8000000                 cmp        r10, 0xa8
01875 75ec                           jne        0x7ff8d014bae3
01877 41baa3000000                   mov        r10d, 0xa3
0187d eb11                           jmp        0x7ff8d014bb10
0187f 50                             push       rax
01880 4833c0                         xor        rax, rax
01883 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01889 58                             pop        rax
0188a ebb8                           jmp        0x7ff8d014bac4
0188c 4983c201                       add        r10, 1
01890 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01895 48be000015c4f87f0000           movabs     rsi, 0x7ff8c4150000
0189f 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
018a2 83c302                         add        ebx, 2
018a5 895e78                         mov        dword ptr [rsi + 0x78], ebx
018a8 81e3feff1f00                   and        ebx, 0x1ffffe
018ae 85db                           test       ebx, ebx
018b0 0f84b4310000                   je         0x7ff8d014ecea
018b6 488bf7                         mov        rsi, rdi
018b9 48bb000015c4f87f0000           movabs     rbx, 0x7ff8c4150000
018c3 8b36                           mov        esi, dword ptr [rsi]
018c5 c1ee0d                         shr        esi, 0xd
018c8 48c1e60a                       shl        rsi, 0xa
018cc 41ba00000035                   mov        r10d, 0x35000000
018d2 4903f2                         add        rsi, r10
018d5 41ba17000000                   mov        r10d, 0x17
018db 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
018df 7436                           je         0x7ff8d014bb97
018e1 4983c202                       add        r10, 2
018e5 4983fa1b                       cmp        r10, 0x1b
018e9 75f0                           jne        0x7ff8d014bb5b
018eb 41ba17000000                   mov        r10d, 0x17
018f1 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
018f6 7412                           je         0x7ff8d014bb8a
018f8 4983c202                       add        r10, 2
018fc 4983fa1b                       cmp        r10, 0x1b
01900 75ef                           jne        0x7ff8d014bb71
01902 41ba16000000                   mov        r10d, 0x16
01908 eb11                           jmp        0x7ff8d014bb9b
0190a 50                             push       rax
0190b 4833c0                         xor        rax, rax
0190e f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01914 58                             pop        rax
01915 ebbe                           jmp        0x7ff8d014bb55
01917 4983c201                       add        r10, 1
0191b 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01920 488bf7                         mov        rsi, rdi
01923 90                             nop        
01924 90                             nop        
01925 48b800e85fa4f87f0000           movabs     rax, 0x7ff8a45fe800
0192f e8ac3b5e07                     call       0x7ff8d772f760
01934 0f1f84002c1a0007               nop        dword ptr [rax + rax + 0x7001a2c]
0193c 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
01944 8b7704                         mov        esi, dword ptr [rdi + 4]
01947 48bb000015c4f87f0000           movabs     rbx, 0x7ff8c4150000
01951 488383e000000001               add        qword ptr [rbx + 0xe0], 1
01959 48bb00e914c4f87f0000           movabs     rbx, 0x7ff8c414e900
01963 8b5378                         mov        edx, dword ptr [rbx + 0x78]
01966 83c202                         add        edx, 2
01969 895378                         mov        dword ptr [rbx + 0x78], edx
0196c 81e2feff1f00                   and        edx, 0x1ffffe
01972 85d2                           test       edx, edx
01974 0f842a310000                   je         0x7ff8d014ed24
0197a 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01982 48bb00e914c4f87f0000           movabs     rbx, 0x7ff8c414e900
0198c 4883831001000001               add        qword ptr [rbx + 0x110], 1
01994 ffc8                           dec        eax
01996 2bf0                           sub        esi, eax
01998 48bb90df14c4f87f0000           movabs     rbx, 0x7ff8c414df90
019a2 8b4378                         mov        eax, dword ptr [rbx + 0x78]
019a5 83c002                         add        eax, 2
019a8 894378                         mov        dword ptr [rbx + 0x78], eax
019ab 25feff1f00                     and        eax, 0x1ffffe
019b0 85c0                           test       eax, eax
019b2 0f840d310000                   je         0x7ff8d014ed45
019b8 48bb90df14c4f87f0000           movabs     rbx, 0x7ff8c414df90
019c2 488383b000000001               add        qword ptr [rbx + 0xb0], 1
019ca 48bb0000000000000000           movabs     rbx, 0
019d4 bb00000000                     mov        ebx, 0
019d9 443bdb                         cmp        r11d, ebx
019dc 0f8c04310000                   jl         0x7ff8d014ed66
019e2 443bde                         cmp        r11d, esi
019e5 0f8d1c310000                   jge        0x7ff8d014ed87
019eb 498bdb                         mov        rbx, r11
019ee 899c24c4010000                 mov        dword ptr [rsp + 0x1c4], ebx
019f5 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
019fd 488bbc24c8010000               mov        rdi, qword ptr [rsp + 0x1c8]
01a05 488bf7                         mov        rsi, rdi
01a08 48ba000015c4f87f0000           movabs     rdx, 0x7ff8c4150000
01a12 8b36                           mov        esi, dword ptr [rsi]
01a14 c1ee0d                         shr        esi, 0xd
01a17 48c1e60a                       shl        rsi, 0xa
01a1b 41ba00000035                   mov        r10d, 0x35000000
01a21 4903f2                         add        rsi, r10
01a24 41ba1f000000                   mov        r10d, 0x1f
01a2a 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01a2e 7436                           je         0x7ff8d014bce6
01a30 4983c202                       add        r10, 2
01a34 4983fa23                       cmp        r10, 0x23
01a38 75f0                           jne        0x7ff8d014bcaa
01a3a 41ba1f000000                   mov        r10d, 0x1f
01a40 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01a45 7412                           je         0x7ff8d014bcd9
01a47 4983c202                       add        r10, 2
01a4b 4983fa23                       cmp        r10, 0x23
01a4f 75ef                           jne        0x7ff8d014bcc0
01a51 41ba1e000000                   mov        r10d, 0x1e
01a57 eb11                           jmp        0x7ff8d014bcea
01a59 50                             push       rax
01a5a 4833c0                         xor        rax, rax
01a5d f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01a63 58                             pop        rax
01a64 ebbe                           jmp        0x7ff8d014bca4
01a66 4983c201                       add        r10, 1
01a6a 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01a6f 488bf7                         mov        rsi, rdi
01a72 90                             nop        
01a73 90                             nop        
01a74 90                             nop        
01a75 48b828e85fa4f87f0000           movabs     rax, 0x7ff8a45fe828
01a7f e85c3a5e07                     call       0x7ff8d772f760
01a84 0f1f84007c1b0008               nop        dword ptr [rax + rax + 0x8001b7c]
01a8c 483b00                         cmp        rax, qword ptr [rax]
01a8f 488bf0                         mov        rsi, rax
01a92 48ba000015c4f87f0000           movabs     rdx, 0x7ff8c4150000
01a9c 8b36                           mov        esi, dword ptr [rsi]
01a9e c1ee0d                         shr        esi, 0xd
01aa1 48c1e60a                       shl        rsi, 0xa
01aa5 41ba00000035                   mov        r10d, 0x35000000
01aab 4903f2                         add        rsi, r10
01aae 41ba25000000                   mov        r10d, 0x25
01ab4 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01ab8 7436                           je         0x7ff8d014bd70
01aba 4983c202                       add        r10, 2
01abe 4983fa29                       cmp        r10, 0x29
01ac2 75f0                           jne        0x7ff8d014bd34
01ac4 41ba25000000                   mov        r10d, 0x25
01aca 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01acf 7412                           je         0x7ff8d014bd63
01ad1 4983c202                       add        r10, 2
01ad5 4983fa29                       cmp        r10, 0x29
01ad9 75ef                           jne        0x7ff8d014bd4a
01adb 41ba24000000                   mov        r10d, 0x24
01ae1 eb11                           jmp        0x7ff8d014bd74
01ae3 50                             push       rax
01ae4 4833c0                         xor        rax, rax
01ae7 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01aed 58                             pop        rax
01aee ebbe                           jmp        0x7ff8d014bd2e
01af0 4983c201                       add        r10, 1
01af4 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01af9 8b7024                         mov        esi, dword ptr [rax + 0x24]
01afc 4c3b259526851f                 cmp        r12, qword ptr [rip + 0x1f852695]
01b03 0f8414000000                   je         0x7ff8d014bd9d
01b09 48bf3803a7edf87f0000           movabs     rdi, 0x7ff8eda70338
01b13 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b17 e8440ec21e                     call       0x7ff8eed6cbe0
01b1c f4                             hlt        
01b1d 488bd0                         mov        rdx, rax
01b20 48b9000015c4f87f0000           movabs     rcx, 0x7ff8c4150000
01b2a 8b12                           mov        edx, dword ptr [rdx]
01b2c c1ea0d                         shr        edx, 0xd
01b2f 48c1e20a                       shl        rdx, 0xa
01b33 41ba00000035                   mov        r10d, 0x35000000
01b39 4903d2                         add        rdx, r10
01b3c 41ba2b000000                   mov        r10d, 0x2b
01b42 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01b46 7436                           je         0x7ff8d014bdfe
01b48 4983c202                       add        r10, 2
01b4c 4983fa2f                       cmp        r10, 0x2f
01b50 75f0                           jne        0x7ff8d014bdc2
01b52 41ba2b000000                   mov        r10d, 0x2b
01b58 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01b5d 7412                           je         0x7ff8d014bdf1
01b5f 4983c202                       add        r10, 2
01b63 4983fa2f                       cmp        r10, 0x2f
01b67 75ef                           jne        0x7ff8d014bdd8
01b69 41ba2a000000                   mov        r10d, 0x2a
01b6f eb11                           jmp        0x7ff8d014be02
01b71 50                             push       rax
01b72 4833c0                         xor        rax, rax
01b75 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
01b7b 58                             pop        rax
01b7c ebbe                           jmp        0x7ff8d014bdbc
01b7e 4983c201                       add        r10, 1
01b82 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01b87 8b4804                         mov        ecx, dword ptr [rax + 4]
01b8a 48ba000015c4f87f0000           movabs     rdx, 0x7ff8c4150000
01b94 4883828001000001               add        qword ptr [rdx + 0x180], 1
01b9c 48ba48eb14c4f87f0000           movabs     rdx, 0x7ff8c414eb48
01ba6 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01baa 4183c002                       add        r8d, 2
01bae 44894278                       mov        dword ptr [rdx + 0x78], r8d
01bb2 4181e0feff1f00                 and        r8d, 0x1ffffe
01bb9 4585c0                         test       r8d, r8d
01bbc 0f847f2f0000                   je         0x7ff8d014edc1
01bc2 48ba000015c4f87f0000           movabs     rdx, 0x7ff8c4150000
01bcc 4883829001000001               add        qword ptr [rdx + 0x190], 1
01bd4 8b9c24c4010000                 mov        ebx, dword ptr [rsp + 0x1c4]
01bdb 4863db                         movsxd     rbx, ebx
01bde ba08000000                     mov        edx, 8
01be3 4c8bcb                         mov        r9, rbx
01be6 4c03ca                         add        r9, rdx
01be9 48bad0dc14c4f87f0000           movabs     rdx, 0x7ff8c414dcd0
01bf3 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01bf7 4183c002                       add        r8d, 2
01bfb 44894278                       mov        dword ptr [rdx + 0x78], r8d
01bff 4181e0feff1f00                 and        r8d, 0x1ffffe
01c06 4585c0                         test       r8d, r8d
01c09 0f84532f0000                   je         0x7ff8d014ede2
01c0f 48bad0dc14c4f87f0000           movabs     rdx, 0x7ff8c414dcd0
01c19 488382e000000001               add        qword ptr [rdx + 0xe0], 1
01c21 48ba50de14c4f87f0000           movabs     rdx, 0x7ff8c414de50
01c2b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01c2f 4183c002                       add        r8d, 2
01c33 44894278                       mov        dword ptr [rdx + 0x78], r8d
01c37 4181e0feff1f00                 and        r8d, 0x1ffffe
01c3e 4585c0                         test       r8d, r8d
01c41 0f843c2f0000                   je         0x7ff8d014ee03
01c47 48ba000015c4f87f0000           movabs     rdx, 0x7ff8c4150000
01c51 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
01c59 48bac87b7ae200000000           movabs     rdx, 0xe27a7bc8
01c63 ba02000000                     mov        edx, 2
01c68 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
01c70 bf00000000                     mov        edi, 0
01c75 488b8424c8010000               mov        rax, qword ptr [rsp + 0x1c8]
01c7d 48890424                       mov        qword ptr [rsp], rax
01c81 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
01c89 4889442408                     mov        qword ptr [rsp + 8], rax
01c8e 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01c93 49bac87b7ae200000000           movabs     r10, 0xe27a7bc8
01c9d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ca2 90                             nop        
01ca3 90                             nop        
01ca4 90                             nop        
01ca5 90                             nop        
01ca6 90                             nop        
01ca7 e8343d5e07                     call       0x7ff8d772fc60
01cac 0f1f8400a41d0009               nop        dword ptr [rax + rax + 0x9001da4]
01cb4 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01cbc 4183c310                       add        r11d, 0x10
01cc0 8bb424c0010000                 mov        esi, dword ptr [rsp + 0x1c0]
01cc7 83c610                         add        esi, 0x10
01cca 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01cd2 ba02000000                     mov        edx, 2
01cd7 7c05                           jl         0x7ff8d014bf5e
01cd9 ba00000000                     mov        edx, 0
01cde 48b900c043c4f87f0000           movabs     rcx, 0x7ff8c443c000
01ce8 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
01cec 4403c2                         add        r8d, edx
01cef 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
01cf3 85d2                           test       edx, edx
01cf5 7506                           jne        0x7ff8d014bf7d
01cf7 41b802000000                   mov        r8d, 2
01cfd 4181e0fe3f0000                 and        r8d, 0x3ffe
01d04 4585c0                         test       r8d, r8d
01d07 0f84972e0000                   je         0x7ff8d014ee24
01d0d 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01d11 418502                         test       dword ptr [r10], eax
01d14 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01d1c 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
01d26 b948050000                     mov        ecx, 0x548
01d2b 7c05                           jl         0x7ff8d014bfb2
01d2d b958050000                     mov        ecx, 0x558
01d32 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01d36 4d8d4001                       lea        r8, [r8 + 1]
01d3a 4c89040a                       mov        qword ptr [rdx + rcx], r8
01d3e 0f8c0cf5ffff                   jl         0x7ff8d014b4d0
01d44 48be00c043c4f87f0000           movabs     rsi, 0x7ff8c443c000
01d4e ff8668050000                   inc        dword ptr [rsi + 0x568]
01d54 e9f0000000                     jmp        0x7ff8d014c0c9
01d59 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
01d63 4883828005000001               add        qword ptr [rdx + 0x580], 1
01d6b 488bb42468010000               mov        rsi, qword ptr [rsp + 0x168]
01d73 8b942490010000                 mov        edx, dword ptr [rsp + 0x190]
01d7a 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
01d82 448b842474010000               mov        r8d, dword ptr [rsp + 0x174]
01d8a 4c8bcf                         mov        r9, rdi
01d8d 4885c9                         test       rcx, rcx
01d90 0f842f2e0000                   je         0x7ff8d014ee45
01d96 85d2                           test       edx, edx
01d98 0f8c272e0000                   jl         0x7ff8d014ee45
01d9e 4585c0                         test       r8d, r8d
01da1 0f8c1e2e0000                   jl         0x7ff8d014ee45
01da7 4a8d3c0a                       lea        rdi, [rdx + r9]
01dab 3b7e04                         cmp        edi, dword ptr [rsi + 4]
01dae 0f87112e0000                   ja         0x7ff8d014ee45
01db4 4b8d3c08                       lea        rdi, [r8 + r9]
01db8 3b7904                         cmp        edi, dword ptr [rcx + 4]
01dbb 0f87042e0000                   ja         0x7ff8d014ee45
01dc1 4585c9                         test       r9d, r9d
01dc4 0f8cfb2d0000                   jl         0x7ff8d014ee45
01dca 4863d2                         movsxd     rdx, edx
01dcd 4d63c0                         movsxd     r8, r8d
01dd0 48bf00e41b3500000000           movabs     rdi, 0x351be400
01dda 41ba00000035                   mov        r10d, 0x35000000
01de0 492bfa                         sub        rdi, r10
01de3 48c1ef0a                       shr        rdi, 0xa
01de7 448b19                         mov        r11d, dword ptr [rcx]
01dea 41c1eb0d                       shr        r11d, 0xd
01dee 413bfb                         cmp        edi, r11d
01df1 0f8510000000                   jne        0x7ff8d014c087
01df7 448b1e                         mov        r11d, dword ptr [rsi]
01dfa 41c1eb0d                       shr        r11d, 0xd
01dfe 413bfb                         cmp        edi, r11d
01e01 0f8414000000                   je         0x7ff8d014c09b
01e07 48bf8875a0edf87f0000           movabs     rdi, 0x7ff8eda07588
01e11 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e15 e8460bc21e                     call       0x7ff8eed6cbe0
01e1a f4                             hlt        
01e1b 488d7c1608                     lea        rdi, [rsi + rdx + 8]
01e20 4a8d740108                     lea        rsi, [rcx + r8 + 8]
01e25 498bd1                         mov        rdx, r9
01e28 40f6c40f                       test       spl, 0xf
01e2c 0f8412000000                   je         0x7ff8d014c0c4
01e32 4883ec08                       sub        rsp, 8
01e36 e885d05c07                     call       0x7ff8d7719140
01e3b 4883c408                       add        rsp, 8
01e3f e905000000                     jmp        0x7ff8d014c0c9
01e44 e877d05c07                     call       0x7ff8d7719140
01e49 8bb424a4010000                 mov        esi, dword ptr [rsp + 0x1a4]
01e50 8b9c24a0010000                 mov        ebx, dword ptr [rsp + 0x1a0]
01e57 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
01e5f 488bfb                         mov        rdi, rbx
01e62 2bbc24a8010000                 sub        edi, dword ptr [rsp + 0x1a8]
01e69 4183f810                       cmp        r8d, 0x10
01e6d 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
01e77 b990050000                     mov        ecx, 0x590
01e7c 7f05                           jg         0x7ff8d014c103
01e7e b9a0050000                     mov        ecx, 0x5a0
01e83 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
01e87 4d8d4901                       lea        r9, [r9 + 1]
01e8b 4c890c0a                       mov        qword ptr [rdx + rcx], r9
01e8f 448b8c24a8010000               mov        r9d, dword ptr [rsp + 0x1a8]
01e97 0f8f2c000000                   jg         0x7ff8d014c149
01e9d 4183f910                       cmp        r9d, 0x10
01ea1 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
01eab b9c0050000                     mov        ecx, 0x5c0
01eb0 7d05                           jge        0x7ff8d014c137
01eb2 b9b0050000                     mov        ecx, 0x5b0
01eb7 488b040a                       mov        rax, qword ptr [rdx + rcx]
01ebb 488d4001                       lea        rax, [rax + 1]
01ebf 4889040a                       mov        qword ptr [rdx + rcx], rax
01ec3 0f8d23160000                   jge        0x7ff8d014d76c
01ec9 453bc8                         cmp        r9d, r8d
01ecc 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
01ed6 b928060000                     mov        ecx, 0x628
01edb 7c05                           jl         0x7ff8d014c162
01edd b938060000                     mov        ecx, 0x638
01ee2 488b040a                       mov        rax, qword ptr [rdx + rcx]
01ee6 488d4001                       lea        rax, [rax + 1]
01eea 4889040a                       mov        qword ptr [rdx + rcx], rax
01eee 0f8cd9050000                   jl         0x7ff8d014c74d
01ef4 4183f830                       cmp        r8d, 0x30
01ef8 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
01f02 b948060000                     mov        ecx, 0x648
01f07 7e05                           jle        0x7ff8d014c18e
01f09 b958060000                     mov        ecx, 0x658
01f0e 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
01f12 4d8d4901                       lea        r9, [r9 + 1]
01f16 4c890c0a                       mov        qword ptr [rdx + rcx], r9
01f1a 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
01f21 0f8e0f010000                   jle        0x7ff8d014c2b6
01f27 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
01f31 4883826806000001               add        qword ptr [rdx + 0x668], 1
01f39 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
01f41 488bd7                         mov        rdx, rdi
01f44 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
01f4c 498bf8                         mov        rdi, r8
01f4f 4c8bc3                         mov        r8, rbx
01f52 4c8bcf                         mov        r9, rdi
01f55 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
01f5c 4885f6                         test       rsi, rsi
01f5f 0f846c2c0000                   je         0x7ff8d014ee51
01f65 4885c9                         test       rcx, rcx
01f68 0f84632c0000                   je         0x7ff8d014ee51
01f6e 85d2                           test       edx, edx
01f70 0f8c5b2c0000                   jl         0x7ff8d014ee51
01f76 4585c0                         test       r8d, r8d
01f79 0f8c522c0000                   jl         0x7ff8d014ee51
01f7f 4a8d3c0a                       lea        rdi, [rdx + r9]
01f83 3b7e04                         cmp        edi, dword ptr [rsi + 4]
01f86 0f87452c0000                   ja         0x7ff8d014ee51
01f8c 4b8d3c08                       lea        rdi, [r8 + r9]
01f90 3b7904                         cmp        edi, dword ptr [rcx + 4]
01f93 0f87382c0000                   ja         0x7ff8d014ee51
01f99 4585c9                         test       r9d, r9d
01f9c 0f8c2f2c0000                   jl         0x7ff8d014ee51
01fa2 4863d2                         movsxd     rdx, edx
01fa5 4d63c0                         movsxd     r8, r8d
01fa8 48bf00e41b3500000000           movabs     rdi, 0x351be400
01fb2 41ba00000035                   mov        r10d, 0x35000000
01fb8 492bfa                         sub        rdi, r10
01fbb 48c1ef0a                       shr        rdi, 0xa
01fbf 448b19                         mov        r11d, dword ptr [rcx]
01fc2 41c1eb0d                       shr        r11d, 0xd
01fc6 413bfb                         cmp        edi, r11d
01fc9 0f8510000000                   jne        0x7ff8d014c25f
01fcf 448b1e                         mov        r11d, dword ptr [rsi]
01fd2 41c1eb0d                       shr        r11d, 0xd
01fd6 413bfb                         cmp        edi, r11d
01fd9 0f8414000000                   je         0x7ff8d014c273
01fdf 48bf8875a0edf87f0000           movabs     rdi, 0x7ff8eda07588
01fe9 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fed e86e09c21e                     call       0x7ff8eed6cbe0
01ff2 f4                             hlt        
01ff3 488d7c1608                     lea        rdi, [rsi + rdx + 8]
01ff8 4a8d740108                     lea        rsi, [rcx + r8 + 8]
01ffd 498bd1                         mov        rdx, r9
02000 40f6c40f                       test       spl, 0xf
02004 0f8412000000                   je         0x7ff8d014c29c
0200a 4883ec08                       sub        rsp, 8
0200e e8adce5c07                     call       0x7ff8d7719140
02013 4883c408                       add        rsp, 8
02017 e905000000                     jmp        0x7ff8d014c2a1
0201c e89fce5c07                     call       0x7ff8d7719140
02021 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
0202b ff8278060000                   inc        dword ptr [rdx + 0x678]
02031 e974040000                     jmp        0x7ff8d014c72a
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
0206f 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
02079 4883829006000001               add        qword ptr [rdx + 0x690], 1
02081 48ba206a043600000000           movabs     rdx, 0x36046a20
0208b 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0208e 83c102                         add        ecx, 2
02091 894a78                         mov        dword ptr [rdx + 0x78], ecx
02094 81e1feff1f00                   and        ecx, 0x1ffffe
0209a 85c9                           test       ecx, ecx
0209c 0f843f2b0000                   je         0x7ff8d014ee61
020a2 48ba206a043600000000           movabs     rdx, 0x36046a20
020ac 488d92e0000000                 lea        rdx, [rdx + 0xe0]
020b3 4885c0                         test       rax, rax
020b6 7510                           jne        0x7ff8d014c348
020b8 f6420801                       test       byte ptr [rdx + 8], 1
020bc 0f8506000000                   jne        0x7ff8d014c348
020c2 f048834a0801                   lock or    qword ptr [rdx + 8], 1
020c8 48baa0d504c4f87f0000           movabs     rdx, 0x7ff8c404d5a0
020d2 488d9248030000                 lea        rdx, [rdx + 0x348]
020d9 4885c0                         test       rax, rax
020dc 7510                           jne        0x7ff8d014c36e
020de f6421001                       test       byte ptr [rdx + 0x10], 1
020e2 0f8506000000                   jne        0x7ff8d014c36e
020e8 f048834a1001                   lock or    qword ptr [rdx + 0x10], 1
020ee 48ba206a043600000000           movabs     rdx, 0x36046a20
020f8 488382b000000001               add        qword ptr [rdx + 0xb0], 1
02100 48baa0d504c4f87f0000           movabs     rdx, 0x7ff8c404d5a0
0210a 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0210d 83c102                         add        ecx, 2
02110 894a78                         mov        dword ptr [rdx + 0x78], ecx
02113 81e1feff1f00                   and        ecx, 0x1ffffe
02119 85c9                           test       ecx, ecx
0211b 0f84e12a0000                   je         0x7ff8d014ee82
02121 48bad86c71e200000000           movabs     rdx, 0xe2716cd8
0212b 48b9a0d504c4f87f0000           movabs     rcx, 0x7ff8c404d5a0
02135 8b12                           mov        edx, dword ptr [rdx]
02137 c1ea0d                         shr        edx, 0xd
0213a 48c1e20a                       shl        rdx, 0xa
0213e 41ba00000035                   mov        r10d, 0x35000000
02144 4903d2                         add        rdx, r10
02147 41ba17000000                   mov        r10d, 0x17
0214d 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02151 7436                           je         0x7ff8d014c409
02153 4983c202                       add        r10, 2
02157 4983fa1b                       cmp        r10, 0x1b
0215b 75f0                           jne        0x7ff8d014c3cd
0215d 41ba17000000                   mov        r10d, 0x17
02163 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02168 7412                           je         0x7ff8d014c3fc
0216a 4983c202                       add        r10, 2
0216e 4983fa1b                       cmp        r10, 0x1b
02172 75ef                           jne        0x7ff8d014c3e3
02174 41ba16000000                   mov        r10d, 0x16
0217a eb11                           jmp        0x7ff8d014c40d
0217c 50                             push       rax
0217d 4833c0                         xor        rax, rax
02180 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02186 58                             pop        rax
02187 ebbe                           jmp        0x7ff8d014c3c7
02189 4983c201                       add        r10, 1
0218d 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02192 48ba70cd04c4f87f0000           movabs     rdx, 0x7ff8c404cd70
0219c 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0219f 83c102                         add        ecx, 2
021a2 894a78                         mov        dword ptr [rdx + 0x78], ecx
021a5 81e1feff1f00                   and        ecx, 0x1ffffe
021ab 85c9                           test       ecx, ecx
021ad 0f84702a0000                   je         0x7ff8d014eea3
021b3 48ba70cd04c4f87f0000           movabs     rdx, 0x7ff8c404cd70
021bd ff82b0000000                   inc        dword ptr [rdx + 0xb0]
021c3 48baa0d504c4f87f0000           movabs     rdx, 0x7ff8c404d5a0
021cd ff8208010000                   inc        dword ptr [rdx + 0x108]
021d3 48baa0d504c4f87f0000           movabs     rdx, 0x7ff8c404d5a0
021dd ff8228010000                   inc        dword ptr [rdx + 0x128]
021e3 48ba906571e200000000           movabs     rdx, 0xe2716590
021ed 48b9a0d504c4f87f0000           movabs     rcx, 0x7ff8c404d5a0
021f7 8b12                           mov        edx, dword ptr [rdx]
021f9 c1ea0d                         shr        edx, 0xd
021fc 48c1e20a                       shl        rdx, 0xa
02200 41ba00000035                   mov        r10d, 0x35000000
02206 4903d2                         add        rdx, r10
02209 41ba28000000                   mov        r10d, 0x28
0220f 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02213 7436                           je         0x7ff8d014c4cb
02215 4983c202                       add        r10, 2
02219 4983fa2c                       cmp        r10, 0x2c
0221d 75f0                           jne        0x7ff8d014c48f
0221f 41ba28000000                   mov        r10d, 0x28
02225 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0222a 7412                           je         0x7ff8d014c4be
0222c 4983c202                       add        r10, 2
02230 4983fa2c                       cmp        r10, 0x2c
02234 75ef                           jne        0x7ff8d014c4a5
02236 41ba27000000                   mov        r10d, 0x27
0223c eb11                           jmp        0x7ff8d014c4cf
0223e 50                             push       rax
0223f 4833c0                         xor        rax, rax
02242 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02248 58                             pop        rax
02249 ebbe                           jmp        0x7ff8d014c489
0224b 4983c201                       add        r10, 1
0224f 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02254 48ba20d304c4f87f0000           movabs     rdx, 0x7ff8c404d320
0225e 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02261 83c102                         add        ecx, 2
02264 894a78                         mov        dword ptr [rdx + 0x78], ecx
02267 81e1feff1f00                   and        ecx, 0x1ffffe
0226d 85c9                           test       ecx, ecx
0226f 0f84cf290000                   je         0x7ff8d014eec4
02275 48ba20d304c4f87f0000           movabs     rdx, 0x7ff8c404d320
0227f ff82b0000000                   inc        dword ptr [rdx + 0xb0]
02285 48baa0d504c4f87f0000           movabs     rdx, 0x7ff8c404d5a0
0228f 488d9288010000                 lea        rdx, [rdx + 0x188]
02296 4885c0                         test       rax, rax
02299 7510                           jne        0x7ff8d014c52b
0229b f6421801                       test       byte ptr [rdx + 0x18], 1
0229f 0f8506000000                   jne        0x7ff8d014c52b
022a5 f048834a1801                   lock or    qword ptr [rdx + 0x18], 1
022ab 48baa0d504c4f87f0000           movabs     rdx, 0x7ff8c404d5a0
022b5 4883827801000001               add        qword ptr [rdx + 0x178], 1
022bd 48ba00d904c4f87f0000           movabs     rdx, 0x7ff8c404d900
022c7 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
022ca 83c102                         add        ecx, 2
022cd 894a78                         mov        dword ptr [rdx + 0x78], ecx
022d0 81e1feff1f00                   and        ecx, 0x1ffffe
022d6 85c9                           test       ecx, ecx
022d8 0f8487290000                   je         0x7ff8d014eee5
022de 48ba00d904c4f87f0000           movabs     rdx, 0x7ff8c404d900
022e8 4883821001000001               add        qword ptr [rdx + 0x110], 1
022f0 48bab8da04c4f87f0000           movabs     rdx, 0x7ff8c404dab8
022fa 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
022fd 83c102                         add        ecx, 2
02300 894a78                         mov        dword ptr [rdx + 0x78], ecx
02303 81e1feff1f00                   and        ecx, 0x1ffffe
02309 85c9                           test       ecx, ecx
0230b 0f8475290000                   je         0x7ff8d014ef06
02311 8b5004                         mov        edx, dword ptr [rax + 4]
02314 48b9b8da04c4f87f0000           movabs     rcx, 0x7ff8c404dab8
0231e 488381b000000001               add        qword ptr [rcx + 0xb0], 1
02326 83ea07                         sub        edx, 7
02329 48b9a01823e200000000           movabs     rcx, 0xe22318a0
02333 b900000000                     mov        ecx, 0
02338 3bf9                           cmp        edi, ecx
0233a 0f8c80290000                   jl         0x7ff8d014ef40
02340 3bfa                           cmp        edi, edx
02342 0f8d99290000                   jge        0x7ff8d014ef61
02348 488bd7                         mov        rdx, rdi
0234b 48be28c122e200000000           movabs     rsi, 0xe222c128
02355 488bce                         mov        rcx, rsi
02358 49b800d904c4f87f0000           movabs     r8, 0x7ff8c404d900
02362 8b09                           mov        ecx, dword ptr [rcx]
02364 c1e90d                         shr        ecx, 0xd
02367 48c1e10a                       shl        rcx, 0xa
0236b 41ba00000035                   mov        r10d, 0x35000000
02371 4903ca                         add        rcx, r10
02374 41ba25000000                   mov        r10d, 0x25
0237a 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0237e 7436                           je         0x7ff8d014c636
02380 4983c202                       add        r10, 2
02384 4983fa29                       cmp        r10, 0x29
02388 75f0                           jne        0x7ff8d014c5fa
0238a 41ba25000000                   mov        r10d, 0x25
02390 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
02395 7412                           je         0x7ff8d014c629
02397 4983c202                       add        r10, 2
0239b 4983fa29                       cmp        r10, 0x29
0239f 75ef                           jne        0x7ff8d014c610
023a1 41ba24000000                   mov        r10d, 0x24
023a7 eb11                           jmp        0x7ff8d014c63a
023a9 50                             push       rax
023aa 4833c0                         xor        rax, rax
023ad f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
023b3 58                             pop        rax
023b4 ebbe                           jmp        0x7ff8d014c5f4
023b6 4983c201                       add        r10, 1
023ba 4b8304d001                     add        qword ptr [r8 + r10*8], 1
023bf 4863d2                         movsxd     rdx, edx
023c2 488bca                         mov        rcx, rdx
023c5 41ba08000000                   mov        r10d, 8
023cb 4903ca                         add        rcx, r10
023ce 488bd0                         mov        rdx, rax
023d1 41b800000000                   mov        r8d, 0
023d7 89bc24dc010000                 mov        dword ptr [rsp + 0x1dc], edi
023de 90                             nop        
023df e8fc2b5e07                     call       0x7ff8d772f260
023e4 0f1f8400dc24000b               nop        dword ptr [rax + rax + 0xb0024dc]
023ec 48be00c043c4f87f0000           movabs     rsi, 0x7ff8c443c000
023f6 488386a006000001               add        qword ptr [rsi + 0x6a0], 1
023fe 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
02406 8b9424d8010000                 mov        edx, dword ptr [rsp + 0x1d8]
0240d 488bc8                         mov        rcx, rax
02410 90                             nop        
02411 90                             nop        
02412 90                             nop        
02413 90                             nop        
02414 90                             nop        
02415 90                             nop        
02416 90                             nop        
02417 e8c4355e07                     call       0x7ff8d772fc60
0241c 0f1f84001425000c               nop        dword ptr [rax + rax + 0xc002514]
02424 8b8424d8010000                 mov        eax, dword ptr [rsp + 0x1d8]
0242b 83c008                         add        eax, 8
0242e 8bbc24dc010000                 mov        edi, dword ptr [rsp + 0x1dc]
02435 83c708                         add        edi, 8
02438 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
0243f be02000000                     mov        esi, 2
02444 7c05                           jl         0x7ff8d014c6cb
02446 be00000000                     mov        esi, 0
0244b 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
02455 8b4a7c                         mov        ecx, dword ptr [rdx + 0x7c]
02458 03ce                           add        ecx, esi
0245a 894a7c                         mov        dword ptr [rdx + 0x7c], ecx
0245d 85f6                           test       esi, esi
0245f 7505                           jne        0x7ff8d014c6e6
02461 b902000000                     mov        ecx, 2
02466 81e1fe3f0000                   and        ecx, 0x3ffe
0246c 85c9                           test       ecx, ecx
0246e 0f848e280000                   je         0x7ff8d014ef82
02474 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02478 418502                         test       dword ptr [r10], eax
0247b 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
02482 48be00c043c4f87f0000           movabs     rsi, 0x7ff8c443c000
0248c bab0060000                     mov        edx, 0x6b0
02491 7c05                           jl         0x7ff8d014c718
02493 bac0060000                     mov        edx, 0x6c0
02498 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0249c 488d4901                       lea        rcx, [rcx + 1]
024a0 48890c16                       mov        qword ptr [rsi + rdx], rcx
024a4 0f8cb6fbffff                   jl         0x7ff8d014c2e0
024aa 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
024b1 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
024b8 48be00c043c4f87f0000           movabs     rsi, 0x7ff8c443c000
024c2 ff86d0060000                   inc        dword ptr [rsi + 0x6d0]
024c8 e9491a0000                     jmp        0x7ff8d014e196
024cd 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
024d4 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
024db 4183f910                       cmp        r9d, 0x10
024df 48be00c043c4f87f0000           movabs     rsi, 0x7ff8c443c000
024e9 bae8060000                     mov        edx, 0x6e8
024ee 7c05                           jl         0x7ff8d014c775
024f0 baf8060000                     mov        edx, 0x6f8
024f5 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
024f9 488d4901                       lea        rcx, [rcx + 1]
024fd 48890c16                       mov        qword ptr [rsi + rdx], rcx
02501 0f8ced0a0000                   jl         0x7ff8d014d274
02507 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
0250e 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
02515 899c24f0010000                 mov        dword ptr [rsp + 0x1f0], ebx
0251c 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
02523 90                             nop        
02524 90                             nop        
02525 90                             nop        
02526 90                             nop        
02527 90                             nop        
02528 898424ec010000                 mov        dword ptr [rsp + 0x1ec], eax
0252f 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
02537 48be00c043c4f87f0000           movabs     rsi, 0x7ff8c443c000
02541 4883860807000001               add        qword ptr [rsi + 0x708], 1
02549 48bef8f214c4f87f0000           movabs     rsi, 0x7ff8c414f2f8
02553 8b5678                         mov        edx, dword ptr [rsi + 0x78]
02556 83c202                         add        edx, 2
02559 895678                         mov        dword ptr [rsi + 0x78], edx
0255c 81e2feff1f00                   and        edx, 0x1ffffe
02562 85d2                           test       edx, edx
02564 0f84b9270000                   je         0x7ff8d014efa3
0256a 48be180579e200000000           movabs     rsi, 0xe2790518
02574 48baf8f214c4f87f0000           movabs     rdx, 0x7ff8c414f2f8
0257e 8b36                           mov        esi, dword ptr [rsi]
02580 c1ee0d                         shr        esi, 0xd
02583 48c1e60a                       shl        rsi, 0xa
02587 41ba00000035                   mov        r10d, 0x35000000
0258d 4903f2                         add        rsi, r10
02590 41ba17000000                   mov        r10d, 0x17
02596 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
0259a 7436                           je         0x7ff8d014c852
0259c 4983c202                       add        r10, 2
025a0 4983fa1b                       cmp        r10, 0x1b
025a4 75f0                           jne        0x7ff8d014c816
025a6 41ba17000000                   mov        r10d, 0x17
025ac 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
025b1 7412                           je         0x7ff8d014c845
025b3 4983c202                       add        r10, 2
025b7 4983fa1b                       cmp        r10, 0x1b
025bb 75ef                           jne        0x7ff8d014c82c
025bd 41ba16000000                   mov        r10d, 0x16
025c3 eb11                           jmp        0x7ff8d014c856
025c5 50                             push       rax
025c6 4833c0                         xor        rax, rax
025c9 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
025cf 58                             pop        rax
025d0 ebbe                           jmp        0x7ff8d014c810
025d2 4983c201                       add        r10, 1
025d6 4a8304d201                     add        qword ptr [rdx + r10*8], 1
025db 448b6804                       mov        r13d, dword ptr [rax + 4]
025df 48bef8f214c4f87f0000           movabs     rsi, 0x7ff8c414f2f8
025e9 488386e000000001               add        qword ptr [rsi + 0xe0], 1
025f1 48be00e914c4f87f0000           movabs     rsi, 0x7ff8c414e900
025fb 8b5678                         mov        edx, dword ptr [rsi + 0x78]
025fe 83c202                         add        edx, 2
02601 895678                         mov        dword ptr [rsi + 0x78], edx
02604 81e2feff1f00                   and        edx, 0x1ffffe
0260a 85d2                           test       edx, edx
0260c 0f844b270000                   je         0x7ff8d014efdd
02612 48be00e914c4f87f0000           movabs     rsi, 0x7ff8c414e900
0261c 4883861001000001               add        qword ptr [rsi + 0x110], 1
02624 498bf5                         mov        rsi, r13
02627 83ee0f                         sub        esi, 0xf
0262a 48ba90df14c4f87f0000           movabs     rdx, 0x7ff8c414df90
02634 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02637 83c102                         add        ecx, 2
0263a 894a78                         mov        dword ptr [rdx + 0x78], ecx
0263d 81e1feff1f00                   and        ecx, 0x1ffffe
02643 85c9                           test       ecx, ecx
02645 0f8433270000                   je         0x7ff8d014effe
0264b 48ba90df14c4f87f0000           movabs     rdx, 0x7ff8c414df90
02655 488382b000000001               add        qword ptr [rdx + 0xb0], 1
0265d 48ba0000000000000000           movabs     rdx, 0
02667 ba00000000                     mov        edx, 0
0266c 3bfa                           cmp        edi, edx
0266e 0f8c2b270000                   jl         0x7ff8d014f01f
02674 3bfe                           cmp        edi, esi
02676 0f8d44270000                   jge        0x7ff8d014f040
0267c 488bf7                         mov        rsi, rdi
0267f 48ba180579e200000000           movabs     rdx, 0xe2790518
02689 488bca                         mov        rcx, rdx
0268c 49b8f8f214c4f87f0000           movabs     r8, 0x7ff8c414f2f8
02696 8b09                           mov        ecx, dword ptr [rcx]
02698 c1e90d                         shr        ecx, 0xd
0269b 48c1e10a                       shl        rcx, 0xa
0269f 41ba00000035                   mov        r10d, 0x35000000
026a5 4903ca                         add        rcx, r10
026a8 41ba25000000                   mov        r10d, 0x25
026ae 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
026b2 7436                           je         0x7ff8d014c96a
026b4 4983c202                       add        r10, 2
026b8 4983fa29                       cmp        r10, 0x29
026bc 75f0                           jne        0x7ff8d014c92e
026be 41ba25000000                   mov        r10d, 0x25
026c4 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
026c9 7412                           je         0x7ff8d014c95d
026cb 4983c202                       add        r10, 2
026cf 4983fa29                       cmp        r10, 0x29
026d3 75ef                           jne        0x7ff8d014c944
026d5 41ba24000000                   mov        r10d, 0x24
026db eb11                           jmp        0x7ff8d014c96e
026dd 50                             push       rax
026de 4833c0                         xor        rax, rax
026e1 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
026e7 58                             pop        rax
026e8 ebbe                           jmp        0x7ff8d014c928
026ea 4983c201                       add        r10, 1
026ee 4b8304d001                     add        qword ptr [r8 + r10*8], 1
026f3 48b998e014c4f87f0000           movabs     rcx, 0x7ff8c414e098
026fd 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
02701 4183c002                       add        r8d, 2
02705 44894178                       mov        dword ptr [rcx + 0x78], r8d
02709 4181e0feff1f00                 and        r8d, 0x1ffffe
02710 4585c0                         test       r8d, r8d
02713 0f84c8260000                   je         0x7ff8d014f061
02719 48b998e014c4f87f0000           movabs     rcx, 0x7ff8c414e098
02723 488381b000000001               add        qword ptr [rcx + 0xb0], 1
0272b 48bac8e114c4f87f0000           movabs     rdx, 0x7ff8c414e1c8
02735 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02738 83c102                         add        ecx, 2
0273b 894a78                         mov        dword ptr [rdx + 0x78], ecx
0273e 81e1feff1f00                   and        ecx, 0x1ffffe
02744 85c9                           test       ecx, ecx
02746 0f84b6260000                   je         0x7ff8d014f082
0274c 48bac8e114c4f87f0000           movabs     rdx, 0x7ff8c414e1c8
02756 ff82c0000000                   inc        dword ptr [rdx + 0xc0]
0275c 4489ac24e8010000               mov        dword ptr [rsp + 0x1e8], r13d
02764 89bc24e4010000                 mov        dword ptr [rsp + 0x1e4], edi
0276b 48ba108579e200000000           movabs     rdx, 0xe2798510
02775 488bca                         mov        rcx, rdx
02778 49b8f8f214c4f87f0000           movabs     r8, 0x7ff8c414f2f8
02782 4983806001000001               add        qword ptr [r8 + 0x160], 1
0278a 48b9c8f414c4f87f0000           movabs     rcx, 0x7ff8c414f4c8
02794 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
02798 4183c002                       add        r8d, 2
0279c 44894178                       mov        dword ptr [rcx + 0x78], r8d
027a0 4181e0feff1f00                 and        r8d, 0x1ffffe
027a7 4585c0                         test       r8d, r8d
027aa 0f8473260000                   je         0x7ff8d014f0a3
027b0 488bca                         mov        rcx, rdx
027b3 49b8c8f414c4f87f0000           movabs     r8, 0x7ff8c414f4c8
027bd 498380b000000001               add        qword ptr [r8 + 0xb0], 1
027c5 48b9b0f514c4f87f0000           movabs     rcx, 0x7ff8c414f5b0
027cf 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
027d3 4183c002                       add        r8d, 2
027d7 44894178                       mov        dword ptr [rcx + 0x78], r8d
027db 4181e0feff1f00                 and        r8d, 0x1ffffe
027e2 4585c0                         test       r8d, r8d
027e5 0f8459260000                   je         0x7ff8d014f0c4
027eb 48b9b0f514c4f87f0000           movabs     rcx, 0x7ff8c414f5b0
027f5 488381c000000001               add        qword ptr [rcx + 0xc0], 1
027fd 48ba80ea14c4f87f0000           movabs     rdx, 0x7ff8c414ea80
02807 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0280a 83c102                         add        ecx, 2
0280d 894a78                         mov        dword ptr [rdx + 0x78], ecx
02810 81e1feff1f00                   and        ecx, 0x1ffffe
02816 85c9                           test       ecx, ecx
02818 0f8447260000                   je         0x7ff8d014f0e5
0281e 48ba180579e200000000           movabs     rdx, 0xe2790518
02828 488bca                         mov        rcx, rdx
0282b 49b8b0f514c4f87f0000           movabs     r8, 0x7ff8c414f5b0
02835 8b09                           mov        ecx, dword ptr [rcx]
02837 c1e90d                         shr        ecx, 0xd
0283a 48c1e10a                       shl        rcx, 0xa
0283e 41ba00000035                   mov        r10d, 0x35000000
02844 4903ca                         add        rcx, r10
02847 41ba1d000000                   mov        r10d, 0x1d
0284d 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
02851 7436                           je         0x7ff8d014cb09
02853 4983c202                       add        r10, 2
02857 4983fa21                       cmp        r10, 0x21
0285b 75f0                           jne        0x7ff8d014cacd
0285d 41ba1d000000                   mov        r10d, 0x1d
02863 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
02868 7412                           je         0x7ff8d014cafc
0286a 4983c202                       add        r10, 2
0286e 4983fa21                       cmp        r10, 0x21
02872 75ef                           jne        0x7ff8d014cae3
02874 41ba1c000000                   mov        r10d, 0x1c
0287a eb11                           jmp        0x7ff8d014cb0d
0287c 50                             push       rax
0287d 4833c0                         xor        rax, rax
02880 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
02886 58                             pop        rax
02887 ebbe                           jmp        0x7ff8d014cac7
02889 4983c201                       add        r10, 1
0288d 4b8304d001                     add        qword ptr [r8 + r10*8], 1
02892 48b9b0f514c4f87f0000           movabs     rcx, 0x7ff8c414f5b0
0289c 8b12                           mov        edx, dword ptr [rdx]
0289e c1ea0d                         shr        edx, 0xd
028a1 48c1e20a                       shl        rdx, 0xa
028a5 41ba00000035                   mov        r10d, 0x35000000
028ab 4903d2                         add        rdx, r10
028ae 41ba23000000                   mov        r10d, 0x23
028b4 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
028b8 7436                           je         0x7ff8d014cb70
028ba 4983c202                       add        r10, 2
028be 4983fa27                       cmp        r10, 0x27
028c2 75f0                           jne        0x7ff8d014cb34
028c4 41ba23000000                   mov        r10d, 0x23
028ca 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
028cf 7412                           je         0x7ff8d014cb63
028d1 4983c202                       add        r10, 2
028d5 4983fa27                       cmp        r10, 0x27
028d9 75ef                           jne        0x7ff8d014cb4a
028db 41ba22000000                   mov        r10d, 0x22
028e1 eb11                           jmp        0x7ff8d014cb74
028e3 50                             push       rax
028e4 4833c0                         xor        rax, rax
028e7 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
028ed 58                             pop        rax
028ee ebbe                           jmp        0x7ff8d014cb2e
028f0 4983c201                       add        r10, 1
028f4 4a8304d101                     add        qword ptr [rcx + r10*8], 1
028f9 48bab0f514c4f87f0000           movabs     rdx, 0x7ff8c414f5b0
02903 4883824001000001               add        qword ptr [rdx + 0x140], 1
0290b 48ba48eb14c4f87f0000           movabs     rdx, 0x7ff8c414eb48
02915 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02918 83c102                         add        ecx, 2
0291b 894a78                         mov        dword ptr [rdx + 0x78], ecx
0291e 81e1feff1f00                   and        ecx, 0x1ffffe
02924 85c9                           test       ecx, ecx
02926 0f845a250000                   je         0x7ff8d014f106
0292c 48bab0f514c4f87f0000           movabs     rdx, 0x7ff8c414f5b0
02936 4883825001000001               add        qword ptr [rdx + 0x150], 1
0293e 4c63f6                         movsxd     r14, esi
02941 be08000000                     mov        esi, 8
02946 4d8bce                         mov        r9, r14
02949 4c03ce                         add        r9, rsi
0294c 48bed0dc14c4f87f0000           movabs     rsi, 0x7ff8c414dcd0
02956 8b5678                         mov        edx, dword ptr [rsi + 0x78]
02959 83c202                         add        edx, 2
0295c 895678                         mov        dword ptr [rsi + 0x78], edx
0295f 81e2feff1f00                   and        edx, 0x1ffffe
02965 85d2                           test       edx, edx
02967 0f843a250000                   je         0x7ff8d014f127
0296d 48bed0dc14c4f87f0000           movabs     rsi, 0x7ff8c414dcd0
02977 488386e000000001               add        qword ptr [rsi + 0xe0], 1
0297f 48be50de14c4f87f0000           movabs     rsi, 0x7ff8c414de50
02989 8b5678                         mov        edx, dword ptr [rsi + 0x78]
0298c 83c202                         add        edx, 2
0298f 895678                         mov        dword ptr [rsi + 0x78], edx
02992 81e2feff1f00                   and        edx, 0x1ffffe
02998 85d2                           test       edx, edx
0299a 0f8428250000                   je         0x7ff8d014f148
029a0 48beb0f514c4f87f0000           movabs     rsi, 0x7ff8c414f5b0
029aa 4883867001000001               add        qword ptr [rsi + 0x170], 1
029b2 48bee0dd79e200000000           movabs     rsi, 0xe279dde0
029bc 48be600579e200000000           movabs     rsi, 0xe2790560
029c6 ba02000000                     mov        edx, 2
029cb b910000000                     mov        ecx, 0x10
029d0 4c8bc0                         mov        r8, rax
029d3 bf00000000                     mov        edi, 0
029d8 48890424                       mov        qword ptr [rsp], rax
029dc 4c89742408                     mov        qword ptr [rsp + 8], r14
029e1 49ba180579e200000000           movabs     r10, 0xe2790518
029eb 4c89542410                     mov        qword ptr [rsp + 0x10], r10
029f0 49bae0dd79e200000000           movabs     r10, 0xe279dde0
029fa 4c89542418                     mov        qword ptr [rsp + 0x18], r10
029ff e8dc2f5e07                     call       0x7ff8d772fc60
02a04 0f1f8400fc2a000e               nop        dword ptr [rax + rax + 0xe002afc]
02a0c 4885c0                         test       rax, rax
02a0f 48bbb0f514c4f87f0000           movabs     rbx, 0x7ff8c414f5b0
02a19 750c                           jne        0x7ff8d014cca7
02a1b 808b7901000001                 or         byte ptr [rbx + 0x179], 1
02a22 e988000000                     jmp        0x7ff8d014cd2f
02a27 8b38                           mov        edi, dword ptr [rax]
02a29 c1ef0d                         shr        edi, 0xd
02a2c 48c1e70a                       shl        rdi, 0xa
02a30 41ba00000035                   mov        r10d, 0x35000000
02a36 4903fa                         add        rdi, r10
02a39 41ba31000000                   mov        r10d, 0x31
02a3f 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
02a43 7436                           je         0x7ff8d014ccfb
02a45 4983c202                       add        r10, 2
02a49 4983fa35                       cmp        r10, 0x35
02a4d 75f0                           jne        0x7ff8d014ccbf
02a4f 41ba31000000                   mov        r10d, 0x31
02a55 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02a5a 7412                           je         0x7ff8d014ccee
02a5c 4983c202                       add        r10, 2
02a60 4983fa35                       cmp        r10, 0x35
02a64 75ef                           jne        0x7ff8d014ccd5
02a66 41ba30000000                   mov        r10d, 0x30
02a6c eb11                           jmp        0x7ff8d014ccff
02a6e 50                             push       rax
02a6f 4833c0                         xor        rax, rax
02a72 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
02a78 58                             pop        rax
02a79 ebbe                           jmp        0x7ff8d014ccb9
02a7b 4983c201                       add        r10, 1
02a7f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02a84 48bf0084003600000000           movabs     rdi, 0x36008400
02a8e 8b18                           mov        ebx, dword ptr [rax]
02a90 c1eb0d                         shr        ebx, 0xd
02a93 48c1e30a                       shl        rbx, 0xa
02a97 41ba00000035                   mov        r10d, 0x35000000
02a9d 4903da                         add        rbx, r10
02aa0 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
02aa4 0f853f240000                   jne        0x7ff8d014f169
02aaa e900000000                     jmp        0x7ff8d014cd2f
02aaf 488bf8                         mov        rdi, rax
02ab2 4889bc24f8010000               mov        qword ptr [rsp + 0x1f8], rdi
02aba 483b07                         cmp        rax, qword ptr [rdi]
02abd 488bf7                         mov        rsi, rdi
02ac0 48bb00c043c4f87f0000           movabs     rbx, 0x7ff8c443c000
02aca 8b36                           mov        esi, dword ptr [rsi]
02acc c1ee0d                         shr        esi, 0xd
02acf 48c1e60a                       shl        rsi, 0xa
02ad3 41ba00000035                   mov        r10d, 0x35000000
02ad9 4903f2                         add        rsi, r10
02adc 41bae4000000                   mov        r10d, 0xe4
02ae2 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02ae6 743c                           je         0x7ff8d014cda4
02ae8 4983c202                       add        r10, 2
02aec 4981fae8000000                 cmp        r10, 0xe8
02af3 75ed                           jne        0x7ff8d014cd62
02af5 41bae4000000                   mov        r10d, 0xe4
02afb 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02b00 7415                           je         0x7ff8d014cd97
02b02 4983c202                       add        r10, 2
02b06 4981fae8000000                 cmp        r10, 0xe8
02b0d 75ec                           jne        0x7ff8d014cd7b
02b0f 41bae3000000                   mov        r10d, 0xe3
02b15 eb11                           jmp        0x7ff8d014cda8
02b17 50                             push       rax
02b18 4833c0                         xor        rax, rax
02b1b f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02b21 58                             pop        rax
02b22 ebb8                           jmp        0x7ff8d014cd5c
02b24 4983c201                       add        r10, 1
02b28 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02b2d 48be000015c4f87f0000           movabs     rsi, 0x7ff8c4150000
02b37 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
02b3a 83c302                         add        ebx, 2
02b3d 895e78                         mov        dword ptr [rsi + 0x78], ebx
02b40 81e3feff1f00                   and        ebx, 0x1ffffe
02b46 85db                           test       ebx, ebx
02b48 0f84d1230000                   je         0x7ff8d014f19f
02b4e 488bf7                         mov        rsi, rdi
02b51 48bb000015c4f87f0000           movabs     rbx, 0x7ff8c4150000
02b5b 8b36                           mov        esi, dword ptr [rsi]
02b5d c1ee0d                         shr        esi, 0xd
02b60 48c1e60a                       shl        rsi, 0xa
02b64 41ba00000035                   mov        r10d, 0x35000000
02b6a 4903f2                         add        rsi, r10
02b6d 41ba17000000                   mov        r10d, 0x17
02b73 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02b77 7436                           je         0x7ff8d014ce2f
02b79 4983c202                       add        r10, 2
02b7d 4983fa1b                       cmp        r10, 0x1b
02b81 75f0                           jne        0x7ff8d014cdf3
02b83 41ba17000000                   mov        r10d, 0x17
02b89 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02b8e 7412                           je         0x7ff8d014ce22
02b90 4983c202                       add        r10, 2
02b94 4983fa1b                       cmp        r10, 0x1b
02b98 75ef                           jne        0x7ff8d014ce09
02b9a 41ba16000000                   mov        r10d, 0x16
02ba0 eb11                           jmp        0x7ff8d014ce33
02ba2 50                             push       rax
02ba3 4833c0                         xor        rax, rax
02ba6 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02bac 58                             pop        rax
02bad ebbe                           jmp        0x7ff8d014cded
02baf 4983c201                       add        r10, 1
02bb3 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02bb8 488bf7                         mov        rsi, rdi
02bbb 90                             nop        
02bbc 90                             nop        
02bbd 48b850e85fa4f87f0000           movabs     rax, 0x7ff8a45fe850
02bc7 e814295e07                     call       0x7ff8d772f760
02bcc 0f1f8400c42c000f               nop        dword ptr [rax + rax + 0xf002cc4]
02bd4 48be000015c4f87f0000           movabs     rsi, 0x7ff8c4150000
02bde 488386e000000001               add        qword ptr [rsi + 0xe0], 1
02be6 48be00e914c4f87f0000           movabs     rsi, 0x7ff8c414e900
02bf0 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
02bf3 83c702                         add        edi, 2
02bf6 897e78                         mov        dword ptr [rsi + 0x78], edi
02bf9 81e7feff1f00                   and        edi, 0x1ffffe
02bff 85ff                           test       edi, edi
02c01 0f8439230000                   je         0x7ff8d014f1c0
02c07 448bac24e8010000               mov        r13d, dword ptr [rsp + 0x1e8]
02c0f 8bbc24ec010000                 mov        edi, dword ptr [rsp + 0x1ec]
02c16 48be00e914c4f87f0000           movabs     rsi, 0x7ff8c414e900
02c20 4883861001000001               add        qword ptr [rsi + 0x110], 1
02c28 ffc8                           dec        eax
02c2a 442be8                         sub        r13d, eax
02c2d 48be90df14c4f87f0000           movabs     rsi, 0x7ff8c414df90
02c37 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
02c3a 83c302                         add        ebx, 2
02c3d 895e78                         mov        dword ptr [rsi + 0x78], ebx
02c40 81e3feff1f00                   and        ebx, 0x1ffffe
02c46 85db                           test       ebx, ebx
02c48 0f8413230000                   je         0x7ff8d014f1e1
02c4e 48be90df14c4f87f0000           movabs     rsi, 0x7ff8c414df90
02c58 488386b000000001               add        qword ptr [rsi + 0xb0], 1
02c60 48be0000000000000000           movabs     rsi, 0
02c6a be00000000                     mov        esi, 0
02c6f 3bfe                           cmp        edi, esi
02c71 0f8c0b230000                   jl         0x7ff8d014f202
02c77 413bfd                         cmp        edi, r13d
02c7a 0f8d23230000                   jge        0x7ff8d014f223
02c80 488bc7                         mov        rax, rdi
02c83 898424f4010000                 mov        dword ptr [rsp + 0x1f4], eax
02c8a 89bc24ec010000                 mov        dword ptr [rsp + 0x1ec], edi
02c91 488bbc24f8010000               mov        rdi, qword ptr [rsp + 0x1f8]
02c99 488bf7                         mov        rsi, rdi
02c9c 48b9000015c4f87f0000           movabs     rcx, 0x7ff8c4150000
02ca6 8b36                           mov        esi, dword ptr [rsi]
02ca8 c1ee0d                         shr        esi, 0xd
02cab 48c1e60a                       shl        rsi, 0xa
02caf 41ba00000035                   mov        r10d, 0x35000000
02cb5 4903f2                         add        rsi, r10
02cb8 41ba1f000000                   mov        r10d, 0x1f
02cbe 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
02cc2 7436                           je         0x7ff8d014cf7a
02cc4 4983c202                       add        r10, 2
02cc8 4983fa23                       cmp        r10, 0x23
02ccc 75f0                           jne        0x7ff8d014cf3e
02cce 41ba1f000000                   mov        r10d, 0x1f
02cd4 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02cd9 7412                           je         0x7ff8d014cf6d
02cdb 4983c202                       add        r10, 2
02cdf 4983fa23                       cmp        r10, 0x23
02ce3 75ef                           jne        0x7ff8d014cf54
02ce5 41ba1e000000                   mov        r10d, 0x1e
02ceb eb11                           jmp        0x7ff8d014cf7e
02ced 50                             push       rax
02cee 4833c0                         xor        rax, rax
02cf1 f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
02cf7 58                             pop        rax
02cf8 ebbe                           jmp        0x7ff8d014cf38
02cfa 4983c201                       add        r10, 1
02cfe 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02d03 488bf7                         mov        rsi, rdi
02d06 90                             nop        
02d07 90                             nop        
02d08 90                             nop        
02d09 90                             nop        
02d0a 90                             nop        
02d0b 90                             nop        
02d0c 90                             nop        
02d0d 48b878e85fa4f87f0000           movabs     rax, 0x7ff8a45fe878
02d17 e8c4275e07                     call       0x7ff8d772f760
02d1c 0f1f8400142e0010               nop        dword ptr [rax + rax + 0x10002e14]
02d24 483b00                         cmp        rax, qword ptr [rax]
02d27 488bf0                         mov        rsi, rax
02d2a 48ba000015c4f87f0000           movabs     rdx, 0x7ff8c4150000
02d34 8b36                           mov        esi, dword ptr [rsi]
02d36 c1ee0d                         shr        esi, 0xd
02d39 48c1e60a                       shl        rsi, 0xa
02d3d 41ba00000035                   mov        r10d, 0x35000000
02d43 4903f2                         add        rsi, r10
02d46 41ba25000000                   mov        r10d, 0x25
02d4c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02d50 7436                           je         0x7ff8d014d008
02d52 4983c202                       add        r10, 2
02d56 4983fa29                       cmp        r10, 0x29
02d5a 75f0                           jne        0x7ff8d014cfcc
02d5c 41ba25000000                   mov        r10d, 0x25
02d62 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02d67 7412                           je         0x7ff8d014cffb
02d69 4983c202                       add        r10, 2
02d6d 4983fa29                       cmp        r10, 0x29
02d71 75ef                           jne        0x7ff8d014cfe2
02d73 41ba24000000                   mov        r10d, 0x24
02d79 eb11                           jmp        0x7ff8d014d00c
02d7b 50                             push       rax
02d7c 4833c0                         xor        rax, rax
02d7f f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
02d85 58                             pop        rax
02d86 ebbe                           jmp        0x7ff8d014cfc6
02d88 4983c201                       add        r10, 1
02d8c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02d91 8b7024                         mov        esi, dword ptr [rax + 0x24]
02d94 4c3b25fd13851f                 cmp        r12, qword ptr [rip + 0x1f8513fd]
02d9b 0f8414000000                   je         0x7ff8d014d035
02da1 48bf3803a7edf87f0000           movabs     rdi, 0x7ff8eda70338
02dab 4883e4f0                       and        rsp, 0xfffffffffffffff0
02daf e8acfbc11e                     call       0x7ff8eed6cbe0
02db4 f4                             hlt        
02db5 488bd0                         mov        rdx, rax
02db8 48b9000015c4f87f0000           movabs     rcx, 0x7ff8c4150000
02dc2 8b12                           mov        edx, dword ptr [rdx]
02dc4 c1ea0d                         shr        edx, 0xd
02dc7 48c1e20a                       shl        rdx, 0xa
02dcb 41ba00000035                   mov        r10d, 0x35000000
02dd1 4903d2                         add        rdx, r10
02dd4 41ba2b000000                   mov        r10d, 0x2b
02dda 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02dde 7436                           je         0x7ff8d014d096
02de0 4983c202                       add        r10, 2
02de4 4983fa2f                       cmp        r10, 0x2f
02de8 75f0                           jne        0x7ff8d014d05a
02dea 41ba2b000000                   mov        r10d, 0x2b
02df0 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02df5 7412                           je         0x7ff8d014d089
02df7 4983c202                       add        r10, 2
02dfb 4983fa2f                       cmp        r10, 0x2f
02dff 75ef                           jne        0x7ff8d014d070
02e01 41ba2a000000                   mov        r10d, 0x2a
02e07 eb11                           jmp        0x7ff8d014d09a
02e09 50                             push       rax
02e0a 4833c0                         xor        rax, rax
02e0d f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02e13 58                             pop        rax
02e14 ebbe                           jmp        0x7ff8d014d054
02e16 4983c201                       add        r10, 1
02e1a 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02e1f 8b4804                         mov        ecx, dword ptr [rax + 4]
02e22 48ba000015c4f87f0000           movabs     rdx, 0x7ff8c4150000
02e2c 4883828001000001               add        qword ptr [rdx + 0x180], 1
02e34 48ba48eb14c4f87f0000           movabs     rdx, 0x7ff8c414eb48
02e3e 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
02e42 4183c002                       add        r8d, 2
02e46 44894278                       mov        dword ptr [rdx + 0x78], r8d
02e4a 4181e0feff1f00                 and        r8d, 0x1ffffe
02e51 4585c0                         test       r8d, r8d
02e54 0f8483210000                   je         0x7ff8d014f25d
02e5a 48ba000015c4f87f0000           movabs     rdx, 0x7ff8c4150000
02e64 4883829001000001               add        qword ptr [rdx + 0x190], 1
02e6c 8b8424f4010000                 mov        eax, dword ptr [rsp + 0x1f4]
02e73 4863c0                         movsxd     rax, eax
02e76 ba08000000                     mov        edx, 8
02e7b 4c8bc8                         mov        r9, rax
02e7e 4c03ca                         add        r9, rdx
02e81 48bad0dc14c4f87f0000           movabs     rdx, 0x7ff8c414dcd0
02e8b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
02e8f 4183c002                       add        r8d, 2
02e93 44894278                       mov        dword ptr [rdx + 0x78], r8d
02e97 4181e0feff1f00                 and        r8d, 0x1ffffe
02e9e 4585c0                         test       r8d, r8d
02ea1 0f8457210000                   je         0x7ff8d014f27e
02ea7 48bad0dc14c4f87f0000           movabs     rdx, 0x7ff8c414dcd0
02eb1 488382e000000001               add        qword ptr [rdx + 0xe0], 1
02eb9 48ba50de14c4f87f0000           movabs     rdx, 0x7ff8c414de50
02ec3 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
02ec7 4183c002                       add        r8d, 2
02ecb 44894278                       mov        dword ptr [rdx + 0x78], r8d
02ecf 4181e0feff1f00                 and        r8d, 0x1ffffe
02ed6 4585c0                         test       r8d, r8d
02ed9 0f8440210000                   je         0x7ff8d014f29f
02edf 48ba000015c4f87f0000           movabs     rdx, 0x7ff8c4150000
02ee9 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
02ef1 48bac87b7ae200000000           movabs     rdx, 0xe27a7bc8
02efb ba02000000                     mov        edx, 2
02f00 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
02f08 bf00000000                     mov        edi, 0
02f0d 488b9c24f8010000               mov        rbx, qword ptr [rsp + 0x1f8]
02f15 48891c24                       mov        qword ptr [rsp], rbx
02f19 488b9c2438010000               mov        rbx, qword ptr [rsp + 0x138]
02f21 48895c2408                     mov        qword ptr [rsp + 8], rbx
02f26 4889442410                     mov        qword ptr [rsp + 0x10], rax
02f2b 49bac87b7ae200000000           movabs     r10, 0xe27a7bc8
02f35 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02f3a 90                             nop        
02f3b 90                             nop        
02f3c 90                             nop        
02f3d 90                             nop        
02f3e 90                             nop        
02f3f e89c2a5e07                     call       0x7ff8d772fc60
02f44 0f1f84003c300011               nop        dword ptr [rax + rax + 0x1100303c]
02f4c 8b8424ec010000                 mov        eax, dword ptr [rsp + 0x1ec]
02f53 83c010                         add        eax, 0x10
02f56 8bbc24e4010000                 mov        edi, dword ptr [rsp + 0x1e4]
02f5d 83c710                         add        edi, 0x10
02f60 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02f67 ba02000000                     mov        edx, 2
02f6c 7c05                           jl         0x7ff8d014d1f3
02f6e ba00000000                     mov        edx, 0
02f73 48b900c043c4f87f0000           movabs     rcx, 0x7ff8c443c000
02f7d 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
02f81 4403c2                         add        r8d, edx
02f84 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
02f88 85d2                           test       edx, edx
02f8a 7506                           jne        0x7ff8d014d212
02f8c 41b802000000                   mov        r8d, 2
02f92 4181e0fe3f0000                 and        r8d, 0x3ffe
02f99 4585c0                         test       r8d, r8d
02f9c 0f849e200000                   je         0x7ff8d014f2c0
02fa2 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02fa6 418502                         test       dword ptr [r10], eax
02fa9 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02fb0 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
02fba b948070000                     mov        ecx, 0x748
02fbf 7c05                           jl         0x7ff8d014d246
02fc1 b958070000                     mov        ecx, 0x758
02fc6 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
02fca 4d8d4001                       lea        r8, [r8 + 1]
02fce 4c89040a                       mov        qword ptr [rdx + rcx], r8
02fd2 0f8c50f5ffff                   jl         0x7ff8d014c7a8
02fd8 8b9c24f0010000                 mov        ebx, dword ptr [rsp + 0x1f0]
02fdf 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
02fe9 ff8268070000                   inc        dword ptr [rdx + 0x768]
02fef e9220f0000                     jmp        0x7ff8d014e196
02ff4 4183f908                       cmp        r9d, 8
02ff8 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
03002 b980070000                     mov        ecx, 0x780
03007 7c05                           jl         0x7ff8d014d28e
03009 b990070000                     mov        ecx, 0x790
0300e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
03012 4d8d4001                       lea        r8, [r8 + 1]
03016 4c89040a                       mov        qword ptr [rdx + rcx], r8
0301a 0f8c86040000                   jl         0x7ff8d014d726
03020 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
03027 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
0302e 899c2408020000                 mov        dword ptr [rsp + 0x208], ebx
03035 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
0303c 90                             nop        
0303d 90                             nop        
0303e 90                             nop        
0303f 90                             nop        
03040 89842400020000                 mov        dword ptr [rsp + 0x200], eax
03047 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0304f 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
03059 488382a007000001               add        qword ptr [rdx + 0x7a0], 1
03061 48ba206a043600000000           movabs     rdx, 0x36046a20
0306b 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0306e 83c102                         add        ecx, 2
03071 894a78                         mov        dword ptr [rdx + 0x78], ecx
03074 81e1feff1f00                   and        ecx, 0x1ffffe
0307a 85c9                           test       ecx, ecx
0307c 0f84df1f0000                   je         0x7ff8d014f2e1
03082 48ba206a043600000000           movabs     rdx, 0x36046a20
0308c 488d92e0000000                 lea        rdx, [rdx + 0xe0]
03093 4885c0                         test       rax, rax
03096 7510                           jne        0x7ff8d014d328
03098 f6420801                       test       byte ptr [rdx + 8], 1
0309c 0f8506000000                   jne        0x7ff8d014d328
030a2 f048834a0801                   lock or    qword ptr [rdx + 8], 1
030a8 48baa0d504c4f87f0000           movabs     rdx, 0x7ff8c404d5a0
030b2 488d9248030000                 lea        rdx, [rdx + 0x348]
030b9 4885c0                         test       rax, rax
030bc 7510                           jne        0x7ff8d014d34e
030be f6421001                       test       byte ptr [rdx + 0x10], 1
030c2 0f8506000000                   jne        0x7ff8d014d34e
030c8 f048834a1001                   lock or    qword ptr [rdx + 0x10], 1
030ce 48ba206a043600000000           movabs     rdx, 0x36046a20
030d8 488382b000000001               add        qword ptr [rdx + 0xb0], 1
030e0 48baa0d504c4f87f0000           movabs     rdx, 0x7ff8c404d5a0
030ea 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
030ed 83c102                         add        ecx, 2
030f0 894a78                         mov        dword ptr [rdx + 0x78], ecx
030f3 81e1feff1f00                   and        ecx, 0x1ffffe
030f9 85c9                           test       ecx, ecx
030fb 0f84811f0000                   je         0x7ff8d014f302
03101 48bad86c71e200000000           movabs     rdx, 0xe2716cd8
0310b 48b9a0d504c4f87f0000           movabs     rcx, 0x7ff8c404d5a0
03115 8b12                           mov        edx, dword ptr [rdx]
03117 c1ea0d                         shr        edx, 0xd
0311a 48c1e20a                       shl        rdx, 0xa
0311e 41ba00000035                   mov        r10d, 0x35000000
03124 4903d2                         add        rdx, r10
03127 41ba17000000                   mov        r10d, 0x17
0312d 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03131 7436                           je         0x7ff8d014d3e9
03133 4983c202                       add        r10, 2
03137 4983fa1b                       cmp        r10, 0x1b
0313b 75f0                           jne        0x7ff8d014d3ad
0313d 41ba17000000                   mov        r10d, 0x17
03143 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03148 7412                           je         0x7ff8d014d3dc
0314a 4983c202                       add        r10, 2
0314e 4983fa1b                       cmp        r10, 0x1b
03152 75ef                           jne        0x7ff8d014d3c3
03154 41ba16000000                   mov        r10d, 0x16
0315a eb11                           jmp        0x7ff8d014d3ed
0315c 50                             push       rax
0315d 4833c0                         xor        rax, rax
03160 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03166 58                             pop        rax
03167 ebbe                           jmp        0x7ff8d014d3a7
03169 4983c201                       add        r10, 1
0316d 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03172 48ba70cd04c4f87f0000           movabs     rdx, 0x7ff8c404cd70
0317c 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0317f 83c102                         add        ecx, 2
03182 894a78                         mov        dword ptr [rdx + 0x78], ecx
03185 81e1feff1f00                   and        ecx, 0x1ffffe
0318b 85c9                           test       ecx, ecx
0318d 0f84101f0000                   je         0x7ff8d014f323
03193 48ba70cd04c4f87f0000           movabs     rdx, 0x7ff8c404cd70
0319d ff82b0000000                   inc        dword ptr [rdx + 0xb0]
031a3 48baa0d504c4f87f0000           movabs     rdx, 0x7ff8c404d5a0
031ad ff8208010000                   inc        dword ptr [rdx + 0x108]
031b3 48baa0d504c4f87f0000           movabs     rdx, 0x7ff8c404d5a0
031bd ff8228010000                   inc        dword ptr [rdx + 0x128]
031c3 48ba906571e200000000           movabs     rdx, 0xe2716590
031cd 48b9a0d504c4f87f0000           movabs     rcx, 0x7ff8c404d5a0
031d7 8b12                           mov        edx, dword ptr [rdx]
031d9 c1ea0d                         shr        edx, 0xd
031dc 48c1e20a                       shl        rdx, 0xa
031e0 41ba00000035                   mov        r10d, 0x35000000
031e6 4903d2                         add        rdx, r10
031e9 41ba28000000                   mov        r10d, 0x28
031ef 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
031f3 7436                           je         0x7ff8d014d4ab
031f5 4983c202                       add        r10, 2
031f9 4983fa2c                       cmp        r10, 0x2c
031fd 75f0                           jne        0x7ff8d014d46f
031ff 41ba28000000                   mov        r10d, 0x28
03205 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0320a 7412                           je         0x7ff8d014d49e
0320c 4983c202                       add        r10, 2
03210 4983fa2c                       cmp        r10, 0x2c
03214 75ef                           jne        0x7ff8d014d485
03216 41ba27000000                   mov        r10d, 0x27
0321c eb11                           jmp        0x7ff8d014d4af
0321e 50                             push       rax
0321f 4833c0                         xor        rax, rax
03222 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03228 58                             pop        rax
03229 ebbe                           jmp        0x7ff8d014d469
0322b 4983c201                       add        r10, 1
0322f 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03234 48ba20d304c4f87f0000           movabs     rdx, 0x7ff8c404d320
0323e 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03241 83c102                         add        ecx, 2
03244 894a78                         mov        dword ptr [rdx + 0x78], ecx
03247 81e1feff1f00                   and        ecx, 0x1ffffe
0324d 85c9                           test       ecx, ecx
0324f 0f846f1e0000                   je         0x7ff8d014f344
03255 48ba20d304c4f87f0000           movabs     rdx, 0x7ff8c404d320
0325f ff82b0000000                   inc        dword ptr [rdx + 0xb0]
03265 48baa0d504c4f87f0000           movabs     rdx, 0x7ff8c404d5a0
0326f 488d9288010000                 lea        rdx, [rdx + 0x188]
03276 4885c0                         test       rax, rax
03279 7510                           jne        0x7ff8d014d50b
0327b f6421801                       test       byte ptr [rdx + 0x18], 1
0327f 0f8506000000                   jne        0x7ff8d014d50b
03285 f048834a1801                   lock or    qword ptr [rdx + 0x18], 1
0328b 48baa0d504c4f87f0000           movabs     rdx, 0x7ff8c404d5a0
03295 4883827801000001               add        qword ptr [rdx + 0x178], 1
0329d 48ba00d904c4f87f0000           movabs     rdx, 0x7ff8c404d900
032a7 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
032aa 83c102                         add        ecx, 2
032ad 894a78                         mov        dword ptr [rdx + 0x78], ecx
032b0 81e1feff1f00                   and        ecx, 0x1ffffe
032b6 85c9                           test       ecx, ecx
032b8 0f84271e0000                   je         0x7ff8d014f365
032be 48ba00d904c4f87f0000           movabs     rdx, 0x7ff8c404d900
032c8 4883821001000001               add        qword ptr [rdx + 0x110], 1
032d0 48bab8da04c4f87f0000           movabs     rdx, 0x7ff8c404dab8
032da 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
032dd 83c102                         add        ecx, 2
032e0 894a78                         mov        dword ptr [rdx + 0x78], ecx
032e3 81e1feff1f00                   and        ecx, 0x1ffffe
032e9 85c9                           test       ecx, ecx
032eb 0f84151e0000                   je         0x7ff8d014f386
032f1 8b5004                         mov        edx, dword ptr [rax + 4]
032f4 48b9b8da04c4f87f0000           movabs     rcx, 0x7ff8c404dab8
032fe 488381b000000001               add        qword ptr [rcx + 0xb0], 1
03306 83ea07                         sub        edx, 7
03309 48b9a01823e200000000           movabs     rcx, 0xe22318a0
03313 b900000000                     mov        ecx, 0
03318 3bf9                           cmp        edi, ecx
0331a 0f8c201e0000                   jl         0x7ff8d014f3c0
03320 3bfa                           cmp        edi, edx
03322 0f8d391e0000                   jge        0x7ff8d014f3e1
03328 488bd7                         mov        rdx, rdi
0332b 48be28c122e200000000           movabs     rsi, 0xe222c128
03335 488bce                         mov        rcx, rsi
03338 49b800d904c4f87f0000           movabs     r8, 0x7ff8c404d900
03342 8b09                           mov        ecx, dword ptr [rcx]
03344 c1e90d                         shr        ecx, 0xd
03347 48c1e10a                       shl        rcx, 0xa
0334b 41ba00000035                   mov        r10d, 0x35000000
03351 4903ca                         add        rcx, r10
03354 41ba25000000                   mov        r10d, 0x25
0335a 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0335e 7436                           je         0x7ff8d014d616
03360 4983c202                       add        r10, 2
03364 4983fa29                       cmp        r10, 0x29
03368 75f0                           jne        0x7ff8d014d5da
0336a 41ba25000000                   mov        r10d, 0x25
03370 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
03375 7412                           je         0x7ff8d014d609
03377 4983c202                       add        r10, 2
0337b 4983fa29                       cmp        r10, 0x29
0337f 75ef                           jne        0x7ff8d014d5f0
03381 41ba24000000                   mov        r10d, 0x24
03387 eb11                           jmp        0x7ff8d014d61a
03389 50                             push       rax
0338a 4833c0                         xor        rax, rax
0338d f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
03393 58                             pop        rax
03394 ebbe                           jmp        0x7ff8d014d5d4
03396 4983c201                       add        r10, 1
0339a 4b8304d001                     add        qword ptr [r8 + r10*8], 1
0339f 4863d2                         movsxd     rdx, edx
033a2 488bca                         mov        rcx, rdx
033a5 41ba08000000                   mov        r10d, 8
033ab 4903ca                         add        rcx, r10
033ae 488bd0                         mov        rdx, rax
033b1 41b800000000                   mov        r8d, 0
033b7 89bc2404020000                 mov        dword ptr [rsp + 0x204], edi
033be 90                             nop        
033bf e81c1c5e07                     call       0x7ff8d772f260
033c4 0f1f8400bc340013               nop        dword ptr [rax + rax + 0x130034bc]
033cc 48be00c043c4f87f0000           movabs     rsi, 0x7ff8c443c000
033d6 488386b007000001               add        qword ptr [rsi + 0x7b0], 1
033de 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
033e6 8b942400020000                 mov        edx, dword ptr [rsp + 0x200]
033ed 488bc8                         mov        rcx, rax
033f0 90                             nop        
033f1 90                             nop        
033f2 90                             nop        
033f3 90                             nop        
033f4 90                             nop        
033f5 90                             nop        
033f6 90                             nop        
033f7 e8e4255e07                     call       0x7ff8d772fc60
033fc 0f1f8400f4340014               nop        dword ptr [rax + rax + 0x140034f4]
03404 8b842400020000                 mov        eax, dword ptr [rsp + 0x200]
0340b 83c008                         add        eax, 8
0340e 8bbc2404020000                 mov        edi, dword ptr [rsp + 0x204]
03415 83c708                         add        edi, 8
03418 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
0341f be02000000                     mov        esi, 2
03424 7c05                           jl         0x7ff8d014d6ab
03426 be00000000                     mov        esi, 0
0342b 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
03435 8b4a7c                         mov        ecx, dword ptr [rdx + 0x7c]
03438 03ce                           add        ecx, esi
0343a 894a7c                         mov        dword ptr [rdx + 0x7c], ecx
0343d 85f6                           test       esi, esi
0343f 7505                           jne        0x7ff8d014d6c6
03441 b902000000                     mov        ecx, 2
03446 81e1fe3f0000                   and        ecx, 0x3ffe
0344c 85c9                           test       ecx, ecx
0344e 0f842e1d0000                   je         0x7ff8d014f402
03454 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03458 418502                         test       dword ptr [r10], eax
0345b 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
03462 48be00c043c4f87f0000           movabs     rsi, 0x7ff8c443c000
0346c bac0070000                     mov        edx, 0x7c0
03471 7c05                           jl         0x7ff8d014d6f8
03473 bad0070000                     mov        edx, 0x7d0
03478 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0347c 488d4901                       lea        rcx, [rcx + 1]
03480 48890c16                       mov        qword ptr [rsi + rdx], rcx
03484 0f8cb6fbffff                   jl         0x7ff8d014d2c0
0348a 8b9c2408020000                 mov        ebx, dword ptr [rsp + 0x208]
03491 48be00c043c4f87f0000           movabs     rsi, 0x7ff8c443c000
0349b ff86e0070000                   inc        dword ptr [rsi + 0x7e0]
034a1 e9700a0000                     jmp        0x7ff8d014e196
034a6 48be00c043c4f87f0000           movabs     rsi, 0x7ff8c443c000
034b0 488386f807000001               add        qword ptr [rsi + 0x7f8], 1
034b8 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
034c0 8b9424d0010000                 mov        edx, dword ptr [rsp + 0x1d0]
034c7 488bcf                         mov        rcx, rdi
034ca 4d8bc1                         mov        r8, r9
034cd 448b8c2478010000               mov        r9d, dword ptr [rsp + 0x178]
034d5 90                             nop        
034d6 90                             nop        
034d7 e804255e07                     call       0x7ff8d772fc60
034dc 0f1f8400d4350016               nop        dword ptr [rax + rax + 0x160035d4]
034e4 488bd8                         mov        rbx, rax
034e7 e92a0a0000                     jmp        0x7ff8d014e196
034ec 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
034f3 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
034fa 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03502 48be00c043c4f87f0000           movabs     rsi, 0x7ff8c443c000
0350c 488386d005000001               add        qword ptr [rsi + 0x5d0], 1
03514 48bef8f214c4f87f0000           movabs     rsi, 0x7ff8c414f2f8
0351e 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03521 83c202                         add        edx, 2
03524 895678                         mov        dword ptr [rsi + 0x78], edx
03527 81e2feff1f00                   and        edx, 0x1ffffe
0352d 85d2                           test       edx, edx
0352f 0f846e1c0000                   je         0x7ff8d014f423
03535 48be180579e200000000           movabs     rsi, 0xe2790518
0353f 48baf8f214c4f87f0000           movabs     rdx, 0x7ff8c414f2f8
03549 8b36                           mov        esi, dword ptr [rsi]
0354b c1ee0d                         shr        esi, 0xd
0354e 48c1e60a                       shl        rsi, 0xa
03552 41ba00000035                   mov        r10d, 0x35000000
03558 4903f2                         add        rsi, r10
0355b 41ba17000000                   mov        r10d, 0x17
03561 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03565 7436                           je         0x7ff8d014d81d
03567 4983c202                       add        r10, 2
0356b 4983fa1b                       cmp        r10, 0x1b
0356f 75f0                           jne        0x7ff8d014d7e1
03571 41ba17000000                   mov        r10d, 0x17
03577 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
0357c 7412                           je         0x7ff8d014d810
0357e 4983c202                       add        r10, 2
03582 4983fa1b                       cmp        r10, 0x1b
03586 75ef                           jne        0x7ff8d014d7f7
03588 41ba16000000                   mov        r10d, 0x16
0358e eb11                           jmp        0x7ff8d014d821
03590 50                             push       rax
03591 4833c0                         xor        rax, rax
03594 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
0359a 58                             pop        rax
0359b ebbe                           jmp        0x7ff8d014d7db
0359d 4983c201                       add        r10, 1
035a1 4a8304d201                     add        qword ptr [rdx + r10*8], 1
035a6 8b5804                         mov        ebx, dword ptr [rax + 4]
035a9 48bef8f214c4f87f0000           movabs     rsi, 0x7ff8c414f2f8
035b3 488386e000000001               add        qword ptr [rsi + 0xe0], 1
035bb 48be00e914c4f87f0000           movabs     rsi, 0x7ff8c414e900
035c5 8b5678                         mov        edx, dword ptr [rsi + 0x78]
035c8 83c202                         add        edx, 2
035cb 895678                         mov        dword ptr [rsi + 0x78], edx
035ce 81e2feff1f00                   and        edx, 0x1ffffe
035d4 85d2                           test       edx, edx
035d6 0f84011c0000                   je         0x7ff8d014f45d
035dc 48be00e914c4f87f0000           movabs     rsi, 0x7ff8c414e900
035e6 4883861001000001               add        qword ptr [rsi + 0x110], 1
035ee 488bf3                         mov        rsi, rbx
035f1 83ee0f                         sub        esi, 0xf
035f4 48ba90df14c4f87f0000           movabs     rdx, 0x7ff8c414df90
035fe 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03601 83c102                         add        ecx, 2
03604 894a78                         mov        dword ptr [rdx + 0x78], ecx
03607 81e1feff1f00                   and        ecx, 0x1ffffe
0360d 85c9                           test       ecx, ecx
0360f 0f84e91b0000                   je         0x7ff8d014f47e
03615 48ba90df14c4f87f0000           movabs     rdx, 0x7ff8c414df90
0361f 488382b000000001               add        qword ptr [rdx + 0xb0], 1
03627 48ba0000000000000000           movabs     rdx, 0
03631 ba00000000                     mov        edx, 0
03636 3bfa                           cmp        edi, edx
03638 0f8ce11b0000                   jl         0x7ff8d014f49f
0363e 3bfe                           cmp        edi, esi
03640 0f8dfa1b0000                   jge        0x7ff8d014f4c0
03646 48be180579e200000000           movabs     rsi, 0xe2790518
03650 488bd6                         mov        rdx, rsi
03653 48b9f8f214c4f87f0000           movabs     rcx, 0x7ff8c414f2f8
0365d 8b12                           mov        edx, dword ptr [rdx]
0365f c1ea0d                         shr        edx, 0xd
03662 48c1e20a                       shl        rdx, 0xa
03666 41ba00000035                   mov        r10d, 0x35000000
0366c 4903d2                         add        rdx, r10
0366f 41ba25000000                   mov        r10d, 0x25
03675 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03679 7436                           je         0x7ff8d014d931
0367b 4983c202                       add        r10, 2
0367f 4983fa29                       cmp        r10, 0x29
03683 75f0                           jne        0x7ff8d014d8f5
03685 41ba25000000                   mov        r10d, 0x25
0368b 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03690 7412                           je         0x7ff8d014d924
03692 4983c202                       add        r10, 2
03696 4983fa29                       cmp        r10, 0x29
0369a 75ef                           jne        0x7ff8d014d90b
0369c 41ba24000000                   mov        r10d, 0x24
036a2 eb11                           jmp        0x7ff8d014d935
036a4 50                             push       rax
036a5 4833c0                         xor        rax, rax
036a8 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
036ae 58                             pop        rax
036af ebbe                           jmp        0x7ff8d014d8ef
036b1 4983c201                       add        r10, 1
036b5 4a8304d101                     add        qword ptr [rcx + r10*8], 1
036ba 48ba98e014c4f87f0000           movabs     rdx, 0x7ff8c414e098
036c4 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
036c7 83c102                         add        ecx, 2
036ca 894a78                         mov        dword ptr [rdx + 0x78], ecx
036cd 81e1feff1f00                   and        ecx, 0x1ffffe
036d3 85c9                           test       ecx, ecx
036d5 0f84861b0000                   je         0x7ff8d014f4e1
036db 48ba98e014c4f87f0000           movabs     rdx, 0x7ff8c414e098
036e5 488382b000000001               add        qword ptr [rdx + 0xb0], 1
036ed 48bec8e114c4f87f0000           movabs     rsi, 0x7ff8c414e1c8
036f7 8b5678                         mov        edx, dword ptr [rsi + 0x78]
036fa 83c202                         add        edx, 2
036fd 895678                         mov        dword ptr [rsi + 0x78], edx
03700 81e2feff1f00                   and        edx, 0x1ffffe
03706 85d2                           test       edx, edx
03708 0f84741b0000                   je         0x7ff8d014f502
0370e 48bec8e114c4f87f0000           movabs     rsi, 0x7ff8c414e1c8
03718 ff86c0000000                   inc        dword ptr [rsi + 0xc0]
0371e 899c240c020000                 mov        dword ptr [rsp + 0x20c], ebx
03725 48be108579e200000000           movabs     rsi, 0xe2798510
0372f 488bd6                         mov        rdx, rsi
03732 48b9f8f214c4f87f0000           movabs     rcx, 0x7ff8c414f2f8
0373c 4883816001000001               add        qword ptr [rcx + 0x160], 1
03744 48bac8f414c4f87f0000           movabs     rdx, 0x7ff8c414f4c8
0374e 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03751 83c102                         add        ecx, 2
03754 894a78                         mov        dword ptr [rdx + 0x78], ecx
03757 81e1feff1f00                   and        ecx, 0x1ffffe
0375d 85c9                           test       ecx, ecx
0375f 0f843e1b0000                   je         0x7ff8d014f523
03765 488bd6                         mov        rdx, rsi
03768 48b9c8f414c4f87f0000           movabs     rcx, 0x7ff8c414f4c8
03772 488381b000000001               add        qword ptr [rcx + 0xb0], 1
0377a 48bab0f514c4f87f0000           movabs     rdx, 0x7ff8c414f5b0
03784 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03787 83c102                         add        ecx, 2
0378a 894a78                         mov        dword ptr [rdx + 0x78], ecx
0378d 81e1feff1f00                   and        ecx, 0x1ffffe
03793 85c9                           test       ecx, ecx
03795 0f84291b0000                   je         0x7ff8d014f544
0379b 48bab0f514c4f87f0000           movabs     rdx, 0x7ff8c414f5b0
037a5 488382c000000001               add        qword ptr [rdx + 0xc0], 1
037ad 48be80ea14c4f87f0000           movabs     rsi, 0x7ff8c414ea80
037b7 8b5678                         mov        edx, dword ptr [rsi + 0x78]
037ba 83c202                         add        edx, 2
037bd 895678                         mov        dword ptr [rsi + 0x78], edx
037c0 81e2feff1f00                   and        edx, 0x1ffffe
037c6 85d2                           test       edx, edx
037c8 0f84171b0000                   je         0x7ff8d014f565
037ce 48be180579e200000000           movabs     rsi, 0xe2790518
037d8 488bd6                         mov        rdx, rsi
037db 48b9b0f514c4f87f0000           movabs     rcx, 0x7ff8c414f5b0
037e5 8b12                           mov        edx, dword ptr [rdx]
037e7 c1ea0d                         shr        edx, 0xd
037ea 48c1e20a                       shl        rdx, 0xa
037ee 41ba00000035                   mov        r10d, 0x35000000
037f4 4903d2                         add        rdx, r10
037f7 41ba1d000000                   mov        r10d, 0x1d
037fd 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03801 7436                           je         0x7ff8d014dab9
03803 4983c202                       add        r10, 2
03807 4983fa21                       cmp        r10, 0x21
0380b 75f0                           jne        0x7ff8d014da7d
0380d 41ba1d000000                   mov        r10d, 0x1d
03813 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03818 7412                           je         0x7ff8d014daac
0381a 4983c202                       add        r10, 2
0381e 4983fa21                       cmp        r10, 0x21
03822 75ef                           jne        0x7ff8d014da93
03824 41ba1c000000                   mov        r10d, 0x1c
0382a eb11                           jmp        0x7ff8d014dabd
0382c 50                             push       rax
0382d 4833c0                         xor        rax, rax
03830 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03836 58                             pop        rax
03837 ebbe                           jmp        0x7ff8d014da77
03839 4983c201                       add        r10, 1
0383d 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03842 48bab0f514c4f87f0000           movabs     rdx, 0x7ff8c414f5b0
0384c 8b36                           mov        esi, dword ptr [rsi]
0384e c1ee0d                         shr        esi, 0xd
03851 48c1e60a                       shl        rsi, 0xa
03855 41ba00000035                   mov        r10d, 0x35000000
0385b 4903f2                         add        rsi, r10
0385e 41ba23000000                   mov        r10d, 0x23
03864 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03868 7436                           je         0x7ff8d014db20
0386a 4983c202                       add        r10, 2
0386e 4983fa27                       cmp        r10, 0x27
03872 75f0                           jne        0x7ff8d014dae4
03874 41ba23000000                   mov        r10d, 0x23
0387a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
0387f 7412                           je         0x7ff8d014db13
03881 4983c202                       add        r10, 2
03885 4983fa27                       cmp        r10, 0x27
03889 75ef                           jne        0x7ff8d014dafa
0388b 41ba22000000                   mov        r10d, 0x22
03891 eb11                           jmp        0x7ff8d014db24
03893 50                             push       rax
03894 4833c0                         xor        rax, rax
03897 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
0389d 58                             pop        rax
0389e ebbe                           jmp        0x7ff8d014dade
038a0 4983c201                       add        r10, 1
038a4 4a8304d201                     add        qword ptr [rdx + r10*8], 1
038a9 48beb0f514c4f87f0000           movabs     rsi, 0x7ff8c414f5b0
038b3 4883864001000001               add        qword ptr [rsi + 0x140], 1
038bb 48be48eb14c4f87f0000           movabs     rsi, 0x7ff8c414eb48
038c5 8b5678                         mov        edx, dword ptr [rsi + 0x78]
038c8 83c202                         add        edx, 2
038cb 895678                         mov        dword ptr [rsi + 0x78], edx
038ce 81e2feff1f00                   and        edx, 0x1ffffe
038d4 85d2                           test       edx, edx
038d6 0f842a1a0000                   je         0x7ff8d014f586
038dc 48beb0f514c4f87f0000           movabs     rsi, 0x7ff8c414f5b0
038e6 4883865001000001               add        qword ptr [rsi + 0x150], 1
038ee 4c63df                         movsxd     r11, edi
038f1 be08000000                     mov        esi, 8
038f6 4d8bcb                         mov        r9, r11
038f9 4c03ce                         add        r9, rsi
038fc 48bed0dc14c4f87f0000           movabs     rsi, 0x7ff8c414dcd0
03906 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03909 83c202                         add        edx, 2
0390c 895678                         mov        dword ptr [rsi + 0x78], edx
0390f 81e2feff1f00                   and        edx, 0x1ffffe
03915 85d2                           test       edx, edx
03917 0f840a1a0000                   je         0x7ff8d014f5a7
0391d 48bed0dc14c4f87f0000           movabs     rsi, 0x7ff8c414dcd0
03927 488386e000000001               add        qword ptr [rsi + 0xe0], 1
0392f 48be50de14c4f87f0000           movabs     rsi, 0x7ff8c414de50
03939 8b5678                         mov        edx, dword ptr [rsi + 0x78]
0393c 83c202                         add        edx, 2
0393f 895678                         mov        dword ptr [rsi + 0x78], edx
03942 81e2feff1f00                   and        edx, 0x1ffffe
03948 85d2                           test       edx, edx
0394a 0f84f8190000                   je         0x7ff8d014f5c8
03950 48beb0f514c4f87f0000           movabs     rsi, 0x7ff8c414f5b0
0395a 4883867001000001               add        qword ptr [rsi + 0x170], 1
03962 48bee0dd79e200000000           movabs     rsi, 0xe279dde0
0396c 48be600579e200000000           movabs     rsi, 0xe2790560
03976 ba02000000                     mov        edx, 2
0397b b910000000                     mov        ecx, 0x10
03980 4c8bc0                         mov        r8, rax
03983 bf00000000                     mov        edi, 0
03988 48890424                       mov        qword ptr [rsp], rax
0398c 4c895c2408                     mov        qword ptr [rsp + 8], r11
03991 49ba180579e200000000           movabs     r10, 0xe2790518
0399b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
039a0 49bae0dd79e200000000           movabs     r10, 0xe279dde0
039aa 4c89542418                     mov        qword ptr [rsp + 0x18], r10
039af e82c205e07                     call       0x7ff8d772fc60
039b4 0f1f8400ac3a0017               nop        dword ptr [rax + rax + 0x17003aac]
039bc 4885c0                         test       rax, rax
039bf 48bbb0f514c4f87f0000           movabs     rbx, 0x7ff8c414f5b0
039c9 750c                           jne        0x7ff8d014dc57
039cb 808b7901000001                 or         byte ptr [rbx + 0x179], 1
039d2 e988000000                     jmp        0x7ff8d014dcdf
039d7 8b38                           mov        edi, dword ptr [rax]
039d9 c1ef0d                         shr        edi, 0xd
039dc 48c1e70a                       shl        rdi, 0xa
039e0 41ba00000035                   mov        r10d, 0x35000000
039e6 4903fa                         add        rdi, r10
039e9 41ba31000000                   mov        r10d, 0x31
039ef 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
039f3 7436                           je         0x7ff8d014dcab
039f5 4983c202                       add        r10, 2
039f9 4983fa35                       cmp        r10, 0x35
039fd 75f0                           jne        0x7ff8d014dc6f
039ff 41ba31000000                   mov        r10d, 0x31
03a05 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03a0a 7412                           je         0x7ff8d014dc9e
03a0c 4983c202                       add        r10, 2
03a10 4983fa35                       cmp        r10, 0x35
03a14 75ef                           jne        0x7ff8d014dc85
03a16 41ba30000000                   mov        r10d, 0x30
03a1c eb11                           jmp        0x7ff8d014dcaf
03a1e 50                             push       rax
03a1f 4833c0                         xor        rax, rax
03a22 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
03a28 58                             pop        rax
03a29 ebbe                           jmp        0x7ff8d014dc69
03a2b 4983c201                       add        r10, 1
03a2f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03a34 48bf0084003600000000           movabs     rdi, 0x36008400
03a3e 8b18                           mov        ebx, dword ptr [rax]
03a40 c1eb0d                         shr        ebx, 0xd
03a43 48c1e30a                       shl        rbx, 0xa
03a47 41ba00000035                   mov        r10d, 0x35000000
03a4d 4903da                         add        rbx, r10
03a50 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
03a54 0f850f190000                   jne        0x7ff8d014f5e9
03a5a e900000000                     jmp        0x7ff8d014dcdf
03a5f 488bf8                         mov        rdi, rax
03a62 4889bc2410020000               mov        qword ptr [rsp + 0x210], rdi
03a6a 483b07                         cmp        rax, qword ptr [rdi]
03a6d 488bf7                         mov        rsi, rdi
03a70 48bb00c043c4f87f0000           movabs     rbx, 0x7ff8c443c000
03a7a 8b36                           mov        esi, dword ptr [rsi]
03a7c c1ee0d                         shr        esi, 0xd
03a7f 48c1e60a                       shl        rsi, 0xa
03a83 41ba00000035                   mov        r10d, 0x35000000
03a89 4903f2                         add        rsi, r10
03a8c 41babd000000                   mov        r10d, 0xbd
03a92 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03a96 743c                           je         0x7ff8d014dd54
03a98 4983c202                       add        r10, 2
03a9c 4981fac1000000                 cmp        r10, 0xc1
03aa3 75ed                           jne        0x7ff8d014dd12
03aa5 41babd000000                   mov        r10d, 0xbd
03aab 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03ab0 7415                           je         0x7ff8d014dd47
03ab2 4983c202                       add        r10, 2
03ab6 4981fac1000000                 cmp        r10, 0xc1
03abd 75ec                           jne        0x7ff8d014dd2b
03abf 41babc000000                   mov        r10d, 0xbc
03ac5 eb11                           jmp        0x7ff8d014dd58
03ac7 50                             push       rax
03ac8 4833c0                         xor        rax, rax
03acb f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
03ad1 58                             pop        rax
03ad2 ebb8                           jmp        0x7ff8d014dd0c
03ad4 4983c201                       add        r10, 1
03ad8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03add 48be000015c4f87f0000           movabs     rsi, 0x7ff8c4150000
03ae7 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
03aea 83c302                         add        ebx, 2
03aed 895e78                         mov        dword ptr [rsi + 0x78], ebx
03af0 81e3feff1f00                   and        ebx, 0x1ffffe
03af6 85db                           test       ebx, ebx
03af8 0f84a1180000                   je         0x7ff8d014f61f
03afe 488bf7                         mov        rsi, rdi
03b01 48bb000015c4f87f0000           movabs     rbx, 0x7ff8c4150000
03b0b 8b36                           mov        esi, dword ptr [rsi]
03b0d c1ee0d                         shr        esi, 0xd
03b10 48c1e60a                       shl        rsi, 0xa
03b14 41ba00000035                   mov        r10d, 0x35000000
03b1a 4903f2                         add        rsi, r10
03b1d 41ba17000000                   mov        r10d, 0x17
03b23 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03b27 7436                           je         0x7ff8d014dddf
03b29 4983c202                       add        r10, 2
03b2d 4983fa1b                       cmp        r10, 0x1b
03b31 75f0                           jne        0x7ff8d014dda3
03b33 41ba17000000                   mov        r10d, 0x17
03b39 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03b3e 7412                           je         0x7ff8d014ddd2
03b40 4983c202                       add        r10, 2
03b44 4983fa1b                       cmp        r10, 0x1b
03b48 75ef                           jne        0x7ff8d014ddb9
03b4a 41ba16000000                   mov        r10d, 0x16
03b50 eb11                           jmp        0x7ff8d014dde3
03b52 50                             push       rax
03b53 4833c0                         xor        rax, rax
03b56 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
03b5c 58                             pop        rax
03b5d ebbe                           jmp        0x7ff8d014dd9d
03b5f 4983c201                       add        r10, 1
03b63 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03b68 488bf7                         mov        rsi, rdi
03b6b 90                             nop        
03b6c 90                             nop        
03b6d 48b8a0e85fa4f87f0000           movabs     rax, 0x7ff8a45fe8a0
03b77 e864195e07                     call       0x7ff8d772f760
03b7c 0f1f8400743c0018               nop        dword ptr [rax + rax + 0x18003c74]
03b84 48be000015c4f87f0000           movabs     rsi, 0x7ff8c4150000
03b8e 488386e000000001               add        qword ptr [rsi + 0xe0], 1
03b96 48be00e914c4f87f0000           movabs     rsi, 0x7ff8c414e900
03ba0 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
03ba3 83c702                         add        edi, 2
03ba6 897e78                         mov        dword ptr [rsi + 0x78], edi
03ba9 81e7feff1f00                   and        edi, 0x1ffffe
03baf 85ff                           test       edi, edi
03bb1 0f8409180000                   je         0x7ff8d014f640
03bb7 8b9c240c020000                 mov        ebx, dword ptr [rsp + 0x20c]
03bbe 8bbc24d0010000                 mov        edi, dword ptr [rsp + 0x1d0]
03bc5 48be00e914c4f87f0000           movabs     rsi, 0x7ff8c414e900
03bcf 4883861001000001               add        qword ptr [rsi + 0x110], 1
03bd7 ffc8                           dec        eax
03bd9 2bd8                           sub        ebx, eax
03bdb 48be90df14c4f87f0000           movabs     rsi, 0x7ff8c414df90
03be5 8b4678                         mov        eax, dword ptr [rsi + 0x78]
03be8 83c002                         add        eax, 2
03beb 894678                         mov        dword ptr [rsi + 0x78], eax
03bee 25feff1f00                     and        eax, 0x1ffffe
03bf3 85c0                           test       eax, eax
03bf5 0f84e6170000                   je         0x7ff8d014f661
03bfb 48be90df14c4f87f0000           movabs     rsi, 0x7ff8c414df90
03c05 488386b000000001               add        qword ptr [rsi + 0xb0], 1
03c0d 48be0000000000000000           movabs     rsi, 0
03c17 be00000000                     mov        esi, 0
03c1c 3bfe                           cmp        edi, esi
03c1e 0f8cde170000                   jl         0x7ff8d014f682
03c24 3bfb                           cmp        edi, ebx
03c26 0f8df7170000                   jge        0x7ff8d014f6a3
03c2c 488bdf                         mov        rbx, rdi
03c2f 899c2418020000                 mov        dword ptr [rsp + 0x218], ebx
03c36 89bc24d0010000                 mov        dword ptr [rsp + 0x1d0], edi
03c3d 488bbc2410020000               mov        rdi, qword ptr [rsp + 0x210]
03c45 488bf7                         mov        rsi, rdi
03c48 48b9000015c4f87f0000           movabs     rcx, 0x7ff8c4150000
03c52 8b36                           mov        esi, dword ptr [rsi]
03c54 c1ee0d                         shr        esi, 0xd
03c57 48c1e60a                       shl        rsi, 0xa
03c5b 41ba00000035                   mov        r10d, 0x35000000
03c61 4903f2                         add        rsi, r10
03c64 41ba1f000000                   mov        r10d, 0x1f
03c6a 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
03c6e 7436                           je         0x7ff8d014df26
03c70 4983c202                       add        r10, 2
03c74 4983fa23                       cmp        r10, 0x23
03c78 75f0                           jne        0x7ff8d014deea
03c7a 41ba1f000000                   mov        r10d, 0x1f
03c80 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03c85 7412                           je         0x7ff8d014df19
03c87 4983c202                       add        r10, 2
03c8b 4983fa23                       cmp        r10, 0x23
03c8f 75ef                           jne        0x7ff8d014df00
03c91 41ba1e000000                   mov        r10d, 0x1e
03c97 eb11                           jmp        0x7ff8d014df2a
03c99 50                             push       rax
03c9a 4833c0                         xor        rax, rax
03c9d f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
03ca3 58                             pop        rax
03ca4 ebbe                           jmp        0x7ff8d014dee4
03ca6 4983c201                       add        r10, 1
03caa 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03caf 488bf7                         mov        rsi, rdi
03cb2 90                             nop        
03cb3 90                             nop        
03cb4 90                             nop        
03cb5 48b8c8e85fa4f87f0000           movabs     rax, 0x7ff8a45fe8c8
03cbf e81c185e07                     call       0x7ff8d772f760
03cc4 0f1f8400bc3d0019               nop        dword ptr [rax + rax + 0x19003dbc]
03ccc 483b00                         cmp        rax, qword ptr [rax]
03ccf 488bf0                         mov        rsi, rax
03cd2 48ba000015c4f87f0000           movabs     rdx, 0x7ff8c4150000
03cdc 8b36                           mov        esi, dword ptr [rsi]
03cde c1ee0d                         shr        esi, 0xd
03ce1 48c1e60a                       shl        rsi, 0xa
03ce5 41ba00000035                   mov        r10d, 0x35000000
03ceb 4903f2                         add        rsi, r10
03cee 41ba25000000                   mov        r10d, 0x25
03cf4 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03cf8 7436                           je         0x7ff8d014dfb0
03cfa 4983c202                       add        r10, 2
03cfe 4983fa29                       cmp        r10, 0x29
03d02 75f0                           jne        0x7ff8d014df74
03d04 41ba25000000                   mov        r10d, 0x25
03d0a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03d0f 7412                           je         0x7ff8d014dfa3
03d11 4983c202                       add        r10, 2
03d15 4983fa29                       cmp        r10, 0x29
03d19 75ef                           jne        0x7ff8d014df8a
03d1b 41ba24000000                   mov        r10d, 0x24
03d21 eb11                           jmp        0x7ff8d014dfb4
03d23 50                             push       rax
03d24 4833c0                         xor        rax, rax
03d27 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03d2d 58                             pop        rax
03d2e ebbe                           jmp        0x7ff8d014df6e
03d30 4983c201                       add        r10, 1
03d34 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03d39 8b7024                         mov        esi, dword ptr [rax + 0x24]
03d3c 4c3b255504851f                 cmp        r12, qword ptr [rip + 0x1f850455]
03d43 0f8414000000                   je         0x7ff8d014dfdd
03d49 48bf3803a7edf87f0000           movabs     rdi, 0x7ff8eda70338
03d53 4883e4f0                       and        rsp, 0xfffffffffffffff0
03d57 e804ecc11e                     call       0x7ff8eed6cbe0
03d5c f4                             hlt        
03d5d 488bd0                         mov        rdx, rax
03d60 48b9000015c4f87f0000           movabs     rcx, 0x7ff8c4150000
03d6a 8b12                           mov        edx, dword ptr [rdx]
03d6c c1ea0d                         shr        edx, 0xd
03d6f 48c1e20a                       shl        rdx, 0xa
03d73 41ba00000035                   mov        r10d, 0x35000000
03d79 4903d2                         add        rdx, r10
03d7c 41ba2b000000                   mov        r10d, 0x2b
03d82 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03d86 7436                           je         0x7ff8d014e03e
03d88 4983c202                       add        r10, 2
03d8c 4983fa2f                       cmp        r10, 0x2f
03d90 75f0                           jne        0x7ff8d014e002
03d92 41ba2b000000                   mov        r10d, 0x2b
03d98 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03d9d 7412                           je         0x7ff8d014e031
03d9f 4983c202                       add        r10, 2
03da3 4983fa2f                       cmp        r10, 0x2f
03da7 75ef                           jne        0x7ff8d014e018
03da9 41ba2a000000                   mov        r10d, 0x2a
03daf eb11                           jmp        0x7ff8d014e042
03db1 50                             push       rax
03db2 4833c0                         xor        rax, rax
03db5 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03dbb 58                             pop        rax
03dbc ebbe                           jmp        0x7ff8d014dffc
03dbe 4983c201                       add        r10, 1
03dc2 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03dc7 8b4804                         mov        ecx, dword ptr [rax + 4]
03dca 48ba000015c4f87f0000           movabs     rdx, 0x7ff8c4150000
03dd4 4883828001000001               add        qword ptr [rdx + 0x180], 1
03ddc 48ba48eb14c4f87f0000           movabs     rdx, 0x7ff8c414eb48
03de6 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
03dea 4183c002                       add        r8d, 2
03dee 44894278                       mov        dword ptr [rdx + 0x78], r8d
03df2 4181e0feff1f00                 and        r8d, 0x1ffffe
03df9 4585c0                         test       r8d, r8d
03dfc 0f845b160000                   je         0x7ff8d014f6dd
03e02 48ba000015c4f87f0000           movabs     rdx, 0x7ff8c4150000
03e0c 4883829001000001               add        qword ptr [rdx + 0x190], 1
03e14 8b9c2418020000                 mov        ebx, dword ptr [rsp + 0x218]
03e1b 4863db                         movsxd     rbx, ebx
03e1e ba08000000                     mov        edx, 8
03e23 4c8bcb                         mov        r9, rbx
03e26 4c03ca                         add        r9, rdx
03e29 48bad0dc14c4f87f0000           movabs     rdx, 0x7ff8c414dcd0
03e33 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
03e37 4183c002                       add        r8d, 2
03e3b 44894278                       mov        dword ptr [rdx + 0x78], r8d
03e3f 4181e0feff1f00                 and        r8d, 0x1ffffe
03e46 4585c0                         test       r8d, r8d
03e49 0f842f160000                   je         0x7ff8d014f6fe
03e4f 48bad0dc14c4f87f0000           movabs     rdx, 0x7ff8c414dcd0
03e59 488382e000000001               add        qword ptr [rdx + 0xe0], 1
03e61 48ba50de14c4f87f0000           movabs     rdx, 0x7ff8c414de50
03e6b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
03e6f 4183c002                       add        r8d, 2
03e73 44894278                       mov        dword ptr [rdx + 0x78], r8d
03e77 4181e0feff1f00                 and        r8d, 0x1ffffe
03e7e 4585c0                         test       r8d, r8d
03e81 0f8418160000                   je         0x7ff8d014f71f
03e87 48ba000015c4f87f0000           movabs     rdx, 0x7ff8c4150000
03e91 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
03e99 48bac87b7ae200000000           movabs     rdx, 0xe27a7bc8
03ea3 ba02000000                     mov        edx, 2
03ea8 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
03eb0 bf00000000                     mov        edi, 0
03eb5 488b842410020000               mov        rax, qword ptr [rsp + 0x210]
03ebd 48890424                       mov        qword ptr [rsp], rax
03ec1 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03ec9 4889442408                     mov        qword ptr [rsp + 8], rax
03ece 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
03ed3 49bac87b7ae200000000           movabs     r10, 0xe27a7bc8
03edd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03ee2 90                             nop        
03ee3 90                             nop        
03ee4 90                             nop        
03ee5 90                             nop        
03ee6 90                             nop        
03ee7 e8f41a5e07                     call       0x7ff8d772fc60
03eec 0f1f8400e43f001a               nop        dword ptr [rax + rax + 0x1a003fe4]
03ef4 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
03efb 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
03f03 4103d8                         add        ebx, r8d
03f06 48be00c043c4f87f0000           movabs     rsi, 0x7ff8c443c000
03f10 ff8610060000                   inc        dword ptr [rsi + 0x610]
03f16 8bb424d4010000                 mov        esi, dword ptr [rsp + 0x1d4]
03f1d 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
03f27 ff8208080000                   inc        dword ptr [rdx + 0x808]
03f2d 488bc3                         mov        rax, rbx
03f30 8b942444010000                 mov        edx, dword ptr [rsp + 0x144]
03f37 ffc2                           inc        edx
03f39 48b900c043c4f87f0000           movabs     rcx, 0x7ff8c443c000
03f43 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
03f47 4183c002                       add        r8d, 2
03f4b 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
03f4f 4181e0fe3f0000                 and        r8d, 0x3ffe
03f56 4585c0                         test       r8d, r8d
03f59 0f8461150000                   je         0x7ff8d014f740
03f5f 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03f63 418502                         test       dword ptr [r10], eax
03f66 48b900c043c4f87f0000           movabs     rcx, 0x7ff8c443c000
03f70 ff8130080000                   inc        dword ptr [rcx + 0x830]
03f76 488bce                         mov        rcx, rsi
03f79 4c8bd8                         mov        r11, rax
03f7c 488bf1                         mov        rsi, rcx
03f7f 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
03f87 488b9c2468020000               mov        rbx, qword ptr [rsp + 0x268]
03f8f 8bbc2430010000                 mov        edi, dword ptr [rsp + 0x130]
03f96 4c8b8c2420010000               mov        r9, qword ptr [rsp + 0x120]
03f9e 4c8b842428010000               mov        r8, qword ptr [rsp + 0x128]
03fa6 8b8c2434010000                 mov        ecx, dword ptr [rsp + 0x134]
03fad e95ec3ffff                     jmp        0x7ff8d014a590
03fb2 4c8bc8                         mov        r9, rax
03fb5 4585c9                         test       r9d, r9d
03fb8 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
03fc2 b988030000                     mov        ecx, 0x388
03fc7 7e05                           jle        0x7ff8d014e24e
03fc9 b998030000                     mov        ecx, 0x398
03fce 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
03fd2 4d8d4001                       lea        r8, [r8 + 1]
03fd6 4c89040a                       mov        qword ptr [rdx + rcx], r8
03fda 0f8ec2010000                   jle        0x7ff8d014e422
03fe0 488b9c2498010000               mov        rbx, qword ptr [rsp + 0x198]
03fe8 482bf3                         sub        rsi, rbx
03feb ba00000000                     mov        edx, 0
03ff0 483bf2                         cmp        rsi, rdx
03ff3 48be00c043c4f87f0000           movabs     rsi, 0x7ff8c443c000
03ffd baa8030000                     mov        edx, 0x3a8
04002 7d05                           jge        0x7ff8d014e289
04004 bab8030000                     mov        edx, 0x3b8
04009 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0400d 488d4901                       lea        rcx, [rcx + 1]
04011 48890c16                       mov        qword ptr [rsi + rdx], rcx
04015 0f8d87010000                   jge        0x7ff8d014e422
0401b 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
04023 488b5630                       mov        rdx, qword ptr [rsi + 0x30]
04027 be00000000                     mov        esi, 0
0402c 483bd6                         cmp        rdx, rsi
0402f 48be00c043c4f87f0000           movabs     rsi, 0x7ff8c443c000
04039 bac8030000                     mov        edx, 0x3c8
0403e 7505                           jne        0x7ff8d014e2c5
04040 bad8030000                     mov        edx, 0x3d8
04045 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
04049 488d4901                       lea        rcx, [rcx + 1]
0404d 48890c16                       mov        qword ptr [rsi + rdx], rcx
04051 0f854b010000                   jne        0x7ff8d014e422
04057 e950010000                     jmp        0x7ff8d014e42c
0405c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
04064 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0406c 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
04074 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
0407b 488bce                         mov        rcx, rsi
0407e 8bb42434010000                 mov        esi, dword ptr [rsp + 0x134]
04085 488bde                         mov        rbx, rsi
04088 2bd9                           sub        ebx, ecx
0408a 48be00c043c4f87f0000           movabs     rsi, 0x7ff8c443c000
04094 4883864808000001               add        qword ptr [rsi + 0x848], 1
0409c 488bf2                         mov        rsi, rdx
0409f 488bd1                         mov        rdx, rcx
040a2 488bc8                         mov        rcx, rax
040a5 4d8bc3                         mov        r8, r11
040a8 4c8bcb                         mov        r9, rbx
040ab 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
040b3 899c241c020000                 mov        dword ptr [rsp + 0x21c], ebx
040ba 4885c9                         test       rcx, rcx
040bd 0f841e140000                   je         0x7ff8d014f761
040c3 85d2                           test       edx, edx
040c5 0f8c16140000                   jl         0x7ff8d014f761
040cb 4585c0                         test       r8d, r8d
040ce 0f8c0d140000                   jl         0x7ff8d014f761
040d4 4a8d3c0a                       lea        rdi, [rdx + r9]
040d8 3b7e04                         cmp        edi, dword ptr [rsi + 4]
040db 0f8700140000                   ja         0x7ff8d014f761
040e1 4b8d3c08                       lea        rdi, [r8 + r9]
040e5 3b7904                         cmp        edi, dword ptr [rcx + 4]
040e8 0f87f3130000                   ja         0x7ff8d014f761
040ee 4585c9                         test       r9d, r9d
040f1 0f8cea130000                   jl         0x7ff8d014f761
040f7 4863d2                         movsxd     rdx, edx
040fa 4d63c0                         movsxd     r8, r8d
040fd 48bf00e41b3500000000           movabs     rdi, 0x351be400
04107 41ba00000035                   mov        r10d, 0x35000000
0410d 492bfa                         sub        rdi, r10
04110 48c1ef0a                       shr        rdi, 0xa
04114 448b19                         mov        r11d, dword ptr [rcx]
04117 41c1eb0d                       shr        r11d, 0xd
0411b 413bfb                         cmp        edi, r11d
0411e 0f8510000000                   jne        0x7ff8d014e3b4
04124 448b1e                         mov        r11d, dword ptr [rsi]
04127 41c1eb0d                       shr        r11d, 0xd
0412b 413bfb                         cmp        edi, r11d
0412e 0f8414000000                   je         0x7ff8d014e3c8
04134 48bf8875a0edf87f0000           movabs     rdi, 0x7ff8eda07588
0413e 4883e4f0                       and        rsp, 0xfffffffffffffff0
04142 e819e8c11e                     call       0x7ff8eed6cbe0
04147 f4                             hlt        
04148 488d7c1608                     lea        rdi, [rsi + rdx + 8]
0414d 4a8d740108                     lea        rsi, [rcx + r8 + 8]
04152 498bd1                         mov        rdx, r9
04155 40f6c40f                       test       spl, 0xf
04159 0f8412000000                   je         0x7ff8d014e3f1
0415f 4883ec08                       sub        rsp, 8
04163 e858ad5c07                     call       0x7ff8d7719140
04168 4883c408                       add        rsp, 8
0416c e905000000                     jmp        0x7ff8d014e3f6
04171 e84aad5c07                     call       0x7ff8d7719140
04176 8b9c241c020000                 mov        ebx, dword ptr [rsp + 0x21c]
0417d 039c2474010000                 add        ebx, dword ptr [rsp + 0x174]
04184 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
0418c 895e38                         mov        dword ptr [rsi + 0x38], ebx
0418f 4881c450020000                 add        rsp, 0x250
04196 5d                             pop        rbp
04197 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0419b 0f8750130000                   ja         0x7ff8d014f771
041a1 c3                             ret        
041a2 bb02000000                     mov        ebx, 2
041a7 e915000000                     jmp        0x7ff8d014e441
041ac 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
041b6 ff82e8030000                   inc        dword ptr [rdx + 0x3e8]
041bc bb08000000                     mov        ebx, 8
041c1 899c2428020000                 mov        dword ptr [rsp + 0x228], ebx
041c8 e949130000                     jmp        0x7ff8d014f796
041cd 90                             nop        
041ce 90                             nop        
041cf 90                             nop        
041d0 90                             nop        
041d1 90                             nop        
041d2 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
041d9 0f855a130000                   jne        0x7ff8d014f7b9
041df 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
041e6 488d7820                       lea        rdi, [rax + 0x20]
041ea 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
041f1 0f8742130000                   ja         0x7ff8d014f7b9
041f7 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
041fe 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
04205 488908                         mov        qword ptr [rax], rcx
04208 4833c9                         xor        rcx, rcx
0420b 48894808                       mov        qword ptr [rax + 8], rcx
0420f 48894810                       mov        qword ptr [rax + 0x10], rcx
04213 48894818                       mov        qword ptr [rax + 0x18], rcx
04217 90                             nop        
04218 e938130000                     jmp        0x7ff8d014f7d5
0421d 90                             nop        
0421e 90                             nop        
0421f 90                             nop        
04220 90                             nop        
04221 90                             nop        
04222 498bf1                         mov        rsi, r9
04225 4889842420020000               mov        qword ptr [rsp + 0x220], rax
0422d 90                             nop        
0422e 90                             nop        
0422f e8ac175e07                     call       0x7ff8d772fc60
04234 0f1f84002c43001c               nop        dword ptr [rax + rax + 0x1c00432c]
0423c 48ba00c043c4f87f0000           movabs     rdx, 0x7ff8c443c000
04246 488d9210040000                 lea        rdx, [rdx + 0x410]
0424d 4885c0                         test       rax, rax
04250 750e                           jne        0x7ff8d014e4e0
04252 f60201                         test       byte ptr [rdx], 1
04255 0f8505000000                   jne        0x7ff8d014e4e0
0425b f048830a01                     lock or    qword ptr [rdx], 1
04260 488b942420020000               mov        rdx, qword ptr [rsp + 0x220]
04268 48b900c043c4f87f0000           movabs     rcx, 0x7ff8c443c000
04272 4883812004000001               add        qword ptr [rcx + 0x420], 1
0427a 8b942428020000                 mov        edx, dword ptr [rsp + 0x228]
04281 488bc8                         mov        rcx, rax
04284 488bb42420020000               mov        rsi, qword ptr [rsp + 0x220]
0428c 90                             nop        
0428d 90                             nop        
0428e 90                             nop        
0428f e84c0d5e07                     call       0x7ff8d772f260
04294 0f1f84008c43001d               nop        dword ptr [rax + rax + 0x1d00438c]
0429c 488b842420020000               mov        rax, qword ptr [rsp + 0x220]
042a4 e951130000                     jmp        0x7ff8d014f87a
042a9 90                             nop        
042aa 90                             nop        
042ab 90                             nop        
042ac 90                             nop        
042ad 90                             nop        
042ae 90                             nop        
042af 90                             nop        
042b0 e9b9120000                     jmp        0x7ff8d014f7ee
042b5 90                             nop        
042b6 90                             nop        
042b7 90                             nop        
042b8 90                             nop        
042b9 90                             nop        
042ba 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
042c1 0f85ca120000                   jne        0x7ff8d014f811
042c7 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
042ce 488d7820                       lea        rdi, [rax + 0x20]
042d2 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
042d9 0f87b2120000                   ja         0x7ff8d014f811
042df 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
042e6 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
042ed 488908                         mov        qword ptr [rax], rcx
042f0 4833c9                         xor        rcx, rcx
042f3 48894808                       mov        qword ptr [rax + 8], rcx
042f7 48894810                       mov        qword ptr [rax + 0x10], rcx
042fb 48894818                       mov        qword ptr [rax + 0x18], rcx
042ff 488bd0                         mov        rdx, rax
04302 48b900c043c4f87f0000           movabs     rcx, 0x7ff8c443c000
0430c 4883815802000001               add        qword ptr [rcx + 0x258], 1
04314 ba02000000                     mov        edx, 2
04319 48b9006126e200000000           movabs     rcx, 0xe2266100
04323 488bf0                         mov        rsi, rax
04326 4889842430020000               mov        qword ptr [rsp + 0x230], rax
0432e 90                             nop        
0432f e8ac0c5e07                     call       0x7ff8d772f260
04334 0f1f84002c44001e               nop        dword ptr [rax + rax + 0x1e00442c]
0433c 488b842430020000               mov        rax, qword ptr [rsp + 0x230]
04344 e9b1120000                     jmp        0x7ff8d014f87a
04349 90                             nop        
0434a 90                             nop        
0434b 90                             nop        
0434c 90                             nop        
0434d 90                             nop        
0434e 90                             nop        
0434f 90                             nop        
04350 e958120000                     jmp        0x7ff8d014f82d
04355 90                             nop        
04356 90                             nop        
04357 90                             nop        
04358 90                             nop        
04359 90                             nop        
0435a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04361 0f8569120000                   jne        0x7ff8d014f850
04367 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
0436e 488d7820                       lea        rdi, [rax + 0x20]
04372 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
04379 0f8751120000                   ja         0x7ff8d014f850
0437f 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
04386 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0438d 488908                         mov        qword ptr [rax], rcx
04390 4833c9                         xor        rcx, rcx
04393 48894808                       mov        qword ptr [rax + 8], rcx
04397 48894810                       mov        qword ptr [rax + 0x10], rcx
0439b 48894818                       mov        qword ptr [rax + 0x18], rcx
0439f 488bd0                         mov        rdx, rax
043a2 48b900c043c4f87f0000           movabs     rcx, 0x7ff8c443c000
043ac 4883814001000001               add        qword ptr [rcx + 0x140], 1
043b4 ba05000000                     mov        edx, 5
043b9 48b9306126e200000000           movabs     rcx, 0xe2266130
043c3 488bf0                         mov        rsi, rax
043c6 4889842438020000               mov        qword ptr [rsp + 0x238], rax
043ce 90                             nop        
043cf e80c0c5e07                     call       0x7ff8d772f260
043d4 0f1f8400cc44001f               nop        dword ptr [rax + rax + 0x1f0044cc]
043dc 488b842438020000               mov        rax, qword ptr [rsp + 0x238]
043e4 e911120000                     jmp        0x7ff8d014f87a
043e9 49ba300442c4f87f0000           movabs     r10, 0x7ff8c4420430
043f3 4c89542408                     mov        qword ptr [rsp + 8], r10
043f8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04400 e8db035807                     call       0x7ff8d76cea60
04405 e983bcffff                     jmp        0x7ff8d014a30d
0440a 49ba20235b3500000000           movabs     r10, 0x355b2320
04414 4c89542408                     mov        qword ptr [rsp + 8], r10
04419 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04421 e8ba035807                     call       0x7ff8d76cea60
04426 e90dbeffff                     jmp        0x7ff8d014a4b8
0442b e8306f5807                     call       0x7ff8d76d55e0
04430 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
0443a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0443e e81de5c11e                     call       0x7ff8eed6cbe0
04443 f4                             hlt        
04444 e8176f5807                     call       0x7ff8d76d55e0
04449 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04453 4883e4f0                       and        rsp, 0xfffffffffffffff0
04457 e804e5c11e                     call       0x7ff8eed6cbe0
0445c f4                             hlt        
0445d e8fe6e5807                     call       0x7ff8d76d55e0
04462 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
0446c 4883e4f0                       and        rsp, 0xfffffffffffffff0
04470 e8ebe4c11e                     call       0x7ff8eed6cbe0
04475 f4                             hlt        
04476 48891424                       mov        qword ptr [rsp], rdx
0447a 4c89442408                     mov        qword ptr [rsp + 8], r8
0447f e8dc775807                     call       0x7ff8d76d5ee0
04484 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
0448e 4883e4f0                       and        rsp, 0xfffffffffffffff0
04492 e8c9e4c11e                     call       0x7ff8eed6cbe0
04497 f4                             hlt        
04498 e8c36e5807                     call       0x7ff8d76d55e0
0449d 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
044a7 4883e4f0                       and        rsp, 0xfffffffffffffff0
044ab e8b0e4c11e                     call       0x7ff8eed6cbe0
044b0 f4                             hlt        
044b1 e8aa6e5807                     call       0x7ff8d76d55e0
044b6 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
044c0 4883e4f0                       and        rsp, 0xfffffffffffffff0
044c4 e897e4c11e                     call       0x7ff8eed6cbe0
044c9 f4                             hlt        
044ca 48891424                       mov        qword ptr [rsp], rdx
044ce 4c894c2408                     mov        qword ptr [rsp + 8], r9
044d3 e888775807                     call       0x7ff8d76d5ee0
044d8 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
044e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
044e6 e875e4c11e                     call       0x7ff8eed6cbe0
044eb f4                             hlt        
044ec e86f6e5807                     call       0x7ff8d76d55e0
044f1 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
044fb 4883e4f0                       and        rsp, 0xfffffffffffffff0
044ff e85ce4c11e                     call       0x7ff8eed6cbe0
04504 f4                             hlt        
04505 e8566e5807                     call       0x7ff8d76d55e0
0450a 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04514 4883e4f0                       and        rsp, 0xfffffffffffffff0
04518 e843e4c11e                     call       0x7ff8eed6cbe0
0451d f4                             hlt        
0451e 48c7042401000000               mov        qword ptr [rsp], 1
04526 48895c2408                     mov        qword ptr [rsp + 8], rbx
0452b e830775807                     call       0x7ff8d76d5ee0
04530 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
0453a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0453e e81de4c11e                     call       0x7ff8eed6cbe0
04543 f4                             hlt        
04544 48c7042402000000               mov        qword ptr [rsp], 2
0454c 48895c2408                     mov        qword ptr [rsp + 8], rbx
04551 e80a775807                     call       0x7ff8d76d5ee0
04556 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04560 4883e4f0                       and        rsp, 0xfffffffffffffff0
04564 e8f7e3c11e                     call       0x7ff8eed6cbe0
04569 f4                             hlt        
0456a 49ba881506c4f87f0000           movabs     r10, 0x7ff8c4061588
04574 4c89542408                     mov        qword ptr [rsp + 8], r10
04579 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04581 e85a025807                     call       0x7ff8d76cea60
04586 e942c2ffff                     jmp        0x7ff8d014aa4d
0458b 49ba284714c4f87f0000           movabs     r10, 0x7ff8c4144728
04595 4c89542408                     mov        qword ptr [rsp + 8], r10
0459a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045a2 e839025807                     call       0x7ff8d76cea60
045a7 e9c5c2ffff                     jmp        0x7ff8d014aaf1
045ac 49bad0325b3500000000           movabs     r10, 0x355b32d0
045b6 4c89542408                     mov        qword ptr [rsp + 8], r10
045bb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045c3 e818025807                     call       0x7ff8d76cea60
045c8 e9eec2ffff                     jmp        0x7ff8d014ab3b
045cd 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
045d5 e806255807                     call       0x7ff8d76d0d60
045da 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
045e4 4883e4f0                       and        rsp, 0xfffffffffffffff0
045e8 e873e3c11e                     call       0x7ff8eed6cbe0
045ed f4                             hlt        
045ee 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
045f6 e8e5245807                     call       0x7ff8d76d0d60
045fb 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04605 4883e4f0                       and        rsp, 0xfffffffffffffff0
04609 e852e3c11e                     call       0x7ff8eed6cbe0
0460e f4                             hlt        
0460f 49bab85e0cc4f87f0000           movabs     r10, 0x7ff8c40c5eb8
04619 4c89542408                     mov        qword ptr [rsp + 8], r10
0461e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04626 e8b5015807                     call       0x7ff8d76cea60
0462b e964c3ffff                     jmp        0x7ff8d014ac14
04630 49bae0d00cc4f87f0000           movabs     r10, 0x7ff8c40cd0e0
0463a 4c89542408                     mov        qword ptr [rsp + 8], r10
0463f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04647 e894015807                     call       0x7ff8d76cea60
0464c e976c3ffff                     jmp        0x7ff8d014ac47
04651 49bae0ac0fc4f87f0000           movabs     r10, 0x7ff8c40face0
0465b 4c89542408                     mov        qword ptr [rsp + 8], r10
04660 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04668 e873015807                     call       0x7ff8d76cea60
0466d e9ccc3ffff                     jmp        0x7ff8d014acbe
04672 49ba483106c4f87f0000           movabs     r10, 0x7ff8c4063148
0467c 4c89542408                     mov        qword ptr [rsp + 8], r10
04681 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04689 e852015807                     call       0x7ff8d76cea60
0468e e9e2c3ffff                     jmp        0x7ff8d014acf5
04693 49bad06a0fc4f87f0000           movabs     r10, 0x7ff8c40f6ad0
0469d 4c89542408                     mov        qword ptr [rsp + 8], r10
046a2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046aa e831015807                     call       0x7ff8d76cea60
046af e9f9c3ffff                     jmp        0x7ff8d014ad2d
046b4 49ba084c06c4f87f0000           movabs     r10, 0x7ff8c4064c08
046be 4c89542408                     mov        qword ptr [rsp + 8], r10
046c3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046cb e810015807                     call       0x7ff8d76cea60
046d0 e9f3c4ffff                     jmp        0x7ff8d014ae48
046d5 49ba502b283500000000           movabs     r10, 0x35282b50
046df 4c89542408                     mov        qword ptr [rsp + 8], r10
046e4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046ec e8ef005807                     call       0x7ff8d76cea60
046f1 e913c5ffff                     jmp        0x7ff8d014ae89
046f6 49ba20a9283500000000           movabs     r10, 0x3528a920
04700 4c89542408                     mov        qword ptr [rsp + 8], r10
04705 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0470d e8ce005807                     call       0x7ff8d76cea60
04712 e925c5ffff                     jmp        0x7ff8d014aebc
04717 48890424                       mov        qword ptr [rsp], rax
0471b e8c03e5807                     call       0x7ff8d76d2860
04720 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
0472a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0472e e82de2c11e                     call       0x7ff8eed6cbe0
04733 f4                             hlt        
04734 e8276c5807                     call       0x7ff8d76d55e0
04739 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04743 4883e4f0                       and        rsp, 0xfffffffffffffff0
04747 e814e2c11e                     call       0x7ff8eed6cbe0
0474c f4                             hlt        
0474d 49ba082406c4f87f0000           movabs     r10, 0x7ff8c4062408
04757 4c89542408                     mov        qword ptr [rsp + 8], r10
0475c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04764 e877005807                     call       0x7ff8d76cea60
04769 e980c6ffff                     jmp        0x7ff8d014b06e
0476e e8ed6b5807                     call       0x7ff8d76d55e0
04773 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
0477d 4883e4f0                       and        rsp, 0xfffffffffffffff0
04781 e8dae1c11e                     call       0x7ff8eed6cbe0
04786 f4                             hlt        
04787 49ba284714c4f87f0000           movabs     r10, 0x7ff8c4144728
04791 4c89542408                     mov        qword ptr [rsp + 8], r10
04796 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0479e e83d005807                     call       0x7ff8d76cea60
047a3 e90ac7ffff                     jmp        0x7ff8d014b132
047a8 49bad0325b3500000000           movabs     r10, 0x355b32d0
047b2 4c89542408                     mov        qword ptr [rsp + 8], r10
047b7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047bf e81c005807                     call       0x7ff8d76cea60
047c4 e927c7ffff                     jmp        0x7ff8d014b170
047c9 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
047d1 e80a235807                     call       0x7ff8d76d0d60
047d6 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
047e0 4883e4f0                       and        rsp, 0xfffffffffffffff0
047e4 e877e1c11e                     call       0x7ff8eed6cbe0
047e9 f4                             hlt        
047ea 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
047f2 e8e9225807                     call       0x7ff8d76d0d60
047f7 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04801 4883e4f0                       and        rsp, 0xfffffffffffffff0
04805 e856e1c11e                     call       0x7ff8eed6cbe0
0480a f4                             hlt        
0480b e8506b5807                     call       0x7ff8d76d55e0
04810 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
0481a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0481e e83de1c11e                     call       0x7ff8eed6cbe0
04823 f4                             hlt        
04824 49ba084c06c4f87f0000           movabs     r10, 0x7ff8c4064c08
0482e 4c89542408                     mov        qword ptr [rsp + 8], r10
04833 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0483b e8a0ff5707                     call       0x7ff8d76cea60
04840 e9b5c8ffff                     jmp        0x7ff8d014b37a
04845 49ba502b283500000000           movabs     r10, 0x35282b50
0484f 4c89542408                     mov        qword ptr [rsp + 8], r10
04854 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0485c e87fff5707                     call       0x7ff8d76cea60
04861 e9e1c8ffff                     jmp        0x7ff8d014b3c7
04866 49ba20a9283500000000           movabs     r10, 0x3528a920
04870 4c89542408                     mov        qword ptr [rsp + 8], r10
04875 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0487d e85eff5707                     call       0x7ff8d76cea60
04882 e9f8c8ffff                     jmp        0x7ff8d014b3ff
04887 49ba881506c4f87f0000           movabs     r10, 0x7ff8c4061588
04891 4c89542408                     mov        qword ptr [rsp + 8], r10
04896 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0489e e83dff5707                     call       0x7ff8d76cea60
048a3 e9f7c9ffff                     jmp        0x7ff8d014b51f
048a8 49ba284714c4f87f0000           movabs     r10, 0x7ff8c4144728
048b2 4c89542408                     mov        qword ptr [rsp + 8], r10
048b7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048bf e81cff5707                     call       0x7ff8d76cea60
048c4 e97fcaffff                     jmp        0x7ff8d014b5c8
048c9 49bad0325b3500000000           movabs     r10, 0x355b32d0
048d3 4c89542408                     mov        qword ptr [rsp + 8], r10
048d8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048e0 e8fbfe5707                     call       0x7ff8d76cea60
048e5 e99ccaffff                     jmp        0x7ff8d014b606
048ea 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
048f2 e8e9215807                     call       0x7ff8d76d0d60
048f7 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04901 4883e4f0                       and        rsp, 0xfffffffffffffff0
04905 e856e0c11e                     call       0x7ff8eed6cbe0
0490a f4                             hlt        
0490b 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04913 e8c8215807                     call       0x7ff8d76d0d60
04918 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04922 4883e4f0                       and        rsp, 0xfffffffffffffff0
04926 e835e0c11e                     call       0x7ff8eed6cbe0
0492b f4                             hlt        
0492c 49bab85e0cc4f87f0000           movabs     r10, 0x7ff8c40c5eb8
04936 4c89542408                     mov        qword ptr [rsp + 8], r10
0493b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04943 e898fe5707                     call       0x7ff8d76cea60
04948 e912cbffff                     jmp        0x7ff8d014b6df
0494d 49bae0d00cc4f87f0000           movabs     r10, 0x7ff8c40cd0e0
04957 4c89542408                     mov        qword ptr [rsp + 8], r10
0495c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04964 e877fe5707                     call       0x7ff8d76cea60
04969 e929cbffff                     jmp        0x7ff8d014b717
0496e 49bae0ac0fc4f87f0000           movabs     r10, 0x7ff8c40face0
04978 4c89542408                     mov        qword ptr [rsp + 8], r10
0497d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04985 e856fe5707                     call       0x7ff8d76cea60
0498a e968cbffff                     jmp        0x7ff8d014b777
0498f 49ba483106c4f87f0000           movabs     r10, 0x7ff8c4063148
04999 4c89542408                     mov        qword ptr [rsp + 8], r10
0499e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049a6 e835fe5707                     call       0x7ff8d76cea60
049ab e97fcbffff                     jmp        0x7ff8d014b7af
049b0 49bad06a0fc4f87f0000           movabs     r10, 0x7ff8c40f6ad0
049ba 4c89542408                     mov        qword ptr [rsp + 8], r10
049bf 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049c7 e814fe5707                     call       0x7ff8d76cea60
049cc e996cbffff                     jmp        0x7ff8d014b7e7
049d1 49ba084c06c4f87f0000           movabs     r10, 0x7ff8c4064c08
049db 4c89542408                     mov        qword ptr [rsp + 8], r10
049e0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049e8 e8f3fd5707                     call       0x7ff8d76cea60
049ed e98cccffff                     jmp        0x7ff8d014b8fe
049f2 49ba502b283500000000           movabs     r10, 0x35282b50
049fc 4c89542408                     mov        qword ptr [rsp + 8], r10
04a01 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a09 e8d2fd5707                     call       0x7ff8d76cea60
04a0e e9b1ccffff                     jmp        0x7ff8d014b944
04a13 49ba20a9283500000000           movabs     r10, 0x3528a920
04a1d 4c89542408                     mov        qword ptr [rsp + 8], r10
04a22 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a2a e8b1fd5707                     call       0x7ff8d76cea60
04a2f e9c8ccffff                     jmp        0x7ff8d014b97c
04a34 48890424                       mov        qword ptr [rsp], rax
04a38 e8a33b5807                     call       0x7ff8d76d2860
04a3d 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04a47 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a4b e810dfc11e                     call       0x7ff8eed6cbe0
04a50 f4                             hlt        
04a51 e80a695807                     call       0x7ff8d76d55e0
04a56 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04a60 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a64 e8f7dec11e                     call       0x7ff8eed6cbe0
04a69 f4                             hlt        
04a6a 49ba082406c4f87f0000           movabs     r10, 0x7ff8c4062408
04a74 4c89542408                     mov        qword ptr [rsp + 8], r10
04a79 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a81 e85afd5707                     call       0x7ff8d76cea60
04a86 e92bceffff                     jmp        0x7ff8d014bb36
04a8b e8d0685807                     call       0x7ff8d76d55e0
04a90 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04a9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a9e e8bddec11e                     call       0x7ff8eed6cbe0
04aa3 f4                             hlt        
04aa4 49ba284714c4f87f0000           movabs     r10, 0x7ff8c4144728
04aae 4c89542408                     mov        qword ptr [rsp + 8], r10
04ab3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04abb e820fd5707                     call       0x7ff8d76cea60
04ac0 e9b5ceffff                     jmp        0x7ff8d014bbfa
04ac5 49bad0325b3500000000           movabs     r10, 0x355b32d0
04acf 4c89542408                     mov        qword ptr [rsp + 8], r10
04ad4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04adc e8fffc5707                     call       0x7ff8d76cea60
04ae1 e9d2ceffff                     jmp        0x7ff8d014bc38
04ae6 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04aee e8ed1f5807                     call       0x7ff8d76d0d60
04af3 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04afd 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b01 e85adec11e                     call       0x7ff8eed6cbe0
04b06 f4                             hlt        
04b07 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04b0f e8cc1f5807                     call       0x7ff8d76d0d60
04b14 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04b1e 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b22 e839dec11e                     call       0x7ff8eed6cbe0
04b27 f4                             hlt        
04b28 e833685807                     call       0x7ff8d76d55e0
04b2d 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04b37 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b3b e820dec11e                     call       0x7ff8eed6cbe0
04b40 f4                             hlt        
04b41 49ba084c06c4f87f0000           movabs     r10, 0x7ff8c4064c08
04b4b 4c89542408                     mov        qword ptr [rsp + 8], r10
04b50 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b58 e883fc5707                     call       0x7ff8d76cea60
04b5d e960d0ffff                     jmp        0x7ff8d014be42
04b62 49ba502b283500000000           movabs     r10, 0x35282b50
04b6c 4c89542408                     mov        qword ptr [rsp + 8], r10
04b71 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b79 e862fc5707                     call       0x7ff8d76cea60
04b7e e98cd0ffff                     jmp        0x7ff8d014be8f
04b83 49ba20a9283500000000           movabs     r10, 0x3528a920
04b8d 4c89542408                     mov        qword ptr [rsp + 8], r10
04b92 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b9a e841fc5707                     call       0x7ff8d76cea60
04b9f e9a3d0ffff                     jmp        0x7ff8d014bec7
04ba4 49ba300442c4f87f0000           movabs     r10, 0x7ff8c4420430
04bae 4c89542408                     mov        qword ptr [rsp + 8], r10
04bb3 48c704240a020000               mov        qword ptr [rsp], 0x20a
04bbb e820fc5707                     call       0x7ff8d76cea60
04bc0 e948d1ffff                     jmp        0x7ff8d014bf8d
04bc5 90                             nop        
04bc6 90                             nop        
04bc7 e8140e5e07                     call       0x7ff8d772fc60
04bcc e978d2ffff                     jmp        0x7ff8d014c0c9
04bd1 90                             nop        
04bd2 90                             nop        
04bd3 90                             nop        
04bd4 90                             nop        
04bd5 90                             nop        
04bd6 90                             nop        
04bd7 e8040e5e07                     call       0x7ff8d772fc60
04bdc e940d4ffff                     jmp        0x7ff8d014c2a1
04be1 49bac02e42c4f87f0000           movabs     r10, 0x7ff8c4422ec0
04beb 4c89542408                     mov        qword ptr [rsp + 8], r10
04bf0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bf8 e8e3fb5707                     call       0x7ff8d76cea60
04bfd e9a0d4ffff                     jmp        0x7ff8d014c322
04c02 49bac8eb313500000000           movabs     r10, 0x3531ebc8
04c0c 4c89542408                     mov        qword ptr [rsp + 8], r10
04c11 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c19 e8c2fb5707                     call       0x7ff8d76cea60
04c1e e9fed4ffff                     jmp        0x7ff8d014c3a1
04c23 49ba7837273500000000           movabs     r10, 0x35273778
04c2d 4c89542408                     mov        qword ptr [rsp + 8], r10
04c32 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c3a e8a1fb5707                     call       0x7ff8d76cea60
04c3f e96fd5ffff                     jmp        0x7ff8d014c433
04c44 49baf0d6313500000000           movabs     r10, 0x3531d6f0
04c4e 4c89542408                     mov        qword ptr [rsp + 8], r10
04c53 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c5b e880fb5707                     call       0x7ff8d76cea60
04c60 e910d6ffff                     jmp        0x7ff8d014c4f5
04c65 49ba88ab423500000000           movabs     r10, 0x3542ab88
04c6f 4c89542408                     mov        qword ptr [rsp + 8], r10
04c74 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c7c e85ffb5707                     call       0x7ff8d76cea60
04c81 e958d6ffff                     jmp        0x7ff8d014c55e
04c86 49baf8a6423500000000           movabs     r10, 0x3542a6f8
04c90 4c89542408                     mov        qword ptr [rsp + 8], r10
04c95 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c9d e83efb5707                     call       0x7ff8d76cea60
04ca2 e96ad6ffff                     jmp        0x7ff8d014c591
04ca7 e8b4665807                     call       0x7ff8d76d55e0
04cac 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04cb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
04cba e8a1dcc11e                     call       0x7ff8eed6cbe0
04cbf f4                             hlt        
04cc0 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04cc8 e8131e5807                     call       0x7ff8d76d0d60
04ccd 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04cd7 4883e4f0                       and        rsp, 0xfffffffffffffff0
04cdb e880dcc11e                     call       0x7ff8eed6cbe0
04ce0 f4                             hlt        
04ce1 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04ce9 e8f21d5807                     call       0x7ff8d76d0d60
04cee 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04cf8 4883e4f0                       and        rsp, 0xfffffffffffffff0
04cfc e85fdcc11e                     call       0x7ff8eed6cbe0
04d01 f4                             hlt        
04d02 49ba300442c4f87f0000           movabs     r10, 0x7ff8c4420430
04d0c 4c89542408                     mov        qword ptr [rsp + 8], r10
04d11 48c70424aa020000               mov        qword ptr [rsp], 0x2aa
04d19 e8c2fa5707                     call       0x7ff8d76cea60
04d1e e951d7ffff                     jmp        0x7ff8d014c6f4
04d23 49ba881506c4f87f0000           movabs     r10, 0x7ff8c4061588
04d2d 4c89542408                     mov        qword ptr [rsp + 8], r10
04d32 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d3a e8a1fa5707                     call       0x7ff8d76cea60
04d3f e926d8ffff                     jmp        0x7ff8d014c7ea
04d44 e817665807                     call       0x7ff8d76d55e0
04d49 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04d53 4883e4f0                       and        rsp, 0xfffffffffffffff0
04d57 e804dcc11e                     call       0x7ff8eed6cbe0
04d5c f4                             hlt        
04d5d 49ba284714c4f87f0000           movabs     r10, 0x7ff8c4144728
04d67 4c89542408                     mov        qword ptr [rsp + 8], r10
04d6c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d74 e867fa5707                     call       0x7ff8d76cea60
04d79 e994d8ffff                     jmp        0x7ff8d014c892
04d7e 49bad0325b3500000000           movabs     r10, 0x355b32d0
04d88 4c89542408                     mov        qword ptr [rsp + 8], r10
04d8d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d95 e846fa5707                     call       0x7ff8d76cea60
04d9a e9acd8ffff                     jmp        0x7ff8d014c8cb
04d9f 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04da7 e8341d5807                     call       0x7ff8d76d0d60
04dac 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04db6 4883e4f0                       and        rsp, 0xfffffffffffffff0
04dba e8a1dbc11e                     call       0x7ff8eed6cbe0
04dbf f4                             hlt        
04dc0 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04dc8 e8131d5807                     call       0x7ff8d76d0d60
04dcd 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04dd7 4883e4f0                       and        rsp, 0xfffffffffffffff0
04ddb e880dbc11e                     call       0x7ff8eed6cbe0
04de0 f4                             hlt        
04de1 49bab85e0cc4f87f0000           movabs     r10, 0x7ff8c40c5eb8
04deb 4c89542408                     mov        qword ptr [rsp + 8], r10
04df0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04df8 e8e3f95707                     call       0x7ff8d76cea60
04dfd e917d9ffff                     jmp        0x7ff8d014c999
04e02 49bae0d00cc4f87f0000           movabs     r10, 0x7ff8c40cd0e0
04e0c 4c89542408                     mov        qword ptr [rsp + 8], r10
04e11 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e19 e8c2f95707                     call       0x7ff8d76cea60
04e1e e929d9ffff                     jmp        0x7ff8d014c9cc
04e23 49bae0ac0fc4f87f0000           movabs     r10, 0x7ff8c40face0
04e2d 4c89542408                     mov        qword ptr [rsp + 8], r10
04e32 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e3a e8a1f95707                     call       0x7ff8d76cea60
04e3f e96cd9ffff                     jmp        0x7ff8d014ca30
04e44 49ba483106c4f87f0000           movabs     r10, 0x7ff8c4063148
04e4e 4c89542408                     mov        qword ptr [rsp + 8], r10
04e53 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e5b e880f95707                     call       0x7ff8d76cea60
04e60 e986d9ffff                     jmp        0x7ff8d014ca6b
04e65 49bad06a0fc4f87f0000           movabs     r10, 0x7ff8c40f6ad0
04e6f 4c89542408                     mov        qword ptr [rsp + 8], r10
04e74 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e7c e85ff95707                     call       0x7ff8d76cea60
04e81 e998d9ffff                     jmp        0x7ff8d014ca9e
04e86 49ba084c06c4f87f0000           movabs     r10, 0x7ff8c4064c08
04e90 4c89542408                     mov        qword ptr [rsp + 8], r10
04e95 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e9d e83ef95707                     call       0x7ff8d76cea60
04ea2 e985daffff                     jmp        0x7ff8d014cbac
04ea7 49ba502b283500000000           movabs     r10, 0x35282b50
04eb1 4c89542408                     mov        qword ptr [rsp + 8], r10
04eb6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ebe e81df95707                     call       0x7ff8d76cea60
04ec3 e9a5daffff                     jmp        0x7ff8d014cbed
04ec8 49ba20a9283500000000           movabs     r10, 0x3528a920
04ed2 4c89542408                     mov        qword ptr [rsp + 8], r10
04ed7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04edf e8fcf85707                     call       0x7ff8d76cea60
04ee4 e9b7daffff                     jmp        0x7ff8d014cc20
04ee9 48890424                       mov        qword ptr [rsp], rax
04eed e8ee365807                     call       0x7ff8d76d2860
04ef2 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04efc 4883e4f0                       and        rsp, 0xfffffffffffffff0
04f00 e85bdac11e                     call       0x7ff8eed6cbe0
04f05 f4                             hlt        
04f06 e855645807                     call       0x7ff8d76d55e0
04f0b 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04f15 4883e4f0                       and        rsp, 0xfffffffffffffff0
04f19 e842dac11e                     call       0x7ff8eed6cbe0
04f1e f4                             hlt        
04f1f 49ba082406c4f87f0000           movabs     r10, 0x7ff8c4062408
04f29 4c89542408                     mov        qword ptr [rsp + 8], r10
04f2e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f36 e8a5f85707                     call       0x7ff8d76cea60
04f3b e90edcffff                     jmp        0x7ff8d014cdce
04f40 49ba284714c4f87f0000           movabs     r10, 0x7ff8c4144728
04f4a 4c89542408                     mov        qword ptr [rsp + 8], r10
04f4f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f57 e884f85707                     call       0x7ff8d76cea60
04f5c e9a6dcffff                     jmp        0x7ff8d014ce87
04f61 49bad0325b3500000000           movabs     r10, 0x355b32d0
04f6b 4c89542408                     mov        qword ptr [rsp + 8], r10
04f70 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f78 e863f85707                     call       0x7ff8d76cea60
04f7d e9ccdcffff                     jmp        0x7ff8d014cece
04f82 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04f8a e8511b5807                     call       0x7ff8d76d0d60
04f8f 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04f99 4883e4f0                       and        rsp, 0xfffffffffffffff0
04f9d e8bed9c11e                     call       0x7ff8eed6cbe0
04fa2 f4                             hlt        
04fa3 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04fab e8301b5807                     call       0x7ff8d76d0d60
04fb0 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04fba 4883e4f0                       and        rsp, 0xfffffffffffffff0
04fbe e89dd9c11e                     call       0x7ff8eed6cbe0
04fc3 f4                             hlt        
04fc4 e897635807                     call       0x7ff8d76d55e0
04fc9 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
04fd3 4883e4f0                       and        rsp, 0xfffffffffffffff0
04fd7 e884d9c11e                     call       0x7ff8eed6cbe0
04fdc f4                             hlt        
04fdd 49ba084c06c4f87f0000           movabs     r10, 0x7ff8c4064c08
04fe7 4c89542408                     mov        qword ptr [rsp + 8], r10
04fec 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ff4 e8e7f75707                     call       0x7ff8d76cea60
04ff9 e95cdeffff                     jmp        0x7ff8d014d0da
04ffe 49ba502b283500000000           movabs     r10, 0x35282b50
05008 4c89542408                     mov        qword ptr [rsp + 8], r10
0500d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05015 e8c6f75707                     call       0x7ff8d76cea60
0501a e988deffff                     jmp        0x7ff8d014d127
0501f 49ba20a9283500000000           movabs     r10, 0x3528a920
05029 4c89542408                     mov        qword ptr [rsp + 8], r10
0502e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05036 e8a5f75707                     call       0x7ff8d76cea60
0503b e99fdeffff                     jmp        0x7ff8d014d15f
05040 49ba300442c4f87f0000           movabs     r10, 0x7ff8c4420430
0504a 4c89542408                     mov        qword ptr [rsp + 8], r10
0504f 48c70424e8020000               mov        qword ptr [rsp], 0x2e8
05057 e884f75707                     call       0x7ff8d76cea60
0505c e941dfffff                     jmp        0x7ff8d014d222
05061 49bac02e42c4f87f0000           movabs     r10, 0x7ff8c4422ec0
0506b 4c89542408                     mov        qword ptr [rsp + 8], r10
05070 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05078 e863f75707                     call       0x7ff8d76cea60
0507d e900e0ffff                     jmp        0x7ff8d014d302
05082 49bac8eb313500000000           movabs     r10, 0x3531ebc8
0508c 4c89542408                     mov        qword ptr [rsp + 8], r10
05091 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05099 e842f75707                     call       0x7ff8d76cea60
0509e e95ee0ffff                     jmp        0x7ff8d014d381
050a3 49ba7837273500000000           movabs     r10, 0x35273778
050ad 4c89542408                     mov        qword ptr [rsp + 8], r10
050b2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050ba e821f75707                     call       0x7ff8d76cea60
050bf e9cfe0ffff                     jmp        0x7ff8d014d413
050c4 49baf0d6313500000000           movabs     r10, 0x3531d6f0
050ce 4c89542408                     mov        qword ptr [rsp + 8], r10
050d3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050db e800f75707                     call       0x7ff8d76cea60
050e0 e970e1ffff                     jmp        0x7ff8d014d4d5
050e5 49ba88ab423500000000           movabs     r10, 0x3542ab88
050ef 4c89542408                     mov        qword ptr [rsp + 8], r10
050f4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050fc e8dff65707                     call       0x7ff8d76cea60
05101 e9b8e1ffff                     jmp        0x7ff8d014d53e
05106 49baf8a6423500000000           movabs     r10, 0x3542a6f8
05110 4c89542408                     mov        qword ptr [rsp + 8], r10
05115 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0511d e8bef65707                     call       0x7ff8d76cea60
05122 e9cae1ffff                     jmp        0x7ff8d014d571
05127 e834625807                     call       0x7ff8d76d55e0
0512c 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
05136 4883e4f0                       and        rsp, 0xfffffffffffffff0
0513a e821d8c11e                     call       0x7ff8eed6cbe0
0513f f4                             hlt        
05140 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05148 e893195807                     call       0x7ff8d76d0d60
0514d 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
05157 4883e4f0                       and        rsp, 0xfffffffffffffff0
0515b e800d8c11e                     call       0x7ff8eed6cbe0
05160 f4                             hlt        
05161 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05169 e872195807                     call       0x7ff8d76d0d60
0516e 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
05178 4883e4f0                       and        rsp, 0xfffffffffffffff0
0517c e8dfd7c11e                     call       0x7ff8eed6cbe0
05181 f4                             hlt        
05182 49ba300442c4f87f0000           movabs     r10, 0x7ff8c4420430
0518c 4c89542408                     mov        qword ptr [rsp + 8], r10
05191 48c7042420030000               mov        qword ptr [rsp], 0x320
05199 e842f65707                     call       0x7ff8d76cea60
0519e e9b1e2ffff                     jmp        0x7ff8d014d6d4
051a3 49ba881506c4f87f0000           movabs     r10, 0x7ff8c4061588
051ad 4c89542408                     mov        qword ptr [rsp + 8], r10
051b2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
051ba e821f65707                     call       0x7ff8d76cea60
051bf e971e3ffff                     jmp        0x7ff8d014d7b5
051c4 e897615807                     call       0x7ff8d76d55e0
051c9 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
051d3 4883e4f0                       and        rsp, 0xfffffffffffffff0
051d7 e884d7c11e                     call       0x7ff8eed6cbe0
051dc f4                             hlt        
051dd 49ba284714c4f87f0000           movabs     r10, 0x7ff8c4144728
051e7 4c89542408                     mov        qword ptr [rsp + 8], r10
051ec 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
051f4 e8e7f55707                     call       0x7ff8d76cea60
051f9 e9dee3ffff                     jmp        0x7ff8d014d85c
051fe 49bad0325b3500000000           movabs     r10, 0x355b32d0
05208 4c89542408                     mov        qword ptr [rsp + 8], r10
0520d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05215 e8c6f55707                     call       0x7ff8d76cea60
0521a e9f6e3ffff                     jmp        0x7ff8d014d895
0521f 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05227 e8b4185807                     call       0x7ff8d76d0d60
0522c 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
05236 4883e4f0                       and        rsp, 0xfffffffffffffff0
0523a e821d7c11e                     call       0x7ff8eed6cbe0
0523f f4                             hlt        
05240 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05248 e893185807                     call       0x7ff8d76d0d60
0524d 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
05257 4883e4f0                       and        rsp, 0xfffffffffffffff0
0525b e800d7c11e                     call       0x7ff8eed6cbe0
05260 f4                             hlt        
05261 49bab85e0cc4f87f0000           movabs     r10, 0x7ff8c40c5eb8
0526b 4c89542408                     mov        qword ptr [rsp + 8], r10
05270 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05278 e863f55707                     call       0x7ff8d76cea60
0527d e959e4ffff                     jmp        0x7ff8d014d95b
05282 49bae0d00cc4f87f0000           movabs     r10, 0x7ff8c40cd0e0
0528c 4c89542408                     mov        qword ptr [rsp + 8], r10
05291 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05299 e842f55707                     call       0x7ff8d76cea60
0529e e96be4ffff                     jmp        0x7ff8d014d98e
052a3 49bae0ac0fc4f87f0000           movabs     r10, 0x7ff8c40face0
052ad 4c89542408                     mov        qword ptr [rsp + 8], r10
052b2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052ba e821f55707                     call       0x7ff8d76cea60
052bf e9a1e4ffff                     jmp        0x7ff8d014d9e5
052c4 49ba483106c4f87f0000           movabs     r10, 0x7ff8c4063148
052ce 4c89542408                     mov        qword ptr [rsp + 8], r10
052d3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052db e800f55707                     call       0x7ff8d76cea60
052e0 e9b6e4ffff                     jmp        0x7ff8d014da1b
052e5 49bad06a0fc4f87f0000           movabs     r10, 0x7ff8c40f6ad0
052ef 4c89542408                     mov        qword ptr [rsp + 8], r10
052f4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052fc e8dff45707                     call       0x7ff8d76cea60
05301 e9c8e4ffff                     jmp        0x7ff8d014da4e
05306 49ba084c06c4f87f0000           movabs     r10, 0x7ff8c4064c08
05310 4c89542408                     mov        qword ptr [rsp + 8], r10
05315 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0531d e8bef45707                     call       0x7ff8d76cea60
05322 e9b5e5ffff                     jmp        0x7ff8d014db5c
05327 49ba502b283500000000           movabs     r10, 0x35282b50
05331 4c89542408                     mov        qword ptr [rsp + 8], r10
05336 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0533e e89df45707                     call       0x7ff8d76cea60
05343 e9d5e5ffff                     jmp        0x7ff8d014db9d
05348 49ba20a9283500000000           movabs     r10, 0x3528a920
05352 4c89542408                     mov        qword ptr [rsp + 8], r10
05357 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0535f e87cf45707                     call       0x7ff8d76cea60
05364 e9e7e5ffff                     jmp        0x7ff8d014dbd0
05369 48890424                       mov        qword ptr [rsp], rax
0536d e86e325807                     call       0x7ff8d76d2860
05372 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
0537c 4883e4f0                       and        rsp, 0xfffffffffffffff0
05380 e8dbd5c11e                     call       0x7ff8eed6cbe0
05385 f4                             hlt        
05386 e8d55f5807                     call       0x7ff8d76d55e0
0538b 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
05395 4883e4f0                       and        rsp, 0xfffffffffffffff0
05399 e8c2d5c11e                     call       0x7ff8eed6cbe0
0539e f4                             hlt        
0539f 49ba082406c4f87f0000           movabs     r10, 0x7ff8c4062408
053a9 4c89542408                     mov        qword ptr [rsp + 8], r10
053ae 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053b6 e825f45707                     call       0x7ff8d76cea60
053bb e93ee7ffff                     jmp        0x7ff8d014dd7e
053c0 49ba284714c4f87f0000           movabs     r10, 0x7ff8c4144728
053ca 4c89542408                     mov        qword ptr [rsp + 8], r10
053cf 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053d7 e804f45707                     call       0x7ff8d76cea60
053dc e9d6e7ffff                     jmp        0x7ff8d014de37
053e1 49bad0325b3500000000           movabs     r10, 0x355b32d0
053eb 4c89542408                     mov        qword ptr [rsp + 8], r10
053f0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053f8 e8e3f35707                     call       0x7ff8d76cea60
053fd e9f9e7ffff                     jmp        0x7ff8d014de7b
05402 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0540a e8d1165807                     call       0x7ff8d76d0d60
0540f 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
05419 4883e4f0                       and        rsp, 0xfffffffffffffff0
0541d e83ed5c11e                     call       0x7ff8eed6cbe0
05422 f4                             hlt        
05423 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0542b e8b0165807                     call       0x7ff8d76d0d60
05430 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
0543a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0543e e81dd5c11e                     call       0x7ff8eed6cbe0
05443 f4                             hlt        
05444 e8175f5807                     call       0x7ff8d76d55e0
05449 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
05453 4883e4f0                       and        rsp, 0xfffffffffffffff0
05457 e804d5c11e                     call       0x7ff8eed6cbe0
0545c f4                             hlt        
0545d 49ba084c06c4f87f0000           movabs     r10, 0x7ff8c4064c08
05467 4c89542408                     mov        qword ptr [rsp + 8], r10
0546c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05474 e867f35707                     call       0x7ff8d76cea60
05479 e984e9ffff                     jmp        0x7ff8d014e082
0547e 49ba502b283500000000           movabs     r10, 0x35282b50
05488 4c89542408                     mov        qword ptr [rsp + 8], r10
0548d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05495 e846f35707                     call       0x7ff8d76cea60
0549a e9b0e9ffff                     jmp        0x7ff8d014e0cf
0549f 49ba20a9283500000000           movabs     r10, 0x3528a920
054a9 4c89542408                     mov        qword ptr [rsp + 8], r10
054ae 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
054b6 e825f35707                     call       0x7ff8d76cea60
054bb e9c7e9ffff                     jmp        0x7ff8d014e107
054c0 49ba300442c4f87f0000           movabs     r10, 0x7ff8c4420430
054ca 4c89542408                     mov        qword ptr [rsp + 8], r10
054cf 48c704245a030000               mov        qword ptr [rsp], 0x35a
054d7 e804f35707                     call       0x7ff8d76cea60
054dc e97eeaffff                     jmp        0x7ff8d014e1df
054e1 90                             nop        
054e2 90                             nop        
054e3 90                             nop        
054e4 90                             nop        
054e5 90                             nop        
054e6 90                             nop        
054e7 e8f4045e07                     call       0x7ff8d772fc60
054ec e985ecffff                     jmp        0x7ff8d014e3f6
054f1 49ba17e414d0f87f0000           movabs     r10, 0x7ff8d014e417
054fb 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
05502 e9d92b5e07                     jmp        0x7ff8d7732360
05507 48ba0000000000000000           movabs     rdx, 0
05511 b8000f050a                     mov        eax, 0xa050f00
05516 e8c5075807                     call       0x7ff8d76cff60
0551b e9a8ecffff                     jmp        0x7ff8d014e448
05520 e83b5e5807                     call       0x7ff8d76d55e0
05525 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
0552f 4883e4f0                       and        rsp, 0xfffffffffffffff0
05533 e828d4c11e                     call       0x7ff8eed6cbe0
05538 f4                             hlt        
05539 488bd2                         mov        rdx, rdx
0553c e81f4e5807                     call       0x7ff8d76d45e0
05541 e9d1ecffff                     jmp        0x7ff8d014e497
05546 48ba0000000000000000           movabs     rdx, 0
05550 b8000f050a                     mov        eax, 0xa050f00
05555 e886f95707                     call       0x7ff8d76cf160
0555a e9b9ecffff                     jmp        0x7ff8d014e498
0555f 48ba0000000000000000           movabs     rdx, 0
05569 b8000f050a                     mov        eax, 0xa050f00
0556e e86d075807                     call       0x7ff8d76cff60
05573 e938edffff                     jmp        0x7ff8d014e530
05578 e8e35d5807                     call       0x7ff8d76d55e0
0557d 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
05587 4883e4f0                       and        rsp, 0xfffffffffffffff0
0558b e8d0d3c11e                     call       0x7ff8eed6cbe0
05590 f4                             hlt        
05591 488bd2                         mov        rdx, rdx
05594 e8c74d5807                     call       0x7ff8d76d45e0
05599 e961edffff                     jmp        0x7ff8d014e57f
0559e 48ba0000000000000000           movabs     rdx, 0
055a8 b8000f050a                     mov        eax, 0xa050f00
055ad e82e075807                     call       0x7ff8d76cff60
055b2 e999edffff                     jmp        0x7ff8d014e5d0
055b7 e8a45d5807                     call       0x7ff8d76d55e0
055bc 48bfb56095edf87f0000           movabs     rdi, 0x7ff8ed9560b5
055c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
055ca e891d3c11e                     call       0x7ff8eed6cbe0
055cf f4                             hlt        
055d0 488bd2                         mov        rdx, rdx
055d3 e8884d5807                     call       0x7ff8d76d45e0
055d8 e9c2edffff                     jmp        0x7ff8d014e61f
055dd 498b8708060000                 mov        rax, qword ptr [r15 + 0x608]
055e4 49c7870806000000000000         mov        qword ptr [r15 + 0x608], 0
055ef 49c7871006000000000000         mov        qword ptr [r15 + 0x610], 0
055fa 4881c450020000                 add        rsp, 0x250
05601 5d                             pop        rbp
05602 e9d96c5807                     jmp        0x7ff8d76d6560
05607 f4                             hlt        
