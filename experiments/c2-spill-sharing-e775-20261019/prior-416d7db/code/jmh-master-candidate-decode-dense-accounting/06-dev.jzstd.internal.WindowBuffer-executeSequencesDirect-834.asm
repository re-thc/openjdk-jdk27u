00000 e8bbab1f16                     call       0x7f256207a340
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecc0000000                 sub        rsp, 0xc0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f8544220000                   jne        0x7f254be819f2
0002e 4c8b9640010000                 mov        r10, qword ptr [rsi + 0x140]
00035 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0003a 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
00041 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00049 448b5e68                       mov        r11d, dword ptr [rsi + 0x68]
0004d 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00052 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
00059 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
00061 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
00068 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00070 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
00077 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0007f 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
00086 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0008e 448b9e30010000                 mov        r11d, dword ptr [rsi + 0x130]
00095 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
0009a 448b9618010000                 mov        r10d, dword ptr [rsi + 0x118]
000a1 4489542428                     mov        dword ptr [rsp + 0x28], r10d
000a6 8b9ef8000000                   mov        ebx, dword ptr [rsi + 0xf8]
000ac 448b9ef0000000                 mov        r11d, dword ptr [rsi + 0xf0]
000b3 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
000b8 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000bf 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
000c4 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000cb 4c89542440                     mov        qword ptr [rsp + 0x40], r10
000d0 448b96a0000000                 mov        r10d, dword ptr [rsi + 0xa0]
000d7 4489542448                     mov        dword ptr [rsp + 0x48], r10d
000dc 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000e3 4c89542458                     mov        qword ptr [rsp + 0x58], r10
000e8 448b5e78                       mov        r11d, dword ptr [rsi + 0x78]
000ec 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
000f1 448b5e70                       mov        r11d, dword ptr [rsi + 0x70]
000f5 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
000fa 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
00101 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00106 488bfe                         mov        rdi, rsi
00109 c5f877                         vzeroupper 
0010c 49ba800a1662257f0000           movabs     r10, 0x7f2562160a80
00116 41ffd2                         call       r10
00119 0f1f840000000000               nop        dword ptr [rax + rax]
00121 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00126 4d85d2                         test       r10, r10
00129 0f84c5130000                   je         0x7f254be80c74
0012f 458b1a                         mov        r11d, dword ptr [r10]
00132 41c1eb0d                       shr        r11d, 0xd
00136 4181fb2c420000                 cmp        r11d, 0x422c
0013d 0f8509160000                   jne        0x7f254be80ecc
00143 4c891424                       mov        qword ptr [rsp], r10
00147 488bac2480000000               mov        rbp, qword ptr [rsp + 0x80]
0014f 4885ed                         test       rbp, rbp
00152 0f84a8130000                   je         0x7f254be80c80
00158 448b5500                       mov        r10d, dword ptr [rbp]
0015c 41c1ea0d                       shr        r10d, 0xd
00160 4181fae4050000                 cmp        r10d, 0x5e4
00167 0f85df150000                   jne        0x7f254be80ecc
0016d 4c8bd5                         mov        r10, rbp
00170 4c89542408                     mov        qword ptr [rsp + 8], r10
00175 488bac2488000000               mov        rbp, qword ptr [rsp + 0x88]
0017d 4885ed                         test       rbp, rbp
00180 0f8487130000                   je         0x7f254be80c8d
00186 448b5d00                       mov        r11d, dword ptr [rbp]
0018a 41c1eb0d                       shr        r11d, 0xd
0018e 4181fbe7050000                 cmp        r11d, 0x5e7
00195 0f85b1150000                   jne        0x7f254be80ecc
0019b 4c8bd5                         mov        r10, rbp
0019e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001a3 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
001ab 4885ed                         test       rbp, rbp
001ae 0f8466130000                   je         0x7f254be80c9a
001b4 448b5500                       mov        r10d, dword ptr [rbp]
001b8 41c1ea0d                       shr        r10d, 0xd
001bc 4181fae6050000                 cmp        r10d, 0x5e6
001c3 0f8583150000                   jne        0x7f254be80ecc
001c9 4c8bd5                         mov        r10, rbp
001cc 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001d1 488bac2498000000               mov        rbp, qword ptr [rsp + 0x98]
001d9 4885ed                         test       rbp, rbp
001dc 0f8445130000                   je         0x7f254be80ca7
001e2 448b5500                       mov        r10d, dword ptr [rbp]
001e6 41c1ea0d                       shr        r10d, 0xd
001ea 4181fae6050000                 cmp        r10d, 0x5e6
001f1 0f8555150000                   jne        0x7f254be80ecc
001f7 4c8bd5                         mov        r10, rbp
001fa 4c89542470                     mov        qword ptr [rsp + 0x70], r10
001ff 488bac24a0000000               mov        rbp, qword ptr [rsp + 0xa0]
00207 4885ed                         test       rbp, rbp
0020a 0f8424130000                   je         0x7f254be80cb4
00210 448b5500                       mov        r10d, dword ptr [rbp]
00214 41c1ea0d                       shr        r10d, 0xd
00218 4181fae4050000                 cmp        r10d, 0x5e4
0021f 0f8527150000                   jne        0x7f254be80ecc
00225 48896c2430                     mov        qword ptr [rsp + 0x30], rbp
0022a 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0022f 458b5204                       mov        r10d, dword ptr [r10 + 4]
00233 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00238 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0023d 4585d2                         test       r10d, r10d
00240 0f8452140000                   je         0x7f254be80e18
00246 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0024b 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0024f 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00254 4585db                         test       r11d, r11d
00257 0f863b140000                   jbe        0x7f254be80e18
0025d 4183fb01                       cmp        r11d, 1
00261 0f8631140000                   jbe        0x7f254be80e18
00267 4183fb02                       cmp        r11d, 2
0026b 0f8627140000                   jbe        0x7f254be80e18
00271 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00276 458b5204                       mov        r10d, dword ptr [r10 + 4]
0027a 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0027f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00284 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00288 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0028d 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00292 4183c3f1                       add        r11d, -0xf
00296 4585db                         test       r11d, r11d
00299 0f8cf9130000                   jl         0x7f254be80e18
0029f 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
002a4 4183c2f1                       add        r10d, -0xf
002a8 4585d2                         test       r10d, r10d
002ab 0f8ce7130000                   jl         0x7f254be80e18
002b1 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
002b6 4183c3f9                       add        r11d, -7
002ba 4585db                         test       r11d, r11d
002bd 0f8cd5130000                   jl         0x7f254be80e18
002c3 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
002c8 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
002d0 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
002d5 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
002dd 4183c2f1                       add        r10d, -0xf
002e1 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
002e9 4183c3f1                       add        r11d, -0xf
002ed 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
002f5 e9ba010000                     jmp        0x7f254be7fc34
002fa 4533d2                         xor        r10d, r10d
002fd 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
00302 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00307 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
0030b 83f803                         cmp        eax, 3
0030e 0f8eaa030000                   jle        0x7f254be7fe3e
00314 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00319 45895310                       mov        dword ptr [r11 + 0x10], r10d
0031d 458b5308                       mov        r10d, dword ptr [r11 + 8]
00321 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00325 448d50fd                       lea        r10d, [rax - 3]
00329 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00331 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00336 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
0033e 45895a08                       mov        dword ptr [r10 + 8], r11d
00342 4c63942490000000               movsxd     r10, dword ptr [rsp + 0x90]
0034a 4c63db                         movsxd     r11, ebx
0034d 4c035c2440                     add        r11, qword ptr [rsp + 0x40]
00352 486354246c                     movsxd     rdx, dword ptr [rsp + 0x6c]
00357 4c03da                         add        r11, rdx
0035a 4d3bd3                         cmp        r10, r11
0035d 0f8f6d0f0000                   jg         0x7f254be80a50
00363 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0036b 4585d2                         test       r10d, r10d
0036e 0f8e4c0e0000                   jle        0x7f254be80940
00374 448beb                         mov        r13d, ebx
00377 44036c246c                     add        r13d, dword ptr [rsp + 0x6c]
0037c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00381 440354246c                     add        r10d, dword ptr [rsp + 0x6c]
00386 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
0038e 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00393 4503dd                         add        r11d, r13d
00396 443b5c2460                     cmp        r11d, dword ptr [rsp + 0x60]
0039b 0f8f17090000                   jg         0x7f254be80438
003a1 443b542464                     cmp        r10d, dword ptr [rsp + 0x64]
003a6 0f8f7c0f0000                   jg         0x7f254be80aa8
003ac 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
003b1 4183fa10                       cmp        r10d, 0x10
003b5 0f8fa9010000                   jg         0x7f254be7fce4
003bb 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
003c0 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
003c8 0f832e0d0000                   jae        0x7f254be8087c
003ce 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
003d3 458bcb                         mov        r9d, r11d
003d6 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
003db c4817a6f440b08                 vmovdqu    xmm0, xmmword ptr [r11 + r9 + 8]
003e2 3b9c248c000000                 cmp        ebx, dword ptr [rsp + 0x8c]
003e9 0f83510d0000                   jae        0x7f254be808c0
003ef 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
003f4 4503d9                         add        r11d, r9d
003f7 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
003ff 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00404 c4c17a7f441a08                 vmovdqu    xmmword ptr [r10 + rbx + 8], xmm0
0040b 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00410 4403d3                         add        r10d, ebx
00413 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00418 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0041d 442b842490000000               sub        r8d, dword ptr [rsp + 0x90]
00425 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
0042a 4183fb10                       cmp        r11d, 0x10
0042e 0f8fd80f0000                   jg         0x7f254be80b8c
00434 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0043c 4183fa10                       cmp        r10d, 0x10
00440 0f8c4e030000                   jl         0x7f254be7ff14
00446 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
0044e 0f83e00b0000                   jae        0x7f254be807b4
00454 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00459 c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
00460 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00465 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
0046d 0f831d0c0000                   jae        0x7f254be80810
00473 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00478 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0047d c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00484 8b5c2478                       mov        ebx, dword ptr [rsp + 0x78]
00488 4103da                         add        ebx, r10d
0048b 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00490 41ffc3                         inc        r11d
00493 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00498 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0049c 418502                         test       dword ptr [r10], eax
0049f 48894424f8                     mov        qword ptr [rsp - 8], rax
004a4 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
004ab 89442438                       mov        dword ptr [rsp + 0x38], eax
004af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
004b4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
004b9 498d741a08                     lea        rsi, [r10 + rbx + 8]
004be 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
004c3 442b442438                     sub        r8d, dword ptr [rsp + 0x38]
004c8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
004cd 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
004d2 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
004d7 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
004dc 443b542428                     cmp        r10d, dword ptr [rsp + 0x28]
004e1 0f8d23070000                   jge        0x7f254be8038a
004e7 443b542414                     cmp        r10d, dword ptr [rsp + 0x14]
004ec 0f83050b0000                   jae        0x7f254be80777
004f2 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
004f7 4f8b54d308                     mov        r10, qword ptr [r11 + r10*8 + 8]
004fc 4d8bda                         mov        r11, r10
004ff 49c1eb12                       shr        r11, 0x12
00503 458bdb                         mov        r11d, r11d
00506 4181e3ffff0300                 and        r11d, 0x3ffff
0050d 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
00512 458bda                         mov        r11d, r10d
00515 49c1fa24                       sar        r10, 0x24
00519 4181e3ffff0100                 and        r11d, 0x1ffff
00520 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00525 458bd2                         mov        r10d, r10d
00528 418bc2                         mov        eax, r10d
0052b 4585d2                         test       r10d, r10d
0052e 0f8cac0c0000                   jl         0x7f254be80960
00534 4585db                         test       r11d, r11d
00537 0f84bdfdffff                   je         0x7f254be7fa7a
0053d 453bd8                         cmp        r11d, r8d
00540 0f8ebcfdffff                   jle        0x7f254be7fa82
00546 be45ffffff                     mov        esi, 0xffffff45
0054b 418beb                         mov        ebp, r11d
0054e 44890424                       mov        dword ptr [rsp], r8d
00552 6690                           nop        
00554 c5f877                         vzeroupper 
00557 e88441b4ff                     call       0x7f254b9c3e60
0055c 0f1f840054060001               nop        dword ptr [rax + rax + 0x1000654]
00564 4183fa30                       cmp        r10d, 0x30
00568 0f8fad050000                   jg         0x7f254be8029b
0056e 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00573 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
0057b 0f83c00f0000                   jae        0x7f254be80cc1
00581 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00586 418bd2                         mov        edx, r10d
00589 4d63ca                         movsxd     r9, r10d
0058c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00591 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00598 3b9c248c000000                 cmp        ebx, dword ptr [rsp + 0x8c]
0059f 0f832f100000                   jae        0x7f254be80d54
005a5 448d5b10                       lea        r11d, [rbx + 0x10]
005a9 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
005b1 4c63db                         movsxd     r11, ebx
005b4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
005b9 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
005c0 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
005c8 453bd5                         cmp        r10d, r13d
005cb 0f8dd3000000                   jge        0x7f254be7fe24
005d1 4d2bcb                         sub        r9, r11
005d4 4d63c2                         movsxd     r8, r10d
005d7 48638c2480000000               movsxd     rcx, dword ptr [rsp + 0x80]
005df 4883c1f1                       add        rcx, -0xf
005e3 4f8d1c08                       lea        r11, [r8 + r9]
005e7 4c3bd9                         cmp        r11, rcx
005ea 0f8384110000                   jae        0x7f254be80ef4
005f0 4d63dd                         movsxd     r11, r13d
005f3 4d2bd8                         sub        r11, r8
005f6 4983c30f                       add        r11, 0xf
005fa 4983e3f0                       and        r11, 0xfffffffffffffff0
005fe 458bdb                         mov        r11d, r11d
00601 458d441b10                     lea        r8d, [r11 + rbx + 0x10]
00606 4d63d8                         movsxd     r11, r8d
00609 4f8d440bf0                     lea        r8, [r11 + r9 - 0x10]
0060e 4c3bc1                         cmp        r8, rcx
00611 0f835d110000                   jae        0x7f254be80ef4
00617 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
0061f 0f834f110000                   jae        0x7f254be80ef4
00625 4983c3f0                       add        r11, -0x10
00629 4c63942484000000               movsxd     r10, dword ptr [rsp + 0x84]
00631 4983c2f1                       add        r10, -0xf
00635 4d3bda                         cmp        r11, r10
00638 0f8336110000                   jae        0x7f254be80ef4
0063e 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00645 0f8fbd110000                   jg         0x7f254be80f88
0064b 448bd2                         mov        r10d, edx
0064e 442bd3                         sub        r10d, ebx
00651 0f1f840000000000               nop        dword ptr [rax + rax]
00659 0f1f8000000000                 nop        dword ptr [rax]
00660 458bc2                         mov        r8d, r10d
00663 4403842494000000               add        r8d, dword ptr [rsp + 0x94]
0066b 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00670 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
00677 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0067f 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00684 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
0068b 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
00693 4183c010                       add        r8d, 0x10
00697 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
0069f 453bc5                         cmp        r8d, r13d
006a2 7cbc                           jl         0x7f254be7fde0
006a4 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
006a9 4403d2                         add        r10d, edx
006ac 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
006b4 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
006b9 e95afdffff                     jmp        0x7f254be7fb98
006be 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
006c3 4585c0                         test       r8d, r8d
006c6 7407                           je         0x7f254be7fe4f
006c8 448d58ff                       lea        r11d, [rax - 1]
006cc 418bc3                         mov        eax, r11d
006cf 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
006d4 458b4b08                       mov        r9d, dword ptr [r11 + 8]
006d8 85c0                           test       eax, eax
006da 7473                           je         0x7f254be7fecf
006dc 83f803                         cmp        eax, 3
006df 0f849f040000                   je         0x7f254be80304
006e5 83f802                         cmp        eax, 2
006e8 7772                           ja         0x7f254be7fedc
006ea 3b44242c                       cmp        eax, dword ptr [rsp + 0x2c]
006ee 0f83a8110000                   jae        0x7f254be8101c
006f4 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
006f9 458b4c8308                     mov        r9d, dword ptr [r11 + rax*4 + 8]
006fe 85c0                           test       eax, eax
00700 7e44                           jle        0x7f254be7fec6
00702 448d50ff                       lea        r10d, [rax - 1]
00706 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
0070b 0f8373130000                   jae        0x7f254be81204
00711 33c9                           xor        ecx, ecx
00713 458bdb                         mov        r11d, r11d
00716 4183c3cc                       add        r11d, -0x34
0071a 41c1eb02                       shr        r11d, 2
0071e 458d5403ff                     lea        r10d, [r11 + rax - 1]
00723 4c63d8                         movsxd     r11, eax
00726 41b804000000                   mov        r8d, 4
0072c c442b8f5d2                     bzhi       r10, r10, r8
00731 4d2bda                         sub        r11, r10
00734 49ffcb                         dec        r11
00737 4d85db                         test       r11, r11
0073a 4c0f4cd9                       cmovl      r11, rcx
0073e 458bd3                         mov        r10d, r11d
00741 e9ad020000                     jmp        0x7f254be80173
00746 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0074b 45894a08                       mov        dword ptr [r10 + 8], r9d
0074f 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
00757 e9e6fbffff                     jmp        0x7f254be7fac2
0075c 48be1047bce200000000           movabs     rsi, 0xe2bc4710
00766 8beb                           mov        ebp, ebx
00768 c5f877                         vzeroupper 
0076b e870a9a7ff                     call       0x7f254b8fa860
00770 0f1f840068080002               nop        dword ptr [rax + rax + 0x2000868]
00778 4885c0                         test       rax, rax
0077b 0f841f120000                   je         0x7f254be81120
00781 488bf0                         mov        rsi, rax
00784 c5f877                         vzeroupper 
00787 4881c4c0000000                 add        rsp, 0xc0
0078e 5d                             pop        rbp
0078f e9ccbbb4ff                     jmp        0x7f254b9cbae0
00794 44035c2438                     add        r11d, dword ptr [rsp + 0x38]
00799 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
007a1 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
007a6 0f8d84010000                   jge        0x7f254be800b0
007ac 4183fa08                       cmp        r10d, 8
007b0 0f8d36170000                   jge        0x7f254be8166c
007b6 443b44247c                     cmp        r8d, dword ptr [rsp + 0x7c]
007bb 0f83d3130000                   jae        0x7f254be81314
007c1 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
007c6 430fbe6c0308                   movsx      ebp, byte ptr [r11 + r8 + 8]
007cc 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
007d1 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
007d6 0f8328140000                   jae        0x7f254be81384
007dc 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
007e1 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
007e6 458d5803                       lea        r11d, [r8 + 3]
007ea 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
007ef 41ffc1                         inc        r9d
007f2 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
007fa 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
007ff 0f832f140000                   jae        0x7f254be813b4
00805 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0080a 4183c303                       add        r11d, 3
0080e 4d63d0                         movsxd     r10, r8d
00811 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
00816 430fbe6c1109                   movsx      ebp, byte ptr [r9 + r10 + 9]
0081c 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
00821 0f8341140000                   jae        0x7f254be813e8
00827 4c635c2438                     movsxd     r11, dword ptr [rsp + 0x38]
0082c 43886c1909                     mov        byte ptr [r9 + r11 + 9], bpl
00831 470fbe4c110a                   movsx      r9d, byte ptr [r9 + r10 + 0xa]
00837 488b4c2430                     mov        rcx, qword ptr [rsp + 0x30]
0083c 46884c190a                     mov        byte ptr [rcx + r11 + 0xa], r9b
00841 460fbe4c110b                   movsx      r9d, byte ptr [rcx + r10 + 0xb]
00847 46884c190b                     mov        byte ptr [rcx + r11 + 0xb], r9b
0084c 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00854 4183fa08                       cmp        r10d, 8
00858 0f833a140000                   jae        0x7f254be81418
0085e 49ba30b6b6e200000000           movabs     r10, 0xe2b6b630
00868 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
00870 4703448a08                     add        r8d, dword ptr [r10 + r9*4 + 8]
00875 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
0087a 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
0087f 4183fa04                       cmp        r10d, 4
00883 7e3b                           jle        0x7f254be80040
00885 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00889 83c504                         add        ebp, 4
0088c 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00891 418bd0                         mov        edx, r8d
00894 c5f877                         vzeroupper 
00897 e844a8a7ff                     call       0x7f254b8fa860
0089c 0f1f840094090003               nop        dword ptr [rax + rax + 0x3000994]
008a4 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
008a9 8bd5                           mov        edx, ebp
008ab 8bc8                           mov        ecx, eax
008ad 666690                         nop        
008b0 c5f877                         vzeroupper 
008b3 e828a8a7ff                     call       0x7f254b8fa860
008b8 0f1f8400b0090004               nop        dword ptr [rax + rax + 0x40009b0]
008c0 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
008c5 4183fa08                       cmp        r10d, 8
008c9 7e59                           jle        0x7f254be800a4
008cb 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
008cf 83c508                         add        ebp, 8
008d2 49ba58b6b6e200000000           movabs     r10, 0xe2b6b658
008dc 8b54246c                       mov        edx, dword ptr [rsp + 0x6c]
008e0 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
008e8 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
008ed 83c208                         add        edx, 8
008f0 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
008f5 666690                         nop        
008f8 c5f877                         vzeroupper 
008fb e8e0a7a7ff                     call       0x7f254b8fa860
00900 0f1f8400f8090005               nop        dword ptr [rax + rax + 0x50009f8]
00908 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
0090d 8bd5                           mov        edx, ebp
0090f 488bc8                         mov        rcx, rax
00912 6690                           nop        
00914 c5f877                         vzeroupper 
00917 e8c4a7a7ff                     call       0x7f254b8fa860
0091c 0f1f8400140a0006               nop        dword ptr [rax + rax + 0x6000a14]
00924 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
0092b e95bfbffff                     jmp        0x7f254be7fc0b
00930 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00935 4183fb30                       cmp        r11d, 0x30
00939 0f8f8d140000                   jg         0x7f254be8154c
0093f 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00947 4183c2f9                       add        r10d, -7
0094b 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00953 453bc2                         cmp        r8d, r10d
00956 0f835c100000                   jae        0x7f254be81138
0095c 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
00964 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00969 4b8b6c0208                     mov        rbp, qword ptr [r10 + r8 + 8]
0096e 4889ac24a0000000               mov        qword ptr [rsp + 0xa0], rbp
00976 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0097b 443b942490000000               cmp        r10d, dword ptr [rsp + 0x90]
00983 0f8393100000                   jae        0x7f254be8119c
00989 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
0098d 89ac2490000000                 mov        dword ptr [rsp + 0x90], ebp
00994 48be28c122e200000000           movabs     rsi, 0xe222c128
0099e 4863cd                         movsxd     rcx, ebp
009a1 4883c108                       add        rcx, 8
009a5 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
009aa 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
009b2 4533c9                         xor        r9d, r9d
009b5 666690                         nop        
009b8 c5f877                         vzeroupper 
009bb e8209da7ff                     call       0x7f254b8f9e60
009c0 0f1f8400b80a0007               nop        dword ptr [rax + rax + 0x7000ab8]
009c8 448d5d08                       lea        r11d, [rbp + 8]
009cc 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
009d4 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
009dc 0f8c22130000                   jl         0x7f254be81484
009e2 8b5c2478                       mov        ebx, dword ptr [rsp + 0x78]
009e6 03dd                           add        ebx, ebp
009e8 e99efaffff                     jmp        0x7f254be7fc0b
009ed 666690                         nop        
009f0 418bc3                         mov        eax, r11d
009f3 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
009f8 458b448004                     mov        r8d, dword ptr [r8 + rax*4 + 4]
009fd 488b4c2470                     mov        rcx, qword ptr [rsp + 0x70]
00a02 4489448108                     mov        dword ptr [rcx + rax*4 + 8], r8d
00a07 448d58ff                       lea        r11d, [rax - 1]
00a0b 453bda                         cmp        r11d, r10d
00a0e 7fe0                           jg         0x7f254be80170
00a10 4183fb3f                       cmp        r11d, 0x3f
00a14 0f8e72110000                   jle        0x7f254be8130c
00a1a 448bd0                         mov        r10d, eax
00a1d 41ffca                         dec        r10d
00a20 418bca                         mov        ecx, r10d
00a23 eb0e                           jmp        0x7f254be801b3
00a25 6666660f1f840000000000         nop        word ptr [rax + rax]
00a30 418bca                         mov        ecx, r10d
00a33 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00a38 62d17e486f848bc8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0x38]
00a43 62d17e487f848bccffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0x34], zmm0
00a4e 62d17e486f848b88ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0x78]
00a59 62d17e487f848b8cffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0x74], zmm0
00a64 62d17e486f848b48ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0xb8]
00a6f 62d17e487f848b4cffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0xb4], zmm0
00a7a 62d17e486f848b08ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 - 0xf8]
00a85 62d17e487f848b0cffffff         vmovdqu32  zmmword ptr [r11 + rcx*4 - 0xf4], zmm0
00a90 448d51c0                       lea        r10d, [rcx - 0x40]
00a94 4183fa3f                       cmp        r10d, 0x3f
00a98 7f96                           jg         0x7f254be801b0
00a9a 4183fa0f                       cmp        r10d, 0xf
00a9e 7e2d                           jle        0x7f254be8024d
00aa0 448bd1                         mov        r10d, ecx
00aa3 4183c2c0                       add        r10d, -0x40
00aa7 90                             nop        
00aa8 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00aad 62917e486f8493c8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x38]
00ab8 62917e487f8493ccffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x34], zmm0
00ac3 4183c2f0                       add        r10d, -0x10
00ac7 4183fa0f                       cmp        r10d, 0xf
00acb 7fdb                           jg         0x7f254be80228
00acd 4585d2                         test       r10d, r10d
00ad0 0f8e70fcffff                   jle        0x7f254be7fec6
00ad6 6690                           nop        
00ad8 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00add 478b5c9304                     mov        r11d, dword ptr [r11 + r10*4 + 4]
00ae2 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00ae7 47895c9008                     mov        dword ptr [r8 + r10*4 + 8], r11d
00aec 41ffca                         dec        r10d
00aef 4585d2                         test       r10d, r10d
00af2 7fe4                           jg         0x7f254be80258
00af4 e94dfcffff                     jmp        0x7f254be7fec6
00af9 4d63d3                         movsxd     r10, r11d
00afc 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b03 c442a8f5db                     bzhi       r11, r11, r10
00b08 c4c1fb92fb                     kmovq      k7, r11
00b0d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b13 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b19 eb5f                           jmp        0x7f254be802fa
00b1b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00b20 4585db                         test       r11d, r11d
00b23 0f8c7f130000                   jl         0x7f254be81628
00b29 85db                           test       ebx, ebx
00b2b 0f8c77130000                   jl         0x7f254be81628
00b31 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00b36 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
00b3e 0f8264130000                   jb         0x7f254be81628
00b44 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00b49 453bd5                         cmp        r10d, r13d
00b4c 0f8256130000                   jb         0x7f254be81628
00b52 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00b57 4585db                         test       r11d, r11d
00b5a 741e                           je         0x7f254be802fa
00b5c 4883fa20                       cmp        rdx, 0x20
00b60 7697                           jbe        0x7f254be80279
00b62 c5f877                         vzeroupper 
00b65 49ba203f8e4b257f0000           movabs     r10, 0x7f254b8e3f20
00b6f 41ffd2                         call       r10
00b72 0f1f840000000000               nop        dword ptr [rax + rax]
00b7a 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
00b7f e994f8ffff                     jmp        0x7f254be7fb98
00b84 41ffc9                         dec        r9d
00b87 4585c9                         test       r9d, r9d
00b8a 7e1f                           jle        0x7f254be8032b
00b8c 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00b91 45895310                       mov        dword ptr [r11 + 0x10], r10d
00b95 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00b99 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00b9e 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
00ba2 45894a08                       mov        dword ptr [r10 + 8], r9d
00ba6 e9a4fbffff                     jmp        0x7f254be7fecf
00bab 48bee046bce200000000           movabs     rsi, 0xe2bc46e0
00bb5 8beb                           mov        ebp, ebx
00bb7 90                             nop        
00bb8 c5f877                         vzeroupper 
00bbb e820a5a7ff                     call       0x7f254b8fa860
00bc0 0f1f8400b80c0008               nop        dword ptr [rax + rax + 0x8000cb8]
00bc8 4885c0                         test       rax, rax
00bcb 0f85b0fbffff                   jne        0x7f254be7ff01
00bd1 bef6ffffff                     mov        esi, 0xfffffff6
00bd6 6690                           nop        
00bd8 c5f877                         vzeroupper 
00bdb e8003bb4ff                     call       0x7f254b9c3e60
00be0 0f1f8400d80c0009               nop        dword ptr [rax + rax + 0x9000cd8]
00be8 4d63d0                         movsxd     r10, r8d
00beb 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00bf2 c442a8f5db                     bzhi       r11, r11, r10
00bf7 c4c1fb92fb                     kmovq      k7, r11
00bfc 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c02 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c08 eb69                           jmp        0x7f254be803f3
00c0a 4585db                         test       r11d, r11d
00c0d 0f8cad130000                   jl         0x7f254be81740
00c13 85db                           test       ebx, ebx
00c15 0f8ca5130000                   jl         0x7f254be81740
00c1b 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00c20 443b542410                     cmp        r10d, dword ptr [rsp + 0x10]
00c25 0f8295130000                   jb         0x7f254be81740
00c2b 428d2c03                       lea        ebp, [rbx + r8]
00c2f 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00c34 443bdd                         cmp        r11d, ebp
00c37 0f8283130000                   jb         0x7f254be81740
00c3d 4585c0                         test       r8d, r8d
00c40 0f8c7a130000                   jl         0x7f254be81740
00c46 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00c4b 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
00c50 7421                           je         0x7f254be803f3
00c52 4963d0                         movsxd     rdx, r8d
00c55 4883fa20                       cmp        rdx, 0x20
00c59 768d                           jbe        0x7f254be80368
00c5b c5f877                         vzeroupper 
00c5e 49ba203f8e4b257f0000           movabs     r10, 0x7f254b8e3f20
00c68 41ffd2                         call       r10
00c6b 0f1f840000000000               nop        dword ptr [rax + rax]
00c73 4c8b1424                       mov        r10, qword ptr [rsp]
00c77 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00c7b c5f877                         vzeroupper 
00c7e 4881c4c0000000                 add        rsp, 0xc0
00c85 5d                             pop        rbp
00c86 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00c8a 0f87cc150000                   ja         0x7f254be819dc
00c90 c3                             ret        
00c91 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00c96 4d63d2                         movsxd     r10, r10d
00c99 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ca0 c442a8f5db                     bzhi       r11, r11, r10
00ca5 c4c1fb92fb                     kmovq      k7, r11
00caa 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00cb0 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00cb6 eb6d                           jmp        0x7f254be804a5
00cb8 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00cbd 4585d2                         test       r10d, r10d
00cc0 0f8429030000                   je         0x7f254be8076f
00cc6 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00ccb 4585db                         test       r11d, r11d
00cce 0f8c88130000                   jl         0x7f254be817dc
00cd4 85db                           test       ebx, ebx
00cd6 0f8c80130000                   jl         0x7f254be817dc
00cdc 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00ce1 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
00ce9 0f826d130000                   jb         0x7f254be817dc
00cef 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00cf4 453bd5                         cmp        r10d, r13d
00cf7 0f825f130000                   jb         0x7f254be817dc
00cfd 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00d02 4585db                         test       r11d, r11d
00d05 741e                           je         0x7f254be804a5
00d07 4883fa20                       cmp        rdx, 0x20
00d0b 7684                           jbe        0x7f254be80411
00d0d c5f877                         vzeroupper 
00d10 49ba203f8e4b257f0000           movabs     r10, 0x7f254b8e3f20
00d1a 41ffd2                         call       r10
00d1d 0f1f840000000000               nop        dword ptr [rax + rax]
00d25 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00d2a 4585d2                         test       r10d, r10d
00d2d 0f8e98010000                   jle        0x7f254be8064b
00d33 458bdd                         mov        r11d, r13d
00d36 442b9c2490000000               sub        r11d, dword ptr [rsp + 0x90]
00d3e 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00d46 438d1c2a                       lea        ebx, [r10 + r13]
00d4a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00d4f 458bc3                         mov        r8d, r11d
00d52 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
00d57 4b8d742a08                     lea        rsi, [r10 + r13 + 8]
00d5c 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00d64 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
00d69 0f8dcf000000                   jge        0x7f254be805be
00d6f 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00d74 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
00d7c 450f4fda                       cmovg      r11d, r10d
00d80 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00d88 4585c0                         test       r8d, r8d
00d8b 0f8c47130000                   jl         0x7f254be81858
00d91 4585ed                         test       r13d, r13d
00d94 0f8c3e130000                   jl         0x7f254be81858
00d9a 4503d8                         add        r11d, r8d
00d9d 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00da2 453bc3                         cmp        r8d, r11d
00da5 0f822d130000                   jb         0x7f254be81858
00dab 458bd5                         mov        r10d, r13d
00dae 4403942490000000               add        r10d, dword ptr [rsp + 0x90]
00db6 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00dbe 458bd8                         mov        r11d, r8d
00dc1 453bda                         cmp        r11d, r10d
00dc4 0f820e130000                   jb         0x7f254be81858
00dca 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00dd2 4585d2                         test       r10d, r10d
00dd5 0f8cfd120000                   jl         0x7f254be81858
00ddb 4585d2                         test       r10d, r10d
00dde 742c                           je         0x7f254be8058c
00de0 4963d2                         movsxd     rdx, r10d
00de3 4883fa20                       cmp        rdx, 0x20
00de7 773b                           ja         0x7f254be805a4
00de9 458bda                         mov        r11d, r10d
00dec 4d63d3                         movsxd     r10, r11d
00def 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00df6 c442a8f5db                     bzhi       r11, r11, r10
00dfb c4c1fb92fb                     kmovq      k7, r11
00e00 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e06 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e0c 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00e14 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00e19 0f8c04010000                   jl         0x7f254be806a3
00e1f e967f6ffff                     jmp        0x7f254be7fc0b
00e24 c5f877                         vzeroupper 
00e27 49ba203f8e4b257f0000           movabs     r10, 0x7f254b8e3f20
00e31 41ffd2                         call       r10
00e34 0f1f840000000000               nop        dword ptr [rax + rax]
00e3c ebce                           jmp        0x7f254be8058c
00e3e 4585db                         test       r11d, r11d
00e41 0f8c45130000                   jl         0x7f254be8190c
00e47 4585ed                         test       r13d, r13d
00e4a 0f8c3c130000                   jl         0x7f254be8190c
00e50 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00e55 4503d8                         add        r11d, r8d
00e58 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00e5d 453bc3                         cmp        r8d, r11d
00e60 0f8226130000                   jb         0x7f254be8190c
00e66 443bc3                         cmp        r8d, ebx
00e69 0f821d130000                   jb         0x7f254be8190c
00e6f 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00e74 4585db                         test       r11d, r11d
00e77 0f840ef6ffff                   je         0x7f254be7fc0b
00e7d 4963d3                         movsxd     rdx, r11d
00e80 4883fa20                       cmp        rdx, 0x20
00e84 7728                           ja         0x7f254be8062e
00e86 458bd3                         mov        r10d, r11d
00e89 4d63d2                         movsxd     r10, r10d
00e8c 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e93 c442a8f5db                     bzhi       r11, r11, r10
00e98 c4c1fb92fb                     kmovq      k7, r11
00e9d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ea3 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ea9 e9ddf5ffff                     jmp        0x7f254be7fc0b
00eae c5f877                         vzeroupper 
00eb1 49ba203f8e4b257f0000           movabs     r10, 0x7f254b8e3f20
00ebb 41ffd2                         call       r10
00ebe 0f1f840000000000               nop        dword ptr [rax + rax]
00ec6 e9c0f5ffff                     jmp        0x7f254be7fc0b
00ecb 418bdd                         mov        ebx, r13d
00ece e9b8f5ffff                     jmp        0x7f254be7fc0b
00ed3 448bd5                         mov        r10d, ebp
00ed6 4d63d2                         movsxd     r10, r10d
00ed9 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ee0 c442a8f5db                     bzhi       r11, r11, r10
00ee5 c4c1fb92fb                     kmovq      k7, r11
00eea 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ef0 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ef6 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00efe 4403dd                         add        r11d, ebp
00f01 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00f09 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00f0d 418502                         test       dword ptr [r10], eax
00f10 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00f15 0f8d70f5ffff                   jge        0x7f254be7fc0b
00f1b 4489b4249c000000               mov        dword ptr [rsp + 0x9c], r14d
00f23 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00f2b 442b942490000000               sub        r10d, dword ptr [rsp + 0x90]
00f33 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00f3b 8b6c2478                       mov        ebp, dword ptr [rsp + 0x78]
00f3f 2bac2490000000                 sub        ebp, dword ptr [rsp + 0x90]
00f46 3bac2490000000                 cmp        ebp, dword ptr [rsp + 0x90]
00f4d 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00f55 410f4feb                       cmovg      ebp, r11d
00f59 4585d2                         test       r10d, r10d
00f5c 0f8c82100000                   jl         0x7f254be81764
00f62 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00f6a 4585c0                         test       r8d, r8d
00f6d 0f8c71100000                   jl         0x7f254be81764
00f73 458d1c2a                       lea        r11d, [r10 + rbp]
00f77 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00f7c 453bc3                         cmp        r8d, r11d
00f7f 0f825f100000                   jb         0x7f254be81764
00f85 448bb4249c000000               mov        r14d, dword ptr [rsp + 0x9c]
00f8d 4403f5                         add        r14d, ebp
00f90 453bc6                         cmp        r8d, r14d
00f93 0f824b100000                   jb         0x7f254be81764
00f99 85ed                           test       ebp, ebp
00f9b 0f8c43100000                   jl         0x7f254be81764
00fa1 85ed                           test       ebp, ebp
00fa3 0f844dffffff                   je         0x7f254be80676
00fa9 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00fae 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00fb3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00fb8 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00fc0 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
00fc5 4863d5                         movsxd     rdx, ebp
00fc8 4883fa20                       cmp        rdx, 0x20
00fcc 0f8601ffffff                   jbe        0x7f254be80653
00fd2 c5f877                         vzeroupper 
00fd5 49ba203f8e4b257f0000           movabs     r10, 0x7f254b8e3f20
00fdf 41ffd2                         call       r10
00fe2 0f1f840000000000               nop        dword ptr [rax + rax]
00fea e907ffffff                     jmp        0x7f254be80676
00fef 448beb                         mov        r13d, ebx
00ff2 e92efdffff                     jmp        0x7f254be804a5
00ff7 bee4ffffff                     mov        esi, 0xffffffe4
00ffc 488b2c24                       mov        rbp, qword ptr [rsp]
01000 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01005 4c891424                       mov        qword ptr [rsp], r10
01009 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0100e 4489542408                     mov        dword ptr [rsp + 8], r10d
01013 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01018 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0101d 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01021 666690                         nop        
01024 c5f877                         vzeroupper 
01027 e8b436b4ff                     call       0x7f254b9c3e60
0102c 0f1f84002411000b               nop        dword ptr [rax + rax + 0xb001124]
01034 bee4ffffff                     mov        esi, 0xffffffe4
01039 488b2c24                       mov        rbp, qword ptr [rsp]
0103d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01042 4c891424                       mov        qword ptr [rsp], r10
01046 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0104b 44895c2408                     mov        dword ptr [rsp + 8], r11d
01050 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01055 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0105a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0105f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01064 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01069 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0106e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01073 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01078 4489442470                     mov        dword ptr [rsp + 0x70], r8d
0107d 666690                         nop        
01080 c5f877                         vzeroupper 
01083 e85836b4ff                     call       0x7f254b9c3e60
01088 0f1f84008011000c               nop        dword ptr [rax + rax + 0xc001180]
01090 bee4ffffff                     mov        esi, 0xffffffe4
01095 488b2c24                       mov        rbp, qword ptr [rsp]
01099 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0109e 4c891424                       mov        qword ptr [rsp], r10
010a2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
010a7 4489542408                     mov        dword ptr [rsp + 8], r10d
010ac 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
010b1 4c89542410                     mov        qword ptr [rsp + 0x10], r10
010b6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
010bb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
010c0 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
010c5 448954240c                     mov        dword ptr [rsp + 0xc], r10d
010ca 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
010cf 4c89542420                     mov        qword ptr [rsp + 0x20], r10
010d4 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
010dc 4489542474                     mov        dword ptr [rsp + 0x74], r10d
010e1 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
010ea 6690                           nop        
010ec c5f877                         vzeroupper 
010ef e8ec35b4ff                     call       0x7f254b9c3e60
010f4 0f1f8400ec11000d               nop        dword ptr [rax + rax + 0xd0011ec]
010fc bee4ffffff                     mov        esi, 0xffffffe4
01101 488b2c24                       mov        rbp, qword ptr [rsp]
01105 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0110a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0110f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01114 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01119 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
0111d 48894424f8                     mov        qword ptr [rsp - 8], rax
01122 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01126 89442470                       mov        dword ptr [rsp + 0x70], eax
0112a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0112f 90                             nop        
01130 c5f877                         vzeroupper 
01133 e8a835b4ff                     call       0x7f254b9c3e60
01138 0f1f84003012000e               nop        dword ptr [rax + rax + 0xe001230]
01140 bee4ffffff                     mov        esi, 0xffffffe4
01145 488b2c24                       mov        rbp, qword ptr [rsp]
01149 4c891c24                       mov        qword ptr [rsp], r11
0114d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01152 44895c2408                     mov        dword ptr [rsp + 8], r11d
01157 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0115c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01161 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01166 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0116b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01170 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01175 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0117a 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0117f 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01184 48894424f8                     mov        qword ptr [rsp - 8], rax
01189 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0118d 89442470                       mov        dword ptr [rsp + 0x70], eax
01191 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01196 895c2478                       mov        dword ptr [rsp + 0x78], ebx
0119a 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
011a2 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
011a7 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
011b0 c5f877                         vzeroupper 
011b3 e82835b4ff                     call       0x7f254b9c3e60
011b8 0f1f8400b012000f               nop        dword ptr [rax + rax + 0xf0012b0]
011c0 be45ffffff                     mov        esi, 0xffffff45
011c5 488b2c24                       mov        rbp, qword ptr [rsp]
011c9 4c895c2408                     mov        qword ptr [rsp + 8], r11
011ce 6690                           nop        
011d0 c5f877                         vzeroupper 
011d3 e80835b4ff                     call       0x7f254b9c3e60
011d8 0f1f8400d0120010               nop        dword ptr [rax + rax + 0x100012d0]
011e0 be45ffffff                     mov        esi, 0xffffff45
011e5 488b2c24                       mov        rbp, qword ptr [rsp]
011e9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
011ee 4c891424                       mov        qword ptr [rsp], r10
011f2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
011f7 4489542408                     mov        dword ptr [rsp + 8], r10d
011fc 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01201 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01206 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0120b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01210 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01215 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0121a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0121f 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01224 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01228 48894424f8                     mov        qword ptr [rsp - 8], rax
0122d 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01231 89442434                       mov        dword ptr [rsp + 0x34], eax
01235 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0123a 48894424f8                     mov        qword ptr [rsp - 8], rax
0123f 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01243 89442438                       mov        dword ptr [rsp + 0x38], eax
01247 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0124c 48894424f8                     mov        qword ptr [rsp - 8], rax
01251 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01255 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01259 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0125e 48ff742450                     push       qword ptr [rsp + 0x50]
01263 488f442448                     pop        qword ptr [rsp + 0x48]
01268 48ff742458                     push       qword ptr [rsp + 0x58]
0126d 488f442450                     pop        qword ptr [rsp + 0x50]
01272 48894424f8                     mov        qword ptr [rsp - 8], rax
01277 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0127b 89442458                       mov        dword ptr [rsp + 0x58], eax
0127f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01284 48894424f8                     mov        qword ptr [rsp - 8], rax
01289 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0128d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01291 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01296 48894424f8                     mov        qword ptr [rsp - 8], rax
0129b 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0129f 89442460                       mov        dword ptr [rsp + 0x60], eax
012a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012a8 48894424f8                     mov        qword ptr [rsp - 8], rax
012ad 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
012b1 89442464                       mov        dword ptr [rsp + 0x64], eax
012b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012ba 8944246c                       mov        dword ptr [rsp + 0x6c], eax
012be 6690                           nop        
012c0 c5f877                         vzeroupper 
012c3 e81834b4ff                     call       0x7f254b9c3e60
012c8 0f1f8400c0130011               nop        dword ptr [rax + rax + 0x110013c0]
012d0 4d3bd3                         cmp        r10, r11
012d3 bdffffffff                     mov        ebp, 0xffffffff
012d8 7c08                           jl         0x7f254be80a62
012da 400f95c5                       setne      bpl
012de 400fb6ed                       movzx      ebp, bpl
012e2 be45ffffff                     mov        esi, 0xffffff45
012e7 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
012ec 4489442414                     mov        dword ptr [rsp + 0x14], r8d
012f1 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
012f6 4c89542428                     mov        qword ptr [rsp + 0x28], r10
012fb 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
012ff 48894424f8                     mov        qword ptr [rsp - 8], rax
01304 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01308 89442470                       mov        dword ptr [rsp + 0x70], eax
0130c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01311 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
01316 6690                           nop        
01318 c5f877                         vzeroupper 
0131b e8c033b4ff                     call       0x7f254b9c3e60
01320 0f1f840018140012               nop        dword ptr [rax + rax + 0x12001418]
01328 be45ffffff                     mov        esi, 0xffffff45
0132d 488b2c24                       mov        rbp, qword ptr [rsp]
01331 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01336 4c891424                       mov        qword ptr [rsp], r10
0133a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0133f 4489542408                     mov        dword ptr [rsp + 8], r10d
01344 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01349 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0134e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01353 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01358 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0135d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01362 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01367 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0136c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01371 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01376 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0137a 48894424f8                     mov        qword ptr [rsp - 8], rax
0137f 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01383 89442434                       mov        dword ptr [rsp + 0x34], eax
01387 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0138c 48894424f8                     mov        qword ptr [rsp - 8], rax
01391 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01395 89442438                       mov        dword ptr [rsp + 0x38], eax
01399 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0139e 48894424f8                     mov        qword ptr [rsp - 8], rax
013a3 8b442448                       mov        eax, dword ptr [rsp + 0x48]
013a7 8944243c                       mov        dword ptr [rsp + 0x3c], eax
013ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013b0 48ff742450                     push       qword ptr [rsp + 0x50]
013b5 488f442448                     pop        qword ptr [rsp + 0x48]
013ba 48ff742458                     push       qword ptr [rsp + 0x58]
013bf 488f442450                     pop        qword ptr [rsp + 0x50]
013c4 48894424f8                     mov        qword ptr [rsp - 8], rax
013c9 8b442460                       mov        eax, dword ptr [rsp + 0x60]
013cd 89442458                       mov        dword ptr [rsp + 0x58], eax
013d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013d6 48894424f8                     mov        qword ptr [rsp - 8], rax
013db 8b442468                       mov        eax, dword ptr [rsp + 0x68]
013df 89442460                       mov        dword ptr [rsp + 0x60], eax
013e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013e8 48894424f8                     mov        qword ptr [rsp - 8], rax
013ed 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
013f1 89442468                       mov        dword ptr [rsp + 0x68], eax
013f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013fa 6690                           nop        
013fc c5f877                         vzeroupper 
013ff e8dc32b4ff                     call       0x7f254b9c3e60
01404 0f1f8400fc140013               nop        dword ptr [rax + rax + 0x130014fc]
0140c be45ffffff                     mov        esi, 0xffffff45
01411 488b2c24                       mov        rbp, qword ptr [rsp]
01415 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0141a 4c891424                       mov        qword ptr [rsp], r10
0141e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01423 44895c2408                     mov        dword ptr [rsp + 8], r11d
01428 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0142d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01432 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01437 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0143c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01441 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01446 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0144b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01450 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01455 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0145a 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0145f 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01464 48894424f8                     mov        qword ptr [rsp - 8], rax
01469 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0146d 89442438                       mov        dword ptr [rsp + 0x38], eax
01471 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01476 48894424f8                     mov        qword ptr [rsp - 8], rax
0147b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0147f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01483 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01488 48ff742450                     push       qword ptr [rsp + 0x50]
0148d 488f442448                     pop        qword ptr [rsp + 0x48]
01492 48ff742458                     push       qword ptr [rsp + 0x58]
01497 488f442450                     pop        qword ptr [rsp + 0x50]
0149c 48894424f8                     mov        qword ptr [rsp - 8], rax
014a1 8b442460                       mov        eax, dword ptr [rsp + 0x60]
014a5 89442458                       mov        dword ptr [rsp + 0x58], eax
014a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014ae 48894424f8                     mov        qword ptr [rsp - 8], rax
014b3 8b442464                       mov        eax, dword ptr [rsp + 0x64]
014b7 8944245c                       mov        dword ptr [rsp + 0x5c], eax
014bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014c0 48894424f8                     mov        qword ptr [rsp - 8], rax
014c5 8b442468                       mov        eax, dword ptr [rsp + 0x68]
014c9 89442460                       mov        dword ptr [rsp + 0x60], eax
014cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014d2 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
014d7 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
014dc 4489542470                     mov        dword ptr [rsp + 0x70], r10d
014e1 666690                         nop        
014e4 c5f877                         vzeroupper 
014e7 e8f431b4ff                     call       0x7f254b9c3e60
014ec 0f1f8400e4150014               nop        dword ptr [rax + rax + 0x140015e4]
014f4 4533d2                         xor        r10d, r10d
014f7 4c891424                       mov        qword ptr [rsp], r10
014fb e947ecffff                     jmp        0x7f254be7f8c7
01500 4533d2                         xor        r10d, r10d
01503 4c89542408                     mov        qword ptr [rsp + 8], r10
01508 e968ecffff                     jmp        0x7f254be7f8f5
0150d 4533d2                         xor        r10d, r10d
01510 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01515 e989ecffff                     jmp        0x7f254be7f923
0151a 4533d2                         xor        r10d, r10d
0151d 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01522 e9aaecffff                     jmp        0x7f254be7f951
01527 4533d2                         xor        r10d, r10d
0152a 4c89542470                     mov        qword ptr [rsp + 0x70], r10
0152f e9cbecffff                     jmp        0x7f254be7f97f
01534 4533d2                         xor        r10d, r10d
01537 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0153c e9e9ecffff                     jmp        0x7f254be7f9aa
01541 bee4ffffff                     mov        esi, 0xffffffe4
01546 488b2c24                       mov        rbp, qword ptr [rsp]
0154a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0154f 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01554 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01559 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0155e 48894424f8                     mov        qword ptr [rsp - 8], rax
01563 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01567 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0156b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01570 48894424f8                     mov        qword ptr [rsp - 8], rax
01575 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01579 89442460                       mov        dword ptr [rsp + 0x60], eax
0157d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01582 48894424f8                     mov        qword ptr [rsp - 8], rax
01587 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0158b 89442464                       mov        dword ptr [rsp + 0x64], eax
0158f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01594 48894424f8                     mov        qword ptr [rsp - 8], rax
01599 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0159d 89442468                       mov        dword ptr [rsp + 0x68], eax
015a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015a6 48894424f8                     mov        qword ptr [rsp - 8], rax
015ab 8b442478                       mov        eax, dword ptr [rsp + 0x78]
015af 8944246c                       mov        dword ptr [rsp + 0x6c], eax
015b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015b8 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
015bd 895c2478                       mov        dword ptr [rsp + 0x78], ebx
015c1 666690                         nop        
015c4 c5f877                         vzeroupper 
015c7 e81431b4ff                     call       0x7f254b9c3e60
015cc 0f1f8400c4160015               nop        dword ptr [rax + rax + 0x150016c4]
015d4 c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
015dd bee4ffffff                     mov        esi, 0xffffffe4
015e2 488b2c24                       mov        rbp, qword ptr [rsp]
015e6 4c891424                       mov        qword ptr [rsp], r10
015ea 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
015ef 44895c2408                     mov        dword ptr [rsp + 8], r11d
015f4 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
015f9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
015fe 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01603 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01608 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0160d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01612 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01617 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0161c 48894424f8                     mov        qword ptr [rsp - 8], rax
01621 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01625 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01629 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0162e 48894424f8                     mov        qword ptr [rsp - 8], rax
01633 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01637 89442460                       mov        dword ptr [rsp + 0x60], eax
0163b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01640 48894424f8                     mov        qword ptr [rsp - 8], rax
01645 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01649 89442464                       mov        dword ptr [rsp + 0x64], eax
0164d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01652 48894424f8                     mov        qword ptr [rsp - 8], rax
01657 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0165b 89442468                       mov        dword ptr [rsp + 0x68], eax
0165f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01664 48894424f8                     mov        qword ptr [rsp - 8], rax
01669 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0166d 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01671 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01676 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
0167b 8954247c                       mov        dword ptr [rsp + 0x7c], edx
0167f 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
01686 6690                           nop        
01688 c5f877                         vzeroupper 
0168b e85030b4ff                     call       0x7f254b9c3e60
01690 0f1f840088170016               nop        dword ptr [rax + rax + 0x16001788]
01698 bebeffffff                     mov        esi, 0xffffffbe
0169d 488b2c24                       mov        rbp, qword ptr [rsp]
016a1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
016a6 4c891424                       mov        qword ptr [rsp], r10
016aa 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
016af 44895c2408                     mov        dword ptr [rsp + 8], r11d
016b4 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
016b9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
016be 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016c3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016c8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
016cd 448954240c                     mov        dword ptr [rsp + 0xc], r10d
016d2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
016d7 4c89542428                     mov        qword ptr [rsp + 0x28], r10
016dc 895c2430                       mov        dword ptr [rsp + 0x30], ebx
016e0 48894424f8                     mov        qword ptr [rsp - 8], rax
016e5 8b442438                       mov        eax, dword ptr [rsp + 0x38]
016e9 89442434                       mov        dword ptr [rsp + 0x34], eax
016ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016f2 48894424f8                     mov        qword ptr [rsp - 8], rax
016f7 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
016fb 89442438                       mov        dword ptr [rsp + 0x38], eax
016ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01704 48894424f8                     mov        qword ptr [rsp - 8], rax
01709 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0170d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01711 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01716 48ff742450                     push       qword ptr [rsp + 0x50]
0171b 488f442448                     pop        qword ptr [rsp + 0x48]
01720 48ff742458                     push       qword ptr [rsp + 0x58]
01725 488f442450                     pop        qword ptr [rsp + 0x50]
0172a 48894424f8                     mov        qword ptr [rsp - 8], rax
0172f 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01733 89442458                       mov        dword ptr [rsp + 0x58], eax
01737 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0173c c5f877                         vzeroupper 
0173f e89c2fb4ff                     call       0x7f254b9c3e60
01744 0f1f84003c180017               nop        dword ptr [rax + rax + 0x1700183c]
0174c be85ffffff                     mov        esi, 0xffffff85
01751 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
01755 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0175a 44891424                       mov        dword ptr [rsp], r10d
0175e 895c2404                       mov        dword ptr [rsp + 4], ebx
01762 6690                           nop        
01764 c5f877                         vzeroupper 
01767 e8742fb4ff                     call       0x7f254b9c3e60
0176c 0f1f840064180018               nop        dword ptr [rax + rax + 0x18001864]
01774 8bea                           mov        ebp, edx
01776 83c510                         add        ebp, 0x10
01779 be6effffff                     mov        esi, 0xffffff6e
0177e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01783 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01788 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0178d 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01792 89542438                       mov        dword ptr [rsp + 0x38], edx
01796 48894424f8                     mov        qword ptr [rsp - 8], rax
0179b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0179f 8944244c                       mov        dword ptr [rsp + 0x4c], eax
017a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a8 48894424f8                     mov        qword ptr [rsp - 8], rax
017ad 8b442464                       mov        eax, dword ptr [rsp + 0x64]
017b1 89442460                       mov        dword ptr [rsp + 0x60], eax
017b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ba 48894424f8                     mov        qword ptr [rsp - 8], rax
017bf 8b442468                       mov        eax, dword ptr [rsp + 0x68]
017c3 89442464                       mov        dword ptr [rsp + 0x64], eax
017c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017cc 48894424f8                     mov        qword ptr [rsp - 8], rax
017d1 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
017d5 89442468                       mov        dword ptr [rsp + 0x68], eax
017d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017de 48894424f8                     mov        qword ptr [rsp - 8], rax
017e3 8b442478                       mov        eax, dword ptr [rsp + 0x78]
017e7 8944246c                       mov        dword ptr [rsp + 0x6c], eax
017eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017f0 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
017f5 666690                         nop        
017f8 c5f877                         vzeroupper 
017fb e8e02eb4ff                     call       0x7f254b9c3e60
01800 0f1f8400f8180019               nop        dword ptr [rax + rax + 0x190018f8]
01808 8bea                           mov        ebp, edx
0180a 83c510                         add        ebp, 0x10
0180d be66ffffff                     mov        esi, 0xffffff66
01812 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01817 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0181c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01821 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01826 89542438                       mov        dword ptr [rsp + 0x38], edx
0182a 48894424f8                     mov        qword ptr [rsp - 8], rax
0182f 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01833 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01837 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0183c 48894424f8                     mov        qword ptr [rsp - 8], rax
01841 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01845 89442460                       mov        dword ptr [rsp + 0x60], eax
01849 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0184e 48894424f8                     mov        qword ptr [rsp - 8], rax
01853 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01857 89442464                       mov        dword ptr [rsp + 0x64], eax
0185b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01860 48894424f8                     mov        qword ptr [rsp - 8], rax
01865 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01869 89442468                       mov        dword ptr [rsp + 0x68], eax
0186d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01872 48894424f8                     mov        qword ptr [rsp - 8], rax
01877 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0187b 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0187f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01884 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01889 666690                         nop        
0188c c5f877                         vzeroupper 
0188f e84c2eb4ff                     call       0x7f254b9c3e60
01894 0f1f84008c19001a               nop        dword ptr [rax + rax + 0x1a00198c]
0189c bee4ffffff                     mov        esi, 0xffffffe4
018a1 488b2c24                       mov        rbp, qword ptr [rsp]
018a5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
018aa 4c891424                       mov        qword ptr [rsp], r10
018ae 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
018b3 44895c2408                     mov        dword ptr [rsp + 8], r11d
018b8 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
018bd 4c89542410                     mov        qword ptr [rsp + 0x10], r10
018c2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018c7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018cc 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
018d1 448954240c                     mov        dword ptr [rsp + 0xc], r10d
018d6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018db 4c89542428                     mov        qword ptr [rsp + 0x28], r10
018e0 895c2430                       mov        dword ptr [rsp + 0x30], ebx
018e4 48894424f8                     mov        qword ptr [rsp - 8], rax
018e9 8b442438                       mov        eax, dword ptr [rsp + 0x38]
018ed 89442434                       mov        dword ptr [rsp + 0x34], eax
018f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018f6 48894424f8                     mov        qword ptr [rsp - 8], rax
018fb 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
018ff 89442438                       mov        dword ptr [rsp + 0x38], eax
01903 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01908 48894424f8                     mov        qword ptr [rsp - 8], rax
0190d 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01911 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01915 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0191a 48ff742450                     push       qword ptr [rsp + 0x50]
0191f 488f442448                     pop        qword ptr [rsp + 0x48]
01924 48ff742458                     push       qword ptr [rsp + 0x58]
01929 488f442450                     pop        qword ptr [rsp + 0x50]
0192e 48894424f8                     mov        qword ptr [rsp - 8], rax
01933 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01937 89442458                       mov        dword ptr [rsp + 0x58], eax
0193b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01940 48894424f8                     mov        qword ptr [rsp - 8], rax
01945 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01949 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0194d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01952 48894424f8                     mov        qword ptr [rsp - 8], rax
01957 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0195b 89442460                       mov        dword ptr [rsp + 0x60], eax
0195f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01964 48894424f8                     mov        qword ptr [rsp - 8], rax
01969 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0196d 89442464                       mov        dword ptr [rsp + 0x64], eax
01971 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01976 48894424f8                     mov        qword ptr [rsp - 8], rax
0197b 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0197f 89442468                       mov        dword ptr [rsp + 0x68], eax
01983 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01988 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0198f 90                             nop        
01990 c5f877                         vzeroupper 
01993 e8482db4ff                     call       0x7f254b9c3e60
01998 0f1f8400901a001b               nop        dword ptr [rax + rax + 0x1b001a90]
019a0 bef6ffffff                     mov        esi, 0xfffffff6
019a5 666690                         nop        
019a8 c5f877                         vzeroupper 
019ab e8302db4ff                     call       0x7f254b9c3e60
019b0 0f1f8400a81a001c               nop        dword ptr [rax + rax + 0x1c001aa8]
019b8 bee4ffffff                     mov        esi, 0xffffffe4
019bd 488b2c24                       mov        rbp, qword ptr [rsp]
019c1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
019c6 4c891424                       mov        qword ptr [rsp], r10
019ca 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
019cf 4489542408                     mov        dword ptr [rsp + 8], r10d
019d4 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
019d9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
019de 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019e3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
019e8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
019ed 448954240c                     mov        dword ptr [rsp + 0xc], r10d
019f2 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
019f7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
019fc 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01a01 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
01a09 666690                         nop        
01a0c c5f877                         vzeroupper 
01a0f e8cc2cb4ff                     call       0x7f254b9c3e60
01a14 0f1f84000c1b001d               nop        dword ptr [rax + rax + 0x1d001b0c]
01a1c bee4ffffff                     mov        esi, 0xffffffe4
01a21 488b2c24                       mov        rbp, qword ptr [rsp]
01a25 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01a2a 4c891424                       mov        qword ptr [rsp], r10
01a2e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01a33 44895c2408                     mov        dword ptr [rsp + 8], r11d
01a38 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01a3d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01a42 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a47 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a4c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a51 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01a56 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01a5b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01a60 48894424f8                     mov        qword ptr [rsp - 8], rax
01a65 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01a69 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01a6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a72 6690                           nop        
01a74 c5f877                         vzeroupper 
01a77 e8642cb4ff                     call       0x7f254b9c3e60
01a7c 0f1f8400741b001e               nop        dword ptr [rax + rax + 0x1e001b74]
01a84 be6effffff                     mov        esi, 0xffffff6e
01a89 488b2c24                       mov        rbp, qword ptr [rsp]
01a8d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01a92 4c891424                       mov        qword ptr [rsp], r10
01a96 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01a9b 44895c2408                     mov        dword ptr [rsp + 8], r11d
01aa0 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01aa5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01aaa 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01aaf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ab4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ab9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01abe 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ac3 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01ac8 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01acc 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad1 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01ad5 89442434                       mov        dword ptr [rsp + 0x34], eax
01ad9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ade 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae3 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01ae7 89442438                       mov        dword ptr [rsp + 0x38], eax
01aeb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af0 48894424f8                     mov        qword ptr [rsp - 8], rax
01af5 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01af9 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01afd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b02 48ff742450                     push       qword ptr [rsp + 0x50]
01b07 488f442448                     pop        qword ptr [rsp + 0x48]
01b0c 48ff742458                     push       qword ptr [rsp + 0x58]
01b11 488f442450                     pop        qword ptr [rsp + 0x50]
01b16 48894424f8                     mov        qword ptr [rsp - 8], rax
01b1b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01b1f 89442458                       mov        dword ptr [rsp + 0x58], eax
01b23 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b28 48894424f8                     mov        qword ptr [rsp - 8], rax
01b2d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01b31 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01b35 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b3a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b3f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01b43 89442460                       mov        dword ptr [rsp + 0x60], eax
01b47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b4c 48894424f8                     mov        qword ptr [rsp - 8], rax
01b51 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01b55 89442464                       mov        dword ptr [rsp + 0x64], eax
01b59 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b5e 48894424f8                     mov        qword ptr [rsp - 8], rax
01b63 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01b67 89442468                       mov        dword ptr [rsp + 0x68], eax
01b6b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b70 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
01b75 8944247c                       mov        dword ptr [rsp + 0x7c], eax
01b79 666690                         nop        
01b7c c5f877                         vzeroupper 
01b7f e85c2bb4ff                     call       0x7f254b9c3e60
01b84 0f1f84007c1c001f               nop        dword ptr [rax + rax + 0x1f001c7c]
01b8c 458bd3                         mov        r10d, r11d
01b8f e939efffff                     jmp        0x7f254be8024d
01b94 bee4ffffff                     mov        esi, 0xffffffe4
01b99 488b2c24                       mov        rbp, qword ptr [rsp]
01b9d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01ba2 4c891424                       mov        qword ptr [rsp], r10
01ba6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01bab 44895c2408                     mov        dword ptr [rsp + 8], r11d
01bb0 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01bb5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01bba 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01bbf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01bc4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01bc9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01bce 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01bd3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01bd8 48894424f8                     mov        qword ptr [rsp - 8], rax
01bdd 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01be1 89442474                       mov        dword ptr [rsp + 0x74], eax
01be5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bea 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
01bf2 6690                           nop        
01bf4 c5f877                         vzeroupper 
01bf7 e8e42ab4ff                     call       0x7f254b9c3e60
01bfc 0f1f8400f41c0020               nop        dword ptr [rax + rax + 0x20001cf4]
01c04 bee4ffffff                     mov        esi, 0xffffffe4
01c09 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c0e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01c13 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01c18 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01c1d 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01c22 6690                           nop        
01c24 c5f877                         vzeroupper 
01c27 e8b42ab4ff                     call       0x7f254b9c3e60
01c2c 0f1f8400241d0021               nop        dword ptr [rax + rax + 0x21001d24]
01c34 418d6801                       lea        ebp, [r8 + 1]
01c38 bee4ffffff                     mov        esi, 0xffffffe4
01c3d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01c42 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01c47 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01c4c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01c51 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01c56 6690                           nop        
01c58 c5f877                         vzeroupper 
01c5b e8802ab4ff                     call       0x7f254b9c3e60
01c60 0f1f8400581d0022               nop        dword ptr [rax + rax + 0x22001d58]
01c68 bee4ffffff                     mov        esi, 0xffffffe4
01c6d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c72 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01c77 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01c7c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01c81 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01c86 6690                           nop        
01c88 c5f877                         vzeroupper 
01c8b e8502ab4ff                     call       0x7f254b9c3e60
01c90 0f1f8400881d0023               nop        dword ptr [rax + rax + 0x23001d88]
01c98 bee4ffffff                     mov        esi, 0xffffffe4
01c9d 488b2c24                       mov        rbp, qword ptr [rsp]
01ca1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01ca6 4c891424                       mov        qword ptr [rsp], r10
01caa 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01caf 4489542408                     mov        dword ptr [rsp + 8], r10d
01cb4 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01cb9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01cbe 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01cc3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01cc8 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ccd 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01cd2 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01cd7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01cdc 48894424f8                     mov        qword ptr [rsp - 8], rax
01ce1 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01ce5 89442470                       mov        dword ptr [rsp + 0x70], eax
01ce9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cee 4489442474                     mov        dword ptr [rsp + 0x74], r8d
01cf3 90                             nop        
01cf4 c5f877                         vzeroupper 
01cf7 e8e429b4ff                     call       0x7f254b9c3e60
01cfc 0f1f8400f41d0024               nop        dword ptr [rax + rax + 0x24001df4]
01d04 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
01d0c 4183c308                       add        r11d, 8
01d10 458bc3                         mov        r8d, r11d
01d13 be45ffffff                     mov        esi, 0xffffff45
01d18 488b2c24                       mov        rbp, qword ptr [rsp]
01d1c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01d21 4c891424                       mov        qword ptr [rsp], r10
01d25 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01d2a 4489542408                     mov        dword ptr [rsp + 8], r10d
01d2f 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01d34 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01d39 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d3e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d43 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01d48 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01d4d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01d52 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01d57 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01d5c 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01d61 48ff742440                     push       qword ptr [rsp + 0x40]
01d66 488f442438                     pop        qword ptr [rsp + 0x38]
01d6b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01d70 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01d75 48ff742450                     push       qword ptr [rsp + 0x50]
01d7a 488f442448                     pop        qword ptr [rsp + 0x48]
01d7f 48ff742458                     push       qword ptr [rsp + 0x58]
01d84 488f442450                     pop        qword ptr [rsp + 0x50]
01d89 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01d8e 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01d93 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01d98 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01d9d 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01da2 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01da7 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
01daf 4489442468                     mov        dword ptr [rsp + 0x68], r8d
01db4 458bda                         mov        r11d, r10d
01db7 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01dbc c5f877                         vzeroupper 
01dbf e81c29b4ff                     call       0x7f254b9c3e60
01dc4 0f1f8400bc1e0025               nop        dword ptr [rax + rax + 0x25001ebc]
01dcc be45ffffff                     mov        esi, 0xffffff45
01dd1 488b2c24                       mov        rbp, qword ptr [rsp]
01dd5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01dda 4c891424                       mov        qword ptr [rsp], r10
01dde 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01de3 44895c2408                     mov        dword ptr [rsp + 8], r11d
01de8 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01ded 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01df2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01df7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01dfc 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01e01 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01e06 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01e0b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01e10 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01e15 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01e1a 48894424f8                     mov        qword ptr [rsp - 8], rax
01e1f 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01e23 89442438                       mov        dword ptr [rsp + 0x38], eax
01e27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e2c 48894424f8                     mov        qword ptr [rsp - 8], rax
01e31 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01e35 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e3e 48ff742450                     push       qword ptr [rsp + 0x50]
01e43 488f442448                     pop        qword ptr [rsp + 0x48]
01e48 48ff742458                     push       qword ptr [rsp + 0x58]
01e4d 488f442450                     pop        qword ptr [rsp + 0x50]
01e52 48894424f8                     mov        qword ptr [rsp - 8], rax
01e57 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01e5b 89442458                       mov        dword ptr [rsp + 0x58], eax
01e5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e64 48894424f8                     mov        qword ptr [rsp - 8], rax
01e69 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01e6d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01e71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e76 48894424f8                     mov        qword ptr [rsp - 8], rax
01e7b 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01e7f 89442460                       mov        dword ptr [rsp + 0x60], eax
01e83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e88 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01e8d 4489442468                     mov        dword ptr [rsp + 0x68], r8d
01e92 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01e97 90                             nop        
01e98 c5f877                         vzeroupper 
01e9b e84028b4ff                     call       0x7f254b9c3e60
01ea0 0f1f8400981f0026               nop        dword ptr [rax + rax + 0x26001f98]
01ea8 beccffffff                     mov        esi, 0xffffffcc
01ead 488b2c24                       mov        rbp, qword ptr [rsp]
01eb1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01eb6 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01ebb 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01ec0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01ec5 48894424f8                     mov        qword ptr [rsp - 8], rax
01eca 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01ece 89442470                       mov        dword ptr [rsp + 0x70], eax
01ed2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ed7 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
01edb 90                             nop        
01edc c5f877                         vzeroupper 
01edf e8fc27b4ff                     call       0x7f254b9c3e60
01ee4 0f1f8400dc1f0027               nop        dword ptr [rax + rax + 0x27001fdc]
01eec be45ffffff                     mov        esi, 0xffffff45
01ef1 488b2c24                       mov        rbp, qword ptr [rsp]
01ef5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01efa 4c891424                       mov        qword ptr [rsp], r10
01efe 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01f03 44895c2408                     mov        dword ptr [rsp + 8], r11d
01f08 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01f0d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01f12 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f17 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f1c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f21 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f26 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01f2b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01f30 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01f35 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01f3a 48894424f8                     mov        qword ptr [rsp - 8], rax
01f3f 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01f43 89442438                       mov        dword ptr [rsp + 0x38], eax
01f47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f4c 48894424f8                     mov        qword ptr [rsp - 8], rax
01f51 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01f55 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01f59 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f5e 48ff742450                     push       qword ptr [rsp + 0x50]
01f63 488f442448                     pop        qword ptr [rsp + 0x48]
01f68 48ff742458                     push       qword ptr [rsp + 0x58]
01f6d 488f442450                     pop        qword ptr [rsp + 0x50]
01f72 48894424f8                     mov        qword ptr [rsp - 8], rax
01f77 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01f7b 89442458                       mov        dword ptr [rsp + 0x58], eax
01f7f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f84 48894424f8                     mov        qword ptr [rsp - 8], rax
01f89 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01f8d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01f91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f96 48894424f8                     mov        qword ptr [rsp - 8], rax
01f9b 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01f9f 89442460                       mov        dword ptr [rsp + 0x60], eax
01fa3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fa8 4489442468                     mov        dword ptr [rsp + 0x68], r8d
01fad 666690                         nop        
01fb0 c5f877                         vzeroupper 
01fb3 e82827b4ff                     call       0x7f254b9c3e60
01fb8 0f1f8400b0200028               nop        dword ptr [rax + rax + 0x280020b0]
01fc0 beccffffff                     mov        esi, 0xffffffcc
01fc5 488b2c24                       mov        rbp, qword ptr [rsp]
01fc9 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01fcd 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01fd2 6690                           nop        
01fd4 c5f877                         vzeroupper 
01fd7 e80427b4ff                     call       0x7f254b9c3e60
01fdc 0f1f8400d4200029               nop        dword ptr [rax + rax + 0x290020d4]
01fe4 beccffffff                     mov        esi, 0xffffffcc
01fe9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01fee 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01ff3 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01ff8 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01ffd 48894424f8                     mov        qword ptr [rsp - 8], rax
02002 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02006 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0200a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0200f 48894424f8                     mov        qword ptr [rsp - 8], rax
02014 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02018 89442460                       mov        dword ptr [rsp + 0x60], eax
0201c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02021 48894424f8                     mov        qword ptr [rsp - 8], rax
02026 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0202a 89442464                       mov        dword ptr [rsp + 0x64], eax
0202e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02033 48894424f8                     mov        qword ptr [rsp - 8], rax
02038 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0203c 89442468                       mov        dword ptr [rsp + 0x68], eax
02040 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02045 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
0204a 6690                           nop        
0204c c5f877                         vzeroupper 
0204f e88c26b4ff                     call       0x7f254b9c3e60
02054 0f1f84004c21002a               nop        dword ptr [rax + rax + 0x2a00214c]
0205c beccffffff                     mov        esi, 0xffffffcc
02061 488b2c24                       mov        rbp, qword ptr [rsp]
02065 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0206a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0206f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02074 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02079 48894424f8                     mov        qword ptr [rsp - 8], rax
0207e 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02082 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02086 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0208b 48894424f8                     mov        qword ptr [rsp - 8], rax
02090 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02094 89442460                       mov        dword ptr [rsp + 0x60], eax
02098 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0209d 48894424f8                     mov        qword ptr [rsp - 8], rax
020a2 8b442468                       mov        eax, dword ptr [rsp + 0x68]
020a6 89442464                       mov        dword ptr [rsp + 0x64], eax
020aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020af 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
020b7 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
020bf 899c248c000000                 mov        dword ptr [rsp + 0x8c], ebx
020c6 6690                           nop        
020c8 c5f877                         vzeroupper 
020cb e81026b4ff                     call       0x7f254b9c3e60
020d0 0f1f8400c821002b               nop        dword ptr [rax + rax + 0x2b0021c8]
020d8 beccffffff                     mov        esi, 0xffffffcc
020dd 488b2c24                       mov        rbp, qword ptr [rsp]
020e1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
020e6 4c891424                       mov        qword ptr [rsp], r10
020ea 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
020ef 4489542408                     mov        dword ptr [rsp + 8], r10d
020f4 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
020f9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
020fe 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02103 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02108 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0210d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02112 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02117 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0211c 48894424f8                     mov        qword ptr [rsp - 8], rax
02121 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02125 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02129 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0212e 48894424f8                     mov        qword ptr [rsp - 8], rax
02133 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02137 89442460                       mov        dword ptr [rsp + 0x60], eax
0213b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02140 48894424f8                     mov        qword ptr [rsp - 8], rax
02145 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02149 89442464                       mov        dword ptr [rsp + 0x64], eax
0214d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02152 48894424f8                     mov        qword ptr [rsp - 8], rax
02157 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0215b 89442468                       mov        dword ptr [rsp + 0x68], eax
0215f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02164 48894424f8                     mov        qword ptr [rsp - 8], rax
02169 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0216d 89442470                       mov        dword ptr [rsp + 0x70], eax
02171 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02176 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
0217b 90                             nop        
0217c c5f877                         vzeroupper 
0217f e85c25b4ff                     call       0x7f254b9c3e60
02184 0f1f84007c22002c               nop        dword ptr [rax + rax + 0x2c00227c]
0218c beccffffff                     mov        esi, 0xffffffcc
02191 488b2c24                       mov        rbp, qword ptr [rsp]
02195 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0219a 4c891424                       mov        qword ptr [rsp], r10
0219e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
021a3 4489542408                     mov        dword ptr [rsp + 8], r10d
021a8 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
021ad 4c89542410                     mov        qword ptr [rsp + 0x10], r10
021b2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
021b7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
021bc 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
021c1 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
021c6 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
021cb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
021d0 48894424f8                     mov        qword ptr [rsp - 8], rax
021d5 8b442460                       mov        eax, dword ptr [rsp + 0x60]
021d9 8944244c                       mov        dword ptr [rsp + 0x4c], eax
021dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021e2 48894424f8                     mov        qword ptr [rsp - 8], rax
021e7 8b442464                       mov        eax, dword ptr [rsp + 0x64]
021eb 89442460                       mov        dword ptr [rsp + 0x60], eax
021ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021f4 48894424f8                     mov        qword ptr [rsp - 8], rax
021f9 8b442468                       mov        eax, dword ptr [rsp + 0x68]
021fd 89442464                       mov        dword ptr [rsp + 0x64], eax
02201 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02206 48894424f8                     mov        qword ptr [rsp - 8], rax
0220b 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0220f 89442468                       mov        dword ptr [rsp + 0x68], eax
02213 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02218 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
0221d 666690                         nop        
02220 c5f877                         vzeroupper 
02223 e8b824b4ff                     call       0x7f254b9c3e60
02228 0f1f84002023002d               nop        dword ptr [rax + rax + 0x2d002320]
02230 eb0a                           jmp        0x7f254be819bc
02232 eb08                           jmp        0x7f254be819bc
02234 eb06                           jmp        0x7f254be819bc
02236 eb04                           jmp        0x7f254be819bc
02238 eb02                           jmp        0x7f254be819bc
0223a eb00                           jmp        0x7f254be819bc
0223c 488bf0                         mov        rsi, rax
0223f e940e5ffff                     jmp        0x7f254be7ff04
02244 bef6ffffff                     mov        esi, 0xfffffff6
02249 666690                         nop        
0224c c5f877                         vzeroupper 
0224f e88c24b4ff                     call       0x7f254b9c3e60
02254 0f1f84004c23002e               nop        dword ptr [rax + rax + 0x2e00234c]
0225c 49ba0604e84b257f0000           movabs     r10, 0x7f254be80406
02266 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0226d e9eeb4a7ff                     jmp        0x7f254b8fcee0
02272 e8a980a6ff                     call       0x7f254b8e9aa0
02277 e9b2ddffff                     jmp        0x7f254be7f7ae
0227c f4                             hlt        
0227d f4                             hlt        
0227e f4                             hlt        
0227f f4                             hlt        
