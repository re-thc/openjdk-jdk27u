00000 e87b7f3718                     call       0x7fc5241f7280
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecc0000000                 sub        rsp, 0xc0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f8570220000                   jne        0x7fc50be8159e
0002e 4c8b9640010000                 mov        r10, qword ptr [rsi + 0x140]
00035 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0003a 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
00041 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00049 448b5e68                       mov        r11d, dword ptr [rsi + 0x68]
0004d 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00052 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
00059 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
00061 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
00068 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
00070 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
00077 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0007f 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
00086 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0008e 448b9630010000                 mov        r10d, dword ptr [rsi + 0x130]
00095 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0009a 448b9e18010000                 mov        r11d, dword ptr [rsi + 0x118]
000a1 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
000a6 8b9ef8000000                   mov        ebx, dword ptr [rsi + 0xf8]
000ac 448b96f0000000                 mov        r10d, dword ptr [rsi + 0xf0]
000b3 4489542438                     mov        dword ptr [rsp + 0x38], r10d
000b8 448b9ee8000000                 mov        r11d, dword ptr [rsi + 0xe8]
000bf 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
000c4 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000cb 4c89542440                     mov        qword ptr [rsp + 0x40], r10
000d0 448b9ea0000000                 mov        r11d, dword ptr [rsi + 0xa0]
000d7 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
000dc 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000e3 4c89542458                     mov        qword ptr [rsp + 0x58], r10
000e8 448b5678                       mov        r10d, dword ptr [rsi + 0x78]
000ec 4489542460                     mov        dword ptr [rsp + 0x60], r10d
000f1 448b5670                       mov        r10d, dword ptr [rsi + 0x70]
000f5 4489542464                     mov        dword ptr [rsp + 0x64], r10d
000fa 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
00101 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00106 488bfe                         mov        rdi, rsi
00109 c5f877                         vzeroupper 
0010c 49bac0d92d24c57f0000           movabs     r10, 0x7fc5242dd9c0
00116 41ffd2                         call       r10
00119 0f1f840000000000               nop        dword ptr [rax + rax]
00121 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00126 4d85d2                         test       r10, r10
00129 0f84e5130000                   je         0x7fc50be80814
0012f 458b12                         mov        r10d, dword ptr [r10]
00132 41c1ea0d                       shr        r10d, 0xd
00136 4181fa2c420000                 cmp        r10d, 0x422c
0013d 0f8529160000                   jne        0x7fc50be80a6c
00143 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00148 4c891424                       mov        qword ptr [rsp], r10
0014c 488bac2480000000               mov        rbp, qword ptr [rsp + 0x80]
00154 4885ed                         test       rbp, rbp
00157 0f84c3130000                   je         0x7fc50be80820
0015d 448b5500                       mov        r10d, dword ptr [rbp]
00161 41c1ea0d                       shr        r10d, 0xd
00165 4181fae4050000                 cmp        r10d, 0x5e4
0016c 0f85fa150000                   jne        0x7fc50be80a6c
00172 4c8bd5                         mov        r10, rbp
00175 4c89542408                     mov        qword ptr [rsp + 8], r10
0017a 488bac2488000000               mov        rbp, qword ptr [rsp + 0x88]
00182 4885ed                         test       rbp, rbp
00185 0f84a2130000                   je         0x7fc50be8082d
0018b 448b5d00                       mov        r11d, dword ptr [rbp]
0018f 41c1eb0d                       shr        r11d, 0xd
00193 4181fbe7050000                 cmp        r11d, 0x5e7
0019a 0f85cc150000                   jne        0x7fc50be80a6c
001a0 4c8bd5                         mov        r10, rbp
001a3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001a8 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
001b0 4885ed                         test       rbp, rbp
001b3 0f8481130000                   je         0x7fc50be8083a
001b9 448b5d00                       mov        r11d, dword ptr [rbp]
001bd 41c1eb0d                       shr        r11d, 0xd
001c1 4181fbe6050000                 cmp        r11d, 0x5e6
001c8 0f859e150000                   jne        0x7fc50be80a6c
001ce 4c8bd5                         mov        r10, rbp
001d1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001d6 488bac2498000000               mov        rbp, qword ptr [rsp + 0x98]
001de 4885ed                         test       rbp, rbp
001e1 0f8460130000                   je         0x7fc50be80847
001e7 448b5d00                       mov        r11d, dword ptr [rbp]
001eb 41c1eb0d                       shr        r11d, 0xd
001ef 4181fbe6050000                 cmp        r11d, 0x5e6
001f6 0f8570150000                   jne        0x7fc50be80a6c
001fc 4c8bd5                         mov        r10, rbp
001ff 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00204 488bac24a0000000               mov        rbp, qword ptr [rsp + 0xa0]
0020c 4885ed                         test       rbp, rbp
0020f 0f843f130000                   je         0x7fc50be80854
00215 448b5500                       mov        r10d, dword ptr [rbp]
00219 41c1ea0d                       shr        r10d, 0xd
0021d 4181fae4050000                 cmp        r10d, 0x5e4
00224 0f8542150000                   jne        0x7fc50be80a6c
0022a 48896c2430                     mov        qword ptr [rsp + 0x30], rbp
0022f 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00234 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00238 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0023d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00242 4585d2                         test       r10d, r10d
00245 0f846d140000                   je         0x7fc50be809b8
0024b 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00250 458b5204                       mov        r10d, dword ptr [r10 + 4]
00254 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00259 4585d2                         test       r10d, r10d
0025c 0f8656140000                   jbe        0x7fc50be809b8
00262 4183fa01                       cmp        r10d, 1
00266 0f864c140000                   jbe        0x7fc50be809b8
0026c 4183fa02                       cmp        r10d, 2
00270 0f8642140000                   jbe        0x7fc50be809b8
00276 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0027b 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0027f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00284 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00289 458b5204                       mov        r10d, dword ptr [r10 + 4]
0028d 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00292 4183c3f1                       add        r11d, -0xf
00296 4585db                         test       r11d, r11d
00299 0f8c19140000                   jl         0x7fc50be809b8
0029f 4183c2f1                       add        r10d, -0xf
002a3 4585d2                         test       r10d, r10d
002a6 0f8c0c140000                   jl         0x7fc50be809b8
002ac 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
002b1 4183c3f9                       add        r11d, -7
002b5 4585db                         test       r11d, r11d
002b8 0f8cfa130000                   jl         0x7fc50be809b8
002be 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
002c3 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
002cb 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
002d0 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
002d8 4183c2f1                       add        r10d, -0xf
002dc 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
002e4 4183c3f1                       add        r11d, -0xf
002e8 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
002f0 e9ba010000                     jmp        0x7fc50be7f7af
002f5 4533d2                         xor        r10d, r10d
002f8 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
002fd 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00302 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
00306 83fa03                         cmp        edx, 3
00309 0f8e51020000                   jle        0x7fc50be7f860
0030f 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00314 45895310                       mov        dword ptr [r11 + 0x10], r10d
00318 458b5308                       mov        r10d, dword ptr [r11 + 8]
0031c 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00320 448d52fd                       lea        r10d, [rdx - 3]
00324 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
0032c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00331 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00339 45895a08                       mov        dword ptr [r10 + 8], r11d
0033d 4c639c2490000000               movsxd     r11, dword ptr [rsp + 0x90]
00345 4c63d3                         movsxd     r10, ebx
00348 4c03542440                     add        r10, qword ptr [rsp + 0x40]
0034d 486354246c                     movsxd     rdx, dword ptr [rsp + 0x6c]
00352 4c03d2                         add        r10, rdx
00355 4d3bda                         cmp        r11, r10
00358 0f8f920f0000                   jg         0x7fc50be805f0
0035e 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00366 4585db                         test       r11d, r11d
00369 0f8e710e0000                   jle        0x7fc50be804e0
0036f 448beb                         mov        r13d, ebx
00372 44036c246c                     add        r13d, dword ptr [rsp + 0x6c]
00377 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0037c 44035c246c                     add        r11d, dword ptr [rsp + 0x6c]
00381 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00389 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
0038e 4503d5                         add        r10d, r13d
00391 443b542460                     cmp        r10d, dword ptr [rsp + 0x60]
00396 0f8f15090000                   jg         0x7fc50be7ffb1
0039c 443b5c2464                     cmp        r11d, dword ptr [rsp + 0x64]
003a1 0f8fa10f0000                   jg         0x7fc50be80648
003a7 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
003ac 4183fb10                       cmp        r11d, 0x10
003b0 0f8f82020000                   jg         0x7fc50be7f938
003b6 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
003bb 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
003c3 0f83530d0000                   jae        0x7fc50be8041c
003c9 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
003ce 458bca                         mov        r9d, r10d
003d1 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
003d6 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
003dd 3b9c248c000000                 cmp        ebx, dword ptr [rsp + 0x8c]
003e4 0f83760d0000                   jae        0x7fc50be80460
003ea 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
003ef 4503d1                         add        r10d, r9d
003f2 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
003fa 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
003ff c4c17a7f441a08                 vmovdqu    xmmword ptr [r10 + rbx + 8], xmm0
00406 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0040b 4403db                         add        r11d, ebx
0040e 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00413 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00418 442b842490000000               sub        r8d, dword ptr [rsp + 0x90]
00420 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00425 4183fb10                       cmp        r11d, 0x10
00429 0f8ffd0f0000                   jg         0x7fc50be8072c
0042f 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00437 4183fa10                       cmp        r10d, 0x10
0043b 0f8c4d030000                   jl         0x7fc50be7fa8e
00441 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
00449 0f83050c0000                   jae        0x7fc50be80354
0044f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00454 c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
0045b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00460 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
00468 0f83420c0000                   jae        0x7fc50be803b0
0046e 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00473 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00478 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
0047f 8b5c2478                       mov        ebx, dword ptr [rsp + 0x78]
00483 4103da                         add        ebx, r10d
00486 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0048b 41ffc3                         inc        r11d
0048e 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00493 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00497 418502                         test       dword ptr [r10], eax
0049a 48894424f8                     mov        qword ptr [rsp - 8], rax
0049f 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
004a6 89442438                       mov        dword ptr [rsp + 0x38], eax
004aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
004af 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
004b4 498d741a08                     lea        rsi, [r10 + rbx + 8]
004b9 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
004be 442b442438                     sub        r8d, dword ptr [rsp + 0x38]
004c3 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
004c8 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
004cd 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
004d2 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
004d7 443b542428                     cmp        r10d, dword ptr [rsp + 0x28]
004dc 0f8d1c070000                   jge        0x7fc50be7fefe
004e2 443b542414                     cmp        r10d, dword ptr [rsp + 0x14]
004e7 0f832b0b0000                   jae        0x7fc50be80318
004ed 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
004f2 4f8b54d308                     mov        r10, qword ptr [r11 + r10*8 + 8]
004f7 4d8bda                         mov        r11, r10
004fa 49c1eb12                       shr        r11, 0x12
004fe 458bdb                         mov        r11d, r11d
00501 4181e3ffff0300                 and        r11d, 0x3ffff
00508 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
0050d 458bda                         mov        r11d, r10d
00510 49c1fa24                       sar        r10, 0x24
00514 4181e3ffff0100                 and        r11d, 0x1ffff
0051b 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00520 458bd2                         mov        r10d, r10d
00523 418bd2                         mov        edx, r10d
00526 4585d2                         test       r10d, r10d
00529 0f8cd10c0000                   jl         0x7fc50be80500
0052f 4585db                         test       r11d, r11d
00532 0f84bdfdffff                   je         0x7fc50be7f5f5
00538 453bd8                         cmp        r11d, r8d
0053b 0f8ebcfdffff                   jle        0x7fc50be7f5fd
00541 be45ffffff                     mov        esi, 0xffffff45
00546 418beb                         mov        ebp, r11d
00549 44890424                       mov        dword ptr [rsp], r8d
0054d 666690                         nop        
00550 c5f877                         vzeroupper 
00553 e80843b4ff                     call       0x7fc50b9c3b60
00558 0f1f840050060001               nop        dword ptr [rax + rax + 0x1000650]
00560 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00565 4585db                         test       r11d, r11d
00568 7407                           je         0x7fc50be7f871
0056a 448d5aff                       lea        r11d, [rdx - 1]
0056e 418bd3                         mov        edx, r11d
00571 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00576 458b4308                       mov        r8d, dword ptr [r11 + 8]
0057a 85d2                           test       edx, edx
0057c 7474                           je         0x7fc50be7f8f2
0057e 83fa03                         cmp        edx, 3
00581 0f84f1050000                   je         0x7fc50be7fe78
00587 83fa02                         cmp        edx, 2
0058a 7773                           ja         0x7fc50be7f8ff
0058c 3b54242c                       cmp        edx, dword ptr [rsp + 0x2c]
00590 0f8326130000                   jae        0x7fc50be80bbc
00596 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0059b 458b449308                     mov        r8d, dword ptr [r11 + rdx*4 + 8]
005a0 85d2                           test       edx, edx
005a2 7e45                           jle        0x7fc50be7f8e9
005a4 448d52ff                       lea        r10d, [rdx - 1]
005a8 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
005ad 0f836d160000                   jae        0x7fc50be80f20
005b3 4533c9                         xor        r9d, r9d
005b6 458bd3                         mov        r10d, r11d
005b9 4183c2cc                       add        r10d, -0x34
005bd 41c1ea02                       shr        r10d, 2
005c1 458d5c12ff                     lea        r11d, [r10 + rdx - 1]
005c6 4863ca                         movsxd     rcx, edx
005c9 41ba04000000                   mov        r10d, 4
005cf c442a8f5d3                     bzhi       r10, r11, r10
005d4 492bca                         sub        rcx, r10
005d7 48ffc9                         dec        rcx
005da 4885c9                         test       rcx, rcx
005dd 490f4cc9                       cmovl      rcx, r9
005e1 448bd9                         mov        r11d, ecx
005e4 e902040000                     jmp        0x7fc50be7fceb
005e9 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
005ee 45894208                       mov        dword ptr [r10 + 8], r8d
005f2 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
005fa e93efdffff                     jmp        0x7fc50be7f63d
005ff 48be6813bce200000000           movabs     rsi, 0xe2bc1368
00609 8beb                           mov        ebp, ebx
0060b 90                             nop        
0060c c5f877                         vzeroupper 
0060f e84cafa7ff                     call       0x7fc50b8fa860
00614 0f1f84000c070002               nop        dword ptr [rax + rax + 0x200070c]
0061c 4885c0                         test       rax, rax
0061f 0f849b130000                   je         0x7fc50be80cc0
00625 488bf0                         mov        rsi, rax
00628 c5f877                         vzeroupper 
0062b 4881c4c0000000                 add        rsp, 0xc0
00632 5d                             pop        rbp
00633 e928c4b4ff                     jmp        0x7fc50b9cbd60
00638 4183fb30                       cmp        r11d, 0x30
0063c 0f8fcd040000                   jg         0x7fc50be7fe0f
00642 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00647 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
0064f 0f830c0f0000                   jae        0x7fc50be80861
00655 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0065a 418bfb                         mov        edi, r11d
0065d 4d63c3                         movsxd     r8, r11d
00660 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00665 c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
0066c 3b9c248c000000                 cmp        ebx, dword ptr [rsp + 0x8c]
00673 0f837b0f0000                   jae        0x7fc50be808f4
00679 448d5310                       lea        r10d, [rbx + 0x10]
0067d 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00685 4c63d3                         movsxd     r10, ebx
00688 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0068d c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00694 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0069c 453bdd                         cmp        r11d, r13d
0069f 0f8dcf000000                   jge        0x7fc50be7fa74
006a5 4d2bc2                         sub        r8, r10
006a8 4d63db                         movsxd     r11, r11d
006ab 4c638c2480000000               movsxd     r9, dword ptr [rsp + 0x80]
006b3 4983c1f1                       add        r9, -0xf
006b7 4f8d1403                       lea        r10, [r11 + r8]
006bb 4d3bd1                         cmp        r10, r9
006be 0f83d0100000                   jae        0x7fc50be80a94
006c4 4d63d5                         movsxd     r10, r13d
006c7 4d2bd3                         sub        r10, r11
006ca 4983c20f                       add        r10, 0xf
006ce 4983e2f0                       and        r10, 0xfffffffffffffff0
006d2 458bd2                         mov        r10d, r10d
006d5 458d5c1a10                     lea        r11d, [r10 + rbx + 0x10]
006da 4d63d3                         movsxd     r10, r11d
006dd 4f8d5c02f0                     lea        r11, [r10 + r8 - 0x10]
006e2 4d3bd9                         cmp        r11, r9
006e5 0f83a9100000                   jae        0x7fc50be80a94
006eb 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
006f3 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
006fb 0f8393100000                   jae        0x7fc50be80a94
00701 4983c2f0                       add        r10, -0x10
00705 4c639c2484000000               movsxd     r11, dword ptr [rsp + 0x84]
0070d 4983c3f1                       add        r11, -0xf
00711 4d3bd3                         cmp        r10, r11
00714 0f837a100000                   jae        0x7fc50be80a94
0071a 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00721 0f8f01110000                   jg         0x7fc50be80b28
00727 448bd7                         mov        r10d, edi
0072a 442bd3                         sub        r10d, ebx
0072d 666690                         nop        
00730 458bc2                         mov        r8d, r10d
00733 4403842494000000               add        r8d, dword ptr [rsp + 0x94]
0073b 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00740 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
00747 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0074f 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00754 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
0075b 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00763 4183c310                       add        r11d, 0x10
00767 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
0076f 453bdd                         cmp        r11d, r13d
00772 7cbc                           jl         0x7fc50be7fa30
00774 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00779 4403d7                         add        r10d, edi
0077c 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00784 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
00789 e985fcffff                     jmp        0x7fc50be7f713
0078e 44035c2438                     add        r11d, dword ptr [rsp + 0x38]
00793 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
0079b 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
007a0 0f8d82010000                   jge        0x7fc50be7fc28
007a6 4183fa08                       cmp        r10d, 8
007aa 0f8d68170000                   jge        0x7fc50be81218
007b0 443b44247c                     cmp        r8d, dword ptr [rsp + 0x7c]
007b5 0f83f5120000                   jae        0x7fc50be80db0
007bb 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
007c0 430fbe6c0208                   movsx      ebp, byte ptr [r10 + r8 + 8]
007c6 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
007cb 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
007d0 0f834a130000                   jae        0x7fc50be80e20
007d6 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
007db 458d5803                       lea        r11d, [r8 + 3]
007df 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
007e4 41ffc1                         inc        r9d
007e7 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
007ef 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
007f4 0f8356130000                   jae        0x7fc50be80e50
007fa 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
007ff 4183c303                       add        r11d, 3
00803 4d63d0                         movsxd     r10, r8d
00806 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
0080b 430fbe6c1109                   movsx      ebp, byte ptr [r9 + r10 + 9]
00811 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
00816 0f8368130000                   jae        0x7fc50be80e84
0081c 4c635c2438                     movsxd     r11, dword ptr [rsp + 0x38]
00821 43886c1909                     mov        byte ptr [r9 + r11 + 9], bpl
00826 470fbe4c110a                   movsx      r9d, byte ptr [r9 + r10 + 0xa]
0082c 488b4c2430                     mov        rcx, qword ptr [rsp + 0x30]
00831 46884c190a                     mov        byte ptr [rcx + r11 + 0xa], r9b
00836 460fbe4c110b                   movsx      r9d, byte ptr [rcx + r10 + 0xb]
0083c 46884c190b                     mov        byte ptr [rcx + r11 + 0xb], r9b
00841 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00849 4183fa08                       cmp        r10d, 8
0084d 0f8361130000                   jae        0x7fc50be80eb4
00853 49ba8882b6e200000000           movabs     r10, 0xe2b68288
0085d 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
00865 4703448a08                     add        r8d, dword ptr [r10 + r9*4 + 8]
0086a 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
0086f 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00874 4183fa04                       cmp        r10d, 4
00878 7e3e                           jle        0x7fc50be7fbb8
0087a 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
0087e 83c504                         add        ebp, 4
00881 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00886 418bd0                         mov        edx, r8d
00889 666690                         nop        
0088c c5f877                         vzeroupper 
0088f e8ccaca7ff                     call       0x7fc50b8fa860
00894 0f1f84008c090003               nop        dword ptr [rax + rax + 0x300098c]
0089c 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
008a1 8bd5                           mov        edx, ebp
008a3 8bc8                           mov        ecx, eax
008a5 666690                         nop        
008a8 c5f877                         vzeroupper 
008ab e8b0aca7ff                     call       0x7fc50b8fa860
008b0 0f1f8400a8090004               nop        dword ptr [rax + rax + 0x40009a8]
008b8 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
008bd 4183fa08                       cmp        r10d, 8
008c1 7e59                           jle        0x7fc50be7fc1c
008c3 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
008c7 83c508                         add        ebp, 8
008ca 49bab082b6e200000000           movabs     r10, 0xe2b682b0
008d4 8b54246c                       mov        edx, dword ptr [rsp + 0x6c]
008d8 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
008e0 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
008e5 83c208                         add        edx, 8
008e8 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
008ed 666690                         nop        
008f0 c5f877                         vzeroupper 
008f3 e868aca7ff                     call       0x7fc50b8fa860
008f8 0f1f8400f0090005               nop        dword ptr [rax + rax + 0x50009f0]
00900 488b742430                     mov        rsi, qword ptr [rsp + 0x30]
00905 8bd5                           mov        edx, ebp
00907 488bc8                         mov        rcx, rax
0090a 6690                           nop        
0090c c5f877                         vzeroupper 
0090f e84caca7ff                     call       0x7fc50b8fa860
00914 0f1f84000c0a0006               nop        dword ptr [rax + rax + 0x6000a0c]
0091c 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
00923 e95efbffff                     jmp        0x7fc50be7f786
00928 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
0092d 4183fb30                       cmp        r11d, 0x30
00931 0f8fc1140000                   jg         0x7fc50be810f8
00937 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0093f 4183c2f9                       add        r10d, -7
00943 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
0094b 453bc2                         cmp        r8d, r10d
0094e 0f8384100000                   jae        0x7fc50be80cd8
00954 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
0095c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00961 4b8b6c0208                     mov        rbp, qword ptr [r10 + r8 + 8]
00966 4889ac24a0000000               mov        qword ptr [rsp + 0xa0], rbp
0096e 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00973 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
0097b 0f83c7100000                   jae        0x7fc50be80d48
00981 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00985 89ac2490000000                 mov        dword ptr [rsp + 0x90], ebp
0098c 48be28c122e200000000           movabs     rsi, 0xe222c128
00996 4863cd                         movsxd     rcx, ebp
00999 4883c108                       add        rcx, 8
0099d 488b542430                     mov        rdx, qword ptr [rsp + 0x30]
009a2 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
009aa 4533c9                         xor        r9d, r9d
009ad 666690                         nop        
009b0 c5f877                         vzeroupper 
009b3 e8a8a1a7ff                     call       0x7fc50b8f9e60
009b8 0f1f8400b00a0007               nop        dword ptr [rax + rax + 0x7000ab0]
009c0 448d5d08                       lea        r11d, [rbp + 8]
009c4 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
009cc 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
009d4 0f8c56130000                   jl         0x7fc50be81030
009da 8b5c2478                       mov        ebx, dword ptr [rsp + 0x78]
009de 03dd                           add        ebx, ebp
009e0 e9a1faffff                     jmp        0x7fc50be7f786
009e5 666690                         nop        
009e8 418bd1                         mov        edx, r9d
009eb 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
009f0 458b549104                     mov        r10d, dword ptr [r9 + rdx*4 + 4]
009f5 488b4c2470                     mov        rcx, qword ptr [rsp + 0x70]
009fa 4489549108                     mov        dword ptr [rcx + rdx*4 + 8], r10d
009ff 448d4aff                       lea        r9d, [rdx - 1]
00a03 453bcb                         cmp        r9d, r11d
00a06 7fe0                           jg         0x7fc50be7fce8
00a08 4183f93f                       cmp        r9d, 0x3f
00a0c 0f8e16130000                   jle        0x7fc50be81028
00a12 448bd2                         mov        r10d, edx
00a15 41ffca                         dec        r10d
00a18 458bca                         mov        r9d, r10d
00a1b eb06                           jmp        0x7fc50be7fd23
00a1d 666690                         nop        
00a20 458bca                         mov        r9d, r10d
00a23 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00a28 62917e486f848bc8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r9*4 - 0x38]
00a33 62917e487f848bccffffff         vmovdqu32  zmmword ptr [r11 + r9*4 - 0x34], zmm0
00a3e 62917e486f848b88ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r9*4 - 0x78]
00a49 62917e487f848b8cffffff         vmovdqu32  zmmword ptr [r11 + r9*4 - 0x74], zmm0
00a54 62917e486f848b48ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r9*4 - 0xb8]
00a5f 62917e487f848b4cffffff         vmovdqu32  zmmword ptr [r11 + r9*4 - 0xb4], zmm0
00a6a 62917e486f848b08ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r9*4 - 0xf8]
00a75 62917e487f848b0cffffff         vmovdqu32  zmmword ptr [r11 + r9*4 - 0xf4], zmm0
00a80 458d51c0                       lea        r10d, [r9 - 0x40]
00a84 4183fa3f                       cmp        r10d, 0x3f
00a88 7f96                           jg         0x7fc50be7fd20
00a8a 4183fa0f                       cmp        r10d, 0xf
00a8e 7e2d                           jle        0x7fc50be7fdbd
00a90 458bd1                         mov        r10d, r9d
00a93 4183c2c0                       add        r10d, -0x40
00a97 90                             nop        
00a98 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00a9d 62917e486f8493c8ffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x38]
00aa8 62917e487f8493ccffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x34], zmm0
00ab3 4183c2f0                       add        r10d, -0x10
00ab7 4183fa0f                       cmp        r10d, 0xf
00abb 7fdb                           jg         0x7fc50be7fd98
00abd 4585d2                         test       r10d, r10d
00ac0 0f8e23fbffff                   jle        0x7fc50be7f8e9
00ac6 458bca                         mov        r9d, r10d
00ac9 666690                         nop        
00acc 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00ad1 478b548a04                     mov        r10d, dword ptr [r10 + r9*4 + 4]
00ad6 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00adb 4789548b08                     mov        dword ptr [r11 + r9*4 + 8], r10d
00ae0 41ffc9                         dec        r9d
00ae3 4585c9                         test       r9d, r9d
00ae6 7fe4                           jg         0x7fc50be7fdcc
00ae8 e9fcfaffff                     jmp        0x7fc50be7f8e9
00aed 4d63d2                         movsxd     r10, r10d
00af0 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00af7 c442a8f5db                     bzhi       r11, r11, r10
00afc c4c1fb92fb                     kmovq      k7, r11
00b01 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b07 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b0d eb5f                           jmp        0x7fc50be7fe6e
00b0f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00b14 4585d2                         test       r10d, r10d
00b17 0f8cb7130000                   jl         0x7fc50be811d4
00b1d 85db                           test       ebx, ebx
00b1f 0f8caf130000                   jl         0x7fc50be811d4
00b25 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00b2a 443b942494000000               cmp        r10d, dword ptr [rsp + 0x94]
00b32 0f829c130000                   jb         0x7fc50be811d4
00b38 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00b3d 453bdd                         cmp        r11d, r13d
00b40 0f828e130000                   jb         0x7fc50be811d4
00b46 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00b4b 4585d2                         test       r10d, r10d
00b4e 741e                           je         0x7fc50be7fe6e
00b50 4883fa20                       cmp        rdx, 0x20
00b54 7697                           jbe        0x7fc50be7fded
00b56 c5f877                         vzeroupper 
00b59 49ba203f8e0bc57f0000           movabs     r10, 0x7fc50b8e3f20
00b63 41ffd2                         call       r10
00b66 0f1f840000000000               nop        dword ptr [rax + rax]
00b6e 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
00b73 e99bf8ffff                     jmp        0x7fc50be7f713
00b78 41ffc8                         dec        r8d
00b7b 4585c0                         test       r8d, r8d
00b7e 7e1f                           jle        0x7fc50be7fe9f
00b80 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00b85 45895310                       mov        dword ptr [r11 + 0x10], r10d
00b89 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00b8d 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00b92 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
00b96 45894208                       mov        dword ptr [r10 + 8], r8d
00b9a e953faffff                     jmp        0x7fc50be7f8f2
00b9f 48be3813bce200000000           movabs     rsi, 0xe2bc1338
00ba9 8beb                           mov        ebp, ebx
00bab 90                             nop        
00bac c5f877                         vzeroupper 
00baf e8aca9a7ff                     call       0x7fc50b8fa860
00bb4 0f1f8400ac0c0008               nop        dword ptr [rax + rax + 0x8000cac]
00bbc 4885c0                         test       rax, rax
00bbf 0f8560faffff                   jne        0x7fc50be7f925
00bc5 bef6ffffff                     mov        esi, 0xfffffff6
00bca 6690                           nop        
00bcc c5f877                         vzeroupper 
00bcf e88c3cb4ff                     call       0x7fc50b9c3b60
00bd4 0f1f8400cc0c0009               nop        dword ptr [rax + rax + 0x9000ccc]
00bdc 4d63d0                         movsxd     r10, r8d
00bdf 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00be6 c442a8f5db                     bzhi       r11, r11, r10
00beb c4c1fb92fb                     kmovq      k7, r11
00bf0 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00bf6 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00bfc eb6e                           jmp        0x7fc50be7ff6c
00bfe 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00c03 4585d2                         test       r10d, r10d
00c06 0f8ce0130000                   jl         0x7fc50be812ec
00c0c 85db                           test       ebx, ebx
00c0e 0f8cd8130000                   jl         0x7fc50be812ec
00c14 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00c19 443b542410                     cmp        r10d, dword ptr [rsp + 0x10]
00c1e 0f82c8130000                   jb         0x7fc50be812ec
00c24 428d2c03                       lea        ebp, [rbx + r8]
00c28 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00c2d 443bdd                         cmp        r11d, ebp
00c30 0f82b6130000                   jb         0x7fc50be812ec
00c36 4585c0                         test       r8d, r8d
00c39 0f8cad130000                   jl         0x7fc50be812ec
00c3f 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00c44 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
00c49 7421                           je         0x7fc50be7ff6c
00c4b 4963d0                         movsxd     rdx, r8d
00c4e 4883fa20                       cmp        rdx, 0x20
00c52 7688                           jbe        0x7fc50be7fedc
00c54 c5f877                         vzeroupper 
00c57 49ba203f8e0bc57f0000           movabs     r10, 0x7fc50b8e3f20
00c61 41ffd2                         call       r10
00c64 0f1f840000000000               nop        dword ptr [rax + rax]
00c6c 4c8b1424                       mov        r10, qword ptr [rsp]
00c70 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00c74 c5f877                         vzeroupper 
00c77 4881c4c0000000                 add        rsp, 0xc0
00c7e 5d                             pop        rbp
00c7f 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00c83 0f87ff150000                   ja         0x7fc50be81588
00c89 c3                             ret        
00c8a 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00c8f 4d63d2                         movsxd     r10, r10d
00c92 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c99 c442a8f5db                     bzhi       r11, r11, r10
00c9e c4c1fb92fb                     kmovq      k7, r11
00ca3 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ca9 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00caf eb6d                           jmp        0x7fc50be8001e
00cb1 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00cb6 4585d2                         test       r10d, r10d
00cb9 0f8451030000                   je         0x7fc50be80310
00cbf 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00cc4 4585db                         test       r11d, r11d
00cc7 0f8cbb130000                   jl         0x7fc50be81388
00ccd 85db                           test       ebx, ebx
00ccf 0f8cb3130000                   jl         0x7fc50be81388
00cd5 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00cda 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
00ce2 0f82a0130000                   jb         0x7fc50be81388
00ce8 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00ced 453bd5                         cmp        r10d, r13d
00cf0 0f8292130000                   jb         0x7fc50be81388
00cf6 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00cfb 4585db                         test       r11d, r11d
00cfe 741e                           je         0x7fc50be8001e
00d00 4883fa20                       cmp        rdx, 0x20
00d04 7684                           jbe        0x7fc50be7ff8a
00d06 c5f877                         vzeroupper 
00d09 49ba203f8e0bc57f0000           movabs     r10, 0x7fc50b8e3f20
00d13 41ffd2                         call       r10
00d16 0f1f840000000000               nop        dword ptr [rax + rax]
00d1e 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00d23 4585d2                         test       r10d, r10d
00d26 0f8eb9010000                   jle        0x7fc50be801e5
00d2c 458bdd                         mov        r11d, r13d
00d2f 442b9c2490000000               sub        r11d, dword ptr [rsp + 0x90]
00d37 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00d3f 448b742478                     mov        r14d, dword ptr [rsp + 0x78]
00d44 4503f5                         add        r14d, r13d
00d47 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00d4c 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
00d51 4b8d742a08                     lea        rsi, [r10 + r13 + 8]
00d56 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00d5e 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00d63 0f8dee000000                   jge        0x7fc50be80157
00d69 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00d6e 443b942490000000               cmp        r10d, dword ptr [rsp + 0x90]
00d76 458bda                         mov        r11d, r10d
00d79 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00d81 450f4fda                       cmovg      r11d, r10d
00d85 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00d8d 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00d95 4585db                         test       r11d, r11d
00d98 0f8c66130000                   jl         0x7fc50be81404
00d9e 4585ed                         test       r13d, r13d
00da1 0f8c5d130000                   jl         0x7fc50be81404
00da7 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00daf 44039c2498000000               add        r11d, dword ptr [rsp + 0x98]
00db7 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00dbc 453bd3                         cmp        r10d, r11d
00dbf 0f823f130000                   jb         0x7fc50be81404
00dc5 458bdd                         mov        r11d, r13d
00dc8 44039c2490000000               add        r11d, dword ptr [rsp + 0x90]
00dd0 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00dd8 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00ddd 453bd3                         cmp        r10d, r11d
00de0 0f821e130000                   jb         0x7fc50be81404
00de6 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00dee 4585db                         test       r11d, r11d
00df1 0f8c0d130000                   jl         0x7fc50be81404
00df7 4585db                         test       r11d, r11d
00dfa 7429                           je         0x7fc50be80125
00dfc 4963d3                         movsxd     rdx, r11d
00dff 4883fa20                       cmp        rdx, 0x20
00e03 7738                           ja         0x7fc50be8013d
00e05 4d63d3                         movsxd     r10, r11d
00e08 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e0f c442a8f5db                     bzhi       r11, r11, r10
00e14 c4c1fb92fb                     kmovq      k7, r11
00e19 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e1f 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e25 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00e2d 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00e32 0f8c0b010000                   jl         0x7fc50be80243
00e38 e9ab000000                     jmp        0x7fc50be801e8
00e3d c5f877                         vzeroupper 
00e40 49ba203f8e0bc57f0000           movabs     r10, 0x7fc50b8e3f20
00e4a 41ffd2                         call       r10
00e4d 0f1f840000000000               nop        dword ptr [rax + rax]
00e55 ebce                           jmp        0x7fc50be80125
00e57 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00e5f 4585d2                         test       r10d, r10d
00e62 0f8c50130000                   jl         0x7fc50be814b8
00e68 4585ed                         test       r13d, r13d
00e6b 0f8c47130000                   jl         0x7fc50be814b8
00e71 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00e76 4503da                         add        r11d, r10d
00e79 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00e7e 453bc3                         cmp        r8d, r11d
00e81 0f8231130000                   jb         0x7fc50be814b8
00e87 458bd0                         mov        r10d, r8d
00e8a 453bd6                         cmp        r10d, r14d
00e8d 0f8225130000                   jb         0x7fc50be814b8
00e93 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00e98 4585db                         test       r11d, r11d
00e9b 744b                           je         0x7fc50be801e8
00e9d 4963d3                         movsxd     rdx, r11d
00ea0 4883fa20                       cmp        rdx, 0x20
00ea4 7725                           ja         0x7fc50be801cb
00ea6 458bd3                         mov        r10d, r11d
00ea9 4d63d2                         movsxd     r10, r10d
00eac 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00eb3 c442a8f5db                     bzhi       r11, r11, r10
00eb8 c4c1fb92fb                     kmovq      k7, r11
00ebd 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ec3 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ec9 eb1d                           jmp        0x7fc50be801e8
00ecb c5f877                         vzeroupper 
00ece 49ba203f8e0bc57f0000           movabs     r10, 0x7fc50b8e3f20
00ed8 41ffd2                         call       r10
00edb 0f1f840000000000               nop        dword ptr [rax + rax]
00ee3 eb03                           jmp        0x7fc50be801e8
00ee5 458bf5                         mov        r14d, r13d
00ee8 418bde                         mov        ebx, r14d
00eeb e996f5ffff                     jmp        0x7fc50be7f786
00ef0 448bd5                         mov        r10d, ebp
00ef3 4d63d2                         movsxd     r10, r10d
00ef6 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00efd c442a8f5db                     bzhi       r11, r11, r10
00f02 c4c1fb92fb                     kmovq      k7, r11
00f07 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00f0d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00f13 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00f1b 4403d5                         add        r10d, ebp
00f1e 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00f26 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00f2a 418502                         test       dword ptr [r10], eax
00f2d 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00f35 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00f3a 7dac                           jge        0x7fc50be801e8
00f3c 899c249c000000                 mov        dword ptr [rsp + 0x9c], ebx
00f43 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00f4b 442b942490000000               sub        r10d, dword ptr [rsp + 0x90]
00f53 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00f5b 8b6c2478                       mov        ebp, dword ptr [rsp + 0x78]
00f5f 2bac2490000000                 sub        ebp, dword ptr [rsp + 0x90]
00f66 3bac2490000000                 cmp        ebp, dword ptr [rsp + 0x90]
00f6d 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00f75 410f4feb                       cmovg      ebp, r11d
00f79 4585d2                         test       r10d, r10d
00f7c 0f8c8e100000                   jl         0x7fc50be81310
00f82 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00f8a 4585db                         test       r11d, r11d
00f8d 0f8c7d100000                   jl         0x7fc50be81310
00f93 458d1c2a                       lea        r11d, [r10 + rbp]
00f97 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00f9c 453bd3                         cmp        r10d, r11d
00f9f 0f826b100000                   jb         0x7fc50be81310
00fa5 8b9c249c000000                 mov        ebx, dword ptr [rsp + 0x9c]
00fac 03dd                           add        ebx, ebp
00fae 443bd3                         cmp        r10d, ebx
00fb1 0f8259100000                   jb         0x7fc50be81310
00fb7 85ed                           test       ebp, ebp
00fb9 0f8c51100000                   jl         0x7fc50be81310
00fbf 85ed                           test       ebp, ebp
00fc1 0f844cffffff                   je         0x7fc50be80213
00fc7 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00fcc 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00fd4 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
00fd9 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00fe1 4b8d740208                     lea        rsi, [r10 + r8 + 8]
00fe6 4863d5                         movsxd     rdx, ebp
00fe9 4883fa20                       cmp        rdx, 0x20
00fed 0f86fdfeffff                   jbe        0x7fc50be801f0
00ff3 c5f877                         vzeroupper 
00ff6 49ba203f8e0bc57f0000           movabs     r10, 0x7fc50b8e3f20
01000 41ffd2                         call       r10
01003 0f1f840000000000               nop        dword ptr [rax + rax]
0100b e903ffffff                     jmp        0x7fc50be80213
01010 448beb                         mov        r13d, ebx
01013 e906fdffff                     jmp        0x7fc50be8001e
01018 bee4ffffff                     mov        esi, 0xffffffe4
0101d 488b2c24                       mov        rbp, qword ptr [rsp]
01021 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01026 4c891424                       mov        qword ptr [rsp], r10
0102a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0102f 4489542408                     mov        dword ptr [rsp + 8], r10d
01034 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01039 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0103e 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01042 6690                           nop        
01044 c5f877                         vzeroupper 
01047 e81438b4ff                     call       0x7fc50b9c3b60
0104c 0f1f84004411000b               nop        dword ptr [rax + rax + 0xb001144]
01054 bee4ffffff                     mov        esi, 0xffffffe4
01059 488b2c24                       mov        rbp, qword ptr [rsp]
0105d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01062 4c891424                       mov        qword ptr [rsp], r10
01066 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0106b 44895c2408                     mov        dword ptr [rsp + 8], r11d
01070 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01075 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0107a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0107f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01084 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01089 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0108e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01093 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01098 4489442470                     mov        dword ptr [rsp + 0x70], r8d
0109d 666690                         nop        
010a0 c5f877                         vzeroupper 
010a3 e8b837b4ff                     call       0x7fc50b9c3b60
010a8 0f1f8400a011000c               nop        dword ptr [rax + rax + 0xc0011a0]
010b0 bee4ffffff                     mov        esi, 0xffffffe4
010b5 488b2c24                       mov        rbp, qword ptr [rsp]
010b9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
010be 4c891424                       mov        qword ptr [rsp], r10
010c2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
010c7 4489542408                     mov        dword ptr [rsp + 8], r10d
010cc 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
010d1 4c89542410                     mov        qword ptr [rsp + 0x10], r10
010d6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
010db 4c89542418                     mov        qword ptr [rsp + 0x18], r10
010e0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
010e5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
010ea 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
010ef 4c89542420                     mov        qword ptr [rsp + 0x20], r10
010f4 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
010fc 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01101 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0110a 6690                           nop        
0110c c5f877                         vzeroupper 
0110f e84c37b4ff                     call       0x7fc50b9c3b60
01114 0f1f84000c12000d               nop        dword ptr [rax + rax + 0xd00120c]
0111c bee4ffffff                     mov        esi, 0xffffffe4
01121 488b2c24                       mov        rbp, qword ptr [rsp]
01125 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0112a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0112f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01134 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01139 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
0113d 48894424f8                     mov        qword ptr [rsp - 8], rax
01142 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01146 89442470                       mov        dword ptr [rsp + 0x70], eax
0114a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0114f 90                             nop        
01150 c5f877                         vzeroupper 
01153 e80837b4ff                     call       0x7fc50b9c3b60
01158 0f1f84005012000e               nop        dword ptr [rax + rax + 0xe001250]
01160 bee4ffffff                     mov        esi, 0xffffffe4
01165 488b2c24                       mov        rbp, qword ptr [rsp]
01169 4c891c24                       mov        qword ptr [rsp], r11
0116d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01172 4489542408                     mov        dword ptr [rsp + 8], r10d
01177 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0117c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01181 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01186 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0118b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01190 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01195 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0119a 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0119f 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
011a4 48894424f8                     mov        qword ptr [rsp - 8], rax
011a9 8b442478                       mov        eax, dword ptr [rsp + 0x78]
011ad 89442470                       mov        dword ptr [rsp + 0x70], eax
011b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011b6 895c2478                       mov        dword ptr [rsp + 0x78], ebx
011ba 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
011c2 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
011c7 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
011d0 c5f877                         vzeroupper 
011d3 e88836b4ff                     call       0x7fc50b9c3b60
011d8 0f1f8400d012000f               nop        dword ptr [rax + rax + 0xf0012d0]
011e0 be45ffffff                     mov        esi, 0xffffff45
011e5 488b2c24                       mov        rbp, qword ptr [rsp]
011e9 4c89542408                     mov        qword ptr [rsp + 8], r10
011ee 6690                           nop        
011f0 c5f877                         vzeroupper 
011f3 e86836b4ff                     call       0x7fc50b9c3b60
011f8 0f1f8400f0120010               nop        dword ptr [rax + rax + 0x100012f0]
01200 be45ffffff                     mov        esi, 0xffffff45
01205 488b2c24                       mov        rbp, qword ptr [rsp]
01209 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0120e 4c891424                       mov        qword ptr [rsp], r10
01212 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01217 4489542408                     mov        dword ptr [rsp + 8], r10d
0121c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01221 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01226 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0122b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01230 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01235 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0123a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0123f 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01244 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01248 48894424f8                     mov        qword ptr [rsp - 8], rax
0124d 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01251 89442434                       mov        dword ptr [rsp + 0x34], eax
01255 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0125a 48894424f8                     mov        qword ptr [rsp - 8], rax
0125f 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01263 89442438                       mov        dword ptr [rsp + 0x38], eax
01267 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0126c 48894424f8                     mov        qword ptr [rsp - 8], rax
01271 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01275 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01279 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0127e 48ff742450                     push       qword ptr [rsp + 0x50]
01283 488f442448                     pop        qword ptr [rsp + 0x48]
01288 48ff742458                     push       qword ptr [rsp + 0x58]
0128d 488f442450                     pop        qword ptr [rsp + 0x50]
01292 48894424f8                     mov        qword ptr [rsp - 8], rax
01297 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0129b 89442458                       mov        dword ptr [rsp + 0x58], eax
0129f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012a4 48894424f8                     mov        qword ptr [rsp - 8], rax
012a9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
012ad 8944245c                       mov        dword ptr [rsp + 0x5c], eax
012b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012b6 48894424f8                     mov        qword ptr [rsp - 8], rax
012bb 8b442468                       mov        eax, dword ptr [rsp + 0x68]
012bf 89442460                       mov        dword ptr [rsp + 0x60], eax
012c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012c8 48894424f8                     mov        qword ptr [rsp - 8], rax
012cd 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
012d1 89442464                       mov        dword ptr [rsp + 0x64], eax
012d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012da 8954246c                       mov        dword ptr [rsp + 0x6c], edx
012de 6690                           nop        
012e0 c5f877                         vzeroupper 
012e3 e87835b4ff                     call       0x7fc50b9c3b60
012e8 0f1f8400e0130011               nop        dword ptr [rax + rax + 0x110013e0]
012f0 4d3bda                         cmp        r11, r10
012f3 bdffffffff                     mov        ebp, 0xffffffff
012f8 7c08                           jl         0x7fc50be80602
012fa 400f95c5                       setne      bpl
012fe 400fb6ed                       movzx      ebp, bpl
01302 be45ffffff                     mov        esi, 0xffffff45
01307 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0130c 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01311 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
01316 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
0131b 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
0131f 48894424f8                     mov        qword ptr [rsp - 8], rax
01324 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01328 89442470                       mov        dword ptr [rsp + 0x70], eax
0132c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01331 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01336 6690                           nop        
01338 c5f877                         vzeroupper 
0133b e82035b4ff                     call       0x7fc50b9c3b60
01340 0f1f840038140012               nop        dword ptr [rax + rax + 0x12001438]
01348 be45ffffff                     mov        esi, 0xffffff45
0134d 488b2c24                       mov        rbp, qword ptr [rsp]
01351 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01356 4c891424                       mov        qword ptr [rsp], r10
0135a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0135f 4489542408                     mov        dword ptr [rsp + 8], r10d
01364 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01369 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0136e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01373 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01378 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0137d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01382 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01387 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0138c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01391 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01396 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0139a 48894424f8                     mov        qword ptr [rsp - 8], rax
0139f 8b442438                       mov        eax, dword ptr [rsp + 0x38]
013a3 89442434                       mov        dword ptr [rsp + 0x34], eax
013a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013ac 48894424f8                     mov        qword ptr [rsp - 8], rax
013b1 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
013b5 89442438                       mov        dword ptr [rsp + 0x38], eax
013b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013be 48894424f8                     mov        qword ptr [rsp - 8], rax
013c3 8b442448                       mov        eax, dword ptr [rsp + 0x48]
013c7 8944243c                       mov        dword ptr [rsp + 0x3c], eax
013cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013d0 48ff742450                     push       qword ptr [rsp + 0x50]
013d5 488f442448                     pop        qword ptr [rsp + 0x48]
013da 48ff742458                     push       qword ptr [rsp + 0x58]
013df 488f442450                     pop        qword ptr [rsp + 0x50]
013e4 48894424f8                     mov        qword ptr [rsp - 8], rax
013e9 8b442460                       mov        eax, dword ptr [rsp + 0x60]
013ed 89442458                       mov        dword ptr [rsp + 0x58], eax
013f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013f6 48894424f8                     mov        qword ptr [rsp - 8], rax
013fb 8b442468                       mov        eax, dword ptr [rsp + 0x68]
013ff 89442460                       mov        dword ptr [rsp + 0x60], eax
01403 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01408 48894424f8                     mov        qword ptr [rsp - 8], rax
0140d 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01411 89442468                       mov        dword ptr [rsp + 0x68], eax
01415 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0141a 6690                           nop        
0141c c5f877                         vzeroupper 
0141f e83c34b4ff                     call       0x7fc50b9c3b60
01424 0f1f84001c150013               nop        dword ptr [rax + rax + 0x1300151c]
0142c be45ffffff                     mov        esi, 0xffffff45
01431 488b2c24                       mov        rbp, qword ptr [rsp]
01435 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0143a 4c891424                       mov        qword ptr [rsp], r10
0143e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01443 44895c2408                     mov        dword ptr [rsp + 8], r11d
01448 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0144d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01452 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01457 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0145c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01461 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01466 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0146b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01470 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01475 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0147a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0147f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01484 48894424f8                     mov        qword ptr [rsp - 8], rax
01489 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0148d 89442438                       mov        dword ptr [rsp + 0x38], eax
01491 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01496 48894424f8                     mov        qword ptr [rsp - 8], rax
0149b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0149f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
014a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014a8 48ff742450                     push       qword ptr [rsp + 0x50]
014ad 488f442448                     pop        qword ptr [rsp + 0x48]
014b2 48ff742458                     push       qword ptr [rsp + 0x58]
014b7 488f442450                     pop        qword ptr [rsp + 0x50]
014bc 48894424f8                     mov        qword ptr [rsp - 8], rax
014c1 8b442460                       mov        eax, dword ptr [rsp + 0x60]
014c5 89442458                       mov        dword ptr [rsp + 0x58], eax
014c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014ce 48894424f8                     mov        qword ptr [rsp - 8], rax
014d3 8b442464                       mov        eax, dword ptr [rsp + 0x64]
014d7 8944245c                       mov        dword ptr [rsp + 0x5c], eax
014db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014e0 48894424f8                     mov        qword ptr [rsp - 8], rax
014e5 8b442468                       mov        eax, dword ptr [rsp + 0x68]
014e9 89442460                       mov        dword ptr [rsp + 0x60], eax
014ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f2 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
014f7 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
014fc 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
01501 666690                         nop        
01504 c5f877                         vzeroupper 
01507 e85433b4ff                     call       0x7fc50b9c3b60
0150c 0f1f840004160014               nop        dword ptr [rax + rax + 0x14001604]
01514 4533d2                         xor        r10d, r10d
01517 4c891424                       mov        qword ptr [rsp], r10
0151b e92cecffff                     jmp        0x7fc50be7f44c
01520 4533d2                         xor        r10d, r10d
01523 4c89542408                     mov        qword ptr [rsp + 8], r10
01528 e94decffff                     jmp        0x7fc50be7f47a
0152d 4533d2                         xor        r10d, r10d
01530 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01535 e96eecffff                     jmp        0x7fc50be7f4a8
0153a 4533d2                         xor        r10d, r10d
0153d 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01542 e98fecffff                     jmp        0x7fc50be7f4d6
01547 4533d2                         xor        r10d, r10d
0154a 4c89542470                     mov        qword ptr [rsp + 0x70], r10
0154f e9b0ecffff                     jmp        0x7fc50be7f504
01554 4533d2                         xor        r10d, r10d
01557 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0155c e9ceecffff                     jmp        0x7fc50be7f52f
01561 bee4ffffff                     mov        esi, 0xffffffe4
01566 488b2c24                       mov        rbp, qword ptr [rsp]
0156a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0156f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01574 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01579 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0157e 48894424f8                     mov        qword ptr [rsp - 8], rax
01583 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01587 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0158b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01590 48894424f8                     mov        qword ptr [rsp - 8], rax
01595 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01599 89442460                       mov        dword ptr [rsp + 0x60], eax
0159d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015a2 48894424f8                     mov        qword ptr [rsp - 8], rax
015a7 8b442468                       mov        eax, dword ptr [rsp + 0x68]
015ab 89442464                       mov        dword ptr [rsp + 0x64], eax
015af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015b4 48894424f8                     mov        qword ptr [rsp - 8], rax
015b9 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
015bd 89442468                       mov        dword ptr [rsp + 0x68], eax
015c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015c6 48894424f8                     mov        qword ptr [rsp - 8], rax
015cb 8b442478                       mov        eax, dword ptr [rsp + 0x78]
015cf 8944246c                       mov        dword ptr [rsp + 0x6c], eax
015d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015d8 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
015dd 895c2478                       mov        dword ptr [rsp + 0x78], ebx
015e1 666690                         nop        
015e4 c5f877                         vzeroupper 
015e7 e87432b4ff                     call       0x7fc50b9c3b60
015ec 0f1f8400e4160015               nop        dword ptr [rax + rax + 0x150016e4]
015f4 c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
015fd bee4ffffff                     mov        esi, 0xffffffe4
01602 488b2c24                       mov        rbp, qword ptr [rsp]
01606 4c891424                       mov        qword ptr [rsp], r10
0160a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0160f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01614 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01619 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0161e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01623 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01628 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0162d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01632 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01637 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0163c 48894424f8                     mov        qword ptr [rsp - 8], rax
01641 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01645 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01649 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0164e 48894424f8                     mov        qword ptr [rsp - 8], rax
01653 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01657 89442460                       mov        dword ptr [rsp + 0x60], eax
0165b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01660 48894424f8                     mov        qword ptr [rsp - 8], rax
01665 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01669 89442464                       mov        dword ptr [rsp + 0x64], eax
0166d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01672 48894424f8                     mov        qword ptr [rsp - 8], rax
01677 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0167b 89442468                       mov        dword ptr [rsp + 0x68], eax
0167f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01684 48894424f8                     mov        qword ptr [rsp - 8], rax
01689 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0168d 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01691 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01696 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
0169b 897c247c                       mov        dword ptr [rsp + 0x7c], edi
0169f 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
016a6 6690                           nop        
016a8 c5f877                         vzeroupper 
016ab e8b031b4ff                     call       0x7fc50b9c3b60
016b0 0f1f8400a8170016               nop        dword ptr [rax + rax + 0x160017a8]
016b8 bebeffffff                     mov        esi, 0xffffffbe
016bd 488b2c24                       mov        rbp, qword ptr [rsp]
016c1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
016c6 4c891424                       mov        qword ptr [rsp], r10
016ca 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
016cf 44895c2408                     mov        dword ptr [rsp + 8], r11d
016d4 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
016d9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
016de 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016e3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016e8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
016ed 448954240c                     mov        dword ptr [rsp + 0xc], r10d
016f2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
016f7 4c89542428                     mov        qword ptr [rsp + 0x28], r10
016fc 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01700 48894424f8                     mov        qword ptr [rsp - 8], rax
01705 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01709 89442434                       mov        dword ptr [rsp + 0x34], eax
0170d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01712 48894424f8                     mov        qword ptr [rsp - 8], rax
01717 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0171b 89442438                       mov        dword ptr [rsp + 0x38], eax
0171f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01724 48894424f8                     mov        qword ptr [rsp - 8], rax
01729 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0172d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01731 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01736 48ff742450                     push       qword ptr [rsp + 0x50]
0173b 488f442448                     pop        qword ptr [rsp + 0x48]
01740 48ff742458                     push       qword ptr [rsp + 0x58]
01745 488f442450                     pop        qword ptr [rsp + 0x50]
0174a 48894424f8                     mov        qword ptr [rsp - 8], rax
0174f 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01753 89442458                       mov        dword ptr [rsp + 0x58], eax
01757 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0175c c5f877                         vzeroupper 
0175f e8fc30b4ff                     call       0x7fc50b9c3b60
01764 0f1f84005c180017               nop        dword ptr [rax + rax + 0x1700185c]
0176c be85ffffff                     mov        esi, 0xffffff85
01771 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
01775 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0177a 44891c24                       mov        dword ptr [rsp], r11d
0177e 895c2404                       mov        dword ptr [rsp + 4], ebx
01782 6690                           nop        
01784 c5f877                         vzeroupper 
01787 e8d430b4ff                     call       0x7fc50b9c3b60
0178c 0f1f840084180018               nop        dword ptr [rax + rax + 0x18001884]
01794 8bef                           mov        ebp, edi
01796 83c510                         add        ebp, 0x10
01799 be6effffff                     mov        esi, 0xffffff6e
0179e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
017a3 4489542414                     mov        dword ptr [rsp + 0x14], r10d
017a8 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
017ad 4c89542428                     mov        qword ptr [rsp + 0x28], r10
017b2 897c2438                       mov        dword ptr [rsp + 0x38], edi
017b6 48894424f8                     mov        qword ptr [rsp - 8], rax
017bb 8b442460                       mov        eax, dword ptr [rsp + 0x60]
017bf 8944244c                       mov        dword ptr [rsp + 0x4c], eax
017c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c8 48894424f8                     mov        qword ptr [rsp - 8], rax
017cd 8b442464                       mov        eax, dword ptr [rsp + 0x64]
017d1 89442460                       mov        dword ptr [rsp + 0x60], eax
017d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017da 48894424f8                     mov        qword ptr [rsp - 8], rax
017df 8b442468                       mov        eax, dword ptr [rsp + 0x68]
017e3 89442464                       mov        dword ptr [rsp + 0x64], eax
017e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ec 48894424f8                     mov        qword ptr [rsp - 8], rax
017f1 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
017f5 89442468                       mov        dword ptr [rsp + 0x68], eax
017f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017fe 48894424f8                     mov        qword ptr [rsp - 8], rax
01803 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01807 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0180b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01810 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01815 666690                         nop        
01818 c5f877                         vzeroupper 
0181b e84030b4ff                     call       0x7fc50b9c3b60
01820 0f1f840018190019               nop        dword ptr [rax + rax + 0x19001918]
01828 8bef                           mov        ebp, edi
0182a 83c510                         add        ebp, 0x10
0182d be66ffffff                     mov        esi, 0xffffff66
01832 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01837 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0183c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01841 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01846 897c2438                       mov        dword ptr [rsp + 0x38], edi
0184a 48894424f8                     mov        qword ptr [rsp - 8], rax
0184f 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01853 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01857 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0185c 48894424f8                     mov        qword ptr [rsp - 8], rax
01861 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01865 89442460                       mov        dword ptr [rsp + 0x60], eax
01869 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0186e 48894424f8                     mov        qword ptr [rsp - 8], rax
01873 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01877 89442464                       mov        dword ptr [rsp + 0x64], eax
0187b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01880 48894424f8                     mov        qword ptr [rsp - 8], rax
01885 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01889 89442468                       mov        dword ptr [rsp + 0x68], eax
0188d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01892 48894424f8                     mov        qword ptr [rsp - 8], rax
01897 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0189b 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0189f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a4 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
018a9 666690                         nop        
018ac c5f877                         vzeroupper 
018af e8ac2fb4ff                     call       0x7fc50b9c3b60
018b4 0f1f8400ac19001a               nop        dword ptr [rax + rax + 0x1a0019ac]
018bc bee4ffffff                     mov        esi, 0xffffffe4
018c1 488b2c24                       mov        rbp, qword ptr [rsp]
018c5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
018ca 4c891424                       mov        qword ptr [rsp], r10
018ce 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
018d3 4489542408                     mov        dword ptr [rsp + 8], r10d
018d8 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
018dd 4c89542410                     mov        qword ptr [rsp + 0x10], r10
018e2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018e7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018ec 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
018f1 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
018f6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018fb 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01900 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01904 48894424f8                     mov        qword ptr [rsp - 8], rax
01909 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0190d 89442434                       mov        dword ptr [rsp + 0x34], eax
01911 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01916 48894424f8                     mov        qword ptr [rsp - 8], rax
0191b 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0191f 89442438                       mov        dword ptr [rsp + 0x38], eax
01923 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01928 48894424f8                     mov        qword ptr [rsp - 8], rax
0192d 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01931 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01935 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0193a 48ff742450                     push       qword ptr [rsp + 0x50]
0193f 488f442448                     pop        qword ptr [rsp + 0x48]
01944 48ff742458                     push       qword ptr [rsp + 0x58]
01949 488f442450                     pop        qword ptr [rsp + 0x50]
0194e 48894424f8                     mov        qword ptr [rsp - 8], rax
01953 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01957 89442458                       mov        dword ptr [rsp + 0x58], eax
0195b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01960 48894424f8                     mov        qword ptr [rsp - 8], rax
01965 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01969 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0196d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01972 48894424f8                     mov        qword ptr [rsp - 8], rax
01977 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0197b 89442460                       mov        dword ptr [rsp + 0x60], eax
0197f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01984 48894424f8                     mov        qword ptr [rsp - 8], rax
01989 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0198d 89442464                       mov        dword ptr [rsp + 0x64], eax
01991 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01996 48894424f8                     mov        qword ptr [rsp - 8], rax
0199b 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0199f 89442468                       mov        dword ptr [rsp + 0x68], eax
019a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019a8 89942480000000                 mov        dword ptr [rsp + 0x80], edx
019af 90                             nop        
019b0 c5f877                         vzeroupper 
019b3 e8a82eb4ff                     call       0x7fc50b9c3b60
019b8 0f1f8400b01a001b               nop        dword ptr [rax + rax + 0x1b001ab0]
019c0 bef6ffffff                     mov        esi, 0xfffffff6
019c5 666690                         nop        
019c8 c5f877                         vzeroupper 
019cb e8902eb4ff                     call       0x7fc50b9c3b60
019d0 0f1f8400c81a001c               nop        dword ptr [rax + rax + 0x1c001ac8]
019d8 bee4ffffff                     mov        esi, 0xffffffe4
019dd 488b2c24                       mov        rbp, qword ptr [rsp]
019e1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
019e6 4c891424                       mov        qword ptr [rsp], r10
019ea 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
019ef 4489542408                     mov        dword ptr [rsp + 8], r10d
019f4 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
019f9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
019fe 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a03 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a08 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a0d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a12 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01a17 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01a1c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a21 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01a25 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01a29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a2e 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
01a36 6690                           nop        
01a38 c5f877                         vzeroupper 
01a3b e8202eb4ff                     call       0x7fc50b9c3b60
01a40 0f1f8400381b001d               nop        dword ptr [rax + rax + 0x1d001b38]
01a48 bee4ffffff                     mov        esi, 0xffffffe4
01a4d 488b2c24                       mov        rbp, qword ptr [rsp]
01a51 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01a56 4c891424                       mov        qword ptr [rsp], r10
01a5a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01a5f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01a64 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01a69 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01a6e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a73 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a78 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a7d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a82 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01a87 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01a8c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a91 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01a95 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01a99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a9e 6690                           nop        
01aa0 c5f877                         vzeroupper 
01aa3 e8b82db4ff                     call       0x7fc50b9c3b60
01aa8 0f1f8400a01b001e               nop        dword ptr [rax + rax + 0x1e001ba0]
01ab0 bee4ffffff                     mov        esi, 0xffffffe4
01ab5 488b2c24                       mov        rbp, qword ptr [rsp]
01ab9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01abe 4c891424                       mov        qword ptr [rsp], r10
01ac2 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01ac7 44895c2408                     mov        dword ptr [rsp + 8], r11d
01acc 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01ad1 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01ad6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01adb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ae0 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ae5 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01aea 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01aef 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01af4 48894424f8                     mov        qword ptr [rsp - 8], rax
01af9 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01afd 89442474                       mov        dword ptr [rsp + 0x74], eax
01b01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b06 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
01b0e 6690                           nop        
01b10 c5f877                         vzeroupper 
01b13 e8482db4ff                     call       0x7fc50b9c3b60
01b18 0f1f8400101c001f               nop        dword ptr [rax + rax + 0x1f001c10]
01b20 bee4ffffff                     mov        esi, 0xffffffe4
01b25 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b2a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01b2f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01b34 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01b39 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01b3e 6690                           nop        
01b40 c5f877                         vzeroupper 
01b43 e8182db4ff                     call       0x7fc50b9c3b60
01b48 0f1f8400401c0020               nop        dword ptr [rax + rax + 0x20001c40]
01b50 418d6801                       lea        ebp, [r8 + 1]
01b54 bee4ffffff                     mov        esi, 0xffffffe4
01b59 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b5e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01b63 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01b68 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01b6d 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01b72 6690                           nop        
01b74 c5f877                         vzeroupper 
01b77 e8e42cb4ff                     call       0x7fc50b9c3b60
01b7c 0f1f8400741c0021               nop        dword ptr [rax + rax + 0x21001c74]
01b84 bee4ffffff                     mov        esi, 0xffffffe4
01b89 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b8e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01b93 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01b98 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01b9d 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01ba2 6690                           nop        
01ba4 c5f877                         vzeroupper 
01ba7 e8b42cb4ff                     call       0x7fc50b9c3b60
01bac 0f1f8400a41c0022               nop        dword ptr [rax + rax + 0x22001ca4]
01bb4 bee4ffffff                     mov        esi, 0xffffffe4
01bb9 488b2c24                       mov        rbp, qword ptr [rsp]
01bbd 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01bc2 4c891424                       mov        qword ptr [rsp], r10
01bc6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01bcb 4489542408                     mov        dword ptr [rsp + 8], r10d
01bd0 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01bd5 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01bda 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01bdf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01be4 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01be9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01bee 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01bf3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01bf8 48894424f8                     mov        qword ptr [rsp - 8], rax
01bfd 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01c01 89442470                       mov        dword ptr [rsp + 0x70], eax
01c05 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c0a 4489442474                     mov        dword ptr [rsp + 0x74], r8d
01c0f 90                             nop        
01c10 c5f877                         vzeroupper 
01c13 e8482cb4ff                     call       0x7fc50b9c3b60
01c18 0f1f8400101d0023               nop        dword ptr [rax + rax + 0x23001d10]
01c20 be6effffff                     mov        esi, 0xffffff6e
01c25 488b2c24                       mov        rbp, qword ptr [rsp]
01c29 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01c2e 4c891424                       mov        qword ptr [rsp], r10
01c32 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01c37 4489542408                     mov        dword ptr [rsp + 8], r10d
01c3c 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01c41 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01c46 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c4b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c50 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01c55 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01c5a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c5f 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01c64 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01c68 48894424f8                     mov        qword ptr [rsp - 8], rax
01c6d 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01c71 89442434                       mov        dword ptr [rsp + 0x34], eax
01c75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c7a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c7f 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01c83 89442438                       mov        dword ptr [rsp + 0x38], eax
01c87 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c8c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c91 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01c95 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c9e 48ff742450                     push       qword ptr [rsp + 0x50]
01ca3 488f442448                     pop        qword ptr [rsp + 0x48]
01ca8 48ff742458                     push       qword ptr [rsp + 0x58]
01cad 488f442450                     pop        qword ptr [rsp + 0x50]
01cb2 48894424f8                     mov        qword ptr [rsp - 8], rax
01cb7 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01cbb 89442458                       mov        dword ptr [rsp + 0x58], eax
01cbf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cc4 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01ccd 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01cd1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd6 48894424f8                     mov        qword ptr [rsp - 8], rax
01cdb 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01cdf 89442460                       mov        dword ptr [rsp + 0x60], eax
01ce3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ce8 48894424f8                     mov        qword ptr [rsp - 8], rax
01ced 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01cf1 89442464                       mov        dword ptr [rsp + 0x64], eax
01cf5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cfa 48894424f8                     mov        qword ptr [rsp - 8], rax
01cff 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01d03 89442468                       mov        dword ptr [rsp + 0x68], eax
01d07 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d0c 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01d11 8954247c                       mov        dword ptr [rsp + 0x7c], edx
01d15 666690                         nop        
01d18 c5f877                         vzeroupper 
01d1b e8402bb4ff                     call       0x7fc50b9c3b60
01d20 0f1f8400181e0024               nop        dword ptr [rax + rax + 0x24001e18]
01d28 458bd1                         mov        r10d, r9d
01d2b e98dedffff                     jmp        0x7fc50be7fdbd
01d30 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
01d38 4183c308                       add        r11d, 8
01d3c 458bcb                         mov        r9d, r11d
01d3f be45ffffff                     mov        esi, 0xffffff45
01d44 488b2c24                       mov        rbp, qword ptr [rsp]
01d48 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01d4d 4c891424                       mov        qword ptr [rsp], r10
01d51 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01d56 4489542408                     mov        dword ptr [rsp + 8], r10d
01d5b 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01d60 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01d65 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d6a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d6f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01d74 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01d79 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01d7e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01d83 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01d88 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01d8d 48ff742440                     push       qword ptr [rsp + 0x40]
01d92 488f442438                     pop        qword ptr [rsp + 0x38]
01d97 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01d9c 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01da1 48ff742450                     push       qword ptr [rsp + 0x50]
01da6 488f442448                     pop        qword ptr [rsp + 0x48]
01dab 48ff742458                     push       qword ptr [rsp + 0x58]
01db0 488f442450                     pop        qword ptr [rsp + 0x50]
01db5 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01dba 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01dbf 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01dc4 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01dc9 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01dce 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01dd3 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
01ddb 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
01de0 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01de5 666690                         nop        
01de8 c5f877                         vzeroupper 
01deb e8702ab4ff                     call       0x7fc50b9c3b60
01df0 0f1f8400e81e0025               nop        dword ptr [rax + rax + 0x25001ee8]
01df8 be45ffffff                     mov        esi, 0xffffff45
01dfd 488b2c24                       mov        rbp, qword ptr [rsp]
01e01 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01e06 4c891424                       mov        qword ptr [rsp], r10
01e0a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01e0f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01e14 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01e19 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01e1e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e23 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e28 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01e2d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01e32 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01e37 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01e3c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01e41 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01e46 48894424f8                     mov        qword ptr [rsp - 8], rax
01e4b 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01e4f 89442438                       mov        dword ptr [rsp + 0x38], eax
01e53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e58 48894424f8                     mov        qword ptr [rsp - 8], rax
01e5d 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01e61 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e6a 48ff742450                     push       qword ptr [rsp + 0x50]
01e6f 488f442448                     pop        qword ptr [rsp + 0x48]
01e74 48ff742458                     push       qword ptr [rsp + 0x58]
01e79 488f442450                     pop        qword ptr [rsp + 0x50]
01e7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e83 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01e87 89442458                       mov        dword ptr [rsp + 0x58], eax
01e8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e90 48894424f8                     mov        qword ptr [rsp - 8], rax
01e95 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01e99 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01e9d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ea7 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01eab 89442460                       mov        dword ptr [rsp + 0x60], eax
01eaf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eb4 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
01eb9 4489442468                     mov        dword ptr [rsp + 0x68], r8d
01ebe 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01ec3 90                             nop        
01ec4 c5f877                         vzeroupper 
01ec7 e89429b4ff                     call       0x7fc50b9c3b60
01ecc 0f1f8400c41f0026               nop        dword ptr [rax + rax + 0x26001fc4]
01ed4 beccffffff                     mov        esi, 0xffffffcc
01ed9 488b2c24                       mov        rbp, qword ptr [rsp]
01edd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ee2 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01ee7 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01eec 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01ef1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ef6 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01efa 89442470                       mov        dword ptr [rsp + 0x70], eax
01efe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f03 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
01f07 90                             nop        
01f08 c5f877                         vzeroupper 
01f0b e85029b4ff                     call       0x7fc50b9c3b60
01f10 0f1f840008200027               nop        dword ptr [rax + rax + 0x27002008]
01f18 be45ffffff                     mov        esi, 0xffffff45
01f1d 488b2c24                       mov        rbp, qword ptr [rsp]
01f21 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01f26 4c891424                       mov        qword ptr [rsp], r10
01f2a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01f2f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01f34 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01f39 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01f3e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f43 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f48 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f4d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f52 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01f57 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01f5c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01f61 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01f66 48894424f8                     mov        qword ptr [rsp - 8], rax
01f6b 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01f6f 89442438                       mov        dword ptr [rsp + 0x38], eax
01f73 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f78 48894424f8                     mov        qword ptr [rsp - 8], rax
01f7d 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01f81 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01f85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f8a 48ff742450                     push       qword ptr [rsp + 0x50]
01f8f 488f442448                     pop        qword ptr [rsp + 0x48]
01f94 48ff742458                     push       qword ptr [rsp + 0x58]
01f99 488f442450                     pop        qword ptr [rsp + 0x50]
01f9e 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01fa7 89442458                       mov        dword ptr [rsp + 0x58], eax
01fab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fb0 48894424f8                     mov        qword ptr [rsp - 8], rax
01fb5 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01fb9 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01fbd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fc2 48894424f8                     mov        qword ptr [rsp - 8], rax
01fc7 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01fcb 89442460                       mov        dword ptr [rsp + 0x60], eax
01fcf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd4 4489442468                     mov        dword ptr [rsp + 0x68], r8d
01fd9 666690                         nop        
01fdc c5f877                         vzeroupper 
01fdf e87c28b4ff                     call       0x7fc50b9c3b60
01fe4 0f1f8400dc200028               nop        dword ptr [rax + rax + 0x280020dc]
01fec beccffffff                     mov        esi, 0xffffffcc
01ff1 488b2c24                       mov        rbp, qword ptr [rsp]
01ff5 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01ff9 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01ffe 6690                           nop        
02000 c5f877                         vzeroupper 
02003 e85828b4ff                     call       0x7fc50b9c3b60
02008 0f1f840000210029               nop        dword ptr [rax + rax + 0x29002100]
02010 beccffffff                     mov        esi, 0xffffffcc
02015 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0201a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0201f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02024 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02029 48894424f8                     mov        qword ptr [rsp - 8], rax
0202e 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02032 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02036 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0203b 48894424f8                     mov        qword ptr [rsp - 8], rax
02040 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02044 89442460                       mov        dword ptr [rsp + 0x60], eax
02048 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0204d 48894424f8                     mov        qword ptr [rsp - 8], rax
02052 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02056 89442464                       mov        dword ptr [rsp + 0x64], eax
0205a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0205f 48894424f8                     mov        qword ptr [rsp - 8], rax
02064 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02068 89442468                       mov        dword ptr [rsp + 0x68], eax
0206c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02071 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02076 6690                           nop        
02078 c5f877                         vzeroupper 
0207b e8e027b4ff                     call       0x7fc50b9c3b60
02080 0f1f84007821002a               nop        dword ptr [rax + rax + 0x2a002178]
02088 beccffffff                     mov        esi, 0xffffffcc
0208d 488b2c24                       mov        rbp, qword ptr [rsp]
02091 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02096 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0209b 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
020a0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
020a5 48894424f8                     mov        qword ptr [rsp - 8], rax
020aa 8b442460                       mov        eax, dword ptr [rsp + 0x60]
020ae 8944244c                       mov        dword ptr [rsp + 0x4c], eax
020b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020b7 48894424f8                     mov        qword ptr [rsp - 8], rax
020bc 8b442464                       mov        eax, dword ptr [rsp + 0x64]
020c0 89442460                       mov        dword ptr [rsp + 0x60], eax
020c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020c9 48894424f8                     mov        qword ptr [rsp - 8], rax
020ce 8b442468                       mov        eax, dword ptr [rsp + 0x68]
020d2 89442464                       mov        dword ptr [rsp + 0x64], eax
020d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020db 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
020e3 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
020eb 899c248c000000                 mov        dword ptr [rsp + 0x8c], ebx
020f2 6690                           nop        
020f4 c5f877                         vzeroupper 
020f7 e86427b4ff                     call       0x7fc50b9c3b60
020fc 0f1f8400f421002b               nop        dword ptr [rax + rax + 0x2b0021f4]
02104 beccffffff                     mov        esi, 0xffffffcc
02109 488b2c24                       mov        rbp, qword ptr [rsp]
0210d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02112 4c891424                       mov        qword ptr [rsp], r10
02116 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0211b 4489542408                     mov        dword ptr [rsp + 8], r10d
02120 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
02125 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0212a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0212f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02134 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02139 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0213e 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02143 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02148 48894424f8                     mov        qword ptr [rsp - 8], rax
0214d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02151 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02155 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0215a 48894424f8                     mov        qword ptr [rsp - 8], rax
0215f 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02163 89442460                       mov        dword ptr [rsp + 0x60], eax
02167 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0216c 48894424f8                     mov        qword ptr [rsp - 8], rax
02171 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02175 89442464                       mov        dword ptr [rsp + 0x64], eax
02179 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0217e 48894424f8                     mov        qword ptr [rsp - 8], rax
02183 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02187 89442468                       mov        dword ptr [rsp + 0x68], eax
0218b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02190 48894424f8                     mov        qword ptr [rsp - 8], rax
02195 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02199 89442470                       mov        dword ptr [rsp + 0x70], eax
0219d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021a2 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
021a7 90                             nop        
021a8 c5f877                         vzeroupper 
021ab e8b026b4ff                     call       0x7fc50b9c3b60
021b0 0f1f8400a822002c               nop        dword ptr [rax + rax + 0x2c0022a8]
021b8 beccffffff                     mov        esi, 0xffffffcc
021bd 488b2c24                       mov        rbp, qword ptr [rsp]
021c1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
021c6 4c891424                       mov        qword ptr [rsp], r10
021ca 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
021cf 4489542408                     mov        dword ptr [rsp + 8], r10d
021d4 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
021d9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
021de 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
021e3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
021e8 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
021ed 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
021f2 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
021f7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
021fc 48894424f8                     mov        qword ptr [rsp - 8], rax
02201 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02205 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02209 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0220e 48894424f8                     mov        qword ptr [rsp - 8], rax
02213 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02217 89442460                       mov        dword ptr [rsp + 0x60], eax
0221b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02220 48894424f8                     mov        qword ptr [rsp - 8], rax
02225 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02229 89442464                       mov        dword ptr [rsp + 0x64], eax
0222d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02232 48894424f8                     mov        qword ptr [rsp - 8], rax
02237 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0223b 89442468                       mov        dword ptr [rsp + 0x68], eax
0223f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02244 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02249 666690                         nop        
0224c c5f877                         vzeroupper 
0224f e80c26b4ff                     call       0x7fc50b9c3b60
02254 0f1f84004c23002d               nop        dword ptr [rax + rax + 0x2d00234c]
0225c eb0a                           jmp        0x7fc50be81568
0225e eb08                           jmp        0x7fc50be81568
02260 eb06                           jmp        0x7fc50be81568
02262 eb04                           jmp        0x7fc50be81568
02264 eb02                           jmp        0x7fc50be81568
02266 eb00                           jmp        0x7fc50be81568
02268 488bf0                         mov        rsi, rax
0226b e9b8e3ffff                     jmp        0x7fc50be7f928
02270 bef6ffffff                     mov        esi, 0xfffffff6
02275 666690                         nop        
02278 c5f877                         vzeroupper 
0227b e8e025b4ff                     call       0x7fc50b9c3b60
02280 0f1f84007823002e               nop        dword ptr [rax + rax + 0x2e002378]
02288 49ba7fffe70bc57f0000           movabs     r10, 0x7fc50be7ff7f
02292 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02299 e942b9a7ff                     jmp        0x7fc50b8fcee0
0229e e8fd84a6ff                     call       0x7fc50b8e9aa0
022a3 e986ddffff                     jmp        0x7fc50be7f32e
