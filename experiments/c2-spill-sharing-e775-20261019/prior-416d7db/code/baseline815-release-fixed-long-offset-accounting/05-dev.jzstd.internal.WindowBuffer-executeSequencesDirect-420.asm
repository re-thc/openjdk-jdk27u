00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85408ba9ff                   jne        0x7f897b90f960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881eca0000000                 sub        rsp, 0xa0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f8597100000                   jne        0x7f897be77ed5
0003e 8bc7                           mov        eax, edi
00040 4c894c2420                     mov        qword ptr [rsp + 0x20], r9
00045 498bd8                         mov        rbx, r8
00048 894c240c                       mov        dword ptr [rsp + 0xc], ecx
0004c 4c8bf6                         mov        r14, rsi
0004f 448b563c                       mov        r10d, dword ptr [rsi + 0x3c]
00053 448b4638                       mov        r8d, dword ptr [rsi + 0x38]
00057 418bc8                         mov        ecx, r8d
0005a 412bca                         sub        ecx, r10d
0005d 448b8c24b0000000               mov        r9d, dword ptr [rsp + 0xb0]
00065 443bc9                         cmp        r9d, ecx
00068 0f8f920a0000                   jg         0x7f897be77900
0006e 4c8b5e08                       mov        r11, qword ptr [rsi + 8]
00072 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00077 4c8b5e20                       mov        r11, qword ptr [rsi + 0x20]
0007b 48638c24b0000000               movsxd     rcx, dword ptr [rsp + 0xb0]
00083 4963fa                         movsxd     rdi, r10d
00086 48037c2440                     add        rdi, qword ptr [rsp + 0x40]
0008b 4c2bdf                         sub        r11, rdi
0008e 493bcb                         cmp        rcx, r11
00091 0f8f8d0a0000                   jg         0x7f897be77924
00097 4c8b5e10                       mov        r11, qword ptr [rsi + 0x10]
0009b 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
000a0 4c8b5e28                       mov        r11, qword ptr [rsi + 0x28]
000a4 448b4e44                       mov        r9d, dword ptr [rsi + 0x44]
000a8 4d85db                         test       r11, r11
000ab 0f8547070000                   jne        0x7f897be775f8
000b1 4803f9                         add        rdi, rcx
000b4 483b7c2448                     cmp        rdi, qword ptr [rsp + 0x48]
000b9 0f8f8d0a0000                   jg         0x7f897be7794c
000bf 488bfa                         mov        rdi, rdx
000c2 8b7208                         mov        esi, dword ptr [rdx + 8]
000c5 33c9                           xor        ecx, ecx
000c7 448bd8                         mov        r11d, eax
000ca 4585db                         test       r11d, r11d
000cd 0f8e8d020000                   jle        0x7f897be77160
000d3 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
000d8 448d6ee0                       lea        r13d, [rsi - 0x20]
000dc 4489442438                     mov        dword ptr [rsp + 0x38], r8d
000e1 4183c0e0                       add        r8d, -0x20
000e5 488b4c2440                     mov        rcx, qword ptr [rsp + 0x40]
000ea 48f7d9                         neg        rcx
000ed 448b5308                       mov        r10d, dword ptr [rbx + 8]
000f1 4585d2                         test       r10d, r10d
000f4 0f867e060000                   jbe        0x7f897be77578
000fa 4963d3                         movsxd     rdx, r11d
000fd 4d63d2                         movsxd     r10, r10d
00100 48ffca                         dec        rdx
00103 493bd2                         cmp        rdx, r10
00106 0f836c060000                   jae        0x7f897be77578
0010c 488bac24b8000000               mov        rbp, qword ptr [rsp + 0xb8]
00114 8b4508                         mov        eax, dword ptr [rbp + 8]
00117 85c0                           test       eax, eax
00119 0f8641070000                   jbe        0x7f897be77660
0011f 448d56f1                       lea        r10d, [rsi - 0xf]
00123 4585d2                         test       r10d, r10d
00126 0f8c34070000                   jl         0x7f897be77660
0012c 418b5108                       mov        edx, dword ptr [r9 + 8]
00130 448d52f1                       lea        r10d, [rdx - 0xf]
00134 4585d2                         test       r10d, r10d
00137 0f8c23070000                   jl         0x7f897be77660
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
001bb 458bea                         mov        r13d, r10d
001be 498bcb                         mov        rcx, r11
001c1 48c1f924                       sar        rcx, 0x24
001c5 458bd3                         mov        r10d, r11d
001c8 8bc9                           mov        ecx, ecx
001ca 4181e2ffff0100                 and        r10d, 0x1ffff
001d1 85c9                           test       ecx, ecx
001d3 0f8ccf090000                   jl         0x7f897be779a8
001d9 4585d2                         test       r10d, r10d
001dc 0f84a2020000                   je         0x7f897be77284
001e2 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
001e6 412be9                         sub        ebp, r9d
001e9 443bd5                         cmp        r10d, ebp
001ec 0f8f1a0b0000                   jg         0x7f897be77b0c
001f2 418bfa                         mov        edi, r10d
001f5 83f903                         cmp        ecx, 3
001f8 0f8f91020000                   jg         0x7f897be7728f
001fe 85ff                           test       edi, edi
00200 0f84260b0000                   je         0x7f897be77b2c
00206 83f901                         cmp        ecx, 1
00209 0f8521070000                   jne        0x7f897be77730
0020f 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00214 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
00218 418bc2                         mov        eax, r10d
0021b 4863cf                         movsxd     rcx, edi
0021e 4c635c243c                     movsxd     r11, dword ptr [rsp + 0x3c]
00223 4c035c2440                     add        r11, qword ptr [rsp + 0x40]
00228 4c03d9                         add        r11, rcx
0022b 4c63d0                         movsxd     r10, eax
0022e 4d3bd3                         cmp        r10, r11
00231 0f8f190a0000                   jg         0x7f897be77a50
00237 85c0                           test       eax, eax
00239 0f8ec4060000                   jle        0x7f897be77703
0023f 458d1439                       lea        r10d, [r9 + rdi]
00243 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00248 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0024d 4403df                         add        r11d, edi
00250 4503dd                         add        r11d, r13d
00253 443b5c2468                     cmp        r11d, dword ptr [rsp + 0x68]
00258 0f8f68020000                   jg         0x7f897be772c6
0025e 443b542464                     cmp        r10d, dword ptr [rsp + 0x64]
00263 0f8f7b0b0000                   jg         0x7f897be77be4
00269 83ff10                         cmp        edi, 0x10
0026c 0f8f260c0000                   jg         0x7f897be77c98
00272 443b4c246c                     cmp        r9d, dword ptr [rsp + 0x6c]
00277 0f83e7020000                   jae        0x7f897be77364
0027d 418be9                         mov        ebp, r9d
00280 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00285 c4c17a6f442a0c                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0xc]
0028c 8b5c243c                       mov        ebx, dword ptr [rsp + 0x3c]
00290 3b5c2478                       cmp        ebx, dword ptr [rsp + 0x78]
00294 0f837a030000                   jae        0x7f897be77414
0029a 448d142f                       lea        r10d, [rdi + rbp]
0029e 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
002a3 448d141f                       lea        r10d, [rdi + rbx]
002a7 418bfa                         mov        edi, r10d
002aa 4c63cb                         movsxd     r9, ebx
002ad 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
002b2 c4817a7f440b0c                 vmovdqu    xmmword ptr [r11 + r9 + 0xc], xmm0
002b9 418bea                         mov        ebp, r10d
002bc 2be8                           sub        ebp, eax
002be 458bd5                         mov        r10d, r13d
002c1 4183fa10                       cmp        r10d, 0x10
002c5 0f8e810c0000                   jle        0x7f897be77d4c
002cb 413bc5                         cmp        eax, r13d
002ce 0f8c14070000                   jl         0x7f897be777e8
002d4 458bd5                         mov        r10d, r13d
002d7 4183fa30                       cmp        r10d, 0x30
002db 0f8e97070000                   jle        0x7f897be77878
002e1 85ed                           test       ebp, ebp
002e3 0f8cdd030000                   jl         0x7f897be774c6
002e9 448bd7                         mov        r10d, edi
002ec 4585d2                         test       r10d, r10d
002ef 0f8cd1030000                   jl         0x7f897be774c6
002f5 458bdd                         mov        r11d, r13d
002f8 4403dd                         add        r11d, ebp
002fb 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
00300 453bd3                         cmp        r10d, r11d
00303 0f82bd030000                   jb         0x7f897be774c6
00309 428d1c2f                       lea        ebx, [rdi + r13]
0030d 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
00311 443bd3                         cmp        r10d, ebx
00314 0f82ac030000                   jb         0x7f897be774c6
0031a 458bd5                         mov        r10d, r13d
0031d 4585d2                         test       r10d, r10d
00320 0f8496030000                   je         0x7f897be774bc
00326 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0032b 498d7c2a0c                     lea        rdi, [r10 + rbp + 0xc]
00330 4903c9                         add        rcx, r9
00333 498d740a0c                     lea        rsi, [r10 + rcx + 0xc]
00338 4963d5                         movsxd     rdx, r13d
0033b 4883fa20                       cmp        rdx, 0x20
0033f 762f                           jbe        0x7f897be77170
00341 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00346 c5f877                         vzeroupper 
00349 49ba209f8f7b897f0000           movabs     r10, 0x7f897b8f9f20
00353 41ffd2                         call       r10
00356 0f1f840000000000               nop        dword ptr [rax + rax]
0035e eb38                           jmp        0x7f897be77198
00360 4585c9                         test       r9d, r9d
00363 0f84ef030000                   je         0x7f897be77558
00369 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
0036e eb78                           jmp        0x7f897be771e8
00370 458bd5                         mov        r10d, r13d
00373 4d63d2                         movsxd     r10, r10d
00376 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0037d c442a8f5db                     bzhi       r11, r11, r10
00382 c4c1fb92fb                     kmovq      k7, r11
00387 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0038d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00393 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00398 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0039d 41ffc3                         inc        r11d
003a0 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
003a5 7d0d                           jge        0x7f897be771b4
003a7 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
003ac 458bc3                         mov        r8d, r11d
003af e9ecfdffff                     jmp        0x7f897be76fa0
003b4 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
003b9 442b44247c                     sub        r8d, dword ptr [rsp + 0x7c]
003be 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
003c2 85c9                           test       ecx, ecx
003c4 0f8c1e050000                   jl         0x7f897be776e8
003ca 4c8bb424b8000000               mov        r14, qword ptr [rsp + 0xb8]
003d2 488b7c2450                     mov        rdi, qword ptr [rsp + 0x50]
003d7 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
003dc 8bb424b4000000                 mov        esi, dword ptr [rsp + 0xb4]
003e3 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
003e8 4585d2                         test       r10d, r10d
003eb 0f8c2c010000                   jl         0x7f897be7731d
003f1 3b74240c                       cmp        esi, dword ptr [rsp + 0xc]
003f5 0f8227010000                   jb         0x7f897be77322
003fb 438d1c02                       lea        ebx, [r10 + r8]
003ff 458b5908                       mov        r11d, dword ptr [r9 + 8]
00403 443bdb                         cmp        r11d, ebx
00406 0f821b010000                   jb         0x7f897be77327
0040c 4585c0                         test       r8d, r8d
0040f 0f8c17010000                   jl         0x7f897be7732c
00415 4585c0                         test       r8d, r8d
00418 7436                           je         0x7f897be77250
0041a 488d7c0f0c                     lea        rdi, [rdi + rcx + 0xc]
0041f 4d8bd9                         mov        r11, r9
00422 4b8d74110c                     lea        rsi, [r9 + r10 + 0xc]
00427 4963d0                         movsxd     rdx, r8d
0042a 4883fa20                       cmp        rdx, 0x20
0042e 773a                           ja         0x7f897be7726a
00430 4d63d0                         movsxd     r10, r8d
00433 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0043a c442a8f5db                     bzhi       r11, r11, r10
0043f c4c1fb92fb                     kmovq      k7, r11
00444 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0044a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00450 41895e3c                       mov        dword ptr [r14 + 0x3c], ebx
00454 c5f877                         vzeroupper 
00457 4881c4a0000000                 add        rsp, 0xa0
0045e 5d                             pop        rbp
0045f 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00463 0f87560c0000                   ja         0x7f897be77ebf
00469 c3                             ret        
0046a c5f877                         vzeroupper 
0046d 49ba209f8f7b897f0000           movabs     r10, 0x7f897b8f9f20
00477 41ffd2                         call       r10
0047a 0f1f840000000000               nop        dword ptr [rax + rax]
00482 ebcc                           jmp        0x7f897be77250
00484 4533d2                         xor        r10d, r10d
00487 418bfa                         mov        edi, r10d
0048a e966fdffff                     jmp        0x7f897be76ff5
0048f 83c1fd                         add        ecx, -3
00492 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00497 4183fb02                       cmp        r11d, 2
0049b 0f863f0b0000                   jbe        0x7f897be77de0
004a1 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
004a6 458b5a10                       mov        r11d, dword ptr [r10 + 0x10]
004aa 45895a14                       mov        dword ptr [r10 + 0x14], r11d
004ae 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
004b2 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
004b7 45895310                       mov        dword ptr [r11 + 0x10], r10d
004bb 41894b0c                       mov        dword ptr [r11 + 0xc], ecx
004bf 8bc1                           mov        eax, ecx
004c1 e955fdffff                     jmp        0x7f897be7701b
004c6 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
004cb 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
004d0 498bf2                         mov        rsi, r10
004d3 44898c24b0000000               mov        dword ptr [rsp + 0xb0], r9d
004db 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
004df 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
004e4 890424                         mov        dword ptr [rsp], eax
004e7 44896c2408                     mov        dword ptr [rsp + 8], r13d
004ec 4889b42480000000               mov        qword ptr [rsp + 0x80], rsi
004f4 8b6c2468                       mov        ebp, dword ptr [rsp + 0x68]
004f8 89bc248c000000                 mov        dword ptr [rsp + 0x8c], edi
004ff 8b54243c                       mov        edx, dword ptr [rsp + 0x3c]
00503 90                             nop        
00504 c5f877                         vzeroupper 
00507 e85495a9ff                     call       0x7f897b910860
0050c 0f1f840004060000               nop        dword ptr [rax + rax + 0x604]
00514 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00518 e97bfeffff                     jmp        0x7f897be77198
0051d 418bea                         mov        ebp, r10d
00520 eb0d                           jmp        0x7f897be7732f
00522 418bea                         mov        ebp, r10d
00525 eb08                           jmp        0x7f897be7732f
00527 418bea                         mov        ebp, r10d
0052a eb03                           jmp        0x7f897be7732f
0052c 418bea                         mov        ebp, r10d
0052f beccffffff                     mov        esi, 0xffffffcc
00534 4c89b424b0000000               mov        qword ptr [rsp + 0xb0], r14
0053c 48897c2410                     mov        qword ptr [rsp + 0x10], rdi
00541 898c24bc000000                 mov        dword ptr [rsp + 0xbc], ecx
00548 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0054d 4489442418                     mov        dword ptr [rsp + 0x18], r8d
00552 6690                           nop        
00554 c5f877                         vzeroupper 
00557 e8040ab6ff                     call       0x7f897b9d7d60
0055c 0f1f840054060001               nop        dword ptr [rax + rax + 0x1000654]
00564 bee4ffffff                     mov        esi, 0xffffffe4
00569 488bac24b8000000               mov        rbp, qword ptr [rsp + 0xb8]
00571 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00576 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
0057e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00583 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00588 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0058d 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00595 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0059a 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0059f 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
005a4 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
005a9 48894424f8                     mov        qword ptr [rsp - 8], rax
005ae 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
005b2 89442428                       mov        dword ptr [rsp + 0x28], eax
005b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
005bb 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
005c0 4489542430                     mov        dword ptr [rsp + 0x30], r10d
005c5 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
005ca 4c89542438                     mov        qword ptr [rsp + 0x38], r10
005cf 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
005d4 4c89542440                     mov        qword ptr [rsp + 0x40], r10
005d9 4489442434                     mov        dword ptr [rsp + 0x34], r8d
005de 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
005e3 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
005e8 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
005ed 4c89542458                     mov        qword ptr [rsp + 0x58], r10
005f2 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
005f7 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
005fc 897c2468                       mov        dword ptr [rsp + 0x68], edi
00600 89442470                       mov        dword ptr [rsp + 0x70], eax
00604 c5f877                         vzeroupper 
00607 e85409b6ff                     call       0x7f897b9d7d60
0060c 0f1f840004070002               nop        dword ptr [rax + rax + 0x2000704]
00614 bee4ffffff                     mov        esi, 0xffffffe4
00619 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
00621 488f8424b0000000               pop        qword ptr [rsp + 0xb0]
00629 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00631 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00636 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0063b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00640 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00645 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0064a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0064f 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00654 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00659 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0065e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00663 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00668 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0066d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00672 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00677 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
0067c 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00681 895c2454                       mov        dword ptr [rsp + 0x54], ebx
00685 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0068a 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0068f 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00694 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00699 897c2468                       mov        dword ptr [rsp + 0x68], edi
0069d 8944246c                       mov        dword ptr [rsp + 0x6c], eax
006a1 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
006aa 6690                           nop        
006ac c5f877                         vzeroupper 
006af e8ac08b6ff                     call       0x7f897b9d7d60
006b4 0f1f8400ac070003               nop        dword ptr [rax + rax + 0x30007ac]
006bc 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
006c1 e9d2fcffff                     jmp        0x7f897be77198
006c6 beccffffff                     mov        esi, 0xffffffcc
006cb 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
006d3 488f8424b0000000               pop        qword ptr [rsp + 0xb0]
006db 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
006e0 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
006e8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
006ed 4c89542418                     mov        qword ptr [rsp + 0x18], r10
006f2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
006f7 4489542420                     mov        dword ptr [rsp + 0x20], r10d
006fc 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00701 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00706 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0070b 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00710 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00715 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0071a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0071f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00724 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00729 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0072e 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00733 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
00738 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0073d 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00742 897c2468                       mov        dword ptr [rsp + 0x68], edi
00746 6690                           nop        
00748 c5f877                         vzeroupper 
0074b e81008b6ff                     call       0x7f897b9d7d60
00750 0f1f840048080004               nop        dword ptr [rax + rax + 0x4000848]
00758 bef6ffffff                     mov        esi, 0xfffffff6
0075d 488bea                         mov        rbp, rdx
00760 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
00768 c5f877                         vzeroupper 
0076b e8f007b6ff                     call       0x7f897b9d7d60
00770 0f1f840068080005               nop        dword ptr [rax + rax + 0x5000868]
00778 be6effffff                     mov        esi, 0xffffff6e
0077d 498bee                         mov        rbp, r14
00780 4889bc24b0000000               mov        qword ptr [rsp + 0xb0], rdi
00788 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
0078d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00792 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00797 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0079c 48894424f8                     mov        qword ptr [rsp - 8], rax
007a1 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
007a5 89442428                       mov        dword ptr [rsp + 0x28], eax
007a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
007ae 48894424f8                     mov        qword ptr [rsp - 8], rax
007b3 8b442438                       mov        eax, dword ptr [rsp + 0x38]
007b7 8944242c                       mov        dword ptr [rsp + 0x2c], eax
007bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
007c0 48ff742440                     push       qword ptr [rsp + 0x40]
007c5 488f442430                     pop        qword ptr [rsp + 0x30]
007ca 48ff742448                     push       qword ptr [rsp + 0x48]
007cf 488f442438                     pop        qword ptr [rsp + 0x38]
007d4 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
007d9 48894c2448                     mov        qword ptr [rsp + 0x48], rcx
007de 4489442444                     mov        dword ptr [rsp + 0x44], r8d
007e3 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
007e8 c5f877                         vzeroupper 
007eb e87007b6ff                     call       0x7f897b9d7d60
007f0 0f1f8400e8080006               nop        dword ptr [rax + rax + 0x60008e8]
007f8 33c9                           xor        ecx, ecx
007fa 4c3bd9                         cmp        r11, rcx
007fd bdffffffff                     mov        ebp, 0xffffffff
00802 7c08                           jl         0x7f897be7760c
00804 400f95c5                       setne      bpl
00808 400fb6ed                       movzx      ebp, bpl
0080c be45ffffff                     mov        esi, 0xffffff45
00811 4c89b424b0000000               mov        qword ptr [rsp + 0xb0], r14
00819 4889542410                     mov        qword ptr [rsp + 0x10], rdx
0081e 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
00823 89442428                       mov        dword ptr [rsp + 0x28], eax
00827 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0082c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00831 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00836 48ff742440                     push       qword ptr [rsp + 0x40]
0083b 488f442438                     pop        qword ptr [rsp + 0x38]
00840 48ff742448                     push       qword ptr [rsp + 0x48]
00845 488f442440                     pop        qword ptr [rsp + 0x40]
0084a 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
0084f 90                             nop        
00850 c5f877                         vzeroupper 
00853 e80807b6ff                     call       0x7f897b9d7d60
00858 0f1f840050090007               nop        dword ptr [rax + rax + 0x7000950]
00860 bebeffffff                     mov        esi, 0xffffffbe
00865 4c89b424b0000000               mov        qword ptr [rsp + 0xb0], r14
0086d 4889bc24b8000000               mov        qword ptr [rsp + 0xb8], rdi
00875 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
0087a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0087f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00884 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
00889 48894424f8                     mov        qword ptr [rsp - 8], rax
0088e 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00892 89442428                       mov        dword ptr [rsp + 0x28], eax
00896 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0089b 48894424f8                     mov        qword ptr [rsp - 8], rax
008a0 8b442438                       mov        eax, dword ptr [rsp + 0x38]
008a4 8944242c                       mov        dword ptr [rsp + 0x2c], eax
008a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008ad 48ff742440                     push       qword ptr [rsp + 0x40]
008b2 488f442430                     pop        qword ptr [rsp + 0x30]
008b7 48ff742448                     push       qword ptr [rsp + 0x48]
008bc 488f442438                     pop        qword ptr [rsp + 0x38]
008c1 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
008c6 48894c2448                     mov        qword ptr [rsp + 0x48], rcx
008cb 4489442444                     mov        dword ptr [rsp + 0x44], r8d
008d0 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
008d5 666690                         nop        
008d8 c5f877                         vzeroupper 
008db e88006b6ff                     call       0x7f897b9d7d60
008e0 0f1f8400d8090008               nop        dword ptr [rax + rax + 0x80009d8]
008e8 8b6c243c                       mov        ebp, dword ptr [rsp + 0x3c]
008ec 4c8bb424b8000000               mov        r14, qword ptr [rsp + 0xb8]
008f4 488b7c2450                     mov        rdi, qword ptr [rsp + 0x50]
008f9 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
008fe e92cfcffff                     jmp        0x7f897be7732f
00903 be45ffffff                     mov        esi, 0xffffff45
00908 488bac24b8000000               mov        rbp, qword ptr [rsp + 0xb8]
00910 4c899c24b8000000               mov        qword ptr [rsp + 0xb8], r11
00918 898424b4000000                 mov        dword ptr [rsp + 0xb4], eax
0091f 90                             nop        
00920 c5f877                         vzeroupper 
00923 e83806b6ff                     call       0x7f897b9d7d60
00928 0f1f8400200a0009               nop        dword ptr [rax + rax + 0x9000a20]
00930 ffc9                           dec        ecx
00932 be45ffffff                     mov        esi, 0xffffff45
00937 488bac24b8000000               mov        rbp, qword ptr [rsp + 0xb8]
0093f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00944 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
0094c 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00951 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
00959 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0095e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00963 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00968 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00970 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00975 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0097a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0097f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00984 48894424f8                     mov        qword ptr [rsp - 8], rax
00989 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0098d 89442428                       mov        dword ptr [rsp + 0x28], eax
00991 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00996 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0099b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
009a0 4489542430                     mov        dword ptr [rsp + 0x30], r10d
009a5 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
009aa 4c89542438                     mov        qword ptr [rsp + 0x38], r10
009af 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
009b4 4c89542440                     mov        qword ptr [rsp + 0x40], r10
009b9 4489442434                     mov        dword ptr [rsp + 0x34], r8d
009be 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
009c3 894c2458                       mov        dword ptr [rsp + 0x58], ecx
009c7 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
009cc 4489542460                     mov        dword ptr [rsp + 0x60], r10d
009d1 897c2464                       mov        dword ptr [rsp + 0x64], edi
009d5 666690                         nop        
009d8 c5f877                         vzeroupper 
009db e88005b6ff                     call       0x7f897b9d7d60
009e0 0f1f8400d80a000a               nop        dword ptr [rax + rax + 0xa000ad8]
009e8 be45ffffff                     mov        esi, 0xffffff45
009ed 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
009f5 488f8424b0000000               pop        qword ptr [rsp + 0xb0]
009fd 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00a02 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00a0a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00a0f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00a14 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00a19 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00a1e 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00a23 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00a28 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00a2d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00a32 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00a37 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00a3c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00a41 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00a46 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00a4b 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00a50 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
00a55 897c2454                       mov        dword ptr [rsp + 0x54], edi
00a59 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00a5e 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00a63 8944246c                       mov        dword ptr [rsp + 0x6c], eax
00a67 90                             nop        
00a68 c5f877                         vzeroupper 
00a6b e8f004b6ff                     call       0x7f897b9d7d60
00a70 0f1f8400680b000b               nop        dword ptr [rax + rax + 0xb000b68]
00a78 be45ffffff                     mov        esi, 0xffffff45
00a7d 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
00a85 488f8424b0000000               pop        qword ptr [rsp + 0xb0]
00a8d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00a92 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00a9a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00a9f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00aa4 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00aa9 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00aae 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00ab3 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00ab8 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00abd 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00ac2 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00ac7 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00acc 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00ad1 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00ad6 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00adb 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00ae0 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00ae5 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
00aea 897c2454                       mov        dword ptr [rsp + 0x54], edi
00aee 6690                           nop        
00af0 c5f877                         vzeroupper 
00af3 e86804b6ff                     call       0x7f897b9d7d60
00af8 0f1f8400f00b000c               nop        dword ptr [rax + rax + 0xc000bf0]
00b00 be45ffffff                     mov        esi, 0xffffff45
00b05 8bac24b0000000                 mov        ebp, dword ptr [rsp + 0xb0]
00b0c 898c24b0000000                 mov        dword ptr [rsp + 0xb0], ecx
00b13 90                             nop        
00b14 c5f877                         vzeroupper 
00b17 e84404b6ff                     call       0x7f897b9d7d60
00b1c 0f1f8400140c000d               nop        dword ptr [rax + rax + 0xd000c14]
00b24 493bcb                         cmp        rcx, r11
00b27 bdffffffff                     mov        ebp, 0xffffffff
00b2c 7c08                           jl         0x7f897be77936
00b2e 400f95c5                       setne      bpl
00b32 400fb6ed                       movzx      ebp, bpl
00b36 be45ffffff                     mov        esi, 0xffffff45
00b3b 90                             nop        
00b3c c5f877                         vzeroupper 
00b3f e81c04b6ff                     call       0x7f897b9d7d60
00b44 0f1f84003c0c000e               nop        dword ptr [rax + rax + 0xe000c3c]
00b4c 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00b51 493bfb                         cmp        rdi, r11
00b54 bdffffffff                     mov        ebp, 0xffffffff
00b59 7c08                           jl         0x7f897be77963
00b5b 400f95c5                       setne      bpl
00b5f 400fb6ed                       movzx      ebp, bpl
00b63 be45ffffff                     mov        esi, 0xffffff45
00b68 4c89b424b0000000               mov        qword ptr [rsp + 0xb0], r14
00b70 4889542410                     mov        qword ptr [rsp + 0x10], rdx
00b75 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
00b7a 89442428                       mov        dword ptr [rsp + 0x28], eax
00b7e 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00b83 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00b88 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00b8d 48ff742440                     push       qword ptr [rsp + 0x40]
00b92 488f442438                     pop        qword ptr [rsp + 0x38]
00b97 90                             nop        
00b98 c5f877                         vzeroupper 
00b9b e8c003b6ff                     call       0x7f897b9d7d60
00ba0 0f1f8400980c000f               nop        dword ptr [rax + rax + 0xf000c98]
00ba8 be45ffffff                     mov        esi, 0xffffff45
00bad 488bac24b8000000               mov        rbp, qword ptr [rsp + 0xb8]
00bb5 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00bba 4c899c24b0000000               mov        qword ptr [rsp + 0xb0], r11
00bc2 8b5c240c                       mov        ebx, dword ptr [rsp + 0xc]
00bc6 899c24b8000000                 mov        dword ptr [rsp + 0xb8], ebx
00bcd 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00bd2 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00bd7 8b5c2428                       mov        ebx, dword ptr [rsp + 0x28]
00bdb 899c24bc000000                 mov        dword ptr [rsp + 0xbc], ebx
00be2 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
00be7 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
00bec 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00bf1 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00bf6 48894424f8                     mov        qword ptr [rsp - 8], rax
00bfb 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00bff 89442428                       mov        dword ptr [rsp + 0x28], eax
00c03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c08 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00c0d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00c12 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00c17 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00c1c 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
00c21 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00c26 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00c2b 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00c30 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00c35 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
00c3a 894c2450                       mov        dword ptr [rsp + 0x50], ecx
00c3e 6690                           nop        
00c40 c5f877                         vzeroupper 
00c43 e81803b6ff                     call       0x7f897b9d7d60
00c48 0f1f8400400d0010               nop        dword ptr [rax + rax + 0x10000d40]
00c50 498bcb                         mov        rcx, r11
00c53 4d3bd3                         cmp        r10, r11
00c56 bdffffffff                     mov        ebp, 0xffffffff
00c5b 7c08                           jl         0x7f897be77a65
00c5d 400f95c5                       setne      bpl
00c61 400fb6ed                       movzx      ebp, bpl
00c65 be45ffffff                     mov        esi, 0xffffff45
00c6a 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
00c72 488f8424b0000000               pop        qword ptr [rsp + 0xb0]
00c7a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00c7f 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00c87 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00c8c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c91 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00c96 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00c9b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00ca0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00ca5 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00caa 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00caf 48894424f8                     mov        qword ptr [rsp - 8], rax
00cb4 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00cb8 89442430                       mov        dword ptr [rsp + 0x30], eax
00cbc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cc1 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00cc6 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
00ccb 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
00cd0 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00cd5 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00cda 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00cdf 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
00ce4 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00ce9 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00cee 897c2464                       mov        dword ptr [rsp + 0x64], edi
00cf2 89442468                       mov        dword ptr [rsp + 0x68], eax
00cf6 48894c2470                     mov        qword ptr [rsp + 0x70], rcx
00cfb 90                             nop        
00cfc c5f877                         vzeroupper 
00cff e85c02b6ff                     call       0x7f897b9d7d60
00d04 0f1f8400fc0d0011               nop        dword ptr [rax + rax + 0x11000dfc]
00d0c be45ffffff                     mov        esi, 0xffffff45
00d11 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
00d19 666690                         nop        
00d1c c5f877                         vzeroupper 
00d1f e83c02b6ff                     call       0x7f897b9d7d60
00d24 0f1f84001c0e0012               nop        dword ptr [rax + rax + 0x12000e1c]
00d2c ffc9                           dec        ecx
00d2e be45ffffff                     mov        esi, 0xffffff45
00d33 488bac24b8000000               mov        rbp, qword ptr [rsp + 0xb8]
00d3b 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00d40 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00d48 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00d4d 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
00d55 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00d5a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d5f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00d64 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00d6c 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00d71 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00d76 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00d7b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00d80 48894424f8                     mov        qword ptr [rsp - 8], rax
00d85 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00d89 89442428                       mov        dword ptr [rsp + 0x28], eax
00d8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d92 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00d97 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00d9c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00da1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00da6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00dab 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00db0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00db5 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00dba 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
00dbf 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
00dc3 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00dc8 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00dcd 897c246c                       mov        dword ptr [rsp + 0x6c], edi
00dd1 666690                         nop        
00dd4 c5f877                         vzeroupper 
00dd7 e88401b6ff                     call       0x7f897b9d7d60
00ddc 0f1f8400d40e0013               nop        dword ptr [rax + rax + 0x13000ed4]
00de4 be45ffffff                     mov        esi, 0xffffff45
00de9 488bac24b8000000               mov        rbp, qword ptr [rsp + 0xb8]
00df1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00df6 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00dfe 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00e03 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
00e0b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e10 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e15 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00e1a 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00e22 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00e27 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00e2c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00e31 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00e36 48894424f8                     mov        qword ptr [rsp - 8], rax
00e3b 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00e3f 89442428                       mov        dword ptr [rsp + 0x28], eax
00e43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e48 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00e4d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00e52 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00e57 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00e5c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00e61 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00e66 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00e6b 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00e70 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
00e75 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00e7a 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00e7f 897c2460                       mov        dword ptr [rsp + 0x60], edi
00e83 89442468                       mov        dword ptr [rsp + 0x68], eax
00e87 90                             nop        
00e88 c5f877                         vzeroupper 
00e8b e8d000b6ff                     call       0x7f897b9d7d60
00e90 0f1f8400880f0014               nop        dword ptr [rax + rax + 0x14000f88]
00e98 be45ffffff                     mov        esi, 0xffffff45
00e9d 488bac24b8000000               mov        rbp, qword ptr [rsp + 0xb8]
00ea5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00eaa 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00eb2 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00eb7 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
00ebf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ec4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ec9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00ece 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00ed6 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00edb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00ee0 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00ee5 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00eea 48894424f8                     mov        qword ptr [rsp - 8], rax
00eef 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00ef3 89442428                       mov        dword ptr [rsp + 0x28], eax
00ef7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00efc 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00f01 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00f06 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00f0b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00f10 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00f15 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00f1a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00f1f 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00f24 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
00f29 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00f2e 4489542458                     mov        dword ptr [rsp + 0x58], r10d
00f33 89442460                       mov        dword ptr [rsp + 0x60], eax
00f37 897c2464                       mov        dword ptr [rsp + 0x64], edi
00f3b 90                             nop        
00f3c c5f877                         vzeroupper 
00f3f e81c00b6ff                     call       0x7f897b9d7d60
00f44 0f1f84003c100015               nop        dword ptr [rax + rax + 0x1500103c]
00f4c be45ffffff                     mov        esi, 0xffffff45
00f51 48ffb424b8000000               push       qword ptr [rsp + 0xb8]
00f59 488f8424b0000000               pop        qword ptr [rsp + 0xb0]
00f61 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00f66 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00f6e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f73 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f78 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00f7d 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00f82 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00f87 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00f8c 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00f91 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00f96 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00f9b 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00fa0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00fa5 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00faa 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00faf 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00fb4 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00fb9 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
00fbe 897c2454                       mov        dword ptr [rsp + 0x54], edi
00fc2 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00fc7 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00fcc 89442468                       mov        dword ptr [rsp + 0x68], eax
00fd0 c5f877                         vzeroupper 
00fd3 e888ffb5ff                     call       0x7f897b9d7d60
00fd8 0f1f8400d0100016               nop        dword ptr [rax + rax + 0x160010d0]
00fe0 bee4ffffff                     mov        esi, 0xffffffe4
00fe5 488bac24b8000000               mov        rbp, qword ptr [rsp + 0xb8]
00fed 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00ff2 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00ffa 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00fff 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
01007 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0100c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01011 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01016 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
0101e 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01023 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01028 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0102d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01032 48894424f8                     mov        qword ptr [rsp - 8], rax
01037 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0103b 89442428                       mov        dword ptr [rsp + 0x28], eax
0103f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01044 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01049 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0104e 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01053 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01058 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0105d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01062 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01067 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0106c 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
01071 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
01075 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0107a 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0107f 897c2468                       mov        dword ptr [rsp + 0x68], edi
01083 90                             nop        
01084 c5f877                         vzeroupper 
01087 e8d4feb5ff                     call       0x7f897b9d7d60
0108c 0f1f840084110017               nop        dword ptr [rax + rax + 0x17001184]
01094 bef6ffffff                     mov        esi, 0xfffffff6
01099 666690                         nop        
0109c c5f877                         vzeroupper 
0109f e8bcfeb5ff                     call       0x7f897b9d7d60
010a4 0f1f84009c110018               nop        dword ptr [rax + rax + 0x1800119c]
010ac 488bf0                         mov        rsi, rax
010af c5f877                         vzeroupper 
010b2 4881c4a0000000                 add        rsp, 0xa0
010b9 5d                             pop        rbp
010ba e9a121b6ff                     jmp        0x7f897b9da060
010bf 49ba5f72e77b897f0000           movabs     r10, 0x7f897be7725f
010c9 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
010d0 e90bb0a9ff                     jmp        0x7f897b912ee0
010d5 e8c67ba8ff                     call       0x7f897b8ffaa0
010da e95fefffff                     jmp        0x7f897be76e3e
010df f4                             hlt        
