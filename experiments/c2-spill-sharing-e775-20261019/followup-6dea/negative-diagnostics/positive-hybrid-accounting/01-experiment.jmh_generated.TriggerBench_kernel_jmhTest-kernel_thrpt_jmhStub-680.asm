00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ece0000000                 sub        rsp, 0xe0
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 7405                           je         0x7fdcb842481f
0001a e881524c07                     call       0x7fdcbf8e9aa0
0001f 48bb187e08a400000000           movabs     rbx, 0xa4087e18
00029 8b4370                         mov        eax, dword ptr [rbx + 0x70]
0002c 83c002                         add        eax, 2
0002f 894370                         mov        dword ptr [rbx + 0x70], eax
00032 25fe070000                     and        eax, 0x7fe
00037 85c0                           test       eax, eax
00039 0f8434040000                   je         0x7fdcb8424c73
0003f 48897c2460                     mov        qword ptr [rsp + 0x60], rdi
00044 4889542458                     mov        qword ptr [rsp + 0x58], rdx
00049 4889742468                     mov        qword ptr [rsp + 0x68], rsi
0004e 48b8187e08a400000000           movabs     rax, 0xa4087e18
00058 488380a800000001               add        qword ptr [rax + 0xa8], 1
00060 e8bb76191d                     call       0x7fdcd55bbf20
00065 0f1f840000000000               nop        dword ptr [rax + rax]
0006d 488b542458                     mov        rdx, qword ptr [rsp + 0x58]
00072 48894220                       mov        qword ptr [rdx + 0x20], rax
00076 488bbc2400010000               mov        rdi, qword ptr [rsp + 0x100]
0007e 488b5c2460                     mov        rbx, qword ptr [rsp + 0x60]
00083 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
00088 b800000000                     mov        eax, 0
0008d 41bb00000000                   mov        r11d, 0
00093 48898424c8000000               mov        qword ptr [rsp + 0xc8], rax
0009b 4c899c24b0000000               mov        qword ptr [rsp + 0xb0], r11
000a3 48899c24a8000000               mov        qword ptr [rsp + 0xa8], rbx
000ab 48899424c0000000               mov        qword ptr [rsp + 0xc0], rdx
000b3 e9c2000000                     jmp        0x7fdcb842497a
000b8 48be98fd47a8dc7f0000           movabs     rsi, 0x7fdca847fd98
000c2 488386c800000001               add        qword ptr [rsi + 0xc8], 1
000ca 48be98fd47a8dc7f0000           movabs     rsi, 0x7fdca847fd98
000d4 ff86d8000000                   inc        dword ptr [rsi + 0xd8]
000da 488bb424b8000000               mov        rsi, qword ptr [rsp + 0xb8]
000e2 4c8b9c24b0000000               mov        r11, qword ptr [rsp + 0xb0]
000ea 41ba01000000                   mov        r10d, 1
000f0 4d03da                         add        r11, r10
000f3 0fbebe8c000000                 movsx      edi, byte ptr [rsi + 0x8c]
000fa 85ff                           test       edi, edi
000fc b802000000                     mov        eax, 2
00101 7405                           je         0x7fdcb8424908
00103 b800000000                     mov        eax, 0
00108 48ba187e08a400000000           movabs     rdx, 0xa4087e18
00112 8b4a74                         mov        ecx, dword ptr [rdx + 0x74]
00115 03c8                           add        ecx, eax
00117 894a74                         mov        dword ptr [rdx + 0x74], ecx
0011a 85c0                           test       eax, eax
0011c 7505                           jne        0x7fdcb8424923
0011e b902000000                     mov        ecx, 2
00123 81e1fe3f0000                   and        ecx, 0x3ffe
00129 85c9                           test       ecx, ecx
0012b 0f846d030000                   je         0x7fdcb8424c9e
00131 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00135 418502                         test       dword ptr [r10], eax
00138 85ff                           test       edi, edi
0013a 48bf187e08a400000000           movabs     rdi, 0xa4087e18
00144 b828010000                     mov        eax, 0x128
00149 7505                           jne        0x7fdcb8424950
0014b b818010000                     mov        eax, 0x118
00150 488b1407                       mov        rdx, qword ptr [rdi + rax]
00154 488d5201                       lea        rdx, [rdx + 1]
00158 48891407                       mov        qword ptr [rdi + rax], rdx
0015c 0f85ad010000                   jne        0x7fdcb8424b0f
00162 4c899c24b0000000               mov        qword ptr [rsp + 0xb0], r11
0016a 488bbc24a0000000               mov        rdi, qword ptr [rsp + 0xa0]
00172 48899c24a8000000               mov        qword ptr [rsp + 0xa8], rbx
0017a 4889b424b8000000               mov        qword ptr [rsp + 0xb8], rsi
00182 483b07                         cmp        rax, qword ptr [rdi]
00185 488bcf                         mov        rcx, rdi
00188 49b8187e08a400000000           movabs     r8, 0xa4087e18
00192 8b09                           mov        ecx, dword ptr [rcx]
00194 c1e90d                         shr        ecx, 0xd
00197 48c1e10a                       shl        rcx, 0xa
0019b 41ba000000a3                   mov        r10d, 0xa3000000
001a1 4903ca                         add        rcx, r10
001a4 41ba18000000                   mov        r10d, 0x18
001aa 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
001ae 7436                           je         0x7fdcb84249e6
001b0 4983c202                       add        r10, 2
001b4 4983fa1c                       cmp        r10, 0x1c
001b8 75f0                           jne        0x7fdcb84249aa
001ba 41ba18000000                   mov        r10d, 0x18
001c0 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
001c5 7412                           je         0x7fdcb84249d9
001c7 4983c202                       add        r10, 2
001cb 4983fa1c                       cmp        r10, 0x1c
001cf 75ef                           jne        0x7fdcb84249c0
001d1 41ba17000000                   mov        r10d, 0x17
001d7 eb11                           jmp        0x7fdcb84249ea
001d9 50                             push       rax
001da 4833c0                         xor        rax, rax
001dd f04b0fb10cd0                   lock cmpxchg qword ptr [r8 + r10*8], rcx
001e3 58                             pop        rax
001e4 ebbe                           jmp        0x7fdcb84249a4
001e6 4983c201                       add        r10, 1
001ea 4b8304d001                     add        qword ptr [r8 + r10*8], 1
001ef 48b9387848a8dc7f0000           movabs     rcx, 0x7fdca8487838
001f9 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
001fd 4183c002                       add        r8d, 2
00201 44894170                       mov        dword ptr [rcx + 0x70], r8d
00205 4181e0feff1f00                 and        r8d, 0x1ffffe
0020c 4585c0                         test       r8d, r8d
0020f 0f84af020000                   je         0x7fdcb8424cc4
00215 8b4f04                         mov        ecx, dword ptr [rdi + 4]
00218 448b4710                       mov        r8d, dword ptr [rdi + 0x10]
0021c 448b4f14                       mov        r9d, dword ptr [rdi + 0x14]
00220 448b6f18                       mov        r13d, dword ptr [rdi + 0x18]
00224 448b771c                       mov        r14d, dword ptr [rdi + 0x1c]
00228 4889bc24a0000000               mov        qword ptr [rsp + 0xa0], rdi
00230 48bf387848a8dc7f0000           movabs     rdi, 0x7fdca8487838
0023a 488387a800000001               add        qword ptr [rdi + 0xa8], 1
00242 488bf1                         mov        rsi, rcx
00245 498bd0                         mov        rdx, r8
00248 498bc9                         mov        rcx, r9
0024b 4d8bc5                         mov        r8, r13
0024e 4d8bce                         mov        r9, r14
00251 660f1f440000                   nop        word ptr [rax + rax]
00257 e8a4e3ffff                     call       0x7fdcb8422e00
0025c 0f1f840054030001               nop        dword ptr [rax + rax + 0x1000354]
00264 488b9c24a8000000               mov        rbx, qword ptr [rsp + 0xa8]
0026c 483b03                         cmp        rax, qword ptr [rbx]
0026f 488bf3                         mov        rsi, rbx
00272 48bf187e08a400000000           movabs     rdi, 0xa4087e18
0027c 8b36                           mov        esi, dword ptr [rsi]
0027e c1ee0d                         shr        esi, 0xd
00281 48c1e60a                       shl        rsi, 0xa
00285 41ba000000a3                   mov        r10d, 0xa3000000
0028b 4903f2                         add        rsi, r10
0028e 41ba1e000000                   mov        r10d, 0x1e
00294 4a3b34d7                       cmp        rsi, qword ptr [rdi + r10*8]
00298 7436                           je         0x7fdcb8424ad0
0029a 4983c202                       add        r10, 2
0029e 4983fa22                       cmp        r10, 0x22
002a2 75f0                           jne        0x7fdcb8424a94
002a4 41ba1e000000                   mov        r10d, 0x1e
002aa 4a833cd700                     cmp        qword ptr [rdi + r10*8], 0
002af 7412                           je         0x7fdcb8424ac3
002b1 4983c202                       add        r10, 2
002b5 4983fa22                       cmp        r10, 0x22
002b9 75ef                           jne        0x7fdcb8424aaa
002bb 41ba1d000000                   mov        r10d, 0x1d
002c1 eb11                           jmp        0x7fdcb8424ad4
002c3 50                             push       rax
002c4 4833c0                         xor        rax, rax
002c7 f04a0fb134d7                   lock cmpxchg qword ptr [rdi + r10*8], rsi
002cd 58                             pop        rax
002ce ebbe                           jmp        0x7fdcb8424a8e
002d0 4983c201                       add        r10, 1
002d4 4a8304d701                     add        qword ptr [rdi + r10*8], 1
002d9 48be98fd47a8dc7f0000           movabs     rsi, 0x7fdca847fd98
002e3 8b7e70                         mov        edi, dword ptr [rsi + 0x70]
002e6 83c702                         add        edi, 2
002e9 897e70                         mov        dword ptr [rsi + 0x70], edi
002ec 81e7feff1f00                   and        edi, 0x1ffffe
002f2 85ff                           test       edi, edi
002f4 0f84f0010000                   je         0x7fdcb8424cea
002fa 48be98fd47a8dc7f0000           movabs     rsi, 0x7fdca847fd98
00304 ff86b8000000                   inc        dword ptr [rsi + 0xb8]
0030a e9a9fdffff                     jmp        0x7fdcb84248b8
0030f 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
00317 48be187e08a400000000           movabs     rsi, 0xa4087e18
00321 4883863801000001               add        qword ptr [rsi + 0x138], 1
00329 e8f273191d                     call       0x7fdcd55bbf20
0032e 0f1f840000000000               nop        dword ptr [rax + rax]
00336 488b9424c0000000               mov        rdx, qword ptr [rsp + 0xc0]
0033e 48894228                       mov        qword ptr [rdx + 0x28], rax
00342 488b8424c8000000               mov        rax, qword ptr [rsp + 0xc8]
0034a 48894218                       mov        qword ptr [rdx + 0x18], rax
0034e 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
00356 c4c1fb2ac3                     vcvtsi2sd  xmm0, xmm0, r11
0035b c5fb114210                     vmovsd     qword ptr [rdx + 0x10], xmm0
00360 4881c4e0000000                 add        rsp, 0xe0
00367 5d                             pop        rbp
00368 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0036c 0f879e010000                   ja         0x7fdcb8424d10
00372 c3                             ret        
00373 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
0037a 55                             push       rbp
0037b 4881ece0000000                 sub        rsp, 0xe0
00382 6690                           nop        
00384 41817f2000000000               cmp        dword ptr [r15 + 0x20], 0
0038c 7405                           je         0x7fdcb8424b93
0038e e80d4f4c07                     call       0x7fdcbf8e9aa0
00393 bf60000000                     mov        edi, 0x60
00398 4863ff                         movsxd     rdi, edi
0039b 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
0039f bf58000000                     mov        edi, 0x58
003a4 4863ff                         movsxd     rdi, edi
003a7 488b043e                       mov        rax, qword ptr [rsi + rdi]
003ab bf38000000                     mov        edi, 0x38
003b0 4863ff                         movsxd     rdi, edi
003b3 488b143e                       mov        rdx, qword ptr [rsi + rdi]
003b7 bf20000000                     mov        edi, 0x20
003bc 4863ff                         movsxd     rdi, edi
003bf 488b0c3e                       mov        rcx, qword ptr [rsi + rdi]
003c3 bf10000000                     mov        edi, 0x10
003c8 4863ff                         movsxd     rdi, edi
003cb 4c8b043e                       mov        r8, qword ptr [rsi + rdi]
003cf bf00000000                     mov        edi, 0
003d4 4863ff                         movsxd     rdi, edi
003d7 4c8b0c3e                       mov        r9, qword ptr [rsi + rdi]
003db 488bfe                         mov        rdi, rsi
003de 48899c2498000000               mov        qword ptr [rsp + 0x98], rbx
003e6 4889842490000000               mov        qword ptr [rsp + 0x90], rax
003ee 4889942488000000               mov        qword ptr [rsp + 0x88], rdx
003f6 48898c2480000000               mov        qword ptr [rsp + 0x80], rcx
003fe 4c89442478                     mov        qword ptr [rsp + 0x78], r8
00403 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00408 e8b3c2271d                     call       0x7fdcd56a0ec0
0040d 0f1f840000000000               nop        dword ptr [rax + rax]
00415 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
0041a 498bc1                         mov        rax, r9
0041d 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
00422 4d8bd8                         mov        r11, r8
00425 488b8c2480000000               mov        rcx, qword ptr [rsp + 0x80]
0042d 488bf9                         mov        rdi, rcx
00430 488b942488000000               mov        rdx, qword ptr [rsp + 0x88]
00438 488bda                         mov        rbx, rdx
0043b 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00443 488bd6                         mov        rdx, rsi
00446 488bb42498000000               mov        rsi, qword ptr [rsp + 0x98]
0044e 48898424c8000000               mov        qword ptr [rsp + 0xc8], rax
00456 4c899c24b0000000               mov        qword ptr [rsp + 0xb0], r11
0045e 48899c24a8000000               mov        qword ptr [rsp + 0xa8], rbx
00466 48899424c0000000               mov        qword ptr [rsp + 0xc0], rdx
0046e e907fdffff                     jmp        0x7fdcb842497a
00473 49baa09344a8dc7f0000           movabs     r10, 0x7fdca84493a0
0047d 4c89542408                     mov        qword ptr [rsp + 8], r10
00482 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0048a e8d1de5907                     call       0x7fdcbf9c2b60
0048f e9abfbffff                     jmp        0x7fdcb842483f
00494 e847735907                     call       0x7fdcbf9bbfe0
00499 e842735907                     call       0x7fdcbf9bbfe0
0049e 49baa09344a8dc7f0000           movabs     r10, 0x7fdca84493a0
004a8 4c89542408                     mov        qword ptr [rsp + 8], r10
004ad 48c7042421000000               mov        qword ptr [rsp], 0x21
004b5 e8a6de5907                     call       0x7fdcbf9c2b60
004ba e972fcffff                     jmp        0x7fdcb8424931
004bf e81c735907                     call       0x7fdcbf9bbfe0
004c4 49bad0c045a8dc7f0000           movabs     r10, 0x7fdca845c0d0
004ce 4c89542408                     mov        qword ptr [rsp + 8], r10
004d3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
004db e880de5907                     call       0x7fdcbf9c2b60
004e0 e930fdffff                     jmp        0x7fdcb8424a15
004e5 e8f6725907                     call       0x7fdcbf9bbfe0
004ea 49baa87045a8dc7f0000           movabs     r10, 0x7fdca84570a8
004f4 4c89542408                     mov        qword ptr [rsp + 8], r10
004f9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
00501 e85ade5907                     call       0x7fdcbf9c2b60
00506 e9effdffff                     jmp        0x7fdcb8424afa
0050b e8d0725907                     call       0x7fdcbf9bbfe0
00510 49ba684b42b8dc7f0000           movabs     r10, 0x7fdcb8424b68
0051a 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
00521 e9ba814d07                     jmp        0x7fdcbf8fcee0
00526 498b8778050000                 mov        rax, qword ptr [r15 + 0x578]
0052d 49c7877805000000000000         mov        qword ptr [r15 + 0x578], 0
00538 49c7878005000000000000         mov        qword ptr [r15 + 0x580], 0
00543 4881c4e0000000                 add        rsp, 0xe0
0054a 5d                             pop        rbp
0054b e990605907                     jmp        0x7fdcbf9bade0
