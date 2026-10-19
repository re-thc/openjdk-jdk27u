00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ecd0010000                 sub        rsp, 0x1d0
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 7405                           je         0x7f4c1440f19f
0001a e801094f07                     call       0x7f4c1b8ffaa0
0001f 4889742468                     mov        qword ptr [rsp + 0x68], rsi
00024 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00028 4c89442470                     mov        qword ptr [rsp + 0x70], r8
0002d 4c894c2478                     mov        qword ptr [rsp + 0x78], r9
00032 89bc2480000000                 mov        dword ptr [rsp + 0x80], edi
00039 48bb0050720c4c7f0000           movabs     rbx, 0x7f4c0c725000
00043 8b4370                         mov        eax, dword ptr [rbx + 0x70]
00046 83c002                         add        eax, 2
00049 894370                         mov        dword ptr [rbx + 0x70], eax
0004c 25fe070000                     and        eax, 0x7fe
00051 85c0                           test       eax, eax
00053 0f8408180000                   je         0x7f4c144109e1
00059 488bda                         mov        rbx, rdx
0005c ffcb                           dec        ebx
0005e 3b5e08                         cmp        ebx, dword ptr [rsi + 8]
00061 0f8325180000                   jae        0x7f4c14410a0c
00067 4863db                         movsxd     rbx, ebx
0006a 0fbe5c1e0c                     movsx      ebx, byte ptr [rsi + rbx + 0xc]
0006f 81e3ff000000                   and        ebx, 0xff
00075 85db                           test       ebx, ebx
00077 48b80050720c4c7f0000           movabs     rax, 0x7f4c0c725000
00081 41bbb8000000                   mov        r11d, 0xb8
00087 7406                           je         0x7f4c1440f20f
00089 41bba8000000                   mov        r11d, 0xa8
0008f 4e8b2c18                       mov        r13, qword ptr [rax + r11]
00093 4d8d6d01                       lea        r13, [r13 + 1]
00097 4e892c18                       mov        qword ptr [rax + r11], r13
0009b 0f8418170000                   je         0x7f4c14410939
000a1 89542460                       mov        dword ptr [rsp + 0x60], edx
000a5 48b80050720c4c7f0000           movabs     rax, 0x7f4c0c725000
000af 488380d800000001               add        qword ptr [rax + 0xd8], 1
000b7 48b8c8e8710c4c7f0000           movabs     rax, 0x7f4c0c71e8c8
000c1 448b5870                       mov        r11d, dword ptr [rax + 0x70]
000c5 4183c302                       add        r11d, 2
000c9 44895870                       mov        dword ptr [rax + 0x70], r11d
000cd 4181e3feff1f00                 and        r11d, 0x1ffffe
000d4 4585db                         test       r11d, r11d
000d7 0f84bd170000                   je         0x7f4c14410a1a
000dd 48b8c8e8710c4c7f0000           movabs     rax, 0x7f4c0c71e8c8
000e7 488380a800000001               add        qword ptr [rax + 0xa8], 1
000ef 488bf3                         mov        rsi, rbx
000f2 0f1f440000                     nop        dword ptr [rax + rax]
000f7 e8e4155007                     call       0x7f4c1b910860
000fc 0f1f8400f4010000               nop        dword ptr [rax + rax + 0x1f4]
00104 be1f000000                     mov        esi, 0x1f
00109 2bf0                           sub        esi, eax
0010b ba08000000                     mov        edx, 8
00110 2bd6                           sub        edx, esi
00112 8b742460                       mov        esi, dword ptr [rsp + 0x60]
00116 2b742464                       sub        esi, dword ptr [rsp + 0x64]
0011a c1e603                         shl        esi, 3
0011d 2bf2                           sub        esi, edx
0011f 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00129 488381e800000001               add        qword ptr [rcx + 0xe8], 1
00131 89b42488000000                 mov        dword ptr [rsp + 0x88], esi
00138 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
0013d 89942484000000                 mov        dword ptr [rsp + 0x84], edx
00144 8b542464                       mov        edx, dword ptr [rsp + 0x64]
00148 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
0014c 666690                         nop        
0014f e88c155007                     call       0x7f4c1b910860
00154 0f1f84004c020001               nop        dword ptr [rax + rax + 0x100024c]
0015c 48be0050720c4c7f0000           movabs     rsi, 0x7f4c0c725000
00166 488386f800000001               add        qword ptr [rsi + 0xf8], 1
0016e 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00172 83e908                         sub        ecx, 8
00175 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
0017a 8b542464                       mov        edx, dword ptr [rsp + 0x64]
0017e 4889842490000000               mov        qword ptr [rsp + 0x90], rax
00186 90                             nop        
00187 e854155007                     call       0x7f4c1b910860
0018c 0f1f840084020002               nop        dword ptr [rax + rax + 0x2000284]
00194 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00199 418b781c                       mov        edi, dword ptr [r8 + 0x1c]
0019d 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
001a5 418b5820                       mov        ebx, dword ptr [r8 + 0x20]
001a9 48899c24c0000000               mov        qword ptr [rsp + 0xc0], rbx
001b1 458b4824                       mov        r9d, dword ptr [r8 + 0x24]
001b5 4c898c24b0000000               mov        qword ptr [rsp + 0xb0], r9
001bd 8b4f08                         mov        ecx, dword ptr [rdi + 8]
001c0 8b7308                         mov        esi, dword ptr [rbx + 8]
001c3 418b5108                       mov        edx, dword ptr [r9 + 8]
001c7 03ce                           add        ecx, esi
001c9 03ca                           add        ecx, edx
001cb 898c24a0000000                 mov        dword ptr [rsp + 0xa0], ecx
001d2 be40000000                     mov        esi, 0x40
001d7 2bb42484000000                 sub        esi, dword ptr [rsp + 0x84]
001de 85c9                           test       ecx, ecx
001e0 48ba0050720c4c7f0000           movabs     rdx, 0x7f4c0c725000
001ea 41bb08010000                   mov        r11d, 0x108
001f0 7506                           jne        0x7f4c1440f378
001f2 41bb18010000                   mov        r11d, 0x118
001f8 4e8b2c1a                       mov        r13, qword ptr [rdx + r11]
001fc 4d8d6d01                       lea        r13, [r13 + 1]
00200 4e892c1a                       mov        qword ptr [rdx + r11], r13
00204 0f8526000000                   jne        0x7f4c1440f3b0
0020a 48be0050720c4c7f0000           movabs     rsi, 0x7f4c0c725000
00214 ff8628010000                   inc        dword ptr [rsi + 0x128]
0021a 41bb00000000                   mov        r11d, 0
00220 4c8be9                         mov        r13, rcx
00223 4c8bb42490000000               mov        r14, qword ptr [rsp + 0x90]
0022b e9b0010000                     jmp        0x7f4c1440f560
00230 3bce                           cmp        ecx, esi
00232 48ba0050720c4c7f0000           movabs     rdx, 0x7f4c0c725000
0023c 41bb40010000                   mov        r11d, 0x140
00242 7f06                           jg         0x7f4c1440f3ca
00244 41bb50010000                   mov        r11d, 0x150
0024a 4e8b2c1a                       mov        r13, qword ptr [rdx + r11]
0024e 4d8d6d01                       lea        r13, [r13 + 1]
00252 4e892c1a                       mov        qword ptr [rdx + r11], r13
00256 0f8fc5000000                   jg         0x7f4c1440f4a1
0025c 2bf1                           sub        esi, ecx
0025e 4c8be9                         mov        r13, rcx
00261 488bce                         mov        rcx, rsi
00264 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
0026c 48d3ee                         shr        rsi, cl
0026f 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00279 4883816001000001               add        qword ptr [rcx + 0x160], 1
00281 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
0028b 8b5170                         mov        edx, dword ptr [rcx + 0x70]
0028e 83c202                         add        edx, 2
00291 895170                         mov        dword ptr [rcx + 0x70], edx
00294 81e2feff1f00                   and        edx, 0x1ffffe
0029a 85d2                           test       edx, edx
0029c 0f842d160000                   je         0x7f4c14410a4f
002a2 4183fd40                       cmp        r13d, 0x40
002a6 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
002b0 baa8000000                     mov        edx, 0xa8
002b5 7c05                           jl         0x7f4c1440f43c
002b7 bab8000000                     mov        edx, 0xb8
002bc 4c8b1c11                       mov        r11, qword ptr [rcx + rdx]
002c0 4d8d5b01                       lea        r11, [r11 + 1]
002c4 4c891c11                       mov        qword ptr [rcx + rdx], r11
002c8 0f8c1c000000                   jl         0x7f4c1440f46a
002ce 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
002d8 ff81c8000000                   inc        dword ptr [rcx + 0xc8]
002de 48c7c2ffffffff                 mov        rdx, 0xffffffffffffffff
002e5 e914000000                     jmp        0x7f4c1440f47e
002ea ba01000000                     mov        edx, 1
002ef 498bcd                         mov        rcx, r13
002f2 4c8bda                         mov        r11, rdx
002f5 49d3e3                         shl        r11, cl
002f8 4c2bda                         sub        r11, rdx
002fb 498bd3                         mov        rdx, r11
002fe 4823d6                         and        rdx, rsi
00301 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
0030b ff8170010000                   inc        dword ptr [rcx + 0x170]
00311 4c8bda                         mov        r11, rdx
00314 4c8bb42490000000               mov        r14, qword ptr [rsp + 0x90]
0031c e9bf000000                     jmp        0x7f4c1440f560
00321 4c8be9                         mov        r13, rcx
00324 498bd5                         mov        rdx, r13
00327 2bd6                           sub        edx, esi
00329 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00333 4883818801000001               add        qword ptr [rcx + 0x188], 1
0033b 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00345 448b5970                       mov        r11d, dword ptr [rcx + 0x70]
00349 4183c302                       add        r11d, 2
0034d 44895970                       mov        dword ptr [rcx + 0x70], r11d
00351 4181e3feff1f00                 and        r11d, 0x1ffffe
00358 4585db                         test       r11d, r11d
0035b 0f848f150000                   je         0x7f4c14410a70
00361 83fe40                         cmp        esi, 0x40
00364 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
0036e 41bba8000000                   mov        r11d, 0xa8
00374 7c06                           jl         0x7f4c1440f4fc
00376 41bbb8000000                   mov        r11d, 0xb8
0037c 4e8b3419                       mov        r14, qword ptr [rcx + r11]
00380 4d8d7601                       lea        r14, [r14 + 1]
00384 4e893419                       mov        qword ptr [rcx + r11], r14
00388 0f8c1c000000                   jl         0x7f4c1440f52a
0038e 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00398 ff81c8000000                   inc        dword ptr [rcx + 0xc8]
0039e 48c7c6ffffffff                 mov        rsi, 0xffffffffffffffff
003a5 e912000000                     jmp        0x7f4c1440f53c
003aa 41bb01000000                   mov        r11d, 1
003b0 488bce                         mov        rcx, rsi
003b3 498bf3                         mov        rsi, r11
003b6 48d3e6                         shl        rsi, cl
003b9 492bf3                         sub        rsi, r11
003bc 4c8bb42490000000               mov        r14, qword ptr [rsp + 0x90]
003c4 4923f6                         and        rsi, r14
003c7 488bca                         mov        rcx, rdx
003ca 48d3e6                         shl        rsi, cl
003cd b940000000                     mov        ecx, 0x40
003d2 2bca                           sub        ecx, edx
003d4 488bd0                         mov        rdx, rax
003d7 48d3ea                         shr        rdx, cl
003da 480bf2                         or         rsi, rdx
003dd 4c8bde                         mov        r11, rsi
003e0 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
003e7 4103d5                         add        edx, r13d
003ea 83fa40                         cmp        edx, 0x40
003ed 48be0050720c4c7f0000           movabs     rsi, 0x7f4c0c725000
003f7 b9a8010000                     mov        ecx, 0x1a8
003fc 7d05                           jge        0x7f4c1440f583
003fe b998010000                     mov        ecx, 0x198
00403 488b3c0e                       mov        rdi, qword ptr [rsi + rcx]
00407 488d7f01                       lea        rdi, [rdi + 1]
0040b 48893c0e                       mov        qword ptr [rsi + rcx], rdi
0040f 0f8d14000000                   jge        0x7f4c1440f5a9
00415 498bf6                         mov        rsi, r14
00418 8b7c2460                       mov        edi, dword ptr [rsp + 0x60]
0041c 4c899c24b8000000               mov        qword ptr [rsp + 0xb8], r11
00424 e981000000                     jmp        0x7f4c1440f62a
00429 4c899c24b8000000               mov        qword ptr [rsp + 0xb8], r11
00431 48898424a8000000               mov        qword ptr [rsp + 0xa8], rax
00439 83ea40                         sub        edx, 0x40
0043c 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
00441 4183ed08                       sub        r13d, 8
00445 48be0050720c4c7f0000           movabs     rsi, 0x7f4c0c725000
0044f 488386b801000001               add        qword ptr [rsi + 0x1b8], 1
00457 4d8bf5                         mov        r14, r13
0045a 4183ee08                       sub        r14d, 8
0045e 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
00463 8994248c000000                 mov        dword ptr [rsp + 0x8c], edx
0046a 8b542464                       mov        edx, dword ptr [rsp + 0x64]
0046e 498bce                         mov        rcx, r14
00471 4489ac24a4000000               mov        dword ptr [rsp + 0xa4], r13d
00479 660f1f440000                   nop        word ptr [rax + rax]
0047f e85c125007                     call       0x7f4c1b910860
00484 0f1f84007c050003               nop        dword ptr [rax + rax + 0x300057c]
0048c 8b94248c000000                 mov        edx, dword ptr [rsp + 0x8c]
00493 488bb424a8000000               mov        rsi, qword ptr [rsp + 0xa8]
0049b 8bbc24a4000000                 mov        edi, dword ptr [rsp + 0xa4]
004a2 4c8b8c24b0000000               mov        r9, qword ptr [rsp + 0xb0]
004aa 418b5908                       mov        ebx, dword ptr [r9 + 8]
004ae 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
004b8 488381c801000001               add        qword ptr [rcx + 0x1c8], 1
004c0 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
004ca 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
004ce 4183c002                       add        r8d, 2
004d2 44894170                       mov        dword ptr [rcx + 0x70], r8d
004d6 4181e0feff1f00                 and        r8d, 0x1ffffe
004dd 4585c0                         test       r8d, r8d
004e0 0f842b140000                   je         0x7f4c14410a91
004e6 83fb20                         cmp        ebx, 0x20
004e9 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
004f3 41b8a8000000                   mov        r8d, 0xa8
004f9 7c06                           jl         0x7f4c1440f681
004fb 41b8b8000000                   mov        r8d, 0xb8
00501 4e8b1c01                       mov        r11, qword ptr [rcx + r8]
00505 4d8d5b01                       lea        r11, [r11 + 1]
00509 4e891c01                       mov        qword ptr [rcx + r8], r11
0050d 0f8c1b000000                   jl         0x7f4c1440f6ae
00513 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
0051d ff81c8000000                   inc        dword ptr [rcx + 0xc8]
00523 41b8ffffffff                   mov        r8d, 0xffffffff
00529 e90f000000                     jmp        0x7f4c1440f6bd
0052e 488bcb                         mov        rcx, rbx
00531 41b801000000                   mov        r8d, 1
00537 41d3e0                         shl        r8d, cl
0053a 41ffc8                         dec        r8d
0053d 89bc24c8000000                 mov        dword ptr [rsp + 0xc8], edi
00544 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
0054c 4c8bac24c0000000               mov        r13, qword ptr [rsp + 0xc0]
00554 4d63c0                         movsxd     r8, r8d
00557 4d23c3                         and        r8, r11
0055a 458bc0                         mov        r8d, r8d
0055d 488bcb                         mov        rcx, rbx
00560 49d3eb                         shr        r11, cl
00563 418b5d08                       mov        ebx, dword ptr [r13 + 8]
00567 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00571 488381d801000001               add        qword ptr [rcx + 0x1d8], 1
00579 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
00583 448b7170                       mov        r14d, dword ptr [rcx + 0x70]
00587 4183c602                       add        r14d, 2
0058b 44897170                       mov        dword ptr [rcx + 0x70], r14d
0058f 4181e6feff1f00                 and        r14d, 0x1ffffe
00596 4585f6                         test       r14d, r14d
00599 0f8493130000                   je         0x7f4c14410ab2
0059f 83fb20                         cmp        ebx, 0x20
005a2 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
005ac 41bea8000000                   mov        r14d, 0xa8
005b2 7c06                           jl         0x7f4c1440f73a
005b4 41beb8000000                   mov        r14d, 0xb8
005ba 4a8b3c31                       mov        rdi, qword ptr [rcx + r14]
005be 488d7f01                       lea        rdi, [rdi + 1]
005c2 4a893c31                       mov        qword ptr [rcx + r14], rdi
005c6 0f8c1a000000                   jl         0x7f4c1440f766
005cc 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
005d6 ff81c8000000                   inc        dword ptr [rcx + 0xc8]
005dc bfffffffff                     mov        edi, 0xffffffff
005e1 e90c000000                     jmp        0x7f4c1440f772
005e6 488bcb                         mov        rcx, rbx
005e9 bf01000000                     mov        edi, 1
005ee d3e7                           shl        edi, cl
005f0 ffcf                           dec        edi
005f2 4889b424d0000000               mov        qword ptr [rsp + 0xd0], rsi
005fa 488b8c2498000000               mov        rcx, qword ptr [rsp + 0x98]
00602 4c8b742478                     mov        r14, qword ptr [rsp + 0x78]
00607 4863ff                         movsxd     rdi, edi
0060a 4923fb                         and        rdi, r11
0060d 8bff                           mov        edi, edi
0060f 488bf1                         mov        rsi, rcx
00612 488bcb                         mov        rcx, rbx
00615 49d3eb                         shr        r11, cl
00618 458bdb                         mov        r11d, r11d
0061b 418b9ef4000000                 mov        ebx, dword ptr [r14 + 0xf4]
00622 48899c24d8000000               mov        qword ptr [rsp + 0xd8], rbx
0062a 418b8ef8000000                 mov        ecx, dword ptr [r14 + 0xf8]
00631 48898c2410010000               mov        qword ptr [rsp + 0x110], rcx
00639 418b5e28                       mov        ebx, dword ptr [r14 + 0x28]
0063d 899c24cc000000                 mov        dword ptr [rsp + 0xcc], ebx
00644 8b5e18                         mov        ebx, dword ptr [rsi + 0x18]
00647 8b5b08                         mov        ebx, dword ptr [rbx + 8]
0064a ffcb                           dec        ebx
0064c 899c24e0000000                 mov        dword ptr [rsp + 0xe0], ebx
00653 418b5d18                       mov        ebx, dword ptr [r13 + 0x18]
00657 8b5b08                         mov        ebx, dword ptr [rbx + 8]
0065a ffcb                           dec        ebx
0065c 899c24e4000000                 mov        dword ptr [rsp + 0xe4], ebx
00663 418b5918                       mov        ebx, dword ptr [r9 + 0x18]
00667 8b5b08                         mov        ebx, dword ptr [rbx + 8]
0066a ffcb                           dec        ebx
0066c 899c24e8000000                 mov        dword ptr [rsp + 0xe8], ebx
00673 8b9c24a0000000                 mov        ebx, dword ptr [rsp + 0xa0]
0067a 48898424f0000000               mov        qword ptr [rsp + 0xf0], rax
00682 488b8424d0000000               mov        rax, qword ptr [rsp + 0xd0]
0068a 48898424f8000000               mov        qword ptr [rsp + 0xf8], rax
00692 8b8424c8000000                 mov        eax, dword ptr [rsp + 0xc8]
00699 898424ec000000                 mov        dword ptr [rsp + 0xec], eax
006a0 b800000000                     mov        eax, 0
006a5 89942400010000                 mov        dword ptr [rsp + 0x100], edx
006ac ba00000000                     mov        edx, 0
006b1 4889942408010000               mov        qword ptr [rsp + 0x108], rdx
006b9 899c2404010000                 mov        dword ptr [rsp + 0x104], ebx
006c0 8b9424e0000000                 mov        edx, dword ptr [rsp + 0xe0]
006c7 8b8c24e4000000                 mov        ecx, dword ptr [rsp + 0xe4]
006ce 448bb42480000000               mov        r14d, dword ptr [rsp + 0x80]
006d6 6690                           nop        
006d8 413bc6                         cmp        eax, r14d
006db 48bb0050720c4c7f0000           movabs     rbx, 0x7f4c0c725000
006e5 41bee8010000                   mov        r14d, 0x1e8
006eb 7d06                           jge        0x7f4c1440f873
006ed 41bef8010000                   mov        r14d, 0x1f8
006f3 89842418010000                 mov        dword ptr [rsp + 0x118], eax
006fa 4a8b0433                       mov        rax, qword ptr [rbx + r14]
006fe 488d4001                       lea        rax, [rax + 1]
00702 4a890433                       mov        qword ptr [rbx + r14], rax
00706 0f8d000e0000                   jge        0x7f4c1441068c
0070c 8b5e18                         mov        ebx, dword ptr [rsi + 0x18]
0070f 498bc3                         mov        rax, r11
00712 4823c2                         and        rax, rdx
00715 3b4308                         cmp        eax, dword ptr [rbx + 8]
00718 0f8353120000                   jae        0x7f4c14410af1
0071e 4863c0                         movsxd     rax, eax
00721 4c8b74c310                     mov        r14, qword ptr [rbx + rax*8 + 0x10]
00726 4c89b42470010000               mov        qword ptr [rsp + 0x170], r14
0072e 418b5d18                       mov        ebx, dword ptr [r13 + 0x18]
00732 488bc7                         mov        rax, rdi
00735 4823c1                         and        rax, rcx
00738 3b4308                         cmp        eax, dword ptr [rbx + 8]
0073b 0f8348120000                   jae        0x7f4c14410b09
00741 4863c0                         movsxd     rax, eax
00744 488b74c310                     mov        rsi, qword ptr [rbx + rax*8 + 0x10]
00749 4889b42438010000               mov        qword ptr [rsp + 0x138], rsi
00751 418b5918                       mov        ebx, dword ptr [r9 + 0x18]
00755 498bc0                         mov        rax, r8
00758 238424e8000000                 and        eax, dword ptr [rsp + 0xe8]
0075f 3b4308                         cmp        eax, dword ptr [rbx + 8]
00762 0f8339120000                   jae        0x7f4c14410b21
00768 4863c0                         movsxd     rax, eax
0076b 89bc241c010000                 mov        dword ptr [rsp + 0x11c], edi
00772 488b7cc310                     mov        rdi, qword ptr [rbx + rax*8 + 0x10]
00777 4889bc2430010000               mov        qword ptr [rsp + 0x130], rdi
0077f b920000000                     mov        ecx, 0x20
00784 488bc6                         mov        rax, rsi
00787 48d3e8                         shr        rax, cl
0078a 8bc0                           mov        eax, eax
0078c 25ff000000                     and        eax, 0xff
00791 89842444010000                 mov        dword ptr [rsp + 0x144], eax
00798 b920000000                     mov        ecx, 0x20
0079d 488bdf                         mov        rbx, rdi
007a0 48d3eb                         shr        rbx, cl
007a3 8bdb                           mov        ebx, ebx
007a5 81e3ff000000                   and        ebx, 0xff
007ab 899c2440010000                 mov        dword ptr [rsp + 0x140], ebx
007b2 b920000000                     mov        ecx, 0x20
007b7 498bd6                         mov        rdx, r14
007ba 48d3ea                         shr        rdx, cl
007bd 8bd2                           mov        edx, edx
007bf 81e2ff000000                   and        edx, 0xff
007c5 89942448010000                 mov        dword ptr [rsp + 0x148], edx
007cc 8b8c2418010000                 mov        ecx, dword ptr [rsp + 0x118]
007d3 ffc1                           inc        ecx
007d5 898c2428010000                 mov        dword ptr [rsp + 0x128], ecx
007dc 3b8c2480000000                 cmp        ecx, dword ptr [rsp + 0x80]
007e3 4489842420010000               mov        dword ptr [rsp + 0x120], r8d
007eb 49b80050720c4c7f0000           movabs     r8, 0x7f4c0c725000
007f5 41b908020000                   mov        r9d, 0x208
007fb 7d06                           jge        0x7f4c1440f983
007fd 41b918020000                   mov        r9d, 0x218
00803 44899c2424010000               mov        dword ptr [rsp + 0x124], r11d
0080b 4f8b1c08                       mov        r11, qword ptr [r8 + r9]
0080f 4d8d5b01                       lea        r11, [r11 + 1]
00813 4f891c08                       mov        qword ptr [r8 + r9], r11
00817 0f8d1c000000                   jge        0x7f4c1440f9b9
0081d 49b80050720c4c7f0000           movabs     r8, 0x7f4c0c725000
00827 41ff8028020000                 inc        dword ptr [r8 + 0x228]
0082e 41b801000000                   mov        r8d, 1
00834 e906000000                     jmp        0x7f4c1440f9bf
00839 41b800000000                   mov        r8d, 0
0083f 4585c0                         test       r8d, r8d
00842 49b90050720c4c7f0000           movabs     r9, 0x7f4c0c725000
0084c 41bb40020000                   mov        r11d, 0x240
00852 7406                           je         0x7f4c1440f9da
00854 41bb50020000                   mov        r11d, 0x250
0085a 4f8b2c19                       mov        r13, qword ptr [r9 + r11]
0085e 4d8d6d01                       lea        r13, [r13 + 1]
00862 4f892c19                       mov        qword ptr [r9 + r11], r13
00866 0f842a000000                   je         0x7f4c1440fa16
0086c b928000000                     mov        ecx, 0x28
00871 4d8bde                         mov        r11, r14
00874 49d3eb                         shr        r11, cl
00877 458bdb                         mov        r11d, r11d
0087a 4181e3ff000000                 and        r11d, 0xff
00881 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
0088b ff8160020000                   inc        dword ptr [rcx + 0x260]
00891 e906000000                     jmp        0x7f4c1440fa1c
00896 41bb00000000                   mov        r11d, 0
0089c 4585c0                         test       r8d, r8d
0089f 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
008a9 41bd78020000                   mov        r13d, 0x278
008af 7406                           je         0x7f4c1440fa37
008b1 41bd88020000                   mov        r13d, 0x288
008b7 4e8b0c29                       mov        r9, qword ptr [rcx + r13]
008bb 4d8d4901                       lea        r9, [r9 + 1]
008bf 4e890c29                       mov        qword ptr [rcx + r13], r9
008c3 0f842a000000                   je         0x7f4c1440fa73
008c9 b928000000                     mov        ecx, 0x28
008ce 4c8bcf                         mov        r9, rdi
008d1 49d3e9                         shr        r9, cl
008d4 458bc9                         mov        r9d, r9d
008d7 4181e1ff000000                 and        r9d, 0xff
008de 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
008e8 ff8198020000                   inc        dword ptr [rcx + 0x298]
008ee e906000000                     jmp        0x7f4c1440fa79
008f3 41b900000000                   mov        r9d, 0
008f9 4585c0                         test       r8d, r8d
008fc 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00906 41bdb0020000                   mov        r13d, 0x2b0
0090c 7406                           je         0x7f4c1440fa94
0090e 41bdc0020000                   mov        r13d, 0x2c0
00914 4a8b3c29                       mov        rdi, qword ptr [rcx + r13]
00918 488d7f01                       lea        rdi, [rdi + 1]
0091c 4a893c29                       mov        qword ptr [rcx + r13], rdi
00920 0f8428000000                   je         0x7f4c1440face
00926 b928000000                     mov        ecx, 0x28
0092b 488bfe                         mov        rdi, rsi
0092e 48d3ef                         shr        rdi, cl
00931 8bff                           mov        edi, edi
00933 81e7ff000000                   and        edi, 0xff
00939 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00943 ff81d0020000                   inc        dword ptr [rcx + 0x2d0]
00949 e905000000                     jmp        0x7f4c1440fad3
0094e bf00000000                     mov        edi, 0
00953 4503d9                         add        r11d, r9d
00956 4403df                         add        r11d, edi
00959 488bc8                         mov        rcx, rax
0095c 03cb                           add        ecx, ebx
0095e 03ca                           add        ecx, edx
00960 4c8be9                         mov        r13, rcx
00963 4503eb                         add        r13d, r11d
00966 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00970 ff81e8020000                   inc        dword ptr [rcx + 0x2e8]
00976 89bc242c010000                 mov        dword ptr [rsp + 0x12c], edi
0097d 4585ed                         test       r13d, r13d
00980 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
0098a be78030000                     mov        esi, 0x378
0098f 7505                           jne        0x7f4c1440fb16
00991 be88030000                     mov        esi, 0x388
00996 488b3c31                       mov        rdi, qword ptr [rcx + rsi]
0099a 488d7f01                       lea        rdi, [rdi + 1]
0099e 48893c31                       mov        qword ptr [rcx + rsi], rdi
009a2 0f8550000000                   jne        0x7f4c1440fb78
009a8 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
009b2 ff8198030000                   inc        dword ptr [rcx + 0x398]
009b8 8bbc2404010000                 mov        edi, dword ptr [rsp + 0x104]
009bf 448bac2400010000               mov        r13d, dword ptr [rsp + 0x100]
009c7 488bb424f0000000               mov        rsi, qword ptr [rsp + 0xf0]
009cf 488b8c24f8000000               mov        rcx, qword ptr [rsp + 0xf8]
009d7 8b9c24ec000000                 mov        ebx, dword ptr [rsp + 0xec]
009de b800000000                     mov        eax, 0
009e3 44898c2450010000               mov        dword ptr [rsp + 0x150], r9d
009eb 448984244c010000               mov        dword ptr [rsp + 0x14c], r8d
009f3 e908030000                     jmp        0x7f4c1440fe80
009f8 4183fd3f                       cmp        r13d, 0x3f
009fc 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00a06 beb0030000                     mov        esi, 0x3b0
00a0b 7f05                           jg         0x7f4c1440fb92
00a0d bec0030000                     mov        esi, 0x3c0
00a12 488b3c31                       mov        rdi, qword ptr [rcx + rsi]
00a16 488d7f01                       lea        rdi, [rdi + 1]
00a1a 48893c31                       mov        qword ptr [rcx + rsi], rdi
00a1e 0f8f41090000                   jg         0x7f4c144104e5
00a24 b940000000                     mov        ecx, 0x40
00a29 2b8c2400010000                 sub        ecx, dword ptr [rsp + 0x100]
00a30 443be9                         cmp        r13d, ecx
00a33 48be0050720c4c7f0000           movabs     rsi, 0x7f4c0c725000
00a3d bfd0030000                     mov        edi, 0x3d0
00a42 7f05                           jg         0x7f4c1440fbc9
00a44 bfe0030000                     mov        edi, 0x3e0
00a49 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
00a4d 488d5b01                       lea        rbx, [rbx + 1]
00a51 48891c3e                       mov        qword ptr [rsi + rdi], rbx
00a55 0f8fbd000000                   jg         0x7f4c1440fc98
00a5b 412bcd                         sub        ecx, r13d
00a5e 488b8424f8000000               mov        rax, qword ptr [rsp + 0xf8]
00a66 48d3e8                         shr        rax, cl
00a69 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00a73 488381f003000001               add        qword ptr [rcx + 0x3f0], 1
00a7b 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00a85 8b7170                         mov        esi, dword ptr [rcx + 0x70]
00a88 83c602                         add        esi, 2
00a8b 897170                         mov        dword ptr [rcx + 0x70], esi
00a8e 81e6feff1f00                   and        esi, 0x1ffffe
00a94 85f6                           test       esi, esi
00a96 0f84130f0000                   je         0x7f4c14410b2f
00a9c 4183fd40                       cmp        r13d, 0x40
00aa0 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00aaa bea8000000                     mov        esi, 0xa8
00aaf 7c05                           jl         0x7f4c1440fc36
00ab1 beb8000000                     mov        esi, 0xb8
00ab6 488b3c31                       mov        rdi, qword ptr [rcx + rsi]
00aba 488d7f01                       lea        rdi, [rdi + 1]
00abe 48893c31                       mov        qword ptr [rcx + rsi], rdi
00ac2 0f8c1c000000                   jl         0x7f4c1440fc64
00ac8 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00ad2 ff81c8000000                   inc        dword ptr [rcx + 0xc8]
00ad8 48c7c6ffffffff                 mov        rsi, 0xffffffffffffffff
00adf e914000000                     jmp        0x7f4c1440fc78
00ae4 be01000000                     mov        esi, 1
00ae9 498bcd                         mov        rcx, r13
00aec 488bfe                         mov        rdi, rsi
00aef 48d3e7                         shl        rdi, cl
00af2 482bfe                         sub        rdi, rsi
00af5 488bf7                         mov        rsi, rdi
00af8 4823f0                         and        rsi, rax
00afb 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00b05 ff8100040000                   inc        dword ptr [rcx + 0x400]
00b0b 488b9c24f8000000               mov        rbx, qword ptr [rsp + 0xf8]
00b13 e9b9000000                     jmp        0x7f4c1440fd51
00b18 498bf5                         mov        rsi, r13
00b1b 2bf1                           sub        esi, ecx
00b1d 48bf0050720c4c7f0000           movabs     rdi, 0x7f4c0c725000
00b27 4883871804000001               add        qword ptr [rdi + 0x418], 1
00b2f 48bf80eb710c4c7f0000           movabs     rdi, 0x7f4c0c71eb80
00b39 8b5f70                         mov        ebx, dword ptr [rdi + 0x70]
00b3c 83c302                         add        ebx, 2
00b3f 895f70                         mov        dword ptr [rdi + 0x70], ebx
00b42 81e3feff1f00                   and        ebx, 0x1ffffe
00b48 85db                           test       ebx, ebx
00b4a 0f84800e0000                   je         0x7f4c14410b50
00b50 83f940                         cmp        ecx, 0x40
00b53 48bf80eb710c4c7f0000           movabs     rdi, 0x7f4c0c71eb80
00b5d bba8000000                     mov        ebx, 0xa8
00b62 7c05                           jl         0x7f4c1440fce9
00b64 bbb8000000                     mov        ebx, 0xb8
00b69 488b041f                       mov        rax, qword ptr [rdi + rbx]
00b6d 488d4001                       lea        rax, [rax + 1]
00b71 4889041f                       mov        qword ptr [rdi + rbx], rax
00b75 0f8c1c000000                   jl         0x7f4c1440fd17
00b7b 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00b85 ff81c8000000                   inc        dword ptr [rcx + 0xc8]
00b8b 48c7c7ffffffff                 mov        rdi, 0xffffffffffffffff
00b92 e911000000                     jmp        0x7f4c1440fd28
00b97 bf01000000                     mov        edi, 1
00b9c 488bdf                         mov        rbx, rdi
00b9f 48d3e3                         shl        rbx, cl
00ba2 482bdf                         sub        rbx, rdi
00ba5 488bfb                         mov        rdi, rbx
00ba8 488b9c24f8000000               mov        rbx, qword ptr [rsp + 0xf8]
00bb0 4823fb                         and        rdi, rbx
00bb3 488bce                         mov        rcx, rsi
00bb6 48d3e7                         shl        rdi, cl
00bb9 b940000000                     mov        ecx, 0x40
00bbe 2bce                           sub        ecx, esi
00bc0 488b8424f0000000               mov        rax, qword ptr [rsp + 0xf0]
00bc8 48d3e8                         shr        rax, cl
00bcb 480bf8                         or         rdi, rax
00bce 488bf7                         mov        rsi, rdi
00bd1 498bcd                         mov        rcx, r13
00bd4 038c2400010000                 add        ecx, dword ptr [rsp + 0x100]
00bdb 4403ac2404010000               add        r13d, dword ptr [rsp + 0x104]
00be3 83f940                         cmp        ecx, 0x40
00be6 48bf0050720c4c7f0000           movabs     rdi, 0x7f4c0c725000
00bf0 b838040000                     mov        eax, 0x438
00bf5 7d05                           jge        0x7f4c1440fd7c
00bf7 b828040000                     mov        eax, 0x428
00bfc 488b1407                       mov        rdx, qword ptr [rdi + rax]
00c00 488d5201                       lea        rdx, [rdx + 1]
00c04 48891407                       mov        qword ptr [rdi + rax], rdx
00c08 0f8d33000000                   jge        0x7f4c1440fdc1
00c0e 488b9424f0000000               mov        rdx, qword ptr [rsp + 0xf0]
00c16 488bc6                         mov        rax, rsi
00c19 498bfd                         mov        rdi, r13
00c1c 4c8be9                         mov        r13, rcx
00c1f 488bf2                         mov        rsi, rdx
00c22 488bcb                         mov        rcx, rbx
00c25 8b9c24ec000000                 mov        ebx, dword ptr [rsp + 0xec]
00c2c 44898c2450010000               mov        dword ptr [rsp + 0x150], r9d
00c34 448984244c010000               mov        dword ptr [rsp + 0x14c], r8d
00c3c e9bf000000                     jmp        0x7f4c1440fe80
00c41 4489ac2460010000               mov        dword ptr [rsp + 0x160], r13d
00c49 4889b42458010000               mov        qword ptr [rsp + 0x158], rsi
00c51 44899c2468010000               mov        dword ptr [rsp + 0x168], r11d
00c59 44898c2450010000               mov        dword ptr [rsp + 0x150], r9d
00c61 448984244c010000               mov        dword ptr [rsp + 0x14c], r8d
00c69 83e940                         sub        ecx, 0x40
00c6c 8bbc24ec000000                 mov        edi, dword ptr [rsp + 0xec]
00c73 83ef08                         sub        edi, 8
00c76 48bb0050720c4c7f0000           movabs     rbx, 0x7f4c0c725000
00c80 4883834804000001               add        qword ptr [rbx + 0x448], 1
00c88 488bdf                         mov        rbx, rdi
00c8b 83eb08                         sub        ebx, 8
00c8e 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
00c93 8b542464                       mov        edx, dword ptr [rsp + 0x64]
00c97 898c2454010000                 mov        dword ptr [rsp + 0x154], ecx
00c9e 488bcb                         mov        rcx, rbx
00ca1 89bc2464010000                 mov        dword ptr [rsp + 0x164], edi
00ca8 0f1f8000000000                 nop        dword ptr [rax]
00caf e82c0a5007                     call       0x7f4c1b910860
00cb4 0f1f8400ac0d0004               nop        dword ptr [rax + rax + 0x4000dac]
00cbc 488bc8                         mov        rcx, rax
00cbf 48be0050720c4c7f0000           movabs     rsi, 0x7f4c0c725000
00cc9 ff8658040000                   inc        dword ptr [rsi + 0x458]
00ccf 488b842458010000               mov        rax, qword ptr [rsp + 0x158]
00cd7 8bbc2460010000                 mov        edi, dword ptr [rsp + 0x160]
00cde 448bac2454010000               mov        r13d, dword ptr [rsp + 0x154]
00ce6 488bf1                         mov        rsi, rcx
00ce9 488b8c24f0000000               mov        rcx, qword ptr [rsp + 0xf0]
00cf1 8b9c2464010000                 mov        ebx, dword ptr [rsp + 0x164]
00cf8 448b9c2468010000               mov        r11d, dword ptr [rsp + 0x168]
00d00 48ba0050720c4c7f0000           movabs     rdx, 0x7f4c0c725000
00d0a 488382e004000001               add        qword ptr [rdx + 0x4e0], 1
00d12 48ba80eb710c4c7f0000           movabs     rdx, 0x7f4c0c71eb80
00d1c 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
00d20 4183c002                       add        r8d, 2
00d24 44894270                       mov        dword ptr [rdx + 0x70], r8d
00d28 4181e0feff1f00                 and        r8d, 0x1ffffe
00d2f 4585c0                         test       r8d, r8d
00d32 0f84b90c0000                   je         0x7f4c14410b71
00d38 4183fb40                       cmp        r11d, 0x40
00d3c 48ba80eb710c4c7f0000           movabs     rdx, 0x7f4c0c71eb80
00d46 41b8a8000000                   mov        r8d, 0xa8
00d4c 7c06                           jl         0x7f4c1440fed4
00d4e 41b8b8000000                   mov        r8d, 0xb8
00d54 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
00d58 4d8d4901                       lea        r9, [r9 + 1]
00d5c 4e890c02                       mov        qword ptr [rdx + r8], r9
00d60 0f8c24000000                   jl         0x7f4c1440ff0a
00d66 48ba80eb710c4c7f0000           movabs     rdx, 0x7f4c0c71eb80
00d70 ff82c8000000                   inc        dword ptr [rdx + 0xc8]
00d76 48c7c2ffffffff                 mov        rdx, 0xffffffffffffffff
00d7d 48898c2480010000               mov        qword ptr [rsp + 0x180], rcx
00d85 e91c000000                     jmp        0x7f4c1440ff26
00d8a 48898c2480010000               mov        qword ptr [rsp + 0x180], rcx
00d92 ba01000000                     mov        edx, 1
00d97 498bcb                         mov        rcx, r11
00d9a 4c8bca                         mov        r9, rdx
00d9d 49d3e1                         shl        r9, cl
00da0 4c2bca                         sub        r9, rdx
00da3 498bd1                         mov        rdx, r9
00da6 448b8c2448010000               mov        r9d, dword ptr [rsp + 0x148]
00dae 4823d0                         and        rdx, rax
00db1 8bd2                           mov        edx, edx
00db3 498bcb                         mov        rcx, r11
00db6 48d3e8                         shr        rax, cl
00db9 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00dc3 488381f004000001               add        qword ptr [rcx + 0x4f0], 1
00dcb 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00dd5 448b5970                       mov        r11d, dword ptr [rcx + 0x70]
00dd9 4183c302                       add        r11d, 2
00ddd 44895970                       mov        dword ptr [rcx + 0x70], r11d
00de1 4181e3feff1f00                 and        r11d, 0x1ffffe
00de8 4585db                         test       r11d, r11d
00deb 0f84210c0000                   je         0x7f4c14410b92
00df1 4183f940                       cmp        r9d, 0x40
00df5 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00dff 41bba8000000                   mov        r11d, 0xa8
00e05 7c06                           jl         0x7f4c1440ff8d
00e07 41bbb8000000                   mov        r11d, 0xb8
00e0d 4e8b3419                       mov        r14, qword ptr [rcx + r11]
00e11 4d8d7601                       lea        r14, [r14 + 1]
00e15 4e893419                       mov        qword ptr [rcx + r11], r14
00e19 0f8c1c000000                   jl         0x7f4c1440ffbb
00e1f 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00e29 ff81c8000000                   inc        dword ptr [rcx + 0xc8]
00e2f 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e36 e915000000                     jmp        0x7f4c1440ffd0
00e3b 41bb01000000                   mov        r11d, 1
00e41 498bc9                         mov        rcx, r9
00e44 4d8bf3                         mov        r14, r11
00e47 49d3e6                         shl        r14, cl
00e4a 4d2bf3                         sub        r14, r11
00e4d 4d8bde                         mov        r11, r14
00e50 4889b42478010000               mov        qword ptr [rsp + 0x178], rsi
00e58 448bb42440010000               mov        r14d, dword ptr [rsp + 0x140]
00e60 4c23d8                         and        r11, rax
00e63 458bdb                         mov        r11d, r11d
00e66 498bc9                         mov        rcx, r9
00e69 48d3e8                         shr        rax, cl
00e6c 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00e76 4883810005000001               add        qword ptr [rcx + 0x500], 1
00e7e 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00e88 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00e8c 4183c102                       add        r9d, 2
00e90 44894970                       mov        dword ptr [rcx + 0x70], r9d
00e94 4181e1feff1f00                 and        r9d, 0x1ffffe
00e9b 4585c9                         test       r9d, r9d
00e9e 0f848f0b0000                   je         0x7f4c14410bb3
00ea4 4183fe40                       cmp        r14d, 0x40
00ea8 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00eb2 41b9a8000000                   mov        r9d, 0xa8
00eb8 7c06                           jl         0x7f4c14410040
00eba 41b9b8000000                   mov        r9d, 0xb8
00ec0 4a8b3409                       mov        rsi, qword ptr [rcx + r9]
00ec4 488d7601                       lea        rsi, [rsi + 1]
00ec8 4a893409                       mov        qword ptr [rcx + r9], rsi
00ecc 0f8c1c000000                   jl         0x7f4c1441006e
00ed2 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00edc ff81c8000000                   inc        dword ptr [rcx + 0xc8]
00ee2 48c7c6ffffffff                 mov        rsi, 0xffffffffffffffff
00ee9 e914000000                     jmp        0x7f4c14410082
00eee be01000000                     mov        esi, 1
00ef3 498bce                         mov        rcx, r14
00ef6 4c8bce                         mov        r9, rsi
00ef9 49d3e1                         shl        r9, cl
00efc 4c2bce                         sub        r9, rsi
00eff 498bf1                         mov        rsi, r9
00f02 89bc246c010000                 mov        dword ptr [rsp + 0x16c], edi
00f09 448b8c2444010000               mov        r9d, dword ptr [rsp + 0x144]
00f11 4823f0                         and        rsi, rax
00f14 8bf6                           mov        esi, esi
00f16 498bce                         mov        rcx, r14
00f19 48d3e8                         shr        rax, cl
00f1c 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00f26 4883811005000001               add        qword ptr [rcx + 0x510], 1
00f2e 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00f38 448b7170                       mov        r14d, dword ptr [rcx + 0x70]
00f3c 4183c602                       add        r14d, 2
00f40 44897170                       mov        dword ptr [rcx + 0x70], r14d
00f44 4181e6feff1f00                 and        r14d, 0x1ffffe
00f4b 4585f6                         test       r14d, r14d
00f4e 0f84000b0000                   je         0x7f4c14410bd4
00f54 4183f940                       cmp        r9d, 0x40
00f58 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00f62 41bea8000000                   mov        r14d, 0xa8
00f68 7c06                           jl         0x7f4c144100f0
00f6a 41beb8000000                   mov        r14d, 0xb8
00f70 4a8b3c31                       mov        rdi, qword ptr [rcx + r14]
00f74 488d7f01                       lea        rdi, [rdi + 1]
00f78 4a893c31                       mov        qword ptr [rcx + r14], rdi
00f7c 0f8c1c000000                   jl         0x7f4c1441011e
00f82 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00f8c ff81c8000000                   inc        dword ptr [rcx + 0xc8]
00f92 48c7c7ffffffff                 mov        rdi, 0xffffffffffffffff
00f99 e914000000                     jmp        0x7f4c14410132
00f9e bf01000000                     mov        edi, 1
00fa3 498bc9                         mov        rcx, r9
00fa6 4c8bcf                         mov        r9, rdi
00fa9 49d3e1                         shl        r9, cl
00fac 4c2bcf                         sub        r9, rdi
00faf 498bf9                         mov        rdi, r9
00fb2 488b8c2430010000               mov        rcx, qword ptr [rsp + 0x130]
00fba 4c8bb42470010000               mov        r14, qword ptr [rsp + 0x170]
00fc2 4c8b8c2408010000               mov        r9, qword ptr [rsp + 0x108]
00fca 4823f8                         and        rdi, rax
00fcd 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
00fd5 41baffffffff                   mov        r10d, 0xffffffff
00fdb 4923c2                         and        rax, r10
00fde 4803c7                         add        rax, rdi
00fe1 8bf9                           mov        edi, ecx
00fe3 03fe                           add        edi, esi
00fe5 89bc248c010000                 mov        dword ptr [rsp + 0x18c], edi
00fec 418bf6                         mov        esi, r14d
00fef 4103f3                         add        esi, r11d
00ff2 4c63df                         movsxd     r11, edi
00ff5 4d03d9                         add        r11, r9
00ff8 49b90050720c4c7f0000           movabs     r9, 0x7f4c0c725000
01002 41ff8120050000                 inc        dword ptr [r9 + 0x520]
01009 4c899c2498010000               mov        qword ptr [rsp + 0x198], r11
01011 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
01018 89942494010000                 mov        dword ptr [rsp + 0x194], edx
0101f 4489ac24a0010000               mov        dword ptr [rsp + 0x1a0], r13d
01027 899c2488010000                 mov        dword ptr [rsp + 0x188], ebx
0102e 48bf0050720c4c7f0000           movabs     rdi, 0x7f4c0c725000
01038 4883877005000001               add        qword ptr [rdi + 0x570], 1
01040 488bf0                         mov        rsi, rax
01043 0f1f4000                       nop        dword ptr [rax]
01047 e894065007                     call       0x7f4c1b910860
0104c 0f1f840044110005               nop        dword ptr [rax + rax + 0x5001144]
01054 48be0050720c4c7f0000           movabs     rsi, 0x7f4c0c725000
0105e 4883868005000001               add        qword ptr [rsi + 0x580], 1
01066 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
0106e 488b942410010000               mov        rdx, qword ptr [rsp + 0x110]
01076 8b8c2418010000                 mov        ecx, dword ptr [rsp + 0x118]
0107d 4c8bc0                         mov        r8, rax
01080 448b8c2490010000               mov        r9d, dword ptr [rsp + 0x190]
01088 8bbc248c010000                 mov        edi, dword ptr [rsp + 0x18c]
0108f e84c065007                     call       0x7f4c1b910860
01094 0f1f84008c110006               nop        dword ptr [rax + rax + 0x600118c]
0109c 448b84244c010000               mov        r8d, dword ptr [rsp + 0x14c]
010a4 4585c0                         test       r8d, r8d
010a7 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
010b1 baa0050000                     mov        edx, 0x5a0
010b6 7505                           jne        0x7f4c1441023d
010b8 ba90050000                     mov        edx, 0x590
010bd 4c8b0411                       mov        r8, qword ptr [rcx + rdx]
010c1 4d8d4001                       lea        r8, [r8 + 1]
010c5 4c890411                       mov        qword ptr [rcx + rdx], r8
010c9 0f851c000000                   jne        0x7f4c1441026b
010cf 448b9c2424010000               mov        r11d, dword ptr [rsp + 0x124]
010d7 8bbc241c010000                 mov        edi, dword ptr [rsp + 0x11c]
010de 448b842420010000               mov        r8d, dword ptr [rsp + 0x120]
010e6 e998010000                     jmp        0x7f4c14410403
010eb 448b8c2450010000               mov        r9d, dword ptr [rsp + 0x150]
010f3 488bbc2430010000               mov        rdi, qword ptr [rsp + 0x130]
010fb 4c8bb42470010000               mov        r14, qword ptr [rsp + 0x170]
01103 b930000000                     mov        ecx, 0x30
01108 49d3ee                         shr        r14, cl
0110b 458bf6                         mov        r14d, r14d
0110e 498bc9                         mov        rcx, r9
01111 038c242c010000                 add        ecx, dword ptr [rsp + 0x12c]
01118 8b942494010000                 mov        edx, dword ptr [rsp + 0x194]
0111f d3ea                           shr        edx, cl
01121 4403f2                         add        r14d, edx
01124 b930000000                     mov        ecx, 0x30
01129 48d3ef                         shr        rdi, cl
0112c 8bff                           mov        edi, edi
0112e 8b8c242c010000                 mov        ecx, dword ptr [rsp + 0x12c]
01135 8b942494010000                 mov        edx, dword ptr [rsp + 0x194]
0113c d3ea                           shr        edx, cl
0113e 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
01148 488381b005000001               add        qword ptr [rcx + 0x5b0], 1
01150 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
0115a 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
0115e 4183c002                       add        r8d, 2
01162 44894170                       mov        dword ptr [rcx + 0x70], r8d
01166 4181e0feff1f00                 and        r8d, 0x1ffffe
0116d 4585c0                         test       r8d, r8d
01170 0f84ff080000                   je         0x7f4c14410bf5
01176 4183f920                       cmp        r9d, 0x20
0117a 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
01184 41b8a8000000                   mov        r8d, 0xa8
0118a 7c06                           jl         0x7f4c14410312
0118c 41b8b8000000                   mov        r8d, 0xb8
01192 4a8b3401                       mov        rsi, qword ptr [rcx + r8]
01196 488d7601                       lea        rsi, [rsi + 1]
0119a 4a893401                       mov        qword ptr [rcx + r8], rsi
0119e 0f8c1b000000                   jl         0x7f4c1441033f
011a4 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
011ae ff81c8000000                   inc        dword ptr [rcx + 0xc8]
011b4 41b8ffffffff                   mov        r8d, 0xffffffff
011ba e90f000000                     jmp        0x7f4c1441034e
011bf 498bc9                         mov        rcx, r9
011c2 41b801000000                   mov        r8d, 1
011c8 41d3e0                         shl        r8d, cl
011cb 41ffc8                         dec        r8d
011ce 8b9c242c010000                 mov        ebx, dword ptr [rsp + 0x12c]
011d5 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
011dd 4c23c2                         and        r8, rdx
011e0 4403c7                         add        r8d, edi
011e3 b930000000                     mov        ecx, 0x30
011e8 48d3ee                         shr        rsi, cl
011eb 8bf6                           mov        esi, esi
011ed 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
011f7 488381c005000001               add        qword ptr [rcx + 0x5c0], 1
011ff 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
01209 8b5170                         mov        edx, dword ptr [rcx + 0x70]
0120c 83c202                         add        edx, 2
0120f 895170                         mov        dword ptr [rcx + 0x70], edx
01212 81e2feff1f00                   and        edx, 0x1ffffe
01218 85d2                           test       edx, edx
0121a 0f8476080000                   je         0x7f4c14410c16
01220 83fb20                         cmp        ebx, 0x20
01223 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
0122d baa8000000                     mov        edx, 0xa8
01232 7c05                           jl         0x7f4c144103b9
01234 bab8000000                     mov        edx, 0xb8
01239 488b3c11                       mov        rdi, qword ptr [rcx + rdx]
0123d 488d7f01                       lea        rdi, [rdi + 1]
01241 48893c11                       mov        qword ptr [rcx + rdx], rdi
01245 0f8c1a000000                   jl         0x7f4c144103e5
0124b 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
01255 ff81c8000000                   inc        dword ptr [rcx + 0xc8]
0125b baffffffff                     mov        edx, 0xffffffff
01260 e90c000000                     jmp        0x7f4c144103f1
01265 488bcb                         mov        rcx, rbx
01268 ba01000000                     mov        edx, 1
0126d d3e2                           shl        edx, cl
0126f ffca                           dec        edx
01271 8b8c2494010000                 mov        ecx, dword ptr [rsp + 0x194]
01278 4823d1                         and        rdx, rcx
0127b 03d6                           add        edx, esi
0127d 4d8bde                         mov        r11, r14
01280 488bfa                         mov        rdi, rdx
01283 488b942498010000               mov        rdx, qword ptr [rsp + 0x198]
0128b 8bb4246c010000                 mov        esi, dword ptr [rsp + 0x16c]
01292 448bac24a0010000               mov        r13d, dword ptr [rsp + 0x1a0]
0129a 488b9c2478010000               mov        rbx, qword ptr [rsp + 0x178]
012a2 488b842480010000               mov        rax, qword ptr [rsp + 0x180]
012aa 8b8c2428010000                 mov        ecx, dword ptr [rsp + 0x128]
012b1 49b90050720c4c7f0000           movabs     r9, 0x7f4c0c725000
012bb 458b7174                       mov        r14d, dword ptr [r9 + 0x74]
012bf 4183c602                       add        r14d, 2
012c3 45897174                       mov        dword ptr [r9 + 0x74], r14d
012c7 4181e6fe3f0000                 and        r14d, 0x3ffe
012ce 4585f6                         test       r14d, r14d
012d1 0f84e0070000                   je         0x7f4c14410c37
012d7 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
012db 418502                         test       dword ptr [r10], eax
012de 49b90050720c4c7f0000           movabs     r9, 0x7f4c0c725000
012e8 41ff81d0050000                 inc        dword ptr [r9 + 0x5d0]
012ef 4c8bca                         mov        r9, rdx
012f2 498bd5                         mov        rdx, r13
012f5 4c8beb                         mov        r13, rbx
012f8 488bd8                         mov        rbx, rax
012fb 8b842488010000                 mov        eax, dword ptr [rsp + 0x188]
01302 4c898c2408010000               mov        qword ptr [rsp + 0x108], r9
0130a 89b42404010000                 mov        dword ptr [rsp + 0x104], esi
01311 89942400010000                 mov        dword ptr [rsp + 0x100], edx
01318 4c89ac24f0000000               mov        qword ptr [rsp + 0xf0], r13
01320 48899c24f8000000               mov        qword ptr [rsp + 0xf8], rbx
01328 898424ec000000                 mov        dword ptr [rsp + 0xec], eax
0132f 8b9424e0000000                 mov        edx, dword ptr [rsp + 0xe0]
01336 4c8b8c24b0000000               mov        r9, qword ptr [rsp + 0xb0]
0133e 4c8bac24c0000000               mov        r13, qword ptr [rsp + 0xc0]
01346 488bb42498000000               mov        rsi, qword ptr [rsp + 0x98]
0134e 448bb42480000000               mov        r14d, dword ptr [rsp + 0x80]
01356 488bc1                         mov        rax, rcx
01359 8b8c24e4000000                 mov        ecx, dword ptr [rsp + 0xe4]
01360 e973f3ffff                     jmp        0x7f4c1440f858
01365 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
0136a 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0136f 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
01373 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
01378 48ba384131e300000000           movabs     rdx, 0xe3314138
01382 488bba88000000                 mov        rdi, qword ptr [rdx + 0x88]
01389 41ba01000000                   mov        r10d, 1
0138f 4903fa                         add        rdi, r10
01392 4889ba88000000                 mov        qword ptr [rdx + 0x88], rdi
01399 418bb948010000                 mov        edi, dword ptr [r9 + 0x148]
013a0 4889bc24a8010000               mov        qword ptr [rsp + 0x1a8], rdi
013a8 483b07                         cmp        rax, qword ptr [rdi]
013ab 488bd7                         mov        rdx, rdi
013ae 48bb0050720c4c7f0000           movabs     rbx, 0x7f4c0c725000
013b8 488b12                         mov        rdx, qword ptr [rdx]
013bb 48c1ea2a                       shr        rdx, 0x2a
013bf 48c1e209                       shl        rdx, 9
013c3 41ba0000000c                   mov        r10d, 0xc000000
013c9 4903d2                         add        rdx, r10
013cc 41ba8f000000                   mov        r10d, 0x8f
013d2 4a3b14d3                       cmp        rdx, qword ptr [rbx + r10*8]
013d6 743b                           je         0x7f4c14410593
013d8 4983c202                       add        r10, 2
013dc 4981fa93000000                 cmp        r10, 0x93
013e3 75ed                           jne        0x7f4c14410552
013e5 41ba8f000000                   mov        r10d, 0x8f
013eb 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
013f0 7415                           je         0x7f4c14410587
013f2 4983c202                       add        r10, 2
013f6 4981fa93000000                 cmp        r10, 0x93
013fd 75ec                           jne        0x7f4c1441056b
013ff 41ba8e000000                   mov        r10d, 0x8e
01405 eb10                           jmp        0x7f4c14410597
01407 50                             push       rax
01408 4833c0                         xor        rax, rax
0140b 4a0fb114d3                     cmpxchg    qword ptr [rbx + r10*8], rdx
01410 58                             pop        rax
01411 ebb9                           jmp        0x7f4c1441054c
01413 4983c201                       add        r10, 1
01417 4a8304d301                     add        qword ptr [rbx + r10*8], 1
0141c 488bd6                         mov        rdx, rsi
0141f 488bf7                         mov        rsi, rdi
01422 0f1f440000                     nop        dword ptr [rax + rax]
01427 e8b4f84f07                     call       0x7f4c1b90fe60
0142c 0f1f840024150008               nop        dword ptr [rax + rax + 0x8001524]
01434 488bbc24a8010000               mov        rdi, qword ptr [rsp + 0x1a8]
0143c 48b80050720c4c7f0000           movabs     rax, 0x7f4c0c725000
01446 488b3f                         mov        rdi, qword ptr [rdi]
01449 48c1ef2a                       shr        rdi, 0x2a
0144d 48c1e709                       shl        rdi, 9
01451 41ba0000000c                   mov        r10d, 0xc000000
01457 4903fa                         add        rdi, r10
0145a 41ba95000000                   mov        r10d, 0x95
01460 4a3b3cd0                       cmp        rdi, qword ptr [rax + r10*8]
01464 7441                           je         0x7f4c14410627
01466 4983c202                       add        r10, 2
0146a 4981fa99000000                 cmp        r10, 0x99
01471 75ed                           jne        0x7f4c144105e0
01473 41ba95000000                   mov        r10d, 0x95
01479 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
0147e 7415                           je         0x7f4c14410615
01480 4983c202                       add        r10, 2
01484 4981fa99000000                 cmp        r10, 0x99
0148b 75ec                           jne        0x7f4c144105f9
0148d 41ba94000000                   mov        r10d, 0x94
01493 eb16                           jmp        0x7f4c1441062b
01495 53                             push       rbx
01496 488bd8                         mov        rbx, rax
01499 4833c0                         xor        rax, rax
0149c 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
014a1 488bc3                         mov        rax, rbx
014a4 5b                             pop        rbx
014a5 ebb3                           jmp        0x7f4c144105da
014a7 4983c201                       add        r10, 1
014ab 4a8304d001                     add        qword ptr [rax + r10*8], 1
014b0 48b800fe710c4c7f0000           movabs     rax, 0x7f4c0c71fe00
014ba 8b7070                         mov        esi, dword ptr [rax + 0x70]
014bd 83c602                         add        esi, 2
014c0 897070                         mov        dword ptr [rax + 0x70], esi
014c3 81e6feff1f00                   and        esi, 0x1ffffe
014c9 85f6                           test       esi, esi
014cb 0f840c060000                   je         0x7f4c14410c5d
014d1 488bbc24a8010000               mov        rdi, qword ptr [rsp + 0x1a8]
014d9 8b4718                         mov        eax, dword ptr [rdi + 0x18]
014dc 83f820                         cmp        eax, 0x20
014df 48b800fe710c4c7f0000           movabs     rax, 0x7f4c0c71fe00
014e9 bea8000000                     mov        esi, 0xa8
014ee 7f05                           jg         0x7f4c14410675
014f0 beb8000000                     mov        esi, 0xb8
014f5 488b1c30                       mov        rbx, qword ptr [rax + rsi]
014f9 488d5b01                       lea        rbx, [rbx + 1]
014fd 48891c30                       mov        qword ptr [rax + rsi], rbx
01501 0f8faf000000                   jg         0x7f4c14410736
01507 e9d8000000                     jmp        0x7f4c14410764
0150c 4c8b8c2408010000               mov        r9, qword ptr [rsp + 0x108]
01514 8bb42404010000                 mov        esi, dword ptr [rsp + 0x104]
0151b 48b80050720c4c7f0000           movabs     rax, 0x7f4c0c725000
01525 ff80f8050000                   inc        dword ptr [rax + 0x5f8]
0152b 8b9c24cc000000                 mov        ebx, dword ptr [rsp + 0xcc]
01532 8b8424e0010000                 mov        eax, dword ptr [rsp + 0x1e0]
01539 4863db                         movsxd     rbx, ebx
0153c 4903d9                         add        rbx, r9
0153f 4863c0                         movsxd     rax, eax
01542 483bc3                         cmp        rax, rbx
01545 48b80050720c4c7f0000           movabs     rax, 0x7f4c0c725000
0154f bf18060000                     mov        edi, 0x618
01554 7c05                           jl         0x7f4c144106db
01556 bf08060000                     mov        edi, 0x608
0155b 488b1438                       mov        rdx, qword ptr [rax + rdi]
0155f 488d5201                       lea        rdx, [rdx + 1]
01563 48891438                       mov        qword ptr [rax + rdi], rdx
01567 0f8c74010000                   jl         0x7f4c14410861
0156d 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01574 3bf0                           cmp        esi, eax
01576 48b80050720c4c7f0000           movabs     rax, 0x7f4c0c725000
01580 be48060000                     mov        esi, 0x648
01585 7505                           jne        0x7f4c1441070c
01587 be38060000                     mov        esi, 0x638
0158c 488b3c30                       mov        rdi, qword ptr [rax + rsi]
01590 488d7f01                       lea        rdi, [rdi + 1]
01594 48893c30                       mov        qword ptr [rax + rsi], rdi
01598 0f85a1000000                   jne        0x7f4c144107bf
0159e 8bdb                           mov        ebx, ebx
015a0 488bc3                         mov        rax, rbx
015a3 4881c4d0010000                 add        rsp, 0x1d0
015aa 5d                             pop        rbp
015ab 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
015af 0f8749050000                   ja         0x7f4c14410c7e
015b5 c3                             ret        
015b6 488bf7                         mov        rsi, rdi
015b9 48bb00fe710c4c7f0000           movabs     rbx, 0x7f4c0c71fe00
015c3 488383c800000001               add        qword ptr [rbx + 0xc8], 1
015cb 488bf7                         mov        rsi, rdi
015ce 90                             nop        
015cf e80cf74f07                     call       0x7f4c1b90fe60
015d4 0f1f8400cc160009               nop        dword ptr [rax + rax + 0x90016cc]
015dc 488bbc24a8010000               mov        rdi, qword ptr [rsp + 0x1a8]
015e4 8b8424e0010000                 mov        eax, dword ptr [rsp + 0x1e0]
015eb 8b9c2480000000                 mov        ebx, dword ptr [rsp + 0x80]
015f2 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
015f7 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
015fc 48be0050720c4c7f0000           movabs     rsi, 0x7f4c0c725000
01606 488386d004000001               add        qword ptr [rsi + 0x4d0], 1
0160e 488bf7                         mov        rsi, rdi
01611 498bd0                         mov        rdx, r8
01614 498bc9                         mov        rcx, r9
01617 4c8bc3                         mov        r8, rbx
0161a 4c8bc8                         mov        r9, rax
0161d 6690                           nop        
0161f e8bc005007                     call       0x7f4c1b910860
01624 0f1f84001c17000a               nop        dword ptr [rax + rax + 0xa00171c]
0162c 4881c4d0010000                 add        rsp, 0x1d0
01633 5d                             pop        rbp
01634 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
01638 0f87d6040000                   ja         0x7f4c14410c94
0163e c3                             ret        
0163f 90                             nop        
01640 e9f4040000                     jmp        0x7f4c14410cb9
01645 90                             nop        
01646 90                             nop        
01647 90                             nop        
01648 90                             nop        
01649 90                             nop        
0164a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
01651 0f85f1040000                   jne        0x7f4c14410cc8
01657 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
0165e 488d7828                       lea        rdi, [rax + 0x28]
01662 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
01669 0f87d9040000                   ja         0x7f4c14410cc8
0166f 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
01676 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0167d 488908                         mov        qword ptr [rax], rcx
01680 4833c9                         xor        rcx, rcx
01683 48894808                       mov        qword ptr [rax + 8], rcx
01687 48894810                       mov        qword ptr [rax + 0x10], rcx
0168b 48894818                       mov        qword ptr [rax + 0x18], rcx
0168f 48894820                       mov        qword ptr [rax + 0x20], rcx
01693 488bd0                         mov        rdx, rax
01696 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
016a0 4883815806000001               add        qword ptr [rcx + 0x658], 1
016a8 ba02000000                     mov        edx, 2
016ad 48b9685e32e300000000           movabs     rcx, 0xe3325e68
016b7 488bf0                         mov        rsi, rax
016ba 48898424b0010000               mov        qword ptr [rsp + 0x1b0], rax
016c2 0f1f440000                     nop        dword ptr [rax + rax]
016c7 e814f64f07                     call       0x7f4c1b90fe60
016cc 0f1f8400c417000b               nop        dword ptr [rax + rax + 0xb0017c4]
016d4 488b8424b0010000               mov        rax, qword ptr [rsp + 0x1b0]
016dc e908050000                     jmp        0x7f4c14410d69
016e1 48ba0050720c4c7f0000           movabs     rdx, 0x7f4c0c725000
016eb 4883822806000001               add        qword ptr [rdx + 0x628], 1
016f3 48ba60f0710c4c7f0000           movabs     rdx, 0x7f4c0c71f060
016fd 8b7270                         mov        esi, dword ptr [rdx + 0x70]
01700 83c602                         add        esi, 2
01703 897270                         mov        dword ptr [rdx + 0x70], esi
01706 81e6feff1f00                   and        esi, 0x1ffffe
0170c 85f6                           test       esi, esi
0170e 0f8441040000                   je         0x7f4c14410cd5
01714 0f1f4000                       nop        dword ptr [rax]
01718 e968040000                     jmp        0x7f4c14410d05
0171d 90                             nop        
0171e 90                             nop        
0171f 90                             nop        
01720 90                             nop        
01721 90                             nop        
01722 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
01729 0f8565040000                   jne        0x7f4c14410d14
0172f 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
01736 488d7828                       lea        rdi, [rax + 0x28]
0173a 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
01741 0f874d040000                   ja         0x7f4c14410d14
01747 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
0174e 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
01755 488908                         mov        qword ptr [rax], rcx
01758 4833c9                         xor        rcx, rcx
0175b 48894808                       mov        qword ptr [rax + 8], rcx
0175f 48894810                       mov        qword ptr [rax + 0x10], rcx
01763 48894818                       mov        qword ptr [rax + 0x18], rcx
01767 48894820                       mov        qword ptr [rax + 0x20], rcx
0176b 488bd0                         mov        rdx, rax
0176e 48b960f0710c4c7f0000           movabs     rcx, 0x7f4c0c71f060
01778 488381a800000001               add        qword ptr [rcx + 0xa8], 1
01780 ba02000000                     mov        edx, 2
01785 48b9385d32e300000000           movabs     rcx, 0xe3325d38
0178f 488bf0                         mov        rsi, rax
01792 48898424b8010000               mov        qword ptr [rsp + 0x1b8], rax
0179a 0f1f440000                     nop        dword ptr [rax + rax]
0179f e83cf54f07                     call       0x7f4c1b90fe60
017a4 0f1f84009c18000c               nop        dword ptr [rax + rax + 0xc00189c]
017ac 488b8424b8010000               mov        rax, qword ptr [rsp + 0x1b8]
017b4 e930040000                     jmp        0x7f4c14410d69
017b9 0f1f8000000000                 nop        dword ptr [rax]
017c0 e9eb030000                     jmp        0x7f4c14410d30
017c5 90                             nop        
017c6 90                             nop        
017c7 90                             nop        
017c8 90                             nop        
017c9 90                             nop        
017ca 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
017d1 0f85e8030000                   jne        0x7f4c14410d3f
017d7 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
017de 488d7828                       lea        rdi, [rax + 0x28]
017e2 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
017e9 0f87d0030000                   ja         0x7f4c14410d3f
017ef 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
017f6 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
017fd 488908                         mov        qword ptr [rax], rcx
01800 4833c9                         xor        rcx, rcx
01803 48894808                       mov        qword ptr [rax + 8], rcx
01807 48894810                       mov        qword ptr [rax + 0x10], rcx
0180b 48894818                       mov        qword ptr [rax + 0x18], rcx
0180f 48894820                       mov        qword ptr [rax + 0x20], rcx
01813 488bd0                         mov        rdx, rax
01816 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
01820 488381c800000001               add        qword ptr [rcx + 0xc8], 1
01828 ba02000000                     mov        edx, 2
0182d 48b9185e32e300000000           movabs     rcx, 0xe3325e18
01837 488bf0                         mov        rsi, rax
0183a 48898424c0010000               mov        qword ptr [rsp + 0x1c0], rax
01842 0f1f440000                     nop        dword ptr [rax + rax]
01847 e894f44f07                     call       0x7f4c1b90fe60
0184c 0f1f84004419000d               nop        dword ptr [rax + rax + 0xd001944]
01854 488b8424c0010000               mov        rax, qword ptr [rsp + 0x1c0]
0185c e988030000                     jmp        0x7f4c14410d69
01861 49ba403f710c4c7f0000           movabs     r10, 0x7f4c0c713f40
0186b 4c89542408                     mov        qword ptr [rsp + 8], r10
01870 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01878 e863635c07                     call       0x7f4c1b9d6d60
0187d e9d7e7ffff                     jmp        0x7f4c1440f1d9
01882 e8d9035c07                     call       0x7f4c1b9d0de0
01887 e8d4035c07                     call       0x7f4c1b9d0de0
0188c 48891c24                       mov        qword ptr [rsp], rbx
01890 4889742408                     mov        qword ptr [rsp + 8], rsi
01895 e8c6fa5b07                     call       0x7f4c1b9d04e0
0189a 49ba4813710c4c7f0000           movabs     r10, 0x7f4c0c711348
018a4 4c89542408                     mov        qword ptr [rsp + 8], r10
018a9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
018b1 e82a635c07                     call       0x7f4c1b9d6d60
018b6 e922e8ffff                     jmp        0x7f4c1440f25d
018bb e8a0035c07                     call       0x7f4c1b9d0de0
018c0 e89b035c07                     call       0x7f4c1b9d0de0
018c5 e896035c07                     call       0x7f4c1b9d0de0
018ca e891035c07                     call       0x7f4c1b9d0de0
018cf 49ba5015710c4c7f0000           movabs     r10, 0x7f4c0c711550
018d9 4c89542408                     mov        qword ptr [rsp + 8], r10
018de 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
018e6 e8f5625c07                     call       0x7f4c1b9d6d60
018eb e9b2e9ffff                     jmp        0x7f4c1440f422
018f0 49ba5015710c4c7f0000           movabs     r10, 0x7f4c0c711550
018fa 4c89542408                     mov        qword ptr [rsp + 8], r10
018ff 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01907 e8d4625c07                     call       0x7f4c1b9d6d60
0190c e950eaffff                     jmp        0x7f4c1440f4e1
01911 49ba9814710c4c7f0000           movabs     r10, 0x7f4c0c711498
0191b 4c89542408                     mov        qword ptr [rsp + 8], r10
01920 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01928 e8b3625c07                     call       0x7f4c1b9d6d60
0192d e9b4ebffff                     jmp        0x7f4c1440f666
01932 49ba9814710c4c7f0000           movabs     r10, 0x7f4c0c711498
0193c 4c89542408                     mov        qword ptr [rsp + 8], r10
01941 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01949 e892625c07                     call       0x7f4c1b9d6d60
0194e e94cecffff                     jmp        0x7f4c1440f71f
01953 e808035c07                     call       0x7f4c1b9d0de0
01958 e803035c07                     call       0x7f4c1b9d0de0
0195d e8fe025c07                     call       0x7f4c1b9d0de0
01962 e8f9025c07                     call       0x7f4c1b9d0de0
01967 e8f4025c07                     call       0x7f4c1b9d0de0
0196c e8ef025c07                     call       0x7f4c1b9d0de0
01971 48890424                       mov        qword ptr [rsp], rax
01975 48895c2408                     mov        qword ptr [rsp + 8], rbx
0197a e8e1f95b07                     call       0x7f4c1b9d04e0
0197f e8dc025c07                     call       0x7f4c1b9d0de0
01984 e8d7025c07                     call       0x7f4c1b9d0de0
01989 48890424                       mov        qword ptr [rsp], rax
0198d 48895c2408                     mov        qword ptr [rsp + 8], rbx
01992 e8c9f95b07                     call       0x7f4c1b9d04e0
01997 e8c4025c07                     call       0x7f4c1b9d0de0
0199c e8bf025c07                     call       0x7f4c1b9d0de0
019a1 48890424                       mov        qword ptr [rsp], rax
019a5 48895c2408                     mov        qword ptr [rsp + 8], rbx
019aa e8b1f95b07                     call       0x7f4c1b9d04e0
019af 49ba5015710c4c7f0000           movabs     r10, 0x7f4c0c711550
019b9 4c89542408                     mov        qword ptr [rsp + 8], r10
019be 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
019c6 e815625c07                     call       0x7f4c1b9d6d60
019cb e9ccf0ffff                     jmp        0x7f4c1440fc1c
019d0 49ba5015710c4c7f0000           movabs     r10, 0x7f4c0c711550
019da 4c89542408                     mov        qword ptr [rsp + 8], r10
019df 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
019e7 e8f4615c07                     call       0x7f4c1b9d6d60
019ec e95ff1ffff                     jmp        0x7f4c1440fcd0
019f1 49ba5015710c4c7f0000           movabs     r10, 0x7f4c0c711550
019fb 4c89542408                     mov        qword ptr [rsp + 8], r10
01a00 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01a08 e8d3615c07                     call       0x7f4c1b9d6d60
01a0d e926f3ffff                     jmp        0x7f4c1440feb8
01a12 49ba5015710c4c7f0000           movabs     r10, 0x7f4c0c711550
01a1c 4c89542408                     mov        qword ptr [rsp + 8], r10
01a21 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01a29 e8b2615c07                     call       0x7f4c1b9d6d60
01a2e e9bef3ffff                     jmp        0x7f4c1440ff71
01a33 49ba5015710c4c7f0000           movabs     r10, 0x7f4c0c711550
01a3d 4c89542408                     mov        qword ptr [rsp + 8], r10
01a42 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01a4a e891615c07                     call       0x7f4c1b9d6d60
01a4f e950f4ffff                     jmp        0x7f4c14410024
01a54 49ba5015710c4c7f0000           movabs     r10, 0x7f4c0c711550
01a5e 4c89542408                     mov        qword ptr [rsp + 8], r10
01a63 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01a6b e870615c07                     call       0x7f4c1b9d6d60
01a70 e9dff4ffff                     jmp        0x7f4c144100d4
01a75 49ba9814710c4c7f0000           movabs     r10, 0x7f4c0c711498
01a7f 4c89542408                     mov        qword ptr [rsp + 8], r10
01a84 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01a8c e84f615c07                     call       0x7f4c1b9d6d60
01a91 e9e0f6ffff                     jmp        0x7f4c144102f6
01a96 49ba9814710c4c7f0000           movabs     r10, 0x7f4c0c711498
01aa0 4c89542408                     mov        qword ptr [rsp + 8], r10
01aa5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01aad e82e615c07                     call       0x7f4c1b9d6d60
01ab2 e969f7ffff                     jmp        0x7f4c144103a0
01ab7 49ba403f710c4c7f0000           movabs     r10, 0x7f4c0c713f40
01ac1 4c89542408                     mov        qword ptr [rsp + 8], r10
01ac6 48c70424a9030000               mov        qword ptr [rsp], 0x3a9
01ace e80d615c07                     call       0x7f4c1b9d6d60
01ad3 e9fff7ffff                     jmp        0x7f4c14410457
01ad8 e883015c07                     call       0x7f4c1b9d0de0
01add 49ba888a700c4c7f0000           movabs     r10, 0x7f4c0c708a88
01ae7 4c89542408                     mov        qword ptr [rsp + 8], r10
01aec 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01af4 e8e7605c07                     call       0x7f4c1b9d6d60
01af9 e9d3f9ffff                     jmp        0x7f4c14410651
01afe 49ba2b0741144c7f0000           movabs     r10, 0x7f4c1441072b
01b08 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01b0f e94c225007                     jmp        0x7f4c1b912ee0
01b14 49bab40741144c7f0000           movabs     r10, 0x7f4c144107b4
01b1e 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01b25 e936225007                     jmp        0x7f4c1b912ee0
01b2a 48ba0000000000000000           movabs     rdx, 0
01b34 b8000f050a                     mov        eax, 0xa050f00
01b39 e8a24b5c07                     call       0x7f4c1b9d5860
01b3e e9fdfaffff                     jmp        0x7f4c144107c0
01b43 e818015c07                     call       0x7f4c1b9d0de0
01b48 488bd2                         mov        rdx, rdx
01b4b e8900e5c07                     call       0x7f4c1b9d1b60
01b50 e93efbffff                     jmp        0x7f4c14410813
01b55 49bac055710c4c7f0000           movabs     r10, 0x7f4c0c7155c0
01b5f 4c89542408                     mov        qword ptr [rsp + 8], r10
01b64 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01b6c e86f605c07                     call       0x7f4c1b9d6d60
01b71 e99efbffff                     jmp        0x7f4c14410894
01b76 48ba0000000000000000           movabs     rdx, 0
01b80 b8000f050a                     mov        eax, 0xa050f00
01b85 e8564b5c07                     call       0x7f4c1b9d5860
01b8a e989fbffff                     jmp        0x7f4c14410898
01b8f e8cc005c07                     call       0x7f4c1b9d0de0
01b94 488bd2                         mov        rdx, rdx
01b97 e8440e5c07                     call       0x7f4c1b9d1b60
01b9c e9cafbffff                     jmp        0x7f4c144108eb
01ba1 48ba0000000000000000           movabs     rdx, 0
01bab b8000f050a                     mov        eax, 0xa050f00
01bb0 e82b4b5c07                     call       0x7f4c1b9d5860
01bb5 e906fcffff                     jmp        0x7f4c14410940
01bba e8a1005c07                     call       0x7f4c1b9d0de0
01bbf 488bd2                         mov        rdx, rdx
01bc2 e8190e5c07                     call       0x7f4c1b9d1b60
01bc7 e947fcffff                     jmp        0x7f4c14410993
01bcc 498b8778050000                 mov        rax, qword ptr [r15 + 0x578]
01bd3 49c7877805000000000000         mov        qword ptr [r15 + 0x578], 0
01bde 49c7878005000000000000         mov        qword ptr [r15 + 0x580], 0
01be9 4881c4d0010000                 add        rsp, 0x1d0
01bf0 5d                             pop        rbp
01bf1 e96af15b07                     jmp        0x7f4c1b9cfee0
01bf6 f4                             hlt        
01bf7 f4                             hlt        
