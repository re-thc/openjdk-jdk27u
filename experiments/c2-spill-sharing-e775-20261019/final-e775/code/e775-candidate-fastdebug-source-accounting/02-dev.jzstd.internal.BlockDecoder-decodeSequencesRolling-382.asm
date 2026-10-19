00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ecc0020000                 sub        rsp, 0x2c0
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 7405                           je         0x7ff77414aa1f
0001a e8c1475d07                     call       0x7ff77b71f1e0
0001f 4889742468                     mov        qword ptr [rsp + 0x68], rsi
00024 89542460                       mov        dword ptr [rsp + 0x60], edx
00028 894c2464                       mov        dword ptr [rsp + 0x64], ecx
0002c 4c89442470                     mov        qword ptr [rsp + 0x70], r8
00031 4c894c2478                     mov        qword ptr [rsp + 0x78], r9
00036 89bc2480000000                 mov        dword ptr [rsp + 0x80], edi
0003d 48bb30cc4368f77f0000           movabs     rbx, 0x7ff76843cc30
00047 8b4378                         mov        eax, dword ptr [rbx + 0x78]
0004a 83c002                         add        eax, 2
0004d 894378                         mov        dword ptr [rbx + 0x78], eax
00050 25fe070000                     and        eax, 0x7fe
00055 85c0                           test       eax, eax
00057 0f84611e0000                   je         0x7ff77414c8be
0005d 488bda                         mov        rbx, rdx
00060 ffcb                           dec        ebx
00062 3b5e04                         cmp        ebx, dword ptr [rsi + 4]
00065 0f83a61e0000                   jae        0x7ff77414c911
0006b 4863db                         movsxd     rbx, ebx
0006e 0fbe5c1e08                     movsx      ebx, byte ptr [rsi + rbx + 8]
00073 81e3ff000000                   and        ebx, 0xff
00079 85db                           test       ebx, ebx
0007b 48b830cc4368f77f0000           movabs     rax, 0x7ff76843cc30
00085 41bbc0000000                   mov        r11d, 0xc0
0008b 7406                           je         0x7ff77414aa93
0008d 41bbb0000000                   mov        r11d, 0xb0
00093 4e8b2c18                       mov        r13, qword ptr [rax + r11]
00097 4d8d6d01                       lea        r13, [r13 + 1]
0009b 4e892c18                       mov        qword ptr [rax + r11], r13
0009f 0f84a4190000                   je         0x7ff77414c449
000a5 48b830cc4368f77f0000           movabs     rax, 0x7ff76843cc30
000af 488380e000000001               add        qword ptr [rax + 0xe0], 1
000b7 48b8c0194368f77f0000           movabs     rax, 0x7ff7684319c0
000c1 448b5878                       mov        r11d, dword ptr [rax + 0x78]
000c5 4183c302                       add        r11d, 2
000c9 44895878                       mov        dword ptr [rax + 0x78], r11d
000cd 4181e3feff1f00                 and        r11d, 0x1ffffe
000d4 4585db                         test       r11d, r11d
000d7 0f84561e0000                   je         0x7ff77414c933
000dd 48b8c0194368f77f0000           movabs     rax, 0x7ff7684319c0
000e7 488380b000000001               add        qword ptr [rax + 0xb0], 1
000ef 488bf3                         mov        rsi, rbx
000f2 90                             nop        
000f3 90                             nop        
000f4 90                             nop        
000f5 90                             nop        
000f6 90                             nop        
000f7 e864515e07                     call       0x7ff77b72fc60
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
00126 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
00130 488381f000000001               add        qword ptr [rcx + 0xf0], 1
00138 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
0013d 89942484000000                 mov        dword ptr [rsp + 0x84], edx
00144 8b542464                       mov        edx, dword ptr [rsp + 0x64]
00148 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
0014c 90                             nop        
0014d 90                             nop        
0014e 90                             nop        
0014f e80c515e07                     call       0x7ff77b72fc60
00154 0f1f84004c020001               nop        dword ptr [rax + rax + 0x100024c]
0015c 48be30cc4368f77f0000           movabs     rsi, 0x7ff76843cc30
00166 4883860001000001               add        qword ptr [rsi + 0x100], 1
0016e 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00172 83e908                         sub        ecx, 8
00175 488b742468                     mov        rsi, qword ptr [rsp + 0x68]
0017a 8b542464                       mov        edx, dword ptr [rsp + 0x64]
0017e 4889842490000000               mov        qword ptr [rsp + 0x90], rax
00186 90                             nop        
00187 e8d4505e07                     call       0x7ff77b72fc60
0018c 0f1f840084020002               nop        dword ptr [rax + rax + 0x2000284]
00194 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00199 418b7818                       mov        edi, dword ptr [r8 + 0x18]
0019d 4c3b2574688420                 cmp        r12, qword ptr [rip + 0x20846874]
001a4 0f8414000000                   je         0x7ff77414abbe
001aa 48bf3833a692f77f0000           movabs     rdi, 0x7ff792a63338
001b4 4883e4f0                       and        rsp, 0xfffffffffffffff0
001b8 e82350c11f                     call       0x7ff793d5fbe0
001bd f4                             hlt        
001be 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
001c6 418b581c                       mov        ebx, dword ptr [r8 + 0x1c]
001ca 4c3b2547688420                 cmp        r12, qword ptr [rip + 0x20846847]
001d1 0f8414000000                   je         0x7ff77414abeb
001d7 48bf3833a692f77f0000           movabs     rdi, 0x7ff792a63338
001e1 4883e4f0                       and        rsp, 0xfffffffffffffff0
001e5 e8f64fc11f                     call       0x7ff793d5fbe0
001ea f4                             hlt        
001eb 458b4820                       mov        r9d, dword ptr [r8 + 0x20]
001ef 4c3b2522688420                 cmp        r12, qword ptr [rip + 0x20846822]
001f6 0f8414000000                   je         0x7ff77414ac10
001fc 48bf3833a692f77f0000           movabs     rdi, 0x7ff792a63338
00206 4883e4f0                       and        rsp, 0xfffffffffffffff0
0020a e8d14fc11f                     call       0x7ff793d5fbe0
0020f f4                             hlt        
00210 8b4f04                         mov        ecx, dword ptr [rdi + 4]
00213 8b7304                         mov        esi, dword ptr [rbx + 4]
00216 418b5104                       mov        edx, dword ptr [r9 + 4]
0021a 03ce                           add        ecx, esi
0021c 03ca                           add        ecx, edx
0021e 898c24a0000000                 mov        dword ptr [rsp + 0xa0], ecx
00225 be40000000                     mov        esi, 0x40
0022a 2bb42484000000                 sub        esi, dword ptr [rsp + 0x84]
00231 85c9                           test       ecx, ecx
00233 48ba30cc4368f77f0000           movabs     rdx, 0x7ff76843cc30
0023d 41bb10010000                   mov        r11d, 0x110
00243 7506                           jne        0x7ff77414ac4b
00245 41bb20010000                   mov        r11d, 0x120
0024b 4e8b2c1a                       mov        r13, qword ptr [rdx + r11]
0024f 4d8d6d01                       lea        r13, [r13 + 1]
00253 4e892c1a                       mov        qword ptr [rdx + r11], r13
00257 0f8526000000                   jne        0x7ff77414ac83
0025d 48be30cc4368f77f0000           movabs     rsi, 0x7ff76843cc30
00267 ff8630010000                   inc        dword ptr [rsi + 0x130]
0026d 41bb00000000                   mov        r11d, 0
00273 4c8be9                         mov        r13, rcx
00276 4c8bb42490000000               mov        r14, qword ptr [rsp + 0x90]
0027e e9b0010000                     jmp        0x7ff77414ae33
00283 3bce                           cmp        ecx, esi
00285 48ba30cc4368f77f0000           movabs     rdx, 0x7ff76843cc30
0028f 41bb48010000                   mov        r11d, 0x148
00295 7f06                           jg         0x7ff77414ac9d
00297 41bb58010000                   mov        r11d, 0x158
0029d 4e8b2c1a                       mov        r13, qword ptr [rdx + r11]
002a1 4d8d6d01                       lea        r13, [r13 + 1]
002a5 4e892c1a                       mov        qword ptr [rdx + r11], r13
002a9 0f8fc5000000                   jg         0x7ff77414ad74
002af 2bf1                           sub        esi, ecx
002b1 4c8be9                         mov        r13, rcx
002b4 488bce                         mov        rcx, rsi
002b7 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
002bf 48d3ee                         shr        rsi, cl
002c2 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
002cc 4883816801000001               add        qword ptr [rcx + 0x168], 1
002d4 48b9b81c4368f77f0000           movabs     rcx, 0x7ff768431cb8
002de 8b5178                         mov        edx, dword ptr [rcx + 0x78]
002e1 83c202                         add        edx, 2
002e4 895178                         mov        dword ptr [rcx + 0x78], edx
002e7 81e2feff1f00                   and        edx, 0x1ffffe
002ed 85d2                           test       edx, edx
002ef 0f84c31c0000                   je         0x7ff77414c9b8
002f5 4183fd40                       cmp        r13d, 0x40
002f9 48b9b81c4368f77f0000           movabs     rcx, 0x7ff768431cb8
00303 bab0000000                     mov        edx, 0xb0
00308 7c05                           jl         0x7ff77414ad0f
0030a bac0000000                     mov        edx, 0xc0
0030f 4c8b1c11                       mov        r11, qword ptr [rcx + rdx]
00313 4d8d5b01                       lea        r11, [r11 + 1]
00317 4c891c11                       mov        qword ptr [rcx + rdx], r11
0031b 0f8c1c000000                   jl         0x7ff77414ad3d
00321 48b9b81c4368f77f0000           movabs     rcx, 0x7ff768431cb8
0032b ff81d0000000                   inc        dword ptr [rcx + 0xd0]
00331 48c7c2ffffffff                 mov        rdx, 0xffffffffffffffff
00338 e914000000                     jmp        0x7ff77414ad51
0033d ba01000000                     mov        edx, 1
00342 498bcd                         mov        rcx, r13
00345 4c8bda                         mov        r11, rdx
00348 49d3e3                         shl        r11, cl
0034b 4c2bda                         sub        r11, rdx
0034e 498bd3                         mov        rdx, r11
00351 4823d6                         and        rdx, rsi
00354 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
0035e ff8178010000                   inc        dword ptr [rcx + 0x178]
00364 4c8bda                         mov        r11, rdx
00367 4c8bb42490000000               mov        r14, qword ptr [rsp + 0x90]
0036f e9bf000000                     jmp        0x7ff77414ae33
00374 4c8be9                         mov        r13, rcx
00377 498bd5                         mov        rdx, r13
0037a 2bd6                           sub        edx, esi
0037c 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
00386 4883819001000001               add        qword ptr [rcx + 0x190], 1
0038e 48b9b81c4368f77f0000           movabs     rcx, 0x7ff768431cb8
00398 448b5978                       mov        r11d, dword ptr [rcx + 0x78]
0039c 4183c302                       add        r11d, 2
003a0 44895978                       mov        dword ptr [rcx + 0x78], r11d
003a4 4181e3feff1f00                 and        r11d, 0x1ffffe
003ab 4585db                         test       r11d, r11d
003ae 0f84251c0000                   je         0x7ff77414c9d9
003b4 83fe40                         cmp        esi, 0x40
003b7 48b9b81c4368f77f0000           movabs     rcx, 0x7ff768431cb8
003c1 41bbb0000000                   mov        r11d, 0xb0
003c7 7c06                           jl         0x7ff77414adcf
003c9 41bbc0000000                   mov        r11d, 0xc0
003cf 4e8b3419                       mov        r14, qword ptr [rcx + r11]
003d3 4d8d7601                       lea        r14, [r14 + 1]
003d7 4e893419                       mov        qword ptr [rcx + r11], r14
003db 0f8c1c000000                   jl         0x7ff77414adfd
003e1 48b9b81c4368f77f0000           movabs     rcx, 0x7ff768431cb8
003eb ff81d0000000                   inc        dword ptr [rcx + 0xd0]
003f1 48c7c6ffffffff                 mov        rsi, 0xffffffffffffffff
003f8 e912000000                     jmp        0x7ff77414ae0f
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
00440 48be30cc4368f77f0000           movabs     rsi, 0x7ff76843cc30
0044a b9b0010000                     mov        ecx, 0x1b0
0044f 7d05                           jge        0x7ff77414ae56
00451 b9a0010000                     mov        ecx, 0x1a0
00456 488b3c0e                       mov        rdi, qword ptr [rsi + rcx]
0045a 488d7f01                       lea        rdi, [rdi + 1]
0045e 48893c0e                       mov        qword ptr [rsi + rcx], rdi
00462 0f8d1c000000                   jge        0x7ff77414ae84
00468 498bf6                         mov        rsi, r14
0046b 8b7c2460                       mov        edi, dword ptr [rsp + 0x60]
0046f 4c899c24b8000000               mov        qword ptr [rsp + 0xb8], r11
00477 48899c24c0000000               mov        qword ptr [rsp + 0xc0], rbx
0047f e98e000000                     jmp        0x7ff77414af12
00484 4c899c24b8000000               mov        qword ptr [rsp + 0xb8], r11
0048c 4c898c24b0000000               mov        qword ptr [rsp + 0xb0], r9
00494 48899c24c0000000               mov        qword ptr [rsp + 0xc0], rbx
0049c 48898424a8000000               mov        qword ptr [rsp + 0xa8], rax
004a4 83ea40                         sub        edx, 0x40
004a7 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
004ac 4183ed08                       sub        r13d, 8
004b0 48be30cc4368f77f0000           movabs     rsi, 0x7ff76843cc30
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
004e7 e8744d5e07                     call       0x7ff77b72fc60
004ec 0f1f8400e4050003               nop        dword ptr [rax + rax + 0x30005e4]
004f4 8b94248c000000                 mov        edx, dword ptr [rsp + 0x8c]
004fb 488bb424a8000000               mov        rsi, qword ptr [rsp + 0xa8]
00503 8bbc24a4000000                 mov        edi, dword ptr [rsp + 0xa4]
0050a 4c8b8c24b0000000               mov        r9, qword ptr [rsp + 0xb0]
00512 418b5904                       mov        ebx, dword ptr [r9 + 4]
00516 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
00520 488381d001000001               add        qword ptr [rcx + 0x1d0], 1
00528 48b9b81d4368f77f0000           movabs     rcx, 0x7ff768431db8
00532 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
00536 4183c002                       add        r8d, 2
0053a 44894178                       mov        dword ptr [rcx + 0x78], r8d
0053e 4181e0feff1f00                 and        r8d, 0x1ffffe
00545 4585c0                         test       r8d, r8d
00548 0f84ac1a0000                   je         0x7ff77414c9fa
0054e 83fb20                         cmp        ebx, 0x20
00551 48b9b81d4368f77f0000           movabs     rcx, 0x7ff768431db8
0055b 41b8b0000000                   mov        r8d, 0xb0
00561 7c06                           jl         0x7ff77414af69
00563 41b8c0000000                   mov        r8d, 0xc0
00569 4e8b1c01                       mov        r11, qword ptr [rcx + r8]
0056d 4d8d5b01                       lea        r11, [r11 + 1]
00571 4e891c01                       mov        qword ptr [rcx + r8], r11
00575 0f8c1b000000                   jl         0x7ff77414af96
0057b 48b9b81d4368f77f0000           movabs     rcx, 0x7ff768431db8
00585 ff81d0000000                   inc        dword ptr [rcx + 0xd0]
0058b 41b8ffffffff                   mov        r8d, 0xffffffff
00591 e90f000000                     jmp        0x7ff77414afa5
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
005cb 418b5d04                       mov        ebx, dword ptr [r13 + 4]
005cf 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
005d9 488381e001000001               add        qword ptr [rcx + 0x1e0], 1
005e1 48b9b81d4368f77f0000           movabs     rcx, 0x7ff768431db8
005eb 448b7178                       mov        r14d, dword ptr [rcx + 0x78]
005ef 4183c602                       add        r14d, 2
005f3 44897178                       mov        dword ptr [rcx + 0x78], r14d
005f7 4181e6feff1f00                 and        r14d, 0x1ffffe
005fe 4585f6                         test       r14d, r14d
00601 0f84141a0000                   je         0x7ff77414ca1b
00607 83fb20                         cmp        ebx, 0x20
0060a 48b9b81d4368f77f0000           movabs     rcx, 0x7ff768431db8
00614 41beb0000000                   mov        r14d, 0xb0
0061a 7c06                           jl         0x7ff77414b022
0061c 41bec0000000                   mov        r14d, 0xc0
00622 4a8b3c31                       mov        rdi, qword ptr [rcx + r14]
00626 488d7f01                       lea        rdi, [rdi + 1]
0062a 4a893c31                       mov        qword ptr [rcx + r14], rdi
0062e 0f8c1a000000                   jl         0x7ff77414b04e
00634 48b9b81d4368f77f0000           movabs     rcx, 0x7ff768431db8
0063e ff81d0000000                   inc        dword ptr [rcx + 0xd0]
00644 bfffffffff                     mov        edi, 0xffffffff
00649 e90c000000                     jmp        0x7ff77414b05a
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
00692 418b9ef0000000                 mov        ebx, dword ptr [r14 + 0xf0]
00699 4c3b2578638420                 cmp        r12, qword ptr [rip + 0x20846378]
006a0 0f8414000000                   je         0x7ff77414b0ba
006a6 48bf3833a692f77f0000           movabs     rdi, 0x7ff792a63338
006b0 4883e4f0                       and        rsp, 0xfffffffffffffff0
006b4 e8274bc11f                     call       0x7ff793d5fbe0
006b9 f4                             hlt        
006ba 418b8ef4000000                 mov        ecx, dword ptr [r14 + 0xf4]
006c1 4c3b2550638420                 cmp        r12, qword ptr [rip + 0x20846350]
006c8 0f8414000000                   je         0x7ff77414b0e2
006ce 48bf3833a692f77f0000           movabs     rdi, 0x7ff792a63338
006d8 4883e4f0                       and        rsp, 0xfffffffffffffff0
006dc e8ff4ac11f                     call       0x7ff793d5fbe0
006e1 f4                             hlt        
006e2 418b4604                       mov        eax, dword ptr [r14 + 4]
006e6 448b7614                       mov        r14d, dword ptr [rsi + 0x14]
006ea 4c3b2527638420                 cmp        r12, qword ptr [rip + 0x20846327]
006f1 0f8414000000                   je         0x7ff77414b10b
006f7 48bf3833a692f77f0000           movabs     rdi, 0x7ff792a63338
00701 4883e4f0                       and        rsp, 0xfffffffffffffff0
00705 e8d64ac11f                     call       0x7ff793d5fbe0
0070a f4                             hlt        
0070b 458b7604                       mov        r14d, dword ptr [r14 + 4]
0070f 41ffce                         dec        r14d
00712 418b5514                       mov        edx, dword ptr [r13 + 0x14]
00716 4c3b25fb628420                 cmp        r12, qword ptr [rip + 0x208462fb]
0071d 0f8414000000                   je         0x7ff77414b137
00723 48bf3833a692f77f0000           movabs     rdi, 0x7ff792a63338
0072d 4883e4f0                       and        rsp, 0xfffffffffffffff0
00731 e8aa4ac11f                     call       0x7ff793d5fbe0
00736 f4                             hlt        
00737 8b5204                         mov        edx, dword ptr [rdx + 4]
0073a ffca                           dec        edx
0073c 418b7114                       mov        esi, dword ptr [r9 + 0x14]
00740 4c3b25d1628420                 cmp        r12, qword ptr [rip + 0x208462d1]
00747 0f8414000000                   je         0x7ff77414b161
0074d 48bf3833a692f77f0000           movabs     rdi, 0x7ff792a63338
00757 4883e4f0                       and        rsp, 0xfffffffffffffff0
0075b e8804ac11f                     call       0x7ff793d5fbe0
00760 f4                             hlt        
00761 8b7604                         mov        esi, dword ptr [rsi + 4]
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
008a2 48be30cc4368f77f0000           movabs     rsi, 0x7ff76843cc30
008ac 4489ac24f8010000               mov        dword ptr [rsp + 0x1f8], r13d
008b4 41bdf0010000                   mov        r13d, 0x1f0
008ba 7d06                           jge        0x7ff77414b2c2
008bc 41bd00020000                   mov        r13d, 0x200
008c2 4a8b0c2e                       mov        rcx, qword ptr [rsi + r13]
008c6 488d4901                       lea        rcx, [rcx + 1]
008ca 4a890c2e                       mov        qword ptr [rsi + r13], rcx
008ce 0f8dd70e0000                   jge        0x7ff77414c1ab
008d4 8bb424d8010000                 mov        esi, dword ptr [rsp + 0x1d8]
008db 8b4b14                         mov        ecx, dword ptr [rbx + 0x14]
008de 4c3b2533618420                 cmp        r12, qword ptr [rip + 0x20846133]
008e5 0f8414000000                   je         0x7ff77414b2ff
008eb 48bf3833a692f77f0000           movabs     rdi, 0x7ff792a63338
008f5 4883e4f0                       and        rsp, 0xfffffffffffffff0
008f9 e8e248c11f                     call       0x7ff793d5fbe0
008fe f4                             hlt        
008ff 4d8beb                         mov        r13, r11
00902 4d23ee                         and        r13, r14
00905 443b6904                       cmp        r13d, dword ptr [rcx + 4]
00909 0f83dc170000                   jae        0x7ff77414caeb
0090f 4d63ed                         movsxd     r13, r13d
00912 48899c24e8000000               mov        qword ptr [rsp + 0xe8], rbx
0091a 4a8b5ce908                     mov        rbx, qword ptr [rcx + r13*8 + 8]
0091f 48899c2410020000               mov        qword ptr [rsp + 0x210], rbx
00927 8b4814                         mov        ecx, dword ptr [rax + 0x14]
0092a 4c3b25e7608420                 cmp        r12, qword ptr [rip + 0x208460e7]
00931 0f8414000000                   je         0x7ff77414b34b
00937 48bf3833a692f77f0000           movabs     rdi, 0x7ff792a63338
00941 4883e4f0                       and        rsp, 0xfffffffffffffff0
00945 e89648c11f                     call       0x7ff793d5fbe0
0094a f4                             hlt        
0094b 4c8bef                         mov        r13, rdi
0094e 4c23ea                         and        r13, rdx
00951 443b6904                       cmp        r13d, dword ptr [rcx + 4]
00955 0f83fd170000                   jae        0x7ff77414cb58
0095b 4d63ed                         movsxd     r13, r13d
0095e 89bc24fc010000                 mov        dword ptr [rsp + 0x1fc], edi
00965 4a8b7ce908                     mov        rdi, qword ptr [rcx + r13*8 + 8]
0096a 4889bc2428020000               mov        qword ptr [rsp + 0x228], rdi
00972 418b4914                       mov        ecx, dword ptr [r9 + 0x14]
00976 4c3b259b608420                 cmp        r12, qword ptr [rip + 0x2084609b]
0097d 0f8414000000                   je         0x7ff77414b397
00983 48bf3833a692f77f0000           movabs     rdi, 0x7ff792a63338
0098d 4883e4f0                       and        rsp, 0xfffffffffffffff0
00991 e84a48c11f                     call       0x7ff793d5fbe0
00996 f4                             hlt        
00997 4d8be8                         mov        r13, r8
0099a 4c23ee                         and        r13, rsi
0099d 443b6904                       cmp        r13d, dword ptr [rcx + 4]
009a1 0f831e180000                   jae        0x7ff77414cbc5
009a7 4d63ed                         movsxd     r13, r13d
009aa 48898424e0000000               mov        qword ptr [rsp + 0xe0], rax
009b2 4a8b44e908                     mov        rax, qword ptr [rcx + r13*8 + 8]
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
00a2e 49b830cc4368f77f0000           movabs     r8, 0x7ff76843cc30
00a38 4c898c2438010000               mov        qword ptr [rsp + 0x138], r9
00a40 41b910020000                   mov        r9d, 0x210
00a46 7d06                           jge        0x7ff77414b44e
00a48 41b920020000                   mov        r9d, 0x220
00a4e 44899c2408020000               mov        dword ptr [rsp + 0x208], r11d
00a56 4f8b1c08                       mov        r11, qword ptr [r8 + r9]
00a5a 4d8d5b01                       lea        r11, [r11 + 1]
00a5e 4f891c08                       mov        qword ptr [r8 + r9], r11
00a62 0f8d1c000000                   jge        0x7ff77414b484
00a68 49b830cc4368f77f0000           movabs     r8, 0x7ff76843cc30
00a72 41ff8030020000                 inc        dword ptr [r8 + 0x230]
00a79 41b801000000                   mov        r8d, 1
00a7f e906000000                     jmp        0x7ff77414b48a
00a84 41b800000000                   mov        r8d, 0
00a8a 4489b4240c020000               mov        dword ptr [rsp + 0x20c], r14d
00a92 4585c0                         test       r8d, r8d
00a95 49b930cc4368f77f0000           movabs     r9, 0x7ff76843cc30
00a9f 41bb48020000                   mov        r11d, 0x248
00aa5 7406                           je         0x7ff77414b4ad
00aa7 41bb58020000                   mov        r11d, 0x258
00aad 4f8b3419                       mov        r14, qword ptr [r9 + r11]
00ab1 4d8d7601                       lea        r14, [r14 + 1]
00ab5 4f893419                       mov        qword ptr [r9 + r11], r14
00ab9 898c243c020000                 mov        dword ptr [rsp + 0x23c], ecx
00ac0 0f842a000000                   je         0x7ff77414b4f0
00ac6 b928000000                     mov        ecx, 0x28
00acb 4c8bdb                         mov        r11, rbx
00ace 49d3eb                         shr        r11, cl
00ad1 458bdb                         mov        r11d, r11d
00ad4 4181e3ff000000                 and        r11d, 0xff
00adb 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
00ae5 ff8168020000                   inc        dword ptr [rcx + 0x268]
00aeb e906000000                     jmp        0x7ff77414b4f6
00af0 41bb00000000                   mov        r11d, 0
00af6 4585c0                         test       r8d, r8d
00af9 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
00b03 41be80020000                   mov        r14d, 0x280
00b09 7406                           je         0x7ff77414b511
00b0b 41be90020000                   mov        r14d, 0x290
00b11 4a8b1c31                       mov        rbx, qword ptr [rcx + r14]
00b15 488d5b01                       lea        rbx, [rbx + 1]
00b19 4a891c31                       mov        qword ptr [rcx + r14], rbx
00b1d 0f8428000000                   je         0x7ff77414b54b
00b23 b928000000                     mov        ecx, 0x28
00b28 488bd8                         mov        rbx, rax
00b2b 48d3eb                         shr        rbx, cl
00b2e 8bdb                           mov        ebx, ebx
00b30 81e3ff000000                   and        ebx, 0xff
00b36 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
00b40 ff81a0020000                   inc        dword ptr [rcx + 0x2a0]
00b46 e905000000                     jmp        0x7ff77414b550
00b4b bb00000000                     mov        ebx, 0
00b50 4585c0                         test       r8d, r8d
00b53 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
00b5d 41beb8020000                   mov        r14d, 0x2b8
00b63 7406                           je         0x7ff77414b56b
00b65 41bec8020000                   mov        r14d, 0x2c8
00b6b 4a8b0431                       mov        rax, qword ptr [rcx + r14]
00b6f 488d4001                       lea        rax, [rax + 1]
00b73 4a890431                       mov        qword ptr [rcx + r14], rax
00b77 0f8427000000                   je         0x7ff77414b5a4
00b7d b928000000                     mov        ecx, 0x28
00b82 488bc7                         mov        rax, rdi
00b85 48d3e8                         shr        rax, cl
00b88 8bc0                           mov        eax, eax
00b8a 25ff000000                     and        eax, 0xff
00b8f 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
00b99 ff81d8020000                   inc        dword ptr [rcx + 0x2d8]
00b9f e905000000                     jmp        0x7ff77414b5a9
00ba4 b800000000                     mov        eax, 0
00ba9 4403db                         add        r11d, ebx
00bac 4403d8                         add        r11d, eax
00baf 498bcd                         mov        rcx, r13
00bb2 03ce                           add        ecx, esi
00bb4 03ca                           add        ecx, edx
00bb6 4c8bf1                         mov        r14, rcx
00bb9 4503f3                         add        r14d, r11d
00bbc 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
00bc6 ff81f0020000                   inc        dword ptr [rcx + 0x2f0]
00bcc 4585f6                         test       r14d, r14d
00bcf 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
00bd9 be80030000                     mov        esi, 0x380
00bde 7505                           jne        0x7ff77414b5e5
00be0 be90030000                     mov        esi, 0x390
00be5 488b3c31                       mov        rdi, qword ptr [rcx + rsi]
00be9 488d7f01                       lea        rdi, [rdi + 1]
00bed 48893c31                       mov        qword ptr [rcx + rsi], rdi
00bf1 89842430020000                 mov        dword ptr [rsp + 0x230], eax
00bf8 899c2424020000                 mov        dword ptr [rsp + 0x224], ebx
00bff 0f8550000000                   jne        0x7ff77414b655
00c05 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
00c0f ff81a0030000                   inc        dword ptr [rcx + 0x3a0]
00c15 8bbc24f0000000                 mov        edi, dword ptr [rsp + 0xf0]
00c1c 448bb424f4000000               mov        r14d, dword ptr [rsp + 0xf4]
00c24 488bb424f8000000               mov        rsi, qword ptr [rsp + 0xf8]
00c2c 488b8c2400010000               mov        rcx, qword ptr [rsp + 0x100]
00c34 8b9c2408010000                 mov        ebx, dword ptr [rsp + 0x108]
00c3b b800000000                     mov        eax, 0
00c40 4489842438020000               mov        dword ptr [rsp + 0x238], r8d
00c48 4489ac2458020000               mov        dword ptr [rsp + 0x258], r13d
00c50 e91b030000                     jmp        0x7ff77414b970
00c55 4183fe3f                       cmp        r14d, 0x3f
00c59 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
00c63 beb8030000                     mov        esi, 0x3b8
00c68 7f05                           jg         0x7ff77414b66f
00c6a bec8030000                     mov        esi, 0x3c8
00c6f 488b3c31                       mov        rdi, qword ptr [rcx + rsi]
00c73 488d7f01                       lea        rdi, [rdi + 1]
00c77 48893c31                       mov        qword ptr [rcx + rsi], rdi
00c7b 0f8f58090000                   jg         0x7ff77414bfd9
00c81 b940000000                     mov        ecx, 0x40
00c86 2b8c24f4000000                 sub        ecx, dword ptr [rsp + 0xf4]
00c8d 443bf1                         cmp        r14d, ecx
00c90 48be30cc4368f77f0000           movabs     rsi, 0x7ff76843cc30
00c9a bfd8030000                     mov        edi, 0x3d8
00c9f 7f05                           jg         0x7ff77414b6a6
00ca1 bfe8030000                     mov        edi, 0x3e8
00ca6 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
00caa 488d5b01                       lea        rbx, [rbx + 1]
00cae 48891c3e                       mov        qword ptr [rsi + rdi], rbx
00cb2 0f8fbd000000                   jg         0x7ff77414b775
00cb8 412bce                         sub        ecx, r14d
00cbb 488bb42400010000               mov        rsi, qword ptr [rsp + 0x100]
00cc3 48d3ee                         shr        rsi, cl
00cc6 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
00cd0 488381f803000001               add        qword ptr [rcx + 0x3f8], 1
00cd8 48b9b81c4368f77f0000           movabs     rcx, 0x7ff768431cb8
00ce2 8b7978                         mov        edi, dword ptr [rcx + 0x78]
00ce5 83c702                         add        edi, 2
00ce8 897978                         mov        dword ptr [rcx + 0x78], edi
00ceb 81e7feff1f00                   and        edi, 0x1ffffe
00cf1 85ff                           test       edi, edi
00cf3 0f84ee140000                   je         0x7ff77414cbe7
00cf9 4183fe40                       cmp        r14d, 0x40
00cfd 48b9b81c4368f77f0000           movabs     rcx, 0x7ff768431cb8
00d07 bfb0000000                     mov        edi, 0xb0
00d0c 7c05                           jl         0x7ff77414b713
00d0e bfc0000000                     mov        edi, 0xc0
00d13 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
00d17 488d5b01                       lea        rbx, [rbx + 1]
00d1b 48891c39                       mov        qword ptr [rcx + rdi], rbx
00d1f 0f8c1c000000                   jl         0x7ff77414b741
00d25 48b9b81c4368f77f0000           movabs     rcx, 0x7ff768431cb8
00d2f ff81d0000000                   inc        dword ptr [rcx + 0xd0]
00d35 48c7c7ffffffff                 mov        rdi, 0xffffffffffffffff
00d3c e914000000                     jmp        0x7ff77414b755
00d41 bf01000000                     mov        edi, 1
00d46 498bce                         mov        rcx, r14
00d49 488bdf                         mov        rbx, rdi
00d4c 48d3e3                         shl        rbx, cl
00d4f 482bdf                         sub        rbx, rdi
00d52 488bfb                         mov        rdi, rbx
00d55 4823fe                         and        rdi, rsi
00d58 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
00d62 ff8108040000                   inc        dword ptr [rcx + 0x408]
00d68 488b9c2400010000               mov        rbx, qword ptr [rsp + 0x100]
00d70 e9b6000000                     jmp        0x7ff77414b82b
00d75 498bf6                         mov        rsi, r14
00d78 2bf1                           sub        esi, ecx
00d7a 48bf30cc4368f77f0000           movabs     rdi, 0x7ff76843cc30
00d84 4883872004000001               add        qword ptr [rdi + 0x420], 1
00d8c 48bfb81c4368f77f0000           movabs     rdi, 0x7ff768431cb8
00d96 8b5f78                         mov        ebx, dword ptr [rdi + 0x78]
00d99 83c302                         add        ebx, 2
00d9c 895f78                         mov        dword ptr [rdi + 0x78], ebx
00d9f 81e3feff1f00                   and        ebx, 0x1ffffe
00da5 85db                           test       ebx, ebx
00da7 0f845b140000                   je         0x7ff77414cc08
00dad 83f940                         cmp        ecx, 0x40
00db0 48bfb81c4368f77f0000           movabs     rdi, 0x7ff768431cb8
00dba bbb0000000                     mov        ebx, 0xb0
00dbf 7c05                           jl         0x7ff77414b7c6
00dc1 bbc0000000                     mov        ebx, 0xc0
00dc6 488b041f                       mov        rax, qword ptr [rdi + rbx]
00dca 488d4001                       lea        rax, [rax + 1]
00dce 4889041f                       mov        qword ptr [rdi + rbx], rax
00dd2 0f8c1c000000                   jl         0x7ff77414b7f4
00dd8 48b9b81c4368f77f0000           movabs     rcx, 0x7ff768431cb8
00de2 ff81d0000000                   inc        dword ptr [rcx + 0xd0]
00de8 48c7c7ffffffff                 mov        rdi, 0xffffffffffffffff
00def e911000000                     jmp        0x7ff77414b805
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
00e40 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
00e4a b840040000                     mov        eax, 0x440
00e4f 7d05                           jge        0x7ff77414b856
00e51 b830040000                     mov        eax, 0x430
00e56 488b1401                       mov        rdx, qword ptr [rcx + rax]
00e5a 488d5201                       lea        rdx, [rdx + 1]
00e5e 48891401                       mov        qword ptr [rcx + rax], rdx
00e62 0f8d33000000                   jge        0x7ff77414b89b
00e68 488b9424f8000000               mov        rdx, qword ptr [rsp + 0xf8]
00e70 488bc7                         mov        rax, rdi
00e73 498bfe                         mov        rdi, r14
00e76 4c8bf6                         mov        r14, rsi
00e79 488bf2                         mov        rsi, rdx
00e7c 488bcb                         mov        rcx, rbx
00e7f 8b9c2408010000                 mov        ebx, dword ptr [rsp + 0x108]
00e86 4489842438020000               mov        dword ptr [rsp + 0x238], r8d
00e8e 4489ac2458020000               mov        dword ptr [rsp + 0x258], r13d
00e96 e9d5000000                     jmp        0x7ff77414b970
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
00edf 48b830cc4368f77f0000           movabs     rax, 0x7ff76843cc30
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
00f1f e83c435e07                     call       0x7ff77b72fc60
00f24 0f1f84001c100004               nop        dword ptr [rax + rax + 0x400101c]
00f2c 488bc8                         mov        rcx, rax
00f2f 48be30cc4368f77f0000           movabs     rsi, 0x7ff76843cc30
00f39 ff8660040000                   inc        dword ptr [rsi + 0x460]
00f3f 488b842440020000               mov        rax, qword ptr [rsp + 0x240]
00f47 8bbc2448020000                 mov        edi, dword ptr [rsp + 0x248]
00f4e 448bb4244c020000               mov        r14d, dword ptr [rsp + 0x24c]
00f56 488bf1                         mov        rsi, rcx
00f59 488b8c24f8000000               mov        rcx, qword ptr [rsp + 0xf8]
00f61 8b9c2450020000                 mov        ebx, dword ptr [rsp + 0x250]
00f68 448b9c2454020000               mov        r11d, dword ptr [rsp + 0x254]
00f70 48ba30cc4368f77f0000           movabs     rdx, 0x7ff76843cc30
00f7a 488382e804000001               add        qword ptr [rdx + 0x4e8], 1
00f82 48bab81c4368f77f0000           movabs     rdx, 0x7ff768431cb8
00f8c 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
00f90 4183c002                       add        r8d, 2
00f94 44894278                       mov        dword ptr [rdx + 0x78], r8d
00f98 4181e0feff1f00                 and        r8d, 0x1ffffe
00f9f 4585c0                         test       r8d, r8d
00fa2 0f8481120000                   je         0x7ff77414cc29
00fa8 4183fb40                       cmp        r11d, 0x40
00fac 48bab81c4368f77f0000           movabs     rdx, 0x7ff768431cb8
00fb6 41b8b0000000                   mov        r8d, 0xb0
00fbc 7c06                           jl         0x7ff77414b9c4
00fbe 41b8c0000000                   mov        r8d, 0xc0
00fc4 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
00fc8 4d8d4901                       lea        r9, [r9 + 1]
00fcc 4e890c02                       mov        qword ptr [rdx + r8], r9
00fd0 0f8c24000000                   jl         0x7ff77414b9fa
00fd6 48bab81c4368f77f0000           movabs     rdx, 0x7ff768431cb8
00fe0 ff82d0000000                   inc        dword ptr [rdx + 0xd0]
00fe6 48c7c2ffffffff                 mov        rdx, 0xffffffffffffffff
00fed 48898c2468020000               mov        qword ptr [rsp + 0x268], rcx
00ff5 e91c000000                     jmp        0x7ff77414ba16
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
01029 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
01033 488381f804000001               add        qword ptr [rcx + 0x4f8], 1
0103b 48b9b81c4368f77f0000           movabs     rcx, 0x7ff768431cb8
01045 448b5978                       mov        r11d, dword ptr [rcx + 0x78]
01049 4183c302                       add        r11d, 2
0104d 44895978                       mov        dword ptr [rcx + 0x78], r11d
01051 4181e3feff1f00                 and        r11d, 0x1ffffe
01058 4585db                         test       r11d, r11d
0105b 0f84e9110000                   je         0x7ff77414cc4a
01061 4183f940                       cmp        r9d, 0x40
01065 48b9b81c4368f77f0000           movabs     rcx, 0x7ff768431cb8
0106f 41bbb0000000                   mov        r11d, 0xb0
01075 7c06                           jl         0x7ff77414ba7d
01077 41bbc0000000                   mov        r11d, 0xc0
0107d 4e8b2c19                       mov        r13, qword ptr [rcx + r11]
01081 4d8d6d01                       lea        r13, [r13 + 1]
01085 4e892c19                       mov        qword ptr [rcx + r11], r13
01089 0f8c1c000000                   jl         0x7ff77414baab
0108f 48b9b81c4368f77f0000           movabs     rcx, 0x7ff768431cb8
01099 ff81d0000000                   inc        dword ptr [rcx + 0xd0]
0109f 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
010a6 e915000000                     jmp        0x7ff77414bac0
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
010dc 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
010e6 4883810805000001               add        qword ptr [rcx + 0x508], 1
010ee 48b9b81c4368f77f0000           movabs     rcx, 0x7ff768431cb8
010f8 448b4978                       mov        r9d, dword ptr [rcx + 0x78]
010fc 4183c102                       add        r9d, 2
01100 44894978                       mov        dword ptr [rcx + 0x78], r9d
01104 4181e1feff1f00                 and        r9d, 0x1ffffe
0110b 4585c9                         test       r9d, r9d
0110e 0f8457110000                   je         0x7ff77414cc6b
01114 4183fd40                       cmp        r13d, 0x40
01118 48b9b81c4368f77f0000           movabs     rcx, 0x7ff768431cb8
01122 41b9b0000000                   mov        r9d, 0xb0
01128 7c06                           jl         0x7ff77414bb30
0112a 41b9c0000000                   mov        r9d, 0xc0
01130 4a8b3409                       mov        rsi, qword ptr [rcx + r9]
01134 488d7601                       lea        rsi, [rsi + 1]
01138 4a893409                       mov        qword ptr [rcx + r9], rsi
0113c 0f8c1c000000                   jl         0x7ff77414bb5e
01142 48b9b81c4368f77f0000           movabs     rcx, 0x7ff768431cb8
0114c ff81d0000000                   inc        dword ptr [rcx + 0xd0]
01152 48c7c6ffffffff                 mov        rsi, 0xffffffffffffffff
01159 e914000000                     jmp        0x7ff77414bb72
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
0118c 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
01196 4883811805000001               add        qword ptr [rcx + 0x518], 1
0119e 48b9b81c4368f77f0000           movabs     rcx, 0x7ff768431cb8
011a8 448b6978                       mov        r13d, dword ptr [rcx + 0x78]
011ac 4183c502                       add        r13d, 2
011b0 44896978                       mov        dword ptr [rcx + 0x78], r13d
011b4 4181e5feff1f00                 and        r13d, 0x1ffffe
011bb 4585ed                         test       r13d, r13d
011be 0f84c8100000                   je         0x7ff77414cc8c
011c4 4183f940                       cmp        r9d, 0x40
011c8 48b9b81c4368f77f0000           movabs     rcx, 0x7ff768431cb8
011d2 41bdb0000000                   mov        r13d, 0xb0
011d8 7c06                           jl         0x7ff77414bbe0
011da 41bdc0000000                   mov        r13d, 0xc0
011e0 4a8b3c29                       mov        rdi, qword ptr [rcx + r13]
011e4 488d7f01                       lea        rdi, [rdi + 1]
011e8 4a893c29                       mov        qword ptr [rcx + r13], rdi
011ec 0f8c1c000000                   jl         0x7ff77414bc0e
011f2 48b9b81c4368f77f0000           movabs     rcx, 0x7ff768431cb8
011fc ff81d0000000                   inc        dword ptr [rcx + 0xd0]
01202 48c7c7ffffffff                 mov        rdi, 0xffffffffffffffff
01209 e914000000                     jmp        0x7ff77414bc22
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
01268 49bd30cc4368f77f0000           movabs     r13, 0x7ff76843cc30
01272 41ff8528050000                 inc        dword ptr [r13 + 0x528]
01279 4c899c2480020000               mov        qword ptr [rsp + 0x280], r11
01281 89b42478020000                 mov        dword ptr [rsp + 0x278], esi
01288 8994247c020000                 mov        dword ptr [rsp + 0x27c], edx
0128f 4489b42488020000               mov        dword ptr [rsp + 0x288], r14d
01297 899c2470020000                 mov        dword ptr [rsp + 0x270], ebx
0129e 48bf30cc4368f77f0000           movabs     rdi, 0x7ff76843cc30
012a8 4883877805000001               add        qword ptr [rdi + 0x578], 1
012b0 488bf0                         mov        rsi, rax
012b3 90                             nop        
012b4 90                             nop        
012b5 90                             nop        
012b6 90                             nop        
012b7 e8a43f5e07                     call       0x7ff77b72fc60
012bc 0f1f8400b4130005               nop        dword ptr [rax + rax + 0x50013b4]
012c4 48be30cc4368f77f0000           movabs     rsi, 0x7ff76843cc30
012ce 4883868805000001               add        qword ptr [rsi + 0x588], 1
012d6 488bb424e8010000               mov        rsi, qword ptr [rsp + 0x1e8]
012de 488b9424f0010000               mov        rdx, qword ptr [rsp + 0x1f0]
012e6 8b8c24f8010000                 mov        ecx, dword ptr [rsp + 0x1f8]
012ed 4c8bc0                         mov        r8, rax
012f0 448b8c2478020000               mov        r9d, dword ptr [rsp + 0x278]
012f8 8bbc2474020000                 mov        edi, dword ptr [rsp + 0x274]
012ff e85c3f5e07                     call       0x7ff77b72fc60
01304 0f1f8400fc130006               nop        dword ptr [rax + rax + 0x60013fc]
0130c 448b842438020000               mov        r8d, dword ptr [rsp + 0x238]
01314 4585c0                         test       r8d, r8d
01317 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
01321 baa8050000                     mov        edx, 0x5a8
01326 7505                           jne        0x7ff77414bd2d
01328 ba98050000                     mov        edx, 0x598
0132d 4c8b0411                       mov        r8, qword ptr [rcx + rdx]
01331 4d8d4001                       lea        r8, [r8 + 1]
01335 4c890411                       mov        qword ptr [rcx + rdx], r8
01339 0f851c000000                   jne        0x7ff77414bd5b
0133f 448b9c2408020000               mov        r11d, dword ptr [rsp + 0x208]
01347 8bbc24fc010000                 mov        edi, dword ptr [rsp + 0x1fc]
0134e 448b842404020000               mov        r8d, dword ptr [rsp + 0x204]
01356 e99c010000                     jmp        0x7ff77414bef7
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
013b0 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
013ba 488381b805000001               add        qword ptr [rcx + 0x5b8], 1
013c2 48b9b81d4368f77f0000           movabs     rcx, 0x7ff768431db8
013cc 8b7178                         mov        esi, dword ptr [rcx + 0x78]
013cf 83c602                         add        esi, 2
013d2 897178                         mov        dword ptr [rcx + 0x78], esi
013d5 81e6feff1f00                   and        esi, 0x1ffffe
013db 85f6                           test       esi, esi
013dd 0f84ca0e0000                   je         0x7ff77414ccad
013e3 83fa20                         cmp        edx, 0x20
013e6 48b9b81d4368f77f0000           movabs     rcx, 0x7ff768431db8
013f0 beb0000000                     mov        esi, 0xb0
013f5 7c05                           jl         0x7ff77414bdfc
013f7 bec0000000                     mov        esi, 0xc0
013fc 488b3c31                       mov        rdi, qword ptr [rcx + rsi]
01400 488d7f01                       lea        rdi, [rdi + 1]
01404 48893c31                       mov        qword ptr [rcx + rsi], rdi
01408 0f8c1a000000                   jl         0x7ff77414be28
0140e 48b9b81d4368f77f0000           movabs     rcx, 0x7ff768431db8
01418 ff81d0000000                   inc        dword ptr [rcx + 0xd0]
0141e baffffffff                     mov        edx, 0xffffffff
01423 e90c000000                     jmp        0x7ff77414be34
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
01452 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
0145c 488381c805000001               add        qword ptr [rcx + 0x5c8], 1
01464 48b9b81d4368f77f0000           movabs     rcx, 0x7ff768431db8
0146e 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
01472 4183c002                       add        r8d, 2
01476 44894178                       mov        dword ptr [rcx + 0x78], r8d
0147a 4181e0feff1f00                 and        r8d, 0x1ffffe
01481 4585c0                         test       r8d, r8d
01484 0f84440e0000                   je         0x7ff77414ccce
0148a 83fe20                         cmp        esi, 0x20
0148d 48b9b81d4368f77f0000           movabs     rcx, 0x7ff768431db8
01497 41b8b0000000                   mov        r8d, 0xb0
0149d 7c06                           jl         0x7ff77414bea5
0149f 41b8c0000000                   mov        r8d, 0xc0
014a5 4a8b0401                       mov        rax, qword ptr [rcx + r8]
014a9 488d4001                       lea        rax, [rax + 1]
014ad 4a890401                       mov        qword ptr [rcx + r8], rax
014b1 0f8c1b000000                   jl         0x7ff77414bed2
014b7 48b9b81d4368f77f0000           movabs     rcx, 0x7ff768431db8
014c1 ff81d0000000                   inc        dword ptr [rcx + 0xd0]
014c7 41b8ffffffff                   mov        r8d, 0xffffffff
014cd e90f000000                     jmp        0x7ff77414bee1
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
01525 49bd30cc4368f77f0000           movabs     r13, 0x7ff76843cc30
0152f 458b4d7c                       mov        r9d, dword ptr [r13 + 0x7c]
01533 4183c102                       add        r9d, 2
01537 45894d7c                       mov        dword ptr [r13 + 0x7c], r9d
0153b 4181e1fe3f0000                 and        r9d, 0x3ffe
01542 4585c9                         test       r9d, r9d
01545 0f84a40d0000                   je         0x7ff77414ccef
0154b 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0154f 418502                         test       dword ptr [r10], eax
01552 49b930cc4368f77f0000           movabs     r9, 0x7ff76843cc30
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
015d4 e9bff2ffff                     jmp        0x7ff77414b298
015d9 4c8bac2418010000               mov        r13, qword ptr [rsp + 0x118]
015e1 448b842428010000               mov        r8d, dword ptr [rsp + 0x128]
015e9 8b8c242c010000                 mov        ecx, dword ptr [rsp + 0x12c]
015f0 488b942430010000               mov        rdx, qword ptr [rsp + 0x130]
015f8 48bec81f28e300000000           movabs     rsi, 0xe3281fc8
01602 488bbe80000000                 mov        rdi, qword ptr [rsi + 0x80]
01609 41ba01000000                   mov        r10d, 1
0160f 4903fa                         add        rdi, r10
01612 4889be80000000                 mov        qword ptr [rsi + 0x80], rdi
01619 418bbd44010000                 mov        edi, dword ptr [r13 + 0x144]
01620 4c3b25f1538420                 cmp        r12, qword ptr [rip + 0x208453f1]
01627 0f8414000000                   je         0x7ff77414c041
0162d 48bf3833a692f77f0000           movabs     rdi, 0x7ff792a63338
01637 4883e4f0                       and        rsp, 0xfffffffffffffff0
0163b e8a03bc11f                     call       0x7ff793d5fbe0
01640 f4                             hlt        
01641 4889bc2490020000               mov        qword ptr [rsp + 0x290], rdi
01649 483b07                         cmp        rax, qword ptr [rdi]
0164c 488bf7                         mov        rsi, rdi
0164f 48bb30cc4368f77f0000           movabs     rbx, 0x7ff76843cc30
01659 8b36                           mov        esi, dword ptr [rsi]
0165b c1ee0d                         shr        esi, 0xd
0165e 48c1e60a                       shl        rsi, 0xa
01662 41ba0000001c                   mov        r10d, 0x1c000000
01668 4903f2                         add        rsi, r10
0166b 41ba90000000                   mov        r10d, 0x90
01671 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
01675 743c                           je         0x7ff77414c0b3
01677 4983c202                       add        r10, 2
0167b 4981fa94000000                 cmp        r10, 0x94
01682 75ed                           jne        0x7ff77414c071
01684 41ba90000000                   mov        r10d, 0x90
0168a 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0168f 7415                           je         0x7ff77414c0a6
01691 4983c202                       add        r10, 2
01695 4981fa94000000                 cmp        r10, 0x94
0169c 75ec                           jne        0x7ff77414c08a
0169e 41ba8f000000                   mov        r10d, 0x8f
016a4 eb11                           jmp        0x7ff77414c0b7
016a6 50                             push       rax
016a7 4833c0                         xor        rax, rax
016aa f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
016b0 58                             pop        rax
016b1 ebb8                           jmp        0x7ff77414c06b
016b3 4983c201                       add        r10, 1
016b7 4a8304d301                     add        qword ptr [rbx + r10*8], 1
016bc 488bf7                         mov        rsi, rdi
016bf 4c89ac2418010000               mov        qword ptr [rsp + 0x118], r13
016c7 e894315e07                     call       0x7ff77b72f260
016cc 0f1f8400c4170008               nop        dword ptr [rax + rax + 0x80017c4]
016d4 488bbc2490020000               mov        rdi, qword ptr [rsp + 0x290]
016dc 48b830cc4368f77f0000           movabs     rax, 0x7ff76843cc30
016e6 8b3f                           mov        edi, dword ptr [rdi]
016e8 c1ef0d                         shr        edi, 0xd
016eb 48c1e70a                       shl        rdi, 0xa
016ef 41ba0000001c                   mov        r10d, 0x1c000000
016f5 4903fa                         add        rdi, r10
016f8 41ba96000000                   mov        r10d, 0x96
016fe 4a3b3cd0                       cmp        rdi, qword ptr [rax + r10*8]
01702 7442                           je         0x7ff77414c146
01704 4983c202                       add        r10, 2
01708 4981fa9a000000                 cmp        r10, 0x9a
0170f 75ed                           jne        0x7ff77414c0fe
01711 41ba96000000                   mov        r10d, 0x96
01717 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
0171c 7415                           je         0x7ff77414c133
0171e 4983c202                       add        r10, 2
01722 4981fa9a000000                 cmp        r10, 0x9a
01729 75ec                           jne        0x7ff77414c117
0172b 41ba95000000                   mov        r10d, 0x95
01731 eb17                           jmp        0x7ff77414c14a
01733 53                             push       rbx
01734 488bd8                         mov        rbx, rax
01737 4833c0                         xor        rax, rax
0173a f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
01740 488bc3                         mov        rax, rbx
01743 5b                             pop        rbx
01744 ebb2                           jmp        0x7ff77414c0f8
01746 4983c201                       add        r10, 1
0174a 4a8304d001                     add        qword ptr [rax + r10*8], 1
0174f 48b8f02f4368f77f0000           movabs     rax, 0x7ff768432ff0
01759 8b7078                         mov        esi, dword ptr [rax + 0x78]
0175c 83c602                         add        esi, 2
0175f 897078                         mov        dword ptr [rax + 0x78], esi
01762 81e6feff1f00                   and        esi, 0x1ffffe
01768 85f6                           test       esi, esi
0176a 0f84d20b0000                   je         0x7ff77414cd42
01770 488bbc2490020000               mov        rdi, qword ptr [rsp + 0x290]
01778 8b4714                         mov        eax, dword ptr [rdi + 0x14]
0177b 83f820                         cmp        eax, 0x20
0177e 48b8f02f4368f77f0000           movabs     rax, 0x7ff768432ff0
01788 beb0000000                     mov        esi, 0xb0
0178d 7f05                           jg         0x7ff77414c194
0178f bec0000000                     mov        esi, 0xc0
01794 488b1c30                       mov        rbx, qword ptr [rax + rsi]
01798 488d5b01                       lea        rbx, [rbx + 1]
0179c 48891c30                       mov        qword ptr [rax + rsi], rbx
017a0 0f8fae000000                   jg         0x7ff77414c254
017a6 e9d9000000                     jmp        0x7ff77414c284
017ab 4c8bac24e0010000               mov        r13, qword ptr [rsp + 0x1e0]
017b3 8bb424f0000000                 mov        esi, dword ptr [rsp + 0xf0]
017ba 48b830cc4368f77f0000           movabs     rax, 0x7ff76843cc30
017c4 ff8000060000                   inc        dword ptr [rax + 0x600]
017ca 8b8424dc010000                 mov        eax, dword ptr [rsp + 0x1dc]
017d1 8b9c2410010000                 mov        ebx, dword ptr [rsp + 0x110]
017d8 4863c0                         movsxd     rax, eax
017db 4903c5                         add        rax, r13
017de 4c63eb                         movsxd     r13, ebx
017e1 4c3be8                         cmp        r13, rax
017e4 48bf30cc4368f77f0000           movabs     rdi, 0x7ff76843cc30
017ee bb20060000                     mov        ebx, 0x620
017f3 7c05                           jl         0x7ff77414c1fa
017f5 bb10060000                     mov        ebx, 0x610
017fa 488b141f                       mov        rdx, qword ptr [rdi + rbx]
017fe 488d5201                       lea        rdx, [rdx + 1]
01802 4889141f                       mov        qword ptr [rdi + rbx], rdx
01806 0f8c6d010000                   jl         0x7ff77414c379
0180c 448bac240c010000               mov        r13d, dword ptr [rsp + 0x10c]
01814 413bf5                         cmp        esi, r13d
01817 48be30cc4368f77f0000           movabs     rsi, 0x7ff76843cc30
01821 bf50060000                     mov        edi, 0x650
01826 7505                           jne        0x7ff77414c22d
01828 bf40060000                     mov        edi, 0x640
0182d 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
01831 488d5b01                       lea        rbx, [rbx + 1]
01835 48891c3e                       mov        qword ptr [rsi + rdi], rbx
01839 0f85a0000000                   jne        0x7ff77414c2df
0183f 8bc0                           mov        eax, eax
01841 4881c4c0020000                 add        rsp, 0x2c0
01848 5d                             pop        rbp
01849 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0184d 0f87100b0000                   ja         0x7ff77414cd63
01853 c3                             ret        
01854 488bf7                         mov        rsi, rdi
01857 48bbf02f4368f77f0000           movabs     rbx, 0x7ff768432ff0
01861 488383d000000001               add        qword ptr [rbx + 0xd0], 1
01869 488bf7                         mov        rsi, rdi
0186c 90                             nop        
0186d 90                             nop        
0186e 90                             nop        
0186f e8ec2f5e07                     call       0x7ff77b72f260
01874 0f1f84006c190009               nop        dword ptr [rax + rax + 0x900196c]
0187c 488bbc2490020000               mov        rdi, qword ptr [rsp + 0x290]
01884 448b8c2410010000               mov        r9d, dword ptr [rsp + 0x110]
0188c 448b842414010000               mov        r8d, dword ptr [rsp + 0x114]
01894 488b8c2418010000               mov        rcx, qword ptr [rsp + 0x118]
0189c 4c8bac2420010000               mov        r13, qword ptr [rsp + 0x120]
018a4 48be30cc4368f77f0000           movabs     rsi, 0x7ff76843cc30
018ae 488386d804000001               add        qword ptr [rsi + 0x4d8], 1
018b6 488bf7                         mov        rsi, rdi
018b9 498bd5                         mov        rdx, r13
018bc 90                             nop        
018bd 90                             nop        
018be 90                             nop        
018bf e89c395e07                     call       0x7ff77b72fc60
018c4 0f1f8400bc19000a               nop        dword ptr [rax + rax + 0xa0019bc]
018cc 4881c4c0020000                 add        rsp, 0x2c0
018d3 5d                             pop        rbp
018d4 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
018d8 0f879b0a0000                   ja         0x7ff77414cd79
018de c3                             ret        
018df 90                             nop        
018e0 e9b90a0000                     jmp        0x7ff77414cd9e
018e5 90                             nop        
018e6 90                             nop        
018e7 90                             nop        
018e8 90                             nop        
018e9 90                             nop        
018ea 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
018f1 0f85ca0a0000                   jne        0x7ff77414cdc1
018f7 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
018fe 488d7820                       lea        rdi, [rax + 0x20]
01902 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
01909 0f87b20a0000                   ja         0x7ff77414cdc1
0190f 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
01916 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0191d 488908                         mov        qword ptr [rax], rcx
01920 4833c9                         xor        rcx, rcx
01923 48894808                       mov        qword ptr [rax + 8], rcx
01927 48894810                       mov        qword ptr [rax + 0x10], rcx
0192b 48894818                       mov        qword ptr [rax + 0x18], rcx
0192f 488bd0                         mov        rdx, rax
01932 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
0193c 4883816006000001               add        qword ptr [rcx + 0x660], 1
01944 ba02000000                     mov        edx, 2
01949 48b9d05929e300000000           movabs     rcx, 0xe32959d0
01953 488bf0                         mov        rsi, rax
01956 4889842498020000               mov        qword ptr [rsp + 0x298], rax
0195e 90                             nop        
0195f e8fc2e5e07                     call       0x7ff77b72f260
01964 0f1f84005c1a000b               nop        dword ptr [rax + rax + 0xb001a5c]
0196c 488b842498020000               mov        rax, qword ptr [rsp + 0x298]
01974 e9110b0000                     jmp        0x7ff77414ce8a
01979 48ba30cc4368f77f0000           movabs     rdx, 0x7ff76843cc30
01983 4883823006000001               add        qword ptr [rdx + 0x630], 1
0198b 48bab8214368f77f0000           movabs     rdx, 0x7ff7684321b8
01995 8b7278                         mov        esi, dword ptr [rdx + 0x78]
01998 83c602                         add        esi, 2
0199b 897278                         mov        dword ptr [rdx + 0x78], esi
0199e 81e6feff1f00                   and        esi, 0x1ffffe
019a4 85f6                           test       esi, esi
019a6 0f84220a0000                   je         0x7ff77414cdce
019ac 90                             nop        
019ad 90                             nop        
019ae 90                             nop        
019af 90                             nop        
019b0 e9490a0000                     jmp        0x7ff77414cdfe
019b5 90                             nop        
019b6 90                             nop        
019b7 90                             nop        
019b8 90                             nop        
019b9 90                             nop        
019ba 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
019c1 0f855a0a0000                   jne        0x7ff77414ce21
019c7 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
019ce 488d7820                       lea        rdi, [rax + 0x20]
019d2 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
019d9 0f87420a0000                   ja         0x7ff77414ce21
019df 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
019e6 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
019ed 488908                         mov        qword ptr [rax], rcx
019f0 4833c9                         xor        rcx, rcx
019f3 48894808                       mov        qword ptr [rax + 8], rcx
019f7 48894810                       mov        qword ptr [rax + 0x10], rcx
019fb 48894818                       mov        qword ptr [rax + 0x18], rcx
019ff 488bd0                         mov        rdx, rax
01a02 48b9b8214368f77f0000           movabs     rcx, 0x7ff7684321b8
01a0c 488381b000000001               add        qword ptr [rcx + 0xb0], 1
01a14 ba02000000                     mov        edx, 2
01a19 48b9d05829e300000000           movabs     rcx, 0xe32958d0
01a23 488bf0                         mov        rsi, rax
01a26 48898424a0020000               mov        qword ptr [rsp + 0x2a0], rax
01a2e 90                             nop        
01a2f e82c2e5e07                     call       0x7ff77b72f260
01a34 0f1f84002c1b000c               nop        dword ptr [rax + rax + 0xc001b2c]
01a3c 488b8424a0020000               mov        rax, qword ptr [rsp + 0x2a0]
01a44 e9410a0000                     jmp        0x7ff77414ce8a
01a49 90                             nop        
01a4a 90                             nop        
01a4b 90                             nop        
01a4c 90                             nop        
01a4d 90                             nop        
01a4e 90                             nop        
01a4f 90                             nop        
01a50 e9e8090000                     jmp        0x7ff77414ce3d
01a55 90                             nop        
01a56 90                             nop        
01a57 90                             nop        
01a58 90                             nop        
01a59 90                             nop        
01a5a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
01a61 0f85f9090000                   jne        0x7ff77414ce60
01a67 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
01a6e 488d7820                       lea        rdi, [rax + 0x20]
01a72 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
01a79 0f87e1090000                   ja         0x7ff77414ce60
01a7f 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
01a86 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
01a8d 488908                         mov        qword ptr [rax], rcx
01a90 4833c9                         xor        rcx, rcx
01a93 48894808                       mov        qword ptr [rax + 8], rcx
01a97 48894810                       mov        qword ptr [rax + 0x10], rcx
01a9b 48894818                       mov        qword ptr [rax + 0x18], rcx
01a9f 488bd0                         mov        rdx, rax
01aa2 48b930cc4368f77f0000           movabs     rcx, 0x7ff76843cc30
01aac 488381d000000001               add        qword ptr [rcx + 0xd0], 1
01ab4 ba02000000                     mov        edx, 2
01ab9 48b9905929e300000000           movabs     rcx, 0xe3295990
01ac3 488bf0                         mov        rsi, rax
01ac6 48898424a8020000               mov        qword ptr [rsp + 0x2a8], rax
01ace 90                             nop        
01acf e88c2d5e07                     call       0x7ff77b72f260
01ad4 0f1f8400cc1b000d               nop        dword ptr [rax + rax + 0xd001bcc]
01adc 488b8424a8020000               mov        rax, qword ptr [rsp + 0x2a8]
01ae4 e9a1090000                     jmp        0x7ff77414ce8a
01ae9 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
01af0 55                             push       rbp
01af1 4881ecc0020000                 sub        rsp, 0x2c0
01af8 41817f2000000000               cmp        dword ptr [r15 + 0x20], 0
01b00 7405                           je         0x7ff77414c507
01b02 e8d92c5d07                     call       0x7ff77b71f1e0
01b07 bfe8010000                     mov        edi, 0x1e8
01b0c 4863ff                         movsxd     rdi, edi
01b0f 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
01b13 48899c2440010000               mov        qword ptr [rsp + 0x140], rbx
01b1b bfe0010000                     mov        edi, 0x1e0
01b20 4863ff                         movsxd     rdi, edi
01b23 8b043e                         mov        eax, dword ptr [rsi + rdi]
01b26 89842490010000                 mov        dword ptr [rsp + 0x190], eax
01b2d bfd8010000                     mov        edi, 0x1d8
01b32 4863ff                         movsxd     rdi, edi
01b35 8b143e                         mov        edx, dword ptr [rsi + rdi]
01b38 bfd0010000                     mov        edi, 0x1d0
01b3d 4863ff                         movsxd     rdi, edi
01b40 488b0c3e                       mov        rcx, qword ptr [rsi + rdi]
01b44 bfc8010000                     mov        edi, 0x1c8
01b49 4863ff                         movsxd     rdi, edi
01b4c 4c8b043e                       mov        r8, qword ptr [rsi + rdi]
01b50 bfc0010000                     mov        edi, 0x1c0
01b55 4863ff                         movsxd     rdi, edi
01b58 448b0c3e                       mov        r9d, dword ptr [rsi + rdi]
01b5c bfb8010000                     mov        edi, 0x1b8
01b61 4863ff                         movsxd     rdi, edi
01b64 448b1c3e                       mov        r11d, dword ptr [rsi + rdi]
01b68 bfa0010000                     mov        edi, 0x1a0
01b6d 4863ff                         movsxd     rdi, edi
01b70 448b2c3e                       mov        r13d, dword ptr [rsi + rdi]
01b74 bf98010000                     mov        edi, 0x198
01b79 4863ff                         movsxd     rdi, edi
01b7c 448b343e                       mov        r14d, dword ptr [rsi + rdi]
01b80 bf88010000                     mov        edi, 0x188
01b85 4863ff                         movsxd     rdi, edi
01b88 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
01b8c 48899c2448010000               mov        qword ptr [rsp + 0x148], rbx
01b94 bf78010000                     mov        edi, 0x178
01b99 4863ff                         movsxd     rdi, edi
01b9c 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
01ba0 48899c2450010000               mov        qword ptr [rsp + 0x150], rbx
01ba8 bf70010000                     mov        edi, 0x170
01bad 4863ff                         movsxd     rdi, edi
01bb0 8b3c3e                         mov        edi, dword ptr [rsi + rdi]
01bb3 bb68010000                     mov        ebx, 0x168
01bb8 4863db                         movsxd     rbx, ebx
01bbb 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01bbe 899c2458010000                 mov        dword ptr [rsp + 0x158], ebx
01bc5 bb60010000                     mov        ebx, 0x160
01bca 4863db                         movsxd     rbx, ebx
01bcd 488b1c1e                       mov        rbx, qword ptr [rsi + rbx]
01bd1 48899c2460010000               mov        qword ptr [rsp + 0x160], rbx
01bd9 bb58010000                     mov        ebx, 0x158
01bde 4863db                         movsxd     rbx, ebx
01be1 488b1c1e                       mov        rbx, qword ptr [rsi + rbx]
01be5 48899c2468010000               mov        qword ptr [rsp + 0x168], rbx
01bed bb50010000                     mov        ebx, 0x150
01bf2 4863db                         movsxd     rbx, ebx
01bf5 488b1c1e                       mov        rbx, qword ptr [rsi + rbx]
01bf9 48899c2470010000               mov        qword ptr [rsp + 0x170], rbx
01c01 bb28010000                     mov        ebx, 0x128
01c06 4863db                         movsxd     rbx, ebx
01c09 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01c0c 899c245c010000                 mov        dword ptr [rsp + 0x15c], ebx
01c13 bb20010000                     mov        ebx, 0x120
01c18 4863db                         movsxd     rbx, ebx
01c1b 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01c1e 899c2478010000                 mov        dword ptr [rsp + 0x178], ebx
01c25 bb18010000                     mov        ebx, 0x118
01c2a 4863db                         movsxd     rbx, ebx
01c2d 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01c30 899c247c010000                 mov        dword ptr [rsp + 0x17c], ebx
01c37 bb10010000                     mov        ebx, 0x110
01c3c 4863db                         movsxd     rbx, ebx
01c3f 488b1c1e                       mov        rbx, qword ptr [rsi + rbx]
01c43 48899c2480010000               mov        qword ptr [rsp + 0x180], rbx
01c4b bb08010000                     mov        ebx, 0x108
01c50 4863db                         movsxd     rbx, ebx
01c53 488b1c1e                       mov        rbx, qword ptr [rsi + rbx]
01c57 48899c2488010000               mov        qword ptr [rsp + 0x188], rbx
01c5f bbf8000000                     mov        ebx, 0xf8
01c64 4863db                         movsxd     rbx, ebx
01c67 488b041e                       mov        rax, qword ptr [rsi + rbx]
01c6b bbf0000000                     mov        ebx, 0xf0
01c70 4863db                         movsxd     rbx, ebx
01c73 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01c76 899c2494010000                 mov        dword ptr [rsp + 0x194], ebx
01c7d bbe8000000                     mov        ebx, 0xe8
01c82 4863db                         movsxd     rbx, ebx
01c85 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01c88 899c2498010000                 mov        dword ptr [rsp + 0x198], ebx
01c8f bbe0000000                     mov        ebx, 0xe0
01c94 4863db                         movsxd     rbx, ebx
01c97 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01c9a 899c249c010000                 mov        dword ptr [rsp + 0x19c], ebx
01ca1 bbd8000000                     mov        ebx, 0xd8
01ca6 4863db                         movsxd     rbx, ebx
01ca9 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01cac 899c24a0010000                 mov        dword ptr [rsp + 0x1a0], ebx
01cb3 bbd0000000                     mov        ebx, 0xd0
01cb8 4863db                         movsxd     rbx, ebx
01cbb 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
01cbe 89bc24a4010000                 mov        dword ptr [rsp + 0x1a4], edi
01cc5 488bfe                         mov        rdi, rsi
01cc8 899424c4010000                 mov        dword ptr [rsp + 0x1c4], edx
01ccf 48898c24d0010000               mov        qword ptr [rsp + 0x1d0], rcx
01cd7 4c898424c8010000               mov        qword ptr [rsp + 0x1c8], r8
01cdf 44898c24c0010000               mov        dword ptr [rsp + 0x1c0], r9d
01ce7 44899c24bc010000               mov        dword ptr [rsp + 0x1bc], r11d
01cef 4489ac24b8010000               mov        dword ptr [rsp + 0x1b8], r13d
01cf7 4489b424ac010000               mov        dword ptr [rsp + 0x1ac], r14d
01cff 48898424b0010000               mov        qword ptr [rsp + 0x1b0], rax
01d07 899c24a8010000                 mov        dword ptr [rsp + 0x1a8], ebx
01d0e e85d330020                     call       0x7ff79414fa70
01d13 0f1f840000000000               nop        dword ptr [rax + rax]
01d1b 8b9c24a8010000                 mov        ebx, dword ptr [rsp + 0x1a8]
01d22 4c8beb                         mov        r13, rbx
01d25 8b9c24a0010000                 mov        ebx, dword ptr [rsp + 0x1a0]
01d2c 488bf3                         mov        rsi, rbx
01d2f 8b9c249c010000                 mov        ebx, dword ptr [rsp + 0x19c]
01d36 488bd3                         mov        rdx, rbx
01d39 8b9c2498010000                 mov        ebx, dword ptr [rsp + 0x198]
01d40 4c8bf3                         mov        r14, rbx
01d43 8b9c2494010000                 mov        ebx, dword ptr [rsp + 0x194]
01d4a 488bc3                         mov        rax, rbx
01d4d 488b8c24b0010000               mov        rcx, qword ptr [rsp + 0x1b0]
01d55 4c8bc9                         mov        r9, rcx
01d58 488b9c2488010000               mov        rbx, qword ptr [rsp + 0x188]
01d60 488bcb                         mov        rcx, rbx
01d63 488b9c2480010000               mov        rbx, qword ptr [rsp + 0x180]
01d6b 8bbc247c010000                 mov        edi, dword ptr [rsp + 0x17c]
01d72 4c8bdf                         mov        r11, rdi
01d75 8bbc2478010000                 mov        edi, dword ptr [rsp + 0x178]
01d7c 448b84245c010000               mov        r8d, dword ptr [rsp + 0x15c]
01d84 89b424d8010000                 mov        dword ptr [rsp + 0x1d8], esi
01d8b 488bb42470010000               mov        rsi, qword ptr [rsp + 0x170]
01d93 4889b42438010000               mov        qword ptr [rsp + 0x138], rsi
01d9b 488bb42468010000               mov        rsi, qword ptr [rsp + 0x168]
01da3 4889b424e0000000               mov        qword ptr [rsp + 0xe0], rsi
01dab 488bb42460010000               mov        rsi, qword ptr [rsp + 0x160]
01db3 4889b424e8000000               mov        qword ptr [rsp + 0xe8], rsi
01dbb 8bb42458010000                 mov        esi, dword ptr [rsp + 0x158]
01dc2 89b424f0000000                 mov        dword ptr [rsp + 0xf0], esi
01dc9 8bb424a4010000                 mov        esi, dword ptr [rsp + 0x1a4]
01dd0 89b424f4000000                 mov        dword ptr [rsp + 0xf4], esi
01dd7 488bb42450010000               mov        rsi, qword ptr [rsp + 0x150]
01ddf 4889b424f8000000               mov        qword ptr [rsp + 0xf8], rsi
01de7 488bb42448010000               mov        rsi, qword ptr [rsp + 0x148]
01def 4889b42400010000               mov        qword ptr [rsp + 0x100], rsi
01df7 8bb424ac010000                 mov        esi, dword ptr [rsp + 0x1ac]
01dfe 89b42408010000                 mov        dword ptr [rsp + 0x108], esi
01e05 8bb424b8010000                 mov        esi, dword ptr [rsp + 0x1b8]
01e0c 89b4240c010000                 mov        dword ptr [rsp + 0x10c], esi
01e13 8bb424bc010000                 mov        esi, dword ptr [rsp + 0x1bc]
01e1a 89b42410010000                 mov        dword ptr [rsp + 0x110], esi
01e21 8bb424c0010000                 mov        esi, dword ptr [rsp + 0x1c0]
01e28 89b42414010000                 mov        dword ptr [rsp + 0x114], esi
01e2f 488bb424c8010000               mov        rsi, qword ptr [rsp + 0x1c8]
01e37 4889b42418010000               mov        qword ptr [rsp + 0x118], rsi
01e3f 488bb424d0010000               mov        rsi, qword ptr [rsp + 0x1d0]
01e47 4889b42420010000               mov        qword ptr [rsp + 0x120], rsi
01e4f 8bb424c4010000                 mov        esi, dword ptr [rsp + 0x1c4]
01e56 89b42428010000                 mov        dword ptr [rsp + 0x128], esi
01e5d 8bb42490010000                 mov        esi, dword ptr [rsp + 0x190]
01e64 89b4242c010000                 mov        dword ptr [rsp + 0x12c], esi
01e6b 488bb42440010000               mov        rsi, qword ptr [rsp + 0x140]
01e73 4889b42430010000               mov        qword ptr [rsp + 0x130], rsi
01e7b 898424dc010000                 mov        dword ptr [rsp + 0x1dc], eax
01e82 4c898c24e0010000               mov        qword ptr [rsp + 0x1e0], r9
01e8a 48898c24f0010000               mov        qword ptr [rsp + 0x1f0], rcx
01e92 48899c24e8010000               mov        qword ptr [rsp + 0x1e8], rbx
01e9a 4c8b8c2438010000               mov        r9, qword ptr [rsp + 0x138]
01ea2 488b8424e0000000               mov        rax, qword ptr [rsp + 0xe0]
01eaa 488b9c24e8000000               mov        rbx, qword ptr [rsp + 0xe8]
01eb2 8bb42414010000                 mov        esi, dword ptr [rsp + 0x114]
01eb9 e9dae9ffff                     jmp        0x7ff77414b298
01ebe 49baa0634268f77f0000           movabs     r10, 0x7ff7684263a0
01ec8 4c89542408                     mov        qword ptr [rsp + 8], r10
01ecd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01ed5 e886215807                     call       0x7ff77b6cea60
01eda e97ee1ffff                     jmp        0x7ff77414aa5d
01edf e8fc8c5807                     call       0x7ff77b6d55e0
01ee4 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
01eee 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ef2 e8e932c11f                     call       0x7ff793d5fbe0
01ef7 f4                             hlt        
01ef8 e8e38c5807                     call       0x7ff77b6d55e0
01efd 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
01f07 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f0b e8d032c11f                     call       0x7ff793d5fbe0
01f10 f4                             hlt        
01f11 48891c24                       mov        qword ptr [rsp], rbx
01f15 4889742408                     mov        qword ptr [rsp + 8], rsi
01f1a e8c1955807                     call       0x7ff77b6d5ee0
01f1f 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
01f29 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f2d e8ae32c11f                     call       0x7ff793d5fbe0
01f32 f4                             hlt        
01f33 49ba78354268f77f0000           movabs     r10, 0x7ff768423578
01f3d 4c89542408                     mov        qword ptr [rsp + 8], r10
01f42 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01f4a e811215807                     call       0x7ff77b6cea60
01f4f e989e1ffff                     jmp        0x7ff77414aadd
01f54 e8878c5807                     call       0x7ff77b6d55e0
01f59 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
01f63 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f67 e87432c11f                     call       0x7ff793d5fbe0
01f6c f4                             hlt        
01f6d e86e8c5807                     call       0x7ff77b6d55e0
01f72 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
01f7c 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f80 e85b32c11f                     call       0x7ff793d5fbe0
01f85 f4                             hlt        
01f86 e8558c5807                     call       0x7ff77b6d55e0
01f8b 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
01f95 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f99 e84232c11f                     call       0x7ff793d5fbe0
01f9e f4                             hlt        
01f9f e83c8c5807                     call       0x7ff77b6d55e0
01fa4 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
01fae 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fb2 e82932c11f                     call       0x7ff793d5fbe0
01fb7 f4                             hlt        
01fb8 49bac8374268f77f0000           movabs     r10, 0x7ff7684237c8
01fc2 4c89542408                     mov        qword ptr [rsp + 8], r10
01fc7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01fcf e88c205807                     call       0x7ff77b6cea60
01fd4 e91ce3ffff                     jmp        0x7ff77414acf5
01fd9 49bac8374268f77f0000           movabs     r10, 0x7ff7684237c8
01fe3 4c89542408                     mov        qword ptr [rsp + 8], r10
01fe8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
01ff0 e86b205807                     call       0x7ff77b6cea60
01ff5 e9bae3ffff                     jmp        0x7ff77414adb4
01ffa 49baf8364268f77f0000           movabs     r10, 0x7ff7684236f8
02004 4c89542408                     mov        qword ptr [rsp + 8], r10
02009 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
02011 e84a205807                     call       0x7ff77b6cea60
02016 e933e5ffff                     jmp        0x7ff77414af4e
0201b 49baf8364268f77f0000           movabs     r10, 0x7ff7684236f8
02025 4c89542408                     mov        qword ptr [rsp + 8], r10
0202a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
02032 e829205807                     call       0x7ff77b6cea60
02037 e9cbe5ffff                     jmp        0x7ff77414b007
0203c e89f8b5807                     call       0x7ff77b6d55e0
02041 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
0204b 4883e4f0                       and        rsp, 0xfffffffffffffff0
0204f e88c31c11f                     call       0x7ff793d5fbe0
02054 f4                             hlt        
02055 e8868b5807                     call       0x7ff77b6d55e0
0205a 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
02064 4883e4f0                       and        rsp, 0xfffffffffffffff0
02068 e87331c11f                     call       0x7ff793d5fbe0
0206d f4                             hlt        
0206e e86d8b5807                     call       0x7ff77b6d55e0
02073 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
0207d 4883e4f0                       and        rsp, 0xfffffffffffffff0
02081 e85a31c11f                     call       0x7ff793d5fbe0
02086 f4                             hlt        
02087 e8548b5807                     call       0x7ff77b6d55e0
0208c 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
02096 4883e4f0                       and        rsp, 0xfffffffffffffff0
0209a e84131c11f                     call       0x7ff793d5fbe0
0209f f4                             hlt        
020a0 e83b8b5807                     call       0x7ff77b6d55e0
020a5 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
020af 4883e4f0                       and        rsp, 0xfffffffffffffff0
020b3 e82831c11f                     call       0x7ff793d5fbe0
020b8 f4                             hlt        
020b9 e8228b5807                     call       0x7ff77b6d55e0
020be 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
020c8 4883e4f0                       and        rsp, 0xfffffffffffffff0
020cc e80f31c11f                     call       0x7ff793d5fbe0
020d1 f4                             hlt        
020d2 e8098b5807                     call       0x7ff77b6d55e0
020d7 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
020e1 4883e4f0                       and        rsp, 0xfffffffffffffff0
020e5 e8f630c11f                     call       0x7ff793d5fbe0
020ea f4                             hlt        
020eb 4c892c24                       mov        qword ptr [rsp], r13
020ef 48894c2408                     mov        qword ptr [rsp + 8], rcx
020f4 e8e7935807                     call       0x7ff77b6d5ee0
020f9 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
02103 4883e4f0                       and        rsp, 0xfffffffffffffff0
02107 e8d430c11f                     call       0x7ff793d5fbe0
0210c f4                             hlt        
0210d e8ce8a5807                     call       0x7ff77b6d55e0
02112 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
0211c 4883e4f0                       and        rsp, 0xfffffffffffffff0
02120 e8bb30c11f                     call       0x7ff793d5fbe0
02125 f4                             hlt        
02126 e8b58a5807                     call       0x7ff77b6d55e0
0212b 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
02135 4883e4f0                       and        rsp, 0xfffffffffffffff0
02139 e8a230c11f                     call       0x7ff793d5fbe0
0213e f4                             hlt        
0213f e89c8a5807                     call       0x7ff77b6d55e0
02144 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
0214e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02152 e88930c11f                     call       0x7ff793d5fbe0
02157 f4                             hlt        
02158 4c892c24                       mov        qword ptr [rsp], r13
0215c 48894c2408                     mov        qword ptr [rsp + 8], rcx
02161 e87a935807                     call       0x7ff77b6d5ee0
02166 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
02170 4883e4f0                       and        rsp, 0xfffffffffffffff0
02174 e86730c11f                     call       0x7ff793d5fbe0
02179 f4                             hlt        
0217a e8618a5807                     call       0x7ff77b6d55e0
0217f 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
02189 4883e4f0                       and        rsp, 0xfffffffffffffff0
0218d e84e30c11f                     call       0x7ff793d5fbe0
02192 f4                             hlt        
02193 e8488a5807                     call       0x7ff77b6d55e0
02198 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
021a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
021a6 e83530c11f                     call       0x7ff793d5fbe0
021ab f4                             hlt        
021ac e82f8a5807                     call       0x7ff77b6d55e0
021b1 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
021bb 4883e4f0                       and        rsp, 0xfffffffffffffff0
021bf e81c30c11f                     call       0x7ff793d5fbe0
021c4 f4                             hlt        
021c5 4c892c24                       mov        qword ptr [rsp], r13
021c9 48894c2408                     mov        qword ptr [rsp + 8], rcx
021ce e80d935807                     call       0x7ff77b6d5ee0
021d3 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
021dd 4883e4f0                       and        rsp, 0xfffffffffffffff0
021e1 e8fa2fc11f                     call       0x7ff793d5fbe0
021e6 f4                             hlt        
021e7 49bac8374268f77f0000           movabs     r10, 0x7ff7684237c8
021f1 4c89542408                     mov        qword ptr [rsp + 8], r10
021f6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
021fe e85d1e5807                     call       0x7ff77b6cea60
02203 e9f1eaffff                     jmp        0x7ff77414b6f9
02208 49bac8374268f77f0000           movabs     r10, 0x7ff7684237c8
02212 4c89542408                     mov        qword ptr [rsp + 8], r10
02217 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0221f e83c1e5807                     call       0x7ff77b6cea60
02224 e984ebffff                     jmp        0x7ff77414b7ad
02229 49bac8374268f77f0000           movabs     r10, 0x7ff7684237c8
02233 4c89542408                     mov        qword ptr [rsp + 8], r10
02238 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
02240 e81b1e5807                     call       0x7ff77b6cea60
02245 e95eedffff                     jmp        0x7ff77414b9a8
0224a 49bac8374268f77f0000           movabs     r10, 0x7ff7684237c8
02254 4c89542408                     mov        qword ptr [rsp + 8], r10
02259 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
02261 e8fa1d5807                     call       0x7ff77b6cea60
02266 e9f6edffff                     jmp        0x7ff77414ba61
0226b 49bac8374268f77f0000           movabs     r10, 0x7ff7684237c8
02275 4c89542408                     mov        qword ptr [rsp + 8], r10
0227a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
02282 e8d91d5807                     call       0x7ff77b6cea60
02287 e988eeffff                     jmp        0x7ff77414bb14
0228c 49bac8374268f77f0000           movabs     r10, 0x7ff7684237c8
02296 4c89542408                     mov        qword ptr [rsp + 8], r10
0229b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
022a3 e8b81d5807                     call       0x7ff77b6cea60
022a8 e917efffff                     jmp        0x7ff77414bbc4
022ad 49baf8364268f77f0000           movabs     r10, 0x7ff7684236f8
022b7 4c89542408                     mov        qword ptr [rsp + 8], r10
022bc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
022c4 e8971d5807                     call       0x7ff77b6cea60
022c9 e915f1ffff                     jmp        0x7ff77414bde3
022ce 49baf8364268f77f0000           movabs     r10, 0x7ff7684236f8
022d8 4c89542408                     mov        qword ptr [rsp + 8], r10
022dd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
022e5 e8761d5807                     call       0x7ff77b6cea60
022ea e99bf1ffff                     jmp        0x7ff77414be8a
022ef 49baa0634268f77f0000           movabs     r10, 0x7ff7684263a0
022f9 4c89542408                     mov        qword ptr [rsp + 8], r10
022fe 48c70424a9030000               mov        qword ptr [rsp], 0x3a9
02306 e8551d5807                     call       0x7ff77b6cea60
0230b e93bf2ffff                     jmp        0x7ff77414bf4b
02310 e8cb885807                     call       0x7ff77b6d55e0
02315 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
0231f 4883e4f0                       and        rsp, 0xfffffffffffffff0
02323 e8b82ec11f                     call       0x7ff793d5fbe0
02328 f4                             hlt        
02329 e8b2885807                     call       0x7ff77b6d55e0
0232e 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
02338 4883e4f0                       and        rsp, 0xfffffffffffffff0
0233c e89f2ec11f                     call       0x7ff793d5fbe0
02341 f4                             hlt        
02342 49ba20a24168f77f0000           movabs     r10, 0x7ff76841a220
0234c 4c89542408                     mov        qword ptr [rsp + 8], r10
02351 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
02359 e8021d5807                     call       0x7ff77b6cea60
0235e e90df4ffff                     jmp        0x7ff77414c170
02363 49ba49c21474f77f0000           movabs     r10, 0x7ff77414c249
0236d 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02374 e9e7555e07                     jmp        0x7ff77b732360
02379 49bad4c21474f77f0000           movabs     r10, 0x7ff77414c2d4
02383 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
0238a e9d1555e07                     jmp        0x7ff77b732360
0238f 48ba0000000000000000           movabs     rdx, 0
02399 b8000f050a                     mov        eax, 0xa050f00
0239e e8bd315807                     call       0x7ff77b6cff60
023a3 e938f5ffff                     jmp        0x7ff77414c2e0
023a8 e833885807                     call       0x7ff77b6d55e0
023ad 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
023b7 4883e4f0                       and        rsp, 0xfffffffffffffff0
023bb e8202ec11f                     call       0x7ff793d5fbe0
023c0 f4                             hlt        
023c1 488bd2                         mov        rdx, rdx
023c4 e817785807                     call       0x7ff77b6d45e0
023c9 e961f5ffff                     jmp        0x7ff77414c32f
023ce 49ba687b4268f77f0000           movabs     r10, 0x7ff768427b68
023d8 4c89542408                     mov        qword ptr [rsp + 8], r10
023dd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
023e5 e8761c5807                     call       0x7ff77b6cea60
023ea e9bdf5ffff                     jmp        0x7ff77414c3ac
023ef 48ba0000000000000000           movabs     rdx, 0
023f9 b8000f050a                     mov        eax, 0xa050f00
023fe e85d315807                     call       0x7ff77b6cff60
02403 e9a8f5ffff                     jmp        0x7ff77414c3b0
02408 e8d3875807                     call       0x7ff77b6d55e0
0240d 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
02417 4883e4f0                       and        rsp, 0xfffffffffffffff0
0241b e8c02dc11f                     call       0x7ff793d5fbe0
02420 f4                             hlt        
02421 488bd2                         mov        rdx, rdx
02424 e8b7775807                     call       0x7ff77b6d45e0
02429 e9d1f5ffff                     jmp        0x7ff77414c3ff
0242e 48ba0000000000000000           movabs     rdx, 0
02438 b8000f050a                     mov        eax, 0xa050f00
0243d e81e315807                     call       0x7ff77b6cff60
02442 e909f6ffff                     jmp        0x7ff77414c450
02447 e894875807                     call       0x7ff77b6d55e0
0244c 48bfb5909492f77f0000           movabs     rdi, 0x7ff7929490b5
02456 4883e4f0                       and        rsp, 0xfffffffffffffff0
0245a e8812dc11f                     call       0x7ff793d5fbe0
0245f f4                             hlt        
02460 488bd2                         mov        rdx, rdx
02463 e878775807                     call       0x7ff77b6d45e0
02468 e932f6ffff                     jmp        0x7ff77414c49f
0246d 498b8708060000                 mov        rax, qword ptr [r15 + 0x608]
02474 49c7870806000000000000         mov        qword ptr [r15 + 0x608], 0
0247f 49c7871006000000000000         mov        qword ptr [r15 + 0x610], 0
0248a 4881c4c0020000                 add        rsp, 0x2c0
02491 5d                             pop        rbp
02492 e9c9965807                     jmp        0x7ff77b6d6560
02497 f4                             hlt        
