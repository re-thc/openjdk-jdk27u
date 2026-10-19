00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ecc0020000                 sub        rsp, 0x2c0
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 7405                           je         0x7f63d417f19f
0001a e841405b07                     call       0x7f63db7331e0
0001f 4889742468                     mov        qword ptr [rsp + 0x68], rsi
00024 89542460                       mov        dword ptr [rsp + 0x60], edx
00028 894c2464                       mov        dword ptr [rsp + 0x64], ecx
0002c 4c89442470                     mov        qword ptr [rsp + 0x70], r8
00031 4c894c2478                     mov        qword ptr [rsp + 0x78], r9
00036 89bc2480000000                 mov        dword ptr [rsp + 0x80], edi
0003d 48bb38e163c8637f0000           movabs     rbx, 0x7f63c863e138
00047 8b4378                         mov        eax, dword ptr [rbx + 0x78]
0004a 83c002                         add        eax, 2
0004d 894378                         mov        dword ptr [rbx + 0x78], eax
00050 25fe070000                     and        eax, 0x7fe
00055 85c0                           test       eax, eax
00057 0f84811e0000                   je         0x7f63d418105e
0005d 488bda                         mov        rbx, rdx
00060 ffcb                           dec        ebx
00062 3b5e08                         cmp        ebx, dword ptr [rsi + 8]
00065 0f83c61e0000                   jae        0x7f63d41810b1
0006b 4863db                         movsxd     rbx, ebx
0006e 0fbe5c1e0c                     movsx      ebx, byte ptr [rsi + rbx + 0xc]
00073 81e3ff000000                   and        ebx, 0xff
00079 85db                           test       ebx, ebx
0007b 48b838e163c8637f0000           movabs     rax, 0x7f63c863e138
00085 41bbc0000000                   mov        r11d, 0xc0
0008b 7406                           je         0x7f63d417f213
0008d 41bbb0000000                   mov        r11d, 0xb0
00093 4e8b2c18                       mov        r13, qword ptr [rax + r11]
00097 4d8d6d01                       lea        r13, [r13 + 1]
0009b 4e892c18                       mov        qword ptr [rax + r11], r13
0009f 0f84bc190000                   je         0x7f63d4180be1
000a5 48b838e163c8637f0000           movabs     rax, 0x7f63c863e138
000af 488380e000000001               add        qword ptr [rax + 0xe0], 1
000b7 48b8382f63c8637f0000           movabs     rax, 0x7f63c8632f38
000c1 448b5878                       mov        r11d, dword ptr [rax + 0x78]
000c5 4183c302                       add        r11d, 2
000c9 44895878                       mov        dword ptr [rax + 0x78], r11d
000cd 4181e3feff1f00                 and        r11d, 0x1ffffe
000d4 4585db                         test       r11d, r11d
000d7 0f84761e0000                   je         0x7f63d41810d3
000dd 48b8382f63c8637f0000           movabs     rax, 0x7f63c8632f38
000e7 488380b000000001               add        qword ptr [rax + 0xb0], 1
000ef 488bf3                         mov        rsi, rbx
000f2 90                             nop        
000f3 90                             nop        
000f4 90                             nop        
000f5 90                             nop        
000f6 90                             nop        
000f7 e8e4495c07                     call       0x7f63db743c60
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
00126 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
00130 488381f000000001               add        qword ptr [rcx + 0xf0], 1
00138 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
0013d 89942484000000                 mov        dword ptr [rsp + 0x84], edx
00144 8b542464                       mov        edx, dword ptr [rsp + 0x64]
00148 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
0014c 90                             nop        
0014d 90                             nop        
0014e 90                             nop        
0014f e88c495c07                     call       0x7f63db743c60
00154 0f1f84004c020001               nop        dword ptr [rax + rax + 0x100024c]
0015c 48be38e163c8637f0000           movabs     rsi, 0x7f63c863e138
00166 4883860001000001               add        qword ptr [rsi + 0x100], 1
0016e 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00172 83e908                         sub        ecx, 8
00175 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
0017a 8b542464                       mov        edx, dword ptr [rsp + 0x64]
0017e 4889842490000000               mov        qword ptr [rsp + 0x90], rax
00186 90                             nop        
00187 e854495c07                     call       0x7f63db743c60
0018c 0f1f840084020002               nop        dword ptr [rax + rax + 0x2000284]
00194 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00199 418b781c                       mov        edi, dword ptr [r8 + 0x1c]
0019d 4c3b2534261a21                 cmp        r12, qword ptr [rip + 0x211a2634]
001a4 0f8414000000                   je         0x7f63d417f33e
001aa 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
001b4 4883e4f0                       and        rsp, 0xfffffffffffffff0
001b8 e8c3155b20                     call       0x7f63f4730900
001bd f4                             hlt        
001be 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
001c6 418b5820                       mov        ebx, dword ptr [r8 + 0x20]
001ca 4c3b2507261a21                 cmp        r12, qword ptr [rip + 0x211a2607]
001d1 0f8414000000                   je         0x7f63d417f36b
001d7 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
001e1 4883e4f0                       and        rsp, 0xfffffffffffffff0
001e5 e896155b20                     call       0x7f63f4730900
001ea f4                             hlt        
001eb 458b4824                       mov        r9d, dword ptr [r8 + 0x24]
001ef 4c3b25e2251a21                 cmp        r12, qword ptr [rip + 0x211a25e2]
001f6 0f8414000000                   je         0x7f63d417f390
001fc 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
00206 4883e4f0                       and        rsp, 0xfffffffffffffff0
0020a e871155b20                     call       0x7f63f4730900
0020f f4                             hlt        
00210 8b4f08                         mov        ecx, dword ptr [rdi + 8]
00213 8b7308                         mov        esi, dword ptr [rbx + 8]
00216 418b5108                       mov        edx, dword ptr [r9 + 8]
0021a 03ce                           add        ecx, esi
0021c 03ca                           add        ecx, edx
0021e 898c24a0000000                 mov        dword ptr [rsp + 0xa0], ecx
00225 be40000000                     mov        esi, 0x40
0022a 2bb42484000000                 sub        esi, dword ptr [rsp + 0x84]
00231 85c9                           test       ecx, ecx
00233 48ba38e163c8637f0000           movabs     rdx, 0x7f63c863e138
0023d 41bb10010000                   mov        r11d, 0x110
00243 7506                           jne        0x7f63d417f3cb
00245 41bb20010000                   mov        r11d, 0x120
0024b 4e8b2c1a                       mov        r13, qword ptr [rdx + r11]
0024f 4d8d6d01                       lea        r13, [r13 + 1]
00253 4e892c1a                       mov        qword ptr [rdx + r11], r13
00257 0f8526000000                   jne        0x7f63d417f403
0025d 48be38e163c8637f0000           movabs     rsi, 0x7f63c863e138
00267 ff8630010000                   inc        dword ptr [rsi + 0x130]
0026d 41bb00000000                   mov        r11d, 0
00273 4c8be9                         mov        r13, rcx
00276 4c8bb42490000000               mov        r14, qword ptr [rsp + 0x90]
0027e e9b0010000                     jmp        0x7f63d417f5b3
00283 3bce                           cmp        ecx, esi
00285 48ba38e163c8637f0000           movabs     rdx, 0x7f63c863e138
0028f 41bb48010000                   mov        r11d, 0x148
00295 7f06                           jg         0x7f63d417f41d
00297 41bb58010000                   mov        r11d, 0x158
0029d 4e8b2c1a                       mov        r13, qword ptr [rdx + r11]
002a1 4d8d6d01                       lea        r13, [r13 + 1]
002a5 4e892c1a                       mov        qword ptr [rdx + r11], r13
002a9 0f8fc5000000                   jg         0x7f63d417f4f4
002af 2bf1                           sub        esi, ecx
002b1 4c8be9                         mov        r13, rcx
002b4 488bce                         mov        rcx, rsi
002b7 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
002bf 48d3ee                         shr        rsi, cl
002c2 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
002cc 4883816801000001               add        qword ptr [rcx + 0x168], 1
002d4 48b9303263c8637f0000           movabs     rcx, 0x7f63c8633230
002de 8b5178                         mov        edx, dword ptr [rcx + 0x78]
002e1 83c202                         add        edx, 2
002e4 895178                         mov        dword ptr [rcx + 0x78], edx
002e7 81e2feff1f00                   and        edx, 0x1ffffe
002ed 85d2                           test       edx, edx
002ef 0f84e31c0000                   je         0x7f63d4181158
002f5 4183fd40                       cmp        r13d, 0x40
002f9 48b9303263c8637f0000           movabs     rcx, 0x7f63c8633230
00303 bab0000000                     mov        edx, 0xb0
00308 7c05                           jl         0x7f63d417f48f
0030a bac0000000                     mov        edx, 0xc0
0030f 4c8b1c11                       mov        r11, qword ptr [rcx + rdx]
00313 4d8d5b01                       lea        r11, [r11 + 1]
00317 4c891c11                       mov        qword ptr [rcx + rdx], r11
0031b 0f8c1c000000                   jl         0x7f63d417f4bd
00321 48b9303263c8637f0000           movabs     rcx, 0x7f63c8633230
0032b ff81d0000000                   inc        dword ptr [rcx + 0xd0]
00331 48c7c2ffffffff                 mov        rdx, 0xffffffffffffffff
00338 e914000000                     jmp        0x7f63d417f4d1
0033d ba01000000                     mov        edx, 1
00342 498bcd                         mov        rcx, r13
00345 4c8bda                         mov        r11, rdx
00348 49d3e3                         shl        r11, cl
0034b 4c2bda                         sub        r11, rdx
0034e 498bd3                         mov        rdx, r11
00351 4823d6                         and        rdx, rsi
00354 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
0035e ff8178010000                   inc        dword ptr [rcx + 0x178]
00364 4c8bda                         mov        r11, rdx
00367 4c8bb42490000000               mov        r14, qword ptr [rsp + 0x90]
0036f e9bf000000                     jmp        0x7f63d417f5b3
00374 4c8be9                         mov        r13, rcx
00377 498bd5                         mov        rdx, r13
0037a 2bd6                           sub        edx, esi
0037c 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
00386 4883819001000001               add        qword ptr [rcx + 0x190], 1
0038e 48b9303263c8637f0000           movabs     rcx, 0x7f63c8633230
00398 448b5978                       mov        r11d, dword ptr [rcx + 0x78]
0039c 4183c302                       add        r11d, 2
003a0 44895978                       mov        dword ptr [rcx + 0x78], r11d
003a4 4181e3feff1f00                 and        r11d, 0x1ffffe
003ab 4585db                         test       r11d, r11d
003ae 0f84451c0000                   je         0x7f63d4181179
003b4 83fe40                         cmp        esi, 0x40
003b7 48b9303263c8637f0000           movabs     rcx, 0x7f63c8633230
003c1 41bbb0000000                   mov        r11d, 0xb0
003c7 7c06                           jl         0x7f63d417f54f
003c9 41bbc0000000                   mov        r11d, 0xc0
003cf 4e8b3419                       mov        r14, qword ptr [rcx + r11]
003d3 4d8d7601                       lea        r14, [r14 + 1]
003d7 4e893419                       mov        qword ptr [rcx + r11], r14
003db 0f8c1c000000                   jl         0x7f63d417f57d
003e1 48b9303263c8637f0000           movabs     rcx, 0x7f63c8633230
003eb ff81d0000000                   inc        dword ptr [rcx + 0xd0]
003f1 48c7c6ffffffff                 mov        rsi, 0xffffffffffffffff
003f8 e912000000                     jmp        0x7f63d417f58f
003fd 41bb01000000                   mov        r11d, 1
00403 488bce                         mov        rcx, rsi
00406 498bf3                         mov        rsi, r11
00409 48d3e6                         shl        rsi, cl
0040c 492bf3                         sub        rsi, r11
0040f 4c8bb42490000000               mov        r14, qword ptr [rsp + 0x90]
00417 4923f6                         and        rsi, r14
0041a 488bca                         mov        rcx, rdx
0041d 48d3e6                         shl        rsi, cl
00420 b940000000                     mov        ecx, 0x40
00425 2bca                           sub        ecx, edx
00427 488bd0                         mov        rdx, rax
0042a 48d3ea                         shr        rdx, cl
0042d 480bf2                         or         rsi, rdx
00430 4c8bde                         mov        r11, rsi
00433 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
0043a 4103d5                         add        edx, r13d
0043d 83fa40                         cmp        edx, 0x40
00440 48be38e163c8637f0000           movabs     rsi, 0x7f63c863e138
0044a b9b0010000                     mov        ecx, 0x1b0
0044f 7d05                           jge        0x7f63d417f5d6
00451 b9a0010000                     mov        ecx, 0x1a0
00456 488b3c0e                       mov        rdi, qword ptr [rsi + rcx]
0045a 488d7f01                       lea        rdi, [rdi + 1]
0045e 48893c0e                       mov        qword ptr [rsi + rcx], rdi
00462 0f8d1c000000                   jge        0x7f63d417f604
00468 498bf6                         mov        rsi, r14
0046b 8b7c2460                       mov        edi, dword ptr [rsp + 0x60]
0046f 4c899c24b8000000               mov        qword ptr [rsp + 0xb8], r11
00477 48899c24c0000000               mov        qword ptr [rsp + 0xc0], rbx
0047f e98e000000                     jmp        0x7f63d417f692
00484 4c899c24b8000000               mov        qword ptr [rsp + 0xb8], r11
0048c 4c898c24b0000000               mov        qword ptr [rsp + 0xb0], r9
00494 48899c24c0000000               mov        qword ptr [rsp + 0xc0], rbx
0049c 48898424a8000000               mov        qword ptr [rsp + 0xa8], rax
004a4 83ea40                         sub        edx, 0x40
004a7 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
004ac 4183ed08                       sub        r13d, 8
004b0 48be38e163c8637f0000           movabs     rsi, 0x7f63c863e138
004ba 488386c001000001               add        qword ptr [rsi + 0x1c0], 1
004c2 4d8bf5                         mov        r14, r13
004c5 4183ee08                       sub        r14d, 8
004c9 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
004ce 8994248c000000                 mov        dword ptr [rsp + 0x8c], edx
004d5 8b542464                       mov        edx, dword ptr [rsp + 0x64]
004d9 498bce                         mov        rcx, r14
004dc 4489ac24a4000000               mov        dword ptr [rsp + 0xa4], r13d
004e4 90                             nop        
004e5 90                             nop        
004e6 90                             nop        
004e7 e8f4455c07                     call       0x7f63db743c60
004ec 0f1f8400e4050003               nop        dword ptr [rax + rax + 0x30005e4]
004f4 8b94248c000000                 mov        edx, dword ptr [rsp + 0x8c]
004fb 488bb424a8000000               mov        rsi, qword ptr [rsp + 0xa8]
00503 8bbc24a4000000                 mov        edi, dword ptr [rsp + 0xa4]
0050a 4c8b8c24b0000000               mov        r9, qword ptr [rsp + 0xb0]
00512 418b5908                       mov        ebx, dword ptr [r9 + 8]
00516 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
00520 488381d001000001               add        qword ptr [rcx + 0x1d0], 1
00528 48b9303363c8637f0000           movabs     rcx, 0x7f63c8633330
00532 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
00536 4183c002                       add        r8d, 2
0053a 44894178                       mov        dword ptr [rcx + 0x78], r8d
0053e 4181e0feff1f00                 and        r8d, 0x1ffffe
00545 4585c0                         test       r8d, r8d
00548 0f84cc1a0000                   je         0x7f63d418119a
0054e 83fb20                         cmp        ebx, 0x20
00551 48b9303363c8637f0000           movabs     rcx, 0x7f63c8633330
0055b 41b8b0000000                   mov        r8d, 0xb0
00561 7c06                           jl         0x7f63d417f6e9
00563 41b8c0000000                   mov        r8d, 0xc0
00569 4e8b1c01                       mov        r11, qword ptr [rcx + r8]
0056d 4d8d5b01                       lea        r11, [r11 + 1]
00571 4e891c01                       mov        qword ptr [rcx + r8], r11
00575 0f8c1b000000                   jl         0x7f63d417f716
0057b 48b9303363c8637f0000           movabs     rcx, 0x7f63c8633330
00585 ff81d0000000                   inc        dword ptr [rcx + 0xd0]
0058b 41b8ffffffff                   mov        r8d, 0xffffffff
00591 e90f000000                     jmp        0x7f63d417f725
00596 488bcb                         mov        rcx, rbx
00599 41b801000000                   mov        r8d, 1
0059f 41d3e0                         shl        r8d, cl
005a2 41ffc8                         dec        r8d
005a5 89bc24c8000000                 mov        dword ptr [rsp + 0xc8], edi
005ac 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
005b4 4c8bac24c0000000               mov        r13, qword ptr [rsp + 0xc0]
005bc 4d63c0                         movsxd     r8, r8d
005bf 4d23c3                         and        r8, r11
005c2 458bc0                         mov        r8d, r8d
005c5 488bcb                         mov        rcx, rbx
005c8 49d3eb                         shr        r11, cl
005cb 418b5d08                       mov        ebx, dword ptr [r13 + 8]
005cf 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
005d9 488381e001000001               add        qword ptr [rcx + 0x1e0], 1
005e1 48b9303363c8637f0000           movabs     rcx, 0x7f63c8633330
005eb 448b7178                       mov        r14d, dword ptr [rcx + 0x78]
005ef 4183c602                       add        r14d, 2
005f3 44897178                       mov        dword ptr [rcx + 0x78], r14d
005f7 4181e6feff1f00                 and        r14d, 0x1ffffe
005fe 4585f6                         test       r14d, r14d
00601 0f84341a0000                   je         0x7f63d41811bb
00607 83fb20                         cmp        ebx, 0x20
0060a 48b9303363c8637f0000           movabs     rcx, 0x7f63c8633330
00614 41beb0000000                   mov        r14d, 0xb0
0061a 7c06                           jl         0x7f63d417f7a2
0061c 41bec0000000                   mov        r14d, 0xc0
00622 4a8b3c31                       mov        rdi, qword ptr [rcx + r14]
00626 488d7f01                       lea        rdi, [rdi + 1]
0062a 4a893c31                       mov        qword ptr [rcx + r14], rdi
0062e 0f8c1a000000                   jl         0x7f63d417f7ce
00634 48b9303363c8637f0000           movabs     rcx, 0x7f63c8633330
0063e ff81d0000000                   inc        dword ptr [rcx + 0xd0]
00644 bfffffffff                     mov        edi, 0xffffffff
00649 e90c000000                     jmp        0x7f63d417f7da
0064e 488bcb                         mov        rcx, rbx
00651 bf01000000                     mov        edi, 1
00656 d3e7                           shl        edi, cl
00658 ffcf                           dec        edi
0065a 899424cc000000                 mov        dword ptr [rsp + 0xcc], edx
00661 48898424d8000000               mov        qword ptr [rsp + 0xd8], rax
00669 4889b424d0000000               mov        qword ptr [rsp + 0xd0], rsi
00671 488b8c2498000000               mov        rcx, qword ptr [rsp + 0x98]
00679 4c8b742478                     mov        r14, qword ptr [rsp + 0x78]
0067e 4863ff                         movsxd     rdi, edi
00681 4923fb                         and        rdi, r11
00684 8bff                           mov        edi, edi
00686 488bf1                         mov        rsi, rcx
00689 488bcb                         mov        rcx, rbx
0068c 49d3eb                         shr        r11, cl
0068f 458bdb                         mov        r11d, r11d
00692 418b9ef4000000                 mov        ebx, dword ptr [r14 + 0xf4]
00699 4c3b2538211a21                 cmp        r12, qword ptr [rip + 0x211a2138]
006a0 0f8414000000                   je         0x7f63d417f83a
006a6 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
006b0 4883e4f0                       and        rsp, 0xfffffffffffffff0
006b4 e8c7105b20                     call       0x7f63f4730900
006b9 f4                             hlt        
006ba 418b8ef8000000                 mov        ecx, dword ptr [r14 + 0xf8]
006c1 4c3b2510211a21                 cmp        r12, qword ptr [rip + 0x211a2110]
006c8 0f8414000000                   je         0x7f63d417f862
006ce 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
006d8 4883e4f0                       and        rsp, 0xfffffffffffffff0
006dc e89f105b20                     call       0x7f63f4730900
006e1 f4                             hlt        
006e2 418b4628                       mov        eax, dword ptr [r14 + 0x28]
006e6 448b7618                       mov        r14d, dword ptr [rsi + 0x18]
006ea 4c3b25e7201a21                 cmp        r12, qword ptr [rip + 0x211a20e7]
006f1 0f8414000000                   je         0x7f63d417f88b
006f7 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
00701 4883e4f0                       and        rsp, 0xfffffffffffffff0
00705 e876105b20                     call       0x7f63f4730900
0070a f4                             hlt        
0070b 458b7608                       mov        r14d, dword ptr [r14 + 8]
0070f 41ffce                         dec        r14d
00712 418b5518                       mov        edx, dword ptr [r13 + 0x18]
00716 4c3b25bb201a21                 cmp        r12, qword ptr [rip + 0x211a20bb]
0071d 0f8414000000                   je         0x7f63d417f8b7
00723 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
0072d 4883e4f0                       and        rsp, 0xfffffffffffffff0
00731 e84a105b20                     call       0x7f63f4730900
00736 f4                             hlt        
00737 8b5208                         mov        edx, dword ptr [rdx + 8]
0073a ffca                           dec        edx
0073c 418b7118                       mov        esi, dword ptr [r9 + 0x18]
00740 4c3b2591201a21                 cmp        r12, qword ptr [rip + 0x211a2091]
00747 0f8414000000                   je         0x7f63d417f8e1
0074d 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
00757 4883e4f0                       and        rsp, 0xfffffffffffffff0
0075b e820105b20                     call       0x7f63f4730900
00760 f4                             hlt        
00761 8b7608                         mov        esi, dword ptr [rsi + 8]
00764 ffce                           dec        esi
00766 4c89ac24e0000000               mov        qword ptr [rsp + 0xe0], r13
0076e 4c8bac2498000000               mov        r13, qword ptr [rsp + 0x98]
00776 4c89ac24e8000000               mov        qword ptr [rsp + 0xe8], r13
0077e 448bac24a0000000               mov        r13d, dword ptr [rsp + 0xa0]
00786 4489ac24f0000000               mov        dword ptr [rsp + 0xf0], r13d
0078e 448bac24cc000000               mov        r13d, dword ptr [rsp + 0xcc]
00796 4489ac24f4000000               mov        dword ptr [rsp + 0xf4], r13d
0079e 4c8bac24d8000000               mov        r13, qword ptr [rsp + 0xd8]
007a6 4c89ac24f8000000               mov        qword ptr [rsp + 0xf8], r13
007ae 4c8bac24d0000000               mov        r13, qword ptr [rsp + 0xd0]
007b6 4c89ac2400010000               mov        qword ptr [rsp + 0x100], r13
007be 448bac24c8000000               mov        r13d, dword ptr [rsp + 0xc8]
007c6 4489ac2408010000               mov        dword ptr [rsp + 0x108], r13d
007ce 448bac2488000000               mov        r13d, dword ptr [rsp + 0x88]
007d6 4489ac240c010000               mov        dword ptr [rsp + 0x10c], r13d
007de 448bac24d0020000               mov        r13d, dword ptr [rsp + 0x2d0]
007e6 4489ac2410010000               mov        dword ptr [rsp + 0x110], r13d
007ee 448bac2480000000               mov        r13d, dword ptr [rsp + 0x80]
007f6 4489ac2414010000               mov        dword ptr [rsp + 0x114], r13d
007fe 4c8b6c2478                     mov        r13, qword ptr [rsp + 0x78]
00803 4c89ac2418010000               mov        qword ptr [rsp + 0x118], r13
0080b 4c8b6c2470                     mov        r13, qword ptr [rsp + 0x70]
00810 4c89ac2420010000               mov        qword ptr [rsp + 0x120], r13
00818 448b6c2464                     mov        r13d, dword ptr [rsp + 0x64]
0081d 4489ac2428010000               mov        dword ptr [rsp + 0x128], r13d
00825 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
0082a 4489ac242c010000               mov        dword ptr [rsp + 0x12c], r13d
00832 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
00837 4c89ac2430010000               mov        qword ptr [rsp + 0x130], r13
0083f 41bd00000000                   mov        r13d, 0
00845 4c898c2438010000               mov        qword ptr [rsp + 0x138], r9
0084d 41b900000000                   mov        r9d, 0
00853 89b424d8010000                 mov        dword ptr [rsp + 0x1d8], esi
0085a 898424dc010000                 mov        dword ptr [rsp + 0x1dc], eax
00861 4c898c24e0010000               mov        qword ptr [rsp + 0x1e0], r9
00869 48898c24f0010000               mov        qword ptr [rsp + 0x1f0], rcx
00871 48899c24e8010000               mov        qword ptr [rsp + 0x1e8], rbx
00879 4c8b8c2438010000               mov        r9, qword ptr [rsp + 0x138]
00881 488b8424e0000000               mov        rax, qword ptr [rsp + 0xe0]
00889 488b9c24e8000000               mov        rbx, qword ptr [rsp + 0xe8]
00891 8bb42414010000                 mov        esi, dword ptr [rsp + 0x114]
00898 443bee                         cmp        r13d, esi
0089b 89b42414010000                 mov        dword ptr [rsp + 0x114], esi
008a2 48be38e163c8637f0000           movabs     rsi, 0x7f63c863e138
008ac 4489ac24f8010000               mov        dword ptr [rsp + 0x1f8], r13d
008b4 41bdf0010000                   mov        r13d, 0x1f0
008ba 7d06                           jge        0x7f63d417fa42
008bc 41bd00020000                   mov        r13d, 0x200
008c2 4a8b0c2e                       mov        rcx, qword ptr [rsi + r13]
008c6 488d4901                       lea        rcx, [rcx + 1]
008ca 4a890c2e                       mov        qword ptr [rsi + r13], rcx
008ce 0f8de00e0000                   jge        0x7f63d4180934
008d4 8bb424d8010000                 mov        esi, dword ptr [rsp + 0x1d8]
008db 8b4b18                         mov        ecx, dword ptr [rbx + 0x18]
008de 4c3b25f31e1a21                 cmp        r12, qword ptr [rip + 0x211a1ef3]
008e5 0f8414000000                   je         0x7f63d417fa7f
008eb 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
008f5 4883e4f0                       and        rsp, 0xfffffffffffffff0
008f9 e8820e5b20                     call       0x7f63f4730900
008fe f4                             hlt        
008ff 4d8beb                         mov        r13, r11
00902 4d23ee                         and        r13, r14
00905 443b6908                       cmp        r13d, dword ptr [rcx + 8]
00909 0f83fc170000                   jae        0x7f63d418128b
0090f 4d63ed                         movsxd     r13, r13d
00912 48899c24e8000000               mov        qword ptr [rsp + 0xe8], rbx
0091a 4a8b5ce910                     mov        rbx, qword ptr [rcx + r13*8 + 0x10]
0091f 48899c2410020000               mov        qword ptr [rsp + 0x210], rbx
00927 8b4818                         mov        ecx, dword ptr [rax + 0x18]
0092a 4c3b25a71e1a21                 cmp        r12, qword ptr [rip + 0x211a1ea7]
00931 0f8414000000                   je         0x7f63d417facb
00937 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
00941 4883e4f0                       and        rsp, 0xfffffffffffffff0
00945 e8360e5b20                     call       0x7f63f4730900
0094a f4                             hlt        
0094b 4c8bef                         mov        r13, rdi
0094e 4c23ea                         and        r13, rdx
00951 443b6908                       cmp        r13d, dword ptr [rcx + 8]
00955 0f831d180000                   jae        0x7f63d41812f8
0095b 4d63ed                         movsxd     r13, r13d
0095e 89bc24fc010000                 mov        dword ptr [rsp + 0x1fc], edi
00965 4a8b7ce910                     mov        rdi, qword ptr [rcx + r13*8 + 0x10]
0096a 4889bc2428020000               mov        qword ptr [rsp + 0x228], rdi
00972 418b4918                       mov        ecx, dword ptr [r9 + 0x18]
00976 4c3b255b1e1a21                 cmp        r12, qword ptr [rip + 0x211a1e5b]
0097d 0f8414000000                   je         0x7f63d417fb17
00983 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
0098d 4883e4f0                       and        rsp, 0xfffffffffffffff0
00991 e8ea0d5b20                     call       0x7f63f4730900
00996 f4                             hlt        
00997 4d8be8                         mov        r13, r8
0099a 4c23ee                         and        r13, rsi
0099d 443b6908                       cmp        r13d, dword ptr [rcx + 8]
009a1 0f833e180000                   jae        0x7f63d4181365
009a7 4d63ed                         movsxd     r13, r13d
009aa 48898424e0000000               mov        qword ptr [rsp + 0xe0], rax
009b2 4a8b44e910                     mov        rax, qword ptr [rcx + r13*8 + 0x10]
009b7 4889842418020000               mov        qword ptr [rsp + 0x218], rax
009bf 89b424d8010000                 mov        dword ptr [rsp + 0x1d8], esi
009c6 b920000000                     mov        ecx, 0x20
009cb 4c8bef                         mov        r13, rdi
009ce 49d3ed                         shr        r13, cl
009d1 458bed                         mov        r13d, r13d
009d4 4181e5ff000000                 and        r13d, 0xff
009db b920000000                     mov        ecx, 0x20
009e0 488bf0                         mov        rsi, rax
009e3 48d3ee                         shr        rsi, cl
009e6 8bf6                           mov        esi, esi
009e8 81e6ff000000                   and        esi, 0xff
009ee 89b42420020000                 mov        dword ptr [rsp + 0x220], esi
009f5 b920000000                     mov        ecx, 0x20
009fa 89942400020000                 mov        dword ptr [rsp + 0x200], edx
00a01 488bd3                         mov        rdx, rbx
00a04 48d3ea                         shr        rdx, cl
00a07 8bd2                           mov        edx, edx
00a09 81e2ff000000                   and        edx, 0xff
00a0f 89942434020000                 mov        dword ptr [rsp + 0x234], edx
00a16 8b8c24f8010000                 mov        ecx, dword ptr [rsp + 0x1f8]
00a1d ffc1                           inc        ecx
00a1f 3b8c2414010000                 cmp        ecx, dword ptr [rsp + 0x114]
00a26 4489842404020000               mov        dword ptr [rsp + 0x204], r8d
00a2e 49b838e163c8637f0000           movabs     r8, 0x7f63c863e138
00a38 4c898c2438010000               mov        qword ptr [rsp + 0x138], r9
00a40 41b910020000                   mov        r9d, 0x210
00a46 7d06                           jge        0x7f63d417fbce
00a48 41b920020000                   mov        r9d, 0x220
00a4e 44899c2408020000               mov        dword ptr [rsp + 0x208], r11d
00a56 4f8b1c08                       mov        r11, qword ptr [r8 + r9]
00a5a 4d8d5b01                       lea        r11, [r11 + 1]
00a5e 4f891c08                       mov        qword ptr [r8 + r9], r11
00a62 0f8d1c000000                   jge        0x7f63d417fc04
00a68 49b838e163c8637f0000           movabs     r8, 0x7f63c863e138
00a72 41ff8030020000                 inc        dword ptr [r8 + 0x230]
00a79 41b801000000                   mov        r8d, 1
00a7f e906000000                     jmp        0x7f63d417fc0a
00a84 41b800000000                   mov        r8d, 0
00a8a 4489b4240c020000               mov        dword ptr [rsp + 0x20c], r14d
00a92 4585c0                         test       r8d, r8d
00a95 49b938e163c8637f0000           movabs     r9, 0x7f63c863e138
00a9f 41bb48020000                   mov        r11d, 0x248
00aa5 7406                           je         0x7f63d417fc2d
00aa7 41bb58020000                   mov        r11d, 0x258
00aad 4f8b3419                       mov        r14, qword ptr [r9 + r11]
00ab1 4d8d7601                       lea        r14, [r14 + 1]
00ab5 4f893419                       mov        qword ptr [r9 + r11], r14
00ab9 898c243c020000                 mov        dword ptr [rsp + 0x23c], ecx
00ac0 0f842a000000                   je         0x7f63d417fc70
00ac6 b928000000                     mov        ecx, 0x28
00acb 4c8bdb                         mov        r11, rbx
00ace 49d3eb                         shr        r11, cl
00ad1 458bdb                         mov        r11d, r11d
00ad4 4181e3ff000000                 and        r11d, 0xff
00adb 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
00ae5 ff8168020000                   inc        dword ptr [rcx + 0x268]
00aeb e906000000                     jmp        0x7f63d417fc76
00af0 41bb00000000                   mov        r11d, 0
00af6 4585c0                         test       r8d, r8d
00af9 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
00b03 41be80020000                   mov        r14d, 0x280
00b09 7406                           je         0x7f63d417fc91
00b0b 41be90020000                   mov        r14d, 0x290
00b11 4a8b1c31                       mov        rbx, qword ptr [rcx + r14]
00b15 488d5b01                       lea        rbx, [rbx + 1]
00b19 4a891c31                       mov        qword ptr [rcx + r14], rbx
00b1d 0f8428000000                   je         0x7f63d417fccb
00b23 b928000000                     mov        ecx, 0x28
00b28 488bd8                         mov        rbx, rax
00b2b 48d3eb                         shr        rbx, cl
00b2e 8bdb                           mov        ebx, ebx
00b30 81e3ff000000                   and        ebx, 0xff
00b36 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
00b40 ff81a0020000                   inc        dword ptr [rcx + 0x2a0]
00b46 e905000000                     jmp        0x7f63d417fcd0
00b4b bb00000000                     mov        ebx, 0
00b50 4585c0                         test       r8d, r8d
00b53 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
00b5d 41beb8020000                   mov        r14d, 0x2b8
00b63 7406                           je         0x7f63d417fceb
00b65 41bec8020000                   mov        r14d, 0x2c8
00b6b 4a8b0431                       mov        rax, qword ptr [rcx + r14]
00b6f 488d4001                       lea        rax, [rax + 1]
00b73 4a890431                       mov        qword ptr [rcx + r14], rax
00b77 0f8427000000                   je         0x7f63d417fd24
00b7d b928000000                     mov        ecx, 0x28
00b82 488bc7                         mov        rax, rdi
00b85 48d3e8                         shr        rax, cl
00b88 8bc0                           mov        eax, eax
00b8a 25ff000000                     and        eax, 0xff
00b8f 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
00b99 ff81d8020000                   inc        dword ptr [rcx + 0x2d8]
00b9f e905000000                     jmp        0x7f63d417fd29
00ba4 b800000000                     mov        eax, 0
00ba9 4403db                         add        r11d, ebx
00bac 4403d8                         add        r11d, eax
00baf 498bcd                         mov        rcx, r13
00bb2 03ce                           add        ecx, esi
00bb4 03ca                           add        ecx, edx
00bb6 4c8bf1                         mov        r14, rcx
00bb9 4503f3                         add        r14d, r11d
00bbc 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
00bc6 ff81f0020000                   inc        dword ptr [rcx + 0x2f0]
00bcc 4585f6                         test       r14d, r14d
00bcf 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
00bd9 be80030000                     mov        esi, 0x380
00bde 7505                           jne        0x7f63d417fd65
00be0 be90030000                     mov        esi, 0x390
00be5 488b3c31                       mov        rdi, qword ptr [rcx + rsi]
00be9 488d7f01                       lea        rdi, [rdi + 1]
00bed 48893c31                       mov        qword ptr [rcx + rsi], rdi
00bf1 89842430020000                 mov        dword ptr [rsp + 0x230], eax
00bf8 899c2424020000                 mov        dword ptr [rsp + 0x224], ebx
00bff 0f8550000000                   jne        0x7f63d417fdd5
00c05 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
00c0f ff81a0030000                   inc        dword ptr [rcx + 0x3a0]
00c15 8bbc24f0000000                 mov        edi, dword ptr [rsp + 0xf0]
00c1c 448bb424f4000000               mov        r14d, dword ptr [rsp + 0xf4]
00c24 488bb424f8000000               mov        rsi, qword ptr [rsp + 0xf8]
00c2c 488b8c2400010000               mov        rcx, qword ptr [rsp + 0x100]
00c34 8b9c2408010000                 mov        ebx, dword ptr [rsp + 0x108]
00c3b b800000000                     mov        eax, 0
00c40 4489842438020000               mov        dword ptr [rsp + 0x238], r8d
00c48 4489ac2458020000               mov        dword ptr [rsp + 0x258], r13d
00c50 e91b030000                     jmp        0x7f63d41800f0
00c55 4183fe3f                       cmp        r14d, 0x3f
00c59 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
00c63 beb8030000                     mov        esi, 0x3b8
00c68 7f05                           jg         0x7f63d417fdef
00c6a bec8030000                     mov        esi, 0x3c8
00c6f 488b3c31                       mov        rdi, qword ptr [rcx + rsi]
00c73 488d7f01                       lea        rdi, [rdi + 1]
00c77 48893c31                       mov        qword ptr [rcx + rsi], rdi
00c7b 0f8f58090000                   jg         0x7f63d4180759
00c81 b940000000                     mov        ecx, 0x40
00c86 2b8c24f4000000                 sub        ecx, dword ptr [rsp + 0xf4]
00c8d 443bf1                         cmp        r14d, ecx
00c90 48be38e163c8637f0000           movabs     rsi, 0x7f63c863e138
00c9a bfd8030000                     mov        edi, 0x3d8
00c9f 7f05                           jg         0x7f63d417fe26
00ca1 bfe8030000                     mov        edi, 0x3e8
00ca6 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
00caa 488d5b01                       lea        rbx, [rbx + 1]
00cae 48891c3e                       mov        qword ptr [rsi + rdi], rbx
00cb2 0f8fbd000000                   jg         0x7f63d417fef5
00cb8 412bce                         sub        ecx, r14d
00cbb 488bb42400010000               mov        rsi, qword ptr [rsp + 0x100]
00cc3 48d3ee                         shr        rsi, cl
00cc6 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
00cd0 488381f803000001               add        qword ptr [rcx + 0x3f8], 1
00cd8 48b9303263c8637f0000           movabs     rcx, 0x7f63c8633230
00ce2 8b7978                         mov        edi, dword ptr [rcx + 0x78]
00ce5 83c702                         add        edi, 2
00ce8 897978                         mov        dword ptr [rcx + 0x78], edi
00ceb 81e7feff1f00                   and        edi, 0x1ffffe
00cf1 85ff                           test       edi, edi
00cf3 0f840e150000                   je         0x7f63d4181387
00cf9 4183fe40                       cmp        r14d, 0x40
00cfd 48b9303263c8637f0000           movabs     rcx, 0x7f63c8633230
00d07 bfb0000000                     mov        edi, 0xb0
00d0c 7c05                           jl         0x7f63d417fe93
00d0e bfc0000000                     mov        edi, 0xc0
00d13 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
00d17 488d5b01                       lea        rbx, [rbx + 1]
00d1b 48891c39                       mov        qword ptr [rcx + rdi], rbx
00d1f 0f8c1c000000                   jl         0x7f63d417fec1
00d25 48b9303263c8637f0000           movabs     rcx, 0x7f63c8633230
00d2f ff81d0000000                   inc        dword ptr [rcx + 0xd0]
00d35 48c7c7ffffffff                 mov        rdi, 0xffffffffffffffff
00d3c e914000000                     jmp        0x7f63d417fed5
00d41 bf01000000                     mov        edi, 1
00d46 498bce                         mov        rcx, r14
00d49 488bdf                         mov        rbx, rdi
00d4c 48d3e3                         shl        rbx, cl
00d4f 482bdf                         sub        rbx, rdi
00d52 488bfb                         mov        rdi, rbx
00d55 4823fe                         and        rdi, rsi
00d58 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
00d62 ff8108040000                   inc        dword ptr [rcx + 0x408]
00d68 488b9c2400010000               mov        rbx, qword ptr [rsp + 0x100]
00d70 e9b6000000                     jmp        0x7f63d417ffab
00d75 498bf6                         mov        rsi, r14
00d78 2bf1                           sub        esi, ecx
00d7a 48bf38e163c8637f0000           movabs     rdi, 0x7f63c863e138
00d84 4883872004000001               add        qword ptr [rdi + 0x420], 1
00d8c 48bf303263c8637f0000           movabs     rdi, 0x7f63c8633230
00d96 8b5f78                         mov        ebx, dword ptr [rdi + 0x78]
00d99 83c302                         add        ebx, 2
00d9c 895f78                         mov        dword ptr [rdi + 0x78], ebx
00d9f 81e3feff1f00                   and        ebx, 0x1ffffe
00da5 85db                           test       ebx, ebx
00da7 0f847b140000                   je         0x7f63d41813a8
00dad 83f940                         cmp        ecx, 0x40
00db0 48bf303263c8637f0000           movabs     rdi, 0x7f63c8633230
00dba bbb0000000                     mov        ebx, 0xb0
00dbf 7c05                           jl         0x7f63d417ff46
00dc1 bbc0000000                     mov        ebx, 0xc0
00dc6 488b041f                       mov        rax, qword ptr [rdi + rbx]
00dca 488d4001                       lea        rax, [rax + 1]
00dce 4889041f                       mov        qword ptr [rdi + rbx], rax
00dd2 0f8c1c000000                   jl         0x7f63d417ff74
00dd8 48b9303263c8637f0000           movabs     rcx, 0x7f63c8633230
00de2 ff81d0000000                   inc        dword ptr [rcx + 0xd0]
00de8 48c7c7ffffffff                 mov        rdi, 0xffffffffffffffff
00def e911000000                     jmp        0x7f63d417ff85
00df4 bf01000000                     mov        edi, 1
00df9 488bdf                         mov        rbx, rdi
00dfc 48d3e3                         shl        rbx, cl
00dff 482bdf                         sub        rbx, rdi
00e02 488bfb                         mov        rdi, rbx
00e05 488b9c2400010000               mov        rbx, qword ptr [rsp + 0x100]
00e0d 4823fb                         and        rdi, rbx
00e10 488bce                         mov        rcx, rsi
00e13 48d3e7                         shl        rdi, cl
00e16 b940000000                     mov        ecx, 0x40
00e1b 2bce                           sub        ecx, esi
00e1d 488bb424f8000000               mov        rsi, qword ptr [rsp + 0xf8]
00e25 48d3ee                         shr        rsi, cl
00e28 480bfe                         or         rdi, rsi
00e2b 498bf6                         mov        rsi, r14
00e2e 03b424f4000000                 add        esi, dword ptr [rsp + 0xf4]
00e35 4403b424f0000000               add        r14d, dword ptr [rsp + 0xf0]
00e3d 83fe40                         cmp        esi, 0x40
00e40 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
00e4a b840040000                     mov        eax, 0x440
00e4f 7d05                           jge        0x7f63d417ffd6
00e51 b830040000                     mov        eax, 0x430
00e56 488b1401                       mov        rdx, qword ptr [rcx + rax]
00e5a 488d5201                       lea        rdx, [rdx + 1]
00e5e 48891401                       mov        qword ptr [rcx + rax], rdx
00e62 0f8d33000000                   jge        0x7f63d418001b
00e68 488b9424f8000000               mov        rdx, qword ptr [rsp + 0xf8]
00e70 488bc7                         mov        rax, rdi
00e73 498bfe                         mov        rdi, r14
00e76 4c8bf6                         mov        r14, rsi
00e79 488bf2                         mov        rsi, rdx
00e7c 488bcb                         mov        rcx, rbx
00e7f 8b9c2408010000                 mov        ebx, dword ptr [rsp + 0x108]
00e86 4489842438020000               mov        dword ptr [rsp + 0x238], r8d
00e8e 4489ac2458020000               mov        dword ptr [rsp + 0x258], r13d
00e96 e9d5000000                     jmp        0x7f63d41800f0
00e9b 4489b42448020000               mov        dword ptr [rsp + 0x248], r14d
00ea3 4889bc2440020000               mov        qword ptr [rsp + 0x240], rdi
00eab 44899c2454020000               mov        dword ptr [rsp + 0x254], r11d
00eb3 4489842438020000               mov        dword ptr [rsp + 0x238], r8d
00ebb 4489ac2458020000               mov        dword ptr [rsp + 0x258], r13d
00ec3 8bbc2428010000                 mov        edi, dword ptr [rsp + 0x128]
00eca 4c8bac2430010000               mov        r13, qword ptr [rsp + 0x130]
00ed2 83ee40                         sub        esi, 0x40
00ed5 8b9c2408010000                 mov        ebx, dword ptr [rsp + 0x108]
00edc 83eb08                         sub        ebx, 8
00edf 48b838e163c8637f0000           movabs     rax, 0x7f63c863e138
00ee9 4883805004000001               add        qword ptr [rax + 0x450], 1
00ef1 488bc3                         mov        rax, rbx
00ef4 83e808                         sub        eax, 8
00ef7 89b4244c020000                 mov        dword ptr [rsp + 0x24c], esi
00efe 498bf5                         mov        rsi, r13
00f01 488bd7                         mov        rdx, rdi
00f04 488bc8                         mov        rcx, rax
00f07 89bc2428010000                 mov        dword ptr [rsp + 0x128], edi
00f0e 4c89ac2430010000               mov        qword ptr [rsp + 0x130], r13
00f16 899c2450020000                 mov        dword ptr [rsp + 0x250], ebx
00f1d 90                             nop        
00f1e 90                             nop        
00f1f e8bc3b5c07                     call       0x7f63db743c60
00f24 0f1f84001c100004               nop        dword ptr [rax + rax + 0x400101c]
00f2c 488bc8                         mov        rcx, rax
00f2f 48be38e163c8637f0000           movabs     rsi, 0x7f63c863e138
00f39 ff8660040000                   inc        dword ptr [rsi + 0x460]
00f3f 488b842440020000               mov        rax, qword ptr [rsp + 0x240]
00f47 8bbc2448020000                 mov        edi, dword ptr [rsp + 0x248]
00f4e 448bb4244c020000               mov        r14d, dword ptr [rsp + 0x24c]
00f56 488bf1                         mov        rsi, rcx
00f59 488b8c24f8000000               mov        rcx, qword ptr [rsp + 0xf8]
00f61 8b9c2450020000                 mov        ebx, dword ptr [rsp + 0x250]
00f68 448b9c2454020000               mov        r11d, dword ptr [rsp + 0x254]
00f70 48ba38e163c8637f0000           movabs     rdx, 0x7f63c863e138
00f7a 488382e804000001               add        qword ptr [rdx + 0x4e8], 1
00f82 48ba303263c8637f0000           movabs     rdx, 0x7f63c8633230
00f8c 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
00f90 4183c002                       add        r8d, 2
00f94 44894278                       mov        dword ptr [rdx + 0x78], r8d
00f98 4181e0feff1f00                 and        r8d, 0x1ffffe
00f9f 4585c0                         test       r8d, r8d
00fa2 0f84a1120000                   je         0x7f63d41813c9
00fa8 4183fb40                       cmp        r11d, 0x40
00fac 48ba303263c8637f0000           movabs     rdx, 0x7f63c8633230
00fb6 41b8b0000000                   mov        r8d, 0xb0
00fbc 7c06                           jl         0x7f63d4180144
00fbe 41b8c0000000                   mov        r8d, 0xc0
00fc4 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
00fc8 4d8d4901                       lea        r9, [r9 + 1]
00fcc 4e890c02                       mov        qword ptr [rdx + r8], r9
00fd0 0f8c24000000                   jl         0x7f63d418017a
00fd6 48ba303263c8637f0000           movabs     rdx, 0x7f63c8633230
00fe0 ff82d0000000                   inc        dword ptr [rdx + 0xd0]
00fe6 48c7c2ffffffff                 mov        rdx, 0xffffffffffffffff
00fed 48898c2468020000               mov        qword ptr [rsp + 0x268], rcx
00ff5 e91c000000                     jmp        0x7f63d4180196
00ffa 48898c2468020000               mov        qword ptr [rsp + 0x268], rcx
01002 ba01000000                     mov        edx, 1
01007 498bcb                         mov        rcx, r11
0100a 4c8bca                         mov        r9, rdx
0100d 49d3e1                         shl        r9, cl
01010 4c2bca                         sub        r9, rdx
01013 498bd1                         mov        rdx, r9
01016 448b8c2434020000               mov        r9d, dword ptr [rsp + 0x234]
0101e 4823d0                         and        rdx, rax
01021 8bd2                           mov        edx, edx
01023 498bcb                         mov        rcx, r11
01026 48d3e8                         shr        rax, cl
01029 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
01033 488381f804000001               add        qword ptr [rcx + 0x4f8], 1
0103b 48b9303263c8637f0000           movabs     rcx, 0x7f63c8633230
01045 448b5978                       mov        r11d, dword ptr [rcx + 0x78]
01049 4183c302                       add        r11d, 2
0104d 44895978                       mov        dword ptr [rcx + 0x78], r11d
01051 4181e3feff1f00                 and        r11d, 0x1ffffe
01058 4585db                         test       r11d, r11d
0105b 0f8409120000                   je         0x7f63d41813ea
01061 4183f940                       cmp        r9d, 0x40
01065 48b9303263c8637f0000           movabs     rcx, 0x7f63c8633230
0106f 41bbb0000000                   mov        r11d, 0xb0
01075 7c06                           jl         0x7f63d41801fd
01077 41bbc0000000                   mov        r11d, 0xc0
0107d 4e8b2c19                       mov        r13, qword ptr [rcx + r11]
01081 4d8d6d01                       lea        r13, [r13 + 1]
01085 4e892c19                       mov        qword ptr [rcx + r11], r13
01089 0f8c1c000000                   jl         0x7f63d418022b
0108f 48b9303263c8637f0000           movabs     rcx, 0x7f63c8633230
01099 ff81d0000000                   inc        dword ptr [rcx + 0xd0]
0109f 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
010a6 e915000000                     jmp        0x7f63d4180240
010ab 41bb01000000                   mov        r11d, 1
010b1 498bc9                         mov        rcx, r9
010b4 4d8beb                         mov        r13, r11
010b7 49d3e5                         shl        r13, cl
010ba 4d2beb                         sub        r13, r11
010bd 4d8bdd                         mov        r11, r13
010c0 4889b42460020000               mov        qword ptr [rsp + 0x260], rsi
010c8 448bac2420020000               mov        r13d, dword ptr [rsp + 0x220]
010d0 4c23d8                         and        r11, rax
010d3 458bdb                         mov        r11d, r11d
010d6 498bc9                         mov        rcx, r9
010d9 48d3e8                         shr        rax, cl
010dc 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
010e6 4883810805000001               add        qword ptr [rcx + 0x508], 1
010ee 48b9303263c8637f0000           movabs     rcx, 0x7f63c8633230
010f8 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
010fc 4183c102                       add        r9d, 2
01100 44894978                       mov        dword ptr [rcx + 0x78], r9d
01104 4181e1feff1f00                 and        r9d, 0x1ffffe
0110b 4585c9                         test       r9d, r9d
0110e 0f8477110000                   je         0x7f63d418140b
01114 4183fd40                       cmp        r13d, 0x40
01118 48b9303263c8637f0000           movabs     rcx, 0x7f63c8633230
01122 41b9b0000000                   mov        r9d, 0xb0
01128 7c06                           jl         0x7f63d41802b0
0112a 41b9c0000000                   mov        r9d, 0xc0
01130 4a8b3409                       mov        rsi, qword ptr [rcx + r9]
01134 488d7601                       lea        rsi, [rsi + 1]
01138 4a893409                       mov        qword ptr [rcx + r9], rsi
0113c 0f8c1c000000                   jl         0x7f63d41802de
01142 48b9303263c8637f0000           movabs     rcx, 0x7f63c8633230
0114c ff81d0000000                   inc        dword ptr [rcx + 0xd0]
01152 48c7c6ffffffff                 mov        rsi, 0xffffffffffffffff
01159 e914000000                     jmp        0x7f63d41802f2
0115e be01000000                     mov        esi, 1
01163 498bcd                         mov        rcx, r13
01166 4c8bce                         mov        r9, rsi
01169 49d3e1                         shl        r9, cl
0116c 4c2bce                         sub        r9, rsi
0116f 498bf1                         mov        rsi, r9
01172 89bc245c020000                 mov        dword ptr [rsp + 0x25c], edi
01179 448b8c2458020000               mov        r9d, dword ptr [rsp + 0x258]
01181 4823f0                         and        rsi, rax
01184 8bf6                           mov        esi, esi
01186 498bcd                         mov        rcx, r13
01189 48d3e8                         shr        rax, cl
0118c 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
01196 4883811805000001               add        qword ptr [rcx + 0x518], 1
0119e 48b9303263c8637f0000           movabs     rcx, 0x7f63c8633230
011a8 448b6978                       mov        r13d, dword ptr [rcx + 0x78]
011ac 4183c502                       add        r13d, 2
011b0 44896978                       mov        dword ptr [rcx + 0x78], r13d
011b4 4181e5feff1f00                 and        r13d, 0x1ffffe
011bb 4585ed                         test       r13d, r13d
011be 0f84e8100000                   je         0x7f63d418142c
011c4 4183f940                       cmp        r9d, 0x40
011c8 48b9303263c8637f0000           movabs     rcx, 0x7f63c8633230
011d2 41bdb0000000                   mov        r13d, 0xb0
011d8 7c06                           jl         0x7f63d4180360
011da 41bdc0000000                   mov        r13d, 0xc0
011e0 4a8b3c29                       mov        rdi, qword ptr [rcx + r13]
011e4 488d7f01                       lea        rdi, [rdi + 1]
011e8 4a893c29                       mov        qword ptr [rcx + r13], rdi
011ec 0f8c1c000000                   jl         0x7f63d418038e
011f2 48b9303263c8637f0000           movabs     rcx, 0x7f63c8633230
011fc ff81d0000000                   inc        dword ptr [rcx + 0xd0]
01202 48c7c7ffffffff                 mov        rdi, 0xffffffffffffffff
01209 e914000000                     jmp        0x7f63d41803a2
0120e bf01000000                     mov        edi, 1
01213 498bc9                         mov        rcx, r9
01216 4c8bcf                         mov        r9, rdi
01219 49d3e1                         shl        r9, cl
0121c 4c2bcf                         sub        r9, rdi
0121f 498bf9                         mov        rdi, r9
01222 488b8c2418020000               mov        rcx, qword ptr [rsp + 0x218]
0122a 4c8b8c2410020000               mov        r9, qword ptr [rsp + 0x210]
01232 4c8bac24e0010000               mov        r13, qword ptr [rsp + 0x1e0]
0123a 4823f8                         and        rdi, rax
0123d 488b842428020000               mov        rax, qword ptr [rsp + 0x228]
01245 41baffffffff                   mov        r10d, 0xffffffff
0124b 4923c2                         and        rax, r10
0124e 4803c7                         add        rax, rdi
01251 8bf9                           mov        edi, ecx
01253 03fe                           add        edi, esi
01255 89bc2474020000                 mov        dword ptr [rsp + 0x274], edi
0125c 418bf1                         mov        esi, r9d
0125f 4103f3                         add        esi, r11d
01262 4c63df                         movsxd     r11, edi
01265 4d03dd                         add        r11, r13
01268 49bd38e163c8637f0000           movabs     r13, 0x7f63c863e138
01272 41ff8528050000                 inc        dword ptr [r13 + 0x528]
01279 4c899c2480020000               mov        qword ptr [rsp + 0x280], r11
01281 89b42478020000                 mov        dword ptr [rsp + 0x278], esi
01288 8994247c020000                 mov        dword ptr [rsp + 0x27c], edx
0128f 4489b42488020000               mov        dword ptr [rsp + 0x288], r14d
01297 899c2470020000                 mov        dword ptr [rsp + 0x270], ebx
0129e 48bf38e163c8637f0000           movabs     rdi, 0x7f63c863e138
012a8 4883877805000001               add        qword ptr [rdi + 0x578], 1
012b0 488bf0                         mov        rsi, rax
012b3 90                             nop        
012b4 90                             nop        
012b5 90                             nop        
012b6 90                             nop        
012b7 e824385c07                     call       0x7f63db743c60
012bc 0f1f8400b4130005               nop        dword ptr [rax + rax + 0x50013b4]
012c4 48be38e163c8637f0000           movabs     rsi, 0x7f63c863e138
012ce 4883868805000001               add        qword ptr [rsi + 0x588], 1
012d6 488bb424e8010000               mov        rsi, qword ptr [rsp + 0x1e8]
012de 488b9424f0010000               mov        rdx, qword ptr [rsp + 0x1f0]
012e6 8b8c24f8010000                 mov        ecx, dword ptr [rsp + 0x1f8]
012ed 4c8bc0                         mov        r8, rax
012f0 448b8c2478020000               mov        r9d, dword ptr [rsp + 0x278]
012f8 8bbc2474020000                 mov        edi, dword ptr [rsp + 0x274]
012ff e8dc375c07                     call       0x7f63db743c60
01304 0f1f8400fc130006               nop        dword ptr [rax + rax + 0x60013fc]
0130c 448b842438020000               mov        r8d, dword ptr [rsp + 0x238]
01314 4585c0                         test       r8d, r8d
01317 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
01321 baa8050000                     mov        edx, 0x5a8
01326 7505                           jne        0x7f63d41804ad
01328 ba98050000                     mov        edx, 0x598
0132d 4c8b0411                       mov        r8, qword ptr [rcx + rdx]
01331 4d8d4001                       lea        r8, [r8 + 1]
01335 4c890411                       mov        qword ptr [rcx + rdx], r8
01339 0f851c000000                   jne        0x7f63d41804db
0133f 448b9c2408020000               mov        r11d, dword ptr [rsp + 0x208]
01347 8bbc24fc010000                 mov        edi, dword ptr [rsp + 0x1fc]
0134e 448b842404020000               mov        r8d, dword ptr [rsp + 0x204]
01356 e99c010000                     jmp        0x7f63d4180677
0135b 8b942424020000                 mov        edx, dword ptr [rsp + 0x224]
01362 488b842418020000               mov        rax, qword ptr [rsp + 0x218]
0136a 488b9c2410020000               mov        rbx, qword ptr [rsp + 0x210]
01372 b930000000                     mov        ecx, 0x30
01377 48d3eb                         shr        rbx, cl
0137a 8bdb                           mov        ebx, ebx
0137c 488bca                         mov        rcx, rdx
0137f 038c2430020000                 add        ecx, dword ptr [rsp + 0x230]
01386 448b84247c020000               mov        r8d, dword ptr [rsp + 0x27c]
0138e 41d3e8                         shr        r8d, cl
01391 4103d8                         add        ebx, r8d
01394 b930000000                     mov        ecx, 0x30
01399 48d3e8                         shr        rax, cl
0139c 8bc0                           mov        eax, eax
0139e 8b8c2430020000                 mov        ecx, dword ptr [rsp + 0x230]
013a5 448b84247c020000               mov        r8d, dword ptr [rsp + 0x27c]
013ad 41d3e8                         shr        r8d, cl
013b0 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
013ba 488381b805000001               add        qword ptr [rcx + 0x5b8], 1
013c2 48b9303363c8637f0000           movabs     rcx, 0x7f63c8633330
013cc 8b7178                         mov        esi, dword ptr [rcx + 0x78]
013cf 83c602                         add        esi, 2
013d2 897178                         mov        dword ptr [rcx + 0x78], esi
013d5 81e6feff1f00                   and        esi, 0x1ffffe
013db 85f6                           test       esi, esi
013dd 0f84ea0e0000                   je         0x7f63d418144d
013e3 83fa20                         cmp        edx, 0x20
013e6 48b9303363c8637f0000           movabs     rcx, 0x7f63c8633330
013f0 beb0000000                     mov        esi, 0xb0
013f5 7c05                           jl         0x7f63d418057c
013f7 bec0000000                     mov        esi, 0xc0
013fc 488b3c31                       mov        rdi, qword ptr [rcx + rsi]
01400 488d7f01                       lea        rdi, [rdi + 1]
01404 48893c31                       mov        qword ptr [rcx + rsi], rdi
01408 0f8c1a000000                   jl         0x7f63d41805a8
0140e 48b9303363c8637f0000           movabs     rcx, 0x7f63c8633330
01418 ff81d0000000                   inc        dword ptr [rcx + 0xd0]
0141e baffffffff                     mov        edx, 0xffffffff
01423 e90c000000                     jmp        0x7f63d41805b4
01428 488bca                         mov        rcx, rdx
0142b ba01000000                     mov        edx, 1
01430 d3e2                           shl        edx, cl
01432 ffca                           dec        edx
01434 8bb42430020000                 mov        esi, dword ptr [rsp + 0x230]
0143b 488bbc2428020000               mov        rdi, qword ptr [rsp + 0x228]
01443 4923d0                         and        rdx, r8
01446 03d0                           add        edx, eax
01448 b930000000                     mov        ecx, 0x30
0144d 48d3ef                         shr        rdi, cl
01450 8bff                           mov        edi, edi
01452 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
0145c 488381c805000001               add        qword ptr [rcx + 0x5c8], 1
01464 48b9303363c8637f0000           movabs     rcx, 0x7f63c8633330
0146e 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
01472 4183c002                       add        r8d, 2
01476 44894178                       mov        dword ptr [rcx + 0x78], r8d
0147a 4181e0feff1f00                 and        r8d, 0x1ffffe
01481 4585c0                         test       r8d, r8d
01484 0f84640e0000                   je         0x7f63d418146e
0148a 83fe20                         cmp        esi, 0x20
0148d 48b9303363c8637f0000           movabs     rcx, 0x7f63c8633330
01497 41b8b0000000                   mov        r8d, 0xb0
0149d 7c06                           jl         0x7f63d4180625
0149f 41b8c0000000                   mov        r8d, 0xc0
014a5 4a8b0401                       mov        rax, qword ptr [rcx + r8]
014a9 488d4001                       lea        rax, [rax + 1]
014ad 4a890401                       mov        qword ptr [rcx + r8], rax
014b1 0f8c1b000000                   jl         0x7f63d4180652
014b7 48b9303363c8637f0000           movabs     rcx, 0x7f63c8633330
014c1 ff81d0000000                   inc        dword ptr [rcx + 0xd0]
014c7 41b8ffffffff                   mov        r8d, 0xffffffff
014cd e90f000000                     jmp        0x7f63d4180661
014d2 488bce                         mov        rcx, rsi
014d5 41b801000000                   mov        r8d, 1
014db 41d3e0                         shl        r8d, cl
014de 41ffc8                         dec        r8d
014e1 8b8c247c020000                 mov        ecx, dword ptr [rsp + 0x27c]
014e8 4c23c1                         and        r8, rcx
014eb 4403c7                         add        r8d, edi
014ee 4c8bdb                         mov        r11, rbx
014f1 498bf8                         mov        rdi, r8
014f4 4c8bc2                         mov        r8, rdx
014f7 488b942480020000               mov        rdx, qword ptr [rsp + 0x280]
014ff 8bb4245c020000                 mov        esi, dword ptr [rsp + 0x25c]
01506 448bb42488020000               mov        r14d, dword ptr [rsp + 0x288]
0150e 488b9c2460020000               mov        rbx, qword ptr [rsp + 0x260]
01516 488b842468020000               mov        rax, qword ptr [rsp + 0x268]
0151e 8b8c243c020000                 mov        ecx, dword ptr [rsp + 0x23c]
01525 49bd38e163c8637f0000           movabs     r13, 0x7f63c863e138
0152f 458b4d7c                       mov        r9d, dword ptr [r13 + 0x7c]
01533 4183c102                       add        r9d, 2
01537 45894d7c                       mov        dword ptr [r13 + 0x7c], r9d
0153b 4181e1fe3f0000                 and        r9d, 0x3ffe
01542 4585c9                         test       r9d, r9d
01545 0f84c40d0000                   je         0x7f63d418148f
0154b 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0154f 418502                         test       dword ptr [r10], eax
01552 49b938e163c8637f0000           movabs     r9, 0x7f63c863e138
0155c 41ff81d8050000                 inc        dword ptr [r9 + 0x5d8]
01563 4c8bea                         mov        r13, rdx
01566 498bd6                         mov        rdx, r14
01569 4c8bcb                         mov        r9, rbx
0156c 488bd8                         mov        rbx, rax
0156f 8b842470020000                 mov        eax, dword ptr [rsp + 0x270]
01576 448bb4240c020000               mov        r14d, dword ptr [rsp + 0x20c]
0157e 4c89ac24e0010000               mov        qword ptr [rsp + 0x1e0], r13
01586 89b424f0000000                 mov        dword ptr [rsp + 0xf0], esi
0158d 899424f4000000                 mov        dword ptr [rsp + 0xf4], edx
01594 4c898c24f8000000               mov        qword ptr [rsp + 0xf8], r9
0159c 48899c2400010000               mov        qword ptr [rsp + 0x100], rbx
015a4 89842408010000                 mov        dword ptr [rsp + 0x108], eax
015ab 8bb42414010000                 mov        esi, dword ptr [rsp + 0x114]
015b2 4c8be9                         mov        r13, rcx
015b5 8b942400020000                 mov        edx, dword ptr [rsp + 0x200]
015bc 4c8b8c2438010000               mov        r9, qword ptr [rsp + 0x138]
015c4 488b8424e0000000               mov        rax, qword ptr [rsp + 0xe0]
015cc 488b9c24e8000000               mov        rbx, qword ptr [rsp + 0xe8]
015d4 e9bff2ffff                     jmp        0x7f63d417fa18
015d9 4c8bac2418010000               mov        r13, qword ptr [rsp + 0x118]
015e1 448b842428010000               mov        r8d, dword ptr [rsp + 0x128]
015e9 8b8c242c010000                 mov        ecx, dword ptr [rsp + 0x12c]
015f0 488b942430010000               mov        rdx, qword ptr [rsp + 0x130]
015f8 48be485131e300000000           movabs     rsi, 0xe3315148
01602 488bbe88000000                 mov        rdi, qword ptr [rsi + 0x88]
01609 41ba01000000                   mov        r10d, 1
0160f 4903fa                         add        rdi, r10
01612 4889be88000000                 mov        qword ptr [rsi + 0x88], rdi
01619 418bbd48010000                 mov        edi, dword ptr [r13 + 0x148]
01620 4c3b25b1111a21                 cmp        r12, qword ptr [rip + 0x211a11b1]
01627 0f8414000000                   je         0x7f63d41807c1
0162d 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
01637 4883e4f0                       and        rsp, 0xfffffffffffffff0
0163b e840015b20                     call       0x7f63f4730900
01640 f4                             hlt        
01641 4889bc2490020000               mov        qword ptr [rsp + 0x290], rdi
01649 483b07                         cmp        rax, qword ptr [rdi]
0164c 488bf7                         mov        rsi, rdi
0164f 48bb38e163c8637f0000           movabs     rbx, 0x7f63c863e138
01659 488b36                         mov        rsi, qword ptr [rsi]
0165c 48c1ee2a                       shr        rsi, 0x2a
01660 48c1e609                       shl        rsi, 9
01664 41ba0000005c                   mov        r10d, 0x5c000000
0166a 4903f2                         add        rsi, r10
0166d 41ba90000000                   mov        r10d, 0x90
01673 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
01677 743b                           je         0x7f63d4180834
01679 4983c202                       add        r10, 2
0167d 4981fa94000000                 cmp        r10, 0x94
01684 75ed                           jne        0x7f63d41807f3
01686 41ba90000000                   mov        r10d, 0x90
0168c 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01691 7415                           je         0x7f63d4180828
01693 4983c202                       add        r10, 2
01697 4981fa94000000                 cmp        r10, 0x94
0169e 75ec                           jne        0x7f63d418080c
016a0 41ba8f000000                   mov        r10d, 0x8f
016a6 eb10                           jmp        0x7f63d4180838
016a8 50                             push       rax
016a9 4833c0                         xor        rax, rax
016ac 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
016b1 58                             pop        rax
016b2 ebb9                           jmp        0x7f63d41807ed
016b4 4983c201                       add        r10, 1
016b8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
016bd 488bf7                         mov        rsi, rdi
016c0 4c89ac2418010000               mov        qword ptr [rsp + 0x118], r13
016c8 90                             nop        
016c9 90                             nop        
016ca 90                             nop        
016cb 90                             nop        
016cc 90                             nop        
016cd 90                             nop        
016ce 90                             nop        
016cf e80c2a5c07                     call       0x7f63db743260
016d4 0f1f8400cc170008               nop        dword ptr [rax + rax + 0x80017cc]
016dc 488bbc2490020000               mov        rdi, qword ptr [rsp + 0x290]
016e4 48b838e163c8637f0000           movabs     rax, 0x7f63c863e138
016ee 488b3f                         mov        rdi, qword ptr [rdi]
016f1 48c1ef2a                       shr        rdi, 0x2a
016f5 48c1e709                       shl        rdi, 9
016f9 41ba0000005c                   mov        r10d, 0x5c000000
016ff 4903fa                         add        rdi, r10
01702 41ba96000000                   mov        r10d, 0x96
01708 4a3b3cd0                       cmp        rdi, qword ptr [rax + r10*8]
0170c 7441                           je         0x7f63d41808cf
0170e 4983c202                       add        r10, 2
01712 4981fa9a000000                 cmp        r10, 0x9a
01719 75ed                           jne        0x7f63d4180888
0171b 41ba96000000                   mov        r10d, 0x96
01721 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
01726 7415                           je         0x7f63d41808bd
01728 4983c202                       add        r10, 2
0172c 4981fa9a000000                 cmp        r10, 0x9a
01733 75ec                           jne        0x7f63d41808a1
01735 41ba95000000                   mov        r10d, 0x95
0173b eb16                           jmp        0x7f63d41808d3
0173d 53                             push       rbx
0173e 488bd8                         mov        rbx, rax
01741 4833c0                         xor        rax, rax
01744 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
01749 488bc3                         mov        rax, rbx
0174c 5b                             pop        rbx
0174d ebb3                           jmp        0x7f63d4180882
0174f 4983c201                       add        r10, 1
01753 4a8304d001                     add        qword ptr [rax + r10*8], 1
01758 48b8a8c563c8637f0000           movabs     rax, 0x7f63c863c5a8
01762 8b7078                         mov        esi, dword ptr [rax + 0x78]
01765 83c602                         add        esi, 2
01768 897078                         mov        dword ptr [rax + 0x78], esi
0176b 81e6feff1f00                   and        esi, 0x1ffffe
01771 85f6                           test       esi, esi
01773 0f84e90b0000                   je         0x7f63d41814e2
01779 488bbc2490020000               mov        rdi, qword ptr [rsp + 0x290]
01781 8b4718                         mov        eax, dword ptr [rdi + 0x18]
01784 83f820                         cmp        eax, 0x20
01787 48b8a8c563c8637f0000           movabs     rax, 0x7f63c863c5a8
01791 beb0000000                     mov        esi, 0xb0
01796 7f05                           jg         0x7f63d418091d
01798 bec0000000                     mov        esi, 0xc0
0179d 488b1c30                       mov        rbx, qword ptr [rax + rsi]
017a1 488d5b01                       lea        rbx, [rbx + 1]
017a5 48891c30                       mov        qword ptr [rax + rsi], rbx
017a9 0f8fae000000                   jg         0x7f63d41809dd
017af e9d8000000                     jmp        0x7f63d4180a0c
017b4 4c8bac24e0010000               mov        r13, qword ptr [rsp + 0x1e0]
017bc 8bb424f0000000                 mov        esi, dword ptr [rsp + 0xf0]
017c3 48b838e163c8637f0000           movabs     rax, 0x7f63c863e138
017cd ff8000060000                   inc        dword ptr [rax + 0x600]
017d3 8b8424dc010000                 mov        eax, dword ptr [rsp + 0x1dc]
017da 8b9c2410010000                 mov        ebx, dword ptr [rsp + 0x110]
017e1 4863c0                         movsxd     rax, eax
017e4 4903c5                         add        rax, r13
017e7 4c63eb                         movsxd     r13, ebx
017ea 4c3be8                         cmp        r13, rax
017ed 48bf38e163c8637f0000           movabs     rdi, 0x7f63c863e138
017f7 bb20060000                     mov        ebx, 0x620
017fc 7c05                           jl         0x7f63d4180983
017fe bb10060000                     mov        ebx, 0x610
01803 488b141f                       mov        rdx, qword ptr [rdi + rbx]
01807 488d5201                       lea        rdx, [rdx + 1]
0180b 4889141f                       mov        qword ptr [rdi + rbx], rdx
0180f 0f8c74010000                   jl         0x7f63d4180b09
01815 448bac240c010000               mov        r13d, dword ptr [rsp + 0x10c]
0181d 413bf5                         cmp        esi, r13d
01820 48be38e163c8637f0000           movabs     rsi, 0x7f63c863e138
0182a bf50060000                     mov        edi, 0x650
0182f 7505                           jne        0x7f63d41809b6
01831 bf40060000                     mov        edi, 0x640
01836 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
0183a 488d5b01                       lea        rbx, [rbx + 1]
0183e 48891c3e                       mov        qword ptr [rsi + rdi], rbx
01842 0f859f000000                   jne        0x7f63d4180a67
01848 8bc0                           mov        eax, eax
0184a 4881c4c0020000                 add        rsp, 0x2c0
01851 5d                             pop        rbp
01852 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
01856 0f87270b0000                   ja         0x7f63d4181503
0185c c3                             ret        
0185d 488bf7                         mov        rsi, rdi
01860 48bba8c563c8637f0000           movabs     rbx, 0x7f63c863c5a8
0186a 488383d000000001               add        qword ptr [rbx + 0xd0], 1
01872 488bf7                         mov        rsi, rdi
01875 90                             nop        
01876 90                             nop        
01877 e864285c07                     call       0x7f63db743260
0187c 0f1f840074190009               nop        dword ptr [rax + rax + 0x9001974]
01884 488bbc2490020000               mov        rdi, qword ptr [rsp + 0x290]
0188c 448b8c2410010000               mov        r9d, dword ptr [rsp + 0x110]
01894 448b842414010000               mov        r8d, dword ptr [rsp + 0x114]
0189c 488b8c2418010000               mov        rcx, qword ptr [rsp + 0x118]
018a4 4c8bac2420010000               mov        r13, qword ptr [rsp + 0x120]
018ac 48be38e163c8637f0000           movabs     rsi, 0x7f63c863e138
018b6 488386d804000001               add        qword ptr [rsi + 0x4d8], 1
018be 488bf7                         mov        rsi, rdi
018c1 498bd5                         mov        rdx, r13
018c4 90                             nop        
018c5 90                             nop        
018c6 90                             nop        
018c7 e814325c07                     call       0x7f63db743c60
018cc 0f1f8400c419000a               nop        dword ptr [rax + rax + 0xa0019c4]
018d4 4881c4c0020000                 add        rsp, 0x2c0
018db 5d                             pop        rbp
018dc 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
018e0 0f87b30a0000                   ja         0x7f63d4181519
018e6 c3                             ret        
018e7 90                             nop        
018e8 e9d10a0000                     jmp        0x7f63d418153e
018ed 90                             nop        
018ee 90                             nop        
018ef 90                             nop        
018f0 90                             nop        
018f1 90                             nop        
018f2 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
018f9 0f85e20a0000                   jne        0x7f63d4181561
018ff 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
01906 488d7828                       lea        rdi, [rax + 0x28]
0190a 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
01911 0f87ca0a0000                   ja         0x7f63d4181561
01917 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
0191e 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
01925 488908                         mov        qword ptr [rax], rcx
01928 4833c9                         xor        rcx, rcx
0192b 48894808                       mov        qword ptr [rax + 8], rcx
0192f 48894810                       mov        qword ptr [rax + 0x10], rcx
01933 48894818                       mov        qword ptr [rax + 0x18], rcx
01937 48894820                       mov        qword ptr [rax + 0x20], rcx
0193b 488bd0                         mov        rdx, rax
0193e 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
01948 4883816006000001               add        qword ptr [rcx + 0x660], 1
01950 ba02000000                     mov        edx, 2
01955 48b9786e32e300000000           movabs     rcx, 0xe3326e78
0195f 488bf0                         mov        rsi, rax
01962 4889842498020000               mov        qword ptr [rsp + 0x298], rax
0196a 90                             nop        
0196b 90                             nop        
0196c 90                             nop        
0196d 90                             nop        
0196e 90                             nop        
0196f e86c275c07                     call       0x7f63db743260
01974 0f1f84006c1a000b               nop        dword ptr [rax + rax + 0xb001a6c]
0197c 488b842498020000               mov        rax, qword ptr [rsp + 0x298]
01984 e9210b0000                     jmp        0x7f63d418162a
01989 48ba38e163c8637f0000           movabs     rdx, 0x7f63c863e138
01993 4883823006000001               add        qword ptr [rdx + 0x630], 1
0199b 48ba303763c8637f0000           movabs     rdx, 0x7f63c8633730
019a5 8b7278                         mov        esi, dword ptr [rdx + 0x78]
019a8 83c602                         add        esi, 2
019ab 897278                         mov        dword ptr [rdx + 0x78], esi
019ae 81e6feff1f00                   and        esi, 0x1ffffe
019b4 85f6                           test       esi, esi
019b6 0f84320a0000                   je         0x7f63d418156e
019bc 90                             nop        
019bd 90                             nop        
019be 90                             nop        
019bf 90                             nop        
019c0 e9590a0000                     jmp        0x7f63d418159e
019c5 90                             nop        
019c6 90                             nop        
019c7 90                             nop        
019c8 90                             nop        
019c9 90                             nop        
019ca 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
019d1 0f856a0a0000                   jne        0x7f63d41815c1
019d7 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
019de 488d7828                       lea        rdi, [rax + 0x28]
019e2 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
019e9 0f87520a0000                   ja         0x7f63d41815c1
019ef 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
019f6 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
019fd 488908                         mov        qword ptr [rax], rcx
01a00 4833c9                         xor        rcx, rcx
01a03 48894808                       mov        qword ptr [rax + 8], rcx
01a07 48894810                       mov        qword ptr [rax + 0x10], rcx
01a0b 48894818                       mov        qword ptr [rax + 0x18], rcx
01a0f 48894820                       mov        qword ptr [rax + 0x20], rcx
01a13 488bd0                         mov        rdx, rax
01a16 48b9303763c8637f0000           movabs     rcx, 0x7f63c8633730
01a20 488381b000000001               add        qword ptr [rcx + 0xb0], 1
01a28 ba02000000                     mov        edx, 2
01a2d 48b9486d32e300000000           movabs     rcx, 0xe3326d48
01a37 488bf0                         mov        rsi, rax
01a3a 48898424a0020000               mov        qword ptr [rsp + 0x2a0], rax
01a42 90                             nop        
01a43 90                             nop        
01a44 90                             nop        
01a45 90                             nop        
01a46 90                             nop        
01a47 e894265c07                     call       0x7f63db743260
01a4c 0f1f8400441b000c               nop        dword ptr [rax + rax + 0xc001b44]
01a54 488b8424a0020000               mov        rax, qword ptr [rsp + 0x2a0]
01a5c e9490a0000                     jmp        0x7f63d418162a
01a61 90                             nop        
01a62 90                             nop        
01a63 90                             nop        
01a64 90                             nop        
01a65 90                             nop        
01a66 90                             nop        
01a67 90                             nop        
01a68 e9f0090000                     jmp        0x7f63d41815dd
01a6d 90                             nop        
01a6e 90                             nop        
01a6f 90                             nop        
01a70 90                             nop        
01a71 90                             nop        
01a72 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
01a79 0f85010a0000                   jne        0x7f63d4181600
01a7f 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
01a86 488d7828                       lea        rdi, [rax + 0x28]
01a8a 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
01a91 0f87e9090000                   ja         0x7f63d4181600
01a97 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
01a9e 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
01aa5 488908                         mov        qword ptr [rax], rcx
01aa8 4833c9                         xor        rcx, rcx
01aab 48894808                       mov        qword ptr [rax + 8], rcx
01aaf 48894810                       mov        qword ptr [rax + 0x10], rcx
01ab3 48894818                       mov        qword ptr [rax + 0x18], rcx
01ab7 48894820                       mov        qword ptr [rax + 0x20], rcx
01abb 488bd0                         mov        rdx, rax
01abe 48b938e163c8637f0000           movabs     rcx, 0x7f63c863e138
01ac8 488381d000000001               add        qword ptr [rcx + 0xd0], 1
01ad0 ba02000000                     mov        edx, 2
01ad5 48b9286e32e300000000           movabs     rcx, 0xe3326e28
01adf 488bf0                         mov        rsi, rax
01ae2 48898424a8020000               mov        qword ptr [rsp + 0x2a8], rax
01aea 90                             nop        
01aeb 90                             nop        
01aec 90                             nop        
01aed 90                             nop        
01aee 90                             nop        
01aef e8ec255c07                     call       0x7f63db743260
01af4 0f1f8400ec1b000d               nop        dword ptr [rax + rax + 0xd001bec]
01afc 488b8424a8020000               mov        rax, qword ptr [rsp + 0x2a8]
01b04 e9a1090000                     jmp        0x7f63d418162a
01b09 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
01b10 55                             push       rbp
01b11 4881ecc0020000                 sub        rsp, 0x2c0
01b18 41817f2000000000               cmp        dword ptr [r15 + 0x20], 0
01b20 7405                           je         0x7f63d4180ca7
01b22 e839255b07                     call       0x7f63db7331e0
01b27 bfe8010000                     mov        edi, 0x1e8
01b2c 4863ff                         movsxd     rdi, edi
01b2f 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
01b33 48899c2440010000               mov        qword ptr [rsp + 0x140], rbx
01b3b bfe0010000                     mov        edi, 0x1e0
01b40 4863ff                         movsxd     rdi, edi
01b43 8b043e                         mov        eax, dword ptr [rsi + rdi]
01b46 89842490010000                 mov        dword ptr [rsp + 0x190], eax
01b4d bfd8010000                     mov        edi, 0x1d8
01b52 4863ff                         movsxd     rdi, edi
01b55 8b143e                         mov        edx, dword ptr [rsi + rdi]
01b58 bfd0010000                     mov        edi, 0x1d0
01b5d 4863ff                         movsxd     rdi, edi
01b60 488b0c3e                       mov        rcx, qword ptr [rsi + rdi]
01b64 bfc8010000                     mov        edi, 0x1c8
01b69 4863ff                         movsxd     rdi, edi
01b6c 4c8b043e                       mov        r8, qword ptr [rsi + rdi]
01b70 bfc0010000                     mov        edi, 0x1c0
01b75 4863ff                         movsxd     rdi, edi
01b78 448b0c3e                       mov        r9d, dword ptr [rsi + rdi]
01b7c bfb8010000                     mov        edi, 0x1b8
01b81 4863ff                         movsxd     rdi, edi
01b84 448b1c3e                       mov        r11d, dword ptr [rsi + rdi]
01b88 bfa0010000                     mov        edi, 0x1a0
01b8d 4863ff                         movsxd     rdi, edi
01b90 448b2c3e                       mov        r13d, dword ptr [rsi + rdi]
01b94 bf98010000                     mov        edi, 0x198
01b99 4863ff                         movsxd     rdi, edi
01b9c 448b343e                       mov        r14d, dword ptr [rsi + rdi]
01ba0 bf88010000                     mov        edi, 0x188
01ba5 4863ff                         movsxd     rdi, edi
01ba8 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
01bac 48899c2448010000               mov        qword ptr [rsp + 0x148], rbx
01bb4 bf78010000                     mov        edi, 0x178
01bb9 4863ff                         movsxd     rdi, edi
01bbc 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
01bc0 48899c2450010000               mov        qword ptr [rsp + 0x150], rbx
01bc8 bf70010000                     mov        edi, 0x170
01bcd 4863ff                         movsxd     rdi, edi
01bd0 8b3c3e                         mov        edi, dword ptr [rsi + rdi]
01bd3 bb68010000                     mov        ebx, 0x168
01bd8 4863db                         movsxd     rbx, ebx
01bdb 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01bde 899c2458010000                 mov        dword ptr [rsp + 0x158], ebx
01be5 bb60010000                     mov        ebx, 0x160
01bea 4863db                         movsxd     rbx, ebx
01bed 488b1c1e                       mov        rbx, qword ptr [rsi + rbx]
01bf1 48899c2460010000               mov        qword ptr [rsp + 0x160], rbx
01bf9 bb58010000                     mov        ebx, 0x158
01bfe 4863db                         movsxd     rbx, ebx
01c01 488b1c1e                       mov        rbx, qword ptr [rsi + rbx]
01c05 48899c2468010000               mov        qword ptr [rsp + 0x168], rbx
01c0d bb50010000                     mov        ebx, 0x150
01c12 4863db                         movsxd     rbx, ebx
01c15 488b1c1e                       mov        rbx, qword ptr [rsi + rbx]
01c19 48899c2470010000               mov        qword ptr [rsp + 0x170], rbx
01c21 bb28010000                     mov        ebx, 0x128
01c26 4863db                         movsxd     rbx, ebx
01c29 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01c2c 899c245c010000                 mov        dword ptr [rsp + 0x15c], ebx
01c33 bb20010000                     mov        ebx, 0x120
01c38 4863db                         movsxd     rbx, ebx
01c3b 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01c3e 899c2478010000                 mov        dword ptr [rsp + 0x178], ebx
01c45 bb18010000                     mov        ebx, 0x118
01c4a 4863db                         movsxd     rbx, ebx
01c4d 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01c50 899c247c010000                 mov        dword ptr [rsp + 0x17c], ebx
01c57 bb10010000                     mov        ebx, 0x110
01c5c 4863db                         movsxd     rbx, ebx
01c5f 488b1c1e                       mov        rbx, qword ptr [rsi + rbx]
01c63 48899c2480010000               mov        qword ptr [rsp + 0x180], rbx
01c6b bb08010000                     mov        ebx, 0x108
01c70 4863db                         movsxd     rbx, ebx
01c73 488b1c1e                       mov        rbx, qword ptr [rsi + rbx]
01c77 48899c2488010000               mov        qword ptr [rsp + 0x188], rbx
01c7f bbf8000000                     mov        ebx, 0xf8
01c84 4863db                         movsxd     rbx, ebx
01c87 488b041e                       mov        rax, qword ptr [rsi + rbx]
01c8b bbf0000000                     mov        ebx, 0xf0
01c90 4863db                         movsxd     rbx, ebx
01c93 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01c96 899c2494010000                 mov        dword ptr [rsp + 0x194], ebx
01c9d bbe8000000                     mov        ebx, 0xe8
01ca2 4863db                         movsxd     rbx, ebx
01ca5 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01ca8 899c2498010000                 mov        dword ptr [rsp + 0x198], ebx
01caf bbe0000000                     mov        ebx, 0xe0
01cb4 4863db                         movsxd     rbx, ebx
01cb7 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01cba 899c249c010000                 mov        dword ptr [rsp + 0x19c], ebx
01cc1 bbd8000000                     mov        ebx, 0xd8
01cc6 4863db                         movsxd     rbx, ebx
01cc9 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01ccc 899c24a0010000                 mov        dword ptr [rsp + 0x1a0], ebx
01cd3 bbd0000000                     mov        ebx, 0xd0
01cd8 4863db                         movsxd     rbx, ebx
01cdb 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01cde 89bc24a4010000                 mov        dword ptr [rsp + 0x1a4], edi
01ce5 488bfe                         mov        rdi, rsi
01ce8 899424c4010000                 mov        dword ptr [rsp + 0x1c4], edx
01cef 48898c24d0010000               mov        qword ptr [rsp + 0x1d0], rcx
01cf7 4c898424c8010000               mov        qword ptr [rsp + 0x1c8], r8
01cff 44898c24c0010000               mov        dword ptr [rsp + 0x1c0], r9d
01d07 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
01d0f 4489ac24b8010000               mov        dword ptr [rsp + 0x1b8], r13d
01d17 4489b424ac010000               mov        dword ptr [rsp + 0x1ac], r14d
01d1f 48898424b0010000               mov        qword ptr [rsp + 0x1b0], rax
01d27 899c24a8010000                 mov        dword ptr [rsp + 0x1a8], ebx
01d2e e87d749920                     call       0x7f63f4b18330
01d33 0f1f840000000000               nop        dword ptr [rax + rax]
01d3b 8b9c24a8010000                 mov        ebx, dword ptr [rsp + 0x1a8]
01d42 4c8beb                         mov        r13, rbx
01d45 8b9c24a0010000                 mov        ebx, dword ptr [rsp + 0x1a0]
01d4c 488bf3                         mov        rsi, rbx
01d4f 8b9c249c010000                 mov        ebx, dword ptr [rsp + 0x19c]
01d56 488bd3                         mov        rdx, rbx
01d59 8b9c2498010000                 mov        ebx, dword ptr [rsp + 0x198]
01d60 4c8bf3                         mov        r14, rbx
01d63 8b9c2494010000                 mov        ebx, dword ptr [rsp + 0x194]
01d6a 488bc3                         mov        rax, rbx
01d6d 488b8c24b0010000               mov        rcx, qword ptr [rsp + 0x1b0]
01d75 4c8bc9                         mov        r9, rcx
01d78 488b9c2488010000               mov        rbx, qword ptr [rsp + 0x188]
01d80 488bcb                         mov        rcx, rbx
01d83 488b9c2480010000               mov        rbx, qword ptr [rsp + 0x180]
01d8b 8bbc247c010000                 mov        edi, dword ptr [rsp + 0x17c]
01d92 4c8bdf                         mov        r11, rdi
01d95 8bbc2478010000                 mov        edi, dword ptr [rsp + 0x178]
01d9c 448b84245c010000               mov        r8d, dword ptr [rsp + 0x15c]
01da4 89b424d8010000                 mov        dword ptr [rsp + 0x1d8], esi
01dab 488bb42470010000               mov        rsi, qword ptr [rsp + 0x170]
01db3 4889b42438010000               mov        qword ptr [rsp + 0x138], rsi
01dbb 488bb42468010000               mov        rsi, qword ptr [rsp + 0x168]
01dc3 4889b424e0000000               mov        qword ptr [rsp + 0xe0], rsi
01dcb 488bb42460010000               mov        rsi, qword ptr [rsp + 0x160]
01dd3 4889b424e8000000               mov        qword ptr [rsp + 0xe8], rsi
01ddb 8bb42458010000                 mov        esi, dword ptr [rsp + 0x158]
01de2 89b424f0000000                 mov        dword ptr [rsp + 0xf0], esi
01de9 8bb424a4010000                 mov        esi, dword ptr [rsp + 0x1a4]
01df0 89b424f4000000                 mov        dword ptr [rsp + 0xf4], esi
01df7 488bb42450010000               mov        rsi, qword ptr [rsp + 0x150]
01dff 4889b424f8000000               mov        qword ptr [rsp + 0xf8], rsi
01e07 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
01e0f 4889b42400010000               mov        qword ptr [rsp + 0x100], rsi
01e17 8bb424ac010000                 mov        esi, dword ptr [rsp + 0x1ac]
01e1e 89b42408010000                 mov        dword ptr [rsp + 0x108], esi
01e25 8bb424b8010000                 mov        esi, dword ptr [rsp + 0x1b8]
01e2c 89b4240c010000                 mov        dword ptr [rsp + 0x10c], esi
01e33 8bb424bc010000                 mov        esi, dword ptr [rsp + 0x1bc]
01e3a 89b42410010000                 mov        dword ptr [rsp + 0x110], esi
01e41 8bb424c0010000                 mov        esi, dword ptr [rsp + 0x1c0]
01e48 89b42414010000                 mov        dword ptr [rsp + 0x114], esi
01e4f 488bb424c8010000               mov        rsi, qword ptr [rsp + 0x1c8]
01e57 4889b42418010000               mov        qword ptr [rsp + 0x118], rsi
01e5f 488bb424d0010000               mov        rsi, qword ptr [rsp + 0x1d0]
01e67 4889b42420010000               mov        qword ptr [rsp + 0x120], rsi
01e6f 8bb424c4010000                 mov        esi, dword ptr [rsp + 0x1c4]
01e76 89b42428010000                 mov        dword ptr [rsp + 0x128], esi
01e7d 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
01e84 89b4242c010000                 mov        dword ptr [rsp + 0x12c], esi
01e8b 488bb42440010000               mov        rsi, qword ptr [rsp + 0x140]
01e93 4889b42430010000               mov        qword ptr [rsp + 0x130], rsi
01e9b 898424dc010000                 mov        dword ptr [rsp + 0x1dc], eax
01ea2 4c898c24e0010000               mov        qword ptr [rsp + 0x1e0], r9
01eaa 48898c24f0010000               mov        qword ptr [rsp + 0x1f0], rcx
01eb2 48899c24e8010000               mov        qword ptr [rsp + 0x1e8], rbx
01eba 4c8b8c2438010000               mov        r9, qword ptr [rsp + 0x138]
01ec2 488b8424e0000000               mov        rax, qword ptr [rsp + 0xe0]
01eca 488b9c24e8000000               mov        rbx, qword ptr [rsp + 0xe8]
01ed2 8bb42414010000                 mov        esi, dword ptr [rsp + 0x114]
01ed9 e9bae9ffff                     jmp        0x7f63d417fa18
01ede 49ba487962c8637f0000           movabs     r10, 0x7f63c8627948
01ee8 4c89542408                     mov        qword ptr [rsp + 8], r10
01eed 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01ef5 e866275607                     call       0x7f63db6e37e0
01efa e95ee1ffff                     jmp        0x7f63d417f1dd
01eff e8dc7d5607                     call       0x7f63db6e8e60
01f04 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
01f0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f12 e869f85a20                     call       0x7f63f4730900
01f17 f4                             hlt        
01f18 e8c37d5607                     call       0x7f63db6e8e60
01f1d 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
01f27 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f2b e850f85a20                     call       0x7f63f4730900
01f30 f4                             hlt        
01f31 48891c24                       mov        qword ptr [rsp], rbx
01f35 4889742408                     mov        qword ptr [rsp + 8], rsi
01f3a e8a1865607                     call       0x7f63db6e9760
01f3f 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
01f49 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f4d e82ef85a20                     call       0x7f63f4730900
01f52 f4                             hlt        
01f53 49ba204b62c8637f0000           movabs     r10, 0x7f63c8624b20
01f5d 4c89542408                     mov        qword ptr [rsp + 8], r10
01f62 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01f6a e8f1265607                     call       0x7f63db6e37e0
01f6f e969e1ffff                     jmp        0x7f63d417f25d
01f74 e8677d5607                     call       0x7f63db6e8e60
01f79 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
01f83 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f87 e8f4f75a20                     call       0x7f63f4730900
01f8c f4                             hlt        
01f8d e84e7d5607                     call       0x7f63db6e8e60
01f92 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
01f9c 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fa0 e8dbf75a20                     call       0x7f63f4730900
01fa5 f4                             hlt        
01fa6 e8357d5607                     call       0x7f63db6e8e60
01fab 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
01fb5 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fb9 e8c2f75a20                     call       0x7f63f4730900
01fbe f4                             hlt        
01fbf e81c7d5607                     call       0x7f63db6e8e60
01fc4 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
01fce 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fd2 e8a9f75a20                     call       0x7f63f4730900
01fd7 f4                             hlt        
01fd8 49ba704d62c8637f0000           movabs     r10, 0x7f63c8624d70
01fe2 4c89542408                     mov        qword ptr [rsp + 8], r10
01fe7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01fef e86c265607                     call       0x7f63db6e37e0
01ff4 e9fce2ffff                     jmp        0x7f63d417f475
01ff9 49ba704d62c8637f0000           movabs     r10, 0x7f63c8624d70
02003 4c89542408                     mov        qword ptr [rsp + 8], r10
02008 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
02010 e84b265607                     call       0x7f63db6e37e0
02015 e99ae3ffff                     jmp        0x7f63d417f534
0201a 49baa04c62c8637f0000           movabs     r10, 0x7f63c8624ca0
02024 4c89542408                     mov        qword ptr [rsp + 8], r10
02029 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
02031 e82a265607                     call       0x7f63db6e37e0
02036 e913e5ffff                     jmp        0x7f63d417f6ce
0203b 49baa04c62c8637f0000           movabs     r10, 0x7f63c8624ca0
02045 4c89542408                     mov        qword ptr [rsp + 8], r10
0204a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
02052 e809265607                     call       0x7f63db6e37e0
02057 e9abe5ffff                     jmp        0x7f63d417f787
0205c e87f7c5607                     call       0x7f63db6e8e60
02061 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
0206b 4883e4f0                       and        rsp, 0xfffffffffffffff0
0206f e80cf75a20                     call       0x7f63f4730900
02074 f4                             hlt        
02075 e8667c5607                     call       0x7f63db6e8e60
0207a 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
02084 4883e4f0                       and        rsp, 0xfffffffffffffff0
02088 e8f3f65a20                     call       0x7f63f4730900
0208d f4                             hlt        
0208e e84d7c5607                     call       0x7f63db6e8e60
02093 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
0209d 4883e4f0                       and        rsp, 0xfffffffffffffff0
020a1 e8daf65a20                     call       0x7f63f4730900
020a6 f4                             hlt        
020a7 e8347c5607                     call       0x7f63db6e8e60
020ac 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
020b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
020ba e8c1f65a20                     call       0x7f63f4730900
020bf f4                             hlt        
020c0 e81b7c5607                     call       0x7f63db6e8e60
020c5 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
020cf 4883e4f0                       and        rsp, 0xfffffffffffffff0
020d3 e8a8f65a20                     call       0x7f63f4730900
020d8 f4                             hlt        
020d9 e8027c5607                     call       0x7f63db6e8e60
020de 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
020e8 4883e4f0                       and        rsp, 0xfffffffffffffff0
020ec e88ff65a20                     call       0x7f63f4730900
020f1 f4                             hlt        
020f2 e8e97b5607                     call       0x7f63db6e8e60
020f7 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
02101 4883e4f0                       and        rsp, 0xfffffffffffffff0
02105 e876f65a20                     call       0x7f63f4730900
0210a f4                             hlt        
0210b 4c892c24                       mov        qword ptr [rsp], r13
0210f 48894c2408                     mov        qword ptr [rsp + 8], rcx
02114 e8c7845607                     call       0x7f63db6e9760
02119 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
02123 4883e4f0                       and        rsp, 0xfffffffffffffff0
02127 e854f65a20                     call       0x7f63f4730900
0212c f4                             hlt        
0212d e8ae7b5607                     call       0x7f63db6e8e60
02132 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
0213c 4883e4f0                       and        rsp, 0xfffffffffffffff0
02140 e83bf65a20                     call       0x7f63f4730900
02145 f4                             hlt        
02146 e8957b5607                     call       0x7f63db6e8e60
0214b 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
02155 4883e4f0                       and        rsp, 0xfffffffffffffff0
02159 e822f65a20                     call       0x7f63f4730900
0215e f4                             hlt        
0215f e87c7b5607                     call       0x7f63db6e8e60
02164 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
0216e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02172 e809f65a20                     call       0x7f63f4730900
02177 f4                             hlt        
02178 4c892c24                       mov        qword ptr [rsp], r13
0217c 48894c2408                     mov        qword ptr [rsp + 8], rcx
02181 e85a845607                     call       0x7f63db6e9760
02186 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
02190 4883e4f0                       and        rsp, 0xfffffffffffffff0
02194 e8e7f55a20                     call       0x7f63f4730900
02199 f4                             hlt        
0219a e8417b5607                     call       0x7f63db6e8e60
0219f 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
021a9 4883e4f0                       and        rsp, 0xfffffffffffffff0
021ad e8cef55a20                     call       0x7f63f4730900
021b2 f4                             hlt        
021b3 e8287b5607                     call       0x7f63db6e8e60
021b8 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
021c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
021c6 e8b5f55a20                     call       0x7f63f4730900
021cb f4                             hlt        
021cc e80f7b5607                     call       0x7f63db6e8e60
021d1 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
021db 4883e4f0                       and        rsp, 0xfffffffffffffff0
021df e89cf55a20                     call       0x7f63f4730900
021e4 f4                             hlt        
021e5 4c892c24                       mov        qword ptr [rsp], r13
021e9 48894c2408                     mov        qword ptr [rsp + 8], rcx
021ee e8ed835607                     call       0x7f63db6e9760
021f3 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
021fd 4883e4f0                       and        rsp, 0xfffffffffffffff0
02201 e87af55a20                     call       0x7f63f4730900
02206 f4                             hlt        
02207 49ba704d62c8637f0000           movabs     r10, 0x7f63c8624d70
02211 4c89542408                     mov        qword ptr [rsp + 8], r10
02216 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0221e e83d245607                     call       0x7f63db6e37e0
02223 e9d1eaffff                     jmp        0x7f63d417fe79
02228 49ba704d62c8637f0000           movabs     r10, 0x7f63c8624d70
02232 4c89542408                     mov        qword ptr [rsp + 8], r10
02237 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0223f e81c245607                     call       0x7f63db6e37e0
02244 e964ebffff                     jmp        0x7f63d417ff2d
02249 49ba704d62c8637f0000           movabs     r10, 0x7f63c8624d70
02253 4c89542408                     mov        qword ptr [rsp + 8], r10
02258 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
02260 e8fb235607                     call       0x7f63db6e37e0
02265 e93eedffff                     jmp        0x7f63d4180128
0226a 49ba704d62c8637f0000           movabs     r10, 0x7f63c8624d70
02274 4c89542408                     mov        qword ptr [rsp + 8], r10
02279 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
02281 e8da235607                     call       0x7f63db6e37e0
02286 e9d6edffff                     jmp        0x7f63d41801e1
0228b 49ba704d62c8637f0000           movabs     r10, 0x7f63c8624d70
02295 4c89542408                     mov        qword ptr [rsp + 8], r10
0229a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
022a2 e8b9235607                     call       0x7f63db6e37e0
022a7 e968eeffff                     jmp        0x7f63d4180294
022ac 49ba704d62c8637f0000           movabs     r10, 0x7f63c8624d70
022b6 4c89542408                     mov        qword ptr [rsp + 8], r10
022bb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
022c3 e898235607                     call       0x7f63db6e37e0
022c8 e9f7eeffff                     jmp        0x7f63d4180344
022cd 49baa04c62c8637f0000           movabs     r10, 0x7f63c8624ca0
022d7 4c89542408                     mov        qword ptr [rsp + 8], r10
022dc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
022e4 e877235607                     call       0x7f63db6e37e0
022e9 e9f5f0ffff                     jmp        0x7f63d4180563
022ee 49baa04c62c8637f0000           movabs     r10, 0x7f63c8624ca0
022f8 4c89542408                     mov        qword ptr [rsp + 8], r10
022fd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
02305 e856235607                     call       0x7f63db6e37e0
0230a e97bf1ffff                     jmp        0x7f63d418060a
0230f 49ba487962c8637f0000           movabs     r10, 0x7f63c8627948
02319 4c89542408                     mov        qword ptr [rsp + 8], r10
0231e 48c70424a9030000               mov        qword ptr [rsp], 0x3a9
02326 e835235607                     call       0x7f63db6e37e0
0232b e91bf2ffff                     jmp        0x7f63d41806cb
02330 e8ab795607                     call       0x7f63db6e8e60
02335 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
0233f 4883e4f0                       and        rsp, 0xfffffffffffffff0
02343 e838f45a20                     call       0x7f63f4730900
02348 f4                             hlt        
02349 e892795607                     call       0x7f63db6e8e60
0234e 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
02358 4883e4f0                       and        rsp, 0xfffffffffffffff0
0235c e81ff45a20                     call       0x7f63f4730900
02361 f4                             hlt        
02362 49ba38b661c8637f0000           movabs     r10, 0x7f63c861b638
0236c 4c89542408                     mov        qword ptr [rsp + 8], r10
02371 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
02379 e8e2225607                     call       0x7f63db6e37e0
0237e e9f6f3ffff                     jmp        0x7f63d41808f9
02383 49bad20918d4637f0000           movabs     r10, 0x7f63d41809d2
0238d 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02394 e9474e5c07                     jmp        0x7f63db746360
02399 49ba5c0a18d4637f0000           movabs     r10, 0x7f63d4180a5c
023a3 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
023aa e9314e5c07                     jmp        0x7f63db746360
023af 48ba0000000000000000           movabs     rdx, 0
023b9 b8000f050a                     mov        eax, 0xa050f00
023be e81d025607                     call       0x7f63db6e1760
023c3 e920f5ffff                     jmp        0x7f63d4180a68
023c8 e813795607                     call       0x7f63db6e8e60
023cd 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
023d7 4883e4f0                       and        rsp, 0xfffffffffffffff0
023db e8a0f35a20                     call       0x7f63f4730900
023e0 f4                             hlt        
023e1 488bd2                         mov        rdx, rdx
023e4 e8f7685607                     call       0x7f63db6e7e60
023e9 e94df5ffff                     jmp        0x7f63d4180abb
023ee 49ba309162c8637f0000           movabs     r10, 0x7f63c8629130
023f8 4c89542408                     mov        qword ptr [rsp + 8], r10
023fd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
02405 e856225607                     call       0x7f63db6e37e0
0240a e9adf5ffff                     jmp        0x7f63d4180b3c
0240f 48ba0000000000000000           movabs     rdx, 0
02419 b8000f050a                     mov        eax, 0xa050f00
0241e e8bd015607                     call       0x7f63db6e1760
02423 e998f5ffff                     jmp        0x7f63d4180b40
02428 e8b3785607                     call       0x7f63db6e8e60
0242d 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
02437 4883e4f0                       and        rsp, 0xfffffffffffffff0
0243b e840f35a20                     call       0x7f63f4730900
02440 f4                             hlt        
02441 488bd2                         mov        rdx, rdx
02444 e897685607                     call       0x7f63db6e7e60
02449 e9c5f5ffff                     jmp        0x7f63d4180b93
0244e 48ba0000000000000000           movabs     rdx, 0
02458 b8000f050a                     mov        eax, 0xa050f00
0245d e87e015607                     call       0x7f63db6e1760
02462 e901f6ffff                     jmp        0x7f63d4180be8
02467 e874785607                     call       0x7f63db6e8e60
0246c 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
02476 4883e4f0                       and        rsp, 0xfffffffffffffff0
0247a e801f35a20                     call       0x7f63f4730900
0247f f4                             hlt        
02480 488bd2                         mov        rdx, rdx
02483 e858685607                     call       0x7f63db6e7e60
02488 e92ef6ffff                     jmp        0x7f63d4180c3b
0248d 498b8708060000                 mov        rax, qword ptr [r15 + 0x608]
02494 49c7870806000000000000         mov        qword ptr [r15 + 0x608], 0
0249f 49c7871006000000000000         mov        qword ptr [r15 + 0x610], 0
024aa 4881c4c0020000                 add        rsp, 0x2c0
024b1 5d                             pop        rbp
024b2 e9a9875607                     jmp        0x7f63db6e9de0
024b7 f4                             hlt        
