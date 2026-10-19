00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85408ba9ff                   jne        0x7f75ef90f960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881eca0000000                 sub        rsp, 0xa0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f859b100000                   jne        0x7f75efe77ed9
0003e 8bc7                           mov        eax, edi
00040 4c894c2420                     mov        qword ptr [rsp + 0x20], r9
00045 498bd8                         mov        rbx, r8
00048 894c240c                       mov        dword ptr [rsp + 0xc], ecx
0004c 4c8bf6                         mov        r14, rsi
0004f 448b563c                       mov        r10d, dword ptr [rsi + 0x3c]
00053 448b4638                       mov        r8d, dword ptr [rsi + 0x38]
00057 418bc8                         mov        ecx, r8d
0005a 412bca                         sub        ecx, r10d
0005d 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00065 443bd9                         cmp        r11d, ecx
00068 0f8f9a0a0000                   jg         0x7f75efe77908
0006e 4c8b4e08                       mov        r9, qword ptr [rsi + 8]
00072 4c894c2440                     mov        qword ptr [rsp + 0x40], r9
00077 4c8b4e20                       mov        r9, qword ptr [rsi + 0x20]
0007b 48638c24b0000000               movsxd     rcx, dword ptr [rsp + 0xb0]
00083 4963fa                         movsxd     rdi, r10d
00086 48037c2440                     add        rdi, qword ptr [rsp + 0x40]
0008b 4c2bcf                         sub        r9, rdi
0008e 493bc9                         cmp        rcx, r9
00091 0f8f950a0000                   jg         0x7f75efe7792c
00097 4c8b5e10                       mov        r11, qword ptr [rsi + 0x10]
0009b 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
000a0 4c8b5e28                       mov        r11, qword ptr [rsi + 0x28]
000a4 448b4e44                       mov        r9d, dword ptr [rsi + 0x44]
000a8 4d85db                         test       r11, r11
000ab 0f854f070000                   jne        0x7f75efe77600
000b1 4803f9                         add        rdi, rcx
000b4 483b7c2448                     cmp        rdi, qword ptr [rsp + 0x48]
000b9 0f8f950a0000                   jg         0x7f75efe77954
000bf 488bfa                         mov        rdi, rdx
000c2 8b7208                         mov        esi, dword ptr [rdx + 8]
000c5 33c9                           xor        ecx, ecx
000c7 448bd8                         mov        r11d, eax
000ca 4585db                         test       r11d, r11d
000cd 0f8e8c020000                   jle        0x7f75efe7715f
000d3 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
000d8 448d6ee0                       lea        r13d, [rsi - 0x20]
000dc 4489442438                     mov        dword ptr [rsp + 0x38], r8d
000e1 4183c0e0                       add        r8d, -0x20
000e5 488b4c2440                     mov        rcx, qword ptr [rsp + 0x40]
000ea 48f7d9                         neg        rcx
000ed 448b5308                       mov        r10d, dword ptr [rbx + 8]
000f1 4585d2                         test       r10d, r10d
000f4 0f8686060000                   jbe        0x7f75efe77580
000fa 4963d3                         movsxd     rdx, r11d
000fd 4d63d2                         movsxd     r10, r10d
00100 48ffca                         dec        rdx
00103 493bd2                         cmp        rdx, r10
00106 0f8374060000                   jae        0x7f75efe77580
0010c 488bac24b8000000               mov        rbp, qword ptr [rsp + 0xb8]
00114 8b4508                         mov        eax, dword ptr [rbp + 8]
00117 85c0                           test       eax, eax
00119 0f8649070000                   jbe        0x7f75efe77668
0011f 448d56f1                       lea        r10d, [rsi - 0xf]
00123 4585d2                         test       r10d, r10d
00126 0f8c3c070000                   jl         0x7f75efe77668
0012c 418b5108                       mov        edx, dword ptr [r9 + 8]
00130 448d52f1                       lea        r10d, [rdx - 0xf]
00134 4585d2                         test       r10d, r10d
00137 0f8c2b070000                   jl         0x7f75efe77668
0013d 89442418                       mov        dword ptr [rsp + 0x18], eax
00141 48894c2470                     mov        qword ptr [rsp + 0x70], rcx
00146 4489442468                     mov        dword ptr [rsp + 0x68], r8d
0014b 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
00150 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
00158 488f442458                     pop        qword ptr [rsp + 0x58]
0015d 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00162 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
00167 48897c2450                     mov        qword ptr [rsp + 0x50], rdi
0016c 4c89b424b8000000               mov        qword ptr [rsp + 0xb8], r14
00174 89b424b4000000                 mov        dword ptr [rsp + 0xb4], esi
0017b 4d8bd1                         mov        r10, r9
0017e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00183 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
00188 83c6f1                         add        esi, -0xf
0018b 8974246c                       mov        dword ptr [rsp + 0x6c], esi
0018f 8954241c                       mov        dword ptr [rsp + 0x1c], edx
00193 83c2f1                         add        edx, -0xf
00196 89542478                       mov        dword ptr [rsp + 0x78], edx
0019a 4533c9                         xor        r9d, r9d
0019d 4533c0                         xor        r8d, r8d
001a0 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
001a5 4f8b5cc210                     mov        r11, qword ptr [r10 + r8*8 + 0x10]
001aa 4d8bd3                         mov        r10, r11
001ad 49c1ea12                       shr        r10, 0x12
001b1 458bd2                         mov        r10d, r10d
001b4 4181e2ffff0300                 and        r10d, 0x3ffff
001bb 418bc2                         mov        eax, r10d
001be 498bcb                         mov        rcx, r11
001c1 48c1f924                       sar        rcx, 0x24
001c5 458bd3                         mov        r10d, r11d
001c8 8bc9                           mov        ecx, ecx
001ca 4181e2ffff0100                 and        r10d, 0x1ffff
001d1 85c9                           test       ecx, ecx
001d3 0f8cd7090000                   jl         0x7f75efe779b0
001d9 4585d2                         test       r10d, r10d
001dc 0f84a0020000                   je         0x7f75efe77282
001e2 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
001e6 412be9                         sub        ebp, r9d
001e9 443bd5                         cmp        r10d, ebp
001ec 0f8f220b0000                   jg         0x7f75efe77b14
001f2 418bd2                         mov        edx, r10d
001f5 83f903                         cmp        ecx, 3
001f8 0f8f8f020000                   jg         0x7f75efe7728d
001fe 85d2                           test       edx, edx
00200 0f842e0b0000                   je         0x7f75efe77b34
00206 83f901                         cmp        ecx, 1
00209 0f8529070000                   jne        0x7f75efe77738
0020f 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00214 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
00218 458bea                         mov        r13d, r10d
0021b 4863ca                         movsxd     rcx, edx
0021e 4c635c243c                     movsxd     r11, dword ptr [rsp + 0x3c]
00223 4c035c2440                     add        r11, qword ptr [rsp + 0x40]
00228 4c03d9                         add        r11, rcx
0022b 4d63d5                         movsxd     r10, r13d
0022e 4d3bd3                         cmp        r10, r11
00231 0f8f210a0000                   jg         0x7f75efe77a58
00237 4585ed                         test       r13d, r13d
0023a 0f8ecb060000                   jle        0x7f75efe7770b
00240 458d1c11                       lea        r11d, [r9 + rdx]
00244 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00249 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0024e 4403da                         add        r11d, edx
00251 4403d8                         add        r11d, eax
00254 443b5c2468                     cmp        r11d, dword ptr [rsp + 0x68]
00259 0f8f6b020000                   jg         0x7f75efe772ca
0025f 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00264 443b542464                     cmp        r10d, dword ptr [rsp + 0x64]
00269 0f8f790b0000                   jg         0x7f75efe77be8
0026f 83fa10                         cmp        edx, 0x10
00272 0f8f240c0000                   jg         0x7f75efe77c9c
00278 443b4c246c                     cmp        r9d, dword ptr [rsp + 0x6c]
0027d 0f83e9020000                   jae        0x7f75efe7736c
00283 418be9                         mov        ebp, r9d
00286 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0028b c4c17a6f442a0c                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0xc]
00292 8b5c243c                       mov        ebx, dword ptr [rsp + 0x3c]
00296 3b5c2478                       cmp        ebx, dword ptr [rsp + 0x78]
0029a 0f837c030000                   jae        0x7f75efe7741c
002a0 448d1c2a                       lea        r11d, [rdx + rbp]
002a4 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
002a9 448d141a                       lea        r10d, [rdx + rbx]
002ad 418bd2                         mov        edx, r10d
002b0 4863db                         movsxd     rbx, ebx
002b3 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
002b8 c4c17a7f441a0c                 vmovdqu    xmmword ptr [r10 + rbx + 0xc], xmm0
002bf 8bea                           mov        ebp, edx
002c1 412bed                         sub        ebp, r13d
002c4 448bd8                         mov        r11d, eax
002c7 4183fb10                       cmp        r11d, 0x10
002cb 0f8e7f0c0000                   jle        0x7f75efe77d50
002d1 453beb                         cmp        r13d, r11d
002d4 0f8c12070000                   jl         0x7f75efe777ec
002da 4183fb30                       cmp        r11d, 0x30
002de 0f8e9c070000                   jle        0x7f75efe77880
002e4 85ed                           test       ebp, ebp
002e6 0f8ce2030000                   jl         0x7f75efe774ce
002ec 448bd2                         mov        r10d, edx
002ef 4585d2                         test       r10d, r10d
002f2 0f8cd6030000                   jl         0x7f75efe774ce
002f8 458d142b                       lea        r10d, [r11 + rbp]
002fc 448b4c241c                     mov        r9d, dword ptr [rsp + 0x1c]
00301 453bca                         cmp        r9d, r10d
00304 0f82c4030000                   jb         0x7f75efe774ce
0030a 458d2c13                       lea        r13d, [r11 + rdx]
0030e 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
00313 453bcd                         cmp        r9d, r13d
00316 0f82b2030000                   jb         0x7f75efe774ce
0031c 4585db                         test       r11d, r11d
0031f 0f849f030000                   je         0x7f75efe774c4
00325 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0032a 498d7c2a0c                     lea        rdi, [r10 + rbp + 0xc]
0032f 4803cb                         add        rcx, rbx
00332 498d740a0c                     lea        rsi, [r10 + rcx + 0xc]
00337 4863d0                         movsxd     rdx, eax
0033a 4883fa20                       cmp        rdx, 0x20
0033e 762f                           jbe        0x7f75efe7716f
00340 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00345 c5f877                         vzeroupper 
00348 49ba209f8fef757f0000           movabs     r10, 0x7f75ef8f9f20
00352 41ffd2                         call       r10
00355 0f1f840000000000               nop        dword ptr [rax + rax]
0035d eb38                           jmp        0x7f75efe77197
0035f 4585c9                         test       r9d, r9d
00362 0f84f8030000                   je         0x7f75efe77560
00368 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
0036d eb78                           jmp        0x7f75efe771e7
0036f 448bd0                         mov        r10d, eax
00372 4d63d2                         movsxd     r10, r10d
00375 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0037c c442a8f5db                     bzhi       r11, r11, r10
00381 c4c1fb92fb                     kmovq      k7, r11
00386 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0038c 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00392 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00397 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0039c 41ffc2                         inc        r10d
0039f 443b542428                     cmp        r10d, dword ptr [rsp + 0x28]
003a4 7d0d                           jge        0x7f75efe771b3
003a6 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
003ab 458bc2                         mov        r8d, r10d
003ae e9edfdffff                     jmp        0x7f75efe76fa0
003b3 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
003b8 442b44247c                     sub        r8d, dword ptr [rsp + 0x7c]
003bd 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
003c1 85c9                           test       ecx, ecx
003c3 0f8c27050000                   jl         0x7f75efe776f0
003c9 4c8bb424b8000000               mov        r14, qword ptr [rsp + 0xb8]
003d1 488b7c2450                     mov        rdi, qword ptr [rsp + 0x50]
003d6 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
003db 8bb424b4000000                 mov        esi, dword ptr [rsp + 0xb4]
003e2 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
003e7 4585d2                         test       r10d, r10d
003ea 0f8c35010000                   jl         0x7f75efe77325
003f0 3b74240c                       cmp        esi, dword ptr [rsp + 0xc]
003f4 0f8230010000                   jb         0x7f75efe7732a
003fa 438d1c02                       lea        ebx, [r10 + r8]
003fe 418b5108                       mov        edx, dword ptr [r9 + 8]
00402 3bd3                           cmp        edx, ebx
00404 0f8225010000                   jb         0x7f75efe7732f
0040a 4585c0                         test       r8d, r8d
0040d 0f8c21010000                   jl         0x7f75efe77334
00413 4585c0                         test       r8d, r8d
00416 7436                           je         0x7f75efe7724e
00418 488d7c0f0c                     lea        rdi, [rdi + rcx + 0xc]
0041d 4d8bd9                         mov        r11, r9
00420 4b8d74110c                     lea        rsi, [r9 + r10 + 0xc]
00425 4963d0                         movsxd     rdx, r8d
00428 4883fa20                       cmp        rdx, 0x20
0042c 773a                           ja         0x7f75efe77268
0042e 4d63d0                         movsxd     r10, r8d
00431 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00438 c442a8f5db                     bzhi       r11, r11, r10
0043d c4c1fb92fb                     kmovq      k7, r11
00442 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00448 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0044e 41895e3c                       mov        dword ptr [r14 + 0x3c], ebx
00452 c5f877                         vzeroupper 
00455 4881c4a0000000                 add        rsp, 0xa0
0045c 5d                             pop        rbp
0045d 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00461 0f875c0c0000                   ja         0x7f75efe77ec3
00467 c3                             ret        
00468 c5f877                         vzeroupper 
0046b 49ba209f8fef757f0000           movabs     r10, 0x7f75ef8f9f20
00475 41ffd2                         call       r10
00478 0f1f840000000000               nop        dword ptr [rax + rax]
00480 ebcc                           jmp        0x7f75efe7724e
00482 4533d2                         xor        r10d, r10d
00485 418bd2                         mov        edx, r10d
00488 e968fdffff                     jmp        0x7f75efe76ff5
0048d 83c1fd                         add        ecx, -3
00490 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00495 4183fa02                       cmp        r10d, 2
00499 0f86450b0000                   jbe        0x7f75efe77de4
0049f 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
004a4 458b5210                       mov        r10d, dword ptr [r10 + 0x10]
004a8 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
004ad 45895314                       mov        dword ptr [r11 + 0x14], r10d
004b1 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
004b5 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
004ba 45895a10                       mov        dword ptr [r10 + 0x10], r11d
004be 41894a0c                       mov        dword ptr [r10 + 0xc], ecx
004c2 448be9                         mov        r13d, ecx
004c5 e951fdffff                     jmp        0x7f75efe7701b
004ca 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
004cf 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
004d4 498bf3                         mov        rsi, r11
004d7 44898c24b0000000               mov        dword ptr [rsp + 0xb0], r9d
004df 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
004e3 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
004e8 8bfa                           mov        edi, edx
004ea 44892c24                       mov        dword ptr [rsp], r13d
004ee 89442408                       mov        dword ptr [rsp + 8], eax
004f2 4889b42480000000               mov        qword ptr [rsp + 0x80], rsi
004fa 8b6c2468                       mov        ebp, dword ptr [rsp + 0x68]
004fe 8994248c000000                 mov        dword ptr [rsp + 0x8c], edx
00505 8b54243c                       mov        edx, dword ptr [rsp + 0x3c]
00509 666690                         nop        
0050c c5f877                         vzeroupper 
0050f e84c95a9ff                     call       0x7f75ef910860
00514 0f1f84000c060000               nop        dword ptr [rax + rax + 0x60c]
0051c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00520 e972feffff                     jmp        0x7f75efe77197
00525 418bea                         mov        ebp, r10d
00528 eb0d                           jmp        0x7f75efe77337
0052a 418bea                         mov        ebp, r10d
0052d eb08                           jmp        0x7f75efe77337
0052f 418bea                         mov        ebp, r10d
00532 eb03                           jmp        0x7f75efe77337
00534 418bea                         mov        ebp, r10d
00537 beccffffff                     mov        esi, 0xffffffcc
0053c 4c89b424b0000000               mov        qword ptr [rsp + 0xb0], r14
00544 48897c2410                     mov        qword ptr [rsp + 0x10], rdi
00549 898c24bc000000                 mov        dword ptr [rsp + 0xbc], ecx
00550 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00555 4489442418                     mov        dword ptr [rsp + 0x18], r8d
0055a 6690                           nop        
0055c c5f877                         vzeroupper 
0055f e8fc09b6ff                     call       0x7f75ef9d7d60
00564 0f1f84005c060001               nop        dword ptr [rax + rax + 0x100065c]
0056c bee4ffffff                     mov        esi, 0xffffffe4
00571 488bac24b8000000               mov        rbp, qword ptr [rsp + 0xb8]
00579 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0057e 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
00586 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0058b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00590 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00595 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0059d 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
005a2 4c89542420                     mov        qword ptr [rsp + 0x20], r10
005a7 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
005ac 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
005b1 48894424f8                     mov        qword ptr [rsp - 8], rax
005b6 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
005ba 89442428                       mov        dword ptr [rsp + 0x28], eax
005be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
005c3 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
005c8 4489542430                     mov        dword ptr [rsp + 0x30], r10d
005cd 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
005d2 4c89542438                     mov        qword ptr [rsp + 0x38], r10
005d7 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
005dc 4c89542440                     mov        qword ptr [rsp + 0x40], r10
005e1 4489442434                     mov        dword ptr [rsp + 0x34], r8d
005e6 89442448                       mov        dword ptr [rsp + 0x48], eax
005ea 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
005ef 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
005f4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
005f9 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
005fe 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00603 89542468                       mov        dword ptr [rsp + 0x68], edx
00607 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
0060c c5f877                         vzeroupper 
0060f e84c09b6ff                     call       0x7f75ef9d7d60
00614 0f1f84000c070002               nop        dword ptr [rax + rax + 0x200070c]
0061c bee4ffffff                     mov        esi, 0xffffffe4
00621 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
00629 488f8424b0000000               pop        qword ptr [rsp + 0xb0]
00631 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00639 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0063e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00643 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00648 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0064d 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00652 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00657 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0065c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00661 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00666 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0066b 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00670 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00675 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0067a 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0067f 8944244c                       mov        dword ptr [rsp + 0x4c], eax
00683 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00688 895c2454                       mov        dword ptr [rsp + 0x54], ebx
0068c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00691 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00696 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0069b 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
006a0 89542468                       mov        dword ptr [rsp + 0x68], edx
006a4 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
006a9 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
006b2 6690                           nop        
006b4 c5f877                         vzeroupper 
006b7 e8a408b6ff                     call       0x7f75ef9d7d60
006bc 0f1f8400b4070003               nop        dword ptr [rax + rax + 0x30007b4]
006c4 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
006c9 e9c9fcffff                     jmp        0x7f75efe77197
006ce beccffffff                     mov        esi, 0xffffffcc
006d3 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
006db 488f8424b0000000               pop        qword ptr [rsp + 0xb0]
006e3 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
006e8 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
006f0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
006f5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
006fa 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
006ff 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00704 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00709 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0070e 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00713 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00718 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0071d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00722 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00727 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0072c 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00731 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00736 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0073b 89442458                       mov        dword ptr [rsp + 0x58], eax
0073f 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00744 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00749 89542468                       mov        dword ptr [rsp + 0x68], edx
0074d 666690                         nop        
00750 c5f877                         vzeroupper 
00753 e80808b6ff                     call       0x7f75ef9d7d60
00758 0f1f840050080004               nop        dword ptr [rax + rax + 0x4000850]
00760 bef6ffffff                     mov        esi, 0xfffffff6
00765 488bea                         mov        rbp, rdx
00768 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
00770 c5f877                         vzeroupper 
00773 e8e807b6ff                     call       0x7f75ef9d7d60
00778 0f1f840070080005               nop        dword ptr [rax + rax + 0x5000870]
00780 be6effffff                     mov        esi, 0xffffff6e
00785 498bee                         mov        rbp, r14
00788 4889bc24b0000000               mov        qword ptr [rsp + 0xb0], rdi
00790 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
00795 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0079a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0079f 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
007a4 48894424f8                     mov        qword ptr [rsp - 8], rax
007a9 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
007ad 89442428                       mov        dword ptr [rsp + 0x28], eax
007b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
007b6 48894424f8                     mov        qword ptr [rsp - 8], rax
007bb 8b442438                       mov        eax, dword ptr [rsp + 0x38]
007bf 8944242c                       mov        dword ptr [rsp + 0x2c], eax
007c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
007c8 48ff742440                     push       qword ptr [rsp + 0x40]
007cd 488f442430                     pop        qword ptr [rsp + 0x30]
007d2 48ff742448                     push       qword ptr [rsp + 0x48]
007d7 488f442438                     pop        qword ptr [rsp + 0x38]
007dc 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
007e1 48894c2448                     mov        qword ptr [rsp + 0x48], rcx
007e6 4489442444                     mov        dword ptr [rsp + 0x44], r8d
007eb 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
007f0 c5f877                         vzeroupper 
007f3 e86807b6ff                     call       0x7f75ef9d7d60
007f8 0f1f8400f0080006               nop        dword ptr [rax + rax + 0x60008f0]
00800 33c9                           xor        ecx, ecx
00802 4c3bd9                         cmp        r11, rcx
00805 bdffffffff                     mov        ebp, 0xffffffff
0080a 7c08                           jl         0x7f75efe77614
0080c 400f95c5                       setne      bpl
00810 400fb6ed                       movzx      ebp, bpl
00814 be45ffffff                     mov        esi, 0xffffff45
00819 4c89b424b0000000               mov        qword ptr [rsp + 0xb0], r14
00821 4889542410                     mov        qword ptr [rsp + 0x10], rdx
00826 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
0082b 89442428                       mov        dword ptr [rsp + 0x28], eax
0082f 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00834 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00839 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0083e 48ff742440                     push       qword ptr [rsp + 0x40]
00843 488f442438                     pop        qword ptr [rsp + 0x38]
00848 48ff742448                     push       qword ptr [rsp + 0x48]
0084d 488f442440                     pop        qword ptr [rsp + 0x40]
00852 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
00857 90                             nop        
00858 c5f877                         vzeroupper 
0085b e80007b6ff                     call       0x7f75ef9d7d60
00860 0f1f840058090007               nop        dword ptr [rax + rax + 0x7000958]
00868 bebeffffff                     mov        esi, 0xffffffbe
0086d 4c89b424b0000000               mov        qword ptr [rsp + 0xb0], r14
00875 4889bc24b8000000               mov        qword ptr [rsp + 0xb8], rdi
0087d 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
00882 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00887 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0088c 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
00891 48894424f8                     mov        qword ptr [rsp - 8], rax
00896 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0089a 89442428                       mov        dword ptr [rsp + 0x28], eax
0089e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008a3 48894424f8                     mov        qword ptr [rsp - 8], rax
008a8 8b442438                       mov        eax, dword ptr [rsp + 0x38]
008ac 8944242c                       mov        dword ptr [rsp + 0x2c], eax
008b0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008b5 48ff742440                     push       qword ptr [rsp + 0x40]
008ba 488f442430                     pop        qword ptr [rsp + 0x30]
008bf 48ff742448                     push       qword ptr [rsp + 0x48]
008c4 488f442438                     pop        qword ptr [rsp + 0x38]
008c9 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
008ce 48894c2448                     mov        qword ptr [rsp + 0x48], rcx
008d3 4489442444                     mov        dword ptr [rsp + 0x44], r8d
008d8 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
008dd 666690                         nop        
008e0 c5f877                         vzeroupper 
008e3 e87806b6ff                     call       0x7f75ef9d7d60
008e8 0f1f8400e0090008               nop        dword ptr [rax + rax + 0x80009e0]
008f0 8b6c243c                       mov        ebp, dword ptr [rsp + 0x3c]
008f4 4c8bb424b8000000               mov        r14, qword ptr [rsp + 0xb8]
008fc 488b7c2450                     mov        rdi, qword ptr [rsp + 0x50]
00901 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00906 e92cfcffff                     jmp        0x7f75efe77337
0090b be45ffffff                     mov        esi, 0xffffff45
00910 488bac24b8000000               mov        rbp, qword ptr [rsp + 0xb8]
00918 4c899c24b8000000               mov        qword ptr [rsp + 0xb8], r11
00920 4489ac24b4000000               mov        dword ptr [rsp + 0xb4], r13d
00928 c5f877                         vzeroupper 
0092b e83006b6ff                     call       0x7f75ef9d7d60
00930 0f1f8400280a0009               nop        dword ptr [rax + rax + 0x9000a28]
00938 ffc9                           dec        ecx
0093a be45ffffff                     mov        esi, 0xffffff45
0093f 488bac24b8000000               mov        rbp, qword ptr [rsp + 0xb8]
00947 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0094c 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00954 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00959 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
00961 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00966 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0096b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00970 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00978 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0097d 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00982 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00987 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0098c 48894424f8                     mov        qword ptr [rsp - 8], rax
00991 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00995 89442428                       mov        dword ptr [rsp + 0x28], eax
00999 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0099e 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
009a3 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
009a8 4489542430                     mov        dword ptr [rsp + 0x30], r10d
009ad 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
009b2 4c89542438                     mov        qword ptr [rsp + 0x38], r10
009b7 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
009bc 4c89542440                     mov        qword ptr [rsp + 0x40], r10
009c1 4489442434                     mov        dword ptr [rsp + 0x34], r8d
009c6 89442448                       mov        dword ptr [rsp + 0x48], eax
009ca 894c2458                       mov        dword ptr [rsp + 0x58], ecx
009ce 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
009d3 4489542460                     mov        dword ptr [rsp + 0x60], r10d
009d8 89542464                       mov        dword ptr [rsp + 0x64], edx
009dc c5f877                         vzeroupper 
009df e87c05b6ff                     call       0x7f75ef9d7d60
009e4 0f1f8400dc0a000a               nop        dword ptr [rax + rax + 0xa000adc]
009ec be45ffffff                     mov        esi, 0xffffff45
009f1 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
009f9 488f8424b0000000               pop        qword ptr [rsp + 0xb0]
00a01 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00a06 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00a0e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00a13 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00a18 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a1d 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00a22 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00a27 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00a2c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00a31 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00a36 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00a3b 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00a40 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00a45 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00a4a 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00a4f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00a54 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00a59 89442450                       mov        dword ptr [rsp + 0x50], eax
00a5d 89542454                       mov        dword ptr [rsp + 0x54], edx
00a61 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00a66 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00a6b 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
00a70 c5f877                         vzeroupper 
00a73 e8e804b6ff                     call       0x7f75ef9d7d60
00a78 0f1f8400700b000b               nop        dword ptr [rax + rax + 0xb000b70]
00a80 be45ffffff                     mov        esi, 0xffffff45
00a85 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
00a8d 488f8424b0000000               pop        qword ptr [rsp + 0xb0]
00a95 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00a9a 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00aa2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00aa7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00aac 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00ab1 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00ab6 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00abb 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00ac0 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00ac5 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00aca 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00acf 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00ad4 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00ad9 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00ade 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00ae3 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00ae8 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00aed 89442450                       mov        dword ptr [rsp + 0x50], eax
00af1 89542454                       mov        dword ptr [rsp + 0x54], edx
00af5 666690                         nop        
00af8 c5f877                         vzeroupper 
00afb e86004b6ff                     call       0x7f75ef9d7d60
00b00 0f1f8400f80b000c               nop        dword ptr [rax + rax + 0xc000bf8]
00b08 be45ffffff                     mov        esi, 0xffffff45
00b0d 8bac24b0000000                 mov        ebp, dword ptr [rsp + 0xb0]
00b14 898c24b0000000                 mov        dword ptr [rsp + 0xb0], ecx
00b1b 90                             nop        
00b1c c5f877                         vzeroupper 
00b1f e83c04b6ff                     call       0x7f75ef9d7d60
00b24 0f1f84001c0c000d               nop        dword ptr [rax + rax + 0xd000c1c]
00b2c 493bc9                         cmp        rcx, r9
00b2f bdffffffff                     mov        ebp, 0xffffffff
00b34 7c08                           jl         0x7f75efe7793e
00b36 400f95c5                       setne      bpl
00b3a 400fb6ed                       movzx      ebp, bpl
00b3e be45ffffff                     mov        esi, 0xffffff45
00b43 90                             nop        
00b44 c5f877                         vzeroupper 
00b47 e81404b6ff                     call       0x7f75ef9d7d60
00b4c 0f1f8400440c000e               nop        dword ptr [rax + rax + 0xe000c44]
00b54 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00b59 493bfb                         cmp        rdi, r11
00b5c bdffffffff                     mov        ebp, 0xffffffff
00b61 7c08                           jl         0x7f75efe7796b
00b63 400f95c5                       setne      bpl
00b67 400fb6ed                       movzx      ebp, bpl
00b6b be45ffffff                     mov        esi, 0xffffff45
00b70 4c89b424b0000000               mov        qword ptr [rsp + 0xb0], r14
00b78 4889542410                     mov        qword ptr [rsp + 0x10], rdx
00b7d 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
00b82 89442428                       mov        dword ptr [rsp + 0x28], eax
00b86 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00b8b 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00b90 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00b95 48ff742440                     push       qword ptr [rsp + 0x40]
00b9a 488f442438                     pop        qword ptr [rsp + 0x38]
00b9f 90                             nop        
00ba0 c5f877                         vzeroupper 
00ba3 e8b803b6ff                     call       0x7f75ef9d7d60
00ba8 0f1f8400a00c000f               nop        dword ptr [rax + rax + 0xf000ca0]
00bb0 be45ffffff                     mov        esi, 0xffffff45
00bb5 488bac24b8000000               mov        rbp, qword ptr [rsp + 0xb8]
00bbd 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00bc2 4c899c24b0000000               mov        qword ptr [rsp + 0xb0], r11
00bca 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00bcf 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
00bd7 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00bdc 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00be1 8b5c2428                       mov        ebx, dword ptr [rsp + 0x28]
00be5 899c24bc000000                 mov        dword ptr [rsp + 0xbc], ebx
00bec 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
00bf1 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
00bf6 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00bfb 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00c00 48894424f8                     mov        qword ptr [rsp - 8], rax
00c05 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00c09 89442428                       mov        dword ptr [rsp + 0x28], eax
00c0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c12 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00c17 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00c1c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00c21 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00c26 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
00c2b 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00c30 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00c35 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00c3a 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00c3f 8944244c                       mov        dword ptr [rsp + 0x4c], eax
00c43 894c2450                       mov        dword ptr [rsp + 0x50], ecx
00c47 90                             nop        
00c48 c5f877                         vzeroupper 
00c4b e81003b6ff                     call       0x7f75ef9d7d60
00c50 0f1f8400480d0010               nop        dword ptr [rax + rax + 0x10000d48]
00c58 498bcb                         mov        rcx, r11
00c5b 4d3bd3                         cmp        r10, r11
00c5e bdffffffff                     mov        ebp, 0xffffffff
00c63 7c08                           jl         0x7f75efe77a6d
00c65 400f95c5                       setne      bpl
00c69 400fb6ed                       movzx      ebp, bpl
00c6d be45ffffff                     mov        esi, 0xffffff45
00c72 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
00c7a 488f8424b0000000               pop        qword ptr [rsp + 0xb0]
00c82 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00c87 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00c8f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00c94 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c99 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00c9e 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00ca3 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00ca8 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00cad 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00cb2 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00cb7 48894424f8                     mov        qword ptr [rsp - 8], rax
00cbc 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00cc0 89442430                       mov        dword ptr [rsp + 0x30], eax
00cc4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cc9 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00cce 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
00cd3 89442450                       mov        dword ptr [rsp + 0x50], eax
00cd7 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00cdc 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00ce1 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00ce6 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
00ceb 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00cf0 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00cf5 89542464                       mov        dword ptr [rsp + 0x64], edx
00cf9 44896c2468                     mov        dword ptr [rsp + 0x68], r13d
00cfe 48894c2470                     mov        qword ptr [rsp + 0x70], rcx
00d03 90                             nop        
00d04 c5f877                         vzeroupper 
00d07 e85402b6ff                     call       0x7f75ef9d7d60
00d0c 0f1f8400040e0011               nop        dword ptr [rax + rax + 0x11000e04]
00d14 be45ffffff                     mov        esi, 0xffffff45
00d19 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
00d21 666690                         nop        
00d24 c5f877                         vzeroupper 
00d27 e83402b6ff                     call       0x7f75ef9d7d60
00d2c 0f1f8400240e0012               nop        dword ptr [rax + rax + 0x12000e24]
00d34 ffc9                           dec        ecx
00d36 be45ffffff                     mov        esi, 0xffffff45
00d3b 488bac24b8000000               mov        rbp, qword ptr [rsp + 0xb8]
00d43 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00d48 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00d50 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00d55 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
00d5d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00d62 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d67 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00d6c 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00d74 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00d79 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00d7e 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00d83 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00d88 48894424f8                     mov        qword ptr [rsp - 8], rax
00d8d 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00d91 89442428                       mov        dword ptr [rsp + 0x28], eax
00d95 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d9a 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00d9f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00da4 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00da9 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00dae 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00db3 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00db8 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00dbd 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00dc2 89442448                       mov        dword ptr [rsp + 0x48], eax
00dc6 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
00dca 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00dcf 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00dd4 8954246c                       mov        dword ptr [rsp + 0x6c], edx
00dd8 c5f877                         vzeroupper 
00ddb e88001b6ff                     call       0x7f75ef9d7d60
00de0 0f1f8400d80e0013               nop        dword ptr [rax + rax + 0x13000ed8]
00de8 be45ffffff                     mov        esi, 0xffffff45
00ded 488bac24b8000000               mov        rbp, qword ptr [rsp + 0xb8]
00df5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00dfa 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00e02 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00e07 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
00e0f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e14 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e19 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00e1e 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00e26 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00e2b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00e30 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00e35 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00e3a 48894424f8                     mov        qword ptr [rsp - 8], rax
00e3f 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00e43 89442428                       mov        dword ptr [rsp + 0x28], eax
00e47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e4c 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00e51 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00e56 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00e5b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00e60 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00e65 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00e6a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00e6f 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00e74 89442448                       mov        dword ptr [rsp + 0x48], eax
00e78 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00e7d 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00e82 89542460                       mov        dword ptr [rsp + 0x60], edx
00e86 44896c2468                     mov        dword ptr [rsp + 0x68], r13d
00e8b 90                             nop        
00e8c c5f877                         vzeroupper 
00e8f e8cc00b6ff                     call       0x7f75ef9d7d60
00e94 0f1f84008c0f0014               nop        dword ptr [rax + rax + 0x14000f8c]
00e9c be45ffffff                     mov        esi, 0xffffff45
00ea1 488bac24b8000000               mov        rbp, qword ptr [rsp + 0xb8]
00ea9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00eae 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00eb6 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00ebb 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
00ec3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ec8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ecd 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00ed2 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00eda 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00edf 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00ee4 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00ee9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00eee 48894424f8                     mov        qword ptr [rsp - 8], rax
00ef3 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00ef7 89442428                       mov        dword ptr [rsp + 0x28], eax
00efb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f00 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00f05 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00f0a 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00f0f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00f14 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00f19 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00f1e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00f23 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00f28 89442448                       mov        dword ptr [rsp + 0x48], eax
00f2c 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00f31 4489542458                     mov        dword ptr [rsp + 0x58], r10d
00f36 44896c2460                     mov        dword ptr [rsp + 0x60], r13d
00f3b 89542464                       mov        dword ptr [rsp + 0x64], edx
00f3f 90                             nop        
00f40 c5f877                         vzeroupper 
00f43 e81800b6ff                     call       0x7f75ef9d7d60
00f48 0f1f840040100015               nop        dword ptr [rax + rax + 0x15001040]
00f50 be45ffffff                     mov        esi, 0xffffff45
00f55 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
00f5d 488f8424b0000000               pop        qword ptr [rsp + 0xb0]
00f65 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00f6a 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00f72 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f77 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f7c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00f81 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00f86 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00f8b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00f90 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00f95 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00f9a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00f9f 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00fa4 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00fa9 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00fae 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00fb3 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00fb8 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00fbd 89442450                       mov        dword ptr [rsp + 0x50], eax
00fc1 89542454                       mov        dword ptr [rsp + 0x54], edx
00fc5 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00fca 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00fcf 44896c2468                     mov        dword ptr [rsp + 0x68], r13d
00fd4 c5f877                         vzeroupper 
00fd7 e884ffb5ff                     call       0x7f75ef9d7d60
00fdc 0f1f8400d4100016               nop        dword ptr [rax + rax + 0x160010d4]
00fe4 bee4ffffff                     mov        esi, 0xffffffe4
00fe9 488bac24b8000000               mov        rbp, qword ptr [rsp + 0xb8]
00ff1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00ff6 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00ffe 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01003 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
0100b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01010 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01015 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0101a 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
01022 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01027 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0102c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01031 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01036 48894424f8                     mov        qword ptr [rsp - 8], rax
0103b 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0103f 89442428                       mov        dword ptr [rsp + 0x28], eax
01043 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01048 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0104d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01052 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01057 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0105c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01061 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01066 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0106b 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01070 89442448                       mov        dword ptr [rsp + 0x48], eax
01074 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
01078 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0107d 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01082 89542468                       mov        dword ptr [rsp + 0x68], edx
01086 6690                           nop        
01088 c5f877                         vzeroupper 
0108b e8d0feb5ff                     call       0x7f75ef9d7d60
01090 0f1f840088110017               nop        dword ptr [rax + rax + 0x17001188]
01098 bef6ffffff                     mov        esi, 0xfffffff6
0109d 666690                         nop        
010a0 c5f877                         vzeroupper 
010a3 e8b8feb5ff                     call       0x7f75ef9d7d60
010a8 0f1f8400a0110018               nop        dword ptr [rax + rax + 0x180011a0]
010b0 488bf0                         mov        rsi, rax
010b3 c5f877                         vzeroupper 
010b6 4881c4a0000000                 add        rsp, 0xa0
010bd 5d                             pop        rbp
010be e99d2ab6ff                     jmp        0x7f75ef9da960
010c3 49ba5d72e7ef757f0000           movabs     r10, 0x7f75efe7725d
010cd 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
010d4 e907b0a9ff                     jmp        0x7f75ef912ee0
010d9 e8c27ba8ff                     call       0x7f75ef8ffaa0
010de e95befffff                     jmp        0x7f75efe76e3e
010e3 f4                             hlt        
010e4 f4                             hlt        
010e5 f4                             hlt        
010e6 f4                             hlt        
010e7 f4                             hlt        
