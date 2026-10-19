00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c0cda8ff                   jne        0x7f1e7f90f960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ece0000000                 sub        rsp, 0xe0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85e42b0000                   jne        0x7f1e7fe857a2
0003e 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4d8bd8                         mov        r11, r8
00049 4889742408                     mov        qword ptr [rsp + 8], rsi
0004e 448b563c                       mov        r10d, dword ptr [rsi + 0x3c]
00052 448b4638                       mov        r8d, dword ptr [rsi + 0x38]
00056 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0005b 452bc2                         sub        r8d, r10d
0005e 8b8c24f0000000                 mov        ecx, dword ptr [rsp + 0xf0]
00065 413bc8                         cmp        ecx, r8d
00068 0f8f46240000                   jg         0x7f1e7fe85034
0006e 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00072 4c89442430                     mov        qword ptr [rsp + 0x30], r8
00077 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
0007b 48638c24f0000000               movsxd     rcx, dword ptr [rsp + 0xf0]
00083 4d63ca                         movsxd     r9, r10d
00086 4c034c2430                     add        r9, qword ptr [rsp + 0x30]
0008b 4d2bc1                         sub        r8, r9
0008e 493bc8                         cmp        rcx, r8
00091 0f8f1d240000                   jg         0x7f1e7fe85034
00097 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
0009b 4c89442448                     mov        qword ptr [rsp + 0x48], r8
000a0 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000a4 4d85c0                         test       r8, r8
000a7 0f84eb120000                   je         0x7f1e7fe83f18
000ad 33db                           xor        ebx, ebx
000af 4c8bf2                         mov        r14, rdx
000b2 8b7208                         mov        esi, dword ptr [rdx + 8]
000b5 4c8b4c2408                     mov        r9, qword ptr [rsp + 8]
000ba 418b4944                       mov        ecx, dword ptr [r9 + 0x44]
000be 448bef                         mov        r13d, edi
000c1 85ff                           test       edi, edi
000c3 0f8ecb1d0000                   jle        0x7f1e7fe84a14
000c9 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
000d1 4c2b442430                     sub        r8, qword ptr [rsp + 0x30]
000d6 448d4ee0                       lea        r9d, [rsi - 0x20]
000da 8b7c242c                       mov        edi, dword ptr [rsp + 0x2c]
000de 83c7e0                         add        edi, -0x20
000e1 418b5308                       mov        edx, dword ptr [r11 + 8]
000e5 85d2                           test       edx, edx
000e7 0f86df230000                   jbe        0x7f1e7fe8504c
000ed 4c63d2                         movsxd     r10, edx
000f0 4963d5                         movsxd     rdx, r13d
000f3 48ffca                         dec        rdx
000f6 493bd2                         cmp        rdx, r10
000f9 0f83cd230000                   jae        0x7f1e7fe8504c
000ff 488bac24f8000000               mov        rbp, qword ptr [rsp + 0xf8]
00107 8b4508                         mov        eax, dword ptr [rbp + 8]
0010a 85c0                           test       eax, eax
0010c 0f8622240000                   jbe        0x7f1e7fe850b4
00112 83f801                         cmp        eax, 1
00115 0f8619240000                   jbe        0x7f1e7fe850b4
0011b 83f802                         cmp        eax, 2
0011e 0f8610240000                   jbe        0x7f1e7fe850b4
00124 448d56f1                       lea        r10d, [rsi - 0xf]
00128 4585d2                         test       r10d, r10d
0012b 0f8c03240000                   jl         0x7f1e7fe850b4
00131 8b5108                         mov        edx, dword ptr [rcx + 8]
00134 448d52f1                       lea        r10d, [rdx - 0xf]
00138 4585d2                         test       r10d, r10d
0013b 0f8cf3230000                   jl         0x7f1e7fe850b4
00141 448d52f9                       lea        r10d, [rdx - 7]
00145 4585d2                         test       r10d, r10d
00148 0f8ce6230000                   jl         0x7f1e7fe850b4
0014e 899424f8000000                 mov        dword ptr [rsp + 0xf8], edx
00155 898424f4000000                 mov        dword ptr [rsp + 0xf4], eax
0015c 897c2464                       mov        dword ptr [rsp + 0x64], edi
00160 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
00165 89b424f0000000                 mov        dword ptr [rsp + 0xf0], esi
0016c 895c2438                       mov        dword ptr [rsp + 0x38], ebx
00170 4c89442440                     mov        qword ptr [rsp + 0x40], r8
00175 48896c2458                     mov        qword ptr [rsp + 0x58], rbp
0017a 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
0017f 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
00184 4c89742468                     mov        qword ptr [rsp + 0x68], r14
00189 4c8bd1                         mov        r10, rcx
0018c 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00191 894c2470                       mov        dword ptr [rsp + 0x70], ecx
00195 448bd2                         mov        r10d, edx
00198 448bde                         mov        r11d, esi
0019b 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
001a3 4d63da                         movsxd     r11, r10d
001a6 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
001ab 448b8424fc000000               mov        r8d, dword ptr [rsp + 0xfc]
001b3 4183c0f1                       add        r8d, -0xf
001b7 4489442474                     mov        dword ptr [rsp + 0x74], r8d
001bc 4983c3f9                       add        r11, -7
001c0 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
001c8 458d5af9                       lea        r11d, [r10 - 7]
001cc 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
001d4 4183c2f1                       add        r10d, -0xf
001d8 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
001e0 4533d2                         xor        r10d, r10d
001e3 4533c9                         xor        r9d, r9d
001e6 e9c9030000                     jmp        0x7f1e7fe83134
001eb 458bdd                         mov        r11d, r13d
001ee 4d63d3                         movsxd     r10, r11d
001f1 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
001f8 c442a8f5db                     bzhi       r11, r11, r10
001fd c4c1fb92fb                     kmovq      k7, r11
00202 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00208 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0020e 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00216 4503d5                         add        r10d, r13d
00219 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00221 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00225 418502                         test       dword ptr [r10], eax
00228 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00230 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
00238 0f8d86090000                   jge        0x7f1e7fe83744
0023e 8beb                           mov        ebp, ebx
00240 448bcd                         mov        r9d, ebp
00243 442b8c2494000000               sub        r9d, dword ptr [rsp + 0x94]
0024b 448bac2490000000               mov        r13d, dword ptr [rsp + 0x90]
00253 442bac2494000000               sub        r13d, dword ptr [rsp + 0x94]
0025b 443bac2494000000               cmp        r13d, dword ptr [rsp + 0x94]
00263 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0026b 450f4feb                       cmovg      r13d, r11d
0026f 4585c9                         test       r9d, r9d
00272 0f8c18180000                   jl         0x7f1e7fe84610
00278 85ed                           test       ebp, ebp
0027a 0f8c10180000                   jl         0x7f1e7fe84610
00280 478d1429                       lea        r10d, [r9 + r13]
00284 448b8424f8000000               mov        r8d, dword ptr [rsp + 0xf8]
0028c 453bc2                         cmp        r8d, r10d
0028f 0f82fb170000                   jb         0x7f1e7fe84610
00295 8bdd                           mov        ebx, ebp
00297 4103dd                         add        ebx, r13d
0029a 443bc3                         cmp        r8d, ebx
0029d 0f82ed170000                   jb         0x7f1e7fe84610
002a3 4585ed                         test       r13d, r13d
002a6 0f8ce4170000                   jl         0x7f1e7fe84610
002ac 4585ed                         test       r13d, r13d
002af 0f8459ffffff                   je         0x7f1e7fe82d8e
002b5 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
002ba 498d742b0c                     lea        rsi, [r11 + rbp + 0xc]
002bf 4b8d7c0b0c                     lea        rdi, [r11 + r9 + 0xc]
002c4 4963d5                         movsxd     rdx, r13d
002c7 4883fa20                       cmp        rdx, 0x20
002cb 0f861affffff                   jbe        0x7f1e7fe82d6b
002d1 c5f877                         vzeroupper 
002d4 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
002de 41ffd2                         call       r10
002e1 0f1f840000000000               nop        dword ptr [rax + rax]
002e9 e920ffffff                     jmp        0x7f1e7fe82d8e
002ee 448b8c24a4000000               mov        r9d, dword ptr [rsp + 0xa4]
002f6 c4817a7f440b0c                 vmovdqu    xmmword ptr [r11 + r9 + 0xc], xmm0
002fd 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00305 4503d9                         add        r11d, r9d
00308 e981020000                     jmp        0x7f1e7fe8310e
0030d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00312 4b8d7c2b0c                     lea        rdi, [r11 + r13 + 0xc]
00317 448b8424a4000000               mov        r8d, dword ptr [rsp + 0xa4]
0031f 4b8d74030c                     lea        rsi, [r11 + r8 + 0xc]
00324 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0032c 44039424a4000000               add        r10d, dword ptr [rsp + 0xa4]
00334 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
0033c 4d63c2                         movsxd     r8, r10d
0033f 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00347 443b942490000000               cmp        r10d, dword ptr [rsp + 0x90]
0034f 0f8c0a060000                   jl         0x7f1e7fe834df
00355 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
0035d 4183fb30                       cmp        r11d, 0x30
00361 0f8ea3000000                   jle        0x7f1e7fe82f8a
00367 4585ed                         test       r13d, r13d
0036a 0f8cb4170000                   jl         0x7f1e7fe846a4
00370 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
00378 4585db                         test       r11d, r11d
0037b 0f8ca3170000                   jl         0x7f1e7fe846a4
00381 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00389 4503d5                         add        r10d, r13d
0038c 448b9c24f8000000               mov        r11d, dword ptr [rsp + 0xf8]
00394 453bda                         cmp        r11d, r10d
00397 0f8287170000                   jb         0x7f1e7fe846a4
0039d 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
003a5 0f8279170000                   jb         0x7f1e7fe846a4
003ab 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
003b3 4585d2                         test       r10d, r10d
003b6 0f84c2010000                   je         0x7f1e7fe830fe
003bc 4963d2                         movsxd     rdx, r10d
003bf 4883fa20                       cmp        rdx, 0x20
003c3 7728                           ja         0x7f1e7fe82f6d
003c5 458bda                         mov        r11d, r10d
003c8 4d63d3                         movsxd     r10, r11d
003cb 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
003d2 c442a8f5db                     bzhi       r11, r11, r10
003d7 c4c1fb92fb                     kmovq      k7, r11
003dc 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
003e2 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
003e8 e991010000                     jmp        0x7f1e7fe830fe
003ed c5f877                         vzeroupper 
003f0 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
003fa 41ffd2                         call       r10
003fd 0f1f840000000000               nop        dword ptr [rax + rax]
00405 e974010000                     jmp        0x7f1e7fe830fe
0040a 443bac2488000000               cmp        r13d, dword ptr [rsp + 0x88]
00412 0f83c8130000                   jae        0x7f1e7fe84360
00418 4963fd                         movsxd     rdi, r13d
0041b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00420 498b5c3b0c                     mov        rbx, qword ptr [r11 + rdi + 0xc]
00425 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
0042d 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
00435 0f834d140000                   jae        0x7f1e7fe84408
0043b 448b8c24a4000000               mov        r9d, dword ptr [rsp + 0xa4]
00443 418d4908                       lea        ecx, [r9 + 8]
00447 4d63d9                         movsxd     r11, r9d
0044a 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0044f 4b895c1a0c                     mov        qword ptr [r10 + r11 + 0xc], rbx
00454 3b8c24a8000000                 cmp        ecx, dword ptr [rsp + 0xa8]
0045b 0f8d1d010000                   jge        0x7f1e7fe830fe
00461 492bfb                         sub        rdi, r11
00464 4c63d9                         movsxd     r11, ecx
00467 4d8d143b                       lea        r10, [r11 + rdi]
0046b 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
00473 0f83bf140000                   jae        0x7f1e7fe844b8
00479 4d8bd0                         mov        r10, r8
0047c 4d2bd3                         sub        r10, r11
0047f 4983c207                       add        r10, 7
00483 4983e2f8                       and        r10, 0xfffffffffffffff8
00487 458bda                         mov        r11d, r10d
0048a 478d540b08                     lea        r10d, [r11 + r9 + 8]
0048f 4d63d2                         movsxd     r10, r10d
00492 4d8d5c3af8                     lea        r11, [r10 + rdi - 8]
00497 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
0049f 0f8393140000                   jae        0x7f1e7fe844b8
004a5 3b8c2488000000                 cmp        ecx, dword ptr [rsp + 0x88]
004ac 0f8386140000                   jae        0x7f1e7fe844b8
004b2 4983c2f8                       add        r10, -8
004b6 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
004be 0f8374140000                   jae        0x7f1e7fe844b8
004c4 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
004cc 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
004d3 0f8f0b150000                   jg         0x7f1e7fe84564
004d9 452be9                         sub        r13d, r9d
004dc 4183c110                       add        r9d, 0x10
004e0 468d1429                       lea        r10d, [rcx + r13]
004e4 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
004e9 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
004ee 448bd9                         mov        r11d, ecx
004f1 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
004f5 4e89541b0c                     mov        qword ptr [rbx + r11 + 0xc], r10
004fa 83c108                         add        ecx, 8
004fd 413bc9                         cmp        ecx, r9d
00500 7cde                           jl         0x7f1e7fe83060
00502 4983c0f8                       add        r8, -8
00506 4981f800000080                 cmp        r8, -0x80000000
0050d 49c7c200000080                 mov        r10, 0xffffffff80000000
00514 4d0f4cc2                       cmovl      r8, r10
00518 418bd8                         mov        ebx, r8d
0051b 3bcb                           cmp        ecx, ebx
0051d 7d34                           jge        0x7f1e7fe830d3
0051f 90                             nop        
00520 468d1429                       lea        r10d, [rcx + r13]
00524 448bd9                         mov        r11d, ecx
00527 4d63c3                         movsxd     r8, r11d
0052a 458bda                         mov        r11d, r10d
0052d 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
00532 4f8b5c190c                     mov        r11, qword ptr [r9 + r11 + 0xc]
00537 4963fa                         movsxd     rdi, r10d
0053a 448bd1                         mov        r10d, ecx
0053d 4f895c110c                     mov        qword ptr [r9 + r10 + 0xc], r11
00542 4d8b543914                     mov        r10, qword ptr [r9 + rdi + 0x14]
00547 4f89540114                     mov        qword ptr [r9 + r8 + 0x14], r10
0054c 83c110                         add        ecx, 0x10
0054f 3bcb                           cmp        ecx, ebx
00551 7ccd                           jl         0x7f1e7fe830a0
00553 3b8c24a8000000                 cmp        ecx, dword ptr [rsp + 0xa8]
0055a 7d22                           jge        0x7f1e7fe830fe
0055c 468d1429                       lea        r10d, [rcx + r13]
00560 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00565 4f8b44130c                     mov        r8, qword ptr [r11 + r10 + 0xc]
0056a 448bd1                         mov        r10d, ecx
0056d 4f8944130c                     mov        qword ptr [r11 + r10 + 0xc], r8
00572 83c108                         add        ecx, 8
00575 3b8c24a8000000                 cmp        ecx, dword ptr [rsp + 0xa8]
0057c 7cde                           jl         0x7f1e7fe830dc
0057e 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
00586 44039c2490000000               add        r11d, dword ptr [rsp + 0x90]
0058e 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00596 41ffc1                         inc        r9d
00599 443b4c2418                     cmp        r9d, dword ptr [rsp + 0x18]
0059e 0f8df0090000                   jge        0x7f1e7fe83b14
005a4 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
005ac 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
005b4 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
005b9 4f8b44cb10                     mov        r8, qword ptr [r11 + r9*8 + 0x10]
005be 4d8bd8                         mov        r11, r8
005c1 49c1eb12                       shr        r11, 0x12
005c5 458bdb                         mov        r11d, r11d
005c8 4181e3ffff0300                 and        r11d, 0x3ffff
005cf 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
005d7 458bd8                         mov        r11d, r8d
005da 49c1f824                       sar        r8, 0x24
005de 4181e3ffff0100                 and        r11d, 0x1ffff
005e5 458bf3                         mov        r14d, r11d
005e8 458bd8                         mov        r11d, r8d
005eb 418bdb                         mov        ebx, r11d
005ee 4585db                         test       r11d, r11d
005f1 0f8cb90f0000                   jl         0x7f1e7fe84130
005f7 458bde                         mov        r11d, r14d
005fa 4585db                         test       r11d, r11d
005fd 0f8549020000                   jne        0x7f1e7fe833cc
00603 4533db                         xor        r11d, r11d
00606 458bf3                         mov        r14d, r11d
00609 448bdb                         mov        r11d, ebx
0060c 4183fb03                       cmp        r11d, 3
00610 0f8e97020000                   jle        0x7f1e7fe8342d
00616 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
0061b 458b4310                       mov        r8d, dword ptr [r11 + 0x10]
0061f 45894314                       mov        dword ptr [r11 + 0x14], r8d
00623 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
00627 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
0062c 45895810                       mov        dword ptr [r8 + 0x10], r11d
00630 448d5bfd                       lea        r11d, [rbx - 3]
00634 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
0063c 4d8bd8                         mov        r11, r8
0063f 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
00647 4589430c                       mov        dword ptr [r11 + 0xc], r8d
0064b 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
00653 48639c2494000000               movsxd     rbx, dword ptr [rsp + 0x94]
0065b 48899c2498000000               mov        qword ptr [rsp + 0x98], rbx
00663 4c638424a4000000               movsxd     r8, dword ptr [rsp + 0xa4]
0066b 4c03442430                     add        r8, qword ptr [rsp + 0x30]
00670 4963d6                         movsxd     rdx, r14d
00673 4c03c2                         add        r8, rdx
00676 493bd8                         cmp        rbx, r8
00679 0f8fc90f0000                   jg         0x7f1e7fe841c8
0067f 8b9c24a4000000                 mov        ebx, dword ptr [rsp + 0xa4]
00686 4103de                         add        ebx, r14d
00689 448beb                         mov        r13d, ebx
0068c 442bac2494000000               sub        r13d, dword ptr [rsp + 0x94]
00694 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00699 4585db                         test       r11d, r11d
0069c 0f84da010000                   je         0x7f1e7fe833fc
006a2 44899c24ac000000               mov        dword ptr [rsp + 0xac], r11d
006aa 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
006b2 4585c9                         test       r9d, r9d
006b5 0f8ed10e0000                   jle        0x7f1e7fe8410c
006bb 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
006c3 4403db                         add        r11d, ebx
006c6 443b5c2464                     cmp        r11d, dword ptr [rsp + 0x64]
006cb 0f8fef0f0000                   jg         0x7f1e7fe84240
006d1 478d0432                       lea        r8d, [r10 + r14]
006d5 44898424a0000000               mov        dword ptr [rsp + 0xa0], r8d
006dd 443b442460                     cmp        r8d, dword ptr [rsp + 0x60]
006e2 0f8f74100000                   jg         0x7f1e7fe842dc
006e8 4183fe10                       cmp        r14d, 0x10
006ec 0f8fdf040000                   jg         0x7f1e7fe83751
006f2 443b542474                     cmp        r10d, dword ptr [rsp + 0x74]
006f7 0f83ba0c0000                   jae        0x7f1e7fe83f37
006fd 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00702 c4817a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 0xc]
00709 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
00711 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
00719 0f833d0d0000                   jae        0x7f1e7fe83fdc
0071f 478d0416                       lea        r8d, [r14 + r10]
00723 44898424a0000000               mov        dword ptr [rsp + 0xa0], r8d
0072b 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00730 c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
00737 478d141e                       lea        r10d, [r14 + r11]
0073b 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
00743 458bea                         mov        r13d, r10d
00746 442bac2494000000               sub        r13d, dword ptr [rsp + 0x94]
0074e 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00756 4183fb10                       cmp        r11d, 0x10
0075a 0f8fadfbffff                   jg         0x7f1e7fe82e8d
00760 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00768 4183fa10                       cmp        r10d, 0x10
0076c 0f8c9bfbffff                   jl         0x7f1e7fe82e8d
00772 443bac248c000000               cmp        r13d, dword ptr [rsp + 0x8c]
0077a 0f83840d0000                   jae        0x7f1e7fe84084
00780 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00785 c4817a6f442b0c                 vmovdqu    xmm0, xmmword ptr [r11 + r13 + 0xc]
0078c 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
00794 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
0079c 0f824cfbffff                   jb         0x7f1e7fe82e6e
007a2 bee4ffffff                     mov        esi, 0xffffffe4
007a7 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
007ac 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
007b1 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
007b9 448b1424                       mov        r10d, dword ptr [rsp]
007bd 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
007c5 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
007ca 4c891424                       mov        qword ptr [rsp], r10
007ce 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
007d3 4c89542408                     mov        qword ptr [rsp + 8], r10
007d8 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
007dd 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
007e5 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
007ea 4c89542410                     mov        qword ptr [rsp + 0x10], r10
007ef 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
007f4 4489542418                     mov        dword ptr [rsp + 0x18], r10d
007f9 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
007fe 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00803 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00808 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0080d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00812 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00817 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0081c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00821 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00826 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0082b 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00830 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00835 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
0083b 90                             nop        
0083c c5f877                         vzeroupper 
0083f e89c49b5ff                     call       0x7f1e7f9d7d60
00844 0f1f84003c090001               nop        dword ptr [rax + rax + 0x100093c]
0084c 448b0424                       mov        r8d, dword ptr [rsp]
00850 452bc2                         sub        r8d, r10d
00853 453bd8                         cmp        r11d, r8d
00856 0f8eadfdffff                   jle        0x7f1e7fe83189
0085c be45ffffff                     mov        esi, 0xffffff45
00861 418beb                         mov        ebp, r11d
00864 44898424f0000000               mov        dword ptr [rsp + 0xf0], r8d
0086c c5f877                         vzeroupper 
0086f e86c49b5ff                     call       0x7f1e7f9d7d60
00874 0f1f84006c090002               nop        dword ptr [rax + rax + 0x200096c]
0087c 4d63dd                         movsxd     r11, r13d
0087f 4c3b5c2440                     cmp        r11, qword ptr [rsp + 0x40]
00884 0f8c42130000                   jl         0x7f1e7fe8474c
0088a 488bac2498000000               mov        rbp, qword ptr [rsp + 0x98]
00892 483b6c2448                     cmp        rbp, qword ptr [rsp + 0x48]
00897 0f8fbf130000                   jg         0x7f1e7fe847dc
0089d 4533db                         xor        r11d, r11d
008a0 44899c24ac000000               mov        dword ptr [rsp + 0xac], r11d
008a8 e9fdfdffff                     jmp        0x7f1e7fe8322a
008ad 4585f6                         test       r14d, r14d
008b0 7407                           je         0x7f1e7fe83439
008b2 448d5bff                       lea        r11d, [rbx - 1]
008b6 418bdb                         mov        ebx, r11d
008b9 85db                           test       ebx, ebx
008bb 7516                           jne        0x7f1e7fe83453
008bd 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
008c2 418b4b0c                       mov        ecx, dword ptr [r11 + 0xc]
008c6 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
008ce e980000000                     jmp        0x7f1e7fe834d3
008d3 83fb03                         cmp        ebx, 3
008d6 0f8480160000                   je         0x7f1e7fe84adc
008dc 83fb02                         cmp        ebx, 2
008df 0f8717170000                   ja         0x7f1e7fe84b7c
008e5 3b9c24f4000000                 cmp        ebx, dword ptr [rsp + 0xf4]
008ec 0f83eb140000                   jae        0x7f1e7fe8495d
008f2 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
008f7 418b4c980c                     mov        ecx, dword ptr [r8 + rbx*4 + 0xc]
008fc 85db                           test       ebx, ebx
008fe 7e42                           jle        0x7f1e7fe834c2
00900 448d5bff                       lea        r11d, [rbx - 1]
00904 443b9c24f4000000               cmp        r11d, dword ptr [rsp + 0xf4]
0090c 0f8399150000                   jae        0x7f1e7fe84a2b
00912 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
0091a 660f1f440000                   nop        word ptr [rax + rax]
00920 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
00925 458b449808                     mov        r8d, dword ptr [r8 + rbx*4 + 8]
0092a 4c8b4c2458                     mov        r9, qword ptr [rsp + 0x58]
0092f 458944990c                     mov        dword ptr [r9 + rbx*4 + 0xc], r8d
00934 448d5bff                       lea        r11d, [rbx - 1]
00938 418bdb                         mov        ebx, r11d
0093b 4585db                         test       r11d, r11d
0093e 7fe0                           jg         0x7f1e7fe834a0
00940 eb08                           jmp        0x7f1e7fe834ca
00942 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
0094a 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
0094f 41894b0c                       mov        dword ptr [r11 + 0xc], ecx
00953 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
0095a e9f4fcffff                     jmp        0x7f1e7fe831d3
0095f 4183fa10                       cmp        r10d, 0x10
00963 0f8dcb1a0000                   jge        0x7f1e7fe84fb4
00969 4183fa08                       cmp        r10d, 8
0096d 0f8dd0060000                   jge        0x7f1e7fe83bc3
00973 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
0097b 4183fb10                       cmp        r11d, 0x10
0097f 0f8ebc000000                   jle        0x7f1e7fe835c1
00985 4585ed                         test       r13d, r13d
00988 0f8cfe190000                   jl         0x7f1e7fe84f0c
0098e 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
00996 4585d2                         test       r10d, r10d
00999 0f8ced190000                   jl         0x7f1e7fe84f0c
0099f 448b9c24f8000000               mov        r11d, dword ptr [rsp + 0xf8]
009a7 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
009af 0f82d7190000                   jb         0x7f1e7fe84f0c
009b5 8bac2494000000                 mov        ebp, dword ptr [rsp + 0x94]
009bc 03ac24a4000000                 add        ebp, dword ptr [rsp + 0xa4]
009c3 443bdd                         cmp        r11d, ebp
009c6 0f82c0190000                   jb         0x7f1e7fe84f0c
009cc 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
009d4 4585d2                         test       r10d, r10d
009d7 0f8caf190000                   jl         0x7f1e7fe84f0c
009dd 4585d2                         test       r10d, r10d
009e0 0f845af8ffff                   je         0x7f1e7fe82dc0
009e6 488b9c2498000000               mov        rbx, qword ptr [rsp + 0x98]
009ee 4883fb20                       cmp        rbx, 0x20
009f2 772d                           ja         0x7f1e7fe835a1
009f4 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
009fc 4d63d3                         movsxd     r10, r11d
009ff 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00a06 c442a8f5db                     bzhi       r11, r11, r10
00a0b c4c1fb92fb                     kmovq      k7, r11
00a10 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00a16 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00a1c e91ff8ffff                     jmp        0x7f1e7fe82dc0
00a21 488bd3                         mov        rdx, rbx
00a24 c5f877                         vzeroupper 
00a27 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00a31 41ffd2                         call       r10
00a34 0f1f840000000000               nop        dword ptr [rax + rax]
00a3c e9fff7ffff                     jmp        0x7f1e7fe82dc0
00a41 443bac24f8000000               cmp        r13d, dword ptr [rsp + 0xf8]
00a49 0f834d160000                   jae        0x7f1e7fe84c1c
00a4f 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00a54 430fbe6c2a0c                   movsx      ebp, byte ptr [r10 + r13 + 0xc]
00a5a 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
00a62 443b9c24f8000000               cmp        r11d, dword ptr [rsp + 0xf8]
00a6a 0f83d4160000                   jae        0x7f1e7fe84cc4
00a70 43886c1a0c                     mov        byte ptr [r10 + r11 + 0xc], bpl
00a75 448b8c24a4000000               mov        r9d, dword ptr [rsp + 0xa4]
00a7d 41ffc1                         inc        r9d
00a80 458d5d03                       lea        r11d, [r13 + 3]
00a84 443b9c24f8000000               cmp        r11d, dword ptr [rsp + 0xf8]
00a8c 0f8342170000                   jae        0x7f1e7fe84d54
00a92 4963cd                         movsxd     rcx, r13d
00a95 410fbe6c0a0d                   movsx      ebp, byte ptr [r10 + rcx + 0xd]
00a9b 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
00aa3 4183c303                       add        r11d, 3
00aa7 443b9c24f8000000               cmp        r11d, dword ptr [rsp + 0xf8]
00aaf 0f83b7170000                   jae        0x7f1e7fe84dec
00ab5 4c638424a4000000               movsxd     r8, dword ptr [rsp + 0xa4]
00abd 43886c020d                     mov        byte ptr [r10 + r8 + 0xd], bpl
00ac2 450fbe540a0e                   movsx      r10d, byte ptr [r10 + rcx + 0xe]
00ac8 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00acd 478854030e                     mov        byte ptr [r11 + r8 + 0xe], r10b
00ad2 450fbe5c0b0f                   movsx      r11d, byte ptr [r11 + rcx + 0xf]
00ad8 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
00add 47885c010f                     mov        byte ptr [r9 + r8 + 0xf], r11b
00ae2 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00aea 4183fb08                       cmp        r11d, 8
00aee 0f830c180000                   jae        0x7f1e7fe84e80
00af4 49bbc8df2fe300000000           movabs     r11, 0xe32fdfc8
00afe 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00b06 47036c930c                     add        r13d, dword ptr [r11 + r10*4 + 0xc]
00b0b 44896c2404                     mov        dword ptr [rsp + 4], r13d
00b10 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00b18 4183fb04                       cmp        r11d, 4
00b1c 7e3e                           jle        0x7f1e7fe836dc
00b1e 8bac24a4000000                 mov        ebp, dword ptr [rsp + 0xa4]
00b25 83c504                         add        ebp, 4
00b28 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00b2d 418bd5                         mov        edx, r13d
00b30 c5f877                         vzeroupper 
00b33 e8a8d1a8ff                     call       0x7f1e7f910860
00b38 0f1f8400300c0003               nop        dword ptr [rax + rax + 0x3000c30]
00b40 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00b45 8bd5                           mov        edx, ebp
00b47 8bc8                           mov        ecx, eax
00b49 488bee                         mov        rbp, rsi
00b4c c5f877                         vzeroupper 
00b4f e88cd1a8ff                     call       0x7f1e7f910860
00b54 0f1f84004c0c0004               nop        dword ptr [rax + rax + 0x4000c4c]
00b5c 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00b64 4183fa08                       cmp        r10d, 8
00b68 7e5a                           jle        0x7f1e7fe83744
00b6a 8b542404                       mov        edx, dword ptr [rsp + 4]
00b6e 49baf8df2fe300000000           movabs     r10, 0xe32fdff8
00b78 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
00b80 432b54820c                     sub        edx, dword ptr [r10 + r8*4 + 0xc]
00b85 8bac24a4000000                 mov        ebp, dword ptr [rsp + 0xa4]
00b8c 83c508                         add        ebp, 8
00b8f 83c208                         add        edx, 8
00b92 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00b97 90                             nop        
00b98 c5f877                         vzeroupper 
00b9b e840d1a8ff                     call       0x7f1e7f910860
00ba0 0f1f8400980c0005               nop        dword ptr [rax + rax + 0x5000c98]
00ba8 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00bad 8bd5                           mov        edx, ebp
00baf 488bc8                         mov        rcx, rax
00bb2 6690                           nop        
00bb4 c5f877                         vzeroupper 
00bb7 e824d1a8ff                     call       0x7f1e7f910860
00bbc 0f1f8400b40c0006               nop        dword ptr [rax + rax + 0x6000cb4]
00bc4 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00bcc e9bdf9ffff                     jmp        0x7f1e7fe8310e
00bd1 4183fe30                       cmp        r14d, 0x30
00bd5 0f8ea9000000                   jle        0x7f1e7fe83804
00bdb 4585d2                         test       r10d, r10d
00bde 0f8c601b0000                   jl         0x7f1e7fe852c4
00be4 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
00bec 4585db                         test       r11d, r11d
00bef 0f8c571b0000                   jl         0x7f1e7fe852cc
00bf5 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
00bfd 443b8c24a0000000               cmp        r9d, dword ptr [rsp + 0xa0]
00c05 0f82411b0000                   jb         0x7f1e7fe852cc
00c0b 448b8424f8000000               mov        r8d, dword ptr [rsp + 0xf8]
00c13 443bc3                         cmp        r8d, ebx
00c16 0f82301b0000                   jb         0x7f1e7fe852cc
00c1c 4585f6                         test       r14d, r14d
00c1f 743d                           je         0x7f1e7fe837de
00c21 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
00c26 4b8d7c100c                     lea        rdi, [r8 + r10 + 0xc]
00c2b 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00c30 4b8d741a0c                     lea        rsi, [r10 + r11 + 0xc]
00c35 4883fa20                       cmp        rdx, 0x20
00c39 772f                           ja         0x7f1e7fe837ea
00c3b 458bd6                         mov        r10d, r14d
00c3e 4d63d2                         movsxd     r10, r10d
00c41 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c48 c442a8f5db                     bzhi       r11, r11, r10
00c4d c4c1fb92fb                     kmovq      k7, r11
00c52 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c58 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c5e 899c24a4000000                 mov        dword ptr [rsp + 0xa4], ebx
00c65 e9e4faffff                     jmp        0x7f1e7fe832ce
00c6a c5f877                         vzeroupper 
00c6d 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00c77 41ffd2                         call       r10
00c7a 0f1f840000000000               nop        dword ptr [rax + rax]
00c82 ebda                           jmp        0x7f1e7fe837de
00c84 443b542474                     cmp        r10d, dword ptr [rsp + 0x74]
00c89 0f8355190000                   jae        0x7f1e7fe85164
00c8f 4963ca                         movsxd     rcx, r10d
00c92 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00c97 c4c17a6f440b0c                 vmovdqu    xmm0, xmmword ptr [r11 + rcx + 0xc]
00c9e 448b8c24a4000000               mov        r9d, dword ptr [rsp + 0xa4]
00ca6 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
00cae 0f83dc190000                   jae        0x7f1e7fe85210
00cb4 4963f9                         movsxd     rdi, r9d
00cb7 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00cbc c4c17a7f44380c                 vmovdqu    xmmword ptr [r8 + rdi + 0xc], xmm0
00cc3 458d5910                       lea        r11d, [r9 + 0x10]
00cc7 418bc3                         mov        eax, r11d
00cca 443bdb                         cmp        r11d, ebx
00ccd 0f8d84020000                   jge        0x7f1e7fe83ad7
00cd3 482bcf                         sub        rcx, rdi
00cd6 4d63db                         movsxd     r11, r11d
00cd9 48639424fc000000               movsxd     rdx, dword ptr [rsp + 0xfc]
00ce1 4883c2f1                       add        rdx, -0xf
00ce5 4d8d040b                       lea        r8, [r11 + rcx]
00ce9 4c3bc2                         cmp        r8, rdx
00cec 0f830e1b0000                   jae        0x7f1e7fe85380
00cf2 4863fb                         movsxd     rdi, ebx
00cf5 4c8bc7                         mov        r8, rdi
00cf8 4d2bc3                         sub        r8, r11
00cfb 4983c00f                       add        r8, 0xf
00cff 4983e0f0                       and        r8, 0xfffffffffffffff0
00d03 458bd8                         mov        r11d, r8d
00d06 478d440b10                     lea        r8d, [r11 + r9 + 0x10]
00d0b 4d63c0                         movsxd     r8, r8d
00d0e 4d8d5c08f0                     lea        r11, [r8 + rcx - 0x10]
00d13 4c3bda                         cmp        r11, rdx
00d16 0f83e41a0000                   jae        0x7f1e7fe85380
00d1c 448bd8                         mov        r11d, eax
00d1f 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
00d27 0f83d31a0000                   jae        0x7f1e7fe85380
00d2d 4983c0f0                       add        r8, -0x10
00d31 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00d36 4983c3f1                       add        r11, -0xf
00d3a 4d3bc3                         cmp        r8, r11
00d3d 0f83bd1a0000                   jae        0x7f1e7fe85380
00d43 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00d49 0f8f4d1b0000                   jg         0x7f1e7fe8541c
00d4f 418bca                         mov        ecx, r10d
00d52 412bc9                         sub        ecx, r9d
00d55 4183c120                       add        r9d, 0x20
00d59 666690                         nop        
00d5c 448d1c01                       lea        r11d, [rcx + rax]
00d60 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
00d65 c4817a6f44180c                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 0xc]
00d6c 448bc0                         mov        r8d, eax
00d6f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00d74 c4817a7f44030c                 vmovdqu    xmmword ptr [r11 + r8 + 0xc], xmm0
00d7b 448d5810                       lea        r11d, [rax + 0x10]
00d7f 418bc3                         mov        eax, r11d
00d82 453bd9                         cmp        r11d, r9d
00d85 7cd5                           jl         0x7f1e7fe838dc
00d87 4881c710ffffff                 add        rdi, -0xf0
00d8e 4881ff00000080                 cmp        rdi, -0x80000000
00d95 49c7c300000080                 mov        r11, 0xffffffff80000000
00d9c 490f4cfb                       cmovl      rdi, r11
00da0 448bc7                         mov        r8d, edi
00da3 448bd8                         mov        r11d, eax
00da6 453bd8                         cmp        r11d, r8d
00da9 0f8d79010000                   jge        0x7f1e7fe83aa8
00daf 418bc3                         mov        eax, r11d
00db2 0f1f8000000000                 nop        dword ptr [rax]
00db9 0f1f8000000000                 nop        dword ptr [rax]
00dc0 448d1c01                       lea        r11d, [rcx + rax]
00dc4 448bc8                         mov        r9d, eax
00dc7 4963f9                         movsxd     rdi, r9d
00dca 458bcb                         mov        r9d, r11d
00dcd 488b542468                     mov        rdx, qword ptr [rsp + 0x68]
00dd2 c4a17a6f440a0c                 vmovdqu    xmm0, xmmword ptr [rdx + r9 + 0xc]
00dd9 4963d3                         movsxd     rdx, r11d
00ddc 448bd8                         mov        r11d, eax
00ddf 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
00de4 c4817a7f44190c                 vmovdqu    xmmword ptr [r9 + r11 + 0xc], xmm0
00deb 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00df0 c4c17a6f44131c                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x1c]
00df7 c4c17a7f44391c                 vmovdqu    xmmword ptr [r9 + rdi + 0x1c], xmm0
00dfe c4c17a6f44132c                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x2c]
00e05 c4c17a7f44392c                 vmovdqu    xmmword ptr [r9 + rdi + 0x2c], xmm0
00e0c 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00e11 c4c17a6f44133c                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x3c]
00e18 c4c17a7f44393c                 vmovdqu    xmmword ptr [r9 + rdi + 0x3c], xmm0
00e1f c4c17a6f44134c                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x4c]
00e26 c4c17a7f44394c                 vmovdqu    xmmword ptr [r9 + rdi + 0x4c], xmm0
00e2d 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00e32 c4c17a6f44135c                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x5c]
00e39 c4c17a7f44395c                 vmovdqu    xmmword ptr [r9 + rdi + 0x5c], xmm0
00e40 c4c17a6f44136c                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x6c]
00e47 c4c17a7f44396c                 vmovdqu    xmmword ptr [r9 + rdi + 0x6c], xmm0
00e4e 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00e53 c4c17a6f44137c                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x7c]
00e5a c4c17a7f44397c                 vmovdqu    xmmword ptr [r9 + rdi + 0x7c], xmm0
00e61 c4c17a6f84138c000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x8c]
00e6b c4c17a7f84398c000000           vmovdqu    xmmword ptr [r9 + rdi + 0x8c], xmm0
00e75 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00e7a c4c17a6f84139c000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x9c]
00e84 c4c17a7f84399c000000           vmovdqu    xmmword ptr [r9 + rdi + 0x9c], xmm0
00e8e c4c17a6f8413ac000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xac]
00e98 c4c17a7f8439ac000000           vmovdqu    xmmword ptr [r9 + rdi + 0xac], xmm0
00ea2 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00ea7 c4c17a6f8413bc000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xbc]
00eb1 c4c17a7f8439bc000000           vmovdqu    xmmword ptr [r9 + rdi + 0xbc], xmm0
00ebb c4c17a6f8413cc000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xcc]
00ec5 c4c17a7f8439cc000000           vmovdqu    xmmword ptr [r9 + rdi + 0xcc], xmm0
00ecf 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00ed4 c4c17a6f8413dc000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xdc]
00ede c4c17a7f8439dc000000           vmovdqu    xmmword ptr [r9 + rdi + 0xdc], xmm0
00ee8 c4c17a6f8413ec000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xec]
00ef2 c4c17a7f8439ec000000           vmovdqu    xmmword ptr [r9 + rdi + 0xec], xmm0
00efc 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00f01 c4c17a6f8413fc000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xfc]
00f0b c4c17a7f8439fc000000           vmovdqu    xmmword ptr [r9 + rdi + 0xfc], xmm0
00f15 448d9800010000                 lea        r11d, [rax + 0x100]
00f1c 418bc3                         mov        eax, r11d
00f1f 453bd8                         cmp        r11d, r8d
00f22 0f8c98feffff                   jl         0x7f1e7fe83940
00f28 3bc3                           cmp        eax, ebx
00f2a 7d2b                           jge        0x7f1e7fe83ad7
00f2c 448bd8                         mov        r11d, eax
00f2f 90                             nop        
00f30 468d0419                       lea        r8d, [rcx + r11]
00f34 4c8b4c2468                     mov        r9, qword ptr [rsp + 0x68]
00f39 c4817a6f44010c                 vmovdqu    xmm0, xmmword ptr [r9 + r8 + 0xc]
00f40 458bc3                         mov        r8d, r11d
00f43 8b7c2470                       mov        edi, dword ptr [rsp + 0x70]
00f47 c4a17a7f44070c                 vmovdqu    xmmword ptr [rdi + r8 + 0xc], xmm0
00f4e 4183c310                       add        r11d, 0x10
00f52 443bdb                         cmp        r11d, ebx
00f55 7cd9                           jl         0x7f1e7fe83ab0
00f57 478d1c16                       lea        r11d, [r14 + r10]
00f5b 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00f63 899c24a4000000                 mov        dword ptr [rsp + 0xa4], ebx
00f6a e9dff7ffff                     jmp        0x7f1e7fe832ce
00f6f 4d63d0                         movsxd     r10, r8d
00f72 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00f79 c442a8f5db                     bzhi       r11, r11, r10
00f7e c4c1fb92fb                     kmovq      k7, r11
00f83 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00f89 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00f8f e990000000                     jmp        0x7f1e7fe83ba4
00f94 448b0424                       mov        r8d, dword ptr [rsp]
00f98 442b8424a0000000               sub        r8d, dword ptr [rsp + 0xa0]
00fa0 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00fa8 4585d2                         test       r10d, r10d
00fab 0f8cf3150000                   jl         0x7f1e7fe85124
00fb1 4c8b742468                     mov        r14, qword ptr [rsp + 0x68]
00fb6 8bb424f0000000                 mov        esi, dword ptr [rsp + 0xf0]
00fbd 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
00fc1 4585db                         test       r11d, r11d
00fc4 0f8ce3150000                   jl         0x7f1e7fe8512d
00fca 3b3424                         cmp        esi, dword ptr [rsp]
00fcd 0f82da150000                   jb         0x7f1e7fe8512d
00fd3 448b4908                       mov        r9d, dword ptr [rcx + 8]
00fd7 438d1c03                       lea        ebx, [r11 + r8]
00fdb 443bcb                         cmp        r9d, ebx
00fde 0f82c9150000                   jb         0x7f1e7fe8512d
00fe4 4585c0                         test       r8d, r8d
00fe7 0f8cc0150000                   jl         0x7f1e7fe8512d
00fed 4585c0                         test       r8d, r8d
00ff0 7432                           je         0x7f1e7fe83ba4
00ff2 4b8d7c160c                     lea        rdi, [r14 + r10 + 0xc]
00ff7 4c8bd1                         mov        r10, rcx
00ffa 4a8d74190c                     lea        rsi, [rcx + r11 + 0xc]
00fff 4963d0                         movsxd     rdx, r8d
01002 4883fa20                       cmp        rdx, 0x20
01006 0f8663ffffff                   jbe        0x7f1e7fe83aef
0100c c5f877                         vzeroupper 
0100f 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
01019 41ffd2                         call       r10
0101c 0f1f840000000000               nop        dword ptr [rax + rax]
01024 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01029 41895a3c                       mov        dword ptr [r10 + 0x3c], ebx
0102d c5f877                         vzeroupper 
01030 4881c4e0000000                 add        rsp, 0xe0
01037 5d                             pop        rbp
01038 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0103c 0f87ca1b0000                   ja         0x7f1e7fe8578c
01042 c3                             ret        
01043 443bac2488000000               cmp        r13d, dword ptr [rsp + 0x88]
0104b 0f83e7180000                   jae        0x7f1e7fe854b8
01051 418bcd                         mov        ecx, r13d
01054 4863d1                         movsxd     rdx, ecx
01057 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0105c 4d8b4c120c                     mov        r9, qword ptr [r10 + rdx + 0xc]
01061 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
01069 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
01071 0f8369190000                   jae        0x7f1e7fe85560
01077 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
0107f 418d5a08                       lea        ebx, [r10 + 8]
01083 4d63da                         movsxd     r11, r10d
01086 8b7c2470                       mov        edi, dword ptr [rsp + 0x70]
0108a 4e894c1f0c                     mov        qword ptr [rdi + r11 + 0xc], r9
0108f 3b9c24a8000000                 cmp        ebx, dword ptr [rsp + 0xa8]
01096 0f8def020000                   jge        0x7f1e7fe83f0b
0109c 492bd3                         sub        rdx, r11
0109f 4863fb                         movsxd     rdi, ebx
010a2 4c8d1c17                       lea        r11, [rdi + rdx]
010a6 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
010ae 0f83d0190000                   jae        0x7f1e7fe85604
010b4 4d8bd8                         mov        r11, r8
010b7 4c2bdf                         sub        r11, rdi
010ba 4983c307                       add        r11, 7
010be 4983e3f8                       and        r11, 0xfffffffffffffff8
010c2 458bdb                         mov        r11d, r11d
010c5 478d4c1308                     lea        r9d, [r11 + r10 + 8]
010ca 4d63d9                         movsxd     r11, r9d
010cd 4d8d4c13f8                     lea        r9, [r11 + rdx - 8]
010d2 4c3b8c2480000000               cmp        r9, qword ptr [rsp + 0x80]
010da 0f83a4190000                   jae        0x7f1e7fe85604
010e0 3b9c2488000000                 cmp        ebx, dword ptr [rsp + 0x88]
010e7 0f8397190000                   jae        0x7f1e7fe85604
010ed 4983c3f8                       add        r11, -8
010f1 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
010f9 0f8385190000                   jae        0x7f1e7fe85604
010ff 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
01107 4181f9f8ffff7f                 cmp        r9d, 0x7ffffff8
0110e 0f8f081a0000                   jg         0x7f1e7fe8569c
01114 412bca                         sub        ecx, r10d
01117 448bf1                         mov        r14d, ecx
0111a bef4ffffff                     mov        esi, 0xfffffff4
0111f 4d8d58c8                       lea        r11, [r8 - 0x38]
01123 4981fb00000080                 cmp        r11, -0x80000000
0112a 49c7c100000080                 mov        r9, 0xffffffff80000000
01131 4d0f4cd9                       cmovl      r11, r9
01135 458bdb                         mov        r11d, r11d
01138 442bac24a4000000               sub        r13d, dword ptr [rsp + 0xa4]
01140 458d4a10                       lea        r9d, [r10 + 0x10]
01144 488b4c2450                     mov        rcx, qword ptr [rsp + 0x50]
01149 4963e9                         movsxd     rbp, r9d
0114c 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01150 8bd0                           mov        edx, eax
01152 2bf2                           sub        esi, edx
01154 412bf2                         sub        esi, r10d
01157 83c6f0                         add        esi, -0x10
0115a 41ba06000000                   mov        r10d, 6
01160 c462a8f5d6                     bzhi       r10, rsi, r10
01165 4903ea                         add        rbp, r10
01168 493be8                         cmp        rbp, r8
0116b 498bd0                         mov        rdx, r8
0116e 480f4cd5                       cmovl      rdx, rbp
01172 4c8bd2                         mov        r10, rdx
01175 4c2bd7                         sub        r10, rdi
01178 498d72ff                       lea        rsi, [r10 - 1]
0117c 48c1fe3f                       sar        rsi, 0x3f
01180 48c1ee3d                       shr        rsi, 0x3d
01184 4e8d5416ff                     lea        r10, [rsi + r10 - 1]
01189 4983e2f8                       and        r10, 0xfffffffffffffff8
0118d 4c03d7                         add        r10, rdi
01190 493bfa                         cmp        rdi, r10
01193 490f4cfa                       cmovl      rdi, r10
01197 8bf7                           mov        esi, edi
01199 418d7c3508                     lea        edi, [r13 + rsi + 8]
0119e 83c608                         add        esi, 8
011a1 4863c7                         movsxd     rax, edi
011a4 4803c1                         add        rax, rcx
011a7 4863fe                         movsxd     rdi, esi
011aa 4803f9                         add        rdi, rcx
011ad 488d480c                       lea        rcx, [rax + 0xc]
011b1 4883c04c                       add        rax, 0x4c
011b5 488d774c                       lea        rsi, [rdi + 0x4c]
011b9 4533d2                         xor        r10d, r10d
011bc 483bf1                         cmp        rsi, rcx
011bf 410f96c2                       setbe      r10b
011c3 4883c70c                       add        rdi, 0xc
011c7 33c9                           xor        ecx, ecx
011c9 483bc7                         cmp        rax, rdi
011cc 0f96c1                         setbe      cl
011cf 440bd1                         or         r10d, ecx
011d2 0f84140b0000                   je         0x7f1e7fe8486c
011d8 8bd2                           mov        edx, edx
011da 6690                           nop        
011dc 448bd3                         mov        r10d, ebx
011df 418d0c1e                       lea        ecx, [r14 + rbx]
011e3 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
011e8 4d8b4c090c                     mov        r9, qword ptr [r9 + rcx + 0xc]
011ed 8b7c2470                       mov        edi, dword ptr [rsp + 0x70]
011f1 4e894c170c                     mov        qword ptr [rdi + r10 + 0xc], r9
011f6 83c308                         add        ebx, 8
011f9 3bda                           cmp        ebx, edx
011fb 7cdf                           jl         0x7f1e7fe83d5c
011fd 4981c008feffff                 add        r8, -0x1f8
01204 4981f800000080                 cmp        r8, -0x80000000
0120b 49c7c200000080                 mov        r10, 0xffffffff80000000
01212 4d0f4cc2                       cmovl      r8, r10
01216 418bf8                         mov        edi, r8d
01219 3bdf                           cmp        ebx, edi
0121b 0f8d39010000                   jge        0x7f1e7fe83eda
01221 0f1f840000000000               nop        dword ptr [rax + rax]
01229 0f1f8000000000                 nop        dword ptr [rax]
01230 448bd3                         mov        r10d, ebx
01233 4963d2                         movsxd     rdx, r10d
01236 448bc3                         mov        r8d, ebx
01239 418d041e                       lea        eax, [r14 + rbx]
0123d 448d4b40                       lea        r9d, [rbx + 0x40]
01241 4503ce                         add        r9d, r14d
01244 448bd0                         mov        r10d, eax
01247 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
0124b 62b17e486f84110c000000         vmovdqu32  zmm0, zmmword ptr [rcx + r10 + 0xc]
01256 62b17e487f84010c000000         vmovdqu32  zmmword ptr [rcx + r8 + 0xc], zmm0
01261 62b17e486f84090c000000         vmovdqu32  zmm0, zmmword ptr [rcx + r9 + 0xc]
0126c 62f17e487f84114c000000         vmovdqu32  zmmword ptr [rcx + rdx + 0x4c], zmm0
01277 4863c8                         movsxd     rcx, eax
0127a 448d8380000000                 lea        r8d, [rbx + 0x80]
01281 4503c6                         add        r8d, r14d
01284 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01289 62917e486f84010c000000         vmovdqu32  zmm0, zmmword ptr [r9 + r8 + 0xc]
01294 62d17e487f84118c000000         vmovdqu32  zmmword ptr [r9 + rdx + 0x8c], zmm0
0129f 62d17e486f8409cc000000         vmovdqu32  zmm0, zmmword ptr [r9 + rcx + 0xcc]
012aa 62d17e487f8411cc000000         vmovdqu32  zmmword ptr [r9 + rdx + 0xcc], zmm0
012b5 448d9300010000                 lea        r10d, [rbx + 0x100]
012bc 4503d6                         add        r10d, r14d
012bf 418bf2                         mov        esi, r10d
012c2 62917e486f84110c000000         vmovdqu32  zmm0, zmmword ptr [r9 + r10 + 0xc]
012cd 62d17e487f84110c010000         vmovdqu32  zmmword ptr [r9 + rdx + 0x10c], zmm0
012d8 62d17e486f84094c010000         vmovdqu32  zmm0, zmmword ptr [r9 + rcx + 0x14c]
012e3 62d17e487f84114c010000         vmovdqu32  zmmword ptr [r9 + rdx + 0x14c], zmm0
012ee 62d17e486f84098c010000         vmovdqu32  zmm0, zmmword ptr [r9 + rcx + 0x18c]
012f9 62d17e487f84118c010000         vmovdqu32  zmmword ptr [r9 + rdx + 0x18c], zmm0
01304 4c63d6                         movsxd     r10, esi
01307 62917e486f8411cc000000         vmovdqu32  zmm0, zmmword ptr [r9 + r10 + 0xcc]
01312 62d17e487f8411cc010000         vmovdqu32  zmmword ptr [r9 + rdx + 0x1cc], zmm0
0131d 81c300020000                   add        ebx, 0x200
01323 3bdf                           cmp        ebx, edi
01325 0f8c05ffffff                   jl         0x7f1e7fe83db0
0132b 413bdb                         cmp        ebx, r11d
0132e 7d2a                           jge        0x7f1e7fe83eda
01330 458d141e                       lea        r10d, [r14 + rbx]
01334 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01339 62917e486f84100c000000         vmovdqu32  zmm0, zmmword ptr [r8 + r10 + 0xc]
01344 448bd3                         mov        r10d, ebx
01347 62917e487f84100c000000         vmovdqu32  zmmword ptr [r8 + r10 + 0xc], zmm0
01352 83c340                         add        ebx, 0x40
01355 413bdb                         cmp        ebx, r11d
01358 7cd6                           jl         0x7f1e7fe83eb0
0135a 3b9c24a8000000                 cmp        ebx, dword ptr [rsp + 0xa8]
01361 7d28                           jge        0x7f1e7fe83f0b
01363 90                             nop        
01364 458d141e                       lea        r10d, [r14 + rbx]
01368 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0136d 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
01372 448bdb                         mov        r11d, ebx
01375 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0137a 4f8954190c                     mov        qword ptr [r9 + r11 + 0xc], r10
0137f 83c308                         add        ebx, 8
01382 3b9c24a8000000                 cmp        ebx, dword ptr [rsp + 0xa8]
01389 7cd9                           jl         0x7f1e7fe83ee4
0138b 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
01393 e9f6f1ffff                     jmp        0x7f1e7fe8310e
01398 4c03c9                         add        r9, rcx
0139b 4c3b4c2448                     cmp        r9, qword ptr [rsp + 0x48]
013a0 7e08                           jle        0x7f1e7fe83f2a
013a2 4533c0                         xor        r8d, r8d
013a5 e903edffff                     jmp        0x7f1e7fe82c2d
013aa 4533c0                         xor        r8d, r8d
013ad bb01000000                     mov        ebx, 1
013b2 e9f8ecffff                     jmp        0x7f1e7fe82c2f
013b7 bee4ffffff                     mov        esi, 0xffffffe4
013bc 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
013c1 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
013c6 4c899c24f0000000               mov        qword ptr [rsp + 0xf0], r11
013ce 448b1c24                       mov        r11d, dword ptr [rsp]
013d2 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
013da 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
013df 4c891c24                       mov        qword ptr [rsp], r11
013e3 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
013e8 4c895c2408                     mov        qword ptr [rsp + 8], r11
013ed 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
013f2 44898424fc000000               mov        dword ptr [rsp + 0xfc], r8d
013fa 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
013ff 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01404 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01409 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0140e 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01413 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
01418 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
0141d 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
01422 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01427 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
0142c 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01431 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01436 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0143b 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01440 4489742450                     mov        dword ptr [rsp + 0x50], r14d
01445 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0144a 6690                           nop        
0144c c5f877                         vzeroupper 
0144f e88c3db5ff                     call       0x7f1e7f9d7d60
01454 0f1f84004c150007               nop        dword ptr [rax + rax + 0x700154c]
0145c bee4ffffff                     mov        esi, 0xffffffe4
01461 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01466 448b0424                       mov        r8d, dword ptr [rsp]
0146a 44898424f8000000               mov        dword ptr [rsp + 0xf8], r8d
01472 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01477 4c890424                       mov        qword ptr [rsp], r8
0147b 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
01480 4c89442408                     mov        qword ptr [rsp + 8], r8
01485 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
0148a 44898c24fc000000               mov        dword ptr [rsp + 0xfc], r9d
01492 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
01497 4c89442410                     mov        qword ptr [rsp + 0x10], r8
0149c 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
014a1 4489542420                     mov        dword ptr [rsp + 0x20], r10d
014a6 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
014ab 4489442424                     mov        dword ptr [rsp + 0x24], r8d
014b0 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
014b5 4c89542428                     mov        qword ptr [rsp + 0x28], r10
014ba 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
014bf 4c89542438                     mov        qword ptr [rsp + 0x38], r10
014c4 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
014c9 4c89542440                     mov        qword ptr [rsp + 0x40], r10
014ce 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
014d3 4489442434                     mov        dword ptr [rsp + 0x34], r8d
014d8 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
014dd 4489542448                     mov        dword ptr [rsp + 0x48], r10d
014e2 4489742450                     mov        dword ptr [rsp + 0x50], r14d
014e7 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
014ec c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
014f2 6690                           nop        
014f4 c5f877                         vzeroupper 
014f7 e8e43cb5ff                     call       0x7f1e7f9d7d60
014fc 0f1f8400f4150008               nop        dword ptr [rax + rax + 0x80015f4]
01504 bee4ffffff                     mov        esi, 0xffffffe4
01509 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0150e 448b1c24                       mov        r11d, dword ptr [rsp]
01512 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
0151a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0151f 4c891424                       mov        qword ptr [rsp], r10
01523 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01528 4c89542408                     mov        qword ptr [rsp + 8], r10
0152d 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01532 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
0153a 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0153f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01544 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01549 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0154e 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01553 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01558 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0155d 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01562 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01567 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0156c 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01571 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01576 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
0157b 90                             nop        
0157c c5f877                         vzeroupper 
0157f e85c3cb5ff                     call       0x7f1e7f9d7d60
01584 0f1f84007c160009               nop        dword ptr [rax + rax + 0x900167c]
0158c be45ffffff                     mov        esi, 0xffffff45
01591 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01596 4c898424f8000000               mov        qword ptr [rsp + 0xf8], r8
0159e 6690                           nop        
015a0 c5f877                         vzeroupper 
015a3 e8383cb5ff                     call       0x7f1e7f9d7d60
015a8 0f1f8400a016000a               nop        dword ptr [rax + rax + 0xa0016a0]
015b0 be45ffffff                     mov        esi, 0xffffff45
015b5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
015ba 448b1c24                       mov        r11d, dword ptr [rsp]
015be 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
015c6 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
015cb 4c891c24                       mov        qword ptr [rsp], r11
015cf 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
015d4 4c895c2408                     mov        qword ptr [rsp + 8], r11
015d9 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
015de 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
015e6 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
015eb 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
015f0 4489542420                     mov        dword ptr [rsp + 0x20], r10d
015f5 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
015fa 4489542424                     mov        dword ptr [rsp + 0x24], r10d
015ff 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01604 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01609 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0160e 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01613 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01618 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0161d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01622 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01627 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
0162c 4489742450                     mov        dword ptr [rsp + 0x50], r14d
01631 895c2458                       mov        dword ptr [rsp + 0x58], ebx
01635 666690                         nop        
01638 c5f877                         vzeroupper 
0163b e8a03bb5ff                     call       0x7f1e7f9d7d60
01640 0f1f84003817000b               nop        dword ptr [rax + rax + 0xb001738]
01648 493bd8                         cmp        rbx, r8
0164b bdffffffff                     mov        ebp, 0xffffffff
01650 7c08                           jl         0x7f1e7fe841da
01652 400f95c5                       setne      bpl
01656 400fb6ed                       movzx      ebp, bpl
0165a be45ffffff                     mov        esi, 0xffffff45
0165f 48ff742408                     push       qword ptr [rsp + 8]
01664 488f8424f0000000               pop        qword ptr [rsp + 0xf0]
0166c 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01671 4c899c24f8000000               mov        qword ptr [rsp + 0xf8], r11
01679 48ff742420                     push       qword ptr [rsp + 0x20]
0167e 488f442408                     pop        qword ptr [rsp + 8]
01683 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01688 44894c2404                     mov        dword ptr [rsp + 4], r9d
0168d 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01692 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01697 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0169c 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
016a1 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
016a6 4489742458                     mov        dword ptr [rsp + 0x58], r14d
016ab 4c89442468                     mov        qword ptr [rsp + 0x68], r8
016b0 c5f877                         vzeroupper 
016b3 e8283bb5ff                     call       0x7f1e7f9d7d60
016b8 0f1f8400b017000c               nop        dword ptr [rax + rax + 0xc0017b0]
016c0 be45ffffff                     mov        esi, 0xffffff45
016c5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
016ca 448b0c24                       mov        r9d, dword ptr [rsp]
016ce 44898c24f8000000               mov        dword ptr [rsp + 0xf8], r9d
016d6 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
016db 4c890424                       mov        qword ptr [rsp], r8
016df 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
016e4 4c89442408                     mov        qword ptr [rsp + 8], r8
016e9 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
016ee 44898c24fc000000               mov        dword ptr [rsp + 0xfc], r9d
016f6 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
016fb 4c89442410                     mov        qword ptr [rsp + 0x10], r8
01700 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01705 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0170a 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0170f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01714 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01719 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0171e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01723 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01728 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0172d 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01732 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01737 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0173c 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01741 4489742450                     mov        dword ptr [rsp + 0x50], r14d
01746 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0174b 90                             nop        
0174c c5f877                         vzeroupper 
0174f e88c3ab5ff                     call       0x7f1e7f9d7d60
01754 0f1f84004c18000d               nop        dword ptr [rax + rax + 0xd00184c]
0175c be45ffffff                     mov        esi, 0xffffff45
01761 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01766 448b1c24                       mov        r11d, dword ptr [rsp]
0176a 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
01772 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01777 4c891c24                       mov        qword ptr [rsp], r11
0177b 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01780 4c895c2408                     mov        qword ptr [rsp + 8], r11
01785 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0178a 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
01792 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01797 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0179c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
017a1 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
017a6 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
017ab 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
017b0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
017b5 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
017ba 4c89542438                     mov        qword ptr [rsp + 0x38], r10
017bf 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
017c4 4c89542440                     mov        qword ptr [rsp + 0x40], r10
017c9 4489742450                     mov        dword ptr [rsp + 0x50], r14d
017ce 6690                           nop        
017d0 c5f877                         vzeroupper 
017d3 e8083ab5ff                     call       0x7f1e7f9d7d60
017d8 0f1f8400d018000e               nop        dword ptr [rax + rax + 0xe0018d0]
017e0 bee4ffffff                     mov        esi, 0xffffffe4
017e5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
017ea 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
017ef 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
017f7 448b1c24                       mov        r11d, dword ptr [rsp]
017fb 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
01803 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01808 4c891424                       mov        qword ptr [rsp], r10
0180c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01811 4c89542408                     mov        qword ptr [rsp + 8], r10
01816 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0181b 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
01823 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01828 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0182d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01832 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01837 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0183c 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01841 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01846 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0184b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01850 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01855 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0185a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0185f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01864 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01869 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0186e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01873 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
01878 c5f877                         vzeroupper 
0187b e86039b5ff                     call       0x7f1e7f9d7d60
01880 0f1f84007819000f               nop        dword ptr [rax + rax + 0xf001978]
01888 bee4ffffff                     mov        esi, 0xffffffe4
0188d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01892 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01897 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
0189f 448b1424                       mov        r10d, dword ptr [rsp]
018a3 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
018ab 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018b0 4c891424                       mov        qword ptr [rsp], r10
018b4 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
018b9 4c89542408                     mov        qword ptr [rsp + 8], r10
018be 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
018c3 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
018cb 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
018d0 4c89542410                     mov        qword ptr [rsp + 0x10], r10
018d5 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
018da 4489542418                     mov        dword ptr [rsp + 0x18], r10d
018df 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
018e4 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
018e9 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018ee 4c89542428                     mov        qword ptr [rsp + 0x28], r10
018f3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
018f8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
018fd 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01902 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01907 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0190c 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01911 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01916 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0191b 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
01920 48895c2460                     mov        qword ptr [rsp + 0x60], rbx
01925 666690                         nop        
01928 c5f877                         vzeroupper 
0192b e8b038b5ff                     call       0x7f1e7f9d7d60
01930 0f1f8400281a0010               nop        dword ptr [rax + rax + 0x10001a28]
01938 4183c508                       add        r13d, 8
0193c be6effffff                     mov        esi, 0xffffff6e
01941 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01946 448b1424                       mov        r10d, dword ptr [rsp]
0194a 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
01952 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01957 4c891424                       mov        qword ptr [rsp], r10
0195b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01960 4c89542408                     mov        qword ptr [rsp + 8], r10
01965 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0196a 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
01972 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01977 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0197c 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01981 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01986 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0198b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01990 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01995 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0199a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0199f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
019a4 4c89542440                     mov        qword ptr [rsp + 0x40], r10
019a9 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
019ae 4489542434                     mov        dword ptr [rsp + 0x34], r10d
019b3 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
019b8 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
019bd 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
019c5 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
019ca 894c2460                       mov        dword ptr [rsp + 0x60], ecx
019ce 4489542464                     mov        dword ptr [rsp + 0x64], r10d
019d3 90                             nop        
019d4 c5f877                         vzeroupper 
019d7 e80438b5ff                     call       0x7f1e7f9d7d60
019dc 0f1f8400d41a0011               nop        dword ptr [rax + rax + 0x11001ad4]
019e4 4183c508                       add        r13d, 8
019e8 be66ffffff                     mov        esi, 0xffffff66
019ed 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
019f2 448b1424                       mov        r10d, dword ptr [rsp]
019f6 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
019fe 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a03 4c891424                       mov        qword ptr [rsp], r10
01a07 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01a0c 4c89542408                     mov        qword ptr [rsp + 8], r10
01a11 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01a16 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
01a1e 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01a23 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01a28 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01a2d 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01a32 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01a37 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01a3c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01a41 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01a46 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01a4b 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01a50 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01a55 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01a5a 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01a5f 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01a64 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01a69 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
01a71 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
01a76 894c2460                       mov        dword ptr [rsp + 0x60], ecx
01a7a 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01a7f 90                             nop        
01a80 c5f877                         vzeroupper 
01a83 e85837b5ff                     call       0x7f1e7f9d7d60
01a88 0f1f8400801b0012               nop        dword ptr [rax + rax + 0x12001b80]
01a90 beccffffff                     mov        esi, 0xffffffcc
01a95 48ff742408                     push       qword ptr [rsp + 8]
01a9a 488f8424f0000000               pop        qword ptr [rsp + 0xf0]
01aa2 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01aa7 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01aaf 48ff742420                     push       qword ptr [rsp + 0x20]
01ab4 488f442408                     pop        qword ptr [rsp + 8]
01ab9 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01abe 44895c2404                     mov        dword ptr [rsp + 4], r11d
01ac3 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01ac8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01acd 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01ad2 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01ad7 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01adc 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01ae1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01ae6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01aeb 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01af0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01af5 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01afa 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01aff 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01b04 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01b09 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
01b0e 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01b13 90                             nop        
01b14 c5f877                         vzeroupper 
01b17 e8c436b5ff                     call       0x7f1e7f9d7d60
01b1c 0f1f8400141c0013               nop        dword ptr [rax + rax + 0x13001c14]
01b24 beccffffff                     mov        esi, 0xffffffcc
01b29 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01b2e 448b1c24                       mov        r11d, dword ptr [rsp]
01b32 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
01b3a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b3f 4c891424                       mov        qword ptr [rsp], r10
01b43 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01b48 4c89542408                     mov        qword ptr [rsp + 8], r10
01b4d 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01b52 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
01b5a 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01b5f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01b64 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01b69 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01b6e 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01b73 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01b78 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b7d 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01b82 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01b87 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01b8c 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01b91 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01b96 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01b9b 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01ba0 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01ba5 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01baa 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
01bb2 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01bb7 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
01bbc c5f877                         vzeroupper 
01bbf e81c36b5ff                     call       0x7f1e7f9d7d60
01bc4 0f1f8400bc1c0014               nop        dword ptr [rax + rax + 0x14001cbc]
01bcc 4c8b4c2440                     mov        r9, qword ptr [rsp + 0x40]
01bd1 4d3bd9                         cmp        r11, r9
01bd4 bdffffffff                     mov        ebp, 0xffffffff
01bd9 7c08                           jl         0x7f1e7fe84763
01bdb 400f95c5                       setne      bpl
01bdf 400fb6ed                       movzx      ebp, bpl
01be3 be45ffffff                     mov        esi, 0xffffff45
01be8 48ff742408                     push       qword ptr [rsp + 8]
01bed 488f8424f0000000               pop        qword ptr [rsp + 0xf0]
01bf5 48ff742420                     push       qword ptr [rsp + 0x20]
01bfa 488f442408                     pop        qword ptr [rsp + 8]
01bff 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01c04 44894c2404                     mov        dword ptr [rsp + 4], r9d
01c09 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01c0e 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01c13 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01c18 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01c1d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01c22 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01c27 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01c2c 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01c31 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01c36 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01c3b 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01c40 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01c45 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01c4a 6690                           nop        
01c4c c5f877                         vzeroupper 
01c4f e88c35b5ff                     call       0x7f1e7f9d7d60
01c54 0f1f84004c1d0015               nop        dword ptr [rax + rax + 0x15001d4c]
01c5c 4c8b4c2448                     mov        r9, qword ptr [rsp + 0x48]
01c61 493be9                         cmp        rbp, r9
01c64 bdffffffff                     mov        ebp, 0xffffffff
01c69 7c08                           jl         0x7f1e7fe847f3
01c6b 400f95c5                       setne      bpl
01c6f 400fb6ed                       movzx      ebp, bpl
01c73 be45ffffff                     mov        esi, 0xffffff45
01c78 48ff742408                     push       qword ptr [rsp + 8]
01c7d 488f8424f0000000               pop        qword ptr [rsp + 0xf0]
01c85 48ff742420                     push       qword ptr [rsp + 0x20]
01c8a 488f442408                     pop        qword ptr [rsp + 8]
01c8f 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01c94 44894c2404                     mov        dword ptr [rsp + 4], r9d
01c99 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01c9e 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01ca3 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01ca8 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01cad 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01cb2 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01cb7 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01cbc 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01cc1 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01cc6 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01ccb 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01cd0 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01cd5 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01cda 6690                           nop        
01cdc c5f877                         vzeroupper 
01cdf e8fc34b5ff                     call       0x7f1e7f9d7d60
01ce4 0f1f8400dc1d0016               nop        dword ptr [rax + rax + 0x16001ddc]
01cec 448bc3                         mov        r8d, ebx
01cef 458d141e                       lea        r10d, [r14 + rbx]
01cf3 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
01cf7 4e8b54110c                     mov        r10, qword ptr [rcx + r10 + 0xc]
01cfc 4e8954010c                     mov        qword ptr [rcx + r8 + 0xc], r10
01d01 448d5308                       lea        r10d, [rbx + 8]
01d05 418bda                         mov        ebx, r10d
01d08 453bd1                         cmp        r10d, r9d
01d0b 7cdf                           jl         0x7f1e7fe8486c
01d0d 453bd3                         cmp        r10d, r11d
01d10 0f8d84000000                   jge        0x7f1e7fe8491a
01d16 458bc2                         mov        r8d, r10d
01d19 418bd8                         mov        ebx, r8d
01d1c 0f1f4000                       nop        dword ptr [rax]
01d20 448bc3                         mov        r8d, ebx
01d23 4963f8                         movsxd     rdi, r8d
01d26 448bd3                         mov        r10d, ebx
01d29 458d0c1e                       lea        r9d, [r14 + rbx]
01d2d 418bc9                         mov        ecx, r9d
01d30 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01d35 4f8b44080c                     mov        r8, qword ptr [r8 + r9 + 0xc]
01d3a 8b542470                       mov        edx, dword ptr [rsp + 0x70]
01d3e 4e8944120c                     mov        qword ptr [rdx + r10 + 0xc], r8
01d43 4c63c1                         movsxd     r8, ecx
01d46 4e8b540214                     mov        r10, qword ptr [rdx + r8 + 0x14]
01d4b 4c89543a14                     mov        qword ptr [rdx + rdi + 0x14], r10
01d50 4e8b54021c                     mov        r10, qword ptr [rdx + r8 + 0x1c]
01d55 8bca                           mov        ecx, edx
01d57 4c8954391c                     mov        qword ptr [rcx + rdi + 0x1c], r10
01d5c 4e8b540124                     mov        r10, qword ptr [rcx + r8 + 0x24]
01d61 4c89543924                     mov        qword ptr [rcx + rdi + 0x24], r10
01d66 4e8b54012c                     mov        r10, qword ptr [rcx + r8 + 0x2c]
01d6b 4c8954392c                     mov        qword ptr [rcx + rdi + 0x2c], r10
01d70 4e8b540134                     mov        r10, qword ptr [rcx + r8 + 0x34]
01d75 4c89543934                     mov        qword ptr [rcx + rdi + 0x34], r10
01d7a 4e8b54013c                     mov        r10, qword ptr [rcx + r8 + 0x3c]
01d7f 4c8954393c                     mov        qword ptr [rcx + rdi + 0x3c], r10
01d84 4e8b540144                     mov        r10, qword ptr [rcx + r8 + 0x44]
01d89 4c89543944                     mov        qword ptr [rcx + rdi + 0x44], r10
01d8e 448d5340                       lea        r10d, [rbx + 0x40]
01d92 418bda                         mov        ebx, r10d
01d95 453bd3                         cmp        r10d, r11d
01d98 7c86                           jl         0x7f1e7fe848a0
01d9a 3b9c24a8000000                 cmp        ebx, dword ptr [rsp + 0xa8]
01da1 0f8de4f5ffff                   jge        0x7f1e7fe83f0b
01da7 448bdb                         mov        r11d, ebx
01daa 458bd3                         mov        r10d, r11d
01dad 666690                         nop        
01db0 478d0416                       lea        r8d, [r14 + r10]
01db4 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01db9 4f8b5c030c                     mov        r11, qword ptr [r11 + r8 + 0xc]
01dbe 458bca                         mov        r9d, r10d
01dc1 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
01dc5 4e895c090c                     mov        qword ptr [rcx + r9 + 0xc], r11
01dca 4183c208                       add        r10d, 8
01dce 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
01dd6 7cd8                           jl         0x7f1e7fe84930
01dd8 e9aef5ffff                     jmp        0x7f1e7fe83f0b
01ddd bee4ffffff                     mov        esi, 0xffffffe4
01de2 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01de7 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01dec 4c899c24f0000000               mov        qword ptr [rsp + 0xf0], r11
01df4 448b1c24                       mov        r11d, dword ptr [rsp]
01df8 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
01e00 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01e05 4c891c24                       mov        qword ptr [rsp], r11
01e09 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01e0e 4c895c2408                     mov        qword ptr [rsp + 8], r11
01e13 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01e18 44898424fc000000               mov        dword ptr [rsp + 0xfc], r8d
01e20 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01e25 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01e2a 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01e2f 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01e34 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01e39 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01e3e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01e43 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01e48 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01e4d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01e52 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01e57 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01e5c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e61 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01e66 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01e6b 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01e70 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01e75 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01e7a 4489742450                     mov        dword ptr [rsp + 0x50], r14d
01e7f 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01e83 90                             nop        
01e84 c5f877                         vzeroupper 
01e87 e85433b5ff                     call       0x7f1e7f9d7d60
01e8c 0f1f8400841f0017               nop        dword ptr [rax + rax + 0x17001f84]
01e94 85c9                           test       ecx, ecx
01e96 0f84180d0000                   je         0x7f1e7fe85734
01e9c 448b0424                       mov        r8d, dword ptr [rsp]
01ea0 458bda                         mov        r11d, r10d
01ea3 4533d2                         xor        r10d, r10d
01ea6 e916f1ffff                     jmp        0x7f1e7fe83b41
01eab be6effffff                     mov        esi, 0xffffff6e
01eb0 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01eb5 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01eba 4c899c24f0000000               mov        qword ptr [rsp + 0xf0], r11
01ec2 448b0424                       mov        r8d, dword ptr [rsp]
01ec6 44898424f8000000               mov        dword ptr [rsp + 0xf8], r8d
01ece 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01ed3 4c891c24                       mov        qword ptr [rsp], r11
01ed7 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01edc 4c895c2408                     mov        qword ptr [rsp + 8], r11
01ee1 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01ee6 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
01eee 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01ef3 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01ef8 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01efd 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01f02 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01f07 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01f0c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01f11 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01f16 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01f1b 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01f20 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01f25 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01f2a 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01f2f 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01f34 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01f39 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01f3e 4489742450                     mov        dword ptr [rsp + 0x50], r14d
01f43 894c2460                       mov        dword ptr [rsp + 0x60], ecx
01f47 895c2468                       mov        dword ptr [rsp + 0x68], ebx
01f4b 90                             nop        
01f4c c5f877                         vzeroupper 
01f4f e88c32b5ff                     call       0x7f1e7f9d7d60
01f54 0f1f84004c200018               nop        dword ptr [rax + rax + 0x1800204c]
01f5c be45ffffff                     mov        esi, 0xffffff45
01f61 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01f66 448b1c24                       mov        r11d, dword ptr [rsp]
01f6a 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
01f72 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01f77 4c891c24                       mov        qword ptr [rsp], r11
01f7b 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01f80 4c895c2408                     mov        qword ptr [rsp + 8], r11
01f85 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01f8a 44898424fc000000               mov        dword ptr [rsp + 0xfc], r8d
01f92 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01f97 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01f9c 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01fa1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01fa6 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01fab 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01fb0 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01fb5 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01fba 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01fbf 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01fc4 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01fc9 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01fce 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01fd3 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01fd8 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01fdd 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01fe2 4489742450                     mov        dword ptr [rsp + 0x50], r14d
01fe7 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01feb 90                             nop        
01fec c5f877                         vzeroupper 
01fef e8ec31b5ff                     call       0x7f1e7f9d7d60
01ff4 0f1f8400ec200019               nop        dword ptr [rax + rax + 0x190020ec]
01ffc be3dffffff                     mov        esi, 0xffffff3d
02001 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02006 448b1c24                       mov        r11d, dword ptr [rsp]
0200a 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02012 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02017 4c891c24                       mov        qword ptr [rsp], r11
0201b 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02020 4c895c2408                     mov        qword ptr [rsp + 8], r11
02025 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0202a 44898424fc000000               mov        dword ptr [rsp + 0xfc], r8d
02032 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02037 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0203c 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02041 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02046 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0204b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02050 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02055 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0205a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0205f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02064 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02069 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0206e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02073 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02078 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0207d 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
02082 4489742450                     mov        dword ptr [rsp + 0x50], r14d
02087 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0208b 90                             nop        
0208c c5f877                         vzeroupper 
0208f e84c31b5ff                     call       0x7f1e7f9d7d60
02094 0f1f84008c21001a               nop        dword ptr [rax + rax + 0x1a00218c]
0209c bee4ffffff                     mov        esi, 0xffffffe4
020a1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
020a6 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
020ab 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
020b3 448b1c24                       mov        r11d, dword ptr [rsp]
020b7 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
020bf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
020c4 4c891424                       mov        qword ptr [rsp], r10
020c8 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
020cd 4c89542408                     mov        qword ptr [rsp + 8], r10
020d2 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
020d7 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
020df 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
020e4 4c89542410                     mov        qword ptr [rsp + 0x10], r10
020e9 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
020ee 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
020f3 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
020f8 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
020fd 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02102 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02107 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0210c 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02111 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02116 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0211b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02120 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02125 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0212a 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0212f 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02134 c5f877                         vzeroupper 
02137 e8a430b5ff                     call       0x7f1e7f9d7d60
0213c 0f1f84003422001b               nop        dword ptr [rax + rax + 0x1b002234]
02144 bee4ffffff                     mov        esi, 0xffffffe4
02149 48ff742408                     push       qword ptr [rsp + 8]
0214e 488f8424f0000000               pop        qword ptr [rsp + 0xf0]
02156 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0215b 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02163 48ff742420                     push       qword ptr [rsp + 0x20]
02168 488f442408                     pop        qword ptr [rsp + 8]
0216d 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02172 4489542404                     mov        dword ptr [rsp + 4], r10d
02177 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0217c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02181 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02186 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0218b 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02190 4489542428                     mov        dword ptr [rsp + 0x28], r10d
02195 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0219a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0219f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
021a4 4c89542440                     mov        qword ptr [rsp + 0x40], r10
021a9 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
021ae 4489542448                     mov        dword ptr [rsp + 0x48], r10d
021b3 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
021b8 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
021bd 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
021c2 6690                           nop        
021c4 c5f877                         vzeroupper 
021c7 e81430b5ff                     call       0x7f1e7f9d7d60
021cc 0f1f8400c422001c               nop        dword ptr [rax + rax + 0x1c0022c4]
021d4 418d6d01                       lea        ebp, [r13 + 1]
021d8 bee4ffffff                     mov        esi, 0xffffffe4
021dd 48ff742408                     push       qword ptr [rsp + 8]
021e2 488f8424f0000000               pop        qword ptr [rsp + 0xf0]
021ea 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
021ef 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
021f7 48ff742420                     push       qword ptr [rsp + 0x20]
021fc 488f442408                     pop        qword ptr [rsp + 8]
02201 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02206 4489542404                     mov        dword ptr [rsp + 4], r10d
0220b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02210 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02215 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0221a 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0221f 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02224 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
02229 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0222e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02233 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02238 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0223d 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02242 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02247 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0224c 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02251 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
02256 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
0225b 90                             nop        
0225c c5f877                         vzeroupper 
0225f e87c2fb5ff                     call       0x7f1e7f9d7d60
02264 0f1f84005c23001d               nop        dword ptr [rax + rax + 0x1d00235c]
0226c bee4ffffff                     mov        esi, 0xffffffe4
02271 48ff742408                     push       qword ptr [rsp + 8]
02276 488f8424f0000000               pop        qword ptr [rsp + 0xf0]
0227e 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02283 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0228b 48ff742420                     push       qword ptr [rsp + 0x20]
02290 488f442408                     pop        qword ptr [rsp + 8]
02295 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0229a 44895c2404                     mov        dword ptr [rsp + 4], r11d
0229f 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
022a4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
022a9 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
022ae 4489542420                     mov        dword ptr [rsp + 0x20], r10d
022b3 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
022b8 4489542428                     mov        dword ptr [rsp + 0x28], r10d
022bd 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
022c2 4c89542438                     mov        qword ptr [rsp + 0x38], r10
022c7 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
022cc 4c89542440                     mov        qword ptr [rsp + 0x40], r10
022d1 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
022d6 4489542448                     mov        dword ptr [rsp + 0x48], r10d
022db 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
022e0 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
022e5 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
022ea 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
022ef 90                             nop        
022f0 c5f877                         vzeroupper 
022f3 e8e82eb5ff                     call       0x7f1e7f9d7d60
022f8 0f1f8400f023001e               nop        dword ptr [rax + rax + 0x1e0023f0]
02300 bee4ffffff                     mov        esi, 0xffffffe4
02305 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0230a 448b1424                       mov        r10d, dword ptr [rsp]
0230e 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02316 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0231b 4c891424                       mov        qword ptr [rsp], r10
0231f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02324 4c89542408                     mov        qword ptr [rsp + 8], r10
02329 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0232e 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02336 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0233b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02340 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02345 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0234a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0234f 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02354 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02359 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0235e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02363 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02368 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0236d 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02372 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
02377 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
0237c c5f877                         vzeroupper 
0237f e85c2eb5ff                     call       0x7f1e7f9d7d60
02384 0f1f84007c24001f               nop        dword ptr [rax + rax + 0x1f00247c]
0238c beccffffff                     mov        esi, 0xffffffcc
02391 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02396 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0239b 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
023a3 448b1424                       mov        r10d, dword ptr [rsp]
023a7 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
023af 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
023b4 4c891424                       mov        qword ptr [rsp], r10
023b8 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
023bd 4c89542408                     mov        qword ptr [rsp + 8], r10
023c2 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
023c7 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
023cf 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
023d4 4c89542410                     mov        qword ptr [rsp + 0x10], r10
023d9 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
023de 4489542418                     mov        dword ptr [rsp + 0x18], r10d
023e3 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
023e8 4489542420                     mov        dword ptr [rsp + 0x20], r10d
023ed 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
023f2 4c89542428                     mov        qword ptr [rsp + 0x28], r10
023f7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
023fc 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02401 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02406 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0240b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02410 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02415 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0241a 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0241f 44896c2460                     mov        dword ptr [rsp + 0x60], r13d
02424 c5f877                         vzeroupper 
02427 e8b42db5ff                     call       0x7f1e7f9d7d60
0242c 0f1f840024250020               nop        dword ptr [rax + rax + 0x20002524]
02434 be45ffffff                     mov        esi, 0xffffff45
02439 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0243e 448b1424                       mov        r10d, dword ptr [rsp]
02442 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
0244a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0244f 4c891424                       mov        qword ptr [rsp], r10
02453 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02458 4c89542408                     mov        qword ptr [rsp + 8], r10
0245d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02462 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
0246a 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0246f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02474 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02479 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0247e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02483 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02488 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0248d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02492 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02497 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0249c 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
024a1 666690                         nop        
024a4 c5f877                         vzeroupper 
024a7 e8342db5ff                     call       0x7f1e7f9d7d60
024ac 0f1f8400a4250021               nop        dword ptr [rax + rax + 0x210025a4]
024b4 be17000000                     mov        esi, 0x17
024b9 666690                         nop        
024bc c5f877                         vzeroupper 
024bf e81c2db5ff                     call       0x7f1e7f9d7d60
024c4 0f1f8400bc250022               nop        dword ptr [rax + rax + 0x220025bc]
024cc be6effffff                     mov        esi, 0xffffff6e
024d1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
024d6 4c89b424f0000000               mov        qword ptr [rsp + 0xf0], r14
024de 4c895c2408                     mov        qword ptr [rsp + 8], r11
024e3 894c2418                       mov        dword ptr [rsp + 0x18], ecx
024e7 48894424f8                     mov        qword ptr [rsp - 8], rax
024ec 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
024f0 89442420                       mov        dword ptr [rsp + 0x20], eax
024f4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024f9 48ff742430                     push       qword ptr [rsp + 0x30]
024fe 488f442428                     pop        qword ptr [rsp + 0x28]
02503 895c2424                       mov        dword ptr [rsp + 0x24], ebx
02507 4c89442430                     mov        qword ptr [rsp + 0x30], r8
0250c 48ff742448                     push       qword ptr [rsp + 0x48]
02511 488f442438                     pop        qword ptr [rsp + 0x38]
02516 897c2440                       mov        dword ptr [rsp + 0x40], edi
0251a 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
0251f 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02524 c5f877                         vzeroupper 
02527 e8b42cb5ff                     call       0x7f1e7f9d7d60
0252c 0f1f840024260023               nop        dword ptr [rax + rax + 0x23002624]
02534 bebeffffff                     mov        esi, 0xffffffbe
02539 48ff742408                     push       qword ptr [rsp + 8]
0253e 488f8424f0000000               pop        qword ptr [rsp + 0xf0]
02546 4c89b424f8000000               mov        qword ptr [rsp + 0xf8], r14
0254e 4c895c2408                     mov        qword ptr [rsp + 8], r11
02553 894c2418                       mov        dword ptr [rsp + 0x18], ecx
02557 48894424f8                     mov        qword ptr [rsp - 8], rax
0255c 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02560 89442420                       mov        dword ptr [rsp + 0x20], eax
02564 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02569 48ff742430                     push       qword ptr [rsp + 0x30]
0256e 488f442428                     pop        qword ptr [rsp + 0x28]
02573 895c2424                       mov        dword ptr [rsp + 0x24], ebx
02577 4c89442430                     mov        qword ptr [rsp + 0x30], r8
0257c 48ff742448                     push       qword ptr [rsp + 0x48]
02581 488f442438                     pop        qword ptr [rsp + 0x38]
02586 897c2440                       mov        dword ptr [rsp + 0x40], edi
0258a 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
0258f 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02594 c5f877                         vzeroupper 
02597 e8442cb5ff                     call       0x7f1e7f9d7d60
0259c 0f1f840094260024               nop        dword ptr [rax + rax + 0x24002694]
025a4 4c8b742468                     mov        r14, qword ptr [rsp + 0x68]
025a9 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
025ad beccffffff                     mov        esi, 0xffffffcc
025b2 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
025b7 4c89b424f8000000               mov        qword ptr [rsp + 0xf8], r14
025bf 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
025c7 890c24                         mov        dword ptr [rsp], ecx
025ca 44895c2404                     mov        dword ptr [rsp + 4], r11d
025cf 448944240c                     mov        dword ptr [rsp + 0xc], r8d
025d4 c5f877                         vzeroupper 
025d7 e8042cb5ff                     call       0x7f1e7f9d7d60
025dc 0f1f8400d4260025               nop        dword ptr [rax + rax + 0x250026d4]
025e4 bee4ffffff                     mov        esi, 0xffffffe4
025e9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
025ee 448b0424                       mov        r8d, dword ptr [rsp]
025f2 44898424f8000000               mov        dword ptr [rsp + 0xf8], r8d
025fa 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
025ff 4c891c24                       mov        qword ptr [rsp], r11
02603 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02608 4c895c2408                     mov        qword ptr [rsp + 8], r11
0260d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02612 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
0261a 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
0261f 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02624 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
02629 4489442418                     mov        dword ptr [rsp + 0x18], r8d
0262e 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02633 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02638 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0263d 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
02642 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
02647 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
0264c 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
02651 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
02656 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0265b 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02660 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
02665 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0266a 448974244c                     mov        dword ptr [rsp + 0x4c], r14d
0266f 895c2458                       mov        dword ptr [rsp + 0x58], ebx
02673 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02678 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0267d 666690                         nop        
02680 c5f877                         vzeroupper 
02683 e8582bb5ff                     call       0x7f1e7f9d7d60
02688 0f1f840080270026               nop        dword ptr [rax + rax + 0x26002780]
02690 bee4ffffff                     mov        esi, 0xffffffe4
02695 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0269a 4c899c24f0000000               mov        qword ptr [rsp + 0xf0], r11
026a2 448b1c24                       mov        r11d, dword ptr [rsp]
026a6 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
026ae 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
026b3 4c891c24                       mov        qword ptr [rsp], r11
026b7 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
026bc 4c895c2408                     mov        qword ptr [rsp + 8], r11
026c1 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
026c6 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
026ce 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
026d3 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
026d8 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
026dd 4489442418                     mov        dword ptr [rsp + 0x18], r8d
026e2 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
026e7 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
026ec 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
026f1 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
026f6 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
026fb 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
02700 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
02705 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
0270a 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0270f 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02714 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
02719 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0271e 448974244c                     mov        dword ptr [rsp + 0x4c], r14d
02723 895c2458                       mov        dword ptr [rsp + 0x58], ebx
02727 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0272c c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
02732 6690                           nop        
02734 c5f877                         vzeroupper 
02737 e8a42ab5ff                     call       0x7f1e7f9d7d60
0273c 0f1f840034280027               nop        dword ptr [rax + rax + 0x27002834]
02744 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
0274c beccffffff                     mov        esi, 0xffffffcc
02751 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02756 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
0275b 4c898424f0000000               mov        qword ptr [rsp + 0xf0], r8
02763 448b0c24                       mov        r9d, dword ptr [rsp]
02767 44898c24f8000000               mov        dword ptr [rsp + 0xf8], r9d
0276f 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
02774 4c890424                       mov        qword ptr [rsp], r8
02778 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
0277d 4c89442408                     mov        qword ptr [rsp + 8], r8
02782 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
02787 44898c24fc000000               mov        dword ptr [rsp + 0xfc], r9d
0278f 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
02794 4c89442410                     mov        qword ptr [rsp + 0x10], r8
02799 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0279e 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
027a3 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
027a8 4489442424                     mov        dword ptr [rsp + 0x24], r8d
027ad 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
027b2 4c89442428                     mov        qword ptr [rsp + 0x28], r8
027b7 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
027bc 4c89442438                     mov        qword ptr [rsp + 0x38], r8
027c1 4c8b442448                     mov        r8, qword ptr [rsp + 0x48]
027c6 4c89442440                     mov        qword ptr [rsp + 0x40], r8
027cb 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
027d0 4489442434                     mov        dword ptr [rsp + 0x34], r8d
027d5 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
027da 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
027df 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
027e4 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
027e9 4489742470                     mov        dword ptr [rsp + 0x70], r14d
027ee 6690                           nop        
027f0 c5f877                         vzeroupper 
027f3 e8e829b5ff                     call       0x7f1e7f9d7d60
027f8 0f1f8400f0280028               nop        dword ptr [rax + rax + 0x280028f0]
02800 418bea                         mov        ebp, r10d
02803 83c510                         add        ebp, 0x10
02806 be6effffff                     mov        esi, 0xffffff6e
0280b 48ff742408                     push       qword ptr [rsp + 8]
02810 488f8424f0000000               pop        qword ptr [rsp + 0xf0]
02818 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
0281d 4c899c24f8000000               mov        qword ptr [rsp + 0xf8], r11
02825 48ff742420                     push       qword ptr [rsp + 0x20]
0282a 488f442408                     pop        qword ptr [rsp + 8]
0282f 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
02834 4489442404                     mov        dword ptr [rsp + 4], r8d
02839 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
0283e 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02843 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02848 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0284d 4489542428                     mov        dword ptr [rsp + 0x28], r10d
02852 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02857 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0285c 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02861 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02866 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0286b 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02870 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02875 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0287a 4489742454                     mov        dword ptr [rsp + 0x54], r14d
0287f 895c2464                       mov        dword ptr [rsp + 0x64], ebx
02883 448bd8                         mov        r11d, eax
02886 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
0288b 90                             nop        
0288c c5f877                         vzeroupper 
0288f e84c29b5ff                     call       0x7f1e7f9d7d60
02894 0f1f84008c290029               nop        dword ptr [rax + rax + 0x2900298c]
0289c 418bea                         mov        ebp, r10d
0289f 83c510                         add        ebp, 0x10
028a2 be66ffffff                     mov        esi, 0xffffff66
028a7 48ff742408                     push       qword ptr [rsp + 8]
028ac 488f8424f0000000               pop        qword ptr [rsp + 0xf0]
028b4 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
028b9 4c899c24f8000000               mov        qword ptr [rsp + 0xf8], r11
028c1 48ff742420                     push       qword ptr [rsp + 0x20]
028c6 488f442408                     pop        qword ptr [rsp + 8]
028cb 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
028d0 44895c2404                     mov        dword ptr [rsp + 4], r11d
028d5 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
028da 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
028df 4489542424                     mov        dword ptr [rsp + 0x24], r10d
028e4 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
028e9 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
028ee 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
028f3 4c89542438                     mov        qword ptr [rsp + 0x38], r10
028f8 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
028fd 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02902 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02907 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0290c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02911 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02916 4489742454                     mov        dword ptr [rsp + 0x54], r14d
0291b 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0291f 448bd8                         mov        r11d, eax
02922 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
02927 90                             nop        
02928 c5f877                         vzeroupper 
0292b e8b028b5ff                     call       0x7f1e7f9d7d60
02930 0f1f8400282a002a               nop        dword ptr [rax + rax + 0x2a002a28]
02938 bee4ffffff                     mov        esi, 0xffffffe4
0293d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02942 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02947 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
0294f 448b1424                       mov        r10d, dword ptr [rsp]
02953 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
0295b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02960 4c891424                       mov        qword ptr [rsp], r10
02964 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02969 4c89542408                     mov        qword ptr [rsp + 8], r10
0296e 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02973 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
0297b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02980 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02985 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0298a 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0298f 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02994 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02999 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0299e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
029a3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
029a8 4c89542430                     mov        qword ptr [rsp + 0x30], r10
029ad 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
029b2 4c89542438                     mov        qword ptr [rsp + 0x38], r10
029b7 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
029bc 4489542440                     mov        dword ptr [rsp + 0x40], r10d
029c1 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
029c6 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
029cb 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
029d0 c5f877                         vzeroupper 
029d3 e80828b5ff                     call       0x7f1e7f9d7d60
029d8 0f1f8400d02a002b               nop        dword ptr [rax + rax + 0x2b002ad0]
029e0 bee4ffffff                     mov        esi, 0xffffffe4
029e5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
029ea 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
029ef 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
029f7 448b1c24                       mov        r11d, dword ptr [rsp]
029fb 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02a03 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02a08 4c891424                       mov        qword ptr [rsp], r10
02a0c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02a11 4c89542408                     mov        qword ptr [rsp + 8], r10
02a16 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02a1b 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02a23 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02a28 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02a2d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02a32 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02a37 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02a3c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02a41 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02a46 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02a4b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02a50 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02a55 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02a5a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02a5f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02a64 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02a69 894c2460                       mov        dword ptr [rsp + 0x60], ecx
02a6d 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
02a72 6690                           nop        
02a74 c5f877                         vzeroupper 
02a77 e86427b5ff                     call       0x7f1e7f9d7d60
02a7c 0f1f8400742b002c               nop        dword ptr [rax + rax + 0x2c002b74]
02a84 448bd9                         mov        r11d, ecx
02a87 4183c308                       add        r11d, 8
02a8b 458bcb                         mov        r9d, r11d
02a8e be6effffff                     mov        esi, 0xffffff6e
02a93 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02a98 448b1c24                       mov        r11d, dword ptr [rsp]
02a9c 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02aa4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02aa9 4c891424                       mov        qword ptr [rsp], r10
02aad 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02ab2 4c89542408                     mov        qword ptr [rsp + 8], r10
02ab7 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02abc 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02ac4 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02ac9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02ace 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02ad3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02ad8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02add 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02ae2 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02ae7 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02aec 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02af1 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02af6 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
02afe 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02b03 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
02b08 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
02b0c c5f877                         vzeroupper 
02b0f e8cc26b5ff                     call       0x7f1e7f9d7d60
02b14 0f1f84000c2c002d               nop        dword ptr [rax + rax + 0x2d002c0c]
02b1c 448bd1                         mov        r10d, ecx
02b1f 4183c208                       add        r10d, 8
02b23 458bca                         mov        r9d, r10d
02b26 be66ffffff                     mov        esi, 0xffffff66
02b2b 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02b30 448b1c24                       mov        r11d, dword ptr [rsp]
02b34 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02b3c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02b41 4c891424                       mov        qword ptr [rsp], r10
02b45 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02b4a 4c89542408                     mov        qword ptr [rsp + 8], r10
02b4f 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02b54 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02b5c 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02b61 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02b66 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02b6b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02b70 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02b75 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02b7a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02b7f 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02b84 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02b89 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02b8e 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
02b96 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02b9b 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
02ba0 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
02ba4 c5f877                         vzeroupper 
02ba7 e83426b5ff                     call       0x7f1e7f9d7d60
02bac 0f1f8400a42c002e               nop        dword ptr [rax + rax + 0x2e002ca4]
02bb4 bef6ffffff                     mov        esi, 0xfffffff6
02bb9 488bea                         mov        rbp, rdx
02bbc 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02bc4 c5f877                         vzeroupper 
02bc7 e81426b5ff                     call       0x7f1e7f9d7d60
02bcc 0f1f8400c42c002f               nop        dword ptr [rax + rax + 0x2f002cc4]
02bd4 488bf0                         mov        rsi, rax
02bd7 eb0d                           jmp        0x7f1e7fe85766
02bd9 488bf0                         mov        rsi, rax
02bdc eb08                           jmp        0x7f1e7fe85766
02bde 488bf0                         mov        rsi, rax
02be1 eb03                           jmp        0x7f1e7fe85766
02be3 488bf0                         mov        rsi, rax
02be6 c5f877                         vzeroupper 
02be9 4881c4e0000000                 add        rsp, 0xe0
02bf0 5d                             pop        rbp
02bf1 e9ea51b5ff                     jmp        0x7f1e7f9da960
02bf6 bef6ffffff                     mov        esi, 0xfffffff6
02bfb 90                             nop        
02bfc c5f877                         vzeroupper 
02bff e8dc25b5ff                     call       0x7f1e7f9d7d60
02c04 0f1f8400fc2c0030               nop        dword ptr [rax + rax + 0x30002cfc]
02c0c 49bab83be87f1e7f0000           movabs     r10, 0x7f1e7fe83bb8
02c16 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02c1d e93ed7a8ff                     jmp        0x7f1e7f912ee0
02c22 e8f9a2a7ff                     call       0x7f1e7f8ffaa0
02c27 e912d4ffff                     jmp        0x7f1e7fe82bbe
02c2c f4                             hlt        
02c2d f4                             hlt        
02c2e f4                             hlt        
02c2f f4                             hlt        
