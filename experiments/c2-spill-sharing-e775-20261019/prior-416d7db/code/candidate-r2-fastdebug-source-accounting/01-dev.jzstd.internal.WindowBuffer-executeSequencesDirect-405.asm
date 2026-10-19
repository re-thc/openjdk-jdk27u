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
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c0a45c07                   jne        0x7f63db742d60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ec50020000                 sub        rsp, 0x250
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 7405                           je         0x7f63d41788bf
0003a e821a95b07                     call       0x7f63db7331e0
0003f 4889b42448010000               mov        qword ptr [rsp + 0x148], rsi
00047 4889942468010000               mov        qword ptr [rsp + 0x168], rdx
0004f 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
00056 4c89842428010000               mov        qword ptr [rsp + 0x128], r8
0005e 4c898c2420010000               mov        qword ptr [rsp + 0x120], r9
00066 89bc2430010000                 mov        dword ptr [rsp + 0x130], edi
0006d 48bbd0d263c8637f0000           movabs     rbx, 0x7f63c863d2d0
00077 8b4378                         mov        eax, dword ptr [rbx + 0x78]
0007a 83c002                         add        eax, 2
0007d 894378                         mov        dword ptr [rbx + 0x78], eax
00080 25fe070000                     and        eax, 0x7fe
00085 85c0                           test       eax, eax
00087 0f84ac430000                   je         0x7f63d417ccb9
0008d 48bbd0d263c8637f0000           movabs     rbx, 0x7f63c863d2d0
00097 ff83b0000000                   inc        dword ptr [rbx + 0xb0]
0009d 8b9c2460020000                 mov        ebx, dword ptr [rsp + 0x260]
000a4 8b4644                         mov        eax, dword ptr [rsi + 0x44]
000a7 4c3b252a901a21                 cmp        r12, qword ptr [rip + 0x211a902a]
000ae 0f8414000000                   je         0x7f63d4178948
000b4 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
000be 4883e4f0                       and        rsp, 0xfffffffffffffff0
000c2 e8b97f5b20                     call       0x7f63f4730900
000c7 f4                             hlt        
000c8 4889842438010000               mov        qword ptr [rsp + 0x138], rax
000d0 448b5e3c                       mov        r11d, dword ptr [rsi + 0x3c]
000d4 448b6e38                       mov        r13d, dword ptr [rsi + 0x38]
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
00102 48b8d0d263c8637f0000           movabs     rax, 0x7f63c863d2d0
0010c b900010000                     mov        ecx, 0x100
00111 7f05                           jg         0x7f63d4178998
00113 b910010000                     mov        ecx, 0x110
00118 44899c2440010000               mov        dword ptr [rsp + 0x140], r11d
00120 4c8b1c08                       mov        r11, qword ptr [rax + rcx]
00124 4d8d5b01                       lea        r11, [r11 + 1]
00128 4c891c08                       mov        qword ptr [rax + rcx], r11
0012c 0f8f5f420000                   jg         0x7f63d417cc11
00132 4863db                         movsxd     rbx, ebx
00135 488b4e20                       mov        rcx, qword ptr [rsi + 0x20]
00139 482bcf                         sub        rcx, rdi
0013c 483bcb                         cmp        rcx, rbx
0013f 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
00149 b830010000                     mov        eax, 0x130
0014e 7c05                           jl         0x7f63d41789d5
00150 b820010000                     mov        eax, 0x120
00155 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
00159 4d8d5b01                       lea        r11, [r11 + 1]
0015d 4c891c01                       mov        qword ptr [rcx + rax], r11
00161 0f8c2a420000                   jl         0x7f63d417cc11
00167 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
00171 ff8160010000                   inc        dword ptr [rcx + 0x160]
00177 b900000000                     mov        ecx, 0
0017c 498bc0                         mov        rax, r8
0017f 483bc1                         cmp        rax, rcx
00182 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
0018c b870010000                     mov        eax, 0x170
00191 7505                           jne        0x7f63d4178a18
00193 b880010000                     mov        eax, 0x180
00198 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
0019c 4d8d5b01                       lea        r11, [r11 + 1]
001a0 4c891c01                       mov        qword ptr [rcx + rax], r11
001a4 0f8531000000                   jne        0x7f63d4178a5b
001aa 4803df                         add        rbx, rdi
001ad 498bc9                         mov        rcx, r9
001b0 483bcb                         cmp        rcx, rbx
001b3 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
001bd bfa0010000                     mov        edi, 0x1a0
001c2 7d05                           jge        0x7f63d4178a49
001c4 bf90010000                     mov        edi, 0x190
001c9 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
001cd 488d5b01                       lea        rbx, [rbx + 1]
001d1 48891c39                       mov        qword ptr [rcx + rdi], rbx
001d5 0f8d0a000000                   jge        0x7f63d4178a65
001db bf00000000                     mov        edi, 0
001e0 e915000000                     jmp        0x7f63d4178a7a
001e5 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
001ef ff81b0010000                   inc        dword ptr [rcx + 0x1b0]
001f5 bf01000000                     mov        edi, 1
001fa 4d2bc6                         sub        r8, r14
001fd 4c89842480010000               mov        qword ptr [rsp + 0x180], r8
00205 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
0020f 488381c801000001               add        qword ptr [rcx + 0x1c8], 1
00217 48b9b84965c8637f0000           movabs     rcx, 0x7f63c86549b8
00221 8b5978                         mov        ebx, dword ptr [rcx + 0x78]
00224 83c302                         add        ebx, 2
00227 895978                         mov        dword ptr [rcx + 0x78], ebx
0022a 81e3feff1f00                   and        ebx, 0x1ffffe
00230 85db                           test       ebx, ebx
00232 0f8422420000                   je         0x7f63d417ccda
00238 48b9ffffffffffffff7f           movabs     rcx, 0x7fffffffffffffff
00242 493bc9                         cmp        rcx, r9
00245 48b9b84965c8637f0000           movabs     rcx, 0x7f63c86549b8
0024f bbc0000000                     mov        ebx, 0xc0
00254 7d05                           jge        0x7f63d4178adb
00256 bbb0000000                     mov        ebx, 0xb0
0025b 488b0419                       mov        rax, qword ptr [rcx + rbx]
0025f 488d4001                       lea        rax, [rax + 1]
00263 48890419                       mov        qword ptr [rcx + rbx], rax
00267 0f8d0f000000                   jge        0x7f63d4178afc
0026d 49b9ffffffffffffff7f           movabs     r9, 0x7fffffffffffffff
00277 e910000000                     jmp        0x7f63d4178b0c
0027c 48b9b84965c8637f0000           movabs     rcx, 0x7f63c86549b8
00286 ff81d0000000                   inc        dword ptr [rcx + 0xd0]
0028c 448b9c2440010000               mov        r11d, dword ptr [rsp + 0x140]
00294 498bdd                         mov        rbx, r13
00297 83eb20                         sub        ebx, 0x20
0029a 899c2458010000                 mov        dword ptr [rsp + 0x158], ebx
002a1 8b4208                         mov        eax, dword ptr [rdx + 8]
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
00312 48bfd0d263c8637f0000           movabs     rdi, 0x7f63c863d2d0
0031c b8d8010000                     mov        eax, 0x1d8
00321 7d05                           jge        0x7f63d4178ba8
00323 b8e8010000                     mov        eax, 0x1e8
00328 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
0032c 4d8d5b01                       lea        r11, [r11 + 1]
00330 4c891c07                       mov        qword ptr [rdi + rax], r11
00334 0f8d5a3d0000                   jge        0x7f63d417c914
0033a 413b5008                       cmp        edx, dword ptr [r8 + 8]
0033e 0f8382410000                   jae        0x7f63d417cd46
00344 4863fa                         movsxd     rdi, edx
00347 498b44f810                     mov        rax, qword ptr [r8 + rdi*8 + 0x10]
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
00387 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
00391 41b8f8010000                   mov        r8d, 0x1f8
00397 7d06                           jge        0x7f63d4178c1f
00399 41b808020000                   mov        r8d, 0x208
0039f 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003a3 4d8d6d01                       lea        r13, [r13 + 1]
003a7 4e892c01                       mov        qword ptr [rcx + r8], r13
003ab 0f8d15000000                   jge        0x7f63d4178c46
003b1 413b5108                       cmp        edx, dword ptr [r9 + 8]
003b5 0f835f410000                   jae        0x7f63d417cd9a
003bb 4863ca                         movsxd     rcx, edx
003be 418b4c890c                     mov        ecx, dword ptr [r9 + rcx*4 + 0xc]
003c3 488bc1                         mov        rax, rcx
003c6 85ff                           test       edi, edi
003c8 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
003d2 41b818020000                   mov        r8d, 0x218
003d8 7406                           je         0x7f63d4178c60
003da 41b828020000                   mov        r8d, 0x228
003e0 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003e4 4d8d6d01                       lea        r13, [r13 + 1]
003e8 4e892c01                       mov        qword ptr [rcx + r8], r13
003ec 0f8431000000                   je         0x7f63d4178ca3
003f2 498bcb                         mov        rcx, r11
003f5 2bce                           sub        ecx, esi
003f7 3bf9                           cmp        edi, ecx
003f9 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
00403 41b848020000                   mov        r8d, 0x248
00409 7f06                           jg         0x7f63d4178c91
0040b 41b838020000                   mov        r8d, 0x238
00411 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00415 4d8d6d01                       lea        r13, [r13 + 1]
00419 4e892c01                       mov        qword ptr [rcx + r8], r13
0041d 0f8fc63e0000                   jg         0x7f63d417cb69
00423 83f803                         cmp        eax, 3
00426 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
00430 41b868020000                   mov        r8d, 0x268
00436 7e06                           jle        0x7f63d4178cbe
00438 41b878020000                   mov        r8d, 0x278
0043e 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00442 4d8d6d01                       lea        r13, [r13 + 1]
00446 4e892c01                       mov        qword ptr [rcx + r8], r13
0044a 0f8e59000000                   jle        0x7f63d4178d29
00450 83e803                         sub        eax, 3
00453 837b0801                       cmp        dword ptr [rbx + 8], 1
00457 0f8611410000                   jbe        0x7f63d417cdee
0045d 8b4b10                         mov        ecx, dword ptr [rbx + 0x10]
00460 837b0802                       cmp        dword ptr [rbx + 8], 2
00464 0f862a410000                   jbe        0x7f63d417ce14
0046a 894b14                         mov        dword ptr [rbx + 0x14], ecx
0046d 8b4b0c                         mov        ecx, dword ptr [rbx + 0xc]
00470 894b10                         mov        dword ptr [rbx + 0x10], ecx
00473 89430c                         mov        dword ptr [rbx + 0xc], eax
00476 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
00480 ff8188020000                   inc        dword ptr [rcx + 0x288]
00486 89942444010000                 mov        dword ptr [rsp + 0x144], edx
0048d 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
00494 4c8bb42488010000               mov        r14, qword ptr [rsp + 0x188]
0049c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
004a4 e952000000                     jmp        0x7f63d4178d7b
004a9 89942444010000                 mov        dword ptr [rsp + 0x144], edx
004b0 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
004b7 49b8d0d263c8637f0000           movabs     r8, 0x7f63c863d2d0
004c1 498380a002000001               add        qword ptr [r8 + 0x2a0], 1
004c9 488bf3                         mov        rsi, rbx
004cc 488bd0                         mov        rdx, rax
004cf 488bcf                         mov        rcx, rdi
004d2 90                             nop        
004d3 90                             nop        
004d4 90                             nop        
004d5 90                             nop        
004d6 90                             nop        
004d7 e804af5c07                     call       0x7f63db743c60
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
00510 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
0051a b9c0020000                     mov        ecx, 0x2c0
0051f 7d05                           jge        0x7f63d4178da6
00521 b9b0020000                     mov        ecx, 0x2b0
00526 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0052a 4d8d4001                       lea        r8, [r8 + 1]
0052e 4c89040a                       mov        qword ptr [rdx + rcx], r8
00532 0f8d15000000                   jge        0x7f63d4178dcd
00538 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00540 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00548 e9ad000000                     jmp        0x7f63d4178e7a
0054d 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00555 4585ed                         test       r13d, r13d
00558 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
00562 b9d0020000                     mov        ecx, 0x2d0
00567 7505                           jne        0x7f63d4178dee
00569 b9e0020000                     mov        ecx, 0x2e0
0056e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
00572 4d8d4001                       lea        r8, [r8 + 1]
00576 4c89040a                       mov        qword ptr [rdx + rcx], r8
0057a 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00582 0f8568000000                   jne        0x7f63d4178e70
00588 498bd3                         mov        rdx, r11
0058b 03d7                           add        edx, edi
0058d 2bd0                           sub        edx, eax
0058f 4863d2                         movsxd     rdx, edx
00592 493bd0                         cmp        rdx, r8
00595 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
0059f b9f0020000                     mov        ecx, 0x2f0
005a4 7c05                           jl         0x7f63d4178e2b
005a6 b900030000                     mov        ecx, 0x300
005ab 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
005af 4d8d4901                       lea        r9, [r9 + 1]
005b3 4c890c0a                       mov        qword ptr [rdx + rcx], r9
005b7 0f8c3d000000                   jl         0x7f63d4178e7a
005bd 4c8b8c2450010000               mov        r9, qword ptr [rsp + 0x150]
005c5 4c3bcb                         cmp        r9, rbx
005c8 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
005d2 b920030000                     mov        ecx, 0x320
005d7 7c05                           jl         0x7f63d4178e5e
005d9 b910030000                     mov        ecx, 0x310
005de 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
005e2 4d8d4901                       lea        r9, [r9 + 1]
005e6 4c890c0a                       mov        qword ptr [rdx + rcx], r9
005ea 0f8c0a000000                   jl         0x7f63d4178e7a
005f0 ba00000000                     mov        edx, 0
005f5 e915000000                     jmp        0x7f63d4178e8f
005fa 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
00604 ff8230030000                   inc        dword ptr [rdx + 0x330]
0060a ba01000000                     mov        edx, 1
0060f 48899c2498010000               mov        qword ptr [rsp + 0x198], rbx
00617 85c0                           test       eax, eax
00619 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
00623 41b948030000                   mov        r9d, 0x348
00629 7e06                           jle        0x7f63d4178eb1
0062b 41b958030000                   mov        r9d, 0x358
00631 4a8b1c09                       mov        rbx, qword ptr [rcx + r9]
00635 488d5b01                       lea        rbx, [rbx + 1]
00639 4a891c09                       mov        qword ptr [rcx + r9], rbx
0063d 0f8ea7390000                   jle        0x7f63d417c86a
00643 85d2                           test       edx, edx
00645 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
0064f b978030000                     mov        ecx, 0x378
00654 7505                           jne        0x7f63d4178edb
00656 b968030000                     mov        ecx, 0x368
0065b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0065f 4d8d4901                       lea        r9, [r9 + 1]
00663 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00667 0f857d390000                   jne        0x7f63d417c86a
0066d 498bdb                         mov        rbx, r11
00670 03df                           add        ebx, edi
00672 899c24a0010000                 mov        dword ptr [rsp + 0x1a0], ebx
00679 488bf3                         mov        rsi, rbx
0067c 03b42478010000                 add        esi, dword ptr [rsp + 0x178]
00683 3bb42458010000                 cmp        esi, dword ptr [rsp + 0x158]
0068a 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
00694 ba30040000                     mov        edx, 0x430
00699 7f05                           jg         0x7f63d4178f20
0069b ba40040000                     mov        edx, 0x440
006a0 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
006a4 488d4901                       lea        rcx, [rcx + 1]
006a8 48890c16                       mov        qword ptr [rsi + rdx], rcx
006ac 0f8f3f000000                   jg         0x7f63d4178f71
006b2 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
006b9 03f7                           add        esi, edi
006bb 89b424a4010000                 mov        dword ptr [rsp + 0x1a4], esi
006c2 3bb4245c010000                 cmp        esi, dword ptr [rsp + 0x15c]
006c9 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
006d3 b960040000                     mov        ecx, 0x460
006d8 7e05                           jle        0x7f63d4178f5f
006da b950040000                     mov        ecx, 0x450
006df 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
006e3 4d8d4901                       lea        r9, [r9 + 1]
006e7 4c890c0a                       mov        qword ptr [rdx + rcx], r9
006eb 0f8e76000000                   jle        0x7f63d4178fe7
006f1 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
006f9 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
00701 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
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
00747 e894ac5c07                     call       0x7f63db743c60
0074c 0f1f840044080001               nop        dword ptr [rax + rax + 0x1000844]
00754 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
0075b 03b4247c010000                 add        esi, dword ptr [rsp + 0x17c]
00762 e901380000                     jmp        0x7f63d417c7e8
00767 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
0076f 83ff10                         cmp        edi, 0x10
00772 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
0077c b970040000                     mov        ecx, 0x470
00781 7f05                           jg         0x7f63d4179008
00783 b980040000                     mov        ecx, 0x480
00788 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0078c 4d8d4901                       lea        r9, [r9 + 1]
00790 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00794 0f8f6f0a0000                   jg         0x7f63d4179a89
0079a 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
007a4 4883829004000001               add        qword ptr [rdx + 0x490], 1
007ac 48ba08f664c8637f0000           movabs     rdx, 0x7f63c864f608
007b6 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
007b9 83c102                         add        ecx, 2
007bc 894a78                         mov        dword ptr [rdx + 0x78], ecx
007bf 81e1feff1f00                   and        ecx, 0x1ffffe
007c5 85c9                           test       ecx, ecx
007c7 0f84ed3d0000                   je         0x7f63d417ce3a
007cd 48ba780238e300000000           movabs     rdx, 0xe3380278
007d7 48b908f664c8637f0000           movabs     rcx, 0x7f63c864f608
007e1 488b12                         mov        rdx, qword ptr [rdx]
007e4 48c1ea2a                       shr        rdx, 0x2a
007e8 48c1e209                       shl        rdx, 9
007ec 41ba0000005c                   mov        r10d, 0x5c000000
007f2 4903d2                         add        rdx, r10
007f5 41ba17000000                   mov        r10d, 0x17
007fb 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
007ff 7435                           je         0x7f63d41790b6
00801 4983c202                       add        r10, 2
00805 4983fa1b                       cmp        r10, 0x1b
00809 75f0                           jne        0x7f63d417907b
0080b 41ba17000000                   mov        r10d, 0x17
00811 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
00816 7412                           je         0x7f63d41790aa
00818 4983c202                       add        r10, 2
0081c 4983fa1b                       cmp        r10, 0x1b
00820 75ef                           jne        0x7f63d4179091
00822 41ba16000000                   mov        r10d, 0x16
00828 eb10                           jmp        0x7f63d41790ba
0082a 50                             push       rax
0082b 4833c0                         xor        rax, rax
0082e 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
00833 58                             pop        rax
00834 ebbf                           jmp        0x7f63d4179075
00836 4983c201                       add        r10, 1
0083a 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0083f 48ba08f664c8637f0000           movabs     rdx, 0x7f63c864f608
00849 488382e000000001               add        qword ptr [rdx + 0xe0], 1
00851 48ba38eb64c8637f0000           movabs     rdx, 0x7f63c864eb38
0085b 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0085e 83c102                         add        ecx, 2
00861 894a78                         mov        dword ptr [rdx + 0x78], ecx
00864 81e1feff1f00                   and        ecx, 0x1ffffe
0086a 85c9                           test       ecx, ecx
0086c 0f84693d0000                   je         0x7f63d417ce5b
00872 448bac2490010000               mov        r13d, dword ptr [rsp + 0x190]
0087a 48ba38eb64c8637f0000           movabs     rdx, 0x7f63c864eb38
00884 4883821001000001               add        qword ptr [rdx + 0x110], 1
0088c 8b942464010000                 mov        edx, dword ptr [rsp + 0x164]
00893 83ea0f                         sub        edx, 0xf
00896 48b9c8e164c8637f0000           movabs     rcx, 0x7f63c864e1c8
008a0 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
008a4 4183c102                       add        r9d, 2
008a8 44894978                       mov        dword ptr [rcx + 0x78], r9d
008ac 4181e1feff1f00                 and        r9d, 0x1ffffe
008b3 4585c9                         test       r9d, r9d
008b6 0f84403d0000                   je         0x7f63d417ce7c
008bc 48b9c8e164c8637f0000           movabs     rcx, 0x7f63c864e1c8
008c6 488381b000000001               add        qword ptr [rcx + 0xb0], 1
008ce 48b90000000000000000           movabs     rcx, 0
008d8 b900000000                     mov        ecx, 0
008dd 443be9                         cmp        r13d, ecx
008e0 0f8c373d0000                   jl         0x7f63d417ce9d
008e6 443bea                         cmp        r13d, edx
008e9 0f8d4f3d0000                   jge        0x7f63d417cebe
008ef 498bd5                         mov        rdx, r13
008f2 89942494010000                 mov        dword ptr [rsp + 0x194], edx
008f9 48b9780238e300000000           movabs     rcx, 0xe3380278
00903 4c8bc9                         mov        r9, rcx
00906 49be08f664c8637f0000           movabs     r14, 0x7f63c864f608
00910 4d8b09                         mov        r9, qword ptr [r9]
00913 49c1e92a                       shr        r9, 0x2a
00917 49c1e109                       shl        r9, 9
0091b 41ba0000005c                   mov        r10d, 0x5c000000
00921 4d03ca                         add        r9, r10
00924 41ba25000000                   mov        r10d, 0x25
0092a 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
0092e 7435                           je         0x7f63d41791e5
00930 4983c202                       add        r10, 2
00934 4983fa29                       cmp        r10, 0x29
00938 75f0                           jne        0x7f63d41791aa
0093a 41ba25000000                   mov        r10d, 0x25
00940 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
00945 7412                           je         0x7f63d41791d9
00947 4983c202                       add        r10, 2
0094b 4983fa29                       cmp        r10, 0x29
0094f 75ef                           jne        0x7f63d41791c0
00951 41ba24000000                   mov        r10d, 0x24
00957 eb10                           jmp        0x7f63d41791e9
00959 50                             push       rax
0095a 4833c0                         xor        rax, rax
0095d 4f0fb10cd6                     cmpxchg    qword ptr [r14 + r10*8], r9
00962 58                             pop        rax
00963 ebbf                           jmp        0x7f63d41791a4
00965 4983c201                       add        r10, 1
00969 4b8304d601                     add        qword ptr [r14 + r10*8], 1
0096e 48bad0e264c8637f0000           movabs     rdx, 0x7f63c864e2d0
00978 448b4a78                       mov        r9d, dword ptr [rdx + 0x78]
0097c 4183c102                       add        r9d, 2
00980 44894a78                       mov        dword ptr [rdx + 0x78], r9d
00984 4181e1feff1f00                 and        r9d, 0x1ffffe
0098b 4585c9                         test       r9d, r9d
0098e 0f84cb3c0000                   je         0x7f63d417cedf
00994 48bad0e264c8637f0000           movabs     rdx, 0x7f63c864e2d0
0099e 488382b000000001               add        qword ptr [rdx + 0xb0], 1
009a6 48ba00e464c8637f0000           movabs     rdx, 0x7f63c864e400
009b0 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
009b3 83c102                         add        ecx, 2
009b6 894a78                         mov        dword ptr [rdx + 0x78], ecx
009b9 81e1feff1f00                   and        ecx, 0x1ffffe
009bf 85c9                           test       ecx, ecx
009c1 0f84b93c0000                   je         0x7f63d417cf00
009c7 48ba00e464c8637f0000           movabs     rdx, 0x7f63c864e400
009d1 ff82c0000000                   inc        dword ptr [rdx + 0xc0]
009d7 8b942494010000                 mov        edx, dword ptr [rsp + 0x194]
009de 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
009e5 4489ac2490010000               mov        dword ptr [rsp + 0x190], r13d
009ed 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
009f5 488b9c2468010000               mov        rbx, qword ptr [rsp + 0x168]
009fd 48b990d539e300000000           movabs     rcx, 0xe339d590
00a07 4c8bc9                         mov        r9, rcx
00a0a 48b808f664c8637f0000           movabs     rax, 0x7f63c864f608
00a14 4883806001000001               add        qword ptr [rax + 0x160], 1
00a1c 49b9d8f764c8637f0000           movabs     r9, 0x7f63c864f7d8
00a26 418b4178                       mov        eax, dword ptr [r9 + 0x78]
00a2a 83c002                         add        eax, 2
00a2d 41894178                       mov        dword ptr [r9 + 0x78], eax
00a31 25feff1f00                     and        eax, 0x1ffffe
00a36 85c0                           test       eax, eax
00a38 0f84633c0000                   je         0x7f63d417cf21
00a3e 4c8bc9                         mov        r9, rcx
00a41 48b8d8f764c8637f0000           movabs     rax, 0x7f63c864f7d8
00a4b 488380b000000001               add        qword ptr [rax + 0xb0], 1
00a53 49b9c0f864c8637f0000           movabs     r9, 0x7f63c864f8c0
00a5d 418b4178                       mov        eax, dword ptr [r9 + 0x78]
00a61 83c002                         add        eax, 2
00a64 41894178                       mov        dword ptr [r9 + 0x78], eax
00a68 25feff1f00                     and        eax, 0x1ffffe
00a6d 85c0                           test       eax, eax
00a6f 0f844d3c0000                   je         0x7f63d417cf42
00a75 49b9c0f864c8637f0000           movabs     r9, 0x7f63c864f8c0
00a7f 498381c000000001               add        qword ptr [r9 + 0xc0], 1
00a87 48b9b8ec64c8637f0000           movabs     rcx, 0x7f63c864ecb8
00a91 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
00a95 4183c102                       add        r9d, 2
00a99 44894978                       mov        dword ptr [rcx + 0x78], r9d
00a9d 4181e1feff1f00                 and        r9d, 0x1ffffe
00aa4 4585c9                         test       r9d, r9d
00aa7 0f84363c0000                   je         0x7f63d417cf63
00aad 48b9780238e300000000           movabs     rcx, 0xe3380278
00ab7 4c8bc9                         mov        r9, rcx
00aba 48b8c0f864c8637f0000           movabs     rax, 0x7f63c864f8c0
00ac4 4d8b09                         mov        r9, qword ptr [r9]
00ac7 49c1e92a                       shr        r9, 0x2a
00acb 49c1e109                       shl        r9, 9
00acf 41ba0000005c                   mov        r10d, 0x5c000000
00ad5 4d03ca                         add        r9, r10
00ad8 41ba1d000000                   mov        r10d, 0x1d
00ade 4e3b0cd0                       cmp        r9, qword ptr [rax + r10*8]
00ae2 743b                           je         0x7f63d417939f
00ae4 4983c202                       add        r10, 2
00ae8 4983fa21                       cmp        r10, 0x21
00aec 75f0                           jne        0x7f63d417935e
00aee 41ba1d000000                   mov        r10d, 0x1d
00af4 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
00af9 7412                           je         0x7f63d417938d
00afb 4983c202                       add        r10, 2
00aff 4983fa21                       cmp        r10, 0x21
00b03 75ef                           jne        0x7f63d4179374
00b05 41ba1c000000                   mov        r10d, 0x1c
00b0b eb16                           jmp        0x7f63d41793a3
00b0d 53                             push       rbx
00b0e 488bd8                         mov        rbx, rax
00b11 4833c0                         xor        rax, rax
00b14 4e0fb10cd3                     cmpxchg    qword ptr [rbx + r10*8], r9
00b19 488bc3                         mov        rax, rbx
00b1c 5b                             pop        rbx
00b1d ebb9                           jmp        0x7f63d4179358
00b1f 4983c201                       add        r10, 1
00b23 4a8304d001                     add        qword ptr [rax + r10*8], 1
00b28 49b9c0f864c8637f0000           movabs     r9, 0x7f63c864f8c0
00b32 488b09                         mov        rcx, qword ptr [rcx]
00b35 48c1e92a                       shr        rcx, 0x2a
00b39 48c1e109                       shl        rcx, 9
00b3d 41ba0000005c                   mov        r10d, 0x5c000000
00b43 4903ca                         add        rcx, r10
00b46 41ba23000000                   mov        r10d, 0x23
00b4c 4b3b0cd1                       cmp        rcx, qword ptr [r9 + r10*8]
00b50 7435                           je         0x7f63d4179407
00b52 4983c202                       add        r10, 2
00b56 4983fa27                       cmp        r10, 0x27
00b5a 75f0                           jne        0x7f63d41793cc
00b5c 41ba23000000                   mov        r10d, 0x23
00b62 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
00b67 7412                           je         0x7f63d41793fb
00b69 4983c202                       add        r10, 2
00b6d 4983fa27                       cmp        r10, 0x27
00b71 75ef                           jne        0x7f63d41793e2
00b73 41ba22000000                   mov        r10d, 0x22
00b79 eb10                           jmp        0x7f63d417940b
00b7b 50                             push       rax
00b7c 4833c0                         xor        rax, rax
00b7f 4b0fb10cd1                     cmpxchg    qword ptr [r9 + r10*8], rcx
00b84 58                             pop        rax
00b85 ebbf                           jmp        0x7f63d41793c6
00b87 4983c201                       add        r10, 1
00b8b 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00b90 48b9c0f864c8637f0000           movabs     rcx, 0x7f63c864f8c0
00b9a 4883814001000001               add        qword ptr [rcx + 0x140], 1
00ba2 48b980ed64c8637f0000           movabs     rcx, 0x7f63c864ed80
00bac 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
00bb0 4183c102                       add        r9d, 2
00bb4 44894978                       mov        dword ptr [rcx + 0x78], r9d
00bb8 4181e1feff1f00                 and        r9d, 0x1ffffe
00bbf 4585c9                         test       r9d, r9d
00bc2 0f843c3b0000                   je         0x7f63d417cf84
00bc8 48b9c0f864c8637f0000           movabs     rcx, 0x7f63c864f8c0
00bd2 4883815001000001               add        qword ptr [rcx + 0x150], 1
00bda 4863c2                         movsxd     rax, edx
00bdd ba0c000000                     mov        edx, 0xc
00be2 4c8bc8                         mov        r9, rax
00be5 4c03ca                         add        r9, rdx
00be8 48ba08df64c8637f0000           movabs     rdx, 0x7f63c864df08
00bf2 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
00bf5 83c102                         add        ecx, 2
00bf8 894a78                         mov        dword ptr [rdx + 0x78], ecx
00bfb 81e1feff1f00                   and        ecx, 0x1ffffe
00c01 85c9                           test       ecx, ecx
00c03 0f841c3b0000                   je         0x7f63d417cfa5
00c09 48ba08df64c8637f0000           movabs     rdx, 0x7f63c864df08
00c13 488382e000000001               add        qword ptr [rdx + 0xe0], 1
00c1b 48ba88e064c8637f0000           movabs     rdx, 0x7f63c864e088
00c25 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
00c28 83c102                         add        ecx, 2
00c2b 894a78                         mov        dword ptr [rdx + 0x78], ecx
00c2e 81e1feff1f00                   and        ecx, 0x1ffffe
00c34 85c9                           test       ecx, ecx
00c36 0f840a3b0000                   je         0x7f63d417cfc6
00c3c 48bac0f864c8637f0000           movabs     rdx, 0x7f63c864f8c0
00c46 4883827001000001               add        qword ptr [rdx + 0x170], 1
00c4e 48ba60d03ae300000000           movabs     rdx, 0xe33ad060
00c58 48bec00238e300000000           movabs     rsi, 0xe33802c0
00c62 ba02000000                     mov        edx, 2
00c67 b910000000                     mov        ecx, 0x10
00c6c 4c8bc3                         mov        r8, rbx
00c6f bf00000000                     mov        edi, 0
00c74 48891c24                       mov        qword ptr [rsp], rbx
00c78 4889442408                     mov        qword ptr [rsp + 8], rax
00c7d 49ba780238e300000000           movabs     r10, 0xe3380278
00c87 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00c8c 49ba60d03ae300000000           movabs     r10, 0xe33ad060
00c96 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c9b 90                             nop        
00c9c 90                             nop        
00c9d 90                             nop        
00c9e 90                             nop        
00c9f e83ca75c07                     call       0x7f63db743c60
00ca4 0f1f84009c0d0002               nop        dword ptr [rax + rax + 0x2000d9c]
00cac 4885c0                         test       rax, rax
00caf 48bbc0f864c8637f0000           movabs     rbx, 0x7f63c864f8c0
00cb9 750c                           jne        0x7f63d4179547
00cbb 808b7901000001                 or         byte ptr [rbx + 0x179], 1
00cc2 e98b000000                     jmp        0x7f63d41795d2
00cc7 488b38                         mov        rdi, qword ptr [rax]
00cca 48c1ef2a                       shr        rdi, 0x2a
00cce 48c1e709                       shl        rdi, 9
00cd2 41ba0000005c                   mov        r10d, 0x5c000000
00cd8 4903fa                         add        rdi, r10
00cdb 41ba31000000                   mov        r10d, 0x31
00ce1 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
00ce5 7435                           je         0x7f63d417959c
00ce7 4983c202                       add        r10, 2
00ceb 4983fa35                       cmp        r10, 0x35
00cef 75f0                           jne        0x7f63d4179561
00cf1 41ba31000000                   mov        r10d, 0x31
00cf7 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00cfc 7412                           je         0x7f63d4179590
00cfe 4983c202                       add        r10, 2
00d02 4983fa35                       cmp        r10, 0x35
00d06 75ef                           jne        0x7f63d4179577
00d08 41ba30000000                   mov        r10d, 0x30
00d0e eb10                           jmp        0x7f63d41795a0
00d10 50                             push       rax
00d11 4833c0                         xor        rax, rax
00d14 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
00d19 58                             pop        rax
00d1a ebbf                           jmp        0x7f63d417955b
00d1c 4983c201                       add        r10, 1
00d20 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00d25 48bf00ec145c00000000           movabs     rdi, 0x5c14ec00
00d2f 488b18                         mov        rbx, qword ptr [rax]
00d32 48c1eb2a                       shr        rbx, 0x2a
00d36 48c1e309                       shl        rbx, 9
00d3a 41ba0000005c                   mov        r10d, 0x5c000000
00d40 4903da                         add        rbx, r10
00d43 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
00d47 0f851a3a0000                   jne        0x7f63d417cfe7
00d4d e900000000                     jmp        0x7f63d41795d2
00d52 488bf8                         mov        rdi, rax
00d55 4889bc24b0010000               mov        qword ptr [rsp + 0x1b0], rdi
00d5d 483b07                         cmp        rax, qword ptr [rdi]
00d60 488bf7                         mov        rsi, rdi
00d63 48bbd0d263c8637f0000           movabs     rbx, 0x7f63c863d2d0
00d6d 488b36                         mov        rsi, qword ptr [rsi]
00d70 48c1ee2a                       shr        rsi, 0x2a
00d74 48c1e609                       shl        rsi, 9
00d78 41ba0000005c                   mov        r10d, 0x5c000000
00d7e 4903f2                         add        rsi, r10
00d81 41ba95000000                   mov        r10d, 0x95
00d87 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00d8b 743b                           je         0x7f63d4179648
00d8d 4983c202                       add        r10, 2
00d91 4981fa99000000                 cmp        r10, 0x99
00d98 75ed                           jne        0x7f63d4179607
00d9a 41ba95000000                   mov        r10d, 0x95
00da0 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00da5 7415                           je         0x7f63d417963c
00da7 4983c202                       add        r10, 2
00dab 4981fa99000000                 cmp        r10, 0x99
00db2 75ec                           jne        0x7f63d4179620
00db4 41ba94000000                   mov        r10d, 0x94
00dba eb10                           jmp        0x7f63d417964c
00dbc 50                             push       rax
00dbd 4833c0                         xor        rax, rax
00dc0 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
00dc5 58                             pop        rax
00dc6 ebb9                           jmp        0x7f63d4179601
00dc8 4983c201                       add        r10, 1
00dcc 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00dd1 48be100365c8637f0000           movabs     rsi, 0x7f63c8650310
00ddb 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
00dde 83c302                         add        ebx, 2
00de1 895e78                         mov        dword ptr [rsi + 0x78], ebx
00de4 81e3feff1f00                   and        ebx, 0x1ffffe
00dea 85db                           test       ebx, ebx
00dec 0f84ab390000                   je         0x7f63d417d01d
00df2 488bf7                         mov        rsi, rdi
00df5 48bb100365c8637f0000           movabs     rbx, 0x7f63c8650310
00dff 488b36                         mov        rsi, qword ptr [rsi]
00e02 48c1ee2a                       shr        rsi, 0x2a
00e06 48c1e609                       shl        rsi, 9
00e0a 41ba0000005c                   mov        r10d, 0x5c000000
00e10 4903f2                         add        rsi, r10
00e13 41ba17000000                   mov        r10d, 0x17
00e19 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00e1d 7435                           je         0x7f63d41796d4
00e1f 4983c202                       add        r10, 2
00e23 4983fa1b                       cmp        r10, 0x1b
00e27 75f0                           jne        0x7f63d4179699
00e29 41ba17000000                   mov        r10d, 0x17
00e2f 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00e34 7412                           je         0x7f63d41796c8
00e36 4983c202                       add        r10, 2
00e3a 4983fa1b                       cmp        r10, 0x1b
00e3e 75ef                           jne        0x7f63d41796af
00e40 41ba16000000                   mov        r10d, 0x16
00e46 eb10                           jmp        0x7f63d41796d8
00e48 50                             push       rax
00e49 4833c0                         xor        rax, rax
00e4c 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
00e51 58                             pop        rax
00e52 ebbf                           jmp        0x7f63d4179693
00e54 4983c201                       add        r10, 1
00e58 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00e5d 488bf7                         mov        rsi, rdi
00e60 90                             nop        
00e61 90                             nop        
00e62 90                             nop        
00e63 90                             nop        
00e64 90                             nop        
00e65 48b810d623a9637f0000           movabs     rax, 0x7f63a923d610
00e6f e86ca05c07                     call       0x7f63db743760
00e74 0f1f84006c0f0003               nop        dword ptr [rax + rax + 0x3000f6c]
00e7c 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
00e84 8b7708                         mov        esi, dword ptr [rdi + 8]
00e87 48bb100365c8637f0000           movabs     rbx, 0x7f63c8650310
00e91 488383e000000001               add        qword ptr [rbx + 0xe0], 1
00e99 48bb38eb64c8637f0000           movabs     rbx, 0x7f63c864eb38
00ea3 8b5378                         mov        edx, dword ptr [rbx + 0x78]
00ea6 83c202                         add        edx, 2
00ea9 895378                         mov        dword ptr [rbx + 0x78], edx
00eac 81e2feff1f00                   and        edx, 0x1ffffe
00eb2 85d2                           test       edx, edx
00eb4 0f841d390000                   je         0x7f63d417d057
00eba 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
00ec2 48bb38eb64c8637f0000           movabs     rbx, 0x7f63c864eb38
00ecc 4883831001000001               add        qword ptr [rbx + 0x110], 1
00ed4 ffc8                           dec        eax
00ed6 2bf0                           sub        esi, eax
00ed8 48bbc8e164c8637f0000           movabs     rbx, 0x7f63c864e1c8
00ee2 8b4378                         mov        eax, dword ptr [rbx + 0x78]
00ee5 83c002                         add        eax, 2
00ee8 894378                         mov        dword ptr [rbx + 0x78], eax
00eeb 25feff1f00                     and        eax, 0x1ffffe
00ef0 85c0                           test       eax, eax
00ef2 0f8400390000                   je         0x7f63d417d078
00ef8 48bbc8e164c8637f0000           movabs     rbx, 0x7f63c864e1c8
00f02 488383b000000001               add        qword ptr [rbx + 0xb0], 1
00f0a 48bb0000000000000000           movabs     rbx, 0
00f14 bb00000000                     mov        ebx, 0
00f19 443bdb                         cmp        r11d, ebx
00f1c 0f8cf7380000                   jl         0x7f63d417d099
00f22 443bde                         cmp        r11d, esi
00f25 0f8d0f390000                   jge        0x7f63d417d0ba
00f2b 498bdb                         mov        rbx, r11
00f2e 899c24ac010000                 mov        dword ptr [rsp + 0x1ac], ebx
00f35 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
00f3d 488bbc24b0010000               mov        rdi, qword ptr [rsp + 0x1b0]
00f45 488bf7                         mov        rsi, rdi
00f48 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
00f52 488b36                         mov        rsi, qword ptr [rsi]
00f55 48c1ee2a                       shr        rsi, 0x2a
00f59 48c1e609                       shl        rsi, 9
00f5d 41ba0000005c                   mov        r10d, 0x5c000000
00f63 4903f2                         add        rsi, r10
00f66 41ba1f000000                   mov        r10d, 0x1f
00f6c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
00f70 7435                           je         0x7f63d4179827
00f72 4983c202                       add        r10, 2
00f76 4983fa23                       cmp        r10, 0x23
00f7a 75f0                           jne        0x7f63d41797ec
00f7c 41ba1f000000                   mov        r10d, 0x1f
00f82 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
00f87 7412                           je         0x7f63d417981b
00f89 4983c202                       add        r10, 2
00f8d 4983fa23                       cmp        r10, 0x23
00f91 75ef                           jne        0x7f63d4179802
00f93 41ba1e000000                   mov        r10d, 0x1e
00f99 eb10                           jmp        0x7f63d417982b
00f9b 50                             push       rax
00f9c 4833c0                         xor        rax, rax
00f9f 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
00fa4 58                             pop        rax
00fa5 ebbf                           jmp        0x7f63d41797e6
00fa7 4983c201                       add        r10, 1
00fab 4a8304d201                     add        qword ptr [rdx + r10*8], 1
00fb0 488bf7                         mov        rsi, rdi
00fb3 90                             nop        
00fb4 90                             nop        
00fb5 48b838d623a9637f0000           movabs     rax, 0x7f63a923d638
00fbf e81c9f5c07                     call       0x7f63db743760
00fc4 0f1f8400bc100004               nop        dword ptr [rax + rax + 0x40010bc]
00fcc 483b00                         cmp        rax, qword ptr [rax]
00fcf 488bf0                         mov        rsi, rax
00fd2 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
00fdc 488b36                         mov        rsi, qword ptr [rsi]
00fdf 48c1ee2a                       shr        rsi, 0x2a
00fe3 48c1e609                       shl        rsi, 9
00fe7 41ba0000005c                   mov        r10d, 0x5c000000
00fed 4903f2                         add        rsi, r10
00ff0 41ba25000000                   mov        r10d, 0x25
00ff6 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
00ffa 7435                           je         0x7f63d41798b1
00ffc 4983c202                       add        r10, 2
01000 4983fa29                       cmp        r10, 0x29
01004 75f0                           jne        0x7f63d4179876
01006 41ba25000000                   mov        r10d, 0x25
0100c 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01011 7412                           je         0x7f63d41798a5
01013 4983c202                       add        r10, 2
01017 4983fa29                       cmp        r10, 0x29
0101b 75ef                           jne        0x7f63d417988c
0101d 41ba24000000                   mov        r10d, 0x24
01023 eb10                           jmp        0x7f63d41798b5
01025 50                             push       rax
01026 4833c0                         xor        rax, rax
01029 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
0102e 58                             pop        rax
0102f ebbf                           jmp        0x7f63d4179870
01031 4983c201                       add        r10, 1
01035 4a8304d201                     add        qword ptr [rdx + r10*8], 1
0103a 8b7028                         mov        esi, dword ptr [rax + 0x28]
0103d 4c3b2594801a21                 cmp        r12, qword ptr [rip + 0x211a8094]
01044 0f8414000000                   je         0x7f63d41798de
0104a 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
01054 4883e4f0                       and        rsp, 0xfffffffffffffff0
01058 e823705b20                     call       0x7f63f4730900
0105d f4                             hlt        
0105e 488bd0                         mov        rdx, rax
01061 48b9100365c8637f0000           movabs     rcx, 0x7f63c8650310
0106b 488b12                         mov        rdx, qword ptr [rdx]
0106e 48c1ea2a                       shr        rdx, 0x2a
01072 48c1e209                       shl        rdx, 9
01076 41ba0000005c                   mov        r10d, 0x5c000000
0107c 4903d2                         add        rdx, r10
0107f 41ba2b000000                   mov        r10d, 0x2b
01085 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01089 7435                           je         0x7f63d4179940
0108b 4983c202                       add        r10, 2
0108f 4983fa2f                       cmp        r10, 0x2f
01093 75f0                           jne        0x7f63d4179905
01095 41ba2b000000                   mov        r10d, 0x2b
0109b 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
010a0 7412                           je         0x7f63d4179934
010a2 4983c202                       add        r10, 2
010a6 4983fa2f                       cmp        r10, 0x2f
010aa 75ef                           jne        0x7f63d417991b
010ac 41ba2a000000                   mov        r10d, 0x2a
010b2 eb10                           jmp        0x7f63d4179944
010b4 50                             push       rax
010b5 4833c0                         xor        rax, rax
010b8 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
010bd 58                             pop        rax
010be ebbf                           jmp        0x7f63d41798ff
010c0 4983c201                       add        r10, 1
010c4 4a8304d101                     add        qword ptr [rcx + r10*8], 1
010c9 8b4808                         mov        ecx, dword ptr [rax + 8]
010cc 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
010d6 4883828001000001               add        qword ptr [rdx + 0x180], 1
010de 48ba80ed64c8637f0000           movabs     rdx, 0x7f63c864ed80
010e8 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
010ec 4183c002                       add        r8d, 2
010f0 44894278                       mov        dword ptr [rdx + 0x78], r8d
010f4 4181e0feff1f00                 and        r8d, 0x1ffffe
010fb 4585c0                         test       r8d, r8d
010fe 0f8470370000                   je         0x7f63d417d0f4
01104 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
0110e 4883829001000001               add        qword ptr [rdx + 0x190], 1
01116 8b9c24ac010000                 mov        ebx, dword ptr [rsp + 0x1ac]
0111d 4863db                         movsxd     rbx, ebx
01120 ba0c000000                     mov        edx, 0xc
01125 4c8bcb                         mov        r9, rbx
01128 4c03ca                         add        r9, rdx
0112b 48ba08df64c8637f0000           movabs     rdx, 0x7f63c864df08
01135 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01139 4183c002                       add        r8d, 2
0113d 44894278                       mov        dword ptr [rdx + 0x78], r8d
01141 4181e0feff1f00                 and        r8d, 0x1ffffe
01148 4585c0                         test       r8d, r8d
0114b 0f8444370000                   je         0x7f63d417d115
01151 48ba08df64c8637f0000           movabs     rdx, 0x7f63c864df08
0115b 488382e000000001               add        qword ptr [rdx + 0xe0], 1
01163 48ba88e064c8637f0000           movabs     rdx, 0x7f63c864e088
0116d 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01171 4183c002                       add        r8d, 2
01175 44894278                       mov        dword ptr [rdx + 0x78], r8d
01179 4181e0feff1f00                 and        r8d, 0x1ffffe
01180 4585c0                         test       r8d, r8d
01183 0f842d370000                   je         0x7f63d417d136
01189 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
01193 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
0119b 48ba08b13ce300000000           movabs     rdx, 0xe33cb108
011a5 ba02000000                     mov        edx, 2
011aa 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
011b2 bf00000000                     mov        edi, 0
011b7 488b8424b0010000               mov        rax, qword ptr [rsp + 0x1b0]
011bf 48890424                       mov        qword ptr [rsp], rax
011c3 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
011cb 4889442408                     mov        qword ptr [rsp + 8], rax
011d0 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
011d5 49ba08b13ce300000000           movabs     r10, 0xe33cb108
011df 4c89542418                     mov        qword ptr [rsp + 0x18], r10
011e4 90                             nop        
011e5 90                             nop        
011e6 90                             nop        
011e7 e8f4a15c07                     call       0x7f63db743c60
011ec 0f1f8400e4120005               nop        dword ptr [rax + rax + 0x50012e4]
011f4 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
011fe ff86d0040000                   inc        dword ptr [rsi + 0x4d0]
01204 e9480c0000                     jmp        0x7f63d417a6d1
01209 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
01210 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
01218 83ff30                         cmp        edi, 0x30
0121b 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
01225 bae8040000                     mov        edx, 0x4e8
0122a 7f05                           jg         0x7f63d4179ab1
0122c baf8040000                     mov        edx, 0x4f8
01231 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
01235 488d4901                       lea        rcx, [rcx + 1]
01239 48890c16                       mov        qword ptr [rsi + rdx], rcx
0123d 0f8f1e0b0000                   jg         0x7f63d417a5e1
01243 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
0124a 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
01252 90                             nop        
01253 90                             nop        
01254 90                             nop        
01255 90                             nop        
01256 90                             nop        
01257 90                             nop        
01258 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
01260 8b842464010000                 mov        eax, dword ptr [rsp + 0x164]
01267 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
0126f 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
01279 4883810805000001               add        qword ptr [rcx + 0x508], 1
01281 48b908f664c8637f0000           movabs     rcx, 0x7f63c864f608
0128b 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
0128f 4183c002                       add        r8d, 2
01293 44894178                       mov        dword ptr [rcx + 0x78], r8d
01297 4181e0feff1f00                 and        r8d, 0x1ffffe
0129e 4585c0                         test       r8d, r8d
012a1 0f8430360000                   je         0x7f63d417d157
012a7 48b9780238e300000000           movabs     rcx, 0xe3380278
012b1 49b808f664c8637f0000           movabs     r8, 0x7f63c864f608
012bb 488b09                         mov        rcx, qword ptr [rcx]
012be 48c1e92a                       shr        rcx, 0x2a
012c2 48c1e109                       shl        rcx, 9
012c6 41ba0000005c                   mov        r10d, 0x5c000000
012cc 4903ca                         add        rcx, r10
012cf 41ba17000000                   mov        r10d, 0x17
012d5 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
012d9 7435                           je         0x7f63d4179b90
012db 4983c202                       add        r10, 2
012df 4983fa1b                       cmp        r10, 0x1b
012e3 75f0                           jne        0x7f63d4179b55
012e5 41ba17000000                   mov        r10d, 0x17
012eb 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
012f0 7412                           je         0x7f63d4179b84
012f2 4983c202                       add        r10, 2
012f6 4983fa1b                       cmp        r10, 0x1b
012fa 75ef                           jne        0x7f63d4179b6b
012fc 41ba16000000                   mov        r10d, 0x16
01302 eb10                           jmp        0x7f63d4179b94
01304 50                             push       rax
01305 4833c0                         xor        rax, rax
01308 4b0fb10cd0                     cmpxchg    qword ptr [r8 + r10*8], rcx
0130d 58                             pop        rax
0130e ebbf                           jmp        0x7f63d4179b4f
01310 4983c201                       add        r10, 1
01314 4b8304d001                     add        qword ptr [r8 + r10*8], 1
01319 48b908f664c8637f0000           movabs     rcx, 0x7f63c864f608
01323 488381e000000001               add        qword ptr [rcx + 0xe0], 1
0132b 48b938eb64c8637f0000           movabs     rcx, 0x7f63c864eb38
01335 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
01339 4183c002                       add        r8d, 2
0133d 44894178                       mov        dword ptr [rcx + 0x78], r8d
01341 4181e0feff1f00                 and        r8d, 0x1ffffe
01348 4585c0                         test       r8d, r8d
0134b 0f84a7350000                   je         0x7f63d417d178
01351 48b938eb64c8637f0000           movabs     rcx, 0x7f63c864eb38
0135b 4883811001000001               add        qword ptr [rcx + 0x110], 1
01363 488bc8                         mov        rcx, rax
01366 83e90f                         sub        ecx, 0xf
01369 49b8c8e164c8637f0000           movabs     r8, 0x7f63c864e1c8
01373 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
01377 4183c102                       add        r9d, 2
0137b 45894878                       mov        dword ptr [r8 + 0x78], r9d
0137f 4181e1feff1f00                 and        r9d, 0x1ffffe
01386 4585c9                         test       r9d, r9d
01389 0f848a350000                   je         0x7f63d417d199
0138f 49b8c8e164c8637f0000           movabs     r8, 0x7f63c864e1c8
01399 498380b000000001               add        qword ptr [r8 + 0xb0], 1
013a1 49b80000000000000000           movabs     r8, 0
013ab 41b800000000                   mov        r8d, 0
013b1 413bf0                         cmp        esi, r8d
013b4 0f8c80350000                   jl         0x7f63d417d1ba
013ba 3bf1                           cmp        esi, ecx
013bc 0f8d99350000                   jge        0x7f63d417d1db
013c2 488bce                         mov        rcx, rsi
013c5 898c24b8010000                 mov        dword ptr [rsp + 0x1b8], ecx
013cc 49b8780238e300000000           movabs     r8, 0xe3380278
013d6 4d8bc8                         mov        r9, r8
013d9 49be08f664c8637f0000           movabs     r14, 0x7f63c864f608
013e3 4d8b09                         mov        r9, qword ptr [r9]
013e6 49c1e92a                       shr        r9, 0x2a
013ea 49c1e109                       shl        r9, 9
013ee 41ba0000005c                   mov        r10d, 0x5c000000
013f4 4d03ca                         add        r9, r10
013f7 41ba25000000                   mov        r10d, 0x25
013fd 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
01401 7435                           je         0x7f63d4179cb8
01403 4983c202                       add        r10, 2
01407 4983fa29                       cmp        r10, 0x29
0140b 75f0                           jne        0x7f63d4179c7d
0140d 41ba25000000                   mov        r10d, 0x25
01413 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
01418 7412                           je         0x7f63d4179cac
0141a 4983c202                       add        r10, 2
0141e 4983fa29                       cmp        r10, 0x29
01422 75ef                           jne        0x7f63d4179c93
01424 41ba24000000                   mov        r10d, 0x24
0142a eb10                           jmp        0x7f63d4179cbc
0142c 50                             push       rax
0142d 4833c0                         xor        rax, rax
01430 4f0fb10cd6                     cmpxchg    qword ptr [r14 + r10*8], r9
01435 58                             pop        rax
01436 ebbf                           jmp        0x7f63d4179c77
01438 4983c201                       add        r10, 1
0143c 4b8304d601                     add        qword ptr [r14 + r10*8], 1
01441 48b9d0e264c8637f0000           movabs     rcx, 0x7f63c864e2d0
0144b 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
0144f 4183c102                       add        r9d, 2
01453 44894978                       mov        dword ptr [rcx + 0x78], r9d
01457 4181e1feff1f00                 and        r9d, 0x1ffffe
0145e 4585c9                         test       r9d, r9d
01461 0f8415350000                   je         0x7f63d417d1fc
01467 48b9d0e264c8637f0000           movabs     rcx, 0x7f63c864e2d0
01471 488381b000000001               add        qword ptr [rcx + 0xb0], 1
01479 48b900e464c8637f0000           movabs     rcx, 0x7f63c864e400
01483 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
01487 4183c002                       add        r8d, 2
0148b 44894178                       mov        dword ptr [rcx + 0x78], r8d
0148f 4181e0feff1f00                 and        r8d, 0x1ffffe
01496 4585c0                         test       r8d, r8d
01499 0f84fe340000                   je         0x7f63d417d21d
0149f 48b900e464c8637f0000           movabs     rcx, 0x7f63c864e400
014a9 ff81c0000000                   inc        dword ptr [rcx + 0xc0]
014af 8b8c24b8010000                 mov        ecx, dword ptr [rsp + 0x1b8]
014b6 89b424c0010000                 mov        dword ptr [rsp + 0x1c0], esi
014bd 49b890d539e300000000           movabs     r8, 0xe339d590
014c7 4d8bc8                         mov        r9, r8
014ca 49be08f664c8637f0000           movabs     r14, 0x7f63c864f608
014d4 4983866001000001               add        qword ptr [r14 + 0x160], 1
014dc 49b9d8f764c8637f0000           movabs     r9, 0x7f63c864f7d8
014e6 418b5978                       mov        ebx, dword ptr [r9 + 0x78]
014ea 83c302                         add        ebx, 2
014ed 41895978                       mov        dword ptr [r9 + 0x78], ebx
014f1 81e3feff1f00                   and        ebx, 0x1ffffe
014f7 85db                           test       ebx, ebx
014f9 0f84bf340000                   je         0x7f63d417d23e
014ff 4d8bc8                         mov        r9, r8
01502 48bbd8f764c8637f0000           movabs     rbx, 0x7f63c864f7d8
0150c 488383b000000001               add        qword ptr [rbx + 0xb0], 1
01514 49b9c0f864c8637f0000           movabs     r9, 0x7f63c864f8c0
0151e 418b5978                       mov        ebx, dword ptr [r9 + 0x78]
01522 83c302                         add        ebx, 2
01525 41895978                       mov        dword ptr [r9 + 0x78], ebx
01529 81e3feff1f00                   and        ebx, 0x1ffffe
0152f 85db                           test       ebx, ebx
01531 0f84a8340000                   je         0x7f63d417d25f
01537 49b9c0f864c8637f0000           movabs     r9, 0x7f63c864f8c0
01541 498381c000000001               add        qword ptr [r9 + 0xc0], 1
01549 49b8b8ec64c8637f0000           movabs     r8, 0x7f63c864ecb8
01553 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
01557 4183c102                       add        r9d, 2
0155b 45894878                       mov        dword ptr [r8 + 0x78], r9d
0155f 4181e1feff1f00                 and        r9d, 0x1ffffe
01566 4585c9                         test       r9d, r9d
01569 0f8491340000                   je         0x7f63d417d280
0156f 49b8780238e300000000           movabs     r8, 0xe3380278
01579 4d8bc8                         mov        r9, r8
0157c 48bbc0f864c8637f0000           movabs     rbx, 0x7f63c864f8c0
01586 4d8b09                         mov        r9, qword ptr [r9]
01589 49c1e92a                       shr        r9, 0x2a
0158d 49c1e109                       shl        r9, 9
01591 41ba0000005c                   mov        r10d, 0x5c000000
01597 4d03ca                         add        r9, r10
0159a 41ba1d000000                   mov        r10d, 0x1d
015a0 4e3b0cd3                       cmp        r9, qword ptr [rbx + r10*8]
015a4 7435                           je         0x7f63d4179e5b
015a6 4983c202                       add        r10, 2
015aa 4983fa21                       cmp        r10, 0x21
015ae 75f0                           jne        0x7f63d4179e20
015b0 41ba1d000000                   mov        r10d, 0x1d
015b6 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
015bb 7412                           je         0x7f63d4179e4f
015bd 4983c202                       add        r10, 2
015c1 4983fa21                       cmp        r10, 0x21
015c5 75ef                           jne        0x7f63d4179e36
015c7 41ba1c000000                   mov        r10d, 0x1c
015cd eb10                           jmp        0x7f63d4179e5f
015cf 50                             push       rax
015d0 4833c0                         xor        rax, rax
015d3 4e0fb10cd3                     cmpxchg    qword ptr [rbx + r10*8], r9
015d8 58                             pop        rax
015d9 ebbf                           jmp        0x7f63d4179e1a
015db 4983c201                       add        r10, 1
015df 4a8304d301                     add        qword ptr [rbx + r10*8], 1
015e4 49b9c0f864c8637f0000           movabs     r9, 0x7f63c864f8c0
015ee 4d8b00                         mov        r8, qword ptr [r8]
015f1 49c1e82a                       shr        r8, 0x2a
015f5 49c1e009                       shl        r8, 9
015f9 41ba0000005c                   mov        r10d, 0x5c000000
015ff 4d03c2                         add        r8, r10
01602 41ba23000000                   mov        r10d, 0x23
01608 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
0160c 7435                           je         0x7f63d4179ec3
0160e 4983c202                       add        r10, 2
01612 4983fa27                       cmp        r10, 0x27
01616 75f0                           jne        0x7f63d4179e88
01618 41ba23000000                   mov        r10d, 0x23
0161e 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
01623 7412                           je         0x7f63d4179eb7
01625 4983c202                       add        r10, 2
01629 4983fa27                       cmp        r10, 0x27
0162d 75ef                           jne        0x7f63d4179e9e
0162f 41ba22000000                   mov        r10d, 0x22
01635 eb10                           jmp        0x7f63d4179ec7
01637 50                             push       rax
01638 4833c0                         xor        rax, rax
0163b 4f0fb104d1                     cmpxchg    qword ptr [r9 + r10*8], r8
01640 58                             pop        rax
01641 ebbf                           jmp        0x7f63d4179e82
01643 4983c201                       add        r10, 1
01647 4b8304d101                     add        qword ptr [r9 + r10*8], 1
0164c 49b8c0f864c8637f0000           movabs     r8, 0x7f63c864f8c0
01656 4983804001000001               add        qword ptr [r8 + 0x140], 1
0165e 49b880ed64c8637f0000           movabs     r8, 0x7f63c864ed80
01668 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
0166c 4183c102                       add        r9d, 2
01670 45894878                       mov        dword ptr [r8 + 0x78], r9d
01674 4181e1feff1f00                 and        r9d, 0x1ffffe
0167b 4585c9                         test       r9d, r9d
0167e 0f849d330000                   je         0x7f63d417d2a1
01684 49b8c0f864c8637f0000           movabs     r8, 0x7f63c864f8c0
0168e 4983805001000001               add        qword ptr [r8 + 0x150], 1
01696 4863d9                         movsxd     rbx, ecx
01699 b90c000000                     mov        ecx, 0xc
0169e 4c8bcb                         mov        r9, rbx
016a1 4c03c9                         add        r9, rcx
016a4 48b908df64c8637f0000           movabs     rcx, 0x7f63c864df08
016ae 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
016b2 4183c002                       add        r8d, 2
016b6 44894178                       mov        dword ptr [rcx + 0x78], r8d
016ba 4181e0feff1f00                 and        r8d, 0x1ffffe
016c1 4585c0                         test       r8d, r8d
016c4 0f8478330000                   je         0x7f63d417d2c2
016ca 48b908df64c8637f0000           movabs     rcx, 0x7f63c864df08
016d4 488381e000000001               add        qword ptr [rcx + 0xe0], 1
016dc 48b988e064c8637f0000           movabs     rcx, 0x7f63c864e088
016e6 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
016ea 4183c002                       add        r8d, 2
016ee 44894178                       mov        dword ptr [rcx + 0x78], r8d
016f2 4181e0feff1f00                 and        r8d, 0x1ffffe
016f9 4585c0                         test       r8d, r8d
016fc 0f8461330000                   je         0x7f63d417d2e3
01702 48b9c0f864c8637f0000           movabs     rcx, 0x7f63c864f8c0
0170c 4883817001000001               add        qword ptr [rcx + 0x170], 1
01714 48b960d03ae300000000           movabs     rcx, 0xe33ad060
0171e 48bec00238e300000000           movabs     rsi, 0xe33802c0
01728 4c8bc2                         mov        r8, rdx
0172b ba02000000                     mov        edx, 2
01730 b910000000                     mov        ecx, 0x10
01735 498bc0                         mov        rax, r8
01738 4c8bc0                         mov        r8, rax
0173b bf00000000                     mov        edi, 0
01740 48890424                       mov        qword ptr [rsp], rax
01744 48895c2408                     mov        qword ptr [rsp + 8], rbx
01749 49ba780238e300000000           movabs     r10, 0xe3380278
01753 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01758 49ba60d03ae300000000           movabs     r10, 0xe33ad060
01762 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01767 e8749c5c07                     call       0x7f63db743c60
0176c 0f1f840064180006               nop        dword ptr [rax + rax + 0x6001864]
01774 4885c0                         test       rax, rax
01777 48bbc0f864c8637f0000           movabs     rbx, 0x7f63c864f8c0
01781 750c                           jne        0x7f63d417a00f
01783 808b7901000001                 or         byte ptr [rbx + 0x179], 1
0178a e98b000000                     jmp        0x7f63d417a09a
0178f 488b38                         mov        rdi, qword ptr [rax]
01792 48c1ef2a                       shr        rdi, 0x2a
01796 48c1e709                       shl        rdi, 9
0179a 41ba0000005c                   mov        r10d, 0x5c000000
017a0 4903fa                         add        rdi, r10
017a3 41ba31000000                   mov        r10d, 0x31
017a9 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
017ad 7435                           je         0x7f63d417a064
017af 4983c202                       add        r10, 2
017b3 4983fa35                       cmp        r10, 0x35
017b7 75f0                           jne        0x7f63d417a029
017b9 41ba31000000                   mov        r10d, 0x31
017bf 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
017c4 7412                           je         0x7f63d417a058
017c6 4983c202                       add        r10, 2
017ca 4983fa35                       cmp        r10, 0x35
017ce 75ef                           jne        0x7f63d417a03f
017d0 41ba30000000                   mov        r10d, 0x30
017d6 eb10                           jmp        0x7f63d417a068
017d8 50                             push       rax
017d9 4833c0                         xor        rax, rax
017dc 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
017e1 58                             pop        rax
017e2 ebbf                           jmp        0x7f63d417a023
017e4 4983c201                       add        r10, 1
017e8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
017ed 48bf00ec145c00000000           movabs     rdi, 0x5c14ec00
017f7 488b18                         mov        rbx, qword ptr [rax]
017fa 48c1eb2a                       shr        rbx, 0x2a
017fe 48c1e309                       shl        rbx, 9
01802 41ba0000005c                   mov        r10d, 0x5c000000
01808 4903da                         add        rbx, r10
0180b 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
0180f 0f856f320000                   jne        0x7f63d417d304
01815 e900000000                     jmp        0x7f63d417a09a
0181a 488bf8                         mov        rdi, rax
0181d 4889bc24c8010000               mov        qword ptr [rsp + 0x1c8], rdi
01825 483b07                         cmp        rax, qword ptr [rdi]
01828 488bf7                         mov        rsi, rdi
0182b 48bbd0d263c8637f0000           movabs     rbx, 0x7f63c863d2d0
01835 488b36                         mov        rsi, qword ptr [rsi]
01838 48c1ee2a                       shr        rsi, 0x2a
0183c 48c1e609                       shl        rsi, 9
01840 41ba0000005c                   mov        r10d, 0x5c000000
01846 4903f2                         add        rsi, r10
01849 41baa4000000                   mov        r10d, 0xa4
0184f 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
01853 743b                           je         0x7f63d417a110
01855 4983c202                       add        r10, 2
01859 4981faa8000000                 cmp        r10, 0xa8
01860 75ed                           jne        0x7f63d417a0cf
01862 41baa4000000                   mov        r10d, 0xa4
01868 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0186d 7415                           je         0x7f63d417a104
0186f 4983c202                       add        r10, 2
01873 4981faa8000000                 cmp        r10, 0xa8
0187a 75ec                           jne        0x7f63d417a0e8
0187c 41baa3000000                   mov        r10d, 0xa3
01882 eb10                           jmp        0x7f63d417a114
01884 50                             push       rax
01885 4833c0                         xor        rax, rax
01888 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
0188d 58                             pop        rax
0188e ebb9                           jmp        0x7f63d417a0c9
01890 4983c201                       add        r10, 1
01894 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01899 48be100365c8637f0000           movabs     rsi, 0x7f63c8650310
018a3 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
018a6 83c302                         add        ebx, 2
018a9 895e78                         mov        dword ptr [rsi + 0x78], ebx
018ac 81e3feff1f00                   and        ebx, 0x1ffffe
018b2 85db                           test       ebx, ebx
018b4 0f8400320000                   je         0x7f63d417d33a
018ba 488bf7                         mov        rsi, rdi
018bd 48bb100365c8637f0000           movabs     rbx, 0x7f63c8650310
018c7 488b36                         mov        rsi, qword ptr [rsi]
018ca 48c1ee2a                       shr        rsi, 0x2a
018ce 48c1e609                       shl        rsi, 9
018d2 41ba0000005c                   mov        r10d, 0x5c000000
018d8 4903f2                         add        rsi, r10
018db 41ba17000000                   mov        r10d, 0x17
018e1 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
018e5 7435                           je         0x7f63d417a19c
018e7 4983c202                       add        r10, 2
018eb 4983fa1b                       cmp        r10, 0x1b
018ef 75f0                           jne        0x7f63d417a161
018f1 41ba17000000                   mov        r10d, 0x17
018f7 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
018fc 7412                           je         0x7f63d417a190
018fe 4983c202                       add        r10, 2
01902 4983fa1b                       cmp        r10, 0x1b
01906 75ef                           jne        0x7f63d417a177
01908 41ba16000000                   mov        r10d, 0x16
0190e eb10                           jmp        0x7f63d417a1a0
01910 50                             push       rax
01911 4833c0                         xor        rax, rax
01914 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
01919 58                             pop        rax
0191a ebbf                           jmp        0x7f63d417a15b
0191c 4983c201                       add        r10, 1
01920 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01925 488bf7                         mov        rsi, rdi
01928 90                             nop        
01929 90                             nop        
0192a 90                             nop        
0192b 90                             nop        
0192c 90                             nop        
0192d 48b860d623a9637f0000           movabs     rax, 0x7f63a923d660
01937 e8a4955c07                     call       0x7f63db743760
0193c 0f1f8400341a0007               nop        dword ptr [rax + rax + 0x7001a34]
01944 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
0194c 8b7708                         mov        esi, dword ptr [rdi + 8]
0194f 48bb100365c8637f0000           movabs     rbx, 0x7f63c8650310
01959 488383e000000001               add        qword ptr [rbx + 0xe0], 1
01961 48bb38eb64c8637f0000           movabs     rbx, 0x7f63c864eb38
0196b 8b5378                         mov        edx, dword ptr [rbx + 0x78]
0196e 83c202                         add        edx, 2
01971 895378                         mov        dword ptr [rbx + 0x78], edx
01974 81e2feff1f00                   and        edx, 0x1ffffe
0197a 85d2                           test       edx, edx
0197c 0f8472310000                   je         0x7f63d417d374
01982 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
0198a 48bb38eb64c8637f0000           movabs     rbx, 0x7f63c864eb38
01994 4883831001000001               add        qword ptr [rbx + 0x110], 1
0199c ffc8                           dec        eax
0199e 2bf0                           sub        esi, eax
019a0 48bbc8e164c8637f0000           movabs     rbx, 0x7f63c864e1c8
019aa 8b4378                         mov        eax, dword ptr [rbx + 0x78]
019ad 83c002                         add        eax, 2
019b0 894378                         mov        dword ptr [rbx + 0x78], eax
019b3 25feff1f00                     and        eax, 0x1ffffe
019b8 85c0                           test       eax, eax
019ba 0f8455310000                   je         0x7f63d417d395
019c0 48bbc8e164c8637f0000           movabs     rbx, 0x7f63c864e1c8
019ca 488383b000000001               add        qword ptr [rbx + 0xb0], 1
019d2 48bb0000000000000000           movabs     rbx, 0
019dc bb00000000                     mov        ebx, 0
019e1 443bdb                         cmp        r11d, ebx
019e4 0f8c4c310000                   jl         0x7f63d417d3b6
019ea 443bde                         cmp        r11d, esi
019ed 0f8d64310000                   jge        0x7f63d417d3d7
019f3 498bdb                         mov        rbx, r11
019f6 899c24c4010000                 mov        dword ptr [rsp + 0x1c4], ebx
019fd 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
01a05 488bbc24c8010000               mov        rdi, qword ptr [rsp + 0x1c8]
01a0d 488bf7                         mov        rsi, rdi
01a10 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
01a1a 488b36                         mov        rsi, qword ptr [rsi]
01a1d 48c1ee2a                       shr        rsi, 0x2a
01a21 48c1e609                       shl        rsi, 9
01a25 41ba0000005c                   mov        r10d, 0x5c000000
01a2b 4903f2                         add        rsi, r10
01a2e 41ba1f000000                   mov        r10d, 0x1f
01a34 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01a38 7435                           je         0x7f63d417a2ef
01a3a 4983c202                       add        r10, 2
01a3e 4983fa23                       cmp        r10, 0x23
01a42 75f0                           jne        0x7f63d417a2b4
01a44 41ba1f000000                   mov        r10d, 0x1f
01a4a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01a4f 7412                           je         0x7f63d417a2e3
01a51 4983c202                       add        r10, 2
01a55 4983fa23                       cmp        r10, 0x23
01a59 75ef                           jne        0x7f63d417a2ca
01a5b 41ba1e000000                   mov        r10d, 0x1e
01a61 eb10                           jmp        0x7f63d417a2f3
01a63 50                             push       rax
01a64 4833c0                         xor        rax, rax
01a67 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
01a6c 58                             pop        rax
01a6d ebbf                           jmp        0x7f63d417a2ae
01a6f 4983c201                       add        r10, 1
01a73 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01a78 488bf7                         mov        rsi, rdi
01a7b 90                             nop        
01a7c 90                             nop        
01a7d 48b888d623a9637f0000           movabs     rax, 0x7f63a923d688
01a87 e854945c07                     call       0x7f63db743760
01a8c 0f1f8400841b0008               nop        dword ptr [rax + rax + 0x8001b84]
01a94 483b00                         cmp        rax, qword ptr [rax]
01a97 488bf0                         mov        rsi, rax
01a9a 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
01aa4 488b36                         mov        rsi, qword ptr [rsi]
01aa7 48c1ee2a                       shr        rsi, 0x2a
01aab 48c1e609                       shl        rsi, 9
01aaf 41ba0000005c                   mov        r10d, 0x5c000000
01ab5 4903f2                         add        rsi, r10
01ab8 41ba25000000                   mov        r10d, 0x25
01abe 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01ac2 7435                           je         0x7f63d417a379
01ac4 4983c202                       add        r10, 2
01ac8 4983fa29                       cmp        r10, 0x29
01acc 75f0                           jne        0x7f63d417a33e
01ace 41ba25000000                   mov        r10d, 0x25
01ad4 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01ad9 7412                           je         0x7f63d417a36d
01adb 4983c202                       add        r10, 2
01adf 4983fa29                       cmp        r10, 0x29
01ae3 75ef                           jne        0x7f63d417a354
01ae5 41ba24000000                   mov        r10d, 0x24
01aeb eb10                           jmp        0x7f63d417a37d
01aed 50                             push       rax
01aee 4833c0                         xor        rax, rax
01af1 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
01af6 58                             pop        rax
01af7 ebbf                           jmp        0x7f63d417a338
01af9 4983c201                       add        r10, 1
01afd 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01b02 8b7028                         mov        esi, dword ptr [rax + 0x28]
01b05 4c3b25cc751a21                 cmp        r12, qword ptr [rip + 0x211a75cc]
01b0c 0f8414000000                   je         0x7f63d417a3a6
01b12 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
01b1c 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b20 e85b655b20                     call       0x7f63f4730900
01b25 f4                             hlt        
01b26 488bd0                         mov        rdx, rax
01b29 48b9100365c8637f0000           movabs     rcx, 0x7f63c8650310
01b33 488b12                         mov        rdx, qword ptr [rdx]
01b36 48c1ea2a                       shr        rdx, 0x2a
01b3a 48c1e209                       shl        rdx, 9
01b3e 41ba0000005c                   mov        r10d, 0x5c000000
01b44 4903d2                         add        rdx, r10
01b47 41ba2b000000                   mov        r10d, 0x2b
01b4d 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01b51 7435                           je         0x7f63d417a408
01b53 4983c202                       add        r10, 2
01b57 4983fa2f                       cmp        r10, 0x2f
01b5b 75f0                           jne        0x7f63d417a3cd
01b5d 41ba2b000000                   mov        r10d, 0x2b
01b63 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01b68 7412                           je         0x7f63d417a3fc
01b6a 4983c202                       add        r10, 2
01b6e 4983fa2f                       cmp        r10, 0x2f
01b72 75ef                           jne        0x7f63d417a3e3
01b74 41ba2a000000                   mov        r10d, 0x2a
01b7a eb10                           jmp        0x7f63d417a40c
01b7c 50                             push       rax
01b7d 4833c0                         xor        rax, rax
01b80 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
01b85 58                             pop        rax
01b86 ebbf                           jmp        0x7f63d417a3c7
01b88 4983c201                       add        r10, 1
01b8c 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01b91 8b4808                         mov        ecx, dword ptr [rax + 8]
01b94 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
01b9e 4883828001000001               add        qword ptr [rdx + 0x180], 1
01ba6 48ba80ed64c8637f0000           movabs     rdx, 0x7f63c864ed80
01bb0 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01bb4 4183c002                       add        r8d, 2
01bb8 44894278                       mov        dword ptr [rdx + 0x78], r8d
01bbc 4181e0feff1f00                 and        r8d, 0x1ffffe
01bc3 4585c0                         test       r8d, r8d
01bc6 0f84c52f0000                   je         0x7f63d417d411
01bcc 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
01bd6 4883829001000001               add        qword ptr [rdx + 0x190], 1
01bde 8b9c24c4010000                 mov        ebx, dword ptr [rsp + 0x1c4]
01be5 4863db                         movsxd     rbx, ebx
01be8 ba0c000000                     mov        edx, 0xc
01bed 4c8bcb                         mov        r9, rbx
01bf0 4c03ca                         add        r9, rdx
01bf3 48ba08df64c8637f0000           movabs     rdx, 0x7f63c864df08
01bfd 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01c01 4183c002                       add        r8d, 2
01c05 44894278                       mov        dword ptr [rdx + 0x78], r8d
01c09 4181e0feff1f00                 and        r8d, 0x1ffffe
01c10 4585c0                         test       r8d, r8d
01c13 0f84992f0000                   je         0x7f63d417d432
01c19 48ba08df64c8637f0000           movabs     rdx, 0x7f63c864df08
01c23 488382e000000001               add        qword ptr [rdx + 0xe0], 1
01c2b 48ba88e064c8637f0000           movabs     rdx, 0x7f63c864e088
01c35 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01c39 4183c002                       add        r8d, 2
01c3d 44894278                       mov        dword ptr [rdx + 0x78], r8d
01c41 4181e0feff1f00                 and        r8d, 0x1ffffe
01c48 4585c0                         test       r8d, r8d
01c4b 0f84822f0000                   je         0x7f63d417d453
01c51 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
01c5b 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
01c63 48ba08b13ce300000000           movabs     rdx, 0xe33cb108
01c6d ba02000000                     mov        edx, 2
01c72 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
01c7a bf00000000                     mov        edi, 0
01c7f 488b8424c8010000               mov        rax, qword ptr [rsp + 0x1c8]
01c87 48890424                       mov        qword ptr [rsp], rax
01c8b 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
01c93 4889442408                     mov        qword ptr [rsp + 8], rax
01c98 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01c9d 49ba08b13ce300000000           movabs     r10, 0xe33cb108
01ca7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01cac 90                             nop        
01cad 90                             nop        
01cae 90                             nop        
01caf e82c975c07                     call       0x7f63db743c60
01cb4 0f1f8400ac1d0009               nop        dword ptr [rax + rax + 0x9001dac]
01cbc 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01cc4 4183c310                       add        r11d, 0x10
01cc8 8bb424c0010000                 mov        esi, dword ptr [rsp + 0x1c0]
01ccf 83c610                         add        esi, 0x10
01cd2 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01cda ba02000000                     mov        edx, 2
01cdf 7c05                           jl         0x7f63d417a566
01ce1 ba00000000                     mov        edx, 0
01ce6 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
01cf0 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
01cf4 4403c2                         add        r8d, edx
01cf7 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
01cfb 85d2                           test       edx, edx
01cfd 7506                           jne        0x7f63d417a585
01cff 41b802000000                   mov        r8d, 2
01d05 4181e0fe3f0000                 and        r8d, 0x3ffe
01d0c 4585c0                         test       r8d, r8d
01d0f 0f84df2e0000                   je         0x7f63d417d474
01d15 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01d19 418502                         test       dword ptr [r10], eax
01d1c 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01d24 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
01d2e b948050000                     mov        ecx, 0x548
01d33 7c05                           jl         0x7f63d417a5ba
01d35 b958050000                     mov        ecx, 0x558
01d3a 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01d3e 4d8d4001                       lea        r8, [r8 + 1]
01d42 4c89040a                       mov        qword ptr [rdx + rcx], r8
01d46 0f8c0cf5ffff                   jl         0x7f63d4179ad8
01d4c 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
01d56 ff8668050000                   inc        dword ptr [rsi + 0x568]
01d5c e9f0000000                     jmp        0x7f63d417a6d1
01d61 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
01d6b 4883828005000001               add        qword ptr [rdx + 0x580], 1
01d73 488bb42468010000               mov        rsi, qword ptr [rsp + 0x168]
01d7b 8b942490010000                 mov        edx, dword ptr [rsp + 0x190]
01d82 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
01d8a 448b842474010000               mov        r8d, dword ptr [rsp + 0x174]
01d92 4c8bcf                         mov        r9, rdi
01d95 4885c9                         test       rcx, rcx
01d98 0f84772e0000                   je         0x7f63d417d495
01d9e 85d2                           test       edx, edx
01da0 0f8c6f2e0000                   jl         0x7f63d417d495
01da6 4585c0                         test       r8d, r8d
01da9 0f8c662e0000                   jl         0x7f63d417d495
01daf 4a8d3c0a                       lea        rdi, [rdx + r9]
01db3 3b7e08                         cmp        edi, dword ptr [rsi + 8]
01db6 0f87592e0000                   ja         0x7f63d417d495
01dbc 4b8d3c08                       lea        rdi, [r8 + r9]
01dc0 3b7908                         cmp        edi, dword ptr [rcx + 8]
01dc3 0f874c2e0000                   ja         0x7f63d417d495
01dc9 4585c9                         test       r9d, r9d
01dcc 0f8c432e0000                   jl         0x7f63d417d495
01dd2 4863d2                         movsxd     rdx, edx
01dd5 4d63c0                         movsxd     r8, r8d
01dd8 48bf0014045c00000000           movabs     rdi, 0x5c041400
01de2 41ba0000005c                   mov        r10d, 0x5c000000
01de8 492bfa                         sub        rdi, r10
01deb 48c1ef09                       shr        rdi, 9
01def 4c8b19                         mov        r11, qword ptr [rcx]
01df2 49c1eb2a                       shr        r11, 0x2a
01df6 413bfb                         cmp        edi, r11d
01df9 0f8510000000                   jne        0x7f63d417a68f
01dff 4c8b1e                         mov        r11, qword ptr [rsi]
01e02 49c1eb2a                       shr        r11, 0x2a
01e06 413bfb                         cmp        edi, r11d
01e09 0f8414000000                   je         0x7f63d417a6a3
01e0f 48bfa0453ef3637f0000           movabs     rdi, 0x7f63f33e45a0
01e19 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e1d e85e625b20                     call       0x7f63f4730900
01e22 f4                             hlt        
01e23 488d7c160c                     lea        rdi, [rsi + rdx + 0xc]
01e28 4a8d74010c                     lea        rsi, [rcx + r8 + 0xc]
01e2d 498bd1                         mov        rdx, r9
01e30 40f6c40f                       test       spl, 0xf
01e34 0f8412000000                   je         0x7f63d417a6cc
01e3a 4883ec08                       sub        rsp, 8
01e3e e87d2a5b07                     call       0x7f63db72d140
01e43 4883c408                       add        rsp, 8
01e47 e905000000                     jmp        0x7f63d417a6d1
01e4c e86f2a5b07                     call       0x7f63db72d140
01e51 8bb424a4010000                 mov        esi, dword ptr [rsp + 0x1a4]
01e58 8b9c24a0010000                 mov        ebx, dword ptr [rsp + 0x1a0]
01e5f 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
01e67 488bfb                         mov        rdi, rbx
01e6a 2bbc24a8010000                 sub        edi, dword ptr [rsp + 0x1a8]
01e71 4183f810                       cmp        r8d, 0x10
01e75 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
01e7f b990050000                     mov        ecx, 0x590
01e84 7f05                           jg         0x7f63d417a70b
01e86 b9a0050000                     mov        ecx, 0x5a0
01e8b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
01e8f 4d8d4901                       lea        r9, [r9 + 1]
01e93 4c890c0a                       mov        qword ptr [rdx + rcx], r9
01e97 448b8c24a8010000               mov        r9d, dword ptr [rsp + 0x1a8]
01e9f 0f8f2c000000                   jg         0x7f63d417a751
01ea5 4183f910                       cmp        r9d, 0x10
01ea9 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
01eb3 b9c0050000                     mov        ecx, 0x5c0
01eb8 7d05                           jge        0x7f63d417a73f
01eba b9b0050000                     mov        ecx, 0x5b0
01ebf 488b040a                       mov        rax, qword ptr [rdx + rcx]
01ec3 488d4001                       lea        rax, [rax + 1]
01ec7 4889040a                       mov        qword ptr [rdx + rcx], rax
01ecb 0f8d43160000                   jge        0x7f63d417bd94
01ed1 453bc8                         cmp        r9d, r8d
01ed4 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
01ede b928060000                     mov        ecx, 0x628
01ee3 7c05                           jl         0x7f63d417a76a
01ee5 b938060000                     mov        ecx, 0x638
01eea 488b040a                       mov        rax, qword ptr [rdx + rcx]
01eee 488d4001                       lea        rax, [rax + 1]
01ef2 4889040a                       mov        qword ptr [rdx + rcx], rax
01ef6 0f8ce1050000                   jl         0x7f63d417ad5d
01efc 4183f830                       cmp        r8d, 0x30
01f00 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
01f0a b948060000                     mov        ecx, 0x648
01f0f 7e05                           jle        0x7f63d417a796
01f11 b958060000                     mov        ecx, 0x658
01f16 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
01f1a 4d8d4901                       lea        r9, [r9 + 1]
01f1e 4c890c0a                       mov        qword ptr [rdx + rcx], r9
01f22 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
01f29 0f8e0f010000                   jle        0x7f63d417a8be
01f2f 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
01f39 4883826806000001               add        qword ptr [rdx + 0x668], 1
01f41 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
01f49 488bd7                         mov        rdx, rdi
01f4c 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
01f54 498bf8                         mov        rdi, r8
01f57 4c8bc3                         mov        r8, rbx
01f5a 4c8bcf                         mov        r9, rdi
01f5d 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
01f64 4885f6                         test       rsi, rsi
01f67 0f84b42c0000                   je         0x7f63d417d4a1
01f6d 4885c9                         test       rcx, rcx
01f70 0f84ab2c0000                   je         0x7f63d417d4a1
01f76 85d2                           test       edx, edx
01f78 0f8ca32c0000                   jl         0x7f63d417d4a1
01f7e 4585c0                         test       r8d, r8d
01f81 0f8c9a2c0000                   jl         0x7f63d417d4a1
01f87 4a8d3c0a                       lea        rdi, [rdx + r9]
01f8b 3b7e08                         cmp        edi, dword ptr [rsi + 8]
01f8e 0f878d2c0000                   ja         0x7f63d417d4a1
01f94 4b8d3c08                       lea        rdi, [r8 + r9]
01f98 3b7908                         cmp        edi, dword ptr [rcx + 8]
01f9b 0f87802c0000                   ja         0x7f63d417d4a1
01fa1 4585c9                         test       r9d, r9d
01fa4 0f8c772c0000                   jl         0x7f63d417d4a1
01faa 4863d2                         movsxd     rdx, edx
01fad 4d63c0                         movsxd     r8, r8d
01fb0 48bf0014045c00000000           movabs     rdi, 0x5c041400
01fba 41ba0000005c                   mov        r10d, 0x5c000000
01fc0 492bfa                         sub        rdi, r10
01fc3 48c1ef09                       shr        rdi, 9
01fc7 4c8b19                         mov        r11, qword ptr [rcx]
01fca 49c1eb2a                       shr        r11, 0x2a
01fce 413bfb                         cmp        edi, r11d
01fd1 0f8510000000                   jne        0x7f63d417a867
01fd7 4c8b1e                         mov        r11, qword ptr [rsi]
01fda 49c1eb2a                       shr        r11, 0x2a
01fde 413bfb                         cmp        edi, r11d
01fe1 0f8414000000                   je         0x7f63d417a87b
01fe7 48bfa0453ef3637f0000           movabs     rdi, 0x7f63f33e45a0
01ff1 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ff5 e886605b20                     call       0x7f63f4730900
01ffa f4                             hlt        
01ffb 488d7c160c                     lea        rdi, [rsi + rdx + 0xc]
02000 4a8d74010c                     lea        rsi, [rcx + r8 + 0xc]
02005 498bd1                         mov        rdx, r9
02008 40f6c40f                       test       spl, 0xf
0200c 0f8412000000                   je         0x7f63d417a8a4
02012 4883ec08                       sub        rsp, 8
02016 e8a5285b07                     call       0x7f63db72d140
0201b 4883c408                       add        rsp, 8
0201f e905000000                     jmp        0x7f63d417a8a9
02024 e897285b07                     call       0x7f63db72d140
02029 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
02033 ff8278060000                   inc        dword ptr [rdx + 0x678]
02039 e97c040000                     jmp        0x7f63d417ad3a
0203e 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
02045 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
0204c 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
02053 899c24e0010000                 mov        dword ptr [rsp + 0x1e0], ebx
0205a 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
02061 90                             nop        
02062 90                             nop        
02063 90                             nop        
02064 90                             nop        
02065 90                             nop        
02066 90                             nop        
02067 90                             nop        
02068 898424d8010000                 mov        dword ptr [rsp + 0x1d8], eax
0206f 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
02077 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
02081 4883829006000001               add        qword ptr [rdx + 0x690], 1
02089 48ba186e105c00000000           movabs     rdx, 0x5c106e18
02093 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02096 83c102                         add        ecx, 2
02099 894a78                         mov        dword ptr [rdx + 0x78], ecx
0209c 81e1feff1f00                   and        ecx, 0x1ffffe
020a2 85c9                           test       ecx, ecx
020a4 0f84872b0000                   je         0x7f63d417d4b1
020aa 48ba186e105c00000000           movabs     rdx, 0x5c106e18
020b4 488d92e0000000                 lea        rdx, [rdx + 0xe0]
020bb 4885c0                         test       rax, rax
020be 7510                           jne        0x7f63d417a950
020c0 f6420801                       test       byte ptr [rdx + 8], 1
020c4 0f8506000000                   jne        0x7f63d417a950
020ca f048834a0801                   lock or    qword ptr [rdx + 8], 1
020d0 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
020da 488d9248030000                 lea        rdx, [rdx + 0x348]
020e1 4885c0                         test       rax, rax
020e4 7510                           jne        0x7f63d417a976
020e6 f6421001                       test       byte ptr [rdx + 0x10], 1
020ea 0f8506000000                   jne        0x7f63d417a976
020f0 f048834a1001                   lock or    qword ptr [rdx + 0x10], 1
020f6 48ba186e105c00000000           movabs     rdx, 0x5c106e18
02100 488382b000000001               add        qword ptr [rdx + 0xb0], 1
02108 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
02112 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02115 83c102                         add        ecx, 2
02118 894a78                         mov        dword ptr [rdx + 0x78], ecx
0211b 81e1feff1f00                   and        ecx, 0x1ffffe
02121 85c9                           test       ecx, ecx
02123 0f84292b0000                   je         0x7f63d417d4d2
02129 48ba908030e300000000           movabs     rdx, 0xe3308090
02133 48b9a0c778c8637f0000           movabs     rcx, 0x7f63c878c7a0
0213d 488b12                         mov        rdx, qword ptr [rdx]
02140 48c1ea2a                       shr        rdx, 0x2a
02144 48c1e209                       shl        rdx, 9
02148 41ba0000005c                   mov        r10d, 0x5c000000
0214e 4903d2                         add        rdx, r10
02151 41ba17000000                   mov        r10d, 0x17
02157 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0215b 7435                           je         0x7f63d417aa12
0215d 4983c202                       add        r10, 2
02161 4983fa1b                       cmp        r10, 0x1b
02165 75f0                           jne        0x7f63d417a9d7
02167 41ba17000000                   mov        r10d, 0x17
0216d 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02172 7412                           je         0x7f63d417aa06
02174 4983c202                       add        r10, 2
02178 4983fa1b                       cmp        r10, 0x1b
0217c 75ef                           jne        0x7f63d417a9ed
0217e 41ba16000000                   mov        r10d, 0x16
02184 eb10                           jmp        0x7f63d417aa16
02186 50                             push       rax
02187 4833c0                         xor        rax, rax
0218a 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
0218f 58                             pop        rax
02190 ebbf                           jmp        0x7f63d417a9d1
02192 4983c201                       add        r10, 1
02196 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0219b 48baf0c178c8637f0000           movabs     rdx, 0x7f63c878c1f0
021a5 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
021a8 83c102                         add        ecx, 2
021ab 894a78                         mov        dword ptr [rdx + 0x78], ecx
021ae 81e1feff1f00                   and        ecx, 0x1ffffe
021b4 85c9                           test       ecx, ecx
021b6 0f84b72a0000                   je         0x7f63d417d4f3
021bc 48baf0c178c8637f0000           movabs     rdx, 0x7f63c878c1f0
021c6 ff82b0000000                   inc        dword ptr [rdx + 0xb0]
021cc 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
021d6 ff8208010000                   inc        dword ptr [rdx + 0x108]
021dc 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
021e6 ff8228010000                   inc        dword ptr [rdx + 0x128]
021ec 48ba407830e300000000           movabs     rdx, 0xe3307840
021f6 48b9a0c778c8637f0000           movabs     rcx, 0x7f63c878c7a0
02200 488b12                         mov        rdx, qword ptr [rdx]
02203 48c1ea2a                       shr        rdx, 0x2a
02207 48c1e209                       shl        rdx, 9
0220b 41ba0000005c                   mov        r10d, 0x5c000000
02211 4903d2                         add        rdx, r10
02214 41ba28000000                   mov        r10d, 0x28
0221a 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0221e 7435                           je         0x7f63d417aad5
02220 4983c202                       add        r10, 2
02224 4983fa2c                       cmp        r10, 0x2c
02228 75f0                           jne        0x7f63d417aa9a
0222a 41ba28000000                   mov        r10d, 0x28
02230 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02235 7412                           je         0x7f63d417aac9
02237 4983c202                       add        r10, 2
0223b 4983fa2c                       cmp        r10, 0x2c
0223f 75ef                           jne        0x7f63d417aab0
02241 41ba27000000                   mov        r10d, 0x27
02247 eb10                           jmp        0x7f63d417aad9
02249 50                             push       rax
0224a 4833c0                         xor        rax, rax
0224d 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
02252 58                             pop        rax
02253 ebbf                           jmp        0x7f63d417aa94
02255 4983c201                       add        r10, 1
02259 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0225e 48ba20c578c8637f0000           movabs     rdx, 0x7f63c878c520
02268 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0226b 83c102                         add        ecx, 2
0226e 894a78                         mov        dword ptr [rdx + 0x78], ecx
02271 81e1feff1f00                   and        ecx, 0x1ffffe
02277 85c9                           test       ecx, ecx
02279 0f84152a0000                   je         0x7f63d417d514
0227f 48ba20c578c8637f0000           movabs     rdx, 0x7f63c878c520
02289 ff82b0000000                   inc        dword ptr [rdx + 0xb0]
0228f 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
02299 488d9288010000                 lea        rdx, [rdx + 0x188]
022a0 4885c0                         test       rax, rax
022a3 7510                           jne        0x7f63d417ab35
022a5 f6421801                       test       byte ptr [rdx + 0x18], 1
022a9 0f8506000000                   jne        0x7f63d417ab35
022af f048834a1801                   lock or    qword ptr [rdx + 0x18], 1
022b5 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
022bf 4883827801000001               add        qword ptr [rdx + 0x178], 1
022c7 48ba00cb78c8637f0000           movabs     rdx, 0x7f63c878cb00
022d1 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
022d4 83c102                         add        ecx, 2
022d7 894a78                         mov        dword ptr [rdx + 0x78], ecx
022da 81e1feff1f00                   and        ecx, 0x1ffffe
022e0 85c9                           test       ecx, ecx
022e2 0f84cd290000                   je         0x7f63d417d535
022e8 48ba00cb78c8637f0000           movabs     rdx, 0x7f63c878cb00
022f2 4883821001000001               add        qword ptr [rdx + 0x110], 1
022fa 48baa0ce145c00000000           movabs     rdx, 0x5c14cea0
02304 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02307 83c102                         add        ecx, 2
0230a 894a78                         mov        dword ptr [rdx + 0x78], ecx
0230d 81e1feff1f00                   and        ecx, 0x1ffffe
02313 85c9                           test       ecx, ecx
02315 0f84bb290000                   je         0x7f63d417d556
0231b 8b5008                         mov        edx, dword ptr [rax + 8]
0231e 48b9a0ce145c00000000           movabs     rcx, 0x5c14cea0
02328 488381b000000001               add        qword ptr [rcx + 0xb0], 1
02330 83ea07                         sub        edx, 7
02333 48b9981d23e200000000           movabs     rcx, 0xe2231d98
0233d b900000000                     mov        ecx, 0
02342 3bf9                           cmp        edi, ecx
02344 0f8cc6290000                   jl         0x7f63d417d590
0234a 3bfa                           cmp        edi, edx
0234c 0f8ddf290000                   jge        0x7f63d417d5b1
02352 488bd7                         mov        rdx, rdi
02355 48be00b722e200000000           movabs     rsi, 0xe222b700
0235f 488bce                         mov        rcx, rsi
02362 49b800cb78c8637f0000           movabs     r8, 0x7f63c878cb00
0236c 488b09                         mov        rcx, qword ptr [rcx]
0236f 48c1e92a                       shr        rcx, 0x2a
02373 48c1e109                       shl        rcx, 9
02377 41ba0000005c                   mov        r10d, 0x5c000000
0237d 4903ca                         add        rcx, r10
02380 41ba25000000                   mov        r10d, 0x25
02386 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0238a 7435                           je         0x7f63d417ac41
0238c 4983c202                       add        r10, 2
02390 4983fa29                       cmp        r10, 0x29
02394 75f0                           jne        0x7f63d417ac06
02396 41ba25000000                   mov        r10d, 0x25
0239c 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
023a1 7412                           je         0x7f63d417ac35
023a3 4983c202                       add        r10, 2
023a7 4983fa29                       cmp        r10, 0x29
023ab 75ef                           jne        0x7f63d417ac1c
023ad 41ba24000000                   mov        r10d, 0x24
023b3 eb10                           jmp        0x7f63d417ac45
023b5 50                             push       rax
023b6 4833c0                         xor        rax, rax
023b9 4b0fb10cd0                     cmpxchg    qword ptr [r8 + r10*8], rcx
023be 58                             pop        rax
023bf ebbf                           jmp        0x7f63d417ac00
023c1 4983c201                       add        r10, 1
023c5 4b8304d001                     add        qword ptr [r8 + r10*8], 1
023ca 4863d2                         movsxd     rdx, edx
023cd 488bca                         mov        rcx, rdx
023d0 41ba0c000000                   mov        r10d, 0xc
023d6 4903ca                         add        rcx, r10
023d9 488bd0                         mov        rdx, rax
023dc 41b800000000                   mov        r8d, 0
023e2 89bc24dc010000                 mov        dword ptr [rsp + 0x1dc], edi
023e9 90                             nop        
023ea 90                             nop        
023eb 90                             nop        
023ec 90                             nop        
023ed 90                             nop        
023ee 90                             nop        
023ef e8ec855c07                     call       0x7f63db743260
023f4 0f1f8400ec24000b               nop        dword ptr [rax + rax + 0xb0024ec]
023fc 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
02406 488386a006000001               add        qword ptr [rsi + 0x6a0], 1
0240e 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
02416 8b9424d8010000                 mov        edx, dword ptr [rsp + 0x1d8]
0241d 488bc8                         mov        rcx, rax
02420 90                             nop        
02421 90                             nop        
02422 90                             nop        
02423 90                             nop        
02424 90                             nop        
02425 90                             nop        
02426 90                             nop        
02427 e8b48f5c07                     call       0x7f63db743c60
0242c 0f1f84002425000c               nop        dword ptr [rax + rax + 0xc002524]
02434 8b8424d8010000                 mov        eax, dword ptr [rsp + 0x1d8]
0243b 83c008                         add        eax, 8
0243e 8bbc24dc010000                 mov        edi, dword ptr [rsp + 0x1dc]
02445 83c708                         add        edi, 8
02448 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
0244f be02000000                     mov        esi, 2
02454 7c05                           jl         0x7f63d417acdb
02456 be00000000                     mov        esi, 0
0245b 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
02465 8b4a7c                         mov        ecx, dword ptr [rdx + 0x7c]
02468 03ce                           add        ecx, esi
0246a 894a7c                         mov        dword ptr [rdx + 0x7c], ecx
0246d 85f6                           test       esi, esi
0246f 7505                           jne        0x7f63d417acf6
02471 b902000000                     mov        ecx, 2
02476 81e1fe3f0000                   and        ecx, 0x3ffe
0247c 85c9                           test       ecx, ecx
0247e 0f84ce280000                   je         0x7f63d417d5d2
02484 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02488 418502                         test       dword ptr [r10], eax
0248b 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
02492 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
0249c bab0060000                     mov        edx, 0x6b0
024a1 7c05                           jl         0x7f63d417ad28
024a3 bac0060000                     mov        edx, 0x6c0
024a8 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
024ac 488d4901                       lea        rcx, [rcx + 1]
024b0 48890c16                       mov        qword ptr [rsi + rdx], rcx
024b4 0f8caefbffff                   jl         0x7f63d417a8e8
024ba 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
024c1 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
024c8 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
024d2 ff86d0060000                   inc        dword ptr [rsi + 0x6d0]
024d8 e9711a0000                     jmp        0x7f63d417c7ce
024dd 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
024e4 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
024eb 4183f910                       cmp        r9d, 0x10
024ef 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
024f9 bae8060000                     mov        edx, 0x6e8
024fe 7c05                           jl         0x7f63d417ad85
02500 baf8060000                     mov        edx, 0x6f8
02505 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
02509 488d4901                       lea        rcx, [rcx + 1]
0250d 48890c16                       mov        qword ptr [rsi + rdx], rcx
02511 0f8cfd0a0000                   jl         0x7f63d417b894
02517 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
0251e 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
02525 899c24f0010000                 mov        dword ptr [rsp + 0x1f0], ebx
0252c 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
02533 90                             nop        
02534 90                             nop        
02535 90                             nop        
02536 90                             nop        
02537 90                             nop        
02538 898424ec010000                 mov        dword ptr [rsp + 0x1ec], eax
0253f 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
02547 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
02551 4883860807000001               add        qword ptr [rsi + 0x708], 1
02559 48be08f664c8637f0000           movabs     rsi, 0x7f63c864f608
02563 8b5678                         mov        edx, dword ptr [rsi + 0x78]
02566 83c202                         add        edx, 2
02569 895678                         mov        dword ptr [rsi + 0x78], edx
0256c 81e2feff1f00                   and        edx, 0x1ffffe
02572 85d2                           test       edx, edx
02574 0f84f9270000                   je         0x7f63d417d5f3
0257a 48be780238e300000000           movabs     rsi, 0xe3380278
02584 48ba08f664c8637f0000           movabs     rdx, 0x7f63c864f608
0258e 488b36                         mov        rsi, qword ptr [rsi]
02591 48c1ee2a                       shr        rsi, 0x2a
02595 48c1e609                       shl        rsi, 9
02599 41ba0000005c                   mov        r10d, 0x5c000000
0259f 4903f2                         add        rsi, r10
025a2 41ba17000000                   mov        r10d, 0x17
025a8 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
025ac 7435                           je         0x7f63d417ae63
025ae 4983c202                       add        r10, 2
025b2 4983fa1b                       cmp        r10, 0x1b
025b6 75f0                           jne        0x7f63d417ae28
025b8 41ba17000000                   mov        r10d, 0x17
025be 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
025c3 7412                           je         0x7f63d417ae57
025c5 4983c202                       add        r10, 2
025c9 4983fa1b                       cmp        r10, 0x1b
025cd 75ef                           jne        0x7f63d417ae3e
025cf 41ba16000000                   mov        r10d, 0x16
025d5 eb10                           jmp        0x7f63d417ae67
025d7 50                             push       rax
025d8 4833c0                         xor        rax, rax
025db 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
025e0 58                             pop        rax
025e1 ebbf                           jmp        0x7f63d417ae22
025e3 4983c201                       add        r10, 1
025e7 4a8304d201                     add        qword ptr [rdx + r10*8], 1
025ec 448b6808                       mov        r13d, dword ptr [rax + 8]
025f0 48be08f664c8637f0000           movabs     rsi, 0x7f63c864f608
025fa 488386e000000001               add        qword ptr [rsi + 0xe0], 1
02602 48be38eb64c8637f0000           movabs     rsi, 0x7f63c864eb38
0260c 8b5678                         mov        edx, dword ptr [rsi + 0x78]
0260f 83c202                         add        edx, 2
02612 895678                         mov        dword ptr [rsi + 0x78], edx
02615 81e2feff1f00                   and        edx, 0x1ffffe
0261b 85d2                           test       edx, edx
0261d 0f848a270000                   je         0x7f63d417d62d
02623 48be38eb64c8637f0000           movabs     rsi, 0x7f63c864eb38
0262d 4883861001000001               add        qword ptr [rsi + 0x110], 1
02635 498bf5                         mov        rsi, r13
02638 83ee0f                         sub        esi, 0xf
0263b 48bac8e164c8637f0000           movabs     rdx, 0x7f63c864e1c8
02645 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02648 83c102                         add        ecx, 2
0264b 894a78                         mov        dword ptr [rdx + 0x78], ecx
0264e 81e1feff1f00                   and        ecx, 0x1ffffe
02654 85c9                           test       ecx, ecx
02656 0f8472270000                   je         0x7f63d417d64e
0265c 48bac8e164c8637f0000           movabs     rdx, 0x7f63c864e1c8
02666 488382b000000001               add        qword ptr [rdx + 0xb0], 1
0266e 48ba0000000000000000           movabs     rdx, 0
02678 ba00000000                     mov        edx, 0
0267d 3bfa                           cmp        edi, edx
0267f 0f8c6a270000                   jl         0x7f63d417d66f
02685 3bfe                           cmp        edi, esi
02687 0f8d83270000                   jge        0x7f63d417d690
0268d 488bf7                         mov        rsi, rdi
02690 48ba780238e300000000           movabs     rdx, 0xe3380278
0269a 488bca                         mov        rcx, rdx
0269d 49b808f664c8637f0000           movabs     r8, 0x7f63c864f608
026a7 488b09                         mov        rcx, qword ptr [rcx]
026aa 48c1e92a                       shr        rcx, 0x2a
026ae 48c1e109                       shl        rcx, 9
026b2 41ba0000005c                   mov        r10d, 0x5c000000
026b8 4903ca                         add        rcx, r10
026bb 41ba25000000                   mov        r10d, 0x25
026c1 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
026c5 7435                           je         0x7f63d417af7c
026c7 4983c202                       add        r10, 2
026cb 4983fa29                       cmp        r10, 0x29
026cf 75f0                           jne        0x7f63d417af41
026d1 41ba25000000                   mov        r10d, 0x25
026d7 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
026dc 7412                           je         0x7f63d417af70
026de 4983c202                       add        r10, 2
026e2 4983fa29                       cmp        r10, 0x29
026e6 75ef                           jne        0x7f63d417af57
026e8 41ba24000000                   mov        r10d, 0x24
026ee eb10                           jmp        0x7f63d417af80
026f0 50                             push       rax
026f1 4833c0                         xor        rax, rax
026f4 4b0fb10cd0                     cmpxchg    qword ptr [r8 + r10*8], rcx
026f9 58                             pop        rax
026fa ebbf                           jmp        0x7f63d417af3b
026fc 4983c201                       add        r10, 1
02700 4b8304d001                     add        qword ptr [r8 + r10*8], 1
02705 48b9d0e264c8637f0000           movabs     rcx, 0x7f63c864e2d0
0270f 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
02713 4183c002                       add        r8d, 2
02717 44894178                       mov        dword ptr [rcx + 0x78], r8d
0271b 4181e0feff1f00                 and        r8d, 0x1ffffe
02722 4585c0                         test       r8d, r8d
02725 0f8406270000                   je         0x7f63d417d6b1
0272b 48b9d0e264c8637f0000           movabs     rcx, 0x7f63c864e2d0
02735 488381b000000001               add        qword ptr [rcx + 0xb0], 1
0273d 48ba00e464c8637f0000           movabs     rdx, 0x7f63c864e400
02747 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0274a 83c102                         add        ecx, 2
0274d 894a78                         mov        dword ptr [rdx + 0x78], ecx
02750 81e1feff1f00                   and        ecx, 0x1ffffe
02756 85c9                           test       ecx, ecx
02758 0f84f4260000                   je         0x7f63d417d6d2
0275e 48ba00e464c8637f0000           movabs     rdx, 0x7f63c864e400
02768 ff82c0000000                   inc        dword ptr [rdx + 0xc0]
0276e 4489ac24e8010000               mov        dword ptr [rsp + 0x1e8], r13d
02776 89bc24e4010000                 mov        dword ptr [rsp + 0x1e4], edi
0277d 48ba90d539e300000000           movabs     rdx, 0xe339d590
02787 488bca                         mov        rcx, rdx
0278a 49b808f664c8637f0000           movabs     r8, 0x7f63c864f608
02794 4983806001000001               add        qword ptr [r8 + 0x160], 1
0279c 48b9d8f764c8637f0000           movabs     rcx, 0x7f63c864f7d8
027a6 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
027aa 4183c002                       add        r8d, 2
027ae 44894178                       mov        dword ptr [rcx + 0x78], r8d
027b2 4181e0feff1f00                 and        r8d, 0x1ffffe
027b9 4585c0                         test       r8d, r8d
027bc 0f84b1260000                   je         0x7f63d417d6f3
027c2 488bca                         mov        rcx, rdx
027c5 49b8d8f764c8637f0000           movabs     r8, 0x7f63c864f7d8
027cf 498380b000000001               add        qword ptr [r8 + 0xb0], 1
027d7 48b9c0f864c8637f0000           movabs     rcx, 0x7f63c864f8c0
027e1 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
027e5 4183c002                       add        r8d, 2
027e9 44894178                       mov        dword ptr [rcx + 0x78], r8d
027ed 4181e0feff1f00                 and        r8d, 0x1ffffe
027f4 4585c0                         test       r8d, r8d
027f7 0f8497260000                   je         0x7f63d417d714
027fd 48b9c0f864c8637f0000           movabs     rcx, 0x7f63c864f8c0
02807 488381c000000001               add        qword ptr [rcx + 0xc0], 1
0280f 48bab8ec64c8637f0000           movabs     rdx, 0x7f63c864ecb8
02819 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0281c 83c102                         add        ecx, 2
0281f 894a78                         mov        dword ptr [rdx + 0x78], ecx
02822 81e1feff1f00                   and        ecx, 0x1ffffe
02828 85c9                           test       ecx, ecx
0282a 0f8485260000                   je         0x7f63d417d735
02830 48ba780238e300000000           movabs     rdx, 0xe3380278
0283a 488bca                         mov        rcx, rdx
0283d 49b8c0f864c8637f0000           movabs     r8, 0x7f63c864f8c0
02847 488b09                         mov        rcx, qword ptr [rcx]
0284a 48c1e92a                       shr        rcx, 0x2a
0284e 48c1e109                       shl        rcx, 9
02852 41ba0000005c                   mov        r10d, 0x5c000000
02858 4903ca                         add        rcx, r10
0285b 41ba1d000000                   mov        r10d, 0x1d
02861 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
02865 7435                           je         0x7f63d417b11c
02867 4983c202                       add        r10, 2
0286b 4983fa21                       cmp        r10, 0x21
0286f 75f0                           jne        0x7f63d417b0e1
02871 41ba1d000000                   mov        r10d, 0x1d
02877 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
0287c 7412                           je         0x7f63d417b110
0287e 4983c202                       add        r10, 2
02882 4983fa21                       cmp        r10, 0x21
02886 75ef                           jne        0x7f63d417b0f7
02888 41ba1c000000                   mov        r10d, 0x1c
0288e eb10                           jmp        0x7f63d417b120
02890 50                             push       rax
02891 4833c0                         xor        rax, rax
02894 4b0fb10cd0                     cmpxchg    qword ptr [r8 + r10*8], rcx
02899 58                             pop        rax
0289a ebbf                           jmp        0x7f63d417b0db
0289c 4983c201                       add        r10, 1
028a0 4b8304d001                     add        qword ptr [r8 + r10*8], 1
028a5 48b9c0f864c8637f0000           movabs     rcx, 0x7f63c864f8c0
028af 488b12                         mov        rdx, qword ptr [rdx]
028b2 48c1ea2a                       shr        rdx, 0x2a
028b6 48c1e209                       shl        rdx, 9
028ba 41ba0000005c                   mov        r10d, 0x5c000000
028c0 4903d2                         add        rdx, r10
028c3 41ba23000000                   mov        r10d, 0x23
028c9 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
028cd 7435                           je         0x7f63d417b184
028cf 4983c202                       add        r10, 2
028d3 4983fa27                       cmp        r10, 0x27
028d7 75f0                           jne        0x7f63d417b149
028d9 41ba23000000                   mov        r10d, 0x23
028df 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
028e4 7412                           je         0x7f63d417b178
028e6 4983c202                       add        r10, 2
028ea 4983fa27                       cmp        r10, 0x27
028ee 75ef                           jne        0x7f63d417b15f
028f0 41ba22000000                   mov        r10d, 0x22
028f6 eb10                           jmp        0x7f63d417b188
028f8 50                             push       rax
028f9 4833c0                         xor        rax, rax
028fc 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
02901 58                             pop        rax
02902 ebbf                           jmp        0x7f63d417b143
02904 4983c201                       add        r10, 1
02908 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0290d 48bac0f864c8637f0000           movabs     rdx, 0x7f63c864f8c0
02917 4883824001000001               add        qword ptr [rdx + 0x140], 1
0291f 48ba80ed64c8637f0000           movabs     rdx, 0x7f63c864ed80
02929 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0292c 83c102                         add        ecx, 2
0292f 894a78                         mov        dword ptr [rdx + 0x78], ecx
02932 81e1feff1f00                   and        ecx, 0x1ffffe
02938 85c9                           test       ecx, ecx
0293a 0f8496250000                   je         0x7f63d417d756
02940 48bac0f864c8637f0000           movabs     rdx, 0x7f63c864f8c0
0294a 4883825001000001               add        qword ptr [rdx + 0x150], 1
02952 4c63f6                         movsxd     r14, esi
02955 be0c000000                     mov        esi, 0xc
0295a 4d8bce                         mov        r9, r14
0295d 4c03ce                         add        r9, rsi
02960 48be08df64c8637f0000           movabs     rsi, 0x7f63c864df08
0296a 8b5678                         mov        edx, dword ptr [rsi + 0x78]
0296d 83c202                         add        edx, 2
02970 895678                         mov        dword ptr [rsi + 0x78], edx
02973 81e2feff1f00                   and        edx, 0x1ffffe
02979 85d2                           test       edx, edx
0297b 0f8476250000                   je         0x7f63d417d777
02981 48be08df64c8637f0000           movabs     rsi, 0x7f63c864df08
0298b 488386e000000001               add        qword ptr [rsi + 0xe0], 1
02993 48be88e064c8637f0000           movabs     rsi, 0x7f63c864e088
0299d 8b5678                         mov        edx, dword ptr [rsi + 0x78]
029a0 83c202                         add        edx, 2
029a3 895678                         mov        dword ptr [rsi + 0x78], edx
029a6 81e2feff1f00                   and        edx, 0x1ffffe
029ac 85d2                           test       edx, edx
029ae 0f8464250000                   je         0x7f63d417d798
029b4 48bec0f864c8637f0000           movabs     rsi, 0x7f63c864f8c0
029be 4883867001000001               add        qword ptr [rsi + 0x170], 1
029c6 48be60d03ae300000000           movabs     rsi, 0xe33ad060
029d0 48bec00238e300000000           movabs     rsi, 0xe33802c0
029da ba02000000                     mov        edx, 2
029df b910000000                     mov        ecx, 0x10
029e4 4c8bc0                         mov        r8, rax
029e7 bf00000000                     mov        edi, 0
029ec 48890424                       mov        qword ptr [rsp], rax
029f0 4c89742408                     mov        qword ptr [rsp + 8], r14
029f5 49ba780238e300000000           movabs     r10, 0xe3380278
029ff 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02a04 49ba60d03ae300000000           movabs     r10, 0xe33ad060
02a0e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02a13 90                             nop        
02a14 90                             nop        
02a15 90                             nop        
02a16 90                             nop        
02a17 e8c4895c07                     call       0x7f63db743c60
02a1c 0f1f8400142b000e               nop        dword ptr [rax + rax + 0xe002b14]
02a24 4885c0                         test       rax, rax
02a27 48bbc0f864c8637f0000           movabs     rbx, 0x7f63c864f8c0
02a31 750c                           jne        0x7f63d417b2bf
02a33 808b7901000001                 or         byte ptr [rbx + 0x179], 1
02a3a e98b000000                     jmp        0x7f63d417b34a
02a3f 488b38                         mov        rdi, qword ptr [rax]
02a42 48c1ef2a                       shr        rdi, 0x2a
02a46 48c1e709                       shl        rdi, 9
02a4a 41ba0000005c                   mov        r10d, 0x5c000000
02a50 4903fa                         add        rdi, r10
02a53 41ba31000000                   mov        r10d, 0x31
02a59 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
02a5d 7435                           je         0x7f63d417b314
02a5f 4983c202                       add        r10, 2
02a63 4983fa35                       cmp        r10, 0x35
02a67 75f0                           jne        0x7f63d417b2d9
02a69 41ba31000000                   mov        r10d, 0x31
02a6f 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02a74 7412                           je         0x7f63d417b308
02a76 4983c202                       add        r10, 2
02a7a 4983fa35                       cmp        r10, 0x35
02a7e 75ef                           jne        0x7f63d417b2ef
02a80 41ba30000000                   mov        r10d, 0x30
02a86 eb10                           jmp        0x7f63d417b318
02a88 50                             push       rax
02a89 4833c0                         xor        rax, rax
02a8c 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
02a91 58                             pop        rax
02a92 ebbf                           jmp        0x7f63d417b2d3
02a94 4983c201                       add        r10, 1
02a98 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02a9d 48bf00ec145c00000000           movabs     rdi, 0x5c14ec00
02aa7 488b18                         mov        rbx, qword ptr [rax]
02aaa 48c1eb2a                       shr        rbx, 0x2a
02aae 48c1e309                       shl        rbx, 9
02ab2 41ba0000005c                   mov        r10d, 0x5c000000
02ab8 4903da                         add        rbx, r10
02abb 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
02abf 0f8574240000                   jne        0x7f63d417d7b9
02ac5 e900000000                     jmp        0x7f63d417b34a
02aca 488bf8                         mov        rdi, rax
02acd 4889bc24f8010000               mov        qword ptr [rsp + 0x1f8], rdi
02ad5 483b07                         cmp        rax, qword ptr [rdi]
02ad8 488bf7                         mov        rsi, rdi
02adb 48bbd0d263c8637f0000           movabs     rbx, 0x7f63c863d2d0
02ae5 488b36                         mov        rsi, qword ptr [rsi]
02ae8 48c1ee2a                       shr        rsi, 0x2a
02aec 48c1e609                       shl        rsi, 9
02af0 41ba0000005c                   mov        r10d, 0x5c000000
02af6 4903f2                         add        rsi, r10
02af9 41bae4000000                   mov        r10d, 0xe4
02aff 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02b03 743b                           je         0x7f63d417b3c0
02b05 4983c202                       add        r10, 2
02b09 4981fae8000000                 cmp        r10, 0xe8
02b10 75ed                           jne        0x7f63d417b37f
02b12 41bae4000000                   mov        r10d, 0xe4
02b18 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02b1d 7415                           je         0x7f63d417b3b4
02b1f 4983c202                       add        r10, 2
02b23 4981fae8000000                 cmp        r10, 0xe8
02b2a 75ec                           jne        0x7f63d417b398
02b2c 41bae3000000                   mov        r10d, 0xe3
02b32 eb10                           jmp        0x7f63d417b3c4
02b34 50                             push       rax
02b35 4833c0                         xor        rax, rax
02b38 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
02b3d 58                             pop        rax
02b3e ebb9                           jmp        0x7f63d417b379
02b40 4983c201                       add        r10, 1
02b44 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02b49 48be100365c8637f0000           movabs     rsi, 0x7f63c8650310
02b53 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
02b56 83c302                         add        ebx, 2
02b59 895e78                         mov        dword ptr [rsi + 0x78], ebx
02b5c 81e3feff1f00                   and        ebx, 0x1ffffe
02b62 85db                           test       ebx, ebx
02b64 0f8405240000                   je         0x7f63d417d7ef
02b6a 488bf7                         mov        rsi, rdi
02b6d 48bb100365c8637f0000           movabs     rbx, 0x7f63c8650310
02b77 488b36                         mov        rsi, qword ptr [rsi]
02b7a 48c1ee2a                       shr        rsi, 0x2a
02b7e 48c1e609                       shl        rsi, 9
02b82 41ba0000005c                   mov        r10d, 0x5c000000
02b88 4903f2                         add        rsi, r10
02b8b 41ba17000000                   mov        r10d, 0x17
02b91 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02b95 7435                           je         0x7f63d417b44c
02b97 4983c202                       add        r10, 2
02b9b 4983fa1b                       cmp        r10, 0x1b
02b9f 75f0                           jne        0x7f63d417b411
02ba1 41ba17000000                   mov        r10d, 0x17
02ba7 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02bac 7412                           je         0x7f63d417b440
02bae 4983c202                       add        r10, 2
02bb2 4983fa1b                       cmp        r10, 0x1b
02bb6 75ef                           jne        0x7f63d417b427
02bb8 41ba16000000                   mov        r10d, 0x16
02bbe eb10                           jmp        0x7f63d417b450
02bc0 50                             push       rax
02bc1 4833c0                         xor        rax, rax
02bc4 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
02bc9 58                             pop        rax
02bca ebbf                           jmp        0x7f63d417b40b
02bcc 4983c201                       add        r10, 1
02bd0 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02bd5 488bf7                         mov        rsi, rdi
02bd8 90                             nop        
02bd9 90                             nop        
02bda 90                             nop        
02bdb 90                             nop        
02bdc 90                             nop        
02bdd 48b8b0d623a9637f0000           movabs     rax, 0x7f63a923d6b0
02be7 e8f4825c07                     call       0x7f63db743760
02bec 0f1f8400e42c000f               nop        dword ptr [rax + rax + 0xf002ce4]
02bf4 48be100365c8637f0000           movabs     rsi, 0x7f63c8650310
02bfe 488386e000000001               add        qword ptr [rsi + 0xe0], 1
02c06 48be38eb64c8637f0000           movabs     rsi, 0x7f63c864eb38
02c10 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
02c13 83c702                         add        edi, 2
02c16 897e78                         mov        dword ptr [rsi + 0x78], edi
02c19 81e7feff1f00                   and        edi, 0x1ffffe
02c1f 85ff                           test       edi, edi
02c21 0f8469230000                   je         0x7f63d417d810
02c27 448bac24e8010000               mov        r13d, dword ptr [rsp + 0x1e8]
02c2f 8bbc24ec010000                 mov        edi, dword ptr [rsp + 0x1ec]
02c36 48be38eb64c8637f0000           movabs     rsi, 0x7f63c864eb38
02c40 4883861001000001               add        qword ptr [rsi + 0x110], 1
02c48 ffc8                           dec        eax
02c4a 442be8                         sub        r13d, eax
02c4d 48bec8e164c8637f0000           movabs     rsi, 0x7f63c864e1c8
02c57 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
02c5a 83c302                         add        ebx, 2
02c5d 895e78                         mov        dword ptr [rsi + 0x78], ebx
02c60 81e3feff1f00                   and        ebx, 0x1ffffe
02c66 85db                           test       ebx, ebx
02c68 0f8443230000                   je         0x7f63d417d831
02c6e 48bec8e164c8637f0000           movabs     rsi, 0x7f63c864e1c8
02c78 488386b000000001               add        qword ptr [rsi + 0xb0], 1
02c80 48be0000000000000000           movabs     rsi, 0
02c8a be00000000                     mov        esi, 0
02c8f 3bfe                           cmp        edi, esi
02c91 0f8c3b230000                   jl         0x7f63d417d852
02c97 413bfd                         cmp        edi, r13d
02c9a 0f8d53230000                   jge        0x7f63d417d873
02ca0 488bc7                         mov        rax, rdi
02ca3 898424f4010000                 mov        dword ptr [rsp + 0x1f4], eax
02caa 89bc24ec010000                 mov        dword ptr [rsp + 0x1ec], edi
02cb1 488bbc24f8010000               mov        rdi, qword ptr [rsp + 0x1f8]
02cb9 488bf7                         mov        rsi, rdi
02cbc 48b9100365c8637f0000           movabs     rcx, 0x7f63c8650310
02cc6 488b36                         mov        rsi, qword ptr [rsi]
02cc9 48c1ee2a                       shr        rsi, 0x2a
02ccd 48c1e609                       shl        rsi, 9
02cd1 41ba0000005c                   mov        r10d, 0x5c000000
02cd7 4903f2                         add        rsi, r10
02cda 41ba1f000000                   mov        r10d, 0x1f
02ce0 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
02ce4 7435                           je         0x7f63d417b59b
02ce6 4983c202                       add        r10, 2
02cea 4983fa23                       cmp        r10, 0x23
02cee 75f0                           jne        0x7f63d417b560
02cf0 41ba1f000000                   mov        r10d, 0x1f
02cf6 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02cfb 7412                           je         0x7f63d417b58f
02cfd 4983c202                       add        r10, 2
02d01 4983fa23                       cmp        r10, 0x23
02d05 75ef                           jne        0x7f63d417b576
02d07 41ba1e000000                   mov        r10d, 0x1e
02d0d eb10                           jmp        0x7f63d417b59f
02d0f 50                             push       rax
02d10 4833c0                         xor        rax, rax
02d13 4a0fb134d1                     cmpxchg    qword ptr [rcx + r10*8], rsi
02d18 58                             pop        rax
02d19 ebbf                           jmp        0x7f63d417b55a
02d1b 4983c201                       add        r10, 1
02d1f 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02d24 488bf7                         mov        rsi, rdi
02d27 90                             nop        
02d28 90                             nop        
02d29 90                             nop        
02d2a 90                             nop        
02d2b 90                             nop        
02d2c 90                             nop        
02d2d 48b8d8d623a9637f0000           movabs     rax, 0x7f63a923d6d8
02d37 e8a4815c07                     call       0x7f63db743760
02d3c 0f1f8400342e0010               nop        dword ptr [rax + rax + 0x10002e34]
02d44 483b00                         cmp        rax, qword ptr [rax]
02d47 488bf0                         mov        rsi, rax
02d4a 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
02d54 488b36                         mov        rsi, qword ptr [rsi]
02d57 48c1ee2a                       shr        rsi, 0x2a
02d5b 48c1e609                       shl        rsi, 9
02d5f 41ba0000005c                   mov        r10d, 0x5c000000
02d65 4903f2                         add        rsi, r10
02d68 41ba25000000                   mov        r10d, 0x25
02d6e 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02d72 7435                           je         0x7f63d417b629
02d74 4983c202                       add        r10, 2
02d78 4983fa29                       cmp        r10, 0x29
02d7c 75f0                           jne        0x7f63d417b5ee
02d7e 41ba25000000                   mov        r10d, 0x25
02d84 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02d89 7412                           je         0x7f63d417b61d
02d8b 4983c202                       add        r10, 2
02d8f 4983fa29                       cmp        r10, 0x29
02d93 75ef                           jne        0x7f63d417b604
02d95 41ba24000000                   mov        r10d, 0x24
02d9b eb10                           jmp        0x7f63d417b62d
02d9d 50                             push       rax
02d9e 4833c0                         xor        rax, rax
02da1 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
02da6 58                             pop        rax
02da7 ebbf                           jmp        0x7f63d417b5e8
02da9 4983c201                       add        r10, 1
02dad 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02db2 8b7028                         mov        esi, dword ptr [rax + 0x28]
02db5 4c3b251c631a21                 cmp        r12, qword ptr [rip + 0x211a631c]
02dbc 0f8414000000                   je         0x7f63d417b656
02dc2 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
02dcc 4883e4f0                       and        rsp, 0xfffffffffffffff0
02dd0 e8ab525b20                     call       0x7f63f4730900
02dd5 f4                             hlt        
02dd6 488bd0                         mov        rdx, rax
02dd9 48b9100365c8637f0000           movabs     rcx, 0x7f63c8650310
02de3 488b12                         mov        rdx, qword ptr [rdx]
02de6 48c1ea2a                       shr        rdx, 0x2a
02dea 48c1e209                       shl        rdx, 9
02dee 41ba0000005c                   mov        r10d, 0x5c000000
02df4 4903d2                         add        rdx, r10
02df7 41ba2b000000                   mov        r10d, 0x2b
02dfd 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02e01 7435                           je         0x7f63d417b6b8
02e03 4983c202                       add        r10, 2
02e07 4983fa2f                       cmp        r10, 0x2f
02e0b 75f0                           jne        0x7f63d417b67d
02e0d 41ba2b000000                   mov        r10d, 0x2b
02e13 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02e18 7412                           je         0x7f63d417b6ac
02e1a 4983c202                       add        r10, 2
02e1e 4983fa2f                       cmp        r10, 0x2f
02e22 75ef                           jne        0x7f63d417b693
02e24 41ba2a000000                   mov        r10d, 0x2a
02e2a eb10                           jmp        0x7f63d417b6bc
02e2c 50                             push       rax
02e2d 4833c0                         xor        rax, rax
02e30 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
02e35 58                             pop        rax
02e36 ebbf                           jmp        0x7f63d417b677
02e38 4983c201                       add        r10, 1
02e3c 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02e41 8b4808                         mov        ecx, dword ptr [rax + 8]
02e44 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
02e4e 4883828001000001               add        qword ptr [rdx + 0x180], 1
02e56 48ba80ed64c8637f0000           movabs     rdx, 0x7f63c864ed80
02e60 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
02e64 4183c002                       add        r8d, 2
02e68 44894278                       mov        dword ptr [rdx + 0x78], r8d
02e6c 4181e0feff1f00                 and        r8d, 0x1ffffe
02e73 4585c0                         test       r8d, r8d
02e76 0f84b1210000                   je         0x7f63d417d8ad
02e7c 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
02e86 4883829001000001               add        qword ptr [rdx + 0x190], 1
02e8e 8b8424f4010000                 mov        eax, dword ptr [rsp + 0x1f4]
02e95 4863c0                         movsxd     rax, eax
02e98 ba0c000000                     mov        edx, 0xc
02e9d 4c8bc8                         mov        r9, rax
02ea0 4c03ca                         add        r9, rdx
02ea3 48ba08df64c8637f0000           movabs     rdx, 0x7f63c864df08
02ead 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
02eb1 4183c002                       add        r8d, 2
02eb5 44894278                       mov        dword ptr [rdx + 0x78], r8d
02eb9 4181e0feff1f00                 and        r8d, 0x1ffffe
02ec0 4585c0                         test       r8d, r8d
02ec3 0f8485210000                   je         0x7f63d417d8ce
02ec9 48ba08df64c8637f0000           movabs     rdx, 0x7f63c864df08
02ed3 488382e000000001               add        qword ptr [rdx + 0xe0], 1
02edb 48ba88e064c8637f0000           movabs     rdx, 0x7f63c864e088
02ee5 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
02ee9 4183c002                       add        r8d, 2
02eed 44894278                       mov        dword ptr [rdx + 0x78], r8d
02ef1 4181e0feff1f00                 and        r8d, 0x1ffffe
02ef8 4585c0                         test       r8d, r8d
02efb 0f846e210000                   je         0x7f63d417d8ef
02f01 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
02f0b 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
02f13 48ba08b13ce300000000           movabs     rdx, 0xe33cb108
02f1d ba02000000                     mov        edx, 2
02f22 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
02f2a bf00000000                     mov        edi, 0
02f2f 488b9c24f8010000               mov        rbx, qword ptr [rsp + 0x1f8]
02f37 48891c24                       mov        qword ptr [rsp], rbx
02f3b 488b9c2438010000               mov        rbx, qword ptr [rsp + 0x138]
02f43 48895c2408                     mov        qword ptr [rsp + 8], rbx
02f48 4889442410                     mov        qword ptr [rsp + 0x10], rax
02f4d 49ba08b13ce300000000           movabs     r10, 0xe33cb108
02f57 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02f5c 90                             nop        
02f5d 90                             nop        
02f5e 90                             nop        
02f5f e87c845c07                     call       0x7f63db743c60
02f64 0f1f84005c300011               nop        dword ptr [rax + rax + 0x1100305c]
02f6c 8b8424ec010000                 mov        eax, dword ptr [rsp + 0x1ec]
02f73 83c010                         add        eax, 0x10
02f76 8bbc24e4010000                 mov        edi, dword ptr [rsp + 0x1e4]
02f7d 83c710                         add        edi, 0x10
02f80 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02f87 ba02000000                     mov        edx, 2
02f8c 7c05                           jl         0x7f63d417b813
02f8e ba00000000                     mov        edx, 0
02f93 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
02f9d 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
02fa1 4403c2                         add        r8d, edx
02fa4 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
02fa8 85d2                           test       edx, edx
02faa 7506                           jne        0x7f63d417b832
02fac 41b802000000                   mov        r8d, 2
02fb2 4181e0fe3f0000                 and        r8d, 0x3ffe
02fb9 4585c0                         test       r8d, r8d
02fbc 0f84ce200000                   je         0x7f63d417d910
02fc2 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02fc6 418502                         test       dword ptr [r10], eax
02fc9 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02fd0 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
02fda b948070000                     mov        ecx, 0x748
02fdf 7c05                           jl         0x7f63d417b866
02fe1 b958070000                     mov        ecx, 0x758
02fe6 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
02fea 4d8d4001                       lea        r8, [r8 + 1]
02fee 4c89040a                       mov        qword ptr [rdx + rcx], r8
02ff2 0f8c40f5ffff                   jl         0x7f63d417adb8
02ff8 8b9c24f0010000                 mov        ebx, dword ptr [rsp + 0x1f0]
02fff 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
03009 ff8268070000                   inc        dword ptr [rdx + 0x768]
0300f e93a0f0000                     jmp        0x7f63d417c7ce
03014 4183f908                       cmp        r9d, 8
03018 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
03022 b980070000                     mov        ecx, 0x780
03027 7c05                           jl         0x7f63d417b8ae
03029 b990070000                     mov        ecx, 0x790
0302e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
03032 4d8d4001                       lea        r8, [r8 + 1]
03036 4c89040a                       mov        qword ptr [rdx + rcx], r8
0303a 0f8c8e040000                   jl         0x7f63d417bd4e
03040 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
03047 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
0304e 899c2408020000                 mov        dword ptr [rsp + 0x208], ebx
03055 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
0305c 90                             nop        
0305d 90                             nop        
0305e 90                             nop        
0305f 90                             nop        
03060 89842400020000                 mov        dword ptr [rsp + 0x200], eax
03067 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0306f 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
03079 488382a007000001               add        qword ptr [rdx + 0x7a0], 1
03081 48ba186e105c00000000           movabs     rdx, 0x5c106e18
0308b 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0308e 83c102                         add        ecx, 2
03091 894a78                         mov        dword ptr [rdx + 0x78], ecx
03094 81e1feff1f00                   and        ecx, 0x1ffffe
0309a 85c9                           test       ecx, ecx
0309c 0f840f200000                   je         0x7f63d417d931
030a2 48ba186e105c00000000           movabs     rdx, 0x5c106e18
030ac 488d92e0000000                 lea        rdx, [rdx + 0xe0]
030b3 4885c0                         test       rax, rax
030b6 7510                           jne        0x7f63d417b948
030b8 f6420801                       test       byte ptr [rdx + 8], 1
030bc 0f8506000000                   jne        0x7f63d417b948
030c2 f048834a0801                   lock or    qword ptr [rdx + 8], 1
030c8 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
030d2 488d9248030000                 lea        rdx, [rdx + 0x348]
030d9 4885c0                         test       rax, rax
030dc 7510                           jne        0x7f63d417b96e
030de f6421001                       test       byte ptr [rdx + 0x10], 1
030e2 0f8506000000                   jne        0x7f63d417b96e
030e8 f048834a1001                   lock or    qword ptr [rdx + 0x10], 1
030ee 48ba186e105c00000000           movabs     rdx, 0x5c106e18
030f8 488382b000000001               add        qword ptr [rdx + 0xb0], 1
03100 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
0310a 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0310d 83c102                         add        ecx, 2
03110 894a78                         mov        dword ptr [rdx + 0x78], ecx
03113 81e1feff1f00                   and        ecx, 0x1ffffe
03119 85c9                           test       ecx, ecx
0311b 0f84b11f0000                   je         0x7f63d417d952
03121 48ba908030e300000000           movabs     rdx, 0xe3308090
0312b 48b9a0c778c8637f0000           movabs     rcx, 0x7f63c878c7a0
03135 488b12                         mov        rdx, qword ptr [rdx]
03138 48c1ea2a                       shr        rdx, 0x2a
0313c 48c1e209                       shl        rdx, 9
03140 41ba0000005c                   mov        r10d, 0x5c000000
03146 4903d2                         add        rdx, r10
03149 41ba17000000                   mov        r10d, 0x17
0314f 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03153 7435                           je         0x7f63d417ba0a
03155 4983c202                       add        r10, 2
03159 4983fa1b                       cmp        r10, 0x1b
0315d 75f0                           jne        0x7f63d417b9cf
0315f 41ba17000000                   mov        r10d, 0x17
03165 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0316a 7412                           je         0x7f63d417b9fe
0316c 4983c202                       add        r10, 2
03170 4983fa1b                       cmp        r10, 0x1b
03174 75ef                           jne        0x7f63d417b9e5
03176 41ba16000000                   mov        r10d, 0x16
0317c eb10                           jmp        0x7f63d417ba0e
0317e 50                             push       rax
0317f 4833c0                         xor        rax, rax
03182 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
03187 58                             pop        rax
03188 ebbf                           jmp        0x7f63d417b9c9
0318a 4983c201                       add        r10, 1
0318e 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03193 48baf0c178c8637f0000           movabs     rdx, 0x7f63c878c1f0
0319d 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
031a0 83c102                         add        ecx, 2
031a3 894a78                         mov        dword ptr [rdx + 0x78], ecx
031a6 81e1feff1f00                   and        ecx, 0x1ffffe
031ac 85c9                           test       ecx, ecx
031ae 0f843f1f0000                   je         0x7f63d417d973
031b4 48baf0c178c8637f0000           movabs     rdx, 0x7f63c878c1f0
031be ff82b0000000                   inc        dword ptr [rdx + 0xb0]
031c4 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
031ce ff8208010000                   inc        dword ptr [rdx + 0x108]
031d4 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
031de ff8228010000                   inc        dword ptr [rdx + 0x128]
031e4 48ba407830e300000000           movabs     rdx, 0xe3307840
031ee 48b9a0c778c8637f0000           movabs     rcx, 0x7f63c878c7a0
031f8 488b12                         mov        rdx, qword ptr [rdx]
031fb 48c1ea2a                       shr        rdx, 0x2a
031ff 48c1e209                       shl        rdx, 9
03203 41ba0000005c                   mov        r10d, 0x5c000000
03209 4903d2                         add        rdx, r10
0320c 41ba28000000                   mov        r10d, 0x28
03212 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03216 7435                           je         0x7f63d417bacd
03218 4983c202                       add        r10, 2
0321c 4983fa2c                       cmp        r10, 0x2c
03220 75f0                           jne        0x7f63d417ba92
03222 41ba28000000                   mov        r10d, 0x28
03228 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0322d 7412                           je         0x7f63d417bac1
0322f 4983c202                       add        r10, 2
03233 4983fa2c                       cmp        r10, 0x2c
03237 75ef                           jne        0x7f63d417baa8
03239 41ba27000000                   mov        r10d, 0x27
0323f eb10                           jmp        0x7f63d417bad1
03241 50                             push       rax
03242 4833c0                         xor        rax, rax
03245 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
0324a 58                             pop        rax
0324b ebbf                           jmp        0x7f63d417ba8c
0324d 4983c201                       add        r10, 1
03251 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03256 48ba20c578c8637f0000           movabs     rdx, 0x7f63c878c520
03260 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03263 83c102                         add        ecx, 2
03266 894a78                         mov        dword ptr [rdx + 0x78], ecx
03269 81e1feff1f00                   and        ecx, 0x1ffffe
0326f 85c9                           test       ecx, ecx
03271 0f849d1e0000                   je         0x7f63d417d994
03277 48ba20c578c8637f0000           movabs     rdx, 0x7f63c878c520
03281 ff82b0000000                   inc        dword ptr [rdx + 0xb0]
03287 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
03291 488d9288010000                 lea        rdx, [rdx + 0x188]
03298 4885c0                         test       rax, rax
0329b 7510                           jne        0x7f63d417bb2d
0329d f6421801                       test       byte ptr [rdx + 0x18], 1
032a1 0f8506000000                   jne        0x7f63d417bb2d
032a7 f048834a1801                   lock or    qword ptr [rdx + 0x18], 1
032ad 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
032b7 4883827801000001               add        qword ptr [rdx + 0x178], 1
032bf 48ba00cb78c8637f0000           movabs     rdx, 0x7f63c878cb00
032c9 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
032cc 83c102                         add        ecx, 2
032cf 894a78                         mov        dword ptr [rdx + 0x78], ecx
032d2 81e1feff1f00                   and        ecx, 0x1ffffe
032d8 85c9                           test       ecx, ecx
032da 0f84551e0000                   je         0x7f63d417d9b5
032e0 48ba00cb78c8637f0000           movabs     rdx, 0x7f63c878cb00
032ea 4883821001000001               add        qword ptr [rdx + 0x110], 1
032f2 48baa0ce145c00000000           movabs     rdx, 0x5c14cea0
032fc 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
032ff 83c102                         add        ecx, 2
03302 894a78                         mov        dword ptr [rdx + 0x78], ecx
03305 81e1feff1f00                   and        ecx, 0x1ffffe
0330b 85c9                           test       ecx, ecx
0330d 0f84431e0000                   je         0x7f63d417d9d6
03313 8b5008                         mov        edx, dword ptr [rax + 8]
03316 48b9a0ce145c00000000           movabs     rcx, 0x5c14cea0
03320 488381b000000001               add        qword ptr [rcx + 0xb0], 1
03328 83ea07                         sub        edx, 7
0332b 48b9981d23e200000000           movabs     rcx, 0xe2231d98
03335 b900000000                     mov        ecx, 0
0333a 3bf9                           cmp        edi, ecx
0333c 0f8c4e1e0000                   jl         0x7f63d417da10
03342 3bfa                           cmp        edi, edx
03344 0f8d671e0000                   jge        0x7f63d417da31
0334a 488bd7                         mov        rdx, rdi
0334d 48be00b722e200000000           movabs     rsi, 0xe222b700
03357 488bce                         mov        rcx, rsi
0335a 49b800cb78c8637f0000           movabs     r8, 0x7f63c878cb00
03364 488b09                         mov        rcx, qword ptr [rcx]
03367 48c1e92a                       shr        rcx, 0x2a
0336b 48c1e109                       shl        rcx, 9
0336f 41ba0000005c                   mov        r10d, 0x5c000000
03375 4903ca                         add        rcx, r10
03378 41ba25000000                   mov        r10d, 0x25
0337e 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
03382 7435                           je         0x7f63d417bc39
03384 4983c202                       add        r10, 2
03388 4983fa29                       cmp        r10, 0x29
0338c 75f0                           jne        0x7f63d417bbfe
0338e 41ba25000000                   mov        r10d, 0x25
03394 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
03399 7412                           je         0x7f63d417bc2d
0339b 4983c202                       add        r10, 2
0339f 4983fa29                       cmp        r10, 0x29
033a3 75ef                           jne        0x7f63d417bc14
033a5 41ba24000000                   mov        r10d, 0x24
033ab eb10                           jmp        0x7f63d417bc3d
033ad 50                             push       rax
033ae 4833c0                         xor        rax, rax
033b1 4b0fb10cd0                     cmpxchg    qword ptr [r8 + r10*8], rcx
033b6 58                             pop        rax
033b7 ebbf                           jmp        0x7f63d417bbf8
033b9 4983c201                       add        r10, 1
033bd 4b8304d001                     add        qword ptr [r8 + r10*8], 1
033c2 4863d2                         movsxd     rdx, edx
033c5 488bca                         mov        rcx, rdx
033c8 41ba0c000000                   mov        r10d, 0xc
033ce 4903ca                         add        rcx, r10
033d1 488bd0                         mov        rdx, rax
033d4 41b800000000                   mov        r8d, 0
033da 89bc2404020000                 mov        dword ptr [rsp + 0x204], edi
033e1 90                             nop        
033e2 90                             nop        
033e3 90                             nop        
033e4 90                             nop        
033e5 90                             nop        
033e6 90                             nop        
033e7 e8f4755c07                     call       0x7f63db743260
033ec 0f1f8400e4340013               nop        dword ptr [rax + rax + 0x130034e4]
033f4 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
033fe 488386b007000001               add        qword ptr [rsi + 0x7b0], 1
03406 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
0340e 8b942400020000                 mov        edx, dword ptr [rsp + 0x200]
03415 488bc8                         mov        rcx, rax
03418 90                             nop        
03419 90                             nop        
0341a 90                             nop        
0341b 90                             nop        
0341c 90                             nop        
0341d 90                             nop        
0341e 90                             nop        
0341f e8bc7f5c07                     call       0x7f63db743c60
03424 0f1f84001c350014               nop        dword ptr [rax + rax + 0x1400351c]
0342c 8b842400020000                 mov        eax, dword ptr [rsp + 0x200]
03433 83c008                         add        eax, 8
03436 8bbc2404020000                 mov        edi, dword ptr [rsp + 0x204]
0343d 83c708                         add        edi, 8
03440 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
03447 be02000000                     mov        esi, 2
0344c 7c05                           jl         0x7f63d417bcd3
0344e be00000000                     mov        esi, 0
03453 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
0345d 8b4a7c                         mov        ecx, dword ptr [rdx + 0x7c]
03460 03ce                           add        ecx, esi
03462 894a7c                         mov        dword ptr [rdx + 0x7c], ecx
03465 85f6                           test       esi, esi
03467 7505                           jne        0x7f63d417bcee
03469 b902000000                     mov        ecx, 2
0346e 81e1fe3f0000                   and        ecx, 0x3ffe
03474 85c9                           test       ecx, ecx
03476 0f84561d0000                   je         0x7f63d417da52
0347c 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03480 418502                         test       dword ptr [r10], eax
03483 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
0348a 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
03494 bac0070000                     mov        edx, 0x7c0
03499 7c05                           jl         0x7f63d417bd20
0349b bad0070000                     mov        edx, 0x7d0
034a0 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
034a4 488d4901                       lea        rcx, [rcx + 1]
034a8 48890c16                       mov        qword ptr [rsi + rdx], rcx
034ac 0f8caefbffff                   jl         0x7f63d417b8e0
034b2 8b9c2408020000                 mov        ebx, dword ptr [rsp + 0x208]
034b9 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
034c3 ff86e0070000                   inc        dword ptr [rsi + 0x7e0]
034c9 e9800a0000                     jmp        0x7f63d417c7ce
034ce 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
034d8 488386f807000001               add        qword ptr [rsi + 0x7f8], 1
034e0 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
034e8 8b9424d0010000                 mov        edx, dword ptr [rsp + 0x1d0]
034ef 488bcf                         mov        rcx, rdi
034f2 4d8bc1                         mov        r8, r9
034f5 448b8c2478010000               mov        r9d, dword ptr [rsp + 0x178]
034fd 90                             nop        
034fe 90                             nop        
034ff e8dc7e5c07                     call       0x7f63db743c60
03504 0f1f8400fc350016               nop        dword ptr [rax + rax + 0x160035fc]
0350c 488bd8                         mov        rbx, rax
0350f e93a0a0000                     jmp        0x7f63d417c7ce
03514 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
0351b 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
03522 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0352a 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
03534 488386d005000001               add        qword ptr [rsi + 0x5d0], 1
0353c 48be08f664c8637f0000           movabs     rsi, 0x7f63c864f608
03546 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03549 83c202                         add        edx, 2
0354c 895678                         mov        dword ptr [rsi + 0x78], edx
0354f 81e2feff1f00                   and        edx, 0x1ffffe
03555 85d2                           test       edx, edx
03557 0f84961c0000                   je         0x7f63d417da73
0355d 48be780238e300000000           movabs     rsi, 0xe3380278
03567 48ba08f664c8637f0000           movabs     rdx, 0x7f63c864f608
03571 488b36                         mov        rsi, qword ptr [rsi]
03574 48c1ee2a                       shr        rsi, 0x2a
03578 48c1e609                       shl        rsi, 9
0357c 41ba0000005c                   mov        r10d, 0x5c000000
03582 4903f2                         add        rsi, r10
03585 41ba17000000                   mov        r10d, 0x17
0358b 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
0358f 7435                           je         0x7f63d417be46
03591 4983c202                       add        r10, 2
03595 4983fa1b                       cmp        r10, 0x1b
03599 75f0                           jne        0x7f63d417be0b
0359b 41ba17000000                   mov        r10d, 0x17
035a1 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
035a6 7412                           je         0x7f63d417be3a
035a8 4983c202                       add        r10, 2
035ac 4983fa1b                       cmp        r10, 0x1b
035b0 75ef                           jne        0x7f63d417be21
035b2 41ba16000000                   mov        r10d, 0x16
035b8 eb10                           jmp        0x7f63d417be4a
035ba 50                             push       rax
035bb 4833c0                         xor        rax, rax
035be 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
035c3 58                             pop        rax
035c4 ebbf                           jmp        0x7f63d417be05
035c6 4983c201                       add        r10, 1
035ca 4a8304d201                     add        qword ptr [rdx + r10*8], 1
035cf 8b5808                         mov        ebx, dword ptr [rax + 8]
035d2 48be08f664c8637f0000           movabs     rsi, 0x7f63c864f608
035dc 488386e000000001               add        qword ptr [rsi + 0xe0], 1
035e4 48be38eb64c8637f0000           movabs     rsi, 0x7f63c864eb38
035ee 8b5678                         mov        edx, dword ptr [rsi + 0x78]
035f1 83c202                         add        edx, 2
035f4 895678                         mov        dword ptr [rsi + 0x78], edx
035f7 81e2feff1f00                   and        edx, 0x1ffffe
035fd 85d2                           test       edx, edx
035ff 0f84281c0000                   je         0x7f63d417daad
03605 48be38eb64c8637f0000           movabs     rsi, 0x7f63c864eb38
0360f 4883861001000001               add        qword ptr [rsi + 0x110], 1
03617 488bf3                         mov        rsi, rbx
0361a 83ee0f                         sub        esi, 0xf
0361d 48bac8e164c8637f0000           movabs     rdx, 0x7f63c864e1c8
03627 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0362a 83c102                         add        ecx, 2
0362d 894a78                         mov        dword ptr [rdx + 0x78], ecx
03630 81e1feff1f00                   and        ecx, 0x1ffffe
03636 85c9                           test       ecx, ecx
03638 0f84101c0000                   je         0x7f63d417dace
0363e 48bac8e164c8637f0000           movabs     rdx, 0x7f63c864e1c8
03648 488382b000000001               add        qword ptr [rdx + 0xb0], 1
03650 48ba0000000000000000           movabs     rdx, 0
0365a ba00000000                     mov        edx, 0
0365f 3bfa                           cmp        edi, edx
03661 0f8c081c0000                   jl         0x7f63d417daef
03667 3bfe                           cmp        edi, esi
03669 0f8d211c0000                   jge        0x7f63d417db10
0366f 48be780238e300000000           movabs     rsi, 0xe3380278
03679 488bd6                         mov        rdx, rsi
0367c 48b908f664c8637f0000           movabs     rcx, 0x7f63c864f608
03686 488b12                         mov        rdx, qword ptr [rdx]
03689 48c1ea2a                       shr        rdx, 0x2a
0368d 48c1e209                       shl        rdx, 9
03691 41ba0000005c                   mov        r10d, 0x5c000000
03697 4903d2                         add        rdx, r10
0369a 41ba25000000                   mov        r10d, 0x25
036a0 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
036a4 7435                           je         0x7f63d417bf5b
036a6 4983c202                       add        r10, 2
036aa 4983fa29                       cmp        r10, 0x29
036ae 75f0                           jne        0x7f63d417bf20
036b0 41ba25000000                   mov        r10d, 0x25
036b6 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
036bb 7412                           je         0x7f63d417bf4f
036bd 4983c202                       add        r10, 2
036c1 4983fa29                       cmp        r10, 0x29
036c5 75ef                           jne        0x7f63d417bf36
036c7 41ba24000000                   mov        r10d, 0x24
036cd eb10                           jmp        0x7f63d417bf5f
036cf 50                             push       rax
036d0 4833c0                         xor        rax, rax
036d3 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
036d8 58                             pop        rax
036d9 ebbf                           jmp        0x7f63d417bf1a
036db 4983c201                       add        r10, 1
036df 4a8304d101                     add        qword ptr [rcx + r10*8], 1
036e4 48bad0e264c8637f0000           movabs     rdx, 0x7f63c864e2d0
036ee 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
036f1 83c102                         add        ecx, 2
036f4 894a78                         mov        dword ptr [rdx + 0x78], ecx
036f7 81e1feff1f00                   and        ecx, 0x1ffffe
036fd 85c9                           test       ecx, ecx
036ff 0f84ac1b0000                   je         0x7f63d417db31
03705 48bad0e264c8637f0000           movabs     rdx, 0x7f63c864e2d0
0370f 488382b000000001               add        qword ptr [rdx + 0xb0], 1
03717 48be00e464c8637f0000           movabs     rsi, 0x7f63c864e400
03721 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03724 83c202                         add        edx, 2
03727 895678                         mov        dword ptr [rsi + 0x78], edx
0372a 81e2feff1f00                   and        edx, 0x1ffffe
03730 85d2                           test       edx, edx
03732 0f849a1b0000                   je         0x7f63d417db52
03738 48be00e464c8637f0000           movabs     rsi, 0x7f63c864e400
03742 ff86c0000000                   inc        dword ptr [rsi + 0xc0]
03748 899c240c020000                 mov        dword ptr [rsp + 0x20c], ebx
0374f 48be90d539e300000000           movabs     rsi, 0xe339d590
03759 488bd6                         mov        rdx, rsi
0375c 48b908f664c8637f0000           movabs     rcx, 0x7f63c864f608
03766 4883816001000001               add        qword ptr [rcx + 0x160], 1
0376e 48bad8f764c8637f0000           movabs     rdx, 0x7f63c864f7d8
03778 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0377b 83c102                         add        ecx, 2
0377e 894a78                         mov        dword ptr [rdx + 0x78], ecx
03781 81e1feff1f00                   and        ecx, 0x1ffffe
03787 85c9                           test       ecx, ecx
03789 0f84641b0000                   je         0x7f63d417db73
0378f 488bd6                         mov        rdx, rsi
03792 48b9d8f764c8637f0000           movabs     rcx, 0x7f63c864f7d8
0379c 488381b000000001               add        qword ptr [rcx + 0xb0], 1
037a4 48bac0f864c8637f0000           movabs     rdx, 0x7f63c864f8c0
037ae 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
037b1 83c102                         add        ecx, 2
037b4 894a78                         mov        dword ptr [rdx + 0x78], ecx
037b7 81e1feff1f00                   and        ecx, 0x1ffffe
037bd 85c9                           test       ecx, ecx
037bf 0f844f1b0000                   je         0x7f63d417db94
037c5 48bac0f864c8637f0000           movabs     rdx, 0x7f63c864f8c0
037cf 488382c000000001               add        qword ptr [rdx + 0xc0], 1
037d7 48beb8ec64c8637f0000           movabs     rsi, 0x7f63c864ecb8
037e1 8b5678                         mov        edx, dword ptr [rsi + 0x78]
037e4 83c202                         add        edx, 2
037e7 895678                         mov        dword ptr [rsi + 0x78], edx
037ea 81e2feff1f00                   and        edx, 0x1ffffe
037f0 85d2                           test       edx, edx
037f2 0f843d1b0000                   je         0x7f63d417dbb5
037f8 48be780238e300000000           movabs     rsi, 0xe3380278
03802 488bd6                         mov        rdx, rsi
03805 48b9c0f864c8637f0000           movabs     rcx, 0x7f63c864f8c0
0380f 488b12                         mov        rdx, qword ptr [rdx]
03812 48c1ea2a                       shr        rdx, 0x2a
03816 48c1e209                       shl        rdx, 9
0381a 41ba0000005c                   mov        r10d, 0x5c000000
03820 4903d2                         add        rdx, r10
03823 41ba1d000000                   mov        r10d, 0x1d
03829 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0382d 7435                           je         0x7f63d417c0e4
0382f 4983c202                       add        r10, 2
03833 4983fa21                       cmp        r10, 0x21
03837 75f0                           jne        0x7f63d417c0a9
03839 41ba1d000000                   mov        r10d, 0x1d
0383f 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03844 7412                           je         0x7f63d417c0d8
03846 4983c202                       add        r10, 2
0384a 4983fa21                       cmp        r10, 0x21
0384e 75ef                           jne        0x7f63d417c0bf
03850 41ba1c000000                   mov        r10d, 0x1c
03856 eb10                           jmp        0x7f63d417c0e8
03858 50                             push       rax
03859 4833c0                         xor        rax, rax
0385c 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
03861 58                             pop        rax
03862 ebbf                           jmp        0x7f63d417c0a3
03864 4983c201                       add        r10, 1
03868 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0386d 48bac0f864c8637f0000           movabs     rdx, 0x7f63c864f8c0
03877 488b36                         mov        rsi, qword ptr [rsi]
0387a 48c1ee2a                       shr        rsi, 0x2a
0387e 48c1e609                       shl        rsi, 9
03882 41ba0000005c                   mov        r10d, 0x5c000000
03888 4903f2                         add        rsi, r10
0388b 41ba23000000                   mov        r10d, 0x23
03891 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03895 7435                           je         0x7f63d417c14c
03897 4983c202                       add        r10, 2
0389b 4983fa27                       cmp        r10, 0x27
0389f 75f0                           jne        0x7f63d417c111
038a1 41ba23000000                   mov        r10d, 0x23
038a7 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
038ac 7412                           je         0x7f63d417c140
038ae 4983c202                       add        r10, 2
038b2 4983fa27                       cmp        r10, 0x27
038b6 75ef                           jne        0x7f63d417c127
038b8 41ba22000000                   mov        r10d, 0x22
038be eb10                           jmp        0x7f63d417c150
038c0 50                             push       rax
038c1 4833c0                         xor        rax, rax
038c4 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
038c9 58                             pop        rax
038ca ebbf                           jmp        0x7f63d417c10b
038cc 4983c201                       add        r10, 1
038d0 4a8304d201                     add        qword ptr [rdx + r10*8], 1
038d5 48bec0f864c8637f0000           movabs     rsi, 0x7f63c864f8c0
038df 4883864001000001               add        qword ptr [rsi + 0x140], 1
038e7 48be80ed64c8637f0000           movabs     rsi, 0x7f63c864ed80
038f1 8b5678                         mov        edx, dword ptr [rsi + 0x78]
038f4 83c202                         add        edx, 2
038f7 895678                         mov        dword ptr [rsi + 0x78], edx
038fa 81e2feff1f00                   and        edx, 0x1ffffe
03900 85d2                           test       edx, edx
03902 0f844e1a0000                   je         0x7f63d417dbd6
03908 48bec0f864c8637f0000           movabs     rsi, 0x7f63c864f8c0
03912 4883865001000001               add        qword ptr [rsi + 0x150], 1
0391a 4c63df                         movsxd     r11, edi
0391d be0c000000                     mov        esi, 0xc
03922 4d8bcb                         mov        r9, r11
03925 4c03ce                         add        r9, rsi
03928 48be08df64c8637f0000           movabs     rsi, 0x7f63c864df08
03932 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03935 83c202                         add        edx, 2
03938 895678                         mov        dword ptr [rsi + 0x78], edx
0393b 81e2feff1f00                   and        edx, 0x1ffffe
03941 85d2                           test       edx, edx
03943 0f842e1a0000                   je         0x7f63d417dbf7
03949 48be08df64c8637f0000           movabs     rsi, 0x7f63c864df08
03953 488386e000000001               add        qword ptr [rsi + 0xe0], 1
0395b 48be88e064c8637f0000           movabs     rsi, 0x7f63c864e088
03965 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03968 83c202                         add        edx, 2
0396b 895678                         mov        dword ptr [rsi + 0x78], edx
0396e 81e2feff1f00                   and        edx, 0x1ffffe
03974 85d2                           test       edx, edx
03976 0f841c1a0000                   je         0x7f63d417dc18
0397c 48bec0f864c8637f0000           movabs     rsi, 0x7f63c864f8c0
03986 4883867001000001               add        qword ptr [rsi + 0x170], 1
0398e 48be60d03ae300000000           movabs     rsi, 0xe33ad060
03998 48bec00238e300000000           movabs     rsi, 0xe33802c0
039a2 ba02000000                     mov        edx, 2
039a7 b910000000                     mov        ecx, 0x10
039ac 4c8bc0                         mov        r8, rax
039af bf00000000                     mov        edi, 0
039b4 48890424                       mov        qword ptr [rsp], rax
039b8 4c895c2408                     mov        qword ptr [rsp + 8], r11
039bd 49ba780238e300000000           movabs     r10, 0xe3380278
039c7 4c89542410                     mov        qword ptr [rsp + 0x10], r10
039cc 49ba60d03ae300000000           movabs     r10, 0xe33ad060
039d6 4c89542418                     mov        qword ptr [rsp + 0x18], r10
039db 90                             nop        
039dc 90                             nop        
039dd 90                             nop        
039de 90                             nop        
039df e8fc795c07                     call       0x7f63db743c60
039e4 0f1f8400dc3a0017               nop        dword ptr [rax + rax + 0x17003adc]
039ec 4885c0                         test       rax, rax
039ef 48bbc0f864c8637f0000           movabs     rbx, 0x7f63c864f8c0
039f9 750c                           jne        0x7f63d417c287
039fb 808b7901000001                 or         byte ptr [rbx + 0x179], 1
03a02 e98b000000                     jmp        0x7f63d417c312
03a07 488b38                         mov        rdi, qword ptr [rax]
03a0a 48c1ef2a                       shr        rdi, 0x2a
03a0e 48c1e709                       shl        rdi, 9
03a12 41ba0000005c                   mov        r10d, 0x5c000000
03a18 4903fa                         add        rdi, r10
03a1b 41ba31000000                   mov        r10d, 0x31
03a21 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
03a25 7435                           je         0x7f63d417c2dc
03a27 4983c202                       add        r10, 2
03a2b 4983fa35                       cmp        r10, 0x35
03a2f 75f0                           jne        0x7f63d417c2a1
03a31 41ba31000000                   mov        r10d, 0x31
03a37 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03a3c 7412                           je         0x7f63d417c2d0
03a3e 4983c202                       add        r10, 2
03a42 4983fa35                       cmp        r10, 0x35
03a46 75ef                           jne        0x7f63d417c2b7
03a48 41ba30000000                   mov        r10d, 0x30
03a4e eb10                           jmp        0x7f63d417c2e0
03a50 50                             push       rax
03a51 4833c0                         xor        rax, rax
03a54 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
03a59 58                             pop        rax
03a5a ebbf                           jmp        0x7f63d417c29b
03a5c 4983c201                       add        r10, 1
03a60 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03a65 48bf00ec145c00000000           movabs     rdi, 0x5c14ec00
03a6f 488b18                         mov        rbx, qword ptr [rax]
03a72 48c1eb2a                       shr        rbx, 0x2a
03a76 48c1e309                       shl        rbx, 9
03a7a 41ba0000005c                   mov        r10d, 0x5c000000
03a80 4903da                         add        rbx, r10
03a83 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
03a87 0f852c190000                   jne        0x7f63d417dc39
03a8d e900000000                     jmp        0x7f63d417c312
03a92 488bf8                         mov        rdi, rax
03a95 4889bc2410020000               mov        qword ptr [rsp + 0x210], rdi
03a9d 483b07                         cmp        rax, qword ptr [rdi]
03aa0 488bf7                         mov        rsi, rdi
03aa3 48bbd0d263c8637f0000           movabs     rbx, 0x7f63c863d2d0
03aad 488b36                         mov        rsi, qword ptr [rsi]
03ab0 48c1ee2a                       shr        rsi, 0x2a
03ab4 48c1e609                       shl        rsi, 9
03ab8 41ba0000005c                   mov        r10d, 0x5c000000
03abe 4903f2                         add        rsi, r10
03ac1 41babd000000                   mov        r10d, 0xbd
03ac7 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03acb 743b                           je         0x7f63d417c388
03acd 4983c202                       add        r10, 2
03ad1 4981fac1000000                 cmp        r10, 0xc1
03ad8 75ed                           jne        0x7f63d417c347
03ada 41babd000000                   mov        r10d, 0xbd
03ae0 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03ae5 7415                           je         0x7f63d417c37c
03ae7 4983c202                       add        r10, 2
03aeb 4981fac1000000                 cmp        r10, 0xc1
03af2 75ec                           jne        0x7f63d417c360
03af4 41babc000000                   mov        r10d, 0xbc
03afa eb10                           jmp        0x7f63d417c38c
03afc 50                             push       rax
03afd 4833c0                         xor        rax, rax
03b00 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
03b05 58                             pop        rax
03b06 ebb9                           jmp        0x7f63d417c341
03b08 4983c201                       add        r10, 1
03b0c 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03b11 48be100365c8637f0000           movabs     rsi, 0x7f63c8650310
03b1b 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
03b1e 83c302                         add        ebx, 2
03b21 895e78                         mov        dword ptr [rsi + 0x78], ebx
03b24 81e3feff1f00                   and        ebx, 0x1ffffe
03b2a 85db                           test       ebx, ebx
03b2c 0f84bd180000                   je         0x7f63d417dc6f
03b32 488bf7                         mov        rsi, rdi
03b35 48bb100365c8637f0000           movabs     rbx, 0x7f63c8650310
03b3f 488b36                         mov        rsi, qword ptr [rsi]
03b42 48c1ee2a                       shr        rsi, 0x2a
03b46 48c1e609                       shl        rsi, 9
03b4a 41ba0000005c                   mov        r10d, 0x5c000000
03b50 4903f2                         add        rsi, r10
03b53 41ba17000000                   mov        r10d, 0x17
03b59 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03b5d 7435                           je         0x7f63d417c414
03b5f 4983c202                       add        r10, 2
03b63 4983fa1b                       cmp        r10, 0x1b
03b67 75f0                           jne        0x7f63d417c3d9
03b69 41ba17000000                   mov        r10d, 0x17
03b6f 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03b74 7412                           je         0x7f63d417c408
03b76 4983c202                       add        r10, 2
03b7a 4983fa1b                       cmp        r10, 0x1b
03b7e 75ef                           jne        0x7f63d417c3ef
03b80 41ba16000000                   mov        r10d, 0x16
03b86 eb10                           jmp        0x7f63d417c418
03b88 50                             push       rax
03b89 4833c0                         xor        rax, rax
03b8c 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
03b91 58                             pop        rax
03b92 ebbf                           jmp        0x7f63d417c3d3
03b94 4983c201                       add        r10, 1
03b98 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03b9d 488bf7                         mov        rsi, rdi
03ba0 90                             nop        
03ba1 90                             nop        
03ba2 90                             nop        
03ba3 90                             nop        
03ba4 90                             nop        
03ba5 48b800d723a9637f0000           movabs     rax, 0x7f63a923d700
03baf e82c735c07                     call       0x7f63db743760
03bb4 0f1f8400ac3c0018               nop        dword ptr [rax + rax + 0x18003cac]
03bbc 48be100365c8637f0000           movabs     rsi, 0x7f63c8650310
03bc6 488386e000000001               add        qword ptr [rsi + 0xe0], 1
03bce 48be38eb64c8637f0000           movabs     rsi, 0x7f63c864eb38
03bd8 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
03bdb 83c702                         add        edi, 2
03bde 897e78                         mov        dword ptr [rsi + 0x78], edi
03be1 81e7feff1f00                   and        edi, 0x1ffffe
03be7 85ff                           test       edi, edi
03be9 0f8421180000                   je         0x7f63d417dc90
03bef 8b9c240c020000                 mov        ebx, dword ptr [rsp + 0x20c]
03bf6 8bbc24d0010000                 mov        edi, dword ptr [rsp + 0x1d0]
03bfd 48be38eb64c8637f0000           movabs     rsi, 0x7f63c864eb38
03c07 4883861001000001               add        qword ptr [rsi + 0x110], 1
03c0f ffc8                           dec        eax
03c11 2bd8                           sub        ebx, eax
03c13 48bec8e164c8637f0000           movabs     rsi, 0x7f63c864e1c8
03c1d 8b4678                         mov        eax, dword ptr [rsi + 0x78]
03c20 83c002                         add        eax, 2
03c23 894678                         mov        dword ptr [rsi + 0x78], eax
03c26 25feff1f00                     and        eax, 0x1ffffe
03c2b 85c0                           test       eax, eax
03c2d 0f84fe170000                   je         0x7f63d417dcb1
03c33 48bec8e164c8637f0000           movabs     rsi, 0x7f63c864e1c8
03c3d 488386b000000001               add        qword ptr [rsi + 0xb0], 1
03c45 48be0000000000000000           movabs     rsi, 0
03c4f be00000000                     mov        esi, 0
03c54 3bfe                           cmp        edi, esi
03c56 0f8cf6170000                   jl         0x7f63d417dcd2
03c5c 3bfb                           cmp        edi, ebx
03c5e 0f8d0f180000                   jge        0x7f63d417dcf3
03c64 488bdf                         mov        rbx, rdi
03c67 899c2418020000                 mov        dword ptr [rsp + 0x218], ebx
03c6e 89bc24d0010000                 mov        dword ptr [rsp + 0x1d0], edi
03c75 488bbc2410020000               mov        rdi, qword ptr [rsp + 0x210]
03c7d 488bf7                         mov        rsi, rdi
03c80 48b9100365c8637f0000           movabs     rcx, 0x7f63c8650310
03c8a 488b36                         mov        rsi, qword ptr [rsi]
03c8d 48c1ee2a                       shr        rsi, 0x2a
03c91 48c1e609                       shl        rsi, 9
03c95 41ba0000005c                   mov        r10d, 0x5c000000
03c9b 4903f2                         add        rsi, r10
03c9e 41ba1f000000                   mov        r10d, 0x1f
03ca4 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
03ca8 7435                           je         0x7f63d417c55f
03caa 4983c202                       add        r10, 2
03cae 4983fa23                       cmp        r10, 0x23
03cb2 75f0                           jne        0x7f63d417c524
03cb4 41ba1f000000                   mov        r10d, 0x1f
03cba 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03cbf 7412                           je         0x7f63d417c553
03cc1 4983c202                       add        r10, 2
03cc5 4983fa23                       cmp        r10, 0x23
03cc9 75ef                           jne        0x7f63d417c53a
03ccb 41ba1e000000                   mov        r10d, 0x1e
03cd1 eb10                           jmp        0x7f63d417c563
03cd3 50                             push       rax
03cd4 4833c0                         xor        rax, rax
03cd7 4a0fb134d1                     cmpxchg    qword ptr [rcx + r10*8], rsi
03cdc 58                             pop        rax
03cdd ebbf                           jmp        0x7f63d417c51e
03cdf 4983c201                       add        r10, 1
03ce3 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03ce8 488bf7                         mov        rsi, rdi
03ceb 90                             nop        
03cec 90                             nop        
03ced 48b828d723a9637f0000           movabs     rax, 0x7f63a923d728
03cf7 e8e4715c07                     call       0x7f63db743760
03cfc 0f1f8400f43d0019               nop        dword ptr [rax + rax + 0x19003df4]
03d04 483b00                         cmp        rax, qword ptr [rax]
03d07 488bf0                         mov        rsi, rax
03d0a 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
03d14 488b36                         mov        rsi, qword ptr [rsi]
03d17 48c1ee2a                       shr        rsi, 0x2a
03d1b 48c1e609                       shl        rsi, 9
03d1f 41ba0000005c                   mov        r10d, 0x5c000000
03d25 4903f2                         add        rsi, r10
03d28 41ba25000000                   mov        r10d, 0x25
03d2e 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03d32 7435                           je         0x7f63d417c5e9
03d34 4983c202                       add        r10, 2
03d38 4983fa29                       cmp        r10, 0x29
03d3c 75f0                           jne        0x7f63d417c5ae
03d3e 41ba25000000                   mov        r10d, 0x25
03d44 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03d49 7412                           je         0x7f63d417c5dd
03d4b 4983c202                       add        r10, 2
03d4f 4983fa29                       cmp        r10, 0x29
03d53 75ef                           jne        0x7f63d417c5c4
03d55 41ba24000000                   mov        r10d, 0x24
03d5b eb10                           jmp        0x7f63d417c5ed
03d5d 50                             push       rax
03d5e 4833c0                         xor        rax, rax
03d61 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
03d66 58                             pop        rax
03d67 ebbf                           jmp        0x7f63d417c5a8
03d69 4983c201                       add        r10, 1
03d6d 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03d72 8b7028                         mov        esi, dword ptr [rax + 0x28]
03d75 4c3b255c531a21                 cmp        r12, qword ptr [rip + 0x211a535c]
03d7c 0f8414000000                   je         0x7f63d417c616
03d82 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
03d8c 4883e4f0                       and        rsp, 0xfffffffffffffff0
03d90 e8eb425b20                     call       0x7f63f4730900
03d95 f4                             hlt        
03d96 488bd0                         mov        rdx, rax
03d99 48b9100365c8637f0000           movabs     rcx, 0x7f63c8650310
03da3 488b12                         mov        rdx, qword ptr [rdx]
03da6 48c1ea2a                       shr        rdx, 0x2a
03daa 48c1e209                       shl        rdx, 9
03dae 41ba0000005c                   mov        r10d, 0x5c000000
03db4 4903d2                         add        rdx, r10
03db7 41ba2b000000                   mov        r10d, 0x2b
03dbd 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03dc1 7435                           je         0x7f63d417c678
03dc3 4983c202                       add        r10, 2
03dc7 4983fa2f                       cmp        r10, 0x2f
03dcb 75f0                           jne        0x7f63d417c63d
03dcd 41ba2b000000                   mov        r10d, 0x2b
03dd3 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03dd8 7412                           je         0x7f63d417c66c
03dda 4983c202                       add        r10, 2
03dde 4983fa2f                       cmp        r10, 0x2f
03de2 75ef                           jne        0x7f63d417c653
03de4 41ba2a000000                   mov        r10d, 0x2a
03dea eb10                           jmp        0x7f63d417c67c
03dec 50                             push       rax
03ded 4833c0                         xor        rax, rax
03df0 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
03df5 58                             pop        rax
03df6 ebbf                           jmp        0x7f63d417c637
03df8 4983c201                       add        r10, 1
03dfc 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03e01 8b4808                         mov        ecx, dword ptr [rax + 8]
03e04 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
03e0e 4883828001000001               add        qword ptr [rdx + 0x180], 1
03e16 48ba80ed64c8637f0000           movabs     rdx, 0x7f63c864ed80
03e20 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
03e24 4183c002                       add        r8d, 2
03e28 44894278                       mov        dword ptr [rdx + 0x78], r8d
03e2c 4181e0feff1f00                 and        r8d, 0x1ffffe
03e33 4585c0                         test       r8d, r8d
03e36 0f8471160000                   je         0x7f63d417dd2d
03e3c 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
03e46 4883829001000001               add        qword ptr [rdx + 0x190], 1
03e4e 8b9c2418020000                 mov        ebx, dword ptr [rsp + 0x218]
03e55 4863db                         movsxd     rbx, ebx
03e58 ba0c000000                     mov        edx, 0xc
03e5d 4c8bcb                         mov        r9, rbx
03e60 4c03ca                         add        r9, rdx
03e63 48ba08df64c8637f0000           movabs     rdx, 0x7f63c864df08
03e6d 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
03e71 4183c002                       add        r8d, 2
03e75 44894278                       mov        dword ptr [rdx + 0x78], r8d
03e79 4181e0feff1f00                 and        r8d, 0x1ffffe
03e80 4585c0                         test       r8d, r8d
03e83 0f8445160000                   je         0x7f63d417dd4e
03e89 48ba08df64c8637f0000           movabs     rdx, 0x7f63c864df08
03e93 488382e000000001               add        qword ptr [rdx + 0xe0], 1
03e9b 48ba88e064c8637f0000           movabs     rdx, 0x7f63c864e088
03ea5 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
03ea9 4183c002                       add        r8d, 2
03ead 44894278                       mov        dword ptr [rdx + 0x78], r8d
03eb1 4181e0feff1f00                 and        r8d, 0x1ffffe
03eb8 4585c0                         test       r8d, r8d
03ebb 0f842e160000                   je         0x7f63d417dd6f
03ec1 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
03ecb 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
03ed3 48ba08b13ce300000000           movabs     rdx, 0xe33cb108
03edd ba02000000                     mov        edx, 2
03ee2 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
03eea bf00000000                     mov        edi, 0
03eef 488b842410020000               mov        rax, qword ptr [rsp + 0x210]
03ef7 48890424                       mov        qword ptr [rsp], rax
03efb 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03f03 4889442408                     mov        qword ptr [rsp + 8], rax
03f08 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
03f0d 49ba08b13ce300000000           movabs     r10, 0xe33cb108
03f17 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03f1c 90                             nop        
03f1d 90                             nop        
03f1e 90                             nop        
03f1f e8bc745c07                     call       0x7f63db743c60
03f24 0f1f84001c40001a               nop        dword ptr [rax + rax + 0x1a00401c]
03f2c 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
03f33 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
03f3b 4103d8                         add        ebx, r8d
03f3e 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
03f48 ff8610060000                   inc        dword ptr [rsi + 0x610]
03f4e 8bb424d4010000                 mov        esi, dword ptr [rsp + 0x1d4]
03f55 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
03f5f ff8208080000                   inc        dword ptr [rdx + 0x808]
03f65 488bc3                         mov        rax, rbx
03f68 8b942444010000                 mov        edx, dword ptr [rsp + 0x144]
03f6f ffc2                           inc        edx
03f71 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
03f7b 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
03f7f 4183c002                       add        r8d, 2
03f83 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
03f87 4181e0fe3f0000                 and        r8d, 0x3ffe
03f8e 4585c0                         test       r8d, r8d
03f91 0f8479150000                   je         0x7f63d417dd90
03f97 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03f9b 418502                         test       dword ptr [r10], eax
03f9e 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
03fa8 ff8130080000                   inc        dword ptr [rcx + 0x830]
03fae 488bce                         mov        rcx, rsi
03fb1 4c8bd8                         mov        r11, rax
03fb4 488bf1                         mov        rsi, rcx
03fb7 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
03fbf 488b9c2468020000               mov        rbx, qword ptr [rsp + 0x268]
03fc7 8bbc2430010000                 mov        edi, dword ptr [rsp + 0x130]
03fce 4c8b8c2420010000               mov        r9, qword ptr [rsp + 0x120]
03fd6 4c8b842428010000               mov        r8, qword ptr [rsp + 0x128]
03fde 8b8c2434010000                 mov        ecx, dword ptr [rsp + 0x134]
03fe5 e926c3ffff                     jmp        0x7f63d4178b90
03fea 4c8bc8                         mov        r9, rax
03fed 4585c9                         test       r9d, r9d
03ff0 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
03ffa b988030000                     mov        ecx, 0x388
03fff 7e05                           jle        0x7f63d417c886
04001 b998030000                     mov        ecx, 0x398
04006 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0400a 4d8d4001                       lea        r8, [r8 + 1]
0400e 4c89040a                       mov        qword ptr [rdx + rcx], r8
04012 0f8ec2010000                   jle        0x7f63d417ca5a
04018 488b9c2498010000               mov        rbx, qword ptr [rsp + 0x198]
04020 482bf3                         sub        rsi, rbx
04023 ba00000000                     mov        edx, 0
04028 483bf2                         cmp        rsi, rdx
0402b 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
04035 baa8030000                     mov        edx, 0x3a8
0403a 7d05                           jge        0x7f63d417c8c1
0403c bab8030000                     mov        edx, 0x3b8
04041 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
04045 488d4901                       lea        rcx, [rcx + 1]
04049 48890c16                       mov        qword ptr [rsi + rdx], rcx
0404d 0f8d87010000                   jge        0x7f63d417ca5a
04053 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
0405b 488b5630                       mov        rdx, qword ptr [rsi + 0x30]
0405f be00000000                     mov        esi, 0
04064 483bd6                         cmp        rdx, rsi
04067 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
04071 bac8030000                     mov        edx, 0x3c8
04076 7505                           jne        0x7f63d417c8fd
04078 bad8030000                     mov        edx, 0x3d8
0407d 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
04081 488d4901                       lea        rcx, [rcx + 1]
04085 48890c16                       mov        qword ptr [rsi + rdx], rcx
04089 0f854b010000                   jne        0x7f63d417ca5a
0408f e950010000                     jmp        0x7f63d417ca64
04094 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
0409c 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
040a4 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
040ac 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
040b3 488bce                         mov        rcx, rsi
040b6 8bb42434010000                 mov        esi, dword ptr [rsp + 0x134]
040bd 488bde                         mov        rbx, rsi
040c0 2bd9                           sub        ebx, ecx
040c2 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
040cc 4883864808000001               add        qword ptr [rsi + 0x848], 1
040d4 488bf2                         mov        rsi, rdx
040d7 488bd1                         mov        rdx, rcx
040da 488bc8                         mov        rcx, rax
040dd 4d8bc3                         mov        r8, r11
040e0 4c8bcb                         mov        r9, rbx
040e3 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
040eb 899c241c020000                 mov        dword ptr [rsp + 0x21c], ebx
040f2 4885c9                         test       rcx, rcx
040f5 0f8436140000                   je         0x7f63d417ddb1
040fb 85d2                           test       edx, edx
040fd 0f8c2e140000                   jl         0x7f63d417ddb1
04103 4585c0                         test       r8d, r8d
04106 0f8c25140000                   jl         0x7f63d417ddb1
0410c 4a8d3c0a                       lea        rdi, [rdx + r9]
04110 3b7e08                         cmp        edi, dword ptr [rsi + 8]
04113 0f8718140000                   ja         0x7f63d417ddb1
04119 4b8d3c08                       lea        rdi, [r8 + r9]
0411d 3b7908                         cmp        edi, dword ptr [rcx + 8]
04120 0f870b140000                   ja         0x7f63d417ddb1
04126 4585c9                         test       r9d, r9d
04129 0f8c02140000                   jl         0x7f63d417ddb1
0412f 4863d2                         movsxd     rdx, edx
04132 4d63c0                         movsxd     r8, r8d
04135 48bf0014045c00000000           movabs     rdi, 0x5c041400
0413f 41ba0000005c                   mov        r10d, 0x5c000000
04145 492bfa                         sub        rdi, r10
04148 48c1ef09                       shr        rdi, 9
0414c 4c8b19                         mov        r11, qword ptr [rcx]
0414f 49c1eb2a                       shr        r11, 0x2a
04153 413bfb                         cmp        edi, r11d
04156 0f8510000000                   jne        0x7f63d417c9ec
0415c 4c8b1e                         mov        r11, qword ptr [rsi]
0415f 49c1eb2a                       shr        r11, 0x2a
04163 413bfb                         cmp        edi, r11d
04166 0f8414000000                   je         0x7f63d417ca00
0416c 48bfa0453ef3637f0000           movabs     rdi, 0x7f63f33e45a0
04176 4883e4f0                       and        rsp, 0xfffffffffffffff0
0417a e8013f5b20                     call       0x7f63f4730900
0417f f4                             hlt        
04180 488d7c160c                     lea        rdi, [rsi + rdx + 0xc]
04185 4a8d74010c                     lea        rsi, [rcx + r8 + 0xc]
0418a 498bd1                         mov        rdx, r9
0418d 40f6c40f                       test       spl, 0xf
04191 0f8412000000                   je         0x7f63d417ca29
04197 4883ec08                       sub        rsp, 8
0419b e820075b07                     call       0x7f63db72d140
041a0 4883c408                       add        rsp, 8
041a4 e905000000                     jmp        0x7f63d417ca2e
041a9 e812075b07                     call       0x7f63db72d140
041ae 8b9c241c020000                 mov        ebx, dword ptr [rsp + 0x21c]
041b5 039c2474010000                 add        ebx, dword ptr [rsp + 0x174]
041bc 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
041c4 895e3c                         mov        dword ptr [rsi + 0x3c], ebx
041c7 4881c450020000                 add        rsp, 0x250
041ce 5d                             pop        rbp
041cf 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
041d3 0f8768130000                   ja         0x7f63d417ddc1
041d9 c3                             ret        
041da bb02000000                     mov        ebx, 2
041df e915000000                     jmp        0x7f63d417ca79
041e4 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
041ee ff82e8030000                   inc        dword ptr [rdx + 0x3e8]
041f4 bb08000000                     mov        ebx, 8
041f9 899c2428020000                 mov        dword ptr [rsp + 0x228], ebx
04200 e961130000                     jmp        0x7f63d417dde6
04205 90                             nop        
04206 90                             nop        
04207 90                             nop        
04208 90                             nop        
04209 90                             nop        
0420a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04211 0f8572130000                   jne        0x7f63d417de09
04217 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
0421e 488d7828                       lea        rdi, [rax + 0x28]
04222 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
04229 0f875a130000                   ja         0x7f63d417de09
0422f 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
04236 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0423d 488908                         mov        qword ptr [rax], rcx
04240 4833c9                         xor        rcx, rcx
04243 48894808                       mov        qword ptr [rax + 8], rcx
04247 48894810                       mov        qword ptr [rax + 0x10], rcx
0424b 48894818                       mov        qword ptr [rax + 0x18], rcx
0424f 48894820                       mov        qword ptr [rax + 0x20], rcx
04253 90                             nop        
04254 90                             nop        
04255 90                             nop        
04256 90                             nop        
04257 90                             nop        
04258 e948130000                     jmp        0x7f63d417de25
0425d 90                             nop        
0425e 90                             nop        
0425f 90                             nop        
04260 90                             nop        
04261 90                             nop        
04262 498bf1                         mov        rsi, r9
04265 4889842420020000               mov        qword ptr [rsp + 0x220], rax
0426d 90                             nop        
0426e 90                             nop        
0426f e86c715c07                     call       0x7f63db743c60
04274 0f1f84006c43001c               nop        dword ptr [rax + rax + 0x1c00436c]
0427c 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
04286 488d9210040000                 lea        rdx, [rdx + 0x410]
0428d 4885c0                         test       rax, rax
04290 750e                           jne        0x7f63d417cb20
04292 f60201                         test       byte ptr [rdx], 1
04295 0f8505000000                   jne        0x7f63d417cb20
0429b f048830a01                     lock or    qword ptr [rdx], 1
042a0 488b942420020000               mov        rdx, qword ptr [rsp + 0x220]
042a8 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
042b2 4883812004000001               add        qword ptr [rcx + 0x420], 1
042ba 8b942428020000                 mov        edx, dword ptr [rsp + 0x228]
042c1 488bc8                         mov        rcx, rax
042c4 488bb42420020000               mov        rsi, qword ptr [rsp + 0x220]
042cc 90                             nop        
042cd 90                             nop        
042ce 90                             nop        
042cf e80c675c07                     call       0x7f63db743260
042d4 0f1f8400cc43001d               nop        dword ptr [rax + rax + 0x1d0043cc]
042dc 488b842420020000               mov        rax, qword ptr [rsp + 0x220]
042e4 e961130000                     jmp        0x7f63d417deca
042e9 90                             nop        
042ea 90                             nop        
042eb 90                             nop        
042ec 90                             nop        
042ed 90                             nop        
042ee 90                             nop        
042ef 90                             nop        
042f0 e9c9120000                     jmp        0x7f63d417de3e
042f5 90                             nop        
042f6 90                             nop        
042f7 90                             nop        
042f8 90                             nop        
042f9 90                             nop        
042fa 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04301 0f85da120000                   jne        0x7f63d417de61
04307 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
0430e 488d7828                       lea        rdi, [rax + 0x28]
04312 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
04319 0f87c2120000                   ja         0x7f63d417de61
0431f 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
04326 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0432d 488908                         mov        qword ptr [rax], rcx
04330 4833c9                         xor        rcx, rcx
04333 48894808                       mov        qword ptr [rax + 8], rcx
04337 48894810                       mov        qword ptr [rax + 0x10], rcx
0433b 48894818                       mov        qword ptr [rax + 0x18], rcx
0433f 48894820                       mov        qword ptr [rax + 0x20], rcx
04343 488bd0                         mov        rdx, rax
04346 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
04350 4883815802000001               add        qword ptr [rcx + 0x258], 1
04358 ba02000000                     mov        edx, 2
0435d 48b9006426e200000000           movabs     rcx, 0xe2266400
04367 488bf0                         mov        rsi, rax
0436a 4889842430020000               mov        qword ptr [rsp + 0x230], rax
04372 90                             nop        
04373 90                             nop        
04374 90                             nop        
04375 90                             nop        
04376 90                             nop        
04377 e864665c07                     call       0x7f63db743260
0437c 0f1f84007444001e               nop        dword ptr [rax + rax + 0x1e004474]
04384 488b842430020000               mov        rax, qword ptr [rsp + 0x230]
0438c e9b9120000                     jmp        0x7f63d417deca
04391 90                             nop        
04392 90                             nop        
04393 90                             nop        
04394 90                             nop        
04395 90                             nop        
04396 90                             nop        
04397 90                             nop        
04398 e960120000                     jmp        0x7f63d417de7d
0439d 90                             nop        
0439e 90                             nop        
0439f 90                             nop        
043a0 90                             nop        
043a1 90                             nop        
043a2 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
043a9 0f8571120000                   jne        0x7f63d417dea0
043af 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
043b6 488d7828                       lea        rdi, [rax + 0x28]
043ba 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
043c1 0f8759120000                   ja         0x7f63d417dea0
043c7 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
043ce 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
043d5 488908                         mov        qword ptr [rax], rcx
043d8 4833c9                         xor        rcx, rcx
043db 48894808                       mov        qword ptr [rax + 8], rcx
043df 48894810                       mov        qword ptr [rax + 0x10], rcx
043e3 48894818                       mov        qword ptr [rax + 0x18], rcx
043e7 48894820                       mov        qword ptr [rax + 0x20], rcx
043eb 488bd0                         mov        rdx, rax
043ee 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
043f8 4883814001000001               add        qword ptr [rcx + 0x140], 1
04400 ba05000000                     mov        edx, 5
04405 48b9406426e200000000           movabs     rcx, 0xe2266440
0440f 488bf0                         mov        rsi, rax
04412 4889842438020000               mov        qword ptr [rsp + 0x238], rax
0441a 90                             nop        
0441b 90                             nop        
0441c 90                             nop        
0441d 90                             nop        
0441e 90                             nop        
0441f e8bc655c07                     call       0x7f63db743260
04424 0f1f84001c45001f               nop        dword ptr [rax + rax + 0x1f00451c]
0442c 488b842438020000               mov        rax, qword ptr [rsp + 0x238]
04434 e911120000                     jmp        0x7f63d417deca
04439 49ba001b62c8637f0000           movabs     r10, 0x7f63c8621b00
04443 4c89542408                     mov        qword ptr [rsp + 8], r10
04448 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04450 e80b6b5607                     call       0x7f63db6e37e0
04455 e933bcffff                     jmp        0x7f63d417890d
0445a 49ba88f11ac8637f0000           movabs     r10, 0x7f63c81af188
04464 4c89542408                     mov        qword ptr [rsp + 8], r10
04469 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04471 e8ea6a5607                     call       0x7f63db6e37e0
04476 e9bdbdffff                     jmp        0x7f63d4178ab8
0447b e860c15607                     call       0x7f63db6e8e60
04480 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
0448a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0448e e8ed3b5b20                     call       0x7f63f4730900
04493 f4                             hlt        
04494 e847c15607                     call       0x7f63db6e8e60
04499 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
044a3 4883e4f0                       and        rsp, 0xfffffffffffffff0
044a7 e8d43b5b20                     call       0x7f63f4730900
044ac f4                             hlt        
044ad e82ec15607                     call       0x7f63db6e8e60
044b2 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
044bc 4883e4f0                       and        rsp, 0xfffffffffffffff0
044c0 e8bb3b5b20                     call       0x7f63f4730900
044c5 f4                             hlt        
044c6 48891424                       mov        qword ptr [rsp], rdx
044ca 4c89442408                     mov        qword ptr [rsp + 8], r8
044cf e80cca5607                     call       0x7f63db6e9760
044d4 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
044de 4883e4f0                       and        rsp, 0xfffffffffffffff0
044e2 e8993b5b20                     call       0x7f63f4730900
044e7 f4                             hlt        
044e8 e8f3c05607                     call       0x7f63db6e8e60
044ed 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
044f7 4883e4f0                       and        rsp, 0xfffffffffffffff0
044fb e8803b5b20                     call       0x7f63f4730900
04500 f4                             hlt        
04501 e8dac05607                     call       0x7f63db6e8e60
04506 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04510 4883e4f0                       and        rsp, 0xfffffffffffffff0
04514 e8673b5b20                     call       0x7f63f4730900
04519 f4                             hlt        
0451a 48891424                       mov        qword ptr [rsp], rdx
0451e 4c894c2408                     mov        qword ptr [rsp + 8], r9
04523 e8b8c95607                     call       0x7f63db6e9760
04528 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04532 4883e4f0                       and        rsp, 0xfffffffffffffff0
04536 e8453b5b20                     call       0x7f63f4730900
0453b f4                             hlt        
0453c e89fc05607                     call       0x7f63db6e8e60
04541 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
0454b 4883e4f0                       and        rsp, 0xfffffffffffffff0
0454f e82c3b5b20                     call       0x7f63f4730900
04554 f4                             hlt        
04555 e886c05607                     call       0x7f63db6e8e60
0455a 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04564 4883e4f0                       and        rsp, 0xfffffffffffffff0
04568 e8133b5b20                     call       0x7f63f4730900
0456d f4                             hlt        
0456e 48c7042401000000               mov        qword ptr [rsp], 1
04576 48895c2408                     mov        qword ptr [rsp + 8], rbx
0457b e860c95607                     call       0x7f63db6e9760
04580 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
0458a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0458e e8ed3a5b20                     call       0x7f63f4730900
04593 f4                             hlt        
04594 48c7042402000000               mov        qword ptr [rsp], 2
0459c 48895c2408                     mov        qword ptr [rsp + 8], rbx
045a1 e83ac95607                     call       0x7f63db6e9760
045a6 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
045b0 4883e4f0                       and        rsp, 0xfffffffffffffff0
045b4 e8c73a5b20                     call       0x7f63f4730900
045b9 f4                             hlt        
045ba 49ba30007ac8637f0000           movabs     r10, 0x7f63c87a0030
045c4 4c89542408                     mov        qword ptr [rsp + 8], r10
045c9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045d1 e88a695607                     call       0x7f63db6e37e0
045d6 e9f2c1ffff                     jmp        0x7f63d417904d
045db 49bab8fc6fc8637f0000           movabs     r10, 0x7f63c86ffcb8
045e5 4c89542408                     mov        qword ptr [rsp + 8], r10
045ea 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045f2 e869695607                     call       0x7f63db6e37e0
045f7 e976c2ffff                     jmp        0x7f63d41790f2
045fc 49bae0aa18c8637f0000           movabs     r10, 0x7f63c818aae0
04606 4c89542408                     mov        qword ptr [rsp + 8], r10
0460b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04613 e848695607                     call       0x7f63db6e37e0
04618 e99fc2ffff                     jmp        0x7f63d417913c
0461d 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04625 e8b6565607                     call       0x7f63db6e2560
0462a 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04634 4883e4f0                       and        rsp, 0xfffffffffffffff0
04638 e8433a5b20                     call       0x7f63f4730900
0463d f4                             hlt        
0463e 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04646 e895565607                     call       0x7f63db6e2560
0464b 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04655 4883e4f0                       and        rsp, 0xfffffffffffffff0
04659 e8223a5b20                     call       0x7f63f4730900
0465e f4                             hlt        
0465f 49ba800b68c8637f0000           movabs     r10, 0x7f63c8680b80
04669 4c89542408                     mov        qword ptr [rsp + 8], r10
0466e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04676 e8e5685607                     call       0x7f63db6e37e0
0467b e914c3ffff                     jmp        0x7f63d4179214
04680 49bab07d68c8637f0000           movabs     r10, 0x7f63c8687db0
0468a 4c89542408                     mov        qword ptr [rsp + 8], r10
0468f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04697 e8c4685607                     call       0x7f63db6e37e0
0469c e926c3ffff                     jmp        0x7f63d4179247
046a1 49bae05b6bc8637f0000           movabs     r10, 0x7f63c86b5be0
046ab 4c89542408                     mov        qword ptr [rsp + 8], r10
046b0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046b8 e8a3685607                     call       0x7f63db6e37e0
046bd e97cc3ffff                     jmp        0x7f63d41792be
046c2 49baf01b7ac8637f0000           movabs     r10, 0x7f63c87a1bf0
046cc 4c89542408                     mov        qword ptr [rsp + 8], r10
046d1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046d9 e882685607                     call       0x7f63db6e37e0
046de e992c3ffff                     jmp        0x7f63d41792f5
046e3 49baa0186bc8637f0000           movabs     r10, 0x7f63c86b18a0
046ed 4c89542408                     mov        qword ptr [rsp + 8], r10
046f2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046fa e861685607                     call       0x7f63db6e37e0
046ff e9a9c3ffff                     jmp        0x7f63d417932d
04704 49bab0367ac8637f0000           movabs     r10, 0x7f63c87a36b0
0470e 4c89542408                     mov        qword ptr [rsp + 8], r10
04713 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0471b e840685607                     call       0x7f63db6e37e0
04720 e9a3c4ffff                     jmp        0x7f63d4179448
04725 49ba10cd45c8637f0000           movabs     r10, 0x7f63c845cd10
0472f 4c89542408                     mov        qword ptr [rsp + 8], r10
04734 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0473c e81f685607                     call       0x7f63db6e37e0
04741 e9c3c4ffff                     jmp        0x7f63d4179489
04746 49ba384640c8637f0000           movabs     r10, 0x7f63c8404638
04750 4c89542408                     mov        qword ptr [rsp + 8], r10
04755 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0475d e8fe675607                     call       0x7f63db6e37e0
04762 e9d5c4ffff                     jmp        0x7f63d41794bc
04767 48890424                       mov        qword ptr [rsp], rax
0476b e8f0795607                     call       0x7f63db6e49e0
04770 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
0477a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0477e e8fd385b20                     call       0x7f63f4730900
04783 f4                             hlt        
04784 e857be5607                     call       0x7f63db6e8e60
04789 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04793 4883e4f0                       and        rsp, 0xfffffffffffffff0
04797 e8e4385b20                     call       0x7f63f4730900
0479c f4                             hlt        
0479d 49bab00e7ac8637f0000           movabs     r10, 0x7f63c87a0eb0
047a7 4c89542408                     mov        qword ptr [rsp + 8], r10
047ac 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047b4 e8a7675607                     call       0x7f63db6e37e0
047b9 e934c6ffff                     jmp        0x7f63d4179672
047be e81dbe5607                     call       0x7f63db6e8e60
047c3 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
047cd 4883e4f0                       and        rsp, 0xfffffffffffffff0
047d1 e8aa385b20                     call       0x7f63f4730900
047d6 f4                             hlt        
047d7 49bab8fc6fc8637f0000           movabs     r10, 0x7f63c86ffcb8
047e1 4c89542408                     mov        qword ptr [rsp + 8], r10
047e6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047ee e86d675607                     call       0x7f63db6e37e0
047f3 e9c2c6ffff                     jmp        0x7f63d417973a
047f8 49bae0aa18c8637f0000           movabs     r10, 0x7f63c818aae0
04802 4c89542408                     mov        qword ptr [rsp + 8], r10
04807 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0480f e84c675607                     call       0x7f63db6e37e0
04814 e9dfc6ffff                     jmp        0x7f63d4179778
04819 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04821 e8ba545607                     call       0x7f63db6e2560
04826 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04830 4883e4f0                       and        rsp, 0xfffffffffffffff0
04834 e847385b20                     call       0x7f63f4730900
04839 f4                             hlt        
0483a 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04842 e899545607                     call       0x7f63db6e2560
04847 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04851 4883e4f0                       and        rsp, 0xfffffffffffffff0
04855 e826385b20                     call       0x7f63f4730900
0485a f4                             hlt        
0485b e880bd5607                     call       0x7f63db6e8e60
04860 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
0486a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0486e e80d385b20                     call       0x7f63f4730900
04873 f4                             hlt        
04874 49bab0367ac8637f0000           movabs     r10, 0x7f63c87a36b0
0487e 4c89542408                     mov        qword ptr [rsp + 8], r10
04883 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0488b e8d0665607                     call       0x7f63db6e37e0
04890 e96fc8ffff                     jmp        0x7f63d4179984
04895 49ba10cd45c8637f0000           movabs     r10, 0x7f63c845cd10
0489f 4c89542408                     mov        qword ptr [rsp + 8], r10
048a4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048ac e8af665607                     call       0x7f63db6e37e0
048b1 e99bc8ffff                     jmp        0x7f63d41799d1
048b6 49ba384640c8637f0000           movabs     r10, 0x7f63c8404638
048c0 4c89542408                     mov        qword ptr [rsp + 8], r10
048c5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048cd e88e665607                     call       0x7f63db6e37e0
048d2 e9b2c8ffff                     jmp        0x7f63d4179a09
048d7 49ba30007ac8637f0000           movabs     r10, 0x7f63c87a0030
048e1 4c89542408                     mov        qword ptr [rsp + 8], r10
048e6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048ee e86d665607                     call       0x7f63db6e37e0
048f3 e9afc9ffff                     jmp        0x7f63d4179b27
048f8 49bab8fc6fc8637f0000           movabs     r10, 0x7f63c86ffcb8
04902 4c89542408                     mov        qword ptr [rsp + 8], r10
04907 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0490f e84c665607                     call       0x7f63db6e37e0
04914 e938caffff                     jmp        0x7f63d4179bd1
04919 49bae0aa18c8637f0000           movabs     r10, 0x7f63c818aae0
04923 4c89542408                     mov        qword ptr [rsp + 8], r10
04928 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04930 e82b665607                     call       0x7f63db6e37e0
04935 e955caffff                     jmp        0x7f63d4179c0f
0493a 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04942 e899535607                     call       0x7f63db6e2560
04947 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04951 4883e4f0                       and        rsp, 0xfffffffffffffff0
04955 e826375b20                     call       0x7f63f4730900
0495a f4                             hlt        
0495b 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04963 e878535607                     call       0x7f63db6e2560
04968 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04972 4883e4f0                       and        rsp, 0xfffffffffffffff0
04976 e805375b20                     call       0x7f63f4730900
0497b f4                             hlt        
0497c 49ba800b68c8637f0000           movabs     r10, 0x7f63c8680b80
04986 4c89542408                     mov        qword ptr [rsp + 8], r10
0498b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04993 e8c8655607                     call       0x7f63db6e37e0
04998 e9cacaffff                     jmp        0x7f63d4179ce7
0499d 49bab07d68c8637f0000           movabs     r10, 0x7f63c8687db0
049a7 4c89542408                     mov        qword ptr [rsp + 8], r10
049ac 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049b4 e8a7655607                     call       0x7f63db6e37e0
049b9 e9e1caffff                     jmp        0x7f63d4179d1f
049be 49bae05b6bc8637f0000           movabs     r10, 0x7f63c86b5be0
049c8 4c89542408                     mov        qword ptr [rsp + 8], r10
049cd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049d5 e886655607                     call       0x7f63db6e37e0
049da e920cbffff                     jmp        0x7f63d4179d7f
049df 49baf01b7ac8637f0000           movabs     r10, 0x7f63c87a1bf0
049e9 4c89542408                     mov        qword ptr [rsp + 8], r10
049ee 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049f6 e865655607                     call       0x7f63db6e37e0
049fb e937cbffff                     jmp        0x7f63d4179db7
04a00 49baa0186bc8637f0000           movabs     r10, 0x7f63c86b18a0
04a0a 4c89542408                     mov        qword ptr [rsp + 8], r10
04a0f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a17 e844655607                     call       0x7f63db6e37e0
04a1c e94ecbffff                     jmp        0x7f63d4179def
04a21 49bab0367ac8637f0000           movabs     r10, 0x7f63c87a36b0
04a2b 4c89542408                     mov        qword ptr [rsp + 8], r10
04a30 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a38 e823655607                     call       0x7f63db6e37e0
04a3d e942ccffff                     jmp        0x7f63d4179f04
04a42 49ba10cd45c8637f0000           movabs     r10, 0x7f63c845cd10
04a4c 4c89542408                     mov        qword ptr [rsp + 8], r10
04a51 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a59 e802655607                     call       0x7f63db6e37e0
04a5e e967ccffff                     jmp        0x7f63d4179f4a
04a63 49ba384640c8637f0000           movabs     r10, 0x7f63c8404638
04a6d 4c89542408                     mov        qword ptr [rsp + 8], r10
04a72 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a7a e8e1645607                     call       0x7f63db6e37e0
04a7f e97eccffff                     jmp        0x7f63d4179f82
04a84 48890424                       mov        qword ptr [rsp], rax
04a88 e8d3765607                     call       0x7f63db6e49e0
04a8d 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04a97 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a9b e8e0355b20                     call       0x7f63f4730900
04aa0 f4                             hlt        
04aa1 e83abb5607                     call       0x7f63db6e8e60
04aa6 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04ab0 4883e4f0                       and        rsp, 0xfffffffffffffff0
04ab4 e8c7355b20                     call       0x7f63f4730900
04ab9 f4                             hlt        
04aba 49bab00e7ac8637f0000           movabs     r10, 0x7f63c87a0eb0
04ac4 4c89542408                     mov        qword ptr [rsp + 8], r10
04ac9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ad1 e88a645607                     call       0x7f63db6e37e0
04ad6 e9dfcdffff                     jmp        0x7f63d417a13a
04adb e800bb5607                     call       0x7f63db6e8e60
04ae0 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04aea 4883e4f0                       and        rsp, 0xfffffffffffffff0
04aee e88d355b20                     call       0x7f63f4730900
04af3 f4                             hlt        
04af4 49bab8fc6fc8637f0000           movabs     r10, 0x7f63c86ffcb8
04afe 4c89542408                     mov        qword ptr [rsp + 8], r10
04b03 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b0b e850645607                     call       0x7f63db6e37e0
04b10 e96dceffff                     jmp        0x7f63d417a202
04b15 49bae0aa18c8637f0000           movabs     r10, 0x7f63c818aae0
04b1f 4c89542408                     mov        qword ptr [rsp + 8], r10
04b24 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b2c e82f645607                     call       0x7f63db6e37e0
04b31 e98aceffff                     jmp        0x7f63d417a240
04b36 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04b3e e89d515607                     call       0x7f63db6e2560
04b43 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04b4d 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b51 e82a355b20                     call       0x7f63f4730900
04b56 f4                             hlt        
04b57 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04b5f e87c515607                     call       0x7f63db6e2560
04b64 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04b6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b72 e809355b20                     call       0x7f63f4730900
04b77 f4                             hlt        
04b78 e863ba5607                     call       0x7f63db6e8e60
04b7d 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04b87 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b8b e8f0345b20                     call       0x7f63f4730900
04b90 f4                             hlt        
04b91 49bab0367ac8637f0000           movabs     r10, 0x7f63c87a36b0
04b9b 4c89542408                     mov        qword ptr [rsp + 8], r10
04ba0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ba8 e8b3635607                     call       0x7f63db6e37e0
04bad e91ad0ffff                     jmp        0x7f63d417a44c
04bb2 49ba10cd45c8637f0000           movabs     r10, 0x7f63c845cd10
04bbc 4c89542408                     mov        qword ptr [rsp + 8], r10
04bc1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bc9 e892635607                     call       0x7f63db6e37e0
04bce e946d0ffff                     jmp        0x7f63d417a499
04bd3 49ba384640c8637f0000           movabs     r10, 0x7f63c8404638
04bdd 4c89542408                     mov        qword ptr [rsp + 8], r10
04be2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bea e871635607                     call       0x7f63db6e37e0
04bef e95dd0ffff                     jmp        0x7f63d417a4d1
04bf4 49ba001b62c8637f0000           movabs     r10, 0x7f63c8621b00
04bfe 4c89542408                     mov        qword ptr [rsp + 8], r10
04c03 48c704240a020000               mov        qword ptr [rsp], 0x20a
04c0b e850635607                     call       0x7f63db6e37e0
04c10 e900d1ffff                     jmp        0x7f63d417a595
04c15 90                             nop        
04c16 90                             nop        
04c17 e8c4675c07                     call       0x7f63db743c60
04c1c e930d2ffff                     jmp        0x7f63d417a6d1
04c21 90                             nop        
04c22 90                             nop        
04c23 90                             nop        
04c24 90                             nop        
04c25 90                             nop        
04c26 90                             nop        
04c27 e8b4675c07                     call       0x7f63db743c60
04c2c e9f8d3ffff                     jmp        0x7f63d417a8a9
04c31 49ba684462c8637f0000           movabs     r10, 0x7f63c8624468
04c3b 4c89542408                     mov        qword ptr [rsp + 8], r10
04c40 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c48 e813635607                     call       0x7f63db6e37e0
04c4d e958d4ffff                     jmp        0x7f63d417a92a
04c52 49ba184777c8637f0000           movabs     r10, 0x7f63c8774718
04c5c 4c89542408                     mov        qword ptr [rsp + 8], r10
04c61 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c69 e8f2625607                     call       0x7f63db6e37e0
04c6e e9b6d4ffff                     jmp        0x7f63d417a9a9
04c73 49ba809e09c8637f0000           movabs     r10, 0x7f63c8099e80
04c7d 4c89542408                     mov        qword ptr [rsp + 8], r10
04c82 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c8a e8d1625607                     call       0x7f63db6e37e0
04c8f e928d5ffff                     jmp        0x7f63d417aa3c
04c94 49baf02278c8637f0000           movabs     r10, 0x7f63c87822f0
04c9e 4c89542408                     mov        qword ptr [rsp + 8], r10
04ca3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cab e8b0625607                     call       0x7f63db6e37e0
04cb0 e9cad5ffff                     jmp        0x7f63d417aaff
04cb5 49ba606b78c8637f0000           movabs     r10, 0x7f63c8786b60
04cbf 4c89542408                     mov        qword ptr [rsp + 8], r10
04cc4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ccc e88f625607                     call       0x7f63db6e37e0
04cd1 e912d6ffff                     jmp        0x7f63d417ab68
04cd6 49ba306a78c8637f0000           movabs     r10, 0x7f63c8786a30
04ce0 4c89542408                     mov        qword ptr [rsp + 8], r10
04ce5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ced e86e625607                     call       0x7f63db6e37e0
04cf2 e924d6ffff                     jmp        0x7f63d417ab9b
04cf7 e8e4b85607                     call       0x7f63db6e8e60
04cfc 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04d06 4883e4f0                       and        rsp, 0xfffffffffffffff0
04d0a e871335b20                     call       0x7f63f4730900
04d0f f4                             hlt        
04d10 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04d18 e8c34f5607                     call       0x7f63db6e2560
04d1d 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04d27 4883e4f0                       and        rsp, 0xfffffffffffffff0
04d2b e850335b20                     call       0x7f63f4730900
04d30 f4                             hlt        
04d31 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04d39 e8a24f5607                     call       0x7f63db6e2560
04d3e 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04d48 4883e4f0                       and        rsp, 0xfffffffffffffff0
04d4c e82f335b20                     call       0x7f63f4730900
04d51 f4                             hlt        
04d52 49ba001b62c8637f0000           movabs     r10, 0x7f63c8621b00
04d5c 4c89542408                     mov        qword ptr [rsp + 8], r10
04d61 48c70424aa020000               mov        qword ptr [rsp], 0x2aa
04d69 e8f2615607                     call       0x7f63db6e37e0
04d6e e911d7ffff                     jmp        0x7f63d417ad04
04d73 49ba30007ac8637f0000           movabs     r10, 0x7f63c87a0030
04d7d 4c89542408                     mov        qword ptr [rsp + 8], r10
04d82 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d8a e8d1615607                     call       0x7f63db6e37e0
04d8f e9e6d7ffff                     jmp        0x7f63d417adfa
04d94 e847b85607                     call       0x7f63db6e8e60
04d99 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04da3 4883e4f0                       and        rsp, 0xfffffffffffffff0
04da7 e8d4325b20                     call       0x7f63f4730900
04dac f4                             hlt        
04dad 49bab8fc6fc8637f0000           movabs     r10, 0x7f63c86ffcb8
04db7 4c89542408                     mov        qword ptr [rsp + 8], r10
04dbc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04dc4 e897615607                     call       0x7f63db6e37e0
04dc9 e955d8ffff                     jmp        0x7f63d417aea3
04dce 49bae0aa18c8637f0000           movabs     r10, 0x7f63c818aae0
04dd8 4c89542408                     mov        qword ptr [rsp + 8], r10
04ddd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04de5 e876615607                     call       0x7f63db6e37e0
04dea e96dd8ffff                     jmp        0x7f63d417aedc
04def 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04df7 e8e44e5607                     call       0x7f63db6e2560
04dfc 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04e06 4883e4f0                       and        rsp, 0xfffffffffffffff0
04e0a e871325b20                     call       0x7f63f4730900
04e0f f4                             hlt        
04e10 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04e18 e8c34e5607                     call       0x7f63db6e2560
04e1d 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04e27 4883e4f0                       and        rsp, 0xfffffffffffffff0
04e2b e850325b20                     call       0x7f63f4730900
04e30 f4                             hlt        
04e31 49ba800b68c8637f0000           movabs     r10, 0x7f63c8680b80
04e3b 4c89542408                     mov        qword ptr [rsp + 8], r10
04e40 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e48 e813615607                     call       0x7f63db6e37e0
04e4d e9d9d8ffff                     jmp        0x7f63d417afab
04e52 49bab07d68c8637f0000           movabs     r10, 0x7f63c8687db0
04e5c 4c89542408                     mov        qword ptr [rsp + 8], r10
04e61 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e69 e8f2605607                     call       0x7f63db6e37e0
04e6e e9ebd8ffff                     jmp        0x7f63d417afde
04e73 49bae05b6bc8637f0000           movabs     r10, 0x7f63c86b5be0
04e7d 4c89542408                     mov        qword ptr [rsp + 8], r10
04e82 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e8a e8d1605607                     call       0x7f63db6e37e0
04e8f e92ed9ffff                     jmp        0x7f63d417b042
04e94 49baf01b7ac8637f0000           movabs     r10, 0x7f63c87a1bf0
04e9e 4c89542408                     mov        qword ptr [rsp + 8], r10
04ea3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04eab e8b0605607                     call       0x7f63db6e37e0
04eb0 e948d9ffff                     jmp        0x7f63d417b07d
04eb5 49baa0186bc8637f0000           movabs     r10, 0x7f63c86b18a0
04ebf 4c89542408                     mov        qword ptr [rsp + 8], r10
04ec4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ecc e88f605607                     call       0x7f63db6e37e0
04ed1 e95ad9ffff                     jmp        0x7f63d417b0b0
04ed6 49bab0367ac8637f0000           movabs     r10, 0x7f63c87a36b0
04ee0 4c89542408                     mov        qword ptr [rsp + 8], r10
04ee5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04eed e86e605607                     call       0x7f63db6e37e0
04ef2 e949daffff                     jmp        0x7f63d417b1c0
04ef7 49ba10cd45c8637f0000           movabs     r10, 0x7f63c845cd10
04f01 4c89542408                     mov        qword ptr [rsp + 8], r10
04f06 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f0e e84d605607                     call       0x7f63db6e37e0
04f13 e969daffff                     jmp        0x7f63d417b201
04f18 49ba384640c8637f0000           movabs     r10, 0x7f63c8404638
04f22 4c89542408                     mov        qword ptr [rsp + 8], r10
04f27 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f2f e82c605607                     call       0x7f63db6e37e0
04f34 e97bdaffff                     jmp        0x7f63d417b234
04f39 48890424                       mov        qword ptr [rsp], rax
04f3d e81e725607                     call       0x7f63db6e49e0
04f42 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04f4c 4883e4f0                       and        rsp, 0xfffffffffffffff0
04f50 e82b315b20                     call       0x7f63f4730900
04f55 f4                             hlt        
04f56 e885b65607                     call       0x7f63db6e8e60
04f5b 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04f65 4883e4f0                       and        rsp, 0xfffffffffffffff0
04f69 e812315b20                     call       0x7f63f4730900
04f6e f4                             hlt        
04f6f 49bab00e7ac8637f0000           movabs     r10, 0x7f63c87a0eb0
04f79 4c89542408                     mov        qword ptr [rsp + 8], r10
04f7e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f86 e8d55f5607                     call       0x7f63db6e37e0
04f8b e9dadbffff                     jmp        0x7f63d417b3ea
04f90 49bab8fc6fc8637f0000           movabs     r10, 0x7f63c86ffcb8
04f9a 4c89542408                     mov        qword ptr [rsp + 8], r10
04f9f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04fa7 e8b45f5607                     call       0x7f63db6e37e0
04fac e976dcffff                     jmp        0x7f63d417b4a7
04fb1 49bae0aa18c8637f0000           movabs     r10, 0x7f63c818aae0
04fbb 4c89542408                     mov        qword ptr [rsp + 8], r10
04fc0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04fc8 e8935f5607                     call       0x7f63db6e37e0
04fcd e99cdcffff                     jmp        0x7f63d417b4ee
04fd2 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04fda e8014d5607                     call       0x7f63db6e2560
04fdf 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04fe9 4883e4f0                       and        rsp, 0xfffffffffffffff0
04fed e88e305b20                     call       0x7f63f4730900
04ff2 f4                             hlt        
04ff3 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04ffb e8e04c5607                     call       0x7f63db6e2560
05000 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
0500a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0500e e86d305b20                     call       0x7f63f4730900
05013 f4                             hlt        
05014 e8c7b55607                     call       0x7f63db6e8e60
05019 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05023 4883e4f0                       and        rsp, 0xfffffffffffffff0
05027 e854305b20                     call       0x7f63f4730900
0502c f4                             hlt        
0502d 49bab0367ac8637f0000           movabs     r10, 0x7f63c87a36b0
05037 4c89542408                     mov        qword ptr [rsp + 8], r10
0503c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05044 e8175f5607                     call       0x7f63db6e37e0
05049 e92edeffff                     jmp        0x7f63d417b6fc
0504e 49ba10cd45c8637f0000           movabs     r10, 0x7f63c845cd10
05058 4c89542408                     mov        qword ptr [rsp + 8], r10
0505d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05065 e8f65e5607                     call       0x7f63db6e37e0
0506a e95adeffff                     jmp        0x7f63d417b749
0506f 49ba384640c8637f0000           movabs     r10, 0x7f63c8404638
05079 4c89542408                     mov        qword ptr [rsp + 8], r10
0507e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05086 e8d55e5607                     call       0x7f63db6e37e0
0508b e971deffff                     jmp        0x7f63d417b781
05090 49ba001b62c8637f0000           movabs     r10, 0x7f63c8621b00
0509a 4c89542408                     mov        qword ptr [rsp + 8], r10
0509f 48c70424e8020000               mov        qword ptr [rsp], 0x2e8
050a7 e8b45e5607                     call       0x7f63db6e37e0
050ac e911dfffff                     jmp        0x7f63d417b842
050b1 49ba684462c8637f0000           movabs     r10, 0x7f63c8624468
050bb 4c89542408                     mov        qword ptr [rsp + 8], r10
050c0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050c8 e8935e5607                     call       0x7f63db6e37e0
050cd e9d0dfffff                     jmp        0x7f63d417b922
050d2 49ba184777c8637f0000           movabs     r10, 0x7f63c8774718
050dc 4c89542408                     mov        qword ptr [rsp + 8], r10
050e1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050e9 e8725e5607                     call       0x7f63db6e37e0
050ee e92ee0ffff                     jmp        0x7f63d417b9a1
050f3 49ba809e09c8637f0000           movabs     r10, 0x7f63c8099e80
050fd 4c89542408                     mov        qword ptr [rsp + 8], r10
05102 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0510a e8515e5607                     call       0x7f63db6e37e0
0510f e9a0e0ffff                     jmp        0x7f63d417ba34
05114 49baf02278c8637f0000           movabs     r10, 0x7f63c87822f0
0511e 4c89542408                     mov        qword ptr [rsp + 8], r10
05123 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0512b e8305e5607                     call       0x7f63db6e37e0
05130 e942e1ffff                     jmp        0x7f63d417baf7
05135 49ba606b78c8637f0000           movabs     r10, 0x7f63c8786b60
0513f 4c89542408                     mov        qword ptr [rsp + 8], r10
05144 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0514c e80f5e5607                     call       0x7f63db6e37e0
05151 e98ae1ffff                     jmp        0x7f63d417bb60
05156 49ba306a78c8637f0000           movabs     r10, 0x7f63c8786a30
05160 4c89542408                     mov        qword ptr [rsp + 8], r10
05165 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0516d e8ee5d5607                     call       0x7f63db6e37e0
05172 e99ce1ffff                     jmp        0x7f63d417bb93
05177 e864b45607                     call       0x7f63db6e8e60
0517c 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05186 4883e4f0                       and        rsp, 0xfffffffffffffff0
0518a e8f12e5b20                     call       0x7f63f4730900
0518f f4                             hlt        
05190 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05198 e8434b5607                     call       0x7f63db6e2560
0519d 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
051a7 4883e4f0                       and        rsp, 0xfffffffffffffff0
051ab e8d02e5b20                     call       0x7f63f4730900
051b0 f4                             hlt        
051b1 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
051b9 e8224b5607                     call       0x7f63db6e2560
051be 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
051c8 4883e4f0                       and        rsp, 0xfffffffffffffff0
051cc e8af2e5b20                     call       0x7f63f4730900
051d1 f4                             hlt        
051d2 49ba001b62c8637f0000           movabs     r10, 0x7f63c8621b00
051dc 4c89542408                     mov        qword ptr [rsp + 8], r10
051e1 48c7042420030000               mov        qword ptr [rsp], 0x320
051e9 e8725d5607                     call       0x7f63db6e37e0
051ee e989e2ffff                     jmp        0x7f63d417bcfc
051f3 49ba30007ac8637f0000           movabs     r10, 0x7f63c87a0030
051fd 4c89542408                     mov        qword ptr [rsp + 8], r10
05202 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0520a e8515d5607                     call       0x7f63db6e37e0
0520f e949e3ffff                     jmp        0x7f63d417bddd
05214 e8c7b35607                     call       0x7f63db6e8e60
05219 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05223 4883e4f0                       and        rsp, 0xfffffffffffffff0
05227 e8542e5b20                     call       0x7f63f4730900
0522c f4                             hlt        
0522d 49bab8fc6fc8637f0000           movabs     r10, 0x7f63c86ffcb8
05237 4c89542408                     mov        qword ptr [rsp + 8], r10
0523c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05244 e8175d5607                     call       0x7f63db6e37e0
05249 e9b7e3ffff                     jmp        0x7f63d417be85
0524e 49bae0aa18c8637f0000           movabs     r10, 0x7f63c818aae0
05258 4c89542408                     mov        qword ptr [rsp + 8], r10
0525d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05265 e8f65c5607                     call       0x7f63db6e37e0
0526a e9cfe3ffff                     jmp        0x7f63d417bebe
0526f 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05277 e8644a5607                     call       0x7f63db6e2560
0527c 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05286 4883e4f0                       and        rsp, 0xfffffffffffffff0
0528a e8f12d5b20                     call       0x7f63f4730900
0528f f4                             hlt        
05290 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05298 e8434a5607                     call       0x7f63db6e2560
0529d 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
052a7 4883e4f0                       and        rsp, 0xfffffffffffffff0
052ab e8d02d5b20                     call       0x7f63f4730900
052b0 f4                             hlt        
052b1 49ba800b68c8637f0000           movabs     r10, 0x7f63c8680b80
052bb 4c89542408                     mov        qword ptr [rsp + 8], r10
052c0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052c8 e8935c5607                     call       0x7f63db6e37e0
052cd e933e4ffff                     jmp        0x7f63d417bf85
052d2 49bab07d68c8637f0000           movabs     r10, 0x7f63c8687db0
052dc 4c89542408                     mov        qword ptr [rsp + 8], r10
052e1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052e9 e8725c5607                     call       0x7f63db6e37e0
052ee e945e4ffff                     jmp        0x7f63d417bfb8
052f3 49bae05b6bc8637f0000           movabs     r10, 0x7f63c86b5be0
052fd 4c89542408                     mov        qword ptr [rsp + 8], r10
05302 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0530a e8515c5607                     call       0x7f63db6e37e0
0530f e97be4ffff                     jmp        0x7f63d417c00f
05314 49baf01b7ac8637f0000           movabs     r10, 0x7f63c87a1bf0
0531e 4c89542408                     mov        qword ptr [rsp + 8], r10
05323 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0532b e8305c5607                     call       0x7f63db6e37e0
05330 e990e4ffff                     jmp        0x7f63d417c045
05335 49baa0186bc8637f0000           movabs     r10, 0x7f63c86b18a0
0533f 4c89542408                     mov        qword ptr [rsp + 8], r10
05344 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0534c e80f5c5607                     call       0x7f63db6e37e0
05351 e9a2e4ffff                     jmp        0x7f63d417c078
05356 49bab0367ac8637f0000           movabs     r10, 0x7f63c87a36b0
05360 4c89542408                     mov        qword ptr [rsp + 8], r10
05365 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0536d e8ee5b5607                     call       0x7f63db6e37e0
05372 e991e5ffff                     jmp        0x7f63d417c188
05377 49ba10cd45c8637f0000           movabs     r10, 0x7f63c845cd10
05381 4c89542408                     mov        qword ptr [rsp + 8], r10
05386 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0538e e8cd5b5607                     call       0x7f63db6e37e0
05393 e9b1e5ffff                     jmp        0x7f63d417c1c9
05398 49ba384640c8637f0000           movabs     r10, 0x7f63c8404638
053a2 4c89542408                     mov        qword ptr [rsp + 8], r10
053a7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053af e8ac5b5607                     call       0x7f63db6e37e0
053b4 e9c3e5ffff                     jmp        0x7f63d417c1fc
053b9 48890424                       mov        qword ptr [rsp], rax
053bd e89e6d5607                     call       0x7f63db6e49e0
053c2 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
053cc 4883e4f0                       and        rsp, 0xfffffffffffffff0
053d0 e8ab2c5b20                     call       0x7f63f4730900
053d5 f4                             hlt        
053d6 e805b25607                     call       0x7f63db6e8e60
053db 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
053e5 4883e4f0                       and        rsp, 0xfffffffffffffff0
053e9 e8922c5b20                     call       0x7f63f4730900
053ee f4                             hlt        
053ef 49bab00e7ac8637f0000           movabs     r10, 0x7f63c87a0eb0
053f9 4c89542408                     mov        qword ptr [rsp + 8], r10
053fe 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05406 e8555b5607                     call       0x7f63db6e37e0
0540b e922e7ffff                     jmp        0x7f63d417c3b2
05410 49bab8fc6fc8637f0000           movabs     r10, 0x7f63c86ffcb8
0541a 4c89542408                     mov        qword ptr [rsp + 8], r10
0541f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05427 e8345b5607                     call       0x7f63db6e37e0
0542c e9bee7ffff                     jmp        0x7f63d417c46f
05431 49bae0aa18c8637f0000           movabs     r10, 0x7f63c818aae0
0543b 4c89542408                     mov        qword ptr [rsp + 8], r10
05440 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05448 e8135b5607                     call       0x7f63db6e37e0
0544d e9e1e7ffff                     jmp        0x7f63d417c4b3
05452 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0545a e881485607                     call       0x7f63db6e2560
0545f 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05469 4883e4f0                       and        rsp, 0xfffffffffffffff0
0546d e80e2c5b20                     call       0x7f63f4730900
05472 f4                             hlt        
05473 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0547b e860485607                     call       0x7f63db6e2560
05480 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
0548a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0548e e8ed2b5b20                     call       0x7f63f4730900
05493 f4                             hlt        
05494 e847b15607                     call       0x7f63db6e8e60
05499 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
054a3 4883e4f0                       and        rsp, 0xfffffffffffffff0
054a7 e8d42b5b20                     call       0x7f63f4730900
054ac f4                             hlt        
054ad 49bab0367ac8637f0000           movabs     r10, 0x7f63c87a36b0
054b7 4c89542408                     mov        qword ptr [rsp + 8], r10
054bc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
054c4 e8975a5607                     call       0x7f63db6e37e0
054c9 e96ee9ffff                     jmp        0x7f63d417c6bc
054ce 49ba10cd45c8637f0000           movabs     r10, 0x7f63c845cd10
054d8 4c89542408                     mov        qword ptr [rsp + 8], r10
054dd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
054e5 e8765a5607                     call       0x7f63db6e37e0
054ea e99ae9ffff                     jmp        0x7f63d417c709
054ef 49ba384640c8637f0000           movabs     r10, 0x7f63c8404638
054f9 4c89542408                     mov        qword ptr [rsp + 8], r10
054fe 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05506 e8555a5607                     call       0x7f63db6e37e0
0550b e9b1e9ffff                     jmp        0x7f63d417c741
05510 49ba001b62c8637f0000           movabs     r10, 0x7f63c8621b00
0551a 4c89542408                     mov        qword ptr [rsp + 8], r10
0551f 48c704245a030000               mov        qword ptr [rsp], 0x35a
05527 e8345a5607                     call       0x7f63db6e37e0
0552c e966eaffff                     jmp        0x7f63d417c817
05531 90                             nop        
05532 90                             nop        
05533 90                             nop        
05534 90                             nop        
05535 90                             nop        
05536 90                             nop        
05537 e8a45e5c07                     call       0x7f63db743c60
0553c e96decffff                     jmp        0x7f63d417ca2e
05541 49ba4fca17d4637f0000           movabs     r10, 0x7f63d417ca4f
0554b 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
05552 e989855c07                     jmp        0x7f63db746360
05557 48ba0000000000000000           movabs     rdx, 0
05561 b8000f050a                     mov        eax, 0xa050f00
05566 e875395607                     call       0x7f63db6e1760
0556b e990ecffff                     jmp        0x7f63d417ca80
05570 e86bb05607                     call       0x7f63db6e8e60
05575 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
0557f 4883e4f0                       and        rsp, 0xfffffffffffffff0
05583 e8f82a5b20                     call       0x7f63f4730900
05588 f4                             hlt        
05589 488bd2                         mov        rdx, rdx
0558c e84fa05607                     call       0x7f63db6e7e60
05591 e9bdecffff                     jmp        0x7f63d417cad3
05596 48ba0000000000000000           movabs     rdx, 0
055a0 b8000f050a                     mov        eax, 0xa050f00
055a5 e8b65d5607                     call       0x7f63db6e3be0
055aa e9a9ecffff                     jmp        0x7f63d417cad8
055af 48ba0000000000000000           movabs     rdx, 0
055b9 b8000f050a                     mov        eax, 0xa050f00
055be e81d395607                     call       0x7f63db6e1760
055c3 e928edffff                     jmp        0x7f63d417cb70
055c8 e813b05607                     call       0x7f63db6e8e60
055cd 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
055d7 4883e4f0                       and        rsp, 0xfffffffffffffff0
055db e8a02a5b20                     call       0x7f63f4730900
055e0 f4                             hlt        
055e1 488bd2                         mov        rdx, rdx
055e4 e8f79f5607                     call       0x7f63db6e7e60
055e9 e955edffff                     jmp        0x7f63d417cbc3
055ee 48ba0000000000000000           movabs     rdx, 0
055f8 b8000f050a                     mov        eax, 0xa050f00
055fd e8de385607                     call       0x7f63db6e1760
05602 e991edffff                     jmp        0x7f63d417cc18
05607 e8d4af5607                     call       0x7f63db6e8e60
0560c 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05616 4883e4f0                       and        rsp, 0xfffffffffffffff0
0561a e8612a5b20                     call       0x7f63f4730900
0561f f4                             hlt        
05620 488bd2                         mov        rdx, rdx
05623 e8b89f5607                     call       0x7f63db6e7e60
05628 e9beedffff                     jmp        0x7f63d417cc6b
0562d 498b8708060000                 mov        rax, qword ptr [r15 + 0x608]
05634 49c7870806000000000000         mov        qword ptr [r15 + 0x608], 0
0563f 49c7871006000000000000         mov        qword ptr [r15 + 0x610], 0
0564a 4881c450020000                 add        rsp, 0x250
05651 5d                             pop        rbp
05652 e909bf5607                     jmp        0x7f63db6e9de0
05657 f4                             hlt        
