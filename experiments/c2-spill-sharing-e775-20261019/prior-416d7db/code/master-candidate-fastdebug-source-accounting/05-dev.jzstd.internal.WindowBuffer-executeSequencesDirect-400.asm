00000 90                             nop        
00001 90                             nop        
00002 90                             nop        
00003 90                             nop        
00004 90                             nop        
00005 90                             nop        
00006 90                             nop        
00007 90                             nop        
00008 90                             nop        
00009 90                             nop        
0000a 90                             nop        
0000b 90                             nop        
0000c 90                             nop        
0000d 90                             nop        
0000e 90                             nop        
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c0b6b5ff                   jne        0x7efc7b72ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ecc0000000                 sub        rsp, 0xc0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85a82a0000                   jne        0x7efc7bbd6166
0003e 4c894c2450                     mov        qword ptr [rsp + 0x50], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4d8bd8                         mov        r11, r8
00049 4889742460                     mov        qword ptr [rsp + 0x60], rsi
0004e 448b5638                       mov        r10d, dword ptr [rsi + 0x38]
00052 448b4e04                       mov        r9d, dword ptr [rsi + 4]
00056 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
0005b 452bca                         sub        r9d, r10d
0005e 8b9c24d0000000                 mov        ebx, dword ptr [rsp + 0xd0]
00065 413bd9                         cmp        ebx, r9d
00068 0f8f22220000                   jg         0x7efc7bbd5910
0006e 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00072 4c89442420                     mov        qword ptr [rsp + 0x20], r8
00077 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
0007b 48638c24d0000000               movsxd     rcx, dword ptr [rsp + 0xd0]
00083 4d63ca                         movsxd     r9, r10d
00086 4c034c2420                     add        r9, qword ptr [rsp + 0x20]
0008b 4d2bc1                         sub        r8, r9
0008e 493bc8                         cmp        rcx, r8
00091 0f8ff9210000                   jg         0x7efc7bbd5910
00097 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
0009b 4c89442458                     mov        qword ptr [rsp + 0x58], r8
000a0 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000a4 4d85c0                         test       r8, r8
000a7 0f8401140000                   je         0x7efc7bbd4b2e
000ad 33db                           xor        ebx, ebx
000af 4c8bf2                         mov        r14, rdx
000b2 8b7204                         mov        esi, dword ptr [rdx + 4]
000b5 4c8b4c2460                     mov        r9, qword ptr [rsp + 0x60]
000ba 418b4940                       mov        ecx, dword ptr [r9 + 0x40]
000be 448bef                         mov        r13d, edi
000c1 85ff                           test       edi, edi
000c3 0f8ecf1b0000                   jle        0x7efc7bbd5318
000c9 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
000d1 4c2b442420                     sub        r8, qword ptr [rsp + 0x20]
000d6 448d4ee0                       lea        r9d, [rsi - 0x20]
000da 8b7c2468                       mov        edi, dword ptr [rsp + 0x68]
000de 83c7e0                         add        edi, -0x20
000e1 418b5304                       mov        edx, dword ptr [r11 + 4]
000e5 85d2                           test       edx, edx
000e7 0f86cf210000                   jbe        0x7efc7bbd593c
000ed 4c63d2                         movsxd     r10, edx
000f0 4963d5                         movsxd     rdx, r13d
000f3 48ffca                         dec        rdx
000f6 493bd2                         cmp        rdx, r10
000f9 0f83bd210000                   jae        0x7efc7bbd593c
000ff 85db                           test       ebx, ebx
00101 0f84b5210000                   je         0x7efc7bbd593c
00107 488bac24d8000000               mov        rbp, qword ptr [rsp + 0xd8]
0010f 8b4504                         mov        eax, dword ptr [rbp + 4]
00112 85c0                           test       eax, eax
00114 0f8602220000                   jbe        0x7efc7bbd599c
0011a 83f801                         cmp        eax, 1
0011d 0f86f9210000                   jbe        0x7efc7bbd599c
00123 83f802                         cmp        eax, 2
00126 0f86f0210000                   jbe        0x7efc7bbd599c
0012c 448d56f1                       lea        r10d, [rsi - 0xf]
00130 4585d2                         test       r10d, r10d
00133 0f8ce3210000                   jl         0x7efc7bbd599c
00139 8b5104                         mov        edx, dword ptr [rcx + 4]
0013c 448d52f1                       lea        r10d, [rdx - 0xf]
00140 4585d2                         test       r10d, r10d
00143 0f8cd3210000                   jl         0x7efc7bbd599c
00149 448d52f9                       lea        r10d, [rdx - 7]
0014d 4585d2                         test       r10d, r10d
00150 0f8cc6210000                   jl         0x7efc7bbd599c
00156 899424d8000000                 mov        dword ptr [rsp + 0xd8], edx
0015d 898424d4000000                 mov        dword ptr [rsp + 0xd4], eax
00164 897c243c                       mov        dword ptr [rsp + 0x3c], edi
00168 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0016d 89b424d0000000                 mov        dword ptr [rsp + 0xd0], esi
00174 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
00178 4c89442470                     mov        qword ptr [rsp + 0x70], r8
0017d 48896c2430                     mov        qword ptr [rsp + 0x30], rbp
00182 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
00187 44896c2408                     mov        dword ptr [rsp + 8], r13d
0018c 4c89742440                     mov        qword ptr [rsp + 0x40], r14
00191 4c8bd1                         mov        r10, rcx
00194 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00199 894c2448                       mov        dword ptr [rsp + 0x48], ecx
0019d 448bd2                         mov        r10d, edx
001a0 448bc6                         mov        r8d, esi
001a3 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
001ab 458d5af9                       lea        r11d, [r10 - 7]
001af 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
001b4 4183c0f1                       add        r8d, -0xf
001b8 4489442478                     mov        dword ptr [rsp + 0x78], r8d
001bd 4d63da                         movsxd     r11, r10d
001c0 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
001c5 4183c2f1                       add        r10d, -0xf
001c9 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
001ce 4d8d53f9                       lea        r10, [r11 - 7]
001d2 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
001da 4533ed                         xor        r13d, r13d
001dd 4533c0                         xor        r8d, r8d
001e0 e968040000                     jmp        0x7efc7bbd3ccd
001e5 448bdd                         mov        r11d, ebp
001e8 4d63d3                         movsxd     r10, r11d
001eb 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
001f2 c442a8f5db                     bzhi       r11, r11, r10
001f7 c4c1fb92fb                     kmovq      k7, r11
001fc 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00202 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00208 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00210 4403d5                         add        r10d, ebp
00213 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
0021b 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0021f 418502                         test       dword ptr [r10], eax
00222 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
0022a 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
00232 0f8dd4090000                   jge        0x7efc7bbd428c
00238 899c24a4000000                 mov        dword ptr [rsp + 0xa4], ebx
0023f 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
00247 442b94248c000000               sub        r10d, dword ptr [rsp + 0x8c]
0024f 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00257 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
0025e 2bac248c000000                 sub        ebp, dword ptr [rsp + 0x8c]
00265 3bac248c000000                 cmp        ebp, dword ptr [rsp + 0x8c]
0026c 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00274 410f4fea                       cmovg      ebp, r10d
00278 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00280 4585d2                         test       r10d, r10d
00283 0f8c83190000                   jl         0x7efc7bbd528c
00289 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
00291 4585db                         test       r11d, r11d
00294 0f8c72190000                   jl         0x7efc7bbd528c
0029a 458d042a                       lea        r8d, [r10 + rbp]
0029e 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
002a6 453bd8                         cmp        r11d, r8d
002a9 0f825d190000                   jb         0x7efc7bbd528c
002af 8b9c24a4000000                 mov        ebx, dword ptr [rsp + 0xa4]
002b6 03dd                           add        ebx, ebp
002b8 443bdb                         cmp        r11d, ebx
002bb 0f824b190000                   jb         0x7efc7bbd528c
002c1 85ed                           test       ebp, ebp
002c3 0f8c43190000                   jl         0x7efc7bbd528c
002c9 85ed                           test       ebp, ebp
002cb 0f8437ffffff                   je         0x7efc7bbd3888
002d1 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
002d6 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
002de 4b8d741908                     lea        rsi, [r9 + r11 + 8]
002e3 4b8d7c1108                     lea        rdi, [r9 + r10 + 8]
002e8 4863d5                         movsxd     rdx, ebp
002eb 4883fa20                       cmp        rdx, 0x20
002ef 0f86f0feffff                   jbe        0x7efc7bbd3865
002f5 c5f877                         vzeroupper 
002f8 49ba4091717bfc7e0000           movabs     r10, 0x7efc7b719140
00302 41ffd2                         call       r10
00305 0f1f840000000000               nop        dword ptr [rax + rax]
0030d e9f6feffff                     jmp        0x7efc7bbd3888
00312 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
0031a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0031f c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
00326 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0032e 4503d8                         add        r11d, r8d
00331 e9f1020000                     jmp        0x7efc7bbd3ca7
00336 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0033b 4b8d7c1008                     lea        rdi, [r8 + r10 + 8]
00340 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00348 4b8d741808                     lea        rsi, [r8 + r11 + 8]
0034d 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00355 44039c249c000000               add        r11d, dword ptr [rsp + 0x9c]
0035d 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00365 4d63f3                         movsxd     r14, r11d
00368 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00370 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
00378 0f8c03060000                   jl         0x7efc7bbd4001
0037e 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
00386 4183f830                       cmp        r8d, 0x30
0038a 0f8ea3000000                   jle        0x7efc7bbd3ab3
00390 4585d2                         test       r10d, r10d
00393 0f8cd7170000                   jl         0x7efc7bbd51f0
00399 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
003a1 4585c0                         test       r8d, r8d
003a4 0f8cc6170000                   jl         0x7efc7bbd51f0
003aa 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
003b2 4503da                         add        r11d, r10d
003b5 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
003bd 453bcb                         cmp        r9d, r11d
003c0 0f82aa170000                   jb         0x7efc7bbd51f0
003c6 443b8c24a0000000               cmp        r9d, dword ptr [rsp + 0xa0]
003ce 0f829c170000                   jb         0x7efc7bbd51f0
003d4 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
003dc 4585d2                         test       r10d, r10d
003df 0f8432020000                   je         0x7efc7bbd3c97
003e5 4963d2                         movsxd     rdx, r10d
003e8 4883fa20                       cmp        rdx, 0x20
003ec 7728                           ja         0x7efc7bbd3a96
003ee 458bda                         mov        r11d, r10d
003f1 4d63d3                         movsxd     r10, r11d
003f4 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
003fb c442a8f5db                     bzhi       r11, r11, r10
00400 c4c1fb92fb                     kmovq      k7, r11
00405 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0040b 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00411 e901020000                     jmp        0x7efc7bbd3c97
00416 c5f877                         vzeroupper 
00419 49ba4091717bfc7e0000           movabs     r10, 0x7efc7b719140
00423 41ffd2                         call       r10
00426 0f1f840000000000               nop        dword ptr [rax + rax]
0042e e9e4010000                     jmp        0x7efc7bbd3c97
00433 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
00438 0f8366140000                   jae        0x7efc7bbd4f24
0043e 4963da                         movsxd     rbx, r10d
00441 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00446 4d8b4c1b08                     mov        r9, qword ptr [r11 + rbx + 8]
0044b 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00453 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
00458 0f83d2140000                   jae        0x7efc7bbd4fb0
0045e 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00466 458d5808                       lea        r11d, [r8 + 8]
0046a 4963f8                         movsxd     rdi, r8d
0046d 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00471 4c894c3908                     mov        qword ptr [rcx + rdi + 8], r9
00476 443b9c24a0000000               cmp        r11d, dword ptr [rsp + 0xa0]
0047e 0f8d93010000                   jge        0x7efc7bbd3c97
00484 482bdf                         sub        rbx, rdi
00487 4963cb                         movsxd     rcx, r11d
0048a 4c8d0c19                       lea        r9, [rcx + rbx]
0048e 4c3b8c2480000000               cmp        r9, qword ptr [rsp + 0x80]
00496 0f8324150000                   jae        0x7efc7bbd5040
0049c 4d8bce                         mov        r9, r14
0049f 4c2bc9                         sub        r9, rcx
004a2 4983c107                       add        r9, 7
004a6 4983e1f8                       and        r9, 0xfffffffffffffff8
004aa 418bc9                         mov        ecx, r9d
004ad 468d4c0108                     lea        r9d, [rcx + r8 + 8]
004b2 4d63c9                         movsxd     r9, r9d
004b5 498d4c19f8                     lea        rcx, [r9 + rbx - 8]
004ba 483b8c2480000000               cmp        rcx, qword ptr [rsp + 0x80]
004c2 0f83f8140000                   jae        0x7efc7bbd5040
004c8 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
004cd 0f83ed140000                   jae        0x7efc7bbd5040
004d3 4983c1f8                       add        r9, -8
004d7 4c3b8c2480000000               cmp        r9, qword ptr [rsp + 0x80]
004df 0f83db140000                   jae        0x7efc7bbd5040
004e5 8b8c24a0000000                 mov        ecx, dword ptr [rsp + 0xa0]
004ec 81f9f8ffff7f                   cmp        ecx, 0x7ffffff8
004f2 0f8f64150000                   jg         0x7efc7bbd50dc
004f8 452bd0                         sub        r10d, r8d
004fb 4183c010                       add        r8d, 0x10
004ff 438d0c1a                       lea        ecx, [r10 + r11]
00503 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00508 4d8b4c0908                     mov        r9, qword ptr [r9 + rcx + 8]
0050d 418bfb                         mov        edi, r11d
00510 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00514 4c894c3908                     mov        qword ptr [rcx + rdi + 8], r9
00519 418d4b08                       lea        ecx, [r11 + 8]
0051d 413bc8                         cmp        ecx, r8d
00520 7d05                           jge        0x7efc7bbd3ba7
00522 448bd9                         mov        r11d, ecx
00525 ebd8                           jmp        0x7efc7bbd3b7f
00527 4983c6f8                       add        r14, -8
0052b 4981fe00000080                 cmp        r14, -0x80000000
00532 49c7c000000080                 mov        r8, 0xffffffff80000000
00539 4d0f4cf0                       cmovl      r14, r8
0053d 418bfe                         mov        edi, r14d
00540 3bcf                           cmp        ecx, edi
00542 0f8d80000000                   jge        0x7efc7bbd3c48
00548 4c63c1                         movsxd     r8, ecx
0054b 4c03c3                         add        r8, rbx
0054e 4c3b842480000000               cmp        r8, qword ptr [rsp + 0x80]
00556 0f839c150000                   jae        0x7efc7bbd5178
0055c 4183c310                       add        r11d, 0x10
00560 4d63c3                         movsxd     r8, r11d
00563 4c03c3                         add        r8, rbx
00566 4c3b842480000000               cmp        r8, qword ptr [rsp + 0x80]
0056e 0f8398150000                   jae        0x7efc7bbd518c
00574 3b4c244c                       cmp        ecx, dword ptr [rsp + 0x4c]
00578 0f83a2150000                   jae        0x7efc7bbd51a0
0057e 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
00583 0f83ab150000                   jae        0x7efc7bbd51b4
00589 90                             nop        
0058a 90                             nop        
0058b 90                             nop        
0058c 90                             nop        
0058d 90                             nop        
0058e 90                             nop        
0058f 90                             nop        
00590 458d040a                       lea        r8d, [r10 + rcx]
00594 448bc9                         mov        r9d, ecx
00597 4963d1                         movsxd     rdx, r9d
0059a 458bd8                         mov        r11d, r8d
0059d 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
005a2 4b8b741908                     mov        rsi, qword ptr [r9 + r11 + 8]
005a7 4d63c0                         movsxd     r8, r8d
005aa 448bc9                         mov        r9d, ecx
005ad 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
005b2 4b89740b08                     mov        qword ptr [r11 + r9 + 8], rsi
005b7 4f8b440310                     mov        r8, qword ptr [r11 + r8 + 0x10]
005bc 4d89441310                     mov        qword ptr [r11 + rdx + 0x10], r8
005c1 83c110                         add        ecx, 0x10
005c4 3bcf                           cmp        ecx, edi
005c6 7cc8                           jl         0x7efc7bbd3c10
005c8 3b8c24a0000000                 cmp        ecx, dword ptr [rsp + 0xa0]
005cf 7d46                           jge        0x7efc7bbd3c97
005d1 4c63d9                         movsxd     r11, ecx
005d4 4c03db                         add        r11, rbx
005d7 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
005df 0f8363150000                   jae        0x7efc7bbd51c8
005e5 3b4c244c                       cmp        ecx, dword ptr [rsp + 0x4c]
005e9 0f836d150000                   jae        0x7efc7bbd51dc
005ef 90                             nop        
005f0 458d1c0a                       lea        r11d, [r10 + rcx]
005f4 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
005f9 4f8b441808                     mov        r8, qword ptr [r8 + r11 + 8]
005fe 448bc9                         mov        r9d, ecx
00601 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00606 4f89440b08                     mov        qword ptr [r11 + r9 + 8], r8
0060b 83c108                         add        ecx, 8
0060e 3b8c24a0000000                 cmp        ecx, dword ptr [rsp + 0xa0]
00615 7cd9                           jl         0x7efc7bbd3c70
00617 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0061f 44039c2488000000               add        r11d, dword ptr [rsp + 0x88]
00627 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
0062f 41ffc0                         inc        r8d
00632 443b442408                     cmp        r8d, dword ptr [rsp + 8]
00637 0f8d01060000                   jge        0x7efc7bbd42be
0063d 448bac2498000000               mov        r13d, dword ptr [rsp + 0x98]
00645 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
0064d 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00652 4f8b5cc208                     mov        r11, qword ptr [r10 + r8*8 + 8]
00657 458bd3                         mov        r10d, r11d
0065a 4181e2ffff0100                 and        r10d, 0x1ffff
00661 458bf2                         mov        r14d, r10d
00664 4d8bd3                         mov        r10, r11
00667 49c1ea12                       shr        r10, 0x12
0066b 49c1fb24                       sar        r11, 0x24
0066f 458bd2                         mov        r10d, r10d
00672 458bdb                         mov        r11d, r11d
00675 418bdb                         mov        ebx, r11d
00678 4181e2ffff0300                 and        r10d, 0x3ffff
0067f 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
00687 4585db                         test       r11d, r11d
0068a 0f8c08100000                   jl         0x7efc7bbd4d18
00690 458bde                         mov        r11d, r14d
00693 4585db                         test       r11d, r11d
00696 0f85ec010000                   jne        0x7efc7bbd3f08
0069c 4533d2                         xor        r10d, r10d
0069f 458bf2                         mov        r14d, r10d
006a2 83fb03                         cmp        ebx, 3
006a5 0f8e21020000                   jle        0x7efc7bbd3f4c
006ab 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
006b0 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
006b4 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
006b9 45895310                       mov        dword ptr [r11 + 0x10], r10d
006bd 458b5b08                       mov        r11d, dword ptr [r11 + 8]
006c1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
006c6 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
006ca 448d53fd                       lea        r10d, [rbx - 3]
006ce 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
006d6 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
006db 45895308                       mov        dword ptr [r11 + 8], r10d
006df 44898424a8000000               mov        dword ptr [rsp + 0xa8], r8d
006e7 48639c248c000000               movsxd     rbx, dword ptr [rsp + 0x8c]
006ef 48899c2490000000               mov        qword ptr [rsp + 0x90], rbx
006f7 4c639c249c000000               movsxd     r11, dword ptr [rsp + 0x9c]
006ff 4c035c2420                     add        r11, qword ptr [rsp + 0x20]
00704 4963d6                         movsxd     rdx, r14d
00707 4c03da                         add        r11, rdx
0070a 493bdb                         cmp        rbx, r11
0070d 0f8f01100000                   jg         0x7efc7bbd4d94
00713 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
0071b 4585d2                         test       r10d, r10d
0071e 0f8e400f0000                   jle        0x7efc7bbd4ce4
00724 8b9c249c000000                 mov        ebx, dword ptr [rsp + 0x9c]
0072b 4103de                         add        ebx, r14d
0072e 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00736 4403db                         add        r11d, ebx
00739 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
0073e 0f8f60100000                   jg         0x7efc7bbd4e24
00744 478d142e                       lea        r10d, [r14 + r13]
00748 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00750 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
00755 0f8fd5100000                   jg         0x7efc7bbd4eb0
0075b 4183fe10                       cmp        r14d, 0x10
0075f 0f8f88050000                   jg         0x7efc7bbd436d
00765 443b6c2478                     cmp        r13d, dword ptr [rsp + 0x78]
0076a 0f835d0d0000                   jae        0x7efc7bbd4b4d
00770 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00775 c4817a6f442a08                 vmovdqu    xmm0, xmmword ptr [r10 + r13 + 8]
0077c 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00784 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
00789 0f83c50d0000                   jae        0x7efc7bbd4bd4
0078f 478d042e                       lea        r8d, [r14 + r13]
00793 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
0079b 448b6c2448                     mov        r13d, dword ptr [rsp + 0x48]
007a0 c4817a7f441508                 vmovdqu    xmmword ptr [r13 + r10 + 8], xmm0
007a7 478d2c16                       lea        r13d, [r14 + r10]
007ab 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
007b3 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
007bb 442b94248c000000               sub        r10d, dword ptr [rsp + 0x8c]
007c3 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
007cb 4183f810                       cmp        r8d, 0x10
007cf 0f8f61fbffff                   jg         0x7efc7bbd39b6
007d5 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
007dd 4183fb10                       cmp        r11d, 0x10
007e1 0f8c4ffbffff                   jl         0x7efc7bbd39b6
007e7 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
007ec 0f83fa0d0000                   jae        0x7efc7bbd4c6c
007f2 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
007f7 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
007fe 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00806 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
0080b 0f8201fbffff                   jb         0x7efc7bbd3992
00811 bee4ffffff                     mov        esi, 0xffffffe4
00816 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0081b 448b1424                       mov        r10d, dword ptr [rsp]
0081f 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
00827 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0082c 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
00834 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00839 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
00841 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00846 4c891424                       mov        qword ptr [rsp], r10
0084a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0084f 4489542408                     mov        dword ptr [rsp + 8], r10d
00854 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00859 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0085e c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
00864 c5f877                         vzeroupper 
00867 e8749bafff                     call       0x7efc7b6cda60
0086c 0f1f840064090001               nop        dword ptr [rax + rax + 0x1000964]
00874 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
0087e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00882 e8d915cd17                     call       0x7efc938a54e0
00887 f4                             hlt        
00888 448b1424                       mov        r10d, dword ptr [rsp]
0088c 452bd5                         sub        r10d, r13d
0088f 453bda                         cmp        r11d, r10d
00892 0f8e0afeffff                   jle        0x7efc7bbd3d22
00898 be45ffffff                     mov        esi, 0xffffff45
0089d 418beb                         mov        ebp, r11d
008a0 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
008a8 c5f877                         vzeroupper 
008ab e8309bafff                     call       0x7efc7b6cda60
008b0 0f1f8400a8090002               nop        dword ptr [rax + rax + 0x20009a8]
008b8 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
008c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
008c6 e89515cd17                     call       0x7efc938a54e0
008cb f4                             hlt        
008cc 4585f6                         test       r14d, r14d
008cf 7407                           je         0x7efc7bbd3f58
008d1 448d53ff                       lea        r10d, [rbx - 1]
008d5 418bda                         mov        ebx, r10d
008d8 85db                           test       ebx, ebx
008da 0f8483000000                   je         0x7efc7bbd3fe3
008e0 83fb03                         cmp        ebx, 3
008e3 0f84e3140000                   je         0x7efc7bbd544c
008e9 83fb02                         cmp        ebx, 2
008ec 0f8762150000                   ja         0x7efc7bbd54d4
008f2 3b9c24d4000000                 cmp        ebx, dword ptr [rsp + 0xd4]
008f9 0f83b2130000                   jae        0x7efc7bbd5331
008ff 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00904 458b4c9b08                     mov        r9d, dword ptr [r11 + rbx*4 + 8]
00909 85db                           test       ebx, ebx
0090b 7e43                           jle        0x7efc7bbd3fd0
0090d 448d53ff                       lea        r10d, [rbx - 1]
00911 443b9424d4000000               cmp        r10d, dword ptr [rsp + 0xd4]
00919 0f8321140000                   jae        0x7efc7bbd53c0
0091f 44898424a8000000               mov        dword ptr [rsp + 0xa8], r8d
00927 90                             nop        
00928 90                             nop        
00929 90                             nop        
0092a 90                             nop        
0092b 90                             nop        
0092c 90                             nop        
0092d 90                             nop        
0092e 90                             nop        
0092f 90                             nop        
00930 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00935 458b549b04                     mov        r10d, dword ptr [r11 + rbx*4 + 4]
0093a 4d8bc3                         mov        r8, r11
0093d 4589549808                     mov        dword ptr [r8 + rbx*4 + 8], r10d
00942 448d53ff                       lea        r10d, [rbx - 1]
00946 418bda                         mov        ebx, r10d
00949 4585d2                         test       r10d, r10d
0094c 7fe2                           jg         0x7efc7bbd3fb0
0094e eb08                           jmp        0x7efc7bbd3fd8
00950 44898424a8000000               mov        dword ptr [rsp + 0xa8], r8d
00958 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0095d 45894a08                       mov        dword ptr [r10 + 8], r9d
00961 eb11                           jmp        0x7efc7bbd3ff4
00963 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00968 458b4a08                       mov        r9d, dword ptr [r10 + 8]
0096c 44898424a8000000               mov        dword ptr [rsp + 0xa8], r8d
00974 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
0097c e966fdffff                     jmp        0x7efc7bbd3d67
00981 4183fb10                       cmp        r11d, 0x10
00985 0f8d99180000                   jge        0x7efc7bbd58a4
0098b 4183fb08                       cmp        r11d, 8
0098f 0f8de2040000                   jge        0x7efc7bbd44f7
00995 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0099d 4183fb10                       cmp        r11d, 0x10
009a1 0f8ecb000000                   jle        0x7efc7bbd40f2
009a7 4585d2                         test       r10d, r10d
009aa 0f8ce8170000                   jl         0x7efc7bbd5818
009b0 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
009b8 4585c0                         test       r8d, r8d
009bb 0f8cd7170000                   jl         0x7efc7bbd5818
009c1 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
009c9 443b84249c000000               cmp        r8d, dword ptr [rsp + 0x9c]
009d1 0f82c1170000                   jb         0x7efc7bbd5818
009d7 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
009df 44039c249c000000               add        r11d, dword ptr [rsp + 0x9c]
009e7 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
009ef 443b8424a4000000               cmp        r8d, dword ptr [rsp + 0xa4]
009f7 0f829b170000                   jb         0x7efc7bbd5818
009fd 448b84248c000000               mov        r8d, dword ptr [rsp + 0x8c]
00a05 4585c0                         test       r8d, r8d
00a08 0f8c8a170000                   jl         0x7efc7bbd5818
00a0e 4585c0                         test       r8d, r8d
00a11 0f8428f8ffff                   je         0x7efc7bbd38bf
00a17 488b9c2490000000               mov        rbx, qword ptr [rsp + 0x90]
00a1f 4883fb20                       cmp        rbx, 0x20
00a23 772d                           ja         0x7efc7bbd40d2
00a25 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00a2d 4d63d2                         movsxd     r10, r10d
00a30 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00a37 c442a8f5db                     bzhi       r11, r11, r10
00a3c c4c1fb92fb                     kmovq      k7, r11
00a41 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00a47 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00a4d e9edf7ffff                     jmp        0x7efc7bbd38bf
00a52 488bd3                         mov        rdx, rbx
00a55 c5f877                         vzeroupper 
00a58 49ba4091717bfc7e0000           movabs     r10, 0x7efc7b719140
00a62 41ffd2                         call       r10
00a65 0f1f840000000000               nop        dword ptr [rax + rax]
00a6d e9cdf7ffff                     jmp        0x7efc7bbd38bf
00a72 443b9424d8000000               cmp        r10d, dword ptr [rsp + 0xd8]
00a7a 0f835c140000                   jae        0x7efc7bbd555c
00a80 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00a85 430fbe6c1008                   movsx      ebp, byte ptr [r8 + r10 + 8]
00a8b 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00a93 443b8424d8000000               cmp        r8d, dword ptr [rsp + 0xd8]
00a9b 0f83c7140000                   jae        0x7efc7bbd55e8
00aa1 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00aa6 43886c0108                     mov        byte ptr [r9 + r8 + 8], bpl
00aab 458d4203                       lea        r8d, [r10 + 3]
00aaf 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00ab7 41ffc3                         inc        r11d
00aba 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00ac2 443b8424d8000000               cmp        r8d, dword ptr [rsp + 0xd8]
00aca 0f8328150000                   jae        0x7efc7bbd5678
00ad0 4d63ca                         movsxd     r9, r10d
00ad3 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00ad8 430fbe6c0809                   movsx      ebp, byte ptr [r8 + r9 + 9]
00ade 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00ae6 4183c303                       add        r11d, 3
00aea 443b9c24d8000000               cmp        r11d, dword ptr [rsp + 0xd8]
00af2 0f8394150000                   jae        0x7efc7bbd570c
00af8 48638c249c000000               movsxd     rcx, dword ptr [rsp + 0x9c]
00b00 41886c0809                     mov        byte ptr [r8 + rcx + 9], bpl
00b05 470fbe44080a                   movsx      r8d, byte ptr [r8 + r9 + 0xa]
00b0b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00b10 4588440b0a                     mov        byte ptr [r11 + rcx + 0xa], r8b
00b15 470fbe5c0b0b                   movsx      r11d, byte ptr [r11 + r9 + 0xb]
00b1b 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00b20 45885c090b                     mov        byte ptr [r9 + rcx + 0xb], r11b
00b25 448b84248c000000               mov        r8d, dword ptr [rsp + 0x8c]
00b2d 4183f808                       cmp        r8d, 8
00b31 0f83e5150000                   jae        0x7efc7bbd579c
00b37 458bda                         mov        r11d, r10d
00b3a 49b820ae28e300000000           movabs     r8, 0xe328ae20
00b44 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00b4c 47035c9008                     add        r11d, dword ptr [r8 + r10*4 + 8]
00b51 44895c2404                     mov        dword ptr [rsp + 4], r11d
00b56 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00b5e 4183fa04                       cmp        r10d, 4
00b62 7e40                           jle        0x7efc7bbd4224
00b64 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00b6b 83c504                         add        ebp, 4
00b6e 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00b73 418bd3                         mov        edx, r11d
00b76 90                             nop        
00b77 90                             nop        
00b78 c5f877                         vzeroupper 
00b7b e860bab5ff                     call       0x7efc7b72fc60
00b80 0f1f8400780c0003               nop        dword ptr [rax + rax + 0x3000c78]
00b88 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00b8d 8bd5                           mov        edx, ebp
00b8f 8bc8                           mov        ecx, eax
00b91 90                             nop        
00b92 90                             nop        
00b93 90                             nop        
00b94 c5f877                         vzeroupper 
00b97 e844bab5ff                     call       0x7efc7b72fc60
00b9c 0f1f8400940c0004               nop        dword ptr [rax + rax + 0x4000c94]
00ba4 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00bac 4183fa08                       cmp        r10d, 8
00bb0 7e5a                           jle        0x7efc7bbd428c
00bb2 8b542404                       mov        edx, dword ptr [rsp + 4]
00bb6 49ba48ae28e300000000           movabs     r10, 0xe328ae48
00bc0 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00bc8 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
00bcd 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00bd4 83c508                         add        ebp, 8
00bd7 83c208                         add        edx, 8
00bda 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00bdf 90                             nop        
00be0 c5f877                         vzeroupper 
00be3 e8f8b9b5ff                     call       0x7efc7b72fc60
00be8 0f1f8400e00c0005               nop        dword ptr [rax + rax + 0x5000ce0]
00bf0 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00bf5 8bd5                           mov        edx, ebp
00bf7 488bc8                         mov        rcx, rax
00bfa 90                             nop        
00bfb 90                             nop        
00bfc c5f877                         vzeroupper 
00bff e8dcb9b5ff                     call       0x7efc7b72fc60
00c04 0f1f8400fc0c0006               nop        dword ptr [rax + rax + 0x6000cfc]
00c0c 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00c14 e90efaffff                     jmp        0x7efc7bbd3ca7
00c19 4d63d2                         movsxd     r10, r10d
00c1c 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c23 c442a8f5db                     bzhi       r11, r11, r10
00c28 c4c1fb92fb                     kmovq      k7, r11
00c2d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c33 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c39 e990000000                     jmp        0x7efc7bbd434e
00c3e 448b1424                       mov        r10d, dword ptr [rsp]
00c42 442b942498000000               sub        r10d, dword ptr [rsp + 0x98]
00c4a 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00c52 4585c0                         test       r8d, r8d
00c55 0f8c29170000                   jl         0x7efc7bbd5a04
00c5b 4c8b742440                     mov        r14, qword ptr [rsp + 0x40]
00c60 8bb424d0000000                 mov        esi, dword ptr [rsp + 0xd0]
00c67 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00c6b 4585db                         test       r11d, r11d
00c6e 0f8c19170000                   jl         0x7efc7bbd5a0d
00c74 3b3424                         cmp        esi, dword ptr [rsp]
00c77 0f8210170000                   jb         0x7efc7bbd5a0d
00c7d 448b4904                       mov        r9d, dword ptr [rcx + 4]
00c81 438d2c13                       lea        ebp, [r11 + r10]
00c85 443bcd                         cmp        r9d, ebp
00c88 0f82ff160000                   jb         0x7efc7bbd5a0d
00c8e 4585d2                         test       r10d, r10d
00c91 0f8cf6160000                   jl         0x7efc7bbd5a0d
00c97 4585d2                         test       r10d, r10d
00c9a 7432                           je         0x7efc7bbd434e
00c9c 4b8d7c0608                     lea        rdi, [r14 + r8 + 8]
00ca1 4c8bc1                         mov        r8, rcx
00ca4 4a8d741908                     lea        rsi, [rcx + r11 + 8]
00ca9 4963d2                         movsxd     rdx, r10d
00cac 4883fa20                       cmp        rdx, 0x20
00cb0 0f8663ffffff                   jbe        0x7efc7bbd4299
00cb6 c5f877                         vzeroupper 
00cb9 49ba4091717bfc7e0000           movabs     r10, 0x7efc7b719140
00cc3 41ffd2                         call       r10
00cc6 0f1f840000000000               nop        dword ptr [rax + rax]
00cce 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00cd3 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00cd7 c5f877                         vzeroupper 
00cda 4881c4c0000000                 add        rsp, 0xc0
00ce1 5d                             pop        rbp
00ce2 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00ce6 0f87e41d0000                   ja         0x7efc7bbd6150
00cec c3                             ret        
00ced 4183fe30                       cmp        r14d, 0x30
00cf1 0f8ea9000000                   jle        0x7efc7bbd4420
00cf7 4585ed                         test       r13d, r13d
00cfa 0f8cdc1a0000                   jl         0x7efc7bbd5e5c
00d00 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00d08 4585c0                         test       r8d, r8d
00d0b 0f8cd31a0000                   jl         0x7efc7bbd5e64
00d11 448b9c24d0000000               mov        r11d, dword ptr [rsp + 0xd0]
00d19 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00d21 0f82bd1a0000                   jb         0x7efc7bbd5e64
00d27 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
00d2f 443bd3                         cmp        r10d, ebx
00d32 0f82ac1a0000                   jb         0x7efc7bbd5e64
00d38 4585f6                         test       r14d, r14d
00d3b 743d                           je         0x7efc7bbd43fa
00d3d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00d42 4b8d7c2a08                     lea        rdi, [r10 + r13 + 8]
00d47 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00d4c 4b8d740208                     lea        rsi, [r10 + r8 + 8]
00d51 4883fa20                       cmp        rdx, 0x20
00d55 772f                           ja         0x7efc7bbd4406
00d57 458bd6                         mov        r10d, r14d
00d5a 4d63d2                         movsxd     r10, r10d
00d5d 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d64 c442a8f5db                     bzhi       r11, r11, r10
00d69 c4c1fb92fb                     kmovq      k7, r11
00d6e 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d74 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d7a 899c249c000000                 mov        dword ptr [rsp + 0x9c], ebx
00d81 e92dfaffff                     jmp        0x7efc7bbd3e33
00d86 c5f877                         vzeroupper 
00d89 49ba4091717bfc7e0000           movabs     r10, 0x7efc7b719140
00d93 41ffd2                         call       r10
00d96 0f1f840000000000               nop        dword ptr [rax + rax]
00d9e ebda                           jmp        0x7efc7bbd43fa
00da0 443b6c2478                     cmp        r13d, dword ptr [rsp + 0x78]
00da5 0f83f9180000                   jae        0x7efc7bbd5d24
00dab 4d63dd                         movsxd     r11, r13d
00dae 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00db3 c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
00dba 8b94249c000000                 mov        edx, dword ptr [rsp + 0x9c]
00dc1 3b54247c                       cmp        edx, dword ptr [rsp + 0x7c]
00dc5 0f8371190000                   jae        0x7efc7bbd5dbc
00dcb 448d4210                       lea        r8d, [rdx + 0x10]
00dcf 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
00dd7 4c63c2                         movsxd     r8, edx
00dda 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00ddf c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
00de6 8b8c2498000000                 mov        ecx, dword ptr [rsp + 0x98]
00ded 3bcb                           cmp        ecx, ebx
00def 0f8da1060000                   jge        0x7efc7bbd4b16
00df5 4d2bd8                         sub        r11, r8
00df8 4c63d1                         movsxd     r10, ecx
00dfb 4c638c24dc000000               movsxd     r9, dword ptr [rsp + 0xdc]
00e03 4983c1f1                       add        r9, -0xf
00e07 4f8d041a                       lea        r8, [r10 + r11]
00e0b 4d3bc1                         cmp        r8, r9
00e0e 0f83641a0000                   jae        0x7efc7bbd5ef8
00e14 4863f3                         movsxd     rsi, ebx
00e17 4c8bc6                         mov        r8, rsi
00e1a 4d2bc2                         sub        r8, r10
00e1d 4983c00f                       add        r8, 0xf
00e21 4983e0f0                       and        r8, 0xfffffffffffffff0
00e25 458bd0                         mov        r10d, r8d
00e28 458d441210                     lea        r8d, [r10 + rdx + 0x10]
00e2d 4d63d0                         movsxd     r10, r8d
00e30 4f8d441af0                     lea        r8, [r10 + r11 - 0x10]
00e35 4d3bc1                         cmp        r8, r9
00e38 0f833a1a0000                   jae        0x7efc7bbd5ef8
00e3e 3b4c247c                       cmp        ecx, dword ptr [rsp + 0x7c]
00e42 0f83301a0000                   jae        0x7efc7bbd5ef8
00e48 4983c2f0                       add        r10, -0x10
00e4c 4c8b442428                     mov        r8, qword ptr [rsp + 0x28]
00e51 4983c0f1                       add        r8, -0xf
00e55 4d3bd0                         cmp        r10, r8
00e58 0f831a1a0000                   jae        0x7efc7bbd5ef8
00e5e 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00e64 0f8f961a0000                   jg         0x7efc7bbd5f80
00e6a 418bfd                         mov        edi, r13d
00e6d 2bfa                           sub        edi, edx
00e6f 83c220                         add        edx, 0x20
00e72 e9f0030000                     jmp        0x7efc7bbd48e7
00e77 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
00e7c 0f8356150000                   jae        0x7efc7bbd5a58
00e82 4963c2                         movsxd     rax, r10d
00e85 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00e8a 4d8b5c0008                     mov        r11, qword ptr [r8 + rax + 8]
00e8f 4c899c2490000000               mov        qword ptr [rsp + 0x90], r11
00e97 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00e9f 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
00ea4 0f83ba150000                   jae        0x7efc7bbd5ae4
00eaa 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
00eb2 418d6908                       lea        ebp, [r9 + 8]
00eb6 4d63d9                         movsxd     r11, r9d
00eb9 488b8c2490000000               mov        rcx, qword ptr [rsp + 0x90]
00ec1 4b894c1808                     mov        qword ptr [r8 + r11 + 8], rcx
00ec6 3bac24a0000000                 cmp        ebp, dword ptr [rsp + 0xa0]
00ecd 0f8d7f030000                   jge        0x7efc7bbd48d2
00ed3 492bc3                         sub        rax, r11
00ed6 4863cd                         movsxd     rcx, ebp
00ed9 4c8d1c01                       lea        r11, [rcx + rax]
00edd 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
00ee5 0f83f9150000                   jae        0x7efc7bbd5b64
00eeb 4d8bde                         mov        r11, r14
00eee 4c2bd9                         sub        r11, rcx
00ef1 4983c307                       add        r11, 7
00ef5 4983e3f8                       and        r11, 0xfffffffffffffff8
00ef9 458bdb                         mov        r11d, r11d
00efc 478d440b08                     lea        r8d, [r11 + r9 + 8]
00f01 4d63d8                         movsxd     r11, r8d
00f04 4d8d4403f8                     lea        r8, [r11 + rax - 8]
00f09 4c3b842480000000               cmp        r8, qword ptr [rsp + 0x80]
00f11 0f83cd150000                   jae        0x7efc7bbd5b64
00f17 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00f1b 0f83c3150000                   jae        0x7efc7bbd5b64
00f21 4983c3f8                       add        r11, -8
00f25 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
00f2d 0f83b1150000                   jae        0x7efc7bbd5b64
00f33 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
00f38 498bdb                         mov        rbx, r11
00f3b 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00f40 458bd8                         mov        r11d, r8d
00f43 41b8f8ffffff                   mov        r8d, 0xfffffff8
00f49 452bc3                         sub        r8d, r11d
00f4c 452bc1                         sub        r8d, r9d
00f4f 4183c0f0                       add        r8d, -0x10
00f53 458d5910                       lea        r11d, [r9 + 0x10]
00f57 4d63db                         movsxd     r11, r11d
00f5a bf06000000                     mov        edi, 6
00f5f c442c0f5c0                     bzhi       r8, r8, rdi
00f64 4d03d8                         add        r11, r8
00f67 4d3bde                         cmp        r11, r14
00f6a 498bfe                         mov        rdi, r14
00f6d 490f4cfb                       cmovl      rdi, r11
00f71 4c8bdf                         mov        r11, rdi
00f74 4c2bd9                         sub        r11, rcx
00f77 4d8d43ff                       lea        r8, [r11 - 1]
00f7b 49c1f83f                       sar        r8, 0x3f
00f7f 49c1e83d                       shr        r8, 0x3d
00f83 4f8d5c18ff                     lea        r11, [r8 + r11 - 1]
00f88 4983e3f8                       and        r11, 0xfffffffffffffff8
00f8c 4c03d9                         add        r11, rcx
00f8f 493bcb                         cmp        rcx, r11
00f92 490f4ccb                       cmovl      rcx, r11
00f96 8bc9                           mov        ecx, ecx
00f98 448d4108                       lea        r8d, [rcx + 8]
00f9c 2b8c248c000000                 sub        ecx, dword ptr [rsp + 0x8c]
00fa3 4963d0                         movsxd     rdx, r8d
00fa6 4803d3                         add        rdx, rbx
00fa9 83c108                         add        ecx, 8
00fac 4c63c1                         movsxd     r8, ecx
00faf 4c03c3                         add        r8, rbx
00fb2 488d4a48                       lea        rcx, [rdx + 0x48]
00fb6 4883c208                       add        rdx, 8
00fba 498d5808                       lea        rbx, [r8 + 8]
00fbe 4533db                         xor        r11d, r11d
00fc1 483bcb                         cmp        rcx, rbx
00fc4 410f96c3                       setbe      r11b
00fc8 4983c048                       add        r8, 0x48
00fcc 33c9                           xor        ecx, ecx
00fce 4c3bc2                         cmp        r8, rdx
00fd1 0f96c1                         setbe      cl
00fd4 440bd9                         or         r11d, ecx
00fd7 0f847f150000                   je         0x7efc7bbd5bdc
00fdd 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00fe5 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
00fec 0f8fe2150000                   jg         0x7efc7bbd5c54
00ff2 452bd1                         sub        r10d, r9d
00ff5 8bdf                           mov        ebx, edi
00ff7 eb06                           jmp        0x7efc7bbd467f
00ff9 90                             nop        
00ffa 90                             nop        
00ffb 90                             nop        
00ffc 418be8                         mov        ebp, r8d
00fff 458d042a                       lea        r8d, [r10 + rbp]
01003 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01008 4f8b5c0308                     mov        r11, qword ptr [r11 + r8 + 8]
0100d 448bcd                         mov        r9d, ebp
01010 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
01014 4e895c0908                     mov        qword ptr [rcx + r9 + 8], r11
01019 448d4508                       lea        r8d, [rbp + 8]
0101d 443bc3                         cmp        r8d, ebx
01020 7cda                           jl         0x7efc7bbd467c
01022 4d8d9e08feffff                 lea        r11, [r14 - 0x1f8]
01029 4981fb00000080                 cmp        r11, -0x80000000
01030 49c7c100000080                 mov        r9, 0xffffffff80000000
01037 4d0f4cd9                       cmovl      r11, r9
0103b 458beb                         mov        r13d, r11d
0103e 453bc5                         cmp        r8d, r13d
01041 0f8d05160000                   jge        0x7efc7bbd5ccc
01047 4d63d8                         movsxd     r11, r8d
0104a 4c03d8                         add        r11, rax
0104d 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
01055 0f83f9150000                   jae        0x7efc7bbd5cd4
0105b 81c500020000                   add        ebp, 0x200
01061 4c63dd                         movsxd     r11, ebp
01064 4c03d8                         add        r11, rax
01067 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
0106f 0f83f3150000                   jae        0x7efc7bbd5ce8
01075 443b44244c                     cmp        r8d, dword ptr [rsp + 0x4c]
0107a 0f83fc150000                   jae        0x7efc7bbd5cfc
01080 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
01084 0f8306160000                   jae        0x7efc7bbd5d10
0108a eb07                           jmp        0x7efc7bbd4713
0108c 90                             nop        
0108d 90                             nop        
0108e 90                             nop        
0108f 90                             nop        
01090 448bc1                         mov        r8d, ecx
01093 478d1c02                       lea        r11d, [r10 + r8]
01097 458bc8                         mov        r9d, r8d
0109a 4963d9                         movsxd     rbx, r9d
0109d 418bcb                         mov        ecx, r11d
010a0 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
010a5 62d17e486f840908000000         vmovdqu32  zmm0, zmmword ptr [r9 + rcx + 8]
010b0 4963fb                         movsxd     rdi, r11d
010b3 418d8880000000                 lea        ecx, [r8 + 0x80]
010ba 4103ca                         add        ecx, r10d
010bd 458d8800010000                 lea        r9d, [r8 + 0x100]
010c4 4503ca                         add        r9d, r10d
010c7 448bd9                         mov        r11d, ecx
010ca 4863d1                         movsxd     rdx, ecx
010cd 418bc9                         mov        ecx, r9d
010d0 4963f1                         movsxd     rsi, r9d
010d3 458bc8                         mov        r9d, r8d
010d6 8b6c2448                       mov        ebp, dword ptr [rsp + 0x48]
010da 62b17e487f840d08000000         vmovdqu32  zmmword ptr [rbp + r9 + 8], zmm0
010e5 62f17e486f843d48000000         vmovdqu32  zmm0, zmmword ptr [rbp + rdi + 0x48]
010f0 62f17e487f841d48000000         vmovdqu32  zmmword ptr [rbp + rbx + 0x48], zmm0
010fb 62b17e486f841d08000000         vmovdqu32  zmm0, zmmword ptr [rbp + r11 + 8]
01106 62f17e487f841d88000000         vmovdqu32  zmmword ptr [rbp + rbx + 0x88], zmm0
01111 62f17e486f841548000000         vmovdqu32  zmm0, zmmword ptr [rbp + rdx + 0x48]
0111c 62f17e487f841dc8000000         vmovdqu32  zmmword ptr [rbp + rbx + 0xc8], zmm0
01127 62f17e486f840d08000000         vmovdqu32  zmm0, zmmword ptr [rbp + rcx + 8]
01132 8bcd                           mov        ecx, ebp
01134 62f17e487f841908010000         vmovdqu32  zmmword ptr [rcx + rbx + 0x108], zmm0
0113f 62f17e486f843148000000         vmovdqu32  zmm0, zmmword ptr [rcx + rsi + 0x48]
0114a 62f17e487f841948010000         vmovdqu32  zmmword ptr [rcx + rbx + 0x148], zmm0
01155 62f17e486f843988010000         vmovdqu32  zmm0, zmmword ptr [rcx + rdi + 0x188]
01160 62f17e487f841988010000         vmovdqu32  zmmword ptr [rcx + rbx + 0x188], zmm0
0116b 62f17e486f8439c8010000         vmovdqu32  zmm0, zmmword ptr [rcx + rdi + 0x1c8]
01176 62f17e487f8419c8010000         vmovdqu32  zmmword ptr [rcx + rbx + 0x1c8], zmm0
01181 418d8800020000                 lea        ecx, [r8 + 0x200]
01188 413bcd                         cmp        ecx, r13d
0118b 0f8cfffeffff                   jl         0x7efc7bbd4710
01191 4983c6c8                       add        r14, -0x38
01195 4981fe00000080                 cmp        r14, -0x80000000
0119c 49c7c300000080                 mov        r11, 0xffffffff80000000
011a3 4d0f4cf3                       cmovl      r14, r11
011a7 458bde                         mov        r11d, r14d
011aa 413bcb                         cmp        ecx, r11d
011ad 7d53                           jge        0x7efc7bbd4882
011af 4181c038020000                 add        r8d, 0x238
011b6 4d63c8                         movsxd     r9, r8d
011b9 4c03c8                         add        r9, rax
011bc 4c3b8c2480000000               cmp        r9, qword ptr [rsp + 0x80]
011c4 0f830e180000                   jae        0x7efc7bbd6058
011ca 443b44244c                     cmp        r8d, dword ptr [rsp + 0x4c]
011cf 0f832b180000                   jae        0x7efc7bbd6080
011d5 90                             nop        
011d6 90                             nop        
011d7 90                             nop        
011d8 458d040a                       lea        r8d, [r10 + rcx]
011dc 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
011e1 62917e486f840108000000         vmovdqu32  zmm0, zmmword ptr [r9 + r8 + 8]
011ec 448bc1                         mov        r8d, ecx
011ef 62917e487f840108000000         vmovdqu32  zmmword ptr [r9 + r8 + 8], zmm0
011fa 83c140                         add        ecx, 0x40
011fd 413bcb                         cmp        ecx, r11d
01200 7cd6                           jl         0x7efc7bbd4858
01202 3b8c24a0000000                 cmp        ecx, dword ptr [rsp + 0xa0]
01209 7d47                           jge        0x7efc7bbd48d2
0120b 4c63d9                         movsxd     r11, ecx
0120e 4c03d8                         add        r11, rax
01211 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
01219 0f83cd170000                   jae        0x7efc7bbd606c
0121f 3b4c244c                       cmp        ecx, dword ptr [rsp + 0x4c]
01223 0f83eb170000                   jae        0x7efc7bbd6094
01229 90                             nop        
0122a 90                             nop        
0122b 90                             nop        
0122c 458d1c0a                       lea        r11d, [r10 + rcx]
01230 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01235 4f8b5c1808                     mov        r11, qword ptr [r8 + r11 + 8]
0123a 448bc1                         mov        r8d, ecx
0123d 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
01241 4e895c0308                     mov        qword ptr [rbx + r8 + 8], r11
01246 83c108                         add        ecx, 8
01249 3b8c24a0000000                 cmp        ecx, dword ptr [rsp + 0xa0]
01250 7cda                           jl         0x7efc7bbd48ac
01252 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0125a e9c8f3ffff                     jmp        0x7efc7bbd3ca7
0125f 90                             nop        
01260 898c2498000000                 mov        dword ptr [rsp + 0x98], ecx
01267 448bd7                         mov        r10d, edi
0126a 4403942498000000               add        r10d, dword ptr [rsp + 0x98]
01272 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
01277 c4817a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 8]
0127e 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
01286 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
0128a c4a17a7f440108                 vmovdqu    xmmword ptr [rcx + r8 + 8], xmm0
01291 8b8c2498000000                 mov        ecx, dword ptr [rsp + 0x98]
01298 83c110                         add        ecx, 0x10
0129b 3bca                           cmp        ecx, edx
0129d 7cc1                           jl         0x7efc7bbd48e0
0129f 4881c610ffffff                 add        rsi, -0xf0
012a6 4881fe00000080                 cmp        rsi, -0x80000000
012ad 49c7c200000080                 mov        r10, 0xffffffff80000000
012b4 490f4cf2                       cmovl      rsi, r10
012b8 8bc6                           mov        eax, esi
012ba 3bc8                           cmp        ecx, eax
012bc 0f8d8e010000                   jge        0x7efc7bbd4ad0
012c2 4c63d1                         movsxd     r10, ecx
012c5 4d03d3                         add        r10, r11
012c8 4d3bd1                         cmp        r10, r9
012cb 0f83b7160000                   jae        0x7efc7bbd6008
012d1 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
012d9 4181c000010000                 add        r8d, 0x100
012e0 4d63d0                         movsxd     r10, r8d
012e3 4d03d3                         add        r10, r11
012e6 4d3bd1                         cmp        r10, r9
012e9 0f83ad160000                   jae        0x7efc7bbd601c
012ef 3b4c247c                       cmp        ecx, dword ptr [rsp + 0x7c]
012f3 0f83b7160000                   jae        0x7efc7bbd6030
012f9 443b44247c                     cmp        r8d, dword ptr [rsp + 0x7c]
012fe 0f83c0160000                   jae        0x7efc7bbd6044
01304 90                             nop        
01305 90                             nop        
01306 90                             nop        
01307 90                             nop        
01308 90                             nop        
01309 90                             nop        
0130a 90                             nop        
0130b 90                             nop        
0130c 90                             nop        
0130d 90                             nop        
0130e 90                             nop        
0130f 90                             nop        
01310 448d140f                       lea        r10d, [rdi + rcx]
01314 448bc1                         mov        r8d, ecx
01317 4963d0                         movsxd     rdx, r8d
0131a 418bf2                         mov        esi, r10d
0131d 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
01322 c4c17a6f443008                 vmovdqu    xmm0, xmmword ptr [r8 + rsi + 8]
01329 4963ea                         movsxd     rbp, r10d
0132c 448bd1                         mov        r10d, ecx
0132f 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01334 c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
0133b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01340 c4c17a6f442a18                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0x18]
01347 c4c17a7f441018                 vmovdqu    xmmword ptr [r8 + rdx + 0x18], xmm0
0134e c4c17a6f442a28                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0x28]
01355 c4c17a7f441028                 vmovdqu    xmmword ptr [r8 + rdx + 0x28], xmm0
0135c c4c17a6f442a38                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0x38]
01363 c4c17a7f441038                 vmovdqu    xmmword ptr [r8 + rdx + 0x38], xmm0
0136a c4c17a6f442a48                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0x48]
01371 c4c17a7f441048                 vmovdqu    xmmword ptr [r8 + rdx + 0x48], xmm0
01378 c4c17a6f442a58                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0x58]
0137f c4c17a7f441058                 vmovdqu    xmmword ptr [r8 + rdx + 0x58], xmm0
01386 c4c17a6f442a68                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0x68]
0138d c4c17a7f441068                 vmovdqu    xmmword ptr [r8 + rdx + 0x68], xmm0
01394 c4c17a6f442a78                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0x78]
0139b c4c17a7f441078                 vmovdqu    xmmword ptr [r8 + rdx + 0x78], xmm0
013a2 c4c17a6f842a88000000           vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0x88]
013ac c4c17a7f841088000000           vmovdqu    xmmword ptr [r8 + rdx + 0x88], xmm0
013b6 c4c17a6f842a98000000           vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0x98]
013c0 c4c17a7f841098000000           vmovdqu    xmmword ptr [r8 + rdx + 0x98], xmm0
013ca c4c17a6f842aa8000000           vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0xa8]
013d4 c4c17a7f8410a8000000           vmovdqu    xmmword ptr [r8 + rdx + 0xa8], xmm0
013de c4c17a6f842ab8000000           vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0xb8]
013e8 c4c17a7f8410b8000000           vmovdqu    xmmword ptr [r8 + rdx + 0xb8], xmm0
013f2 c4c17a6f842ac8000000           vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0xc8]
013fc c4c17a7f8410c8000000           vmovdqu    xmmword ptr [r8 + rdx + 0xc8], xmm0
01406 c4c17a6f842ad8000000           vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0xd8]
01410 c4c17a7f8410d8000000           vmovdqu    xmmword ptr [r8 + rdx + 0xd8], xmm0
0141a c4c17a6f842ae8000000           vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0xe8]
01424 c4c17a7f8410e8000000           vmovdqu    xmmword ptr [r8 + rdx + 0xe8], xmm0
0142e c4c17a6f842af8000000           vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0xf8]
01438 c4c17a7f8410f8000000           vmovdqu    xmmword ptr [r8 + rdx + 0xf8], xmm0
01442 81c100010000                   add        ecx, 0x100
01448 3bc8                           cmp        ecx, eax
0144a 0f8cc0feffff                   jl         0x7efc7bbd4990
01450 3bcb                           cmp        ecx, ebx
01452 7d42                           jge        0x7efc7bbd4b16
01454 4c63d1                         movsxd     r10, ecx
01457 4d03d3                         add        r10, r11
0145a 4d3bd1                         cmp        r10, r9
0145d 0f83c5150000                   jae        0x7efc7bbd60a8
01463 3b4c247c                       cmp        ecx, dword ptr [rsp + 0x7c]
01467 0f83cf150000                   jae        0x7efc7bbd60bc
0146d 90                             nop        
0146e 90                             nop        
0146f 90                             nop        
01470 448d1c0f                       lea        r11d, [rdi + rcx]
01474 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01479 c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
01480 448bd1                         mov        r10d, ecx
01483 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01488 c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
0148f 83c110                         add        ecx, 0x10
01492 3bcb                           cmp        ecx, ebx
01494 7cda                           jl         0x7efc7bbd4af0
01496 478d142e                       lea        r10d, [r14 + r13]
0149a 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
014a2 899c249c000000                 mov        dword ptr [rsp + 0x9c], ebx
014a9 e905f3ffff                     jmp        0x7efc7bbd3e33
014ae 4c03c9                         add        r9, rcx
014b1 4c3b4c2458                     cmp        r9, qword ptr [rsp + 0x58]
014b6 7e08                           jle        0x7efc7bbd4b40
014b8 4533c0                         xor        r8d, r8d
014bb e9edebffff                     jmp        0x7efc7bbd372d
014c0 4533c0                         xor        r8d, r8d
014c3 bb01000000                     mov        ebx, 1
014c8 e9e2ebffff                     jmp        0x7efc7bbd372f
014cd bee4ffffff                     mov        esi, 0xffffffe4
014d2 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
014d7 448b1c24                       mov        r11d, dword ptr [rsp]
014db 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
014e3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
014e8 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
014f0 448b542408                     mov        r10d, dword ptr [rsp + 8]
014f5 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
014fd 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01502 4c891424                       mov        qword ptr [rsp], r10
01506 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0150b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01510 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01515 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0151a 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0151f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01524 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01529 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
0152e 90                             nop        
0152f 90                             nop        
01530 c5f877                         vzeroupper 
01533 e8a88eafff                     call       0x7efc7b6cda60
01538 0f1f840030160007               nop        dword ptr [rax + rax + 0x7001630]
01540 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
0154a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0154e e80d09cd17                     call       0x7efc938a54e0
01553 f4                             hlt        
01554 bee4ffffff                     mov        esi, 0xffffffe4
01559 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0155e 448b1c24                       mov        r11d, dword ptr [rsp]
01562 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0156a 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0156f 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01577 448b442408                     mov        r8d, dword ptr [rsp + 8]
0157c 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01584 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01589 4c891c24                       mov        qword ptr [rsp], r11
0158d 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01592 44895c2408                     mov        dword ptr [rsp + 8], r11d
01597 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
0159c 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
015a1 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
015a6 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
015ab 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
015b0 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
015b5 4489442420                     mov        dword ptr [rsp + 0x20], r8d
015ba 4489742428                     mov        dword ptr [rsp + 0x28], r14d
015bf c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
015c5 90                             nop        
015c6 90                             nop        
015c7 90                             nop        
015c8 c5f877                         vzeroupper 
015cb e8108eafff                     call       0x7efc7b6cda60
015d0 0f1f8400c8160008               nop        dword ptr [rax + rax + 0x80016c8]
015d8 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
015e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
015e6 e87508cd17                     call       0x7efc938a54e0
015eb f4                             hlt        
015ec bee4ffffff                     mov        esi, 0xffffffe4
015f1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
015f6 448b0424                       mov        r8d, dword ptr [rsp]
015fa 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01602 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01607 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
0160f 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01614 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0161c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01621 4c891c24                       mov        qword ptr [rsp], r11
01625 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0162a 4489442408                     mov        dword ptr [rsp + 8], r8d
0162f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01634 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01639 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0163e 90                             nop        
0163f 90                             nop        
01640 c5f877                         vzeroupper 
01643 e8988dafff                     call       0x7efc7b6cda60
01648 0f1f840040170009               nop        dword ptr [rax + rax + 0x9001740]
01650 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
0165a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0165e e8fd07cd17                     call       0x7efc938a54e0
01663 f4                             hlt        
01664 be45ffffff                     mov        esi, 0xffffff45
01669 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
01671 90                             nop        
01672 90                             nop        
01673 90                             nop        
01674 c5f877                         vzeroupper 
01677 e8648dafff                     call       0x7efc7b6cda60
0167c 0f1f84007417000a               nop        dword ptr [rax + rax + 0xa001774]
01684 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
0168e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01692 e8c907cd17                     call       0x7efc938a54e0
01697 f4                             hlt        
01698 be45ffffff                     mov        esi, 0xffffff45
0169d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
016a2 448b1424                       mov        r10d, dword ptr [rsp]
016a6 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
016ae 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
016b3 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
016bb 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
016c0 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
016c8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
016cd 4c891424                       mov        qword ptr [rsp], r10
016d1 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
016d6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016db 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016e0 4489442424                     mov        dword ptr [rsp + 0x24], r8d
016e5 4489742428                     mov        dword ptr [rsp + 0x28], r14d
016ea 895c2430                       mov        dword ptr [rsp + 0x30], ebx
016ee 90                             nop        
016ef 90                             nop        
016f0 c5f877                         vzeroupper 
016f3 e8e88cafff                     call       0x7efc7b6cda60
016f8 0f1f8400f017000b               nop        dword ptr [rax + rax + 0xb0017f0]
01700 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
0170a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0170e e84d07cd17                     call       0x7efc938a54e0
01713 f4                             hlt        
01714 493bdb                         cmp        rbx, r11
01717 bdffffffff                     mov        ebp, 0xffffffff
0171c 7c08                           jl         0x7efc7bbd4da6
0171e 400f95c5                       setne      bpl
01722 400fb6ed                       movzx      ebp, bpl
01726 be45ffffff                     mov        esi, 0xffffff45
0172b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01730 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01738 448b1424                       mov        r10d, dword ptr [rsp]
0173c 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01744 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01749 4c891424                       mov        qword ptr [rsp], r10
0174d 448b442408                     mov        r8d, dword ptr [rsp + 8]
01752 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
0175a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0175f 4c89542408                     mov        qword ptr [rsp + 8], r10
01764 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
01769 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0176e 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01773 4489742430                     mov        dword ptr [rsp + 0x30], r14d
01778 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
0177d 90                             nop        
0177e 90                             nop        
0177f 90                             nop        
01780 c5f877                         vzeroupper 
01783 e8588cafff                     call       0x7efc7b6cda60
01788 0f1f84008018000c               nop        dword ptr [rax + rax + 0xc001880]
01790 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
0179a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0179e e8bd06cd17                     call       0x7efc938a54e0
017a3 f4                             hlt        
017a4 be45ffffff                     mov        esi, 0xffffff45
017a9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
017ae 448b0424                       mov        r8d, dword ptr [rsp]
017b2 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
017ba 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
017bf 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
017c7 448b542408                     mov        r10d, dword ptr [rsp + 8]
017cc 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
017d4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
017d9 4c891424                       mov        qword ptr [rsp], r10
017dd 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
017e2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017e7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017ec 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
017f1 4489442414                     mov        dword ptr [rsp + 0x14], r8d
017f6 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
017fb 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01800 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01805 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0180a 90                             nop        
0180b 90                             nop        
0180c c5f877                         vzeroupper 
0180f e8cc8bafff                     call       0x7efc7b6cda60
01814 0f1f84000c19000d               nop        dword ptr [rax + rax + 0xd00190c]
0181c 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
01826 4883e4f0                       and        rsp, 0xfffffffffffffff0
0182a e83106cd17                     call       0x7efc938a54e0
0182f f4                             hlt        
01830 be45ffffff                     mov        esi, 0xffffff45
01835 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0183a 448b1424                       mov        r10d, dword ptr [rsp]
0183e 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01846 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0184b 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01853 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01858 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01860 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01865 4c891424                       mov        qword ptr [rsp], r10
01869 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
0186e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01873 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01878 4489742428                     mov        dword ptr [rsp + 0x28], r14d
0187d 90                             nop        
0187e 90                             nop        
0187f 90                             nop        
01880 c5f877                         vzeroupper 
01883 e8588bafff                     call       0x7efc7b6cda60
01888 0f1f84008019000e               nop        dword ptr [rax + rax + 0xe001980]
01890 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
0189a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0189e e8bd05cd17                     call       0x7efc938a54e0
018a3 f4                             hlt        
018a4 bee4ffffff                     mov        esi, 0xffffffe4
018a9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
018ae 448b1c24                       mov        r11d, dword ptr [rsp]
018b2 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
018ba 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
018bf 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
018c7 448b442408                     mov        r8d, dword ptr [rsp + 8]
018cc 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
018d4 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
018d9 4c891c24                       mov        qword ptr [rsp], r11
018dd 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
018e2 4489442408                     mov        dword ptr [rsp + 8], r8d
018e7 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
018ec 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
018f1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
018f6 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
018fb 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01900 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01905 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0190a 90                             nop        
0190b 90                             nop        
0190c c5f877                         vzeroupper 
0190f e8cc8aafff                     call       0x7efc7b6cda60
01914 0f1f84000c1a000f               nop        dword ptr [rax + rax + 0xf001a0c]
0191c 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
01926 4883e4f0                       and        rsp, 0xfffffffffffffff0
0192a e83105cd17                     call       0x7efc938a54e0
0192f f4                             hlt        
01930 bee4ffffff                     mov        esi, 0xffffffe4
01935 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0193a 448b0424                       mov        r8d, dword ptr [rsp]
0193e 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01946 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0194b 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01953 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01958 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01960 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01965 4c891c24                       mov        qword ptr [rsp], r11
01969 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0196e 44895c2408                     mov        dword ptr [rsp + 8], r11d
01973 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01978 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0197d 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01982 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01987 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0198c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01991 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01996 4c894c2438                     mov        qword ptr [rsp + 0x38], r9
0199b 90                             nop        
0199c c5f877                         vzeroupper 
0199f e83c8aafff                     call       0x7efc7b6cda60
019a4 0f1f84009c1a0010               nop        dword ptr [rax + rax + 0x10001a9c]
019ac 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
019b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
019ba e8a104cd17                     call       0x7efc938a54e0
019bf f4                             hlt        
019c0 4183c208                       add        r10d, 8
019c4 be6effffff                     mov        esi, 0xffffff6e
019c9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
019ce 8b0c24                         mov        ecx, dword ptr [rsp]
019d1 898c24d0000000                 mov        dword ptr [rsp + 0xd0], ecx
019d8 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
019dd 4c898c24d8000000               mov        qword ptr [rsp + 0xd8], r9
019e5 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
019ea 44898c24d4000000               mov        dword ptr [rsp + 0xd4], r9d
019f2 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
019f7 4c890c24                       mov        qword ptr [rsp], r9
019fb 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01a00 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01a05 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01a0a 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01a0f 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
01a14 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01a19 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01a1e 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
01a26 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01a2b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01a30 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01a35 90                             nop        
01a36 90                             nop        
01a37 90                             nop        
01a38 c5f877                         vzeroupper 
01a3b e8a089afff                     call       0x7efc7b6cda60
01a40 0f1f8400381b0011               nop        dword ptr [rax + rax + 0x11001b38]
01a48 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
01a52 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a56 e80504cd17                     call       0x7efc938a54e0
01a5b f4                             hlt        
01a5c 4183c208                       add        r10d, 8
01a60 be66ffffff                     mov        esi, 0xffffff66
01a65 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01a6a 8b0c24                         mov        ecx, dword ptr [rsp]
01a6d 898c24d0000000                 mov        dword ptr [rsp + 0xd0], ecx
01a74 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
01a79 4c898c24d8000000               mov        qword ptr [rsp + 0xd8], r9
01a81 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01a86 44898c24d4000000               mov        dword ptr [rsp + 0xd4], r9d
01a8e 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
01a93 4c890c24                       mov        qword ptr [rsp], r9
01a97 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01a9c 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01aa1 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01aa6 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01aab 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01ab0 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01ab5 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01aba 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
01ac2 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01ac7 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01acc 458bd8                         mov        r11d, r8d
01acf 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01ad4 c5f877                         vzeroupper 
01ad7 e80489afff                     call       0x7efc7b6cda60
01adc 0f1f8400d41b0012               nop        dword ptr [rax + rax + 0x12001bd4]
01ae4 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
01aee 4883e4f0                       and        rsp, 0xfffffffffffffff0
01af2 e86903cd17                     call       0x7efc938a54e0
01af7 f4                             hlt        
01af8 48bf70077754fc7e0000           movabs     rdi, 0x7efc54770770
01b02 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b06 e85503cd17                     call       0x7efc938a54e0
01b0b f4                             hlt        
01b0c 48bf70077754fc7e0000           movabs     rdi, 0x7efc54770770
01b16 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b1a e84103cd17                     call       0x7efc938a54e0
01b1f f4                             hlt        
01b20 48bf70077754fc7e0000           movabs     rdi, 0x7efc54770770
01b2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b2e e82d03cd17                     call       0x7efc938a54e0
01b33 f4                             hlt        
01b34 48bf70077754fc7e0000           movabs     rdi, 0x7efc54770770
01b3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b42 e81903cd17                     call       0x7efc938a54e0
01b47 f4                             hlt        
01b48 48bf70077754fc7e0000           movabs     rdi, 0x7efc54770770
01b52 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b56 e80503cd17                     call       0x7efc938a54e0
01b5b f4                             hlt        
01b5c 48bf70077754fc7e0000           movabs     rdi, 0x7efc54770770
01b66 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b6a e8f102cd17                     call       0x7efc938a54e0
01b6f f4                             hlt        
01b70 beccffffff                     mov        esi, 0xffffffcc
01b75 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01b7a 448b1c24                       mov        r11d, dword ptr [rsp]
01b7e 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01b86 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01b8b 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01b93 448b442408                     mov        r8d, dword ptr [rsp + 8]
01b98 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01ba0 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01ba5 4c891c24                       mov        qword ptr [rsp], r11
01ba9 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01bae 44895c2408                     mov        dword ptr [rsp + 8], r11d
01bb3 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01bb8 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01bbd 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01bc2 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01bc7 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01bcc 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01bd1 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
01bd9 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01bde 458bd0                         mov        r10d, r8d
01be1 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01be6 90                             nop        
01be7 90                             nop        
01be8 c5f877                         vzeroupper 
01beb e8f087afff                     call       0x7efc7b6cda60
01bf0 0f1f8400e81c0013               nop        dword ptr [rax + rax + 0x13001ce8]
01bf8 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
01c02 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c06 e85502cd17                     call       0x7efc938a54e0
01c0b f4                             hlt        
01c0c beccffffff                     mov        esi, 0xffffffcc
01c11 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01c16 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01c1e 448b1c24                       mov        r11d, dword ptr [rsp]
01c22 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01c2a 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01c2f 4c891424                       mov        qword ptr [rsp], r10
01c33 448b542408                     mov        r10d, dword ptr [rsp + 8]
01c38 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01c40 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c45 4c89542408                     mov        qword ptr [rsp + 8], r10
01c4a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01c4f 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01c54 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c59 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c5e 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01c63 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01c68 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01c6d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01c72 90                             nop        
01c73 90                             nop        
01c74 c5f877                         vzeroupper 
01c77 e86487afff                     call       0x7efc7b6cda60
01c7c 0f1f8400741d0014               nop        dword ptr [rax + rax + 0x14001d74]
01c84 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
01c8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c92 e8c901cd17                     call       0x7efc938a54e0
01c97 f4                             hlt        
01c98 85c9                           test       ecx, ecx
01c9a 0f84b00d0000                   je         0x7efc7bbd60d0
01ca0 8b1c24                         mov        ebx, dword ptr [rsp]
01ca3 458bda                         mov        r11d, r10d
01ca6 4533c0                         xor        r8d, r8d
01ca9 448bd3                         mov        r10d, ebx
01cac e9baefffff                     jmp        0x7efc7bbd42eb
01cb1 bee4ffffff                     mov        esi, 0xffffffe4
01cb6 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01cbb 448b1424                       mov        r10d, dword ptr [rsp]
01cbf 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01cc7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01ccc 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01cd4 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01cd9 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01ce1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ce6 4c891424                       mov        qword ptr [rsp], r10
01cea 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01cef 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01cf4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01cf9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01cfe 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01d03 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01d08 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01d0d 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01d12 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01d17 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01d1b 90                             nop        
01d1c c5f877                         vzeroupper 
01d1f e8bc86afff                     call       0x7efc7b6cda60
01d24 0f1f84001c1e0015               nop        dword ptr [rax + rax + 0x15001e1c]
01d2c 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
01d36 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d3a e82101cd17                     call       0x7efc938a54e0
01d3f f4                             hlt        
01d40 be6effffff                     mov        esi, 0xffffff6e
01d45 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01d4a 448b1424                       mov        r10d, dword ptr [rsp]
01d4e 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01d56 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01d5b 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01d63 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01d68 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01d70 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01d75 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d7a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d7f 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01d84 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01d89 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01d8e 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01d93 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01d98 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01d9d 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01da2 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01da6 90                             nop        
01da7 90                             nop        
01da8 c5f877                         vzeroupper 
01dab e83086afff                     call       0x7efc7b6cda60
01db0 0f1f8400a81e0016               nop        dword ptr [rax + rax + 0x16001ea8]
01db8 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
01dc2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dc6 e89500cd17                     call       0x7efc938a54e0
01dcb f4                             hlt        
01dcc be45ffffff                     mov        esi, 0xffffff45
01dd1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01dd6 448b1424                       mov        r10d, dword ptr [rsp]
01dda 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01de2 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01de7 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01def 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01df4 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01dfc 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01e01 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e06 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e0b 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01e10 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01e15 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01e1a 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01e1f 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01e24 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01e29 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01e2d 90                             nop        
01e2e 90                             nop        
01e2f 90                             nop        
01e30 c5f877                         vzeroupper 
01e33 e8a885afff                     call       0x7efc7b6cda60
01e38 0f1f8400301f0017               nop        dword ptr [rax + rax + 0x17001f30]
01e40 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
01e4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e4e e80d00cd17                     call       0x7efc938a54e0
01e53 f4                             hlt        
01e54 be3dffffff                     mov        esi, 0xffffff3d
01e59 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01e5e 448b1424                       mov        r10d, dword ptr [rsp]
01e62 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01e6a 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01e6f 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01e77 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01e7c 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01e84 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01e89 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e8e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e93 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01e98 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01e9d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01ea2 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01ea7 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01eac 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01eb1 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01eb5 90                             nop        
01eb6 90                             nop        
01eb7 90                             nop        
01eb8 c5f877                         vzeroupper 
01ebb e82085afff                     call       0x7efc7b6cda60
01ec0 0f1f8400b81f0018               nop        dword ptr [rax + rax + 0x18001fb8]
01ec8 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
01ed2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ed6 e885ffcc17                     call       0x7efc938a54e0
01edb f4                             hlt        
01edc bee4ffffff                     mov        esi, 0xffffffe4
01ee1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01ee6 448b0424                       mov        r8d, dword ptr [rsp]
01eea 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01ef2 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01ef7 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01eff 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01f04 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01f0c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01f11 4c891c24                       mov        qword ptr [rsp], r11
01f15 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01f1a 4489442408                     mov        dword ptr [rsp + 8], r8d
01f1f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01f24 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01f29 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01f2e 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01f33 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01f38 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
01f3d 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01f42 90                             nop        
01f43 90                             nop        
01f44 c5f877                         vzeroupper 
01f47 e89484afff                     call       0x7efc7b6cda60
01f4c 0f1f840044200019               nop        dword ptr [rax + rax + 0x19002044]
01f54 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
01f5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f62 e8f9fecc17                     call       0x7efc938a54e0
01f67 f4                             hlt        
01f68 bee4ffffff                     mov        esi, 0xffffffe4
01f6d 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01f72 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
01f7a 448b0424                       mov        r8d, dword ptr [rsp]
01f7e 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
01f86 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01f8b 4c891c24                       mov        qword ptr [rsp], r11
01f8f 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01f94 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
01f9c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01fa1 4c895c2408                     mov        qword ptr [rsp + 8], r11
01fa6 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01fab 4489442410                     mov        dword ptr [rsp + 0x10], r8d
01fb0 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01fb5 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01fba 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01fbf 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01fc4 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01fc9 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01fce 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01fd3 90                             nop        
01fd4 c5f877                         vzeroupper 
01fd7 e80484afff                     call       0x7efc7b6cda60
01fdc 0f1f8400d420001a               nop        dword ptr [rax + rax + 0x1a0020d4]
01fe4 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
01fee 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ff2 e869fecc17                     call       0x7efc938a54e0
01ff7 f4                             hlt        
01ff8 418d6a01                       lea        ebp, [r10 + 1]
01ffc bee4ffffff                     mov        esi, 0xffffffe4
02001 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
02006 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
0200e 448b0424                       mov        r8d, dword ptr [rsp]
02012 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
0201a 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0201f 4c891c24                       mov        qword ptr [rsp], r11
02023 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02028 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
02030 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02035 4c895c2408                     mov        qword ptr [rsp + 8], r11
0203a 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0203f 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02044 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02049 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0204e 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02053 4489442424                     mov        dword ptr [rsp + 0x24], r8d
02058 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0205d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02062 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
02067 90                             nop        
02068 c5f877                         vzeroupper 
0206b e87083afff                     call       0x7efc7b6cda60
02070 0f1f84006821001b               nop        dword ptr [rax + rax + 0x1b002168]
02078 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
02082 4883e4f0                       and        rsp, 0xfffffffffffffff0
02086 e8d5fdcc17                     call       0x7efc938a54e0
0208b f4                             hlt        
0208c bee4ffffff                     mov        esi, 0xffffffe4
02091 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
02096 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
0209e 448b0424                       mov        r8d, dword ptr [rsp]
020a2 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
020aa 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
020af 4c891c24                       mov        qword ptr [rsp], r11
020b3 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
020b8 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
020c0 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
020c5 4c895c2408                     mov        qword ptr [rsp + 8], r11
020ca 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
020cf 4489442410                     mov        dword ptr [rsp + 0x10], r8d
020d4 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
020d9 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
020de 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
020e3 4489442420                     mov        dword ptr [rsp + 0x20], r8d
020e8 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
020ed 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
020f2 4489542434                     mov        dword ptr [rsp + 0x34], r10d
020f7 90                             nop        
020f8 c5f877                         vzeroupper 
020fb e8e082afff                     call       0x7efc7b6cda60
02100 0f1f8400f821001c               nop        dword ptr [rax + rax + 0x1c0021f8]
02108 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
02112 4883e4f0                       and        rsp, 0xfffffffffffffff0
02116 e845fdcc17                     call       0x7efc938a54e0
0211b f4                             hlt        
0211c bee4ffffff                     mov        esi, 0xffffffe4
02121 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
02126 448b0424                       mov        r8d, dword ptr [rsp]
0212a 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
02132 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02137 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
0213f 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02144 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0214c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02151 4c891c24                       mov        qword ptr [rsp], r11
02155 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0215a 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0215f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02164 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
02169 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0216e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02173 90                             nop        
02174 c5f877                         vzeroupper 
02177 e86482afff                     call       0x7efc7b6cda60
0217c 0f1f84007422001d               nop        dword ptr [rax + rax + 0x1d002274]
02184 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
0218e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02192 e8c9fccc17                     call       0x7efc938a54e0
02197 f4                             hlt        
02198 beccffffff                     mov        esi, 0xffffffcc
0219d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
021a2 448b0424                       mov        r8d, dword ptr [rsp]
021a6 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
021ae 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
021b3 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
021bb 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
021c0 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
021c8 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
021cd 4c891c24                       mov        qword ptr [rsp], r11
021d1 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
021d6 4489442408                     mov        dword ptr [rsp + 8], r8d
021db 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
021e0 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
021e5 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
021ea 4489442418                     mov        dword ptr [rsp + 0x18], r8d
021ef 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
021f4 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
021f9 4489542438                     mov        dword ptr [rsp + 0x38], r10d
021fe 90                             nop        
021ff 90                             nop        
02200 c5f877                         vzeroupper 
02203 e8d881afff                     call       0x7efc7b6cda60
02208 0f1f84000023001e               nop        dword ptr [rax + rax + 0x1e002300]
02210 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
0221a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0221e e83dfccc17                     call       0x7efc938a54e0
02223 f4                             hlt        
02224 be45ffffff                     mov        esi, 0xffffff45
02229 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0222e 448b0424                       mov        r8d, dword ptr [rsp]
02232 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
0223a 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0223f 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
02247 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0224c 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02254 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02259 4c891c24                       mov        qword ptr [rsp], r11
0225d 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02262 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02267 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0226c c5f877                         vzeroupper 
0226f e86c81afff                     call       0x7efc7b6cda60
02274 0f1f84006c23001f               nop        dword ptr [rax + rax + 0x1f00236c]
0227c 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
02286 4883e4f0                       and        rsp, 0xfffffffffffffff0
0228a e8d1fbcc17                     call       0x7efc938a54e0
0228f f4                             hlt        
02290 be17000000                     mov        esi, 0x17
02295 90                             nop        
02296 90                             nop        
02297 90                             nop        
02298 c5f877                         vzeroupper 
0229b e84081afff                     call       0x7efc7b6cda60
022a0 0f1f840098230020               nop        dword ptr [rax + rax + 0x20002398]
022a8 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
022b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
022b6 e8a5fbcc17                     call       0x7efc938a54e0
022bb f4                             hlt        
022bc be6effffff                     mov        esi, 0xffffff6e
022c1 498bee                         mov        rbp, r14
022c4 8b1424                         mov        edx, dword ptr [rsp]
022c7 899424d0000000                 mov        dword ptr [rsp + 0xd0], edx
022ce 4c891c24                       mov        qword ptr [rsp], r11
022d2 894c2408                       mov        dword ptr [rsp + 8], ecx
022d6 48ff742420                     push       qword ptr [rsp + 0x20]
022db 488f442410                     pop        qword ptr [rsp + 0x10]
022e0 897c2418                       mov        dword ptr [rsp + 0x18], edi
022e4 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
022e9 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
022ee 895c2430                       mov        dword ptr [rsp + 0x30], ebx
022f2 4c89442438                     mov        qword ptr [rsp + 0x38], r8
022f7 90                             nop        
022f8 c5f877                         vzeroupper 
022fb e8e080afff                     call       0x7efc7b6cda60
02300 0f1f8400f8230021               nop        dword ptr [rax + rax + 0x210023f8]
02308 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
02312 4883e4f0                       and        rsp, 0xfffffffffffffff0
02316 e845fbcc17                     call       0x7efc938a54e0
0231b f4                             hlt        
0231c bebeffffff                     mov        esi, 0xffffffbe
02321 4c89b424d0000000               mov        qword ptr [rsp + 0xd0], r14
02329 448b1424                       mov        r10d, dword ptr [rsp]
0232d 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
02335 4c891c24                       mov        qword ptr [rsp], r11
02339 894c2408                       mov        dword ptr [rsp + 8], ecx
0233d 48ff742420                     push       qword ptr [rsp + 0x20]
02342 488f442410                     pop        qword ptr [rsp + 0x10]
02347 897c2418                       mov        dword ptr [rsp + 0x18], edi
0234b 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
02350 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
02355 895c2430                       mov        dword ptr [rsp + 0x30], ebx
02359 4c89442438                     mov        qword ptr [rsp + 0x38], r8
0235e 90                             nop        
0235f 90                             nop        
02360 c5f877                         vzeroupper 
02363 e87880afff                     call       0x7efc7b6cda60
02368 0f1f840060240022               nop        dword ptr [rax + rax + 0x22002460]
02370 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
0237a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0237e e8ddfacc17                     call       0x7efc938a54e0
02383 f4                             hlt        
02384 4c8b742440                     mov        r14, qword ptr [rsp + 0x40]
02389 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
0238d beccffffff                     mov        esi, 0xffffffcc
02392 4c89b424d0000000               mov        qword ptr [rsp + 0xd0], r14
0239a 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
023a2 898c24dc000000                 mov        dword ptr [rsp + 0xdc], ecx
023a9 44891c24                       mov        dword ptr [rsp], r11d
023ad 4489542410                     mov        dword ptr [rsp + 0x10], r10d
023b2 90                             nop        
023b3 90                             nop        
023b4 c5f877                         vzeroupper 
023b7 e82480afff                     call       0x7efc7b6cda60
023bc 0f1f8400b4240023               nop        dword ptr [rax + rax + 0x230024b4]
023c4 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
023ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
023d2 e889facc17                     call       0x7efc938a54e0
023d7 f4                             hlt        
023d8 bee4ffffff                     mov        esi, 0xffffffe4
023dd 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
023e2 448b0424                       mov        r8d, dword ptr [rsp]
023e6 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
023ee 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
023f3 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
023fb 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02400 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02408 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0240d 4c891c24                       mov        qword ptr [rsp], r11
02411 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
02416 4489442408                     mov        dword ptr [rsp + 8], r8d
0241b 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02420 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02425 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0242a 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0242f 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02434 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
02439 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0243e 90                             nop        
0243f 90                             nop        
02440 c5f877                         vzeroupper 
02443 e8987fafff                     call       0x7efc7b6cda60
02448 0f1f840040250024               nop        dword ptr [rax + rax + 0x24002540]
02450 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
0245a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0245e e8fdf9cc17                     call       0x7efc938a54e0
02463 f4                             hlt        
02464 bee4ffffff                     mov        esi, 0xffffffe4
02469 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0246e 448b0424                       mov        r8d, dword ptr [rsp]
02472 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
0247a 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0247f 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
02487 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0248c 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02494 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02499 4c891c24                       mov        qword ptr [rsp], r11
0249d 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
024a2 4489442408                     mov        dword ptr [rsp + 8], r8d
024a7 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
024ac 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
024b1 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
024b6 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
024bb 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
024c0 c5f877                         vzeroupper 
024c3 e8187fafff                     call       0x7efc7b6cda60
024c8 0f1f8400c0250025               nop        dword ptr [rax + rax + 0x250025c0]
024d0 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
024da 4883e4f0                       and        rsp, 0xfffffffffffffff0
024de e87df9cc17                     call       0x7efc938a54e0
024e3 f4                             hlt        
024e4 4183c208                       add        r10d, 8
024e8 be6effffff                     mov        esi, 0xffffff6e
024ed 448b0424                       mov        r8d, dword ptr [rsp]
024f1 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
024f9 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
024fe 4c891c24                       mov        qword ptr [rsp], r11
02502 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02507 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
0250f 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02514 4c895c2408                     mov        qword ptr [rsp + 8], r11
02519 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0251e 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02523 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
0252b 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02530 458bd8                         mov        r11d, r8d
02533 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02538 c5f877                         vzeroupper 
0253b e8a07eafff                     call       0x7efc7b6cda60
02540 0f1f840038260026               nop        dword ptr [rax + rax + 0x26002638]
02548 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
02552 4883e4f0                       and        rsp, 0xfffffffffffffff0
02556 e805f9cc17                     call       0x7efc938a54e0
0255b f4                             hlt        
0255c 4183c208                       add        r10d, 8
02560 beb6ffffff                     mov        esi, 0xffffffb6
02565 448b0424                       mov        r8d, dword ptr [rsp]
02569 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
02571 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02576 4c891c24                       mov        qword ptr [rsp], r11
0257a 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0257f 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
02587 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0258c 4c895c2408                     mov        qword ptr [rsp + 8], r11
02591 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02596 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0259b 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
025a3 4489542430                     mov        dword ptr [rsp + 0x30], r10d
025a8 458bd8                         mov        r11d, r8d
025ab 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
025b0 c5f877                         vzeroupper 
025b3 e8287eafff                     call       0x7efc7b6cda60
025b8 0f1f8400b0260027               nop        dword ptr [rax + rax + 0x270026b0]
025c0 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
025ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
025ce e88df8cc17                     call       0x7efc938a54e0
025d3 f4                             hlt        
025d4 4183c208                       add        r10d, 8
025d8 be66ffffff                     mov        esi, 0xffffff66
025dd 448b0424                       mov        r8d, dword ptr [rsp]
025e1 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
025e9 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
025ee 4c891c24                       mov        qword ptr [rsp], r11
025f2 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
025f7 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
025ff 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02604 4c895c2408                     mov        qword ptr [rsp + 8], r11
02609 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0260e 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02613 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
0261b 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02620 458bd8                         mov        r11d, r8d
02623 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02628 c5f877                         vzeroupper 
0262b e8b07dafff                     call       0x7efc7b6cda60
02630 0f1f840028270028               nop        dword ptr [rax + rax + 0x28002728]
02638 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
02642 4883e4f0                       and        rsp, 0xfffffffffffffff0
02646 e815f8cc17                     call       0x7efc938a54e0
0264b f4                             hlt        
0264c 418bc8                         mov        ecx, r8d
0264f e9aeebffff                     jmp        0x7efc7bbd4882
02654 48bf70077754fc7e0000           movabs     rdi, 0x7efc54770770
0265e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02662 e8f9f7cc17                     call       0x7efc938a54e0
02667 f4                             hlt        
02668 48bf70077754fc7e0000           movabs     rdi, 0x7efc54770770
02672 4883e4f0                       and        rsp, 0xfffffffffffffff0
02676 e8e5f7cc17                     call       0x7efc938a54e0
0267b f4                             hlt        
0267c 48bf70077754fc7e0000           movabs     rdi, 0x7efc54770770
02686 4883e4f0                       and        rsp, 0xfffffffffffffff0
0268a e8d1f7cc17                     call       0x7efc938a54e0
0268f f4                             hlt        
02690 48bf70077754fc7e0000           movabs     rdi, 0x7efc54770770
0269a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0269e e8bdf7cc17                     call       0x7efc938a54e0
026a3 f4                             hlt        
026a4 bee4ffffff                     mov        esi, 0xffffffe4
026a9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
026ae 448b1424                       mov        r10d, dword ptr [rsp]
026b2 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
026ba 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
026bf 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
026c7 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
026cc 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
026d4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
026d9 4c891424                       mov        qword ptr [rsp], r10
026dd 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
026e2 44895c2408                     mov        dword ptr [rsp + 8], r11d
026e7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
026ec 4c89542410                     mov        qword ptr [rsp + 0x10], r10
026f1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
026f6 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
026fb 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02700 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
02705 4489742424                     mov        dword ptr [rsp + 0x24], r14d
0270a 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0270e 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
02713 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
02718 c5f877                         vzeroupper 
0271b e8c07cafff                     call       0x7efc7b6cda60
02720 0f1f840018280029               nop        dword ptr [rax + rax + 0x29002818]
02728 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
02732 4883e4f0                       and        rsp, 0xfffffffffffffff0
02736 e825f7cc17                     call       0x7efc938a54e0
0273b f4                             hlt        
0273c c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
02745 bee4ffffff                     mov        esi, 0xffffffe4
0274a 498bea                         mov        rbp, r10
0274d 448b1424                       mov        r10d, dword ptr [rsp]
02751 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
02759 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0275e 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
02766 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0276b 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02773 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02778 4c891424                       mov        qword ptr [rsp], r10
0277c 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02781 44895c2408                     mov        dword ptr [rsp + 8], r11d
02786 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0278b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02790 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02795 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0279a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0279f 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
027a4 4489742424                     mov        dword ptr [rsp + 0x24], r14d
027a9 895c2430                       mov        dword ptr [rsp + 0x30], ebx
027ad 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
027b2 89542440                       mov        dword ptr [rsp + 0x40], edx
027b6 90                             nop        
027b7 90                             nop        
027b8 c5f877                         vzeroupper 
027bb e8207cafff                     call       0x7efc7b6cda60
027c0 0f1f8400b828002a               nop        dword ptr [rax + rax + 0x2a0028b8]
027c8 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
027d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
027d6 e885f6cc17                     call       0x7efc938a54e0
027db f4                             hlt        
027dc 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
027e4 beccffffff                     mov        esi, 0xffffffcc
027e9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
027ee 448b1c24                       mov        r11d, dword ptr [rsp]
027f2 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
027fa 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
027ff 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
02807 448b542408                     mov        r10d, dword ptr [rsp + 8]
0280c 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
02814 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02819 4c891424                       mov        qword ptr [rsp], r10
0281d 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02822 44895c2408                     mov        dword ptr [rsp + 8], r11d
02827 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0282c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02831 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02836 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0283b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02840 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02845 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
0284a 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0284f 4489742448                     mov        dword ptr [rsp + 0x48], r14d
02854 c5f877                         vzeroupper 
02857 e8847bafff                     call       0x7efc7b6cda60
0285c 0f1f84005429002b               nop        dword ptr [rax + rax + 0x2b002954]
02864 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
0286e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02872 e8e9f5cc17                     call       0x7efc938a54e0
02877 f4                             hlt        
02878 418bed                         mov        ebp, r13d
0287b 83c510                         add        ebp, 0x10
0287e be6effffff                     mov        esi, 0xffffff6e
02883 448b1424                       mov        r10d, dword ptr [rsp]
02887 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
0288f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02894 4c891424                       mov        qword ptr [rsp], r10
02898 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0289d 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
028a5 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
028aa 4c89542408                     mov        qword ptr [rsp + 8], r10
028af 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
028b4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
028b9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
028be 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
028c3 4489542420                     mov        dword ptr [rsp + 0x20], r10d
028c8 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
028cd 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
028d2 448974242c                     mov        dword ptr [rsp + 0x2c], r14d
028d7 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
028db 90                             nop        
028dc c5f877                         vzeroupper 
028df e8fc7aafff                     call       0x7efc7b6cda60
028e4 0f1f8400dc29002c               nop        dword ptr [rax + rax + 0x2c0029dc]
028ec 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
028f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
028fa e861f5cc17                     call       0x7efc938a54e0
028ff f4                             hlt        
02900 418bed                         mov        ebp, r13d
02903 83c510                         add        ebp, 0x10
02906 be66ffffff                     mov        esi, 0xffffff66
0290b 448b1c24                       mov        r11d, dword ptr [rsp]
0290f 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
02917 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0291c 4c891424                       mov        qword ptr [rsp], r10
02920 448b542408                     mov        r10d, dword ptr [rsp + 8]
02925 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
0292d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02932 4c89542408                     mov        qword ptr [rsp + 8], r10
02937 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
0293c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02941 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02946 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0294b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02950 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02955 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0295a 448974242c                     mov        dword ptr [rsp + 0x2c], r14d
0295f 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
02963 90                             nop        
02964 c5f877                         vzeroupper 
02967 e8747aafff                     call       0x7efc7b6cda60
0296c 0f1f8400642a002d               nop        dword ptr [rax + rax + 0x2d002a64]
02974 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
0297e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02982 e8d9f4cc17                     call       0x7efc938a54e0
02987 f4                             hlt        
02988 48bf70077754fc7e0000           movabs     rdi, 0x7efc54770770
02992 4883e4f0                       and        rsp, 0xfffffffffffffff0
02996 e8c5f4cc17                     call       0x7efc938a54e0
0299b f4                             hlt        
0299c 48bf70077754fc7e0000           movabs     rdi, 0x7efc54770770
029a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
029aa e8b1f4cc17                     call       0x7efc938a54e0
029af f4                             hlt        
029b0 48bf70077754fc7e0000           movabs     rdi, 0x7efc54770770
029ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
029be e89df4cc17                     call       0x7efc938a54e0
029c3 f4                             hlt        
029c4 48bf70077754fc7e0000           movabs     rdi, 0x7efc54770770
029ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
029d2 e889f4cc17                     call       0x7efc938a54e0
029d7 f4                             hlt        
029d8 48bf70077754fc7e0000           movabs     rdi, 0x7efc54770770
029e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
029e6 e875f4cc17                     call       0x7efc938a54e0
029eb f4                             hlt        
029ec 48bf70077754fc7e0000           movabs     rdi, 0x7efc54770770
029f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
029fa e861f4cc17                     call       0x7efc938a54e0
029ff f4                             hlt        
02a00 48bf70077754fc7e0000           movabs     rdi, 0x7efc54770770
02a0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a0e e84df4cc17                     call       0x7efc938a54e0
02a13 f4                             hlt        
02a14 48bf70077754fc7e0000           movabs     rdi, 0x7efc54770770
02a1e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a22 e839f4cc17                     call       0x7efc938a54e0
02a27 f4                             hlt        
02a28 48bf70077754fc7e0000           movabs     rdi, 0x7efc54770770
02a32 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a36 e825f4cc17                     call       0x7efc938a54e0
02a3b f4                             hlt        
02a3c 48bf70077754fc7e0000           movabs     rdi, 0x7efc54770770
02a46 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a4a e811f4cc17                     call       0x7efc938a54e0
02a4f f4                             hlt        
02a50 bef6ffffff                     mov        esi, 0xfffffff6
02a55 488bea                         mov        rbp, rdx
02a58 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
02a60 c5f877                         vzeroupper 
02a63 e87879afff                     call       0x7efc7b6cda60
02a68 0f1f8400602b002e               nop        dword ptr [rax + rax + 0x2e002b60]
02a70 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
02a7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a7e e8ddf3cc17                     call       0x7efc938a54e0
02a83 f4                             hlt        
02a84 488bf0                         mov        rsi, rax
02a87 eb0d                           jmp        0x7efc7bbd6116
02a89 488bf0                         mov        rsi, rax
02a8c eb08                           jmp        0x7efc7bbd6116
02a8e 488bf0                         mov        rsi, rax
02a91 eb03                           jmp        0x7efc7bbd6116
02a93 488bf0                         mov        rsi, rax
02a96 c5f877                         vzeroupper 
02a99 4881c4c0000000                 add        rsp, 0xc0
02aa0 5d                             pop        rbp
02aa1 e93a2fafff                     jmp        0x7efc7b6c9060
02aa6 bef6ffffff                     mov        esi, 0xfffffff6
02aab 90                             nop        
02aac c5f877                         vzeroupper 
02aaf e82c79afff                     call       0x7efc7b6cda60
02ab4 0f1f8400ac2b002f               nop        dword ptr [rax + rax + 0x2f002bac]
02abc 48bf00b67654fc7e0000           movabs     rdi, 0x7efc5476b600
02ac6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02aca e891f3cc17                     call       0x7efc938a54e0
02acf f4                             hlt        
02ad0 49ba6243bd7bfc7e0000           movabs     r10, 0x7efc7bbd4362
02ada 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02ae1 e9fac1b5ff                     jmp        0x7efc7b732360
02ae6 e87590b4ff                     call       0x7efc7b71f1e0
02aeb e94ed5ffff                     jmp        0x7efc7bbd36be
