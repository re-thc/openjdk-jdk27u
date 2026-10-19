00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ecd0010000                 sub        rsp, 0x1d0
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 7405                           je         0x7f345c153d9f
0001a e841b45c07                     call       0x7f346371f1e0
0001f 4889742468                     mov        qword ptr [rsp + 0x68], rsi
00024 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00028 4c89442470                     mov        qword ptr [rsp + 0x70], r8
0002d 4c894c2478                     mov        qword ptr [rsp + 0x78], r9
00032 89bc2480000000                 mov        dword ptr [rsp + 0x80], edi
00039 48bbb0a76350347f0000           movabs     rbx, 0x7f345063a7b0
00043 8b4378                         mov        eax, dword ptr [rbx + 0x78]
00046 83c002                         add        eax, 2
00049 894378                         mov        dword ptr [rbx + 0x78], eax
0004c 25fe070000                     and        eax, 0x7fe
00051 85c0                           test       eax, eax
00053 0f8478190000                   je         0x7f345c155751
00059 488bda                         mov        rbx, rdx
0005c ffcb                           dec        ebx
0005e 3b5e04                         cmp        ebx, dword ptr [rsi + 4]
00061 0f83bd190000                   jae        0x7f345c1557a4
00067 4863db                         movsxd     rbx, ebx
0006a 0fbe5c1e08                     movsx      ebx, byte ptr [rsi + rbx + 8]
0006f 81e3ff000000                   and        ebx, 0xff
00075 85db                           test       ebx, ebx
00077 48b8b0a76350347f0000           movabs     rax, 0x7f345063a7b0
00081 41bbc0000000                   mov        r11d, 0xc0
00087 7406                           je         0x7f345c153e0f
00089 41bbb0000000                   mov        r11d, 0xb0
0008f 4e8b2c18                       mov        r13, qword ptr [rax + r11]
00093 4d8d6d01                       lea        r13, [r13 + 1]
00097 4e892c18                       mov        qword ptr [rax + r11], r13
0009b 0f8490180000                   je         0x7f345c1556b1
000a1 89542460                       mov        dword ptr [rsp + 0x60], edx
000a5 48b8b0a76350347f0000           movabs     rax, 0x7f345063a7b0
000af 488380e000000001               add        qword ptr [rax + 0xe0], 1
000b7 48b820756350347f0000           movabs     rax, 0x7f3450637520
000c1 448b5878                       mov        r11d, dword ptr [rax + 0x78]
000c5 4183c302                       add        r11d, 2
000c9 44895878                       mov        dword ptr [rax + 0x78], r11d
000cd 4181e3feff1f00                 and        r11d, 0x1ffffe
000d4 4585db                         test       r11d, r11d
000d7 0f8469190000                   je         0x7f345c1557c6
000dd 48b820756350347f0000           movabs     rax, 0x7f3450637520
000e7 488380b000000001               add        qword ptr [rax + 0xb0], 1
000ef 488bf3                         mov        rsi, rbx
000f2 90                             nop        
000f3 90                             nop        
000f4 90                             nop        
000f5 90                             nop        
000f6 90                             nop        
000f7 e8e4bd5d07                     call       0x7f346372fc60
000fc 0f1f8400f4010000               nop        dword ptr [rax + rax + 0x1f4]
00104 be1f000000                     mov        esi, 0x1f
00109 2bf0                           sub        esi, eax
0010b ba08000000                     mov        edx, 8
00110 2bd6                           sub        edx, esi
00112 8b742460                       mov        esi, dword ptr [rsp + 0x60]
00116 2b742464                       sub        esi, dword ptr [rsp + 0x64]
0011a c1e603                         shl        esi, 3
0011d 2bf2                           sub        esi, edx
0011f 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
00129 488381f000000001               add        qword ptr [rcx + 0xf0], 1
00131 89b42488000000                 mov        dword ptr [rsp + 0x88], esi
00138 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
0013d 89942484000000                 mov        dword ptr [rsp + 0x84], edx
00144 8b542464                       mov        edx, dword ptr [rsp + 0x64]
00148 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
0014c 90                             nop        
0014d 90                             nop        
0014e 90                             nop        
0014f e88cbd5d07                     call       0x7f346372fc60
00154 0f1f84004c020001               nop        dword ptr [rax + rax + 0x100024c]
0015c 48beb0a76350347f0000           movabs     rsi, 0x7f345063a7b0
00166 4883860001000001               add        qword ptr [rsi + 0x100], 1
0016e 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00172 83e908                         sub        ecx, 8
00175 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
0017a 8b542464                       mov        edx, dword ptr [rsp + 0x64]
0017e 4889842490000000               mov        qword ptr [rsp + 0x90], rax
00186 90                             nop        
00187 e854bd5d07                     call       0x7f346372fc60
0018c 0f1f840084020002               nop        dword ptr [rax + rax + 0x2000284]
00194 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00199 418b7818                       mov        edi, dword ptr [r8 + 0x18]
0019d 4c3b25749eb71f                 cmp        r12, qword ptr [rip + 0x1fb79e74]
001a4 0f8414000000                   je         0x7f345c153f3e
001aa 48bf2812da79347f0000           movabs     rdi, 0x7f3479da1228
001b4 4883e4f0                       and        rsp, 0xfffffffffffffff0
001b8 e82386f41e                     call       0x7f347b09c560
001bd f4                             hlt        
001be 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
001c6 418b581c                       mov        ebx, dword ptr [r8 + 0x1c]
001ca 4c3b25479eb71f                 cmp        r12, qword ptr [rip + 0x1fb79e47]
001d1 0f8414000000                   je         0x7f345c153f6b
001d7 48bf2812da79347f0000           movabs     rdi, 0x7f3479da1228
001e1 4883e4f0                       and        rsp, 0xfffffffffffffff0
001e5 e8f685f41e                     call       0x7f347b09c560
001ea f4                             hlt        
001eb 48899c24c0000000               mov        qword ptr [rsp + 0xc0], rbx
001f3 458b4820                       mov        r9d, dword ptr [r8 + 0x20]
001f7 4c3b251a9eb71f                 cmp        r12, qword ptr [rip + 0x1fb79e1a]
001fe 0f8414000000                   je         0x7f345c153f98
00204 48bf2812da79347f0000           movabs     rdi, 0x7f3479da1228
0020e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00212 e8c985f41e                     call       0x7f347b09c560
00217 f4                             hlt        
00218 4c898c24b0000000               mov        qword ptr [rsp + 0xb0], r9
00220 8b4f04                         mov        ecx, dword ptr [rdi + 4]
00223 8b7304                         mov        esi, dword ptr [rbx + 4]
00226 418b5104                       mov        edx, dword ptr [r9 + 4]
0022a 03ce                           add        ecx, esi
0022c 03ca                           add        ecx, edx
0022e 898c24a0000000                 mov        dword ptr [rsp + 0xa0], ecx
00235 be40000000                     mov        esi, 0x40
0023a 2bb42484000000                 sub        esi, dword ptr [rsp + 0x84]
00241 85c9                           test       ecx, ecx
00243 48bab0a76350347f0000           movabs     rdx, 0x7f345063a7b0
0024d 41bb10010000                   mov        r11d, 0x110
00253 7506                           jne        0x7f345c153fdb
00255 41bb20010000                   mov        r11d, 0x120
0025b 4e8b2c1a                       mov        r13, qword ptr [rdx + r11]
0025f 4d8d6d01                       lea        r13, [r13 + 1]
00263 4e892c1a                       mov        qword ptr [rdx + r11], r13
00267 0f8526000000                   jne        0x7f345c154013
0026d 48beb0a76350347f0000           movabs     rsi, 0x7f345063a7b0
00277 ff8630010000                   inc        dword ptr [rsi + 0x130]
0027d 41bb00000000                   mov        r11d, 0
00283 4c8be9                         mov        r13, rcx
00286 4c8bb42490000000               mov        r14, qword ptr [rsp + 0x90]
0028e e9b0010000                     jmp        0x7f345c1541c3
00293 3bce                           cmp        ecx, esi
00295 48bab0a76350347f0000           movabs     rdx, 0x7f345063a7b0
0029f 41bb48010000                   mov        r11d, 0x148
002a5 7f06                           jg         0x7f345c15402d
002a7 41bb58010000                   mov        r11d, 0x158
002ad 4e8b2c1a                       mov        r13, qword ptr [rdx + r11]
002b1 4d8d6d01                       lea        r13, [r13 + 1]
002b5 4e892c1a                       mov        qword ptr [rdx + r11], r13
002b9 0f8fc5000000                   jg         0x7f345c154104
002bf 2bf1                           sub        esi, ecx
002c1 4c8be9                         mov        r13, rcx
002c4 488bce                         mov        rcx, rsi
002c7 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
002cf 48d3ee                         shr        rsi, cl
002d2 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
002dc 4883816801000001               add        qword ptr [rcx + 0x168], 1
002e4 48b9f0f86250347f0000           movabs     rcx, 0x7f345062f8f0
002ee 8b5178                         mov        edx, dword ptr [rcx + 0x78]
002f1 83c202                         add        edx, 2
002f4 895178                         mov        dword ptr [rcx + 0x78], edx
002f7 81e2feff1f00                   and        edx, 0x1ffffe
002fd 85d2                           test       edx, edx
002ff 0f84c6170000                   je         0x7f345c15584b
00305 4183fd40                       cmp        r13d, 0x40
00309 48b9f0f86250347f0000           movabs     rcx, 0x7f345062f8f0
00313 bab0000000                     mov        edx, 0xb0
00318 7c05                           jl         0x7f345c15409f
0031a bac0000000                     mov        edx, 0xc0
0031f 4c8b1c11                       mov        r11, qword ptr [rcx + rdx]
00323 4d8d5b01                       lea        r11, [r11 + 1]
00327 4c891c11                       mov        qword ptr [rcx + rdx], r11
0032b 0f8c1c000000                   jl         0x7f345c1540cd
00331 48b9f0f86250347f0000           movabs     rcx, 0x7f345062f8f0
0033b ff81d0000000                   inc        dword ptr [rcx + 0xd0]
00341 48c7c2ffffffff                 mov        rdx, 0xffffffffffffffff
00348 e914000000                     jmp        0x7f345c1540e1
0034d ba01000000                     mov        edx, 1
00352 498bcd                         mov        rcx, r13
00355 4c8bda                         mov        r11, rdx
00358 49d3e3                         shl        r11, cl
0035b 4c2bda                         sub        r11, rdx
0035e 498bd3                         mov        rdx, r11
00361 4823d6                         and        rdx, rsi
00364 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
0036e ff8178010000                   inc        dword ptr [rcx + 0x178]
00374 4c8bda                         mov        r11, rdx
00377 4c8bb42490000000               mov        r14, qword ptr [rsp + 0x90]
0037f e9bf000000                     jmp        0x7f345c1541c3
00384 4c8be9                         mov        r13, rcx
00387 498bd5                         mov        rdx, r13
0038a 2bd6                           sub        edx, esi
0038c 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
00396 4883819001000001               add        qword ptr [rcx + 0x190], 1
0039e 48b9f0f86250347f0000           movabs     rcx, 0x7f345062f8f0
003a8 448b5978                       mov        r11d, dword ptr [rcx + 0x78]
003ac 4183c302                       add        r11d, 2
003b0 44895978                       mov        dword ptr [rcx + 0x78], r11d
003b4 4181e3feff1f00                 and        r11d, 0x1ffffe
003bb 4585db                         test       r11d, r11d
003be 0f8428170000                   je         0x7f345c15586c
003c4 83fe40                         cmp        esi, 0x40
003c7 48b9f0f86250347f0000           movabs     rcx, 0x7f345062f8f0
003d1 41bbb0000000                   mov        r11d, 0xb0
003d7 7c06                           jl         0x7f345c15415f
003d9 41bbc0000000                   mov        r11d, 0xc0
003df 4e8b3419                       mov        r14, qword ptr [rcx + r11]
003e3 4d8d7601                       lea        r14, [r14 + 1]
003e7 4e893419                       mov        qword ptr [rcx + r11], r14
003eb 0f8c1c000000                   jl         0x7f345c15418d
003f1 48b9f0f86250347f0000           movabs     rcx, 0x7f345062f8f0
003fb ff81d0000000                   inc        dword ptr [rcx + 0xd0]
00401 48c7c6ffffffff                 mov        rsi, 0xffffffffffffffff
00408 e912000000                     jmp        0x7f345c15419f
0040d 41bb01000000                   mov        r11d, 1
00413 488bce                         mov        rcx, rsi
00416 498bf3                         mov        rsi, r11
00419 48d3e6                         shl        rsi, cl
0041c 492bf3                         sub        rsi, r11
0041f 4c8bb42490000000               mov        r14, qword ptr [rsp + 0x90]
00427 4923f6                         and        rsi, r14
0042a 488bca                         mov        rcx, rdx
0042d 48d3e6                         shl        rsi, cl
00430 b940000000                     mov        ecx, 0x40
00435 2bca                           sub        ecx, edx
00437 488bd0                         mov        rdx, rax
0043a 48d3ea                         shr        rdx, cl
0043d 480bf2                         or         rsi, rdx
00440 4c8bde                         mov        r11, rsi
00443 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
0044a 4103d5                         add        edx, r13d
0044d 83fa40                         cmp        edx, 0x40
00450 48beb0a76350347f0000           movabs     rsi, 0x7f345063a7b0
0045a b9b0010000                     mov        ecx, 0x1b0
0045f 7d05                           jge        0x7f345c1541e6
00461 b9a0010000                     mov        ecx, 0x1a0
00466 488b3c0e                       mov        rdi, qword ptr [rsi + rcx]
0046a 488d7f01                       lea        rdi, [rdi + 1]
0046e 48893c0e                       mov        qword ptr [rsi + rcx], rdi
00472 0f8d14000000                   jge        0x7f345c15420c
00478 498bf6                         mov        rsi, r14
0047b 8b7c2460                       mov        edi, dword ptr [rsp + 0x60]
0047f 4c899c24b8000000               mov        qword ptr [rsp + 0xb8], r11
00487 e97e000000                     jmp        0x7f345c15428a
0048c 4c899c24b8000000               mov        qword ptr [rsp + 0xb8], r11
00494 48898424a8000000               mov        qword ptr [rsp + 0xa8], rax
0049c 83ea40                         sub        edx, 0x40
0049f 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
004a4 4183ed08                       sub        r13d, 8
004a8 48beb0a76350347f0000           movabs     rsi, 0x7f345063a7b0
004b2 488386c001000001               add        qword ptr [rsi + 0x1c0], 1
004ba 4d8bf5                         mov        r14, r13
004bd 4183ee08                       sub        r14d, 8
004c1 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
004c6 8994248c000000                 mov        dword ptr [rsp + 0x8c], edx
004cd 8b542464                       mov        edx, dword ptr [rsp + 0x64]
004d1 498bce                         mov        rcx, r14
004d4 4489ac24a4000000               mov        dword ptr [rsp + 0xa4], r13d
004dc 90                             nop        
004dd 90                             nop        
004de 90                             nop        
004df e8fcb95d07                     call       0x7f346372fc60
004e4 0f1f8400dc050003               nop        dword ptr [rax + rax + 0x30005dc]
004ec 8b94248c000000                 mov        edx, dword ptr [rsp + 0x8c]
004f3 488bb424a8000000               mov        rsi, qword ptr [rsp + 0xa8]
004fb 8bbc24a4000000                 mov        edi, dword ptr [rsp + 0xa4]
00502 4c8b8c24b0000000               mov        r9, qword ptr [rsp + 0xb0]
0050a 418b5904                       mov        ebx, dword ptr [r9 + 4]
0050e 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
00518 488381d001000001               add        qword ptr [rcx + 0x1d0], 1
00520 48b9887a6350347f0000           movabs     rcx, 0x7f3450637a88
0052a 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
0052e 4183c002                       add        r8d, 2
00532 44894178                       mov        dword ptr [rcx + 0x78], r8d
00536 4181e0feff1f00                 and        r8d, 0x1ffffe
0053d 4585c0                         test       r8d, r8d
00540 0f84c7150000                   je         0x7f345c15588d
00546 83fb20                         cmp        ebx, 0x20
00549 48b9887a6350347f0000           movabs     rcx, 0x7f3450637a88
00553 41b8b0000000                   mov        r8d, 0xb0
00559 7c06                           jl         0x7f345c1542e1
0055b 41b8c0000000                   mov        r8d, 0xc0
00561 4e8b1c01                       mov        r11, qword ptr [rcx + r8]
00565 4d8d5b01                       lea        r11, [r11 + 1]
00569 4e891c01                       mov        qword ptr [rcx + r8], r11
0056d 0f8c1b000000                   jl         0x7f345c15430e
00573 48b9887a6350347f0000           movabs     rcx, 0x7f3450637a88
0057d ff81d0000000                   inc        dword ptr [rcx + 0xd0]
00583 41b8ffffffff                   mov        r8d, 0xffffffff
00589 e90f000000                     jmp        0x7f345c15431d
0058e 488bcb                         mov        rcx, rbx
00591 41b801000000                   mov        r8d, 1
00597 41d3e0                         shl        r8d, cl
0059a 41ffc8                         dec        r8d
0059d 89bc24c8000000                 mov        dword ptr [rsp + 0xc8], edi
005a4 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
005ac 4c8bac24c0000000               mov        r13, qword ptr [rsp + 0xc0]
005b4 4d63c0                         movsxd     r8, r8d
005b7 4d23c3                         and        r8, r11
005ba 458bc0                         mov        r8d, r8d
005bd 488bcb                         mov        rcx, rbx
005c0 49d3eb                         shr        r11, cl
005c3 418b5d04                       mov        ebx, dword ptr [r13 + 4]
005c7 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
005d1 488381e001000001               add        qword ptr [rcx + 0x1e0], 1
005d9 48b9887a6350347f0000           movabs     rcx, 0x7f3450637a88
005e3 448b7178                       mov        r14d, dword ptr [rcx + 0x78]
005e7 4183c602                       add        r14d, 2
005eb 44897178                       mov        dword ptr [rcx + 0x78], r14d
005ef 4181e6feff1f00                 and        r14d, 0x1ffffe
005f6 4585f6                         test       r14d, r14d
005f9 0f842f150000                   je         0x7f345c1558ae
005ff 83fb20                         cmp        ebx, 0x20
00602 48b9887a6350347f0000           movabs     rcx, 0x7f3450637a88
0060c 41beb0000000                   mov        r14d, 0xb0
00612 7c06                           jl         0x7f345c15439a
00614 41bec0000000                   mov        r14d, 0xc0
0061a 4a8b3c31                       mov        rdi, qword ptr [rcx + r14]
0061e 488d7f01                       lea        rdi, [rdi + 1]
00622 4a893c31                       mov        qword ptr [rcx + r14], rdi
00626 0f8c1a000000                   jl         0x7f345c1543c6
0062c 48b9887a6350347f0000           movabs     rcx, 0x7f3450637a88
00636 ff81d0000000                   inc        dword ptr [rcx + 0xd0]
0063c bfffffffff                     mov        edi, 0xffffffff
00641 e90c000000                     jmp        0x7f345c1543d2
00646 488bcb                         mov        rcx, rbx
00649 bf01000000                     mov        edi, 1
0064e d3e7                           shl        edi, cl
00650 ffcf                           dec        edi
00652 4889b424d0000000               mov        qword ptr [rsp + 0xd0], rsi
0065a 488b8c2498000000               mov        rcx, qword ptr [rsp + 0x98]
00662 4c8b742478                     mov        r14, qword ptr [rsp + 0x78]
00667 4863ff                         movsxd     rdi, edi
0066a 4923fb                         and        rdi, r11
0066d 8bff                           mov        edi, edi
0066f 488bf1                         mov        rsi, rcx
00672 488bcb                         mov        rcx, rbx
00675 49d3eb                         shr        r11, cl
00678 458bdb                         mov        r11d, r11d
0067b 418b9ef0000000                 mov        ebx, dword ptr [r14 + 0xf0]
00682 4c3b258f99b71f                 cmp        r12, qword ptr [rip + 0x1fb7998f]
00689 0f8414000000                   je         0x7f345c154423
0068f 48bf2812da79347f0000           movabs     rdi, 0x7f3479da1228
00699 4883e4f0                       and        rsp, 0xfffffffffffffff0
0069d e83e81f41e                     call       0x7f347b09c560
006a2 f4                             hlt        
006a3 48899c24d8000000               mov        qword ptr [rsp + 0xd8], rbx
006ab 418b8ef4000000                 mov        ecx, dword ptr [r14 + 0xf4]
006b2 4c3b255f99b71f                 cmp        r12, qword ptr [rip + 0x1fb7995f]
006b9 0f8414000000                   je         0x7f345c154453
006bf 48bf2812da79347f0000           movabs     rdi, 0x7f3479da1228
006c9 4883e4f0                       and        rsp, 0xfffffffffffffff0
006cd e80e81f41e                     call       0x7f347b09c560
006d2 f4                             hlt        
006d3 48898c2410010000               mov        qword ptr [rsp + 0x110], rcx
006db 418b5e04                       mov        ebx, dword ptr [r14 + 4]
006df 899c24cc000000                 mov        dword ptr [rsp + 0xcc], ebx
006e6 8b5e14                         mov        ebx, dword ptr [rsi + 0x14]
006e9 4c3b252899b71f                 cmp        r12, qword ptr [rip + 0x1fb79928]
006f0 0f8414000000                   je         0x7f345c15448a
006f6 48bf2812da79347f0000           movabs     rdi, 0x7f3479da1228
00700 4883e4f0                       and        rsp, 0xfffffffffffffff0
00704 e8d780f41e                     call       0x7f347b09c560
00709 f4                             hlt        
0070a 8b5b04                         mov        ebx, dword ptr [rbx + 4]
0070d ffcb                           dec        ebx
0070f 899c24e0000000                 mov        dword ptr [rsp + 0xe0], ebx
00716 418b5d14                       mov        ebx, dword ptr [r13 + 0x14]
0071a 4c3b25f798b71f                 cmp        r12, qword ptr [rip + 0x1fb798f7]
00721 0f8414000000                   je         0x7f345c1544bb
00727 48bf2812da79347f0000           movabs     rdi, 0x7f3479da1228
00731 4883e4f0                       and        rsp, 0xfffffffffffffff0
00735 e8a680f41e                     call       0x7f347b09c560
0073a f4                             hlt        
0073b 8b5b04                         mov        ebx, dword ptr [rbx + 4]
0073e ffcb                           dec        ebx
00740 899c24e4000000                 mov        dword ptr [rsp + 0xe4], ebx
00747 418b5914                       mov        ebx, dword ptr [r9 + 0x14]
0074b 4c3b25c698b71f                 cmp        r12, qword ptr [rip + 0x1fb798c6]
00752 0f8414000000                   je         0x7f345c1544ec
00758 48bf2812da79347f0000           movabs     rdi, 0x7f3479da1228
00762 4883e4f0                       and        rsp, 0xfffffffffffffff0
00766 e87580f41e                     call       0x7f347b09c560
0076b f4                             hlt        
0076c 8b5b04                         mov        ebx, dword ptr [rbx + 4]
0076f ffcb                           dec        ebx
00771 899c24e8000000                 mov        dword ptr [rsp + 0xe8], ebx
00778 8b9c24a0000000                 mov        ebx, dword ptr [rsp + 0xa0]
0077f 48898424f0000000               mov        qword ptr [rsp + 0xf0], rax
00787 488b8424d0000000               mov        rax, qword ptr [rsp + 0xd0]
0078f 48898424f8000000               mov        qword ptr [rsp + 0xf8], rax
00797 8b8424c8000000                 mov        eax, dword ptr [rsp + 0xc8]
0079e 898424ec000000                 mov        dword ptr [rsp + 0xec], eax
007a5 b800000000                     mov        eax, 0
007aa 89942400010000                 mov        dword ptr [rsp + 0x100], edx
007b1 ba00000000                     mov        edx, 0
007b6 4889942408010000               mov        qword ptr [rsp + 0x108], rdx
007be 899c2404010000                 mov        dword ptr [rsp + 0x104], ebx
007c5 8b9424e0000000                 mov        edx, dword ptr [rsp + 0xe0]
007cc 8b8c24e4000000                 mov        ecx, dword ptr [rsp + 0xe4]
007d3 448bb42480000000               mov        r14d, dword ptr [rsp + 0x80]
007db 90                             nop        
007dc 90                             nop        
007dd 90                             nop        
007de 90                             nop        
007df 90                             nop        
007e0 413bc6                         cmp        eax, r14d
007e3 48bbb0a76350347f0000           movabs     rbx, 0x7f345063a7b0
007ed 41bef0010000                   mov        r14d, 0x1f0
007f3 7d06                           jge        0x7f345c15457b
007f5 41be00020000                   mov        r14d, 0x200
007fb 89842418010000                 mov        dword ptr [rsp + 0x118], eax
00802 4a8b0433                       mov        rax, qword ptr [rbx + r14]
00806 488d4001                       lea        rax, [rax + 1]
0080a 4a890433                       mov        qword ptr [rbx + r14], rax
0080e 0f8d7f0e0000                   jge        0x7f345c155413
00814 8b5e14                         mov        ebx, dword ptr [rsi + 0x14]
00817 4c3b25fa97b71f                 cmp        r12, qword ptr [rip + 0x1fb797fa]
0081e 0f8414000000                   je         0x7f345c1545b8
00824 48bf2812da79347f0000           movabs     rdi, 0x7f3479da1228
0082e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00832 e8a97ff41e                     call       0x7f347b09c560
00837 f4                             hlt        
00838 498bc3                         mov        rax, r11
0083b 4823c2                         and        rax, rdx
0083e 3b4304                         cmp        eax, dword ptr [rbx + 4]
00841 0f839e130000                   jae        0x7f345c155965
00847 4863c0                         movsxd     rax, eax
0084a 4c8b74c308                     mov        r14, qword ptr [rbx + rax*8 + 8]
0084f 4c89b42470010000               mov        qword ptr [rsp + 0x170], r14
00857 418b5d14                       mov        ebx, dword ptr [r13 + 0x14]
0085b 4c3b25b697b71f                 cmp        r12, qword ptr [rip + 0x1fb797b6]
00862 0f8414000000                   je         0x7f345c1545fc
00868 48bf2812da79347f0000           movabs     rdi, 0x7f3479da1228
00872 4883e4f0                       and        rsp, 0xfffffffffffffff0
00876 e8657ff41e                     call       0x7f347b09c560
0087b f4                             hlt        
0087c 488bc7                         mov        rax, rdi
0087f 4823c1                         and        rax, rcx
00882 3b4304                         cmp        eax, dword ptr [rbx + 4]
00885 0f83ae130000                   jae        0x7f345c1559b9
0088b 4863c0                         movsxd     rax, eax
0088e 488b74c308                     mov        rsi, qword ptr [rbx + rax*8 + 8]
00893 4889b42438010000               mov        qword ptr [rsp + 0x138], rsi
0089b 418b5914                       mov        ebx, dword ptr [r9 + 0x14]
0089f 4c3b257297b71f                 cmp        r12, qword ptr [rip + 0x1fb79772]
008a6 0f8414000000                   je         0x7f345c154640
008ac 48bf2812da79347f0000           movabs     rdi, 0x7f3479da1228
008b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
008ba e8217ff41e                     call       0x7f347b09c560
008bf f4                             hlt        
008c0 498bc0                         mov        rax, r8
008c3 238424e8000000                 and        eax, dword ptr [rsp + 0xe8]
008ca 3b4304                         cmp        eax, dword ptr [rbx + 4]
008cd 0f83ba130000                   jae        0x7f345c155a0d
008d3 4863c0                         movsxd     rax, eax
008d6 89bc241c010000                 mov        dword ptr [rsp + 0x11c], edi
008dd 488b7cc308                     mov        rdi, qword ptr [rbx + rax*8 + 8]
008e2 4889bc2430010000               mov        qword ptr [rsp + 0x130], rdi
008ea b920000000                     mov        ecx, 0x20
008ef 488bc6                         mov        rax, rsi
008f2 48d3e8                         shr        rax, cl
008f5 8bc0                           mov        eax, eax
008f7 25ff000000                     and        eax, 0xff
008fc 89842444010000                 mov        dword ptr [rsp + 0x144], eax
00903 b920000000                     mov        ecx, 0x20
00908 488bdf                         mov        rbx, rdi
0090b 48d3eb                         shr        rbx, cl
0090e 8bdb                           mov        ebx, ebx
00910 81e3ff000000                   and        ebx, 0xff
00916 899c2440010000                 mov        dword ptr [rsp + 0x140], ebx
0091d b920000000                     mov        ecx, 0x20
00922 498bd6                         mov        rdx, r14
00925 48d3ea                         shr        rdx, cl
00928 8bd2                           mov        edx, edx
0092a 81e2ff000000                   and        edx, 0xff
00930 89942448010000                 mov        dword ptr [rsp + 0x148], edx
00937 8b8c2418010000                 mov        ecx, dword ptr [rsp + 0x118]
0093e ffc1                           inc        ecx
00940 898c2428010000                 mov        dword ptr [rsp + 0x128], ecx
00947 3b8c2480000000                 cmp        ecx, dword ptr [rsp + 0x80]
0094e 4489842420010000               mov        dword ptr [rsp + 0x120], r8d
00956 49b8b0a76350347f0000           movabs     r8, 0x7f345063a7b0
00960 41b910020000                   mov        r9d, 0x210
00966 7d06                           jge        0x7f345c1546ee
00968 41b920020000                   mov        r9d, 0x220
0096e 44899c2424010000               mov        dword ptr [rsp + 0x124], r11d
00976 4f8b1c08                       mov        r11, qword ptr [r8 + r9]
0097a 4d8d5b01                       lea        r11, [r11 + 1]
0097e 4f891c08                       mov        qword ptr [r8 + r9], r11
00982 0f8d1c000000                   jge        0x7f345c154724
00988 49b8b0a76350347f0000           movabs     r8, 0x7f345063a7b0
00992 41ff8030020000                 inc        dword ptr [r8 + 0x230]
00999 41b801000000                   mov        r8d, 1
0099f e906000000                     jmp        0x7f345c15472a
009a4 41b800000000                   mov        r8d, 0
009aa 4585c0                         test       r8d, r8d
009ad 49b9b0a76350347f0000           movabs     r9, 0x7f345063a7b0
009b7 41bb48020000                   mov        r11d, 0x248
009bd 7406                           je         0x7f345c154745
009bf 41bb58020000                   mov        r11d, 0x258
009c5 4f8b2c19                       mov        r13, qword ptr [r9 + r11]
009c9 4d8d6d01                       lea        r13, [r13 + 1]
009cd 4f892c19                       mov        qword ptr [r9 + r11], r13
009d1 0f842a000000                   je         0x7f345c154781
009d7 b928000000                     mov        ecx, 0x28
009dc 4d8bde                         mov        r11, r14
009df 49d3eb                         shr        r11, cl
009e2 458bdb                         mov        r11d, r11d
009e5 4181e3ff000000                 and        r11d, 0xff
009ec 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
009f6 ff8168020000                   inc        dword ptr [rcx + 0x268]
009fc e906000000                     jmp        0x7f345c154787
00a01 41bb00000000                   mov        r11d, 0
00a07 4585c0                         test       r8d, r8d
00a0a 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
00a14 41bd80020000                   mov        r13d, 0x280
00a1a 7406                           je         0x7f345c1547a2
00a1c 41bd90020000                   mov        r13d, 0x290
00a22 4e8b0c29                       mov        r9, qword ptr [rcx + r13]
00a26 4d8d4901                       lea        r9, [r9 + 1]
00a2a 4e890c29                       mov        qword ptr [rcx + r13], r9
00a2e 0f842a000000                   je         0x7f345c1547de
00a34 b928000000                     mov        ecx, 0x28
00a39 4c8bcf                         mov        r9, rdi
00a3c 49d3e9                         shr        r9, cl
00a3f 458bc9                         mov        r9d, r9d
00a42 4181e1ff000000                 and        r9d, 0xff
00a49 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
00a53 ff81a0020000                   inc        dword ptr [rcx + 0x2a0]
00a59 e906000000                     jmp        0x7f345c1547e4
00a5e 41b900000000                   mov        r9d, 0
00a64 4585c0                         test       r8d, r8d
00a67 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
00a71 41bdb8020000                   mov        r13d, 0x2b8
00a77 7406                           je         0x7f345c1547ff
00a79 41bdc8020000                   mov        r13d, 0x2c8
00a7f 4a8b3c29                       mov        rdi, qword ptr [rcx + r13]
00a83 488d7f01                       lea        rdi, [rdi + 1]
00a87 4a893c29                       mov        qword ptr [rcx + r13], rdi
00a8b 0f8428000000                   je         0x7f345c154839
00a91 b928000000                     mov        ecx, 0x28
00a96 488bfe                         mov        rdi, rsi
00a99 48d3ef                         shr        rdi, cl
00a9c 8bff                           mov        edi, edi
00a9e 81e7ff000000                   and        edi, 0xff
00aa4 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
00aae ff81d8020000                   inc        dword ptr [rcx + 0x2d8]
00ab4 e905000000                     jmp        0x7f345c15483e
00ab9 bf00000000                     mov        edi, 0
00abe 4503d9                         add        r11d, r9d
00ac1 4403df                         add        r11d, edi
00ac4 488bc8                         mov        rcx, rax
00ac7 03cb                           add        ecx, ebx
00ac9 03ca                           add        ecx, edx
00acb 4c8be9                         mov        r13, rcx
00ace 4503eb                         add        r13d, r11d
00ad1 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
00adb ff81f0020000                   inc        dword ptr [rcx + 0x2f0]
00ae1 89bc242c010000                 mov        dword ptr [rsp + 0x12c], edi
00ae8 4585ed                         test       r13d, r13d
00aeb 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
00af5 be80030000                     mov        esi, 0x380
00afa 7505                           jne        0x7f345c154881
00afc be90030000                     mov        esi, 0x390
00b01 488b3c31                       mov        rdi, qword ptr [rcx + rsi]
00b05 488d7f01                       lea        rdi, [rdi + 1]
00b09 48893c31                       mov        qword ptr [rcx + rsi], rdi
00b0d 0f8550000000                   jne        0x7f345c1548e3
00b13 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
00b1d ff81a0030000                   inc        dword ptr [rcx + 0x3a0]
00b23 8bbc2404010000                 mov        edi, dword ptr [rsp + 0x104]
00b2a 448bac2400010000               mov        r13d, dword ptr [rsp + 0x100]
00b32 488bb424f0000000               mov        rsi, qword ptr [rsp + 0xf0]
00b3a 488b8c24f8000000               mov        rcx, qword ptr [rsp + 0xf8]
00b42 8b9c24ec000000                 mov        ebx, dword ptr [rsp + 0xec]
00b49 b800000000                     mov        eax, 0
00b4e 44898c2450010000               mov        dword ptr [rsp + 0x150], r9d
00b56 448984244c010000               mov        dword ptr [rsp + 0x14c], r8d
00b5e e905030000                     jmp        0x7f345c154be8
00b63 4183fd3f                       cmp        r13d, 0x3f
00b67 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
00b71 beb8030000                     mov        esi, 0x3b8
00b76 7f05                           jg         0x7f345c1548fd
00b78 bec8030000                     mov        esi, 0x3c8
00b7d 488b3c31                       mov        rdi, qword ptr [rcx + rsi]
00b81 488d7f01                       lea        rdi, [rdi + 1]
00b85 48893c31                       mov        qword ptr [rcx + rsi], rdi
00b89 0f8f3e090000                   jg         0x7f345c15524d
00b8f b940000000                     mov        ecx, 0x40
00b94 2b8c2400010000                 sub        ecx, dword ptr [rsp + 0x100]
00b9b 443be9                         cmp        r13d, ecx
00b9e 48beb0a76350347f0000           movabs     rsi, 0x7f345063a7b0
00ba8 bfd8030000                     mov        edi, 0x3d8
00bad 7f05                           jg         0x7f345c154934
00baf bfe8030000                     mov        edi, 0x3e8
00bb4 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
00bb8 488d5b01                       lea        rbx, [rbx + 1]
00bbc 48891c3e                       mov        qword ptr [rsi + rdi], rbx
00bc0 0f8fbd000000                   jg         0x7f345c154a03
00bc6 412bcd                         sub        ecx, r13d
00bc9 488b8424f8000000               mov        rax, qword ptr [rsp + 0xf8]
00bd1 48d3e8                         shr        rax, cl
00bd4 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
00bde 488381f803000001               add        qword ptr [rcx + 0x3f8], 1
00be6 48b9f0f86250347f0000           movabs     rcx, 0x7f345062f8f0
00bf0 8b7178                         mov        esi, dword ptr [rcx + 0x78]
00bf3 83c602                         add        esi, 2
00bf6 897178                         mov        dword ptr [rcx + 0x78], esi
00bf9 81e6feff1f00                   and        esi, 0x1ffffe
00bff 85f6                           test       esi, esi
00c01 0f84a8100000                   je         0x7f345c155a2f
00c07 4183fd40                       cmp        r13d, 0x40
00c0b 48b9f0f86250347f0000           movabs     rcx, 0x7f345062f8f0
00c15 beb0000000                     mov        esi, 0xb0
00c1a 7c05                           jl         0x7f345c1549a1
00c1c bec0000000                     mov        esi, 0xc0
00c21 488b3c31                       mov        rdi, qword ptr [rcx + rsi]
00c25 488d7f01                       lea        rdi, [rdi + 1]
00c29 48893c31                       mov        qword ptr [rcx + rsi], rdi
00c2d 0f8c1c000000                   jl         0x7f345c1549cf
00c33 48b9f0f86250347f0000           movabs     rcx, 0x7f345062f8f0
00c3d ff81d0000000                   inc        dword ptr [rcx + 0xd0]
00c43 48c7c6ffffffff                 mov        rsi, 0xffffffffffffffff
00c4a e914000000                     jmp        0x7f345c1549e3
00c4f be01000000                     mov        esi, 1
00c54 498bcd                         mov        rcx, r13
00c57 488bfe                         mov        rdi, rsi
00c5a 48d3e7                         shl        rdi, cl
00c5d 482bfe                         sub        rdi, rsi
00c60 488bf7                         mov        rsi, rdi
00c63 4823f0                         and        rsi, rax
00c66 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
00c70 ff8108040000                   inc        dword ptr [rcx + 0x408]
00c76 488b9c24f8000000               mov        rbx, qword ptr [rsp + 0xf8]
00c7e e9b9000000                     jmp        0x7f345c154abc
00c83 498bf5                         mov        rsi, r13
00c86 2bf1                           sub        esi, ecx
00c88 48bfb0a76350347f0000           movabs     rdi, 0x7f345063a7b0
00c92 4883872004000001               add        qword ptr [rdi + 0x420], 1
00c9a 48bff0f86250347f0000           movabs     rdi, 0x7f345062f8f0
00ca4 8b5f78                         mov        ebx, dword ptr [rdi + 0x78]
00ca7 83c302                         add        ebx, 2
00caa 895f78                         mov        dword ptr [rdi + 0x78], ebx
00cad 81e3feff1f00                   and        ebx, 0x1ffffe
00cb3 85db                           test       ebx, ebx
00cb5 0f8415100000                   je         0x7f345c155a50
00cbb 83f940                         cmp        ecx, 0x40
00cbe 48bff0f86250347f0000           movabs     rdi, 0x7f345062f8f0
00cc8 bbb0000000                     mov        ebx, 0xb0
00ccd 7c05                           jl         0x7f345c154a54
00ccf bbc0000000                     mov        ebx, 0xc0
00cd4 488b041f                       mov        rax, qword ptr [rdi + rbx]
00cd8 488d4001                       lea        rax, [rax + 1]
00cdc 4889041f                       mov        qword ptr [rdi + rbx], rax
00ce0 0f8c1c000000                   jl         0x7f345c154a82
00ce6 48b9f0f86250347f0000           movabs     rcx, 0x7f345062f8f0
00cf0 ff81d0000000                   inc        dword ptr [rcx + 0xd0]
00cf6 48c7c7ffffffff                 mov        rdi, 0xffffffffffffffff
00cfd e911000000                     jmp        0x7f345c154a93
00d02 bf01000000                     mov        edi, 1
00d07 488bdf                         mov        rbx, rdi
00d0a 48d3e3                         shl        rbx, cl
00d0d 482bdf                         sub        rbx, rdi
00d10 488bfb                         mov        rdi, rbx
00d13 488b9c24f8000000               mov        rbx, qword ptr [rsp + 0xf8]
00d1b 4823fb                         and        rdi, rbx
00d1e 488bce                         mov        rcx, rsi
00d21 48d3e7                         shl        rdi, cl
00d24 b940000000                     mov        ecx, 0x40
00d29 2bce                           sub        ecx, esi
00d2b 488b8424f0000000               mov        rax, qword ptr [rsp + 0xf0]
00d33 48d3e8                         shr        rax, cl
00d36 480bf8                         or         rdi, rax
00d39 488bf7                         mov        rsi, rdi
00d3c 498bcd                         mov        rcx, r13
00d3f 038c2400010000                 add        ecx, dword ptr [rsp + 0x100]
00d46 4403ac2404010000               add        r13d, dword ptr [rsp + 0x104]
00d4e 83f940                         cmp        ecx, 0x40
00d51 48bfb0a76350347f0000           movabs     rdi, 0x7f345063a7b0
00d5b b840040000                     mov        eax, 0x440
00d60 7d05                           jge        0x7f345c154ae7
00d62 b830040000                     mov        eax, 0x430
00d67 488b1407                       mov        rdx, qword ptr [rdi + rax]
00d6b 488d5201                       lea        rdx, [rdx + 1]
00d6f 48891407                       mov        qword ptr [rdi + rax], rdx
00d73 0f8d33000000                   jge        0x7f345c154b2c
00d79 488b9424f0000000               mov        rdx, qword ptr [rsp + 0xf0]
00d81 488bc6                         mov        rax, rsi
00d84 498bfd                         mov        rdi, r13
00d87 4c8be9                         mov        r13, rcx
00d8a 488bf2                         mov        rsi, rdx
00d8d 488bcb                         mov        rcx, rbx
00d90 8b9c24ec000000                 mov        ebx, dword ptr [rsp + 0xec]
00d97 44898c2450010000               mov        dword ptr [rsp + 0x150], r9d
00d9f 448984244c010000               mov        dword ptr [rsp + 0x14c], r8d
00da7 e9bc000000                     jmp        0x7f345c154be8
00dac 4489ac2460010000               mov        dword ptr [rsp + 0x160], r13d
00db4 4889b42458010000               mov        qword ptr [rsp + 0x158], rsi
00dbc 44899c2468010000               mov        dword ptr [rsp + 0x168], r11d
00dc4 44898c2450010000               mov        dword ptr [rsp + 0x150], r9d
00dcc 448984244c010000               mov        dword ptr [rsp + 0x14c], r8d
00dd4 83e940                         sub        ecx, 0x40
00dd7 8bbc24ec000000                 mov        edi, dword ptr [rsp + 0xec]
00dde 83ef08                         sub        edi, 8
00de1 48bbb0a76350347f0000           movabs     rbx, 0x7f345063a7b0
00deb 4883835004000001               add        qword ptr [rbx + 0x450], 1
00df3 488bdf                         mov        rbx, rdi
00df6 83eb08                         sub        ebx, 8
00df9 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
00dfe 8b542464                       mov        edx, dword ptr [rsp + 0x64]
00e02 898c2454010000                 mov        dword ptr [rsp + 0x154], ecx
00e09 488bcb                         mov        rcx, rbx
00e0c 89bc2464010000                 mov        dword ptr [rsp + 0x164], edi
00e13 90                             nop        
00e14 90                             nop        
00e15 90                             nop        
00e16 90                             nop        
00e17 e8c4b05d07                     call       0x7f346372fc60
00e1c 0f1f8400140f0004               nop        dword ptr [rax + rax + 0x4000f14]
00e24 488bc8                         mov        rcx, rax
00e27 48beb0a76350347f0000           movabs     rsi, 0x7f345063a7b0
00e31 ff8660040000                   inc        dword ptr [rsi + 0x460]
00e37 488b842458010000               mov        rax, qword ptr [rsp + 0x158]
00e3f 8bbc2460010000                 mov        edi, dword ptr [rsp + 0x160]
00e46 448bac2454010000               mov        r13d, dword ptr [rsp + 0x154]
00e4e 488bf1                         mov        rsi, rcx
00e51 488b8c24f0000000               mov        rcx, qword ptr [rsp + 0xf0]
00e59 8b9c2464010000                 mov        ebx, dword ptr [rsp + 0x164]
00e60 448b9c2468010000               mov        r11d, dword ptr [rsp + 0x168]
00e68 48bab0a76350347f0000           movabs     rdx, 0x7f345063a7b0
00e72 488382e804000001               add        qword ptr [rdx + 0x4e8], 1
00e7a 48baf0f86250347f0000           movabs     rdx, 0x7f345062f8f0
00e84 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
00e88 4183c002                       add        r8d, 2
00e8c 44894278                       mov        dword ptr [rdx + 0x78], r8d
00e90 4181e0feff1f00                 and        r8d, 0x1ffffe
00e97 4585c0                         test       r8d, r8d
00e9a 0f84510e0000                   je         0x7f345c155a71
00ea0 4183fb40                       cmp        r11d, 0x40
00ea4 48baf0f86250347f0000           movabs     rdx, 0x7f345062f8f0
00eae 41b8b0000000                   mov        r8d, 0xb0
00eb4 7c06                           jl         0x7f345c154c3c
00eb6 41b8c0000000                   mov        r8d, 0xc0
00ebc 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
00ec0 4d8d4901                       lea        r9, [r9 + 1]
00ec4 4e890c02                       mov        qword ptr [rdx + r8], r9
00ec8 0f8c24000000                   jl         0x7f345c154c72
00ece 48baf0f86250347f0000           movabs     rdx, 0x7f345062f8f0
00ed8 ff82d0000000                   inc        dword ptr [rdx + 0xd0]
00ede 48c7c2ffffffff                 mov        rdx, 0xffffffffffffffff
00ee5 48898c2480010000               mov        qword ptr [rsp + 0x180], rcx
00eed e91c000000                     jmp        0x7f345c154c8e
00ef2 48898c2480010000               mov        qword ptr [rsp + 0x180], rcx
00efa ba01000000                     mov        edx, 1
00eff 498bcb                         mov        rcx, r11
00f02 4c8bca                         mov        r9, rdx
00f05 49d3e1                         shl        r9, cl
00f08 4c2bca                         sub        r9, rdx
00f0b 498bd1                         mov        rdx, r9
00f0e 448b8c2448010000               mov        r9d, dword ptr [rsp + 0x148]
00f16 4823d0                         and        rdx, rax
00f19 8bd2                           mov        edx, edx
00f1b 498bcb                         mov        rcx, r11
00f1e 48d3e8                         shr        rax, cl
00f21 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
00f2b 488381f804000001               add        qword ptr [rcx + 0x4f8], 1
00f33 48b9f0f86250347f0000           movabs     rcx, 0x7f345062f8f0
00f3d 448b5978                       mov        r11d, dword ptr [rcx + 0x78]
00f41 4183c302                       add        r11d, 2
00f45 44895978                       mov        dword ptr [rcx + 0x78], r11d
00f49 4181e3feff1f00                 and        r11d, 0x1ffffe
00f50 4585db                         test       r11d, r11d
00f53 0f84b90d0000                   je         0x7f345c155a92
00f59 4183f940                       cmp        r9d, 0x40
00f5d 48b9f0f86250347f0000           movabs     rcx, 0x7f345062f8f0
00f67 41bbb0000000                   mov        r11d, 0xb0
00f6d 7c06                           jl         0x7f345c154cf5
00f6f 41bbc0000000                   mov        r11d, 0xc0
00f75 4e8b3419                       mov        r14, qword ptr [rcx + r11]
00f79 4d8d7601                       lea        r14, [r14 + 1]
00f7d 4e893419                       mov        qword ptr [rcx + r11], r14
00f81 0f8c1c000000                   jl         0x7f345c154d23
00f87 48b9f0f86250347f0000           movabs     rcx, 0x7f345062f8f0
00f91 ff81d0000000                   inc        dword ptr [rcx + 0xd0]
00f97 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00f9e e915000000                     jmp        0x7f345c154d38
00fa3 41bb01000000                   mov        r11d, 1
00fa9 498bc9                         mov        rcx, r9
00fac 4d8bf3                         mov        r14, r11
00faf 49d3e6                         shl        r14, cl
00fb2 4d2bf3                         sub        r14, r11
00fb5 4d8bde                         mov        r11, r14
00fb8 4889b42478010000               mov        qword ptr [rsp + 0x178], rsi
00fc0 448bb42440010000               mov        r14d, dword ptr [rsp + 0x140]
00fc8 4c23d8                         and        r11, rax
00fcb 458bdb                         mov        r11d, r11d
00fce 498bc9                         mov        rcx, r9
00fd1 48d3e8                         shr        rax, cl
00fd4 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
00fde 4883810805000001               add        qword ptr [rcx + 0x508], 1
00fe6 48b9f0f86250347f0000           movabs     rcx, 0x7f345062f8f0
00ff0 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
00ff4 4183c102                       add        r9d, 2
00ff8 44894978                       mov        dword ptr [rcx + 0x78], r9d
00ffc 4181e1feff1f00                 and        r9d, 0x1ffffe
01003 4585c9                         test       r9d, r9d
01006 0f84270d0000                   je         0x7f345c155ab3
0100c 4183fe40                       cmp        r14d, 0x40
01010 48b9f0f86250347f0000           movabs     rcx, 0x7f345062f8f0
0101a 41b9b0000000                   mov        r9d, 0xb0
01020 7c06                           jl         0x7f345c154da8
01022 41b9c0000000                   mov        r9d, 0xc0
01028 4a8b3409                       mov        rsi, qword ptr [rcx + r9]
0102c 488d7601                       lea        rsi, [rsi + 1]
01030 4a893409                       mov        qword ptr [rcx + r9], rsi
01034 0f8c1c000000                   jl         0x7f345c154dd6
0103a 48b9f0f86250347f0000           movabs     rcx, 0x7f345062f8f0
01044 ff81d0000000                   inc        dword ptr [rcx + 0xd0]
0104a 48c7c6ffffffff                 mov        rsi, 0xffffffffffffffff
01051 e914000000                     jmp        0x7f345c154dea
01056 be01000000                     mov        esi, 1
0105b 498bce                         mov        rcx, r14
0105e 4c8bce                         mov        r9, rsi
01061 49d3e1                         shl        r9, cl
01064 4c2bce                         sub        r9, rsi
01067 498bf1                         mov        rsi, r9
0106a 89bc246c010000                 mov        dword ptr [rsp + 0x16c], edi
01071 448b8c2444010000               mov        r9d, dword ptr [rsp + 0x144]
01079 4823f0                         and        rsi, rax
0107c 8bf6                           mov        esi, esi
0107e 498bce                         mov        rcx, r14
01081 48d3e8                         shr        rax, cl
01084 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
0108e 4883811805000001               add        qword ptr [rcx + 0x518], 1
01096 48b9f0f86250347f0000           movabs     rcx, 0x7f345062f8f0
010a0 448b7178                       mov        r14d, dword ptr [rcx + 0x78]
010a4 4183c602                       add        r14d, 2
010a8 44897178                       mov        dword ptr [rcx + 0x78], r14d
010ac 4181e6feff1f00                 and        r14d, 0x1ffffe
010b3 4585f6                         test       r14d, r14d
010b6 0f84980c0000                   je         0x7f345c155ad4
010bc 4183f940                       cmp        r9d, 0x40
010c0 48b9f0f86250347f0000           movabs     rcx, 0x7f345062f8f0
010ca 41beb0000000                   mov        r14d, 0xb0
010d0 7c06                           jl         0x7f345c154e58
010d2 41bec0000000                   mov        r14d, 0xc0
010d8 4a8b3c31                       mov        rdi, qword ptr [rcx + r14]
010dc 488d7f01                       lea        rdi, [rdi + 1]
010e0 4a893c31                       mov        qword ptr [rcx + r14], rdi
010e4 0f8c1c000000                   jl         0x7f345c154e86
010ea 48b9f0f86250347f0000           movabs     rcx, 0x7f345062f8f0
010f4 ff81d0000000                   inc        dword ptr [rcx + 0xd0]
010fa 48c7c7ffffffff                 mov        rdi, 0xffffffffffffffff
01101 e914000000                     jmp        0x7f345c154e9a
01106 bf01000000                     mov        edi, 1
0110b 498bc9                         mov        rcx, r9
0110e 4c8bcf                         mov        r9, rdi
01111 49d3e1                         shl        r9, cl
01114 4c2bcf                         sub        r9, rdi
01117 498bf9                         mov        rdi, r9
0111a 488b8c2430010000               mov        rcx, qword ptr [rsp + 0x130]
01122 4c8bb42470010000               mov        r14, qword ptr [rsp + 0x170]
0112a 4c8b8c2408010000               mov        r9, qword ptr [rsp + 0x108]
01132 4823f8                         and        rdi, rax
01135 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0113d 41baffffffff                   mov        r10d, 0xffffffff
01143 4923c2                         and        rax, r10
01146 4803c7                         add        rax, rdi
01149 8bf9                           mov        edi, ecx
0114b 03fe                           add        edi, esi
0114d 89bc248c010000                 mov        dword ptr [rsp + 0x18c], edi
01154 418bf6                         mov        esi, r14d
01157 4103f3                         add        esi, r11d
0115a 4c63df                         movsxd     r11, edi
0115d 4d03d9                         add        r11, r9
01160 49b9b0a76350347f0000           movabs     r9, 0x7f345063a7b0
0116a 41ff8128050000                 inc        dword ptr [r9 + 0x528]
01171 4c899c2498010000               mov        qword ptr [rsp + 0x198], r11
01179 89b42490010000                 mov        dword ptr [rsp + 0x190], esi
01180 89942494010000                 mov        dword ptr [rsp + 0x194], edx
01187 4489ac24a0010000               mov        dword ptr [rsp + 0x1a0], r13d
0118f 899c2488010000                 mov        dword ptr [rsp + 0x188], ebx
01196 48bfb0a76350347f0000           movabs     rdi, 0x7f345063a7b0
011a0 4883877805000001               add        qword ptr [rdi + 0x578], 1
011a8 488bf0                         mov        rsi, rax
011ab 90                             nop        
011ac 90                             nop        
011ad 90                             nop        
011ae 90                             nop        
011af e82cad5d07                     call       0x7f346372fc60
011b4 0f1f8400ac120005               nop        dword ptr [rax + rax + 0x50012ac]
011bc 48beb0a76350347f0000           movabs     rsi, 0x7f345063a7b0
011c6 4883868805000001               add        qword ptr [rsi + 0x588], 1
011ce 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
011d6 488b942410010000               mov        rdx, qword ptr [rsp + 0x110]
011de 8b8c2418010000                 mov        ecx, dword ptr [rsp + 0x118]
011e5 4c8bc0                         mov        r8, rax
011e8 448b8c2490010000               mov        r9d, dword ptr [rsp + 0x190]
011f0 8bbc248c010000                 mov        edi, dword ptr [rsp + 0x18c]
011f7 e8e4ac5d07                     call       0x7f346372fc60
011fc 0f1f8400f4120006               nop        dword ptr [rax + rax + 0x60012f4]
01204 448b84244c010000               mov        r8d, dword ptr [rsp + 0x14c]
0120c 4585c0                         test       r8d, r8d
0120f 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
01219 baa8050000                     mov        edx, 0x5a8
0121e 7505                           jne        0x7f345c154fa5
01220 ba98050000                     mov        edx, 0x598
01225 4c8b0411                       mov        r8, qword ptr [rcx + rdx]
01229 4d8d4001                       lea        r8, [r8 + 1]
0122d 4c890411                       mov        qword ptr [rcx + rdx], r8
01231 0f851c000000                   jne        0x7f345c154fd3
01237 448b9c2424010000               mov        r11d, dword ptr [rsp + 0x124]
0123f 8bbc241c010000                 mov        edi, dword ptr [rsp + 0x11c]
01246 448b842420010000               mov        r8d, dword ptr [rsp + 0x120]
0124e e998010000                     jmp        0x7f345c15516b
01253 448b8c2450010000               mov        r9d, dword ptr [rsp + 0x150]
0125b 488bbc2430010000               mov        rdi, qword ptr [rsp + 0x130]
01263 4c8bb42470010000               mov        r14, qword ptr [rsp + 0x170]
0126b b930000000                     mov        ecx, 0x30
01270 49d3ee                         shr        r14, cl
01273 458bf6                         mov        r14d, r14d
01276 498bc9                         mov        rcx, r9
01279 038c242c010000                 add        ecx, dword ptr [rsp + 0x12c]
01280 8b942494010000                 mov        edx, dword ptr [rsp + 0x194]
01287 d3ea                           shr        edx, cl
01289 4403f2                         add        r14d, edx
0128c b930000000                     mov        ecx, 0x30
01291 48d3ef                         shr        rdi, cl
01294 8bff                           mov        edi, edi
01296 8b8c242c010000                 mov        ecx, dword ptr [rsp + 0x12c]
0129d 8b942494010000                 mov        edx, dword ptr [rsp + 0x194]
012a4 d3ea                           shr        edx, cl
012a6 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
012b0 488381b805000001               add        qword ptr [rcx + 0x5b8], 1
012b8 48b9887a6350347f0000           movabs     rcx, 0x7f3450637a88
012c2 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
012c6 4183c002                       add        r8d, 2
012ca 44894178                       mov        dword ptr [rcx + 0x78], r8d
012ce 4181e0feff1f00                 and        r8d, 0x1ffffe
012d5 4585c0                         test       r8d, r8d
012d8 0f84970a0000                   je         0x7f345c155af5
012de 4183f920                       cmp        r9d, 0x20
012e2 48b9887a6350347f0000           movabs     rcx, 0x7f3450637a88
012ec 41b8b0000000                   mov        r8d, 0xb0
012f2 7c06                           jl         0x7f345c15507a
012f4 41b8c0000000                   mov        r8d, 0xc0
012fa 4a8b3401                       mov        rsi, qword ptr [rcx + r8]
012fe 488d7601                       lea        rsi, [rsi + 1]
01302 4a893401                       mov        qword ptr [rcx + r8], rsi
01306 0f8c1b000000                   jl         0x7f345c1550a7
0130c 48b9887a6350347f0000           movabs     rcx, 0x7f3450637a88
01316 ff81d0000000                   inc        dword ptr [rcx + 0xd0]
0131c 41b8ffffffff                   mov        r8d, 0xffffffff
01322 e90f000000                     jmp        0x7f345c1550b6
01327 498bc9                         mov        rcx, r9
0132a 41b801000000                   mov        r8d, 1
01330 41d3e0                         shl        r8d, cl
01333 41ffc8                         dec        r8d
01336 8b9c242c010000                 mov        ebx, dword ptr [rsp + 0x12c]
0133d 488bb42438010000               mov        rsi, qword ptr [rsp + 0x138]
01345 4c23c2                         and        r8, rdx
01348 4403c7                         add        r8d, edi
0134b b930000000                     mov        ecx, 0x30
01350 48d3ee                         shr        rsi, cl
01353 8bf6                           mov        esi, esi
01355 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
0135f 488381c805000001               add        qword ptr [rcx + 0x5c8], 1
01367 48b9887a6350347f0000           movabs     rcx, 0x7f3450637a88
01371 8b5178                         mov        edx, dword ptr [rcx + 0x78]
01374 83c202                         add        edx, 2
01377 895178                         mov        dword ptr [rcx + 0x78], edx
0137a 81e2feff1f00                   and        edx, 0x1ffffe
01380 85d2                           test       edx, edx
01382 0f840e0a0000                   je         0x7f345c155b16
01388 83fb20                         cmp        ebx, 0x20
0138b 48b9887a6350347f0000           movabs     rcx, 0x7f3450637a88
01395 bab0000000                     mov        edx, 0xb0
0139a 7c05                           jl         0x7f345c155121
0139c bac0000000                     mov        edx, 0xc0
013a1 488b3c11                       mov        rdi, qword ptr [rcx + rdx]
013a5 488d7f01                       lea        rdi, [rdi + 1]
013a9 48893c11                       mov        qword ptr [rcx + rdx], rdi
013ad 0f8c1a000000                   jl         0x7f345c15514d
013b3 48b9887a6350347f0000           movabs     rcx, 0x7f3450637a88
013bd ff81d0000000                   inc        dword ptr [rcx + 0xd0]
013c3 baffffffff                     mov        edx, 0xffffffff
013c8 e90c000000                     jmp        0x7f345c155159
013cd 488bcb                         mov        rcx, rbx
013d0 ba01000000                     mov        edx, 1
013d5 d3e2                           shl        edx, cl
013d7 ffca                           dec        edx
013d9 8b8c2494010000                 mov        ecx, dword ptr [rsp + 0x194]
013e0 4823d1                         and        rdx, rcx
013e3 03d6                           add        edx, esi
013e5 4d8bde                         mov        r11, r14
013e8 488bfa                         mov        rdi, rdx
013eb 488b942498010000               mov        rdx, qword ptr [rsp + 0x198]
013f3 8bb4246c010000                 mov        esi, dword ptr [rsp + 0x16c]
013fa 448bac24a0010000               mov        r13d, dword ptr [rsp + 0x1a0]
01402 488b9c2478010000               mov        rbx, qword ptr [rsp + 0x178]
0140a 488b842480010000               mov        rax, qword ptr [rsp + 0x180]
01412 8b8c2428010000                 mov        ecx, dword ptr [rsp + 0x128]
01419 49b9b0a76350347f0000           movabs     r9, 0x7f345063a7b0
01423 458b717c                       mov        r14d, dword ptr [r9 + 0x7c]
01427 4183c602                       add        r14d, 2
0142b 4589717c                       mov        dword ptr [r9 + 0x7c], r14d
0142f 4181e6fe3f0000                 and        r14d, 0x3ffe
01436 4585f6                         test       r14d, r14d
01439 0f8478090000                   je         0x7f345c155b37
0143f 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01443 418502                         test       dword ptr [r10], eax
01446 49b9b0a76350347f0000           movabs     r9, 0x7f345063a7b0
01450 41ff81d8050000                 inc        dword ptr [r9 + 0x5d8]
01457 4c8bca                         mov        r9, rdx
0145a 498bd5                         mov        rdx, r13
0145d 4c8beb                         mov        r13, rbx
01460 488bd8                         mov        rbx, rax
01463 8b842488010000                 mov        eax, dword ptr [rsp + 0x188]
0146a 4c898c2408010000               mov        qword ptr [rsp + 0x108], r9
01472 89b42404010000                 mov        dword ptr [rsp + 0x104], esi
01479 89942400010000                 mov        dword ptr [rsp + 0x100], edx
01480 4c89ac24f0000000               mov        qword ptr [rsp + 0xf0], r13
01488 48899c24f8000000               mov        qword ptr [rsp + 0xf8], rbx
01490 898424ec000000                 mov        dword ptr [rsp + 0xec], eax
01497 8b9424e0000000                 mov        edx, dword ptr [rsp + 0xe0]
0149e 4c8b8c24b0000000               mov        r9, qword ptr [rsp + 0xb0]
014a6 4c8bac24c0000000               mov        r13, qword ptr [rsp + 0xc0]
014ae 488bb42498000000               mov        rsi, qword ptr [rsp + 0x98]
014b6 448bb42480000000               mov        r14d, dword ptr [rsp + 0x80]
014be 488bc1                         mov        rax, rcx
014c1 8b8c24e4000000                 mov        ecx, dword ptr [rsp + 0xe4]
014c8 e913f3ffff                     jmp        0x7f345c154560
014cd 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
014d2 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
014d7 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
014db 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
014e0 48baa8296ce200000000           movabs     rdx, 0xe26c29a8
014ea 488bba80000000                 mov        rdi, qword ptr [rdx + 0x80]
014f1 41ba01000000                   mov        r10d, 1
014f7 4903fa                         add        rdi, r10
014fa 4889ba80000000                 mov        qword ptr [rdx + 0x80], rdi
01501 418bb944010000                 mov        edi, dword ptr [r9 + 0x144]
01508 4c3b25098bb71f                 cmp        r12, qword ptr [rip + 0x1fb78b09]
0150f 0f8414000000                   je         0x7f345c1552a9
01515 48bf2812da79347f0000           movabs     rdi, 0x7f3479da1228
0151f 4883e4f0                       and        rsp, 0xfffffffffffffff0
01523 e8b872f41e                     call       0x7f347b09c560
01528 f4                             hlt        
01529 4889bc24a8010000               mov        qword ptr [rsp + 0x1a8], rdi
01531 483b07                         cmp        rax, qword ptr [rdi]
01534 488bd7                         mov        rdx, rdi
01537 48bbb0a76350347f0000           movabs     rbx, 0x7f345063a7b0
01541 8b12                           mov        edx, dword ptr [rdx]
01543 c1ea0d                         shr        edx, 0xd
01546 48c1e20a                       shl        rdx, 0xa
0154a 41ba00000033                   mov        r10d, 0x33000000
01550 4903d2                         add        rdx, r10
01553 41ba90000000                   mov        r10d, 0x90
01559 4a3b14d3                       cmp        rdx, qword ptr [rbx + r10*8]
0155d 743c                           je         0x7f345c15531b
0155f 4983c202                       add        r10, 2
01563 4981fa94000000                 cmp        r10, 0x94
0156a 75ed                           jne        0x7f345c1552d9
0156c 41ba90000000                   mov        r10d, 0x90
01572 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01577 7415                           je         0x7f345c15530e
01579 4983c202                       add        r10, 2
0157d 4981fa94000000                 cmp        r10, 0x94
01584 75ec                           jne        0x7f345c1552f2
01586 41ba8f000000                   mov        r10d, 0x8f
0158c eb11                           jmp        0x7f345c15531f
0158e 50                             push       rax
0158f 4833c0                         xor        rax, rax
01592 f04a0fb114d3                   lock cmpxchg qword ptr [rbx + r10*8], rdx
01598 58                             pop        rax
01599 ebb8                           jmp        0x7f345c1552d3
0159b 4983c201                       add        r10, 1
0159f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
015a4 488bd6                         mov        rdx, rsi
015a7 488bf7                         mov        rsi, rdi
015aa 90                             nop        
015ab 90                             nop        
015ac 90                             nop        
015ad 90                             nop        
015ae 90                             nop        
015af e82c9f5d07                     call       0x7f346372f260
015b4 0f1f8400ac160008               nop        dword ptr [rax + rax + 0x80016ac]
015bc 488bbc24a8010000               mov        rdi, qword ptr [rsp + 0x1a8]
015c4 48b8b0a76350347f0000           movabs     rax, 0x7f345063a7b0
015ce 8b3f                           mov        edi, dword ptr [rdi]
015d0 c1ef0d                         shr        edi, 0xd
015d3 48c1e70a                       shl        rdi, 0xa
015d7 41ba00000033                   mov        r10d, 0x33000000
015dd 4903fa                         add        rdi, r10
015e0 41ba96000000                   mov        r10d, 0x96
015e6 4a3b3cd0                       cmp        rdi, qword ptr [rax + r10*8]
015ea 7442                           je         0x7f345c1553ae
015ec 4983c202                       add        r10, 2
015f0 4981fa9a000000                 cmp        r10, 0x9a
015f7 75ed                           jne        0x7f345c155366
015f9 41ba96000000                   mov        r10d, 0x96
015ff 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
01604 7415                           je         0x7f345c15539b
01606 4983c202                       add        r10, 2
0160a 4981fa9a000000                 cmp        r10, 0x9a
01611 75ec                           jne        0x7f345c15537f
01613 41ba95000000                   mov        r10d, 0x95
01619 eb17                           jmp        0x7f345c1553b2
0161b 53                             push       rbx
0161c 488bd8                         mov        rbx, rax
0161f 4833c0                         xor        rax, rax
01622 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
01628 488bc3                         mov        rax, rbx
0162b 5b                             pop        rbx
0162c ebb2                           jmp        0x7f345c155360
0162e 4983c201                       add        r10, 1
01632 4a8304d001                     add        qword ptr [rax + r10*8], 1
01637 48b800d26350347f0000           movabs     rax, 0x7f345063d200
01641 8b7078                         mov        esi, dword ptr [rax + 0x78]
01644 83c602                         add        esi, 2
01647 897078                         mov        dword ptr [rax + 0x78], esi
0164a 81e6feff1f00                   and        esi, 0x1ffffe
01650 85f6                           test       esi, esi
01652 0f8499070000                   je         0x7f345c155b71
01658 488bbc24a8010000               mov        rdi, qword ptr [rsp + 0x1a8]
01660 8b4714                         mov        eax, dword ptr [rdi + 0x14]
01663 83f820                         cmp        eax, 0x20
01666 48b800d26350347f0000           movabs     rax, 0x7f345063d200
01670 beb0000000                     mov        esi, 0xb0
01675 7f05                           jg         0x7f345c1553fc
01677 bec0000000                     mov        esi, 0xc0
0167c 488b1c30                       mov        rbx, qword ptr [rax + rsi]
01680 488d5b01                       lea        rbx, [rbx + 1]
01684 48891c30                       mov        qword ptr [rax + rsi], rbx
01688 0f8faf000000                   jg         0x7f345c1554bd
0168e e9d9000000                     jmp        0x7f345c1554ec
01693 4c8b8c2408010000               mov        r9, qword ptr [rsp + 0x108]
0169b 8bb42404010000                 mov        esi, dword ptr [rsp + 0x104]
016a2 48b8b0a76350347f0000           movabs     rax, 0x7f345063a7b0
016ac ff8000060000                   inc        dword ptr [rax + 0x600]
016b2 8b9c24cc000000                 mov        ebx, dword ptr [rsp + 0xcc]
016b9 8b8424e0010000                 mov        eax, dword ptr [rsp + 0x1e0]
016c0 4863db                         movsxd     rbx, ebx
016c3 4903d9                         add        rbx, r9
016c6 4863c0                         movsxd     rax, eax
016c9 483bc3                         cmp        rax, rbx
016cc 48b8b0a76350347f0000           movabs     rax, 0x7f345063a7b0
016d6 bf20060000                     mov        edi, 0x620
016db 7c05                           jl         0x7f345c155462
016dd bf10060000                     mov        edi, 0x610
016e2 488b1438                       mov        rdx, qword ptr [rax + rdi]
016e6 488d5201                       lea        rdx, [rdx + 1]
016ea 48891438                       mov        qword ptr [rax + rdi], rdx
016ee 0f8c6d010000                   jl         0x7f345c1555e1
016f4 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
016fb 3bf0                           cmp        esi, eax
016fd 48b8b0a76350347f0000           movabs     rax, 0x7f345063a7b0
01707 be50060000                     mov        esi, 0x650
0170c 7505                           jne        0x7f345c155493
0170e be40060000                     mov        esi, 0x640
01713 488b3c30                       mov        rdi, qword ptr [rax + rsi]
01717 488d7f01                       lea        rdi, [rdi + 1]
0171b 48893c30                       mov        qword ptr [rax + rsi], rdi
0171f 0f85a2000000                   jne        0x7f345c155547
01725 8bdb                           mov        ebx, ebx
01727 488bc3                         mov        rax, rbx
0172a 4881c4d0010000                 add        rsp, 0x1d0
01731 5d                             pop        rbp
01732 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
01736 0f87d6060000                   ja         0x7f345c155b92
0173c c3                             ret        
0173d 488bf7                         mov        rsi, rdi
01740 48bb00d26350347f0000           movabs     rbx, 0x7f345063d200
0174a 488383d000000001               add        qword ptr [rbx + 0xd0], 1
01752 488bf7                         mov        rsi, rdi
01755 90                             nop        
01756 90                             nop        
01757 e8849d5d07                     call       0x7f346372f260
0175c 0f1f840054180009               nop        dword ptr [rax + rax + 0x9001854]
01764 488bbc24a8010000               mov        rdi, qword ptr [rsp + 0x1a8]
0176c 8b8424e0010000                 mov        eax, dword ptr [rsp + 0x1e0]
01773 8b9c2480000000                 mov        ebx, dword ptr [rsp + 0x80]
0177a 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
0177f 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
01784 48beb0a76350347f0000           movabs     rsi, 0x7f345063a7b0
0178e 488386d804000001               add        qword ptr [rsi + 0x4d8], 1
01796 488bf7                         mov        rsi, rdi
01799 498bd0                         mov        rdx, r8
0179c 498bc9                         mov        rcx, r9
0179f 4c8bc3                         mov        r8, rbx
017a2 4c8bc8                         mov        r9, rax
017a5 90                             nop        
017a6 90                             nop        
017a7 e834a75d07                     call       0x7f346372fc60
017ac 0f1f8400a418000a               nop        dword ptr [rax + rax + 0xa0018a4]
017b4 4881c4d0010000                 add        rsp, 0x1d0
017bb 5d                             pop        rbp
017bc 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
017c0 0f8762060000                   ja         0x7f345c155ba8
017c6 c3                             ret        
017c7 90                             nop        
017c8 e980060000                     jmp        0x7f345c155bcd
017cd 90                             nop        
017ce 90                             nop        
017cf 90                             nop        
017d0 90                             nop        
017d1 90                             nop        
017d2 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
017d9 0f8591060000                   jne        0x7f345c155bf0
017df 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
017e6 488d7820                       lea        rdi, [rax + 0x20]
017ea 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
017f1 0f8779060000                   ja         0x7f345c155bf0
017f7 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
017fe 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
01805 488908                         mov        qword ptr [rax], rcx
01808 4833c9                         xor        rcx, rcx
0180b 48894808                       mov        qword ptr [rax + 8], rcx
0180f 48894810                       mov        qword ptr [rax + 0x10], rcx
01813 48894818                       mov        qword ptr [rax + 0x18], rcx
01817 488bd0                         mov        rdx, rax
0181a 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
01824 4883816006000001               add        qword ptr [rcx + 0x660], 1
0182c ba02000000                     mov        edx, 2
01831 48b9406826e200000000           movabs     rcx, 0xe2266840
0183b 488bf0                         mov        rsi, rax
0183e 48898424b0010000               mov        qword ptr [rsp + 0x1b0], rax
01846 90                             nop        
01847 e8949c5d07                     call       0x7f346372f260
0184c 0f1f84004419000b               nop        dword ptr [rax + rax + 0xb001944]
01854 488b8424b0010000               mov        rax, qword ptr [rsp + 0x1b0]
0185c e9d8060000                     jmp        0x7f345c155cb9
01861 48bab0a76350347f0000           movabs     rdx, 0x7f345063a7b0
0186b 4883823006000001               add        qword ptr [rdx + 0x630], 1
01873 48ba00606350347f0000           movabs     rdx, 0x7f3450636000
0187d 8b7278                         mov        esi, dword ptr [rdx + 0x78]
01880 83c602                         add        esi, 2
01883 897278                         mov        dword ptr [rdx + 0x78], esi
01886 81e6feff1f00                   and        esi, 0x1ffffe
0188c 85f6                           test       esi, esi
0188e 0f84e9050000                   je         0x7f345c155bfd
01894 90                             nop        
01895 90                             nop        
01896 90                             nop        
01897 90                             nop        
01898 e910060000                     jmp        0x7f345c155c2d
0189d 90                             nop        
0189e 90                             nop        
0189f 90                             nop        
018a0 90                             nop        
018a1 90                             nop        
018a2 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
018a9 0f8521060000                   jne        0x7f345c155c50
018af 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
018b6 488d7820                       lea        rdi, [rax + 0x20]
018ba 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
018c1 0f8709060000                   ja         0x7f345c155c50
018c7 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
018ce 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
018d5 488908                         mov        qword ptr [rax], rcx
018d8 4833c9                         xor        rcx, rcx
018db 48894808                       mov        qword ptr [rax + 8], rcx
018df 48894810                       mov        qword ptr [rax + 0x10], rcx
018e3 48894818                       mov        qword ptr [rax + 0x18], rcx
018e7 488bd0                         mov        rdx, rax
018ea 48b900606350347f0000           movabs     rcx, 0x7f3450636000
018f4 488381b000000001               add        qword ptr [rcx + 0xb0], 1
018fc ba02000000                     mov        edx, 2
01901 48b9b86326e200000000           movabs     rcx, 0xe22663b8
0190b 488bf0                         mov        rsi, rax
0190e 48898424b8010000               mov        qword ptr [rsp + 0x1b8], rax
01916 90                             nop        
01917 e8c49b5d07                     call       0x7f346372f260
0191c 0f1f8400141a000c               nop        dword ptr [rax + rax + 0xc001a14]
01924 488b8424b8010000               mov        rax, qword ptr [rsp + 0x1b8]
0192c e908060000                     jmp        0x7f345c155cb9
01931 90                             nop        
01932 90                             nop        
01933 90                             nop        
01934 90                             nop        
01935 90                             nop        
01936 90                             nop        
01937 90                             nop        
01938 e9af050000                     jmp        0x7f345c155c6c
0193d 90                             nop        
0193e 90                             nop        
0193f 90                             nop        
01940 90                             nop        
01941 90                             nop        
01942 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
01949 0f85c0050000                   jne        0x7f345c155c8f
0194f 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
01956 488d7820                       lea        rdi, [rax + 0x20]
0195a 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
01961 0f87a8050000                   ja         0x7f345c155c8f
01967 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
0196e 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
01975 488908                         mov        qword ptr [rax], rcx
01978 4833c9                         xor        rcx, rcx
0197b 48894808                       mov        qword ptr [rax + 8], rcx
0197f 48894810                       mov        qword ptr [rax + 0x10], rcx
01983 48894818                       mov        qword ptr [rax + 0x18], rcx
01987 488bd0                         mov        rdx, rax
0198a 48b9b0a76350347f0000           movabs     rcx, 0x7f345063a7b0
01994 488381d000000001               add        qword ptr [rcx + 0xd0], 1
0199c ba02000000                     mov        edx, 2
019a1 48b9006826e200000000           movabs     rcx, 0xe2266800
019ab 488bf0                         mov        rsi, rax
019ae 48898424c0010000               mov        qword ptr [rsp + 0x1c0], rax
019b6 90                             nop        
019b7 e8249b5d07                     call       0x7f346372f260
019bc 0f1f8400b41a000d               nop        dword ptr [rax + rax + 0xd001ab4]
019c4 488b8424c0010000               mov        rax, qword ptr [rsp + 0x1c0]
019cc e968050000                     jmp        0x7f345c155cb9
019d1 49baa0636250347f0000           movabs     r10, 0x7f34506263a0
019db 4c89542408                     mov        qword ptr [rsp + 8], r10
019e0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
019e8 e8739f5007                     call       0x7f346365f6e0
019ed e967e6ffff                     jmp        0x7f345c153dd9
019f2 e8e9125107                     call       0x7f3463666a60
019f7 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01a01 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a05 e8d66df41e                     call       0x7f347b09c560
01a0a f4                             hlt        
01a0b e8d0125107                     call       0x7f3463666a60
01a10 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01a1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a1e e8bd6df41e                     call       0x7f347b09c560
01a23 f4                             hlt        
01a24 48891c24                       mov        qword ptr [rsp], rbx
01a28 4889742408                     mov        qword ptr [rsp + 8], rsi
01a2d e8ae1b5107                     call       0x7f3463667360
01a32 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01a3c 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a40 e89b6df41e                     call       0x7f347b09c560
01a45 f4                             hlt        
01a46 49ba78356250347f0000           movabs     r10, 0x7f3450623578
01a50 4c89542408                     mov        qword ptr [rsp + 8], r10
01a55 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01a5d e8fe9e5007                     call       0x7f346365f6e0
01a62 e976e6ffff                     jmp        0x7f345c153e5d
01a67 e874125107                     call       0x7f3463666a60
01a6c 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01a76 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a7a e8616df41e                     call       0x7f347b09c560
01a7f f4                             hlt        
01a80 e85b125107                     call       0x7f3463666a60
01a85 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01a8f 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a93 e8486df41e                     call       0x7f347b09c560
01a98 f4                             hlt        
01a99 e842125107                     call       0x7f3463666a60
01a9e 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01aa8 4883e4f0                       and        rsp, 0xfffffffffffffff0
01aac e82f6df41e                     call       0x7f347b09c560
01ab1 f4                             hlt        
01ab2 e829125107                     call       0x7f3463666a60
01ab7 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01ac1 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ac5 e8166df41e                     call       0x7f347b09c560
01aca f4                             hlt        
01acb 49bac8376250347f0000           movabs     r10, 0x7f34506237c8
01ad5 4c89542408                     mov        qword ptr [rsp + 8], r10
01ada 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01ae2 e8799e5007                     call       0x7f346365f6e0
01ae7 e919e8ffff                     jmp        0x7f345c154085
01aec 49bac8376250347f0000           movabs     r10, 0x7f34506237c8
01af6 4c89542408                     mov        qword ptr [rsp + 8], r10
01afb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01b03 e8589e5007                     call       0x7f346365f6e0
01b08 e9b7e8ffff                     jmp        0x7f345c154144
01b0d 49baf8366250347f0000           movabs     r10, 0x7f34506236f8
01b17 4c89542408                     mov        qword ptr [rsp + 8], r10
01b1c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01b24 e8379e5007                     call       0x7f346365f6e0
01b29 e918eaffff                     jmp        0x7f345c1542c6
01b2e 49baf8366250347f0000           movabs     r10, 0x7f34506236f8
01b38 4c89542408                     mov        qword ptr [rsp + 8], r10
01b3d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01b45 e8169e5007                     call       0x7f346365f6e0
01b4a e9b0eaffff                     jmp        0x7f345c15437f
01b4f e88c115107                     call       0x7f3463666a60
01b54 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01b5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b62 e8796cf41e                     call       0x7f347b09c560
01b67 f4                             hlt        
01b68 e873115107                     call       0x7f3463666a60
01b6d 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01b77 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b7b e8606cf41e                     call       0x7f347b09c560
01b80 f4                             hlt        
01b81 e85a115107                     call       0x7f3463666a60
01b86 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01b90 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b94 e8476cf41e                     call       0x7f347b09c560
01b99 f4                             hlt        
01b9a e841115107                     call       0x7f3463666a60
01b9f 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01ba9 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bad e82e6cf41e                     call       0x7f347b09c560
01bb2 f4                             hlt        
01bb3 e828115107                     call       0x7f3463666a60
01bb8 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01bc2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bc6 e8156cf41e                     call       0x7f347b09c560
01bcb f4                             hlt        
01bcc e80f115107                     call       0x7f3463666a60
01bd1 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01bdb 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bdf e8fc6bf41e                     call       0x7f347b09c560
01be4 f4                             hlt        
01be5 48890424                       mov        qword ptr [rsp], rax
01be9 48895c2408                     mov        qword ptr [rsp + 8], rbx
01bee e8ed195107                     call       0x7f3463667360
01bf3 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01bfd 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c01 e8da6bf41e                     call       0x7f347b09c560
01c06 f4                             hlt        
01c07 e8d4105107                     call       0x7f3463666a60
01c0c 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01c16 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c1a e8c16bf41e                     call       0x7f347b09c560
01c1f f4                             hlt        
01c20 e8bb105107                     call       0x7f3463666a60
01c25 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01c2f 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c33 e8a86bf41e                     call       0x7f347b09c560
01c38 f4                             hlt        
01c39 48890424                       mov        qword ptr [rsp], rax
01c3d 48895c2408                     mov        qword ptr [rsp + 8], rbx
01c42 e899195107                     call       0x7f3463667360
01c47 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01c51 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c55 e8866bf41e                     call       0x7f347b09c560
01c5a f4                             hlt        
01c5b e880105107                     call       0x7f3463666a60
01c60 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01c6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c6e e86d6bf41e                     call       0x7f347b09c560
01c73 f4                             hlt        
01c74 e867105107                     call       0x7f3463666a60
01c79 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01c83 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c87 e8546bf41e                     call       0x7f347b09c560
01c8c f4                             hlt        
01c8d 48890424                       mov        qword ptr [rsp], rax
01c91 48895c2408                     mov        qword ptr [rsp + 8], rbx
01c96 e845195107                     call       0x7f3463667360
01c9b 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01ca5 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ca9 e8326bf41e                     call       0x7f347b09c560
01cae f4                             hlt        
01caf 49bac8376250347f0000           movabs     r10, 0x7f34506237c8
01cb9 4c89542408                     mov        qword ptr [rsp + 8], r10
01cbe 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01cc6 e8959c5007                     call       0x7f346365f6e0
01ccb e937efffff                     jmp        0x7f345c154987
01cd0 49bac8376250347f0000           movabs     r10, 0x7f34506237c8
01cda 4c89542408                     mov        qword ptr [rsp + 8], r10
01cdf 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01ce7 e8749c5007                     call       0x7f346365f6e0
01cec e9caefffff                     jmp        0x7f345c154a3b
01cf1 49bac8376250347f0000           movabs     r10, 0x7f34506237c8
01cfb 4c89542408                     mov        qword ptr [rsp + 8], r10
01d00 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01d08 e8539c5007                     call       0x7f346365f6e0
01d0d e98ef1ffff                     jmp        0x7f345c154c20
01d12 49bac8376250347f0000           movabs     r10, 0x7f34506237c8
01d1c 4c89542408                     mov        qword ptr [rsp + 8], r10
01d21 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01d29 e8329c5007                     call       0x7f346365f6e0
01d2e e926f2ffff                     jmp        0x7f345c154cd9
01d33 49bac8376250347f0000           movabs     r10, 0x7f34506237c8
01d3d 4c89542408                     mov        qword ptr [rsp + 8], r10
01d42 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01d4a e8119c5007                     call       0x7f346365f6e0
01d4f e9b8f2ffff                     jmp        0x7f345c154d8c
01d54 49bac8376250347f0000           movabs     r10, 0x7f34506237c8
01d5e 4c89542408                     mov        qword ptr [rsp + 8], r10
01d63 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01d6b e8f09b5007                     call       0x7f346365f6e0
01d70 e947f3ffff                     jmp        0x7f345c154e3c
01d75 49baf8366250347f0000           movabs     r10, 0x7f34506236f8
01d7f 4c89542408                     mov        qword ptr [rsp + 8], r10
01d84 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01d8c e8cf9b5007                     call       0x7f346365f6e0
01d91 e948f5ffff                     jmp        0x7f345c15505e
01d96 49baf8366250347f0000           movabs     r10, 0x7f34506236f8
01da0 4c89542408                     mov        qword ptr [rsp + 8], r10
01da5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01dad e8ae9b5007                     call       0x7f346365f6e0
01db2 e9d1f5ffff                     jmp        0x7f345c155108
01db7 49baa0636250347f0000           movabs     r10, 0x7f34506263a0
01dc1 4c89542408                     mov        qword ptr [rsp + 8], r10
01dc6 48c70424a9030000               mov        qword ptr [rsp], 0x3a9
01dce e88d9b5007                     call       0x7f346365f6e0
01dd3 e967f6ffff                     jmp        0x7f345c1551bf
01dd8 e8030f5107                     call       0x7f3463666a60
01ddd 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01de7 4883e4f0                       and        rsp, 0xfffffffffffffff0
01deb e8f069f41e                     call       0x7f347b09c560
01df0 f4                             hlt        
01df1 49ba20a26150347f0000           movabs     r10, 0x7f345061a220
01dfb 4c89542408                     mov        qword ptr [rsp + 8], r10
01e00 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01e08 e8539b5007                     call       0x7f346365f6e0
01e0d e946f8ffff                     jmp        0x7f345c1553d8
01e12 49bab254155c347f0000           movabs     r10, 0x7f345c1554b2
01e1c 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
01e23 e9b8c75d07                     jmp        0x7f3463732360
01e28 49ba3c55155c347f0000           movabs     r10, 0x7f345c15553c
01e32 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
01e39 e9a2c75d07                     jmp        0x7f3463732360
01e3e 48ba0000000000000000           movabs     rdx, 0
01e48 b8000f050a                     mov        eax, 0xa050f00
01e4d e80eaf5007                     call       0x7f3463660ae0
01e52 e971f9ffff                     jmp        0x7f345c155548
01e57 e8840e5107                     call       0x7f3463666a60
01e5c 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01e66 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e6a e87169f41e                     call       0x7f347b09c560
01e6f f4                             hlt        
01e70 488bd2                         mov        rdx, rdx
01e73 e868fe5007                     call       0x7f3463665a60
01e78 e99af9ffff                     jmp        0x7f345c155597
01e7d 49ba687b6250347f0000           movabs     r10, 0x7f3450627b68
01e87 4c89542408                     mov        qword ptr [rsp + 8], r10
01e8c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01e94 e8c79a5007                     call       0x7f346365f6e0
01e99 e9f6f9ffff                     jmp        0x7f345c155614
01e9e 48ba0000000000000000           movabs     rdx, 0
01ea8 b8000f050a                     mov        eax, 0xa050f00
01ead e8aeae5007                     call       0x7f3463660ae0
01eb2 e9e1f9ffff                     jmp        0x7f345c155618
01eb7 e8240e5107                     call       0x7f3463666a60
01ebc 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01ec6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eca e81169f41e                     call       0x7f347b09c560
01ecf f4                             hlt        
01ed0 488bd2                         mov        rdx, rdx
01ed3 e808fe5007                     call       0x7f3463665a60
01ed8 e90afaffff                     jmp        0x7f345c155667
01edd 48ba0000000000000000           movabs     rdx, 0
01ee7 b8000f050a                     mov        eax, 0xa050f00
01eec e86fae5007                     call       0x7f3463660ae0
01ef1 e942faffff                     jmp        0x7f345c1556b8
01ef6 e8e50d5107                     call       0x7f3463666a60
01efb 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
01f05 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f09 e8d268f41e                     call       0x7f347b09c560
01f0e f4                             hlt        
01f0f 488bd2                         mov        rdx, rdx
01f12 e8c9fd5007                     call       0x7f3463665a60
01f17 e96bfaffff                     jmp        0x7f345c155707
01f1c 498b8708060000                 mov        rax, qword ptr [r15 + 0x608]
01f23 49c7870806000000000000         mov        qword ptr [r15 + 0x608], 0
01f2e 49c7871006000000000000         mov        qword ptr [r15 + 0x610], 0
01f39 4881c4d0010000                 add        rsp, 0x1d0
01f40 5d                             pop        rbp
01f41 e91a1d5107                     jmp        0x7f34636679e0
01f46 f4                             hlt        
01f47 f4                             hlt        
