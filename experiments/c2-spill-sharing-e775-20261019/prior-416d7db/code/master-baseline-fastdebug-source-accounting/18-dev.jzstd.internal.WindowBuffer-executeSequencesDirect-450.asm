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
0001a 0f8540b85b07                   jne        0x7f6a9772ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ec50020000                 sub        rsp, 0x250
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 7405                           je         0x7f6a9017353f
0003a e8a1bc5a07                     call       0x7f6a9771f1e0
0003f 4889b42448010000               mov        qword ptr [rsp + 0x148], rsi
00047 4889942468010000               mov        qword ptr [rsp + 0x168], rdx
0004f 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
00056 4c89842428010000               mov        qword ptr [rsp + 0x128], r8
0005e 4c898c2420010000               mov        qword ptr [rsp + 0x120], r9
00066 89bc2430010000                 mov        dword ptr [rsp + 0x130], edi
0006d 48bb00c063846a7f0000           movabs     rbx, 0x7f6a8463c000
00077 8b4378                         mov        eax, dword ptr [rbx + 0x78]
0007a 83c002                         add        eax, 2
0007d 894378                         mov        dword ptr [rbx + 0x78], eax
00080 25fe070000                     and        eax, 0x7fe
00085 85c0                           test       eax, eax
00087 0f845c430000                   je         0x7f6a901778e9
0008d 48bb00c063846a7f0000           movabs     rbx, 0x7f6a8463c000
00097 ff83b0000000                   inc        dword ptr [rbx + 0xb0]
0009d 8b9c2460020000                 mov        ebx, dword ptr [rsp + 0x260]
000a4 8b4640                         mov        eax, dword ptr [rsi + 0x40]
000a7 4c3b25eac77d20                 cmp        r12, qword ptr [rip + 0x207dc7ea]
000ae 0f8414000000                   je         0x7f6a901735c8
000b4 48bf2832a2ae6a7f0000           movabs     rdi, 0x7f6aaea23228
000be 4883e4f0                       and        rsp, 0xfffffffffffffff0
000c2 e899afba1f                     call       0x7f6aafd1e560
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
00102 48b800c063846a7f0000           movabs     rax, 0x7f6a8463c000
0010c b900010000                     mov        ecx, 0x100
00111 7f05                           jg         0x7f6a90173618
00113 b910010000                     mov        ecx, 0x110
00118 44899c2440010000               mov        dword ptr [rsp + 0x140], r11d
00120 4c8b1c08                       mov        r11, qword ptr [rax + rcx]
00124 4d8d5b01                       lea        r11, [r11 + 1]
00128 4c891c08                       mov        qword ptr [rax + rcx], r11
0012c 0f8f17420000                   jg         0x7f6a90177849
00132 4863db                         movsxd     rbx, ebx
00135 488b4e20                       mov        rcx, qword ptr [rsi + 0x20]
00139 482bcf                         sub        rcx, rdi
0013c 483bcb                         cmp        rcx, rbx
0013f 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
00149 b830010000                     mov        eax, 0x130
0014e 7c05                           jl         0x7f6a90173655
00150 b820010000                     mov        eax, 0x120
00155 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
00159 4d8d5b01                       lea        r11, [r11 + 1]
0015d 4c891c01                       mov        qword ptr [rcx + rax], r11
00161 0f8ce2410000                   jl         0x7f6a90177849
00167 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
00171 ff8160010000                   inc        dword ptr [rcx + 0x160]
00177 b900000000                     mov        ecx, 0
0017c 498bc0                         mov        rax, r8
0017f 483bc1                         cmp        rax, rcx
00182 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
0018c b870010000                     mov        eax, 0x170
00191 7505                           jne        0x7f6a90173698
00193 b880010000                     mov        eax, 0x180
00198 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
0019c 4d8d5b01                       lea        r11, [r11 + 1]
001a0 4c891c01                       mov        qword ptr [rcx + rax], r11
001a4 0f8531000000                   jne        0x7f6a901736db
001aa 4803df                         add        rbx, rdi
001ad 498bc9                         mov        rcx, r9
001b0 483bcb                         cmp        rcx, rbx
001b3 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
001bd bfa0010000                     mov        edi, 0x1a0
001c2 7d05                           jge        0x7f6a901736c9
001c4 bf90010000                     mov        edi, 0x190
001c9 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
001cd 488d5b01                       lea        rbx, [rbx + 1]
001d1 48891c39                       mov        qword ptr [rcx + rdi], rbx
001d5 0f8d0a000000                   jge        0x7f6a901736e5
001db bf00000000                     mov        edi, 0
001e0 e915000000                     jmp        0x7f6a901736fa
001e5 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
001ef ff81b0010000                   inc        dword ptr [rcx + 0x1b0]
001f5 bf01000000                     mov        edi, 1
001fa 4d2bc6                         sub        r8, r14
001fd 4c89842480010000               mov        qword ptr [rsp + 0x180], r8
00205 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
0020f 488381c801000001               add        qword ptr [rcx + 0x1c8], 1
00217 48b948116e846a7f0000           movabs     rcx, 0x7f6a846e1148
00221 8b5978                         mov        ebx, dword ptr [rcx + 0x78]
00224 83c302                         add        ebx, 2
00227 895978                         mov        dword ptr [rcx + 0x78], ebx
0022a 81e3feff1f00                   and        ebx, 0x1ffffe
00230 85db                           test       ebx, ebx
00232 0f84d2410000                   je         0x7f6a9017790a
00238 48b9ffffffffffffff7f           movabs     rcx, 0x7fffffffffffffff
00242 493bc9                         cmp        rcx, r9
00245 48b948116e846a7f0000           movabs     rcx, 0x7f6a846e1148
0024f bbc0000000                     mov        ebx, 0xc0
00254 7d05                           jge        0x7f6a9017375b
00256 bbb0000000                     mov        ebx, 0xb0
0025b 488b0419                       mov        rax, qword ptr [rcx + rbx]
0025f 488d4001                       lea        rax, [rax + 1]
00263 48890419                       mov        qword ptr [rcx + rbx], rax
00267 0f8d0f000000                   jge        0x7f6a9017377c
0026d 49b9ffffffffffffff7f           movabs     r9, 0x7fffffffffffffff
00277 e910000000                     jmp        0x7f6a9017378c
0027c 48b948116e846a7f0000           movabs     rcx, 0x7f6a846e1148
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
00312 48bf00c063846a7f0000           movabs     rdi, 0x7f6a8463c000
0031c b8d8010000                     mov        eax, 0x1d8
00321 7d05                           jge        0x7f6a90173828
00323 b8e8010000                     mov        eax, 0x1e8
00328 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
0032c 4d8d5b01                       lea        r11, [r11 + 1]
00330 4c891c07                       mov        qword ptr [rdi + rax], r11
00334 0f8d223d0000                   jge        0x7f6a9017755c
0033a 413b5004                       cmp        edx, dword ptr [r8 + 4]
0033e 0f8332410000                   jae        0x7f6a90177976
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
00387 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
00391 41b8f8010000                   mov        r8d, 0x1f8
00397 7d06                           jge        0x7f6a9017389f
00399 41b808020000                   mov        r8d, 0x208
0039f 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003a3 4d8d6d01                       lea        r13, [r13 + 1]
003a7 4e892c01                       mov        qword ptr [rcx + r8], r13
003ab 0f8d15000000                   jge        0x7f6a901738c6
003b1 413b5104                       cmp        edx, dword ptr [r9 + 4]
003b5 0f830f410000                   jae        0x7f6a901779ca
003bb 4863ca                         movsxd     rcx, edx
003be 418b4c8908                     mov        ecx, dword ptr [r9 + rcx*4 + 8]
003c3 488bc1                         mov        rax, rcx
003c6 85ff                           test       edi, edi
003c8 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
003d2 41b818020000                   mov        r8d, 0x218
003d8 7406                           je         0x7f6a901738e0
003da 41b828020000                   mov        r8d, 0x228
003e0 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003e4 4d8d6d01                       lea        r13, [r13 + 1]
003e8 4e892c01                       mov        qword ptr [rcx + r8], r13
003ec 0f8431000000                   je         0x7f6a90173923
003f2 498bcb                         mov        rcx, r11
003f5 2bce                           sub        ecx, esi
003f7 3bf9                           cmp        edi, ecx
003f9 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
00403 41b848020000                   mov        r8d, 0x248
00409 7f06                           jg         0x7f6a90173911
0040b 41b838020000                   mov        r8d, 0x238
00411 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00415 4d8d6d01                       lea        r13, [r13 + 1]
00419 4e892c01                       mov        qword ptr [rcx + r8], r13
0041d 0f8f863e0000                   jg         0x7f6a901777a9
00423 83f803                         cmp        eax, 3
00426 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
00430 41b868020000                   mov        r8d, 0x268
00436 7e06                           jle        0x7f6a9017393e
00438 41b878020000                   mov        r8d, 0x278
0043e 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00442 4d8d6d01                       lea        r13, [r13 + 1]
00446 4e892c01                       mov        qword ptr [rcx + r8], r13
0044a 0f8e59000000                   jle        0x7f6a901739a9
00450 83e803                         sub        eax, 3
00453 837b0401                       cmp        dword ptr [rbx + 4], 1
00457 0f86c1400000                   jbe        0x7f6a90177a1e
0045d 8b4b0c                         mov        ecx, dword ptr [rbx + 0xc]
00460 837b0402                       cmp        dword ptr [rbx + 4], 2
00464 0f86da400000                   jbe        0x7f6a90177a44
0046a 894b10                         mov        dword ptr [rbx + 0x10], ecx
0046d 8b4b08                         mov        ecx, dword ptr [rbx + 8]
00470 894b0c                         mov        dword ptr [rbx + 0xc], ecx
00473 894308                         mov        dword ptr [rbx + 8], eax
00476 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
00480 ff8188020000                   inc        dword ptr [rcx + 0x288]
00486 89942444010000                 mov        dword ptr [rsp + 0x144], edx
0048d 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
00494 4c8bb42488010000               mov        r14, qword ptr [rsp + 0x188]
0049c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
004a4 e952000000                     jmp        0x7f6a901739fb
004a9 89942444010000                 mov        dword ptr [rsp + 0x144], edx
004b0 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
004b7 49b800c063846a7f0000           movabs     r8, 0x7f6a8463c000
004c1 498380a002000001               add        qword ptr [r8 + 0x2a0], 1
004c9 488bf3                         mov        rsi, rbx
004cc 488bd0                         mov        rdx, rax
004cf 488bcf                         mov        rcx, rdi
004d2 90                             nop        
004d3 90                             nop        
004d4 90                             nop        
004d5 90                             nop        
004d6 90                             nop        
004d7 e884c25b07                     call       0x7f6a9772fc60
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
00510 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
0051a b9c0020000                     mov        ecx, 0x2c0
0051f 7d05                           jge        0x7f6a90173a26
00521 b9b0020000                     mov        ecx, 0x2b0
00526 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0052a 4d8d4001                       lea        r8, [r8 + 1]
0052e 4c89040a                       mov        qword ptr [rdx + rcx], r8
00532 0f8d15000000                   jge        0x7f6a90173a4d
00538 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00540 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00548 e9ad000000                     jmp        0x7f6a90173afa
0054d 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00555 4585ed                         test       r13d, r13d
00558 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
00562 b9d0020000                     mov        ecx, 0x2d0
00567 7505                           jne        0x7f6a90173a6e
00569 b9e0020000                     mov        ecx, 0x2e0
0056e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
00572 4d8d4001                       lea        r8, [r8 + 1]
00576 4c89040a                       mov        qword ptr [rdx + rcx], r8
0057a 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00582 0f8568000000                   jne        0x7f6a90173af0
00588 498bd3                         mov        rdx, r11
0058b 03d7                           add        edx, edi
0058d 2bd0                           sub        edx, eax
0058f 4863d2                         movsxd     rdx, edx
00592 493bd0                         cmp        rdx, r8
00595 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
0059f b9f0020000                     mov        ecx, 0x2f0
005a4 7c05                           jl         0x7f6a90173aab
005a6 b900030000                     mov        ecx, 0x300
005ab 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
005af 4d8d4901                       lea        r9, [r9 + 1]
005b3 4c890c0a                       mov        qword ptr [rdx + rcx], r9
005b7 0f8c3d000000                   jl         0x7f6a90173afa
005bd 4c8b8c2450010000               mov        r9, qword ptr [rsp + 0x150]
005c5 4c3bcb                         cmp        r9, rbx
005c8 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
005d2 b920030000                     mov        ecx, 0x320
005d7 7c05                           jl         0x7f6a90173ade
005d9 b910030000                     mov        ecx, 0x310
005de 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
005e2 4d8d4901                       lea        r9, [r9 + 1]
005e6 4c890c0a                       mov        qword ptr [rdx + rcx], r9
005ea 0f8c0a000000                   jl         0x7f6a90173afa
005f0 ba00000000                     mov        edx, 0
005f5 e915000000                     jmp        0x7f6a90173b0f
005fa 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
00604 ff8230030000                   inc        dword ptr [rdx + 0x330]
0060a ba01000000                     mov        edx, 1
0060f 48899c2498010000               mov        qword ptr [rsp + 0x198], rbx
00617 85c0                           test       eax, eax
00619 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
00623 41b948030000                   mov        r9d, 0x348
00629 7e06                           jle        0x7f6a90173b31
0062b 41b958030000                   mov        r9d, 0x358
00631 4a8b1c09                       mov        rbx, qword ptr [rcx + r9]
00635 488d5b01                       lea        rbx, [rbx + 1]
00639 4a891c09                       mov        qword ptr [rcx + r9], rbx
0063d 0f8e6f390000                   jle        0x7f6a901774b2
00643 85d2                           test       edx, edx
00645 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
0064f b978030000                     mov        ecx, 0x378
00654 7505                           jne        0x7f6a90173b5b
00656 b968030000                     mov        ecx, 0x368
0065b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0065f 4d8d4901                       lea        r9, [r9 + 1]
00663 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00667 0f8545390000                   jne        0x7f6a901774b2
0066d 498bdb                         mov        rbx, r11
00670 03df                           add        ebx, edi
00672 899c24a0010000                 mov        dword ptr [rsp + 0x1a0], ebx
00679 488bf3                         mov        rsi, rbx
0067c 03b42478010000                 add        esi, dword ptr [rsp + 0x178]
00683 3bb42458010000                 cmp        esi, dword ptr [rsp + 0x158]
0068a 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
00694 ba30040000                     mov        edx, 0x430
00699 7f05                           jg         0x7f6a90173ba0
0069b ba40040000                     mov        edx, 0x440
006a0 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
006a4 488d4901                       lea        rcx, [rcx + 1]
006a8 48890c16                       mov        qword ptr [rsi + rdx], rcx
006ac 0f8f3f000000                   jg         0x7f6a90173bf1
006b2 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
006b9 03f7                           add        esi, edi
006bb 89b424a4010000                 mov        dword ptr [rsp + 0x1a4], esi
006c2 3bb4245c010000                 cmp        esi, dword ptr [rsp + 0x15c]
006c9 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
006d3 b960040000                     mov        ecx, 0x460
006d8 7e05                           jle        0x7f6a90173bdf
006da b950040000                     mov        ecx, 0x450
006df 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
006e3 4d8d4901                       lea        r9, [r9 + 1]
006e7 4c890c0a                       mov        qword ptr [rdx + rcx], r9
006eb 0f8e76000000                   jle        0x7f6a90173c67
006f1 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
006f9 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
00701 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
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
00747 e814c05b07                     call       0x7f6a9772fc60
0074c 0f1f840044080001               nop        dword ptr [rax + rax + 0x1000844]
00754 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
0075b 03b4247c010000                 add        esi, dword ptr [rsp + 0x17c]
00762 e9c9370000                     jmp        0x7f6a90177430
00767 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
0076f 83ff10                         cmp        edi, 0x10
00772 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
0077c b970040000                     mov        ecx, 0x470
00781 7f05                           jg         0x7f6a90173c88
00783 b980040000                     mov        ecx, 0x480
00788 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0078c 4d8d4901                       lea        r9, [r9 + 1]
00790 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00794 0f8f670a0000                   jg         0x7f6a90174701
0079a 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
007a4 4883829004000001               add        qword ptr [rdx + 0x490], 1
007ac 48ba28be6d846a7f0000           movabs     rdx, 0x7f6a846dbe28
007b6 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
007b9 83c102                         add        ecx, 2
007bc 894a78                         mov        dword ptr [rdx + 0x78], ecx
007bf 81e1feff1f00                   and        ecx, 0x1ffffe
007c5 85c9                           test       ecx, ecx
007c7 0f849d3d0000                   je         0x7f6a90177a6a
007cd 48bac0c52de300000000           movabs     rdx, 0xe32dc5c0
007d7 48b928be6d846a7f0000           movabs     rcx, 0x7f6a846dbe28
007e1 8b12                           mov        edx, dword ptr [rdx]
007e3 c1ea0d                         shr        edx, 0xd
007e6 48c1e20a                       shl        rdx, 0xa
007ea 41ba00000011                   mov        r10d, 0x11000000
007f0 4903d2                         add        rdx, r10
007f3 41ba17000000                   mov        r10d, 0x17
007f9 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
007fd 7436                           je         0x7f6a90173d35
007ff 4983c202                       add        r10, 2
00803 4983fa1b                       cmp        r10, 0x1b
00807 75f0                           jne        0x7f6a90173cf9
00809 41ba17000000                   mov        r10d, 0x17
0080f 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
00814 7412                           je         0x7f6a90173d28
00816 4983c202                       add        r10, 2
0081a 4983fa1b                       cmp        r10, 0x1b
0081e 75ef                           jne        0x7f6a90173d0f
00820 41ba16000000                   mov        r10d, 0x16
00826 eb11                           jmp        0x7f6a90173d39
00828 50                             push       rax
00829 4833c0                         xor        rax, rax
0082c f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
00832 58                             pop        rax
00833 ebbe                           jmp        0x7f6a90173cf3
00835 4983c201                       add        r10, 1
00839 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0083e 48ba28be6d846a7f0000           movabs     rdx, 0x7f6a846dbe28
00848 488382e000000001               add        qword ptr [rdx + 0xe0], 1
00850 48ba58b36d846a7f0000           movabs     rdx, 0x7f6a846db358
0085a 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0085d 83c102                         add        ecx, 2
00860 894a78                         mov        dword ptr [rdx + 0x78], ecx
00863 81e1feff1f00                   and        ecx, 0x1ffffe
00869 85c9                           test       ecx, ecx
0086b 0f841a3d0000                   je         0x7f6a90177a8b
00871 448bac2490010000               mov        r13d, dword ptr [rsp + 0x190]
00879 48ba58b36d846a7f0000           movabs     rdx, 0x7f6a846db358
00883 4883821001000001               add        qword ptr [rdx + 0x110], 1
0088b 8b942464010000                 mov        edx, dword ptr [rsp + 0x164]
00892 83ea0f                         sub        edx, 0xf
00895 48b9e8a96d846a7f0000           movabs     rcx, 0x7f6a846da9e8
0089f 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
008a3 4183c102                       add        r9d, 2
008a7 44894978                       mov        dword ptr [rcx + 0x78], r9d
008ab 4181e1feff1f00                 and        r9d, 0x1ffffe
008b2 4585c9                         test       r9d, r9d
008b5 0f84f13c0000                   je         0x7f6a90177aac
008bb 48b9e8a96d846a7f0000           movabs     rcx, 0x7f6a846da9e8
008c5 488381b000000001               add        qword ptr [rcx + 0xb0], 1
008cd 48b90000000000000000           movabs     rcx, 0
008d7 b900000000                     mov        ecx, 0
008dc 443be9                         cmp        r13d, ecx
008df 0f8ce83c0000                   jl         0x7f6a90177acd
008e5 443bea                         cmp        r13d, edx
008e8 0f8d003d0000                   jge        0x7f6a90177aee
008ee 498bd5                         mov        rdx, r13
008f1 89942494010000                 mov        dword ptr [rsp + 0x194], edx
008f8 48b9c0c52de300000000           movabs     rcx, 0xe32dc5c0
00902 4c8bc9                         mov        r9, rcx
00905 49be28be6d846a7f0000           movabs     r14, 0x7f6a846dbe28
0090f 458b09                         mov        r9d, dword ptr [r9]
00912 41c1e90d                       shr        r9d, 0xd
00916 49c1e10a                       shl        r9, 0xa
0091a 41ba00000011                   mov        r10d, 0x11000000
00920 4d03ca                         add        r9, r10
00923 41ba25000000                   mov        r10d, 0x25
00929 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
0092d 7436                           je         0x7f6a90173e65
0092f 4983c202                       add        r10, 2
00933 4983fa29                       cmp        r10, 0x29
00937 75f0                           jne        0x7f6a90173e29
00939 41ba25000000                   mov        r10d, 0x25
0093f 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
00944 7412                           je         0x7f6a90173e58
00946 4983c202                       add        r10, 2
0094a 4983fa29                       cmp        r10, 0x29
0094e 75ef                           jne        0x7f6a90173e3f
00950 41ba24000000                   mov        r10d, 0x24
00956 eb11                           jmp        0x7f6a90173e69
00958 50                             push       rax
00959 4833c0                         xor        rax, rax
0095c f04f0fb10cd6                   lock cmpxchg qword ptr [r14 + r10*8], r9
00962 58                             pop        rax
00963 ebbe                           jmp        0x7f6a90173e23
00965 4983c201                       add        r10, 1
00969 4b8304d601                     add        qword ptr [r14 + r10*8], 1
0096e 48baf0aa6d846a7f0000           movabs     rdx, 0x7f6a846daaf0
00978 448b4a78                       mov        r9d, dword ptr [rdx + 0x78]
0097c 4183c102                       add        r9d, 2
00980 44894a78                       mov        dword ptr [rdx + 0x78], r9d
00984 4181e1feff1f00                 and        r9d, 0x1ffffe
0098b 4585c9                         test       r9d, r9d
0098e 0f847b3c0000                   je         0x7f6a90177b0f
00994 48baf0aa6d846a7f0000           movabs     rdx, 0x7f6a846daaf0
0099e 488382b000000001               add        qword ptr [rdx + 0xb0], 1
009a6 48ba20ac6d846a7f0000           movabs     rdx, 0x7f6a846dac20
009b0 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
009b3 83c102                         add        ecx, 2
009b6 894a78                         mov        dword ptr [rdx + 0x78], ecx
009b9 81e1feff1f00                   and        ecx, 0x1ffffe
009bf 85c9                           test       ecx, ecx
009c1 0f84693c0000                   je         0x7f6a90177b30
009c7 48ba20ac6d846a7f0000           movabs     rdx, 0x7f6a846dac20
009d1 ff82c0000000                   inc        dword ptr [rdx + 0xc0]
009d7 8b942494010000                 mov        edx, dword ptr [rsp + 0x194]
009de 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
009e5 4489ac2490010000               mov        dword ptr [rsp + 0x190], r13d
009ed 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
009f5 488b9c2468010000               mov        rbx, qword ptr [rsp + 0x168]
009fd 48b9b8452ee300000000           movabs     rcx, 0xe32e45b8
00a07 4c8bc9                         mov        r9, rcx
00a0a 48b828be6d846a7f0000           movabs     rax, 0x7f6a846dbe28
00a14 4883806001000001               add        qword ptr [rax + 0x160], 1
00a1c 49b9f8bf6d846a7f0000           movabs     r9, 0x7f6a846dbff8
00a26 418b4178                       mov        eax, dword ptr [r9 + 0x78]
00a2a 83c002                         add        eax, 2
00a2d 41894178                       mov        dword ptr [r9 + 0x78], eax
00a31 25feff1f00                     and        eax, 0x1ffffe
00a36 85c0                           test       eax, eax
00a38 0f84133c0000                   je         0x7f6a90177b51
00a3e 4c8bc9                         mov        r9, rcx
00a41 48b8f8bf6d846a7f0000           movabs     rax, 0x7f6a846dbff8
00a4b 488380b000000001               add        qword ptr [rax + 0xb0], 1
00a53 49b9e0c06d846a7f0000           movabs     r9, 0x7f6a846dc0e0
00a5d 418b4178                       mov        eax, dword ptr [r9 + 0x78]
00a61 83c002                         add        eax, 2
00a64 41894178                       mov        dword ptr [r9 + 0x78], eax
00a68 25feff1f00                     and        eax, 0x1ffffe
00a6d 85c0                           test       eax, eax
00a6f 0f84fd3b0000                   je         0x7f6a90177b72
00a75 49b9e0c06d846a7f0000           movabs     r9, 0x7f6a846dc0e0
00a7f 498381c000000001               add        qword ptr [r9 + 0xc0], 1
00a87 48b9d8b46d846a7f0000           movabs     rcx, 0x7f6a846db4d8
00a91 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
00a95 4183c102                       add        r9d, 2
00a99 44894978                       mov        dword ptr [rcx + 0x78], r9d
00a9d 4181e1feff1f00                 and        r9d, 0x1ffffe
00aa4 4585c9                         test       r9d, r9d
00aa7 0f84e63b0000                   je         0x7f6a90177b93
00aad 48b9c0c52de300000000           movabs     rcx, 0xe32dc5c0
00ab7 4c8bc9                         mov        r9, rcx
00aba 48b8e0c06d846a7f0000           movabs     rax, 0x7f6a846dc0e0
00ac4 458b09                         mov        r9d, dword ptr [r9]
00ac7 41c1e90d                       shr        r9d, 0xd
00acb 49c1e10a                       shl        r9, 0xa
00acf 41ba00000011                   mov        r10d, 0x11000000
00ad5 4d03ca                         add        r9, r10
00ad8 41ba1d000000                   mov        r10d, 0x1d
00ade 4e3b0cd0                       cmp        r9, qword ptr [rax + r10*8]
00ae2 743c                           je         0x7f6a90174020
00ae4 4983c202                       add        r10, 2
00ae8 4983fa21                       cmp        r10, 0x21
00aec 75f0                           jne        0x7f6a90173fde
00aee 41ba1d000000                   mov        r10d, 0x1d
00af4 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
00af9 7412                           je         0x7f6a9017400d
00afb 4983c202                       add        r10, 2
00aff 4983fa21                       cmp        r10, 0x21
00b03 75ef                           jne        0x7f6a90173ff4
00b05 41ba1c000000                   mov        r10d, 0x1c
00b0b eb17                           jmp        0x7f6a90174024
00b0d 53                             push       rbx
00b0e 488bd8                         mov        rbx, rax
00b11 4833c0                         xor        rax, rax
00b14 f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
00b1a 488bc3                         mov        rax, rbx
00b1d 5b                             pop        rbx
00b1e ebb8                           jmp        0x7f6a90173fd8
00b20 4983c201                       add        r10, 1
00b24 4a8304d001                     add        qword ptr [rax + r10*8], 1
00b29 49b9e0c06d846a7f0000           movabs     r9, 0x7f6a846dc0e0
00b33 8b09                           mov        ecx, dword ptr [rcx]
00b35 c1e90d                         shr        ecx, 0xd
00b38 48c1e10a                       shl        rcx, 0xa
00b3c 41ba00000011                   mov        r10d, 0x11000000
00b42 4903ca                         add        rcx, r10
00b45 41ba23000000                   mov        r10d, 0x23
00b4b 4b3b0cd1                       cmp        rcx, qword ptr [r9 + r10*8]
00b4f 7436                           je         0x7f6a90174087
00b51 4983c202                       add        r10, 2
00b55 4983fa27                       cmp        r10, 0x27
00b59 75f0                           jne        0x7f6a9017404b
00b5b 41ba23000000                   mov        r10d, 0x23
00b61 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
00b66 7412                           je         0x7f6a9017407a
00b68 4983c202                       add        r10, 2
00b6c 4983fa27                       cmp        r10, 0x27
00b70 75ef                           jne        0x7f6a90174061
00b72 41ba22000000                   mov        r10d, 0x22
00b78 eb11                           jmp        0x7f6a9017408b
00b7a 50                             push       rax
00b7b 4833c0                         xor        rax, rax
00b7e f04b0fb10cd1                   lock cmpxchg qword ptr [r9 + r10*8], rcx
00b84 58                             pop        rax
00b85 ebbe                           jmp        0x7f6a90174045
00b87 4983c201                       add        r10, 1
00b8b 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00b90 48b9e0c06d846a7f0000           movabs     rcx, 0x7f6a846dc0e0
00b9a 4883814001000001               add        qword ptr [rcx + 0x140], 1
00ba2 48b9a0b56d846a7f0000           movabs     rcx, 0x7f6a846db5a0
00bac 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
00bb0 4183c102                       add        r9d, 2
00bb4 44894978                       mov        dword ptr [rcx + 0x78], r9d
00bb8 4181e1feff1f00                 and        r9d, 0x1ffffe
00bbf 4585c9                         test       r9d, r9d
00bc2 0f84ec3a0000                   je         0x7f6a90177bb4
00bc8 48b9e0c06d846a7f0000           movabs     rcx, 0x7f6a846dc0e0
00bd2 4883815001000001               add        qword ptr [rcx + 0x150], 1
00bda 4863c2                         movsxd     rax, edx
00bdd ba08000000                     mov        edx, 8
00be2 4c8bc8                         mov        r9, rax
00be5 4c03ca                         add        r9, rdx
00be8 48ba28a76d846a7f0000           movabs     rdx, 0x7f6a846da728
00bf2 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
00bf5 83c102                         add        ecx, 2
00bf8 894a78                         mov        dword ptr [rdx + 0x78], ecx
00bfb 81e1feff1f00                   and        ecx, 0x1ffffe
00c01 85c9                           test       ecx, ecx
00c03 0f84cc3a0000                   je         0x7f6a90177bd5
00c09 48ba28a76d846a7f0000           movabs     rdx, 0x7f6a846da728
00c13 488382e000000001               add        qword ptr [rdx + 0xe0], 1
00c1b 48baa8a86d846a7f0000           movabs     rdx, 0x7f6a846da8a8
00c25 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
00c28 83c102                         add        ecx, 2
00c2b 894a78                         mov        dword ptr [rdx + 0x78], ecx
00c2e 81e1feff1f00                   and        ecx, 0x1ffffe
00c34 85c9                           test       ecx, ecx
00c36 0f84ba3a0000                   je         0x7f6a90177bf6
00c3c 48bae0c06d846a7f0000           movabs     rdx, 0x7f6a846dc0e0
00c46 4883827001000001               add        qword ptr [rdx + 0x170], 1
00c4e 48ba889e2ee300000000           movabs     rdx, 0xe32e9e88
00c58 48be08c62de300000000           movabs     rsi, 0xe32dc608
00c62 ba02000000                     mov        edx, 2
00c67 b910000000                     mov        ecx, 0x10
00c6c 4c8bc3                         mov        r8, rbx
00c6f bf00000000                     mov        edi, 0
00c74 48891c24                       mov        qword ptr [rsp], rbx
00c78 4889442408                     mov        qword ptr [rsp + 8], rax
00c7d 49bac0c52de300000000           movabs     r10, 0xe32dc5c0
00c87 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00c8c 49ba889e2ee300000000           movabs     r10, 0xe32e9e88
00c96 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c9b 90                             nop        
00c9c 90                             nop        
00c9d 90                             nop        
00c9e 90                             nop        
00c9f e8bcba5b07                     call       0x7f6a9772fc60
00ca4 0f1f84009c0d0002               nop        dword ptr [rax + rax + 0x2000d9c]
00cac 4885c0                         test       rax, rax
00caf 48bbe0c06d846a7f0000           movabs     rbx, 0x7f6a846dc0e0
00cb9 750c                           jne        0x7f6a901741c7
00cbb 808b7901000001                 or         byte ptr [rbx + 0x179], 1
00cc2 e988000000                     jmp        0x7f6a9017424f
00cc7 8b38                           mov        edi, dword ptr [rax]
00cc9 c1ef0d                         shr        edi, 0xd
00ccc 48c1e70a                       shl        rdi, 0xa
00cd0 41ba00000011                   mov        r10d, 0x11000000
00cd6 4903fa                         add        rdi, r10
00cd9 41ba31000000                   mov        r10d, 0x31
00cdf 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
00ce3 7436                           je         0x7f6a9017421b
00ce5 4983c202                       add        r10, 2
00ce9 4983fa35                       cmp        r10, 0x35
00ced 75f0                           jne        0x7f6a901741df
00cef 41ba31000000                   mov        r10d, 0x31
00cf5 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00cfa 7412                           je         0x7f6a9017420e
00cfc 4983c202                       add        r10, 2
00d00 4983fa35                       cmp        r10, 0x35
00d04 75ef                           jne        0x7f6a901741f5
00d06 41ba30000000                   mov        r10d, 0x30
00d0c eb11                           jmp        0x7f6a9017421f
00d0e 50                             push       rax
00d0f 4833c0                         xor        rax, rax
00d12 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
00d18 58                             pop        rax
00d19 ebbe                           jmp        0x7f6a901741d9
00d1b 4983c201                       add        r10, 1
00d1f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00d24 48bf00b4141100000000           movabs     rdi, 0x1114b400
00d2e 8b18                           mov        ebx, dword ptr [rax]
00d30 c1eb0d                         shr        ebx, 0xd
00d33 48c1e30a                       shl        rbx, 0xa
00d37 41ba00000011                   mov        r10d, 0x11000000
00d3d 4903da                         add        rbx, r10
00d40 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
00d44 0f85cd390000                   jne        0x7f6a90177c17
00d4a e900000000                     jmp        0x7f6a9017424f
00d4f 488bf8                         mov        rdi, rax
00d52 4889bc24b0010000               mov        qword ptr [rsp + 0x1b0], rdi
00d5a 483b07                         cmp        rax, qword ptr [rdi]
00d5d 488bf7                         mov        rsi, rdi
00d60 48bb00c063846a7f0000           movabs     rbx, 0x7f6a8463c000
00d6a 8b36                           mov        esi, dword ptr [rsi]
00d6c c1ee0d                         shr        esi, 0xd
00d6f 48c1e60a                       shl        rsi, 0xa
00d73 41ba00000011                   mov        r10d, 0x11000000
00d79 4903f2                         add        rsi, r10
00d7c 41ba95000000                   mov        r10d, 0x95
00d82 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00d86 743c                           je         0x7f6a901742c4
00d88 4983c202                       add        r10, 2
00d8c 4981fa99000000                 cmp        r10, 0x99
00d93 75ed                           jne        0x7f6a90174282
00d95 41ba95000000                   mov        r10d, 0x95
00d9b 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00da0 7415                           je         0x7f6a901742b7
00da2 4983c202                       add        r10, 2
00da6 4981fa99000000                 cmp        r10, 0x99
00dad 75ec                           jne        0x7f6a9017429b
00daf 41ba94000000                   mov        r10d, 0x94
00db5 eb11                           jmp        0x7f6a901742c8
00db7 50                             push       rax
00db8 4833c0                         xor        rax, rax
00dbb f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00dc1 58                             pop        rax
00dc2 ebb8                           jmp        0x7f6a9017427c
00dc4 4983c201                       add        r10, 1
00dc8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00dcd 48be30cb6d846a7f0000           movabs     rsi, 0x7f6a846dcb30
00dd7 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
00dda 83c302                         add        ebx, 2
00ddd 895e78                         mov        dword ptr [rsi + 0x78], ebx
00de0 81e3feff1f00                   and        ebx, 0x1ffffe
00de6 85db                           test       ebx, ebx
00de8 0f845f390000                   je         0x7f6a90177c4d
00dee 488bf7                         mov        rsi, rdi
00df1 48bb30cb6d846a7f0000           movabs     rbx, 0x7f6a846dcb30
00dfb 8b36                           mov        esi, dword ptr [rsi]
00dfd c1ee0d                         shr        esi, 0xd
00e00 48c1e60a                       shl        rsi, 0xa
00e04 41ba00000011                   mov        r10d, 0x11000000
00e0a 4903f2                         add        rsi, r10
00e0d 41ba17000000                   mov        r10d, 0x17
00e13 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00e17 7436                           je         0x7f6a9017434f
00e19 4983c202                       add        r10, 2
00e1d 4983fa1b                       cmp        r10, 0x1b
00e21 75f0                           jne        0x7f6a90174313
00e23 41ba17000000                   mov        r10d, 0x17
00e29 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00e2e 7412                           je         0x7f6a90174342
00e30 4983c202                       add        r10, 2
00e34 4983fa1b                       cmp        r10, 0x1b
00e38 75ef                           jne        0x7f6a90174329
00e3a 41ba16000000                   mov        r10d, 0x16
00e40 eb11                           jmp        0x7f6a90174353
00e42 50                             push       rax
00e43 4833c0                         xor        rax, rax
00e46 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00e4c 58                             pop        rax
00e4d ebbe                           jmp        0x7f6a9017430d
00e4f 4983c201                       add        r10, 1
00e53 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00e58 488bf7                         mov        rsi, rdi
00e5b 90                             nop        
00e5c 90                             nop        
00e5d 48b870aa74646a7f0000           movabs     rax, 0x7f6a6474aa70
00e67 e8f4b35b07                     call       0x7f6a9772f760
00e6c 0f1f8400640f0003               nop        dword ptr [rax + rax + 0x3000f64]
00e74 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
00e7c 8b7704                         mov        esi, dword ptr [rdi + 4]
00e7f 48bb30cb6d846a7f0000           movabs     rbx, 0x7f6a846dcb30
00e89 488383e000000001               add        qword ptr [rbx + 0xe0], 1
00e91 48bb58b36d846a7f0000           movabs     rbx, 0x7f6a846db358
00e9b 8b5378                         mov        edx, dword ptr [rbx + 0x78]
00e9e 83c202                         add        edx, 2
00ea1 895378                         mov        dword ptr [rbx + 0x78], edx
00ea4 81e2feff1f00                   and        edx, 0x1ffffe
00eaa 85d2                           test       edx, edx
00eac 0f84d5380000                   je         0x7f6a90177c87
00eb2 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
00eba 48bb58b36d846a7f0000           movabs     rbx, 0x7f6a846db358
00ec4 4883831001000001               add        qword ptr [rbx + 0x110], 1
00ecc ffc8                           dec        eax
00ece 2bf0                           sub        esi, eax
00ed0 48bbe8a96d846a7f0000           movabs     rbx, 0x7f6a846da9e8
00eda 8b4378                         mov        eax, dword ptr [rbx + 0x78]
00edd 83c002                         add        eax, 2
00ee0 894378                         mov        dword ptr [rbx + 0x78], eax
00ee3 25feff1f00                     and        eax, 0x1ffffe
00ee8 85c0                           test       eax, eax
00eea 0f84b8380000                   je         0x7f6a90177ca8
00ef0 48bbe8a96d846a7f0000           movabs     rbx, 0x7f6a846da9e8
00efa 488383b000000001               add        qword ptr [rbx + 0xb0], 1
00f02 48bb0000000000000000           movabs     rbx, 0
00f0c bb00000000                     mov        ebx, 0
00f11 443bdb                         cmp        r11d, ebx
00f14 0f8caf380000                   jl         0x7f6a90177cc9
00f1a 443bde                         cmp        r11d, esi
00f1d 0f8dc7380000                   jge        0x7f6a90177cea
00f23 498bdb                         mov        rbx, r11
00f26 899c24ac010000                 mov        dword ptr [rsp + 0x1ac], ebx
00f2d 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
00f35 488bbc24b0010000               mov        rdi, qword ptr [rsp + 0x1b0]
00f3d 488bf7                         mov        rsi, rdi
00f40 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
00f4a 8b36                           mov        esi, dword ptr [rsi]
00f4c c1ee0d                         shr        esi, 0xd
00f4f 48c1e60a                       shl        rsi, 0xa
00f53 41ba00000011                   mov        r10d, 0x11000000
00f59 4903f2                         add        rsi, r10
00f5c 41ba1f000000                   mov        r10d, 0x1f
00f62 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
00f66 7436                           je         0x7f6a9017449e
00f68 4983c202                       add        r10, 2
00f6c 4983fa23                       cmp        r10, 0x23
00f70 75f0                           jne        0x7f6a90174462
00f72 41ba1f000000                   mov        r10d, 0x1f
00f78 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
00f7d 7412                           je         0x7f6a90174491
00f7f 4983c202                       add        r10, 2
00f83 4983fa23                       cmp        r10, 0x23
00f87 75ef                           jne        0x7f6a90174478
00f89 41ba1e000000                   mov        r10d, 0x1e
00f8f eb11                           jmp        0x7f6a901744a2
00f91 50                             push       rax
00f92 4833c0                         xor        rax, rax
00f95 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
00f9b 58                             pop        rax
00f9c ebbe                           jmp        0x7f6a9017445c
00f9e 4983c201                       add        r10, 1
00fa2 4a8304d201                     add        qword ptr [rdx + r10*8], 1
00fa7 488bf7                         mov        rsi, rdi
00faa 90                             nop        
00fab 90                             nop        
00fac 90                             nop        
00fad 48b898aa74646a7f0000           movabs     rax, 0x7f6a6474aa98
00fb7 e8a4b25b07                     call       0x7f6a9772f760
00fbc 0f1f8400b4100004               nop        dword ptr [rax + rax + 0x40010b4]
00fc4 483b00                         cmp        rax, qword ptr [rax]
00fc7 488bf0                         mov        rsi, rax
00fca 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
00fd4 8b36                           mov        esi, dword ptr [rsi]
00fd6 c1ee0d                         shr        esi, 0xd
00fd9 48c1e60a                       shl        rsi, 0xa
00fdd 41ba00000011                   mov        r10d, 0x11000000
00fe3 4903f2                         add        rsi, r10
00fe6 41ba25000000                   mov        r10d, 0x25
00fec 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
00ff0 7436                           je         0x7f6a90174528
00ff2 4983c202                       add        r10, 2
00ff6 4983fa29                       cmp        r10, 0x29
00ffa 75f0                           jne        0x7f6a901744ec
00ffc 41ba25000000                   mov        r10d, 0x25
01002 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01007 7412                           je         0x7f6a9017451b
01009 4983c202                       add        r10, 2
0100d 4983fa29                       cmp        r10, 0x29
01011 75ef                           jne        0x7f6a90174502
01013 41ba24000000                   mov        r10d, 0x24
01019 eb11                           jmp        0x7f6a9017452c
0101b 50                             push       rax
0101c 4833c0                         xor        rax, rax
0101f f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01025 58                             pop        rax
01026 ebbe                           jmp        0x7f6a901744e6
01028 4983c201                       add        r10, 1
0102c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01031 8b7024                         mov        esi, dword ptr [rax + 0x24]
01034 4c3b255db87d20                 cmp        r12, qword ptr [rip + 0x207db85d]
0103b 0f8414000000                   je         0x7f6a90174555
01041 48bf2832a2ae6a7f0000           movabs     rdi, 0x7f6aaea23228
0104b 4883e4f0                       and        rsp, 0xfffffffffffffff0
0104f e80ca0ba1f                     call       0x7f6aafd1e560
01054 f4                             hlt        
01055 488bd0                         mov        rdx, rax
01058 48b930cb6d846a7f0000           movabs     rcx, 0x7f6a846dcb30
01062 8b12                           mov        edx, dword ptr [rdx]
01064 c1ea0d                         shr        edx, 0xd
01067 48c1e20a                       shl        rdx, 0xa
0106b 41ba00000011                   mov        r10d, 0x11000000
01071 4903d2                         add        rdx, r10
01074 41ba2b000000                   mov        r10d, 0x2b
0107a 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0107e 7436                           je         0x7f6a901745b6
01080 4983c202                       add        r10, 2
01084 4983fa2f                       cmp        r10, 0x2f
01088 75f0                           jne        0x7f6a9017457a
0108a 41ba2b000000                   mov        r10d, 0x2b
01090 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01095 7412                           je         0x7f6a901745a9
01097 4983c202                       add        r10, 2
0109b 4983fa2f                       cmp        r10, 0x2f
0109f 75ef                           jne        0x7f6a90174590
010a1 41ba2a000000                   mov        r10d, 0x2a
010a7 eb11                           jmp        0x7f6a901745ba
010a9 50                             push       rax
010aa 4833c0                         xor        rax, rax
010ad f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
010b3 58                             pop        rax
010b4 ebbe                           jmp        0x7f6a90174574
010b6 4983c201                       add        r10, 1
010ba 4a8304d101                     add        qword ptr [rcx + r10*8], 1
010bf 8b4804                         mov        ecx, dword ptr [rax + 4]
010c2 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
010cc 4883828001000001               add        qword ptr [rdx + 0x180], 1
010d4 48baa0b56d846a7f0000           movabs     rdx, 0x7f6a846db5a0
010de 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
010e2 4183c002                       add        r8d, 2
010e6 44894278                       mov        dword ptr [rdx + 0x78], r8d
010ea 4181e0feff1f00                 and        r8d, 0x1ffffe
010f1 4585c0                         test       r8d, r8d
010f4 0f842a370000                   je         0x7f6a90177d24
010fa 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
01104 4883829001000001               add        qword ptr [rdx + 0x190], 1
0110c 8b9c24ac010000                 mov        ebx, dword ptr [rsp + 0x1ac]
01113 4863db                         movsxd     rbx, ebx
01116 ba08000000                     mov        edx, 8
0111b 4c8bcb                         mov        r9, rbx
0111e 4c03ca                         add        r9, rdx
01121 48ba28a76d846a7f0000           movabs     rdx, 0x7f6a846da728
0112b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
0112f 4183c002                       add        r8d, 2
01133 44894278                       mov        dword ptr [rdx + 0x78], r8d
01137 4181e0feff1f00                 and        r8d, 0x1ffffe
0113e 4585c0                         test       r8d, r8d
01141 0f84fe360000                   je         0x7f6a90177d45
01147 48ba28a76d846a7f0000           movabs     rdx, 0x7f6a846da728
01151 488382e000000001               add        qword ptr [rdx + 0xe0], 1
01159 48baa8a86d846a7f0000           movabs     rdx, 0x7f6a846da8a8
01163 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01167 4183c002                       add        r8d, 2
0116b 44894278                       mov        dword ptr [rdx + 0x78], r8d
0116f 4181e0feff1f00                 and        r8d, 0x1ffffe
01176 4585c0                         test       r8d, r8d
01179 0f84e7360000                   je         0x7f6a90177d66
0117f 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
01189 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
01191 48ba703c2fe300000000           movabs     rdx, 0xe32f3c70
0119b ba02000000                     mov        edx, 2
011a0 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
011a8 bf00000000                     mov        edi, 0
011ad 488b8424b0010000               mov        rax, qword ptr [rsp + 0x1b0]
011b5 48890424                       mov        qword ptr [rsp], rax
011b9 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
011c1 4889442408                     mov        qword ptr [rsp + 8], rax
011c6 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
011cb 49ba703c2fe300000000           movabs     r10, 0xe32f3c70
011d5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
011da 90                             nop        
011db 90                             nop        
011dc 90                             nop        
011dd 90                             nop        
011de 90                             nop        
011df e87cb55b07                     call       0x7f6a9772fc60
011e4 0f1f8400dc120005               nop        dword ptr [rax + rax + 0x50012dc]
011ec 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
011f6 ff86d0040000                   inc        dword ptr [rsi + 0x4d0]
011fc e9480c0000                     jmp        0x7f6a90175349
01201 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
01208 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
01210 83ff30                         cmp        edi, 0x30
01213 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
0121d bae8040000                     mov        edx, 0x4e8
01222 7f05                           jg         0x7f6a90174729
01224 baf8040000                     mov        edx, 0x4f8
01229 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0122d 488d4901                       lea        rcx, [rcx + 1]
01231 48890c16                       mov        qword ptr [rsi + rdx], rcx
01235 0f8f1e0b0000                   jg         0x7f6a90175259
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
01267 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
01271 4883810805000001               add        qword ptr [rcx + 0x508], 1
01279 48b928be6d846a7f0000           movabs     rcx, 0x7f6a846dbe28
01283 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
01287 4183c002                       add        r8d, 2
0128b 44894178                       mov        dword ptr [rcx + 0x78], r8d
0128f 4181e0feff1f00                 and        r8d, 0x1ffffe
01296 4585c0                         test       r8d, r8d
01299 0f84e8350000                   je         0x7f6a90177d87
0129f 48b9c0c52de300000000           movabs     rcx, 0xe32dc5c0
012a9 49b828be6d846a7f0000           movabs     r8, 0x7f6a846dbe28
012b3 8b09                           mov        ecx, dword ptr [rcx]
012b5 c1e90d                         shr        ecx, 0xd
012b8 48c1e10a                       shl        rcx, 0xa
012bc 41ba00000011                   mov        r10d, 0x11000000
012c2 4903ca                         add        rcx, r10
012c5 41ba17000000                   mov        r10d, 0x17
012cb 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
012cf 7436                           je         0x7f6a90174807
012d1 4983c202                       add        r10, 2
012d5 4983fa1b                       cmp        r10, 0x1b
012d9 75f0                           jne        0x7f6a901747cb
012db 41ba17000000                   mov        r10d, 0x17
012e1 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
012e6 7412                           je         0x7f6a901747fa
012e8 4983c202                       add        r10, 2
012ec 4983fa1b                       cmp        r10, 0x1b
012f0 75ef                           jne        0x7f6a901747e1
012f2 41ba16000000                   mov        r10d, 0x16
012f8 eb11                           jmp        0x7f6a9017480b
012fa 50                             push       rax
012fb 4833c0                         xor        rax, rax
012fe f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
01304 58                             pop        rax
01305 ebbe                           jmp        0x7f6a901747c5
01307 4983c201                       add        r10, 1
0130b 4b8304d001                     add        qword ptr [r8 + r10*8], 1
01310 48b928be6d846a7f0000           movabs     rcx, 0x7f6a846dbe28
0131a 488381e000000001               add        qword ptr [rcx + 0xe0], 1
01322 48b958b36d846a7f0000           movabs     rcx, 0x7f6a846db358
0132c 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
01330 4183c002                       add        r8d, 2
01334 44894178                       mov        dword ptr [rcx + 0x78], r8d
01338 4181e0feff1f00                 and        r8d, 0x1ffffe
0133f 4585c0                         test       r8d, r8d
01342 0f8460350000                   je         0x7f6a90177da8
01348 48b958b36d846a7f0000           movabs     rcx, 0x7f6a846db358
01352 4883811001000001               add        qword ptr [rcx + 0x110], 1
0135a 488bc8                         mov        rcx, rax
0135d 83e90f                         sub        ecx, 0xf
01360 49b8e8a96d846a7f0000           movabs     r8, 0x7f6a846da9e8
0136a 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
0136e 4183c102                       add        r9d, 2
01372 45894878                       mov        dword ptr [r8 + 0x78], r9d
01376 4181e1feff1f00                 and        r9d, 0x1ffffe
0137d 4585c9                         test       r9d, r9d
01380 0f8443350000                   je         0x7f6a90177dc9
01386 49b8e8a96d846a7f0000           movabs     r8, 0x7f6a846da9e8
01390 498380b000000001               add        qword ptr [r8 + 0xb0], 1
01398 49b80000000000000000           movabs     r8, 0
013a2 41b800000000                   mov        r8d, 0
013a8 413bf0                         cmp        esi, r8d
013ab 0f8c39350000                   jl         0x7f6a90177dea
013b1 3bf1                           cmp        esi, ecx
013b3 0f8d52350000                   jge        0x7f6a90177e0b
013b9 488bce                         mov        rcx, rsi
013bc 898c24b8010000                 mov        dword ptr [rsp + 0x1b8], ecx
013c3 49b8c0c52de300000000           movabs     r8, 0xe32dc5c0
013cd 4d8bc8                         mov        r9, r8
013d0 49be28be6d846a7f0000           movabs     r14, 0x7f6a846dbe28
013da 458b09                         mov        r9d, dword ptr [r9]
013dd 41c1e90d                       shr        r9d, 0xd
013e1 49c1e10a                       shl        r9, 0xa
013e5 41ba00000011                   mov        r10d, 0x11000000
013eb 4d03ca                         add        r9, r10
013ee 41ba25000000                   mov        r10d, 0x25
013f4 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
013f8 7436                           je         0x7f6a90174930
013fa 4983c202                       add        r10, 2
013fe 4983fa29                       cmp        r10, 0x29
01402 75f0                           jne        0x7f6a901748f4
01404 41ba25000000                   mov        r10d, 0x25
0140a 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
0140f 7412                           je         0x7f6a90174923
01411 4983c202                       add        r10, 2
01415 4983fa29                       cmp        r10, 0x29
01419 75ef                           jne        0x7f6a9017490a
0141b 41ba24000000                   mov        r10d, 0x24
01421 eb11                           jmp        0x7f6a90174934
01423 50                             push       rax
01424 4833c0                         xor        rax, rax
01427 f04f0fb10cd6                   lock cmpxchg qword ptr [r14 + r10*8], r9
0142d 58                             pop        rax
0142e ebbe                           jmp        0x7f6a901748ee
01430 4983c201                       add        r10, 1
01434 4b8304d601                     add        qword ptr [r14 + r10*8], 1
01439 48b9f0aa6d846a7f0000           movabs     rcx, 0x7f6a846daaf0
01443 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
01447 4183c102                       add        r9d, 2
0144b 44894978                       mov        dword ptr [rcx + 0x78], r9d
0144f 4181e1feff1f00                 and        r9d, 0x1ffffe
01456 4585c9                         test       r9d, r9d
01459 0f84cd340000                   je         0x7f6a90177e2c
0145f 48b9f0aa6d846a7f0000           movabs     rcx, 0x7f6a846daaf0
01469 488381b000000001               add        qword ptr [rcx + 0xb0], 1
01471 48b920ac6d846a7f0000           movabs     rcx, 0x7f6a846dac20
0147b 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
0147f 4183c002                       add        r8d, 2
01483 44894178                       mov        dword ptr [rcx + 0x78], r8d
01487 4181e0feff1f00                 and        r8d, 0x1ffffe
0148e 4585c0                         test       r8d, r8d
01491 0f84b6340000                   je         0x7f6a90177e4d
01497 48b920ac6d846a7f0000           movabs     rcx, 0x7f6a846dac20
014a1 ff81c0000000                   inc        dword ptr [rcx + 0xc0]
014a7 8b8c24b8010000                 mov        ecx, dword ptr [rsp + 0x1b8]
014ae 89b424c0010000                 mov        dword ptr [rsp + 0x1c0], esi
014b5 49b8b8452ee300000000           movabs     r8, 0xe32e45b8
014bf 4d8bc8                         mov        r9, r8
014c2 49be28be6d846a7f0000           movabs     r14, 0x7f6a846dbe28
014cc 4983866001000001               add        qword ptr [r14 + 0x160], 1
014d4 49b9f8bf6d846a7f0000           movabs     r9, 0x7f6a846dbff8
014de 418b5978                       mov        ebx, dword ptr [r9 + 0x78]
014e2 83c302                         add        ebx, 2
014e5 41895978                       mov        dword ptr [r9 + 0x78], ebx
014e9 81e3feff1f00                   and        ebx, 0x1ffffe
014ef 85db                           test       ebx, ebx
014f1 0f8477340000                   je         0x7f6a90177e6e
014f7 4d8bc8                         mov        r9, r8
014fa 48bbf8bf6d846a7f0000           movabs     rbx, 0x7f6a846dbff8
01504 488383b000000001               add        qword ptr [rbx + 0xb0], 1
0150c 49b9e0c06d846a7f0000           movabs     r9, 0x7f6a846dc0e0
01516 418b5978                       mov        ebx, dword ptr [r9 + 0x78]
0151a 83c302                         add        ebx, 2
0151d 41895978                       mov        dword ptr [r9 + 0x78], ebx
01521 81e3feff1f00                   and        ebx, 0x1ffffe
01527 85db                           test       ebx, ebx
01529 0f8460340000                   je         0x7f6a90177e8f
0152f 49b9e0c06d846a7f0000           movabs     r9, 0x7f6a846dc0e0
01539 498381c000000001               add        qword ptr [r9 + 0xc0], 1
01541 49b8d8b46d846a7f0000           movabs     r8, 0x7f6a846db4d8
0154b 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
0154f 4183c102                       add        r9d, 2
01553 45894878                       mov        dword ptr [r8 + 0x78], r9d
01557 4181e1feff1f00                 and        r9d, 0x1ffffe
0155e 4585c9                         test       r9d, r9d
01561 0f8449340000                   je         0x7f6a90177eb0
01567 49b8c0c52de300000000           movabs     r8, 0xe32dc5c0
01571 4d8bc8                         mov        r9, r8
01574 48bbe0c06d846a7f0000           movabs     rbx, 0x7f6a846dc0e0
0157e 458b09                         mov        r9d, dword ptr [r9]
01581 41c1e90d                       shr        r9d, 0xd
01585 49c1e10a                       shl        r9, 0xa
01589 41ba00000011                   mov        r10d, 0x11000000
0158f 4d03ca                         add        r9, r10
01592 41ba1d000000                   mov        r10d, 0x1d
01598 4e3b0cd3                       cmp        r9, qword ptr [rbx + r10*8]
0159c 7436                           je         0x7f6a90174ad4
0159e 4983c202                       add        r10, 2
015a2 4983fa21                       cmp        r10, 0x21
015a6 75f0                           jne        0x7f6a90174a98
015a8 41ba1d000000                   mov        r10d, 0x1d
015ae 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
015b3 7412                           je         0x7f6a90174ac7
015b5 4983c202                       add        r10, 2
015b9 4983fa21                       cmp        r10, 0x21
015bd 75ef                           jne        0x7f6a90174aae
015bf 41ba1c000000                   mov        r10d, 0x1c
015c5 eb11                           jmp        0x7f6a90174ad8
015c7 50                             push       rax
015c8 4833c0                         xor        rax, rax
015cb f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
015d1 58                             pop        rax
015d2 ebbe                           jmp        0x7f6a90174a92
015d4 4983c201                       add        r10, 1
015d8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
015dd 49b9e0c06d846a7f0000           movabs     r9, 0x7f6a846dc0e0
015e7 458b00                         mov        r8d, dword ptr [r8]
015ea 41c1e80d                       shr        r8d, 0xd
015ee 49c1e00a                       shl        r8, 0xa
015f2 41ba00000011                   mov        r10d, 0x11000000
015f8 4d03c2                         add        r8, r10
015fb 41ba23000000                   mov        r10d, 0x23
01601 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
01605 7436                           je         0x7f6a90174b3d
01607 4983c202                       add        r10, 2
0160b 4983fa27                       cmp        r10, 0x27
0160f 75f0                           jne        0x7f6a90174b01
01611 41ba23000000                   mov        r10d, 0x23
01617 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
0161c 7412                           je         0x7f6a90174b30
0161e 4983c202                       add        r10, 2
01622 4983fa27                       cmp        r10, 0x27
01626 75ef                           jne        0x7f6a90174b17
01628 41ba22000000                   mov        r10d, 0x22
0162e eb11                           jmp        0x7f6a90174b41
01630 50                             push       rax
01631 4833c0                         xor        rax, rax
01634 f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
0163a 58                             pop        rax
0163b ebbe                           jmp        0x7f6a90174afb
0163d 4983c201                       add        r10, 1
01641 4b8304d101                     add        qword ptr [r9 + r10*8], 1
01646 49b8e0c06d846a7f0000           movabs     r8, 0x7f6a846dc0e0
01650 4983804001000001               add        qword ptr [r8 + 0x140], 1
01658 49b8a0b56d846a7f0000           movabs     r8, 0x7f6a846db5a0
01662 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
01666 4183c102                       add        r9d, 2
0166a 45894878                       mov        dword ptr [r8 + 0x78], r9d
0166e 4181e1feff1f00                 and        r9d, 0x1ffffe
01675 4585c9                         test       r9d, r9d
01678 0f8453330000                   je         0x7f6a90177ed1
0167e 49b8e0c06d846a7f0000           movabs     r8, 0x7f6a846dc0e0
01688 4983805001000001               add        qword ptr [r8 + 0x150], 1
01690 4863d9                         movsxd     rbx, ecx
01693 b908000000                     mov        ecx, 8
01698 4c8bcb                         mov        r9, rbx
0169b 4c03c9                         add        r9, rcx
0169e 48b928a76d846a7f0000           movabs     rcx, 0x7f6a846da728
016a8 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
016ac 4183c002                       add        r8d, 2
016b0 44894178                       mov        dword ptr [rcx + 0x78], r8d
016b4 4181e0feff1f00                 and        r8d, 0x1ffffe
016bb 4585c0                         test       r8d, r8d
016be 0f842e330000                   je         0x7f6a90177ef2
016c4 48b928a76d846a7f0000           movabs     rcx, 0x7f6a846da728
016ce 488381e000000001               add        qword ptr [rcx + 0xe0], 1
016d6 48b9a8a86d846a7f0000           movabs     rcx, 0x7f6a846da8a8
016e0 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
016e4 4183c002                       add        r8d, 2
016e8 44894178                       mov        dword ptr [rcx + 0x78], r8d
016ec 4181e0feff1f00                 and        r8d, 0x1ffffe
016f3 4585c0                         test       r8d, r8d
016f6 0f8417330000                   je         0x7f6a90177f13
016fc 48b9e0c06d846a7f0000           movabs     rcx, 0x7f6a846dc0e0
01706 4883817001000001               add        qword ptr [rcx + 0x170], 1
0170e 48b9889e2ee300000000           movabs     rcx, 0xe32e9e88
01718 48be08c62de300000000           movabs     rsi, 0xe32dc608
01722 4c8bc2                         mov        r8, rdx
01725 ba02000000                     mov        edx, 2
0172a b910000000                     mov        ecx, 0x10
0172f 498bc0                         mov        rax, r8
01732 4c8bc0                         mov        r8, rax
01735 bf00000000                     mov        edi, 0
0173a 48890424                       mov        qword ptr [rsp], rax
0173e 48895c2408                     mov        qword ptr [rsp + 8], rbx
01743 49bac0c52de300000000           movabs     r10, 0xe32dc5c0
0174d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01752 49ba889e2ee300000000           movabs     r10, 0xe32e9e88
0175c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01761 90                             nop        
01762 90                             nop        
01763 90                             nop        
01764 90                             nop        
01765 90                             nop        
01766 90                             nop        
01767 e8f4af5b07                     call       0x7f6a9772fc60
0176c 0f1f840064180006               nop        dword ptr [rax + rax + 0x6001864]
01774 4885c0                         test       rax, rax
01777 48bbe0c06d846a7f0000           movabs     rbx, 0x7f6a846dc0e0
01781 750c                           jne        0x7f6a90174c8f
01783 808b7901000001                 or         byte ptr [rbx + 0x179], 1
0178a e988000000                     jmp        0x7f6a90174d17
0178f 8b38                           mov        edi, dword ptr [rax]
01791 c1ef0d                         shr        edi, 0xd
01794 48c1e70a                       shl        rdi, 0xa
01798 41ba00000011                   mov        r10d, 0x11000000
0179e 4903fa                         add        rdi, r10
017a1 41ba31000000                   mov        r10d, 0x31
017a7 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
017ab 7436                           je         0x7f6a90174ce3
017ad 4983c202                       add        r10, 2
017b1 4983fa35                       cmp        r10, 0x35
017b5 75f0                           jne        0x7f6a90174ca7
017b7 41ba31000000                   mov        r10d, 0x31
017bd 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
017c2 7412                           je         0x7f6a90174cd6
017c4 4983c202                       add        r10, 2
017c8 4983fa35                       cmp        r10, 0x35
017cc 75ef                           jne        0x7f6a90174cbd
017ce 41ba30000000                   mov        r10d, 0x30
017d4 eb11                           jmp        0x7f6a90174ce7
017d6 50                             push       rax
017d7 4833c0                         xor        rax, rax
017da f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
017e0 58                             pop        rax
017e1 ebbe                           jmp        0x7f6a90174ca1
017e3 4983c201                       add        r10, 1
017e7 4a8304d301                     add        qword ptr [rbx + r10*8], 1
017ec 48bf00b4141100000000           movabs     rdi, 0x1114b400
017f6 8b18                           mov        ebx, dword ptr [rax]
017f8 c1eb0d                         shr        ebx, 0xd
017fb 48c1e30a                       shl        rbx, 0xa
017ff 41ba00000011                   mov        r10d, 0x11000000
01805 4903da                         add        rbx, r10
01808 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
0180c 0f8522320000                   jne        0x7f6a90177f34
01812 e900000000                     jmp        0x7f6a90174d17
01817 488bf8                         mov        rdi, rax
0181a 4889bc24c8010000               mov        qword ptr [rsp + 0x1c8], rdi
01822 483b07                         cmp        rax, qword ptr [rdi]
01825 488bf7                         mov        rsi, rdi
01828 48bb00c063846a7f0000           movabs     rbx, 0x7f6a8463c000
01832 8b36                           mov        esi, dword ptr [rsi]
01834 c1ee0d                         shr        esi, 0xd
01837 48c1e60a                       shl        rsi, 0xa
0183b 41ba00000011                   mov        r10d, 0x11000000
01841 4903f2                         add        rsi, r10
01844 41baa4000000                   mov        r10d, 0xa4
0184a 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
0184e 743c                           je         0x7f6a90174d8c
01850 4983c202                       add        r10, 2
01854 4981faa8000000                 cmp        r10, 0xa8
0185b 75ed                           jne        0x7f6a90174d4a
0185d 41baa4000000                   mov        r10d, 0xa4
01863 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01868 7415                           je         0x7f6a90174d7f
0186a 4983c202                       add        r10, 2
0186e 4981faa8000000                 cmp        r10, 0xa8
01875 75ec                           jne        0x7f6a90174d63
01877 41baa3000000                   mov        r10d, 0xa3
0187d eb11                           jmp        0x7f6a90174d90
0187f 50                             push       rax
01880 4833c0                         xor        rax, rax
01883 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01889 58                             pop        rax
0188a ebb8                           jmp        0x7f6a90174d44
0188c 4983c201                       add        r10, 1
01890 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01895 48be30cb6d846a7f0000           movabs     rsi, 0x7f6a846dcb30
0189f 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
018a2 83c302                         add        ebx, 2
018a5 895e78                         mov        dword ptr [rsi + 0x78], ebx
018a8 81e3feff1f00                   and        ebx, 0x1ffffe
018ae 85db                           test       ebx, ebx
018b0 0f84b4310000                   je         0x7f6a90177f6a
018b6 488bf7                         mov        rsi, rdi
018b9 48bb30cb6d846a7f0000           movabs     rbx, 0x7f6a846dcb30
018c3 8b36                           mov        esi, dword ptr [rsi]
018c5 c1ee0d                         shr        esi, 0xd
018c8 48c1e60a                       shl        rsi, 0xa
018cc 41ba00000011                   mov        r10d, 0x11000000
018d2 4903f2                         add        rsi, r10
018d5 41ba17000000                   mov        r10d, 0x17
018db 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
018df 7436                           je         0x7f6a90174e17
018e1 4983c202                       add        r10, 2
018e5 4983fa1b                       cmp        r10, 0x1b
018e9 75f0                           jne        0x7f6a90174ddb
018eb 41ba17000000                   mov        r10d, 0x17
018f1 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
018f6 7412                           je         0x7f6a90174e0a
018f8 4983c202                       add        r10, 2
018fc 4983fa1b                       cmp        r10, 0x1b
01900 75ef                           jne        0x7f6a90174df1
01902 41ba16000000                   mov        r10d, 0x16
01908 eb11                           jmp        0x7f6a90174e1b
0190a 50                             push       rax
0190b 4833c0                         xor        rax, rax
0190e f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01914 58                             pop        rax
01915 ebbe                           jmp        0x7f6a90174dd5
01917 4983c201                       add        r10, 1
0191b 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01920 488bf7                         mov        rsi, rdi
01923 90                             nop        
01924 90                             nop        
01925 48b8c0aa74646a7f0000           movabs     rax, 0x7f6a6474aac0
0192f e82ca95b07                     call       0x7f6a9772f760
01934 0f1f84002c1a0007               nop        dword ptr [rax + rax + 0x7001a2c]
0193c 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
01944 8b7704                         mov        esi, dword ptr [rdi + 4]
01947 48bb30cb6d846a7f0000           movabs     rbx, 0x7f6a846dcb30
01951 488383e000000001               add        qword ptr [rbx + 0xe0], 1
01959 48bb58b36d846a7f0000           movabs     rbx, 0x7f6a846db358
01963 8b5378                         mov        edx, dword ptr [rbx + 0x78]
01966 83c202                         add        edx, 2
01969 895378                         mov        dword ptr [rbx + 0x78], edx
0196c 81e2feff1f00                   and        edx, 0x1ffffe
01972 85d2                           test       edx, edx
01974 0f842a310000                   je         0x7f6a90177fa4
0197a 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01982 48bb58b36d846a7f0000           movabs     rbx, 0x7f6a846db358
0198c 4883831001000001               add        qword ptr [rbx + 0x110], 1
01994 ffc8                           dec        eax
01996 2bf0                           sub        esi, eax
01998 48bbe8a96d846a7f0000           movabs     rbx, 0x7f6a846da9e8
019a2 8b4378                         mov        eax, dword ptr [rbx + 0x78]
019a5 83c002                         add        eax, 2
019a8 894378                         mov        dword ptr [rbx + 0x78], eax
019ab 25feff1f00                     and        eax, 0x1ffffe
019b0 85c0                           test       eax, eax
019b2 0f840d310000                   je         0x7f6a90177fc5
019b8 48bbe8a96d846a7f0000           movabs     rbx, 0x7f6a846da9e8
019c2 488383b000000001               add        qword ptr [rbx + 0xb0], 1
019ca 48bb0000000000000000           movabs     rbx, 0
019d4 bb00000000                     mov        ebx, 0
019d9 443bdb                         cmp        r11d, ebx
019dc 0f8c04310000                   jl         0x7f6a90177fe6
019e2 443bde                         cmp        r11d, esi
019e5 0f8d1c310000                   jge        0x7f6a90178007
019eb 498bdb                         mov        rbx, r11
019ee 899c24c4010000                 mov        dword ptr [rsp + 0x1c4], ebx
019f5 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
019fd 488bbc24c8010000               mov        rdi, qword ptr [rsp + 0x1c8]
01a05 488bf7                         mov        rsi, rdi
01a08 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
01a12 8b36                           mov        esi, dword ptr [rsi]
01a14 c1ee0d                         shr        esi, 0xd
01a17 48c1e60a                       shl        rsi, 0xa
01a1b 41ba00000011                   mov        r10d, 0x11000000
01a21 4903f2                         add        rsi, r10
01a24 41ba1f000000                   mov        r10d, 0x1f
01a2a 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01a2e 7436                           je         0x7f6a90174f66
01a30 4983c202                       add        r10, 2
01a34 4983fa23                       cmp        r10, 0x23
01a38 75f0                           jne        0x7f6a90174f2a
01a3a 41ba1f000000                   mov        r10d, 0x1f
01a40 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01a45 7412                           je         0x7f6a90174f59
01a47 4983c202                       add        r10, 2
01a4b 4983fa23                       cmp        r10, 0x23
01a4f 75ef                           jne        0x7f6a90174f40
01a51 41ba1e000000                   mov        r10d, 0x1e
01a57 eb11                           jmp        0x7f6a90174f6a
01a59 50                             push       rax
01a5a 4833c0                         xor        rax, rax
01a5d f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01a63 58                             pop        rax
01a64 ebbe                           jmp        0x7f6a90174f24
01a66 4983c201                       add        r10, 1
01a6a 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01a6f 488bf7                         mov        rsi, rdi
01a72 90                             nop        
01a73 90                             nop        
01a74 90                             nop        
01a75 48b8e8aa74646a7f0000           movabs     rax, 0x7f6a6474aae8
01a7f e8dca75b07                     call       0x7f6a9772f760
01a84 0f1f84007c1b0008               nop        dword ptr [rax + rax + 0x8001b7c]
01a8c 483b00                         cmp        rax, qword ptr [rax]
01a8f 488bf0                         mov        rsi, rax
01a92 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
01a9c 8b36                           mov        esi, dword ptr [rsi]
01a9e c1ee0d                         shr        esi, 0xd
01aa1 48c1e60a                       shl        rsi, 0xa
01aa5 41ba00000011                   mov        r10d, 0x11000000
01aab 4903f2                         add        rsi, r10
01aae 41ba25000000                   mov        r10d, 0x25
01ab4 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01ab8 7436                           je         0x7f6a90174ff0
01aba 4983c202                       add        r10, 2
01abe 4983fa29                       cmp        r10, 0x29
01ac2 75f0                           jne        0x7f6a90174fb4
01ac4 41ba25000000                   mov        r10d, 0x25
01aca 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01acf 7412                           je         0x7f6a90174fe3
01ad1 4983c202                       add        r10, 2
01ad5 4983fa29                       cmp        r10, 0x29
01ad9 75ef                           jne        0x7f6a90174fca
01adb 41ba24000000                   mov        r10d, 0x24
01ae1 eb11                           jmp        0x7f6a90174ff4
01ae3 50                             push       rax
01ae4 4833c0                         xor        rax, rax
01ae7 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01aed 58                             pop        rax
01aee ebbe                           jmp        0x7f6a90174fae
01af0 4983c201                       add        r10, 1
01af4 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01af9 8b7024                         mov        esi, dword ptr [rax + 0x24]
01afc 4c3b2595ad7d20                 cmp        r12, qword ptr [rip + 0x207dad95]
01b03 0f8414000000                   je         0x7f6a9017501d
01b09 48bf2832a2ae6a7f0000           movabs     rdi, 0x7f6aaea23228
01b13 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b17 e84495ba1f                     call       0x7f6aafd1e560
01b1c f4                             hlt        
01b1d 488bd0                         mov        rdx, rax
01b20 48b930cb6d846a7f0000           movabs     rcx, 0x7f6a846dcb30
01b2a 8b12                           mov        edx, dword ptr [rdx]
01b2c c1ea0d                         shr        edx, 0xd
01b2f 48c1e20a                       shl        rdx, 0xa
01b33 41ba00000011                   mov        r10d, 0x11000000
01b39 4903d2                         add        rdx, r10
01b3c 41ba2b000000                   mov        r10d, 0x2b
01b42 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01b46 7436                           je         0x7f6a9017507e
01b48 4983c202                       add        r10, 2
01b4c 4983fa2f                       cmp        r10, 0x2f
01b50 75f0                           jne        0x7f6a90175042
01b52 41ba2b000000                   mov        r10d, 0x2b
01b58 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01b5d 7412                           je         0x7f6a90175071
01b5f 4983c202                       add        r10, 2
01b63 4983fa2f                       cmp        r10, 0x2f
01b67 75ef                           jne        0x7f6a90175058
01b69 41ba2a000000                   mov        r10d, 0x2a
01b6f eb11                           jmp        0x7f6a90175082
01b71 50                             push       rax
01b72 4833c0                         xor        rax, rax
01b75 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
01b7b 58                             pop        rax
01b7c ebbe                           jmp        0x7f6a9017503c
01b7e 4983c201                       add        r10, 1
01b82 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01b87 8b4804                         mov        ecx, dword ptr [rax + 4]
01b8a 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
01b94 4883828001000001               add        qword ptr [rdx + 0x180], 1
01b9c 48baa0b56d846a7f0000           movabs     rdx, 0x7f6a846db5a0
01ba6 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01baa 4183c002                       add        r8d, 2
01bae 44894278                       mov        dword ptr [rdx + 0x78], r8d
01bb2 4181e0feff1f00                 and        r8d, 0x1ffffe
01bb9 4585c0                         test       r8d, r8d
01bbc 0f847f2f0000                   je         0x7f6a90178041
01bc2 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
01bcc 4883829001000001               add        qword ptr [rdx + 0x190], 1
01bd4 8b9c24c4010000                 mov        ebx, dword ptr [rsp + 0x1c4]
01bdb 4863db                         movsxd     rbx, ebx
01bde ba08000000                     mov        edx, 8
01be3 4c8bcb                         mov        r9, rbx
01be6 4c03ca                         add        r9, rdx
01be9 48ba28a76d846a7f0000           movabs     rdx, 0x7f6a846da728
01bf3 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01bf7 4183c002                       add        r8d, 2
01bfb 44894278                       mov        dword ptr [rdx + 0x78], r8d
01bff 4181e0feff1f00                 and        r8d, 0x1ffffe
01c06 4585c0                         test       r8d, r8d
01c09 0f84532f0000                   je         0x7f6a90178062
01c0f 48ba28a76d846a7f0000           movabs     rdx, 0x7f6a846da728
01c19 488382e000000001               add        qword ptr [rdx + 0xe0], 1
01c21 48baa8a86d846a7f0000           movabs     rdx, 0x7f6a846da8a8
01c2b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01c2f 4183c002                       add        r8d, 2
01c33 44894278                       mov        dword ptr [rdx + 0x78], r8d
01c37 4181e0feff1f00                 and        r8d, 0x1ffffe
01c3e 4585c0                         test       r8d, r8d
01c41 0f843c2f0000                   je         0x7f6a90178083
01c47 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
01c51 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
01c59 48ba703c2fe300000000           movabs     rdx, 0xe32f3c70
01c63 ba02000000                     mov        edx, 2
01c68 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
01c70 bf00000000                     mov        edi, 0
01c75 488b8424c8010000               mov        rax, qword ptr [rsp + 0x1c8]
01c7d 48890424                       mov        qword ptr [rsp], rax
01c81 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
01c89 4889442408                     mov        qword ptr [rsp + 8], rax
01c8e 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01c93 49ba703c2fe300000000           movabs     r10, 0xe32f3c70
01c9d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ca2 90                             nop        
01ca3 90                             nop        
01ca4 90                             nop        
01ca5 90                             nop        
01ca6 90                             nop        
01ca7 e8b4aa5b07                     call       0x7f6a9772fc60
01cac 0f1f8400a41d0009               nop        dword ptr [rax + rax + 0x9001da4]
01cb4 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01cbc 4183c310                       add        r11d, 0x10
01cc0 8bb424c0010000                 mov        esi, dword ptr [rsp + 0x1c0]
01cc7 83c610                         add        esi, 0x10
01cca 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01cd2 ba02000000                     mov        edx, 2
01cd7 7c05                           jl         0x7f6a901751de
01cd9 ba00000000                     mov        edx, 0
01cde 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
01ce8 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
01cec 4403c2                         add        r8d, edx
01cef 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
01cf3 85d2                           test       edx, edx
01cf5 7506                           jne        0x7f6a901751fd
01cf7 41b802000000                   mov        r8d, 2
01cfd 4181e0fe3f0000                 and        r8d, 0x3ffe
01d04 4585c0                         test       r8d, r8d
01d07 0f84972e0000                   je         0x7f6a901780a4
01d0d 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01d11 418502                         test       dword ptr [r10], eax
01d14 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
01d1c 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
01d26 b948050000                     mov        ecx, 0x548
01d2b 7c05                           jl         0x7f6a90175232
01d2d b958050000                     mov        ecx, 0x558
01d32 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01d36 4d8d4001                       lea        r8, [r8 + 1]
01d3a 4c89040a                       mov        qword ptr [rdx + rcx], r8
01d3e 0f8c0cf5ffff                   jl         0x7f6a90174750
01d44 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
01d4e ff8668050000                   inc        dword ptr [rsi + 0x568]
01d54 e9f0000000                     jmp        0x7f6a90175349
01d59 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
01d63 4883828005000001               add        qword ptr [rdx + 0x580], 1
01d6b 488bb42468010000               mov        rsi, qword ptr [rsp + 0x168]
01d73 8b942490010000                 mov        edx, dword ptr [rsp + 0x190]
01d7a 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
01d82 448b842474010000               mov        r8d, dword ptr [rsp + 0x174]
01d8a 4c8bcf                         mov        r9, rdi
01d8d 4885c9                         test       rcx, rcx
01d90 0f842f2e0000                   je         0x7f6a901780c5
01d96 85d2                           test       edx, edx
01d98 0f8c272e0000                   jl         0x7f6a901780c5
01d9e 4585c0                         test       r8d, r8d
01da1 0f8c1e2e0000                   jl         0x7f6a901780c5
01da7 4a8d3c0a                       lea        rdi, [rdx + r9]
01dab 3b7e04                         cmp        edi, dword ptr [rsi + 4]
01dae 0f87112e0000                   ja         0x7f6a901780c5
01db4 4b8d3c08                       lea        rdi, [r8 + r9]
01db8 3b7904                         cmp        edi, dword ptr [rcx + 4]
01dbb 0f87042e0000                   ja         0x7f6a901780c5
01dc1 4585c9                         test       r9d, r9d
01dc4 0f8cfb2d0000                   jl         0x7f6a901780c5
01dca 4863d2                         movsxd     rdx, edx
01dcd 4d63c0                         movsxd     r8, r8d
01dd0 48bf0014041100000000           movabs     rdi, 0x11041400
01dda 41ba00000011                   mov        r10d, 0x11000000
01de0 492bfa                         sub        rdi, r10
01de3 48c1ef0a                       shr        rdi, 0xa
01de7 448b19                         mov        r11d, dword ptr [rcx]
01dea 41c1eb0d                       shr        r11d, 0xd
01dee 413bfb                         cmp        edi, r11d
01df1 0f8510000000                   jne        0x7f6a90175307
01df7 448b1e                         mov        r11d, dword ptr [rsi]
01dfa 41c1eb0d                       shr        r11d, 0xd
01dfe 413bfb                         cmp        edi, r11d
01e01 0f8414000000                   je         0x7f6a9017531b
01e07 48bf78a49bae6a7f0000           movabs     rdi, 0x7f6aae9ba478
01e11 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e15 e84692ba1f                     call       0x7f6aafd1e560
01e1a f4                             hlt        
01e1b 488d7c1608                     lea        rdi, [rsi + rdx + 8]
01e20 4a8d740108                     lea        rsi, [rcx + r8 + 8]
01e25 498bd1                         mov        rdx, r9
01e28 40f6c40f                       test       spl, 0xf
01e2c 0f8412000000                   je         0x7f6a90175344
01e32 4883ec08                       sub        rsp, 8
01e36 e8053e5a07                     call       0x7f6a97719140
01e3b 4883c408                       add        rsp, 8
01e3f e905000000                     jmp        0x7f6a90175349
01e44 e8f73d5a07                     call       0x7f6a97719140
01e49 8bb424a4010000                 mov        esi, dword ptr [rsp + 0x1a4]
01e50 8b9c24a0010000                 mov        ebx, dword ptr [rsp + 0x1a0]
01e57 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
01e5f 488bfb                         mov        rdi, rbx
01e62 2bbc24a8010000                 sub        edi, dword ptr [rsp + 0x1a8]
01e69 4183f810                       cmp        r8d, 0x10
01e6d 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
01e77 b990050000                     mov        ecx, 0x590
01e7c 7f05                           jg         0x7f6a90175383
01e7e b9a0050000                     mov        ecx, 0x5a0
01e83 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
01e87 4d8d4901                       lea        r9, [r9 + 1]
01e8b 4c890c0a                       mov        qword ptr [rdx + rcx], r9
01e8f 448b8c24a8010000               mov        r9d, dword ptr [rsp + 0x1a8]
01e97 0f8f2c000000                   jg         0x7f6a901753c9
01e9d 4183f910                       cmp        r9d, 0x10
01ea1 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
01eab b9c0050000                     mov        ecx, 0x5c0
01eb0 7d05                           jge        0x7f6a901753b7
01eb2 b9b0050000                     mov        ecx, 0x5b0
01eb7 488b040a                       mov        rax, qword ptr [rdx + rcx]
01ebb 488d4001                       lea        rax, [rax + 1]
01ebf 4889040a                       mov        qword ptr [rdx + rcx], rax
01ec3 0f8d23160000                   jge        0x7f6a901769ec
01ec9 453bc8                         cmp        r9d, r8d
01ecc 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
01ed6 b928060000                     mov        ecx, 0x628
01edb 7c05                           jl         0x7f6a901753e2
01edd b938060000                     mov        ecx, 0x638
01ee2 488b040a                       mov        rax, qword ptr [rdx + rcx]
01ee6 488d4001                       lea        rax, [rax + 1]
01eea 4889040a                       mov        qword ptr [rdx + rcx], rax
01eee 0f8cd9050000                   jl         0x7f6a901759cd
01ef4 4183f830                       cmp        r8d, 0x30
01ef8 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
01f02 b948060000                     mov        ecx, 0x648
01f07 7e05                           jle        0x7f6a9017540e
01f09 b958060000                     mov        ecx, 0x658
01f0e 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
01f12 4d8d4901                       lea        r9, [r9 + 1]
01f16 4c890c0a                       mov        qword ptr [rdx + rcx], r9
01f1a 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
01f21 0f8e0f010000                   jle        0x7f6a90175536
01f27 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
01f31 4883826806000001               add        qword ptr [rdx + 0x668], 1
01f39 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
01f41 488bd7                         mov        rdx, rdi
01f44 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
01f4c 498bf8                         mov        rdi, r8
01f4f 4c8bc3                         mov        r8, rbx
01f52 4c8bcf                         mov        r9, rdi
01f55 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
01f5c 4885f6                         test       rsi, rsi
01f5f 0f846c2c0000                   je         0x7f6a901780d1
01f65 4885c9                         test       rcx, rcx
01f68 0f84632c0000                   je         0x7f6a901780d1
01f6e 85d2                           test       edx, edx
01f70 0f8c5b2c0000                   jl         0x7f6a901780d1
01f76 4585c0                         test       r8d, r8d
01f79 0f8c522c0000                   jl         0x7f6a901780d1
01f7f 4a8d3c0a                       lea        rdi, [rdx + r9]
01f83 3b7e04                         cmp        edi, dword ptr [rsi + 4]
01f86 0f87452c0000                   ja         0x7f6a901780d1
01f8c 4b8d3c08                       lea        rdi, [r8 + r9]
01f90 3b7904                         cmp        edi, dword ptr [rcx + 4]
01f93 0f87382c0000                   ja         0x7f6a901780d1
01f99 4585c9                         test       r9d, r9d
01f9c 0f8c2f2c0000                   jl         0x7f6a901780d1
01fa2 4863d2                         movsxd     rdx, edx
01fa5 4d63c0                         movsxd     r8, r8d
01fa8 48bf0014041100000000           movabs     rdi, 0x11041400
01fb2 41ba00000011                   mov        r10d, 0x11000000
01fb8 492bfa                         sub        rdi, r10
01fbb 48c1ef0a                       shr        rdi, 0xa
01fbf 448b19                         mov        r11d, dword ptr [rcx]
01fc2 41c1eb0d                       shr        r11d, 0xd
01fc6 413bfb                         cmp        edi, r11d
01fc9 0f8510000000                   jne        0x7f6a901754df
01fcf 448b1e                         mov        r11d, dword ptr [rsi]
01fd2 41c1eb0d                       shr        r11d, 0xd
01fd6 413bfb                         cmp        edi, r11d
01fd9 0f8414000000                   je         0x7f6a901754f3
01fdf 48bf78a49bae6a7f0000           movabs     rdi, 0x7f6aae9ba478
01fe9 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fed e86e90ba1f                     call       0x7f6aafd1e560
01ff2 f4                             hlt        
01ff3 488d7c1608                     lea        rdi, [rsi + rdx + 8]
01ff8 4a8d740108                     lea        rsi, [rcx + r8 + 8]
01ffd 498bd1                         mov        rdx, r9
02000 40f6c40f                       test       spl, 0xf
02004 0f8412000000                   je         0x7f6a9017551c
0200a 4883ec08                       sub        rsp, 8
0200e e82d3c5a07                     call       0x7f6a97719140
02013 4883c408                       add        rsp, 8
02017 e905000000                     jmp        0x7f6a90175521
0201c e81f3c5a07                     call       0x7f6a97719140
02021 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
0202b ff8278060000                   inc        dword ptr [rdx + 0x678]
02031 e974040000                     jmp        0x7f6a901759aa
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
0206f 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
02079 4883829006000001               add        qword ptr [rdx + 0x690], 1
02081 48ba206a101100000000           movabs     rdx, 0x11106a20
0208b 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0208e 83c102                         add        ecx, 2
02091 894a78                         mov        dword ptr [rdx + 0x78], ecx
02094 81e1feff1f00                   and        ecx, 0x1ffffe
0209a 85c9                           test       ecx, ecx
0209c 0f843f2b0000                   je         0x7f6a901780e1
020a2 48ba206a101100000000           movabs     rdx, 0x11106a20
020ac 488d92e0000000                 lea        rdx, [rdx + 0xe0]
020b3 4885c0                         test       rax, rax
020b6 7510                           jne        0x7f6a901755c8
020b8 f6420801                       test       byte ptr [rdx + 8], 1
020bc 0f8506000000                   jne        0x7f6a901755c8
020c2 f048834a0801                   lock or    qword ptr [rdx + 8], 1
020c8 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
020d2 488d9248030000                 lea        rdx, [rdx + 0x348]
020d9 4885c0                         test       rax, rax
020dc 7510                           jne        0x7f6a901755ee
020de f6421001                       test       byte ptr [rdx + 0x10], 1
020e2 0f8506000000                   jne        0x7f6a901755ee
020e8 f048834a1001                   lock or    qword ptr [rdx + 0x10], 1
020ee 48ba206a101100000000           movabs     rdx, 0x11106a20
020f8 488382b000000001               add        qword ptr [rdx + 0xb0], 1
02100 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
0210a 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0210d 83c102                         add        ecx, 2
02110 894a78                         mov        dword ptr [rdx + 0x78], ecx
02113 81e1feff1f00                   and        ecx, 0x1ffffe
02119 85c9                           test       ecx, ecx
0211b 0f84e12a0000                   je         0x7f6a90178102
02121 48bad82e29e300000000           movabs     rdx, 0xe3292ed8
0212b 48b9787e73846a7f0000           movabs     rcx, 0x7f6a84737e78
02135 8b12                           mov        edx, dword ptr [rdx]
02137 c1ea0d                         shr        edx, 0xd
0213a 48c1e20a                       shl        rdx, 0xa
0213e 41ba00000011                   mov        r10d, 0x11000000
02144 4903d2                         add        rdx, r10
02147 41ba17000000                   mov        r10d, 0x17
0214d 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02151 7436                           je         0x7f6a90175689
02153 4983c202                       add        r10, 2
02157 4983fa1b                       cmp        r10, 0x1b
0215b 75f0                           jne        0x7f6a9017564d
0215d 41ba17000000                   mov        r10d, 0x17
02163 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02168 7412                           je         0x7f6a9017567c
0216a 4983c202                       add        r10, 2
0216e 4983fa1b                       cmp        r10, 0x1b
02172 75ef                           jne        0x7f6a90175663
02174 41ba16000000                   mov        r10d, 0x16
0217a eb11                           jmp        0x7f6a9017568d
0217c 50                             push       rax
0217d 4833c0                         xor        rax, rax
02180 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02186 58                             pop        rax
02187 ebbe                           jmp        0x7f6a90175647
02189 4983c201                       add        r10, 1
0218d 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02192 48bac87873846a7f0000           movabs     rdx, 0x7f6a847378c8
0219c 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0219f 83c102                         add        ecx, 2
021a2 894a78                         mov        dword ptr [rdx + 0x78], ecx
021a5 81e1feff1f00                   and        ecx, 0x1ffffe
021ab 85c9                           test       ecx, ecx
021ad 0f84702a0000                   je         0x7f6a90178123
021b3 48bac87873846a7f0000           movabs     rdx, 0x7f6a847378c8
021bd ff82b0000000                   inc        dword ptr [rdx + 0xb0]
021c3 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
021cd ff8208010000                   inc        dword ptr [rdx + 0x108]
021d3 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
021dd ff8228010000                   inc        dword ptr [rdx + 0x128]
021e3 48ba902729e300000000           movabs     rdx, 0xe3292790
021ed 48b9787e73846a7f0000           movabs     rcx, 0x7f6a84737e78
021f7 8b12                           mov        edx, dword ptr [rdx]
021f9 c1ea0d                         shr        edx, 0xd
021fc 48c1e20a                       shl        rdx, 0xa
02200 41ba00000011                   mov        r10d, 0x11000000
02206 4903d2                         add        rdx, r10
02209 41ba28000000                   mov        r10d, 0x28
0220f 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02213 7436                           je         0x7f6a9017574b
02215 4983c202                       add        r10, 2
02219 4983fa2c                       cmp        r10, 0x2c
0221d 75f0                           jne        0x7f6a9017570f
0221f 41ba28000000                   mov        r10d, 0x28
02225 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0222a 7412                           je         0x7f6a9017573e
0222c 4983c202                       add        r10, 2
02230 4983fa2c                       cmp        r10, 0x2c
02234 75ef                           jne        0x7f6a90175725
02236 41ba27000000                   mov        r10d, 0x27
0223c eb11                           jmp        0x7f6a9017574f
0223e 50                             push       rax
0223f 4833c0                         xor        rax, rax
02242 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02248 58                             pop        rax
02249 ebbe                           jmp        0x7f6a90175709
0224b 4983c201                       add        r10, 1
0224f 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02254 48baf87b73846a7f0000           movabs     rdx, 0x7f6a84737bf8
0225e 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02261 83c102                         add        ecx, 2
02264 894a78                         mov        dword ptr [rdx + 0x78], ecx
02267 81e1feff1f00                   and        ecx, 0x1ffffe
0226d 85c9                           test       ecx, ecx
0226f 0f84cf290000                   je         0x7f6a90178144
02275 48baf87b73846a7f0000           movabs     rdx, 0x7f6a84737bf8
0227f ff82b0000000                   inc        dword ptr [rdx + 0xb0]
02285 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
0228f 488d9288010000                 lea        rdx, [rdx + 0x188]
02296 4885c0                         test       rax, rax
02299 7510                           jne        0x7f6a901757ab
0229b f6421801                       test       byte ptr [rdx + 0x18], 1
0229f 0f8506000000                   jne        0x7f6a901757ab
022a5 f048834a1801                   lock or    qword ptr [rdx + 0x18], 1
022ab 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
022b5 4883827801000001               add        qword ptr [rdx + 0x178], 1
022bd 48bad88173846a7f0000           movabs     rdx, 0x7f6a847381d8
022c7 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
022ca 83c102                         add        ecx, 2
022cd 894a78                         mov        dword ptr [rdx + 0x78], ecx
022d0 81e1feff1f00                   and        ecx, 0x1ffffe
022d6 85c9                           test       ecx, ecx
022d8 0f8487290000                   je         0x7f6a90178165
022de 48bad88173846a7f0000           movabs     rdx, 0x7f6a847381d8
022e8 4883821001000001               add        qword ptr [rdx + 0x110], 1
022f0 48baa88a141100000000           movabs     rdx, 0x11148aa8
022fa 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
022fd 83c102                         add        ecx, 2
02300 894a78                         mov        dword ptr [rdx + 0x78], ecx
02303 81e1feff1f00                   and        ecx, 0x1ffffe
02309 85c9                           test       ecx, ecx
0230b 0f8475290000                   je         0x7f6a90178186
02311 8b5004                         mov        edx, dword ptr [rax + 4]
02314 48b9a88a141100000000           movabs     rcx, 0x11148aa8
0231e 488381b000000001               add        qword ptr [rcx + 0xb0], 1
02326 83ea07                         sub        edx, 7
02329 48b928fe22e200000000           movabs     rcx, 0xe222fe28
02333 b900000000                     mov        ecx, 0
02338 3bf9                           cmp        edi, ecx
0233a 0f8c80290000                   jl         0x7f6a901781c0
02340 3bfa                           cmp        edi, edx
02342 0f8d99290000                   jge        0x7f6a901781e1
02348 488bd7                         mov        rdx, rdi
0234b 48bef8a422e200000000           movabs     rsi, 0xe222a4f8
02355 488bce                         mov        rcx, rsi
02358 49b8d88173846a7f0000           movabs     r8, 0x7f6a847381d8
02362 8b09                           mov        ecx, dword ptr [rcx]
02364 c1e90d                         shr        ecx, 0xd
02367 48c1e10a                       shl        rcx, 0xa
0236b 41ba00000011                   mov        r10d, 0x11000000
02371 4903ca                         add        rcx, r10
02374 41ba25000000                   mov        r10d, 0x25
0237a 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0237e 7436                           je         0x7f6a901758b6
02380 4983c202                       add        r10, 2
02384 4983fa29                       cmp        r10, 0x29
02388 75f0                           jne        0x7f6a9017587a
0238a 41ba25000000                   mov        r10d, 0x25
02390 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
02395 7412                           je         0x7f6a901758a9
02397 4983c202                       add        r10, 2
0239b 4983fa29                       cmp        r10, 0x29
0239f 75ef                           jne        0x7f6a90175890
023a1 41ba24000000                   mov        r10d, 0x24
023a7 eb11                           jmp        0x7f6a901758ba
023a9 50                             push       rax
023aa 4833c0                         xor        rax, rax
023ad f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
023b3 58                             pop        rax
023b4 ebbe                           jmp        0x7f6a90175874
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
023df e87c995b07                     call       0x7f6a9772f260
023e4 0f1f8400dc24000b               nop        dword ptr [rax + rax + 0xb0024dc]
023ec 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
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
02417 e844a35b07                     call       0x7f6a9772fc60
0241c 0f1f84001425000c               nop        dword ptr [rax + rax + 0xc002514]
02424 8b8424d8010000                 mov        eax, dword ptr [rsp + 0x1d8]
0242b 83c008                         add        eax, 8
0242e 8bbc24dc010000                 mov        edi, dword ptr [rsp + 0x1dc]
02435 83c708                         add        edi, 8
02438 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
0243f be02000000                     mov        esi, 2
02444 7c05                           jl         0x7f6a9017594b
02446 be00000000                     mov        esi, 0
0244b 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
02455 8b4a7c                         mov        ecx, dword ptr [rdx + 0x7c]
02458 03ce                           add        ecx, esi
0245a 894a7c                         mov        dword ptr [rdx + 0x7c], ecx
0245d 85f6                           test       esi, esi
0245f 7505                           jne        0x7f6a90175966
02461 b902000000                     mov        ecx, 2
02466 81e1fe3f0000                   and        ecx, 0x3ffe
0246c 85c9                           test       ecx, ecx
0246e 0f848e280000                   je         0x7f6a90178202
02474 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02478 418502                         test       dword ptr [r10], eax
0247b 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
02482 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
0248c bab0060000                     mov        edx, 0x6b0
02491 7c05                           jl         0x7f6a90175998
02493 bac0060000                     mov        edx, 0x6c0
02498 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0249c 488d4901                       lea        rcx, [rcx + 1]
024a0 48890c16                       mov        qword ptr [rsi + rdx], rcx
024a4 0f8cb6fbffff                   jl         0x7f6a90175560
024aa 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
024b1 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
024b8 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
024c2 ff86d0060000                   inc        dword ptr [rsi + 0x6d0]
024c8 e9491a0000                     jmp        0x7f6a90177416
024cd 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
024d4 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
024db 4183f910                       cmp        r9d, 0x10
024df 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
024e9 bae8060000                     mov        edx, 0x6e8
024ee 7c05                           jl         0x7f6a901759f5
024f0 baf8060000                     mov        edx, 0x6f8
024f5 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
024f9 488d4901                       lea        rcx, [rcx + 1]
024fd 48890c16                       mov        qword ptr [rsi + rdx], rcx
02501 0f8ced0a0000                   jl         0x7f6a901764f4
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
02537 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
02541 4883860807000001               add        qword ptr [rsi + 0x708], 1
02549 48be28be6d846a7f0000           movabs     rsi, 0x7f6a846dbe28
02553 8b5678                         mov        edx, dword ptr [rsi + 0x78]
02556 83c202                         add        edx, 2
02559 895678                         mov        dword ptr [rsi + 0x78], edx
0255c 81e2feff1f00                   and        edx, 0x1ffffe
02562 85d2                           test       edx, edx
02564 0f84b9270000                   je         0x7f6a90178223
0256a 48bec0c52de300000000           movabs     rsi, 0xe32dc5c0
02574 48ba28be6d846a7f0000           movabs     rdx, 0x7f6a846dbe28
0257e 8b36                           mov        esi, dword ptr [rsi]
02580 c1ee0d                         shr        esi, 0xd
02583 48c1e60a                       shl        rsi, 0xa
02587 41ba00000011                   mov        r10d, 0x11000000
0258d 4903f2                         add        rsi, r10
02590 41ba17000000                   mov        r10d, 0x17
02596 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
0259a 7436                           je         0x7f6a90175ad2
0259c 4983c202                       add        r10, 2
025a0 4983fa1b                       cmp        r10, 0x1b
025a4 75f0                           jne        0x7f6a90175a96
025a6 41ba17000000                   mov        r10d, 0x17
025ac 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
025b1 7412                           je         0x7f6a90175ac5
025b3 4983c202                       add        r10, 2
025b7 4983fa1b                       cmp        r10, 0x1b
025bb 75ef                           jne        0x7f6a90175aac
025bd 41ba16000000                   mov        r10d, 0x16
025c3 eb11                           jmp        0x7f6a90175ad6
025c5 50                             push       rax
025c6 4833c0                         xor        rax, rax
025c9 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
025cf 58                             pop        rax
025d0 ebbe                           jmp        0x7f6a90175a90
025d2 4983c201                       add        r10, 1
025d6 4a8304d201                     add        qword ptr [rdx + r10*8], 1
025db 448b6804                       mov        r13d, dword ptr [rax + 4]
025df 48be28be6d846a7f0000           movabs     rsi, 0x7f6a846dbe28
025e9 488386e000000001               add        qword ptr [rsi + 0xe0], 1
025f1 48be58b36d846a7f0000           movabs     rsi, 0x7f6a846db358
025fb 8b5678                         mov        edx, dword ptr [rsi + 0x78]
025fe 83c202                         add        edx, 2
02601 895678                         mov        dword ptr [rsi + 0x78], edx
02604 81e2feff1f00                   and        edx, 0x1ffffe
0260a 85d2                           test       edx, edx
0260c 0f844b270000                   je         0x7f6a9017825d
02612 48be58b36d846a7f0000           movabs     rsi, 0x7f6a846db358
0261c 4883861001000001               add        qword ptr [rsi + 0x110], 1
02624 498bf5                         mov        rsi, r13
02627 83ee0f                         sub        esi, 0xf
0262a 48bae8a96d846a7f0000           movabs     rdx, 0x7f6a846da9e8
02634 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02637 83c102                         add        ecx, 2
0263a 894a78                         mov        dword ptr [rdx + 0x78], ecx
0263d 81e1feff1f00                   and        ecx, 0x1ffffe
02643 85c9                           test       ecx, ecx
02645 0f8433270000                   je         0x7f6a9017827e
0264b 48bae8a96d846a7f0000           movabs     rdx, 0x7f6a846da9e8
02655 488382b000000001               add        qword ptr [rdx + 0xb0], 1
0265d 48ba0000000000000000           movabs     rdx, 0
02667 ba00000000                     mov        edx, 0
0266c 3bfa                           cmp        edi, edx
0266e 0f8c2b270000                   jl         0x7f6a9017829f
02674 3bfe                           cmp        edi, esi
02676 0f8d44270000                   jge        0x7f6a901782c0
0267c 488bf7                         mov        rsi, rdi
0267f 48bac0c52de300000000           movabs     rdx, 0xe32dc5c0
02689 488bca                         mov        rcx, rdx
0268c 49b828be6d846a7f0000           movabs     r8, 0x7f6a846dbe28
02696 8b09                           mov        ecx, dword ptr [rcx]
02698 c1e90d                         shr        ecx, 0xd
0269b 48c1e10a                       shl        rcx, 0xa
0269f 41ba00000011                   mov        r10d, 0x11000000
026a5 4903ca                         add        rcx, r10
026a8 41ba25000000                   mov        r10d, 0x25
026ae 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
026b2 7436                           je         0x7f6a90175bea
026b4 4983c202                       add        r10, 2
026b8 4983fa29                       cmp        r10, 0x29
026bc 75f0                           jne        0x7f6a90175bae
026be 41ba25000000                   mov        r10d, 0x25
026c4 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
026c9 7412                           je         0x7f6a90175bdd
026cb 4983c202                       add        r10, 2
026cf 4983fa29                       cmp        r10, 0x29
026d3 75ef                           jne        0x7f6a90175bc4
026d5 41ba24000000                   mov        r10d, 0x24
026db eb11                           jmp        0x7f6a90175bee
026dd 50                             push       rax
026de 4833c0                         xor        rax, rax
026e1 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
026e7 58                             pop        rax
026e8 ebbe                           jmp        0x7f6a90175ba8
026ea 4983c201                       add        r10, 1
026ee 4b8304d001                     add        qword ptr [r8 + r10*8], 1
026f3 48b9f0aa6d846a7f0000           movabs     rcx, 0x7f6a846daaf0
026fd 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
02701 4183c002                       add        r8d, 2
02705 44894178                       mov        dword ptr [rcx + 0x78], r8d
02709 4181e0feff1f00                 and        r8d, 0x1ffffe
02710 4585c0                         test       r8d, r8d
02713 0f84c8260000                   je         0x7f6a901782e1
02719 48b9f0aa6d846a7f0000           movabs     rcx, 0x7f6a846daaf0
02723 488381b000000001               add        qword ptr [rcx + 0xb0], 1
0272b 48ba20ac6d846a7f0000           movabs     rdx, 0x7f6a846dac20
02735 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02738 83c102                         add        ecx, 2
0273b 894a78                         mov        dword ptr [rdx + 0x78], ecx
0273e 81e1feff1f00                   and        ecx, 0x1ffffe
02744 85c9                           test       ecx, ecx
02746 0f84b6260000                   je         0x7f6a90178302
0274c 48ba20ac6d846a7f0000           movabs     rdx, 0x7f6a846dac20
02756 ff82c0000000                   inc        dword ptr [rdx + 0xc0]
0275c 4489ac24e8010000               mov        dword ptr [rsp + 0x1e8], r13d
02764 89bc24e4010000                 mov        dword ptr [rsp + 0x1e4], edi
0276b 48bab8452ee300000000           movabs     rdx, 0xe32e45b8
02775 488bca                         mov        rcx, rdx
02778 49b828be6d846a7f0000           movabs     r8, 0x7f6a846dbe28
02782 4983806001000001               add        qword ptr [r8 + 0x160], 1
0278a 48b9f8bf6d846a7f0000           movabs     rcx, 0x7f6a846dbff8
02794 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
02798 4183c002                       add        r8d, 2
0279c 44894178                       mov        dword ptr [rcx + 0x78], r8d
027a0 4181e0feff1f00                 and        r8d, 0x1ffffe
027a7 4585c0                         test       r8d, r8d
027aa 0f8473260000                   je         0x7f6a90178323
027b0 488bca                         mov        rcx, rdx
027b3 49b8f8bf6d846a7f0000           movabs     r8, 0x7f6a846dbff8
027bd 498380b000000001               add        qword ptr [r8 + 0xb0], 1
027c5 48b9e0c06d846a7f0000           movabs     rcx, 0x7f6a846dc0e0
027cf 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
027d3 4183c002                       add        r8d, 2
027d7 44894178                       mov        dword ptr [rcx + 0x78], r8d
027db 4181e0feff1f00                 and        r8d, 0x1ffffe
027e2 4585c0                         test       r8d, r8d
027e5 0f8459260000                   je         0x7f6a90178344
027eb 48b9e0c06d846a7f0000           movabs     rcx, 0x7f6a846dc0e0
027f5 488381c000000001               add        qword ptr [rcx + 0xc0], 1
027fd 48bad8b46d846a7f0000           movabs     rdx, 0x7f6a846db4d8
02807 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0280a 83c102                         add        ecx, 2
0280d 894a78                         mov        dword ptr [rdx + 0x78], ecx
02810 81e1feff1f00                   and        ecx, 0x1ffffe
02816 85c9                           test       ecx, ecx
02818 0f8447260000                   je         0x7f6a90178365
0281e 48bac0c52de300000000           movabs     rdx, 0xe32dc5c0
02828 488bca                         mov        rcx, rdx
0282b 49b8e0c06d846a7f0000           movabs     r8, 0x7f6a846dc0e0
02835 8b09                           mov        ecx, dword ptr [rcx]
02837 c1e90d                         shr        ecx, 0xd
0283a 48c1e10a                       shl        rcx, 0xa
0283e 41ba00000011                   mov        r10d, 0x11000000
02844 4903ca                         add        rcx, r10
02847 41ba1d000000                   mov        r10d, 0x1d
0284d 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
02851 7436                           je         0x7f6a90175d89
02853 4983c202                       add        r10, 2
02857 4983fa21                       cmp        r10, 0x21
0285b 75f0                           jne        0x7f6a90175d4d
0285d 41ba1d000000                   mov        r10d, 0x1d
02863 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
02868 7412                           je         0x7f6a90175d7c
0286a 4983c202                       add        r10, 2
0286e 4983fa21                       cmp        r10, 0x21
02872 75ef                           jne        0x7f6a90175d63
02874 41ba1c000000                   mov        r10d, 0x1c
0287a eb11                           jmp        0x7f6a90175d8d
0287c 50                             push       rax
0287d 4833c0                         xor        rax, rax
02880 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
02886 58                             pop        rax
02887 ebbe                           jmp        0x7f6a90175d47
02889 4983c201                       add        r10, 1
0288d 4b8304d001                     add        qword ptr [r8 + r10*8], 1
02892 48b9e0c06d846a7f0000           movabs     rcx, 0x7f6a846dc0e0
0289c 8b12                           mov        edx, dword ptr [rdx]
0289e c1ea0d                         shr        edx, 0xd
028a1 48c1e20a                       shl        rdx, 0xa
028a5 41ba00000011                   mov        r10d, 0x11000000
028ab 4903d2                         add        rdx, r10
028ae 41ba23000000                   mov        r10d, 0x23
028b4 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
028b8 7436                           je         0x7f6a90175df0
028ba 4983c202                       add        r10, 2
028be 4983fa27                       cmp        r10, 0x27
028c2 75f0                           jne        0x7f6a90175db4
028c4 41ba23000000                   mov        r10d, 0x23
028ca 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
028cf 7412                           je         0x7f6a90175de3
028d1 4983c202                       add        r10, 2
028d5 4983fa27                       cmp        r10, 0x27
028d9 75ef                           jne        0x7f6a90175dca
028db 41ba22000000                   mov        r10d, 0x22
028e1 eb11                           jmp        0x7f6a90175df4
028e3 50                             push       rax
028e4 4833c0                         xor        rax, rax
028e7 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
028ed 58                             pop        rax
028ee ebbe                           jmp        0x7f6a90175dae
028f0 4983c201                       add        r10, 1
028f4 4a8304d101                     add        qword ptr [rcx + r10*8], 1
028f9 48bae0c06d846a7f0000           movabs     rdx, 0x7f6a846dc0e0
02903 4883824001000001               add        qword ptr [rdx + 0x140], 1
0290b 48baa0b56d846a7f0000           movabs     rdx, 0x7f6a846db5a0
02915 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02918 83c102                         add        ecx, 2
0291b 894a78                         mov        dword ptr [rdx + 0x78], ecx
0291e 81e1feff1f00                   and        ecx, 0x1ffffe
02924 85c9                           test       ecx, ecx
02926 0f845a250000                   je         0x7f6a90178386
0292c 48bae0c06d846a7f0000           movabs     rdx, 0x7f6a846dc0e0
02936 4883825001000001               add        qword ptr [rdx + 0x150], 1
0293e 4c63f6                         movsxd     r14, esi
02941 be08000000                     mov        esi, 8
02946 4d8bce                         mov        r9, r14
02949 4c03ce                         add        r9, rsi
0294c 48be28a76d846a7f0000           movabs     rsi, 0x7f6a846da728
02956 8b5678                         mov        edx, dword ptr [rsi + 0x78]
02959 83c202                         add        edx, 2
0295c 895678                         mov        dword ptr [rsi + 0x78], edx
0295f 81e2feff1f00                   and        edx, 0x1ffffe
02965 85d2                           test       edx, edx
02967 0f843a250000                   je         0x7f6a901783a7
0296d 48be28a76d846a7f0000           movabs     rsi, 0x7f6a846da728
02977 488386e000000001               add        qword ptr [rsi + 0xe0], 1
0297f 48bea8a86d846a7f0000           movabs     rsi, 0x7f6a846da8a8
02989 8b5678                         mov        edx, dword ptr [rsi + 0x78]
0298c 83c202                         add        edx, 2
0298f 895678                         mov        dword ptr [rsi + 0x78], edx
02992 81e2feff1f00                   and        edx, 0x1ffffe
02998 85d2                           test       edx, edx
0299a 0f8428250000                   je         0x7f6a901783c8
029a0 48bee0c06d846a7f0000           movabs     rsi, 0x7f6a846dc0e0
029aa 4883867001000001               add        qword ptr [rsi + 0x170], 1
029b2 48be889e2ee300000000           movabs     rsi, 0xe32e9e88
029bc 48be08c62de300000000           movabs     rsi, 0xe32dc608
029c6 ba02000000                     mov        edx, 2
029cb b910000000                     mov        ecx, 0x10
029d0 4c8bc0                         mov        r8, rax
029d3 bf00000000                     mov        edi, 0
029d8 48890424                       mov        qword ptr [rsp], rax
029dc 4c89742408                     mov        qword ptr [rsp + 8], r14
029e1 49bac0c52de300000000           movabs     r10, 0xe32dc5c0
029eb 4c89542410                     mov        qword ptr [rsp + 0x10], r10
029f0 49ba889e2ee300000000           movabs     r10, 0xe32e9e88
029fa 4c89542418                     mov        qword ptr [rsp + 0x18], r10
029ff e85c9d5b07                     call       0x7f6a9772fc60
02a04 0f1f8400fc2a000e               nop        dword ptr [rax + rax + 0xe002afc]
02a0c 4885c0                         test       rax, rax
02a0f 48bbe0c06d846a7f0000           movabs     rbx, 0x7f6a846dc0e0
02a19 750c                           jne        0x7f6a90175f27
02a1b 808b7901000001                 or         byte ptr [rbx + 0x179], 1
02a22 e988000000                     jmp        0x7f6a90175faf
02a27 8b38                           mov        edi, dword ptr [rax]
02a29 c1ef0d                         shr        edi, 0xd
02a2c 48c1e70a                       shl        rdi, 0xa
02a30 41ba00000011                   mov        r10d, 0x11000000
02a36 4903fa                         add        rdi, r10
02a39 41ba31000000                   mov        r10d, 0x31
02a3f 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
02a43 7436                           je         0x7f6a90175f7b
02a45 4983c202                       add        r10, 2
02a49 4983fa35                       cmp        r10, 0x35
02a4d 75f0                           jne        0x7f6a90175f3f
02a4f 41ba31000000                   mov        r10d, 0x31
02a55 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02a5a 7412                           je         0x7f6a90175f6e
02a5c 4983c202                       add        r10, 2
02a60 4983fa35                       cmp        r10, 0x35
02a64 75ef                           jne        0x7f6a90175f55
02a66 41ba30000000                   mov        r10d, 0x30
02a6c eb11                           jmp        0x7f6a90175f7f
02a6e 50                             push       rax
02a6f 4833c0                         xor        rax, rax
02a72 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
02a78 58                             pop        rax
02a79 ebbe                           jmp        0x7f6a90175f39
02a7b 4983c201                       add        r10, 1
02a7f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02a84 48bf00b4141100000000           movabs     rdi, 0x1114b400
02a8e 8b18                           mov        ebx, dword ptr [rax]
02a90 c1eb0d                         shr        ebx, 0xd
02a93 48c1e30a                       shl        rbx, 0xa
02a97 41ba00000011                   mov        r10d, 0x11000000
02a9d 4903da                         add        rbx, r10
02aa0 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
02aa4 0f853f240000                   jne        0x7f6a901783e9
02aaa e900000000                     jmp        0x7f6a90175faf
02aaf 488bf8                         mov        rdi, rax
02ab2 4889bc24f8010000               mov        qword ptr [rsp + 0x1f8], rdi
02aba 483b07                         cmp        rax, qword ptr [rdi]
02abd 488bf7                         mov        rsi, rdi
02ac0 48bb00c063846a7f0000           movabs     rbx, 0x7f6a8463c000
02aca 8b36                           mov        esi, dword ptr [rsi]
02acc c1ee0d                         shr        esi, 0xd
02acf 48c1e60a                       shl        rsi, 0xa
02ad3 41ba00000011                   mov        r10d, 0x11000000
02ad9 4903f2                         add        rsi, r10
02adc 41bae4000000                   mov        r10d, 0xe4
02ae2 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02ae6 743c                           je         0x7f6a90176024
02ae8 4983c202                       add        r10, 2
02aec 4981fae8000000                 cmp        r10, 0xe8
02af3 75ed                           jne        0x7f6a90175fe2
02af5 41bae4000000                   mov        r10d, 0xe4
02afb 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02b00 7415                           je         0x7f6a90176017
02b02 4983c202                       add        r10, 2
02b06 4981fae8000000                 cmp        r10, 0xe8
02b0d 75ec                           jne        0x7f6a90175ffb
02b0f 41bae3000000                   mov        r10d, 0xe3
02b15 eb11                           jmp        0x7f6a90176028
02b17 50                             push       rax
02b18 4833c0                         xor        rax, rax
02b1b f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02b21 58                             pop        rax
02b22 ebb8                           jmp        0x7f6a90175fdc
02b24 4983c201                       add        r10, 1
02b28 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02b2d 48be30cb6d846a7f0000           movabs     rsi, 0x7f6a846dcb30
02b37 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
02b3a 83c302                         add        ebx, 2
02b3d 895e78                         mov        dword ptr [rsi + 0x78], ebx
02b40 81e3feff1f00                   and        ebx, 0x1ffffe
02b46 85db                           test       ebx, ebx
02b48 0f84d1230000                   je         0x7f6a9017841f
02b4e 488bf7                         mov        rsi, rdi
02b51 48bb30cb6d846a7f0000           movabs     rbx, 0x7f6a846dcb30
02b5b 8b36                           mov        esi, dword ptr [rsi]
02b5d c1ee0d                         shr        esi, 0xd
02b60 48c1e60a                       shl        rsi, 0xa
02b64 41ba00000011                   mov        r10d, 0x11000000
02b6a 4903f2                         add        rsi, r10
02b6d 41ba17000000                   mov        r10d, 0x17
02b73 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02b77 7436                           je         0x7f6a901760af
02b79 4983c202                       add        r10, 2
02b7d 4983fa1b                       cmp        r10, 0x1b
02b81 75f0                           jne        0x7f6a90176073
02b83 41ba17000000                   mov        r10d, 0x17
02b89 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02b8e 7412                           je         0x7f6a901760a2
02b90 4983c202                       add        r10, 2
02b94 4983fa1b                       cmp        r10, 0x1b
02b98 75ef                           jne        0x7f6a90176089
02b9a 41ba16000000                   mov        r10d, 0x16
02ba0 eb11                           jmp        0x7f6a901760b3
02ba2 50                             push       rax
02ba3 4833c0                         xor        rax, rax
02ba6 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02bac 58                             pop        rax
02bad ebbe                           jmp        0x7f6a9017606d
02baf 4983c201                       add        r10, 1
02bb3 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02bb8 488bf7                         mov        rsi, rdi
02bbb 90                             nop        
02bbc 90                             nop        
02bbd 48b810ab74646a7f0000           movabs     rax, 0x7f6a6474ab10
02bc7 e894965b07                     call       0x7f6a9772f760
02bcc 0f1f8400c42c000f               nop        dword ptr [rax + rax + 0xf002cc4]
02bd4 48be30cb6d846a7f0000           movabs     rsi, 0x7f6a846dcb30
02bde 488386e000000001               add        qword ptr [rsi + 0xe0], 1
02be6 48be58b36d846a7f0000           movabs     rsi, 0x7f6a846db358
02bf0 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
02bf3 83c702                         add        edi, 2
02bf6 897e78                         mov        dword ptr [rsi + 0x78], edi
02bf9 81e7feff1f00                   and        edi, 0x1ffffe
02bff 85ff                           test       edi, edi
02c01 0f8439230000                   je         0x7f6a90178440
02c07 448bac24e8010000               mov        r13d, dword ptr [rsp + 0x1e8]
02c0f 8bbc24ec010000                 mov        edi, dword ptr [rsp + 0x1ec]
02c16 48be58b36d846a7f0000           movabs     rsi, 0x7f6a846db358
02c20 4883861001000001               add        qword ptr [rsi + 0x110], 1
02c28 ffc8                           dec        eax
02c2a 442be8                         sub        r13d, eax
02c2d 48bee8a96d846a7f0000           movabs     rsi, 0x7f6a846da9e8
02c37 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
02c3a 83c302                         add        ebx, 2
02c3d 895e78                         mov        dword ptr [rsi + 0x78], ebx
02c40 81e3feff1f00                   and        ebx, 0x1ffffe
02c46 85db                           test       ebx, ebx
02c48 0f8413230000                   je         0x7f6a90178461
02c4e 48bee8a96d846a7f0000           movabs     rsi, 0x7f6a846da9e8
02c58 488386b000000001               add        qword ptr [rsi + 0xb0], 1
02c60 48be0000000000000000           movabs     rsi, 0
02c6a be00000000                     mov        esi, 0
02c6f 3bfe                           cmp        edi, esi
02c71 0f8c0b230000                   jl         0x7f6a90178482
02c77 413bfd                         cmp        edi, r13d
02c7a 0f8d23230000                   jge        0x7f6a901784a3
02c80 488bc7                         mov        rax, rdi
02c83 898424f4010000                 mov        dword ptr [rsp + 0x1f4], eax
02c8a 89bc24ec010000                 mov        dword ptr [rsp + 0x1ec], edi
02c91 488bbc24f8010000               mov        rdi, qword ptr [rsp + 0x1f8]
02c99 488bf7                         mov        rsi, rdi
02c9c 48b930cb6d846a7f0000           movabs     rcx, 0x7f6a846dcb30
02ca6 8b36                           mov        esi, dword ptr [rsi]
02ca8 c1ee0d                         shr        esi, 0xd
02cab 48c1e60a                       shl        rsi, 0xa
02caf 41ba00000011                   mov        r10d, 0x11000000
02cb5 4903f2                         add        rsi, r10
02cb8 41ba1f000000                   mov        r10d, 0x1f
02cbe 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
02cc2 7436                           je         0x7f6a901761fa
02cc4 4983c202                       add        r10, 2
02cc8 4983fa23                       cmp        r10, 0x23
02ccc 75f0                           jne        0x7f6a901761be
02cce 41ba1f000000                   mov        r10d, 0x1f
02cd4 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02cd9 7412                           je         0x7f6a901761ed
02cdb 4983c202                       add        r10, 2
02cdf 4983fa23                       cmp        r10, 0x23
02ce3 75ef                           jne        0x7f6a901761d4
02ce5 41ba1e000000                   mov        r10d, 0x1e
02ceb eb11                           jmp        0x7f6a901761fe
02ced 50                             push       rax
02cee 4833c0                         xor        rax, rax
02cf1 f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
02cf7 58                             pop        rax
02cf8 ebbe                           jmp        0x7f6a901761b8
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
02d0d 48b838ab74646a7f0000           movabs     rax, 0x7f6a6474ab38
02d17 e844955b07                     call       0x7f6a9772f760
02d1c 0f1f8400142e0010               nop        dword ptr [rax + rax + 0x10002e14]
02d24 483b00                         cmp        rax, qword ptr [rax]
02d27 488bf0                         mov        rsi, rax
02d2a 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
02d34 8b36                           mov        esi, dword ptr [rsi]
02d36 c1ee0d                         shr        esi, 0xd
02d39 48c1e60a                       shl        rsi, 0xa
02d3d 41ba00000011                   mov        r10d, 0x11000000
02d43 4903f2                         add        rsi, r10
02d46 41ba25000000                   mov        r10d, 0x25
02d4c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02d50 7436                           je         0x7f6a90176288
02d52 4983c202                       add        r10, 2
02d56 4983fa29                       cmp        r10, 0x29
02d5a 75f0                           jne        0x7f6a9017624c
02d5c 41ba25000000                   mov        r10d, 0x25
02d62 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02d67 7412                           je         0x7f6a9017627b
02d69 4983c202                       add        r10, 2
02d6d 4983fa29                       cmp        r10, 0x29
02d71 75ef                           jne        0x7f6a90176262
02d73 41ba24000000                   mov        r10d, 0x24
02d79 eb11                           jmp        0x7f6a9017628c
02d7b 50                             push       rax
02d7c 4833c0                         xor        rax, rax
02d7f f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
02d85 58                             pop        rax
02d86 ebbe                           jmp        0x7f6a90176246
02d88 4983c201                       add        r10, 1
02d8c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02d91 8b7024                         mov        esi, dword ptr [rax + 0x24]
02d94 4c3b25fd9a7d20                 cmp        r12, qword ptr [rip + 0x207d9afd]
02d9b 0f8414000000                   je         0x7f6a901762b5
02da1 48bf2832a2ae6a7f0000           movabs     rdi, 0x7f6aaea23228
02dab 4883e4f0                       and        rsp, 0xfffffffffffffff0
02daf e8ac82ba1f                     call       0x7f6aafd1e560
02db4 f4                             hlt        
02db5 488bd0                         mov        rdx, rax
02db8 48b930cb6d846a7f0000           movabs     rcx, 0x7f6a846dcb30
02dc2 8b12                           mov        edx, dword ptr [rdx]
02dc4 c1ea0d                         shr        edx, 0xd
02dc7 48c1e20a                       shl        rdx, 0xa
02dcb 41ba00000011                   mov        r10d, 0x11000000
02dd1 4903d2                         add        rdx, r10
02dd4 41ba2b000000                   mov        r10d, 0x2b
02dda 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02dde 7436                           je         0x7f6a90176316
02de0 4983c202                       add        r10, 2
02de4 4983fa2f                       cmp        r10, 0x2f
02de8 75f0                           jne        0x7f6a901762da
02dea 41ba2b000000                   mov        r10d, 0x2b
02df0 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02df5 7412                           je         0x7f6a90176309
02df7 4983c202                       add        r10, 2
02dfb 4983fa2f                       cmp        r10, 0x2f
02dff 75ef                           jne        0x7f6a901762f0
02e01 41ba2a000000                   mov        r10d, 0x2a
02e07 eb11                           jmp        0x7f6a9017631a
02e09 50                             push       rax
02e0a 4833c0                         xor        rax, rax
02e0d f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02e13 58                             pop        rax
02e14 ebbe                           jmp        0x7f6a901762d4
02e16 4983c201                       add        r10, 1
02e1a 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02e1f 8b4804                         mov        ecx, dword ptr [rax + 4]
02e22 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
02e2c 4883828001000001               add        qword ptr [rdx + 0x180], 1
02e34 48baa0b56d846a7f0000           movabs     rdx, 0x7f6a846db5a0
02e3e 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
02e42 4183c002                       add        r8d, 2
02e46 44894278                       mov        dword ptr [rdx + 0x78], r8d
02e4a 4181e0feff1f00                 and        r8d, 0x1ffffe
02e51 4585c0                         test       r8d, r8d
02e54 0f8483210000                   je         0x7f6a901784dd
02e5a 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
02e64 4883829001000001               add        qword ptr [rdx + 0x190], 1
02e6c 8b8424f4010000                 mov        eax, dword ptr [rsp + 0x1f4]
02e73 4863c0                         movsxd     rax, eax
02e76 ba08000000                     mov        edx, 8
02e7b 4c8bc8                         mov        r9, rax
02e7e 4c03ca                         add        r9, rdx
02e81 48ba28a76d846a7f0000           movabs     rdx, 0x7f6a846da728
02e8b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
02e8f 4183c002                       add        r8d, 2
02e93 44894278                       mov        dword ptr [rdx + 0x78], r8d
02e97 4181e0feff1f00                 and        r8d, 0x1ffffe
02e9e 4585c0                         test       r8d, r8d
02ea1 0f8457210000                   je         0x7f6a901784fe
02ea7 48ba28a76d846a7f0000           movabs     rdx, 0x7f6a846da728
02eb1 488382e000000001               add        qword ptr [rdx + 0xe0], 1
02eb9 48baa8a86d846a7f0000           movabs     rdx, 0x7f6a846da8a8
02ec3 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
02ec7 4183c002                       add        r8d, 2
02ecb 44894278                       mov        dword ptr [rdx + 0x78], r8d
02ecf 4181e0feff1f00                 and        r8d, 0x1ffffe
02ed6 4585c0                         test       r8d, r8d
02ed9 0f8440210000                   je         0x7f6a9017851f
02edf 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
02ee9 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
02ef1 48ba703c2fe300000000           movabs     rdx, 0xe32f3c70
02efb ba02000000                     mov        edx, 2
02f00 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
02f08 bf00000000                     mov        edi, 0
02f0d 488b9c24f8010000               mov        rbx, qword ptr [rsp + 0x1f8]
02f15 48891c24                       mov        qword ptr [rsp], rbx
02f19 488b9c2438010000               mov        rbx, qword ptr [rsp + 0x138]
02f21 48895c2408                     mov        qword ptr [rsp + 8], rbx
02f26 4889442410                     mov        qword ptr [rsp + 0x10], rax
02f2b 49ba703c2fe300000000           movabs     r10, 0xe32f3c70
02f35 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02f3a 90                             nop        
02f3b 90                             nop        
02f3c 90                             nop        
02f3d 90                             nop        
02f3e 90                             nop        
02f3f e81c985b07                     call       0x7f6a9772fc60
02f44 0f1f84003c300011               nop        dword ptr [rax + rax + 0x1100303c]
02f4c 8b8424ec010000                 mov        eax, dword ptr [rsp + 0x1ec]
02f53 83c010                         add        eax, 0x10
02f56 8bbc24e4010000                 mov        edi, dword ptr [rsp + 0x1e4]
02f5d 83c710                         add        edi, 0x10
02f60 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02f67 ba02000000                     mov        edx, 2
02f6c 7c05                           jl         0x7f6a90176473
02f6e ba00000000                     mov        edx, 0
02f73 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
02f7d 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
02f81 4403c2                         add        r8d, edx
02f84 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
02f88 85d2                           test       edx, edx
02f8a 7506                           jne        0x7f6a90176492
02f8c 41b802000000                   mov        r8d, 2
02f92 4181e0fe3f0000                 and        r8d, 0x3ffe
02f99 4585c0                         test       r8d, r8d
02f9c 0f849e200000                   je         0x7f6a90178540
02fa2 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02fa6 418502                         test       dword ptr [r10], eax
02fa9 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
02fb0 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
02fba b948070000                     mov        ecx, 0x748
02fbf 7c05                           jl         0x7f6a901764c6
02fc1 b958070000                     mov        ecx, 0x758
02fc6 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
02fca 4d8d4001                       lea        r8, [r8 + 1]
02fce 4c89040a                       mov        qword ptr [rdx + rcx], r8
02fd2 0f8c50f5ffff                   jl         0x7f6a90175a28
02fd8 8b9c24f0010000                 mov        ebx, dword ptr [rsp + 0x1f0]
02fdf 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
02fe9 ff8268070000                   inc        dword ptr [rdx + 0x768]
02fef e9220f0000                     jmp        0x7f6a90177416
02ff4 4183f908                       cmp        r9d, 8
02ff8 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
03002 b980070000                     mov        ecx, 0x780
03007 7c05                           jl         0x7f6a9017650e
03009 b990070000                     mov        ecx, 0x790
0300e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
03012 4d8d4001                       lea        r8, [r8 + 1]
03016 4c89040a                       mov        qword ptr [rdx + rcx], r8
0301a 0f8c86040000                   jl         0x7f6a901769a6
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
0304f 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
03059 488382a007000001               add        qword ptr [rdx + 0x7a0], 1
03061 48ba206a101100000000           movabs     rdx, 0x11106a20
0306b 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0306e 83c102                         add        ecx, 2
03071 894a78                         mov        dword ptr [rdx + 0x78], ecx
03074 81e1feff1f00                   and        ecx, 0x1ffffe
0307a 85c9                           test       ecx, ecx
0307c 0f84df1f0000                   je         0x7f6a90178561
03082 48ba206a101100000000           movabs     rdx, 0x11106a20
0308c 488d92e0000000                 lea        rdx, [rdx + 0xe0]
03093 4885c0                         test       rax, rax
03096 7510                           jne        0x7f6a901765a8
03098 f6420801                       test       byte ptr [rdx + 8], 1
0309c 0f8506000000                   jne        0x7f6a901765a8
030a2 f048834a0801                   lock or    qword ptr [rdx + 8], 1
030a8 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
030b2 488d9248030000                 lea        rdx, [rdx + 0x348]
030b9 4885c0                         test       rax, rax
030bc 7510                           jne        0x7f6a901765ce
030be f6421001                       test       byte ptr [rdx + 0x10], 1
030c2 0f8506000000                   jne        0x7f6a901765ce
030c8 f048834a1001                   lock or    qword ptr [rdx + 0x10], 1
030ce 48ba206a101100000000           movabs     rdx, 0x11106a20
030d8 488382b000000001               add        qword ptr [rdx + 0xb0], 1
030e0 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
030ea 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
030ed 83c102                         add        ecx, 2
030f0 894a78                         mov        dword ptr [rdx + 0x78], ecx
030f3 81e1feff1f00                   and        ecx, 0x1ffffe
030f9 85c9                           test       ecx, ecx
030fb 0f84811f0000                   je         0x7f6a90178582
03101 48bad82e29e300000000           movabs     rdx, 0xe3292ed8
0310b 48b9787e73846a7f0000           movabs     rcx, 0x7f6a84737e78
03115 8b12                           mov        edx, dword ptr [rdx]
03117 c1ea0d                         shr        edx, 0xd
0311a 48c1e20a                       shl        rdx, 0xa
0311e 41ba00000011                   mov        r10d, 0x11000000
03124 4903d2                         add        rdx, r10
03127 41ba17000000                   mov        r10d, 0x17
0312d 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03131 7436                           je         0x7f6a90176669
03133 4983c202                       add        r10, 2
03137 4983fa1b                       cmp        r10, 0x1b
0313b 75f0                           jne        0x7f6a9017662d
0313d 41ba17000000                   mov        r10d, 0x17
03143 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03148 7412                           je         0x7f6a9017665c
0314a 4983c202                       add        r10, 2
0314e 4983fa1b                       cmp        r10, 0x1b
03152 75ef                           jne        0x7f6a90176643
03154 41ba16000000                   mov        r10d, 0x16
0315a eb11                           jmp        0x7f6a9017666d
0315c 50                             push       rax
0315d 4833c0                         xor        rax, rax
03160 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03166 58                             pop        rax
03167 ebbe                           jmp        0x7f6a90176627
03169 4983c201                       add        r10, 1
0316d 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03172 48bac87873846a7f0000           movabs     rdx, 0x7f6a847378c8
0317c 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0317f 83c102                         add        ecx, 2
03182 894a78                         mov        dword ptr [rdx + 0x78], ecx
03185 81e1feff1f00                   and        ecx, 0x1ffffe
0318b 85c9                           test       ecx, ecx
0318d 0f84101f0000                   je         0x7f6a901785a3
03193 48bac87873846a7f0000           movabs     rdx, 0x7f6a847378c8
0319d ff82b0000000                   inc        dword ptr [rdx + 0xb0]
031a3 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
031ad ff8208010000                   inc        dword ptr [rdx + 0x108]
031b3 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
031bd ff8228010000                   inc        dword ptr [rdx + 0x128]
031c3 48ba902729e300000000           movabs     rdx, 0xe3292790
031cd 48b9787e73846a7f0000           movabs     rcx, 0x7f6a84737e78
031d7 8b12                           mov        edx, dword ptr [rdx]
031d9 c1ea0d                         shr        edx, 0xd
031dc 48c1e20a                       shl        rdx, 0xa
031e0 41ba00000011                   mov        r10d, 0x11000000
031e6 4903d2                         add        rdx, r10
031e9 41ba28000000                   mov        r10d, 0x28
031ef 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
031f3 7436                           je         0x7f6a9017672b
031f5 4983c202                       add        r10, 2
031f9 4983fa2c                       cmp        r10, 0x2c
031fd 75f0                           jne        0x7f6a901766ef
031ff 41ba28000000                   mov        r10d, 0x28
03205 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0320a 7412                           je         0x7f6a9017671e
0320c 4983c202                       add        r10, 2
03210 4983fa2c                       cmp        r10, 0x2c
03214 75ef                           jne        0x7f6a90176705
03216 41ba27000000                   mov        r10d, 0x27
0321c eb11                           jmp        0x7f6a9017672f
0321e 50                             push       rax
0321f 4833c0                         xor        rax, rax
03222 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03228 58                             pop        rax
03229 ebbe                           jmp        0x7f6a901766e9
0322b 4983c201                       add        r10, 1
0322f 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03234 48baf87b73846a7f0000           movabs     rdx, 0x7f6a84737bf8
0323e 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03241 83c102                         add        ecx, 2
03244 894a78                         mov        dword ptr [rdx + 0x78], ecx
03247 81e1feff1f00                   and        ecx, 0x1ffffe
0324d 85c9                           test       ecx, ecx
0324f 0f846f1e0000                   je         0x7f6a901785c4
03255 48baf87b73846a7f0000           movabs     rdx, 0x7f6a84737bf8
0325f ff82b0000000                   inc        dword ptr [rdx + 0xb0]
03265 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
0326f 488d9288010000                 lea        rdx, [rdx + 0x188]
03276 4885c0                         test       rax, rax
03279 7510                           jne        0x7f6a9017678b
0327b f6421801                       test       byte ptr [rdx + 0x18], 1
0327f 0f8506000000                   jne        0x7f6a9017678b
03285 f048834a1801                   lock or    qword ptr [rdx + 0x18], 1
0328b 48ba787e73846a7f0000           movabs     rdx, 0x7f6a84737e78
03295 4883827801000001               add        qword ptr [rdx + 0x178], 1
0329d 48bad88173846a7f0000           movabs     rdx, 0x7f6a847381d8
032a7 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
032aa 83c102                         add        ecx, 2
032ad 894a78                         mov        dword ptr [rdx + 0x78], ecx
032b0 81e1feff1f00                   and        ecx, 0x1ffffe
032b6 85c9                           test       ecx, ecx
032b8 0f84271e0000                   je         0x7f6a901785e5
032be 48bad88173846a7f0000           movabs     rdx, 0x7f6a847381d8
032c8 4883821001000001               add        qword ptr [rdx + 0x110], 1
032d0 48baa88a141100000000           movabs     rdx, 0x11148aa8
032da 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
032dd 83c102                         add        ecx, 2
032e0 894a78                         mov        dword ptr [rdx + 0x78], ecx
032e3 81e1feff1f00                   and        ecx, 0x1ffffe
032e9 85c9                           test       ecx, ecx
032eb 0f84151e0000                   je         0x7f6a90178606
032f1 8b5004                         mov        edx, dword ptr [rax + 4]
032f4 48b9a88a141100000000           movabs     rcx, 0x11148aa8
032fe 488381b000000001               add        qword ptr [rcx + 0xb0], 1
03306 83ea07                         sub        edx, 7
03309 48b928fe22e200000000           movabs     rcx, 0xe222fe28
03313 b900000000                     mov        ecx, 0
03318 3bf9                           cmp        edi, ecx
0331a 0f8c201e0000                   jl         0x7f6a90178640
03320 3bfa                           cmp        edi, edx
03322 0f8d391e0000                   jge        0x7f6a90178661
03328 488bd7                         mov        rdx, rdi
0332b 48bef8a422e200000000           movabs     rsi, 0xe222a4f8
03335 488bce                         mov        rcx, rsi
03338 49b8d88173846a7f0000           movabs     r8, 0x7f6a847381d8
03342 8b09                           mov        ecx, dword ptr [rcx]
03344 c1e90d                         shr        ecx, 0xd
03347 48c1e10a                       shl        rcx, 0xa
0334b 41ba00000011                   mov        r10d, 0x11000000
03351 4903ca                         add        rcx, r10
03354 41ba25000000                   mov        r10d, 0x25
0335a 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0335e 7436                           je         0x7f6a90176896
03360 4983c202                       add        r10, 2
03364 4983fa29                       cmp        r10, 0x29
03368 75f0                           jne        0x7f6a9017685a
0336a 41ba25000000                   mov        r10d, 0x25
03370 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
03375 7412                           je         0x7f6a90176889
03377 4983c202                       add        r10, 2
0337b 4983fa29                       cmp        r10, 0x29
0337f 75ef                           jne        0x7f6a90176870
03381 41ba24000000                   mov        r10d, 0x24
03387 eb11                           jmp        0x7f6a9017689a
03389 50                             push       rax
0338a 4833c0                         xor        rax, rax
0338d f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
03393 58                             pop        rax
03394 ebbe                           jmp        0x7f6a90176854
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
033bf e89c895b07                     call       0x7f6a9772f260
033c4 0f1f8400bc340013               nop        dword ptr [rax + rax + 0x130034bc]
033cc 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
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
033f7 e864935b07                     call       0x7f6a9772fc60
033fc 0f1f8400f4340014               nop        dword ptr [rax + rax + 0x140034f4]
03404 8b842400020000                 mov        eax, dword ptr [rsp + 0x200]
0340b 83c008                         add        eax, 8
0340e 8bbc2404020000                 mov        edi, dword ptr [rsp + 0x204]
03415 83c708                         add        edi, 8
03418 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
0341f be02000000                     mov        esi, 2
03424 7c05                           jl         0x7f6a9017692b
03426 be00000000                     mov        esi, 0
0342b 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
03435 8b4a7c                         mov        ecx, dword ptr [rdx + 0x7c]
03438 03ce                           add        ecx, esi
0343a 894a7c                         mov        dword ptr [rdx + 0x7c], ecx
0343d 85f6                           test       esi, esi
0343f 7505                           jne        0x7f6a90176946
03441 b902000000                     mov        ecx, 2
03446 81e1fe3f0000                   and        ecx, 0x3ffe
0344c 85c9                           test       ecx, ecx
0344e 0f842e1d0000                   je         0x7f6a90178682
03454 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03458 418502                         test       dword ptr [r10], eax
0345b 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
03462 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
0346c bac0070000                     mov        edx, 0x7c0
03471 7c05                           jl         0x7f6a90176978
03473 bad0070000                     mov        edx, 0x7d0
03478 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0347c 488d4901                       lea        rcx, [rcx + 1]
03480 48890c16                       mov        qword ptr [rsi + rdx], rcx
03484 0f8cb6fbffff                   jl         0x7f6a90176540
0348a 8b9c2408020000                 mov        ebx, dword ptr [rsp + 0x208]
03491 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
0349b ff86e0070000                   inc        dword ptr [rsi + 0x7e0]
034a1 e9700a0000                     jmp        0x7f6a90177416
034a6 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
034b0 488386f807000001               add        qword ptr [rsi + 0x7f8], 1
034b8 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
034c0 8b9424d0010000                 mov        edx, dword ptr [rsp + 0x1d0]
034c7 488bcf                         mov        rcx, rdi
034ca 4d8bc1                         mov        r8, r9
034cd 448b8c2478010000               mov        r9d, dword ptr [rsp + 0x178]
034d5 90                             nop        
034d6 90                             nop        
034d7 e884925b07                     call       0x7f6a9772fc60
034dc 0f1f8400d4350016               nop        dword ptr [rax + rax + 0x160035d4]
034e4 488bd8                         mov        rbx, rax
034e7 e92a0a0000                     jmp        0x7f6a90177416
034ec 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
034f3 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
034fa 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03502 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
0350c 488386d005000001               add        qword ptr [rsi + 0x5d0], 1
03514 48be28be6d846a7f0000           movabs     rsi, 0x7f6a846dbe28
0351e 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03521 83c202                         add        edx, 2
03524 895678                         mov        dword ptr [rsi + 0x78], edx
03527 81e2feff1f00                   and        edx, 0x1ffffe
0352d 85d2                           test       edx, edx
0352f 0f846e1c0000                   je         0x7f6a901786a3
03535 48bec0c52de300000000           movabs     rsi, 0xe32dc5c0
0353f 48ba28be6d846a7f0000           movabs     rdx, 0x7f6a846dbe28
03549 8b36                           mov        esi, dword ptr [rsi]
0354b c1ee0d                         shr        esi, 0xd
0354e 48c1e60a                       shl        rsi, 0xa
03552 41ba00000011                   mov        r10d, 0x11000000
03558 4903f2                         add        rsi, r10
0355b 41ba17000000                   mov        r10d, 0x17
03561 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03565 7436                           je         0x7f6a90176a9d
03567 4983c202                       add        r10, 2
0356b 4983fa1b                       cmp        r10, 0x1b
0356f 75f0                           jne        0x7f6a90176a61
03571 41ba17000000                   mov        r10d, 0x17
03577 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
0357c 7412                           je         0x7f6a90176a90
0357e 4983c202                       add        r10, 2
03582 4983fa1b                       cmp        r10, 0x1b
03586 75ef                           jne        0x7f6a90176a77
03588 41ba16000000                   mov        r10d, 0x16
0358e eb11                           jmp        0x7f6a90176aa1
03590 50                             push       rax
03591 4833c0                         xor        rax, rax
03594 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
0359a 58                             pop        rax
0359b ebbe                           jmp        0x7f6a90176a5b
0359d 4983c201                       add        r10, 1
035a1 4a8304d201                     add        qword ptr [rdx + r10*8], 1
035a6 8b5804                         mov        ebx, dword ptr [rax + 4]
035a9 48be28be6d846a7f0000           movabs     rsi, 0x7f6a846dbe28
035b3 488386e000000001               add        qword ptr [rsi + 0xe0], 1
035bb 48be58b36d846a7f0000           movabs     rsi, 0x7f6a846db358
035c5 8b5678                         mov        edx, dword ptr [rsi + 0x78]
035c8 83c202                         add        edx, 2
035cb 895678                         mov        dword ptr [rsi + 0x78], edx
035ce 81e2feff1f00                   and        edx, 0x1ffffe
035d4 85d2                           test       edx, edx
035d6 0f84011c0000                   je         0x7f6a901786dd
035dc 48be58b36d846a7f0000           movabs     rsi, 0x7f6a846db358
035e6 4883861001000001               add        qword ptr [rsi + 0x110], 1
035ee 488bf3                         mov        rsi, rbx
035f1 83ee0f                         sub        esi, 0xf
035f4 48bae8a96d846a7f0000           movabs     rdx, 0x7f6a846da9e8
035fe 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03601 83c102                         add        ecx, 2
03604 894a78                         mov        dword ptr [rdx + 0x78], ecx
03607 81e1feff1f00                   and        ecx, 0x1ffffe
0360d 85c9                           test       ecx, ecx
0360f 0f84e91b0000                   je         0x7f6a901786fe
03615 48bae8a96d846a7f0000           movabs     rdx, 0x7f6a846da9e8
0361f 488382b000000001               add        qword ptr [rdx + 0xb0], 1
03627 48ba0000000000000000           movabs     rdx, 0
03631 ba00000000                     mov        edx, 0
03636 3bfa                           cmp        edi, edx
03638 0f8ce11b0000                   jl         0x7f6a9017871f
0363e 3bfe                           cmp        edi, esi
03640 0f8dfa1b0000                   jge        0x7f6a90178740
03646 48bec0c52de300000000           movabs     rsi, 0xe32dc5c0
03650 488bd6                         mov        rdx, rsi
03653 48b928be6d846a7f0000           movabs     rcx, 0x7f6a846dbe28
0365d 8b12                           mov        edx, dword ptr [rdx]
0365f c1ea0d                         shr        edx, 0xd
03662 48c1e20a                       shl        rdx, 0xa
03666 41ba00000011                   mov        r10d, 0x11000000
0366c 4903d2                         add        rdx, r10
0366f 41ba25000000                   mov        r10d, 0x25
03675 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03679 7436                           je         0x7f6a90176bb1
0367b 4983c202                       add        r10, 2
0367f 4983fa29                       cmp        r10, 0x29
03683 75f0                           jne        0x7f6a90176b75
03685 41ba25000000                   mov        r10d, 0x25
0368b 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03690 7412                           je         0x7f6a90176ba4
03692 4983c202                       add        r10, 2
03696 4983fa29                       cmp        r10, 0x29
0369a 75ef                           jne        0x7f6a90176b8b
0369c 41ba24000000                   mov        r10d, 0x24
036a2 eb11                           jmp        0x7f6a90176bb5
036a4 50                             push       rax
036a5 4833c0                         xor        rax, rax
036a8 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
036ae 58                             pop        rax
036af ebbe                           jmp        0x7f6a90176b6f
036b1 4983c201                       add        r10, 1
036b5 4a8304d101                     add        qword ptr [rcx + r10*8], 1
036ba 48baf0aa6d846a7f0000           movabs     rdx, 0x7f6a846daaf0
036c4 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
036c7 83c102                         add        ecx, 2
036ca 894a78                         mov        dword ptr [rdx + 0x78], ecx
036cd 81e1feff1f00                   and        ecx, 0x1ffffe
036d3 85c9                           test       ecx, ecx
036d5 0f84861b0000                   je         0x7f6a90178761
036db 48baf0aa6d846a7f0000           movabs     rdx, 0x7f6a846daaf0
036e5 488382b000000001               add        qword ptr [rdx + 0xb0], 1
036ed 48be20ac6d846a7f0000           movabs     rsi, 0x7f6a846dac20
036f7 8b5678                         mov        edx, dword ptr [rsi + 0x78]
036fa 83c202                         add        edx, 2
036fd 895678                         mov        dword ptr [rsi + 0x78], edx
03700 81e2feff1f00                   and        edx, 0x1ffffe
03706 85d2                           test       edx, edx
03708 0f84741b0000                   je         0x7f6a90178782
0370e 48be20ac6d846a7f0000           movabs     rsi, 0x7f6a846dac20
03718 ff86c0000000                   inc        dword ptr [rsi + 0xc0]
0371e 899c240c020000                 mov        dword ptr [rsp + 0x20c], ebx
03725 48beb8452ee300000000           movabs     rsi, 0xe32e45b8
0372f 488bd6                         mov        rdx, rsi
03732 48b928be6d846a7f0000           movabs     rcx, 0x7f6a846dbe28
0373c 4883816001000001               add        qword ptr [rcx + 0x160], 1
03744 48baf8bf6d846a7f0000           movabs     rdx, 0x7f6a846dbff8
0374e 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03751 83c102                         add        ecx, 2
03754 894a78                         mov        dword ptr [rdx + 0x78], ecx
03757 81e1feff1f00                   and        ecx, 0x1ffffe
0375d 85c9                           test       ecx, ecx
0375f 0f843e1b0000                   je         0x7f6a901787a3
03765 488bd6                         mov        rdx, rsi
03768 48b9f8bf6d846a7f0000           movabs     rcx, 0x7f6a846dbff8
03772 488381b000000001               add        qword ptr [rcx + 0xb0], 1
0377a 48bae0c06d846a7f0000           movabs     rdx, 0x7f6a846dc0e0
03784 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03787 83c102                         add        ecx, 2
0378a 894a78                         mov        dword ptr [rdx + 0x78], ecx
0378d 81e1feff1f00                   and        ecx, 0x1ffffe
03793 85c9                           test       ecx, ecx
03795 0f84291b0000                   je         0x7f6a901787c4
0379b 48bae0c06d846a7f0000           movabs     rdx, 0x7f6a846dc0e0
037a5 488382c000000001               add        qword ptr [rdx + 0xc0], 1
037ad 48bed8b46d846a7f0000           movabs     rsi, 0x7f6a846db4d8
037b7 8b5678                         mov        edx, dword ptr [rsi + 0x78]
037ba 83c202                         add        edx, 2
037bd 895678                         mov        dword ptr [rsi + 0x78], edx
037c0 81e2feff1f00                   and        edx, 0x1ffffe
037c6 85d2                           test       edx, edx
037c8 0f84171b0000                   je         0x7f6a901787e5
037ce 48bec0c52de300000000           movabs     rsi, 0xe32dc5c0
037d8 488bd6                         mov        rdx, rsi
037db 48b9e0c06d846a7f0000           movabs     rcx, 0x7f6a846dc0e0
037e5 8b12                           mov        edx, dword ptr [rdx]
037e7 c1ea0d                         shr        edx, 0xd
037ea 48c1e20a                       shl        rdx, 0xa
037ee 41ba00000011                   mov        r10d, 0x11000000
037f4 4903d2                         add        rdx, r10
037f7 41ba1d000000                   mov        r10d, 0x1d
037fd 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03801 7436                           je         0x7f6a90176d39
03803 4983c202                       add        r10, 2
03807 4983fa21                       cmp        r10, 0x21
0380b 75f0                           jne        0x7f6a90176cfd
0380d 41ba1d000000                   mov        r10d, 0x1d
03813 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03818 7412                           je         0x7f6a90176d2c
0381a 4983c202                       add        r10, 2
0381e 4983fa21                       cmp        r10, 0x21
03822 75ef                           jne        0x7f6a90176d13
03824 41ba1c000000                   mov        r10d, 0x1c
0382a eb11                           jmp        0x7f6a90176d3d
0382c 50                             push       rax
0382d 4833c0                         xor        rax, rax
03830 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03836 58                             pop        rax
03837 ebbe                           jmp        0x7f6a90176cf7
03839 4983c201                       add        r10, 1
0383d 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03842 48bae0c06d846a7f0000           movabs     rdx, 0x7f6a846dc0e0
0384c 8b36                           mov        esi, dword ptr [rsi]
0384e c1ee0d                         shr        esi, 0xd
03851 48c1e60a                       shl        rsi, 0xa
03855 41ba00000011                   mov        r10d, 0x11000000
0385b 4903f2                         add        rsi, r10
0385e 41ba23000000                   mov        r10d, 0x23
03864 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03868 7436                           je         0x7f6a90176da0
0386a 4983c202                       add        r10, 2
0386e 4983fa27                       cmp        r10, 0x27
03872 75f0                           jne        0x7f6a90176d64
03874 41ba23000000                   mov        r10d, 0x23
0387a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
0387f 7412                           je         0x7f6a90176d93
03881 4983c202                       add        r10, 2
03885 4983fa27                       cmp        r10, 0x27
03889 75ef                           jne        0x7f6a90176d7a
0388b 41ba22000000                   mov        r10d, 0x22
03891 eb11                           jmp        0x7f6a90176da4
03893 50                             push       rax
03894 4833c0                         xor        rax, rax
03897 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
0389d 58                             pop        rax
0389e ebbe                           jmp        0x7f6a90176d5e
038a0 4983c201                       add        r10, 1
038a4 4a8304d201                     add        qword ptr [rdx + r10*8], 1
038a9 48bee0c06d846a7f0000           movabs     rsi, 0x7f6a846dc0e0
038b3 4883864001000001               add        qword ptr [rsi + 0x140], 1
038bb 48bea0b56d846a7f0000           movabs     rsi, 0x7f6a846db5a0
038c5 8b5678                         mov        edx, dword ptr [rsi + 0x78]
038c8 83c202                         add        edx, 2
038cb 895678                         mov        dword ptr [rsi + 0x78], edx
038ce 81e2feff1f00                   and        edx, 0x1ffffe
038d4 85d2                           test       edx, edx
038d6 0f842a1a0000                   je         0x7f6a90178806
038dc 48bee0c06d846a7f0000           movabs     rsi, 0x7f6a846dc0e0
038e6 4883865001000001               add        qword ptr [rsi + 0x150], 1
038ee 4c63df                         movsxd     r11, edi
038f1 be08000000                     mov        esi, 8
038f6 4d8bcb                         mov        r9, r11
038f9 4c03ce                         add        r9, rsi
038fc 48be28a76d846a7f0000           movabs     rsi, 0x7f6a846da728
03906 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03909 83c202                         add        edx, 2
0390c 895678                         mov        dword ptr [rsi + 0x78], edx
0390f 81e2feff1f00                   and        edx, 0x1ffffe
03915 85d2                           test       edx, edx
03917 0f840a1a0000                   je         0x7f6a90178827
0391d 48be28a76d846a7f0000           movabs     rsi, 0x7f6a846da728
03927 488386e000000001               add        qword ptr [rsi + 0xe0], 1
0392f 48bea8a86d846a7f0000           movabs     rsi, 0x7f6a846da8a8
03939 8b5678                         mov        edx, dword ptr [rsi + 0x78]
0393c 83c202                         add        edx, 2
0393f 895678                         mov        dword ptr [rsi + 0x78], edx
03942 81e2feff1f00                   and        edx, 0x1ffffe
03948 85d2                           test       edx, edx
0394a 0f84f8190000                   je         0x7f6a90178848
03950 48bee0c06d846a7f0000           movabs     rsi, 0x7f6a846dc0e0
0395a 4883867001000001               add        qword ptr [rsi + 0x170], 1
03962 48be889e2ee300000000           movabs     rsi, 0xe32e9e88
0396c 48be08c62de300000000           movabs     rsi, 0xe32dc608
03976 ba02000000                     mov        edx, 2
0397b b910000000                     mov        ecx, 0x10
03980 4c8bc0                         mov        r8, rax
03983 bf00000000                     mov        edi, 0
03988 48890424                       mov        qword ptr [rsp], rax
0398c 4c895c2408                     mov        qword ptr [rsp + 8], r11
03991 49bac0c52de300000000           movabs     r10, 0xe32dc5c0
0399b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
039a0 49ba889e2ee300000000           movabs     r10, 0xe32e9e88
039aa 4c89542418                     mov        qword ptr [rsp + 0x18], r10
039af e8ac8d5b07                     call       0x7f6a9772fc60
039b4 0f1f8400ac3a0017               nop        dword ptr [rax + rax + 0x17003aac]
039bc 4885c0                         test       rax, rax
039bf 48bbe0c06d846a7f0000           movabs     rbx, 0x7f6a846dc0e0
039c9 750c                           jne        0x7f6a90176ed7
039cb 808b7901000001                 or         byte ptr [rbx + 0x179], 1
039d2 e988000000                     jmp        0x7f6a90176f5f
039d7 8b38                           mov        edi, dword ptr [rax]
039d9 c1ef0d                         shr        edi, 0xd
039dc 48c1e70a                       shl        rdi, 0xa
039e0 41ba00000011                   mov        r10d, 0x11000000
039e6 4903fa                         add        rdi, r10
039e9 41ba31000000                   mov        r10d, 0x31
039ef 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
039f3 7436                           je         0x7f6a90176f2b
039f5 4983c202                       add        r10, 2
039f9 4983fa35                       cmp        r10, 0x35
039fd 75f0                           jne        0x7f6a90176eef
039ff 41ba31000000                   mov        r10d, 0x31
03a05 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03a0a 7412                           je         0x7f6a90176f1e
03a0c 4983c202                       add        r10, 2
03a10 4983fa35                       cmp        r10, 0x35
03a14 75ef                           jne        0x7f6a90176f05
03a16 41ba30000000                   mov        r10d, 0x30
03a1c eb11                           jmp        0x7f6a90176f2f
03a1e 50                             push       rax
03a1f 4833c0                         xor        rax, rax
03a22 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
03a28 58                             pop        rax
03a29 ebbe                           jmp        0x7f6a90176ee9
03a2b 4983c201                       add        r10, 1
03a2f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03a34 48bf00b4141100000000           movabs     rdi, 0x1114b400
03a3e 8b18                           mov        ebx, dword ptr [rax]
03a40 c1eb0d                         shr        ebx, 0xd
03a43 48c1e30a                       shl        rbx, 0xa
03a47 41ba00000011                   mov        r10d, 0x11000000
03a4d 4903da                         add        rbx, r10
03a50 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
03a54 0f850f190000                   jne        0x7f6a90178869
03a5a e900000000                     jmp        0x7f6a90176f5f
03a5f 488bf8                         mov        rdi, rax
03a62 4889bc2410020000               mov        qword ptr [rsp + 0x210], rdi
03a6a 483b07                         cmp        rax, qword ptr [rdi]
03a6d 488bf7                         mov        rsi, rdi
03a70 48bb00c063846a7f0000           movabs     rbx, 0x7f6a8463c000
03a7a 8b36                           mov        esi, dword ptr [rsi]
03a7c c1ee0d                         shr        esi, 0xd
03a7f 48c1e60a                       shl        rsi, 0xa
03a83 41ba00000011                   mov        r10d, 0x11000000
03a89 4903f2                         add        rsi, r10
03a8c 41babd000000                   mov        r10d, 0xbd
03a92 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03a96 743c                           je         0x7f6a90176fd4
03a98 4983c202                       add        r10, 2
03a9c 4981fac1000000                 cmp        r10, 0xc1
03aa3 75ed                           jne        0x7f6a90176f92
03aa5 41babd000000                   mov        r10d, 0xbd
03aab 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03ab0 7415                           je         0x7f6a90176fc7
03ab2 4983c202                       add        r10, 2
03ab6 4981fac1000000                 cmp        r10, 0xc1
03abd 75ec                           jne        0x7f6a90176fab
03abf 41babc000000                   mov        r10d, 0xbc
03ac5 eb11                           jmp        0x7f6a90176fd8
03ac7 50                             push       rax
03ac8 4833c0                         xor        rax, rax
03acb f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
03ad1 58                             pop        rax
03ad2 ebb8                           jmp        0x7f6a90176f8c
03ad4 4983c201                       add        r10, 1
03ad8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03add 48be30cb6d846a7f0000           movabs     rsi, 0x7f6a846dcb30
03ae7 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
03aea 83c302                         add        ebx, 2
03aed 895e78                         mov        dword ptr [rsi + 0x78], ebx
03af0 81e3feff1f00                   and        ebx, 0x1ffffe
03af6 85db                           test       ebx, ebx
03af8 0f84a1180000                   je         0x7f6a9017889f
03afe 488bf7                         mov        rsi, rdi
03b01 48bb30cb6d846a7f0000           movabs     rbx, 0x7f6a846dcb30
03b0b 8b36                           mov        esi, dword ptr [rsi]
03b0d c1ee0d                         shr        esi, 0xd
03b10 48c1e60a                       shl        rsi, 0xa
03b14 41ba00000011                   mov        r10d, 0x11000000
03b1a 4903f2                         add        rsi, r10
03b1d 41ba17000000                   mov        r10d, 0x17
03b23 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03b27 7436                           je         0x7f6a9017705f
03b29 4983c202                       add        r10, 2
03b2d 4983fa1b                       cmp        r10, 0x1b
03b31 75f0                           jne        0x7f6a90177023
03b33 41ba17000000                   mov        r10d, 0x17
03b39 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03b3e 7412                           je         0x7f6a90177052
03b40 4983c202                       add        r10, 2
03b44 4983fa1b                       cmp        r10, 0x1b
03b48 75ef                           jne        0x7f6a90177039
03b4a 41ba16000000                   mov        r10d, 0x16
03b50 eb11                           jmp        0x7f6a90177063
03b52 50                             push       rax
03b53 4833c0                         xor        rax, rax
03b56 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
03b5c 58                             pop        rax
03b5d ebbe                           jmp        0x7f6a9017701d
03b5f 4983c201                       add        r10, 1
03b63 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03b68 488bf7                         mov        rsi, rdi
03b6b 90                             nop        
03b6c 90                             nop        
03b6d 48b860ab74646a7f0000           movabs     rax, 0x7f6a6474ab60
03b77 e8e4865b07                     call       0x7f6a9772f760
03b7c 0f1f8400743c0018               nop        dword ptr [rax + rax + 0x18003c74]
03b84 48be30cb6d846a7f0000           movabs     rsi, 0x7f6a846dcb30
03b8e 488386e000000001               add        qword ptr [rsi + 0xe0], 1
03b96 48be58b36d846a7f0000           movabs     rsi, 0x7f6a846db358
03ba0 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
03ba3 83c702                         add        edi, 2
03ba6 897e78                         mov        dword ptr [rsi + 0x78], edi
03ba9 81e7feff1f00                   and        edi, 0x1ffffe
03baf 85ff                           test       edi, edi
03bb1 0f8409180000                   je         0x7f6a901788c0
03bb7 8b9c240c020000                 mov        ebx, dword ptr [rsp + 0x20c]
03bbe 8bbc24d0010000                 mov        edi, dword ptr [rsp + 0x1d0]
03bc5 48be58b36d846a7f0000           movabs     rsi, 0x7f6a846db358
03bcf 4883861001000001               add        qword ptr [rsi + 0x110], 1
03bd7 ffc8                           dec        eax
03bd9 2bd8                           sub        ebx, eax
03bdb 48bee8a96d846a7f0000           movabs     rsi, 0x7f6a846da9e8
03be5 8b4678                         mov        eax, dword ptr [rsi + 0x78]
03be8 83c002                         add        eax, 2
03beb 894678                         mov        dword ptr [rsi + 0x78], eax
03bee 25feff1f00                     and        eax, 0x1ffffe
03bf3 85c0                           test       eax, eax
03bf5 0f84e6170000                   je         0x7f6a901788e1
03bfb 48bee8a96d846a7f0000           movabs     rsi, 0x7f6a846da9e8
03c05 488386b000000001               add        qword ptr [rsi + 0xb0], 1
03c0d 48be0000000000000000           movabs     rsi, 0
03c17 be00000000                     mov        esi, 0
03c1c 3bfe                           cmp        edi, esi
03c1e 0f8cde170000                   jl         0x7f6a90178902
03c24 3bfb                           cmp        edi, ebx
03c26 0f8df7170000                   jge        0x7f6a90178923
03c2c 488bdf                         mov        rbx, rdi
03c2f 899c2418020000                 mov        dword ptr [rsp + 0x218], ebx
03c36 89bc24d0010000                 mov        dword ptr [rsp + 0x1d0], edi
03c3d 488bbc2410020000               mov        rdi, qword ptr [rsp + 0x210]
03c45 488bf7                         mov        rsi, rdi
03c48 48b930cb6d846a7f0000           movabs     rcx, 0x7f6a846dcb30
03c52 8b36                           mov        esi, dword ptr [rsi]
03c54 c1ee0d                         shr        esi, 0xd
03c57 48c1e60a                       shl        rsi, 0xa
03c5b 41ba00000011                   mov        r10d, 0x11000000
03c61 4903f2                         add        rsi, r10
03c64 41ba1f000000                   mov        r10d, 0x1f
03c6a 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
03c6e 7436                           je         0x7f6a901771a6
03c70 4983c202                       add        r10, 2
03c74 4983fa23                       cmp        r10, 0x23
03c78 75f0                           jne        0x7f6a9017716a
03c7a 41ba1f000000                   mov        r10d, 0x1f
03c80 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03c85 7412                           je         0x7f6a90177199
03c87 4983c202                       add        r10, 2
03c8b 4983fa23                       cmp        r10, 0x23
03c8f 75ef                           jne        0x7f6a90177180
03c91 41ba1e000000                   mov        r10d, 0x1e
03c97 eb11                           jmp        0x7f6a901771aa
03c99 50                             push       rax
03c9a 4833c0                         xor        rax, rax
03c9d f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
03ca3 58                             pop        rax
03ca4 ebbe                           jmp        0x7f6a90177164
03ca6 4983c201                       add        r10, 1
03caa 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03caf 488bf7                         mov        rsi, rdi
03cb2 90                             nop        
03cb3 90                             nop        
03cb4 90                             nop        
03cb5 48b888ab74646a7f0000           movabs     rax, 0x7f6a6474ab88
03cbf e89c855b07                     call       0x7f6a9772f760
03cc4 0f1f8400bc3d0019               nop        dword ptr [rax + rax + 0x19003dbc]
03ccc 483b00                         cmp        rax, qword ptr [rax]
03ccf 488bf0                         mov        rsi, rax
03cd2 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
03cdc 8b36                           mov        esi, dword ptr [rsi]
03cde c1ee0d                         shr        esi, 0xd
03ce1 48c1e60a                       shl        rsi, 0xa
03ce5 41ba00000011                   mov        r10d, 0x11000000
03ceb 4903f2                         add        rsi, r10
03cee 41ba25000000                   mov        r10d, 0x25
03cf4 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03cf8 7436                           je         0x7f6a90177230
03cfa 4983c202                       add        r10, 2
03cfe 4983fa29                       cmp        r10, 0x29
03d02 75f0                           jne        0x7f6a901771f4
03d04 41ba25000000                   mov        r10d, 0x25
03d0a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03d0f 7412                           je         0x7f6a90177223
03d11 4983c202                       add        r10, 2
03d15 4983fa29                       cmp        r10, 0x29
03d19 75ef                           jne        0x7f6a9017720a
03d1b 41ba24000000                   mov        r10d, 0x24
03d21 eb11                           jmp        0x7f6a90177234
03d23 50                             push       rax
03d24 4833c0                         xor        rax, rax
03d27 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03d2d 58                             pop        rax
03d2e ebbe                           jmp        0x7f6a901771ee
03d30 4983c201                       add        r10, 1
03d34 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03d39 8b7024                         mov        esi, dword ptr [rax + 0x24]
03d3c 4c3b25558b7d20                 cmp        r12, qword ptr [rip + 0x207d8b55]
03d43 0f8414000000                   je         0x7f6a9017725d
03d49 48bf2832a2ae6a7f0000           movabs     rdi, 0x7f6aaea23228
03d53 4883e4f0                       and        rsp, 0xfffffffffffffff0
03d57 e80473ba1f                     call       0x7f6aafd1e560
03d5c f4                             hlt        
03d5d 488bd0                         mov        rdx, rax
03d60 48b930cb6d846a7f0000           movabs     rcx, 0x7f6a846dcb30
03d6a 8b12                           mov        edx, dword ptr [rdx]
03d6c c1ea0d                         shr        edx, 0xd
03d6f 48c1e20a                       shl        rdx, 0xa
03d73 41ba00000011                   mov        r10d, 0x11000000
03d79 4903d2                         add        rdx, r10
03d7c 41ba2b000000                   mov        r10d, 0x2b
03d82 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03d86 7436                           je         0x7f6a901772be
03d88 4983c202                       add        r10, 2
03d8c 4983fa2f                       cmp        r10, 0x2f
03d90 75f0                           jne        0x7f6a90177282
03d92 41ba2b000000                   mov        r10d, 0x2b
03d98 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03d9d 7412                           je         0x7f6a901772b1
03d9f 4983c202                       add        r10, 2
03da3 4983fa2f                       cmp        r10, 0x2f
03da7 75ef                           jne        0x7f6a90177298
03da9 41ba2a000000                   mov        r10d, 0x2a
03daf eb11                           jmp        0x7f6a901772c2
03db1 50                             push       rax
03db2 4833c0                         xor        rax, rax
03db5 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03dbb 58                             pop        rax
03dbc ebbe                           jmp        0x7f6a9017727c
03dbe 4983c201                       add        r10, 1
03dc2 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03dc7 8b4804                         mov        ecx, dword ptr [rax + 4]
03dca 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
03dd4 4883828001000001               add        qword ptr [rdx + 0x180], 1
03ddc 48baa0b56d846a7f0000           movabs     rdx, 0x7f6a846db5a0
03de6 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
03dea 4183c002                       add        r8d, 2
03dee 44894278                       mov        dword ptr [rdx + 0x78], r8d
03df2 4181e0feff1f00                 and        r8d, 0x1ffffe
03df9 4585c0                         test       r8d, r8d
03dfc 0f845b160000                   je         0x7f6a9017895d
03e02 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
03e0c 4883829001000001               add        qword ptr [rdx + 0x190], 1
03e14 8b9c2418020000                 mov        ebx, dword ptr [rsp + 0x218]
03e1b 4863db                         movsxd     rbx, ebx
03e1e ba08000000                     mov        edx, 8
03e23 4c8bcb                         mov        r9, rbx
03e26 4c03ca                         add        r9, rdx
03e29 48ba28a76d846a7f0000           movabs     rdx, 0x7f6a846da728
03e33 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
03e37 4183c002                       add        r8d, 2
03e3b 44894278                       mov        dword ptr [rdx + 0x78], r8d
03e3f 4181e0feff1f00                 and        r8d, 0x1ffffe
03e46 4585c0                         test       r8d, r8d
03e49 0f842f160000                   je         0x7f6a9017897e
03e4f 48ba28a76d846a7f0000           movabs     rdx, 0x7f6a846da728
03e59 488382e000000001               add        qword ptr [rdx + 0xe0], 1
03e61 48baa8a86d846a7f0000           movabs     rdx, 0x7f6a846da8a8
03e6b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
03e6f 4183c002                       add        r8d, 2
03e73 44894278                       mov        dword ptr [rdx + 0x78], r8d
03e77 4181e0feff1f00                 and        r8d, 0x1ffffe
03e7e 4585c0                         test       r8d, r8d
03e81 0f8418160000                   je         0x7f6a9017899f
03e87 48ba30cb6d846a7f0000           movabs     rdx, 0x7f6a846dcb30
03e91 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
03e99 48ba703c2fe300000000           movabs     rdx, 0xe32f3c70
03ea3 ba02000000                     mov        edx, 2
03ea8 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
03eb0 bf00000000                     mov        edi, 0
03eb5 488b842410020000               mov        rax, qword ptr [rsp + 0x210]
03ebd 48890424                       mov        qword ptr [rsp], rax
03ec1 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
03ec9 4889442408                     mov        qword ptr [rsp + 8], rax
03ece 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
03ed3 49ba703c2fe300000000           movabs     r10, 0xe32f3c70
03edd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03ee2 90                             nop        
03ee3 90                             nop        
03ee4 90                             nop        
03ee5 90                             nop        
03ee6 90                             nop        
03ee7 e874885b07                     call       0x7f6a9772fc60
03eec 0f1f8400e43f001a               nop        dword ptr [rax + rax + 0x1a003fe4]
03ef4 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
03efb 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
03f03 4103d8                         add        ebx, r8d
03f06 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
03f10 ff8610060000                   inc        dword ptr [rsi + 0x610]
03f16 8bb424d4010000                 mov        esi, dword ptr [rsp + 0x1d4]
03f1d 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
03f27 ff8208080000                   inc        dword ptr [rdx + 0x808]
03f2d 488bc3                         mov        rax, rbx
03f30 8b942444010000                 mov        edx, dword ptr [rsp + 0x144]
03f37 ffc2                           inc        edx
03f39 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
03f43 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
03f47 4183c002                       add        r8d, 2
03f4b 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
03f4f 4181e0fe3f0000                 and        r8d, 0x3ffe
03f56 4585c0                         test       r8d, r8d
03f59 0f8461150000                   je         0x7f6a901789c0
03f5f 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03f63 418502                         test       dword ptr [r10], eax
03f66 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
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
03fad e95ec3ffff                     jmp        0x7f6a90173810
03fb2 4c8bc8                         mov        r9, rax
03fb5 4585c9                         test       r9d, r9d
03fb8 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
03fc2 b988030000                     mov        ecx, 0x388
03fc7 7e05                           jle        0x7f6a901774ce
03fc9 b998030000                     mov        ecx, 0x398
03fce 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
03fd2 4d8d4001                       lea        r8, [r8 + 1]
03fd6 4c89040a                       mov        qword ptr [rdx + rcx], r8
03fda 0f8ec2010000                   jle        0x7f6a901776a2
03fe0 488b9c2498010000               mov        rbx, qword ptr [rsp + 0x198]
03fe8 482bf3                         sub        rsi, rbx
03feb ba00000000                     mov        edx, 0
03ff0 483bf2                         cmp        rsi, rdx
03ff3 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
03ffd baa8030000                     mov        edx, 0x3a8
04002 7d05                           jge        0x7f6a90177509
04004 bab8030000                     mov        edx, 0x3b8
04009 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0400d 488d4901                       lea        rcx, [rcx + 1]
04011 48890c16                       mov        qword ptr [rsi + rdx], rcx
04015 0f8d87010000                   jge        0x7f6a901776a2
0401b 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
04023 488b5630                       mov        rdx, qword ptr [rsi + 0x30]
04027 be00000000                     mov        esi, 0
0402c 483bd6                         cmp        rdx, rsi
0402f 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
04039 bac8030000                     mov        edx, 0x3c8
0403e 7505                           jne        0x7f6a90177545
04040 bad8030000                     mov        edx, 0x3d8
04045 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
04049 488d4901                       lea        rcx, [rcx + 1]
0404d 48890c16                       mov        qword ptr [rsi + rdx], rcx
04051 0f854b010000                   jne        0x7f6a901776a2
04057 e950010000                     jmp        0x7f6a901776ac
0405c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
04064 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0406c 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
04074 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
0407b 488bce                         mov        rcx, rsi
0407e 8bb42434010000                 mov        esi, dword ptr [rsp + 0x134]
04085 488bde                         mov        rbx, rsi
04088 2bd9                           sub        ebx, ecx
0408a 48be00c063846a7f0000           movabs     rsi, 0x7f6a8463c000
04094 4883864808000001               add        qword ptr [rsi + 0x848], 1
0409c 488bf2                         mov        rsi, rdx
0409f 488bd1                         mov        rdx, rcx
040a2 488bc8                         mov        rcx, rax
040a5 4d8bc3                         mov        r8, r11
040a8 4c8bcb                         mov        r9, rbx
040ab 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
040b3 899c241c020000                 mov        dword ptr [rsp + 0x21c], ebx
040ba 4885c9                         test       rcx, rcx
040bd 0f841e140000                   je         0x7f6a901789e1
040c3 85d2                           test       edx, edx
040c5 0f8c16140000                   jl         0x7f6a901789e1
040cb 4585c0                         test       r8d, r8d
040ce 0f8c0d140000                   jl         0x7f6a901789e1
040d4 4a8d3c0a                       lea        rdi, [rdx + r9]
040d8 3b7e04                         cmp        edi, dword ptr [rsi + 4]
040db 0f8700140000                   ja         0x7f6a901789e1
040e1 4b8d3c08                       lea        rdi, [r8 + r9]
040e5 3b7904                         cmp        edi, dword ptr [rcx + 4]
040e8 0f87f3130000                   ja         0x7f6a901789e1
040ee 4585c9                         test       r9d, r9d
040f1 0f8cea130000                   jl         0x7f6a901789e1
040f7 4863d2                         movsxd     rdx, edx
040fa 4d63c0                         movsxd     r8, r8d
040fd 48bf0014041100000000           movabs     rdi, 0x11041400
04107 41ba00000011                   mov        r10d, 0x11000000
0410d 492bfa                         sub        rdi, r10
04110 48c1ef0a                       shr        rdi, 0xa
04114 448b19                         mov        r11d, dword ptr [rcx]
04117 41c1eb0d                       shr        r11d, 0xd
0411b 413bfb                         cmp        edi, r11d
0411e 0f8510000000                   jne        0x7f6a90177634
04124 448b1e                         mov        r11d, dword ptr [rsi]
04127 41c1eb0d                       shr        r11d, 0xd
0412b 413bfb                         cmp        edi, r11d
0412e 0f8414000000                   je         0x7f6a90177648
04134 48bf78a49bae6a7f0000           movabs     rdi, 0x7f6aae9ba478
0413e 4883e4f0                       and        rsp, 0xfffffffffffffff0
04142 e8196fba1f                     call       0x7f6aafd1e560
04147 f4                             hlt        
04148 488d7c1608                     lea        rdi, [rsi + rdx + 8]
0414d 4a8d740108                     lea        rsi, [rcx + r8 + 8]
04152 498bd1                         mov        rdx, r9
04155 40f6c40f                       test       spl, 0xf
04159 0f8412000000                   je         0x7f6a90177671
0415f 4883ec08                       sub        rsp, 8
04163 e8d81a5a07                     call       0x7f6a97719140
04168 4883c408                       add        rsp, 8
0416c e905000000                     jmp        0x7f6a90177676
04171 e8ca1a5a07                     call       0x7f6a97719140
04176 8b9c241c020000                 mov        ebx, dword ptr [rsp + 0x21c]
0417d 039c2474010000                 add        ebx, dword ptr [rsp + 0x174]
04184 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
0418c 895e38                         mov        dword ptr [rsi + 0x38], ebx
0418f 4881c450020000                 add        rsp, 0x250
04196 5d                             pop        rbp
04197 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0419b 0f8750130000                   ja         0x7f6a901789f1
041a1 c3                             ret        
041a2 bb02000000                     mov        ebx, 2
041a7 e915000000                     jmp        0x7f6a901776c1
041ac 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
041b6 ff82e8030000                   inc        dword ptr [rdx + 0x3e8]
041bc bb08000000                     mov        ebx, 8
041c1 899c2428020000                 mov        dword ptr [rsp + 0x228], ebx
041c8 e949130000                     jmp        0x7f6a90178a16
041cd 90                             nop        
041ce 90                             nop        
041cf 90                             nop        
041d0 90                             nop        
041d1 90                             nop        
041d2 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
041d9 0f855a130000                   jne        0x7f6a90178a39
041df 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
041e6 488d7820                       lea        rdi, [rax + 0x20]
041ea 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
041f1 0f8742130000                   ja         0x7f6a90178a39
041f7 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
041fe 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
04205 488908                         mov        qword ptr [rax], rcx
04208 4833c9                         xor        rcx, rcx
0420b 48894808                       mov        qword ptr [rax + 8], rcx
0420f 48894810                       mov        qword ptr [rax + 0x10], rcx
04213 48894818                       mov        qword ptr [rax + 0x18], rcx
04217 90                             nop        
04218 e938130000                     jmp        0x7f6a90178a55
0421d 90                             nop        
0421e 90                             nop        
0421f 90                             nop        
04220 90                             nop        
04221 90                             nop        
04222 498bf1                         mov        rsi, r9
04225 4889842420020000               mov        qword ptr [rsp + 0x220], rax
0422d 90                             nop        
0422e 90                             nop        
0422f e82c855b07                     call       0x7f6a9772fc60
04234 0f1f84002c43001c               nop        dword ptr [rax + rax + 0x1c00432c]
0423c 48ba00c063846a7f0000           movabs     rdx, 0x7f6a8463c000
04246 488d9210040000                 lea        rdx, [rdx + 0x410]
0424d 4885c0                         test       rax, rax
04250 750e                           jne        0x7f6a90177760
04252 f60201                         test       byte ptr [rdx], 1
04255 0f8505000000                   jne        0x7f6a90177760
0425b f048830a01                     lock or    qword ptr [rdx], 1
04260 488b942420020000               mov        rdx, qword ptr [rsp + 0x220]
04268 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
04272 4883812004000001               add        qword ptr [rcx + 0x420], 1
0427a 8b942428020000                 mov        edx, dword ptr [rsp + 0x228]
04281 488bc8                         mov        rcx, rax
04284 488bb42420020000               mov        rsi, qword ptr [rsp + 0x220]
0428c 90                             nop        
0428d 90                             nop        
0428e 90                             nop        
0428f e8cc7a5b07                     call       0x7f6a9772f260
04294 0f1f84008c43001d               nop        dword ptr [rax + rax + 0x1d00438c]
0429c 488b842420020000               mov        rax, qword ptr [rsp + 0x220]
042a4 e951130000                     jmp        0x7f6a90178afa
042a9 90                             nop        
042aa 90                             nop        
042ab 90                             nop        
042ac 90                             nop        
042ad 90                             nop        
042ae 90                             nop        
042af 90                             nop        
042b0 e9b9120000                     jmp        0x7f6a90178a6e
042b5 90                             nop        
042b6 90                             nop        
042b7 90                             nop        
042b8 90                             nop        
042b9 90                             nop        
042ba 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
042c1 0f85ca120000                   jne        0x7f6a90178a91
042c7 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
042ce 488d7820                       lea        rdi, [rax + 0x20]
042d2 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
042d9 0f87b2120000                   ja         0x7f6a90178a91
042df 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
042e6 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
042ed 488908                         mov        qword ptr [rax], rcx
042f0 4833c9                         xor        rcx, rcx
042f3 48894808                       mov        qword ptr [rax + 8], rcx
042f7 48894810                       mov        qword ptr [rax + 0x10], rcx
042fb 48894818                       mov        qword ptr [rax + 0x18], rcx
042ff 488bd0                         mov        rdx, rax
04302 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
0430c 4883815802000001               add        qword ptr [rcx + 0x258], 1
04314 ba02000000                     mov        edx, 2
04319 48b9006226e200000000           movabs     rcx, 0xe2266200
04323 488bf0                         mov        rsi, rax
04326 4889842430020000               mov        qword ptr [rsp + 0x230], rax
0432e 90                             nop        
0432f e82c7a5b07                     call       0x7f6a9772f260
04334 0f1f84002c44001e               nop        dword ptr [rax + rax + 0x1e00442c]
0433c 488b842430020000               mov        rax, qword ptr [rsp + 0x230]
04344 e9b1120000                     jmp        0x7f6a90178afa
04349 90                             nop        
0434a 90                             nop        
0434b 90                             nop        
0434c 90                             nop        
0434d 90                             nop        
0434e 90                             nop        
0434f 90                             nop        
04350 e958120000                     jmp        0x7f6a90178aad
04355 90                             nop        
04356 90                             nop        
04357 90                             nop        
04358 90                             nop        
04359 90                             nop        
0435a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04361 0f8569120000                   jne        0x7f6a90178ad0
04367 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
0436e 488d7820                       lea        rdi, [rax + 0x20]
04372 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
04379 0f8751120000                   ja         0x7f6a90178ad0
0437f 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
04386 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0438d 488908                         mov        qword ptr [rax], rcx
04390 4833c9                         xor        rcx, rcx
04393 48894808                       mov        qword ptr [rax + 8], rcx
04397 48894810                       mov        qword ptr [rax + 0x10], rcx
0439b 48894818                       mov        qword ptr [rax + 0x18], rcx
0439f 488bd0                         mov        rdx, rax
043a2 48b900c063846a7f0000           movabs     rcx, 0x7f6a8463c000
043ac 4883814001000001               add        qword ptr [rcx + 0x140], 1
043b4 ba05000000                     mov        edx, 5
043b9 48b9306226e200000000           movabs     rcx, 0xe2266230
043c3 488bf0                         mov        rsi, rax
043c6 4889842438020000               mov        qword ptr [rsp + 0x238], rax
043ce 90                             nop        
043cf e88c795b07                     call       0x7f6a9772f260
043d4 0f1f8400cc44001f               nop        dword ptr [rax + rax + 0x1f0044cc]
043dc 488b842438020000               mov        rax, qword ptr [rsp + 0x238]
043e4 e911120000                     jmp        0x7f6a90178afa
043e9 49ba300462846a7f0000           movabs     r10, 0x7f6a84620430
043f3 4c89542408                     mov        qword ptr [rsp + 8], r10
043f8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04400 e85b715507                     call       0x7f6a976cea60
04405 e983bcffff                     jmp        0x7f6a9017358d
0440a 49baa8ee1a846a7f0000           movabs     r10, 0x7f6a841aeea8
04414 4c89542408                     mov        qword ptr [rsp + 8], r10
04419 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04421 e83a715507                     call       0x7f6a976cea60
04426 e90dbeffff                     jmp        0x7f6a90173738
0442b e8b0dc5507                     call       0x7f6a976d55e0
04430 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
0443a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0443e e81d6cba1f                     call       0x7f6aafd1e560
04443 f4                             hlt        
04444 e897dc5507                     call       0x7f6a976d55e0
04449 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04453 4883e4f0                       and        rsp, 0xfffffffffffffff0
04457 e8046cba1f                     call       0x7f6aafd1e560
0445c f4                             hlt        
0445d e87edc5507                     call       0x7f6a976d55e0
04462 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
0446c 4883e4f0                       and        rsp, 0xfffffffffffffff0
04470 e8eb6bba1f                     call       0x7f6aafd1e560
04475 f4                             hlt        
04476 48891424                       mov        qword ptr [rsp], rdx
0447a 4c89442408                     mov        qword ptr [rsp + 8], r8
0447f e85ce55507                     call       0x7f6a976d5ee0
04484 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
0448e 4883e4f0                       and        rsp, 0xfffffffffffffff0
04492 e8c96bba1f                     call       0x7f6aafd1e560
04497 f4                             hlt        
04498 e843dc5507                     call       0x7f6a976d55e0
0449d 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
044a7 4883e4f0                       and        rsp, 0xfffffffffffffff0
044ab e8b06bba1f                     call       0x7f6aafd1e560
044b0 f4                             hlt        
044b1 e82adc5507                     call       0x7f6a976d55e0
044b6 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
044c0 4883e4f0                       and        rsp, 0xfffffffffffffff0
044c4 e8976bba1f                     call       0x7f6aafd1e560
044c9 f4                             hlt        
044ca 48891424                       mov        qword ptr [rsp], rdx
044ce 4c894c2408                     mov        qword ptr [rsp + 8], r9
044d3 e808e55507                     call       0x7f6a976d5ee0
044d8 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
044e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
044e6 e8756bba1f                     call       0x7f6aafd1e560
044eb f4                             hlt        
044ec e8efdb5507                     call       0x7f6a976d55e0
044f1 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
044fb 4883e4f0                       and        rsp, 0xfffffffffffffff0
044ff e85c6bba1f                     call       0x7f6aafd1e560
04504 f4                             hlt        
04505 e8d6db5507                     call       0x7f6a976d55e0
0450a 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04514 4883e4f0                       and        rsp, 0xfffffffffffffff0
04518 e8436bba1f                     call       0x7f6aafd1e560
0451d f4                             hlt        
0451e 48c7042401000000               mov        qword ptr [rsp], 1
04526 48895c2408                     mov        qword ptr [rsp + 8], rbx
0452b e8b0e45507                     call       0x7f6a976d5ee0
04530 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
0453a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0453e e81d6bba1f                     call       0x7f6aafd1e560
04543 f4                             hlt        
04544 48c7042402000000               mov        qword ptr [rsp], 2
0454c 48895c2408                     mov        qword ptr [rsp + 8], rbx
04551 e88ae45507                     call       0x7f6a976d5ee0
04556 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04560 4883e4f0                       and        rsp, 0xfffffffffffffff0
04564 e8f76aba1f                     call       0x7f6aafd1e560
04569 f4                             hlt        
0456a 49ba98b974846a7f0000           movabs     r10, 0x7f6a8474b998
04574 4c89542408                     mov        qword ptr [rsp + 8], r10
04579 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04581 e8da6f5507                     call       0x7f6a976cea60
04586 e942c2ffff                     jmp        0x7f6a90173ccd
0458b 49baa04b6d846a7f0000           movabs     r10, 0x7f6a846d4ba0
04595 4c89542408                     mov        qword ptr [rsp + 8], r10
0459a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045a2 e8b96f5507                     call       0x7f6a976cea60
045a7 e9c5c2ffff                     jmp        0x7f6a90173d71
045ac 49ba90a618846a7f0000           movabs     r10, 0x7f6a8418a690
045b6 4c89542408                     mov        qword ptr [rsp + 8], r10
045bb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
045c3 e8986f5507                     call       0x7f6a976cea60
045c8 e9eec2ffff                     jmp        0x7f6a90173dbb
045cd 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
045d5 e886925507                     call       0x7f6a976d0d60
045da 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
045e4 4883e4f0                       and        rsp, 0xfffffffffffffff0
045e8 e8736aba1f                     call       0x7f6aafd1e560
045ed f4                             hlt        
045ee 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
045f6 e865925507                     call       0x7f6a976d0d60
045fb 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04605 4883e4f0                       and        rsp, 0xfffffffffffffff0
04609 e8526aba1f                     call       0x7f6aafd1e560
0460e f4                             hlt        
0460f 49ba687c7d846a7f0000           movabs     r10, 0x7f6a847d7c68
04619 4c89542408                     mov        qword ptr [rsp + 8], r10
0461e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04626 e8356f5507                     call       0x7f6a976cea60
0462b e964c3ffff                     jmp        0x7f6a90173e94
04630 49ba90ee7d846a7f0000           movabs     r10, 0x7f6a847dee90
0463a 4c89542408                     mov        qword ptr [rsp + 8], r10
0463f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04647 e8146f5507                     call       0x7f6a976cea60
0464c e976c3ffff                     jmp        0x7f6a90173ec7
04651 49bad8b068846a7f0000           movabs     r10, 0x7f6a8468b0d8
0465b 4c89542408                     mov        qword ptr [rsp + 8], r10
04660 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04668 e8f36e5507                     call       0x7f6a976cea60
0466d e9ccc3ffff                     jmp        0x7f6a90173f3e
04672 49ba58d574846a7f0000           movabs     r10, 0x7f6a8474d558
0467c 4c89542408                     mov        qword ptr [rsp + 8], r10
04681 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04689 e8d26e5507                     call       0x7f6a976cea60
0468e e9e2c3ffff                     jmp        0x7f6a90173f75
04693 49bad86e68846a7f0000           movabs     r10, 0x7f6a84686ed8
0469d 4c89542408                     mov        qword ptr [rsp + 8], r10
046a2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046aa e8b16e5507                     call       0x7f6a976cea60
046af e9f9c3ffff                     jmp        0x7f6a90173fad
046b4 49ba18f074846a7f0000           movabs     r10, 0x7f6a8474f018
046be 4c89542408                     mov        qword ptr [rsp + 8], r10
046c3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046cb e8906e5507                     call       0x7f6a976cea60
046d0 e9f3c4ffff                     jmp        0x7f6a901740c8
046d5 49ba10d44c846a7f0000           movabs     r10, 0x7f6a844cd410
046df 4c89542408                     mov        qword ptr [rsp + 8], r10
046e4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046ec e86f6e5507                     call       0x7f6a976cea60
046f1 e913c5ffff                     jmp        0x7f6a90174109
046f6 49baa0913f846a7f0000           movabs     r10, 0x7f6a843f91a0
04700 4c89542408                     mov        qword ptr [rsp + 8], r10
04705 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0470d e84e6e5507                     call       0x7f6a976cea60
04712 e925c5ffff                     jmp        0x7f6a9017413c
04717 48890424                       mov        qword ptr [rsp], rax
0471b e840ac5507                     call       0x7f6a976d2860
04720 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
0472a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0472e e82d69ba1f                     call       0x7f6aafd1e560
04733 f4                             hlt        
04734 e8a7d95507                     call       0x7f6a976d55e0
04739 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04743 4883e4f0                       and        rsp, 0xfffffffffffffff0
04747 e81469ba1f                     call       0x7f6aafd1e560
0474c f4                             hlt        
0474d 49ba18c874846a7f0000           movabs     r10, 0x7f6a8474c818
04757 4c89542408                     mov        qword ptr [rsp + 8], r10
0475c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04764 e8f76d5507                     call       0x7f6a976cea60
04769 e980c6ffff                     jmp        0x7f6a901742ee
0476e e86dd95507                     call       0x7f6a976d55e0
04773 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
0477d 4883e4f0                       and        rsp, 0xfffffffffffffff0
04781 e8da68ba1f                     call       0x7f6aafd1e560
04786 f4                             hlt        
04787 49baa04b6d846a7f0000           movabs     r10, 0x7f6a846d4ba0
04791 4c89542408                     mov        qword ptr [rsp + 8], r10
04796 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0479e e8bd6d5507                     call       0x7f6a976cea60
047a3 e90ac7ffff                     jmp        0x7f6a901743b2
047a8 49ba90a618846a7f0000           movabs     r10, 0x7f6a8418a690
047b2 4c89542408                     mov        qword ptr [rsp + 8], r10
047b7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
047bf e89c6d5507                     call       0x7f6a976cea60
047c4 e927c7ffff                     jmp        0x7f6a901743f0
047c9 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
047d1 e88a905507                     call       0x7f6a976d0d60
047d6 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
047e0 4883e4f0                       and        rsp, 0xfffffffffffffff0
047e4 e87768ba1f                     call       0x7f6aafd1e560
047e9 f4                             hlt        
047ea 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
047f2 e869905507                     call       0x7f6a976d0d60
047f7 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04801 4883e4f0                       and        rsp, 0xfffffffffffffff0
04805 e85668ba1f                     call       0x7f6aafd1e560
0480a f4                             hlt        
0480b e8d0d85507                     call       0x7f6a976d55e0
04810 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
0481a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0481e e83d68ba1f                     call       0x7f6aafd1e560
04823 f4                             hlt        
04824 49ba18f074846a7f0000           movabs     r10, 0x7f6a8474f018
0482e 4c89542408                     mov        qword ptr [rsp + 8], r10
04833 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0483b e8206d5507                     call       0x7f6a976cea60
04840 e9b5c8ffff                     jmp        0x7f6a901745fa
04845 49ba10d44c846a7f0000           movabs     r10, 0x7f6a844cd410
0484f 4c89542408                     mov        qword ptr [rsp + 8], r10
04854 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0485c e8ff6c5507                     call       0x7f6a976cea60
04861 e9e1c8ffff                     jmp        0x7f6a90174647
04866 49baa0913f846a7f0000           movabs     r10, 0x7f6a843f91a0
04870 4c89542408                     mov        qword ptr [rsp + 8], r10
04875 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0487d e8de6c5507                     call       0x7f6a976cea60
04882 e9f8c8ffff                     jmp        0x7f6a9017467f
04887 49ba98b974846a7f0000           movabs     r10, 0x7f6a8474b998
04891 4c89542408                     mov        qword ptr [rsp + 8], r10
04896 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0489e e8bd6c5507                     call       0x7f6a976cea60
048a3 e9f7c9ffff                     jmp        0x7f6a9017479f
048a8 49baa04b6d846a7f0000           movabs     r10, 0x7f6a846d4ba0
048b2 4c89542408                     mov        qword ptr [rsp + 8], r10
048b7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048bf e89c6c5507                     call       0x7f6a976cea60
048c4 e97fcaffff                     jmp        0x7f6a90174848
048c9 49ba90a618846a7f0000           movabs     r10, 0x7f6a8418a690
048d3 4c89542408                     mov        qword ptr [rsp + 8], r10
048d8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048e0 e87b6c5507                     call       0x7f6a976cea60
048e5 e99ccaffff                     jmp        0x7f6a90174886
048ea 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
048f2 e8698f5507                     call       0x7f6a976d0d60
048f7 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04901 4883e4f0                       and        rsp, 0xfffffffffffffff0
04905 e85667ba1f                     call       0x7f6aafd1e560
0490a f4                             hlt        
0490b 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04913 e8488f5507                     call       0x7f6a976d0d60
04918 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04922 4883e4f0                       and        rsp, 0xfffffffffffffff0
04926 e83567ba1f                     call       0x7f6aafd1e560
0492b f4                             hlt        
0492c 49ba687c7d846a7f0000           movabs     r10, 0x7f6a847d7c68
04936 4c89542408                     mov        qword ptr [rsp + 8], r10
0493b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04943 e8186c5507                     call       0x7f6a976cea60
04948 e912cbffff                     jmp        0x7f6a9017495f
0494d 49ba90ee7d846a7f0000           movabs     r10, 0x7f6a847dee90
04957 4c89542408                     mov        qword ptr [rsp + 8], r10
0495c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04964 e8f76b5507                     call       0x7f6a976cea60
04969 e929cbffff                     jmp        0x7f6a90174997
0496e 49bad8b068846a7f0000           movabs     r10, 0x7f6a8468b0d8
04978 4c89542408                     mov        qword ptr [rsp + 8], r10
0497d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04985 e8d66b5507                     call       0x7f6a976cea60
0498a e968cbffff                     jmp        0x7f6a901749f7
0498f 49ba58d574846a7f0000           movabs     r10, 0x7f6a8474d558
04999 4c89542408                     mov        qword ptr [rsp + 8], r10
0499e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049a6 e8b56b5507                     call       0x7f6a976cea60
049ab e97fcbffff                     jmp        0x7f6a90174a2f
049b0 49bad86e68846a7f0000           movabs     r10, 0x7f6a84686ed8
049ba 4c89542408                     mov        qword ptr [rsp + 8], r10
049bf 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049c7 e8946b5507                     call       0x7f6a976cea60
049cc e996cbffff                     jmp        0x7f6a90174a67
049d1 49ba18f074846a7f0000           movabs     r10, 0x7f6a8474f018
049db 4c89542408                     mov        qword ptr [rsp + 8], r10
049e0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049e8 e8736b5507                     call       0x7f6a976cea60
049ed e98cccffff                     jmp        0x7f6a90174b7e
049f2 49ba10d44c846a7f0000           movabs     r10, 0x7f6a844cd410
049fc 4c89542408                     mov        qword ptr [rsp + 8], r10
04a01 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a09 e8526b5507                     call       0x7f6a976cea60
04a0e e9b1ccffff                     jmp        0x7f6a90174bc4
04a13 49baa0913f846a7f0000           movabs     r10, 0x7f6a843f91a0
04a1d 4c89542408                     mov        qword ptr [rsp + 8], r10
04a22 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a2a e8316b5507                     call       0x7f6a976cea60
04a2f e9c8ccffff                     jmp        0x7f6a90174bfc
04a34 48890424                       mov        qword ptr [rsp], rax
04a38 e823a95507                     call       0x7f6a976d2860
04a3d 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04a47 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a4b e81066ba1f                     call       0x7f6aafd1e560
04a50 f4                             hlt        
04a51 e88ad65507                     call       0x7f6a976d55e0
04a56 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04a60 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a64 e8f765ba1f                     call       0x7f6aafd1e560
04a69 f4                             hlt        
04a6a 49ba18c874846a7f0000           movabs     r10, 0x7f6a8474c818
04a74 4c89542408                     mov        qword ptr [rsp + 8], r10
04a79 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a81 e8da6a5507                     call       0x7f6a976cea60
04a86 e92bceffff                     jmp        0x7f6a90174db6
04a8b e850d65507                     call       0x7f6a976d55e0
04a90 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04a9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a9e e8bd65ba1f                     call       0x7f6aafd1e560
04aa3 f4                             hlt        
04aa4 49baa04b6d846a7f0000           movabs     r10, 0x7f6a846d4ba0
04aae 4c89542408                     mov        qword ptr [rsp + 8], r10
04ab3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04abb e8a06a5507                     call       0x7f6a976cea60
04ac0 e9b5ceffff                     jmp        0x7f6a90174e7a
04ac5 49ba90a618846a7f0000           movabs     r10, 0x7f6a8418a690
04acf 4c89542408                     mov        qword ptr [rsp + 8], r10
04ad4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04adc e87f6a5507                     call       0x7f6a976cea60
04ae1 e9d2ceffff                     jmp        0x7f6a90174eb8
04ae6 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04aee e86d8d5507                     call       0x7f6a976d0d60
04af3 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04afd 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b01 e85a65ba1f                     call       0x7f6aafd1e560
04b06 f4                             hlt        
04b07 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04b0f e84c8d5507                     call       0x7f6a976d0d60
04b14 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04b1e 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b22 e83965ba1f                     call       0x7f6aafd1e560
04b27 f4                             hlt        
04b28 e8b3d55507                     call       0x7f6a976d55e0
04b2d 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04b37 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b3b e82065ba1f                     call       0x7f6aafd1e560
04b40 f4                             hlt        
04b41 49ba18f074846a7f0000           movabs     r10, 0x7f6a8474f018
04b4b 4c89542408                     mov        qword ptr [rsp + 8], r10
04b50 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b58 e8036a5507                     call       0x7f6a976cea60
04b5d e960d0ffff                     jmp        0x7f6a901750c2
04b62 49ba10d44c846a7f0000           movabs     r10, 0x7f6a844cd410
04b6c 4c89542408                     mov        qword ptr [rsp + 8], r10
04b71 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b79 e8e2695507                     call       0x7f6a976cea60
04b7e e98cd0ffff                     jmp        0x7f6a9017510f
04b83 49baa0913f846a7f0000           movabs     r10, 0x7f6a843f91a0
04b8d 4c89542408                     mov        qword ptr [rsp + 8], r10
04b92 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b9a e8c1695507                     call       0x7f6a976cea60
04b9f e9a3d0ffff                     jmp        0x7f6a90175147
04ba4 49ba300462846a7f0000           movabs     r10, 0x7f6a84620430
04bae 4c89542408                     mov        qword ptr [rsp + 8], r10
04bb3 48c704240a020000               mov        qword ptr [rsp], 0x20a
04bbb e8a0695507                     call       0x7f6a976cea60
04bc0 e948d1ffff                     jmp        0x7f6a9017520d
04bc5 90                             nop        
04bc6 90                             nop        
04bc7 e8947b5b07                     call       0x7f6a9772fc60
04bcc e978d2ffff                     jmp        0x7f6a90175349
04bd1 90                             nop        
04bd2 90                             nop        
04bd3 90                             nop        
04bd4 90                             nop        
04bd5 90                             nop        
04bd6 90                             nop        
04bd7 e8847b5b07                     call       0x7f6a9772fc60
04bdc e940d4ffff                     jmp        0x7f6a90175521
04be1 49bac02e62846a7f0000           movabs     r10, 0x7f6a84622ec0
04beb 4c89542408                     mov        qword ptr [rsp + 8], r10
04bf0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bf8 e863695507                     call       0x7f6a976cea60
04bfd e9a0d4ffff                     jmp        0x7f6a901755a2
04c02 49ba78f871846a7f0000           movabs     r10, 0x7f6a8471f878
04c0c 4c89542408                     mov        qword ptr [rsp + 8], r10
04c11 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c19 e842695507                     call       0x7f6a976cea60
04c1e e9fed4ffff                     jmp        0x7f6a90175621
04c23 49baf09c09846a7f0000           movabs     r10, 0x7f6a84099cf0
04c2d 4c89542408                     mov        qword ptr [rsp + 8], r10
04c32 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c3a e821695507                     call       0x7f6a976cea60
04c3f e96fd5ffff                     jmp        0x7f6a901756b3
04c44 49ba68d472846a7f0000           movabs     r10, 0x7f6a8472d468
04c4e 4c89542408                     mov        qword ptr [rsp + 8], r10
04c53 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c5b e800695507                     call       0x7f6a976cea60
04c60 e910d6ffff                     jmp        0x7f6a90175775
04c65 49ba980e73846a7f0000           movabs     r10, 0x7f6a84730e98
04c6f 4c89542408                     mov        qword ptr [rsp + 8], r10
04c74 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c7c e8df685507                     call       0x7f6a976cea60
04c81 e958d6ffff                     jmp        0x7f6a901757de
04c86 49ba680d73846a7f0000           movabs     r10, 0x7f6a84730d68
04c90 4c89542408                     mov        qword ptr [rsp + 8], r10
04c95 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c9d e8be685507                     call       0x7f6a976cea60
04ca2 e96ad6ffff                     jmp        0x7f6a90175811
04ca7 e834d45507                     call       0x7f6a976d55e0
04cac 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04cb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
04cba e8a163ba1f                     call       0x7f6aafd1e560
04cbf f4                             hlt        
04cc0 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04cc8 e8938b5507                     call       0x7f6a976d0d60
04ccd 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04cd7 4883e4f0                       and        rsp, 0xfffffffffffffff0
04cdb e88063ba1f                     call       0x7f6aafd1e560
04ce0 f4                             hlt        
04ce1 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04ce9 e8728b5507                     call       0x7f6a976d0d60
04cee 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04cf8 4883e4f0                       and        rsp, 0xfffffffffffffff0
04cfc e85f63ba1f                     call       0x7f6aafd1e560
04d01 f4                             hlt        
04d02 49ba300462846a7f0000           movabs     r10, 0x7f6a84620430
04d0c 4c89542408                     mov        qword ptr [rsp + 8], r10
04d11 48c70424aa020000               mov        qword ptr [rsp], 0x2aa
04d19 e842685507                     call       0x7f6a976cea60
04d1e e951d7ffff                     jmp        0x7f6a90175974
04d23 49ba98b974846a7f0000           movabs     r10, 0x7f6a8474b998
04d2d 4c89542408                     mov        qword ptr [rsp + 8], r10
04d32 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d3a e821685507                     call       0x7f6a976cea60
04d3f e926d8ffff                     jmp        0x7f6a90175a6a
04d44 e897d35507                     call       0x7f6a976d55e0
04d49 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04d53 4883e4f0                       and        rsp, 0xfffffffffffffff0
04d57 e80463ba1f                     call       0x7f6aafd1e560
04d5c f4                             hlt        
04d5d 49baa04b6d846a7f0000           movabs     r10, 0x7f6a846d4ba0
04d67 4c89542408                     mov        qword ptr [rsp + 8], r10
04d6c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d74 e8e7675507                     call       0x7f6a976cea60
04d79 e994d8ffff                     jmp        0x7f6a90175b12
04d7e 49ba90a618846a7f0000           movabs     r10, 0x7f6a8418a690
04d88 4c89542408                     mov        qword ptr [rsp + 8], r10
04d8d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d95 e8c6675507                     call       0x7f6a976cea60
04d9a e9acd8ffff                     jmp        0x7f6a90175b4b
04d9f 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04da7 e8b48a5507                     call       0x7f6a976d0d60
04dac 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04db6 4883e4f0                       and        rsp, 0xfffffffffffffff0
04dba e8a162ba1f                     call       0x7f6aafd1e560
04dbf f4                             hlt        
04dc0 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04dc8 e8938a5507                     call       0x7f6a976d0d60
04dcd 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04dd7 4883e4f0                       and        rsp, 0xfffffffffffffff0
04ddb e88062ba1f                     call       0x7f6aafd1e560
04de0 f4                             hlt        
04de1 49ba687c7d846a7f0000           movabs     r10, 0x7f6a847d7c68
04deb 4c89542408                     mov        qword ptr [rsp + 8], r10
04df0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04df8 e863675507                     call       0x7f6a976cea60
04dfd e917d9ffff                     jmp        0x7f6a90175c19
04e02 49ba90ee7d846a7f0000           movabs     r10, 0x7f6a847dee90
04e0c 4c89542408                     mov        qword ptr [rsp + 8], r10
04e11 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e19 e842675507                     call       0x7f6a976cea60
04e1e e929d9ffff                     jmp        0x7f6a90175c4c
04e23 49bad8b068846a7f0000           movabs     r10, 0x7f6a8468b0d8
04e2d 4c89542408                     mov        qword ptr [rsp + 8], r10
04e32 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e3a e821675507                     call       0x7f6a976cea60
04e3f e96cd9ffff                     jmp        0x7f6a90175cb0
04e44 49ba58d574846a7f0000           movabs     r10, 0x7f6a8474d558
04e4e 4c89542408                     mov        qword ptr [rsp + 8], r10
04e53 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e5b e800675507                     call       0x7f6a976cea60
04e60 e986d9ffff                     jmp        0x7f6a90175ceb
04e65 49bad86e68846a7f0000           movabs     r10, 0x7f6a84686ed8
04e6f 4c89542408                     mov        qword ptr [rsp + 8], r10
04e74 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e7c e8df665507                     call       0x7f6a976cea60
04e81 e998d9ffff                     jmp        0x7f6a90175d1e
04e86 49ba18f074846a7f0000           movabs     r10, 0x7f6a8474f018
04e90 4c89542408                     mov        qword ptr [rsp + 8], r10
04e95 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e9d e8be665507                     call       0x7f6a976cea60
04ea2 e985daffff                     jmp        0x7f6a90175e2c
04ea7 49ba10d44c846a7f0000           movabs     r10, 0x7f6a844cd410
04eb1 4c89542408                     mov        qword ptr [rsp + 8], r10
04eb6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ebe e89d665507                     call       0x7f6a976cea60
04ec3 e9a5daffff                     jmp        0x7f6a90175e6d
04ec8 49baa0913f846a7f0000           movabs     r10, 0x7f6a843f91a0
04ed2 4c89542408                     mov        qword ptr [rsp + 8], r10
04ed7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04edf e87c665507                     call       0x7f6a976cea60
04ee4 e9b7daffff                     jmp        0x7f6a90175ea0
04ee9 48890424                       mov        qword ptr [rsp], rax
04eed e86ea45507                     call       0x7f6a976d2860
04ef2 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04efc 4883e4f0                       and        rsp, 0xfffffffffffffff0
04f00 e85b61ba1f                     call       0x7f6aafd1e560
04f05 f4                             hlt        
04f06 e8d5d15507                     call       0x7f6a976d55e0
04f0b 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04f15 4883e4f0                       and        rsp, 0xfffffffffffffff0
04f19 e84261ba1f                     call       0x7f6aafd1e560
04f1e f4                             hlt        
04f1f 49ba18c874846a7f0000           movabs     r10, 0x7f6a8474c818
04f29 4c89542408                     mov        qword ptr [rsp + 8], r10
04f2e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f36 e825665507                     call       0x7f6a976cea60
04f3b e90edcffff                     jmp        0x7f6a9017604e
04f40 49baa04b6d846a7f0000           movabs     r10, 0x7f6a846d4ba0
04f4a 4c89542408                     mov        qword ptr [rsp + 8], r10
04f4f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f57 e804665507                     call       0x7f6a976cea60
04f5c e9a6dcffff                     jmp        0x7f6a90176107
04f61 49ba90a618846a7f0000           movabs     r10, 0x7f6a8418a690
04f6b 4c89542408                     mov        qword ptr [rsp + 8], r10
04f70 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f78 e8e3655507                     call       0x7f6a976cea60
04f7d e9ccdcffff                     jmp        0x7f6a9017614e
04f82 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04f8a e8d1885507                     call       0x7f6a976d0d60
04f8f 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04f99 4883e4f0                       and        rsp, 0xfffffffffffffff0
04f9d e8be60ba1f                     call       0x7f6aafd1e560
04fa2 f4                             hlt        
04fa3 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04fab e8b0885507                     call       0x7f6a976d0d60
04fb0 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04fba 4883e4f0                       and        rsp, 0xfffffffffffffff0
04fbe e89d60ba1f                     call       0x7f6aafd1e560
04fc3 f4                             hlt        
04fc4 e817d15507                     call       0x7f6a976d55e0
04fc9 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
04fd3 4883e4f0                       and        rsp, 0xfffffffffffffff0
04fd7 e88460ba1f                     call       0x7f6aafd1e560
04fdc f4                             hlt        
04fdd 49ba18f074846a7f0000           movabs     r10, 0x7f6a8474f018
04fe7 4c89542408                     mov        qword ptr [rsp + 8], r10
04fec 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ff4 e867655507                     call       0x7f6a976cea60
04ff9 e95cdeffff                     jmp        0x7f6a9017635a
04ffe 49ba10d44c846a7f0000           movabs     r10, 0x7f6a844cd410
05008 4c89542408                     mov        qword ptr [rsp + 8], r10
0500d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05015 e846655507                     call       0x7f6a976cea60
0501a e988deffff                     jmp        0x7f6a901763a7
0501f 49baa0913f846a7f0000           movabs     r10, 0x7f6a843f91a0
05029 4c89542408                     mov        qword ptr [rsp + 8], r10
0502e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05036 e825655507                     call       0x7f6a976cea60
0503b e99fdeffff                     jmp        0x7f6a901763df
05040 49ba300462846a7f0000           movabs     r10, 0x7f6a84620430
0504a 4c89542408                     mov        qword ptr [rsp + 8], r10
0504f 48c70424e8020000               mov        qword ptr [rsp], 0x2e8
05057 e804655507                     call       0x7f6a976cea60
0505c e941dfffff                     jmp        0x7f6a901764a2
05061 49bac02e62846a7f0000           movabs     r10, 0x7f6a84622ec0
0506b 4c89542408                     mov        qword ptr [rsp + 8], r10
05070 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05078 e8e3645507                     call       0x7f6a976cea60
0507d e900e0ffff                     jmp        0x7f6a90176582
05082 49ba78f871846a7f0000           movabs     r10, 0x7f6a8471f878
0508c 4c89542408                     mov        qword ptr [rsp + 8], r10
05091 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05099 e8c2645507                     call       0x7f6a976cea60
0509e e95ee0ffff                     jmp        0x7f6a90176601
050a3 49baf09c09846a7f0000           movabs     r10, 0x7f6a84099cf0
050ad 4c89542408                     mov        qword ptr [rsp + 8], r10
050b2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050ba e8a1645507                     call       0x7f6a976cea60
050bf e9cfe0ffff                     jmp        0x7f6a90176693
050c4 49ba68d472846a7f0000           movabs     r10, 0x7f6a8472d468
050ce 4c89542408                     mov        qword ptr [rsp + 8], r10
050d3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050db e880645507                     call       0x7f6a976cea60
050e0 e970e1ffff                     jmp        0x7f6a90176755
050e5 49ba980e73846a7f0000           movabs     r10, 0x7f6a84730e98
050ef 4c89542408                     mov        qword ptr [rsp + 8], r10
050f4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050fc e85f645507                     call       0x7f6a976cea60
05101 e9b8e1ffff                     jmp        0x7f6a901767be
05106 49ba680d73846a7f0000           movabs     r10, 0x7f6a84730d68
05110 4c89542408                     mov        qword ptr [rsp + 8], r10
05115 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0511d e83e645507                     call       0x7f6a976cea60
05122 e9cae1ffff                     jmp        0x7f6a901767f1
05127 e8b4cf5507                     call       0x7f6a976d55e0
0512c 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05136 4883e4f0                       and        rsp, 0xfffffffffffffff0
0513a e8215fba1f                     call       0x7f6aafd1e560
0513f f4                             hlt        
05140 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05148 e813875507                     call       0x7f6a976d0d60
0514d 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05157 4883e4f0                       and        rsp, 0xfffffffffffffff0
0515b e8005fba1f                     call       0x7f6aafd1e560
05160 f4                             hlt        
05161 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05169 e8f2865507                     call       0x7f6a976d0d60
0516e 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05178 4883e4f0                       and        rsp, 0xfffffffffffffff0
0517c e8df5eba1f                     call       0x7f6aafd1e560
05181 f4                             hlt        
05182 49ba300462846a7f0000           movabs     r10, 0x7f6a84620430
0518c 4c89542408                     mov        qword ptr [rsp + 8], r10
05191 48c7042420030000               mov        qword ptr [rsp], 0x320
05199 e8c2635507                     call       0x7f6a976cea60
0519e e9b1e2ffff                     jmp        0x7f6a90176954
051a3 49ba98b974846a7f0000           movabs     r10, 0x7f6a8474b998
051ad 4c89542408                     mov        qword ptr [rsp + 8], r10
051b2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
051ba e8a1635507                     call       0x7f6a976cea60
051bf e971e3ffff                     jmp        0x7f6a90176a35
051c4 e817cf5507                     call       0x7f6a976d55e0
051c9 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
051d3 4883e4f0                       and        rsp, 0xfffffffffffffff0
051d7 e8845eba1f                     call       0x7f6aafd1e560
051dc f4                             hlt        
051dd 49baa04b6d846a7f0000           movabs     r10, 0x7f6a846d4ba0
051e7 4c89542408                     mov        qword ptr [rsp + 8], r10
051ec 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
051f4 e867635507                     call       0x7f6a976cea60
051f9 e9dee3ffff                     jmp        0x7f6a90176adc
051fe 49ba90a618846a7f0000           movabs     r10, 0x7f6a8418a690
05208 4c89542408                     mov        qword ptr [rsp + 8], r10
0520d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05215 e846635507                     call       0x7f6a976cea60
0521a e9f6e3ffff                     jmp        0x7f6a90176b15
0521f 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05227 e834865507                     call       0x7f6a976d0d60
0522c 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05236 4883e4f0                       and        rsp, 0xfffffffffffffff0
0523a e8215eba1f                     call       0x7f6aafd1e560
0523f f4                             hlt        
05240 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05248 e813865507                     call       0x7f6a976d0d60
0524d 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05257 4883e4f0                       and        rsp, 0xfffffffffffffff0
0525b e8005eba1f                     call       0x7f6aafd1e560
05260 f4                             hlt        
05261 49ba687c7d846a7f0000           movabs     r10, 0x7f6a847d7c68
0526b 4c89542408                     mov        qword ptr [rsp + 8], r10
05270 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05278 e8e3625507                     call       0x7f6a976cea60
0527d e959e4ffff                     jmp        0x7f6a90176bdb
05282 49ba90ee7d846a7f0000           movabs     r10, 0x7f6a847dee90
0528c 4c89542408                     mov        qword ptr [rsp + 8], r10
05291 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05299 e8c2625507                     call       0x7f6a976cea60
0529e e96be4ffff                     jmp        0x7f6a90176c0e
052a3 49bad8b068846a7f0000           movabs     r10, 0x7f6a8468b0d8
052ad 4c89542408                     mov        qword ptr [rsp + 8], r10
052b2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052ba e8a1625507                     call       0x7f6a976cea60
052bf e9a1e4ffff                     jmp        0x7f6a90176c65
052c4 49ba58d574846a7f0000           movabs     r10, 0x7f6a8474d558
052ce 4c89542408                     mov        qword ptr [rsp + 8], r10
052d3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052db e880625507                     call       0x7f6a976cea60
052e0 e9b6e4ffff                     jmp        0x7f6a90176c9b
052e5 49bad86e68846a7f0000           movabs     r10, 0x7f6a84686ed8
052ef 4c89542408                     mov        qword ptr [rsp + 8], r10
052f4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052fc e85f625507                     call       0x7f6a976cea60
05301 e9c8e4ffff                     jmp        0x7f6a90176cce
05306 49ba18f074846a7f0000           movabs     r10, 0x7f6a8474f018
05310 4c89542408                     mov        qword ptr [rsp + 8], r10
05315 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0531d e83e625507                     call       0x7f6a976cea60
05322 e9b5e5ffff                     jmp        0x7f6a90176ddc
05327 49ba10d44c846a7f0000           movabs     r10, 0x7f6a844cd410
05331 4c89542408                     mov        qword ptr [rsp + 8], r10
05336 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0533e e81d625507                     call       0x7f6a976cea60
05343 e9d5e5ffff                     jmp        0x7f6a90176e1d
05348 49baa0913f846a7f0000           movabs     r10, 0x7f6a843f91a0
05352 4c89542408                     mov        qword ptr [rsp + 8], r10
05357 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0535f e8fc615507                     call       0x7f6a976cea60
05364 e9e7e5ffff                     jmp        0x7f6a90176e50
05369 48890424                       mov        qword ptr [rsp], rax
0536d e8ee9f5507                     call       0x7f6a976d2860
05372 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
0537c 4883e4f0                       and        rsp, 0xfffffffffffffff0
05380 e8db5cba1f                     call       0x7f6aafd1e560
05385 f4                             hlt        
05386 e855cd5507                     call       0x7f6a976d55e0
0538b 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05395 4883e4f0                       and        rsp, 0xfffffffffffffff0
05399 e8c25cba1f                     call       0x7f6aafd1e560
0539e f4                             hlt        
0539f 49ba18c874846a7f0000           movabs     r10, 0x7f6a8474c818
053a9 4c89542408                     mov        qword ptr [rsp + 8], r10
053ae 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053b6 e8a5615507                     call       0x7f6a976cea60
053bb e93ee7ffff                     jmp        0x7f6a90176ffe
053c0 49baa04b6d846a7f0000           movabs     r10, 0x7f6a846d4ba0
053ca 4c89542408                     mov        qword ptr [rsp + 8], r10
053cf 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053d7 e884615507                     call       0x7f6a976cea60
053dc e9d6e7ffff                     jmp        0x7f6a901770b7
053e1 49ba90a618846a7f0000           movabs     r10, 0x7f6a8418a690
053eb 4c89542408                     mov        qword ptr [rsp + 8], r10
053f0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053f8 e863615507                     call       0x7f6a976cea60
053fd e9f9e7ffff                     jmp        0x7f6a901770fb
05402 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0540a e851845507                     call       0x7f6a976d0d60
0540f 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05419 4883e4f0                       and        rsp, 0xfffffffffffffff0
0541d e83e5cba1f                     call       0x7f6aafd1e560
05422 f4                             hlt        
05423 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0542b e830845507                     call       0x7f6a976d0d60
05430 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
0543a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0543e e81d5cba1f                     call       0x7f6aafd1e560
05443 f4                             hlt        
05444 e897cc5507                     call       0x7f6a976d55e0
05449 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05453 4883e4f0                       and        rsp, 0xfffffffffffffff0
05457 e8045cba1f                     call       0x7f6aafd1e560
0545c f4                             hlt        
0545d 49ba18f074846a7f0000           movabs     r10, 0x7f6a8474f018
05467 4c89542408                     mov        qword ptr [rsp + 8], r10
0546c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05474 e8e7605507                     call       0x7f6a976cea60
05479 e984e9ffff                     jmp        0x7f6a90177302
0547e 49ba10d44c846a7f0000           movabs     r10, 0x7f6a844cd410
05488 4c89542408                     mov        qword ptr [rsp + 8], r10
0548d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05495 e8c6605507                     call       0x7f6a976cea60
0549a e9b0e9ffff                     jmp        0x7f6a9017734f
0549f 49baa0913f846a7f0000           movabs     r10, 0x7f6a843f91a0
054a9 4c89542408                     mov        qword ptr [rsp + 8], r10
054ae 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
054b6 e8a5605507                     call       0x7f6a976cea60
054bb e9c7e9ffff                     jmp        0x7f6a90177387
054c0 49ba300462846a7f0000           movabs     r10, 0x7f6a84620430
054ca 4c89542408                     mov        qword ptr [rsp + 8], r10
054cf 48c704245a030000               mov        qword ptr [rsp], 0x35a
054d7 e884605507                     call       0x7f6a976cea60
054dc e97eeaffff                     jmp        0x7f6a9017745f
054e1 90                             nop        
054e2 90                             nop        
054e3 90                             nop        
054e4 90                             nop        
054e5 90                             nop        
054e6 90                             nop        
054e7 e874725b07                     call       0x7f6a9772fc60
054ec e985ecffff                     jmp        0x7f6a90177676
054f1 49ba977617906a7f0000           movabs     r10, 0x7f6a90177697
054fb 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
05502 e959995b07                     jmp        0x7f6a97732360
05507 48ba0000000000000000           movabs     rdx, 0
05511 b8000f050a                     mov        eax, 0xa050f00
05516 e845755507                     call       0x7f6a976cff60
0551b e9a8ecffff                     jmp        0x7f6a901776c8
05520 e8bbcb5507                     call       0x7f6a976d55e0
05525 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
0552f 4883e4f0                       and        rsp, 0xfffffffffffffff0
05533 e8285bba1f                     call       0x7f6aafd1e560
05538 f4                             hlt        
05539 488bd2                         mov        rdx, rdx
0553c e89fbb5507                     call       0x7f6a976d45e0
05541 e9d1ecffff                     jmp        0x7f6a90177717
05546 48ba0000000000000000           movabs     rdx, 0
05550 b8000f050a                     mov        eax, 0xa050f00
05555 e806675507                     call       0x7f6a976cf160
0555a e9b9ecffff                     jmp        0x7f6a90177718
0555f 48ba0000000000000000           movabs     rdx, 0
05569 b8000f050a                     mov        eax, 0xa050f00
0556e e8ed745507                     call       0x7f6a976cff60
05573 e938edffff                     jmp        0x7f6a901777b0
05578 e863cb5507                     call       0x7f6a976d55e0
0557d 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
05587 4883e4f0                       and        rsp, 0xfffffffffffffff0
0558b e8d05aba1f                     call       0x7f6aafd1e560
05590 f4                             hlt        
05591 488bd2                         mov        rdx, rdx
05594 e847bb5507                     call       0x7f6a976d45e0
05599 e961edffff                     jmp        0x7f6a901777ff
0559e 48ba0000000000000000           movabs     rdx, 0
055a8 b8000f050a                     mov        eax, 0xa050f00
055ad e8ae745507                     call       0x7f6a976cff60
055b2 e999edffff                     jmp        0x7f6a90177850
055b7 e824cb5507                     call       0x7f6a976d55e0
055bc 48bfde8f90ae6a7f0000           movabs     rdi, 0x7f6aae908fde
055c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
055ca e8915aba1f                     call       0x7f6aafd1e560
055cf f4                             hlt        
055d0 488bd2                         mov        rdx, rdx
055d3 e808bb5507                     call       0x7f6a976d45e0
055d8 e9c2edffff                     jmp        0x7f6a9017789f
055dd 498b8708060000                 mov        rax, qword ptr [r15 + 0x608]
055e4 49c7870806000000000000         mov        qword ptr [r15 + 0x608], 0
055ef 49c7871006000000000000         mov        qword ptr [r15 + 0x610], 0
055fa 4881c450020000                 add        rsp, 0x250
05601 5d                             pop        rbp
05602 e959da5507                     jmp        0x7f6a976d6560
05607 f4                             hlt        
