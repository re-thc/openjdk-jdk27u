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
0001a 0f8540935f07                   jne        0x7f431372ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ec50020000                 sub        rsp, 0x250
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 7405                           je         0x7f430c135a3f
0003a e8a1975e07                     call       0x7f431371f1e0
0003f 4889b42448010000               mov        qword ptr [rsp + 0x148], rsi
00047 4889942468010000               mov        qword ptr [rsp + 0x168], rdx
0004f 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
00056 4c89842428010000               mov        qword ptr [rsp + 0x128], r8
0005e 4c898c2420010000               mov        qword ptr [rsp + 0x120], r9
00066 89bc2430010000                 mov        dword ptr [rsp + 0x130], edi
0006d 48bb60a24300437f0000           movabs     rbx, 0x7f430043a260
00077 8b4378                         mov        eax, dword ptr [rbx + 0x78]
0007a 83c002                         add        eax, 2
0007d 894378                         mov        dword ptr [rbx + 0x78], eax
00080 25fe070000                     and        eax, 0x7fe
00085 85c0                           test       eax, eax
00087 0f8444460000                   je         0x7f430c13a0d1
0008d 48bb60a24300437f0000           movabs     rbx, 0x7f430043a260
00097 ff83b0000000                   inc        dword ptr [rbx + 0xb0]
0009d 8b9c2460020000                 mov        ebx, dword ptr [rsp + 0x260]
000a4 8b4640                         mov        eax, dword ptr [rsi + 0x40]
000a7 4c3b256aa98d20                 cmp        r12, qword ptr [rip + 0x208da96a]
000ae 0f8414000000                   je         0x7f430c135ac8
000b4 48bf3823ae2a437f0000           movabs     rdi, 0x7f432aae2338
000be 4883e4f0                       and        rsp, 0xfffffffffffffff0
000c2 e81991ca1f                     call       0x7f432bddebe0
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
00102 48b860a24300437f0000           movabs     rax, 0x7f430043a260
0010c b900010000                     mov        ecx, 0x100
00111 7f05                           jg         0x7f430c135b18
00113 b910010000                     mov        ecx, 0x110
00118 44899c2440010000               mov        dword ptr [rsp + 0x140], r11d
00120 4c8b1c08                       mov        r11, qword ptr [rax + rcx]
00124 4d8d5b01                       lea        r11, [r11 + 1]
00128 4c891c08                       mov        qword ptr [rax + rcx], r11
0012c 0f8fff440000                   jg         0x7f430c13a031
00132 4863db                         movsxd     rbx, ebx
00135 488b4e20                       mov        rcx, qword ptr [rsi + 0x20]
00139 482bcf                         sub        rcx, rdi
0013c 483bcb                         cmp        rcx, rbx
0013f 48b960a24300437f0000           movabs     rcx, 0x7f430043a260
00149 b830010000                     mov        eax, 0x130
0014e 7c05                           jl         0x7f430c135b55
00150 b820010000                     mov        eax, 0x120
00155 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
00159 4d8d5b01                       lea        r11, [r11 + 1]
0015d 4c891c01                       mov        qword ptr [rcx + rax], r11
00161 0f8cca440000                   jl         0x7f430c13a031
00167 48b960a24300437f0000           movabs     rcx, 0x7f430043a260
00171 ff8160010000                   inc        dword ptr [rcx + 0x160]
00177 b900000000                     mov        ecx, 0
0017c 498bc0                         mov        rax, r8
0017f 483bc1                         cmp        rax, rcx
00182 48b960a24300437f0000           movabs     rcx, 0x7f430043a260
0018c b870010000                     mov        eax, 0x170
00191 7505                           jne        0x7f430c135b98
00193 b880010000                     mov        eax, 0x180
00198 4c8b1c01                       mov        r11, qword ptr [rcx + rax]
0019c 4d8d5b01                       lea        r11, [r11 + 1]
001a0 4c891c01                       mov        qword ptr [rcx + rax], r11
001a4 0f8531000000                   jne        0x7f430c135bdb
001aa 4803df                         add        rbx, rdi
001ad 498bc9                         mov        rcx, r9
001b0 483bcb                         cmp        rcx, rbx
001b3 48b960a24300437f0000           movabs     rcx, 0x7f430043a260
001bd bfa0010000                     mov        edi, 0x1a0
001c2 7d05                           jge        0x7f430c135bc9
001c4 bf90010000                     mov        edi, 0x190
001c9 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
001cd 488d5b01                       lea        rbx, [rbx + 1]
001d1 48891c39                       mov        qword ptr [rcx + rdi], rbx
001d5 0f8d0a000000                   jge        0x7f430c135be5
001db bf00000000                     mov        edi, 0
001e0 e915000000                     jmp        0x7f430c135bfa
001e5 48b960a24300437f0000           movabs     rcx, 0x7f430043a260
001ef ff81b0010000                   inc        dword ptr [rcx + 0x1b0]
001f5 bf01000000                     mov        edi, 1
001fa 4d2bc6                         sub        r8, r14
001fd 4c89842480010000               mov        qword ptr [rsp + 0x180], r8
00205 48b960a24300437f0000           movabs     rcx, 0x7f430043a260
0020f 488381c801000001               add        qword ptr [rcx + 0x1c8], 1
00217 48b938c81400437f0000           movabs     rcx, 0x7f430014c838
00221 8b5978                         mov        ebx, dword ptr [rcx + 0x78]
00224 83c302                         add        ebx, 2
00227 895978                         mov        dword ptr [rcx + 0x78], ebx
0022a 81e3feff1f00                   and        ebx, 0x1ffffe
00230 85db                           test       ebx, ebx
00232 0f84ba440000                   je         0x7f430c13a0f2
00238 48b9ffffffffffffff7f           movabs     rcx, 0x7fffffffffffffff
00242 493bc9                         cmp        rcx, r9
00245 48b938c81400437f0000           movabs     rcx, 0x7f430014c838
0024f bbc0000000                     mov        ebx, 0xc0
00254 7d05                           jge        0x7f430c135c5b
00256 bbb0000000                     mov        ebx, 0xb0
0025b 488b0419                       mov        rax, qword ptr [rcx + rbx]
0025f 488d4001                       lea        rax, [rax + 1]
00263 48890419                       mov        qword ptr [rcx + rbx], rax
00267 0f8d0f000000                   jge        0x7f430c135c7c
0026d 49b9ffffffffffffff7f           movabs     r9, 0x7fffffffffffffff
00277 e910000000                     jmp        0x7f430c135c8c
0027c 48b938c81400437f0000           movabs     rcx, 0x7f430014c838
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
00312 48bf60a24300437f0000           movabs     rdi, 0x7f430043a260
0031c b8d8010000                     mov        eax, 0x1d8
00321 7d05                           jge        0x7f430c135d28
00323 b8e8010000                     mov        eax, 0x1e8
00328 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
0032c 4d8d5b01                       lea        r11, [r11 + 1]
00330 4c891c07                       mov        qword ptr [rdi + rax], r11
00334 0f8d0a400000                   jge        0x7f430c139d44
0033a 413b5004                       cmp        edx, dword ptr [r8 + 4]
0033e 0f831a440000                   jae        0x7f430c13a15e
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
00387 48b960a24300437f0000           movabs     rcx, 0x7f430043a260
00391 41b8f8010000                   mov        r8d, 0x1f8
00397 7d06                           jge        0x7f430c135d9f
00399 41b808020000                   mov        r8d, 0x208
0039f 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003a3 4d8d6d01                       lea        r13, [r13 + 1]
003a7 4e892c01                       mov        qword ptr [rcx + r8], r13
003ab 0f8d15000000                   jge        0x7f430c135dc6
003b1 413b5104                       cmp        edx, dword ptr [r9 + 4]
003b5 0f83f7430000                   jae        0x7f430c13a1b2
003bb 4863ca                         movsxd     rcx, edx
003be 418b4c8908                     mov        ecx, dword ptr [r9 + rcx*4 + 8]
003c3 488bc1                         mov        rax, rcx
003c6 85ff                           test       edi, edi
003c8 48b960a24300437f0000           movabs     rcx, 0x7f430043a260
003d2 41b818020000                   mov        r8d, 0x218
003d8 7406                           je         0x7f430c135de0
003da 41b828020000                   mov        r8d, 0x228
003e0 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
003e4 4d8d6d01                       lea        r13, [r13 + 1]
003e8 4e892c01                       mov        qword ptr [rcx + r8], r13
003ec 0f8431000000                   je         0x7f430c135e23
003f2 498bcb                         mov        rcx, r11
003f5 2bce                           sub        ecx, esi
003f7 3bf9                           cmp        edi, ecx
003f9 48b960a24300437f0000           movabs     rcx, 0x7f430043a260
00403 41b848020000                   mov        r8d, 0x248
00409 7f06                           jg         0x7f430c135e11
0040b 41b838020000                   mov        r8d, 0x238
00411 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00415 4d8d6d01                       lea        r13, [r13 + 1]
00419 4e892c01                       mov        qword ptr [rcx + r8], r13
0041d 0f8f6e410000                   jg         0x7f430c139f91
00423 83f803                         cmp        eax, 3
00426 48b960a24300437f0000           movabs     rcx, 0x7f430043a260
00430 41b868020000                   mov        r8d, 0x268
00436 7e06                           jle        0x7f430c135e3e
00438 41b878020000                   mov        r8d, 0x278
0043e 4e8b2c01                       mov        r13, qword ptr [rcx + r8]
00442 4d8d6d01                       lea        r13, [r13 + 1]
00446 4e892c01                       mov        qword ptr [rcx + r8], r13
0044a 0f8e59000000                   jle        0x7f430c135ea9
00450 83e803                         sub        eax, 3
00453 837b0401                       cmp        dword ptr [rbx + 4], 1
00457 0f86a9430000                   jbe        0x7f430c13a206
0045d 8b4b0c                         mov        ecx, dword ptr [rbx + 0xc]
00460 837b0402                       cmp        dword ptr [rbx + 4], 2
00464 0f86c2430000                   jbe        0x7f430c13a22c
0046a 894b10                         mov        dword ptr [rbx + 0x10], ecx
0046d 8b4b08                         mov        ecx, dword ptr [rbx + 8]
00470 894b0c                         mov        dword ptr [rbx + 0xc], ecx
00473 894308                         mov        dword ptr [rbx + 8], eax
00476 48b960a24300437f0000           movabs     rcx, 0x7f430043a260
00480 ff8188020000                   inc        dword ptr [rcx + 0x288]
00486 89942444010000                 mov        dword ptr [rsp + 0x144], edx
0048d 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
00494 4c8bb42488010000               mov        r14, qword ptr [rsp + 0x188]
0049c 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
004a4 e952000000                     jmp        0x7f430c135efb
004a9 89942444010000                 mov        dword ptr [rsp + 0x144], edx
004b0 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
004b7 49b860a24300437f0000           movabs     r8, 0x7f430043a260
004c1 498380a002000001               add        qword ptr [r8 + 0x2a0], 1
004c9 488bf3                         mov        rsi, rbx
004cc 488bd0                         mov        rdx, rax
004cf 488bcf                         mov        rcx, rdi
004d2 90                             nop        
004d3 90                             nop        
004d4 90                             nop        
004d5 90                             nop        
004d6 90                             nop        
004d7 e8849d5f07                     call       0x7f431372fc60
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
00510 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
0051a b9c0020000                     mov        ecx, 0x2c0
0051f 7d05                           jge        0x7f430c135f26
00521 b9b0020000                     mov        ecx, 0x2b0
00526 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0052a 4d8d4001                       lea        r8, [r8 + 1]
0052e 4c89040a                       mov        qword ptr [rdx + rcx], r8
00532 0f8d15000000                   jge        0x7f430c135f4d
00538 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00540 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00548 e9ad000000                     jmp        0x7f430c135ffa
0054d 448bac2470010000               mov        r13d, dword ptr [rsp + 0x170]
00555 4585ed                         test       r13d, r13d
00558 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
00562 b9d0020000                     mov        ecx, 0x2d0
00567 7505                           jne        0x7f430c135f6e
00569 b9e0020000                     mov        ecx, 0x2e0
0056e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
00572 4d8d4001                       lea        r8, [r8 + 1]
00576 4c89040a                       mov        qword ptr [rdx + rcx], r8
0057a 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
00582 0f8568000000                   jne        0x7f430c135ff0
00588 498bd3                         mov        rdx, r11
0058b 03d7                           add        edx, edi
0058d 2bd0                           sub        edx, eax
0058f 4863d2                         movsxd     rdx, edx
00592 493bd0                         cmp        rdx, r8
00595 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
0059f b9f0020000                     mov        ecx, 0x2f0
005a4 7c05                           jl         0x7f430c135fab
005a6 b900030000                     mov        ecx, 0x300
005ab 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
005af 4d8d4901                       lea        r9, [r9 + 1]
005b3 4c890c0a                       mov        qword ptr [rdx + rcx], r9
005b7 0f8c3d000000                   jl         0x7f430c135ffa
005bd 4c8b8c2450010000               mov        r9, qword ptr [rsp + 0x150]
005c5 4c3bcb                         cmp        r9, rbx
005c8 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
005d2 b920030000                     mov        ecx, 0x320
005d7 7c05                           jl         0x7f430c135fde
005d9 b910030000                     mov        ecx, 0x310
005de 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
005e2 4d8d4901                       lea        r9, [r9 + 1]
005e6 4c890c0a                       mov        qword ptr [rdx + rcx], r9
005ea 0f8c0a000000                   jl         0x7f430c135ffa
005f0 ba00000000                     mov        edx, 0
005f5 e915000000                     jmp        0x7f430c13600f
005fa 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
00604 ff8230030000                   inc        dword ptr [rdx + 0x330]
0060a ba01000000                     mov        edx, 1
0060f 48899c2498010000               mov        qword ptr [rsp + 0x198], rbx
00617 85c0                           test       eax, eax
00619 48b960a24300437f0000           movabs     rcx, 0x7f430043a260
00623 41b948030000                   mov        r9d, 0x348
00629 7e06                           jle        0x7f430c136031
0062b 41b958030000                   mov        r9d, 0x358
00631 4a8b1c09                       mov        rbx, qword ptr [rcx + r9]
00635 488d5b01                       lea        rbx, [rbx + 1]
00639 4a891c09                       mov        qword ptr [rcx + r9], rbx
0063d 0f8e573c0000                   jle        0x7f430c139c9a
00643 85d2                           test       edx, edx
00645 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
0064f b978030000                     mov        ecx, 0x378
00654 7505                           jne        0x7f430c13605b
00656 b968030000                     mov        ecx, 0x368
0065b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0065f 4d8d4901                       lea        r9, [r9 + 1]
00663 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00667 0f852d3c0000                   jne        0x7f430c139c9a
0066d 498bdb                         mov        rbx, r11
00670 03df                           add        ebx, edi
00672 899c24a0010000                 mov        dword ptr [rsp + 0x1a0], ebx
00679 488bf3                         mov        rsi, rbx
0067c 03b42478010000                 add        esi, dword ptr [rsp + 0x178]
00683 3bb42458010000                 cmp        esi, dword ptr [rsp + 0x158]
0068a 48be60a24300437f0000           movabs     rsi, 0x7f430043a260
00694 ba30040000                     mov        edx, 0x430
00699 7f05                           jg         0x7f430c1360a0
0069b ba40040000                     mov        edx, 0x440
006a0 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
006a4 488d4901                       lea        rcx, [rcx + 1]
006a8 48890c16                       mov        qword ptr [rsi + rdx], rcx
006ac 0f8f3f000000                   jg         0x7f430c1360f1
006b2 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
006b9 03f7                           add        esi, edi
006bb 89b424a4010000                 mov        dword ptr [rsp + 0x1a4], esi
006c2 3bb4245c010000                 cmp        esi, dword ptr [rsp + 0x15c]
006c9 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
006d3 b960040000                     mov        ecx, 0x460
006d8 7e05                           jle        0x7f430c1360df
006da b950040000                     mov        ecx, 0x450
006df 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
006e3 4d8d4901                       lea        r9, [r9 + 1]
006e7 4c890c0a                       mov        qword ptr [rdx + rcx], r9
006eb 0f8e76000000                   jle        0x7f430c136167
006f1 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
006f9 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
00701 48be60a24300437f0000           movabs     rsi, 0x7f430043a260
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
00747 e8149b5f07                     call       0x7f431372fc60
0074c 0f1f840044080001               nop        dword ptr [rax + rax + 0x1000844]
00754 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
0075b 03b4247c010000                 add        esi, dword ptr [rsp + 0x17c]
00762 e9b13a0000                     jmp        0x7f430c139c18
00767 4489ac2470010000               mov        dword ptr [rsp + 0x170], r13d
0076f 83ff10                         cmp        edi, 0x10
00772 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
0077c b970040000                     mov        ecx, 0x470
00781 7f05                           jg         0x7f430c136188
00783 b980040000                     mov        ecx, 0x480
00788 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0078c 4d8d4901                       lea        r9, [r9 + 1]
00790 4c890c0a                       mov        qword ptr [rdx + rcx], r9
00794 0f8f670c0000                   jg         0x7f430c136e01
0079a 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
007a4 4883829004000001               add        qword ptr [rdx + 0x490], 1
007ac 48ba90e91400437f0000           movabs     rdx, 0x7f430014e990
007b6 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
007b9 83c102                         add        ecx, 2
007bc 894a78                         mov        dword ptr [rdx + 0x78], ecx
007bf 81e1feff1f00                   and        ecx, 0x1ffffe
007c5 85c9                           test       ecx, ecx
007c7 0f8485400000                   je         0x7f430c13a252
007cd 48ba109471e200000000           movabs     rdx, 0xe2719410
007d7 48b990e91400437f0000           movabs     rcx, 0x7f430014e990
007e1 8b12                           mov        edx, dword ptr [rdx]
007e3 c1ea0d                         shr        edx, 0xd
007e6 48c1e20a                       shl        rdx, 0xa
007ea 41ba00000016                   mov        r10d, 0x16000000
007f0 4903d2                         add        rdx, r10
007f3 41ba17000000                   mov        r10d, 0x17
007f9 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
007fd 7436                           je         0x7f430c136235
007ff 4983c202                       add        r10, 2
00803 4983fa1b                       cmp        r10, 0x1b
00807 75f0                           jne        0x7f430c1361f9
00809 41ba17000000                   mov        r10d, 0x17
0080f 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
00814 7412                           je         0x7f430c136228
00816 4983c202                       add        r10, 2
0081a 4983fa1b                       cmp        r10, 0x1b
0081e 75ef                           jne        0x7f430c13620f
00820 41ba16000000                   mov        r10d, 0x16
00826 eb11                           jmp        0x7f430c136239
00828 50                             push       rax
00829 4833c0                         xor        rax, rax
0082c f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
00832 58                             pop        rax
00833 ebbe                           jmp        0x7f430c1361f3
00835 4983c201                       add        r10, 1
00839 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0083e 48ba90e91400437f0000           movabs     rdx, 0x7f430014e990
00848 488382e000000001               add        qword ptr [rdx + 0xe0], 1
00850 48ba40d51400437f0000           movabs     rdx, 0x7f430014d540
0085a 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0085d 83c102                         add        ecx, 2
00860 894a78                         mov        dword ptr [rdx + 0x78], ecx
00863 81e1feff1f00                   and        ecx, 0x1ffffe
00869 85c9                           test       ecx, ecx
0086b 0f8402400000                   je         0x7f430c13a273
00871 448bac2490010000               mov        r13d, dword ptr [rsp + 0x190]
00879 48ba40d51400437f0000           movabs     rdx, 0x7f430014d540
00883 4883821001000001               add        qword ptr [rdx + 0x110], 1
0088b 8b942464010000                 mov        edx, dword ptr [rsp + 0x164]
00892 83ea0f                         sub        edx, 0xf
00895 48b9d0cb1400437f0000           movabs     rcx, 0x7f430014cbd0
0089f 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
008a3 4183c102                       add        r9d, 2
008a7 44894978                       mov        dword ptr [rcx + 0x78], r9d
008ab 4181e1feff1f00                 and        r9d, 0x1ffffe
008b2 4585c9                         test       r9d, r9d
008b5 0f84d93f0000                   je         0x7f430c13a294
008bb 48b9d0cb1400437f0000           movabs     rcx, 0x7f430014cbd0
008c5 488381b000000001               add        qword ptr [rcx + 0xb0], 1
008cd 48b90000000000000000           movabs     rcx, 0
008d7 b900000000                     mov        ecx, 0
008dc 443be9                         cmp        r13d, ecx
008df 0f8cd03f0000                   jl         0x7f430c13a2b5
008e5 443bea                         cmp        r13d, edx
008e8 0f8de83f0000                   jge        0x7f430c13a2d6
008ee 498bd5                         mov        rdx, r13
008f1 89942494010000                 mov        dword ptr [rsp + 0x194], edx
008f8 48b9109471e200000000           movabs     rcx, 0xe2719410
00902 4c8bc9                         mov        r9, rcx
00905 49be90e91400437f0000           movabs     r14, 0x7f430014e990
0090f 458b09                         mov        r9d, dword ptr [r9]
00912 41c1e90d                       shr        r9d, 0xd
00916 49c1e10a                       shl        r9, 0xa
0091a 41ba00000016                   mov        r10d, 0x16000000
00920 4d03ca                         add        r9, r10
00923 41ba25000000                   mov        r10d, 0x25
00929 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
0092d 7436                           je         0x7f430c136365
0092f 4983c202                       add        r10, 2
00933 4983fa29                       cmp        r10, 0x29
00937 75f0                           jne        0x7f430c136329
00939 41ba25000000                   mov        r10d, 0x25
0093f 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
00944 7412                           je         0x7f430c136358
00946 4983c202                       add        r10, 2
0094a 4983fa29                       cmp        r10, 0x29
0094e 75ef                           jne        0x7f430c13633f
00950 41ba24000000                   mov        r10d, 0x24
00956 eb11                           jmp        0x7f430c136369
00958 50                             push       rax
00959 4833c0                         xor        rax, rax
0095c f04f0fb10cd6                   lock cmpxchg qword ptr [r14 + r10*8], r9
00962 58                             pop        rax
00963 ebbe                           jmp        0x7f430c136323
00965 4983c201                       add        r10, 1
00969 4b8304d601                     add        qword ptr [r14 + r10*8], 1
0096e 48bad8cc1400437f0000           movabs     rdx, 0x7f430014ccd8
00978 448b4a78                       mov        r9d, dword ptr [rdx + 0x78]
0097c 4183c102                       add        r9d, 2
00980 44894a78                       mov        dword ptr [rdx + 0x78], r9d
00984 4181e1feff1f00                 and        r9d, 0x1ffffe
0098b 4585c9                         test       r9d, r9d
0098e 0f84633f0000                   je         0x7f430c13a2f7
00994 48bad8cc1400437f0000           movabs     rdx, 0x7f430014ccd8
0099e 488382b000000001               add        qword ptr [rdx + 0xb0], 1
009a6 48ba08ce1400437f0000           movabs     rdx, 0x7f430014ce08
009b0 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
009b3 83c102                         add        ecx, 2
009b6 894a78                         mov        dword ptr [rdx + 0x78], ecx
009b9 81e1feff1f00                   and        ecx, 0x1ffffe
009bf 85c9                           test       ecx, ecx
009c1 0f84513f0000                   je         0x7f430c13a318
009c7 48ba08ce1400437f0000           movabs     rdx, 0x7f430014ce08
009d1 ff82c0000000                   inc        dword ptr [rdx + 0xc0]
009d7 8b942494010000                 mov        edx, dword ptr [rsp + 0x194]
009de 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
009e5 4489ac2490010000               mov        dword ptr [rsp + 0x190], r13d
009ed 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
009f5 488b9c2468010000               mov        rbx, qword ptr [rsp + 0x168]
009fd 48b9081472e200000000           movabs     rcx, 0xe2721408
00a07 4c8bc9                         mov        r9, rcx
00a0a 48b890e91400437f0000           movabs     rax, 0x7f430014e990
00a14 49b90098011700000000           movabs     r9, 0x17019800
00a1e 41ba2b000000                   mov        r10d, 0x2b
00a24 4e3b0cd0                       cmp        r9, qword ptr [rax + r10*8]
00a28 743c                           je         0x7f430c136466
00a2a 4983c202                       add        r10, 2
00a2e 4983fa2f                       cmp        r10, 0x2f
00a32 75f0                           jne        0x7f430c136424
00a34 41ba2b000000                   mov        r10d, 0x2b
00a3a 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
00a3f 7412                           je         0x7f430c136453
00a41 4983c202                       add        r10, 2
00a45 4983fa2f                       cmp        r10, 0x2f
00a49 75ef                           jne        0x7f430c13643a
00a4b 41ba2a000000                   mov        r10d, 0x2a
00a51 eb17                           jmp        0x7f430c13646a
00a53 53                             push       rbx
00a54 488bd8                         mov        rbx, rax
00a57 4833c0                         xor        rax, rax
00a5a f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
00a60 488bc3                         mov        rax, rbx
00a63 5b                             pop        rbx
00a64 ebb8                           jmp        0x7f430c13641e
00a66 4983c201                       add        r10, 1
00a6a 4a8304d001                     add        qword ptr [rax + r10*8], 1
00a6f 49b960eb1400437f0000           movabs     r9, 0x7f430014eb60
00a79 418b4178                       mov        eax, dword ptr [r9 + 0x78]
00a7d 83c002                         add        eax, 2
00a80 41894178                       mov        dword ptr [r9 + 0x78], eax
00a84 25feff1f00                     and        eax, 0x1ffffe
00a89 85c0                           test       eax, eax
00a8b 0f84a83e0000                   je         0x7f430c13a339
00a91 4c8bc9                         mov        r9, rcx
00a94 48b860eb1400437f0000           movabs     rax, 0x7f430014eb60
00a9e 488380b000000001               add        qword ptr [rax + 0xb0], 1
00aa6 49b948ec1400437f0000           movabs     r9, 0x7f430014ec48
00ab0 418b4178                       mov        eax, dword ptr [r9 + 0x78]
00ab4 83c002                         add        eax, 2
00ab7 41894178                       mov        dword ptr [r9 + 0x78], eax
00abb 25feff1f00                     and        eax, 0x1ffffe
00ac0 85c0                           test       eax, eax
00ac2 0f84923e0000                   je         0x7f430c13a35a
00ac8 49b948ec1400437f0000           movabs     r9, 0x7f430014ec48
00ad2 48b90098011700000000           movabs     rcx, 0x17019800
00adc 41ba17000000                   mov        r10d, 0x17
00ae2 4b3b0cd1                       cmp        rcx, qword ptr [r9 + r10*8]
00ae6 7436                           je         0x7f430c13651e
00ae8 4983c202                       add        r10, 2
00aec 4983fa1b                       cmp        r10, 0x1b
00af0 75f0                           jne        0x7f430c1364e2
00af2 41ba17000000                   mov        r10d, 0x17
00af8 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
00afd 7412                           je         0x7f430c136511
00aff 4983c202                       add        r10, 2
00b03 4983fa1b                       cmp        r10, 0x1b
00b07 75ef                           jne        0x7f430c1364f8
00b09 41ba16000000                   mov        r10d, 0x16
00b0f eb11                           jmp        0x7f430c136522
00b11 50                             push       rax
00b12 4833c0                         xor        rax, rax
00b15 f04b0fb10cd1                   lock cmpxchg qword ptr [r9 + r10*8], rcx
00b1b 58                             pop        rax
00b1c ebbe                           jmp        0x7f430c1364dc
00b1e 4983c201                       add        r10, 1
00b22 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00b27 48b9c0d61400437f0000           movabs     rcx, 0x7f430014d6c0
00b31 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
00b35 4183c102                       add        r9d, 2
00b39 44894978                       mov        dword ptr [rcx + 0x78], r9d
00b3d 4181e1feff1f00                 and        r9d, 0x1ffffe
00b44 4585c9                         test       r9d, r9d
00b47 0f842e3e0000                   je         0x7f430c13a37b
00b4d 48b9109471e200000000           movabs     rcx, 0xe2719410
00b57 4c8bc9                         mov        r9, rcx
00b5a 48b848ec1400437f0000           movabs     rax, 0x7f430014ec48
00b64 458b09                         mov        r9d, dword ptr [r9]
00b67 41c1e90d                       shr        r9d, 0xd
00b6b 49c1e10a                       shl        r9, 0xa
00b6f 41ba00000016                   mov        r10d, 0x16000000
00b75 4d03ca                         add        r9, r10
00b78 41ba1d000000                   mov        r10d, 0x1d
00b7e 4e3b0cd0                       cmp        r9, qword ptr [rax + r10*8]
00b82 743c                           je         0x7f430c1365c0
00b84 4983c202                       add        r10, 2
00b88 4983fa21                       cmp        r10, 0x21
00b8c 75f0                           jne        0x7f430c13657e
00b8e 41ba1d000000                   mov        r10d, 0x1d
00b94 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
00b99 7412                           je         0x7f430c1365ad
00b9b 4983c202                       add        r10, 2
00b9f 4983fa21                       cmp        r10, 0x21
00ba3 75ef                           jne        0x7f430c136594
00ba5 41ba1c000000                   mov        r10d, 0x1c
00bab eb17                           jmp        0x7f430c1365c4
00bad 53                             push       rbx
00bae 488bd8                         mov        rbx, rax
00bb1 4833c0                         xor        rax, rax
00bb4 f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
00bba 488bc3                         mov        rax, rbx
00bbd 5b                             pop        rbx
00bbe ebb8                           jmp        0x7f430c136578
00bc0 4983c201                       add        r10, 1
00bc4 4a8304d001                     add        qword ptr [rax + r10*8], 1
00bc9 49b948ec1400437f0000           movabs     r9, 0x7f430014ec48
00bd3 8b09                           mov        ecx, dword ptr [rcx]
00bd5 c1e90d                         shr        ecx, 0xd
00bd8 48c1e10a                       shl        rcx, 0xa
00bdc 41ba00000016                   mov        r10d, 0x16000000
00be2 4903ca                         add        rcx, r10
00be5 41ba23000000                   mov        r10d, 0x23
00beb 4b3b0cd1                       cmp        rcx, qword ptr [r9 + r10*8]
00bef 7436                           je         0x7f430c136627
00bf1 4983c202                       add        r10, 2
00bf5 4983fa27                       cmp        r10, 0x27
00bf9 75f0                           jne        0x7f430c1365eb
00bfb 41ba23000000                   mov        r10d, 0x23
00c01 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
00c06 7412                           je         0x7f430c13661a
00c08 4983c202                       add        r10, 2
00c0c 4983fa27                       cmp        r10, 0x27
00c10 75ef                           jne        0x7f430c136601
00c12 41ba22000000                   mov        r10d, 0x22
00c18 eb11                           jmp        0x7f430c13662b
00c1a 50                             push       rax
00c1b 4833c0                         xor        rax, rax
00c1e f04b0fb10cd1                   lock cmpxchg qword ptr [r9 + r10*8], rcx
00c24 58                             pop        rax
00c25 ebbe                           jmp        0x7f430c1365e5
00c27 4983c201                       add        r10, 1
00c2b 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00c30 48b948ec1400437f0000           movabs     rcx, 0x7f430014ec48
00c3a 4883814001000001               add        qword ptr [rcx + 0x140], 1
00c42 48b988d71400437f0000           movabs     rcx, 0x7f430014d788
00c4c 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
00c50 4183c102                       add        r9d, 2
00c54 44894978                       mov        dword ptr [rcx + 0x78], r9d
00c58 4181e1feff1f00                 and        r9d, 0x1ffffe
00c5f 4585c9                         test       r9d, r9d
00c62 0f84343d0000                   je         0x7f430c13a39c
00c68 48b948ec1400437f0000           movabs     rcx, 0x7f430014ec48
00c72 4883815001000001               add        qword ptr [rcx + 0x150], 1
00c7a 4863c2                         movsxd     rax, edx
00c7d ba08000000                     mov        edx, 8
00c82 4c8bc8                         mov        r9, rax
00c85 4c03ca                         add        r9, rdx
00c88 48ba80b91400437f0000           movabs     rdx, 0x7f430014b980
00c92 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
00c95 83c102                         add        ecx, 2
00c98 894a78                         mov        dword ptr [rdx + 0x78], ecx
00c9b 81e1feff1f00                   and        ecx, 0x1ffffe
00ca1 85c9                           test       ecx, ecx
00ca3 0f84143d0000                   je         0x7f430c13a3bd
00ca9 48ba80b91400437f0000           movabs     rdx, 0x7f430014b980
00cb3 488382e000000001               add        qword ptr [rdx + 0xe0], 1
00cbb 48ba00bb1400437f0000           movabs     rdx, 0x7f430014bb00
00cc5 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
00cc8 83c102                         add        ecx, 2
00ccb 894a78                         mov        dword ptr [rdx + 0x78], ecx
00cce 81e1feff1f00                   and        ecx, 0x1ffffe
00cd4 85c9                           test       ecx, ecx
00cd6 0f84023d0000                   je         0x7f430c13a3de
00cdc 48ba48ec1400437f0000           movabs     rdx, 0x7f430014ec48
00ce6 488d9260010000                 lea        rdx, [rdx + 0x160]
00ced 48b9d86c72e200000000           movabs     rcx, 0xe2726cd8
00cf7 4885c9                         test       rcx, rcx
00cfa 0f8514000000                   jne        0x7f430c136714
00d00 48bf75489a2a437f0000           movabs     rdi, 0x7f432a9a4875
00d0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d0e e8cd84ca1f                     call       0x7f432bddebe0
00d13 f4                             hlt        
00d14 8b09                           mov        ecx, dword ptr [rcx]
00d16 c1e90d                         shr        ecx, 0xd
00d19 48c1e10a                       shl        rcx, 0xa
00d1d 41ba00000016                   mov        r10d, 0x16000000
00d23 4903ca                         add        rcx, r10
00d26 51                             push       rcx
00d27 48b900f0011700000000           movabs     rcx, 0x1701f000
00d31 483b0c24                       cmp        rcx, qword ptr [rsp]
00d35 0f8414000000                   je         0x7f430c13674f
00d3b 48bf8843a22a437f0000           movabs     rdi, 0x7f432aa24388
00d45 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d49 e89284ca1f                     call       0x7f432bddebe0
00d4e f4                             hlt        
00d4f 59                             pop        rcx
00d50 48b900f0011700000000           movabs     rcx, 0x1701f000
00d5a 4c8bd1                         mov        r10, rcx
00d5d 48330a                         xor        rcx, qword ptr [rdx]
00d60 48f7c1fcffffff                 test       rcx, -4
00d67 742a                           je         0x7f430c136793
00d69 f6c102                         test       cl, 2
00d6c 7525                           jne        0x7f430c136793
00d6e 48f702feffffff                 test       qword ptr [rdx], -2
00d75 7415                           je         0x7f430c13678c
00d77 498bca                         mov        rcx, r10
00d7a 48330a                         xor        rcx, qword ptr [rdx]
00d7d 48f7c1fcffffff                 test       rcx, -4
00d84 740d                           je         0x7f430c136793
00d86 48830a02                       or         qword ptr [rdx], 2
00d8a eb07                           jmp        0x7f430c136793
00d8c 48890a                         mov        qword ptr [rdx], rcx
00d8f 4883e1fc                       and        rcx, 0xfffffffffffffffc
00d93 48ba48ec1400437f0000           movabs     rdx, 0x7f430014ec48
00d9d 4883827001000001               add        qword ptr [rdx + 0x170], 1
00da5 48be589471e200000000           movabs     rsi, 0xe2719458
00daf ba02000000                     mov        edx, 2
00db4 b910000000                     mov        ecx, 0x10
00db9 4c8bc3                         mov        r8, rbx
00dbc bf00000000                     mov        edi, 0
00dc1 48891c24                       mov        qword ptr [rsp], rbx
00dc5 4889442408                     mov        qword ptr [rsp + 8], rax
00dca 49ba109471e200000000           movabs     r10, 0xe2719410
00dd4 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00dd9 49bad86c72e200000000           movabs     r10, 0xe2726cd8
00de3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00de8 90                             nop        
00de9 90                             nop        
00dea 90                             nop        
00deb 90                             nop        
00dec 90                             nop        
00ded 90                             nop        
00dee 90                             nop        
00def e86c945f07                     call       0x7f431372fc60
00df4 0f1f8400ec0e0002               nop        dword ptr [rax + rax + 0x2000eec]
00dfc 4885c0                         test       rax, rax
00dff 48bb48ec1400437f0000           movabs     rbx, 0x7f430014ec48
00e09 750c                           jne        0x7f430c136817
00e0b 808b7901000001                 or         byte ptr [rbx + 0x179], 1
00e12 e988000000                     jmp        0x7f430c13689f
00e17 8b38                           mov        edi, dword ptr [rax]
00e19 c1ef0d                         shr        edi, 0xd
00e1c 48c1e70a                       shl        rdi, 0xa
00e20 41ba00000016                   mov        r10d, 0x16000000
00e26 4903fa                         add        rdi, r10
00e29 41ba31000000                   mov        r10d, 0x31
00e2f 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
00e33 7436                           je         0x7f430c13686b
00e35 4983c202                       add        r10, 2
00e39 4983fa35                       cmp        r10, 0x35
00e3d 75f0                           jne        0x7f430c13682f
00e3f 41ba31000000                   mov        r10d, 0x31
00e45 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00e4a 7412                           je         0x7f430c13685e
00e4c 4983c202                       add        r10, 2
00e50 4983fa35                       cmp        r10, 0x35
00e54 75ef                           jne        0x7f430c136845
00e56 41ba30000000                   mov        r10d, 0x30
00e5c eb11                           jmp        0x7f430c13686f
00e5e 50                             push       rax
00e5f 4833c0                         xor        rax, rax
00e62 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
00e68 58                             pop        rax
00e69 ebbe                           jmp        0x7f430c136829
00e6b 4983c201                       add        r10, 1
00e6f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00e74 48bf0080001700000000           movabs     rdi, 0x17008000
00e7e 8b18                           mov        ebx, dword ptr [rax]
00e80 c1eb0d                         shr        ebx, 0xd
00e83 48c1e30a                       shl        rbx, 0xa
00e87 41ba00000016                   mov        r10d, 0x16000000
00e8d 4903da                         add        rbx, r10
00e90 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
00e94 0f85653b0000                   jne        0x7f430c13a3ff
00e9a e900000000                     jmp        0x7f430c13689f
00e9f 488bf8                         mov        rdi, rax
00ea2 4889bc24b0010000               mov        qword ptr [rsp + 0x1b0], rdi
00eaa 483b07                         cmp        rax, qword ptr [rdi]
00ead 488bf7                         mov        rsi, rdi
00eb0 48bb60a24300437f0000           movabs     rbx, 0x7f430043a260
00eba 8b36                           mov        esi, dword ptr [rsi]
00ebc c1ee0d                         shr        esi, 0xd
00ebf 48c1e60a                       shl        rsi, 0xa
00ec3 41ba00000016                   mov        r10d, 0x16000000
00ec9 4903f2                         add        rsi, r10
00ecc 41ba95000000                   mov        r10d, 0x95
00ed2 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00ed6 743c                           je         0x7f430c136914
00ed8 4983c202                       add        r10, 2
00edc 4981fa99000000                 cmp        r10, 0x99
00ee3 75ed                           jne        0x7f430c1368d2
00ee5 41ba95000000                   mov        r10d, 0x95
00eeb 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00ef0 7415                           je         0x7f430c136907
00ef2 4983c202                       add        r10, 2
00ef6 4981fa99000000                 cmp        r10, 0x99
00efd 75ec                           jne        0x7f430c1368eb
00eff 41ba94000000                   mov        r10d, 0x94
00f05 eb11                           jmp        0x7f430c136918
00f07 50                             push       rax
00f08 4833c0                         xor        rax, rax
00f0b f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00f11 58                             pop        rax
00f12 ebb8                           jmp        0x7f430c1368cc
00f14 4983c201                       add        r10, 1
00f18 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00f1d 48be20f01400437f0000           movabs     rsi, 0x7f430014f020
00f27 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
00f2a 83c302                         add        ebx, 2
00f2d 895e78                         mov        dword ptr [rsi + 0x78], ebx
00f30 81e3feff1f00                   and        ebx, 0x1ffffe
00f36 85db                           test       ebx, ebx
00f38 0f84f73a0000                   je         0x7f430c13a435
00f3e 488bf7                         mov        rsi, rdi
00f41 48bb20f01400437f0000           movabs     rbx, 0x7f430014f020
00f4b 8b36                           mov        esi, dword ptr [rsi]
00f4d c1ee0d                         shr        esi, 0xd
00f50 48c1e60a                       shl        rsi, 0xa
00f54 41ba00000016                   mov        r10d, 0x16000000
00f5a 4903f2                         add        rsi, r10
00f5d 41ba17000000                   mov        r10d, 0x17
00f63 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00f67 7436                           je         0x7f430c13699f
00f69 4983c202                       add        r10, 2
00f6d 4983fa1b                       cmp        r10, 0x1b
00f71 75f0                           jne        0x7f430c136963
00f73 41ba17000000                   mov        r10d, 0x17
00f79 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00f7e 7412                           je         0x7f430c136992
00f80 4983c202                       add        r10, 2
00f84 4983fa1b                       cmp        r10, 0x1b
00f88 75ef                           jne        0x7f430c136979
00f8a 41ba16000000                   mov        r10d, 0x16
00f90 eb11                           jmp        0x7f430c1369a3
00f92 50                             push       rax
00f93 4833c0                         xor        rax, rax
00f96 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00f9c 58                             pop        rax
00f9d ebbe                           jmp        0x7f430c13695d
00f9f 4983c201                       add        r10, 1
00fa3 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00fa8 488bf7                         mov        rsi, rdi
00fab 90                             nop        
00fac 90                             nop        
00fad 48b850fb45e0427f0000           movabs     rax, 0x7f42e045fb50
00fb7 e8a48d5f07                     call       0x7f431372f760
00fbc 0f1f8400b4100003               nop        dword ptr [rax + rax + 0x30010b4]
00fc4 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
00fcc 8b7704                         mov        esi, dword ptr [rdi + 4]
00fcf 48bb20f01400437f0000           movabs     rbx, 0x7f430014f020
00fd9 488383e000000001               add        qword ptr [rbx + 0xe0], 1
00fe1 48bb40d51400437f0000           movabs     rbx, 0x7f430014d540
00feb 8b5378                         mov        edx, dword ptr [rbx + 0x78]
00fee 83c202                         add        edx, 2
00ff1 895378                         mov        dword ptr [rbx + 0x78], edx
00ff4 81e2feff1f00                   and        edx, 0x1ffffe
00ffa 85d2                           test       edx, edx
00ffc 0f846d3a0000                   je         0x7f430c13a46f
01002 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
0100a 48bb40d51400437f0000           movabs     rbx, 0x7f430014d540
01014 4883831001000001               add        qword ptr [rbx + 0x110], 1
0101c ffc8                           dec        eax
0101e 2bf0                           sub        esi, eax
01020 48bbd0cb1400437f0000           movabs     rbx, 0x7f430014cbd0
0102a 8b4378                         mov        eax, dword ptr [rbx + 0x78]
0102d 83c002                         add        eax, 2
01030 894378                         mov        dword ptr [rbx + 0x78], eax
01033 25feff1f00                     and        eax, 0x1ffffe
01038 85c0                           test       eax, eax
0103a 0f84503a0000                   je         0x7f430c13a490
01040 48bbd0cb1400437f0000           movabs     rbx, 0x7f430014cbd0
0104a 488383b000000001               add        qword ptr [rbx + 0xb0], 1
01052 48bb0000000000000000           movabs     rbx, 0
0105c bb00000000                     mov        ebx, 0
01061 443bdb                         cmp        r11d, ebx
01064 0f8c473a0000                   jl         0x7f430c13a4b1
0106a 443bde                         cmp        r11d, esi
0106d 0f8d5f3a0000                   jge        0x7f430c13a4d2
01073 498bdb                         mov        rbx, r11
01076 899c24ac010000                 mov        dword ptr [rsp + 0x1ac], ebx
0107d 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
01085 488bbc24b0010000               mov        rdi, qword ptr [rsp + 0x1b0]
0108d 488bf7                         mov        rsi, rdi
01090 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
0109a 8b36                           mov        esi, dword ptr [rsi]
0109c c1ee0d                         shr        esi, 0xd
0109f 48c1e60a                       shl        rsi, 0xa
010a3 41ba00000016                   mov        r10d, 0x16000000
010a9 4903f2                         add        rsi, r10
010ac 41ba1f000000                   mov        r10d, 0x1f
010b2 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
010b6 7436                           je         0x7f430c136aee
010b8 4983c202                       add        r10, 2
010bc 4983fa23                       cmp        r10, 0x23
010c0 75f0                           jne        0x7f430c136ab2
010c2 41ba1f000000                   mov        r10d, 0x1f
010c8 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
010cd 7412                           je         0x7f430c136ae1
010cf 4983c202                       add        r10, 2
010d3 4983fa23                       cmp        r10, 0x23
010d7 75ef                           jne        0x7f430c136ac8
010d9 41ba1e000000                   mov        r10d, 0x1e
010df eb11                           jmp        0x7f430c136af2
010e1 50                             push       rax
010e2 4833c0                         xor        rax, rax
010e5 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
010eb 58                             pop        rax
010ec ebbe                           jmp        0x7f430c136aac
010ee 4983c201                       add        r10, 1
010f2 4a8304d201                     add        qword ptr [rdx + r10*8], 1
010f7 488bf7                         mov        rsi, rdi
010fa 90                             nop        
010fb 90                             nop        
010fc 90                             nop        
010fd 48b878fb45e0427f0000           movabs     rax, 0x7f42e045fb78
01107 e8548c5f07                     call       0x7f431372f760
0110c 0f1f840004120004               nop        dword ptr [rax + rax + 0x4001204]
01114 483b00                         cmp        rax, qword ptr [rax]
01117 488bf0                         mov        rsi, rax
0111a 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
01124 8b36                           mov        esi, dword ptr [rsi]
01126 c1ee0d                         shr        esi, 0xd
01129 48c1e60a                       shl        rsi, 0xa
0112d 41ba00000016                   mov        r10d, 0x16000000
01133 4903f2                         add        rsi, r10
01136 41ba25000000                   mov        r10d, 0x25
0113c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01140 7436                           je         0x7f430c136b78
01142 4983c202                       add        r10, 2
01146 4983fa29                       cmp        r10, 0x29
0114a 75f0                           jne        0x7f430c136b3c
0114c 41ba25000000                   mov        r10d, 0x25
01152 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01157 7412                           je         0x7f430c136b6b
01159 4983c202                       add        r10, 2
0115d 4983fa29                       cmp        r10, 0x29
01161 75ef                           jne        0x7f430c136b52
01163 41ba24000000                   mov        r10d, 0x24
01169 eb11                           jmp        0x7f430c136b7c
0116b 50                             push       rax
0116c 4833c0                         xor        rax, rax
0116f f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01175 58                             pop        rax
01176 ebbe                           jmp        0x7f430c136b36
01178 4983c201                       add        r10, 1
0117c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01181 8b7024                         mov        esi, dword ptr [rax + 0x24]
01184 4c3b258d988d20                 cmp        r12, qword ptr [rip + 0x208d988d]
0118b 0f8414000000                   je         0x7f430c136ba5
01191 48bf3823ae2a437f0000           movabs     rdi, 0x7f432aae2338
0119b 4883e4f0                       and        rsp, 0xfffffffffffffff0
0119f e83c80ca1f                     call       0x7f432bddebe0
011a4 f4                             hlt        
011a5 488bd0                         mov        rdx, rax
011a8 48b920f01400437f0000           movabs     rcx, 0x7f430014f020
011b2 8b12                           mov        edx, dword ptr [rdx]
011b4 c1ea0d                         shr        edx, 0xd
011b7 48c1e20a                       shl        rdx, 0xa
011bb 41ba00000016                   mov        r10d, 0x16000000
011c1 4903d2                         add        rdx, r10
011c4 41ba2b000000                   mov        r10d, 0x2b
011ca 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
011ce 7436                           je         0x7f430c136c06
011d0 4983c202                       add        r10, 2
011d4 4983fa2f                       cmp        r10, 0x2f
011d8 75f0                           jne        0x7f430c136bca
011da 41ba2b000000                   mov        r10d, 0x2b
011e0 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
011e5 7412                           je         0x7f430c136bf9
011e7 4983c202                       add        r10, 2
011eb 4983fa2f                       cmp        r10, 0x2f
011ef 75ef                           jne        0x7f430c136be0
011f1 41ba2a000000                   mov        r10d, 0x2a
011f7 eb11                           jmp        0x7f430c136c0a
011f9 50                             push       rax
011fa 4833c0                         xor        rax, rax
011fd f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
01203 58                             pop        rax
01204 ebbe                           jmp        0x7f430c136bc4
01206 4983c201                       add        r10, 1
0120a 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0120f 8b4804                         mov        ecx, dword ptr [rax + 4]
01212 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
0121c 4883828001000001               add        qword ptr [rdx + 0x180], 1
01224 48ba88d71400437f0000           movabs     rdx, 0x7f430014d788
0122e 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01232 4183c002                       add        r8d, 2
01236 44894278                       mov        dword ptr [rdx + 0x78], r8d
0123a 4181e0feff1f00                 and        r8d, 0x1ffffe
01241 4585c0                         test       r8d, r8d
01244 0f84c2380000                   je         0x7f430c13a50c
0124a 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
01254 4883829001000001               add        qword ptr [rdx + 0x190], 1
0125c 8b9c24ac010000                 mov        ebx, dword ptr [rsp + 0x1ac]
01263 4863db                         movsxd     rbx, ebx
01266 ba08000000                     mov        edx, 8
0126b 4c8bcb                         mov        r9, rbx
0126e 4c03ca                         add        r9, rdx
01271 48ba80b91400437f0000           movabs     rdx, 0x7f430014b980
0127b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
0127f 4183c002                       add        r8d, 2
01283 44894278                       mov        dword ptr [rdx + 0x78], r8d
01287 4181e0feff1f00                 and        r8d, 0x1ffffe
0128e 4585c0                         test       r8d, r8d
01291 0f8496380000                   je         0x7f430c13a52d
01297 48ba80b91400437f0000           movabs     rdx, 0x7f430014b980
012a1 488382e000000001               add        qword ptr [rdx + 0xe0], 1
012a9 48ba00bb1400437f0000           movabs     rdx, 0x7f430014bb00
012b3 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
012b7 4183c002                       add        r8d, 2
012bb 44894278                       mov        dword ptr [rdx + 0x78], r8d
012bf 4181e0feff1f00                 and        r8d, 0x1ffffe
012c6 4585c0                         test       r8d, r8d
012c9 0f847f380000                   je         0x7f430c13a54e
012cf 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
012d9 488d92a0010000                 lea        rdx, [rdx + 0x1a0]
012e0 49b8c00a73e200000000           movabs     r8, 0xe2730ac0
012ea 4d85c0                         test       r8, r8
012ed 0f8514000000                   jne        0x7f430c136d07
012f3 48bf75489a2a437f0000           movabs     rdi, 0x7f432a9a4875
012fd 4883e4f0                       and        rsp, 0xfffffffffffffff0
01301 e8da7eca1f                     call       0x7f432bddebe0
01306 f4                             hlt        
01307 458b00                         mov        r8d, dword ptr [r8]
0130a 41c1e80d                       shr        r8d, 0xd
0130e 49c1e00a                       shl        r8, 0xa
01312 41ba00000016                   mov        r10d, 0x16000000
01318 4d03c2                         add        r8, r10
0131b 4150                           push       r8
0131d 49b80000021700000000           movabs     r8, 0x17020000
01327 4c3b0424                       cmp        r8, qword ptr [rsp]
0132b 0f8414000000                   je         0x7f430c136d45
01331 48bf8843a22a437f0000           movabs     rdi, 0x7f432aa24388
0133b 4883e4f0                       and        rsp, 0xfffffffffffffff0
0133f e89c7eca1f                     call       0x7f432bddebe0
01344 f4                             hlt        
01345 4158                           pop        r8
01347 49b80000021700000000           movabs     r8, 0x17020000
01351 4d8bd0                         mov        r10, r8
01354 4c3302                         xor        r8, qword ptr [rdx]
01357 49f7c0fcffffff                 test       r8, -4
0135e 742b                           je         0x7f430c136d8b
01360 41f6c002                       test       r8b, 2
01364 7525                           jne        0x7f430c136d8b
01366 48f702feffffff                 test       qword ptr [rdx], -2
0136d 7415                           je         0x7f430c136d84
0136f 4d8bc2                         mov        r8, r10
01372 4c3302                         xor        r8, qword ptr [rdx]
01375 49f7c0fcffffff                 test       r8, -4
0137c 740d                           je         0x7f430c136d8b
0137e 48830a02                       or         qword ptr [rdx], 2
01382 eb07                           jmp        0x7f430c136d8b
01384 4c8902                         mov        qword ptr [rdx], r8
01387 4983e0fc                       and        r8, 0xfffffffffffffffc
0138b 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
01395 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
0139d ba02000000                     mov        edx, 2
013a2 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
013aa bf00000000                     mov        edi, 0
013af 488b8424b0010000               mov        rax, qword ptr [rsp + 0x1b0]
013b7 48890424                       mov        qword ptr [rsp], rax
013bb 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
013c3 4889442408                     mov        qword ptr [rsp + 8], rax
013c8 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
013cd 49bac00a73e200000000           movabs     r10, 0xe2730ac0
013d7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
013dc 90                             nop        
013dd 90                             nop        
013de 90                             nop        
013df e87c8e5f07                     call       0x7f431372fc60
013e4 0f1f8400dc140005               nop        dword ptr [rax + rax + 0x50014dc]
013ec 48be60a24300437f0000           movabs     rsi, 0x7f430043a260
013f6 ff86d0040000                   inc        dword ptr [rsi + 0x4d0]
013fc e9400e0000                     jmp        0x7f430c137c41
01401 898424a8010000                 mov        dword ptr [rsp + 0x1a8], eax
01408 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
01410 83ff30                         cmp        edi, 0x30
01413 48be60a24300437f0000           movabs     rsi, 0x7f430043a260
0141d bae8040000                     mov        edx, 0x4e8
01422 7f05                           jg         0x7f430c136e29
01424 baf8040000                     mov        edx, 0x4f8
01429 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0142d 488d4901                       lea        rcx, [rcx + 1]
01431 48890c16                       mov        qword ptr [rsi + rdx], rcx
01435 0f8f160d0000                   jg         0x7f430c137b51
0143b 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
01442 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
0144a 90                             nop        
0144b 90                             nop        
0144c 90                             nop        
0144d 90                             nop        
0144e 90                             nop        
0144f 90                             nop        
01450 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
01458 8b842464010000                 mov        eax, dword ptr [rsp + 0x164]
0145f 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
01467 48b960a24300437f0000           movabs     rcx, 0x7f430043a260
01471 4883810805000001               add        qword ptr [rcx + 0x508], 1
01479 48b990e91400437f0000           movabs     rcx, 0x7f430014e990
01483 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
01487 4183c002                       add        r8d, 2
0148b 44894178                       mov        dword ptr [rcx + 0x78], r8d
0148f 4181e0feff1f00                 and        r8d, 0x1ffffe
01496 4585c0                         test       r8d, r8d
01499 0f84d0360000                   je         0x7f430c13a56f
0149f 48b9109471e200000000           movabs     rcx, 0xe2719410
014a9 49b890e91400437f0000           movabs     r8, 0x7f430014e990
014b3 8b09                           mov        ecx, dword ptr [rcx]
014b5 c1e90d                         shr        ecx, 0xd
014b8 48c1e10a                       shl        rcx, 0xa
014bc 41ba00000016                   mov        r10d, 0x16000000
014c2 4903ca                         add        rcx, r10
014c5 41ba17000000                   mov        r10d, 0x17
014cb 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
014cf 7436                           je         0x7f430c136f07
014d1 4983c202                       add        r10, 2
014d5 4983fa1b                       cmp        r10, 0x1b
014d9 75f0                           jne        0x7f430c136ecb
014db 41ba17000000                   mov        r10d, 0x17
014e1 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
014e6 7412                           je         0x7f430c136efa
014e8 4983c202                       add        r10, 2
014ec 4983fa1b                       cmp        r10, 0x1b
014f0 75ef                           jne        0x7f430c136ee1
014f2 41ba16000000                   mov        r10d, 0x16
014f8 eb11                           jmp        0x7f430c136f0b
014fa 50                             push       rax
014fb 4833c0                         xor        rax, rax
014fe f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
01504 58                             pop        rax
01505 ebbe                           jmp        0x7f430c136ec5
01507 4983c201                       add        r10, 1
0150b 4b8304d001                     add        qword ptr [r8 + r10*8], 1
01510 48b990e91400437f0000           movabs     rcx, 0x7f430014e990
0151a 488381e000000001               add        qword ptr [rcx + 0xe0], 1
01522 48b940d51400437f0000           movabs     rcx, 0x7f430014d540
0152c 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
01530 4183c002                       add        r8d, 2
01534 44894178                       mov        dword ptr [rcx + 0x78], r8d
01538 4181e0feff1f00                 and        r8d, 0x1ffffe
0153f 4585c0                         test       r8d, r8d
01542 0f8448360000                   je         0x7f430c13a590
01548 48b940d51400437f0000           movabs     rcx, 0x7f430014d540
01552 4883811001000001               add        qword ptr [rcx + 0x110], 1
0155a 488bc8                         mov        rcx, rax
0155d 83e90f                         sub        ecx, 0xf
01560 49b8d0cb1400437f0000           movabs     r8, 0x7f430014cbd0
0156a 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
0156e 4183c102                       add        r9d, 2
01572 45894878                       mov        dword ptr [r8 + 0x78], r9d
01576 4181e1feff1f00                 and        r9d, 0x1ffffe
0157d 4585c9                         test       r9d, r9d
01580 0f842b360000                   je         0x7f430c13a5b1
01586 49b8d0cb1400437f0000           movabs     r8, 0x7f430014cbd0
01590 498380b000000001               add        qword ptr [r8 + 0xb0], 1
01598 49b80000000000000000           movabs     r8, 0
015a2 41b800000000                   mov        r8d, 0
015a8 413bf0                         cmp        esi, r8d
015ab 0f8c21360000                   jl         0x7f430c13a5d2
015b1 3bf1                           cmp        esi, ecx
015b3 0f8d3a360000                   jge        0x7f430c13a5f3
015b9 488bce                         mov        rcx, rsi
015bc 898c24b8010000                 mov        dword ptr [rsp + 0x1b8], ecx
015c3 49b8109471e200000000           movabs     r8, 0xe2719410
015cd 4d8bc8                         mov        r9, r8
015d0 49be90e91400437f0000           movabs     r14, 0x7f430014e990
015da 458b09                         mov        r9d, dword ptr [r9]
015dd 41c1e90d                       shr        r9d, 0xd
015e1 49c1e10a                       shl        r9, 0xa
015e5 41ba00000016                   mov        r10d, 0x16000000
015eb 4d03ca                         add        r9, r10
015ee 41ba25000000                   mov        r10d, 0x25
015f4 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
015f8 7436                           je         0x7f430c137030
015fa 4983c202                       add        r10, 2
015fe 4983fa29                       cmp        r10, 0x29
01602 75f0                           jne        0x7f430c136ff4
01604 41ba25000000                   mov        r10d, 0x25
0160a 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
0160f 7412                           je         0x7f430c137023
01611 4983c202                       add        r10, 2
01615 4983fa29                       cmp        r10, 0x29
01619 75ef                           jne        0x7f430c13700a
0161b 41ba24000000                   mov        r10d, 0x24
01621 eb11                           jmp        0x7f430c137034
01623 50                             push       rax
01624 4833c0                         xor        rax, rax
01627 f04f0fb10cd6                   lock cmpxchg qword ptr [r14 + r10*8], r9
0162d 58                             pop        rax
0162e ebbe                           jmp        0x7f430c136fee
01630 4983c201                       add        r10, 1
01634 4b8304d601                     add        qword ptr [r14 + r10*8], 1
01639 48b9d8cc1400437f0000           movabs     rcx, 0x7f430014ccd8
01643 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
01647 4183c102                       add        r9d, 2
0164b 44894978                       mov        dword ptr [rcx + 0x78], r9d
0164f 4181e1feff1f00                 and        r9d, 0x1ffffe
01656 4585c9                         test       r9d, r9d
01659 0f84b5350000                   je         0x7f430c13a614
0165f 48b9d8cc1400437f0000           movabs     rcx, 0x7f430014ccd8
01669 488381b000000001               add        qword ptr [rcx + 0xb0], 1
01671 48b908ce1400437f0000           movabs     rcx, 0x7f430014ce08
0167b 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
0167f 4183c002                       add        r8d, 2
01683 44894178                       mov        dword ptr [rcx + 0x78], r8d
01687 4181e0feff1f00                 and        r8d, 0x1ffffe
0168e 4585c0                         test       r8d, r8d
01691 0f849e350000                   je         0x7f430c13a635
01697 48b908ce1400437f0000           movabs     rcx, 0x7f430014ce08
016a1 ff81c0000000                   inc        dword ptr [rcx + 0xc0]
016a7 8b8c24b8010000                 mov        ecx, dword ptr [rsp + 0x1b8]
016ae 89b424c0010000                 mov        dword ptr [rsp + 0x1c0], esi
016b5 49b8081472e200000000           movabs     r8, 0xe2721408
016bf 4d8bc8                         mov        r9, r8
016c2 49be90e91400437f0000           movabs     r14, 0x7f430014e990
016cc 49b90098011700000000           movabs     r9, 0x17019800
016d6 41ba2b000000                   mov        r10d, 0x2b
016dc 4f3b0cd6                       cmp        r9, qword ptr [r14 + r10*8]
016e0 7436                           je         0x7f430c137118
016e2 4983c202                       add        r10, 2
016e6 4983fa2f                       cmp        r10, 0x2f
016ea 75f0                           jne        0x7f430c1370dc
016ec 41ba2b000000                   mov        r10d, 0x2b
016f2 4b833cd600                     cmp        qword ptr [r14 + r10*8], 0
016f7 7412                           je         0x7f430c13710b
016f9 4983c202                       add        r10, 2
016fd 4983fa2f                       cmp        r10, 0x2f
01701 75ef                           jne        0x7f430c1370f2
01703 41ba2a000000                   mov        r10d, 0x2a
01709 eb11                           jmp        0x7f430c13711c
0170b 50                             push       rax
0170c 4833c0                         xor        rax, rax
0170f f04f0fb10cd6                   lock cmpxchg qword ptr [r14 + r10*8], r9
01715 58                             pop        rax
01716 ebbe                           jmp        0x7f430c1370d6
01718 4983c201                       add        r10, 1
0171c 4b8304d601                     add        qword ptr [r14 + r10*8], 1
01721 49b960eb1400437f0000           movabs     r9, 0x7f430014eb60
0172b 418b5978                       mov        ebx, dword ptr [r9 + 0x78]
0172f 83c302                         add        ebx, 2
01732 41895978                       mov        dword ptr [r9 + 0x78], ebx
01736 81e3feff1f00                   and        ebx, 0x1ffffe
0173c 85db                           test       ebx, ebx
0173e 0f8412350000                   je         0x7f430c13a656
01744 4d8bc8                         mov        r9, r8
01747 48bb60eb1400437f0000           movabs     rbx, 0x7f430014eb60
01751 488383b000000001               add        qword ptr [rbx + 0xb0], 1
01759 49b948ec1400437f0000           movabs     r9, 0x7f430014ec48
01763 418b5978                       mov        ebx, dword ptr [r9 + 0x78]
01767 83c302                         add        ebx, 2
0176a 41895978                       mov        dword ptr [r9 + 0x78], ebx
0176e 81e3feff1f00                   and        ebx, 0x1ffffe
01774 85db                           test       ebx, ebx
01776 0f84fb340000                   je         0x7f430c13a677
0177c 49b948ec1400437f0000           movabs     r9, 0x7f430014ec48
01786 49b80098011700000000           movabs     r8, 0x17019800
01790 41ba17000000                   mov        r10d, 0x17
01796 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
0179a 7436                           je         0x7f430c1371d2
0179c 4983c202                       add        r10, 2
017a0 4983fa1b                       cmp        r10, 0x1b
017a4 75f0                           jne        0x7f430c137196
017a6 41ba17000000                   mov        r10d, 0x17
017ac 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
017b1 7412                           je         0x7f430c1371c5
017b3 4983c202                       add        r10, 2
017b7 4983fa1b                       cmp        r10, 0x1b
017bb 75ef                           jne        0x7f430c1371ac
017bd 41ba16000000                   mov        r10d, 0x16
017c3 eb11                           jmp        0x7f430c1371d6
017c5 50                             push       rax
017c6 4833c0                         xor        rax, rax
017c9 f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
017cf 58                             pop        rax
017d0 ebbe                           jmp        0x7f430c137190
017d2 4983c201                       add        r10, 1
017d6 4b8304d101                     add        qword ptr [r9 + r10*8], 1
017db 49b8c0d61400437f0000           movabs     r8, 0x7f430014d6c0
017e5 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
017e9 4183c102                       add        r9d, 2
017ed 45894878                       mov        dword ptr [r8 + 0x78], r9d
017f1 4181e1feff1f00                 and        r9d, 0x1ffffe
017f8 4585c9                         test       r9d, r9d
017fb 0f8497340000                   je         0x7f430c13a698
01801 49b8109471e200000000           movabs     r8, 0xe2719410
0180b 4d8bc8                         mov        r9, r8
0180e 48bb48ec1400437f0000           movabs     rbx, 0x7f430014ec48
01818 458b09                         mov        r9d, dword ptr [r9]
0181b 41c1e90d                       shr        r9d, 0xd
0181f 49c1e10a                       shl        r9, 0xa
01823 41ba00000016                   mov        r10d, 0x16000000
01829 4d03ca                         add        r9, r10
0182c 41ba1d000000                   mov        r10d, 0x1d
01832 4e3b0cd3                       cmp        r9, qword ptr [rbx + r10*8]
01836 7436                           je         0x7f430c13726e
01838 4983c202                       add        r10, 2
0183c 4983fa21                       cmp        r10, 0x21
01840 75f0                           jne        0x7f430c137232
01842 41ba1d000000                   mov        r10d, 0x1d
01848 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0184d 7412                           je         0x7f430c137261
0184f 4983c202                       add        r10, 2
01853 4983fa21                       cmp        r10, 0x21
01857 75ef                           jne        0x7f430c137248
01859 41ba1c000000                   mov        r10d, 0x1c
0185f eb11                           jmp        0x7f430c137272
01861 50                             push       rax
01862 4833c0                         xor        rax, rax
01865 f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
0186b 58                             pop        rax
0186c ebbe                           jmp        0x7f430c13722c
0186e 4983c201                       add        r10, 1
01872 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01877 49b948ec1400437f0000           movabs     r9, 0x7f430014ec48
01881 458b00                         mov        r8d, dword ptr [r8]
01884 41c1e80d                       shr        r8d, 0xd
01888 49c1e00a                       shl        r8, 0xa
0188c 41ba00000016                   mov        r10d, 0x16000000
01892 4d03c2                         add        r8, r10
01895 41ba23000000                   mov        r10d, 0x23
0189b 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
0189f 7436                           je         0x7f430c1372d7
018a1 4983c202                       add        r10, 2
018a5 4983fa27                       cmp        r10, 0x27
018a9 75f0                           jne        0x7f430c13729b
018ab 41ba23000000                   mov        r10d, 0x23
018b1 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
018b6 7412                           je         0x7f430c1372ca
018b8 4983c202                       add        r10, 2
018bc 4983fa27                       cmp        r10, 0x27
018c0 75ef                           jne        0x7f430c1372b1
018c2 41ba22000000                   mov        r10d, 0x22
018c8 eb11                           jmp        0x7f430c1372db
018ca 50                             push       rax
018cb 4833c0                         xor        rax, rax
018ce f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
018d4 58                             pop        rax
018d5 ebbe                           jmp        0x7f430c137295
018d7 4983c201                       add        r10, 1
018db 4b8304d101                     add        qword ptr [r9 + r10*8], 1
018e0 49b848ec1400437f0000           movabs     r8, 0x7f430014ec48
018ea 4983804001000001               add        qword ptr [r8 + 0x140], 1
018f2 49b888d71400437f0000           movabs     r8, 0x7f430014d788
018fc 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
01900 4183c102                       add        r9d, 2
01904 45894878                       mov        dword ptr [r8 + 0x78], r9d
01908 4181e1feff1f00                 and        r9d, 0x1ffffe
0190f 4585c9                         test       r9d, r9d
01912 0f84a1330000                   je         0x7f430c13a6b9
01918 49b848ec1400437f0000           movabs     r8, 0x7f430014ec48
01922 4983805001000001               add        qword ptr [r8 + 0x150], 1
0192a 4863d9                         movsxd     rbx, ecx
0192d b908000000                     mov        ecx, 8
01932 4c8bcb                         mov        r9, rbx
01935 4c03c9                         add        r9, rcx
01938 48b980b91400437f0000           movabs     rcx, 0x7f430014b980
01942 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
01946 4183c002                       add        r8d, 2
0194a 44894178                       mov        dword ptr [rcx + 0x78], r8d
0194e 4181e0feff1f00                 and        r8d, 0x1ffffe
01955 4585c0                         test       r8d, r8d
01958 0f847c330000                   je         0x7f430c13a6da
0195e 48b980b91400437f0000           movabs     rcx, 0x7f430014b980
01968 488381e000000001               add        qword ptr [rcx + 0xe0], 1
01970 48b900bb1400437f0000           movabs     rcx, 0x7f430014bb00
0197a 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
0197e 4183c002                       add        r8d, 2
01982 44894178                       mov        dword ptr [rcx + 0x78], r8d
01986 4181e0feff1f00                 and        r8d, 0x1ffffe
0198d 4585c0                         test       r8d, r8d
01990 0f8465330000                   je         0x7f430c13a6fb
01996 48b948ec1400437f0000           movabs     rcx, 0x7f430014ec48
019a0 488d8960010000                 lea        rcx, [rcx + 0x160]
019a7 49b8d86c72e200000000           movabs     r8, 0xe2726cd8
019b1 4d85c0                         test       r8, r8
019b4 0f8514000000                   jne        0x7f430c1373ce
019ba 48bf75489a2a437f0000           movabs     rdi, 0x7f432a9a4875
019c4 4883e4f0                       and        rsp, 0xfffffffffffffff0
019c8 e81378ca1f                     call       0x7f432bddebe0
019cd f4                             hlt        
019ce 458b00                         mov        r8d, dword ptr [r8]
019d1 41c1e80d                       shr        r8d, 0xd
019d5 49c1e00a                       shl        r8, 0xa
019d9 41ba00000016                   mov        r10d, 0x16000000
019df 4d03c2                         add        r8, r10
019e2 4150                           push       r8
019e4 49b800f0011700000000           movabs     r8, 0x1701f000
019ee 4c3b0424                       cmp        r8, qword ptr [rsp]
019f2 0f8414000000                   je         0x7f430c13740c
019f8 48bf8843a22a437f0000           movabs     rdi, 0x7f432aa24388
01a02 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a06 e8d577ca1f                     call       0x7f432bddebe0
01a0b f4                             hlt        
01a0c 4158                           pop        r8
01a0e 49b800f0011700000000           movabs     r8, 0x1701f000
01a18 4d8bd0                         mov        r10, r8
01a1b 4c3301                         xor        r8, qword ptr [rcx]
01a1e 49f7c0fcffffff                 test       r8, -4
01a25 742b                           je         0x7f430c137452
01a27 41f6c002                       test       r8b, 2
01a2b 7525                           jne        0x7f430c137452
01a2d 48f701feffffff                 test       qword ptr [rcx], -2
01a34 7415                           je         0x7f430c13744b
01a36 4d8bc2                         mov        r8, r10
01a39 4c3301                         xor        r8, qword ptr [rcx]
01a3c 49f7c0fcffffff                 test       r8, -4
01a43 740d                           je         0x7f430c137452
01a45 48830902                       or         qword ptr [rcx], 2
01a49 eb07                           jmp        0x7f430c137452
01a4b 4c8901                         mov        qword ptr [rcx], r8
01a4e 4983e0fc                       and        r8, 0xfffffffffffffffc
01a52 48b948ec1400437f0000           movabs     rcx, 0x7f430014ec48
01a5c 4883817001000001               add        qword ptr [rcx + 0x170], 1
01a64 48be589471e200000000           movabs     rsi, 0xe2719458
01a6e 4c8bc2                         mov        r8, rdx
01a71 ba02000000                     mov        edx, 2
01a76 b910000000                     mov        ecx, 0x10
01a7b 498bc0                         mov        rax, r8
01a7e 4c8bc0                         mov        r8, rax
01a81 bf00000000                     mov        edi, 0
01a86 48890424                       mov        qword ptr [rsp], rax
01a8a 48895c2408                     mov        qword ptr [rsp + 8], rbx
01a8f 49ba109471e200000000           movabs     r10, 0xe2719410
01a99 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01a9e 49bad86c72e200000000           movabs     r10, 0xe2726cd8
01aa8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01aad 90                             nop        
01aae 90                             nop        
01aaf e8ac875f07                     call       0x7f431372fc60
01ab4 0f1f8400ac1b0006               nop        dword ptr [rax + rax + 0x6001bac]
01abc 4885c0                         test       rax, rax
01abf 48bb48ec1400437f0000           movabs     rbx, 0x7f430014ec48
01ac9 750c                           jne        0x7f430c1374d7
01acb 808b7901000001                 or         byte ptr [rbx + 0x179], 1
01ad2 e988000000                     jmp        0x7f430c13755f
01ad7 8b38                           mov        edi, dword ptr [rax]
01ad9 c1ef0d                         shr        edi, 0xd
01adc 48c1e70a                       shl        rdi, 0xa
01ae0 41ba00000016                   mov        r10d, 0x16000000
01ae6 4903fa                         add        rdi, r10
01ae9 41ba31000000                   mov        r10d, 0x31
01aef 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
01af3 7436                           je         0x7f430c13752b
01af5 4983c202                       add        r10, 2
01af9 4983fa35                       cmp        r10, 0x35
01afd 75f0                           jne        0x7f430c1374ef
01aff 41ba31000000                   mov        r10d, 0x31
01b05 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01b0a 7412                           je         0x7f430c13751e
01b0c 4983c202                       add        r10, 2
01b10 4983fa35                       cmp        r10, 0x35
01b14 75ef                           jne        0x7f430c137505
01b16 41ba30000000                   mov        r10d, 0x30
01b1c eb11                           jmp        0x7f430c13752f
01b1e 50                             push       rax
01b1f 4833c0                         xor        rax, rax
01b22 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
01b28 58                             pop        rax
01b29 ebbe                           jmp        0x7f430c1374e9
01b2b 4983c201                       add        r10, 1
01b2f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01b34 48bf0080001700000000           movabs     rdi, 0x17008000
01b3e 8b18                           mov        ebx, dword ptr [rax]
01b40 c1eb0d                         shr        ebx, 0xd
01b43 48c1e30a                       shl        rbx, 0xa
01b47 41ba00000016                   mov        r10d, 0x16000000
01b4d 4903da                         add        rbx, r10
01b50 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
01b54 0f85c2310000                   jne        0x7f430c13a71c
01b5a e900000000                     jmp        0x7f430c13755f
01b5f 488bf8                         mov        rdi, rax
01b62 4889bc24c8010000               mov        qword ptr [rsp + 0x1c8], rdi
01b6a 483b07                         cmp        rax, qword ptr [rdi]
01b6d 488bf7                         mov        rsi, rdi
01b70 48bb60a24300437f0000           movabs     rbx, 0x7f430043a260
01b7a 8b36                           mov        esi, dword ptr [rsi]
01b7c c1ee0d                         shr        esi, 0xd
01b7f 48c1e60a                       shl        rsi, 0xa
01b83 41ba00000016                   mov        r10d, 0x16000000
01b89 4903f2                         add        rsi, r10
01b8c 41baa4000000                   mov        r10d, 0xa4
01b92 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
01b96 743c                           je         0x7f430c1375d4
01b98 4983c202                       add        r10, 2
01b9c 4981faa8000000                 cmp        r10, 0xa8
01ba3 75ed                           jne        0x7f430c137592
01ba5 41baa4000000                   mov        r10d, 0xa4
01bab 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01bb0 7415                           je         0x7f430c1375c7
01bb2 4983c202                       add        r10, 2
01bb6 4981faa8000000                 cmp        r10, 0xa8
01bbd 75ec                           jne        0x7f430c1375ab
01bbf 41baa3000000                   mov        r10d, 0xa3
01bc5 eb11                           jmp        0x7f430c1375d8
01bc7 50                             push       rax
01bc8 4833c0                         xor        rax, rax
01bcb f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01bd1 58                             pop        rax
01bd2 ebb8                           jmp        0x7f430c13758c
01bd4 4983c201                       add        r10, 1
01bd8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01bdd 48be20f01400437f0000           movabs     rsi, 0x7f430014f020
01be7 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
01bea 83c302                         add        ebx, 2
01bed 895e78                         mov        dword ptr [rsi + 0x78], ebx
01bf0 81e3feff1f00                   and        ebx, 0x1ffffe
01bf6 85db                           test       ebx, ebx
01bf8 0f8454310000                   je         0x7f430c13a752
01bfe 488bf7                         mov        rsi, rdi
01c01 48bb20f01400437f0000           movabs     rbx, 0x7f430014f020
01c0b 8b36                           mov        esi, dword ptr [rsi]
01c0d c1ee0d                         shr        esi, 0xd
01c10 48c1e60a                       shl        rsi, 0xa
01c14 41ba00000016                   mov        r10d, 0x16000000
01c1a 4903f2                         add        rsi, r10
01c1d 41ba17000000                   mov        r10d, 0x17
01c23 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
01c27 7436                           je         0x7f430c13765f
01c29 4983c202                       add        r10, 2
01c2d 4983fa1b                       cmp        r10, 0x1b
01c31 75f0                           jne        0x7f430c137623
01c33 41ba17000000                   mov        r10d, 0x17
01c39 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01c3e 7412                           je         0x7f430c137652
01c40 4983c202                       add        r10, 2
01c44 4983fa1b                       cmp        r10, 0x1b
01c48 75ef                           jne        0x7f430c137639
01c4a 41ba16000000                   mov        r10d, 0x16
01c50 eb11                           jmp        0x7f430c137663
01c52 50                             push       rax
01c53 4833c0                         xor        rax, rax
01c56 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01c5c 58                             pop        rax
01c5d ebbe                           jmp        0x7f430c13761d
01c5f 4983c201                       add        r10, 1
01c63 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01c68 488bf7                         mov        rsi, rdi
01c6b 90                             nop        
01c6c 90                             nop        
01c6d 48b8a0fb45e0427f0000           movabs     rax, 0x7f42e045fba0
01c77 e8e4805f07                     call       0x7f431372f760
01c7c 0f1f8400741d0007               nop        dword ptr [rax + rax + 0x7001d74]
01c84 488bbc2438010000               mov        rdi, qword ptr [rsp + 0x138]
01c8c 8b7704                         mov        esi, dword ptr [rdi + 4]
01c8f 48bb20f01400437f0000           movabs     rbx, 0x7f430014f020
01c99 488383e000000001               add        qword ptr [rbx + 0xe0], 1
01ca1 48bb40d51400437f0000           movabs     rbx, 0x7f430014d540
01cab 8b5378                         mov        edx, dword ptr [rbx + 0x78]
01cae 83c202                         add        edx, 2
01cb1 895378                         mov        dword ptr [rbx + 0x78], edx
01cb4 81e2feff1f00                   and        edx, 0x1ffffe
01cba 85d2                           test       edx, edx
01cbc 0f84ca300000                   je         0x7f430c13a78c
01cc2 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
01cca 48bb40d51400437f0000           movabs     rbx, 0x7f430014d540
01cd4 4883831001000001               add        qword ptr [rbx + 0x110], 1
01cdc ffc8                           dec        eax
01cde 2bf0                           sub        esi, eax
01ce0 48bbd0cb1400437f0000           movabs     rbx, 0x7f430014cbd0
01cea 8b4378                         mov        eax, dword ptr [rbx + 0x78]
01ced 83c002                         add        eax, 2
01cf0 894378                         mov        dword ptr [rbx + 0x78], eax
01cf3 25feff1f00                     and        eax, 0x1ffffe
01cf8 85c0                           test       eax, eax
01cfa 0f84ad300000                   je         0x7f430c13a7ad
01d00 48bbd0cb1400437f0000           movabs     rbx, 0x7f430014cbd0
01d0a 488383b000000001               add        qword ptr [rbx + 0xb0], 1
01d12 48bb0000000000000000           movabs     rbx, 0
01d1c bb00000000                     mov        ebx, 0
01d21 443bdb                         cmp        r11d, ebx
01d24 0f8ca4300000                   jl         0x7f430c13a7ce
01d2a 443bde                         cmp        r11d, esi
01d2d 0f8dbc300000                   jge        0x7f430c13a7ef
01d33 498bdb                         mov        rbx, r11
01d36 899c24c4010000                 mov        dword ptr [rsp + 0x1c4], ebx
01d3d 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
01d45 488bbc24c8010000               mov        rdi, qword ptr [rsp + 0x1c8]
01d4d 488bf7                         mov        rsi, rdi
01d50 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
01d5a 8b36                           mov        esi, dword ptr [rsi]
01d5c c1ee0d                         shr        esi, 0xd
01d5f 48c1e60a                       shl        rsi, 0xa
01d63 41ba00000016                   mov        r10d, 0x16000000
01d69 4903f2                         add        rsi, r10
01d6c 41ba1f000000                   mov        r10d, 0x1f
01d72 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01d76 7436                           je         0x7f430c1377ae
01d78 4983c202                       add        r10, 2
01d7c 4983fa23                       cmp        r10, 0x23
01d80 75f0                           jne        0x7f430c137772
01d82 41ba1f000000                   mov        r10d, 0x1f
01d88 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01d8d 7412                           je         0x7f430c1377a1
01d8f 4983c202                       add        r10, 2
01d93 4983fa23                       cmp        r10, 0x23
01d97 75ef                           jne        0x7f430c137788
01d99 41ba1e000000                   mov        r10d, 0x1e
01d9f eb11                           jmp        0x7f430c1377b2
01da1 50                             push       rax
01da2 4833c0                         xor        rax, rax
01da5 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01dab 58                             pop        rax
01dac ebbe                           jmp        0x7f430c13776c
01dae 4983c201                       add        r10, 1
01db2 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01db7 488bf7                         mov        rsi, rdi
01dba 90                             nop        
01dbb 90                             nop        
01dbc 90                             nop        
01dbd 48b8c8fb45e0427f0000           movabs     rax, 0x7f42e045fbc8
01dc7 e8947f5f07                     call       0x7f431372f760
01dcc 0f1f8400c41e0008               nop        dword ptr [rax + rax + 0x8001ec4]
01dd4 483b00                         cmp        rax, qword ptr [rax]
01dd7 488bf0                         mov        rsi, rax
01dda 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
01de4 8b36                           mov        esi, dword ptr [rsi]
01de6 c1ee0d                         shr        esi, 0xd
01de9 48c1e60a                       shl        rsi, 0xa
01ded 41ba00000016                   mov        r10d, 0x16000000
01df3 4903f2                         add        rsi, r10
01df6 41ba25000000                   mov        r10d, 0x25
01dfc 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01e00 7436                           je         0x7f430c137838
01e02 4983c202                       add        r10, 2
01e06 4983fa29                       cmp        r10, 0x29
01e0a 75f0                           jne        0x7f430c1377fc
01e0c 41ba25000000                   mov        r10d, 0x25
01e12 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01e17 7412                           je         0x7f430c13782b
01e19 4983c202                       add        r10, 2
01e1d 4983fa29                       cmp        r10, 0x29
01e21 75ef                           jne        0x7f430c137812
01e23 41ba24000000                   mov        r10d, 0x24
01e29 eb11                           jmp        0x7f430c13783c
01e2b 50                             push       rax
01e2c 4833c0                         xor        rax, rax
01e2f f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01e35 58                             pop        rax
01e36 ebbe                           jmp        0x7f430c1377f6
01e38 4983c201                       add        r10, 1
01e3c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01e41 8b7024                         mov        esi, dword ptr [rax + 0x24]
01e44 4c3b25cd8b8d20                 cmp        r12, qword ptr [rip + 0x208d8bcd]
01e4b 0f8414000000                   je         0x7f430c137865
01e51 48bf3823ae2a437f0000           movabs     rdi, 0x7f432aae2338
01e5b 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e5f e87c73ca1f                     call       0x7f432bddebe0
01e64 f4                             hlt        
01e65 488bd0                         mov        rdx, rax
01e68 48b920f01400437f0000           movabs     rcx, 0x7f430014f020
01e72 8b12                           mov        edx, dword ptr [rdx]
01e74 c1ea0d                         shr        edx, 0xd
01e77 48c1e20a                       shl        rdx, 0xa
01e7b 41ba00000016                   mov        r10d, 0x16000000
01e81 4903d2                         add        rdx, r10
01e84 41ba2b000000                   mov        r10d, 0x2b
01e8a 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01e8e 7436                           je         0x7f430c1378c6
01e90 4983c202                       add        r10, 2
01e94 4983fa2f                       cmp        r10, 0x2f
01e98 75f0                           jne        0x7f430c13788a
01e9a 41ba2b000000                   mov        r10d, 0x2b
01ea0 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01ea5 7412                           je         0x7f430c1378b9
01ea7 4983c202                       add        r10, 2
01eab 4983fa2f                       cmp        r10, 0x2f
01eaf 75ef                           jne        0x7f430c1378a0
01eb1 41ba2a000000                   mov        r10d, 0x2a
01eb7 eb11                           jmp        0x7f430c1378ca
01eb9 50                             push       rax
01eba 4833c0                         xor        rax, rax
01ebd f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
01ec3 58                             pop        rax
01ec4 ebbe                           jmp        0x7f430c137884
01ec6 4983c201                       add        r10, 1
01eca 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01ecf 8b4804                         mov        ecx, dword ptr [rax + 4]
01ed2 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
01edc 4883828001000001               add        qword ptr [rdx + 0x180], 1
01ee4 48ba88d71400437f0000           movabs     rdx, 0x7f430014d788
01eee 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01ef2 4183c002                       add        r8d, 2
01ef6 44894278                       mov        dword ptr [rdx + 0x78], r8d
01efa 4181e0feff1f00                 and        r8d, 0x1ffffe
01f01 4585c0                         test       r8d, r8d
01f04 0f841f2f0000                   je         0x7f430c13a829
01f0a 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
01f14 4883829001000001               add        qword ptr [rdx + 0x190], 1
01f1c 8b9c24c4010000                 mov        ebx, dword ptr [rsp + 0x1c4]
01f23 4863db                         movsxd     rbx, ebx
01f26 ba08000000                     mov        edx, 8
01f2b 4c8bcb                         mov        r9, rbx
01f2e 4c03ca                         add        r9, rdx
01f31 48ba80b91400437f0000           movabs     rdx, 0x7f430014b980
01f3b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01f3f 4183c002                       add        r8d, 2
01f43 44894278                       mov        dword ptr [rdx + 0x78], r8d
01f47 4181e0feff1f00                 and        r8d, 0x1ffffe
01f4e 4585c0                         test       r8d, r8d
01f51 0f84f32e0000                   je         0x7f430c13a84a
01f57 48ba80b91400437f0000           movabs     rdx, 0x7f430014b980
01f61 488382e000000001               add        qword ptr [rdx + 0xe0], 1
01f69 48ba00bb1400437f0000           movabs     rdx, 0x7f430014bb00
01f73 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01f77 4183c002                       add        r8d, 2
01f7b 44894278                       mov        dword ptr [rdx + 0x78], r8d
01f7f 4181e0feff1f00                 and        r8d, 0x1ffffe
01f86 4585c0                         test       r8d, r8d
01f89 0f84dc2e0000                   je         0x7f430c13a86b
01f8f 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
01f99 488d92a0010000                 lea        rdx, [rdx + 0x1a0]
01fa0 49b8c00a73e200000000           movabs     r8, 0xe2730ac0
01faa 4d85c0                         test       r8, r8
01fad 0f8514000000                   jne        0x7f430c1379c7
01fb3 48bf75489a2a437f0000           movabs     rdi, 0x7f432a9a4875
01fbd 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fc1 e81a72ca1f                     call       0x7f432bddebe0
01fc6 f4                             hlt        
01fc7 458b00                         mov        r8d, dword ptr [r8]
01fca 41c1e80d                       shr        r8d, 0xd
01fce 49c1e00a                       shl        r8, 0xa
01fd2 41ba00000016                   mov        r10d, 0x16000000
01fd8 4d03c2                         add        r8, r10
01fdb 4150                           push       r8
01fdd 49b80000021700000000           movabs     r8, 0x17020000
01fe7 4c3b0424                       cmp        r8, qword ptr [rsp]
01feb 0f8414000000                   je         0x7f430c137a05
01ff1 48bf8843a22a437f0000           movabs     rdi, 0x7f432aa24388
01ffb 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fff e8dc71ca1f                     call       0x7f432bddebe0
02004 f4                             hlt        
02005 4158                           pop        r8
02007 49b80000021700000000           movabs     r8, 0x17020000
02011 4d8bd0                         mov        r10, r8
02014 4c3302                         xor        r8, qword ptr [rdx]
02017 49f7c0fcffffff                 test       r8, -4
0201e 742b                           je         0x7f430c137a4b
02020 41f6c002                       test       r8b, 2
02024 7525                           jne        0x7f430c137a4b
02026 48f702feffffff                 test       qword ptr [rdx], -2
0202d 7415                           je         0x7f430c137a44
0202f 4d8bc2                         mov        r8, r10
02032 4c3302                         xor        r8, qword ptr [rdx]
02035 49f7c0fcffffff                 test       r8, -4
0203c 740d                           je         0x7f430c137a4b
0203e 48830a02                       or         qword ptr [rdx], 2
02042 eb07                           jmp        0x7f430c137a4b
02044 4c8902                         mov        qword ptr [rdx], r8
02047 4983e0fc                       and        r8, 0xfffffffffffffffc
0204b 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
02055 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
0205d ba02000000                     mov        edx, 2
02062 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
0206a bf00000000                     mov        edi, 0
0206f 488b8424c8010000               mov        rax, qword ptr [rsp + 0x1c8]
02077 48890424                       mov        qword ptr [rsp], rax
0207b 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
02083 4889442408                     mov        qword ptr [rsp + 8], rax
02088 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
0208d 49bac00a73e200000000           movabs     r10, 0xe2730ac0
02097 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0209c 90                             nop        
0209d 90                             nop        
0209e 90                             nop        
0209f e8bc815f07                     call       0x7f431372fc60
020a4 0f1f84009c210009               nop        dword ptr [rax + rax + 0x900219c]
020ac 448b9c24bc010000               mov        r11d, dword ptr [rsp + 0x1bc]
020b4 4183c310                       add        r11d, 0x10
020b8 8bb424c0010000                 mov        esi, dword ptr [rsp + 0x1c0]
020bf 83c610                         add        esi, 0x10
020c2 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
020ca ba02000000                     mov        edx, 2
020cf 7c05                           jl         0x7f430c137ad6
020d1 ba00000000                     mov        edx, 0
020d6 48b960a24300437f0000           movabs     rcx, 0x7f430043a260
020e0 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
020e4 4403c2                         add        r8d, edx
020e7 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
020eb 85d2                           test       edx, edx
020ed 7506                           jne        0x7f430c137af5
020ef 41b802000000                   mov        r8d, 2
020f5 4181e0fe3f0000                 and        r8d, 0x3ffe
020fc 4585c0                         test       r8d, r8d
020ff 0f84872d0000                   je         0x7f430c13a88c
02105 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
02109 418502                         test       dword ptr [r10], eax
0210c 443b9c24a0010000               cmp        r11d, dword ptr [rsp + 0x1a0]
02114 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
0211e b948050000                     mov        ecx, 0x548
02123 7c05                           jl         0x7f430c137b2a
02125 b958050000                     mov        ecx, 0x558
0212a 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0212e 4d8d4001                       lea        r8, [r8 + 1]
02132 4c89040a                       mov        qword ptr [rdx + rcx], r8
02136 0f8c14f3ffff                   jl         0x7f430c136e50
0213c 48be60a24300437f0000           movabs     rsi, 0x7f430043a260
02146 ff8668050000                   inc        dword ptr [rsi + 0x568]
0214c e9f0000000                     jmp        0x7f430c137c41
02151 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
0215b 4883828005000001               add        qword ptr [rdx + 0x580], 1
02163 488bb42468010000               mov        rsi, qword ptr [rsp + 0x168]
0216b 8b942490010000                 mov        edx, dword ptr [rsp + 0x190]
02172 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
0217a 448b842474010000               mov        r8d, dword ptr [rsp + 0x174]
02182 4c8bcf                         mov        r9, rdi
02185 4885c9                         test       rcx, rcx
02188 0f841f2d0000                   je         0x7f430c13a8ad
0218e 85d2                           test       edx, edx
02190 0f8c172d0000                   jl         0x7f430c13a8ad
02196 4585c0                         test       r8d, r8d
02199 0f8c0e2d0000                   jl         0x7f430c13a8ad
0219f 4a8d3c0a                       lea        rdi, [rdx + r9]
021a3 3b7e04                         cmp        edi, dword ptr [rsi + 4]
021a6 0f87012d0000                   ja         0x7f430c13a8ad
021ac 4b8d3c08                       lea        rdi, [r8 + r9]
021b0 3b7904                         cmp        edi, dword ptr [rcx + 4]
021b3 0f87f42c0000                   ja         0x7f430c13a8ad
021b9 4585c9                         test       r9d, r9d
021bc 0f8ceb2c0000                   jl         0x7f430c13a8ad
021c2 4863d2                         movsxd     rdx, edx
021c5 4d63c0                         movsxd     r8, r8d
021c8 48bf00e41b1600000000           movabs     rdi, 0x161be400
021d2 41ba00000016                   mov        r10d, 0x16000000
021d8 492bfa                         sub        rdi, r10
021db 48c1ef0a                       shr        rdi, 0xa
021df 448b19                         mov        r11d, dword ptr [rcx]
021e2 41c1eb0d                       shr        r11d, 0xd
021e6 413bfb                         cmp        edi, r11d
021e9 0f8510000000                   jne        0x7f430c137bff
021ef 448b1e                         mov        r11d, dword ptr [rsi]
021f2 41c1eb0d                       shr        r11d, 0xd
021f6 413bfb                         cmp        edi, r11d
021f9 0f8414000000                   je         0x7f430c137c13
021ff 48bf8895a72a437f0000           movabs     rdi, 0x7f432aa79588
02209 4883e4f0                       and        rsp, 0xfffffffffffffff0
0220d e8ce6fca1f                     call       0x7f432bddebe0
02212 f4                             hlt        
02213 488d7c1608                     lea        rdi, [rsi + rdx + 8]
02218 4a8d740108                     lea        rsi, [rcx + r8 + 8]
0221d 498bd1                         mov        rdx, r9
02220 40f6c40f                       test       spl, 0xf
02224 0f8412000000                   je         0x7f430c137c3c
0222a 4883ec08                       sub        rsp, 8
0222e e80d155e07                     call       0x7f4313719140
02233 4883c408                       add        rsp, 8
02237 e905000000                     jmp        0x7f430c137c41
0223c e8ff145e07                     call       0x7f4313719140
02241 8bb424a4010000                 mov        esi, dword ptr [rsp + 0x1a4]
02248 8b9c24a0010000                 mov        ebx, dword ptr [rsp + 0x1a0]
0224f 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
02257 488bfb                         mov        rdi, rbx
0225a 2bbc24a8010000                 sub        edi, dword ptr [rsp + 0x1a8]
02261 4183f810                       cmp        r8d, 0x10
02265 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
0226f b990050000                     mov        ecx, 0x590
02274 7f05                           jg         0x7f430c137c7b
02276 b9a0050000                     mov        ecx, 0x5a0
0227b 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0227f 4d8d4901                       lea        r9, [r9 + 1]
02283 4c890c0a                       mov        qword ptr [rdx + rcx], r9
02287 448b8c24a8010000               mov        r9d, dword ptr [rsp + 0x1a8]
0228f 0f8f2c000000                   jg         0x7f430c137cc1
02295 4183f910                       cmp        r9d, 0x10
02299 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
022a3 b9c0050000                     mov        ecx, 0x5c0
022a8 7d05                           jge        0x7f430c137caf
022aa b9b0050000                     mov        ecx, 0x5b0
022af 488b040a                       mov        rax, qword ptr [rdx + rcx]
022b3 488d4001                       lea        rax, [rax + 1]
022b7 4889040a                       mov        qword ptr [rdx + rcx], rax
022bb 0f8d1b130000                   jge        0x7f430c138fdc
022c1 453bc8                         cmp        r9d, r8d
022c4 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
022ce b928060000                     mov        ecx, 0x628
022d3 7c05                           jl         0x7f430c137cda
022d5 b938060000                     mov        ecx, 0x638
022da 488b040a                       mov        rax, qword ptr [rdx + rcx]
022de 488d4001                       lea        rax, [rax + 1]
022e2 4889040a                       mov        qword ptr [rdx + rcx], rax
022e6 0f8c59030000                   jl         0x7f430c138045
022ec 4183f830                       cmp        r8d, 0x30
022f0 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
022fa b948060000                     mov        ecx, 0x648
022ff 7e05                           jle        0x7f430c137d06
02301 b958060000                     mov        ecx, 0x658
02306 4c8b0c0a                       mov        r9, qword ptr [rdx + rcx]
0230a 4d8d4901                       lea        r9, [r9 + 1]
0230e 4c890c0a                       mov        qword ptr [rdx + rcx], r9
02312 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
02319 0f8e0f010000                   jle        0x7f430c137e2e
0231f 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
02329 4883826806000001               add        qword ptr [rdx + 0x668], 1
02331 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
02339 488bd7                         mov        rdx, rdi
0233c 488b8c2438010000               mov        rcx, qword ptr [rsp + 0x138]
02344 498bf8                         mov        rdi, r8
02347 4c8bc3                         mov        r8, rbx
0234a 4c8bcf                         mov        r9, rdi
0234d 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
02354 4885f6                         test       rsi, rsi
02357 0f845c2b0000                   je         0x7f430c13a8b9
0235d 4885c9                         test       rcx, rcx
02360 0f84532b0000                   je         0x7f430c13a8b9
02366 85d2                           test       edx, edx
02368 0f8c4b2b0000                   jl         0x7f430c13a8b9
0236e 4585c0                         test       r8d, r8d
02371 0f8c422b0000                   jl         0x7f430c13a8b9
02377 4a8d3c0a                       lea        rdi, [rdx + r9]
0237b 3b7e04                         cmp        edi, dword ptr [rsi + 4]
0237e 0f87352b0000                   ja         0x7f430c13a8b9
02384 4b8d3c08                       lea        rdi, [r8 + r9]
02388 3b7904                         cmp        edi, dword ptr [rcx + 4]
0238b 0f87282b0000                   ja         0x7f430c13a8b9
02391 4585c9                         test       r9d, r9d
02394 0f8c1f2b0000                   jl         0x7f430c13a8b9
0239a 4863d2                         movsxd     rdx, edx
0239d 4d63c0                         movsxd     r8, r8d
023a0 48bf00e41b1600000000           movabs     rdi, 0x161be400
023aa 41ba00000016                   mov        r10d, 0x16000000
023b0 492bfa                         sub        rdi, r10
023b3 48c1ef0a                       shr        rdi, 0xa
023b7 448b19                         mov        r11d, dword ptr [rcx]
023ba 41c1eb0d                       shr        r11d, 0xd
023be 413bfb                         cmp        edi, r11d
023c1 0f8510000000                   jne        0x7f430c137dd7
023c7 448b1e                         mov        r11d, dword ptr [rsi]
023ca 41c1eb0d                       shr        r11d, 0xd
023ce 413bfb                         cmp        edi, r11d
023d1 0f8414000000                   je         0x7f430c137deb
023d7 48bf8895a72a437f0000           movabs     rdi, 0x7f432aa79588
023e1 4883e4f0                       and        rsp, 0xfffffffffffffff0
023e5 e8f66dca1f                     call       0x7f432bddebe0
023ea f4                             hlt        
023eb 488d7c1608                     lea        rdi, [rsi + rdx + 8]
023f0 4a8d740108                     lea        rsi, [rcx + r8 + 8]
023f5 498bd1                         mov        rdx, r9
023f8 40f6c40f                       test       spl, 0xf
023fc 0f8412000000                   je         0x7f430c137e14
02402 4883ec08                       sub        rsp, 8
02406 e835135e07                     call       0x7f4313719140
0240b 4883c408                       add        rsp, 8
0240f e905000000                     jmp        0x7f430c137e19
02414 e827135e07                     call       0x7f4313719140
02419 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
02423 ff8278060000                   inc        dword ptr [rdx + 0x678]
02429 e9f4010000                     jmp        0x7f430c138022
0242e 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
02435 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
0243c 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
02443 899c24e0010000                 mov        dword ptr [rsp + 0x1e0], ebx
0244a 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
02451 90                             nop        
02452 90                             nop        
02453 90                             nop        
02454 90                             nop        
02455 90                             nop        
02456 90                             nop        
02457 90                             nop        
02458 898424d8010000                 mov        dword ptr [rsp + 0x1d8], eax
0245f 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
02467 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
02471 4883829006000001               add        qword ptr [rdx + 0x690], 1
02479 48ba20684300437f0000           movabs     rdx, 0x7f4300436820
02483 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02486 83c102                         add        ecx, 2
02489 894a78                         mov        dword ptr [rdx + 0x78], ecx
0248c 81e1feff1f00                   and        ecx, 0x1ffffe
02492 85c9                           test       ecx, ecx
02494 0f842f2a0000                   je         0x7f430c13a8c9
0249a 90                             nop        
0249b 90                             nop        
0249c 90                             nop        
0249d 90                             nop        
0249e 90                             nop        
0249f 90                             nop        
024a0 e9542a0000                     jmp        0x7f430c13a8f9
024a5 90                             nop        
024a6 90                             nop        
024a7 90                             nop        
024a8 90                             nop        
024a9 90                             nop        
024aa 48ba20684300437f0000           movabs     rdx, 0x7f4300436820
024b4 488d92e0000000                 lea        rdx, [rdx + 0xe0]
024bb 4885c0                         test       rax, rax
024be 7510                           jne        0x7f430c137ed0
024c0 f6420801                       test       byte ptr [rdx + 8], 1
024c4 0f8506000000                   jne        0x7f430c137ed0
024ca f048834a0801                   lock or    qword ptr [rdx + 8], 1
024d0 48be08566ee200000000           movabs     rsi, 0xe26e5608
024da 488bd6                         mov        rdx, rsi
024dd 48b920684300437f0000           movabs     rcx, 0x7f4300436820
024e7 8b12                           mov        edx, dword ptr [rdx]
024e9 c1ea0d                         shr        edx, 0xd
024ec 48c1e20a                       shl        rdx, 0xa
024f0 41ba00000016                   mov        r10d, 0x16000000
024f6 4903d2                         add        rdx, r10
024f9 41ba17000000                   mov        r10d, 0x17
024ff 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02503 7436                           je         0x7f430c137f3b
02505 4983c202                       add        r10, 2
02509 4983fa1b                       cmp        r10, 0x1b
0250d 75f0                           jne        0x7f430c137eff
0250f 41ba17000000                   mov        r10d, 0x17
02515 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0251a 7412                           je         0x7f430c137f2e
0251c 4983c202                       add        r10, 2
02520 4983fa1b                       cmp        r10, 0x1b
02524 75ef                           jne        0x7f430c137f15
02526 41ba16000000                   mov        r10d, 0x16
0252c eb11                           jmp        0x7f430c137f3f
0252e 50                             push       rax
0252f 4833c0                         xor        rax, rax
02532 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02538 58                             pop        rax
02539 ebbe                           jmp        0x7f430c137ef9
0253b 4983c201                       add        r10, 1
0253f 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02544 488bd0                         mov        rdx, rax
02547 488bcf                         mov        rcx, rdi
0254a 89bc24dc010000                 mov        dword ptr [rsp + 0x1dc], edi
02551 90                             nop        
02552 90                             nop        
02553 90                             nop        
02554 90                             nop        
02555 90                             nop        
02556 90                             nop        
02557 e804735f07                     call       0x7f431372f260
0255c 0f1f84005426000b               nop        dword ptr [rax + rax + 0xb002654]
02564 48be60a24300437f0000           movabs     rsi, 0x7f430043a260
0256e 488386a006000001               add        qword ptr [rsi + 0x6a0], 1
02576 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
0257e 8b9424d8010000                 mov        edx, dword ptr [rsp + 0x1d8]
02585 488bc8                         mov        rcx, rax
02588 90                             nop        
02589 90                             nop        
0258a 90                             nop        
0258b 90                             nop        
0258c 90                             nop        
0258d 90                             nop        
0258e 90                             nop        
0258f e8cc7c5f07                     call       0x7f431372fc60
02594 0f1f84008c26000c               nop        dword ptr [rax + rax + 0xc00268c]
0259c 8b8424d8010000                 mov        eax, dword ptr [rsp + 0x1d8]
025a3 83c008                         add        eax, 8
025a6 8bbc24dc010000                 mov        edi, dword ptr [rsp + 0x1dc]
025ad 83c708                         add        edi, 8
025b0 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
025b7 be02000000                     mov        esi, 2
025bc 7c05                           jl         0x7f430c137fc3
025be be00000000                     mov        esi, 0
025c3 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
025cd 8b4a7c                         mov        ecx, dword ptr [rdx + 0x7c]
025d0 03ce                           add        ecx, esi
025d2 894a7c                         mov        dword ptr [rdx + 0x7c], ecx
025d5 85f6                           test       esi, esi
025d7 7505                           jne        0x7f430c137fde
025d9 b902000000                     mov        ecx, 2
025de 81e1fe3f0000                   and        ecx, 0x3ffe
025e4 85c9                           test       ecx, ecx
025e6 0f8417290000                   je         0x7f430c13a903
025ec 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
025f0 418502                         test       dword ptr [r10], eax
025f3 3b8424e0010000                 cmp        eax, dword ptr [rsp + 0x1e0]
025fa 48be60a24300437f0000           movabs     rsi, 0x7f430043a260
02604 bab0060000                     mov        edx, 0x6b0
02609 7c05                           jl         0x7f430c138010
0260b bac0060000                     mov        edx, 0x6c0
02610 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
02614 488d4901                       lea        rcx, [rcx + 1]
02618 48890c16                       mov        qword ptr [rsi + rdx], rcx
0261c 0f8c36feffff                   jl         0x7f430c137e58
02622 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
02629 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
02630 48be60a24300437f0000           movabs     rsi, 0x7f430043a260
0263a ff86d0060000                   inc        dword ptr [rsi + 0x6d0]
02640 e9b91b0000                     jmp        0x7f430c139bfe
02645 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
0264c 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
02653 4183f910                       cmp        r9d, 0x10
02657 48be60a24300437f0000           movabs     rsi, 0x7f430043a260
02661 bae8060000                     mov        edx, 0x6e8
02666 7c05                           jl         0x7f430c13806d
02668 baf8060000                     mov        edx, 0x6f8
0266d 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
02671 488d4901                       lea        rcx, [rcx + 1]
02675 48890c16                       mov        qword ptr [rsi + rdx], rcx
02679 0f8ce50c0000                   jl         0x7f430c138d64
0267f 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
02686 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
0268d 899c24f0010000                 mov        dword ptr [rsp + 0x1f0], ebx
02694 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
0269b 90                             nop        
0269c 90                             nop        
0269d 90                             nop        
0269e 90                             nop        
0269f 90                             nop        
026a0 898424ec010000                 mov        dword ptr [rsp + 0x1ec], eax
026a7 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
026af 48be60a24300437f0000           movabs     rsi, 0x7f430043a260
026b9 4883860807000001               add        qword ptr [rsi + 0x708], 1
026c1 48be90e91400437f0000           movabs     rsi, 0x7f430014e990
026cb 8b5678                         mov        edx, dword ptr [rsi + 0x78]
026ce 83c202                         add        edx, 2
026d1 895678                         mov        dword ptr [rsi + 0x78], edx
026d4 81e2feff1f00                   and        edx, 0x1ffffe
026da 85d2                           test       edx, edx
026dc 0f8442280000                   je         0x7f430c13a924
026e2 48be109471e200000000           movabs     rsi, 0xe2719410
026ec 48ba90e91400437f0000           movabs     rdx, 0x7f430014e990
026f6 8b36                           mov        esi, dword ptr [rsi]
026f8 c1ee0d                         shr        esi, 0xd
026fb 48c1e60a                       shl        rsi, 0xa
026ff 41ba00000016                   mov        r10d, 0x16000000
02705 4903f2                         add        rsi, r10
02708 41ba17000000                   mov        r10d, 0x17
0270e 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02712 7436                           je         0x7f430c13814a
02714 4983c202                       add        r10, 2
02718 4983fa1b                       cmp        r10, 0x1b
0271c 75f0                           jne        0x7f430c13810e
0271e 41ba17000000                   mov        r10d, 0x17
02724 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02729 7412                           je         0x7f430c13813d
0272b 4983c202                       add        r10, 2
0272f 4983fa1b                       cmp        r10, 0x1b
02733 75ef                           jne        0x7f430c138124
02735 41ba16000000                   mov        r10d, 0x16
0273b eb11                           jmp        0x7f430c13814e
0273d 50                             push       rax
0273e 4833c0                         xor        rax, rax
02741 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
02747 58                             pop        rax
02748 ebbe                           jmp        0x7f430c138108
0274a 4983c201                       add        r10, 1
0274e 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02753 448b6804                       mov        r13d, dword ptr [rax + 4]
02757 48be90e91400437f0000           movabs     rsi, 0x7f430014e990
02761 488386e000000001               add        qword ptr [rsi + 0xe0], 1
02769 48be40d51400437f0000           movabs     rsi, 0x7f430014d540
02773 8b5678                         mov        edx, dword ptr [rsi + 0x78]
02776 83c202                         add        edx, 2
02779 895678                         mov        dword ptr [rsi + 0x78], edx
0277c 81e2feff1f00                   and        edx, 0x1ffffe
02782 85d2                           test       edx, edx
02784 0f84d4270000                   je         0x7f430c13a95e
0278a 48be40d51400437f0000           movabs     rsi, 0x7f430014d540
02794 4883861001000001               add        qword ptr [rsi + 0x110], 1
0279c 498bf5                         mov        rsi, r13
0279f 83ee0f                         sub        esi, 0xf
027a2 48bad0cb1400437f0000           movabs     rdx, 0x7f430014cbd0
027ac 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
027af 83c102                         add        ecx, 2
027b2 894a78                         mov        dword ptr [rdx + 0x78], ecx
027b5 81e1feff1f00                   and        ecx, 0x1ffffe
027bb 85c9                           test       ecx, ecx
027bd 0f84bc270000                   je         0x7f430c13a97f
027c3 48bad0cb1400437f0000           movabs     rdx, 0x7f430014cbd0
027cd 488382b000000001               add        qword ptr [rdx + 0xb0], 1
027d5 48ba0000000000000000           movabs     rdx, 0
027df ba00000000                     mov        edx, 0
027e4 3bfa                           cmp        edi, edx
027e6 0f8cb4270000                   jl         0x7f430c13a9a0
027ec 3bfe                           cmp        edi, esi
027ee 0f8dcd270000                   jge        0x7f430c13a9c1
027f4 488bf7                         mov        rsi, rdi
027f7 48ba109471e200000000           movabs     rdx, 0xe2719410
02801 488bca                         mov        rcx, rdx
02804 49b890e91400437f0000           movabs     r8, 0x7f430014e990
0280e 8b09                           mov        ecx, dword ptr [rcx]
02810 c1e90d                         shr        ecx, 0xd
02813 48c1e10a                       shl        rcx, 0xa
02817 41ba00000016                   mov        r10d, 0x16000000
0281d 4903ca                         add        rcx, r10
02820 41ba25000000                   mov        r10d, 0x25
02826 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0282a 7436                           je         0x7f430c138262
0282c 4983c202                       add        r10, 2
02830 4983fa29                       cmp        r10, 0x29
02834 75f0                           jne        0x7f430c138226
02836 41ba25000000                   mov        r10d, 0x25
0283c 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
02841 7412                           je         0x7f430c138255
02843 4983c202                       add        r10, 2
02847 4983fa29                       cmp        r10, 0x29
0284b 75ef                           jne        0x7f430c13823c
0284d 41ba24000000                   mov        r10d, 0x24
02853 eb11                           jmp        0x7f430c138266
02855 50                             push       rax
02856 4833c0                         xor        rax, rax
02859 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
0285f 58                             pop        rax
02860 ebbe                           jmp        0x7f430c138220
02862 4983c201                       add        r10, 1
02866 4b8304d001                     add        qword ptr [r8 + r10*8], 1
0286b 48b9d8cc1400437f0000           movabs     rcx, 0x7f430014ccd8
02875 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
02879 4183c002                       add        r8d, 2
0287d 44894178                       mov        dword ptr [rcx + 0x78], r8d
02881 4181e0feff1f00                 and        r8d, 0x1ffffe
02888 4585c0                         test       r8d, r8d
0288b 0f8451270000                   je         0x7f430c13a9e2
02891 48b9d8cc1400437f0000           movabs     rcx, 0x7f430014ccd8
0289b 488381b000000001               add        qword ptr [rcx + 0xb0], 1
028a3 48ba08ce1400437f0000           movabs     rdx, 0x7f430014ce08
028ad 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
028b0 83c102                         add        ecx, 2
028b3 894a78                         mov        dword ptr [rdx + 0x78], ecx
028b6 81e1feff1f00                   and        ecx, 0x1ffffe
028bc 85c9                           test       ecx, ecx
028be 0f843f270000                   je         0x7f430c13aa03
028c4 48ba08ce1400437f0000           movabs     rdx, 0x7f430014ce08
028ce ff82c0000000                   inc        dword ptr [rdx + 0xc0]
028d4 4489ac24e8010000               mov        dword ptr [rsp + 0x1e8], r13d
028dc 89bc24e4010000                 mov        dword ptr [rsp + 0x1e4], edi
028e3 48ba081472e200000000           movabs     rdx, 0xe2721408
028ed 488bca                         mov        rcx, rdx
028f0 49b890e91400437f0000           movabs     r8, 0x7f430014e990
028fa 48b90098011700000000           movabs     rcx, 0x17019800
02904 41ba2b000000                   mov        r10d, 0x2b
0290a 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0290e 7436                           je         0x7f430c138346
02910 4983c202                       add        r10, 2
02914 4983fa2f                       cmp        r10, 0x2f
02918 75f0                           jne        0x7f430c13830a
0291a 41ba2b000000                   mov        r10d, 0x2b
02920 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
02925 7412                           je         0x7f430c138339
02927 4983c202                       add        r10, 2
0292b 4983fa2f                       cmp        r10, 0x2f
0292f 75ef                           jne        0x7f430c138320
02931 41ba2a000000                   mov        r10d, 0x2a
02937 eb11                           jmp        0x7f430c13834a
02939 50                             push       rax
0293a 4833c0                         xor        rax, rax
0293d f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
02943 58                             pop        rax
02944 ebbe                           jmp        0x7f430c138304
02946 4983c201                       add        r10, 1
0294a 4b8304d001                     add        qword ptr [r8 + r10*8], 1
0294f 48b960eb1400437f0000           movabs     rcx, 0x7f430014eb60
02959 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
0295d 4183c002                       add        r8d, 2
02961 44894178                       mov        dword ptr [rcx + 0x78], r8d
02965 4181e0feff1f00                 and        r8d, 0x1ffffe
0296c 4585c0                         test       r8d, r8d
0296f 0f84af260000                   je         0x7f430c13aa24
02975 488bca                         mov        rcx, rdx
02978 49b860eb1400437f0000           movabs     r8, 0x7f430014eb60
02982 498380b000000001               add        qword ptr [r8 + 0xb0], 1
0298a 48b948ec1400437f0000           movabs     rcx, 0x7f430014ec48
02994 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
02998 4183c002                       add        r8d, 2
0299c 44894178                       mov        dword ptr [rcx + 0x78], r8d
029a0 4181e0feff1f00                 and        r8d, 0x1ffffe
029a7 4585c0                         test       r8d, r8d
029aa 0f8495260000                   je         0x7f430c13aa45
029b0 48b948ec1400437f0000           movabs     rcx, 0x7f430014ec48
029ba 48ba0098011700000000           movabs     rdx, 0x17019800
029c4 41ba17000000                   mov        r10d, 0x17
029ca 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
029ce 7436                           je         0x7f430c138406
029d0 4983c202                       add        r10, 2
029d4 4983fa1b                       cmp        r10, 0x1b
029d8 75f0                           jne        0x7f430c1383ca
029da 41ba17000000                   mov        r10d, 0x17
029e0 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
029e5 7412                           je         0x7f430c1383f9
029e7 4983c202                       add        r10, 2
029eb 4983fa1b                       cmp        r10, 0x1b
029ef 75ef                           jne        0x7f430c1383e0
029f1 41ba16000000                   mov        r10d, 0x16
029f7 eb11                           jmp        0x7f430c13840a
029f9 50                             push       rax
029fa 4833c0                         xor        rax, rax
029fd f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02a03 58                             pop        rax
02a04 ebbe                           jmp        0x7f430c1383c4
02a06 4983c201                       add        r10, 1
02a0a 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02a0f 48bac0d61400437f0000           movabs     rdx, 0x7f430014d6c0
02a19 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02a1c 83c102                         add        ecx, 2
02a1f 894a78                         mov        dword ptr [rdx + 0x78], ecx
02a22 81e1feff1f00                   and        ecx, 0x1ffffe
02a28 85c9                           test       ecx, ecx
02a2a 0f8436260000                   je         0x7f430c13aa66
02a30 48ba109471e200000000           movabs     rdx, 0xe2719410
02a3a 488bca                         mov        rcx, rdx
02a3d 49b848ec1400437f0000           movabs     r8, 0x7f430014ec48
02a47 8b09                           mov        ecx, dword ptr [rcx]
02a49 c1e90d                         shr        ecx, 0xd
02a4c 48c1e10a                       shl        rcx, 0xa
02a50 41ba00000016                   mov        r10d, 0x16000000
02a56 4903ca                         add        rcx, r10
02a59 41ba1d000000                   mov        r10d, 0x1d
02a5f 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
02a63 7436                           je         0x7f430c13849b
02a65 4983c202                       add        r10, 2
02a69 4983fa21                       cmp        r10, 0x21
02a6d 75f0                           jne        0x7f430c13845f
02a6f 41ba1d000000                   mov        r10d, 0x1d
02a75 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
02a7a 7412                           je         0x7f430c13848e
02a7c 4983c202                       add        r10, 2
02a80 4983fa21                       cmp        r10, 0x21
02a84 75ef                           jne        0x7f430c138475
02a86 41ba1c000000                   mov        r10d, 0x1c
02a8c eb11                           jmp        0x7f430c13849f
02a8e 50                             push       rax
02a8f 4833c0                         xor        rax, rax
02a92 f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
02a98 58                             pop        rax
02a99 ebbe                           jmp        0x7f430c138459
02a9b 4983c201                       add        r10, 1
02a9f 4b8304d001                     add        qword ptr [r8 + r10*8], 1
02aa4 48b948ec1400437f0000           movabs     rcx, 0x7f430014ec48
02aae 8b12                           mov        edx, dword ptr [rdx]
02ab0 c1ea0d                         shr        edx, 0xd
02ab3 48c1e20a                       shl        rdx, 0xa
02ab7 41ba00000016                   mov        r10d, 0x16000000
02abd 4903d2                         add        rdx, r10
02ac0 41ba23000000                   mov        r10d, 0x23
02ac6 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02aca 7436                           je         0x7f430c138502
02acc 4983c202                       add        r10, 2
02ad0 4983fa27                       cmp        r10, 0x27
02ad4 75f0                           jne        0x7f430c1384c6
02ad6 41ba23000000                   mov        r10d, 0x23
02adc 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02ae1 7412                           je         0x7f430c1384f5
02ae3 4983c202                       add        r10, 2
02ae7 4983fa27                       cmp        r10, 0x27
02aeb 75ef                           jne        0x7f430c1384dc
02aed 41ba22000000                   mov        r10d, 0x22
02af3 eb11                           jmp        0x7f430c138506
02af5 50                             push       rax
02af6 4833c0                         xor        rax, rax
02af9 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02aff 58                             pop        rax
02b00 ebbe                           jmp        0x7f430c1384c0
02b02 4983c201                       add        r10, 1
02b06 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02b0b 48ba48ec1400437f0000           movabs     rdx, 0x7f430014ec48
02b15 4883824001000001               add        qword ptr [rdx + 0x140], 1
02b1d 48ba88d71400437f0000           movabs     rdx, 0x7f430014d788
02b27 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02b2a 83c102                         add        ecx, 2
02b2d 894a78                         mov        dword ptr [rdx + 0x78], ecx
02b30 81e1feff1f00                   and        ecx, 0x1ffffe
02b36 85c9                           test       ecx, ecx
02b38 0f8449250000                   je         0x7f430c13aa87
02b3e 48ba48ec1400437f0000           movabs     rdx, 0x7f430014ec48
02b48 4883825001000001               add        qword ptr [rdx + 0x150], 1
02b50 4c63f6                         movsxd     r14, esi
02b53 be08000000                     mov        esi, 8
02b58 4d8bce                         mov        r9, r14
02b5b 4c03ce                         add        r9, rsi
02b5e 48be80b91400437f0000           movabs     rsi, 0x7f430014b980
02b68 8b5678                         mov        edx, dword ptr [rsi + 0x78]
02b6b 83c202                         add        edx, 2
02b6e 895678                         mov        dword ptr [rsi + 0x78], edx
02b71 81e2feff1f00                   and        edx, 0x1ffffe
02b77 85d2                           test       edx, edx
02b79 0f8429250000                   je         0x7f430c13aaa8
02b7f 48be80b91400437f0000           movabs     rsi, 0x7f430014b980
02b89 488386e000000001               add        qword ptr [rsi + 0xe0], 1
02b91 48be00bb1400437f0000           movabs     rsi, 0x7f430014bb00
02b9b 8b5678                         mov        edx, dword ptr [rsi + 0x78]
02b9e 83c202                         add        edx, 2
02ba1 895678                         mov        dword ptr [rsi + 0x78], edx
02ba4 81e2feff1f00                   and        edx, 0x1ffffe
02baa 85d2                           test       edx, edx
02bac 0f8417250000                   je         0x7f430c13aac9
02bb2 48be48ec1400437f0000           movabs     rsi, 0x7f430014ec48
02bbc 488db660010000                 lea        rsi, [rsi + 0x160]
02bc3 48bad86c72e200000000           movabs     rdx, 0xe2726cd8
02bcd 4885d2                         test       rdx, rdx
02bd0 0f8514000000                   jne        0x7f430c1385ea
02bd6 48bf75489a2a437f0000           movabs     rdi, 0x7f432a9a4875
02be0 4883e4f0                       and        rsp, 0xfffffffffffffff0
02be4 e8f765ca1f                     call       0x7f432bddebe0
02be9 f4                             hlt        
02bea 8b12                           mov        edx, dword ptr [rdx]
02bec c1ea0d                         shr        edx, 0xd
02bef 48c1e20a                       shl        rdx, 0xa
02bf3 41ba00000016                   mov        r10d, 0x16000000
02bf9 4903d2                         add        rdx, r10
02bfc 52                             push       rdx
02bfd 48ba00f0011700000000           movabs     rdx, 0x1701f000
02c07 483b1424                       cmp        rdx, qword ptr [rsp]
02c0b 0f8414000000                   je         0x7f430c138625
02c11 48bf8843a22a437f0000           movabs     rdi, 0x7f432aa24388
02c1b 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c1f e8bc65ca1f                     call       0x7f432bddebe0
02c24 f4                             hlt        
02c25 5a                             pop        rdx
02c26 48ba00f0011700000000           movabs     rdx, 0x1701f000
02c30 4c8bd2                         mov        r10, rdx
02c33 483316                         xor        rdx, qword ptr [rsi]
02c36 48f7c2fcffffff                 test       rdx, -4
02c3d 742a                           je         0x7f430c138669
02c3f f6c202                         test       dl, 2
02c42 7525                           jne        0x7f430c138669
02c44 48f706feffffff                 test       qword ptr [rsi], -2
02c4b 7415                           je         0x7f430c138662
02c4d 498bd2                         mov        rdx, r10
02c50 483316                         xor        rdx, qword ptr [rsi]
02c53 48f7c2fcffffff                 test       rdx, -4
02c5a 740d                           je         0x7f430c138669
02c5c 48830e02                       or         qword ptr [rsi], 2
02c60 eb07                           jmp        0x7f430c138669
02c62 488916                         mov        qword ptr [rsi], rdx
02c65 4883e2fc                       and        rdx, 0xfffffffffffffffc
02c69 48be48ec1400437f0000           movabs     rsi, 0x7f430014ec48
02c73 4883867001000001               add        qword ptr [rsi + 0x170], 1
02c7b 48be589471e200000000           movabs     rsi, 0xe2719458
02c85 ba02000000                     mov        edx, 2
02c8a b910000000                     mov        ecx, 0x10
02c8f 4c8bc0                         mov        r8, rax
02c92 bf00000000                     mov        edi, 0
02c97 48890424                       mov        qword ptr [rsp], rax
02c9b 4c89742408                     mov        qword ptr [rsp + 8], r14
02ca0 49ba109471e200000000           movabs     r10, 0xe2719410
02caa 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02caf 49bad86c72e200000000           movabs     r10, 0xe2726cd8
02cb9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02cbe 90                             nop        
02cbf e89c755f07                     call       0x7f431372fc60
02cc4 0f1f8400bc2d000e               nop        dword ptr [rax + rax + 0xe002dbc]
02ccc 4885c0                         test       rax, rax
02ccf 48bb48ec1400437f0000           movabs     rbx, 0x7f430014ec48
02cd9 750c                           jne        0x7f430c1386e7
02cdb 808b7901000001                 or         byte ptr [rbx + 0x179], 1
02ce2 e988000000                     jmp        0x7f430c13876f
02ce7 8b38                           mov        edi, dword ptr [rax]
02ce9 c1ef0d                         shr        edi, 0xd
02cec 48c1e70a                       shl        rdi, 0xa
02cf0 41ba00000016                   mov        r10d, 0x16000000
02cf6 4903fa                         add        rdi, r10
02cf9 41ba31000000                   mov        r10d, 0x31
02cff 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
02d03 7436                           je         0x7f430c13873b
02d05 4983c202                       add        r10, 2
02d09 4983fa35                       cmp        r10, 0x35
02d0d 75f0                           jne        0x7f430c1386ff
02d0f 41ba31000000                   mov        r10d, 0x31
02d15 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02d1a 7412                           je         0x7f430c13872e
02d1c 4983c202                       add        r10, 2
02d20 4983fa35                       cmp        r10, 0x35
02d24 75ef                           jne        0x7f430c138715
02d26 41ba30000000                   mov        r10d, 0x30
02d2c eb11                           jmp        0x7f430c13873f
02d2e 50                             push       rax
02d2f 4833c0                         xor        rax, rax
02d32 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
02d38 58                             pop        rax
02d39 ebbe                           jmp        0x7f430c1386f9
02d3b 4983c201                       add        r10, 1
02d3f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02d44 48bf0080001700000000           movabs     rdi, 0x17008000
02d4e 8b18                           mov        ebx, dword ptr [rax]
02d50 c1eb0d                         shr        ebx, 0xd
02d53 48c1e30a                       shl        rbx, 0xa
02d57 41ba00000016                   mov        r10d, 0x16000000
02d5d 4903da                         add        rbx, r10
02d60 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
02d64 0f8580230000                   jne        0x7f430c13aaea
02d6a e900000000                     jmp        0x7f430c13876f
02d6f 488bf8                         mov        rdi, rax
02d72 4889bc24f8010000               mov        qword ptr [rsp + 0x1f8], rdi
02d7a 483b07                         cmp        rax, qword ptr [rdi]
02d7d 488bf7                         mov        rsi, rdi
02d80 48bb60a24300437f0000           movabs     rbx, 0x7f430043a260
02d8a 8b36                           mov        esi, dword ptr [rsi]
02d8c c1ee0d                         shr        esi, 0xd
02d8f 48c1e60a                       shl        rsi, 0xa
02d93 41ba00000016                   mov        r10d, 0x16000000
02d99 4903f2                         add        rsi, r10
02d9c 41bae4000000                   mov        r10d, 0xe4
02da2 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02da6 743c                           je         0x7f430c1387e4
02da8 4983c202                       add        r10, 2
02dac 4981fae8000000                 cmp        r10, 0xe8
02db3 75ed                           jne        0x7f430c1387a2
02db5 41bae4000000                   mov        r10d, 0xe4
02dbb 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02dc0 7415                           je         0x7f430c1387d7
02dc2 4983c202                       add        r10, 2
02dc6 4981fae8000000                 cmp        r10, 0xe8
02dcd 75ec                           jne        0x7f430c1387bb
02dcf 41bae3000000                   mov        r10d, 0xe3
02dd5 eb11                           jmp        0x7f430c1387e8
02dd7 50                             push       rax
02dd8 4833c0                         xor        rax, rax
02ddb f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02de1 58                             pop        rax
02de2 ebb8                           jmp        0x7f430c13879c
02de4 4983c201                       add        r10, 1
02de8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02ded 48be20f01400437f0000           movabs     rsi, 0x7f430014f020
02df7 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
02dfa 83c302                         add        ebx, 2
02dfd 895e78                         mov        dword ptr [rsi + 0x78], ebx
02e00 81e3feff1f00                   and        ebx, 0x1ffffe
02e06 85db                           test       ebx, ebx
02e08 0f8412230000                   je         0x7f430c13ab20
02e0e 488bf7                         mov        rsi, rdi
02e11 48bb20f01400437f0000           movabs     rbx, 0x7f430014f020
02e1b 8b36                           mov        esi, dword ptr [rsi]
02e1d c1ee0d                         shr        esi, 0xd
02e20 48c1e60a                       shl        rsi, 0xa
02e24 41ba00000016                   mov        r10d, 0x16000000
02e2a 4903f2                         add        rsi, r10
02e2d 41ba17000000                   mov        r10d, 0x17
02e33 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02e37 7436                           je         0x7f430c13886f
02e39 4983c202                       add        r10, 2
02e3d 4983fa1b                       cmp        r10, 0x1b
02e41 75f0                           jne        0x7f430c138833
02e43 41ba17000000                   mov        r10d, 0x17
02e49 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02e4e 7412                           je         0x7f430c138862
02e50 4983c202                       add        r10, 2
02e54 4983fa1b                       cmp        r10, 0x1b
02e58 75ef                           jne        0x7f430c138849
02e5a 41ba16000000                   mov        r10d, 0x16
02e60 eb11                           jmp        0x7f430c138873
02e62 50                             push       rax
02e63 4833c0                         xor        rax, rax
02e66 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02e6c 58                             pop        rax
02e6d ebbe                           jmp        0x7f430c13882d
02e6f 4983c201                       add        r10, 1
02e73 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02e78 488bf7                         mov        rsi, rdi
02e7b 90                             nop        
02e7c 90                             nop        
02e7d 48b8f0fb45e0427f0000           movabs     rax, 0x7f42e045fbf0
02e87 e8d46e5f07                     call       0x7f431372f760
02e8c 0f1f8400842f000f               nop        dword ptr [rax + rax + 0xf002f84]
02e94 48be20f01400437f0000           movabs     rsi, 0x7f430014f020
02e9e 488386e000000001               add        qword ptr [rsi + 0xe0], 1
02ea6 48be40d51400437f0000           movabs     rsi, 0x7f430014d540
02eb0 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
02eb3 83c702                         add        edi, 2
02eb6 897e78                         mov        dword ptr [rsi + 0x78], edi
02eb9 81e7feff1f00                   and        edi, 0x1ffffe
02ebf 85ff                           test       edi, edi
02ec1 0f847a220000                   je         0x7f430c13ab41
02ec7 448bac24e8010000               mov        r13d, dword ptr [rsp + 0x1e8]
02ecf 8bbc24ec010000                 mov        edi, dword ptr [rsp + 0x1ec]
02ed6 48be40d51400437f0000           movabs     rsi, 0x7f430014d540
02ee0 4883861001000001               add        qword ptr [rsi + 0x110], 1
02ee8 ffc8                           dec        eax
02eea 442be8                         sub        r13d, eax
02eed 48bed0cb1400437f0000           movabs     rsi, 0x7f430014cbd0
02ef7 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
02efa 83c302                         add        ebx, 2
02efd 895e78                         mov        dword ptr [rsi + 0x78], ebx
02f00 81e3feff1f00                   and        ebx, 0x1ffffe
02f06 85db                           test       ebx, ebx
02f08 0f8454220000                   je         0x7f430c13ab62
02f0e 48bed0cb1400437f0000           movabs     rsi, 0x7f430014cbd0
02f18 488386b000000001               add        qword ptr [rsi + 0xb0], 1
02f20 48be0000000000000000           movabs     rsi, 0
02f2a be00000000                     mov        esi, 0
02f2f 3bfe                           cmp        edi, esi
02f31 0f8c4c220000                   jl         0x7f430c13ab83
02f37 413bfd                         cmp        edi, r13d
02f3a 0f8d64220000                   jge        0x7f430c13aba4
02f40 488bc7                         mov        rax, rdi
02f43 898424f4010000                 mov        dword ptr [rsp + 0x1f4], eax
02f4a 89bc24ec010000                 mov        dword ptr [rsp + 0x1ec], edi
02f51 488bbc24f8010000               mov        rdi, qword ptr [rsp + 0x1f8]
02f59 488bf7                         mov        rsi, rdi
02f5c 48b920f01400437f0000           movabs     rcx, 0x7f430014f020
02f66 8b36                           mov        esi, dword ptr [rsi]
02f68 c1ee0d                         shr        esi, 0xd
02f6b 48c1e60a                       shl        rsi, 0xa
02f6f 41ba00000016                   mov        r10d, 0x16000000
02f75 4903f2                         add        rsi, r10
02f78 41ba1f000000                   mov        r10d, 0x1f
02f7e 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
02f82 7436                           je         0x7f430c1389ba
02f84 4983c202                       add        r10, 2
02f88 4983fa23                       cmp        r10, 0x23
02f8c 75f0                           jne        0x7f430c13897e
02f8e 41ba1f000000                   mov        r10d, 0x1f
02f94 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02f99 7412                           je         0x7f430c1389ad
02f9b 4983c202                       add        r10, 2
02f9f 4983fa23                       cmp        r10, 0x23
02fa3 75ef                           jne        0x7f430c138994
02fa5 41ba1e000000                   mov        r10d, 0x1e
02fab eb11                           jmp        0x7f430c1389be
02fad 50                             push       rax
02fae 4833c0                         xor        rax, rax
02fb1 f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
02fb7 58                             pop        rax
02fb8 ebbe                           jmp        0x7f430c138978
02fba 4983c201                       add        r10, 1
02fbe 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02fc3 488bf7                         mov        rsi, rdi
02fc6 90                             nop        
02fc7 90                             nop        
02fc8 90                             nop        
02fc9 90                             nop        
02fca 90                             nop        
02fcb 90                             nop        
02fcc 90                             nop        
02fcd 48b818fc45e0427f0000           movabs     rax, 0x7f42e045fc18
02fd7 e8846d5f07                     call       0x7f431372f760
02fdc 0f1f8400d4300010               nop        dword ptr [rax + rax + 0x100030d4]
02fe4 483b00                         cmp        rax, qword ptr [rax]
02fe7 488bf0                         mov        rsi, rax
02fea 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
02ff4 8b36                           mov        esi, dword ptr [rsi]
02ff6 c1ee0d                         shr        esi, 0xd
02ff9 48c1e60a                       shl        rsi, 0xa
02ffd 41ba00000016                   mov        r10d, 0x16000000
03003 4903f2                         add        rsi, r10
03006 41ba25000000                   mov        r10d, 0x25
0300c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03010 7436                           je         0x7f430c138a48
03012 4983c202                       add        r10, 2
03016 4983fa29                       cmp        r10, 0x29
0301a 75f0                           jne        0x7f430c138a0c
0301c 41ba25000000                   mov        r10d, 0x25
03022 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03027 7412                           je         0x7f430c138a3b
03029 4983c202                       add        r10, 2
0302d 4983fa29                       cmp        r10, 0x29
03031 75ef                           jne        0x7f430c138a22
03033 41ba24000000                   mov        r10d, 0x24
03039 eb11                           jmp        0x7f430c138a4c
0303b 50                             push       rax
0303c 4833c0                         xor        rax, rax
0303f f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03045 58                             pop        rax
03046 ebbe                           jmp        0x7f430c138a06
03048 4983c201                       add        r10, 1
0304c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03051 8b7024                         mov        esi, dword ptr [rax + 0x24]
03054 4c3b25bd798d20                 cmp        r12, qword ptr [rip + 0x208d79bd]
0305b 0f8414000000                   je         0x7f430c138a75
03061 48bf3823ae2a437f0000           movabs     rdi, 0x7f432aae2338
0306b 4883e4f0                       and        rsp, 0xfffffffffffffff0
0306f e86c61ca1f                     call       0x7f432bddebe0
03074 f4                             hlt        
03075 488bd0                         mov        rdx, rax
03078 48b920f01400437f0000           movabs     rcx, 0x7f430014f020
03082 8b12                           mov        edx, dword ptr [rdx]
03084 c1ea0d                         shr        edx, 0xd
03087 48c1e20a                       shl        rdx, 0xa
0308b 41ba00000016                   mov        r10d, 0x16000000
03091 4903d2                         add        rdx, r10
03094 41ba2b000000                   mov        r10d, 0x2b
0309a 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0309e 7436                           je         0x7f430c138ad6
030a0 4983c202                       add        r10, 2
030a4 4983fa2f                       cmp        r10, 0x2f
030a8 75f0                           jne        0x7f430c138a9a
030aa 41ba2b000000                   mov        r10d, 0x2b
030b0 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
030b5 7412                           je         0x7f430c138ac9
030b7 4983c202                       add        r10, 2
030bb 4983fa2f                       cmp        r10, 0x2f
030bf 75ef                           jne        0x7f430c138ab0
030c1 41ba2a000000                   mov        r10d, 0x2a
030c7 eb11                           jmp        0x7f430c138ada
030c9 50                             push       rax
030ca 4833c0                         xor        rax, rax
030cd f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
030d3 58                             pop        rax
030d4 ebbe                           jmp        0x7f430c138a94
030d6 4983c201                       add        r10, 1
030da 4a8304d101                     add        qword ptr [rcx + r10*8], 1
030df 8b4804                         mov        ecx, dword ptr [rax + 4]
030e2 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
030ec 4883828001000001               add        qword ptr [rdx + 0x180], 1
030f4 48ba88d71400437f0000           movabs     rdx, 0x7f430014d788
030fe 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
03102 4183c002                       add        r8d, 2
03106 44894278                       mov        dword ptr [rdx + 0x78], r8d
0310a 4181e0feff1f00                 and        r8d, 0x1ffffe
03111 4585c0                         test       r8d, r8d
03114 0f84c4200000                   je         0x7f430c13abde
0311a 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
03124 4883829001000001               add        qword ptr [rdx + 0x190], 1
0312c 8b8424f4010000                 mov        eax, dword ptr [rsp + 0x1f4]
03133 4863c0                         movsxd     rax, eax
03136 ba08000000                     mov        edx, 8
0313b 4c8bc8                         mov        r9, rax
0313e 4c03ca                         add        r9, rdx
03141 48ba80b91400437f0000           movabs     rdx, 0x7f430014b980
0314b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
0314f 4183c002                       add        r8d, 2
03153 44894278                       mov        dword ptr [rdx + 0x78], r8d
03157 4181e0feff1f00                 and        r8d, 0x1ffffe
0315e 4585c0                         test       r8d, r8d
03161 0f8498200000                   je         0x7f430c13abff
03167 48ba80b91400437f0000           movabs     rdx, 0x7f430014b980
03171 488382e000000001               add        qword ptr [rdx + 0xe0], 1
03179 48ba00bb1400437f0000           movabs     rdx, 0x7f430014bb00
03183 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
03187 4183c002                       add        r8d, 2
0318b 44894278                       mov        dword ptr [rdx + 0x78], r8d
0318f 4181e0feff1f00                 and        r8d, 0x1ffffe
03196 4585c0                         test       r8d, r8d
03199 0f8481200000                   je         0x7f430c13ac20
0319f 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
031a9 488d92a0010000                 lea        rdx, [rdx + 0x1a0]
031b0 49b8c00a73e200000000           movabs     r8, 0xe2730ac0
031ba 4d85c0                         test       r8, r8
031bd 0f8514000000                   jne        0x7f430c138bd7
031c3 48bf75489a2a437f0000           movabs     rdi, 0x7f432a9a4875
031cd 4883e4f0                       and        rsp, 0xfffffffffffffff0
031d1 e80a60ca1f                     call       0x7f432bddebe0
031d6 f4                             hlt        
031d7 458b00                         mov        r8d, dword ptr [r8]
031da 41c1e80d                       shr        r8d, 0xd
031de 49c1e00a                       shl        r8, 0xa
031e2 41ba00000016                   mov        r10d, 0x16000000
031e8 4d03c2                         add        r8, r10
031eb 4150                           push       r8
031ed 49b80000021700000000           movabs     r8, 0x17020000
031f7 4c3b0424                       cmp        r8, qword ptr [rsp]
031fb 0f8414000000                   je         0x7f430c138c15
03201 48bf8843a22a437f0000           movabs     rdi, 0x7f432aa24388
0320b 4883e4f0                       and        rsp, 0xfffffffffffffff0
0320f e8cc5fca1f                     call       0x7f432bddebe0
03214 f4                             hlt        
03215 4158                           pop        r8
03217 49b80000021700000000           movabs     r8, 0x17020000
03221 4d8bd0                         mov        r10, r8
03224 4c3302                         xor        r8, qword ptr [rdx]
03227 49f7c0fcffffff                 test       r8, -4
0322e 742b                           je         0x7f430c138c5b
03230 41f6c002                       test       r8b, 2
03234 7525                           jne        0x7f430c138c5b
03236 48f702feffffff                 test       qword ptr [rdx], -2
0323d 7415                           je         0x7f430c138c54
0323f 4d8bc2                         mov        r8, r10
03242 4c3302                         xor        r8, qword ptr [rdx]
03245 49f7c0fcffffff                 test       r8, -4
0324c 740d                           je         0x7f430c138c5b
0324e 48830a02                       or         qword ptr [rdx], 2
03252 eb07                           jmp        0x7f430c138c5b
03254 4c8902                         mov        qword ptr [rdx], r8
03257 4983e0fc                       and        r8, 0xfffffffffffffffc
0325b 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
03265 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
0326d ba02000000                     mov        edx, 2
03272 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
0327a bf00000000                     mov        edi, 0
0327f 488b9c24f8010000               mov        rbx, qword ptr [rsp + 0x1f8]
03287 48891c24                       mov        qword ptr [rsp], rbx
0328b 488b9c2438010000               mov        rbx, qword ptr [rsp + 0x138]
03293 48895c2408                     mov        qword ptr [rsp + 8], rbx
03298 4889442410                     mov        qword ptr [rsp + 0x10], rax
0329d 49bac00a73e200000000           movabs     r10, 0xe2730ac0
032a7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
032ac 90                             nop        
032ad 90                             nop        
032ae 90                             nop        
032af e8ac6f5f07                     call       0x7f431372fc60
032b4 0f1f8400ac330011               nop        dword ptr [rax + rax + 0x110033ac]
032bc 8b8424ec010000                 mov        eax, dword ptr [rsp + 0x1ec]
032c3 83c010                         add        eax, 0x10
032c6 8bbc24e4010000                 mov        edi, dword ptr [rsp + 0x1e4]
032cd 83c710                         add        edi, 0x10
032d0 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
032d7 ba02000000                     mov        edx, 2
032dc 7c05                           jl         0x7f430c138ce3
032de ba00000000                     mov        edx, 0
032e3 48b960a24300437f0000           movabs     rcx, 0x7f430043a260
032ed 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
032f1 4403c2                         add        r8d, edx
032f4 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
032f8 85d2                           test       edx, edx
032fa 7506                           jne        0x7f430c138d02
032fc 41b802000000                   mov        r8d, 2
03302 4181e0fe3f0000                 and        r8d, 0x3ffe
03309 4585c0                         test       r8d, r8d
0330c 0f842f1f0000                   je         0x7f430c13ac41
03312 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03316 418502                         test       dword ptr [r10], eax
03319 3b8424f0010000                 cmp        eax, dword ptr [rsp + 0x1f0]
03320 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
0332a b948070000                     mov        ecx, 0x748
0332f 7c05                           jl         0x7f430c138d36
03331 b958070000                     mov        ecx, 0x758
03336 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0333a 4d8d4001                       lea        r8, [r8 + 1]
0333e 4c89040a                       mov        qword ptr [rdx + rcx], r8
03342 0f8c58f3ffff                   jl         0x7f430c1380a0
03348 8b9c24f0010000                 mov        ebx, dword ptr [rsp + 0x1f0]
0334f 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
03359 ff8268070000                   inc        dword ptr [rdx + 0x768]
0335f e99a0e0000                     jmp        0x7f430c139bfe
03364 4183f908                       cmp        r9d, 8
03368 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
03372 b980070000                     mov        ecx, 0x780
03377 7c05                           jl         0x7f430c138d7e
03379 b990070000                     mov        ecx, 0x790
0337e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
03382 4d8d4001                       lea        r8, [r8 + 1]
03386 4c89040a                       mov        qword ptr [rdx + rcx], r8
0338a 0f8c06020000                   jl         0x7f430c138f96
03390 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
03397 039c2478010000                 add        ebx, dword ptr [rsp + 0x178]
0339e 899c2408020000                 mov        dword ptr [rsp + 0x208], ebx
033a5 8b8424d0010000                 mov        eax, dword ptr [rsp + 0x1d0]
033ac 90                             nop        
033ad 90                             nop        
033ae 90                             nop        
033af 90                             nop        
033b0 89842400020000                 mov        dword ptr [rsp + 0x200], eax
033b7 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
033bf 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
033c9 488382a007000001               add        qword ptr [rdx + 0x7a0], 1
033d1 48ba20684300437f0000           movabs     rdx, 0x7f4300436820
033db 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
033de 83c102                         add        ecx, 2
033e1 894a78                         mov        dword ptr [rdx + 0x78], ecx
033e4 81e1feff1f00                   and        ecx, 0x1ffffe
033ea 85c9                           test       ecx, ecx
033ec 0f84701e0000                   je         0x7f430c13ac62
033f2 90                             nop        
033f3 90                             nop        
033f4 90                             nop        
033f5 90                             nop        
033f6 90                             nop        
033f7 90                             nop        
033f8 e9951e0000                     jmp        0x7f430c13ac92
033fd 90                             nop        
033fe 90                             nop        
033ff 90                             nop        
03400 90                             nop        
03401 90                             nop        
03402 48ba20684300437f0000           movabs     rdx, 0x7f4300436820
0340c 488d92e0000000                 lea        rdx, [rdx + 0xe0]
03413 4885c0                         test       rax, rax
03416 7510                           jne        0x7f430c138e28
03418 f6420801                       test       byte ptr [rdx + 8], 1
0341c 0f8506000000                   jne        0x7f430c138e28
03422 f048834a0801                   lock or    qword ptr [rdx + 8], 1
03428 48be08566ee200000000           movabs     rsi, 0xe26e5608
03432 488bd6                         mov        rdx, rsi
03435 48b920684300437f0000           movabs     rcx, 0x7f4300436820
0343f 8b12                           mov        edx, dword ptr [rdx]
03441 c1ea0d                         shr        edx, 0xd
03444 48c1e20a                       shl        rdx, 0xa
03448 41ba00000016                   mov        r10d, 0x16000000
0344e 4903d2                         add        rdx, r10
03451 41ba17000000                   mov        r10d, 0x17
03457 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0345b 7436                           je         0x7f430c138e93
0345d 4983c202                       add        r10, 2
03461 4983fa1b                       cmp        r10, 0x1b
03465 75f0                           jne        0x7f430c138e57
03467 41ba17000000                   mov        r10d, 0x17
0346d 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03472 7412                           je         0x7f430c138e86
03474 4983c202                       add        r10, 2
03478 4983fa1b                       cmp        r10, 0x1b
0347c 75ef                           jne        0x7f430c138e6d
0347e 41ba16000000                   mov        r10d, 0x16
03484 eb11                           jmp        0x7f430c138e97
03486 50                             push       rax
03487 4833c0                         xor        rax, rax
0348a f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03490 58                             pop        rax
03491 ebbe                           jmp        0x7f430c138e51
03493 4983c201                       add        r10, 1
03497 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0349c 488bd0                         mov        rdx, rax
0349f 488bcf                         mov        rcx, rdi
034a2 89bc2404020000                 mov        dword ptr [rsp + 0x204], edi
034a9 90                             nop        
034aa 90                             nop        
034ab 90                             nop        
034ac 90                             nop        
034ad 90                             nop        
034ae 90                             nop        
034af e8ac635f07                     call       0x7f431372f260
034b4 0f1f8400ac350013               nop        dword ptr [rax + rax + 0x130035ac]
034bc 48be60a24300437f0000           movabs     rsi, 0x7f430043a260
034c6 488386b007000001               add        qword ptr [rsi + 0x7b0], 1
034ce 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
034d6 8b942400020000                 mov        edx, dword ptr [rsp + 0x200]
034dd 488bc8                         mov        rcx, rax
034e0 90                             nop        
034e1 90                             nop        
034e2 90                             nop        
034e3 90                             nop        
034e4 90                             nop        
034e5 90                             nop        
034e6 90                             nop        
034e7 e8746d5f07                     call       0x7f431372fc60
034ec 0f1f8400e4350014               nop        dword ptr [rax + rax + 0x140035e4]
034f4 8b842400020000                 mov        eax, dword ptr [rsp + 0x200]
034fb 83c008                         add        eax, 8
034fe 8bbc2404020000                 mov        edi, dword ptr [rsp + 0x204]
03505 83c708                         add        edi, 8
03508 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
0350f be02000000                     mov        esi, 2
03514 7c05                           jl         0x7f430c138f1b
03516 be00000000                     mov        esi, 0
0351b 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
03525 8b4a7c                         mov        ecx, dword ptr [rdx + 0x7c]
03528 03ce                           add        ecx, esi
0352a 894a7c                         mov        dword ptr [rdx + 0x7c], ecx
0352d 85f6                           test       esi, esi
0352f 7505                           jne        0x7f430c138f36
03531 b902000000                     mov        ecx, 2
03536 81e1fe3f0000                   and        ecx, 0x3ffe
0353c 85c9                           test       ecx, ecx
0353e 0f84581d0000                   je         0x7f430c13ac9c
03544 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03548 418502                         test       dword ptr [r10], eax
0354b 3b842408020000                 cmp        eax, dword ptr [rsp + 0x208]
03552 48be60a24300437f0000           movabs     rsi, 0x7f430043a260
0355c bac0070000                     mov        edx, 0x7c0
03561 7c05                           jl         0x7f430c138f68
03563 bad0070000                     mov        edx, 0x7d0
03568 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0356c 488d4901                       lea        rcx, [rcx + 1]
03570 48890c16                       mov        qword ptr [rsi + rdx], rcx
03574 0f8c36feffff                   jl         0x7f430c138db0
0357a 8b9c2408020000                 mov        ebx, dword ptr [rsp + 0x208]
03581 48be60a24300437f0000           movabs     rsi, 0x7f430043a260
0358b ff86e0070000                   inc        dword ptr [rsi + 0x7e0]
03591 e9680c0000                     jmp        0x7f430c139bfe
03596 48be60a24300437f0000           movabs     rsi, 0x7f430043a260
035a0 488386f807000001               add        qword ptr [rsi + 0x7f8], 1
035a8 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
035b0 8b9424d0010000                 mov        edx, dword ptr [rsp + 0x1d0]
035b7 488bcf                         mov        rcx, rdi
035ba 4d8bc1                         mov        r8, r9
035bd 448b8c2478010000               mov        r9d, dword ptr [rsp + 0x178]
035c5 90                             nop        
035c6 90                             nop        
035c7 e8946c5f07                     call       0x7f431372fc60
035cc 0f1f8400c4360016               nop        dword ptr [rax + rax + 0x160036c4]
035d4 488bd8                         mov        rbx, rax
035d7 e9220c0000                     jmp        0x7f430c139bfe
035dc 89b424d4010000                 mov        dword ptr [rsp + 0x1d4], esi
035e3 899c24d0010000                 mov        dword ptr [rsp + 0x1d0], ebx
035ea 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
035f2 48be60a24300437f0000           movabs     rsi, 0x7f430043a260
035fc 488386d005000001               add        qword ptr [rsi + 0x5d0], 1
03604 48be90e91400437f0000           movabs     rsi, 0x7f430014e990
0360e 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03611 83c202                         add        edx, 2
03614 895678                         mov        dword ptr [rsi + 0x78], edx
03617 81e2feff1f00                   and        edx, 0x1ffffe
0361d 85d2                           test       edx, edx
0361f 0f84981c0000                   je         0x7f430c13acbd
03625 48be109471e200000000           movabs     rsi, 0xe2719410
0362f 48ba90e91400437f0000           movabs     rdx, 0x7f430014e990
03639 8b36                           mov        esi, dword ptr [rsi]
0363b c1ee0d                         shr        esi, 0xd
0363e 48c1e60a                       shl        rsi, 0xa
03642 41ba00000016                   mov        r10d, 0x16000000
03648 4903f2                         add        rsi, r10
0364b 41ba17000000                   mov        r10d, 0x17
03651 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03655 7436                           je         0x7f430c13908d
03657 4983c202                       add        r10, 2
0365b 4983fa1b                       cmp        r10, 0x1b
0365f 75f0                           jne        0x7f430c139051
03661 41ba17000000                   mov        r10d, 0x17
03667 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
0366c 7412                           je         0x7f430c139080
0366e 4983c202                       add        r10, 2
03672 4983fa1b                       cmp        r10, 0x1b
03676 75ef                           jne        0x7f430c139067
03678 41ba16000000                   mov        r10d, 0x16
0367e eb11                           jmp        0x7f430c139091
03680 50                             push       rax
03681 4833c0                         xor        rax, rax
03684 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
0368a 58                             pop        rax
0368b ebbe                           jmp        0x7f430c13904b
0368d 4983c201                       add        r10, 1
03691 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03696 8b5804                         mov        ebx, dword ptr [rax + 4]
03699 48be90e91400437f0000           movabs     rsi, 0x7f430014e990
036a3 488386e000000001               add        qword ptr [rsi + 0xe0], 1
036ab 48be40d51400437f0000           movabs     rsi, 0x7f430014d540
036b5 8b5678                         mov        edx, dword ptr [rsi + 0x78]
036b8 83c202                         add        edx, 2
036bb 895678                         mov        dword ptr [rsi + 0x78], edx
036be 81e2feff1f00                   and        edx, 0x1ffffe
036c4 85d2                           test       edx, edx
036c6 0f842b1c0000                   je         0x7f430c13acf7
036cc 48be40d51400437f0000           movabs     rsi, 0x7f430014d540
036d6 4883861001000001               add        qword ptr [rsi + 0x110], 1
036de 488bf3                         mov        rsi, rbx
036e1 83ee0f                         sub        esi, 0xf
036e4 48bad0cb1400437f0000           movabs     rdx, 0x7f430014cbd0
036ee 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
036f1 83c102                         add        ecx, 2
036f4 894a78                         mov        dword ptr [rdx + 0x78], ecx
036f7 81e1feff1f00                   and        ecx, 0x1ffffe
036fd 85c9                           test       ecx, ecx
036ff 0f84131c0000                   je         0x7f430c13ad18
03705 48bad0cb1400437f0000           movabs     rdx, 0x7f430014cbd0
0370f 488382b000000001               add        qword ptr [rdx + 0xb0], 1
03717 48ba0000000000000000           movabs     rdx, 0
03721 ba00000000                     mov        edx, 0
03726 3bfa                           cmp        edi, edx
03728 0f8c0b1c0000                   jl         0x7f430c13ad39
0372e 3bfe                           cmp        edi, esi
03730 0f8d241c0000                   jge        0x7f430c13ad5a
03736 48be109471e200000000           movabs     rsi, 0xe2719410
03740 488bd6                         mov        rdx, rsi
03743 48b990e91400437f0000           movabs     rcx, 0x7f430014e990
0374d 8b12                           mov        edx, dword ptr [rdx]
0374f c1ea0d                         shr        edx, 0xd
03752 48c1e20a                       shl        rdx, 0xa
03756 41ba00000016                   mov        r10d, 0x16000000
0375c 4903d2                         add        rdx, r10
0375f 41ba25000000                   mov        r10d, 0x25
03765 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03769 7436                           je         0x7f430c1391a1
0376b 4983c202                       add        r10, 2
0376f 4983fa29                       cmp        r10, 0x29
03773 75f0                           jne        0x7f430c139165
03775 41ba25000000                   mov        r10d, 0x25
0377b 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03780 7412                           je         0x7f430c139194
03782 4983c202                       add        r10, 2
03786 4983fa29                       cmp        r10, 0x29
0378a 75ef                           jne        0x7f430c13917b
0378c 41ba24000000                   mov        r10d, 0x24
03792 eb11                           jmp        0x7f430c1391a5
03794 50                             push       rax
03795 4833c0                         xor        rax, rax
03798 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
0379e 58                             pop        rax
0379f ebbe                           jmp        0x7f430c13915f
037a1 4983c201                       add        r10, 1
037a5 4a8304d101                     add        qword ptr [rcx + r10*8], 1
037aa 48bad8cc1400437f0000           movabs     rdx, 0x7f430014ccd8
037b4 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
037b7 83c102                         add        ecx, 2
037ba 894a78                         mov        dword ptr [rdx + 0x78], ecx
037bd 81e1feff1f00                   and        ecx, 0x1ffffe
037c3 85c9                           test       ecx, ecx
037c5 0f84b01b0000                   je         0x7f430c13ad7b
037cb 48bad8cc1400437f0000           movabs     rdx, 0x7f430014ccd8
037d5 488382b000000001               add        qword ptr [rdx + 0xb0], 1
037dd 48be08ce1400437f0000           movabs     rsi, 0x7f430014ce08
037e7 8b5678                         mov        edx, dword ptr [rsi + 0x78]
037ea 83c202                         add        edx, 2
037ed 895678                         mov        dword ptr [rsi + 0x78], edx
037f0 81e2feff1f00                   and        edx, 0x1ffffe
037f6 85d2                           test       edx, edx
037f8 0f849e1b0000                   je         0x7f430c13ad9c
037fe 48be08ce1400437f0000           movabs     rsi, 0x7f430014ce08
03808 ff86c0000000                   inc        dword ptr [rsi + 0xc0]
0380e 899c240c020000                 mov        dword ptr [rsp + 0x20c], ebx
03815 48be081472e200000000           movabs     rsi, 0xe2721408
0381f 488bd6                         mov        rdx, rsi
03822 48b990e91400437f0000           movabs     rcx, 0x7f430014e990
0382c 48ba0098011700000000           movabs     rdx, 0x17019800
03836 41ba2b000000                   mov        r10d, 0x2b
0383c 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03840 7436                           je         0x7f430c139278
03842 4983c202                       add        r10, 2
03846 4983fa2f                       cmp        r10, 0x2f
0384a 75f0                           jne        0x7f430c13923c
0384c 41ba2b000000                   mov        r10d, 0x2b
03852 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03857 7412                           je         0x7f430c13926b
03859 4983c202                       add        r10, 2
0385d 4983fa2f                       cmp        r10, 0x2f
03861 75ef                           jne        0x7f430c139252
03863 41ba2a000000                   mov        r10d, 0x2a
03869 eb11                           jmp        0x7f430c13927c
0386b 50                             push       rax
0386c 4833c0                         xor        rax, rax
0386f f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03875 58                             pop        rax
03876 ebbe                           jmp        0x7f430c139236
03878 4983c201                       add        r10, 1
0387c 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03881 48ba60eb1400437f0000           movabs     rdx, 0x7f430014eb60
0388b 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0388e 83c102                         add        ecx, 2
03891 894a78                         mov        dword ptr [rdx + 0x78], ecx
03894 81e1feff1f00                   and        ecx, 0x1ffffe
0389a 85c9                           test       ecx, ecx
0389c 0f841b1b0000                   je         0x7f430c13adbd
038a2 488bd6                         mov        rdx, rsi
038a5 48b960eb1400437f0000           movabs     rcx, 0x7f430014eb60
038af 488381b000000001               add        qword ptr [rcx + 0xb0], 1
038b7 48ba48ec1400437f0000           movabs     rdx, 0x7f430014ec48
038c1 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
038c4 83c102                         add        ecx, 2
038c7 894a78                         mov        dword ptr [rdx + 0x78], ecx
038ca 81e1feff1f00                   and        ecx, 0x1ffffe
038d0 85c9                           test       ecx, ecx
038d2 0f84061b0000                   je         0x7f430c13adde
038d8 48ba48ec1400437f0000           movabs     rdx, 0x7f430014ec48
038e2 48be0098011700000000           movabs     rsi, 0x17019800
038ec 41ba17000000                   mov        r10d, 0x17
038f2 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
038f6 7436                           je         0x7f430c13932e
038f8 4983c202                       add        r10, 2
038fc 4983fa1b                       cmp        r10, 0x1b
03900 75f0                           jne        0x7f430c1392f2
03902 41ba17000000                   mov        r10d, 0x17
03908 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
0390d 7412                           je         0x7f430c139321
0390f 4983c202                       add        r10, 2
03913 4983fa1b                       cmp        r10, 0x1b
03917 75ef                           jne        0x7f430c139308
03919 41ba16000000                   mov        r10d, 0x16
0391f eb11                           jmp        0x7f430c139332
03921 50                             push       rax
03922 4833c0                         xor        rax, rax
03925 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
0392b 58                             pop        rax
0392c ebbe                           jmp        0x7f430c1392ec
0392e 4983c201                       add        r10, 1
03932 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03937 48bec0d61400437f0000           movabs     rsi, 0x7f430014d6c0
03941 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03944 83c202                         add        edx, 2
03947 895678                         mov        dword ptr [rsi + 0x78], edx
0394a 81e2feff1f00                   and        edx, 0x1ffffe
03950 85d2                           test       edx, edx
03952 0f84a71a0000                   je         0x7f430c13adff
03958 48be109471e200000000           movabs     rsi, 0xe2719410
03962 488bd6                         mov        rdx, rsi
03965 48b948ec1400437f0000           movabs     rcx, 0x7f430014ec48
0396f 8b12                           mov        edx, dword ptr [rdx]
03971 c1ea0d                         shr        edx, 0xd
03974 48c1e20a                       shl        rdx, 0xa
03978 41ba00000016                   mov        r10d, 0x16000000
0397e 4903d2                         add        rdx, r10
03981 41ba1d000000                   mov        r10d, 0x1d
03987 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0398b 7436                           je         0x7f430c1393c3
0398d 4983c202                       add        r10, 2
03991 4983fa21                       cmp        r10, 0x21
03995 75f0                           jne        0x7f430c139387
03997 41ba1d000000                   mov        r10d, 0x1d
0399d 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
039a2 7412                           je         0x7f430c1393b6
039a4 4983c202                       add        r10, 2
039a8 4983fa21                       cmp        r10, 0x21
039ac 75ef                           jne        0x7f430c13939d
039ae 41ba1c000000                   mov        r10d, 0x1c
039b4 eb11                           jmp        0x7f430c1393c7
039b6 50                             push       rax
039b7 4833c0                         xor        rax, rax
039ba f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
039c0 58                             pop        rax
039c1 ebbe                           jmp        0x7f430c139381
039c3 4983c201                       add        r10, 1
039c7 4a8304d101                     add        qword ptr [rcx + r10*8], 1
039cc 48ba48ec1400437f0000           movabs     rdx, 0x7f430014ec48
039d6 8b36                           mov        esi, dword ptr [rsi]
039d8 c1ee0d                         shr        esi, 0xd
039db 48c1e60a                       shl        rsi, 0xa
039df 41ba00000016                   mov        r10d, 0x16000000
039e5 4903f2                         add        rsi, r10
039e8 41ba23000000                   mov        r10d, 0x23
039ee 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
039f2 7436                           je         0x7f430c13942a
039f4 4983c202                       add        r10, 2
039f8 4983fa27                       cmp        r10, 0x27
039fc 75f0                           jne        0x7f430c1393ee
039fe 41ba23000000                   mov        r10d, 0x23
03a04 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03a09 7412                           je         0x7f430c13941d
03a0b 4983c202                       add        r10, 2
03a0f 4983fa27                       cmp        r10, 0x27
03a13 75ef                           jne        0x7f430c139404
03a15 41ba22000000                   mov        r10d, 0x22
03a1b eb11                           jmp        0x7f430c13942e
03a1d 50                             push       rax
03a1e 4833c0                         xor        rax, rax
03a21 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03a27 58                             pop        rax
03a28 ebbe                           jmp        0x7f430c1393e8
03a2a 4983c201                       add        r10, 1
03a2e 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03a33 48be48ec1400437f0000           movabs     rsi, 0x7f430014ec48
03a3d 4883864001000001               add        qword ptr [rsi + 0x140], 1
03a45 48be88d71400437f0000           movabs     rsi, 0x7f430014d788
03a4f 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03a52 83c202                         add        edx, 2
03a55 895678                         mov        dword ptr [rsi + 0x78], edx
03a58 81e2feff1f00                   and        edx, 0x1ffffe
03a5e 85d2                           test       edx, edx
03a60 0f84ba190000                   je         0x7f430c13ae20
03a66 48be48ec1400437f0000           movabs     rsi, 0x7f430014ec48
03a70 4883865001000001               add        qword ptr [rsi + 0x150], 1
03a78 4c63df                         movsxd     r11, edi
03a7b be08000000                     mov        esi, 8
03a80 4d8bcb                         mov        r9, r11
03a83 4c03ce                         add        r9, rsi
03a86 48be80b91400437f0000           movabs     rsi, 0x7f430014b980
03a90 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03a93 83c202                         add        edx, 2
03a96 895678                         mov        dword ptr [rsi + 0x78], edx
03a99 81e2feff1f00                   and        edx, 0x1ffffe
03a9f 85d2                           test       edx, edx
03aa1 0f849a190000                   je         0x7f430c13ae41
03aa7 48be80b91400437f0000           movabs     rsi, 0x7f430014b980
03ab1 488386e000000001               add        qword ptr [rsi + 0xe0], 1
03ab9 48be00bb1400437f0000           movabs     rsi, 0x7f430014bb00
03ac3 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03ac6 83c202                         add        edx, 2
03ac9 895678                         mov        dword ptr [rsi + 0x78], edx
03acc 81e2feff1f00                   and        edx, 0x1ffffe
03ad2 85d2                           test       edx, edx
03ad4 0f8488190000                   je         0x7f430c13ae62
03ada 48be48ec1400437f0000           movabs     rsi, 0x7f430014ec48
03ae4 488db660010000                 lea        rsi, [rsi + 0x160]
03aeb 48bad86c72e200000000           movabs     rdx, 0xe2726cd8
03af5 4885d2                         test       rdx, rdx
03af8 0f8514000000                   jne        0x7f430c139512
03afe 48bf75489a2a437f0000           movabs     rdi, 0x7f432a9a4875
03b08 4883e4f0                       and        rsp, 0xfffffffffffffff0
03b0c e8cf56ca1f                     call       0x7f432bddebe0
03b11 f4                             hlt        
03b12 8b12                           mov        edx, dword ptr [rdx]
03b14 c1ea0d                         shr        edx, 0xd
03b17 48c1e20a                       shl        rdx, 0xa
03b1b 41ba00000016                   mov        r10d, 0x16000000
03b21 4903d2                         add        rdx, r10
03b24 52                             push       rdx
03b25 48ba00f0011700000000           movabs     rdx, 0x1701f000
03b2f 483b1424                       cmp        rdx, qword ptr [rsp]
03b33 0f8414000000                   je         0x7f430c13954d
03b39 48bf8843a22a437f0000           movabs     rdi, 0x7f432aa24388
03b43 4883e4f0                       and        rsp, 0xfffffffffffffff0
03b47 e89456ca1f                     call       0x7f432bddebe0
03b4c f4                             hlt        
03b4d 5a                             pop        rdx
03b4e 48ba00f0011700000000           movabs     rdx, 0x1701f000
03b58 4c8bd2                         mov        r10, rdx
03b5b 483316                         xor        rdx, qword ptr [rsi]
03b5e 48f7c2fcffffff                 test       rdx, -4
03b65 742a                           je         0x7f430c139591
03b67 f6c202                         test       dl, 2
03b6a 7525                           jne        0x7f430c139591
03b6c 48f706feffffff                 test       qword ptr [rsi], -2
03b73 7415                           je         0x7f430c13958a
03b75 498bd2                         mov        rdx, r10
03b78 483316                         xor        rdx, qword ptr [rsi]
03b7b 48f7c2fcffffff                 test       rdx, -4
03b82 740d                           je         0x7f430c139591
03b84 48830e02                       or         qword ptr [rsi], 2
03b88 eb07                           jmp        0x7f430c139591
03b8a 488916                         mov        qword ptr [rsi], rdx
03b8d 4883e2fc                       and        rdx, 0xfffffffffffffffc
03b91 48be48ec1400437f0000           movabs     rsi, 0x7f430014ec48
03b9b 4883867001000001               add        qword ptr [rsi + 0x170], 1
03ba3 48be589471e200000000           movabs     rsi, 0xe2719458
03bad ba02000000                     mov        edx, 2
03bb2 b910000000                     mov        ecx, 0x10
03bb7 4c8bc0                         mov        r8, rax
03bba bf00000000                     mov        edi, 0
03bbf 48890424                       mov        qword ptr [rsp], rax
03bc3 4c895c2408                     mov        qword ptr [rsp + 8], r11
03bc8 49ba109471e200000000           movabs     r10, 0xe2719410
03bd2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03bd7 49bad86c72e200000000           movabs     r10, 0xe2726cd8
03be1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03be6 90                             nop        
03be7 e874665f07                     call       0x7f431372fc60
03bec 0f1f8400e43c0017               nop        dword ptr [rax + rax + 0x17003ce4]
03bf4 4885c0                         test       rax, rax
03bf7 48bb48ec1400437f0000           movabs     rbx, 0x7f430014ec48
03c01 750c                           jne        0x7f430c13960f
03c03 808b7901000001                 or         byte ptr [rbx + 0x179], 1
03c0a e988000000                     jmp        0x7f430c139697
03c0f 8b38                           mov        edi, dword ptr [rax]
03c11 c1ef0d                         shr        edi, 0xd
03c14 48c1e70a                       shl        rdi, 0xa
03c18 41ba00000016                   mov        r10d, 0x16000000
03c1e 4903fa                         add        rdi, r10
03c21 41ba31000000                   mov        r10d, 0x31
03c27 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
03c2b 7436                           je         0x7f430c139663
03c2d 4983c202                       add        r10, 2
03c31 4983fa35                       cmp        r10, 0x35
03c35 75f0                           jne        0x7f430c139627
03c37 41ba31000000                   mov        r10d, 0x31
03c3d 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03c42 7412                           je         0x7f430c139656
03c44 4983c202                       add        r10, 2
03c48 4983fa35                       cmp        r10, 0x35
03c4c 75ef                           jne        0x7f430c13963d
03c4e 41ba30000000                   mov        r10d, 0x30
03c54 eb11                           jmp        0x7f430c139667
03c56 50                             push       rax
03c57 4833c0                         xor        rax, rax
03c5a f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
03c60 58                             pop        rax
03c61 ebbe                           jmp        0x7f430c139621
03c63 4983c201                       add        r10, 1
03c67 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03c6c 48bf0080001700000000           movabs     rdi, 0x17008000
03c76 8b18                           mov        ebx, dword ptr [rax]
03c78 c1eb0d                         shr        ebx, 0xd
03c7b 48c1e30a                       shl        rbx, 0xa
03c7f 41ba00000016                   mov        r10d, 0x16000000
03c85 4903da                         add        rbx, r10
03c88 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
03c8c 0f85f1170000                   jne        0x7f430c13ae83
03c92 e900000000                     jmp        0x7f430c139697
03c97 488bf8                         mov        rdi, rax
03c9a 4889bc2410020000               mov        qword ptr [rsp + 0x210], rdi
03ca2 483b07                         cmp        rax, qword ptr [rdi]
03ca5 488bf7                         mov        rsi, rdi
03ca8 48bb60a24300437f0000           movabs     rbx, 0x7f430043a260
03cb2 8b36                           mov        esi, dword ptr [rsi]
03cb4 c1ee0d                         shr        esi, 0xd
03cb7 48c1e60a                       shl        rsi, 0xa
03cbb 41ba00000016                   mov        r10d, 0x16000000
03cc1 4903f2                         add        rsi, r10
03cc4 41babd000000                   mov        r10d, 0xbd
03cca 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03cce 743c                           je         0x7f430c13970c
03cd0 4983c202                       add        r10, 2
03cd4 4981fac1000000                 cmp        r10, 0xc1
03cdb 75ed                           jne        0x7f430c1396ca
03cdd 41babd000000                   mov        r10d, 0xbd
03ce3 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03ce8 7415                           je         0x7f430c1396ff
03cea 4983c202                       add        r10, 2
03cee 4981fac1000000                 cmp        r10, 0xc1
03cf5 75ec                           jne        0x7f430c1396e3
03cf7 41babc000000                   mov        r10d, 0xbc
03cfd eb11                           jmp        0x7f430c139710
03cff 50                             push       rax
03d00 4833c0                         xor        rax, rax
03d03 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
03d09 58                             pop        rax
03d0a ebb8                           jmp        0x7f430c1396c4
03d0c 4983c201                       add        r10, 1
03d10 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03d15 48be20f01400437f0000           movabs     rsi, 0x7f430014f020
03d1f 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
03d22 83c302                         add        ebx, 2
03d25 895e78                         mov        dword ptr [rsi + 0x78], ebx
03d28 81e3feff1f00                   and        ebx, 0x1ffffe
03d2e 85db                           test       ebx, ebx
03d30 0f8483170000                   je         0x7f430c13aeb9
03d36 488bf7                         mov        rsi, rdi
03d39 48bb20f01400437f0000           movabs     rbx, 0x7f430014f020
03d43 8b36                           mov        esi, dword ptr [rsi]
03d45 c1ee0d                         shr        esi, 0xd
03d48 48c1e60a                       shl        rsi, 0xa
03d4c 41ba00000016                   mov        r10d, 0x16000000
03d52 4903f2                         add        rsi, r10
03d55 41ba17000000                   mov        r10d, 0x17
03d5b 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03d5f 7436                           je         0x7f430c139797
03d61 4983c202                       add        r10, 2
03d65 4983fa1b                       cmp        r10, 0x1b
03d69 75f0                           jne        0x7f430c13975b
03d6b 41ba17000000                   mov        r10d, 0x17
03d71 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03d76 7412                           je         0x7f430c13978a
03d78 4983c202                       add        r10, 2
03d7c 4983fa1b                       cmp        r10, 0x1b
03d80 75ef                           jne        0x7f430c139771
03d82 41ba16000000                   mov        r10d, 0x16
03d88 eb11                           jmp        0x7f430c13979b
03d8a 50                             push       rax
03d8b 4833c0                         xor        rax, rax
03d8e f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
03d94 58                             pop        rax
03d95 ebbe                           jmp        0x7f430c139755
03d97 4983c201                       add        r10, 1
03d9b 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03da0 488bf7                         mov        rsi, rdi
03da3 90                             nop        
03da4 90                             nop        
03da5 48b840fc45e0427f0000           movabs     rax, 0x7f42e045fc40
03daf e8ac5f5f07                     call       0x7f431372f760
03db4 0f1f8400ac3e0018               nop        dword ptr [rax + rax + 0x18003eac]
03dbc 48be20f01400437f0000           movabs     rsi, 0x7f430014f020
03dc6 488386e000000001               add        qword ptr [rsi + 0xe0], 1
03dce 48be40d51400437f0000           movabs     rsi, 0x7f430014d540
03dd8 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
03ddb 83c702                         add        edi, 2
03dde 897e78                         mov        dword ptr [rsi + 0x78], edi
03de1 81e7feff1f00                   and        edi, 0x1ffffe
03de7 85ff                           test       edi, edi
03de9 0f84eb160000                   je         0x7f430c13aeda
03def 8b9c240c020000                 mov        ebx, dword ptr [rsp + 0x20c]
03df6 8bbc24d0010000                 mov        edi, dword ptr [rsp + 0x1d0]
03dfd 48be40d51400437f0000           movabs     rsi, 0x7f430014d540
03e07 4883861001000001               add        qword ptr [rsi + 0x110], 1
03e0f ffc8                           dec        eax
03e11 2bd8                           sub        ebx, eax
03e13 48bed0cb1400437f0000           movabs     rsi, 0x7f430014cbd0
03e1d 8b4678                         mov        eax, dword ptr [rsi + 0x78]
03e20 83c002                         add        eax, 2
03e23 894678                         mov        dword ptr [rsi + 0x78], eax
03e26 25feff1f00                     and        eax, 0x1ffffe
03e2b 85c0                           test       eax, eax
03e2d 0f84c8160000                   je         0x7f430c13aefb
03e33 48bed0cb1400437f0000           movabs     rsi, 0x7f430014cbd0
03e3d 488386b000000001               add        qword ptr [rsi + 0xb0], 1
03e45 48be0000000000000000           movabs     rsi, 0
03e4f be00000000                     mov        esi, 0
03e54 3bfe                           cmp        edi, esi
03e56 0f8cc0160000                   jl         0x7f430c13af1c
03e5c 3bfb                           cmp        edi, ebx
03e5e 0f8dd9160000                   jge        0x7f430c13af3d
03e64 488bdf                         mov        rbx, rdi
03e67 899c2418020000                 mov        dword ptr [rsp + 0x218], ebx
03e6e 89bc24d0010000                 mov        dword ptr [rsp + 0x1d0], edi
03e75 488bbc2410020000               mov        rdi, qword ptr [rsp + 0x210]
03e7d 488bf7                         mov        rsi, rdi
03e80 48b920f01400437f0000           movabs     rcx, 0x7f430014f020
03e8a 8b36                           mov        esi, dword ptr [rsi]
03e8c c1ee0d                         shr        esi, 0xd
03e8f 48c1e60a                       shl        rsi, 0xa
03e93 41ba00000016                   mov        r10d, 0x16000000
03e99 4903f2                         add        rsi, r10
03e9c 41ba1f000000                   mov        r10d, 0x1f
03ea2 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
03ea6 7436                           je         0x7f430c1398de
03ea8 4983c202                       add        r10, 2
03eac 4983fa23                       cmp        r10, 0x23
03eb0 75f0                           jne        0x7f430c1398a2
03eb2 41ba1f000000                   mov        r10d, 0x1f
03eb8 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03ebd 7412                           je         0x7f430c1398d1
03ebf 4983c202                       add        r10, 2
03ec3 4983fa23                       cmp        r10, 0x23
03ec7 75ef                           jne        0x7f430c1398b8
03ec9 41ba1e000000                   mov        r10d, 0x1e
03ecf eb11                           jmp        0x7f430c1398e2
03ed1 50                             push       rax
03ed2 4833c0                         xor        rax, rax
03ed5 f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
03edb 58                             pop        rax
03edc ebbe                           jmp        0x7f430c13989c
03ede 4983c201                       add        r10, 1
03ee2 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03ee7 488bf7                         mov        rsi, rdi
03eea 90                             nop        
03eeb 90                             nop        
03eec 90                             nop        
03eed 48b868fc45e0427f0000           movabs     rax, 0x7f42e045fc68
03ef7 e8645e5f07                     call       0x7f431372f760
03efc 0f1f8400f43f0019               nop        dword ptr [rax + rax + 0x19003ff4]
03f04 483b00                         cmp        rax, qword ptr [rax]
03f07 488bf0                         mov        rsi, rax
03f0a 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
03f14 8b36                           mov        esi, dword ptr [rsi]
03f16 c1ee0d                         shr        esi, 0xd
03f19 48c1e60a                       shl        rsi, 0xa
03f1d 41ba00000016                   mov        r10d, 0x16000000
03f23 4903f2                         add        rsi, r10
03f26 41ba25000000                   mov        r10d, 0x25
03f2c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03f30 7436                           je         0x7f430c139968
03f32 4983c202                       add        r10, 2
03f36 4983fa29                       cmp        r10, 0x29
03f3a 75f0                           jne        0x7f430c13992c
03f3c 41ba25000000                   mov        r10d, 0x25
03f42 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03f47 7412                           je         0x7f430c13995b
03f49 4983c202                       add        r10, 2
03f4d 4983fa29                       cmp        r10, 0x29
03f51 75ef                           jne        0x7f430c139942
03f53 41ba24000000                   mov        r10d, 0x24
03f59 eb11                           jmp        0x7f430c13996c
03f5b 50                             push       rax
03f5c 4833c0                         xor        rax, rax
03f5f f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03f65 58                             pop        rax
03f66 ebbe                           jmp        0x7f430c139926
03f68 4983c201                       add        r10, 1
03f6c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03f71 8b7024                         mov        esi, dword ptr [rax + 0x24]
03f74 4c3b259d6a8d20                 cmp        r12, qword ptr [rip + 0x208d6a9d]
03f7b 0f8414000000                   je         0x7f430c139995
03f81 48bf3823ae2a437f0000           movabs     rdi, 0x7f432aae2338
03f8b 4883e4f0                       and        rsp, 0xfffffffffffffff0
03f8f e84c52ca1f                     call       0x7f432bddebe0
03f94 f4                             hlt        
03f95 488bd0                         mov        rdx, rax
03f98 48b920f01400437f0000           movabs     rcx, 0x7f430014f020
03fa2 8b12                           mov        edx, dword ptr [rdx]
03fa4 c1ea0d                         shr        edx, 0xd
03fa7 48c1e20a                       shl        rdx, 0xa
03fab 41ba00000016                   mov        r10d, 0x16000000
03fb1 4903d2                         add        rdx, r10
03fb4 41ba2b000000                   mov        r10d, 0x2b
03fba 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03fbe 7436                           je         0x7f430c1399f6
03fc0 4983c202                       add        r10, 2
03fc4 4983fa2f                       cmp        r10, 0x2f
03fc8 75f0                           jne        0x7f430c1399ba
03fca 41ba2b000000                   mov        r10d, 0x2b
03fd0 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03fd5 7412                           je         0x7f430c1399e9
03fd7 4983c202                       add        r10, 2
03fdb 4983fa2f                       cmp        r10, 0x2f
03fdf 75ef                           jne        0x7f430c1399d0
03fe1 41ba2a000000                   mov        r10d, 0x2a
03fe7 eb11                           jmp        0x7f430c1399fa
03fe9 50                             push       rax
03fea 4833c0                         xor        rax, rax
03fed f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03ff3 58                             pop        rax
03ff4 ebbe                           jmp        0x7f430c1399b4
03ff6 4983c201                       add        r10, 1
03ffa 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03fff 8b4804                         mov        ecx, dword ptr [rax + 4]
04002 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
0400c 4883828001000001               add        qword ptr [rdx + 0x180], 1
04014 48ba88d71400437f0000           movabs     rdx, 0x7f430014d788
0401e 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
04022 4183c002                       add        r8d, 2
04026 44894278                       mov        dword ptr [rdx + 0x78], r8d
0402a 4181e0feff1f00                 and        r8d, 0x1ffffe
04031 4585c0                         test       r8d, r8d
04034 0f843d150000                   je         0x7f430c13af77
0403a 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
04044 4883829001000001               add        qword ptr [rdx + 0x190], 1
0404c 8b9c2418020000                 mov        ebx, dword ptr [rsp + 0x218]
04053 4863db                         movsxd     rbx, ebx
04056 ba08000000                     mov        edx, 8
0405b 4c8bcb                         mov        r9, rbx
0405e 4c03ca                         add        r9, rdx
04061 48ba80b91400437f0000           movabs     rdx, 0x7f430014b980
0406b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
0406f 4183c002                       add        r8d, 2
04073 44894278                       mov        dword ptr [rdx + 0x78], r8d
04077 4181e0feff1f00                 and        r8d, 0x1ffffe
0407e 4585c0                         test       r8d, r8d
04081 0f8411150000                   je         0x7f430c13af98
04087 48ba80b91400437f0000           movabs     rdx, 0x7f430014b980
04091 488382e000000001               add        qword ptr [rdx + 0xe0], 1
04099 48ba00bb1400437f0000           movabs     rdx, 0x7f430014bb00
040a3 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
040a7 4183c002                       add        r8d, 2
040ab 44894278                       mov        dword ptr [rdx + 0x78], r8d
040af 4181e0feff1f00                 and        r8d, 0x1ffffe
040b6 4585c0                         test       r8d, r8d
040b9 0f84fa140000                   je         0x7f430c13afb9
040bf 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
040c9 488d92a0010000                 lea        rdx, [rdx + 0x1a0]
040d0 49b8c00a73e200000000           movabs     r8, 0xe2730ac0
040da 4d85c0                         test       r8, r8
040dd 0f8514000000                   jne        0x7f430c139af7
040e3 48bf75489a2a437f0000           movabs     rdi, 0x7f432a9a4875
040ed 4883e4f0                       and        rsp, 0xfffffffffffffff0
040f1 e8ea50ca1f                     call       0x7f432bddebe0
040f6 f4                             hlt        
040f7 458b00                         mov        r8d, dword ptr [r8]
040fa 41c1e80d                       shr        r8d, 0xd
040fe 49c1e00a                       shl        r8, 0xa
04102 41ba00000016                   mov        r10d, 0x16000000
04108 4d03c2                         add        r8, r10
0410b 4150                           push       r8
0410d 49b80000021700000000           movabs     r8, 0x17020000
04117 4c3b0424                       cmp        r8, qword ptr [rsp]
0411b 0f8414000000                   je         0x7f430c139b35
04121 48bf8843a22a437f0000           movabs     rdi, 0x7f432aa24388
0412b 4883e4f0                       and        rsp, 0xfffffffffffffff0
0412f e8ac50ca1f                     call       0x7f432bddebe0
04134 f4                             hlt        
04135 4158                           pop        r8
04137 49b80000021700000000           movabs     r8, 0x17020000
04141 4d8bd0                         mov        r10, r8
04144 4c3302                         xor        r8, qword ptr [rdx]
04147 49f7c0fcffffff                 test       r8, -4
0414e 742b                           je         0x7f430c139b7b
04150 41f6c002                       test       r8b, 2
04154 7525                           jne        0x7f430c139b7b
04156 48f702feffffff                 test       qword ptr [rdx], -2
0415d 7415                           je         0x7f430c139b74
0415f 4d8bc2                         mov        r8, r10
04162 4c3302                         xor        r8, qword ptr [rdx]
04165 49f7c0fcffffff                 test       r8, -4
0416c 740d                           je         0x7f430c139b7b
0416e 48830a02                       or         qword ptr [rdx], 2
04172 eb07                           jmp        0x7f430c139b7b
04174 4c8902                         mov        qword ptr [rdx], r8
04177 4983e0fc                       and        r8, 0xfffffffffffffffc
0417b 48ba20f01400437f0000           movabs     rdx, 0x7f430014f020
04185 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
0418d ba02000000                     mov        edx, 2
04192 4c8b842438010000               mov        r8, qword ptr [rsp + 0x138]
0419a bf00000000                     mov        edi, 0
0419f 488b842410020000               mov        rax, qword ptr [rsp + 0x210]
041a7 48890424                       mov        qword ptr [rsp], rax
041ab 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
041b3 4889442408                     mov        qword ptr [rsp + 8], rax
041b8 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
041bd 49bac00a73e200000000           movabs     r10, 0xe2730ac0
041c7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
041cc 90                             nop        
041cd 90                             nop        
041ce 90                             nop        
041cf e88c605f07                     call       0x7f431372fc60
041d4 0f1f8400cc42001a               nop        dword ptr [rax + rax + 0x1a0042cc]
041dc 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
041e3 448b842478010000               mov        r8d, dword ptr [rsp + 0x178]
041eb 4103d8                         add        ebx, r8d
041ee 48be60a24300437f0000           movabs     rsi, 0x7f430043a260
041f8 ff8610060000                   inc        dword ptr [rsi + 0x610]
041fe 8bb424d4010000                 mov        esi, dword ptr [rsp + 0x1d4]
04205 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
0420f ff8208080000                   inc        dword ptr [rdx + 0x808]
04215 488bc3                         mov        rax, rbx
04218 8b942444010000                 mov        edx, dword ptr [rsp + 0x144]
0421f ffc2                           inc        edx
04221 48b960a24300437f0000           movabs     rcx, 0x7f430043a260
0422b 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
0422f 4183c002                       add        r8d, 2
04233 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
04237 4181e0fe3f0000                 and        r8d, 0x3ffe
0423e 4585c0                         test       r8d, r8d
04241 0f8493130000                   je         0x7f430c13afda
04247 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0424b 418502                         test       dword ptr [r10], eax
0424e 48b960a24300437f0000           movabs     rcx, 0x7f430043a260
04258 ff8130080000                   inc        dword ptr [rcx + 0x830]
0425e 488bce                         mov        rcx, rsi
04261 4c8bd8                         mov        r11, rax
04264 488bf1                         mov        rsi, rcx
04267 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
0426f 488b9c2468020000               mov        rbx, qword ptr [rsp + 0x268]
04277 8bbc2430010000                 mov        edi, dword ptr [rsp + 0x130]
0427e 4c8b8c2420010000               mov        r9, qword ptr [rsp + 0x120]
04286 4c8b842428010000               mov        r8, qword ptr [rsp + 0x128]
0428e 8b8c2434010000                 mov        ecx, dword ptr [rsp + 0x134]
04295 e976c0ffff                     jmp        0x7f430c135d10
0429a 4c8bc8                         mov        r9, rax
0429d 4585c9                         test       r9d, r9d
042a0 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
042aa b988030000                     mov        ecx, 0x388
042af 7e05                           jle        0x7f430c139cb6
042b1 b998030000                     mov        ecx, 0x398
042b6 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
042ba 4d8d4001                       lea        r8, [r8 + 1]
042be 4c89040a                       mov        qword ptr [rdx + rcx], r8
042c2 0f8ec2010000                   jle        0x7f430c139e8a
042c8 488b9c2498010000               mov        rbx, qword ptr [rsp + 0x198]
042d0 482bf3                         sub        rsi, rbx
042d3 ba00000000                     mov        edx, 0
042d8 483bf2                         cmp        rsi, rdx
042db 48be60a24300437f0000           movabs     rsi, 0x7f430043a260
042e5 baa8030000                     mov        edx, 0x3a8
042ea 7d05                           jge        0x7f430c139cf1
042ec bab8030000                     mov        edx, 0x3b8
042f1 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
042f5 488d4901                       lea        rcx, [rcx + 1]
042f9 48890c16                       mov        qword ptr [rsi + rdx], rcx
042fd 0f8d87010000                   jge        0x7f430c139e8a
04303 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
0430b 488b5630                       mov        rdx, qword ptr [rsi + 0x30]
0430f be00000000                     mov        esi, 0
04314 483bd6                         cmp        rdx, rsi
04317 48be60a24300437f0000           movabs     rsi, 0x7f430043a260
04321 bac8030000                     mov        edx, 0x3c8
04326 7505                           jne        0x7f430c139d2d
04328 bad8030000                     mov        edx, 0x3d8
0432d 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
04331 488d4901                       lea        rcx, [rcx + 1]
04335 48890c16                       mov        qword ptr [rsi + rdx], rcx
04339 0f854b010000                   jne        0x7f430c139e8a
0433f e950010000                     jmp        0x7f430c139e94
04344 448b9c2474010000               mov        r11d, dword ptr [rsp + 0x174]
0434c 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
04354 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
0435c 898c2434010000                 mov        dword ptr [rsp + 0x134], ecx
04363 488bce                         mov        rcx, rsi
04366 8bb42434010000                 mov        esi, dword ptr [rsp + 0x134]
0436d 488bde                         mov        rbx, rsi
04370 2bd9                           sub        ebx, ecx
04372 48be60a24300437f0000           movabs     rsi, 0x7f430043a260
0437c 4883864808000001               add        qword ptr [rsi + 0x848], 1
04384 488bf2                         mov        rsi, rdx
04387 488bd1                         mov        rdx, rcx
0438a 488bc8                         mov        rcx, rax
0438d 4d8bc3                         mov        r8, r11
04390 4c8bcb                         mov        r9, rbx
04393 44899c2474010000               mov        dword ptr [rsp + 0x174], r11d
0439b 899c241c020000                 mov        dword ptr [rsp + 0x21c], ebx
043a2 4885c9                         test       rcx, rcx
043a5 0f8450120000                   je         0x7f430c13affb
043ab 85d2                           test       edx, edx
043ad 0f8c48120000                   jl         0x7f430c13affb
043b3 4585c0                         test       r8d, r8d
043b6 0f8c3f120000                   jl         0x7f430c13affb
043bc 4a8d3c0a                       lea        rdi, [rdx + r9]
043c0 3b7e04                         cmp        edi, dword ptr [rsi + 4]
043c3 0f8732120000                   ja         0x7f430c13affb
043c9 4b8d3c08                       lea        rdi, [r8 + r9]
043cd 3b7904                         cmp        edi, dword ptr [rcx + 4]
043d0 0f8725120000                   ja         0x7f430c13affb
043d6 4585c9                         test       r9d, r9d
043d9 0f8c1c120000                   jl         0x7f430c13affb
043df 4863d2                         movsxd     rdx, edx
043e2 4d63c0                         movsxd     r8, r8d
043e5 48bf00e41b1600000000           movabs     rdi, 0x161be400
043ef 41ba00000016                   mov        r10d, 0x16000000
043f5 492bfa                         sub        rdi, r10
043f8 48c1ef0a                       shr        rdi, 0xa
043fc 448b19                         mov        r11d, dword ptr [rcx]
043ff 41c1eb0d                       shr        r11d, 0xd
04403 413bfb                         cmp        edi, r11d
04406 0f8510000000                   jne        0x7f430c139e1c
0440c 448b1e                         mov        r11d, dword ptr [rsi]
0440f 41c1eb0d                       shr        r11d, 0xd
04413 413bfb                         cmp        edi, r11d
04416 0f8414000000                   je         0x7f430c139e30
0441c 48bf8895a72a437f0000           movabs     rdi, 0x7f432aa79588
04426 4883e4f0                       and        rsp, 0xfffffffffffffff0
0442a e8b14dca1f                     call       0x7f432bddebe0
0442f f4                             hlt        
04430 488d7c1608                     lea        rdi, [rsi + rdx + 8]
04435 4a8d740108                     lea        rsi, [rcx + r8 + 8]
0443a 498bd1                         mov        rdx, r9
0443d 40f6c40f                       test       spl, 0xf
04441 0f8412000000                   je         0x7f430c139e59
04447 4883ec08                       sub        rsp, 8
0444b e8f0f25d07                     call       0x7f4313719140
04450 4883c408                       add        rsp, 8
04454 e905000000                     jmp        0x7f430c139e5e
04459 e8e2f25d07                     call       0x7f4313719140
0445e 8b9c241c020000                 mov        ebx, dword ptr [rsp + 0x21c]
04465 039c2474010000                 add        ebx, dword ptr [rsp + 0x174]
0446c 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
04474 895e38                         mov        dword ptr [rsi + 0x38], ebx
04477 4881c450020000                 add        rsp, 0x250
0447e 5d                             pop        rbp
0447f 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
04483 0f8780110000                   ja         0x7f430c13b009
04489 c3                             ret        
0448a bb02000000                     mov        ebx, 2
0448f e915000000                     jmp        0x7f430c139ea9
04494 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
0449e ff82e8030000                   inc        dword ptr [rdx + 0x3e8]
044a4 bb08000000                     mov        ebx, 8
044a9 899c2428020000                 mov        dword ptr [rsp + 0x228], ebx
044b0 e979110000                     jmp        0x7f430c13b02e
044b5 90                             nop        
044b6 90                             nop        
044b7 90                             nop        
044b8 90                             nop        
044b9 90                             nop        
044ba 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
044c1 0f858a110000                   jne        0x7f430c13b051
044c7 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
044ce 488d7820                       lea        rdi, [rax + 0x20]
044d2 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
044d9 0f8772110000                   ja         0x7f430c13b051
044df 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
044e6 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
044ed 488908                         mov        qword ptr [rax], rcx
044f0 4833c9                         xor        rcx, rcx
044f3 48894808                       mov        qword ptr [rax + 8], rcx
044f7 48894810                       mov        qword ptr [rax + 0x10], rcx
044fb 48894818                       mov        qword ptr [rax + 0x18], rcx
044ff 90                             nop        
04500 e968110000                     jmp        0x7f430c13b06d
04505 90                             nop        
04506 90                             nop        
04507 90                             nop        
04508 90                             nop        
04509 90                             nop        
0450a 498bf1                         mov        rsi, r9
0450d 4889842420020000               mov        qword ptr [rsp + 0x220], rax
04515 90                             nop        
04516 90                             nop        
04517 e8445d5f07                     call       0x7f431372fc60
0451c 0f1f84001446001c               nop        dword ptr [rax + rax + 0x1c004614]
04524 48ba60a24300437f0000           movabs     rdx, 0x7f430043a260
0452e 488d9210040000                 lea        rdx, [rdx + 0x410]
04535 4885c0                         test       rax, rax
04538 750e                           jne        0x7f430c139f48
0453a f60201                         test       byte ptr [rdx], 1
0453d 0f8505000000                   jne        0x7f430c139f48
04543 f048830a01                     lock or    qword ptr [rdx], 1
04548 488b942420020000               mov        rdx, qword ptr [rsp + 0x220]
04550 48b960a24300437f0000           movabs     rcx, 0x7f430043a260
0455a 4883812004000001               add        qword ptr [rcx + 0x420], 1
04562 8b942428020000                 mov        edx, dword ptr [rsp + 0x228]
04569 488bc8                         mov        rcx, rax
0456c 488bb42420020000               mov        rsi, qword ptr [rsp + 0x220]
04574 90                             nop        
04575 90                             nop        
04576 90                             nop        
04577 e8e4525f07                     call       0x7f431372f260
0457c 0f1f84007446001d               nop        dword ptr [rax + rax + 0x1d004674]
04584 488b842420020000               mov        rax, qword ptr [rsp + 0x220]
0458c e981110000                     jmp        0x7f430c13b112
04591 90                             nop        
04592 90                             nop        
04593 90                             nop        
04594 90                             nop        
04595 90                             nop        
04596 90                             nop        
04597 90                             nop        
04598 e9e9100000                     jmp        0x7f430c13b086
0459d 90                             nop        
0459e 90                             nop        
0459f 90                             nop        
045a0 90                             nop        
045a1 90                             nop        
045a2 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
045a9 0f85fa100000                   jne        0x7f430c13b0a9
045af 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
045b6 488d7820                       lea        rdi, [rax + 0x20]
045ba 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
045c1 0f87e2100000                   ja         0x7f430c13b0a9
045c7 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
045ce 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
045d5 488908                         mov        qword ptr [rax], rcx
045d8 4833c9                         xor        rcx, rcx
045db 48894808                       mov        qword ptr [rax + 8], rcx
045df 48894810                       mov        qword ptr [rax + 0x10], rcx
045e3 48894818                       mov        qword ptr [rax + 0x18], rcx
045e7 488bd0                         mov        rdx, rax
045ea 48b960a24300437f0000           movabs     rcx, 0x7f430043a260
045f4 4883815802000001               add        qword ptr [rcx + 0x258], 1
045fc ba02000000                     mov        edx, 2
04601 48b9e86326e200000000           movabs     rcx, 0xe22663e8
0460b 488bf0                         mov        rsi, rax
0460e 4889842430020000               mov        qword ptr [rsp + 0x230], rax
04616 90                             nop        
04617 e844525f07                     call       0x7f431372f260
0461c 0f1f84001447001e               nop        dword ptr [rax + rax + 0x1e004714]
04624 488b842430020000               mov        rax, qword ptr [rsp + 0x230]
0462c e9e1100000                     jmp        0x7f430c13b112
04631 90                             nop        
04632 90                             nop        
04633 90                             nop        
04634 90                             nop        
04635 90                             nop        
04636 90                             nop        
04637 90                             nop        
04638 e988100000                     jmp        0x7f430c13b0c5
0463d 90                             nop        
0463e 90                             nop        
0463f 90                             nop        
04640 90                             nop        
04641 90                             nop        
04642 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04649 0f8599100000                   jne        0x7f430c13b0e8
0464f 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
04656 488d7820                       lea        rdi, [rax + 0x20]
0465a 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
04661 0f8781100000                   ja         0x7f430c13b0e8
04667 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
0466e 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
04675 488908                         mov        qword ptr [rax], rcx
04678 4833c9                         xor        rcx, rcx
0467b 48894808                       mov        qword ptr [rax + 8], rcx
0467f 48894810                       mov        qword ptr [rax + 0x10], rcx
04683 48894818                       mov        qword ptr [rax + 0x18], rcx
04687 488bd0                         mov        rdx, rax
0468a 48b960a24300437f0000           movabs     rcx, 0x7f430043a260
04694 4883814001000001               add        qword ptr [rcx + 0x140], 1
0469c ba05000000                     mov        edx, 5
046a1 48b9186426e200000000           movabs     rcx, 0xe2266418
046ab 488bf0                         mov        rsi, rax
046ae 4889842438020000               mov        qword ptr [rsp + 0x238], rax
046b6 90                             nop        
046b7 e8a4515f07                     call       0x7f431372f260
046bc 0f1f8400b447001f               nop        dword ptr [rax + rax + 0x1f0047b4]
046c4 488b842438020000               mov        rax, qword ptr [rsp + 0x238]
046cc e941100000                     jmp        0x7f430c13b112
046d1 49ba30044200437f0000           movabs     r10, 0x7f4300420430
046db 4c89542408                     mov        qword ptr [rsp + 8], r10
046e0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
046e8 e873495907                     call       0x7f43136cea60
046ed e99bb9ffff                     jmp        0x7f430c135a8d
046f2 49ba20235b1600000000           movabs     r10, 0x165b2320
046fc 4c89542408                     mov        qword ptr [rsp + 8], r10
04701 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04709 e852495907                     call       0x7f43136cea60
0470e e925bbffff                     jmp        0x7f430c135c38
04713 e8c8b45907                     call       0x7f43136d55e0
04718 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04722 4883e4f0                       and        rsp, 0xfffffffffffffff0
04726 e8b54aca1f                     call       0x7f432bddebe0
0472b f4                             hlt        
0472c e8afb45907                     call       0x7f43136d55e0
04731 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
0473b 4883e4f0                       and        rsp, 0xfffffffffffffff0
0473f e89c4aca1f                     call       0x7f432bddebe0
04744 f4                             hlt        
04745 e896b45907                     call       0x7f43136d55e0
0474a 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04754 4883e4f0                       and        rsp, 0xfffffffffffffff0
04758 e8834aca1f                     call       0x7f432bddebe0
0475d f4                             hlt        
0475e 48891424                       mov        qword ptr [rsp], rdx
04762 4c89442408                     mov        qword ptr [rsp + 8], r8
04767 e874bd5907                     call       0x7f43136d5ee0
0476c 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04776 4883e4f0                       and        rsp, 0xfffffffffffffff0
0477a e8614aca1f                     call       0x7f432bddebe0
0477f f4                             hlt        
04780 e85bb45907                     call       0x7f43136d55e0
04785 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
0478f 4883e4f0                       and        rsp, 0xfffffffffffffff0
04793 e8484aca1f                     call       0x7f432bddebe0
04798 f4                             hlt        
04799 e842b45907                     call       0x7f43136d55e0
0479e 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
047a8 4883e4f0                       and        rsp, 0xfffffffffffffff0
047ac e82f4aca1f                     call       0x7f432bddebe0
047b1 f4                             hlt        
047b2 48891424                       mov        qword ptr [rsp], rdx
047b6 4c894c2408                     mov        qword ptr [rsp + 8], r9
047bb e820bd5907                     call       0x7f43136d5ee0
047c0 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
047ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
047ce e80d4aca1f                     call       0x7f432bddebe0
047d3 f4                             hlt        
047d4 e807b45907                     call       0x7f43136d55e0
047d9 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
047e3 4883e4f0                       and        rsp, 0xfffffffffffffff0
047e7 e8f449ca1f                     call       0x7f432bddebe0
047ec f4                             hlt        
047ed e8eeb35907                     call       0x7f43136d55e0
047f2 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
047fc 4883e4f0                       and        rsp, 0xfffffffffffffff0
04800 e8db49ca1f                     call       0x7f432bddebe0
04805 f4                             hlt        
04806 48c7042401000000               mov        qword ptr [rsp], 1
0480e 48895c2408                     mov        qword ptr [rsp + 8], rbx
04813 e8c8bc5907                     call       0x7f43136d5ee0
04818 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04822 4883e4f0                       and        rsp, 0xfffffffffffffff0
04826 e8b549ca1f                     call       0x7f432bddebe0
0482b f4                             hlt        
0482c 48c7042402000000               mov        qword ptr [rsp], 2
04834 48895c2408                     mov        qword ptr [rsp + 8], rbx
04839 e8a2bc5907                     call       0x7f43136d5ee0
0483e 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04848 4883e4f0                       and        rsp, 0xfffffffffffffff0
0484c e88f49ca1f                     call       0x7f432bddebe0
04851 f4                             hlt        
04852 49ba38f00500437f0000           movabs     r10, 0x7f430005f038
0485c 4c89542408                     mov        qword ptr [rsp + 8], r10
04861 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04869 e8f2475907                     call       0x7f43136cea60
0486e e95abfffff                     jmp        0x7f430c1361cd
04873 49baa8241400437f0000           movabs     r10, 0x7f43001424a8
0487d 4c89542408                     mov        qword ptr [rsp + 8], r10
04882 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0488a e8d1475907                     call       0x7f43136cea60
0488f e9ddbfffff                     jmp        0x7f430c136271
04894 49bad0325b1600000000           movabs     r10, 0x165b32d0
0489e 4c89542408                     mov        qword ptr [rsp + 8], r10
048a3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
048ab e8b0475907                     call       0x7f43136cea60
048b0 e906c0ffff                     jmp        0x7f430c1362bb
048b5 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
048bd e89e6a5907                     call       0x7f43136d0d60
048c2 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
048cc 4883e4f0                       and        rsp, 0xfffffffffffffff0
048d0 e80b49ca1f                     call       0x7f432bddebe0
048d5 f4                             hlt        
048d6 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
048de e87d6a5907                     call       0x7f43136d0d60
048e3 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
048ed 4883e4f0                       and        rsp, 0xfffffffffffffff0
048f1 e8ea48ca1f                     call       0x7f432bddebe0
048f6 f4                             hlt        
048f7 49baa0380c00437f0000           movabs     r10, 0x7f43000c38a0
04901 4c89542408                     mov        qword ptr [rsp + 8], r10
04906 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0490e e84d475907                     call       0x7f43136cea60
04913 e97cc0ffff                     jmp        0x7f430c136394
04918 49bac8aa0c00437f0000           movabs     r10, 0x7f43000caac8
04922 4c89542408                     mov        qword ptr [rsp + 8], r10
04927 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0492f e82c475907                     call       0x7f43136cea60
04934 e98ec0ffff                     jmp        0x7f430c1363c7
04939 49ba40870f00437f0000           movabs     r10, 0x7f43000f8740
04943 4c89542408                     mov        qword ptr [rsp + 8], r10
04948 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04950 e80b475907                     call       0x7f43136cea60
04955 e937c1ffff                     jmp        0x7f430c136491
0495a 49baf80b0600437f0000           movabs     r10, 0x7f4300060bf8
04964 4c89542408                     mov        qword ptr [rsp + 8], r10
04969 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04971 e8ea465907                     call       0x7f43136cea60
04976 e94dc1ffff                     jmp        0x7f430c1364c8
0497b 49ba30450f00437f0000           movabs     r10, 0x7f43000f4530
04985 4c89542408                     mov        qword ptr [rsp + 8], r10
0498a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04992 e8c9465907                     call       0x7f43136cea60
04997 e9b1c1ffff                     jmp        0x7f430c13654d
0499c 49bab8260600437f0000           movabs     r10, 0x7f43000626b8
049a6 4c89542408                     mov        qword ptr [rsp + 8], r10
049ab 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049b3 e8a8465907                     call       0x7f43136cea60
049b8 e9abc2ffff                     jmp        0x7f430c136668
049bd 49ba502b281600000000           movabs     r10, 0x16282b50
049c7 4c89542408                     mov        qword ptr [rsp + 8], r10
049cc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049d4 e887465907                     call       0x7f43136cea60
049d9 e9cbc2ffff                     jmp        0x7f430c1366a9
049de 49ba20a9281600000000           movabs     r10, 0x1628a920
049e8 4c89542408                     mov        qword ptr [rsp + 8], r10
049ed 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
049f5 e866465907                     call       0x7f43136cea60
049fa e9ddc2ffff                     jmp        0x7f430c1366dc
049ff 48890424                       mov        qword ptr [rsp], rax
04a03 e858845907                     call       0x7f43136d2860
04a08 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04a12 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a16 e8c547ca1f                     call       0x7f432bddebe0
04a1b f4                             hlt        
04a1c e8bfb15907                     call       0x7f43136d55e0
04a21 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04a2b 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a2f e8ac47ca1f                     call       0x7f432bddebe0
04a34 f4                             hlt        
04a35 49bab8fe0500437f0000           movabs     r10, 0x7f430005feb8
04a3f 4c89542408                     mov        qword ptr [rsp + 8], r10
04a44 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a4c e80f465907                     call       0x7f43136cea60
04a51 e9e8c4ffff                     jmp        0x7f430c13693e
04a56 e885b15907                     call       0x7f43136d55e0
04a5b 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04a65 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a69 e87247ca1f                     call       0x7f432bddebe0
04a6e f4                             hlt        
04a6f 49baa8241400437f0000           movabs     r10, 0x7f43001424a8
04a79 4c89542408                     mov        qword ptr [rsp + 8], r10
04a7e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04a86 e8d5455907                     call       0x7f43136cea60
04a8b e972c5ffff                     jmp        0x7f430c136a02
04a90 49bad0325b1600000000           movabs     r10, 0x165b32d0
04a9a 4c89542408                     mov        qword ptr [rsp + 8], r10
04a9f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04aa7 e8b4455907                     call       0x7f43136cea60
04aac e98fc5ffff                     jmp        0x7f430c136a40
04ab1 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04ab9 e8a2685907                     call       0x7f43136d0d60
04abe 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04ac8 4883e4f0                       and        rsp, 0xfffffffffffffff0
04acc e80f47ca1f                     call       0x7f432bddebe0
04ad1 f4                             hlt        
04ad2 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04ada e881685907                     call       0x7f43136d0d60
04adf 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04ae9 4883e4f0                       and        rsp, 0xfffffffffffffff0
04aed e8ee46ca1f                     call       0x7f432bddebe0
04af2 f4                             hlt        
04af3 e8e8b05907                     call       0x7f43136d55e0
04af8 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04b02 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b06 e8d546ca1f                     call       0x7f432bddebe0
04b0b f4                             hlt        
04b0c 49bab8260600437f0000           movabs     r10, 0x7f43000626b8
04b16 4c89542408                     mov        qword ptr [rsp + 8], r10
04b1b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b23 e838455907                     call       0x7f43136cea60
04b28 e91dc7ffff                     jmp        0x7f430c136c4a
04b2d 49ba502b281600000000           movabs     r10, 0x16282b50
04b37 4c89542408                     mov        qword ptr [rsp + 8], r10
04b3c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b44 e817455907                     call       0x7f43136cea60
04b49 e949c7ffff                     jmp        0x7f430c136c97
04b4e 49ba20a9281600000000           movabs     r10, 0x1628a920
04b58 4c89542408                     mov        qword ptr [rsp + 8], r10
04b5d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b65 e8f6445907                     call       0x7f43136cea60
04b6a e960c7ffff                     jmp        0x7f430c136ccf
04b6f 49ba38f00500437f0000           movabs     r10, 0x7f430005f038
04b79 4c89542408                     mov        qword ptr [rsp + 8], r10
04b7e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b86 e8d5445907                     call       0x7f43136cea60
04b8b e90fc9ffff                     jmp        0x7f430c136e9f
04b90 49baa8241400437f0000           movabs     r10, 0x7f43001424a8
04b9a 4c89542408                     mov        qword ptr [rsp + 8], r10
04b9f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ba7 e8b4445907                     call       0x7f43136cea60
04bac e997c9ffff                     jmp        0x7f430c136f48
04bb1 49bad0325b1600000000           movabs     r10, 0x165b32d0
04bbb 4c89542408                     mov        qword ptr [rsp + 8], r10
04bc0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bc8 e893445907                     call       0x7f43136cea60
04bcd e9b4c9ffff                     jmp        0x7f430c136f86
04bd2 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04bda e881675907                     call       0x7f43136d0d60
04bdf 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04be9 4883e4f0                       and        rsp, 0xfffffffffffffff0
04bed e8ee45ca1f                     call       0x7f432bddebe0
04bf2 f4                             hlt        
04bf3 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04bfb e860675907                     call       0x7f43136d0d60
04c00 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04c0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
04c0e e8cd45ca1f                     call       0x7f432bddebe0
04c13 f4                             hlt        
04c14 49baa0380c00437f0000           movabs     r10, 0x7f43000c38a0
04c1e 4c89542408                     mov        qword ptr [rsp + 8], r10
04c23 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c2b e830445907                     call       0x7f43136cea60
04c30 e92acaffff                     jmp        0x7f430c13705f
04c35 49bac8aa0c00437f0000           movabs     r10, 0x7f43000caac8
04c3f 4c89542408                     mov        qword ptr [rsp + 8], r10
04c44 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c4c e80f445907                     call       0x7f43136cea60
04c51 e941caffff                     jmp        0x7f430c137097
04c56 49ba40870f00437f0000           movabs     r10, 0x7f43000f8740
04c60 4c89542408                     mov        qword ptr [rsp + 8], r10
04c65 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c6d e8ee435907                     call       0x7f43136cea60
04c72 e9cdcaffff                     jmp        0x7f430c137144
04c77 49baf80b0600437f0000           movabs     r10, 0x7f4300060bf8
04c81 4c89542408                     mov        qword ptr [rsp + 8], r10
04c86 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c8e e8cd435907                     call       0x7f43136cea60
04c93 e9e4caffff                     jmp        0x7f430c13717c
04c98 49ba30450f00437f0000           movabs     r10, 0x7f43000f4530
04ca2 4c89542408                     mov        qword ptr [rsp + 8], r10
04ca7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04caf e8ac435907                     call       0x7f43136cea60
04cb4 e948cbffff                     jmp        0x7f430c137201
04cb9 49bab8260600437f0000           movabs     r10, 0x7f43000626b8
04cc3 4c89542408                     mov        qword ptr [rsp + 8], r10
04cc8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cd0 e88b435907                     call       0x7f43136cea60
04cd5 e93eccffff                     jmp        0x7f430c137318
04cda 49ba502b281600000000           movabs     r10, 0x16282b50
04ce4 4c89542408                     mov        qword ptr [rsp + 8], r10
04ce9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cf1 e86a435907                     call       0x7f43136cea60
04cf6 e963ccffff                     jmp        0x7f430c13735e
04cfb 49ba20a9281600000000           movabs     r10, 0x1628a920
04d05 4c89542408                     mov        qword ptr [rsp + 8], r10
04d0a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d12 e849435907                     call       0x7f43136cea60
04d17 e97accffff                     jmp        0x7f430c137396
04d1c 48890424                       mov        qword ptr [rsp], rax
04d20 e83b815907                     call       0x7f43136d2860
04d25 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04d2f 4883e4f0                       and        rsp, 0xfffffffffffffff0
04d33 e8a844ca1f                     call       0x7f432bddebe0
04d38 f4                             hlt        
04d39 e8a2ae5907                     call       0x7f43136d55e0
04d3e 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04d48 4883e4f0                       and        rsp, 0xfffffffffffffff0
04d4c e88f44ca1f                     call       0x7f432bddebe0
04d51 f4                             hlt        
04d52 49bab8fe0500437f0000           movabs     r10, 0x7f430005feb8
04d5c 4c89542408                     mov        qword ptr [rsp + 8], r10
04d61 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d69 e8f2425907                     call       0x7f43136cea60
04d6e e98bceffff                     jmp        0x7f430c1375fe
04d73 e868ae5907                     call       0x7f43136d55e0
04d78 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04d82 4883e4f0                       and        rsp, 0xfffffffffffffff0
04d86 e85544ca1f                     call       0x7f432bddebe0
04d8b f4                             hlt        
04d8c 49baa8241400437f0000           movabs     r10, 0x7f43001424a8
04d96 4c89542408                     mov        qword ptr [rsp + 8], r10
04d9b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04da3 e8b8425907                     call       0x7f43136cea60
04da8 e915cfffff                     jmp        0x7f430c1376c2
04dad 49bad0325b1600000000           movabs     r10, 0x165b32d0
04db7 4c89542408                     mov        qword ptr [rsp + 8], r10
04dbc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04dc4 e897425907                     call       0x7f43136cea60
04dc9 e932cfffff                     jmp        0x7f430c137700
04dce 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04dd6 e885655907                     call       0x7f43136d0d60
04ddb 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04de5 4883e4f0                       and        rsp, 0xfffffffffffffff0
04de9 e8f243ca1f                     call       0x7f432bddebe0
04dee f4                             hlt        
04def 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04df7 e864655907                     call       0x7f43136d0d60
04dfc 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04e06 4883e4f0                       and        rsp, 0xfffffffffffffff0
04e0a e8d143ca1f                     call       0x7f432bddebe0
04e0f f4                             hlt        
04e10 e8cbad5907                     call       0x7f43136d55e0
04e15 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04e1f 4883e4f0                       and        rsp, 0xfffffffffffffff0
04e23 e8b843ca1f                     call       0x7f432bddebe0
04e28 f4                             hlt        
04e29 49bab8260600437f0000           movabs     r10, 0x7f43000626b8
04e33 4c89542408                     mov        qword ptr [rsp + 8], r10
04e38 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e40 e81b425907                     call       0x7f43136cea60
04e45 e9c0d0ffff                     jmp        0x7f430c13790a
04e4a 49ba502b281600000000           movabs     r10, 0x16282b50
04e54 4c89542408                     mov        qword ptr [rsp + 8], r10
04e59 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e61 e8fa415907                     call       0x7f43136cea60
04e66 e9ecd0ffff                     jmp        0x7f430c137957
04e6b 49ba20a9281600000000           movabs     r10, 0x1628a920
04e75 4c89542408                     mov        qword ptr [rsp + 8], r10
04e7a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e82 e8d9415907                     call       0x7f43136cea60
04e87 e903d1ffff                     jmp        0x7f430c13798f
04e8c 49ba30044200437f0000           movabs     r10, 0x7f4300420430
04e96 4c89542408                     mov        qword ptr [rsp + 8], r10
04e9b 48c704240a020000               mov        qword ptr [rsp], 0x20a
04ea3 e8b8415907                     call       0x7f43136cea60
04ea8 e958d2ffff                     jmp        0x7f430c137b05
04ead 90                             nop        
04eae 90                             nop        
04eaf e8ac535f07                     call       0x7f431372fc60
04eb4 e988d3ffff                     jmp        0x7f430c137c41
04eb9 90                             nop        
04eba 90                             nop        
04ebb 90                             nop        
04ebc 90                             nop        
04ebd 90                             nop        
04ebe 90                             nop        
04ebf e89c535f07                     call       0x7f431372fc60
04ec4 e950d5ffff                     jmp        0x7f430c137e19
04ec9 49bac02e4200437f0000           movabs     r10, 0x7f4300422ec0
04ed3 4c89542408                     mov        qword ptr [rsp + 8], r10
04ed8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ee0 e87b415907                     call       0x7f43136cea60
04ee5 e9b0d5ffff                     jmp        0x7f430c137e9a
04eea 49b80000000000000000           movabs     r8, 0
04ef4 b8000f050a                     mov        eax, 0xa050f00
04ef9 e862485907                     call       0x7f43136cf160
04efe e99dd5ffff                     jmp        0x7f430c137ea0
04f03 49ba30044200437f0000           movabs     r10, 0x7f4300420430
04f0d 4c89542408                     mov        qword ptr [rsp + 8], r10
04f12 48c70424aa020000               mov        qword ptr [rsp], 0x2aa
04f1a e841415907                     call       0x7f43136cea60
04f1f e9c8d6ffff                     jmp        0x7f430c137fec
04f24 49ba38f00500437f0000           movabs     r10, 0x7f430005f038
04f2e 4c89542408                     mov        qword ptr [rsp + 8], r10
04f33 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f3b e820415907                     call       0x7f43136cea60
04f40 e99dd7ffff                     jmp        0x7f430c1380e2
04f45 e896ac5907                     call       0x7f43136d55e0
04f4a 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04f54 4883e4f0                       and        rsp, 0xfffffffffffffff0
04f58 e88342ca1f                     call       0x7f432bddebe0
04f5d f4                             hlt        
04f5e 49baa8241400437f0000           movabs     r10, 0x7f43001424a8
04f68 4c89542408                     mov        qword ptr [rsp + 8], r10
04f6d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f75 e8e6405907                     call       0x7f43136cea60
04f7a e90bd8ffff                     jmp        0x7f430c13818a
04f7f 49bad0325b1600000000           movabs     r10, 0x165b32d0
04f89 4c89542408                     mov        qword ptr [rsp + 8], r10
04f8e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f96 e8c5405907                     call       0x7f43136cea60
04f9b e923d8ffff                     jmp        0x7f430c1381c3
04fa0 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04fa8 e8b3635907                     call       0x7f43136d0d60
04fad 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04fb7 4883e4f0                       and        rsp, 0xfffffffffffffff0
04fbb e82042ca1f                     call       0x7f432bddebe0
04fc0 f4                             hlt        
04fc1 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04fc9 e892635907                     call       0x7f43136d0d60
04fce 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
04fd8 4883e4f0                       and        rsp, 0xfffffffffffffff0
04fdc e8ff41ca1f                     call       0x7f432bddebe0
04fe1 f4                             hlt        
04fe2 49baa0380c00437f0000           movabs     r10, 0x7f43000c38a0
04fec 4c89542408                     mov        qword ptr [rsp + 8], r10
04ff1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ff9 e862405907                     call       0x7f43136cea60
04ffe e98ed8ffff                     jmp        0x7f430c138291
05003 49bac8aa0c00437f0000           movabs     r10, 0x7f43000caac8
0500d 4c89542408                     mov        qword ptr [rsp + 8], r10
05012 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0501a e841405907                     call       0x7f43136cea60
0501f e9a0d8ffff                     jmp        0x7f430c1382c4
05024 49ba40870f00437f0000           movabs     r10, 0x7f43000f8740
0502e 4c89542408                     mov        qword ptr [rsp + 8], r10
05033 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0503b e820405907                     call       0x7f43136cea60
05040 e930d9ffff                     jmp        0x7f430c138375
05045 49baf80b0600437f0000           movabs     r10, 0x7f4300060bf8
0504f 4c89542408                     mov        qword ptr [rsp + 8], r10
05054 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0505c e8ff3f5907                     call       0x7f43136cea60
05061 e94ad9ffff                     jmp        0x7f430c1383b0
05066 49ba30450f00437f0000           movabs     r10, 0x7f43000f4530
05070 4c89542408                     mov        qword ptr [rsp + 8], r10
05075 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0507d e8de3f5907                     call       0x7f43136cea60
05082 e9a9d9ffff                     jmp        0x7f430c138430
05087 49bab8260600437f0000           movabs     r10, 0x7f43000626b8
05091 4c89542408                     mov        qword ptr [rsp + 8], r10
05096 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0509e e8bd3f5907                     call       0x7f43136cea60
050a3 e996daffff                     jmp        0x7f430c13853e
050a8 49ba502b281600000000           movabs     r10, 0x16282b50
050b2 4c89542408                     mov        qword ptr [rsp + 8], r10
050b7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050bf e89c3f5907                     call       0x7f43136cea60
050c4 e9b6daffff                     jmp        0x7f430c13857f
050c9 49ba20a9281600000000           movabs     r10, 0x1628a920
050d3 4c89542408                     mov        qword ptr [rsp + 8], r10
050d8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050e0 e87b3f5907                     call       0x7f43136cea60
050e5 e9c8daffff                     jmp        0x7f430c1385b2
050ea 48890424                       mov        qword ptr [rsp], rax
050ee e86d7d5907                     call       0x7f43136d2860
050f3 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
050fd 4883e4f0                       and        rsp, 0xfffffffffffffff0
05101 e8da40ca1f                     call       0x7f432bddebe0
05106 f4                             hlt        
05107 e8d4aa5907                     call       0x7f43136d55e0
0510c 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
05116 4883e4f0                       and        rsp, 0xfffffffffffffff0
0511a e8c140ca1f                     call       0x7f432bddebe0
0511f f4                             hlt        
05120 49bab8fe0500437f0000           movabs     r10, 0x7f430005feb8
0512a 4c89542408                     mov        qword ptr [rsp + 8], r10
0512f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05137 e8243f5907                     call       0x7f43136cea60
0513c e9cddcffff                     jmp        0x7f430c13880e
05141 49baa8241400437f0000           movabs     r10, 0x7f43001424a8
0514b 4c89542408                     mov        qword ptr [rsp + 8], r10
05150 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05158 e8033f5907                     call       0x7f43136cea60
0515d e965ddffff                     jmp        0x7f430c1388c7
05162 49bad0325b1600000000           movabs     r10, 0x165b32d0
0516c 4c89542408                     mov        qword ptr [rsp + 8], r10
05171 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05179 e8e23e5907                     call       0x7f43136cea60
0517e e98bddffff                     jmp        0x7f430c13890e
05183 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
0518b e8d0615907                     call       0x7f43136d0d60
05190 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
0519a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0519e e83d40ca1f                     call       0x7f432bddebe0
051a3 f4                             hlt        
051a4 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
051ac e8af615907                     call       0x7f43136d0d60
051b1 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
051bb 4883e4f0                       and        rsp, 0xfffffffffffffff0
051bf e81c40ca1f                     call       0x7f432bddebe0
051c4 f4                             hlt        
051c5 e816aa5907                     call       0x7f43136d55e0
051ca 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
051d4 4883e4f0                       and        rsp, 0xfffffffffffffff0
051d8 e80340ca1f                     call       0x7f432bddebe0
051dd f4                             hlt        
051de 49bab8260600437f0000           movabs     r10, 0x7f43000626b8
051e8 4c89542408                     mov        qword ptr [rsp + 8], r10
051ed 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
051f5 e8663e5907                     call       0x7f43136cea60
051fa e91bdfffff                     jmp        0x7f430c138b1a
051ff 49ba502b281600000000           movabs     r10, 0x16282b50
05209 4c89542408                     mov        qword ptr [rsp + 8], r10
0520e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05216 e8453e5907                     call       0x7f43136cea60
0521b e947dfffff                     jmp        0x7f430c138b67
05220 49ba20a9281600000000           movabs     r10, 0x1628a920
0522a 4c89542408                     mov        qword ptr [rsp + 8], r10
0522f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05237 e8243e5907                     call       0x7f43136cea60
0523c e95edfffff                     jmp        0x7f430c138b9f
05241 49ba30044200437f0000           movabs     r10, 0x7f4300420430
0524b 4c89542408                     mov        qword ptr [rsp + 8], r10
05250 48c70424e8020000               mov        qword ptr [rsp], 0x2e8
05258 e8033e5907                     call       0x7f43136cea60
0525d e9b0e0ffff                     jmp        0x7f430c138d12
05262 49bac02e4200437f0000           movabs     r10, 0x7f4300422ec0
0526c 4c89542408                     mov        qword ptr [rsp + 8], r10
05271 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05279 e8e23d5907                     call       0x7f43136cea60
0527e e96fe1ffff                     jmp        0x7f430c138df2
05283 49b80000000000000000           movabs     r8, 0
0528d b8000f050a                     mov        eax, 0xa050f00
05292 e8c9445907                     call       0x7f43136cf160
05297 e95ce1ffff                     jmp        0x7f430c138df8
0529c 49ba30044200437f0000           movabs     r10, 0x7f4300420430
052a6 4c89542408                     mov        qword ptr [rsp + 8], r10
052ab 48c7042420030000               mov        qword ptr [rsp], 0x320
052b3 e8a83d5907                     call       0x7f43136cea60
052b8 e987e2ffff                     jmp        0x7f430c138f44
052bd 49ba38f00500437f0000           movabs     r10, 0x7f430005f038
052c7 4c89542408                     mov        qword ptr [rsp + 8], r10
052cc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052d4 e8873d5907                     call       0x7f43136cea60
052d9 e947e3ffff                     jmp        0x7f430c139025
052de e8fda85907                     call       0x7f43136d55e0
052e3 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
052ed 4883e4f0                       and        rsp, 0xfffffffffffffff0
052f1 e8ea3eca1f                     call       0x7f432bddebe0
052f6 f4                             hlt        
052f7 49baa8241400437f0000           movabs     r10, 0x7f43001424a8
05301 4c89542408                     mov        qword ptr [rsp + 8], r10
05306 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0530e e84d3d5907                     call       0x7f43136cea60
05313 e9b4e3ffff                     jmp        0x7f430c1390cc
05318 49bad0325b1600000000           movabs     r10, 0x165b32d0
05322 4c89542408                     mov        qword ptr [rsp + 8], r10
05327 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0532f e82c3d5907                     call       0x7f43136cea60
05334 e9cce3ffff                     jmp        0x7f430c139105
05339 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05341 e81a605907                     call       0x7f43136d0d60
05346 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
05350 4883e4f0                       and        rsp, 0xfffffffffffffff0
05354 e8873eca1f                     call       0x7f432bddebe0
05359 f4                             hlt        
0535a 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05362 e8f95f5907                     call       0x7f43136d0d60
05367 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
05371 4883e4f0                       and        rsp, 0xfffffffffffffff0
05375 e8663eca1f                     call       0x7f432bddebe0
0537a f4                             hlt        
0537b 49baa0380c00437f0000           movabs     r10, 0x7f43000c38a0
05385 4c89542408                     mov        qword ptr [rsp + 8], r10
0538a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05392 e8c93c5907                     call       0x7f43136cea60
05397 e92fe4ffff                     jmp        0x7f430c1391cb
0539c 49bac8aa0c00437f0000           movabs     r10, 0x7f43000caac8
053a6 4c89542408                     mov        qword ptr [rsp + 8], r10
053ab 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053b3 e8a83c5907                     call       0x7f43136cea60
053b8 e941e4ffff                     jmp        0x7f430c1391fe
053bd 49ba40870f00437f0000           movabs     r10, 0x7f43000f8740
053c7 4c89542408                     mov        qword ptr [rsp + 8], r10
053cc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053d4 e8873c5907                     call       0x7f43136cea60
053d9 e9c4e4ffff                     jmp        0x7f430c1392a2
053de 49baf80b0600437f0000           movabs     r10, 0x7f4300060bf8
053e8 4c89542408                     mov        qword ptr [rsp + 8], r10
053ed 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053f5 e8663c5907                     call       0x7f43136cea60
053fa e9d9e4ffff                     jmp        0x7f430c1392d8
053ff 49ba30450f00437f0000           movabs     r10, 0x7f43000f4530
05409 4c89542408                     mov        qword ptr [rsp + 8], r10
0540e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05416 e8453c5907                     call       0x7f43136cea60
0541b e938e5ffff                     jmp        0x7f430c139358
05420 49bab8260600437f0000           movabs     r10, 0x7f43000626b8
0542a 4c89542408                     mov        qword ptr [rsp + 8], r10
0542f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05437 e8243c5907                     call       0x7f43136cea60
0543c e925e6ffff                     jmp        0x7f430c139466
05441 49ba502b281600000000           movabs     r10, 0x16282b50
0544b 4c89542408                     mov        qword ptr [rsp + 8], r10
05450 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05458 e8033c5907                     call       0x7f43136cea60
0545d e945e6ffff                     jmp        0x7f430c1394a7
05462 49ba20a9281600000000           movabs     r10, 0x1628a920
0546c 4c89542408                     mov        qword ptr [rsp + 8], r10
05471 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05479 e8e23b5907                     call       0x7f43136cea60
0547e e957e6ffff                     jmp        0x7f430c1394da
05483 48890424                       mov        qword ptr [rsp], rax
05487 e8d4795907                     call       0x7f43136d2860
0548c 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
05496 4883e4f0                       and        rsp, 0xfffffffffffffff0
0549a e8413dca1f                     call       0x7f432bddebe0
0549f f4                             hlt        
054a0 e83ba75907                     call       0x7f43136d55e0
054a5 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
054af 4883e4f0                       and        rsp, 0xfffffffffffffff0
054b3 e8283dca1f                     call       0x7f432bddebe0
054b8 f4                             hlt        
054b9 49bab8fe0500437f0000           movabs     r10, 0x7f430005feb8
054c3 4c89542408                     mov        qword ptr [rsp + 8], r10
054c8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
054d0 e88b3b5907                     call       0x7f43136cea60
054d5 e95ce8ffff                     jmp        0x7f430c139736
054da 49baa8241400437f0000           movabs     r10, 0x7f43001424a8
054e4 4c89542408                     mov        qword ptr [rsp + 8], r10
054e9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
054f1 e86a3b5907                     call       0x7f43136cea60
054f6 e9f4e8ffff                     jmp        0x7f430c1397ef
054fb 49bad0325b1600000000           movabs     r10, 0x165b32d0
05505 4c89542408                     mov        qword ptr [rsp + 8], r10
0550a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05512 e8493b5907                     call       0x7f43136cea60
05517 e917e9ffff                     jmp        0x7f430c139833
0551c 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05524 e8375e5907                     call       0x7f43136d0d60
05529 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
05533 4883e4f0                       and        rsp, 0xfffffffffffffff0
05537 e8a43cca1f                     call       0x7f432bddebe0
0553c f4                             hlt        
0553d 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05545 e8165e5907                     call       0x7f43136d0d60
0554a 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
05554 4883e4f0                       and        rsp, 0xfffffffffffffff0
05558 e8833cca1f                     call       0x7f432bddebe0
0555d f4                             hlt        
0555e e87da65907                     call       0x7f43136d55e0
05563 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
0556d 4883e4f0                       and        rsp, 0xfffffffffffffff0
05571 e86a3cca1f                     call       0x7f432bddebe0
05576 f4                             hlt        
05577 49bab8260600437f0000           movabs     r10, 0x7f43000626b8
05581 4c89542408                     mov        qword ptr [rsp + 8], r10
05586 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0558e e8cd3a5907                     call       0x7f43136cea60
05593 e9a2eaffff                     jmp        0x7f430c139a3a
05598 49ba502b281600000000           movabs     r10, 0x16282b50
055a2 4c89542408                     mov        qword ptr [rsp + 8], r10
055a7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
055af e8ac3a5907                     call       0x7f43136cea60
055b4 e9ceeaffff                     jmp        0x7f430c139a87
055b9 49ba20a9281600000000           movabs     r10, 0x1628a920
055c3 4c89542408                     mov        qword ptr [rsp + 8], r10
055c8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
055d0 e88b3a5907                     call       0x7f43136cea60
055d5 e9e5eaffff                     jmp        0x7f430c139abf
055da 49ba30044200437f0000           movabs     r10, 0x7f4300420430
055e4 4c89542408                     mov        qword ptr [rsp + 8], r10
055e9 48c704245a030000               mov        qword ptr [rsp], 0x35a
055f1 e86a3a5907                     call       0x7f43136cea60
055f6 e94cecffff                     jmp        0x7f430c139c47
055fb 90                             nop        
055fc 90                             nop        
055fd 90                             nop        
055fe 90                             nop        
055ff e85c4c5f07                     call       0x7f431372fc60
05604 e955eeffff                     jmp        0x7f430c139e5e
05609 49ba7f9e130c437f0000           movabs     r10, 0x7f430c139e7f
05613 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
0561a e941735f07                     jmp        0x7f4313732360
0561f 48ba0000000000000000           movabs     rdx, 0
05629 b8000f050a                     mov        eax, 0xa050f00
0562e e82d4f5907                     call       0x7f43136cff60
05633 e978eeffff                     jmp        0x7f430c139eb0
05638 e8a3a55907                     call       0x7f43136d55e0
0563d 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
05647 4883e4f0                       and        rsp, 0xfffffffffffffff0
0564b e8903bca1f                     call       0x7f432bddebe0
05650 f4                             hlt        
05651 488bd2                         mov        rdx, rdx
05654 e887955907                     call       0x7f43136d45e0
05659 e9a1eeffff                     jmp        0x7f430c139eff
0565e 48ba0000000000000000           movabs     rdx, 0
05668 b8000f050a                     mov        eax, 0xa050f00
0566d e8ee405907                     call       0x7f43136cf160
05672 e989eeffff                     jmp        0x7f430c139f00
05677 48ba0000000000000000           movabs     rdx, 0
05681 b8000f050a                     mov        eax, 0xa050f00
05686 e8d54e5907                     call       0x7f43136cff60
0568b e908efffff                     jmp        0x7f430c139f98
05690 e84ba55907                     call       0x7f43136d55e0
05695 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
0569f 4883e4f0                       and        rsp, 0xfffffffffffffff0
056a3 e8383bca1f                     call       0x7f432bddebe0
056a8 f4                             hlt        
056a9 488bd2                         mov        rdx, rdx
056ac e82f955907                     call       0x7f43136d45e0
056b1 e931efffff                     jmp        0x7f430c139fe7
056b6 48ba0000000000000000           movabs     rdx, 0
056c0 b8000f050a                     mov        eax, 0xa050f00
056c5 e8964e5907                     call       0x7f43136cff60
056ca e969efffff                     jmp        0x7f430c13a038
056cf e80ca55907                     call       0x7f43136d55e0
056d4 48bfb5809c2a437f0000           movabs     rdi, 0x7f432a9c80b5
056de 4883e4f0                       and        rsp, 0xfffffffffffffff0
056e2 e8f93aca1f                     call       0x7f432bddebe0
056e7 f4                             hlt        
056e8 488bd2                         mov        rdx, rdx
056eb e8f0945907                     call       0x7f43136d45e0
056f0 e992efffff                     jmp        0x7f430c13a087
056f5 498b8708060000                 mov        rax, qword ptr [r15 + 0x608]
056fc 49c7870806000000000000         mov        qword ptr [r15 + 0x608], 0
05707 49c7871006000000000000         mov        qword ptr [r15 + 0x610], 0
05712 4881c450020000                 add        rsp, 0x250
05719 5d                             pop        rbp
0571a e941b45907                     jmp        0x7f43136d6560
0571f f4                             hlt        
