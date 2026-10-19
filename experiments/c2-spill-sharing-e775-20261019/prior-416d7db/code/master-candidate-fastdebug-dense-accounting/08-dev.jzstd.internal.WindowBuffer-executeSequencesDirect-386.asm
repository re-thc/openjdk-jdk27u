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
0001a 0f8540075e07                   jne        0x7f56af72ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ec50020000                 sub        rsp, 0x250
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 7405                           je         0x7f56a814e63f
0003a e8a10b5d07                     call       0x7f56af71f1e0
0003f 4889b42448010000               mov        qword ptr [rsp + 0x148], rsi
00047 4889942468010000               mov        qword ptr [rsp + 0x168], rdx
0004f 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
00056 4c89842428010000               mov        qword ptr [rsp + 0x128], r8
0005e 4c898c2420010000               mov        qword ptr [rsp + 0x120], r9
00066 89bc2430010000                 mov        dword ptr [rsp + 0x130], edi
0006d 48bb00c0639c567f0000           movabs     rbx, 0x7f569c63c000
00077 8b4378                         mov        eax, dword ptr [rbx + 0x78]
0007a 83c002                         add        eax, 2
0007d 894378                         mov        dword ptr [rbx + 0x78], eax
00080 25fe070000                     and        eax, 0x7fe
00085 85c0                           test       eax, eax
00087 0f845c430000                   je         0x7f56a81529e9
0008d 48bb00c0639c567f0000           movabs     rbx, 0x7f569c63c000
00097 ff83b0000000                   inc        dword ptr [rbx + 0xb0]
0009d 8b9c2460020000                 mov        ebx, dword ptr [rsp + 0x260]
000a4 8b4640                         mov        eax, dword ptr [rsi + 0x40]
000a7 4c3b256a363020                 cmp        r12, qword ptr [rip + 0x2030366a]
000ae 0f8414000000                   je         0x7f56a814e6c8
000b4 48bf384352c6567f0000           movabs     rdi, 0x7f56c6524338
000be 4883e4f0                       and        rsp, 0xfffffffffffffff0
000c2 e8191e6d1f                     call       0x7f56c78204e0
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
00102 48b800c0639c567f0000           movabs     rax, 0x7f569c63c000
0010c b900010000                     mov        ecx, 0x100
00111 7f05                           jg         0x7f56a814e718
00113 b910010000                     mov        ecx, 0x110
00118 44899c2440010000               mov        dword ptr [rsp + 0x140], r11d
00120 4c8b1c08                       mov        r11, qword ptr [rax + rcx]
00124 4d8d5b01                       lea        r11, [r11 + 1]
00128 4c891c08                       mov        qword ptr [rax + rcx], r11
0012c 0f8f17420000                   jg         0x7f56a8152949
00132 4863db                         movsxd     rbx, ebx
00135 488b4e20                       mov        rcx, qword ptr [rsi + 0x20]
00139 482bcf                         sub        rcx, rdi
0013c 483bcb                         cmp        rcx, rbx
0013f 48b900c0639c567f0000           movabs     rcx, 0x7f569c63c000
00149 b830010000                     mov        eax, 0x130
0014e 7c05                           jl         0x7f56a814e755
00150 b820010000                     mov        eax, 0x120
00155 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
00159 4d8d5b01                       lea        r11, [r11 + 1]
0015d 4c891c01                       mov        qword ptr [rcx + rax], r11
00161 0f8ce2410000                   jl         0x7f56a8152949
00167 48b900c0639c567f0000           movabs     rcx, 0x7f569c63c000
00171 ff8160010000                   inc        dword ptr [rcx + 0x160]
00177 b900000000                     mov        ecx, 0
0017c 498bc0                         mov        rax, r8
0017f 483bc1                         cmp        rax, rcx
00182 48b900c0639c567f0000           movabs     rcx, 0x7f569c63c000
0018c b870010000                     mov        eax, 0x170
00191 7505                           jne        0x7f56a814e798
00193 b880010000                     mov        eax, 0x180
00198 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
0019c 4d8d5b01                       lea        r11, [r11 + 1]
001a0 4c891c01                       mov        qword ptr [rcx + rax], r11
001a4 0f8531000000                   jne        0x7f56a814e7db
001aa 4803df                         add        rbx, rdi
001ad 498bc9                         mov        rcx, r9
001b0 483bcb                         cmp        rcx, rbx
001b3 48b900c0639c567f0000           movabs     rcx, 0x7f569c63c000
001bd bfa0010000                     mov        edi, 0x1a0
001c2 7d05                           jge        0x7f56a814e7c9
001c4 bf90010000                     mov        edi, 0x190
001c9 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
001cd 488d5b01                       lea        rbx, [rbx + 1]
001d1 48891c39                       mov        qword ptr [rcx + rdi], rbx
001d5 0f8d0a000000                   jge        0x7f56a814e7e5
001db bf00000000                     mov        edi, 0
001e0 e915000000                     jmp        0x7f56a814e7fa
001e5 48b900c0639c567f0000           movabs     rcx, 0x7f569c63c000
001ef ff81b0010000                   inc        dword ptr [rcx + 0x1b0]
001f5 bf01000000                     mov        edi, 1
001fa 4d2bc6                         sub        r8, r14
001fd 4c89842480010000               mov        qword ptr [rsp + 0x180], r8
00205 48b900c0639c567f0000           movabs     rcx, 0x7f569c63c000
0020f 488381c801000001               add        qword ptr [rcx + 0x1c8], 1
00217 48b940db6d9c567f0000           movabs     rcx, 0x7f569c6ddb40
00221 8b5978                         mov        ebx, dword ptr [rcx + 0x78]
00224 83c302                         add        ebx, 2
00227 895978                         mov        dword ptr [rcx + 0x78], ebx
0022a 81e3feff1f00                   and        ebx, 0x1ffffe
00230 85db                           test       ebx, ebx
00232 0f84d2410000                   je         0x7f56a8152a0a
00238 48b9ffffffffffffff7f           movabs     rcx, 0x7fffffffffffffff
00242 493bc9                         cmp        rcx, r9
00245 48b940db6d9c567f0000           movabs     rcx, 0x7f569c6ddb40
0024f bbc0000000                     mov        ebx, 0xc0
00254 7d05                           jge        0x7f56a814e85b
00256 bbb0000000                     mov        ebx, 0xb0
0025b 488b0419                       mov        rax, qword ptr [rcx + rbx]
0025f 488d4001                       lea        rax, [rax + 1]
00263 48890419                       mov        qword ptr [rcx + rbx], rax
00267 0f8d0f000000                   jge        0x7f56a814e87c
0026d 49b9ffffffffffffff7f           movabs     r9, 0x7fffffffffffffff
00277 e910000000                     jmp        0x7f56a814e88c
0027c 48b940db6d9c567f0000           movabs     rcx, 0x7f569c6ddb40
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
00312 48bf00c0639c567f0000           movabs     rdi, 0x7f569c63c000
0031c b8d8010000                     mov        eax, 0x1d8
00321 7d05                           jge        0x7f56a814e928
00323 b8e8010000                     mov        eax, 0x1e8
00328 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
0032c 4d8d5b01                       lea        r11, [r11 + 1]
00330 4c891c07                       mov        qword ptr [rdi + rax], r11
00334 0f8d223d0000                   jge        0x7f56a815265c
0033a 413b5004                       cmp        edx, dword ptr [r8 + 4]
0033e 0f8332410000                   jae        0x7f56a8152a76
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
00387 48b900c0639c567f0000           movabs     rcx, 0x7f569c63c000
00391 41b8f8010000                   mov        r8d, 0x1f8
00397 7d06                           jge        0x7f56a814e99f
00399 41b808020000                   mov        r8d, 0x208
0039f 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003a3 4d8d6d01                       lea        r13, [r13 + 1]
003a7 4e892c01                       mov        qword ptr [rcx + r8], r13
003ab 0f8d15000000                   jge        0x7f56a814e9c6
003b1 413b5104                       cmp        edx, dword ptr [r9 + 4]
003b5 0f830f410000                   jae        0x7f56a8152aca
003bb 4863ca                         movsxd     rcx, edx
003be 418b4c8908                     mov        ecx, dword ptr [r9 + rcx*4 + 8]
003c3 488bc1                         mov        rax, rcx
003c6 85ff                           test       edi, edi
003c8 48b900c0639c567f0000           movabs     rcx, 0x7f569c63c000
003d2 41b818020000                   mov        r8d, 0x218
003d8 7406                           je         0x7f56a814e9e0
003da 41b828020000                   mov        r8d, 0x228
003e0 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003e4 4d8d6d01                       lea        r13, [r13 + 1]
003e8 4e892c01                       mov        qword ptr [rcx + r8], r13
003ec 0f8431000000                   je         0x7f56a814ea23
003f2 498bcb                         mov        rcx, r11
003f5 2bce                           sub        ecx, esi
003f7 3bf9                           cmp        edi, ecx
003f9 48b900c0639c567f0000           movabs     rcx, 0x7f569c63c000
00403 41b848020000                   mov        r8d, 0x248
00409 7f06                           jg         0x7f56a814ea11
0040b 41b838020000                   mov        r8d, 0x238
00411 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00415 4d8d6d01                       lea        r13, [r13 + 1]
00419 4e892c01                       mov        qword ptr [rcx + r8], r13
0041d 0f8f863e0000                   jg         0x7f56a81528a9
00423 83f803                         cmp        eax, 3
00426 48b900c0639c567f0000           movabs     rcx, 0x7f569c63c000
00430 41b868020000                   mov        r8d, 0x268
00436 7e06                           jle        0x7f56a814ea3e
00438 41b878020000                   mov        r8d, 0x278
0043e 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00442 4d8d6d01                       lea        r13, [r13 + 1]
00446 4e892c01                       mov        qword ptr [rcx + r8], r13
0044a 0f8e59000000                   jle        0x7f56a814eaa9
00450 83e803                         sub        eax, 3
00453 837b0401                       cmp        dword ptr [rbx + 4], 1
00457 0f86c1400000                   jbe        0x7f56a8152b1e
0045d 8b4b0c                         mov        ecx, dword ptr [rbx + 0xc]
00460 837b0402                       cmp        dword ptr [rbx + 4], 2
00464 0f86da400000                   jbe        0x7f56a8152b44
0046a 894b10                         mov        dword ptr [rbx + 0x10], ecx
0046d 8b4b08                         mov        ecx, dword ptr [rbx + 8]
00470 894b0c                         mov        dword ptr [rbx + 0xc], ecx
00473 894308                         mov        dword ptr [rbx + 8], eax
00476 48b900c0639c567f0000           movabs     rcx, 0x7f569c63c000
00480 ff8188020000                   inc        dword ptr [rcx + 0x288]
00486 89942444010000                 mov        dword ptr [rsp + 0x144], edx
0048d 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
00494 4c8bb42488010000               mov        r14, qword ptr [rsp + 0x188]
0049c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
004a4 e952000000                     jmp        0x7f56a814eafb
004a9 89942444010000                 mov        dword ptr [rsp + 0x144], edx
004b0 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
004b7 49b800c0639c567f0000           movabs     r8, 0x7f569c63c000
004c1 498380a002000001               add        qword ptr [r8 + 0x2a0], 1
004c9 488bf3                         mov        rsi, rbx
004cc 488bd0                         mov        rdx, rax
004cf 488bcf                         mov        rcx, rdi
004d2 90                             nop        
004d3 90                             nop        
004d4 90                             nop        
004d5 90                             nop        
004d6 90                             nop        
004d7 e884115e07                     call       0x7f56af72fc60
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
00510 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
0051a b9c0020000                     mov        ecx, 0x2c0
0051f 7d05                           jge        0x7f56a814eb26
00521 b9b0020000                     mov        ecx, 0x2b0
00526 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0052a 4d8d4001                       lea        r8, [r8 + 1]
0052e 4c89040a                       mov        qword ptr [rdx + rcx], r8
00532 0f8d15000000                   jge        0x7f56a814eb4d
00538 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00540 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00548 e9ad000000                     jmp        0x7f56a814ebfa
0054d 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00555 4585ed                         test       r13d, r13d
00558 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
00562 b9d0020000                     mov        ecx, 0x2d0
00567 7505                           jne        0x7f56a814eb6e
00569 b9e0020000                     mov        ecx, 0x2e0
0056e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
00572 4d8d4001                       lea        r8, [r8 + 1]
00576 4c89040a                       mov        qword ptr [rdx + rcx], r8
0057a 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00582 0f8568000000                   jne        0x7f56a814ebf0
00588 498bd3                         mov        rdx, r11
0058b 03d7                           add        edx, edi
0058d 2bd0                           sub        edx, eax
0058f 4863d2                         movsxd     rdx, edx
00592 493bd0                         cmp        rdx, r8
00595 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
0059f b9f0020000                     mov        ecx, 0x2f0
005a4 7c05                           jl         0x7f56a814ebab
005a6 b900030000                     mov        ecx, 0x300
005ab 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
005af 4d8d4901                       lea        r9, [r9 + 1]
005b3 4c890c0a                       mov        qword ptr [rdx + rcx], r9
005b7 0f8c3d000000                   jl         0x7f56a814ebfa
005bd 4c8b8c2450010000               mov        r9, qword ptr [rsp + 0x150]
005c5 4c3bcb                         cmp        r9, rbx
005c8 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
005d2 b920030000                     mov        ecx, 0x320
005d7 7c05                           jl         0x7f56a814ebde
005d9 b910030000                     mov        ecx, 0x310
005de 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
005e2 4d8d4901                       lea        r9, [r9 + 1]
005e6 4c890c0a                       mov        qword ptr [rdx + rcx], r9
005ea 0f8c0a000000                   jl         0x7f56a814ebfa
005f0 ba00000000                     mov        edx, 0
005f5 e915000000                     jmp        0x7f56a814ec0f
005fa 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
00604 ff8230030000                   inc        dword ptr [rdx + 0x330]
0060a ba01000000                     mov        edx, 1
0060f 48899c2498010000               mov        qword ptr [rsp + 0x198], rbx
00617 85c0                           test       eax, eax
00619 48b900c0639c567f0000           movabs     rcx, 0x7f569c63c000
00623 41b948030000                   mov        r9d, 0x348
00629 7e06                           jle        0x7f56a814ec31
0062b 41b958030000                   mov        r9d, 0x358
00631 4a8b1c09                       mov        rbx, qword ptr [rcx + r9]
00635 488d5b01                       lea        rbx, [rbx + 1]
00639 4a891c09                       mov        qword ptr [rcx + r9], rbx
0063d 0f8e6f390000                   jle        0x7f56a81525b2
00643 85d2                           test       edx, edx
00645 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
0064f b978030000                     mov        ecx, 0x378
00654 7505                           jne        0x7f56a814ec5b
00656 b968030000                     mov        ecx, 0x368
0065b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0065f 4d8d4901                       lea        r9, [r9 + 1]
00663 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00667 0f8545390000                   jne        0x7f56a81525b2
0066d 498bdb                         mov        rbx, r11
00670 03df                           add        ebx, edi
00672 899c24a0010000                 mov        dword ptr [rsp + 0x1a0], ebx
00679 488bf3                         mov        rsi, rbx
0067c 03b42478010000                 add        esi, dword ptr [rsp + 0x178]
00683 3bb42458010000                 cmp        esi, dword ptr [rsp + 0x158]
0068a 48be00c0639c567f0000           movabs     rsi, 0x7f569c63c000
00694 ba30040000                     mov        edx, 0x430
00699 7f05                           jg         0x7f56a814eca0
0069b ba40040000                     mov        edx, 0x440
006a0 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
006a4 488d4901                       lea        rcx, [rcx + 1]
006a8 48890c16                       mov        qword ptr [rsi + rdx], rcx
006ac 0f8f3f000000                   jg         0x7f56a814ecf1
006b2 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
006b9 03f7                           add        esi, edi
006bb 89b424a4010000                 mov        dword ptr [rsp + 0x1a4], esi
006c2 3bb4245c010000                 cmp        esi, dword ptr [rsp + 0x15c]
006c9 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
006d3 b960040000                     mov        ecx, 0x460
006d8 7e05                           jle        0x7f56a814ecdf
006da b950040000                     mov        ecx, 0x450
006df 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
006e3 4d8d4901                       lea        r9, [r9 + 1]
006e7 4c890c0a                       mov        qword ptr [rdx + rcx], r9
006eb 0f8e76000000                   jle        0x7f56a814ed67
006f1 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
006f9 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
00701 48be00c0639c567f0000           movabs     rsi, 0x7f569c63c000
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
00747 e8140f5e07                     call       0x7f56af72fc60
0074c 0f1f840044080001               nop        dword ptr [rax + rax + 0x1000844]
00754 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
0075b 03b4247c010000                 add        esi, dword ptr [rsp + 0x17c]
00762 e9c9370000                     jmp        0x7f56a8152530
00767 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
0076f 83ff10                         cmp        edi, 0x10
00772 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
0077c b970040000                     mov        ecx, 0x470
00781 7f05                           jg         0x7f56a814ed88
00783 b980040000                     mov        ecx, 0x480
00788 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0078c 4d8d4901                       lea        r9, [r9 + 1]
00790 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00794 0f8f670a0000                   jg         0x7f56a814f801
0079a 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
007a4 4883829004000001               add        qword ptr [rdx + 0x490], 1
007ac 48bae8ba6d9c567f0000           movabs     rdx, 0x7f569c6dbae8
007b6 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
007b9 83c102                         add        ecx, 2
007bc 894a78                         mov        dword ptr [rdx + 0x78], ecx
007bf 81e1feff1f00                   and        ecx, 0x1ffffe
007c5 85c9                           test       ecx, ecx
007c7 0f849d3d0000                   je         0x7f56a8152b6a
007cd 48bac0067ae200000000           movabs     rdx, 0xe27a06c0
007d7 48b9e8ba6d9c567f0000           movabs     rcx, 0x7f569c6dbae8
007e1 8b12                           mov        edx, dword ptr [rdx]
007e3 c1ea0d                         shr        edx, 0xd
007e6 48c1e20a                       shl        rdx, 0xa
007ea 41ba000000ad                   mov        r10d, 0xad000000
007f0 4903d2                         add        rdx, r10
007f3 41ba17000000                   mov        r10d, 0x17
007f9 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
007fd 7436                           je         0x7f56a814ee35
007ff 4983c202                       add        r10, 2
00803 4983fa1b                       cmp        r10, 0x1b
00807 75f0                           jne        0x7f56a814edf9
00809 41ba17000000                   mov        r10d, 0x17
0080f 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
00814 7412                           je         0x7f56a814ee28
00816 4983c202                       add        r10, 2
0081a 4983fa1b                       cmp        r10, 0x1b
0081e 75ef                           jne        0x7f56a814ee0f
00820 41ba16000000                   mov        r10d, 0x16
00826 eb11                           jmp        0x7f56a814ee39
00828 50                             push       rax
00829 4833c0                         xor        rax, rax
0082c f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
00832 58                             pop        rax
00833 ebbe                           jmp        0x7f56a814edf3
00835 4983c201                       add        r10, 1
00839 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0083e 48bae8ba6d9c567f0000           movabs     rdx, 0x7f569c6dbae8
00848 488382e000000001               add        qword ptr [rdx + 0xe0], 1
00850 48baf0b06d9c567f0000           movabs     rdx, 0x7f569c6db0f0
0085a 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0085d 83c102                         add        ecx, 2
00860 894a78                         mov        dword ptr [rdx + 0x78], ecx
00863 81e1feff1f00                   and        ecx, 0x1ffffe
00869 85c9                           test       ecx, ecx
0086b 0f841a3d0000                   je         0x7f56a8152b8b
00871 448bac2490010000               mov        r13d, dword ptr [rsp + 0x190]
00879 48baf0b06d9c567f0000           movabs     rdx, 0x7f569c6db0f0
00883 4883821001000001               add        qword ptr [rdx + 0x110], 1
0088b 8b942464010000                 mov        edx, dword ptr [rsp + 0x164]
00892 83ea0f                         sub        edx, 0xf
00895 48b980a76d9c567f0000           movabs     rcx, 0x7f569c6da780
0089f 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
008a3 4183c102                       add        r9d, 2
008a7 44894978                       mov        dword ptr [rcx + 0x78], r9d
008ab 4181e1feff1f00                 and        r9d, 0x1ffffe
008b2 4585c9                         test       r9d, r9d
008b5 0f84f13c0000                   je         0x7f56a8152bac
008bb 48b980a76d9c567f0000           movabs     rcx, 0x7f569c6da780
008c5 488381b000000001               add        qword ptr [rcx + 0xb0], 1
008cd 48b90000000000000000           movabs     rcx, 0
008d7 b900000000                     mov        ecx, 0
008dc 443be9                         cmp        r13d, ecx
008df 0f8ce83c0000                   jl         0x7f56a8152bcd
008e5 443bea                         cmp        r13d, edx
008e8 0f8d003d0000                   jge        0x7f56a8152bee
008ee 498bd5                         mov        rdx, r13
008f1 89942494010000                 mov        dword ptr [rsp + 0x194], edx
008f8 48b9c0067ae200000000           movabs     rcx, 0xe27a06c0
00902 4c8bc9                         mov        r9, rcx
00905 49bee8ba6d9c567f0000           movabs     r14, 0x7f569c6dbae8
0090f 458b09                         mov        r9d, dword ptr [r9]
00912 41c1e90d                       shr        r9d, 0xd
00916 49c1e10a                       shl        r9, 0xa
0091a 41ba000000ad                   mov        r10d, 0xad000000
00920 4d03ca                         add        r9, r10
00923 41ba25000000                   mov        r10d, 0x25
00929 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
0092d 7436                           je         0x7f56a814ef65
0092f 4983c202                       add        r10, 2
00933 4983fa29                       cmp        r10, 0x29
00937 75f0                           jne        0x7f56a814ef29
00939 41ba25000000                   mov        r10d, 0x25
0093f 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
00944 7412                           je         0x7f56a814ef58
00946 4983c202                       add        r10, 2
0094a 4983fa29                       cmp        r10, 0x29
0094e 75ef                           jne        0x7f56a814ef3f
00950 41ba24000000                   mov        r10d, 0x24
00956 eb11                           jmp        0x7f56a814ef69
00958 50                             push       rax
00959 4833c0                         xor        rax, rax
0095c f04f0fb10cd6                   lock cmpxchg qword ptr [r14 + r10*8], r9
00962 58                             pop        rax
00963 ebbe                           jmp        0x7f56a814ef23
00965 4983c201                       add        r10, 1
00969 4b8304d601                     add        qword ptr [r14 + r10*8], 1
0096e 48ba88a86d9c567f0000           movabs     rdx, 0x7f569c6da888
00978 448b4a78                       mov        r9d, dword ptr [rdx + 0x78]
0097c 4183c102                       add        r9d, 2
00980 44894a78                       mov        dword ptr [rdx + 0x78], r9d
00984 4181e1feff1f00                 and        r9d, 0x1ffffe
0098b 4585c9                         test       r9d, r9d
0098e 0f847b3c0000                   je         0x7f56a8152c0f
00994 48ba88a86d9c567f0000           movabs     rdx, 0x7f569c6da888
0099e 488382b000000001               add        qword ptr [rdx + 0xb0], 1
009a6 48bab8a96d9c567f0000           movabs     rdx, 0x7f569c6da9b8
009b0 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
009b3 83c102                         add        ecx, 2
009b6 894a78                         mov        dword ptr [rdx + 0x78], ecx
009b9 81e1feff1f00                   and        ecx, 0x1ffffe
009bf 85c9                           test       ecx, ecx
009c1 0f84693c0000                   je         0x7f56a8152c30
009c7 48bab8a96d9c567f0000           movabs     rdx, 0x7f569c6da9b8
009d1 ff82c0000000                   inc        dword ptr [rdx + 0xc0]
009d7 8b942494010000                 mov        edx, dword ptr [rsp + 0x194]
009de 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
009e5 4489ac2490010000               mov        dword ptr [rsp + 0x190], r13d
009ed 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
009f5 488b9c2468010000               mov        rbx, qword ptr [rsp + 0x168]
009fd 48b9b8867ae200000000           movabs     rcx, 0xe27a86b8
00a07 4c8bc9                         mov        r9, rcx
00a0a 48b8e8ba6d9c567f0000           movabs     rax, 0x7f569c6dbae8
00a14 4883806001000001               add        qword ptr [rax + 0x160], 1
00a1c 49b9b8bc6d9c567f0000           movabs     r9, 0x7f569c6dbcb8
00a26 418b4178                       mov        eax, dword ptr [r9 + 0x78]
00a2a 83c002                         add        eax, 2
00a2d 41894178                       mov        dword ptr [r9 + 0x78], eax
00a31 25feff1f00                     and        eax, 0x1ffffe
00a36 85c0                           test       eax, eax
00a38 0f84133c0000                   je         0x7f56a8152c51
00a3e 4c8bc9                         mov        r9, rcx
00a41 48b8b8bc6d9c567f0000           movabs     rax, 0x7f569c6dbcb8
00a4b 488380b000000001               add        qword ptr [rax + 0xb0], 1
00a53 49b9a0bd6d9c567f0000           movabs     r9, 0x7f569c6dbda0
00a5d 418b4178                       mov        eax, dword ptr [r9 + 0x78]
00a61 83c002                         add        eax, 2
00a64 41894178                       mov        dword ptr [r9 + 0x78], eax
00a68 25feff1f00                     and        eax, 0x1ffffe
00a6d 85c0                           test       eax, eax
00a6f 0f84fd3b0000                   je         0x7f56a8152c72
00a75 49b9a0bd6d9c567f0000           movabs     r9, 0x7f569c6dbda0
00a7f 498381c000000001               add        qword ptr [r9 + 0xc0], 1
00a87 48b970b26d9c567f0000           movabs     rcx, 0x7f569c6db270
00a91 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
00a95 4183c102                       add        r9d, 2
00a99 44894978                       mov        dword ptr [rcx + 0x78], r9d
00a9d 4181e1feff1f00                 and        r9d, 0x1ffffe
00aa4 4585c9                         test       r9d, r9d
00aa7 0f84e63b0000                   je         0x7f56a8152c93
00aad 48b9c0067ae200000000           movabs     rcx, 0xe27a06c0
00ab7 4c8bc9                         mov        r9, rcx
00aba 48b8a0bd6d9c567f0000           movabs     rax, 0x7f569c6dbda0
00ac4 458b09                         mov        r9d, dword ptr [r9]
00ac7 41c1e90d                       shr        r9d, 0xd
00acb 49c1e10a                       shl        r9, 0xa
00acf 41ba000000ad                   mov        r10d, 0xad000000
00ad5 4d03ca                         add        r9, r10
00ad8 41ba1d000000                   mov        r10d, 0x1d
00ade 4e3b0cd0                       cmp        r9, qword ptr [rax + r10*8]
00ae2 743c                           je         0x7f56a814f120
00ae4 4983c202                       add        r10, 2
00ae8 4983fa21                       cmp        r10, 0x21
00aec 75f0                           jne        0x7f56a814f0de
00aee 41ba1d000000                   mov        r10d, 0x1d
00af4 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
00af9 7412                           je         0x7f56a814f10d
00afb 4983c202                       add        r10, 2
00aff 4983fa21                       cmp        r10, 0x21
00b03 75ef                           jne        0x7f56a814f0f4
00b05 41ba1c000000                   mov        r10d, 0x1c
00b0b eb17                           jmp        0x7f56a814f124
00b0d 53                             push       rbx
00b0e 488bd8                         mov        rbx, rax
00b11 4833c0                         xor        rax, rax
00b14 f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
00b1a 488bc3                         mov        rax, rbx
00b1d 5b                             pop        rbx
00b1e ebb8                           jmp        0x7f56a814f0d8
00b20 4983c201                       add        r10, 1
00b24 4a8304d001                     add        qword ptr [rax + r10*8], 1
00b29 49b9a0bd6d9c567f0000           movabs     r9, 0x7f569c6dbda0
00b33 8b09                           mov        ecx, dword ptr [rcx]
00b35 c1e90d                         shr        ecx, 0xd
00b38 48c1e10a                       shl        rcx, 0xa
00b3c 41ba000000ad                   mov        r10d, 0xad000000
00b42 4903ca                         add        rcx, r10
00b45 41ba23000000                   mov        r10d, 0x23
00b4b 4b3b0cd1                       cmp        rcx, qword ptr [r9 + r10*8]
00b4f 7436                           je         0x7f56a814f187
00b51 4983c202                       add        r10, 2
00b55 4983fa27                       cmp        r10, 0x27
00b59 75f0                           jne        0x7f56a814f14b
00b5b 41ba23000000                   mov        r10d, 0x23
00b61 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
00b66 7412                           je         0x7f56a814f17a
00b68 4983c202                       add        r10, 2
00b6c 4983fa27                       cmp        r10, 0x27
00b70 75ef                           jne        0x7f56a814f161
00b72 41ba22000000                   mov        r10d, 0x22
00b78 eb11                           jmp        0x7f56a814f18b
00b7a 50                             push       rax
00b7b 4833c0                         xor        rax, rax
00b7e f04b0fb10cd1                   lock cmpxchg qword ptr [r9 + r10*8], rcx
00b84 58                             pop        rax
00b85 ebbe                           jmp        0x7f56a814f145
00b87 4983c201                       add        r10, 1
00b8b 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00b90 48b9a0bd6d9c567f0000           movabs     rcx, 0x7f569c6dbda0
00b9a 4883814001000001               add        qword ptr [rcx + 0x140], 1
00ba2 48b938b36d9c567f0000           movabs     rcx, 0x7f569c6db338
00bac 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
00bb0 4183c102                       add        r9d, 2
00bb4 44894978                       mov        dword ptr [rcx + 0x78], r9d
00bb8 4181e1feff1f00                 and        r9d, 0x1ffffe
00bbf 4585c9                         test       r9d, r9d
00bc2 0f84ec3a0000                   je         0x7f56a8152cb4
00bc8 48b9a0bd6d9c567f0000           movabs     rcx, 0x7f569c6dbda0
00bd2 4883815001000001               add        qword ptr [rcx + 0x150], 1
00bda 4863c2                         movsxd     rax, edx
00bdd ba08000000                     mov        edx, 8
00be2 4c8bc8                         mov        r9, rax
00be5 4c03ca                         add        r9, rdx
00be8 48bac0a46d9c567f0000           movabs     rdx, 0x7f569c6da4c0
00bf2 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
00bf5 83c102                         add        ecx, 2
00bf8 894a78                         mov        dword ptr [rdx + 0x78], ecx
00bfb 81e1feff1f00                   and        ecx, 0x1ffffe
00c01 85c9                           test       ecx, ecx
00c03 0f84cc3a0000                   je         0x7f56a8152cd5
00c09 48bac0a46d9c567f0000           movabs     rdx, 0x7f569c6da4c0
00c13 488382e000000001               add        qword ptr [rdx + 0xe0], 1
00c1b 48ba40a66d9c567f0000           movabs     rdx, 0x7f569c6da640
00c25 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
00c28 83c102                         add        ecx, 2
00c2b 894a78                         mov        dword ptr [rdx + 0x78], ecx
00c2e 81e1feff1f00                   and        ecx, 0x1ffffe
00c34 85c9                           test       ecx, ecx
00c36 0f84ba3a0000                   je         0x7f56a8152cf6
00c3c 48baa0bd6d9c567f0000           movabs     rdx, 0x7f569c6dbda0
00c46 4883827001000001               add        qword ptr [rdx + 0x170], 1
00c4e 48ba88df7ae200000000           movabs     rdx, 0xe27adf88
00c58 48be08077ae200000000           movabs     rsi, 0xe27a0708
00c62 ba02000000                     mov        edx, 2
00c67 b910000000                     mov        ecx, 0x10
00c6c 4c8bc3                         mov        r8, rbx
00c6f bf00000000                     mov        edi, 0
00c74 48891c24                       mov        qword ptr [rsp], rbx
00c78 4889442408                     mov        qword ptr [rsp + 8], rax
00c7d 49bac0067ae200000000           movabs     r10, 0xe27a06c0
00c87 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00c8c 49ba88df7ae200000000           movabs     r10, 0xe27adf88
00c96 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c9b 90                             nop        
00c9c 90                             nop        
00c9d 90                             nop        
00c9e 90                             nop        
00c9f e8bc095e07                     call       0x7f56af72fc60
00ca4 0f1f84009c0d0002               nop        dword ptr [rax + rax + 0x2000d9c]
00cac 4885c0                         test       rax, rax
00caf 48bba0bd6d9c567f0000           movabs     rbx, 0x7f569c6dbda0
00cb9 750c                           jne        0x7f56a814f2c7
00cbb 808b7901000001                 or         byte ptr [rbx + 0x179], 1
00cc2 e988000000                     jmp        0x7f56a814f34f
00cc7 8b38                           mov        edi, dword ptr [rax]
00cc9 c1ef0d                         shr        edi, 0xd
00ccc 48c1e70a                       shl        rdi, 0xa
00cd0 41ba000000ad                   mov        r10d, 0xad000000
00cd6 4903fa                         add        rdi, r10
00cd9 41ba31000000                   mov        r10d, 0x31
00cdf 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
00ce3 7436                           je         0x7f56a814f31b
00ce5 4983c202                       add        r10, 2
00ce9 4983fa35                       cmp        r10, 0x35
00ced 75f0                           jne        0x7f56a814f2df
00cef 41ba31000000                   mov        r10d, 0x31
00cf5 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00cfa 7412                           je         0x7f56a814f30e
00cfc 4983c202                       add        r10, 2
00d00 4983fa35                       cmp        r10, 0x35
00d04 75ef                           jne        0x7f56a814f2f5
00d06 41ba30000000                   mov        r10d, 0x30
00d0c eb11                           jmp        0x7f56a814f31f
00d0e 50                             push       rax
00d0f 4833c0                         xor        rax, rax
00d12 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
00d18 58                             pop        rax
00d19 ebbe                           jmp        0x7f56a814f2d9
00d1b 4983c201                       add        r10, 1
00d1f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00d24 48bf00b414ad00000000           movabs     rdi, 0xad14b400
00d2e 8b18                           mov        ebx, dword ptr [rax]
00d30 c1eb0d                         shr        ebx, 0xd
00d33 48c1e30a                       shl        rbx, 0xa
00d37 41ba000000ad                   mov        r10d, 0xad000000
00d3d 4903da                         add        rbx, r10
00d40 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
00d44 0f85cd390000                   jne        0x7f56a8152d17
00d4a e900000000                     jmp        0x7f56a814f34f
00d4f 488bf8                         mov        rdi, rax
00d52 4889bc24b0010000               mov        qword ptr [rsp + 0x1b0], rdi
00d5a 483b07                         cmp        rax, qword ptr [rdi]
00d5d 488bf7                         mov        rsi, rdi
00d60 48bb00c0639c567f0000           movabs     rbx, 0x7f569c63c000
00d6a 8b36                           mov        esi, dword ptr [rsi]
00d6c c1ee0d                         shr        esi, 0xd
00d6f 48c1e60a                       shl        rsi, 0xa
00d73 41ba000000ad                   mov        r10d, 0xad000000
00d79 4903f2                         add        rsi, r10
00d7c 41ba95000000                   mov        r10d, 0x95
00d82 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00d86 743c                           je         0x7f56a814f3c4
00d88 4983c202                       add        r10, 2
00d8c 4981fa99000000                 cmp        r10, 0x99
00d93 75ed                           jne        0x7f56a814f382
00d95 41ba95000000                   mov        r10d, 0x95
00d9b 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00da0 7415                           je         0x7f56a814f3b7
00da2 4983c202                       add        r10, 2
00da6 4981fa99000000                 cmp        r10, 0x99
00dad 75ec                           jne        0x7f56a814f39b
00daf 41ba94000000                   mov        r10d, 0x94
00db5 eb11                           jmp        0x7f56a814f3c8
00db7 50                             push       rax
00db8 4833c0                         xor        rax, rax
00dbb f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00dc1 58                             pop        rax
00dc2 ebb8                           jmp        0x7f56a814f37c
00dc4 4983c201                       add        r10, 1
00dc8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00dcd 48bef0c76d9c567f0000           movabs     rsi, 0x7f569c6dc7f0
00dd7 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
00dda 83c302                         add        ebx, 2
00ddd 895e78                         mov        dword ptr [rsi + 0x78], ebx
00de0 81e3feff1f00                   and        ebx, 0x1ffffe
00de6 85db                           test       ebx, ebx
00de8 0f845f390000                   je         0x7f56a8152d4d
00dee 488bf7                         mov        rsi, rdi
00df1 48bbf0c76d9c567f0000           movabs     rbx, 0x7f569c6dc7f0
00dfb 8b36                           mov        esi, dword ptr [rsi]
00dfd c1ee0d                         shr        esi, 0xd
00e00 48c1e60a                       shl        rsi, 0xa
00e04 41ba000000ad                   mov        r10d, 0xad000000
00e0a 4903f2                         add        rsi, r10
00e0d 41ba17000000                   mov        r10d, 0x17
00e13 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00e17 7436                           je         0x7f56a814f44f
00e19 4983c202                       add        r10, 2
00e1d 4983fa1b                       cmp        r10, 0x1b
00e21 75f0                           jne        0x7f56a814f413
00e23 41ba17000000                   mov        r10d, 0x17
00e29 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00e2e 7412                           je         0x7f56a814f442
00e30 4983c202                       add        r10, 2
00e34 4983fa1b                       cmp        r10, 0x1b
00e38 75ef                           jne        0x7f56a814f429
00e3a 41ba16000000                   mov        r10d, 0x16
00e40 eb11                           jmp        0x7f56a814f453
00e42 50                             push       rax
00e43 4833c0                         xor        rax, rax
00e46 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00e4c 58                             pop        rax
00e4d ebbe                           jmp        0x7f56a814f40d
00e4f 4983c201                       add        r10, 1
00e53 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00e58 488bf7                         mov        rsi, rdi
00e5b 90                             nop        
00e5c 90                             nop        
00e5d 48b8408c687c567f0000           movabs     rax, 0x7f567c688c40
00e67 e8f4025e07                     call       0x7f56af72f760
00e6c 0f1f8400640f0003               nop        dword ptr [rax + rax + 0x3000f64]
00e74 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
00e7c 8b7704                         mov        esi, dword ptr [rdi + 4]
00e7f 48bbf0c76d9c567f0000           movabs     rbx, 0x7f569c6dc7f0
00e89 488383e000000001               add        qword ptr [rbx + 0xe0], 1
00e91 48bbf0b06d9c567f0000           movabs     rbx, 0x7f569c6db0f0
00e9b 8b5378                         mov        edx, dword ptr [rbx + 0x78]
00e9e 83c202                         add        edx, 2
00ea1 895378                         mov        dword ptr [rbx + 0x78], edx
00ea4 81e2feff1f00                   and        edx, 0x1ffffe
00eaa 85d2                           test       edx, edx
00eac 0f84d5380000                   je         0x7f56a8152d87
00eb2 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
00eba 48bbf0b06d9c567f0000           movabs     rbx, 0x7f569c6db0f0
00ec4 4883831001000001               add        qword ptr [rbx + 0x110], 1
00ecc ffc8                           dec        eax
00ece 2bf0                           sub        esi, eax
00ed0 48bb80a76d9c567f0000           movabs     rbx, 0x7f569c6da780
00eda 8b4378                         mov        eax, dword ptr [rbx + 0x78]
00edd 83c002                         add        eax, 2
00ee0 894378                         mov        dword ptr [rbx + 0x78], eax
00ee3 25feff1f00                     and        eax, 0x1ffffe
00ee8 85c0                           test       eax, eax
00eea 0f84b8380000                   je         0x7f56a8152da8
00ef0 48bb80a76d9c567f0000           movabs     rbx, 0x7f569c6da780
00efa 488383b000000001               add        qword ptr [rbx + 0xb0], 1
00f02 48bb0000000000000000           movabs     rbx, 0
00f0c bb00000000                     mov        ebx, 0
00f11 443bdb                         cmp        r11d, ebx
00f14 0f8caf380000                   jl         0x7f56a8152dc9
00f1a 443bde                         cmp        r11d, esi
00f1d 0f8dc7380000                   jge        0x7f56a8152dea
00f23 498bdb                         mov        rbx, r11
00f26 899c24ac010000                 mov        dword ptr [rsp + 0x1ac], ebx
00f2d 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
00f35 488bbc24b0010000               mov        rdi, qword ptr [rsp + 0x1b0]
00f3d 488bf7                         mov        rsi, rdi
00f40 48baf0c76d9c567f0000           movabs     rdx, 0x7f569c6dc7f0
00f4a 8b36                           mov        esi, dword ptr [rsi]
00f4c c1ee0d                         shr        esi, 0xd
00f4f 48c1e60a                       shl        rsi, 0xa
00f53 41ba000000ad                   mov        r10d, 0xad000000
00f59 4903f2                         add        rsi, r10
00f5c 41ba1f000000                   mov        r10d, 0x1f
00f62 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
00f66 7436                           je         0x7f56a814f59e
00f68 4983c202                       add        r10, 2
00f6c 4983fa23                       cmp        r10, 0x23
00f70 75f0                           jne        0x7f56a814f562
00f72 41ba1f000000                   mov        r10d, 0x1f
00f78 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
00f7d 7412                           je         0x7f56a814f591
00f7f 4983c202                       add        r10, 2
00f83 4983fa23                       cmp        r10, 0x23
00f87 75ef                           jne        0x7f56a814f578
00f89 41ba1e000000                   mov        r10d, 0x1e
00f8f eb11                           jmp        0x7f56a814f5a2
00f91 50                             push       rax
00f92 4833c0                         xor        rax, rax
00f95 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
00f9b 58                             pop        rax
00f9c ebbe                           jmp        0x7f56a814f55c
00f9e 4983c201                       add        r10, 1
00fa2 4a8304d201                     add        qword ptr [rdx + r10*8], 1
00fa7 488bf7                         mov        rsi, rdi
00faa 90                             nop        
00fab 90                             nop        
00fac 90                             nop        
00fad 48b8688c687c567f0000           movabs     rax, 0x7f567c688c68
00fb7 e8a4015e07                     call       0x7f56af72f760
00fbc 0f1f8400b4100004               nop        dword ptr [rax + rax + 0x40010b4]
00fc4 483b00                         cmp        rax, qword ptr [rax]
00fc7 488bf0                         mov        rsi, rax
00fca 48baf0c76d9c567f0000           movabs     rdx, 0x7f569c6dc7f0
00fd4 8b36                           mov        esi, dword ptr [rsi]
00fd6 c1ee0d                         shr        esi, 0xd
00fd9 48c1e60a                       shl        rsi, 0xa
00fdd 41ba000000ad                   mov        r10d, 0xad000000
00fe3 4903f2                         add        rsi, r10
00fe6 41ba25000000                   mov        r10d, 0x25
00fec 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
00ff0 7436                           je         0x7f56a814f628
00ff2 4983c202                       add        r10, 2
00ff6 4983fa29                       cmp        r10, 0x29
00ffa 75f0                           jne        0x7f56a814f5ec
00ffc 41ba25000000                   mov        r10d, 0x25
01002 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01007 7412                           je         0x7f56a814f61b
01009 4983c202                       add        r10, 2
0100d 4983fa29                       cmp        r10, 0x29
01011 75ef                           jne        0x7f56a814f602
01013 41ba24000000                   mov        r10d, 0x24
01019 eb11                           jmp        0x7f56a814f62c
0101b 50                             push       rax
0101c 4833c0                         xor        rax, rax
0101f f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01025 58                             pop        rax
01026 ebbe                           jmp        0x7f56a814f5e6
01028 4983c201                       add        r10, 1
0102c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01031 8b7024                         mov        esi, dword ptr [rax + 0x24]
01034 4c3b25dd263020                 cmp        r12, qword ptr [rip + 0x203026dd]
0103b 0f8414000000                   je         0x7f56a814f655
01041 48bf384352c6567f0000           movabs     rdi, 0x7f56c6524338
0104b 4883e4f0                       and        rsp, 0xfffffffffffffff0
0104f e88c0e6d1f                     call       0x7f56c78204e0
01054 f4                             hlt        
01055 488bd0                         mov        rdx, rax
01058 48b9f0c76d9c567f0000           movabs     rcx, 0x7f569c6dc7f0
01062 8b12                           mov        edx, dword ptr [rdx]
01064 c1ea0d                         shr        edx, 0xd
01067 48c1e20a                       shl        rdx, 0xa
0106b 41ba000000ad                   mov        r10d, 0xad000000
01071 4903d2                         add        rdx, r10
01074 41ba2b000000                   mov        r10d, 0x2b
0107a 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0107e 7436                           je         0x7f56a814f6b6
01080 4983c202                       add        r10, 2
01084 4983fa2f                       cmp        r10, 0x2f
01088 75f0                           jne        0x7f56a814f67a
0108a 41ba2b000000                   mov        r10d, 0x2b
01090 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01095 7412                           je         0x7f56a814f6a9
01097 4983c202                       add        r10, 2
0109b 4983fa2f                       cmp        r10, 0x2f
0109f 75ef                           jne        0x7f56a814f690
010a1 41ba2a000000                   mov        r10d, 0x2a
010a7 eb11                           jmp        0x7f56a814f6ba
010a9 50                             push       rax
010aa 4833c0                         xor        rax, rax
010ad f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
010b3 58                             pop        rax
010b4 ebbe                           jmp        0x7f56a814f674
010b6 4983c201                       add        r10, 1
010ba 4a8304d101                     add        qword ptr [rcx + r10*8], 1
010bf 8b4804                         mov        ecx, dword ptr [rax + 4]
010c2 48baf0c76d9c567f0000           movabs     rdx, 0x7f569c6dc7f0
010cc 4883828001000001               add        qword ptr [rdx + 0x180], 1
010d4 48ba38b36d9c567f0000           movabs     rdx, 0x7f569c6db338
010de 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
010e2 4183c002                       add        r8d, 2
010e6 44894278                       mov        dword ptr [rdx + 0x78], r8d
010ea 4181e0feff1f00                 and        r8d, 0x1ffffe
010f1 4585c0                         test       r8d, r8d
010f4 0f842a370000                   je         0x7f56a8152e24
010fa 48baf0c76d9c567f0000           movabs     rdx, 0x7f569c6dc7f0
01104 4883829001000001               add        qword ptr [rdx + 0x190], 1
0110c 8b9c24ac010000                 mov        ebx, dword ptr [rsp + 0x1ac]
01113 4863db                         movsxd     rbx, ebx
01116 ba08000000                     mov        edx, 8
0111b 4c8bcb                         mov        r9, rbx
0111e 4c03ca                         add        r9, rdx
01121 48bac0a46d9c567f0000           movabs     rdx, 0x7f569c6da4c0
0112b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
0112f 4183c002                       add        r8d, 2
01133 44894278                       mov        dword ptr [rdx + 0x78], r8d
01137 4181e0feff1f00                 and        r8d, 0x1ffffe
0113e 4585c0                         test       r8d, r8d
01141 0f84fe360000                   je         0x7f56a8152e45
01147 48bac0a46d9c567f0000           movabs     rdx, 0x7f569c6da4c0
01151 488382e000000001               add        qword ptr [rdx + 0xe0], 1
01159 48ba40a66d9c567f0000           movabs     rdx, 0x7f569c6da640
01163 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01167 4183c002                       add        r8d, 2
0116b 44894278                       mov        dword ptr [rdx + 0x78], r8d
0116f 4181e0feff1f00                 and        r8d, 0x1ffffe
01176 4585c0                         test       r8d, r8d
01179 0f84e7360000                   je         0x7f56a8152e66
0117f 48baf0c76d9c567f0000           movabs     rdx, 0x7f569c6dc7f0
01189 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
01191 48ba707d7be200000000           movabs     rdx, 0xe27b7d70
0119b ba02000000                     mov        edx, 2
011a0 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
011a8 bf00000000                     mov        edi, 0
011ad 488b8424b0010000               mov        rax, qword ptr [rsp + 0x1b0]
011b5 48890424                       mov        qword ptr [rsp], rax
011b9 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
011c1 4889442408                     mov        qword ptr [rsp + 8], rax
011c6 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
011cb 49ba707d7be200000000           movabs     r10, 0xe27b7d70
011d5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
011da 90                             nop        
011db 90                             nop        
011dc 90                             nop        
011dd 90                             nop        
011de 90                             nop        
011df e87c045e07                     call       0x7f56af72fc60
011e4 0f1f8400dc120005               nop        dword ptr [rax + rax + 0x50012dc]
011ec 48be00c0639c567f0000           movabs     rsi, 0x7f569c63c000
011f6 ff86d0040000                   inc        dword ptr [rsi + 0x4d0]
011fc e9480c0000                     jmp        0x7f56a8150449
01201 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
01208 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
01210 83ff30                         cmp        edi, 0x30
01213 48be00c0639c567f0000           movabs     rsi, 0x7f569c63c000
0121d bae8040000                     mov        edx, 0x4e8
01222 7f05                           jg         0x7f56a814f829
01224 baf8040000                     mov        edx, 0x4f8
01229 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0122d 488d4901                       lea        rcx, [rcx + 1]
01231 48890c16                       mov        qword ptr [rsi + rdx], rcx
01235 0f8f1e0b0000                   jg         0x7f56a8150359
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
01267 48b900c0639c567f0000           movabs     rcx, 0x7f569c63c000
01271 4883810805000001               add        qword ptr [rcx + 0x508], 1
01279 48b9e8ba6d9c567f0000           movabs     rcx, 0x7f569c6dbae8
01283 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
01287 4183c002                       add        r8d, 2
0128b 44894178                       mov        dword ptr [rcx + 0x78], r8d
0128f 4181e0feff1f00                 and        r8d, 0x1ffffe
01296 4585c0                         test       r8d, r8d
01299 0f84e8350000                   je         0x7f56a8152e87
0129f 48b9c0067ae200000000           movabs     rcx, 0xe27a06c0
012a9 49b8e8ba6d9c567f0000           movabs     r8, 0x7f569c6dbae8
012b3 8b09                           mov        ecx, dword ptr [rcx]
012b5 c1e90d                         shr        ecx, 0xd
012b8 48c1e10a                       shl        rcx, 0xa
012bc 41ba000000ad                   mov        r10d, 0xad000000
012c2 4903ca                         add        rcx, r10
012c5 41ba17000000                   mov        r10d, 0x17
012cb 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
012cf 7436                           je         0x7f56a814f907
012d1 4983c202                       add        r10, 2
012d5 4983fa1b                       cmp        r10, 0x1b
012d9 75f0                           jne        0x7f56a814f8cb
012db 41ba17000000                   mov        r10d, 0x17
012e1 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
012e6 7412                           je         0x7f56a814f8fa
012e8 4983c202                       add        r10, 2
012ec 4983fa1b                       cmp        r10, 0x1b
012f0 75ef                           jne        0x7f56a814f8e1
012f2 41ba16000000                   mov        r10d, 0x16
012f8 eb11                           jmp        0x7f56a814f90b
012fa 50                             push       rax
012fb 4833c0                         xor        rax, rax
012fe f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
01304 58                             pop        rax
01305 ebbe                           jmp        0x7f56a814f8c5
01307 4983c201                       add        r10, 1
0130b 4b8304d001                     add        qword ptr [r8 + r10*8], 1
01310 48b9e8ba6d9c567f0000           movabs     rcx, 0x7f569c6dbae8
0131a 488381e000000001               add        qword ptr [rcx + 0xe0], 1
01322 48b9f0b06d9c567f0000           movabs     rcx, 0x7f569c6db0f0
0132c 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
01330 4183c002                       add        r8d, 2
01334 44894178                       mov        dword ptr [rcx + 0x78], r8d
01338 4181e0feff1f00                 and        r8d, 0x1ffffe
0133f 4585c0                         test       r8d, r8d
01342 0f8460350000                   je         0x7f56a8152ea8
01348 48b9f0b06d9c567f0000           movabs     rcx, 0x7f569c6db0f0
01352 4883811001000001               add        qword ptr [rcx + 0x110], 1
0135a 488bc8                         mov        rcx, rax
0135d 83e90f                         sub        ecx, 0xf
01360 49b880a76d9c567f0000           movabs     r8, 0x7f569c6da780
0136a 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
0136e 4183c102                       add        r9d, 2
01372 45894878                       mov        dword ptr [r8 + 0x78], r9d
01376 4181e1feff1f00                 and        r9d, 0x1ffffe
0137d 4585c9                         test       r9d, r9d
01380 0f8443350000                   je         0x7f56a8152ec9
01386 49b880a76d9c567f0000           movabs     r8, 0x7f569c6da780
01390 498380b000000001               add        qword ptr [r8 + 0xb0], 1
01398 49b80000000000000000           movabs     r8, 0
013a2 41b800000000                   mov        r8d, 0
013a8 413bf0                         cmp        esi, r8d
013ab 0f8c39350000                   jl         0x7f56a8152eea
013b1 3bf1                           cmp        esi, ecx
013b3 0f8d52350000                   jge        0x7f56a8152f0b
013b9 488bce                         mov        rcx, rsi
013bc 898c24b8010000                 mov        dword ptr [rsp + 0x1b8], ecx
013c3 49b8c0067ae200000000           movabs     r8, 0xe27a06c0
013cd 4d8bc8                         mov        r9, r8
013d0 49bee8ba6d9c567f0000           movabs     r14, 0x7f569c6dbae8
013da 458b09                         mov        r9d, dword ptr [r9]
013dd 41c1e90d                       shr        r9d, 0xd
013e1 49c1e10a                       shl        r9, 0xa
013e5 41ba000000ad                   mov        r10d, 0xad000000
013eb 4d03ca                         add        r9, r10
013ee 41ba25000000                   mov        r10d, 0x25
013f4 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
013f8 7436                           je         0x7f56a814fa30
013fa 4983c202                       add        r10, 2
013fe 4983fa29                       cmp        r10, 0x29
01402 75f0                           jne        0x7f56a814f9f4
01404 41ba25000000                   mov        r10d, 0x25
0140a 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
0140f 7412                           je         0x7f56a814fa23
01411 4983c202                       add        r10, 2
01415 4983fa29                       cmp        r10, 0x29
01419 75ef                           jne        0x7f56a814fa0a
0141b 41ba24000000                   mov        r10d, 0x24
01421 eb11                           jmp        0x7f56a814fa34
01423 50                             push       rax
01424 4833c0                         xor        rax, rax
01427 f04f0fb10cd6                   lock cmpxchg qword ptr [r14 + r10*8], r9
0142d 58                             pop        rax
0142e ebbe                           jmp        0x7f56a814f9ee
01430 4983c201                       add        r10, 1
01434 4b8304d601                     add        qword ptr [r14 + r10*8], 1
01439 48b988a86d9c567f0000           movabs     rcx, 0x7f569c6da888
01443 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
01447 4183c102                       add        r9d, 2
0144b 44894978                       mov        dword ptr [rcx + 0x78], r9d
0144f 4181e1feff1f00                 and        r9d, 0x1ffffe
01456 4585c9                         test       r9d, r9d
01459 0f84cd340000                   je         0x7f56a8152f2c
0145f 48b988a86d9c567f0000           movabs     rcx, 0x7f569c6da888
01469 488381b000000001               add        qword ptr [rcx + 0xb0], 1
01471 48b9b8a96d9c567f0000           movabs     rcx, 0x7f569c6da9b8
0147b 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
0147f 4183c002                       add        r8d, 2
01483 44894178                       mov        dword ptr [rcx + 0x78], r8d
01487 4181e0feff1f00                 and        r8d, 0x1ffffe
0148e 4585c0                         test       r8d, r8d
01491 0f84b6340000                   je         0x7f56a8152f4d
01497 48b9b8a96d9c567f0000           movabs     rcx, 0x7f569c6da9b8
014a1 ff81c0000000                   inc        dword ptr [rcx + 0xc0]
014a7 8b8c24b8010000                 mov        ecx, dword ptr [rsp + 0x1b8]
014ae 89b424c0010000                 mov        dword ptr [rsp + 0x1c0], esi
014b5 49b8b8867ae200000000           movabs     r8, 0xe27a86b8
014bf 4d8bc8                         mov        r9, r8
014c2 49bee8ba6d9c567f0000           movabs     r14, 0x7f569c6dbae8
014cc 4983866001000001               add        qword ptr [r14 + 0x160], 1
014d4 49b9b8bc6d9c567f0000           movabs     r9, 0x7f569c6dbcb8
014de 418b5978                       mov        ebx, dword ptr [r9 + 0x78]
014e2 83c302                         add        ebx, 2
014e5 41895978                       mov        dword ptr [r9 + 0x78], ebx
014e9 81e3feff1f00                   and        ebx, 0x1ffffe
014ef 85db                           test       ebx, ebx
014f1 0f8477340000                   je         0x7f56a8152f6e
014f7 4d8bc8                         mov        r9, r8
014fa 48bbb8bc6d9c567f0000           movabs     rbx, 0x7f569c6dbcb8
01504 488383b000000001               add        qword ptr [rbx + 0xb0], 1
0150c 49b9a0bd6d9c567f0000           movabs     r9, 0x7f569c6dbda0
01516 418b5978                       mov        ebx, dword ptr [r9 + 0x78]
0151a 83c302                         add        ebx, 2
0151d 41895978                       mov        dword ptr [r9 + 0x78], ebx
01521 81e3feff1f00                   and        ebx, 0x1ffffe
01527 85db                           test       ebx, ebx
01529 0f8460340000                   je         0x7f56a8152f8f
0152f 49b9a0bd6d9c567f0000           movabs     r9, 0x7f569c6dbda0
01539 498381c000000001               add        qword ptr [r9 + 0xc0], 1
01541 49b870b26d9c567f0000           movabs     r8, 0x7f569c6db270
0154b 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
0154f 4183c102                       add        r9d, 2
01553 45894878                       mov        dword ptr [r8 + 0x78], r9d
01557 4181e1feff1f00                 and        r9d, 0x1ffffe
0155e 4585c9                         test       r9d, r9d
01561 0f8449340000                   je         0x7f56a8152fb0
01567 49b8c0067ae200000000           movabs     r8, 0xe27a06c0
01571 4d8bc8                         mov        r9, r8
01574 48bba0bd6d9c567f0000           movabs     rbx, 0x7f569c6dbda0
0157e 458b09                         mov        r9d, dword ptr [r9]
01581 41c1e90d                       shr        r9d, 0xd
01585 49c1e10a                       shl        r9, 0xa
01589 41ba000000ad                   mov        r10d, 0xad000000
0158f 4d03ca                         add        r9, r10
01592 41ba1d000000                   mov        r10d, 0x1d
01598 4e3b0cd3                       cmp        r9, qword ptr [rbx + r10*8]
0159c 7436                           je         0x7f56a814fbd4
0159e 4983c202                       add        r10, 2
015a2 4983fa21                       cmp        r10, 0x21
015a6 75f0                           jne        0x7f56a814fb98
015a8 41ba1d000000                   mov        r10d, 0x1d
015ae 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
015b3 7412                           je         0x7f56a814fbc7
015b5 4983c202                       add        r10, 2
015b9 4983fa21                       cmp        r10, 0x21
015bd 75ef                           jne        0x7f56a814fbae
015bf 41ba1c000000                   mov        r10d, 0x1c
015c5 eb11                           jmp        0x7f56a814fbd8
015c7 50                             push       rax
015c8 4833c0                         xor        rax, rax
015cb f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
015d1 58                             pop        rax
015d2 ebbe                           jmp        0x7f56a814fb92
015d4 4983c201                       add        r10, 1
015d8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
015dd 49b9a0bd6d9c567f0000           movabs     r9, 0x7f569c6dbda0
015e7 458b00                         mov        r8d, dword ptr [r8]
015ea 41c1e80d                       shr        r8d, 0xd
015ee 49c1e00a                       shl        r8, 0xa
015f2 41ba000000ad                   mov        r10d, 0xad000000
015f8 4d03c2                         add        r8, r10
015fb 41ba23000000                   mov        r10d, 0x23
01601 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
01605 7436                           je         0x7f56a814fc3d
01607 4983c202                       add        r10, 2
0160b 4983fa27                       cmp        r10, 0x27
0160f 75f0                           jne        0x7f56a814fc01
01611 41ba23000000                   mov        r10d, 0x23
01617 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
0161c 7412                           je         0x7f56a814fc30
0161e 4983c202                       add        r10, 2
01622 4983fa27                       cmp        r10, 0x27
01626 75ef                           jne        0x7f56a814fc17
01628 41ba22000000                   mov        r10d, 0x22
0162e eb11                           jmp        0x7f56a814fc41
01630 50                             push       rax
01631 4833c0                         xor        rax, rax
01634 f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
0163a 58                             pop        rax
0163b ebbe                           jmp        0x7f56a814fbfb
0163d 4983c201                       add        r10, 1
01641 4b8304d101                     add        qword ptr [r9 + r10*8], 1
01646 49b8a0bd6d9c567f0000           movabs     r8, 0x7f569c6dbda0
01650 4983804001000001               add        qword ptr [r8 + 0x140], 1
01658 49b838b36d9c567f0000           movabs     r8, 0x7f569c6db338
01662 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
01666 4183c102                       add        r9d, 2
0166a 45894878                       mov        dword ptr [r8 + 0x78], r9d
0166e 4181e1feff1f00                 and        r9d, 0x1ffffe
01675 4585c9                         test       r9d, r9d
01678 0f8453330000                   je         0x7f56a8152fd1
0167e 49b8a0bd6d9c567f0000           movabs     r8, 0x7f569c6dbda0
01688 4983805001000001               add        qword ptr [r8 + 0x150], 1
01690 4863d9                         movsxd     rbx, ecx
01693 b908000000                     mov        ecx, 8
01698 4c8bcb                         mov        r9, rbx
0169b 4c03c9                         add        r9, rcx
0169e 48b9c0a46d9c567f0000           movabs     rcx, 0x7f569c6da4c0
016a8 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
016ac 4183c002                       add        r8d, 2
016b0 44894178                       mov        dword ptr [rcx + 0x78], r8d
016b4 4181e0feff1f00                 and        r8d, 0x1ffffe
016bb 4585c0                         test       r8d, r8d
016be 0f842e330000                   je         0x7f56a8152ff2
016c4 48b9c0a46d9c567f0000           movabs     rcx, 0x7f569c6da4c0
016ce 488381e000000001               add        qword ptr [rcx + 0xe0], 1
016d6 48b940a66d9c567f0000           movabs     rcx, 0x7f569c6da640
016e0 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
016e4 4183c002                       add        r8d, 2
016e8 44894178                       mov        dword ptr [rcx + 0x78], r8d
016ec 4181e0feff1f00                 and        r8d, 0x1ffffe
016f3 4585c0                         test       r8d, r8d
016f6 0f8417330000                   je         0x7f56a8153013
016fc 48b9a0bd6d9c567f0000           movabs     rcx, 0x7f569c6dbda0
01706 4883817001000001               add        qword ptr [rcx + 0x170], 1
0170e 48b988df7ae200000000           movabs     rcx, 0xe27adf88
01718 48be08077ae200000000           movabs     rsi, 0xe27a0708
01722 4c8bc2                         mov        r8, rdx
01725 ba02000000                     mov        edx, 2
0172a b910000000                     mov        ecx, 0x10
0172f 498bc0                         mov        rax, r8
01732 4c8bc0                         mov        r8, rax
01735 bf00000000                     mov        edi, 0
0173a 48890424                       mov        qword ptr [rsp], rax
0173e 48895c2408                     mov        qword ptr [rsp + 8], rbx
01743 49bac0067ae200000000           movabs     r10, 0xe27a06c0
0174d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01752 49ba88df7ae200000000           movabs     r10, 0xe27adf88
0175c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01761 90                             nop        
01762 90                             nop        
01763 90                             nop        
01764 90                             nop        
01765 90                             nop        
01766 90                             nop        
01767 e8f4fe5d07                     call       0x7f56af72fc60
0176c 0f1f840064180006               nop        dword ptr [rax + rax + 0x6001864]
01774 4885c0                         test       rax, rax
01777 48bba0bd6d9c567f0000           movabs     rbx, 0x7f569c6dbda0
01781 750c                           jne        0x7f56a814fd8f
01783 808b7901000001                 or         byte ptr [rbx + 0x179], 1
0178a e988000000                     jmp        0x7f56a814fe17
0178f 8b38                           mov        edi, dword ptr [rax]
01791 c1ef0d                         shr        edi, 0xd
01794 48c1e70a                       shl        rdi, 0xa
01798 41ba000000ad                   mov        r10d, 0xad000000
0179e 4903fa                         add        rdi, r10
017a1 41ba31000000                   mov        r10d, 0x31
017a7 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
017ab 7436                           je         0x7f56a814fde3
017ad 4983c202                       add        r10, 2
017b1 4983fa35                       cmp        r10, 0x35
017b5 75f0                           jne        0x7f56a814fda7
017b7 41ba31000000                   mov        r10d, 0x31
017bd 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
017c2 7412                           je         0x7f56a814fdd6
017c4 4983c202                       add        r10, 2
017c8 4983fa35                       cmp        r10, 0x35
017cc 75ef                           jne        0x7f56a814fdbd
017ce 41ba30000000                   mov        r10d, 0x30
017d4 eb11                           jmp        0x7f56a814fde7
017d6 50                             push       rax
017d7 4833c0                         xor        rax, rax
017da f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
017e0 58                             pop        rax
017e1 ebbe                           jmp        0x7f56a814fda1
017e3 4983c201                       add        r10, 1
017e7 4a8304d301                     add        qword ptr [rbx + r10*8], 1
017ec 48bf00b414ad00000000           movabs     rdi, 0xad14b400
017f6 8b18                           mov        ebx, dword ptr [rax]
017f8 c1eb0d                         shr        ebx, 0xd
017fb 48c1e30a                       shl        rbx, 0xa
017ff 41ba000000ad                   mov        r10d, 0xad000000
01805 4903da                         add        rbx, r10
01808 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
0180c 0f8522320000                   jne        0x7f56a8153034
01812 e900000000                     jmp        0x7f56a814fe17
01817 488bf8                         mov        rdi, rax
0181a 4889bc24c8010000               mov        qword ptr [rsp + 0x1c8], rdi
01822 483b07                         cmp        rax, qword ptr [rdi]
01825 488bf7                         mov        rsi, rdi
01828 48bb00c0639c567f0000           movabs     rbx, 0x7f569c63c000
01832 8b36                           mov        esi, dword ptr [rsi]
01834 c1ee0d                         shr        esi, 0xd
01837 48c1e60a                       shl        rsi, 0xa
0183b 41ba000000ad                   mov        r10d, 0xad000000
01841 4903f2                         add        rsi, r10
01844 41baa4000000                   mov        r10d, 0xa4
0184a 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
0184e 743c                           je         0x7f56a814fe8c
01850 4983c202                       add        r10, 2
01854 4981faa8000000                 cmp        r10, 0xa8
0185b 75ed                           jne        0x7f56a814fe4a
0185d 41baa4000000                   mov        r10d, 0xa4
01863 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01868 7415                           je         0x7f56a814fe7f
0186a 4983c202                       add        r10, 2
0186e 4981faa8000000                 cmp        r10, 0xa8
01875 75ec                           jne        0x7f56a814fe63
01877 41baa3000000                   mov        r10d, 0xa3
0187d eb11                           jmp        0x7f56a814fe90
0187f 50                             push       rax
01880 4833c0                         xor        rax, rax
01883 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01889 58                             pop        rax
0188a ebb8                           jmp        0x7f56a814fe44
0188c 4983c201                       add        r10, 1
01890 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01895 48bef0c76d9c567f0000           movabs     rsi, 0x7f569c6dc7f0
0189f 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
018a2 83c302                         add        ebx, 2
018a5 895e78                         mov        dword ptr [rsi + 0x78], ebx
018a8 81e3feff1f00                   and        ebx, 0x1ffffe
018ae 85db                           test       ebx, ebx
018b0 0f84b4310000                   je         0x7f56a815306a
018b6 488bf7                         mov        rsi, rdi
018b9 48bbf0c76d9c567f0000           movabs     rbx, 0x7f569c6dc7f0
018c3 8b36                           mov        esi, dword ptr [rsi]
018c5 c1ee0d                         shr        esi, 0xd
018c8 48c1e60a                       shl        rsi, 0xa
018cc 41ba000000ad                   mov        r10d, 0xad000000
018d2 4903f2                         add        rsi, r10
018d5 41ba17000000                   mov        r10d, 0x17
018db 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
018df 7436                           je         0x7f56a814ff17
018e1 4983c202                       add        r10, 2
018e5 4983fa1b                       cmp        r10, 0x1b
018e9 75f0                           jne        0x7f56a814fedb
018eb 41ba17000000                   mov        r10d, 0x17
018f1 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
018f6 7412                           je         0x7f56a814ff0a
018f8 4983c202                       add        r10, 2
018fc 4983fa1b                       cmp        r10, 0x1b
01900 75ef                           jne        0x7f56a814fef1
01902 41ba16000000                   mov        r10d, 0x16
01908 eb11                           jmp        0x7f56a814ff1b
0190a 50                             push       rax
0190b 4833c0                         xor        rax, rax
0190e f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01914 58                             pop        rax
01915 ebbe                           jmp        0x7f56a814fed5
01917 4983c201                       add        r10, 1
0191b 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01920 488bf7                         mov        rsi, rdi
01923 90                             nop        
01924 90                             nop        
01925 48b8908c687c567f0000           movabs     rax, 0x7f567c688c90
0192f e82cf85d07                     call       0x7f56af72f760
01934 0f1f84002c1a0007               nop        dword ptr [rax + rax + 0x7001a2c]
0193c 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
01944 8b7704                         mov        esi, dword ptr [rdi + 4]
01947 48bbf0c76d9c567f0000           movabs     rbx, 0x7f569c6dc7f0
01951 488383e000000001               add        qword ptr [rbx + 0xe0], 1
01959 48bbf0b06d9c567f0000           movabs     rbx, 0x7f569c6db0f0
01963 8b5378                         mov        edx, dword ptr [rbx + 0x78]
01966 83c202                         add        edx, 2
01969 895378                         mov        dword ptr [rbx + 0x78], edx
0196c 81e2feff1f00                   and        edx, 0x1ffffe
01972 85d2                           test       edx, edx
01974 0f842a310000                   je         0x7f56a81530a4
0197a 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01982 48bbf0b06d9c567f0000           movabs     rbx, 0x7f569c6db0f0
0198c 4883831001000001               add        qword ptr [rbx + 0x110], 1
01994 ffc8                           dec        eax
01996 2bf0                           sub        esi, eax
01998 48bb80a76d9c567f0000           movabs     rbx, 0x7f569c6da780
019a2 8b4378                         mov        eax, dword ptr [rbx + 0x78]
019a5 83c002                         add        eax, 2
019a8 894378                         mov        dword ptr [rbx + 0x78], eax
019ab 25feff1f00                     and        eax, 0x1ffffe
019b0 85c0                           test       eax, eax
019b2 0f840d310000                   je         0x7f56a81530c5
019b8 48bb80a76d9c567f0000           movabs     rbx, 0x7f569c6da780
019c2 488383b000000001               add        qword ptr [rbx + 0xb0], 1
019ca 48bb0000000000000000           movabs     rbx, 0
019d4 bb00000000                     mov        ebx, 0
019d9 443bdb                         cmp        r11d, ebx
019dc 0f8c04310000                   jl         0x7f56a81530e6
019e2 443bde                         cmp        r11d, esi
019e5 0f8d1c310000                   jge        0x7f56a8153107
019eb 498bdb                         mov        rbx, r11
019ee 899c24c4010000                 mov        dword ptr [rsp + 0x1c4], ebx
019f5 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
019fd 488bbc24c8010000               mov        rdi, qword ptr [rsp + 0x1c8]
01a05 488bf7                         mov        rsi, rdi
01a08 48baf0c76d9c567f0000           movabs     rdx, 0x7f569c6dc7f0
01a12 8b36                           mov        esi, dword ptr [rsi]
01a14 c1ee0d                         shr        esi, 0xd
01a17 48c1e60a                       shl        rsi, 0xa
01a1b 41ba000000ad                   mov        r10d, 0xad000000
01a21 4903f2                         add        rsi, r10
01a24 41ba1f000000                   mov        r10d, 0x1f
01a2a 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01a2e 7436                           je         0x7f56a8150066
01a30 4983c202                       add        r10, 2
01a34 4983fa23                       cmp        r10, 0x23
01a38 75f0                           jne        0x7f56a815002a
01a3a 41ba1f000000                   mov        r10d, 0x1f
01a40 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01a45 7412                           je         0x7f56a8150059
01a47 4983c202                       add        r10, 2
01a4b 4983fa23                       cmp        r10, 0x23
01a4f 75ef                           jne        0x7f56a8150040
01a51 41ba1e000000                   mov        r10d, 0x1e
01a57 eb11                           jmp        0x7f56a815006a
01a59 50                             push       rax
01a5a 4833c0                         xor        rax, rax
01a5d f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01a63 58                             pop        rax
01a64 ebbe                           jmp        0x7f56a8150024
01a66 4983c201                       add        r10, 1
01a6a 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01a6f 488bf7                         mov        rsi, rdi
01a72 90                             nop        
01a73 90                             nop        
01a74 90                             nop        
01a75 48b8b88c687c567f0000           movabs     rax, 0x7f567c688cb8
01a7f e8dcf65d07                     call       0x7f56af72f760
01a84 0f1f84007c1b0008               nop        dword ptr [rax + rax + 0x8001b7c]
01a8c 483b00                         cmp        rax, qword ptr [rax]
01a8f 488bf0                         mov        rsi, rax
01a92 48baf0c76d9c567f0000           movabs     rdx, 0x7f569c6dc7f0
01a9c 8b36                           mov        esi, dword ptr [rsi]
01a9e c1ee0d                         shr        esi, 0xd
01aa1 48c1e60a                       shl        rsi, 0xa
01aa5 41ba000000ad                   mov        r10d, 0xad000000
01aab 4903f2                         add        rsi, r10
01aae 41ba25000000                   mov        r10d, 0x25
01ab4 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01ab8 7436                           je         0x7f56a81500f0
01aba 4983c202                       add        r10, 2
01abe 4983fa29                       cmp        r10, 0x29
01ac2 75f0                           jne        0x7f56a81500b4
01ac4 41ba25000000                   mov        r10d, 0x25
01aca 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01acf 7412                           je         0x7f56a81500e3
01ad1 4983c202                       add        r10, 2
01ad5 4983fa29                       cmp        r10, 0x29
01ad9 75ef                           jne        0x7f56a81500ca
01adb 41ba24000000                   mov        r10d, 0x24
01ae1 eb11                           jmp        0x7f56a81500f4
01ae3 50                             push       rax
01ae4 4833c0                         xor        rax, rax
01ae7 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01aed 58                             pop        rax
01aee ebbe                           jmp        0x7f56a81500ae
01af0 4983c201                       add        r10, 1
01af4 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01af9 8b7024                         mov        esi, dword ptr [rax + 0x24]
01afc 4c3b25151c3020                 cmp        r12, qword ptr [rip + 0x20301c15]
01b03 0f8414000000                   je         0x7f56a815011d
01b09 48bf384352c6567f0000           movabs     rdi, 0x7f56c6524338
01b13 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b17 e8c4036d1f                     call       0x7f56c78204e0
01b1c f4                             hlt        
01b1d 488bd0                         mov        rdx, rax
01b20 48b9f0c76d9c567f0000           movabs     rcx, 0x7f569c6dc7f0
01b2a 8b12                           mov        edx, dword ptr [rdx]
01b2c c1ea0d                         shr        edx, 0xd
01b2f 48c1e20a                       shl        rdx, 0xa
01b33 41ba000000ad                   mov        r10d, 0xad000000
01b39 4903d2                         add        rdx, r10
01b3c 41ba2b000000                   mov        r10d, 0x2b
01b42 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01b46 7436                           je         0x7f56a815017e
01b48 4983c202                       add        r10, 2
01b4c 4983fa2f                       cmp        r10, 0x2f
01b50 75f0                           jne        0x7f56a8150142
01b52 41ba2b000000                   mov        r10d, 0x2b
01b58 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01b5d 7412                           je         0x7f56a8150171
01b5f 4983c202                       add        r10, 2
01b63 4983fa2f                       cmp        r10, 0x2f
01b67 75ef                           jne        0x7f56a8150158
01b69 41ba2a000000                   mov        r10d, 0x2a
01b6f eb11                           jmp        0x7f56a8150182
01b71 50                             push       rax
01b72 4833c0                         xor        rax, rax
01b75 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
01b7b 58                             pop        rax
01b7c ebbe                           jmp        0x7f56a815013c
01b7e 4983c201                       add        r10, 1
01b82 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01b87 8b4804                         mov        ecx, dword ptr [rax + 4]
01b8a 48baf0c76d9c567f0000           movabs     rdx, 0x7f569c6dc7f0
01b94 4883828001000001               add        qword ptr [rdx + 0x180], 1
01b9c 48ba38b36d9c567f0000           movabs     rdx, 0x7f569c6db338
01ba6 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01baa 4183c002                       add        r8d, 2
01bae 44894278                       mov        dword ptr [rdx + 0x78], r8d
01bb2 4181e0feff1f00                 and        r8d, 0x1ffffe
01bb9 4585c0                         test       r8d, r8d
01bbc 0f847f2f0000                   je         0x7f56a8153141
01bc2 48baf0c76d9c567f0000           movabs     rdx, 0x7f569c6dc7f0
01bcc 4883829001000001               add        qword ptr [rdx + 0x190], 1
01bd4 8b9c24c4010000                 mov        ebx, dword ptr [rsp + 0x1c4]
01bdb 4863db                         movsxd     rbx, ebx
01bde ba08000000                     mov        edx, 8
01be3 4c8bcb                         mov        r9, rbx
01be6 4c03ca                         add        r9, rdx
01be9 48bac0a46d9c567f0000           movabs     rdx, 0x7f569c6da4c0
01bf3 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01bf7 4183c002                       add        r8d, 2
01bfb 44894278                       mov        dword ptr [rdx + 0x78], r8d
01bff 4181e0feff1f00                 and        r8d, 0x1ffffe
01c06 4585c0                         test       r8d, r8d
01c09 0f84532f0000                   je         0x7f56a8153162
01c0f 48bac0a46d9c567f0000           movabs     rdx, 0x7f569c6da4c0
01c19 488382e000000001               add        qword ptr [rdx + 0xe0], 1
01c21 48ba40a66d9c567f0000           movabs     rdx, 0x7f569c6da640
01c2b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01c2f 4183c002                       add        r8d, 2
01c33 44894278                       mov        dword ptr [rdx + 0x78], r8d
01c37 4181e0feff1f00                 and        r8d, 0x1ffffe
01c3e 4585c0                         test       r8d, r8d
01c41 0f843c2f0000                   je         0x7f56a8153183
01c47 48baf0c76d9c567f0000           movabs     rdx, 0x7f569c6dc7f0
01c51 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
01c59 48ba707d7be200000000           movabs     rdx, 0xe27b7d70
01c63 ba02000000                     mov        edx, 2
01c68 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
01c70 bf00000000                     mov        edi, 0
01c75 488b8424c8010000               mov        rax, qword ptr [rsp + 0x1c8]
01c7d 48890424                       mov        qword ptr [rsp], rax
01c81 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
01c89 4889442408                     mov        qword ptr [rsp + 8], rax
01c8e 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01c93 49ba707d7be200000000           movabs     r10, 0xe27b7d70
01c9d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ca2 90                             nop        
01ca3 90                             nop        
01ca4 90                             nop        
01ca5 90                             nop        
01ca6 90                             nop        
01ca7 e8b4f95d07                     call       0x7f56af72fc60
01cac 0f1f8400a41d0009               nop        dword ptr [rax + rax + 0x9001da4]
01cb4 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01cbc 4183c310                       add        r11d, 0x10
01cc0 8bb424c0010000                 mov        esi, dword ptr [rsp + 0x1c0]
01cc7 83c610                         add        esi, 0x10
01cca 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01cd2 ba02000000                     mov        edx, 2
01cd7 7c05                           jl         0x7f56a81502de
01cd9 ba00000000                     mov        edx, 0
01cde 48b900c0639c567f0000           movabs     rcx, 0x7f569c63c000
01ce8 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
01cec 4403c2                         add        r8d, edx
01cef 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
01cf3 85d2                           test       edx, edx
01cf5 7506                           jne        0x7f56a81502fd
01cf7 41b802000000                   mov        r8d, 2
01cfd 4181e0fe3f0000                 and        r8d, 0x3ffe
01d04 4585c0                         test       r8d, r8d
01d07 0f84972e0000                   je         0x7f56a81531a4
01d0d 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01d11 418502                         test       dword ptr [r10], eax
01d14 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01d1c 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
01d26 b948050000                     mov        ecx, 0x548
01d2b 7c05                           jl         0x7f56a8150332
01d2d b958050000                     mov        ecx, 0x558
01d32 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01d36 4d8d4001                       lea        r8, [r8 + 1]
01d3a 4c89040a                       mov        qword ptr [rdx + rcx], r8
01d3e 0f8c0cf5ffff                   jl         0x7f56a814f850
01d44 48be00c0639c567f0000           movabs     rsi, 0x7f569c63c000
01d4e ff8668050000                   inc        dword ptr [rsi + 0x568]
01d54 e9f0000000                     jmp        0x7f56a8150449
01d59 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
01d63 4883828005000001               add        qword ptr [rdx + 0x580], 1
01d6b 488bb42468010000               mov        rsi, qword ptr [rsp + 0x168]
01d73 8b942490010000                 mov        edx, dword ptr [rsp + 0x190]
01d7a 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
01d82 448b842474010000               mov        r8d, dword ptr [rsp + 0x174]
01d8a 4c8bcf                         mov        r9, rdi
01d8d 4885c9                         test       rcx, rcx
01d90 0f842f2e0000                   je         0x7f56a81531c5
01d96 85d2                           test       edx, edx
01d98 0f8c272e0000                   jl         0x7f56a81531c5
01d9e 4585c0                         test       r8d, r8d
01da1 0f8c1e2e0000                   jl         0x7f56a81531c5
01da7 4a8d3c0a                       lea        rdi, [rdx + r9]
01dab 3b7e04                         cmp        edi, dword ptr [rsi + 4]
01dae 0f87112e0000                   ja         0x7f56a81531c5
01db4 4b8d3c08                       lea        rdi, [r8 + r9]
01db8 3b7904                         cmp        edi, dword ptr [rcx + 4]
01dbb 0f87042e0000                   ja         0x7f56a81531c5
01dc1 4585c9                         test       r9d, r9d
01dc4 0f8cfb2d0000                   jl         0x7f56a81531c5
01dca 4863d2                         movsxd     rdx, edx
01dcd 4d63c0                         movsxd     r8, r8d
01dd0 48bf001404ad00000000           movabs     rdi, 0xad041400
01dda 41ba000000ad                   mov        r10d, 0xad000000
01de0 492bfa                         sub        rdi, r10
01de3 48c1ef0a                       shr        rdi, 0xa
01de7 448b19                         mov        r11d, dword ptr [rcx]
01dea 41c1eb0d                       shr        r11d, 0xd
01dee 413bfb                         cmp        edi, r11d
01df1 0f8510000000                   jne        0x7f56a8150407
01df7 448b1e                         mov        r11d, dword ptr [rsi]
01dfa 41c1eb0d                       shr        r11d, 0xd
01dfe 413bfb                         cmp        edi, r11d
01e01 0f8414000000                   je         0x7f56a815041b
01e07 48bf88b54bc6567f0000           movabs     rdi, 0x7f56c64bb588
01e11 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e15 e8c6006d1f                     call       0x7f56c78204e0
01e1a f4                             hlt        
01e1b 488d7c1608                     lea        rdi, [rsi + rdx + 8]
01e20 4a8d740108                     lea        rsi, [rcx + r8 + 8]
01e25 498bd1                         mov        rdx, r9
01e28 40f6c40f                       test       spl, 0xf
01e2c 0f8412000000                   je         0x7f56a8150444
01e32 4883ec08                       sub        rsp, 8
01e36 e8058d5c07                     call       0x7f56af719140
01e3b 4883c408                       add        rsp, 8
01e3f e905000000                     jmp        0x7f56a8150449
01e44 e8f78c5c07                     call       0x7f56af719140
01e49 8bb424a4010000                 mov        esi, dword ptr [rsp + 0x1a4]
01e50 8b9c24a0010000                 mov        ebx, dword ptr [rsp + 0x1a0]
01e57 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
01e5f 488bfb                         mov        rdi, rbx
01e62 2bbc24a8010000                 sub        edi, dword ptr [rsp + 0x1a8]
01e69 4183f810                       cmp        r8d, 0x10
01e6d 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
01e77 b990050000                     mov        ecx, 0x590
01e7c 7f05                           jg         0x7f56a8150483
01e7e b9a0050000                     mov        ecx, 0x5a0
01e83 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
01e87 4d8d4901                       lea        r9, [r9 + 1]
01e8b 4c890c0a                       mov        qword ptr [rdx + rcx], r9
01e8f 448b8c24a8010000               mov        r9d, dword ptr [rsp + 0x1a8]
01e97 0f8f2c000000                   jg         0x7f56a81504c9
01e9d 4183f910                       cmp        r9d, 0x10
01ea1 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
01eab b9c0050000                     mov        ecx, 0x5c0
01eb0 7d05                           jge        0x7f56a81504b7
01eb2 b9b0050000                     mov        ecx, 0x5b0
01eb7 488b040a                       mov        rax, qword ptr [rdx + rcx]
01ebb 488d4001                       lea        rax, [rax + 1]
01ebf 4889040a                       mov        qword ptr [rdx + rcx], rax
01ec3 0f8d23160000                   jge        0x7f56a8151aec
01ec9 453bc8                         cmp        r9d, r8d
01ecc 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
01ed6 b928060000                     mov        ecx, 0x628
01edb 7c05                           jl         0x7f56a81504e2
01edd b938060000                     mov        ecx, 0x638
01ee2 488b040a                       mov        rax, qword ptr [rdx + rcx]
01ee6 488d4001                       lea        rax, [rax + 1]
01eea 4889040a                       mov        qword ptr [rdx + rcx], rax
01eee 0f8cd9050000                   jl         0x7f56a8150acd
01ef4 4183f830                       cmp        r8d, 0x30
01ef8 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
01f02 b948060000                     mov        ecx, 0x648
01f07 7e05                           jle        0x7f56a815050e
01f09 b958060000                     mov        ecx, 0x658
01f0e 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
01f12 4d8d4901                       lea        r9, [r9 + 1]
01f16 4c890c0a                       mov        qword ptr [rdx + rcx], r9
01f1a 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
01f21 0f8e0f010000                   jle        0x7f56a8150636
01f27 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
01f31 4883826806000001               add        qword ptr [rdx + 0x668], 1
01f39 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
01f41 488bd7                         mov        rdx, rdi
01f44 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
01f4c 498bf8                         mov        rdi, r8
01f4f 4c8bc3                         mov        r8, rbx
01f52 4c8bcf                         mov        r9, rdi
01f55 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
01f5c 4885f6                         test       rsi, rsi
01f5f 0f846c2c0000                   je         0x7f56a81531d1
01f65 4885c9                         test       rcx, rcx
01f68 0f84632c0000                   je         0x7f56a81531d1
01f6e 85d2                           test       edx, edx
01f70 0f8c5b2c0000                   jl         0x7f56a81531d1
01f76 4585c0                         test       r8d, r8d
01f79 0f8c522c0000                   jl         0x7f56a81531d1
01f7f 4a8d3c0a                       lea        rdi, [rdx + r9]
01f83 3b7e04                         cmp        edi, dword ptr [rsi + 4]
01f86 0f87452c0000                   ja         0x7f56a81531d1
01f8c 4b8d3c08                       lea        rdi, [r8 + r9]
01f90 3b7904                         cmp        edi, dword ptr [rcx + 4]
01f93 0f87382c0000                   ja         0x7f56a81531d1
01f99 4585c9                         test       r9d, r9d
01f9c 0f8c2f2c0000                   jl         0x7f56a81531d1
01fa2 4863d2                         movsxd     rdx, edx
01fa5 4d63c0                         movsxd     r8, r8d
01fa8 48bf001404ad00000000           movabs     rdi, 0xad041400
01fb2 41ba000000ad                   mov        r10d, 0xad000000
01fb8 492bfa                         sub        rdi, r10
01fbb 48c1ef0a                       shr        rdi, 0xa
01fbf 448b19                         mov        r11d, dword ptr [rcx]
01fc2 41c1eb0d                       shr        r11d, 0xd
01fc6 413bfb                         cmp        edi, r11d
01fc9 0f8510000000                   jne        0x7f56a81505df
01fcf 448b1e                         mov        r11d, dword ptr [rsi]
01fd2 41c1eb0d                       shr        r11d, 0xd
01fd6 413bfb                         cmp        edi, r11d
01fd9 0f8414000000                   je         0x7f56a81505f3
01fdf 48bf88b54bc6567f0000           movabs     rdi, 0x7f56c64bb588
01fe9 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fed e8eefe6c1f                     call       0x7f56c78204e0
01ff2 f4                             hlt        
01ff3 488d7c1608                     lea        rdi, [rsi + rdx + 8]
01ff8 4a8d740108                     lea        rsi, [rcx + r8 + 8]
01ffd 498bd1                         mov        rdx, r9
02000 40f6c40f                       test       spl, 0xf
02004 0f8412000000                   je         0x7f56a815061c
0200a 4883ec08                       sub        rsp, 8
0200e e82d8b5c07                     call       0x7f56af719140
02013 4883c408                       add        rsp, 8
02017 e905000000                     jmp        0x7f56a8150621
0201c e81f8b5c07                     call       0x7f56af719140
02021 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
0202b ff8278060000                   inc        dword ptr [rdx + 0x678]
02031 e974040000                     jmp        0x7f56a8150aaa
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
0206f 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
02079 4883829006000001               add        qword ptr [rdx + 0x690], 1
02081 48ba206a10ad00000000           movabs     rdx, 0xad106a20
0208b 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0208e 83c102                         add        ecx, 2
02091 894a78                         mov        dword ptr [rdx + 0x78], ecx
02094 81e1feff1f00                   and        ecx, 0x1ffffe
0209a 85c9                           test       ecx, ecx
0209c 0f843f2b0000                   je         0x7f56a81531e1
020a2 48ba206a10ad00000000           movabs     rdx, 0xad106a20
020ac 488d92e0000000                 lea        rdx, [rdx + 0xe0]
020b3 4885c0                         test       rax, rax
020b6 7510                           jne        0x7f56a81506c8
020b8 f6420801                       test       byte ptr [rdx + 8], 1
020bc 0f8506000000                   jne        0x7f56a81506c8
020c2 f048834a0801                   lock or    qword ptr [rdx + 8], 1
020c8 48ba407e739c567f0000           movabs     rdx, 0x7f569c737e40
020d2 488d9248030000                 lea        rdx, [rdx + 0x348]
020d9 4885c0                         test       rax, rax
020dc 7510                           jne        0x7f56a81506ee
020de f6421001                       test       byte ptr [rdx + 0x10], 1
020e2 0f8506000000                   jne        0x7f56a81506ee
020e8 f048834a1001                   lock or    qword ptr [rdx + 0x10], 1
020ee 48ba206a10ad00000000           movabs     rdx, 0xad106a20
020f8 488382b000000001               add        qword ptr [rdx + 0xb0], 1
02100 48ba407e739c567f0000           movabs     rdx, 0x7f569c737e40
0210a 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0210d 83c102                         add        ecx, 2
02110 894a78                         mov        dword ptr [rdx + 0x78], ecx
02113 81e1feff1f00                   and        ecx, 0x1ffffe
02119 85c9                           test       ecx, ecx
0211b 0f84e12a0000                   je         0x7f56a8153202
02121 48baa0df72e200000000           movabs     rdx, 0xe272dfa0
0212b 48b9407e739c567f0000           movabs     rcx, 0x7f569c737e40
02135 8b12                           mov        edx, dword ptr [rdx]
02137 c1ea0d                         shr        edx, 0xd
0213a 48c1e20a                       shl        rdx, 0xa
0213e 41ba000000ad                   mov        r10d, 0xad000000
02144 4903d2                         add        rdx, r10
02147 41ba17000000                   mov        r10d, 0x17
0214d 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02151 7436                           je         0x7f56a8150789
02153 4983c202                       add        r10, 2
02157 4983fa1b                       cmp        r10, 0x1b
0215b 75f0                           jne        0x7f56a815074d
0215d 41ba17000000                   mov        r10d, 0x17
02163 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02168 7412                           je         0x7f56a815077c
0216a 4983c202                       add        r10, 2
0216e 4983fa1b                       cmp        r10, 0x1b
02172 75ef                           jne        0x7f56a8150763
02174 41ba16000000                   mov        r10d, 0x16
0217a eb11                           jmp        0x7f56a815078d
0217c 50                             push       rax
0217d 4833c0                         xor        rax, rax
02180 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02186 58                             pop        rax
02187 ebbe                           jmp        0x7f56a8150747
02189 4983c201                       add        r10, 1
0218d 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02192 48ba9078739c567f0000           movabs     rdx, 0x7f569c737890
0219c 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0219f 83c102                         add        ecx, 2
021a2 894a78                         mov        dword ptr [rdx + 0x78], ecx
021a5 81e1feff1f00                   and        ecx, 0x1ffffe
021ab 85c9                           test       ecx, ecx
021ad 0f84702a0000                   je         0x7f56a8153223
021b3 48ba9078739c567f0000           movabs     rdx, 0x7f569c737890
021bd ff82b0000000                   inc        dword ptr [rdx + 0xb0]
021c3 48ba407e739c567f0000           movabs     rdx, 0x7f569c737e40
021cd ff8208010000                   inc        dword ptr [rdx + 0x108]
021d3 48ba407e739c567f0000           movabs     rdx, 0x7f569c737e40
021dd ff8228010000                   inc        dword ptr [rdx + 0x128]
021e3 48ba58d872e200000000           movabs     rdx, 0xe272d858
021ed 48b9407e739c567f0000           movabs     rcx, 0x7f569c737e40
021f7 8b12                           mov        edx, dword ptr [rdx]
021f9 c1ea0d                         shr        edx, 0xd
021fc 48c1e20a                       shl        rdx, 0xa
02200 41ba000000ad                   mov        r10d, 0xad000000
02206 4903d2                         add        rdx, r10
02209 41ba28000000                   mov        r10d, 0x28
0220f 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02213 7436                           je         0x7f56a815084b
02215 4983c202                       add        r10, 2
02219 4983fa2c                       cmp        r10, 0x2c
0221d 75f0                           jne        0x7f56a815080f
0221f 41ba28000000                   mov        r10d, 0x28
02225 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0222a 7412                           je         0x7f56a815083e
0222c 4983c202                       add        r10, 2
02230 4983fa2c                       cmp        r10, 0x2c
02234 75ef                           jne        0x7f56a8150825
02236 41ba27000000                   mov        r10d, 0x27
0223c eb11                           jmp        0x7f56a815084f
0223e 50                             push       rax
0223f 4833c0                         xor        rax, rax
02242 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02248 58                             pop        rax
02249 ebbe                           jmp        0x7f56a8150809
0224b 4983c201                       add        r10, 1
0224f 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02254 48bac07b739c567f0000           movabs     rdx, 0x7f569c737bc0
0225e 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02261 83c102                         add        ecx, 2
02264 894a78                         mov        dword ptr [rdx + 0x78], ecx
02267 81e1feff1f00                   and        ecx, 0x1ffffe
0226d 85c9                           test       ecx, ecx
0226f 0f84cf290000                   je         0x7f56a8153244
02275 48bac07b739c567f0000           movabs     rdx, 0x7f569c737bc0
0227f ff82b0000000                   inc        dword ptr [rdx + 0xb0]
02285 48ba407e739c567f0000           movabs     rdx, 0x7f569c737e40
0228f 488d9288010000                 lea        rdx, [rdx + 0x188]
02296 4885c0                         test       rax, rax
02299 7510                           jne        0x7f56a81508ab
0229b f6421801                       test       byte ptr [rdx + 0x18], 1
0229f 0f8506000000                   jne        0x7f56a81508ab
022a5 f048834a1801                   lock or    qword ptr [rdx + 0x18], 1
022ab 48ba407e739c567f0000           movabs     rdx, 0x7f569c737e40
022b5 4883827801000001               add        qword ptr [rdx + 0x178], 1
022bd 48baa081739c567f0000           movabs     rdx, 0x7f569c7381a0
022c7 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
022ca 83c102                         add        ecx, 2
022cd 894a78                         mov        dword ptr [rdx + 0x78], ecx
022d0 81e1feff1f00                   and        ecx, 0x1ffffe
022d6 85c9                           test       ecx, ecx
022d8 0f8487290000                   je         0x7f56a8153265
022de 48baa081739c567f0000           movabs     rdx, 0x7f569c7381a0
022e8 4883821001000001               add        qword ptr [rdx + 0x110], 1
022f0 48baa88a14ad00000000           movabs     rdx, 0xad148aa8
022fa 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
022fd 83c102                         add        ecx, 2
02300 894a78                         mov        dword ptr [rdx + 0x78], ecx
02303 81e1feff1f00                   and        ecx, 0x1ffffe
02309 85c9                           test       ecx, ecx
0230b 0f8475290000                   je         0x7f56a8153286
02311 8b5004                         mov        edx, dword ptr [rax + 4]
02314 48b9a88a14ad00000000           movabs     rcx, 0xad148aa8
0231e 488381b000000001               add        qword ptr [rcx + 0xb0], 1
02326 83ea07                         sub        edx, 7
02329 48b920fe22e200000000           movabs     rcx, 0xe222fe20
02333 b900000000                     mov        ecx, 0
02338 3bf9                           cmp        edi, ecx
0233a 0f8c80290000                   jl         0x7f56a81532c0
02340 3bfa                           cmp        edi, edx
02342 0f8d99290000                   jge        0x7f56a81532e1
02348 488bd7                         mov        rdx, rdi
0234b 48bef8a422e200000000           movabs     rsi, 0xe222a4f8
02355 488bce                         mov        rcx, rsi
02358 49b8a081739c567f0000           movabs     r8, 0x7f569c7381a0
02362 8b09                           mov        ecx, dword ptr [rcx]
02364 c1e90d                         shr        ecx, 0xd
02367 48c1e10a                       shl        rcx, 0xa
0236b 41ba000000ad                   mov        r10d, 0xad000000
02371 4903ca                         add        rcx, r10
02374 41ba25000000                   mov        r10d, 0x25
0237a 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0237e 7436                           je         0x7f56a81509b6
02380 4983c202                       add        r10, 2
02384 4983fa29                       cmp        r10, 0x29
02388 75f0                           jne        0x7f56a815097a
0238a 41ba25000000                   mov        r10d, 0x25
02390 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
02395 7412                           je         0x7f56a81509a9
02397 4983c202                       add        r10, 2
0239b 4983fa29                       cmp        r10, 0x29
0239f 75ef                           jne        0x7f56a8150990
023a1 41ba24000000                   mov        r10d, 0x24
023a7 eb11                           jmp        0x7f56a81509ba
023a9 50                             push       rax
023aa 4833c0                         xor        rax, rax
023ad f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
023b3 58                             pop        rax
023b4 ebbe                           jmp        0x7f56a8150974
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
023df e87ce85d07                     call       0x7f56af72f260
023e4 0f1f8400dc24000b               nop        dword ptr [rax + rax + 0xb0024dc]
023ec 48be00c0639c567f0000           movabs     rsi, 0x7f569c63c000
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
02417 e844f25d07                     call       0x7f56af72fc60
0241c 0f1f84001425000c               nop        dword ptr [rax + rax + 0xc002514]
02424 8b8424d8010000                 mov        eax, dword ptr [rsp + 0x1d8]
0242b 83c008                         add        eax, 8
0242e 8bbc24dc010000                 mov        edi, dword ptr [rsp + 0x1dc]
02435 83c708                         add        edi, 8
02438 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
0243f be02000000                     mov        esi, 2
02444 7c05                           jl         0x7f56a8150a4b
02446 be00000000                     mov        esi, 0
0244b 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
02455 8b4a7c                         mov        ecx, dword ptr [rdx + 0x7c]
02458 03ce                           add        ecx, esi
0245a 894a7c                         mov        dword ptr [rdx + 0x7c], ecx
0245d 85f6                           test       esi, esi
0245f 7505                           jne        0x7f56a8150a66
02461 b902000000                     mov        ecx, 2
02466 81e1fe3f0000                   and        ecx, 0x3ffe
0246c 85c9                           test       ecx, ecx
0246e 0f848e280000                   je         0x7f56a8153302
02474 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02478 418502                         test       dword ptr [r10], eax
0247b 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
02482 48be00c0639c567f0000           movabs     rsi, 0x7f569c63c000
0248c bab0060000                     mov        edx, 0x6b0
02491 7c05                           jl         0x7f56a8150a98
02493 bac0060000                     mov        edx, 0x6c0
02498 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0249c 488d4901                       lea        rcx, [rcx + 1]
024a0 48890c16                       mov        qword ptr [rsi + rdx], rcx
024a4 0f8cb6fbffff                   jl         0x7f56a8150660
024aa 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
024b1 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
024b8 48be00c0639c567f0000           movabs     rsi, 0x7f569c63c000
024c2 ff86d0060000                   inc        dword ptr [rsi + 0x6d0]
024c8 e9491a0000                     jmp        0x7f56a8152516
024cd 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
024d4 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
024db 4183f910                       cmp        r9d, 0x10
024df 48be00c0639c567f0000           movabs     rsi, 0x7f569c63c000
024e9 bae8060000                     mov        edx, 0x6e8
024ee 7c05                           jl         0x7f56a8150af5
024f0 baf8060000                     mov        edx, 0x6f8
024f5 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
024f9 488d4901                       lea        rcx, [rcx + 1]
024fd 48890c16                       mov        qword ptr [rsi + rdx], rcx
02501 0f8ced0a0000                   jl         0x7f56a81515f4
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
02537 48be00c0639c567f0000           movabs     rsi, 0x7f569c63c000
02541 4883860807000001               add        qword ptr [rsi + 0x708], 1
02549 48bee8ba6d9c567f0000           movabs     rsi, 0x7f569c6dbae8
02553 8b5678                         mov        edx, dword ptr [rsi + 0x78]
02556 83c202                         add        edx, 2
02559 895678                         mov        dword ptr [rsi + 0x78], edx
0255c 81e2feff1f00                   and        edx, 0x1ffffe
02562 85d2                           test       edx, edx
02564 0f84b9270000                   je         0x7f56a8153323
0256a 48bec0067ae200000000           movabs     rsi, 0xe27a06c0
02574 48bae8ba6d9c567f0000           movabs     rdx, 0x7f569c6dbae8
0257e 8b36                           mov        esi, dword ptr [rsi]
02580 c1ee0d                         shr        esi, 0xd
02583 48c1e60a                       shl        rsi, 0xa
02587 41ba000000ad                   mov        r10d, 0xad000000
0258d 4903f2                         add        rsi, r10
02590 41ba17000000                   mov        r10d, 0x17
02596 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
0259a 7436                           je         0x7f56a8150bd2
0259c 4983c202                       add        r10, 2
025a0 4983fa1b                       cmp        r10, 0x1b
025a4 75f0                           jne        0x7f56a8150b96
025a6 41ba17000000                   mov        r10d, 0x17
025ac 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
025b1 7412                           je         0x7f56a8150bc5
025b3 4983c202                       add        r10, 2
025b7 4983fa1b                       cmp        r10, 0x1b
025bb 75ef                           jne        0x7f56a8150bac
025bd 41ba16000000                   mov        r10d, 0x16
025c3 eb11                           jmp        0x7f56a8150bd6
025c5 50                             push       rax
025c6 4833c0                         xor        rax, rax
025c9 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
025cf 58                             pop        rax
025d0 ebbe                           jmp        0x7f56a8150b90
025d2 4983c201                       add        r10, 1
025d6 4a8304d201                     add        qword ptr [rdx + r10*8], 1
025db 448b6804                       mov        r13d, dword ptr [rax + 4]
025df 48bee8ba6d9c567f0000           movabs     rsi, 0x7f569c6dbae8
025e9 488386e000000001               add        qword ptr [rsi + 0xe0], 1
025f1 48bef0b06d9c567f0000           movabs     rsi, 0x7f569c6db0f0
025fb 8b5678                         mov        edx, dword ptr [rsi + 0x78]
025fe 83c202                         add        edx, 2
02601 895678                         mov        dword ptr [rsi + 0x78], edx
02604 81e2feff1f00                   and        edx, 0x1ffffe
0260a 85d2                           test       edx, edx
0260c 0f844b270000                   je         0x7f56a815335d
02612 48bef0b06d9c567f0000           movabs     rsi, 0x7f569c6db0f0
0261c 4883861001000001               add        qword ptr [rsi + 0x110], 1
02624 498bf5                         mov        rsi, r13
02627 83ee0f                         sub        esi, 0xf
0262a 48ba80a76d9c567f0000           movabs     rdx, 0x7f569c6da780
02634 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02637 83c102                         add        ecx, 2
0263a 894a78                         mov        dword ptr [rdx + 0x78], ecx
0263d 81e1feff1f00                   and        ecx, 0x1ffffe
02643 85c9                           test       ecx, ecx
02645 0f8433270000                   je         0x7f56a815337e
0264b 48ba80a76d9c567f0000           movabs     rdx, 0x7f569c6da780
02655 488382b000000001               add        qword ptr [rdx + 0xb0], 1
0265d 48ba0000000000000000           movabs     rdx, 0
02667 ba00000000                     mov        edx, 0
0266c 3bfa                           cmp        edi, edx
0266e 0f8c2b270000                   jl         0x7f56a815339f
02674 3bfe                           cmp        edi, esi
02676 0f8d44270000                   jge        0x7f56a81533c0
0267c 488bf7                         mov        rsi, rdi
0267f 48bac0067ae200000000           movabs     rdx, 0xe27a06c0
02689 488bca                         mov        rcx, rdx
0268c 49b8e8ba6d9c567f0000           movabs     r8, 0x7f569c6dbae8
02696 8b09                           mov        ecx, dword ptr [rcx]
02698 c1e90d                         shr        ecx, 0xd
0269b 48c1e10a                       shl        rcx, 0xa
0269f 41ba000000ad                   mov        r10d, 0xad000000
026a5 4903ca                         add        rcx, r10
026a8 41ba25000000                   mov        r10d, 0x25
026ae 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
026b2 7436                           je         0x7f56a8150cea
026b4 4983c202                       add        r10, 2
026b8 4983fa29                       cmp        r10, 0x29
026bc 75f0                           jne        0x7f56a8150cae
026be 41ba25000000                   mov        r10d, 0x25
026c4 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
026c9 7412                           je         0x7f56a8150cdd
026cb 4983c202                       add        r10, 2
026cf 4983fa29                       cmp        r10, 0x29
026d3 75ef                           jne        0x7f56a8150cc4
026d5 41ba24000000                   mov        r10d, 0x24
026db eb11                           jmp        0x7f56a8150cee
026dd 50                             push       rax
026de 4833c0                         xor        rax, rax
026e1 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
026e7 58                             pop        rax
026e8 ebbe                           jmp        0x7f56a8150ca8
026ea 4983c201                       add        r10, 1
026ee 4b8304d001                     add        qword ptr [r8 + r10*8], 1
026f3 48b988a86d9c567f0000           movabs     rcx, 0x7f569c6da888
026fd 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
02701 4183c002                       add        r8d, 2
02705 44894178                       mov        dword ptr [rcx + 0x78], r8d
02709 4181e0feff1f00                 and        r8d, 0x1ffffe
02710 4585c0                         test       r8d, r8d
02713 0f84c8260000                   je         0x7f56a81533e1
02719 48b988a86d9c567f0000           movabs     rcx, 0x7f569c6da888
02723 488381b000000001               add        qword ptr [rcx + 0xb0], 1
0272b 48bab8a96d9c567f0000           movabs     rdx, 0x7f569c6da9b8
02735 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02738 83c102                         add        ecx, 2
0273b 894a78                         mov        dword ptr [rdx + 0x78], ecx
0273e 81e1feff1f00                   and        ecx, 0x1ffffe
02744 85c9                           test       ecx, ecx
02746 0f84b6260000                   je         0x7f56a8153402
0274c 48bab8a96d9c567f0000           movabs     rdx, 0x7f569c6da9b8
02756 ff82c0000000                   inc        dword ptr [rdx + 0xc0]
0275c 4489ac24e8010000               mov        dword ptr [rsp + 0x1e8], r13d
02764 89bc24e4010000                 mov        dword ptr [rsp + 0x1e4], edi
0276b 48bab8867ae200000000           movabs     rdx, 0xe27a86b8
02775 488bca                         mov        rcx, rdx
02778 49b8e8ba6d9c567f0000           movabs     r8, 0x7f569c6dbae8
02782 4983806001000001               add        qword ptr [r8 + 0x160], 1
0278a 48b9b8bc6d9c567f0000           movabs     rcx, 0x7f569c6dbcb8
02794 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
02798 4183c002                       add        r8d, 2
0279c 44894178                       mov        dword ptr [rcx + 0x78], r8d
027a0 4181e0feff1f00                 and        r8d, 0x1ffffe
027a7 4585c0                         test       r8d, r8d
027aa 0f8473260000                   je         0x7f56a8153423
027b0 488bca                         mov        rcx, rdx
027b3 49b8b8bc6d9c567f0000           movabs     r8, 0x7f569c6dbcb8
027bd 498380b000000001               add        qword ptr [r8 + 0xb0], 1
027c5 48b9a0bd6d9c567f0000           movabs     rcx, 0x7f569c6dbda0
027cf 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
027d3 4183c002                       add        r8d, 2
027d7 44894178                       mov        dword ptr [rcx + 0x78], r8d
027db 4181e0feff1f00                 and        r8d, 0x1ffffe
027e2 4585c0                         test       r8d, r8d
027e5 0f8459260000                   je         0x7f56a8153444
027eb 48b9a0bd6d9c567f0000           movabs     rcx, 0x7f569c6dbda0
027f5 488381c000000001               add        qword ptr [rcx + 0xc0], 1
027fd 48ba70b26d9c567f0000           movabs     rdx, 0x7f569c6db270
02807 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0280a 83c102                         add        ecx, 2
0280d 894a78                         mov        dword ptr [rdx + 0x78], ecx
02810 81e1feff1f00                   and        ecx, 0x1ffffe
02816 85c9                           test       ecx, ecx
02818 0f8447260000                   je         0x7f56a8153465
0281e 48bac0067ae200000000           movabs     rdx, 0xe27a06c0
02828 488bca                         mov        rcx, rdx
0282b 49b8a0bd6d9c567f0000           movabs     r8, 0x7f569c6dbda0
02835 8b09                           mov        ecx, dword ptr [rcx]
02837 c1e90d                         shr        ecx, 0xd
0283a 48c1e10a                       shl        rcx, 0xa
0283e 41ba000000ad                   mov        r10d, 0xad000000
02844 4903ca                         add        rcx, r10
02847 41ba1d000000                   mov        r10d, 0x1d
0284d 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
02851 7436                           je         0x7f56a8150e89
02853 4983c202                       add        r10, 2
02857 4983fa21                       cmp        r10, 0x21
0285b 75f0                           jne        0x7f56a8150e4d
0285d 41ba1d000000                   mov        r10d, 0x1d
02863 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
02868 7412                           je         0x7f56a8150e7c
0286a 4983c202                       add        r10, 2
0286e 4983fa21                       cmp        r10, 0x21
02872 75ef                           jne        0x7f56a8150e63
02874 41ba1c000000                   mov        r10d, 0x1c
0287a eb11                           jmp        0x7f56a8150e8d
0287c 50                             push       rax
0287d 4833c0                         xor        rax, rax
02880 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
02886 58                             pop        rax
02887 ebbe                           jmp        0x7f56a8150e47
02889 4983c201                       add        r10, 1
0288d 4b8304d001                     add        qword ptr [r8 + r10*8], 1
02892 48b9a0bd6d9c567f0000           movabs     rcx, 0x7f569c6dbda0
0289c 8b12                           mov        edx, dword ptr [rdx]
0289e c1ea0d                         shr        edx, 0xd
028a1 48c1e20a                       shl        rdx, 0xa
028a5 41ba000000ad                   mov        r10d, 0xad000000
028ab 4903d2                         add        rdx, r10
028ae 41ba23000000                   mov        r10d, 0x23
028b4 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
028b8 7436                           je         0x7f56a8150ef0
028ba 4983c202                       add        r10, 2
028be 4983fa27                       cmp        r10, 0x27
028c2 75f0                           jne        0x7f56a8150eb4
028c4 41ba23000000                   mov        r10d, 0x23
028ca 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
028cf 7412                           je         0x7f56a8150ee3
028d1 4983c202                       add        r10, 2
028d5 4983fa27                       cmp        r10, 0x27
028d9 75ef                           jne        0x7f56a8150eca
028db 41ba22000000                   mov        r10d, 0x22
028e1 eb11                           jmp        0x7f56a8150ef4
028e3 50                             push       rax
028e4 4833c0                         xor        rax, rax
028e7 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
028ed 58                             pop        rax
028ee ebbe                           jmp        0x7f56a8150eae
028f0 4983c201                       add        r10, 1
028f4 4a8304d101                     add        qword ptr [rcx + r10*8], 1
028f9 48baa0bd6d9c567f0000           movabs     rdx, 0x7f569c6dbda0
02903 4883824001000001               add        qword ptr [rdx + 0x140], 1
0290b 48ba38b36d9c567f0000           movabs     rdx, 0x7f569c6db338
02915 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02918 83c102                         add        ecx, 2
0291b 894a78                         mov        dword ptr [rdx + 0x78], ecx
0291e 81e1feff1f00                   and        ecx, 0x1ffffe
02924 85c9                           test       ecx, ecx
02926 0f845a250000                   je         0x7f56a8153486
0292c 48baa0bd6d9c567f0000           movabs     rdx, 0x7f569c6dbda0
02936 4883825001000001               add        qword ptr [rdx + 0x150], 1
0293e 4c63f6                         movsxd     r14, esi
02941 be08000000                     mov        esi, 8
02946 4d8bce                         mov        r9, r14
02949 4c03ce                         add        r9, rsi
0294c 48bec0a46d9c567f0000           movabs     rsi, 0x7f569c6da4c0
02956 8b5678                         mov        edx, dword ptr [rsi + 0x78]
02959 83c202                         add        edx, 2
0295c 895678                         mov        dword ptr [rsi + 0x78], edx
0295f 81e2feff1f00                   and        edx, 0x1ffffe
02965 85d2                           test       edx, edx
02967 0f843a250000                   je         0x7f56a81534a7
0296d 48bec0a46d9c567f0000           movabs     rsi, 0x7f569c6da4c0
02977 488386e000000001               add        qword ptr [rsi + 0xe0], 1
0297f 48be40a66d9c567f0000           movabs     rsi, 0x7f569c6da640
02989 8b5678                         mov        edx, dword ptr [rsi + 0x78]
0298c 83c202                         add        edx, 2
0298f 895678                         mov        dword ptr [rsi + 0x78], edx
02992 81e2feff1f00                   and        edx, 0x1ffffe
02998 85d2                           test       edx, edx
0299a 0f8428250000                   je         0x7f56a81534c8
029a0 48bea0bd6d9c567f0000           movabs     rsi, 0x7f569c6dbda0
029aa 4883867001000001               add        qword ptr [rsi + 0x170], 1
029b2 48be88df7ae200000000           movabs     rsi, 0xe27adf88
029bc 48be08077ae200000000           movabs     rsi, 0xe27a0708
029c6 ba02000000                     mov        edx, 2
029cb b910000000                     mov        ecx, 0x10
029d0 4c8bc0                         mov        r8, rax
029d3 bf00000000                     mov        edi, 0
029d8 48890424                       mov        qword ptr [rsp], rax
029dc 4c89742408                     mov        qword ptr [rsp + 8], r14
029e1 49bac0067ae200000000           movabs     r10, 0xe27a06c0
029eb 4c89542410                     mov        qword ptr [rsp + 0x10], r10
029f0 49ba88df7ae200000000           movabs     r10, 0xe27adf88
029fa 4c89542418                     mov        qword ptr [rsp + 0x18], r10
029ff e85cec5d07                     call       0x7f56af72fc60
02a04 0f1f8400fc2a000e               nop        dword ptr [rax + rax + 0xe002afc]
02a0c 4885c0                         test       rax, rax
02a0f 48bba0bd6d9c567f0000           movabs     rbx, 0x7f569c6dbda0
02a19 750c                           jne        0x7f56a8151027
02a1b 808b7901000001                 or         byte ptr [rbx + 0x179], 1
02a22 e988000000                     jmp        0x7f56a81510af
02a27 8b38                           mov        edi, dword ptr [rax]
02a29 c1ef0d                         shr        edi, 0xd
02a2c 48c1e70a                       shl        rdi, 0xa
02a30 41ba000000ad                   mov        r10d, 0xad000000
02a36 4903fa                         add        rdi, r10
02a39 41ba31000000                   mov        r10d, 0x31
02a3f 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
02a43 7436                           je         0x7f56a815107b
02a45 4983c202                       add        r10, 2
02a49 4983fa35                       cmp        r10, 0x35
02a4d 75f0                           jne        0x7f56a815103f
02a4f 41ba31000000                   mov        r10d, 0x31
02a55 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02a5a 7412                           je         0x7f56a815106e
02a5c 4983c202                       add        r10, 2
02a60 4983fa35                       cmp        r10, 0x35
02a64 75ef                           jne        0x7f56a8151055
02a66 41ba30000000                   mov        r10d, 0x30
02a6c eb11                           jmp        0x7f56a815107f
02a6e 50                             push       rax
02a6f 4833c0                         xor        rax, rax
02a72 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
02a78 58                             pop        rax
02a79 ebbe                           jmp        0x7f56a8151039
02a7b 4983c201                       add        r10, 1
02a7f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02a84 48bf00b414ad00000000           movabs     rdi, 0xad14b400
02a8e 8b18                           mov        ebx, dword ptr [rax]
02a90 c1eb0d                         shr        ebx, 0xd
02a93 48c1e30a                       shl        rbx, 0xa
02a97 41ba000000ad                   mov        r10d, 0xad000000
02a9d 4903da                         add        rbx, r10
02aa0 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
02aa4 0f853f240000                   jne        0x7f56a81534e9
02aaa e900000000                     jmp        0x7f56a81510af
02aaf 488bf8                         mov        rdi, rax
02ab2 4889bc24f8010000               mov        qword ptr [rsp + 0x1f8], rdi
02aba 483b07                         cmp        rax, qword ptr [rdi]
02abd 488bf7                         mov        rsi, rdi
02ac0 48bb00c0639c567f0000           movabs     rbx, 0x7f569c63c000
02aca 8b36                           mov        esi, dword ptr [rsi]
02acc c1ee0d                         shr        esi, 0xd
02acf 48c1e60a                       shl        rsi, 0xa
02ad3 41ba000000ad                   mov        r10d, 0xad000000
02ad9 4903f2                         add        rsi, r10
02adc 41bae4000000                   mov        r10d, 0xe4
02ae2 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02ae6 743c                           je         0x7f56a8151124
02ae8 4983c202                       add        r10, 2
02aec 4981fae8000000                 cmp        r10, 0xe8
02af3 75ed                           jne        0x7f56a81510e2
02af5 41bae4000000                   mov        r10d, 0xe4
02afb 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02b00 7415                           je         0x7f56a8151117
02b02 4983c202                       add        r10, 2
02b06 4981fae8000000                 cmp        r10, 0xe8
02b0d 75ec                           jne        0x7f56a81510fb
02b0f 41bae3000000                   mov        r10d, 0xe3
02b15 eb11                           jmp        0x7f56a8151128
02b17 50                             push       rax
02b18 4833c0                         xor        rax, rax
02b1b f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02b21 58                             pop        rax
02b22 ebb8                           jmp        0x7f56a81510dc
02b24 4983c201                       add        r10, 1
02b28 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02b2d 48bef0c76d9c567f0000           movabs     rsi, 0x7f569c6dc7f0
02b37 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
02b3a 83c302                         add        ebx, 2
02b3d 895e78                         mov        dword ptr [rsi + 0x78], ebx
02b40 81e3feff1f00                   and        ebx, 0x1ffffe
02b46 85db                           test       ebx, ebx
02b48 0f84d1230000                   je         0x7f56a815351f
02b4e 488bf7                         mov        rsi, rdi
02b51 48bbf0c76d9c567f0000           movabs     rbx, 0x7f569c6dc7f0
02b5b 8b36                           mov        esi, dword ptr [rsi]
02b5d c1ee0d                         shr        esi, 0xd
02b60 48c1e60a                       shl        rsi, 0xa
02b64 41ba000000ad                   mov        r10d, 0xad000000
02b6a 4903f2                         add        rsi, r10
02b6d 41ba17000000                   mov        r10d, 0x17
02b73 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02b77 7436                           je         0x7f56a81511af
02b79 4983c202                       add        r10, 2
02b7d 4983fa1b                       cmp        r10, 0x1b
02b81 75f0                           jne        0x7f56a8151173
02b83 41ba17000000                   mov        r10d, 0x17
02b89 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02b8e 7412                           je         0x7f56a81511a2
02b90 4983c202                       add        r10, 2
02b94 4983fa1b                       cmp        r10, 0x1b
02b98 75ef                           jne        0x7f56a8151189
02b9a 41ba16000000                   mov        r10d, 0x16
02ba0 eb11                           jmp        0x7f56a81511b3
02ba2 50                             push       rax
02ba3 4833c0                         xor        rax, rax
02ba6 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02bac 58                             pop        rax
02bad ebbe                           jmp        0x7f56a815116d
02baf 4983c201                       add        r10, 1
02bb3 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02bb8 488bf7                         mov        rsi, rdi
02bbb 90                             nop        
02bbc 90                             nop        
02bbd 48b8e08c687c567f0000           movabs     rax, 0x7f567c688ce0
02bc7 e894e55d07                     call       0x7f56af72f760
02bcc 0f1f8400c42c000f               nop        dword ptr [rax + rax + 0xf002cc4]
02bd4 48bef0c76d9c567f0000           movabs     rsi, 0x7f569c6dc7f0
02bde 488386e000000001               add        qword ptr [rsi + 0xe0], 1
02be6 48bef0b06d9c567f0000           movabs     rsi, 0x7f569c6db0f0
02bf0 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
02bf3 83c702                         add        edi, 2
02bf6 897e78                         mov        dword ptr [rsi + 0x78], edi
02bf9 81e7feff1f00                   and        edi, 0x1ffffe
02bff 85ff                           test       edi, edi
02c01 0f8439230000                   je         0x7f56a8153540
02c07 448bac24e8010000               mov        r13d, dword ptr [rsp + 0x1e8]
02c0f 8bbc24ec010000                 mov        edi, dword ptr [rsp + 0x1ec]
02c16 48bef0b06d9c567f0000           movabs     rsi, 0x7f569c6db0f0
02c20 4883861001000001               add        qword ptr [rsi + 0x110], 1
02c28 ffc8                           dec        eax
02c2a 442be8                         sub        r13d, eax
02c2d 48be80a76d9c567f0000           movabs     rsi, 0x7f569c6da780
02c37 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
02c3a 83c302                         add        ebx, 2
02c3d 895e78                         mov        dword ptr [rsi + 0x78], ebx
02c40 81e3feff1f00                   and        ebx, 0x1ffffe
02c46 85db                           test       ebx, ebx
02c48 0f8413230000                   je         0x7f56a8153561
02c4e 48be80a76d9c567f0000           movabs     rsi, 0x7f569c6da780
02c58 488386b000000001               add        qword ptr [rsi + 0xb0], 1
02c60 48be0000000000000000           movabs     rsi, 0
02c6a be00000000                     mov        esi, 0
02c6f 3bfe                           cmp        edi, esi
02c71 0f8c0b230000                   jl         0x7f56a8153582
02c77 413bfd                         cmp        edi, r13d
02c7a 0f8d23230000                   jge        0x7f56a81535a3
02c80 488bc7                         mov        rax, rdi
02c83 898424f4010000                 mov        dword ptr [rsp + 0x1f4], eax
02c8a 89bc24ec010000                 mov        dword ptr [rsp + 0x1ec], edi
02c91 488bbc24f8010000               mov        rdi, qword ptr [rsp + 0x1f8]
02c99 488bf7                         mov        rsi, rdi
02c9c 48b9f0c76d9c567f0000           movabs     rcx, 0x7f569c6dc7f0
02ca6 8b36                           mov        esi, dword ptr [rsi]
02ca8 c1ee0d                         shr        esi, 0xd
02cab 48c1e60a                       shl        rsi, 0xa
02caf 41ba000000ad                   mov        r10d, 0xad000000
02cb5 4903f2                         add        rsi, r10
02cb8 41ba1f000000                   mov        r10d, 0x1f
02cbe 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
02cc2 7436                           je         0x7f56a81512fa
02cc4 4983c202                       add        r10, 2
02cc8 4983fa23                       cmp        r10, 0x23
02ccc 75f0                           jne        0x7f56a81512be
02cce 41ba1f000000                   mov        r10d, 0x1f
02cd4 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02cd9 7412                           je         0x7f56a81512ed
02cdb 4983c202                       add        r10, 2
02cdf 4983fa23                       cmp        r10, 0x23
02ce3 75ef                           jne        0x7f56a81512d4
02ce5 41ba1e000000                   mov        r10d, 0x1e
02ceb eb11                           jmp        0x7f56a81512fe
02ced 50                             push       rax
02cee 4833c0                         xor        rax, rax
02cf1 f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
02cf7 58                             pop        rax
02cf8 ebbe                           jmp        0x7f56a81512b8
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
02d0d 48b8088d687c567f0000           movabs     rax, 0x7f567c688d08
02d17 e844e45d07                     call       0x7f56af72f760
02d1c 0f1f8400142e0010               nop        dword ptr [rax + rax + 0x10002e14]
02d24 483b00                         cmp        rax, qword ptr [rax]
02d27 488bf0                         mov        rsi, rax
02d2a 48baf0c76d9c567f0000           movabs     rdx, 0x7f569c6dc7f0
02d34 8b36                           mov        esi, dword ptr [rsi]
02d36 c1ee0d                         shr        esi, 0xd
02d39 48c1e60a                       shl        rsi, 0xa
02d3d 41ba000000ad                   mov        r10d, 0xad000000
02d43 4903f2                         add        rsi, r10
02d46 41ba25000000                   mov        r10d, 0x25
02d4c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02d50 7436                           je         0x7f56a8151388
02d52 4983c202                       add        r10, 2
02d56 4983fa29                       cmp        r10, 0x29
02d5a 75f0                           jne        0x7f56a815134c
02d5c 41ba25000000                   mov        r10d, 0x25
02d62 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02d67 7412                           je         0x7f56a815137b
02d69 4983c202                       add        r10, 2
02d6d 4983fa29                       cmp        r10, 0x29
02d71 75ef                           jne        0x7f56a8151362
02d73 41ba24000000                   mov        r10d, 0x24
02d79 eb11                           jmp        0x7f56a815138c
02d7b 50                             push       rax
02d7c 4833c0                         xor        rax, rax
02d7f f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
02d85 58                             pop        rax
02d86 ebbe                           jmp        0x7f56a8151346
02d88 4983c201                       add        r10, 1
02d8c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02d91 8b7024                         mov        esi, dword ptr [rax + 0x24]
02d94 4c3b257d093020                 cmp        r12, qword ptr [rip + 0x2030097d]
02d9b 0f8414000000                   je         0x7f56a81513b5
02da1 48bf384352c6567f0000           movabs     rdi, 0x7f56c6524338
02dab 4883e4f0                       and        rsp, 0xfffffffffffffff0
02daf e82cf16c1f                     call       0x7f56c78204e0
02db4 f4                             hlt        
02db5 488bd0                         mov        rdx, rax
02db8 48b9f0c76d9c567f0000           movabs     rcx, 0x7f569c6dc7f0
02dc2 8b12                           mov        edx, dword ptr [rdx]
02dc4 c1ea0d                         shr        edx, 0xd
02dc7 48c1e20a                       shl        rdx, 0xa
02dcb 41ba000000ad                   mov        r10d, 0xad000000
02dd1 4903d2                         add        rdx, r10
02dd4 41ba2b000000                   mov        r10d, 0x2b
02dda 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02dde 7436                           je         0x7f56a8151416
02de0 4983c202                       add        r10, 2
02de4 4983fa2f                       cmp        r10, 0x2f
02de8 75f0                           jne        0x7f56a81513da
02dea 41ba2b000000                   mov        r10d, 0x2b
02df0 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02df5 7412                           je         0x7f56a8151409
02df7 4983c202                       add        r10, 2
02dfb 4983fa2f                       cmp        r10, 0x2f
02dff 75ef                           jne        0x7f56a81513f0
02e01 41ba2a000000                   mov        r10d, 0x2a
02e07 eb11                           jmp        0x7f56a815141a
02e09 50                             push       rax
02e0a 4833c0                         xor        rax, rax
02e0d f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02e13 58                             pop        rax
02e14 ebbe                           jmp        0x7f56a81513d4
02e16 4983c201                       add        r10, 1
02e1a 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02e1f 8b4804                         mov        ecx, dword ptr [rax + 4]
02e22 48baf0c76d9c567f0000           movabs     rdx, 0x7f569c6dc7f0
02e2c 4883828001000001               add        qword ptr [rdx + 0x180], 1
02e34 48ba38b36d9c567f0000           movabs     rdx, 0x7f569c6db338
02e3e 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
02e42 4183c002                       add        r8d, 2
02e46 44894278                       mov        dword ptr [rdx + 0x78], r8d
02e4a 4181e0feff1f00                 and        r8d, 0x1ffffe
02e51 4585c0                         test       r8d, r8d
02e54 0f8483210000                   je         0x7f56a81535dd
02e5a 48baf0c76d9c567f0000           movabs     rdx, 0x7f569c6dc7f0
02e64 4883829001000001               add        qword ptr [rdx + 0x190], 1
02e6c 8b8424f4010000                 mov        eax, dword ptr [rsp + 0x1f4]
02e73 4863c0                         movsxd     rax, eax
02e76 ba08000000                     mov        edx, 8
02e7b 4c8bc8                         mov        r9, rax
02e7e 4c03ca                         add        r9, rdx
02e81 48bac0a46d9c567f0000           movabs     rdx, 0x7f569c6da4c0
02e8b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
02e8f 4183c002                       add        r8d, 2
02e93 44894278                       mov        dword ptr [rdx + 0x78], r8d
02e97 4181e0feff1f00                 and        r8d, 0x1ffffe
02e9e 4585c0                         test       r8d, r8d
02ea1 0f8457210000                   je         0x7f56a81535fe
02ea7 48bac0a46d9c567f0000           movabs     rdx, 0x7f569c6da4c0
02eb1 488382e000000001               add        qword ptr [rdx + 0xe0], 1
02eb9 48ba40a66d9c567f0000           movabs     rdx, 0x7f569c6da640
02ec3 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
02ec7 4183c002                       add        r8d, 2
02ecb 44894278                       mov        dword ptr [rdx + 0x78], r8d
02ecf 4181e0feff1f00                 and        r8d, 0x1ffffe
02ed6 4585c0                         test       r8d, r8d
02ed9 0f8440210000                   je         0x7f56a815361f
02edf 48baf0c76d9c567f0000           movabs     rdx, 0x7f569c6dc7f0
02ee9 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
02ef1 48ba707d7be200000000           movabs     rdx, 0xe27b7d70
02efb ba02000000                     mov        edx, 2
02f00 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
02f08 bf00000000                     mov        edi, 0
02f0d 488b9c24f8010000               mov        rbx, qword ptr [rsp + 0x1f8]
02f15 48891c24                       mov        qword ptr [rsp], rbx
02f19 488b9c2438010000               mov        rbx, qword ptr [rsp + 0x138]
02f21 48895c2408                     mov        qword ptr [rsp + 8], rbx
02f26 4889442410                     mov        qword ptr [rsp + 0x10], rax
02f2b 49ba707d7be200000000           movabs     r10, 0xe27b7d70
02f35 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02f3a 90                             nop        
02f3b 90                             nop        
02f3c 90                             nop        
02f3d 90                             nop        
02f3e 90                             nop        
02f3f e81ce75d07                     call       0x7f56af72fc60
02f44 0f1f84003c300011               nop        dword ptr [rax + rax + 0x1100303c]
02f4c 8b8424ec010000                 mov        eax, dword ptr [rsp + 0x1ec]
02f53 83c010                         add        eax, 0x10
02f56 8bbc24e4010000                 mov        edi, dword ptr [rsp + 0x1e4]
02f5d 83c710                         add        edi, 0x10
02f60 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02f67 ba02000000                     mov        edx, 2
02f6c 7c05                           jl         0x7f56a8151573
02f6e ba00000000                     mov        edx, 0
02f73 48b900c0639c567f0000           movabs     rcx, 0x7f569c63c000
02f7d 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
02f81 4403c2                         add        r8d, edx
02f84 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
02f88 85d2                           test       edx, edx
02f8a 7506                           jne        0x7f56a8151592
02f8c 41b802000000                   mov        r8d, 2
02f92 4181e0fe3f0000                 and        r8d, 0x3ffe
02f99 4585c0                         test       r8d, r8d
02f9c 0f849e200000                   je         0x7f56a8153640
02fa2 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02fa6 418502                         test       dword ptr [r10], eax
02fa9 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02fb0 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
02fba b948070000                     mov        ecx, 0x748
02fbf 7c05                           jl         0x7f56a81515c6
02fc1 b958070000                     mov        ecx, 0x758
02fc6 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
02fca 4d8d4001                       lea        r8, [r8 + 1]
02fce 4c89040a                       mov        qword ptr [rdx + rcx], r8
02fd2 0f8c50f5ffff                   jl         0x7f56a8150b28
02fd8 8b9c24f0010000                 mov        ebx, dword ptr [rsp + 0x1f0]
02fdf 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
02fe9 ff8268070000                   inc        dword ptr [rdx + 0x768]
02fef e9220f0000                     jmp        0x7f56a8152516
02ff4 4183f908                       cmp        r9d, 8
02ff8 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
03002 b980070000                     mov        ecx, 0x780
03007 7c05                           jl         0x7f56a815160e
03009 b990070000                     mov        ecx, 0x790
0300e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
03012 4d8d4001                       lea        r8, [r8 + 1]
03016 4c89040a                       mov        qword ptr [rdx + rcx], r8
0301a 0f8c86040000                   jl         0x7f56a8151aa6
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
0304f 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
03059 488382a007000001               add        qword ptr [rdx + 0x7a0], 1
03061 48ba206a10ad00000000           movabs     rdx, 0xad106a20
0306b 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0306e 83c102                         add        ecx, 2
03071 894a78                         mov        dword ptr [rdx + 0x78], ecx
03074 81e1feff1f00                   and        ecx, 0x1ffffe
0307a 85c9                           test       ecx, ecx
0307c 0f84df1f0000                   je         0x7f56a8153661
03082 48ba206a10ad00000000           movabs     rdx, 0xad106a20
0308c 488d92e0000000                 lea        rdx, [rdx + 0xe0]
03093 4885c0                         test       rax, rax
03096 7510                           jne        0x7f56a81516a8
03098 f6420801                       test       byte ptr [rdx + 8], 1
0309c 0f8506000000                   jne        0x7f56a81516a8
030a2 f048834a0801                   lock or    qword ptr [rdx + 8], 1
030a8 48ba407e739c567f0000           movabs     rdx, 0x7f569c737e40
030b2 488d9248030000                 lea        rdx, [rdx + 0x348]
030b9 4885c0                         test       rax, rax
030bc 7510                           jne        0x7f56a81516ce
030be f6421001                       test       byte ptr [rdx + 0x10], 1
030c2 0f8506000000                   jne        0x7f56a81516ce
030c8 f048834a1001                   lock or    qword ptr [rdx + 0x10], 1
030ce 48ba206a10ad00000000           movabs     rdx, 0xad106a20
030d8 488382b000000001               add        qword ptr [rdx + 0xb0], 1
030e0 48ba407e739c567f0000           movabs     rdx, 0x7f569c737e40
030ea 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
030ed 83c102                         add        ecx, 2
030f0 894a78                         mov        dword ptr [rdx + 0x78], ecx
030f3 81e1feff1f00                   and        ecx, 0x1ffffe
030f9 85c9                           test       ecx, ecx
030fb 0f84811f0000                   je         0x7f56a8153682
03101 48baa0df72e200000000           movabs     rdx, 0xe272dfa0
0310b 48b9407e739c567f0000           movabs     rcx, 0x7f569c737e40
03115 8b12                           mov        edx, dword ptr [rdx]
03117 c1ea0d                         shr        edx, 0xd
0311a 48c1e20a                       shl        rdx, 0xa
0311e 41ba000000ad                   mov        r10d, 0xad000000
03124 4903d2                         add        rdx, r10
03127 41ba17000000                   mov        r10d, 0x17
0312d 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03131 7436                           je         0x7f56a8151769
03133 4983c202                       add        r10, 2
03137 4983fa1b                       cmp        r10, 0x1b
0313b 75f0                           jne        0x7f56a815172d
0313d 41ba17000000                   mov        r10d, 0x17
03143 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03148 7412                           je         0x7f56a815175c
0314a 4983c202                       add        r10, 2
0314e 4983fa1b                       cmp        r10, 0x1b
03152 75ef                           jne        0x7f56a8151743
03154 41ba16000000                   mov        r10d, 0x16
0315a eb11                           jmp        0x7f56a815176d
0315c 50                             push       rax
0315d 4833c0                         xor        rax, rax
03160 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03166 58                             pop        rax
03167 ebbe                           jmp        0x7f56a8151727
03169 4983c201                       add        r10, 1
0316d 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03172 48ba9078739c567f0000           movabs     rdx, 0x7f569c737890
0317c 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0317f 83c102                         add        ecx, 2
03182 894a78                         mov        dword ptr [rdx + 0x78], ecx
03185 81e1feff1f00                   and        ecx, 0x1ffffe
0318b 85c9                           test       ecx, ecx
0318d 0f84101f0000                   je         0x7f56a81536a3
03193 48ba9078739c567f0000           movabs     rdx, 0x7f569c737890
0319d ff82b0000000                   inc        dword ptr [rdx + 0xb0]
031a3 48ba407e739c567f0000           movabs     rdx, 0x7f569c737e40
031ad ff8208010000                   inc        dword ptr [rdx + 0x108]
031b3 48ba407e739c567f0000           movabs     rdx, 0x7f569c737e40
031bd ff8228010000                   inc        dword ptr [rdx + 0x128]
031c3 48ba58d872e200000000           movabs     rdx, 0xe272d858
031cd 48b9407e739c567f0000           movabs     rcx, 0x7f569c737e40
031d7 8b12                           mov        edx, dword ptr [rdx]
031d9 c1ea0d                         shr        edx, 0xd
031dc 48c1e20a                       shl        rdx, 0xa
031e0 41ba000000ad                   mov        r10d, 0xad000000
031e6 4903d2                         add        rdx, r10
031e9 41ba28000000                   mov        r10d, 0x28
031ef 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
031f3 7436                           je         0x7f56a815182b
031f5 4983c202                       add        r10, 2
031f9 4983fa2c                       cmp        r10, 0x2c
031fd 75f0                           jne        0x7f56a81517ef
031ff 41ba28000000                   mov        r10d, 0x28
03205 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0320a 7412                           je         0x7f56a815181e
0320c 4983c202                       add        r10, 2
03210 4983fa2c                       cmp        r10, 0x2c
03214 75ef                           jne        0x7f56a8151805
03216 41ba27000000                   mov        r10d, 0x27
0321c eb11                           jmp        0x7f56a815182f
0321e 50                             push       rax
0321f 4833c0                         xor        rax, rax
03222 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03228 58                             pop        rax
03229 ebbe                           jmp        0x7f56a81517e9
0322b 4983c201                       add        r10, 1
0322f 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03234 48bac07b739c567f0000           movabs     rdx, 0x7f569c737bc0
0323e 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03241 83c102                         add        ecx, 2
03244 894a78                         mov        dword ptr [rdx + 0x78], ecx
03247 81e1feff1f00                   and        ecx, 0x1ffffe
0324d 85c9                           test       ecx, ecx
0324f 0f846f1e0000                   je         0x7f56a81536c4
03255 48bac07b739c567f0000           movabs     rdx, 0x7f569c737bc0
0325f ff82b0000000                   inc        dword ptr [rdx + 0xb0]
03265 48ba407e739c567f0000           movabs     rdx, 0x7f569c737e40
0326f 488d9288010000                 lea        rdx, [rdx + 0x188]
03276 4885c0                         test       rax, rax
03279 7510                           jne        0x7f56a815188b
0327b f6421801                       test       byte ptr [rdx + 0x18], 1
0327f 0f8506000000                   jne        0x7f56a815188b
03285 f048834a1801                   lock or    qword ptr [rdx + 0x18], 1
0328b 48ba407e739c567f0000           movabs     rdx, 0x7f569c737e40
03295 4883827801000001               add        qword ptr [rdx + 0x178], 1
0329d 48baa081739c567f0000           movabs     rdx, 0x7f569c7381a0
032a7 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
032aa 83c102                         add        ecx, 2
032ad 894a78                         mov        dword ptr [rdx + 0x78], ecx
032b0 81e1feff1f00                   and        ecx, 0x1ffffe
032b6 85c9                           test       ecx, ecx
032b8 0f84271e0000                   je         0x7f56a81536e5
032be 48baa081739c567f0000           movabs     rdx, 0x7f569c7381a0
032c8 4883821001000001               add        qword ptr [rdx + 0x110], 1
032d0 48baa88a14ad00000000           movabs     rdx, 0xad148aa8
032da 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
032dd 83c102                         add        ecx, 2
032e0 894a78                         mov        dword ptr [rdx + 0x78], ecx
032e3 81e1feff1f00                   and        ecx, 0x1ffffe
032e9 85c9                           test       ecx, ecx
032eb 0f84151e0000                   je         0x7f56a8153706
032f1 8b5004                         mov        edx, dword ptr [rax + 4]
032f4 48b9a88a14ad00000000           movabs     rcx, 0xad148aa8
032fe 488381b000000001               add        qword ptr [rcx + 0xb0], 1
03306 83ea07                         sub        edx, 7
03309 48b920fe22e200000000           movabs     rcx, 0xe222fe20
03313 b900000000                     mov        ecx, 0
03318 3bf9                           cmp        edi, ecx
0331a 0f8c201e0000                   jl         0x7f56a8153740
03320 3bfa                           cmp        edi, edx
03322 0f8d391e0000                   jge        0x7f56a8153761
03328 488bd7                         mov        rdx, rdi
0332b 48bef8a422e200000000           movabs     rsi, 0xe222a4f8
03335 488bce                         mov        rcx, rsi
03338 49b8a081739c567f0000           movabs     r8, 0x7f569c7381a0
03342 8b09                           mov        ecx, dword ptr [rcx]
03344 c1e90d                         shr        ecx, 0xd
03347 48c1e10a                       shl        rcx, 0xa
0334b 41ba000000ad                   mov        r10d, 0xad000000
03351 4903ca                         add        rcx, r10
03354 41ba25000000                   mov        r10d, 0x25
0335a 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0335e 7436                           je         0x7f56a8151996
03360 4983c202                       add        r10, 2
03364 4983fa29                       cmp        r10, 0x29
03368 75f0                           jne        0x7f56a815195a
0336a 41ba25000000                   mov        r10d, 0x25
03370 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
03375 7412                           je         0x7f56a8151989
03377 4983c202                       add        r10, 2
0337b 4983fa29                       cmp        r10, 0x29
0337f 75ef                           jne        0x7f56a8151970
03381 41ba24000000                   mov        r10d, 0x24
03387 eb11                           jmp        0x7f56a815199a
03389 50                             push       rax
0338a 4833c0                         xor        rax, rax
0338d f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
03393 58                             pop        rax
03394 ebbe                           jmp        0x7f56a8151954
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
033bf e89cd85d07                     call       0x7f56af72f260
033c4 0f1f8400bc340013               nop        dword ptr [rax + rax + 0x130034bc]
033cc 48be00c0639c567f0000           movabs     rsi, 0x7f569c63c000
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
033f7 e864e25d07                     call       0x7f56af72fc60
033fc 0f1f8400f4340014               nop        dword ptr [rax + rax + 0x140034f4]
03404 8b842400020000                 mov        eax, dword ptr [rsp + 0x200]
0340b 83c008                         add        eax, 8
0340e 8bbc2404020000                 mov        edi, dword ptr [rsp + 0x204]
03415 83c708                         add        edi, 8
03418 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
0341f be02000000                     mov        esi, 2
03424 7c05                           jl         0x7f56a8151a2b
03426 be00000000                     mov        esi, 0
0342b 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
03435 8b4a7c                         mov        ecx, dword ptr [rdx + 0x7c]
03438 03ce                           add        ecx, esi
0343a 894a7c                         mov        dword ptr [rdx + 0x7c], ecx
0343d 85f6                           test       esi, esi
0343f 7505                           jne        0x7f56a8151a46
03441 b902000000                     mov        ecx, 2
03446 81e1fe3f0000                   and        ecx, 0x3ffe
0344c 85c9                           test       ecx, ecx
0344e 0f842e1d0000                   je         0x7f56a8153782
03454 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03458 418502                         test       dword ptr [r10], eax
0345b 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
03462 48be00c0639c567f0000           movabs     rsi, 0x7f569c63c000
0346c bac0070000                     mov        edx, 0x7c0
03471 7c05                           jl         0x7f56a8151a78
03473 bad0070000                     mov        edx, 0x7d0
03478 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0347c 488d4901                       lea        rcx, [rcx + 1]
03480 48890c16                       mov        qword ptr [rsi + rdx], rcx
03484 0f8cb6fbffff                   jl         0x7f56a8151640
0348a 8b9c2408020000                 mov        ebx, dword ptr [rsp + 0x208]
03491 48be00c0639c567f0000           movabs     rsi, 0x7f569c63c000
0349b ff86e0070000                   inc        dword ptr [rsi + 0x7e0]
034a1 e9700a0000                     jmp        0x7f56a8152516
034a6 48be00c0639c567f0000           movabs     rsi, 0x7f569c63c000
034b0 488386f807000001               add        qword ptr [rsi + 0x7f8], 1
034b8 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
034c0 8b9424d0010000                 mov        edx, dword ptr [rsp + 0x1d0]
034c7 488bcf                         mov        rcx, rdi
034ca 4d8bc1                         mov        r8, r9
034cd 448b8c2478010000               mov        r9d, dword ptr [rsp + 0x178]
034d5 90                             nop        
034d6 90                             nop        
034d7 e884e15d07                     call       0x7f56af72fc60
034dc 0f1f8400d4350016               nop        dword ptr [rax + rax + 0x160035d4]
034e4 488bd8                         mov        rbx, rax
034e7 e92a0a0000                     jmp        0x7f56a8152516
034ec 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
034f3 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
034fa 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03502 48be00c0639c567f0000           movabs     rsi, 0x7f569c63c000
0350c 488386d005000001               add        qword ptr [rsi + 0x5d0], 1
03514 48bee8ba6d9c567f0000           movabs     rsi, 0x7f569c6dbae8
0351e 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03521 83c202                         add        edx, 2
03524 895678                         mov        dword ptr [rsi + 0x78], edx
03527 81e2feff1f00                   and        edx, 0x1ffffe
0352d 85d2                           test       edx, edx
0352f 0f846e1c0000                   je         0x7f56a81537a3
03535 48bec0067ae200000000           movabs     rsi, 0xe27a06c0
0353f 48bae8ba6d9c567f0000           movabs     rdx, 0x7f569c6dbae8
03549 8b36                           mov        esi, dword ptr [rsi]
0354b c1ee0d                         shr        esi, 0xd
0354e 48c1e60a                       shl        rsi, 0xa
03552 41ba000000ad                   mov        r10d, 0xad000000
03558 4903f2                         add        rsi, r10
0355b 41ba17000000                   mov        r10d, 0x17
03561 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03565 7436                           je         0x7f56a8151b9d
03567 4983c202                       add        r10, 2
0356b 4983fa1b                       cmp        r10, 0x1b
0356f 75f0                           jne        0x7f56a8151b61
03571 41ba17000000                   mov        r10d, 0x17
03577 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
0357c 7412                           je         0x7f56a8151b90
0357e 4983c202                       add        r10, 2
03582 4983fa1b                       cmp        r10, 0x1b
03586 75ef                           jne        0x7f56a8151b77
03588 41ba16000000                   mov        r10d, 0x16
0358e eb11                           jmp        0x7f56a8151ba1
03590 50                             push       rax
03591 4833c0                         xor        rax, rax
03594 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
0359a 58                             pop        rax
0359b ebbe                           jmp        0x7f56a8151b5b
0359d 4983c201                       add        r10, 1
035a1 4a8304d201                     add        qword ptr [rdx + r10*8], 1
035a6 8b5804                         mov        ebx, dword ptr [rax + 4]
035a9 48bee8ba6d9c567f0000           movabs     rsi, 0x7f569c6dbae8
035b3 488386e000000001               add        qword ptr [rsi + 0xe0], 1
035bb 48bef0b06d9c567f0000           movabs     rsi, 0x7f569c6db0f0
035c5 8b5678                         mov        edx, dword ptr [rsi + 0x78]
035c8 83c202                         add        edx, 2
035cb 895678                         mov        dword ptr [rsi + 0x78], edx
035ce 81e2feff1f00                   and        edx, 0x1ffffe
035d4 85d2                           test       edx, edx
035d6 0f84011c0000                   je         0x7f56a81537dd
035dc 48bef0b06d9c567f0000           movabs     rsi, 0x7f569c6db0f0
035e6 4883861001000001               add        qword ptr [rsi + 0x110], 1
035ee 488bf3                         mov        rsi, rbx
035f1 83ee0f                         sub        esi, 0xf
035f4 48ba80a76d9c567f0000           movabs     rdx, 0x7f569c6da780
035fe 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03601 83c102                         add        ecx, 2
03604 894a78                         mov        dword ptr [rdx + 0x78], ecx
03607 81e1feff1f00                   and        ecx, 0x1ffffe
0360d 85c9                           test       ecx, ecx
0360f 0f84e91b0000                   je         0x7f56a81537fe
03615 48ba80a76d9c567f0000           movabs     rdx, 0x7f569c6da780
0361f 488382b000000001               add        qword ptr [rdx + 0xb0], 1
03627 48ba0000000000000000           movabs     rdx, 0
03631 ba00000000                     mov        edx, 0
03636 3bfa                           cmp        edi, edx
03638 0f8ce11b0000                   jl         0x7f56a815381f
0363e 3bfe                           cmp        edi, esi
03640 0f8dfa1b0000                   jge        0x7f56a8153840
03646 48bec0067ae200000000           movabs     rsi, 0xe27a06c0
03650 488bd6                         mov        rdx, rsi
03653 48b9e8ba6d9c567f0000           movabs     rcx, 0x7f569c6dbae8
0365d 8b12                           mov        edx, dword ptr [rdx]
0365f c1ea0d                         shr        edx, 0xd
03662 48c1e20a                       shl        rdx, 0xa
03666 41ba000000ad                   mov        r10d, 0xad000000
0366c 4903d2                         add        rdx, r10
0366f 41ba25000000                   mov        r10d, 0x25
03675 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03679 7436                           je         0x7f56a8151cb1
0367b 4983c202                       add        r10, 2
0367f 4983fa29                       cmp        r10, 0x29
03683 75f0                           jne        0x7f56a8151c75
03685 41ba25000000                   mov        r10d, 0x25
0368b 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03690 7412                           je         0x7f56a8151ca4
03692 4983c202                       add        r10, 2
03696 4983fa29                       cmp        r10, 0x29
0369a 75ef                           jne        0x7f56a8151c8b
0369c 41ba24000000                   mov        r10d, 0x24
036a2 eb11                           jmp        0x7f56a8151cb5
036a4 50                             push       rax
036a5 4833c0                         xor        rax, rax
036a8 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
036ae 58                             pop        rax
036af ebbe                           jmp        0x7f56a8151c6f
036b1 4983c201                       add        r10, 1
036b5 4a8304d101                     add        qword ptr [rcx + r10*8], 1
036ba 48ba88a86d9c567f0000           movabs     rdx, 0x7f569c6da888
036c4 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
036c7 83c102                         add        ecx, 2
036ca 894a78                         mov        dword ptr [rdx + 0x78], ecx
036cd 81e1feff1f00                   and        ecx, 0x1ffffe
036d3 85c9                           test       ecx, ecx
036d5 0f84861b0000                   je         0x7f56a8153861
036db 48ba88a86d9c567f0000           movabs     rdx, 0x7f569c6da888
036e5 488382b000000001               add        qword ptr [rdx + 0xb0], 1
036ed 48beb8a96d9c567f0000           movabs     rsi, 0x7f569c6da9b8
036f7 8b5678                         mov        edx, dword ptr [rsi + 0x78]
036fa 83c202                         add        edx, 2
036fd 895678                         mov        dword ptr [rsi + 0x78], edx
03700 81e2feff1f00                   and        edx, 0x1ffffe
03706 85d2                           test       edx, edx
03708 0f84741b0000                   je         0x7f56a8153882
0370e 48beb8a96d9c567f0000           movabs     rsi, 0x7f569c6da9b8
03718 ff86c0000000                   inc        dword ptr [rsi + 0xc0]
0371e 899c240c020000                 mov        dword ptr [rsp + 0x20c], ebx
03725 48beb8867ae200000000           movabs     rsi, 0xe27a86b8
0372f 488bd6                         mov        rdx, rsi
03732 48b9e8ba6d9c567f0000           movabs     rcx, 0x7f569c6dbae8
0373c 4883816001000001               add        qword ptr [rcx + 0x160], 1
03744 48bab8bc6d9c567f0000           movabs     rdx, 0x7f569c6dbcb8
0374e 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03751 83c102                         add        ecx, 2
03754 894a78                         mov        dword ptr [rdx + 0x78], ecx
03757 81e1feff1f00                   and        ecx, 0x1ffffe
0375d 85c9                           test       ecx, ecx
0375f 0f843e1b0000                   je         0x7f56a81538a3
03765 488bd6                         mov        rdx, rsi
03768 48b9b8bc6d9c567f0000           movabs     rcx, 0x7f569c6dbcb8
03772 488381b000000001               add        qword ptr [rcx + 0xb0], 1
0377a 48baa0bd6d9c567f0000           movabs     rdx, 0x7f569c6dbda0
03784 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03787 83c102                         add        ecx, 2
0378a 894a78                         mov        dword ptr [rdx + 0x78], ecx
0378d 81e1feff1f00                   and        ecx, 0x1ffffe
03793 85c9                           test       ecx, ecx
03795 0f84291b0000                   je         0x7f56a81538c4
0379b 48baa0bd6d9c567f0000           movabs     rdx, 0x7f569c6dbda0
037a5 488382c000000001               add        qword ptr [rdx + 0xc0], 1
037ad 48be70b26d9c567f0000           movabs     rsi, 0x7f569c6db270
037b7 8b5678                         mov        edx, dword ptr [rsi + 0x78]
037ba 83c202                         add        edx, 2
037bd 895678                         mov        dword ptr [rsi + 0x78], edx
037c0 81e2feff1f00                   and        edx, 0x1ffffe
037c6 85d2                           test       edx, edx
037c8 0f84171b0000                   je         0x7f56a81538e5
037ce 48bec0067ae200000000           movabs     rsi, 0xe27a06c0
037d8 488bd6                         mov        rdx, rsi
037db 48b9a0bd6d9c567f0000           movabs     rcx, 0x7f569c6dbda0
037e5 8b12                           mov        edx, dword ptr [rdx]
037e7 c1ea0d                         shr        edx, 0xd
037ea 48c1e20a                       shl        rdx, 0xa
037ee 41ba000000ad                   mov        r10d, 0xad000000
037f4 4903d2                         add        rdx, r10
037f7 41ba1d000000                   mov        r10d, 0x1d
037fd 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03801 7436                           je         0x7f56a8151e39
03803 4983c202                       add        r10, 2
03807 4983fa21                       cmp        r10, 0x21
0380b 75f0                           jne        0x7f56a8151dfd
0380d 41ba1d000000                   mov        r10d, 0x1d
03813 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03818 7412                           je         0x7f56a8151e2c
0381a 4983c202                       add        r10, 2
0381e 4983fa21                       cmp        r10, 0x21
03822 75ef                           jne        0x7f56a8151e13
03824 41ba1c000000                   mov        r10d, 0x1c
0382a eb11                           jmp        0x7f56a8151e3d
0382c 50                             push       rax
0382d 4833c0                         xor        rax, rax
03830 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03836 58                             pop        rax
03837 ebbe                           jmp        0x7f56a8151df7
03839 4983c201                       add        r10, 1
0383d 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03842 48baa0bd6d9c567f0000           movabs     rdx, 0x7f569c6dbda0
0384c 8b36                           mov        esi, dword ptr [rsi]
0384e c1ee0d                         shr        esi, 0xd
03851 48c1e60a                       shl        rsi, 0xa
03855 41ba000000ad                   mov        r10d, 0xad000000
0385b 4903f2                         add        rsi, r10
0385e 41ba23000000                   mov        r10d, 0x23
03864 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03868 7436                           je         0x7f56a8151ea0
0386a 4983c202                       add        r10, 2
0386e 4983fa27                       cmp        r10, 0x27
03872 75f0                           jne        0x7f56a8151e64
03874 41ba23000000                   mov        r10d, 0x23
0387a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
0387f 7412                           je         0x7f56a8151e93
03881 4983c202                       add        r10, 2
03885 4983fa27                       cmp        r10, 0x27
03889 75ef                           jne        0x7f56a8151e7a
0388b 41ba22000000                   mov        r10d, 0x22
03891 eb11                           jmp        0x7f56a8151ea4
03893 50                             push       rax
03894 4833c0                         xor        rax, rax
03897 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
0389d 58                             pop        rax
0389e ebbe                           jmp        0x7f56a8151e5e
038a0 4983c201                       add        r10, 1
038a4 4a8304d201                     add        qword ptr [rdx + r10*8], 1
038a9 48bea0bd6d9c567f0000           movabs     rsi, 0x7f569c6dbda0
038b3 4883864001000001               add        qword ptr [rsi + 0x140], 1
038bb 48be38b36d9c567f0000           movabs     rsi, 0x7f569c6db338
038c5 8b5678                         mov        edx, dword ptr [rsi + 0x78]
038c8 83c202                         add        edx, 2
038cb 895678                         mov        dword ptr [rsi + 0x78], edx
038ce 81e2feff1f00                   and        edx, 0x1ffffe
038d4 85d2                           test       edx, edx
038d6 0f842a1a0000                   je         0x7f56a8153906
038dc 48bea0bd6d9c567f0000           movabs     rsi, 0x7f569c6dbda0
038e6 4883865001000001               add        qword ptr [rsi + 0x150], 1
038ee 4c63df                         movsxd     r11, edi
038f1 be08000000                     mov        esi, 8
038f6 4d8bcb                         mov        r9, r11
038f9 4c03ce                         add        r9, rsi
038fc 48bec0a46d9c567f0000           movabs     rsi, 0x7f569c6da4c0
03906 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03909 83c202                         add        edx, 2
0390c 895678                         mov        dword ptr [rsi + 0x78], edx
0390f 81e2feff1f00                   and        edx, 0x1ffffe
03915 85d2                           test       edx, edx
03917 0f840a1a0000                   je         0x7f56a8153927
0391d 48bec0a46d9c567f0000           movabs     rsi, 0x7f569c6da4c0
03927 488386e000000001               add        qword ptr [rsi + 0xe0], 1
0392f 48be40a66d9c567f0000           movabs     rsi, 0x7f569c6da640
03939 8b5678                         mov        edx, dword ptr [rsi + 0x78]
0393c 83c202                         add        edx, 2
0393f 895678                         mov        dword ptr [rsi + 0x78], edx
03942 81e2feff1f00                   and        edx, 0x1ffffe
03948 85d2                           test       edx, edx
0394a 0f84f8190000                   je         0x7f56a8153948
03950 48bea0bd6d9c567f0000           movabs     rsi, 0x7f569c6dbda0
0395a 4883867001000001               add        qword ptr [rsi + 0x170], 1
03962 48be88df7ae200000000           movabs     rsi, 0xe27adf88
0396c 48be08077ae200000000           movabs     rsi, 0xe27a0708
03976 ba02000000                     mov        edx, 2
0397b b910000000                     mov        ecx, 0x10
03980 4c8bc0                         mov        r8, rax
03983 bf00000000                     mov        edi, 0
03988 48890424                       mov        qword ptr [rsp], rax
0398c 4c895c2408                     mov        qword ptr [rsp + 8], r11
03991 49bac0067ae200000000           movabs     r10, 0xe27a06c0
0399b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
039a0 49ba88df7ae200000000           movabs     r10, 0xe27adf88
039aa 4c89542418                     mov        qword ptr [rsp + 0x18], r10
039af e8acdc5d07                     call       0x7f56af72fc60
039b4 0f1f8400ac3a0017               nop        dword ptr [rax + rax + 0x17003aac]
039bc 4885c0                         test       rax, rax
039bf 48bba0bd6d9c567f0000           movabs     rbx, 0x7f569c6dbda0
039c9 750c                           jne        0x7f56a8151fd7
039cb 808b7901000001                 or         byte ptr [rbx + 0x179], 1
039d2 e988000000                     jmp        0x7f56a815205f
039d7 8b38                           mov        edi, dword ptr [rax]
039d9 c1ef0d                         shr        edi, 0xd
039dc 48c1e70a                       shl        rdi, 0xa
039e0 41ba000000ad                   mov        r10d, 0xad000000
039e6 4903fa                         add        rdi, r10
039e9 41ba31000000                   mov        r10d, 0x31
039ef 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
039f3 7436                           je         0x7f56a815202b
039f5 4983c202                       add        r10, 2
039f9 4983fa35                       cmp        r10, 0x35
039fd 75f0                           jne        0x7f56a8151fef
039ff 41ba31000000                   mov        r10d, 0x31
03a05 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03a0a 7412                           je         0x7f56a815201e
03a0c 4983c202                       add        r10, 2
03a10 4983fa35                       cmp        r10, 0x35
03a14 75ef                           jne        0x7f56a8152005
03a16 41ba30000000                   mov        r10d, 0x30
03a1c eb11                           jmp        0x7f56a815202f
03a1e 50                             push       rax
03a1f 4833c0                         xor        rax, rax
03a22 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
03a28 58                             pop        rax
03a29 ebbe                           jmp        0x7f56a8151fe9
03a2b 4983c201                       add        r10, 1
03a2f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03a34 48bf00b414ad00000000           movabs     rdi, 0xad14b400
03a3e 8b18                           mov        ebx, dword ptr [rax]
03a40 c1eb0d                         shr        ebx, 0xd
03a43 48c1e30a                       shl        rbx, 0xa
03a47 41ba000000ad                   mov        r10d, 0xad000000
03a4d 4903da                         add        rbx, r10
03a50 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
03a54 0f850f190000                   jne        0x7f56a8153969
03a5a e900000000                     jmp        0x7f56a815205f
03a5f 488bf8                         mov        rdi, rax
03a62 4889bc2410020000               mov        qword ptr [rsp + 0x210], rdi
03a6a 483b07                         cmp        rax, qword ptr [rdi]
03a6d 488bf7                         mov        rsi, rdi
03a70 48bb00c0639c567f0000           movabs     rbx, 0x7f569c63c000
03a7a 8b36                           mov        esi, dword ptr [rsi]
03a7c c1ee0d                         shr        esi, 0xd
03a7f 48c1e60a                       shl        rsi, 0xa
03a83 41ba000000ad                   mov        r10d, 0xad000000
03a89 4903f2                         add        rsi, r10
03a8c 41babd000000                   mov        r10d, 0xbd
03a92 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03a96 743c                           je         0x7f56a81520d4
03a98 4983c202                       add        r10, 2
03a9c 4981fac1000000                 cmp        r10, 0xc1
03aa3 75ed                           jne        0x7f56a8152092
03aa5 41babd000000                   mov        r10d, 0xbd
03aab 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03ab0 7415                           je         0x7f56a81520c7
03ab2 4983c202                       add        r10, 2
03ab6 4981fac1000000                 cmp        r10, 0xc1
03abd 75ec                           jne        0x7f56a81520ab
03abf 41babc000000                   mov        r10d, 0xbc
03ac5 eb11                           jmp        0x7f56a81520d8
03ac7 50                             push       rax
03ac8 4833c0                         xor        rax, rax
03acb f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
03ad1 58                             pop        rax
03ad2 ebb8                           jmp        0x7f56a815208c
03ad4 4983c201                       add        r10, 1
03ad8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03add 48bef0c76d9c567f0000           movabs     rsi, 0x7f569c6dc7f0
03ae7 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
03aea 83c302                         add        ebx, 2
03aed 895e78                         mov        dword ptr [rsi + 0x78], ebx
03af0 81e3feff1f00                   and        ebx, 0x1ffffe
03af6 85db                           test       ebx, ebx
03af8 0f84a1180000                   je         0x7f56a815399f
03afe 488bf7                         mov        rsi, rdi
03b01 48bbf0c76d9c567f0000           movabs     rbx, 0x7f569c6dc7f0
03b0b 8b36                           mov        esi, dword ptr [rsi]
03b0d c1ee0d                         shr        esi, 0xd
03b10 48c1e60a                       shl        rsi, 0xa
03b14 41ba000000ad                   mov        r10d, 0xad000000
03b1a 4903f2                         add        rsi, r10
03b1d 41ba17000000                   mov        r10d, 0x17
03b23 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03b27 7436                           je         0x7f56a815215f
03b29 4983c202                       add        r10, 2
03b2d 4983fa1b                       cmp        r10, 0x1b
03b31 75f0                           jne        0x7f56a8152123
03b33 41ba17000000                   mov        r10d, 0x17
03b39 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03b3e 7412                           je         0x7f56a8152152
03b40 4983c202                       add        r10, 2
03b44 4983fa1b                       cmp        r10, 0x1b
03b48 75ef                           jne        0x7f56a8152139
03b4a 41ba16000000                   mov        r10d, 0x16
03b50 eb11                           jmp        0x7f56a8152163
03b52 50                             push       rax
03b53 4833c0                         xor        rax, rax
03b56 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
03b5c 58                             pop        rax
03b5d ebbe                           jmp        0x7f56a815211d
03b5f 4983c201                       add        r10, 1
03b63 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03b68 488bf7                         mov        rsi, rdi
03b6b 90                             nop        
03b6c 90                             nop        
03b6d 48b8308d687c567f0000           movabs     rax, 0x7f567c688d30
03b77 e8e4d55d07                     call       0x7f56af72f760
03b7c 0f1f8400743c0018               nop        dword ptr [rax + rax + 0x18003c74]
03b84 48bef0c76d9c567f0000           movabs     rsi, 0x7f569c6dc7f0
03b8e 488386e000000001               add        qword ptr [rsi + 0xe0], 1
03b96 48bef0b06d9c567f0000           movabs     rsi, 0x7f569c6db0f0
03ba0 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
03ba3 83c702                         add        edi, 2
03ba6 897e78                         mov        dword ptr [rsi + 0x78], edi
03ba9 81e7feff1f00                   and        edi, 0x1ffffe
03baf 85ff                           test       edi, edi
03bb1 0f8409180000                   je         0x7f56a81539c0
03bb7 8b9c240c020000                 mov        ebx, dword ptr [rsp + 0x20c]
03bbe 8bbc24d0010000                 mov        edi, dword ptr [rsp + 0x1d0]
03bc5 48bef0b06d9c567f0000           movabs     rsi, 0x7f569c6db0f0
03bcf 4883861001000001               add        qword ptr [rsi + 0x110], 1
03bd7 ffc8                           dec        eax
03bd9 2bd8                           sub        ebx, eax
03bdb 48be80a76d9c567f0000           movabs     rsi, 0x7f569c6da780
03be5 8b4678                         mov        eax, dword ptr [rsi + 0x78]
03be8 83c002                         add        eax, 2
03beb 894678                         mov        dword ptr [rsi + 0x78], eax
03bee 25feff1f00                     and        eax, 0x1ffffe
03bf3 85c0                           test       eax, eax
03bf5 0f84e6170000                   je         0x7f56a81539e1
03bfb 48be80a76d9c567f0000           movabs     rsi, 0x7f569c6da780
03c05 488386b000000001               add        qword ptr [rsi + 0xb0], 1
03c0d 48be0000000000000000           movabs     rsi, 0
03c17 be00000000                     mov        esi, 0
03c1c 3bfe                           cmp        edi, esi
03c1e 0f8cde170000                   jl         0x7f56a8153a02
03c24 3bfb                           cmp        edi, ebx
03c26 0f8df7170000                   jge        0x7f56a8153a23
03c2c 488bdf                         mov        rbx, rdi
03c2f 899c2418020000                 mov        dword ptr [rsp + 0x218], ebx
03c36 89bc24d0010000                 mov        dword ptr [rsp + 0x1d0], edi
03c3d 488bbc2410020000               mov        rdi, qword ptr [rsp + 0x210]
03c45 488bf7                         mov        rsi, rdi
03c48 48b9f0c76d9c567f0000           movabs     rcx, 0x7f569c6dc7f0
03c52 8b36                           mov        esi, dword ptr [rsi]
03c54 c1ee0d                         shr        esi, 0xd
03c57 48c1e60a                       shl        rsi, 0xa
03c5b 41ba000000ad                   mov        r10d, 0xad000000
03c61 4903f2                         add        rsi, r10
03c64 41ba1f000000                   mov        r10d, 0x1f
03c6a 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
03c6e 7436                           je         0x7f56a81522a6
03c70 4983c202                       add        r10, 2
03c74 4983fa23                       cmp        r10, 0x23
03c78 75f0                           jne        0x7f56a815226a
03c7a 41ba1f000000                   mov        r10d, 0x1f
03c80 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03c85 7412                           je         0x7f56a8152299
03c87 4983c202                       add        r10, 2
03c8b 4983fa23                       cmp        r10, 0x23
03c8f 75ef                           jne        0x7f56a8152280
03c91 41ba1e000000                   mov        r10d, 0x1e
03c97 eb11                           jmp        0x7f56a81522aa
03c99 50                             push       rax
03c9a 4833c0                         xor        rax, rax
03c9d f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
03ca3 58                             pop        rax
03ca4 ebbe                           jmp        0x7f56a8152264
03ca6 4983c201                       add        r10, 1
03caa 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03caf 488bf7                         mov        rsi, rdi
03cb2 90                             nop        
03cb3 90                             nop        
03cb4 90                             nop        
03cb5 48b8588d687c567f0000           movabs     rax, 0x7f567c688d58
03cbf e89cd45d07                     call       0x7f56af72f760
03cc4 0f1f8400bc3d0019               nop        dword ptr [rax + rax + 0x19003dbc]
03ccc 483b00                         cmp        rax, qword ptr [rax]
03ccf 488bf0                         mov        rsi, rax
03cd2 48baf0c76d9c567f0000           movabs     rdx, 0x7f569c6dc7f0
03cdc 8b36                           mov        esi, dword ptr [rsi]
03cde c1ee0d                         shr        esi, 0xd
03ce1 48c1e60a                       shl        rsi, 0xa
03ce5 41ba000000ad                   mov        r10d, 0xad000000
03ceb 4903f2                         add        rsi, r10
03cee 41ba25000000                   mov        r10d, 0x25
03cf4 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03cf8 7436                           je         0x7f56a8152330
03cfa 4983c202                       add        r10, 2
03cfe 4983fa29                       cmp        r10, 0x29
03d02 75f0                           jne        0x7f56a81522f4
03d04 41ba25000000                   mov        r10d, 0x25
03d0a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03d0f 7412                           je         0x7f56a8152323
03d11 4983c202                       add        r10, 2
03d15 4983fa29                       cmp        r10, 0x29
03d19 75ef                           jne        0x7f56a815230a
03d1b 41ba24000000                   mov        r10d, 0x24
03d21 eb11                           jmp        0x7f56a8152334
03d23 50                             push       rax
03d24 4833c0                         xor        rax, rax
03d27 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03d2d 58                             pop        rax
03d2e ebbe                           jmp        0x7f56a81522ee
03d30 4983c201                       add        r10, 1
03d34 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03d39 8b7024                         mov        esi, dword ptr [rax + 0x24]
03d3c 4c3b25d5f92f20                 cmp        r12, qword ptr [rip + 0x202ff9d5]
03d43 0f8414000000                   je         0x7f56a815235d
03d49 48bf384352c6567f0000           movabs     rdi, 0x7f56c6524338
03d53 4883e4f0                       and        rsp, 0xfffffffffffffff0
03d57 e884e16c1f                     call       0x7f56c78204e0
03d5c f4                             hlt        
03d5d 488bd0                         mov        rdx, rax
03d60 48b9f0c76d9c567f0000           movabs     rcx, 0x7f569c6dc7f0
03d6a 8b12                           mov        edx, dword ptr [rdx]
03d6c c1ea0d                         shr        edx, 0xd
03d6f 48c1e20a                       shl        rdx, 0xa
03d73 41ba000000ad                   mov        r10d, 0xad000000
03d79 4903d2                         add        rdx, r10
03d7c 41ba2b000000                   mov        r10d, 0x2b
03d82 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03d86 7436                           je         0x7f56a81523be
03d88 4983c202                       add        r10, 2
03d8c 4983fa2f                       cmp        r10, 0x2f
03d90 75f0                           jne        0x7f56a8152382
03d92 41ba2b000000                   mov        r10d, 0x2b
03d98 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03d9d 7412                           je         0x7f56a81523b1
03d9f 4983c202                       add        r10, 2
03da3 4983fa2f                       cmp        r10, 0x2f
03da7 75ef                           jne        0x7f56a8152398
03da9 41ba2a000000                   mov        r10d, 0x2a
03daf eb11                           jmp        0x7f56a81523c2
03db1 50                             push       rax
03db2 4833c0                         xor        rax, rax
03db5 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03dbb 58                             pop        rax
03dbc ebbe                           jmp        0x7f56a815237c
03dbe 4983c201                       add        r10, 1
03dc2 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03dc7 8b4804                         mov        ecx, dword ptr [rax + 4]
03dca 48baf0c76d9c567f0000           movabs     rdx, 0x7f569c6dc7f0
03dd4 4883828001000001               add        qword ptr [rdx + 0x180], 1
03ddc 48ba38b36d9c567f0000           movabs     rdx, 0x7f569c6db338
03de6 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
03dea 4183c002                       add        r8d, 2
03dee 44894278                       mov        dword ptr [rdx + 0x78], r8d
03df2 4181e0feff1f00                 and        r8d, 0x1ffffe
03df9 4585c0                         test       r8d, r8d
03dfc 0f845b160000                   je         0x7f56a8153a5d
03e02 48baf0c76d9c567f0000           movabs     rdx, 0x7f569c6dc7f0
03e0c 4883829001000001               add        qword ptr [rdx + 0x190], 1
03e14 8b9c2418020000                 mov        ebx, dword ptr [rsp + 0x218]
03e1b 4863db                         movsxd     rbx, ebx
03e1e ba08000000                     mov        edx, 8
03e23 4c8bcb                         mov        r9, rbx
03e26 4c03ca                         add        r9, rdx
03e29 48bac0a46d9c567f0000           movabs     rdx, 0x7f569c6da4c0
03e33 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
03e37 4183c002                       add        r8d, 2
03e3b 44894278                       mov        dword ptr [rdx + 0x78], r8d
03e3f 4181e0feff1f00                 and        r8d, 0x1ffffe
03e46 4585c0                         test       r8d, r8d
03e49 0f842f160000                   je         0x7f56a8153a7e
03e4f 48bac0a46d9c567f0000           movabs     rdx, 0x7f569c6da4c0
03e59 488382e000000001               add        qword ptr [rdx + 0xe0], 1
03e61 48ba40a66d9c567f0000           movabs     rdx, 0x7f569c6da640
03e6b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
03e6f 4183c002                       add        r8d, 2
03e73 44894278                       mov        dword ptr [rdx + 0x78], r8d
03e77 4181e0feff1f00                 and        r8d, 0x1ffffe
03e7e 4585c0                         test       r8d, r8d
03e81 0f8418160000                   je         0x7f56a8153a9f
03e87 48baf0c76d9c567f0000           movabs     rdx, 0x7f569c6dc7f0
03e91 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
03e99 48ba707d7be200000000           movabs     rdx, 0xe27b7d70
03ea3 ba02000000                     mov        edx, 2
03ea8 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
03eb0 bf00000000                     mov        edi, 0
03eb5 488b842410020000               mov        rax, qword ptr [rsp + 0x210]
03ebd 48890424                       mov        qword ptr [rsp], rax
03ec1 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03ec9 4889442408                     mov        qword ptr [rsp + 8], rax
03ece 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
03ed3 49ba707d7be200000000           movabs     r10, 0xe27b7d70
03edd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03ee2 90                             nop        
03ee3 90                             nop        
03ee4 90                             nop        
03ee5 90                             nop        
03ee6 90                             nop        
03ee7 e874d75d07                     call       0x7f56af72fc60
03eec 0f1f8400e43f001a               nop        dword ptr [rax + rax + 0x1a003fe4]
03ef4 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
03efb 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
03f03 4103d8                         add        ebx, r8d
03f06 48be00c0639c567f0000           movabs     rsi, 0x7f569c63c000
03f10 ff8610060000                   inc        dword ptr [rsi + 0x610]
03f16 8bb424d4010000                 mov        esi, dword ptr [rsp + 0x1d4]
03f1d 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
03f27 ff8208080000                   inc        dword ptr [rdx + 0x808]
03f2d 488bc3                         mov        rax, rbx
03f30 8b942444010000                 mov        edx, dword ptr [rsp + 0x144]
03f37 ffc2                           inc        edx
03f39 48b900c0639c567f0000           movabs     rcx, 0x7f569c63c000
03f43 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
03f47 4183c002                       add        r8d, 2
03f4b 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
03f4f 4181e0fe3f0000                 and        r8d, 0x3ffe
03f56 4585c0                         test       r8d, r8d
03f59 0f8461150000                   je         0x7f56a8153ac0
03f5f 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03f63 418502                         test       dword ptr [r10], eax
03f66 48b900c0639c567f0000           movabs     rcx, 0x7f569c63c000
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
03fad e95ec3ffff                     jmp        0x7f56a814e910
03fb2 4c8bc8                         mov        r9, rax
03fb5 4585c9                         test       r9d, r9d
03fb8 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
03fc2 b988030000                     mov        ecx, 0x388
03fc7 7e05                           jle        0x7f56a81525ce
03fc9 b998030000                     mov        ecx, 0x398
03fce 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
03fd2 4d8d4001                       lea        r8, [r8 + 1]
03fd6 4c89040a                       mov        qword ptr [rdx + rcx], r8
03fda 0f8ec2010000                   jle        0x7f56a81527a2
03fe0 488b9c2498010000               mov        rbx, qword ptr [rsp + 0x198]
03fe8 482bf3                         sub        rsi, rbx
03feb ba00000000                     mov        edx, 0
03ff0 483bf2                         cmp        rsi, rdx
03ff3 48be00c0639c567f0000           movabs     rsi, 0x7f569c63c000
03ffd baa8030000                     mov        edx, 0x3a8
04002 7d05                           jge        0x7f56a8152609
04004 bab8030000                     mov        edx, 0x3b8
04009 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0400d 488d4901                       lea        rcx, [rcx + 1]
04011 48890c16                       mov        qword ptr [rsi + rdx], rcx
04015 0f8d87010000                   jge        0x7f56a81527a2
0401b 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
04023 488b5630                       mov        rdx, qword ptr [rsi + 0x30]
04027 be00000000                     mov        esi, 0
0402c 483bd6                         cmp        rdx, rsi
0402f 48be00c0639c567f0000           movabs     rsi, 0x7f569c63c000
04039 bac8030000                     mov        edx, 0x3c8
0403e 7505                           jne        0x7f56a8152645
04040 bad8030000                     mov        edx, 0x3d8
04045 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
04049 488d4901                       lea        rcx, [rcx + 1]
0404d 48890c16                       mov        qword ptr [rsi + rdx], rcx
04051 0f854b010000                   jne        0x7f56a81527a2
04057 e950010000                     jmp        0x7f56a81527ac
0405c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
04064 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0406c 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
04074 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
0407b 488bce                         mov        rcx, rsi
0407e 8bb42434010000                 mov        esi, dword ptr [rsp + 0x134]
04085 488bde                         mov        rbx, rsi
04088 2bd9                           sub        ebx, ecx
0408a 48be00c0639c567f0000           movabs     rsi, 0x7f569c63c000
04094 4883864808000001               add        qword ptr [rsi + 0x848], 1
0409c 488bf2                         mov        rsi, rdx
0409f 488bd1                         mov        rdx, rcx
040a2 488bc8                         mov        rcx, rax
040a5 4d8bc3                         mov        r8, r11
040a8 4c8bcb                         mov        r9, rbx
040ab 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
040b3 899c241c020000                 mov        dword ptr [rsp + 0x21c], ebx
040ba 4885c9                         test       rcx, rcx
040bd 0f841e140000                   je         0x7f56a8153ae1
040c3 85d2                           test       edx, edx
040c5 0f8c16140000                   jl         0x7f56a8153ae1
040cb 4585c0                         test       r8d, r8d
040ce 0f8c0d140000                   jl         0x7f56a8153ae1
040d4 4a8d3c0a                       lea        rdi, [rdx + r9]
040d8 3b7e04                         cmp        edi, dword ptr [rsi + 4]
040db 0f8700140000                   ja         0x7f56a8153ae1
040e1 4b8d3c08                       lea        rdi, [r8 + r9]
040e5 3b7904                         cmp        edi, dword ptr [rcx + 4]
040e8 0f87f3130000                   ja         0x7f56a8153ae1
040ee 4585c9                         test       r9d, r9d
040f1 0f8cea130000                   jl         0x7f56a8153ae1
040f7 4863d2                         movsxd     rdx, edx
040fa 4d63c0                         movsxd     r8, r8d
040fd 48bf001404ad00000000           movabs     rdi, 0xad041400
04107 41ba000000ad                   mov        r10d, 0xad000000
0410d 492bfa                         sub        rdi, r10
04110 48c1ef0a                       shr        rdi, 0xa
04114 448b19                         mov        r11d, dword ptr [rcx]
04117 41c1eb0d                       shr        r11d, 0xd
0411b 413bfb                         cmp        edi, r11d
0411e 0f8510000000                   jne        0x7f56a8152734
04124 448b1e                         mov        r11d, dword ptr [rsi]
04127 41c1eb0d                       shr        r11d, 0xd
0412b 413bfb                         cmp        edi, r11d
0412e 0f8414000000                   je         0x7f56a8152748
04134 48bf88b54bc6567f0000           movabs     rdi, 0x7f56c64bb588
0413e 4883e4f0                       and        rsp, 0xfffffffffffffff0
04142 e899dd6c1f                     call       0x7f56c78204e0
04147 f4                             hlt        
04148 488d7c1608                     lea        rdi, [rsi + rdx + 8]
0414d 4a8d740108                     lea        rsi, [rcx + r8 + 8]
04152 498bd1                         mov        rdx, r9
04155 40f6c40f                       test       spl, 0xf
04159 0f8412000000                   je         0x7f56a8152771
0415f 4883ec08                       sub        rsp, 8
04163 e8d8695c07                     call       0x7f56af719140
04168 4883c408                       add        rsp, 8
0416c e905000000                     jmp        0x7f56a8152776
04171 e8ca695c07                     call       0x7f56af719140
04176 8b9c241c020000                 mov        ebx, dword ptr [rsp + 0x21c]
0417d 039c2474010000                 add        ebx, dword ptr [rsp + 0x174]
04184 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
0418c 895e38                         mov        dword ptr [rsi + 0x38], ebx
0418f 4881c450020000                 add        rsp, 0x250
04196 5d                             pop        rbp
04197 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0419b 0f8750130000                   ja         0x7f56a8153af1
041a1 c3                             ret        
041a2 bb02000000                     mov        ebx, 2
041a7 e915000000                     jmp        0x7f56a81527c1
041ac 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
041b6 ff82e8030000                   inc        dword ptr [rdx + 0x3e8]
041bc bb08000000                     mov        ebx, 8
041c1 899c2428020000                 mov        dword ptr [rsp + 0x228], ebx
041c8 e949130000                     jmp        0x7f56a8153b16
041cd 90                             nop        
041ce 90                             nop        
041cf 90                             nop        
041d0 90                             nop        
041d1 90                             nop        
041d2 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
041d9 0f855a130000                   jne        0x7f56a8153b39
041df 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
041e6 488d7820                       lea        rdi, [rax + 0x20]
041ea 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
041f1 0f8742130000                   ja         0x7f56a8153b39
041f7 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
041fe 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
04205 488908                         mov        qword ptr [rax], rcx
04208 4833c9                         xor        rcx, rcx
0420b 48894808                       mov        qword ptr [rax + 8], rcx
0420f 48894810                       mov        qword ptr [rax + 0x10], rcx
04213 48894818                       mov        qword ptr [rax + 0x18], rcx
04217 90                             nop        
04218 e938130000                     jmp        0x7f56a8153b55
0421d 90                             nop        
0421e 90                             nop        
0421f 90                             nop        
04220 90                             nop        
04221 90                             nop        
04222 498bf1                         mov        rsi, r9
04225 4889842420020000               mov        qword ptr [rsp + 0x220], rax
0422d 90                             nop        
0422e 90                             nop        
0422f e82cd45d07                     call       0x7f56af72fc60
04234 0f1f84002c43001c               nop        dword ptr [rax + rax + 0x1c00432c]
0423c 48ba00c0639c567f0000           movabs     rdx, 0x7f569c63c000
04246 488d9210040000                 lea        rdx, [rdx + 0x410]
0424d 4885c0                         test       rax, rax
04250 750e                           jne        0x7f56a8152860
04252 f60201                         test       byte ptr [rdx], 1
04255 0f8505000000                   jne        0x7f56a8152860
0425b f048830a01                     lock or    qword ptr [rdx], 1
04260 488b942420020000               mov        rdx, qword ptr [rsp + 0x220]
04268 48b900c0639c567f0000           movabs     rcx, 0x7f569c63c000
04272 4883812004000001               add        qword ptr [rcx + 0x420], 1
0427a 8b942428020000                 mov        edx, dword ptr [rsp + 0x228]
04281 488bc8                         mov        rcx, rax
04284 488bb42420020000               mov        rsi, qword ptr [rsp + 0x220]
0428c 90                             nop        
0428d 90                             nop        
0428e 90                             nop        
0428f e8ccc95d07                     call       0x7f56af72f260
04294 0f1f84008c43001d               nop        dword ptr [rax + rax + 0x1d00438c]
0429c 488b842420020000               mov        rax, qword ptr [rsp + 0x220]
042a4 e951130000                     jmp        0x7f56a8153bfa
042a9 90                             nop        
042aa 90                             nop        
042ab 90                             nop        
042ac 90                             nop        
042ad 90                             nop        
042ae 90                             nop        
042af 90                             nop        
042b0 e9b9120000                     jmp        0x7f56a8153b6e
042b5 90                             nop        
042b6 90                             nop        
042b7 90                             nop        
042b8 90                             nop        
042b9 90                             nop        
042ba 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
042c1 0f85ca120000                   jne        0x7f56a8153b91
042c7 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
042ce 488d7820                       lea        rdi, [rax + 0x20]
042d2 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
042d9 0f87b2120000                   ja         0x7f56a8153b91
042df 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
042e6 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
042ed 488908                         mov        qword ptr [rax], rcx
042f0 4833c9                         xor        rcx, rcx
042f3 48894808                       mov        qword ptr [rax + 8], rcx
042f7 48894810                       mov        qword ptr [rax + 0x10], rcx
042fb 48894818                       mov        qword ptr [rax + 0x18], rcx
042ff 488bd0                         mov        rdx, rax
04302 48b900c0639c567f0000           movabs     rcx, 0x7f569c63c000
0430c 4883815802000001               add        qword ptr [rcx + 0x258], 1
04314 ba02000000                     mov        edx, 2
04319 48b9586126e200000000           movabs     rcx, 0xe2266158
04323 488bf0                         mov        rsi, rax
04326 4889842430020000               mov        qword ptr [rsp + 0x230], rax
0432e 90                             nop        
0432f e82cc95d07                     call       0x7f56af72f260
04334 0f1f84002c44001e               nop        dword ptr [rax + rax + 0x1e00442c]
0433c 488b842430020000               mov        rax, qword ptr [rsp + 0x230]
04344 e9b1120000                     jmp        0x7f56a8153bfa
04349 90                             nop        
0434a 90                             nop        
0434b 90                             nop        
0434c 90                             nop        
0434d 90                             nop        
0434e 90                             nop        
0434f 90                             nop        
04350 e958120000                     jmp        0x7f56a8153bad
04355 90                             nop        
04356 90                             nop        
04357 90                             nop        
04358 90                             nop        
04359 90                             nop        
0435a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04361 0f8569120000                   jne        0x7f56a8153bd0
04367 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
0436e 488d7820                       lea        rdi, [rax + 0x20]
04372 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
04379 0f8751120000                   ja         0x7f56a8153bd0
0437f 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
04386 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0438d 488908                         mov        qword ptr [rax], rcx
04390 4833c9                         xor        rcx, rcx
04393 48894808                       mov        qword ptr [rax + 8], rcx
04397 48894810                       mov        qword ptr [rax + 0x10], rcx
0439b 48894818                       mov        qword ptr [rax + 0x18], rcx
0439f 488bd0                         mov        rdx, rax
043a2 48b900c0639c567f0000           movabs     rcx, 0x7f569c63c000
043ac 4883814001000001               add        qword ptr [rcx + 0x140], 1
043b4 ba05000000                     mov        edx, 5
043b9 48b9886126e200000000           movabs     rcx, 0xe2266188
043c3 488bf0                         mov        rsi, rax
043c6 4889842438020000               mov        qword ptr [rsp + 0x238], rax
043ce 90                             nop        
043cf e88cc85d07                     call       0x7f56af72f260
043d4 0f1f8400cc44001f               nop        dword ptr [rax + rax + 0x1f0044cc]
043dc 488b842438020000               mov        rax, qword ptr [rsp + 0x238]
043e4 e911120000                     jmp        0x7f56a8153bfa
043e9 49ba3004629c567f0000           movabs     r10, 0x7f569c620430
043f3 4c89542408                     mov        qword ptr [rsp + 8], r10
043f8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04400 e85bc05707                     call       0x7f56af6cea60
04405 e983bcffff                     jmp        0x7f56a814e68d
0440a 49baa8ee1a9c567f0000           movabs     r10, 0x7f569c1aeea8
04414 4c89542408                     mov        qword ptr [rsp + 8], r10
04419 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04421 e83ac05707                     call       0x7f56af6cea60
04426 e90dbeffff                     jmp        0x7f56a814e838
0442b e8b02b5807                     call       0x7f56af6d55e0
04430 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
0443a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0443e e89dda6c1f                     call       0x7f56c78204e0
04443 f4                             hlt        
04444 e8972b5807                     call       0x7f56af6d55e0
04449 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04453 4883e4f0                       and        rsp, 0xfffffffffffffff0
04457 e884da6c1f                     call       0x7f56c78204e0
0445c f4                             hlt        
0445d e87e2b5807                     call       0x7f56af6d55e0
04462 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
0446c 4883e4f0                       and        rsp, 0xfffffffffffffff0
04470 e86bda6c1f                     call       0x7f56c78204e0
04475 f4                             hlt        
04476 48891424                       mov        qword ptr [rsp], rdx
0447a 4c89442408                     mov        qword ptr [rsp + 8], r8
0447f e85c345807                     call       0x7f56af6d5ee0
04484 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
0448e 4883e4f0                       and        rsp, 0xfffffffffffffff0
04492 e849da6c1f                     call       0x7f56c78204e0
04497 f4                             hlt        
04498 e8432b5807                     call       0x7f56af6d55e0
0449d 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
044a7 4883e4f0                       and        rsp, 0xfffffffffffffff0
044ab e830da6c1f                     call       0x7f56c78204e0
044b0 f4                             hlt        
044b1 e82a2b5807                     call       0x7f56af6d55e0
044b6 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
044c0 4883e4f0                       and        rsp, 0xfffffffffffffff0
044c4 e817da6c1f                     call       0x7f56c78204e0
044c9 f4                             hlt        
044ca 48891424                       mov        qword ptr [rsp], rdx
044ce 4c894c2408                     mov        qword ptr [rsp + 8], r9
044d3 e808345807                     call       0x7f56af6d5ee0
044d8 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
044e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
044e6 e8f5d96c1f                     call       0x7f56c78204e0
044eb f4                             hlt        
044ec e8ef2a5807                     call       0x7f56af6d55e0
044f1 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
044fb 4883e4f0                       and        rsp, 0xfffffffffffffff0
044ff e8dcd96c1f                     call       0x7f56c78204e0
04504 f4                             hlt        
04505 e8d62a5807                     call       0x7f56af6d55e0
0450a 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04514 4883e4f0                       and        rsp, 0xfffffffffffffff0
04518 e8c3d96c1f                     call       0x7f56c78204e0
0451d f4                             hlt        
0451e 48c7042401000000               mov        qword ptr [rsp], 1
04526 48895c2408                     mov        qword ptr [rsp + 8], rbx
0452b e8b0335807                     call       0x7f56af6d5ee0
04530 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
0453a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0453e e89dd96c1f                     call       0x7f56c78204e0
04543 f4                             hlt        
04544 48c7042402000000               mov        qword ptr [rsp], 2
0454c 48895c2408                     mov        qword ptr [rsp + 8], rbx
04551 e88a335807                     call       0x7f56af6d5ee0
04556 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04560 4883e4f0                       and        rsp, 0xfffffffffffffff0
04564 e877d96c1f                     call       0x7f56c78204e0
04569 f4                             hlt        
0456a 49ba98ba749c567f0000           movabs     r10, 0x7f569c74ba98
04574 4c89542408                     mov        qword ptr [rsp + 8], r10
04579 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04581 e8dabe5707                     call       0x7f56af6cea60
04586 e942c2ffff                     jmp        0x7f56a814edcd
0458b 49bad04b6d9c567f0000           movabs     r10, 0x7f569c6d4bd0
04595 4c89542408                     mov        qword ptr [rsp + 8], r10
0459a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045a2 e8b9be5707                     call       0x7f56af6cea60
045a7 e9c5c2ffff                     jmp        0x7f56a814ee71
045ac 49ba90a6189c567f0000           movabs     r10, 0x7f569c18a690
045b6 4c89542408                     mov        qword ptr [rsp + 8], r10
045bb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045c3 e898be5707                     call       0x7f56af6cea60
045c8 e9eec2ffff                     jmp        0x7f56a814eebb
045cd 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
045d5 e886e15707                     call       0x7f56af6d0d60
045da 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
045e4 4883e4f0                       and        rsp, 0xfffffffffffffff0
045e8 e8f3d86c1f                     call       0x7f56c78204e0
045ed f4                             hlt        
045ee 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
045f6 e865e15707                     call       0x7f56af6d0d60
045fb 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04605 4883e4f0                       and        rsp, 0xfffffffffffffff0
04609 e8d2d86c1f                     call       0x7f56c78204e0
0460e f4                             hlt        
0460f 49ba987c7d9c567f0000           movabs     r10, 0x7f569c7d7c98
04619 4c89542408                     mov        qword ptr [rsp + 8], r10
0461e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04626 e835be5707                     call       0x7f56af6cea60
0462b e964c3ffff                     jmp        0x7f56a814ef94
04630 49bac0ee7d9c567f0000           movabs     r10, 0x7f569c7deec0
0463a 4c89542408                     mov        qword ptr [rsp + 8], r10
0463f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04647 e814be5707                     call       0x7f56af6cea60
0464c e976c3ffff                     jmp        0x7f56a814efc7
04651 49ba08b1689c567f0000           movabs     r10, 0x7f569c68b108
0465b 4c89542408                     mov        qword ptr [rsp + 8], r10
04660 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04668 e8f3bd5707                     call       0x7f56af6cea60
0466d e9ccc3ffff                     jmp        0x7f56a814f03e
04672 49ba58d6749c567f0000           movabs     r10, 0x7f569c74d658
0467c 4c89542408                     mov        qword ptr [rsp + 8], r10
04681 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04689 e8d2bd5707                     call       0x7f56af6cea60
0468e e9e2c3ffff                     jmp        0x7f56a814f075
04693 49ba086f689c567f0000           movabs     r10, 0x7f569c686f08
0469d 4c89542408                     mov        qword ptr [rsp + 8], r10
046a2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046aa e8b1bd5707                     call       0x7f56af6cea60
046af e9f9c3ffff                     jmp        0x7f56a814f0ad
046b4 49ba18f1749c567f0000           movabs     r10, 0x7f569c74f118
046be 4c89542408                     mov        qword ptr [rsp + 8], r10
046c3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046cb e890bd5707                     call       0x7f56af6cea60
046d0 e9f3c4ffff                     jmp        0x7f56a814f1c8
046d5 49ba10d44c9c567f0000           movabs     r10, 0x7f569c4cd410
046df 4c89542408                     mov        qword ptr [rsp + 8], r10
046e4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046ec e86fbd5707                     call       0x7f56af6cea60
046f1 e913c5ffff                     jmp        0x7f56a814f209
046f6 49baa0913f9c567f0000           movabs     r10, 0x7f569c3f91a0
04700 4c89542408                     mov        qword ptr [rsp + 8], r10
04705 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0470d e84ebd5707                     call       0x7f56af6cea60
04712 e925c5ffff                     jmp        0x7f56a814f23c
04717 48890424                       mov        qword ptr [rsp], rax
0471b e840fb5707                     call       0x7f56af6d2860
04720 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
0472a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0472e e8add76c1f                     call       0x7f56c78204e0
04733 f4                             hlt        
04734 e8a7285807                     call       0x7f56af6d55e0
04739 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04743 4883e4f0                       and        rsp, 0xfffffffffffffff0
04747 e894d76c1f                     call       0x7f56c78204e0
0474c f4                             hlt        
0474d 49ba18c9749c567f0000           movabs     r10, 0x7f569c74c918
04757 4c89542408                     mov        qword ptr [rsp + 8], r10
0475c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04764 e8f7bc5707                     call       0x7f56af6cea60
04769 e980c6ffff                     jmp        0x7f56a814f3ee
0476e e86d285807                     call       0x7f56af6d55e0
04773 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
0477d 4883e4f0                       and        rsp, 0xfffffffffffffff0
04781 e85ad76c1f                     call       0x7f56c78204e0
04786 f4                             hlt        
04787 49bad04b6d9c567f0000           movabs     r10, 0x7f569c6d4bd0
04791 4c89542408                     mov        qword ptr [rsp + 8], r10
04796 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0479e e8bdbc5707                     call       0x7f56af6cea60
047a3 e90ac7ffff                     jmp        0x7f56a814f4b2
047a8 49ba90a6189c567f0000           movabs     r10, 0x7f569c18a690
047b2 4c89542408                     mov        qword ptr [rsp + 8], r10
047b7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047bf e89cbc5707                     call       0x7f56af6cea60
047c4 e927c7ffff                     jmp        0x7f56a814f4f0
047c9 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
047d1 e88adf5707                     call       0x7f56af6d0d60
047d6 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
047e0 4883e4f0                       and        rsp, 0xfffffffffffffff0
047e4 e8f7d66c1f                     call       0x7f56c78204e0
047e9 f4                             hlt        
047ea 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
047f2 e869df5707                     call       0x7f56af6d0d60
047f7 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04801 4883e4f0                       and        rsp, 0xfffffffffffffff0
04805 e8d6d66c1f                     call       0x7f56c78204e0
0480a f4                             hlt        
0480b e8d0275807                     call       0x7f56af6d55e0
04810 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
0481a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0481e e8bdd66c1f                     call       0x7f56c78204e0
04823 f4                             hlt        
04824 49ba18f1749c567f0000           movabs     r10, 0x7f569c74f118
0482e 4c89542408                     mov        qword ptr [rsp + 8], r10
04833 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0483b e820bc5707                     call       0x7f56af6cea60
04840 e9b5c8ffff                     jmp        0x7f56a814f6fa
04845 49ba10d44c9c567f0000           movabs     r10, 0x7f569c4cd410
0484f 4c89542408                     mov        qword ptr [rsp + 8], r10
04854 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0485c e8ffbb5707                     call       0x7f56af6cea60
04861 e9e1c8ffff                     jmp        0x7f56a814f747
04866 49baa0913f9c567f0000           movabs     r10, 0x7f569c3f91a0
04870 4c89542408                     mov        qword ptr [rsp + 8], r10
04875 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0487d e8debb5707                     call       0x7f56af6cea60
04882 e9f8c8ffff                     jmp        0x7f56a814f77f
04887 49ba98ba749c567f0000           movabs     r10, 0x7f569c74ba98
04891 4c89542408                     mov        qword ptr [rsp + 8], r10
04896 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0489e e8bdbb5707                     call       0x7f56af6cea60
048a3 e9f7c9ffff                     jmp        0x7f56a814f89f
048a8 49bad04b6d9c567f0000           movabs     r10, 0x7f569c6d4bd0
048b2 4c89542408                     mov        qword ptr [rsp + 8], r10
048b7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048bf e89cbb5707                     call       0x7f56af6cea60
048c4 e97fcaffff                     jmp        0x7f56a814f948
048c9 49ba90a6189c567f0000           movabs     r10, 0x7f569c18a690
048d3 4c89542408                     mov        qword ptr [rsp + 8], r10
048d8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048e0 e87bbb5707                     call       0x7f56af6cea60
048e5 e99ccaffff                     jmp        0x7f56a814f986
048ea 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
048f2 e869de5707                     call       0x7f56af6d0d60
048f7 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04901 4883e4f0                       and        rsp, 0xfffffffffffffff0
04905 e8d6d56c1f                     call       0x7f56c78204e0
0490a f4                             hlt        
0490b 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04913 e848de5707                     call       0x7f56af6d0d60
04918 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04922 4883e4f0                       and        rsp, 0xfffffffffffffff0
04926 e8b5d56c1f                     call       0x7f56c78204e0
0492b f4                             hlt        
0492c 49ba987c7d9c567f0000           movabs     r10, 0x7f569c7d7c98
04936 4c89542408                     mov        qword ptr [rsp + 8], r10
0493b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04943 e818bb5707                     call       0x7f56af6cea60
04948 e912cbffff                     jmp        0x7f56a814fa5f
0494d 49bac0ee7d9c567f0000           movabs     r10, 0x7f569c7deec0
04957 4c89542408                     mov        qword ptr [rsp + 8], r10
0495c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04964 e8f7ba5707                     call       0x7f56af6cea60
04969 e929cbffff                     jmp        0x7f56a814fa97
0496e 49ba08b1689c567f0000           movabs     r10, 0x7f569c68b108
04978 4c89542408                     mov        qword ptr [rsp + 8], r10
0497d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04985 e8d6ba5707                     call       0x7f56af6cea60
0498a e968cbffff                     jmp        0x7f56a814faf7
0498f 49ba58d6749c567f0000           movabs     r10, 0x7f569c74d658
04999 4c89542408                     mov        qword ptr [rsp + 8], r10
0499e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049a6 e8b5ba5707                     call       0x7f56af6cea60
049ab e97fcbffff                     jmp        0x7f56a814fb2f
049b0 49ba086f689c567f0000           movabs     r10, 0x7f569c686f08
049ba 4c89542408                     mov        qword ptr [rsp + 8], r10
049bf 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049c7 e894ba5707                     call       0x7f56af6cea60
049cc e996cbffff                     jmp        0x7f56a814fb67
049d1 49ba18f1749c567f0000           movabs     r10, 0x7f569c74f118
049db 4c89542408                     mov        qword ptr [rsp + 8], r10
049e0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049e8 e873ba5707                     call       0x7f56af6cea60
049ed e98cccffff                     jmp        0x7f56a814fc7e
049f2 49ba10d44c9c567f0000           movabs     r10, 0x7f569c4cd410
049fc 4c89542408                     mov        qword ptr [rsp + 8], r10
04a01 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a09 e852ba5707                     call       0x7f56af6cea60
04a0e e9b1ccffff                     jmp        0x7f56a814fcc4
04a13 49baa0913f9c567f0000           movabs     r10, 0x7f569c3f91a0
04a1d 4c89542408                     mov        qword ptr [rsp + 8], r10
04a22 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a2a e831ba5707                     call       0x7f56af6cea60
04a2f e9c8ccffff                     jmp        0x7f56a814fcfc
04a34 48890424                       mov        qword ptr [rsp], rax
04a38 e823f85707                     call       0x7f56af6d2860
04a3d 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04a47 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a4b e890d46c1f                     call       0x7f56c78204e0
04a50 f4                             hlt        
04a51 e88a255807                     call       0x7f56af6d55e0
04a56 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04a60 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a64 e877d46c1f                     call       0x7f56c78204e0
04a69 f4                             hlt        
04a6a 49ba18c9749c567f0000           movabs     r10, 0x7f569c74c918
04a74 4c89542408                     mov        qword ptr [rsp + 8], r10
04a79 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a81 e8dab95707                     call       0x7f56af6cea60
04a86 e92bceffff                     jmp        0x7f56a814feb6
04a8b e850255807                     call       0x7f56af6d55e0
04a90 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04a9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a9e e83dd46c1f                     call       0x7f56c78204e0
04aa3 f4                             hlt        
04aa4 49bad04b6d9c567f0000           movabs     r10, 0x7f569c6d4bd0
04aae 4c89542408                     mov        qword ptr [rsp + 8], r10
04ab3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04abb e8a0b95707                     call       0x7f56af6cea60
04ac0 e9b5ceffff                     jmp        0x7f56a814ff7a
04ac5 49ba90a6189c567f0000           movabs     r10, 0x7f569c18a690
04acf 4c89542408                     mov        qword ptr [rsp + 8], r10
04ad4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04adc e87fb95707                     call       0x7f56af6cea60
04ae1 e9d2ceffff                     jmp        0x7f56a814ffb8
04ae6 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04aee e86ddc5707                     call       0x7f56af6d0d60
04af3 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04afd 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b01 e8dad36c1f                     call       0x7f56c78204e0
04b06 f4                             hlt        
04b07 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04b0f e84cdc5707                     call       0x7f56af6d0d60
04b14 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04b1e 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b22 e8b9d36c1f                     call       0x7f56c78204e0
04b27 f4                             hlt        
04b28 e8b3245807                     call       0x7f56af6d55e0
04b2d 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04b37 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b3b e8a0d36c1f                     call       0x7f56c78204e0
04b40 f4                             hlt        
04b41 49ba18f1749c567f0000           movabs     r10, 0x7f569c74f118
04b4b 4c89542408                     mov        qword ptr [rsp + 8], r10
04b50 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b58 e803b95707                     call       0x7f56af6cea60
04b5d e960d0ffff                     jmp        0x7f56a81501c2
04b62 49ba10d44c9c567f0000           movabs     r10, 0x7f569c4cd410
04b6c 4c89542408                     mov        qword ptr [rsp + 8], r10
04b71 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b79 e8e2b85707                     call       0x7f56af6cea60
04b7e e98cd0ffff                     jmp        0x7f56a815020f
04b83 49baa0913f9c567f0000           movabs     r10, 0x7f569c3f91a0
04b8d 4c89542408                     mov        qword ptr [rsp + 8], r10
04b92 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b9a e8c1b85707                     call       0x7f56af6cea60
04b9f e9a3d0ffff                     jmp        0x7f56a8150247
04ba4 49ba3004629c567f0000           movabs     r10, 0x7f569c620430
04bae 4c89542408                     mov        qword ptr [rsp + 8], r10
04bb3 48c704240a020000               mov        qword ptr [rsp], 0x20a
04bbb e8a0b85707                     call       0x7f56af6cea60
04bc0 e948d1ffff                     jmp        0x7f56a815030d
04bc5 90                             nop        
04bc6 90                             nop        
04bc7 e894ca5d07                     call       0x7f56af72fc60
04bcc e978d2ffff                     jmp        0x7f56a8150449
04bd1 90                             nop        
04bd2 90                             nop        
04bd3 90                             nop        
04bd4 90                             nop        
04bd5 90                             nop        
04bd6 90                             nop        
04bd7 e884ca5d07                     call       0x7f56af72fc60
04bdc e940d4ffff                     jmp        0x7f56a8150621
04be1 49bac02e629c567f0000           movabs     r10, 0x7f569c622ec0
04beb 4c89542408                     mov        qword ptr [rsp + 8], r10
04bf0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bf8 e863b85707                     call       0x7f56af6cea60
04bfd e9a0d4ffff                     jmp        0x7f56a81506a2
04c02 49ba78f8719c567f0000           movabs     r10, 0x7f569c71f878
04c0c 4c89542408                     mov        qword ptr [rsp + 8], r10
04c11 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c19 e842b85707                     call       0x7f56af6cea60
04c1e e9fed4ffff                     jmp        0x7f56a8150721
04c23 49baf09c099c567f0000           movabs     r10, 0x7f569c099cf0
04c2d 4c89542408                     mov        qword ptr [rsp + 8], r10
04c32 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c3a e821b85707                     call       0x7f56af6cea60
04c3f e96fd5ffff                     jmp        0x7f56a81507b3
04c44 49ba68d4729c567f0000           movabs     r10, 0x7f569c72d468
04c4e 4c89542408                     mov        qword ptr [rsp + 8], r10
04c53 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c5b e800b85707                     call       0x7f56af6cea60
04c60 e910d6ffff                     jmp        0x7f56a8150875
04c65 49bad00d739c567f0000           movabs     r10, 0x7f569c730dd0
04c6f 4c89542408                     mov        qword ptr [rsp + 8], r10
04c74 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c7c e8dfb75707                     call       0x7f56af6cea60
04c81 e958d6ffff                     jmp        0x7f56a81508de
04c86 49baa00c739c567f0000           movabs     r10, 0x7f569c730ca0
04c90 4c89542408                     mov        qword ptr [rsp + 8], r10
04c95 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c9d e8beb75707                     call       0x7f56af6cea60
04ca2 e96ad6ffff                     jmp        0x7f56a8150911
04ca7 e834235807                     call       0x7f56af6d55e0
04cac 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04cb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
04cba e821d26c1f                     call       0x7f56c78204e0
04cbf f4                             hlt        
04cc0 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04cc8 e893da5707                     call       0x7f56af6d0d60
04ccd 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04cd7 4883e4f0                       and        rsp, 0xfffffffffffffff0
04cdb e800d26c1f                     call       0x7f56c78204e0
04ce0 f4                             hlt        
04ce1 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04ce9 e872da5707                     call       0x7f56af6d0d60
04cee 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04cf8 4883e4f0                       and        rsp, 0xfffffffffffffff0
04cfc e8dfd16c1f                     call       0x7f56c78204e0
04d01 f4                             hlt        
04d02 49ba3004629c567f0000           movabs     r10, 0x7f569c620430
04d0c 4c89542408                     mov        qword ptr [rsp + 8], r10
04d11 48c70424aa020000               mov        qword ptr [rsp], 0x2aa
04d19 e842b75707                     call       0x7f56af6cea60
04d1e e951d7ffff                     jmp        0x7f56a8150a74
04d23 49ba98ba749c567f0000           movabs     r10, 0x7f569c74ba98
04d2d 4c89542408                     mov        qword ptr [rsp + 8], r10
04d32 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d3a e821b75707                     call       0x7f56af6cea60
04d3f e926d8ffff                     jmp        0x7f56a8150b6a
04d44 e897225807                     call       0x7f56af6d55e0
04d49 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04d53 4883e4f0                       and        rsp, 0xfffffffffffffff0
04d57 e884d16c1f                     call       0x7f56c78204e0
04d5c f4                             hlt        
04d5d 49bad04b6d9c567f0000           movabs     r10, 0x7f569c6d4bd0
04d67 4c89542408                     mov        qword ptr [rsp + 8], r10
04d6c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d74 e8e7b65707                     call       0x7f56af6cea60
04d79 e994d8ffff                     jmp        0x7f56a8150c12
04d7e 49ba90a6189c567f0000           movabs     r10, 0x7f569c18a690
04d88 4c89542408                     mov        qword ptr [rsp + 8], r10
04d8d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d95 e8c6b65707                     call       0x7f56af6cea60
04d9a e9acd8ffff                     jmp        0x7f56a8150c4b
04d9f 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04da7 e8b4d95707                     call       0x7f56af6d0d60
04dac 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04db6 4883e4f0                       and        rsp, 0xfffffffffffffff0
04dba e821d16c1f                     call       0x7f56c78204e0
04dbf f4                             hlt        
04dc0 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04dc8 e893d95707                     call       0x7f56af6d0d60
04dcd 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04dd7 4883e4f0                       and        rsp, 0xfffffffffffffff0
04ddb e800d16c1f                     call       0x7f56c78204e0
04de0 f4                             hlt        
04de1 49ba987c7d9c567f0000           movabs     r10, 0x7f569c7d7c98
04deb 4c89542408                     mov        qword ptr [rsp + 8], r10
04df0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04df8 e863b65707                     call       0x7f56af6cea60
04dfd e917d9ffff                     jmp        0x7f56a8150d19
04e02 49bac0ee7d9c567f0000           movabs     r10, 0x7f569c7deec0
04e0c 4c89542408                     mov        qword ptr [rsp + 8], r10
04e11 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e19 e842b65707                     call       0x7f56af6cea60
04e1e e929d9ffff                     jmp        0x7f56a8150d4c
04e23 49ba08b1689c567f0000           movabs     r10, 0x7f569c68b108
04e2d 4c89542408                     mov        qword ptr [rsp + 8], r10
04e32 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e3a e821b65707                     call       0x7f56af6cea60
04e3f e96cd9ffff                     jmp        0x7f56a8150db0
04e44 49ba58d6749c567f0000           movabs     r10, 0x7f569c74d658
04e4e 4c89542408                     mov        qword ptr [rsp + 8], r10
04e53 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e5b e800b65707                     call       0x7f56af6cea60
04e60 e986d9ffff                     jmp        0x7f56a8150deb
04e65 49ba086f689c567f0000           movabs     r10, 0x7f569c686f08
04e6f 4c89542408                     mov        qword ptr [rsp + 8], r10
04e74 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e7c e8dfb55707                     call       0x7f56af6cea60
04e81 e998d9ffff                     jmp        0x7f56a8150e1e
04e86 49ba18f1749c567f0000           movabs     r10, 0x7f569c74f118
04e90 4c89542408                     mov        qword ptr [rsp + 8], r10
04e95 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e9d e8beb55707                     call       0x7f56af6cea60
04ea2 e985daffff                     jmp        0x7f56a8150f2c
04ea7 49ba10d44c9c567f0000           movabs     r10, 0x7f569c4cd410
04eb1 4c89542408                     mov        qword ptr [rsp + 8], r10
04eb6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ebe e89db55707                     call       0x7f56af6cea60
04ec3 e9a5daffff                     jmp        0x7f56a8150f6d
04ec8 49baa0913f9c567f0000           movabs     r10, 0x7f569c3f91a0
04ed2 4c89542408                     mov        qword ptr [rsp + 8], r10
04ed7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04edf e87cb55707                     call       0x7f56af6cea60
04ee4 e9b7daffff                     jmp        0x7f56a8150fa0
04ee9 48890424                       mov        qword ptr [rsp], rax
04eed e86ef35707                     call       0x7f56af6d2860
04ef2 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04efc 4883e4f0                       and        rsp, 0xfffffffffffffff0
04f00 e8dbcf6c1f                     call       0x7f56c78204e0
04f05 f4                             hlt        
04f06 e8d5205807                     call       0x7f56af6d55e0
04f0b 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04f15 4883e4f0                       and        rsp, 0xfffffffffffffff0
04f19 e8c2cf6c1f                     call       0x7f56c78204e0
04f1e f4                             hlt        
04f1f 49ba18c9749c567f0000           movabs     r10, 0x7f569c74c918
04f29 4c89542408                     mov        qword ptr [rsp + 8], r10
04f2e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f36 e825b55707                     call       0x7f56af6cea60
04f3b e90edcffff                     jmp        0x7f56a815114e
04f40 49bad04b6d9c567f0000           movabs     r10, 0x7f569c6d4bd0
04f4a 4c89542408                     mov        qword ptr [rsp + 8], r10
04f4f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f57 e804b55707                     call       0x7f56af6cea60
04f5c e9a6dcffff                     jmp        0x7f56a8151207
04f61 49ba90a6189c567f0000           movabs     r10, 0x7f569c18a690
04f6b 4c89542408                     mov        qword ptr [rsp + 8], r10
04f70 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f78 e8e3b45707                     call       0x7f56af6cea60
04f7d e9ccdcffff                     jmp        0x7f56a815124e
04f82 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04f8a e8d1d75707                     call       0x7f56af6d0d60
04f8f 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04f99 4883e4f0                       and        rsp, 0xfffffffffffffff0
04f9d e83ecf6c1f                     call       0x7f56c78204e0
04fa2 f4                             hlt        
04fa3 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04fab e8b0d75707                     call       0x7f56af6d0d60
04fb0 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04fba 4883e4f0                       and        rsp, 0xfffffffffffffff0
04fbe e81dcf6c1f                     call       0x7f56c78204e0
04fc3 f4                             hlt        
04fc4 e817205807                     call       0x7f56af6d55e0
04fc9 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
04fd3 4883e4f0                       and        rsp, 0xfffffffffffffff0
04fd7 e804cf6c1f                     call       0x7f56c78204e0
04fdc f4                             hlt        
04fdd 49ba18f1749c567f0000           movabs     r10, 0x7f569c74f118
04fe7 4c89542408                     mov        qword ptr [rsp + 8], r10
04fec 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ff4 e867b45707                     call       0x7f56af6cea60
04ff9 e95cdeffff                     jmp        0x7f56a815145a
04ffe 49ba10d44c9c567f0000           movabs     r10, 0x7f569c4cd410
05008 4c89542408                     mov        qword ptr [rsp + 8], r10
0500d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05015 e846b45707                     call       0x7f56af6cea60
0501a e988deffff                     jmp        0x7f56a81514a7
0501f 49baa0913f9c567f0000           movabs     r10, 0x7f569c3f91a0
05029 4c89542408                     mov        qword ptr [rsp + 8], r10
0502e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05036 e825b45707                     call       0x7f56af6cea60
0503b e99fdeffff                     jmp        0x7f56a81514df
05040 49ba3004629c567f0000           movabs     r10, 0x7f569c620430
0504a 4c89542408                     mov        qword ptr [rsp + 8], r10
0504f 48c70424e8020000               mov        qword ptr [rsp], 0x2e8
05057 e804b45707                     call       0x7f56af6cea60
0505c e941dfffff                     jmp        0x7f56a81515a2
05061 49bac02e629c567f0000           movabs     r10, 0x7f569c622ec0
0506b 4c89542408                     mov        qword ptr [rsp + 8], r10
05070 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05078 e8e3b35707                     call       0x7f56af6cea60
0507d e900e0ffff                     jmp        0x7f56a8151682
05082 49ba78f8719c567f0000           movabs     r10, 0x7f569c71f878
0508c 4c89542408                     mov        qword ptr [rsp + 8], r10
05091 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05099 e8c2b35707                     call       0x7f56af6cea60
0509e e95ee0ffff                     jmp        0x7f56a8151701
050a3 49baf09c099c567f0000           movabs     r10, 0x7f569c099cf0
050ad 4c89542408                     mov        qword ptr [rsp + 8], r10
050b2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050ba e8a1b35707                     call       0x7f56af6cea60
050bf e9cfe0ffff                     jmp        0x7f56a8151793
050c4 49ba68d4729c567f0000           movabs     r10, 0x7f569c72d468
050ce 4c89542408                     mov        qword ptr [rsp + 8], r10
050d3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050db e880b35707                     call       0x7f56af6cea60
050e0 e970e1ffff                     jmp        0x7f56a8151855
050e5 49bad00d739c567f0000           movabs     r10, 0x7f569c730dd0
050ef 4c89542408                     mov        qword ptr [rsp + 8], r10
050f4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050fc e85fb35707                     call       0x7f56af6cea60
05101 e9b8e1ffff                     jmp        0x7f56a81518be
05106 49baa00c739c567f0000           movabs     r10, 0x7f569c730ca0
05110 4c89542408                     mov        qword ptr [rsp + 8], r10
05115 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0511d e83eb35707                     call       0x7f56af6cea60
05122 e9cae1ffff                     jmp        0x7f56a81518f1
05127 e8b41e5807                     call       0x7f56af6d55e0
0512c 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
05136 4883e4f0                       and        rsp, 0xfffffffffffffff0
0513a e8a1cd6c1f                     call       0x7f56c78204e0
0513f f4                             hlt        
05140 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05148 e813d65707                     call       0x7f56af6d0d60
0514d 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
05157 4883e4f0                       and        rsp, 0xfffffffffffffff0
0515b e880cd6c1f                     call       0x7f56c78204e0
05160 f4                             hlt        
05161 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05169 e8f2d55707                     call       0x7f56af6d0d60
0516e 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
05178 4883e4f0                       and        rsp, 0xfffffffffffffff0
0517c e85fcd6c1f                     call       0x7f56c78204e0
05181 f4                             hlt        
05182 49ba3004629c567f0000           movabs     r10, 0x7f569c620430
0518c 4c89542408                     mov        qword ptr [rsp + 8], r10
05191 48c7042420030000               mov        qword ptr [rsp], 0x320
05199 e8c2b25707                     call       0x7f56af6cea60
0519e e9b1e2ffff                     jmp        0x7f56a8151a54
051a3 49ba98ba749c567f0000           movabs     r10, 0x7f569c74ba98
051ad 4c89542408                     mov        qword ptr [rsp + 8], r10
051b2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
051ba e8a1b25707                     call       0x7f56af6cea60
051bf e971e3ffff                     jmp        0x7f56a8151b35
051c4 e8171e5807                     call       0x7f56af6d55e0
051c9 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
051d3 4883e4f0                       and        rsp, 0xfffffffffffffff0
051d7 e804cd6c1f                     call       0x7f56c78204e0
051dc f4                             hlt        
051dd 49bad04b6d9c567f0000           movabs     r10, 0x7f569c6d4bd0
051e7 4c89542408                     mov        qword ptr [rsp + 8], r10
051ec 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
051f4 e867b25707                     call       0x7f56af6cea60
051f9 e9dee3ffff                     jmp        0x7f56a8151bdc
051fe 49ba90a6189c567f0000           movabs     r10, 0x7f569c18a690
05208 4c89542408                     mov        qword ptr [rsp + 8], r10
0520d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05215 e846b25707                     call       0x7f56af6cea60
0521a e9f6e3ffff                     jmp        0x7f56a8151c15
0521f 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05227 e834d55707                     call       0x7f56af6d0d60
0522c 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
05236 4883e4f0                       and        rsp, 0xfffffffffffffff0
0523a e8a1cc6c1f                     call       0x7f56c78204e0
0523f f4                             hlt        
05240 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05248 e813d55707                     call       0x7f56af6d0d60
0524d 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
05257 4883e4f0                       and        rsp, 0xfffffffffffffff0
0525b e880cc6c1f                     call       0x7f56c78204e0
05260 f4                             hlt        
05261 49ba987c7d9c567f0000           movabs     r10, 0x7f569c7d7c98
0526b 4c89542408                     mov        qword ptr [rsp + 8], r10
05270 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05278 e8e3b15707                     call       0x7f56af6cea60
0527d e959e4ffff                     jmp        0x7f56a8151cdb
05282 49bac0ee7d9c567f0000           movabs     r10, 0x7f569c7deec0
0528c 4c89542408                     mov        qword ptr [rsp + 8], r10
05291 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05299 e8c2b15707                     call       0x7f56af6cea60
0529e e96be4ffff                     jmp        0x7f56a8151d0e
052a3 49ba08b1689c567f0000           movabs     r10, 0x7f569c68b108
052ad 4c89542408                     mov        qword ptr [rsp + 8], r10
052b2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052ba e8a1b15707                     call       0x7f56af6cea60
052bf e9a1e4ffff                     jmp        0x7f56a8151d65
052c4 49ba58d6749c567f0000           movabs     r10, 0x7f569c74d658
052ce 4c89542408                     mov        qword ptr [rsp + 8], r10
052d3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052db e880b15707                     call       0x7f56af6cea60
052e0 e9b6e4ffff                     jmp        0x7f56a8151d9b
052e5 49ba086f689c567f0000           movabs     r10, 0x7f569c686f08
052ef 4c89542408                     mov        qword ptr [rsp + 8], r10
052f4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052fc e85fb15707                     call       0x7f56af6cea60
05301 e9c8e4ffff                     jmp        0x7f56a8151dce
05306 49ba18f1749c567f0000           movabs     r10, 0x7f569c74f118
05310 4c89542408                     mov        qword ptr [rsp + 8], r10
05315 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0531d e83eb15707                     call       0x7f56af6cea60
05322 e9b5e5ffff                     jmp        0x7f56a8151edc
05327 49ba10d44c9c567f0000           movabs     r10, 0x7f569c4cd410
05331 4c89542408                     mov        qword ptr [rsp + 8], r10
05336 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0533e e81db15707                     call       0x7f56af6cea60
05343 e9d5e5ffff                     jmp        0x7f56a8151f1d
05348 49baa0913f9c567f0000           movabs     r10, 0x7f569c3f91a0
05352 4c89542408                     mov        qword ptr [rsp + 8], r10
05357 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0535f e8fcb05707                     call       0x7f56af6cea60
05364 e9e7e5ffff                     jmp        0x7f56a8151f50
05369 48890424                       mov        qword ptr [rsp], rax
0536d e8eeee5707                     call       0x7f56af6d2860
05372 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
0537c 4883e4f0                       and        rsp, 0xfffffffffffffff0
05380 e85bcb6c1f                     call       0x7f56c78204e0
05385 f4                             hlt        
05386 e8551c5807                     call       0x7f56af6d55e0
0538b 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
05395 4883e4f0                       and        rsp, 0xfffffffffffffff0
05399 e842cb6c1f                     call       0x7f56c78204e0
0539e f4                             hlt        
0539f 49ba18c9749c567f0000           movabs     r10, 0x7f569c74c918
053a9 4c89542408                     mov        qword ptr [rsp + 8], r10
053ae 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053b6 e8a5b05707                     call       0x7f56af6cea60
053bb e93ee7ffff                     jmp        0x7f56a81520fe
053c0 49bad04b6d9c567f0000           movabs     r10, 0x7f569c6d4bd0
053ca 4c89542408                     mov        qword ptr [rsp + 8], r10
053cf 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053d7 e884b05707                     call       0x7f56af6cea60
053dc e9d6e7ffff                     jmp        0x7f56a81521b7
053e1 49ba90a6189c567f0000           movabs     r10, 0x7f569c18a690
053eb 4c89542408                     mov        qword ptr [rsp + 8], r10
053f0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053f8 e863b05707                     call       0x7f56af6cea60
053fd e9f9e7ffff                     jmp        0x7f56a81521fb
05402 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0540a e851d35707                     call       0x7f56af6d0d60
0540f 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
05419 4883e4f0                       and        rsp, 0xfffffffffffffff0
0541d e8beca6c1f                     call       0x7f56c78204e0
05422 f4                             hlt        
05423 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0542b e830d35707                     call       0x7f56af6d0d60
05430 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
0543a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0543e e89dca6c1f                     call       0x7f56c78204e0
05443 f4                             hlt        
05444 e8971b5807                     call       0x7f56af6d55e0
05449 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
05453 4883e4f0                       and        rsp, 0xfffffffffffffff0
05457 e884ca6c1f                     call       0x7f56c78204e0
0545c f4                             hlt        
0545d 49ba18f1749c567f0000           movabs     r10, 0x7f569c74f118
05467 4c89542408                     mov        qword ptr [rsp + 8], r10
0546c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05474 e8e7af5707                     call       0x7f56af6cea60
05479 e984e9ffff                     jmp        0x7f56a8152402
0547e 49ba10d44c9c567f0000           movabs     r10, 0x7f569c4cd410
05488 4c89542408                     mov        qword ptr [rsp + 8], r10
0548d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05495 e8c6af5707                     call       0x7f56af6cea60
0549a e9b0e9ffff                     jmp        0x7f56a815244f
0549f 49baa0913f9c567f0000           movabs     r10, 0x7f569c3f91a0
054a9 4c89542408                     mov        qword ptr [rsp + 8], r10
054ae 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
054b6 e8a5af5707                     call       0x7f56af6cea60
054bb e9c7e9ffff                     jmp        0x7f56a8152487
054c0 49ba3004629c567f0000           movabs     r10, 0x7f569c620430
054ca 4c89542408                     mov        qword ptr [rsp + 8], r10
054cf 48c704245a030000               mov        qword ptr [rsp], 0x35a
054d7 e884af5707                     call       0x7f56af6cea60
054dc e97eeaffff                     jmp        0x7f56a815255f
054e1 90                             nop        
054e2 90                             nop        
054e3 90                             nop        
054e4 90                             nop        
054e5 90                             nop        
054e6 90                             nop        
054e7 e874c15d07                     call       0x7f56af72fc60
054ec e985ecffff                     jmp        0x7f56a8152776
054f1 49ba972715a8567f0000           movabs     r10, 0x7f56a8152797
054fb 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
05502 e959e85d07                     jmp        0x7f56af732360
05507 48ba0000000000000000           movabs     rdx, 0
05511 b8000f050a                     mov        eax, 0xa050f00
05516 e845c45707                     call       0x7f56af6cff60
0551b e9a8ecffff                     jmp        0x7f56a81527c8
05520 e8bb1a5807                     call       0x7f56af6d55e0
05525 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
0552f 4883e4f0                       and        rsp, 0xfffffffffffffff0
05533 e8a8c96c1f                     call       0x7f56c78204e0
05538 f4                             hlt        
05539 488bd2                         mov        rdx, rdx
0553c e89f0a5807                     call       0x7f56af6d45e0
05541 e9d1ecffff                     jmp        0x7f56a8152817
05546 48ba0000000000000000           movabs     rdx, 0
05550 b8000f050a                     mov        eax, 0xa050f00
05555 e806b65707                     call       0x7f56af6cf160
0555a e9b9ecffff                     jmp        0x7f56a8152818
0555f 48ba0000000000000000           movabs     rdx, 0
05569 b8000f050a                     mov        eax, 0xa050f00
0556e e8edc35707                     call       0x7f56af6cff60
05573 e938edffff                     jmp        0x7f56a81528b0
05578 e8631a5807                     call       0x7f56af6d55e0
0557d 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
05587 4883e4f0                       and        rsp, 0xfffffffffffffff0
0558b e850c96c1f                     call       0x7f56c78204e0
05590 f4                             hlt        
05591 488bd2                         mov        rdx, rdx
05594 e8470a5807                     call       0x7f56af6d45e0
05599 e961edffff                     jmp        0x7f56a81528ff
0559e 48ba0000000000000000           movabs     rdx, 0
055a8 b8000f050a                     mov        eax, 0xa050f00
055ad e8aec35707                     call       0x7f56af6cff60
055b2 e999edffff                     jmp        0x7f56a8152950
055b7 e8241a5807                     call       0x7f56af6d55e0
055bc 48bfb5a040c6567f0000           movabs     rdi, 0x7f56c640a0b5
055c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
055ca e811c96c1f                     call       0x7f56c78204e0
055cf f4                             hlt        
055d0 488bd2                         mov        rdx, rdx
055d3 e8080a5807                     call       0x7f56af6d45e0
055d8 e9c2edffff                     jmp        0x7f56a815299f
055dd 498b8708060000                 mov        rax, qword ptr [r15 + 0x608]
055e4 49c7870806000000000000         mov        qword ptr [r15 + 0x608], 0
055ef 49c7871006000000000000         mov        qword ptr [r15 + 0x610], 0
055fa 4881c450020000                 add        rsp, 0x250
05601 5d                             pop        rbp
05602 e959295807                     jmp        0x7f56af6d6560
05607 f4                             hlt        
