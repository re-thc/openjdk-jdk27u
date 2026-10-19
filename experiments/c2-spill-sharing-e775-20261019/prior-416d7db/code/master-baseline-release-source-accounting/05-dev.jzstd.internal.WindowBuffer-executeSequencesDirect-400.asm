00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c0c1a9ff                   jne        0x7ffaeb8fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecc0000000                 sub        rsp, 0xc0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f8584240000                   jne        0x7ffaebe60c42
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
00068 0f8f621e0000                   jg         0x7ffaebe60650
0006e 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00072 4c89442420                     mov        qword ptr [rsp + 0x20], r8
00077 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
0007b 48638c24d0000000               movsxd     rcx, dword ptr [rsp + 0xd0]
00083 4d63ca                         movsxd     r9, r10d
00086 4c034c2420                     add        r9, qword ptr [rsp + 0x20]
0008b 4d2bc1                         sub        r8, r9
0008e 493bc8                         cmp        rcx, r8
00091 0f8f391e0000                   jg         0x7ffaebe60650
00097 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
0009b 4c89442458                     mov        qword ptr [rsp + 0x58], r8
000a0 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000a4 4d85c0                         test       r8, r8
000a7 0f84c2120000                   je         0x7ffaebe5faef
000ad 33db                           xor        ebx, ebx
000af 4c8bf2                         mov        r14, rdx
000b2 8b7204                         mov        esi, dword ptr [rdx + 4]
000b5 4c8b4c2460                     mov        r9, qword ptr [rsp + 0x60]
000ba 418b4940                       mov        ecx, dword ptr [r9 + 0x40]
000be 448bef                         mov        r13d, edi
000c1 85ff                           test       edi, edi
000c3 0f8ef3180000                   jle        0x7ffaebe6013c
000c9 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
000d1 4c2b442420                     sub        r8, qword ptr [rsp + 0x20]
000d6 448d4ee0                       lea        r9d, [rsi - 0x20]
000da 8b7c2468                       mov        edi, dword ptr [rsp + 0x68]
000de 83c7e0                         add        edi, -0x20
000e1 458b5304                       mov        r10d, dword ptr [r11 + 4]
000e5 4585d2                         test       r10d, r10d
000e8 0f86fa1d0000                   jbe        0x7ffaebe60668
000ee 4d63d2                         movsxd     r10, r10d
000f1 4963d5                         movsxd     rdx, r13d
000f4 48ffca                         dec        rdx
000f7 493bd2                         cmp        rdx, r10
000fa 0f83e81d0000                   jae        0x7ffaebe60668
00100 85db                           test       ebx, ebx
00102 0f84e01d0000                   je         0x7ffaebe60668
00108 488bac24d8000000               mov        rbp, qword ptr [rsp + 0xd8]
00110 8b4504                         mov        eax, dword ptr [rbp + 4]
00113 85c0                           test       eax, eax
00115 0f86191e0000                   jbe        0x7ffaebe606b4
0011b 83f801                         cmp        eax, 1
0011e 0f86101e0000                   jbe        0x7ffaebe606b4
00124 83f802                         cmp        eax, 2
00127 0f86071e0000                   jbe        0x7ffaebe606b4
0012d 448d56f1                       lea        r10d, [rsi - 0xf]
00131 4585d2                         test       r10d, r10d
00134 0f8cfa1d0000                   jl         0x7ffaebe606b4
0013a 8b5104                         mov        edx, dword ptr [rcx + 4]
0013d 448d52f1                       lea        r10d, [rdx - 0xf]
00141 4585d2                         test       r10d, r10d
00144 0f8cea1d0000                   jl         0x7ffaebe606b4
0014a 448d52f9                       lea        r10d, [rdx - 7]
0014e 4585d2                         test       r10d, r10d
00151 0f8cdd1d0000                   jl         0x7ffaebe606b4
00157 899424d8000000                 mov        dword ptr [rsp + 0xd8], edx
0015e 898424d4000000                 mov        dword ptr [rsp + 0xd4], eax
00165 897c243c                       mov        dword ptr [rsp + 0x3c], edi
00169 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0016e 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
00172 4c89442470                     mov        qword ptr [rsp + 0x70], r8
00177 48896c2430                     mov        qword ptr [rsp + 0x30], rbp
0017c 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
00181 44896c2408                     mov        dword ptr [rsp + 8], r13d
00186 4c89742440                     mov        qword ptr [rsp + 0x40], r14
0018b 89b424d0000000                 mov        dword ptr [rsp + 0xd0], esi
00192 89b424dc000000                 mov        dword ptr [rsp + 0xdc], esi
00199 4c8bd1                         mov        r10, rcx
0019c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001a1 894c2448                       mov        dword ptr [rsp + 0x48], ecx
001a5 448d5ef1                       lea        r11d, [rsi - 0xf]
001a9 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
001ae 448bc2                         mov        r8d, edx
001b1 458d50f1                       lea        r10d, [r8 - 0xf]
001b5 4489542478                     mov        dword ptr [rsp + 0x78], r10d
001ba 458d58f9                       lea        r11d, [r8 - 7]
001be 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
001c3 4d63d0                         movsxd     r10, r8d
001c6 4c89542428                     mov        qword ptr [rsp + 0x28], r10
001cb 4983c2f9                       add        r10, -7
001cf 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
001d7 4533d2                         xor        r10d, r10d
001da 4533c9                         xor        r9d, r9d
001dd e903040000                     jmp        0x7ffaebe5ed65
001e2 448bdd                         mov        r11d, ebp
001e5 4d63d3                         movsxd     r10, r11d
001e8 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
001ef c442a8f5db                     bzhi       r11, r11, r10
001f4 c4c1fb92fb                     kmovq      k7, r11
001f9 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
001ff 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00205 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
0020d 4403d5                         add        r10d, ebp
00210 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00218 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0021c 418502                         test       dword ptr [r10], eax
0021f 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00227 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
0022f 0f8d37090000                   jge        0x7ffaebe5f2ec
00235 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
0023d 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00245 442b94248c000000               sub        r10d, dword ptr [rsp + 0x8c]
0024d 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00255 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
0025c 2bac248c000000                 sub        ebp, dword ptr [rsp + 0x8c]
00263 3bac248c000000                 cmp        ebp, dword ptr [rsp + 0x8c]
0026a 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00272 410f4fea                       cmovg      ebp, r10d
00276 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0027e 4585db                         test       r11d, r11d
00281 0f8cbd160000                   jl         0x7ffaebe600c4
00287 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0028f 4585d2                         test       r10d, r10d
00292 0f8cac160000                   jl         0x7ffaebe600c4
00298 458d142b                       lea        r10d, [r11 + rbp]
0029c 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
002a4 453bda                         cmp        r11d, r10d
002a7 0f8297160000                   jb         0x7ffaebe600c4
002ad 448bac249c000000               mov        r13d, dword ptr [rsp + 0x9c]
002b5 4403ed                         add        r13d, ebp
002b8 453bdd                         cmp        r11d, r13d
002bb 0f8283160000                   jb         0x7ffaebe600c4
002c1 85ed                           test       ebp, ebp
002c3 0f8c7b160000                   jl         0x7ffaebe600c4
002c9 85ed                           test       ebp, ebp
002cb 0f8434ffffff                   je         0x7ffaebe5e985
002d1 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
002d6 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
002de 4b8d741008                     lea        rsi, [r8 + r10 + 8]
002e3 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
002eb 4b8d7c1008                     lea        rdi, [r8 + r10 + 8]
002f0 4863d5                         movsxd     rdx, ebp
002f3 4883fa20                       cmp        rdx, 0x20
002f7 0f86e5feffff                   jbe        0x7ffaebe5e962
002fd c5f877                         vzeroupper 
00300 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
0030a 41ffd2                         call       r10
0030d 0f1f840000000000               nop        dword ptr [rax + rax]
00315 e9ebfeffff                     jmp        0x7ffaebe5e985
0031a 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00322 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00327 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
0032e 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00336 4503da                         add        r11d, r10d
00339 e981020000                     jmp        0x7ffaebe5ed3f
0033e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00343 4b8d7c0b08                     lea        rdi, [r11 + r9 + 8]
00348 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00350 4b8d741308                     lea        rsi, [r11 + r10 + 8]
00355 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0035d 44039c2494000000               add        r11d, dword ptr [rsp + 0x94]
00365 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
0036d 4963d3                         movsxd     rdx, r11d
00370 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00378 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
00380 0f8c6a050000                   jl         0x7ffaebe5f070
00386 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0038e 4183fb30                       cmp        r11d, 0x30
00392 0f8ea3000000                   jle        0x7ffaebe5ebbb
00398 4585c9                         test       r9d, r9d
0039b 0f8c1f150000                   jl         0x7ffaebe60040
003a1 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
003a9 4585db                         test       r11d, r11d
003ac 0f8c0e150000                   jl         0x7ffaebe60040
003b2 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
003ba 4503d1                         add        r10d, r9d
003bd 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
003c5 453bc2                         cmp        r8d, r10d
003c8 0f82f2140000                   jb         0x7ffaebe60040
003ce 443b842498000000               cmp        r8d, dword ptr [rsp + 0x98]
003d6 0f82e4140000                   jb         0x7ffaebe60040
003dc 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
003e4 4585d2                         test       r10d, r10d
003e7 0f84c2010000                   je         0x7ffaebe5ed2f
003ed 4963d2                         movsxd     rdx, r10d
003f0 4883fa20                       cmp        rdx, 0x20
003f4 7728                           ja         0x7ffaebe5eb9e
003f6 458bda                         mov        r11d, r10d
003f9 4d63d3                         movsxd     r10, r11d
003fc 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00403 c442a8f5db                     bzhi       r11, r11, r10
00408 c4c1fb92fb                     kmovq      k7, r11
0040d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00413 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00419 e991010000                     jmp        0x7ffaebe5ed2f
0041e c5f877                         vzeroupper 
00421 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
0042b 41ffd2                         call       r10
0042e 0f1f840000000000               nop        dword ptr [rax + rax]
00436 e974010000                     jmp        0x7ffaebe5ed2f
0043b 443b4c247c                     cmp        r9d, dword ptr [rsp + 0x7c]
00440 0f8372120000                   jae        0x7ffaebe5fe38
00446 4963f9                         movsxd     rdi, r9d
00449 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0044e 498b5c3a08                     mov        rbx, qword ptr [r10 + rdi + 8]
00453 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0045b 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
00460 0f83ca120000                   jae        0x7ffaebe5feb0
00466 418d4a08                       lea        ecx, [r10 + 8]
0046a 4d63da                         movsxd     r11, r10d
0046d 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00472 4b895c1808                     mov        qword ptr [r8 + r11 + 8], rbx
00477 3b8c2498000000                 cmp        ecx, dword ptr [rsp + 0x98]
0047e 0f8d2b010000                   jge        0x7ffaebe5ed2f
00484 492bfb                         sub        rdi, r11
00487 4c63c1                         movsxd     r8, ecx
0048a 4d8d1c38                       lea        r11, [r8 + rdi]
0048e 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
00496 0f8310130000                   jae        0x7ffaebe5ff2c
0049c 4c8bda                         mov        r11, rdx
0049f 4d2bd8                         sub        r11, r8
004a2 4983c307                       add        r11, 7
004a6 4983e3f8                       and        r11, 0xfffffffffffffff8
004aa 458bc3                         mov        r8d, r11d
004ad 478d5c1008                     lea        r11d, [r8 + r10 + 8]
004b2 4d63db                         movsxd     r11, r11d
004b5 4d8d443bf8                     lea        r8, [r11 + rdi - 8]
004ba 4c3b842480000000               cmp        r8, qword ptr [rsp + 0x80]
004c2 0f83e4120000                   jae        0x7ffaebe5ff2c
004c8 3b4c247c                       cmp        ecx, dword ptr [rsp + 0x7c]
004cc 0f83da120000                   jae        0x7ffaebe5ff2c
004d2 4983c3f8                       add        r11, -8
004d6 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
004de 0f83c8120000                   jae        0x7ffaebe5ff2c
004e4 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
004ec 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
004f3 0f8f3b130000                   jg         0x7ffaebe5ffb4
004f9 452bca                         sub        r9d, r10d
004fc 4183c210                       add        r10d, 0x10
00500 458d0409                       lea        r8d, [r9 + rcx]
00504 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00509 4b8b5c0308                     mov        rbx, qword ptr [r11 + r8 + 8]
0050e 448bc1                         mov        r8d, ecx
00511 4b895c0308                     mov        qword ptr [r11 + r8 + 8], rbx
00516 83c108                         add        ecx, 8
00519 413bca                         cmp        ecx, r10d
0051c 7ce2                           jl         0x7ffaebe5ec80
0051e 4883c2f8                       add        rdx, -8
00522 4881fa00000080                 cmp        rdx, -0x80000000
00529 49c7c200000080                 mov        r10, 0xffffffff80000000
00530 490f4cd2                       cmovl      rdx, r10
00534 8bda                           mov        ebx, edx
00536 3bcb                           cmp        ecx, ebx
00538 7d42                           jge        0x7ffaebe5ecfc
0053a 660f1f440000                   nop        word ptr [rax + rax]
00540 458d0409                       lea        r8d, [r9 + rcx]
00544 448bd9                         mov        r11d, ecx
00547 4963fb                         movsxd     rdi, r11d
0054a 418bd0                         mov        edx, r8d
0054d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00552 4d8b541208                     mov        r10, qword ptr [r10 + rdx + 8]
00557 4d63c0                         movsxd     r8, r8d
0055a 8bd1                           mov        edx, ecx
0055c 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00561 4d89541308                     mov        qword ptr [r11 + rdx + 8], r10
00566 4f8b5c0310                     mov        r11, qword ptr [r11 + r8 + 0x10]
0056b 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00570 4d895c3a10                     mov        qword ptr [r10 + rdi + 0x10], r11
00575 83c110                         add        ecx, 0x10
00578 3bcb                           cmp        ecx, ebx
0057a 7cc4                           jl         0x7ffaebe5ecc0
0057c 3b8c2498000000                 cmp        ecx, dword ptr [rsp + 0x98]
00583 7d2a                           jge        0x7ffaebe5ed2f
00585 666690                         nop        
00588 458d1409                       lea        r10d, [r9 + rcx]
0058c 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00591 4f8b5c1008                     mov        r11, qword ptr [r8 + r10 + 8]
00596 448bc1                         mov        r8d, ecx
00599 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0059e 4f895c0208                     mov        qword ptr [r10 + r8 + 8], r11
005a3 83c108                         add        ecx, 8
005a6 3b8c2498000000                 cmp        ecx, dword ptr [rsp + 0x98]
005ad 7cd9                           jl         0x7ffaebe5ed08
005af 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
005b7 44039c2488000000               add        r11d, dword ptr [rsp + 0x88]
005bf 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
005c7 41ffc1                         inc        r9d
005ca 443b4c2408                     cmp        r9d, dword ptr [rsp + 8]
005cf 0f8dc9050000                   jge        0x7ffaebe5f31e
005d5 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
005dd 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
005e5 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
005ea 4f8b44cb08                     mov        r8, qword ptr [r11 + r9*8 + 8]
005ef 458bd8                         mov        r11d, r8d
005f2 4181e3ffff0100                 and        r11d, 0x1ffff
005f9 418bc3                         mov        eax, r11d
005fc 4d8bd8                         mov        r11, r8
005ff 49c1eb12                       shr        r11, 0x12
00603 49c1f824                       sar        r8, 0x24
00607 458bdb                         mov        r11d, r11d
0060a 458bc0                         mov        r8d, r8d
0060d 418bf8                         mov        edi, r8d
00610 4181e3ffff0300                 and        r11d, 0x3ffff
00617 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
0061f 4585c0                         test       r8d, r8d
00622 0f8cdc0e0000                   jl         0x7ffaebe5fc84
00628 448bd8                         mov        r11d, eax
0062b 4585db                         test       r11d, r11d
0062e 0f85d4010000                   jne        0x7ffaebe5ef88
00634 4533db                         xor        r11d, r11d
00637 418bc3                         mov        eax, r11d
0063a 83ff03                         cmp        edi, 3
0063d 0f8ef5010000                   jle        0x7ffaebe5efb8
00643 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00648 458b430c                       mov        r8d, dword ptr [r11 + 0xc]
0064c 45894310                       mov        dword ptr [r11 + 0x10], r8d
00650 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00654 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00659 4589580c                       mov        dword ptr [r8 + 0xc], r11d
0065d 448d5ffd                       lea        r11d, [rdi - 3]
00661 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
00669 4d8bd8                         mov        r11, r8
0066c 448b84248c000000               mov        r8d, dword ptr [rsp + 0x8c]
00674 45894308                       mov        dword ptr [r11 + 8], r8d
00678 44898c24a8000000               mov        dword ptr [rsp + 0xa8], r9d
00680 48639c248c000000               movsxd     rbx, dword ptr [rsp + 0x8c]
00688 488beb                         mov        rbp, rbx
0068b 4c639c2494000000               movsxd     r11, dword ptr [rsp + 0x94]
00693 4c035c2420                     add        r11, qword ptr [rsp + 0x20]
00698 4863d0                         movsxd     rdx, eax
0069b 4c03da                         add        r11, rdx
0069e 493bdb                         cmp        rbx, r11
006a1 0f8fc50e0000                   jg         0x7ffaebe5fcec
006a7 448b84248c000000               mov        r8d, dword ptr [rsp + 0x8c]
006af 4585c0                         test       r8d, r8d
006b2 0f8e2c0e0000                   jle        0x7ffaebe5fc64
006b8 8b9c2494000000                 mov        ebx, dword ptr [rsp + 0x94]
006bf 03d8                           add        ebx, eax
006c1 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
006c9 4403c3                         add        r8d, ebx
006cc 443b44243c                     cmp        r8d, dword ptr [rsp + 0x3c]
006d1 0f8f0d0f0000                   jg         0x7ffaebe5fd64
006d7 458d1c02                       lea        r11d, [r10 + rax]
006db 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
006e3 443b5c2438                     cmp        r11d, dword ptr [rsp + 0x38]
006e8 0f8f6e0f0000                   jg         0x7ffaebe5fddc
006ee 83f810                         cmp        eax, 0x10
006f1 0f8f56050000                   jg         0x7ffaebe5f3cd
006f7 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
006fc 0f838c0c0000                   jae        0x7ffaebe5fb0e
00702 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00707 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
0070e 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00716 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
0071b 0f83df0c0000                   jae        0x7ffaebe5fb80
00721 468d0410                       lea        r8d, [rax + r10]
00725 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
0072d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00732 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
00739 468d1418                       lea        r10d, [rax + r11]
0073d 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00745 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
0074d 442b8c248c000000               sub        r9d, dword ptr [rsp + 0x8c]
00755 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
0075d 4183fa10                       cmp        r10d, 0x10
00761 0f8fd7fbffff                   jg         0x7ffaebe5eabe
00767 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
0076f 4183fb10                       cmp        r11d, 0x10
00773 0f8cc5fbffff                   jl         0x7ffaebe5eabe
00779 443b4c2478                     cmp        r9d, dword ptr [rsp + 0x78]
0077e 0f83fc0c0000                   jae        0x7ffaebe5fc00
00784 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00789 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00790 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00798 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
0079d 0f8277fbffff                   jb         0x7ffaebe5ea9a
007a3 bee4ffffff                     mov        esi, 0xffffffe4
007a8 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
007ad 448b1424                       mov        r10d, dword ptr [rsp]
007b1 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
007b9 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
007be 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
007c6 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
007cb 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
007d3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
007d8 4c891424                       mov        qword ptr [rsp], r10
007dc 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
007e1 4489542408                     mov        dword ptr [rsp + 8], r10d
007e6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
007eb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
007f0 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
007f6 6690                           nop        
007f8 c5f877                         vzeroupper 
007fb e8e046b6ff                     call       0x7ffaeb9c3660
00800 0f1f8400f8080001               nop        dword ptr [rax + rax + 0x10008f8]
00808 448b1c24                       mov        r11d, dword ptr [rsp]
0080c 452bda                         sub        r11d, r10d
0080f 413bc3                         cmp        eax, r11d
00812 0f8e22feffff                   jle        0x7ffaebe5edba
00818 be45ffffff                     mov        esi, 0xffffff45
0081d 8be8                           mov        ebp, eax
0081f 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
00827 90                             nop        
00828 c5f877                         vzeroupper 
0082b e8b046b6ff                     call       0x7ffaeb9c3660
00830 0f1f840028090002               nop        dword ptr [rax + rax + 0x2000928]
00838 85c0                           test       eax, eax
0083a 7407                           je         0x7ffaebe5efc3
0083c 448d5fff                       lea        r11d, [rdi - 1]
00840 418bfb                         mov        edi, r11d
00843 85ff                           test       edi, edi
00845 0f8488000000                   je         0x7ffaebe5f053
0084b 83ff03                         cmp        edi, 3
0084e 0f8470120000                   je         0x7ffaebe60244
00854 83ff02                         cmp        edi, 2
00857 0f87d7120000                   ja         0x7ffaebe602b4
0085d 3bbc24d4000000                 cmp        edi, dword ptr [rsp + 0xd4]
00864 0f836b110000                   jae        0x7ffaebe60155
0086a 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
0086f 418b5cb808                     mov        ebx, dword ptr [r8 + rdi*4 + 8]
00874 85ff                           test       edi, edi
00876 7e48                           jle        0x7ffaebe5f040
00878 448d47ff                       lea        r8d, [rdi - 1]
0087c 443b8424d4000000               cmp        r8d, dword ptr [rsp + 0xd4]
00884 0f83c6110000                   jae        0x7ffaebe601d0
0088a 44898c24a8000000               mov        dword ptr [rsp + 0xa8], r9d
00892 0f1f8000000000                 nop        dword ptr [rax]
00899 0f1f8000000000                 nop        dword ptr [rax]
008a0 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
008a5 458b5cb804                     mov        r11d, dword ptr [r8 + rdi*4 + 4]
008aa 4d8bc8                         mov        r9, r8
008ad 45895cb908                     mov        dword ptr [r9 + rdi*4 + 8], r11d
008b2 448d5fff                       lea        r11d, [rdi - 1]
008b6 418bfb                         mov        edi, r11d
008b9 4585db                         test       r11d, r11d
008bc 7fe2                           jg         0x7ffaebe5f020
008be eb08                           jmp        0x7ffaebe5f048
008c0 44898c24a8000000               mov        dword ptr [rsp + 0xa8], r9d
008c8 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
008cd 41895b08                       mov        dword ptr [r11 + 8], ebx
008d1 eb11                           jmp        0x7ffaebe5f064
008d3 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
008d8 418b5b08                       mov        ebx, dword ptr [r11 + 8]
008dc 44898c24a8000000               mov        dword ptr [rsp + 0xa8], r9d
008e4 899c248c000000                 mov        dword ptr [rsp + 0x8c], ebx
008eb e990fdffff                     jmp        0x7ffaebe5ee00
008f0 4183fa10                       cmp        r10d, 0x10
008f4 0f8d7e150000                   jge        0x7ffaebe605f8
008fa 4183fa08                       cmp        r10d, 8
008fe 0f8d0f070000                   jge        0x7ffaebe5f793
00904 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
0090c 4183fa10                       cmp        r10d, 0x10
00910 0f8ec6000000                   jle        0x7ffaebe5f15c
00916 4585c9                         test       r9d, r9d
00919 0f8ce1140000                   jl         0x7ffaebe60580
0091f 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00927 4585db                         test       r11d, r11d
0092a 0f8cd0140000                   jl         0x7ffaebe60580
00930 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
00938 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
00940 0f82ba140000                   jb         0x7ffaebe60580
00946 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
0094e 4403942494000000               add        r10d, dword ptr [rsp + 0x94]
00956 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
0095e 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
00966 0f8294140000                   jb         0x7ffaebe60580
0096c 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00974 4585db                         test       r11d, r11d
00977 0f8c83140000                   jl         0x7ffaebe60580
0097d 4585db                         test       r11d, r11d
00980 0f84b7f8ffff                   je         0x7ffaebe5e9bd
00986 488bdd                         mov        rbx, rbp
00989 4883fb20                       cmp        rbx, 0x20
0098d 772d                           ja         0x7ffaebe5f13c
0098f 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00997 4d63d2                         movsxd     r10, r10d
0099a 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
009a1 c442a8f5db                     bzhi       r11, r11, r10
009a6 c4c1fb92fb                     kmovq      k7, r11
009ab 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
009b1 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
009b7 e981f8ffff                     jmp        0x7ffaebe5e9bd
009bc 488bd3                         mov        rdx, rbx
009bf c5f877                         vzeroupper 
009c2 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
009cc 41ffd2                         call       r10
009cf 0f1f840000000000               nop        dword ptr [rax + rax]
009d7 e961f8ffff                     jmp        0x7ffaebe5e9bd
009dc 443b8c24d8000000               cmp        r9d, dword ptr [rsp + 0xd8]
009e4 0f83ba110000                   jae        0x7ffaebe60324
009ea 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
009ef 430fbe6c0b08                   movsx      ebp, byte ptr [r11 + r9 + 8]
009f5 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
009fd 443b9c24d8000000               cmp        r11d, dword ptr [rsp + 0xd8]
00a05 0f8311120000                   jae        0x7ffaebe6039c
00a0b 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00a10 43886c1808                     mov        byte ptr [r8 + r11 + 8], bpl
00a15 458d5903                       lea        r11d, [r9 + 3]
00a19 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00a21 41ffc2                         inc        r10d
00a24 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00a2c 443b9c24d8000000               cmp        r11d, dword ptr [rsp + 0xd8]
00a34 0f835e120000                   jae        0x7ffaebe60418
00a3a 4d63d9                         movsxd     r11, r9d
00a3d 430fbe6c1809                   movsx      ebp, byte ptr [r8 + r11 + 9]
00a43 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00a4b 4183c203                       add        r10d, 3
00a4f 443b9424d8000000               cmp        r10d, dword ptr [rsp + 0xd8]
00a57 0f83bb120000                   jae        0x7ffaebe60498
00a5d 4c63842494000000               movsxd     r8, dword ptr [rsp + 0x94]
00a65 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00a6a 43886c0209                     mov        byte ptr [r10 + r8 + 9], bpl
00a6f 430fbe4c1a0a                   movsx      ecx, byte ptr [r10 + r11 + 0xa]
00a75 43884c020a                     mov        byte ptr [r10 + r8 + 0xa], cl
00a7a 418bca                         mov        ecx, r10d
00a7d 420fbe4c190b                   movsx      ecx, byte ptr [rcx + r11 + 0xb]
00a83 43884c020b                     mov        byte ptr [r10 + r8 + 0xb], cl
00a88 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00a90 4183fb08                       cmp        r11d, 8
00a94 0f83fa120000                   jae        0x7ffaebe60514
00a9a 49bb60ac28e300000000           movabs     r11, 0xe328ac60
00aa4 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00aac 47034c9308                     add        r9d, dword ptr [r11 + r10*4 + 8]
00ab1 44894c2404                     mov        dword ptr [rsp + 4], r9d
00ab6 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00abe 4183fa04                       cmp        r10d, 4
00ac2 7e40                           jle        0x7ffaebe5f284
00ac4 8bac2494000000                 mov        ebp, dword ptr [rsp + 0x94]
00acb 83c504                         add        ebp, 4
00ace 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00ad3 418bd1                         mov        edx, r9d
00ad6 6690                           nop        
00ad8 c5f877                         vzeroupper 
00adb e800c6a9ff                     call       0x7ffaeb8fb860
00ae0 0f1f8400d80b0003               nop        dword ptr [rax + rax + 0x3000bd8]
00ae8 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00aed 8bd5                           mov        edx, ebp
00aef 8bc8                           mov        ecx, eax
00af1 666690                         nop        
00af4 c5f877                         vzeroupper 
00af7 e8e4c5a9ff                     call       0x7ffaeb8fb860
00afc 0f1f8400f40b0004               nop        dword ptr [rax + rax + 0x4000bf4]
00b04 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00b0c 4183fa08                       cmp        r10d, 8
00b10 7e5a                           jle        0x7ffaebe5f2ec
00b12 8b542404                       mov        edx, dword ptr [rsp + 4]
00b16 49ba88ac28e300000000           movabs     r10, 0xe328ac88
00b20 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00b28 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
00b2d 8bac2494000000                 mov        ebp, dword ptr [rsp + 0x94]
00b34 83c508                         add        ebp, 8
00b37 83c208                         add        edx, 8
00b3a 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00b3f 90                             nop        
00b40 c5f877                         vzeroupper 
00b43 e898c5a9ff                     call       0x7ffaeb8fb860
00b48 0f1f8400400c0005               nop        dword ptr [rax + rax + 0x5000c40]
00b50 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00b55 8bd5                           mov        edx, ebp
00b57 488bc8                         mov        rcx, rax
00b5a 6690                           nop        
00b5c c5f877                         vzeroupper 
00b5f e87cc5a9ff                     call       0x7ffaeb8fb860
00b64 0f1f84005c0c0006               nop        dword ptr [rax + rax + 0x6000c5c]
00b6c 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00b74 e946faffff                     jmp        0x7ffaebe5ed3f
00b79 4d63d2                         movsxd     r10, r10d
00b7c 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b83 c442a8f5db                     bzhi       r11, r11, r10
00b88 c4c1fb92fb                     kmovq      k7, r11
00b8d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b93 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b99 e990000000                     jmp        0x7ffaebe5f3ae
00b9e 448b1424                       mov        r10d, dword ptr [rsp]
00ba2 442b942490000000               sub        r10d, dword ptr [rsp + 0x90]
00baa 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
00bb2 4585c0                         test       r8d, r8d
00bb5 0f8cc9130000                   jl         0x7ffaebe60704
00bbb 4c8b742440                     mov        r14, qword ptr [rsp + 0x40]
00bc0 8bb424d0000000                 mov        esi, dword ptr [rsp + 0xd0]
00bc7 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00bcb 4585db                         test       r11d, r11d
00bce 0f8cb9130000                   jl         0x7ffaebe6070d
00bd4 3b3424                         cmp        esi, dword ptr [rsp]
00bd7 0f82b0130000                   jb         0x7ffaebe6070d
00bdd 448b4904                       mov        r9d, dword ptr [rcx + 4]
00be1 438d1c13                       lea        ebx, [r11 + r10]
00be5 443bcb                         cmp        r9d, ebx
00be8 0f829f130000                   jb         0x7ffaebe6070d
00bee 4585d2                         test       r10d, r10d
00bf1 0f8c96130000                   jl         0x7ffaebe6070d
00bf7 4585d2                         test       r10d, r10d
00bfa 7432                           je         0x7ffaebe5f3ae
00bfc 4b8d7c0608                     lea        rdi, [r14 + r8 + 8]
00c01 4c8bc1                         mov        r8, rcx
00c04 4a8d741908                     lea        rsi, [rcx + r11 + 8]
00c09 4963d2                         movsxd     rdx, r10d
00c0c 4883fa20                       cmp        rdx, 0x20
00c10 0f8663ffffff                   jbe        0x7ffaebe5f2f9
00c16 c5f877                         vzeroupper 
00c19 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
00c23 41ffd2                         call       r10
00c26 0f1f840000000000               nop        dword ptr [rax + rax]
00c2e 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00c33 41895a38                       mov        dword ptr [r10 + 0x38], ebx
00c37 c5f877                         vzeroupper 
00c3a 4881c4c0000000                 add        rsp, 0xc0
00c41 5d                             pop        rbp
00c42 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00c46 0f8760180000                   ja         0x7ffaebe60c2c
00c4c c3                             ret        
00c4d 83f830                         cmp        eax, 0x30
00c50 0f8ea8000000                   jle        0x7ffaebe5f47e
00c56 4585d2                         test       r10d, r10d
00c59 0f8c85160000                   jl         0x7ffaebe60a64
00c5f 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
00c67 4585c9                         test       r9d, r9d
00c6a 0f8c7c160000                   jl         0x7ffaebe60a6c
00c70 448b9c24d0000000               mov        r11d, dword ptr [rsp + 0xd0]
00c78 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
00c80 0f8266160000                   jb         0x7ffaebe60a6c
00c86 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
00c8e 443bc3                         cmp        r8d, ebx
00c91 0f8255160000                   jb         0x7ffaebe60a6c
00c97 85c0                           test       eax, eax
00c99 743d                           je         0x7ffaebe5f458
00c9b 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00ca0 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00ca5 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00caa 4b8d740b08                     lea        rsi, [r11 + r9 + 8]
00caf 4883fa20                       cmp        rdx, 0x20
00cb3 772f                           ja         0x7ffaebe5f464
00cb5 448bd0                         mov        r10d, eax
00cb8 4d63d2                         movsxd     r10, r10d
00cbb 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00cc2 c442a8f5db                     bzhi       r11, r11, r10
00cc7 c4c1fb92fb                     kmovq      k7, r11
00ccc 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00cd2 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00cd8 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
00cdf e961faffff                     jmp        0x7ffaebe5eec5
00ce4 c5f877                         vzeroupper 
00ce7 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
00cf1 41ffd2                         call       r10
00cf4 0f1f840000000000               nop        dword ptr [rax + rax]
00cfc ebda                           jmp        0x7ffaebe5f458
00cfe 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
00d03 0f83cb140000                   jae        0x7ffaebe60954
00d09 4d63c2                         movsxd     r8, r10d
00d0c 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00d11 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
00d18 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00d20 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00d25 0f832d150000                   jae        0x7ffaebe609d8
00d2b 418d7310                       lea        esi, [r11 + 0x10]
00d2f 89b42490000000                 mov        dword ptr [rsp + 0x90], esi
00d36 4d63cb                         movsxd     r9, r11d
00d39 8b742448                       mov        esi, dword ptr [rsp + 0x48]
00d3d c4a17a7f440e08                 vmovdqu    xmmword ptr [rsi + r9 + 8], xmm0
00d44 8bb42490000000                 mov        esi, dword ptr [rsp + 0x90]
00d4b 3bf3                           cmp        esi, ebx
00d4d 0f8da8020000                   jge        0x7ffaebe5f77b
00d53 4d2bc1                         sub        r8, r9
00d56 4c63ce                         movsxd     r9, esi
00d59 4863bc24dc000000               movsxd     rdi, dword ptr [rsp + 0xdc]
00d61 4883c7f1                       add        rdi, -0xf
00d65 4b8d0c01                       lea        rcx, [r9 + r8]
00d69 483bcf                         cmp        rcx, rdi
00d6c 0f83fa150000                   jae        0x7ffaebe60aec
00d72 4863d3                         movsxd     rdx, ebx
00d75 488bca                         mov        rcx, rdx
00d78 492bc9                         sub        rcx, r9
00d7b 4883c10f                       add        rcx, 0xf
00d7f 4883e1f0                       and        rcx, 0xfffffffffffffff0
00d83 8bc9                           mov        ecx, ecx
00d85 468d4c1910                     lea        r9d, [rcx + r11 + 0x10]
00d8a 4d63c9                         movsxd     r9, r9d
00d8d 4f8d4401f0                     lea        r8, [r9 + r8 - 0x10]
00d92 4c3bc7                         cmp        r8, rdi
00d95 0f83d1150000                   jae        0x7ffaebe60aec
00d9b 3b742478                       cmp        esi, dword ptr [rsp + 0x78]
00d9f 0f83c7150000                   jae        0x7ffaebe60aec
00da5 4983c1f0                       add        r9, -0x10
00da9 4c8b442428                     mov        r8, qword ptr [rsp + 0x28]
00dae 4983c0f1                       add        r8, -0xf
00db2 4d3bc8                         cmp        r9, r8
00db5 0f83b1150000                   jae        0x7ffaebe60aec
00dbb 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00dc1 0f8f19160000                   jg         0x7ffaebe60b60
00dc7 418bfa                         mov        edi, r10d
00dca 412bfb                         sub        edi, r11d
00dcd 4183c320                       add        r11d, 0x20
00dd1 666690                         nop        
00dd4 448bc7                         mov        r8d, edi
00dd7 4403842490000000               add        r8d, dword ptr [rsp + 0x90]
00ddf 4c8b4c2440                     mov        r9, qword ptr [rsp + 0x40]
00de4 c4817a6f440108                 vmovdqu    xmm0, xmmword ptr [r9 + r8 + 8]
00deb 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
00df3 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00df8 c4817a7f440808                 vmovdqu    xmmword ptr [r8 + r9 + 8], xmm0
00dff 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
00e07 4183c010                       add        r8d, 0x10
00e0b 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00e13 453bc3                         cmp        r8d, r11d
00e16 7cbc                           jl         0x7ffaebe5f554
00e18 4881c210ffffff                 add        rdx, -0xf0
00e1f 4881fa00000080                 cmp        rdx, -0x80000000
00e26 49c7c300000080                 mov        r11, 0xffffffff80000000
00e2d 490f4cd3                       cmovl      rdx, r11
00e31 448bda                         mov        r11d, edx
00e34 453bc3                         cmp        r8d, r11d
00e37 0f8d89010000                   jge        0x7ffaebe5f746
00e3d 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00e45 6666660f1f840000000000         nop        word ptr [rax + rax]
00e50 448bc7                         mov        r8d, edi
00e53 4403842490000000               add        r8d, dword ptr [rsp + 0x90]
00e5b 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
00e63 4963c9                         movsxd     rcx, r9d
00e66 418bd0                         mov        edx, r8d
00e69 4c8b4c2440                     mov        r9, qword ptr [rsp + 0x40]
00e6e c4c17a6f441108                 vmovdqu    xmm0, xmmword ptr [r9 + rdx + 8]
00e75 4963d0                         movsxd     rdx, r8d
00e78 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
00e80 8b742448                       mov        esi, dword ptr [rsp + 0x48]
00e84 c4a17a7f440608                 vmovdqu    xmmword ptr [rsi + r8 + 8], xmm0
00e8b c4c17a6f441118                 vmovdqu    xmm0, xmmword ptr [r9 + rdx + 0x18]
00e92 c5fa7f440e18                   vmovdqu    xmmword ptr [rsi + rcx + 0x18], xmm0
00e98 c4c17a6f441128                 vmovdqu    xmm0, xmmword ptr [r9 + rdx + 0x28]
00e9f c5fa7f440e28                   vmovdqu    xmmword ptr [rsi + rcx + 0x28], xmm0
00ea5 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
00eaa c4c17a6f441038                 vmovdqu    xmm0, xmmword ptr [r8 + rdx + 0x38]
00eb1 c5fa7f440e38                   vmovdqu    xmmword ptr [rsi + rcx + 0x38], xmm0
00eb7 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
00ebc c4c17a6f441048                 vmovdqu    xmm0, xmmword ptr [r8 + rdx + 0x48]
00ec3 c5fa7f440e48                   vmovdqu    xmmword ptr [rsi + rcx + 0x48], xmm0
00ec9 c4c17a6f441058                 vmovdqu    xmm0, xmmword ptr [r8 + rdx + 0x58]
00ed0 c5fa7f440e58                   vmovdqu    xmmword ptr [rsi + rcx + 0x58], xmm0
00ed6 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
00edb c4c17a6f441068                 vmovdqu    xmm0, xmmword ptr [r8 + rdx + 0x68]
00ee2 c5fa7f440e68                   vmovdqu    xmmword ptr [rsi + rcx + 0x68], xmm0
00ee8 c4c17a6f441078                 vmovdqu    xmm0, xmmword ptr [r8 + rdx + 0x78]
00eef c5fa7f440e78                   vmovdqu    xmmword ptr [rsi + rcx + 0x78], xmm0
00ef5 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
00efa c4c17a6f841088000000           vmovdqu    xmm0, xmmword ptr [r8 + rdx + 0x88]
00f04 c5fa7f840e88000000             vmovdqu    xmmword ptr [rsi + rcx + 0x88], xmm0
00f0d 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
00f12 c4c17a6f841098000000           vmovdqu    xmm0, xmmword ptr [r8 + rdx + 0x98]
00f1c c5fa7f840e98000000             vmovdqu    xmmword ptr [rsi + rcx + 0x98], xmm0
00f25 c4c17a6f8410a8000000           vmovdqu    xmm0, xmmword ptr [r8 + rdx + 0xa8]
00f2f c5fa7f840ea8000000             vmovdqu    xmmword ptr [rsi + rcx + 0xa8], xmm0
00f38 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
00f3d c4c17a6f8410b8000000           vmovdqu    xmm0, xmmword ptr [r8 + rdx + 0xb8]
00f47 c5fa7f840eb8000000             vmovdqu    xmmword ptr [rsi + rcx + 0xb8], xmm0
00f50 c4c17a6f8410c8000000           vmovdqu    xmm0, xmmword ptr [r8 + rdx + 0xc8]
00f5a c5fa7f840ec8000000             vmovdqu    xmmword ptr [rsi + rcx + 0xc8], xmm0
00f63 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
00f68 c4c17a6f8410d8000000           vmovdqu    xmm0, xmmword ptr [r8 + rdx + 0xd8]
00f72 c5fa7f840ed8000000             vmovdqu    xmmword ptr [rsi + rcx + 0xd8], xmm0
00f7b c4c17a6f8410e8000000           vmovdqu    xmm0, xmmword ptr [r8 + rdx + 0xe8]
00f85 c5fa7f840ee8000000             vmovdqu    xmmword ptr [rsi + rcx + 0xe8], xmm0
00f8e 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
00f93 c4c17a6f8410f8000000           vmovdqu    xmm0, xmmword ptr [r8 + rdx + 0xf8]
00f9d c5fa7f840ef8000000             vmovdqu    xmmword ptr [rsi + rcx + 0xf8], xmm0
00fa6 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
00fae 4181c100010000                 add        r9d, 0x100
00fb5 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
00fbd 453bcb                         cmp        r9d, r11d
00fc0 0f8c8afeffff                   jl         0x7ffaebe5f5d0
00fc6 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
00fce 443bc3                         cmp        r8d, ebx
00fd1 7d28                           jge        0x7ffaebe5f77b
00fd3 90                             nop        
00fd4 468d0c07                       lea        r9d, [rdi + r8]
00fd8 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00fdd c4817a6f440b08                 vmovdqu    xmm0, xmmword ptr [r11 + r9 + 8]
00fe4 458bd8                         mov        r11d, r8d
00fe7 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00feb c4a17a7f441908                 vmovdqu    xmmword ptr [rcx + r11 + 8], xmm0
00ff2 4183c010                       add        r8d, 0x10
00ff6 443bc3                         cmp        r8d, ebx
00ff9 7cd9                           jl         0x7ffaebe5f754
00ffb 468d1c10                       lea        r11d, [rax + r10]
00fff 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
01007 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
0100e e932f7ffff                     jmp        0x7ffaebe5eec5
01013 443b4c247c                     cmp        r9d, dword ptr [rsp + 0x7c]
01018 0f83a60f0000                   jae        0x7ffaebe60744
0101e 4963c9                         movsxd     rcx, r9d
01021 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01026 4d8b540b08                     mov        r10, qword ptr [r11 + rcx + 8]
0102b 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
01033 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0103b 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
01040 0f83f60f0000                   jae        0x7ffaebe607bc
01046 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
0104e 418d6808                       lea        ebp, [r8 + 8]
01052 4d63d8                         movsxd     r11, r8d
01055 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0105a 488b9c24a0000000               mov        rbx, qword ptr [rsp + 0xa0]
01062 4b895c1a08                     mov        qword ptr [r10 + r11 + 8], rbx
01067 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
0106e 0f8dee020000                   jge        0x7ffaebe5fae2
01074 492bcb                         sub        rcx, r11
01077 4863dd                         movsxd     rbx, ebp
0107a 4c8d140b                       lea        r10, [rbx + rcx]
0107e 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
01086 0f831c100000                   jae        0x7ffaebe60828
0108c 4c8bd2                         mov        r10, rdx
0108f 4c2bd3                         sub        r10, rbx
01092 4983c207                       add        r10, 7
01096 4983e2f8                       and        r10, 0xfffffffffffffff8
0109a 458bd2                         mov        r10d, r10d
0109d 478d5c0208                     lea        r11d, [r10 + r8 + 8]
010a2 4d63d3                         movsxd     r10, r11d
010a5 4d8d5c0af8                     lea        r11, [r10 + rcx - 8]
010aa 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
010b2 0f83f00f0000                   jae        0x7ffaebe60828
010b8 3b6c247c                       cmp        ebp, dword ptr [rsp + 0x7c]
010bc 0f83e60f0000                   jae        0x7ffaebe60828
010c2 4983c2f8                       add        r10, -8
010c6 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
010ce 0f83d40f0000                   jae        0x7ffaebe60828
010d4 b9f8ffffff                     mov        ecx, 0xfffffff8
010d9 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
010de 458bd3                         mov        r10d, r11d
010e1 412bca                         sub        ecx, r10d
010e4 412bc8                         sub        ecx, r8d
010e7 83c1f0                         add        ecx, -0x10
010ea 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
010ef 498bfa                         mov        rdi, r10
010f2 458d5010                       lea        r10d, [r8 + 0x10]
010f6 4d63d2                         movsxd     r10, r10d
010f9 41bb06000000                   mov        r11d, 6
010ff c462a0f5d9                     bzhi       r11, rcx, r11
01104 4d03d3                         add        r10, r11
01107 4c3bd2                         cmp        r10, rdx
0110a 488bca                         mov        rcx, rdx
0110d 490f4cca                       cmovl      rcx, r10
01111 4c8bd1                         mov        r10, rcx
01114 4c2bd3                         sub        r10, rbx
01117 4d8d5aff                       lea        r11, [r10 - 1]
0111b 49c1fb3f                       sar        r11, 0x3f
0111f 49c1eb3d                       shr        r11, 0x3d
01123 4f8d5413ff                     lea        r10, [r11 + r10 - 1]
01128 4983e2f8                       and        r10, 0xfffffffffffffff8
0112c 4c03d3                         add        r10, rbx
0112f 493bda                         cmp        rbx, r10
01132 490f4cda                       cmovl      rbx, r10
01136 448bd3                         mov        r10d, ebx
01139 418d5a08                       lea        ebx, [r10 + 8]
0113d 442b94248c000000               sub        r10d, dword ptr [rsp + 0x8c]
01145 4863db                         movsxd     rbx, ebx
01148 4803df                         add        rbx, rdi
0114b 4183c208                       add        r10d, 8
0114f 4d63d2                         movsxd     r10, r10d
01152 4c03d7                         add        r10, rdi
01155 488d7b48                       lea        rdi, [rbx + 0x48]
01159 4883c308                       add        rbx, 8
0115d 498d7208                       lea        rsi, [r10 + 8]
01161 4533db                         xor        r11d, r11d
01164 483bfe                         cmp        rdi, rsi
01167 410f96c3                       setbe      r11b
0116b 4983c248                       add        r10, 0x48
0116f 33f6                           xor        esi, esi
01171 4c3bd3                         cmp        r10, rbx
01174 400f96c6                       setbe      sil
01178 440bde                         or         r11d, esi
0117b 0f848b0f0000                   je         0x7ffaebe6088c
01181 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
01189 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
01190 0f8fda0f0000                   jg         0x7ffaebe608f0
01196 452bc8                         sub        r9d, r8d
01199 448bd1                         mov        r10d, ecx
0119c 458d0429                       lea        r8d, [r9 + rbp]
011a0 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
011a4 4e8b5c0108                     mov        r11, qword ptr [rcx + r8 + 8]
011a9 8bcd                           mov        ecx, ebp
011ab 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
011b0 4d895c0808                     mov        qword ptr [r8 + rcx + 8], r11
011b5 83c508                         add        ebp, 8
011b8 413bea                         cmp        ebp, r10d
011bb 7cdf                           jl         0x7ffaebe5f91c
011bd 4c8d9208feffff                 lea        r10, [rdx - 0x1f8]
011c4 4981fa00000080                 cmp        r10, -0x80000000
011cb 49c7c300000080                 mov        r11, 0xffffffff80000000
011d2 4d0f4cd3                       cmovl      r10, r11
011d6 418bfa                         mov        edi, r10d
011d9 3bef                           cmp        ebp, edi
011db 0f8d50010000                   jge        0x7ffaebe5fab1
011e1 0f1f840000000000               nop        dword ptr [rax + rax]
011e9 0f1f8000000000                 nop        dword ptr [rax]
011f0 448bdd                         mov        r11d, ebp
011f3 4d63db                         movsxd     r11, r11d
011f6 448bd5                         mov        r10d, ebp
011f9 458d0429                       lea        r8d, [r9 + rbp]
011fd 8d9d80000000                   lea        ebx, [rbp + 0x80]
01203 4103d9                         add        ebx, r9d
01206 418bc8                         mov        ecx, r8d
01209 8b742448                       mov        esi, dword ptr [rsp + 0x48]
0120d 62f17e486f840e08000000         vmovdqu32  zmm0, zmmword ptr [rsi + rcx + 8]
01218 62b17e487f841608000000         vmovdqu32  zmmword ptr [rsi + r10 + 8], zmm0
01223 4963c8                         movsxd     rcx, r8d
01226 62f17e486f840e48000000         vmovdqu32  zmm0, zmmword ptr [rsi + rcx + 0x48]
01231 62b17e487f841e48000000         vmovdqu32  zmmword ptr [rsi + r11 + 0x48], zmm0
0123c 448bd3                         mov        r10d, ebx
0123f 62b17e486f841608000000         vmovdqu32  zmm0, zmmword ptr [rsi + r10 + 8]
0124a 62b17e487f841e88000000         vmovdqu32  zmmword ptr [rsi + r11 + 0x88], zmm0
01255 4c63d3                         movsxd     r10, ebx
01258 62b17e486f841648000000         vmovdqu32  zmm0, zmmword ptr [rsi + r10 + 0x48]
01263 62b17e487f841ec8000000         vmovdqu32  zmmword ptr [rsi + r11 + 0xc8], zmm0
0126e 448d9500010000                 lea        r10d, [rbp + 0x100]
01275 4503d1                         add        r10d, r9d
01278 458bc2                         mov        r8d, r10d
0127b 62b17e486f841608000000         vmovdqu32  zmm0, zmmword ptr [rsi + r10 + 8]
01286 62b17e487f841e08010000         vmovdqu32  zmmword ptr [rsi + r11 + 0x108], zmm0
01291 4d63d0                         movsxd     r10, r8d
01294 62b17e486f841648000000         vmovdqu32  zmm0, zmmword ptr [rsi + r10 + 0x48]
0129f 62b17e487f841e48010000         vmovdqu32  zmmword ptr [rsi + r11 + 0x148], zmm0
012aa 62f17e486f840e88010000         vmovdqu32  zmm0, zmmword ptr [rsi + rcx + 0x188]
012b5 62b17e487f841e88010000         vmovdqu32  zmmword ptr [rsi + r11 + 0x188], zmm0
012c0 62f17e486f840ec8010000         vmovdqu32  zmm0, zmmword ptr [rsi + rcx + 0x1c8]
012cb 62b17e487f841ec8010000         vmovdqu32  zmmword ptr [rsi + r11 + 0x1c8], zmm0
012d6 81c500020000                   add        ebp, 0x200
012dc 3bef                           cmp        ebp, edi
012de 0f8c0cffffff                   jl         0x7ffaebe5f970
012e4 4883c2c8                       add        rdx, -0x38
012e8 4881fa00000080                 cmp        rdx, -0x80000000
012ef 49c7c200000080                 mov        r10, 0xffffffff80000000
012f6 490f4cd2                       cmovl      rdx, r10
012fa 448bd2                         mov        r10d, edx
012fd 413bea                         cmp        ebp, r10d
01300 7d2f                           jge        0x7ffaebe5fab1
01302 6690                           nop        
01304 458d1c29                       lea        r11d, [r9 + rbp]
01308 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0130d 62917e486f841808000000         vmovdqu32  zmm0, zmmword ptr [r8 + r11 + 8]
01318 448bdd                         mov        r11d, ebp
0131b 418bc8                         mov        ecx, r8d
0131e 62b17e487f841908000000         vmovdqu32  zmmword ptr [rcx + r11 + 8], zmm0
01329 83c540                         add        ebp, 0x40
0132c 413bea                         cmp        ebp, r10d
0132f 7cd3                           jl         0x7ffaebe5fa84
01331 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
01338 7d28                           jge        0x7ffaebe5fae2
0133a 6690                           nop        
0133c 458d1429                       lea        r10d, [r9 + rbp]
01340 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01345 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
0134a 448bdd                         mov        r11d, ebp
0134d 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
01351 4e89541908                     mov        qword ptr [rcx + r11 + 8], r10
01356 83c508                         add        ebp, 8
01359 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
01360 7cda                           jl         0x7ffaebe5fabc
01362 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
0136a e950f2ffff                     jmp        0x7ffaebe5ed3f
0136f 4c03c9                         add        r9, rcx
01372 4c3b4c2458                     cmp        r9, qword ptr [rsp + 0x58]
01377 7e08                           jle        0x7ffaebe5fb01
01379 4533c0                         xor        r8d, r8d
0137c e92cedffff                     jmp        0x7ffaebe5e82d
01381 4533c0                         xor        r8d, r8d
01384 bb01000000                     mov        ebx, 1
01389 e921edffff                     jmp        0x7ffaebe5e82f
0138e bee4ffffff                     mov        esi, 0xffffffe4
01393 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01398 448b1c24                       mov        r11d, dword ptr [rsp]
0139c 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
013a4 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
013a9 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
013b1 448b442408                     mov        r8d, dword ptr [rsp + 8]
013b6 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
013be 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
013c3 4c891c24                       mov        qword ptr [rsp], r11
013c7 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
013cc 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
013d1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
013d6 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
013db 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
013e0 4489442420                     mov        dword ptr [rsp + 0x20], r8d
013e5 89442428                       mov        dword ptr [rsp + 0x28], eax
013e9 4489542434                     mov        dword ptr [rsp + 0x34], r10d
013ee 6690                           nop        
013f0 c5f877                         vzeroupper 
013f3 e8e83ab6ff                     call       0x7ffaeb9c3660
013f8 0f1f8400f0140007               nop        dword ptr [rax + rax + 0x70014f0]
01400 bee4ffffff                     mov        esi, 0xffffffe4
01405 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0140a 448b0c24                       mov        r9d, dword ptr [rsp]
0140e 44898c24d0000000               mov        dword ptr [rsp + 0xd0], r9d
01416 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
0141b 4c898424d8000000               mov        qword ptr [rsp + 0xd8], r8
01423 448b442408                     mov        r8d, dword ptr [rsp + 8]
01428 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01430 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
01435 4c890424                       mov        qword ptr [rsp], r8
01439 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0143e 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01443 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01448 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0144d 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01452 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01457 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0145c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01461 89442428                       mov        dword ptr [rsp + 0x28], eax
01465 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0146a c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
01470 c5f877                         vzeroupper 
01473 e8683ab6ff                     call       0x7ffaeb9c3660
01478 0f1f840070150008               nop        dword ptr [rax + rax + 0x8001570]
01480 bee4ffffff                     mov        esi, 0xffffffe4
01485 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0148a 448b1c24                       mov        r11d, dword ptr [rsp]
0148e 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01496 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0149b 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
014a3 448b542408                     mov        r10d, dword ptr [rsp + 8]
014a8 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
014b0 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
014b5 4c891424                       mov        qword ptr [rsp], r10
014b9 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
014be 44895c2408                     mov        dword ptr [rsp + 8], r11d
014c3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
014c8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
014cd 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
014d2 6690                           nop        
014d4 c5f877                         vzeroupper 
014d7 e8043ab6ff                     call       0x7ffaeb9c3660
014dc 0f1f8400d4150009               nop        dword ptr [rax + rax + 0x90015d4]
014e4 be45ffffff                     mov        esi, 0xffffff45
014e9 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
014f1 666690                         nop        
014f4 c5f877                         vzeroupper 
014f7 e8e439b6ff                     call       0x7ffaeb9c3660
014fc 0f1f8400f415000a               nop        dword ptr [rax + rax + 0xa0015f4]
01504 be45ffffff                     mov        esi, 0xffffff45
01509 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0150e 448b1c24                       mov        r11d, dword ptr [rsp]
01512 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0151a 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0151f 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01527 448b442408                     mov        r8d, dword ptr [rsp + 8]
0152c 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01534 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01539 4c891c24                       mov        qword ptr [rsp], r11
0153d 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01542 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01547 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0154c 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01551 89442428                       mov        dword ptr [rsp + 0x28], eax
01555 897c2430                       mov        dword ptr [rsp + 0x30], edi
01559 666690                         nop        
0155c c5f877                         vzeroupper 
0155f e87c39b6ff                     call       0x7ffaeb9c3660
01564 0f1f84005c16000b               nop        dword ptr [rax + rax + 0xb00165c]
0156c 493bdb                         cmp        rbx, r11
0156f bdffffffff                     mov        ebp, 0xffffffff
01574 7c08                           jl         0x7ffaebe5fcfe
01576 400f95c5                       setne      bpl
0157a 400fb6ed                       movzx      ebp, bpl
0157e be45ffffff                     mov        esi, 0xffffff45
01583 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
01588 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
01590 448b0424                       mov        r8d, dword ptr [rsp]
01594 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
0159c 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
015a1 4c890424                       mov        qword ptr [rsp], r8
015a5 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
015aa 44898c24dc000000               mov        dword ptr [rsp + 0xdc], r9d
015b2 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
015b7 4c89442408                     mov        qword ptr [rsp + 8], r8
015bc 4489542418                     mov        dword ptr [rsp + 0x18], r10d
015c1 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
015c6 4489442428                     mov        dword ptr [rsp + 0x28], r8d
015cb 89442430                       mov        dword ptr [rsp + 0x30], eax
015cf 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
015d4 c5f877                         vzeroupper 
015d7 e80439b6ff                     call       0x7ffaeb9c3660
015dc 0f1f8400d416000c               nop        dword ptr [rax + rax + 0xc0016d4]
015e4 be45ffffff                     mov        esi, 0xffffff45
015e9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
015ee 448b0c24                       mov        r9d, dword ptr [rsp]
015f2 44898c24d0000000               mov        dword ptr [rsp + 0xd0], r9d
015fa 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
015ff 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01607 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0160c 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01614 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01619 4c891c24                       mov        qword ptr [rsp], r11
0161d 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01622 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01627 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0162c 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01631 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01636 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0163b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01640 89442428                       mov        dword ptr [rsp + 0x28], eax
01644 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01649 666690                         nop        
0164c c5f877                         vzeroupper 
0164f e88c38b6ff                     call       0x7ffaeb9c3660
01654 0f1f84004c17000d               nop        dword ptr [rax + rax + 0xd00174c]
0165c be45ffffff                     mov        esi, 0xffffff45
01661 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01666 448b1c24                       mov        r11d, dword ptr [rsp]
0166a 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01672 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01677 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
0167f 448b442408                     mov        r8d, dword ptr [rsp + 8]
01684 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
0168c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01691 4c891c24                       mov        qword ptr [rsp], r11
01695 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0169a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0169f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016a4 89442428                       mov        dword ptr [rsp + 0x28], eax
016a8 c5f877                         vzeroupper 
016ab e83038b6ff                     call       0x7ffaeb9c3660
016b0 0f1f8400a817000e               nop        dword ptr [rax + rax + 0xe0017a8]
016b8 bee4ffffff                     mov        esi, 0xffffffe4
016bd 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
016c2 448b1424                       mov        r10d, dword ptr [rsp]
016c6 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
016ce 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
016d3 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
016db 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
016e0 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
016e8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
016ed 4c891424                       mov        qword ptr [rsp], r10
016f1 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
016f6 44895c2408                     mov        dword ptr [rsp + 8], r11d
016fb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01700 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01705 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0170a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0170f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01714 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01719 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
0171e 6690                           nop        
01720 c5f877                         vzeroupper 
01723 e8b837b6ff                     call       0x7ffaeb9c3660
01728 0f1f84002018000f               nop        dword ptr [rax + rax + 0xf001820]
01730 bee4ffffff                     mov        esi, 0xffffffe4
01735 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0173a 448b1c24                       mov        r11d, dword ptr [rsp]
0173e 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01746 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0174b 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01753 448b542408                     mov        r10d, dword ptr [rsp + 8]
01758 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01760 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01765 4c891424                       mov        qword ptr [rsp], r10
01769 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0176e 44895c2408                     mov        dword ptr [rsp + 8], r11d
01773 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01778 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0177d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01782 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01787 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0178c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01791 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01796 48895c2438                     mov        qword ptr [rsp + 0x38], rbx
0179b 90                             nop        
0179c c5f877                         vzeroupper 
0179f e83c37b6ff                     call       0x7ffaeb9c3660
017a4 0f1f84009c180010               nop        dword ptr [rax + rax + 0x1000189c]
017ac 4183c108                       add        r9d, 8
017b0 be6effffff                     mov        esi, 0xffffff6e
017b5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
017ba 448b0424                       mov        r8d, dword ptr [rsp]
017be 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
017c6 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
017cb 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
017d3 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
017d8 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
017e0 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
017e5 4c891c24                       mov        qword ptr [rsp], r11
017e9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
017ee 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017f3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017f8 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
017fd 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01802 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01807 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0180c 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
01814 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01819 894c2438                       mov        dword ptr [rsp + 0x38], ecx
0181d 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01822 6690                           nop        
01824 c5f877                         vzeroupper 
01827 e8b436b6ff                     call       0x7ffaeb9c3660
0182c 0f1f840024190011               nop        dword ptr [rax + rax + 0x11001924]
01834 4183c108                       add        r9d, 8
01838 be66ffffff                     mov        esi, 0xffffff66
0183d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01842 448b0424                       mov        r8d, dword ptr [rsp]
01846 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
0184e 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01853 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
0185b 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01860 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01868 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0186d 4c891c24                       mov        qword ptr [rsp], r11
01871 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01876 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0187b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01880 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01885 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0188a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0188f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01894 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
0189c 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
018a1 894c2438                       mov        dword ptr [rsp + 0x38], ecx
018a5 458bda                         mov        r11d, r10d
018a8 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
018ad 666690                         nop        
018b0 c5f877                         vzeroupper 
018b3 e82836b6ff                     call       0x7ffaeb9c3660
018b8 0f1f8400b0190012               nop        dword ptr [rax + rax + 0x120019b0]
018c0 beccffffff                     mov        esi, 0xffffffcc
018c5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
018ca 448b1424                       mov        r10d, dword ptr [rsp]
018ce 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
018d6 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
018db 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
018e3 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
018e8 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
018f0 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018f5 4c891424                       mov        qword ptr [rsp], r10
018f9 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
018fe 4489542408                     mov        dword ptr [rsp + 8], r10d
01903 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01908 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0190d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01912 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01917 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0191c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01921 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01929 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0192e 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01933 90                             nop        
01934 c5f877                         vzeroupper 
01937 e8a435b6ff                     call       0x7ffaeb9c3660
0193c 0f1f8400341a0013               nop        dword ptr [rax + rax + 0x13001a34]
01944 beccffffff                     mov        esi, 0xffffffcc
01949 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0194e 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01956 448b1c24                       mov        r11d, dword ptr [rsp]
0195a 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01962 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01967 4c891424                       mov        qword ptr [rsp], r10
0196b 448b542408                     mov        r10d, dword ptr [rsp + 8]
01970 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01978 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0197d 4c89542408                     mov        qword ptr [rsp + 8], r10
01982 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01987 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
0198c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01991 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01996 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0199b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
019a0 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
019a5 4489542424                     mov        dword ptr [rsp + 0x24], r10d
019aa 6690                           nop        
019ac c5f877                         vzeroupper 
019af e82c35b6ff                     call       0x7ffaeb9c3660
019b4 0f1f8400ac1a0014               nop        dword ptr [rax + rax + 0x14001aac]
019bc 85c9                           test       ecx, ecx
019be 0f84900a0000                   je         0x7ffaebe60bd4
019c4 8b1c24                         mov        ebx, dword ptr [rsp]
019c7 458bda                         mov        r11d, r10d
019ca 4533c0                         xor        r8d, r8d
019cd 448bd3                         mov        r10d, ebx
019d0 e9f6f1ffff                     jmp        0x7ffaebe5f34b
019d5 bee4ffffff                     mov        esi, 0xffffffe4
019da 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
019df 448b1c24                       mov        r11d, dword ptr [rsp]
019e3 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
019eb 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
019f0 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
019f8 448b442408                     mov        r8d, dword ptr [rsp + 8]
019fd 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01a05 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01a0a 4c891c24                       mov        qword ptr [rsp], r11
01a0e 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01a13 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a18 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a1d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01a22 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01a27 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01a2c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01a31 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01a36 89442428                       mov        dword ptr [rsp + 0x28], eax
01a3a 897c243c                       mov        dword ptr [rsp + 0x3c], edi
01a3e 6690                           nop        
01a40 c5f877                         vzeroupper 
01a43 e89834b6ff                     call       0x7ffaeb9c3660
01a48 0f1f8400401b0015               nop        dword ptr [rax + rax + 0x15001b40]
01a50 be6effffff                     mov        esi, 0xffffff6e
01a55 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01a5a 448b0424                       mov        r8d, dword ptr [rsp]
01a5e 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01a66 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01a6b 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01a73 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01a78 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01a80 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01a85 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a8a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a8f 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01a94 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01a99 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01a9e 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01aa3 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01aa8 89442428                       mov        dword ptr [rsp + 0x28], eax
01aac 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01ab0 897c2440                       mov        dword ptr [rsp + 0x40], edi
01ab4 c5f877                         vzeroupper 
01ab7 e82434b6ff                     call       0x7ffaeb9c3660
01abc 0f1f8400b41b0016               nop        dword ptr [rax + rax + 0x16001bb4]
01ac4 be45ffffff                     mov        esi, 0xffffff45
01ac9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01ace 448b1c24                       mov        r11d, dword ptr [rsp]
01ad2 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01ada 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01adf 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01ae7 448b442408                     mov        r8d, dword ptr [rsp + 8]
01aec 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01af4 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01af9 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01afe 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b03 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01b08 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01b0d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01b12 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01b17 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01b1c 89442428                       mov        dword ptr [rsp + 0x28], eax
01b20 897c243c                       mov        dword ptr [rsp + 0x3c], edi
01b24 c5f877                         vzeroupper 
01b27 e8b433b6ff                     call       0x7ffaeb9c3660
01b2c 0f1f8400241c0017               nop        dword ptr [rax + rax + 0x17001c24]
01b34 be3dffffff                     mov        esi, 0xffffff3d
01b39 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01b3e 448b1c24                       mov        r11d, dword ptr [rsp]
01b42 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01b4a 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01b4f 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01b57 448b442408                     mov        r8d, dword ptr [rsp + 8]
01b5c 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01b64 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01b69 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b6e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b73 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01b78 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01b7d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01b82 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01b87 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01b8c 89442428                       mov        dword ptr [rsp + 0x28], eax
01b90 897c243c                       mov        dword ptr [rsp + 0x3c], edi
01b94 c5f877                         vzeroupper 
01b97 e84433b6ff                     call       0x7ffaeb9c3660
01b9c 0f1f8400941c0018               nop        dword ptr [rax + rax + 0x18001c94]
01ba4 bee4ffffff                     mov        esi, 0xffffffe4
01ba9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01bae 448b1c24                       mov        r11d, dword ptr [rsp]
01bb2 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01bba 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01bbf 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01bc7 448b542408                     mov        r10d, dword ptr [rsp + 8]
01bcc 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01bd4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01bd9 4c891424                       mov        qword ptr [rsp], r10
01bdd 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01be2 44895c2408                     mov        dword ptr [rsp + 8], r11d
01be7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01bec 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01bf1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01bf6 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01bfb 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01c00 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01c05 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
01c0a 6690                           nop        
01c0c c5f877                         vzeroupper 
01c0f e8cc32b6ff                     call       0x7ffaeb9c3660
01c14 0f1f84000c1d0019               nop        dword ptr [rax + rax + 0x19001d0c]
01c1c bee4ffffff                     mov        esi, 0xffffffe4
01c21 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01c26 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01c2e 448b1c24                       mov        r11d, dword ptr [rsp]
01c32 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01c3a 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01c3f 4c891424                       mov        qword ptr [rsp], r10
01c43 448b542408                     mov        r10d, dword ptr [rsp + 8]
01c48 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01c50 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c55 4c89542408                     mov        qword ptr [rsp + 8], r10
01c5a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01c5f 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01c64 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c69 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c6e 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01c73 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01c78 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01c7d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01c82 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01c87 90                             nop        
01c88 c5f877                         vzeroupper 
01c8b e85032b6ff                     call       0x7ffaeb9c3660
01c90 0f1f8400881d001a               nop        dword ptr [rax + rax + 0x1a001d88]
01c98 418d6901                       lea        ebp, [r9 + 1]
01c9c bee4ffffff                     mov        esi, 0xffffffe4
01ca1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01ca6 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01cae 448b1c24                       mov        r11d, dword ptr [rsp]
01cb2 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01cba 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01cbf 4c891424                       mov        qword ptr [rsp], r10
01cc3 448b542408                     mov        r10d, dword ptr [rsp + 8]
01cc8 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01cd0 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01cd5 4c89542408                     mov        qword ptr [rsp + 8], r10
01cda 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01cdf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ce4 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01ce9 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01cee 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01cf3 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01cf8 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01cfd 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01d02 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01d07 90                             nop        
01d08 c5f877                         vzeroupper 
01d0b e8d031b6ff                     call       0x7ffaeb9c3660
01d10 0f1f8400081e001b               nop        dword ptr [rax + rax + 0x1b001e08]
01d18 bee4ffffff                     mov        esi, 0xffffffe4
01d1d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01d22 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01d2a 448b1c24                       mov        r11d, dword ptr [rsp]
01d2e 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01d36 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01d3b 4c891424                       mov        qword ptr [rsp], r10
01d3f 448b542408                     mov        r10d, dword ptr [rsp + 8]
01d44 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01d4c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01d51 4c89542408                     mov        qword ptr [rsp + 8], r10
01d56 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d5b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d60 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01d65 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01d6a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01d6f 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01d74 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01d79 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01d7e 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01d83 90                             nop        
01d84 c5f877                         vzeroupper 
01d87 e85431b6ff                     call       0x7ffaeb9c3660
01d8c 0f1f8400841e001c               nop        dword ptr [rax + rax + 0x1c001e84]
01d94 bee4ffffff                     mov        esi, 0xffffffe4
01d99 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01d9e 448b1c24                       mov        r11d, dword ptr [rsp]
01da2 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01daa 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01daf 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01db7 448b542408                     mov        r10d, dword ptr [rsp + 8]
01dbc 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01dc4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01dc9 4c891424                       mov        qword ptr [rsp], r10
01dcd 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01dd2 44895c2408                     mov        dword ptr [rsp + 8], r11d
01dd7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ddc 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01de1 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01de6 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01deb 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01df0 c5f877                         vzeroupper 
01df3 e8e830b6ff                     call       0x7ffaeb9c3660
01df8 0f1f8400f01e001d               nop        dword ptr [rax + rax + 0x1d001ef0]
01e00 beccffffff                     mov        esi, 0xffffffcc
01e05 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01e0a 448b1c24                       mov        r11d, dword ptr [rsp]
01e0e 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01e16 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01e1b 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01e23 448b542408                     mov        r10d, dword ptr [rsp + 8]
01e28 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01e30 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01e35 4c891424                       mov        qword ptr [rsp], r10
01e39 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01e3e 44895c2408                     mov        dword ptr [rsp + 8], r11d
01e43 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e48 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01e4d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01e52 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01e57 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01e5c 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01e61 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01e66 6690                           nop        
01e68 c5f877                         vzeroupper 
01e6b e87030b6ff                     call       0x7ffaeb9c3660
01e70 0f1f8400681f001e               nop        dword ptr [rax + rax + 0x1e001f68]
01e78 be45ffffff                     mov        esi, 0xffffff45
01e7d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01e82 448b1c24                       mov        r11d, dword ptr [rsp]
01e86 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01e8e 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01e93 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01e9b 448b542408                     mov        r10d, dword ptr [rsp + 8]
01ea0 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01ea8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ead 4c891424                       mov        qword ptr [rsp], r10
01eb1 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01eb6 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ebb 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01ec0 c5f877                         vzeroupper 
01ec3 e81830b6ff                     call       0x7ffaeb9c3660
01ec8 0f1f8400c01f001f               nop        dword ptr [rax + rax + 0x1f001fc0]
01ed0 be17000000                     mov        esi, 0x17
01ed5 666690                         nop        
01ed8 c5f877                         vzeroupper 
01edb e80030b6ff                     call       0x7ffaeb9c3660
01ee0 0f1f8400d81f0020               nop        dword ptr [rax + rax + 0x20001fd8]
01ee8 be6effffff                     mov        esi, 0xffffff6e
01eed 498bee                         mov        rbp, r14
01ef0 8b1424                         mov        edx, dword ptr [rsp]
01ef3 899424d0000000                 mov        dword ptr [rsp + 0xd0], edx
01efa 4c891c24                       mov        qword ptr [rsp], r11
01efe 894c2408                       mov        dword ptr [rsp + 8], ecx
01f02 48ff742420                     push       qword ptr [rsp + 0x20]
01f07 488f442410                     pop        qword ptr [rsp + 0x10]
01f0c 897c2418                       mov        dword ptr [rsp + 0x18], edi
01f10 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01f15 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
01f1a 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01f1e 4c89442438                     mov        qword ptr [rsp + 0x38], r8
01f23 90                             nop        
01f24 c5f877                         vzeroupper 
01f27 e8b42fb6ff                     call       0x7ffaeb9c3660
01f2c 0f1f840024200021               nop        dword ptr [rax + rax + 0x21002024]
01f34 bebeffffff                     mov        esi, 0xffffffbe
01f39 4c89b424d0000000               mov        qword ptr [rsp + 0xd0], r14
01f41 8b1424                         mov        edx, dword ptr [rsp]
01f44 899424d8000000                 mov        dword ptr [rsp + 0xd8], edx
01f4b 4c891c24                       mov        qword ptr [rsp], r11
01f4f 894c2408                       mov        dword ptr [rsp + 8], ecx
01f53 48ff742420                     push       qword ptr [rsp + 0x20]
01f58 488f442410                     pop        qword ptr [rsp + 0x10]
01f5d 897c2418                       mov        dword ptr [rsp + 0x18], edi
01f61 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01f66 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
01f6b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01f6f 4c89442438                     mov        qword ptr [rsp + 0x38], r8
01f74 c5f877                         vzeroupper 
01f77 e8642fb6ff                     call       0x7ffaeb9c3660
01f7c 0f1f840074200022               nop        dword ptr [rax + rax + 0x22002074]
01f84 4c8b742440                     mov        r14, qword ptr [rsp + 0x40]
01f89 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
01f8d beccffffff                     mov        esi, 0xffffffcc
01f92 4c89b424d0000000               mov        qword ptr [rsp + 0xd0], r14
01f9a 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
01fa2 898c24dc000000                 mov        dword ptr [rsp + 0xdc], ecx
01fa9 44891c24                       mov        dword ptr [rsp], r11d
01fad 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01fb2 6690                           nop        
01fb4 c5f877                         vzeroupper 
01fb7 e8242fb6ff                     call       0x7ffaeb9c3660
01fbc 0f1f8400b4200023               nop        dword ptr [rax + rax + 0x230020b4]
01fc4 bee4ffffff                     mov        esi, 0xffffffe4
01fc9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01fce 448b1c24                       mov        r11d, dword ptr [rsp]
01fd2 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01fda 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01fdf 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01fe7 448b542408                     mov        r10d, dword ptr [rsp + 8]
01fec 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01ff4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ff9 4c891424                       mov        qword ptr [rsp], r10
01ffd 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02002 44895c2408                     mov        dword ptr [rsp + 8], r11d
02007 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0200c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02011 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02016 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0201b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02020 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
02025 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
0202a 6690                           nop        
0202c c5f877                         vzeroupper 
0202f e8ac2eb6ff                     call       0x7ffaeb9c3660
02034 0f1f84002c210024               nop        dword ptr [rax + rax + 0x2400212c]
0203c bee4ffffff                     mov        esi, 0xffffffe4
02041 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
02046 448b1c24                       mov        r11d, dword ptr [rsp]
0204a 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02052 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02057 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0205f 448b542408                     mov        r10d, dword ptr [rsp + 8]
02064 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
0206c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02071 4c891424                       mov        qword ptr [rsp], r10
02075 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0207a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0207f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02084 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02089 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0208e 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
02093 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
02098 c5f877                         vzeroupper 
0209b e8402eb6ff                     call       0x7ffaeb9c3660
020a0 0f1f840098210025               nop        dword ptr [rax + rax + 0x25002198]
020a8 4183c108                       add        r9d, 8
020ac be6effffff                     mov        esi, 0xffffff6e
020b1 448b1c24                       mov        r11d, dword ptr [rsp]
020b5 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
020bd 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
020c2 4c891424                       mov        qword ptr [rsp], r10
020c6 448b542408                     mov        r10d, dword ptr [rsp + 8]
020cb 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
020d3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
020d8 4c89542408                     mov        qword ptr [rsp + 8], r10
020dd 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
020e2 4c89542418                     mov        qword ptr [rsp + 0x18], r10
020e7 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
020ef 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
020f4 4489542434                     mov        dword ptr [rsp + 0x34], r10d
020f9 666690                         nop        
020fc c5f877                         vzeroupper 
020ff e8dc2db6ff                     call       0x7ffaeb9c3660
02104 0f1f8400fc210026               nop        dword ptr [rax + rax + 0x260021fc]
0210c 4183c108                       add        r9d, 8
02110 beb6ffffff                     mov        esi, 0xffffffb6
02115 448b1c24                       mov        r11d, dword ptr [rsp]
02119 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
02121 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02126 4c891424                       mov        qword ptr [rsp], r10
0212a 448b542408                     mov        r10d, dword ptr [rsp + 8]
0212f 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
02137 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0213c 4c89542408                     mov        qword ptr [rsp + 8], r10
02141 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02146 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0214b 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
02153 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
02158 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0215d 666690                         nop        
02160 c5f877                         vzeroupper 
02163 e8782db6ff                     call       0x7ffaeb9c3660
02168 0f1f840060220027               nop        dword ptr [rax + rax + 0x27002260]
02170 4183c108                       add        r9d, 8
02174 be66ffffff                     mov        esi, 0xffffff66
02179 448b1c24                       mov        r11d, dword ptr [rsp]
0217d 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
02185 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0218a 4c891424                       mov        qword ptr [rsp], r10
0218e 448b542408                     mov        r10d, dword ptr [rsp + 8]
02193 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
0219b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
021a0 4c89542408                     mov        qword ptr [rsp + 8], r10
021a5 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
021aa 4c89542418                     mov        qword ptr [rsp + 0x18], r10
021af 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
021b7 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
021bc 4489542434                     mov        dword ptr [rsp + 0x34], r10d
021c1 666690                         nop        
021c4 c5f877                         vzeroupper 
021c7 e8142db6ff                     call       0x7ffaeb9c3660
021cc 0f1f8400c4220028               nop        dword ptr [rax + rax + 0x280022c4]
021d4 bee4ffffff                     mov        esi, 0xffffffe4
021d9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
021de 448b1c24                       mov        r11d, dword ptr [rsp]
021e2 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
021ea 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
021ef 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
021f7 448b442408                     mov        r8d, dword ptr [rsp + 8]
021fc 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
02204 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02209 4c891c24                       mov        qword ptr [rsp], r11
0220d 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
02212 4489442408                     mov        dword ptr [rsp + 8], r8d
02217 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0221c 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02221 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02226 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0222b 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02230 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
02235 89442424                       mov        dword ptr [rsp + 0x24], eax
02239 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0223d 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02242 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02247 90                             nop        
02248 c5f877                         vzeroupper 
0224b e8902cb6ff                     call       0x7ffaeb9c3660
02250 0f1f840048230029               nop        dword ptr [rax + rax + 0x29002348]
02258 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
02261 bee4ffffff                     mov        esi, 0xffffffe4
02266 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0226b 448b0424                       mov        r8d, dword ptr [rsp]
0226f 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
02277 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
0227c 4c898424d8000000               mov        qword ptr [rsp + 0xd8], r8
02284 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
02289 44898c24d4000000               mov        dword ptr [rsp + 0xd4], r9d
02291 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
02296 4c890424                       mov        qword ptr [rsp], r8
0229a 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0229f 44894c2408                     mov        dword ptr [rsp + 8], r9d
022a4 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
022a9 4c89442410                     mov        qword ptr [rsp + 0x10], r8
022ae 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
022b3 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
022b8 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
022bd 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
022c2 89442424                       mov        dword ptr [rsp + 0x24], eax
022c6 895c2430                       mov        dword ptr [rsp + 0x30], ebx
022ca 4489542438                     mov        dword ptr [rsp + 0x38], r10d
022cf 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
022d4 c5f877                         vzeroupper 
022d7 e8042cb6ff                     call       0x7ffaeb9c3660
022dc 0f1f8400d423002a               nop        dword ptr [rax + rax + 0x2a0023d4]
022e4 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
022ec beccffffff                     mov        esi, 0xffffffcc
022f1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
022f6 448b0424                       mov        r8d, dword ptr [rsp]
022fa 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
02302 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02307 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
0230f 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02314 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0231c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02321 4c891c24                       mov        qword ptr [rsp], r11
02325 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0232a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0232f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02334 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02339 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0233e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02343 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02348 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0234d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02352 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
02357 89442448                       mov        dword ptr [rsp + 0x48], eax
0235b 90                             nop        
0235c c5f877                         vzeroupper 
0235f e87c2bb6ff                     call       0x7ffaeb9c3660
02364 0f1f84005c24002b               nop        dword ptr [rax + rax + 0x2b00245c]
0236c 418bea                         mov        ebp, r10d
0236f 83c510                         add        ebp, 0x10
02372 be6effffff                     mov        esi, 0xffffff6e
02377 448b1c24                       mov        r11d, dword ptr [rsp]
0237b 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
02383 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02388 4c891c24                       mov        qword ptr [rsp], r11
0238c 448b442408                     mov        r8d, dword ptr [rsp + 8]
02391 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
02399 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0239e 4c895c2408                     mov        qword ptr [rsp + 8], r11
023a3 4489542414                     mov        dword ptr [rsp + 0x14], r10d
023a8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
023ad 4c89542418                     mov        qword ptr [rsp + 0x18], r10
023b2 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
023b7 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
023bc 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
023c1 4489542424                     mov        dword ptr [rsp + 0x24], r10d
023c6 8944242c                       mov        dword ptr [rsp + 0x2c], eax
023ca 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
023ce 6690                           nop        
023d0 c5f877                         vzeroupper 
023d3 e8082bb6ff                     call       0x7ffaeb9c3660
023d8 0f1f8400d024002c               nop        dword ptr [rax + rax + 0x2c0024d0]
023e0 418bea                         mov        ebp, r10d
023e3 83c510                         add        ebp, 0x10
023e6 be66ffffff                     mov        esi, 0xffffff66
023eb 448b1c24                       mov        r11d, dword ptr [rsp]
023ef 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
023f7 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
023fc 4c891c24                       mov        qword ptr [rsp], r11
02400 448b442408                     mov        r8d, dword ptr [rsp + 8]
02405 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
0240d 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02412 4c895c2408                     mov        qword ptr [rsp + 8], r11
02417 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0241c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02421 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02426 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0242b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02430 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02435 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0243a 8944242c                       mov        dword ptr [rsp + 0x2c], eax
0243e 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
02442 6690                           nop        
02444 c5f877                         vzeroupper 
02447 e8942ab6ff                     call       0x7ffaeb9c3660
0244c 0f1f84004425002d               nop        dword ptr [rax + rax + 0x2d002544]
02454 bef6ffffff                     mov        esi, 0xfffffff6
02459 488bea                         mov        rbp, rdx
0245c 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
02464 c5f877                         vzeroupper 
02467 e8742ab6ff                     call       0x7ffaeb9c3660
0246c 0f1f84006425002e               nop        dword ptr [rax + rax + 0x2e002564]
02474 488bf0                         mov        rsi, rax
02477 eb0d                           jmp        0x7ffaebe60c06
02479 488bf0                         mov        rsi, rax
0247c eb08                           jmp        0x7ffaebe60c06
0247e 488bf0                         mov        rsi, rax
02481 eb03                           jmp        0x7ffaebe60c06
02483 488bf0                         mov        rsi, rax
02486 c5f877                         vzeroupper 
02489 4881c4c0000000                 add        rsp, 0xc0
02490 5d                             pop        rbp
02491 e9ca8bb6ff                     jmp        0x7ffaeb9c97e0
02496 bef6ffffff                     mov        esi, 0xfffffff6
0249b 90                             nop        
0249c c5f877                         vzeroupper 
0249f e83c2ab6ff                     call       0x7ffaeb9c3660
024a4 0f1f84009c25002f               nop        dword ptr [rax + rax + 0x2f00259c]
024ac 49bac2f3e5ebfa7f0000           movabs     r10, 0x7ffaebe5f3c2
024b6 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
024bd e99ed2a9ff                     jmp        0x7ffaeb8fdee0
024c2 e8599ea8ff                     call       0x7ffaeb8eaaa0
024c7 e972dbffff                     jmp        0x7ffaebe5e7be
024cc f4                             hlt        
024cd f4                             hlt        
024ce f4                             hlt        
024cf f4                             hlt        
