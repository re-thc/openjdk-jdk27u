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
0001a 0f85c0ccb4ff                   jne        0x7f6a9772ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ecd0000000                 sub        rsp, 0xd0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85ac340000                   jne        0x7f6a97be556a
0003e 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 498bc0                         mov        rax, r8
00049 4c8bda                         mov        r11, rdx
0004c 4889742408                     mov        qword ptr [rsp + 8], rsi
00051 448b5638                       mov        r10d, dword ptr [rsi + 0x38]
00055 448b4604                       mov        r8d, dword ptr [rsi + 4]
00059 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0005e 452bc2                         sub        r8d, r10d
00061 448b8c24e0000000               mov        r9d, dword ptr [rsp + 0xe0]
00069 453bc8                         cmp        r9d, r8d
0006c 0f8f4a2a0000                   jg         0x7f6a97be4b3c
00072 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00076 4c89442430                     mov        qword ptr [rsp + 0x30], r8
0007b 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
0007f 48638c24e0000000               movsxd     rcx, dword ptr [rsp + 0xe0]
00087 4d63ca                         movsxd     r9, r10d
0008a 4c034c2430                     add        r9, qword ptr [rsp + 0x30]
0008f 4d2bc1                         sub        r8, r9
00092 493bc8                         cmp        rcx, r8
00095 0f8f212a0000                   jg         0x7f6a97be4b3c
0009b 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
0009f 4c89442448                     mov        qword ptr [rsp + 0x48], r8
000a4 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000a8 4d85c0                         test       r8, r8
000ab 0f845e150000                   je         0x7f6a97be368f
000b1 33d2                           xor        edx, edx
000b3 4d8bf3                         mov        r14, r11
000b6 418b7304                       mov        esi, dword ptr [r11 + 4]
000ba 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
000bf 418b5b40                       mov        ebx, dword ptr [r11 + 0x40]
000c3 448bef                         mov        r13d, edi
000c6 85ff                           test       edi, edi
000c8 0f8eda220000                   jle        0x7f6a97be4428
000ce 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
000d6 4c2b442430                     sub        r8, qword ptr [rsp + 0x30]
000db 448d4ee0                       lea        r9d, [rsi - 0x20]
000df 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
000e3 83c1e0                         add        ecx, -0x20
000e6 4c8bd8                         mov        r11, rax
000e9 418b7b04                       mov        edi, dword ptr [r11 + 4]
000ed 85ff                           test       edi, edi
000ef 0f86f3290000                   jbe        0x7f6a97be4b68
000f5 4c63d7                         movsxd     r10, edi
000f8 4963fd                         movsxd     rdi, r13d
000fb 48ffcf                         dec        rdi
000fe 493bfa                         cmp        rdi, r10
00101 0f83e1290000                   jae        0x7f6a97be4b68
00107 488b8424e8000000               mov        rax, qword ptr [rsp + 0xe8]
0010f 8b7804                         mov        edi, dword ptr [rax + 4]
00112 85ff                           test       edi, edi
00114 0f864a2a0000                   jbe        0x7f6a97be4be4
0011a 83ff01                         cmp        edi, 1
0011d 0f86412a0000                   jbe        0x7f6a97be4be4
00123 83ff02                         cmp        edi, 2
00126 0f86382a0000                   jbe        0x7f6a97be4be4
0012c 448d56f1                       lea        r10d, [rsi - 0xf]
00130 4585d2                         test       r10d, r10d
00133 0f8c2b2a0000                   jl         0x7f6a97be4be4
00139 8b6b04                         mov        ebp, dword ptr [rbx + 4]
0013c 448d55f1                       lea        r10d, [rbp - 0xf]
00140 4585d2                         test       r10d, r10d
00143 0f8c1b2a0000                   jl         0x7f6a97be4be4
00149 448d55f9                       lea        r10d, [rbp - 7]
0014d 4585d2                         test       r10d, r10d
00150 0f8c0e2a0000                   jl         0x7f6a97be4be4
00156 89ac24e8000000                 mov        dword ptr [rsp + 0xe8], ebp
0015d 89bc24e4000000                 mov        dword ptr [rsp + 0xe4], edi
00164 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00168 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
0016d 89b424e0000000                 mov        dword ptr [rsp + 0xe0], esi
00174 89542438                       mov        dword ptr [rsp + 0x38], edx
00178 4c89442440                     mov        qword ptr [rsp + 0x40], r8
0017d 4889442458                     mov        qword ptr [rsp + 0x58], rax
00182 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
00187 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
0018c 4c89742468                     mov        qword ptr [rsp + 0x68], r14
00191 4c8bd3                         mov        r10, rbx
00194 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00199 895c2470                       mov        dword ptr [rsp + 0x70], ebx
0019d 448bd5                         mov        r10d, ebp
001a0 448bc6                         mov        r8d, esi
001a3 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
001ab 4d63da                         movsxd     r11, r10d
001ae 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
001b3 458d58f1                       lea        r11d, [r8 - 0xf]
001b7 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
001bc 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
001c1 4983c3f9                       add        r11, -7
001c5 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
001cd 458d42f9                       lea        r8d, [r10 - 7]
001d1 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
001d9 4183c2f1                       add        r10d, -0xf
001dd 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
001e5 4533f6                         xor        r14d, r14d
001e8 4533c0                         xor        r8d, r8d
001eb e946040000                     jmp        0x7f6a97be26b6
001f0 448bdb                         mov        r11d, ebx
001f3 4d63d3                         movsxd     r10, r11d
001f6 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
001fd c442a8f5db                     bzhi       r11, r11, r10
00202 c4c1fb92fb                     kmovq      k7, r11
00207 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0020d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00213 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
0021b 4403d3                         add        r10d, ebx
0021e 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00226 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0022a 418502                         test       dword ptr [r10], eax
0022d 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00235 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
0023d 0f8d8d0a0000                   jge        0x7f6a97be2d50
00243 418bed                         mov        ebp, r13d
00246 448bcd                         mov        r9d, ebp
00249 442b8c2498000000               sub        r9d, dword ptr [rsp + 0x98]
00251 8b9c2490000000                 mov        ebx, dword ptr [rsp + 0x90]
00258 2b9c2498000000                 sub        ebx, dword ptr [rsp + 0x98]
0025f 3b9c2498000000                 cmp        ebx, dword ptr [rsp + 0x98]
00266 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
0026e 410f4fdb                       cmovg      ebx, r11d
00272 4585c9                         test       r9d, r9d
00275 0f8c391c0000                   jl         0x7f6a97be3f34
0027b 85ed                           test       ebp, ebp
0027d 0f8c311c0000                   jl         0x7f6a97be3f34
00283 468d140b                       lea        r10d, [rbx + r9]
00287 448b9c24e8000000               mov        r11d, dword ptr [rsp + 0xe8]
0028f 453bda                         cmp        r11d, r10d
00292 0f821c1c0000                   jb         0x7f6a97be3f34
00298 448d2c2b                       lea        r13d, [rbx + rbp]
0029c 453bdd                         cmp        r11d, r13d
0029f 0f820f1c0000                   jb         0x7f6a97be3f34
002a5 85db                           test       ebx, ebx
002a7 0f8c071c0000                   jl         0x7f6a97be3f34
002ad 85db                           test       ebx, ebx
002af 0f845effffff                   je         0x7f6a97be2293
002b5 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
002ba 498d742a08                     lea        rsi, [r10 + rbp + 8]
002bf 4b8d7c0a08                     lea        rdi, [r10 + r9 + 8]
002c4 4863d3                         movsxd     rdx, ebx
002c7 4883fa20                       cmp        rdx, 0x20
002cb 0f861fffffff                   jbe        0x7f6a97be2270
002d1 c5f877                         vzeroupper 
002d4 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
002de 41ffd2                         call       r10
002e1 0f1f840000000000               nop        dword ptr [rax + rax]
002e9 e925ffffff                     jmp        0x7f6a97be2293
002ee 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
002f6 c4817a7f440b08                 vmovdqu    xmmword ptr [r11 + r9 + 8], xmm0
002fd 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00305 4503d1                         add        r10d, r9d
00308 e903030000                     jmp        0x7f6a97be2690
0030d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00312 4b8d7c2a08                     lea        rdi, [r10 + r13 + 8]
00317 458bda                         mov        r11d, r10d
0031a 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00322 4b8d741308                     lea        rsi, [r11 + r10 + 8]
00327 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0032f 4403942494000000               add        r10d, dword ptr [rsp + 0x94]
00337 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
0033f 4963ca                         movsxd     rcx, r10d
00342 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
0034a 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
00352 0f8c05070000                   jl         0x7f6a97be2add
00358 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00360 4183fa30                       cmp        r10d, 0x30
00364 0f8e98000000                   jle        0x7f6a97be2482
0036a 4585ed                         test       r13d, r13d
0036d 0f8cf11b0000                   jl         0x7f6a97be3fe4
00373 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0037b 4585db                         test       r11d, r11d
0037e 0f8ce01b0000                   jl         0x7f6a97be3fe4
00384 4503d5                         add        r10d, r13d
00387 448b8424e8000000               mov        r8d, dword ptr [rsp + 0xe8]
0038f 453bc2                         cmp        r8d, r10d
00392 0f82cc1b0000                   jb         0x7f6a97be3fe4
00398 443b8424a8000000               cmp        r8d, dword ptr [rsp + 0xa8]
003a0 0f82be1b0000                   jb         0x7f6a97be3fe4
003a6 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
003ae 4585db                         test       r11d, r11d
003b1 0f8449020000                   je         0x7f6a97be2680
003b7 4963d3                         movsxd     rdx, r11d
003ba 4883fa20                       cmp        rdx, 0x20
003be 7725                           ja         0x7f6a97be2465
003c0 4d63d3                         movsxd     r10, r11d
003c3 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
003ca c442a8f5db                     bzhi       r11, r11, r10
003cf c4c1fb92fb                     kmovq      k7, r11
003d4 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
003da 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
003e0 e91b020000                     jmp        0x7f6a97be2680
003e5 c5f877                         vzeroupper 
003e8 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
003f2 41ffd2                         call       r10
003f5 0f1f840000000000               nop        dword ptr [rax + rax]
003fd e9fe010000                     jmp        0x7f6a97be2680
00402 443bac2488000000               cmp        r13d, dword ptr [rsp + 0x88]
0040a 0f83fc160000                   jae        0x7f6a97be3b8c
00410 4963dd                         movsxd     rbx, r13d
00413 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00418 4d8b441b08                     mov        r8, qword ptr [r11 + rbx + 8]
0041d 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00425 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
0042d 0f83a1170000                   jae        0x7f6a97be3c54
00433 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0043b 458d5a08                       lea        r11d, [r10 + 8]
0043f 4d63ca                         movsxd     r9, r10d
00442 8b7c2470                       mov        edi, dword ptr [rsp + 0x70]
00446 4e89440f08                     mov        qword ptr [rdi + r9 + 8], r8
0044b 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
00453 0f8da7010000                   jge        0x7f6a97be2680
00459 492bd9                         sub        rbx, r9
0045c 4d63cb                         movsxd     r9, r11d
0045f 4d8d0419                       lea        r8, [r9 + rbx]
00463 4c3b842480000000               cmp        r8, qword ptr [rsp + 0x80]
0046b 0f832f180000                   jae        0x7f6a97be3d20
00471 4c8bc1                         mov        r8, rcx
00474 4d2bc1                         sub        r8, r9
00477 4983c007                       add        r8, 7
0047b 4983e0f8                       and        r8, 0xfffffffffffffff8
0047f 458bc8                         mov        r9d, r8d
00482 478d441108                     lea        r8d, [r9 + r10 + 8]
00487 4d63c0                         movsxd     r8, r8d
0048a 4d8d4c18f8                     lea        r9, [r8 + rbx - 8]
0048f 4c3b8c2480000000               cmp        r9, qword ptr [rsp + 0x80]
00497 0f8303180000                   jae        0x7f6a97be3d20
0049d 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
004a5 0f83f5170000                   jae        0x7f6a97be3d20
004ab 4983c0f8                       add        r8, -8
004af 4c3b842480000000               cmp        r8, qword ptr [rsp + 0x80]
004b7 0f83e3170000                   jae        0x7f6a97be3d20
004bd 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
004c5 4181f8f8ffff7f                 cmp        r8d, 0x7ffffff8
004cc 0f8f9a180000                   jg         0x7f6a97be3dec
004d2 452bea                         sub        r13d, r10d
004d5 4183c210                       add        r10d, 0x10
004d9 478d0c2b                       lea        r9d, [r11 + r13]
004dd 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
004e2 4b8b7c0808                     mov        rdi, qword ptr [r8 + r9 + 8]
004e7 458bcb                         mov        r9d, r11d
004ea 4b897c0808                     mov        qword ptr [r8 + r9 + 8], rdi
004ef 458d4b08                       lea        r9d, [r11 + 8]
004f3 453bca                         cmp        r9d, r10d
004f6 7d05                           jge        0x7f6a97be257d
004f8 458bd9                         mov        r11d, r9d
004fb ebdc                           jmp        0x7f6a97be2559
004fd 4883c1f8                       add        rcx, -8
00501 4881f900000080                 cmp        rcx, -0x80000000
00508 49c7c200000080                 mov        r10, 0xffffffff80000000
0050f 490f4cca                       cmovl      rcx, r10
00513 448bc1                         mov        r8d, ecx
00516 453bc8                         cmp        r9d, r8d
00519 0f8d8f000000                   jge        0x7f6a97be262e
0051f 4d63d1                         movsxd     r10, r9d
00522 4c03d3                         add        r10, rbx
00525 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
0052d 0f8309190000                   jae        0x7f6a97be3ebc
00533 4183c310                       add        r11d, 0x10
00537 4d63d3                         movsxd     r10, r11d
0053a 4c03d3                         add        r10, rbx
0053d 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
00545 0f8305190000                   jae        0x7f6a97be3ed0
0054b 443b8c2488000000               cmp        r9d, dword ptr [rsp + 0x88]
00553 0f830b190000                   jae        0x7f6a97be3ee4
00559 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
00561 0f8311190000                   jae        0x7f6a97be3ef8
00567 90                             nop        
00568 90                             nop        
00569 90                             nop        
0056a 90                             nop        
0056b 90                             nop        
0056c 90                             nop        
0056d 90                             nop        
0056e 90                             nop        
0056f 90                             nop        
00570 438d3c29                       lea        edi, [r9 + r13]
00574 458bd1                         mov        r10d, r9d
00577 4963ca                         movsxd     rcx, r10d
0057a 448bd7                         mov        r10d, edi
0057d 8b542470                       mov        edx, dword ptr [rsp + 0x70]
00581 4a8b541208                     mov        rdx, qword ptr [rdx + r10 + 8]
00586 4863ff                         movsxd     rdi, edi
00589 458bd9                         mov        r11d, r9d
0058c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00591 4b89541a08                     mov        qword ptr [r10 + r11 + 8], rdx
00596 4d8b543a10                     mov        r10, qword ptr [r10 + rdi + 0x10]
0059b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
005a0 4d89540b10                     mov        qword ptr [r11 + rcx + 0x10], r10
005a5 4183c110                       add        r9d, 0x10
005a9 453bc8                         cmp        r9d, r8d
005ac 7cc2                           jl         0x7f6a97be25f0
005ae 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
005b6 7d48                           jge        0x7f6a97be2680
005b8 4d63d1                         movsxd     r10, r9d
005bb 4c03d3                         add        r10, rbx
005be 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
005c6 0f83c0180000                   jae        0x7f6a97be3f0c
005cc 443b8c2488000000               cmp        r9d, dword ptr [rsp + 0x88]
005d4 0f83c6180000                   jae        0x7f6a97be3f20
005da 90                             nop        
005db 90                             nop        
005dc 478d1429                       lea        r10d, [r9 + r13]
005e0 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
005e5 4f8b5c1008                     mov        r11, qword ptr [r8 + r10 + 8]
005ea 458bd1                         mov        r10d, r9d
005ed 4f895c1008                     mov        qword ptr [r8 + r10 + 8], r11
005f2 4183c108                       add        r9d, 8
005f6 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
005fe 7cdc                           jl         0x7f6a97be265c
00600 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00608 4403942490000000               add        r10d, dword ptr [rsp + 0x90]
00610 448b8424b0000000               mov        r8d, dword ptr [rsp + 0xb0]
00618 41ffc0                         inc        r8d
0061b 443b442418                     cmp        r8d, dword ptr [rsp + 0x18]
00620 0f8d7d080000                   jge        0x7f6a97be2f23
00626 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
0062e 448bb4249c000000               mov        r14d, dword ptr [rsp + 0x9c]
00636 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0063b 4f8b5cc208                     mov        r11, qword ptr [r10 + r8*8 + 8]
00640 4d8bd3                         mov        r10, r11
00643 49c1ea12                       shr        r10, 0x12
00647 458bd2                         mov        r10d, r10d
0064a 4181e2ffff0300                 and        r10d, 0x3ffff
00651 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00659 458bd3                         mov        r10d, r11d
0065c 49c1fb24                       sar        r11, 0x24
00660 4181e2ffff0100                 and        r10d, 0x1ffff
00667 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
0066f 458bd3                         mov        r10d, r11d
00672 458bca                         mov        r9d, r10d
00675 4585d2                         test       r10d, r10d
00678 0f8c0e120000                   jl         0x7f6a97be390c
0067e 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00686 4585d2                         test       r10d, r10d
00689 0f8595020000                   jne        0x7f6a97be29a4
0068f 4533d2                         xor        r10d, r10d
00692 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
0069a 458bd1                         mov        r10d, r9d
0069d 4183fa03                       cmp        r10d, 3
006a1 0f8ef7020000                   jle        0x7f6a97be2a1e
006a7 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
006ac 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
006b0 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
006b5 45895310                       mov        dword ptr [r11 + 0x10], r10d
006b9 458b5b08                       mov        r11d, dword ptr [r11 + 8]
006bd 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
006c2 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
006c6 458d51fd                       lea        r10d, [r9 - 3]
006ca 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
006d2 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
006d7 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
006df 45895a08                       mov        dword ptr [r10 + 8], r11d
006e3 44898424b0000000               mov        dword ptr [rsp + 0xb0], r8d
006eb 48639c2498000000               movsxd     rbx, dword ptr [rsp + 0x98]
006f3 48899c24a0000000               mov        qword ptr [rsp + 0xa0], rbx
006fb 4c638424a8000000               movsxd     r8, dword ptr [rsp + 0xa8]
00703 4c03442430                     add        r8, qword ptr [rsp + 0x30]
00708 4863942494000000               movsxd     rdx, dword ptr [rsp + 0x94]
00710 4c03c2                         add        r8, rdx
00713 493bd8                         cmp        rbx, r8
00716 0f8f18120000                   jg         0x7f6a97be39b4
0071c 8b9c24a8000000                 mov        ebx, dword ptr [rsp + 0xa8]
00723 039c2494000000                 add        ebx, dword ptr [rsp + 0x94]
0072a 448beb                         mov        r13d, ebx
0072d 442bac2498000000               sub        r13d, dword ptr [rsp + 0x98]
00735 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0073a 4585db                         test       r11d, r11d
0073d 0f842d020000                   je         0x7f6a97be29f0
00743 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00748 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00750 4585d2                         test       r10d, r10d
00753 0f8efb100000                   jle        0x7f6a97be38d4
00759 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00761 4403db                         add        r11d, ebx
00764 443b5c2464                     cmp        r11d, dword ptr [rsp + 0x64]
00769 0f8f4d120000                   jg         0x7f6a97be3a3c
0076f 458bd6                         mov        r10d, r14d
00772 4403942494000000               add        r10d, dword ptr [rsp + 0x94]
0077a 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00782 443b542460                     cmp        r10d, dword ptr [rsp + 0x60]
00787 0f8fe3120000                   jg         0x7f6a97be3af0
0078d 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00795 4183fa10                       cmp        r10d, 0x10
00799 0f8f3e050000                   jg         0x7f6a97be2d5d
0079f 443b742474                     cmp        r14d, dword ptr [rsp + 0x74]
007a4 0f83840e0000                   jae        0x7f6a97be36ae
007aa 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
007af c4817a6f443208                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 8]
007b6 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
007be 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
007c6 0f83200f0000                   jae        0x7f6a97be376c
007cc 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
007d4 4503de                         add        r11d, r14d
007d7 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
007df 448b742470                     mov        r14d, dword ptr [rsp + 0x70]
007e4 c4817a7f441608                 vmovdqu    xmmword ptr [r14 + r10 + 8], xmm0
007eb 448bb42494000000               mov        r14d, dword ptr [rsp + 0x94]
007f3 4503f2                         add        r14d, r10d
007f6 4489b42494000000               mov        dword ptr [rsp + 0x94], r14d
007fe 458bee                         mov        r13d, r14d
00801 442bac2498000000               sub        r13d, dword ptr [rsp + 0x98]
00809 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00811 4183fb10                       cmp        r11d, 0x10
00815 0f8ff2faffff                   jg         0x7f6a97be238d
0081b 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00823 4183fa10                       cmp        r10d, 0x10
00827 0f8ce0faffff                   jl         0x7f6a97be238d
0082d 443bac248c000000               cmp        r13d, dword ptr [rsp + 0x8c]
00835 0f83710f0000                   jae        0x7f6a97be382c
0083b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00840 c4817a6f442b08                 vmovdqu    xmm0, xmmword ptr [r11 + r13 + 8]
00847 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0084f 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
00857 0f8291faffff                   jb         0x7f6a97be236e
0085d bee4ffffff                     mov        esi, 0xffffffe4
00862 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
00867 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0086c 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
00874 448b1c24                       mov        r11d, dword ptr [rsp]
00878 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
00880 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00885 4c891424                       mov        qword ptr [rsp], r10
00889 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0088e 4c89542408                     mov        qword ptr [rsp + 8], r10
00893 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00898 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
008a0 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
008a5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
008aa 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
008af 4489542418                     mov        dword ptr [rsp + 0x18], r10d
008b4 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
008b9 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
008be 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
008c3 4c89542428                     mov        qword ptr [rsp + 0x28], r10
008c8 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
008cd 4489542430                     mov        dword ptr [rsp + 0x30], r10d
008d2 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
008d7 4c89542438                     mov        qword ptr [rsp + 0x38], r10
008dc 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
008e1 4c89542440                     mov        qword ptr [rsp + 0x40], r10
008e6 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
008eb 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
008f0 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
008f5 4489542448                     mov        dword ptr [rsp + 0x48], r10d
008fa c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
00900 c5f877                         vzeroupper 
00903 e8d8b0aeff                     call       0x7f6a976cda60
00908 0f1f8400000a0001               nop        dword ptr [rax + rax + 0x1000a00]
00910 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
0091a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0091e e8bdbb1318                     call       0x7f6aafd1e560
00923 f4                             hlt        
00924 448b1424                       mov        r10d, dword ptr [rsp]
00928 452bd6                         sub        r10d, r14d
0092b 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00933 453bda                         cmp        r11d, r10d
00936 0f8e5efdffff                   jle        0x7f6a97be271a
0093c be45ffffff                     mov        esi, 0xffffff45
00941 418beb                         mov        ebp, r11d
00944 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
0094c c5f877                         vzeroupper 
0094f e88cb0aeff                     call       0x7f6a976cda60
00954 0f1f84004c0a0002               nop        dword ptr [rax + rax + 0x2000a4c]
0095c 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
00966 4883e4f0                       and        rsp, 0xfffffffffffffff0
0096a e871bb1318                     call       0x7f6aafd1e560
0096f f4                             hlt        
00970 4d63d5                         movsxd     r10, r13d
00973 4c3b542440                     cmp        r10, qword ptr [rsp + 0x40]
00978 0f8cae160000                   jl         0x7f6a97be40ac
0097e 488bac24a0000000               mov        rbp, qword ptr [rsp + 0xa0]
00986 483b6c2448                     cmp        rbp, qword ptr [rsp + 0x48]
0098b 0f8f3b170000                   jg         0x7f6a97be414c
00991 4533d2                         xor        r10d, r10d
00994 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00999 e9aafdffff                     jmp        0x7f6a97be27c8
0099e 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
009a6 4585d2                         test       r10d, r10d
009a9 7407                           je         0x7f6a97be2a32
009ab 458d51ff                       lea        r10d, [r9 - 1]
009af 458bca                         mov        r9d, r10d
009b2 4585c9                         test       r9d, r9d
009b5 7516                           jne        0x7f6a97be2a4d
009b7 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
009bc 418b4a08                       mov        ecx, dword ptr [r10 + 8]
009c0 44898424b0000000               mov        dword ptr [rsp + 0xb0], r8d
009c8 e984000000                     jmp        0x7f6a97be2ad1
009cd 4183f903                       cmp        r9d, 3
009d1 0f84a51a0000                   je         0x7f6a97be44fc
009d7 4183f902                       cmp        r9d, 2
009db 0f874b1b0000                   ja         0x7f6a97be45ac
009e1 443b8c24e4000000               cmp        r9d, dword ptr [rsp + 0xe4]
009e9 0f83f2180000                   jae        0x7f6a97be4361
009ef 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
009f4 438b4c8b08                     mov        ecx, dword ptr [r11 + r9*4 + 8]
009f9 4585c9                         test       r9d, r9d
009fc 7e42                           jle        0x7f6a97be2ac0
009fe 458d51ff                       lea        r10d, [r9 - 1]
00a02 443b9424e4000000               cmp        r10d, dword ptr [rsp + 0xe4]
00a0a 0f83ac190000                   jae        0x7f6a97be443c
00a10 44898424b0000000               mov        dword ptr [rsp + 0xb0], r8d
00a18 90                             nop        
00a19 90                             nop        
00a1a 90                             nop        
00a1b 90                             nop        
00a1c 90                             nop        
00a1d 90                             nop        
00a1e 90                             nop        
00a1f 90                             nop        
00a20 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
00a25 478b548b04                     mov        r10d, dword ptr [r11 + r9*4 + 4]
00a2a 4d8bc3                         mov        r8, r11
00a2d 4789548808                     mov        dword ptr [r8 + r9*4 + 8], r10d
00a32 458d51ff                       lea        r10d, [r9 - 1]
00a36 458bca                         mov        r9d, r10d
00a39 4585d2                         test       r10d, r10d
00a3c 7fe2                           jg         0x7f6a97be2aa0
00a3e eb08                           jmp        0x7f6a97be2ac8
00a40 44898424b0000000               mov        dword ptr [rsp + 0xb0], r8d
00a48 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00a4d 41894a08                       mov        dword ptr [r10 + 8], ecx
00a51 898c2498000000                 mov        dword ptr [rsp + 0x98], ecx
00a58 e98efcffff                     jmp        0x7f6a97be276b
00a5d 4183fb10                       cmp        r11d, 0x10
00a61 0f8db91f0000                   jge        0x7f6a97be4aa0
00a67 4183fb08                       cmp        r11d, 8
00a6b 0f8d6d070000                   jge        0x7f6a97be325e
00a71 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00a79 4183fa10                       cmp        r10d, 0x10
00a7d 0f8ebc000000                   jle        0x7f6a97be2bbf
00a83 4585ed                         test       r13d, r13d
00a86 0f8ccc1e0000                   jl         0x7f6a97be49d8
00a8c 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00a94 4585db                         test       r11d, r11d
00a97 0f8cbb1e0000                   jl         0x7f6a97be49d8
00a9d 448b9424e8000000               mov        r10d, dword ptr [rsp + 0xe8]
00aa5 443b942494000000               cmp        r10d, dword ptr [rsp + 0x94]
00aad 0f82a51e0000                   jb         0x7f6a97be49d8
00ab3 8bac2498000000                 mov        ebp, dword ptr [rsp + 0x98]
00aba 03ac2494000000                 add        ebp, dword ptr [rsp + 0x94]
00ac1 443bd5                         cmp        r10d, ebp
00ac4 0f828e1e0000                   jb         0x7f6a97be49d8
00aca 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00ad2 4585d2                         test       r10d, r10d
00ad5 0f8c7d1e0000                   jl         0x7f6a97be49d8
00adb 4585d2                         test       r10d, r10d
00ade 0f8462f7ffff                   je         0x7f6a97be22c6
00ae4 488b9c24a0000000               mov        rbx, qword ptr [rsp + 0xa0]
00aec 4883fb20                       cmp        rbx, 0x20
00af0 772d                           ja         0x7f6a97be2b9f
00af2 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00afa 4d63d3                         movsxd     r10, r11d
00afd 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b04 c442a8f5db                     bzhi       r11, r11, r10
00b09 c4c1fb92fb                     kmovq      k7, r11
00b0e 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b14 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b1a e927f7ffff                     jmp        0x7f6a97be22c6
00b1f 488bd3                         mov        rdx, rbx
00b22 c5f877                         vzeroupper 
00b25 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00b2f 41ffd2                         call       r10
00b32 0f1f840000000000               nop        dword ptr [rax + rax]
00b3a e907f7ffff                     jmp        0x7f6a97be22c6
00b3f 443bac24e8000000               cmp        r13d, dword ptr [rsp + 0xe8]
00b47 0f838f1a0000                   jae        0x7f6a97be465c
00b4d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00b52 430fbe6c2b08                   movsx      ebp, byte ptr [r11 + r13 + 8]
00b58 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00b60 443b9c24e8000000               cmp        r11d, dword ptr [rsp + 0xe8]
00b68 0f83361b0000                   jae        0x7f6a97be4724
00b6e 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00b73 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
00b78 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00b80 41ffc2                         inc        r10d
00b83 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00b8b 458d5d03                       lea        r11d, [r13 + 3]
00b8f 443b9c24e8000000               cmp        r11d, dword ptr [rsp + 0xe8]
00b97 0f83b31b0000                   jae        0x7f6a97be47d0
00b9d 4d63cd                         movsxd     r9, r13d
00ba0 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00ba5 430fbe6c0b09                   movsx      ebp, byte ptr [r11 + r9 + 9]
00bab 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00bb3 4183c203                       add        r10d, 3
00bb7 443b9424e8000000               cmp        r10d, dword ptr [rsp + 0xe8]
00bbf 0f833b1c0000                   jae        0x7f6a97be4880
00bc5 4c63842494000000               movsxd     r8, dword ptr [rsp + 0x94]
00bcd 43886c0309                     mov        byte ptr [r11 + r8 + 9], bpl
00bd2 430fbe4c0b0a                   movsx      ecx, byte ptr [r11 + r9 + 0xa]
00bd8 43884c030a                     mov        byte ptr [r11 + r8 + 0xa], cl
00bdd 470fbe5c0b0b                   movsx      r11d, byte ptr [r11 + r9 + 0xb]
00be3 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00be8 47885c020b                     mov        byte ptr [r10 + r8 + 0xb], r11b
00bed 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00bf5 4183fb08                       cmp        r11d, 8
00bf9 0f83a91c0000                   jae        0x7f6a97be4928
00bff 49bb20ae28e300000000           movabs     r11, 0xe328ae20
00c09 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00c11 47036c9308                     add        r13d, dword ptr [r11 + r10*4 + 8]
00c16 44896c2404                     mov        dword ptr [rsp + 4], r13d
00c1b 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00c23 4183fa04                       cmp        r10d, 4
00c27 7e3f                           jle        0x7f6a97be2ce8
00c29 8bac2494000000                 mov        ebp, dword ptr [rsp + 0x94]
00c30 83c504                         add        ebp, 4
00c33 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00c38 418bd5                         mov        edx, r13d
00c3b 90                             nop        
00c3c c5f877                         vzeroupper 
00c3f e89ccfb4ff                     call       0x7f6a9772fc60
00c44 0f1f84003c0d0003               nop        dword ptr [rax + rax + 0x3000d3c]
00c4c 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00c51 8bd5                           mov        edx, ebp
00c53 8bc8                           mov        ecx, eax
00c55 90                             nop        
00c56 90                             nop        
00c57 90                             nop        
00c58 c5f877                         vzeroupper 
00c5b e880cfb4ff                     call       0x7f6a9772fc60
00c60 0f1f8400580d0004               nop        dword ptr [rax + rax + 0x4000d58]
00c68 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00c70 4183fb08                       cmp        r11d, 8
00c74 7e5a                           jle        0x7f6a97be2d50
00c76 8b542404                       mov        edx, dword ptr [rsp + 4]
00c7a 49ba48ae28e300000000           movabs     r10, 0xe328ae48
00c84 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00c8c 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
00c91 8bac2494000000                 mov        ebp, dword ptr [rsp + 0x94]
00c98 83c508                         add        ebp, 8
00c9b 83c208                         add        edx, 8
00c9e 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00ca3 90                             nop        
00ca4 c5f877                         vzeroupper 
00ca7 e834cfb4ff                     call       0x7f6a9772fc60
00cac 0f1f8400a40d0005               nop        dword ptr [rax + rax + 0x5000da4]
00cb4 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00cb9 8bd5                           mov        edx, ebp
00cbb 488bc8                         mov        rcx, rax
00cbe 90                             nop        
00cbf 90                             nop        
00cc0 c5f877                         vzeroupper 
00cc3 e818cfb4ff                     call       0x7f6a9772fc60
00cc8 0f1f8400c00d0006               nop        dword ptr [rax + rax + 0x6000dc0]
00cd0 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00cd8 e933f9ffff                     jmp        0x7f6a97be2690
00cdd 4183fa30                       cmp        r10d, 0x30
00ce1 0f8eb6000000                   jle        0x7f6a97be2e1d
00ce7 4585f6                         test       r14d, r14d
00cea 0f8cf8200000                   jl         0x7f6a97be4e68
00cf0 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00cf8 4585d2                         test       r10d, r10d
00cfb 0f8cef200000                   jl         0x7f6a97be4e70
00d01 448b8424e0000000               mov        r8d, dword ptr [rsp + 0xe0]
00d09 443b84249c000000               cmp        r8d, dword ptr [rsp + 0x9c]
00d11 0f82d9200000                   jb         0x7f6a97be4e70
00d17 448b9c24e8000000               mov        r11d, dword ptr [rsp + 0xe8]
00d1f 443bdb                         cmp        r11d, ebx
00d22 0f82c8200000                   jb         0x7f6a97be4e70
00d28 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00d30 4585db                         test       r11d, r11d
00d33 7442                           je         0x7f6a97be2df7
00d35 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00d3a 4b8d7c3308                     lea        rdi, [r11 + r14 + 8]
00d3f 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00d44 4b8d741008                     lea        rsi, [r8 + r10 + 8]
00d49 4883fa20                       cmp        rdx, 0x20
00d4d 7734                           ja         0x7f6a97be2e03
00d4f 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00d57 4d63d2                         movsxd     r10, r10d
00d5a 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d61 c442a8f5db                     bzhi       r11, r11, r10
00d66 c4c1fb92fb                     kmovq      k7, r11
00d6b 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d71 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d77 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
00d7e e986faffff                     jmp        0x7f6a97be2889
00d83 c5f877                         vzeroupper 
00d86 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00d90 41ffd2                         call       r10
00d93 0f1f840000000000               nop        dword ptr [rax + rax]
00d9b ebda                           jmp        0x7f6a97be2df7
00d9d 443b742474                     cmp        r14d, dword ptr [rsp + 0x74]
00da2 0f83a81e0000                   jae        0x7f6a97be4cd0
00da8 4963c6                         movsxd     rax, r14d
00dab 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00db0 c4c17a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + rax + 8]
00db7 8b8c24a8000000                 mov        ecx, dword ptr [rsp + 0xa8]
00dbe 3b8c248c000000                 cmp        ecx, dword ptr [rsp + 0x8c]
00dc5 0f83491f0000                   jae        0x7f6a97be4d94
00dcb 4c63c1                         movsxd     r8, ecx
00dce 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00dd3 c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
00dda 448d5110                       lea        r10d, [rcx + 0x10]
00dde 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00de6 443bd3                         cmp        r10d, ebx
00de9 0f8dd0030000                   jge        0x7f6a97be323f
00def 492bc0                         sub        rax, r8
00df2 4d63d2                         movsxd     r10, r10d
00df5 4c638c24ec000000               movsxd     r9, dword ptr [rsp + 0xec]
00dfd 4983c1f1                       add        r9, -0xf
00e01 4d8d1c02                       lea        r11, [r10 + rax]
00e05 4d3bd9                         cmp        r11, r9
00e08 0f83ae200000                   jae        0x7f6a97be4f3c
00e0e 4863fb                         movsxd     rdi, ebx
00e11 4c8bdf                         mov        r11, rdi
00e14 4d2bda                         sub        r11, r10
00e17 4983c30f                       add        r11, 0xf
00e1b 4983e3f0                       and        r11, 0xfffffffffffffff0
00e1f 458bd3                         mov        r10d, r11d
00e22 458d5c0a10                     lea        r11d, [r10 + rcx + 0x10]
00e27 4d63d3                         movsxd     r10, r11d
00e2a 4d8d5c02f0                     lea        r11, [r10 + rax - 0x10]
00e2f 4d3bd9                         cmp        r11, r9
00e32 0f8384200000                   jae        0x7f6a97be4f3c
00e38 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00e40 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
00e48 0f836e200000                   jae        0x7f6a97be4f3c
00e4e 4983c2f0                       add        r10, -0x10
00e52 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00e57 4983c3f1                       add        r11, -0xf
00e5b 4d3bd3                         cmp        r10, r11
00e5e 0f8358200000                   jae        0x7f6a97be4f3c
00e64 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00e6a 0f8fec200000                   jg         0x7f6a97be4fdc
00e70 458bd6                         mov        r10d, r14d
00e73 442bd1                         sub        r10d, ecx
00e76 83c120                         add        ecx, 0x20
00e79 e9e2000000                     jmp        0x7f6a97be2fe0
00e7e 4d63d3                         movsxd     r10, r11d
00e81 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e88 c442a8f5db                     bzhi       r11, r11, r10
00e8d c4c1fb92fb                     kmovq      k7, r11
00e92 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e98 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e9e e993000000                     jmp        0x7f6a97be2fb6
00ea3 448b0424                       mov        r8d, dword ptr [rsp]
00ea7 458bd8                         mov        r11d, r8d
00eaa 442b9c249c000000               sub        r11d, dword ptr [rsp + 0x9c]
00eb2 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00eba 4585c0                         test       r8d, r8d
00ebd 0f8c391d0000                   jl         0x7f6a97be4c7c
00ec3 4c8b742468                     mov        r14, qword ptr [rsp + 0x68]
00ec8 8bb424e0000000                 mov        esi, dword ptr [rsp + 0xe0]
00ecf 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00ed3 4585d2                         test       r10d, r10d
00ed6 0f8c291d0000                   jl         0x7f6a97be4c85
00edc 3b3424                         cmp        esi, dword ptr [rsp]
00edf 0f82201d0000                   jb         0x7f6a97be4c85
00ee5 438d2c1a                       lea        ebp, [r10 + r11]
00ee9 448b4b04                       mov        r9d, dword ptr [rbx + 4]
00eed 443bcd                         cmp        r9d, ebp
00ef0 0f820f1d0000                   jb         0x7f6a97be4c85
00ef6 4585db                         test       r11d, r11d
00ef9 0f8c061d0000                   jl         0x7f6a97be4c85
00eff 4585db                         test       r11d, r11d
00f02 7432                           je         0x7f6a97be2fb6
00f04 4b8d7c0608                     lea        rdi, [r14 + r8 + 8]
00f09 4c8bc3                         mov        r8, rbx
00f0c 4a8d741308                     lea        rsi, [rbx + r10 + 8]
00f11 4963d3                         movsxd     rdx, r11d
00f14 4883fa20                       cmp        rdx, 0x20
00f18 0f8660ffffff                   jbe        0x7f6a97be2efe
00f1e c5f877                         vzeroupper 
00f21 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00f2b 41ffd2                         call       r10
00f2e 0f1f840000000000               nop        dword ptr [rax + rax]
00f36 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00f3b 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00f3f c5f877                         vzeroupper 
00f42 4881c4d0000000                 add        rsp, 0xd0
00f49 5d                             pop        rbp
00f4a 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00f4e 0f8780250000                   ja         0x7f6a97be5554
00f54 c3                             ret        
00f55 90                             nop        
00f56 90                             nop        
00f57 90                             nop        
00f58 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
00f60 458bda                         mov        r11d, r10d
00f63 44039c249c000000               add        r11d, dword ptr [rsp + 0x9c]
00f6b 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
00f70 c4817a6f441808                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 8]
00f77 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00f7f 8b542470                       mov        edx, dword ptr [rsp + 0x70]
00f83 c4a17a7f441a08                 vmovdqu    xmmword ptr [rdx + r11 + 8], xmm0
00f8a 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00f92 4183c010                       add        r8d, 0x10
00f96 443bc1                         cmp        r8d, ecx
00f99 7cbd                           jl         0x7f6a97be2fd8
00f9b 4881c710ffffff                 add        rdi, -0xf0
00fa2 4881ff00000080                 cmp        rdi, -0x80000000
00fa9 49c7c300000080                 mov        r11, 0xffffffff80000000
00fb0 490f4cfb                       cmovl      rdi, r11
00fb4 448bdf                         mov        r11d, edi
00fb7 453bc3                         cmp        r8d, r11d
00fba 0f8db6010000                   jge        0x7f6a97be31f6
00fc0 4963c8                         movsxd     rcx, r8d
00fc3 4803c8                         add        rcx, rax
00fc6 493bc9                         cmp        rcx, r9
00fc9 0f832d200000                   jae        0x7f6a97be507c
00fcf 8b8c249c000000                 mov        ecx, dword ptr [rsp + 0x9c]
00fd6 81c100010000                   add        ecx, 0x100
00fdc 4863f9                         movsxd     rdi, ecx
00fdf 4803f8                         add        rdi, rax
00fe2 493bf9                         cmp        rdi, r9
00fe5 0f8325200000                   jae        0x7f6a97be5090
00feb 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
00ff3 0f832b200000                   jae        0x7f6a97be50a4
00ff9 3b8c248c000000                 cmp        ecx, dword ptr [rsp + 0x8c]
01000 0f8332200000                   jae        0x7f6a97be50b8
01006 90                             nop        
01007 90                             nop        
01008 90                             nop        
01009 90                             nop        
0100a 90                             nop        
0100b 90                             nop        
0100c 90                             nop        
0100d 90                             nop        
0100e 90                             nop        
0100f 90                             nop        
01010 438d3402                       lea        esi, [r10 + r8]
01014 418bf8                         mov        edi, r8d
01017 4863ff                         movsxd     rdi, edi
0101a 8bce                           mov        ecx, esi
0101c 488b542468                     mov        rdx, qword ptr [rsp + 0x68]
01021 c5fa6f440a08                   vmovdqu    xmm0, xmmword ptr [rdx + rcx + 8]
01027 4863d6                         movsxd     rdx, esi
0102a 418bc8                         mov        ecx, r8d
0102d 8b742470                       mov        esi, dword ptr [rsp + 0x70]
01031 c5fa7f440e08                   vmovdqu    xmmword ptr [rsi + rcx + 8], xmm0
01037 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
0103c c5fa6f441118                   vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x18]
01042 c5fa7f443e18                   vmovdqu    xmmword ptr [rsi + rdi + 0x18], xmm0
01048 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
0104d c5fa6f441128                   vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x28]
01053 c5fa7f443e28                   vmovdqu    xmmword ptr [rsi + rdi + 0x28], xmm0
01059 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
0105e c5fa6f441138                   vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x38]
01064 c5fa7f443e38                   vmovdqu    xmmword ptr [rsi + rdi + 0x38], xmm0
0106a 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
0106f c5fa6f441148                   vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x48]
01075 c5fa7f443e48                   vmovdqu    xmmword ptr [rsi + rdi + 0x48], xmm0
0107b 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
01080 c5fa6f441158                   vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x58]
01086 c5fa7f443e58                   vmovdqu    xmmword ptr [rsi + rdi + 0x58], xmm0
0108c 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
01091 c5fa6f441168                   vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x68]
01097 c5fa7f443e68                   vmovdqu    xmmword ptr [rsi + rdi + 0x68], xmm0
0109d 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
010a2 c5fa6f441178                   vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x78]
010a8 c5fa7f443e78                   vmovdqu    xmmword ptr [rsi + rdi + 0x78], xmm0
010ae 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
010b3 c5fa6f841188000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x88]
010bc c5fa7f843e88000000             vmovdqu    xmmword ptr [rsi + rdi + 0x88], xmm0
010c5 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
010ca c5fa6f841198000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x98]
010d3 c5fa7f843e98000000             vmovdqu    xmmword ptr [rsi + rdi + 0x98], xmm0
010dc 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
010e1 c5fa6f8411a8000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0xa8]
010ea c5fa7f843ea8000000             vmovdqu    xmmword ptr [rsi + rdi + 0xa8], xmm0
010f3 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
010f8 c5fa6f8411b8000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0xb8]
01101 c5fa7f843eb8000000             vmovdqu    xmmword ptr [rsi + rdi + 0xb8], xmm0
0110a 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
0110f c5fa6f8411c8000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0xc8]
01118 c5fa7f843ec8000000             vmovdqu    xmmword ptr [rsi + rdi + 0xc8], xmm0
01121 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
01126 c5fa6f8411d8000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0xd8]
0112f c5fa7f843ed8000000             vmovdqu    xmmword ptr [rsi + rdi + 0xd8], xmm0
01138 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
0113d c5fa6f8411e8000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0xe8]
01146 c5fa7f843ee8000000             vmovdqu    xmmword ptr [rsi + rdi + 0xe8], xmm0
0114f 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
01154 c5fa6f8411f8000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0xf8]
0115d c5fa7f843ef8000000             vmovdqu    xmmword ptr [rsi + rdi + 0xf8], xmm0
01166 4181c000010000                 add        r8d, 0x100
0116d 453bc3                         cmp        r8d, r11d
01170 0f8c9afeffff                   jl         0x7f6a97be3090
01176 443bc3                         cmp        r8d, ebx
01179 7d44                           jge        0x7f6a97be323f
0117b 4d63d8                         movsxd     r11, r8d
0117e 4c03d8                         add        r11, rax
01181 4d3bd9                         cmp        r11, r9
01184 0f83d9210000                   jae        0x7f6a97be53e3
0118a 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
01192 0f83df210000                   jae        0x7f6a97be53f7
01198 478d1c02                       lea        r11d, [r10 + r8]
0119c 4c8b4c2468                     mov        r9, qword ptr [rsp + 0x68]
011a1 c4817a6f441908                 vmovdqu    xmm0, xmmword ptr [r9 + r11 + 8]
011a8 458bd8                         mov        r11d, r8d
011ab 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
011af c4a17a7f441908                 vmovdqu    xmmword ptr [rcx + r11 + 8], xmm0
011b6 4183c010                       add        r8d, 0x10
011ba 443bc3                         cmp        r8d, ebx
011bd 7cd9                           jl         0x7f6a97be3218
011bf 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
011c7 4503d6                         add        r10d, r14d
011ca 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
011d2 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
011d9 e92bf6ffff                     jmp        0x7f6a97be2889
011de 443bac2488000000               cmp        r13d, dword ptr [rsp + 0x88]
011e6 0f83601e0000                   jae        0x7f6a97be50cc
011ec 458bd5                         mov        r10d, r13d
011ef 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
011f7 4963da                         movsxd     rbx, r10d
011fa 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
011ff 4d8b541b08                     mov        r10, qword ptr [r11 + rbx + 8]
01204 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0120c 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01214 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
0121c 0f83f21e0000                   jae        0x7f6a97be5194
01222 458d4208                       lea        r8d, [r10 + 8]
01226 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
0122e 4d63da                         movsxd     r11, r10d
01231 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01236 4c8b8c24a0000000               mov        r9, qword ptr [rsp + 0xa0]
0123e 4f894c1808                     mov        qword ptr [r8 + r11 + 8], r9
01243 448b8c2498000000               mov        r9d, dword ptr [rsp + 0x98]
0124b 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
01253 0f8da9030000                   jge        0x7f6a97be3682
01259 492bdb                         sub        rbx, r11
0125c 4963f1                         movsxd     rsi, r9d
0125f 4c8d1c1e                       lea        r11, [rsi + rbx]
01263 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
0126b 0f83431f0000                   jae        0x7f6a97be5234
01271 4c8bd9                         mov        r11, rcx
01274 4c2bde                         sub        r11, rsi
01277 4983c307                       add        r11, 7
0127b 4983e3f8                       and        r11, 0xfffffffffffffff8
0127f 458bc3                         mov        r8d, r11d
01282 478d5c1008                     lea        r11d, [r8 + r10 + 8]
01287 4d63db                         movsxd     r11, r11d
0128a 4d8d441bf8                     lea        r8, [r11 + rbx - 8]
0128f 4c3b842480000000               cmp        r8, qword ptr [rsp + 0x80]
01297 0f83171f0000                   jae        0x7f6a97be5234
0129d 458bc1                         mov        r8d, r9d
012a0 443b842488000000               cmp        r8d, dword ptr [rsp + 0x88]
012a8 0f83061f0000                   jae        0x7f6a97be5234
012ae 4983c3f8                       add        r11, -8
012b2 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
012ba 0f83f41e0000                   jae        0x7f6a97be5234
012c0 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
012c8 4181f8f8ffff7f                 cmp        r8d, 0x7ffffff8
012cf 0f8f8f1f0000                   jg         0x7f6a97be52e4
012d5 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
012dd 452bda                         sub        r11d, r10d
012e0 458bcb                         mov        r9d, r11d
012e3 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
012e8 418bf8                         mov        edi, r8d
012eb 41b8f8ffffff                   mov        r8d, 0xfffffff8
012f1 442bc7                         sub        r8d, edi
012f4 452bc2                         sub        r8d, r10d
012f7 4183c210                       add        r10d, 0x10
012fb 4183c0f0                       add        r8d, -0x10
012ff 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
01304 498bd3                         mov        rdx, r11
01307 4c8d59c8                       lea        r11, [rcx - 0x38]
0130b 4981fb00000080                 cmp        r11, -0x80000000
01312 48c7c700000080                 mov        rdi, 0xffffffff80000000
01319 4c0f4cdf                       cmovl      r11, rdi
0131d 418bfb                         mov        edi, r11d
01320 442bac2494000000               sub        r13d, dword ptr [rsp + 0x94]
01328 4963ea                         movsxd     rbp, r10d
0132b 41bb06000000                   mov        r11d, 6
01331 c442a0f5d8                     bzhi       r11, r8, r11
01336 4903eb                         add        rbp, r11
01339 483be9                         cmp        rbp, rcx
0133c 488bc1                         mov        rax, rcx
0133f 480f4cc5                       cmovl      rax, rbp
01343 4c8bd8                         mov        r11, rax
01346 4c2bde                         sub        r11, rsi
01349 4d8d43ff                       lea        r8, [r11 - 1]
0134d 49c1f83f                       sar        r8, 0x3f
01351 49c1e83d                       shr        r8, 0x3d
01355 4f8d5c18ff                     lea        r11, [r8 + r11 - 1]
0135a 4983e3f8                       and        r11, 0xfffffffffffffff8
0135e 4c03de                         add        r11, rsi
01361 493bf3                         cmp        rsi, r11
01364 490f4cf3                       cmovl      rsi, r11
01368 8bf6                           mov        esi, esi
0136a 458d5c3508                     lea        r11d, [r13 + rsi + 8]
0136f 83c608                         add        esi, 8
01372 4963eb                         movsxd     rbp, r11d
01375 4803ea                         add        rbp, rdx
01378 4863f6                         movsxd     rsi, esi
0137b 4803f2                         add        rsi, rdx
0137e 4c8d5d08                       lea        r11, [rbp + 8]
01382 4883c548                       add        rbp, 0x48
01386 488d5648                       lea        rdx, [rsi + 0x48]
0138a 4533c0                         xor        r8d, r8d
0138d 493bd3                         cmp        rdx, r11
01390 410f96c0                       setbe      r8b
01394 4883c608                       add        rsi, 8
01398 4533db                         xor        r11d, r11d
0139b 483bee                         cmp        rbp, rsi
0139e 410f96c3                       setbe      r11b
013a2 450bc3                         or         r8d, r11d
013a5 0f84c90d0000                   je         0x7f6a97be41f4
013ab 448bc0                         mov        r8d, eax
013ae eb07                           jmp        0x7f6a97be3437
013b0 89942498000000                 mov        dword ptr [rsp + 0x98], edx
013b7 458bd1                         mov        r10d, r9d
013ba 4403942498000000               add        r10d, dword ptr [rsp + 0x98]
013c2 8b542470                       mov        edx, dword ptr [rsp + 0x70]
013c6 4e8b541208                     mov        r10, qword ptr [rdx + r10 + 8]
013cb 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
013d3 4e89541a08                     mov        qword ptr [rdx + r11 + 8], r10
013d8 8b942498000000                 mov        edx, dword ptr [rsp + 0x98]
013df 83c208                         add        edx, 8
013e2 413bd0                         cmp        edx, r8d
013e5 7cc9                           jl         0x7f6a97be3430
013e7 4881c108feffff                 add        rcx, -0x1f8
013ee 4881f900000080                 cmp        rcx, -0x80000000
013f5 49c7c200000080                 mov        r10, 0xffffffff80000000
013fc 490f4cca                       cmovl      rcx, r10
01400 448bc1                         mov        r8d, ecx
01403 413bd0                         cmp        edx, r8d
01406 0f8d001f0000                   jge        0x7f6a97be538c
0140c 4c63d2                         movsxd     r10, edx
0140f 4c03d3                         add        r10, rbx
01412 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
0141a 0f83f31e0000                   jae        0x7f6a97be5393
01420 8b8c2498000000                 mov        ecx, dword ptr [rsp + 0x98]
01427 81c100020000                   add        ecx, 0x200
0142d 4c63d1                         movsxd     r10, ecx
01430 4c03d3                         add        r10, rbx
01433 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
0143b 0f83e61e0000                   jae        0x7f6a97be53a7
01441 3b942488000000                 cmp        edx, dword ptr [rsp + 0x88]
01448 0f83ed1e0000                   jae        0x7f6a97be53bb
0144e 3b8c2488000000                 cmp        ecx, dword ptr [rsp + 0x88]
01455 0f83f41e0000                   jae        0x7f6a97be53cf
0145b eb05                           jmp        0x7f6a97be34e2
0145d 90                             nop        
0145e 90                             nop        
0145f 90                             nop        
01460 8bd1                           mov        edx, ecx
01462 458d1411                       lea        r10d, [r9 + rdx]
01466 8bca                           mov        ecx, edx
01468 4863c9                         movsxd     rcx, ecx
0146b 458bda                         mov        r11d, r10d
0146e 8b742470                       mov        esi, dword ptr [rsp + 0x70]
01472 62b17e486f841e08000000         vmovdqu32  zmm0, zmmword ptr [rsi + r11 + 8]
0147d 4963ea                         movsxd     rbp, r10d
01480 448d5240                       lea        r10d, [rdx + 0x40]
01484 4503d1                         add        r10d, r9d
01487 8d8280000000                   lea        eax, [rdx + 0x80]
0148d 4103c1                         add        eax, r9d
01490 8db200010000                   lea        esi, [rdx + 0x100]
01496 4103f1                         add        esi, r9d
01499 448bda                         mov        r11d, edx
0149c 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
014a1 62917e487f841d08000000         vmovdqu32  zmmword ptr [r13 + r11 + 8], zmm0
014ac 62917e486f841508000000         vmovdqu32  zmm0, zmmword ptr [r13 + r10 + 8]
014b7 62d17e487f840d48000000         vmovdqu32  zmmword ptr [r13 + rcx + 0x48], zmm0
014c2 62d17e486f840508000000         vmovdqu32  zmm0, zmmword ptr [r13 + rax + 8]
014cd 62d17e487f840d88000000         vmovdqu32  zmmword ptr [r13 + rcx + 0x88], zmm0
014d8 62d17e486f842dc8000000         vmovdqu32  zmm0, zmmword ptr [r13 + rbp + 0xc8]
014e3 62d17e487f840dc8000000         vmovdqu32  zmmword ptr [r13 + rcx + 0xc8], zmm0
014ee 448bd6                         mov        r10d, esi
014f1 62917e486f841508000000         vmovdqu32  zmm0, zmmword ptr [r13 + r10 + 8]
014fc 62d17e487f840d08010000         vmovdqu32  zmmword ptr [r13 + rcx + 0x108], zmm0
01507 62d17e486f842d48010000         vmovdqu32  zmm0, zmmword ptr [r13 + rbp + 0x148]
01512 62d17e487f840d48010000         vmovdqu32  zmmword ptr [r13 + rcx + 0x148], zmm0
0151d 62d17e486f842d88010000         vmovdqu32  zmm0, zmmword ptr [r13 + rbp + 0x188]
01528 62d17e487f840d88010000         vmovdqu32  zmmword ptr [r13 + rcx + 0x188], zmm0
01533 4c63d6                         movsxd     r10, esi
01536 62917e486f8415c8000000         vmovdqu32  zmm0, zmmword ptr [r13 + r10 + 0xc8]
01541 62d17e487f840dc8010000         vmovdqu32  zmmword ptr [r13 + rcx + 0x1c8], zmm0
0154c 8d8a00020000                   lea        ecx, [rdx + 0x200]
01552 413bc8                         cmp        ecx, r8d
01555 0f8c05ffffff                   jl         0x7f6a97be34e0
0155b 3bcf                           cmp        ecx, edi
0155d 7d52                           jge        0x7f6a97be3631
0155f 81c238020000                   add        edx, 0x238
01565 4c63d2                         movsxd     r10, edx
01568 4c03d3                         add        r10, rbx
0156b 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
01573 0f83121e0000                   jae        0x7f6a97be540b
01579 3b942488000000                 cmp        edx, dword ptr [rsp + 0x88]
01580 0f832d1e0000                   jae        0x7f6a97be5433
01586 90                             nop        
01587 90                             nop        
01588 458d1409                       lea        r10d, [r9 + rcx]
0158c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01591 62917e486f841308000000         vmovdqu32  zmm0, zmmword ptr [r11 + r10 + 8]
0159c 448bd1                         mov        r10d, ecx
0159f 62917e487f841308000000         vmovdqu32  zmmword ptr [r11 + r10 + 8], zmm0
015aa 83c140                         add        ecx, 0x40
015ad 3bcf                           cmp        ecx, edi
015af 7cd7                           jl         0x7f6a97be3608
015b1 3b8c24a8000000                 cmp        ecx, dword ptr [rsp + 0xa8]
015b8 7d48                           jge        0x7f6a97be3682
015ba 4c63d1                         movsxd     r10, ecx
015bd 4c03d3                         add        r10, rbx
015c0 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
015c8 0f83d11d0000                   jae        0x7f6a97be541f
015ce 3b8c2488000000                 cmp        ecx, dword ptr [rsp + 0x88]
015d5 0f83ec1d0000                   jae        0x7f6a97be5447
015db 90                             nop        
015dc 458d1409                       lea        r10d, [r9 + rcx]
015e0 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
015e5 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
015ea 448bd9                         mov        r11d, ecx
015ed 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
015f1 4e89541b08                     mov        qword ptr [rbx + r11 + 8], r10
015f6 83c108                         add        ecx, 8
015f9 3b8c24a8000000                 cmp        ecx, dword ptr [rsp + 0xa8]
01600 7cda                           jl         0x7f6a97be365c
01602 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
0160a e901f0ffff                     jmp        0x7f6a97be2690
0160f 4c03c9                         add        r9, rcx
01612 4c3b4c2448                     cmp        r9, qword ptr [rsp + 0x48]
01617 7e08                           jle        0x7f6a97be36a1
01619 4533c0                         xor        r8d, r8d
0161c e990eaffff                     jmp        0x7f6a97be2131
01621 4533c0                         xor        r8d, r8d
01624 ba01000000                     mov        edx, 1
01629 e985eaffff                     jmp        0x7f6a97be2133
0162e bee4ffffff                     mov        esi, 0xffffffe4
01633 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01638 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0163d 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01645 448b1c24                       mov        r11d, dword ptr [rsp]
01649 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01651 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01656 4c891424                       mov        qword ptr [rsp], r10
0165a 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0165f 4c89542408                     mov        qword ptr [rsp + 8], r10
01664 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01669 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01671 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01676 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0167b 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01680 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01685 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0168a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0168f 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01694 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01699 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0169e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
016a3 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
016a8 4c89542440                     mov        qword ptr [rsp + 0x40], r10
016ad 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
016b2 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
016b7 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
016bc 4489542448                     mov        dword ptr [rsp + 0x48], r10d
016c1 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
016c6 90                             nop        
016c7 90                             nop        
016c8 c5f877                         vzeroupper 
016cb e810a3aeff                     call       0x7f6a976cda60
016d0 0f1f8400c8170007               nop        dword ptr [rax + rax + 0x70017c8]
016d8 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
016e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
016e6 e8f5ad1318                     call       0x7f6aafd1e560
016eb f4                             hlt        
016ec bee4ffffff                     mov        esi, 0xffffffe4
016f1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
016f6 448b0424                       mov        r8d, dword ptr [rsp]
016fa 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
01702 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01707 4c891c24                       mov        qword ptr [rsp], r11
0170b 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01710 4c895c2408                     mov        qword ptr [rsp + 8], r11
01715 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0171a 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01722 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01727 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0172c 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01731 4489442418                     mov        dword ptr [rsp + 0x18], r8d
01736 4489742420                     mov        dword ptr [rsp + 0x20], r14d
0173b 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
01740 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01745 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0174a 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
0174f 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01754 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01759 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
0175e 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
01763 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01768 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
0176d 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01772 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01777 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0177c 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01781 c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
01787 90                             nop        
01788 c5f877                         vzeroupper 
0178b e850a2aeff                     call       0x7f6a976cda60
01790 0f1f840088180008               nop        dword ptr [rax + rax + 0x8001888]
01798 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
017a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
017a6 e835ad1318                     call       0x7f6aafd1e560
017ab f4                             hlt        
017ac bee4ffffff                     mov        esi, 0xffffffe4
017b1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
017b6 448b1424                       mov        r10d, dword ptr [rsp]
017ba 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
017c2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017c7 4c891424                       mov        qword ptr [rsp], r10
017cb 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
017d0 4c89542408                     mov        qword ptr [rsp + 8], r10
017d5 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
017da 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
017e2 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
017e7 4c89542410                     mov        qword ptr [rsp + 0x10], r10
017ec 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
017f1 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
017f6 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
017fb 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01800 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01805 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0180a 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0180f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01814 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01819 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0181e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01823 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01828 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
0182d 90                             nop        
0182e 90                             nop        
0182f 90                             nop        
01830 c5f877                         vzeroupper 
01833 e8a8a1aeff                     call       0x7f6a976cda60
01838 0f1f840030190009               nop        dword ptr [rax + rax + 0x9001930]
01840 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
0184a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0184e e88dac1318                     call       0x7f6aafd1e560
01853 f4                             hlt        
01854 be45ffffff                     mov        esi, 0xffffff45
01859 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0185e 4c898424e8000000               mov        qword ptr [rsp + 0xe8], r8
01866 90                             nop        
01867 90                             nop        
01868 c5f877                         vzeroupper 
0186b e870a1aeff                     call       0x7f6a976cda60
01870 0f1f84006819000a               nop        dword ptr [rax + rax + 0xa001968]
01878 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
01882 4883e4f0                       and        rsp, 0xfffffffffffffff0
01886 e855ac1318                     call       0x7f6aafd1e560
0188b f4                             hlt        
0188c be45ffffff                     mov        esi, 0xffffff45
01891 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01896 448b1424                       mov        r10d, dword ptr [rsp]
0189a 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
018a2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018a7 4c891424                       mov        qword ptr [rsp], r10
018ab 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
018b0 4c89542408                     mov        qword ptr [rsp + 8], r10
018b5 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
018ba 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
018c2 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
018c7 4c89542410                     mov        qword ptr [rsp + 0x10], r10
018cc 4489742420                     mov        dword ptr [rsp + 0x20], r14d
018d1 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
018d6 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
018db 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018e0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
018e5 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
018ea 4489542430                     mov        dword ptr [rsp + 0x30], r10d
018ef 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
018f4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
018f9 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
018fe 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01903 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01908 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
0190d 90                             nop        
0190e 90                             nop        
0190f 90                             nop        
01910 c5f877                         vzeroupper 
01913 e8c8a0aeff                     call       0x7f6a976cda60
01918 0f1f8400101a000b               nop        dword ptr [rax + rax + 0xb001a10]
01920 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
0192a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0192e e8adab1318                     call       0x7f6aafd1e560
01933 f4                             hlt        
01934 493bd8                         cmp        rbx, r8
01937 bdffffffff                     mov        ebp, 0xffffffff
0193c 7c08                           jl         0x7f6a97be39c6
0193e 400f95c5                       setne      bpl
01942 400fb6ed                       movzx      ebp, bpl
01946 be45ffffff                     mov        esi, 0xffffff45
0194b 48ff742408                     push       qword ptr [rsp + 8]
01950 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
01958 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0195d 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01965 48ff742420                     push       qword ptr [rsp + 0x20]
0196a 488f442408                     pop        qword ptr [rsp + 8]
0196f 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01974 4489542404                     mov        dword ptr [rsp + 4], r10d
01979 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0197e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01983 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01988 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0198d 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01992 4c89442468                     mov        qword ptr [rsp + 0x68], r8
01997 90                             nop        
01998 c5f877                         vzeroupper 
0199b e840a0aeff                     call       0x7f6a976cda60
019a0 0f1f8400981a000c               nop        dword ptr [rax + rax + 0xc001a98]
019a8 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
019b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
019b6 e825ab1318                     call       0x7f6aafd1e560
019bb f4                             hlt        
019bc be45ffffff                     mov        esi, 0xffffff45
019c1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
019c6 448b0424                       mov        r8d, dword ptr [rsp]
019ca 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
019d2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019d7 4c891424                       mov        qword ptr [rsp], r10
019db 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
019e0 4c89542408                     mov        qword ptr [rsp + 8], r10
019e5 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
019ea 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
019f2 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
019f7 4c89542410                     mov        qword ptr [rsp + 0x10], r10
019fc 4489742420                     mov        dword ptr [rsp + 0x20], r14d
01a01 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01a06 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01a0b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01a10 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01a15 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01a1a 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01a1f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01a24 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01a29 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01a2e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01a33 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01a38 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01a3d 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01a42 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01a47 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01a4c c5f877                         vzeroupper 
01a4f e88c9faeff                     call       0x7f6a976cda60
01a54 0f1f84004c1b000d               nop        dword ptr [rax + rax + 0xd001b4c]
01a5c 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
01a66 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a6a e871aa1318                     call       0x7f6aafd1e560
01a6f f4                             hlt        
01a70 be45ffffff                     mov        esi, 0xffffff45
01a75 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01a7a 448b1424                       mov        r10d, dword ptr [rsp]
01a7e 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01a86 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a8b 4c891424                       mov        qword ptr [rsp], r10
01a8f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01a94 4c89542408                     mov        qword ptr [rsp + 8], r10
01a99 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01a9e 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01aa6 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01aab 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01ab0 4489742420                     mov        dword ptr [rsp + 0x20], r14d
01ab5 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01aba 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01abf 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ac4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01ac9 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01ace 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01ad3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01ad8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01add 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01ae2 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ae7 90                             nop        
01ae8 c5f877                         vzeroupper 
01aeb e8f09eaeff                     call       0x7f6a976cda60
01af0 0f1f8400e81b000e               nop        dword ptr [rax + rax + 0xe001be8]
01af8 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
01b02 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b06 e8d5a91318                     call       0x7f6aafd1e560
01b0b f4                             hlt        
01b0c bee4ffffff                     mov        esi, 0xffffffe4
01b11 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01b16 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01b1b 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01b23 448b1c24                       mov        r11d, dword ptr [rsp]
01b27 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01b2f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b34 4c891424                       mov        qword ptr [rsp], r10
01b38 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01b3d 4c89542408                     mov        qword ptr [rsp + 8], r10
01b42 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01b47 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01b4f 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01b54 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01b59 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01b5e 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01b63 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01b68 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01b6d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b72 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01b77 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01b7c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01b81 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01b86 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01b8b 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01b90 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01b95 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01b9a 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01b9f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01ba4 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01ba9 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
01bae 90                             nop        
01baf 90                             nop        
01bb0 c5f877                         vzeroupper 
01bb3 e8289eaeff                     call       0x7f6a976cda60
01bb8 0f1f8400b01c000f               nop        dword ptr [rax + rax + 0xf001cb0]
01bc0 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
01bca 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bce e80da91318                     call       0x7f6aafd1e560
01bd3 f4                             hlt        
01bd4 bee4ffffff                     mov        esi, 0xffffffe4
01bd9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01bde 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01be3 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01beb 448b1424                       mov        r10d, dword ptr [rsp]
01bef 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01bf7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01bfc 4c891424                       mov        qword ptr [rsp], r10
01c00 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01c05 4c89542408                     mov        qword ptr [rsp + 8], r10
01c0a 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01c0f 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01c17 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01c1c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01c21 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01c26 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01c2b 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01c30 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01c35 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c3a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01c3f 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01c44 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01c49 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01c4e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01c53 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01c58 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01c5d 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01c62 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01c67 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01c6c 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01c71 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
01c76 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01c7b 90                             nop        
01c7c c5f877                         vzeroupper 
01c7f e85c9daeff                     call       0x7f6a976cda60
01c84 0f1f84007c1d0010               nop        dword ptr [rax + rax + 0x10001d7c]
01c8c 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
01c96 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c9a e841a81318                     call       0x7f6aafd1e560
01c9f f4                             hlt        
01ca0 4183c508                       add        r13d, 8
01ca4 be6effffff                     mov        esi, 0xffffff6e
01ca9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01cae 448b0424                       mov        r8d, dword ptr [rsp]
01cb2 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
01cba 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01cbf 4c890424                       mov        qword ptr [rsp], r8
01cc3 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
01cc8 4c89442408                     mov        qword ptr [rsp + 8], r8
01ccd 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01cd2 44898c24ec000000               mov        dword ptr [rsp + 0xec], r9d
01cda 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
01cdf 4c89442410                     mov        qword ptr [rsp + 0x10], r8
01ce4 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01ce9 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
01cee 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01cf3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01cf8 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01cfd 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01d02 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01d07 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01d0c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01d11 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01d16 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01d1b 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01d20 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01d25 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01d2a 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01d2f 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
01d37 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
01d3c 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01d41 4489442464                     mov        dword ptr [rsp + 0x64], r8d
01d46 90                             nop        
01d47 90                             nop        
01d48 c5f877                         vzeroupper 
01d4b e8909caeff                     call       0x7f6a976cda60
01d50 0f1f8400481e0011               nop        dword ptr [rax + rax + 0x11001e48]
01d58 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
01d62 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d66 e875a71318                     call       0x7f6aafd1e560
01d6b f4                             hlt        
01d6c 4183c508                       add        r13d, 8
01d70 be66ffffff                     mov        esi, 0xffffff66
01d75 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01d7a 448b0c24                       mov        r9d, dword ptr [rsp]
01d7e 44898c24e8000000               mov        dword ptr [rsp + 0xe8], r9d
01d86 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01d8b 4c890424                       mov        qword ptr [rsp], r8
01d8f 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
01d94 4c89442408                     mov        qword ptr [rsp + 8], r8
01d99 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01d9e 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
01da6 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
01dab 4c89442410                     mov        qword ptr [rsp + 0x10], r8
01db0 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01db5 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
01dba 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01dbf 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01dc4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01dc9 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01dce 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01dd3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01dd8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01ddd 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01de2 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01de7 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01dec 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01df1 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01df6 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01dfb 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
01e03 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
01e08 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01e0d 458bd0                         mov        r10d, r8d
01e10 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01e15 90                             nop        
01e16 90                             nop        
01e17 90                             nop        
01e18 c5f877                         vzeroupper 
01e1b e8c09baeff                     call       0x7f6a976cda60
01e20 0f1f8400181f0012               nop        dword ptr [rax + rax + 0x12001f18]
01e28 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
01e32 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e36 e8a5a61318                     call       0x7f6aafd1e560
01e3b f4                             hlt        
01e3c 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
01e46 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e4a e891a61318                     call       0x7f6aafd1e560
01e4f f4                             hlt        
01e50 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
01e5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e5e e87da61318                     call       0x7f6aafd1e560
01e63 f4                             hlt        
01e64 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
01e6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e72 e869a61318                     call       0x7f6aafd1e560
01e77 f4                             hlt        
01e78 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
01e82 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e86 e855a61318                     call       0x7f6aafd1e560
01e8b f4                             hlt        
01e8c 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
01e96 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e9a e841a61318                     call       0x7f6aafd1e560
01e9f f4                             hlt        
01ea0 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
01eaa 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eae e82da61318                     call       0x7f6aafd1e560
01eb3 f4                             hlt        
01eb4 beccffffff                     mov        esi, 0xffffffcc
01eb9 48ff742408                     push       qword ptr [rsp + 8]
01ebe 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
01ec6 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01ecb 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01ed3 48ff742420                     push       qword ptr [rsp + 0x20]
01ed8 488f442408                     pop        qword ptr [rsp + 8]
01edd 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01ee2 44895c2404                     mov        dword ptr [rsp + 4], r11d
01ee7 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01eec 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ef1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01ef6 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01efb 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01f00 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01f05 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01f0a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01f0f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01f14 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01f19 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01f1e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01f23 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01f28 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01f2d 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01f32 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01f37 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
01f3c 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01f40 c5f877                         vzeroupper 
01f43 e8989aaeff                     call       0x7f6a976cda60
01f48 0f1f840040200013               nop        dword ptr [rax + rax + 0x13002040]
01f50 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
01f5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f5e e87da51318                     call       0x7f6aafd1e560
01f63 f4                             hlt        
01f64 beccffffff                     mov        esi, 0xffffffcc
01f69 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01f6e 448b1424                       mov        r10d, dword ptr [rsp]
01f72 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01f7a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f7f 4c891424                       mov        qword ptr [rsp], r10
01f83 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01f88 4c89542408                     mov        qword ptr [rsp + 8], r10
01f8d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01f92 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01f9a 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01f9f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01fa4 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01fa9 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01fae 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01fb3 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01fb8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01fbd 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01fc2 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01fc7 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01fcc 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01fd1 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01fd6 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01fdb 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01fe0 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01fe5 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01fea 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01fef 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01ff4 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
01ffc 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02001 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
02006 90                             nop        
02007 90                             nop        
02008 c5f877                         vzeroupper 
0200b e8d099aeff                     call       0x7f6a976cda60
02010 0f1f840008210014               nop        dword ptr [rax + rax + 0x14002108]
02018 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
02022 4883e4f0                       and        rsp, 0xfffffffffffffff0
02026 e8b5a41318                     call       0x7f6aafd1e560
0202b f4                             hlt        
0202c 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
02031 4d3bd3                         cmp        r10, r11
02034 bdffffffff                     mov        ebp, 0xffffffff
02039 7c08                           jl         0x7f6a97be40c3
0203b 400f95c5                       setne      bpl
0203f 400fb6ed                       movzx      ebp, bpl
02043 be45ffffff                     mov        esi, 0xffffff45
02048 48ff742408                     push       qword ptr [rsp + 8]
0204d 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
02055 48ff742420                     push       qword ptr [rsp + 0x20]
0205a 488f442408                     pop        qword ptr [rsp + 8]
0205f 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02064 4489542404                     mov        dword ptr [rsp + 4], r10d
02069 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0206e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02073 4489742428                     mov        dword ptr [rsp + 0x28], r14d
02078 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0207d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02082 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02087 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0208c 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02091 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02096 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0209b 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
020a0 4c89442460                     mov        qword ptr [rsp + 0x60], r8
020a5 90                             nop        
020a6 90                             nop        
020a7 90                             nop        
020a8 c5f877                         vzeroupper 
020ab e83099aeff                     call       0x7f6a976cda60
020b0 0f1f8400a8210015               nop        dword ptr [rax + rax + 0x150021a8]
020b8 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
020c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
020c6 e815a41318                     call       0x7f6aafd1e560
020cb f4                             hlt        
020cc 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
020d1 493beb                         cmp        rbp, r11
020d4 bdffffffff                     mov        ebp, 0xffffffff
020d9 7c08                           jl         0x7f6a97be4163
020db 400f95c5                       setne      bpl
020df 400fb6ed                       movzx      ebp, bpl
020e3 be45ffffff                     mov        esi, 0xffffff45
020e8 48ff742408                     push       qword ptr [rsp + 8]
020ed 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
020f5 48ff742420                     push       qword ptr [rsp + 0x20]
020fa 488f442408                     pop        qword ptr [rsp + 8]
020ff 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02104 4489542404                     mov        dword ptr [rsp + 4], r10d
02109 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0210e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02113 4489742428                     mov        dword ptr [rsp + 0x28], r14d
02118 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0211d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02122 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02127 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0212c 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02131 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02136 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0213b 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02140 4c89442460                     mov        qword ptr [rsp + 0x60], r8
02145 90                             nop        
02146 90                             nop        
02147 90                             nop        
02148 c5f877                         vzeroupper 
0214b e89098aeff                     call       0x7f6a976cda60
02150 0f1f840048220016               nop        dword ptr [rax + rax + 0x16002248]
02158 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
02162 4883e4f0                       and        rsp, 0xfffffffffffffff0
02166 e875a31318                     call       0x7f6aafd1e560
0216b f4                             hlt        
0216c 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
02174 458bc1                         mov        r8d, r9d
02177 4403842498000000               add        r8d, dword ptr [rsp + 0x98]
0217f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02184 4f8b5c0308                     mov        r11, qword ptr [r11 + r8 + 8]
02189 8b8c2498000000                 mov        ecx, dword ptr [rsp + 0x98]
02190 8b542470                       mov        edx, dword ptr [rsp + 0x70]
02194 4c895c0a08                     mov        qword ptr [rdx + rcx + 8], r11
02199 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
021a1 4183c008                       add        r8d, 8
021a5 453bc2                         cmp        r8d, r10d
021a8 7cc2                           jl         0x7f6a97be41ec
021aa 443bc7                         cmp        r8d, edi
021ad 0f8dd1000000                   jge        0x7f6a97be4304
021b3 4d63d0                         movsxd     r10, r8d
021b6 4c03d3                         add        r10, rbx
021b9 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
021c1 0f8314120000                   jae        0x7f6a97be545b
021c7 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
021cf 4183c240                       add        r10d, 0x40
021d3 458bda                         mov        r11d, r10d
021d6 4d63d2                         movsxd     r10, r10d
021d9 4c03d3                         add        r10, rbx
021dc 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
021e4 0f8305120000                   jae        0x7f6a97be546f
021ea 443b842488000000               cmp        r8d, dword ptr [rsp + 0x88]
021f2 0f830b120000                   jae        0x7f6a97be5483
021f8 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
02200 0f8311120000                   jae        0x7f6a97be5497
02206 90                             nop        
02207 90                             nop        
02208 90                             nop        
02209 90                             nop        
0220a 90                             nop        
0220b 90                             nop        
0220c 90                             nop        
0220d 90                             nop        
0220e 90                             nop        
0220f 90                             nop        
02210 478d1401                       lea        r10d, [r9 + r8]
02214 418bc8                         mov        ecx, r8d
02217 4863d1                         movsxd     rdx, ecx
0221a 458bda                         mov        r11d, r10d
0221d 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
02221 4e8b5c1908                     mov        r11, qword ptr [rcx + r11 + 8]
02226 4963f2                         movsxd     rsi, r10d
02229 418bc8                         mov        ecx, r8d
0222c 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02230 4c895c0808                     mov        qword ptr [rax + rcx + 8], r11
02235 4c8b543010                     mov        r10, qword ptr [rax + rsi + 0x10]
0223a 4c89541010                     mov        qword ptr [rax + rdx + 0x10], r10
0223f 4c8b543018                     mov        r10, qword ptr [rax + rsi + 0x18]
02244 4c89541018                     mov        qword ptr [rax + rdx + 0x18], r10
02249 4c8b543020                     mov        r10, qword ptr [rax + rsi + 0x20]
0224e 4c89541020                     mov        qword ptr [rax + rdx + 0x20], r10
02253 4c8b543028                     mov        r10, qword ptr [rax + rsi + 0x28]
02258 4c89541028                     mov        qword ptr [rax + rdx + 0x28], r10
0225d 4c8b543030                     mov        r10, qword ptr [rax + rsi + 0x30]
02262 4c89541030                     mov        qword ptr [rax + rdx + 0x30], r10
02267 4c8b543038                     mov        r10, qword ptr [rax + rsi + 0x38]
0226c 4c89541038                     mov        qword ptr [rax + rdx + 0x38], r10
02271 4c8b543040                     mov        r10, qword ptr [rax + rsi + 0x40]
02276 4c89541040                     mov        qword ptr [rax + rdx + 0x40], r10
0227b 4183c040                       add        r8d, 0x40
0227f 443bc7                         cmp        r8d, edi
02282 7c8c                           jl         0x7f6a97be4290
02284 443b8424a8000000               cmp        r8d, dword ptr [rsp + 0xa8]
0228c 0f8d70f3ffff                   jge        0x7f6a97be3682
02292 4d63d0                         movsxd     r10, r8d
02295 4c03d3                         add        r10, rbx
02298 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
022a0 0f8385110000                   jae        0x7f6a97be54ab
022a6 443b842488000000               cmp        r8d, dword ptr [rsp + 0x88]
022ae 0f838b110000                   jae        0x7f6a97be54bf
022b4 478d1401                       lea        r10d, [r9 + r8]
022b8 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
022bd 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
022c2 458bd8                         mov        r11d, r8d
022c5 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
022c9 4e89541b08                     mov        qword ptr [rbx + r11 + 8], r10
022ce 4183c008                       add        r8d, 8
022d2 443b8424a8000000               cmp        r8d, dword ptr [rsp + 0xa8]
022da 7cd8                           jl         0x7f6a97be4334
022dc e921f3ffff                     jmp        0x7f6a97be3682
022e1 bee4ffffff                     mov        esi, 0xffffffe4
022e6 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
022eb 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
022f0 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
022f8 448b1c24                       mov        r11d, dword ptr [rsp]
022fc 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02304 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02309 4c891424                       mov        qword ptr [rsp], r10
0230d 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02312 4c89542408                     mov        qword ptr [rsp + 8], r10
02317 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0231c 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02324 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02329 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0232e 4489742420                     mov        dword ptr [rsp + 0x20], r14d
02333 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02338 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0233d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02342 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02347 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0234c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
02351 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02356 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0235b 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02360 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02365 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0236a 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0236f 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02374 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02379 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
0237e 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
02383 90                             nop        
02384 c5f877                         vzeroupper 
02387 e85496aeff                     call       0x7f6a976cda60
0238c 0f1f840084240017               nop        dword ptr [rax + rax + 0x17002484]
02394 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
0239e 4883e4f0                       and        rsp, 0xfffffffffffffff0
023a2 e839a11318                     call       0x7f6aafd1e560
023a7 f4                             hlt        
023a8 85db                           test       ebx, ebx
023aa 0f84a3100000                   je         0x7f6a97be54d3
023b0 448b1c24                       mov        r11d, dword ptr [rsp]
023b4 4533c0                         xor        r8d, r8d
023b7 e917ebffff                     jmp        0x7f6a97be2f53
023bc be6effffff                     mov        esi, 0xffffff6e
023c1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
023c6 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
023cb 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
023d3 448b1c24                       mov        r11d, dword ptr [rsp]
023d7 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
023df 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
023e4 4c891424                       mov        qword ptr [rsp], r10
023e8 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
023ed 4c89542408                     mov        qword ptr [rsp + 8], r10
023f2 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
023f7 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
023ff 4489742420                     mov        dword ptr [rsp + 0x20], r14d
02404 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02409 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0240e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02413 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02418 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0241d 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02422 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02427 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0242c 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02431 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02436 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0243b 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02440 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02445 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0244a 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
0244f 894c2460                       mov        dword ptr [rsp + 0x60], ecx
02453 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
02458 c5f877                         vzeroupper 
0245b e88095aeff                     call       0x7f6a976cda60
02460 0f1f840058250018               nop        dword ptr [rax + rax + 0x18002558]
02468 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
02472 4883e4f0                       and        rsp, 0xfffffffffffffff0
02476 e865a01318                     call       0x7f6aafd1e560
0247b f4                             hlt        
0247c be45ffffff                     mov        esi, 0xffffff45
02481 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02486 448b1c24                       mov        r11d, dword ptr [rsp]
0248a 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02492 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02497 4c891424                       mov        qword ptr [rsp], r10
0249b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
024a0 4c89542408                     mov        qword ptr [rsp + 8], r10
024a5 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
024aa 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
024b2 4489742420                     mov        dword ptr [rsp + 0x20], r14d
024b7 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
024bc 4489542424                     mov        dword ptr [rsp + 0x24], r10d
024c1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
024c6 4c89542428                     mov        qword ptr [rsp + 0x28], r10
024cb 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
024d0 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
024d5 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
024da 4c89542438                     mov        qword ptr [rsp + 0x38], r10
024df 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
024e4 4c89542440                     mov        qword ptr [rsp + 0x40], r10
024e9 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
024ee 4489542434                     mov        dword ptr [rsp + 0x34], r10d
024f3 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
024f8 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
024fd 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
02502 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
02507 90                             nop        
02508 c5f877                         vzeroupper 
0250b e8d094aeff                     call       0x7f6a976cda60
02510 0f1f840008260019               nop        dword ptr [rax + rax + 0x19002608]
02518 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
02522 4883e4f0                       and        rsp, 0xfffffffffffffff0
02526 e8b59f1318                     call       0x7f6aafd1e560
0252b f4                             hlt        
0252c be3dffffff                     mov        esi, 0xffffff3d
02531 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02536 448b1c24                       mov        r11d, dword ptr [rsp]
0253a 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02542 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02547 4c891424                       mov        qword ptr [rsp], r10
0254b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02550 4c89542408                     mov        qword ptr [rsp + 8], r10
02555 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0255a 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02562 4489742420                     mov        dword ptr [rsp + 0x20], r14d
02567 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0256c 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02571 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02576 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0257b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02580 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02585 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0258a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0258f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02594 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02599 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0259e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
025a3 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
025a8 4489542448                     mov        dword ptr [rsp + 0x48], r10d
025ad 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
025b2 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
025b7 90                             nop        
025b8 c5f877                         vzeroupper 
025bb e82094aeff                     call       0x7f6a976cda60
025c0 0f1f8400b826001a               nop        dword ptr [rax + rax + 0x1a0026b8]
025c8 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
025d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
025d6 e8059f1318                     call       0x7f6aafd1e560
025db f4                             hlt        
025dc bee4ffffff                     mov        esi, 0xffffffe4
025e1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
025e6 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
025eb 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
025f3 448b1c24                       mov        r11d, dword ptr [rsp]
025f7 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
025ff 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02604 4c891424                       mov        qword ptr [rsp], r10
02608 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0260d 4c89542408                     mov        qword ptr [rsp + 8], r10
02612 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02617 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
0261f 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02624 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02629 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0262e 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02633 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02638 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0263d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02642 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02647 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0264c 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02651 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02656 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0265b 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02660 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02665 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0266a 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0266f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02674 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02679 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
0267e 90                             nop        
0267f 90                             nop        
02680 c5f877                         vzeroupper 
02683 e85893aeff                     call       0x7f6a976cda60
02688 0f1f84008027001b               nop        dword ptr [rax + rax + 0x1b002780]
02690 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
0269a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0269e e83d9e1318                     call       0x7f6aafd1e560
026a3 f4                             hlt        
026a4 bee4ffffff                     mov        esi, 0xffffffe4
026a9 48ff742408                     push       qword ptr [rsp + 8]
026ae 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
026b6 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
026bb 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
026c3 48ff742420                     push       qword ptr [rsp + 0x20]
026c8 488f442408                     pop        qword ptr [rsp + 8]
026cd 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
026d2 4489542404                     mov        dword ptr [rsp + 4], r10d
026d7 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
026dc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
026e1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
026e6 4489542420                     mov        dword ptr [rsp + 0x20], r10d
026eb 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
026f0 4489542428                     mov        dword ptr [rsp + 0x28], r10d
026f5 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
026fa 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
026ff 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02704 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02709 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0270e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02713 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02718 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0271d 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02722 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02727 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
0272c c5f877                         vzeroupper 
0272f e8ac92aeff                     call       0x7f6a976cda60
02734 0f1f84002c28001c               nop        dword ptr [rax + rax + 0x1c00282c]
0273c 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
02746 4883e4f0                       and        rsp, 0xfffffffffffffff0
0274a e8919d1318                     call       0x7f6aafd1e560
0274f f4                             hlt        
02750 418d6d01                       lea        ebp, [r13 + 1]
02754 bee4ffffff                     mov        esi, 0xffffffe4
02759 48ff742408                     push       qword ptr [rsp + 8]
0275e 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
02766 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0276b 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02773 48ff742420                     push       qword ptr [rsp + 0x20]
02778 488f442408                     pop        qword ptr [rsp + 8]
0277d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02782 44895c2404                     mov        dword ptr [rsp + 4], r11d
02787 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0278c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02791 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02796 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0279b 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
027a0 4489542428                     mov        dword ptr [rsp + 0x28], r10d
027a5 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
027aa 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
027af 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
027b4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
027b9 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
027be 4c89542440                     mov        qword ptr [rsp + 0x40], r10
027c3 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
027c8 4489542448                     mov        dword ptr [rsp + 0x48], r10d
027cd 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
027d2 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
027d7 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
027dc c5f877                         vzeroupper 
027df e8fc91aeff                     call       0x7f6a976cda60
027e4 0f1f8400dc28001d               nop        dword ptr [rax + rax + 0x1d0028dc]
027ec 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
027f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
027fa e8e19c1318                     call       0x7f6aafd1e560
027ff f4                             hlt        
02800 bee4ffffff                     mov        esi, 0xffffffe4
02805 48ff742408                     push       qword ptr [rsp + 8]
0280a 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
02812 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02817 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0281f 48ff742420                     push       qword ptr [rsp + 0x20]
02824 488f442408                     pop        qword ptr [rsp + 8]
02829 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0282e 4489542404                     mov        dword ptr [rsp + 4], r10d
02833 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02838 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0283d 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02842 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02847 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0284c 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02851 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
02856 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0285b 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02860 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02865 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0286a 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0286f 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02874 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02879 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0287e 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
02883 90                             nop        
02884 c5f877                         vzeroupper 
02887 e85491aeff                     call       0x7f6a976cda60
0288c 0f1f84008429001e               nop        dword ptr [rax + rax + 0x1e002984]
02894 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
0289e 4883e4f0                       and        rsp, 0xfffffffffffffff0
028a2 e8399c1318                     call       0x7f6aafd1e560
028a7 f4                             hlt        
028a8 bee4ffffff                     mov        esi, 0xffffffe4
028ad 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
028b2 448b1424                       mov        r10d, dword ptr [rsp]
028b6 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
028be 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
028c3 4c891424                       mov        qword ptr [rsp], r10
028c7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
028cc 4c89542408                     mov        qword ptr [rsp + 8], r10
028d1 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
028d6 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
028de 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
028e3 4c89542410                     mov        qword ptr [rsp + 0x10], r10
028e8 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
028ed 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
028f2 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
028f7 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
028fc 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02901 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02906 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0290b 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02910 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02915 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0291a 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0291f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02924 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02929 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0292e 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
02933 90                             nop        
02934 c5f877                         vzeroupper 
02937 e8a490aeff                     call       0x7f6a976cda60
0293c 0f1f8400342a001f               nop        dword ptr [rax + rax + 0x1f002a34]
02944 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
0294e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02952 e8899b1318                     call       0x7f6aafd1e560
02957 f4                             hlt        
02958 beccffffff                     mov        esi, 0xffffffcc
0295d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02962 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02967 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0296f 448b1c24                       mov        r11d, dword ptr [rsp]
02973 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
0297b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02980 4c891424                       mov        qword ptr [rsp], r10
02984 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02989 4c89542408                     mov        qword ptr [rsp + 8], r10
0298e 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02993 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
0299b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
029a0 4c89542410                     mov        qword ptr [rsp + 0x10], r10
029a5 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
029aa 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
029af 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
029b4 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
029b9 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
029be 4c89542428                     mov        qword ptr [rsp + 0x28], r10
029c3 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
029c8 4489542424                     mov        dword ptr [rsp + 0x24], r10d
029cd 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
029d2 4c89542430                     mov        qword ptr [rsp + 0x30], r10
029d7 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
029dc 4c89542438                     mov        qword ptr [rsp + 0x38], r10
029e1 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
029e6 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
029eb 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
029f0 4489542444                     mov        dword ptr [rsp + 0x44], r10d
029f5 44896c2460                     mov        dword ptr [rsp + 0x60], r13d
029fa 90                             nop        
029fb 90                             nop        
029fc c5f877                         vzeroupper 
029ff e8dc8faeff                     call       0x7f6a976cda60
02a04 0f1f8400fc2a0020               nop        dword ptr [rax + rax + 0x20002afc]
02a0c 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
02a16 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a1a e8c19a1318                     call       0x7f6aafd1e560
02a1f f4                             hlt        
02a20 be45ffffff                     mov        esi, 0xffffff45
02a25 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02a2a 448b1424                       mov        r10d, dword ptr [rsp]
02a2e 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02a36 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02a3b 4c891424                       mov        qword ptr [rsp], r10
02a3f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02a44 4c89542408                     mov        qword ptr [rsp + 8], r10
02a49 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02a4e 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02a56 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02a5b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02a60 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02a65 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02a6a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02a6f 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02a74 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02a79 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02a7e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02a83 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02a88 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02a8d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02a92 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
02a97 90                             nop        
02a98 c5f877                         vzeroupper 
02a9b e8408faeff                     call       0x7f6a976cda60
02aa0 0f1f8400982b0021               nop        dword ptr [rax + rax + 0x21002b98]
02aa8 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
02ab2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ab6 e8259a1318                     call       0x7f6aafd1e560
02abb f4                             hlt        
02abc be17000000                     mov        esi, 0x17
02ac1 90                             nop        
02ac2 90                             nop        
02ac3 90                             nop        
02ac4 c5f877                         vzeroupper 
02ac7 e8148faeff                     call       0x7f6a976cda60
02acc 0f1f8400c42b0022               nop        dword ptr [rax + rax + 0x22002bc4]
02ad4 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
02ade 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ae2 e8f9991318                     call       0x7f6aafd1e560
02ae7 f4                             hlt        
02ae8 be6effffff                     mov        esi, 0xffffff6e
02aed 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02af2 4c89b424e0000000               mov        qword ptr [rsp + 0xe0], r14
02afa 4c895c2408                     mov        qword ptr [rsp + 8], r11
02aff 895c2418                       mov        dword ptr [rsp + 0x18], ebx
02b03 48894424f8                     mov        qword ptr [rsp - 8], rax
02b08 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02b0c 89442420                       mov        dword ptr [rsp + 0x20], eax
02b10 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b15 48ff742430                     push       qword ptr [rsp + 0x30]
02b1a 488f442428                     pop        qword ptr [rsp + 0x28]
02b1f 89542424                       mov        dword ptr [rsp + 0x24], edx
02b23 4c89442430                     mov        qword ptr [rsp + 0x30], r8
02b28 48ff742448                     push       qword ptr [rsp + 0x48]
02b2d 488f442438                     pop        qword ptr [rsp + 0x38]
02b32 894c2440                       mov        dword ptr [rsp + 0x40], ecx
02b36 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
02b3b 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02b40 c5f877                         vzeroupper 
02b43 e8988eaeff                     call       0x7f6a976cda60
02b48 0f1f8400402c0023               nop        dword ptr [rax + rax + 0x23002c40]
02b50 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
02b5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b5e e87d991318                     call       0x7f6aafd1e560
02b63 f4                             hlt        
02b64 bebeffffff                     mov        esi, 0xffffffbe
02b69 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02b6e 4c89b424e0000000               mov        qword ptr [rsp + 0xe0], r14
02b76 448b1424                       mov        r10d, dword ptr [rsp]
02b7a 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02b82 4c891c24                       mov        qword ptr [rsp], r11
02b86 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02b8b 4c89542408                     mov        qword ptr [rsp + 8], r10
02b90 4889442410                     mov        qword ptr [rsp + 0x10], rax
02b95 895c2418                       mov        dword ptr [rsp + 0x18], ebx
02b99 48894424f8                     mov        qword ptr [rsp - 8], rax
02b9e 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02ba2 89442420                       mov        dword ptr [rsp + 0x20], eax
02ba6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bab 48ff742430                     push       qword ptr [rsp + 0x30]
02bb0 488f442428                     pop        qword ptr [rsp + 0x28]
02bb5 89542424                       mov        dword ptr [rsp + 0x24], edx
02bb9 4c89442430                     mov        qword ptr [rsp + 0x30], r8
02bbe 48ff742448                     push       qword ptr [rsp + 0x48]
02bc3 488f442438                     pop        qword ptr [rsp + 0x38]
02bc8 894c2440                       mov        dword ptr [rsp + 0x40], ecx
02bcc 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
02bd1 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02bd6 90                             nop        
02bd7 90                             nop        
02bd8 c5f877                         vzeroupper 
02bdb e8008eaeff                     call       0x7f6a976cda60
02be0 0f1f8400d82c0024               nop        dword ptr [rax + rax + 0x24002cd8]
02be8 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
02bf2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bf6 e8e5981318                     call       0x7f6aafd1e560
02bfb f4                             hlt        
02bfc 4c8b742468                     mov        r14, qword ptr [rsp + 0x68]
02c01 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
02c05 beccffffff                     mov        esi, 0xffffffcc
02c0a 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02c0f 4c89b424e8000000               mov        qword ptr [rsp + 0xe8], r14
02c17 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
02c1f 891c24                         mov        dword ptr [rsp], ebx
02c22 4489542404                     mov        dword ptr [rsp + 4], r10d
02c27 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02c2c c5f877                         vzeroupper 
02c2f e8ac8daeff                     call       0x7f6a976cda60
02c34 0f1f84002c2d0025               nop        dword ptr [rax + rax + 0x25002d2c]
02c3c 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
02c46 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c4a e891981318                     call       0x7f6aafd1e560
02c4f f4                             hlt        
02c50 bee4ffffff                     mov        esi, 0xffffffe4
02c55 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02c5a 448b1c24                       mov        r11d, dword ptr [rsp]
02c5e 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02c66 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02c6b 4c891424                       mov        qword ptr [rsp], r10
02c6f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02c74 4c89542408                     mov        qword ptr [rsp + 8], r10
02c79 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02c7e 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02c86 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02c8b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02c90 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02c95 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02c9a 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02c9f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02ca4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02ca9 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02cae 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02cb3 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02cb8 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02cbd 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02cc2 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02cc7 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02ccc 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02cd1 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02cd6 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02cdb 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02ce0 895c2458                       mov        dword ptr [rsp + 0x58], ebx
02ce4 4489742460                     mov        dword ptr [rsp + 0x60], r14d
02ce9 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02cee 90                             nop        
02cef 90                             nop        
02cf0 c5f877                         vzeroupper 
02cf3 e8e88caeff                     call       0x7f6a976cda60
02cf8 0f1f8400f02d0026               nop        dword ptr [rax + rax + 0x26002df0]
02d00 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
02d0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d0e e8cd971318                     call       0x7f6aafd1e560
02d13 f4                             hlt        
02d14 c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
02d1d bee4ffffff                     mov        esi, 0xffffffe4
02d22 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02d27 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02d2f 448b1424                       mov        r10d, dword ptr [rsp]
02d33 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02d3b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02d40 4c891424                       mov        qword ptr [rsp], r10
02d44 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02d49 4c89542408                     mov        qword ptr [rsp + 8], r10
02d4e 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02d53 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02d5b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02d60 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02d65 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02d6a 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02d6f 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02d74 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02d79 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02d7e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02d83 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02d88 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02d8d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02d92 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02d97 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02d9c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02da1 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02da6 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02dab 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02db0 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02db5 895c2458                       mov        dword ptr [rsp + 0x58], ebx
02db9 4489742460                     mov        dword ptr [rsp + 0x60], r14d
02dbe 894c2468                       mov        dword ptr [rsp + 0x68], ecx
02dc2 90                             nop        
02dc3 90                             nop        
02dc4 c5f877                         vzeroupper 
02dc7 e8148caeff                     call       0x7f6a976cda60
02dcc 0f1f8400c42e0027               nop        dword ptr [rax + rax + 0x27002ec4]
02dd4 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
02dde 4883e4f0                       and        rsp, 0xfffffffffffffff0
02de2 e8f9961318                     call       0x7f6aafd1e560
02de7 f4                             hlt        
02de8 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
02df0 beccffffff                     mov        esi, 0xffffffcc
02df5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02dfa 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
02dff 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
02e07 448b1c24                       mov        r11d, dword ptr [rsp]
02e0b 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02e13 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02e18 4c891c24                       mov        qword ptr [rsp], r11
02e1c 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02e21 4c895c2408                     mov        qword ptr [rsp + 8], r11
02e26 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02e2b 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02e33 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
02e38 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02e3d 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
02e42 4489442418                     mov        dword ptr [rsp + 0x18], r8d
02e47 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02e4c 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02e51 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02e56 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
02e5b 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
02e60 4489442430                     mov        dword ptr [rsp + 0x30], r8d
02e65 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
02e6a 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
02e6f 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
02e74 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
02e79 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02e7e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02e83 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
02e88 4489442448                     mov        dword ptr [rsp + 0x48], r8d
02e8d 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
02e92 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
02e97 90                             nop        
02e98 c5f877                         vzeroupper 
02e9b e8408baeff                     call       0x7f6a976cda60
02ea0 0f1f8400982f0028               nop        dword ptr [rax + rax + 0x28002f98]
02ea8 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
02eb2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02eb6 e825961318                     call       0x7f6aafd1e560
02ebb f4                             hlt        
02ebc 418bee                         mov        ebp, r14d
02ebf 83c510                         add        ebp, 0x10
02ec2 be6effffff                     mov        esi, 0xffffff6e
02ec7 48ff742408                     push       qword ptr [rsp + 8]
02ecc 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
02ed4 48ff742420                     push       qword ptr [rsp + 0x20]
02ed9 488f442408                     pop        qword ptr [rsp + 8]
02ede 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02ee3 44895c2404                     mov        dword ptr [rsp + 4], r11d
02ee8 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02eed 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02ef2 4489742424                     mov        dword ptr [rsp + 0x24], r14d
02ef7 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02efc 4489542428                     mov        dword ptr [rsp + 0x28], r10d
02f01 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02f06 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
02f0b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02f10 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02f15 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02f1a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02f1f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02f24 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02f29 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02f2e 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02f33 895c2464                       mov        dword ptr [rsp + 0x64], ebx
02f37 90                             nop        
02f38 c5f877                         vzeroupper 
02f3b e8a08aaeff                     call       0x7f6a976cda60
02f40 0f1f840038300029               nop        dword ptr [rax + rax + 0x29003038]
02f48 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
02f52 4883e4f0                       and        rsp, 0xfffffffffffffff0
02f56 e885951318                     call       0x7f6aafd1e560
02f5b f4                             hlt        
02f5c 418bee                         mov        ebp, r14d
02f5f 83c510                         add        ebp, 0x10
02f62 be66ffffff                     mov        esi, 0xffffff66
02f67 48ff742408                     push       qword ptr [rsp + 8]
02f6c 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
02f74 48ff742420                     push       qword ptr [rsp + 0x20]
02f79 488f442408                     pop        qword ptr [rsp + 8]
02f7e 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02f83 4489542404                     mov        dword ptr [rsp + 4], r10d
02f88 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02f8d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02f92 4489742424                     mov        dword ptr [rsp + 0x24], r14d
02f97 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02f9c 4489542428                     mov        dword ptr [rsp + 0x28], r10d
02fa1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02fa6 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
02fab 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02fb0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02fb5 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02fba 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02fbf 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02fc4 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02fc9 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02fce 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02fd3 895c2464                       mov        dword ptr [rsp + 0x64], ebx
02fd7 90                             nop        
02fd8 c5f877                         vzeroupper 
02fdb e8008aaeff                     call       0x7f6a976cda60
02fe0 0f1f8400d830002a               nop        dword ptr [rax + rax + 0x2a0030d8]
02fe8 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
02ff2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ff6 e8e5941318                     call       0x7f6aafd1e560
02ffb f4                             hlt        
02ffc 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
03006 4883e4f0                       and        rsp, 0xfffffffffffffff0
0300a e8d1941318                     call       0x7f6aafd1e560
0300f f4                             hlt        
03010 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
0301a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0301e e8bd941318                     call       0x7f6aafd1e560
03023 f4                             hlt        
03024 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
0302e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03032 e8a9941318                     call       0x7f6aafd1e560
03037 f4                             hlt        
03038 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
03042 4883e4f0                       and        rsp, 0xfffffffffffffff0
03046 e895941318                     call       0x7f6aafd1e560
0304b f4                             hlt        
0304c bee4ffffff                     mov        esi, 0xffffffe4
03051 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
03056 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0305b 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
03063 448b1424                       mov        r10d, dword ptr [rsp]
03067 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
0306f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
03074 4c891424                       mov        qword ptr [rsp], r10
03078 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0307d 4c89542408                     mov        qword ptr [rsp + 8], r10
03082 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
03087 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
0308f 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
03094 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03099 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0309e 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
030a3 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
030a8 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
030ad 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
030b2 4c89542428                     mov        qword ptr [rsp + 0x28], r10
030b7 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
030bc 4489542424                     mov        dword ptr [rsp + 0x24], r10d
030c1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
030c6 4c89542430                     mov        qword ptr [rsp + 0x30], r10
030cb 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
030d0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
030d5 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
030da 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
030df 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
030e4 4489542444                     mov        dword ptr [rsp + 0x44], r10d
030e9 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
030ee 90                             nop        
030ef 90                             nop        
030f0 c5f877                         vzeroupper 
030f3 e8e888aeff                     call       0x7f6a976cda60
030f8 0f1f8400f031002b               nop        dword ptr [rax + rax + 0x2b0031f0]
03100 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
0310a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0310e e8cd931318                     call       0x7f6aafd1e560
03113 f4                             hlt        
03114 bee4ffffff                     mov        esi, 0xffffffe4
03119 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0311e 448b1c24                       mov        r11d, dword ptr [rsp]
03122 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
0312a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0312f 4c891424                       mov        qword ptr [rsp], r10
03133 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
03138 4c89542408                     mov        qword ptr [rsp + 8], r10
0313d 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
03142 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
0314a 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0314f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03154 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
03159 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0315e 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
03163 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
03168 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0316d 4c89542428                     mov        qword ptr [rsp + 0x28], r10
03172 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
03177 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0317c 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
03181 4c89542430                     mov        qword ptr [rsp + 0x30], r10
03186 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0318b 4c89542438                     mov        qword ptr [rsp + 0x38], r10
03190 c5f877                         vzeroupper 
03193 e84888aeff                     call       0x7f6a976cda60
03198 0f1f84009032002c               nop        dword ptr [rax + rax + 0x2c003290]
031a0 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
031aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
031ae e82d931318                     call       0x7f6aafd1e560
031b3 f4                             hlt        
031b4 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
031bc 4183c308                       add        r11d, 8
031c0 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
031c5 be6effffff                     mov        esi, 0xffffff6e
031ca 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
031cf 448b1c24                       mov        r11d, dword ptr [rsp]
031d3 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
031db 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
031e0 4c891424                       mov        qword ptr [rsp], r10
031e4 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
031e9 4c89542408                     mov        qword ptr [rsp + 8], r10
031ee 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
031f3 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
031fb 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
03200 4489542420                     mov        dword ptr [rsp + 0x20], r10d
03205 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0320a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0320f 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
03214 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
03219 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0321e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
03223 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
03228 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0322d 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
03235 458bd3                         mov        r10d, r11d
03238 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0323d 90                             nop        
0323e 90                             nop        
0323f 90                             nop        
03240 c5f877                         vzeroupper 
03243 e89887aeff                     call       0x7f6a976cda60
03248 0f1f84004033002d               nop        dword ptr [rax + rax + 0x2d003340]
03250 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
0325a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0325e e87d921318                     call       0x7f6aafd1e560
03263 f4                             hlt        
03264 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0326c 4183c208                       add        r10d, 8
03270 4489542454                     mov        dword ptr [rsp + 0x54], r10d
03275 be66ffffff                     mov        esi, 0xffffff66
0327a 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0327f 448b1c24                       mov        r11d, dword ptr [rsp]
03283 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
0328b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
03290 4c891424                       mov        qword ptr [rsp], r10
03294 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
03299 4c89542408                     mov        qword ptr [rsp + 8], r10
0329e 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
032a3 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
032ab 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
032b0 4489542420                     mov        dword ptr [rsp + 0x20], r10d
032b5 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
032ba 4c89542428                     mov        qword ptr [rsp + 0x28], r10
032bf 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
032c4 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
032c9 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
032ce 4c89542430                     mov        qword ptr [rsp + 0x30], r10
032d3 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
032d8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
032dd 458bd0                         mov        r10d, r8d
032e0 4489542450                     mov        dword ptr [rsp + 0x50], r10d
032e5 90                             nop        
032e6 90                             nop        
032e7 90                             nop        
032e8 c5f877                         vzeroupper 
032eb e8f086aeff                     call       0x7f6a976cda60
032f0 0f1f8400e833002e               nop        dword ptr [rax + rax + 0x2e0033e8]
032f8 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
03302 4883e4f0                       and        rsp, 0xfffffffffffffff0
03306 e8d5911318                     call       0x7f6aafd1e560
0330b f4                             hlt        
0330c 8bca                           mov        ecx, edx
0330e e99ee2ffff                     jmp        0x7f6a97be3631
03313 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
0331d 4883e4f0                       and        rsp, 0xfffffffffffffff0
03321 e8ba911318                     call       0x7f6aafd1e560
03326 f4                             hlt        
03327 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
03331 4883e4f0                       and        rsp, 0xfffffffffffffff0
03335 e8a6911318                     call       0x7f6aafd1e560
0333a f4                             hlt        
0333b 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
03345 4883e4f0                       and        rsp, 0xfffffffffffffff0
03349 e892911318                     call       0x7f6aafd1e560
0334e f4                             hlt        
0334f 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
03359 4883e4f0                       and        rsp, 0xfffffffffffffff0
0335d e87e911318                     call       0x7f6aafd1e560
03362 f4                             hlt        
03363 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
0336d 4883e4f0                       and        rsp, 0xfffffffffffffff0
03371 e86a911318                     call       0x7f6aafd1e560
03376 f4                             hlt        
03377 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
03381 4883e4f0                       and        rsp, 0xfffffffffffffff0
03385 e856911318                     call       0x7f6aafd1e560
0338a f4                             hlt        
0338b 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
03395 4883e4f0                       and        rsp, 0xfffffffffffffff0
03399 e842911318                     call       0x7f6aafd1e560
0339e f4                             hlt        
0339f 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
033a9 4883e4f0                       and        rsp, 0xfffffffffffffff0
033ad e82e911318                     call       0x7f6aafd1e560
033b2 f4                             hlt        
033b3 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
033bd 4883e4f0                       and        rsp, 0xfffffffffffffff0
033c1 e81a911318                     call       0x7f6aafd1e560
033c6 f4                             hlt        
033c7 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
033d1 4883e4f0                       and        rsp, 0xfffffffffffffff0
033d5 e806911318                     call       0x7f6aafd1e560
033da f4                             hlt        
033db 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
033e5 4883e4f0                       and        rsp, 0xfffffffffffffff0
033e9 e8f2901318                     call       0x7f6aafd1e560
033ee f4                             hlt        
033ef 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
033f9 4883e4f0                       and        rsp, 0xfffffffffffffff0
033fd e8de901318                     call       0x7f6aafd1e560
03402 f4                             hlt        
03403 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
0340d 4883e4f0                       and        rsp, 0xfffffffffffffff0
03411 e8ca901318                     call       0x7f6aafd1e560
03416 f4                             hlt        
03417 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
03421 4883e4f0                       and        rsp, 0xfffffffffffffff0
03425 e8b6901318                     call       0x7f6aafd1e560
0342a f4                             hlt        
0342b 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
03435 4883e4f0                       and        rsp, 0xfffffffffffffff0
03439 e8a2901318                     call       0x7f6aafd1e560
0343e f4                             hlt        
0343f 48bf004214706a7f0000           movabs     rdi, 0x7f6a70144200
03449 4883e4f0                       and        rsp, 0xfffffffffffffff0
0344d e88e901318                     call       0x7f6aafd1e560
03452 f4                             hlt        
03453 bef6ffffff                     mov        esi, 0xfffffff6
03458 498bee                         mov        rbp, r14
0345b 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
03463 90                             nop        
03464 c5f877                         vzeroupper 
03467 e87485aeff                     call       0x7f6a976cda60
0346c 0f1f84006435002f               nop        dword ptr [rax + rax + 0x2f003564]
03474 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
0347e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03482 e859901318                     call       0x7f6aafd1e560
03487 f4                             hlt        
03488 488bf0                         mov        rsi, rax
0348b eb0d                           jmp        0x7f6a97be551a
0348d 488bf0                         mov        rsi, rax
03490 eb08                           jmp        0x7f6a97be551a
03492 488bf0                         mov        rsi, rax
03495 eb03                           jmp        0x7f6a97be551a
03497 488bf0                         mov        rsi, rax
0349a c5f877                         vzeroupper 
0349d 4881c4d0000000                 add        rsp, 0xd0
034a4 5d                             pop        rbp
034a5 e9b60eaeff                     jmp        0x7f6a976c63e0
034aa bef6ffffff                     mov        esi, 0xfffffff6
034af 90                             nop        
034b0 c5f877                         vzeroupper 
034b3 e82885aeff                     call       0x7f6a976cda60
034b8 0f1f8400b0350030               nop        dword ptr [rax + rax + 0x300035b0]
034c0 48bf20e497706a7f0000           movabs     rdi, 0x7f6a7097e420
034ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
034ce e80d901318                     call       0x7f6aafd1e560
034d3 f4                             hlt        
034d4 49baca2fbe976a7f0000           movabs     r10, 0x7f6a97be2fca
034de 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
034e5 e9f6cdb4ff                     jmp        0x7f6a97732360
034ea e8719cb3ff                     call       0x7f6a9771f1e0
034ef e94acbffff                     jmp        0x7f6a97be20be
034f4 f4                             hlt        
034f5 f4                             hlt        
034f6 f4                             hlt        
034f7 f4                             hlt        
