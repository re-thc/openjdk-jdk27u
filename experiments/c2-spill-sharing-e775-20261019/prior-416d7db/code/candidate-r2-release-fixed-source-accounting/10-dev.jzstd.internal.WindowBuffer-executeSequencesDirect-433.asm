00000 e8fb94ca18                     call       0x7f4c34b29880
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecf0000000                 sub        rsp, 0xf0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f8514250000                   jne        0x7f4c1be828c2
0002e 4c8b9640010000                 mov        r10, qword ptr [rsi + 0x140]
00035 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0003a 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
00041 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00046 448b36                         mov        r14d, dword ptr [rsi]
00049 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
00050 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00055 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
0005c 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00061 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
00068 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0006d 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
00074 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00079 448b9e30010000                 mov        r11d, dword ptr [rsi + 0x130]
00080 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00085 448b9618010000                 mov        r10d, dword ptr [rsi + 0x118]
0008c 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00091 8b9ef8000000                   mov        ebx, dword ptr [rsi + 0xf8]
00097 8baef0000000                   mov        ebp, dword ptr [rsi + 0xf0]
0009d 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000a4 4489542440                     mov        dword ptr [rsp + 0x40], r10d
000a9 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000b0 4c89542478                     mov        qword ptr [rsp + 0x78], r10
000b5 448b9ea0000000                 mov        r11d, dword ptr [rsi + 0xa0]
000bc 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
000c4 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000cb 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
000d3 448b5678                       mov        r10d, dword ptr [rsi + 0x78]
000d7 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
000df 448b5e70                       mov        r11d, dword ptr [rsi + 0x70]
000e3 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
000eb 448b6e68                       mov        r13d, dword ptr [rsi + 0x68]
000ef 448b5e48                       mov        r11d, dword ptr [rsi + 0x48]
000f3 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
000fb 448b5610                       mov        r10d, dword ptr [rsi + 0x10]
000ff 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00107 448b5e08                       mov        r11d, dword ptr [rsi + 8]
0010b 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00113 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
0011a 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00122 488bfe                         mov        rdi, rsi
00125 c5f877                         vzeroupper 
00128 49ba4088c0344c7f0000           movabs     r10, 0x7f4c34c08840
00132 41ffd2                         call       r10
00135 0f1f840000000000               nop        dword ptr [rax + rax]
0013d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00142 4d85d2                         test       r10, r10
00145 0f8459170000                   je         0x7f4c1be81c24
0014b 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0014f 41c1eb0a                       shr        r11d, 0xa
00153 4181fb0c080000                 cmp        r11d, 0x80c
0015a 0f85f81e0000                   jne        0x7f4c1be823d8
00160 4c891424                       mov        qword ptr [rsp], r10
00164 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00169 4d85d2                         test       r10, r10
0016c 0f843e170000                   je         0x7f4c1be81c30
00172 458b5204                       mov        r10d, dword ptr [r10 + 4]
00176 41c1ea0a                       shr        r10d, 0xa
0017a 4181fa05020000                 cmp        r10d, 0x205
00181 0f85d11e0000                   jne        0x7f4c1be823d8
00187 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0018c 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00194 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00199 4d85d2                         test       r10, r10
0019c 0f841e170000                   je         0x7f4c1be81c40
001a2 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001a6 41c1eb0a                       shr        r11d, 0xa
001aa 4181fb08020000                 cmp        r11d, 0x208
001b1 0f85a11e0000                   jne        0x7f4c1be823d8
001b7 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
001bf 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001c4 4d85d2                         test       r10, r10
001c7 0f8403170000                   je         0x7f4c1be81c50
001cd 458b5204                       mov        r10d, dword ptr [r10 + 4]
001d1 41c1ea0a                       shr        r10d, 0xa
001d5 4181fa07020000                 cmp        r10d, 0x207
001dc 0f85761e0000                   jne        0x7f4c1be823d8
001e2 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001e7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001ec 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001f1 4d85d2                         test       r10, r10
001f4 0f84e3160000                   je         0x7f4c1be81c5d
001fa 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001fe 41c1eb0a                       shr        r11d, 0xa
00202 4181fb07020000                 cmp        r11d, 0x207
00209 0f85491e0000                   jne        0x7f4c1be823d8
0020f 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00217 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0021c 458b5204                       mov        r10d, dword ptr [r10 + 4]
00220 41c1ea0a                       shr        r10d, 0xa
00224 4181fa05020000                 cmp        r10d, 0x205
0022b 0f85271e0000                   jne        0x7f4c1be823d8
00231 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00236 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
0023e 458b5208                       mov        r10d, dword ptr [r10 + 8]
00242 4489542408                     mov        dword ptr [rsp + 8], r10d
00247 4183c2f9                       add        r10d, -7
0024b 4585d2                         test       r10d, r10d
0024e 0f8c4c1e0000                   jl         0x7f4c1be82420
00254 448b542408                     mov        r10d, dword ptr [rsp + 8]
00259 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0025e 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00263 4183c3f1                       add        r11d, -0xf
00267 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0026c 4183c2f9                       add        r10d, -7
00270 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00278 e908020000                     jmp        0x7f4c1be80805
0027d 448bdd                         mov        r11d, ebp
00280 4d63d3                         movsxd     r10, r11d
00283 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0028a c442a8f5db                     bzhi       r11, r11, r10
0028f c4c1fb92fb                     kmovq      k7, r11
00294 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0029a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
002a0 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
002a8 4403dd                         add        r11d, ebp
002ab 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
002b3 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
002b7 418502                         test       dword ptr [r10], eax
002ba 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
002c2 0f8d90090000                   jge        0x7f4c1be80fd8
002c8 418bde                         mov        ebx, r14d
002cb 448bc3                         mov        r8d, ebx
002ce 442b8424cc000000               sub        r8d, dword ptr [rsp + 0xcc]
002d6 8bac2494000000                 mov        ebp, dword ptr [rsp + 0x94]
002dd 2bac24cc000000                 sub        ebp, dword ptr [rsp + 0xcc]
002e4 3bac24cc000000                 cmp        ebp, dword ptr [rsp + 0xcc]
002eb 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
002f3 410f4fea                       cmovg      ebp, r10d
002f7 4585c0                         test       r8d, r8d
002fa 0f8ced150000                   jl         0x7f4c1be81c6d
00300 85db                           test       ebx, ebx
00302 0f8ce5150000                   jl         0x7f4c1be81c6d
00308 458d1c28                       lea        r11d, [r8 + rbp]
0030c 448b542408                     mov        r10d, dword ptr [rsp + 8]
00311 453bd3                         cmp        r10d, r11d
00314 0f82d3150000                   jb         0x7f4c1be81c6d
0031a 448d342b                       lea        r14d, [rbx + rbp]
0031e 453bd6                         cmp        r10d, r14d
00321 0f82c6150000                   jb         0x7f4c1be81c6d
00327 85ed                           test       ebp, ebp
00329 0f8cbe150000                   jl         0x7f4c1be81c6d
0032f 85ed                           test       ebp, ebp
00331 0f8469ffffff                   je         0x7f4c1be80620
00337 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0033f 498d741a0c                     lea        rsi, [r10 + rbx + 0xc]
00344 4b8d7c020c                     lea        rdi, [r10 + r8 + 0xc]
00349 4863d5                         movsxd     rdx, ebp
0034c 4883fa20                       cmp        rdx, 0x20
00350 0f8627ffffff                   jbe        0x7f4c1be805fd
00356 c5f877                         vzeroupper 
00359 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00363 41ffd2                         call       r10
00366 0f1f840000000000               nop        dword ptr [rax + rax]
0036e e92dffffff                     jmp        0x7f4c1be80620
00373 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0037b 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00383 c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
0038a 8b9c2494000000                 mov        ebx, dword ptr [rsp + 0x94]
00391 4103da                         add        ebx, r10d
00394 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
00399 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0039e 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
003a6 e981020000                     jmp        0x7f4c1be809ac
003ab 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
003b3 4b8d7c320c                     lea        rdi, [r10 + r14 + 0xc]
003b8 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
003c0 4b8d741a0c                     lea        rsi, [r10 + r11 + 0xc]
003c5 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
003cd 440394249c000000               add        r10d, dword ptr [rsp + 0x9c]
003d5 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
003dd 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
003e5 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
003ed 0f8cec050000                   jl         0x7f4c1be80d5f
003f3 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
003fb 4183fa30                       cmp        r10d, 0x30
003ff 7e74                           jle        0x7f4c1be807f5
00401 4585f6                         test       r14d, r14d
00404 0f8c6e150000                   jl         0x7f4c1be81cf8
0040a 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00412 4585db                         test       r11d, r11d
00415 0f8c5d150000                   jl         0x7f4c1be81cf8
0041b 4503d6                         add        r10d, r14d
0041e 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00423 453bda                         cmp        r11d, r10d
00426 0f824c150000                   jb         0x7f4c1be81cf8
0042c 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00434 0f823e150000                   jb         0x7f4c1be81cf8
0043a 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00442 4585d2                         test       r10d, r10d
00445 0f8438010000                   je         0x7f4c1be80903
0044b 4963d2                         movsxd     rdx, r10d
0044e 4883fa20                       cmp        rdx, 0x20
00452 0f8608010000                   jbe        0x7f4c1be808e0
00458 c5f877                         vzeroupper 
0045b 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00465 41ffd2                         call       r10
00468 0f1f840000000000               nop        dword ptr [rax + rax]
00470 e90e010000                     jmp        0x7f4c1be80903
00475 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
0047a 8b9c249c000000                 mov        ebx, dword ptr [rsp + 0x9c]
00481 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
00485 443bb424c8000000               cmp        r14d, dword ptr [rsp + 0xc8]
0048d 0f83f5120000                   jae        0x7f4c1be81b08
00493 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0049b 4f8b44320c                     mov        r8, qword ptr [r10 + r14 + 0xc]
004a0 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
004a8 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
004b0 0f834a130000                   jae        0x7f4c1be81b80
004b6 4183c608                       add        r14d, 8
004ba 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
004be 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
004c6 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
004ce 4f8944190c                     mov        qword ptr [r9 + r11 + 0xc], r8
004d3 4183c308                       add        r11d, 8
004d7 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
004df 418502                         test       dword ptr [r10], eax
004e2 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
004ea 7d6b                           jge        0x7f4c1be808d7
004ec 0f1f4000                       nop        dword ptr [rax]
004f0 443bb424c8000000               cmp        r14d, dword ptr [rsp + 0xc8]
004f8 0f838a120000                   jae        0x7f4c1be81b08
004fe 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00506 4f8b44320c                     mov        r8, qword ptr [r10 + r14 + 0xc]
0050b 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00513 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
0051b 0f83df120000                   jae        0x7f4c1be81b80
00521 4183c608                       add        r14d, 8
00525 4d8b5f30                       mov        r11, qword ptr [r15 + 0x30]
00529 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00531 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
00539 4f8944110c                     mov        qword ptr [r9 + r10 + 0xc], r8
0053e 4183c208                       add        r10d, 8
00542 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
0054a 418503                         test       dword ptr [r11], eax
0054d 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00555 7c99                           jl         0x7f4c1be80870
00557 039c2494000000                 add        ebx, dword ptr [rsp + 0x94]
0055e eb33                           jmp        0x7f4c1be80913
00560 458bda                         mov        r11d, r10d
00563 4d63d3                         movsxd     r10, r11d
00566 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0056d c442a8f5db                     bzhi       r11, r11, r10
00572 c4c1fb92fb                     kmovq      k7, r11
00577 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0057d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00583 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
00588 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
0058f 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
00593 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
0059b 458b4208                       mov        r8d, dword ptr [r10 + 8]
0059f 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
005a4 4585db                         test       r11d, r11d
005a7 0f8cc3120000                   jl         0x7f4c1be81bf0
005ad 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
005b5 458b5a08                       mov        r11d, dword ptr [r10 + 8]
005b9 4183fb01                       cmp        r11d, 1
005bd 0f86ad120000                   jbe        0x7f4c1be81bf0
005c3 4183fb02                       cmp        r11d, 2
005c7 0f86a3120000                   jbe        0x7f4c1be81bf0
005cd 4585db                         test       r11d, r11d
005d0 0f869a120000                   jbe        0x7f4c1be81bf0
005d6 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
005de 418b4a08                       mov        ecx, dword ptr [r10 + 8]
005e2 448d49f1                       lea        r9d, [rcx - 0xf]
005e6 4585c9                         test       r9d, r9d
005e9 0f8c81120000                   jl         0x7f4c1be81bf0
005ef 8b7c2408                       mov        edi, dword ptr [rsp + 8]
005f3 448bd1                         mov        r10d, ecx
005f6 448d77f1                       lea        r14d, [rdi - 0xf]
005fa 4489b424d4000000               mov        dword ptr [rsp + 0xd4], r14d
00602 458d72f1                       lea        r14d, [r10 - 0xf]
00606 89ac2498000000                 mov        dword ptr [rsp + 0x98], ebp
0060d 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00612 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00617 894c2434                       mov        dword ptr [rsp + 0x34], ecx
0061b 897c243c                       mov        dword ptr [rsp + 0x3c], edi
0061f 4489542444                     mov        dword ptr [rsp + 0x44], r10d
00624 4489b424d0000000               mov        dword ptr [rsp + 0xd0], r14d
0062c 4d8b4f30                       mov        r9, qword ptr [r15 + 0x30]
00630 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00635 442b942498000000               sub        r10d, dword ptr [rsp + 0x98]
0063d 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00645 498d741b0c                     lea        rsi, [r11 + rbx + 0xc]
0064a 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00652 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
0065a 4b8d7c180c                     lea        rdi, [r8 + r11 + 0xc]
0065f 458d4501                       lea        r8d, [r13 + 1]
00663 4489442470                     mov        dword ptr [rsp + 0x70], r8d
00668 418501                         test       dword ptr [r9], eax
0066b 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
00670 0f8dfc090000                   jge        0x7f4c1be813f2
00676 443b44242c                     cmp        r8d, dword ptr [rsp + 0x2c]
0067b 0f83fd0d0000                   jae        0x7f4c1be817fe
00681 4d63dd                         movsxd     r11, r13d
00684 4c8b8424b0000000               mov        r8, qword ptr [rsp + 0xb0]
0068c 4f8b4cd818                     mov        r9, qword ptr [r8 + r11*8 + 0x18]
00691 458bd9                         mov        r11d, r9d
00694 4181e3ffff0100                 and        r11d, 0x1ffff
0069b 418bc3                         mov        eax, r11d
0069e 4d8bd9                         mov        r11, r9
006a1 49c1eb12                       shr        r11, 0x12
006a5 49c1f924                       sar        r9, 0x24
006a9 458bc3                         mov        r8d, r11d
006ac 458bd9                         mov        r11d, r9d
006af 418bd3                         mov        edx, r11d
006b2 4181e0ffff0300                 and        r8d, 0x3ffff
006b9 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
006c1 4585db                         test       r11d, r11d
006c4 0f8c620f0000                   jl         0x7f4c1be819ac
006ca 448bd8                         mov        r11d, eax
006cd 4585db                         test       r11d, r11d
006d0 0f850e020000                   jne        0x7f4c1be80c64
006d6 4533d2                         xor        r10d, r10d
006d9 418bc2                         mov        eax, r10d
006dc 83fa03                         cmp        edx, 3
006df 0f8e56020000                   jle        0x7f4c1be80cbb
006e5 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
006ed 458b5a10                       mov        r11d, dword ptr [r10 + 0x10]
006f1 45895a14                       mov        dword ptr [r10 + 0x14], r11d
006f5 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
006f9 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
00701 45895310                       mov        dword ptr [r11 + 0x10], r10d
00705 448d52fd                       lea        r10d, [rdx - 3]
00709 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00711 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00715 4863ac24cc000000               movsxd     rbp, dword ptr [rsp + 0xcc]
0071d 48896c2418                     mov        qword ptr [rsp + 0x18], rbp
00722 4c63d3                         movsxd     r10, ebx
00725 4c03542478                     add        r10, qword ptr [rsp + 0x78]
0072a 4863d0                         movsxd     rdx, eax
0072d 4c03d2                         add        r10, rdx
00730 493bea                         cmp        rbp, r10
00733 0f8f430f0000                   jg         0x7f4c1be819fc
00739 448d2c03                       lea        r13d, [rbx + rax]
0073d 458bf5                         mov        r14d, r13d
00740 442bb424cc000000               sub        r14d, dword ptr [rsp + 0xcc]
00748 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
00750 4585c0                         test       r8d, r8d
00753 0f84b3010000                   je         0x7f4c1be80c8c
00759 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
00761 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00769 4585db                         test       r11d, r11d
0076c 0f8e9a0e0000                   jle        0x7f4c1be8198c
00772 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0077a 4503dd                         add        r11d, r13d
0077d 443b9c2484000000               cmp        r11d, dword ptr [rsp + 0x84]
00785 0f8f450f0000                   jg         0x7f4c1be81a50
0078b 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00793 4403d0                         add        r10d, eax
00796 4489542474                     mov        dword ptr [rsp + 0x74], r10d
0079b 443b942490000000               cmp        r10d, dword ptr [rsp + 0x90]
007a3 0f8f7f0f0000                   jg         0x7f4c1be81aa8
007a9 83f810                         cmp        eax, 0x10
007ac 0f8fbb040000                   jg         0x7f4c1be80fed
007b2 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
007ba 443b8424d0000000               cmp        r8d, dword ptr [rsp + 0xd0]
007c2 0f83000d0000                   jae        0x7f4c1be81848
007c8 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
007d0 c4817a6f44020c                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0xc]
007d7 3b9c24d4000000                 cmp        ebx, dword ptr [rsp + 0xd4]
007de 0f83440d0000                   jae        0x7f4c1be818a8
007e4 468d1400                       lea        r10d, [rax + r8]
007e8 4489542474                     mov        dword ptr [rsp + 0x74], r10d
007ed 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
007f5 c4c17a7f441a0c                 vmovdqu    xmmword ptr [r10 + rbx + 0xc], xmm0
007fc 448d1418                       lea        r10d, [rax + rbx]
00800 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00808 458bf2                         mov        r14d, r10d
0080b 442bb424cc000000               sub        r14d, dword ptr [rsp + 0xcc]
00813 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0081b 4183fb10                       cmp        r11d, 0x10
0081f 0f8f86fbffff                   jg         0x7f4c1be8072b
00825 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
0082d 4183fb10                       cmp        r11d, 0x10
00831 0f8c74fbffff                   jl         0x7f4c1be8072b
00837 443bb424d4000000               cmp        r14d, dword ptr [rsp + 0xd4]
0083f 0f836b0d0000                   jae        0x7f4c1be81930
00845 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0084d c4817a6f44320c                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 0xc]
00854 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0085c 443b9c24d4000000               cmp        r11d, dword ptr [rsp + 0xd4]
00864 0f8209fbffff                   jb         0x7f4c1be806f3
0086a bee4ffffff                     mov        esi, 0xffffffe4
0086f 488b2c24                       mov        rbp, qword ptr [rsp]
00873 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00878 44895c2408                     mov        dword ptr [rsp + 8], r11d
0087d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00882 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00887 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0088c 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00891 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00896 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0089b 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
008a0 4489542438                     mov        dword ptr [rsp + 0x38], r10d
008a5 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
008ad 4c89542450                     mov        qword ptr [rsp + 0x50], r10
008b2 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
008ba 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
008bf 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
008c4 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
008c9 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
008d2 6690                           nop        
008d4 c5f877                         vzeroupper 
008d7 e80471b5ff                     call       0x7f4c1b9d7d60
008dc 0f1f8400d4090004               nop        dword ptr [rax + rax + 0x40009d4]
008e4 453bda                         cmp        r11d, r10d
008e7 0f8eeffdffff                   jle        0x7f4c1be80a5c
008ed be45ffffff                     mov        esi, 0xffffff45
008f2 418beb                         mov        ebp, r11d
008f5 44891424                       mov        dword ptr [rsp], r10d
008f9 666690                         nop        
008fc c5f877                         vzeroupper 
008ff e8dc70b5ff                     call       0x7f4c1b9d7d60
00904 0f1f8400fc090005               nop        dword ptr [rax + rax + 0x50009fc]
0090c 4d63de                         movsxd     r11, r14d
0090f 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
00917 0f8ccf100000                   jl         0x7f4c1be81d6c
0091d 483bac2488000000               cmp        rbp, qword ptr [rsp + 0x88]
00925 0f8f1d110000                   jg         0x7f4c1be81dc8
0092b 4533c0                         xor        r8d, r8d
0092e 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
00936 e926feffff                     jmp        0x7f4c1be80ae1
0093b 85c0                           test       eax, eax
0093d 7407                           je         0x7f4c1be80cc6
0093f 448d52ff                       lea        r10d, [rdx - 1]
00943 418bd2                         mov        edx, r10d
00946 85d2                           test       edx, edx
00948 750e                           jne        0x7f4c1be80cd8
0094a 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00952 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
00956 eb7a                           jmp        0x7f4c1be80d52
00958 83fa03                         cmp        edx, 3
0095b 0f8427130000                   je         0x7f4c1be82008
00961 83fa02                         cmp        edx, 2
00964 0f8782130000                   ja         0x7f4c1be8206c
0096a 3b542430                       cmp        edx, dword ptr [rsp + 0x30]
0096e 0f8338120000                   jae        0x7f4c1be81f2c
00974 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
0097c 458b54930c                     mov        r10d, dword ptr [r11 + rdx*4 + 0xc]
00981 85d2                           test       edx, edx
00983 7e41                           jle        0x7f4c1be80d46
00985 448d5aff                       lea        r11d, [rdx - 1]
00989 443b5c2430                     cmp        r11d, dword ptr [rsp + 0x30]
0098e 0f838c120000                   jae        0x7f4c1be81fa0
00994 660f1f440000                   nop        word ptr [rax + rax]
0099a 660f1f440000                   nop        word ptr [rax + rax]
009a0 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
009a8 458b449008                     mov        r8d, dword ptr [r8 + rdx*4 + 8]
009ad 4c8b8c24b8000000               mov        r9, qword ptr [rsp + 0xb8]
009b5 458944910c                     mov        dword ptr [r9 + rdx*4 + 0xc], r8d
009ba 448d5aff                       lea        r11d, [rdx - 1]
009be 418bd3                         mov        edx, r11d
009c1 4585db                         test       r11d, r11d
009c4 7fda                           jg         0x7f4c1be80d20
009c6 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
009ce 4589530c                       mov        dword ptr [r11 + 0xc], r10d
009d2 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
009da e936fdffff                     jmp        0x7f4c1be80a95
009df 4183fb10                       cmp        r11d, 0x10
009e3 0f8d27160000                   jge        0x7f4c1be82390
009e9 4183fb08                       cmp        r11d, 8
009ed 0f8d15070000                   jge        0x7f4c1be81488
009f3 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
009fb 4183fb10                       cmp        r11d, 0x10
009ff 0f8eb6000000                   jle        0x7f4c1be80e3b
00a05 4585f6                         test       r14d, r14d
00a08 0f8c82150000                   jl         0x7f4c1be82310
00a0e 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00a16 4585d2                         test       r10d, r10d
00a19 0f8c71150000                   jl         0x7f4c1be82310
00a1f 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00a24 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
00a2c 0f825e150000                   jb         0x7f4c1be82310
00a32 8b9c24cc000000                 mov        ebx, dword ptr [rsp + 0xcc]
00a39 039c249c000000                 add        ebx, dword ptr [rsp + 0x9c]
00a40 443bdb                         cmp        r11d, ebx
00a43 0f8247150000                   jb         0x7f4c1be82310
00a49 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00a51 4585d2                         test       r10d, r10d
00a54 0f8c36150000                   jl         0x7f4c1be82310
00a5a 4585d2                         test       r10d, r10d
00a5d 0f8468f8ffff                   je         0x7f4c1be8064b
00a63 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
00a68 4883fd20                       cmp        rbp, 0x20
00a6c 772d                           ja         0x7f4c1be80e1b
00a6e 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00a76 4d63d3                         movsxd     r10, r11d
00a79 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00a80 c442a8f5db                     bzhi       r11, r11, r10
00a85 c4c1fb92fb                     kmovq      k7, r11
00a8a 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00a90 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00a96 e930f8ffff                     jmp        0x7f4c1be8064b
00a9b 488bd5                         mov        rdx, rbp
00a9e c5f877                         vzeroupper 
00aa1 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00aab 41ffd2                         call       r10
00aae 0f1f840000000000               nop        dword ptr [rax + rax]
00ab6 e910f8ffff                     jmp        0x7f4c1be8064b
00abb 443b742408                     cmp        r14d, dword ptr [rsp + 8]
00ac0 0f838a120000                   jae        0x7f4c1be820d0
00ac6 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00ace 430fbe6c320c                   movsx      ebp, byte ptr [r10 + r14 + 0xc]
00ad4 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00adc 443b542408                     cmp        r10d, dword ptr [rsp + 8]
00ae1 0f83ed120000                   jae        0x7f4c1be82154
00ae7 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00aef 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00af7 43886c1a0c                     mov        byte ptr [r10 + r11 + 0xc], bpl
00afc 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
00b04 41ffc1                         inc        r9d
00b07 458d5e03                       lea        r11d, [r14 + 3]
00b0b 443b5c2408                     cmp        r11d, dword ptr [rsp + 8]
00b10 0f8326130000                   jae        0x7f4c1be821bc
00b16 4d63de                         movsxd     r11, r14d
00b19 430fbe6c1a0d                   movsx      ebp, byte ptr [r10 + r11 + 0xd]
00b1f 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00b27 4183c203                       add        r10d, 3
00b2b 443b542408                     cmp        r10d, dword ptr [rsp + 8]
00b30 0f8386130000                   jae        0x7f4c1be8223c
00b36 4c6394249c000000               movsxd     r10, dword ptr [rsp + 0x9c]
00b3e 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
00b46 43886c100d                     mov        byte ptr [r8 + r10 + 0xd], bpl
00b4b 470fbe44180e                   movsx      r8d, byte ptr [r8 + r11 + 0xe]
00b51 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
00b59 478844110e                     mov        byte ptr [r9 + r10 + 0xe], r8b
00b5e 470fbe5c190f                   movsx      r11d, byte ptr [r9 + r11 + 0xf]
00b64 47885c110f                     mov        byte ptr [r9 + r10 + 0xf], r11b
00b69 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00b71 4183fa08                       cmp        r10d, 8
00b75 0f83b1130000                   jae        0x7f4c1be822ac
00b7b 49bae0df2fe300000000           movabs     r10, 0xe32fdfe0
00b85 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00b8d 4703749a0c                     add        r14d, dword ptr [r10 + r11*4 + 0xc]
00b92 4489742418                     mov        dword ptr [rsp + 0x18], r14d
00b97 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00b9f 4183fb04                       cmp        r11d, 4
00ba3 7e43                           jle        0x7f4c1be80f68
00ba5 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00bac 83c504                         add        ebp, 4
00baf 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00bb7 418bd6                         mov        edx, r14d
00bba 6690                           nop        
00bbc c5f877                         vzeroupper 
00bbf e81cf9a8ff                     call       0x7f4c1b910860
00bc4 0f1f8400bc0c0006               nop        dword ptr [rax + rax + 0x6000cbc]
00bcc 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00bd4 8bd5                           mov        edx, ebp
00bd6 8bc8                           mov        ecx, eax
00bd8 c5f877                         vzeroupper 
00bdb e800f9a8ff                     call       0x7f4c1b910860
00be0 0f1f8400d80c0007               nop        dword ptr [rax + rax + 0x7000cd8]
00be8 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00bf0 4183fb08                       cmp        r11d, 8
00bf4 7e62                           jle        0x7f4c1be80fd8
00bf6 8b542418                       mov        edx, dword ptr [rsp + 0x18]
00bfa 49ba10e02fe300000000           movabs     r10, 0xe32fe010
00c04 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00c0c 432b549a0c                     sub        edx, dword ptr [r10 + r11*4 + 0xc]
00c11 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00c18 83c508                         add        ebp, 8
00c1b 83c208                         add        edx, 8
00c1e 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00c26 6690                           nop        
00c28 c5f877                         vzeroupper 
00c2b e8b0f8a8ff                     call       0x7f4c1b910860
00c30 0f1f8400280d0008               nop        dword ptr [rax + rax + 0x8000d28]
00c38 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00c40 8bd5                           mov        edx, ebp
00c42 488bc8                         mov        rcx, rax
00c45 666690                         nop        
00c48 c5f877                         vzeroupper 
00c4b e890f8a8ff                     call       0x7f4c1b910860
00c50 0f1f8400480d0009               nop        dword ptr [rax + rax + 0x9000d48]
00c58 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
00c5d 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
00c64 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
00c68 e926f9ffff                     jmp        0x7f4c1be80913
00c6d 83f830                         cmp        eax, 0x30
00c70 0f8e89000000                   jle        0x7f4c1be8107f
00c76 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00c7e 4585d2                         test       r10d, r10d
00c81 0f8c8d150000                   jl         0x7f4c1be82594
00c87 85db                           test       ebx, ebx
00c89 0f8c85150000                   jl         0x7f4c1be82594
00c8f 8b6c2434                       mov        ebp, dword ptr [rsp + 0x34]
00c93 3b6c2474                       cmp        ebp, dword ptr [rsp + 0x74]
00c97 0f8277150000                   jb         0x7f4c1be82594
00c9d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00ca2 453bdd                         cmp        r11d, r13d
00ca5 0f8269150000                   jb         0x7f4c1be82594
00cab 85c0                           test       eax, eax
00cad 7429                           je         0x7f4c1be81058
00caf 4883fa20                       cmp        rdx, 0x20
00cb3 7730                           ja         0x7f4c1be81065
00cb5 448bd0                         mov        r10d, eax
00cb8 4d63d2                         movsxd     r10, r10d
00cbb 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00cc2 c442a8f5db                     bzhi       r11, r11, r10
00cc7 c4c1fb92fb                     kmovq      k7, r11
00ccc 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00cd2 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00cd8 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
00ce0 e92efbffff                     jmp        0x7f4c1be80b93
00ce5 c5f877                         vzeroupper 
00ce8 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00cf2 41ffd2                         call       r10
00cf5 0f1f840000000000               nop        dword ptr [rax + rax]
00cfd ebd9                           jmp        0x7f4c1be81058
00cff 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00d07 443b8424d0000000               cmp        r8d, dword ptr [rsp + 0xd0]
00d0f 0f83f3130000                   jae        0x7f4c1be82488
00d15 4d63c8                         movsxd     r9, r8d
00d18 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00d20 c4817a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 0xc]
00d27 3b9c24d4000000                 cmp        ebx, dword ptr [rsp + 0xd4]
00d2e 0f8344140000                   jae        0x7f4c1be824f8
00d34 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00d39 448d5310                       lea        r10d, [rbx + 0x10]
00d3d 418bd2                         mov        edx, r10d
00d40 4c63d3                         movsxd     r10, ebx
00d43 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00d4b c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
00d52 448bc2                         mov        r8d, edx
00d55 453bc5                         cmp        r8d, r13d
00d58 0f8dd8020000                   jge        0x7f4c1be813b6
00d5e 4d2bca                         sub        r9, r10
00d61 4d63d0                         movsxd     r10, r8d
00d64 48634c2444                     movsxd     rcx, dword ptr [rsp + 0x44]
00d69 4883c1f1                       add        rcx, -0xf
00d6d 4f8d1c0a                       lea        r11, [r10 + r9]
00d71 4c3bd9                         cmp        r11, rcx
00d74 0f8316150000                   jae        0x7f4c1be82610
00d7a 4963fd                         movsxd     rdi, r13d
00d7d 4c8bdf                         mov        r11, rdi
00d80 4d2bda                         sub        r11, r10
00d83 4983c30f                       add        r11, 0xf
00d87 4983e3f0                       and        r11, 0xfffffffffffffff0
00d8b 458bdb                         mov        r11d, r11d
00d8e 458d541b10                     lea        r10d, [r11 + rbx + 0x10]
00d93 4d63d2                         movsxd     r10, r10d
00d96 4f8d5c0af0                     lea        r11, [r10 + r9 - 0x10]
00d9b 4c3bd9                         cmp        r11, rcx
00d9e 0f83ec140000                   jae        0x7f4c1be82610
00da4 443b8424d4000000               cmp        r8d, dword ptr [rsp + 0xd4]
00dac 0f83de140000                   jae        0x7f4c1be82610
00db2 4983c2f0                       add        r10, -0x10
00db6 4c635c243c                     movsxd     r11, dword ptr [rsp + 0x3c]
00dbb 4983c3f1                       add        r11, -0xf
00dbf 4d3bd3                         cmp        r10, r11
00dc2 0f83c8140000                   jae        0x7f4c1be82610
00dc8 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00dcf 0f8f13150000                   jg         0x7f4c1be82668
00dd5 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00dda 442bc3                         sub        r8d, ebx
00ddd 83c320                         add        ebx, 0x20
00de0 458d1c10                       lea        r11d, [r8 + rdx]
00de4 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00dec c4817a6f441a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 0xc]
00df3 448bd2                         mov        r10d, edx
00df6 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00dfe c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
00e05 448d5210                       lea        r10d, [rdx + 0x10]
00e09 418bd2                         mov        edx, r10d
00e0c 443bd3                         cmp        r10d, ebx
00e0f 7ccf                           jl         0x7f4c1be81160
00e11 4881c710ffffff                 add        rdi, -0xf0
00e18 4881ff00000080                 cmp        rdi, -0x80000000
00e1f 49c7c300000080                 mov        r11, 0xffffffff80000000
00e26 490f4cfb                       cmovl      rdi, r11
00e2a 8bcf                           mov        ecx, edi
00e2c 443bd1                         cmp        r10d, ecx
00e2f 0f8dc9010000                   jge        0x7f4c1be8137e
00e35 418bd2                         mov        edx, r10d
00e38 0f1f840000000000               nop        dword ptr [rax + rax]
00e40 458d0c10                       lea        r9d, [r8 + rdx]
00e44 448bda                         mov        r11d, edx
00e47 4d63db                         movsxd     r11, r11d
00e4a 458bd1                         mov        r10d, r9d
00e4d 488b9c24a8000000               mov        rbx, qword ptr [rsp + 0xa8]
00e55 c4a17a6f44130c                 vmovdqu    xmm0, xmmword ptr [rbx + r10 + 0xc]
00e5c 4d63d1                         movsxd     r10, r9d
00e5f 448bca                         mov        r9d, edx
00e62 488b9c24c0000000               mov        rbx, qword ptr [rsp + 0xc0]
00e6a c4a17a7f440b0c                 vmovdqu    xmmword ptr [rbx + r9 + 0xc], xmm0
00e71 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00e79 c4817a6f44111c                 vmovdqu    xmm0, xmmword ptr [r9 + r10 + 0x1c]
00e80 c4a17a7f441b1c                 vmovdqu    xmmword ptr [rbx + r11 + 0x1c], xmm0
00e87 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00e8f c4817a6f44112c                 vmovdqu    xmm0, xmmword ptr [r9 + r10 + 0x2c]
00e96 c4a17a7f441b2c                 vmovdqu    xmmword ptr [rbx + r11 + 0x2c], xmm0
00e9d 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00ea5 c4817a6f44113c                 vmovdqu    xmm0, xmmword ptr [r9 + r10 + 0x3c]
00eac c4a17a7f441b3c                 vmovdqu    xmmword ptr [rbx + r11 + 0x3c], xmm0
00eb3 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00ebb c4817a6f44114c                 vmovdqu    xmm0, xmmword ptr [r9 + r10 + 0x4c]
00ec2 c4a17a7f441b4c                 vmovdqu    xmmword ptr [rbx + r11 + 0x4c], xmm0
00ec9 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00ed1 c4817a6f44115c                 vmovdqu    xmm0, xmmword ptr [r9 + r10 + 0x5c]
00ed8 c4a17a7f441b5c                 vmovdqu    xmmword ptr [rbx + r11 + 0x5c], xmm0
00edf 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00ee7 c4817a6f44116c                 vmovdqu    xmm0, xmmword ptr [r9 + r10 + 0x6c]
00eee c4a17a7f441b6c                 vmovdqu    xmmword ptr [rbx + r11 + 0x6c], xmm0
00ef5 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00efd c4817a6f44117c                 vmovdqu    xmm0, xmmword ptr [r9 + r10 + 0x7c]
00f04 c4a17a7f441b7c                 vmovdqu    xmmword ptr [rbx + r11 + 0x7c], xmm0
00f0b 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00f13 c4817a6f84118c000000           vmovdqu    xmm0, xmmword ptr [r9 + r10 + 0x8c]
00f1d c4a17a7f841b8c000000           vmovdqu    xmmword ptr [rbx + r11 + 0x8c], xmm0
00f27 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00f2f c4817a6f84119c000000           vmovdqu    xmm0, xmmword ptr [r9 + r10 + 0x9c]
00f39 c4a17a7f841b9c000000           vmovdqu    xmmword ptr [rbx + r11 + 0x9c], xmm0
00f43 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00f4b c4817a6f8411ac000000           vmovdqu    xmm0, xmmword ptr [r9 + r10 + 0xac]
00f55 c4a17a7f841bac000000           vmovdqu    xmmword ptr [rbx + r11 + 0xac], xmm0
00f5f 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00f67 c4817a6f8411bc000000           vmovdqu    xmm0, xmmword ptr [r9 + r10 + 0xbc]
00f71 c4a17a7f841bbc000000           vmovdqu    xmmword ptr [rbx + r11 + 0xbc], xmm0
00f7b 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00f83 c4817a6f8411cc000000           vmovdqu    xmm0, xmmword ptr [r9 + r10 + 0xcc]
00f8d c4a17a7f841bcc000000           vmovdqu    xmmword ptr [rbx + r11 + 0xcc], xmm0
00f97 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00f9f c4817a6f8411dc000000           vmovdqu    xmm0, xmmword ptr [r9 + r10 + 0xdc]
00fa9 c4a17a7f841bdc000000           vmovdqu    xmmword ptr [rbx + r11 + 0xdc], xmm0
00fb3 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00fbb c4817a6f8411ec000000           vmovdqu    xmm0, xmmword ptr [r9 + r10 + 0xec]
00fc5 c4a17a7f841bec000000           vmovdqu    xmmword ptr [rbx + r11 + 0xec], xmm0
00fcf 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00fd7 c4817a6f8411fc000000           vmovdqu    xmm0, xmmword ptr [r9 + r10 + 0xfc]
00fe1 c4a17a7f841bfc000000           vmovdqu    xmmword ptr [rbx + r11 + 0xfc], xmm0
00feb 448d9200010000                 lea        r10d, [rdx + 0x100]
00ff2 418bd2                         mov        edx, r10d
00ff5 443bd1                         cmp        r10d, ecx
00ff8 0f8c42feffff                   jl         0x7f4c1be811c0
00ffe 413bd5                         cmp        edx, r13d
01001 7d33                           jge        0x7f4c1be813b6
01003 448bd2                         mov        r10d, edx
01006 6690                           nop        
01008 478d1c10                       lea        r11d, [r8 + r10]
0100c 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
01014 c4817a6f44190c                 vmovdqu    xmm0, xmmword ptr [r9 + r11 + 0xc]
0101b 458bda                         mov        r11d, r10d
0101e 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
01026 c4817a7f44190c                 vmovdqu    xmmword ptr [r9 + r11 + 0xc], xmm0
0102d 4183c210                       add        r10d, 0x10
01031 453bd5                         cmp        r10d, r13d
01034 7cd2                           jl         0x7f4c1be81388
01036 448bd0                         mov        r10d, eax
01039 4403542438                     add        r10d, dword ptr [rsp + 0x38]
0103e 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01043 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
0104b e9c3f7ffff                     jmp        0x7f4c1be80b93
01050 4d63d2                         movsxd     r10, r10d
01053 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0105a c442a8f5db                     bzhi       r11, r11, r10
0105f c4c1fb92fb                     kmovq      k7, r11
01064 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0106a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01070 eb78                           jmp        0x7f4c1be8146a
01072 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
0107a 4585c0                         test       r8d, r8d
0107d 0f8c61100000                   jl         0x7f4c1be82464
01083 85db                           test       ebx, ebx
01085 0f8c59100000                   jl         0x7f4c1be82464
0108b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01090 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
01095 0f8249100000                   jb         0x7f4c1be82464
0109b 428d2c13                       lea        ebp, [rbx + r10]
0109f 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
010a4 443bdd                         cmp        r11d, ebp
010a7 0f8237100000                   jb         0x7f4c1be82464
010ad 4585d2                         test       r10d, r10d
010b0 0f8c2e100000                   jl         0x7f4c1be82464
010b6 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
010bb 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
010c3 7425                           je         0x7f4c1be8146a
010c5 4963d2                         movsxd     rdx, r10d
010c8 4883fa20                       cmp        rdx, 0x20
010cc 0f867effffff                   jbe        0x7f4c1be813d0
010d2 c5f877                         vzeroupper 
010d5 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
010df 41ffd2                         call       r10
010e2 0f1f840000000000               nop        dword ptr [rax + rax]
010ea 4c8b1424                       mov        r10, qword ptr [rsp]
010ee 41896a3c                       mov        dword ptr [r10 + 0x3c], ebp
010f2 c5f877                         vzeroupper 
010f5 4881c4f0000000                 add        rsp, 0xf0
010fc 5d                             pop        rbp
010fd 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
01101 0f8725140000                   ja         0x7f4c1be828ac
01107 c3                             ret        
01108 443bb424c8000000               cmp        r14d, dword ptr [rsp + 0xc8]
01110 0f832a120000                   jae        0x7f4c1be826c0
01116 458bce                         mov        r9d, r14d
01119 4963d9                         movsxd     rbx, r9d
0111c 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
01124 4d8b441a0c                     mov        r8, qword ptr [r10 + rbx + 0xc]
01129 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
01131 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
01139 0f8375120000                   jae        0x7f4c1be82734
0113f 418d4908                       lea        ecx, [r9 + 8]
01143 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01147 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0114e 4c63d8                         movsxd     r11, eax
01151 488bbc24c0000000               mov        rdi, qword ptr [rsp + 0xc0]
01159 4e89441f0c                     mov        qword ptr [rdi + r11 + 0xc], r8
0115e 8d7808                         lea        edi, [rax + 8]
01161 418502                         test       dword ptr [r10], eax
01164 3bbc2498000000                 cmp        edi, dword ptr [rsp + 0x98]
0116b 0f8de7faffff                   jge        0x7f4c1be80fd8
01171 492bdb                         sub        rbx, r11
01174 486374240c                     movsxd     rsi, dword ptr [rsp + 0xc]
01179 4883c6f9                       add        rsi, -7
0117d 4c63c7                         movsxd     r8, edi
01180 4d8d1418                       lea        r10, [r8 + rbx]
01184 4c3bd6                         cmp        r10, rsi
01187 0f83a3120000                   jae        0x7f4c1be827b0
0118d 4863942498000000               movsxd     rdx, dword ptr [rsp + 0x98]
01195 4c8bd2                         mov        r10, rdx
01198 4d2bd0                         sub        r10, r8
0119b 4983c207                       add        r10, 7
0119f 4983e2f8                       and        r10, 0xfffffffffffffff8
011a3 458bd2                         mov        r10d, r10d
011a6 458d5c0208                     lea        r11d, [r10 + rax + 8]
011ab 4d63d3                         movsxd     r10, r11d
011ae 4d8d5c1af8                     lea        r11, [r10 + rbx - 8]
011b3 4c3bde                         cmp        r11, rsi
011b6 0f8374120000                   jae        0x7f4c1be827b0
011bc 3bbc24c8000000                 cmp        edi, dword ptr [rsp + 0xc8]
011c3 0f8367120000                   jae        0x7f4c1be827b0
011c9 4983c2f8                       add        r10, -8
011cd 4c3bd6                         cmp        r10, rsi
011d0 0f835a120000                   jae        0x7f4c1be827b0
011d6 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
011de 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
011e5 0f8fa5120000                   jg         0x7f4c1be82810
011eb 442bc8                         sub        r9d, eax
011ee 418bc9                         mov        ecx, r9d
011f1 41baf4ffffff                   mov        r10d, 0xfffffff4
011f7 4c8d5ac8                       lea        r11, [rdx - 0x38]
011fb 4981fb00000080                 cmp        r11, -0x80000000
01202 49c7c100000080                 mov        r9, 0xffffffff80000000
01209 4d0f4cd9                       cmovl      r11, r9
0120d 418bdb                         mov        ebx, r11d
01210 442bb4249c000000               sub        r14d, dword ptr [rsp + 0x9c]
01218 448d5810                       lea        r11d, [rax + 0x10]
0121c 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
01224 498bf1                         mov        rsi, r9
01227 4963eb                         movsxd     rbp, r11d
0122a 458bc9                         mov        r9d, r9d
0122d 452bd1                         sub        r10d, r9d
01230 442bd0                         sub        r10d, eax
01233 4183c2f0                       add        r10d, -0x10
01237 41b906000000                   mov        r9d, 6
0123d c442b0f5d2                     bzhi       r10, r10, r9
01242 4903ea                         add        rbp, r10
01245 483bea                         cmp        rbp, rdx
01248 4c8bca                         mov        r9, rdx
0124b 4c0f4ccd                       cmovl      r9, rbp
0124f 4d8bd1                         mov        r10, r9
01252 4d2bd0                         sub        r10, r8
01255 498d42ff                       lea        rax, [r10 - 1]
01259 48c1f83f                       sar        rax, 0x3f
0125d 48c1e83d                       shr        rax, 0x3d
01261 4e8d5410ff                     lea        r10, [rax + r10 - 1]
01266 4983e2f8                       and        r10, 0xfffffffffffffff8
0126a 4d03d0                         add        r10, r8
0126d 4d3bc2                         cmp        r8, r10
01270 4d0f4cc2                       cmovl      r8, r10
01274 418bc0                         mov        eax, r8d
01277 458d440608                     lea        r8d, [r14 + rax + 8]
0127c 83c008                         add        eax, 8
0127f 4963e8                         movsxd     rbp, r8d
01282 4803ee                         add        rbp, rsi
01285 4863c0                         movsxd     rax, eax
01288 4803c6                         add        rax, rsi
0128b 4c8d450c                       lea        r8, [rbp + 0xc]
0128f 4883c54c                       add        rbp, 0x4c
01293 488d704c                       lea        rsi, [rax + 0x4c]
01297 4533d2                         xor        r10d, r10d
0129a 493bf0                         cmp        rsi, r8
0129d 410f96c2                       setbe      r10b
012a1 4883c00c                       add        rax, 0xc
012a5 4533c0                         xor        r8d, r8d
012a8 483be8                         cmp        rbp, rax
012ab 410f96c0                       setbe      r8b
012af 450bd0                         or         r10d, r8d
012b2 0f84ec070000                   je         0x7f4c1be81e24
012b8 458bd1                         mov        r10d, r9d
012bb 90                             nop        
012bc 448bc7                         mov        r8d, edi
012bf 448d1c39                       lea        r11d, [rcx + rdi]
012c3 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
012cb 4f8b5c190c                     mov        r11, qword ptr [r9 + r11 + 0xc]
012d0 4f895c010c                     mov        qword ptr [r9 + r8 + 0xc], r11
012d5 83c708                         add        edi, 8
012d8 413bfa                         cmp        edi, r10d
012db 7cdf                           jl         0x7f4c1be8163c
012dd 4881c208feffff                 add        rdx, -0x1f8
012e4 4881fa00000080                 cmp        rdx, -0x80000000
012eb 49c7c200000080                 mov        r10, 0xffffffff80000000
012f2 490f4cd2                       cmovl      rdx, r10
012f6 448bd2                         mov        r10d, edx
012f9 413bfa                         cmp        edi, r10d
012fc 0f8d3a010000                   jge        0x7f4c1be817bc
01302 0f1f8000000000                 nop        dword ptr [rax]
01309 0f1f8000000000                 nop        dword ptr [rax]
01310 448bc7                         mov        r8d, edi
01313 4963d0                         movsxd     rdx, r8d
01316 448bdf                         mov        r11d, edi
01319 448d0c39                       lea        r9d, [rcx + rdi]
0131d 448d4740                       lea        r8d, [rdi + 0x40]
01321 4403c1                         add        r8d, ecx
01324 418bf1                         mov        esi, r9d
01327 488b8424c0000000               mov        rax, qword ptr [rsp + 0xc0]
0132f 62f17e486f84300c000000         vmovdqu32  zmm0, zmmword ptr [rax + rsi + 0xc]
0133a 62b17e487f84180c000000         vmovdqu32  zmmword ptr [rax + r11 + 0xc], zmm0
01345 62b17e486f84000c000000         vmovdqu32  zmm0, zmmword ptr [rax + r8 + 0xc]
01350 62f17e487f84104c000000         vmovdqu32  zmmword ptr [rax + rdx + 0x4c], zmm0
0135b 4963f1                         movsxd     rsi, r9d
0135e 448d9f80000000                 lea        r11d, [rdi + 0x80]
01365 4403d9                         add        r11d, ecx
01368 62b17e486f84180c000000         vmovdqu32  zmm0, zmmword ptr [rax + r11 + 0xc]
01373 62f17e487f84108c000000         vmovdqu32  zmmword ptr [rax + rdx + 0x8c], zmm0
0137e 62f17e486f8430cc000000         vmovdqu32  zmm0, zmmword ptr [rax + rsi + 0xcc]
01389 62f17e487f8410cc000000         vmovdqu32  zmmword ptr [rax + rdx + 0xcc], zmm0
01394 448d8f00010000                 lea        r9d, [rdi + 0x100]
0139b 4403c9                         add        r9d, ecx
0139e 458bd9                         mov        r11d, r9d
013a1 62b17e486f84080c000000         vmovdqu32  zmm0, zmmword ptr [rax + r9 + 0xc]
013ac 62f17e487f84100c010000         vmovdqu32  zmmword ptr [rax + rdx + 0x10c], zmm0
013b7 62f17e486f84304c010000         vmovdqu32  zmm0, zmmword ptr [rax + rsi + 0x14c]
013c2 62f17e487f84104c010000         vmovdqu32  zmmword ptr [rax + rdx + 0x14c], zmm0
013cd 62f17e486f84308c010000         vmovdqu32  zmm0, zmmword ptr [rax + rsi + 0x18c]
013d8 62f17e487f84108c010000         vmovdqu32  zmmword ptr [rax + rdx + 0x18c], zmm0
013e3 4d63db                         movsxd     r11, r11d
013e6 62b17e486f8418cc000000         vmovdqu32  zmm0, zmmword ptr [rax + r11 + 0xcc]
013f1 62f17e487f8410cc010000         vmovdqu32  zmmword ptr [rax + rdx + 0x1cc], zmm0
013fc 81c700020000                   add        edi, 0x200
01402 413bfa                         cmp        edi, r10d
01405 0f8c05ffffff                   jl         0x7f4c1be81690
0140b 3bfb                           cmp        edi, ebx
0140d 7d2d                           jge        0x7f4c1be817bc
0140f 90                             nop        
01410 448d1c39                       lea        r11d, [rcx + rdi]
01414 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0141c 62917e486f841a0c000000         vmovdqu32  zmm0, zmmword ptr [r10 + r11 + 0xc]
01427 448bdf                         mov        r11d, edi
0142a 62917e487f841a0c000000         vmovdqu32  zmmword ptr [r10 + r11 + 0xc], zmm0
01435 83c740                         add        edi, 0x40
01438 3bfb                           cmp        edi, ebx
0143a 7cd4                           jl         0x7f4c1be81790
0143c 3bbc2498000000                 cmp        edi, dword ptr [rsp + 0x98]
01443 0f8d0ff8ffff                   jge        0x7f4c1be80fd8
01449 666690                         nop        
0144c 448d1c39                       lea        r11d, [rcx + rdi]
01450 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
01458 4f8b541a0c                     mov        r10, qword ptr [r10 + r11 + 0xc]
0145d 448bc7                         mov        r8d, edi
01460 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01468 4f8954030c                     mov        qword ptr [r11 + r8 + 0xc], r10
0146d 83c708                         add        edi, 8
01470 3bbc2498000000                 cmp        edi, dword ptr [rsp + 0x98]
01477 7cd3                           jl         0x7f4c1be817cc
01479 e9daf7ffff                     jmp        0x7f4c1be80fd8
0147e bee4ffffff                     mov        esi, 0xffffffe4
01483 488b2c24                       mov        rbp, qword ptr [rsp]
01487 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0148c 4489542408                     mov        dword ptr [rsp + 8], r10d
01491 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01496 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0149b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
014a0 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
014a5 895c2430                       mov        dword ptr [rsp + 0x30], ebx
014a9 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
014ae 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
014b3 4489442464                     mov        dword ptr [rsp + 0x64], r8d
014b8 c5f877                         vzeroupper 
014bb e82065b5ff                     call       0x7f4c1b9d7d60
014c0 0f1f8400b815000b               nop        dword ptr [rax + rax + 0xb0015b8]
014c8 bee4ffffff                     mov        esi, 0xffffffe4
014cd 488b2c24                       mov        rbp, qword ptr [rsp]
014d1 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
014d6 44895c2408                     mov        dword ptr [rsp + 8], r11d
014db 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
014e0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
014e5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
014ea 448954240c                     mov        dword ptr [rsp + 0xc], r10d
014ef 895c2430                       mov        dword ptr [rsp + 0x30], ebx
014f3 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
014f8 4489542438                     mov        dword ptr [rsp + 0x38], r10d
014fd 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01502 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01507 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0150c 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01511 89442464                       mov        dword ptr [rsp + 0x64], eax
01515 666690                         nop        
01518 c5f877                         vzeroupper 
0151b e8c064b5ff                     call       0x7f4c1b9d7d60
01520 0f1f84001816000c               nop        dword ptr [rax + rax + 0xc001618]
01528 bee4ffffff                     mov        esi, 0xffffffe4
0152d 488b2c24                       mov        rbp, qword ptr [rsp]
01531 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01536 4489542408                     mov        dword ptr [rsp + 8], r10d
0153b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01540 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01545 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0154a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0154f 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01554 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01559 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0155e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01563 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01568 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01570 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01575 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0157d 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01582 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01587 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0158c 89442464                       mov        dword ptr [rsp + 0x64], eax
01590 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01594 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0159d 666690                         nop        
015a0 c5f877                         vzeroupper 
015a3 e83864b5ff                     call       0x7f4c1b9d7d60
015a8 0f1f8400a016000d               nop        dword ptr [rax + rax + 0xd0016a0]
015b0 bee4ffffff                     mov        esi, 0xffffffe4
015b5 488b2c24                       mov        rbp, qword ptr [rsp]
015b9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
015be 4489542408                     mov        dword ptr [rsp + 8], r10d
015c3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015c8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015cd 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
015d2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
015d7 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
015dc 4489542434                     mov        dword ptr [rsp + 0x34], r10d
015e1 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
015e6 4489542438                     mov        dword ptr [rsp + 0x38], r10d
015eb 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
015f0 4489542460                     mov        dword ptr [rsp + 0x60], r10d
015f5 4489742470                     mov        dword ptr [rsp + 0x70], r14d
015fa 6690                           nop        
015fc c5f877                         vzeroupper 
015ff e8dc63b5ff                     call       0x7f4c1b9d7d60
01604 0f1f8400fc16000e               nop        dword ptr [rax + rax + 0xe0016fc]
0160c be45ffffff                     mov        esi, 0xffffff45
01611 488b2c24                       mov        rbp, qword ptr [rsp]
01615 4c89542408                     mov        qword ptr [rsp + 8], r10
0161a 6690                           nop        
0161c c5f877                         vzeroupper 
0161f e8bc63b5ff                     call       0x7f4c1b9d7d60
01624 0f1f84001c17000f               nop        dword ptr [rax + rax + 0xf00171c]
0162c be45ffffff                     mov        esi, 0xffffff45
01631 488b2c24                       mov        rbp, qword ptr [rsp]
01635 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0163a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0163f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01644 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01649 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0164e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01653 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01657 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0165c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01661 89442464                       mov        dword ptr [rsp + 0x64], eax
01665 8954246c                       mov        dword ptr [rsp + 0x6c], edx
01669 666690                         nop        
0166c c5f877                         vzeroupper 
0166f e86c63b5ff                     call       0x7f4c1b9d7d60
01674 0f1f84006c170010               nop        dword ptr [rax + rax + 0x1000176c]
0167c 493bea                         cmp        rbp, r10
0167f bdffffffff                     mov        ebp, 0xffffffff
01684 7c08                           jl         0x7f4c1be81a0e
01686 400f95c5                       setne      bpl
0168a 400fb6ed                       movzx      ebp, bpl
0168e be45ffffff                     mov        esi, 0xffffff45
01693 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01698 4489442414                     mov        dword ptr [rsp + 0x14], r8d
0169d 895c2438                       mov        dword ptr [rsp + 0x38], ebx
016a1 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
016a6 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
016ab 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
016b0 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
016b5 8944246c                       mov        dword ptr [rsp + 0x6c], eax
016b9 4c89542478                     mov        qword ptr [rsp + 0x78], r10
016be 6690                           nop        
016c0 c5f877                         vzeroupper 
016c3 e81863b5ff                     call       0x7f4c1b9d7d60
016c8 0f1f8400c0170011               nop        dword ptr [rax + rax + 0x110017c0]
016d0 be45ffffff                     mov        esi, 0xffffff45
016d5 488b2c24                       mov        rbp, qword ptr [rsp]
016d9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
016de 4489542408                     mov        dword ptr [rsp + 8], r10d
016e3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016e8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016ed 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
016f2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
016f7 895c2430                       mov        dword ptr [rsp + 0x30], ebx
016fb 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01700 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01705 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0170a 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0170f 89442464                       mov        dword ptr [rsp + 0x64], eax
01713 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
01718 c5f877                         vzeroupper 
0171b e8c062b5ff                     call       0x7f4c1b9d7d60
01720 0f1f840018180012               nop        dword ptr [rax + rax + 0x12001818]
01728 be45ffffff                     mov        esi, 0xffffff45
0172d 488b2c24                       mov        rbp, qword ptr [rsp]
01731 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01736 44895c2408                     mov        dword ptr [rsp + 8], r11d
0173b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01740 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01745 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0174a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0174f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01753 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01758 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0175d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01762 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01767 89442464                       mov        dword ptr [rsp + 0x64], eax
0176b 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01770 4489542470                     mov        dword ptr [rsp + 0x70], r10d
01775 666690                         nop        
01778 c5f877                         vzeroupper 
0177b e86062b5ff                     call       0x7f4c1b9d7d60
01780 0f1f840078180013               nop        dword ptr [rax + rax + 0x13001878]
01788 bee4ffffff                     mov        esi, 0xffffffe4
0178d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01792 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01797 895c2438                       mov        dword ptr [rsp + 0x38], ebx
0179b 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
017a0 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
017a5 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
017aa 4c89542440                     mov        qword ptr [rsp + 0x40], r10
017af 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
017b7 4489542448                     mov        dword ptr [rsp + 0x48], r10d
017bc 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
017c4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
017c9 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
017d1 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
017d6 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
017de 4489542460                     mov        dword ptr [rsp + 0x60], r10d
017e3 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
017e8 4489b42484000000               mov        dword ptr [rsp + 0x84], r14d
017f0 c5f877                         vzeroupper 
017f3 e8e861b5ff                     call       0x7f4c1b9d7d60
017f8 0f1f8400f0180014               nop        dword ptr [rax + rax + 0x140018f0]
01800 bee4ffffff                     mov        esi, 0xffffffe4
01805 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0180a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0180f 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01813 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01818 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0181d 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01822 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01827 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
0182f 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01834 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0183c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01841 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01849 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0184e 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
01853 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01858 4c89442478                     mov        qword ptr [rsp + 0x78], r8
0185d 666690                         nop        
01860 c5f877                         vzeroupper 
01863 e87861b5ff                     call       0x7f4c1b9d7d60
01868 0f1f840060190015               nop        dword ptr [rax + rax + 0x15001960]
01870 bebeffffff                     mov        esi, 0xffffffbe
01875 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0187a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0187f 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01883 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01888 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0188d 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
01892 6690                           nop        
01894 c5f877                         vzeroupper 
01897 e84461b5ff                     call       0x7f4c1b9d7d60
0189c 0f1f840094190016               nop        dword ptr [rax + rax + 0x16001994]
018a4 4533d2                         xor        r10d, r10d
018a7 4c891424                       mov        qword ptr [rsp], r10
018ab e9b4e8ffff                     jmp        0x7f4c1be804e4
018b0 4533d2                         xor        r10d, r10d
018b3 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
018bb e9d4e8ffff                     jmp        0x7f4c1be80514
018c0 4533d2                         xor        r10d, r10d
018c3 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
018cb e9efe8ffff                     jmp        0x7f4c1be8053f
018d0 4533d2                         xor        r10d, r10d
018d3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
018d8 e90fe9ffff                     jmp        0x7f4c1be8056c
018dd 4533d2                         xor        r10d, r10d
018e0 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
018e8 e92ae9ffff                     jmp        0x7f4c1be80597
018ed beccffffff                     mov        esi, 0xffffffcc
018f2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
018f7 4489542414                     mov        dword ptr [rsp + 0x14], r10d
018fc 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01901 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01906 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0190b 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01910 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01915 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0191a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01922 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01927 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0192f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01934 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0193c 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01941 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01946 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
0194b 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01953 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01958 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
01960 899c248c000000                 mov        dword ptr [rsp + 0x8c], ebx
01967 90                             nop        
01968 c5f877                         vzeroupper 
0196b e87060b5ff                     call       0x7f4c1b9d7d60
01970 0f1f8400681a0017               nop        dword ptr [rax + rax + 0x17001a68]
01978 beccffffff                     mov        esi, 0xffffffcc
0197d 488b2c24                       mov        rbp, qword ptr [rsp]
01981 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01986 4489542408                     mov        dword ptr [rsp + 8], r10d
0198b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01990 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01995 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0199a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0199f 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
019a4 4489542434                     mov        dword ptr [rsp + 0x34], r10d
019a9 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
019ae 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
019b3 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
019b8 4c89542440                     mov        qword ptr [rsp + 0x40], r10
019bd 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
019c2 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
019c7 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
019cf 4489542464                     mov        dword ptr [rsp + 0x64], r10d
019d4 4489742470                     mov        dword ptr [rsp + 0x70], r14d
019d9 666690                         nop        
019dc c5f877                         vzeroupper 
019df e8fc5fb5ff                     call       0x7f4c1b9d7d60
019e4 0f1f8400dc1a0018               nop        dword ptr [rax + rax + 0x18001adc]
019ec 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
019f4 4d3bd8                         cmp        r11, r8
019f7 bdffffffff                     mov        ebp, 0xffffffff
019fc 7c08                           jl         0x7f4c1be81d86
019fe 400f95c5                       setne      bpl
01a02 400fb6ed                       movzx      ebp, bpl
01a06 be45ffffff                     mov        esi, 0xffffff45
01a0b 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01a10 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01a15 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01a19 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01a1e 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01a23 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01a28 4489442464                     mov        dword ptr [rsp + 0x64], r8d
01a2d 89442468                       mov        dword ptr [rsp + 0x68], eax
01a31 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01a36 6690                           nop        
01a38 c5f877                         vzeroupper 
01a3b e8a05fb5ff                     call       0x7f4c1b9d7d60
01a40 0f1f8400381b0019               nop        dword ptr [rax + rax + 0x19001b38]
01a48 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
01a50 493beb                         cmp        rbp, r11
01a53 bdffffffff                     mov        ebp, 0xffffffff
01a58 7c08                           jl         0x7f4c1be81de2
01a5a 400f95c5                       setne      bpl
01a5e 400fb6ed                       movzx      ebp, bpl
01a62 be45ffffff                     mov        esi, 0xffffff45
01a67 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01a6c 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01a71 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01a75 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01a7a 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01a7f 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01a84 4489442464                     mov        dword ptr [rsp + 0x64], r8d
01a89 89442468                       mov        dword ptr [rsp + 0x68], eax
01a8d 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01a92 6690                           nop        
01a94 c5f877                         vzeroupper 
01a97 e8445fb5ff                     call       0x7f4c1b9d7d60
01a9c 0f1f8400941b001a               nop        dword ptr [rax + rax + 0x1a001b94]
01aa4 448bd7                         mov        r10d, edi
01aa7 448d0c39                       lea        r9d, [rcx + rdi]
01aab 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
01ab3 4f8b44080c                     mov        r8, qword ptr [r8 + r9 + 0xc]
01ab8 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
01ac0 4f8944110c                     mov        qword ptr [r9 + r10 + 0xc], r8
01ac5 448d4708                       lea        r8d, [rdi + 8]
01ac9 418bf8                         mov        edi, r8d
01acc 453bc3                         cmp        r8d, r11d
01acf 7cd3                           jl         0x7f4c1be81e24
01ad1 443bc3                         cmp        r8d, ebx
01ad4 0f8d89000000                   jge        0x7f4c1be81ee3
01ada 458bd8                         mov        r11d, r8d
01add 418bfb                         mov        edi, r11d
01ae0 448bd7                         mov        r10d, edi
01ae3 4963d2                         movsxd     rdx, r10d
01ae6 448bd7                         mov        r10d, edi
01ae9 448d0c39                       lea        r9d, [rcx + rdi]
01aed 458bc1                         mov        r8d, r9d
01af0 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01af8 4f8b5c0b0c                     mov        r11, qword ptr [r11 + r9 + 0xc]
01afd 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
01b05 4f895c110c                     mov        qword ptr [r9 + r10 + 0xc], r11
01b0a 4d63c0                         movsxd     r8, r8d
01b0d 4f8b540114                     mov        r10, qword ptr [r9 + r8 + 0x14]
01b12 4d89541114                     mov        qword ptr [r9 + rdx + 0x14], r10
01b17 4f8b54011c                     mov        r10, qword ptr [r9 + r8 + 0x1c]
01b1c 4d8954111c                     mov        qword ptr [r9 + rdx + 0x1c], r10
01b21 4f8b540124                     mov        r10, qword ptr [r9 + r8 + 0x24]
01b26 4d89541124                     mov        qword ptr [r9 + rdx + 0x24], r10
01b2b 4f8b54012c                     mov        r10, qword ptr [r9 + r8 + 0x2c]
01b30 4d8954112c                     mov        qword ptr [r9 + rdx + 0x2c], r10
01b35 4f8b540134                     mov        r10, qword ptr [r9 + r8 + 0x34]
01b3a 4d89541134                     mov        qword ptr [r9 + rdx + 0x34], r10
01b3f 4f8b54013c                     mov        r10, qword ptr [r9 + r8 + 0x3c]
01b44 4d8954113c                     mov        qword ptr [r9 + rdx + 0x3c], r10
01b49 4f8b540144                     mov        r10, qword ptr [r9 + r8 + 0x44]
01b4e 4d89541144                     mov        qword ptr [r9 + rdx + 0x44], r10
01b53 448d5740                       lea        r10d, [rdi + 0x40]
01b57 418bfa                         mov        edi, r10d
01b5a 443bd3                         cmp        r10d, ebx
01b5d 0f8c7dffffff                   jl         0x7f4c1be81e60
01b63 3bbc2498000000                 cmp        edi, dword ptr [rsp + 0x98]
01b6a 0f8de8f0ffff                   jge        0x7f4c1be80fd8
01b70 448bdf                         mov        r11d, edi
01b73 458bd3                         mov        r10d, r11d
01b76 6690                           nop        
01b78 468d1c11                       lea        r11d, [rcx + r10]
01b7c 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
01b84 4f8b5c180c                     mov        r11, qword ptr [r8 + r11 + 0xc]
01b89 458bc2                         mov        r8d, r10d
01b8c 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
01b94 4f895c010c                     mov        qword ptr [r9 + r8 + 0xc], r11
01b99 4183c208                       add        r10d, 8
01b9d 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
01ba5 7cd1                           jl         0x7f4c1be81ef8
01ba7 e9acf0ffff                     jmp        0x7f4c1be80fd8
01bac bee4ffffff                     mov        esi, 0xffffffe4
01bb1 488b2c24                       mov        rbp, qword ptr [rsp]
01bb5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01bba 44895c2408                     mov        dword ptr [rsp + 8], r11d
01bbf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01bc4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01bc9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01bce 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01bd3 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01bd7 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01bdc 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01be1 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01be6 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01beb 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
01bf3 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01bf8 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01bfd 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01c02 89442464                       mov        dword ptr [rsp + 0x64], eax
01c06 89942480000000                 mov        dword ptr [rsp + 0x80], edx
01c0d 666690                         nop        
01c10 c5f877                         vzeroupper 
01c13 e8c85db5ff                     call       0x7f4c1b9d7d60
01c18 0f1f8400101d001b               nop        dword ptr [rax + rax + 0x1b001d10]
01c20 be6effffff                     mov        esi, 0xffffff6e
01c25 488b2c24                       mov        rbp, qword ptr [rsp]
01c29 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01c2e 4489442408                     mov        dword ptr [rsp + 8], r8d
01c33 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01c38 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01c3d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01c42 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01c47 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01c4b 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01c50 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01c55 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01c5a 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
01c5f 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01c64 4489442460                     mov        dword ptr [rsp + 0x60], r8d
01c69 89442464                       mov        dword ptr [rsp + 0x64], eax
01c6d 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01c72 8954247c                       mov        dword ptr [rsp + 0x7c], edx
01c76 6690                           nop        
01c78 c5f877                         vzeroupper 
01c7b e8605db5ff                     call       0x7f4c1b9d7d60
01c80 0f1f8400781d001c               nop        dword ptr [rax + rax + 0x1c001d78]
01c88 be45ffffff                     mov        esi, 0xffffff45
01c8d 488b2c24                       mov        rbp, qword ptr [rsp]
01c91 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01c96 44895c2408                     mov        dword ptr [rsp + 8], r11d
01c9b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ca0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ca5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01caa 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01caf 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01cb3 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01cb8 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01cbd 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01cc2 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01cc7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01ccc 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01cd1 89442464                       mov        dword ptr [rsp + 0x64], eax
01cd5 89542478                       mov        dword ptr [rsp + 0x78], edx
01cd9 666690                         nop        
01cdc c5f877                         vzeroupper 
01cdf e8fc5cb5ff                     call       0x7f4c1b9d7d60
01ce4 0f1f8400dc1d001d               nop        dword ptr [rax + rax + 0x1d001ddc]
01cec be3dffffff                     mov        esi, 0xffffff3d
01cf1 488b2c24                       mov        rbp, qword ptr [rsp]
01cf5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01cfa 44895c2408                     mov        dword ptr [rsp + 8], r11d
01cff 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d04 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d09 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01d0e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01d13 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01d17 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01d1c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01d21 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01d26 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01d2b 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01d30 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01d35 89442464                       mov        dword ptr [rsp + 0x64], eax
01d39 89542478                       mov        dword ptr [rsp + 0x78], edx
01d3d 666690                         nop        
01d40 c5f877                         vzeroupper 
01d43 e8985cb5ff                     call       0x7f4c1b9d7d60
01d48 0f1f8400401e001e               nop        dword ptr [rax + rax + 0x1e001e40]
01d50 bee4ffffff                     mov        esi, 0xffffffe4
01d55 488b2c24                       mov        rbp, qword ptr [rsp]
01d59 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01d5e 44895c2408                     mov        dword ptr [rsp + 8], r11d
01d63 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d68 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d6d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01d72 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01d77 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01d7c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01d81 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01d86 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01d8b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01d90 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01d95 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01d9d 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01da2 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01daa 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01daf 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01db4 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01db9 4489b42484000000               mov        dword ptr [rsp + 0x84], r14d
01dc1 666690                         nop        
01dc4 c5f877                         vzeroupper 
01dc7 e8145cb5ff                     call       0x7f4c1b9d7d60
01dcc 0f1f8400c41e001f               nop        dword ptr [rax + rax + 0x1f001ec4]
01dd4 bee4ffffff                     mov        esi, 0xffffffe4
01dd9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01dde 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01de3 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01de8 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01ded 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01df2 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01df7 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01dfc 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e01 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01e09 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01e0e 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01e16 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01e1b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01e20 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01e25 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01e2a 6690                           nop        
01e2c c5f877                         vzeroupper 
01e2f e8ac5bb5ff                     call       0x7f4c1b9d7d60
01e34 0f1f84002c1f0020               nop        dword ptr [rax + rax + 0x20001f2c]
01e3c 418d6e01                       lea        ebp, [r14 + 1]
01e40 bee4ffffff                     mov        esi, 0xffffffe4
01e45 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01e4a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01e4f 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01e54 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01e59 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01e5e 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01e63 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01e68 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e6d 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01e75 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01e7a 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01e82 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01e87 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
01e8f 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01e94 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01e99 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01e9e 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01ea3 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
01eab 90                             nop        
01eac c5f877                         vzeroupper 
01eaf e82c5bb5ff                     call       0x7f4c1b9d7d60
01eb4 0f1f8400ac1f0021               nop        dword ptr [rax + rax + 0x21001fac]
01ebc bee4ffffff                     mov        esi, 0xffffffe4
01ec1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ec6 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01ecb 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01ed0 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01ed5 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01eda 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01edf 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01ee4 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ee9 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01ef1 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01ef6 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01efe 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01f03 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01f08 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01f0d 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01f12 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
01f1a 6690                           nop        
01f1c c5f877                         vzeroupper 
01f1f e8bc5ab5ff                     call       0x7f4c1b9d7d60
01f24 0f1f84001c200022               nop        dword ptr [rax + rax + 0x2200201c]
01f2c bee4ffffff                     mov        esi, 0xffffffe4
01f31 488b2c24                       mov        rbp, qword ptr [rsp]
01f35 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01f3a 4489542408                     mov        dword ptr [rsp + 8], r10d
01f3f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f44 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f49 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01f4e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01f53 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01f58 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01f5d 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01f62 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01f67 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01f6c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01f71 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01f76 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01f7b 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01f80 c5f877                         vzeroupper 
01f83 e8585ab5ff                     call       0x7f4c1b9d7d60
01f88 0f1f840080200023               nop        dword ptr [rax + rax + 0x23002080]
01f90 beccffffff                     mov        esi, 0xffffffcc
01f95 488b2c24                       mov        rbp, qword ptr [rsp]
01f99 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01f9e 44895c2408                     mov        dword ptr [rsp + 8], r11d
01fa3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01fa8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01fad 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01fb2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01fb7 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01fbc 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01fc1 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01fc6 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01fcb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01fd0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01fd5 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01fdd 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01fe2 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01fea 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01fef 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01ff4 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01ff9 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01ffe 6690                           nop        
02000 c5f877                         vzeroupper 
02003 e8d859b5ff                     call       0x7f4c1b9d7d60
02008 0f1f840000210024               nop        dword ptr [rax + rax + 0x24002100]
02010 be45ffffff                     mov        esi, 0xffffff45
02015 488b2c24                       mov        rbp, qword ptr [rsp]
02019 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0201e 4489542408                     mov        dword ptr [rsp + 8], r10d
02023 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02028 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0202d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02032 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02037 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0203c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02041 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02046 6690                           nop        
02048 c5f877                         vzeroupper 
0204b e89059b5ff                     call       0x7f4c1b9d7d60
02050 0f1f840048210025               nop        dword ptr [rax + rax + 0x25002148]
02058 be85ffffff                     mov        esi, 0xffffff85
0205d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02062 44891c24                       mov        dword ptr [rsp], r11d
02066 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0206b 4489542404                     mov        dword ptr [rsp + 4], r10d
02070 895c2408                       mov        dword ptr [rsp + 8], ebx
02074 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02079 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0207e 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
02083 4489742444                     mov        dword ptr [rsp + 0x44], r14d
02088 c5f877                         vzeroupper 
0208b e85059b5ff                     call       0x7f4c1b9d7d60
02090 0f1f840088210026               nop        dword ptr [rax + rax + 0x26002188]
02098 4533d2                         xor        r10d, r10d
0209b 4d8bc2                         mov        r8, r10
0209e eb08                           jmp        0x7f4c1be82428
020a0 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
020a8 be6effffff                     mov        esi, 0xffffff6e
020ad 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
020b2 4489542414                     mov        dword ptr [rsp + 0x14], r10d
020b7 895c2430                       mov        dword ptr [rsp + 0x30], ebx
020bb 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
020c0 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
020c5 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
020ca 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
020cf 4c89442470                     mov        qword ptr [rsp + 0x70], r8
020d4 c5f877                         vzeroupper 
020d7 e80459b5ff                     call       0x7f4c1b9d7d60
020dc 0f1f8400d4210027               nop        dword ptr [rax + rax + 0x270021d4]
020e4 beccffffff                     mov        esi, 0xffffffcc
020e9 488b2c24                       mov        rbp, qword ptr [rsp]
020ed 895c2414                       mov        dword ptr [rsp + 0x14], ebx
020f1 4489542420                     mov        dword ptr [rsp + 0x20], r10d
020f6 6690                           nop        
020f8 c5f877                         vzeroupper 
020fb e8e058b5ff                     call       0x7f4c1b9d7d60
02100 0f1f8400f8210028               nop        dword ptr [rax + rax + 0x280021f8]
02108 bee4ffffff                     mov        esi, 0xffffffe4
0210d 488b2c24                       mov        rbp, qword ptr [rsp]
02111 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02116 4489542408                     mov        dword ptr [rsp + 8], r10d
0211b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02120 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02125 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0212a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0212f 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02134 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02139 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0213e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02143 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0214b 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02150 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02155 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0215a 89442460                       mov        dword ptr [rsp + 0x60], eax
0215e 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02163 895c2470                       mov        dword ptr [rsp + 0x70], ebx
02167 90                             nop        
02168 c5f877                         vzeroupper 
0216b e87058b5ff                     call       0x7f4c1b9d7d60
02170 0f1f840068220029               nop        dword ptr [rax + rax + 0x29002268]
02178 bee4ffffff                     mov        esi, 0xffffffe4
0217d 488b2c24                       mov        rbp, qword ptr [rsp]
02181 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02186 44895c2408                     mov        dword ptr [rsp + 8], r11d
0218b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02190 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02195 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0219a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0219f 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
021a4 4489542434                     mov        dword ptr [rsp + 0x34], r10d
021a9 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
021ae 4c89542438                     mov        qword ptr [rsp + 0x38], r10
021b3 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
021bb 4489542444                     mov        dword ptr [rsp + 0x44], r10d
021c0 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
021c8 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
021cd 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
021d2 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
021d7 89442460                       mov        dword ptr [rsp + 0x60], eax
021db 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
021e3 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
021e8 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
021ed 4489442474                     mov        dword ptr [rsp + 0x74], r8d
021f2 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
021f9 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
02202 6690                           nop        
02204 c5f877                         vzeroupper 
02207 e8d457b5ff                     call       0x7f4c1b9d7d60
0220c 0f1f84000423002a               nop        dword ptr [rax + rax + 0x2a002304]
02214 beccffffff                     mov        esi, 0xffffffcc
02219 488b2c24                       mov        rbp, qword ptr [rsp]
0221d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02222 44895c2408                     mov        dword ptr [rsp + 8], r11d
02227 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0222c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02231 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02236 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0223b 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02240 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02245 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0224a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0224f 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02257 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0225c 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02264 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02269 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0226e 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02273 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
02277 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0227e 6690                           nop        
02280 c5f877                         vzeroupper 
02283 e85857b5ff                     call       0x7f4c1b9d7d60
02288 0f1f84008023002b               nop        dword ptr [rax + rax + 0x2b002380]
02290 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
02294 83c510                         add        ebp, 0x10
02297 be6effffff                     mov        esi, 0xffffff6e
0229c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
022a1 4489542414                     mov        dword ptr [rsp + 0x14], r10d
022a6 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
022ab 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
022b0 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
022b5 4c89542440                     mov        qword ptr [rsp + 0x40], r10
022ba 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
022bf 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
022c4 89442468                       mov        dword ptr [rsp + 0x68], eax
022c8 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
022cd 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
022d5 666690                         nop        
022d8 c5f877                         vzeroupper 
022db e80057b5ff                     call       0x7f4c1b9d7d60
022e0 0f1f8400d823002c               nop        dword ptr [rax + rax + 0x2c0023d8]
022e8 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
022ec 83c510                         add        ebp, 0x10
022ef be66ffffff                     mov        esi, 0xffffff66
022f4 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
022f9 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
022fe 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02303 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02308 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0230d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02312 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02317 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
0231c 89442468                       mov        dword ptr [rsp + 0x68], eax
02320 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02325 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
0232d 666690                         nop        
02330 c5f877                         vzeroupper 
02333 e8a856b5ff                     call       0x7f4c1b9d7d60
02338 0f1f84003024002d               nop        dword ptr [rax + rax + 0x2d002430]
02340 bee4ffffff                     mov        esi, 0xffffffe4
02345 488b2c24                       mov        rbp, qword ptr [rsp]
02349 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0234e 4489542408                     mov        dword ptr [rsp + 8], r10d
02353 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02358 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0235d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02362 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02367 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0236c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02371 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02376 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0237b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02380 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02385 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0238d 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02392 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02397 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0239c 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
023a4 c5f877                         vzeroupper 
023a7 e83456b5ff                     call       0x7f4c1b9d7d60
023ac 0f1f8400a424002e               nop        dword ptr [rax + rax + 0x2e0024a4]
023b4 bee4ffffff                     mov        esi, 0xffffffe4
023b9 488b2c24                       mov        rbp, qword ptr [rsp]
023bd 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
023c2 44895c2408                     mov        dword ptr [rsp + 8], r11d
023c7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
023cc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
023d1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
023d6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
023db 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
023e0 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
023e5 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
023ea 4489542434                     mov        dword ptr [rsp + 0x34], r10d
023ef 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
023f4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
023f9 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02401 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02406 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0240b 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02410 44894c2478                     mov        dword ptr [rsp + 0x78], r9d
02415 4c89842480000000               mov        qword ptr [rsp + 0x80], r8
0241d 666690                         nop        
02420 c5f877                         vzeroupper 
02423 e8b855b5ff                     call       0x7f4c1b9d7d60
02428 0f1f84002025002f               nop        dword ptr [rax + rax + 0x2f002520]
02430 be6effffff                     mov        esi, 0xffffff6e
02435 488b2c24                       mov        rbp, qword ptr [rsp]
02439 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0243e 44895c2408                     mov        dword ptr [rsp + 8], r11d
02443 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02448 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0244d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02452 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02457 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0245c 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02461 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02466 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0246b 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
02473 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02478 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
0247c 897c2470                       mov        dword ptr [rsp + 0x70], edi
02480 c5f877                         vzeroupper 
02483 e85855b5ff                     call       0x7f4c1b9d7d60
02488 0f1f840080250030               nop        dword ptr [rax + rax + 0x30002580]
02490 be66ffffff                     mov        esi, 0xffffff66
02495 488b2c24                       mov        rbp, qword ptr [rsp]
02499 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0249e 44895c2408                     mov        dword ptr [rsp + 8], r11d
024a3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
024a8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
024ad 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
024b2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
024b7 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
024bc 4489542434                     mov        dword ptr [rsp + 0x34], r10d
024c1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
024c6 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
024cb 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
024d3 458bd3                         mov        r10d, r11d
024d6 4489542464                     mov        dword ptr [rsp + 0x64], r10d
024db 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
024df 897c2470                       mov        dword ptr [rsp + 0x70], edi
024e3 90                             nop        
024e4 c5f877                         vzeroupper 
024e7 e8f454b5ff                     call       0x7f4c1b9d7d60
024ec 0f1f8400e4250031               nop        dword ptr [rax + rax + 0x310025e4]
024f4 488bf0                         mov        rsi, rax
024f7 eb0d                           jmp        0x7f4c1be82886
024f9 488bf0                         mov        rsi, rax
024fc eb08                           jmp        0x7f4c1be82886
024fe 488bf0                         mov        rsi, rax
02501 eb03                           jmp        0x7f4c1be82886
02503 488bf0                         mov        rsi, rax
02506 c5f877                         vzeroupper 
02509 4881c4f0000000                 add        rsp, 0xf0
02510 5d                             pop        rbp
02511 e94a7db5ff                     jmp        0x7f4c1b9da5e0
02516 bef6ffffff                     mov        esi, 0xfffffff6
0251b 90                             nop        
0251c c5f877                         vzeroupper 
0251f e8bc54b5ff                     call       0x7f4c1b9d7d60
02524 0f1f84001c260032               nop        dword ptr [rax + rax + 0x3200261c]
0252c 49ba7d14e81b4c7f0000           movabs     r10, 0x7f4c1be8147d
02536 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0253d e91e06a9ff                     jmp        0x7f4c1b912ee0
02542 e8d9d1a7ff                     call       0x7f4c1b8ffaa0
02547 e9e2daffff                     jmp        0x7f4c1be803ae
0254c f4                             hlt        
0254d f4                             hlt        
0254e f4                             hlt        
0254f f4                             hlt        
