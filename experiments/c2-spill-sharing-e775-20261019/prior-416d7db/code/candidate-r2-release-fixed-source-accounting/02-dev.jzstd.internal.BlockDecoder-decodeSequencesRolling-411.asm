00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ecc0020000                 sub        rsp, 0x2c0
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 7405                           je         0x7f4c143ffa9f
0001a e801005007                     call       0x7f4c1b8ffaa0
0001f 4889742468                     mov        qword ptr [rsp + 0x68], rsi
00024 89542460                       mov        dword ptr [rsp + 0x60], edx
00028 894c2464                       mov        dword ptr [rsp + 0x64], ecx
0002c 4c89442470                     mov        qword ptr [rsp + 0x70], r8
00031 4c894c2478                     mov        qword ptr [rsp + 0x78], r9
00036 89bc2480000000                 mov        dword ptr [rsp + 0x80], edi
0003d 48bb0050720c4c7f0000           movabs     rbx, 0x7f4c0c725000
00047 8b4370                         mov        eax, dword ptr [rbx + 0x70]
0004a 83c002                         add        eax, 2
0004d 894370                         mov        dword ptr [rbx + 0x70], eax
00050 25fe070000                     and        eax, 0x7fe
00055 85c0                           test       eax, eax
00057 0f84f91c0000                   je         0x7f4c144017d6
0005d 488bda                         mov        rbx, rdx
00060 ffcb                           dec        ebx
00062 3b5e08                         cmp        ebx, dword ptr [rsi + 8]
00065 0f83161d0000                   jae        0x7f4c14401801
0006b 4863db                         movsxd     rbx, ebx
0006e 0fbe5c1e0c                     movsx      ebx, byte ptr [rsi + rbx + 0xc]
00073 81e3ff000000                   and        ebx, 0xff
00079 85db                           test       ebx, ebx
0007b 48b80050720c4c7f0000           movabs     rax, 0x7f4c0c725000
00085 41bbb8000000                   mov        r11d, 0xb8
0008b 7406                           je         0x7f4c143ffb13
0008d 41bba8000000                   mov        r11d, 0xa8
00093 4e8b2c18                       mov        r13, qword ptr [rax + r11]
00097 4d8d6d01                       lea        r13, [r13 + 1]
0009b 4e892c18                       mov        qword ptr [rax + r11], r13
0009f 0f8434180000                   je         0x7f4c14401359
000a5 48b80050720c4c7f0000           movabs     rax, 0x7f4c0c725000
000af 488380d800000001               add        qword ptr [rax + 0xd8], 1
000b7 48b8c8e8710c4c7f0000           movabs     rax, 0x7f4c0c71e8c8
000c1 448b5870                       mov        r11d, dword ptr [rax + 0x70]
000c5 4183c302                       add        r11d, 2
000c9 44895870                       mov        dword ptr [rax + 0x70], r11d
000cd 4181e3feff1f00                 and        r11d, 0x1ffffe
000d4 4585db                         test       r11d, r11d
000d7 0f84b21c0000                   je         0x7f4c1440180f
000dd 48b8c8e8710c4c7f0000           movabs     rax, 0x7f4c0c71e8c8
000e7 488380a800000001               add        qword ptr [rax + 0xa8], 1
000ef 488bf3                         mov        rsi, rbx
000f2 0f1f440000                     nop        dword ptr [rax + rax]
000f7 e8e40c5107                     call       0x7f4c1b910860
000fc 0f1f8400f4010000               nop        dword ptr [rax + rax + 0x1f4]
00104 be1f000000                     mov        esi, 0x1f
00109 2bf0                           sub        esi, eax
0010b ba08000000                     mov        edx, 8
00110 2bd6                           sub        edx, esi
00112 8b742460                       mov        esi, dword ptr [rsp + 0x60]
00116 2b742464                       sub        esi, dword ptr [rsp + 0x64]
0011a c1e603                         shl        esi, 3
0011d 2bf2                           sub        esi, edx
0011f 89b42488000000                 mov        dword ptr [rsp + 0x88], esi
00126 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00130 488381e800000001               add        qword ptr [rcx + 0xe8], 1
00138 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
0013d 89942484000000                 mov        dword ptr [rsp + 0x84], edx
00144 8b542464                       mov        edx, dword ptr [rsp + 0x64]
00148 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
0014c 666690                         nop        
0014f e88c0c5107                     call       0x7f4c1b910860
00154 0f1f84004c020001               nop        dword ptr [rax + rax + 0x100024c]
0015c 48be0050720c4c7f0000           movabs     rsi, 0x7f4c0c725000
00166 488386f800000001               add        qword ptr [rsi + 0xf8], 1
0016e 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00172 83e908                         sub        ecx, 8
00175 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
0017a 8b542464                       mov        edx, dword ptr [rsp + 0x64]
0017e 4889842490000000               mov        qword ptr [rsp + 0x90], rax
00186 90                             nop        
00187 e8540c5107                     call       0x7f4c1b910860
0018c 0f1f840084020002               nop        dword ptr [rax + rax + 0x2000284]
00194 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00199 418b781c                       mov        edi, dword ptr [r8 + 0x1c]
0019d 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
001a5 418b5820                       mov        ebx, dword ptr [r8 + 0x20]
001a9 458b4824                       mov        r9d, dword ptr [r8 + 0x24]
001ad 8b4f08                         mov        ecx, dword ptr [rdi + 8]
001b0 8b7308                         mov        esi, dword ptr [rbx + 8]
001b3 418b5108                       mov        edx, dword ptr [r9 + 8]
001b7 03ce                           add        ecx, esi
001b9 03ca                           add        ecx, edx
001bb 898c24a0000000                 mov        dword ptr [rsp + 0xa0], ecx
001c2 be40000000                     mov        esi, 0x40
001c7 2bb42484000000                 sub        esi, dword ptr [rsp + 0x84]
001ce 85c9                           test       ecx, ecx
001d0 48ba0050720c4c7f0000           movabs     rdx, 0x7f4c0c725000
001da 41bb08010000                   mov        r11d, 0x108
001e0 7506                           jne        0x7f4c143ffc68
001e2 41bb18010000                   mov        r11d, 0x118
001e8 4e8b2c1a                       mov        r13, qword ptr [rdx + r11]
001ec 4d8d6d01                       lea        r13, [r13 + 1]
001f0 4e892c1a                       mov        qword ptr [rdx + r11], r13
001f4 0f8526000000                   jne        0x7f4c143ffca0
001fa 48be0050720c4c7f0000           movabs     rsi, 0x7f4c0c725000
00204 ff8628010000                   inc        dword ptr [rsi + 0x128]
0020a 41bb00000000                   mov        r11d, 0
00210 4c8be9                         mov        r13, rcx
00213 4c8bb42490000000               mov        r14, qword ptr [rsp + 0x90]
0021b e9b0010000                     jmp        0x7f4c143ffe50
00220 3bce                           cmp        ecx, esi
00222 48ba0050720c4c7f0000           movabs     rdx, 0x7f4c0c725000
0022c 41bb40010000                   mov        r11d, 0x140
00232 7f06                           jg         0x7f4c143ffcba
00234 41bb50010000                   mov        r11d, 0x150
0023a 4e8b2c1a                       mov        r13, qword ptr [rdx + r11]
0023e 4d8d6d01                       lea        r13, [r13 + 1]
00242 4e892c1a                       mov        qword ptr [rdx + r11], r13
00246 0f8fc5000000                   jg         0x7f4c143ffd91
0024c 2bf1                           sub        esi, ecx
0024e 4c8be9                         mov        r13, rcx
00251 488bce                         mov        rcx, rsi
00254 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
0025c 48d3ee                         shr        rsi, cl
0025f 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00269 4883816001000001               add        qword ptr [rcx + 0x160], 1
00271 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
0027b 8b5170                         mov        edx, dword ptr [rcx + 0x70]
0027e 83c202                         add        edx, 2
00281 895170                         mov        dword ptr [rcx + 0x70], edx
00284 81e2feff1f00                   and        edx, 0x1ffffe
0028a 85d2                           test       edx, edx
0028c 0f84321b0000                   je         0x7f4c14401844
00292 4183fd40                       cmp        r13d, 0x40
00296 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
002a0 baa8000000                     mov        edx, 0xa8
002a5 7c05                           jl         0x7f4c143ffd2c
002a7 bab8000000                     mov        edx, 0xb8
002ac 4c8b1c11                       mov        r11, qword ptr [rcx + rdx]
002b0 4d8d5b01                       lea        r11, [r11 + 1]
002b4 4c891c11                       mov        qword ptr [rcx + rdx], r11
002b8 0f8c1c000000                   jl         0x7f4c143ffd5a
002be 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
002c8 ff81c8000000                   inc        dword ptr [rcx + 0xc8]
002ce 48c7c2ffffffff                 mov        rdx, 0xffffffffffffffff
002d5 e914000000                     jmp        0x7f4c143ffd6e
002da ba01000000                     mov        edx, 1
002df 498bcd                         mov        rcx, r13
002e2 4c8bda                         mov        r11, rdx
002e5 49d3e3                         shl        r11, cl
002e8 4c2bda                         sub        r11, rdx
002eb 498bd3                         mov        rdx, r11
002ee 4823d6                         and        rdx, rsi
002f1 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
002fb ff8170010000                   inc        dword ptr [rcx + 0x170]
00301 4c8bda                         mov        r11, rdx
00304 4c8bb42490000000               mov        r14, qword ptr [rsp + 0x90]
0030c e9bf000000                     jmp        0x7f4c143ffe50
00311 4c8be9                         mov        r13, rcx
00314 498bd5                         mov        rdx, r13
00317 2bd6                           sub        edx, esi
00319 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00323 4883818801000001               add        qword ptr [rcx + 0x188], 1
0032b 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00335 448b5970                       mov        r11d, dword ptr [rcx + 0x70]
00339 4183c302                       add        r11d, 2
0033d 44895970                       mov        dword ptr [rcx + 0x70], r11d
00341 4181e3feff1f00                 and        r11d, 0x1ffffe
00348 4585db                         test       r11d, r11d
0034b 0f84941a0000                   je         0x7f4c14401865
00351 83fe40                         cmp        esi, 0x40
00354 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
0035e 41bba8000000                   mov        r11d, 0xa8
00364 7c06                           jl         0x7f4c143ffdec
00366 41bbb8000000                   mov        r11d, 0xb8
0036c 4e8b3419                       mov        r14, qword ptr [rcx + r11]
00370 4d8d7601                       lea        r14, [r14 + 1]
00374 4e893419                       mov        qword ptr [rcx + r11], r14
00378 0f8c1c000000                   jl         0x7f4c143ffe1a
0037e 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00388 ff81c8000000                   inc        dword ptr [rcx + 0xc8]
0038e 48c7c6ffffffff                 mov        rsi, 0xffffffffffffffff
00395 e912000000                     jmp        0x7f4c143ffe2c
0039a 41bb01000000                   mov        r11d, 1
003a0 488bce                         mov        rcx, rsi
003a3 498bf3                         mov        rsi, r11
003a6 48d3e6                         shl        rsi, cl
003a9 492bf3                         sub        rsi, r11
003ac 4c8bb42490000000               mov        r14, qword ptr [rsp + 0x90]
003b4 4923f6                         and        rsi, r14
003b7 488bca                         mov        rcx, rdx
003ba 48d3e6                         shl        rsi, cl
003bd b940000000                     mov        ecx, 0x40
003c2 2bca                           sub        ecx, edx
003c4 488bd0                         mov        rdx, rax
003c7 48d3ea                         shr        rdx, cl
003ca 480bf2                         or         rsi, rdx
003cd 4c8bde                         mov        r11, rsi
003d0 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
003d7 4103d5                         add        edx, r13d
003da 83fa40                         cmp        edx, 0x40
003dd 48be0050720c4c7f0000           movabs     rsi, 0x7f4c0c725000
003e7 b9a8010000                     mov        ecx, 0x1a8
003ec 7d05                           jge        0x7f4c143ffe73
003ee b998010000                     mov        ecx, 0x198
003f3 488b3c0e                       mov        rdi, qword ptr [rsi + rcx]
003f7 488d7f01                       lea        rdi, [rdi + 1]
003fb 48893c0e                       mov        qword ptr [rsi + rcx], rdi
003ff 0f8d1c000000                   jge        0x7f4c143ffea1
00405 498bf6                         mov        rsi, r14
00408 8b7c2460                       mov        edi, dword ptr [rsp + 0x60]
0040c 4c899c24b8000000               mov        qword ptr [rsp + 0xb8], r11
00414 48899c24c0000000               mov        qword ptr [rsp + 0xc0], rbx
0041c e991000000                     jmp        0x7f4c143fff32
00421 4c899c24b8000000               mov        qword ptr [rsp + 0xb8], r11
00429 4c898c24b0000000               mov        qword ptr [rsp + 0xb0], r9
00431 48899c24c0000000               mov        qword ptr [rsp + 0xc0], rbx
00439 48898424a8000000               mov        qword ptr [rsp + 0xa8], rax
00441 83ea40                         sub        edx, 0x40
00444 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
00449 4183ed08                       sub        r13d, 8
0044d 48be0050720c4c7f0000           movabs     rsi, 0x7f4c0c725000
00457 488386b801000001               add        qword ptr [rsi + 0x1b8], 1
0045f 4d8bf5                         mov        r14, r13
00462 4183ee08                       sub        r14d, 8
00466 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
0046b 8994248c000000                 mov        dword ptr [rsp + 0x8c], edx
00472 8b542464                       mov        edx, dword ptr [rsp + 0x64]
00476 498bce                         mov        rcx, r14
00479 4489ac24a4000000               mov        dword ptr [rsp + 0xa4], r13d
00481 660f1f440000                   nop        word ptr [rax + rax]
00487 e854095107                     call       0x7f4c1b910860
0048c 0f1f840084050003               nop        dword ptr [rax + rax + 0x3000584]
00494 8b94248c000000                 mov        edx, dword ptr [rsp + 0x8c]
0049b 488bb424a8000000               mov        rsi, qword ptr [rsp + 0xa8]
004a3 8bbc24a4000000                 mov        edi, dword ptr [rsp + 0xa4]
004aa 4c8b8c24b0000000               mov        r9, qword ptr [rsp + 0xb0]
004b2 418b5908                       mov        ebx, dword ptr [r9 + 8]
004b6 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
004c0 488381c801000001               add        qword ptr [rcx + 0x1c8], 1
004c8 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
004d2 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
004d6 4183c002                       add        r8d, 2
004da 44894170                       mov        dword ptr [rcx + 0x70], r8d
004de 4181e0feff1f00                 and        r8d, 0x1ffffe
004e5 4585c0                         test       r8d, r8d
004e8 0f8418190000                   je         0x7f4c14401886
004ee 83fb20                         cmp        ebx, 0x20
004f1 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
004fb 41b8a8000000                   mov        r8d, 0xa8
00501 7c06                           jl         0x7f4c143fff89
00503 41b8b8000000                   mov        r8d, 0xb8
00509 4e8b1c01                       mov        r11, qword ptr [rcx + r8]
0050d 4d8d5b01                       lea        r11, [r11 + 1]
00511 4e891c01                       mov        qword ptr [rcx + r8], r11
00515 0f8c1b000000                   jl         0x7f4c143fffb6
0051b 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
00525 ff81c8000000                   inc        dword ptr [rcx + 0xc8]
0052b 41b8ffffffff                   mov        r8d, 0xffffffff
00531 e90f000000                     jmp        0x7f4c143fffc5
00536 488bcb                         mov        rcx, rbx
00539 41b801000000                   mov        r8d, 1
0053f 41d3e0                         shl        r8d, cl
00542 41ffc8                         dec        r8d
00545 89bc24c8000000                 mov        dword ptr [rsp + 0xc8], edi
0054c 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
00554 4c8bac24c0000000               mov        r13, qword ptr [rsp + 0xc0]
0055c 4d63c0                         movsxd     r8, r8d
0055f 4d23c3                         and        r8, r11
00562 458bc0                         mov        r8d, r8d
00565 488bcb                         mov        rcx, rbx
00568 49d3eb                         shr        r11, cl
0056b 418b5d08                       mov        ebx, dword ptr [r13 + 8]
0056f 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00579 488381d801000001               add        qword ptr [rcx + 0x1d8], 1
00581 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
0058b 448b7170                       mov        r14d, dword ptr [rcx + 0x70]
0058f 4183c602                       add        r14d, 2
00593 44897170                       mov        dword ptr [rcx + 0x70], r14d
00597 4181e6feff1f00                 and        r14d, 0x1ffffe
0059e 4585f6                         test       r14d, r14d
005a1 0f8480180000                   je         0x7f4c144018a7
005a7 83fb20                         cmp        ebx, 0x20
005aa 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
005b4 41bea8000000                   mov        r14d, 0xa8
005ba 7c06                           jl         0x7f4c14400042
005bc 41beb8000000                   mov        r14d, 0xb8
005c2 4a8b3c31                       mov        rdi, qword ptr [rcx + r14]
005c6 488d7f01                       lea        rdi, [rdi + 1]
005ca 4a893c31                       mov        qword ptr [rcx + r14], rdi
005ce 0f8c1a000000                   jl         0x7f4c1440006e
005d4 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
005de ff81c8000000                   inc        dword ptr [rcx + 0xc8]
005e4 bfffffffff                     mov        edi, 0xffffffff
005e9 e90c000000                     jmp        0x7f4c1440007a
005ee 488bcb                         mov        rcx, rbx
005f1 bf01000000                     mov        edi, 1
005f6 d3e7                           shl        edi, cl
005f8 ffcf                           dec        edi
005fa 899424cc000000                 mov        dword ptr [rsp + 0xcc], edx
00601 48898424d8000000               mov        qword ptr [rsp + 0xd8], rax
00609 4889b424d0000000               mov        qword ptr [rsp + 0xd0], rsi
00611 488b8c2498000000               mov        rcx, qword ptr [rsp + 0x98]
00619 4c8b742478                     mov        r14, qword ptr [rsp + 0x78]
0061e 4863ff                         movsxd     rdi, edi
00621 4923fb                         and        rdi, r11
00624 8bff                           mov        edi, edi
00626 488bf1                         mov        rsi, rcx
00629 488bcb                         mov        rcx, rbx
0062c 49d3eb                         shr        r11, cl
0062f 458bdb                         mov        r11d, r11d
00632 418b9ef4000000                 mov        ebx, dword ptr [r14 + 0xf4]
00639 418b8ef8000000                 mov        ecx, dword ptr [r14 + 0xf8]
00640 418b4628                       mov        eax, dword ptr [r14 + 0x28]
00644 448b7618                       mov        r14d, dword ptr [rsi + 0x18]
00648 458b7608                       mov        r14d, dword ptr [r14 + 8]
0064c 41ffce                         dec        r14d
0064f 418b5518                       mov        edx, dword ptr [r13 + 0x18]
00653 8b5208                         mov        edx, dword ptr [rdx + 8]
00656 ffca                           dec        edx
00658 418b7118                       mov        esi, dword ptr [r9 + 0x18]
0065c 8b7608                         mov        esi, dword ptr [rsi + 8]
0065f ffce                           dec        esi
00661 4c89ac24e0000000               mov        qword ptr [rsp + 0xe0], r13
00669 4c8bac2498000000               mov        r13, qword ptr [rsp + 0x98]
00671 4c89ac24e8000000               mov        qword ptr [rsp + 0xe8], r13
00679 448bac24a0000000               mov        r13d, dword ptr [rsp + 0xa0]
00681 4489ac24f0000000               mov        dword ptr [rsp + 0xf0], r13d
00689 448bac24cc000000               mov        r13d, dword ptr [rsp + 0xcc]
00691 4489ac24f4000000               mov        dword ptr [rsp + 0xf4], r13d
00699 4c8bac24d8000000               mov        r13, qword ptr [rsp + 0xd8]
006a1 4c89ac24f8000000               mov        qword ptr [rsp + 0xf8], r13
006a9 4c8bac24d0000000               mov        r13, qword ptr [rsp + 0xd0]
006b1 4c89ac2400010000               mov        qword ptr [rsp + 0x100], r13
006b9 448bac24c8000000               mov        r13d, dword ptr [rsp + 0xc8]
006c1 4489ac2408010000               mov        dword ptr [rsp + 0x108], r13d
006c9 448bac2488000000               mov        r13d, dword ptr [rsp + 0x88]
006d1 4489ac240c010000               mov        dword ptr [rsp + 0x10c], r13d
006d9 448bac24d0020000               mov        r13d, dword ptr [rsp + 0x2d0]
006e1 4489ac2410010000               mov        dword ptr [rsp + 0x110], r13d
006e9 448bac2480000000               mov        r13d, dword ptr [rsp + 0x80]
006f1 4489ac2414010000               mov        dword ptr [rsp + 0x114], r13d
006f9 4c8b6c2478                     mov        r13, qword ptr [rsp + 0x78]
006fe 4c89ac2418010000               mov        qword ptr [rsp + 0x118], r13
00706 4c8b6c2470                     mov        r13, qword ptr [rsp + 0x70]
0070b 4c89ac2420010000               mov        qword ptr [rsp + 0x120], r13
00713 448b6c2464                     mov        r13d, dword ptr [rsp + 0x64]
00718 4489ac2428010000               mov        dword ptr [rsp + 0x128], r13d
00720 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
00725 4489ac242c010000               mov        dword ptr [rsp + 0x12c], r13d
0072d 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
00732 4c89ac2430010000               mov        qword ptr [rsp + 0x130], r13
0073a 41bd00000000                   mov        r13d, 0
00740 4c898c2438010000               mov        qword ptr [rsp + 0x138], r9
00748 41b900000000                   mov        r9d, 0
0074e 89b424d8010000                 mov        dword ptr [rsp + 0x1d8], esi
00755 898424dc010000                 mov        dword ptr [rsp + 0x1dc], eax
0075c 4c898c24e0010000               mov        qword ptr [rsp + 0x1e0], r9
00764 48898c24f0010000               mov        qword ptr [rsp + 0x1f0], rcx
0076c 48899c24e8010000               mov        qword ptr [rsp + 0x1e8], rbx
00774 4c8b8c2438010000               mov        r9, qword ptr [rsp + 0x138]
0077c 488b8424e0000000               mov        rax, qword ptr [rsp + 0xe0]
00784 488b9c24e8000000               mov        rbx, qword ptr [rsp + 0xe8]
0078c 8bb42414010000                 mov        esi, dword ptr [rsp + 0x114]
00793 0f1f440000                     nop        dword ptr [rax + rax]
00798 443bee                         cmp        r13d, esi
0079b 89b42414010000                 mov        dword ptr [rsp + 0x114], esi
007a2 48be0050720c4c7f0000           movabs     rsi, 0x7f4c0c725000
007ac 4489ac24f8010000               mov        dword ptr [rsp + 0x1f8], r13d
007b4 41bde8010000                   mov        r13d, 0x1e8
007ba 7d06                           jge        0x7f4c14400242
007bc 41bdf8010000                   mov        r13d, 0x1f8
007c2 4a8b0c2e                       mov        rcx, qword ptr [rsi + r13]
007c6 488d4901                       lea        rcx, [rcx + 1]
007ca 4a890c2e                       mov        qword ptr [rsi + r13], rcx
007ce 0f8d580e0000                   jge        0x7f4c144010ac
007d4 8bb424d8010000                 mov        esi, dword ptr [rsp + 0x1d8]
007db 8b4b18                         mov        ecx, dword ptr [rbx + 0x18]
007de 4d8beb                         mov        r13, r11
007e1 4d23ee                         and        r13, r14
007e4 443b6908                       cmp        r13d, dword ptr [rcx + 8]
007e8 0f837d160000                   jae        0x7f4c144018eb
007ee 4d63ed                         movsxd     r13, r13d
007f1 48899c24e8000000               mov        qword ptr [rsp + 0xe8], rbx
007f9 4a8b5ce910                     mov        rbx, qword ptr [rcx + r13*8 + 0x10]
007fe 48899c2410020000               mov        qword ptr [rsp + 0x210], rbx
00806 8b4818                         mov        ecx, dword ptr [rax + 0x18]
00809 4c8bef                         mov        r13, rdi
0080c 4c23ea                         and        r13, rdx
0080f 443b6908                       cmp        r13d, dword ptr [rcx + 8]
00813 0f836f160000                   jae        0x7f4c14401908
00819 4d63ed                         movsxd     r13, r13d
0081c 89bc24fc010000                 mov        dword ptr [rsp + 0x1fc], edi
00823 4a8b7ce910                     mov        rdi, qword ptr [rcx + r13*8 + 0x10]
00828 4889bc2428020000               mov        qword ptr [rsp + 0x228], rdi
00830 418b4918                       mov        ecx, dword ptr [r9 + 0x18]
00834 4d8be8                         mov        r13, r8
00837 4c23ee                         and        r13, rsi
0083a 443b6908                       cmp        r13d, dword ptr [rcx + 8]
0083e 0f8361160000                   jae        0x7f4c14401925
00844 4d63ed                         movsxd     r13, r13d
00847 48898424e0000000               mov        qword ptr [rsp + 0xe0], rax
0084f 4a8b44e910                     mov        rax, qword ptr [rcx + r13*8 + 0x10]
00854 4889842418020000               mov        qword ptr [rsp + 0x218], rax
0085c 89b424d8010000                 mov        dword ptr [rsp + 0x1d8], esi
00863 b920000000                     mov        ecx, 0x20
00868 4c8bef                         mov        r13, rdi
0086b 49d3ed                         shr        r13, cl
0086e 458bed                         mov        r13d, r13d
00871 4181e5ff000000                 and        r13d, 0xff
00878 b920000000                     mov        ecx, 0x20
0087d 488bf0                         mov        rsi, rax
00880 48d3ee                         shr        rsi, cl
00883 8bf6                           mov        esi, esi
00885 81e6ff000000                   and        esi, 0xff
0088b 89b42420020000                 mov        dword ptr [rsp + 0x220], esi
00892 b920000000                     mov        ecx, 0x20
00897 89942400020000                 mov        dword ptr [rsp + 0x200], edx
0089e 488bd3                         mov        rdx, rbx
008a1 48d3ea                         shr        rdx, cl
008a4 8bd2                           mov        edx, edx
008a6 81e2ff000000                   and        edx, 0xff
008ac 89942434020000                 mov        dword ptr [rsp + 0x234], edx
008b3 8b8c24f8010000                 mov        ecx, dword ptr [rsp + 0x1f8]
008ba ffc1                           inc        ecx
008bc 3b8c2414010000                 cmp        ecx, dword ptr [rsp + 0x114]
008c3 4489842404020000               mov        dword ptr [rsp + 0x204], r8d
008cb 49b80050720c4c7f0000           movabs     r8, 0x7f4c0c725000
008d5 4c898c2438010000               mov        qword ptr [rsp + 0x138], r9
008dd 41b908020000                   mov        r9d, 0x208
008e3 7d06                           jge        0x7f4c1440036b
008e5 41b918020000                   mov        r9d, 0x218
008eb 44899c2408020000               mov        dword ptr [rsp + 0x208], r11d
008f3 4f8b1c08                       mov        r11, qword ptr [r8 + r9]
008f7 4d8d5b01                       lea        r11, [r11 + 1]
008fb 4f891c08                       mov        qword ptr [r8 + r9], r11
008ff 0f8d1c000000                   jge        0x7f4c144003a1
00905 49b80050720c4c7f0000           movabs     r8, 0x7f4c0c725000
0090f 41ff8028020000                 inc        dword ptr [r8 + 0x228]
00916 41b801000000                   mov        r8d, 1
0091c e906000000                     jmp        0x7f4c144003a7
00921 41b800000000                   mov        r8d, 0
00927 4489b4240c020000               mov        dword ptr [rsp + 0x20c], r14d
0092f 4585c0                         test       r8d, r8d
00932 49b90050720c4c7f0000           movabs     r9, 0x7f4c0c725000
0093c 41bb40020000                   mov        r11d, 0x240
00942 7406                           je         0x7f4c144003ca
00944 41bb50020000                   mov        r11d, 0x250
0094a 4f8b3419                       mov        r14, qword ptr [r9 + r11]
0094e 4d8d7601                       lea        r14, [r14 + 1]
00952 4f893419                       mov        qword ptr [r9 + r11], r14
00956 898c243c020000                 mov        dword ptr [rsp + 0x23c], ecx
0095d 0f842a000000                   je         0x7f4c1440040d
00963 b928000000                     mov        ecx, 0x28
00968 4c8bdb                         mov        r11, rbx
0096b 49d3eb                         shr        r11, cl
0096e 458bdb                         mov        r11d, r11d
00971 4181e3ff000000                 and        r11d, 0xff
00978 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00982 ff8160020000                   inc        dword ptr [rcx + 0x260]
00988 e906000000                     jmp        0x7f4c14400413
0098d 41bb00000000                   mov        r11d, 0
00993 4585c0                         test       r8d, r8d
00996 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
009a0 41be78020000                   mov        r14d, 0x278
009a6 7406                           je         0x7f4c1440042e
009a8 41be88020000                   mov        r14d, 0x288
009ae 4a8b1c31                       mov        rbx, qword ptr [rcx + r14]
009b2 488d5b01                       lea        rbx, [rbx + 1]
009b6 4a891c31                       mov        qword ptr [rcx + r14], rbx
009ba 0f8428000000                   je         0x7f4c14400468
009c0 b928000000                     mov        ecx, 0x28
009c5 488bd8                         mov        rbx, rax
009c8 48d3eb                         shr        rbx, cl
009cb 8bdb                           mov        ebx, ebx
009cd 81e3ff000000                   and        ebx, 0xff
009d3 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
009dd ff8198020000                   inc        dword ptr [rcx + 0x298]
009e3 e905000000                     jmp        0x7f4c1440046d
009e8 bb00000000                     mov        ebx, 0
009ed 4585c0                         test       r8d, r8d
009f0 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
009fa 41beb0020000                   mov        r14d, 0x2b0
00a00 7406                           je         0x7f4c14400488
00a02 41bec0020000                   mov        r14d, 0x2c0
00a08 4a8b0431                       mov        rax, qword ptr [rcx + r14]
00a0c 488d4001                       lea        rax, [rax + 1]
00a10 4a890431                       mov        qword ptr [rcx + r14], rax
00a14 0f8427000000                   je         0x7f4c144004c1
00a1a b928000000                     mov        ecx, 0x28
00a1f 488bc7                         mov        rax, rdi
00a22 48d3e8                         shr        rax, cl
00a25 8bc0                           mov        eax, eax
00a27 25ff000000                     and        eax, 0xff
00a2c 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00a36 ff81d0020000                   inc        dword ptr [rcx + 0x2d0]
00a3c e905000000                     jmp        0x7f4c144004c6
00a41 b800000000                     mov        eax, 0
00a46 4403db                         add        r11d, ebx
00a49 4403d8                         add        r11d, eax
00a4c 498bcd                         mov        rcx, r13
00a4f 03ce                           add        ecx, esi
00a51 03ca                           add        ecx, edx
00a53 4c8bf1                         mov        r14, rcx
00a56 4503f3                         add        r14d, r11d
00a59 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00a63 ff81e8020000                   inc        dword ptr [rcx + 0x2e8]
00a69 4585f6                         test       r14d, r14d
00a6c 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00a76 be78030000                     mov        esi, 0x378
00a7b 7505                           jne        0x7f4c14400502
00a7d be88030000                     mov        esi, 0x388
00a82 488b3c31                       mov        rdi, qword ptr [rcx + rsi]
00a86 488d7f01                       lea        rdi, [rdi + 1]
00a8a 48893c31                       mov        qword ptr [rcx + rsi], rdi
00a8e 89842430020000                 mov        dword ptr [rsp + 0x230], eax
00a95 899c2424020000                 mov        dword ptr [rsp + 0x224], ebx
00a9c 0f8550000000                   jne        0x7f4c14400572
00aa2 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00aac ff8198030000                   inc        dword ptr [rcx + 0x398]
00ab2 8bbc24f0000000                 mov        edi, dword ptr [rsp + 0xf0]
00ab9 448bb424f4000000               mov        r14d, dword ptr [rsp + 0xf4]
00ac1 488bb424f8000000               mov        rsi, qword ptr [rsp + 0xf8]
00ac9 488b8c2400010000               mov        rcx, qword ptr [rsp + 0x100]
00ad1 8b9c2408010000                 mov        ebx, dword ptr [rsp + 0x108]
00ad8 b800000000                     mov        eax, 0
00add 4489842438020000               mov        dword ptr [rsp + 0x238], r8d
00ae5 4489ac2458020000               mov        dword ptr [rsp + 0x258], r13d
00aed e91e030000                     jmp        0x7f4c14400890
00af2 4183fe3f                       cmp        r14d, 0x3f
00af6 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00b00 beb0030000                     mov        esi, 0x3b0
00b05 7f05                           jg         0x7f4c1440058c
00b07 bec0030000                     mov        esi, 0x3c0
00b0c 488b3c31                       mov        rdi, qword ptr [rcx + rsi]
00b10 488d7f01                       lea        rdi, [rdi + 1]
00b14 48893c31                       mov        qword ptr [rcx + rsi], rdi
00b18 0f8f5b090000                   jg         0x7f4c14400ef9
00b1e b940000000                     mov        ecx, 0x40
00b23 2b8c24f4000000                 sub        ecx, dword ptr [rsp + 0xf4]
00b2a 443bf1                         cmp        r14d, ecx
00b2d 48be0050720c4c7f0000           movabs     rsi, 0x7f4c0c725000
00b37 bfd0030000                     mov        edi, 0x3d0
00b3c 7f05                           jg         0x7f4c144005c3
00b3e bfe0030000                     mov        edi, 0x3e0
00b43 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
00b47 488d5b01                       lea        rbx, [rbx + 1]
00b4b 48891c3e                       mov        qword ptr [rsi + rdi], rbx
00b4f 0f8fbd000000                   jg         0x7f4c14400692
00b55 412bce                         sub        ecx, r14d
00b58 488bb42400010000               mov        rsi, qword ptr [rsp + 0x100]
00b60 48d3ee                         shr        rsi, cl
00b63 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00b6d 488381f003000001               add        qword ptr [rcx + 0x3f0], 1
00b75 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00b7f 8b7970                         mov        edi, dword ptr [rcx + 0x70]
00b82 83c702                         add        edi, 2
00b85 897970                         mov        dword ptr [rcx + 0x70], edi
00b88 81e7feff1f00                   and        edi, 0x1ffffe
00b8e 85ff                           test       edi, edi
00b90 0f841d130000                   je         0x7f4c14401933
00b96 4183fe40                       cmp        r14d, 0x40
00b9a 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00ba4 bfa8000000                     mov        edi, 0xa8
00ba9 7c05                           jl         0x7f4c14400630
00bab bfb8000000                     mov        edi, 0xb8
00bb0 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
00bb4 488d5b01                       lea        rbx, [rbx + 1]
00bb8 48891c39                       mov        qword ptr [rcx + rdi], rbx
00bbc 0f8c1c000000                   jl         0x7f4c1440065e
00bc2 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00bcc ff81c8000000                   inc        dword ptr [rcx + 0xc8]
00bd2 48c7c7ffffffff                 mov        rdi, 0xffffffffffffffff
00bd9 e914000000                     jmp        0x7f4c14400672
00bde bf01000000                     mov        edi, 1
00be3 498bce                         mov        rcx, r14
00be6 488bdf                         mov        rbx, rdi
00be9 48d3e3                         shl        rbx, cl
00bec 482bdf                         sub        rbx, rdi
00bef 488bfb                         mov        rdi, rbx
00bf2 4823fe                         and        rdi, rsi
00bf5 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00bff ff8100040000                   inc        dword ptr [rcx + 0x400]
00c05 488b9c2400010000               mov        rbx, qword ptr [rsp + 0x100]
00c0d e9b6000000                     jmp        0x7f4c14400748
00c12 498bf6                         mov        rsi, r14
00c15 2bf1                           sub        esi, ecx
00c17 48bf0050720c4c7f0000           movabs     rdi, 0x7f4c0c725000
00c21 4883871804000001               add        qword ptr [rdi + 0x418], 1
00c29 48bf80eb710c4c7f0000           movabs     rdi, 0x7f4c0c71eb80
00c33 8b5f70                         mov        ebx, dword ptr [rdi + 0x70]
00c36 83c302                         add        ebx, 2
00c39 895f70                         mov        dword ptr [rdi + 0x70], ebx
00c3c 81e3feff1f00                   and        ebx, 0x1ffffe
00c42 85db                           test       ebx, ebx
00c44 0f848a120000                   je         0x7f4c14401954
00c4a 83f940                         cmp        ecx, 0x40
00c4d 48bf80eb710c4c7f0000           movabs     rdi, 0x7f4c0c71eb80
00c57 bba8000000                     mov        ebx, 0xa8
00c5c 7c05                           jl         0x7f4c144006e3
00c5e bbb8000000                     mov        ebx, 0xb8
00c63 488b041f                       mov        rax, qword ptr [rdi + rbx]
00c67 488d4001                       lea        rax, [rax + 1]
00c6b 4889041f                       mov        qword ptr [rdi + rbx], rax
00c6f 0f8c1c000000                   jl         0x7f4c14400711
00c75 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00c7f ff81c8000000                   inc        dword ptr [rcx + 0xc8]
00c85 48c7c7ffffffff                 mov        rdi, 0xffffffffffffffff
00c8c e911000000                     jmp        0x7f4c14400722
00c91 bf01000000                     mov        edi, 1
00c96 488bdf                         mov        rbx, rdi
00c99 48d3e3                         shl        rbx, cl
00c9c 482bdf                         sub        rbx, rdi
00c9f 488bfb                         mov        rdi, rbx
00ca2 488b9c2400010000               mov        rbx, qword ptr [rsp + 0x100]
00caa 4823fb                         and        rdi, rbx
00cad 488bce                         mov        rcx, rsi
00cb0 48d3e7                         shl        rdi, cl
00cb3 b940000000                     mov        ecx, 0x40
00cb8 2bce                           sub        ecx, esi
00cba 488bb424f8000000               mov        rsi, qword ptr [rsp + 0xf8]
00cc2 48d3ee                         shr        rsi, cl
00cc5 480bfe                         or         rdi, rsi
00cc8 498bf6                         mov        rsi, r14
00ccb 03b424f4000000                 add        esi, dword ptr [rsp + 0xf4]
00cd2 4403b424f0000000               add        r14d, dword ptr [rsp + 0xf0]
00cda 83fe40                         cmp        esi, 0x40
00cdd 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00ce7 b838040000                     mov        eax, 0x438
00cec 7d05                           jge        0x7f4c14400773
00cee b828040000                     mov        eax, 0x428
00cf3 488b1401                       mov        rdx, qword ptr [rcx + rax]
00cf7 488d5201                       lea        rdx, [rdx + 1]
00cfb 48891401                       mov        qword ptr [rcx + rax], rdx
00cff 0f8d33000000                   jge        0x7f4c144007b8
00d05 488b9424f8000000               mov        rdx, qword ptr [rsp + 0xf8]
00d0d 488bc7                         mov        rax, rdi
00d10 498bfe                         mov        rdi, r14
00d13 4c8bf6                         mov        r14, rsi
00d16 488bf2                         mov        rsi, rdx
00d19 488bcb                         mov        rcx, rbx
00d1c 8b9c2408010000                 mov        ebx, dword ptr [rsp + 0x108]
00d23 4489842438020000               mov        dword ptr [rsp + 0x238], r8d
00d2b 4489ac2458020000               mov        dword ptr [rsp + 0x258], r13d
00d33 e9d8000000                     jmp        0x7f4c14400890
00d38 4489b42448020000               mov        dword ptr [rsp + 0x248], r14d
00d40 4889bc2440020000               mov        qword ptr [rsp + 0x240], rdi
00d48 44899c2454020000               mov        dword ptr [rsp + 0x254], r11d
00d50 4489842438020000               mov        dword ptr [rsp + 0x238], r8d
00d58 4489ac2458020000               mov        dword ptr [rsp + 0x258], r13d
00d60 8bbc2428010000                 mov        edi, dword ptr [rsp + 0x128]
00d67 4c8bac2430010000               mov        r13, qword ptr [rsp + 0x130]
00d6f 83ee40                         sub        esi, 0x40
00d72 8b9c2408010000                 mov        ebx, dword ptr [rsp + 0x108]
00d79 83eb08                         sub        ebx, 8
00d7c 48b80050720c4c7f0000           movabs     rax, 0x7f4c0c725000
00d86 4883804804000001               add        qword ptr [rax + 0x448], 1
00d8e 488bc3                         mov        rax, rbx
00d91 83e808                         sub        eax, 8
00d94 89b4244c020000                 mov        dword ptr [rsp + 0x24c], esi
00d9b 498bf5                         mov        rsi, r13
00d9e 488bd7                         mov        rdx, rdi
00da1 488bc8                         mov        rcx, rax
00da4 89bc2428010000                 mov        dword ptr [rsp + 0x128], edi
00dab 4c89ac2430010000               mov        qword ptr [rsp + 0x130], r13
00db3 899c2450020000                 mov        dword ptr [rsp + 0x250], ebx
00dba 0f1f440000                     nop        dword ptr [rax + rax]
00dbf e81c005107                     call       0x7f4c1b910860
00dc4 0f1f8400bc0e0004               nop        dword ptr [rax + rax + 0x4000ebc]
00dcc 488bc8                         mov        rcx, rax
00dcf 48be0050720c4c7f0000           movabs     rsi, 0x7f4c0c725000
00dd9 ff8658040000                   inc        dword ptr [rsi + 0x458]
00ddf 488b842440020000               mov        rax, qword ptr [rsp + 0x240]
00de7 8bbc2448020000                 mov        edi, dword ptr [rsp + 0x248]
00dee 448bb4244c020000               mov        r14d, dword ptr [rsp + 0x24c]
00df6 488bf1                         mov        rsi, rcx
00df9 488b8c24f8000000               mov        rcx, qword ptr [rsp + 0xf8]
00e01 8b9c2450020000                 mov        ebx, dword ptr [rsp + 0x250]
00e08 448b9c2454020000               mov        r11d, dword ptr [rsp + 0x254]
00e10 48ba0050720c4c7f0000           movabs     rdx, 0x7f4c0c725000
00e1a 488382e004000001               add        qword ptr [rdx + 0x4e0], 1
00e22 48ba80eb710c4c7f0000           movabs     rdx, 0x7f4c0c71eb80
00e2c 448b4270                       mov        r8d, dword ptr [rdx + 0x70]
00e30 4183c002                       add        r8d, 2
00e34 44894270                       mov        dword ptr [rdx + 0x70], r8d
00e38 4181e0feff1f00                 and        r8d, 0x1ffffe
00e3f 4585c0                         test       r8d, r8d
00e42 0f84ad100000                   je         0x7f4c14401975
00e48 4183fb40                       cmp        r11d, 0x40
00e4c 48ba80eb710c4c7f0000           movabs     rdx, 0x7f4c0c71eb80
00e56 41b8a8000000                   mov        r8d, 0xa8
00e5c 7c06                           jl         0x7f4c144008e4
00e5e 41b8b8000000                   mov        r8d, 0xb8
00e64 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
00e68 4d8d4901                       lea        r9, [r9 + 1]
00e6c 4e890c02                       mov        qword ptr [rdx + r8], r9
00e70 0f8c24000000                   jl         0x7f4c1440091a
00e76 48ba80eb710c4c7f0000           movabs     rdx, 0x7f4c0c71eb80
00e80 ff82c8000000                   inc        dword ptr [rdx + 0xc8]
00e86 48c7c2ffffffff                 mov        rdx, 0xffffffffffffffff
00e8d 48898c2468020000               mov        qword ptr [rsp + 0x268], rcx
00e95 e91c000000                     jmp        0x7f4c14400936
00e9a 48898c2468020000               mov        qword ptr [rsp + 0x268], rcx
00ea2 ba01000000                     mov        edx, 1
00ea7 498bcb                         mov        rcx, r11
00eaa 4c8bca                         mov        r9, rdx
00ead 49d3e1                         shl        r9, cl
00eb0 4c2bca                         sub        r9, rdx
00eb3 498bd1                         mov        rdx, r9
00eb6 448b8c2434020000               mov        r9d, dword ptr [rsp + 0x234]
00ebe 4823d0                         and        rdx, rax
00ec1 8bd2                           mov        edx, edx
00ec3 498bcb                         mov        rcx, r11
00ec6 48d3e8                         shr        rax, cl
00ec9 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00ed3 488381f004000001               add        qword ptr [rcx + 0x4f0], 1
00edb 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00ee5 448b5970                       mov        r11d, dword ptr [rcx + 0x70]
00ee9 4183c302                       add        r11d, 2
00eed 44895970                       mov        dword ptr [rcx + 0x70], r11d
00ef1 4181e3feff1f00                 and        r11d, 0x1ffffe
00ef8 4585db                         test       r11d, r11d
00efb 0f8415100000                   je         0x7f4c14401996
00f01 4183f940                       cmp        r9d, 0x40
00f05 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00f0f 41bba8000000                   mov        r11d, 0xa8
00f15 7c06                           jl         0x7f4c1440099d
00f17 41bbb8000000                   mov        r11d, 0xb8
00f1d 4e8b2c19                       mov        r13, qword ptr [rcx + r11]
00f21 4d8d6d01                       lea        r13, [r13 + 1]
00f25 4e892c19                       mov        qword ptr [rcx + r11], r13
00f29 0f8c1c000000                   jl         0x7f4c144009cb
00f2f 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00f39 ff81c8000000                   inc        dword ptr [rcx + 0xc8]
00f3f 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00f46 e915000000                     jmp        0x7f4c144009e0
00f4b 41bb01000000                   mov        r11d, 1
00f51 498bc9                         mov        rcx, r9
00f54 4d8beb                         mov        r13, r11
00f57 49d3e5                         shl        r13, cl
00f5a 4d2beb                         sub        r13, r11
00f5d 4d8bdd                         mov        r11, r13
00f60 4889b42460020000               mov        qword ptr [rsp + 0x260], rsi
00f68 448bac2420020000               mov        r13d, dword ptr [rsp + 0x220]
00f70 4c23d8                         and        r11, rax
00f73 458bdb                         mov        r11d, r11d
00f76 498bc9                         mov        rcx, r9
00f79 48d3e8                         shr        rax, cl
00f7c 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
00f86 4883810005000001               add        qword ptr [rcx + 0x500], 1
00f8e 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00f98 448b4970                       mov        r9d, dword ptr [rcx + 0x70]
00f9c 4183c102                       add        r9d, 2
00fa0 44894970                       mov        dword ptr [rcx + 0x70], r9d
00fa4 4181e1feff1f00                 and        r9d, 0x1ffffe
00fab 4585c9                         test       r9d, r9d
00fae 0f84830f0000                   je         0x7f4c144019b7
00fb4 4183fd40                       cmp        r13d, 0x40
00fb8 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00fc2 41b9a8000000                   mov        r9d, 0xa8
00fc8 7c06                           jl         0x7f4c14400a50
00fca 41b9b8000000                   mov        r9d, 0xb8
00fd0 4a8b3409                       mov        rsi, qword ptr [rcx + r9]
00fd4 488d7601                       lea        rsi, [rsi + 1]
00fd8 4a893409                       mov        qword ptr [rcx + r9], rsi
00fdc 0f8c1c000000                   jl         0x7f4c14400a7e
00fe2 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
00fec ff81c8000000                   inc        dword ptr [rcx + 0xc8]
00ff2 48c7c6ffffffff                 mov        rsi, 0xffffffffffffffff
00ff9 e914000000                     jmp        0x7f4c14400a92
00ffe be01000000                     mov        esi, 1
01003 498bcd                         mov        rcx, r13
01006 4c8bce                         mov        r9, rsi
01009 49d3e1                         shl        r9, cl
0100c 4c2bce                         sub        r9, rsi
0100f 498bf1                         mov        rsi, r9
01012 89bc245c020000                 mov        dword ptr [rsp + 0x25c], edi
01019 448b8c2458020000               mov        r9d, dword ptr [rsp + 0x258]
01021 4823f0                         and        rsi, rax
01024 8bf6                           mov        esi, esi
01026 498bcd                         mov        rcx, r13
01029 48d3e8                         shr        rax, cl
0102c 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
01036 4883811005000001               add        qword ptr [rcx + 0x510], 1
0103e 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
01048 448b6970                       mov        r13d, dword ptr [rcx + 0x70]
0104c 4183c502                       add        r13d, 2
01050 44896970                       mov        dword ptr [rcx + 0x70], r13d
01054 4181e5feff1f00                 and        r13d, 0x1ffffe
0105b 4585ed                         test       r13d, r13d
0105e 0f84f40e0000                   je         0x7f4c144019d8
01064 4183f940                       cmp        r9d, 0x40
01068 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
01072 41bda8000000                   mov        r13d, 0xa8
01078 7c06                           jl         0x7f4c14400b00
0107a 41bdb8000000                   mov        r13d, 0xb8
01080 4a8b3c29                       mov        rdi, qword ptr [rcx + r13]
01084 488d7f01                       lea        rdi, [rdi + 1]
01088 4a893c29                       mov        qword ptr [rcx + r13], rdi
0108c 0f8c1c000000                   jl         0x7f4c14400b2e
01092 48b980eb710c4c7f0000           movabs     rcx, 0x7f4c0c71eb80
0109c ff81c8000000                   inc        dword ptr [rcx + 0xc8]
010a2 48c7c7ffffffff                 mov        rdi, 0xffffffffffffffff
010a9 e914000000                     jmp        0x7f4c14400b42
010ae bf01000000                     mov        edi, 1
010b3 498bc9                         mov        rcx, r9
010b6 4c8bcf                         mov        r9, rdi
010b9 49d3e1                         shl        r9, cl
010bc 4c2bcf                         sub        r9, rdi
010bf 498bf9                         mov        rdi, r9
010c2 488b8c2418020000               mov        rcx, qword ptr [rsp + 0x218]
010ca 4c8b8c2410020000               mov        r9, qword ptr [rsp + 0x210]
010d2 4c8bac24e0010000               mov        r13, qword ptr [rsp + 0x1e0]
010da 4823f8                         and        rdi, rax
010dd 488b842428020000               mov        rax, qword ptr [rsp + 0x228]
010e5 41baffffffff                   mov        r10d, 0xffffffff
010eb 4923c2                         and        rax, r10
010ee 4803c7                         add        rax, rdi
010f1 8bf9                           mov        edi, ecx
010f3 03fe                           add        edi, esi
010f5 89bc2474020000                 mov        dword ptr [rsp + 0x274], edi
010fc 418bf1                         mov        esi, r9d
010ff 4103f3                         add        esi, r11d
01102 4c63df                         movsxd     r11, edi
01105 4d03dd                         add        r11, r13
01108 49bd0050720c4c7f0000           movabs     r13, 0x7f4c0c725000
01112 41ff8520050000                 inc        dword ptr [r13 + 0x520]
01119 4c899c2480020000               mov        qword ptr [rsp + 0x280], r11
01121 89b42478020000                 mov        dword ptr [rsp + 0x278], esi
01128 8994247c020000                 mov        dword ptr [rsp + 0x27c], edx
0112f 4489b42488020000               mov        dword ptr [rsp + 0x288], r14d
01137 899c2470020000                 mov        dword ptr [rsp + 0x270], ebx
0113e 48bf0050720c4c7f0000           movabs     rdi, 0x7f4c0c725000
01148 4883877005000001               add        qword ptr [rdi + 0x570], 1
01150 488bf0                         mov        rsi, rax
01153 0f1f4000                       nop        dword ptr [rax]
01157 e884fc5007                     call       0x7f4c1b910860
0115c 0f1f840054120005               nop        dword ptr [rax + rax + 0x5001254]
01164 48be0050720c4c7f0000           movabs     rsi, 0x7f4c0c725000
0116e 4883868005000001               add        qword ptr [rsi + 0x580], 1
01176 488bb424e8010000               mov        rsi, qword ptr [rsp + 0x1e8]
0117e 488b9424f0010000               mov        rdx, qword ptr [rsp + 0x1f0]
01186 8b8c24f8010000                 mov        ecx, dword ptr [rsp + 0x1f8]
0118d 4c8bc0                         mov        r8, rax
01190 448b8c2478020000               mov        r9d, dword ptr [rsp + 0x278]
01198 8bbc2474020000                 mov        edi, dword ptr [rsp + 0x274]
0119f e83cfc5007                     call       0x7f4c1b910860
011a4 0f1f84009c120006               nop        dword ptr [rax + rax + 0x600129c]
011ac 448b842438020000               mov        r8d, dword ptr [rsp + 0x238]
011b4 4585c0                         test       r8d, r8d
011b7 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
011c1 baa0050000                     mov        edx, 0x5a0
011c6 7505                           jne        0x7f4c14400c4d
011c8 ba90050000                     mov        edx, 0x590
011cd 4c8b0411                       mov        r8, qword ptr [rcx + rdx]
011d1 4d8d4001                       lea        r8, [r8 + 1]
011d5 4c890411                       mov        qword ptr [rcx + rdx], r8
011d9 0f851c000000                   jne        0x7f4c14400c7b
011df 448b9c2408020000               mov        r11d, dword ptr [rsp + 0x208]
011e7 8bbc24fc010000                 mov        edi, dword ptr [rsp + 0x1fc]
011ee 448b842404020000               mov        r8d, dword ptr [rsp + 0x204]
011f6 e99c010000                     jmp        0x7f4c14400e17
011fb 8b942424020000                 mov        edx, dword ptr [rsp + 0x224]
01202 488b842418020000               mov        rax, qword ptr [rsp + 0x218]
0120a 488b9c2410020000               mov        rbx, qword ptr [rsp + 0x210]
01212 b930000000                     mov        ecx, 0x30
01217 48d3eb                         shr        rbx, cl
0121a 8bdb                           mov        ebx, ebx
0121c 488bca                         mov        rcx, rdx
0121f 038c2430020000                 add        ecx, dword ptr [rsp + 0x230]
01226 448b84247c020000               mov        r8d, dword ptr [rsp + 0x27c]
0122e 41d3e8                         shr        r8d, cl
01231 4103d8                         add        ebx, r8d
01234 b930000000                     mov        ecx, 0x30
01239 48d3e8                         shr        rax, cl
0123c 8bc0                           mov        eax, eax
0123e 8b8c2430020000                 mov        ecx, dword ptr [rsp + 0x230]
01245 448b84247c020000               mov        r8d, dword ptr [rsp + 0x27c]
0124d 41d3e8                         shr        r8d, cl
01250 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
0125a 488381b005000001               add        qword ptr [rcx + 0x5b0], 1
01262 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
0126c 8b7170                         mov        esi, dword ptr [rcx + 0x70]
0126f 83c602                         add        esi, 2
01272 897170                         mov        dword ptr [rcx + 0x70], esi
01275 81e6feff1f00                   and        esi, 0x1ffffe
0127b 85f6                           test       esi, esi
0127d 0f84f60c0000                   je         0x7f4c144019f9
01283 83fa20                         cmp        edx, 0x20
01286 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
01290 bea8000000                     mov        esi, 0xa8
01295 7c05                           jl         0x7f4c14400d1c
01297 beb8000000                     mov        esi, 0xb8
0129c 488b3c31                       mov        rdi, qword ptr [rcx + rsi]
012a0 488d7f01                       lea        rdi, [rdi + 1]
012a4 48893c31                       mov        qword ptr [rcx + rsi], rdi
012a8 0f8c1a000000                   jl         0x7f4c14400d48
012ae 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
012b8 ff81c8000000                   inc        dword ptr [rcx + 0xc8]
012be baffffffff                     mov        edx, 0xffffffff
012c3 e90c000000                     jmp        0x7f4c14400d54
012c8 488bca                         mov        rcx, rdx
012cb ba01000000                     mov        edx, 1
012d0 d3e2                           shl        edx, cl
012d2 ffca                           dec        edx
012d4 8bb42430020000                 mov        esi, dword ptr [rsp + 0x230]
012db 488bbc2428020000               mov        rdi, qword ptr [rsp + 0x228]
012e3 4923d0                         and        rdx, r8
012e6 03d0                           add        edx, eax
012e8 b930000000                     mov        ecx, 0x30
012ed 48d3ef                         shr        rdi, cl
012f0 8bff                           mov        edi, edi
012f2 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
012fc 488381c005000001               add        qword ptr [rcx + 0x5c0], 1
01304 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
0130e 448b4170                       mov        r8d, dword ptr [rcx + 0x70]
01312 4183c002                       add        r8d, 2
01316 44894170                       mov        dword ptr [rcx + 0x70], r8d
0131a 4181e0feff1f00                 and        r8d, 0x1ffffe
01321 4585c0                         test       r8d, r8d
01324 0f84700c0000                   je         0x7f4c14401a1a
0132a 83fe20                         cmp        esi, 0x20
0132d 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
01337 41b8a8000000                   mov        r8d, 0xa8
0133d 7c06                           jl         0x7f4c14400dc5
0133f 41b8b8000000                   mov        r8d, 0xb8
01345 4a8b0401                       mov        rax, qword ptr [rcx + r8]
01349 488d4001                       lea        rax, [rax + 1]
0134d 4a890401                       mov        qword ptr [rcx + r8], rax
01351 0f8c1b000000                   jl         0x7f4c14400df2
01357 48b978ec710c4c7f0000           movabs     rcx, 0x7f4c0c71ec78
01361 ff81c8000000                   inc        dword ptr [rcx + 0xc8]
01367 41b8ffffffff                   mov        r8d, 0xffffffff
0136d e90f000000                     jmp        0x7f4c14400e01
01372 488bce                         mov        rcx, rsi
01375 41b801000000                   mov        r8d, 1
0137b 41d3e0                         shl        r8d, cl
0137e 41ffc8                         dec        r8d
01381 8b8c247c020000                 mov        ecx, dword ptr [rsp + 0x27c]
01388 4c23c1                         and        r8, rcx
0138b 4403c7                         add        r8d, edi
0138e 4c8bdb                         mov        r11, rbx
01391 498bf8                         mov        rdi, r8
01394 4c8bc2                         mov        r8, rdx
01397 488b942480020000               mov        rdx, qword ptr [rsp + 0x280]
0139f 8bb4245c020000                 mov        esi, dword ptr [rsp + 0x25c]
013a6 448bb42488020000               mov        r14d, dword ptr [rsp + 0x288]
013ae 488b9c2460020000               mov        rbx, qword ptr [rsp + 0x260]
013b6 488b842468020000               mov        rax, qword ptr [rsp + 0x268]
013be 8b8c243c020000                 mov        ecx, dword ptr [rsp + 0x23c]
013c5 49bd0050720c4c7f0000           movabs     r13, 0x7f4c0c725000
013cf 458b4d74                       mov        r9d, dword ptr [r13 + 0x74]
013d3 4183c102                       add        r9d, 2
013d7 45894d74                       mov        dword ptr [r13 + 0x74], r9d
013db 4181e1fe3f0000                 and        r9d, 0x3ffe
013e2 4585c9                         test       r9d, r9d
013e5 0f84d00b0000                   je         0x7f4c14401a3b
013eb 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
013ef 418502                         test       dword ptr [r10], eax
013f2 49b90050720c4c7f0000           movabs     r9, 0x7f4c0c725000
013fc 41ff81d0050000                 inc        dword ptr [r9 + 0x5d0]
01403 4c8bea                         mov        r13, rdx
01406 498bd6                         mov        rdx, r14
01409 4c8bcb                         mov        r9, rbx
0140c 488bd8                         mov        rbx, rax
0140f 8b842470020000                 mov        eax, dword ptr [rsp + 0x270]
01416 448bb4240c020000               mov        r14d, dword ptr [rsp + 0x20c]
0141e 4c89ac24e0010000               mov        qword ptr [rsp + 0x1e0], r13
01426 89b424f0000000                 mov        dword ptr [rsp + 0xf0], esi
0142d 899424f4000000                 mov        dword ptr [rsp + 0xf4], edx
01434 4c898c24f8000000               mov        qword ptr [rsp + 0xf8], r9
0143c 48899c2400010000               mov        qword ptr [rsp + 0x100], rbx
01444 89842408010000                 mov        dword ptr [rsp + 0x108], eax
0144b 8bb42414010000                 mov        esi, dword ptr [rsp + 0x114]
01452 4c8be9                         mov        r13, rcx
01455 8b942400020000                 mov        edx, dword ptr [rsp + 0x200]
0145c 4c8b8c2438010000               mov        r9, qword ptr [rsp + 0x138]
01464 488b8424e0000000               mov        rax, qword ptr [rsp + 0xe0]
0146c 488b9c24e8000000               mov        rbx, qword ptr [rsp + 0xe8]
01474 e91ff3ffff                     jmp        0x7f4c14400218
01479 4c8bac2418010000               mov        r13, qword ptr [rsp + 0x118]
01481 448b842428010000               mov        r8d, dword ptr [rsp + 0x128]
01489 8b8c242c010000                 mov        ecx, dword ptr [rsp + 0x12c]
01490 488b942430010000               mov        rdx, qword ptr [rsp + 0x130]
01498 48be384131e300000000           movabs     rsi, 0xe3314138
014a2 488bbe88000000                 mov        rdi, qword ptr [rsi + 0x88]
014a9 41ba01000000                   mov        r10d, 1
014af 4903fa                         add        rdi, r10
014b2 4889be88000000                 mov        qword ptr [rsi + 0x88], rdi
014b9 418bbd48010000                 mov        edi, dword ptr [r13 + 0x148]
014c0 4889bc2490020000               mov        qword ptr [rsp + 0x290], rdi
014c8 483b07                         cmp        rax, qword ptr [rdi]
014cb 488bf7                         mov        rsi, rdi
014ce 48bb0050720c4c7f0000           movabs     rbx, 0x7f4c0c725000
014d8 488b36                         mov        rsi, qword ptr [rsi]
014db 48c1ee2a                       shr        rsi, 0x2a
014df 48c1e609                       shl        rsi, 9
014e3 41ba0000000c                   mov        r10d, 0xc000000
014e9 4903f2                         add        rsi, r10
014ec 41ba8f000000                   mov        r10d, 0x8f
014f2 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
014f6 743b                           je         0x7f4c14400fb3
014f8 4983c202                       add        r10, 2
014fc 4981fa93000000                 cmp        r10, 0x93
01503 75ed                           jne        0x7f4c14400f72
01505 41ba8f000000                   mov        r10d, 0x8f
0150b 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01510 7415                           je         0x7f4c14400fa7
01512 4983c202                       add        r10, 2
01516 4981fa93000000                 cmp        r10, 0x93
0151d 75ec                           jne        0x7f4c14400f8b
0151f 41ba8e000000                   mov        r10d, 0x8e
01525 eb10                           jmp        0x7f4c14400fb7
01527 50                             push       rax
01528 4833c0                         xor        rax, rax
0152b 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
01530 58                             pop        rax
01531 ebb9                           jmp        0x7f4c14400f6c
01533 4983c201                       add        r10, 1
01537 4a8304d301                     add        qword ptr [rbx + r10*8], 1
0153c 488bf7                         mov        rsi, rdi
0153f 4c89ac2418010000               mov        qword ptr [rsp + 0x118], r13
01547 e894ee5007                     call       0x7f4c1b90fe60
0154c 0f1f840044160008               nop        dword ptr [rax + rax + 0x8001644]
01554 488bbc2490020000               mov        rdi, qword ptr [rsp + 0x290]
0155c 48b80050720c4c7f0000           movabs     rax, 0x7f4c0c725000
01566 488b3f                         mov        rdi, qword ptr [rdi]
01569 48c1ef2a                       shr        rdi, 0x2a
0156d 48c1e709                       shl        rdi, 9
01571 41ba0000000c                   mov        r10d, 0xc000000
01577 4903fa                         add        rdi, r10
0157a 41ba95000000                   mov        r10d, 0x95
01580 4a3b3cd0                       cmp        rdi, qword ptr [rax + r10*8]
01584 7441                           je         0x7f4c14401047
01586 4983c202                       add        r10, 2
0158a 4981fa99000000                 cmp        r10, 0x99
01591 75ed                           jne        0x7f4c14401000
01593 41ba95000000                   mov        r10d, 0x95
01599 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
0159e 7415                           je         0x7f4c14401035
015a0 4983c202                       add        r10, 2
015a4 4981fa99000000                 cmp        r10, 0x99
015ab 75ec                           jne        0x7f4c14401019
015ad 41ba94000000                   mov        r10d, 0x94
015b3 eb16                           jmp        0x7f4c1440104b
015b5 53                             push       rbx
015b6 488bd8                         mov        rbx, rax
015b9 4833c0                         xor        rax, rax
015bc 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
015c1 488bc3                         mov        rax, rbx
015c4 5b                             pop        rbx
015c5 ebb3                           jmp        0x7f4c14400ffa
015c7 4983c201                       add        r10, 1
015cb 4a8304d001                     add        qword ptr [rax + r10*8], 1
015d0 48b800fe710c4c7f0000           movabs     rax, 0x7f4c0c71fe00
015da 8b7070                         mov        esi, dword ptr [rax + 0x70]
015dd 83c602                         add        esi, 2
015e0 897070                         mov        dword ptr [rax + 0x70], esi
015e3 81e6feff1f00                   and        esi, 0x1ffffe
015e9 85f6                           test       esi, esi
015eb 0f84f5090000                   je         0x7f4c14401a66
015f1 488bbc2490020000               mov        rdi, qword ptr [rsp + 0x290]
015f9 8b4718                         mov        eax, dword ptr [rdi + 0x18]
015fc 83f820                         cmp        eax, 0x20
015ff 48b800fe710c4c7f0000           movabs     rax, 0x7f4c0c71fe00
01609 bea8000000                     mov        esi, 0xa8
0160e 7f05                           jg         0x7f4c14401095
01610 beb8000000                     mov        esi, 0xb8
01615 488b1c30                       mov        rbx, qword ptr [rax + rsi]
01619 488d5b01                       lea        rbx, [rbx + 1]
0161d 48891c30                       mov        qword ptr [rax + rsi], rbx
01621 0f8fae000000                   jg         0x7f4c14401155
01627 e9d8000000                     jmp        0x7f4c14401184
0162c 4c8bac24e0010000               mov        r13, qword ptr [rsp + 0x1e0]
01634 8bb424f0000000                 mov        esi, dword ptr [rsp + 0xf0]
0163b 48b80050720c4c7f0000           movabs     rax, 0x7f4c0c725000
01645 ff80f8050000                   inc        dword ptr [rax + 0x5f8]
0164b 8b8424dc010000                 mov        eax, dword ptr [rsp + 0x1dc]
01652 8b9c2410010000                 mov        ebx, dword ptr [rsp + 0x110]
01659 4863c0                         movsxd     rax, eax
0165c 4903c5                         add        rax, r13
0165f 4c63eb                         movsxd     r13, ebx
01662 4c3be8                         cmp        r13, rax
01665 48bf0050720c4c7f0000           movabs     rdi, 0x7f4c0c725000
0166f bb18060000                     mov        ebx, 0x618
01674 7c05                           jl         0x7f4c144010fb
01676 bb08060000                     mov        ebx, 0x608
0167b 488b141f                       mov        rdx, qword ptr [rdi + rbx]
0167f 488d5201                       lea        rdx, [rdx + 1]
01683 4889141f                       mov        qword ptr [rdi + rbx], rdx
01687 0f8c74010000                   jl         0x7f4c14401281
0168d 448bac240c010000               mov        r13d, dword ptr [rsp + 0x10c]
01695 413bf5                         cmp        esi, r13d
01698 48be0050720c4c7f0000           movabs     rsi, 0x7f4c0c725000
016a2 bf48060000                     mov        edi, 0x648
016a7 7505                           jne        0x7f4c1440112e
016a9 bf38060000                     mov        edi, 0x638
016ae 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
016b2 488d5b01                       lea        rbx, [rbx + 1]
016b6 48891c3e                       mov        qword ptr [rsi + rdi], rbx
016ba 0f859f000000                   jne        0x7f4c144011df
016c0 8bc0                           mov        eax, eax
016c2 4881c4c0020000                 add        rsp, 0x2c0
016c9 5d                             pop        rbp
016ca 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
016ce 0f8733090000                   ja         0x7f4c14401a87
016d4 c3                             ret        
016d5 488bf7                         mov        rsi, rdi
016d8 48bb00fe710c4c7f0000           movabs     rbx, 0x7f4c0c71fe00
016e2 488383c800000001               add        qword ptr [rbx + 0xc8], 1
016ea 488bf7                         mov        rsi, rdi
016ed 6690                           nop        
016ef e8ecec5007                     call       0x7f4c1b90fe60
016f4 0f1f8400ec170009               nop        dword ptr [rax + rax + 0x90017ec]
016fc 488bbc2490020000               mov        rdi, qword ptr [rsp + 0x290]
01704 448b8c2410010000               mov        r9d, dword ptr [rsp + 0x110]
0170c 448b842414010000               mov        r8d, dword ptr [rsp + 0x114]
01714 488b8c2418010000               mov        rcx, qword ptr [rsp + 0x118]
0171c 4c8bac2420010000               mov        r13, qword ptr [rsp + 0x120]
01724 48be0050720c4c7f0000           movabs     rsi, 0x7f4c0c725000
0172e 488386d004000001               add        qword ptr [rsi + 0x4d0], 1
01736 488bf7                         mov        rsi, rdi
01739 498bd5                         mov        rdx, r13
0173c 666690                         nop        
0173f e89cf65007                     call       0x7f4c1b910860
01744 0f1f84003c18000a               nop        dword ptr [rax + rax + 0xa00183c]
0174c 4881c4c0020000                 add        rsp, 0x2c0
01753 5d                             pop        rbp
01754 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
01758 0f87bf080000                   ja         0x7f4c14401a9d
0175e c3                             ret        
0175f 90                             nop        
01760 e9dd080000                     jmp        0x7f4c14401ac2
01765 90                             nop        
01766 90                             nop        
01767 90                             nop        
01768 90                             nop        
01769 90                             nop        
0176a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
01771 0f85da080000                   jne        0x7f4c14401ad1
01777 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
0177e 488d7828                       lea        rdi, [rax + 0x28]
01782 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
01789 0f87c2080000                   ja         0x7f4c14401ad1
0178f 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
01796 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0179d 488908                         mov        qword ptr [rax], rcx
017a0 4833c9                         xor        rcx, rcx
017a3 48894808                       mov        qword ptr [rax + 8], rcx
017a7 48894810                       mov        qword ptr [rax + 0x10], rcx
017ab 48894818                       mov        qword ptr [rax + 0x18], rcx
017af 48894820                       mov        qword ptr [rax + 0x20], rcx
017b3 488bd0                         mov        rdx, rax
017b6 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
017c0 4883815806000001               add        qword ptr [rcx + 0x658], 1
017c8 ba02000000                     mov        edx, 2
017cd 48b9685e32e300000000           movabs     rcx, 0xe3325e68
017d7 488bf0                         mov        rsi, rax
017da 4889842498020000               mov        qword ptr [rsp + 0x298], rax
017e2 0f1f440000                     nop        dword ptr [rax + rax]
017e7 e8f4eb5007                     call       0x7f4c1b90fe60
017ec 0f1f8400e418000b               nop        dword ptr [rax + rax + 0xb0018e4]
017f4 488b842498020000               mov        rax, qword ptr [rsp + 0x298]
017fc e9f1080000                     jmp        0x7f4c14401b72
01801 48ba0050720c4c7f0000           movabs     rdx, 0x7f4c0c725000
0180b 4883822806000001               add        qword ptr [rdx + 0x628], 1
01813 48ba60f0710c4c7f0000           movabs     rdx, 0x7f4c0c71f060
0181d 8b7270                         mov        esi, dword ptr [rdx + 0x70]
01820 83c602                         add        esi, 2
01823 897270                         mov        dword ptr [rdx + 0x70], esi
01826 81e6feff1f00                   and        esi, 0x1ffffe
0182c 85f6                           test       esi, esi
0182e 0f842a080000                   je         0x7f4c14401ade
01834 0f1f4000                       nop        dword ptr [rax]
01838 e951080000                     jmp        0x7f4c14401b0e
0183d 90                             nop        
0183e 90                             nop        
0183f 90                             nop        
01840 90                             nop        
01841 90                             nop        
01842 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
01849 0f854e080000                   jne        0x7f4c14401b1d
0184f 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
01856 488d7828                       lea        rdi, [rax + 0x28]
0185a 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
01861 0f8736080000                   ja         0x7f4c14401b1d
01867 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
0186e 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
01875 488908                         mov        qword ptr [rax], rcx
01878 4833c9                         xor        rcx, rcx
0187b 48894808                       mov        qword ptr [rax + 8], rcx
0187f 48894810                       mov        qword ptr [rax + 0x10], rcx
01883 48894818                       mov        qword ptr [rax + 0x18], rcx
01887 48894820                       mov        qword ptr [rax + 0x20], rcx
0188b 488bd0                         mov        rdx, rax
0188e 48b960f0710c4c7f0000           movabs     rcx, 0x7f4c0c71f060
01898 488381a800000001               add        qword ptr [rcx + 0xa8], 1
018a0 ba02000000                     mov        edx, 2
018a5 48b9385d32e300000000           movabs     rcx, 0xe3325d38
018af 488bf0                         mov        rsi, rax
018b2 48898424a0020000               mov        qword ptr [rsp + 0x2a0], rax
018ba 0f1f440000                     nop        dword ptr [rax + rax]
018bf e81ceb5007                     call       0x7f4c1b90fe60
018c4 0f1f8400bc19000c               nop        dword ptr [rax + rax + 0xc0019bc]
018cc 488b8424a0020000               mov        rax, qword ptr [rsp + 0x2a0]
018d4 e919080000                     jmp        0x7f4c14401b72
018d9 0f1f8000000000                 nop        dword ptr [rax]
018e0 e9d4070000                     jmp        0x7f4c14401b39
018e5 90                             nop        
018e6 90                             nop        
018e7 90                             nop        
018e8 90                             nop        
018e9 90                             nop        
018ea 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
018f1 0f85d1070000                   jne        0x7f4c14401b48
018f7 498b87b0010000                 mov        rax, qword ptr [r15 + 0x1b0]
018fe 488d7828                       lea        rdi, [rax + 0x28]
01902 493bbfc0010000                 cmp        rdi, qword ptr [r15 + 0x1c0]
01909 0f87b9070000                   ja         0x7f4c14401b48
0190f 4989bfb0010000                 mov        qword ptr [r15 + 0x1b0], rdi
01916 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0191d 488908                         mov        qword ptr [rax], rcx
01920 4833c9                         xor        rcx, rcx
01923 48894808                       mov        qword ptr [rax + 8], rcx
01927 48894810                       mov        qword ptr [rax + 0x10], rcx
0192b 48894818                       mov        qword ptr [rax + 0x18], rcx
0192f 48894820                       mov        qword ptr [rax + 0x20], rcx
01933 488bd0                         mov        rdx, rax
01936 48b90050720c4c7f0000           movabs     rcx, 0x7f4c0c725000
01940 488381c800000001               add        qword ptr [rcx + 0xc8], 1
01948 ba02000000                     mov        edx, 2
0194d 48b9185e32e300000000           movabs     rcx, 0xe3325e18
01957 488bf0                         mov        rsi, rax
0195a 48898424a8020000               mov        qword ptr [rsp + 0x2a8], rax
01962 0f1f440000                     nop        dword ptr [rax + rax]
01967 e874ea5007                     call       0x7f4c1b90fe60
0196c 0f1f8400641a000d               nop        dword ptr [rax + rax + 0xd001a64]
01974 488b8424a8020000               mov        rax, qword ptr [rsp + 0x2a8]
0197c e971070000                     jmp        0x7f4c14401b72
01981 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
01988 55                             push       rbp
01989 4881ecc0020000                 sub        rsp, 0x2c0
01990 41817f2000000000               cmp        dword ptr [r15 + 0x20], 0
01998 7405                           je         0x7f4c1440141f
0199a e881e64f07                     call       0x7f4c1b8ffaa0
0199f bfe8010000                     mov        edi, 0x1e8
019a4 4863ff                         movsxd     rdi, edi
019a7 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
019ab 48899c2440010000               mov        qword ptr [rsp + 0x140], rbx
019b3 bfe0010000                     mov        edi, 0x1e0
019b8 4863ff                         movsxd     rdi, edi
019bb 8b043e                         mov        eax, dword ptr [rsi + rdi]
019be 89842490010000                 mov        dword ptr [rsp + 0x190], eax
019c5 bfd8010000                     mov        edi, 0x1d8
019ca 4863ff                         movsxd     rdi, edi
019cd 8b143e                         mov        edx, dword ptr [rsi + rdi]
019d0 bfd0010000                     mov        edi, 0x1d0
019d5 4863ff                         movsxd     rdi, edi
019d8 488b0c3e                       mov        rcx, qword ptr [rsi + rdi]
019dc bfc8010000                     mov        edi, 0x1c8
019e1 4863ff                         movsxd     rdi, edi
019e4 4c8b043e                       mov        r8, qword ptr [rsi + rdi]
019e8 bfc0010000                     mov        edi, 0x1c0
019ed 4863ff                         movsxd     rdi, edi
019f0 448b0c3e                       mov        r9d, dword ptr [rsi + rdi]
019f4 bfb8010000                     mov        edi, 0x1b8
019f9 4863ff                         movsxd     rdi, edi
019fc 448b1c3e                       mov        r11d, dword ptr [rsi + rdi]
01a00 bfa0010000                     mov        edi, 0x1a0
01a05 4863ff                         movsxd     rdi, edi
01a08 448b2c3e                       mov        r13d, dword ptr [rsi + rdi]
01a0c bf98010000                     mov        edi, 0x198
01a11 4863ff                         movsxd     rdi, edi
01a14 448b343e                       mov        r14d, dword ptr [rsi + rdi]
01a18 bf88010000                     mov        edi, 0x188
01a1d 4863ff                         movsxd     rdi, edi
01a20 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
01a24 48899c2448010000               mov        qword ptr [rsp + 0x148], rbx
01a2c bf78010000                     mov        edi, 0x178
01a31 4863ff                         movsxd     rdi, edi
01a34 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
01a38 48899c2450010000               mov        qword ptr [rsp + 0x150], rbx
01a40 bf70010000                     mov        edi, 0x170
01a45 4863ff                         movsxd     rdi, edi
01a48 8b3c3e                         mov        edi, dword ptr [rsi + rdi]
01a4b bb68010000                     mov        ebx, 0x168
01a50 4863db                         movsxd     rbx, ebx
01a53 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01a56 899c2458010000                 mov        dword ptr [rsp + 0x158], ebx
01a5d bb60010000                     mov        ebx, 0x160
01a62 4863db                         movsxd     rbx, ebx
01a65 488b1c1e                       mov        rbx, qword ptr [rsi + rbx]
01a69 48899c2460010000               mov        qword ptr [rsp + 0x160], rbx
01a71 bb58010000                     mov        ebx, 0x158
01a76 4863db                         movsxd     rbx, ebx
01a79 488b1c1e                       mov        rbx, qword ptr [rsi + rbx]
01a7d 48899c2468010000               mov        qword ptr [rsp + 0x168], rbx
01a85 bb50010000                     mov        ebx, 0x150
01a8a 4863db                         movsxd     rbx, ebx
01a8d 488b1c1e                       mov        rbx, qword ptr [rsi + rbx]
01a91 48899c2470010000               mov        qword ptr [rsp + 0x170], rbx
01a99 bb28010000                     mov        ebx, 0x128
01a9e 4863db                         movsxd     rbx, ebx
01aa1 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01aa4 899c245c010000                 mov        dword ptr [rsp + 0x15c], ebx
01aab bb20010000                     mov        ebx, 0x120
01ab0 4863db                         movsxd     rbx, ebx
01ab3 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01ab6 899c2478010000                 mov        dword ptr [rsp + 0x178], ebx
01abd bb18010000                     mov        ebx, 0x118
01ac2 4863db                         movsxd     rbx, ebx
01ac5 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01ac8 899c247c010000                 mov        dword ptr [rsp + 0x17c], ebx
01acf bb10010000                     mov        ebx, 0x110
01ad4 4863db                         movsxd     rbx, ebx
01ad7 488b1c1e                       mov        rbx, qword ptr [rsi + rbx]
01adb 48899c2480010000               mov        qword ptr [rsp + 0x180], rbx
01ae3 bb08010000                     mov        ebx, 0x108
01ae8 4863db                         movsxd     rbx, ebx
01aeb 488b1c1e                       mov        rbx, qword ptr [rsi + rbx]
01aef 48899c2488010000               mov        qword ptr [rsp + 0x188], rbx
01af7 bbf8000000                     mov        ebx, 0xf8
01afc 4863db                         movsxd     rbx, ebx
01aff 488b041e                       mov        rax, qword ptr [rsi + rbx]
01b03 bbf0000000                     mov        ebx, 0xf0
01b08 4863db                         movsxd     rbx, ebx
01b0b 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01b0e 899c2494010000                 mov        dword ptr [rsp + 0x194], ebx
01b15 bbe8000000                     mov        ebx, 0xe8
01b1a 4863db                         movsxd     rbx, ebx
01b1d 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01b20 899c2498010000                 mov        dword ptr [rsp + 0x198], ebx
01b27 bbe0000000                     mov        ebx, 0xe0
01b2c 4863db                         movsxd     rbx, ebx
01b2f 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01b32 899c249c010000                 mov        dword ptr [rsp + 0x19c], ebx
01b39 bbd8000000                     mov        ebx, 0xd8
01b3e 4863db                         movsxd     rbx, ebx
01b41 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01b44 899c24a0010000                 mov        dword ptr [rsp + 0x1a0], ebx
01b4b bbd0000000                     mov        ebx, 0xd0
01b50 4863db                         movsxd     rbx, ebx
01b53 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01b56 89bc24a4010000                 mov        dword ptr [rsp + 0x1a4], edi
01b5d 488bfe                         mov        rdi, rsi
01b60 899424c4010000                 mov        dword ptr [rsp + 0x1c4], edx
01b67 48898c24d0010000               mov        qword ptr [rsp + 0x1d0], rcx
01b6f 4c898424c8010000               mov        qword ptr [rsp + 0x1c8], r8
01b77 44898c24c0010000               mov        dword ptr [rsp + 0x1c0], r9d
01b7f 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
01b87 4489ac24b8010000               mov        dword ptr [rsp + 0x1b8], r13d
01b8f 4489b424ac010000               mov        dword ptr [rsp + 0x1ac], r14d
01b97 48898424b0010000               mov        qword ptr [rsp + 0x1b0], rax
01b9f 899c24a8010000                 mov        dword ptr [rsp + 0x1a8], ebx
01ba6 e815728020                     call       0x7f4c34c08840
01bab 0f1f840000000000               nop        dword ptr [rax + rax]
01bb3 8b9c24a8010000                 mov        ebx, dword ptr [rsp + 0x1a8]
01bba 4c8beb                         mov        r13, rbx
01bbd 8b9c24a0010000                 mov        ebx, dword ptr [rsp + 0x1a0]
01bc4 488bf3                         mov        rsi, rbx
01bc7 8b9c249c010000                 mov        ebx, dword ptr [rsp + 0x19c]
01bce 488bd3                         mov        rdx, rbx
01bd1 8b9c2498010000                 mov        ebx, dword ptr [rsp + 0x198]
01bd8 4c8bf3                         mov        r14, rbx
01bdb 8b9c2494010000                 mov        ebx, dword ptr [rsp + 0x194]
01be2 488bc3                         mov        rax, rbx
01be5 488b8c24b0010000               mov        rcx, qword ptr [rsp + 0x1b0]
01bed 4c8bc9                         mov        r9, rcx
01bf0 488b9c2488010000               mov        rbx, qword ptr [rsp + 0x188]
01bf8 488bcb                         mov        rcx, rbx
01bfb 488b9c2480010000               mov        rbx, qword ptr [rsp + 0x180]
01c03 8bbc247c010000                 mov        edi, dword ptr [rsp + 0x17c]
01c0a 4c8bdf                         mov        r11, rdi
01c0d 8bbc2478010000                 mov        edi, dword ptr [rsp + 0x178]
01c14 448b84245c010000               mov        r8d, dword ptr [rsp + 0x15c]
01c1c 89b424d8010000                 mov        dword ptr [rsp + 0x1d8], esi
01c23 488bb42470010000               mov        rsi, qword ptr [rsp + 0x170]
01c2b 4889b42438010000               mov        qword ptr [rsp + 0x138], rsi
01c33 488bb42468010000               mov        rsi, qword ptr [rsp + 0x168]
01c3b 4889b424e0000000               mov        qword ptr [rsp + 0xe0], rsi
01c43 488bb42460010000               mov        rsi, qword ptr [rsp + 0x160]
01c4b 4889b424e8000000               mov        qword ptr [rsp + 0xe8], rsi
01c53 8bb42458010000                 mov        esi, dword ptr [rsp + 0x158]
01c5a 89b424f0000000                 mov        dword ptr [rsp + 0xf0], esi
01c61 8bb424a4010000                 mov        esi, dword ptr [rsp + 0x1a4]
01c68 89b424f4000000                 mov        dword ptr [rsp + 0xf4], esi
01c6f 488bb42450010000               mov        rsi, qword ptr [rsp + 0x150]
01c77 4889b424f8000000               mov        qword ptr [rsp + 0xf8], rsi
01c7f 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
01c87 4889b42400010000               mov        qword ptr [rsp + 0x100], rsi
01c8f 8bb424ac010000                 mov        esi, dword ptr [rsp + 0x1ac]
01c96 89b42408010000                 mov        dword ptr [rsp + 0x108], esi
01c9d 8bb424b8010000                 mov        esi, dword ptr [rsp + 0x1b8]
01ca4 89b4240c010000                 mov        dword ptr [rsp + 0x10c], esi
01cab 8bb424bc010000                 mov        esi, dword ptr [rsp + 0x1bc]
01cb2 89b42410010000                 mov        dword ptr [rsp + 0x110], esi
01cb9 8bb424c0010000                 mov        esi, dword ptr [rsp + 0x1c0]
01cc0 89b42414010000                 mov        dword ptr [rsp + 0x114], esi
01cc7 488bb424c8010000               mov        rsi, qword ptr [rsp + 0x1c8]
01ccf 4889b42418010000               mov        qword ptr [rsp + 0x118], rsi
01cd7 488bb424d0010000               mov        rsi, qword ptr [rsp + 0x1d0]
01cdf 4889b42420010000               mov        qword ptr [rsp + 0x120], rsi
01ce7 8bb424c4010000                 mov        esi, dword ptr [rsp + 0x1c4]
01cee 89b42428010000                 mov        dword ptr [rsp + 0x128], esi
01cf5 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
01cfc 89b4242c010000                 mov        dword ptr [rsp + 0x12c], esi
01d03 488bb42440010000               mov        rsi, qword ptr [rsp + 0x140]
01d0b 4889b42430010000               mov        qword ptr [rsp + 0x130], rsi
01d13 898424dc010000                 mov        dword ptr [rsp + 0x1dc], eax
01d1a 4c898c24e0010000               mov        qword ptr [rsp + 0x1e0], r9
01d22 48898c24f0010000               mov        qword ptr [rsp + 0x1f0], rcx
01d2a 48899c24e8010000               mov        qword ptr [rsp + 0x1e8], rbx
01d32 4c8b8c2438010000               mov        r9, qword ptr [rsp + 0x138]
01d3a 488b8424e0000000               mov        rax, qword ptr [rsp + 0xe0]
01d42 488b9c24e8000000               mov        rbx, qword ptr [rsp + 0xe8]
01d4a 8bb42414010000                 mov        esi, dword ptr [rsp + 0x114]
01d51 e942eaffff                     jmp        0x7f4c14400218
01d56 49ba403f710c4c7f0000           movabs     r10, 0x7f4c0c713f40
01d60 4c89542408                     mov        qword ptr [rsp + 8], r10
01d65 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01d6d e86e555d07                     call       0x7f4c1b9d6d60
01d72 e9e6e2ffff                     jmp        0x7f4c143ffadd
01d77 e8e4f55c07                     call       0x7f4c1b9d0de0
01d7c e8dff55c07                     call       0x7f4c1b9d0de0
01d81 48891c24                       mov        qword ptr [rsp], rbx
01d85 4889742408                     mov        qword ptr [rsp + 8], rsi
01d8a e8d1ec5c07                     call       0x7f4c1b9d04e0
01d8f 49ba4813710c4c7f0000           movabs     r10, 0x7f4c0c711348
01d99 4c89542408                     mov        qword ptr [rsp + 8], r10
01d9e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01da6 e835555d07                     call       0x7f4c1b9d6d60
01dab e92de3ffff                     jmp        0x7f4c143ffb5d
01db0 e8abf55c07                     call       0x7f4c1b9d0de0
01db5 e8a6f55c07                     call       0x7f4c1b9d0de0
01dba e8a1f55c07                     call       0x7f4c1b9d0de0
01dbf e89cf55c07                     call       0x7f4c1b9d0de0
01dc4 49ba5015710c4c7f0000           movabs     r10, 0x7f4c0c711550
01dce 4c89542408                     mov        qword ptr [rsp + 8], r10
01dd3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01ddb e800555d07                     call       0x7f4c1b9d6d60
01de0 e9ade4ffff                     jmp        0x7f4c143ffd12
01de5 49ba5015710c4c7f0000           movabs     r10, 0x7f4c0c711550
01def 4c89542408                     mov        qword ptr [rsp + 8], r10
01df4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01dfc e8df545d07                     call       0x7f4c1b9d6d60
01e01 e94be5ffff                     jmp        0x7f4c143ffdd1
01e06 49ba9814710c4c7f0000           movabs     r10, 0x7f4c0c711498
01e10 4c89542408                     mov        qword ptr [rsp + 8], r10
01e15 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01e1d e8be545d07                     call       0x7f4c1b9d6d60
01e22 e9c7e6ffff                     jmp        0x7f4c143fff6e
01e27 49ba9814710c4c7f0000           movabs     r10, 0x7f4c0c711498
01e31 4c89542408                     mov        qword ptr [rsp + 8], r10
01e36 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01e3e e89d545d07                     call       0x7f4c1b9d6d60
01e43 e95fe7ffff                     jmp        0x7f4c14400027
01e48 e813f55c07                     call       0x7f4c1b9d0de0
01e4d e80ef55c07                     call       0x7f4c1b9d0de0
01e52 e809f55c07                     call       0x7f4c1b9d0de0
01e57 e804f55c07                     call       0x7f4c1b9d0de0
01e5c e8fff45c07                     call       0x7f4c1b9d0de0
01e61 e8faf45c07                     call       0x7f4c1b9d0de0
01e66 e8f5f45c07                     call       0x7f4c1b9d0de0
01e6b 4c892c24                       mov        qword ptr [rsp], r13
01e6f 48894c2408                     mov        qword ptr [rsp + 8], rcx
01e74 e8e7eb5c07                     call       0x7f4c1b9d04e0
01e79 e8e2f45c07                     call       0x7f4c1b9d0de0
01e7e e8ddf45c07                     call       0x7f4c1b9d0de0
01e83 e8d8f45c07                     call       0x7f4c1b9d0de0
01e88 4c892c24                       mov        qword ptr [rsp], r13
01e8c 48894c2408                     mov        qword ptr [rsp + 8], rcx
01e91 e8caeb5c07                     call       0x7f4c1b9d04e0
01e96 e8c5f45c07                     call       0x7f4c1b9d0de0
01e9b e8c0f45c07                     call       0x7f4c1b9d0de0
01ea0 e8bbf45c07                     call       0x7f4c1b9d0de0
01ea5 4c892c24                       mov        qword ptr [rsp], r13
01ea9 48894c2408                     mov        qword ptr [rsp + 8], rcx
01eae e8adeb5c07                     call       0x7f4c1b9d04e0
01eb3 49ba5015710c4c7f0000           movabs     r10, 0x7f4c0c711550
01ebd 4c89542408                     mov        qword ptr [rsp + 8], r10
01ec2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01eca e811545d07                     call       0x7f4c1b9d6d60
01ecf e9c2ecffff                     jmp        0x7f4c14400616
01ed4 49ba5015710c4c7f0000           movabs     r10, 0x7f4c0c711550
01ede 4c89542408                     mov        qword ptr [rsp + 8], r10
01ee3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01eeb e8f0535d07                     call       0x7f4c1b9d6d60
01ef0 e955edffff                     jmp        0x7f4c144006ca
01ef5 49ba5015710c4c7f0000           movabs     r10, 0x7f4c0c711550
01eff 4c89542408                     mov        qword ptr [rsp + 8], r10
01f04 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01f0c e8cf535d07                     call       0x7f4c1b9d6d60
01f11 e932efffff                     jmp        0x7f4c144008c8
01f16 49ba5015710c4c7f0000           movabs     r10, 0x7f4c0c711550
01f20 4c89542408                     mov        qword ptr [rsp + 8], r10
01f25 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01f2d e8ae535d07                     call       0x7f4c1b9d6d60
01f32 e9caefffff                     jmp        0x7f4c14400981
01f37 49ba5015710c4c7f0000           movabs     r10, 0x7f4c0c711550
01f41 4c89542408                     mov        qword ptr [rsp + 8], r10
01f46 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01f4e e88d535d07                     call       0x7f4c1b9d6d60
01f53 e95cf0ffff                     jmp        0x7f4c14400a34
01f58 49ba5015710c4c7f0000           movabs     r10, 0x7f4c0c711550
01f62 4c89542408                     mov        qword ptr [rsp + 8], r10
01f67 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01f6f e86c535d07                     call       0x7f4c1b9d6d60
01f74 e9ebf0ffff                     jmp        0x7f4c14400ae4
01f79 49ba9814710c4c7f0000           movabs     r10, 0x7f4c0c711498
01f83 4c89542408                     mov        qword ptr [rsp + 8], r10
01f88 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01f90 e84b535d07                     call       0x7f4c1b9d6d60
01f95 e9e9f2ffff                     jmp        0x7f4c14400d03
01f9a 49ba9814710c4c7f0000           movabs     r10, 0x7f4c0c711498
01fa4 4c89542408                     mov        qword ptr [rsp + 8], r10
01fa9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01fb1 e82a535d07                     call       0x7f4c1b9d6d60
01fb6 e96ff3ffff                     jmp        0x7f4c14400daa
01fbb 49ba403f710c4c7f0000           movabs     r10, 0x7f4c0c713f40
01fc5 4c89542408                     mov        qword ptr [rsp + 8], r10
01fca 48c70424a9030000               mov        qword ptr [rsp], 0x3a9
01fd2 e809535d07                     call       0x7f4c1b9d6d60
01fd7 e90ff4ffff                     jmp        0x7f4c14400e6b
01fdc e87ff35c07                     call       0x7f4c1b9d0de0
01fe1 e87af35c07                     call       0x7f4c1b9d0de0
01fe6 49ba888a700c4c7f0000           movabs     r10, 0x7f4c0c708a88
01ff0 4c89542408                     mov        qword ptr [rsp + 8], r10
01ff5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01ffd e8de525d07                     call       0x7f4c1b9d6d60
02002 e9eaf5ffff                     jmp        0x7f4c14401071
02007 49ba4a1140144c7f0000           movabs     r10, 0x7f4c1440114a
02011 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02018 e943145107                     jmp        0x7f4c1b912ee0
0201d 49bad41140144c7f0000           movabs     r10, 0x7f4c144011d4
02027 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0202e e92d145107                     jmp        0x7f4c1b912ee0
02033 48ba0000000000000000           movabs     rdx, 0
0203d b8000f050a                     mov        eax, 0xa050f00
02042 e8993d5d07                     call       0x7f4c1b9d5860
02047 e914f7ffff                     jmp        0x7f4c144011e0
0204c e80ff35c07                     call       0x7f4c1b9d0de0
02051 488bd2                         mov        rdx, rdx
02054 e887005d07                     call       0x7f4c1b9d1b60
02059 e955f7ffff                     jmp        0x7f4c14401233
0205e 49bac055710c4c7f0000           movabs     r10, 0x7f4c0c7155c0
02068 4c89542408                     mov        qword ptr [rsp + 8], r10
0206d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
02075 e866525d07                     call       0x7f4c1b9d6d60
0207a e9b5f7ffff                     jmp        0x7f4c144012b4
0207f 48ba0000000000000000           movabs     rdx, 0
02089 b8000f050a                     mov        eax, 0xa050f00
0208e e84d3d5d07                     call       0x7f4c1b9d5860
02093 e9a0f7ffff                     jmp        0x7f4c144012b8
02098 e8c3f25c07                     call       0x7f4c1b9d0de0
0209d 488bd2                         mov        rdx, rdx
020a0 e83b005d07                     call       0x7f4c1b9d1b60
020a5 e9e1f7ffff                     jmp        0x7f4c1440130b
020aa 48ba0000000000000000           movabs     rdx, 0
020b4 b8000f050a                     mov        eax, 0xa050f00
020b9 e8223d5d07                     call       0x7f4c1b9d5860
020be e91df8ffff                     jmp        0x7f4c14401360
020c3 e898f25c07                     call       0x7f4c1b9d0de0
020c8 488bd2                         mov        rdx, rdx
020cb e810005d07                     call       0x7f4c1b9d1b60
020d0 e95ef8ffff                     jmp        0x7f4c144013b3
020d5 498b8778050000                 mov        rax, qword ptr [r15 + 0x578]
020dc 49c7877805000000000000         mov        qword ptr [r15 + 0x578], 0
020e7 49c7878005000000000000         mov        qword ptr [r15 + 0x580], 0
020f2 4881c4c0020000                 add        rsp, 0x2c0
020f9 5d                             pop        rbp
020fa e961e35c07                     jmp        0x7f4c1b9cfee0
020ff f4                             hlt        
