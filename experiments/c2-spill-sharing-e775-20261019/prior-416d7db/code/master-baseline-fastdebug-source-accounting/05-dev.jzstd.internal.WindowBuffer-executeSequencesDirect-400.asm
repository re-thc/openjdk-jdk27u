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
0001a 0f85c0b6b5ff                   jne        0x7f6a9772ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ecc0000000                 sub        rsp, 0xc0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85b02a0000                   jne        0x7f6a97bd616e
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
00068 0f8f2e220000                   jg         0x7f6a97bd591c
0006e 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00072 4c89442420                     mov        qword ptr [rsp + 0x20], r8
00077 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
0007b 48638c24d0000000               movsxd     rcx, dword ptr [rsp + 0xd0]
00083 4d63ca                         movsxd     r9, r10d
00086 4c034c2420                     add        r9, qword ptr [rsp + 0x20]
0008b 4d2bc1                         sub        r8, r9
0008e 493bc8                         cmp        rcx, r8
00091 0f8f05220000                   jg         0x7f6a97bd591c
00097 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
0009b 4c89442458                     mov        qword ptr [rsp + 0x58], r8
000a0 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000a4 4d85c0                         test       r8, r8
000a7 0f840d140000                   je         0x7f6a97bd4b3a
000ad 33db                           xor        ebx, ebx
000af 4c8bf2                         mov        r14, rdx
000b2 8b7204                         mov        esi, dword ptr [rdx + 4]
000b5 4c8b4c2460                     mov        r9, qword ptr [rsp + 0x60]
000ba 418b4940                       mov        ecx, dword ptr [r9 + 0x40]
000be 448bef                         mov        r13d, edi
000c1 85ff                           test       edi, edi
000c3 0f8ed71b0000                   jle        0x7f6a97bd5320
000c9 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
000d1 4c2b442420                     sub        r8, qword ptr [rsp + 0x20]
000d6 448d4ee0                       lea        r9d, [rsi - 0x20]
000da 8b7c2468                       mov        edi, dword ptr [rsp + 0x68]
000de 83c7e0                         add        edi, -0x20
000e1 458b5304                       mov        r10d, dword ptr [r11 + 4]
000e5 4585d2                         test       r10d, r10d
000e8 0f86da210000                   jbe        0x7f6a97bd5948
000ee 4d63d2                         movsxd     r10, r10d
000f1 4963d5                         movsxd     rdx, r13d
000f4 48ffca                         dec        rdx
000f7 493bd2                         cmp        rdx, r10
000fa 0f83c8210000                   jae        0x7f6a97bd5948
00100 85db                           test       ebx, ebx
00102 0f84c0210000                   je         0x7f6a97bd5948
00108 488bac24d8000000               mov        rbp, qword ptr [rsp + 0xd8]
00110 8b4504                         mov        eax, dword ptr [rbp + 4]
00113 85c0                           test       eax, eax
00115 0f860d220000                   jbe        0x7f6a97bd59a8
0011b 83f801                         cmp        eax, 1
0011e 0f8604220000                   jbe        0x7f6a97bd59a8
00124 83f802                         cmp        eax, 2
00127 0f86fb210000                   jbe        0x7f6a97bd59a8
0012d 448d56f1                       lea        r10d, [rsi - 0xf]
00131 4585d2                         test       r10d, r10d
00134 0f8cee210000                   jl         0x7f6a97bd59a8
0013a 8b5104                         mov        edx, dword ptr [rcx + 4]
0013d 448d52f1                       lea        r10d, [rdx - 0xf]
00141 4585d2                         test       r10d, r10d
00144 0f8cde210000                   jl         0x7f6a97bd59a8
0014a 448d52f9                       lea        r10d, [rdx - 7]
0014e 4585d2                         test       r10d, r10d
00151 0f8cd1210000                   jl         0x7f6a97bd59a8
00157 899424d8000000                 mov        dword ptr [rsp + 0xd8], edx
0015e 898424d4000000                 mov        dword ptr [rsp + 0xd4], eax
00165 897c243c                       mov        dword ptr [rsp + 0x3c], edi
00169 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0016e 89b424d0000000                 mov        dword ptr [rsp + 0xd0], esi
00175 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
00179 4c89442470                     mov        qword ptr [rsp + 0x70], r8
0017e 48896c2430                     mov        qword ptr [rsp + 0x30], rbp
00183 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
00188 44896c2408                     mov        dword ptr [rsp + 8], r13d
0018d 4c89742440                     mov        qword ptr [rsp + 0x40], r14
00192 4c8bd1                         mov        r10, rcx
00195 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0019a 894c2448                       mov        dword ptr [rsp + 0x48], ecx
0019e 448bd2                         mov        r10d, edx
001a1 448bc6                         mov        r8d, esi
001a4 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
001ac 458d5af9                       lea        r11d, [r10 - 7]
001b0 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
001b5 4183c0f1                       add        r8d, -0xf
001b9 4489442478                     mov        dword ptr [rsp + 0x78], r8d
001be 4d63da                         movsxd     r11, r10d
001c1 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
001c6 4183c2f1                       add        r10d, -0xf
001ca 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
001cf 4d8d53f9                       lea        r10, [r11 - 7]
001d3 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
001db 4533ed                         xor        r13d, r13d
001de 4533c0                         xor        r8d, r8d
001e1 e971040000                     jmp        0x7f6a97bd3cd7
001e6 448bdd                         mov        r11d, ebp
001e9 4d63d3                         movsxd     r10, r11d
001ec 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
001f3 c442a8f5db                     bzhi       r11, r11, r10
001f8 c4c1fb92fb                     kmovq      k7, r11
001fd 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00203 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00209 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00211 4403d5                         add        r10d, ebp
00214 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
0021c 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00220 418502                         test       dword ptr [r10], eax
00223 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
0022b 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
00233 0f8ddb090000                   jge        0x7f6a97bd4294
00239 899c24a4000000                 mov        dword ptr [rsp + 0xa4], ebx
00240 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
00248 442b94248c000000               sub        r10d, dword ptr [rsp + 0x8c]
00250 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00258 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
0025f 2bac248c000000                 sub        ebp, dword ptr [rsp + 0x8c]
00266 3bac248c000000                 cmp        ebp, dword ptr [rsp + 0x8c]
0026d 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00275 410f4feb                       cmovg      ebp, r11d
00279 4585d2                         test       r10d, r10d
0027c 0f8c92190000                   jl         0x7f6a97bd5294
00282 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
0028a 4585d2                         test       r10d, r10d
0028d 0f8c81190000                   jl         0x7f6a97bd5294
00293 448bd5                         mov        r10d, ebp
00296 4403942490000000               add        r10d, dword ptr [rsp + 0x90]
0029e 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
002a6 453bda                         cmp        r11d, r10d
002a9 0f8265190000                   jb         0x7f6a97bd5294
002af 8b9c24a4000000                 mov        ebx, dword ptr [rsp + 0xa4]
002b6 03dd                           add        ebx, ebp
002b8 443bdb                         cmp        r11d, ebx
002bb 0f8253190000                   jb         0x7f6a97bd5294
002c1 85ed                           test       ebp, ebp
002c3 0f8c4b190000                   jl         0x7f6a97bd5294
002c9 85ed                           test       ebp, ebp
002cb 0f8438ffffff                   je         0x7f6a97bd3889
002d1 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
002d6 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
002de 4b8d741008                     lea        rsi, [r8 + r10 + 8]
002e3 458bd8                         mov        r11d, r8d
002e6 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
002ee 4b8d7c0308                     lea        rdi, [r11 + r8 + 8]
002f3 4863d5                         movsxd     rdx, ebp
002f6 4883fa20                       cmp        rdx, 0x20
002fa 0f86e6feffff                   jbe        0x7f6a97bd3866
00300 c5f877                         vzeroupper 
00303 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
0030d 41ffd2                         call       r10
00310 0f1f840000000000               nop        dword ptr [rax + rax]
00318 e9ecfeffff                     jmp        0x7f6a97bd3889
0031d 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00325 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0032a c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
00331 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00339 4503d8                         add        r11d, r8d
0033c e9f0020000                     jmp        0x7f6a97bd3cb1
00341 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00346 4b8d7c1008                     lea        rdi, [r8 + r10 + 8]
0034b 458bd8                         mov        r11d, r8d
0034e 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00356 4b8d740308                     lea        rsi, [r11 + r8 + 8]
0035b 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00363 44039c249c000000               add        r11d, dword ptr [rsp + 0x9c]
0036b 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00373 4d63f3                         movsxd     r14, r11d
00376 448b84248c000000               mov        r8d, dword ptr [rsp + 0x8c]
0037e 443b842488000000               cmp        r8d, dword ptr [rsp + 0x88]
00386 0f8c04060000                   jl         0x7f6a97bd4010
0038c 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00394 4183fb30                       cmp        r11d, 0x30
00398 0f8e9b000000                   jle        0x7f6a97bd3ab9
0039e 4585d2                         test       r10d, r10d
003a1 0f8cd5170000                   jl         0x7f6a97bd51fc
003a7 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
003af 4585c0                         test       r8d, r8d
003b2 0f8cc4170000                   jl         0x7f6a97bd51fc
003b8 4503da                         add        r11d, r10d
003bb 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
003c3 453bcb                         cmp        r9d, r11d
003c6 0f82b0170000                   jb         0x7f6a97bd51fc
003cc 443b8c24a0000000               cmp        r9d, dword ptr [rsp + 0xa0]
003d4 0f82a2170000                   jb         0x7f6a97bd51fc
003da 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
003e2 4585d2                         test       r10d, r10d
003e5 0f8436020000                   je         0x7f6a97bd3ca1
003eb 4963d2                         movsxd     rdx, r10d
003ee 4883fa20                       cmp        rdx, 0x20
003f2 7728                           ja         0x7f6a97bd3a9c
003f4 458bda                         mov        r11d, r10d
003f7 4d63d3                         movsxd     r10, r11d
003fa 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00401 c442a8f5db                     bzhi       r11, r11, r10
00406 c4c1fb92fb                     kmovq      k7, r11
0040b 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00411 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00417 e905020000                     jmp        0x7f6a97bd3ca1
0041c c5f877                         vzeroupper 
0041f 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00429 41ffd2                         call       r10
0042c 0f1f840000000000               nop        dword ptr [rax + rax]
00434 e9e8010000                     jmp        0x7f6a97bd3ca1
00439 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
0043e 0f836c140000                   jae        0x7f6a97bd4f30
00444 4963da                         movsxd     rbx, r10d
00447 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0044c 4d8b4c1b08                     mov        r9, qword ptr [r11 + rbx + 8]
00451 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00459 443b44244c                     cmp        r8d, dword ptr [rsp + 0x4c]
0045e 0f83d8140000                   jae        0x7f6a97bd4fbc
00464 458d5808                       lea        r11d, [r8 + 8]
00468 4963f8                         movsxd     rdi, r8d
0046b 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
0046f 4c894c3908                     mov        qword ptr [rcx + rdi + 8], r9
00474 443b9c24a0000000               cmp        r11d, dword ptr [rsp + 0xa0]
0047c 0f8d9f010000                   jge        0x7f6a97bd3ca1
00482 482bdf                         sub        rbx, rdi
00485 4963cb                         movsxd     rcx, r11d
00488 4c8d0c19                       lea        r9, [rcx + rbx]
0048c 4c3b8c2480000000               cmp        r9, qword ptr [rsp + 0x80]
00494 0f8332150000                   jae        0x7f6a97bd504c
0049a 4d8bce                         mov        r9, r14
0049d 4c2bc9                         sub        r9, rcx
004a0 4983c107                       add        r9, 7
004a4 4983e1f8                       and        r9, 0xfffffffffffffff8
004a8 418bc9                         mov        ecx, r9d
004ab 468d4c0108                     lea        r9d, [rcx + r8 + 8]
004b0 4d63c9                         movsxd     r9, r9d
004b3 498d4c19f8                     lea        rcx, [r9 + rbx - 8]
004b8 483b8c2480000000               cmp        rcx, qword ptr [rsp + 0x80]
004c0 0f8306150000                   jae        0x7f6a97bd504c
004c6 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
004cb 0f83fb140000                   jae        0x7f6a97bd504c
004d1 4983c1f8                       add        r9, -8
004d5 4c3b8c2480000000               cmp        r9, qword ptr [rsp + 0x80]
004dd 0f83e9140000                   jae        0x7f6a97bd504c
004e3 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
004eb 4181f9f8ffff7f                 cmp        r9d, 0x7ffffff8
004f2 0f8f70150000                   jg         0x7f6a97bd50e8
004f8 452bd0                         sub        r10d, r8d
004fb 4183c010                       add        r8d, 0x10
004ff 478d0c1a                       lea        r9d, [r10 + r11]
00503 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00507 4a8b4c0908                     mov        rcx, qword ptr [rcx + r9 + 8]
0050c 418bfb                         mov        edi, r11d
0050f 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00514 49894c3908                     mov        qword ptr [r9 + rdi + 8], rcx
00519 458d4b08                       lea        r9d, [r11 + 8]
0051d 453bc8                         cmp        r9d, r8d
00520 7d05                           jge        0x7f6a97bd3ba7
00522 458bd9                         mov        r11d, r9d
00525 ebd8                           jmp        0x7f6a97bd3b7f
00527 4983c6f8                       add        r14, -8
0052b 4981fe00000080                 cmp        r14, -0x80000000
00532 49c7c000000080                 mov        r8, 0xffffffff80000000
00539 4d0f4cf0                       cmovl      r14, r8
0053d 418bfe                         mov        edi, r14d
00540 443bcf                         cmp        r9d, edi
00543 0f8d85000000                   jge        0x7f6a97bd3c4e
00549 4d63c1                         movsxd     r8, r9d
0054c 4c03c3                         add        r8, rbx
0054f 4c3b842480000000               cmp        r8, qword ptr [rsp + 0x80]
00557 0f83a7150000                   jae        0x7f6a97bd5184
0055d 4183c310                       add        r11d, 0x10
00561 4d63c3                         movsxd     r8, r11d
00564 4c03c3                         add        r8, rbx
00567 4c3b842480000000               cmp        r8, qword ptr [rsp + 0x80]
0056f 0f83a3150000                   jae        0x7f6a97bd5198
00575 443b4c244c                     cmp        r9d, dword ptr [rsp + 0x4c]
0057a 0f83ac150000                   jae        0x7f6a97bd51ac
00580 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
00585 0f83b5150000                   jae        0x7f6a97bd51c0
0058b 90                             nop        
0058c 90                             nop        
0058d 90                             nop        
0058e 90                             nop        
0058f 90                             nop        
00590 478d040a                       lea        r8d, [r10 + r9]
00594 418bc9                         mov        ecx, r9d
00597 4863d1                         movsxd     rdx, ecx
0059a 458bd8                         mov        r11d, r8d
0059d 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
005a1 4e8b5c1908                     mov        r11, qword ptr [rcx + r11 + 8]
005a6 4963f0                         movsxd     rsi, r8d
005a9 418bc9                         mov        ecx, r9d
005ac 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
005b1 4d895c0808                     mov        qword ptr [r8 + rcx + 8], r11
005b6 4d8b443010                     mov        r8, qword ptr [r8 + rsi + 0x10]
005bb 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
005c0 4d89441310                     mov        qword ptr [r11 + rdx + 0x10], r8
005c5 4183c110                       add        r9d, 0x10
005c9 443bcf                         cmp        r9d, edi
005cc 7cc2                           jl         0x7f6a97bd3c10
005ce 443b8c24a0000000               cmp        r9d, dword ptr [rsp + 0xa0]
005d6 7d49                           jge        0x7f6a97bd3ca1
005d8 4d63d9                         movsxd     r11, r9d
005db 4c03db                         add        r11, rbx
005de 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
005e6 0f8368150000                   jae        0x7f6a97bd51d4
005ec 443b4c244c                     cmp        r9d, dword ptr [rsp + 0x4c]
005f1 0f8371150000                   jae        0x7f6a97bd51e8
005f7 90                             nop        
005f8 438d0c0a                       lea        ecx, [r10 + r9]
005fc 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00601 498b4c0b08                     mov        rcx, qword ptr [r11 + rcx + 8]
00606 458bd9                         mov        r11d, r9d
00609 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0060e 4b894c1808                     mov        qword ptr [r8 + r11 + 8], rcx
00613 4183c108                       add        r9d, 8
00617 443b8c24a0000000               cmp        r9d, dword ptr [rsp + 0xa0]
0061f 7cd7                           jl         0x7f6a97bd3c78
00621 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00629 44039c2488000000               add        r11d, dword ptr [rsp + 0x88]
00631 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
00639 41ffc0                         inc        r8d
0063c 443b442408                     cmp        r8d, dword ptr [rsp + 8]
00641 0f8dff050000                   jge        0x7f6a97bd42c6
00647 448bac2498000000               mov        r13d, dword ptr [rsp + 0x98]
0064f 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00657 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0065c 4f8b5cc208                     mov        r11, qword ptr [r10 + r8*8 + 8]
00661 458bd3                         mov        r10d, r11d
00664 4181e2ffff0100                 and        r10d, 0x1ffff
0066b 458bf2                         mov        r14d, r10d
0066e 4d8bd3                         mov        r10, r11
00671 49c1ea12                       shr        r10, 0x12
00675 49c1fb24                       sar        r11, 0x24
00679 458bd2                         mov        r10d, r10d
0067c 458bdb                         mov        r11d, r11d
0067f 418bdb                         mov        ebx, r11d
00682 4181e2ffff0300                 and        r10d, 0x3ffff
00689 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
00691 4585db                         test       r11d, r11d
00694 0f8c0a100000                   jl         0x7f6a97bd4d24
0069a 458bd6                         mov        r10d, r14d
0069d 4585d2                         test       r10d, r10d
006a0 0f85ee010000                   jne        0x7f6a97bd3f14
006a6 4533d2                         xor        r10d, r10d
006a9 458bf2                         mov        r14d, r10d
006ac 83fb03                         cmp        ebx, 3
006af 0f8e23020000                   jle        0x7f6a97bd3f58
006b5 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
006ba 458b5a0c                       mov        r11d, dword ptr [r10 + 0xc]
006be 45895a10                       mov        dword ptr [r10 + 0x10], r11d
006c2 458b5208                       mov        r10d, dword ptr [r10 + 8]
006c6 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
006cb 4589530c                       mov        dword ptr [r11 + 0xc], r10d
006cf 448d53fd                       lea        r10d, [rbx - 3]
006d3 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
006db 4d8bd3                         mov        r10, r11
006de 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
006e6 45895a08                       mov        dword ptr [r10 + 8], r11d
006ea 44898424a8000000               mov        dword ptr [rsp + 0xa8], r8d
006f2 48639c248c000000               movsxd     rbx, dword ptr [rsp + 0x8c]
006fa 48899c2490000000               mov        qword ptr [rsp + 0x90], rbx
00702 4c6384249c000000               movsxd     r8, dword ptr [rsp + 0x9c]
0070a 4c03442420                     add        r8, qword ptr [rsp + 0x20]
0070f 4963d6                         movsxd     rdx, r14d
00712 4c03c2                         add        r8, rdx
00715 493bd8                         cmp        rbx, r8
00718 0f8f02100000                   jg         0x7f6a97bd4da0
0071e 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00726 4585d2                         test       r10d, r10d
00729 0f8e410f0000                   jle        0x7f6a97bd4cf0
0072f 8b9c249c000000                 mov        ebx, dword ptr [rsp + 0x9c]
00736 4103de                         add        ebx, r14d
00739 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00741 4403db                         add        r11d, ebx
00744 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
00749 0f8f61100000                   jg         0x7f6a97bd4e30
0074f 478d1c2e                       lea        r11d, [r14 + r13]
00753 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
0075b 443b5c2438                     cmp        r11d, dword ptr [rsp + 0x38]
00760 0f8fd6100000                   jg         0x7f6a97bd4ebc
00766 4183fe10                       cmp        r14d, 0x10
0076a 0f8f85050000                   jg         0x7f6a97bd4375
00770 443b6c2478                     cmp        r13d, dword ptr [rsp + 0x78]
00775 0f835e0d0000                   jae        0x7f6a97bd4b59
0077b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00780 c4817a6f442a08                 vmovdqu    xmm0, xmmword ptr [r10 + r13 + 8]
00787 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0078f 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
00794 0f83c60d0000                   jae        0x7f6a97bd4be0
0079a 478d1c2e                       lea        r11d, [r14 + r13]
0079e 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
007a6 448b6c2448                     mov        r13d, dword ptr [rsp + 0x48]
007ab c4817a7f441508                 vmovdqu    xmmword ptr [r13 + r10 + 8], xmm0
007b2 478d2c16                       lea        r13d, [r14 + r10]
007b6 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
007be 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
007c6 442b94248c000000               sub        r10d, dword ptr [rsp + 0x8c]
007ce 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
007d6 4183f810                       cmp        r8d, 0x10
007da 0f8f61fbffff                   jg         0x7f6a97bd39c1
007e0 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
007e8 4183fb10                       cmp        r11d, 0x10
007ec 0f8c4ffbffff                   jl         0x7f6a97bd39c1
007f2 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
007f7 0f83fb0d0000                   jae        0x7f6a97bd4c78
007fd 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00802 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
00809 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00811 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
00816 0f8201fbffff                   jb         0x7f6a97bd399d
0081c bee4ffffff                     mov        esi, 0xffffffe4
00821 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
00826 448b1424                       mov        r10d, dword ptr [rsp]
0082a 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
00832 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00837 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0083f 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00844 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0084c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00851 4c891424                       mov        qword ptr [rsp], r10
00855 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0085a 4489542408                     mov        dword ptr [rsp + 8], r10d
0085f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00864 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00869 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
0086f 90                             nop        
00870 c5f877                         vzeroupper 
00873 e8689bafff                     call       0x7f6a976cda60
00878 0f1f840070090001               nop        dword ptr [rax + rax + 0x1000970]
00880 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
0088a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0088e e84da61418                     call       0x7f6aafd1e560
00893 f4                             hlt        
00894 448b1424                       mov        r10d, dword ptr [rsp]
00898 452bd5                         sub        r10d, r13d
0089b 453bf2                         cmp        r14d, r10d
0089e 0f8e08feffff                   jle        0x7f6a97bd3d2c
008a4 be45ffffff                     mov        esi, 0xffffff45
008a9 418bee                         mov        ebp, r14d
008ac 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
008b4 c5f877                         vzeroupper 
008b7 e8249bafff                     call       0x7f6a976cda60
008bc 0f1f8400b4090002               nop        dword ptr [rax + rax + 0x20009b4]
008c4 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
008ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
008d2 e809a61418                     call       0x7f6aafd1e560
008d7 f4                             hlt        
008d8 4585f6                         test       r14d, r14d
008db 7407                           je         0x7f6a97bd3f64
008dd 448d53ff                       lea        r10d, [rbx - 1]
008e1 418bda                         mov        ebx, r10d
008e4 85db                           test       ebx, ebx
008e6 0f8487000000                   je         0x7f6a97bd3ff3
008ec 83fb03                         cmp        ebx, 3
008ef 0f84df140000                   je         0x7f6a97bd5454
008f5 83fb02                         cmp        ebx, 2
008f8 0f875e150000                   ja         0x7f6a97bd54dc
008fe 3b9c24d4000000                 cmp        ebx, dword ptr [rsp + 0xd4]
00905 0f83ae130000                   jae        0x7f6a97bd5339
0090b 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00910 418b4c9b08                     mov        ecx, dword ptr [r11 + rbx*4 + 8]
00915 85db                           test       ebx, ebx
00917 7e47                           jle        0x7f6a97bd3fe0
00919 448d53ff                       lea        r10d, [rbx - 1]
0091d 443b9424d4000000               cmp        r10d, dword ptr [rsp + 0xd4]
00925 0f831d140000                   jae        0x7f6a97bd53c8
0092b 44898424a8000000               mov        dword ptr [rsp + 0xa8], r8d
00933 90                             nop        
00934 90                             nop        
00935 90                             nop        
00936 90                             nop        
00937 90                             nop        
00938 90                             nop        
00939 90                             nop        
0093a 90                             nop        
0093b 90                             nop        
0093c 90                             nop        
0093d 90                             nop        
0093e 90                             nop        
0093f 90                             nop        
00940 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00945 458b549b04                     mov        r10d, dword ptr [r11 + rbx*4 + 4]
0094a 4d8bc3                         mov        r8, r11
0094d 4589549808                     mov        dword ptr [r8 + rbx*4 + 8], r10d
00952 448d53ff                       lea        r10d, [rbx - 1]
00956 418bda                         mov        ebx, r10d
00959 4585d2                         test       r10d, r10d
0095c 7fe2                           jg         0x7f6a97bd3fc0
0095e eb08                           jmp        0x7f6a97bd3fe8
00960 44898424a8000000               mov        dword ptr [rsp + 0xa8], r8d
00968 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0096d 41894a08                       mov        dword ptr [r10 + 8], ecx
00971 eb11                           jmp        0x7f6a97bd4004
00973 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00978 418b4a08                       mov        ecx, dword ptr [r10 + 8]
0097c 44898424a8000000               mov        dword ptr [rsp + 0xa8], r8d
00984 898c248c000000                 mov        dword ptr [rsp + 0x8c], ecx
0098b e962fdffff                     jmp        0x7f6a97bd3d72
00990 4183f810                       cmp        r8d, 0x10
00994 0f8d96180000                   jge        0x7f6a97bd58b0
0099a 4183f808                       cmp        r8d, 8
0099e 0f8dde040000                   jge        0x7f6a97bd4502
009a4 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
009ac 4183fb10                       cmp        r11d, 0x10
009b0 0f8ecb000000                   jle        0x7f6a97bd4101
009b6 4585d2                         test       r10d, r10d
009b9 0f8ce5170000                   jl         0x7f6a97bd5824
009bf 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
009c7 4585c0                         test       r8d, r8d
009ca 0f8cd4170000                   jl         0x7f6a97bd5824
009d0 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
009d8 443b84249c000000               cmp        r8d, dword ptr [rsp + 0x9c]
009e0 0f82be170000                   jb         0x7f6a97bd5824
009e6 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
009ee 44039c249c000000               add        r11d, dword ptr [rsp + 0x9c]
009f6 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
009fe 443b8424a4000000               cmp        r8d, dword ptr [rsp + 0xa4]
00a06 0f8298170000                   jb         0x7f6a97bd5824
00a0c 448b84248c000000               mov        r8d, dword ptr [rsp + 0x8c]
00a14 4585c0                         test       r8d, r8d
00a17 0f8c87170000                   jl         0x7f6a97bd5824
00a1d 4585c0                         test       r8d, r8d
00a20 0f841af8ffff                   je         0x7f6a97bd38c0
00a26 488b9c2490000000               mov        rbx, qword ptr [rsp + 0x90]
00a2e 4883fb20                       cmp        rbx, 0x20
00a32 772d                           ja         0x7f6a97bd40e1
00a34 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00a3c 4d63d2                         movsxd     r10, r10d
00a3f 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00a46 c442a8f5db                     bzhi       r11, r11, r10
00a4b c4c1fb92fb                     kmovq      k7, r11
00a50 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00a56 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00a5c e9dff7ffff                     jmp        0x7f6a97bd38c0
00a61 488bd3                         mov        rdx, rbx
00a64 c5f877                         vzeroupper 
00a67 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00a71 41ffd2                         call       r10
00a74 0f1f840000000000               nop        dword ptr [rax + rax]
00a7c e9bff7ffff                     jmp        0x7f6a97bd38c0
00a81 443b9424d8000000               cmp        r10d, dword ptr [rsp + 0xd8]
00a89 0f8355140000                   jae        0x7f6a97bd5564
00a8f 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00a94 430fbe6c1008                   movsx      ebp, byte ptr [r8 + r10 + 8]
00a9a 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00aa2 443b8424d8000000               cmp        r8d, dword ptr [rsp + 0xd8]
00aaa 0f83c0140000                   jae        0x7f6a97bd55f0
00ab0 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00ab5 43886c0108                     mov        byte ptr [r9 + r8 + 8], bpl
00aba 458d4203                       lea        r8d, [r10 + 3]
00abe 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00ac6 41ffc3                         inc        r11d
00ac9 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00ad1 443b8424d8000000               cmp        r8d, dword ptr [rsp + 0xd8]
00ad9 0f8321150000                   jae        0x7f6a97bd5680
00adf 4d63ca                         movsxd     r9, r10d
00ae2 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00ae7 430fbe6c0809                   movsx      ebp, byte ptr [r8 + r9 + 9]
00aed 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00af5 4183c303                       add        r11d, 3
00af9 443b9c24d8000000               cmp        r11d, dword ptr [rsp + 0xd8]
00b01 0f838d150000                   jae        0x7f6a97bd5714
00b07 48638c249c000000               movsxd     rcx, dword ptr [rsp + 0x9c]
00b0f 41886c0809                     mov        byte ptr [r8 + rcx + 9], bpl
00b14 470fbe44080a                   movsx      r8d, byte ptr [r8 + r9 + 0xa]
00b1a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00b1f 4588440b0a                     mov        byte ptr [r11 + rcx + 0xa], r8b
00b24 470fbe440b0b                   movsx      r8d, byte ptr [r11 + r9 + 0xb]
00b2a 4588440b0b                     mov        byte ptr [r11 + rcx + 0xb], r8b
00b2f 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00b37 4183fb08                       cmp        r11d, 8
00b3b 0f83e3150000                   jae        0x7f6a97bd57a4
00b41 458bc2                         mov        r8d, r10d
00b44 49bb20ae28e300000000           movabs     r11, 0xe328ae20
00b4e 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00b56 4703449308                     add        r8d, dword ptr [r11 + r10*4 + 8]
00b5b 4489442404                     mov        dword ptr [rsp + 4], r8d
00b60 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00b68 4183fa04                       cmp        r10d, 4
00b6c 7e3e                           jle        0x7f6a97bd422c
00b6e 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00b75 83c504                         add        ebp, 4
00b78 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00b7d 418bd0                         mov        edx, r8d
00b80 c5f877                         vzeroupper 
00b83 e858bab5ff                     call       0x7f6a9772fc60
00b88 0f1f8400800c0003               nop        dword ptr [rax + rax + 0x3000c80]
00b90 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00b95 8bd5                           mov        edx, ebp
00b97 8bc8                           mov        ecx, eax
00b99 90                             nop        
00b9a 90                             nop        
00b9b 90                             nop        
00b9c c5f877                         vzeroupper 
00b9f e83cbab5ff                     call       0x7f6a9772fc60
00ba4 0f1f84009c0c0004               nop        dword ptr [rax + rax + 0x4000c9c]
00bac 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00bb4 4183fa08                       cmp        r10d, 8
00bb8 7e5a                           jle        0x7f6a97bd4294
00bba 8b542404                       mov        edx, dword ptr [rsp + 4]
00bbe 49ba48ae28e300000000           movabs     r10, 0xe328ae48
00bc8 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00bd0 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
00bd5 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00bdc 83c508                         add        ebp, 8
00bdf 83c208                         add        edx, 8
00be2 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00be7 90                             nop        
00be8 c5f877                         vzeroupper 
00beb e8f0b9b5ff                     call       0x7f6a9772fc60
00bf0 0f1f8400e80c0005               nop        dword ptr [rax + rax + 0x5000ce8]
00bf8 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00bfd 8bd5                           mov        edx, ebp
00bff 488bc8                         mov        rcx, rax
00c02 90                             nop        
00c03 90                             nop        
00c04 c5f877                         vzeroupper 
00c07 e8d4b9b5ff                     call       0x7f6a9772fc60
00c0c 0f1f8400040d0006               nop        dword ptr [rax + rax + 0x6000d04]
00c14 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00c1c e910faffff                     jmp        0x7f6a97bd3cb1
00c21 4d63d2                         movsxd     r10, r10d
00c24 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c2b c442a8f5db                     bzhi       r11, r11, r10
00c30 c4c1fb92fb                     kmovq      k7, r11
00c35 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c3b 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c41 e990000000                     jmp        0x7f6a97bd4356
00c46 448b1424                       mov        r10d, dword ptr [rsp]
00c4a 442b942498000000               sub        r10d, dword ptr [rsp + 0x98]
00c52 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00c5a 4585c0                         test       r8d, r8d
00c5d 0f8c29170000                   jl         0x7f6a97bd5a0c
00c63 4c8b742440                     mov        r14, qword ptr [rsp + 0x40]
00c68 8bb424d0000000                 mov        esi, dword ptr [rsp + 0xd0]
00c6f 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00c73 4585db                         test       r11d, r11d
00c76 0f8c19170000                   jl         0x7f6a97bd5a15
00c7c 3b3424                         cmp        esi, dword ptr [rsp]
00c7f 0f8210170000                   jb         0x7f6a97bd5a15
00c85 448b4904                       mov        r9d, dword ptr [rcx + 4]
00c89 438d1c13                       lea        ebx, [r11 + r10]
00c8d 443bcb                         cmp        r9d, ebx
00c90 0f82ff160000                   jb         0x7f6a97bd5a15
00c96 4585d2                         test       r10d, r10d
00c99 0f8cf6160000                   jl         0x7f6a97bd5a15
00c9f 4585d2                         test       r10d, r10d
00ca2 7432                           je         0x7f6a97bd4356
00ca4 4b8d7c0608                     lea        rdi, [r14 + r8 + 8]
00ca9 4c8bc1                         mov        r8, rcx
00cac 4a8d741908                     lea        rsi, [rcx + r11 + 8]
00cb1 4963d2                         movsxd     rdx, r10d
00cb4 4883fa20                       cmp        rdx, 0x20
00cb8 0f8663ffffff                   jbe        0x7f6a97bd42a1
00cbe c5f877                         vzeroupper 
00cc1 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00ccb 41ffd2                         call       r10
00cce 0f1f840000000000               nop        dword ptr [rax + rax]
00cd6 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00cdb 41895a38                       mov        dword ptr [r10 + 0x38], ebx
00cdf c5f877                         vzeroupper 
00ce2 4881c4c0000000                 add        rsp, 0xc0
00ce9 5d                             pop        rbp
00cea 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00cee 0f87e41d0000                   ja         0x7f6a97bd6158
00cf4 c3                             ret        
00cf5 4183fe30                       cmp        r14d, 0x30
00cf9 0f8ea9000000                   jle        0x7f6a97bd4428
00cff 4585ed                         test       r13d, r13d
00d02 0f8cdc1a0000                   jl         0x7f6a97bd5e64
00d08 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00d10 4585c0                         test       r8d, r8d
00d13 0f8cd31a0000                   jl         0x7f6a97bd5e6c
00d19 448b9c24d0000000               mov        r11d, dword ptr [rsp + 0xd0]
00d21 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00d29 0f82bd1a0000                   jb         0x7f6a97bd5e6c
00d2f 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
00d37 443bd3                         cmp        r10d, ebx
00d3a 0f82ac1a0000                   jb         0x7f6a97bd5e6c
00d40 4585f6                         test       r14d, r14d
00d43 743d                           je         0x7f6a97bd4402
00d45 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00d4a 4b8d7c2a08                     lea        rdi, [r10 + r13 + 8]
00d4f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00d54 4b8d740308                     lea        rsi, [r11 + r8 + 8]
00d59 4883fa20                       cmp        rdx, 0x20
00d5d 772f                           ja         0x7f6a97bd440e
00d5f 458bd6                         mov        r10d, r14d
00d62 4d63d2                         movsxd     r10, r10d
00d65 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d6c c442a8f5db                     bzhi       r11, r11, r10
00d71 c4c1fb92fb                     kmovq      k7, r11
00d76 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d7c 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d82 899c249c000000                 mov        dword ptr [rsp + 0x9c], ebx
00d89 e930faffff                     jmp        0x7f6a97bd3e3e
00d8e c5f877                         vzeroupper 
00d91 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00d9b 41ffd2                         call       r10
00d9e 0f1f840000000000               nop        dword ptr [rax + rax]
00da6 ebda                           jmp        0x7f6a97bd4402
00da8 443b6c2478                     cmp        r13d, dword ptr [rsp + 0x78]
00dad 0f83f9180000                   jae        0x7f6a97bd5d2c
00db3 4d63dd                         movsxd     r11, r13d
00db6 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00dbb c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
00dc2 8b94249c000000                 mov        edx, dword ptr [rsp + 0x9c]
00dc9 3b54247c                       cmp        edx, dword ptr [rsp + 0x7c]
00dcd 0f8371190000                   jae        0x7f6a97bd5dc4
00dd3 448d4210                       lea        r8d, [rdx + 0x10]
00dd7 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
00ddf 4c63ca                         movsxd     r9, edx
00de2 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00de7 c4817a7f440a08                 vmovdqu    xmmword ptr [r10 + r9 + 8], xmm0
00dee 443bc3                         cmp        r8d, ebx
00df1 0f8dab060000                   jge        0x7f6a97bd4b22
00df7 4d2bd9                         sub        r11, r9
00dfa 4d63d0                         movsxd     r10, r8d
00dfd 4c638c24dc000000               movsxd     r9, dword ptr [rsp + 0xdc]
00e05 4983c1f1                       add        r9, -0xf
00e09 4f8d041a                       lea        r8, [r10 + r11]
00e0d 4d3bc1                         cmp        r8, r9
00e10 0f836a1a0000                   jae        0x7f6a97bd5f00
00e16 4863f3                         movsxd     rsi, ebx
00e19 4c8bc6                         mov        r8, rsi
00e1c 4d2bc2                         sub        r8, r10
00e1f 4983c00f                       add        r8, 0xf
00e23 4983e0f0                       and        r8, 0xfffffffffffffff0
00e27 458bc0                         mov        r8d, r8d
00e2a 458d541010                     lea        r10d, [r8 + rdx + 0x10]
00e2f 4d63d2                         movsxd     r10, r10d
00e32 4f8d441af0                     lea        r8, [r10 + r11 - 0x10]
00e37 4d3bc1                         cmp        r8, r9
00e3a 0f83401a0000                   jae        0x7f6a97bd5f00
00e40 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00e48 443b44247c                     cmp        r8d, dword ptr [rsp + 0x7c]
00e4d 0f832d1a0000                   jae        0x7f6a97bd5f00
00e53 4983c2f0                       add        r10, -0x10
00e57 4c8b442428                     mov        r8, qword ptr [rsp + 0x28]
00e5c 4983c0f1                       add        r8, -0xf
00e60 4d3bd0                         cmp        r10, r8
00e63 0f83171a0000                   jae        0x7f6a97bd5f00
00e69 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00e6f 0f8f931a0000                   jg         0x7f6a97bd5f88
00e75 418bfd                         mov        edi, r13d
00e78 2bfa                           sub        edi, edx
00e7a 83c220                         add        edx, 0x20
00e7d e9f5030000                     jmp        0x7f6a97bd48f7
00e82 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
00e87 0f8353150000                   jae        0x7f6a97bd5a60
00e8d 4963c2                         movsxd     rax, r10d
00e90 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00e95 4d8b5c0008                     mov        r11, qword ptr [r8 + rax + 8]
00e9a 4c899c2490000000               mov        qword ptr [rsp + 0x90], r11
00ea2 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00eaa 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
00eaf 0f83b7150000                   jae        0x7f6a97bd5aec
00eb5 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
00ebd 418d6908                       lea        ebp, [r9 + 8]
00ec1 4d63c1                         movsxd     r8, r9d
00ec4 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00ec9 488b8c2490000000               mov        rcx, qword ptr [rsp + 0x90]
00ed1 4b894c0308                     mov        qword ptr [r11 + r8 + 8], rcx
00ed6 3bac24a0000000                 cmp        ebp, dword ptr [rsp + 0xa0]
00edd 0f8d7f030000                   jge        0x7f6a97bd48e2
00ee3 492bc0                         sub        rax, r8
00ee6 4863cd                         movsxd     rcx, ebp
00ee9 4c8d1c01                       lea        r11, [rcx + rax]
00eed 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
00ef5 0f83f1150000                   jae        0x7f6a97bd5b6c
00efb 4d8bde                         mov        r11, r14
00efe 4c2bd9                         sub        r11, rcx
00f01 4983c307                       add        r11, 7
00f05 4983e3f8                       and        r11, 0xfffffffffffffff8
00f09 458bdb                         mov        r11d, r11d
00f0c 478d440b08                     lea        r8d, [r11 + r9 + 8]
00f11 4d63d8                         movsxd     r11, r8d
00f14 4d8d4403f8                     lea        r8, [r11 + rax - 8]
00f19 4c3b842480000000               cmp        r8, qword ptr [rsp + 0x80]
00f21 0f83c5150000                   jae        0x7f6a97bd5b6c
00f27 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00f2b 0f83bb150000                   jae        0x7f6a97bd5b6c
00f31 4983c3f8                       add        r11, -8
00f35 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
00f3d 0f83a9150000                   jae        0x7f6a97bd5b6c
00f43 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
00f48 498bdb                         mov        rbx, r11
00f4b 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00f50 458bd8                         mov        r11d, r8d
00f53 41b8f8ffffff                   mov        r8d, 0xfffffff8
00f59 452bc3                         sub        r8d, r11d
00f5c 452bc1                         sub        r8d, r9d
00f5f 4183c0f0                       add        r8d, -0x10
00f63 458d5910                       lea        r11d, [r9 + 0x10]
00f67 4d63db                         movsxd     r11, r11d
00f6a bf06000000                     mov        edi, 6
00f6f c442c0f5c0                     bzhi       r8, r8, rdi
00f74 4d03d8                         add        r11, r8
00f77 4d3bde                         cmp        r11, r14
00f7a 498bfe                         mov        rdi, r14
00f7d 490f4cfb                       cmovl      rdi, r11
00f81 4c8bdf                         mov        r11, rdi
00f84 4c2bd9                         sub        r11, rcx
00f87 4d8d43ff                       lea        r8, [r11 - 1]
00f8b 49c1f83f                       sar        r8, 0x3f
00f8f 49c1e83d                       shr        r8, 0x3d
00f93 4f8d5c18ff                     lea        r11, [r8 + r11 - 1]
00f98 4983e3f8                       and        r11, 0xfffffffffffffff8
00f9c 4c03d9                         add        r11, rcx
00f9f 493bcb                         cmp        rcx, r11
00fa2 490f4ccb                       cmovl      rcx, r11
00fa6 8bc9                           mov        ecx, ecx
00fa8 448d4108                       lea        r8d, [rcx + 8]
00fac 2b8c248c000000                 sub        ecx, dword ptr [rsp + 0x8c]
00fb3 4963d0                         movsxd     rdx, r8d
00fb6 4803d3                         add        rdx, rbx
00fb9 83c108                         add        ecx, 8
00fbc 4c63c1                         movsxd     r8, ecx
00fbf 4c03c3                         add        r8, rbx
00fc2 488d4a48                       lea        rcx, [rdx + 0x48]
00fc6 4883c208                       add        rdx, 8
00fca 498d5808                       lea        rbx, [r8 + 8]
00fce 4533db                         xor        r11d, r11d
00fd1 483bcb                         cmp        rcx, rbx
00fd4 410f96c3                       setbe      r11b
00fd8 4983c048                       add        r8, 0x48
00fdc 33c9                           xor        ecx, ecx
00fde 4c3bc2                         cmp        r8, rdx
00fe1 0f96c1                         setbe      cl
00fe4 440bd9                         or         r11d, ecx
00fe7 0f8477150000                   je         0x7f6a97bd5be4
00fed 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00ff5 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
00ffc 0f8fda150000                   jg         0x7f6a97bd5c5c
01002 452bd1                         sub        r10d, r9d
01005 8bdf                           mov        ebx, edi
01007 eb06                           jmp        0x7f6a97bd468f
01009 90                             nop        
0100a 90                             nop        
0100b 90                             nop        
0100c 418be8                         mov        ebp, r8d
0100f 458d042a                       lea        r8d, [r10 + rbp]
01013 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01018 4f8b5c0308                     mov        r11, qword ptr [r11 + r8 + 8]
0101d 448bcd                         mov        r9d, ebp
01020 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
01024 4e895c0908                     mov        qword ptr [rcx + r9 + 8], r11
01029 448d4508                       lea        r8d, [rbp + 8]
0102d 443bc3                         cmp        r8d, ebx
01030 7cda                           jl         0x7f6a97bd468c
01032 4d8d9e08feffff                 lea        r11, [r14 - 0x1f8]
01039 4981fb00000080                 cmp        r11, -0x80000000
01040 49c7c100000080                 mov        r9, 0xffffffff80000000
01047 4d0f4cd9                       cmovl      r11, r9
0104b 458beb                         mov        r13d, r11d
0104e 453bc5                         cmp        r8d, r13d
01051 0f8dfd150000                   jge        0x7f6a97bd5cd4
01057 4d63d8                         movsxd     r11, r8d
0105a 4c03d8                         add        r11, rax
0105d 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
01065 0f83f1150000                   jae        0x7f6a97bd5cdc
0106b 81c500020000                   add        ebp, 0x200
01071 4c63dd                         movsxd     r11, ebp
01074 4c03d8                         add        r11, rax
01077 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
0107f 0f83eb150000                   jae        0x7f6a97bd5cf0
01085 443b44244c                     cmp        r8d, dword ptr [rsp + 0x4c]
0108a 0f83f4150000                   jae        0x7f6a97bd5d04
01090 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
01094 0f83fe150000                   jae        0x7f6a97bd5d18
0109a eb07                           jmp        0x7f6a97bd4723
0109c 90                             nop        
0109d 90                             nop        
0109e 90                             nop        
0109f 90                             nop        
010a0 448bc1                         mov        r8d, ecx
010a3 478d1c02                       lea        r11d, [r10 + r8]
010a7 458bc8                         mov        r9d, r8d
010aa 4963d9                         movsxd     rbx, r9d
010ad 418bcb                         mov        ecx, r11d
010b0 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
010b5 62d17e486f840908000000         vmovdqu32  zmm0, zmmword ptr [r9 + rcx + 8]
010c0 4963fb                         movsxd     rdi, r11d
010c3 418d8880000000                 lea        ecx, [r8 + 0x80]
010ca 4103ca                         add        ecx, r10d
010cd 458d8800010000                 lea        r9d, [r8 + 0x100]
010d4 4503ca                         add        r9d, r10d
010d7 448bd9                         mov        r11d, ecx
010da 4863d1                         movsxd     rdx, ecx
010dd 418bc9                         mov        ecx, r9d
010e0 4963f1                         movsxd     rsi, r9d
010e3 458bc8                         mov        r9d, r8d
010e6 8b6c2448                       mov        ebp, dword ptr [rsp + 0x48]
010ea 62b17e487f840d08000000         vmovdqu32  zmmword ptr [rbp + r9 + 8], zmm0
010f5 62f17e486f843d48000000         vmovdqu32  zmm0, zmmword ptr [rbp + rdi + 0x48]
01100 62f17e487f841d48000000         vmovdqu32  zmmword ptr [rbp + rbx + 0x48], zmm0
0110b 62b17e486f841d08000000         vmovdqu32  zmm0, zmmword ptr [rbp + r11 + 8]
01116 62f17e487f841d88000000         vmovdqu32  zmmword ptr [rbp + rbx + 0x88], zmm0
01121 62f17e486f841548000000         vmovdqu32  zmm0, zmmword ptr [rbp + rdx + 0x48]
0112c 62f17e487f841dc8000000         vmovdqu32  zmmword ptr [rbp + rbx + 0xc8], zmm0
01137 62f17e486f840d08000000         vmovdqu32  zmm0, zmmword ptr [rbp + rcx + 8]
01142 8bcd                           mov        ecx, ebp
01144 62f17e487f841908010000         vmovdqu32  zmmword ptr [rcx + rbx + 0x108], zmm0
0114f 62f17e486f843148000000         vmovdqu32  zmm0, zmmword ptr [rcx + rsi + 0x48]
0115a 62f17e487f841948010000         vmovdqu32  zmmword ptr [rcx + rbx + 0x148], zmm0
01165 62f17e486f843988010000         vmovdqu32  zmm0, zmmword ptr [rcx + rdi + 0x188]
01170 62f17e487f841988010000         vmovdqu32  zmmword ptr [rcx + rbx + 0x188], zmm0
0117b 62f17e486f8439c8010000         vmovdqu32  zmm0, zmmword ptr [rcx + rdi + 0x1c8]
01186 62f17e487f8419c8010000         vmovdqu32  zmmword ptr [rcx + rbx + 0x1c8], zmm0
01191 418d8800020000                 lea        ecx, [r8 + 0x200]
01198 413bcd                         cmp        ecx, r13d
0119b 0f8cfffeffff                   jl         0x7f6a97bd4720
011a1 4983c6c8                       add        r14, -0x38
011a5 4981fe00000080                 cmp        r14, -0x80000000
011ac 49c7c300000080                 mov        r11, 0xffffffff80000000
011b3 4d0f4cf3                       cmovl      r14, r11
011b7 458bde                         mov        r11d, r14d
011ba 413bcb                         cmp        ecx, r11d
011bd 7d53                           jge        0x7f6a97bd4892
011bf 4181c038020000                 add        r8d, 0x238
011c6 4d63c8                         movsxd     r9, r8d
011c9 4c03c8                         add        r9, rax
011cc 4c3b8c2480000000               cmp        r9, qword ptr [rsp + 0x80]
011d4 0f8306180000                   jae        0x7f6a97bd6060
011da 443b44244c                     cmp        r8d, dword ptr [rsp + 0x4c]
011df 0f8323180000                   jae        0x7f6a97bd6088
011e5 90                             nop        
011e6 90                             nop        
011e7 90                             nop        
011e8 458d040a                       lea        r8d, [r10 + rcx]
011ec 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
011f1 62917e486f840108000000         vmovdqu32  zmm0, zmmword ptr [r9 + r8 + 8]
011fc 448bc1                         mov        r8d, ecx
011ff 62917e487f840108000000         vmovdqu32  zmmword ptr [r9 + r8 + 8], zmm0
0120a 83c140                         add        ecx, 0x40
0120d 413bcb                         cmp        ecx, r11d
01210 7cd6                           jl         0x7f6a97bd4868
01212 3b8c24a0000000                 cmp        ecx, dword ptr [rsp + 0xa0]
01219 7d47                           jge        0x7f6a97bd48e2
0121b 4c63d9                         movsxd     r11, ecx
0121e 4c03d8                         add        r11, rax
01221 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
01229 0f83c5170000                   jae        0x7f6a97bd6074
0122f 3b4c244c                       cmp        ecx, dword ptr [rsp + 0x4c]
01233 0f83e3170000                   jae        0x7f6a97bd609c
01239 90                             nop        
0123a 90                             nop        
0123b 90                             nop        
0123c 458d1c0a                       lea        r11d, [r10 + rcx]
01240 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01245 4f8b5c1808                     mov        r11, qword ptr [r8 + r11 + 8]
0124a 448bc1                         mov        r8d, ecx
0124d 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
01251 4e895c0308                     mov        qword ptr [rbx + r8 + 8], r11
01256 83c108                         add        ecx, 8
01259 3b8c24a0000000                 cmp        ecx, dword ptr [rsp + 0xa0]
01260 7cda                           jl         0x7f6a97bd48bc
01262 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0126a e9c2f3ffff                     jmp        0x7f6a97bd3cb1
0126f 90                             nop        
01270 898c2498000000                 mov        dword ptr [rsp + 0x98], ecx
01277 448bd7                         mov        r10d, edi
0127a 4403942498000000               add        r10d, dword ptr [rsp + 0x98]
01282 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
01287 c4817a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 8]
0128e 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
01296 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0129b c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
012a2 8b8c2498000000                 mov        ecx, dword ptr [rsp + 0x98]
012a9 83c110                         add        ecx, 0x10
012ac 3bca                           cmp        ecx, edx
012ae 7cc0                           jl         0x7f6a97bd48f0
012b0 4881c610ffffff                 add        rsi, -0xf0
012b7 4881fe00000080                 cmp        rsi, -0x80000000
012be 49c7c200000080                 mov        r10, 0xffffffff80000000
012c5 490f4cf2                       cmovl      rsi, r10
012c9 8bc6                           mov        eax, esi
012cb 3bc8                           cmp        ecx, eax
012cd 0f8d8c010000                   jge        0x7f6a97bd4adf
012d3 4c63d1                         movsxd     r10, ecx
012d6 4d03d3                         add        r10, r11
012d9 4d3bd1                         cmp        r10, r9
012dc 0f83ae160000                   jae        0x7f6a97bd6010
012e2 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
012ea 4181c200010000                 add        r10d, 0x100
012f1 4d63c2                         movsxd     r8, r10d
012f4 4d03c3                         add        r8, r11
012f7 4d3bc1                         cmp        r8, r9
012fa 0f83a4160000                   jae        0x7f6a97bd6024
01300 3b4c247c                       cmp        ecx, dword ptr [rsp + 0x7c]
01304 0f83ae160000                   jae        0x7f6a97bd6038
0130a 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
0130f 0f83b7160000                   jae        0x7f6a97bd604c
01315 90                             nop        
01316 90                             nop        
01317 90                             nop        
01318 90                             nop        
01319 90                             nop        
0131a 90                             nop        
0131b 90                             nop        
0131c 90                             nop        
0131d 90                             nop        
0131e 90                             nop        
0131f 90                             nop        
01320 8d340f                         lea        esi, [rdi + rcx]
01323 448bc1                         mov        r8d, ecx
01326 4963d0                         movsxd     rdx, r8d
01329 448bd6                         mov        r10d, esi
0132c 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
01331 c4817a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 8]
01338 4863ee                         movsxd     rbp, esi
0133b 448bd1                         mov        r10d, ecx
0133e 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01343 c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
0134a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0134f c4c17a6f442a18                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0x18]
01356 c4c17a7f441018                 vmovdqu    xmmword ptr [r8 + rdx + 0x18], xmm0
0135d c4c17a6f442a28                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0x28]
01364 c4c17a7f441028                 vmovdqu    xmmword ptr [r8 + rdx + 0x28], xmm0
0136b c4c17a6f442a38                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0x38]
01372 c4c17a7f441038                 vmovdqu    xmmword ptr [r8 + rdx + 0x38], xmm0
01379 c4c17a6f442a48                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0x48]
01380 c4c17a7f441048                 vmovdqu    xmmword ptr [r8 + rdx + 0x48], xmm0
01387 c4c17a6f442a58                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0x58]
0138e c4c17a7f441058                 vmovdqu    xmmword ptr [r8 + rdx + 0x58], xmm0
01395 c4c17a6f442a68                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0x68]
0139c c4c17a7f441068                 vmovdqu    xmmword ptr [r8 + rdx + 0x68], xmm0
013a3 c4c17a6f442a78                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0x78]
013aa c4c17a7f441078                 vmovdqu    xmmword ptr [r8 + rdx + 0x78], xmm0
013b1 c4c17a6f842a88000000           vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0x88]
013bb c4c17a7f841088000000           vmovdqu    xmmword ptr [r8 + rdx + 0x88], xmm0
013c5 c4c17a6f842a98000000           vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0x98]
013cf c4c17a7f841098000000           vmovdqu    xmmword ptr [r8 + rdx + 0x98], xmm0
013d9 c4c17a6f842aa8000000           vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0xa8]
013e3 c4c17a7f8410a8000000           vmovdqu    xmmword ptr [r8 + rdx + 0xa8], xmm0
013ed c4c17a6f842ab8000000           vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0xb8]
013f7 c4c17a7f8410b8000000           vmovdqu    xmmword ptr [r8 + rdx + 0xb8], xmm0
01401 c4c17a6f842ac8000000           vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0xc8]
0140b c4c17a7f8410c8000000           vmovdqu    xmmword ptr [r8 + rdx + 0xc8], xmm0
01415 c4c17a6f842ad8000000           vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0xd8]
0141f c4c17a7f8410d8000000           vmovdqu    xmmword ptr [r8 + rdx + 0xd8], xmm0
01429 c4c17a6f842ae8000000           vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0xe8]
01433 c4c17a7f8410e8000000           vmovdqu    xmmword ptr [r8 + rdx + 0xe8], xmm0
0143d c4c17a6f842af8000000           vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0xf8]
01447 c4c17a7f8410f8000000           vmovdqu    xmmword ptr [r8 + rdx + 0xf8], xmm0
01451 81c100010000                   add        ecx, 0x100
01457 3bc8                           cmp        ecx, eax
01459 0f8cc1feffff                   jl         0x7f6a97bd49a0
0145f 3bcb                           cmp        ecx, ebx
01461 7d3f                           jge        0x7f6a97bd4b22
01463 4c63d1                         movsxd     r10, ecx
01466 4d03d3                         add        r10, r11
01469 4d3bd1                         cmp        r10, r9
0146c 0f83be150000                   jae        0x7f6a97bd60b0
01472 3b4c247c                       cmp        ecx, dword ptr [rsp + 0x7c]
01476 0f83c8150000                   jae        0x7f6a97bd60c4
0147c 448d140f                       lea        r10d, [rdi + rcx]
01480 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01485 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
0148c 448bd1                         mov        r10d, ecx
0148f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01494 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
0149b 83c110                         add        ecx, 0x10
0149e 3bcb                           cmp        ecx, ebx
014a0 7cda                           jl         0x7f6a97bd4afc
014a2 478d142e                       lea        r10d, [r14 + r13]
014a6 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
014ae 899c249c000000                 mov        dword ptr [rsp + 0x9c], ebx
014b5 e904f3ffff                     jmp        0x7f6a97bd3e3e
014ba 4c03c9                         add        r9, rcx
014bd 4c3b4c2458                     cmp        r9, qword ptr [rsp + 0x58]
014c2 7e08                           jle        0x7f6a97bd4b4c
014c4 4533c0                         xor        r8d, r8d
014c7 e9e1ebffff                     jmp        0x7f6a97bd372d
014cc 4533c0                         xor        r8d, r8d
014cf bb01000000                     mov        ebx, 1
014d4 e9d6ebffff                     jmp        0x7f6a97bd372f
014d9 bee4ffffff                     mov        esi, 0xffffffe4
014de 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
014e3 448b1424                       mov        r10d, dword ptr [rsp]
014e7 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
014ef 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
014f4 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
014fc 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01501 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01509 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0150e 4c891424                       mov        qword ptr [rsp], r10
01512 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01517 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0151c 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01521 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01526 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0152b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01530 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01535 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
0153a 90                             nop        
0153b 90                             nop        
0153c c5f877                         vzeroupper 
0153f e89c8eafff                     call       0x7f6a976cda60
01544 0f1f84003c160007               nop        dword ptr [rax + rax + 0x700163c]
0154c 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
01556 4883e4f0                       and        rsp, 0xfffffffffffffff0
0155a e881991418                     call       0x7f6aafd1e560
0155f f4                             hlt        
01560 bee4ffffff                     mov        esi, 0xffffffe4
01565 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0156a 448b0424                       mov        r8d, dword ptr [rsp]
0156e 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01576 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0157b 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01583 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01588 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01590 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01595 4c891c24                       mov        qword ptr [rsp], r11
01599 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0159e 4489442408                     mov        dword ptr [rsp + 8], r8d
015a3 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
015a8 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
015ad 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
015b2 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
015b7 4489442414                     mov        dword ptr [rsp + 0x14], r8d
015bc 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
015c1 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
015c6 4489742428                     mov        dword ptr [rsp + 0x28], r14d
015cb c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
015d1 90                             nop        
015d2 90                             nop        
015d3 90                             nop        
015d4 c5f877                         vzeroupper 
015d7 e8048eafff                     call       0x7f6a976cda60
015dc 0f1f8400d4160008               nop        dword ptr [rax + rax + 0x80016d4]
015e4 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
015ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
015f2 e8e9981418                     call       0x7f6aafd1e560
015f7 f4                             hlt        
015f8 bee4ffffff                     mov        esi, 0xffffffe4
015fd 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01602 448b0424                       mov        r8d, dword ptr [rsp]
01606 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
0160e 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01613 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
0161b 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01620 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01628 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0162d 4c891c24                       mov        qword ptr [rsp], r11
01631 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01636 4489442408                     mov        dword ptr [rsp + 8], r8d
0163b 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01640 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01645 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0164a 90                             nop        
0164b 90                             nop        
0164c c5f877                         vzeroupper 
0164f e88c8dafff                     call       0x7f6a976cda60
01654 0f1f84004c170009               nop        dword ptr [rax + rax + 0x900174c]
0165c 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
01666 4883e4f0                       and        rsp, 0xfffffffffffffff0
0166a e871981418                     call       0x7f6aafd1e560
0166f f4                             hlt        
01670 be45ffffff                     mov        esi, 0xffffff45
01675 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
0167d 90                             nop        
0167e 90                             nop        
0167f 90                             nop        
01680 c5f877                         vzeroupper 
01683 e8588dafff                     call       0x7f6a976cda60
01688 0f1f84008017000a               nop        dword ptr [rax + rax + 0xa001780]
01690 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
0169a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0169e e83d981418                     call       0x7f6aafd1e560
016a3 f4                             hlt        
016a4 be45ffffff                     mov        esi, 0xffffff45
016a9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
016ae 448b1424                       mov        r10d, dword ptr [rsp]
016b2 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
016ba 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
016bf 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
016c7 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
016cc 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
016d4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
016d9 4c891424                       mov        qword ptr [rsp], r10
016dd 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
016e2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016e7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016ec 4489442424                     mov        dword ptr [rsp + 0x24], r8d
016f1 4489742428                     mov        dword ptr [rsp + 0x28], r14d
016f6 895c2430                       mov        dword ptr [rsp + 0x30], ebx
016fa 90                             nop        
016fb 90                             nop        
016fc c5f877                         vzeroupper 
016ff e8dc8cafff                     call       0x7f6a976cda60
01704 0f1f8400fc17000b               nop        dword ptr [rax + rax + 0xb0017fc]
0170c 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
01716 4883e4f0                       and        rsp, 0xfffffffffffffff0
0171a e8c1971418                     call       0x7f6aafd1e560
0171f f4                             hlt        
01720 493bd8                         cmp        rbx, r8
01723 bdffffffff                     mov        ebp, 0xffffffff
01728 7c08                           jl         0x7f6a97bd4db2
0172a 400f95c5                       setne      bpl
0172e 400fb6ed                       movzx      ebp, bpl
01732 be45ffffff                     mov        esi, 0xffffff45
01737 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0173c 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01744 448b1424                       mov        r10d, dword ptr [rsp]
01748 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01750 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01755 4c891424                       mov        qword ptr [rsp], r10
01759 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0175e 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
01766 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0176b 4c89542408                     mov        qword ptr [rsp + 8], r10
01770 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
01775 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0177a 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0177f 4489742430                     mov        dword ptr [rsp + 0x30], r14d
01784 4c89442440                     mov        qword ptr [rsp + 0x40], r8
01789 90                             nop        
0178a 90                             nop        
0178b 90                             nop        
0178c c5f877                         vzeroupper 
0178f e84c8cafff                     call       0x7f6a976cda60
01794 0f1f84008c18000c               nop        dword ptr [rax + rax + 0xc00188c]
0179c 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
017a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
017aa e831971418                     call       0x7f6aafd1e560
017af f4                             hlt        
017b0 be45ffffff                     mov        esi, 0xffffff45
017b5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
017ba 448b0424                       mov        r8d, dword ptr [rsp]
017be 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
017c6 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
017cb 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
017d3 448b542408                     mov        r10d, dword ptr [rsp + 8]
017d8 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
017e0 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
017e5 4c891424                       mov        qword ptr [rsp], r10
017e9 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
017ee 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017f3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017f8 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
017fd 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01802 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01807 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0180c 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01811 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01816 90                             nop        
01817 90                             nop        
01818 c5f877                         vzeroupper 
0181b e8c08bafff                     call       0x7f6a976cda60
01820 0f1f84001819000d               nop        dword ptr [rax + rax + 0xd001918]
01828 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
01832 4883e4f0                       and        rsp, 0xfffffffffffffff0
01836 e8a5961418                     call       0x7f6aafd1e560
0183b f4                             hlt        
0183c be45ffffff                     mov        esi, 0xffffff45
01841 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01846 448b1424                       mov        r10d, dword ptr [rsp]
0184a 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01852 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01857 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0185f 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01864 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0186c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01871 4c891424                       mov        qword ptr [rsp], r10
01875 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
0187a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0187f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01884 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01889 90                             nop        
0188a 90                             nop        
0188b 90                             nop        
0188c c5f877                         vzeroupper 
0188f e84c8bafff                     call       0x7f6a976cda60
01894 0f1f84008c19000e               nop        dword ptr [rax + rax + 0xe00198c]
0189c 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
018a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
018aa e831961418                     call       0x7f6aafd1e560
018af f4                             hlt        
018b0 bee4ffffff                     mov        esi, 0xffffffe4
018b5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
018ba 448b1c24                       mov        r11d, dword ptr [rsp]
018be 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
018c6 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
018cb 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
018d3 448b442408                     mov        r8d, dword ptr [rsp + 8]
018d8 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
018e0 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
018e5 4c891c24                       mov        qword ptr [rsp], r11
018e9 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
018ee 4489442408                     mov        dword ptr [rsp + 8], r8d
018f3 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
018f8 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
018fd 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01902 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01907 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0190c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01911 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01916 90                             nop        
01917 90                             nop        
01918 c5f877                         vzeroupper 
0191b e8c08aafff                     call       0x7f6a976cda60
01920 0f1f8400181a000f               nop        dword ptr [rax + rax + 0xf001a18]
01928 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
01932 4883e4f0                       and        rsp, 0xfffffffffffffff0
01936 e8a5951418                     call       0x7f6aafd1e560
0193b f4                             hlt        
0193c bee4ffffff                     mov        esi, 0xffffffe4
01941 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01946 448b0424                       mov        r8d, dword ptr [rsp]
0194a 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01952 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01957 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
0195f 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01964 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0196c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01971 4c891c24                       mov        qword ptr [rsp], r11
01975 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0197a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0197f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01984 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01989 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0198e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01993 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01998 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0199d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
019a2 4c894c2438                     mov        qword ptr [rsp + 0x38], r9
019a7 90                             nop        
019a8 c5f877                         vzeroupper 
019ab e8308aafff                     call       0x7f6a976cda60
019b0 0f1f8400a81a0010               nop        dword ptr [rax + rax + 0x10001aa8]
019b8 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
019c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
019c6 e815951418                     call       0x7f6aafd1e560
019cb f4                             hlt        
019cc 4183c208                       add        r10d, 8
019d0 be6effffff                     mov        esi, 0xffffff6e
019d5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
019da 8b0c24                         mov        ecx, dword ptr [rsp]
019dd 898c24d0000000                 mov        dword ptr [rsp + 0xd0], ecx
019e4 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
019e9 4c898c24d8000000               mov        qword ptr [rsp + 0xd8], r9
019f1 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
019f6 44898c24d4000000               mov        dword ptr [rsp + 0xd4], r9d
019fe 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
01a03 4c890c24                       mov        qword ptr [rsp], r9
01a07 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01a0c 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01a11 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01a16 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01a1b 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01a20 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01a25 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01a2a 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
01a32 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01a37 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01a3c 458bd8                         mov        r11d, r8d
01a3f 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01a44 c5f877                         vzeroupper 
01a47 e89489afff                     call       0x7f6a976cda60
01a4c 0f1f8400441b0011               nop        dword ptr [rax + rax + 0x11001b44]
01a54 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
01a5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a62 e879941418                     call       0x7f6aafd1e560
01a67 f4                             hlt        
01a68 4183c208                       add        r10d, 8
01a6c be66ffffff                     mov        esi, 0xffffff66
01a71 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01a76 8b0c24                         mov        ecx, dword ptr [rsp]
01a79 898c24d0000000                 mov        dword ptr [rsp + 0xd0], ecx
01a80 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
01a85 4c898c24d8000000               mov        qword ptr [rsp + 0xd8], r9
01a8d 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01a92 44898c24d4000000               mov        dword ptr [rsp + 0xd4], r9d
01a9a 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
01a9f 4c890c24                       mov        qword ptr [rsp], r9
01aa3 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01aa8 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01aad 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01ab2 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01ab7 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
01abc 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01ac1 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01ac6 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
01ace 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01ad3 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01ad8 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01add 90                             nop        
01ade 90                             nop        
01adf 90                             nop        
01ae0 c5f877                         vzeroupper 
01ae3 e8f888afff                     call       0x7f6a976cda60
01ae8 0f1f8400e01b0012               nop        dword ptr [rax + rax + 0x12001be0]
01af0 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
01afa 4883e4f0                       and        rsp, 0xfffffffffffffff0
01afe e8dd931418                     call       0x7f6aafd1e560
01b03 f4                             hlt        
01b04 48bf80916b706a7f0000           movabs     rdi, 0x7f6a706b9180
01b0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b12 e8c9931418                     call       0x7f6aafd1e560
01b17 f4                             hlt        
01b18 48bf80916b706a7f0000           movabs     rdi, 0x7f6a706b9180
01b22 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b26 e8b5931418                     call       0x7f6aafd1e560
01b2b f4                             hlt        
01b2c 48bf80916b706a7f0000           movabs     rdi, 0x7f6a706b9180
01b36 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b3a e8a1931418                     call       0x7f6aafd1e560
01b3f f4                             hlt        
01b40 48bf80916b706a7f0000           movabs     rdi, 0x7f6a706b9180
01b4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b4e e88d931418                     call       0x7f6aafd1e560
01b53 f4                             hlt        
01b54 48bf80916b706a7f0000           movabs     rdi, 0x7f6a706b9180
01b5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b62 e879931418                     call       0x7f6aafd1e560
01b67 f4                             hlt        
01b68 48bf80916b706a7f0000           movabs     rdi, 0x7f6a706b9180
01b72 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b76 e865931418                     call       0x7f6aafd1e560
01b7b f4                             hlt        
01b7c beccffffff                     mov        esi, 0xffffffcc
01b81 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01b86 448b1c24                       mov        r11d, dword ptr [rsp]
01b8a 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01b92 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01b97 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01b9f 448b442408                     mov        r8d, dword ptr [rsp + 8]
01ba4 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01bac 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01bb1 4c891c24                       mov        qword ptr [rsp], r11
01bb5 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01bba 44895c2408                     mov        dword ptr [rsp + 8], r11d
01bbf 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01bc4 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01bc9 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01bce 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01bd3 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01bd8 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01bdd 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01be5 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01bea 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01bef 90                             nop        
01bf0 c5f877                         vzeroupper 
01bf3 e8e887afff                     call       0x7f6a976cda60
01bf8 0f1f8400f01c0013               nop        dword ptr [rax + rax + 0x13001cf0]
01c00 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
01c0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c0e e8cd921418                     call       0x7f6aafd1e560
01c13 f4                             hlt        
01c14 beccffffff                     mov        esi, 0xffffffcc
01c19 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01c1e 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01c26 448b1c24                       mov        r11d, dword ptr [rsp]
01c2a 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01c32 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01c37 4c891424                       mov        qword ptr [rsp], r10
01c3b 448b542408                     mov        r10d, dword ptr [rsp + 8]
01c40 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01c48 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c4d 4c89542408                     mov        qword ptr [rsp + 8], r10
01c52 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01c57 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01c5c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c61 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c66 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01c6b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01c70 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01c75 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01c7a 90                             nop        
01c7b 90                             nop        
01c7c c5f877                         vzeroupper 
01c7f e85c87afff                     call       0x7f6a976cda60
01c84 0f1f84007c1d0014               nop        dword ptr [rax + rax + 0x14001d7c]
01c8c 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
01c96 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c9a e841921418                     call       0x7f6aafd1e560
01c9f f4                             hlt        
01ca0 85c9                           test       ecx, ecx
01ca2 0f84b00d0000                   je         0x7f6a97bd60d8
01ca8 8b1c24                         mov        ebx, dword ptr [rsp]
01cab 458bda                         mov        r11d, r10d
01cae 4533c0                         xor        r8d, r8d
01cb1 448bd3                         mov        r10d, ebx
01cb4 e9baefffff                     jmp        0x7f6a97bd42f3
01cb9 bee4ffffff                     mov        esi, 0xffffffe4
01cbe 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01cc3 448b1424                       mov        r10d, dword ptr [rsp]
01cc7 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01ccf 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01cd4 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01cdc 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01ce1 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01ce9 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01cee 4c891424                       mov        qword ptr [rsp], r10
01cf2 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01cf7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01cfc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d01 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01d06 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01d0b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01d10 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01d15 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01d1a 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01d1f 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01d23 90                             nop        
01d24 c5f877                         vzeroupper 
01d27 e8b486afff                     call       0x7f6a976cda60
01d2c 0f1f8400241e0015               nop        dword ptr [rax + rax + 0x15001e24]
01d34 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
01d3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d42 e899911418                     call       0x7f6aafd1e560
01d47 f4                             hlt        
01d48 be6effffff                     mov        esi, 0xffffff6e
01d4d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01d52 448b1c24                       mov        r11d, dword ptr [rsp]
01d56 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01d5e 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01d63 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01d6b 448b542408                     mov        r10d, dword ptr [rsp + 8]
01d70 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01d78 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01d7d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d82 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d87 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01d8c 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01d91 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01d96 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01d9b 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01da0 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01da5 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01da9 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01dad 90                             nop        
01dae 90                             nop        
01daf 90                             nop        
01db0 c5f877                         vzeroupper 
01db3 e82886afff                     call       0x7f6a976cda60
01db8 0f1f8400b01e0016               nop        dword ptr [rax + rax + 0x16001eb0]
01dc0 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
01dca 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dce e80d911418                     call       0x7f6aafd1e560
01dd3 f4                             hlt        
01dd4 be45ffffff                     mov        esi, 0xffffff45
01dd9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01dde 448b1424                       mov        r10d, dword ptr [rsp]
01de2 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01dea 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01def 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01df7 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01dfc 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01e04 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01e09 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e0e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e13 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01e18 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01e1d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01e22 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01e27 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01e2c 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01e31 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01e35 90                             nop        
01e36 90                             nop        
01e37 90                             nop        
01e38 c5f877                         vzeroupper 
01e3b e8a085afff                     call       0x7f6a976cda60
01e40 0f1f8400381f0017               nop        dword ptr [rax + rax + 0x17001f38]
01e48 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
01e52 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e56 e885901418                     call       0x7f6aafd1e560
01e5b f4                             hlt        
01e5c be3dffffff                     mov        esi, 0xffffff3d
01e61 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01e66 448b1424                       mov        r10d, dword ptr [rsp]
01e6a 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01e72 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01e77 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01e7f 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01e84 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01e8c 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01e91 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e96 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e9b 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01ea0 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01ea5 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01eaa 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01eaf 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01eb4 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01eb9 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01ebd 90                             nop        
01ebe 90                             nop        
01ebf 90                             nop        
01ec0 c5f877                         vzeroupper 
01ec3 e81885afff                     call       0x7f6a976cda60
01ec8 0f1f8400c01f0018               nop        dword ptr [rax + rax + 0x18001fc0]
01ed0 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
01eda 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ede e8fd8f1418                     call       0x7f6aafd1e560
01ee3 f4                             hlt        
01ee4 bee4ffffff                     mov        esi, 0xffffffe4
01ee9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01eee 448b0424                       mov        r8d, dword ptr [rsp]
01ef2 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01efa 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01eff 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01f07 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01f0c 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01f14 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01f19 4c891c24                       mov        qword ptr [rsp], r11
01f1d 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01f22 4489442408                     mov        dword ptr [rsp + 8], r8d
01f27 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01f2c 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01f31 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01f36 4489442418                     mov        dword ptr [rsp + 0x18], r8d
01f3b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01f40 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01f45 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01f4a 90                             nop        
01f4b 90                             nop        
01f4c c5f877                         vzeroupper 
01f4f e88c84afff                     call       0x7f6a976cda60
01f54 0f1f84004c200019               nop        dword ptr [rax + rax + 0x1900204c]
01f5c 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
01f66 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f6a e8718f1418                     call       0x7f6aafd1e560
01f6f f4                             hlt        
01f70 bee4ffffff                     mov        esi, 0xffffffe4
01f75 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01f7a 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
01f82 448b0424                       mov        r8d, dword ptr [rsp]
01f86 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
01f8e 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01f93 4c891c24                       mov        qword ptr [rsp], r11
01f97 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01f9c 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
01fa4 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01fa9 4c895c2408                     mov        qword ptr [rsp + 8], r11
01fae 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01fb3 4489442410                     mov        dword ptr [rsp + 0x10], r8d
01fb8 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01fbd 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01fc2 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01fc7 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01fcc 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01fd1 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01fd6 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01fdb 90                             nop        
01fdc c5f877                         vzeroupper 
01fdf e8fc83afff                     call       0x7f6a976cda60
01fe4 0f1f8400dc20001a               nop        dword ptr [rax + rax + 0x1a0020dc]
01fec 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
01ff6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ffa e8e18e1418                     call       0x7f6aafd1e560
01fff f4                             hlt        
02000 418d6a01                       lea        ebp, [r10 + 1]
02004 bee4ffffff                     mov        esi, 0xffffffe4
02009 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
0200e 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
02016 448b0424                       mov        r8d, dword ptr [rsp]
0201a 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
02022 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02027 4c891c24                       mov        qword ptr [rsp], r11
0202b 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02030 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
02038 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0203d 4c895c2408                     mov        qword ptr [rsp + 8], r11
02042 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02047 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0204c 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
02051 4489442420                     mov        dword ptr [rsp + 0x20], r8d
02056 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0205b 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02060 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
02065 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0206a 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
0206f 90                             nop        
02070 c5f877                         vzeroupper 
02073 e86883afff                     call       0x7f6a976cda60
02078 0f1f84007021001b               nop        dword ptr [rax + rax + 0x1b002170]
02080 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
0208a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0208e e84d8e1418                     call       0x7f6aafd1e560
02093 f4                             hlt        
02094 bee4ffffff                     mov        esi, 0xffffffe4
02099 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
0209e 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
020a6 448b0424                       mov        r8d, dword ptr [rsp]
020aa 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
020b2 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
020b7 4c891c24                       mov        qword ptr [rsp], r11
020bb 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
020c0 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
020c8 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
020cd 4c895c2408                     mov        qword ptr [rsp + 8], r11
020d2 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
020d7 4489442410                     mov        dword ptr [rsp + 0x10], r8d
020dc 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
020e1 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
020e6 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
020eb 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
020f0 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
020f5 4489442424                     mov        dword ptr [rsp + 0x24], r8d
020fa 4489542434                     mov        dword ptr [rsp + 0x34], r10d
020ff 90                             nop        
02100 c5f877                         vzeroupper 
02103 e8d882afff                     call       0x7f6a976cda60
02108 0f1f84000022001c               nop        dword ptr [rax + rax + 0x1c002200]
02110 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
0211a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0211e e8bd8d1418                     call       0x7f6aafd1e560
02123 f4                             hlt        
02124 bee4ffffff                     mov        esi, 0xffffffe4
02129 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0212e 448b0424                       mov        r8d, dword ptr [rsp]
02132 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
0213a 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0213f 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
02147 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0214c 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02154 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02159 4c891c24                       mov        qword ptr [rsp], r11
0215d 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
02162 4489442408                     mov        dword ptr [rsp + 8], r8d
02167 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0216c 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02171 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02176 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
0217b 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02180 c5f877                         vzeroupper 
02183 e85882afff                     call       0x7f6a976cda60
02188 0f1f84008022001d               nop        dword ptr [rax + rax + 0x1d002280]
02190 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
0219a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0219e e83d8d1418                     call       0x7f6aafd1e560
021a3 f4                             hlt        
021a4 beccffffff                     mov        esi, 0xffffffcc
021a9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
021ae 448b0424                       mov        r8d, dword ptr [rsp]
021b2 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
021ba 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
021bf 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
021c7 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
021cc 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
021d4 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
021d9 4c891c24                       mov        qword ptr [rsp], r11
021dd 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
021e2 4489442408                     mov        dword ptr [rsp + 8], r8d
021e7 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
021ec 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
021f1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
021f6 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
021fb 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02200 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
02205 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0220a 90                             nop        
0220b 90                             nop        
0220c c5f877                         vzeroupper 
0220f e8cc81afff                     call       0x7f6a976cda60
02214 0f1f84000c23001e               nop        dword ptr [rax + rax + 0x1e00230c]
0221c 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
02226 4883e4f0                       and        rsp, 0xfffffffffffffff0
0222a e8b18c1418                     call       0x7f6aafd1e560
0222f f4                             hlt        
02230 be45ffffff                     mov        esi, 0xffffff45
02235 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0223a 448b0424                       mov        r8d, dword ptr [rsp]
0223e 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
02246 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0224b 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
02253 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02258 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02260 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02265 4c891c24                       mov        qword ptr [rsp], r11
02269 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0226e 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02273 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
02278 c5f877                         vzeroupper 
0227b e86081afff                     call       0x7f6a976cda60
02280 0f1f84007823001f               nop        dword ptr [rax + rax + 0x1f002378]
02288 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
02292 4883e4f0                       and        rsp, 0xfffffffffffffff0
02296 e8458c1418                     call       0x7f6aafd1e560
0229b f4                             hlt        
0229c be17000000                     mov        esi, 0x17
022a1 90                             nop        
022a2 90                             nop        
022a3 90                             nop        
022a4 c5f877                         vzeroupper 
022a7 e83481afff                     call       0x7f6a976cda60
022ac 0f1f8400a4230020               nop        dword ptr [rax + rax + 0x200023a4]
022b4 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
022be 4883e4f0                       and        rsp, 0xfffffffffffffff0
022c2 e8198c1418                     call       0x7f6aafd1e560
022c7 f4                             hlt        
022c8 be6effffff                     mov        esi, 0xffffff6e
022cd 498bee                         mov        rbp, r14
022d0 8b1424                         mov        edx, dword ptr [rsp]
022d3 899424d0000000                 mov        dword ptr [rsp + 0xd0], edx
022da 4c891c24                       mov        qword ptr [rsp], r11
022de 894c2408                       mov        dword ptr [rsp + 8], ecx
022e2 48ff742420                     push       qword ptr [rsp + 0x20]
022e7 488f442410                     pop        qword ptr [rsp + 0x10]
022ec 897c2418                       mov        dword ptr [rsp + 0x18], edi
022f0 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
022f5 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
022fa 895c2430                       mov        dword ptr [rsp + 0x30], ebx
022fe 4c89442438                     mov        qword ptr [rsp + 0x38], r8
02303 90                             nop        
02304 c5f877                         vzeroupper 
02307 e8d480afff                     call       0x7f6a976cda60
0230c 0f1f840004240021               nop        dword ptr [rax + rax + 0x21002404]
02314 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
0231e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02322 e8b98b1418                     call       0x7f6aafd1e560
02327 f4                             hlt        
02328 bebeffffff                     mov        esi, 0xffffffbe
0232d 4c89b424d0000000               mov        qword ptr [rsp + 0xd0], r14
02335 8b1424                         mov        edx, dword ptr [rsp]
02338 899424d8000000                 mov        dword ptr [rsp + 0xd8], edx
0233f 4c891c24                       mov        qword ptr [rsp], r11
02343 894c2408                       mov        dword ptr [rsp + 8], ecx
02347 48ff742420                     push       qword ptr [rsp + 0x20]
0234c 488f442410                     pop        qword ptr [rsp + 0x10]
02351 897c2418                       mov        dword ptr [rsp + 0x18], edi
02355 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
0235a 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
0235f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
02363 4c89442438                     mov        qword ptr [rsp + 0x38], r8
02368 c5f877                         vzeroupper 
0236b e87080afff                     call       0x7f6a976cda60
02370 0f1f840068240022               nop        dword ptr [rax + rax + 0x22002468]
02378 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
02382 4883e4f0                       and        rsp, 0xfffffffffffffff0
02386 e8558b1418                     call       0x7f6aafd1e560
0238b f4                             hlt        
0238c 4c8b742440                     mov        r14, qword ptr [rsp + 0x40]
02391 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
02395 beccffffff                     mov        esi, 0xffffffcc
0239a 4c89b424d0000000               mov        qword ptr [rsp + 0xd0], r14
023a2 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
023aa 898c24dc000000                 mov        dword ptr [rsp + 0xdc], ecx
023b1 44891c24                       mov        dword ptr [rsp], r11d
023b5 4489542410                     mov        dword ptr [rsp + 0x10], r10d
023ba 90                             nop        
023bb 90                             nop        
023bc c5f877                         vzeroupper 
023bf e81c80afff                     call       0x7f6a976cda60
023c4 0f1f8400bc240023               nop        dword ptr [rax + rax + 0x230024bc]
023cc 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
023d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
023da e8018b1418                     call       0x7f6aafd1e560
023df f4                             hlt        
023e0 bee4ffffff                     mov        esi, 0xffffffe4
023e5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
023ea 448b0424                       mov        r8d, dword ptr [rsp]
023ee 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
023f6 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
023fb 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
02403 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02408 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02410 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02415 4c891c24                       mov        qword ptr [rsp], r11
02419 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0241e 4489442408                     mov        dword ptr [rsp + 8], r8d
02423 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02428 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0242d 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
02432 4489442418                     mov        dword ptr [rsp + 0x18], r8d
02437 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0243c 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
02441 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02446 90                             nop        
02447 90                             nop        
02448 c5f877                         vzeroupper 
0244b e8907fafff                     call       0x7f6a976cda60
02450 0f1f840048250024               nop        dword ptr [rax + rax + 0x24002548]
02458 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
02462 4883e4f0                       and        rsp, 0xfffffffffffffff0
02466 e8758a1418                     call       0x7f6aafd1e560
0246b f4                             hlt        
0246c bee4ffffff                     mov        esi, 0xffffffe4
02471 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
02476 448b0424                       mov        r8d, dword ptr [rsp]
0247a 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
02482 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02487 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
0248f 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02494 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0249c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
024a1 4c891c24                       mov        qword ptr [rsp], r11
024a5 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
024aa 4489442408                     mov        dword ptr [rsp + 8], r8d
024af 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
024b4 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
024b9 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
024be 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
024c3 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
024c8 c5f877                         vzeroupper 
024cb e8107fafff                     call       0x7f6a976cda60
024d0 0f1f8400c8250025               nop        dword ptr [rax + rax + 0x250025c8]
024d8 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
024e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
024e6 e8f5891418                     call       0x7f6aafd1e560
024eb f4                             hlt        
024ec 4183c208                       add        r10d, 8
024f0 be6effffff                     mov        esi, 0xffffff6e
024f5 448b0424                       mov        r8d, dword ptr [rsp]
024f9 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
02501 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02506 4c891c24                       mov        qword ptr [rsp], r11
0250a 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0250f 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
02517 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0251c 4c895c2408                     mov        qword ptr [rsp + 8], r11
02521 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02526 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0252b 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
02533 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02538 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0253d 90                             nop        
0253e 90                             nop        
0253f 90                             nop        
02540 c5f877                         vzeroupper 
02543 e8987eafff                     call       0x7f6a976cda60
02548 0f1f840040260026               nop        dword ptr [rax + rax + 0x26002640]
02550 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
0255a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0255e e87d891418                     call       0x7f6aafd1e560
02563 f4                             hlt        
02564 4183c208                       add        r10d, 8
02568 beb6ffffff                     mov        esi, 0xffffffb6
0256d 448b0424                       mov        r8d, dword ptr [rsp]
02571 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
02579 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0257e 4c891c24                       mov        qword ptr [rsp], r11
02582 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02587 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
0258f 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02594 4c895c2408                     mov        qword ptr [rsp + 8], r11
02599 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0259e 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
025a3 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
025ab 4489542430                     mov        dword ptr [rsp + 0x30], r10d
025b0 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
025b5 90                             nop        
025b6 90                             nop        
025b7 90                             nop        
025b8 c5f877                         vzeroupper 
025bb e8207eafff                     call       0x7f6a976cda60
025c0 0f1f8400b8260027               nop        dword ptr [rax + rax + 0x270026b8]
025c8 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
025d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
025d6 e805891418                     call       0x7f6aafd1e560
025db f4                             hlt        
025dc 4183c208                       add        r10d, 8
025e0 be66ffffff                     mov        esi, 0xffffff66
025e5 448b0424                       mov        r8d, dword ptr [rsp]
025e9 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
025f1 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
025f6 4c891c24                       mov        qword ptr [rsp], r11
025fa 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
025ff 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
02607 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0260c 4c895c2408                     mov        qword ptr [rsp + 8], r11
02611 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02616 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0261b 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
02623 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02628 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0262d 90                             nop        
0262e 90                             nop        
0262f 90                             nop        
02630 c5f877                         vzeroupper 
02633 e8a87dafff                     call       0x7f6a976cda60
02638 0f1f840030270028               nop        dword ptr [rax + rax + 0x28002730]
02640 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
0264a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0264e e88d881418                     call       0x7f6aafd1e560
02653 f4                             hlt        
02654 418bc8                         mov        ecx, r8d
02657 e9b6ebffff                     jmp        0x7f6a97bd4892
0265c 48bf80916b706a7f0000           movabs     rdi, 0x7f6a706b9180
02666 4883e4f0                       and        rsp, 0xfffffffffffffff0
0266a e871881418                     call       0x7f6aafd1e560
0266f f4                             hlt        
02670 48bf80916b706a7f0000           movabs     rdi, 0x7f6a706b9180
0267a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0267e e85d881418                     call       0x7f6aafd1e560
02683 f4                             hlt        
02684 48bf80916b706a7f0000           movabs     rdi, 0x7f6a706b9180
0268e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02692 e849881418                     call       0x7f6aafd1e560
02697 f4                             hlt        
02698 48bf80916b706a7f0000           movabs     rdi, 0x7f6a706b9180
026a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
026a6 e835881418                     call       0x7f6aafd1e560
026ab f4                             hlt        
026ac bee4ffffff                     mov        esi, 0xffffffe4
026b1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
026b6 448b1424                       mov        r10d, dword ptr [rsp]
026ba 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
026c2 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
026c7 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
026cf 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
026d4 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
026dc 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
026e1 4c891424                       mov        qword ptr [rsp], r10
026e5 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
026ea 44895c2408                     mov        dword ptr [rsp + 8], r11d
026ef 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
026f4 4c89542410                     mov        qword ptr [rsp + 0x10], r10
026f9 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
026fe 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02703 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02708 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0270d 4489742424                     mov        dword ptr [rsp + 0x24], r14d
02712 895c2430                       mov        dword ptr [rsp + 0x30], ebx
02716 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
0271b 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
02720 c5f877                         vzeroupper 
02723 e8b87cafff                     call       0x7f6a976cda60
02728 0f1f840020280029               nop        dword ptr [rax + rax + 0x29002820]
02730 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
0273a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0273e e89d871418                     call       0x7f6aafd1e560
02743 f4                             hlt        
02744 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
0274d bee4ffffff                     mov        esi, 0xffffffe4
02752 498bea                         mov        rbp, r10
02755 448b1424                       mov        r10d, dword ptr [rsp]
02759 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
02761 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02766 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0276e 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02773 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0277b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02780 4c891424                       mov        qword ptr [rsp], r10
02784 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02789 44895c2408                     mov        dword ptr [rsp + 8], r11d
0278e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02793 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02798 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0279d 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
027a2 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
027a7 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
027ac 4489742424                     mov        dword ptr [rsp + 0x24], r14d
027b1 895c2430                       mov        dword ptr [rsp + 0x30], ebx
027b5 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
027ba 89542440                       mov        dword ptr [rsp + 0x40], edx
027be 90                             nop        
027bf 90                             nop        
027c0 c5f877                         vzeroupper 
027c3 e8187cafff                     call       0x7f6a976cda60
027c8 0f1f8400c028002a               nop        dword ptr [rax + rax + 0x2a0028c0]
027d0 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
027da 4883e4f0                       and        rsp, 0xfffffffffffffff0
027de e8fd861418                     call       0x7f6aafd1e560
027e3 f4                             hlt        
027e4 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
027ec beccffffff                     mov        esi, 0xffffffcc
027f1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
027f6 448b1424                       mov        r10d, dword ptr [rsp]
027fa 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
02802 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02807 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0280f 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02814 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0281c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02821 4c891424                       mov        qword ptr [rsp], r10
02825 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0282a 4489542408                     mov        dword ptr [rsp + 8], r10d
0282f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02834 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02839 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0283e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02843 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02848 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0284d 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
02852 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02857 4489742448                     mov        dword ptr [rsp + 0x48], r14d
0285c c5f877                         vzeroupper 
0285f e87c7bafff                     call       0x7f6a976cda60
02864 0f1f84005c29002b               nop        dword ptr [rax + rax + 0x2b00295c]
0286c 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
02876 4883e4f0                       and        rsp, 0xfffffffffffffff0
0287a e861861418                     call       0x7f6aafd1e560
0287f f4                             hlt        
02880 418bed                         mov        ebp, r13d
02883 83c510                         add        ebp, 0x10
02886 be6effffff                     mov        esi, 0xffffff6e
0288b 448b1424                       mov        r10d, dword ptr [rsp]
0288f 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
02897 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0289c 4c891424                       mov        qword ptr [rsp], r10
028a0 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
028a5 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
028ad 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
028b2 4c89542408                     mov        qword ptr [rsp + 8], r10
028b7 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
028bc 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
028c1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
028c6 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
028cb 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
028d0 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
028d5 4489542424                     mov        dword ptr [rsp + 0x24], r10d
028da 448974242c                     mov        dword ptr [rsp + 0x2c], r14d
028df 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
028e3 90                             nop        
028e4 c5f877                         vzeroupper 
028e7 e8f47aafff                     call       0x7f6a976cda60
028ec 0f1f8400e429002c               nop        dword ptr [rax + rax + 0x2c0029e4]
028f4 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
028fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
02902 e8d9851418                     call       0x7f6aafd1e560
02907 f4                             hlt        
02908 418bed                         mov        ebp, r13d
0290b 83c510                         add        ebp, 0x10
0290e be66ffffff                     mov        esi, 0xffffff66
02913 448b1424                       mov        r10d, dword ptr [rsp]
02917 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
0291f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02924 4c891424                       mov        qword ptr [rsp], r10
02928 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0292d 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
02935 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0293a 4c89542408                     mov        qword ptr [rsp + 8], r10
0293f 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
02944 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02949 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0294e 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02953 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02958 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0295d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02962 448974242c                     mov        dword ptr [rsp + 0x2c], r14d
02967 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0296b 90                             nop        
0296c c5f877                         vzeroupper 
0296f e86c7aafff                     call       0x7f6a976cda60
02974 0f1f84006c2a002d               nop        dword ptr [rax + rax + 0x2d002a6c]
0297c 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
02986 4883e4f0                       and        rsp, 0xfffffffffffffff0
0298a e851851418                     call       0x7f6aafd1e560
0298f f4                             hlt        
02990 48bf80916b706a7f0000           movabs     rdi, 0x7f6a706b9180
0299a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0299e e83d851418                     call       0x7f6aafd1e560
029a3 f4                             hlt        
029a4 48bf80916b706a7f0000           movabs     rdi, 0x7f6a706b9180
029ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
029b2 e829851418                     call       0x7f6aafd1e560
029b7 f4                             hlt        
029b8 48bf80916b706a7f0000           movabs     rdi, 0x7f6a706b9180
029c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
029c6 e815851418                     call       0x7f6aafd1e560
029cb f4                             hlt        
029cc 48bf80916b706a7f0000           movabs     rdi, 0x7f6a706b9180
029d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
029da e801851418                     call       0x7f6aafd1e560
029df f4                             hlt        
029e0 48bf80916b706a7f0000           movabs     rdi, 0x7f6a706b9180
029ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
029ee e8ed841418                     call       0x7f6aafd1e560
029f3 f4                             hlt        
029f4 48bf80916b706a7f0000           movabs     rdi, 0x7f6a706b9180
029fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a02 e8d9841418                     call       0x7f6aafd1e560
02a07 f4                             hlt        
02a08 48bf80916b706a7f0000           movabs     rdi, 0x7f6a706b9180
02a12 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a16 e8c5841418                     call       0x7f6aafd1e560
02a1b f4                             hlt        
02a1c 48bf80916b706a7f0000           movabs     rdi, 0x7f6a706b9180
02a26 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a2a e8b1841418                     call       0x7f6aafd1e560
02a2f f4                             hlt        
02a30 48bf80916b706a7f0000           movabs     rdi, 0x7f6a706b9180
02a3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a3e e89d841418                     call       0x7f6aafd1e560
02a43 f4                             hlt        
02a44 48bf80916b706a7f0000           movabs     rdi, 0x7f6a706b9180
02a4e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a52 e889841418                     call       0x7f6aafd1e560
02a57 f4                             hlt        
02a58 bef6ffffff                     mov        esi, 0xfffffff6
02a5d 488bea                         mov        rbp, rdx
02a60 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
02a68 c5f877                         vzeroupper 
02a6b e87079afff                     call       0x7f6a976cda60
02a70 0f1f8400682b002e               nop        dword ptr [rax + rax + 0x2e002b68]
02a78 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
02a82 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a86 e855841418                     call       0x7f6aafd1e560
02a8b f4                             hlt        
02a8c 488bf0                         mov        rsi, rax
02a8f eb0d                           jmp        0x7f6a97bd611e
02a91 488bf0                         mov        rsi, rax
02a94 eb08                           jmp        0x7f6a97bd611e
02a96 488bf0                         mov        rsi, rax
02a99 eb03                           jmp        0x7f6a97bd611e
02a9b 488bf0                         mov        rsi, rax
02a9e c5f877                         vzeroupper 
02aa1 4881c4c0000000                 add        rsp, 0xc0
02aa8 5d                             pop        rbp
02aa9 e9b202afff                     jmp        0x7f6a976c63e0
02aae bef6ffffff                     mov        esi, 0xfffffff6
02ab3 90                             nop        
02ab4 c5f877                         vzeroupper 
02ab7 e82479afff                     call       0x7f6a976cda60
02abc 0f1f8400b42b002f               nop        dword ptr [rax + rax + 0x2f002bb4]
02ac4 48bf10406b706a7f0000           movabs     rdi, 0x7f6a706b4010
02ace 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ad2 e809841418                     call       0x7f6aafd1e560
02ad7 f4                             hlt        
02ad8 49ba6a43bd976a7f0000           movabs     r10, 0x7f6a97bd436a
02ae2 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02ae9 e9f2c1b5ff                     jmp        0x7f6a97732360
02aee e86d90b4ff                     call       0x7f6a9771f1e0
02af3 e946d5ffff                     jmp        0x7f6a97bd36be
