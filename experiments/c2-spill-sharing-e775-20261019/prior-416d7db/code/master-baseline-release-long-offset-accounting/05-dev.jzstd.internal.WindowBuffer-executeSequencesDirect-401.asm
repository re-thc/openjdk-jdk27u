00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c09ea9ff                   jne        0x7f959b8fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecb0000000                 sub        rsp, 0xb0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f852b0f0000                   jne        0x7f959be619e9
0003e 8bc7                           mov        eax, edi
00040 4c894c2420                     mov        qword ptr [rsp + 0x20], r9
00045 498bd8                         mov        rbx, r8
00048 894c240c                       mov        dword ptr [rsp + 0xc], ecx
0004c 4c8bf6                         mov        r14, rsi
0004f 448b5638                       mov        r10d, dword ptr [rsi + 0x38]
00053 448b4604                       mov        r8d, dword ptr [rsi + 4]
00057 418bc8                         mov        ecx, r8d
0005a 412bca                         sub        ecx, r10d
0005d 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00065 443bc9                         cmp        r9d, ecx
00068 0f8f2a0a0000                   jg         0x7f959be61518
0006e 4c8b5e08                       mov        r11, qword ptr [rsi + 8]
00072 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00077 4c8b5e20                       mov        r11, qword ptr [rsi + 0x20]
0007b 4c638c24c0000000               movsxd     r9, dword ptr [rsp + 0xc0]
00083 4963fa                         movsxd     rdi, r10d
00086 48037c2440                     add        rdi, qword ptr [rsp + 0x40]
0008b 4c2bdf                         sub        r11, rdi
0008e 4d3bcb                         cmp        r9, r11
00091 0f8f250a0000                   jg         0x7f959be6153c
00097 4c8b5e10                       mov        r11, qword ptr [rsi + 0x10]
0009b 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
000a0 4c8b5e28                       mov        r11, qword ptr [rsi + 0x28]
000a4 8b4e40                         mov        ecx, dword ptr [rsi + 0x40]
000a7 4d85db                         test       r11, r11
000aa 0f8548070000                   jne        0x7f959be61278
000b0 4903f9                         add        rdi, r9
000b3 483b7c2448                     cmp        rdi, qword ptr [rsp + 0x48]
000b8 0f8f260a0000                   jg         0x7f959be61564
000be 488bfa                         mov        rdi, rdx
000c1 8b7204                         mov        esi, dword ptr [rdx + 4]
000c4 4533c9                         xor        r9d, r9d
000c7 448bd8                         mov        r11d, eax
000ca 4585db                         test       r11d, r11d
000cd 0f8ee5020000                   jle        0x7f959be60e38
000d3 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
000d8 448d6ee0                       lea        r13d, [rsi - 0x20]
000dc 4489442438                     mov        dword ptr [rsp + 0x38], r8d
000e1 4183c0e0                       add        r8d, -0x20
000e5 4c8b4c2440                     mov        r9, qword ptr [rsp + 0x40]
000ea 49f7d9                         neg        r9
000ed 448b5304                       mov        r10d, dword ptr [rbx + 4]
000f1 4585d2                         test       r10d, r10d
000f4 0f867e060000                   jbe        0x7f959be611f8
000fa 4963d3                         movsxd     rdx, r11d
000fd 4d63d2                         movsxd     r10, r10d
00100 48ffca                         dec        rdx
00103 493bd2                         cmp        rdx, r10
00106 0f836c060000                   jae        0x7f959be611f8
0010c 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00114 8b5504                         mov        edx, dword ptr [rbp + 4]
00117 85d2                           test       edx, edx
00119 0f8641070000                   jbe        0x7f959be612e0
0011f 448d56f1                       lea        r10d, [rsi - 0xf]
00123 4585d2                         test       r10d, r10d
00126 0f8c34070000                   jl         0x7f959be612e0
0012c 8b4104                         mov        eax, dword ptr [rcx + 4]
0012f 448d50f1                       lea        r10d, [rax - 0xf]
00133 4585d2                         test       r10d, r10d
00136 0f8c24070000                   jl         0x7f959be612e0
0013c 89542418                       mov        dword ptr [rsp + 0x18], edx
00140 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00145 4489442468                     mov        dword ptr [rsp + 0x68], r8d
0014a 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
0014f 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
00157 488f442458                     pop        qword ptr [rsp + 0x58]
0015c 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00161 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
00166 48897c2450                     mov        qword ptr [rsp + 0x50], rdi
0016b 4c89b424c8000000               mov        qword ptr [rsp + 0xc8], r14
00173 89b424c4000000                 mov        dword ptr [rsp + 0xc4], esi
0017a 4c8bd1                         mov        r10, rcx
0017d 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00182 894c2460                       mov        dword ptr [rsp + 0x60], ecx
00186 83c6f1                         add        esi, -0xf
00189 8974246c                       mov        dword ptr [rsp + 0x6c], esi
0018d 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00191 83c0f1                         add        eax, -0xf
00194 89442478                       mov        dword ptr [rsp + 0x78], eax
00198 4533c9                         xor        r9d, r9d
0019b 4533c0                         xor        r8d, r8d
0019e 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
001a3 4f8b5cc208                     mov        r11, qword ptr [r10 + r8*8 + 8]
001a8 4d8bd3                         mov        r10, r11
001ab 49c1ea12                       shr        r10, 0x12
001af 458bd2                         mov        r10d, r10d
001b2 4181e2ffff0300                 and        r10d, 0x3ffff
001b9 418bc2                         mov        eax, r10d
001bc 498bcb                         mov        rcx, r11
001bf 48c1f924                       sar        rcx, 0x24
001c3 458bd3                         mov        r10d, r11d
001c6 8bd9                           mov        ebx, ecx
001c8 4181e2ffff0100                 and        r10d, 0x1ffff
001cf 85db                           test       ebx, ebx
001d1 0f8c69090000                   jl         0x7f959be615c0
001d7 4585d2                         test       r10d, r10d
001da 0f84f4020000                   je         0x7f959be60f54
001e0 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
001e4 412be9                         sub        ebp, r9d
001e7 443bd5                         cmp        r10d, ebp
001ea 0f8f700a0000                   jg         0x7f959be616e0
001f0 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
001f8 83fb03                         cmp        ebx, 3
001fb 0f8fe3020000                   jg         0x7f959be60f64
00201 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00209 4585d2                         test       r10d, r10d
0020c 0f846e0a0000                   je         0x7f959be61700
00212 83fb01                         cmp        ebx, 1
00215 0f8501070000                   jne        0x7f959be6139c
0021b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00220 458b5208                       mov        r10d, dword ptr [r10 + 8]
00224 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
0022c 4c639c2490000000               movsxd     r11, dword ptr [rsp + 0x90]
00234 4c6354243c                     movsxd     r10, dword ptr [rsp + 0x3c]
00239 4c03542440                     add        r10, qword ptr [rsp + 0x40]
0023e 4d03d3                         add        r10, r11
00241 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00249 4c63942494000000               movsxd     r10, dword ptr [rsp + 0x94]
00251 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
00259 0f8f75090000                   jg         0x7f959be61654
0025f 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00267 4585d2                         test       r10d, r10d
0026a 0f8e8e060000                   jle        0x7f959be6137e
00270 458bd1                         mov        r10d, r9d
00273 4403942490000000               add        r10d, dword ptr [rsp + 0x90]
0027b 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00280 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
00284 038c2490000000                 add        ecx, dword ptr [rsp + 0x90]
0028b 03c8                           add        ecx, eax
0028d 3b4c2468                       cmp        ecx, dword ptr [rsp + 0x68]
00291 0f8f8e020000                   jg         0x7f959be60fa5
00297 443b542464                     cmp        r10d, dword ptr [rsp + 0x64]
0029c 0f8f7a0a0000                   jg         0x7f959be6179c
002a2 8b8c2490000000                 mov        ecx, dword ptr [rsp + 0x90]
002a9 83f910                         cmp        ecx, 0x10
002ac 0f8fea0a0000                   jg         0x7f959be6181c
002b2 443b4c246c                     cmp        r9d, dword ptr [rsp + 0x6c]
002b7 0f8307030000                   jae        0x7f959be61044
002bd 418be9                         mov        ebp, r9d
002c0 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
002c5 c4c17a6f442a08                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 8]
002cc 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
002d1 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
002d6 0f8368030000                   jae        0x7f959be610c4
002dc 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
002e4 4403cd                         add        r9d, ebp
002e7 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
002ec 4103ca                         add        ecx, r10d
002ef 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
002f6 4963ca                         movsxd     rcx, r10d
002f9 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
002fe c4c17a7f440908                 vmovdqu    xmmword ptr [r9 + rcx + 8], xmm0
00305 8bac2480000000                 mov        ebp, dword ptr [rsp + 0x80]
0030c 2bac2494000000                 sub        ebp, dword ptr [rsp + 0x94]
00313 83f810                         cmp        eax, 0x10
00316 0f8e000b0000                   jle        0x7f959be6189c
0031c 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00324 443bd0                         cmp        r10d, eax
00327 0f8c8b060000                   jl         0x7f959be61438
0032d 83f830                         cmp        eax, 0x30
00330 0f8ef2060000                   jle        0x7f959be614a8
00336 85ed                           test       ebp, ebp
00338 0f8c98030000                   jl         0x7f959be61156
0033e 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
00346 4585c9                         test       r9d, r9d
00349 0f8c87030000                   jl         0x7f959be61156
0034f 448d1428                       lea        r10d, [rax + rbp]
00353 8b5c241c                       mov        ebx, dword ptr [rsp + 0x1c]
00357 413bda                         cmp        ebx, r10d
0035a 0f8276030000                   jb         0x7f959be61156
00360 428d1c08                       lea        ebx, [rax + r9]
00364 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
00368 448b4c241c                     mov        r9d, dword ptr [rsp + 0x1c]
0036d 443bcb                         cmp        r9d, ebx
00370 0f8260030000                   jb         0x7f959be61156
00376 85c0                           test       eax, eax
00378 0f844e030000                   je         0x7f959be6114c
0037e 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00383 498d7c2a08                     lea        rdi, [r10 + rbp + 8]
00388 4c03d9                         add        r11, rcx
0038b 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
00390 4863d0                         movsxd     rdx, eax
00393 4883fa20                       cmp        rdx, 0x20
00397 762e                           jbe        0x7f959be60e47
00399 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0039e c5f877                         vzeroupper 
003a1 49ba204f8e9b957f0000           movabs     r10, 0x7f959b8e4f20
003ab 41ffd2                         call       r10
003ae 0f1f840000000000               nop        dword ptr [rax + rax]
003b6 eb34                           jmp        0x7f959be60e6c
003b8 85c9                           test       ecx, ecx
003ba 0f8498030000                   je         0x7f959be611d8
003c0 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
003c5 eb73                           jmp        0x7f959be60eba
003c7 4c63d0                         movsxd     r10, eax
003ca 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
003d1 c442a8f5db                     bzhi       r11, r11, r10
003d6 c4c1fb92fb                     kmovq      k7, r11
003db 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
003e1 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
003e7 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
003ec 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
003f1 41ffc0                         inc        r8d
003f4 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
003f9 7d0a                           jge        0x7f959be60e85
003fb 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00400 e999fdffff                     jmp        0x7f959be60c1e
00405 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
0040a 442b44247c                     sub        r8d, dword ptr [rsp + 0x7c]
0040f 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00414 4585c9                         test       r9d, r9d
00417 0f8cc7040000                   jl         0x7f959be61364
0041d 4c8bb424c8000000               mov        r14, qword ptr [rsp + 0xc8]
00425 488b7c2450                     mov        rdi, qword ptr [rsp + 0x50]
0042a 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
0042e 8bb424c4000000                 mov        esi, dword ptr [rsp + 0xc4]
00435 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0043a 4585d2                         test       r10d, r10d
0043d 0f8c3a010000                   jl         0x7f959be60ffd
00443 3b74240c                       cmp        esi, dword ptr [rsp + 0xc]
00447 0f8235010000                   jb         0x7f959be61002
0044d 438d2c02                       lea        ebp, [r10 + r8]
00451 8b5904                         mov        ebx, dword ptr [rcx + 4]
00454 3bdd                           cmp        ebx, ebp
00456 0f822b010000                   jb         0x7f959be61007
0045c 4585c0                         test       r8d, r8d
0045f 0f8c27010000                   jl         0x7f959be6100c
00465 4585c0                         test       r8d, r8d
00468 7436                           je         0x7f959be60f20
0046a 4a8d7c0f08                     lea        rdi, [rdi + r9 + 8]
0046f 4c8bd9                         mov        r11, rcx
00472 4a8d741108                     lea        rsi, [rcx + r10 + 8]
00477 4963d0                         movsxd     rdx, r8d
0047a 4883fa20                       cmp        rdx, 0x20
0047e 773a                           ja         0x7f959be60f3a
00480 4d63d0                         movsxd     r10, r8d
00483 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0048a c442a8f5db                     bzhi       r11, r11, r10
0048f c4c1fb92fb                     kmovq      k7, r11
00494 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0049a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
004a0 41896e38                       mov        dword ptr [r14 + 0x38], ebp
004a4 c5f877                         vzeroupper 
004a7 4881c4b0000000                 add        rsp, 0xb0
004ae 5d                             pop        rbp
004af 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
004b3 0f879a0a0000                   ja         0x7f959be619d3
004b9 c3                             ret        
004ba c5f877                         vzeroupper 
004bd 49ba204f8e9b957f0000           movabs     r10, 0x7f959b8e4f20
004c7 41ffd2                         call       r10
004ca 0f1f840000000000               nop        dword ptr [rax + rax]
004d2 ebcc                           jmp        0x7f959be60f20
004d4 4533d2                         xor        r10d, r10d
004d7 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
004df e914fdffff                     jmp        0x7f959be60c78
004e4 83c3fd                         add        ebx, -3
004e7 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
004ec 4183fb02                       cmp        r11d, 2
004f0 0f8696090000                   jbe        0x7f959be6190c
004f6 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
004fb 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
004ff 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
00504 45895310                       mov        dword ptr [r11 + 0x10], r10d
00508 458b5b08                       mov        r11d, dword ptr [r11 + 8]
0050c 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00511 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
00515 41895a08                       mov        dword ptr [r10 + 8], ebx
00519 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
00520 e907fdffff                     jmp        0x7f959be60cac
00525 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0052a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0052f 498bea                         mov        rbp, r10
00532 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
0053a 488bf5                         mov        rsi, rbp
0053d 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
00541 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
00546 8bbc2490000000                 mov        edi, dword ptr [rsp + 0x90]
0054d 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00555 44891424                       mov        dword ptr [rsp], r10d
00559 89442408                       mov        dword ptr [rsp + 8], eax
0055d 8b54243c                       mov        edx, dword ptr [rsp + 0x3c]
00561 666690                         nop        
00564 c5f877                         vzeroupper 
00567 e874a8a9ff                     call       0x7f959b8fb860
0056c 0f1f840064060000               nop        dword ptr [rax + rax + 0x664]
00574 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00578 e96ffeffff                     jmp        0x7f959be60e6c
0057d 418bea                         mov        ebp, r10d
00580 eb0d                           jmp        0x7f959be6100f
00582 418bea                         mov        ebp, r10d
00585 eb08                           jmp        0x7f959be6100f
00587 418bea                         mov        ebp, r10d
0058a eb03                           jmp        0x7f959be6100f
0058c 418bea                         mov        ebp, r10d
0058f beccffffff                     mov        esi, 0xffffffcc
00594 4c89b424c0000000               mov        qword ptr [rsp + 0xc0], r14
0059c 48897c2410                     mov        qword ptr [rsp + 0x10], rdi
005a1 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
005a9 894c240c                       mov        dword ptr [rsp + 0xc], ecx
005ad 4489442418                     mov        dword ptr [rsp + 0x18], r8d
005b2 6690                           nop        
005b4 c5f877                         vzeroupper 
005b7 e82426b6ff                     call       0x7f959b9c3660
005bc 0f1f8400b4060001               nop        dword ptr [rax + rax + 0x10006b4]
005c4 bee4ffffff                     mov        esi, 0xffffffe4
005c9 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
005d1 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
005d6 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
005de 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
005e3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
005e8 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
005ed 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
005f5 48894424f8                     mov        qword ptr [rsp - 8], rax
005fa 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
005fe 89442428                       mov        dword ptr [rsp + 0x28], eax
00602 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00607 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0060c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00611 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00616 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0061b 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00620 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00625 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0062a 89442448                       mov        dword ptr [rsp + 0x48], eax
0062e 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
00633 90                             nop        
00634 c5f877                         vzeroupper 
00637 e8a425b6ff                     call       0x7f959b9c3660
0063c 0f1f840034070002               nop        dword ptr [rax + rax + 0x2000734]
00644 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0064d bee4ffffff                     mov        esi, 0xffffffe4
00652 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
0065a 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
00662 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00667 4c899c24c8000000               mov        qword ptr [rsp + 0xc8], r11
0066f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00674 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00679 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0067e 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00683 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00688 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0068d 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00692 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00697 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
0069c 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
006a1 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
006a6 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
006ab 4489442448                     mov        dword ptr [rsp + 0x48], r8d
006b0 8944244c                       mov        dword ptr [rsp + 0x4c], eax
006b4 4489542454                     mov        dword ptr [rsp + 0x54], r10d
006b9 666690                         nop        
006bc c5f877                         vzeroupper 
006bf e81c25b6ff                     call       0x7f959b9c3660
006c4 0f1f8400bc070003               nop        dword ptr [rax + rax + 0x30007bc]
006cc 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
006d1 e916fdffff                     jmp        0x7f959be60e6c
006d6 beccffffff                     mov        esi, 0xffffffcc
006db 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
006e3 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
006eb 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
006f0 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
006f8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
006fd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00702 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00707 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0070c 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00711 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00716 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0071b 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00720 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00725 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0072a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0072f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00734 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00739 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0073e 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00743 89442458                       mov        dword ptr [rsp + 0x58], eax
00747 90                             nop        
00748 c5f877                         vzeroupper 
0074b e89024b6ff                     call       0x7f959b9c3660
00750 0f1f840048080004               nop        dword ptr [rax + rax + 0x4000848]
00758 bef6ffffff                     mov        esi, 0xfffffff6
0075d 488bea                         mov        rbp, rdx
00760 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00768 c5f877                         vzeroupper 
0076b e87024b6ff                     call       0x7f959b9c3660
00770 0f1f840068080005               nop        dword ptr [rax + rax + 0x5000868]
00778 be6effffff                     mov        esi, 0xffffff6e
0077d 498bee                         mov        rbp, r14
00780 4889bc24c0000000               mov        qword ptr [rsp + 0xc0], rdi
00788 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
0078d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00792 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00797 894c2424                       mov        dword ptr [rsp + 0x24], ecx
0079b 48894424f8                     mov        qword ptr [rsp - 8], rax
007a0 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
007a4 89442428                       mov        dword ptr [rsp + 0x28], eax
007a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
007ad 48894424f8                     mov        qword ptr [rsp - 8], rax
007b2 8b442438                       mov        eax, dword ptr [rsp + 0x38]
007b6 8944242c                       mov        dword ptr [rsp + 0x2c], eax
007ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
007bf 48ff742440                     push       qword ptr [rsp + 0x40]
007c4 488f442430                     pop        qword ptr [rsp + 0x30]
007c9 48ff742448                     push       qword ptr [rsp + 0x48]
007ce 488f442438                     pop        qword ptr [rsp + 0x38]
007d3 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
007d8 4c894c2448                     mov        qword ptr [rsp + 0x48], r9
007dd 4489442444                     mov        dword ptr [rsp + 0x44], r8d
007e2 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
007e7 90                             nop        
007e8 c5f877                         vzeroupper 
007eb e8f023b6ff                     call       0x7f959b9c3660
007f0 0f1f8400e8080006               nop        dword ptr [rax + rax + 0x60008e8]
007f8 4533c9                         xor        r9d, r9d
007fb 4d3bd9                         cmp        r11, r9
007fe bdffffffff                     mov        ebp, 0xffffffff
00803 7c08                           jl         0x7f959be6128d
00805 400f95c5                       setne      bpl
00809 400fb6ed                       movzx      ebp, bpl
0080d be45ffffff                     mov        esi, 0xffffff45
00812 4c89b424c0000000               mov        qword ptr [rsp + 0xc0], r14
0081a 4889542410                     mov        qword ptr [rsp + 0x10], rdx
0081f 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
00824 89442428                       mov        dword ptr [rsp + 0x28], eax
00828 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
0082c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00831 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00836 48ff742440                     push       qword ptr [rsp + 0x40]
0083b 488f442438                     pop        qword ptr [rsp + 0x38]
00840 48ff742448                     push       qword ptr [rsp + 0x48]
00845 488f442440                     pop        qword ptr [rsp + 0x40]
0084a 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
0084f 90                             nop        
00850 c5f877                         vzeroupper 
00853 e88823b6ff                     call       0x7f959b9c3660
00858 0f1f840050090007               nop        dword ptr [rax + rax + 0x7000950]
00860 bebeffffff                     mov        esi, 0xffffffbe
00865 4c89b424c0000000               mov        qword ptr [rsp + 0xc0], r14
0086d 4889bc24c8000000               mov        qword ptr [rsp + 0xc8], rdi
00875 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
0087a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0087f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00884 894c2424                       mov        dword ptr [rsp + 0x24], ecx
00888 48894424f8                     mov        qword ptr [rsp - 8], rax
0088d 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00891 89442428                       mov        dword ptr [rsp + 0x28], eax
00895 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0089a 48894424f8                     mov        qword ptr [rsp - 8], rax
0089f 8b442438                       mov        eax, dword ptr [rsp + 0x38]
008a3 8944242c                       mov        dword ptr [rsp + 0x2c], eax
008a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008ac 48ff742440                     push       qword ptr [rsp + 0x40]
008b1 488f442430                     pop        qword ptr [rsp + 0x30]
008b6 48ff742448                     push       qword ptr [rsp + 0x48]
008bb 488f442438                     pop        qword ptr [rsp + 0x38]
008c0 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
008c5 4c894c2448                     mov        qword ptr [rsp + 0x48], r9
008ca 4489442444                     mov        dword ptr [rsp + 0x44], r8d
008cf 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
008d4 c5f877                         vzeroupper 
008d7 e80423b6ff                     call       0x7f959b9c3660
008dc 0f1f8400d4090008               nop        dword ptr [rax + rax + 0x80009d4]
008e4 8b6c243c                       mov        ebp, dword ptr [rsp + 0x3c]
008e8 4c8bb424c8000000               mov        r14, qword ptr [rsp + 0xc8]
008f0 488b7c2450                     mov        rdi, qword ptr [rsp + 0x50]
008f5 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
008f9 e991fcffff                     jmp        0x7f959be6100f
008fe be45ffffff                     mov        esi, 0xffffff45
00903 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
0090b 90                             nop        
0090c c5f877                         vzeroupper 
0090f e8cc22b6ff                     call       0x7f959b9c3660
00914 0f1f84000c0a0009               nop        dword ptr [rax + rax + 0x9000a0c]
0091c ffcb                           dec        ebx
0091e be45ffffff                     mov        esi, 0xffffff45
00923 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
0092b 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00930 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00938 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0093d 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00945 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0094a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0094f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00954 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
0095c 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00961 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00966 48894424f8                     mov        qword ptr [rsp - 8], rax
0096b 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0096f 89442428                       mov        dword ptr [rsp + 0x28], eax
00973 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00978 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0097d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00982 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00987 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0098c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00991 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00996 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0099b 4489442434                     mov        dword ptr [rsp + 0x34], r8d
009a0 89442448                       mov        dword ptr [rsp + 0x48], eax
009a4 895c2458                       mov        dword ptr [rsp + 0x58], ebx
009a8 c5f877                         vzeroupper 
009ab e83022b6ff                     call       0x7f959b9c3660
009b0 0f1f8400a80a000a               nop        dword ptr [rax + rax + 0xa000aa8]
009b8 be45ffffff                     mov        esi, 0xffffff45
009bd 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
009c5 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
009cd 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
009d2 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
009da 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
009df 4c89542418                     mov        qword ptr [rsp + 0x18], r10
009e4 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
009e9 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
009ee 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
009f3 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
009f8 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
009fd 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00a02 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00a07 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00a0c 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00a11 89442450                       mov        dword ptr [rsp + 0x50], eax
00a15 666690                         nop        
00a18 c5f877                         vzeroupper 
00a1b e8c021b6ff                     call       0x7f959b9c3660
00a20 0f1f8400180b000b               nop        dword ptr [rax + rax + 0xb000b18]
00a28 be45ffffff                     mov        esi, 0xffffff45
00a2d 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00a35 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00a3d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00a42 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00a4a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00a4f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00a54 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00a59 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00a5e 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00a63 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00a68 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00a6d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00a72 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00a77 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00a7c 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00a81 89442450                       mov        dword ptr [rsp + 0x50], eax
00a85 666690                         nop        
00a88 c5f877                         vzeroupper 
00a8b e85021b6ff                     call       0x7f959b9c3660
00a90 0f1f8400880b000c               nop        dword ptr [rax + rax + 0xc000b88]
00a98 be45ffffff                     mov        esi, 0xffffff45
00a9d 8bac24c0000000                 mov        ebp, dword ptr [rsp + 0xc0]
00aa4 898c24c0000000                 mov        dword ptr [rsp + 0xc0], ecx
00aab 90                             nop        
00aac c5f877                         vzeroupper 
00aaf e82c21b6ff                     call       0x7f959b9c3660
00ab4 0f1f8400ac0b000d               nop        dword ptr [rax + rax + 0xd000bac]
00abc 4d3bcb                         cmp        r9, r11
00abf bdffffffff                     mov        ebp, 0xffffffff
00ac4 7c08                           jl         0x7f959be6154e
00ac6 400f95c5                       setne      bpl
00aca 400fb6ed                       movzx      ebp, bpl
00ace be45ffffff                     mov        esi, 0xffffff45
00ad3 90                             nop        
00ad4 c5f877                         vzeroupper 
00ad7 e80421b6ff                     call       0x7f959b9c3660
00adc 0f1f8400d40b000e               nop        dword ptr [rax + rax + 0xe000bd4]
00ae4 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00ae9 493bfb                         cmp        rdi, r11
00aec bdffffffff                     mov        ebp, 0xffffffff
00af1 7c08                           jl         0x7f959be6157b
00af3 400f95c5                       setne      bpl
00af7 400fb6ed                       movzx      ebp, bpl
00afb be45ffffff                     mov        esi, 0xffffff45
00b00 4c89b424c0000000               mov        qword ptr [rsp + 0xc0], r14
00b08 4889542410                     mov        qword ptr [rsp + 0x10], rdx
00b0d 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
00b12 89442428                       mov        dword ptr [rsp + 0x28], eax
00b16 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
00b1a 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00b1f 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00b24 48ff742440                     push       qword ptr [rsp + 0x40]
00b29 488f442438                     pop        qword ptr [rsp + 0x38]
00b2e 6690                           nop        
00b30 c5f877                         vzeroupper 
00b33 e8a820b6ff                     call       0x7f959b9c3660
00b38 0f1f8400300c000f               nop        dword ptr [rax + rax + 0xf000c30]
00b40 be45ffffff                     mov        esi, 0xffffff45
00b45 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00b4d 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00b52 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
00b5a 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00b5f 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00b67 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00b6c 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00b71 8b4c2428                       mov        ecx, dword ptr [rsp + 0x28]
00b75 898c24cc000000                 mov        dword ptr [rsp + 0xcc], ecx
00b7c 48894424f8                     mov        qword ptr [rsp - 8], rax
00b81 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00b85 89442428                       mov        dword ptr [rsp + 0x28], eax
00b89 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00b8e 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00b93 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00b98 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00b9d 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00ba2 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
00ba7 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00bac 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00bb1 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00bb6 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00bbb 8944244c                       mov        dword ptr [rsp + 0x4c], eax
00bbf 895c2450                       mov        dword ptr [rsp + 0x50], ebx
00bc3 90                             nop        
00bc4 c5f877                         vzeroupper 
00bc7 e81420b6ff                     call       0x7f959b9c3660
00bcc 0f1f8400c40c0010               nop        dword ptr [rax + rax + 0x10000cc4]
00bd4 488b8c2480000000               mov        rcx, qword ptr [rsp + 0x80]
00bdc 4c3bd1                         cmp        r10, rcx
00bdf bdffffffff                     mov        ebp, 0xffffffff
00be4 7c08                           jl         0x7f959be6166e
00be6 400f95c5                       setne      bpl
00bea 400fb6ed                       movzx      ebp, bpl
00bee be45ffffff                     mov        esi, 0xffffff45
00bf3 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00bfb 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00c03 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00c08 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00c10 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00c15 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c1a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00c1f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00c24 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00c29 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00c2e 48894424f8                     mov        qword ptr [rsp - 8], rax
00c33 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00c37 89442430                       mov        dword ptr [rsp + 0x30], eax
00c3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c40 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00c45 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
00c4a 89442450                       mov        dword ptr [rsp + 0x50], eax
00c4e 6690                           nop        
00c50 c5f877                         vzeroupper 
00c53 e8881fb6ff                     call       0x7f959b9c3660
00c58 0f1f8400500d0011               nop        dword ptr [rax + rax + 0x11000d50]
00c60 be45ffffff                     mov        esi, 0xffffff45
00c65 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00c6d 666690                         nop        
00c70 c5f877                         vzeroupper 
00c73 e8681fb6ff                     call       0x7f959b9c3660
00c78 0f1f8400700d0012               nop        dword ptr [rax + rax + 0x12000d70]
00c80 ffcb                           dec        ebx
00c82 be45ffffff                     mov        esi, 0xffffff45
00c87 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00c8f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00c94 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00c9c 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00ca1 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00ca9 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00cae 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00cb3 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00cb8 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00cc0 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00cc5 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00cca 48894424f8                     mov        qword ptr [rsp - 8], rax
00ccf 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00cd3 89442428                       mov        dword ptr [rsp + 0x28], eax
00cd7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cdc 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00ce1 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00ce6 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00ceb 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00cf0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00cf5 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00cfa 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00cff 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00d04 89442448                       mov        dword ptr [rsp + 0x48], eax
00d08 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
00d0c c5f877                         vzeroupper 
00d0f e8cc1eb6ff                     call       0x7f959b9c3660
00d14 0f1f84000c0e0013               nop        dword ptr [rax + rax + 0x13000e0c]
00d1c be45ffffff                     mov        esi, 0xffffff45
00d21 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00d29 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00d2e 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00d36 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00d3b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d40 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00d45 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00d4d 48894424f8                     mov        qword ptr [rsp - 8], rax
00d52 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00d56 89442428                       mov        dword ptr [rsp + 0x28], eax
00d5a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d5f 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00d64 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00d69 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00d6e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00d73 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00d78 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00d7d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00d82 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00d87 89442448                       mov        dword ptr [rsp + 0x48], eax
00d8b 90                             nop        
00d8c c5f877                         vzeroupper 
00d8f e84c1eb6ff                     call       0x7f959b9c3660
00d94 0f1f84008c0e0014               nop        dword ptr [rax + rax + 0x14000e8c]
00d9c be45ffffff                     mov        esi, 0xffffff45
00da1 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00da9 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00dae 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00db6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00dbb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00dc0 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00dc5 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00dcd 48894424f8                     mov        qword ptr [rsp - 8], rax
00dd2 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00dd6 89442428                       mov        dword ptr [rsp + 0x28], eax
00dda 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ddf 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00de4 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00de9 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00dee 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00df3 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00df8 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00dfd 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00e02 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00e07 89442448                       mov        dword ptr [rsp + 0x48], eax
00e0b 90                             nop        
00e0c c5f877                         vzeroupper 
00e0f e8cc1db6ff                     call       0x7f959b9c3660
00e14 0f1f84000c0f0015               nop        dword ptr [rax + rax + 0x15000f0c]
00e1c be45ffffff                     mov        esi, 0xffffff45
00e21 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00e29 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00e31 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00e36 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00e3e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e43 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e48 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00e4d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00e52 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00e57 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00e5c 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00e61 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00e66 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00e6b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00e70 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00e75 89442450                       mov        dword ptr [rsp + 0x50], eax
00e79 666690                         nop        
00e7c c5f877                         vzeroupper 
00e7f e85c1db6ff                     call       0x7f959b9c3660
00e84 0f1f84007c0f0016               nop        dword ptr [rax + rax + 0x16000f7c]
00e8c bee4ffffff                     mov        esi, 0xffffffe4
00e91 488bac24c8000000               mov        rbp, qword ptr [rsp + 0xc8]
00e99 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00e9e 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00ea6 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00eab 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00eb3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00eb8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ebd 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00ec2 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00eca 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00ecf 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00ed4 48894424f8                     mov        qword ptr [rsp - 8], rax
00ed9 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00edd 89442428                       mov        dword ptr [rsp + 0x28], eax
00ee1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ee6 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00eeb 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00ef0 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00ef5 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00efa 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00eff 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00f04 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00f09 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00f0e 89442448                       mov        dword ptr [rsp + 0x48], eax
00f12 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
00f16 6690                           nop        
00f18 c5f877                         vzeroupper 
00f1b e8c01cb6ff                     call       0x7f959b9c3660
00f20 0f1f840018100017               nop        dword ptr [rax + rax + 0x17001018]
00f28 bef6ffffff                     mov        esi, 0xfffffff6
00f2d 666690                         nop        
00f30 c5f877                         vzeroupper 
00f33 e8a81cb6ff                     call       0x7f959b9c3660
00f38 0f1f840030100018               nop        dword ptr [rax + rax + 0x18001030]
00f40 488bf0                         mov        rsi, rax
00f43 c5f877                         vzeroupper 
00f46 4881c4b0000000                 add        rsp, 0xb0
00f4d 5d                             pop        rbp
00f4e e98d45b6ff                     jmp        0x7f959b9c5f60
00f53 49ba2f0fe69b957f0000           movabs     r10, 0x7f959be60f2f
00f5d 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
00f64 e9f7c4a9ff                     jmp        0x7f959b8fdee0
00f69 e8b290a8ff                     call       0x7f959b8eaaa0
00f6e e9cbf0ffff                     jmp        0x7f959be60abe
00f73 f4                             hlt        
00f74 f4                             hlt        
00f75 f4                             hlt        
00f76 f4                             hlt        
00f77 f4                             hlt        
